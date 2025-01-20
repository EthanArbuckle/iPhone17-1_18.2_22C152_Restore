@interface DOCFullDocumentManagerViewController
- (BOOL)_canNavigateBack;
- (BOOL)_canPopViewController;
- (BOOL)_defaultLocationIsRecentsTab;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)canGoToEnclosingFolder;
- (BOOL)canLoadAdditionalParents;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformGoToEnclosingFolder;
- (BOOL)canResetHierarchyController;
- (BOOL)environmentSupportsColumnView;
- (BOOL)establishFirstResponder;
- (BOOL)establishFirstResponderIfNeeded;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)infoPanelPreviewingMultipleItems;
- (BOOL)isActivated;
- (BOOL)isBrowserCurrentLocation:(id)a3;
- (BOOL)isInUserTriggeredSelectionMode;
- (BOOL)needsFirstResponder;
- (BOOL)prefersTabBarHidden;
- (BOOL)presentationContextShowsProvidersAsBrowserRoot;
- (BOOL)updateLocationsAfterPopTransition;
- (BOOL)viewDidLoadResetLocationDisabled;
- (DOCConcreteLocation)displayedRootLocation;
- (DOCFullDocumentManagerViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4;
- (DOCFullDocumentManagerViewControllerDelegate)fullDocumentManagerDelegate;
- (DOCSourceObserver)sourceObserver;
- (NSArray)droppedLocationsAfterSwitchingDisplayMode;
- (NSArray)goToFileProviderSources;
- (NSArray)keyCommands;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (NSString)shortDebugID;
- (RBSAssertion)processAssertion;
- (UINavigationController)internalNavigationController;
- (UIScrollView)primaryContentScrollView;
- (UITraitCollection)traitCollectionExpectedForSearchPresentation;
- (UIViewController)pickerPresentingController;
- (UIViewController)rootViewController;
- (UIViewControllerTransitionCoordinator)hierarchyChangeTransitionCoordinator;
- (_TtC18DocumentAppIntents16DOCActionManager)actionManager;
- (_TtC18DocumentAppIntents16DOCPickerContext)pickerContext;
- (_TtC18DocumentAppIntents18DOCDocumentManager)documentManager;
- (_TtC18DocumentAppIntents19DOCSearchController)effectiveSearchController;
- (_TtC18DocumentAppIntents21DOCFileProviderSource)currentGoToFileProviderSource;
- (_TtC18DocumentAppIntents21DOCPickerFilenameView)pickerFilenameView;
- (_TtC18DocumentAppIntents22DOCHierarchyController)hierarchyController;
- (_TtC18DocumentAppIntents22DOCLocationChangePacer)locationChangePacer;
- (_TtC18DocumentAppIntents22DOCSourceOrderObserver)sourceOrderObserver;
- (_TtC18DocumentAppIntents25DOCItemCollectionViewPool)itemCollectionViewPool;
- (_TtC18DocumentAppIntents27DOCDisplayModeChangeHandler)displayModeHandler;
- (_TtC18DocumentAppIntents29DOCBrowserContainerController)effectiveBrowserViewController;
- (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource)dataSource;
- (id)_navigationControllerDimmingColorForParallaxTransition:(id)a3;
- (id)_postSearchInitializationBufferStorage;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)currentItemCollectionViewController;
- (id)currentViewController;
- (id)goToFileProviderCandidateSource;
- (id)goToHiddenFileProviderCandidateSource;
- (id)provideColumnViewControllerWithContains:(id)a3;
- (id)provideContainerControllerAt:(id)a3 from:(id)a4 isUserInteraction:(BOOL)a5 isBrowsingTrash:(BOOL)a6;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (int64_t)pickerOperationFor:(id)a3;
- (unint64_t)effectiveTabSwitcherTab;
- (void)_navigateBack;
- (void)activateContainerViewControllersIfNeeded;
- (void)beginForcedNavigationTransitionChromeIfNeeded:(id)a3 appearingViewController:(id)a4 animated:(BOOL)a5;
- (void)beginLoadingAdditionalParents:(id)a3;
- (void)beginRenameOf:(id)a3;
- (void)clearDroppedLocationsAfterSwitchingViewStyle;
- (void)columnViewController:(id)a3 didShowItemControllers:(id)a4;
- (void)configureColumnViewController:(id)a3;
- (void)createNewFolderIn:(id)a3 moving:(id)a4;
- (void)dataSource:(id)a3 didSet:(id)a4 on:(id)a5 animated:(BOOL)a6;
- (void)dataSource:(id)a3 didUpdate:(id)a4 animated:(BOOL)a5;
- (void)dataSource:(id)a3 willSet:(id)a4 on:(id)a5 animated:(BOOL)a6;
- (void)dataSource:(id)a3 willSwitchFrom:(int64_t)a4 to:(int64_t)a5;
- (void)dealloc;
- (void)didChangeEnvironmentSupportsColumnView;
- (void)didCommitPreviewOf:(id)a3;
- (void)didConfirmPickIn:(id)a3;
- (void)didDismissSearchController:(id)a3;
- (void)didDismissSearchResultsController:(id)a3;
- (void)didFinishGatheringItemsAndThumbnailsWithSender:(id)a3;
- (void)didIndicateCancelPicker;
- (void)didPresentSearchController:(id)a3;
- (void)didPresentSearchResultsController:(id)a3;
- (void)didSelectItem:(id)a3 atParentLocation:(id)a4 wasAlreadySelected:(BOOL)a5 onlyRevealIfColumn:(BOOL)a6;
- (void)didSelectLocation:(id)a3 atParentLocation:(id)a4;
- (void)didTapLocationOf:(id)a3;
- (void)didTapOnUnselectableItem:(id)a3;
- (void)didToggleEditStateWithEditing:(BOOL)a3 in:(id)a4;
- (void)dismissSearch;
- (void)dismissSearchAlongsideCoordinator:(id)a3;
- (void)doc_commonInitWithSourceObserver:(id)a3;
- (void)doc_updateBarButtonTrackingViewsIfNecessary;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)endForcedNavigationTransitionChrome:(id)a3 appearingViewController:(id)a4;
- (void)ensureInternalNavigationControllerIsInstalled;
- (void)fullDocumentManagerViewControllerDidFinishLoading:(id)a3;
- (void)importScannedDocumentAt:(id)a3 presentingController:(id)a4;
- (void)installDebugMenuGesture;
- (void)invokeDebugGathering;
- (void)itemCollectionViewControllerDidLoad;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performCommandReturnKey:(id)a3;
- (void)performConfirmPickerExportOrDrillIn:(id)a3;
- (void)performConnectToServer:(id)a3;
- (void)performCreateDocument;
- (void)performCreateDocumentOrOpenNewWindow:(id)a3;
- (void)performCreateFolder:(id)a3;
- (void)performCreateFolderWithSelection:(id)a3;
- (void)performDismiss:(id)a3;
- (void)performEjectMedium:(id)a3;
- (void)performFind:(id)a3;
- (void)performGoBackInHistory:(id)a3;
- (void)performGoForwardInHistory:(id)a3;
- (void)performGoToEnclosingFolder:(id)a3;
- (void)performGoToLocation:(id)a3;
- (void)performGroupByDate:(id)a3;
- (void)performGroupByKind:(id)a3;
- (void)performGroupBySharedBy:(id)a3;
- (void)performGroupBySize:(id)a3;
- (void)performMoveHere:(id)a3;
- (void)performRename:(id)a3;
- (void)performShowDebugMenu:(id)a3;
- (void)performSortByDate:(id)a3;
- (void)performSortByKind:(id)a3;
- (void)performSortByName:(id)a3;
- (void)performSortBySharedBy:(id)a3;
- (void)performSortBySize:(id)a3;
- (void)performSortByTags:(id)a3;
- (void)performUseGrouping:(id)a3;
- (void)performViewAsColumns:(id)a3;
- (void)performViewAsIcons:(id)a3;
- (void)performViewAsList:(id)a3;
- (void)performViewAsUserSizeLarger:(id)a3;
- (void)performViewAsUserSizeSmaller:(id)a3;
- (void)popToRootViewControllerAnimated:(BOOL)a3;
- (void)preloadLaunchServiceDatabase;
- (void)presentDebugMenuForLongPress:(id)a3;
- (void)presentDebugMenuForMultipleTaps:(id)a3;
- (void)resetNavigationStepwise;
- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 updateLastUsedDate:(BOOL)a5 completion:(id)a6;
- (void)revealLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setActionManager:(id)a3;
- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3;
- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)setAllowsPickingMultipleItems:(BOOL)a3;
- (void)setCanGoToEnclosingFolder:(BOOL)a3;
- (void)setCurrentGoToFileProviderSource:(id)a3;
- (void)setCustomActions:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentManager:(id)a3;
- (void)setDroppedLocationsAfterSwitchingDisplayMode:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setEnvironmentSupportsColumnView:(BOOL)a3;
- (void)setFullDocumentManagerDelegate:(id)a3;
- (void)setGoToFileProviderCandidateSource:(id)a3;
- (void)setGoToFileProviderSources:(id)a3;
- (void)setGoToHiddenFileProviderCandidateSource:(id)a3;
- (void)setHierarchyController:(id)a3;
- (void)setIsActivated:(BOOL)a3;
- (void)setNeedsFirstResponder:(BOOL)a3;
- (void)setPickerContext:(id)a3;
- (void)setPickerFilenameView:(id)a3;
- (void)setPickerPresentingController:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setShortDebugID:(id)a3;
- (void)setSourceObserver:(id)a3;
- (void)setSourceOrderObserver:(id)a3;
- (void)setUpdateLocationsAfterPopTransition:(BOOL)a3;
- (void)setViewDidLoadResetLocationDisabled:(BOOL)a3;
- (void)set_postSearchInitializationBufferStorage:(id)a3;
- (void)showLocation:(id)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)showLocation:(id)a3 fromRootAnimated:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)splitViewWillChangeFrom:(int64_t)a3 to:(int64_t)a4 alongsideCoordinator:(id)a5;
- (void)splitViewWillDidExpand;
- (void)swift_commonInitWith:(id)a3;
- (void)swift_navigationController:(id)a3 didShow:(id)a4 animated:(BOOL)a5;
- (void)swift_navigationController:(id)a3 willShow:(id)a4 animated:(BOOL)a5;
- (void)swift_viewDidLoad;
- (void)updateAvailableDisplayModesWithAnimated:(BOOL)a3;
- (void)updateCustomActions;
- (void)updateNavigationBarPrefersLargeTitles;
- (void)updateRelatedViewControllersWithCurrentHierarchy;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDismissSearchController:(id)a3;
- (void)willDismissSearchResultsController:(id)a3;
- (void)willPresentSearchController:(id)a3;
- (void)willPresentSearchResultsController:(id)a3;
@end

@implementation DOCFullDocumentManagerViewController

- (void)preloadLaunchServiceDatabase
{
  if (qword_10066CCD0 != -1) {
    dispatch_once(&qword_10066CCD0, &stru_1005E4800);
  }
}

- (DOCFullDocumentManagerViewController)initWithConfiguration:(id)a3 sourceObserver:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)DOCFullDocumentManagerViewController;
  v7 = [(DOCFullDocumentManagerViewController *)&v10 initWithConfiguration:a3];
  v8 = v7;
  if (v7) {
    [(DOCFullDocumentManagerViewController *)v7 doc_commonInitWithSourceObserver:v6];
  }

  return v8;
}

- (void)doc_commonInitWithSourceObserver:(id)a3
{
  id v4 = a3;
  [(DOCFullDocumentManagerViewController *)self preloadLaunchServiceDatabase];
  v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];
  v7 = [v6 substringToIndex:6];
  shortDebugID = self->_shortDebugID;
  self->_shortDebugID = v7;

  v9 = objc_alloc_init(_TtC18DocumentAppIntents27DOCDisplayModeChangeHandler);
  displayModeHandler = self->_displayModeHandler;
  self->_displayModeHandler = v9;

  objc_storeWeak((id *)&self->_sourceObserver, v4);
  v11 = [_TtC18DocumentAppIntents25DOCItemCollectionViewPool alloc];
  v12 = [(DOCFullDocumentManagerViewController *)self configuration];
  v13 = [(DOCItemCollectionViewPool *)v11 initWithConfiguration:v12];
  itemCollectionViewPool = self->_itemCollectionViewPool;
  self->_itemCollectionViewPool = v13;

  v15 = [_TtC18DocumentAppIntents42DOCFullDocumentManagerNavigationController alloc];
  v16 = [(DOCFullDocumentManagerViewController *)self configuration];
  v17 = [(DOCFullDocumentManagerNavigationController *)v15 initWithConfiguration:v16];
  internalNavigationController = self->_internalNavigationController;
  self->_internalNavigationController = v17;

  v19 = [_TtC18DocumentAppIntents22DOCHierarchyController alloc];
  v20 = [(DOCFullDocumentManagerViewController *)self configuration];
  v21 = [(DOCHierarchyController *)v19 initWithConfiguration:v20 sourceObserver:v4 minParentLocations:100];
  [(DOCFullDocumentManagerViewController *)self setHierarchyController:v21];

  [(DOCHierarchyController *)self->_hierarchyController addObserver:self forKeyPath:@"lastLocation" options:1 context:off_1006557B8];
  [(DOCHierarchyController *)self->_hierarchyController addObserver:self forKeyPath:@"effectiveRootLocation" options:1 context:off_1006557B8];
  [(DOCHierarchyController *)self->_hierarchyController addObserver:self forKeyPath:@"locations" options:1 context:off_1006557B8];
  v22 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging();
    v22 = docUILogHandle;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_1004F0294(self, v22);
  }
  v23 = [_TtC18DocumentAppIntents18DOCDocumentManager alloc];
  v24 = [(DOCFullDocumentManagerViewController *)self configuration];
  v25 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  v26 = [(DOCDocumentManager *)v23 initWithConfiguration:v24 sourceObserver:v4 hierarchyController:v25];
  [(DOCFullDocumentManagerViewController *)self setDocumentManager:v26];

  v27 = [_TtC18DocumentAppIntents22DOCLocationChangePacer alloc];
  v28 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  v29 = [(DOCLocationChangePacer *)v27 initWithHierarchyController:v28];
  locationChangePacer = self->_locationChangePacer;
  self->_locationChangePacer = v29;

  v31 = [_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource alloc];
  v32 = [(DOCFullDocumentManagerViewController *)self configuration];
  v33 = [(DOCFullDocumentManagerViewController *)self sourceObserver];
  v34 = [(DOCBrowserNavigationDataSource *)v31 initWithConfiguration:v32 sourceObserver:v33];
  dataSource = self->_dataSource;
  self->_dataSource = v34;

  v36 = [(DOCFullDocumentManagerViewController *)self dataSource];
  [v36 setItemProvider:self];

  v37 = [(DOCFullDocumentManagerViewController *)self dataSource];
  [v37 setUpdateObserver:self];

  v38 = [(DOCFullDocumentManagerViewController *)self dataSource];
  v39 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  [v39 setDelegate:v38];

  [(UINavigationController *)self->_internalNavigationController setDelegate:self];
  v40 = [(DOCFullDocumentManagerViewController *)self documentManager];
  [v40 setDocumentBrowser:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceObserver);
  [(DOCFullDocumentManagerViewController *)self swift_commonInitWith:WeakRetained];

  [(DOCFullDocumentManagerViewController *)self setCustomActions:&__NSArray0__struct];
  v42 = +[NSNotificationCenter defaultCenter];
  [v42 addObserver:self selector:"fullDocumentManagerViewControllerDidFinishLoading:" name:@"DOCFullDocumentManagerViewControllerDidFinishLoadingNotificationName" object:0];

  v43 = +[NSNotificationCenter defaultCenter];
  [v43 addObserver:self selector:"itemCollectionViewControllerDidLoad" name:@"DOCItemCollectionViewDidLoadContents" object:0];

  self->_userChangedDefaultSaveLocationToken = 0;
  objc_initWeak(&location, self);
  v44 = (const char *)DOCUserPickedNewDefaultSaveLocationNotification;
  id v45 = &_dispatch_main_q;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10000F6C8;
  v46[3] = &unk_1005E4848;
  objc_copyWeak(&v47, &location);
  notify_register_dispatch(v44, &self->_userChangedDefaultSaveLocationToken, (dispatch_queue_t)&_dispatch_main_q, v46);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&location);
}

- (void)setShortDebugID:(id)a3
{
  objc_storeStrong((id *)&self->_shortDebugID, a3);
  id v5 = a3;
  [(DOCBrowserNavigationDataSource *)self->_dataSource setShortDebugID:v5];
}

- (NSString)shortDebugID
{
  return self->_shortDebugID;
}

- (NSString)description
{
  shortDebugID = self->_shortDebugID;
  v6.receiver = self;
  v6.super_class = (Class)DOCFullDocumentManagerViewController;
  v3 = [(DOCFullDocumentManagerViewController *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@: %@", shortDebugID, v3];

  return (NSString *)v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"DOCFullDocumentManagerViewControllerDidFinishLoadingNotificationName" object:0];

  [(DOCHierarchyController *)self->_hierarchyController removeObserver:self forKeyPath:@"lastLocation"];
  [(DOCHierarchyController *)self->_hierarchyController removeObserver:self forKeyPath:@"effectiveRootLocation"];
  [(DOCHierarchyController *)self->_hierarchyController removeObserver:self forKeyPath:@"locations"];
  if ([(DOCFullDocumentManagerViewController *)self isViewLoaded])
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:self];
  }
  int userChangedDefaultSaveLocationToken = self->_userChangedDefaultSaveLocationToken;
  if (userChangedDefaultSaveLocationToken)
  {
    notify_cancel(userChangedDefaultSaveLocationToken);
    self->_int userChangedDefaultSaveLocationToken = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)DOCFullDocumentManagerViewController;
  [(DOCFullDocumentManagerViewController *)&v6 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  v11 = v10;
  if (off_1006557B8 == a6)
  {
    if (([v10 isEqualToString:@"locations"] & 1) != 0
      || ([v11 isEqualToString:@"lastLocation"] & 1) != 0
      || [v11 isEqualToString:@"effectiveRootLocation"])
    {
      [(DOCFullDocumentManagerViewController *)self updateRelatedViewControllersWithCurrentHierarchy];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DOCFullDocumentManagerViewController;
    [(DOCFullDocumentManagerViewController *)&v12 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (BOOL)_defaultLocationIsRecentsTab
{
  v2 = [(DOCFullDocumentManagerViewController *)self configuration];
  v3 = [v2 defaultLocation];
  id v4 = [v3 sourceIdentifier];
  id v5 = (void *)DOCDocumentSourceIdentifierRecentDocuments;

  if (v4 != v5) {
    return 0;
  }

  return DOCUsePhoneIdiomForTraits();
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)DOCFullDocumentManagerViewController;
  [(DOCFullDocumentManagerViewController *)&v8 viewDidLoad];
  [(DOCFullDocumentManagerViewController *)self ensureInternalNavigationControllerIsInstalled];
  [(DOCFullDocumentManagerViewController *)self updateNavigationBarPrefersLargeTitles];
  if (!self->_viewDidLoadResetLocationDisabled)
  {
    v3 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
    [v3 resetWithDefaultLocationWithAnimated:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceObserver);
  [WeakRetained startObservingSources];

  if (os_variant_has_internal_diagnostics())
  {
    id v5 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"invokeDebugGathering"];
    multiTapDebugGestureRecognizer = self->_multiTapDebugGestureRecognizer;
    self->_multiTapDebugGestureRecognizer = v5;

    [(UITapGestureRecognizer *)self->_multiTapDebugGestureRecognizer setNumberOfTapsRequired:4];
    [(UITapGestureRecognizer *)self->_multiTapDebugGestureRecognizer setNumberOfTouchesRequired:2];
    [(UITapGestureRecognizer *)self->_multiTapDebugGestureRecognizer setDelegate:self];
    v7 = [(UINavigationController *)self->_internalNavigationController navigationBar];
    [v7 addGestureRecognizer:self->_multiTapDebugGestureRecognizer];
  }
  [(DOCFullDocumentManagerViewController *)self swift_viewDidLoad];
  [(DOCFullDocumentManagerViewController *)self installDebugMenuGesture];
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DOCFullDocumentManagerViewController;
  id v4 = a3;
  [(DOCFullDocumentManagerViewController *)&v6 setDelegate:v4];
  id v5 = [(DOCFullDocumentManagerViewController *)self documentManager];
  [v5 setUiBrowserDelegate:v4];
}

- (BOOL)_canNavigateBack
{
  v2 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
  v3 = [v2 viewControllers];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)_navigateBack
{
  if ([(DOCFullDocumentManagerViewController *)self _canPopViewController]
    && [(DOCFullDocumentManagerViewController *)self _canNavigateBack])
  {
    [(DOCFullDocumentManagerViewController *)self setEditing:0];
    id v4 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
    id v3 = [v4 popViewControllerAnimated:1];
  }
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DOCFullDocumentManagerViewController;
  -[DOCFullDocumentManagerViewController setAllowsPickingMultipleItems:](&v16, "setAllowsPickingMultipleItems:");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
  objc_super v6 = [v5 viewControllers];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v11 setAllowsPickingMultipleItems:v3];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  [(DOCFullDocumentManagerViewController *)self updateCustomActions];
}

- (BOOL)canResetHierarchyController
{
  v2 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  char v3 = [v2 isResetBeingPerformed] ^ 1;

  return v3;
}

- (void)setRootViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  if (self->_rootViewController != v5)
  {
    long long v13 = v5;
    [(UIViewController *)v5 doc_removeFromParentWithRemoveSubviewBlock:0];
    objc_super v6 = self->_rootViewController;
    objc_storeStrong((id *)&self->_rootViewController, a3);
    id v7 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
    id v8 = [v7 viewControllers];
    id v9 = [v8 mutableCopy];

    if (v6) {
      [v9 removeObject:v6];
    }
    id v10 = [v9 count];
    if (v13 || v10)
    {
      if (v13)
      {
        if ([v9 containsObject:v13])
        {
          DOCLogAssertionFailure();
          [v9 removeObject:v13];
        }
        [v9 insertObject:v13 atIndex:0];
      }
      long long v12 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
      [v12 setViewControllers:v9];
    }
    else
    {
      v11 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
      [v11 setViewControllers:&__NSArray0__struct];

      if (![(DOCFullDocumentManagerViewController *)self canResetHierarchyController])
      {
LABEL_14:

        id v5 = v13;
        goto LABEL_15;
      }
      long long v12 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
      [v12 resetWithDefaultLocationWithAnimated:0];
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (void)popToRootViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DOCFullDocumentManagerViewController *)self rootViewController];

  objc_super v6 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
  id v13 = v6;
  if (v5)
  {
    id v7 = [v6 viewControllers];
    id v8 = [(DOCFullDocumentManagerViewController *)self rootViewController];
    unsigned int v9 = [v7 containsObject:v8];

    if (!v9) {
      return;
    }
    id v13 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
    id v10 = [(DOCFullDocumentManagerViewController *)self rootViewController];
    id v11 = [v13 popToViewController:v10 animated:v3];
  }
  else
  {
    id v12 = [v6 popToRootViewControllerAnimated:v3];
  }
}

- (id)currentViewController
{
  v2 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
  BOOL v3 = [v2 topViewController];

  return v3;
}

- (id)currentItemCollectionViewController
{
  v2 = [(DOCFullDocumentManagerViewController *)self effectiveBrowserViewController];
  BOOL v3 = [v2 contentViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_multiTapDebugGestureRecognizer == a3;
}

- (void)showLocation:(id)a3 animated:(BOOL)a4 withCompletionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging();
    id v10 = docUILogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1004F0368((uint64_t)v8, v10);
  }
  self->_viewDidLoadResetLocationDisabled = v8 != 0;
  id v11 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  id v12 = v11;
  if (v8)
  {
    [v11 resetWith:v8 animated:v6 completionHandler:v9];
  }
  else
  {
    id v13 = +[DOCConcreteLocation emptyLocation];
    [v12 resetWith:v13 animated:v6 completionHandler:v9];
  }
}

- (void)showLocation:(id)a3 fromRootAnimated:(BOOL)a4 withCompletionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging();
    id v10 = docUILogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1004F0404();
  }
  self->_viewDidLoadResetLocationDisabled = v8 != 0;
  id v11 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  id v12 = v11;
  if (v8)
  {
    [v11 resetFromRootWith:v8 animated:v6 completionHandler:v9];
  }
  else
  {
    id v13 = +[DOCConcreteLocation emptyLocation];
    [v12 resetFromRootWith:v13 animated:v6 completionHandler:v9];
  }
}

- (void)revealLocation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging();
    id v10 = docUILogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1004F0490();
  }
  self->_viewDidLoadResetLocationDisabled = v8 != 0;
  id v11 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  id v12 = v8;
  if (!v8)
  {
    id v12 = +[DOCConcreteLocation emptyLocation];
  }
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100010628;
  v14[3] = &unk_1005E4870;
  id v15 = v9;
  id v13 = v9;
  [v11 revealLocation:v12 animated:v6 completion:v14];
  if (!v8) {
}
  }

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)DOCFullDocumentManagerViewController;
  [(DOCFullDocumentManagerViewController *)&v20 setAdditionalTrailingNavigationBarButtonItems:a3];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
  id v5 = [v4 viewControllers];

  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (id v11 = v10,
              objc_opt_class(),
              char isKindOfClass = objc_opt_isKindOfClass(),
              v11,
              (isKindOfClass & 1) != 0))
        {
          id v13 = objc_alloc((Class)NSArray);
          long long v14 = [(DOCFullDocumentManagerViewController *)self additionalTrailingNavigationBarButtonItems];
          id v15 = [v13 initWithArray:v14 copyItems:1];
          [v10 setAdditionalTrailingNavigationBarButtonItems:v15];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)DOCFullDocumentManagerViewController;
  [(DOCFullDocumentManagerViewController *)&v18 setAdditionalLeadingNavigationBarButtonItems:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
  id v5 = [v4 viewControllers];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = objc_alloc((Class)NSArray);
          id v12 = [(DOCFullDocumentManagerViewController *)self additionalLeadingNavigationBarButtonItems];
          id v13 = [v11 initWithArray:v12 copyItems:1];
          [v10 setAdditionalLeadingNavigationBarButtonItems:v13];
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v7);
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(DOCFullDocumentManagerViewController *)self isEditing] != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)DOCFullDocumentManagerViewController;
    [(DOCFullDocumentManagerViewController *)&v10 setEditing:v5 animated:v4];
    [(DOCFullDocumentManagerViewController *)self willChangeValueForKey:@"editing"];
    id v7 = [(DOCFullDocumentManagerViewController *)self internalNavigationController];
    uint64_t v8 = [v7 topViewController];

    id v9 = (id)v8;
    objc_opt_class();
    LOBYTE(v8) = objc_opt_isKindOfClass();

    if ((v8 & 1) == 0) {
      [v9 setEditing:v5 animated:v4];
    }
    [(DOCFullDocumentManagerViewController *)self didChangeValueForKey:@"editing"];
  }
}

- (_TtC18DocumentAppIntents29DOCBrowserContainerController)effectiveBrowserViewController
{
  BOOL v3 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  BOOL v4 = [v3 locations];

  BOOL v5 = docUILogHandle;
  if (!docUILogHandle)
  {
    DOCInitLogging();
    BOOL v5 = docUILogHandle;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1004F051C(v5, v4);
  }
  id v6 = [v4 lastObject];
  id v7 = [v6 fileProviderItem];

  if (!v7 || ([v7 isFolder] & 1) != 0)
  {
    uint64_t v8 = [(DOCFullDocumentManagerViewController *)self dataSource];
    id v9 = [v8 currentContainers];
    objc_super v10 = v9;
LABEL_8:
    uint64_t v11 = [v9 lastObject];
    goto LABEL_9;
  }
  long long v14 = [(DOCFullDocumentManagerViewController *)self dataSource];
  long long v15 = [v14 currentContainers];
  unint64_t v16 = (unint64_t)[v15 count] - 2;

  uint64_t v8 = [(DOCFullDocumentManagerViewController *)self dataSource];
  id v9 = [v8 currentContainers];
  objc_super v10 = v9;
  if ((v16 & 0x8000000000000000) != 0) {
    goto LABEL_8;
  }
  uint64_t v11 = [v9 objectAtIndexedSubscript:v16];
LABEL_9:
  id v12 = (void *)v11;

  return (_TtC18DocumentAppIntents29DOCBrowserContainerController *)v12;
}

- (_TtC18DocumentAppIntents19DOCSearchController)effectiveSearchController
{
  BOOL v3 = [(DOCFullDocumentManagerViewController *)self dataSource];
  BOOL v4 = [v3 currentViewControllers];
  BOOL v5 = [v4 lastObject];
  id v6 = [v5 navigationItem];
  id v7 = [v6 searchController];

  if (!v7)
  {
    uint64_t v8 = [(DOCFullDocumentManagerViewController *)self currentViewController];
    id v9 = [v8 navigationItem];
    id v7 = [v9 searchController];
  }

  return (_TtC18DocumentAppIntents19DOCSearchController *)v7;
}

- (BOOL)_canPopViewController
{
  v2 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  char v3 = [v2 isFetchingLocations] ^ 1;

  return v3;
}

- (BOOL)canGoToEnclosingFolder
{
  char v3 = [(DOCHierarchyController *)self->_hierarchyController lastLocation];
  if ([v3 isRoot])
  {
    BOOL v4 = 0;
  }
  else
  {
    BOOL v5 = [(DOCHierarchyController *)self->_hierarchyController lastLocation];
    id v6 = [v5 fileProviderItem];
    BOOL v4 = v6 != 0;
  }
  return v4;
}

- (BOOL)prefersTabBarHidden
{
  if ([(DOCFullDocumentManagerViewController *)self enclosingTabSwitcherStyle] == (id)2) {
    return 0;
  }
  if (![(UINavigationController *)self->_internalNavigationController isToolbarHidden]) {
    return 1;
  }

  return [(DOCFullDocumentManagerViewController *)self isInUserTriggeredSelectionMode];
}

- (void)setCustomActions:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DOCFullDocumentManagerViewController;
  [(DOCFullDocumentManagerViewController *)&v4 setCustomActions:a3];
  [(DOCFullDocumentManagerViewController *)self updateCustomActions];
}

- (void)dismissSearch
{
}

- (void)dismissSearchAlongsideCoordinator:(id)a3
{
  id v5 = a3;
  objc_super v4 = [(DOCFullDocumentManagerViewController *)self effectiveSearchController];
  if ([v4 isActive]) {
    [v4 deactivateAlongsideContainingTransitionCoordinator:v5];
  }
}

- (void)beginForcedNavigationTransitionChromeIfNeeded:(id)a3 appearingViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v15 = a3;
  id v8 = a4;
  id v9 = [v15 lastOperation];
  objc_super v10 = sub_100010F88(v8);
  uint64_t v11 = v10;
  if (v5 && v9 == (id)2 && [v10 needsForcedUnderNavBarAppearanceOnAppear])
  {
    id v12 = [v15 navigationBar];
    id v13 = [v12 standardAppearance];
    long long v14 = [v8 navigationItem];
    [v14 setScrollEdgeAppearance:v13];

    self->_resetNavBarScrollEdgeAfterPop = 1;
  }
}

- (void)endForcedNavigationTransitionChrome:(id)a3 appearingViewController:(id)a4
{
  if (self->_resetNavBarScrollEdgeAfterPop)
  {
    BOOL v5 = objc_msgSend(a4, "navigationItem", a3);
    [v5 setScrollEdgeAppearance:0];

    self->_resetNavBarScrollEdgeAfterPop = 0;
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  if (a4) {
    [(DOCFullDocumentManagerViewController *)self swift_navigationController:a3 willShow:a4 animated:a5];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(DOCFullDocumentManagerViewController *)self endForcedNavigationTransitionChrome:v8 appearingViewController:v9];
  objc_super v10 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  [v10 invalidateAllAssertions];

  uint64_t v11 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  id v12 = [v11 locations];

  v51 = v12;
  id v13 = [v12 count];
  v50 = [v8 viewControllers];
  id v14 = [v50 count];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v47 = v13;
    unsigned int v48 = v5;
    id v15 = objc_opt_new();
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v49 = v8;
    unint64_t v16 = [v8 viewControllers];
    id v17 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v57;
      do
      {
        objc_super v20 = 0;
        do
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v56 + 1) + 8 * (void)v20);
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
            [v15 addObject:v21];
          }
          objc_super v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v16 countByEnumeratingWithState:&v56 objects:v61 count:16];
      }
      while (v18);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
      v23 = [v22 effectiveRootLocation];

      uint64_t v5 = v48;
      v24 = v47;
      if (v23)
      {
        v25 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
        v26 = [v25 effectiveLocations];
        v24 = [v26 count];
      }
    }
    else
    {
      uint64_t v5 = v48;
      v24 = v47;
    }
    if (v24 > [v15 count]
      && [(DOCFullDocumentManagerViewController *)self updateLocationsAfterPopTransition])
    {
      v27 = [v49 childViewControllers];
      v28 = [v27 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      v30 = [v49 childViewControllers];
      v31 = [v30 count];
      uint64_t v32 = isKindOfClass & 1;
      uint64_t v5 = v48;

      int64_t v33 = &v24[v32] - v31;
      v34 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
      [v34 removeTrailingLocationCount:v33 animated:0];
    }
    id v8 = v49;
  }
  else if (v14)
  {
    id v43 = v9;
    objc_opt_class();
    objc_opt_isKindOfClass();

    if ([(DOCFullDocumentManagerViewController *)self canResetHierarchyController])
    {
      v44 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
      unsigned __int8 v45 = [v44 hasPendingLocationChange];

      if ((v45 & 1) == 0)
      {
        v46 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
        [v46 reset];
      }
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v35 = [v9 containerControllers];
    id v36 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v53;
      do
      {
        v39 = 0;
        do
        {
          if (*(void *)v53 != v38) {
            objc_enumerationMutation(v35);
          }
          [*(id *)(*((void *)&v52 + 1) + 8 * (void)v39) setPreventAppearanceForwarding:0];
          v39 = (char *)v39 + 1;
        }
        while (v37 != v39);
        id v37 = [v35 countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v37);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v9 setPreventAppearanceForwarding:0];
    }
  }
  [(DOCFullDocumentManagerViewController *)self setUpdateLocationsAfterPopTransition:0];
  v40 = [(DOCFullDocumentManagerViewController *)self configuration];
  v41 = [v40 sceneIdentifier];
  v42 = +[DOCTabbedBrowserViewController globalTabbedBrowserControllerForIdentifier:v41];
  [v42 updateLocationTitleFromCurrentState];

  [(DOCFullDocumentManagerViewController *)self swift_navigationController:v8 didShow:v9 animated:v5];
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  objc_super v4 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  if ([v4 isFetchingLocations]) {
    LOBYTE(v5) = 0;
  }
  else {
    unsigned int v5 = [(DOCFullDocumentManagerViewController *)self isEditing] ^ 1;
  }

  return v5;
}

- (id)_navigationControllerDimmingColorForParallaxTransition:(id)a3
{
  char v3 = [(DOCFullDocumentManagerViewController *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)1)
  {
    unsigned int v5 = +[UIColor blackColor];
    id v6 = [v5 colorWithAlphaComponent:0.03];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)columnViewController:(id)a3 didShowItemControllers:(id)a4
{
  id v6 = a4;
  id v7 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  [v7 invalidateAllAssertions];

  id v8 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
  id v9 = [v8 locations];

  id v10 = [v9 count];
  if (a3)
  {
    id v11 = v10;
    id v12 = +[NSMutableArray arrayWithArray:v6];
    id v13 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
    id v14 = [v13 effectiveRootLocation];

    if (v14)
    {
      id v15 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
      unint64_t v16 = [v15 effectiveLocations];
      id v11 = [v16 count];
    }
    if (v11 > [v12 count]
      && [(DOCFullDocumentManagerViewController *)self updateLocationsAfterPopTransition])
    {
      id v17 = [(DOCFullDocumentManagerViewController *)self hierarchyController];
      [v17 removeTrailingLocationCount:1 animated:0];
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v6;
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v22), "setPreventAppearanceForwarding:", 0, (void)v26);
        v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }

  [(DOCFullDocumentManagerViewController *)self setUpdateLocationsAfterPopTransition:0];
  v23 = [(DOCFullDocumentManagerViewController *)self configuration];
  v24 = [v23 sceneIdentifier];
  v25 = +[DOCTabbedBrowserViewController globalTabbedBrowserControllerForIdentifier:v24];
  [v25 updateLocationTitleFromCurrentState];
}

- (void)revealDocumentAtURL:(id)a3 importIfNeeded:(BOOL)a4 updateLastUsedDate:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  [(DOCFullDocumentManagerViewController *)self dismissSearch];
  [(DOCFullDocumentManagerViewController *)self setEditing:0 animated:1];
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100011B68;
  v34[3] = &unk_1005E48C0;
  id v12 = v11;
  id v35 = v12;
  id v13 = objc_retainBlock(v34);
  id v14 = [(DOCFullDocumentManagerViewController *)self configuration];
  id v15 = [v14 sceneIdentifier];
  unint64_t v16 = +[DOCInteractionManager sharedManagerFor:v15];
  [v16 setLastSelectedItem:0];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100011C50;
  v29[3] = &unk_1005E4910;
  id v17 = v13;
  id v32 = v17;
  id v18 = v10;
  BOOL v33 = a4;
  id v30 = v18;
  v31 = self;
  id v19 = objc_retainBlock(v29);
  id v20 = v19;
  if (v7)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100011E3C;
    v27[3] = &unk_1005E4938;
    uint64_t v21 = (id *)&v28;
    long long v28 = v19;
    v22 = v19;
    [v18 bumpLastOpenDateWithCompletionHandler:v27];
  }
  else
  {
    v23 = +[FPItemManager defaultManager];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100011E4C;
    v25[3] = &unk_1005E4960;
    uint64_t v21 = &v26;
    long long v26 = v20;
    id v24 = v20;
    [v23 fetchItemForURL:v18 completionHandler:v25];
  }
}

- (void)resetNavigationStepwise
{
  if ([(DOCFullDocumentManagerViewController *)self _canPopViewController]
    && ([(DOCFullDocumentManagerViewController *)self internalNavigationController],
        char v3 = objc_claimAutoreleasedReturnValue(),
        [v3 viewControllers],
        id v4 = objc_claimAutoreleasedReturnValue(),
        id v5 = [v4 count],
        v4,
        v3,
        (unint64_t)v5 >= 2))
  {
    [(DOCFullDocumentManagerViewController *)self _navigateBack];
  }
  else
  {
    id v6 = [(DOCFullDocumentManagerViewController *)self primaryContentScrollView];
    [v6 _scrollToTopIfPossible:1];
  }
}

- (void)setEnvironmentSupportsColumnView:(BOOL)a3
{
  if (self->_environmentSupportsColumnView != a3)
  {
    self->_environmentSupportsColumnView = a3;
    [(DOCFullDocumentManagerViewController *)self didChangeEnvironmentSupportsColumnView];
  }
}

- (void)setPickerContext:(id)a3
{
  id v5 = (_TtC18DocumentAppIntents16DOCPickerContext *)a3;
  p_pickerContext = &self->_pickerContext;
  if (self->_pickerContext != v5)
  {
    BOOL v7 = v5;
    objc_storeStrong((id *)&self->_pickerContext, a3);
    [(DOCPickerFilenameView *)self->_pickerFilenameView setPickerContext:*p_pickerContext];
    [(DOCHierarchyController *)self->_hierarchyController setPickerContext:*p_pickerContext];
    id v5 = v7;
  }
}

- (UINavigationController)internalNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 40, 1);
}

- (UIViewController)rootViewController
{
  return self->_rootViewController;
}

- (DOCFullDocumentManagerViewControllerDelegate)fullDocumentManagerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fullDocumentManagerDelegate);

  return (DOCFullDocumentManagerViewControllerDelegate *)WeakRetained;
}

- (void)setFullDocumentManagerDelegate:(id)a3
{
}

- (_TtC18DocumentAppIntents22DOCHierarchyController)hierarchyController
{
  return (_TtC18DocumentAppIntents22DOCHierarchyController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHierarchyController:(id)a3
{
}

- (_TtC18DocumentAppIntents18DOCDocumentManager)documentManager
{
  return (_TtC18DocumentAppIntents18DOCDocumentManager *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDocumentManager:(id)a3
{
}

- (_TtC18DocumentAppIntents16DOCActionManager)actionManager
{
  return (_TtC18DocumentAppIntents16DOCActionManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setActionManager:(id)a3
{
}

- (_TtC18DocumentAppIntents27DOCDisplayModeChangeHandler)displayModeHandler
{
  return (_TtC18DocumentAppIntents27DOCDisplayModeChangeHandler *)objc_getProperty(self, a2, 88, 1);
}

- (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource)dataSource
{
  return (_TtC18DocumentAppIntents30DOCBrowserNavigationDataSource *)objc_getProperty(self, a2, 96, 1);
}

- (_TtC18DocumentAppIntents25DOCItemCollectionViewPool)itemCollectionViewPool
{
  return (_TtC18DocumentAppIntents25DOCItemCollectionViewPool *)objc_getProperty(self, a2, 104, 1);
}

- (_TtC18DocumentAppIntents22DOCLocationChangePacer)locationChangePacer
{
  return (_TtC18DocumentAppIntents22DOCLocationChangePacer *)objc_getProperty(self, a2, 112, 1);
}

- (DOCSourceObserver)sourceObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceObserver);

  return (DOCSourceObserver *)WeakRetained;
}

- (void)setSourceObserver:(id)a3
{
}

- (_TtC18DocumentAppIntents22DOCSourceOrderObserver)sourceOrderObserver
{
  return self->_sourceOrderObserver;
}

- (void)setSourceOrderObserver:(id)a3
{
}

- (_TtC18DocumentAppIntents21DOCFileProviderSource)currentGoToFileProviderSource
{
  return self->_currentGoToFileProviderSource;
}

- (void)setCurrentGoToFileProviderSource:(id)a3
{
}

- (NSArray)goToFileProviderSources
{
  return self->_goToFileProviderSources;
}

- (void)setGoToFileProviderSources:(id)a3
{
}

- (id)goToFileProviderCandidateSource
{
  return self->_goToFileProviderCandidateSource;
}

- (void)setGoToFileProviderCandidateSource:(id)a3
{
}

- (id)goToHiddenFileProviderCandidateSource
{
  return self->_goToHiddenFileProviderCandidateSource;
}

- (void)setGoToHiddenFileProviderCandidateSource:(id)a3
{
}

- (_TtC18DocumentAppIntents16DOCPickerContext)pickerContext
{
  return self->_pickerContext;
}

- (_TtC18DocumentAppIntents21DOCPickerFilenameView)pickerFilenameView
{
  return self->_pickerFilenameView;
}

- (void)setPickerFilenameView:(id)a3
{
}

- (UIViewController)pickerPresentingController
{
  return self->_pickerPresentingController;
}

- (void)setPickerPresentingController:(id)a3
{
}

- (RBSAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (BOOL)updateLocationsAfterPopTransition
{
  return self->_updateLocationsAfterPopTransition;
}

- (void)setUpdateLocationsAfterPopTransition:(BOOL)a3
{
  self->_updateLocationsAfterPopTransition = a3;
}

- (BOOL)isActivated
{
  return self->_isActivated;
}

- (void)setIsActivated:(BOOL)a3
{
  self->_isActivated = a3;
}

- (BOOL)viewDidLoadResetLocationDisabled
{
  return self->_viewDidLoadResetLocationDisabled;
}

- (void)setViewDidLoadResetLocationDisabled:(BOOL)a3
{
  self->_viewDidLoadResetLocationDisabled = a3;
}

- (void)setCanGoToEnclosingFolder:(BOOL)a3
{
  self->_canGoToEnclosingFolder = a3;
}

- (NSArray)droppedLocationsAfterSwitchingDisplayMode
{
  return self->_droppedLocationsAfterSwitchingDisplayMode;
}

- (void)setDroppedLocationsAfterSwitchingDisplayMode:(id)a3
{
}

- (id)_postSearchInitializationBufferStorage
{
  return self->__postSearchInitializationBufferStorage;
}

- (void)set_postSearchInitializationBufferStorage:(id)a3
{
}

- (BOOL)needsFirstResponder
{
  return self->_needsFirstResponder;
}

- (void)setNeedsFirstResponder:(BOOL)a3
{
  self->_needsFirstResponder = a3;
}

- (BOOL)environmentSupportsColumnView
{
  return self->_environmentSupportsColumnView;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__postSearchInitializationBufferStorage, 0);
  objc_storeStrong((id *)&self->_droppedLocationsAfterSwitchingDisplayMode, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_pickerPresentingController, 0);
  objc_storeStrong((id *)&self->_pickerFilenameView, 0);
  objc_storeStrong((id *)&self->_pickerContext, 0);
  objc_storeStrong(&self->_goToHiddenFileProviderCandidateSource, 0);
  objc_storeStrong(&self->_goToFileProviderCandidateSource, 0);
  objc_storeStrong((id *)&self->_goToFileProviderSources, 0);
  objc_storeStrong((id *)&self->_currentGoToFileProviderSource, 0);
  objc_storeStrong((id *)&self->_sourceOrderObserver, 0);
  objc_destroyWeak((id *)&self->_sourceObserver);
  objc_storeStrong((id *)&self->_locationChangePacer, 0);
  objc_storeStrong((id *)&self->_itemCollectionViewPool, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_displayModeHandler, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_documentManager, 0);
  objc_storeStrong((id *)&self->_hierarchyController, 0);
  objc_destroyWeak((id *)&self->_fullDocumentManagerDelegate);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_internalNavigationController, 0);
  objc_storeStrong((id *)&self->_shortDebugID, 0);

  objc_storeStrong((id *)&self->_multiTapDebugGestureRecognizer, 0);
}

- (NSArray)keyCommands
{
  v2 = self;
  char v3 = DOCFullDocumentManagerViewController.keyCommands.getter();

  if (v3)
  {
    sub_100032070(0, (unint64_t *)&unk_10065F2C0);
    v4.super.isa = sub_1004F47D0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (void)performFind:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100118F88();
}

- (BOOL)canPerformGoToEnclosingFolder
{
  v2 = self;
  char v3 = [(DOCFullDocumentManagerViewController *)v2 dataSource];
  uint64_t v4 = *(uint64_t *)((char *)&v3->super.isa
                  + OBJC_IVAR____TtC18DocumentAppIntents30DOCBrowserNavigationDataSource_viewStyle);

  if (v4 == 2) {
    unsigned __int8 v5 = 0;
  }
  else {
    unsigned __int8 v5 = [(DOCFullDocumentManagerViewController *)v2 _canNavigateBack];
  }

  return v5;
}

- (void)performGoToEnclosingFolder:(id)a3
{
}

- (void)performGoBackInHistory:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_100119090();
}

- (void)performGoForwardInHistory:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_100119320();
}

- (void)performViewAsIcons:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001155E0(0);
}

- (void)performViewAsList:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001155E0((uint64_t *)1);
}

- (void)performViewAsColumns:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001155E0((uint64_t *)2);
}

- (void)performViewAsUserSizeSmaller:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001195B0((unsigned int *)&enum case for DOCAdjustmentDirection.decrement(_:));
}

- (void)performViewAsUserSizeLarger:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001195B0((unsigned int *)&enum case for DOCAdjustmentDirection.increment(_:));
}

- (void)performUseGrouping:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_100119718();
}

- (void)performSortByName:(id)a3
{
}

- (void)performSortByDate:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001199FC();
}

- (void)performSortBySize:(id)a3
{
}

- (void)performSortByKind:(id)a3
{
}

- (void)performSortByTags:(id)a3
{
}

- (void)performSortBySharedBy:(id)a3
{
}

- (void)performGroupByKind:(id)a3
{
}

- (void)performGroupByDate:(id)a3
{
}

- (void)performGroupBySize:(id)a3
{
}

- (void)performGroupBySharedBy:(id)a3
{
}

- (void)performCreateFolder:(id)a3
{
}

- (void)performCreateFolderWithSelection:(id)a3
{
}

- (void)performCreateDocumentOrOpenNewWindow:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_100119D28();
}

- (void)performCreateDocument
{
  v2 = self;
  char v3 = [(DOCFullDocumentManagerViewController *)v2 documentManager];
  sub_1004E69D4(0);
}

- (void)performEjectMedium:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_10011A0E8();
}

- (void)performGoToLocation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_10011A1F4();
}

- (void)performConnectToServer:(id)a3
{
  unsigned __int8 v5 = self;
  id v6 = a3;
  BOOL v7 = self;
  id v8 = [(DOCFullDocumentManagerViewController *)v7 configuration];
  id v9 = [v8 sceneIdentifier];

  id v10 = [v5 globalTabbedBrowserControllerForIdentifier:v9];
  [v10 performConnectToServer:v6];
}

- (void)performCommandReturnKey:(id)a3
{
}

- (void)performConfirmPickerExportOrDrillIn:(id)a3
{
}

- (void)performRename:(id)a3
{
}

- (void)performDismiss:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_1001164E0(v4);
}

- (void)performMoveHere:(id)a3
{
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  DOCFullDocumentManagerViewController.validate(_:)((UICommand)v4);
}

- (void)updateCustomActions
{
  v2 = self;
  unsigned __int8 v5 = [(DOCFullDocumentManagerViewController *)v2 actionManager];
  id v3 = [(DOCFullDocumentManagerViewController *)v2 customActions];
  sub_100032070(0, (unint64_t *)&unk_1006593A0);
  uint64_t v4 = sub_1004F47F0();

  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v5->super.isa) + 0xB8))(v4);
}

- (UIViewControllerTransitionCoordinator)hierarchyChangeTransitionCoordinator
{
  v2 = self;
  id v3 = [(DOCFullDocumentManagerViewController *)v2 internalNavigationController];
  id v4 = [(UINavigationController *)v3 transitionCoordinator];

  return (UIViewControllerTransitionCoordinator *)v4;
}

- (void)dataSource:(id)a3 willSwitchFrom:(int64_t)a4 to:(int64_t)a5
{
  id v7 = a3;
  id v8 = self;
  sub_10021A0CC(a5);
}

- (void)dataSource:(id)a3 didUpdate:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  sub_100032070(0, (unint64_t *)&qword_10065D760);
  id v8 = (char *)sub_1004F47F0();
  id v9 = a3;
  id v10 = self;
  sub_100212274((uint64_t)v9, v8, v5);

  swift_bridgeObjectRelease();
}

- (void)dataSource:(id)a3 willSet:(id)a4 on:(id)a5 animated:(BOOL)a6
{
}

- (void)dataSource:(id)a3 didSet:(id)a4 on:(id)a5 animated:(BOOL)a6
{
}

- (void)clearDroppedLocationsAfterSwitchingViewStyle
{
  sub_100032070(0, &qword_1006580B0);
  id v3 = self;
  Class isa = sub_1004F47D0().super.isa;
  [(DOCFullDocumentManagerViewController *)v3 setDroppedLocationsAfterSwitchingDisplayMode:isa];
}

- (BOOL)presentationContextShowsProvidersAsBrowserRoot
{
  v2 = self;
  id v3 = [(DOCFullDocumentManagerViewController *)v2 traitCollection];
  id v4 = [v3 sourceOutlineStyle];

  return v4 == (id)1;
}

- (id)provideContainerControllerAt:(id)a3 from:(id)a4 isUserInteraction:(BOOL)a5 isBrowsingTrash:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  id v13 = sub_100214CC0(v10, a4, v7, v6);

  return v13;
}

- (id)provideColumnViewControllerWithContains:(id)a3
{
  type metadata accessor for DOCBrowserContainerController();
  unint64_t v4 = sub_1004F47F0();
  BOOL v5 = self;
  BOOL v6 = sub_100216760(v4);

  swift_bridgeObjectRelease();

  return v6;
}

- (void)configureColumnViewController:(id)a3
{
  unint64_t v4 = (char *)a3;
  BOOL v5 = self;
  sub_10021A578(v4);
}

- (void)doc_updateBarButtonTrackingViewsIfNecessary
{
  v2 = self;
  sub_10030C87C();
}

- (void)didTapOnUnselectableItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_100321DD0(v4);
}

- (void)didConfirmPickIn:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_100321FA8(v4);
}

- (int64_t)pickerOperationFor:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  int64_t v6 = sub_100325C50(v4);

  return v6;
}

- (void)invokeDebugGathering
{
  v2 = self;
  sub_100410F40();
}

- (void)installDebugMenuGesture
{
  v2 = self;
  sub_100411240();
}

- (void)presentDebugMenuForLongPress:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  if ([v4 state] == (id)1) {
    sub_100411384();
  }
}

- (void)presentDebugMenuForMultipleTaps:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  if ([v4 state] == (id)3) {
    sub_100411384();
  }
}

- (void)performShowDebugMenu:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1004F5D00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    BOOL v5 = self;
  }
  sub_100411384();

  sub_100034BB0((uint64_t)v6);
}

- (BOOL)isInUserTriggeredSelectionMode
{
  v2 = self;
  char v3 = sub_100477C18();

  return v3 & 1;
}

- (void)didSelectItem:(id)a3 atParentLocation:(id)a4 wasAlreadySelected:(BOOL)a5 onlyRevealIfColumn:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  sub_100477FEC(v10, a4, v7, v6);
}

- (void)didSelectLocation:(id)a3 atParentLocation:(id)a4
{
  BOOL v6 = (char *)a3;
  id v7 = a4;
  id v8 = self;
  sub_1004798C8(v6, a4);
}

- (void)didCommitPreviewOf:(id)a3
{
  BOOL v5 = self;
  id v6 = a3;
  id v7 = self;
  id v8 = [v5 defaultManager];
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  *(void *)(v9 + 24) = v7;
  v13[4] = sub_100490A48;
  v13[5] = v9;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_10013558C;
  v13[3] = &unk_10060AA80;
  id v10 = _Block_copy(v13);
  id v11 = v6;
  id v12 = v7;
  swift_release();
  [v8 fetchURLForItem:v11 completionHandler:v10];
  _Block_release(v10);
}

- (void)didTapLocationOf:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_10047B334(v4);
}

- (void)didIndicateCancelPicker
{
  v2 = self;
  sub_10047B924();
}

- (void)didToggleEditStateWithEditing:(BOOL)a3 in:(id)a4
{
  id v5 = a4;
  id v6 = self;
  sub_10048F00C();
}

- (void)didFinishGatheringItemsAndThumbnailsWithSender:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_10047BD10(a3);
}

- (BOOL)canLoadAdditionalParents
{
  v2 = self;
  char v3 = [(DOCFullDocumentManagerViewController *)v2 hierarchyController];
  char v4 = sub_1000724EC();

  return v4 & 1;
}

- (void)beginLoadingAdditionalParents:(id)a3
{
  char v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  id v7 = [(DOCFullDocumentManagerViewController *)v6 hierarchyController];
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_10036B4C4;
  *(void *)(v8 + 24) = v5;
  swift_retain();
  sub_1000726A0((uint64_t)sub_100490980, v8);

  swift_release();

  swift_release();
}

- (BOOL)isBrowserCurrentLocation:(id)a3
{
  swift_unknownObjectRetain();
  char v4 = self;
  char v5 = sub_10047C0A4();
  swift_unknownObjectRelease();

  return v5 & 1;
}

- (BOOL)infoPanelPreviewingMultipleItems
{
  v2 = self;
  char v3 = sub_10047C264();

  return v3 & 1;
}

- (void)beginRenameOf:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_10047C40C(v4);
}

- (void)createNewFolderIn:(id)a3 moving:(id)a4
{
  unint64_t v4 = (unint64_t)a4;
  if (a4)
  {
    sub_100032070(0, (unint64_t *)&qword_100656790);
    unint64_t v4 = sub_1004F47F0();
  }
  id v7 = a3;
  uint64_t v8 = self;
  sub_10047D4B8(v7, v4);

  swift_bridgeObjectRelease();
}

- (void)importScannedDocumentAt:(id)a3 presentingController:(id)a4
{
  uint64_t v6 = sub_1004F1510();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F14C0();
  id v10 = a4;
  id v11 = self;
  sub_10047DD6C((uint64_t)v9, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)documentPickerWasCancelled:(id)a3
{
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5 = a3;
  uint64_t v8 = self;
  uint64_t v6 = [(DOCFullDocumentManagerViewController *)v8 pickerPresentingController];
  if (v6)
  {
    uint64_t v7 = v6;
    [(UIViewController *)v6 dismissViewControllerAnimated:1 completion:0];
  }
  [(DOCFullDocumentManagerViewController *)v8 setPickerPresentingController:0];
}

- (BOOL)establishFirstResponderIfNeeded
{
  v2 = self;
  if ([(DOCFullDocumentManagerViewController *)v2 needsFirstResponder]
    && [(DOCFullDocumentManagerViewController *)v2 establishFirstResponder])
  {
    [(DOCFullDocumentManagerViewController *)v2 setNeedsFirstResponder:0];
    BOOL v3 = 1;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)establishFirstResponder
{
  v2 = self;
  Swift::Bool v3 = DOCFullDocumentManagerViewController.establishFirstResponder()();

  return v3;
}

- (unint64_t)effectiveTabSwitcherTab
{
  v2 = self;
  Swift::Bool v3 = [(DOCFullDocumentManagerViewController *)v2 hierarchyController];
  unint64_t v4 = (_TtC18DocumentAppIntents22DOCHierarchyController *)sub_100071FA0();
  if (v4)
  {
    id v5 = v4;
    unint64_t v6 = [(DOCHierarchyController *)v4 effectiveTabSwitcherTab];

    v2 = (DOCFullDocumentManagerViewController *)v3;
    Swift::Bool v3 = v5;
  }
  else
  {
    unint64_t v6 = *(unint64_t *)((char *)&v3->super.isa
                             + OBJC_IVAR____TtC18DocumentAppIntents22DOCHierarchyController_defaultTab);
  }

  return v6;
}

- (void)swift_commonInitWith:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100484B3C(v4);
}

- (void)fullDocumentManagerViewControllerDidFinishLoading:(id)a3
{
  uint64_t v4 = sub_1004F0F60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004F0F20();
  uint64_t v8 = self;
  sub_100486428();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)itemCollectionViewControllerDidLoad
{
}

- (void)activateContainerViewControllersIfNeeded
{
  v2 = self;
  sub_100487CF4();
}

- (DOCConcreteLocation)displayedRootLocation
{
  v2 = self;
  sub_100487F70();
  uint64_t v4 = v3;

  return (DOCConcreteLocation *)v4;
}

- (void)updateRelatedViewControllersWithCurrentHierarchy
{
  v2 = self;
  sub_1004881B8();
}

- (NSArray)preferredFocusEnvironments
{
  v2 = self;
  DOCFullDocumentManagerViewController.preferredFocusEnvironments.getter();

  sub_1000305BC((uint64_t *)&unk_10065A7E0);
  v3.super.Class isa = sub_1004F47D0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    sub_1004F5D00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v7 = self;
  }
  unsigned __int8 v8 = DOCFullDocumentManagerViewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v10);

  sub_10004B8B4((uint64_t)v10, &qword_10065B250);
  return v8 & 1;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    uint64_t v6 = self;
    swift_unknownObjectRetain();
    sub_1004F5D00();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    uint64_t v7 = self;
  }
  DOCFullDocumentManagerViewController.target(forAction:withSender:)((uint64_t)a3, (uint64_t)v16, v17);

  sub_10004B8B4((uint64_t)v16, &qword_10065B250);
  uint64_t v8 = v18;
  if (v18)
  {
    uint64_t v9 = sub_100031D28(v17, v18);
    uint64_t v10 = *(void *)(v8 - 8);
    __n128 v11 = __chkstk_darwin(v9);
    id v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, __n128))(v10 + 16))(v13, v11);
    id v14 = (void *)sub_1004F62D0();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v8);
    sub_100037DD4((uint64_t)v17);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)ensureInternalNavigationControllerIsInstalled
{
  v2 = self;
  sub_100488DC0();
}

- (void)swift_viewDidLoad
{
  v2 = self;
  sub_100489200();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)DOCFullDocumentManagerViewController;
  uint64_t v6 = self;
  id v7 = a3;
  [(DOCFullDocumentManagerViewController *)&v8 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  if (v7)
  {
    -[DOCFullDocumentManagerViewController updateAvailableDisplayModesWithAnimated:](v6, "updateAvailableDisplayModesWithAnimated:", 1, v8.receiver, v8.super_class);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v4 = self;
  DOCFullDocumentManagerViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DOCFullDocumentManagerViewController;
  [(DOCFullDocumentManagerViewController *)&v3 viewDidDisappear:a3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DOCFullDocumentManagerViewController;
  BOOL v4 = self;
  [(DOCFullDocumentManagerViewController *)&v5 viewWillAppear:v3];
  sub_100482FA4();
  -[DOCFullDocumentManagerViewController updateAvailableDisplayModesWithAnimated:](v4, "updateAvailableDisplayModesWithAnimated:", 0, v5.receiver, v5.super_class);
  sub_1004898AC();
  sub_100321A18();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DOCFullDocumentManagerViewController;
  BOOL v4 = self;
  [(DOCFullDocumentManagerViewController *)&v5 viewDidAppear:v3];
  [(DOCFullDocumentManagerViewController *)v4 updateCustomActions];
}

- (void)didChangeEnvironmentSupportsColumnView
{
  BOOL v4 = self;
  id v2 = [(DOCFullDocumentManagerViewController *)v4 viewIfLoaded];
  id v3 = [v2 window];

  if (v3) {
    [(DOCFullDocumentManagerViewController *)v4 updateAvailableDisplayModesWithAnimated:1];
  }
}

- (void)updateAvailableDisplayModesWithAnimated:(BOOL)a3
{
  BOOL v4 = self;
  sub_100489D68(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  DOCFullDocumentManagerViewController.viewWillTransition(to:with:)(a4);
  swift_unknownObjectRelease();
}

- (void)splitViewWillDidExpand
{
  id v2 = self;
  sub_10048A330();
}

- (void)splitViewWillChangeFrom:(int64_t)a3 to:(int64_t)a4 alongsideCoordinator:(id)a5
{
  swift_unknownObjectRetain();
  id v7 = self;
  sub_10048F920(a5);
  swift_unknownObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  DOCFullDocumentManagerViewController.viewDidLayoutSubviews()();
}

- (void)updateNavigationBarPrefersLargeTitles
{
  id v2 = self;
  sub_10048A614();
}

- (UIScrollView)primaryContentScrollView
{
  id v2 = self;
  id v3 = [(DOCFullDocumentManagerViewController *)v2 internalNavigationController];
  BOOL v4 = [(UINavigationController *)v3 topViewController];

  if (v4)
  {
    id v5 = [(DOCFullDocumentManagerViewController *)v4 contentScrollViewForEdge:1];

    id v2 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return (UIScrollView *)v5;
}

- (void)swift_navigationController:(id)a3 willShow:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_10048A808(v8, v9, a5);
}

- (void)swift_navigationController:(id)a3 didShow:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  sub_10048FA44(v8);
}

- (UITraitCollection)traitCollectionExpectedForSearchPresentation
{
  id v2 = self;
  id v3 = sub_10048B268();

  return (UITraitCollection *)v3;
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10048B948((uint64_t)v4);
}

- (void)didPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10048B368((uint64_t)v4, [v4 showsSearchResultsController]);
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = (char *)a3;
  id v5 = self;
  sub_10048BE24(v4);
}

- (void)didDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10048C02C(v4);
}

- (void)willPresentSearchResultsController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10048C6A8((uint64_t)v4);
}

- (void)didPresentSearchResultsController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10048B368((uint64_t)v4, 1u);
}

- (void)willDismissSearchResultsController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10048C8EC((uint64_t)v4);
}

- (void)didDismissSearchResultsController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10048B368((uint64_t)v4, 0);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9 = objc_allocWithZone((Class)type metadata accessor for DOCModalBlurViewControllerTransition());
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = self;
  id v14 = sub_1003286D4(0);

  return v14;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5 = objc_allocWithZone((Class)type metadata accessor for DOCModalBlurViewControllerTransition());
  id v6 = a3;
  id v7 = self;
  id v8 = sub_1003286D4(1);

  return v8;
}

@end