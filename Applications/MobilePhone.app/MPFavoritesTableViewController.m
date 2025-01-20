@interface MPFavoritesTableViewController
+ ($1FF454C5B48E436092D281DABF654916)badge;
+ (id)defaultPNGName;
+ (id)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4 inArray:(id)a5;
+ (id)tabBarIconName;
+ (int)tabViewType;
- (BOOL)isInitialTab;
- (BOOL)shouldNavigationControllerPresentLargeTitles;
- (BOOL)shouldShowAddButtonItem;
- (BOOL)shouldSnapshot;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)viewHadAppeared;
- (CNAvatarViewControllerSettings)avatarViewControllerSettings;
- (CNKCNSharedProfileOnboardingController)onboardingController;
- (CNUIFavoritesEntryPicker)favoritesEntryPicker;
- (MPFavoritesTableViewController)init;
- (MPFavoritesTableViewController)initWithCoder:(id)a3;
- (MPFavoritesTableViewController)initWithFavoritesController:(id)a3;
- (MPFavoritesTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MPFavoritesTableViewController)initWithStyle:(int64_t)a3;
- (MPFavoritesTableViewController)initWithStyle:(int64_t)a3 favoritesController:(id)a4;
- (NSArray)favoritesEntries;
- (NSCache)contactCache;
- (OS_dispatch_queue)contactsQueue;
- (TPFavoritesController)favoritesController;
- (TUFeatureFlags)featureFlags;
- (UIBarButtonItem)addButtonItem;
- (id)contactCacheKeyForFavoritesEntry:(id)a3;
- (id)favoritesEntryAtIndex:(int64_t)a3;
- (id)favoritesEntryPickerContactForContact:(id)a3 contactStore:(id)a4;
- (id)tabBarSystemItemTitle;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tabBarSystemItem;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)tabBarSystemItemTag;
- (void)addButtonAction:(id)a3;
- (void)commonInit;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dealloc;
- (void)favoritesEntryPicker:(id)a3 didPickEntry:(id)a4;
- (void)handleTPFavoritesControllerFavoritesEntriesDidChangeNotification:(id)a3;
- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3;
- (void)handleUIContentSizeCategoryDidChangeNotification:(id)a3;
- (void)makeUIForDefaultPNG;
- (void)postCNContactsClientDidDisplayFavoritesNotification;
- (void)presentContactPickerViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)refreshView;
- (void)reloadDataIfNeeded;
- (void)reloadDataSource;
- (void)removeFavoriteEntryAtIndexPath:(id)a3;
- (void)setAddButtonItem:(id)a3;
- (void)setAvatarViewControllerSettings:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFavoritesEntries:(id)a3;
- (void)setFavoritesEntryPicker:(id)a3;
- (void)setIsInitialTab:(BOOL)a3;
- (void)setNavigationItemsForEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setOnboardingController:(id)a3;
- (void)setShouldShowAddButtonItem:(BOOL)a3;
- (void)setShouldShowAddButtonItem:(BOOL)a3 animated:(BOOL)a4;
- (void)setViewHadAppeared:(BOOL)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tipKitActionFavoriteAdded;
- (void)tipKitLogAnalyticsAddFavoritesEvent;
- (void)tipKitSetNumberOfFavorites:(int64_t)a3;
- (void)tipKitStartObservation;
- (void)updateTableViewCell:(id)a3 withContactUsingFavoritesEntry:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MPFavoritesTableViewController

- (void)commonInit
{
  v5.receiver = self;
  v5.super_class = (Class)MPFavoritesTableViewController;
  [(PHTableViewController *)&v5 commonInit];
  v3 = (NSCache *)objc_alloc_init((Class)NSCache);
  contactCache = self->_contactCache;
  self->_contactCache = v3;

  self->_shouldShowAddButtonItem = 0;
}

- (void)viewDidLoad
{
  v36.receiver = self;
  v36.super_class = (Class)MPFavoritesTableViewController;
  [(PHTableViewController *)&v36 viewDidLoad];
  v3 = [(MPFavoritesTableViewController *)self tableView];
  [v3 setRowHeight:UITableViewAutomaticDimension];

  v4 = [(MPFavoritesTableViewController *)self tableView];
  [v4 setSeparatorInsetReference:1];

  objc_super v5 = +[UIApplication sharedApplication];
  v6 = [v5 preferredContentSizeCategory];
  +[PHContactTableViewCell separatorInsetForContentSizeCategory:v6];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(MPFavoritesTableViewController *)self tableView];
  [v15 setSeparatorInset:v8, v10, v12, v14];

  +[PHContactTableViewCell tableViewContentInset];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(MPFavoritesTableViewController *)self tableView];
  [v24 setContentInset:v17, v19, v21, v23];

  v25 = [(MPFavoritesTableViewController *)self tableView];
  uint64_t v26 = objc_opt_class();
  v27 = +[PHTableViewCell reuseIdentifier];
  [v25 registerClass:v26 forCellReuseIdentifier:v27];

  v28 = +[NSBundle mainBundle];
  v29 = [v28 localizedStringForKey:@"FAVORITES_CONTENT_UNAVAILABLE_VIEW_TITLE" value:&stru_100285990 table:@"Favorites"];
  [(PHTableViewController *)self setContentUnavailableViewTitle:v29];

  v30 = +[NSBundle mainBundle];
  v31 = [v30 localizedStringForKey:@"FAVORITES_TITLE" value:&stru_100285990 table:@"Favorites"];
  [(MPFavoritesTableViewController *)self setTitle:v31];

  if (+[UIApplication shouldMakeUIForDefaultPNG])[(MPFavoritesTableViewController *)self makeUIForDefaultPNG]; {
  v32 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
  }
  featureFlags = self->_featureFlags;
  self->_featureFlags = v32;

  v34 = objc_opt_new();
  v35 = [(MPFavoritesTableViewController *)self tabBarItem];
  [v35 setStandardAppearance:v34];
}

- (int64_t)tabBarSystemItem
{
  return 1;
}

- (id)tabBarSystemItemTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"FAVORITES_TITLE" value:&stru_100285990 table:@"Favorites"];

  return v3;
}

- (unint64_t)tabBarSystemItemTag
{
  return 1;
}

- (MPFavoritesTableViewController)initWithStyle:(int64_t)a3 favoritesController:(id)a4
{
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPFavoritesTableViewController;
  double v8 = [(PHTableViewController *)&v14 initWithStyle:a3];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_favoritesController, a4);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mobilephone.favorites", 0);
    contactsQueue = v9->_contactsQueue;
    v9->_contactsQueue = (OS_dispatch_queue *)v10;

    double v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v9 selector:"handleTPFavoritesControllerFavoritesEntriesDidChangeNotification:" name:TPFavoritesControllerFavoritesEntriesDidChangeNotification object:v9->_favoritesController];
  }
  return v9;
}

- (MPFavoritesTableViewController)initWithFavoritesController:(id)a3
{
  return [(MPFavoritesTableViewController *)self initWithStyle:0 favoritesController:a3];
}

- (MPFavoritesTableViewController)init
{
  return 0;
}

- (MPFavoritesTableViewController)initWithCoder:(id)a3
{
  return 0;
}

- (MPFavoritesTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (MPFavoritesTableViewController)initWithStyle:(int64_t)a3
{
  return 0;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPFavoritesTableViewController;
  [(PHTableViewController *)&v4 dealloc];
}

- (CNAvatarViewControllerSettings)avatarViewControllerSettings
{
  avatarViewControllerSettings = self->_avatarViewControllerSettings;
  if (!avatarViewControllerSettings)
  {
    objc_super v4 = [(MPFavoritesTableViewController *)self favoritesController];
    objc_super v5 = [v4 contactStore];
    v6 = +[CNAvatarViewControllerSettings settingsWithContactStore:v5 threeDTouchEnabled:1];
    id v7 = self->_avatarViewControllerSettings;
    self->_avatarViewControllerSettings = v6;

    avatarViewControllerSettings = self->_avatarViewControllerSettings;
  }

  return avatarViewControllerSettings;
}

- (void)viewWillAppear:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)MPFavoritesTableViewController;
  [(PHTableViewController *)&v18 viewWillAppear:a3];
  id v4 = objc_alloc_init((Class)TUFeatureFlags);
  unsigned int v5 = [v4 nameAndPhotoEnabledC3];

  if (v5)
  {
    v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Going to present CNKCNSharedProfileOnboardingController on launch", buf, 2u);
    }

    id v7 = [(MPFavoritesTableViewController *)self onboardingController];

    if (!v7)
    {
      double v8 = objc_opt_new();
      [(MPFavoritesTableViewController *)self setOnboardingController:v8];
    }
    double v9 = [(MPFavoritesTableViewController *)self onboardingController];
    dispatch_queue_t v10 = +[TUCallCenter sharedInstance];
    double v11 = [v10 contactStore];
    [v9 presentOnboardingControllerOnLaunchIfNeededFrom:self withContactStore:v11];
  }
  double v12 = [(MPFavoritesTableViewController *)self favoritesEntries];

  if (!v12)
  {
    double v13 = [(MPFavoritesTableViewController *)self favoritesController];
    objc_super v14 = [v13 favoritesEntries];

    if (v14)
    {
      [(PHTableViewController *)self setNeedsReloadData:1];
      if ([(MPFavoritesTableViewController *)self isInitialTab])
      {
        [(MPFavoritesTableViewController *)self reloadDataIfNeeded];
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = __49__MPFavoritesTableViewController_viewWillAppear___block_invoke;
        block[3] = &unk_10027C670;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
    else
    {
      v15 = [(MPFavoritesTableViewController *)self favoritesController];
      [v15 fetchIfNeeded];
    }
  }
  [(MPFavoritesTableViewController *)self postCNContactsClientDidDisplayFavoritesNotification];
  [(MPFavoritesTableViewController *)self tipKitStartObservation];
  [(MPFavoritesTableViewController *)self setViewHadAppeared:1];
}

id __49__MPFavoritesTableViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPFavoritesTableViewController;
  [(MPFavoritesTableViewController *)&v8 viewDidAppear:a3];
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MPFavoritesTableViewController viewDidAppear:", v7, 2u);
  }

  unsigned int v5 = createPHPhoneTabBarControllerTabViewDidAppearNotificationInfo(1, self);
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 postNotificationName:@"PHPhoneTabBarControllerTabViewDidAppearNotification" object:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MPFavoritesTableViewController;
  -[PHTableViewController viewWillDisappear:](&v5, "viewWillDisappear:");
  if ([(MPFavoritesTableViewController *)self isEditing]) {
    [(MPFavoritesTableViewController *)self setEditing:0 animated:v3];
  }
  [(MPFavoritesTableViewController *)self tipKitStopObservation];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  +[CATransaction begin];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __54__MPFavoritesTableViewController_setEditing_animated___block_invoke;
  v10[3] = &unk_10027C670;
  v10[4] = self;
  +[CATransaction setCompletionBlock:v10];
  v9.receiver = self;
  v9.super_class = (Class)MPFavoritesTableViewController;
  [(MPFavoritesTableViewController *)&v9 setEditing:v5 animated:v4];
  [(MPFavoritesTableViewController *)self setNavigationItemsForEditing:v5 animated:v4];
  +[CATransaction commit];
  id v7 = [(MPFavoritesTableViewController *)self tableView];
  [v7 beginUpdates];

  objc_super v8 = [(MPFavoritesTableViewController *)self tableView];
  [v8 endUpdates];
}

id __54__MPFavoritesTableViewController_setEditing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadDataIfNeeded];
}

- (void)reloadDataIfNeeded
{
  if ([(PHTableViewController *)self needsReloadData])
  {
    BOOL v3 = [(MPFavoritesTableViewController *)self tableView];
    unsigned int v4 = [(PHTableViewController *)self tableViewCanPerformReloadData:v3];

    if (v4)
    {
      [(MPFavoritesTableViewController *)self reloadDataSource];
      BOOL v5 = [(MPFavoritesTableViewController *)self favoritesEntries];

      if (v5)
      {
        [(MPFavoritesTableViewController *)self refreshView];
        [(PHTableViewController *)self setNeedsReloadData:0];
        [(PHTableViewController *)self updateTitleDisplayModeIfNeeded];
      }
    }
  }
}

- (BOOL)shouldNavigationControllerPresentLargeTitles
{
  BOOL v3 = [(MPFavoritesTableViewController *)self favoritesEntries];
  if (v3)
  {
    unsigned int v4 = [(MPFavoritesTableViewController *)self favoritesEntries];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ ($1FF454C5B48E436092D281DABF654916)badge
{
  BOOL v2 = 1;
  unint64_t v3 = 0;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

+ (int)tabViewType
{
  return 1;
}

+ (id)defaultPNGName
{
  return @"Default";
}

+ (id)tabBarIconName
{
  BOOL v2 = +[NSBundle mainBundle];
  unint64_t v3 = [v2 localizedStringForKey:@"FAVORITES_TITLE" value:&stru_100285990 table:@"Favorites"];

  return v3;
}

- (BOOL)shouldSnapshot
{
  if ([(MPFavoritesTableViewController *)self isEditing]) {
    return 0;
  }
  unsigned int v4 = [(MPFavoritesTableViewController *)self navigationController];
  BOOL v5 = [v4 visibleViewController];
  BOOL v3 = v5 == self;

  return v3;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = +[PHTableViewCell reuseIdentifier];
  objc_super v9 = [v6 dequeueReusableCellWithIdentifier:v8];

  dispatch_queue_t v10 = [(MPFavoritesTableViewController *)self featureFlags];
  [v9 setTapTargets:[v10 favoritesCallTapTargetsEnabled]];

  double v11 = +[NSUUID UUID];
  [v9 setUUID:v11];

  double v12 = -[MPFavoritesTableViewController favoritesEntryAtIndex:](self, "favoritesEntryAtIndex:", [v7 row]);
  if (v12)
  {
    id v13 = [v9 avatarViewController];
    if (!v13)
    {
      id v14 = objc_alloc((Class)CNAvatarViewController);
      v15 = [(MPFavoritesTableViewController *)self avatarViewControllerSettings];
      id v13 = [v14 initWithSettings:v15];

      [v13 setObjectViewControllerDelegate:self];
      [v9 setAvatarViewController:v13];
      double v16 = [v9 avatarViewController];
      double v17 = [v16 view];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v19 = [v9 avatarViewController];
        double v20 = [v19 view];

        [v20 setAllowStaleRendering:1];
      }
    }
    double v21 = [v12 actionType];
    [v9 setActionType:v21];

    double v22 = [v12 name];
    double v23 = [v9 titleLabel];
    [v23 setText:v22];

    v24 = [(MPFavoritesTableViewController *)self favoritesController];
    v25 = [v24 transportNameForFavoritesEntry:v12];
    uint64_t v26 = [v9 subtitleLabel];
    [v26 setText:v25];

    v27 = [v12 contactProperty];
    v28 = [v27 contact];

    if (v28)
    {
      v29 = [v12 contactProperty];
      v30 = [v29 contact];
      v45 = v30;
      v31 = +[NSArray arrayWithObjects:&v45 count:1];
      v32 = [v9 avatarViewController];
      [v32 setContacts:v31];
    }
    else
    {
      v33 = [v9 avatarViewController];
      [v33 setContacts:&__NSArray0__struct];
    }
    v34 = [(MPFavoritesTableViewController *)self featureFlags];
    unsigned int v35 = [v34 favoritesCallTapTargetsEnabled];

    if (v35 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, self);
      v37 = _NSConcreteStackBlock;
      uint64_t v38 = 3221225472;
      v39 = __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v40 = &unk_10027D448;
      objc_copyWeak(&v43, &location);
      id v41 = v7;
      id v42 = v6;
      [v9 setActionButtonTappedHandler:&v37];

      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
    -[MPFavoritesTableViewController updateTableViewCell:withContactUsingFavoritesEntry:](self, "updateTableViewCell:withContactUsingFavoritesEntry:", v9, v12, v37, v38, v39, v40);
  }

  return v9;
}

void __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = a1[4];
    if (v3)
    {
      if ([v3 row] != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        unsigned int v4 = [WeakRetained favoritesEntryAtIndex:[a1[4] row]];
        if (v4)
        {
          v7[0] = _NSConcreteStackBlock;
          v7[1] = 3221225472;
          v7[2] = __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
          v7[3] = &unk_10027D420;
          objc_super v8 = a1[5];
          id v9 = a1[4];
          id v10 = v4;
          [v10 performActionWithCompletion:v7];

          BOOL v5 = v8;
        }
        else
        {
          [a1[5] deselectRowAtIndexPath:a1[4] animated:0];
          BOOL v5 = PHDefaultLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            id v6 = a1[4];
            *(_DWORD *)buf = 138412290;
            id v12 = v6;
            _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Could not retrieve a favorite at index path (%@).", buf, 0xCu);
          }
        }
      }
    }
  }
}

void __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke_3;
  v5[3] = &unk_10027C940;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  if (v3)
  {
    unsigned int v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2_cold_1();
    }
  }
}

id __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:0];
}

- (void)updateTableViewCell:(id)a3 withContactUsingFavoritesEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 UUID];
  objc_initWeak(&location, self);
  id v9 = [(MPFavoritesTableViewController *)self contactsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __85__MPFavoritesTableViewController_updateTableViewCell_withContactUsingFavoritesEntry___block_invoke;
  block[3] = &unk_10027D470;
  objc_copyWeak(&v17, &location);
  id v14 = v7;
  id v15 = v6;
  id v16 = v8;
  id v10 = v8;
  id v11 = v6;
  id v12 = v7;
  dispatch_async(v9, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __85__MPFavoritesTableViewController_updateTableViewCell_withContactUsingFavoritesEntry___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v4 = [WeakRetained favoritesController];
    id v5 = [v4 contactForFavoritesEntry:*(void *)(a1 + 32)];

    if (!v5) {
      id v5 = objc_alloc_init((Class)CNContact);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __85__MPFavoritesTableViewController_updateTableViewCell_withContactUsingFavoritesEntry___block_invoke_2;
    block[3] = &unk_10027CBE0;
    id v8 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v10 = v5;
    id v6 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void __85__MPFavoritesTableViewController_updateTableViewCell_withContactUsingFavoritesEntry___block_invoke_2(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) UUID];
  unsigned int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    unsigned int v4 = [*(id *)(a1 + 32) avatarViewController];
    id v5 = [v4 view];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [*(id *)(a1 + 32) avatarViewController];
      id v8 = [v7 view];

      id v9 = [*(id *)(a1 + 48) identifier];
      [v8 setContextToken:v9];
    }
    uint64_t v12 = *(void *)(a1 + 48);
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    id v11 = [*(id *)(a1 + 32) avatarViewController];
    [v11 setContacts:v10];
  }
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1) {
    [(MPFavoritesTableViewController *)self removeFavoriteEntryAtIndexPath:a5];
  }
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  if (a4 && a5)
  {
    id v7 = a5;
    id v8 = [a4 row];
    id v9 = [v7 row];

    id v10 = [(MPFavoritesTableViewController *)self favoritesEntries];
    id v13 = +[MPFavoritesTableViewController moveObjectAtIndex:v8 toIndex:v9 inArray:v10];

    id v11 = v13;
    if (v13)
    {
      [(MPFavoritesTableViewController *)self setFavoritesEntries:v13];
      uint64_t v12 = [(MPFavoritesTableViewController *)self favoritesController];
      [v12 moveEntryAtIndex:v8 toIndex:v9];

      id v11 = v13;
    }
  }
}

+ (id)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4 inArray:(id)a5
{
  id v7 = a5;
  if ((unint64_t)[v7 count] <= a3)
  {
    id v9 = 0;
  }
  else
  {
    id v8 = [v7 count];
    id v9 = 0;
    if (a3 != a4 && (unint64_t)v8 > a4)
    {
      id v9 = [v7 mutableCopy];
      id v10 = [v9 objectAtIndex:a3];
      [v9 removeObjectAtIndex:a3];
      if ((unint64_t)[v9 count] <= a4) {
        [v9 addObject:v10];
      }
      else {
        [v9 insertObject:v10 atIndex:a4];
      }
    }
  }

  return v9;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unsigned int v4 = [(MPFavoritesTableViewController *)self favoritesEntries];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (void)tableView:(id)a3 prefetchRowsAtIndexPaths:(id)a4
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a4;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = -[MPFavoritesTableViewController favoritesEntryAtIndex:](self, "favoritesEntryAtIndex:", [v9 row]);
        id v11 = v10;
        if (v10)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = __69__MPFavoritesTableViewController_tableView_prefetchRowsAtIndexPaths___block_invoke;
          v17[3] = &unk_10027C940;
          v17[4] = self;
          id v18 = v10;
          uint64_t v12 = +[NSBlockOperation blockOperationWithBlock:v17];
          id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 hash]);
          id v14 = +[NSString stringWithFormat:@"%@", v13];
          [v12 setName:v14];

          id v15 = [(PHTableViewController *)self dataSourcePrefetchingOperationQueue];
          [v15 addOperation:v12];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }
}

void __69__MPFavoritesTableViewController_tableView_prefetchRowsAtIndexPaths___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) favoritesController];
  id v2 = [v5 contactForFavoritesEntry:*(void *)(a1 + 40)];
  id v3 = [v5 transportNameForFavoritesEntry:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 40) name];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  v16.receiver = self;
  v16.super_class = (Class)MPFavoritesTableViewController;
  id v8 = a5;
  [(PHTableViewController *)&v16 tableView:a3 willDisplayCell:a4 forRowAtIndexPath:v8];
  id v9 = [v8 row];

  id v10 = [(MPFavoritesTableViewController *)self favoritesEntryAtIndex:v9];
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 contactProperty];
    id v13 = [v12 contact];

    if (v13)
    {
      id v14 = [(MPFavoritesTableViewController *)self contactCache];
      id v15 = [(MPFavoritesTableViewController *)self contactCacheKeyForFavoritesEntry:v11];
      [v14 setObject:v13 forKey:v15];
    }
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)MPFavoritesTableViewController;
  id v8 = a5;
  [(PHTableViewController *)&v13 tableView:a3 didEndDisplayingCell:a4 forRowAtIndexPath:v8];
  id v9 = [v8 row];

  id v10 = [(MPFavoritesTableViewController *)self favoritesEntryAtIndex:v9];
  if (v10)
  {
    id v11 = [(MPFavoritesTableViewController *)self contactCache];
    uint64_t v12 = [(MPFavoritesTableViewController *)self contactCacheKeyForFavoritesEntry:v10];
    [v11 removeObjectForKey:v12];
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5 = [self favoritesEntryAtIndex:[a4 row]];
  if (v5)
  {
    id v6 = [(MPFavoritesTableViewController *)self favoritesController];
    uint64_t v7 = +[CNContactViewController descriptorForRequiredKeys];
    id v15 = v7;
    id v8 = +[NSArray arrayWithObjects:&v15 count:1];
    id v9 = [v6 contactForFavoritesEntry:v5 keyDescriptors:v8];

    if (v9)
    {
      id v10 = +[CNContactViewController viewControllerForContact:v9];
      id v11 = v10;
      if (v10)
      {
        [v10 setAllowsActions:1];
        [v11 setActions:[v11 actions] | 0x80];
        uint64_t v12 = [(MPFavoritesTableViewController *)self avatarViewControllerSettings];
        objc_super v13 = [v12 contactStore];
        [v11 setContactStore:v13];

        id v14 = [(MPFavoritesTableViewController *)self navigationController];
        [v14 pushViewController:v11 animated:1];
      }
    }
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPFavoritesTableViewController *)self featureFlags];
  unsigned int v9 = [v8 favoritesCallTapTargetsEnabled];

  if (v9)
  {
    id v10 = -[MPFavoritesTableViewController favoritesEntryAtIndex:](self, "favoritesEntryAtIndex:", [v7 row]);
    if (v10)
    {
      id v11 = [(MPFavoritesTableViewController *)self favoritesController];
      uint64_t v12 = +[CNContactViewController descriptorForRequiredKeys];
      v27 = v12;
      objc_super v13 = +[NSArray arrayWithObjects:&v27 count:1];
      id v14 = [v11 contactForFavoritesEntry:v10 keyDescriptors:v13];

      if (v14)
      {
        id v15 = +[CNContactViewController viewControllerForContact:v14];
        objc_super v16 = v15;
        if (v15)
        {
          [v15 setAllowsActions:1];
          [v16 setActions:[v16 actions] | 0x80];
          id v17 = [(MPFavoritesTableViewController *)self avatarViewControllerSettings];
          id v18 = [v17 contactStore];
          [v16 setContactStore:v18];

          long long v19 = [(MPFavoritesTableViewController *)self navigationController];
          [v19 pushViewController:v16 animated:1];
        }
      }
    }
    [v6 deselectRowAtIndexPath:v7 animated:0];
LABEL_16:

    goto LABEL_17;
  }
  if (v7 && [v7 row] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = -[MPFavoritesTableViewController favoritesEntryAtIndex:](self, "favoritesEntryAtIndex:", [v7 row]);
    if (v10)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __68__MPFavoritesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke;
      v21[3] = &unk_10027D420;
      long long v22 = v6;
      id v23 = v7;
      id v24 = v10;
      [v24 performActionWithCompletion:v21];

      long long v20 = v22;
    }
    else
    {
      [v6 deselectRowAtIndexPath:v7 animated:0];
      long long v20 = PHDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[WARN] Could not retrieve a favorite at index path (%@).", buf, 0xCu);
      }
    }

    goto LABEL_16;
  }
LABEL_17:
}

void __68__MPFavoritesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __68__MPFavoritesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_10027C940;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  if (v3)
  {
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2_cold_1();
    }
  }
}

id __68__MPFavoritesTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:0];
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (UIBarButtonItem)addButtonItem
{
  addButtonItem = self->_addButtonItem;
  if (!addButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:4 target:self action:"addButtonAction:"];
    id v5 = self->_addButtonItem;
    self->_addButtonItem = v4;

    addButtonItem = self->_addButtonItem;
  }

  return addButtonItem;
}

- (void)presentContactPickerViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  id v6 = [(MPFavoritesTableViewController *)self navigationController];
  if (v6)
  {
    id v7 = v6;
    id v8 = [v6 presentedViewController];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;

        id v7 = v9;
      }
    }
    id v10 = objc_alloc_init((Class)CNContactPickerViewController);
    [v10 setAllowsEditing:0];
    [v10 setAutocloses:0];
    [v10 setDelegate:self];
    [v10 setHidesSearchableSources:1];
    [v10 setMode:2];
    [v10 setOnlyRealContacts:1];
    id v11 = +[NSPredicate predicateWithFormat:@"emailAddresses.@count > 0 OR instantMessageAddresses.@count > 0 OR phoneNumbers.@count > 0 OR socialProfiles.@count > 0"];
    [v10 setPredicateForEnablingContact:v11];

    uint64_t v12 = +[NSBundle mainBundle];
    objc_super v13 = [v12 localizedStringForKey:@"FAVORITES_CONTACT_PICKER_VIEW_CONTROLLER_PROMPT" value:&stru_100285990 table:@"Favorites"];
    [v10 setPrompt:v13];

    [v10 setDefinesPresentationContext:0];
    [v7 presentViewController:v10 animated:v4 completion:v14];
  }
}

- (void)setShouldShowAddButtonItem:(BOOL)a3
{
}

- (void)setShouldShowAddButtonItem:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shouldShowAddButtonItem != a3)
  {
    BOOL v4 = a4;
    self->_shouldShowAddButtonItem = a3;
    id v6 = [(MPFavoritesTableViewController *)self isEditing];
    [(MPFavoritesTableViewController *)self setNavigationItemsForEditing:v6 animated:v4];
  }
}

- (void)addButtonAction:(id)a3
{
  [(MPFavoritesTableViewController *)self tipKitStopObservation];

  [(MPFavoritesTableViewController *)self presentContactPickerViewControllerAnimated:1 completion:0];
}

- (id)contactCacheKeyForFavoritesEntry:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 contactProperty];
  id v5 = [v4 contact];
  id v6 = [v5 identifier];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 hash]);
    id v8 = +[NSString stringWithFormat:@"%@", v9];
  }

  return v8;
}

- (id)favoritesEntryAtIndex:(int64_t)a3
{
  BOOL v4 = [(MPFavoritesTableViewController *)self favoritesEntries];
  id v5 = v4;
  if (a3 < 0 || (unint64_t)[v4 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndexedSubscript:a3];
  }

  return v6;
}

- (id)favoritesEntryPickerContactForContact:(id)a3 contactStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[CNUIFavoritesEntryPicker descriptorForRequiredKeys];
  id v23 = v7;
  id v8 = +[NSArray arrayWithObjects:&v23 count:1];

  if ([v5 areKeysAvailable:v8])
  {
    id v9 = v5;
  }
  else
  {
    id v10 = +[NSMutableArray arrayWithArray:v8];
    id v11 = [v5 availableKeyDescriptor];
    if (v11) {
      [v10 addObject:v11];
    }
    uint64_t v12 = [v5 identifier];
    id v16 = 0;
    id v9 = [v6 unifiedContactWithIdentifier:v12 keysToFetch:v10 error:&v16];
    id v13 = v16;

    if (!v9)
    {
      id v14 = PHDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v18 = v5;
        __int16 v19 = 2112;
        id v20 = v6;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Could not retrieve a compatible contact using contact (%@) and contact store (%@) due to an error (%@).", buf, 0x20u);
      }
    }
  }

  return v9;
}

- (void)postCNContactsClientDidDisplayFavoritesNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.contacts.clientDidDisplayFavorites", 0, 0, 0);
}

- (void)removeFavoriteEntryAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(MPFavoritesTableViewController *)self tableView];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __65__MPFavoritesTableViewController_removeFavoriteEntryAtIndexPath___block_invoke;
  v9[3] = &unk_10027C940;
  v9[4] = self;
  id v10 = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __65__MPFavoritesTableViewController_removeFavoriteEntryAtIndexPath___block_invoke_2;
  v7[3] = &unk_10027C8F0;
  void v7[4] = self;
  id v8 = v10;
  id v6 = v10;
  [v5 performBatchUpdates:v9 completion:v7];
}

void __65__MPFavoritesTableViewController_removeFavoriteEntryAtIndexPath___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoritesEntries];
  id v3 = [v2 mutableCopy];

  [v3 removeObjectAtIndex:[*(id *)(a1 + 40) row]];
  [*(id *)(a1 + 32) setFavoritesEntries:v3];
  id v4 = [*(id *)(a1 + 32) tableView];
  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v4 deleteRowsAtIndexPaths:v5 withRowAnimation:100];
}

void __65__MPFavoritesTableViewController_removeFavoriteEntryAtIndexPath___block_invoke_2(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The delete animations were interrupted before they could complete successfully.", v8, 2u);
    }
  }
  id v4 = [*(id *)(a1 + 32) favoritesEntries];
  id v5 = [v4 count];

  if (!v5)
  {
    [*(id *)(a1 + 32) setEditing:0 animated:1];
    [*(id *)(a1 + 32) setContentUnavailable:1 animated:1];
  }
  uint64_t v6 = [*(id *)(a1 + 32) favoritesController];
  id v7 = +[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", [*(id *)(a1 + 40) row]);
  [v6 removeEntriesAtIndexes:v7];
}

- (void)contactPickerDidCancel:(id)a3
{
  id v4 = [(MPFavoritesTableViewController *)self navigationController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __57__MPFavoritesTableViewController_contactPickerDidCancel___block_invoke;
  v5[3] = &unk_10027C670;
  void v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

id __57__MPFavoritesTableViewController_contactPickerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFavoritesEntryPicker:0];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  [v14 invalidateSelectionAnimated:1];
  id v7 = [(MPFavoritesTableViewController *)self favoritesController];
  id v8 = [v7 contactStore];
  id v9 = [(MPFavoritesTableViewController *)self favoritesEntryPickerContactForContact:v6 contactStore:v8];

  if (v9)
  {
    id v10 = [objc_alloc((Class)CNUIFavoritesEntryPicker) initWithContact:v6];
    [(MPFavoritesTableViewController *)self setFavoritesEntryPicker:v10];

    id v11 = [(MPFavoritesTableViewController *)self favoritesEntryPicker];
    [v11 setDelegate:self];

    uint64_t v12 = [(MPFavoritesTableViewController *)self favoritesEntryPicker];
    id v13 = [v12 viewController];
    [v14 presentViewController:v13 animated:1 completion:0];
  }
}

- (void)favoritesEntryPicker:(id)a3 didPickEntry:(id)a4
{
  id v5 = a4;
  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Favorite was picked: %@", buf, 0xCu);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = __68__MPFavoritesTableViewController_favoritesEntryPicker_didPickEntry___block_invoke;
  v17[3] = &unk_10027C670;
  v17[4] = self;
  id v7 = objc_retainBlock(v17);
  id v8 = [(MPFavoritesTableViewController *)self favoritesEntries];
  unsigned __int8 v9 = [v8 containsObject:v5];

  if (v9)
  {
    id v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not adding favorites entry as it exists already: %@", buf, 0xCu);
    }

    ((void (*)(void *))v7[2])(v7);
  }
  else
  {
    if ([(PHTableViewController *)self contentUnavailable])
    {
      [(PHTableViewController *)self setContentUnavailable:0 animated:0];
      [(MPFavoritesTableViewController *)self setNavigationItemsForEditing:[(MPFavoritesTableViewController *)self isEditing] animated:0];
    }
    id v11 = [(MPFavoritesTableViewController *)self tableView];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __68__MPFavoritesTableViewController_favoritesEntryPicker_didPickEntry___block_invoke_3;
    v15[3] = &unk_10027C940;
    v15[4] = self;
    id v16 = v5;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = __68__MPFavoritesTableViewController_favoritesEntryPicker_didPickEntry___block_invoke_4;
    v12[3] = &unk_10027D498;
    v12[4] = self;
    id v13 = v16;
    id v14 = v7;
    [v11 performBatchUpdates:v15 completion:v12];
  }
}

id __68__MPFavoritesTableViewController_favoritesEntryPicker_didPickEntry___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __68__MPFavoritesTableViewController_favoritesEntryPicker_didPickEntry___block_invoke_2;
  v3[3] = &unk_10027C670;
  v3[4] = v1;
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

id __68__MPFavoritesTableViewController_favoritesEntryPicker_didPickEntry___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFavoritesEntryPicker:0];
}

void __68__MPFavoritesTableViewController_favoritesEntryPicker_didPickEntry___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) favoritesEntries];
  id v3 = [v2 count];

  id v4 = +[NSIndexPath indexPathForItem:v3 inSection:0];
  id v5 = [*(id *)(a1 + 32) favoritesEntries];
  id v6 = [v5 arrayByAddingObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setFavoritesEntries:v6];

  id v7 = [*(id *)(a1 + 32) tableView];
  unsigned __int8 v9 = v4;
  id v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v7 insertRowsAtIndexPaths:v8 withRowAnimation:100];
}

uint64_t __68__MPFavoritesTableViewController_favoritesEntryPicker_didPickEntry___block_invoke_4(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The insert animations were interrupted before they could complete successfully.", v6, 2u);
    }
  }
  [*(id *)(a1 + 32) tipKitActionFavoriteAdded];
  id v4 = [*(id *)(a1 + 32) favoritesController];
  [v4 addEntry:*(void *)(a1 + 40)];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)handleTPFavoritesControllerFavoritesEntriesDidChangeNotification:(id)a3
{
  id v4 = [a3 object];
  id v5 = v4;
  if (v4)
  {
    -[MPFavoritesTableViewController setShouldShowAddButtonItem:](self, "setShouldShowAddButtonItem:", [v4 canAddEntry]);
    id v6 = [v5 favoritesEntries];
    id v7 = [v6 count];
    id v8 = [(MPFavoritesTableViewController *)self favoritesEntries];
    id v9 = [v8 count];

    if (v7 == v9)
    {
      v31 = v5;
      id v10 = [(MPFavoritesTableViewController *)self tableView];
      id v11 = [v10 indexPathsForVisibleRows];

      id v32 = objc_alloc_init((Class)NSMutableArray);
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id obj = v11;
      id v12 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v34 = *(void *)v37;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v37 != v34) {
              objc_enumerationMutation(obj);
            }
            id v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v16 = [v6 objectAtIndexedSubscript:[v15 row]];
            id v17 = -[MPFavoritesTableViewController favoritesEntryAtIndex:](self, "favoritesEntryAtIndex:", [v15 row]);
            unsigned int v18 = [v17 isEqual:v16];

            if (!v18)
            {
              [(PHTableViewController *)self setNeedsReloadData:1];

              goto LABEL_18;
            }
            id v19 = v6;
            id v20 = [(MPFavoritesTableViewController *)self contactCacheKeyForFavoritesEntry:v16];
            __int16 v21 = [v16 contactProperty];
            id v22 = [v21 contact];

            id v23 = [(MPFavoritesTableViewController *)self contactCache];
            id v24 = [v23 objectForKey:v20];

            if (v22 && ([v22 isEqualIgnoringIdentifiers:v24] & 1) == 0)
            {
              [v32 addObject:v15];
              v25 = [(MPFavoritesTableViewController *)self contactCache];
              [v25 setObject:v22 forKey:v20];
            }
            id v6 = v19;
          }
          id v13 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
LABEL_18:

      id v5 = v31;
      if (!-[PHTableViewController needsReloadData](self, "needsReloadData") && [v32 count])
      {
        v29 = PHDefaultLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Update Favorite Cells", buf, 2u);
        }

        v30 = [(MPFavoritesTableViewController *)self tableView];
        [v30 reconfigureRowsAtIndexPaths:v32];
      }
    }
    else
    {
      [(PHTableViewController *)self setNeedsReloadData:[(MPFavoritesTableViewController *)self viewHadAppeared]];
      id v26 = [v6 count];
      v27 = [(MPFavoritesTableViewController *)self favoritesEntries];
      id v28 = [v27 count];

      if (v26 > v28) {
        [(MPFavoritesTableViewController *)self tipKitLogAnalyticsAddFavoritesEvent];
      }
    }
    [(MPFavoritesTableViewController *)self reloadDataIfNeeded];
  }
}

- (void)handleUIApplicationWillEnterForegroundNotification:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 2112;
    id v11 = v4;
    id v6 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", buf, 0x16u);
  }
  v7.receiver = self;
  v7.super_class = (Class)MPFavoritesTableViewController;
  [(PHTableViewController *)&v7 handleUIApplicationWillEnterForegroundNotification:v4];
  [(MPFavoritesTableViewController *)self postCNContactsClientDidDisplayFavoritesNotification];
}

- (void)handleUIContentSizeCategoryDidChangeNotification:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MPFavoritesTableViewController;
  id v4 = a3;
  [(PHTableViewController *)&v12 handleUIContentSizeCategoryDidChangeNotification:v4];
  id v5 = [v4 userInfo];

  id v6 = [v5 objectForKeyedSubscript:UIContentSizeCategoryNewValueKey];

  objc_super v7 = [(MPFavoritesTableViewController *)self tableView];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __83__MPFavoritesTableViewController_handleUIContentSizeCategoryDidChangeNotification___block_invoke_2;
  v9[3] = &unk_10027C8F0;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  [v7 performBatchUpdates:&__block_literal_global_10 completion:v9];
}

void __83__MPFavoritesTableViewController_handleUIContentSizeCategoryDidChangeNotification___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    +[PHContactTableViewCell separatorInsetForContentSizeCategory:](MPFavoritesTableViewCell, "separatorInsetForContentSizeCategory:");
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    id v10 = [*(id *)(a1 + 40) tableView];
    [v10 setSeparatorInset:v3, v5, v7, v9];
  }
}

- (void)makeUIForDefaultPNG
{
  v6.receiver = self;
  v6.super_class = (Class)MPFavoritesTableViewController;
  [(PHTableViewController *)&v6 makeUIForDefaultPNG];
  double v3 = [(MPFavoritesTableViewController *)self favoritesEntries];
  id v4 = [v3 count];

  if (!v4)
  {
    double v5 = [(PHTableViewController *)self contentUnavailableView];
    [v5 setTitle:0];
  }
}

- (void)reloadDataSource
{
  double v3 = [(MPFavoritesTableViewController *)self favoritesController];
  id v4 = [v3 favoritesEntries];
  id v5 = [v4 mutableCopy];
  [(MPFavoritesTableViewController *)self setFavoritesEntries:v5];

  objc_super v6 = [(MPFavoritesTableViewController *)self favoritesController];
  -[MPFavoritesTableViewController setShouldShowAddButtonItem:](self, "setShouldShowAddButtonItem:", [v6 canAddEntry]);

  id v7 = [(MPFavoritesTableViewController *)self favoritesEntries];
  -[MPFavoritesTableViewController tipKitSetNumberOfFavorites:](self, "tipKitSetNumberOfFavorites:", [v7 count]);
}

- (void)refreshView
{
  id v3 = [(MPFavoritesTableViewController *)self view];
  id v4 = v3;
  if (v3)
  {
    id v7 = v3;
    id v3 = [(MPFavoritesTableViewController *)self isViewLoaded];
    id v4 = v7;
    if (v3)
    {
      id v5 = [(MPFavoritesTableViewController *)self favoritesEntries];
      -[PHTableViewController setContentUnavailable:animated:](self, "setContentUnavailable:animated:", [v5 count] == 0, 0);
      [(MPFavoritesTableViewController *)self setNavigationItemsForEditing:[(MPFavoritesTableViewController *)self isEditing] animated:0];
      objc_super v6 = [(MPFavoritesTableViewController *)self tableView];
      [v6 reloadData];

      id v4 = v7;
    }
  }

  _objc_release_x1(v3, v4);
}

- (void)setNavigationItemsForEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MPFavoritesTableViewController *)self navigationItem];
  id v7 = v6;
  if (v6)
  {
    id v13 = v6;
    id v6 = [(MPFavoritesTableViewController *)self isViewLoaded];
    id v7 = v13;
    if (v6)
    {
      double v8 = [(MPFavoritesTableViewController *)self favoritesEntries];
      if (([(MPFavoritesTableViewController *)self isEditing] & 1) != 0
        || ![(MPFavoritesTableViewController *)self shouldShowAddButtonItem])
      {
        double v9 = 0;
      }
      else
      {
        double v9 = [(MPFavoritesTableViewController *)self addButtonItem];
      }
      if ([v8 count])
      {
        id v10 = [(MPFavoritesTableViewController *)self editButtonItem];
      }
      else
      {
        id v10 = 0;
      }
      id v11 = [v13 leftBarButtonItem];

      if (v11 != v10) {
        [v13 setLeftBarButtonItem:v10 animated:v4];
      }
      objc_super v12 = [v13 rightBarButtonItem];

      if (v12 != v9) {
        [v13 setRightBarButtonItem:v9 animated:v4];
      }

      id v7 = v13;
    }
  }

  _objc_release_x1(v6, v7);
}

- (BOOL)isInitialTab
{
  return self->_isInitialTab;
}

- (void)setIsInitialTab:(BOOL)a3
{
  self->_isInitialTab = a3;
}

- (void)setAvatarViewControllerSettings:(id)a3
{
}

- (TPFavoritesController)favoritesController
{
  return self->_favoritesController;
}

- (NSCache)contactCache
{
  return self->_contactCache;
}

- (NSArray)favoritesEntries
{
  return self->_favoritesEntries;
}

- (void)setFavoritesEntries:(id)a3
{
}

- (BOOL)shouldShowAddButtonItem
{
  return self->_shouldShowAddButtonItem;
}

- (void)setAddButtonItem:(id)a3
{
}

- (CNUIFavoritesEntryPicker)favoritesEntryPicker
{
  return self->_favoritesEntryPicker;
}

- (void)setFavoritesEntryPicker:(id)a3
{
}

- (OS_dispatch_queue)contactsQueue
{
  return self->_contactsQueue;
}

- (CNKCNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)setOnboardingController:(id)a3
{
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (BOOL)viewHadAppeared
{
  return self->_viewHadAppeared;
}

- (void)setViewHadAppeared:(BOOL)a3
{
  self->_viewHadAppeared = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_contactsQueue, 0);
  objc_storeStrong((id *)&self->_favoritesEntryPicker, 0);
  objc_storeStrong((id *)&self->_addButtonItem, 0);
  objc_storeStrong((id *)&self->_favoritesEntries, 0);
  objc_storeStrong((id *)&self->_contactCache, 0);
  objc_storeStrong((id *)&self->_favoritesController, 0);

  objc_storeStrong((id *)&self->_avatarViewControllerSettings, 0);
}

- (void)tipKitStartObservation
{
  type metadata accessor for TPTipsHelper();
  id v3 = self;
  static TPTipsHelper.taskQueue.getter();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  dispatch thunk of TaskQueue.async(_:)();

  swift_release();
  swift_release();
  swift_release_n();
}

- (void)tipKitLogAnalyticsAddFavoritesEvent
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  id v7 = self;
  uint64_t v8 = static MainActor.shared.getter();
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = &protocol witness table for MainActor;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v5, (uint64_t)&closure #1 in MPFavoritesTableViewController.tipKitLogAnalyticsAddFavoritesEvent()partial apply, v9);

  swift_release();
}

- (void)tipKitActionFavoriteAdded
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Tips.Event<Tips.EmptyDonation>);
  uint64_t v3 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  id v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Tips.InvalidationReason();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for FavoritesTip();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v13 = (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = self;
  FavoritesTip.init()();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Tips.InvalidationReason.actionPerformed(_:), v6);
  lazy protocol witness table accessor for type FavoritesTip and conformance FavoritesTip();
  Tip.invalidate(reason:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  static FavoritesTip.favoriteAddedEvent.getter();
  Tips.Event.sendDonation<>(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v16);
}

- (void)tipKitSetNumberOfFavorites:(int64_t)a3
{
}

void __66__MPFavoritesTableViewController_tableView_cellForRowAtIndexPath___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_1((void *)&_mh_execute_header, v0, v1, "Could not open the specified favorite (%@) due to an error (%@).");
}

@end