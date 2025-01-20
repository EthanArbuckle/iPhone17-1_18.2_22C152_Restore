@interface _MKPlaceViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldShowContactActions;
- (BOOL)_showReportAProblem;
- (BOOL)allowTransitLineSelection;
- (BOOL)disableReportAProblem;
- (BOOL)hasCheckedDistanceAvailability;
- (BOOL)hideDirectionsButtons;
- (BOOL)hideInlineMap;
- (BOOL)inlineMapViewControllerDidSelectMap:(id)a3;
- (BOOL)isGuardianRestrictedCNContainer;
- (BOOL)isLayoutDynamic;
- (BOOL)isLoading;
- (BOOL)placeInBookmarks;
- (BOOL)placeInCollections;
- (BOOL)placeInShortcuts;
- (BOOL)shouldDisplayBrowseCategoryVC;
- (BOOL)showAddToPersonalGuides;
- (BOOL)showContactActions;
- (BOOL)showEditButton;
- (BOOL)showInlineMapInHeader;
- (BOOL)showNearbyApps;
- (BOOL)showReportAProblem;
- (BOOL)showShareActionsButton;
- (BOOL)showSimulateLocation;
- (BOOL)showTitleBar;
- (BOOL)stackingViewController:(id)a3 showsTitleForViewController:(id)a4;
- (BOOL)useCompactPhotosView;
- (CLLocation)location;
- (CNContact)contact;
- (CNContact)originalContact;
- (CNContactViewControllerPrivateDelegate)contactsNavigationController;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (MKMapItem)mapItem;
- (NSMutableArray)viewDidAppearBlocks;
- (NSString)headerTitle;
- (OS_dispatch_queue)analyticsQueue;
- (_MKPlaceActionButtonController)headerAlternatePrimaryButtonController;
- (_MKPlaceActionButtonController)headerSecondaryButtonController;
- (_MKPlaceItem)placeItem;
- (_MKPlaceViewController)init;
- (_MKPlaceViewController)initWithContact:(id)a3 mapItem:(id)a4;
- (_MKPlaceViewController)initWithContact:(id)a3 mapItem:(id)a4 options:(unint64_t)a5;
- (_MKPlaceViewController)initWithMapItem:(id)a3;
- (_MKPlaceViewController)initWithMapItem:(id)a3 options:(unint64_t)a4;
- (_MKPlaceViewController)initWithPlaceItem:(id)a3 options:(unint64_t)a4;
- (_MKPlaceViewControllerDelegate)placeViewControllerDelegate;
- (_MKPlaceViewControllerFeedbackDelegate)placeViewFeedbackDelegate;
- (double)contentAlpha;
- (double)headerHeight;
- (double)headerSecondaryNameLabelPadding;
- (double)placeCardHeaderViewControllerTrailingConstantForTitle:(id)a3;
- (double)stackingViewController:(id)a3 heightForSeparatorBetweenUpperViewController:(id)a4 andLowerViewController:(id)a5;
- (double)stackingViewController:(id)a3 minimumVisibleSurfacePercentForAnalyticsSelection:(id)a4;
- (id)_contactForEditOperations;
- (id)_contactStore;
- (id)_createViewControllerForModule:(id)a3;
- (id)_mapTableKeyForSectionPosition:(int64_t)a3;
- (id)_traits;
- (id)_viewControllerForClass:(Class)a3;
- (id)additionalViewControllersAtPosition:(int64_t)a3;
- (id)attributionsVC;
- (id)collectionViews;
- (id)createFooterActions;
- (id)createMenuActions;
- (id)generateAvailableActionForAnalytics;
- (id)generateUnactionableUIElementsForAnalytics;
- (id)hoursVC;
- (id)infosVC;
- (id)inlineMapVC;
- (id)photoVC;
- (id)placeViewFeedbackAppLaunchHandler;
- (id)poisInlineMapVC;
- (id)stackingViewController:(id)a3 scrollViewForViewController:(id)a4;
- (int)_moduleTypeForViewController:(id)a3;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)getPlaceCardTypeForAnalytics;
- (int)mapTypeForETAProvider:(id)a3;
- (int64_t)_sectionPositionForMapTableKey:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)annotatedItemListDisplayStyle;
- (unint64_t)options;
- (void)ETAProviderLocationUpdated:(id)a3;
- (void)_commonInit;
- (void)_createViewControllers:(id)a3;
- (void)_createViewControllersForBrand:(id)a3;
- (void)_createViewControllersForShortPlacecard:(id)a3;
- (void)_launchAttributionURLs:(id)a3 withAttribution:(id)a4 mapItem:(id)a5 completionHandler:(id)a6;
- (void)_logClientAndServerLayouts:(id)a3;
- (void)_performWhenViewHasAppeared:(id)a3;
- (void)_presentViewControllerWithInterfaceStyleCheck:(id)a3;
- (void)_setDefaultViewControllers:(id)a3;
- (void)_updateViewControllers;
- (void)addAdditionalViewController:(id)a3 atPosition:(int64_t)a4;
- (void)collectionIdentifierSelected:(id)a3;
- (void)dealloc;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 actionRichProviderId:(id)a9;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7;
- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8;
- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
- (void)placeActionManager:(id)a3 didSelectShareFromView:(id)a4;
- (void)placeCardActionControllerDidSelectAddPhoto:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5;
- (void)placeCardActionControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5;
- (void)placeCardActionControllerDidSelectViewAllPhotos:(id)a3 presentingViewController:(id)a4;
- (void)placeCardPhotosController:(id)a3 didSelectViewPhotoWithID:(id)a4 presentingViewController:(id)a5;
- (void)placeCardWillCloseFromClientType:(unint64_t)a3;
- (void)placeHeaderButtonsViewController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withView:(id)a5;
- (void)removeAdditionalViewController:(id)a3;
- (void)setAllowTransitLineSelection:(BOOL)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setContactsNavigationController:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentVisibility:(int64_t)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setDisableReportAProblem:(BOOL)a3;
- (void)setHasCheckedDistanceAvailability:(BOOL)a3;
- (void)setHeaderAlternatePrimaryButtonController:(id)a3;
- (void)setHeaderHeight:(double)a3;
- (void)setHeaderSecondaryButtonController:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHideDirectionsButtons:(BOOL)a3;
- (void)setHideInlineMap:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapItem:(id)a3 contact:(id)a4 updateOriginalContact:(BOOL)a5;
- (void)setOptions:(unint64_t)a3;
- (void)setOriginalContact:(id)a3;
- (void)setPlaceInBookmarks:(BOOL)a3;
- (void)setPlaceInCollections:(BOOL)a3;
- (void)setPlaceInShortcuts:(BOOL)a3;
- (void)setPlaceItem:(id)a3;
- (void)setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4;
- (void)setPlaceViewControllerDelegate:(id)a3;
- (void)setPlaceViewFeedbackAppLaunchHandler:(id)a3;
- (void)setPlaceViewFeedbackDelegate:(id)a3;
- (void)setShowAddToPersonalGuides:(BOOL)a3;
- (void)setShowContactActions:(BOOL)a3;
- (void)setShowEditButton:(BOOL)a3;
- (void)setShowInlineMapInHeader:(BOOL)a3;
- (void)setShowNearbyApps:(BOOL)a3;
- (void)setShowReportAProblem:(BOOL)a3;
- (void)setShowShareActionsButton:(BOOL)a3;
- (void)setShowSimulateLocation:(BOOL)a3;
- (void)setShowTitleBar:(BOOL)a3;
- (void)setTransitOptions:(id)a3;
- (void)setUseCompactPhotosView:(BOOL)a3;
- (void)setViewDidAppearBlocks:(id)a3;
- (void)setWalkingOptions:(id)a3;
- (void)showContentIfLoaded;
- (void)updateContentAlpha;
- (void)updateHeaderTitle;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _MKPlaceViewController

- (BOOL)showTitleBar
{
  return (self->_options & 4) == 0;
}

- (void)setShowTitleBar:(BOOL)a3
{
  uint64_t v3 = 4;
  if (a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFFFBLL | v3];
}

- (BOOL)hideDirectionsButtons
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (void)setHideDirectionsButtons:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFFF7 | v3];
}

- (BOOL)showEditButton
{
  return (LOBYTE(self->_options) >> 4) & 1;
}

- (void)setShowEditButton:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFFEFLL | v3];
}

- (BOOL)hideInlineMap
{
  return self->_options & 1;
}

- (void)setHideInlineMap:(BOOL)a3
{
}

- (BOOL)showInlineMapInHeader
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (void)setShowInlineMapInHeader:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFFFDLL | v3];
}

- (BOOL)showNearbyApps
{
  return (LOBYTE(self->_options) >> 5) & 1;
}

- (void)setShowNearbyApps:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFFDFLL | v3];
}

- (BOOL)showReportAProblem
{
  return (self->_options & 0x40) == 0;
}

- (void)setShowReportAProblem:(BOOL)a3
{
  uint64_t v3 = 64;
  if (a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFFBFLL | v3];
}

- (BOOL)disableReportAProblem
{
  return (LOBYTE(self->_options) >> 6) & 1;
}

- (void)setDisableReportAProblem:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFFBFLL | v3];
}

- (BOOL)showSimulateLocation
{
  return (BYTE1(self->_options) >> 5) & 1;
}

- (void)setShowSimulateLocation:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFDFFFLL | v3];
}

- (BOOL)showShareActionsButton
{
  return (self->_options & 0x80) == 0;
}

- (void)setShowShareActionsButton:(BOOL)a3
{
  uint64_t v3 = 128;
  if (a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFF7FLL | v3];
}

- (BOOL)allowTransitLineSelection
{
  return BYTE1(self->_options) & 1;
}

- (void)setAllowTransitLineSelection:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFEFFLL | v3];
}

- (BOOL)showAddToPersonalGuides
{
  return BYTE1(self->_options) >> 7;
}

- (void)setShowAddToPersonalGuides:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFF7FFFLL | v3];
}

- (BOOL)useCompactPhotosView
{
  return (BYTE1(self->_options) >> 1) & 1;
}

- (void)setUseCompactPhotosView:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  [(_MKPlaceViewController *)self setOptions:self->_options & 0xFFFFFFFFFFFFFDFFLL | v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_MKPlaceViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)_MKPlaceViewController;
  v2 = [(_MKPlaceViewController *)&v5 init];
  uint64_t v3 = v2;
  if (v2) {
    [(_MKPlaceViewController *)v2 _commonInit];
  }
  return v3;
}

- (_MKPlaceViewController)initWithPlaceItem:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(_MKPlaceViewController *)self init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    [(_MKPlaceViewController *)v7 setPlaceItem:v6];
  }

  return v8;
}

- (_MKPlaceViewController)initWithMapItem:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(_MKPlaceViewController *)self init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    [(_MKPlaceViewController *)v7 setMapItem:v6];
  }

  return v8;
}

- (_MKPlaceViewController)initWithContact:(id)a3 mapItem:(id)a4
{
  return [(_MKPlaceViewController *)self initWithContact:a3 mapItem:a4 options:0];
}

- (_MKPlaceViewController)initWithContact:(id)a3 mapItem:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(_MKPlaceViewController *)self init];
  v11 = v10;
  if (v10)
  {
    v10->_options = a5;
    [(_MKPlaceViewController *)v10 setMapItem:v9 contact:v8 updateOriginalContact:1];
  }

  return v11;
}

- (_MKPlaceViewController)initWithMapItem:(id)a3
{
  return [(_MKPlaceViewController *)self initWithMapItem:a3 options:0];
}

- (void)_commonInit
{
  uint64_t v3 = MKGetPlaceCardLog();
  self->_os_signpost_id_t initialAppearanceSignpostID = os_signpost_id_generate(v3);

  v4 = MKGetPlaceCardLog();
  objc_super v5 = v4;
  os_signpost_id_t initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
  if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, initialAppearanceSignpostID, "PlacecardInitialAppearance", (const char *)&unk_18BD3917F, v12, 2u);
  }

  v7 = objc_alloc_init(MKPlaceItemActionDataProvider);
  actionDataProvider = self->_actionDataProvider;
  self->_actionDataProvider = v7;

  id v9 = [[MKPlaceActionManager alloc] initWithDataProvider:self->_actionDataProvider];
  actionManager = self->_actionManager;
  self->_actionManager = v9;

  [(MKPlaceActionManager *)self->_actionManager setPlaceCardDelegate:self];
  [(MKPlaceActionManager *)self->_actionManager setAnalyticsDelegate:self];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(_MKPlaceViewController *)self setViewDidAppearBlocks:v11];

  [(MKStackingViewController *)self setStackingDelegate:self];
  self->_contentAlpha = 1.0;
  [(_MKPlaceViewController *)self setModalPresentationStyle:2];
}

- (void)dealloc
{
  uint64_t v3 = +[MKMapItemMetadataRequester sharedInstance];
  v4 = [(_MKPlaceItem *)self->_placeItem mapItem];
  [v3 cancelRequestsForMapItem:v4];

  objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  [(MKETAProvider *)self->_etaProvider cancel];
  if ((self->_options & 0x20000000) == 0)
  {
    id v6 = +[MKAppImageManager sharedImageManager];
    [v6 clearImageCache];
  }
  v7.receiver = self;
  v7.super_class = (Class)_MKPlaceViewController;
  [(MKStackingViewController *)&v7 dealloc];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MKPlaceViewController;
  [(MKStackingViewController *)&v5 viewWillAppear:a3];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)PlaceCardLayoutChanged, @"com.apple.Maps.PlaceCardLayoutChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)viewDidAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_MKPlaceViewController;
  [(MKStackingViewController *)&v16 viewDidAppear:a3];
  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  objc_super v5 = [v4 bundleIdentifier];

  if (([v5 isEqualToString:*MEMORY[0x1E4F64320]] & 1) == 0) {
    [(_MKPlaceViewController *)self infoCardAnalyticsDidSelectAction:21 eventValue:0 feedbackDelegateSelector:0];
  }
  while (1)
  {
    id v9 = [(_MKPlaceViewController *)self viewDidAppearBlocks];
    uint64_t v10 = [v9 count];

    if (!v10) {
      break;
    }
    id v6 = [(_MKPlaceViewController *)self viewDidAppearBlocks];
    objc_super v7 = [v6 firstObject];

    v7[2](v7);
    id v8 = [(_MKPlaceViewController *)self viewDidAppearBlocks];
    [v8 removeObjectAtIndex:0];
  }
  viewDidAppearBlocks = self->_viewDidAppearBlocks;
  self->_viewDidAppearBlocks = 0;

  [(MKETAProvider *)self->_etaProvider restart];
  if (self->_initialAppearanceSignpostID != -1)
  {
    v12 = MKGetPlaceCardLog();
    v13 = v12;
    os_signpost_id_t initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
    if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_18BAEC000, v13, OS_SIGNPOST_INTERVAL_END, initialAppearanceSignpostID, "PlacecardInitialAppearance", (const char *)&unk_18BD3917F, v15, 2u);
    }

    self->_os_signpost_id_t initialAppearanceSignpostID = -1;
  }
}

- (void)_performWhenViewHasAppeared:(id)a3
{
  viewDidAppearBlocks = self->_viewDidAppearBlocks;
  if (viewDidAppearBlocks)
  {
    id v6 = (id)[a3 copy];
    v4 = (void *)MEMORY[0x18C139AE0]();
    [(NSMutableArray *)viewDidAppearBlocks addObject:v4];
  }
  else
  {
    objc_super v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_MKPlaceViewController;
  [(_MKPlaceViewController *)&v4 viewDidDisappear:a3];
  [(MKETAProvider *)self->_etaProvider pause];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_MKPlaceViewController;
  [(_MKPlaceViewController *)&v10 viewWillDisappear:a3];
  if (([(_MKPlaceViewController *)self isMovingFromParentViewController] & 1) != 0
    || (+[MKSystemController sharedInstance],
        objc_super v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 userInterfaceIdiom],
        v4,
        v5))
  {
    id v6 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
      [v8 placeViewControllerDidDismiss:self];
    }
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.Maps.PlaceCardLayoutChanged", 0);
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_MKPlaceViewController;
  [(MKStackingViewController *)&v6 viewDidLayoutSubviews];
  uint64_t v3 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int v5 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
    [v5 placeViewControllerDidUpdateHeight:self];
  }
}

- (BOOL)_showReportAProblem
{
  if (_MKRAPIsAvailable())
  {
    uint64_t v3 = [(_MKPlaceViewController *)self placeItem];
    if (([v3 options] & 4) != 0) {
      goto LABEL_8;
    }
    char v4 = [(_MKPlaceViewController *)self placeItem];
    char v5 = [v4 options];

    if ((v5 & 8) == 0)
    {
      uint64_t v3 = [(_MKPlaceViewController *)self mapItem];
      if (v3 && (self->_options & 0x40) == 0)
      {
        BOOL v6 = !self->_hasContactOnlyMapItem;
LABEL_9:

        return v6;
      }
LABEL_8:
      BOOL v6 = 0;
      goto LABEL_9;
    }
  }
  return 0;
}

- (void)_setDefaultViewControllers:(id)a3
{
  id v6 = a3;
  char v4 = [(_MKPlaceViewController *)self additionalViewControllersAtPosition:0];
  char v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v6, "count"));
  if (v4 && [v4 count]) {
    [v5 addObjectsFromArray:v4];
  }
  [v5 addObjectsFromArray:v6];
  [(MKStackingViewController *)self setViewControllers:v5];
}

- (BOOL)isLayoutDynamic
{
  if ((self->_options & 0x20000000) == 0) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)_MKPlaceViewController;
  return [(MKLayoutCardViewController *)&v3 isLayoutDynamic];
}

- (BOOL)isLoading
{
  v2 = [(_MKPlaceViewController *)self placeItem];
  char v3 = [v2 isIntermediateMapItem];

  return v3;
}

- (void)showContentIfLoaded
{
  if (![(_MKPlaceViewController *)self isLoading])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"MKPlaceViewControllerDidShowNotification" object:self];
  }
}

- (id)_contactStore
{
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    char v4 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
    char v5 = self->_contactStore;
    self->_contactStore = v4;

    contactStore = self->_contactStore;
  }

  return contactStore;
}

- (id)_contactForEditOperations
{
  id v3 = [(_MKPlaceViewController *)self originalContact];
  if (v3) {
    [(_MKPlaceViewController *)self originalContact];
  }
  else {
  char v4 = [(_MKPlaceViewController *)self contact];
  }

  return v4;
}

- (CNContact)contact
{
  contact = self->_contact;
  if (!contact)
  {
    char v4 = [(_MKPlaceItem *)self->_placeItem contact];
    char v5 = v4;
    if (v4)
    {
      id v6 = v4;
      char v7 = self->_contact;
      self->_contact = v6;
    }
    else
    {
      char v7 = [(_MKPlaceItem *)self->_placeItem mapItem];
      id v8 = [v7 _placeCardContact];
      id v9 = self->_contact;
      self->_contact = v8;
    }
    contact = self->_contact;
  }

  return contact;
}

- (BOOL)_shouldShowContactActions
{
  placeItem = self->_placeItem;
  if (placeItem)
  {
    char v5 = [(_MKPlaceItem *)placeItem contact];
    if (v5
      && ([(_MKPlaceItem *)self->_placeItem contact],
          v2 = objc_claimAutoreleasedReturnValue(),
          ([v2 hasBeenPersisted] & 1) != 0))
    {
      BOOL v6 = 1;
    }
    else if (([(_MKPlaceItem *)self->_placeItem options] & 8) != 0)
    {
      BOOL v6 = 1;
      if (!v5)
      {
LABEL_11:

        return !v6;
      }
    }
    else
    {
      BOOL v6 = [(_MKPlaceViewController *)self isGuardianRestrictedCNContainer];
      if (!v5) {
        goto LABEL_11;
      }
    }

    goto LABEL_11;
  }
  BOOL v6 = 1;
  return !v6;
}

- (BOOL)isGuardianRestrictedCNContainer
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(_MKPlaceViewController *)self _contactStore];
  char v4 = [v3 defaultContainerIdentifier];

  if (v4)
  {
    char v5 = (void *)MEMORY[0x1E4F1B9B0];
    v13[0] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    char v7 = [v5 predicateForContainersWithIdentifiers:v6];

    id v8 = [(_MKPlaceViewController *)self _contactStore];
    id v9 = [v8 containersMatchingPredicate:v7 error:0];

    if ([v9 count] == 1)
    {
      objc_super v10 = [v9 firstObject];
      char v11 = [v10 isGuardianRestricted];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)_updateViewControllers
{
  if (self->_isUpdatingViewControllers) {
    return;
  }
  self->_isUpdatingViewControllers = 1;
  id v3 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UpdateViewControllers", (const char *)&unk_18BD3917F, buf, 2u);
  }

  char v4 = [(_MKPlaceViewController *)self mapItem];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    [(MKPlaceActionManager *)self->_actionManager setIsCurrentLocation:0];
    uint64_t v6 = [v4 _isMapItemTypeBrand];
    [(MKPlaceCardHeaderViewController *)self->_headerViewController contentAlpha];
    double v8 = v7;
    id v9 = [[MKPlaceCardHeaderViewController alloc] initWithPlaceItem:self->_placeItem layout:v6];
    headerViewController = self->_headerViewController;
    self->_headerViewController = v9;

    [(MKPlaceCardHeaderViewController *)self->_headerViewController setContentAlpha:v8];
    [(MKPlaceCardHeaderViewController *)self->_headerViewController setDelegate:self];
    buttonsHeaderController = self->_buttonsHeaderController;
    if (!buttonsHeaderController)
    {
      v12 = objc_alloc_init(MKPlaceHeaderButtonsViewController);
      v13 = self->_buttonsHeaderController;
      self->_buttonsHeaderController = v12;

      [(MKPlaceHeaderButtonsViewController *)self->_buttonsHeaderController setDelegate:self];
      buttonsHeaderController = self->_buttonsHeaderController;
    }
    [(MKPlaceHeaderButtonsViewController *)buttonsHeaderController setPlaceItem:self->_placeItem];
    [(MKPlaceHeaderButtonsViewController *)self->_buttonsHeaderController setSecondaryButtonController:0];
    v14 = [(_MKPlaceViewController *)self placeItem];
    if (([v14 isIntermediateMapItem] & 1) != 0 || (self->_options & 8) != 0) {
      int v49 = 0;
    }
    else {
      int v49 = [v4 _canGetDirections];
    }

    [(MKETAProvider *)self->_etaProvider cancel];
    v15 = [[MKETAProvider alloc] initWithPlaceItem:self->_placeItem];
    etaProvider = self->_etaProvider;
    self->_etaProvider = v15;

    [(MKETAProvider *)self->_etaProvider setAutomobileOptions:self->_automobileOptions];
    [(MKETAProvider *)self->_etaProvider setWalkingOptions:self->_walkingOptions];
    [(MKETAProvider *)self->_etaProvider setTransitOptions:self->_transitOptions];
    [(MKETAProvider *)self->_etaProvider setCyclingOptions:self->_cyclingOptions];
    [(MKETAProvider *)self->_etaProvider setDelegate:self];
    [(MKETAProvider *)self->_etaProvider addObserver:self];
    [(MKETAProvider *)self->_etaProvider addObserver:self->_headerViewController];
    [(MKETAProvider *)self->_etaProvider addObserver:self->_buttonsHeaderController];
    v17 = [(MKETAProvider *)self->_etaProvider currentLocation];
    location = self->_location;
    self->_location = v17;

    if (([(_MKPlaceItem *)self->_placeItem options] & 1) == 0)
    {
      v19 = [(_MKPlaceItem *)self->_placeItem mapItem];
      v20 = [v19 _detourInfo];
      if (v20)
      {
        unint64_t options = self->_options;

        if ((options & 0x100000) != 0)
        {
          v22 = self->_buttonsHeaderController;
          uint64_t v23 = 2;
LABEL_16:
          [(MKPlaceHeaderButtonsViewController *)v22 setPrimaryButtonType:v23];
LABEL_20:
          if ([v4 _isMapItemTypeBrand]) {
            [(MKETAProvider *)self->_etaProvider start];
          }
          [v5 addObject:self->_headerViewController];
          goto LABEL_23;
        }
      }
      else
      {
      }
      if (v49)
      {
        [(MKPlaceHeaderButtonsViewController *)self->_buttonsHeaderController setPrimaryButtonType:1];
        [(MKETAProvider *)self->_etaProvider start];
      }
      goto LABEL_20;
    }
    [(MKPlaceActionManager *)self->_actionManager setIsCurrentLocation:1];
    v22 = self->_buttonsHeaderController;
    uint64_t v23 = 3;
    goto LABEL_16;
  }
LABEL_23:
  uint64_t v24 = [(_MKPlaceViewController *)self placeItem];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(_MKPlaceViewController *)self placeItem];
    char v27 = [v26 isIntermediateMapItem];

    if ((v27 & 1) == 0)
    {
      v28 = [(_MKPlaceViewController *)self headerSecondaryButtonController];
      [(MKPlaceHeaderButtonsViewController *)self->_buttonsHeaderController setSecondaryButtonController:v28];

      if ([(_MKPlaceViewController *)self isLayoutDynamic])
      {
        [(MKLayoutCardViewController *)self _createModuleLayout:v5];
      }
      else
      {
        if ([v4 _isMapItemTypeBrand]) {
          [(_MKPlaceViewController *)self _createViewControllersForBrand:v5];
        }
        else {
          [(_MKPlaceViewController *)self _createViewControllers:v5];
        }
        int BOOL = GEOConfigGetBOOL();
        int v30 = GEOConfigGetBOOL();
        if (BOOL && v30) {
          [(_MKPlaceViewController *)self _logClientAndServerLayouts:v5];
        }
      }
    }
  }
  [(_MKPlaceViewController *)self _setDefaultViewControllers:v5];
  [(_MKPlaceViewController *)self updateContentAlpha];
  if (!self->_inlineMapViewController) {
    goto LABEL_42;
  }
  if ([v4 _hasResolvablePartialInformation])
  {
    v31 = +[MKMapService sharedService];
    v32 = [v4 _addressFormattedAsSinglelineAddress];
    v33 = [v31 ticketForForwardGeocodeString:v32 traits:0];

    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __48___MKPlaceViewController__updateViewControllers__block_invoke;
    v51[3] = &unk_1E54B8FA8;
    v51[4] = self;
    [(_MKURLParser *)v33 submitWithHandler:v51 networkActivity:0];
  }
  else
  {
    if (!self->_inlineMapViewController) {
      goto LABEL_42;
    }
    v33 = [(_MKPlaceViewController *)self mapItem];
    uint64_t v34 = [(_MKURLParser *)v33 url];
    if (v34)
    {
      v35 = (void *)v34;
      v36 = [(_MKPlaceViewController *)self mapItem];
      v37 = [v36 url];
      BOOL v38 = +[_MKURLParser isValidMapURL:v37];

      if (!v38) {
        goto LABEL_42;
      }
      v39 = [_MKURLParser alloc];
      v40 = [(_MKPlaceViewController *)self mapItem];
      v41 = [v40 url];
      v33 = [(_MKURLParser *)v39 initWithURL:v41];

      [(_MKURLParser *)v33 parseIncludingCustomParameters:1];
      v42 = [(_MKPlaceViewController *)self mapItem];
      uint64_t v43 = [(MKMapItemIdentifier *)v42 _identifier];
      if (v43)
      {
        v44 = (void *)v43;
      }
      else
      {
        uint64_t v46 = [(_MKURLParser *)v33 searchUID];

        if (!v46) {
          goto LABEL_36;
        }
        v42 = [[MKMapItemIdentifier alloc] initWithMUID:[(_MKURLParser *)v33 searchUID]];
        v47 = +[MKMapService sharedService];
        v48 = [(_MKURLParser *)v33 contentProviderID];
        v44 = [v47 ticketForNonExpiredIdentifier:v42 resultProviderID:0 contentProvider:v48 traits:0];

        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __48___MKPlaceViewController__updateViewControllers__block_invoke_2;
        v50[3] = &unk_1E54B8FA8;
        v50[4] = self;
        [v44 submitWithHandler:v50 networkActivity:0];
      }
    }
  }
LABEL_36:

LABEL_42:
  self->_isUpdatingViewControllers = 0;
  v45 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UpdateViewControllers", (const char *)&unk_18BD3917F, buf, 2u);
  }
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
  id v5 = a3;
  [(MKPlacePoisInlineMapViewController *)self->_poisInlineMapViewController setLocation:v5];
}

- (void)_logClientAndServerLayouts:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = [(_MKPlaceViewController *)self _moduleTypeForViewController:*(void *)(*((void *)&v39 + 1) + 8 * i)]- 1;
        v12 = @"MODULE_TYPE_UNKNOWN";
        if (v11 <= 0x2C) {
          v12 = off_1E54B9938[v11];
        }
        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v8);
  }

  v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v14 = [(_MKPlaceViewController *)self mapItem];
  v15 = [v14 _placecardLayout];
  objc_super v16 = [v15 modules];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        unsigned int v21 = [*(id *)(*((void *)&v35 + 1) + 8 * j) type] - 1;
        v22 = @"MODULE_TYPE_UNKNOWN";
        if (v21 <= 0x2C) {
          v22 = off_1E54B9938[v21];
        }
        [v13 addObject:v22];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v18);
  }

  uint64_t v23 = MKGetPlaceCardLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v23, OS_LOG_TYPE_INFO, "[dynamic layout debug] Start", buf, 2u);
  }

  uint64_t v24 = MKGetPlaceCardLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = [(_MKPlaceViewController *)self mapItem];
    uint64_t v26 = [v25 _muid];
    char v27 = [(_MKPlaceViewController *)self mapItem];
    v28 = [v27 name];
    *(_DWORD *)buf = 134218242;
    uint64_t v44 = v26;
    __int16 v45 = 2112;
    uint64_t v46 = v28;
    _os_log_impl(&dword_18BAEC000, v24, OS_LOG_TYPE_INFO, "place item: muid %llu name %@", buf, 0x16u);
  }
  v29 = MKGetPlaceCardLog();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v44 = (uint64_t)v5;
    _os_log_impl(&dword_18BAEC000, v29, OS_LOG_TYPE_INFO, "client layout:\n%@", buf, 0xCu);
  }

  int v30 = MKGetPlaceCardLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v44 = (uint64_t)v13;
    _os_log_impl(&dword_18BAEC000, v30, OS_LOG_TYPE_INFO, "server layout:\n%@", buf, 0xCu);
  }

  v31 = MKGetPlaceCardLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    int v32 = [v5 isEqualToArray:v13];
    v33 = @"NO";
    if (v32) {
      v33 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    uint64_t v44 = (uint64_t)v33;
    _os_log_impl(&dword_18BAEC000, v31, OS_LOG_TYPE_INFO, "layout similar: %@", buf, 0xCu);
  }

  uint64_t v34 = MKGetPlaceCardLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18BAEC000, v34, OS_LOG_TYPE_INFO, "[dynamic layout debug] End", buf, 2u);
  }
}

- (void)_createViewControllersForBrand:(id)a3
{
  id v13 = a3;
  id v4 = [(_MKPlaceViewController *)self infosVC];
  infoViewController = self->_infoViewController;
  self->_infoViewController = v4;

  if (self->_infoViewController)
  {
    id v6 = [v13 lastObject];
    inlineMapViewController = self->_inlineMapViewController;

    if (v6 == inlineMapViewController) {
      [(MKPlaceInlineMapViewController *)self->_inlineMapViewController setBottomHairlineHidden:1];
    }
    [v13 addObject:self->_infoViewController];
  }
  uint64_t v8 = [(_MKPlaceViewController *)self poisInlineMapVC];
  poisInlineMapViewController = self->_poisInlineMapViewController;
  self->_poisInlineMapViewController = v8;

  if (self->_poisInlineMapViewController)
  {
    objc_msgSend(v13, "addObject:");
    [(MKPlaceInlineMapViewController *)self->_poisInlineMapViewController setBottomHairlineHidden:1];
  }
  objc_super v10 = [(_MKPlaceViewController *)self createFooterActions];
  placeActionViewController = self->_placeActionViewController;
  self->_placeActionViewController = v10;

  v12 = v13;
  if (self->_placeActionViewController)
  {
    objc_msgSend(v13, "addObject:");
    v12 = v13;
  }
}

- (void)_createViewControllers:(id)a3
{
  id v4 = a3;
  id v25 = v4;
  if (self->_buttonsHeaderController) {
    objc_msgSend(v4, "addObject:");
  }
  BOOL v5 = [(MKLayoutCardViewController *)self isTransitItem];
  id v6 = [(_MKPlaceViewController *)self inlineMapVC];
  inlineMapViewController = self->_inlineMapViewController;
  self->_inlineMapViewController = v6;

  if (self->_inlineMapViewController) {
    objc_msgSend(v25, "addObject:");
  }
  uint64_t v8 = [(_MKPlaceViewController *)self poisInlineMapVC];
  poisInlineMapViewController = self->_poisInlineMapViewController;
  self->_poisInlineMapViewController = v8;

  if (self->_poisInlineMapViewController) {
    objc_msgSend(v25, "addObject:");
  }
  uint64_t v10 = [(_MKPlaceViewController *)self photoVC];
  unsigned int v11 = (void *)v10;
  if (v5)
  {
    BOOL v12 = 0;
    BOOL v13 = v10 == 0;
  }
  else
  {
    v14 = self->_inlineMapViewController;
    BOOL v12 = v14 == 0;
    BOOL v13 = v10 == 0;
    if (v10 && !v14)
    {
      [v25 addObject:v10];
      BOOL v13 = 0;
    }
  }
  v15 = [(_MKPlaceViewController *)self hoursVC];
  if (v15) {
    [v25 addObject:v15];
  }
  objc_super v16 = [(_MKPlaceViewController *)self infosVC];
  infoViewController = self->_infoViewController;
  self->_infoViewController = v16;

  if (self->_infoViewController)
  {
    uint64_t v18 = [v25 lastObject];
    uint64_t v19 = self->_inlineMapViewController;

    if (v18 == v19) {
      [(MKPlaceInlineMapViewController *)self->_inlineMapViewController setBottomHairlineHidden:1];
    }
    [v25 addObject:self->_infoViewController];
  }
  if (!v13)
  {
    if ((([v25 containsObject:v11] | v12) & 1) == 0)
    {
      v20 = [v25 lastObject];
      unsigned int v21 = self->_infoViewController;

      if (v20 == v21) {
        [(MKPlaceInfoViewController *)self->_infoViewController setBottomHairlineHidden:1];
      }
      [v25 addObject:v11];
    }
    if (([v25 containsObject:v11] & 1) == 0)
    {
      [v11 setShowsBottomHairline:1];
      [v25 addObject:v11];
    }
  }
  v22 = [(_MKPlaceViewController *)self attributionsVC];
  if (v22) {
    [v25 addObject:v22];
  }
  uint64_t v23 = [(_MKPlaceViewController *)self createFooterActions];
  placeActionViewController = self->_placeActionViewController;
  self->_placeActionViewController = v23;

  if (self->_placeActionViewController) {
    objc_msgSend(v25, "addObject:");
  }
}

- (void)_createViewControllersForShortPlacecard:(id)a3
{
  id v6 = a3;
  if (self->_buttonsHeaderController) {
    objc_msgSend(v6, "addObject:");
  }
  id v4 = [(_MKPlaceViewController *)self createFooterActions];
  placeActionViewController = self->_placeActionViewController;
  self->_placeActionViewController = v4;

  if (self->_placeActionViewController) {
    objc_msgSend(v6, "addObject:");
  }
}

- (id)_createViewControllerForModule:(id)a3
{
  int v4 = [a3 type];
  BOOL v5 = 0;
  switch(v4)
  {
    case 2:
      buttonsHeaderController = self->_buttonsHeaderController;
      goto LABEL_13;
    case 3:
      uint64_t v7 = [(_MKPlaceViewController *)self poisInlineMapVC];
      poisInlineMapViewController = self->_poisInlineMapViewController;
      self->_poisInlineMapViewController = v7;

      BOOL v5 = self->_poisInlineMapViewController;
      if (v5) {
        goto LABEL_14;
      }
      uint64_t v9 = [(_MKPlaceViewController *)self inlineMapVC];
      uint64_t v10 = 1184;
      goto LABEL_12;
    case 4:
      BOOL v5 = [(_MKPlaceViewController *)self photoVC];
      goto LABEL_14;
    case 5:
      uint64_t v9 = [(_MKPlaceViewController *)self infosVC];
      uint64_t v10 = 1176;
      goto LABEL_12;
    case 6:
    case 7:
    case 8:
      goto LABEL_14;
    case 9:
      BOOL v5 = [(_MKPlaceViewController *)self hoursVC];
      goto LABEL_14;
    default:
      if (v4 == 23)
      {
        uint64_t v9 = [(_MKPlaceViewController *)self createFooterActions];
        uint64_t v10 = 1200;
LABEL_12:
        unsigned int v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v10);
        *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = v9;

        buttonsHeaderController = *(MKPlaceHeaderButtonsViewController **)((char *)&self->super.super.super.super.super.isa
                                                                         + v10);
LABEL_13:
        BOOL v5 = buttonsHeaderController;
      }
      else if (v4 == 24)
      {
        BOOL v5 = [(_MKPlaceViewController *)self attributionsVC];
      }
LABEL_14:
      return v5;
  }
}

- (int)_moduleTypeForViewController:(id)a3
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class()) {
    return 1;
  }
  if (v3 == objc_opt_class()) {
    return 2;
  }
  if (v3 == objc_opt_class()) {
    return 4;
  }
  if (v3 == objc_opt_class() || v3 == objc_opt_class()) {
    return 3;
  }
  if (v3 == objc_opt_class()) {
    return 5;
  }
  if (v3 == objc_opt_class()) {
    return 24;
  }
  if (v3 == objc_opt_class()) {
    return 9;
  }
  if (v3 == objc_opt_class()) {
    return 23;
  }
  return 0;
}

- (id)createFooterActions
{
  uint64_t v3 = objc_alloc_init(MKPlaceCardFooterActionsViewController);
  [(MKPlaceCardActionsViewController *)v3 setActionManager:self->_actionManager];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
  [(MKPlaceCardActionsViewController *)v3 setPlaceViewControllerDelegate:WeakRetained];

  return v3;
}

- (id)collectionViews
{
  p_placeViewControllerDelegate = &self->_placeViewControllerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_placeViewControllerDelegate);
    uint64_t v7 = [(_MKPlaceViewController *)self placeItem];
    uint64_t v8 = [v6 placeViewController:self collectionViewsForPlaceItem:v7];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v8;
}

- (void)collectionIdentifierSelected:(id)a3
{
  id v7 = a3;
  [(_MKPlaceViewController *)self infoCardAnalyticsDidSelectAction:0 eventValue:0 feedbackDelegateSelector:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
    [v6 placeViewController:self selectCollectionIdentifier:v7];
  }
}

- (BOOL)shouldDisplayBrowseCategoryVC
{
  return 0;
}

- (id)inlineMapVC
{
  if ((([(_MKPlaceViewController *)self options] & 2) != 0
     || ([(_MKPlaceViewController *)self options] & 1) == 0)
    && ([(_MKPlaceViewController *)self mapItem],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _displayMapRegion],
        int v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    char v5 = +[MKPlaceInlineMapViewControllerConfiguration configurationForPlaceViewControllerOptions:[(_MKPlaceViewController *)self options]];
    id v6 = [(_MKPlaceViewController *)self mapItem];
    id v7 = +[MKPlaceInlineMapViewController inlineMapWithMapItem:v6 configuration:v5];

    [v7 setBottomHairlineHidden:1];
    [v7 setDelegate:self];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)poisInlineMapVC
{
  uint64_t v3 = +[MKPlaceInlineMapViewControllerConfiguration configurationForPlaceViewControllerOptions:[(_MKPlaceViewController *)self options]];
  int v4 = [(_MKPlaceViewController *)self mapItem];
  char v5 = +[MKPlacePoisInlineMapViewController inlineMapWithMapItem:v4 configuration:v3];

  [v5 setDelegate:self];
  [v5 setLocation:self->_location];

  return v5;
}

- (id)photoVC
{
  uint64_t v3 = [(_MKPlaceViewController *)self mapItem];
  int v4 = [v3 place];
  char v5 = [v4 firstBusiness];
  uint64_t v6 = [v5 photosCount];

  if (v6)
  {
    id v7 = [[MKPlacePhotosViewController alloc] initWithMapItem:v3 mode:([(_MKPlaceViewController *)self options] >> 8) & 2 options:0];
    [(MKPlacePhotosViewController *)v7 setPhotosControllerDelegate:self];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)infosVC
{
  uint64_t v3 = [MKPlaceInfoViewController alloc];
  int v4 = [(_MKPlaceViewController *)self placeItem];
  char v5 = [(MKPlaceInfoViewController *)v3 initWithPlaceItem:v4];

  [(MKPlaceInfoViewController *)v5 setActionDelegate:self->_actionManager];
  [(MKPlaceInfoViewController *)v5 setPlacecardOptions:self->_options];

  return v5;
}

- (id)hoursVC
{
  uint64_t v3 = [(_MKPlaceViewController *)self mapItem];
  int v4 = [v3 timeZone];

  if (v4)
  {
    char v5 = [(_MKPlaceViewController *)self mapItem];
    uint64_t v6 = +[MKPlaceHoursViewController placeHoursWithMapItem:v5];

    [v6 setAnalyticsDelegate:self];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_viewControllerForClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = [(MKStackingViewController *)self viewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)attributionsVC
{
  uint64_t v3 = [(_MKPlaceViewController *)self mapItem];
  if (![v3 _needsAttribution])
  {
    uint64_t v8 = 0;
LABEL_6:

    goto LABEL_8;
  }
  uint64_t v4 = [(_MKPlaceViewController *)self mapItem];
  uint64_t v5 = [v4 _attribution];
  uint64_t v6 = [v5 attributionURLs];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    uint64_t v8 = objc_alloc_init(MKPlaceAttributionViewController);
    id v9 = [(_MKPlaceViewController *)self mapItem];
    [(MKPlaceAttributionViewController *)v8 setMapItem:v9];

    [(MKPlaceAttributionViewController *)v8 setAnalyticsDelegate:self];
    uint64_t v10 = [(_MKPlaceViewController *)self mapItem];
    long long v11 = [v10 _attribution];
    long long v12 = [v11 attributionURLs];
    uint64_t v13 = [v12 count];

    if (!v13) {
      goto LABEL_8;
    }
    long long v14 = [(_MKPlaceViewController *)self mapItem];
    v15 = [v14 _attribution];
    uint64_t v16 = [v15 attributionURLs];
    [(MKPlaceAttributionViewController *)v8 setUrlStrings:v16];

    uint64_t v3 = [(_MKPlaceViewController *)self mapItem];
    uint64_t v17 = [v3 _attribution];
    [(MKPlaceAttributionViewController *)v8 setAttribution:v17];

    goto LABEL_6;
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)annotatedItemListDisplayStyle
{
  uint64_t v3 = [(_MKPlaceViewController *)self mapItem];
  uint64_t v4 = [v3 _annotatedItemList];

  if (v4) {
    unint64_t v5 = displayStyleForAnnotatedItemList(v4, ([(_MKPlaceViewController *)self options] >> 23) & 1);
  }
  else {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)createMenuActions
{
  return [(MKPlaceActionManager *)self->_actionManager createMenuActions];
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
}

- (void)setPlaceViewControllerDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);

  unint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_placeViewControllerDelegate, obj);
    unint64_t v5 = obj;
    if (self->_placeItem)
    {
      [(_MKPlaceViewController *)self _updateViewControllers];
      unint64_t v5 = obj;
    }
  }
}

- (void)setMapItem:(id)a3 contact:(id)a4 updateOriginalContact:(BOOL)a5
{
  BOOL v5 = a5;
  if (a4)
  {
    +[_MKContactPlaceItem placeItemWithMapItem:a3 contact:a4 options:16 * (a3 == 0)];
  }
  else
  {
    id v8 = a3;
    +[_MKMapItemPlaceItem placeItemWithMapItem:options:](_MKMapItemPlaceItem, "placeItemWithMapItem:options:", v8, [v8 isCurrentLocation]);
  }
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(_MKPlaceViewController *)self setPlaceItem:v9 updateOriginalContact:v5];
}

- (void)setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4
{
  BOOL v5 = a4;
  obuint64_t j = a3;
  uint64_t v7 = [obj mapItem];
  p_placeItem = &self->_placeItem;
  id v9 = [(_MKPlaceItem *)self->_placeItem mapItem];
  if (v7 != v9) {
    goto LABEL_2;
  }
  v15 = [obj mapItem];
  uint64_t v16 = obj;
  if (!v15)
  {
    uint64_t v4 = [obj contact];
    long long v37 = [(_MKPlaceItem *)*p_placeItem contact];
    if (v4 != v37)
    {

      id v9 = v7;
LABEL_2:

      goto LABEL_3;
    }
    uint64_t v16 = obj;
  }
  char v17 = [v16 isIntermediateMapItem];
  char v18 = v17 ^ [(_MKPlaceItem *)*p_placeItem isIntermediateMapItem];
  if (v15)
  {
  }
  else
  {
  }
  if ((v18 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_3:
  uint64_t v10 = +[MKMapItemMetadataRequester sharedInstance];
  long long v11 = [(_MKPlaceItem *)*p_placeItem mapItem];
  [v10 cancelRequestsForMapItem:v11];

  if (v5)
  {
    long long v12 = [obj contact];
    [(_MKPlaceViewController *)self setOriginalContact:v12];
  }
  uint64_t v13 = [obj mapItem];
  if (v13)
  {
    long long v14 = (MKMapItem *)v13;
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v19 = [obj contact];

  if (v19)
  {
    v20 = [MKMapItem alloc];
    unsigned int v21 = [obj contact];
    long long v14 = [(MKMapItem *)v20 initWithContact:v21];

    v22 = [obj contact];
    uint64_t v23 = +[_MKContactPlaceItem placeItemWithMapItem:v14 contact:v22 options:16];

    obuint64_t j = (id)v23;
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v24 = [(_MKPlaceItem *)*p_placeItem mapItem];

  if (v24)
  {
    id v25 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v26 = [(_MKPlaceItem *)*p_placeItem mapItem];
    [v25 removeObserver:self name:@"MKMapItemDidResolveAttribution" object:v26];
  }
  headerSecondaryButtonController = self->_headerSecondaryButtonController;
  self->_headerSecondaryButtonController = 0;

  headerAlternatePrimaryButtonController = self->_headerAlternatePrimaryButtonController;
  self->_headerAlternatePrimaryButtonController = 0;

  contact = self->_contact;
  self->_contact = 0;

  objc_storeStrong((id *)&self->_placeItem, obj);
  [(MKPlaceItemActionDataProvider *)self->_actionDataProvider updateWithPlaceItem:*p_placeItem options:self->_options];
  [(_MKPlaceViewController *)self setPlaceInCollections:0];
  [(_MKPlaceViewController *)self setPlaceInShortcuts:0];
  BOOL v30 = [(_MKPlaceViewController *)self _shouldShowContactActions];
  self->_showContactActions = v30;
  [(MKPlaceActionManager *)self->_actionManager setShowContactActions:v30];
  v31 = [(_MKPlaceItem *)*p_placeItem mapItem];

  if (v31)
  {
    int v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v33 = [(_MKPlaceItem *)*p_placeItem mapItem];
    [v32 addObserver:self selector:sel__didResolveAttribution_ name:@"MKMapItemDidResolveAttribution" object:v33];
  }
  [(MKStackingViewController *)self scrollToTopAnimated:0];
  [(_MKPlaceViewController *)self _updateViewControllers];
  if (*p_placeItem)
  {
    if (!v5)
    {
      uint64_t v34 = [MEMORY[0x1E4F28B50] mainBundle];
      long long v35 = [v34 bundleIdentifier];
      int v36 = [v35 isEqualToString:*MEMORY[0x1E4F64320]];

      if (v36) {
        [(_MKPlaceViewController *)self infoCardAnalyticsDidSelectAction:21 eventValue:0 feedbackDelegateSelector:0];
      }
    }
  }
LABEL_25:
}

- (BOOL)inlineMapViewControllerDidSelectMap:(id)a3
{
  [(_MKPlaceViewController *)self infoCardAnalyticsDidSelectAction:6007 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
  uint64_t v4 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
    [v6 placeViewControllerDidSelectInlineMap:self];
  }
  return v5 & 1;
}

- (void)setPlaceItem:(id)a3
{
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)[(_MKPlaceItem *)self->_placeItem mapItem];
}

- (void)setMapItem:(id)a3
{
  id v4 = a3;
  char v5 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetMapItem", (const char *)&unk_18BD3917F, buf, 2u);
  }

  if (v4) {
    [v4 _placeCardContact];
  }
  else {
  uint64_t v6 = [(_MKPlaceItem *)self->_placeItem contact];
  }
  [(_MKPlaceViewController *)self setMapItem:v4 contact:v6 updateOriginalContact:0];

  uint64_t v7 = MKGetPlaceCardLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BAEC000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetMapItem", (const char *)&unk_18BD3917F, v8, 2u);
  }
}

- (void)setPlaceInBookmarks:(BOOL)a3
{
  self->_placeInBookmarks = a3;
  -[MKPlaceActionManager setPlaceInBookmarks:](self->_actionManager, "setPlaceInBookmarks:");
}

- (void)setPlaceInCollections:(BOOL)a3
{
  self->_placeInCollections = a3;
  -[MKPlaceActionManager setPlaceInCollections:](self->_actionManager, "setPlaceInCollections:");
}

- (void)setPlaceInShortcuts:(BOOL)a3
{
  self->_placeInShortcuts = a3;
  -[MKPlaceActionManager setPlaceInShortcuts:](self->_actionManager, "setPlaceInShortcuts:");
}

- (void)setAutomobileOptions:(id)a3
{
  char v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    [(MKETAProvider *)self->_etaProvider setAutomobileOptions:self->_automobileOptions];
    char v5 = v6;
  }
}

- (void)setWalkingOptions:(id)a3
{
  char v5 = (GEOWalkingOptions *)a3;
  if (self->_walkingOptions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_walkingOptions, a3);
    [(MKETAProvider *)self->_etaProvider setWalkingOptions:self->_walkingOptions];
    char v5 = v6;
  }
}

- (void)setTransitOptions:(id)a3
{
  char v5 = (GEOTransitOptions *)a3;
  if (self->_transitOptions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_transitOptions, a3);
    [(MKETAProvider *)self->_etaProvider setTransitOptions:self->_transitOptions];
    char v5 = v6;
  }
}

- (void)setCyclingOptions:(id)a3
{
  char v5 = (GEOCyclingOptions *)a3;
  if (self->_cyclingOptions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_cyclingOptions, a3);
    [(MKETAProvider *)self->_etaProvider setCyclingOptions:self->_cyclingOptions];
    char v5 = v6;
  }
}

- (_MKPlaceActionButtonController)headerSecondaryButtonController
{
  return self->_headerSecondaryButtonController;
}

- (void)setHeaderSecondaryButtonController:(id)a3
{
  char v5 = (_MKPlaceActionButtonController *)a3;
  if (self->_headerSecondaryButtonController != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_headerSecondaryButtonController, a3);
    [(MKPlaceHeaderButtonsViewController *)self->_buttonsHeaderController setSecondaryButtonController:self->_headerSecondaryButtonController];
    char v5 = v6;
  }
}

- (void)setHeaderAlternatePrimaryButtonController:(id)a3
{
  char v5 = (_MKPlaceActionButtonController *)a3;
  if (self->_headerAlternatePrimaryButtonController != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_headerAlternatePrimaryButtonController, a3);
    [(MKPlaceHeaderButtonsViewController *)self->_buttonsHeaderController setAlternatePrimaryButtonController:self->_headerAlternatePrimaryButtonController];
    char v5 = v6;
  }
}

- (void)setShowContactActions:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_MKPlaceViewController *)self showContactActions];
  if (self->_showContactActions != v3)
  {
    self->_showContactActions = v3;
    if (v5 != [(_MKPlaceViewController *)self showContactActions])
    {
      if (self->_placeItem)
      {
        [(MKPlaceActionManager *)self->_actionManager setShowContactActions:self->_showContactActions];
        placeActionViewController = self->_placeActionViewController;
        [(MKPlaceCardFooterActionsViewController *)placeActionViewController reloadData];
      }
    }
  }
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_unint64_t options = a3;
    [(MKPlaceItemActionDataProvider *)self->_actionDataProvider updateWithPlaceItem:self->_placeItem options:a3];
    if (self->_placeItem)
    {
      [(_MKPlaceViewController *)self _updateViewControllers];
    }
  }
}

- (id)additionalViewControllersAtPosition:(int64_t)a3
{
  id v4 = [(_MKPlaceViewController *)self _mapTableKeyForSectionPosition:a3];
  BOOL v5 = [(NSMapTable *)self->_additionalViewControllers objectForKey:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 array];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)_mapTableKeyForSectionPosition:(int64_t)a3
{
  return (id)[NSNumber numberWithInteger:a3];
}

- (int64_t)_sectionPositionForMapTableKey:(id)a3
{
  return [a3 integerValue];
}

- (void)addAdditionalViewController:(id)a3 atPosition:(int64_t)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_additionalViewControllers)
  {
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    additionalViewControllers = self->_additionalViewControllers;
    self->_additionalViewControllers = v7;
  }
  int64_t v26 = a4;
  id v9 = [(_MKPlaceViewController *)self _mapTableKeyForSectionPosition:a4];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v10 = [(NSMapTable *)self->_additionalViewControllers keyEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  char v27 = v9;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v16 = [(NSMapTable *)self->_additionalViewControllers objectForKey:v15];
        if ([v16 containsObject:v6])
        {
          if ([v15 isEqual:v9]) {
            goto LABEL_18;
          }
          char v17 = (void *)MEMORY[0x1E4F1CA00];
          char v18 = [NSString stringWithFormat:@"%@ has already been added to another section", v6];
          uint64_t v19 = [v17 exceptionWithName:@"Can't add same view controller to 2 sections" reason:v18 userInfo:0];

          id v9 = v27;
          [v19 raise];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v12);
  }

  [(NSMapTable *)self->_additionalViewControllers objectForKey:v9];
  unsigned int v21 = v20 = v9;

  if (!v21)
  {
    v22 = self->_additionalViewControllers;
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    [(NSMapTable *)v22 setObject:v23 forKey:v20];
  }
  uint64_t v10 = [(NSMapTable *)self->_additionalViewControllers objectForKey:v20];
  [v10 addObject:v6];
  uint64_t v24 = (void *)MEMORY[0x1E4F1CA48];
  id v25 = [(MKStackingViewController *)self viewControllers];
  uint64_t v16 = [v24 arrayWithArray:v25];

  if (!v26) {
    objc_msgSend(v16, "insertObject:atIndex:", v6, objc_msgSend(v10, "count") - 1);
  }
  [(MKStackingViewController *)self setViewControllers:v16];
  id v9 = v27;
LABEL_18:
}

- (void)removeAdditionalViewController:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v5 = [(NSMapTable *)self->_additionalViewControllers keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [(NSMapTable *)self->_additionalViewControllers objectForKey:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        if ([v10 containsObject:v4])
        {
          [v10 removeObject:v4];
          uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v12 = [(MKStackingViewController *)self viewControllers];
          uint64_t v13 = [v11 arrayWithArray:v12];

          [v13 removeObject:v4];
          [(MKStackingViewController *)self setViewControllers:v13];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (id)stackingViewController:(id)a3 scrollViewForViewController:(id)a4
{
  return (id)objc_msgSend(a4, "tableView", a3);
}

- (double)stackingViewController:(id)a3 minimumVisibleSurfacePercentForAnalyticsSelection:(id)a4
{
  return 0.75;
}

- (BOOL)stackingViewController:(id)a3 showsTitleForViewController:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)stackingViewController:(id)a3 heightForSeparatorBetweenUpperViewController:(id)a4 andLowerViewController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v8)
  {
    objc_opt_class();
    uint64_t v10 = &kStackingViewSeparatorHeightNone;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          uint64_t v10 = (uint64_t *)&kStackingViewSeparatorHeightLarge;
        }
      }
      else
      {
        uint64_t v10 = &kStackingViewSeparatorHeightSmall;
      }
    }
  }
  else
  {
    uint64_t v10 = &kStackingViewSeparatorHeightNone;
  }
  double v11 = *(double *)v10;

  return v11;
}

- (void)placeCardPhotosController:(id)a3 didSelectViewPhotoWithID:(id)a4 presentingViewController:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  id v8 = [(_MKPlaceViewController *)self mapItem];
  if ([v12 length])
  {
    id v9 = objc_msgSend(v8, "_mapkit_preferredFirstPhotoVendor");
    uint64_t v10 = [v9 urlsForPhotoWithIdentifier:v12];
    double v11 = [(_MKPlaceViewController *)self placeViewFeedbackAppLaunchHandler];
    [(_MKPlaceViewController *)self _launchAttributionURLs:v10 withAttribution:v9 mapItem:v8 completionHandler:v11];
  }
  else
  {
    [(_MKPlaceViewController *)self placeCardActionControllerDidSelectViewAllPhotos:0 presentingViewController:v7];
  }
}

- (void)placeActionManager:(id)a3 didSelectShareFromView:(id)a4
{
}

- (void)_presentViewControllerWithInterfaceStyleCheck:(id)a3
{
  id v8 = a3;
  id v4 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
    uint64_t v7 = [v6 overriddenInterfaceStyleForPlaceViewControllerSubviews:self];

    [v8 setOverrideUserInterfaceStyle:v7];
  }
  [(_MKPlaceViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)updateHeaderTitle
{
  headerViewController = self->_headerViewController;
  if (headerViewController) {
    [(MKPlaceCardHeaderViewController *)headerViewController updateHeaderTitle];
  }
}

- (id)_traits
{
  BOOL v3 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
    uint64_t v6 = [v5 traitsForPlaceViewController:self];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (double)placeCardHeaderViewControllerTrailingConstantForTitle:(id)a3
{
  char v4 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0.0;
  }
  uint64_t v6 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
  [v6 placeViewControllerPlaceCardHeaderTitleTrailingConstant:self];
  double v8 = v7;

  return v8;
}

- (void)placeHeaderButtonsViewController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withView:(id)a5
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  switch(a4)
  {
    case 1uLL:
    case 4uLL:
      uint64_t v10 = self;
      uint64_t v11 = 6003;
      uint64_t v12 = 12;
      goto LABEL_4;
    case 2uLL:
      uint64_t v10 = self;
      uint64_t v11 = 3001;
      uint64_t v12 = 0;
LABEL_4:
      [(_MKPlaceViewController *)v10 infoCardAnalyticsDidSelectAction:v11 eventValue:0 feedbackDelegateSelector:v12];
      uint64_t v13 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
      char v14 = objc_opt_respondsToSelector();

      if (v14)
      {
        long long v15 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
        long long v16 = [(MKETAProvider *)self->_etaProvider transportTypePreferenceNumber];
        [v15 placeViewController:self didSelectRouteToCurrentSearchResultWithTransportTypePreference:v16];
      }
      else
      {
        long long v17 = [(_MKPlaceViewController *)self mapItem];

        if (!v17) {
          goto LABEL_16;
        }
        if ((self->_options & 0x100000000) == 0)
        {
          long long v15 = +[MKMapItem mapItemForCurrentLocation];
          v33[0] = v15;
          char v18 = [(_MKPlaceViewController *)self mapItem];
          v33[1] = v18;
          uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
          long long v31 = @"MKLaunchOptionsDirectionsMode";
          int v32 = @"MKLaunchOptionsDirectionsModeDefault";
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          +[MKMapItem openMapsWithItems:v19 launchOptions:v20 completionHandler:&__block_literal_global_25];

          goto LABEL_15;
        }
        long long v15 = [(_MKPlaceViewController *)self mapItem];
        v34[0] = @"_MKLaunchOptionsSearchAlongRouteKey";
        v34[1] = @"MKLaunchOptionsSelectedIndex";
        v35[0] = MEMORY[0x1E4F1CC38];
        v35[1] = &unk_1ED97E220;
        long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __89___MKPlaceViewController_placeHeaderButtonsViewController_didSelectPrimaryType_withView___block_invoke;
        v30[3] = &unk_1E54B86F0;
        v30[4] = self;
        [v15 openInMapsWithLaunchOptions:v16 completionHandler:v30];
      }

LABEL_15:
LABEL_16:

      return;
    case 3uLL:
      unsigned int v21 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        id v23 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        int64_t v26 = __89___MKPlaceViewController_placeHeaderButtonsViewController_didSelectPrimaryType_withView___block_invoke_2;
        char v27 = &unk_1E54B8930;
        long long v28 = self;
        id v29 = v9;
        [v23 placeViewController:self didSelectShareCurrentLocationWithCompletion:&v24];
      }
      else
      {
        [(_MKPlaceViewController *)self _showShareSheet:v9];
      }
      -[_MKPlaceViewController infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:](self, "infoCardAnalyticsDidSelectAction:eventValue:feedbackDelegateSelector:", 57, 0, 6, v24, v25, v26, v27, v28);
      goto LABEL_16;
    default:
      goto LABEL_16;
  }
}

- (void)ETAProviderLocationUpdated:(id)a3
{
  id v4 = [a3 currentLocation];
  [(_MKPlaceViewController *)self setLocation:v4];
}

- (int)mapTypeForETAProvider:(id)a3
{
  id v4 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  uint64_t v6 = [(_MKPlaceViewController *)self placeViewControllerDelegate];
  int v7 = [v6 mapTypeForPlaceViewController:self];

  return v7;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (void)setContentAlpha:(double)a3
{
  self->_contentAlpha = a3;
  [(_MKPlaceViewController *)self updateContentAlpha];
}

- (void)updateContentAlpha
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(MKStackingViewController *)self viewControllers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setContentAlpha:self->_contentAlpha];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setContentVisibility:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(MKStackingViewController *)self viewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setContentVisibility:a3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (double)headerSecondaryNameLabelPadding
{
  [(MKPlaceCardHeaderViewController *)self->_headerViewController secondaryNameLabelPadding];
  return result;
}

- (void)placeCardActionControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(_MKPlaceViewController *)self mapItem];

  if (v6)
  {
    if ([(_MKPlaceViewController *)self _showReportAProblem])
    {
      uint64_t v7 = +[MKMapService sharedService];
      uint64_t v8 = [(_MKPlaceViewController *)self mapItem];
      [v7 captureUserAction:17105 onTarget:0 eventValue:0 mapItem:v8 timestamp:0xFFFFFFFFLL resultIndex:0.0];

      long long v9 = [(_MKPlaceViewController *)self mapItem];
      v14[0] = v9;
      long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      long long v12 = @"MKLaunchOptionsLaunchIntoRAP";
      uint64_t v13 = MEMORY[0x1E4F1CC38];
      long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      +[MKMapItem openMapsWithItems:v10 launchOptions:v11 completionHandler:0];
    }
  }
}

- (void)placeCardActionControllerDidSelectAddPhoto:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5
{
  id v9 = [(_MKPlaceViewController *)self mapItem];
  uint64_t v6 = objc_msgSend(v9, "_mapkit_preferredFirstPhotoVendor");
  uint64_t v7 = [v6 addPhotoURLs];
  uint64_t v8 = [(_MKPlaceViewController *)self placeViewFeedbackAppLaunchHandler];
  [(_MKPlaceViewController *)self _launchAttributionURLs:v7 withAttribution:v6 mapItem:v9 completionHandler:v8];
}

- (void)placeCardActionControllerDidSelectViewAllPhotos:(id)a3 presentingViewController:(id)a4
{
  id v8 = [(_MKPlaceViewController *)self mapItem];
  uint64_t v5 = objc_msgSend(v8, "_mapkit_preferredFirstPhotoVendor");
  uint64_t v6 = [v5 attributionURLs];
  uint64_t v7 = [(_MKPlaceViewController *)self placeViewFeedbackAppLaunchHandler];
  [(_MKPlaceViewController *)self _launchAttributionURLs:v6 withAttribution:v5 mapItem:v8 completionHandler:v7];
}

- (void)_launchAttributionURLs:(id)a3 withAttribution:(id)a4 mapItem:(id)a5 completionHandler:(id)a6
{
}

- (OS_dispatch_queue)analyticsQueue
{
  analyticsQueue = self->_analyticsQueue;
  if (!analyticsQueue)
  {
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, -1);
    uint64_t v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MapKit.PlaceViewController.Analytics", v4);
    uint64_t v6 = self->_analyticsQueue;
    self->_analyticsQueue = v5;

    analyticsQueue = self->_analyticsQueue;
  }

  return analyticsQueue;
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5
{
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 eventValue:(id)a4 feedbackDelegateSelector:(int)a5 actionRichProviderId:(id)a6
{
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 feedbackDelegateSelector:(int)a6 actionRichProviderId:(id)a7
{
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 feedbackDelegateSelector:(int)a8 actionRichProviderId:(id)a9
{
  LODWORD(v9) = a8;
  [(_MKPlaceViewController *)self infoCardAnalyticsDidSelectAction:*(void *)&a3 target:*(void *)&a4 eventValue:a5 actionURL:a6 photoID:a7 moduleMetadata:0 feedbackDelegateSelector:v9 actionRichProviderId:a9];
}

- (void)infoCardTransitAnalyticsDidSelectionAction:(int)a3 resultIndex:(int64_t)a4 targetID:(unint64_t)a5 transitSystem:(id)a6 transitDepartureSequence:(id)a7 transitCardCategory:(int)a8 transitIncident:(id)a9 feedbackDelegateSelector:(int)a10
{
  id v15 = a6;
  id v16 = a7;
  id v17 = a9;
  char v18 = [(_MKPlaceViewController *)self placeViewFeedbackDelegate];
  char v19 = objc_opt_respondsToSelector();

  if (a10 && (v19 & 1) != 0)
  {
    v20 = [(_MKPlaceViewController *)self placeViewFeedbackDelegate];
    [v20 placeViewController:self shouldLogFeedbackOfType:a10];
  }
  unsigned int v21 = [(_MKPlaceItem *)self->_placeItem mapItem];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  id v23 = [(_MKPlaceViewController *)self analyticsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __190___MKPlaceViewController_infoCardTransitAnalyticsDidSelectionAction_resultIndex_targetID_transitSystem_transitDepartureSequence_transitCardCategory_transitIncident_feedbackDelegateSelector___block_invoke;
  block[3] = &unk_1E54B98F0;
  CFAbsoluteTime v34 = Current;
  int64_t v35 = a4;
  unint64_t v36 = a5;
  int v37 = a3;
  int v38 = a8;
  id v30 = v21;
  id v31 = v15;
  id v32 = v16;
  id v33 = v17;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v21;
  dispatch_async(v23, block);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 actionURL:(id)a6 photoID:(id)a7 moduleMetadata:(id)a8 feedbackDelegateSelector:(int)a9 actionRichProviderId:(id)a10
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a10;
  id v17 = [(_MKPlaceViewController *)self placeViewFeedbackDelegate];
  char v18 = objc_opt_respondsToSelector();

  if (a9 && (v18 & 1) != 0)
  {
    char v19 = [(_MKPlaceViewController *)self placeViewFeedbackDelegate];
    [v19 placeViewController:self shouldLogFeedbackOfType:a9];
  }
  v20 = [(_MKPlaceViewController *)self generateAvailableActionForAnalytics];
  unsigned int v21 = [(_MKPlaceViewController *)self generateUnactionableUIElementsForAnalytics];
  char v22 = [(_MKPlaceItem *)self->_placeItem mapItem];
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  int v24 = [(_MKPlaceViewController *)self getPlaceCardTypeForAnalytics];
  id v25 = [(_MKPlaceViewController *)self analyticsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __156___MKPlaceViewController_infoCardAnalyticsDidSelectAction_target_eventValue_actionURL_photoID_moduleMetadata_feedbackDelegateSelector_actionRichProviderId___block_invoke;
  block[3] = &unk_1E54B9918;
  int v44 = a3;
  int v45 = a4;
  id v36 = v13;
  id v37 = v22;
  CFAbsoluteTime v43 = Current;
  id v38 = v14;
  id v39 = v15;
  int v46 = v24;
  id v40 = v20;
  id v41 = v21;
  id v42 = v16;
  id v26 = v16;
  id v27 = v21;
  id v28 = v20;
  id v29 = v15;
  id v30 = v14;
  id v31 = v22;
  id v32 = v13;
  dispatch_async(v25, block);
}

- (void)infoCardAnalyticsDidSelectAction:(int)a3 target:(int)a4 eventValue:(id)a5 moduleMetadata:(id)a6 feedbackDelegateSelector:(int)a7 actionRichProviderId:(id)a8
{
  LODWORD(v8) = a7;
  [(_MKPlaceViewController *)self infoCardAnalyticsDidSelectAction:*(void *)&a3 target:*(void *)&a4 eventValue:a5 actionURL:0 photoID:0 moduleMetadata:a6 feedbackDelegateSelector:v8 actionRichProviderId:a8];
}

- (int)getPlaceCardTypeForAnalytics
{
  BOOL v3 = [(_MKPlaceItem *)self->_placeItem mapItem];
  char v4 = [v3 _hasFlyover];

  if (v4) {
    return 9;
  }
  if ([(MKPlaceHeaderButtonsViewController *)self->_buttonsHeaderController primaryButtonType] == 2) {
    return 10;
  }
  uint64_t v6 = [(_MKPlaceItem *)self->_placeItem mapItem];
  char v7 = [v6 _hasTransit];

  if (v7) {
    return 7;
  }
  if ([(_MKPlaceItem *)self->_placeItem options]) {
    return 5;
  }
  if (([(_MKPlaceItem *)self->_placeItem options] & 2) != 0) {
    return 3;
  }
  uint64_t v8 = [(_MKPlaceItem *)self->_placeItem mapItem];
  char v9 = [v8 _isMapItemTypeBrand];

  if (v9) {
    return 11;
  }
  BOOL v10 = [(_MKPlaceViewController *)self shouldDisplayBrowseCategoryVC];
  long long v11 = [(_MKPlaceItem *)self->_placeItem mapItem];
  long long v12 = v11;
  if (v10)
  {
    int v5 = objc_msgSend(v11, "_browseCategory_placeCardType");
  }
  else if ([v11 _hasMUID])
  {
    int v5 = 2;
  }
  else
  {
    int v5 = 1;
  }

  return v5;
}

- (id)generateAvailableActionForAnalytics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(MKStackingViewController *)self viewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1ED9AF3A0])
        {
          BOOL v10 = [v9 infoCardChildPossibleActions];
          if ([v10 count]) {
            [v3 addObjectsFromArray:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)generateUnactionableUIElementsForAnalytics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(MKStackingViewController *)self viewControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1ED9AF3A0])
        {
          BOOL v10 = [v9 infoCardChildUnactionableUIElements];
          if ([v10 count]) {
            [v3 addObjectsFromArray:v10];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)placeCardWillCloseFromClientType:(unint64_t)a3
{
  if (a3 == 3) {
    unsigned int v3 = 701;
  }
  else {
    unsigned int v3 = 0;
  }
  if (a3 == 2) {
    uint64_t v4 = 702;
  }
  else {
    uint64_t v4 = v3;
  }
  [(_MKPlaceViewController *)self infoCardAnalyticsDidSelectAction:4 target:v4 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
}

- (int)currentUITargetForAnalytics
{
  return 201;
}

- (int)currentMapViewTargetForAnalytics
{
  return 501;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (BOOL)hasCheckedDistanceAvailability
{
  return self->_hasCheckedDistanceAvailability;
}

- (void)setHasCheckedDistanceAvailability:(BOOL)a3
{
  self->_hasCheckedDistanceAvailability = a3;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (CNContact)originalContact
{
  return self->_originalContact;
}

- (void)setOriginalContact:(id)a3
{
}

- (_MKPlaceViewControllerDelegate)placeViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);

  return (_MKPlaceViewControllerDelegate *)WeakRetained;
}

- (_MKPlaceViewControllerFeedbackDelegate)placeViewFeedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewFeedbackDelegate);

  return (_MKPlaceViewControllerFeedbackDelegate *)WeakRetained;
}

- (void)setPlaceViewFeedbackDelegate:(id)a3
{
}

- (id)placeViewFeedbackAppLaunchHandler
{
  return self->_placeViewFeedbackAppLaunchHandler;
}

- (void)setPlaceViewFeedbackAppLaunchHandler:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (double)headerHeight
{
  return self->headerHeight;
}

- (void)setHeaderHeight:(double)a3
{
  self->headerHeight = a3;
}

- (BOOL)placeInBookmarks
{
  return self->_placeInBookmarks;
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (BOOL)placeInCollections
{
  return self->_placeInCollections;
}

- (BOOL)placeInShortcuts
{
  return self->_placeInShortcuts;
}

- (BOOL)showContactActions
{
  return self->_showContactActions;
}

- (CNContactViewControllerPrivateDelegate)contactsNavigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contactsNavigationController);

  return (CNContactViewControllerPrivateDelegate *)WeakRetained;
}

- (void)setContactsNavigationController:(id)a3
{
}

- (_MKPlaceActionButtonController)headerAlternatePrimaryButtonController
{
  return self->_headerAlternatePrimaryButtonController;
}

- (NSMutableArray)viewDidAppearBlocks
{
  return self->_viewDidAppearBlocks;
}

- (void)setViewDidAppearBlocks:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_viewDidAppearBlocks, 0);
  objc_storeStrong((id *)&self->_headerAlternatePrimaryButtonController, 0);
  objc_storeStrong((id *)&self->_headerSecondaryButtonController, 0);
  objc_destroyWeak((id *)&self->_contactsNavigationController);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong(&self->_placeViewFeedbackAppLaunchHandler, 0);
  objc_destroyWeak((id *)&self->_placeViewFeedbackDelegate);
  objc_destroyWeak((id *)&self->_placeViewControllerDelegate);
  objc_storeStrong((id *)&self->_originalContact, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_additionalViewControllers, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_placeActionViewController, 0);
  objc_storeStrong((id *)&self->_poisInlineMapViewController, 0);
  objc_storeStrong((id *)&self->_inlineMapViewController, 0);
  objc_storeStrong((id *)&self->_infoViewController, 0);
  objc_storeStrong((id *)&self->_buttonsHeaderController, 0);
  objc_storeStrong((id *)&self->_headerViewController, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);

  objc_storeStrong((id *)&self->_actionDataProvider, 0);
}

@end