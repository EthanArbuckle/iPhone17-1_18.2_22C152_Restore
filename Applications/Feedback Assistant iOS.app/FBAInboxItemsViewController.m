@interface FBAInboxItemsViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)needsUpdate;
- (BOOL)showingSyntheticInbox;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (FBAInbox)inbox;
- (FBAInboxItemsViewController)initWithCoder:(id)a3;
- (FBAInboxItemsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (FBAInboxItemsViewController)initWithStyle:(int64_t)a3;
- (FBKTeam)team;
- (NSArray)sortDescriptors;
- (NSIndexPath)currDetailIndexPath;
- (NSMutableArray)fbaDataObservers;
- (NSMutableArray)filteredInboxItems;
- (NSMutableArray)searchResultItems;
- (NSMutableArray)sortedInboxItems;
- (NSTimer)refreshTimer;
- (UIBarButtonItem)destructiveBarButtonItem;
- (UISearchController)searchController;
- (_TtC18Feedback_Assistant16FBAFilterManager)filterManager;
- (id)activeInboxSource;
- (id)defaultCenterObserver;
- (id)filterSource;
- (id)itemForIndexPath:(id)a3;
- (id)leftToolbarItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)newFeedbackButtonState;
- (void)awakeFromNib;
- (void)beginRefresh;
- (void)beginSearch;
- (void)clearDetail;
- (void)commonInit;
- (void)createNewFeedback:(id)a3;
- (void)destroyDraft:(id)a3;
- (void)destroyItemAtIndexPath:(id)a3;
- (void)destroySelectedItems:(id)a3;
- (void)didDismissSearchController:(id)a3;
- (void)didTapSubtitleAction:(id)a3;
- (void)filterContentForFilterManager:(id)a3;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)reloadAppProxy;
- (void)reloadView;
- (void)removeFBAObservers;
- (void)setCurrDetailIndexPath:(id)a3;
- (void)setDefaultCenterObserver:(id)a3;
- (void)setDestructiveBarButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setFbaDataObservers:(id)a3;
- (void)setFilterManager:(id)a3;
- (void)setFilteredInboxItems:(id)a3;
- (void)setInbox:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setRefreshTimer:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setSearchResultItems:(id)a3;
- (void)setShowingSyntheticInbox:(BOOL)a3;
- (void)setSortDescriptors:(id)a3;
- (void)setSortedInboxItems:(id)a3;
- (void)setTeam:(id)a3;
- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)toggleFiltering;
- (void)updateSearchResults;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FBAInboxItemsViewController

- (FBAInboxItemsViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBAInboxItemsViewController;
  v3 = [(FBAInboxItemsViewController *)&v6 initWithStyle:a3];
  v4 = v3;
  if (v3) {
    [(FBAInboxItemsViewController *)v3 commonInit];
  }
  return v4;
}

- (FBAInboxItemsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FBAInboxItemsViewController;
  v4 = [(FBAInboxItemsViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(FBAInboxItemsViewController *)v4 commonInit];
  }
  return v5;
}

- (FBAInboxItemsViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBAInboxItemsViewController;
  v3 = [(FBAInboxItemsViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FBAInboxItemsViewController *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  v3 = +[NSSortDescriptor sortDescriptorWithKey:@"mailboxSortDate" ascending:0];
  v9[0] = v3;
  v4 = +[NSSortDescriptor sortDescriptorWithKey:@"ID" ascending:0];
  v9[1] = v4;
  v5 = +[NSArray arrayWithObjects:v9 count:2];
  sortDescriptors = self->_sortDescriptors;
  self->_sortDescriptors = v5;

  objc_super v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  sortedInboxItems = self->_sortedInboxItems;
  self->_sortedInboxItems = v7;

  self->_needsUpdate = 0;
  self->_showingSyntheticInbox = 0;
}

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)FBAInboxItemsViewController;
  [(FBAInboxItemsViewController *)&v2 awakeFromNib];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)FBAInboxItemsViewController;
  [(FBATableViewControler *)&v28 viewDidLoad];
  v3 = [(FBAInboxItemsViewController *)self tableView];
  [v3 setEstimatedRowHeight:60.0];

  v4 = [(FBAInboxItemsViewController *)self tableView];
  [v4 setRowHeight:UITableViewAutomaticDimension];

  id v5 = objc_alloc_init((Class)UIRefreshControl);
  [(FBAInboxItemsViewController *)self setRefreshControl:v5];

  objc_super v6 = [(FBAInboxItemsViewController *)self refreshControl];
  [v6 addTarget:self action:"reloadAppProxy" forControlEvents:4096];

  objc_super v7 = +[UIKeyCommand keyCommandWithInput:@"R" modifierFlags:1572864 action:"reloadAppProxy"];
  v8 = +[NSBundle mainBundle];
  uint64_t v9 = FBKCommonStrings;
  v10 = [v8 localizedStringForKey:@"REFRESH" value:&stru_1000F6658 table:FBKCommonStrings];
  [v7 setDiscoverabilityTitle:v10];

  [(FBAInboxItemsViewController *)self addKeyCommand:v7];
  v11 = +[UIKeyCommand keyCommandWithInput:@"F" modifierFlags:0x100000 action:"beginSearch"];
  v12 = +[NSBundle mainBundle];
  v13 = [v12 localizedStringForKey:@"SEARCH" value:&stru_1000F6658 table:v9];
  [v11 setDiscoverabilityTitle:v13];

  [(FBAInboxItemsViewController *)self addKeyCommand:v11];
  v14 = [(FBAInboxItemsViewController *)self inbox];
  unsigned int v15 = [v14 supportsSelection];

  if (v15)
  {
    v16 = [(FBAInboxItemsViewController *)self tableView];
    [v16 setAllowsMultipleSelectionDuringEditing:1];
  }
  v17 = [(FBAInboxItemsViewController *)self inbox];
  id v18 = [v17 type];

  if (v18 != (id)3)
  {
    id v19 = [objc_alloc((Class)UISearchController) initWithSearchResultsController:0];
    [(FBAInboxItemsViewController *)self setSearchController:v19];

    v20 = [(FBAInboxItemsViewController *)self searchController];
    [v20 setDelegate:self];

    v21 = [(FBAInboxItemsViewController *)self searchController];
    [v21 setSearchResultsUpdater:self];

    v22 = [(FBAInboxItemsViewController *)self searchController];
    [v22 setObscuresBackgroundDuringPresentation:0];

    v23 = [(FBAInboxItemsViewController *)self searchController];
    v24 = [v23 searchBar];
    [v24 setDelegate:self];

    v25 = [(FBAInboxItemsViewController *)self searchController];
    [v25 setHidesNavigationBarDuringPresentation:1];

    v26 = [(FBAInboxItemsViewController *)self searchController];
    v27 = [(FBAInboxItemsViewController *)self navigationItem];
    [v27 setSearchController:v26];

    [(FBAInboxItemsViewController *)self setDefinesPresentationContext:1];
  }
  [(FBAInboxItemsViewController *)self showToolbarWithStatus:&stru_1000F6658 animated:0];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setTeam:(id)a3
{
  id v9 = a3;
  objc_storeStrong((id *)&self->_team, a3);
  if ([(FBAInboxItemsViewController *)self showingSyntheticInbox])
  {
    id v5 = +[FBKContentItem filterGroupsForAll];
  }
  else
  {
    objc_super v6 = [(FBAInboxItemsViewController *)self team];
    id v5 = +[FBKContentItem filterGroupsForTeam:v6];
  }
  objc_super v7 = [[_TtC18Feedback_Assistant16FBAFilterManager alloc] initWithFilterGroups:v5];
  filterManager = self->_filterManager;
  self->_filterManager = v7;

  [(FBAFilterManager *)self->_filterManager setFilterDelegate:self];
}

- (void)reloadAppProxy
{
  id v2 = +[FBADraftManager sharedInstance];
  [v2 reloadApp];
}

- (void)beginRefresh
{
  v3 = [(FBAInboxItemsViewController *)self refreshControl];
  [v3 beginRefreshing];

  [(FBAInboxItemsViewController *)self reloadAppProxy];
}

- (void)beginSearch
{
  id v4 = [(FBAInboxItemsViewController *)self navigationItem];
  id v2 = [v4 searchController];
  v3 = [v2 searchBar];
  [v3 becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FBAInboxItemsViewController;
  [(FBAInboxItemsViewController *)&v4 viewDidDisappear:a3];
  [(FBAInboxItemsViewController *)self removeFBAObservers];
}

- (void)removeFBAObservers
{
  v3 = +[FBKData sharedInstance];
  objc_super v4 = [v3 notificationCenter];

  fbaDataObservers = self->_fbaDataObservers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100021440;
  v8[3] = &unk_1000F3000;
  id v9 = v4;
  id v6 = v4;
  [(NSMutableArray *)fbaDataObservers enumerateObjectsUsingBlock:v8];
  objc_super v7 = self->_fbaDataObservers;
  self->_fbaDataObservers = 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v46.receiver = self;
  v46.super_class = (Class)FBAInboxItemsViewController;
  [(FBAInboxItemsViewController *)&v46 viewWillAppear:a3];
  objc_super v4 = [(FBAInboxItemsViewController *)self tableView];
  id v5 = [v4 indexPathsForSelectedRows];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v43;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v42 + 1) + 8 * (void)v9);
        v11 = [(FBAInboxItemsViewController *)self tableView];
        [v11 deselectRowAtIndexPath:v10 animated:0];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v7);
  }

  v12 = [(FBAInboxItemsViewController *)self tableView];
  [v12 setSeparatorInset:0.0, 32.0, 0.0, 0.0];

  [(FBAInboxItemsViewController *)self reloadView];
  v13 = [(FBAInboxItemsViewController *)self inbox];
  BOOL v14 = [v13 type] == 0;

  if (v14)
  {
    v16 = [(FBAInboxItemsViewController *)self editButtonItem];
    v17 = [(FBAInboxItemsViewController *)self navigationItem];
    [v17 setRightBarButtonItem:v16];

    unsigned int v15 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:16 target:self action:"destroySelectedItems:"];
  }
  else
  {
    unsigned int v15 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:14 target:self action:"destroySelectedItems:"];
  }
  destructiveBarButtonItem = self->_destructiveBarButtonItem;
  self->_destructiveBarButtonItem = v15;

  id v19 = [(FBAInboxItemsViewController *)self navigationController];
  [v19 setToolbarHidden:0 animated:1];

  v20 = [(FBAInboxItemsViewController *)self fbaDataObservers];

  if (v20) {
    [(FBAInboxItemsViewController *)self removeFBAObservers];
  }
  v21 = objc_opt_new();
  [(FBAInboxItemsViewController *)self setFbaDataObservers:v21];

  objc_initWeak(&location, self);
  v22 = [(FBAInboxItemsViewController *)self fbaDataObservers];
  v23 = +[FBKData sharedInstance];
  uint64_t v24 = [v23 notificationCenter];
  v25 = +[NSOperationQueue mainQueue];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100021918;
  v39[3] = &unk_1000F2660;
  objc_copyWeak(&v40, &location);
  v26 = [(id)v24 addObserverForName:FBKDidReloadAppNotification object:0 queue:v25 usingBlock:v39];
  [v22 addObject:v26];

  id v27 = objc_loadWeakRetained(&location);
  objc_super v28 = [v27 inbox];
  LOBYTE(v24) = [v28 type] == (id)4;

  if ((v24 & 1) == 0)
  {
    v29 = [(FBAInboxItemsViewController *)self fbaDataObservers];
    v30 = +[FBKData sharedInstance];
    v31 = [v30 mainQueueContext];
    v33 = _NSConcreteStackBlock;
    uint64_t v34 = 3221225472;
    v35 = sub_10002198C;
    v36 = &unk_1000F30D8;
    objc_copyWeak(&v38, &location);
    v37 = self;
    v32 = [v31 addObjectsDidChangeNotificationObserver:&v33];
    [v29 addObject:v32, v33, v34, v35, v36];

    objc_destroyWeak(&v38);
  }
  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

- (void)reloadView
{
  v3 = [(FBAInboxItemsViewController *)self tableView];
  id v22 = [v3 indexPathForSelectedRow];

  if (v22
    && (id v4 = [v22 row],
        [(FBAInboxItemsViewController *)self activeInboxSource],
        id v5 = objc_claimAutoreleasedReturnValue(),
        id v6 = [v5 count],
        v5,
        v4 < v6))
  {
    id v7 = [(FBAInboxItemsViewController *)self itemForIndexPath:v22];
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v8 = [(FBAInboxItemsViewController *)self inbox];
  id v9 = [(FBAInboxItemsViewController *)self team];
  uint64_t v10 = [v8 inboxItemsForTeam:v9 withSortDescriptors:self->_sortDescriptors];
  v11 = +[NSMutableArray arrayWithArray:v10];
  [(FBAInboxItemsViewController *)self setSortedInboxItems:v11];

  v12 = [(FBAInboxItemsViewController *)self inbox];
  v13 = [v12 displayText];
  BOOL v14 = [(FBAInboxItemsViewController *)self navigationItem];
  [v14 setTitle:v13];

  [(FBAInboxItemsViewController *)self updateSearchResults];
  unsigned int v15 = [(FBAInboxItemsViewController *)self tableView];
  [v15 reloadData];

  if (v7)
  {
    v16 = [(FBAInboxItemsViewController *)self activeInboxSource];
    id v17 = [v16 indexOfObject:v7];

    if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v18 = [(FBAInboxItemsViewController *)self inbox];
      id v19 = [v18 type];

      if (v19 != (id)3)
      {
        v20 = [(FBAInboxItemsViewController *)self tableView];
        v21 = +[NSIndexPath indexPathForRow:v17 inSection:0];
        [v20 selectRowAtIndexPath:v21 animated:0 scrollPosition:0];
      }
    }
  }
}

- (void)clearDetail
{
  v3 = [(FBAInboxItemsViewController *)self splitViewController];
  id v4 = [v3 viewControllers];
  id v5 = [v4 count];

  if (v5 == (id)2)
  {
    id v6 = [(FBAInboxItemsViewController *)self storyboard];
    id v8 = [v6 instantiateViewControllerWithIdentifier:@"FBAEmptyStack"];

    id v7 = [(FBAInboxItemsViewController *)self splitViewController];
    [v7 showDetailViewController:v8 sender:self];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FBAInboxItemsViewController;
  [(FBAInboxItemsViewController *)&v18 setEditing:a3 animated:a4];
  if (v4)
  {
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
    v19[0] = v6;
    id v7 = [(FBAInboxItemsViewController *)self destructiveBarButtonItem];
    v19[1] = v7;
    id v8 = +[NSArray arrayWithObjects:v19 count:2];
    [(FBAInboxItemsViewController *)self setToolbarItems:v8 animated:1];

    id v9 = [(FBAInboxItemsViewController *)self destructiveBarButtonItem];
    [v9 setEnabled:0];

    double v10 = 0.33;
  }
  else
  {
    [(FBAInboxItemsViewController *)self showToolbarWithStatus:&stru_1000F6658 animated:1];
    v11 = [(FBAInboxItemsViewController *)self filterManager];
    [(FBAInboxItemsViewController *)self filterContentForFilterManager:v11];

    double v10 = 1.0;
    if (self->_needsUpdate) {
      [(FBAInboxItemsViewController *)self reloadView];
    }
  }
  v12 = [(FBAInboxItemsViewController *)self navigationItem];
  v13 = [v12 searchController];
  BOOL v14 = [v13 searchBar];
  [v14 setUserInteractionEnabled:!v4];

  unsigned int v15 = [(FBAInboxItemsViewController *)self navigationItem];
  v16 = [v15 searchController];
  id v17 = [v16 searchBar];
  [v17 setAlpha:v10];
}

- (void)destroyItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(FBAInboxItemsViewController *)self itemForIndexPath:v4];
  if ([v5 itemType] == (id)1)
  {
    id v6 = [(FBAInboxItemsViewController *)self activeInboxSource];
    [v6 removeObjectAtIndex:[v4 row]];

    id v7 = [(FBAInboxItemsViewController *)self tableView];
    id v12 = v4;
    id v8 = +[NSArray arrayWithObjects:&v12 count:1];
    [v7 deleteRowsAtIndexPaths:v8 withRowAnimation:100];

    [(FBAInboxItemsViewController *)self destroyDraft:v5];
  }
  id v9 = [(FBAInboxItemsViewController *)self currDetailIndexPath];
  id v10 = [v9 row];
  id v11 = [v4 row];

  if (v10 == v11) {
    [(FBAInboxItemsViewController *)self clearDetail];
  }
}

- (void)destroySelectedItems:(id)a3
{
  id v4 = objc_opt_new();
  id v5 = [(FBAInboxItemsViewController *)self tableView];
  id v6 = [v5 indexPathsForSelectedRows];

  id v7 = [objc_alloc((Class)NSMutableArray) initWithArray:v6];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        BOOL v14 = [(FBAInboxItemsViewController *)self itemForIndexPath:v13];
        if ([v14 itemType] == (id)1) {
          [v4 addObject:v14];
        }
        else {
          [v7 removeObject:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000228F0;
  v26[3] = &unk_1000F3000;
  v26[4] = self;
  [v4 enumerateObjectsUsingBlock:v26];
  unsigned int v15 = [(FBAInboxItemsViewController *)self tableView];
  [v15 beginUpdates];

  v16 = [(FBAInboxItemsViewController *)self tableView];
  [v16 deleteRowsAtIndexPaths:v7 withRowAnimation:100];

  id v17 = [(FBAInboxItemsViewController *)self tableView];
  [v17 endUpdates];

  objc_super v18 = [(FBAInboxItemsViewController *)self splitViewController];
  id v19 = [v18 viewControllers];
  id v20 = [v19 count];

  if (v20 == (id)2)
  {
    v21 = [(FBAInboxItemsViewController *)self currDetailIndexPath];
    unsigned int v22 = [v7 containsObject:v21];

    if (v22)
    {
      v23 = [(FBAInboxItemsViewController *)self storyboard];
      uint64_t v24 = [v23 instantiateViewControllerWithIdentifier:@"FBAEmptyStack"];

      v25 = [(FBAInboxItemsViewController *)self splitViewController];
      [v25 showDetailViewController:v24 sender:self];
    }
  }
  [(FBAInboxItemsViewController *)self setEditing:0 animated:1];
}

- (void)destroyDraft:(id)a3
{
  id v3 = a3;
  id v4 = +[FBADraftManager sharedInstance];
  [v4 deleteDraftFromContentItem:v3 dismissViewOnCompletion:0];
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v21 = a3;
  id v5 = [(FBAInboxItemsViewController *)self tableView];
  id v6 = [v5 indexPathForSelectedRow];

  [(FBAInboxItemsViewController *)self setCurrDetailIndexPath:v6];
  id v7 = [(FBAInboxItemsViewController *)self itemForIndexPath:v6];
  id v8 = [v21 destinationViewController];
  id v9 = [v8 viewControllers];
  id v10 = [v9 objectAtIndexedSubscript:0];

  uint64_t v11 = [v21 identifier];
  LODWORD(v9) = [v11 isEqualToString:@"FBAResponseDetailPresentation"];

  if (v9) {
    goto LABEL_6;
  }
  id v12 = [v21 identifier];
  unsigned int v13 = [v12 isEqualToString:@"FBAFollowupDetailPresentation"];

  if (v13) {
    goto LABEL_6;
  }
  BOOL v14 = [v21 identifier];
  unsigned int v15 = [v14 isEqualToString:@"FBASurveyDetailPresentation"];

  if (v15)
  {
    id v16 = v10;
    id v17 = [(FBAInboxItemsViewController *)self team];
    objc_super v18 = [v7 teamForItemPreferringTeam:v17];
    [v16 setTeam:v18];

    [v16 setContentItem:v7];
    goto LABEL_7;
  }
  id v19 = [v21 identifier];
  unsigned int v20 = [v19 isEqualToString:@"FBAAnnouncementDetailPresentation"];

  if (v20) {
LABEL_6:
  }
    [v10 setContentItem:v7];
LABEL_7:
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBAInboxItemsViewController *)self itemForIndexPath:v7];
  id v9 = [(FBAInboxItemsViewController *)self searchController];
  unsigned int v10 = [v9 isActive];

  if (v10)
  {
    uint64_t v11 = [(FBAInboxItemsViewController *)self searchController];
    id v12 = [v11 searchBar];
    [v12 resignFirstResponder];
  }
  if ([v6 isEditing])
  {
    unsigned int v13 = [(FBAInboxItemsViewController *)self tableView];
    BOOL v14 = [v13 indexPathsForSelectedRows];
    BOOL v15 = [v14 count] != 0;
    id v16 = [(FBAInboxItemsViewController *)self destructiveBarButtonItem];
    [v16 setEnabled:v15];
  }
  else
  {
    id v17 = [(FBAInboxItemsViewController *)self inbox];
    id v18 = [v17 type];

    if (v18 == (id)3)
    {
      id v19 = [v8 formResponse];
      unsigned int v20 = [v19 uploadTask];
      unsigned int v21 = [v20 localSubmissionStage];

      unsigned int v22 = +[FBALog appHandle];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = [v8 shortDescription];
        int v30 = 138543618;
        v31 = v23;
        __int16 v32 = 1024;
        LODWORD(v33) = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "did tap on outbox cell for item [%{public}@] upload task stage [%u]", (uint8_t *)&v30, 0x12u);
      }
      goto LABEL_11;
    }
    uint64_t v24 = +[FBALog appHandle];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = [v8 shortDescription];
      v26 = [v8 updatedAt];
      int v30 = 138543618;
      v31 = v25;
      __int16 v32 = 2114;
      v33 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Selected Inbox Item [%{public}@] updated at: [%{public}@]", (uint8_t *)&v30, 0x16u);
    }
    unsigned int v13 = [v6 cellForRowAtIndexPath:v7];
    id v27 = [v8 itemType];
    long long v28 = &off_1000F3CD0;
    switch((unint64_t)v27)
    {
      case 0uLL:
        BOOL v14 = +[FBALog appHandle];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1000A56B4(v14);
        }
        break;
      case 1uLL:
      case 5uLL:
        goto LABEL_20;
      case 2uLL:
        long long v28 = &off_1000F3CE0;
        goto LABEL_20;
      case 3uLL:
        long long v28 = &off_1000F3CE8;
        goto LABEL_20;
      case 4uLL:
        long long v28 = &off_1000F3CD8;
LABEL_20:
        long long v29 = *v28;
        if (!v29) {
          goto LABEL_6;
        }
        BOOL v14 = v29;
        [(FBAInboxItemsViewController *)self performSegueWithIdentifier:v29 sender:v13];
        break;
      default:
        goto LABEL_6;
    }
  }

LABEL_6:
LABEL_11:
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  if ([a3 isEditing])
  {
    id v8 = [(FBAInboxItemsViewController *)self tableView];
    id v5 = [v8 indexPathsForSelectedRows];
    BOOL v6 = [v5 count] != 0;
    id v7 = [(FBAInboxItemsViewController *)self destructiveBarButtonItem];
    [v7 setEnabled:v6];
  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(FBAInboxItemsViewController *)self inbox];
  unsigned __int8 v5 = [v4 supportsSelection];

  return v5;
}

- (BOOL)tableView:(id)a3 shouldBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
  id v4 = [(FBAInboxItemsViewController *)self inbox];
  unsigned __int8 v5 = [v4 supportsSelection];

  return v5;
}

- (void)tableView:(id)a3 didBeginMultipleSelectionInteractionAtIndexPath:(id)a4
{
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(FBAInboxItemsViewController *)self inbox];
  int64_t v5 = [v4 supportsDeletion];

  return v5;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FBAInboxItemsViewController *)self inbox];
  BOOL v9 = [v8 type] == 0;

  if (v9)
  {
    uint64_t v11 = +[NSBundle mainBundle];
    id v12 = [v11 localizedStringForKey:@"DELETE" value:&stru_1000F6658 table:0];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000232BC;
    v16[3] = &unk_1000F3100;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    unsigned int v13 = +[UIContextualAction contextualActionWithStyle:1 title:v12 handler:v16];

    unsigned int v20 = v13;
    BOOL v14 = +[NSArray arrayWithObjects:&v20 count:1];
    unsigned int v10 = +[UISwipeActionsConfiguration configurationWithActions:v14];

    objc_destroyWeak(&v18);
  }
  else
  {
    unsigned int v10 = +[UISwipeActionsConfiguration configurationWithActions:&__NSArray0__struct];
  }
  objc_destroyWeak(&location);

  return v10;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(FBAInboxItemsViewController *)self activeInboxSource];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FBAInboxItemsViewController *)self inbox];
  id v9 = [v8 type];
  unsigned int v10 = @"FBAMailboxItemCell";
  if (v9 == (id)3) {
    unsigned int v10 = @"FBAOutboxItemCell";
  }
  uint64_t v11 = v10;

  id v12 = [v7 dequeueReusableCellWithIdentifier:v11 forIndexPath:v6];

  unsigned int v13 = [(FBAInboxItemsViewController *)self itemForIndexPath:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v13;
    BOOL v15 = [v14 contentItem];

    if (v15) {
      [v12 updateWithItem:v14 showingTeamName:[self showingSyntheticInbox]];
    }
    else {
      [v12 updateWithEnhancedLoggingSession:v14];
    }
  }
  else
  {
    [v12 updateWithItem:v13 showingTeamName:[self showingSyntheticInbox]];
  }
  id v16 = [(FBAInboxItemsViewController *)self inbox];
  id v17 = [v16 type];

  if (v17 == (id)3)
  {
    id v18 = [v13 formResponse];

    if (v18)
    {
      id v19 = [v13 formResponse];
      [v12 setObservedResponse:v19];
    }
    else
    {
      id v19 = +[FBALog appHandle];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000A56F8(v13, v19);
      }
    }
  }
  [v12 layoutIfNeeded];

  return v12;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = [a3 searchBar];
  id v5 = [v4 text];

  if ([v5 length])
  {
    id v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v7 = [v5 stringByTrimmingCharactersInSet:v6];

    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
    id v9 = [v7 length];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100023784;
    v22[3] = &unk_1000F3128;
    id v23 = v8;
    id v10 = v8;
    [v7 enumerateSubstringsInRange:0 options:1027 usingBlock:v22];
    uint64_t v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v10];
    id v12 = [(FBAInboxItemsViewController *)self sortedInboxItems];
    unsigned int v13 = [v12 filteredArrayUsingPredicate:v11];
    id v14 = (NSMutableArray *)[v13 mutableCopy];
    searchResultItems = self->_searchResultItems;
    self->_searchResultItems = v14;
  }
  else
  {
    id v16 = [(FBAInboxItemsViewController *)self sortedInboxItems];
    id v17 = self->_searchResultItems;
    self->_searchResultItems = v16;
  }
  id v18 = [(FBAInboxItemsViewController *)self filterManager];
  unsigned int v19 = [v18 active];

  if (v19)
  {
    unsigned int v20 = [(FBAInboxItemsViewController *)self filterManager];
    [(FBAInboxItemsViewController *)self filterContentForFilterManager:v20];
  }
  unsigned int v21 = [(FBAInboxItemsViewController *)self tableView];
  [v21 reloadData];
}

- (void)didDismissSearchController:(id)a3
{
  [(FBAInboxItemsViewController *)self setSearchResultItems:0];
  [(FBAInboxItemsViewController *)self reloadView];

  [(FBAInboxItemsViewController *)self becomeFirstResponder];
}

- (void)updateSearchResults
{
  id v3 = [(FBAInboxItemsViewController *)self searchController];
  [(FBAInboxItemsViewController *)self updateSearchResultsForSearchController:v3];
}

- (id)activeInboxSource
{
  id v3 = [(FBAInboxItemsViewController *)self filteredInboxItems];

  if (v3) {
    [(FBAInboxItemsViewController *)self filteredInboxItems];
  }
  else {
  id v4 = [(FBAInboxItemsViewController *)self filterSource];
  }

  return v4;
}

- (id)filterSource
{
  id v3 = [(FBAInboxItemsViewController *)self searchResultItems];

  if (v3) {
    [(FBAInboxItemsViewController *)self searchResultItems];
  }
  else {
  id v4 = [(FBAInboxItemsViewController *)self sortedInboxItems];
  }

  return v4;
}

- (id)itemForIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(FBAInboxItemsViewController *)self activeInboxSource];
  id v6 = [v4 row];

  id v7 = [v5 objectAtIndex:v6];

  return v7;
}

- (unint64_t)newFeedbackButtonState
{
  id v2 = [(FBAInboxItemsViewController *)self team];
  unsigned int v3 = [v2 canStartNewFeedback];

  if (v3) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)createNewFeedback:(id)a3
{
  id v4 = a3;
  id v6 = +[FBADraftManager sharedInstance];
  id v5 = [(FBAInboxItemsViewController *)self team];
  [v6 beginFeedbackForTeam:v5 sender:v4];
}

- (id)leftToolbarItem
{
  unsigned int v3 = [(FBAInboxItemsViewController *)self filterManager];
  unsigned int v4 = [v3 active];

  BOOL v5 = v4 == 0;
  if (v4) {
    CFStringRef v6 = @"DISABLE_FILTER";
  }
  else {
    CFStringRef v6 = @"ENABLE_FILTER";
  }
  id v7 = &FBKSystemImageNameFilterActive;
  if (v5) {
    id v7 = &FBKSystemImageNameFilterInactive;
  }
  id v8 = +[UIImage systemImageNamed:*v7];
  id v9 = [objc_alloc((Class)UIBarButtonItem) initWithImage:v8 style:0 target:self action:"toggleFiltering"];
  id v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 localizedStringForKey:v6 value:&stru_1000F6658 table:FBKCommonStrings];
  [v9 setAccessibilityLabel:v11];

  return v9;
}

- (void)toggleFiltering
{
  id v2 = [(FBAInboxItemsViewController *)self filterManager];
  [v2 toggleActive];
}

- (void)filterContentForFilterManager:(id)a3
{
  id v14 = a3;
  if ([v14 active])
  {
    unsigned int v4 = [(FBAInboxItemsViewController *)self filterSource];
    BOOL v5 = [v14 predicate];
    CFStringRef v6 = [v4 filteredArrayUsingPredicate:v5];
    id v7 = [v6 mutableCopy];
    [(FBAInboxItemsViewController *)self setFilteredInboxItems:v7];

    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"FILTERED_BY_PROMPT" value:&stru_1000F6658 table:FBKCommonStrings];

    id v10 = [v14 userDescription];
  }
  else
  {
    [(FBAInboxItemsViewController *)self setFilteredInboxItems:0];
    id v10 = 0;
    id v9 = &stru_1000F6658;
  }
  uint64_t v11 = [(FBAInboxItemsViewController *)self navigationController];
  id v12 = [v11 topViewController];

  if (v12 == self) {
    [(FBAInboxItemsViewController *)self showToolbarWithStatus:v9 subtitle:v10 animated:1];
  }
  unsigned int v13 = [(FBAInboxItemsViewController *)self tableView];
  [v13 reloadData];
}

- (void)didTapSubtitleAction:(id)a3
{
  id v9 = [[_TtC18Feedback_Assistant25FBAFilterPickerController alloc] initWithStyle:2];
  unsigned int v4 = [(FBAInboxItemsViewController *)self filterManager];
  [(FBAFilterPickerController *)v9 setFilterManager:v4];

  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v9];
  [v5 setModalPresentationStyle:7];
  CFStringRef v6 = [(FBAInboxItemsViewController *)self navigationController];
  id v7 = [v6 toolbar];
  id v8 = [v5 presentationController];
  [v8 setSourceView:v7];

  [(FBAInboxItemsViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (FBAInbox)inbox
{
  return self->_inbox;
}

- (void)setInbox:(id)a3
{
}

- (FBKTeam)team
{
  return self->_team;
}

- (BOOL)showingSyntheticInbox
{
  return self->_showingSyntheticInbox;
}

- (void)setShowingSyntheticInbox:(BOOL)a3
{
  self->_showingSyntheticInbox = a3;
}

- (NSMutableArray)fbaDataObservers
{
  return self->_fbaDataObservers;
}

- (void)setFbaDataObservers:(id)a3
{
}

- (id)defaultCenterObserver
{
  return self->_defaultCenterObserver;
}

- (void)setDefaultCenterObserver:(id)a3
{
}

- (NSMutableArray)sortedInboxItems
{
  return self->_sortedInboxItems;
}

- (void)setSortedInboxItems:(id)a3
{
}

- (NSMutableArray)filteredInboxItems
{
  return self->_filteredInboxItems;
}

- (void)setFilteredInboxItems:(id)a3
{
}

- (NSMutableArray)searchResultItems
{
  return self->_searchResultItems;
}

- (void)setSearchResultItems:(id)a3
{
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
}

- (UIBarButtonItem)destructiveBarButtonItem
{
  return self->_destructiveBarButtonItem;
}

- (void)setDestructiveBarButtonItem:(id)a3
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (NSIndexPath)currDetailIndexPath
{
  return self->_currDetailIndexPath;
}

- (void)setCurrDetailIndexPath:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
}

- (_TtC18Feedback_Assistant16FBAFilterManager)filterManager
{
  return self->_filterManager;
}

- (void)setFilterManager:(id)a3
{
}

- (NSTimer)refreshTimer
{
  return self->_refreshTimer;
}

- (void)setRefreshTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshTimer, 0);
  objc_storeStrong((id *)&self->_filterManager, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_currDetailIndexPath, 0);
  objc_storeStrong((id *)&self->_destructiveBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_searchResultItems, 0);
  objc_storeStrong((id *)&self->_filteredInboxItems, 0);
  objc_storeStrong((id *)&self->_sortedInboxItems, 0);
  objc_storeStrong(&self->_defaultCenterObserver, 0);
  objc_storeStrong((id *)&self->_fbaDataObservers, 0);
  objc_storeStrong((id *)&self->_team, 0);

  objc_storeStrong((id *)&self->_inbox, 0);
}

@end