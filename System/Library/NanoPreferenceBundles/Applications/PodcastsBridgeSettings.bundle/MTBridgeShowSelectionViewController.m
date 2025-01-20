@interface MTBridgeShowSelectionViewController
- (MTBridgeShowSelectionViewController)init;
- (MTBridgeShowSelectionViewControllerDelegate)delegate;
- (id)_addedShowsPredicate;
- (id)_otherShowsPredicate;
- (id)_specifierForShow:(id)a3;
- (id)specifiers;
- (id)title;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_doneButtonPressed:(id)a3;
- (void)_handlePodcastsIdentifiersDidChangeNotification:(id)a3;
- (void)_updatePredicates;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTBridgeShowSelectionViewController

- (MTBridgeShowSelectionViewController)init
{
  v27.receiver = self;
  v27.super_class = (Class)MTBridgeShowSelectionViewController;
  v2 = [(MTBridgeShowSelectionViewController *)&v27 init];
  if (v2)
  {
    uint64_t v3 = kMTPodcastEntityName;
    v4 = +[NSFetchRequest fetchRequestWithEntityName:kMTPodcastEntityName];
    v5 = [(MTBridgeShowSelectionViewController *)v2 _addedShowsPredicate];
    [v4 setPredicate:v5];

    v6 = +[MTPodcast sortDescriptorsForTitle:1];
    [v4 setSortDescriptors:v6];

    uint64_t v7 = kPodcastTitle;
    uint64_t v8 = kPodcastFeedUrl;
    v29[0] = kPodcastTitle;
    v29[1] = kPodcastFeedUrl;
    uint64_t v9 = kPodcastUuid;
    v29[2] = kPodcastUuid;
    v10 = +[NSArray arrayWithObjects:v29 count:3];
    [v4 setPropertiesToFetch:v10];

    [v4 setFetchBatchSize:20];
    id v11 = objc_alloc((Class)NSFetchedResultsController);
    v12 = +[MTDB sharedInstance];
    v13 = [v12 mainQueueContext];
    v14 = (NSFetchedResultsController *)[v11 initWithFetchRequest:v4 managedObjectContext:v13 sectionNameKeyPath:0 cacheName:0];
    addedShowsFRC = v2->_addedShowsFRC;
    v2->_addedShowsFRC = v14;

    [(NSFetchedResultsController *)v2->_addedShowsFRC setDelegate:v2];
    v16 = +[NSFetchRequest fetchRequestWithEntityName:v3];
    v17 = [(MTBridgeShowSelectionViewController *)v2 _otherShowsPredicate];
    [v16 setPredicate:v17];

    v18 = +[MTPodcast sortDescriptorsForTitle:1];
    [v16 setSortDescriptors:v18];

    v28[0] = v7;
    v28[1] = v8;
    v28[2] = v9;
    v19 = +[NSArray arrayWithObjects:v28 count:3];
    [v16 setPropertiesToFetch:v19];

    [v16 setFetchBatchSize:20];
    id v20 = objc_alloc((Class)NSFetchedResultsController);
    v21 = +[MTDB sharedInstance];
    v22 = [v21 mainQueueContext];
    v23 = (NSFetchedResultsController *)[v20 initWithFetchRequest:v16 managedObjectContext:v22 sectionNameKeyPath:0 cacheName:0];
    otherShowsFRC = v2->_otherShowsFRC;
    v2->_otherShowsFRC = v23;

    [(NSFetchedResultsController *)v2->_otherShowsFRC setDelegate:v2];
    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v2 selector:"_handlePodcastsIdentifiersDidChangeNotification:" name:NMSMediaPinningManagerPodcastsIdentifiersDidChangeNotification object:0];
  }
  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MTBridgeShowSelectionViewController;
  [(MTBridgeShowSelectionViewController *)&v3 viewDidLoad];
  [(MTBridgeShowSelectionViewController *)self setEditable:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MTBridgeShowSelectionViewController;
  [(MTBridgeShowSelectionViewController *)&v8 viewWillAppear:a3];
  v4 = [(MTBridgeShowSelectionViewController *)self navigationItem];
  v5 = [v4 rightBarButtonItem];
  [v5 setTarget:self];

  v6 = [(MTBridgeShowSelectionViewController *)self navigationItem];
  uint64_t v7 = [v6 rightBarButtonItem];
  [v7 setAction:"_doneButtonPressed:"];
}

- (id)title
{
  v2 = +[NSBundle podcastsFoundationBundle];
  objc_super v3 = [v2 localizedStringForKey:@"ADD_SHOWS_VIEW_TITLE" value:@"Add Shows" table:0];

  return v3;
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  objc_super v3 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    v6 = +[NSMutableArray array];
    addedShowsFRC = self->_addedShowsFRC;
    id v54 = 0;
    unsigned __int8 v8 = [(NSFetchedResultsController *)addedShowsFRC performFetch:&v54];
    id v9 = v54;
    if ((v8 & 1) == 0)
    {
      v10 = _MTLogCategoryBridge();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v9;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Could not fetch added shows: %@", buf, 0xCu);
      }
    }
    id v11 = [(NSFetchedResultsController *)self->_addedShowsFRC fetchedObjects];
    id v12 = [v11 count];

    if (v12)
    {
      v13 = +[NSBundle podcastsFoundationBundle];
      v14 = [v13 localizedStringForKey:@"ADDED_SHOWS_SECTION_HEADER" value:@"Added Shows" table:0];
      v15 = +[PSSpecifier groupSpecifierWithID:@"AddedShowsGroup" name:v14];
      [v6 addObject:v15];
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v16 = [(NSFetchedResultsController *)self->_addedShowsFRC fetchedObjects];
    id v17 = [v16 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [(MTBridgeShowSelectionViewController *)self _specifierForShow:*(void *)(*((void *)&v50 + 1) + 8 * i)];
          [v6 addObject:v21];
        }
        id v18 = [v16 countByEnumeratingWithState:&v50 objects:v56 count:16];
      }
      while (v18);
    }

    otherShowsFRC = self->_otherShowsFRC;
    id v49 = 0;
    unsigned __int8 v23 = [(NSFetchedResultsController *)otherShowsFRC performFetch:&v49];
    id v24 = v49;
    if ((v23 & 1) == 0)
    {
      v25 = _MTLogCategoryBridge();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v24;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_ERROR, "Could not fetch other shows: %@", buf, 0xCu);
      }
    }
    v26 = [(NSFetchedResultsController *)self->_otherShowsFRC fetchedObjects];
    id v27 = [v26 count];

    if (v27)
    {
      v28 = +[NSBundle podcastsFoundationBundle];
      v29 = [v28 localizedStringForKey:@"CHOOSE_SHOWS_SECTION_HEADER" value:@"Choose Shows" table:0];
      v30 = +[PSSpecifier groupSpecifierWithID:@"OtherShowsGroup" name:v29];
      [v6 addObject:v30];
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v31 = [(NSFetchedResultsController *)self->_otherShowsFRC fetchedObjects];
    id v32 = [v31 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v46;
      do
      {
        for (j = 0; j != v33; j = (char *)j + 1)
        {
          if (*(void *)v46 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [(MTBridgeShowSelectionViewController *)self _specifierForShow:*(void *)(*((void *)&v45 + 1) + 8 * (void)j)];
          [v6 addObject:v36];
        }
        id v33 = [v31 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v33);
    }

    if ([v6 count])
    {
      [(MTBridgeShowSelectionViewController *)self _setContentUnavailableConfiguration:0];
    }
    else
    {
      v37 = +[UIContentUnavailableConfiguration emptyProminentConfiguration];
      v38 = +[NSBundle podcastsFoundationBundle];
      v39 = [v38 localizedStringForKey:@"NO_CONTENT_TITLE" value:@"No Shows Yet" table:0];
      [v37 setText:v39];

      v40 = +[NSBundle podcastsFoundationBundle];
      v41 = [v40 localizedStringForKey:@"NO_CONTENT_MESSAGE", @"To download episodes, follow some shows first.", 0 value table];
      [v37 setSecondaryText:v41];

      [(MTBridgeShowSelectionViewController *)self _setContentUnavailableConfiguration:v37];
    }
    id v42 = [v6 copy];
    v43 = *(void **)&self->PSEditableListController_opaque[v2];
    *(void *)&self->PSEditableListController_opaque[v2] = v42;

    id v4 = *(id *)&self->PSEditableListController_opaque[v2];
  }

  return v4;
}

- (id)_specifierForShow:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:4 edit:0];

  uint64_t v7 = [v4 feedURL];
  [v6 setIdentifier:v7];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v6 setProperty:&__kCFBooleanFalse forKey:NMBUISpecifierShouldShowSwitchKey];
  id v8 = objc_alloc_init((Class)NMBUIMediaTableCellConfiguration);
  id v9 = [v4 feedURL];
  [v8 setModelObject:v9];

  v10 = [v4 title];
  [v8 setTitle:v10];

  [v8 setPlaceholderSystemImageName:@"podcasts"];
  id v11 = [v4 artworkCatalog];

  [v8 setArtworkCatalog:v11];
  [v6 setProperty:v8 forKey:NMBUISpecifierCellConfigurationKey];

  return v6;
}

- (id)_addedShowsPredicate
{
  uint64_t v2 = +[MTPodcast predicateForSubscribedAndNotHidden];
  objc_super v3 = +[MTPodcast predicateForEntitledShows];
  id v4 = [v2 AND:v3];
  v5 = +[NSPredicate predicateWithFormat:@"%K != NULL", kPodcastTitle];
  v6 = [v4 AND:v5];
  uint64_t v7 = kPodcastFeedUrl;
  id v8 = +[NMSMediaPinningManager sharedManager];
  id v9 = [v8 podcastsSelectedShowFeedURLs];
  v10 = +[NSPredicate predicateWithFormat:@"%K IN %@", v7, v9];
  id v11 = [v6 AND:v10];

  return v11;
}

- (id)_otherShowsPredicate
{
  uint64_t v2 = +[MTPodcast predicateForSubscribedAndNotHidden];
  objc_super v3 = +[MTPodcast predicateForEntitledShows];
  id v4 = [v2 AND:v3];
  v5 = +[NSPredicate predicateWithFormat:@"%K != NULL", kPodcastTitle];
  v6 = [v4 AND:v5];
  uint64_t v7 = kPodcastFeedUrl;
  id v8 = +[NMSMediaPinningManager sharedManager];
  id v9 = [v8 podcastsSelectedShowFeedURLs];
  v10 = +[NSPredicate predicateWithFormat:@"%K IN %@", v7, v9];
  id v11 = [v10 NOT];
  id v12 = [v6 AND:v11];

  return v12;
}

- (void)_updatePredicates
{
  objc_super v3 = [(MTBridgeShowSelectionViewController *)self _addedShowsPredicate];
  id v4 = [(NSFetchedResultsController *)self->_addedShowsFRC fetchRequest];
  [v4 setPredicate:v3];

  id v6 = [(MTBridgeShowSelectionViewController *)self _otherShowsPredicate];
  v5 = [(NSFetchedResultsController *)self->_otherShowsFRC fetchRequest];
  [v5 setPredicate:v6];
}

- (void)_doneButtonPressed:(id)a3
{
  id v4 = [(MTBridgeShowSelectionViewController *)self delegate];
  [v4 viewControllerDidSelectDone:self];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(MTBridgeShowSelectionViewController *)self numberOfGroups] == (char *)&dword_0 + 1)
  {
    id v6 = [(MTBridgeShowSelectionViewController *)self specifierAtIndexPath:v5];

    uint64_t v7 = [(MTBridgeShowSelectionViewController *)self getGroupSpecifierForSpecifier:v6];

    id v8 = [v7 identifier];
    LODWORD(v6) = [v8 isEqualToString:@"AddedShowsGroup"];

    if (v6) {
      int64_t v9 = 1;
    }
    else {
      int64_t v9 = 2;
    }
  }
  else
  {
    id v10 = [v5 section];

    if (v10) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v25 = a3;
  id v8 = a5;
  int64_t v9 = [(MTBridgeShowSelectionViewController *)self specifierAtIndexPath:v8];
  id v10 = [objc_alloc((Class)NMSPodcastsDownloadSettings) initWithCollectionType:3];
  id v11 = v10;
  if (a4 == 2)
  {
LABEL_4:
    id v12 = [v9 propertyForKey:NMBUISpecifierCellConfigurationKey];
    v13 = [v12 modelObject];

    v14 = +[NMSMediaPinningManager sharedManager];
    [v14 setPodcastsDownloadSettings:v11 forShowFeedURL:v13];

    [(MTBridgeShowSelectionViewController *)self _updatePredicates];
    uint64_t v15 = OBJC_IVAR___PSListController__specifiers;
    v16 = *(void **)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers];
    *(void *)&self->PSEditableListController_opaque[OBJC_IVAR___PSListController__specifiers] = 0;

    id v17 = [(MTBridgeShowSelectionViewController *)self specifiers];
    [(MTBridgeShowSelectionViewController *)self createGroupIndices];
    id v18 = [v25 numberOfSections];
    uint64_t v19 = [v25 dataSource];
    id v20 = [v19 numberOfSectionsInTableView:v25];

    if (v20 == v18)
    {
      v21 = *(void **)&self->PSEditableListController_opaque[v15];
      v22 = [v9 identifier];
      id v23 = [v21 indexOfSpecifierWithID:v22];

      id v24 = [(MTBridgeShowSelectionViewController *)self indexPathForIndex:v23];
      [v25 moveRowAtIndexPath:v8 toIndexPath:v24];
    }
    else
    {
      [v25 reloadData];
    }

    goto LABEL_8;
  }
  if (a4 == 1)
  {
    [v10 setNumberOfEpisodes:0];
    goto LABEL_4;
  }
LABEL_8:
}

- (void)_handlePodcastsIdentifiersDidChangeNotification:(id)a3
{
  [(MTBridgeShowSelectionViewController *)self _updatePredicates];

  [(MTBridgeShowSelectionViewController *)self reloadSpecifiers];
}

- (MTBridgeShowSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTBridgeShowSelectionViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_otherShowsFRC, 0);

  objc_storeStrong((id *)&self->_addedShowsFRC, 0);
}

@end