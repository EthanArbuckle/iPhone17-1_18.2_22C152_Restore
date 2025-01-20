@interface MUPlaceViewController
+ (double)headerHeightInMinimalMode;
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasSerializedMapItemFile;
- (BOOL)forceCaptureRevealEventOnNextBecomeActive;
- (BOOL)isActive;
- (BOOL)isLoading;
- (BOOL)placeInBookmarks;
- (BOOL)placeInCollections;
- (BOOL)placeInShortcuts;
- (BOOL)scrollEnabled;
- (BOOL)shouldBlurChromeHeaderButtons;
- (BOOL)shouldMoveLookAroundStorefrontViewForPlacePhotoSectionController:(id)a3;
- (BOOL)shouldStubPlacecard;
- (BOOL)showContactActions;
- (BOOL)supportsDynamicLayout;
- (BOOL)transitDeparturesSectionController:(id)a3 canSelectDepartureSequence:(id)a4 usingMapItem:(id)a5;
- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (CLLocation)location;
- (CNContact)originalContact;
- (GEOAutomobileOptions)automobileOptions;
- (GEOCyclingOptions)cyclingOptions;
- (GEOTransitOptions)transitOptions;
- (GEOWalkingOptions)walkingOptions;
- (MKLookAroundView)lookAroundView;
- (MKMapItem)mapItem;
- (MKMapItemIdentifier)mapItemIdentifierIntrumentedForReveal;
- (MUAMSResultProvider)amsResultProvider;
- (MUCuratedGuidesSectionController)curatedGuidesSectionController;
- (MUFeatureDiscoveryAnnotationView)offlineFeatureDiscoveryView;
- (MUImpressionsCalculator)impressionsCalculator;
- (MULibraryAccessProviding)libraryAccessProvider;
- (MUOfflineMapProvider)offlineMapProvider;
- (MUPersonalGuidesSectionController)personalGuidesSectionController;
- (MUPersonalizedSuggestionSectionArbiter)personalizedSuggestionSectionArbiter;
- (MUPlaceActionRowSectionController)actionRowSectionController;
- (MUPlaceCardAnalyticsController)analyticsController;
- (MUPlaceEnrichmentSectionController)placeEnrichmentSectionController;
- (MUPlaceHeaderButtonsSectionController)headerButtonsSectionController;
- (MUPlaceHeaderSectionController)headerSectionController;
- (MUPlaceInfoSectionController)placeInfoSectionController;
- (MUPlaceInlineMapSectionController)inlineMapSectionController;
- (MUPlacePhotoSectionController)photoSectionController;
- (MUPlaceUnifiedActionRowSectionController)unifiedActionRowSectionController;
- (MUPlaceViewController)initWithConfiguration:(id)a3;
- (MUPlaceViewController)initWithMapItem:(id)a3;
- (MUPlaceViewControllerConfiguration)configuration;
- (MUPlaceViewControllerDelegate)placeViewControllerDelegate;
- (MUPlaceViewControllerFeedbackDelegate)placeViewFeedbackDelegate;
- (MUPlaceViewControllerMapsAppDelegate)mapsAppDelegate;
- (MUWebBasedPlacecardSectionController)webPlacecardSectionController;
- (NSArray)analyticModules;
- (NSArray)revealedModules;
- (UIImage)userIcon;
- (UILayoutGuide)headerViewTitleLabelToTopLayoutGuide;
- (UIScrollView)scrollView;
- (UIScrollViewDelegate)scrollViewDelegate;
- (UIView)draggableHeaderView;
- (UIView)linkView;
- (UIView)viewForHeaderContainmentString;
- (_MKPlaceItem)placeItem;
- (double)contentAlpha;
- (double)currentHeight;
- (double)headerSecondaryNameLabelPadding;
- (double)heightForContentAboveTitle;
- (double)placeHeaderSectionControllerRequestsTrailingConstant:(id)a3;
- (double)verifiedHeaderExpansionProgress;
- (id)_actionRowSectionControllerClientOverrideWithAvailability:(id)a3 buttonModuleConfiguration:(id)a4;
- (id)_actionRowSectionControllerWithButtonModuleConfiguration:(id)a3;
- (id)_amenitiesSectionControllerForAvailability:(id)a3 moduleConfiguration:(id)a4;
- (id)_annotatedItemSectionControllerForAvailability:(id)a3;
- (id)_browseCategorySectionControllerForAvailability:(id)a3;
- (id)_buildBrandCardSectionsWithAvailability:(id)a3;
- (id)_buildDeveloperPlaceCardSectionsWithAvailability:(id)a3;
- (id)_buildForLayoutWithAvailability:(id)a3;
- (id)_buildShortCardSections;
- (id)_buildStaticSectionsWithAvailability:(id)a3;
- (id)_callToActionSuggestionSectionControllerForAvailability:(id)a3;
- (id)_contactForEditOperations;
- (id)_contactSharedLocationSectionControllerForAvailability:(id)a3;
- (id)_curatedGuidesSectionControllerForAvailability:(id)a3;
- (id)_encyclopedicSectionControllerForAvailability:(id)a3;
- (id)_evChargingSectionControllerForForAvailability:(id)a3 mapItem:(id)a4;
- (id)_firstSectionControllerOfClass:(Class)a3;
- (id)_headerButtonsSectionControllerForModuleConfiguration:(id)a3;
- (id)_headerSectionControllerWithAvailability:(id)a3;
- (id)_hikingTipSectionControllerForAvailability:(id)a3;
- (id)_hikingTrailsSectionControllerForAvailability:(id)a3;
- (id)_inlineMapSectionControllerForAvailability:(id)a3;
- (id)_notesSectionControllerForAvailability:(id)a3;
- (id)_officialAppSectionControllerForAvailability:(id)a3;
- (id)_passiveCallToActionSectionControllerForAvailability:(id)a3;
- (id)_personalGuidesSectionController;
- (id)_photoSectionControllerForAvailability:(id)a3;
- (id)_placeDescriptionSectionControllerForAvailability:(id)a3;
- (id)_placeEnrichmentSectionControllerForAvailability:(id)a3;
- (id)_placeFooterSectionController;
- (id)_placeInfoSectionControllerForAvailability:(id)a3 moduleConfiguration:(id)a4;
- (id)_placeRibbonSectionControllerForAvailability:(id)a3 placeRibbonConfiguration:(id)a4;
- (id)_ratingsAndReviewsSectionControllerForAvailability:(id)a3;
- (id)_relatedPlaceConfigurationForRelatedPlaceList:(id)a3 moduleConfiguration:(id)a4;
- (id)_relatedPlaceSectionControllerForAvailability:(id)a3 config:(id)a4;
- (id)_relatedPlaceSectionControllerForAvailability:(id)a3 relatedPlaceList:(id)a4;
- (id)_sectionControllersForClass:(Class)a3;
- (id)_traits;
- (id)_transitDeparturesSectionControllerForAvailability:(id)a3;
- (id)_unifiedActionRowSectionControllerWithButtonModuleConfiguration:(id)a3;
- (id)_venueInfoSectionControllerForAvailability:(id)a3;
- (id)_webBasedPlacecardViewController;
- (id)_webContentSectionControllerForConfiguration:(id)a3;
- (id)collectionViews;
- (id)contact;
- (id)contactStore;
- (id)contactsNavigationController;
- (id)createHeaderButtonsMenuWithPresentationOptions:(id)a3;
- (id)createHeaderButtonsMenuWithPromotedSystemActionTypes:(id)a3 excludedSystemActionTypes:(id)a4 presentationOptions:(id)a5;
- (id)createHeaderMenuSortOrderWithPromotedActionTypes:(id)a3 excludedActionTypes:(id)a4;
- (id)createMenuActions;
- (id)createShareSheetFooterActions;
- (id)draggableContent;
- (id)generateAvailableActionForAnalytics;
- (id)generateUnactionableUIElementsForAnalytics;
- (id)hikingTipViewForHikingTipSectionController:(id)a3 viewModel:(id)a4;
- (id)inlineRatingsSectionControllerRequestsContentViewController:(id)a3;
- (id)lookAroundContainerForPlacePhotoSectionController:(id)a3;
- (id)mapItemFromSerialized;
- (id)menuElementForActionItem:(id)a3;
- (id)notesSectionController;
- (id)placeViewFeedbackAppLaunchHandler;
- (id)ribbonSectionController;
- (id)shareSheetPresenterRequestsOverridenActivityViewController:(id)a3;
- (id)suggestionViewForCallToActionSectionController:(id)a3;
- (id)unifiedActionRowConfigurationWithButtonModuleConfiguration:(id)a3;
- (id)visibleImpressionElements;
- (id)webPlacecardGuides;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int)defaultTargetForPlaceCardAnalytics;
- (int)getPlaceCardTypeForAnalytics;
- (int)mapTypeForETAProvider:(id)a3;
- (unint64_t)options;
- (unint64_t)placeNumberOfReportsInReview;
- (void)ETAProviderLocationUpdated:(id)a3;
- (void)_activateSections;
- (void)_applyCustomSpacings;
- (void)_authorized_contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)_buildSections;
- (void)_calculateShowingContactActionsWithCompletion:(id)a3;
- (void)_captureRevealEventIfNeeded;
- (void)_commonInitWithConfiguration:(id)a3;
- (void)_deactivateSections;
- (void)_didResolveAttribution:(id)a3;
- (void)_dismissModalViewController;
- (void)_handleRoutingToPlaceWithMapItem:(id)a3;
- (void)_inlineRAPDidSelectAddMissingDataOfType:(int64_t)a3;
- (void)_invokeShareActionWithPresentationOptions:(id)a3 analyticsModuleMetadata:(id)a4;
- (void)_launchAttribution:(id)a3 withMapItem:(id)a4;
- (void)_launchAttributionURLs:(id)a3 withAttribution:(id)a4 mapItem:(id)a5 completionHandler:(id)a6;
- (void)_openWebURL:(id)a3 forcePunchout:(BOOL)a4;
- (void)_performWithNewUIBlock:(id)a3 oldUIBlock:(id)a4;
- (void)_placeSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5;
- (void)_presentAddNewContactPickerForContact:(id)a3 withEnvironment:(id)a4;
- (void)_presentModalViewController:(id)a3 withEnvironment:(id)a4;
- (void)_presentStoreProductScreenWithMapItem:(id)a3 attribution:(id)a4 bundleIdentifier:(id)a5 attributionURLs:(id)a6 presentingViewController:(id)a7;
- (void)_ratingsAndReviewsDidSelectViewReview:(id)a3;
- (void)_setMapItem:(id)a3 contact:(id)a4 updateOriginalContact:(BOOL)a5;
- (void)_setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4;
- (void)_setupViews;
- (void)_showEditSheet:(id)a3;
- (void)_showShareSheetNoDeviceLockCheckWithEnvironment:(id)a3;
- (void)_showShareSheetWithEnvironment:(id)a3;
- (void)_tearDownContactPickersForCompletionWithViewController:(id)a3;
- (void)_unauthorized_contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)_updateContentAlpha;
- (void)_updatePersonalizedSuggestionSectionArbiterWithSections;
- (void)_updatePreferredContentSize;
- (void)_updateSections;
- (void)_updateSectionsForActionRowInfoChange;
- (void)_updateSectionsForAttributionChange;
- (void)_updateSectionsForSubmissionStatusChange;
- (void)_updateWebPlacecardForPhotoSubmissionWithURL:(id)a3;
- (void)_updateWebPlacecardForSubmissionStatusChange:(id)a3;
- (void)addLoadingView;
- (void)becomeActive;
- (void)browseCategorySectionController:(id)a3 didTapOnSearchCategory:(id)a4;
- (void)collectionIdentifierSelected:(id)a3;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)contactSharedLocationSectionController:(id)a3 selectedDirectionsWithAddress:(id)a4 forContact:(id)a5 options:(id)a6;
- (void)contactStoreDidChange:(id)a3;
- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4;
- (void)contactViewController:(id)a3 didDeleteContact:(id)a4;
- (void)contentAboveTitleScrollPositionChanged:(double)a3;
- (void)dealloc;
- (void)didSelectAddMissingDataWithActionDispatcher:(id)a3 missingDataType:(int64_t)a4;
- (void)didSelectViewReviewWithActionDispatcher:(id)a3 review:(id)a4;
- (void)didTapHikingTip:(id)a3;
- (void)handleAppClip:(id)a3 options:(id)a4;
- (void)handleMapsExtension:(id)a3 usingAppStoreApp:(id)a4 options:(id)a5;
- (void)handleQuickLink:(id)a3 options:(id)a4;
- (void)handleWebLink:(id)a3 options:(id)a4;
- (void)hideContentIfLoading;
- (void)hideTitle:(BOOL)a3;
- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4;
- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5;
- (void)performShareActionWithPresentationOptions:(id)a3;
- (void)pictureItemSectionController:(id)a3 requestsSceneActivationWithPhotoGallery:(id)a4;
- (void)placeActionManager:(id)a3 didSelectAddOrEditNoteWithEnvironment:(id)a4 selectedAdd:(BOOL)a5;
- (void)placeActionManager:(id)a3 didSelectAddOrRemoveFromLibraryWithEnvironment:(id)a4 selectedAdd:(BOOL)a5;
- (void)placeActionManager:(id)a3 didSelectAddToContactsUsingEnvironment:(id)a4;
- (void)placeActionManager:(id)a3 didSelectAddToExistingContactWithEnvironment:(id)a4;
- (void)placeActionManager:(id)a3 didSelectAddToGuidesWithEnvironment:(id)a4;
- (void)placeActionManager:(id)a3 didSelectDirectionsWithEnvironment:(id)a4;
- (void)placeActionManager:(id)a3 didSelectShareWithEnvironment:(id)a4;
- (void)placeCardActionController:(id)a3 openURL:(id)a4 fromView:(id)a5;
- (void)placeCardActionControllerDidRequestCopy:(id)a3;
- (void)placeCardActionControllerDidSelectAddPhoto:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5;
- (void)placeCardActionControllerDidSelectAddToMapsHome:(id)a3;
- (void)placeCardActionControllerDidSelectChangeAddress:(id)a3;
- (void)placeCardActionControllerDidSelectCreateCustomRoute:(id)a3;
- (void)placeCardActionControllerDidSelectDownloadOffline:(id)a3 isQuickAction:(BOOL)a4;
- (void)placeCardActionControllerDidSelectOfflineManagement:(id)a3;
- (void)placeCardActionControllerDidSelectPauseOfflineDownload:(id)a3;
- (void)placeCardActionControllerDidSelectPlaceEnrichementReportAProblem;
- (void)placeCardActionControllerDidSelectRefineLocation:(id)a3;
- (void)placeCardActionControllerDidSelectRemoveFromMapsHome:(id)a3;
- (void)placeCardActionControllerDidSelectRemoveMarker:(id)a3;
- (void)placeCardActionControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5;
- (void)placeCardActionControllerDidSelectReportAProblemAddNewPlace:(id)a3 isQuickAction:(BOOL)a4;
- (void)placeCardActionControllerDidSelectReportAProblemViewReport:(id)a3;
- (void)placeCardActionControllerDidSelectSimulateLocation:(id)a3;
- (void)placeCardWillCloseFromClientType:(unint64_t)a3;
- (void)placeDescriptionSectionControllerDidTapAttribution:(id)a3;
- (void)placeHeaderSectionController:(id)a3 didSelectShareWithPresentationOptions:(id)a4;
- (void)placeHeaderSectionController:(id)a3 didTapMapItem:(id)a4;
- (void)placeInfoSectionController:(id)a3 didSelectAddMissingDataOfType:(int64_t)a4;
- (void)placeInfoSectionController:(id)a3 didSelectEditPlaceDetailsOfType:(int64_t)a4;
- (void)placeInfoSectionController:(id)a3 didTapAttribution:(id)a4;
- (void)placeInfoSectionController:(id)a3 selectedDirectionsWithAddress:(id)a4 forContact:(id)a5 options:(id)a6;
- (void)placeInfoSectionController:(id)a3 selectedDirectionsWithMapItem:(id)a4 options:(id)a5;
- (void)placeInfoSectionController:(id)a3 selectedViewPlaceWithMapItem:(id)a4 options:(id)a5;
- (void)placeNotesSectionController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 completion:(id)a5;
- (void)placePhotoSectionController:(id)a3 didSelectPhotoCategoryAtIndex:(unint64_t)a4;
- (void)placePhotoSectionController:(id)a3 didSelectPhotoToReport:(id)a4 withPhotoGalleryViewController:(id)a5;
- (void)placePhotoSectionController:(id)a3 didSelectViewPhoto:(id)a4 withID:(id)a5 presentingViewController:(id)a6;
- (void)placePhotoSectionController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5;
- (void)placePhotoSectionController:(id)a3 requestsAddPhotosToMapsWithEntryPoint:(int64_t)a4 options:(id)a5;
- (void)placePhotoSectionController:(id)a3 requestsSceneActivationForPhotoGalleryViewController:(id)a4;
- (void)placePhotoSectionController:(id)a3 requestsToOpenPhotoAttribution:(id)a4 presentationOptions:(id)a5;
- (void)placePhotoSectionControllerDidCloseFullscreenPhotos:(id)a3;
- (void)placePhotoSectionControllerDidOpenFullscreenPhotos:(id)a3;
- (void)placePhotoSectionControllerRequestsToOpenThumbnailGallery:(id)a3 withStartingIndex:(unint64_t)a4;
- (void)placeSectionControllerDidUpdateContent:(id)a3;
- (void)placeSectionControllerRequestsLayoutChange:(id)a3;
- (void)placeViewController:(id)a3 shouldLogFeedbackOfType:(int)a4;
- (void)presentAddPhotosWithPresentationOptions:(id)a3 entryPoint:(int64_t)a4 originTarget:(id)a5;
- (void)presentPOIEnrichmentWithPresentationOptions:(id)a3;
- (void)ratingsAndReviewsSectionController:(id)a3 didSelectPlaceCollection:(id)a4;
- (void)ratingsAndReviewsSectionController:(id)a3 didSelectViewReview:(id)a4;
- (void)ratingsAndReviewsSectionControllerDidSelectViewAllReviews:(id)a3;
- (void)relatedPlaceSectionController:(id)a3 itemSelected:(id)a4;
- (void)relatedPlaceSectionController:(id)a3 showSeeAllWithTitle:(id)a4 relatedMapItems:(id)a5 originalMapItem:(id)a6;
- (void)removeLoadingViewAnimated:(BOOL)a3;
- (void)requestHikingToolTipRegionIDForLocationCoordinate:(CLLocationCoordinate2D)a3;
- (void)requestHostToLogFeedbackTypeIfNeeded:(int)a3;
- (void)resetAnalyticsState;
- (void)resignActive;
- (void)ribbonSectionControllerDidTapAddRatings:(id)a3 initialRatingState:(int64_t)a4 withPresentationOptions:(id)a5;
- (void)ribbonSectionControllerDidTapHours:(id)a3;
- (void)routeToCuratedCollection:(id)a3;
- (void)routeToGuidesHomeFromExploreGuides:(id)a3;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)sectionController:(id)a3 didSelectPrimaryButtonType:(unint64_t)a4;
- (void)sectionControllerDidSelectViewContactButton:(id)a3;
- (void)setAutomobileOptions:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentVisibility:(int64_t)a3;
- (void)setCyclingOptions:(id)a3;
- (void)setForceCaptureRevealEventOnNextBecomeActive:(BOOL)a3;
- (void)setLibraryAccessProvider:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapItem:(id)a3 contact:(id)a4;
- (void)setMapItemIdentifierIntrumentedForReveal:(id)a3;
- (void)setMapsAppDelegate:(id)a3;
- (void)setOfflineFeatureDiscoveryView:(id)a3;
- (void)setOfflineMapProvider:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setOriginalContact:(id)a3;
- (void)setPersonalizedSuggestionSectionArbiter:(id)a3;
- (void)setPlaceInBookmarks:(BOOL)a3;
- (void)setPlaceInCollections:(BOOL)a3;
- (void)setPlaceInShortcuts:(BOOL)a3;
- (void)setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4;
- (void)setPlaceNumberOfReportsInReview:(unint64_t)a3;
- (void)setPlaceViewControllerDelegate:(id)a3;
- (void)setPlaceViewFeedbackAppLaunchHandler:(id)a3;
- (void)setPlaceViewFeedbackDelegate:(id)a3;
- (void)setScrollEnabled:(BOOL)a3;
- (void)setScrollViewDelegate:(id)a3;
- (void)setShowContactActions:(BOOL)a3;
- (void)setTransitOptions:(id)a3;
- (void)setVerifiedHeaderExpansionProgress:(double)a3;
- (void)setWalkingOptions:(id)a3;
- (void)shareSheetPresenter:(id)a3 preCompletedActivityOfType:(id)a4 completed:(BOOL)a5;
- (void)showAllCollections:(id)a3 usingTitle:(id)a4 usingCollectionIds:(id)a5;
- (void)showContentIfLoaded;
- (void)transitDeparturesSectionController:(id)a3 didSelectAttribution:(id)a4;
- (void)transitDeparturesSectionController:(id)a3 didSelectConnectionInformation:(id)a4;
- (void)transitDeparturesSectionController:(id)a3 didSelectDepartureSequence:(id)a4 usingMapItem:(id)a5;
- (void)transitDeparturesSectionController:(id)a3 didSelectTransitLine:(id)a4 usingPresentationOptions:(id)a5 completion:(id)a6;
- (void)transitDeparturesSectionController:(id)a3 showIncidents:(id)a4;
- (void)updateActionRowView;
- (void)updateAddNoteActionState;
- (void)updateAddToLibraryActionState;
- (void)updateCollectionViewsAnimated:(BOOL)a3;
- (void)updateCuratedCollectionsView;
- (void)updateHeaderTitle;
- (void)updateHeaderTrailingConstant;
- (void)updatePlaceEnrichment;
- (void)updatePlaceInfo;
- (void)updateSuggestionView;
- (void)updateUserSubmissionWithPhotoURL:(id)a3 photoID:(id)a4 numberOfPhotos:(int64_t)a5;
- (void)updateViewsWithSubmissionStatus:(id)a3 animated:(BOOL)a4;
- (void)updateWebPlacecardSuggestionViewWithViewModel:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MUPlaceViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldStubPlacecard
{
  v2 = [MEMORY[0x1E4F64860] sharedPlatform];
  if ([v2 isInternalInstall])
  {
    char BOOL = GEOConfigGetBOOL();

    if (BOOL) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (MUPlaceViewController)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MUPlaceViewController;
  v5 = [(MUPlaceViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(MUPlaceViewController *)v5 _commonInitWithConfiguration:v4];
  }

  return v6;
}

- (MUPlaceViewController)initWithMapItem:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MUPlaceViewController;
  v5 = [(MUPlaceViewController *)&v19 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = objc_opt_new();
    [(MUPlaceViewController *)v5 _commonInitWithConfiguration:v6];

    if (GEOConfigGetBOOL())
    {
      v7 = NSTemporaryDirectory();
      objc_super v8 = [v7 stringByAppendingPathComponent:@"SavedMapItem.json"];

      v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      if ([v9 fileExistsAtPath:v8])
      {
        id v18 = 0;
        v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8 options:4 error:&v18];
        id v11 = v18;
        id v17 = v11;
        v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:&v17];
        id v13 = v17;

        v14 = (void *)[objc_alloc(MEMORY[0x1E4F646E0]) initWithJSON:v12];
        v15 = (void *)[objc_alloc(MEMORY[0x1E4F30F08]) initWithGeoMapItem:v14 isPlaceHolderPlace:0];
        [(MUPlaceViewController *)v5 setMapItem:v15];
      }
      else
      {
        [(MUPlaceViewController *)v5 setMapItem:v4];
      }
    }
    else
    {
      [(MUPlaceViewController *)v5 setMapItem:v4];
    }
  }

  return v5;
}

- (NSArray)analyticModules
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_sectionControllers, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_sectionControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "analyticsModule", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];
  return (NSArray *)v10;
}

- (NSArray)revealedModules
{
  return (NSArray *)MUMap(self->_sectionControllers, &__block_literal_global_7);
}

id __40__MUPlaceViewController_revealedModules__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isImpressionable])
  {
    v3 = [v2 revealedAnalyticsModule];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)requestHostToLogFeedbackTypeIfNeeded:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(MUPlaceViewController *)self placeViewFeedbackDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MUPlaceViewController *)self placeViewFeedbackDelegate];
    [v7 placeViewController:self shouldLogFeedbackOfType:v3];
  }
}

- (void)_commonInitWithConfiguration:(id)a3
{
  id v5 = a3;
  char v6 = MUGetPlaceCardLog();
  self->_os_signpost_id_t initialAppearanceSignpostID = os_signpost_id_generate(v6);

  id v7 = MUGetPlaceCardLog();
  objc_super v8 = v7;
  os_signpost_id_t initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
  if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, initialAppearanceSignpostID, "PlacecardInitialAppearance", "", (uint8_t *)buf, 2u);
  }

  objc_storeStrong((id *)&self->_configuration, a3);
  self->_options = [v5 options];
  v10 = [(MUPlaceViewControllerConfiguration *)self->_configuration effectiveBundleIdentifier];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    long long v12 = [(MUPlaceViewControllerConfiguration *)self->_configuration effectiveBundleIdentifier];
    long long v13 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
    [v13 setEffectiveBundleIdentifier:v12];
  }
  self->_myPlacesEnabled = MapsFeature_IsEnabled_MyPlacesFeatures();
  self->_showNewUI = 1;
  long long v14 = [[MUPlaceCardAnalyticsController alloc] initWithAnalyticsProvider:self];
  analyticsController = self->_analyticsController;
  self->_analyticsController = v14;

  v16 = objc_alloc_init(MUPlaceItemActionDataProvider);
  actionDataProvider = self->_actionDataProvider;
  self->_actionDataProvider = v16;

  id v18 = (MUPlaceActionManager *)[objc_alloc(MEMORY[0x1E4F310C8]) initWithDataProvider:self->_actionDataProvider];
  actionManager = self->_actionManager;
  self->_actionManager = v18;

  [(MUPlaceActionManager *)self->_actionManager setPlaceCardDelegate:self];
  [(MUPlaceActionManager *)self->_actionManager setAnalyticsDelegate:self->_analyticsController];
  if (GEOConfigGetBOOL())
  {
    v20 = objc_alloc_init(MUPersonalizedSuggestionSectionArbiter);
    personalizedSuggestionSectionArbiter = self->_personalizedSuggestionSectionArbiter;
    self->_personalizedSuggestionSectionArbiter = v20;
  }
  objc_initWeak(buf, self);
  v22 = [MULockScreenCoordinator alloc];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __54__MUPlaceViewController__commonInitWithConfiguration___block_invoke;
  v27[3] = &unk_1E574EF80;
  objc_copyWeak(&v28, buf);
  v23 = [(MULockScreenCoordinator *)v22 initWithPasscodeProvider:v27];
  lockScreenCoordinator = self->_lockScreenCoordinator;
  self->_lockScreenCoordinator = v23;

  v25 = [[_TtC6MapsUI23MUPlaceActionDispatcher alloc] initWithActionManager:self->_actionManager];
  actionDispatcher = self->_actionDispatcher;
  self->_actionDispatcher = v25;

  [(MUPlaceActionDispatcher *)self->_actionDispatcher setDelegate:self];
  if ((GEOConfigGetBOOL() & 1) != 0
    || +[MapsUIUtilities isParsecProcess])
  {
    +[MUInfoCardStyle setInfoCardContainerStyle:1];
  }
  +[MUInfoCardStyle setIsDeveloperPlaceCard:(self->_options >> 39) & 1];
  [(MUPlaceViewController *)self _setupViews];
  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);
}

void __54__MUPlaceViewController__commonInitWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  objc_super v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained placeViewControllerDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [v4 placeViewControllerDelegate];
      [v7 placeViewController:v4 requestPasscodeUnlockWithCompletion:v8];
    }
    else
    {
      v8[2](v8, 0);
    }
  }
}

- (void)_setupViews
{
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__MUPlaceViewController__setupViews__block_invoke;
  v4[3] = &unk_1E574EFD0;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__MUPlaceViewController__setupViews__block_invoke_3;
  v3[3] = &unk_1E574EFD0;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v4 oldUIBlock:v3];
  [(MUPlaceViewController *)self setScrollEnabled:1];
}

void __36__MUPlaceViewController__setupViews__block_invoke(uint64_t a1)
{
  v43[4] = *MEMORY[0x1E4F143B8];
  id v2 = [MUScrollableStackView alloc];
  uint64_t v3 = -[MUScrollableStackView initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 992);
  *(void *)(v4 + 992) = v3;

  [*(id *)(*(void *)(a1 + 32) + 992) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(*(void *)(a1 + 32) + 992) setAxis:1];
  BOOL v6 = (*(void *)(*(void *)(a1 + 32) + 1328) & 0x8000000000) == 0;
  id v7 = [MEMORY[0x1E4F31038] sharedInstance];
  int v8 = [v7 userInterfaceIdiom];

  int v9 = v8 == 3 || v6;
  double v10 = 12.0;
  if (v9) {
    double v10 = 16.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 992) setSpacing:v10];
  if (GEOConfigGetBOOL()
    && (MapKitIdiomIsMacCatalyst() & 1) == 0
    && +[MapsUIUtilities isMapsProcess])
  {
    uint64_t v11 = objc_alloc_init(MUPlaceCardImpressionsLogger);
    objc_initWeak(&location, *(id *)(a1 + 32));
    long long v12 = [MUImpressionsCalculatorConfiguration alloc];
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 992);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __36__MUPlaceViewController__setupViews__block_invoke_2;
    v40[3] = &unk_1E574EFA8;
    objc_copyWeak(&v41, &location);
    long long v14 = [(MUImpressionsCalculatorConfiguration *)v12 initWithLogger:v11 contentScrollView:v13 containerViewProvider:v40];
    long long v15 = [[MUScrollViewImpressionsCalculator alloc] initWithConfiguration:v14 visibleItemsProvider:*(void *)(a1 + 32)];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 1232);
    *(void *)(v16 + 1232) = v15;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  if (+[MUInfoCardStyle containerStyle] == 1) {
    double v18 = 0.0;
  }
  else {
    double v18 = 16.0;
  }
  uint64_t v20 = *(void *)(a1 + 32);
  objc_super v19 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(v20 + 992), "setContentEdgeInsets:", 0.0, 0.0, v18, 0.0);
  objc_msgSend(*((id *)*v19 + 124), "setDelegate:");
  [*((id *)*v19 + 124) setAlwaysBounceVertical:1];
  v21 = [*v19 view];
  [v21 addSubview:*((void *)*v19 + 124)];

  v32 = (void *)MEMORY[0x1E4F28DC8];
  v38 = [*((id *)*v19 + 124) leadingAnchor];
  v39 = [*v19 view];
  v37 = [v39 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v43[0] = v36;
  v34 = [*((id *)*v19 + 124) trailingAnchor];
  v35 = [*v19 view];
  v33 = [v35 trailingAnchor];
  v22 = [v34 constraintEqualToAnchor:v33];
  v43[1] = v22;
  v23 = [*((id *)*v19 + 124) topAnchor];
  v24 = [*v19 view];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v43[2] = v26;
  v27 = [*((id *)*v19 + 124) bottomAnchor];
  id v28 = [*v19 view];
  v29 = [v28 bottomAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  v43[3] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
  [v32 activateConstraints:v31];
}

id __36__MUPlaceViewController__setupViews__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained view];
    uint64_t v4 = [v3 superview];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

void __36__MUPlaceViewController__setupViews__block_invoke_3(uint64_t a1)
{
  v37[4] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F31108]);
  uint64_t v3 = [*(id *)(a1 + 32) mapItem];
  uint64_t v4 = [v2 initWithMapItem:v3 options:*(void *)(*(void *)(a1 + 32) + 1328)];
  uint64_t v5 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(v5 + 984);
  *(void *)(v5 + 984) = v4;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "setPlaceViewFeedbackDelegate:");
  id v7 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  int v8 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  objc_msgSend(v8, "_mapsui_setBackgroundColor:", 0);

  [*(id *)(a1 + 32) addChildViewController:*(void *)(*(void *)(a1 + 32) + 984)];
  int v9 = [*(id *)(a1 + 32) view];
  double v10 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  [v9 addSubview:v10];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 984), "didMoveToParentViewController:");
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 1440) headerViewController];

  if (v11)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 984);
    long long v14 = [*(id *)(v12 + 1440) headerViewController];
    [v13 addAdditionalViewController:v14 atPosition:0];
  }
  id v28 = (void *)MEMORY[0x1E4F28DC8];
  v36 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  v34 = [v36 leadingAnchor];
  v35 = [*(id *)(a1 + 32) view];
  v33 = [v35 leadingAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v37[0] = v32;
  v31 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  v29 = [v31 trailingAnchor];
  v30 = [*(id *)(a1 + 32) view];
  v27 = [v30 trailingAnchor];
  v26 = [v29 constraintEqualToAnchor:v27];
  v37[1] = v26;
  v25 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  long long v15 = [v25 topAnchor];
  uint64_t v16 = [*(id *)(a1 + 32) view];
  uint64_t v17 = [v16 topAnchor];
  double v18 = [v15 constraintEqualToAnchor:v17];
  v37[2] = v18;
  objc_super v19 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  uint64_t v20 = [v19 bottomAnchor];
  v21 = [*(id *)(a1 + 32) view];
  v22 = [v21 bottomAnchor];
  v23 = [v20 constraintEqualToAnchor:v22];
  v37[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v28 activateConstraints:v24];
}

- (void)updateHeaderTrailingConstant
{
  id v2 = [(MUPlaceViewController *)self headerSectionController];
  [v2 reloadTrailingConstraint];
}

- (void)setScrollEnabled:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MUPlaceViewController_setScrollEnabled___block_invoke;
  v5[3] = &unk_1E574EFF8;
  v5[4] = self;
  BOOL v6 = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__MUPlaceViewController_setScrollEnabled___block_invoke_2;
  v3[3] = &unk_1E574EFF8;
  v3[4] = self;
  BOOL v4 = a3;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v5 oldUIBlock:v3];
}

uint64_t __42__MUPlaceViewController_setScrollEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setScrollEnabled:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __42__MUPlaceViewController_setScrollEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setScrollEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)scrollEnabled
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  void v4[5] = &v6;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MUPlaceViewController_scrollEnabled__block_invoke;
  v5[3] = &unk_1E574F020;
  v5[4] = self;
  void v5[5] = &v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MUPlaceViewController_scrollEnabled__block_invoke_2;
  v4[3] = &unk_1E574F020;
  v4[4] = self;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v5 oldUIBlock:v4];
  char v2 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __38__MUPlaceViewController_scrollEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 992) isScrollEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __38__MUPlaceViewController_scrollEnabled__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 984) isScrollEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceViewController;
  [(MUPlaceViewController *)&v6 viewWillAppear:a3];
  if ((self->_options & 0x10) != 0)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__showEditSheet_];
    uint64_t v5 = [(MUPlaceViewController *)self navigationItem];
    [v5 setRightBarButtonItem:v4];
  }
  [(MUPlaceViewController *)self _activateSections];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MUPlaceViewController;
  [(MUPlaceViewController *)&v11 viewDidAppear:a3];
  if (+[MapsUIUtilities isSiriProcess])
  {
    BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v5 = [MEMORY[0x1E4F30EF8] sharedLocationManager];
    [v5 setEffectiveBundle:v4];
  }
  [(MUPlaceViewController *)self becomeActive];
  if (self->_initialAppearanceSignpostID != -1)
  {
    objc_super v6 = MUGetPlaceCardLog();
    id v7 = v6;
    os_signpost_id_t initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
    if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)double v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v7, OS_SIGNPOST_INTERVAL_END, initialAppearanceSignpostID, "PlacecardInitialAppearance", "", v10, 2u);
    }

    self->_os_signpost_id_t initialAppearanceSignpostID = -1;
  }
  char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:*MEMORY[0x1E4F30DD0] object:self];
}

- (BOOL)shouldMoveLookAroundStorefrontViewForPlacePhotoSectionController:(id)a3
{
  BOOL v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    objc_super v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 shouldMoveLookAroundStorefrontViewForPlaceViewController:self];
  }
  return 0;
}

- (void)setContentVisibility:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceViewController;
  -[MUPlaceViewController setContentVisibility:](&v6, sel_setContentVisibility_);
  char v5 = [(MUPlaceViewController *)self photoSectionController];
  [v5 updateWithContentVisibility:a3];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MUPlaceViewController;
  [(MUPlaceViewController *)&v7 viewDidLoad];
  uint64_t v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  [(MUPlaceViewController *)self setAccessibilityIdentifier:v4];

  if ((self->_options & 0x8000000000) != 0) {
    objc_msgSend(MEMORY[0x1E4FB1618], "_mapsui_colorNamed:", @"DeveloperPlaceCardFullBackgroundColor");
  }
  else {
  char v5 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  objc_super v6 = [(MUPlaceViewController *)self view];
  [v6 setBackgroundColor:v5];

  self->_contentAlpha = 1.0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MUPlaceViewController;
  [(MUPlaceViewController *)&v10 viewWillDisappear:a3];
  if (([(MUPlaceViewController *)self isMovingFromParentViewController] & 1) != 0
    || ([MEMORY[0x1E4F31038] sharedInstance],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 userInterfaceIdiom],
        v4,
        v5))
  {
    objc_super v6 = [(MUPlaceViewController *)self placeViewControllerDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      uint64_t v8 = [(MUPlaceViewController *)self placeViewControllerDelegate];
      [v8 placeViewControllerDidDismiss:self];
    }
  }
  char v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 removeObserver:self name:*MEMORY[0x1E4FB2730] object:0];
  [v9 removeObserver:self name:*MEMORY[0x1E4FB2640] object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MUPlaceViewController;
  [(MUPlaceViewController *)&v4 viewDidDisappear:a3];
  [(MUPlaceViewController *)self resignActive];
}

- (void)becomeActive
{
  if (!self->_active)
  {
    self->_active = 1;
    [(MKETAProvider *)self->_etaProvider restart];
    if ([(MUPlaceViewController *)self forceCaptureRevealEventOnNextBecomeActive]|| !+[MapsUIUtilities isMapsProcess])
    {
      [(MUPlaceViewController *)self setForceCaptureRevealEventOnNextBecomeActive:0];
      [(MUPlaceViewController *)self _captureRevealEventIfNeeded];
    }
    [(MUImpressionsCalculator *)self->_impressionsCalculator setActive:self->_active];
    if (self->_needsImpressionsLoggedOnAppearance)
    {
      self->_needsImpressionsLoggedOnAppearance = 0;
      impressionsCalculator = self->_impressionsCalculator;
      [(MUScrollViewImpressionsCalculator *)impressionsCalculator logImpressions];
    }
  }
}

- (void)resignActive
{
  if (self->_active)
  {
    self->_active = 0;
    self->_needsImpressionsLoggedOnAppearance = 1;
    [(MKETAProvider *)self->_etaProvider pause];
    [(MUEVChargerAvailabilityProvider *)self->_evChargerAvailabilityProvider setIsActive:0];
    [(MUImpressionsCalculator *)self->_impressionsCalculator setActive:self->_active];
    analyticsController = self->_analyticsController;
    [(MUPlaceCardAnalyticsController *)analyticsController instrumentConceal];
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)resetAnalyticsState
{
  [(MUPlaceViewController *)self setMapItemIdentifierIntrumentedForReveal:0];
  analyticsController = self->_analyticsController;
  [(MUPlaceCardAnalyticsController *)analyticsController disableDeferLoggingUntilRefinementWithShouldInvokeReveal:0];
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)MUPlaceViewController;
  [(MUPlaceViewController *)&v2 viewWillLayoutSubviews];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)MUPlaceViewController;
  [(MUPlaceViewController *)&v6 viewDidLayoutSubviews];
  [(MULoadingOverlayController *)self->_loadingOverlayController updateLayoutForBoundsChange];
  uint64_t v3 = [(MUPlaceViewController *)self placeViewControllerDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    int v5 = [(MUPlaceViewController *)self placeViewControllerDelegate];
    [v5 placeViewControllerDidUpdateHeight:self];
  }
  [(MUPlaceViewController *)self showContentIfLoaded];
}

- (id)_firstSectionControllerOfClass:(Class)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = self->_sectionControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
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

- (id)_sectionControllersForClass:(Class)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = self->_sectionControllers;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v10, (void)v13);
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  long long v11 = (void *)[v4 copy];
  return v11;
}

- (MUPlaceHeaderButtonsSectionController)headerButtonsSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPlaceHeaderButtonsSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUPersonalGuidesSectionController)personalGuidesSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPersonalGuidesSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUCuratedGuidesSectionController)curatedGuidesSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUCuratedGuidesSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUPlaceActionRowSectionController)actionRowSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPlaceActionRowSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUPlaceUnifiedActionRowSectionController)unifiedActionRowSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPlaceUnifiedActionRowSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUPlaceHeaderSectionController)headerSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPlaceHeaderSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUPlacePhotoSectionController)photoSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPlacePhotoSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUPlaceInfoSectionController)placeInfoSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPlaceInfoSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUPlaceEnrichmentSectionController)placeEnrichmentSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPlaceEnrichmentSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (id)ribbonSectionController
{
  uint64_t v3 = objc_opt_class();
  return [(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (id)notesSectionController
{
  uint64_t v3 = objc_opt_class();
  return [(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUWebBasedPlacecardSectionController)webPlacecardSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUWebBasedPlacecardSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (MUPlaceInlineMapSectionController)inlineMapSectionController
{
  uint64_t v3 = objc_opt_class();
  return (MUPlaceInlineMapSectionController *)[(MUPlaceViewController *)self _firstSectionControllerOfClass:v3];
}

- (void)setMapItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SetMapItem", "", buf, 2u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __36__MUPlaceViewController_setMapItem___block_invoke;
  v10[3] = &unk_1E574EE08;
  id v11 = v4;
  long long v12 = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__MUPlaceViewController_setMapItem___block_invoke_2;
  v8[3] = &unk_1E574EE08;
  v8[4] = self;
  id v9 = v11;
  id v6 = v11;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v10 oldUIBlock:v8];
  uint64_t v7 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SetMapItem", "", buf, 2u);
  }
}

void __36__MUPlaceViewController_setMapItem___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 _placeCardContact];
  }
  else {
  id v3 = [*(id *)(*(void *)(a1 + 40) + 1008) contact];
  }
  [*(id *)(a1 + 40) _setMapItem:*(void *)(a1 + 32) contact:v3 updateOriginalContact:0];
}

uint64_t __36__MUPlaceViewController_setMapItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setMapItem:*(void *)(a1 + 40)];
}

- (MKMapItem)mapItem
{
  return (MKMapItem *)[(_MKPlaceItem *)self->_placeItem mapItem];
}

- (id)contact
{
  contact = self->_contact;
  if (!contact)
  {
    id v4 = [(_MKPlaceItem *)self->_placeItem contact];
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = v4;
      uint64_t v7 = self->_contact;
      self->_contact = v6;
    }
    else
    {
      uint64_t v7 = [(_MKPlaceItem *)self->_placeItem mapItem];
      uint64_t v8 = [v7 _placeCardContact];
      id v9 = self->_contact;
      self->_contact = v8;
    }
    contact = self->_contact;
  }
  return contact;
}

- (_MKPlaceItem)placeItem
{
  return self->_placeItem;
}

- (BOOL)_hasSerializedMapItemFile
{
  objc_super v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"SavedMapItem.json"];

  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

- (id)mapItemFromSerialized
{
  objc_super v2 = NSTemporaryDirectory();
  id v3 = [v2 stringByAppendingPathComponent:@"SavedMapItem.json"];

  id v12 = 0;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:4 error:&v12];
  id v5 = v12;
  id v11 = v5;
  id v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
  id v7 = v11;

  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F646E0]) initWithJSON:v6];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F30F08]) initWithGeoMapItem:v8 isPlaceHolderPlace:0];

  return v9;
}

- (void)_setMapItem:(id)a3 contact:(id)a4 updateOriginalContact:(BOOL)a5
{
  if (a4)
  {
    [MEMORY[0x1E4F310D8] placeItemWithMapItem:a3 contact:a4 options:16 * (a3 == 0)];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F310F8];
    id v9 = a3;
    objc_msgSend(v8, "placeItemWithMapItem:options:", v9, objc_msgSend(v9, "isCurrentLocation"));
  uint64_t v10 = };

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__MUPlaceViewController__setMapItem_contact_updateOriginalContact___block_invoke;
  v15[3] = &unk_1E574F048;
  v15[4] = self;
  id v16 = v10;
  BOOL v17 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__MUPlaceViewController__setMapItem_contact_updateOriginalContact___block_invoke_2;
  v12[3] = &unk_1E574F048;
  v12[4] = self;
  id v13 = v16;
  BOOL v14 = a5;
  id v11 = v16;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v15 oldUIBlock:v12];
}

uint64_t __67__MUPlaceViewController__setMapItem_contact_updateOriginalContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPlaceItem:*(void *)(a1 + 40) updateOriginalContact:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __67__MUPlaceViewController__setMapItem_contact_updateOriginalContact___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setPlaceItem:*(void *)(a1 + 40) updateOriginalContact:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4
{
  BOOL v5 = a4;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [v7 mapItem];
  id v9 = [(_MKPlaceItem *)self->_placeItem mapItem];
  if (v8 != v9) {
    goto LABEL_2;
  }
  v58 = [v7 mapItem];
  if (!v58)
  {
    id v4 = [v7 contact];
    v74 = [(_MKPlaceItem *)self->_placeItem contact];
    if (v4 != v74)
    {

      id v9 = v8;
LABEL_2:

      goto LABEL_3;
    }
  }
  char v59 = [v7 isIntermediateMapItem];
  char v60 = v59 ^ [(_MKPlaceItem *)self->_placeItem isIntermediateMapItem];
  if (v58)
  {
  }
  else
  {
  }
  if ((v60 & 1) == 0)
  {
    int v68 = 0;
    goto LABEL_42;
  }
LABEL_3:
  uint64_t v10 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v11 = [v7 mapItem];
    id v12 = [v7 contact];
    *(_DWORD *)buf = 138412802;
    v78 = v11;
    __int16 v79 = 2112;
    v80 = v12;
    __int16 v81 = 1024;
    int v82 = [v7 isIntermediateMapItem];
    _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "Setting placeItem with mapItem %@, contact %@, isIntermediateMapItem %d", buf, 0x1Cu);
  }
  if (v5)
  {
    id v13 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = [v7 contact];
      *(_DWORD *)buf = 138412290;
      v78 = v14;
      _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_DEBUG, "Updating original contact with contact %@", buf, 0xCu);
    }
    long long v15 = [v7 contact];
    [(MUPlaceViewController *)self setOriginalContact:v15];
  }
  id v16 = [v7 mapItem];
  if (v16) {
    goto LABEL_12;
  }
  BOOL v17 = [v7 contact];
  BOOL v18 = v17 == 0;

  if (!v18)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F30F08]);
    uint64_t v20 = [v7 contact];
    id v16 = (void *)[v19 initWithContact:v20];

    v21 = (void *)MEMORY[0x1E4F310D8];
    v22 = [v7 contact];
    uint64_t v23 = [v21 placeItemWithMapItem:v16 contact:v22 options:16];

    id v7 = (id)v23;
LABEL_12:
  }
  v24 = [(_MKPlaceItem *)self->_placeItem mapItem];
  BOOL v25 = v24 == 0;

  if (!v25)
  {
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v27 = [(_MKPlaceItem *)self->_placeItem mapItem];
    [v26 removeObserver:self name:*MEMORY[0x1E4F31138] object:v27];
  }
  id v28 = self->_placeItem;
  if (v28 && !v5 && self->_active) {
    [(MUPlaceCardAnalyticsController *)self->_analyticsController instrumentConceal];
  }
  headerSecondaryButtonController = self->_headerSecondaryButtonController;
  self->_headerSecondaryButtonController = 0;

  headerAlternatePrimaryButtonController = self->_headerAlternatePrimaryButtonController;
  self->_headerAlternatePrimaryButtonController = 0;

  contact = self->_contact;
  self->_contact = 0;

  offlineFeatureDiscoveryView = self->_offlineFeatureDiscoveryView;
  self->_offlineFeatureDiscoveryView = 0;

  if (GEOConfigGetBOOL()
    && [(MUPlaceViewController *)self _hasSerializedMapItemFile])
  {
    v33 = [(MUPlaceViewController *)self mapItemFromSerialized];
    v34 = [MEMORY[0x1E4F310F8] placeItemWithMapItem:v33 options:0];
    placeItem = self->_placeItem;
    self->_placeItem = v34;
  }
  else
  {
    v36 = (_MKPlaceItem *)v7;
    v33 = self->_placeItem;
    self->_placeItem = v36;
  }

  [(MUPlaceViewController *)self setPlaceInCollections:0];
  [(MUPlaceViewController *)self setPlaceInShortcuts:0];
  [(MUPlaceViewController *)self updateAddToLibraryActionState];
  [(MUPlaceViewController *)self updateAddNoteActionState];
  [(MUPlaceViewController *)self setOfflineMapProvider:0];
  objc_initWeak((id *)buf, self);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __61__MUPlaceViewController__setPlaceItem_updateOriginalContact___block_invoke;
  v75[3] = &unk_1E574F070;
  objc_copyWeak(&v76, (id *)buf);
  [(MUPlaceViewController *)self _calculateShowingContactActionsWithCompletion:v75];
  [(MKPlaceItemActionDataProvider *)self->_actionDataProvider updateWithPlaceItem:self->_placeItem options:self->_options];
  [(MKETAProvider *)self->_etaProvider cancel];
  v37 = (MKETAProvider *)[objc_alloc(MEMORY[0x1E4F30E90]) initWithPlaceItem:self->_placeItem];
  etaProvider = self->_etaProvider;
  self->_etaProvider = v37;

  [(MKETAProvider *)self->_etaProvider setDelegate:self];
  [(MKETAProvider *)self->_etaProvider addObserver:self];
  v39 = [(MKETAProvider *)self->_etaProvider currentLocation];
  id location = self->_location;
  self->_id location = v39;

  id v41 = [(_MKPlaceItem *)self->_placeItem mapItem];
  BOOL v42 = v41 == 0;

  if (!v42)
  {
    v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v44 = [(_MKPlaceItem *)self->_placeItem mapItem];
    [v43 addObserver:self selector:sel__didResolveAttribution_ name:*MEMORY[0x1E4F31138] object:v44];
  }
  v45 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v46 = objc_opt_respondsToSelector();

  if (v46)
  {
    v47 = [(MUPlaceViewController *)self mapsAppDelegate];
    v48 = [v47 secondaryButtonControllerForPlaceViewController:self];
    v49 = self->_headerSecondaryButtonController;
    self->_headerSecondaryButtonController = v48;
  }
  v50 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v51 = objc_opt_respondsToSelector();

  if (v51)
  {
    v52 = [(MUPlaceViewController *)self mapsAppDelegate];
    v53 = [v52 alternatePrimaryButtonControllerForPlaceViewController:self];
    v54 = self->_headerAlternatePrimaryButtonController;
    self->_headerAlternatePrimaryButtonController = v53;
  }
  v55 = [(MUPlaceViewController *)self mapItem];
  if (v55
    && (p_actionManager = &self->_actionManager,
        [(MUPlaceActionManager *)self->_actionManager setIsCurrentLocation:0],
        ([(_MKPlaceItem *)self->_placeItem options] & 1) != 0))
  {
    uint64_t v57 = 1;
  }
  else
  {
    uint64_t v57 = 0;
    p_actionManager = &self->_actionManager;
  }
  [(MUPlaceActionManager *)*p_actionManager setIsCurrentLocation:v57];
  v61 = [(MUPlaceViewController *)self mapItem];
  v62 = [v61 _enrichmentInfo];
  v63 = [v62 showcaseId];
  v64 = [MEMORY[0x1E4F63E38] sharedData];
  [v64 setPlaceCardPlaceActionDetailsShowcaseId:v63];

  [(MUEVChargerAvailabilityProvider *)self->_evChargerAvailabilityProvider setIsActive:0];
  BOOL v65 = +[MapsUIUtilities isMapsProcess];
  if (self->_placeItem)
  {
    v66 = [[_TtC6MapsUI31MUEVChargerAvailabilityProvider alloc] initWithPlaceItem:self->_placeItem canAccessVirtualGarage:v65];
    evChargerAvailabilityProvider = self->_evChargerAvailabilityProvider;
    self->_evChargerAvailabilityProvider = v66;
  }
  [(MUPlaceViewController *)self scrollToTopAnimated:0];
  [(MUPlaceViewController *)self _updateSections];
  if ([(_MKPlaceItem *)v28 isIntermediateMapItem]) {
    int v68 = [(_MKPlaceItem *)self->_placeItem isIntermediateMapItem] ^ 1;
  }
  else {
    int v68 = 0;
  }

  objc_destroyWeak(&v76);
  objc_destroyWeak((id *)buf);

LABEL_42:
  v69 = [(MUPlaceViewController *)self mapItemIdentifierIntrumentedForReveal];
  if (v69)
  {
    v70 = [(MUPlaceViewController *)self mapItemIdentifierIntrumentedForReveal];
    v71 = [(_MKPlaceItem *)self->_placeItem mapItem];
    v72 = [v71 _identifier];
    if (([v70 isEqual:v72] ^ 1 | v68) != 1)
    {

      goto LABEL_49;
    }
    BOOL v73 = +[MapsUIUtilities isMapsProcess];

    if (!v73) {
      goto LABEL_49;
    }
    goto LABEL_47;
  }
  if (+[MapsUIUtilities isMapsProcess])
  {
LABEL_47:
    [(MUImpressionsCalculator *)self->_impressionsCalculator setActive:0];
    [(MUPlaceViewController *)self _captureRevealEventIfNeeded];
    [(MUImpressionsCalculator *)self->_impressionsCalculator setActive:self->_active];
  }
LABEL_49:
}

void __61__MUPlaceViewController__setPlaceItem_updateOriginalContact___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setShowContactActions:a2];
    id WeakRetained = v4;
  }
}

- (void)_captureRevealEventIfNeeded
{
  if (self->_impressionsCalculator)
  {
    id v3 = [MEMORY[0x1E4F29128] UUID];
    impressionsSessionIdentifier = self->_impressionsSessionIdentifier;
    self->_impressionsSessionIdentifier = v3;

    [(MUImpressionsCalculator *)self->_impressionsCalculator setSessionIdentifier:self->_impressionsSessionIdentifier];
  }
  if ([(MUPlaceCardAnalyticsController *)self->_analyticsController instrumentRevealIfNeededWithImpressionsSessionId:self->_impressionsSessionIdentifier])
  {
    id v6 = [(_MKPlaceItem *)self->_placeItem mapItem];
    BOOL v5 = [v6 _identifier];
    [(MUPlaceViewController *)self setMapItemIdentifierIntrumentedForReveal:v5];
  }
}

- (int)mapTypeForETAProvider:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0;
  }
  id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  int v7 = [v6 mapTypeForPlaceViewController:self];

  return v7;
}

- (void)ETAProviderLocationUpdated:(id)a3
{
  id v4 = [a3 currentLocation];
  [(MUPlaceViewController *)self setLocation:v4];
}

- (void)_didResolveAttribution:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v4))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MUPlaceAttributionFinishedResolving", "", (uint8_t *)&v7, 2u);
  }

  char v5 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(MUPlaceViewController *)self mapItem];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1931EA000, v5, OS_LOG_TYPE_DEBUG, "Attribution for mapItem %@ finished resolving", (uint8_t *)&v7, 0xCu);
  }
  [(MUPlaceViewController *)self _updateSections];
}

- (id)contactStore
{
  if ((self->_options & 0x8000000000) != 0)
  {
    id v6 = 0;
  }
  else
  {
    contactStore = self->_contactStore;
    if (!contactStore)
    {
      id v4 = objc_alloc_init(MUContactStore);
      char v5 = self->_contactStore;
      self->_contactStore = v4;

      [(MUContactStore *)self->_contactStore registerObserver:self queue:MEMORY[0x1E4F14428]];
      contactStore = self->_contactStore;
    }
    id v6 = contactStore;
  }
  return v6;
}

- (id)_contactForEditOperations
{
  id v3 = [(MUPlaceViewController *)self originalContact];
  if (v3) {
    [(MUPlaceViewController *)self originalContact];
  }
  else {
  id v4 = [(MUPlaceViewController *)self contact];
  }

  return v4;
}

- (void)_calculateShowingContactActionsWithCompletion:(id)a3
{
  id v5 = a3;
  if ((self->_options & 0x8000000000) != 0) {
    goto LABEL_11;
  }
  placeItem = self->_placeItem;
  if (!placeItem) {
    goto LABEL_11;
  }
  int v7 = [(_MKPlaceItem *)placeItem contact];
  if (v7)
  {
    id v3 = [(_MKPlaceItem *)self->_placeItem contact];
    if ([v3 hasBeenPersisted]) {
      goto LABEL_10;
    }
  }
  if (([(_MKPlaceItem *)self->_placeItem options] & 8) != 0)
  {
    if (!v7) {
      goto LABEL_11;
    }
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v8 = [(MUPlaceViewController *)self contactStore];
  int v9 = [v8 isGuardianRestrictedCNContainer];

  if (v7)
  {

    if (v9) {
      goto LABEL_11;
    }
  }
  else if (v9)
  {
    goto LABEL_11;
  }
  if (([(_MKPlaceItem *)self->_placeItem options] & 2) != 0) {
    goto LABEL_18;
  }
  uint64_t v10 = [(_MKPlaceItem *)self->_placeItem mapItem];
  id v11 = [v10 _geoMapItem];
  if ([v11 _placeType] == 10)
  {

    goto LABEL_18;
  }
  id v12 = [(_MKPlaceItem *)self->_placeItem mapItem];
  id v13 = [v12 _geoMapItem];
  int v14 = [v13 _placeType];

  if (v14 == 17)
  {
LABEL_18:
    long long v15 = [(_MKPlaceItem *)self->_placeItem mapItem];
    if ([v15 _hasMUID])
    {
      id v16 = [(MUPlaceViewController *)self contactStore];
      int v17 = [v16 hasContactAccess];

      if (v17)
      {
        BOOL v18 = [(MUPlaceViewController *)self contactStore];
        id v19 = [(_MKPlaceItem *)self->_placeItem mapItem];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __71__MUPlaceViewController__calculateShowingContactActionsWithCompletion___block_invoke;
        v20[3] = &unk_1E574F098;
        id v21 = v5;
        [v18 fetchStoredContactForMatchingMapItem:v19 callbackQueue:MEMORY[0x1E4F14428] completion:v20];

        goto LABEL_12;
      }
    }
    else
    {
    }
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    goto LABEL_12;
  }
LABEL_11:
  (*((void (**)(id, void))v5 + 2))(v5, 0);
LABEL_12:
}

uint64_t __71__MUPlaceViewController__calculateShowingContactActionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)setShowContactActions:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MUPlaceViewController *)self showContactActions];
  if (self->_showContactActions != v3)
  {
    self->_showContactActions = v3;
    if (v5 != [(MUPlaceViewController *)self showContactActions])
    {
      if (self->_placeItem)
      {
        [(MUPlaceActionManager *)self->_actionManager setShowContactActions:self->_showContactActions];
        id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
        char v7 = objc_opt_respondsToSelector();

        if (v7)
        {
          id v8 = [(MUPlaceViewController *)self mapsAppDelegate];
          [v8 placeViewControllerDidUpdateContactActionsAvailability:self];
        }
      }
    }
  }
}

- (void)setMapItem:(id)a3 contact:(id)a4
{
}

- (void)setOptions:(unint64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__MUPlaceViewController_setOptions___block_invoke;
  v4[3] = &unk_1E574F0C0;
  v4[4] = self;
  void v4[5] = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__MUPlaceViewController_setOptions___block_invoke_2;
  v3[3] = &unk_1E574F0C0;
  v3[4] = self;
  void v3[5] = a3;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v4 oldUIBlock:v3];
}

void *__36__MUPlaceViewController_setOptions___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = result[5];
  if (*(void *)(v1 + 1328) != v2)
  {
    BOOL v3 = result;
    *(void *)(v1 + 1328) = v2;
    [*(id *)(result[4] + 1040) updateWithPlaceItem:*(void *)(result[4] + 1008) options:*(void *)(result[4] + 1328)];
    uint64_t result = (void *)v3[4];
    if (result[126])
    {
      return (void *)[result _updateSections];
    }
  }
  return result;
}

uint64_t __36__MUPlaceViewController_setOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setOptions:*(void *)(a1 + 40)];
}

- (unint64_t)options
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  void v5[5] = v7;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__MUPlaceViewController_options__block_invoke;
  v6[3] = &unk_1E574F020;
  v6[4] = self;
  v6[5] = v7;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__MUPlaceViewController_options__block_invoke_2;
  v5[3] = &unk_1E574F020;
  v5[4] = self;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v6 oldUIBlock:v5];
  unint64_t options = self->_options;
  _Block_object_dispose(v7, 8);
  return options;
}

uint64_t __32__MUPlaceViewController_options__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 1328);
  return result;
}

uint64_t __32__MUPlaceViewController_options__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 984) options];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)_buildStaticSectionsWithAvailability:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (MapsFeature_IsEnabled_Maps102())
  {
    id v6 = [(MUPlaceViewController *)self _webBasedPlacecardViewController];
    if (v6) {
      [v5 addObject:v6];
    }
    char v7 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_INFO, "End building web-based placecard", buf, 2u);
    }

    id v8 = (void *)[v5 copy];
  }
  else
  {
    int IsMacCatalyst = MapKitIdiomIsMacCatalyst();
    if (IsMacCatalyst) {
      [(MUPlaceViewController *)self _headerButtonsSectionControllerForModuleConfiguration:0];
    }
    else {
    uint64_t v10 = [(MUPlaceViewController *)self _unifiedActionRowSectionControllerWithButtonModuleConfiguration:0];
    }
    if (v10) {
      [v5 addObject:v10];
    }

    id v11 = [(MUPlaceViewController *)self _placeRibbonSectionControllerForAvailability:v4 placeRibbonConfiguration:0];
    if (v11) {
      [v5 addObject:v11];
    }

    id v12 = [(MUPlaceViewController *)self _callToActionSuggestionSectionControllerForAvailability:v4];
    if (v12) {
      [v5 addObject:v12];
    }

    if (self->_myPlacesEnabled)
    {
      id v13 = [(MUPlaceViewController *)self _notesSectionControllerForAvailability:v4];
      if (v13) {
        [v5 addObject:v13];
      }
    }
    int v14 = [(MUPlaceViewController *)self _transitDeparturesSectionControllerForAvailability:v4];
    if (v14) {
      [v5 addObject:v14];
    }

    long long v15 = [(MUPlaceViewController *)self _browseCategorySectionControllerForAvailability:v4];
    if (v15) {
      [v5 addObject:v15];
    }

    id v16 = [(MUPlaceViewController *)self _venueInfoSectionControllerForAvailability:v4];
    if (v16) {
      [v5 addObject:v16];
    }

    int v17 = [(MUPlaceViewController *)self _photoSectionControllerForAvailability:v4];
    if (v17) {
      [v5 addObject:v17];
    }

    BOOL v18 = [(MUPlaceViewController *)self _placeEnrichmentSectionControllerForAvailability:v4];
    if (v18) {
      [v5 addObject:v18];
    }

    id v19 = [(MUPlaceViewController *)self _hikingTipSectionControllerForAvailability:v4];
    if (v19) {
      [v5 addObject:v19];
    }

    uint64_t v20 = [(MUPlaceViewController *)self _contactSharedLocationSectionControllerForAvailability:v4];
    if (v20) {
      [v5 addObject:v20];
    }

    if (IsMacCatalyst)
    {
      id v21 = [(MUPlaceViewController *)self _actionRowSectionControllerClientOverrideWithAvailability:v4 buttonModuleConfiguration:0];
      if (v21) {
        [v5 addObject:v21];
      }
    }
    v22 = [(MUPlaceViewController *)self _inlineMapSectionControllerForAvailability:v4];
    if (v22) {
      [v5 addObject:v22];
    }

    uint64_t v23 = [(MUPlaceViewController *)self _personalGuidesSectionController];
    if (v23) {
      [v5 addObject:v23];
    }

    v24 = [(MUPlaceViewController *)self _annotatedItemSectionControllerForAvailability:v4];
    if (v24) {
      [v5 addObject:v24];
    }

    BOOL v25 = [(MUPlaceViewController *)self _curatedGuidesSectionControllerForAvailability:v4];
    if (v25) {
      [v5 addObject:v25];
    }

    v26 = [(MUPlaceViewController *)self _placeDescriptionSectionControllerForAvailability:v4];
    if (v26) {
      [v5 addObject:v26];
    }

    v27 = [(MUPlaceViewController *)self _encyclopedicSectionControllerForAvailability:v4];
    if (v27) {
      [v5 addObject:v27];
    }

    id v28 = [(MUPlaceViewController *)self _amenitiesSectionControllerForAvailability:v4 moduleConfiguration:0];
    if (v28) {
      [v5 addObject:v28];
    }

    v29 = [(MUPlaceViewController *)self _ratingsAndReviewsSectionControllerForAvailability:v4];
    if (v29) {
      [v5 addObject:v29];
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v30 = [(MUPlaceViewController *)self mapItem];
    v31 = [v30 _relatedPlaceLists];

    uint64_t v32 = [v31 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v43 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = [(MUPlaceViewController *)self _relatedPlaceSectionControllerForAvailability:v4 relatedPlaceList:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          if (v36) {
            [v5 addObject:v36];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v33);
    }

    v37 = [(MUPlaceViewController *)self _hikingTrailsSectionControllerForAvailability:v4];
    if (v37) {
      [v5 addObject:v37];
    }

    v38 = [(MUPlaceViewController *)self _officialAppSectionControllerForAvailability:v4];
    if (v38) {
      [v5 addObject:v38];
    }

    v39 = [(MUPlaceViewController *)self _placeInfoSectionControllerForAvailability:v4 moduleConfiguration:0];
    if (v39) {
      [v5 addObject:v39];
    }

    v40 = [(MUPlaceViewController *)self _placeFooterSectionController];
    if (v40) {
      [v5 addObject:v40];
    }

    id v8 = (void *)[v5 copy];
  }

  return v8;
}

- (id)_buildBrandCardSectionsWithAvailability:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(MUPlaceViewController *)self _actionRowSectionControllerWithButtonModuleConfiguration:0];
  if (v6) {
    [v5 addObject:v6];
  }

  char v7 = [(MUPlaceViewController *)self _placeInfoSectionControllerForAvailability:v4 moduleConfiguration:0];
  if (v7) {
    [v5 addObject:v7];
  }

  id v8 = [(MUPlaceViewController *)self _inlineMapSectionControllerForAvailability:v4];
  if (v8) {
    [v5 addObject:v8];
  }

  int v9 = [(MUPlaceViewController *)self _placeFooterSectionController];
  if (v9) {
    [v5 addObject:v9];
  }

  uint64_t v10 = (void *)[v5 copy];
  return v10;
}

- (id)_buildShortCardSections
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [(MUPlaceViewController *)self _headerButtonsSectionControllerForModuleConfiguration:0];
  if (v4) {
    [v3 addObject:v4];
  }

  id v5 = [(MUPlaceViewController *)self _actionRowSectionControllerWithButtonModuleConfiguration:0];
  if (v5) {
    [v3 addObject:v5];
  }

  id v6 = [(MUPlaceViewController *)self _placeFooterSectionController];
  if (v6) {
    [v3 addObject:v6];
  }

  char v7 = (void *)[v3 copy];
  return v7;
}

- (id)_buildDeveloperPlaceCardSectionsWithAvailability:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(MUPlaceViewController *)self _inlineMapSectionControllerForAvailability:v4];
  if (v6) {
    [v5 addObject:v6];
  }

  char v7 = [(MUPlaceViewController *)self _placeInfoSectionControllerForAvailability:v4 moduleConfiguration:0];
  if (v7) {
    [v5 addObject:v7];
  }

  id v8 = [(MUPlaceViewController *)self _placeFooterSectionController];
  if (v8) {
    [v5 addObject:v8];
  }

  int v9 = (void *)[v5 copy];
  return v9;
}

- (id)_buildForLayoutWithAvailability:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (MapsFeature_IsEnabled_Maps102())
  {
    id v6 = [(MUPlaceViewController *)self _webBasedPlacecardViewController];
    if (v6) {
      [v5 addObject:v6];
    }
    char v7 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_INFO, "End building web-based placecard", buf, 2u);
    }
  }
  else
  {
    id v8 = [(MUPlaceViewController *)self mapItem];
    int v9 = [v8 _placecardLayout];

    uint64_t v10 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_INFO, "Building placecard from dynamic layout", buf, 2u);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v29 = v9;
    id v11 = [v9 modules];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          int v17 = MUGetPlaceCardLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            unsigned int v18 = [v16 type] - 1;
            id v19 = @"MODULE_TYPE_UNKNOWN";
            if (v18 <= 0x2C) {
              id v19 = off_1E574F440[v18];
            }
            *(_DWORD *)buf = 138412290;
            v35 = v19;
            _os_log_impl(&dword_1931EA000, v17, OS_LOG_TYPE_INFO, "Building module %@", buf, 0xCu);
          }

          switch([v16 type])
          {
            case 2u:
              id v21 = [v16 configuration];
              v22 = [v21 headerButtonConfig];
              uint64_t v23 = [(MUPlaceViewController *)self _headerButtonsSectionControllerForModuleConfiguration:v22];
              goto LABEL_40;
            case 3u:
              uint64_t v20 = [(MUPlaceViewController *)self _inlineMapSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 4u:
              uint64_t v20 = [(MUPlaceViewController *)self _photoSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 5u:
              id v21 = [v16 configuration];
              v22 = [v21 placeDetailsConfig];
              uint64_t v23 = [(MUPlaceViewController *)self _placeInfoSectionControllerForAvailability:v4 moduleConfiguration:v22];
              goto LABEL_40;
            case 6u:
              uint64_t v20 = [(MUPlaceViewController *)self _transitDeparturesSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 8u:
              uint64_t v20 = [(MUPlaceViewController *)self _encyclopedicSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0xAu:
              id v21 = [v16 configuration];
              v22 = [v21 businessInfoConfig];
              uint64_t v23 = [(MUPlaceViewController *)self _amenitiesSectionControllerForAvailability:v4 moduleConfiguration:v22];
              goto LABEL_40;
            case 0xBu:
            case 0x21u:
            case 0x24u:
              uint64_t v20 = [(MUPlaceViewController *)self _ratingsAndReviewsSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0xCu:
              id v21 = [v16 configuration];
              v22 = [v21 actionButtonConfig];
              uint64_t v23 = [(MUPlaceViewController *)self _actionRowSectionControllerWithButtonModuleConfiguration:v22];
              goto LABEL_40;
            case 0xFu:
              uint64_t v20 = [(MUPlaceViewController *)self _officialAppSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x10u:
            case 0x1Eu:
              uint64_t v20 = [(MUPlaceViewController *)self _browseCategorySectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x11u:
              uint64_t v20 = [(MUPlaceViewController *)self _venueInfoSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x13u:
            case 0x14u:
              uint64_t v20 = [(MUPlaceViewController *)self _annotatedItemSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x17u:
              uint64_t v20 = [(MUPlaceViewController *)self _placeFooterSectionController];
              goto LABEL_49;
            case 0x19u:
              v24 = [v16 configuration];
              BOOL v25 = [v24 webContentConfig];
              v26 = [(MUPlaceViewController *)self _webContentSectionControllerForConfiguration:v25];

              if (!v26) {
                continue;
              }
              goto LABEL_50;
            case 0x1Au:
            case 0x26u:
              id v21 = [v16 configuration];
              v22 = [v21 relatedPlaceConfig];
              uint64_t v23 = [(MUPlaceViewController *)self _relatedPlaceSectionControllerForAvailability:v4 config:v22];
              goto LABEL_40;
            case 0x1Du:
              uint64_t v20 = [(MUPlaceViewController *)self _personalGuidesSectionController];
              goto LABEL_49;
            case 0x1Fu:
              uint64_t v20 = [(MUPlaceViewController *)self _curatedGuidesSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x23u:
              id v21 = [v16 configuration];
              v22 = [v21 placeRibbonConfig];
              uint64_t v23 = [(MUPlaceViewController *)self _placeRibbonSectionControllerForAvailability:v4 placeRibbonConfiguration:v22];
              goto LABEL_40;
            case 0x25u:
              uint64_t v20 = [(MUPlaceViewController *)self _placeDescriptionSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x27u:
              id v21 = [v16 configuration];
              v22 = [v21 unifiedActionConfig];
              uint64_t v23 = [(MUPlaceViewController *)self _unifiedActionRowSectionControllerWithButtonModuleConfiguration:v22];
LABEL_40:
              v26 = (void *)v23;

              goto LABEL_41;
            case 0x28u:
              uint64_t v20 = [(MUPlaceViewController *)self _placeEnrichmentSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x29u:
              uint64_t v20 = [(MUPlaceViewController *)self _callToActionSuggestionSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x2Au:
              id v21 = [(MUPlaceViewController *)self mapItem];
              v26 = [(MUPlaceViewController *)self _evChargingSectionControllerForForAvailability:v4 mapItem:v21];
LABEL_41:

              if (!v26) {
                continue;
              }
              goto LABEL_50;
            case 0x2Bu:
              uint64_t v20 = [(MUPlaceViewController *)self _hikingTrailsSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x2Cu:
              uint64_t v20 = [(MUPlaceViewController *)self _hikingTipSectionControllerForAvailability:v4];
              goto LABEL_49;
            case 0x2Du:
              uint64_t v20 = [(MUPlaceViewController *)self _notesSectionControllerForAvailability:v4];
LABEL_49:
              v26 = (void *)v20;
              if (v20)
              {
LABEL_50:
                [v5 addObject:v26];
              }
              break;
            default:
              continue;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v13);
    }

    char v7 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1931EA000, v7, OS_LOG_TYPE_INFO, "End building placecard from dynamic layout", buf, 2u);
    }
    id v6 = v29;
  }

  v27 = (void *)[v5 copy];
  return v27;
}

- (void)_buildSections
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  if ([(MUPlaceViewController *)self shouldStubPlacecard]) {
    return;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  obuint64_t j = self->_sectionControllers;
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v107 objects:v114 count:16];
  if (v3)
  {
    uint64_t v88 = *(void *)v108;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v108 != v88) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        long long v103 = 0u;
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id v6 = [v5 sectionViews];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v103 objects:v113 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v104;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v104 != v8) {
                objc_enumerationMutation(v6);
              }
              [(MUScrollableStackView *)self->_contentStackView removeArrangedSubview:*(void *)(*((void *)&v103 + 1) + 8 * j)];
            }
            uint64_t v7 = [v6 countByEnumeratingWithState:&v103 objects:v113 count:16];
          }
          while (v7);
        }

        if (objc_opt_respondsToSelector())
        {
          uint64_t v10 = [v5 sectionViewController];
          [v10 removeFromParentViewController];
        }
      }
      uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v107 objects:v114 count:16];
    }
    while (v3);
  }

  id obja = [(MUPlaceViewController *)self mapItem];
  if (obja
    && (p_actionManager = &self->_actionManager,
        [(MUPlaceActionManager *)self->_actionManager setIsCurrentLocation:0],
        ([(_MKPlaceItem *)self->_placeItem options] & 1) != 0))
  {
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
    p_actionManager = &self->_actionManager;
  }
  [(MUPlaceActionManager *)*p_actionManager setIsCurrentLocation:v12];
  id v85 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = [MUPlaceDataAvailability alloc];
  uint64_t v14 = [(MUPlaceViewController *)self mapItem];
  v84 = [(MUPlaceDataAvailability *)v13 initWithMapItem:v14 options:self->_options];

  long long v15 = [MUPlaceViewControllerSectionController alloc];
  id v16 = [(MUPlaceViewController *)self mapItem];
  int v17 = [(MUPlaceViewControllerConfiguration *)self->_configuration headerViewController];
  unsigned int v18 = [(MUPlaceViewControllerSectionController *)v15 initWithMapItem:v16 viewController:v17];
  if (v18) {
    [v85 addObject:v18];
  }

  id v19 = [(MUPlaceViewController *)self _headerSectionControllerWithAvailability:v84];
  if (v19) {
    [v85 addObject:v19];
  }

  uint64_t v20 = [(MUPlaceViewController *)self placeItem];
  if (v20)
  {
    id v21 = [(MUPlaceViewController *)self placeItem];
    char v22 = [v21 isIntermediateMapItem];

    if ((v22 & 1) == 0)
    {
      if ((self->_options & 0x8000000000) != 0)
      {
        uint64_t v23 = [(MUPlaceViewController *)self _buildDeveloperPlaceCardSectionsWithAvailability:v84];
      }
      else if ([(MUPlaceViewController *)self supportsDynamicLayout])
      {
        uint64_t v23 = [(MUPlaceViewController *)self _buildForLayoutWithAvailability:v84];
      }
      else if ([obja _isMapItemTypeBrand])
      {
        uint64_t v23 = [(MUPlaceViewController *)self _buildBrandCardSectionsWithAvailability:v84];
      }
      else
      {
        if ([obja _placeDisplayStyle] == 2) {
          [(MUPlaceViewController *)self _buildShortCardSections];
        }
        else {
        uint64_t v23 = [(MUPlaceViewController *)self _buildStaticSectionsWithAvailability:v84];
        }
      }
      v24 = (void *)v23;
      [v85 addObjectsFromArray:v23];
    }
  }
  BOOL v25 = (NSArray *)[v85 copy];
  sectionControllers = self->_sectionControllers;
  self->_sectionControllers = v25;

  v27 = [(MUPlaceViewController *)self placeItem];
  if (([v27 isIntermediateMapItem] & 1) != 0 || (self->_options & 8) != 0)
  {
    int v29 = 0;
  }
  else
  {
    id v28 = [(MUPlaceViewController *)self mapItem];
    int v29 = [v28 _canGetDirections];
  }
  unint64_t options = self->_options;
  if ([(_MKPlaceItem *)self->_placeItem options])
  {
    [(MUPlaceActionManager *)self->_actionManager setIsCurrentLocation:1];
    long long v32 = [(MUPlaceViewController *)self headerButtonsSectionController];
    [v32 setPrimaryButtonType:3];
    goto LABEL_42;
  }
  uint64_t v31 = (options >> 20) & 1;
  if ((options & 0x200000000) != 0 && v29 | v31)
  {
    long long v32 = [(MUPlaceViewController *)self headerButtonsSectionController];
    [v32 setPrimaryButtonType:4];
LABEL_42:
    int v33 = 0;
    goto LABEL_43;
  }
  uint64_t v37 = [(_MKPlaceItem *)self->_placeItem mapItem];
  v38 = [v37 _detourInfo];
  if (!v38) {
    LODWORD(v31) = 0;
  }

  if (v31)
  {
    long long v32 = [(MUPlaceViewController *)self headerButtonsSectionController];
    [v32 setPrimaryButtonType:2];
    goto LABEL_42;
  }
  if (!v29)
  {
    int v33 = 0;
    goto LABEL_44;
  }
  long long v32 = [(MUPlaceViewController *)self headerButtonsSectionController];
  [v32 setPrimaryButtonType:1];
  int v33 = 1;
LABEL_43:

LABEL_44:
  int v34 = [obja _isMapItemTypeBrand];
  if ((options & 0x800000000) != 0)
  {
    v35 = [obja _detourInfo];
    BOOL v36 = v35 == 0;

    if (v36)
    {
      [(MKETAProvider *)self->_etaProvider setAllowsDistantETA:1];
LABEL_53:
      [(MKETAProvider *)self->_etaProvider start];
      goto LABEL_54;
    }
  }
  if (v33 | v34) {
    goto LABEL_53;
  }
LABEL_54:
  headerSecondaryButtonController = self->_headerSecondaryButtonController;
  v40 = [(MUPlaceViewController *)self headerButtonsSectionController];
  [v40 setSecondaryButtonController:headerSecondaryButtonController];

  headerAlternatePrimaryButtonController = self->_headerAlternatePrimaryButtonController;
  long long v42 = [(MUPlaceViewController *)self headerButtonsSectionController];
  [v42 setAlternatePrimaryButtonController:headerAlternatePrimaryButtonController];

  [(MUPlaceViewController *)self _updatePersonalizedSuggestionSectionArbiterWithSections];
  long long v43 = self->_location;
  long long v44 = [(MUPlaceViewController *)self inlineMapSectionController];
  [v44 setLocation:v43];

  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v45 = self->_sectionControllers;
  uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v99 objects:v112 count:16];
  if (!v46) {
    goto LABEL_69;
  }
  uint64_t v47 = *(void *)v100;
  do
  {
    for (uint64_t k = 0; k != v46; ++k)
    {
      if (*(void *)v100 != v47) {
        objc_enumerationMutation(v45);
      }
      v49 = *(void **)(*((void *)&v99 + 1) + 8 * k);
      [v49 setDelegate:self];
      [v49 setAnalyticsDelegate:self->_analyticsController];
      v50 = [(MUPlaceViewController *)self personalizedSuggestionSectionArbiter];
      [v49 setPersonalizedSuggestionsArbiterDelegate:v50];

      char v51 = [v49 sectionViews];
      if ([v51 count])
      {
        int v52 = [v49 hasContent];

        if (!v52) {
          goto LABEL_63;
        }
        char v51 = [v49 sectionViews];
        [v89 addObjectsFromArray:v51];
      }

LABEL_63:
      if (objc_opt_respondsToSelector())
      {
        v53 = [v49 sectionViewController];
        if (v53)
        {
          [(MUPlaceViewController *)self addChildViewController:v53];
          [v53 didMoveToParentViewController:self];
        }
      }
    }
    uint64_t v46 = [(NSArray *)v45 countByEnumeratingWithState:&v99 objects:v112 count:16];
  }
  while (v46);
LABEL_69:

  if ([(_MKPlaceItem *)self->_placeItem isIntermediateMapItem])
  {
    long long v98 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v95 = 0u;
    v54 = self->_sectionControllers;
    uint64_t v55 = [(NSArray *)v54 countByEnumeratingWithState:&v95 objects:v111 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v96;
      do
      {
        for (uint64_t m = 0; m != v55; ++m)
        {
          if (*(void *)v96 != v56) {
            objc_enumerationMutation(v54);
          }
          v58 = *(void **)(*((void *)&v95 + 1) + 8 * m);
          char v59 = [(MUPlaceViewController *)self headerSectionController];
          BOOL v60 = v58 == v59;

          if (!v60)
          {
            v61 = [v58 sectionView];
            [v61 setAlpha:0.0];
          }
        }
        uint64_t v55 = [(NSArray *)v54 countByEnumeratingWithState:&v95 objects:v111 count:16];
      }
      while (v55);
    }
  }
  contentStackView = self->_contentStackView;
  v63 = (void *)[v89 copy];
  [(MUScrollableStackView *)contentStackView setArrangedSubviews:v63];

  [(MUPlaceViewController *)self _applyCustomSpacings];
  [(MUPlaceViewController *)self _updateContentAlpha];
  [(MUPlaceViewController *)self hideContentIfLoading];
  v64 = [(MUPlaceViewController *)self inlineMapSectionController];
  if (v64)
  {
    int v65 = [obja _hasResolvablePartialInformation];

    if (v65)
    {
      v66 = [MEMORY[0x1E4F30F28] sharedService];
      v67 = [obja _addressFormattedAsSinglelineAddress];
      int v68 = [v66 ticketForForwardGeocodeString:v67 traits:0];

      objc_initWeak(&location, self);
      v92[0] = MEMORY[0x1E4F143A8];
      v92[1] = 3221225472;
      v92[2] = __39__MUPlaceViewController__buildSections__block_invoke;
      v92[3] = &unk_1E574F0E8;
      objc_copyWeak(&v93, &location);
      [v68 submitWithHandler:v92 networkActivity:0];
      objc_destroyWeak(&v93);
      objc_destroyWeak(&location);
      goto LABEL_91;
    }
  }
  int v68 = [(MUPlaceViewController *)self inlineMapSectionController];
  if (v68)
  {
    v69 = [(MUPlaceViewController *)self mapItem];
    v70 = [v69 url];
    if (!v70)
    {

      goto LABEL_91;
    }
    v71 = (void *)MEMORY[0x1E4F31118];
    v72 = [(MUPlaceViewController *)self mapItem];
    BOOL v73 = [v72 url];
    LODWORD(v71) = [v71 isValidMapURL:v73];

    if (v71)
    {
      id v74 = objc_alloc(MEMORY[0x1E4F31118]);
      v75 = [(MUPlaceViewController *)self mapItem];
      id v76 = [v75 url];
      int v68 = (void *)[v74 initWithURL:v76];

      [v68 parseIncludingCustomParameters:1];
      v77 = [(MUPlaceViewController *)self mapItem];
      v78 = [v77 _identifier];
      if (v78) {
        goto LABEL_89;
      }
      BOOL v79 = [v68 searchUID] == 0;

      if (!v79)
      {
        id v80 = objc_alloc(MEMORY[0x1E4F30F10]);
        uint64_t v81 = [v68 searchUID];
        [v68 centerCoordinate];
        v77 = objc_msgSend(v80, "initWithMUID:resultProviderID:coordinate:", v81, 0);
        int v82 = [MEMORY[0x1E4F30F28] sharedService];
        uint64_t v83 = [v68 contentProviderID];
        v78 = [v82 ticketForNonExpiredIdentifier:v77 resultProviderID:0 contentProvider:v83 traits:0];

        objc_initWeak(&location, self);
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __39__MUPlaceViewController__buildSections__block_invoke_2;
        v90[3] = &unk_1E574F0E8;
        objc_copyWeak(&v91, &location);
        [v78 submitWithHandler:v90 networkActivity:0];
        objc_destroyWeak(&v91);
        objc_destroyWeak(&location);
LABEL_89:
      }
LABEL_91:
    }
  }
}

void __39__MUPlaceViewController__buildSections__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (!a3 && WeakRetained && [v12 count])
  {
    uint64_t v7 = [v12 firstObject];
    uint64_t v8 = v7;
    if ((v6[1328] & 1) == 0)
    {
      int v9 = [v7 _displayMapRegion];

      if (v9)
      {
        uint64_t v10 = [v6 inlineMapSectionController];
        [v10 updateWithMapItem:v8];
      }
    }
    id v11 = [v6 contact];
    [v6 _setMapItem:v8 contact:v11 updateOriginalContact:0];
  }
}

void __39__MUPlaceViewController__buildSections__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (!a3 && WeakRetained && [v12 count])
  {
    uint64_t v7 = [v12 firstObject];
    uint64_t v8 = v7;
    if ((v6[1328] & 1) == 0)
    {
      int v9 = [v7 _displayMapRegion];

      if (v9)
      {
        uint64_t v10 = [v6 inlineMapSectionController];
        [v10 updateWithMapItem:v8];
      }
    }
    if (v8) {
      [v8 _placeCardContact];
    }
    else {
    id v11 = [v6 contact];
    }
    [v6 _setMapItem:v8 contact:v11 updateOriginalContact:0];
  }
}

- (void)setLocation:(id)a3
{
  id v5 = (CLLocation *)a3;
  if (self->_location != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)&self->_location, a3);
    id location = self->_location;
    uint64_t v7 = [(MUPlaceViewController *)self inlineMapSectionController];
    [v7 setLocation:location];

    id v5 = v8;
  }
}

- (BOOL)supportsDynamicLayout
{
  if (!GEOConfigGetBOOL()) {
    return 0;
  }
  uint64_t v3 = [(MUPlaceViewController *)self mapItem];
  id v4 = [v3 _placecardLayout];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_headerSectionControllerWithAvailability:(id)a3
{
  id v4 = a3;
  if ((MapsFeature_IsEnabled_Maps102() & 1) != 0 || (self->_options & 0x80000000000) != 0)
  {
    int v9 = 0;
    goto LABEL_19;
  }
  BOOL v5 = objc_alloc_init(MUPlaceHeaderSectionControllerConfiguration);
  [(MUPlaceHeaderSectionControllerConfiguration *)v5 setSuppressContainmentPunchout:(self->_options & 0x20000000) == 0];
  unint64_t options = self->_options;
  if ((options & 0x20000000) != 0)
  {
    uint64_t v8 = 0;
  }
  else
  {
    unsigned int v7 = [v4 supportsSharing];
    if ((options & 0x8000000000) != 0) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = v7;
    }
  }
  [(MUPlaceHeaderSectionControllerConfiguration *)v5 setShowShareButton:v8];
  if ([(MUPlaceViewController *)self supportsDynamicLayout]) {
    uint64_t BOOL = GEOConfigGetBOOL();
  }
  else {
    uint64_t BOOL = 0;
  }
  [(MUPlaceHeaderSectionControllerConfiguration *)v5 setDrawDynamicPlacecardDebugBackground:BOOL];
  [(MUPlaceHeaderSectionControllerConfiguration *)v5 setIsDeveloperPlaceCard:(options >> 39) & 1];
  id v11 = [(MUPlaceViewControllerConfiguration *)self->_configuration developerPlaceCardAuditToken];
  [(MUPlaceHeaderSectionControllerConfiguration *)v5 setDeveloperPlaceCardAuditToken:v11];

  id v12 = [MEMORY[0x1E4F31038] sharedInstance];
  unsigned int v13 = [v12 userInterfaceIdiom];

  if (v13 < 2) {
    goto LABEL_15;
  }
  if (v13 == 2)
  {
    [(MUPlaceHeaderSectionControllerConfiguration *)v5 setAlwaysShowExpandedVerifiedBusinessHeader:1];
    BOOL v14 = 0;
    goto LABEL_17;
  }
  if (v13 == 3)
  {
LABEL_15:
    BOOL v14 = (options & 0x8020000000) == 0;
    [(MUPlaceHeaderSectionControllerConfiguration *)v5 setAlwaysShowExpandedVerifiedBusinessHeader:(options & 0x8020000000) != 0x20000000];
LABEL_17:
    [(MUPlaceHeaderSectionControllerConfiguration *)v5 setShouldInsetRoundCoverPhoto:v14];
  }
  int v9 = [[MUPlaceHeaderSectionController alloc] initWithPlaceItem:self->_placeItem configuration:v5];
  [(MUPlaceHeaderSectionController *)v9 setHeaderDelegate:self];
  [(MUPlaceHeaderSectionController *)v9 setCardExpansionProgress:self->_verifiedHeaderExpansionProgress];

LABEL_19:
  return v9;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(MKETAProvider *)self->_etaProvider cancel];
  if ((self->_options & 0x20000000) == 0)
  {
    id v4 = (void *)MEMORY[0x1E4F30E38];
    BOOL v5 = [(MUPlaceViewControllerConfiguration *)self->_configuration developerPlaceCardAuditToken];
    id v6 = [v4 sharedImageManagerWithAuditToken:v5];
    [v6 clearImageCache];
  }
  v7.receiver = self;
  v7.super_class = (Class)MUPlaceViewController;
  [(MUPlaceViewController *)&v7 dealloc];
}

- (id)_headerButtonsSectionControllerForModuleConfiguration:(id)a3
{
  if ((self->_options & 0x200000000000) != 0)
  {
    id v6 = 0;
  }
  else
  {
    id v4 = a3;
    if (MapKitIdiomIsMacCatalyst()) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = (BYTE3(self->_options) >> 5) & 1;
    }
    objc_super v7 = objc_alloc_init(MUPlaceHeaderButtonsSectionControllerConfiguration);
    [(MUPlaceHeaderButtonsSectionControllerConfiguration *)v7 setButtonModuleConfiguration:v4];

    [(MUPlaceHeaderButtonsSectionControllerConfiguration *)v7 setShowMoreButton:v5];
    [(MUPlaceHeaderButtonsSectionControllerConfiguration *)v7 setEtaProvider:self->_etaProvider];
    [(MUPlaceHeaderButtonsSectionControllerConfiguration *)v7 setCanShowDetourTime:(self->_options >> 20) & 1];
    [(MUPlaceHeaderButtonsSectionControllerConfiguration *)v7 setMenuProvider:self];
    id v6 = [[MUPlaceHeaderButtonsSectionController alloc] initWithPlaceItem:self->_placeItem configuration:v7];
    [(MUPlaceHeaderButtonsSectionController *)v6 setSecondaryButtonController:0];
    [(MUPlaceHeaderButtonsSectionController *)v6 setHeaderDelegate:self];
  }
  return v6;
}

- (id)_actionRowSectionControllerClientOverrideWithAvailability:(id)a3 buttonModuleConfiguration:(id)a4
{
  id v6 = a4;
  if ([a3 supportsPhotoSlider])
  {
    objc_super v7 = [(MUPlaceViewController *)self _actionRowSectionControllerWithButtonModuleConfiguration:v6];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (id)_actionRowSectionControllerWithButtonModuleConfiguration:(id)a3
{
  if ([(_MKPlaceItem *)self->_placeItem options])
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = [MUPlaceActionRowSectionController alloc];
    id v6 = [(MUPlaceViewController *)self mapItem];
    id v4 = [(MUPlaceActionRowSectionController *)v5 initWithMapItem:v6 actionManager:self->_actionManager menuProvider:self];
  }
  return v4;
}

- (id)unifiedActionRowConfigurationWithButtonModuleConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(MUPlaceUnifiedActionRowSectionControllerConfiguration);
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setActionManager:self->_actionManager];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setMoreActionsProvider:self];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setEtaProvider:self->_etaProvider];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setExternalActionHandler:self];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setButtonModuleConfiguration:v4];

  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setSecondaryActionButtonController:self->_headerSecondaryButtonController];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setIsSearchAlongRoute:(self->_options >> 35) & 1];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setShowMoreButtonIfAvailable:(self->_options >> 29) & 1];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setCanShowDownloadOffline:(self->_options & 0x1000000000) == 0];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setShouldPromoteDownloadOffline:([(_MKPlaceItem *)self->_placeItem options] & 2 | [(_MKPlaceItem *)self->_placeItem options] & 8) != 0];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setShouldShowContactsAction:(self->_options & 0x6000000000) != 0];
  if (MapKitIdiomIsMacCatalyst()) {
    [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setActionRowMenuProvider:self];
  }
  id v6 = [(MUPlaceViewController *)self placeItem];
  if (([v6 isIntermediateMapItem] & 1) != 0 || (self->_options & 8) != 0)
  {
    int v8 = 0;
  }
  else
  {
    objc_super v7 = [(MUPlaceViewController *)self mapItem];
    int v8 = [v7 _canGetDirections];
  }
  unint64_t options = self->_options;
  uint64_t v10 = (options >> 20) & 1;
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setCanShowDetourTime:v10];
  if (options & 0x200000000) != 0 && ((v8 | v10))
  {
    uint64_t v11 = 4;
LABEL_14:
    [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setPrimaryButtonType:v11];
    goto LABEL_15;
  }
  id v12 = [(_MKPlaceItem *)self->_placeItem mapItem];
  unsigned int v13 = [v12 _detourInfo];
  __int16 v14 = v13 != 0;

  if ((*(_DWORD *)&v14 & (options >> 20)) != 0) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  if ((*(_DWORD *)&v14 & (options >> 20) | v8) == 1) {
    goto LABEL_14;
  }
LABEL_15:
  quickActionTrayArtworkCache = self->_quickActionTrayArtworkCache;
  if (!quickActionTrayArtworkCache)
  {
    id v16 = [MUTimeExpirableLRUCache alloc];
    uint64_t UInteger = GEOConfigGetUInteger();
    unsigned int v18 = [(MUTimeExpirableLRUCache *)v16 initWithMaxSize:UInteger timeToLive:(double)(unint64_t)GEOConfigGetUInteger()];
    id v19 = self->_quickActionTrayArtworkCache;
    self->_quickActionTrayArtworkCache = v18;

    quickActionTrayArtworkCache = self->_quickActionTrayArtworkCache;
  }
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setArtworkCache:quickActionTrayArtworkCache];
  uint64_t v20 = [(MUPlaceViewController *)self amsResultProvider];
  [(MUPlaceUnifiedActionRowSectionControllerConfiguration *)v5 setAmsResultProvider:v20];

  return v5;
}

- (id)_unifiedActionRowSectionControllerWithButtonModuleConfiguration:(id)a3
{
  if ((self->_options & 0x200000000000) != 0)
  {
    objc_super v7 = 0;
  }
  else
  {
    id v4 = [(MUPlaceViewController *)self unifiedActionRowConfigurationWithButtonModuleConfiguration:a3];
    uint64_t v5 = [MUPlaceUnifiedActionRowSectionController alloc];
    id v6 = [(MUPlaceViewController *)self mapItem];
    objc_super v7 = [(MUPlaceUnifiedActionRowSectionController *)v5 initWithMapItem:v6 configuration:v4];

    [(MUPlaceUnifiedActionRowSectionController *)v7 setActionDelegate:self];
    int v8 = [(MUPlaceViewController *)self offlineMapProvider];
    [(MUPlaceUnifiedActionRowSectionController *)v7 setOfflineMapProvider:v8];
  }
  return v7;
}

- (void)sectionController:(id)a3 didSelectPrimaryButtonType:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = objc_alloc_init(MUPresentationOptions);
  [(MUPlaceViewController *)self _placeSectionController:v6 didSelectPrimaryType:a4 withPresentationOptions:v7];
}

- (void)sectionControllerDidSelectViewContactButton:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectViewContact:self];
  }
}

- (id)_browseCategorySectionControllerForAvailability:(id)a3
{
  if ([a3 supportsBrowseCategory])
  {
    id v4 = [MUBrowseCategorySectionController alloc];
    char v5 = [(MUPlaceViewController *)self mapItem];
    id v6 = [(MUBrowseCategorySectionController *)v4 initWithMapItem:v5];

    [(MUBrowseCategorySectionController *)v6 setBrowseCategoryDelegate:self];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_ratingsAndReviewsSectionControllerForAvailability:(id)a3
{
  id v4 = a3;
  if ([v4 supportsInlineRatings])
  {
    char v5 = [MUInlineRatingsSectionController alloc];
    id v6 = [(MUPlaceViewController *)self mapItem];
    objc_super v7 = [(MUInlineRatingsSectionController *)v5 initWithMapItem:v6 inlineRatingsViewProvider:self];
  }
  else if ([v4 shouldShowRatingsAndReviewsModule])
  {
    int v8 = [MURatingsAndReviewsSectionController alloc];
    int v9 = [(MUPlaceViewController *)self mapItem];
    objc_super v7 = [(MURatingsAndReviewsSectionController *)v8 initWithMapItem:v9];

    [(MUInlineRatingsSectionController *)v7 setActionDelegate:self];
  }
  else
  {
    objc_super v7 = 0;
  }

  return v7;
}

- (id)_venueInfoSectionControllerForAvailability:(id)a3
{
  if ([a3 supportsVenueTextInfo])
  {
    id v4 = [MUPlaceVenueInfoSectionController alloc];
    char v5 = [(MUPlaceViewController *)self mapItem];
    id v6 = [(MUPlaceVenueInfoSectionController *)v4 initWithMapItem:v5];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_annotatedItemSectionControllerForAvailability:(id)a3
{
  id v4 = a3;
  if ([v4 supportsAnnotatedPhotos])
  {
    char v5 = [MUPlacePictureItemSectionController alloc];
    id v6 = [(MUPlaceViewController *)self mapItem];
    objc_super v7 = [(MUPlaceViewController *)self mapItem];
    int v8 = [v7 _annotatedItemList];
    int v9 = [(MUPlacePictureItemSectionController *)v5 initWithMapItem:v6 annotatedList:v8 presentingViewController:self];

    [(MUPlacePictureItemSectionController *)v9 setPictureItemDelegate:self];
  }
  else if ([v4 supportsAnnotatedTextList])
  {
    uint64_t v10 = [MUPlaceListItemSectionController alloc];
    uint64_t v11 = [(MUPlaceViewController *)self mapItem];
    id v12 = [(MUPlaceViewController *)self mapItem];
    unsigned int v13 = [v12 _annotatedItemList];
    int v9 = [(MUPlaceListItemSectionController *)v10 initWithMapItem:v11 annotatedList:v13];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)_officialAppSectionControllerForAvailability:(id)a3
{
  if ([a3 suportsOfficialApp])
  {
    if (!self->_officialAppMediaResultCache)
    {
      id v4 = [MUTimeExpirableLRUCache alloc];
      uint64_t UInteger = GEOConfigGetUInteger();
      id v6 = [(MUTimeExpirableLRUCache *)v4 initWithMaxSize:UInteger timeToLive:(double)(unint64_t)GEOConfigGetUInteger()];
      officialAppMediaResultCache = self->_officialAppMediaResultCache;
      self->_officialAppMediaResultCache = v6;
    }
    int v8 = [MUOfficialAppSectionController alloc];
    int v9 = [(MUPlaceViewController *)self mapItem];
    uint64_t v10 = [(MUOfficialAppSectionController *)v8 initWithMapItem:v9 usingCachedMediaResults:self->_officialAppMediaResultCache];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)_placeRibbonSectionControllerForAvailability:(id)a3 placeRibbonConfiguration:(id)a4
{
  if ((self->_options & 0x100000000000) != 0)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v6 = a4;
    id v7 = a3;
    int v8 = objc_alloc_init(MUPlaceRibbonSectionControllerConfiguration);
    [(MUPlaceRibbonSectionControllerConfiguration *)v8 setAvailability:v7];

    [(MUPlaceRibbonSectionControllerConfiguration *)v8 setRibbonConfiguration:v6];
    [(MUPlaceRibbonSectionControllerConfiguration *)v8 setEtaProvider:self->_etaProvider];
    [(MUPlaceRibbonSectionControllerConfiguration *)v8 setEvChargerAvailabilityProvider:self->_evChargerAvailabilityProvider];
    int v9 = [MUPlaceRibbonSectionController alloc];
    uint64_t v10 = [(MUPlaceViewController *)self mapItem];
    uint64_t v11 = [(MUPlaceRibbonSectionController *)v9 initWithMapItem:v10 configuration:v8];

    [(MUPlaceRibbonSectionController *)v11 setRibbonDelegate:self];
  }
  return v11;
}

- (id)_transitDeparturesSectionControllerForAvailability:(id)a3
{
  id v4 = a3;
  if ([v4 isTransitItem])
  {
    char v5 = [MUTransitDeparturesSectionController alloc];
    id v6 = [(MUPlaceViewController *)self mapItem];
    id v7 = -[MUTransitDeparturesSectionController initWithMapItem:allowTransitLineSelection:departuresDelegate:](v5, "initWithMapItem:allowTransitLineSelection:departuresDelegate:", v6, [v4 allowTransitLineSelection], self);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_photoSectionControllerForAvailability:(id)a3
{
  if ((self->_options & 0x800000000000) != 0)
  {
    int v9 = 0;
  }
  else
  {
    id v4 = a3;
    char v5 = objc_alloc_init(MUPlacePhotoSectionControllerConfiguration);
    uint64_t v6 = [v4 supportsCallToAction];

    [(MUPlacePhotoSectionControllerConfiguration *)v5 setSupportsARPCallToAction:v6];
    [(MUPlacePhotoSectionControllerConfiguration *)v5 setPresentingViewController:self];
    if (MapKitIdiomIsMacCatalyst()) {
      [(MUPlacePhotoSectionControllerConfiguration *)v5 setShowLookAround:1];
    }
    id v7 = [MUPlacePhotoSectionController alloc];
    int v8 = [(MUPlaceViewController *)self mapItem];
    int v9 = [(MUPlacePhotoSectionController *)v7 initWithMapItem:v8 configuration:v5];

    [(MUPlacePhotoSectionController *)v9 setPhotoSectionControllerDelegate:self];
    [(MUPlacePhotoSectionController *)v9 setLookAroundDelegate:self];
  }
  return v9;
}

- (id)_curatedGuidesSectionControllerForAvailability:(id)a3
{
  if ([a3 supportsCuratedGuidesCarousel])
  {
    id v4 = [MUCuratedGuidesSectionController alloc];
    long long v15 = [(MUPlaceViewController *)self mapItem];
    char v5 = [v15 _placeCollections];
    uint64_t v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    id v7 = [v6 curatedCollectionSyncCoordinator];
    int v8 = [(MUPlaceViewController *)self mapItem];
    int v9 = [(MUPlaceViewController *)self mapItem];
    uint64_t v10 = [v9 _placeCollectionIds];
    uint64_t v11 = [(MUPlaceViewController *)self mapItem];
    id v12 = [v11 _exploreGuides];
    unsigned int v13 = [(MUCuratedGuidesSectionController *)v4 initWithDelegate:self withPlaceCollections:v5 usingSyncCoordinator:v7 usingMapItem:v8 usingCollectionIds:v10 exploreGuides:v12];
  }
  else
  {
    unsigned int v13 = 0;
  }
  return v13;
}

- (id)_placeDescriptionSectionControllerForAvailability:(id)a3
{
  if ((self->_options & 0x400000000000) != 0 || ![a3 supportsPlaceDescription])
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v4 = [MUPlaceDescriptionConfiguration alloc];
    char v5 = [(MUPlaceViewController *)self mapItem];
    uint64_t v6 = [v5 _geoMapItem];
    id v7 = [v6 _placeDescription];
    int v8 = [(MUPlaceDescriptionConfiguration *)v4 initWithTitle:0 descriptionText:v7 attribution:0];

    int v9 = [MUPlaceDescriptionSectionController alloc];
    uint64_t v10 = [(_MKPlaceItem *)self->_placeItem mapItem];
    uint64_t v11 = [(MUPlaceDescriptionSectionController *)v9 initWithMapItem:v10 configuration:v8];

    [(MUPlaceDescriptionSectionController *)v11 setActionDelegate:self];
  }
  return v11;
}

- (id)_placeFooterSectionController
{
  uint64_t v3 = [MUPlaceFooterActionsSectionController alloc];
  id v4 = [(MUPlaceViewController *)self mapItem];
  char v5 = [(MUPlaceFooterActionsSectionController *)v3 initWithMapItem:v4 actionManager:self->_actionManager];

  return v5;
}

- (id)_passiveCallToActionSectionControllerForAvailability:(id)a3
{
  if ([a3 supportsCallToAction])
  {
    id v4 = [MUPassiveCallToActionSectionController alloc];
    char v5 = [(MUPlaceViewController *)self mapItem];
    uint64_t v6 = [(MUPlaceSectionController *)v4 initWithMapItem:v5];

    [(MUCallToActionSectionController *)v6 setCallToActionDelegate:self];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)_callToActionSuggestionSectionControllerForAvailability:(id)a3
{
  if ([a3 supportsCallToAction])
  {
    id v4 = [MUPassiveCallToActionSectionController alloc];
    char v5 = [(MUPlaceViewController *)self mapItem];
    uint64_t v6 = [(MUPlaceSectionController *)v4 initWithMapItem:v5];

    [(MUCallToActionSectionController *)v6 setCallToActionDelegate:self];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)_encyclopedicSectionControllerForAvailability:(id)a3
{
  if ([a3 supportsEncyclopedicDescription])
  {
    id v4 = [(MUPlaceViewController *)self mapItem];
    char v5 = [v4 _encyclopedicInfo];
    uint64_t v6 = +[MUPlaceDescriptionConfiguration configurationWithEncyclopedicInfo:v5];

    id v7 = [MUPlaceDescriptionSectionController alloc];
    int v8 = [(_MKPlaceItem *)self->_placeItem mapItem];
    int v9 = [(MUPlaceDescriptionSectionController *)v7 initWithMapItem:v8 configuration:v6];

    [(MUPlaceDescriptionSectionController *)v9 setActionDelegate:self];
  }
  else
  {
    int v9 = 0;
  }
  return v9;
}

- (id)_personalGuidesSectionController
{
  uint64_t v3 = [MUPersonalGuidesSectionController alloc];
  id v4 = [(MUPlaceViewController *)self mapItem];
  char v5 = [(MUPersonalGuidesSectionController *)v3 initWithMapItem:v4 collectionViewProvider:self];

  return v5;
}

- (id)_placeEnrichmentSectionControllerForAvailability:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_PlaceCardShowcase()
    && [v4 supportsPlaceEnrichment])
  {
    char v5 = [MUPlaceEnrichmentSectionController alloc];
    uint64_t v6 = [(MUPlaceViewController *)self mapItem];
    actionManager = self->_actionManager;
    int v8 = [(MUPlaceViewController *)self amsResultProvider];
    int v9 = [(MUPlaceEnrichmentSectionController *)v5 initWithMapItem:v6 actionManager:actionManager dataAvailability:v4 amsResultProvider:v8 callToActionDelegate:self externalActionHandler:self rapActionHandler:self];

    [(MUPlaceEnrichmentSectionController *)v9 setPlaceEnrichmentDelegate:self];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)_contactSharedLocationSectionControllerForAvailability:(id)a3
{
  id v4 = a3;
  if (MapsFeature_IsEnabled_MapsWally()
    && [(_MKPlaceItem *)self->_placeItem representsPerson])
  {
    char v5 = [(_MKPlaceItem *)self->_placeItem contact];
    if (objc_msgSend(v5, "_mapkit_isSharedLocationContact"))
    {
      uint64_t v6 = [[MUContactSharedLocationSectionController alloc] initWithPlaceItem:self->_placeItem availability:v4];
      [(MUContactSharedLocationSectionController *)v6 setContactSharedLocationSectionDelegate:self];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_amenitiesSectionControllerForAvailability:(id)a3 moduleConfiguration:(id)a4
{
  id v6 = a4;
  if ([a3 supportsAmenities])
  {
    id v7 = [MUAmenitiesSectionController alloc];
    int v8 = [(MUPlaceViewController *)self mapItem];
    int v9 = [(MUAmenitiesSectionController *)v7 initWithMapItem:v8 moduleConiguration:v6];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)_relatedPlaceSectionControllerForAvailability:(id)a3 relatedPlaceList:(id)a4
{
  id v6 = a4;
  if (![a3 supportsRelatedPlaces]
    || MapsFeature_IsEnabled_MapsWally()
    && [(_MKPlaceItem *)self->_placeItem representsPerson]
    && ([(_MKPlaceItem *)self->_placeItem contact],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = objc_msgSend(v7, "_mapkit_isSharedLocationContact"),
        v7,
        !v8))
  {
    id v12 = 0;
  }
  else
  {
    int v9 = [(MUPlaceViewController *)self _relatedPlaceConfigurationForRelatedPlaceList:v6 moduleConfiguration:0];
    uint64_t v10 = [MURelatedPlacesSectionController alloc];
    uint64_t v11 = [(MUPlaceViewController *)self mapItem];
    id v12 = [(MURelatedPlacesSectionController *)v10 initWithMapItem:v11 configuration:v9];

    [(MURelatedPlacesSectionController *)v12 setRelatedPlacesDelegate:self];
  }

  return v12;
}

- (id)_relatedPlaceSectionControllerForAvailability:(id)a3 config:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![v6 supportsRelatedPlaces])
  {
    __int16 v14 = 0;
    goto LABEL_10;
  }
  int v8 = [(MUPlaceViewController *)self mapItem];
  int v9 = v8;
  if (v7)
  {
    uint64_t v10 = objc_msgSend(v8, "_relatedPlaceListForComponentIdentifier:", objc_msgSend(v7, "componentIdentifier"));

    if (!v10)
    {
      int v9 = 0;
      __int16 v14 = 0;
      goto LABEL_9;
    }
    uint64_t v11 = [(MUPlaceViewController *)self _relatedPlaceConfigurationForRelatedPlaceList:v10 moduleConfiguration:v7];
    id v12 = [MURelatedPlacesSectionController alloc];
    unsigned int v13 = [(MUPlaceViewController *)self mapItem];
    __int16 v14 = [(MURelatedPlacesSectionController *)v12 initWithMapItem:v13 configuration:v11];

    [(MURelatedPlacesSectionController *)v14 setRelatedPlacesDelegate:self];
    int v9 = (void *)v10;
  }
  else
  {
    uint64_t v11 = [v8 _relatedPlaceLists];
    long long v15 = [v11 firstObject];
    __int16 v14 = [(MUPlaceViewController *)self _relatedPlaceSectionControllerForAvailability:v6 relatedPlaceList:v15];
  }
LABEL_9:

LABEL_10:
  return v14;
}

- (id)_relatedPlaceConfigurationForRelatedPlaceList:(id)a3 moduleConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [[MURelatedPlaceSectionControllerConfiguration alloc] initWithRelatedPlaceList:v7];

  BOOL v9 = (self->_options & 0x20000000) == 0;
  [(MURelatedPlaceSectionControllerConfiguration *)v8 setSuppressSeeAllButton:v9];
  [(MURelatedPlaceSectionControllerConfiguration *)v8 setModuleConfiguration:v6];

  [(MURelatedPlaceSectionControllerConfiguration *)v8 setSuppressItemSelection:v9];
  return v8;
}

- (id)_inlineMapSectionControllerForAvailability:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F30FC0] configurationForPlaceViewControllerOptions:self->_options];
  id v6 = v5;
  if ((self->_options & 0x8000000000) != 0)
  {
    [v5 setSuppressLookAround:1];
    [v6 setSuppressSectionHeader:1];
    [v6 setShowMapAttribution:1];
    id v7 = [(MUPlaceViewControllerConfiguration *)self->_configuration developerPlaceCardAuditToken];
    [v6 setMapSnapshotAuditToken:v7];
  }
  if (([v4 supportsInlineMap] & 1) != 0 || objc_msgSend(v4, "supportsInlinePOIMap"))
  {
    int v8 = [MUPlaceInlineMapSectionController alloc];
    BOOL v9 = [(MUPlaceViewController *)self mapItem];
    uint64_t v10 = [(MUPlaceInlineMapSectionController *)v8 initWithMapItem:v9 configuration:v6];

    [(MUPlaceInlineMapSectionController *)v10 setLocation:self->_location];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_placeInfoSectionControllerForAvailability:(id)a3 moduleConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 supportsHours])
  {
    int v8 = [(_MKPlaceItem *)self->_placeItem mapItem];
    uint64_t v9 = +[MUPlaceHoursSectionViewConfiguration configurationForMapItem:v8];
LABEL_5:
    uint64_t v10 = (void *)v9;

    goto LABEL_7;
  }
  if ([v6 supportsMessageHours])
  {
    int v8 = [(_MKPlaceItem *)self->_placeItem mapItem];
    uint64_t v9 = +[MUPlaceHoursSectionViewConfiguration configurationForMessagesMapItem:v8];
    goto LABEL_5;
  }
  uint64_t v10 = 0;
LABEL_7:
  uint64_t v11 = objc_alloc_init(MUPlaceInfoSectionControllerConfiguration);
  [(MUPlaceInfoSectionControllerConfiguration *)v11 setModuleConfiguration:v7];

  [(MUPlaceInfoSectionControllerConfiguration *)v11 setAvailability:v6];
  [(MUPlaceInfoSectionControllerConfiguration *)v11 setActionDelegate:self->_actionManager];
  [(MUPlaceInfoSectionControllerConfiguration *)v11 setHoursConfiguration:v10];
  [(MUPlaceInfoSectionControllerConfiguration *)v11 setDeveloperPlaceCard:(self->_options >> 39) & 1];
  id v12 = [[MUPlaceInfoSectionController alloc] initWithPlaceItem:self->_placeItem configuration:v11];
  [(MUPlaceInfoSectionController *)v12 setPlaceInfoDelegate:self];
  [(MUPlaceInfoSectionController *)v12 setUserInfoProvider:self];

  return v12;
}

- (id)_webContentSectionControllerForConfiguration:(id)a3
{
  id v4 = a3;
  char v5 = [MUPlaceWebContentSectionController alloc];
  id v6 = [(MUPlaceViewController *)self mapItem];
  id v7 = [(MUPlaceWebContentSectionController *)v5 initWithMapItem:v6 configuration:v4];

  [(MUPlaceWebContentSectionController *)v7 setWebContentDelegate:self];
  return v7;
}

- (id)_webBasedPlacecardViewController
{
  if (MapsFeature_IsEnabled_Maps102())
  {
    uint64_t v3 = objc_alloc_init(MUWebBasedPlacecardSectionControllerConfiguration);
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setExternalActionHandler:self];
    id v4 = [(MUPlaceViewController *)self webPlacecardGuides];
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setUserGuides:v4];

    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setPlaceInShortcuts:[(MUPlaceViewController *)self placeInShortcuts]];
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setNumberOfReportsInReview:[(MUPlaceViewController *)self placeNumberOfReportsInReview]];
    char v5 = [(MUPlaceViewController *)self userIcon];
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setUserIcon:v5];

    id v6 = [(MUPlaceViewController *)self placeItem];
    id v7 = [v6 contact];

    if (!v7)
    {
      int v8 = [(MUPlaceViewController *)self mapItem];
      id v7 = [v8 _placeCardContact];
    }
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setContact:v7];
    uint64_t v9 = [(MUPlaceViewController *)self placeItem];
    [v9 options];
    uint64_t v10 = MKPlaceItemOptionsAsString();
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setOptions:v10];

    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setUserCanEdit:(self->_options >> 4) & 1];
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setCanShowOpenFindMyAction:(self->_options >> 37) & 1];
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setCanShowRequestLocation:(self->_options >> 38) & 1];
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setShowMoreButton:(self->_options >> 29) & 1];
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setCanShowDownloadOffline:(self->_options & 0x1000000000) == 0];
    quickActionTrayArtworkCache = self->_quickActionTrayArtworkCache;
    if (!quickActionTrayArtworkCache)
    {
      id v12 = [MUTimeExpirableLRUCache alloc];
      uint64_t UInteger = GEOConfigGetUInteger();
      __int16 v14 = [(MUTimeExpirableLRUCache *)v12 initWithMaxSize:UInteger timeToLive:(double)(unint64_t)GEOConfigGetUInteger()];
      long long v15 = self->_quickActionTrayArtworkCache;
      self->_quickActionTrayArtworkCache = v14;

      quickActionTrayArtworkCache = self->_quickActionTrayArtworkCache;
    }
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setArtworkCache:quickActionTrayArtworkCache];
    id v16 = [(MUPlaceViewController *)self amsResultProvider];
    [(MUWebBasedPlacecardSectionControllerConfiguration *)v3 setAmsResultProvider:v16];

    int v17 = [MUWebBasedPlacecardSectionController alloc];
    unsigned int v18 = [(MUPlaceViewController *)self mapItem];
    id v19 = [(MUWebBasedPlacecardSectionController *)v17 initWithMapItem:v18 placeActionDispatcher:self->_actionDispatcher configuration:v3];

    [(MUWebBasedPlacecardSectionController *)v19 setWebContentDelegate:self];
  }
  else
  {
    id v19 = 0;
  }
  return v19;
}

- (id)_evChargingSectionControllerForForAvailability:(id)a3 mapItem:(id)a4
{
  id v6 = a4;
  if ([a3 supportsEVCharging] && self->_evChargerAvailabilityProvider) {
    id v7 = [[MUEVChargingSectionController alloc] initWithMapItem:v6 availabilityProvider:self->_evChargerAvailabilityProvider];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)_hikingTrailsSectionControllerForAvailability:(id)a3
{
  if ([a3 supportsHikingTrails])
  {
    id v4 = [MURelatedPlaceSectionControllerConfiguration alloc];
    char v5 = [(MUPlaceViewController *)self mapItem];
    id v6 = [v5 _trailHead];
    id v7 = [(MURelatedPlaceSectionControllerConfiguration *)v4 initWithTrailHead:v6];

    int v8 = [MURelatedPlacesSectionController alloc];
    uint64_t v9 = [(MUPlaceViewController *)self mapItem];
    uint64_t v10 = [(MURelatedPlacesSectionController *)v8 initWithMapItem:v9 configuration:v7];

    [(MURelatedPlacesSectionController *)v10 setRelatedPlacesDelegate:self];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)_hikingTipSectionControllerForAvailability:(id)a3
{
  unint64_t options = self->_options;
  char v5 = 0;
  if ([a3 supportsHikingTip] && (options & 0x40000000000) != 0)
  {
    id v6 = [MUHikingTipSectionController alloc];
    id v7 = [(MUPlaceViewController *)self placeItem];
    char v5 = [(MUHikingTipSectionController *)v6 initWithPlaceItem:v7 tipDelegate:self];
  }
  return v5;
}

- (id)_notesSectionControllerForAvailability:(id)a3
{
  if ([a3 supportsPlaceNotes])
  {
    id v4 = [_TtC6MapsUI29MUPlaceNotesSectionController alloc];
    char v5 = [(MUPlaceViewController *)self mapItem];
    id v6 = [(MUPlaceViewController *)self libraryAccessProvider];
    id v7 = [(MUPlaceNotesSectionController *)v4 initWithMapItem:v5 userInfoProvider:self libraryAccessProvider:v6];

    [(MUPlaceNotesSectionController *)v7 setNotesSectionDelegate:self];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)_updateSections
{
  uint64_t v3 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UpdateSections", "", buf, 2u);
  }

  [(MUPlaceViewController *)self _deactivateSections];
  [(MUPlaceViewController *)self _buildSections];
  [(MUPlaceViewController *)self _activateSections];
  [(MUPlaceViewController *)self showContentIfLoaded];
  id v4 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)char v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UpdateSections", "", v5, 2u);
  }
}

- (void)_activateSections
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ActivateSections", "", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_sectionControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "setActive:", 1, (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }

  [(MUPlaceViewController *)self _updateSectionsForSubmissionStatusChange];
  [(MUEVChargerAvailabilityProvider *)self->_evChargerAvailabilityProvider setIsActive:1];
  uint64_t v9 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ActivateSections", "", buf, 2u);
  }
}

- (void)_deactivateSections
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DeactivateSections", "", buf, 2u);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_sectionControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "setActive:", 0, (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }

  [(MUEVChargerAvailabilityProvider *)self->_evChargerAvailabilityProvider setIsActive:0];
  uint64_t v9 = MUGetPlaceCardLog();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DeactivateSections", "", buf, 2u);
  }
}

- (void)_updateSectionsForAttributionChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = self->_sectionControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "updateForAttributionChange", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_updateSectionsForActionRowInfoChange
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v2 = self->_sectionControllers;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "updateForActionRowInfoChange", (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_updateSectionsForSubmissionStatusChange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MUPlaceDataAvailability alloc];
  uint64_t v4 = [(MUPlaceViewController *)self mapItem];
  uint64_t v5 = [(MUPlaceDataAvailability *)v3 initWithMapItem:v4 options:self->_options];

  BOOL v6 = [(MUPlaceDataAvailability *)v5 supportsCallToAction];
  uint64_t v7 = MUGetPlaceCardLog();
  long long v8 = v7;
  if (v6)
  {
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UpdateSectionsForSubmissionStatus", "", buf, 2u);
    }

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v9 = self->_sectionControllers;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "setSubmissionStatus:", self->_submissionStatus, (void)v14);
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v11);
    }

    long long v8 = MUGetPlaceCardLog();
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1931EA000, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UpdateSectionsForSubmissionStatus", "", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_INFO, "Do not support ARP call to action so not updating sections", buf, 2u);
  }
}

- (void)_updatePersonalizedSuggestionSectionArbiterWithSections
{
  uint64_t v3 = [(MUPlaceViewController *)self notesSectionController];
  uint64_t v4 = [(MUPlaceViewController *)self personalizedSuggestionSectionArbiter];
  [v4 setPlaceNotesSectionController:v3];

  uint64_t v5 = [(MUPlaceViewController *)self _firstSectionControllerOfClass:objc_opt_class()];
  BOOL v6 = [(MUPlaceViewController *)self personalizedSuggestionSectionArbiter];
  [v6 setPlaceCallToActionSectionController:v5];

  id v8 = [(MUPlaceViewController *)self _firstSectionControllerOfClass:objc_opt_class()];
  uint64_t v7 = [(MUPlaceViewController *)self personalizedSuggestionSectionArbiter];
  [v7 setHikingTipSectionController:v8];
}

- (void)_updateWebPlacecardForSubmissionStatusChange:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 ratingState];
  uint64_t v5 = &unk_1EE4047C0;
  if (v4 != 1) {
    uint64_t v5 = 0;
  }
  if (v4 == 2) {
    BOOL v6 = &unk_1EE4047D8;
  }
  else {
    BOOL v6 = v5;
  }
  uint64_t v7 = [MUUGCRatingViewModel alloc];
  id v8 = _MULocalizedStringFromThisBundle(@"Overall [Placecard]");
  long long v9 = [(MUUGCRatingViewModel *)v7 initWithCategory:v8 value:v6];

  v17[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  uint64_t v11 = [(MUPlaceViewController *)self webPlacecardSectionController];
  uint64_t v12 = [v11 configuration];
  [v12 setUserARPRatings:v10];

  uint64_t v13 = [(MUPlaceViewController *)self userIcon];
  long long v14 = [(MUPlaceViewController *)self webPlacecardSectionController];
  long long v15 = [v14 configuration];
  [v15 setUserIcon:v13];

  long long v16 = [(MUPlaceViewController *)self webPlacecardSectionController];
  [v16 updateUserData];
}

- (void)_updateWebPlacecardForPhotoSubmissionWithURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MUPlaceViewController *)self webPlacecardSectionController];
  BOOL v6 = [v5 configuration];
  [v6 setUserARPPhoto:v4];

  id v7 = [(MUPlaceViewController *)self webPlacecardSectionController];
  [v7 updateUserData];
}

- (void)updateActionRowView
{
  v2[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__MUPlaceViewController_updateActionRowView__block_invoke;
  v3[3] = &unk_1E574EFD0;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__MUPlaceViewController_updateActionRowView__block_invoke_2;
  v2[3] = &unk_1E574EFD0;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v3 oldUIBlock:v2];
}

void __44__MUPlaceViewController_updateActionRowView__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) actionRowSectionController];
  [v1 updateForActionRowInfoChange];
}

void __44__MUPlaceViewController_updateActionRowView__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) actionRowSectionController];
  [v1 updateForActionRowInfoChange];
}

- (void)updateViewsWithSubmissionStatus:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  unint64_t v7 = self->_submissionStatus;
  unint64_t v8 = (unint64_t)v6;
  if (v8 | v7 && (BOOL v9 = [(id)v7 isEqual:v8], (id)v8, (id)v7, !v9))
  {
    objc_storeStrong((id *)&self->_submissionStatus, a3);
    [(MUPlaceViewController *)self _updateSectionsForSubmissionStatusChange];
    [(MUPlaceViewController *)self _updateWebPlacecardForSubmissionStatusChange:v8];
  }
  else
  {
    uint64_t v10 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1931EA000, v10, OS_LOG_TYPE_DEBUG, "Neither the submission status or proactive status has changed so not updating.", v11, 2u);
    }
  }
}

- (void)updateUserSubmissionWithPhotoURL:(id)a3 photoID:(id)a4 numberOfPhotos:(int64_t)a5
{
  id v14 = a3;
  id v8 = a4;
  BOOL v9 = [[MUUserSubmittedPhoto alloc] initWithPhotoURL:v14];
  [(MUUserSubmittedPhoto *)v9 setPhotoID:v8];

  uint64_t v10 = [(MUPlaceViewController *)self _firstSectionControllerOfClass:objc_opt_class()];
  uint64_t v11 = [v10 userSubmittedPhoto];
  if (v11 != v9)
  {

LABEL_4:
    if (v14) {
      uint64_t v13 = v9;
    }
    else {
      uint64_t v13 = 0;
    }
    [v10 setUserSubmittedPhoto:v13];
    [v10 setUserInfoProvider:self];
    [v10 setNumberOfUserSubmittedPhotos:a5];
    [v10 updateWithUserSubmittedPhotos:1];
    [(MUPlaceViewController *)self _updateWebPlacecardForPhotoSubmissionWithURL:v14];
    goto LABEL_8;
  }
  uint64_t v12 = [v10 numberOfUserSubmittedPhotos];

  if (v12 != a5) {
    goto LABEL_4;
  }
LABEL_8:
}

- (void)updateCuratedCollectionsView
{
  id v2 = [(MUPlaceViewController *)self curatedGuidesSectionController];
  [v2 refreshCollections];
}

- (void)updateSuggestionView
{
  id v2 = [(MUPlaceViewController *)self _firstSectionControllerOfClass:objc_opt_class()];
  [v2 updateSuggestionView];
}

- (void)updateWebPlacecardSuggestionViewWithViewModel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MUPlaceViewController *)self webPlacecardSectionController];
  id v6 = [v5 configuration];
  [v6 setUserARPSuggestion:v4];

  unint64_t v7 = [(MUPlaceViewController *)self userIcon];
  id v8 = [(MUPlaceViewController *)self webPlacecardSectionController];
  BOOL v9 = [v8 configuration];
  [v9 setUserIcon:v7];

  id v10 = [(MUPlaceViewController *)self webPlacecardSectionController];
  [v10 updateUserData];
}

- (void)updateCollectionViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MUPlaceViewController *)self personalGuidesSectionController];
  [v4 reloadCollectionsAnimated:v3];
}

- (void)updatePlaceInfo
{
  id v2 = [(MUPlaceViewController *)self placeInfoSectionController];
  [v2 refreshContents];
}

- (void)updatePlaceEnrichment
{
  id v2 = [(MUPlaceViewController *)self placeEnrichmentSectionController];
  [v2 refreshPlaceEnrichment];
}

- (void)setPlaceNumberOfReportsInReview:(unint64_t)a3
{
  self->_placeNumberOfReportsInReview = a3;
  id v4 = [(MUPlaceViewController *)self placeInfoSectionController];
  [v4 setPlaceNumberOfReportsInReview:a3];
}

- (void)setOfflineMapProvider:(id)a3
{
  p_offlineMapProvider = &self->_offlineMapProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_offlineMapProvider, v5);
  id v6 = [(MUPlaceViewController *)self unifiedActionRowSectionController];
  [v6 setOfflineMapProvider:v5];
}

- (void)setOfflineFeatureDiscoveryView:(id)a3
{
  objc_storeStrong((id *)&self->_offlineFeatureDiscoveryView, a3);
  id v5 = a3;
  id v6 = [(MUPlaceViewController *)self unifiedActionRowSectionController];
  [v6 setOfflineFeatureDiscoveryView:v5];
}

- (void)setLibraryAccessProvider:(id)a3
{
  id v4 = (MULibraryAccessProviding *)a3;
  [(MULibraryAccessProviding *)self->_libraryAccessProvider unregisterObserver:self];
  libraryAccessProvider = self->_libraryAccessProvider;
  self->_libraryAccessProvider = v4;
  id v6 = v4;

  [(MULibraryAccessProviding *)self->_libraryAccessProvider registerObserver:self];
  id v7 = [(MUPlaceViewController *)self notesSectionController];
  [v7 setLibraryAccessProvider:v6];
}

- (MKLookAroundView)lookAroundView
{
  return (MKLookAroundView *)[(MKLookAroundContainerView *)self->_lookAroundView lookAroundViewIfPresent];
}

- (id)lookAroundContainerForPlacePhotoSectionController:(id)a3
{
  if (!self->_lookAroundView)
  {
    id v4 = (MKLookAroundContainerView *)[objc_alloc(MEMORY[0x1E4F30F00]) initWithPhotosDimmingStyle:1];
    lookAroundView = self->_lookAroundView;
    self->_lookAroundView = v4;
  }
  id v6 = [(MUPlaceViewController *)self mapItem];
  [(MKLookAroundContainerView *)self->_lookAroundView setMapItem:v6];

  id v7 = self->_lookAroundView;
  return v7;
}

- (void)placePhotoSectionController:(id)a3 enterLookAroundForMapItem:(id)a4 lookAroundView:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v10 placeViewController:self enterLookAroundForMapItem:v11 lookAroundView:v7];
  }
}

- (void)performAction:(id)a3 options:(id)a4 completion:(id)a5
{
}

- (id)draggableContent
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_sectionControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v10 = objc_msgSend(v9, "draggableContent", (void)v13);
          if ([v10 count]) {
            [v3 addObjectsFromArray:v10];
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  id v11 = (void *)[v3 copy];
  return v11;
}

- (id)createMenuActions
{
  return (id)[(MUPlaceActionManager *)self->_actionManager createMenuActions];
}

- (UIView)draggableHeaderView
{
  id v2 = [(MUPlaceViewController *)self headerSectionController];
  id v3 = [v2 sectionView];

  return (UIView *)v3;
}

- (UIView)viewForHeaderContainmentString
{
  id v2 = [(MUPlaceViewController *)self headerSectionController];
  id v3 = [v2 viewForContainmentString];

  return (UIView *)v3;
}

- (UILayoutGuide)headerViewTitleLabelToTopLayoutGuide
{
  id v2 = [(MUPlaceViewController *)self headerSectionController];
  id v3 = [v2 headerViewTitleLabelToTopLayoutGuide];

  return (UILayoutGuide *)v3;
}

- (void)setVerifiedHeaderExpansionProgress:(double)a3
{
  if (self->_verifiedHeaderExpansionProgress != a3)
  {
    self->_verifiedHeaderExpansionProgress = a3;
    id v4 = [(MUPlaceViewController *)self headerSectionController];
    [v4 setCardExpansionProgress:self->_verifiedHeaderExpansionProgress];

    id v11 = objc_alloc_init(MUWebBasedPlacecardExpansionContext);
    uint64_t v5 = [NSNumber numberWithDouble:self->_verifiedHeaderExpansionProgress];
    [(MUWebBasedPlacecardExpansionContext *)v11 setProgress:v5];

    uint64_t v6 = NSNumber;
    uint64_t v7 = [(MUPlaceViewController *)self headerSectionController];
    [v7 verifiedBusinessHeaderHeight];
    id v8 = objc_msgSend(v6, "numberWithDouble:");
    [(MUWebBasedPlacecardExpansionContext *)v11 setHeight:v8];

    char v9 = [(MUPlaceViewController *)self webPlacecardSectionController];
    id v10 = [(MUWebBasedPlacecardExpansionContext *)v11 context];
    [v9 callBridgeMethod:@"handleCardExpansion" arguments:v10];
  }
}

- (void)performShareActionWithPresentationOptions:(id)a3
{
  id v4 = a3;
  id v6 = [(MUPlaceViewController *)self headerSectionController];
  uint64_t v5 = [v6 analyticsModule];
  [(MUPlaceViewController *)self _invokeShareActionWithPresentationOptions:v4 analyticsModuleMetadata:v5];
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_contentStackView;
}

+ (double)headerHeightInMinimalMode
{
  +[MUPlaceHeaderSectionController minimalModeHeight];
  return result;
}

- (void)hideTitle:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__MUPlaceViewController_hideTitle___block_invoke;
  v3[3] = &unk_1E574EFF8;
  v3[4] = self;
  BOOL v4 = a3;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v3 oldUIBlock:0];
}

void __35__MUPlaceViewController_hideTitle___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) headerSectionController];
  [v2 hideTitle:*(unsigned __int8 *)(a1 + 40)];
}

- (double)heightForContentAboveTitle
{
  id v2 = [(MUPlaceViewController *)self headerSectionController];
  [v2 verifiedBusinessHeaderHeight];
  double v4 = v3;

  return v4;
}

- (void)contentAboveTitleScrollPositionChanged:(double)a3
{
  id v4 = [(MUPlaceViewController *)self headerSectionController];
  [v4 verifiedBusinessHeaderScrollPositionChanged:a3];
}

- (void)setPlaceItem:(id)a3 updateOriginalContact:(BOOL)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__MUPlaceViewController_setPlaceItem_updateOriginalContact___block_invoke;
  v11[3] = &unk_1E574F048;
  v11[4] = self;
  id v12 = v6;
  BOOL v13 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__MUPlaceViewController_setPlaceItem_updateOriginalContact___block_invoke_2;
  v8[3] = &unk_1E574F048;
  v8[4] = self;
  id v9 = v12;
  BOOL v10 = a4;
  id v7 = v12;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v11 oldUIBlock:v8];
}

uint64_t __60__MUPlaceViewController_setPlaceItem_updateOriginalContact___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPlaceItem:*(void *)(a1 + 40) updateOriginalContact:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __60__MUPlaceViewController_setPlaceItem_updateOriginalContact___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setPlaceItem:*(void *)(a1 + 40) updateOriginalContact:*(unsigned __int8 *)(a1 + 48)];
}

- (double)currentHeight
{
  uint64_t v6 = 0;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  void v4[5] = &v6;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__MUPlaceViewController_currentHeight__block_invoke;
  v5[3] = &unk_1E574F020;
  v5[4] = self;
  void v5[5] = &v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __38__MUPlaceViewController_currentHeight__block_invoke_2;
  v4[3] = &unk_1E574F020;
  v4[4] = self;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v5 oldUIBlock:v4];
  double v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __38__MUPlaceViewController_currentHeight__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 992) contentSize];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __38__MUPlaceViewController_currentHeight__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 984) currentHeight];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)updateHeaderTitle
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __42__MUPlaceViewController_updateHeaderTitle__block_invoke;
  v2[3] = &unk_1E574EFD0;
  v2[4] = self;
  [(MUPlaceViewController *)self _performWithNewUIBlock:0 oldUIBlock:v2];
}

uint64_t __42__MUPlaceViewController_updateHeaderTitle__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) updateHeaderTitle];
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__MUPlaceViewController_scrollToTopAnimated___block_invoke;
  v5[3] = &unk_1E574EFF8;
  v5[4] = self;
  BOOL v6 = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__MUPlaceViewController_scrollToTopAnimated___block_invoke_2;
  v3[3] = &unk_1E574EFF8;
  v3[4] = self;
  BOOL v4 = a3;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v5 oldUIBlock:v3];
}

uint64_t __45__MUPlaceViewController_scrollToTopAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "_mapsui_scrollToTopAnimated:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __45__MUPlaceViewController_scrollToTopAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) scrollToTopAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (double)headerSecondaryNameLabelPadding
{
  uint64_t v5 = 0;
  BOOL v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__MUPlaceViewController_headerSecondaryNameLabelPadding__block_invoke;
  v4[3] = &unk_1E574F020;
  v4[4] = self;
  void v4[5] = &v5;
  [(MUPlaceViewController *)self _performWithNewUIBlock:0 oldUIBlock:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __56__MUPlaceViewController_headerSecondaryNameLabelPadding__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 984) headerSecondaryNameLabelPadding];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)_performWithNewUIBlock:(id)a3 oldUIBlock:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (self->_showNewUI)
  {
    id v6 = v8;
    if (!v8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (v6) {
LABEL_3:
  }
    (*((void (**)(void))v6 + 2))();
LABEL_4:
}

- (double)contentAlpha
{
  uint64_t v6 = 0;
  uint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x3FF0000000000000;
  void v4[5] = &v6;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MUPlaceViewController_contentAlpha__block_invoke;
  v5[3] = &unk_1E574F020;
  v5[4] = self;
  void v5[5] = &v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__MUPlaceViewController_contentAlpha__block_invoke_2;
  v4[3] = &unk_1E574F020;
  v4[4] = self;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v5 oldUIBlock:v4];
  double v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

double __37__MUPlaceViewController_contentAlpha__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 1056);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __37__MUPlaceViewController_contentAlpha__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 984) contentAlpha];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)setContentAlpha:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__MUPlaceViewController_setContentAlpha___block_invoke;
  v4[3] = &unk_1E574F0C0;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__MUPlaceViewController_setContentAlpha___block_invoke_2;
  v3[3] = &unk_1E574F0C0;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v4 oldUIBlock:v3];
}

uint64_t __41__MUPlaceViewController_setContentAlpha___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1056) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _updateContentAlpha];
}

uint64_t __41__MUPlaceViewController_setContentAlpha___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) setContentAlpha:*(double *)(a1 + 40)];
}

- (void)_updateContentAlpha
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v3 = self->_sectionControllers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * v7);
        uint64_t v9 = [(MUPlaceViewController *)self headerSectionController];

        if (v8 != v9)
        {
          long long v17 = 0u;
          long long v18 = 0u;
          long long v15 = 0u;
          long long v16 = 0u;
          BOOL v10 = objc_msgSend(v8, "sectionViews", 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              uint64_t v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setAlpha:self->_contentAlpha];
              }
              while (v12 != v14);
              uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v12);
          }
        }
        ++v7;
      }
      while (v7 != v5);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)relatedPlaceSectionController:(id)a3 showSeeAllWithTitle:(id)a4 relatedMapItems:(id)a5 originalMapItem:(id)a6
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    uint64_t v13 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v13 placeViewController:self showRelatedMapItems:v9 withTitle:v14 originalMapItem:v10 analyticsDelegate:self->_analyticsController];
  }
}

- (void)relatedPlaceSectionController:(id)a3 itemSelected:(id)a4
{
}

- (void)placePhotoSectionController:(id)a3 didSelectViewPhoto:(id)a4 withID:(id)a5 presentingViewController:(id)a6
{
  id v14 = a4;
  id v9 = a5;
  id v10 = a6;
  uint64_t v11 = [(MUPlaceViewController *)self mapItem];
  if ([v9 length])
  {
    char v12 = [v14 attribution];
    uint64_t v13 = [v12 urlsForPhotoWithIdentifier:v9];
    [(MUPlaceViewController *)self _presentStoreProductScreenWithMapItem:v11 attribution:v12 bundleIdentifier:v9 attributionURLs:v13 presentingViewController:v10];
  }
  else
  {
    [(MUPlaceViewController *)self placeCardActionControllerDidSelectViewAllPhotos:0 presentingViewController:v10];
  }
}

- (void)_presentStoreProductScreenWithMapItem:(id)a3 attribution:(id)a4 bundleIdentifier:(id)a5 attributionURLs:(id)a6 presentingViewController:(id)a7
{
  id v19 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  if (+[MUPlaceAttributionUtilities shouldPresentStoreProductViewControllerWithAttribution:v15])
  {
    long long v16 = [v15 appAdamID];
    long long v17 = [v15 providerID];

    +[MUPlaceAttributionUtilities presentStoreProductViewControllerWithAppAdamID:v16 bundleIdentifier:v17 presentingViewController:v14];
    [(MUPlaceCardAnalyticsController *)self->_analyticsController infoCardAnalyticsDidSelectAction:45 target:733 eventValue:v12 feedbackDelegateSelector:0 actionRichProviderId:0];
  }
  else
  {
    long long v18 = [(MUPlaceViewController *)self placeViewFeedbackAppLaunchHandler];
    [(MUPlaceViewController *)self _launchAttributionURLs:v13 withAttribution:v15 mapItem:v19 completionHandler:v18];
  }
}

- (void)placePhotoSectionControllerDidOpenFullscreenPhotos:(id)a3
{
  uint64_t v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidOpenFullscreenPhotos:self];
  }
}

- (void)placePhotoSectionControllerDidCloseFullscreenPhotos:(id)a3
{
  uint64_t v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidCloseFullscreenPhotos:self];
  }
}

- (void)placePhotoSectionController:(id)a3 didSelectPhotoToReport:(id)a4 withPhotoGalleryViewController:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  uint64_t v8 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v10 placeViewController:self didSelectPhotoToReport:v11 withPhotoGalleryViewController:v7];
  }
}

- (void)placePhotoSectionController:(id)a3 didSelectPhotoCategoryAtIndex:(unint64_t)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v14 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v14 placeViewController:self didSelectPhotoCategoryAtIndex:a4];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F30F08];
    char v9 = [(MUPlaceViewController *)self mapItem];
    v17[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    uint64_t v11 = *MEMORY[0x1E4F30D78];
    v15[0] = *MEMORY[0x1E4F30D50];
    v15[1] = v11;
    v16[0] = MEMORY[0x1E4F1CC38];
    id v12 = [NSNumber numberWithUnsignedInteger:a4];
    v16[1] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
    [v8 openMapsWithItems:v10 launchOptions:v13 completionHandler:0];
  }
}

- (void)placePhotoSectionController:(id)a3 requestsSceneActivationForPhotoGalleryViewController:(id)a4
{
  id v8 = a4;
  char v5 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v7 placeViewController:self didRequestSceneActivationForPhotoGalleryViewController:v8];
  }
}

- (void)ribbonSectionControllerDidTapAddRatings:(id)a3 initialRatingState:(int64_t)a4 withPresentationOptions:(id)a5
{
  id v10 = a5;
  char v7 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    char v9 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v9 placeViewController:self didSelectAddRatingsWithPresentationOptions:v10 overallState:a4 originTarget:@"PLACECARD_TITLE_CONTEXT"];
  }
}

- (void)ribbonSectionControllerDidTapHours:(id)a3
{
  id v6 = [(MUPlaceViewController *)self placeInfoSectionController];
  uint64_t v4 = [v6 hoursConfig];

  char v5 = v6;
  if (v6 && v4)
  {
    [v6 impressionsFrame];
    -[UIScrollView _mapsui_scrollToContentOffset:animated:](self->_contentStackView, "_mapsui_scrollToContentOffset:animated:", 1);
    char v5 = v6;
  }
}

- (void)routeToCuratedCollection:(id)a3
{
  id v4 = a3;
  char v5 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__MUPlaceViewController_routeToCuratedCollection___block_invoke;
    v8[3] = &unk_1E574ED68;
    objc_copyWeak(&v10, &location);
    v8[4] = self;
    id v9 = v4;
    [(MULockScreenCoordinator *)lockScreenCoordinator performActionIfSuccessfullyAuthenticated:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __50__MUPlaceViewController_routeToCuratedCollection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained mapsAppDelegate];
    [v3 placeViewController:*(void *)(a1 + 32) selectCuratedCollection:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (void)routeToGuidesHomeFromExploreGuides:(id)a3
{
  id v4 = a3;
  char v5 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__MUPlaceViewController_routeToGuidesHomeFromExploreGuides___block_invoke;
    v8[3] = &unk_1E574F110;
    objc_copyWeak(&v10, &location);
    id v9 = v4;
    [(MULockScreenCoordinator *)lockScreenCoordinator performActionIfSuccessfullyAuthenticated:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __60__MUPlaceViewController_routeToGuidesHomeFromExploreGuides___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v3 = [WeakRetained mapsAppDelegate];
    id v4 = [*(id *)(a1 + 32) guideLocation];
    [v3 placeViewController:v5 selectExploreGuidesWithGuideLocation:v4];

    id WeakRetained = v5;
  }
}

- (void)showAllCollections:(id)a3 usingTitle:(id)a4 usingCollectionIds:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    objc_initWeak(&location, self);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74__MUPlaceViewController_showAllCollections_usingTitle_usingCollectionIds___block_invoke;
    v14[3] = &unk_1E574F138;
    objc_copyWeak(&v18, &location);
    v14[4] = self;
    id v15 = v8;
    id v16 = v9;
    id v17 = v10;
    [(MULockScreenCoordinator *)lockScreenCoordinator performActionIfSuccessfullyAuthenticated:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __74__MUPlaceViewController_showAllCollections_usingTitle_usingCollectionIds___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    uint64_t v3 = [WeakRetained mapsAppDelegate];
    [v3 placeViewController:*(void *)(a1 + 32) seeAllCollections:*(void *)(a1 + 40) usingTitle:*(void *)(a1 + 48) usingCollectionIds:*(void *)(a1 + 56)];

    id WeakRetained = v4;
  }
}

- (id)collectionViews
{
  uint64_t v3 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlaceViewController *)self mapsAppDelegate];
    char v6 = [v5 placeViewController:self collectionViewsForPlaceItem:self->_placeItem];
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

- (void)collectionIdentifierSelected:(id)a3
{
  id v7 = a3;
  char v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewController:self selectCollectionIdentifier:v7];
  }
}

- (id)webPlacecardGuides
{
  uint64_t v3 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(MUPlaceViewController *)self mapsAppDelegate];
    char v6 = [v5 placeViewController:self webPlacecardGuidesForPlaceItem:self->_placeItem];
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

- (UIImage)userIcon
{
  uint64_t v3 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(MUPlaceViewController *)self mapsAppDelegate];
    char v6 = [v5 placeViewControllerUserIcon:self];
  }
  else
  {
    char v6 = 0;
  }
  return (UIImage *)v6;
}

- (void)_showEditSheet:(id)a3
{
  id v10 = [(MUPlaceViewController *)self _contactForEditOperations];
  char v4 = [MEMORY[0x1E4F1BBA8] viewControllerForContact:v10];
  [(CNContactViewController *)v4 setEditMode:2];
  [(CNContactViewController *)v4 setActions:[(CNContactViewController *)v4 actions] | 0x100];
  [(CNContactViewController *)v4 setDisplayMode:1];
  [(CNContactViewController *)v4 setDelegate:self];
  editingContactController = self->_editingContactController;
  self->_editingContactController = v4;
  char v6 = v4;

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  [v7 setModalPresentationStyle:2];
  id v8 = objc_alloc_init(MEMORY[0x1E4F30F88]);
  id v9 = [MEMORY[0x1E4F643A8] moduleFromModuleType:1];

  [v8 setAnalyticsModuleMetadata:v9];
  [(MUPlaceViewController *)self _presentModalViewController:v7 withEnvironment:v8];
}

- (void)placeDescriptionSectionControllerDidTapAttribution:(id)a3
{
  id v5 = [(MUPlaceViewController *)self mapItem];
  char v4 = [v5 _encyclopedicInfoAttribution];
  [(MUPlaceViewController *)self _launchAttribution:v4 withMapItem:v5];
}

- (void)_launchAttribution:(id)a3 withMapItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [v7 attributionURLs];
  id v8 = [(MUPlaceViewController *)self placeViewFeedbackAppLaunchHandler];
  [(MUPlaceViewController *)self _launchAttributionURLs:v9 withAttribution:v7 mapItem:v6 completionHandler:v8];
}

- (void)placeSectionControllerDidUpdateContent:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  id v5 = MUGetPlaceCardLog();
  id v6 = v5;
  os_signpost_id_t initialAppearanceSignpostID = self->_initialAppearanceSignpostID;
  if (initialAppearanceSignpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, initialAppearanceSignpostID, "PlacecardUpdateContent", "", buf, 2u);
  }

  id v8 = MUGetPlaceCardLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138412546;
    id v33 = v4;
    __int16 v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1931EA000, v8, OS_LOG_TYPE_INFO, "%@ of type %@ requests update", buf, 0x16u);
  }
  v26 = v4;

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  char v12 = self->_sectionControllers;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v17 hasContent])
        {
          id v18 = [v17 sectionViews];
          uint64_t v19 = [v18 count];

          if (v19)
          {
            long long v20 = [v17 sectionViews];
            [v11 addObjectsFromArray:v20];
          }
        }
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  contentStackView = self->_contentStackView;
  long long v22 = (void *)[v11 copy];
  [(MUScrollableStackView *)contentStackView setArrangedSubviews:v22];

  [(MUPlaceViewController *)self _applyCustomSpacings];
  [(MUPlaceViewController *)self showContentIfLoaded];
  uint64_t v23 = MUGetPlaceCardLog();
  v24 = v23;
  os_signpost_id_t v25 = self->_initialAppearanceSignpostID;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1931EA000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PlacecardUpdateContent", "", buf, 2u);
  }
}

- (void)_applyCustomSpacings
{
  if (MapKitIdiomIsMacCatalyst())
  {
    id v7 = [(MUPlaceViewController *)self headerSectionController];
    uint64_t v3 = [(MUPlaceViewController *)self actionRowSectionController];
    if (v7)
    {
      if (v3)
      {
        NSUInteger v4 = [(NSArray *)self->_sectionControllers indexOfObject:v7];
        if (v4 + 1 == [(NSArray *)self->_sectionControllers indexOfObject:v3])
        {
          contentStackView = self->_contentStackView;
          id v6 = [v7 sectionView];
          [(MUScrollableStackView *)contentStackView setCustomSpacing:v6 afterView:8.0];
        }
      }
    }
  }
}

- (void)placeSectionControllerRequestsLayoutChange:(id)a3
{
  [(MUPlaceViewController *)self updatePreferredContentSize];
  NSUInteger v4 = [(MUPlaceViewController *)self placeViewControllerDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self placeViewControllerDelegate];
    [v6 placeViewControllerDidUpdateHeight:self];
  }
}

- (int)getPlaceCardTypeForAnalytics
{
  uint64_t v3 = [MUPlaceDataAvailability alloc];
  NSUInteger v4 = [(MUPlaceViewController *)self mapItem];
  char v5 = [(MUPlaceDataAvailability *)v3 initWithMapItem:v4 options:self->_options];

  id v6 = [(MUPlaceViewController *)self placeItem];
  id v7 = [v6 mapItem];
  char v8 = [v7 _hasFlyover];

  if (v8)
  {
    int v9 = 9;
  }
  else
  {
    id v10 = [(MUPlaceViewController *)self headerButtonsSectionController];
    uint64_t v11 = [v10 primaryButtonType];

    if (v11 == 2)
    {
      int v9 = 10;
    }
    else
    {
      char v12 = [v6 mapItem];
      char v13 = [v12 _hasTransit];

      if (v13)
      {
        int v9 = 7;
      }
      else if ([v6 options])
      {
        int v9 = 5;
      }
      else if (([v6 options] & 2) != 0)
      {
        int v9 = 3;
      }
      else
      {
        uint64_t v14 = [v6 mapItem];
        char v15 = [v14 _isMapItemTypeBrand];

        if (v15)
        {
          int v9 = 11;
        }
        else
        {
          BOOL v16 = [(MUPlaceDataAvailability *)v5 supportsBrowseCategory];
          id v17 = [v6 mapItem];
          id v18 = v17;
          if (v16)
          {
            int v9 = objc_msgSend(v17, "_browseCategory_placeCardType");
          }
          else if ([v17 _hasMUID])
          {
            int v9 = 2;
          }
          else
          {
            int v9 = 1;
          }
        }
      }
    }
  }

  return v9;
}

- (id)generateAvailableActionForAnalytics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSUInteger v4 = self->_sectionControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE414488, (void)v12))
        {
          id v10 = [v9 infoCardChildPossibleActions];
          if ([v10 count]) {
            [v3 addObjectsFromArray:v10];
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)generateUnactionableUIElementsForAnalytics
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSUInteger v4 = self->_sectionControllers;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE414488, (void)v12))
        {
          id v10 = [v9 infoCardChildUnactionableUIElements];
          if ([v10 count]) {
            [v3 addObjectsFromArray:v10];
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (int)defaultTargetForPlaceCardAnalytics
{
  return 201;
}

- (void)placeCardWillCloseFromClientType:(unint64_t)a3
{
}

- (int)currentUITargetForAnalytics
{
  return 201;
}

- (int)currentMapViewTargetForAnalytics
{
  return 501;
}

- (void)setAutomobileOptions:(id)a3
{
  uint64_t v5 = (GEOAutomobileOptions *)a3;
  if (self->_automobileOptions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_automobileOptions, a3);
    [(MKETAProvider *)self->_etaProvider setAutomobileOptions:self->_automobileOptions];
    uint64_t v5 = v6;
  }
}

- (void)setWalkingOptions:(id)a3
{
  uint64_t v5 = (GEOWalkingOptions *)a3;
  if (self->_walkingOptions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_walkingOptions, a3);
    [(MKETAProvider *)self->_etaProvider setWalkingOptions:self->_walkingOptions];
    uint64_t v5 = v6;
  }
}

- (void)setTransitOptions:(id)a3
{
  uint64_t v5 = (GEOTransitOptions *)a3;
  if (self->_transitOptions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_transitOptions, a3);
    [(MKETAProvider *)self->_etaProvider setTransitOptions:self->_transitOptions];
    uint64_t v5 = v6;
  }
}

- (void)setCyclingOptions:(id)a3
{
  uint64_t v5 = (GEOCyclingOptions *)a3;
  if (self->_cyclingOptions != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_cyclingOptions, a3);
    [(MKETAProvider *)self->_etaProvider setCyclingOptions:self->_cyclingOptions];
    uint64_t v5 = v6;
  }
}

- (void)setPlaceInCollections:(BOOL)a3
{
  self->_placeInCollections = a3;
  -[MUPlaceActionManager setPlaceInCollections:](self->_actionManager, "setPlaceInCollections:");
}

- (void)setPlaceInShortcuts:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL placeInShortcuts = a3;
  -[MUPlaceActionManager setPlaceInShortcuts:](self->_actionManager, "setPlaceInShortcuts:");
  if (v3)
  {
    BOOL placeInShortcuts = self->_placeInShortcuts;
    uint64_t v6 = [(MUPlaceViewController *)self webPlacecardSectionController];
    uint64_t v7 = [v6 configuration];
    [v7 setPlaceInShortcuts:placeInShortcuts];

    id v8 = [(MUPlaceViewController *)self webPlacecardSectionController];
    [v8 updateUserData];
  }
}

- (void)updateAddToLibraryActionState
{
  uint64_t v3 = [(MUPlaceViewController *)self libraryAccessProvider];
  if (v3
    && (NSUInteger v4 = (void *)v3,
        [(MUPlaceViewController *)self libraryAccessProvider],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 savedStateOfPlace],
        v5,
        v4,
        v6))
  {
    id v9 = [(MUPlaceViewController *)self libraryAccessProvider];
    if ([v9 savedStateOfPlace] == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    [(MUPlaceActionManager *)self->_actionManager setPlaceInLibrary:v7];
  }
  else
  {
    actionManager = self->_actionManager;
    [(MUPlaceActionManager *)actionManager setPlaceInLibrary:0];
  }
}

- (void)updateAddNoteActionState
{
  uint64_t v3 = [(MUPlaceViewController *)self libraryAccessProvider];
  if (v3
    && (NSUInteger v4 = (void *)v3,
        [(MUPlaceViewController *)self libraryAccessProvider],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 savedStateOfPlace],
        v5,
        v4,
        v6))
  {
    id v10 = [(MUPlaceViewController *)self libraryAccessProvider];
    uint64_t v7 = [v10 placeNote];
    if ([v7 length]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    [(MUPlaceActionManager *)self->_actionManager setPlaceHasNote:v8];
  }
  else
  {
    actionManager = self->_actionManager;
    [(MUPlaceActionManager *)actionManager setPlaceHasNote:0];
  }
}

- (void)_placeSectionController:(id)a3 didSelectPrimaryType:(unint64_t)a4 withPresentationOptions:(id)a5
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [v9 sourceView];
  switch(a4)
  {
    case 1uLL:
      uint64_t v11 = v8;
      uint64_t v12 = 6003;
      uint64_t v13 = 12;
      goto LABEL_8;
    case 2uLL:
      uint64_t v11 = v8;
      uint64_t v12 = 3001;
      goto LABEL_7;
    case 3uLL:
      id v14 = objc_alloc_init(MEMORY[0x1E4F30F88]);
      [v14 setSourceView:v10];
      long long v15 = [v8 analyticsModule];
      [v14 setAnalyticsModuleMetadata:v15];

      BOOL v16 = [(MUPlaceViewController *)self mapsAppDelegate];
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        objc_initWeak(&location, self);
        id v18 = [(MUPlaceViewController *)self mapsAppDelegate];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __94__MUPlaceViewController__placeSectionController_didSelectPrimaryType_withPresentationOptions___block_invoke_2;
        v34[3] = &unk_1E574F1A8;
        objc_copyWeak(&v36, &location);
        id v35 = v14;
        [v18 placeViewController:self didSelectShareCurrentLocationWithCompletion:v34];

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
      }
      else
      {
        [(MUPlaceViewController *)self _showShareSheetWithEnvironment:v14];
      }

      goto LABEL_18;
    case 4uLL:
      uint64_t v11 = v8;
      uint64_t v12 = 6097;
LABEL_7:
      uint64_t v13 = 0;
LABEL_8:
      [v11 captureInfoCardAction:v12 eventValue:0 feedbackType:v13];
      uint64_t v19 = [(MUPlaceViewController *)self mapsAppDelegate];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        long long v21 = [(MUPlaceViewController *)self mapsAppDelegate];
        long long v22 = [(MKETAProvider *)self->_etaProvider transportTypePreferenceNumber];
        [v21 placeViewController:self didSelectRouteToCurrentSearchResultWithTransportTypePreference:v22];

LABEL_12:
        goto LABEL_18;
      }
      uint64_t v23 = [(MUPlaceViewController *)self placeViewControllerDelegate];
      char v24 = objc_opt_respondsToSelector();

      if (v24)
      {
        long long v21 = [(MUPlaceViewController *)self placeViewControllerDelegate];
        [v21 placeViewControllerDidSelectDirectionsToAddress:self];
        goto LABEL_12;
      }
      os_signpost_id_t v25 = [(MUPlaceViewController *)self mapItem];

      if (v25)
      {
        if ((self->_options & 0x100000000) != 0)
        {
          uint64_t v31 = [(MUPlaceViewController *)self mapItem];
          uint64_t v32 = *MEMORY[0x1E4F30D88];
          v42[0] = *MEMORY[0x1E4F31130];
          v42[1] = v32;
          v43[0] = MEMORY[0x1E4F1CC38];
          v43[1] = &unk_1EE4047F0;
          id v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __94__MUPlaceViewController__placeSectionController_didSelectPrimaryType_withPresentationOptions___block_invoke;
          v38[3] = &unk_1E574F160;
          v38[4] = self;
          [v31 openInMapsWithLaunchOptions:v33 completionHandler:v38];
        }
        else
        {
          v26 = (void *)MEMORY[0x1E4F30F08];
          long long v27 = [MEMORY[0x1E4F30F08] mapItemForCurrentLocation];
          v41[0] = v27;
          long long v28 = [(MUPlaceViewController *)self mapItem];
          v41[1] = v28;
          long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:2];
          uint64_t v39 = *MEMORY[0x1E4F30D48];
          uint64_t v40 = *MEMORY[0x1E4F30D40];
          long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
          [v26 openMapsWithItems:v29 launchOptions:v30 completionHandler:&__block_literal_global_320];
        }
      }
LABEL_18:

      return;
    default:
      goto LABEL_18;
  }
}

void __94__MUPlaceViewController__placeSectionController_didSelectPrimaryType_withPresentationOptions___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = MUGetPlaceCardLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) mapItem];
      uint64_t v7 = [v6 name];
      int v9 = 138412290;
      id v10 = v7;
      id v8 = "Successfully launched Maps in SAR mode for mapItem: %@";
LABEL_6:
      _os_log_impl(&dword_1931EA000, v4, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 32) mapItem];
    uint64_t v7 = [v6 name];
    int v9 = 138412290;
    id v10 = v7;
    id v8 = "Failed to launched Maps in SAR mode for mapItem: %@";
    goto LABEL_6;
  }
}

void __94__MUPlaceViewController__placeSectionController_didSelectPrimaryType_withPresentationOptions___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v4 = WeakRetained;
      [WeakRetained _showShareSheetWithEnvironment:*(void *)(a1 + 32)];
      id WeakRetained = v4;
    }
  }
}

- (void)_showShareSheetWithEnvironment:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  lockScreenCoordinator = self->_lockScreenCoordinator;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MUPlaceViewController__showShareSheetWithEnvironment___block_invoke;
  v7[3] = &unk_1E574F110;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(MULockScreenCoordinator *)lockScreenCoordinator performActionIfSuccessfullyAuthenticated:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __56__MUPlaceViewController__showShareSheetWithEnvironment___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _showShareSheetNoDeviceLockCheckWithEnvironment:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_showShareSheetNoDeviceLockCheckWithEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_currentEnvironmentForPresentedViewController, a3);
  id v5 = a3;
  id v9 = objc_alloc_init(MUPresentationOptions);
  [(MUPresentationOptions *)v9 setPresentingViewController:self];
  id v6 = [v5 sourceView];
  [(MUPresentationOptions *)v9 setSourceView:v6];

  uint64_t v7 = [[MUShareSheetPresenter alloc] initWithPlaceItem:self->_placeItem presentationOptions:v9];
  shareSheetPresenter = self->_shareSheetPresenter;
  self->_shareSheetPresenter = v7;

  [(MUShareSheetPresenter *)self->_shareSheetPresenter setDelegate:self];
  [(MUShareSheetPresenter *)self->_shareSheetPresenter present];
}

- (void)placeActionManager:(id)a3 didSelectShareWithEnvironment:(id)a4
{
}

- (void)placeCardActionControllerDidSelectReportAProblem:(id)a3 fromView:(id)a4 isQuickAction:(BOOL)a5
{
  BOOL v5 = a5;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v10 placeViewControllerDidSelectReportAProblem:self fromView:v7 isQuickAction:v5];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F30F08];
    uint64_t v12 = [(MUPlaceViewController *)self mapItem];
    uint64_t v16 = *MEMORY[0x1E4F30D58];
    v17[0] = MEMORY[0x1E4F1CC38];
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v14 = [v11 urlForMapItem:v12 options:v13];

    long long v15 = [MEMORY[0x1E4F31038] sharedInstance];
    [v15 openURL:v14 completionHandler:0];
  }
}

- (void)placeCardActionControllerDidSelectPlaceEnrichementReportAProblem
{
  id v3 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v5 placeViewControllerDidSelectPlaceEnrichmentRAP:self];
  }
}

- (void)placeActionManager:(id)a3 didSelectDirectionsWithEnvironment:(id)a4
{
  objc_msgSend(a4, "analyticsModuleMetadata", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if ([v7 type] == 40) {
    [(MUPlaceViewController *)self placeEnrichmentSectionController];
  }
  else {
  id v5 = [(MUPlaceViewController *)self placeInfoSectionController];
  }
  id v6 = objc_opt_new();
  [(MUPlaceViewController *)self _placeSectionController:v5 didSelectPrimaryType:1 withPresentationOptions:v6];
}

- (void)placeActionManager:(id)a3 didSelectAddToGuidesWithEnvironment:(id)a4
{
  id v8 = a4;
  id v5 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v7 placeViewController:self didSelectAddToCollectionWithPlaceActionEnvironment:v8];
  }
}

- (void)placeActionManager:(id)a3 didSelectAddOrRemoveFromLibraryWithEnvironment:(id)a4 selectedAdd:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v9 placeViewController:self didRequestAddOrRemovePlaceFromLibrary:v5];
  }
}

- (void)placeActionManager:(id)a3 didSelectAddOrEditNoteWithEnvironment:(id)a4 selectedAdd:(BOOL)a5
{
  char v6 = [(MUPlaceViewController *)self libraryAccessProvider];

  if (v6)
  {
    id v7 = [(MUPlaceViewController *)self mapsAppDelegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v12 = [(MUPlaceViewController *)self mapsAppDelegate];
      id v9 = [(MUPlaceViewController *)self libraryAccessProvider];
      id v10 = [v9 placeNote];
      uint64_t v11 = [(MUPlaceViewController *)self libraryAccessProvider];
      [v12 placeViewController:self didRequestEditingNoteWithInitialText:v10 libraryAccessProvider:v11 completion:&__block_literal_global_336];
    }
  }
}

- (void)placeCardActionController:(id)a3 openURL:(id)a4 fromView:(id)a5
{
}

- (void)placeActionManager:(id)a3 didSelectAddToContactsUsingEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v10 placeViewControllerDidSelectAddToContacts:self];
  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke;
    aBlock[3] = &unk_1E574F110;
    objc_copyWeak(&v18, &location);
    id v17 = v7;
    uint64_t v11 = _Block_copy(aBlock);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_4;
    v14[3] = &unk_1E574EEA8;
    id v13 = v11;
    id v15 = v13;
    [(MULockScreenCoordinator *)lockScreenCoordinator performActionIfSuccessfullyAuthenticated:v14];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke(uint64_t a1)
{
  double v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = [WeakRetained contact];
    id v6 = [v4 contactStore];
    int v7 = [v6 hasContactAccess];

    char v8 = [v4 contactStore];
    if (v7)
    {
      char v9 = [v5 identifier];
      uint64_t v10 = MEMORY[0x1E4F14428];
      id v11 = MEMORY[0x1E4F14428];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_2;
      v19[3] = &unk_1E574F1F0;
      id v12 = &v22;
      objc_copyWeak(&v22, v2);
      id v20 = v5;
      id v21 = *(id *)(a1 + 32);
      [v8 fetchUnifiedContactForIdentifier:v9 callbackQueue:v10 completion:v19];
      id v13 = &v20;

      char v8 = v21;
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      void v16[2] = __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_3;
      v16[3] = &unk_1E574F218;
      id v12 = &v18;
      objc_copyWeak(&v18, v2);
      id v17 = *(id *)(a1 + 32);
      [v8 removeMapsDataFromContact:v5 callbackQueue:v14 completion:v16];
      id v13 = &v17;
    }
    objc_destroyWeak(v12);
  }
}

void __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v6 = a3;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 48));
  char v8 = WeakRetained;
  if (WeakRetained)
  {
    char v9 = WeakRetained + 145;
    objc_storeStrong(WeakRetained + 145, a2);
    if (v6 && [v6 code] == 200)
    {
      uint64_t v10 = [*(id *)(a1 + 32) copy];
      id v11 = *v9;
      void *v9 = (void *)v10;
    }
    [v8 _presentAddNewContactPickerForContact:*(void *)(a1 + 32) withEnvironment:*(void *)(a1 + 40)];
  }
}

void __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _presentAddNewContactPickerForContact:v5 withEnvironment:*(void *)(a1 + 32)];
  }
}

uint64_t __83__MUPlaceViewController_placeActionManager_didSelectAddToContactsUsingEnvironment___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_presentAddNewContactPickerForContact:(id)a3 withEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [MEMORY[0x1E4F1BBA8] viewControllerForNewContact:v6];
  [v8 setDisplayMode:1];
  [v8 setDelegate:self];
  objc_storeStrong((id *)&self->_creatingContactController, v8);
  char v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
  [v9 setModalPresentationStyle:2];
  uint64_t v10 = [MEMORY[0x1E4F31038] sharedInstance];
  if (![v10 userInterfaceIdiom])
  {
LABEL_8:

    goto LABEL_9;
  }
  char IsMacCatalyst = MapKitIdiomIsMacCatalyst();

  if ((IsMacCatalyst & 1) == 0)
  {
    [v9 setModalPresentationStyle:7];
    uint64_t v10 = [v9 popoverPresentationController];
    id v12 = [v7 sourceView];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 setBarButtonItem:v12];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 setSourceView:v12];
        [v12 bounds];
        objc_msgSend(v10, "setSourceRect:");
      }
    }
    [v10 setPermittedArrowDirections:15];

    goto LABEL_8;
  }
LABEL_9:
  if (MapKitIdiomIsMacCatalyst()
    && ([(MUPlaceViewController *)self placeViewControllerDelegate],
        id v13 = objc_claimAutoreleasedReturnValue(),
        char v14 = objc_opt_respondsToSelector(),
        v13,
        (v14 & 1) != 0))
  {
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    void v15[2] = __79__MUPlaceViewController__presentAddNewContactPickerForContact_withEnvironment___block_invoke;
    v15[3] = &unk_1E574F110;
    objc_copyWeak(&v17, &location);
    id v16 = v9;
    [(MUPlaceViewController *)self dismissViewControllerAnimated:1 completion:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MUPlaceViewController *)self _presentModalViewController:v9 withEnvironment:v7];
  }
}

void __79__MUPlaceViewController__presentAddNewContactPickerForContact_withEnvironment___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained mapsAppDelegate];
    [v3 placeViewControllerPresentContactsController:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

- (void)placeCardActionControllerDidSelectAddToMapsHome:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectAddShortcut:self];
  }
}

- (void)placeCardActionControllerDidSelectRemoveFromMapsHome:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectRemoveShortcut:self];
  }
}

- (void)placeCardActionControllerDidSelectRefineLocation:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectRefineLocation:self];
  }
}

- (void)placeCardActionControllerDidSelectChangeAddress:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectChangeAddress:self];
  }
}

- (void)placeCardActionControllerDidSelectAddPhoto:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5
{
  id v9 = a5;
  id v7 = a4;
  char v8 = objc_alloc_init(MUPresentationOptions);
  [(MUPresentationOptions *)v8 setSourceView:v9];
  [(MUPresentationOptions *)v8 setPresentingViewController:v7];

  if ([v9 conformsToProtocol:&unk_1EE42BC20]) {
    [(MUPresentationOptions *)v8 setProgressObserver:v9];
  }
  [(MUPlaceViewController *)self presentAddPhotosWithPresentationOptions:v8 entryPoint:0 originTarget:0];
}

- (void)placeActionManager:(id)a3 didSelectAddToExistingContactWithEnvironment:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [v7 sourceView];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MUPlaceViewController_placeActionManager_didSelectAddToExistingContactWithEnvironment___block_invoke;
  aBlock[3] = &unk_1E574ED68;
  objc_copyWeak(&v20, &location);
  id v9 = v8;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  id v11 = _Block_copy(aBlock);
  lockScreenCoordinator = self->_lockScreenCoordinator;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__MUPlaceViewController_placeActionManager_didSelectAddToExistingContactWithEnvironment___block_invoke_2;
  v14[3] = &unk_1E574F240;
  objc_copyWeak(&v16, &location);
  id v13 = v11;
  id v15 = v13;
  [(MULockScreenCoordinator *)lockScreenCoordinator performActionIfSuccessfullyAuthenticated:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __89__MUPlaceViewController_placeActionManager_didSelectAddToExistingContactWithEnvironment___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    id v3 = objc_alloc_init(MEMORY[0x1E4F1BB80]);
    [v3 setDelegate:v11];
    id v4 = [v11 contactStore];
    if ([v4 hasContactAccess]) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [v3 setMode:v5];

    id v6 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    [v3 setPredicateForSelectionOfContact:v6];

    [v3 setModalPresentationStyle:2];
    id v7 = [MEMORY[0x1E4F31038] sharedInstance];
    int v8 = [v7 userInterfaceIdiom];

    if (v8)
    {
      [v3 setModalPresentationStyle:7];
      id v9 = [v3 popoverPresentationController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v9 setBarButtonItem:*(void *)(a1 + 32)];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 setSourceView:*(void *)(a1 + 32)];
          [*(id *)(a1 + 32) bounds];
          objc_msgSend(v9, "setSourceRect:");
        }
      }
      [v9 setPermittedArrowDirections:15];
    }
    [v3 setAutocloses:0];
    [v11 _presentModalViewController:v3 withEnvironment:*(void *)(a1 + 40)];
    id v10 = [v11 contact];
    [v3 scrollToClosestContactMatching:v10];

    id WeakRetained = v11;
  }
}

void __89__MUPlaceViewController_placeActionManager_didSelectAddToExistingContactWithEnvironment___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

- (void)placeCardActionControllerDidSelectRemoveMarker:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectRemoveMarker:self];
  }
}

- (void)placeCardActionControllerDidSelectReportAProblemAddNewPlace:(id)a3 isQuickAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v8 placeViewControllerDidSelectAddAPlace:self isQuickAction:v4];
  }
}

- (void)placeCardActionControllerDidSelectReportAProblemViewReport:(id)a3
{
  BOOL v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectRAPViewReport:self];
  }
}

- (void)placeCardActionControllerDidSelectDownloadOffline:(id)a3 isQuickAction:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v8 placeViewControllerDidSelectDownloadOffline:self isQuickAction:v4];
  }
}

- (void)placeCardActionControllerDidSelectPauseOfflineDownload:(id)a3
{
  BOOL v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectPauseOfflineDownload:self];
  }
}

- (void)placeCardActionControllerDidSelectOfflineManagement:(id)a3
{
  BOOL v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidSelectOfflineManagement:self];
  }
}

- (void)placeCardActionControllerDidRequestCopy:(id)a3
{
  BOOL v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidRequestCopy:self];
  }
}

- (void)placeCardActionControllerDidSelectSimulateLocation:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F64860], "sharedPlatform", a3);
  int v5 = [v4 isInternalInstall];

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapItem];
    [v6 _coordinate];
    double v8 = v7;
    double v10 = v9;

    if (v10 >= -180.0 && v10 <= 180.0 && v8 >= -90.0 && v8 <= 90.0)
    {
      if (objc_msgSend(MEMORY[0x1E4F64670], "isLocationShiftRequiredForCoordinate:", v8, v10)) {
        int v11 = 2;
      }
      else {
        int v11 = 1;
      }
      id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      int v20 = 0;
      double v21 = v8;
      double v22 = v10;
      uint64_t v23 = 0x4014000000000000;
      long long v24 = 0u;
      long long v25 = 0u;
      __asm { FMOV            V0.2D, #-1.0 }
      long long v26 = _Q0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0x100000000;
      double v30 = v8;
      double v31 = v10;
      uint64_t v32 = 0;
      uint64_t v33 = 0;
      int v34 = v11;
      int v35 = v11;
      uint64_t v37 = 0;
      uint64_t v36 = 0;
      id v18 = (void *)[v12 initWithClientLocation:&v20];
      id v19 = objc_alloc_init(MEMORY[0x1E4F1E658]);
      [v19 setLocationRepeatBehavior:1];
      [v19 clearSimulatedLocations];
      [v19 appendSimulatedLocation:v18];
      [v19 startLocationSimulation];
    }
  }
}

- (void)placeCardActionControllerDidSelectCreateCustomRoute:(id)a3
{
  BOOL v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidTapHikingTip:self];
  }
}

- (void)pictureItemSectionController:(id)a3 requestsSceneActivationWithPhotoGallery:(id)a4
{
  id v8 = a4;
  char v5 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v7 placeViewController:self didRequestSceneActivationForPhotoGalleryViewController:v8];
  }
}

- (void)browseCategorySectionController:(id)a3 didTapOnSearchCategory:(id)a4
{
  id v8 = a4;
  char v5 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v7 placeViewController:self didSelectSearchCategory:v8];
  }
}

- (void)placePhotoSectionControllerRequestsToOpenThumbnailGallery:(id)a3 withStartingIndex:(unint64_t)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  char v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v12 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v12 placeViewControllerDidSelectSeeMorePhotos:self withStartingIndex:a4];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F30F08];
    double v9 = [(MUPlaceViewController *)self mapItem];
    v15[0] = v9;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    uint64_t v13 = *MEMORY[0x1E4F30D50];
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v8 openMapsWithItems:v10 launchOptions:v11 completionHandler:0];
  }
}

- (void)placePhotoSectionController:(id)a3 requestsToOpenPhotoAttribution:(id)a4 presentationOptions:(id)a5
{
  id v13 = a5;
  id v7 = a4;
  id v8 = [v13 presentingViewController];

  if (!v8) {
    [v13 setPresentingViewController:self];
  }
  double v9 = [(MUPlaceViewController *)self mapItem];
  double v10 = [v7 providerID];
  int v11 = [v7 attributionURLs];
  id v12 = [v13 presentingViewController];
  [(MUPlaceViewController *)self _presentStoreProductScreenWithMapItem:v9 attribution:v7 bundleIdentifier:v10 attributionURLs:v11 presentingViewController:v12];
}

- (void)placePhotoSectionController:(id)a3 requestsAddPhotosToMapsWithEntryPoint:(int64_t)a4 options:(id)a5
{
  id v8 = a5;
  id v7 = [v8 presentingViewController];

  if (!v7) {
    [v8 setPresentingViewController:self];
  }
  [(MUPlaceViewController *)self presentAddPhotosWithPresentationOptions:v8 entryPoint:a4 originTarget:@"PLACECARD_PHOTO_VIEWER_GALLERY"];
}

- (BOOL)transitDeparturesSectionController:(id)a3 canSelectDepartureSequence:(id)a4 usingMapItem:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  double v9 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    int v11 = [(MUPlaceViewController *)self mapsAppDelegate];
    char v12 = [v11 placeViewController:self canSelectDepartureSequence:v7 mapItem:v8];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)transitDeparturesSectionController:(id)a3 didSelectConnectionInformation:(id)a4
{
  id v5 = a4;
  char v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v9 placeViewController:self didSelectTransitConnectionInformation:v5];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F31038] sharedInstance];
    uint64_t v8 = [v5 urlToOpen];

    [v9 openURL:v8 completionHandler:0];
    id v5 = (id)v8;
  }
}

- (void)transitDeparturesSectionController:(id)a3 didSelectDepartureSequence:(id)a4 usingMapItem:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  uint64_t v8 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v10 placeViewController:self didSelectDepartureSequence:v11 mapItem:v7];
  }
}

- (void)transitDeparturesSectionController:(id)a3 didSelectTransitLine:(id)a4 usingPresentationOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    if (MapKitIdiomIsMacCatalyst())
    {
      id v16 = [(MUPlaceViewController *)self mapsAppDelegate];
      [v16 placeViewController:self didSelectTransitLine:v11];
    }
    else
    {
      id v16 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
      id v17 = [v12 sourceView];
      id v18 = [v16 popoverPresentationController];
      [v18 setSourceView:v17];

      [v12 sourceRect];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      uint64_t v27 = [v16 popoverPresentationController];
      objc_msgSend(v27, "setSourceRect:", v20, v22, v24, v26);

      objc_initWeak(location, self);
      uint64_t v28 = (void *)MEMORY[0x1E4FB1410];
      uint64_t v29 = _MULocalizedStringFromThisBundle(@"View on Map [Placecard]");
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      void v41[2] = __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke;
      v41[3] = &unk_1E574F268;
      objc_copyWeak(&v43, location);
      id v42 = v11;
      int v35 = [v28 actionWithTitle:v29 style:0 handler:v41];

      double v30 = (void *)MEMORY[0x1E4FB1410];
      double v31 = _MULocalizedStringFromThisBundle(@"Cancel [Placeecard]");
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke_2;
      v38[3] = &unk_1E574F290;
      objc_copyWeak(&v40, location);
      id v39 = v13;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke_3;
      v36[3] = &unk_1E574F2B8;
      id v37 = v39;
      uint64_t v32 = [v30 _actionWithTitle:v31 image:0 style:1 handler:v38 shouldDismissHandler:v36];

      [v16 addAction:v35];
      [v16 addAction:v32];
      id v33 = objc_alloc_init(MEMORY[0x1E4F30F88]);
      int v34 = [MEMORY[0x1E4F643A8] moduleFromModuleType:6];
      [v33 setAnalyticsModuleMetadata:v34];

      [(MUPlaceViewController *)self _presentModalViewController:v16 withEnvironment:v33];
      objc_destroyWeak(&v40);

      objc_destroyWeak(&v43);
      objc_destroyWeak(location);
    }
  }
}

void __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v4 = WeakRetained;
    [WeakRetained[177] infoCardAnalyticsDidSelectAction:7004 eventValue:0 feedbackDelegateSelector:0];
    id v3 = [v4 mapsAppDelegate];
    [v3 placeViewController:v4 didSelectTransitLine:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

void __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[177] infoCardAnalyticsDidSelectAction:7005 eventValue:0 feedbackDelegateSelector:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

uint64_t __117__MUPlaceViewController_transitDeparturesSectionController_didSelectTransitLine_usingPresentationOptions_completion___block_invoke_3(uint64_t a1)
{
  return 1;
}

- (void)transitDeparturesSectionController:(id)a3 showIncidents:(id)a4
{
  id v5 = a4;
  char v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v12 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v12 placeViewController:self showTransitIncidents:v5];
  }
  else
  {
    id v12 = (id)[objc_alloc(MEMORY[0x1E4F30EC8]) initWithTransitIncidents:v5];

    id v5 = (id)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v12];
    [v5 setModalPresentationStyle:-2];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__dismissModalViewController];
    char v9 = [v12 navigationItem];
    [v9 setLeftBarButtonItem:v8];

    id v10 = objc_alloc_init(MEMORY[0x1E4F30F88]);
    id v11 = [MEMORY[0x1E4F643A8] moduleFromModuleType:6];
    [v10 setAnalyticsModuleMetadata:v11];

    [(MUPlaceViewController *)self _presentModalViewController:v5 withEnvironment:v10];
  }
}

- (void)transitDeparturesSectionController:(id)a3 didSelectAttribution:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "url", a3);
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v8 = v5;
    char v7 = [MEMORY[0x1E4F1CB10] URLWithString:v5];
    [(MUPlaceViewController *)self _openWebURL:v7 forcePunchout:0];

    uint64_t v6 = v8;
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (id)_traits
{
  id v3 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v5 traitsForPlaceViewController:self];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F30F28] sharedService];
    [v5 defaultTraits];
  uint64_t v6 = };

  return v6;
}

- (void)_presentModalViewController:(id)a3 withEnvironment:(id)a4
{
  objc_storeStrong((id *)&self->_currentEnvironmentForPresentedViewController, a4);
  id v6 = a3;
  [(MUPlaceViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)_dismissModalViewController
{
  LODWORD(v7) = 0;
  [(MUPlaceCardAnalyticsController *)self->_analyticsController infoCardAnalyticsDidSelectAction:4 target:628 eventValue:0 actionURL:0 photoID:0 moduleMetadata:0 feedbackDelegateSelector:v7 actionRichProviderId:0];
  uint64_t v3 = [(MUPlaceViewController *)self presentedViewController];
  if (v3)
  {
    id v8 = (id)v3;
    char v4 = [(MUPlaceViewController *)self presentedViewController];
    if ([v4 isBeingDismissed])
    {
    }
    else
    {
      uint64_t v5 = [(MUPlaceViewController *)self presentedViewController];
      char v6 = [v5 isBeingPresented];

      if ((v6 & 1) == 0)
      {
        [(MUPlaceViewController *)self dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v7 = a3;
  [(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator logImpressions];
  char v4 = [(MUPlaceViewController *)self scrollViewDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MUPlaceViewController *)self scrollViewDelegate];
    [v6 scrollViewDidScroll:v7];
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v9 = a3;
  [v9 contentOffset];
  self->_beginAnalyticsScrollingPoint.x = v4;
  self->_beginAnalyticsScrollingPoint.y = v5;
  char v6 = [(MUPlaceViewController *)self scrollViewDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MUPlaceViewController *)self scrollViewDelegate];
    [v8 scrollViewWillBeginDragging:v9];
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v12 = a3;
  -[MUPlaceCardAnalyticsController instrumentVerticalScrollWithBeginningPoint:targetContentOffset:velocity:](self->_analyticsController, "instrumentVerticalScrollWithBeginningPoint:targetContentOffset:velocity:", a5, self->_beginAnalyticsScrollingPoint.x, self->_beginAnalyticsScrollingPoint.y, x, y);
  id v9 = [(MUPlaceViewController *)self scrollViewDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(MUPlaceViewController *)self scrollViewDelegate];
    objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);
  }
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  char v6 = (CNContactViewController *)a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_editingContactController == v6)
  {
    if (v7)
    {
      objc_initWeak(&location, self);
      id v9 = [(MUPlaceViewController *)self contactStore];
      uint64_t v10 = MEMORY[0x1E4F14428];
      id v11 = MEMORY[0x1E4F14428];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke;
      v30[3] = &unk_1E574F218;
      objc_copyWeak(&v32, &location);
      double v31 = v6;
      [v9 removeMapsDataFromContact:v8 callbackQueue:v10 completion:v30];

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
    goto LABEL_9;
  }
  if (!v7)
  {
LABEL_6:
    [(MUPlaceCardAnalyticsController *)self->_analyticsController infoCardAnalyticsDidSelectAction:4 target:624 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
LABEL_9:
    [(MUPlaceViewController *)self _tearDownContactPickersForCompletionWithViewController:v6];
    goto LABEL_10;
  }
  [(MUPlaceCardAnalyticsController *)self->_analyticsController infoCardAnalyticsDidSelectAction:17 target:624 eventValue:0 feedbackDelegateSelector:0 actionRichProviderId:0];
  if (self->_creatingContactController != v6)
  {
    if (self->_updatingContactController != v6)
    {
      [(MUPlaceViewController *)self setShowContactActions:1];
      [(MUPlaceViewController *)self _tearDownContactPickersForCompletionWithViewController:v6];
      goto LABEL_6;
    }
    objc_initWeak(&location, self);
    double v20 = [(MUPlaceViewController *)self contactStore];
    uint64_t v21 = MEMORY[0x1E4F14428];
    id v22 = MEMORY[0x1E4F14428];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_4;
    v23[3] = &unk_1E574F218;
    id v17 = &v25;
    objc_copyWeak(&v25, &location);
    double v24 = v6;
    [v20 removeMapsDataFromContact:v8 callbackQueue:v21 completion:v23];

    double v19 = v24;
LABEL_15:

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
    goto LABEL_10;
  }
  id v12 = [(MUPlaceViewController *)self contactStore];
  if (![v12 hasContactAccess])
  {

    goto LABEL_10;
  }
  originalContactCopdouble y = self->_originalContactCopy;

  if (originalContactCopy)
  {
    objc_initWeak(&location, self);
    uint64_t v14 = [(MUPlaceViewController *)self contactStore];
    uint64_t v15 = MEMORY[0x1E4F14428];
    id v16 = MEMORY[0x1E4F14428];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_2;
    v26[3] = &unk_1E574F1F0;
    id v17 = &v29;
    objc_copyWeak(&v29, &location);
    id v18 = v6;
    uint64_t v27 = v18;
    uint64_t v28 = self;
    [v14 fetchContactForPickerDisplayUsingContact:v8 callbackQueue:v15 completion:v26];

    [(MUPlaceViewController *)self setShowContactActions:0];
    [(MUPlaceViewController *)self _tearDownContactPickersForCompletionWithViewController:v18];
    double v19 = v27;
    goto LABEL_15;
  }
LABEL_10:
}

void __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CGFloat v4 = WeakRetained;
  if (WeakRetained)
  {
    CGFloat v5 = (void *)*((void *)WeakRetained + 137);
    *((void *)WeakRetained + 137) = 0;

    [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
    char v6 = [v4 contactsNavigationController];
    id v7 = (id)[v6 popViewControllerAnimated:0];

    id v8 = [v4 contactsNavigationController];
    [v8 showCardForContact:v9 animated:0];

    [v4 _tearDownContactPickersForCompletionWithViewController:*(void *)(a1 + 32)];
  }
}

void __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6 || (objc_msgSend(WeakRetained[145], "_maps_isEqualToContact:", v5) & 1) != 0)
    {
      [v8 setShowContactActions:0];
      [v8 _tearDownContactPickersForCompletionWithViewController:a1[4]];
    }
    else
    {
      id v9 = [a1[5] contactStore];
      uint64_t v10 = MEMORY[0x1E4F14428];
      id v11 = MEMORY[0x1E4F14428];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_3;
      v12[3] = &unk_1E574F218;
      objc_copyWeak(&v14, a1 + 6);
      id v13 = a1[4];
      [v9 removeMapsDataFromContact:v5 callbackQueue:v10 completion:v12];

      objc_destroyWeak(&v14);
    }
  }
}

void __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 127, a2);
    [v5 setShowContactActions:0];
    [v5 _tearDownContactPickersForCompletionWithViewController:*(void *)(a1 + 32)];
  }
}

void __70__MUPlaceViewController_contactViewController_didCompleteWithContact___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setShowContactActions:1];
    [v3 _tearDownContactPickersForCompletionWithViewController:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_tearDownContactPickersForCompletionWithViewController:(id)a3
{
  id v4 = a3;
  editingContactController = self->_editingContactController;
  self->_editingContactController = 0;

  updatingContactController = self->_updatingContactController;
  self->_updatingContactController = 0;

  creatingContactController = self->_creatingContactController;
  self->_creatingContactController = 0;

  id v8 = [MEMORY[0x1E4F31038] sharedInstance];
  int v9 = [v8 userInterfaceIdiom];

  if (v9
    && MapKitIdiomIsMacCatalyst()
    && ([(MUPlaceViewController *)self placeViewControllerDelegate],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) != 0))
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __80__MUPlaceViewController__tearDownContactPickersForCompletionWithViewController___block_invoke;
    v12[3] = &unk_1E574ED68;
    objc_copyWeak(&v14, &location);
    void v12[4] = self;
    id v13 = v4;
    [v13 dismissViewControllerAnimated:1 completion:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

void __80__MUPlaceViewController__tearDownContactPickersForCompletionWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) mapsAppDelegate];
    [v3 placeViewControllerContactsDidComplete:*(void *)(a1 + 40)];

    id WeakRetained = v4;
  }
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  id v5 = (CNContactViewController *)a3;
  if (self->_editingContactController == v5)
  {
    char v11 = v5;
    [(CNContactViewController *)v5 dismissViewControllerAnimated:1 completion:0];
    editingContactController = self->_editingContactController;
    self->_editingContactController = 0;

    id v7 = [(MUPlaceViewController *)self contactsNavigationController];
    char v8 = objc_opt_respondsToSelector();

    id v5 = v11;
    if (v8)
    {
      int v9 = [(MUPlaceViewController *)self contactsNavigationController];
      uint64_t v10 = [(MUPlaceViewController *)self _contactForEditOperations];
      [v9 contactViewController:v11 didDeleteContact:v10];

      id v5 = v11;
    }
  }
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  id v7 = [(MUPlaceViewController *)self contactStore];
  int v8 = [v7 hasContactAccess];

  if (v8) {
    [(MUPlaceViewController *)self _authorized_contactPicker:v9 didSelectContact:v6];
  }
  else {
    [(MUPlaceViewController *)self _unauthorized_contactPicker:v9 didSelectContact:v6];
  }
}

- (void)_unauthorized_contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__MUPlaceViewController__unauthorized_contactPicker_didSelectContact___block_invoke;
  v9[3] = &unk_1E574ED68;
  objc_copyWeak(&v12, &location);
  id v8 = v7;
  id v10 = v8;
  char v11 = self;
  [v6 dismissViewControllerAnimated:1 completion:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__MUPlaceViewController__unauthorized_contactPicker_didSelectContact___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained contactStore];
    id v5 = [v3 contact];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__MUPlaceViewController__unauthorized_contactPicker_didSelectContact___block_invoke_2;
    v8[3] = &unk_1E574F2E0;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v9 = v6;
    uint64_t v10 = v7;
    char v11 = v3;
    [v4 removeMapsDataFromContact:v5 callbackQueue:MEMORY[0x1E4F14428] completion:v8];
  }
}

void __70__MUPlaceViewController__unauthorized_contactPicker_didSelectContact___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F1BBA8] viewControllerForUpdatingContact:*(void *)(a1 + 32) withPropertiesFromContact:a2];
  [v3 setDisplayMode:1];
  [v3 setDelegate:*(void *)(a1 + 40)];
  id v6 = (id)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v3];
  [v6 setModalPresentationStyle:2];
  [*(id *)(a1 + 48) _presentModalViewController:v6 withEnvironment:*(void *)(*(void *)(a1 + 48) + 1256)];
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = *(void **)(v4 + 1080);
  *(void *)(v4 + 1080) = v3;
}

- (void)_authorized_contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(MUPlaceViewController *)self contactStore];
  uint64_t v9 = MEMORY[0x1E4F14428];
  id v10 = MEMORY[0x1E4F14428];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__MUPlaceViewController__authorized_contactPicker_didSelectContact___block_invoke;
  v13[3] = &unk_1E574F308;
  id v11 = v7;
  id v14 = v11;
  id v12 = v6;
  id v15 = v12;
  objc_copyWeak(&v17, &location);
  id v16 = self;
  [v8 fetchContactForPickerDisplayUsingContact:v11 callbackQueue:v9 completion:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __68__MUPlaceViewController__authorized_contactPicker_didSelectContact___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if (a3)
  {
    NSLog(&cfstr_FailedToRefetc.isa, a3, *(void *)(a1 + 32));
    [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v6 = WeakRetained;
    if (WeakRetained)
    {
      id v7 = (void *)MEMORY[0x1E4F1BBA8];
      id v8 = [WeakRetained contact];
      uint64_t v9 = [v7 viewControllerForUpdatingContact:v12 withPropertiesFromContact:v8];

      [v9 setDisplayMode:1];
      [v9 setDelegate:*(void *)(a1 + 48)];
      id v10 = [*(id *)(a1 + 40) navigationController];
      [v10 pushViewController:v9 animated:1];

      id v11 = (void *)v6[135];
      v6[135] = v9;
    }
  }
}

- (id)contactsNavigationController
{
  double v2 = [(MUPlaceViewController *)self configuration];
  id v3 = [v2 contactsNavigationController];

  return v3;
}

- (id)createHeaderMenuSortOrderWithPromotedActionTypes:(id)a3 excludedActionTypes:(id)a4
{
  v26[12] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (id)*MEMORY[0x1E4F30DA8];
  uint64_t v9 = [(MUPlaceViewController *)self actionRowSectionController];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(_MKPlaceItem *)self->_placeItem representsPerson]) {
    [v10 addObject:&unk_1EE404808];
  }
  if ([v6 count]) {
    [v10 addObjectsFromArray:v6];
  }
  if (!v9)
  {
    v26[0] = &unk_1EE404820;
    v26[1] = &unk_1EE404838;
    v26[2] = &unk_1EE404850;
    v26[3] = &unk_1EE404868;
    void v26[4] = &unk_1EE404880;
    v26[5] = &unk_1EE404898;
    v26[6] = &unk_1EE4048B0;
    v26[7] = &unk_1EE4048C8;
    v26[8] = &unk_1EE4048E0;
    v26[9] = &unk_1EE4048F8;
    v26[10] = &unk_1EE404910;
    v26[11] = v8;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:12];
    [v10 addObjectsFromArray:v11];
  }
  v25[0] = &unk_1EE404928;
  v25[1] = &unk_1EE404940;
  v25[2] = v8;
  v25[3] = &unk_1EE404958;
  v25[4] = v8;
  v25[5] = &unk_1EE404970;
  v25[6] = &unk_1EE404988;
  v25[7] = &unk_1EE4049A0;
  v25[8] = &unk_1EE404928;
  v25[9] = &unk_1EE404940;
  v25[10] = v8;
  v25[11] = &unk_1EE4049B8;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:12];
  [v10 addObjectsFromArray:v12];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v10, "removeObject:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  id v18 = (void *)[v10 copy];
  return v18;
}

- (id)createHeaderButtonsMenuWithPresentationOptions:(id)a3
{
  return [(MUPlaceViewController *)self createHeaderButtonsMenuWithPromotedSystemActionTypes:MEMORY[0x1E4F1CBF0] excludedSystemActionTypes:MEMORY[0x1E4F1CBF0] presentationOptions:a3];
}

- (id)createHeaderButtonsMenuWithPromotedSystemActionTypes:(id)a3 excludedSystemActionTypes:(id)a4 presentationOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(MUPlaceActionManager *)self->_actionManager createMenuActions];
  id v12 = objc_alloc(MEMORY[0x1E4F30FA0]);
  id v13 = [(MUPlaceViewController *)self createHeaderMenuSortOrderWithPromotedActionTypes:v8 excludedActionTypes:v9];
  uint64_t v14 = (void *)[v12 initWithRequestedActionTypes:v13];

  [v14 setAddMismatchedItems:0];
  objc_initWeak(&location, self);
  uint64_t v15 = (void *)MEMORY[0x1E4F30F98];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke;
  v19[3] = &unk_1E574F358;
  objc_copyWeak(&v21, &location);
  id v16 = v10;
  id v20 = v16;
  id v17 = [v15 buildActionMenuForItems:v11 buildingOptions:v14 menuElementCreationBlock:v19];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v17;
}

id __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 resolvedActionItem];
  id v5 = [v4 titleForDisplayStyle:0];
  id v6 = (void *)MEMORY[0x1E4FB1818];
  id v7 = [v4 symbolForDisplayStyle:1];
  id v8 = [v6 _systemImageNamed:v7];

  if ([v4 type] != 9) {
    goto LABEL_5;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_2;
  v28[3] = &unk_1E574ED68;
  objc_copyWeak(v31, (id *)(a1 + 40));
  id v29 = *(id *)(a1 + 32);
  double v30 = @"PLACECARD_QUICK_ACTION_TRAY";
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_3;
  v24[3] = &unk_1E574ED68;
  objc_copyWeak(&v27, (id *)(a1 + 40));
  id v25 = *(id *)(a1 + 32);
  double v26 = @"PLACECARD_QUICK_ACTION_TRAY";
  id v9 = +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithTitle:v5 symbol:v8 cameraCompletion:v28 libraryCompletion:v24];
  id v10 = v9;
  if (v9) {
    id v11 = v9;
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak(v31);
  if (!v10)
  {
LABEL_5:
    id v12 = (void *)MEMORY[0x1E4FB13F0];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    double v19 = __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_4;
    id v20 = &unk_1E574F330;
    objc_copyWeak(&v23, (id *)(a1 + 40));
    id v21 = *(id *)(a1 + 32);
    id v13 = v4;
    id v22 = v13;
    id v10 = [v12 actionWithTitle:v5 image:v8 identifier:0 handler:&v17];
    if (objc_msgSend(v13, "isDestructiveForDisplayStyle:", 1, v17, v18, v19, v20)) {
      objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") | 2);
    }
    if (([v13 enabled] & 1) == 0) {
      objc_msgSend(v10, "setAttributes:", objc_msgSend(v10, "attributes") | 1);
    }
    [v13 type];
    uint64_t v14 = MKPlaceCardActionTypeAsString();
    uint64_t v15 = [v14 stringByAppendingString:@"MenuAction"];
    [v10 setAccessibilityIdentifier:v15];

    objc_destroyWeak(&v23);
  }

  return v10;
}

void __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained presentAddPhotosWithPresentationOptions:*(void *)(a1 + 32) entryPoint:1 originTarget:*(void *)(a1 + 40)];
    [v3[177] infoCardAnalyticsDidSelectAction:2147 target:30 eventValue:0 feedbackDelegateSelector:174 actionRichProviderId:0];
    id WeakRetained = v3;
  }
}

void __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained presentAddPhotosWithPresentationOptions:*(void *)(a1 + 32) entryPoint:2 originTarget:*(void *)(a1 + 40)];
    [v3[177] infoCardAnalyticsDidSelectAction:2147 target:30 eventValue:0 feedbackDelegateSelector:174 actionRichProviderId:0];
    id WeakRetained = v3;
  }
}

void __124__MUPlaceViewController_createHeaderButtonsMenuWithPromotedSystemActionTypes_excludedSystemActionTypes_presentationOptions___block_invoke_4(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x1E4F643A8] moduleFromModuleType:39];
    v8[0] = *MEMORY[0x1E4F30DC8];
    uint64_t v4 = [*(id *)(a1 + 32) sourceView];
    uint64_t v5 = *MEMORY[0x1E4F30DB8];
    v9[0] = v4;
    v9[1] = MEMORY[0x1E4F1CC38];
    uint64_t v6 = *MEMORY[0x1E4F30DC0];
    v8[1] = v5;
    v8[2] = v6;
    v9[2] = v3;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

    [WeakRetained performAction:*(void *)(a1 + 40) options:v7 completion:&__block_literal_global_475];
  }
}

- (void)ratingsAndReviewsSectionController:(id)a3 didSelectViewReview:(id)a4
{
}

- (void)_ratingsAndReviewsDidSelectViewReview:(id)a3
{
  id v4 = a3;
  id v8 = [(MUPlaceViewController *)self mapItem];
  uint64_t v5 = [v8 _reviewsAttribution];
  uint64_t v6 = [v5 urlsForReview:v4];

  if ([v6 count])
  {
    id v7 = [(MUPlaceViewController *)self placeViewFeedbackAppLaunchHandler];
    [(MUPlaceViewController *)self _launchAttributionURLs:v6 withAttribution:v5 mapItem:v8 completionHandler:v7];
  }
}

- (void)ratingsAndReviewsSectionControllerDidSelectViewAllReviews:(id)a3
{
  id v7 = [(MUPlaceViewController *)self mapItem];
  id v4 = [v7 _reviewsAttribution];
  uint64_t v5 = [v4 attributionURLs];
  uint64_t v6 = [(MUPlaceViewController *)self placeViewFeedbackAppLaunchHandler];
  [(MUPlaceViewController *)self _launchAttributionURLs:v5 withAttribution:v4 mapItem:v7 completionHandler:v6];
}

- (void)ratingsAndReviewsSectionController:(id)a3 didSelectPlaceCollection:(id)a4
{
}

- (id)inlineRatingsSectionControllerRequestsContentViewController:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    id v7 = [v6 inlineRatingViewControllerForPlaceViewController:self];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (double)placeHeaderSectionControllerRequestsTrailingConstant:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    return 0.0;
  }
  uint64_t v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  [v6 placeViewControllerPlaceCardHeaderTitleTrailingConstant:self];
  double v8 = v7;

  return v8;
}

- (void)placeHeaderSectionController:(id)a3 didTapMapItem:(id)a4
{
}

- (void)_handleRoutingToPlaceWithMapItem:(id)a3
{
  id v7 = a3;
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewController:self didSelectParent:v7];
  }
  else
  {
    [v7 openInMapsWithLaunchOptions:0];
  }
}

- (void)placeHeaderSectionController:(id)a3 didSelectShareWithPresentationOptions:(id)a4
{
  id v6 = a4;
  id v7 = [a3 analyticsModule];
  [(MUPlaceViewController *)self _invokeShareActionWithPresentationOptions:v6 analyticsModuleMetadata:v7];
}

- (void)_invokeShareActionWithPresentationOptions:(id)a3 analyticsModuleMetadata:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F30F98];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithType:16 displayString:0 glyph:0 enabled:1];
  v12[0] = *MEMORY[0x1E4F30DC8];
  id v10 = [v8 sourceView];

  v12[1] = *MEMORY[0x1E4F30DC0];
  v13[0] = v10;
  v13[1] = v7;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  [(MUPlaceActionManager *)self->_actionManager performAction:v9 options:v11 completion:0];
}

- (void)contactSharedLocationSectionController:(id)a3 selectedDirectionsWithAddress:(id)a4 forContact:(id)a5 options:(id)a6
{
  id v13 = a4;
  id v8 = a5;
  id v9 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(MUPlaceViewController *)self mapsAppDelegate];
    id v12 = [(MKETAProvider *)self->_etaProvider transportTypePreferenceNumber];
    [v11 placeViewController:self didSelectDirectionsForDestinationAddress:v13 contact:v8 transportType:v12];
  }
}

- (void)placeInfoSectionController:(id)a3 selectedViewPlaceWithMapItem:(id)a4 options:(id)a5
{
}

- (void)placeInfoSectionController:(id)a3 selectedDirectionsWithMapItem:(id)a4 options:(id)a5
{
  id v10 = a4;
  id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MUPlaceViewController *)self mapsAppDelegate];
    id v9 = [(MKETAProvider *)self->_etaProvider transportTypePreferenceNumber];
    [v8 placeViewController:self didSelectDirectionsForDestinationMapItem:v10 transportType:v9];
  }
}

- (void)placeInfoSectionController:(id)a3 selectedDirectionsWithAddress:(id)a4 forContact:(id)a5 options:(id)a6
{
  id v13 = a4;
  id v8 = a5;
  id v9 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(MUPlaceViewController *)self mapsAppDelegate];
    id v12 = [(MKETAProvider *)self->_etaProvider transportTypePreferenceNumber];
    [v11 placeViewController:self didSelectDirectionsForDestinationAddress:v13 contact:v8 transportType:v12];
  }
}

- (void)placeInfoSectionController:(id)a3 didTapAttribution:(id)a4
{
  id v5 = a4;
  id v6 = [(MUPlaceViewController *)self mapItem];
  [(MUPlaceViewController *)self _launchAttribution:v5 withMapItem:v6];
}

- (void)placeInfoSectionController:(id)a3 didSelectAddMissingDataOfType:(int64_t)a4
{
}

- (void)_inlineRAPDidSelectAddMissingDataOfType:(int64_t)a3
{
  analyticsController = self->_analyticsController;
  if ((unint64_t)(a3 - 1) > 4) {
    id v6 = @"Unknown";
  }
  else {
    id v6 = off_1E574F5A8[a3 - 1];
  }
  [(MUPlaceCardAnalyticsController *)analyticsController infoCardAnalyticsDidSelectAction:286 eventValue:v6 feedbackDelegateSelector:62];
  char v7 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v9 placeViewController:self didSelectAddMissingDataOfType:a3];
  }
}

- (void)placeInfoSectionController:(id)a3 didSelectEditPlaceDetailsOfType:(int64_t)a4
{
  analyticsController = self->_analyticsController;
  if ((unint64_t)(a4 - 1) > 4) {
    char v7 = @"Unknown";
  }
  else {
    char v7 = off_1E574F5A8[a4 - 1];
  }
  [(MUPlaceCardAnalyticsController *)analyticsController infoCardAnalyticsDidSelectAction:289 target:65 eventValue:v7 feedbackDelegateSelector:62 actionRichProviderId:0];
  char v8 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v10 placeViewController:self didSelectEditPlaceDetailsOfType:a4];
  }
}

- (void)_launchAttributionURLs:(id)a3 withAttribution:(id)a4 mapItem:(id)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if ([v9 count])
  {
    id v12 = [MEMORY[0x1E4F31000] punchoutOptionsForURLStrings:v9 withAttribution:v10];
    if ([v12 strategy] == 1)
    {
      analyticsController = self->_analyticsController;
      uint64_t v14 = [v12 urlToOpen];
      uint64_t v15 = [v14 absoluteString];
      id v16 = [v10 providerID];
      [(MUPlaceCardAnalyticsController *)analyticsController instrumentPunchoutActionWithURL:v15 providerId:v16];

      uint64_t v17 = [MEMORY[0x1E4F31038] sharedInstance];
      uint64_t v18 = [v12 urlToOpen];
      double v19 = [v12 appBundleIdentifier];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __90__MUPlaceViewController__launchAttributionURLs_withAttribution_mapItem_completionHandler___block_invoke;
      v23[3] = &unk_1E574F380;
      id v25 = v11;
      id v24 = v12;
      [v17 openURL:v18 bundleIdentifier:v19 completionHandler:v23];
    }
    else
    {
      id v20 = [(MUPlaceViewController *)self mapsAppDelegate];
      char v21 = objc_opt_respondsToSelector();

      if (v21)
      {
        id v22 = [(MUPlaceViewController *)self mapsAppDelegate];
        [v22 placeViewController:self launchAttributionURLs:v9 withAttribution:v10 completionHandler:v11];
      }
      else
      {
        [MEMORY[0x1E4F30E40] launchAttributionURLs:v9 withAttribution:v10 completionHandler:v11];
      }
    }
  }
}

void __90__MUPlaceViewController__launchAttributionURLs_withAttribution_mapItem_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    id v4 = [*(id *)(a1 + 32) urlToOpen];
    id v3 = [*(id *)(a1 + 32) appBundleIdentifier];
    (*(void (**)(uint64_t, id, void *))(v1 + 16))(v1, v4, v3);
  }
}

- (void)shareSheetPresenter:(id)a3 preCompletedActivityOfType:(id)a4 completed:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a4;
  char v7 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v9 placeViewController:self didSelectActivityOfType:v10 completed:v5];
  }
}

- (id)shareSheetPresenterRequestsOverridenActivityViewController:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    char v7 = [v6 activityViewControllerForPlaceViewController:self];
  }
  else
  {
    char v7 = 0;
  }
  return v7;
}

- (id)createShareSheetFooterActions
{
  id v3 = [(MUPlaceActionManager *)self->_actionManager createContactActions];
  actionManager = self->_actionManager;
  char v5 = [(MUShareSheetPresenter *)self->_shareSheetPresenter presentationOptions];
  id v6 = [(MKPlaceActionEnvironment *)self->_currentEnvironmentForPresentedViewController analyticsModuleMetadata];
  char v7 = +[MUBlockActivity createBlockActivitiesFromPlaceActionItems:v3 usingActionManager:actionManager presentationOptions:v5 analyticsModuleMetadata:v6];

  return v7;
}

- (BOOL)shouldBlurChromeHeaderButtons
{
  double v2 = [(MUPlaceViewController *)self headerSectionController];
  char v3 = [v2 shouldBlurChromeHeaderButtons];

  return v3;
}

- (void)placeViewController:(id)a3 shouldLogFeedbackOfType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = [(MUPlaceViewController *)self placeViewFeedbackDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MUPlaceViewController *)self placeViewFeedbackDelegate];
    [v8 placeViewController:self shouldLogFeedbackOfType:v4];
  }
}

- (BOOL)isLoading
{
  double v2 = [(MUPlaceViewController *)self placeItem];
  char v3 = [v2 isIntermediateMapItem];

  return v3;
}

- (void)addLoadingView
{
  loadingOverlayController = self->_loadingOverlayController;
  if (!loadingOverlayController)
  {
    uint64_t v4 = [MULoadingOverlayController alloc];
    char v5 = [(MUPlaceViewController *)self view];
    id v6 = [(MULoadingOverlayController *)v4 initWithParentView:v5 contentView:self->_contentStackView];
    char v7 = self->_loadingOverlayController;
    self->_loadingOverlayController = v6;

    loadingOverlayController = self->_loadingOverlayController;
  }
  [(MULoadingOverlayController *)loadingOverlayController attachLoadingOverlay];
}

- (void)removeLoadingViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  loadingOverlayController = self->_loadingOverlayController;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MUPlaceViewController_removeLoadingViewAnimated___block_invoke;
  v6[3] = &unk_1E574F3A8;
  objc_copyWeak(&v7, &location);
  [(MULoadingOverlayController *)loadingOverlayController removeLoadingOverlayAnimated:v3 completion:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __51__MUPlaceViewController_removeLoadingViewAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _updateContentAlpha];
    id WeakRetained = v2;
  }
}

- (void)hideContentIfLoading
{
  if ([(MUPlaceViewController *)self isLoading])
  {
    [(MUPlaceViewController *)self addLoadingView];
  }
}

- (void)showContentIfLoaded
{
  if (![(MUPlaceViewController *)self isLoading])
  {
    [(MUPlaceViewController *)self removeLoadingViewAnimated:1];
    placeIteuint64_t m = self->_placeItem;
    if (placeItem)
    {
      if (([(_MKPlaceItem *)placeItem isIntermediateMapItem] & 1) == 0)
      {
        [(MUScrollViewImpressionsCalculator *)self->_impressionsCalculator logImpressions];
        if (!self->_active && !self->_needsImpressionsLoggedOnAppearance) {
          self->_needsImpressionsLoggedOnAppearance = 1;
        }
      }
    }
    [(MUPlaceViewController *)self updatePreferredContentSize];
  }
}

- (void)didSelectAddMissingDataWithActionDispatcher:(id)a3 missingDataType:(int64_t)a4
{
}

- (void)didSelectViewReviewWithActionDispatcher:(id)a3 review:(id)a4
{
}

- (void)_updatePreferredContentSize
{
  uint64_t v5 = 0;
  id v6 = (double *)&v5;
  uint64_t v7 = 0x3010000000;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  id v8 = "";
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__MUPlaceViewController__updatePreferredContentSize__block_invoke;
  v4[3] = &unk_1E574F3D0;
  v4[4] = self;
  void v4[5] = &v5;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__MUPlaceViewController__updatePreferredContentSize__block_invoke_2;
  v3[3] = &unk_1E574F020;
  v3[4] = self;
  void v3[5] = &v5;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v4 oldUIBlock:v3];
  -[MUPlaceViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6[4], v6[5]);
  _Block_object_dispose(&v5, 8);
}

void __52__MUPlaceViewController__updatePreferredContentSize__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  BOOL v3 = *(void **)(a1 + 32);
  id v10 = [v3 view];
  [v10 frame];
  double v5 = v4;
  LODWORD(v4) = 1148846080;
  LODWORD(v6) = 1112014848;
  objc_msgSend(v3, "_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v5, 0.0, v4, v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v9;
}

uint64_t __52__MUPlaceViewController__updatePreferredContentSize__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 984) preferredContentSize];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  return result;
}

- (CGSize)_systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  uint64_t v17 = 0;
  uint64_t v18 = (double *)&v17;
  uint64_t v19 = 0x3010000000;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  id v20 = "";
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__MUPlaceViewController__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke;
  void v13[3] = &unk_1E574F3F8;
  void v13[4] = self;
  v13[5] = &v17;
  CGSize v14 = a3;
  float v15 = a4;
  float v16 = a5;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __108__MUPlaceViewController__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke_2;
  v9[3] = &unk_1E574F3F8;
  void v9[4] = self;
  v9[5] = &v17;
  CGSize v10 = a3;
  float v11 = a4;
  float v12 = a5;
  [(MUPlaceViewController *)self _performWithNewUIBlock:v13 oldUIBlock:v9];
  double v5 = v18[4];
  double v6 = v18[5];
  _Block_object_dispose(&v17, 8);
  double v7 = v5;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

uint64_t __108__MUPlaceViewController__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  LODWORD(a4) = *(_DWORD *)(a1 + 64);
  LODWORD(a5) = *(_DWORD *)(a1 + 68);
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 992), "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)(a1 + 48), *(double *)(a1 + 56), a4, a5);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v7 + 32) = v8;
  *(void *)(v7 + 40) = v9;
  return result;
}

void __108__MUPlaceViewController__systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  LODWORD(v3) = *(_DWORD *)(a1 + 68);
  objc_msgSend(v7, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", *(double *)(a1 + 48), *(double *)(a1 + 56), v2, v3);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  *(void *)(v4 + 32) = v5;
  *(void *)(v4 + 40) = v6;
}

- (id)menuElementForActionItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MUPlaceViewController *)self mapsAppDelegate];
    uint64_t v8 = [v7 menuElementForActionItem:v4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)presentAddPhotosWithPresentationOptions:(id)a3 entryPoint:(int64_t)a4 originTarget:(id)a5
{
  id v12 = a3;
  id v8 = a5;
  uint64_t v9 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    float v11 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v11 placeViewController:self didSelectAddPhotosWithPresentationOptions:v12 entryPoint:a4 originTarget:v8];
  }
}

- (void)presentPOIEnrichmentWithPresentationOptions:(id)a3
{
  id v7 = a3;
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewController:self didSelectAddRatingsWithPresentationOptions:v7 overallState:0 originTarget:0];
  }
}

- (id)suggestionViewForCallToActionSectionController:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    id v7 = [v6 suggestionViewForPlaceViewController:self];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)setPlaceInBookmarks:(BOOL)a3
{
  self->_placeInBookmarks = a3;
  -[MUPlaceActionManager setPlaceInBookmarks:](self->_actionManager, "setPlaceInBookmarks:");
}

- (void)handleAppClip:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  analyticsController = self->_analyticsController;
  uint64_t v9 = [v7 analyticsEventValue];
  -[MUPlaceCardAnalyticsController instrumentAction:target:eventValue:moduleType:feedbackType:](analyticsController, "instrumentAction:target:eventValue:moduleType:feedbackType:", 6105, 670, v9, [v7 analyticsModuleType], 0);

  char v10 = [v6 appClipURL];
  objc_initWeak(&location, self);
  float v11 = [MEMORY[0x1E4F30E60] sharedInstance];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__MUPlaceViewController_handleAppClip_options___block_invoke;
  void v13[3] = &unk_1E574F420;
  id v12 = v10;
  id v14 = v12;
  objc_copyWeak(&v15, &location);
  [v11 requestAppClip:v6 completion:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __47__MUPlaceViewController_handleAppClip_options___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2) {
    goto LABEL_9;
  }
  id v6 = MUGetPlaceCardLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = [v5 description];
      int v15 = 138412546;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_ERROR, "AppClip request for URL: %@ failed with error: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  else if (v7)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v15 = 138412290;
    uint64_t v16 = v10;
    _os_log_impl(&dword_1931EA000, v6, OS_LOG_TYPE_ERROR, "AppClip request for URL: %@ failed", (uint8_t *)&v15, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    [WeakRetained _openWebURL:*(void *)(a1 + 32) forcePunchout:0];

LABEL_9:
    id v13 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v14;
      _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_INFO, "AppClip of url %@ is available", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)handleQuickLink:(id)a3 options:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 URLString];
  if ([v8 length])
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
    if (v9)
    {
      analyticsController = self->_analyticsController;
      uint64_t v11 = [v7 analyticsTarget];
      id v12 = [v7 analyticsEventValue];
      -[MUPlaceCardAnalyticsController instrumentAction:target:eventValue:moduleType:feedbackType:](analyticsController, "instrumentAction:target:eventValue:moduleType:feedbackType:", 6050, v11, v12, [v7 analyticsModuleType], 0);

      [(MUPlaceViewController *)self _openWebURL:v9 forcePunchout:0];
    }
    else
    {
      id v13 = MUGetPlaceCardLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_ERROR, "The URL associated with quicklink %@ is nil", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)handleWebLink:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 absoluteString];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    analyticsController = self->_analyticsController;
    uint64_t v11 = [v7 analyticsTarget];
    id v12 = [v7 analyticsEventValue];
    -[MUPlaceCardAnalyticsController instrumentAction:target:eventValue:moduleType:feedbackType:](analyticsController, "instrumentAction:target:eventValue:moduleType:feedbackType:", 6050, v11, v12, [v7 analyticsModuleType], 0);

    -[MUPlaceViewController _openWebURL:forcePunchout:](self, "_openWebURL:forcePunchout:", v6, [v7 forcePunchout]);
  }
  else
  {
    id v13 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl(&dword_1931EA000, v13, OS_LOG_TYPE_ERROR, "The URL is empty", v14, 2u);
    }
  }
}

- (void)_openWebURL:(id)a3 forcePunchout:(BOOL)a4
{
  id v9 = a3;
  if (a4
    || ([(MUPlaceViewController *)self mapsAppDelegate],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = objc_opt_respondsToSelector(),
        v6,
        (v7 & 1) == 0))
  {
    uint64_t v8 = [MEMORY[0x1E4F31038] sharedInstance];
    [v8 openURL:v9 completionHandler:0];
  }
  else
  {
    uint64_t v8 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v8 placeViewController:self openURL:v9];
  }
}

- (void)handleMapsExtension:(id)a3 usingAppStoreApp:(id)a4 options:(id)a5
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v11 placeViewController:self didSelectMapsExtension:v7 usingAppStoreApp:v8];
  }
  else
  {
    id v12 = [(MUPlaceViewController *)self mapItem];
    uint64_t v14 = *MEMORY[0x1E4F30D60];
    v15[0] = MEMORY[0x1E4F1CC38];
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    [v12 openInMapsWithLaunchOptions:v13 completionHandler:&__block_literal_global_520];
  }
}

void __70__MUPlaceViewController_handleMapsExtension_usingAppStoreApp_options___block_invoke(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    double v2 = MUGetPlaceCardLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      double v3 = [MEMORY[0x1E4F28B50] mainBundle];
      id v4 = [v3 bundleIdentifier];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_1931EA000, v2, OS_LOG_TYPE_INFO, "Couldn't launch Maps from Reservation button in %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (id)visibleImpressionElements
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](self->_sectionControllers, "count"));
  id v4 = [(MUPlaceViewController *)self placeEnrichmentSectionController];
  uint64_t v5 = [v4 hasContent];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = self->_sectionControllers;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasContent", (void)v17)
          && [v12 isImpressionable])
        {
          id v13 = [v12 impressionElement];
          [v12 impressionsFrame];
          objc_msgSend(v13, "setFrame:");
          [v13 setSessionIdentifier:self->_impressionsSessionIdentifier];
          uint64_t v14 = [v13 customData];
          [v14 setModuleIndex:v9];
          [v14 setEnriched:v5];
          [v3 addObject:v13];
          ++v9;
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  id v15 = (void *)[v3 copy];
  return v15;
}

- (MUAMSResultProvider)amsResultProvider
{
  amsResultProvider = self->_amsResultProvider;
  if (!amsResultProvider)
  {
    id v4 = [MUAMSResultCache alloc];
    uint64_t UInteger = GEOConfigGetUInteger();
    uint64_t v6 = GEOConfigGetUInteger();
    uint64_t v7 = GEOConfigGetUInteger();
    uint64_t v8 = [(MUAMSResultCache *)v4 initWithAppAdamIdCacheCount:UInteger appAdamIdTimeToLive:v6 bundleIdCacheCount:v7 bundleIdTimeToLive:GEOConfigGetUInteger()];
    uint64_t v9 = [[MUAMSResultProvider alloc] initWithCache:v8];
    uint64_t v10 = self->_amsResultProvider;
    self->_amsResultProvider = v9;

    amsResultProvider = self->_amsResultProvider;
  }
  return amsResultProvider;
}

- (void)contactStoreDidChange:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__MUPlaceViewController_contactStoreDidChange___block_invoke;
  v5[3] = &unk_1E574F070;
  objc_copyWeak(&v6, &location);
  [(MUPlaceViewController *)self _calculateShowingContactActionsWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __47__MUPlaceViewController_contactStoreDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setShowContactActions:a2];
    id WeakRetained = v4;
  }
}

- (void)placeNotesSectionController:(id)a3 didRequestEditingNoteWithInitialText:(id)a4 completion:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  uint64_t v8 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(MUPlaceViewController *)self mapsAppDelegate];
    uint64_t v11 = [(MUPlaceViewController *)self libraryAccessProvider];
    [v10 placeViewController:self didRequestEditingNoteWithInitialText:v12 libraryAccessProvider:v11 completion:v7];
  }
}

- (void)libraryAccessProvider:(id)a3 savedStateOfPlaceDidChange:(BOOL)a4
{
  [(MUPlaceViewController *)self updateAddToLibraryActionState];
  [(MUPlaceViewController *)self updateAddNoteActionState];
}

- (void)requestHikingToolTipRegionIDForLocationCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MUPlaceViewController *)self mapsAppDelegate];
    objc_msgSend(v8, "placeViewController:didRequestHikingToolTipRegionIDForLocation:", self, latitude, longitude);
  }
}

- (id)hikingTipViewForHikingTipSectionController:(id)a3 viewModel:(id)a4
{
  id v5 = a4;
  id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(MUPlaceViewController *)self mapsAppDelegate];
    char v9 = [v8 placeViewController:self hikingTipViewForTipModel:v5];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)didTapHikingTip:(id)a3
{
  id v4 = [(MUPlaceViewController *)self mapsAppDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(MUPlaceViewController *)self mapsAppDelegate];
    [v6 placeViewControllerDidTapHikingTip:self];
  }
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
  return (UIScrollViewDelegate *)WeakRetained;
}

- (void)setScrollViewDelegate:(id)a3
{
}

- (GEOAutomobileOptions)automobileOptions
{
  return self->_automobileOptions;
}

- (GEOWalkingOptions)walkingOptions
{
  return self->_walkingOptions;
}

- (GEOCyclingOptions)cyclingOptions
{
  return self->_cyclingOptions;
}

- (GEOTransitOptions)transitOptions
{
  return self->_transitOptions;
}

- (BOOL)placeInBookmarks
{
  return self->_placeInBookmarks;
}

- (BOOL)placeInCollections
{
  return self->_placeInCollections;
}

- (BOOL)placeInShortcuts
{
  return self->_placeInShortcuts;
}

- (unint64_t)placeNumberOfReportsInReview
{
  return self->_placeNumberOfReportsInReview;
}

- (MUPlaceViewControllerDelegate)placeViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewControllerDelegate);
  return (MUPlaceViewControllerDelegate *)WeakRetained;
}

- (void)setPlaceViewControllerDelegate:(id)a3
{
}

- (double)verifiedHeaderExpansionProgress
{
  return self->_verifiedHeaderExpansionProgress;
}

- (MUOfflineMapProvider)offlineMapProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_offlineMapProvider);
  return (MUOfflineMapProvider *)WeakRetained;
}

- (MUFeatureDiscoveryAnnotationView)offlineFeatureDiscoveryView
{
  return self->_offlineFeatureDiscoveryView;
}

- (CNContact)originalContact
{
  return self->_originalContact;
}

- (void)setOriginalContact:(id)a3
{
}

- (MUPersonalizedSuggestionSectionArbiter)personalizedSuggestionSectionArbiter
{
  return self->_personalizedSuggestionSectionArbiter;
}

- (void)setPersonalizedSuggestionSectionArbiter:(id)a3
{
}

- (BOOL)showContactActions
{
  return self->_showContactActions;
}

- (MKMapItemIdentifier)mapItemIdentifierIntrumentedForReveal
{
  return self->_mapItemIdentifierIntrumentedForReveal;
}

- (void)setMapItemIdentifierIntrumentedForReveal:(id)a3
{
}

- (MUPlaceViewControllerMapsAppDelegate)mapsAppDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapsAppDelegate);
  return (MUPlaceViewControllerMapsAppDelegate *)WeakRetained;
}

- (void)setMapsAppDelegate:(id)a3
{
}

- (id)placeViewFeedbackAppLaunchHandler
{
  return self->_placeViewFeedbackAppLaunchHandler;
}

- (void)setPlaceViewFeedbackAppLaunchHandler:(id)a3
{
}

- (CLLocation)location
{
  return self->_location;
}

- (MULibraryAccessProviding)libraryAccessProvider
{
  return self->_libraryAccessProvider;
}

- (MUImpressionsCalculator)impressionsCalculator
{
  return &self->_impressionsCalculator->super;
}

- (MUPlaceCardAnalyticsController)analyticsController
{
  return self->_analyticsController;
}

- (BOOL)forceCaptureRevealEventOnNextBecomeActive
{
  return self->_forceCaptureRevealEventOnNextBecomeActive;
}

- (void)setForceCaptureRevealEventOnNextBecomeActive:(BOOL)a3
{
  self->_forceCaptureRevealEventOnNextBecomeActive = a3;
}

- (UIView)linkView
{
  return self->_linkView;
}

- (MUPlaceViewControllerFeedbackDelegate)placeViewFeedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewFeedbackDelegate);
  return (MUPlaceViewControllerFeedbackDelegate *)WeakRetained;
}

- (void)setPlaceViewFeedbackDelegate:(id)a3
{
}

- (MUPlaceViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_placeViewFeedbackDelegate);
  objc_storeStrong((id *)&self->_linkView, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_libraryAccessProvider, 0);
  objc_storeStrong(&self->_placeViewFeedbackAppLaunchHandler, 0);
  objc_destroyWeak((id *)&self->_mapsAppDelegate);
  objc_storeStrong((id *)&self->_mapItemIdentifierIntrumentedForReveal, 0);
  objc_storeStrong((id *)&self->_personalizedSuggestionSectionArbiter, 0);
  objc_storeStrong((id *)&self->_originalContact, 0);
  objc_storeStrong((id *)&self->_offlineFeatureDiscoveryView, 0);
  objc_destroyWeak((id *)&self->_offlineMapProvider);
  objc_destroyWeak((id *)&self->_placeViewControllerDelegate);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_currentEnvironmentForPresentedViewController, 0);
  objc_storeStrong((id *)&self->_impressionsSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_impressionsCalculator, 0);
  objc_storeStrong((id *)&self->_officialAppMediaResultCache, 0);
  objc_storeStrong((id *)&self->_quickActionTrayArtworkCache, 0);
  objc_storeStrong((id *)&self->_headerAlternatePrimaryButtonController, 0);
  objc_storeStrong((id *)&self->_headerSecondaryButtonController, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_submissionStatus, 0);
  objc_storeStrong((id *)&self->_originalContactCopy, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_actionDispatcher, 0);
  objc_storeStrong((id *)&self->_evChargerAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_lockScreenCoordinator, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_loadingOverlayController, 0);
  objc_storeStrong((id *)&self->_shareSheetPresenter, 0);
  objc_storeStrong((id *)&self->_editingContactController, 0);
  objc_storeStrong((id *)&self->_creatingContactController, 0);
  objc_storeStrong((id *)&self->_updatingContactController, 0);
  objc_storeStrong((id *)&self->_etaProvider, 0);
  objc_storeStrong((id *)&self->_actionDataProvider, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_placeItem, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_contentStackView, 0);
  objc_storeStrong((id *)&self->_legacyPlacecard, 0);
}

@end