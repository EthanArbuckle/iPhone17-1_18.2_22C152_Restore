@interface MPRecentsTableViewController
+ (BOOL)requiresNavigationControllerContainer;
+ (id)tabBarIconName;
+ (int)tabViewType;
+ (int64_t)tabBarSystemItem;
- (BOOL)canDisplaySearchBarPopover;
- (BOOL)canPerformTableViewUpdates;
- (BOOL)contentUnavailable;
- (BOOL)dataSourceNeedsReload;
- (BOOL)didEnterSuspended;
- (BOOL)isRecentCallContactInFavorites:(id)a3;
- (BOOL)pendingSearchControllerActivation;
- (BOOL)shouldNavigationControllerPresentLargeTitles;
- (BOOL)shouldSnapshot;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (BOOL)tapTargets;
- (CNAvatarCardController)avatarCardController;
- (CNAvatarViewControllerSettings)avatarViewControllerSettings;
- (CNSharedProfileOnboardingController)onboardingController;
- (Class)tableViewCellClass;
- (CoreTelephonyClient)ctClient;
- (ILClassificationUIExtensionHostViewController)classificationViewController;
- (MPCNMeCardSharingSettingsViewControllerObserver)meCardSharingSettingsViewControllerObserver;
- (MPRecentsCellConfigurator)cellConfigurator;
- (MPRecentsDetailPresenter)recentsDetailPresenter;
- (MPRecentsTableViewController)init;
- (MPRecentsTableViewController)initWithCoder:(id)a3;
- (MPRecentsTableViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MPRecentsTableViewController)initWithRecentsController:(id)a3;
- (MPRecentsTableViewControllerDelegate)delegate;
- (MPRecentsUnknownCallersViewController)unknownCallersViewController;
- (MPSearchViewController)searchResultsController;
- (NSArray)indexPathsForMissedCalls;
- (NSArray)indexPathsForNormalCalls;
- (NSMutableArray)recentCalls;
- (NSOperationQueue)dataSourcePrefetchingOperationQueue;
- (NSString)contentUnavailableViewTitle;
- (NSString)pendingSearchText;
- (NSString)searchText;
- (PHRecentsController)recentsController;
- (TUFeatureFlags)featureFlags;
- (UIBarButtonItem)clearButtonItem;
- (UIBarButtonItem)doneButtonItem;
- (UISearchController)searchController;
- (UISegmentedControl)tableViewDisplayModeSegmentedControl;
- (UITableView)tableView;
- (UIViewController)alertPresentingViewController;
- (_TtC11MobilePhone19RecentsCallServices)callServices;
- (_TtC11MobilePhone22CallReportingViewModel)callReportingViewModel;
- (_TtC11MobilePhone25FaceTimeSpamReportManager)spamReport;
- (_UIContentUnavailableView)contentUnavailableView;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (id)_indexPathsForCallsWithStatus:(unsigned int)a3 includeUnknown:(BOOL)a4;
- (id)callsWithValidHandles:(id)a3;
- (id)contactViewControllerForRecentCall:(id)a3;
- (id)contactViewControllerForRecentCall:(id)a3 contact:(id)a4;
- (id)contactsForRecentCall:(id)a3;
- (id)contactsForRecentCallForAvatar:(id)a3;
- (id)fetchCarrierBundleValue:(id)a3 context:(id)a4;
- (id)fetchSubscriptionsInUse;
- (id)indexPathsForRecentCalls;
- (id)makePersonalNicknameMenuView;
- (id)multipleContactsBlockViewControllerForRecentCall:(id)a3;
- (id)multipleContactsViewControllerForRecentCall:(id)a3;
- (id)nicknameEditButtonItem;
- (id)personalizedCarrierString;
- (id)recentCallAtTableViewIndex:(int64_t)a3;
- (id)recentsCellConfigurator;
- (id)reportSwipeActionForCall:(id)a3;
- (id)searchControllersForDifferentSections;
- (id)searchResultsControllerProvider;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (id)unknownContactForRecentCall:(id)a3;
- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4;
- (int64_t)configureCardController:(id)a3 presentationResultForIndex:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)rowCountForCurrentTableMode;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewDisplayMode;
- (void)_showCarrierVoiceCallReportAlertForCall:(id)a3;
- (void)animateSearchResultsController:(BOOL)a3;
- (void)appResumed:(id)a3;
- (void)appSuspended:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)clearButtonAction:(id)a3;
- (void)commonInit;
- (void)configureSearch;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactViewController:(id)a3 didExecuteBlockAndReportContactAction:(id)a4;
- (void)contentSizeCategoryDidChange;
- (void)controller:(id)a3 didCompleteClassificationRequest:(id)a4 withResponse:(id)a5;
- (void)dealloc;
- (void)didPresentSearchController:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)didSelectSuggestedSearchWithToken:(id)a3;
- (void)didTapContinueWithViewController:(id)a3;
- (void)dismissUnknownCallersViewController:(id)a3;
- (void)donateTipsEventSignalsForRecentCall:(id)a3;
- (void)doneButtonAction:(id)a3;
- (void)handleShowDetailsURLForUniqueID:(id)a3;
- (void)handleShowDetailsURLForUniqueID:(id)a3 withContinuingSearchText:(id)a4;
- (void)handleUIAccessibilityDarkerSystemColorsStatusDidChangeNotification:(id)a3;
- (void)handleURL:(id)a3;
- (void)loadView;
- (void)makeUIForDefaultPNG;
- (void)performBatchUpdates:(id)a3 completion:(id)a4;
- (void)phoneApplicationDidChangeTabBarSelection:(id)a3;
- (void)placeCallWithRecentCall:(id)a3;
- (void)presentBlockAllAlertFor:(id)a3;
- (void)presentBlockUnknownParticipantsFor:(id)a3;
- (void)presentCNSharedProfileOnboardingController;
- (void)presentFaceTimeSpamReportAlertFor:(id)a3;
- (void)presentFaceTimeSpamReportAndBlockAlertFor:(id)a3;
- (void)presentGroupFaceTimeSpamReportAndBlockAlertFor:(id)a3;
- (void)presentOnboardingViewController;
- (void)presentUnknownCallersViewController;
- (void)pushVoicemailMessageDetailsViewControllerForMessage:(id)a3;
- (void)recentsController:(id)a3 didChangeCalls:(id)a4;
- (void)recentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4;
- (void)recentsController:(id)a3 didCompleteFetchingCalls:(id)a4;
- (void)recentsController:(id)a3 didUpdateCalls:(id)a4;
- (void)recentsControllerDidChangeMessages:(id)a3;
- (void)reconfiguringCellsForCalls:(id)a3;
- (void)refreshView;
- (void)reloadDataSource;
- (void)reloadDataSourceForCalls:(id)a3;
- (void)reloadTableView;
- (void)removeAllRecentCalls;
- (void)removeRecentCallsAtIndexPaths:(id)a3;
- (void)savePreferences;
- (void)searchControllerBeginDragging;
- (void)selectedSegmentDidChangeForSender:(id)a3;
- (void)setAlertPresentingViewController:(id)a3;
- (void)setAvatarCardController:(id)a3;
- (void)setAvatarViewControllerSettings:(id)a3;
- (void)setCallServices:(id)a3;
- (void)setCellConfigurator:(id)a3;
- (void)setClassificationViewController:(id)a3;
- (void)setClearButtonItem:(id)a3;
- (void)setContentUnavailable:(BOOL)a3;
- (void)setContentUnavailable:(BOOL)a3 animated:(BOOL)a4;
- (void)setContentUnavailableView:(id)a3;
- (void)setContentUnavailableViewTitle:(id)a3;
- (void)setCtClient:(id)a3;
- (void)setDataSourceNeedsReload:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidEnterSuspended:(BOOL)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setIndexPathsForMissedCalls:(id)a3;
- (void)setIndexPathsForNormalCalls:(id)a3;
- (void)setMeCardSharingSettingsViewControllerObserver:(id)a3;
- (void)setNavigationItemsForEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setOnboardingController:(id)a3;
- (void)setPendingSearchControllerActivation:(BOOL)a3;
- (void)setPendingSearchText:(id)a3;
- (void)setRecentCalls:(id)a3;
- (void)setRecentsDetailPresenter:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchResultsController:(id)a3;
- (void)setSearchText:(id)a3;
- (void)setSpamReport:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTableViewDisplayMode:(int64_t)a3;
- (void)setTableViewDisplayModeSegmentedControl:(id)a3;
- (void)setUnknownCallersViewController:(id)a3;
- (void)showRecentCallDetailsViewControllerForRecentCall:(id)a3;
- (void)showRecentCallDetailsViewControllerForRecentCall:(id)a3 animated:(BOOL)a4;
- (void)showRecentCallDetailsViewControllerForRecentCall:(id)a3 navigationController:(id)a4 animated:(BOOL)a5;
- (void)showReportingExtensionForCall:(id)a3;
- (void)startSearchingForText:(id)a3;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)tipKitStartObservation;
- (void)tipKitStopObservation;
- (void)traitCollectionDidChange:(id)a3;
- (void)unknownCallersViewControllerDidRequestEnable:(id)a3;
- (void)updateLargeTitleInsets;
- (void)updateNavigationItemsForEditing;
- (void)updateSearchBarLayoutMarginsPresentingSearchResults:(BOOL)a3;
- (void)updateTabBarItem;
- (void)updateTabBarItemWithCount:(unint64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)voicemailMessageDetailViewController:(id)a3 destructiveActionPerformedForMessage:(id)a4 completionBlock:(id)a5;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation MPRecentsTableViewController

BOOL __54__MPRecentsTableViewController_callsWithValidHandles___block_invoke(id a1, CHRecentCall *a2, NSDictionary *a3)
{
  v3 = a2;
  v4 = [(CHRecentCall *)v3 serviceProvider];
  unsigned __int8 v5 = [v4 isEqualToString:kCHServiceProviderTelephony];

  if (v5)
  {
    BOOL v6 = 1;
  }
  else
  {
    v7 = [(CHRecentCall *)v3 validRemoteParticipantHandles];
    BOOL v6 = [v7 count] != 0;
  }
  return v6;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

void __46__MPRecentsTableViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 flashScrollIndicators];

  id v3 = [*(id *)(a1 + 32) searchResultsController];
  [v3 prewarmSearchControllersAfterSeconds:1.0];
}

- (void)updateTabBarItem
{
  id v3 = [(MPRecentsTableViewController *)self recentsController];
  -[MPRecentsTableViewController updateTabBarItemWithCount:](self, "updateTabBarItemWithCount:", [v3 unreadCallCount]);
}

- (void)updateTabBarItemWithCount:(unint64_t)a3
{
  if (a3)
  {
    v4 = +[NSString stringWithFormat:@"%lu", a3];
  }
  else
  {
    v4 = 0;
  }
  unsigned __int8 v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting tab bar item badge value to %@", buf, 0xCu);
  }

  BOOL v6 = [(MPRecentsTableViewController *)self tabBarItem];
  [v6 setBadgeValue:v4];
}

- (void)setNavigationItemsForEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = [(MPRecentsTableViewController *)self navigationItem];
  v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412290;
    v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Current nav item: %@", (uint8_t *)&v27, 0xCu);
  }

  v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(MPRecentsTableViewController *)self featureFlags];
    v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 nameAndPhotoEnabled]);
    v11 = +[NSNumber numberWithInteger:[(MPRecentsTableViewController *)self rowCountForCurrentTableMode]];
    v12 = +[NSNumber numberWithBool:[(MPRecentsTableViewController *)self isEditing]];
    int v27 = 138412802;
    v28 = v10;
    __int16 v29 = 2112;
    v30 = v11;
    __int16 v31 = 2112;
    v32 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating nav item buttons based on SNAP: %@, rowcount: %@, editing: %@", (uint8_t *)&v27, 0x20u);
  }
  if (v6 && [(MPRecentsTableViewController *)self isViewLoaded])
  {
    if ([(MPRecentsTableViewController *)self isEditing])
    {
      v13 = [(MPRecentsTableViewController *)self featureFlags];
      unsigned int v14 = [v13 nameAndPhotoEnabled];

      uint64_t v15 = [(MPRecentsTableViewController *)self clearButtonItem];
      if (v14) {
        v16 = 0;
      }
      else {
        v16 = (void *)v15;
      }
      if (v14) {
        v17 = (void *)v15;
      }
      else {
        v17 = 0;
      }
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    uint64_t v18 = [(MPRecentsTableViewController *)self rowCountForCurrentTableMode];
    v19 = [(MPRecentsTableViewController *)self featureFlags];
    unsigned int v20 = [v19 nameAndPhotoEnabled];

    if (v18 < 1)
    {
      if (!v20)
      {
LABEL_24:
        v24 = [v6 leftBarButtonItem];

        if (v24 != v16) {
          [v6 setLeftBarButtonItem:v16 animated:v4];
        }
        v25 = [v6 rightBarButtonItem];

        if (v25 != v17) {
          [v6 setRightBarButtonItem:v17 animated:v4];
        }
        v26 = PHDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          int v27 = 138412546;
          v28 = v16;
          __int16 v29 = 2112;
          v30 = v17;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Set nav item buttons to leftBarButtonItem: %@, rightBarButtonItem: %@", (uint8_t *)&v27, 0x16u);
        }

        goto LABEL_31;
      }
    }
    else
    {
      if (!v20)
      {
        uint64_t v23 = [(MPRecentsTableViewController *)self nicknameEditButtonItem];
        v22 = v17;
        v17 = (void *)v23;
        goto LABEL_23;
      }
      if ([(MPRecentsTableViewController *)self isEditing])
      {
        uint64_t v21 = [(MPRecentsTableViewController *)self doneButtonItem];
LABEL_21:
        v22 = v16;
        v16 = (void *)v21;
LABEL_23:

        goto LABEL_24;
      }
    }
    uint64_t v21 = [(MPRecentsTableViewController *)self nicknameEditButtonItem];
    goto LABEL_21;
  }
LABEL_31:
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(MPRecentsTableViewController *)self rowCountForCurrentTableMode];
  unsigned __int8 v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MPRecentsTableViewController tableView:numberOfRowsInSection:](v4, v5);
  }

  return v4;
}

void __59__MPRecentsTableViewController_reconfiguringCellsForCalls___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = +[NSSet setWithArray:*(void *)(a1 + 32)];
    uint64_t v4 = [*(id *)(a1 + 40) tableView];
    unsigned __int8 v5 = [v4 indexPathsForVisibleRows];

    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v19;
      *(void *)&long long v9 = 138412290;
      long long v17 = v9;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          unsigned int v14 = [*(id *)(a1 + 40) recentCallAtTableViewIndex:[v13 row:v17 v18]];
          if ([v3 containsObject:v14])
          {
            uint64_t v15 = PHDefaultLog();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              uint64_t v23 = v13;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Reconfiguring cell for : %@", buf, 0xCu);
            }

            [v6 addObject:v13];
          }
        }
        id v10 = [v7 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v10);
    }

    v16 = [*(id *)(a1 + 40) tableView];
    [v16 reconfigureRowsAtIndexPaths:v6];
  }
}

- (int64_t)rowCountForCurrentTableMode
{
  id v3 = [(MPRecentsTableViewController *)self recentCalls];
  id v4 = [v3 count];

  if ((id)[(MPRecentsTableViewController *)self tableViewDisplayMode] == (id)1)
  {
    unsigned __int8 v5 = [(MPRecentsTableViewController *)self indexPathsForMissedCalls];
    id v4 = [v5 count];
  }
  return (int64_t)v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v9 = [v8 useSharedRecentsViewModel];

  if (v9)
  {
    id v10 = -[MPRecentsTableViewController recentCallAtTableViewIndex:](self, "recentCallAtTableViewIndex:", [v7 row]);
    uint64_t v11 = [(MPRecentsTableViewController *)self cellConfigurator];
    v12 = [v11 cellForRowAtIndexPath:v7 withRecentCall:v10];

    goto LABEL_23;
  }
  v12 = [v6 dequeueReusableCellWithIdentifier:@"MPRecentsTableViewCell" forIndexPath:v7];
  id v10 = -[MPRecentsTableViewController recentCallAtTableViewIndex:](self, "recentCallAtTableViewIndex:", [v7 row]);
  v13 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v14 = [v13 phoneRecentsAvatarsEnabled];

  if (v14)
  {
    uint64_t v15 = [v12 avatarViewController];

    if (!v15)
    {
      id v16 = objc_alloc((Class)CNAvatarViewController);
      long long v17 = [(MPRecentsTableViewController *)self avatarViewControllerSettings];
      id v18 = [v16 initWithSettings:v17];

      [v18 setObjectViewControllerDelegate:self];
      [v12 setAvatarViewController:v18];
      long long v19 = [v12 avatarViewController];
      long long v20 = [v19 view];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v22 = [v12 avatarViewController];
        uint64_t v23 = [v22 view];

        [v23 setAllowStaleRendering:1];
      }
    }
    v24 = [(MPRecentsTableViewController *)self contactsForRecentCallForAvatar:v10];
    v25 = [v12 avatarViewController];
    [v25 setContacts:v24];

    v26 = [v12 avatarViewController];
    int v27 = [v26 view];
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    if (v28)
    {
      __int16 v29 = [v12 avatarViewController];
      v30 = [v29 view];

      __int16 v31 = [v10 uniqueId];
      [v30 setContextToken:v31];
    }
  }
  if (v10)
  {
    v32 = [(MPRecentsTableViewController *)self recentsController];
    v33 = [v32 itemForRecentCall:v10 presentationStyle:0];

    if (objc_opt_respondsToSelector()) {
      [v12 setTapTargets:[self tapTargets]];
    }
    [v12 configureWithRecentsItem:v33 recentCall:v10];
    if ([(MPRecentsTableViewController *)self tapTargets])
    {
      v34 = [v10 validRemoteParticipantHandles];
      BOOL v35 = [v34 count] != 0;

      [v12 enableCallButton:v35];
      if (objc_opt_respondsToSelector())
      {
        objc_initWeak(&location, self);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = __64__MPRecentsTableViewController_tableView_cellForRowAtIndexPath___block_invoke;
        v43[3] = &unk_10027C8A0;
        objc_copyWeak(&v45, &location);
        id v44 = v10;
        [v12 setCallButtonTappedHandler:v43];

        objc_destroyWeak(&v45);
        objc_destroyWeak(&location);
      }
    }
    v36 = [(MPRecentsTableViewController *)self featureFlags];
    unsigned int v37 = [v36 increaseCallHistoryEnabled];

    if (!v37) {
      goto LABEL_22;
    }
    v38 = [v7 row];
    int64_t v39 = [(MPRecentsTableViewController *)self tableViewDisplayMode];
    if (v39 == 1)
    {
      v40 = [(MPRecentsTableViewController *)self recentsController];
      v41 = [(MPRecentsTableViewController *)self indexPathsForMissedCalls];
      [v40 loadOlderCallsIfNecessaryForRemainingRowCount:[v41 count] - v38];
    }
    else
    {
      if (v39)
      {
LABEL_22:

        goto LABEL_23;
      }
      v40 = [(MPRecentsTableViewController *)self recentsController];
      [v40 continuousScrollingReachedIndexPath:v38];
    }

    goto LABEL_22;
  }
LABEL_23:

  return v12;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (PHRecentsController)recentsController
{
  return self->_recentsController;
}

- (BOOL)tapTargets
{
  v2 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned __int8 v3 = [v2 recentsCallTapTargetsEnabled];

  return v3;
}

- (id)recentCallAtTableViewIndex:(int64_t)a3
{
  int64_t v5 = [(MPRecentsTableViewController *)self tableViewDisplayMode];
  if (v5 == 1)
  {
    if (a3 < 0
      || ([(MPRecentsTableViewController *)self indexPathsForMissedCalls],
          id v6 = objc_claimAutoreleasedReturnValue(),
          id v7 = [v6 count],
          v6,
          (unint64_t)v7 <= a3))
    {
      a3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      id v8 = [(MPRecentsTableViewController *)self indexPathsForMissedCalls];
      unsigned int v9 = [v8 objectAtIndex:a3];

      a3 = (int64_t)[v9 row];
    }
  }
  else if (v5)
  {
    a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v10 = [(MPRecentsTableViewController *)self recentCalls];
  id v11 = [v10 count];

  v12 = 0;
  if ((a3 & 0x8000000000000000) == 0 && a3 < (uint64_t)v11)
  {
    v13 = [(MPRecentsTableViewController *)self recentCalls];
    v12 = [v13 objectAtIndexedSubscript:a3];
  }

  return v12;
}

- (NSMutableArray)recentCalls
{
  return self->_recentCalls;
}

- (int64_t)tableViewDisplayMode
{
  return self->_tableViewDisplayMode;
}

- (id)contactsForRecentCallForAvatar:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(MPRecentsTableViewController *)self recentsController];
  id v6 = [v5 contactByHandleForRecentCall:v4 keyDescriptors:&__NSArray0__struct];

  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  [v4 validRemoteParticipantHandles];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        if (!v13) {
          id v13 = objc_alloc_init((Class)CNMutableContact);
        }
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  if (![v7 count])
  {
    id v14 = objc_alloc_init((Class)CNMutableContact);
    [v7 addObject:v14];
  }

  return v7;
}

- (CNAvatarViewControllerSettings)avatarViewControllerSettings
{
  return self->_avatarViewControllerSettings;
}

- (MPRecentsTableViewController)initWithRecentsController:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPRecentsTableViewController;
  id v6 = [(PhoneViewController *)&v15 initWithNibName:0 bundle:0];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recentsController, a3);
    [(PHRecentsController *)v7->_recentsController addDelegate:v7 queue:&_dispatch_main_q];
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v7 selector:"handleUIAccessibilityDarkerSystemColorsStatusDidChangeNotification:" name:UIAccessibilityDarkerSystemColorsStatusDidChangeNotification object:0];
    id v9 = +[ILClassificationController sharedInstance];
    [v9 activateWithCompletion:0];

    id v10 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v7->_featureFlags;
    v7->_featureFlags = v10;

    v12 = objc_alloc_init(_TtC11MobilePhone22CallReportingViewModel);
    callReportingViewModel = v7->_callReportingViewModel;
    v7->_callReportingViewModel = v12;

    [(MPRecentsTableViewController *)v7 commonInit];
  }

  return v7;
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MPRecentsTableViewController;
  [(MPRecentsTableViewController *)&v13 viewWillLayoutSubviews];
  [(MPRecentsTableViewController *)self systemMinimumLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(MPRecentsTableViewController *)self tableView];
  [v11 setDirectionalLayoutMargins:v4, v6, v8, v10];

  v12 = [(MPRecentsTableViewController *)self searchController];
  -[MPRecentsTableViewController updateSearchBarLayoutMarginsPresentingSearchResults:](self, "updateSearchBarLayoutMarginsPresentingSearchResults:", [v12 isActive]);
}

- (void)viewDidLoad
{
  v49.receiver = self;
  v49.super_class = (Class)MPRecentsTableViewController;
  [(MPRecentsTableViewController *)&v49 viewDidLoad];
  double v3 = +[UIColor systemBackgroundColor];
  double v4 = [(MPRecentsTableViewController *)self view];
  [v4 setBackgroundColor:v3];

  double v5 = [(MPRecentsTableViewController *)self navigationItem];
  [v5 setHidesSearchBarWhenScrolling:0];

  double v6 = [(MPRecentsTableViewController *)self tableView];
  [v6 setDataSource:self];

  double v7 = [(MPRecentsTableViewController *)self tableView];
  [v7 setDelegate:self];

  double v8 = [(MPRecentsTableViewController *)self tableView];
  [v8 registerClass:[self tableViewCellClass] forCellReuseIdentifier:@"MPRecentsTableViewCell"];

  double v9 = [(MPRecentsTableViewController *)self tableView];
  [v9 setRowHeight:UITableViewAutomaticDimension];

  double v10 = [(MPRecentsTableViewController *)self featureFlags];
  LODWORD(v4) = [v10 phoneRecentsAvatarsEnabled];

  if (v4)
  {
    uint64_t v11 = [(MPRecentsTableViewController *)self tableView];
    [v11 setSeparatorInsetReference:1];
  }
  v12 = [(MPRecentsTableViewController *)self tableViewCellClass];
  objc_super v13 = [(MPRecentsTableViewController *)self traitCollection];
  id v14 = [v13 preferredContentSizeCategory];
  [(objc_class *)v12 separatorInsetForContentSizeCategory:v14 isEditing:[(MPRecentsTableViewController *)self isEditing]];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [(MPRecentsTableViewController *)self tableView];
  [v23 setSeparatorInset:v16, v18, v20, v22];

  v24 = +[NSBundle mainBundle];
  v25 = [v24 localizedStringForKey:@"NO_RECENTS" value:&stru_100285990 table:@"PHRecents"];
  [(MPRecentsTableViewController *)self setContentUnavailableViewTitle:v25];

  int64_t v26 = [(MPRecentsTableViewController *)self tableViewDisplayMode];
  int v27 = [(MPRecentsTableViewController *)self tableViewDisplayModeSegmentedControl];
  [v27 setSelectedSegmentIndex:v26];

  char v28 = [(MPRecentsTableViewController *)self avatarCardController];
  [v28 setDelegate:self];

  __int16 v29 = [(MPRecentsTableViewController *)self view];
  uint64_t v30 = [(MPRecentsTableViewController *)self avatarCardController];
  [(id)v30 setSourceView:v29];

  __int16 v31 = [(MPRecentsTableViewController *)self featureFlags];
  LOBYTE(v30) = [v31 increaseCallHistoryEnabled];

  if ((v30 & 1) == 0)
  {
    v32 = [(MPRecentsTableViewController *)self tableView];
    [(PhoneViewController *)self _loadOffsetDefaultForKey:@"RecentsOffsetKey" withScrollView:v32];
  }
  [(MPRecentsTableViewController *)self updateLargeTitleInsets];
  id v33 = objc_alloc_init((Class)TUFeatureFlags);
  unsigned int v34 = [v33 nameAndPhotoEnabledC3];

  if (v34)
  {
    BOOL v35 = PHDefaultLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v48 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Going to present CNSharedProfileOnboardingController on launch", v48, 2u);
    }

    id v36 = objc_alloc((Class)CNSharedProfileOnboardingController);
    unsigned int v37 = +[TUCallCenter sharedInstance];
    v38 = [v37 contactStore];
    id v39 = [v36 initWithContactStore:v38];
    [(MPRecentsTableViewController *)self setOnboardingController:v39];

    v40 = [(MPRecentsTableViewController *)self onboardingController];
    [v40 presentOnboardingFlowIfNeededForMode:1 fromViewController:self];
  }
  v41 = +[NSNotificationCenter defaultCenter];
  [v41 addObserver:self selector:"updateNavigationItemsForEditing" name:UIApplicationWillEnterForegroundNotification object:0];

  v42 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v43 = [v42 callHistorySearchEnabled];

  if (v43)
  {
    [(MPRecentsTableViewController *)self configureSearch];
    id v44 = [(MPRecentsTableViewController *)self recentsController];
    [v44 checkRecentMissedCallCount];

    id v45 = [(MPRecentsTableViewController *)self searchController];
    -[MPRecentsTableViewController updateSearchBarLayoutMarginsPresentingSearchResults:](self, "updateSearchBarLayoutMarginsPresentingSearchResults:", [v45 isActive]);
  }
  v46 = objc_opt_new();
  v47 = [(MPRecentsTableViewController *)self tabBarItem];
  [v47 setStandardAppearance:v46];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  double v4 = [(MPRecentsTableViewController *)self tableViewCellClass];

  [(objc_class *)v4 minimumRowHeight];
  return result;
}

- (Class)tableViewCellClass
{
  return (Class)objc_opt_class();
}

- (UITableView)tableView
{
  tableView = self->_tableView;
  if (!tableView)
  {
    double v4 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_tableView;
    self->_tableView = v4;

    [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v6 = [(MPRecentsTableViewController *)self view];
    [v6 addSubview:self->_tableView];

    double v7 = [(MPRecentsTableViewController *)self view];
    double v8 = self->_tableView;
    double v9 = [(MPRecentsTableViewController *)self view];
    double v10 = +[NSLayoutConstraint constraintWithItem:v8 attribute:7 relatedBy:0 toItem:v9 attribute:7 multiplier:1.0 constant:0.0];
    [v7 addConstraint:v10];

    uint64_t v11 = [(MPRecentsTableViewController *)self view];
    v12 = self->_tableView;
    objc_super v13 = [(MPRecentsTableViewController *)self view];
    id v14 = +[NSLayoutConstraint constraintWithItem:v12 attribute:8 relatedBy:0 toItem:v13 attribute:8 multiplier:1.0 constant:0.0];
    [v11 addConstraint:v14];

    tableView = self->_tableView;
  }

  return tableView;
}

- (CNAvatarCardController)avatarCardController
{
  avatarCardController = self->_avatarCardController;
  if (!avatarCardController)
  {
    double v4 = (CNAvatarCardController *)objc_alloc_init((Class)CNAvatarCardController);
    double v5 = self->_avatarCardController;
    self->_avatarCardController = v4;

    avatarCardController = self->_avatarCardController;
  }

  return avatarCardController;
}

- (void)updateSearchBarLayoutMarginsPresentingSearchResults:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 callHistorySearchEnabled];

  if (v6)
  {
    double v7 = [(MPRecentsTableViewController *)self view];
    [v7 layoutMargins];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    BOOL v16 = !v3;
    if (v3) {
      uint64_t v17 = 10;
    }
    else {
      uint64_t v17 = 14;
    }
    if (v16) {
      double v13 = 0.0;
    }
    id v19 = [(MPRecentsTableViewController *)self searchController];
    double v18 = [v19 searchBar];
    [v18 _setOverrideContentInsets:v17 forRectEdges:v9, v11, v13, v15];
  }
}

- (UISegmentedControl)tableViewDisplayModeSegmentedControl
{
  tableViewDisplayModeSegmentedControl = self->_tableViewDisplayModeSegmentedControl;
  if (!tableViewDisplayModeSegmentedControl)
  {
    double v4 = +[NSBundle mainBundle];
    double v5 = [v4 localizedStringForKey:@"ALL_TOGGLE_TITLE" value:&stru_100285990 table:@"PHRecents"];
    v12[0] = v5;
    unsigned int v6 = +[NSBundle mainBundle];
    double v7 = [v6 localizedStringForKey:@"MISSED_TOGGLE_TITLE" value:&stru_100285990 table:@"PHRecents"];
    v12[1] = v7;
    double v8 = +[NSArray arrayWithObjects:v12 count:2];

    double v9 = (UISegmentedControl *)[objc_alloc((Class)UISegmentedControl) initWithItems:v8];
    double v10 = self->_tableViewDisplayModeSegmentedControl;
    self->_tableViewDisplayModeSegmentedControl = v9;

    [(UISegmentedControl *)self->_tableViewDisplayModeSegmentedControl frame];
    -[UISegmentedControl setFrame:](self->_tableViewDisplayModeSegmentedControl, "setFrame:");

    tableViewDisplayModeSegmentedControl = self->_tableViewDisplayModeSegmentedControl;
  }

  return tableViewDisplayModeSegmentedControl;
}

- (void)setOnboardingController:(id)a3
{
}

- (void)setContentUnavailableViewTitle:(id)a3
{
  p_contentUnavailableViewTitle = &self->_contentUnavailableViewTitle;
  double v7 = (NSString *)a3;
  if (*p_contentUnavailableViewTitle != v7)
  {
    objc_storeStrong((id *)&self->_contentUnavailableViewTitle, a3);
    contentUnavailableView = self->_contentUnavailableView;
    if (contentUnavailableView) {
      [(_UIContentUnavailableView *)contentUnavailableView setTitle:*p_contentUnavailableViewTitle];
    }
  }
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (id)nicknameEditButtonItem
{
  BOOL v3 = +[NSMutableArray array];
  if ([(id)objc_opt_class() meCardSharingEnabled])
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __54__MPRecentsTableViewController_nicknameEditButtonItem__block_invoke;
    v31[3] = &unk_10027DA18;
    v31[4] = self;
    double v4 = +[UICustomViewMenuElement elementWithViewProvider:v31];
    id v33 = v4;
    double v5 = +[NSArray arrayWithObjects:&v33 count:1];
    unsigned int v6 = +[UIMenu menuWithTitle:&stru_100285990 image:0 identifier:0 options:1 children:v5];

    [v3 addObject:v6];
  }
  else
  {
    objc_initWeak(&location, self);
    double v7 = +[NSBundle mainBundle];
    double v8 = [v7 localizedStringForKey:@"SET_UP_NAME_AND_PHOTO" value:&stru_100285990 table:@"PHRecents"];
    double v9 = +[UIImage systemImageNamed:@"person.crop.circle"];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __54__MPRecentsTableViewController_nicknameEditButtonItem__block_invoke_2;
    v28[3] = &unk_10027DA40;
    objc_copyWeak(&v29, &location);
    double v10 = +[UIAction actionWithTitle:v8 image:v9 identifier:0 handler:v28];

    v32 = v10;
    double v11 = +[NSArray arrayWithObjects:&v32 count:1];
    double v12 = +[UIMenu menuWithTitle:&stru_100285990 image:0 identifier:0 options:1 children:v11];

    [v3 addObject:v12];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  if ([(MPRecentsTableViewController *)self rowCountForCurrentTableMode] >= 1)
  {
    objc_initWeak(&location, self);
    double v13 = +[NSBundle mainBundle];
    double v14 = [v13 localizedStringForKey:@"SELECT" value:&stru_100285990 table:@"PHRecents"];
    double v15 = +[UIImage systemImageNamed:@"checkmark.circle"];
    uint64_t v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472;
    v25 = __54__MPRecentsTableViewController_nicknameEditButtonItem__block_invoke_3;
    int64_t v26 = &unk_10027DA40;
    objc_copyWeak(&v27, &location);
    BOOL v16 = +[UIAction actionWithTitle:v14 image:v15 identifier:0 handler:&v23];

    [v3 addObject:v16, v23, v24, v25, v26];
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  id v17 = objc_alloc((Class)UIBarButtonItem);
  double v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"EDIT" value:&stru_100285990 table:@"PHRecents"];
  double v20 = +[UIMenu menuWithChildren:v3];
  id v21 = [v17 initWithTitle:v19 menu:v20];

  return v21;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MPRecentsTableViewController;
  [(MPRecentsTableViewController *)&v19 traitCollectionDidChange:v4];
  double v5 = [(MPRecentsTableViewController *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6 && v7 != v6 && [(MPRecentsTableViewController *)self contentUnavailable])
  {
    [(MPRecentsTableViewController *)self setContentUnavailable:0];
    [(MPRecentsTableViewController *)self setContentUnavailableView:0];
    [(MPRecentsTableViewController *)self setContentUnavailable:1];
  }
  [(MPRecentsTableViewController *)self updateLargeTitleInsets];
  double v8 = [(MPRecentsTableViewController *)self tableView];
  uint64_t v9 = [v8 tableHeaderView];
  if (!v9) {
    goto LABEL_13;
  }
  double v10 = (void *)v9;
  double v11 = [v4 preferredContentSizeCategory];
  double v12 = [(MPRecentsTableViewController *)self traitCollection];
  uint64_t v13 = [v12 preferredContentSizeCategory];
  if (v11 == (void *)v13)
  {

LABEL_12:
LABEL_13:

    goto LABEL_14;
  }
  double v14 = (void *)v13;
  UIContentSizeCategory v15 = [v4 preferredContentSizeCategory];
  UIContentSizeCategory v16 = v15;
  if (v15 == UIContentSizeCategoryUnspecified)
  {

    goto LABEL_12;
  }
  id v17 = [(MPRecentsTableViewController *)self traitCollection];
  UIContentSizeCategory v18 = [v17 preferredContentSizeCategory];

  if (v18 != UIContentSizeCategoryUnspecified) {
    [(MPRecentsTableViewController *)self refreshTableHeaderView];
  }
LABEL_14:
}

- (void)updateLargeTitleInsets
{
  BOOL v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned __int8 v4 = [v3 phoneRecentsAvatarsEnabled];

  if ((v4 & 1) == 0)
  {
    double v5 = [(MPRecentsTableViewController *)self navigationItem];
    [v5 largeTitleInsets];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    double v12 = [(MPRecentsTableViewController *)self tableViewCellClass];
    uint64_t v13 = [(MPRecentsTableViewController *)self traitCollection];
    double v14 = [v13 preferredContentSizeCategory];
    [(objc_class *)v12 leftTitleSeparatorInsetForContentSizeCategory:v14];
    double v16 = v15;

    id v17 = [(MPRecentsTableViewController *)self navigationItem];
    [v17 setLargeTitleInsets:v7, v16, v9, v11];

    id v19 = [(MPRecentsTableViewController *)self navigationItem];
    UIContentSizeCategory v18 = [v19 navigationBar];
    [v18 setNeedsLayout];
  }
}

+ (int64_t)tabBarSystemItem
{
  return 4;
}

+ (id)tabBarIconName
{
  v2 = +[NSBundle mainBundle];
  BOOL v3 = [v2 localizedStringForKey:@"RECENTS" value:&stru_100285990 table:@"PHRecents"];

  return v3;
}

uint64_t __63__MPRecentsTableViewController_performBatchUpdates_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __57__MPRecentsTableViewController_reloadDataSourceForCalls___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) callsWithValidHandles:*(void *)(a1 + 40)];
  id v3 = [v2 mutableCopy];
  [*(id *)(a1 + 32) setRecentCalls:v3];

  unsigned __int8 v4 = *(void **)(a1 + 32);
  BOOL v5 = [v4 rowCountForCurrentTableMode] == 0;

  return [v4 setContentUnavailable:v5 animated:0];
}

- (void)recentsController:(id)a3 didChangeCalls:(id)a4
{
  id v5 = a4;
  double v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = (id)objc_opt_class();
    id v7 = v28;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling recent calls change", buf, 0xCu);
  }
  if (![(MPRecentsTableViewController *)self isViewLoaded]
    || ([(MPRecentsTableViewController *)self isEditing] & 1) != 0)
  {
    [(MPRecentsTableViewController *)self setDataSourceNeedsReload:1];
    goto LABEL_25;
  }
  double v8 = PHDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Synchronizing recents table view with recents data source", buf, 2u);
  }

  double v9 = [(MPRecentsTableViewController *)self callsWithValidHandles:v5];
  if ((id)[(MPRecentsTableViewController *)self tableViewDisplayMode] == (id)1)
  {
    double v10 = +[NSPredicate predicateWithBlock:&__block_literal_global_16];
    uint64_t v11 = [v9 filteredArrayUsingPredicate:v10];

    double v9 = (void *)v11;
  }
  double v12 = [(MPRecentsTableViewController *)self featureFlags];
  if (([v12 phoneRecentsAvatarsEnabled] & 1) == 0)
  {

    goto LABEL_14;
  }
  uint64_t v13 = [(MPRecentsTableViewController *)self recentCalls];
  unsigned int v14 = [v13 isEqualToArray:v9];

  if (!v14)
  {
LABEL_14:
    double v15 = [(MPRecentsTableViewController *)self recentsController];
    double v16 = objc_opt_class();
    id v17 = [(MPRecentsTableViewController *)self recentCalls];
    UIContentSizeCategory v18 = [v16 indexPathsToInsertIntoCachedRecentCalls:v17 fromBackingRecentCalls:v9];

    id v19 = [v18 count];
    double v20 = PHDefaultLog();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v21)
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Inserting index paths for new recent calls: %@", buf, 0xCu);
      }

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = __65__MPRecentsTableViewController_recentsController_didChangeCalls___block_invoke_278;
      v24[3] = &unk_10027DA68;
      v24[4] = self;
      id v25 = v9;
      id v26 = v18;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = __65__MPRecentsTableViewController_recentsController_didChangeCalls___block_invoke_2;
      v23[3] = &unk_10027D268;
      v23[4] = self;
      [(MPRecentsTableViewController *)self performBatchUpdates:v24 completion:v23];
    }
    else
    {
      if (v21)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Reloading data source", buf, 2u);
      }

      [(MPRecentsTableViewController *)self reloadDataSourceForCalls:v5];
    }

    goto LABEL_22;
  }
  [(MPRecentsTableViewController *)self reconfiguringCellsForCalls:v9];
LABEL_22:
  delegate = self->_delegate;
  if (delegate) {
    [(MPRecentsTableViewControllerDelegate *)delegate tableViewController:self didChangeCalls:v5];
  }

LABEL_25:
}

- (void)performBatchUpdates:(id)a3 completion:(id)a4
{
  double v6 = (void (**)(id, void))a3;
  id v7 = (void (**)(id, void))a4;
  if (![(MPRecentsTableViewController *)self canPerformTableViewUpdates])
  {
    double v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "performBatchUpdates: View is not loaded or not in view hierarchy, setting dataSourceNeedsReload to true, not performing updates", buf, 2u);
    }

    [(MPRecentsTableViewController *)self setDataSourceNeedsReload:1];
    if (v7) {
      v7[2](v7, 0);
    }
  }
  unsigned int v9 = [(MPRecentsTableViewController *)self dataSourceNeedsReload];
  double v10 = PHDefaultLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "performBatchUpdates: Data source already needs a reload. Performing the reload instead", buf, 2u);
    }

    v6[2](v6, 0);
    double v12 = [(MPRecentsTableViewController *)self recentsController];
    uint64_t v13 = [v12 recentCalls];
    unsigned int v14 = [(MPRecentsTableViewController *)self callsWithValidHandles:v13];
    id v15 = [v14 mutableCopy];
    [(MPRecentsTableViewController *)self setRecentCalls:v15];

    double v16 = [(MPRecentsTableViewController *)self tableView];
    [v16 reloadData];

    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "performBatchUpdates: Performing the batch update", buf, 2u);
    }

    id v17 = [(MPRecentsTableViewController *)self tableView];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = __63__MPRecentsTableViewController_performBatchUpdates_completion___block_invoke;
    v18[3] = &unk_10027CD60;
    id v19 = v6;
    [v17 performBatchUpdates:v18 completion:v7];
  }
  [(MPRecentsTableViewController *)self setDataSourceNeedsReload:0];
}

- (void)setDataSourceNeedsReload:(BOOL)a3
{
  self->_dataSourceNeedsReload = a3;
}

- (BOOL)dataSourceNeedsReload
{
  return self->_dataSourceNeedsReload;
}

- (BOOL)canPerformTableViewUpdates
{
  id v3 = [(MPRecentsTableViewController *)self view];
  if (v3 && [(MPRecentsTableViewController *)self isViewLoaded])
  {
    unsigned __int8 v4 = [(MPRecentsTableViewController *)self view];
    id v5 = [v4 window];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)callsWithValidHandles:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[NSPredicate predicateWithBlock:&__block_literal_global_283];
  id v5 = [v3 filteredArrayUsingPredicate:v4];

  return v5;
}

- (void)setContentUnavailable:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_contentUnavailable != a3)
  {
    BOOL v4 = a3;
    self->_contentUnavailable = a3;
    if (self->_contentUnavailableView || a3)
    {
      BOOL v7 = a4;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __63__MPRecentsTableViewController_setContentUnavailable_animated___block_invoke;
      v13[3] = &unk_10027CC10;
      BOOL v14 = a3;
      v13[4] = self;
      double v8 = objc_retainBlock(v13);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __63__MPRecentsTableViewController_setContentUnavailable_animated___block_invoke_2;
      v11[3] = &unk_10027C838;
      BOOL v12 = v4;
      v11[4] = self;
      unsigned int v9 = objc_retainBlock(v11);
      double v10 = [(MPRecentsTableViewController *)self tableView];
      [v10 setHidden:v4];

      if (v7)
      {
        +[UIView animateWithDuration:4 delay:v9 options:v8 animations:0.300000012 completion:0.0];
      }
      else
      {
        ((void (*)(void *))v9[2])(v9);
        ((void (*)(void *, uint64_t))v8[2])(v8, 1);
      }
    }
  }
}

- (void)setRecentCalls:(id)a3
{
  id v5 = (NSMutableArray *)a3;
  p_recentCalls = &self->_recentCalls;
  if (self->_recentCalls != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)p_recentCalls, a3);
    [(MPRecentsTableViewController *)self setIndexPathsForMissedCalls:0];
    p_recentCalls = (NSMutableArray **)[(MPRecentsTableViewController *)self setIndexPathsForNormalCalls:0];
    id v5 = v7;
  }

  _objc_release_x1(p_recentCalls, v5);
}

- (void)setIndexPathsForNormalCalls:(id)a3
{
}

- (void)setIndexPathsForMissedCalls:(id)a3
{
}

- (void)reconfiguringCellsForCalls:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 phoneRecentsAvatarsEnabled];

  if (v6)
  {
    BOOL v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v12 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "reconfiguringCellsForCalls: %lu", buf, 0xCu);
    }

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __59__MPRecentsTableViewController_reconfiguringCellsForCalls___block_invoke;
    v8[3] = &unk_10027C8F0;
    id v9 = v4;
    double v10 = self;
    [(MPRecentsTableViewController *)self performBatchUpdates:v8 completion:0];
  }
}

- (void)recentsController:(id)a3 didCompleteFetchingCalls:(id)a4
{
  id v8 = a4;
  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 callHistorySearchEnabled];

  if (v6)
  {
    delegate = self->_delegate;
    if (delegate) {
      [(MPRecentsTableViewControllerDelegate *)delegate tableViewController:self didChangeCalls:v8];
    }
  }
}

- (void)commonInit
{
  self->_contentUnavailable = 0;
  self->_dataSourceNeedsReload = 1;
  recentCalls = self->_recentCalls;
  self->_recentCalls = 0;

  id v4 = objc_alloc_init(_TtC11MobilePhone22CallReportingViewModel);
  callReportingViewModel = self->_callReportingViewModel;
  self->_callReportingViewModel = v4;

  unsigned int v6 = PHPreferencesGetValue(@"RecentsListFilter");
  self->_tableViewDisplayMode = (int64_t)[v6 integerValue];

  double v10 = objc_alloc_init(MPCNMeCardSharingSettingsViewControllerObserver);
  [(MPRecentsTableViewController *)self setMeCardSharingSettingsViewControllerObserver:v10];
  BOOL v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 contactStore];
  id v9 = +[CNAvatarViewControllerSettings settingsWithContactStore:v8 threeDTouchEnabled:1];
  [(MPRecentsTableViewController *)self setAvatarViewControllerSettings:v9];

  [(MPRecentsTableViewController *)self updateTabBarItem];
}

- (void)setMeCardSharingSettingsViewControllerObserver:(id)a3
{
}

- (void)setAvatarViewControllerSettings:(id)a3
{
}

id __65__MPRecentsTableViewController_recentsController_didChangeCalls___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  BOOL v2 = [v1 rowCountForCurrentTableMode] == 0;

  return [v1 setContentUnavailable:v2 animated:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MPRecentsTableViewController;
  [(MPRecentsTableViewController *)&v11 viewDidAppear:a3];
  id v4 = [(MPRecentsTableViewController *)self navigationItem];
  [v4 setHidesSearchBarWhenScrolling:1];

  if ([(MPRecentsTableViewController *)self pendingSearchControllerActivation])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __46__MPRecentsTableViewController_viewDidAppear___block_invoke;
    block[3] = &unk_10027C670;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    [(MPRecentsTableViewController *)self setPendingSearchControllerActivation:0];
  }
  +[TPTipsHelper updateCanDisplayCallHistorySearchTip:[(MPRecentsTableViewController *)self canDisplaySearchBarPopover]];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __46__MPRecentsTableViewController_viewDidAppear___block_invoke_3;
  v9[3] = &unk_10027C670;
  v9[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "MPRecentsTableViewController viewDidAppear:", v8, 2u);
  }

  unsigned int v6 = createPHPhoneTabBarControllerTabViewDidAppearNotificationInfo(2, self);
  BOOL v7 = +[NSNotificationCenter defaultCenter];
  [v7 postNotificationName:@"PHPhoneTabBarControllerTabViewDidAppearNotification" object:v6];
}

- (BOOL)canDisplaySearchBarPopover
{
  BOOL v2 = self;
  Swift::Bool v3 = MPRecentsTableViewController.canDisplaySearchBarPopover()();

  return v3;
}

- (BOOL)pendingSearchControllerActivation
{
  return self->_pendingSearchControllerActivation;
}

- (void)configureSearch
{
  Swift::Bool v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v4 = [v3 callHistorySearchEnabled];

  if (v4)
  {
    id v5 = [(MPRecentsTableViewController *)self searchController];
    unsigned int v6 = [v5 searchBar];
    [v6 sizeToFit];

    BOOL v7 = +[UIColor linkColor];
    id v8 = [(MPRecentsTableViewController *)self searchController];
    id v9 = [v8 searchBar];
    [v9 setTintColor:v7];

    id v11 = [(MPRecentsTableViewController *)self searchController];
    double v10 = [(MPRecentsTableViewController *)self navigationItem];
    [v10 setSearchController:v11];
  }
}

- (UISearchController)searchController
{
  Swift::Bool v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v4 = [v3 callHistorySearchEnabled];

  if (v4)
  {
    searchController = self->_searchController;
    if (!searchController)
    {
      id v6 = objc_alloc((Class)UISearchController);
      BOOL v7 = [(MPRecentsTableViewController *)self searchResultsController];
      id v8 = (UISearchController *)[v6 initWithSearchResultsController:v7];
      id v9 = self->_searchController;
      self->_searchController = v8;

      double v10 = [(MPRecentsTableViewController *)self searchResultsController];
      [(UISearchController *)self->_searchController setSearchResultsUpdater:v10];

      [(UISearchController *)self->_searchController setObscuresBackgroundDuringPresentation:0];
      [(UISearchController *)self->_searchController setDelegate:self];
      searchController = self->_searchController;
    }
    id v11 = searchController;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (MPSearchViewController)searchResultsController
{
  Swift::Bool v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v4 = [v3 callHistorySearchEnabled];

  if (v4)
  {
    searchResultsController = self->_searchResultsController;
    if (!searchResultsController)
    {
      id v6 = objc_alloc_init(MPSearchViewController);
      BOOL v7 = self->_searchResultsController;
      self->_searchResultsController = v6;

      [(MPSearchViewController *)self->_searchResultsController setDelegate:self];
      id v8 = [(MPRecentsTableViewController *)self searchResultsControllerProvider];
      [(MPSearchViewController *)self->_searchResultsController setSearchControllerProvider:v8];

      id v9 = [(MPRecentsTableViewController *)self navigationController];
      [(MPSearchViewController *)self->_searchResultsController setHostingNavigationController:v9];

      searchResultsController = self->_searchResultsController;
    }
    double v10 = searchResultsController;
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MPRecentsTableViewController;
  -[MPRecentsTableViewController viewWillAppear:](&v15, "viewWillAppear:");
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
  [v5 addObserver:self selector:"appSuspended:" name:UIApplicationSuspendedNotification object:0];
  [v5 addObserver:self selector:"appResumed:" name:UIApplicationResumedNotification object:0];
  [v5 addObserver:self selector:"phoneApplicationDidChangeTabBarSelection:" name:@"PhoneApplicationDidChangeTabBarSelectionNotification" object:0];
  [(MPRecentsTableViewController *)self tipKitStartObservation];
  if ([(MPRecentsTableViewController *)self dataSourceNeedsReload]) {
    [(MPRecentsTableViewController *)self reloadDataSource];
  }
  unsigned int v6 = [(MPRecentsTableViewController *)self shouldNavigationControllerPresentLargeTitles];
  BOOL v7 = [(MPRecentsTableViewController *)self navigationItem];
  id v8 = v7;
  if (v6) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [v7 setLargeTitleDisplayMode:v9];

  [(MPRecentsTableViewController *)self setNavigationItemsForEditing:[(MPRecentsTableViewController *)self isEditing] animated:v3];
  double v10 = [(MPRecentsTableViewController *)self navigationItem];
  id v11 = [v10 navigationBar];
  [v11 sizeToFit];

  id v12 = [(MPRecentsTableViewController *)self pendingSearchText];
  id v13 = [v12 length];

  if (v13)
  {
    BOOL v14 = [(MPRecentsTableViewController *)self pendingSearchText];
    [(MPRecentsTableViewController *)self startSearchingForText:v14];

    [(MPRecentsTableViewController *)self setPendingSearchText:0];
  }
}

- (void)tipKitStartObservation
{
  BOOL v2 = self;
  MPRecentsTableViewController.tipKitStartObservation()();
}

- (BOOL)shouldNavigationControllerPresentLargeTitles
{
  BOOL v3 = [(MPRecentsTableViewController *)self recentCalls];
  if (v3)
  {
    unsigned int v4 = [(MPRecentsTableViewController *)self recentCalls];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)searchResultsControllerProvider
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __63__MPRecentsTableViewController_searchResultsControllerProvider__block_invoke;
  v4[3] = &unk_10027D928;
  objc_copyWeak(&v5, &location);
  BOOL v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

- (void)reloadDataSource
{
  BOOL v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asked to reload data source", v6, 2u);
  }

  unsigned int v4 = [(MPRecentsTableViewController *)self recentsController];
  id v5 = [v4 recentCalls];
  [(MPRecentsTableViewController *)self reloadDataSourceForCalls:v5];
}

- (void)reloadDataSourceForCalls:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v10 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to reload data source for %lu calls", buf, 0xCu);
  }

  [(MPRecentsTableViewController *)self setDataSourceNeedsReload:1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __57__MPRecentsTableViewController_reloadDataSourceForCalls___block_invoke;
  v7[3] = &unk_10027C8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(MPRecentsTableViewController *)self performBatchUpdates:v7 completion:0];
}

- (NSString)pendingSearchText
{
  return self->_pendingSearchText;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)MPRecentsTableViewController;
  [(MPRecentsTableViewController *)&v7 loadView];
  BOOL v3 = [(MPRecentsTableViewController *)self tableViewDisplayModeSegmentedControl];
  [v3 addTarget:self action:"selectedSegmentDidChangeForSender:" forControlEvents:4096];
  id v4 = [(MPRecentsTableViewController *)self navigationItem];
  [v4 setTitleView:v3];

  id v5 = [(MPRecentsTableViewController *)self navigationController];
  id v6 = [v5 navigationBar];
  [v6 setPrefersLargeTitles:1];

  if (+[UIApplication shouldMakeUIForDefaultPNG])[(MPRecentsTableViewController *)self makeUIForDefaultPNG]; {
}
  }

- (void)appResumed:(id)a3
{
  id v4 = a3;
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v10 = 138412546;
    id v11 = v6;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v10, 0x16u);
  }
  if ([(MPRecentsTableViewController *)self didEnterSuspended])
  {
    uint64_t v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "reloading tableview because the app was in a suspended state and resumed", (uint8_t *)&v10, 2u);
    }

    self->_didEnterSuspended = 0;
    [(MPRecentsTableViewController *)self reloadTableView];
  }
}

- (BOOL)didEnterSuspended
{
  return self->_didEnterSuspended;
}

+ (BOOL)requiresNavigationControllerContainer
{
  return 1;
}

+ (int)tabViewType
{
  return 2;
}

- (void)handleShowDetailsURLForUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)CHManager);
  id v6 = +[CHRecentCall predicateForCallsWithUniqueID:v4];
  id v7 = [v5 callsWithPredicate:v6 limit:0 offset:0 batchSize:0];
  id v8 = [v7 firstObject];

  uint64_t v9 = PHDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v4;
    __int16 v17 = 2112;
    UIContentSizeCategory v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "handleShowDetailsURLForUniqueID: %@ found recent call %@", (uint8_t *)&v15, 0x16u);
  }

  if (v8)
  {
    int v10 = [(MPRecentsTableViewController *)self navigationController];
    id v11 = [v10 visibleViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v13 = [(MPRecentsTableViewController *)self navigationController];
      id v14 = [v13 popViewControllerAnimated:0];
    }
    [(MPRecentsTableViewController *)self showRecentCallDetailsViewControllerForRecentCall:v8 animated:1];
  }
}

- (MPRecentsTableViewController)init
{
  return 0;
}

- (MPRecentsTableViewController)initWithCoder:(id)a3
{
  return 0;
}

- (MPRecentsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (_TtC11MobilePhone25FaceTimeSpamReportManager)spamReport
{
  spamReport = self->_spamReport;
  if (!spamReport)
  {
    id v4 = objc_alloc_init(_TtC11MobilePhone25FaceTimeSpamReportManager);
    id v5 = self->_spamReport;
    self->_spamReport = v4;

    spamReport = self->_spamReport;
  }

  return spamReport;
}

- (void)dealloc
{
  BOOL v3 = [(MPRecentsTableViewController *)self dataSourcePrefetchingOperationQueue];
  [v3 cancelAllOperations];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)MPRecentsTableViewController;
  [(MPRecentsTableViewController *)&v5 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v4.receiver = self;
  v4.super_class = (Class)MPRecentsTableViewController;
  [(MPRecentsTableViewController *)&v4 didReceiveMemoryWarning];
  self->_dataSourceNeedsReload = 1;
  contentUnavailableView = self->_contentUnavailableView;
  self->_contentUnavailableView = 0;
}

id __46__MPRecentsTableViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = __46__MPRecentsTableViewController_viewDidAppear___block_invoke_2;
  v2[3] = &unk_10027C670;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v2];
}

void __46__MPRecentsTableViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) searchController];
  [v2 setActive:1];

  id v4 = [*(id *)(a1 + 32) searchController];
  BOOL v3 = [v4 searchBar];
  [v3 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MPRecentsTableViewController;
  [(MPRecentsTableViewController *)&v6 viewWillDisappear:a3];
  id v4 = [(MPRecentsTableViewController *)self recentsController];
  [v4 markRecentCallsAsRead];

  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"PhoneApplicationDidChangeTabBarSelectionNotification" object:0];
  [v5 removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:0];
  [v5 removeObserver:self name:UIApplicationSuspendedNotification object:0];
  [v5 removeObserver:self name:UIApplicationResumedNotification object:0];
  [(MPRecentsTableViewController *)self tipKitStopObservation];
  +[TPTipsHelper updateCanDisplayCallHistorySearchTip:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPRecentsTableViewController;
  -[MPRecentsTableViewController viewDidDisappear:](&v8, "viewDidDisappear:");
  objc_super v5 = [(MPRecentsTableViewController *)self tableView];
  objc_super v6 = [(MPRecentsTableViewController *)self tableView];
  id v7 = [v6 indexPathForSelectedRow];
  [v5 deselectRowAtIndexPath:v7 animated:v3];

  if ([(MPRecentsTableViewController *)self isEditing]) {
    [(MPRecentsTableViewController *)self setEditing:0 animated:0];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MPRecentsTableViewController;
  -[MPRecentsTableViewController setEditing:animated:](&v22, "setEditing:animated:");
  id v7 = [(MPRecentsTableViewController *)self tableView];
  [v7 setEditing:v5 animated:v4];

  objc_super v8 = [(MPRecentsTableViewController *)self tableViewCellClass];
  uint64_t v9 = [(MPRecentsTableViewController *)self traitCollection];
  int v10 = [v9 preferredContentSizeCategory];
  [(objc_class *)v8 separatorInsetForContentSizeCategory:v10 isEditing:v5];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [(MPRecentsTableViewController *)self tableView];
  [v19 setSeparatorInset:v12, v14, v16, v18];

  [(MPRecentsTableViewController *)self setNavigationItemsForEditing:v5 animated:v4];
  if (!v5 && [(MPRecentsTableViewController *)self dataSourceNeedsReload])
  {
    double v20 = PHDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Edit mode disabled; reloading data source",
        v21,
        2u);
    }

    [(MPRecentsTableViewController *)self reloadDataSource];
  }
}

- (void)setContentUnavailable:(BOOL)a3
{
}

void __63__MPRecentsTableViewController_setContentUnavailable_animated___block_invoke(uint64_t a1, int a2)
{
  if (a2 && !*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) contentUnavailableView];
    [v2 setHidden:1];
  }
}

void __63__MPRecentsTableViewController_setContentUnavailable_animated___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) contentUnavailableView];
  id v5 = v3;
  if (v2)
  {
    [v3 setHidden:0];

    BOOL v3 = [*(id *)(a1 + 32) contentUnavailableView];
    double v4 = 1.0;
    id v5 = v3;
  }
  else
  {
    double v4 = 0.0;
  }
  [v3 setAlpha:v4];
}

- (void)updateNavigationItemsForEditing
{
  id v3 = [(MPRecentsTableViewController *)self isEditing];

  [(MPRecentsTableViewController *)self setNavigationItemsForEditing:v3 animated:0];
}

- (void)savePreferences
{
  id v3 = +[NSNumber numberWithInteger:[(MPRecentsTableViewController *)self tableViewDisplayMode]];
  PHPreferencesSetValueInDomain(@"RecentsListFilter", v3, 0);

  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  if (([v5 increaseCallHistoryEnabled] & 1) == 0
    && [(MPRecentsTableViewController *)self isViewLoaded])
  {
    double v4 = [(MPRecentsTableViewController *)self tableView];

    if (!v4) {
      return;
    }
    id v5 = [(MPRecentsTableViewController *)self tableView];
    [(PhoneViewController *)self _saveOffsetDefaultForKey:@"RecentsOffsetKey" withScrollView:v5];
  }
}

- (BOOL)shouldSnapshot
{
  if ([(MPRecentsTableViewController *)self isEditing]) {
    return 0;
  }
  double v4 = [(MPRecentsTableViewController *)self navigationController];
  id v5 = [v4 visibleViewController];
  BOOL v3 = v5 == self;

  return v3;
}

- (void)handleURL:(id)a3
{
  double v4 = [a3 scheme];
  id v5 = [v4 lowercaseString];

  if ([v5 isEqualToString:@"mobilephone-unknowncallerstip"]) {
    [(MPRecentsTableViewController *)self presentUnknownCallersViewController];
  }
}

- (id)searchControllersForDifferentSections
{
  BOOL v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v4 = [v3 callHistorySearchEnabled];

  if (v4)
  {
    id v31 = objc_alloc_init((Class)NSMutableArray);
    id v5 = objc_alloc_init(MPSuggestionsSearchTableViewController);
    [(MPSuggestionsSearchTableViewController *)v5 setSuggestionsDelegate:self];
    unsigned int v34 = v5;
    id v33 = [[MPSuggestionsSearchController alloc] initWithTableViewController:v5];
    [v31 addObject:];
    objc_super v6 = [(MPRecentsTableViewController *)self recentsController];
    id v7 = [v6 callHistoryControllerCoalescingStrategy];
    objc_super v8 = [(MPRecentsTableViewController *)self recentsController];
    uint64_t v9 = +[TUCallHistoryController callHistoryControllerWithCoalescingStrategy:options:](TUCallHistoryController, "callHistoryControllerWithCoalescingStrategy:options:", v7, [v8 callHistoryControllerOptions]);

    [v9 boostQualityOfService];
    int v10 = [PHRecentsController alloc];
    uint64_t v30 = [(MPRecentsTableViewController *)self recentsController];
    double v11 = [v30 callProviderManager];
    double v12 = [(MPRecentsTableViewController *)self recentsController];
    double v13 = [v12 contactStore];
    double v14 = [(MPRecentsTableViewController *)self recentsController];
    double v15 = [v14 suggestedContactStore];
    double v16 = [(MPRecentsTableViewController *)self recentsController];
    double v17 = [v16 metadataCache];
    v32 = v9;
    double v18 = [(PHRecentsController *)v10 initWithCallHistoryController:v9 callProviderManager:v11 contactStore:v13 suggestedContactStore:v15 metadataCache:v17];

    id v19 = v31;
    double v20 = [[MPCallsSearchController alloc] initWithRecentsController:v18 searchResultsController:self->_searchResultsController];
    [v31 addObject:v20];
    BOOL v21 = [(MPRecentsTableViewController *)self featureFlags];
    LODWORD(v15) = [v21 voicemailSearchEnabled];

    if (v15)
    {
      objc_super v22 = [(MPRecentsTableViewController *)self navigationController];
      uint64_t v23 = +[PHApplicationServices sharedInstance];
      uint64_t v24 = [v23 voicemailController];
      [v22 setVoicemailController:v24];

      id v25 = [MPVoicemailsSearchController alloc];
      id v26 = [v23 voicemailController];
      id v27 = [(MPVoicemailsSearchController *)v25 initWithNavigationController:v22 voicemailController:v26];

      [v31 addObject:v27];
    }
    id v28 = [[MPContactsSearchController alloc] initWithContactSearchType:0];
    [v31 addObject:v28];
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

id __63__MPRecentsTableViewController_searchResultsControllerProvider__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained searchControllersForDifferentSections];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  unsigned int v4 = (void *)v3;

  return v4;
}

- (id)recentsCellConfigurator
{
  uint64_t v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v4 = [v3 useSharedRecentsViewModel];

  if (v4)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__4;
    v29[4] = __Block_byref_object_dispose__4;
    id v30 = [(MPRecentsTableViewController *)self callServices];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = __55__MPRecentsTableViewController_recentsCellConfigurator__block_invoke;
    v28[3] = &unk_10027D950;
    void v28[4] = v29;
    id v5 = objc_retainBlock(v28);
    objc_initWeak(&location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = __55__MPRecentsTableViewController_recentsCellConfigurator__block_invoke_2;
    v25[3] = &unk_10027D978;
    objc_copyWeak(&v26, &location);
    objc_super v6 = objc_retainBlock(v25);
    cellConfigurator = self->_cellConfigurator;
    if (!cellConfigurator)
    {
      uint64_t v23 = v5;
      objc_super v8 = [MPContactsService alloc];
      uint64_t v9 = [(MPRecentsTableViewController *)self recentsController];
      uint64_t v24 = [(MPContactsService *)v8 initWithDataProvider:v9];

      int v10 = [MPReportFlowPresenter alloc];
      double v11 = [(MPRecentsTableViewController *)self callReportingViewModel];
      objc_super v22 = [(MPReportFlowPresenter *)v10 initWithCallReportingViewModel:v11 alertPresentingViewController:self contactsService:v24];

      double v12 = [MPRecentsCellConfigurator alloc];
      double v13 = [(MPRecentsTableViewController *)self tableView];
      double v14 = [(MPRecentsTableViewController *)self recentsController];
      double v15 = [(MPRecentsTableViewController *)self featureFlags];
      BOOL v16 = [(MPRecentsTableViewController *)self tapTargets];
      double v17 = [(MPRecentsTableViewController *)self callReportingViewModel];
      double v18 = [(MPRecentsCellConfigurator *)v12 initWithTableView:v13 recentsController:v14 featureFlags:v15 tapTargets:v16 callReportingViewModel:v17 reportFlowPresenter:v22 contactsService:v24 avatarViewControllerSettings:0 placeCallAction:v23 removeCallsAtIndexPaths:v6];
      id v19 = self->_cellConfigurator;
      self->_cellConfigurator = v18;

      cellConfigurator = self->_cellConfigurator;
      id v5 = v23;
    }
    double v20 = cellConfigurator;

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    double v20 = 0;
  }

  return v20;
}

id __55__MPRecentsTableViewController_recentsCellConfigurator__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) placeCallWithRecentCall:a2];
}

void __55__MPRecentsTableViewController_recentsCellConfigurator__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained removeRecentCallsAtIndexPaths:v5];
  }
}

- (_TtC11MobilePhone19RecentsCallServices)callServices
{
  uint64_t v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v4 = [v3 useSharedRecentsViewModel];

  if (v4)
  {
    callServices = self->_callServices;
    if (!callServices)
    {
      objc_super v6 = [_TtC11MobilePhone19RecentsCallServices alloc];
      id v7 = [(MPRecentsTableViewController *)self featureFlags];
      id v8 = [v7 groupConversations];
      uint64_t v9 = [(MPRecentsTableViewController *)self recentsController];
      int v10 = [(RecentsCallServices *)v6 initWithGroupConversationsEnabled:v8 recentsCallServicesDialer:v9];
      double v11 = self->_callServices;
      self->_callServices = v10;

      callServices = self->_callServices;
    }
    double v12 = callServices;
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (MPRecentsDetailPresenter)recentsDetailPresenter
{
  uint64_t v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v4 = [v3 useSharedRecentsViewModel];

  if (v4)
  {
    recentsDetailPresenter = self->_recentsDetailPresenter;
    if (!recentsDetailPresenter)
    {
      objc_super v6 = [MPContactsService alloc];
      id v7 = [(MPRecentsTableViewController *)self recentsController];
      id v8 = [(MPContactsService *)v6 initWithDataProvider:v7];

      uint64_t v9 = [MPRecentsDetailPresenter alloc];
      int v10 = [(MPRecentsTableViewController *)self recentsController];
      double v11 = [(MPRecentsTableViewController *)self callReportingViewModel];
      double v12 = [(MPRecentsDetailPresenter *)v9 initWithRecentsController:v10 contactsService:v8 callReportingViewModel:v11];
      double v13 = self->_recentsDetailPresenter;
      self->_recentsDetailPresenter = v12;

      recentsDetailPresenter = self->_recentsDetailPresenter;
    }
    double v14 = recentsDetailPresenter;
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)indexPathsForRecentCalls
{
  uint64_t v3 = +[NSMutableArray array];
  unsigned int v4 = [(MPRecentsTableViewController *)self recentCalls];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __56__MPRecentsTableViewController_indexPathsForRecentCalls__block_invoke;
  v8[3] = &unk_10027D9A0;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:v8];

  id v6 = [v5 copy];

  return v6;
}

void __56__MPRecentsTableViewController_indexPathsForRecentCalls__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = +[NSIndexPath indexPathForRow:a3 inSection:0];
  [v3 addObject:v4];
}

- (id)_indexPathsForCallsWithStatus:(unsigned int)a3 includeUnknown:(BOOL)a4
{
  id v7 = +[NSMutableArray array];
  id v8 = [(MPRecentsTableViewController *)self recentCalls];
  double v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  double v14 = __77__MPRecentsTableViewController__indexPathsForCallsWithStatus_includeUnknown___block_invoke;
  double v15 = &unk_10027D9C8;
  unsigned int v17 = a3;
  BOOL v18 = a4;
  id v16 = v7;
  id v9 = v7;
  [v8 enumerateObjectsUsingBlock:&v12];

  id v10 = [v9 copy:v12, v13, v14, v15];

  return v10;
}

void __77__MPRecentsTableViewController__indexPathsForCallsWithStatus_includeUnknown___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if ((*(_DWORD *)(a1 + 40) & [v8 callStatus]) != 0
    || *(unsigned char *)(a1 + 44) && (unsigned int v7 = [v8 callStatus], v7 == kCHCallStatusUnknown))
  {
    id v5 = *(void **)(a1 + 32);
    id v6 = +[NSIndexPath indexPathForRow:a3 inSection:0];
    [v5 addObject:v6];
  }
}

- (NSArray)indexPathsForMissedCalls
{
  indexPathsForMissedCalls = self->_indexPathsForMissedCalls;
  if (!indexPathsForMissedCalls)
  {
    id v4 = [(MPRecentsTableViewController *)self _indexPathsForCallsWithStatus:kCHCallStatusMissed includeUnknown:0];
    id v5 = self->_indexPathsForMissedCalls;
    self->_indexPathsForMissedCalls = v4;

    indexPathsForMissedCalls = self->_indexPathsForMissedCalls;
  }

  return indexPathsForMissedCalls;
}

- (NSArray)indexPathsForNormalCalls
{
  indexPathsForNormalCalls = self->_indexPathsForNormalCalls;
  if (!indexPathsForNormalCalls)
  {
    id v4 = [(MPRecentsTableViewController *)self _indexPathsForCallsWithStatus:kCHCallStatusAllButMissed includeUnknown:1];
    id v5 = self->_indexPathsForNormalCalls;
    self->_indexPathsForNormalCalls = v4;

    indexPathsForNormalCalls = self->_indexPathsForNormalCalls;
  }

  return indexPathsForNormalCalls;
}

void __64__MPRecentsTableViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained placeCallWithRecentCall:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)placeCallWithRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 useSharedRecentsViewModel];

  if (v6)
  {
    id v7 = [(MPRecentsTableViewController *)self callServices];
    [v7 placeCallWithRecentCall:v4];
LABEL_14:

    goto LABEL_15;
  }
  if (v4)
  {
    id v7 = objc_alloc_init((Class)TUFeatureFlags);
    unsigned int v8 = [v7 groupConversations];
    id v9 = [v4 validRemoteParticipantHandles];
    id v10 = [v9 count];
    unint64_t v11 = (unint64_t)v10;
    if (v8)
    {
      if ((unint64_t)v10 <= 1)
      {
      }
      else
      {
        double v12 = [v4 serviceProvider];
        unsigned int v13 = [v12 isEqualToString:kCHServiceProviderFaceTime];

        if (v13)
        {
          double v14 = [(MPRecentsTableViewController *)self recentsController];
          [v14 performJoinRequestForRecentCall:v4];

          goto LABEL_14;
        }
      }
      unsigned int v17 = [(MPRecentsTableViewController *)self recentsController];
      [v17 performDialRequestForRecentCall:v4];

      BOOL v18 = dispatch_get_global_queue(-32768, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __56__MPRecentsTableViewController_placeCallWithRecentCall___block_invoke;
      block[3] = &unk_10027C940;
      block[4] = self;
      id v24 = v4;
      dispatch_async(v18, block);

      id v19 = v24;
    }
    else
    {

      double v15 = [(MPRecentsTableViewController *)self recentsController];
      id v16 = v15;
      if (v11 >= 2)
      {
        [v15 performJoinRequestForRecentCall:v4];

        goto LABEL_14;
      }
      [v15 performDialRequestForRecentCall:v4];

      double v20 = dispatch_get_global_queue(-32768, 0);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = __56__MPRecentsTableViewController_placeCallWithRecentCall___block_invoke_2;
      v21[3] = &unk_10027C940;
      v21[4] = self;
      id v22 = v4;
      dispatch_async(v20, v21);

      id v19 = v22;
    }

    goto LABEL_14;
  }
LABEL_15:
}

id __56__MPRecentsTableViewController_placeCallWithRecentCall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) donateTipsEventSignalsForRecentCall:*(void *)(a1 + 40)];
}

id __56__MPRecentsTableViewController_placeCallWithRecentCall___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) donateTipsEventSignalsForRecentCall:*(void *)(a1 + 40)];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = -[MPRecentsTableViewController recentCallAtTableViewIndex:](self, "recentCallAtTableViewIndex:", [v6 row]);
  if ([(MPRecentsTableViewController *)self tapTargets])
  {
    if (v7) {
      [(MPRecentsTableViewController *)self showRecentCallDetailsViewControllerForRecentCall:v7 animated:1];
    }
    else {
      [v8 deselectRowAtIndexPath:v6 animated:0];
    }
  }
  else
  {
    [v8 deselectRowAtIndexPath:v6 animated:0];
    [(MPRecentsTableViewController *)self placeCallWithRecentCall:v7];
  }
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = -[MPRecentsTableViewController recentCallAtTableViewIndex:](self, "recentCallAtTableViewIndex:", [v6 row]);
  if (v7) {
    [(MPRecentsTableViewController *)self showRecentCallDetailsViewControllerForRecentCall:v7 animated:1];
  }
  else {
    [v8 deselectRowAtIndexPath:v6 animated:0];
  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  id v9 = -[MPRecentsTableViewController recentCallAtTableViewIndex:](self, "recentCallAtTableViewIndex:", [v7 row]);
  id v10 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v11 = [v10 useSharedRecentsViewModel];

  if (v11)
  {
    double v12 = [(MPRecentsTableViewController *)self cellConfigurator];
    unsigned int v13 = [v12 trailingSwipeActionsConfigurationForRowAt:v7 recentCall:v9];
  }
  else
  {
    double v14 = +[NSBundle mainBundle];
    double v15 = [v14 localizedStringForKey:@"DELETE" value:&stru_100285990 table:@"PHRecents"];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __93__MPRecentsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v21[3] = &unk_10027D9F0;
    objc_copyWeak(&v23, &location);
    id v22 = v7;
    id v16 = +[UIContextualAction contextualActionWithStyle:1 title:v15 handler:v21];

    unsigned int v17 = +[UIImage systemImageNamed:@"trash.fill"];
    [v16 setImage:v17];

    [v8 addObject:v16];
    BOOL v18 = [(MPRecentsTableViewController *)self reportSwipeActionForCall:v9];
    if (v18) {
      [v8 addObject:v18];
    }
    id v19 = [v8 copy];
    unsigned int v13 = +[UISwipeActionsConfiguration configurationWithActions:v19];

    objc_destroyWeak(&v23);
  }

  objc_destroyWeak(&location);

  return v13;
}

void __93__MPRecentsTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = +[NSArray arrayWithObjects:&v8 count:1];
    [WeakRetained removeRecentCallsAtIndexPaths:v7];

    v5[2](v5, 1);
  }
}

- (void)showReportingExtensionForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 useSharedRecentsViewModel];

  if (v6)
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MPRecentsTableViewController showReportingExtensionForCall:]();
    }
  }
  id v8 = objc_alloc((Class)ILCallCommunication);
  id v9 = [v4 callerId];
  id v10 = [v4 date];
  id v11 = [v8 initWithSender:v9 dateReceived:v10];

  id v12 = objc_alloc((Class)ILCallClassificationRequest);
  id v31 = v11;
  unsigned int v13 = +[NSArray arrayWithObjects:&v31 count:1];
  id v14 = [v12 initWithCallCommunications:v13];

  id v15 = objc_alloc((Class)ILClassificationUIExtensionHostViewController);
  id v16 = [v4 callerId];
  unsigned int v17 = [v4 isoCountryCode];
  id v18 = [v15 initUnactivatedVCWithRequest:v14 sender:v16 isoCountryCode:v17];
  [(MPRecentsTableViewController *)self setClassificationViewController:v18];

  id v19 = [(MPRecentsTableViewController *)self classificationViewController];
  [v19 setDelegate:self];

  double v20 = [(MPRecentsTableViewController *)self classificationViewController];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __62__MPRecentsTableViewController_showReportingExtensionForCall___block_invoke;
  v25[3] = &unk_10027D420;
  id v26 = v11;
  id v27 = v4;
  id v28 = self;
  id v21 = v4;
  id v22 = v11;
  [v20 activateExtensionWithCompletion:v25];

  id v23 = PHDefaultLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [(MPRecentsTableViewController *)self classificationViewController];
    *(_DWORD *)buf = 138412290;
    id v30 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Created classification view controller: %@, waiting for ready", buf, 0xCu);
  }
}

void __62__MPRecentsTableViewController_showReportingExtensionForCall___block_invoke(uint64_t a1)
{
  int v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v9 = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Presenting ClassificationViewController with communication: %@ for call: %@", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 40));
  unsigned int v6 = *(id **)(a1 + 48);
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained(v6 + 5);
    id v8 = [*(id *)(a1 + 48) classificationViewController];
    [v7 presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    id v7 = [*(id *)(a1 + 48) classificationViewController];
    [v6 presentViewController:v7 animated:1 completion:0];
  }
}

- (void)controller:(id)a3 didCompleteClassificationRequest:(id)a4 withResponse:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __89__MPRecentsTableViewController_controller_didCompleteClassificationRequest_withResponse___block_invoke;
  block[3] = &unk_10027CBE0;
  block[4] = self;
  id v9 = a4;
  id v10 = a5;
  id v6 = v10;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void __89__MPRecentsTableViewController_controller_didCompleteClassificationRequest_withResponse___block_invoke(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __89__MPRecentsTableViewController_controller_didCompleteClassificationRequest_withResponse___block_invoke_2;
  v3[3] = &unk_10027C940;
  int v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

void __89__MPRecentsTableViewController_controller_didCompleteClassificationRequest_withResponse___block_invoke_2(uint64_t a1)
{
  int v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Completed classification request: %@ with response: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
}

- (void)handleUIAccessibilityDarkerSystemColorsStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v9, 0x16u);
  }
  [(MPRecentsTableViewController *)self reloadTableView];
}

- (void)searchControllerBeginDragging
{
  uint64_t v3 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v4 = [v3 callHistorySearchEnabled];

  if (v4)
  {
    id v6 = [(MPRecentsTableViewController *)self searchController];
    int v5 = [v6 searchBar];
    [v5 resignFirstResponder];
  }
}

- (void)appSuspended:(id)a3
{
  id v4 = a3;
  int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v9, 0x16u);
  }
  self->_didEnterSuspended = 1;
}

- (void)applicationDidEnterBackground:(id)a3
{
  id v4 = a3;
  int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    unsigned int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v14, 0x16u);
  }
  int v9 = [(MPRecentsTableViewController *)self tabBarController];
  id v10 = [v9 selectedViewController];
  __int16 v11 = [v10 childViewControllers];
  uint64_t v12 = [v11 firstObject];

  if (v12 == self)
  {
    unsigned int v13 = [(MPRecentsTableViewController *)self recentsController];
    [v13 markRecentCallsAsRead];
  }
}

- (void)phoneApplicationDidChangeTabBarSelection:(id)a3
{
  id v4 = a3;
  int v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v13 = 138412546;
    int v14 = v6;
    __int16 v15 = 2112;
    __int16 v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v13, 0x16u);
  }
  int v9 = [v4 object];
  id v10 = [(MPRecentsTableViewController *)v9 tabBarController];
  __int16 v11 = [(MPRecentsTableViewController *)self tabBarController];

  if (v9 != self && v10 == v11)
  {
    uint64_t v12 = [(MPRecentsTableViewController *)self recentsController];
    [v12 markRecentCallsAsRead];
  }
}

- (void)contentSizeCategoryDidChange
{
  uint64_t v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Re-calculating table row height.", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __60__MPRecentsTableViewController_contentSizeCategoryDidChange__block_invoke;
  block[3] = &unk_10027C670;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id __60__MPRecentsTableViewController_contentSizeCategoryDidChange__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEditing:0 animated:0];
  int v2 = *(void **)(a1 + 32);

  return [v2 reloadTableView];
}

- (CoreTelephonyClient)ctClient
{
  ctClient = self->_ctClient;
  if (!ctClient)
  {
    id v4 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
    int v5 = self->_ctClient;
    self->_ctClient = v4;

    ctClient = self->_ctClient;
  }

  return ctClient;
}

- (UIBarButtonItem)clearButtonItem
{
  clearButtonItem = self->_clearButtonItem;
  if (!clearButtonItem)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    int v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"CLEAR" value:&stru_100285990 table:@"PHRecents"];
    id v7 = (UIBarButtonItem *)[v4 initWithTitle:v6 style:0 target:self action:"clearButtonAction:"];
    uint64_t v8 = self->_clearButtonItem;
    self->_clearButtonItem = v7;

    clearButtonItem = self->_clearButtonItem;
  }

  return clearButtonItem;
}

- (UIBarButtonItem)doneButtonItem
{
  doneButtonItem = self->_doneButtonItem;
  if (!doneButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneButtonAction:"];
    int v5 = self->_doneButtonItem;
    self->_doneButtonItem = v4;

    doneButtonItem = self->_doneButtonItem;
  }

  return doneButtonItem;
}

id __54__MPRecentsTableViewController_nicknameEditButtonItem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makePersonalNicknameMenuView];
}

void __54__MPRecentsTableViewController_nicknameEditButtonItem__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentOnboardingViewController];
}

void __54__MPRecentsTableViewController_nicknameEditButtonItem__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setEditing:1 animated:1];
}

- (_UIContentUnavailableView)contentUnavailableView
{
  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    id v4 = [_UIContentUnavailableView initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    int v5 = self->_contentUnavailableView;
    self->_contentUnavailableView = v4;

    [(_UIContentUnavailableView *)self->_contentUnavailableView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(MPRecentsTableViewController *)self tableView];
    id v7 = [v6 backgroundColor];
    [(_UIContentUnavailableView *)self->_contentUnavailableView setBackgroundColor:v7];

    uint64_t v8 = [(MPRecentsTableViewController *)self view];
    [v8 addSubview:self->_contentUnavailableView];

    int v9 = self->_contentUnavailableView;
    id v10 = [(MPRecentsTableViewController *)self view];
    __int16 v11 = +[NSLayoutConstraint constraintWithItem:v9 attribute:9 relatedBy:0 toItem:v10 attribute:9 multiplier:1.0 constant:0.0];

    uint64_t v12 = [(MPRecentsTableViewController *)self view];
    [v12 addConstraint:v11];

    int v13 = self->_contentUnavailableView;
    int v14 = [(MPRecentsTableViewController *)self view];
    __int16 v15 = +[NSLayoutConstraint constraintWithItem:v13 attribute:10 relatedBy:0 toItem:v14 attribute:10 multiplier:1.0 constant:0.0];

    __int16 v16 = [(MPRecentsTableViewController *)self view];
    [v16 addConstraint:v15];

    unsigned int v17 = self->_contentUnavailableView;
    id v18 = [(MPRecentsTableViewController *)self view];
    id v19 = +[NSLayoutConstraint constraintWithItem:v17 attribute:8 relatedBy:0 toItem:v18 attribute:8 multiplier:1.0 constant:0.0];

    double v20 = [(MPRecentsTableViewController *)self view];
    [v20 addConstraint:v19];

    id v21 = self->_contentUnavailableView;
    id v22 = [(MPRecentsTableViewController *)self view];
    id v23 = +[NSLayoutConstraint constraintWithItem:v21 attribute:7 relatedBy:0 toItem:v22 attribute:7 multiplier:1.0 constant:0.0];

    id v24 = [(MPRecentsTableViewController *)self view];
    [v24 addConstraint:v23];

    contentUnavailableView = self->_contentUnavailableView;
  }

  return contentUnavailableView;
}

- (NSOperationQueue)dataSourcePrefetchingOperationQueue
{
  dataSourcePrefetchingOperationQueue = self->_dataSourcePrefetchingOperationQueue;
  if (!dataSourcePrefetchingOperationQueue)
  {
    id v4 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    int v5 = self->_dataSourcePrefetchingOperationQueue;
    self->_dataSourcePrefetchingOperationQueue = v4;

    [(NSOperationQueue *)self->_dataSourcePrefetchingOperationQueue setMaxConcurrentOperationCount:1];
    dataSourcePrefetchingOperationQueue = self->_dataSourcePrefetchingOperationQueue;
  }

  return dataSourcePrefetchingOperationQueue;
}

- (void)setTableViewDisplayMode:(int64_t)a3
{
  if (self->_tableViewDisplayMode != a3)
  {
    self->_tableViewDisplayMode = a3;
    id v4 = [(MPRecentsTableViewController *)self indexPathsForNormalCalls];
    int v5 = [(MPRecentsTableViewController *)self tableView];
    id v6 = [v5 indexPathForSelectedRow];
    [v5 deselectRowAtIndexPath:v6 animated:0];

    +[CATransaction begin];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = __56__MPRecentsTableViewController_setTableViewDisplayMode___block_invoke;
    v13[3] = &unk_10027C940;
    v13[4] = self;
    id v7 = v5;
    id v14 = v7;
    +[CATransaction setCompletionBlock:v13];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = __56__MPRecentsTableViewController_setTableViewDisplayMode___block_invoke_2;
    v10[3] = &unk_10027DA68;
    v10[4] = self;
    id v11 = v7;
    id v12 = v4;
    id v8 = v4;
    id v9 = v7;
    [(MPRecentsTableViewController *)self performBatchUpdates:v10 completion:0];
    +[CATransaction commit];
  }
}

id __56__MPRecentsTableViewController_setTableViewDisplayMode___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) tableView];
  uint64_t v3 = [v2 tableHeaderView];

  if (v3)
  {
    [*(id *)(a1 + 40) scrollRectToVisible:1 animated:0.0, 0.0, 1.0, 1.0];
  }
  else if (![*(id *)(a1 + 32) tableViewDisplayMode] {
         && (uint64_t)[*(id *)(a1 + 32) rowCountForCurrentTableMode] >= 1)
  }
  {
    id v4 = *(void **)(a1 + 40);
    int v5 = +[NSIndexPath indexPathForItem:0 inSection:0];
    [v4 scrollToRowAtIndexPath:v5 atScrollPosition:1 animated:1];
  }
  id v6 = *(void **)(a1 + 32);

  return [v6 refreshView];
}

id __56__MPRecentsTableViewController_setTableViewDisplayMode___block_invoke_2(id result, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(*((void *)result + 4) + 240);
    if (v2 == 1)
    {
      return [*((id *)result + 5) deleteRowsAtIndexPaths:*((void *)result + 6) withRowAnimation:0];
    }
    else if (!v2)
    {
      return [*((id *)result + 5) insertRowsAtIndexPaths:*((void *)result + 6) withRowAnimation:0];
    }
  }
  return result;
}

- (void)clearButtonAction:(id)a3
{
  id v4 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  int v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"CLEAR_ALL" value:&stru_100285990 table:@"PHRecents"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __50__MPRecentsTableViewController_clearButtonAction___block_invoke;
  v11[3] = &unk_10027CC60;
  v11[4] = self;
  id v7 = +[UIAlertAction actionWithTitle:v6 style:2 handler:v11];

  [v4 addAction:v7];
  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_100285990 table:@"PHRecents"];
  id v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:0];

  [v4 addAction:v10];
  [(MPRecentsTableViewController *)self presentViewController:v4 animated:1 completion:0];
}

id __50__MPRecentsTableViewController_clearButtonAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeAllRecentCalls];
}

- (void)doneButtonAction:(id)a3
{
}

- (void)selectedSegmentDidChangeForSender:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self tableViewDisplayModeSegmentedControl];

  if (v5 == v4)
  {
    [(MPRecentsTableViewController *)self setEditing:0 animated:0];
    id v6 = [(MPRecentsTableViewController *)self tableViewDisplayModeSegmentedControl];
    BOOL v7 = [v6 selectedSegmentIndex] != 0;

    [(MPRecentsTableViewController *)self setTableViewDisplayMode:v7];
  }
}

- (void)removeAllRecentCalls
{
  uint64_t v3 = [(MPRecentsTableViewController *)self recentCalls];
  [v3 removeAllObjects];

  [(MPRecentsTableViewController *)self setIndexPathsForMissedCalls:0];
  [(MPRecentsTableViewController *)self setIndexPathsForNormalCalls:0];
  +[CATransaction begin];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __52__MPRecentsTableViewController_removeAllRecentCalls__block_invoke;
  v11[3] = &unk_10027C670;
  v11[4] = self;
  +[CATransaction setCompletionBlock:v11];
  id v4 = [(MPRecentsTableViewController *)self recentCalls];
  id v5 = [v4 count];

  if (!v5)
  {
    id v6 = [(MPRecentsTableViewController *)self tableView];
    [v6 beginUpdates];

    BOOL v7 = +[NSIndexSet indexSetWithIndex:0];
    id v8 = [(MPRecentsTableViewController *)self tableView];
    [v8 deleteSections:v7 withRowAnimation:100];

    id v9 = [(MPRecentsTableViewController *)self tableView];
    [v9 insertSections:v7 withRowAnimation:100];

    id v10 = [(MPRecentsTableViewController *)self tableView];
    [v10 endUpdates];
  }
  +[CATransaction commit];
}

void __52__MPRecentsTableViewController_removeAllRecentCalls__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEditing:0 animated:1];
  [*(id *)(a1 + 32) setContentUnavailable:1 animated:1];
  id v2 = [*(id *)(a1 + 32) recentsController];
  [v2 deleteAllRecentCalls];
}

- (void)removeRecentCallsAtIndexPaths:(id)a3
{
  id v4 = a3;
  +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __62__MPRecentsTableViewController_removeRecentCallsAtIndexPaths___block_invoke;
  v9[3] = &unk_10027DA68;
  v9[4] = self;
  id v10 = v4;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __62__MPRecentsTableViewController_removeRecentCallsAtIndexPaths___block_invoke_238;
  v7[3] = &unk_10027C8F0;
  v7[4] = self;
  id v8 = v11;
  id v5 = v11;
  id v6 = v4;
  [(MPRecentsTableViewController *)self performBatchUpdates:v9 completion:v7];
}

void __62__MPRecentsTableViewController_removeRecentCallsAtIndexPaths___block_invoke(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) tableView];
  if ((uint64_t)[v4 numberOfSections] < 1)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) tableView];
    id v6 = [v5 numberOfRowsInSection:0];
  }
  BOOL v7 = +[NSOrderedSet orderedSetWithArray:*(void *)(a1 + 40)];
  id v8 = +[NSMutableSet set];
  +[NSMutableSet set];
  id v25 = _NSConcreteStackBlock;
  uint64_t v26 = 3221225472;
  id v27 = __62__MPRecentsTableViewController_removeRecentCallsAtIndexPaths___block_invoke_2;
  id v28 = &unk_10027DA90;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = *(void *)(a1 + 32);
  id v29 = v9;
  uint64_t v30 = v10;
  id v31 = *(id *)(a1 + 48);
  id v11 = v8;
  id v32 = v11;
  [v7 enumerateObjectsWithOptions:2 usingBlock:&v25];
  if (objc_msgSend(v9, "count", v25, v26, v27, v28))
  {
    [*(id *)(a1 + 32) setIndexPathsForMissedCalls:0];
    [*(id *)(a1 + 32) setIndexPathsForNormalCalls:0];
  }
  id v12 = [*(id *)(a1 + 32) tableView];
  [v12 setUserInteractionEnabled:0];

  int v13 = PHDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [*(id *)(a1 + 32) rowCountForCurrentTableMode];
    *(_DWORD *)buf = 134218240;
    id v34 = v6;
    __int16 v35 = 2048;
    id v36 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Beginning table view updates from row count %ld to %ld", buf, 0x16u);
  }

  if (a2)
  {
    if ([v11 count])
    {
      __int16 v15 = PHDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = [v11 count];
        unsigned int v17 = [v11 allObjects];
        *(_DWORD *)buf = 134218242;
        id v34 = v16;
        __int16 v35 = 2112;
        id v36 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Reloading %ld row(s): %@", buf, 0x16u);
      }
      id v18 = [*(id *)(a1 + 32) tableView];
      id v19 = [v11 allObjects];
      [v18 reloadRowsAtIndexPaths:v19 withRowAnimation:100];
    }
    if ([v9 count])
    {
      double v20 = PHDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = [v9 count];
        id v22 = [v9 allObjects];
        *(_DWORD *)buf = 134218242;
        id v34 = v21;
        __int16 v35 = 2112;
        id v36 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Deleting %ld row(s): %@", buf, 0x16u);
      }
      id v23 = [*(id *)(a1 + 32) tableView];
      id v24 = [v9 allObjects];
      [v23 deleteRowsAtIndexPaths:v24 withRowAnimation:2];
    }
  }
}

void __62__MPRecentsTableViewController_removeRecentCallsAtIndexPaths___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = (char *)[v3 row];
  id v5 = PHDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing recent call at row %ld", buf, 0xCu);
  }

  if (([a1[4] containsObject:v3] & 1) == 0)
  {
    id v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding call (row %ld) to set to be removed from table view", buf, 0xCu);
    }

    [a1[4] addObject:v3];
  }
  BOOL v7 = [a1[5] recentCallAtTableViewIndex:v4];
  if (v7 && ([a1[6] containsObject:v7] & 1) == 0)
  {
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      id v32 = v4;
      __int16 v33 = 2112;
      id v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding call (row %ld) to array to be removed from recentsController: %@", buf, 0x16u);
    }

    [a1[6] addObject:v7];
  }
  id v9 = v4 - 1;
  uint64_t v10 = [a1[5] recentCallAtTableViewIndex:v4 - 1];
  id v11 = v4 + 1;
  uint64_t v12 = [a1[5] recentCallAtTableViewIndex:v4 + 1];
  int v13 = (void *)v12;
  if (v10 && v12)
  {
    id v14 = PHDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      id v32 = v9;
      __int16 v33 = 2048;
      id v34 = v11;
      __int16 v35 = 2112;
      id v36 = v10;
      __int16 v37 = 2112;
      v38 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Coalescing adjacent calls at indices %ld and %ld with PHRecentsController. Preceeding call: %@. Succeeding call: %@", buf, 0x2Au);
    }

    __int16 v15 = [a1[5] recentsController];
    id v16 = [v15 coalesceRecentCall:v10 withRecentCall:v13];

    if (v16)
    {
      unsigned int v17 = PHDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        id v32 = v9;
        __int16 v33 = 2048;
        id v34 = v11;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Coalescing call in table view at row %ld with call at row %ld", buf, 0x16u);
      }

      id v18 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, [v3 section]);
      if (([a1[7] containsObject:v18] & 1) == 0)
      {
        id v19 = PHDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v32 = v9;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Adding preceding call (row %ld) to set to be reloaded in table view", buf, 0xCu);
        }

        [a1[7] addObject:v18];
      }
      double v20 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, [v3 section]);
      if (([a1[4] containsObject:v20] & 1) == 0)
      {
        id v21 = PHDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v32 = v11;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Adding succeeding call (row %ld) to set to be removed from table view", buf, 0xCu);
        }

        [a1[4] addObject:v20];
        if ([a1[7] containsObject:v20])
        {
          id v22 = PHDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            id v32 = v11;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Removing succeeding call (row %ld) from set to be reloaded in table view", buf, 0xCu);
          }

          [a1[7] removeObject:v20];
        }
        id v23 = [a1[5] recentCalls];
        id v24 = [v23 indexOfObjectIdenticalTo:v10];

        if (v24 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v25 = PHDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Replacing preceeding call with coalesced call in recent calls list", buf, 2u);
          }

          uint64_t v26 = [a1[5] recentCalls];
          [v26 setObject:v16 atIndexedSubscript:v24];
        }
        id v27 = PHDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Removing succeeding call from recentCalls array", buf, 2u);
        }

        id v28 = [a1[5] recentCalls];
        [v28 removeObject:v13];
      }
    }
  }
  id v29 = PHDefaultLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Removing call from recentCalls array: %@", buf, 0xCu);
  }

  uint64_t v30 = [a1[5] recentCalls];
  [v30 removeObject:v7];
}

void __62__MPRecentsTableViewController_removeRecentCallsAtIndexPaths___block_invoke_238(uint64_t a1)
{
  id v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) rowCountForCurrentTableMode];
    int v9 = 134217984;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Completed table view updates, row count == %ld", (uint8_t *)&v9, 0xCu);
  }

  if (![*(id *)(a1 + 32) rowCountForCurrentTableMode])
  {
    [*(id *)(a1 + 32) setEditing:0 animated:1];
    [*(id *)(a1 + 32) setContentUnavailable:1 animated:1];
  }
  id v4 = [*(id *)(a1 + 32) recentsController];
  [v4 deleteRecentCalls:*(void *)(a1 + 40)];

  id v5 = [*(id *)(a1 + 32) tableView];
  [v5 setUserInteractionEnabled:1];

  id v6 = *(void **)(a1 + 32);
  BOOL v7 = (void *)v6[12];
  if (v7)
  {
    id v8 = [v6 recentCalls];
    [v7 tableViewController:v6 didChangeCalls:v8];
  }
}

- (id)contactViewControllerForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self recentsController];
  id v6 = +[PHContactViewController descriptorForRequiredKeys];
  uint64_t v12 = v6;
  BOOL v7 = +[NSArray arrayWithObjects:&v12 count:1];
  id v8 = [v5 contactForRecentCall:v4 keyDescriptors:v7];

  if (v8 || (id v8 = objc_alloc_init((Class)CNContact)) != 0)
  {
    int v9 = [(MPRecentsTableViewController *)self contactViewControllerForRecentCall:v4 contact:v8];
  }
  else
  {
    int v9 = 0;
  }
  id v10 = [v4 imageURL];

  if (v10) {
    [v9 setUsesBrandedCallHeaderFormat:1];
  }

  return v9;
}

- (id)contactViewControllerForRecentCall:(id)a3 contact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 contactIdentifier];
  if ([v8 length])
  {
    int v9 = [(MPRecentsTableViewController *)self recentsController];
    uint64_t v10 = [v9 fetchContactForContactCardDisplay:v7];

    id v11 = +[PHContactViewController viewControllerForContact:v10];
    [v11 setShouldShowLinkedContacts:1];
    id v7 = (id)v10;
  }
  else
  {
    id v11 = +[PHContactViewController viewControllerForUnknownContact:v7];
  }
  uint64_t v12 = [v6 validRemoteParticipantHandles];
  int v13 = [v12 anyObject];
  id v14 = [v13 value];
  id v15 = [v14 length];

  if (v15)
  {
    id v16 = [(MPRecentsTableViewController *)self callReportingViewModel];
    unsigned int v17 = [v16 shouldShowContactBlockReportButtonForCall:v6];

    unint64_t v18 = (unint64_t)[v11 actions];
    uint64_t v19 = 128;
    if (v17) {
      uint64_t v19 = 2048;
    }
    [v11 setActions:v18 | v19];
    double v20 = +[CNContactStore suggestedContactStore];
    [v11 setContactStore:v20];

    [v11 setRecentCall:v6];
  }
  else
  {
    [v11 setAllowsActions:0];
    [v11 setAllowsEditing:0];
    unsigned __int8 v21 = [v6 callerIdIsBlocked];
    id v22 = +[NSBundle mainBundle];
    id v23 = v22;
    if (v21) {
      CFStringRef v24 = @"NO_CALLER_ID";
    }
    else {
      CFStringRef v24 = @"UNKNOWN_CALLER";
    }
    id v25 = [v22 localizedStringForKey:v24 value:&stru_100285990 table:@"PHRecents"];
    [v11 setAlternateName:v25];
  }
  uint64_t v26 = [(MPRecentsTableViewController *)self recentsController];
  id v27 = [v26 itemForRecentCall:v6 presentationStyle:1];

  id v28 = objc_alloc_init(MPRecentsContactHeaderViewController);
  [(MPRecentsContactHeaderViewController *)v28 setRecentCall:v6];
  [(MPRecentsContactHeaderViewController *)v28 setRecentsItem:v27];
  [v11 setContactHeaderViewController:v28];

  return v11;
}

- (int64_t)avatarCardController:(id)a3 presentationResultForLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(MPRecentsTableViewController *)self tableView];
  if ([v8 isDecelerating]) {
    goto LABEL_2;
  }
  uint64_t v10 = [(MPRecentsTableViewController *)self tableView];
  if ([v10 isDragging])
  {
    int64_t v9 = 1;
    goto LABEL_9;
  }
  id v11 = [(MPRecentsTableViewController *)self tableView];
  unsigned __int8 v12 = [v11 isEditing];

  if ((v12 & 1) == 0)
  {
    int v13 = [(MPRecentsTableViewController *)self tableView];
    id v14 = [(MPRecentsTableViewController *)self view];
    id v15 = [(MPRecentsTableViewController *)self tableView];
    [v14 convertPoint:v15 toView:x, y];
    id v8 = [v13 indexPathForRowAtPoint:];

    if (!v8)
    {
LABEL_2:
      int64_t v9 = 1;
LABEL_10:

      goto LABEL_11;
    }
    id v16 = [(MPRecentsTableViewController *)self tableView];
    uint64_t v10 = [v16 cellForRowAtIndexPath:v8];

    [v7 setHighlightView:v10];
    unsigned int v17 = [(MPRecentsTableViewController *)self tableView];
    [v10 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    uint64_t v26 = [v7 sourceView];
    [v17 convertRect:v26 toView:v19];
    [v7 setSourceRect:];

    int64_t v9 = [(MPRecentsTableViewController *)self configureCardController:v7 presentationResultForIndex:v8];
LABEL_9:

    goto LABEL_10;
  }
  int64_t v9 = 1;
LABEL_11:

  return v9;
}

- (int64_t)configureCardController:(id)a3 presentationResultForIndex:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    int64_t v9 = -[MPRecentsTableViewController recentCallAtTableViewIndex:](self, "recentCallAtTableViewIndex:", [v7 row]);
    uint64_t v10 = [(MPRecentsTableViewController *)self featureFlags];
    unsigned int v11 = [v10 useSharedRecentsViewModel];

    if (v11)
    {
      unsigned __int8 v12 = [(MPRecentsTableViewController *)self cellConfigurator];
      int64_t v13 = (int64_t)[v12 configureCardController:v6 presentationResultForRecentCall:v9];
    }
    else
    {
      id v14 = [(MPRecentsTableViewController *)self recentsController];
      id v15 = +[CNAvatarCardController descriptorForRequiredKeys];
      double v21 = v15;
      id v16 = +[NSArray arrayWithObjects:&v21 count:1];
      unsigned __int8 v12 = [v14 contactForRecentCall:v9 keyDescriptors:v16];

      if (v12)
      {
        [v6 setContact:v12];
        unsigned int v17 = [(MPRecentsTableViewController *)self recentsController];
        double v18 = [v17 itemForRecentCall:v9];
        double v19 = [v18 localizedSubtitle];
        [v6 setMessage:v19];

        int64_t v13 = 0;
      }
      else
      {
        int64_t v13 = 2;
      }
    }
  }
  else
  {
    int64_t v13 = 1;
  }

  return v13;
}

- (void)contactViewController:(id)a3 didExecuteBlockAndReportContactAction:(id)a4
{
  id v5 = a3;
  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "didExecuteBlockAndReportContactAction", buf, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "viewController is PHContactViewController", v10, 2u);
    }

    id v8 = [v5 recentCall];
    int64_t v9 = [(MPRecentsTableViewController *)self callReportingViewModel];
    [v9 reportWithCall:v8];
  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v7 = [v17 contact];
  if ((id)v7 != v6)
  {
    id v8 = (void *)v7;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v10 = [v17 recentCall];
      if (v10)
      {
        unsigned int v11 = [(MPRecentsTableViewController *)self contactViewControllerForRecentCall:v10 contact:v6];
        unsigned __int8 v12 = v11;
        if (v11)
        {
          [v11 setContact:v6];
          uint64_t v13 = 0;
LABEL_11:
          +[TPTipsHelper donateEventSavedNumber];
          +[TUDiscoverabilitySignal logAnalyticsEventPhoneRecentlyDialed];
          goto LABEL_12;
        }
      }
      else
      {
        unsigned __int8 v12 = 0;
      }
      uint64_t v13 = 1;
      goto LABEL_11;
    }
LABEL_7:
    unsigned __int8 v12 = 0;
    uint64_t v13 = 1;
    goto LABEL_13;
  }
  unsigned __int8 v12 = 0;
  uint64_t v13 = 1;
  uint64_t v10 = v6;
LABEL_12:

LABEL_13:
  id v14 = [(MPRecentsTableViewController *)self navigationController];
  id v15 = [v14 popViewControllerAnimated:v13];

  if (v12)
  {
    id v16 = [(MPRecentsTableViewController *)self navigationController];
    [v16 pushViewController:v12 animated:v13];
  }
}

- (void)makeUIForDefaultPNG
{
  id v4 = [(MPRecentsTableViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:0];
  [v4 setRightBarButtonItem:0];
  [(MPRecentsTableViewController *)self setContentUnavailableViewTitle:0];
  [(MPRecentsTableViewController *)self setTabBarItem:0];
  id v3 = [(MPRecentsTableViewController *)self tableView];
  [v3 setHidden:1];

  [(MPRecentsTableViewController *)self setTitle:0];
}

- (void)reloadTableView
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "Reloading TableView that is not in the window hierarchy", v2, v3, v4, v5, v6);
}

- (void)refreshView
{
  uint64_t v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Asked to refresh View", buf, 2u);
  }

  if ([(MPRecentsTableViewController *)self canPerformTableViewUpdates])
  {
    uint64_t v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Did refresh View", v5, 2u);
    }

    [(MPRecentsTableViewController *)self setContentUnavailable:[(MPRecentsTableViewController *)self rowCountForCurrentTableMode] == 0 animated:0];
    [(MPRecentsTableViewController *)self reloadTableView];
  }
}

- (void)showRecentCallDetailsViewControllerForRecentCall:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [(MPRecentsTableViewController *)self featureFlags];
  if (![v4 unknownInitiatorReportEnabled]) {
    goto LABEL_6;
  }
  uint64_t v5 = [(MPRecentsTableViewController *)self callReportingViewModel];
  if (([v5 atLeastOneUnknownCallerInRecentCall:v11] & 1) == 0)
  {

LABEL_6:
    id v7 = v11;
    goto LABEL_7;
  }
  unsigned int v6 = [v11 isIncoming];

  id v7 = v11;
  if (v6)
  {
    uint64_t v8 = [(MPRecentsTableViewController *)self multipleContactsBlockViewControllerForRecentCall:v11];
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v8 = [(MPRecentsTableViewController *)self multipleContactsViewControllerForRecentCall:v7];
LABEL_8:
  int64_t v9 = (void *)v8;
  if (v8)
  {
    uint64_t v10 = [(MPRecentsTableViewController *)self navigationController];
    [v10 pushViewController:v9 animated:1];
  }
}

- (void)showRecentCallDetailsViewControllerForRecentCall:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v8 = [v7 useSharedRecentsViewModel];

  if (v8)
  {
    int64_t v9 = [(MPRecentsTableViewController *)self recentsDetailPresenter];
    uint64_t v10 = [(MPRecentsTableViewController *)self navigationController];
    [v9 showRecentCallDetailsViewControllerFor:v6 from:v10];
  }
  else
  {
    +[TPTipsHelper updateCanDisplayCallHistorySearchTip:0];
    id v11 = [v6 validRemoteParticipantHandles];
    id v12 = [v11 count];

    if ((unint64_t)v12 < 2)
    {
      uint64_t v13 = [v6 contactIdentifier];
      id v14 = [(MPRecentsTableViewController *)self contactViewControllerForRecentCall:v6];
      if (v13 && [v13 length])
      {
        [v14 setDelegate:self];
        id v15 = [(MPRecentsTableViewController *)self navigationController];
        [v15 pushViewController:v14 animated:v4];
      }
      else
      {
        id v16 = [v6 callerId];
        id v17 = v6;
        id v18 = v14;
        TUMapItemForDestinationID();
      }
    }
    else
    {
      [(MPRecentsTableViewController *)self showRecentCallDetailsViewControllerForRecentCall:v6];
    }
  }
}

void __90__MPRecentsTableViewController_showRecentCallDetailsViewControllerForRecentCall_animated___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (v12)
  {
    uint64_t v3 = objc_alloc_init(MPRecentsMapItemHeaderViewController);
    [(MPRecentsMapItemHeaderViewController *)v3 setRecentCall:*(void *)(a1 + 32)];
    id v4 = objc_alloc_init((Class)MUPlaceViewControllerConfiguration);
    [v4 setHeaderViewController:v3];
    id v5 = [objc_alloc((Class)MUPlaceViewController) initWithConfiguration:v4];
    [v5 setMapItem:v12];
    id v6 = [v5 navigationItem];
    [v6 setLargeTitleDisplayMode:2];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) identityExtension];
    if (v7)
    {
      [*(id *)(a1 + 40) setMessage:v7];
    }
    else
    {
      unsigned int v8 = [*(id *)(a1 + 48) recentsController];
      int64_t v9 = [v8 itemForRecentCall:*(void *)(a1 + 32) presentationStyle:1];
      uint64_t v10 = [v9 localizedSubtitle];
      [*(id *)(a1 + 40) setMessage:v10];
    }
    [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 48)];
    id v5 = *(id *)(a1 + 40);
  }
  id v11 = [*(id *)(a1 + 48) navigationController];
  [v11 pushViewController:v5 animated:*(unsigned __int8 *)(a1 + 56)];
}

- (void)showRecentCallDetailsViewControllerForRecentCall:(id)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v11 = [v10 callHistorySearchEnabled];

  if (v11)
  {
    +[TPTipsHelper updateCanDisplayCallHistorySearchTip:0];
    id v12 = [v8 validRemoteParticipantHandles];
    id v13 = [v12 count];

    if ((unint64_t)v13 < 2)
    {
      id v14 = [v8 contactIdentifier];
      id v15 = [(MPRecentsTableViewController *)self contactViewControllerForRecentCall:v8];
      if (v14 && [v14 length])
      {
        [v15 setDelegate:self];
        [v9 pushViewController:v15 animated:v5];
      }
      else
      {
        id v16 = [v8 callerId];
        id v17 = v8;
        id v18 = v15;
        id v19 = v9;
        TUMapItemForDestinationID();
      }
    }
    else
    {
      [(MPRecentsTableViewController *)self showRecentCallDetailsViewControllerForRecentCall:v8];
    }
  }
}

void __111__MPRecentsTableViewController_showRecentCallDetailsViewControllerForRecentCall_navigationController_animated___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  if (v11)
  {
    uint64_t v3 = objc_alloc_init(MPRecentsMapItemHeaderViewController);
    [(MPRecentsMapItemHeaderViewController *)v3 setRecentCall:*(void *)(a1 + 32)];
    id v4 = objc_alloc_init((Class)MUPlaceViewControllerConfiguration);
    [v4 setHeaderViewController:v3];
    id v5 = [objc_alloc((Class)MUPlaceViewController) initWithConfiguration:v4];
    [v5 setMapItem:v11];
    id v6 = [v5 navigationItem];
    [v6 setLargeTitleDisplayMode:2];
  }
  else
  {
    id v7 = [*(id *)(a1 + 32) identityExtension];
    if (v7)
    {
      [*(id *)(a1 + 40) setMessage:v7];
    }
    else
    {
      id v8 = [*(id *)(a1 + 48) recentsController];
      id v9 = [v8 itemForRecentCall:*(void *)(a1 + 32) presentationStyle:1];
      uint64_t v10 = [v9 localizedSubtitle];
      [*(id *)(a1 + 40) setMessage:v10];
    }
    [*(id *)(a1 + 40) setDelegate:*(void *)(a1 + 48)];
    id v5 = *(id *)(a1 + 40);
  }
  [*(id *)(a1 + 56) pushViewController:v5 animated:*(unsigned __int8 *)(a1 + 64)];
}

- (id)multipleContactsViewControllerForRecentCall:(id)a3
{
  id v4 = a3;
  id v31 = self;
  id v5 = [(MPRecentsTableViewController *)self recentsController];
  id v6 = +[PHContactViewController descriptorForRequiredKeys];
  id v39 = v6;
  id v7 = +[NSArray arrayWithObjects:&v39 count:1];
  uint64_t v8 = [v5 contactByHandleForRecentCall:v4 keyDescriptors:v7];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v10 = (void *)v8;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v32 = v4;
  id v12 = [v4 validRemoteParticipantHandles];
  id v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v35;
    id v29 = v10;
    id v30 = v9;
    uint64_t v28 = *(void *)v35;
    do
    {
      id v16 = 0;
      id v33 = v14;
      do
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v16);
        [v10 objectForKeyedSubscript:v17, v28];
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          id v19 = [v17 tuHandle];
          if (v19)
          {
            double v20 = [v32 isoCountryCode];
            double v21 = [(MPRecentsTableViewController *)v31 recentsController];
            [v21 metadataCache];
            double v23 = v22 = v11;
            +[CNMutableContact contactForHandle:v19 isoCountryCode:v20 metadataCache:v23];
            v25 = double v24 = v12;
            id v18 = [v25 copy];

            id v12 = v24;
            id v11 = v22;
            id v14 = v33;

            uint64_t v15 = v28;
            uint64_t v10 = v29;
            id v9 = v30;
          }
          else
          {
            id v18 = 0;
          }
        }
        [v9 addObject:v18];
        [v11 addObject:v17];

        id v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }

  if (v9) {
    uint64_t v26 = [[PHContactsTableViewController alloc] initWithContactArray:v9 contactHandles:v11];
  }
  else {
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)multipleContactsBlockViewControllerForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self contactsForRecentCall:v4];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  id v7 = [(MPRecentsTableViewController *)self unknownContactForRecentCall:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = [v4 validRemoteParticipantHandles];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 addObject:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  if (v5)
  {
    BOOL v13 = [(CallReportingViewModel *)self->_callReportingViewModel isInitiatorUnknownForCall:v4];
    BOOL v14 = [(CallReportingViewModel *)self->_callReportingViewModel allUnknownContactInRecentCall:v4];
    BOOL v15 = !v14
       && [(CallReportingViewModel *)self->_callReportingViewModel atLeastOneUnknownCallerInRecentCall:v4];
    id v17 = objc_alloc_init(_TtC11MobilePhone25FaceTimeSpamReportManager);
    id v18 = [[PHContactsReportAndBlockTableViewModel alloc] initWithShouldShowBlockAll:v14 shouldShowReportInitiator:v13 shouldShowBlockUnknown:v15 recentCall:v4 reportSpammer:v17];
    id v16 = [[PHContactsAndBlockTableViewController alloc] initWithContactArray:v5 unknownContacts:v7 contactHandles:v6 tableViewModel:v18];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)unknownContactForRecentCall:(id)a3
{
  id v4 = a3;
  double v25 = self;
  id v5 = [(MPRecentsTableViewController *)self recentsController];
  id v6 = +[PHContactViewController descriptorForRequiredKeys];
  id v33 = v6;
  id v7 = +[NSArray arrayWithObjects:&v33 count:1];
  uint64_t v8 = [v5 contactByHandleForRecentCall:v4 keyDescriptors:v7];

  id v26 = objc_alloc_init((Class)NSMutableArray);
  id v27 = v4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v9 = [v4 validRemoteParticipantHandles];
  id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v29;
    uint64_t v24 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v8 objectForKeyedSubscript:v14, v24];
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          id v16 = [v14 tuHandle];
          if (v16)
          {
            id v17 = [v27 isoCountryCode];
            id v18 = [(MPRecentsTableViewController *)v25 recentsController];
            [v18 metadataCache];
            long long v20 = v19 = v9;
            +[CNMutableContact contactForHandle:v16 isoCountryCode:v17 metadataCache:v20];
            v22 = long long v21 = v8;
            id v15 = [v22 copy];

            uint64_t v8 = v21;
            id v9 = v19;
            uint64_t v12 = v24;

            [v26 addObject:v15];
          }
          else
          {
            id v15 = 0;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  return v26;
}

- (id)contactsForRecentCall:(id)a3
{
  id v4 = a3;
  long long v29 = self;
  id v5 = [(MPRecentsTableViewController *)self recentsController];
  id v6 = +[PHContactViewController descriptorForRequiredKeys];
  long long v37 = v6;
  id v7 = +[NSArray arrayWithObjects:&v37 count:1];
  uint64_t v8 = [v5 contactByHandleForRecentCall:v4 keyDescriptors:v7];

  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v10 = objc_alloc_init((Class)NSMutableArray);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v30 = v4;
  id v11 = [v4 validRemoteParticipantHandles];
  id v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v33;
    id v27 = v11;
    id v28 = v10;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v8 objectForKeyedSubscript:v16, v26];
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          id v18 = [v16 tuHandle];
          if (v18)
          {
            long long v31 = [v30 isoCountryCode];
            id v19 = [(MPRecentsTableViewController *)v29 recentsController];
            long long v20 = [v19 metadataCache];
            +[CNMutableContact contactForHandle:v18 isoCountryCode:v31 metadataCache:v20];
            id v21 = v13;
            id v22 = v9;
            v24 = long long v23 = v8;
            id v17 = [v24 copy];

            uint64_t v8 = v23;
            id v9 = v22;
            id v13 = v21;

            uint64_t v14 = v26;
            id v11 = v27;

            id v10 = v28;
          }
          else
          {
            id v17 = 0;
          }
        }
        [v9 addObject:v17];
        [v10 addObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v13);
  }

  return v9;
}

- (MPRecentsUnknownCallersViewController)unknownCallersViewController
{
  unknownCallersViewController = self->_unknownCallersViewController;
  if (!unknownCallersViewController)
  {
    id v4 = [MPRecentsUnknownCallersViewController alloc];
    id v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"TURN_ON_CALL_SILENCING" value:&stru_100285990 table:@"PHRecents"];
    id v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"SILENCE_UNKNOWN_CALLERS_DETAIL" value:&stru_100285990 table:@"PHRecents"];
    id v9 = +[UIImage imageNamed:@"unknown-callers-sheet"];
    id v10 = [(MPRecentsUnknownCallersViewController *)v4 initWithTitle:v6 detailText:v8 icon:v9];
    id v11 = self->_unknownCallersViewController;
    self->_unknownCallersViewController = v10;

    [(MPRecentsUnknownCallersViewController *)self->_unknownCallersViewController setDelegate:self];
    unknownCallersViewController = self->_unknownCallersViewController;
  }

  return unknownCallersViewController;
}

- (void)presentUnknownCallersViewController
{
  id v3 = objc_alloc((Class)UINavigationController);
  id v4 = [(MPRecentsTableViewController *)self unknownCallersViewController];
  id v5 = [v3 initWithRootViewController:v4];

  [(MPRecentsTableViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)dismissUnknownCallersViewController:(id)a3
{
  if (self->_unknownCallersViewController == a3) {
    [a3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)unknownCallersViewControllerDidRequestEnable:(id)a3
{
  [(MPRecentsTableViewController *)self dismissUnknownCallersViewController:a3];
  id v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User enabled Silence Unknown Callers via Phone > Recents", v6, 2u);
  }

  id v4 = objc_alloc((Class)NSUserDefaults);
  id v5 = [v4 initWithSuiteName:TUBundleIdentifierTelephonyUtilitiesFramework];
  [v5 setValue:&__kCFBooleanTrue forKey:TUCallFilteringPreferencesContactsOnlyKey];

  +[TPTipsHelper donateEventKnownCallersDone];
}

BOOL __65__MPRecentsTableViewController_recentsController_didChangeCalls___block_invoke(id a1, CHRecentCall *a2, NSDictionary *a3)
{
  unsigned int v3 = [(CHRecentCall *)a2 callStatus];
  return (kCHCallStatusMissed & v3) != 0;
}

void __65__MPRecentsTableViewController_recentsController_didChangeCalls___block_invoke_278(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 40) mutableCopy];
  [*(id *)(a1 + 32) setRecentCalls:v4];

  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) tableView];
    [v5 insertRowsAtIndexPaths:*(void *)(a1 + 48) withRowAnimation:100];
  }
}

- (void)recentsController:(id)a3 didUpdateCalls:(id)a4
{
  id v5 = a4;
  id v6 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v7 = [v6 phoneRecentsAvatarsEnabled];

  if (v7)
  {
    uint64_t v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_opt_class();
      id v10 = v9;
      int v15 = 138412546;
      id v16 = v9;
      __int16 v17 = 2048;
      id v18 = [v5 count];
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ is handling recent calls update for calls count : %lu", (uint8_t *)&v15, 0x16u);
    }
    if ([(MPRecentsTableViewController *)self isViewLoaded]
      && ([(MPRecentsTableViewController *)self isEditing] & 1) == 0)
    {
      id v11 = PHDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Synchronizing recents table view with recents data source", (uint8_t *)&v15, 2u);
      }

      id v12 = [(MPRecentsTableViewController *)self callsWithValidHandles:v5];
      if ((id)[(MPRecentsTableViewController *)self tableViewDisplayMode] == (id)1)
      {
        id v13 = +[NSPredicate predicateWithBlock:&__block_literal_global_280];
        uint64_t v14 = [v12 filteredArrayUsingPredicate:v13];

        id v12 = (void *)v14;
      }
      [(MPRecentsTableViewController *)self reconfiguringCellsForCalls:v12];
    }
    else
    {
      [(MPRecentsTableViewController *)self setDataSourceNeedsReload:1];
    }
  }
}

BOOL __65__MPRecentsTableViewController_recentsController_didUpdateCalls___block_invoke(id a1, CHRecentCall *a2, NSDictionary *a3)
{
  unsigned int v3 = [(CHRecentCall *)a2 callStatus];
  return (kCHCallStatusMissed & v3) != 0;
}

- (void)recentsController:(id)a3 didChangeUnreadCallCount:(unint64_t)a4
{
  id v6 = PHDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = objc_opt_class();
    id v8 = v7;
    id v9 = [(MPRecentsTableViewController *)self tabBarItem];
    id v10 = [v9 badgeValue];
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling unread call count change from %@ to %lu", (uint8_t *)&v11, 0x20u);
  }
  [(MPRecentsTableViewController *)self updateTabBarItemWithCount:a4];
}

- (void)recentsControllerDidChangeMessages:(id)a3
{
  id v5 = a3;
  if ([(MPRecentsTableViewController *)self isViewLoaded]
    && ([(MPRecentsTableViewController *)self isEditing] & 1) == 0)
  {
    id v4 = [v5 recentCalls];
    [(MPRecentsTableViewController *)self reloadDataSourceForCalls:v4];
  }
  else
  {
    [(MPRecentsTableViewController *)self setDataSourceNeedsReload:1];
  }
}

- (void)pushVoicemailMessageDetailsViewControllerForMessage:(id)a3
{
  id v9 = a3;
  id v4 = [(MPRecentsTableViewController *)self navigationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [PHVoicemailMessageDetailViewController alloc];
    unsigned int v7 = [v5 voicemailController];
    id v8 = [(PHVoicemailMessageDetailViewController *)v6 initWithMessage:v9 navigationController:v5 voicemailController:v7];

    [(PHVoicemailMessageDetailViewController *)v8 setDelegate:self];
    [v5 pushViewController:v8 animated:1];
  }
}

- (void)donateTipsEventSignalsForRecentCall:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 useSharedRecentsViewModel];

  if (v6)
  {
    unsigned int v7 = objc_opt_new();
    [v7 donateTipsEventSignalsForRecentCall:v4 completion:&__block_literal_global_288];
    goto LABEL_25;
  }
  id v8 = [v4 contactIdentifier];
  unsigned int v7 = v8;
  if (v8 && [v8 length])
  {
    id v9 = @"DonatedBiomeSignalForFavoriteKnownContact";
    int v10 = 1;
  }
  else
  {
    int v10 = 0;
    id v9 = @"DonatedBiomeSignalForSaveUnknownContact";
  }
  int v11 = (void *)TUBundleIdentifierMobilePhoneApplication;
  id v12 = PHPreferencesGetValueInDomain(v9, TUBundleIdentifierMobilePhoneApplication);
  unsigned __int8 v13 = [v12 BOOLValue];

  if ((v13 & 1) == 0)
  {
    id v14 = objc_alloc_init((Class)CHManager);
    if (v10)
    {
      if (![(MPRecentsTableViewController *)self isRecentCallContactInFavorites:v4])
      {
        id v15 = objc_alloc_init((Class)NSDateComponents);
        [v15 setDay:-30];
        unint64_t v16 = +[NSCalendar currentCalendar];
        __int16 v17 = +[NSDate date];
        id v18 = [v16 dateByAddingComponents:v15 toDate:v17 options:0];

        id v19 = +[NSPredicate predicateWithFormat:@"date >= %@ AND contactIdentifier == %@", v18, v7];
        if ((unint64_t)[v14 countCallsWithPredicate:v19] >= 5)
        {
          long long v20 = PHDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Logging Biome signal for calling a non-favorite contact.", buf, 2u);
          }

          id v21 = TUTipsEventCalledNonFavContact;
LABEL_18:
          if (v21)
          {
            if (v21 == (id)TUTipsEventCalledNonFavContact) {
              +[TPTipsHelper donateEventCalledNonFavContact];
            }
            else {
              +[TPTipsHelper donateEventCalledNonContact];
            }
            PHPreferencesSetValueInDomain(v9, &__kCFBooleanTrue, v11);
          }
          goto LABEL_24;
        }
      }
    }
    else
    {
      id v22 = [v4 callerIdForDisplay];
      long long v23 = +[NSPredicate predicateWithFormat:@"callerIdForDisplay == %@", v22];
      id v24 = [v14 countCallsWithPredicate:v23];

      if ((unint64_t)v24 >= 3)
      {
        double v25 = PHDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Logging Biome signal for calling a non-contact number.", v26, 2u);
        }

        id v21 = TUTipsEventCalledNonContact;
        goto LABEL_18;
      }
    }
LABEL_24:
  }
LABEL_25:
}

- (BOOL)isRecentCallContactInFavorites:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 useSharedRecentsViewModel];

  if (v6)
  {
    unsigned int v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MPRecentsTableViewController isRecentCallContactInFavorites:]();
    }
  }
  id v8 = [v4 contactIdentifier];
  id v9 = v8;
  if (v8 && [v8 length])
  {
    int v10 = +[PHApplicationServices sharedInstance];
    int v11 = [v10 favoritesController];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = [v11 favoritesEntries];
    id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      id v21 = v11;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v12);
          }
          unint64_t v16 = [*(id *)(*((void *)&v22 + 1) + 8 * i) contactProperty];
          __int16 v17 = [v16 contact];
          id v18 = [v17 identifier];
          unsigned __int8 v19 = [v18 isEqualToString:v9];

          if (v19)
          {
            LOBYTE(v13) = 1;
            goto LABEL_18;
          }
        }
        id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
LABEL_18:
      int v11 = v21;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return (char)v13;
}

- (void)presentCNSharedProfileOnboardingController
{
  id v3 = objc_alloc_init((Class)TUFeatureFlags);
  unsigned int v4 = [v3 nameAndPhotoEnabledC3];

  if (v4)
  {
    id v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Going to present CNSharedProfileOnboardingController", v11, 2u);
    }

    [(MPRecentsTableViewController *)self dismissViewControllerAnimated:0 completion:0];
    id v6 = objc_alloc((Class)CNSharedProfileOnboardingController);
    unsigned int v7 = +[TUCallCenter sharedInstance];
    id v8 = [v7 contactStore];
    id v9 = [v6 initWithContactStore:v8];
    [(MPRecentsTableViewController *)self setOnboardingController:v9];

    int v10 = [(MPRecentsTableViewController *)self onboardingController];
    [v10 startOnboardingOrEditForMode:1 fromViewController:self];
  }
}

- (id)fetchSubscriptionsInUse
{
  uint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = objc_opt_class();
    id v3 = *(id *)((char *)&buf + 4);
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ fetching current CTXPCServiceSubscriptions in use", (uint8_t *)&buf, 0xCu);
  }
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2050000000;
  id v5 = (void *)getPSSimStatusCacheClass_softClass;
  uint64_t v26 = getPSSimStatusCacheClass_softClass;
  if (!getPSSimStatusCacheClass_softClass)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    long long v29 = __getPSSimStatusCacheClass_block_invoke;
    long long v30 = &unk_10027C860;
    long long v31 = &v23;
    __getPSSimStatusCacheClass_block_invoke((uint64_t)&buf);
    id v5 = (void *)v24[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v23, 8);
  unsigned int v7 = [v6 sharedInstance];
  id v8 = [v7 subscriptionsInUse];

  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v9)
  {
    uint64_t v11 = *(void *)v20;
    *(void *)&long long v10 = 138412290;
    long long v18 = v10;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSimHidden", v18, (void)v19))
        {
          uint64_t v14 = PHDefaultLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = [v13 uuid];
            LODWORD(buf) = v18;
            *(void *)((char *)&buf + 4) = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Subscription: %@ is hidden", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          [v4 addObject:v13];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v9);
  }

  id v16 = [v4 copy];

  return v16;
}

- (id)fetchCarrierBundleValue:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPRecentsTableViewController *)self ctClient];
  id v13 = 0;
  id v9 = [v8 context:v7 getCarrierBundleValue:v6 error:&v13];

  id v10 = v13;
  if (v10)
  {
    uint64_t v11 = PHDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MPRecentsTableViewController fetchCarrierBundleValue:context:]((uint64_t)v6, (uint64_t)v10, v11);
    }

    id v9 = 0;
  }

  return v9;
}

- (id)personalizedCarrierString
{
  id v3 = [(MPRecentsTableViewController *)self fetchSubscriptionsInUse];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [(MPRecentsTableViewController *)self fetchCarrierBundleValue:&off_10028CCF8 context:v10];
        if ([v11 BOOLValue])
        {
          id v12 = [(MPRecentsTableViewController *)self fetchCarrierBundleValue:&off_10028CD10 context:v10];
          if (v12) {
            [v4 addObject:v12];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  id v13 = [v4 allObjects];
  if ([v13 count] == (id)1)
  {
    uint64_t v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:@"BRANDED_CALLING_SINGLE_CARRIER_TIPS_TEXT" value:&stru_100285990 table:@"PHRecents"];
    id v16 = [v13 objectAtIndexedSubscript:0];
    __int16 v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16);
LABEL_16:

    goto LABEL_18;
  }
  if ([v13 count] == (id)2)
  {
    uint64_t v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:@"BRANDED_CALLING_TWO_CARRIER_TIPS_TEXT" value:&stru_100285990 table:@"PHRecents"];
    id v16 = [v13 objectAtIndexedSubscript:0];
    long long v18 = [v13 objectAtIndexedSubscript:1];
    __int16 v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16, v18, (void)v20);

    goto LABEL_16;
  }
  __int16 v17 = 0;
LABEL_18:

  return v17;
}

- (id)reportSwipeActionForCall:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(MPRecentsTableViewController *)self callReportingViewModel];
  unsigned __int8 v6 = [v5 shouldShowReportActionForCall:v4];

  if (v6)
  {
    id v7 = [(MPRecentsTableViewController *)self callReportingViewModel];
    id v8 = [v7 reportingFlowForCall:v4];

    if (v8 == (id)6)
    {
      id v9 = PHDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MPRecentsTableViewController: not a valid spam flow", buf, 2u);
      }
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v11 = [(MPRecentsTableViewController *)self callReportingViewModel];
      id v9 = [v11 reportActionTitleOfFlow:v8];

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = __57__MPRecentsTableViewController_reportSwipeActionForCall___block_invoke;
      v16[3] = &unk_10027DBA8;
      objc_copyWeak(v18, &location);
      v18[1] = v8;
      id v17 = v4;
      uint64_t v10 = +[UIContextualAction contextualActionWithStyle:0 title:v9 handler:v16];
      id v12 = +[UIColor orangeColor];
      [v10 setBackgroundColor:v12];

      id v13 = [(MPRecentsTableViewController *)self callReportingViewModel];
      uint64_t v14 = [v13 reportActionImage];
      [v10 setImage:v14];

      objc_destroyWeak(v18);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_destroyWeak(&location);

  return v10;
}

void __57__MPRecentsTableViewController_reportSwipeActionForCall___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    switch(*(void *)(a1 + 48))
    {
      case 0:
        id v8 = PHDefaultLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MPRecentsTableViewController: we are showing the native spam reporting and blocking for facetime", buf, 2u);
        }

        [v7 presentFaceTimeSpamReportAndBlockAlertFor:*(void *)(a1 + 32)];
        break;
      case 1:
        id v9 = PHDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MPRecentsTableViewController: we are showing the carrier reporting and blocking option", v14, 2u);
        }

        [v7 _showCarrierVoiceCallReportAlertForCall:*(void *)(a1 + 32)];
        break;
      case 2:
        uint64_t v10 = PHDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "MPRecentsTableViewController: we are showing the third party reporting and blocking option", v13, 2u);
        }

        [v7 showReportingExtensionForCall:*(void *)(a1 + 32)];
        break;
      case 3:
        [WeakRetained presentBlockAllAlertFor:*(void *)(a1 + 32)];
        break;
      case 4:
        [WeakRetained presentBlockUnknownParticipantsFor:*(void *)(a1 + 32)];
        break;
      case 5:
        [WeakRetained presentGroupFaceTimeSpamReportAndBlockAlertFor:*(void *)(a1 + 32)];
        break;
      case 6:
        uint64_t v11 = PHDefaultLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MPRecentsTableViewController: we are showing none flow", v12, 2u);
        }

        break;
      default:
        break;
    }
  }
  v5[2](v5, 1);
}

- (void)_showCarrierVoiceCallReportAlertForCall:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 useSharedRecentsViewModel];

  if (v6)
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MPRecentsTableViewController _showCarrierVoiceCallReportAlertForCall:]();
    }
  }
  id v8 = [(MPRecentsTableViewController *)self callReportingViewModel];
  uint64_t v9 = [v8 getCarrierNameOfCallForCall:v4];

  uint64_t v10 = [(MPRecentsTableViewController *)self callReportingViewModel];
  long long v31 = (void *)v9;
  uint64_t v11 = [v10 getCarrierSpamReportAlertTitleWithCarrierName:v9];

  id v12 = +[UIAlertController alertControllerWithTitle:v11 message:0 preferredStyle:0];
  id v13 = +[NSBundle mainBundle];
  uint64_t v14 = [v13 localizedStringForKey:@"REPORT_BLOCK_FACETIME_ALERT_BLOCK" value:&stru_100285990 table:@"PHRecents"];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = __72__MPRecentsTableViewController__showCarrierVoiceCallReportAlertForCall___block_invoke;
  v36[3] = &unk_10027D5F8;
  v36[4] = self;
  id v15 = v4;
  id v37 = v15;
  id v16 = +[UIAlertAction actionWithTitle:v14 style:2 handler:v36];
  [v12 addAction:v16];

  id v17 = +[NSBundle mainBundle];
  long long v18 = [v17 localizedStringForKey:@"REPORT_BLOCK_FACETIME_ALERT_REPORT_BLOCK" value:&stru_100285990 table:@"PHRecents"];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __72__MPRecentsTableViewController__showCarrierVoiceCallReportAlertForCall___block_invoke_331;
  v34[3] = &unk_10027D5F8;
  v34[4] = self;
  id v19 = v15;
  id v35 = v19;
  long long v20 = +[UIAlertAction actionWithTitle:v18 style:2 handler:v34];
  [v12 addAction:v20];

  long long v21 = +[NSBundle mainBundle];
  long long v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_100285990 table:@"PHRecents"];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __72__MPRecentsTableViewController__showCarrierVoiceCallReportAlertForCall___block_invoke_332;
  v32[3] = &unk_10027D5F8;
  v32[4] = self;
  id v33 = v19;
  id v23 = v19;
  long long v24 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v32];
  [v12 addAction:v24];

  uint64_t v25 = [v12 popoverPresentationController];
  [v25 setPermittedArrowDirections:1];

  uint64_t v26 = [v12 popoverPresentationController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertPresentingViewController);
  id v28 = [WeakRetained view];
  [v26 setSourceView:v28];

  id v29 = objc_loadWeakRetained((id *)&self->_alertPresentingViewController);
  if (v29)
  {
    id v30 = objc_loadWeakRetained((id *)&self->_alertPresentingViewController);
    [v30 presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    [(MPRecentsTableViewController *)self presentViewController:v12 animated:1 completion:0];
  }
}

void __72__MPRecentsTableViewController__showCarrierVoiceCallReportAlertForCall___block_invoke(uint64_t a1)
{
  uint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Spamreporting: carrier reporting, user did tap block", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) contactsForRecentCall:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) callReportingViewModel];
  [v4 blockWithContacts:v3];
}

void __72__MPRecentsTableViewController__showCarrierVoiceCallReportAlertForCall___block_invoke_331(uint64_t a1)
{
  uint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Spamreporting: carrier reporting, user did tap block and report", v6, 2u);
  }

  id v3 = [*(id *)(a1 + 32) contactsForRecentCall:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) callReportingViewModel];
  [v4 blockWithContacts:v3];

  id v5 = [*(id *)(a1 + 32) callReportingViewModel];
  [v5 reportSpamVoiceCall:*(void *)(a1 + 40)];
}

void __72__MPRecentsTableViewController__showCarrierVoiceCallReportAlertForCall___block_invoke_332(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callReportingViewModel];
  [v2 logEventForCancelledVoiceCallSpamReport:*(void *)(a1 + 40)];
}

- (void)voicemailMessageDetailViewController:(id)a3 destructiveActionPerformedForMessage:(id)a4 completionBlock:(id)a5
{
}

- (UIViewController)alertPresentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertPresentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setAlertPresentingViewController:(id)a3
{
}

- (_TtC11MobilePhone22CallReportingViewModel)callReportingViewModel
{
  return self->_callReportingViewModel;
}

- (void)setSpamReport:(id)a3
{
}

- (void)setTableView:(id)a3
{
}

- (MPCNMeCardSharingSettingsViewControllerObserver)meCardSharingSettingsViewControllerObserver
{
  return self->_meCardSharingSettingsViewControllerObserver;
}

- (MPRecentsTableViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
}

- (void)setDidEnterSuspended:(BOOL)a3
{
  self->_didEnterSuspended = a3;
}

- (void)setUnknownCallersViewController:(id)a3
{
}

- (void)setAvatarCardController:(id)a3
{
}

- (void)setClearButtonItem:(id)a3
{
}

- (void)setDoneButtonItem:(id)a3
{
}

- (BOOL)contentUnavailable
{
  return self->_contentUnavailable;
}

- (void)setContentUnavailableView:(id)a3
{
}

- (NSString)contentUnavailableViewTitle
{
  return self->_contentUnavailableViewTitle;
}

- (void)setTableViewDisplayModeSegmentedControl:(id)a3
{
}

- (void)setSearchController:(id)a3
{
}

- (void)setSearchResultsController:(id)a3
{
}

- (void)setPendingSearchText:(id)a3
{
}

- (void)setPendingSearchControllerActivation:(BOOL)a3
{
  self->_pendingSearchControllerActivation = a3;
}

- (MPRecentsCellConfigurator)cellConfigurator
{
  return self->_cellConfigurator;
}

- (void)setCellConfigurator:(id)a3
{
}

- (void)setCallServices:(id)a3
{
}

- (void)setRecentsDetailPresenter:(id)a3
{
}

- (ILClassificationUIExtensionHostViewController)classificationViewController
{
  return self->_classificationViewController;
}

- (void)setClassificationViewController:(id)a3
{
}

- (void)setCtClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewControllerSettings, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_classificationViewController, 0);
  objc_storeStrong((id *)&self->_onboardingController, 0);
  objc_storeStrong((id *)&self->_indexPathsForNormalCalls, 0);
  objc_storeStrong((id *)&self->_indexPathsForMissedCalls, 0);
  objc_storeStrong((id *)&self->_recentsDetailPresenter, 0);
  objc_storeStrong((id *)&self->_callServices, 0);
  objc_storeStrong((id *)&self->_cellConfigurator, 0);
  objc_storeStrong((id *)&self->_pendingSearchText, 0);
  objc_storeStrong((id *)&self->_searchResultsController, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_tableViewDisplayModeSegmentedControl, 0);
  objc_storeStrong((id *)&self->_contentUnavailableViewTitle, 0);
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_clearButtonItem, 0);
  objc_storeStrong((id *)&self->_avatarCardController, 0);
  objc_storeStrong((id *)&self->_unknownCallersViewController, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_meCardSharingSettingsViewControllerObserver, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_spamReport, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_recentCalls, 0);
  objc_storeStrong((id *)&self->_callReportingViewModel, 0);
  objc_destroyWeak((id *)&self->_alertPresentingViewController);

  objc_storeStrong((id *)&self->_dataSourcePrefetchingOperationQueue, 0);
}

- (void)handleShowDetailsURLForUniqueID:(id)a3 withContinuingSearchText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v9 = [v8 callHistorySearchEnabled];

  if (v9)
  {
    uint64_t v10 = PHDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Showing details for uniqueID: %@ and setting searchText as: %@", (uint8_t *)&v11, 0x16u);
    }

    [(MPRecentsTableViewController *)self setPendingSearchText:v7];
    [(MPRecentsTableViewController *)self handleShowDetailsURLForUniqueID:v6];
  }
}

- (void)startSearchingForText:(id)a3
{
  id v4 = a3;
  id v5 = [(MPRecentsTableViewController *)self featureFlags];
  unsigned int v6 = [v5 callHistorySearchEnabled];

  if (v6)
  {
    id v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138412290;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Starting search for text: %@", (uint8_t *)&v22, 0xCu);
    }

    if ([(MPRecentsTableViewController *)self isViewLoaded]
      && ([(MPRecentsTableViewController *)self view],
          id v8 = objc_claimAutoreleasedReturnValue(),
          [v8 window],
          unsigned int v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      uint64_t v10 = [(MPRecentsTableViewController *)self searchController];
      unsigned int v11 = [v10 isActive];

      if (v11)
      {
        id v12 = [(MPRecentsTableViewController *)self searchController];
        __int16 v13 = [v12 searchBar];
        [v13 setText:v4];

        id v14 = [(MPRecentsTableViewController *)self searchResultsController];
        id v15 = [(MPRecentsTableViewController *)self searchController];
        [v14 updateSearchResultsForSearchController:v15];
      }
      else
      {
        [(MPRecentsTableViewController *)self setPendingSearchText:v4];
        id v14 = [(MPRecentsTableViewController *)self searchController];
        [v14 setActive:1];
      }

      long long v20 = [(MPRecentsTableViewController *)self searchController];
      long long v21 = [v20 searchBar];
      [v21 becomeFirstResponder];
    }
    else
    {
      id v16 = [(MPRecentsTableViewController *)self searchController];
      id v17 = [v16 searchBar];
      [v17 setText:v4];

      long long v18 = [(MPRecentsTableViewController *)self searchResultsController];
      id v19 = [(MPRecentsTableViewController *)self searchController];
      [v18 updateSearchResultsForSearchController:v19];

      [(MPRecentsTableViewController *)self setPendingSearchControllerActivation:1];
    }
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  [(MPRecentsTableViewController *)self updateSearchBarLayoutMarginsPresentingSearchResults:1];
  [v4 setShowsSearchResultsController:1];

  [(MPRecentsTableViewController *)self animateSearchResultsController:0];
  [(MPRecentsTableViewController *)self dismissPopover];

  +[TPTipsHelper donateEventSearchedCallHistory];
}

- (void)didPresentSearchController:(id)a3
{
  id v8 = a3;
  id v4 = [(MPRecentsTableViewController *)self pendingSearchText];

  if (v4)
  {
    id v5 = [(MPRecentsTableViewController *)self pendingSearchText];
    unsigned int v6 = [v8 searchBar];
    [v6 setText:v5];

    [(MPRecentsTableViewController *)self setPendingSearchText:0];
  }
  id v7 = +[SearchMetrics shared];
  [v7 logSearchBarTap];
}

- (void)willDismissSearchController:(id)a3
{
  [(MPRecentsTableViewController *)self updateSearchBarLayoutMarginsPresentingSearchResults:0];

  [(MPRecentsTableViewController *)self animateSearchResultsController:1];
}

- (void)animateSearchResultsController:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(MPRecentsTableViewController *)self searchResultsController];
    id v5 = [v4 view];

    unsigned int v6 = [(MPRecentsTableViewController *)self tableView];
  }
  else
  {
    id v5 = [(MPRecentsTableViewController *)self tableView];
    id v7 = [(MPRecentsTableViewController *)self searchResultsController];
    unsigned int v6 = [v7 view];
  }
  [v6 setAlpha:0.0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __71__MPRecentsTableViewController_Search__animateSearchResultsController___block_invoke;
  v14[3] = &unk_10027C670;
  id v15 = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __71__MPRecentsTableViewController_Search__animateSearchResultsController___block_invoke_2;
  v10[3] = &unk_10027DBD0;
  id v12 = v15;
  uint64_t v13 = 0x3FC999999999999ALL;
  id v11 = v6;
  id v8 = v15;
  id v9 = v6;
  +[UIView animateWithDuration:0x10000 delay:v14 options:v10 animations:0.2 completion:0.0];
}

id __71__MPRecentsTableViewController_Search__animateSearchResultsController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __71__MPRecentsTableViewController_Search__animateSearchResultsController___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __71__MPRecentsTableViewController_Search__animateSearchResultsController___block_invoke_3;
  v5[3] = &unk_10027C670;
  id v6 = *(id *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __71__MPRecentsTableViewController_Search__animateSearchResultsController___block_invoke_4;
  v3[3] = &unk_10027D268;
  id v4 = *(id *)(a1 + 40);
  +[UIView animateWithDuration:v5 animations:v3 completion:v2];
}

id __71__MPRecentsTableViewController_Search__animateSearchResultsController___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id __71__MPRecentsTableViewController_Search__animateSearchResultsController___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)didSelectSuggestedSearchWithToken:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MPRecentsTableViewController.didSelectSuggestedSearch(token:)((UISearchToken)v4);
}

- (void)tipKitStopObservation
{
  double v2 = self;
  [(MPRecentsTableViewController *)v2 dismissPopover];
  type metadata accessor for TPTipsHelper();
  static TPTipsHelper.taskQueue.getter();
  *(void *)(swift_allocObject() + 16) = v2;
  id v3 = v2;
  dispatch thunk of TaskQueue.async(_:)();

  swift_release();
  swift_release();

  swift_release();
}

- (void)didTapContinueWithViewController:(id)a3
{
}

- (id)makePersonalNicknameMenuView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for PersonalNicknameMenuView());
  id v4 = self;
  id v5 = PersonalNicknameMenuView.init(displayContext:personalNicknameMenuViewDelegate:)(1, (uint64_t)self, (uint64_t)&protocol witness table for MPRecentsTableViewController);

  return v5;
}

- (void)presentFaceTimeSpamReportAlertFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MPRecentsTableViewController.presentFaceTimeSpamReportAlert(for:)(v4);
}

- (void)presentBlockAllAlertFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MPRecentsTableViewController.presentBlockAllAlert(for:)((uint64_t)v4);
}

- (void)presentFaceTimeSpamReportAndBlockAlertFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MPRecentsTableViewController.presentFaceTimeSpamReportAndBlockAlert(for:)(v4);
}

- (void)presentGroupFaceTimeSpamReportAndBlockAlertFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MPRecentsTableViewController.presentGroupFaceTimeSpamReportAndBlockAlert(for:)(v4);
}

- (void)presentBlockUnknownParticipantsFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  MPRecentsTableViewController.presentBlockUnknownParticipants(for:)(v4);
}

- (void)presentOnboardingViewController
{
}

- (void)tableView:(uint64_t)a1 numberOfRowsInSection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Asked to return number of rows in section. Returning %ld", (uint8_t *)&v2, 0xCu);
}

- (void)showReportingExtensionForCall:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "When useSharedRecentsViewModel is enabled use ReportFlowPresenter instead of [MPRecentsTableViewController showReportingExtensionForCall]", v2, v3, v4, v5, v6);
}

- (void)isRecentCallContactInFavorites:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "Using isRecentCallContactInFavorites on MPRecentsTableViewController while useSharedRecentsViewModel is enabled is undefined.", v2, v3, v4, v5, v6);
}

- (void)fetchCarrierBundleValue:(os_log_t)log context:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to fetch carrier bundle value for key hierarchy: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)_showCarrierVoiceCallReportAlertForCall:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2((void *)&_mh_execute_header, v0, v1, "Do not use _showCarrierVoiceCallReportAlertForCall directly on MPRecentsTableViewController, please use ReportFlowPresenter.", v2, v3, v4, v5, v6);
}

@end