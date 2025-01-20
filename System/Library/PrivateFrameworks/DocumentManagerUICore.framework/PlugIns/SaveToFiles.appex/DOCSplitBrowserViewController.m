@interface DOCSplitBrowserViewController
+ (BOOL)disableWorkaroundFor124376396;
- (BOOL)_contextAllowsPersistingColumnVisibilityChanges;
- (BOOL)_shouldOverlayTabBar;
- (BOOL)_sidebarVisibilityPinnedToWindowSizingOnly;
- (BOOL)canLoadAdditionalParents;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)includeSidebarInCollapsedNavStack;
- (BOOL)infoPanelPreviewingMultipleItems;
- (BOOL)isBrowserCurrentLocation:(id)a3;
- (BOOL)isCollapsed;
- (BOOL)isShowingCollapsedSidebarViewController;
- (BOOL)prefersAnimatedTabVibilityChanges;
- (BOOL)sidebarViewControllerWithIsCollapsed:(id)a3;
- (DOCConfiguration)configuration;
- (DOCFullDocumentManagerViewController)fullDocumentManagerViewController;
- (DOCSourceObserver)sourceObserver;
- (DOCSplitBrowserViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4;
- (DOCSplitViewControllerDelegate)splitViewDelegate;
- (NSString)shortDebugID;
- (UIFocusItem)itemToFocusDuringAppearance;
- (_TtC11SaveToFiles16DOCPickerContext)pickerContext;
- (_TtC11SaveToFiles24DOCContentDimmingOverlay)browserOverlay;
- (_TtC11SaveToFiles24DOCContentDimmingOverlay)sourcesOverlay;
- (_TtC11SaveToFiles24DOCSidebarViewController)sidebarViewController;
- (id)_activeTransitionCoordinator;
- (id)_hostingNavigationBar;
- (id)_swipeToCloseSidebarGestureRecognizer;
- (id)_tapToCloseSidebarGestureRecognizer;
- (id)_viewControllerForOverlayTabBar;
- (id)preferredFocusEnvironments;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)_customPreferredSplitBehavior_EmbeddedScreen;
- (int64_t)_customPreferredSplitBehavior_ExternalScreen;
- (int64_t)displayMode;
- (int64_t)pickerOperationFor:(id)a3;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)_arrangeSidebarForCollapsedPresentationForced:(BOOL)a3;
- (void)_saveUserPrefersTiledSidebarForChangeFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4;
- (void)_splitViewController:(id)a3 animateTransitionToStateRequest:(id)a4 detailSize:(CGSize)a5 duration:(double)a6;
- (void)_splitViewController:(id)a3 didChangeFromDisplayMode:(int64_t)a4 toDisplayMode:(int64_t)a5;
- (void)_splitViewController:(id)a3 didFinishExpandToDisplayMode:(int64_t)a4;
- (void)beginLoadingAdditionalParents:(id)a3;
- (void)clearSplitViewStateTransitionStateIfNecessary;
- (void)configureUIPDocumentLandingStyleIfNecessary;
- (void)dealloc;
- (void)didConfirmPickIn:(id)a3;
- (void)didIndicateCancelPicker;
- (void)didSelectItem:(id)a3 atParentLocation:(id)a4 wasAlreadySelected:(BOOL)a5 onlyRevealIfColumn:(BOOL)a6;
- (void)didSelectLocation:(id)a3 atParentLocation:(id)a4;
- (void)didTapLocationOf:(id)a3;
- (void)didTapOnUnselectableItem:(id)a3;
- (void)didToggleEditStateWithEditing:(BOOL)a3 in:(id)a4;
- (void)dismissSidebarViewControllerIfNeeded;
- (void)forceSidebarHiddenByDefaultForUIPDocLandingIfNecessary;
- (void)fullDocumentManagerViewController:(id)a3 didUpdateHierarchy:(id)a4 displayedRootLocation:(id)a5;
- (void)hideSidebar;
- (void)importScannedDocumentAt:(id)a3 presentingController:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareSnapshotForSplitStateChangingFromState:(id)a3 toState:(id)a4 alongside:(id)a5;
- (void)saveUserPrefersSidebarHidden:(BOOL)a3;
- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3;
- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)setBrowserOverlay:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setIncludeSidebarInCollapsedNavStack:(BOOL)a3;
- (void)setItemToFocusDuringAppearance:(id)a3;
- (void)setPickerContext:(id)a3;
- (void)setPrefersAnimatedTabVibilityChanges:(BOOL)a3;
- (void)setSceneIdentifier:(id)a3;
- (void)setShortDebugID:(id)a3;
- (void)setSourcesOverlay:(id)a3;
- (void)setSplitViewDelegate:(id)a3;
- (void)showSidebar;
- (void)showSidebarAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)sidebarViewController:(id)a3 didSelect:(id)a4;
- (void)sidebarViewController:(id)a3 wantsToReveal:(id)a4;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)toggleSidebarShown;
- (void)updateContentEditingOverlaysForState:(id)a3;
- (void)updateDisplayModeButtonVisibility;
- (void)updatePreferredDisplayModeFromPersistentStore;
- (void)updatePreferredSplitBehavior;
- (void)updateTraitCollectionTabBarSetting;
- (void)updateUIPHorizontalInsetsIfNecessaryWithCoordinator:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation DOCSplitBrowserViewController

- (DOCSplitBrowserViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v75.receiver = self;
  v75.super_class = (Class)DOCSplitBrowserViewController;
  v9 = [(DOCSplitBrowserViewController *)&v75 initWithStyle:1];
  v10 = v9;
  if (v9)
  {
    id v66 = v8;
    [(DOCSplitBrowserViewController *)v9 setDelegate:v9];
    v11 = +[NSUUID UUID];
    v12 = [v11 UUIDString];
    uint64_t v13 = [v12 substringToIndex:6];
    shortDebugID = v10->_shortDebugID;
    v10->_shortDebugID = (NSString *)v13;

    p_sourceObserver = &v10->_sourceObserver;
    objc_storeStrong((id *)&v10->_sourceObserver, a4);
    p_configuration = (id *)&v10->_configuration;
    objc_storeStrong((id *)&v10->_configuration, a3);
    if ([v7 isInUIPDocumentLanding]) {
      [(DOCSplitBrowserViewController *)v10 configureUIPDocumentLandingStyleIfNecessary];
    }
    v10->_includeSidebarInCollapsedNavStack = 1;
    id v67 = v7;
    id v16 = [v7 copy];
    [v16 setNeverCreateBookmarkForOpenInPlace:1];
    [v16 setRestoreLastVisitedLocation:1];
    [v16 setSaveLastVisitedLocation:1];
    [v16 setSupportsColumnView:1];
    v78[0] = DOCDocumentSourceIdentifierRecentDocuments;
    v78[1] = DOCDocumentSourceIdentifierActivities;
    v78[2] = DOCDocumentSourceIdentifierTaggedItems;
    v78[3] = DOCDocumentSourceIdentifierFavoriteFolders;
    v78[4] = DOCDocumentSourceIdentifierSharedItems;
    v78[5] = DOCDocumentSourceIdentifierSearch;
    v17 = +[NSArray arrayWithObjects:v78 count:6];
    [v16 setHiddenSourcesIdentifiers:v17];

    if ([v16 isPickerUI])
    {
      v18 = [v16 hiddenSourcesIdentifiers];
      v19 = [v18 arrayByAddingObject:DOCDocumentSourceIdentifierTrashedItems];
      [v16 setHiddenSourcesIdentifiers:v19];

      v20 = [v16 forbiddenActionIdentifiers];
      v77[0] = UIDocumentBrowserActionIdentifierMove;
      v77[1] = UIDocumentBrowserActionIdentifierDelete;
      v77[2] = UIDocumentBrowserActionIdentifierTrash;
      v77[3] = UIDocumentBrowserActionIdentifierRename;
      v77[4] = UIDocumentBrowserActionIdentifierNewFolderFromSelection;
      v21 = +[NSArray arrayWithObjects:v77 count:5];
      v22 = [v20 arrayByAddingObjectsFromArray:v21];
      [v16 setForbiddenActionIdentifiers:v22];
    }
    v23 = [[DOCFullDocumentManagerViewController alloc] initWithConfiguration:v16 sourceObserver:*p_sourceObserver];
    fullDocumentManagerViewController = v10->_fullDocumentManagerViewController;
    v10->_fullDocumentManagerViewController = v23;

    [(DOCFullDocumentManagerViewController *)v10->_fullDocumentManagerViewController setShortDebugID:v10->_shortDebugID];
    [(DOCFullDocumentManagerViewController *)v10->_fullDocumentManagerViewController setFullDocumentManagerDelegate:v10];
    v65 = v16;
    id v25 = [v16 copy];
    [v25 setUseExpandedSourceList:1];
    v26 = [[_TtC11SaveToFiles24DOCSidebarViewController alloc] initWithConfiguration:v25 sourceObserver:*p_sourceObserver];
    sidebarViewController = v10->_sidebarViewController;
    v10->_sidebarViewController = v26;

    v28 = +[DOCConcreteLocation recentDocumentsLocation];
    v29 = [(DOCFullDocumentManagerViewController *)v10->_fullDocumentManagerViewController itemCollectionViewPool];
    v30 = [(DOCFullDocumentManagerViewController *)v10->_fullDocumentManagerViewController documentManager];
    v31 = [(DOCFullDocumentManagerViewController *)v10->_fullDocumentManagerViewController actionManager];
    v64 = v25;
    v32 = +[UISearchController docSearchControllerForSearchingIn:v28 configuration:v25 collectionViewPool:v29 documentManager:v30 actionManager:v31];

    v33 = v32;
    [v32 setPresentationDelegate:v10->_fullDocumentManagerViewController];
    v34 = [v32 resultCollectionViewController];
    [v34 setActionReporting:v10];

    [(DOCSidebarViewController *)v10->_sidebarViewController setSearchController:v33];
    v35 = [(DOCSidebarViewController *)v10->_sidebarViewController navigationItem];
    [v35 setHidesSearchBarWhenScrolling:0];

    [(DOCSidebarViewController *)v10->_sidebarViewController setDefinesPresentationContext:1];
    v36 = objc_alloc_init(_TtC11SaveToFiles34DOCSidebarPaneNavigationController);
    sidebarNavigationController = v10->_sidebarNavigationController;
    v10->_sidebarNavigationController = v36;

    v38 = [(DOCSidebarPaneNavigationController *)v10->_sidebarNavigationController navigationBar];
    [v38 setPrefersLargeTitles:1];

    [(DOCSidebarPaneNavigationController *)v10->_sidebarNavigationController setToolbarHidden:1];
    [(DOCSplitBrowserViewController *)v10 updatePreferredDisplayModeFromPersistentStore];
    v39 = [*p_configuration urls];
    id v40 = [v39 count];

    if (v40)
    {
      if ([*p_configuration interactionMode] == (id)3)
      {
        v63 = v33;
        v41 = +[NSMutableArray array];
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id obj = [*p_configuration urls];
        id v42 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
        if (v42)
        {
          id v43 = v42;
          uint64_t v44 = *(void *)v72;
          while (2)
          {
            for (i = 0; i != v43; i = (char *)i + 1)
            {
              if (*(void *)v72 != v44) {
                objc_enumerationMutation(obj);
              }
              v46 = *(void **)(*((void *)&v71 + 1) + 8 * i);
              v47 = +[FPItemManager defaultManager];
              v48 = [v46 url];
              id v70 = 0;
              v49 = [v47 itemForURL:v48 error:&v70];
              id v50 = v70;

              if (!v49)
              {
                v53 = docUILogHandle;
                if (!docUILogHandle)
                {
                  DOCInitLogging();
                  v53 = docUILogHandle;
                }
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                  sub_1004CDAF4((uint64_t)v46, (uint64_t)v50, v53);
                }

                goto LABEL_23;
              }
              [v41 addObject:v49];
            }
            id v43 = [obj countByEnumeratingWithState:&v71 objects:v76 count:16];
            if (v43) {
              continue;
            }
            break;
          }
        }
LABEL_23:

        id v54 = [v41 count];
        v55 = [*p_configuration urls];
        id v56 = [v55 count];

        v57 = [_TtC11SaveToFiles16DOCPickerContext alloc];
        v58 = v57;
        if (v54 == v56)
        {
          v52 = [(DOCPickerContext *)v57 initWithItems:v41];
          [(DOCSplitBrowserViewController *)v10 setPickerContext:v52];
        }
        else
        {
          v52 = [*p_configuration urls];
          v59 = [(DOCPickerContext *)v58 initWithURLs:v52];
          [(DOCSplitBrowserViewController *)v10 setPickerContext:v59];
        }
        v33 = v63;
      }
      else
      {
        v51 = [_TtC11SaveToFiles16DOCPickerContext alloc];
        v41 = [*p_configuration urls];
        v52 = [(DOCPickerContext *)v51 initWithURLs:v41];
        [(DOCSplitBrowserViewController *)v10 setPickerContext:v52];
      }
    }
    id v7 = v67;
    if ([(DOCSplitBrowserViewController *)v10 isViewLoaded])
    {
      v60 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v60 = docLogHandle;
      }
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)) {
        sub_1004CDA48(v60);
      }
    }
    [(DOCSplitBrowserViewController *)v10 swift_commonInit];
    v61 = v10;

    id v8 = v66;
  }

  return v10;
}

- (void)setShortDebugID:(id)a3
{
  objc_storeStrong((id *)&self->_shortDebugID, a3);
  id v5 = a3;
  [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController setShortDebugID:v5];
}

- (NSString)shortDebugID
{
  return self->_shortDebugID;
}

- (void)updatePreferredDisplayModeFromPersistentStore
{
  if (![(DOCSplitBrowserViewController *)self _sidebarVisibilityPinnedToWindowSizingOnly])
  {
    if ([(DOCConfiguration *)self->_configuration isPickerUI])
    {
      unint64_t v3 = 0;
    }
    else
    {
      v4 = +[DOCUserInterfaceStateStore sharedStore];
      id v5 = [(DOCSplitBrowserViewController *)self configuration];
      v6 = [v4 interfaceStateForConfiguration:v5];

      id v7 = [v6 userPrefersTiledSidebarHidden];
      LODWORD(v5) = [v7 BOOLValue];

      unint64_t v3 = v5;
    }
    if ([(DOCSplitBrowserViewController *)self preferredDisplayMode] != (id)v3) {
      [(DOCSplitBrowserViewController *)self setPreferredDisplayMode:v3];
    }
    [(DOCSplitBrowserViewController *)self updatePreferredSplitBehavior];
    [(DOCSplitBrowserViewController *)self updateDisplayModeButtonVisibility];
  }
}

- (void)updatePreferredSplitBehavior
{
  unint64_t v3 = [(DOCSplitBrowserViewController *)self viewIfLoaded];
  v4 = [v3 window];
  id v7 = [v4 screen];

  id v5 = v7;
  if (v7)
  {
    if ([v7 _isEmbeddedScreen]) {
      int64_t v6 = [(DOCSplitBrowserViewController *)self _customPreferredSplitBehavior_EmbeddedScreen];
    }
    else {
      int64_t v6 = [(DOCSplitBrowserViewController *)self _customPreferredSplitBehavior_ExternalScreen];
    }
    [(DOCSplitBrowserViewController *)self setPreferredSplitBehavior:v6];
    id v5 = v7;
  }
}

- (int64_t)_customPreferredSplitBehavior_EmbeddedScreen
{
  unint64_t v3 = (char *)[(DOCSplitBrowserViewController *)self doc_deprecated_interfaceOrientation];
  v4 = (char *)[(DOCSplitBrowserViewController *)self _rotatingToInterfaceOrientation];
  if (v4) {
    unint64_t v3 = v4;
  }
  if ([(DOCConfiguration *)self->_configuration isPickerUI]) {
    return 0;
  }
  else {
    return 2 * ((unint64_t)(v3 - 1) < 2);
  }
}

- (int64_t)_customPreferredSplitBehavior_ExternalScreen
{
  return 0;
}

- (void)_saveUserPrefersTiledSidebarForChangeFromDisplayMode:(int64_t)a3 toDisplayMode:(int64_t)a4
{
  if ([(DOCSplitBrowserViewController *)self _contextAllowsPersistingColumnVisibilityChanges]&& (a3 == 2 || a4 == 2))
  {
    [(DOCSplitBrowserViewController *)self saveUserPrefersSidebarHidden:a4 != 2];
  }
}

- (void)saveUserPrefersSidebarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(DOCSplitBrowserViewController *)self configuration];
  id v5 = +[DOCUserInterfaceStateStore sharedStore];
  int64_t v6 = [v5 interfaceStateForConfiguration:v8];
  if (v6)
  {
    id v7 = +[NSNumber numberWithBool:v3];
    [v6 setUserPrefersTiledSidebarHidden:v7];

    [v5 updateInterfaceState:v6 forConfiguration:v8];
    [(DOCSplitBrowserViewController *)self updatePreferredDisplayModeFromPersistentStore];
  }
}

- (void)setPickerContext:(id)a3
{
  id v5 = (_TtC11SaveToFiles16DOCPickerContext *)a3;
  if (self->_pickerContext != v5)
  {
    objc_storeStrong((id *)&self->_pickerContext, a3);
    [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController setPickerContext:v5];
    [(DOCSidebarViewController *)self->_sidebarViewController setPickerContext:v5];
  }
}

- (void)configureUIPDocumentLandingStyleIfNecessary
{
  [(DOCSplitBrowserViewController *)self _setIgnoresSheetContext:1];
  v7.receiver = self;
  v7.super_class = (Class)DOCSplitBrowserViewController;
  BOOL v3 = [(DOCSplitBrowserViewController *)&v7 configuration];
  id v4 = [v3 copy];

  id v5 = +[UIColor _splitViewBorderColor];
  [v4 setBorderColor:v5];

  v6.receiver = self;
  v6.super_class = (Class)DOCSplitBrowserViewController;
  [(DOCSplitBrowserViewController *)&v6 setConfiguration:v4];
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)DOCSplitBrowserViewController;
  [(DOCSplitBrowserViewController *)&v19 viewDidLoad];
  BOOL v3 = [(DOCSplitBrowserViewController *)self configuration];
  unsigned int v4 = [v3 isPickerUI];

  id v5 = [(DOCSplitBrowserViewController *)self view];
  objc_super v6 = v5;
  if (v4) {
    CFStringRef v7 = @"Browse View (Picker)";
  }
  else {
    CFStringRef v7 = @"Browse View";
  }
  [v5 setAccessibilityIdentifier:v7];

  [(DOCSidebarViewController *)self->_sidebarViewController setSidebarDelegate:self];
  id v8 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  v20 = v8;
  v9 = +[NSArray arrayWithObjects:&v20 count:1];
  [(DOCSidebarPaneNavigationController *)self->_sidebarNavigationController setViewControllers:v9];

  [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController ensureInternalNavigationControllerIsInstalled];
  [(DOCSplitBrowserViewController *)self setViewController:self->_sidebarNavigationController forColumn:0];
  v10 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  [(DOCSplitBrowserViewController *)self setViewController:v10 forColumn:2];

  v11 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  [(DOCSplitBrowserViewController *)self setViewController:v11 forColumn:3];

  [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController addObserver:self forKeyPath:@"editing" options:1 context:off_10062A5F0];
  [(DOCSidebarViewController *)self->_sidebarViewController addObserver:self forKeyPath:@"editing" options:1 context:off_10062A5F0];
  v12 = [[_TtC11SaveToFiles24DOCContentDimmingOverlay alloc] initForCovering:self->_sidebarNavigationController];
  sourcesOverlay = self->_sourcesOverlay;
  self->_sourcesOverlay = v12;

  [(DOCContentDimmingOverlay *)self->_sourcesOverlay setAutohideWhenPossibleDropTarget:1];
  v14 = [(DOCSidebarViewController *)self->_sidebarViewController navigationController];
  v15 = [v14 view];
  [v15 addSubview:self->_sourcesOverlay];

  id v16 = [[_TtC11SaveToFiles24DOCContentDimmingOverlay alloc] initForCovering:self->_fullDocumentManagerViewController];
  browserOverlay = self->_browserOverlay;
  self->_browserOverlay = v16;

  v18 = [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController view];
  [v18 addSubview:self->_browserOverlay];

  [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController updateRelatedViewControllersWithCurrentHierarchy];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCSplitBrowserViewController;
  [(DOCSplitBrowserViewController *)&v6 viewWillDisappear:a3];
  unsigned int v4 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  [v4 setEditing:0];

  id v5 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  [v5 setEditing:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DOCSplitBrowserViewController;
  [(DOCSplitBrowserViewController *)&v8 viewDidAppear:a3];
  unsigned int v4 = [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController view];
  [v4 setAutoresizingMask:18];

  id v5 = [(DOCSplitBrowserViewController *)self itemToFocusDuringAppearance];

  if (v5)
  {
    objc_super v6 = +[UIFocusSystem focusSystemForEnvironment:self];
    CFStringRef v7 = [(DOCSplitBrowserViewController *)self itemToFocusDuringAppearance];
    [v6 requestFocusUpdateToEnvironment:v7];

    [v6 updateFocusIfNeeded];
    [(DOCSplitBrowserViewController *)self setItemToFocusDuringAppearance:0];
  }
  [(DOCSplitBrowserViewController *)self forceSidebarHiddenByDefaultForUIPDocLandingIfNecessary];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)DOCSplitBrowserViewController;
  [(DOCSplitBrowserViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(DOCSplitBrowserViewController *)self updatePreferredSplitBehavior];
  [(DOCSplitBrowserViewController *)self updateDisplayModeButtonVisibility];
}

- (id)_tapToCloseSidebarGestureRecognizer
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(DOCSplitBrowserViewController *)self _primaryDimmingView];
  BOOL v3 = [v2 gestureRecognizers];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_swipeToCloseSidebarGestureRecognizer
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(DOCSplitBrowserViewController *)self _primaryDimmingView];
  BOOL v3 = [v2 gestureRecognizers];

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  long long v10 = (_TtC11SaveToFiles24DOCSidebarViewController *)a4;
  if (off_10062A5F0 == a6)
  {
    if ([a3 isEqualToString:@"editing"])
    {
      unsigned __int8 v11 = [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController prefersTabBarHidden];
      if ([(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController isEditing]&& [(DOCSplitBrowserViewController *)self enclosingTabSwitcherStyle] == (id)2)
      {
        unsigned __int8 v11 = 1;
      }
      unsigned int v12 = [(DOCSidebarViewController *)self->_sidebarViewController isEditing];
      if (+[UITraitCollection enclosingTabSwitcherCanBeFloating])
      {
        uint64_t v13 = [(DOCSplitBrowserViewController *)self traitCollection];
        BOOL v14 = [v13 horizontalSizeClass] == (id)2;
      }
      else
      {
        BOOL v14 = 0;
      }
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10001820C;
      v20[3] = &unk_1005B7EA0;
      v20[4] = self;
      BOOL v21 = v14;
      unsigned __int8 v22 = v11;
      char v23 = v12;
      +[UIView doc_performAllowingAnimations:v14 block:v20];
      [(DOCSplitBrowserViewController *)self updateDisplayModeButtonVisibility];
      if (![(DOCSplitBrowserViewController *)self isCollapsed])
      {
        v15 = [(DOCSplitBrowserViewController *)self _swipeToCloseSidebarGestureRecognizer];
        [v15 setEnabled:v12 ^ 1];

        id v16 = [(DOCSplitBrowserViewController *)self _tapToCloseSidebarGestureRecognizer];
        [v16 setEnabled:v12 ^ 1];

        if (self->_sidebarViewController == v10 && v12)
        {
          v17 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
          [v17 dismissSearch];

          v18 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
          [v18 setEditing:0 animated:1];
        }
        objc_super v19 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
        [(DOCSplitBrowserViewController *)self updateContentEditingOverlaysForState:v19];
      }
    }
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)DOCSplitBrowserViewController;
    [(DOCSplitBrowserViewController *)&v24 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)updateDisplayModeButtonVisibility
{
  if (![(DOCSplitBrowserViewController *)self _sidebarVisibilityPinnedToWindowSizingOnly])
  {
    id v12 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
    unsigned int v3 = [v12 isCollapsed];
    unsigned int v4 = [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController isInUserTriggeredSelectionMode];
    int v5 = v4 & v3 ^ 1;
    uint64_t v6 = v4 ^ 1;
    if ([(DOCConfiguration *)self->_configuration isPickerUI])
    {
      CFStringRef v7 = [(DOCSplitBrowserViewController *)self traitCollection];
      int v8 = DOCUsePadIdiomForTraits();

      if (v8)
      {
        uint64_t v6 = 0;
        int v5 = (id)[(DOCSplitBrowserViewController *)self displayMode] == (id)1;
      }
    }
    unsigned int v9 = +[UITraitCollection enclosingTabSwitcherCanBeFloating];
    uint64_t v10 = 2;
    if ((v5 & ~v6) == 0) {
      uint64_t v10 = 0;
    }
    if (v9) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    [(DOCSplitBrowserViewController *)self setDisplayModeButtonVisibility:v11];
    [(DOCSplitBrowserViewController *)self setPresentsWithGesture:v6];
  }
}

- (void)updateContentEditingOverlaysForState:(id)a3
{
  id v12 = a3;
  if ([(DOCSplitBrowserViewController *)self isCollapsed])
  {
    BOOL v4 = 0;
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = [(DOCFullDocumentManagerViewController *)self->_fullDocumentManagerViewController effectiveBrowserViewController];
    CFStringRef v7 = [v6 contentViewController];

    if ([v12 isSidebarShownInOverlay]) {
      id v5 = 0;
    }
    else {
      id v5 = [v7 isInUserTriggeredSelectionMode];
    }
    BOOL v4 = [(DOCSidebarViewController *)self->_sidebarViewController isEditing];
  }
  [(DOCContentDimmingOverlay *)self->_sourcesOverlay setActive:v5];
  int v8 = [(DOCContentDimmingOverlay *)self->_sourcesOverlay superview];

  if (v8)
  {
    unsigned int v9 = [(DOCContentDimmingOverlay *)self->_sourcesOverlay superview];
    [v9 bringSubviewToFront:self->_sourcesOverlay];
  }
  [(DOCContentDimmingOverlay *)self->_browserOverlay setActive:v4];
  uint64_t v10 = [(DOCContentDimmingOverlay *)self->_browserOverlay superview];

  if (v10)
  {
    uint64_t v11 = [(DOCContentDimmingOverlay *)self->_browserOverlay superview];
    [v11 bringSubviewToFront:self->_browserOverlay];
  }
  [(DOCSplitBrowserViewController *)self updateDisplayModeButtonVisibility];
}

- (void)dealloc
{
  if ([(DOCSplitBrowserViewController *)self isViewLoaded])
  {
    unsigned int v3 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
    [v3 removeObserver:self forKeyPath:@"editing"];

    BOOL v4 = [(DOCSplitBrowserViewController *)self sidebarViewController];
    [v4 removeObserver:self forKeyPath:@"editing"];
  }
  v5.receiver = self;
  v5.super_class = (Class)DOCSplitBrowserViewController;
  [(DOCSplitBrowserViewController *)&v5 dealloc];
}

- (void)setIncludeSidebarInCollapsedNavStack:(BOOL)a3
{
  if ([(DOCSplitBrowserViewController *)self includeSidebarInCollapsedNavStack] != a3)
  {
    self->_includeSidebarInCollapsedNavStack = a3;
    [(DOCSplitBrowserViewController *)self _arrangeSidebarForCollapsedPresentationForced:0];
  }
}

- (void)showSidebarAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if ([(DOCSplitBrowserViewController *)self isCollapsed])
  {
    CFStringRef v7 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
    [v7 popToRootViewControllerAnimated:v4];

    int v8 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
    unsigned int v9 = [v8 transitionCoordinator];

    if (!v9)
    {
LABEL_6:
      unsigned int v9 = [(DOCSplitBrowserViewController *)self _definiteTransitionCoordinator];
    }
  }
  else
  {
    uint64_t v10 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
    unsigned __int8 v11 = [v10 isSidebarShown];

    if (v11) {
      goto LABEL_6;
    }
    [(DOCSplitBrowserViewController *)self toggleSidebarShown];
    unsigned int v9 = [(DOCSplitBrowserViewController *)self transitionCoordinator];
    if (!v9) {
      goto LABEL_6;
    }
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100018778;
  v13[3] = &unk_1005B7F08;
  id v14 = v6;
  id v12 = v6;
  [v9 animateAlongsideTransition:&stru_1005B7EE0 completion:v13];
}

- (void)showSidebar
{
}

- (void)hideSidebar
{
  unsigned int v3 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
  unsigned int v4 = [v3 isSidebarShown];

  if (v4)
  {
    [(DOCSplitBrowserViewController *)self toggleSidebarShown];
  }
}

- (void)toggleSidebarShown
{
  unsigned int v3 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
  unsigned int v4 = [v3 isSidebarShown];

  if (v4)
  {
    [(DOCSplitBrowserViewController *)self hideColumn:0];
  }
  else
  {
    [(DOCSplitBrowserViewController *)self showColumn:0];
  }
}

- (BOOL)isShowingCollapsedSidebarViewController
{
  if (![(DOCSplitBrowserViewController *)self isCollapsed]) {
    return 0;
  }
  unsigned int v3 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  unsigned int v4 = [v3 currentViewController];
  objc_super v5 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  BOOL v6 = v4 == v5;

  return v6;
}

- (id)preferredFocusEnvironments
{
  unsigned int v3 = [(DOCSplitBrowserViewController *)self itemToFocusDuringAppearance];

  if (v3)
  {
    unsigned int v4 = [(DOCSplitBrowserViewController *)self itemToFocusDuringAppearance];
    id v12 = v4;
    objc_super v5 = &v12;
  }
  else
  {
    BOOL v6 = [(DOCSplitBrowserViewController *)self sidebarViewController];
    unsigned int v7 = [v6 sidebarHasActiveFocus];

    if (v7)
    {
      unsigned int v4 = [(DOCSplitBrowserViewController *)self sidebarViewController];
      unsigned __int8 v11 = v4;
      objc_super v5 = &v11;
    }
    else
    {
      unsigned int v4 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
      uint64_t v10 = v4;
      objc_super v5 = &v10;
    }
  }
  int v8 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 1, v10, v11, v12);

  return v8;
}

- (void)_splitViewController:(id)a3 animateTransitionToStateRequest:(id)a4 detailSize:(CGSize)a5 duration:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  unsigned __int8 v11 = [(DOCSplitBrowserViewController *)self traitCollection];
  id v12 = objc_msgSend(v11, "preferredNavigationBarStyle_objc");
  unsigned __int8 v13 = [v12 hasHistoryButtons];

  if ((v13 & 1) == 0)
  {
    [v10 leadingWidth];
    if (v14 < 0.5)
    {
      [v9 displayModeButtonItem];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100018B30;
      v16[3] = &unk_1005B7800;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = self;
      id v15 = v17;
      +[UIView animateWithDuration:v16 animations:a6];
    }
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
  [(DOCSplitBrowserViewController *)self setDoc_splitViewStateTransitionStart:v8];
  [(DOCSplitBrowserViewController *)self setDoc_splitViewStateTransitionEnd:0];
  id v9 = v8;
  id v10 = objc_msgSend(v9, "withIsCollapsed:", objc_msgSend(v7, "horizontalSizeClass") == (id)1);

  [(DOCSplitBrowserViewController *)self setDoc_splitViewStateTransitionEnd:v10];
  v12.receiver = self;
  v12.super_class = (Class)DOCSplitBrowserViewController;
  [(DOCSplitBrowserViewController *)&v12 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018CD4;
  v11[3] = &unk_1005B7F50;
  v11[4] = self;
  [v6 animateAlongsideTransition:0 completion:v11];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(DOCSplitBrowserViewController *)self updatePreferredSplitBehavior];
  int v8 = v7;
  if (!v7)
  {
    int v8 = [(DOCSplitBrowserViewController *)self _definiteTransitionCoordinator];
  }
  objc_storeStrong((id *)&self->_sizeTransitionCoordinator, v8);
  if (!v7) {

  }
  v14.receiver = self;
  v14.super_class = (Class)DOCSplitBrowserViewController;
  -[DOCSplitBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  sizeTransitionCoordinator = self->_sizeTransitionCoordinator;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100018E3C;
  v12[3] = &unk_1005B7F78;
  v12[4] = self;
  id v13 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100018E7C;
  v11[3] = &unk_1005B7F50;
  v11[4] = self;
  id v10 = v7;
  [(UIViewControllerTransitionCoordinator *)sizeTransitionCoordinator animateAlongsideTransition:v12 completion:v11];
}

- (id)_activeTransitionCoordinator
{
  sizeTransitionCoordinator = [(DOCSplitBrowserViewController *)self transitionCoordinator];
  unsigned int v4 = sizeTransitionCoordinator;
  if (!sizeTransitionCoordinator) {
    sizeTransitionCoordinator = self->_sizeTransitionCoordinator;
  }
  id v5 = sizeTransitionCoordinator;

  return v5;
}

- (void)clearSplitViewStateTransitionStateIfNecessary
{
  if (!self->_sizeTransitionCoordinator)
  {
    unsigned int v3 = [(DOCSplitBrowserViewController *)self doc_splitViewStateTransitionStart];

    if (v3)
    {
      [(DOCSplitBrowserViewController *)self setDoc_splitViewStateTransitionStart:0];
      [(DOCSplitBrowserViewController *)self setDoc_splitViewStateTransitionEnd:0];
      [(DOCSplitBrowserViewController *)self updateTraitCollectionTabBarSetting];
    }
  }
}

- (BOOL)isCollapsed
{
  if (([(id)objc_opt_class() disableWorkaroundFor124376396] & 1) != 0
    || ([(DOCSplitBrowserViewController *)self doc_splitViewStateTransitionEnd],
        (unsigned int v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (+[DOCFeature _UIPTabInfrastructureEnabled](DOCFeature, "_UIPTabInfrastructureEnabled")&& (-[DOCSplitBrowserViewController traitCollection](self, "traitCollection"), id v7 = objc_claimAutoreleasedReturnValue(), v8 = [v7 horizontalSizeClass], v7, v8 == (id)1))
    {
      return 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)DOCSplitBrowserViewController;
      return [(DOCSplitBrowserViewController *)&v9 isCollapsed];
    }
  }
  else
  {
    unsigned int v4 = v3;
    unsigned __int8 v5 = [v3 isCollapsed];

    return v5;
  }
}

- (int64_t)displayMode
{
  if (([(id)objc_opt_class() disableWorkaroundFor124376396] & 1) != 0
    || ([(DOCSplitBrowserViewController *)self doc_splitViewStateTransitionEnd],
        (unsigned int v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)DOCSplitBrowserViewController;
    return [(DOCSplitBrowserViewController *)&v7 displayMode];
  }
  else
  {
    unsigned int v4 = v3;
    id v5 = [v3 displayMode];

    return (int64_t)v5;
  }
}

- (void)_splitViewController:(id)a3 didFinishExpandToDisplayMode:(int64_t)a4
{
  id v4 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  [v4 splitViewWillDidExpand];
}

- (void)_splitViewController:(id)a3 didChangeFromDisplayMode:(int64_t)a4 toDisplayMode:(int64_t)a5
{
  [(DOCSplitBrowserViewController *)self clearSplitViewStateTransitionStateIfNecessary];
  [(DOCSplitBrowserViewController *)self updateTraitCollectionTabBarSetting];
  [(DOCSplitBrowserViewController *)self _setNeedsUpdateOfMultitaskingDragExclusionRects];
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  objc_super v7 = [(DOCSplitBrowserViewController *)self transitionCoordinator];
  if (v7) {
    BOOL v28 = self->_sizeTransitionCoordinator == 0;
  }
  else {
    BOOL v28 = 0;
  }

  id v8 = [v6 displayMode];
  objc_super v9 = [(DOCSplitBrowserViewController *)self _activeTransitionCoordinator];
  BOOL v27 = v9 != 0;
  if (!v9)
  {
    objc_super v9 = [(DOCSplitBrowserViewController *)self _definiteTransitionCoordinator];
  }
  id v10 = [(DOCSplitBrowserViewController *)self doc_splitViewStateTransitionStart];
  unsigned __int8 v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
  }
  id v13 = v12;

  [(DOCSplitBrowserViewController *)self setDoc_splitViewStateTransitionEnd:0];
  objc_super v14 = [v13 withDisplayMode:a4];
  id v15 = objc_msgSend(v14, "withIsCollapsed:", objc_msgSend(v6, "isCollapsed"));

  [(DOCSplitBrowserViewController *)self setDoc_splitViewStateTransitionStart:v13];
  [(DOCSplitBrowserViewController *)self setDoc_splitViewStateTransitionEnd:v15];
  unsigned int v16 = +[DOCSplitViewState isShowOverlayTransitionFromState:v13 toState:v15];
  if (v9) {
    int v17 = v16;
  }
  else {
    int v17 = 1;
  }
  char v18 = (v17 | +[DOCSplitViewState isHideOverlayTransitionFromState:v13 toState:v15]) ^ 1;
  if (self->_sizeTransitionCoordinator)
  {
    uint64_t v19 = 0;
  }
  else
  {
    unsigned int v20 = [v13 isSidebarShown];
    uint64_t v19 = v20 ^ [v15 isSidebarShown];
  }
  [(DOCSplitBrowserViewController *)self setPrefersAnimatedTabVibilityChanges:v19];
  if (v17) {
    [(DOCSplitBrowserViewController *)self updateContentEditingOverlaysForState:v15];
  }
  [(DOCSplitBrowserViewController *)self updateDisplayModeButtonVisibility];
  [(DOCSplitBrowserViewController *)self prepareSnapshotForSplitStateChangingFromState:v13 toState:v15 alongside:v9];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000194A0;
  v36[3] = &unk_1005B7FA0;
  v36[4] = self;
  id v37 = v9;
  id v38 = v13;
  id v39 = v15;
  id v40 = v8;
  int64_t v41 = a4;
  char v42 = v18;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100019544;
  v29[3] = &unk_1005B7FC8;
  v29[4] = self;
  id v30 = v39;
  BOOL v34 = v28;
  id v32 = v38;
  id v33 = v8;
  BOOL v35 = v27;
  id v31 = v6;
  id v21 = v38;
  id v22 = v6;
  id v23 = v39;
  id v24 = v9;
  [v24 animateAlongsideTransition:v36 completion:v29];
  unsigned __int8 v25 = [(DOCSplitBrowserViewController *)self doc_inWindowPerformingSnapshotting];
  if (a4 == 1 && (v25 & 1) == 0)
  {
    v26 = [(DOCSplitBrowserViewController *)self sidebarViewController];
    if ([v26 isEditing]) {
      [v26 setEditing:0];
    }
  }
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  -[DOCSplitBrowserViewController _arrangeSidebarForCollapsedPresentationForced:](self, "_arrangeSidebarForCollapsedPresentationForced:", 1, a4);
  id v5 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
  uint64_t v6 = [v5 withIsCollapsed:1];
  [(DOCSplitBrowserViewController *)self updateContentEditingOverlaysForState:v6];

  objc_super v7 = [(DOCSplitBrowserViewController *)self viewControllerForColumn:0];
  id v8 = self;
  LOBYTE(v6) = objc_opt_isKindOfClass();

  if (v6) {
    [v7 setNavigationBarHidden:1];
  }

  return 3;
}

- (void)_arrangeSidebarForCollapsedPresentationForced:(BOOL)a3
{
  id v10 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  id v5 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  if (a3 || [(DOCSplitBrowserViewController *)self isCollapsed])
  {
    if ([(DOCSplitBrowserViewController *)self includeSidebarInCollapsedNavStack])
    {
      uint64_t v6 = [v10 rootViewController];

      if (v6 != v5)
      {
        [(DOCSidebarPaneNavigationController *)self->_sidebarNavigationController setViewControllers:&__NSArray0__struct];
        objc_super v7 = [(DOCSplitBrowserViewController *)self sidebarViewController];
        [v10 setRootViewController:v7];

        if ([v5 isEditing])
        {
          id v8 = [v10 internalNavigationController];
          id v9 = [v8 popToViewController:v5 animated:0];
        }
      }
    }
    else
    {
      [v10 setRootViewController:0];
    }
  }
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  uint64_t v6 = [(DOCSplitBrowserViewController *)self viewControllerForColumn:0];
  objc_super v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    [v6 setNavigationBarHidden:0];
  }
  id v9 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  id v10 = [v9 isEditing];

  unsigned __int8 v11 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  id v12 = [v11 effectiveBrowserViewController];
  id v13 = [v12 isEditing];

  objc_super v14 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  id v15 = [v14 hierarchyController];
  [v15 invalidateAllAssertions];

  unsigned int v16 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  int v17 = [v16 hierarchyController];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100019A74;
  v26[3] = &unk_1005B7850;
  v26[4] = self;
  [v17 performWhileForcingChangeInPreparationQueue:v26];

  char v18 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  objc_msgSend(v18, "doc_removeFromParentWithRemoveSubviewBlock:", 0);

  uint64_t v19 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  BOOL v27 = v19;
  unsigned int v20 = +[NSArray arrayWithObjects:&v27 count:1];
  [(DOCSidebarPaneNavigationController *)self->_sidebarNavigationController setViewControllers:v20];

  id v21 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  [v21 setEditing:v10];

  id v22 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  [v22 setEditing:v13];

  id v23 = [(DOCSplitBrowserViewController *)self doc_splitViewState];
  id v24 = [v23 withIsCollapsed:0];
  [(DOCSplitBrowserViewController *)self updateContentEditingOverlaysForState:v24];

  return a4;
}

- (BOOL)_sidebarVisibilityPinnedToWindowSizingOnly
{
  return [(DOCSidebarViewController *)self->_sidebarViewController sidebarVisibilityPinnedToWindowSizingOnly];
}

- (BOOL)_contextAllowsPersistingColumnVisibilityChanges
{
  if ([(DOCSplitBrowserViewController *)self _sidebarVisibilityPinnedToWindowSizingOnly])
  {
    return 0;
  }
  id v4 = [(DOCSplitBrowserViewController *)self view];
  id v5 = [v4 window];
  uint64_t v6 = [v5 windowScene];

  if (v6) {
    BOOL v3 = [v6 activationState] == 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)dismissSidebarViewControllerIfNeeded
{
  BOOL v3 = [(DOCSplitBrowserViewController *)self viewControllers];
  id v4 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  unsigned __int8 v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {
    sidebarViewController = self->_sidebarViewController;
    [(DOCSidebarViewController *)sidebarViewController dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)fullDocumentManagerViewController:(id)a3 didUpdateHierarchy:(id)a4 displayedRootLocation:(id)a5
{
}

- (void)setSceneIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  [v5 setSceneIdentifier:v4];

  id v7 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  uint64_t v6 = [v7 configuration];
  [v6 setSceneIdentifier:v4];
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  [v5 setAdditionalTrailingNavigationBarButtonItems:v4];

  id v6 = [(DOCSplitBrowserViewController *)self sidebarViewController];
  [v6 setAdditionalTrailingNavigationBarButtonItems:v4];
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  id v4 = a3;
  id v5 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  [v5 setAdditionalLeadingNavigationBarButtonItems:v4];
}

- (id)_viewControllerForOverlayTabBar
{
  v2 = [(DOCSplitBrowserViewController *)self fullDocumentManagerViewController];
  BOOL v3 = [v2 internalNavigationController];

  return v3;
}

- (BOOL)_shouldOverlayTabBar
{
  v2 = [(DOCSplitBrowserViewController *)self _viewControllerForOverlayTabBar];
  unsigned __int8 v3 = [v2 _shouldOverlayTabBar];

  return v3;
}

- (id)_hostingNavigationBar
{
  v2 = [(DOCSplitBrowserViewController *)self _viewControllerForOverlayTabBar];
  unsigned __int8 v3 = [v2 _hostingNavigationBar];

  return v3;
}

+ (BOOL)disableWorkaroundFor124376396
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"DisableWorkaroundFor124376396"];

  return v3;
}

- (DOCSplitViewControllerDelegate)splitViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_splitViewDelegate);
  return (DOCSplitViewControllerDelegate *)WeakRetained;
}

- (void)setSplitViewDelegate:(id)a3
{
}

- (UIFocusItem)itemToFocusDuringAppearance
{
  return (UIFocusItem *)objc_getProperty(self, a2, 48, 1);
}

- (void)setItemToFocusDuringAppearance:(id)a3
{
}

- (DOCConfiguration)configuration
{
  return (DOCConfiguration *)objc_getProperty(self, a2, 56, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (_TtC11SaveToFiles24DOCSidebarViewController)sidebarViewController
{
  return (_TtC11SaveToFiles24DOCSidebarViewController *)objc_getProperty(self, a2, 64, 1);
}

- (DOCFullDocumentManagerViewController)fullDocumentManagerViewController
{
  return (DOCFullDocumentManagerViewController *)objc_getProperty(self, a2, 72, 1);
}

- (DOCSourceObserver)sourceObserver
{
  return (DOCSourceObserver *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)includeSidebarInCollapsedNavStack
{
  return self->_includeSidebarInCollapsedNavStack;
}

- (_TtC11SaveToFiles16DOCPickerContext)pickerContext
{
  return self->_pickerContext;
}

- (BOOL)prefersAnimatedTabVibilityChanges
{
  return self->_prefersAnimatedTabVibilityChanges;
}

- (void)setPrefersAnimatedTabVibilityChanges:(BOOL)a3
{
  self->_prefersAnimatedTabVibilityChanges = a3;
}

- (_TtC11SaveToFiles24DOCContentDimmingOverlay)sourcesOverlay
{
  return self->_sourcesOverlay;
}

- (void)setSourcesOverlay:(id)a3
{
}

- (_TtC11SaveToFiles24DOCContentDimmingOverlay)browserOverlay
{
  return self->_browserOverlay;
}

- (void)setBrowserOverlay:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserOverlay, 0);
  objc_storeStrong((id *)&self->_sourcesOverlay, 0);
  objc_storeStrong((id *)&self->_pickerContext, 0);
  objc_storeStrong((id *)&self->_sourceObserver, 0);
  objc_storeStrong((id *)&self->_fullDocumentManagerViewController, 0);
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_itemToFocusDuringAppearance, 0);
  objc_destroyWeak((id *)&self->_splitViewDelegate);
  objc_storeStrong((id *)&self->_shortDebugID, 0);
  objc_storeStrong((id *)&self->_sizeTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_sidebarNavigationController, 0);
}

- (void)updateTraitCollectionTabBarSetting
{
  v2 = self;
  unsigned __int8 v3 = [(DOCSplitBrowserViewController *)v2 fullDocumentManagerViewController];
  id v4 = self;
  id v5 = [(DOCFullDocumentManagerViewController *)v3 configuration];
  id v6 = [v5 sceneIdentifier];

  id v7 = [v4 globalTabbedBrowserControllerForIdentifier:v6];
  [v7 updateTraitCollectionTabBarSetting];
}

- (void)sidebarViewController:(id)a3 didSelect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v9 = self;
  id v8 = [(DOCSplitBrowserViewController *)v9 doc_splitViewState];
  LODWORD(self) = [v8 isSidebarShownInOverlay];

  if (self) {
    [(DOCSplitBrowserViewController *)v9 toggleSidebarShown];
  }
  _sSo29DOCSplitBrowserViewControllerC11SaveToFilesE9didSelect_2atySo19DOCConcreteLocationC_AGSgtF_0(v7);
}

- (void)sidebarViewController:(id)a3 wantsToReveal:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = self;
  id v8 = [v6 fileProviderItem];
  if (v8)
  {
    id v9 = v8;
    id v10 = [(DOCSplitBrowserViewController *)v7 fullDocumentManagerViewController];
    DOCFullDocumentManagerViewController.reveal(item:showEnclosingFolder:completionBlock:)(v9, 1, (uint64_t)DOCSplitBrowserViewController.didCommitPreview(of:), 0);

    id v6 = v9;
    id v7 = (DOCSplitBrowserViewController *)v10;
  }
}

- (BOOL)sidebarViewControllerWithIsCollapsed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(DOCSplitBrowserViewController *)v5 doc_splitViewState];
  unsigned __int8 v7 = [v6 isCollapsed];

  return v7;
}

- (void)importScannedDocumentAt:(id)a3 presentingController:(id)a4
{
  uint64_t v6 = sub_1004CE370();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004CE320();
  id v10 = a4;
  id v11 = self;
  id v12 = [(DOCSplitBrowserViewController *)v11 fullDocumentManagerViewController];
  sub_1004CE2C0(v13);
  id v15 = v14;
  [(DOCFullDocumentManagerViewController *)v12 importScannedDocumentAt:v14 presentingController:v10];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)didSelectItem:(id)a3 atParentLocation:(id)a4 wasAlreadySelected:(BOOL)a5 onlyRevealIfColumn:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  id v13 = [(DOCSplitBrowserViewController *)v12 fullDocumentManagerViewController];
  [(DOCFullDocumentManagerViewController *)v13 didSelectItem:v10 atParentLocation:v11 wasAlreadySelected:v7 onlyRevealIfColumn:v6];
}

- (void)didConfirmPickIn:(id)a3
{
}

- (int64_t)pickerOperationFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  BOOL v6 = [(DOCSplitBrowserViewController *)v5 fullDocumentManagerViewController];
  int64_t v7 = [(DOCFullDocumentManagerViewController *)v6 pickerOperationFor:v4];

  return v7;
}

- (void)didSelectLocation:(id)a3 atParentLocation:(id)a4
{
  BOOL v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  _sSo29DOCSplitBrowserViewControllerC11SaveToFilesE9didSelect_2atySo19DOCConcreteLocationC_AGSgtF_0(v6);
}

- (void)didTapLocationOf:(id)a3
{
}

- (void)didTapOnUnselectableItem:(id)a3
{
}

- (void)didIndicateCancelPicker
{
  v2 = self;
  unsigned __int8 v3 = [(DOCSplitBrowserViewController *)v2 fullDocumentManagerViewController];
  [(DOCFullDocumentManagerViewController *)v3 didIndicateCancelPicker];
}

- (void)didToggleEditStateWithEditing:(BOOL)a3 in:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v8 = self;
  id v7 = [(DOCSplitBrowserViewController *)v8 fullDocumentManagerViewController];
  [(DOCFullDocumentManagerViewController *)v7 didToggleEditStateWithEditing:v4 in:v6];

  [(DOCSplitBrowserViewController *)v8 updateTraitCollectionTabBarSetting];
}

- (BOOL)canLoadAdditionalParents
{
  return 0;
}

- (void)beginLoadingAdditionalParents:(id)a3
{
  unsigned __int8 v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (BOOL)isBrowserCurrentLocation:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  id v6 = [(DOCSplitBrowserViewController *)v5 fullDocumentManagerViewController];
  unsigned __int8 v7 = [(DOCFullDocumentManagerViewController *)v6 isBrowserCurrentLocation:a3];
  swift_unknownObjectRelease();

  return v7;
}

- (BOOL)infoPanelPreviewingMultipleItems
{
  return 0;
}

- (void)prepareSnapshotForSplitStateChangingFromState:(id)a3 toState:(id)a4 alongside:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  id v10 = self;
  DOCSplitBrowserViewController.prepareSnapshotForSplitStateChanging(fromState:toState:alongside:)((uint64_t)v8, (uint64_t)v9, a5);

  swift_unknownObjectRelease();
}

- (void)forceSidebarHiddenByDefaultForUIPDocLandingIfNecessary
{
  v2 = self;
  if ([(DOCSplitBrowserViewController *)v2 enclosedInUIPDocumentLanding]
    && (id)[(DOCSplitBrowserViewController *)v2 displayMode] == (id)1)
  {
    [(DOCSplitBrowserViewController *)v2 saveUserPrefersSidebarHidden:1];
  }
}

- (void)updateUIPHorizontalInsetsIfNecessaryWithCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_100337C3C(a3);
  swift_unknownObjectRelease();
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    unsigned __int8 v7 = self;
  }
  DOCSplitBrowserViewController.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v16, (uint64_t)v17);

  sub_10003BA70((uint64_t)v16);
  uint64_t v8 = v18;
  if (v18)
  {
    id v9 = sub_100036428(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    double v11 = __chkstk_darwin(v9);
    id v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v10 + 16))(v13, v11);
    objc_super v14 = (void *)sub_1004D2F80();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    sub_100035EE0((uint64_t)v17);
  }
  else
  {
    objc_super v14 = 0;
  }
  return v14;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    sub_1004D29A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    unsigned __int8 v7 = self;
  }
  BOOL v8 = DOCSplitBrowserViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_10003BA70((uint64_t)v10);
  return v8;
}

@end