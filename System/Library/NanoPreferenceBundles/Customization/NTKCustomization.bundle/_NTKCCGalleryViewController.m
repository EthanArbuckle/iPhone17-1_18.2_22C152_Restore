@interface _NTKCCGalleryViewController
- (BOOL)deviceCanBePrewarmed;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSMutableArray)faceVCs;
- (NTKCCFaceAddedInfoViewController)infoPopover;
- (NTKCGalleryCell)previewingGalleryCell;
- (UITableView)tableView;
- (_NTKCCGalleryViewController)init;
- (id)_createWrappedCollectionsForDevice:(id)a3 completion:(id)a4;
- (id)_viewControllerForFace:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)galleryCell:(id)a3 viewForFace:(id)a4 atIndex:(int64_t)a5;
- (id)selectionFinishedHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_activeDeviceChanged;
- (void)_appDidBecomeActive:(id)a3;
- (void)_clearFaceViewControllers;
- (void)_faceAdded:(id)a3;
- (void)_load;
- (void)_navigateToRowContainingBundleIdentifier:(id)a3;
- (void)_navigateToRowContainingWhatsNew;
- (void)_prewarmNextGallerySnapshot;
- (void)_prideFaceStateMachine:(id)a3;
- (void)_queryForNewFaces;
- (void)_reloadGalleryCollections;
- (void)_setupGalleryCollection:(id)a3 atIndex:(unint64_t)a4 shouldUpdateSnaphots:(BOOL)a5 shouldReloadRow:(BOOL)a6;
- (void)_setupGalleryPromise;
- (void)_showInfoPopoverIfNecessaryForFace:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)dealloc;
- (void)galleryCell:(id)a3 didSelectFace:(id)a4 finishedSelectionHandler:(id)a5;
- (void)galleryCollectionDidChange:(id)a3 shouldUpdateSnaphots:(BOOL)a4;
- (void)setFaceVCs:(id)a3;
- (void)setInfoPopover:(id)a3;
- (void)setPreviewingGalleryCell:(id)a3;
- (void)setSelectionFinishedHandler:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _NTKCCGalleryViewController

- (void)_appDidBecomeActive:(id)a3
{
  v4 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Attempting a throttled query…", v8, 2u);
  }

  if (!qword_2E4B0 || ([(id)qword_2E4B0 timeIntervalSinceNow], v5 >= 900.0))
  {
    uint64_t v6 = +[NSDate date];
    v7 = (void *)qword_2E4B0;
    qword_2E4B0 = v6;

    [(_NTKCCGalleryViewController *)self _queryForNewFaces];
  }
}

- (void)_setupGalleryPromise
{
  if (([(_NTKCCGalleryViewController *)self isViewLoaded] & 1) == 0)
  {
    if ([(_NTKCCGalleryViewController *)self deviceCanBePrewarmed])
    {
      v3 = +[CLKDevice currentDevice];
      if (self->_prewarmingRequest)
      {
        v4 = +[NTKFaceSnapshotCache snapshotCache];
        [v4 cancelSnapshotRequest:self->_prewarmingRequest];

        prewarmingRequest = self->_prewarmingRequest;
        self->_prewarmingRequest = 0;
      }
      objc_initWeak(&location, self);
      uint64_t v6 = +[NSUUID UUID];
      v7 = [v6 UUIDString];
      v8 = +[NSString stringWithFormat:@"PrewarmGalleryCollections-%@", v7];
      promiseName = self->_promiseName;
      self->_promiseName = v8;

      self->_promiseLoaded = 0;
      v10 = self->_promiseName;
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_45F8;
      v15[3] = &unk_24D20;
      objc_copyWeak(&v17, &location);
      id v11 = v3;
      id v16 = v11;
      v12 = +[NTKPromise promiseNamed:v10 withBackgroundPriority:17 foregroundPriority:17 block:v15];
      galleryPromise = self->_galleryPromise;
      self->_galleryPromise = v12;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    else
    {
      v14 = self->_galleryPromise;
      self->_galleryPromise = 0;
    }
  }
}

- (_NTKCCGalleryViewController)init
{
  v33.receiver = self;
  v33.super_class = (Class)_NTKCCGalleryViewController;
  v2 = [(_NTKCCGalleryViewController *)&v33 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = NTKCCustomizationLocalizedString();
    [(_NTKCCGalleryViewController *)v2 setTitle:v3];

    v4 = [(_NTKCCGalleryViewController *)v2 navigationItem];
    [v4 _setLargeTitleTwoLineMode:1];

    double v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_faceAdded:" name:NTKCFaceDetailViewControllerDidAddFace object:0];

    uint64_t v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"_activeDeviceChanged" name:CLKActiveDeviceChangedNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_reloadGalleryCollections" name:NTKSystemAppStateChangedNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_reloadGalleryCollections" name:NTKFaceBundleManagerDidUpdateBundlesNotificationName object:0];

    objc_initWeak(&location, v2);
    v9 = +[UIApplication sharedApplication];
    unsigned __int8 v10 = [v9 launchedToTest];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = +[CLKDevice activeNRDevice];
      currentActiveDevice = v2->_currentActiveDevice;
      v2->_currentActiveDevice = (NRDevice *)v11;
    }
    [(_NTKCCGalleryViewController *)v2 _setupGalleryPromise];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_EE04;
    v30[3] = &unk_24C18;
    objc_copyWeak(&v31, &location);
    v13 = objc_retainBlock(v30);
    id localeChangedCallback = v2->_localeChangedCallback;
    v2->_id localeChangedCallback = v13;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_EE48;
    v28[3] = &unk_24C18;
    objc_copyWeak(&v29, &location);
    v15 = objc_retainBlock(v28);
    id migrationFractionChangedCallback = v2->_migrationFractionChangedCallback;
    v2->_id migrationFractionChangedCallback = v15;

    id v17 = v2->_currentActiveDevice;
    uint64_t v34 = NRDevicePropertyCurrentUserLocale;
    v18 = +[NSArray arrayWithObjects:&v34 count:1];
    [(NRDevice *)v17 registerForPropertyChanges:v18 withBlock:v2->_localeChangedCallback];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"_prideFaceStateMachine:" name:NSCurrentLocaleDidChangeNotification object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v2 selector:"_reloadGalleryCollections" name:NTKCompanionFaceCollectionsDidChangeNotification object:0];

    uint64_t v21 = +[NSMutableIndexSet indexSet];
    collectionsLookup = v2->_collectionsLookup;
    v2->_collectionsLookup = (NSMutableIndexSet *)v21;

    uint64_t v23 = +[NSMutableDictionary dictionary];
    snapshotLookup = v2->_snapshotLookup;
    v2->_snapshotLookup = (NSMutableDictionary *)v23;

    v25 = +[UIApplication sharedApplication];
    LODWORD(v20) = [v25 applicationState] == 0;

    if (v20) {
      [(_NTKCCGalleryViewController *)v2 _queryForNewFaces];
    }
    v26 = +[NSNotificationCenter defaultCenter];
    [v26 addObserver:v2 selector:"_appDidBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (BOOL)deviceCanBePrewarmed
{
  return 1;
}

- (void)_queryForNewFaces
{
}

- (id)_createWrappedCollectionsForDevice:(id)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = +[NTKGalleryCollection galleryCollectionsForDevice:a3];
  v7 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [[_NTKCCGalleryCollectionWrapper alloc] initWithCollection:*(void *)(*((void *)&v18 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_F28C;
    block[3] = &unk_24CA8;
    id v17 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  id v14 = [v7 copy];

  return v14;
}

- (void)_navigateToRowContainingBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[NTKFaceBundleManager sharedManager];
  uint64_t v6 = +[CLKDevice currentDevice];
  v7 = [v5 faceBundleForBundleIdentifier:v4 onDevice:v6];
  id v8 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Found bundle %@ for ID %@", buf, 0x16u);
  }

  id v9 = [v7 galleryTitleForDevice:v6];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  collections = self->_collections;
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  long long v19 = sub_F140;
  long long v20 = &unk_24C40;
  id v11 = v9;
  id v21 = v11;
  v22 = buf;
  [(NSArray *)collections enumerateObjectsUsingBlock:&v17];
  v12 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(*(void *)&buf[8] + 24);
    *(_DWORD *)uint64_t v23 = 134217984;
    uint64_t v24 = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "Attempting to scroll to collection at index %lu", v23, 0xCu);
  }

  uint64_t v14 = *(void *)(*(void *)&buf[8] + 24);
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v14, 0, v17, v18, v19, v20);
    id v16 = [(_NTKCCGalleryViewController *)self tableView];
    [v16 scrollToRowAtIndexPath:v15 atScrollPosition:2 animated:0];
  }
  _Block_object_dispose(buf, 8);
}

- (void)_navigateToRowContainingWhatsNew
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Attempting to scroll to What's New at index 0", v6, 2u);
  }

  id v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
  id v5 = [(_NTKCCGalleryViewController *)self tableView];
  [v5 scrollToRowAtIndexPath:v4 atScrollPosition:2 animated:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  currentActiveDevice = self->_currentActiveDevice;
  uint64_t v7 = NRDevicePropertyCurrentUserLocale;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [(NRDevice *)currentActiveDevice unregisterForPropertyChanges:v5 withBlock:self->_localeChangedCallback];

  v6.receiver = self;
  v6.super_class = (Class)_NTKCCGalleryViewController;
  [(_NTKCCGalleryViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)_NTKCCGalleryViewController;
  [(_NTKCCGalleryViewController *)&v15 viewDidLoad];
  [(_NTKCCGalleryViewController *)self _load];
  id v3 = objc_alloc((Class)UITableView);
  id v4 = [(_NTKCCGalleryViewController *)self view];
  [v4 bounds];
  id v5 = objc_msgSend(v3, "initWithFrame:style:", 0);
  [(_NTKCCGalleryViewController *)self setTableView:v5];

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  objc_super v6 = BPSBackgroundColor();
  [(UITableView *)self->_tableView setBackgroundColor:v6];

  [(UITableView *)self->_tableView setIndicatorStyle:2];
  uint64_t v7 = NTKCSeparatorColor();
  [(UITableView *)self->_tableView setSeparatorColor:v7];

  NTKCScreenEdgeMargin();
  -[UITableView setSeparatorInset:](self->_tableView, "setSeparatorInset:", 0.0, v8, 0.0, 0.0);
  [(UITableView *)self->_tableView setClipsToBounds:0];
  +[NTKCGalleryCell estimatedRowHeight];
  -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:");
  tableView = self->_tableView;
  uint64_t v10 = objc_opt_class();
  id v11 = +[NTKCGalleryCell reuseIdentifier];
  [(UITableView *)tableView registerClass:v10 forCellReuseIdentifier:v11];

  v12 = self->_tableView;
  id v13 = [objc_alloc((Class)UIContextMenuInteraction) initWithDelegate:self];
  [(UITableView *)v12 addInteraction:v13];

  uint64_t v14 = [(_NTKCCGalleryViewController *)self view];
  [v14 addSubview:self->_tableView];

  [(_NTKCCGalleryViewController *)self _prideFaceStateMachine:0];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_NTKCCGalleryViewController;
  [(_NTKCCGalleryViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(_NTKCCGalleryViewController *)self view];
  [v3 bounds];
  -[UITableView setFrame:](self->_tableView, "setFrame:");
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_NTKCCGalleryViewController;
  [(_NTKCCGalleryViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = +[NSNotification notificationWithName:@"PrideFaceGalleryViewed" object:0];
  [(_NTKCCGalleryViewController *)self _prideFaceStateMachine:v4];
  selectionFinishedHandler = (void (**)(void))self->_selectionFinishedHandler;
  if (selectionFinishedHandler) {
    selectionFinishedHandler[2]();
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_NTKCCGalleryViewController;
  [(_NTKCCGalleryViewController *)&v3 viewDidAppear:a3];
  NTKCCAnalyticsIncrement();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_NTKCCGalleryViewController;
  [(_NTKCCGalleryViewController *)&v7 viewDidDisappear:a3];
  objc_super v4 = [(_NTKCCGalleryViewController *)self navigationController];
  id v5 = [v4 presentedViewController];
  infoPopover = self->_infoPopover;

  if (v5 == infoPopover)
  {
    [(_NTKCCGalleryViewController *)self setInfoPopover:0];
    [(_NTKCCGalleryViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_load
{
  faceVCs = self->_faceVCs;
  self->_faceVCs = 0;

  galleryPromise = self->_galleryPromise;
  if (galleryPromise)
  {
    id v5 = [(NTKPromise *)galleryPromise object];
    objc_super v6 = self->_galleryPromise;
    self->_galleryPromise = 0;
  }
  else
  {
    objc_super v7 = +[CLKDevice currentDevice];
    id v5 = [(_NTKCCGalleryViewController *)self _createWrappedCollectionsForDevice:v7 completion:0];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_F83C;
    v9[3] = &unk_24CD0;
    v9[4] = self;
    [(NSArray *)v5 enumerateObjectsUsingBlock:v9];
  }
  collections = self->_collections;
  self->_collections = v5;
}

- (void)_prideFaceStateMachine:(id)a3
{
  id v10 = a3;
  objc_super v4 = +[CLKDevice deviceForNRDevice:self->_currentActiveDevice];
  Class v5 = NSClassFromString(@"NTKPrideDigitalFace");
  objc_super v6 = (char *)[(objc_class *)v5 enabledState];
  if ((unint64_t)(v6 - 1) < 2)
  {
    double v8 = +[CLKDevice deviceForNRDevice:self->_currentActiveDevice];
    unsigned __int8 v9 = [(objc_class *)v5 isAvailableForDevice:v8];

    if ((v9 & 1) == 0)
    {
      [(_NTKCCGalleryViewController *)self _load];
      [(UITableView *)self->_tableView reloadData];
      [(objc_class *)v5 setEnabledState:3];
    }
  }
  else
  {
    BOOL v7 = v6 == (unsigned char *)&dword_0 + 3 || v6 == 0;
    if (v7 && [(objc_class *)v5 isAvailableForDevice:v4])
    {
      [(_NTKCCGalleryViewController *)self _load];
      [(UITableView *)self->_tableView reloadData];
      [(objc_class *)v5 setEnabledState:2];
      [(_NTKCCGalleryViewController *)self _prideFaceStateMachine:v10];
    }
  }
}

- (void)_reloadGalleryCollections
{
  if ([(_NTKCCGalleryViewController *)self isViewLoaded])
  {
    [(_NTKCCGalleryViewController *)self _clearFaceViewControllers];
    [(_NTKCCGalleryViewController *)self _load];
    [(UITableView *)self->_tableView reloadData];
    objc_super v3 = [(_NTKCCGalleryViewController *)self navigationController];
    objc_super v4 = [v3 topViewController];
    Class v5 = [(_NTKCCGalleryViewController *)self navigationController];
    objc_super v6 = [v5 viewControllers];
    BOOL v7 = [v6 firstObject];

    if (v4 != v7)
    {
      id v9 = [(_NTKCCGalleryViewController *)self navigationController];
      id v8 = [v9 popToRootViewControllerAnimated:1];
    }
  }
  else
  {
    [(_NTKCCGalleryViewController *)self _setupGalleryPromise];
  }
}

- (void)_activeDeviceChanged
{
  objc_initWeak(&location, self);
  id v2 = +[CLKDevice currentDevice];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2E4B8);
  id WeakRetained = objc_loadWeakRetained(&qword_2E4C0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  objc_super v4 = WeakRetained;
  id v5 = objc_loadWeakRetained(&qword_2E4C0);
  if (v2 != v5)
  {

LABEL_5:
    id v8 = objc_storeWeak(&qword_2E4C0, v2);
    qword_2E4C8 = (uint64_t)[v2 version];

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_FE48;
    v9[3] = &unk_24D48;
    objc_copyWeak(&v10, &location);
    sub_FE48((uint64_t)v9, v2);
    objc_destroyWeak(&v10);
    goto LABEL_6;
  }
  id v6 = [v2 version];
  uint64_t v7 = qword_2E4C8;

  if (v6 != (id)v7) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2E4B8);

  objc_destroyWeak(&location);
}

- (void)_clearFaceViewControllers
{
}

- (id)_viewControllerForFace:(id)a3
{
  id v4 = a3;
  faceVCs = self->_faceVCs;
  if (!faceVCs)
  {
    id v6 = objc_opt_new();
    [(_NTKCCGalleryViewController *)self setFaceVCs:v6];

    faceVCs = self->_faceVCs;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = faceVCs;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
      objc_msgSend(v12, "face", (void)v16);
      id v13 = (id)objc_claimAutoreleasedReturnValue();

      if (v13 == v4) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v14 = v12;

    if (v14) {
      goto LABEL_14;
    }
  }
  else
  {
LABEL_11:
  }
  id v14 = [objc_alloc((Class)NTKFaceSnapshotViewController) initWithFace:v4];
  [(NSMutableArray *)self->_faceVCs addObject:v14];
LABEL_14:

  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_collections count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  tableView = self->_tableView;
  id v6 = a4;
  uint64_t v7 = +[NTKCGalleryCell reuseIdentifier];
  id v8 = [(UITableView *)tableView dequeueReusableCellWithIdentifier:v7 forIndexPath:v6];

  [v8 setDelegate:self];
  id v9 = [v6 row];

  if (v9 < (id)[(NSArray *)self->_collections count])
  {
    uint64_t v10 = [(NSArray *)self->_collections objectAtIndexedSubscript:v9];
    uint64_t v11 = [v10 collection];
    [v8 setCollection:v11];
  }

  return v8;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v11 = a4;
  id v7 = [a5 row];
  if (v7 < (id)[(NSArray *)self->_collections count])
  {
    id v8 = [(NSArray *)self->_collections objectAtIndexedSubscript:v7];
    id v9 = [v11 collection];
    uint64_t v10 = [v8 collection];

    if (v9 == v10)
    {
      [v8 scrollOffset];
      objc_msgSend(v11, "setContentOffset:");
    }
  }
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v16 = a4;
  id v7 = a5;
  [v16 contentOffset];
  double v9 = v8;
  double v11 = v10;
  id v12 = [v7 row];

  if (v12 < (id)[(NSArray *)self->_collections count])
  {
    id v13 = [(NSArray *)self->_collections objectAtIndexedSubscript:v12];
    id v14 = [v16 collection];
    objc_super v15 = [v13 collection];

    if (v14 == v15) {
      objc_msgSend(v13, "setScrollOffset:", v9, v11);
    }
  }
}

- (id)galleryCell:(id)a3 viewForFace:(id)a4 atIndex:(int64_t)a5
{
  id v5 = [(_NTKCCGalleryViewController *)self _viewControllerForFace:a4];
  id v6 = [v5 view];

  return v6;
}

- (void)galleryCell:(id)a3 didSelectFace:(id)a4 finishedSelectionHandler:(id)a5
{
  id v7 = a4;
  [(_NTKCCGalleryViewController *)self setSelectionFinishedHandler:a5];
  id v9 = [v7 addFaceDetailViewController];

  double v8 = [(_NTKCCGalleryViewController *)self navigationController];
  [v8 pushViewController:v9 animated:1];
}

- (void)_setupGalleryCollection:(id)a3 atIndex:(unint64_t)a4 shouldUpdateSnaphots:(BOOL)a5 shouldReloadRow:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  if (a4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([(_NTKCCGalleryViewController *)self isViewLoaded] && v6)
    {
      double v11 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v10 title];
        *(_DWORD *)buf = 138412546;
        uint64_t v23 = v12;
        __int16 v24 = 2048;
        id v25 = v10;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Reloading row for %@ (%p)", buf, 0x16u);
      }
      tableView = self->_tableView;
      id v14 = +[NSIndexPath indexPathForRow:a4 inSection:0];
      id v21 = v14;
      objc_super v15 = +[NSArray arrayWithObjects:&v21 count:1];
      [(UITableView *)tableView reloadRowsAtIndexPaths:v15 withRowAnimation:5];
    }
    if (v7)
    {
      [(NSMutableIndexSet *)self->_collectionsLookup addIndex:a4];
      snapshotLookup = self->_snapshotLookup;
      long long v17 = +[NSNumber numberWithUnsignedInteger:a4];
      long long v18 = [(NSMutableDictionary *)snapshotLookup objectForKey:v17];

      if (v18)
      {
        [v18 removeAllIndexes];
      }
      else
      {
        long long v18 = +[NSMutableIndexSet indexSet];
        long long v19 = self->_snapshotLookup;
        long long v20 = +[NSNumber numberWithUnsignedInteger:a4];
        [(NSMutableDictionary *)v19 setObject:v18 forKey:v20];
      }
      objc_msgSend(v18, "addIndexesInRange:", 0, objc_msgSend(v10, "numberOfFaces"));
      [(_NTKCCGalleryViewController *)self _prewarmNextGallerySnapshot];
    }
  }
}

- (void)galleryCollectionDidChange:(id)a3 shouldUpdateSnaphots:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [v6 title];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Handling change of collection %@ (%p)", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  if (!self->_galleryPromise)
  {
    id v12 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 title];
      *(_DWORD *)uint64_t v26 = 138412546;
      v27 = v13;
      __int16 v28 = 2048;
      id v29 = v6;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "No promise for %@ (%p)", v26, 0x16u);
    }
    double v11 = self->_collections;
    goto LABEL_11;
  }
  if (self->_promiseLoaded)
  {
    id v9 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v6 title];
      *(_DWORD *)uint64_t v26 = 138412546;
      v27 = v10;
      __int16 v28 = 2048;
      id v29 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Promise is loaded %@ (%p)", v26, 0x16u);
    }
    double v11 = [(NTKPromise *)self->_galleryPromise object];
LABEL_11:
    p_super = &v11->super;
    long long v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_10BB0;
    uint64_t v23 = &unk_24C40;
    id v15 = v6;
    id v24 = v15;
    id v25 = buf;
    [p_super enumerateObjectsUsingBlock:&v20];
    uint64_t v16 = *(void *)(*(void *)&buf[8] + 24);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v17 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        long long v18 = objc_msgSend(v15, "title", v20, v21, v22, v23);
        *(_DWORD *)uint64_t v26 = 138412546;
        v27 = v18;
        __int16 v28 = 2048;
        id v29 = v15;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Index not found - skipping %@ (%p)", v26, 0x16u);
      }
    }
    else
    {
      -[_NTKCCGalleryViewController _setupGalleryCollection:atIndex:shouldUpdateSnaphots:shouldReloadRow:](self, "_setupGalleryCollection:atIndex:shouldUpdateSnaphots:shouldReloadRow:", v15, v16, v4, 1, v20, v21, v22, v23);
    }

    goto LABEL_17;
  }
  p_super = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
  {
    long long v19 = [v6 title];
    *(_DWORD *)uint64_t v26 = 138412546;
    v27 = v19;
    __int16 v28 = 2048;
    id v29 = v6;
    _os_log_impl(&dword_0, p_super, OS_LOG_TYPE_DEFAULT, "Promise isn't loaded - skipping %@ (%p)", v26, 0x16u);
  }
LABEL_17:

  _Block_object_dispose(buf, 8);
}

- (void)_prewarmNextGallerySnapshot
{
  if (!self->_prewarmingRequest)
  {
    objc_super v3 = +[NTKFaceSnapshotCache snapshotCache];
    galleryPromise = self->_galleryPromise;
    if (galleryPromise)
    {
      if (!self->_promiseLoaded)
      {
LABEL_10:

        return;
      }
      id v5 = [(NTKPromise *)galleryPromise object];
    }
    else
    {
      id v5 = self->_collections;
    }
    id v6 = v5;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    v33[3] = 0;
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    v32[3] = 0;
    BOOL v7 = self->_collectionsLookup;
    double v8 = self->_snapshotLookup;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10F6C;
    v26[3] = &unk_24D70;
    v30 = v33;
    uint64_t v31 = v32;
    id v9 = v7;
    v27 = v9;
    id v10 = v6;
    __int16 v28 = v10;
    double v11 = v8;
    id v29 = v11;
    id v12 = objc_retainBlock(v26);
    id v13 = ((void (*)(void *, void, uint64_t))v12[2])(v12, 0, 3);
    if (v13
      || (((void (*)(void *, uint64_t, uint64_t))v12[2])(v12, 3, -4),
          (id v13 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v14 = v3;
      id v15 = [objc_alloc((Class)NTKFaceSnapshotCacheRequestOptions) initWithPriority:1];
      objc_initWeak(&location, self);
      id v16 = objc_alloc((Class)NTKFaceSnapshotCacheRequest);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_11344;
      v19[3] = &unk_24DC0;
      objc_copyWeak(&v24, &location);
      long long v20 = v11;
      v22 = v32;
      uint64_t v23 = v33;
      uint64_t v21 = v9;
      long long v17 = (NTKFaceSnapshotCacheRequest *)[v16 initWithFace:v13 options:v15 completion:v19];
      prewarmingRequest = self->_prewarmingRequest;
      self->_prewarmingRequest = v17;

      objc_super v3 = v14;
      [v14 fetchSnapshotWithRequest:self->_prewarmingRequest];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
    _Block_object_dispose(v32, 8);
    _Block_object_dispose(v33, 8);

    goto LABEL_10;
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  BOOL v7 = [(UITableView *)self->_tableView indexPathForRowAtPoint:a3];
  double v8 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v7];
  -[UITableView convertPoint:toView:](self->_tableView, "convertPoint:toView:", v8, x, y);
  id v9 = objc_msgSend(v8, "faceForLocation:");
  id v10 = v9;
  if (v9)
  {
    double v11 = [v9 addFaceDetailViewController];
    id v12 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_116B0;
    v16[3] = &unk_24DE8;
    id v17 = v11;
    id v13 = v11;
    id v14 = +[UIContextMenuConfiguration configurationWithIdentifier:v12 previewProvider:v16 actionProvider:&stru_24E28];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v5 = objc_msgSend(a4, "identifier", a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 CGPointValue];
    double v7 = v6;
    double v9 = v8;
    id v10 = -[UITableView indexPathForRowAtPoint:](self->_tableView, "indexPathForRowAtPoint:");
    double v11 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v10];
    -[UITableView convertPoint:toView:](self->_tableView, "convertPoint:toView:", v11, v7, v9);
    id v12 = objc_msgSend(v11, "faceForLocation:");
    if (v12)
    {
      [(_NTKCCGalleryViewController *)self setPreviewingGalleryCell:v11];
      [v11 selectFace:v12];
      id v13 = objc_alloc((Class)UITargetedPreview);
      id v14 = [v11 containerViewForFace:v12];
      id v15 = [v13 initWithView:v14];
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  [v6 previewViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_118B0;
  v8[3] = &unk_248B0;
  v8[4] = self;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v9;
  [v6 addCompletion:v8];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_11994;
  v8[3] = &unk_248D8;
  v8[4] = self;
  id v6 = a5;
  [v6 addAnimations:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_119D8;
  v7[3] = &unk_248D8;
  v7[4] = self;
  [v6 addCompletion:v7];
}

- (void)_faceAdded:(id)a3
{
  id v6 = [a3 object];
  BOOL v4 = [(_NTKCCGalleryViewController *)self navigationController];
  id v5 = [v4 popViewControllerAnimated:1];

  [(_NTKCCGalleryViewController *)self _showInfoPopoverIfNecessaryForFace:v6];
}

- (void)_showInfoPopoverIfNecessaryForFace:(id)a3
{
  id v4 = a3;
  if (+[NTKCCFaceAddedInfoViewController shouldShow])
  {
    id v5 = [v4 customEditModes];
    id v6 = [v5 count];

    if (v6)
    {
      id v7 = objc_opt_new();
      [(_NTKCCGalleryViewController *)self setInfoPopover:v7];

      [(NTKCCFaceAddedInfoViewController *)self->_infoPopover setModalPresentationStyle:7];
      double v8 = [(NTKCCFaceAddedInfoViewController *)self->_infoPopover popoverPresentationController];
      [v8 setPermittedArrowDirections:2];
      id v9 = +[NTKCCFaceAddedInfoViewController backgroundColor];
      [v8 setBackgroundColor:v9];

      +[NTKCCFaceAddedInfoViewController layoutMargins];
      objc_msgSend(v8, "setPopoverLayoutMargins:");
      [v8 setDelegate:self];
      id v10 = [(_NTKCCGalleryViewController *)self navigationController];
      double v11 = [v10 view];

      [v8 setSourceView:v11];
      int IsRTL = CLKLayoutIsRTL();
      id v13 = [(_NTKCCGalleryViewController *)self tabBarController];
      id v14 = [v13 tabBar];

      if (v14)
      {
        uint64_t v31 = v14;
        id v15 = +[NSArray arrayWithObjects:&v31 count:1];
        [v8 setPassthroughViews:v15];

        [v14 bounds];
        objc_msgSend(v14, "convertRect:toView:", v11);
        CGFloat x = v32.origin.x;
        double y = v32.origin.y;
        CGFloat width = v32.size.width;
        CGFloat height = v32.size.height;
        double v20 = CGRectGetWidth(v32);
        uint64_t v21 = [v14 items];
        double v22 = v20 / (double)(unint64_t)[v21 count];

        CGFloat v23 = x;
        double v24 = y;
        CGFloat v25 = width;
        CGFloat v26 = height;
        if (IsRTL) {
          double MinX = CGRectGetMaxX(*(CGRect *)&v23) - v22;
        }
        else {
          double MinX = CGRectGetMinX(*(CGRect *)&v23);
        }
        double v29 = y + -2.0;
        v35.origin.CGFloat x = x;
        v35.origin.double y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        double v28 = CGRectGetHeight(v35) + 2.0;
      }
      else
      {
        double v28 = 0.0;
        double MinX = 0.0;
        if (IsRTL)
        {
          [v11 bounds];
          double MinX = CGRectGetWidth(v33);
        }
        [v11 bounds];
        double v29 = CGRectGetHeight(v34);
        double v22 = 0.0;
      }
      objc_msgSend(v8, "setSourceRect:", MinX, v29, v22, v28);
      v30 = [(_NTKCCGalleryViewController *)self navigationController];
      [v30 presentViewController:self->_infoPopover animated:1 completion:0];
    }
  }
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (NSMutableArray)faceVCs
{
  return self->_faceVCs;
}

- (void)setFaceVCs:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (id)selectionFinishedHandler
{
  return self->_selectionFinishedHandler;
}

- (void)setSelectionFinishedHandler:(id)a3
{
}

- (NTKCGalleryCell)previewingGalleryCell
{
  return self->_previewingGalleryCell;
}

- (void)setPreviewingGalleryCell:(id)a3
{
}

- (NTKCCFaceAddedInfoViewController)infoPopover
{
  return self->_infoPopover;
}

- (void)setInfoPopover:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoPopover, 0);
  objc_storeStrong((id *)&self->_previewingGalleryCell, 0);
  objc_storeStrong(&self->_selectionFinishedHandler, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_faceVCs, 0);
  objc_storeStrong((id *)&self->_galleryPromise, 0);
  objc_storeStrong((id *)&self->_promiseName, 0);
  objc_storeStrong((id *)&self->_snapshotLookup, 0);
  objc_storeStrong((id *)&self->_collectionsLookup, 0);
  objc_storeStrong((id *)&self->_prewarmingRequest, 0);
  objc_storeStrong((id *)&self->_currentActiveDevice, 0);
  objc_storeStrong(&self->_migrationFractionChangedCallback, 0);
  objc_storeStrong(&self->_localeChangedCallback, 0);
  objc_storeStrong((id *)&self->_preloadCoalleceTimer, 0);

  objc_storeStrong((id *)&self->_collections, 0);
}

@end