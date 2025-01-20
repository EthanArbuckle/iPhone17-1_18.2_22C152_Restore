@interface HKOverlayRoomViewController
- (BOOL)_canSelectOverlayLocation:(id)a3 previousSelection:(id)a4;
- (BOOL)_containersContainHealthFactorsSection:(id)a3;
- (BOOL)_currentSelectedContextValidForTimeScope:(int64_t)a3;
- (BOOL)_isInPortraitLayout;
- (BOOL)_shouldInstallDefaultOverlayDeselectionTimerForMode:(int64_t)a3 initialSelectedLocation:(id)a4;
- (BOOL)_shouldStackSingleModeWithShowAllFiltersOverlayAreaVertically;
- (BOOL)_shouldUpdateContextItemsForChanges:(id)a3;
- (BOOL)contextView:(id)a3 canSelectItemAtIndexPath:(id)a4;
- (BOOL)factorDisplayTypeIsActive:(id)a3;
- (BOOL)healthFactorsEnabled;
- (BOOL)prefersOpaqueLegends;
- (BOOL)selectOverlayButtonForTestingNamed:(id)a3;
- (BOOL)shouldSelectInitialOverlay;
- (BOOL)showAllFiltersVisible;
- (BOOL)supportsHealthFactors;
- (BOOL)supportsShowAllFilters;
- (BOOL)userHasOverriddenPreferredOverlay;
- (HKDisplayType)primaryDisplayType;
- (HKDisplayTypeSectionedContextView)sectionedContextView;
- (HKInteractiveChartOverlayViewController)chartController;
- (HKMaximumSizeView)singleContextMaximumSizeView;
- (HKOverlayContextLocation)currentSelectedContextLocation;
- (HKOverlayContextLocation)initialSelectedContextLocation;
- (HKOverlayContextLocation)restorationContextLocation;
- (HKOverlayRoomApplicationItems)applicationItems;
- (HKOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6;
- (HKValueRange)initialVisibleDateRange;
- (NSArray)factorDisplayTypes;
- (NSArray)overlayContextSectionContainers;
- (NSArray)previousStackHeights;
- (NSDate)displayDate;
- (NSDateInterval)currentChartDateInterval;
- (NSDirectionalEdgeInsets)_edgeInsetsForWidthDesignation;
- (NSLayoutConstraint)chartControllerViewHeightConstraint;
- (NSLayoutConstraint)chartControllerViewToTopLevelChartViewBottomConstraint;
- (NSLayoutConstraint)overlaysWithOptionalSegmentLeadingConstraint;
- (NSLayoutConstraint)overlaysWithOptionalSegmentTopConstraint;
- (NSLayoutConstraint)overlaysWithOptionalSegmentTrailingConstraint;
- (NSLayoutConstraint)topLevelChartViewBottomConstraint;
- (NSLayoutConstraint)topLevelChartViewLeadingConstraint;
- (NSLayoutConstraint)topLevelChartViewTrailingConstraint;
- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewTopConstraint;
- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
- (NSString)chartOverlayVersion;
- (NSString)description;
- (NSTimer)defaultOverlayDeselectTimer;
- (NSUserActivity)restorationUserActivity;
- (NSUserActivity)showAllFiltersActivity;
- (OS_dispatch_queue)contextUpdateQueue;
- (UISegmentedControl)segmentedControl;
- (UIStackView)chartOverlayStackView;
- (UIStackView)overlaysWithOptionalSegmentController;
- (UITraitChangeRegistration)traitChangeRegistration;
- (UIView)segmentedControlContainer;
- (UIView)topLevelChartView;
- (UIView)topLevelOverlaysWithOptionalSegmentView;
- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)analyticsManager;
- (id)_addHealthFactorsIfNecessary:(id)a3;
- (id)_bottomMostDisplayType:(id)a3;
- (id)_computeRevisedRatiosGivenRatio:(double)a3;
- (id)_contextViewBackgroundColor;
- (id)_createOverlayStackView;
- (id)_createOverlaysWithOptionalSegmentedControllerStackView;
- (id)_currentChartEffectiveVisibleRange;
- (id)_currentIndexPath;
- (id)_evenStackedProportions;
- (id)_findMinimumSizeView;
- (id)_findNavigationController;
- (id)_healthFactorsMeasurementSectionTitle;
- (id)_healthFactorsSectionTitle;
- (id)_indexesOfLargestProportions:(id)a3;
- (id)_segmentedControlTitles;
- (id)_selectedOverlayContextWithLocation:(id)a3;
- (id)_setupSegmentedControl;
- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9;
- (id)buildFactorContextSectionForChartController;
- (id)buildFactorContextsAllowingDeselection:(BOOL)a3;
- (id)combineFactors:(id)a3 standardFactors:(id)a4;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4;
- (id)overlayButtonNamesForTesting;
- (id)overlayButtonValueForTesting;
- (id)preferredInitialOverlayIndex;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (id)restorationStateDictionary;
- (id)showAllFiltersButtonTitle;
- (int64_t)_contextItemCount;
- (int64_t)_findOverlayResolution:(id)a3;
- (int64_t)_widthDesignationFromTraitCollection:(id)a3;
- (int64_t)containerIndexForHealthFactors;
- (int64_t)controllerMode;
- (int64_t)currentChartTimeScope;
- (int64_t)initialSelectedContainerIndexForMode:(int64_t)a3;
- (int64_t)previousHorizontalSizeClass;
- (int64_t)previousWidthDesignation;
- (int64_t)segmentedControlSelectedIndex;
- (int64_t)topLevelAxis;
- (unint64_t)_fullModeTransitionToSizeClass:(int64_t)a3;
- (unint64_t)_fullViewRatioModeToAxis:(int64_t)a3;
- (unint64_t)_singleModeTransitionToSizeClass:(int64_t)a3;
- (unint64_t)additionalChartOptions;
- (unint64_t)filteredInteractiveChartOptionsForMode:(int64_t)a3;
- (void)_callPrepareOnOverlayContexts;
- (void)_configureChartAreaMargins;
- (void)_configureChartHeightUsingDefault;
- (void)_configureChartHeightUsingViewRatio;
- (void)_configureMainAreaHorizontally;
- (void)_configureMainAreaVertically;
- (void)_configureOverlayAreaHorizontally;
- (void)_configureOverlayAreaMargins;
- (void)_configureOverlayAreaVertically;
- (void)_configureOverlaysWithOptionalSegmentHorizontalMarginsForModeFull;
- (void)_configureOverlaysWithOptionalSegmentTopMarginForModeFull;
- (void)_configureStackViewsUsingHorizontalSizeClass:(int64_t)a3;
- (void)_didDismissShowAllFilters;
- (void)_disableDefaultOverlaySelection;
- (void)_disableDefaultOverlaySelectionIfNecessary;
- (void)_enumerateContextItemsWithBlock:(id)a3;
- (void)_handlePresentationControllerDismissalDidEnd:(id)a3;
- (void)_handlePresentationControllerPresentationTransitionDidEnd:(id)a3;
- (void)_horizontalSizeClassChanged:(id)a3;
- (void)_installBaseDisplayType:(id)a3 autoscale:(BOOL)a4;
- (void)_installDefaultOverlayDeselectionTimer;
- (void)_invalidateContextItems;
- (void)_invalidateDefaultOverlayDeselectionTimer;
- (void)_layoutNoVerticalExpansion:(id)a3;
- (void)_layoutSegmentedControl;
- (void)_pauseDefaultOverlayDeselectionTimerIfNecessary;
- (void)_refreshContextItemsAndUpdateChart:(BOOL)a3;
- (void)_refreshUpdatedItemsWithChartUpdate:(BOOL)a3 invalidateChartItems:(BOOL)a4;
- (void)_registerPresentationControllerTransitionNotificationsForOverlayDeselectionTimer;
- (void)_restartDefaultOverlayDeselectionTimerIfNecessary;
- (void)_restoreStackingProportions;
- (void)_selectContextItemAtLocation:(id)a3 animated:(BOOL)a4;
- (void)_selectPreferredItem;
- (void)_setupInterface;
- (void)_setupOverlayContainers;
- (void)_setupOverlayContextItems;
- (void)_setupPrimaryDisplayType;
- (void)_setupStackingProportionsForContext:(id)a3;
- (void)_setupTopLevelChartView;
- (void)_setupTopLevelOverlaysWithOptionalSegmentView;
- (void)_showAllFilters;
- (void)_showAllFilters:(id)a3;
- (void)_subscribeToSampleTypeUpdates;
- (void)_unregisterPresentationControllerTransitionNotificationsForOverlayDeselectionTimer;
- (void)_unselectCurrentContext;
- (void)_updateChartForOverlaySelection:(id)a3 previousSelection:(id)a4;
- (void)_updateChartForOverlaySelection:(id)a3 previousSelection:(id)a4 animated:(BOOL)a5;
- (void)_updateContextTiles;
- (void)_willPresentShowAllFilters;
- (void)contextView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)contextView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4;
- (void)dealloc;
- (void)didUpdateFromDateZoom:(int64_t)a3 toDateZoom:(int64_t)a4 newVisibleRange:(id)a5;
- (void)didUpdateSeriesWithNewValueRange:(id)a3;
- (void)didUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4;
- (void)fetchContextItemsIfNeededWithDateInterval:(id)a3 completion:(id)a4;
- (void)refreshOverlayContextItems;
- (void)reloadOverlayContextItems;
- (void)restoreUserActivityState:(id)a3;
- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4;
- (void)saveRestorationState;
- (void)segmentedControlValueChanged:(id)a3;
- (void)setAdditionalChartOptions:(unint64_t)a3;
- (void)setApplicationItems:(id)a3;
- (void)setChartController:(id)a3;
- (void)setChartControllerViewHeightConstraint:(id)a3;
- (void)setChartControllerViewToTopLevelChartViewBottomConstraint:(id)a3;
- (void)setContextUpdateQueue:(id)a3;
- (void)setControllerMode:(int64_t)a3;
- (void)setCurrentChartDateInterval:(id)a3;
- (void)setCurrentChartTimeScope:(int64_t)a3;
- (void)setCurrentSelectedContextLocation:(id)a3;
- (void)setDefaultOverlayDeselectTimer:(id)a3;
- (void)setInitialSelectedContextLocation:(id)a3;
- (void)setInitialVisibleDateRange:(id)a3;
- (void)setOverlayContextSectionContainers:(id)a3;
- (void)setOverlaysWithOptionalSegmentLeadingConstraint:(id)a3;
- (void)setOverlaysWithOptionalSegmentTopConstraint:(id)a3;
- (void)setOverlaysWithOptionalSegmentTrailingConstraint:(id)a3;
- (void)setPreviousHorizontalSizeClass:(int64_t)a3;
- (void)setPreviousStackHeights:(id)a3;
- (void)setPreviousWidthDesignation:(int64_t)a3;
- (void)setPrimaryDisplayType:(id)a3;
- (void)setRestorationContextLocation:(id)a3;
- (void)setRestorationUserActivity:(id)a3;
- (void)setSectionedContextView:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSegmentedControlContainer:(id)a3;
- (void)setSegmentedControlSelectedIndex:(unint64_t)a3;
- (void)setShouldSelectInitialOverlay:(BOOL)a3;
- (void)setShowAllFiltersActivity:(id)a3;
- (void)setShowAllFiltersVisible:(BOOL)a3;
- (void)setSingleContextMaximumSizeView:(id)a3;
- (void)setTopLevelAxis:(int64_t)a3;
- (void)setTopLevelChartViewBottomConstraint:(id)a3;
- (void)setTopLevelChartViewLeadingConstraint:(id)a3;
- (void)setTopLevelChartViewTrailingConstraint:(id)a3;
- (void)setTopLevelOverlaysWithOptionalSegmentViewLeadingConstraint:(id)a3;
- (void)setTopLevelOverlaysWithOptionalSegmentViewTopConstraint:(id)a3;
- (void)setTopLevelOverlaysWithOptionalSegmentViewTrailingConstraint:(id)a3;
- (void)setTopLevelOverlaysWithOptionalSegmentViewWidthConstraint:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setUserHasOverriddenPreferredOverlay:(BOOL)a3;
- (void)showAllFiltersWithCompletion:(id)a3;
- (void)updateController:(id)a3 didReceiveHighFrequencyUpdateForType:(id)a4;
- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HKOverlayRoomViewController

- (HKOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v46.receiver = self;
  v46.super_class = (Class)HKOverlayRoomViewController;
  v14 = [(HKOverlayRoomViewController *)&v46 initWithNibName:0 bundle:0];
  if (v14)
  {
    if (v11)
    {
      id v15 = v11;
    }
    else
    {
      id v15 = [MEMORY[0x1E4F1C9C8] date];
    }
    v16 = v15;
    objc_storeStrong((id *)&v14->_applicationItems, a4);
    v17 = [v12 timeScopeController];
    v14->_currentChartTimeScope = [v17 selectedTimeScope];

    v18 = (void *)MEMORY[0x1E4F28C18];
    v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v20 = objc_msgSend(v18, "hk_dateIntervalForDayFromDate:calendar:", v16, v19);
    currentChartDateInterval = v14->_currentChartDateInterval;
    v14->_currentChartDateInterval = (NSDateInterval *)v20;

    currentSelectedContextLocation = v14->_currentSelectedContextLocation;
    v14->_currentSelectedContextLocation = 0;

    objc_storeStrong((id *)&v14->_displayDate, a3);
    v14->_controllerMode = a6;
    v14->_userHasOverriddenPreferredOverlay = 0;
    primaryDisplayType = v14->_primaryDisplayType;
    v14->_primaryDisplayType = 0;

    overlayContextSectionContainers = v14->_overlayContextSectionContainers;
    v14->_overlayContextSectionContainers = (NSArray *)MEMORY[0x1E4F1CBF0];

    initialSelectedContextLocation = v14->_initialSelectedContextLocation;
    v14->_initialSelectedContextLocation = 0;

    v14->_showAllFiltersVisible = 0;
    showAllFiltersActivity = v14->_showAllFiltersActivity;
    v14->_showAllFiltersActivity = 0;

    restorationContextLocation = v14->_restorationContextLocation;
    v14->_restorationContextLocation = 0;

    segmentedControl = v14->_segmentedControl;
    v14->_segmentedControl = 0;

    topLevelChartView = v14->_topLevelChartView;
    v14->_topLevelChartView = 0;

    topLevelOverlaysWithOptionalSegmentView = v14->_topLevelOverlaysWithOptionalSegmentView;
    v14->_topLevelOverlaysWithOptionalSegmentView = 0;

    v14->_topLevelAxis = 1;
    chartOverlayStackView = v14->_chartOverlayStackView;
    v14->_chartOverlayStackView = 0;

    uint64_t v32 = HKCreateSerialDispatchQueue();
    contextUpdateQueue = v14->_contextUpdateQueue;
    v14->_contextUpdateQueue = (OS_dispatch_queue *)v32;

    v14->_shouldSelectInitialOverlay = 1;
    v14->_additionalChartOptions = 0;
    initialVisibleDateRange = v14->_initialVisibleDateRange;
    v14->_initialVisibleDateRange = 0;

    v14->_previousHorizontalSizeClass = 0;
    v14->_previousWidthDesignation = 1;
    v35 = [(HKOverlayRoomViewController *)v14 navigationItem];
    [v35 setLargeTitleDisplayMode:2];

    singleContextMaximumSizeView = v14->_singleContextMaximumSizeView;
    v14->_singleContextMaximumSizeView = 0;

    v37 = [_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager alloc];
    v38 = [v12 healthStore];
    uint64_t v39 = [(HKInteractiveChartInteractionAnalyticsManager *)v37 initWithHealthStore:v38];
    analyticsManager = v14->_analyticsManager;
    v14->_analyticsManager = (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager *)v39;

    v47[0] = objc_opt_class();
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
    uint64_t v42 = [(HKOverlayRoomViewController *)v14 registerForTraitChanges:v41 withTarget:v14 action:sel__horizontalSizeClassChanged_];
    traitChangeRegistration = v14->_traitChangeRegistration;
    v14->_traitChangeRegistration = (UITraitChangeRegistration *)v42;

    objc_storeStrong((id *)&v14->_factorDisplayTypes, a5);
    previousStackHeights = v14->_previousStackHeights;
    v14->_previousStackHeights = 0;
  }
  return v14;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"class %@ (%p)", v5, self];

  return (NSString *)v6;
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:208 description:@"Subclasses must implement controllerTitleWithApplicationItems"];

  return @"**NO**TITLE**";
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  v5 = (void *)MEMORY[0x1E4F28B00];
  id v6 = a3;
  v7 = [v5 currentHandler];
  [v7 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:214 description:@"Subclasses must implement primaryDisplayTypeWithApplicationItems:"];

  v8 = [v6 displayTypeController];

  v9 = [v8 displayTypeWithIdentifier:&unk_1F3C20308];

  return v9;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:221 description:@"Subclasses must implement contextSectionContainersForMode:applicationItems:overlayChartController"];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (int64_t)initialSelectedContainerIndexForMode:(int64_t)a3
{
  return 0;
}

- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4
{
  id v6 = [(HKOverlayRoomViewController *)self preferredInitialOverlayIndex];
  if (v6 && [(HKOverlayRoomViewController *)self containerIndexForHealthFactors] != a4) {
    v7 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", a4, 0, [v6 integerValue]);
  }
  else {
    v7 = 0;
  }

  return v7;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:248 description:@"Subclasses must implement createViewControllerMode:displayDate:applicationItems:"];

  return 0;
}

- (BOOL)supportsShowAllFilters
{
  return (unint64_t)([(HKOverlayRoomViewController *)self controllerMode] - 1) < 2;
}

- (id)showAllFiltersButtonTitle
{
  v2 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  v3 = [v2 localization];
  v4 = [v3 displayName];

  if (v4 && ([v4 isEqualToString:&stru_1F3B9CF20] & 1) == 0)
  {
    v7 = NSString;
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v8 = [v5 localizedStringForKey:@"SHOW_MORE_%@_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    id v6 = objc_msgSend(v7, "localizedStringWithFormat:", v8, v4);
  }
  else
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v6 = [v5 localizedStringForKey:@"SHOW_MORE_DATA" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  }

  return v6;
}

- (id)preferredInitialOverlayIndex
{
  return 0;
}

- (unint64_t)filteredInteractiveChartOptionsForMode:(int64_t)a3
{
  unint64_t result = [(HKOverlayRoomViewController *)self additionalChartOptions];
  if (a3 == 3) {
    result |= 0x2000uLL;
  }
  return result;
}

- (id)buildFactorContextSectionForChartController
{
  v3 = [(HKOverlayRoomViewController *)self buildFactorContextsAllowingDeselection:1];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 activeFactorContexts];
    id v6 = [v4 inactiveFactorContexts];
    v7 = [v5 arrayByAddingObjectsFromArray:v6];

    v8 = [HKOverlayContextSection alloc];
    v9 = [(HKOverlayRoomViewController *)self _healthFactorsSectionTitle];
    v10 = [(HKOverlayContextSection *)v8 initWithSectionTitle:v9 overlayContextItems:v7];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)buildFactorContextsAllowingDeselection:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(HKOverlayRoomViewController *)self healthFactorsEnabled])
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [(HKOverlayRoomViewController *)self primaryDisplayType];

    if (!v6)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2 object:self file:@"HKOverlayRoomViewController.m" lineNumber:315 description:@"Nil primary display type"];
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = [(HKOverlayRoomViewController *)self factorDisplayTypes];
    uint64_t v7 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          id v12 = [(HKOverlayRoomViewController *)self primaryDisplayType];
          id v13 = [(HKOverlayRoomViewController *)self chartController];
          v14 = [(HKOverlayRoomViewController *)self applicationItems];
          LOBYTE(v20) = a3;
          id v15 = [(HKOverlayRoomViewController *)self buildFactorContextForDisplayType:v12 factorDisplayType:v11 overlayChartController:v13 currentCalendarOverride:0 applicationItems:v14 overlayMode:[(HKOverlayRoomViewController *)self controllerMode] allowsDeselection:v20];

          if (v15)
          {
            if ([(HKOverlayRoomViewController *)self factorDisplayTypeIsActive:v11]) {
              v16 = v23;
            }
            else {
              v16 = v22;
            }
            [v16 addObject:v15];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    v17 = [[HKOverlayRoomActiveInactiveFactorContexts alloc] initWithActiveFactorContexts:v23 inactiveFactorContexts:v22];
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (BOOL)factorDisplayTypeIsActive:(id)a3
{
  v4 = [a3 sampleType];
  if (v4)
  {
    v5 = [(HKOverlayRoomViewController *)self applicationItems];
    id v6 = [v5 sampleDateRangeController];

    uint64_t v7 = [v6 dateRangeForSampleType:v4];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
      char v10 = [v8 containsValue:v9 exclusiveStart:0 exclusiveEnd:0];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)combineFactors:(id)a3 standardFactors:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 activeFactorContexts];
  uint64_t v8 = [v7 arrayByAddingObjectsFromArray:v5];

  uint64_t v9 = [v6 inactiveFactorContexts];

  char v10 = [v8 arrayByAddingObjectsFromArray:v9];

  return v10;
}

- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v14;
    LOBYTE(v22) = a9;
    uint64_t v20 = [[HKOverlayRoomFactorContext alloc] initWithPrimaryInteractiveChartDisplayType:v19 factorDisplayType:v18 overlayChartController:v17 currentCalendarOverride:v16 applicationItems:v15 overlayMode:a8 allowsDeselection:v22];
  }
  else
  {
    LOBYTE(v22) = a9;
    uint64_t v20 = [[HKOverlayRoomFactorContext alloc] initWithPrimaryDisplayType:v14 factorDisplayType:v18 overlayChartController:v17 currentCalendarOverride:v16 applicationItems:v15 overlayMode:a8 allowsDeselection:v22];
  }

  return v20;
}

- (id)_addHealthFactorsIfNecessary:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if ([(HKOverlayRoomViewController *)self supportsHealthFactors])
  {
    id v5 = v4;
    if (![(HKOverlayRoomViewController *)self _containersContainHealthFactorsSection:v4])
    {
      id v5 = v4;
      if ([(HKOverlayRoomViewController *)self controllerMode] == 3)
      {
        if ([v4 count] == 1)
        {
          id v6 = [(HKOverlayRoomViewController *)self buildFactorContextsAllowingDeselection:1];
          uint64_t v7 = v6;
          if (v6)
          {
            uint64_t v8 = [v6 activeFactorContexts];
            uint64_t v9 = [v7 inactiveFactorContexts];
            uint64_t v22 = [v8 arrayByAddingObjectsFromArray:v9];

            char v10 = [[HKOverlayContextSection alloc] initWithSectionTitle:0 overlayContextItems:v22];
            uint64_t v11 = [HKOverlayContextSectionContainer alloc];
            id v12 = [(HKOverlayRoomViewController *)self _healthFactorsSectionTitle];
            v26[0] = v10;
            id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
            id v14 = [(HKOverlayContextSectionContainer *)v11 initWithContainerTitle:v12 overlayContextSections:v13];

            id v15 = [v4 firstObject];
            id v16 = [HKOverlayContextSectionContainer alloc];
            id v17 = [(HKOverlayRoomViewController *)self _healthFactorsMeasurementSectionTitle];
            id v18 = [v15 overlayContextSections];
            id v19 = [v15 primaryDisplayType];
            uint64_t v20 = [(HKOverlayContextSectionContainer *)v16 initWithContainerTitle:v17 overlayContextSections:v18 primaryDisplayType:v19];

            v25[0] = v20;
            v25[1] = v14;
            id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

LABEL_10:
            goto LABEL_11;
          }
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v7 = HKUILogCharting();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            long long v24 = self;
            _os_log_impl(&dword_1E0B26000, v7, OS_LOG_TYPE_DEFAULT, "HKOverlayRoomViewController %@: Supports health factors but does not define a location for the factor contexts", buf, 0xCu);
          }
        }
        id v5 = v4;
        goto LABEL_10;
      }
    }
  }
LABEL_11:

  return v5;
}

- (int64_t)containerIndexForHealthFactors
{
  v3 = [(HKOverlayRoomViewController *)self _healthFactorsSectionTitle];
  id v4 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
      uint64_t v8 = [v7 objectAtIndexedSubscript:v6];

      uint64_t v9 = [v8 localizedContainerTitle];
      char v10 = [v9 isEqualToString:v3];

      if (v10) {
        break;
      }
      ++v6;
      uint64_t v11 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
      unint64_t v12 = [v11 count];

      if (v6 >= v12) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v6 = -1;
  }

  return v6;
}

- (BOOL)_containersContainHealthFactorsSection:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v38;
    long long v26 = self;
    uint64_t v24 = *(void *)v38;
    do
    {
      uint64_t v7 = 0;
      uint64_t v25 = v5;
      do
      {
        if (*(void *)v38 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v37 + 1) + 8 * v7);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v9 = [v8 overlayContextSections];
        uint64_t v28 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v28)
        {
          uint64_t v10 = *(void *)v34;
          uint64_t v27 = *(void *)v34;
          while (2)
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v34 != v10) {
                objc_enumerationMutation(v9);
              }
              unint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              id v13 = [v12 localizedSectionTitle];
              id v14 = [(HKOverlayRoomViewController *)self _healthFactorsSectionTitle];
              char v15 = [v13 isEqualToString:v14];

              if (v15)
              {
LABEL_27:

                BOOL v22 = 1;
                goto LABEL_29;
              }
              long long v31 = 0u;
              long long v32 = 0u;
              long long v29 = 0u;
              long long v30 = 0u;
              id v16 = [v12 overlayContextItems];
              uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v41 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v30;
                while (2)
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v30 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    v21 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                    if (objc_opt_respondsToSelector() & 1) != 0 && ([v21 healthFactorContext])
                    {

                      goto LABEL_27;
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v41 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              uint64_t v10 = v27;
              self = v26;
            }
            uint64_t v6 = v24;
            uint64_t v28 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
            if (v28) {
              continue;
            }
            break;
          }
        }

        ++v7;
      }
      while (v7 != v25);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v37 objects:v43 count:16];
      BOOL v22 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_29:

  return v22;
}

- (id)_healthFactorsSectionTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"HEALTH_EVENTS_SECTION_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pregnancy"];

  return v3;
}

- (id)_healthFactorsMeasurementSectionTitle
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"HEALTH_EVENTS_MEASUREMENT_TITLE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Pregnancy"];

  return v3;
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (BOOL)healthFactorsEnabled
{
  if (![(HKOverlayRoomViewController *)self supportsHealthFactors]) {
    return 0;
  }
  v3 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
  if (v3)
  {
    id v4 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HKOverlayRoomViewController;
  [(HKOverlayRoomViewController *)&v5 viewDidLoad];
  [(HKOverlayRoomViewController *)self _setupPrimaryDisplayType];
  [(HKOverlayRoomViewController *)self _setupInterface];
  [(HKOverlayRoomViewController *)self _setupOverlayContextItems];
  v3 = [(HKOverlayRoomViewController *)self applicationItems];
  id v4 = [v3 sampleDateRangeController];
  [v4 addObserver:self];

  [(HKOverlayRoomViewController *)self _subscribeToSampleTypeUpdates];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HKOverlayRoomViewController;
  [(HKOverlayRoomViewController *)&v3 viewDidLayoutSubviews];
  [(HKOverlayRoomViewController *)self _layoutSegmentedControl];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HKOverlayRoomViewController;
  [(HKOverlayRoomViewController *)&v7 viewDidAppear:a3];
  BOOL v4 = [(UIViewController *)self hk_viewIsHidden];
  objc_super v5 = [(HKOverlayRoomViewController *)self restorationUserActivity];

  if (v5)
  {
    if (!v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__HKOverlayRoomViewController_viewDidAppear___block_invoke;
      block[3] = &unk_1E6D50ED8;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __45__HKOverlayRoomViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [v1 restorationUserActivity];
  [v1 restoreUserActivityState:v2];
}

- (void)dealloc
{
  objc_super v3 = [(HKOverlayRoomViewController *)self applicationItems];
  BOOL v4 = [v3 sampleDateRangeController];
  [v4 removeObserver:self];

  objc_super v5 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v6 = [v5 sampleTypeUpdateController];
  objc_super v7 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  uint64_t v8 = [v7 sampleType];
  [v6 removeObserver:self forType:v8];

  uint64_t v9 = [(HKOverlayRoomViewController *)self traitChangeRegistration];
  [(HKOverlayRoomViewController *)self unregisterForTraitChanges:v9];

  v10.receiver = self;
  v10.super_class = (Class)HKOverlayRoomViewController;
  [(HKOverlayRoomViewController *)&v10 dealloc];
}

- (void)reloadOverlayContextItems
{
  [(HKOverlayRoomViewController *)self _unselectCurrentContext];
  [(HKOverlayRoomViewController *)self _setupOverlayContainers];
  [(HKOverlayRoomViewController *)self _setupOverlayContextItems];
}

- (void)refreshOverlayContextItems
{
}

- (void)_updateContextTiles
{
  objc_super v3 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return;
  }
  objc_super v5 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];

  if (v5)
  {
    uint64_t v6 = [(HKOverlayRoomViewController *)self sectionedContextView];
    objc_super v7 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
    uint64_t v8 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
LABEL_6:
    objc_super v10 = v8;
    uint64_t v11 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v8, "containerIndex"));
    unint64_t v12 = [v11 overlayContextSections];
    [v6 setDisplayTypeContextSections:v12];

    goto LABEL_7;
  }
  uint64_t v9 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];

  uint64_t v6 = [(HKOverlayRoomViewController *)self sectionedContextView];
  objc_super v7 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  if (v9)
  {
    uint64_t v8 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];
    goto LABEL_6;
  }
  objc_super v10 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[HKOverlayRoomViewController segmentedControlSelectedIndex](self, "segmentedControlSelectedIndex"));
  uint64_t v11 = [v10 overlayContextSections];
  [v6 setDisplayTypeContextSections:v11];
LABEL_7:

  if (![(HKOverlayRoomViewController *)self userHasOverriddenPreferredOverlay])
  {
    [(HKOverlayRoomViewController *)self _selectPreferredItem];
  }
}

- (void)_selectPreferredItem
{
  uint64_t v3 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    objc_super v5 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];
    uint64_t v6 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
    char v7 = [v5 isEqual:v6];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];
      [(HKOverlayRoomViewController *)self setCurrentSelectedContextLocation:v8];

      uint64_t v9 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
      -[HKOverlayRoomViewController setSegmentedControlSelectedIndex:](self, "setSegmentedControlSelectedIndex:", [v9 containerIndex]);

      objc_super v10 = (void *)MEMORY[0x1E4F28D58];
      uint64_t v11 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];
      uint64_t v12 = [v11 itemIndex];
      id v13 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];
      objc_msgSend(v10, "indexPathForRow:inSection:", v12, objc_msgSend(v13, "sectionIndex"));
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      id v14 = [(HKOverlayRoomViewController *)self sectionedContextView];
      [v14 selectItemAtIndexPath:v16 animated:0 scrollPosition:0];

      char v15 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];
      [(HKOverlayRoomViewController *)self _updateChartForOverlaySelection:v15 previousSelection:0];
    }
  }
}

- (void)_setupPrimaryDisplayType
{
  uint64_t v3 = [(HKOverlayRoomViewController *)self applicationItems];
  id v7 = [(HKOverlayRoomViewController *)self primaryDisplayTypeWithApplicationItems:v3];

  uint64_t v4 = [v7 presentation];
  objc_super v5 = (void *)[v4 copyWithIsCriticalForAutoscale:1];
  uint64_t v6 = (void *)[v7 copyWithPresentation:v5];
  [(HKOverlayRoomViewController *)self setPrimaryDisplayType:v6];
}

- (id)createChartOverlayViewController
{
  uint64_t v3 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  uint64_t v4 = objc_msgSend(v3, "hk_interactiveChartOptions");

  objc_super v5 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(HKOverlayRoomViewController *)self primaryDisplayType];
    uint64_t v8 = [v7 baseDisplayType];
    uint64_t v9 = v8;
    if (v8) {
      uint64_t v4 = objc_msgSend(v8, "hk_interactiveChartOptions");
    }
  }
  if ([(HKOverlayRoomViewController *)self conformsToProtocol:&unk_1F3C50E88]
    && ([(HKOverlayRoomViewController *)self getChartSummaryTrendModelToModify],
        objc_super v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 selectTrendInitially],
        v10,
        (v11 & 1) != 0)
    || self->_controllerMode == 3)
  {
    v4 |= 0x2000uLL;
  }
  unint64_t v12 = [(HKOverlayRoomViewController *)self additionalChartOptions] | v4;
  BOOL v13 = [(HKOverlayRoomViewController *)self prefersOpaqueLegends];
  uint64_t v14 = v12 | 0x10000;
  if (!v13) {
    uint64_t v14 = v12;
  }
  uint64_t v29 = v14;
  uint64_t v28 = [HKInteractiveChartOverlayViewController alloc];
  long long v32 = [(HKOverlayRoomViewController *)self applicationItems];
  long long v33 = [v32 healthStore];
  long long v26 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  long long v31 = [(HKOverlayRoomViewController *)self applicationItems];
  char v15 = [v31 unitController];
  long long v30 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v16 = [v30 dateCache];
  uint64_t v27 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v17 = [v27 chartDataCacheController];
  uint64_t v18 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v19 = [v18 timeScopeController];
  uint64_t v20 = [(HKOverlayRoomViewController *)self applicationItems];
  v21 = [v20 sampleDateRangeController];
  BOOL v22 = [(HKOverlayRoomViewController *)self displayDate];
  id v23 = (void *)v16;
  uint64_t v24 = [(HKInteractiveChartOverlayViewController *)v28 initWithHealthStore:v33 primaryDisplayType:v26 unitPreferenceController:v15 dateCache:v16 chartDataCacheController:v17 selectedTimeScopeController:v19 sampleTypeDateRangeController:v21 initialXValue:v22 currentCalendarOverride:0 options:v29];

  [(HKInteractiveChartViewController *)v24 setCurrentOverlayLocationProvider:self];
  return v24;
}

- (BOOL)prefersOpaqueLegends
{
  return 1;
}

- (id)_segmentedControlTitles
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (v9)
        {
          uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) localizedContainerTitle];
          if (v10)
          {
            char v11 = (void *)v10;
            unint64_t v12 = [v9 localizedContainerTitle];
            uint64_t v13 = [v12 length];

            if (v13)
            {
              uint64_t v14 = [v9 localizedContainerTitle];
              [v3 addObject:v14];
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_setupInterface
{
  [(HKOverlayRoomViewController *)self _setupTopLevelChartView];
  [(HKOverlayRoomViewController *)self _setupOverlayContainers];
  [(HKOverlayRoomViewController *)self _setupTopLevelOverlaysWithOptionalSegmentView];
  id v3 = [(HKOverlayRoomViewController *)self traitCollection];
  uint64_t v4 = [v3 horizontalSizeClass];

  [(HKOverlayRoomViewController *)self _configureStackViewsUsingHorizontalSizeClass:v4];
  uint64_t v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  uint64_t v6 = [(HKOverlayRoomViewController *)self view];
  [v6 setBackgroundColor:v5];

  uint64_t v7 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"Top");
  uint64_t v8 = [(HKOverlayRoomViewController *)self view];
  [v8 setAccessibilityIdentifier:v7];

  id v10 = [(HKOverlayRoomViewController *)self applicationItems];
  uint64_t v9 = [(HKOverlayRoomViewController *)self controllerTitleWithApplicationItems:v10];
  [(HKOverlayRoomViewController *)self setTitle:v9];
}

- (void)_setupTopLevelChartView
{
  v59[9] = *MEMORY[0x1E4F143B8];
  id v3 = [(HKOverlayRoomViewController *)self createChartOverlayViewController];
  [(HKOverlayRoomViewController *)self setChartController:v3];

  uint64_t v4 = [(HKOverlayRoomViewController *)self chartController];
  [v4 addChartViewObserver:self];

  uint64_t v5 = [(HKOverlayRoomViewController *)self chartController];
  [(HKOverlayRoomViewController *)self addChildViewController:v5];

  uint64_t v6 = [(HKOverlayRoomViewController *)self chartController];
  uint64_t v7 = [v6 view];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = [(HKOverlayRoomViewController *)self initialVisibleDateRange];
  uint64_t v9 = [(HKOverlayRoomViewController *)self chartController];
  [v9 setInitialVisibleDateRange:v8];

  id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  char v11 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  topLevelChartView = self->_topLevelChartView;
  self->_topLevelChartView = v11;

  [(UIView *)self->_topLevelChartView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v13 = [(HKOverlayRoomViewController *)self view];
  [v13 addSubview:self->_topLevelChartView];

  [(UIView *)self->_topLevelChartView addSubview:v7];
  uint64_t v14 = [v7 bottomAnchor];
  char v15 = [(UIView *)self->_topLevelChartView bottomAnchor];
  long long v16 = [v14 constraintEqualToAnchor:v15];
  chartControllerViewToTopLevelChartViewBottomConstraint = self->_chartControllerViewToTopLevelChartViewBottomConstraint;
  self->_chartControllerViewToTopLevelChartViewBottomConstraint = v16;

  long long v18 = [(UIView *)self->_topLevelChartView trailingAnchor];
  long long v19 = [(HKOverlayRoomViewController *)self view];
  uint64_t v20 = [v19 safeAreaLayoutGuide];
  uint64_t v21 = [v20 trailingAnchor];
  BOOL v22 = [v18 constraintEqualToAnchor:v21];
  topLevelChartViewTrailingConstraint = self->_topLevelChartViewTrailingConstraint;
  self->_topLevelChartViewTrailingConstraint = v22;

  uint64_t v24 = [(UIView *)self->_topLevelChartView leadingAnchor];
  uint64_t v25 = [(HKOverlayRoomViewController *)self view];
  long long v26 = [v25 safeAreaLayoutGuide];
  uint64_t v27 = [v26 leadingAnchor];
  uint64_t v28 = [v24 constraintEqualToAnchor:v27];
  topLevelChartViewLeadingConstraint = self->_topLevelChartViewLeadingConstraint;
  self->_topLevelChartViewLeadingConstraint = v28;

  long long v30 = [(UIView *)self->_topLevelChartView bottomAnchor];
  long long v31 = [v7 bottomAnchor];
  long long v32 = [v30 constraintEqualToAnchor:v31];
  topLevelChartViewBottomConstraint = self->_topLevelChartViewBottomConstraint;
  self->_topLevelChartViewBottomConstraint = v32;

  long long v34 = [v7 heightAnchor];
  long long v35 = [v34 constraintGreaterThanOrEqualToConstant:100.0];
  chartControllerViewHeightConstraint = self->_chartControllerViewHeightConstraint;
  self->_chartControllerViewHeightConstraint = v35;

  v52 = (void *)MEMORY[0x1E4F28DC8];
  long long v37 = self->_topLevelChartViewTrailingConstraint;
  v59[0] = self->_topLevelChartViewLeadingConstraint;
  v59[1] = v37;
  v57 = [(UIView *)self->_topLevelChartView topAnchor];
  v58 = [(HKOverlayRoomViewController *)self view];
  v56 = [v58 safeAreaLayoutGuide];
  v55 = [v56 topAnchor];
  v54 = [v57 constraintEqualToAnchor:v55];
  long long v38 = self->_topLevelChartViewBottomConstraint;
  v59[2] = v54;
  v59[3] = v38;
  long long v39 = v7;
  v51 = [v7 leadingAnchor];
  v50 = [(UIView *)self->_topLevelChartView leadingAnchor];
  long long v40 = [v51 constraintEqualToAnchor:v50];
  v59[4] = v40;
  v53 = v39;
  v41 = [v39 trailingAnchor];
  uint64_t v42 = [(UIView *)self->_topLevelChartView trailingAnchor];
  v43 = [v41 constraintEqualToAnchor:v42];
  v59[5] = v43;
  uint64_t v44 = [v39 topAnchor];
  v45 = [(UIView *)self->_topLevelChartView topAnchor];
  objc_super v46 = [v44 constraintEqualToAnchor:v45];
  v47 = self->_chartControllerViewToTopLevelChartViewBottomConstraint;
  v59[6] = v46;
  v59[7] = v47;
  v59[8] = self->_chartControllerViewHeightConstraint;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:9];
  [v52 activateConstraints:v48];

  v49 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"Top.Chart");
  [(UIView *)self->_topLevelChartView setAccessibilityIdentifier:v49];
}

- (void)_setupTopLevelOverlaysWithOptionalSegmentView
{
  v59[4] = *MEMORY[0x1E4F143B8];
  id v3 = [(HKOverlayRoomViewController *)self _createOverlaysWithOptionalSegmentedControllerStackView];
  overlaysWithOptionalSegmentController = self->_overlaysWithOptionalSegmentController;
  self->_overlaysWithOptionalSegmentController = v3;

  [(UIStackView *)self->_overlaysWithOptionalSegmentController setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  uint64_t v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  topLevelOverlaysWithOptionalSegmentView = self->_topLevelOverlaysWithOptionalSegmentView;
  self->_topLevelOverlaysWithOptionalSegmentView = v6;

  [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v8 = [(HKOverlayRoomViewController *)self _contextViewBackgroundColor];
  [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView setBackgroundColor:v8];

  [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView addSubview:self->_overlaysWithOptionalSegmentController];
  uint64_t v9 = [(UIStackView *)self->_overlaysWithOptionalSegmentController leadingAnchor];
  id v10 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView leadingAnchor];
  char v11 = [v9 constraintEqualToAnchor:v10];
  overlaysWithOptionalSegmentLeadingConstraint = self->_overlaysWithOptionalSegmentLeadingConstraint;
  self->_overlaysWithOptionalSegmentLeadingConstraint = v11;

  uint64_t v13 = [(UIStackView *)self->_overlaysWithOptionalSegmentController trailingAnchor];
  uint64_t v14 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView trailingAnchor];
  char v15 = [v13 constraintEqualToAnchor:v14];
  overlaysWithOptionalSegmentTrailingConstraint = self->_overlaysWithOptionalSegmentTrailingConstraint;
  self->_overlaysWithOptionalSegmentTrailingConstraint = v15;

  long long v17 = [(HKOverlayRoomViewController *)self segmentedControl];
  if (v17) {
    double v18 = 15.0;
  }
  else {
    double v18 = 0.0;
  }

  long long v19 = [(UIStackView *)self->_overlaysWithOptionalSegmentController topAnchor];
  uint64_t v20 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView safeAreaLayoutGuide];
  uint64_t v21 = [v20 topAnchor];
  BOOL v22 = [v19 constraintEqualToAnchor:v21 constant:v18];
  overlaysWithOptionalSegmentTopConstraint = self->_overlaysWithOptionalSegmentTopConstraint;
  self->_overlaysWithOptionalSegmentTopConstraint = v22;

  uint64_t v24 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v25 = self->_overlaysWithOptionalSegmentTrailingConstraint;
  v59[0] = self->_overlaysWithOptionalSegmentLeadingConstraint;
  v59[1] = v25;
  v59[2] = self->_overlaysWithOptionalSegmentTopConstraint;
  long long v26 = [(UIStackView *)self->_overlaysWithOptionalSegmentController bottomAnchor];
  uint64_t v27 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView bottomAnchor];
  uint64_t v28 = [v26 constraintEqualToAnchor:v27];
  v59[3] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:4];
  [v24 activateConstraints:v29];

  long long v30 = [(HKOverlayRoomViewController *)self view];
  [v30 addSubview:self->_topLevelOverlaysWithOptionalSegmentView];

  long long v31 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView leadingAnchor];
  long long v32 = [(HKOverlayRoomViewController *)self view];
  long long v33 = [v32 safeAreaLayoutGuide];
  long long v34 = [v33 leadingAnchor];
  long long v35 = [v31 constraintEqualToAnchor:v34];
  topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = v35;

  long long v37 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView trailingAnchor];
  long long v38 = [(HKOverlayRoomViewController *)self view];
  long long v39 = [v38 safeAreaLayoutGuide];
  long long v40 = [v39 trailingAnchor];
  v41 = [v37 constraintEqualToAnchor:v40];
  topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = v41;

  v43 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView topAnchor];
  uint64_t v44 = [(UIView *)self->_topLevelChartView bottomAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  topLevelOverlaysWithOptionalSegmentViewTopConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint = v45;

  v47 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView widthAnchor];
  v48 = [v47 constraintEqualToConstant:336.0];
  topLevelOverlaysWithOptionalSegmentViewWidthConstraint = self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint = v48;

  v50 = (void *)MEMORY[0x1E4F28DC8];
  v51 = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v58[0] = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v58[1] = v51;
  v58[2] = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v52 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView bottomAnchor];
  v53 = [(HKOverlayRoomViewController *)self view];
  v54 = [v53 bottomAnchor];
  v55 = [v52 constraintEqualToAnchor:v54];
  v58[3] = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
  [v50 activateConstraints:v56];

  v57 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"Top.OverlaysWithOptionalSegment");
  [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView setAccessibilityIdentifier:v57];
}

- (id)_createOverlaysWithOptionalSegmentedControllerStackView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(HKOverlayRoomViewController *)self _setupSegmentedControl];
  if (v4) {
    [v3 addObject:v4];
  }
  id v5 = [(HKOverlayRoomViewController *)self _createOverlayStackView];
  chartOverlayStackView = self->_chartOverlayStackView;
  self->_chartOverlayStackView = v5;

  [v3 addObject:self->_chartOverlayStackView];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v3];
  [v7 setAxis:1];

  return v7;
}

- (id)_createOverlayStackView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = [(HKOverlayRoomViewController *)self supportsShowAllFilters];
  if ([(HKOverlayRoomViewController *)self _contextItemCount] >= 1)
  {
    id v5 = [[HKDisplayTypeSectionedContextView alloc] initWithStyle:[(HKOverlayRoomViewController *)self controllerMode]];
    [(HKOverlayRoomViewController *)self setSectionedContextView:v5];

    uint64_t v6 = [(HKOverlayRoomViewController *)self _contextViewBackgroundColor];
    uint64_t v7 = [(HKOverlayRoomViewController *)self sectionedContextView];
    [v7 setBackgroundColor:v6];

    uint64_t v8 = [(HKOverlayRoomViewController *)self sectionedContextView];
    [v8 setDelegate:self];

    uint64_t v9 = [(HKOverlayRoomViewController *)self sectionedContextView];
    [(HKOverlayRoomViewController *)self _layoutNoVerticalExpansion:v9];

    if ([(HKOverlayRoomViewController *)self controllerMode] != 1 || v4)
    {
      [(HKOverlayRoomViewController *)self sectionedContextView];
    }
    else
    {
      char v11 = [HKMaximumSizeView alloc];
      unint64_t v12 = [(HKOverlayRoomViewController *)self sectionedContextView];
      uint64_t v13 = -[HKMaximumSizeView initWithView:maximumSize:](v11, "initWithView:maximumSize:", v12, *MEMORY[0x1E4FB30D8], *MEMORY[0x1E4FB30D8]);
      [(HKOverlayRoomViewController *)self setSingleContextMaximumSizeView:v13];

      [(HKOverlayRoomViewController *)self singleContextMaximumSizeView];
    uint64_t v14 = };
    [v3 addObject:v14];

    if ([(HKOverlayRoomViewController *)self controllerMode] == 3)
    {
      char v15 = [(HKOverlayRoomViewController *)self sectionedContextView];
      [v15 setUseHorizontalInsets:1];

      long long v16 = [MEMORY[0x1E4F2B860] sharedBehavior];
      int v17 = [v16 isiPad];

      if (v17)
      {
        double v18 = [(HKOverlayRoomViewController *)self sectionedContextView];
        [v18 setUseTopInsetsWithNoHeader:0];
      }
    }
  }
  if (v4)
  {
    long long v19 = [(HKOverlayRoomViewController *)self showAllFiltersButtonTitle];
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4FB14D0], "hk_chartShowMoreDataButtonWithTitleOverride:target:action:", v19, self, sel__showAllFilters_);
    [(HKOverlayRoomViewController *)self _layoutNoVerticalExpansion:v20];
    [v3 addObject:v20];
  }
  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x1E4FB1C60]) initWithArrangedSubviews:v3];
  [v21 setLayoutMarginsRelativeArrangement:1];
  BOOL v22 = [(HKOverlayRoomViewController *)self _contextViewBackgroundColor];
  [v21 setBackgroundColor:v22];

  return v21;
}

- (unint64_t)_fullViewRatioModeToAxis:(int64_t)a3
{
  return a3 != 1;
}

- (unint64_t)_fullModeTransitionToSizeClass:(int64_t)a3
{
  if ((unint64_t)a3 < 2) {
    return 2 * ([(HKOverlayRoomViewController *)self previousHorizontalSizeClass] != 1);
  }
  if (a3 == 2) {
    return [(HKOverlayRoomViewController *)self previousHorizontalSizeClass] != 2;
  }
  return 0;
}

- (unint64_t)_singleModeTransitionToSizeClass:(int64_t)a3
{
  if ([(HKOverlayRoomViewController *)self previousHorizontalSizeClass]
    && [(HKOverlayRoomViewController *)self previousHorizontalSizeClass] == a3)
  {
    return 0;
  }
  if (a3 == 2) {
    return 1;
  }
  return 2;
}

- (int64_t)_widthDesignationFromTraitCollection:(id)a3
{
  id v3 = a3;
  int64_t v4 = [v3 valueForNSIntegerTrait:objc_opt_class()];

  return v4;
}

- (BOOL)_shouldStackSingleModeWithShowAllFiltersOverlayAreaVertically
{
  id v3 = [(HKOverlayRoomViewController *)self traitCollection];
  int64_t v4 = [(HKOverlayRoomViewController *)self _widthDesignationFromTraitCollection:v3];

  return (unint64_t)(v4 - 7) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)_configureStackViewsUsingHorizontalSizeClass:(int64_t)a3
{
  switch([(HKOverlayRoomViewController *)self controllerMode])
  {
    case 0:
    case 2:
      unint64_t v5 = [(HKOverlayRoomViewController *)self _singleModeTransitionToSizeClass:a3];
      if (v5 == 2) {
        goto LABEL_16;
      }
      if (v5 == 1)
      {
        [(HKOverlayRoomViewController *)self _configureMainAreaVertically];
        goto LABEL_5;
      }
      goto LABEL_30;
    case 1:
      BOOL v6 = [(HKOverlayRoomViewController *)self supportsShowAllFilters];
      unint64_t v7 = [(HKOverlayRoomViewController *)self _singleModeTransitionToSizeClass:a3];
      if (v7 == 2)
      {
LABEL_16:
        [(HKOverlayRoomViewController *)self _configureMainAreaVertically];
LABEL_17:
        [(HKOverlayRoomViewController *)self _configureOverlayAreaVertically];
        goto LABEL_30;
      }
      if (v7 == 1)
      {
        [(HKOverlayRoomViewController *)self _configureMainAreaVertically];
        if (!v6) {
          goto LABEL_5;
        }
      }
      else if (v7 || !v6)
      {
        goto LABEL_30;
      }
      if ([(HKOverlayRoomViewController *)self _shouldStackSingleModeWithShowAllFiltersOverlayAreaVertically])
      {
        goto LABEL_17;
      }
LABEL_5:
      [(HKOverlayRoomViewController *)self _configureOverlayAreaHorizontally];
      goto LABEL_30;
    case 3:
      unint64_t v8 = [(HKOverlayRoomViewController *)self _fullModeTransitionToSizeClass:a3];
      if (v8 >= 2)
      {
        if (v8 != 2) {
          goto LABEL_26;
        }
        [(HKOverlayRoomViewController *)self _configureMainAreaVertically];
        goto LABEL_25;
      }
      if (a3 == 2)
      {
        int v9 = [(HKOverlayRoomViewController *)self _isInPortraitLayout];
        if ([(HKOverlayRoomViewController *)self topLevelAxis] != v9)
        {
          if (v9) {
            [(HKOverlayRoomViewController *)self _configureMainAreaVertically];
          }
          else {
            [(HKOverlayRoomViewController *)self _configureMainAreaHorizontally];
          }
        }
        id v10 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
        uint64_t v11 = [v10 axis];

        if (v11 != 1) {
LABEL_25:
        }
          [(HKOverlayRoomViewController *)self _configureOverlayAreaVertically];
      }
LABEL_26:
      unint64_t v12 = [(HKOverlayRoomViewController *)self _fullViewRatioModeToAxis:[(HKOverlayRoomViewController *)self topLevelAxis]];
      if (v12 == 1)
      {
        [(HKOverlayRoomViewController *)self _configureChartHeightUsingDefault];
      }
      else if (!v12)
      {
        [(HKOverlayRoomViewController *)self _configureChartHeightUsingViewRatio];
      }
LABEL_30:
      [(HKOverlayRoomViewController *)self setPreviousHorizontalSizeClass:a3];
      return;
    default:
      goto LABEL_30;
  }
}

- (BOOL)_isInPortraitLayout
{
  id v3 = [(HKOverlayRoomViewController *)self view];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  unint64_t v12 = self;
  uint64_t v13 = [(HKOverlayRoomViewController *)v12 parentViewController];

  if (v13)
  {
    do
    {
      uint64_t v14 = [(HKOverlayRoomViewController *)v12 parentViewController];

      char v15 = [(HKOverlayRoomViewController *)v14 parentViewController];

      unint64_t v12 = v14;
    }
    while (v15);
  }
  else
  {
    uint64_t v14 = v12;
  }
  long long v16 = [(HKOverlayRoomViewController *)v14 presentationController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v18 = [(HKOverlayRoomViewController *)v14 presentationController];
    [v18 frameOfPresentedViewInContainerView];
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    v30.origin.x = v20;
    v30.origin.y = v22;
    v30.size.width = v24;
    v30.size.height = v26;
    if (!CGRectIsNull(v30))
    {
      CGFloat v5 = v20;
      CGFloat v7 = v22;
      CGFloat v9 = v24;
      CGFloat v11 = v26;
    }
  }
  v31.origin.x = v5;
  v31.origin.y = v7;
  v31.size.width = v9;
  v31.size.height = v11;
  double Width = CGRectGetWidth(v31);
  v32.origin.x = v5;
  v32.origin.y = v7;
  v32.size.width = v9;
  v32.size.height = v11;
  BOOL v28 = Width < CGRectGetHeight(v32);

  return v28;
}

- (id)_findMinimumSizeView
{
  id v2 = [(HKOverlayRoomViewController *)self chartController];
  id v3 = [v2 view];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)_configureChartHeightUsingViewRatio
{
  id v25 = [(HKOverlayRoomViewController *)self _findMinimumSizeView];
  if (v25)
  {
    [(HKOverlayRoomViewController *)self _edgeInsetsForWidthDesignation];
    double v4 = v3;
    double v6 = v5;
    CGFloat v7 = [(HKOverlayRoomViewController *)self view];
    [v7 frame];
    double v9 = v8 - v6 - v4;

    double v10 = [(HKOverlayRoomViewController *)self chartController];
    [v10 minimumHeightForWidth:v9 chartWidthToHeightRatio:1.5];
    double v12 = v11;

    double v13 = 100.0;
    if (v12 >= 100.0) {
      double v13 = v12;
    }
    [v25 setMinimumHeight:v13];
    [(NSLayoutConstraint *)self->_chartControllerViewHeightConstraint setActive:0];
    uint64_t v14 = [(HKOverlayRoomViewController *)self view];
    char v15 = [v14 safeAreaLayoutGuide];
    [v15 layoutFrame];
    double v17 = v16 * 0.5;

    [(HKInteractiveChartViewController *)self->_chartController heightForChartHeight:v17];
    double v19 = v18;
    CGFloat v20 = [(HKOverlayRoomViewController *)self chartController];
    double v21 = [v20 view];
    CGFloat v22 = [v21 heightAnchor];
    double v23 = [v22 constraintLessThanOrEqualToConstant:v19];
    chartControllerViewHeightConstraint = self->_chartControllerViewHeightConstraint;
    self->_chartControllerViewHeightConstraint = v23;

    [(NSLayoutConstraint *)self->_chartControllerViewHeightConstraint setActive:1];
  }
}

- (void)_configureChartHeightUsingDefault
{
  id v11 = [(HKOverlayRoomViewController *)self _findMinimumSizeView];
  if (v11)
  {
    double v3 = [(HKOverlayRoomViewController *)self chartController];
    [v3 minimumHeightForChart];
    double v5 = v4;

    if (v5 < 100.0) {
      double v5 = 100.0;
    }
    [v11 setMinimumHeight:v5];
    [(NSLayoutConstraint *)self->_chartControllerViewHeightConstraint setActive:0];
    double v6 = [(HKOverlayRoomViewController *)self chartController];
    CGFloat v7 = [v6 view];
    double v8 = [v7 heightAnchor];
    double v9 = [v8 constraintGreaterThanOrEqualToConstant:v5];
    chartControllerViewHeightConstraint = self->_chartControllerViewHeightConstraint;
    self->_chartControllerViewHeightConstraint = v9;

    [(NSLayoutConstraint *)self->_chartControllerViewHeightConstraint setActive:1];
  }
}

- (void)_configureMainAreaVertically
{
  v51[7] = *MEMORY[0x1E4F143B8];
  double v3 = [(HKOverlayRoomViewController *)self chartController];
  v49 = [v3 view];

  topLevelChartViewTrailingConstraint = self->_topLevelChartViewTrailingConstraint;
  double v5 = (void *)MEMORY[0x1E4F28DC8];
  topLevelChartViewBottomConstraint = self->_topLevelChartViewBottomConstraint;
  v51[0] = self->_topLevelChartViewLeadingConstraint;
  v51[1] = topLevelChartViewTrailingConstraint;
  topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v51[2] = topLevelChartViewBottomConstraint;
  v51[3] = topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  topLevelOverlaysWithOptionalSegmentViewTopConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v51[4] = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v51[5] = topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v51[6] = self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
  double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:7];
  [v5 deactivateConstraints:v9];

  double v10 = [(UIView *)self->_topLevelChartView leadingAnchor];
  id v11 = [(HKOverlayRoomViewController *)self view];
  double v12 = [v11 safeAreaLayoutGuide];
  double v13 = [v12 leadingAnchor];
  uint64_t v14 = [v10 constraintEqualToAnchor:v13];
  topLevelChartViewLeadingConstraint = self->_topLevelChartViewLeadingConstraint;
  self->_topLevelChartViewLeadingConstraint = v14;

  double v16 = [(UIView *)self->_topLevelChartView trailingAnchor];
  double v17 = [(HKOverlayRoomViewController *)self view];
  double v18 = [v17 safeAreaLayoutGuide];
  double v19 = [v18 trailingAnchor];
  CGFloat v20 = [v16 constraintEqualToAnchor:v19];
  double v21 = self->_topLevelChartViewTrailingConstraint;
  self->_topLevelChartViewTrailingConstraint = v20;

  CGFloat v22 = [(UIView *)self->_topLevelChartView bottomAnchor];
  double v23 = [v49 bottomAnchor];
  CGFloat v24 = [v22 constraintEqualToAnchor:v23];
  id v25 = self->_topLevelChartViewBottomConstraint;
  self->_topLevelChartViewBottomConstraint = v24;

  CGFloat v26 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView leadingAnchor];
  uint64_t v27 = [(HKOverlayRoomViewController *)self view];
  BOOL v28 = [v27 safeAreaLayoutGuide];
  uint64_t v29 = [v28 leadingAnchor];
  CGRect v30 = [v26 constraintEqualToAnchor:v29];
  CGRect v31 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = v30;

  CGRect v32 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView trailingAnchor];
  long long v33 = [(HKOverlayRoomViewController *)self view];
  long long v34 = [v33 safeAreaLayoutGuide];
  long long v35 = [v34 trailingAnchor];
  long long v36 = [v32 constraintEqualToAnchor:v35];
  topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = v36;

  long long v38 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView topAnchor];
  long long v39 = [(UIView *)self->_topLevelChartView bottomAnchor];
  long long v40 = [v38 constraintEqualToAnchor:v39];
  v41 = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint = v40;

  uint64_t v42 = (void *)MEMORY[0x1E4F28DC8];
  v43 = self->_topLevelChartViewTrailingConstraint;
  uint64_t v44 = self->_topLevelChartViewBottomConstraint;
  v50[0] = self->_topLevelChartViewLeadingConstraint;
  v50[1] = v43;
  v45 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  objc_super v46 = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v50[2] = v44;
  v50[3] = v45;
  v47 = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v50[4] = v46;
  v50[5] = v47;
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:6];
  [v42 activateConstraints:v48];

  [(HKOverlayRoomViewController *)self setTopLevelAxis:1];
}

- (void)_configureMainAreaHorizontally
{
  v61[6] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F28DC8];
  topLevelChartViewTrailingConstraint = self->_topLevelChartViewTrailingConstraint;
  v61[0] = self->_topLevelChartViewLeadingConstraint;
  v61[1] = topLevelChartViewTrailingConstraint;
  topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v61[2] = self->_topLevelChartViewBottomConstraint;
  v61[3] = topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  topLevelOverlaysWithOptionalSegmentViewTopConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v61[4] = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v61[5] = topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  CGFloat v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:6];
  [v3 deactivateConstraints:v7];

  double v8 = [(HKOverlayRoomViewController *)self view];
  LODWORD(v7) = objc_msgSend(v8, "hk_isLeftToRight");

  double v9 = [(UIView *)self->_topLevelChartView leadingAnchor];
  if (v7)
  {
    double v10 = [(HKOverlayRoomViewController *)self view];
    id v11 = [v10 safeAreaLayoutGuide];
    double v12 = [v11 leadingAnchor];
    double v13 = [v9 constraintEqualToAnchor:v12];
    topLevelChartViewLeadingConstraint = self->_topLevelChartViewLeadingConstraint;
    self->_topLevelChartViewLeadingConstraint = v13;

    char v15 = [(UIView *)self->_topLevelChartView trailingAnchor];
    double v16 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView leadingAnchor];
    double v17 = [v15 constraintEqualToAnchor:v16];
    double v18 = self->_topLevelChartViewTrailingConstraint;
    self->_topLevelChartViewTrailingConstraint = v17;

    double v19 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView leadingAnchor];
    CGFloat v20 = [(UIView *)self->_topLevelChartView trailingAnchor];
    double v21 = [v19 constraintEqualToAnchor:v20];
    CGFloat v22 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
    self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = v21;

    double v23 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView trailingAnchor];
    CGFloat v24 = [(HKOverlayRoomViewController *)self view];
    id v25 = [v24 safeAreaLayoutGuide];
    CGFloat v26 = [v25 trailingAnchor];
    uint64_t v27 = [v23 constraintEqualToAnchor:v26];
    topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
    self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = v27;
  }
  else
  {
    uint64_t v29 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView trailingAnchor];
    CGRect v30 = [v9 constraintEqualToAnchor:v29];
    CGRect v31 = self->_topLevelChartViewLeadingConstraint;
    self->_topLevelChartViewLeadingConstraint = v30;

    CGRect v32 = [(UIView *)self->_topLevelChartView trailingAnchor];
    long long v33 = [(HKOverlayRoomViewController *)self view];
    long long v34 = [v33 safeAreaLayoutGuide];
    long long v35 = [v34 trailingAnchor];
    long long v36 = [v32 constraintEqualToAnchor:v35];
    long long v37 = self->_topLevelChartViewTrailingConstraint;
    self->_topLevelChartViewTrailingConstraint = v36;

    long long v38 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView leadingAnchor];
    long long v39 = [(HKOverlayRoomViewController *)self view];
    long long v40 = [v39 safeAreaLayoutGuide];
    v41 = [v40 leadingAnchor];
    uint64_t v42 = [v38 constraintEqualToAnchor:v41];
    v43 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
    self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint = v42;

    double v23 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView trailingAnchor];
    CGFloat v24 = [(UIView *)self->_topLevelChartView leadingAnchor];
    uint64_t v44 = [v23 constraintEqualToAnchor:v24];
    id v25 = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
    self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint = v44;
  }

  v45 = [(UIView *)self->_topLevelChartView bottomAnchor];
  objc_super v46 = [(HKOverlayRoomViewController *)self view];
  v47 = [v46 bottomAnchor];
  v48 = [v45 constraintEqualToAnchor:v47];
  topLevelChartViewBottomConstraint = self->_topLevelChartViewBottomConstraint;
  self->_topLevelChartViewBottomConstraint = v48;

  v50 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView topAnchor];
  v51 = [(HKOverlayRoomViewController *)self view];
  v52 = [v51 topAnchor];
  v53 = [v50 constraintEqualToAnchor:v52];
  v54 = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint = v53;

  v55 = (void *)MEMORY[0x1E4F28DC8];
  v56 = self->_topLevelChartViewTrailingConstraint;
  v60[0] = self->_topLevelChartViewLeadingConstraint;
  v60[1] = v56;
  v57 = self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
  v60[2] = self->_topLevelChartViewBottomConstraint;
  v60[3] = v57;
  v58 = self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
  v60[4] = self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
  v60[5] = v58;
  v60[6] = self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:7];
  [v55 activateConstraints:v59];

  [(HKOverlayRoomViewController *)self setTopLevelAxis:0];
}

- (void)_configureOverlayAreaVertically
{
  BOOL v3 = [(HKOverlayRoomViewController *)self supportsShowAllFilters];
  double v4 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
  [v4 setAxis:1];

  double v5 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
  [v5 setDistribution:0];

  double v6 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
  [v6 setAlignment:0];

  CGFloat v7 = [(HKOverlayRoomViewController *)self sectionedContextView];
  [v7 setUseBottomInsets:!v3];

  double v8 = [(HKOverlayRoomViewController *)self singleContextMaximumSizeView];

  if (v8)
  {
    double v9 = *MEMORY[0x1E4FB30D8];
    id v10 = [(HKOverlayRoomViewController *)self singleContextMaximumSizeView];
    objc_msgSend(v10, "setMaximumSize:", v9, v9);
  }
}

- (void)_configureOverlayAreaHorizontally
{
  BOOL v3 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
  [v3 setAxis:0];

  double v4 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
  [v4 setDistribution:1];

  double v5 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
  [v5 setAlignment:3];

  double v6 = [(HKOverlayRoomViewController *)self sectionedContextView];
  [v6 setUseBottomInsets:1];

  CGFloat v7 = [(HKOverlayRoomViewController *)self singleContextMaximumSizeView];

  if (v7)
  {
    double v8 = *MEMORY[0x1E4FB30D8];
    id v9 = [(HKOverlayRoomViewController *)self singleContextMaximumSizeView];
    objc_msgSend(v9, "setMaximumSize:", 375.0, v8);
  }
}

- (NSDirectionalEdgeInsets)_edgeInsetsForWidthDesignation
{
  BOOL v3 = [(HKOverlayRoomViewController *)self traitCollection];
  int64_t v4 = [(HKOverlayRoomViewController *)self _widthDesignationFromTraitCollection:v3];

  +[HKCollectionViewLayoutEngineDefaults edgeInsetsForWidthDesignation:v4];
  result.trailing = v8;
  result.bottom = v7;
  result.leading = v6;
  result.top = v5;
  return result;
}

- (void)_configureChartAreaMargins
{
  BOOL v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isiPad];

  if (v4)
  {
    double v5 = [(HKOverlayRoomViewController *)self chartController];
    id v11 = [v5 view];

    if (self->_controllerMode == 3) {
      double v6 = -14.0;
    }
    else {
      double v6 = 0.0;
    }
    [(NSLayoutConstraint *)self->_chartControllerViewToTopLevelChartViewBottomConstraint setActive:0];
    double v7 = [v11 heightAnchor];
    double v8 = [(UIView *)self->_topLevelChartView heightAnchor];
    id v9 = [v7 constraintEqualToAnchor:v8 constant:v6];
    chartControllerViewToTopLevelChartViewBottomConstraint = self->_chartControllerViewToTopLevelChartViewBottomConstraint;
    self->_chartControllerViewToTopLevelChartViewBottomConstraint = v9;

    [(NSLayoutConstraint *)self->_chartControllerViewToTopLevelChartViewBottomConstraint setActive:1];
  }
}

- (void)_configureOverlayAreaMargins
{
  unint64_t controllerMode = self->_controllerMode;
  if (controllerMode >= 3)
  {
    if (controllerMode == 3)
    {
      double v12 = [(HKOverlayRoomViewController *)self view];
      [v12 safeAreaInsets];
      double v14 = v13;

      char v15 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
      objc_msgSend(v15, "setDirectionalLayoutMargins:", 0.0, 0.0, -v14, 0.0);

      [(HKOverlayRoomViewController *)self _configureOverlaysWithOptionalSegmentHorizontalMarginsForModeFull];
      [(HKOverlayRoomViewController *)self _configureOverlaysWithOptionalSegmentTopMarginForModeFull];
    }
  }
  else
  {
    [(HKOverlayRoomViewController *)self _edgeInsetsForWidthDesignation];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    id v16 = [(HKOverlayRoomViewController *)self chartOverlayStackView];
    objc_msgSend(v16, "setDirectionalLayoutMargins:", v5, v7, v9, v11);
  }
}

- (void)_configureOverlaysWithOptionalSegmentHorizontalMarginsForModeFull
{
  if (self->_controllerMode == 3)
  {
    BOOL v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v4 = [v3 isiPad];

    if (v4)
    {
      [(NSLayoutConstraint *)self->_overlaysWithOptionalSegmentLeadingConstraint setActive:0];
      [(NSLayoutConstraint *)self->_overlaysWithOptionalSegmentTrailingConstraint setActive:0];
      int64_t v5 = [(HKOverlayRoomViewController *)self topLevelAxis];
      double v6 = [(UIStackView *)self->_overlaysWithOptionalSegmentController leadingAnchor];
      if (v5 == 1)
      {
        double v7 = [(HKOverlayRoomViewController *)self view];
        double v8 = [v7 readableContentGuide];
        double v9 = [v8 leadingAnchor];
        double v10 = [v6 constraintEqualToAnchor:v9 constant:-15.0];
        overlaysWithOptionalSegmentLeadingConstraint = self->_overlaysWithOptionalSegmentLeadingConstraint;
        self->_overlaysWithOptionalSegmentLeadingConstraint = v10;

        double v12 = [(UIStackView *)self->_overlaysWithOptionalSegmentController trailingAnchor];
        double v13 = [(HKOverlayRoomViewController *)self view];
        double v14 = [v13 readableContentGuide];
        char v15 = [v14 trailingAnchor];
        id v16 = [v12 constraintEqualToAnchor:v15 constant:15.0];
        overlaysWithOptionalSegmentTrailingConstraint = self->_overlaysWithOptionalSegmentTrailingConstraint;
        self->_overlaysWithOptionalSegmentTrailingConstraint = v16;
      }
      else
      {
        double v18 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView leadingAnchor];
        double v19 = [v6 constraintEqualToAnchor:v18];
        CGFloat v20 = self->_overlaysWithOptionalSegmentLeadingConstraint;
        self->_overlaysWithOptionalSegmentLeadingConstraint = v19;

        double v12 = [(UIStackView *)self->_overlaysWithOptionalSegmentController trailingAnchor];
        double v13 = [(UIView *)self->_topLevelOverlaysWithOptionalSegmentView trailingAnchor];
        double v21 = [v12 constraintEqualToAnchor:v13];
        double v14 = self->_overlaysWithOptionalSegmentTrailingConstraint;
        self->_overlaysWithOptionalSegmentTrailingConstraint = v21;
      }

      [(NSLayoutConstraint *)self->_overlaysWithOptionalSegmentLeadingConstraint setActive:1];
      CGFloat v22 = self->_overlaysWithOptionalSegmentTrailingConstraint;
      [(NSLayoutConstraint *)v22 setActive:1];
    }
  }
}

- (void)_configureOverlaysWithOptionalSegmentTopMarginForModeFull
{
  if (self->_controllerMode != 3) {
    return;
  }
  BOOL v3 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v4 = [v3 isiPad];

  if (!v4) {
    return;
  }
  [(NSLayoutConstraint *)self->_overlaysWithOptionalSegmentTopConstraint setActive:0];
  if (self->_segmentedControl)
  {
    [(HKDisplayTypeSectionedContextView *)self->_sectionedContextView contentViewTopInset];
    double v5 = 16.0;
    if (v6 != 16.0) {
      [(HKDisplayTypeSectionedContextView *)self->_sectionedContextView setContentViewTopInset:16.0];
    }
    int64_t v7 = [(HKOverlayRoomViewController *)self topLevelAxis];
    if (v7 == 1) {
      goto LABEL_16;
    }
    if (!v7)
    {
      double v5 = 10.5;
LABEL_16:
      [(NSLayoutConstraint *)self->_overlaysWithOptionalSegmentTopConstraint setConstant:v5];
    }
  }
  else
  {
    int64_t v8 = [(HKOverlayRoomViewController *)self topLevelAxis];
    if (!v8)
    {
      [(HKDisplayTypeSectionedContextView *)self->_sectionedContextView contentViewTopInset];
      double v5 = 10.5;
      if (v10 != 0.0) {
        [(HKDisplayTypeSectionedContextView *)self->_sectionedContextView setContentViewTopInset:0.0];
      }
      goto LABEL_16;
    }
    if (v8 == 1)
    {
      [(HKDisplayTypeSectionedContextView *)self->_sectionedContextView contentViewTopInset];
      double v5 = 0.0;
      if (v9 != 26.0)
      {
        [(HKDisplayTypeSectionedContextView *)self->_sectionedContextView setContentViewTopInset:26.0];
        [(HKDisplayTypeSectionedContextView *)self->_sectionedContextView scrollToTop];
      }
      goto LABEL_16;
    }
  }
  overlaysWithOptionalSegmentTopConstraint = self->_overlaysWithOptionalSegmentTopConstraint;
  [(NSLayoutConstraint *)overlaysWithOptionalSegmentTopConstraint setActive:1];
}

- (void)_horizontalSizeClassChanged:(id)a3
{
  id v3 = [(HKOverlayRoomViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)HKOverlayRoomViewController;
  [(HKOverlayRoomViewController *)&v4 viewWillLayoutSubviews];
  id v3 = [(HKOverlayRoomViewController *)self traitCollection];
  -[HKOverlayRoomViewController _configureStackViewsUsingHorizontalSizeClass:](self, "_configureStackViewsUsingHorizontalSizeClass:", [v3 horizontalSizeClass]);

  [(HKOverlayRoomViewController *)self _configureChartAreaMargins];
  [(HKOverlayRoomViewController *)self _configureOverlayAreaMargins];
}

- (id)_contextViewBackgroundColor
{
  id v2 = [(HKOverlayRoomViewController *)self controllerMode];
  if ((unint64_t)v2 >= 3)
  {
    if (v2 == (void *)3)
    {
      id v2 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartOverlayBackgroundColor");
    }
  }
  else
  {
    id v2 = [MEMORY[0x1E4FB1618] clearColor];
  }
  return v2;
}

- (id)_setupSegmentedControl
{
  v41[5] = *MEMORY[0x1E4F143B8];
  id v3 = [(HKOverlayRoomViewController *)self _segmentedControlTitles];
  if ([v3 count])
  {
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1C10]) initWithItems:v3];
    [(HKOverlayRoomViewController *)self setSegmentedControl:v4];

    double v5 = objc_msgSend(NSString, "hk_chartOverlayAccessibilityIdentifier:", @"SegmentedControl");
    [(HKOverlayRoomViewController *)self segmentedControl];
    double v6 = v40 = v3;
    [v6 setAccessibilityIdentifier:v5];

    int64_t v7 = [(HKOverlayRoomViewController *)self segmentedControl];
    [v7 addTarget:self action:sel_segmentedControlValueChanged_ forControlEvents:4096];

    int64_t v8 = [(HKOverlayRoomViewController *)self segmentedControl];
    [v8 setSelectedSegmentIndex:0];

    double v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    segmentedControlContainer = self->_segmentedControlContainer;
    self->_segmentedControlContainer = v9;

    double v11 = [(HKOverlayRoomViewController *)self _contextViewBackgroundColor];
    [(UIView *)self->_segmentedControlContainer setBackgroundColor:v11];

    double v12 = [(HKOverlayRoomViewController *)self segmentedControl];
    LODWORD(v13) = 1148846080;
    [v12 setContentHuggingPriority:1 forAxis:v13];

    double v14 = [(HKOverlayRoomViewController *)self segmentedControl];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    char v15 = self->_segmentedControlContainer;
    id v16 = [(HKOverlayRoomViewController *)self segmentedControl];
    [(UIView *)v15 addSubview:v16];

    CGRect v31 = (void *)MEMORY[0x1E4F28DC8];
    long long v39 = [(HKOverlayRoomViewController *)self segmentedControl];
    long long v38 = [v39 leadingAnchor];
    long long v37 = [(UIView *)self->_segmentedControlContainer leadingAnchor];
    long long v36 = [v38 constraintEqualToAnchor:v37 constant:15.0];
    v41[0] = v36;
    long long v35 = [(HKOverlayRoomViewController *)self segmentedControl];
    long long v34 = [v35 trailingAnchor];
    long long v33 = [(UIView *)self->_segmentedControlContainer trailingAnchor];
    CGRect v32 = [v34 constraintEqualToAnchor:v33 constant:-15.0];
    v41[1] = v32;
    CGRect v30 = [(HKOverlayRoomViewController *)self segmentedControl];
    uint64_t v29 = [v30 topAnchor];
    BOOL v28 = [(UIView *)self->_segmentedControlContainer topAnchor];
    uint64_t v27 = [v29 constraintEqualToAnchor:v28];
    v41[2] = v27;
    double v17 = [(HKOverlayRoomViewController *)self segmentedControl];
    double v18 = [v17 heightAnchor];
    double v19 = [v18 constraintGreaterThanOrEqualToConstant:28.0];
    v41[3] = v19;
    CGFloat v20 = [(HKOverlayRoomViewController *)self segmentedControl];
    double v21 = [v20 bottomAnchor];
    CGFloat v22 = [(UIView *)self->_segmentedControlContainer bottomAnchor];
    double v23 = [v21 constraintEqualToAnchor:v22 constant:-10.0];
    v41[4] = v23;
    CGFloat v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:5];
    [v31 activateConstraints:v24];

    id v3 = v40;
    id v25 = self->_segmentedControlContainer;
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (void)_layoutSegmentedControl
{
  v51[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKOverlayRoomViewController *)self segmentedControl];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    double v5 = [(HKOverlayRoomViewController *)self segmentedControlContainer];

    if (v5)
    {
      double v6 = [(HKOverlayRoomViewController *)self segmentedControlContainer];
      [v6 bounds];
      double v8 = v7;

      if (v8 > 0.0)
      {
        double v9 = [(HKOverlayRoomViewController *)self _segmentedControlTitles];
        uint64_t v10 = *MEMORY[0x1E4FB06F8];
        uint64_t v50 = *MEMORY[0x1E4FB06F8];
        double v11 = *MEMORY[0x1E4FB09B8];
        double v12 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0 weight:*MEMORY[0x1E4FB09B8]];
        v51[0] = v12;
        double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];

        double v14 = [(HKOverlayRoomViewController *)self segmentedControlContainer];
        [v14 bounds];
        double v16 = v15 + -30.0;

        unint64_t v17 = [v9 count];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id v18 = v9;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          double v21 = v16 / (double)v17 + -10.0;
          uint64_t v22 = *(void *)v42;
          double v23 = 0.0;
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v42 != v22) {
                objc_enumerationMutation(v18);
              }
              objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "sizeWithAttributes:", v13, (void)v41);
              double v26 = v25;
              if (v25 >= v21)
              {
                uint64_t v27 = [(HKOverlayRoomViewController *)self segmentedControl];
                [v27 setApportionsSegmentWidthsByContent:1];
              }
              double v23 = v23 + v26;
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v20);
        }
        else
        {
          double v23 = 0.0;
        }

        BOOL v28 = [(HKOverlayRoomViewController *)self segmentedControl];
        [v28 layoutMargins];
        double v30 = v29;
        CGRect v31 = [(HKOverlayRoomViewController *)self segmentedControl];
        [v31 layoutMargins];
        double v33 = v30 + v32 + (double)(unint64_t)([v18 count] - 1) * 11.0;

        if (v23 < v16 - v33) {
          double v34 = 14.0;
        }
        else {
          double v34 = 11.0;
        }
        uint64_t v47 = v10;
        long long v35 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:weight:", v34, *MEMORY[0x1E4FB09D8], (void)v41);
        v48 = v35;
        long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];

        uint64_t v45 = v10;
        long long v37 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v34 weight:v11];
        objc_super v46 = v37;
        long long v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];

        long long v39 = [(HKOverlayRoomViewController *)self segmentedControl];
        [v39 setTitleTextAttributes:v36 forState:0];

        long long v40 = [(HKOverlayRoomViewController *)self segmentedControl];
        [v40 setTitleTextAttributes:v38 forState:4];
      }
    }
  }
}

- (void)_setupOverlayContainers
{
  int64_t v3 = [(HKOverlayRoomViewController *)self controllerMode];
  objc_super v4 = [(HKOverlayRoomViewController *)self applicationItems];
  double v5 = [(HKOverlayRoomViewController *)self chartController];
  id v7 = [(HKOverlayRoomViewController *)self contextSectionContainersForMode:v3 applicationItems:v4 overlayChartController:v5];

  double v6 = [(HKOverlayRoomViewController *)self _addHealthFactorsIfNecessary:v7];
  [(HKOverlayRoomViewController *)self setOverlayContextSectionContainers:v6];
}

- (void)_setupOverlayContextItems
{
  [(HKOverlayRoomViewController *)self _callPrepareOnOverlayContexts];
  if (self->_shouldSelectInitialOverlay)
  {
    int64_t v3 = [(HKOverlayRoomViewController *)self initialSelectedContextForMode:[(HKOverlayRoomViewController *)self controllerMode] containerIndex:[(HKOverlayRoomViewController *)self initialSelectedContainerIndexForMode:[(HKOverlayRoomViewController *)self controllerMode]]];
    [(HKOverlayRoomViewController *)self setInitialSelectedContextLocation:v3];

    int64_t v4 = [(HKOverlayRoomViewController *)self controllerMode];
    double v5 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];
    LODWORD(v4) = [(HKOverlayRoomViewController *)self _shouldInstallDefaultOverlayDeselectionTimerForMode:v4 initialSelectedLocation:v5];

    if (v4) {
      [(HKOverlayRoomViewController *)self _installDefaultOverlayDeselectionTimer];
    }
  }
  [(HKOverlayRoomViewController *)self _updateContextTiles];
  [(HKOverlayRoomViewController *)self _refreshContextItemsAndUpdateChart:1];
}

- (void)_callPrepareOnOverlayContexts
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __60__HKOverlayRoomViewController__callPrepareOnOverlayContexts__block_invoke;
  v2[3] = &unk_1E6D516D8;
  v2[4] = self;
  [(HKOverlayRoomViewController *)self _enumerateContextItemsWithBlock:v2];
}

void __60__HKOverlayRoomViewController__callPrepareOnOverlayContexts__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*(id *)(a1 + 32) _findOverlayResolution:v6];
    int64_t v4 = [*(id *)(a1 + 32) currentChartDateInterval];
    double v5 = [*(id *)(a1 + 32) chartController];
    objc_msgSend(v6, "prepareContextForDateInterval:overlayController:timeScope:resolution:", v4, v5, objc_msgSend(*(id *)(a1 + 32), "currentChartTimeScope"), v3);
  }
}

- (void)_subscribeToSampleTypeUpdates
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  char v4 = [v3 isActivitySummary];

  if ((v4 & 1) == 0)
  {
    double v5 = [(HKOverlayRoomViewController *)self primaryDisplayType];
    id v6 = [v5 sampleType];
    id v7 = [v6 identifier];
    double v8 = (void *)*MEMORY[0x1E4F2BA18];

    if (v7 == v8)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      double v12 = [MEMORY[0x1E4F2B448] associatedBalanceMetricsTypes];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            id v18 = [(HKOverlayRoomViewController *)self applicationItems];
            uint64_t v19 = [v18 sampleTypeUpdateController];
            [v19 addObserver:self forType:v17];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }
    }
    else
    {
      id v20 = [(HKOverlayRoomViewController *)self applicationItems];
      double v9 = [v20 sampleTypeUpdateController];
      uint64_t v10 = [(HKOverlayRoomViewController *)self primaryDisplayType];
      double v11 = [v10 sampleType];
      [v9 addObserver:self forType:v11];
    }
  }
}

- (void)_layoutNoVerticalExpansion:(id)a3
{
  LODWORD(v3) = 1144750080;
  [a3 setContentHuggingPriority:1 forAxis:v3];
}

- (void)_showAllFilters:(id)a3
{
}

- (void)_showAllFilters
{
}

- (void)showAllFiltersWithCompletion:(id)a3
{
  char v4 = (void (**)(void))a3;
  double v5 = [(HKOverlayRoomViewController *)self _findNavigationController];
  if (v5)
  {
    id v6 = [(HKOverlayRoomViewController *)self applicationItems];
    id v7 = +[HKOverlayRoomApplicationItems applicationItemsWithItems:v6];

    double v8 = objc_alloc_init(HKSelectedTimeScopeController);
    [(HKSelectedTimeScopeController *)v8 setSelectedTimeScope:[(HKOverlayRoomViewController *)self currentChartTimeScope]];
    [v7 setTimeScopeController:v8];
    double v9 = [(HKOverlayRoomViewController *)self displayDate];
    uint64_t v10 = [(HKOverlayRoomViewController *)self createViewControllerForMode:3 displayDate:v9 applicationItems:v7];

    if (v10)
    {
      double v11 = [(HKOverlayRoomViewController *)self showAllFiltersActivity];
      [v10 setRestorationUserActivity:v11];

      uint64_t v12 = [v10 currentChartTimeScope];
      if (v12 == [(HKOverlayRoomViewController *)self currentChartTimeScope])
      {
        uint64_t v13 = [(HKOverlayRoomViewController *)self _currentChartEffectiveVisibleRange];
        [v10 setInitialVisibleDateRange:v13];
      }
      if ([v10 shouldSelectInitialOverlay])
      {
        [v10 setShouldSelectInitialOverlay:1];
      }
      else
      {
        uint64_t v14 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
        [v10 setShouldSelectInitialOverlay:v14 != 0];
      }
      uint64_t v15 = [[HKModalNavigationController alloc] initWithRootViewController:v10];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __60__HKOverlayRoomViewController_showAllFiltersWithCompletion___block_invoke;
      v16[3] = &unk_1E6D50ED8;
      v16[4] = self;
      [(HKModalNavigationController *)v15 setCompletion:v16];
      [(HKOverlayRoomViewController *)self _willPresentShowAllFilters];
      objc_msgSend(v5, "hk_presentModalCardViewController:fullScreen:animated:completion:", v15, 1, 1, v4);
    }
    else if (v4)
    {
      v4[2](v4);
    }
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __60__HKOverlayRoomViewController_showAllFiltersWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didDismissShowAllFilters];
}

- (id)overlayButtonNamesForTesting
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  uint64_t v24 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v24)
  {
    uint64_t v30 = 0;
    uint64_t v23 = *(void *)v40;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        double v5 = *(void **)(*((void *)&v39 + 1) + 8 * v4);
        id v6 = [v5 localizedContainerTitle];
        if (v6)
        {
          id v7 = [v5 localizedContainerTitle];
        }
        else
        {
          id v7 = @"default";
        }

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v26 = [v5 overlayContextSections];
        uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v28)
        {
          uint64_t v27 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v36 != v27) {
                objc_enumerationMutation(v26);
              }
              double v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              uint64_t v10 = [v9 localizedSectionTitle];
              if (v10)
              {
                double v11 = [v9 localizedSectionTitle];
              }
              else
              {
                double v11 = @"default";
              }

              long long v33 = 0u;
              long long v34 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              uint64_t v12 = [v9 overlayContextItems];
              uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v43 count:16];
              if (v13)
              {
                uint64_t v14 = v13;
                uint64_t v29 = i;
                uint64_t v15 = *(void *)v32;
                do
                {
                  for (uint64_t j = 0; j != v14; ++j)
                  {
                    if (*(void *)v32 != v15) {
                      objc_enumerationMutation(v12);
                    }
                    uint64_t v17 = [*(id *)(*((void *)&v31 + 1) + 8 * j) contextItemForLastUpdate];
                    id v18 = [v17 accessibilityIdentifier];

                    if (!v18 || ![v18 length])
                    {
                      uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"button_%ld", v30 + j);

                      id v18 = (void *)v19;
                    }
                    id v20 = [NSString stringWithFormat:@"%@||%@||%@", v7, v11, v18];
                    [v3 addObject:v20];
                  }
                  uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v43 count:16];
                  v30 += j;
                }
                while (v14);
                uint64_t i = v29;
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }
          while (v28);
        }

        uint64_t v4 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v24);
  }

  return v3;
}

- (BOOL)selectOverlayButtonForTestingNamed:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 componentsSeparatedByString:@"||"];
  if ([v5 count] == 3)
  {
    long long v33 = v5;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id obj = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
    uint64_t v36 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    if (v36)
    {
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      char v6 = 0;
      uint64_t v35 = *(void *)v61;
      unint64_t v7 = 0x1E4F29000uLL;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v61 != v35)
          {
            uint64_t v9 = v8;
            objc_enumerationMutation(obj);
            uint64_t v8 = v9;
          }
          uint64_t v37 = v8;
          uint64_t v10 = *(void **)(*((void *)&v60 + 1) + 8 * v8);
          double v11 = [v10 localizedContainerTitle];
          if (v11)
          {
            long long v42 = [v10 localizedContainerTitle];
          }
          else
          {
            long long v42 = @"default";
          }

          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v38 = [v10 overlayContextSections];
          uint64_t v40 = [v38 countByEnumeratingWithState:&v56 objects:v65 count:16];
          if (v40)
          {
            uint64_t v50 = 0;
            uint64_t v39 = *(void *)v57;
            uint64_t v12 = v42;
            do
            {
              for (uint64_t i = 0; i != v40; ++i)
              {
                if (*(void *)v57 != v39) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
                uint64_t v15 = [v14 localizedSectionTitle];
                if (v15)
                {
                  v49 = [v14 localizedSectionTitle];
                }
                else
                {
                  v49 = @"default";
                }

                long long v54 = 0u;
                long long v55 = 0u;
                long long v52 = 0u;
                long long v53 = 0u;
                id v43 = [v14 overlayContextItems];
                uint64_t v51 = [v43 countByEnumeratingWithState:&v52 objects:v64 count:16];
                if (v51)
                {
                  uint64_t v41 = i;
                  uint64_t v44 = 0;
                  uint64_t v48 = *(void *)v53;
                  do
                  {
                    for (uint64_t j = 0; j != v51; ++j)
                    {
                      if (*(void *)v53 != v48) {
                        objc_enumerationMutation(v43);
                      }
                      uint64_t v17 = [*(id *)(*((void *)&v52 + 1) + 8 * j) contextItemForLastUpdate];
                      id v18 = [v17 accessibilityIdentifier];

                      if (!v18 || ![v18 length])
                      {
                        uint64_t v19 = objc_msgSend(*(id *)(v7 + 24), "stringWithFormat:", @"button_%ld", v45 + j);

                        id v18 = (void *)v19;
                      }
                      id v20 = [*(id *)(v7 + 24) stringWithFormat:@"%@||%@||%@", v12, v49, v18];
                      if ([v20 isEqualToString:v4])
                      {
                        long long v21 = [[HKOverlayContextLocation alloc] initWithContainerIndex:v46 sectionIndex:v50 itemIndex:v44 + j];
                        [(HKOverlayRoomViewController *)self setUserHasOverriddenPreferredOverlay:1];
                        long long v22 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
                        uint64_t v47 = v21;
                        [(HKOverlayRoomViewController *)self _updateChartForOverlaySelection:v21 previousSelection:v22];

                        if (v46 != [(HKOverlayRoomViewController *)self segmentedControlSelectedIndex])
                        {
                          [(HKOverlayRoomViewController *)self setSegmentedControlSelectedIndex:v46];
                          uint64_t v23 = [(HKOverlayRoomViewController *)self sectionedContextView];
                          uint64_t v24 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
                          uint64_t v25 = [v24 objectAtIndexedSubscript:v46];
                          [v25 overlayContextSections];
                          id v26 = self;
                          v28 = id v27 = v4;
                          [v23 setDisplayTypeContextSections:v28];

                          id v4 = v27;
                          self = v26;
                        }
                        uint64_t v29 = [MEMORY[0x1E4F28D58] indexPathForRow:v44 + j inSection:v50];
                        uint64_t v30 = [(HKOverlayRoomViewController *)self sectionedContextView];
                        [v30 selectItemAtIndexPath:v29 animated:0 scrollPosition:0];

                        char v6 = 1;
                        unint64_t v7 = 0x1E4F29000;
                        uint64_t v12 = v42;
                      }
                    }
                    v44 += j;
                    v45 += j;
                    uint64_t v51 = [v43 countByEnumeratingWithState:&v52 objects:v64 count:16];
                  }
                  while (v51);
                  uint64_t i = v41;
                }

                ++v50;
              }
              uint64_t v40 = [v38 countByEnumeratingWithState:&v56 objects:v65 count:16];
            }
            while (v40);
          }
          else
          {
            uint64_t v12 = v42;
          }

          ++v46;
          uint64_t v8 = v37 + 1;
        }
        while (v37 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
      }
      while (v36);
    }
    else
    {
      char v6 = 0;
    }

    BOOL v31 = v6 & 1;
    double v5 = v33;
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (id)overlayButtonValueForTesting
{
  id v3 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  id v4 = [(HKOverlayRoomViewController *)self _selectedOverlayContextWithLocation:v3];

  if (v4 && ([v4 contextItemForLastUpdate], (double v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v6 = v5;
    unint64_t v7 = [v5 attributedLabelTextOverride];

    if (v7)
    {
      id v8 = [v6 attributedLabelTextOverride];
      uint64_t v9 = [v8 attributedLabelText];
      uint64_t v10 = [v9 string];
    }
    else
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      double v11 = [v6 valueContext];

      if (v11)
      {
        uint64_t v12 = [v6 valueContext];
        [v8 addObject:v12];
      }
      uint64_t v13 = [v6 value];

      if (v13)
      {
        uint64_t v14 = [v6 value];
        [v8 addObject:v14];
      }
      uint64_t v15 = [v6 unit];

      if (v15)
      {
        double v16 = [v6 unit];
        [v8 addObject:v16];
      }
      uint64_t v10 = [v8 componentsJoinedByString:@"::"];
    }
  }
  else
  {
    uint64_t v10 = @"NoOverlayButtonValue";
  }

  return v10;
}

- (void)_willPresentShowAllFilters
{
  [(HKOverlayRoomViewController *)self setShowAllFiltersVisible:1];
  [(HKOverlayRoomViewController *)self saveRestorationState];
  id v3 = [_TtC8HealthUI43HKInteractiveChartInteractionAnalyticsEvent alloc];
  id v4 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  double v5 = [(HKInteractiveChartInteractionAnalyticsEvent *)v3 initWithShowMoreDataForDisplayType:v4];

  [(HKInteractiveChartInteractionAnalyticsManager *)self->_analyticsManager submitWithEvent:v5];
}

- (void)_didDismissShowAllFilters
{
  [(HKOverlayRoomViewController *)self setShowAllFiltersActivity:0];
  [(HKOverlayRoomViewController *)self setShowAllFiltersVisible:0];
  [(HKOverlayRoomViewController *)self saveRestorationState];
}

- (id)_currentChartEffectiveVisibleRange
{
  id v2 = [(HKOverlayRoomViewController *)self chartController];
  id v3 = [v2 primaryGraphViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 graphView];
    double v5 = [v4 effectiveVisibleRangeCadence];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)_findNavigationController
{
  id v3 = [(HKOverlayRoomViewController *)self navigationController];

  if (v3)
  {
    id v4 = [(HKOverlayRoomViewController *)self navigationController];
    goto LABEL_3;
  }
  char v6 = [(HKOverlayRoomViewController *)self view];
  id v4 = [v6 nextResponder];

  if (v4)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v4;
        id v8 = [v7 navigationController];

        if (v8)
        {
          id v4 = [v7 navigationController];

          break;
        }
      }
      uint64_t v9 = [v4 nextResponder];

      id v4 = (void *)v9;
    }
    while (v9);
  }
LABEL_3:
  return v4;
}

- (void)_selectContextItemAtLocation:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    -[HKOverlayRoomViewController setCurrentSelectedContextLocation:](self, "setCurrentSelectedContextLocation:");
    char v6 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
    -[HKOverlayRoomViewController setSegmentedControlSelectedIndex:](self, "setSegmentedControlSelectedIndex:", [v6 containerIndex]);

    id v8 = [(HKOverlayRoomViewController *)self sectionedContextView];
    id v7 = [(HKOverlayRoomViewController *)self _currentIndexPath];
    [v8 selectItemAtIndexPath:v7 animated:v4 scrollPosition:0];
  }
}

- (id)_currentIndexPath
{
  id v3 = (void *)MEMORY[0x1E4F28D58];
  BOOL v4 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  uint64_t v5 = [v4 itemIndex];
  char v6 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  id v7 = objc_msgSend(v3, "indexPathForRow:inSection:", v5, objc_msgSend(v6, "sectionIndex"));

  return v7;
}

- (void)fetchContextItemsIfNeededWithDateInterval:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(HKOverlayRoomViewController *)self _contextItemCount] >= 1)
  {
    dispatch_group_t v8 = dispatch_group_create();
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke;
    v13[3] = &unk_1E6D51700;
    dispatch_group_t v14 = v8;
    uint64_t v15 = self;
    id v16 = v6;
    uint64_t v9 = v8;
    [(HKOverlayRoomViewController *)self _enumerateContextItemsWithBlock:v13];
    uint64_t v10 = [(HKOverlayRoomViewController *)self contextUpdateQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_3;
    block[3] = &unk_1E6D51728;
    block[4] = self;
    id v12 = v7;
    dispatch_group_notify(v9, v10, block);
  }
}

void __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  uint64_t v5 = [*(id *)(a1 + 40) _findOverlayResolution:v4];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 40) chartController];
  uint64_t v8 = [*(id *)(a1 + 40) currentChartTimeScope];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_2;
  v9[3] = &unk_1E6D512C8;
  id v10 = *(id *)(a1 + 32);
  [v4 updateContextItemForDateInterval:v6 overlayController:v7 timeScope:v8 resolution:v5 completion:v9];
}

void __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_2(uint64_t a1)
{
}

void __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_4;
  v2[3] = &unk_1E6D51728;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __84__HKOverlayRoomViewController_fetchContextItemsIfNeededWithDateInterval_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateContextTiles];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (int64_t)_contextItemCount
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v2 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        uint64_t v9 = objc_msgSend(v8, "overlayContextSections", 0);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              dispatch_group_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * j) overlayContextItems];
              v5 += [v14 count];
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (int64_t)_findOverlayResolution:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HKOverlayRoomViewController *)self chartController];
  uint64_t v6 = [v5 primaryGraphViewController];
  id v7 = [v6 graphView];

  if (v7) {
    uint64_t v8 = [v7 resolutionFromTraitCollectionAttributes];
  }
  else {
    uint64_t v8 = 0;
  }
  int64_t v9 = objc_msgSend(v4, "resolutionForTimeScope:traitResolution:", -[HKOverlayRoomViewController currentChartTimeScope](self, "currentChartTimeScope"), v8);

  return v9;
}

- (BOOL)_canSelectOverlayLocation:(id)a3 previousSelection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  int64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "containerIndex"));
  uint64_t v10 = [v9 overlayContextSections];
  uint64_t v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "sectionIndex"));

  if (v7)
  {
    uint64_t v12 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
    uint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "containerIndex"));
    dispatch_group_t v14 = [v13 overlayContextSections];
    uint64_t v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "sectionIndex"));
  }
  else
  {
    uint64_t v15 = 0;
  }
  long long v16 = [v11 overlayContextItems];
  long long v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v6, "itemIndex"));

  long long v18 = [v15 overlayContextItems];
  long long v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "itemIndex"));

  if (v17 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    long long v20 = [v17 contextItemForLastUpdate];
    int64_t v21 = [(HKOverlayRoomViewController *)self currentChartTimeScope];
    [(HKOverlayRoomViewController *)self chartController];
    long long v22 = v25 = v11;
    char v23 = [v17 canSelectOverlayContextItem:v20 isDeselecting:v17 == v19 timeScope:v21 chartController:v22];

    uint64_t v11 = v25;
  }
  else
  {
    char v23 = 1;
  }

  return v23;
}

- (void)_updateChartForOverlaySelection:(id)a3 previousSelection:(id)a4
{
}

- (void)_updateChartForOverlaySelection:(id)a3 previousSelection:(id)a4 animated:(BOOL)a5
{
  BOOL v88 = a5;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    int64_t v9 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "containerIndex"));
    uint64_t v11 = [v10 overlayContextSections];
    uint64_t v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v8, "sectionIndex"));

    uint64_t v13 = [v12 overlayContextItems];
    dispatch_group_t v14 = objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v8, "itemIndex"));

    int v84 = [(id)objc_opt_class() conformsToProtocol:&unk_1F3C88288];
    if (v84) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    int v84 = 0;
    id v15 = 0;
    dispatch_group_t v14 = 0;
  }
  *((void *)&v91 + 1) = v7;
  v92 = v15;
  if (!v7)
  {
    unint64_t v24 = [(HKOverlayRoomViewController *)self segmentedControlSelectedIndex];
    v87 = 0;
    int64_t v21 = 0;
    id v25 = 0;
    int v90 = 0;
LABEL_17:
    uint64_t v35 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
    unint64_t v36 = [v35 count];

    if (v36 <= v24)
    {
      v93 = 0;
    }
    else
    {
      uint64_t v37 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
      id v38 = [v37 objectAtIndexedSubscript:v24];

      uint64_t v39 = [v38 primaryDisplayType];
      uint64_t v40 = [v39 presentation];
      uint64_t v41 = (void *)[v40 copyWithIsCriticalForAutoscale:1];
      v93 = (void *)[v39 copyWithPresentation:v41];
    }
    long long v33 = (void *)*((void *)&v91 + 1);
    goto LABEL_21;
  }
  long long v16 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  long long v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "containerIndex"));
  long long v18 = [v17 overlayContextSections];
  long long v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", objc_msgSend(v7, "sectionIndex"));

  long long v20 = [v19 overlayContextItems];
  int64_t v21 = objc_msgSend(v20, "objectAtIndexedSubscript:", objc_msgSend(v7, "itemIndex"));

  if (objc_opt_respondsToSelector())
  {
    long long v22 = [v21 baseDisplayTypeForOverlay:self->_currentChartTimeScope];
    char v23 = v22;
  }
  else
  {
    uint64_t v26 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
    id v27 = objc_msgSend(v26, "objectAtIndexedSubscript:", objc_msgSend(v7, "containerIndex"));
    char v23 = [v27 primaryDisplayType];

    long long v22 = v23;
  }
  uint64_t v28 = [v22 presentation];
  uint64_t v29 = (void *)[v28 copyWithIsCriticalForAutoscale:1];
  v93 = (void *)[v23 copyWithPresentation:v29];

  int v90 = [(id)objc_opt_class() conformsToProtocol:&unk_1F3C88288];
  if (v90)
  {
    id v25 = v21;
    uint64_t v30 = [v25 stackedBaseDisplayTypeForOverlay:self->_currentChartTimeScope];
    BOOL v31 = [v30 presentation];
    long long v32 = (void *)[v31 copyWithIsCriticalForAutoscale:1];
    v87 = (void *)[v30 copyWithPresentation:v32];
  }
  else
  {
    id v25 = 0;
    v87 = 0;
  }
  long long v33 = (void *)*((void *)&v91 + 1);

  int64_t v34 = [(HKOverlayRoomViewController *)self segmentedControlSelectedIndex];
  if (!v93)
  {
    unint64_t v24 = v34;
    goto LABEL_17;
  }
LABEL_21:
  *(void *)&long long v91 = v8;
  long long v42 = v92;
  if (!v14)
  {
    id v43 = 0;
    if (v21) {
      goto LABEL_23;
    }
LABEL_25:
    uint64_t v44 = 0;
    goto LABEL_26;
  }
  id v43 = [v14 contextItemForLastUpdate];
  if (!v21) {
    goto LABEL_25;
  }
LABEL_23:
  uint64_t v44 = [v21 contextItemForLastUpdate];
LABEL_26:
  BOOL v45 = v88;
  if (v44 && v43 && v44 == v43 && v88)
  {
    _HKInitializeLogging();
    uint64_t v46 = HKUILogCharting();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v47 = [v43 description];
      *(_DWORD *)buf = 138477827;
      v95 = v47;
      _os_log_impl(&dword_1E0B26000, v46, OS_LOG_TYPE_DEFAULT, "HKOverlayRoomViewController skipping redundant update during animation for selected context item: %{private}@", buf, 0xCu);
    }
  }
  else
  {
    v89 = v25;
    if (v45)
    {
      uint64_t v48 = [(HKOverlayRoomViewController *)self chartController];
      [v48 installGraphViewSnapshot];

      v49 = [(HKOverlayRoomViewController *)self chartController];
      [v49 removeGraphViewSnapshotAnimated:1];
    }
    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v50 = [(HKOverlayRoomViewController *)self chartController];
      [v14 overlayStateWillChange:0 contextItem:v43 chartController:v50];
    }
    v86 = v14;
    if (v92 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v51 = [(HKOverlayRoomViewController *)self chartController];
      [v92 stackedOverlayStateWillChange:0 contextItem:v43 chartController:v51];
    }
    if (v21 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      long long v52 = [(HKOverlayRoomViewController *)self chartController];
      [v21 overlayStateWillChange:1 contextItem:v44 chartController:v52];
    }
    if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      long long v53 = [(HKOverlayRoomViewController *)self chartController];
      [v25 stackedOverlayStateWillChange:1 contextItem:v44 chartController:v53];
    }
    [(HKOverlayRoomViewController *)self didChangeFromContextItem:v43 toContextItem:v44];
    [(HKOverlayRoomViewController *)self setCurrentSelectedContextLocation:v33];
    if (v90)
    {
      if (v84)
      {
        long long v54 = [(HKOverlayRoomViewController *)self chartController];
        [v54 clearDisplayTypeStack];

        [(HKOverlayRoomViewController *)self _restoreStackingProportions];
      }
      [(HKOverlayRoomViewController *)self _setupStackingProportionsForContext:v25];
      long long v55 = [(HKOverlayRoomViewController *)self chartController];
      [v55 installStackedDisplayType:v87];

      long long v56 = [(HKOverlayRoomViewController *)self chartController];
      [v56 updateCurrentValueViewWithVisibleRange];
    }
    else if (v84)
    {
      long long v57 = [(HKOverlayRoomViewController *)self chartController];
      [v57 clearDisplayTypeStack];

      [(HKOverlayRoomViewController *)self _restoreStackingProportions];
    }
    long long v58 = [(HKOverlayRoomViewController *)self chartController];
    long long v59 = [(HKOverlayRoomViewController *)self chartController];
    long long v60 = objc_msgSend(v58, "currentDisplayTypesForStackOffset:", objc_msgSend(v59, "primaryDisplayTypeStackIndex"));

    v85 = v60;
    long long v61 = [v60 firstObject];
    long long v62 = [(HKOverlayRoomViewController *)self primaryDisplayType];
    if (v61 == v62)
    {
      char v64 = 1;
    }
    else
    {
      long long v63 = [(HKOverlayRoomViewController *)self primaryDisplayType];
      char v64 = [v63 isEqual:v61];
    }
    v65 = [(HKOverlayRoomViewController *)self primaryDisplayType];
    char v66 = [v65 isActivitySummary];

    int v67 = v90;
    if ((v66 & 1) == 0)
    {
      int v67 = v90;
      if ((v64 & 1) == 0)
      {
        if (v21
          || (objc_opt_respondsToSelector() & 1) == 0
          || (int v67 = v90, ([v14 unselectedContextShouldUseContextBaseType] & 1) == 0))
        {
          v68 = [(HKOverlayRoomViewController *)self primaryDisplayType];
          [(HKOverlayRoomViewController *)self _installBaseDisplayType:v68 autoscale:v90 ^ 1u];

          int v67 = 1;
        }
      }
    }
    if (v93)
    {
      uint64_t v69 = [(HKOverlayRoomViewController *)self primaryDisplayType];
      if (v69)
      {
        v70 = (void *)v69;
        v71 = [(HKOverlayRoomViewController *)self primaryDisplayType];
        char v72 = [v71 isActivitySummary];

        if ((v72 & 1) == 0)
        {
          [(HKOverlayRoomViewController *)self _installBaseDisplayType:v93 autoscale:v90 ^ 1u];
          int v67 = 1;
        }
      }
    }
    if (v93 != v61)
    {
      v73 = [(HKOverlayRoomViewController *)self chartController];
      [v73 updateCurrentValueViewWithVisibleRange];
    }
    if (v21)
    {
      v74 = [v21 overlayDisplayTypeForTimeScope:self->_currentChartTimeScope];
    }
    else
    {
      v74 = 0;
    }
    v75 = [(HKOverlayRoomViewController *)self chartController];
    [v75 installOverlayDisplayType:v74];

    if (v86 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v76 = [(HKOverlayRoomViewController *)self chartController];
      [v86 overlayStateDidChange:0 contextItem:v43 chartController:v76];
    }
    if (v92 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v77 = [(HKOverlayRoomViewController *)self chartController];
      [v92 stackedOverlayStateDidChange:0 contextItem:v43 chartController:v77];
    }
    id v25 = v89;
    if (v21)
    {
      if (objc_opt_respondsToSelector())
      {
        v78 = [(HKOverlayRoomViewController *)self chartController];
        [v21 overlayStateDidChange:1 contextItem:v44 chartController:v78];

        id v25 = v89;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (!(void)v91 || ([(id)v91 isEqual:*((void *)&v91 + 1)] & 1) == 0))
      {
        v79 = [(HKOverlayRoomViewController *)self chartController];
        [v21 overlayWasExplicitlySelected:v44 chartController:v79];

        id v25 = v89;
      }
    }
    if (v25 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v80 = [(HKOverlayRoomViewController *)self chartController];
      [v89 stackedOverlayStateDidChange:1 contextItem:v44 chartController:v80];

      id v25 = v89;
    }
    if (v67)
    {
      v81 = [(HKOverlayRoomViewController *)self chartController];
      v82 = [v81 primaryGraphViewController];
      v83 = [v82 graphView];
      [v83 resetAndRedraw];

      id v25 = v89;
    }
    long long v33 = (void *)*((void *)&v91 + 1);
    if (v91 != 0)
    {
      [(HKOverlayRoomViewController *)self setRestorationContextLocation:*((void *)&v91 + 1)];
      [(HKOverlayRoomViewController *)self saveRestorationState];
    }

    dispatch_group_t v14 = v86;
    long long v42 = v92;
  }
}

- (id)_bottomMostDisplayType:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  id v7 = v6;
  id v8 = v6;
  if (isKindOfClass)
  {
    int64_t v9 = [v6 baseDisplayType];

    if (v9)
    {
      uint64_t v10 = [v7 baseDisplayType];
      id v8 = [(HKOverlayRoomViewController *)self _bottomMostDisplayType:v10];
    }
    else
    {
      id v8 = v7;
    }
  }
  return v8;
}

- (void)_installBaseDisplayType:(id)a3 autoscale:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v6 = [(HKOverlayRoomViewController *)self chartController];
  [v6 clearOverlayDisplayTypeWithAutomaticAutoscale:v4];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v7 addObject:v15];
  id v8 = [(HKOverlayRoomViewController *)self chartController];
  int64_t v9 = [(HKOverlayRoomViewController *)self chartController];
  uint64_t v10 = objc_msgSend(v8, "currentDisplayTypesForStackOffset:", objc_msgSend(v9, "primaryDisplayTypeStackIndex"));

  if ((unint64_t)[v10 count] >= 2)
  {
    unint64_t v11 = 1;
    do
    {
      uint64_t v12 = [v10 objectAtIndexedSubscript:v11];
      [v7 addObject:v12];

      ++v11;
    }
    while (v11 < [v10 count]);
  }
  uint64_t v13 = [(HKOverlayRoomViewController *)self chartController];
  dispatch_group_t v14 = [(HKOverlayRoomViewController *)self chartController];
  objc_msgSend(v13, "replaceCurrentDisplayTypesWithTypes:stackOffset:resetDateRange:automaticAutoScale:", v7, objc_msgSend(v14, "primaryDisplayTypeStackIndex"), 0, v4);
}

- (void)_setupStackingProportionsForContext:(id)a3
{
  id v14 = a3;
  if (objc_opt_respondsToSelector())
  {
    BOOL v4 = [v14 stackedHeight];
    uint64_t v5 = [v4 kind];
    if (v5 == 1)
    {
      id v7 = [(HKOverlayRoomViewController *)self chartController];
      id v8 = [v7 stackedDisplayTypeHeights];

      if (v8)
      {
        int64_t v9 = [(HKOverlayRoomViewController *)self chartController];
        uint64_t v10 = [v9 stackedDisplayTypeHeights];
        id v6 = [v10 arrayByAddingObject:v4];
      }
      else
      {
        int64_t v9 = [(HKOverlayRoomViewController *)self _evenStackedProportions];
        id v6 = [v9 arrayByAddingObject:v4];
      }

      if (!v6) {
        goto LABEL_11;
      }
    }
    else
    {
      if (v5) {
        goto LABEL_11;
      }
      [v4 heightValue];
      id v6 = -[HKOverlayRoomViewController _computeRevisedRatiosGivenRatio:](self, "_computeRevisedRatiosGivenRatio:");
      if (!v6) {
        goto LABEL_11;
      }
    }
    unint64_t v11 = [(HKOverlayRoomViewController *)self chartController];
    uint64_t v12 = [v11 stackedDisplayTypeHeights];
    [(HKOverlayRoomViewController *)self setPreviousStackHeights:v12];

    uint64_t v13 = [(HKOverlayRoomViewController *)self chartController];
    [v13 setStackedDisplayTypeHeights:v6];

LABEL_11:
  }
  MEMORY[0x1F41817F8]();
}

- (id)_computeRevisedRatiosGivenRatio:(double)a3
{
  uint64_t v5 = [(HKOverlayRoomViewController *)self chartController];
  id v6 = [v5 stackedDisplayTypeHeights];

  if (!v6)
  {
    id v6 = [(HKOverlayRoomViewController *)self _evenStackedProportions];
  }
  id v7 = [(HKOverlayRoomViewController *)self _indexesOfLargestProportions:v6];
  if ([v7 count])
  {
    unint64_t v8 = [v7 count];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v6 count])
    {
      unint64_t v10 = 0;
      double v11 = a3 / (double)v8;
      do
      {
        uint64_t v12 = [v6 objectAtIndexedSubscript:v10];
        uint64_t v13 = [NSNumber numberWithInteger:v10];
        int v14 = [v7 containsObject:v13];

        if (v14)
        {
          id v15 = [HKInteractiveChartStackHeight alloc];
          [v12 heightValue];
          long long v17 = [(HKInteractiveChartStackHeight *)v15 initWithKind:0 heightValue:v16 - v11];
          [v9 addObject:v17];
        }
        else
        {
          [v9 addObject:v12];
        }

        ++v10;
      }
      while (v10 < [v6 count]);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_restoreStackingProportions
{
  uint64_t v3 = [(HKOverlayRoomViewController *)self previousStackHeights];
  BOOL v4 = [(HKOverlayRoomViewController *)self chartController];
  [v4 setStackedDisplayTypeHeights:v3];

  [(HKOverlayRoomViewController *)self setPreviousStackHeights:0];
}

- (id)_evenStackedProportions
{
  id v2 = [(HKOverlayRoomViewController *)self chartController];
  uint64_t v3 = [v2 stackOffsetCount];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v3 >= 1)
    {
      double v5 = 1.0 / (double)v3;
      do
      {
        id v6 = [[HKInteractiveChartStackHeight alloc] initWithKind:0 heightValue:v5];
        [v4 addObject:v6];

        --v3;
      }
      while (v3);
    }
  }
  else
  {
    id v4 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)_indexesOfLargestProportions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v3 count])
  {
    uint64_t v5 = 0;
    double v6 = -1.0;
    while (1)
    {
      id v7 = [v3 objectAtIndexedSubscript:v5];
      if (![v7 kind])
      {
        [v7 heightValue];
        double v9 = v8;
        if (vabdd_f64(v8, v6) < 0.01) {
          goto LABEL_7;
        }
        if (v8 - v6 > 0.0) {
          break;
        }
      }
LABEL_8:

      if (++v5 >= (unint64_t)[v3 count]) {
        goto LABEL_9;
      }
    }
    objc_msgSend(v4, "removeAllObjects", v8 - v6);
    double v6 = v9;
LABEL_7:
    unint64_t v10 = [NSNumber numberWithInteger:v5];
    [v4 addObject:v10];

    goto LABEL_8;
  }
LABEL_9:

  return v4;
}

- (BOOL)contextView:(id)a3 canSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [HKOverlayContextLocation alloc];
  int64_t v7 = [(HKOverlayRoomViewController *)self segmentedControlSelectedIndex];
  uint64_t v8 = [v5 section];
  uint64_t v9 = [v5 row];

  unint64_t v10 = [(HKOverlayContextLocation *)v6 initWithContainerIndex:v7 sectionIndex:v8 itemIndex:v9];
  double v11 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  LOBYTE(self) = [(HKOverlayRoomViewController *)self _canSelectOverlayLocation:v10 previousSelection:v11];

  return (char)self;
}

- (void)contextView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  [(HKOverlayRoomViewController *)self setUserHasOverriddenPreferredOverlay:1];
  id v11 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  double v6 = [HKOverlayContextLocation alloc];
  int64_t v7 = [(HKOverlayRoomViewController *)self segmentedControlSelectedIndex];
  uint64_t v8 = [v5 section];
  uint64_t v9 = [v5 row];

  unint64_t v10 = [(HKOverlayContextLocation *)v6 initWithContainerIndex:v7 sectionIndex:v8 itemIndex:v9];
  [(HKOverlayRoomViewController *)self _updateChartForOverlaySelection:v10 previousSelection:v11 animated:1];
  [(HKOverlayRoomViewController *)self _disableDefaultOverlaySelectionIfNecessary];
}

- (void)contextView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  -[HKOverlayRoomViewController setUserHasOverriddenPreferredOverlay:](self, "setUserHasOverriddenPreferredOverlay:", 1, a4);
  id v5 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  [(HKOverlayRoomViewController *)self _updateChartForOverlaySelection:0 previousSelection:v5 animated:1];
  [(HKOverlayRoomViewController *)self _disableDefaultOverlaySelectionIfNecessary];
}

- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4
{
  uint64_t v6 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  if (v6)
  {
    id v16 = (id)v6;
    uint64_t v7 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
      unint64_t v10 = [v9 count];

      if (v10 <= a4) {
        return;
      }
      id v11 = [(HKOverlayRoomViewController *)self factorDisplayTypes];
      id v16 = [v11 objectAtIndexedSubscript:a4];

      uint64_t v12 = [(HKOverlayRoomViewController *)self primaryDisplayType];
      uint64_t v13 = [(HKOverlayRoomViewController *)self applicationItems];
      int v14 = [v13 healthStore];
      id v15 = +[HKInteractiveChartInfographicFactory infographicViewControllerForDisplayType:v12 factorDisplayType:v16 healthStore:v14];

      if (v15) {
        [(UIViewController *)self hk_presentModalCardViewController:v15 fullScreen:0 animated:1 completion:0];
      }
    }
  }
}

- (void)segmentedControlValueChanged:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HKOverlayRoomViewController *)self controllerMode];
  uint64_t v6 = [v4 selectedSegmentIndex];

  uint64_t v7 = [(HKOverlayRoomViewController *)self initialSelectedContextForMode:v5 containerIndex:v6];
  [(HKOverlayRoomViewController *)self setInitialSelectedContextLocation:v7];

  uint64_t v8 = [(HKOverlayRoomViewController *)self initialSelectedContextLocation];

  [(HKOverlayRoomViewController *)self _unselectCurrentContext];
  [(HKOverlayRoomViewController *)self _updateContextTiles];
  if (v8) {
    [(HKOverlayRoomViewController *)self _selectPreferredItem];
  }
  uint64_t v9 = [(HKOverlayRoomViewController *)self sectionedContextView];
  [v9 scrollToTop];

  id v10 = [(HKOverlayRoomViewController *)self chartController];
  [v10 updateCurrentValueViewWithVisibleRange];
}

- (int64_t)segmentedControlSelectedIndex
{
  id v3 = [(HKOverlayRoomViewController *)self segmentedControl];

  if (!v3) {
    return 0;
  }
  id v4 = [(HKOverlayRoomViewController *)self segmentedControl];
  int64_t v5 = [v4 selectedSegmentIndex];

  return v5;
}

- (void)setSegmentedControlSelectedIndex:(unint64_t)a3
{
  id v4 = [(HKOverlayRoomViewController *)self segmentedControl];
  [v4 setSelectedSegmentIndex:a3];
}

- (void)didUpdateFromDateZoom:(int64_t)a3 toDateZoom:(int64_t)a4 newVisibleRange:(id)a5
{
  id v7 = a5;
  [(HKOverlayRoomViewController *)self _invalidateDefaultOverlayDeselectionTimer];
  [(HKOverlayRoomViewController *)self setCurrentChartTimeScope:a4];
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithValueRange:", v7);
  [(HKOverlayRoomViewController *)self setCurrentChartDateInterval:v8];

  objc_initWeak(&location, self);
  uint64_t v9 = [(HKOverlayRoomViewController *)self currentChartDateInterval];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__HKOverlayRoomViewController_didUpdateFromDateZoom_toDateZoom_newVisibleRange___block_invoke;
  v10[3] = &unk_1E6D51750;
  objc_copyWeak(v11, &location);
  v10[4] = self;
  v11[1] = (id)a4;
  [(HKOverlayRoomViewController *)self fetchContextItemsIfNeededWithDateInterval:v9 completion:v10];

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __80__HKOverlayRoomViewController_didUpdateFromDateZoom_toDateZoom_newVisibleRange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    if ([*(id *)(a1 + 32) _currentSelectedContextValidForTimeScope:*(void *)(a1 + 48)])
    {
      id v3 = [v6 currentSelectedContextLocation];
      [v6 _selectContextItemAtLocation:v3 animated:0];

      id v4 = [v6 currentSelectedContextLocation];
      int64_t v5 = [v6 currentSelectedContextLocation];
      [v6 _updateChartForOverlaySelection:v4 previousSelection:v5];
    }
    else
    {
      [*(id *)(a1 + 32) setUserHasOverriddenPreferredOverlay:1];
      [*(id *)(a1 + 32) _unselectCurrentContext];
    }
    id WeakRetained = v6;
  }
}

- (BOOL)_currentSelectedContextValidForTimeScope:(int64_t)a3
{
  int64_t v5 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];

  if (!v5) {
    return 1;
  }
  id v6 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  id v7 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  uint64_t v8 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v7, "containerIndex"));

  uint64_t v9 = [v8 overlayContextSections];
  id v10 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  id v11 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v10, "sectionIndex"));

  uint64_t v12 = [v11 overlayContextItems];
  uint64_t v13 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
  int v14 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v13, "itemIndex"));

  if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v15 = [(HKOverlayRoomViewController *)self chartController];
    char v16 = [v14 canSelectOverlayContextItem:v14 isDeselecting:0 timeScope:a3 chartController:v15];
  }
  else
  {
    char v16 = 1;
  }

  return v16;
}

- (void)didUpdateVisibleValueRange:(id)a3 changeContext:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 2)
  {
    id v11 = v6;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithValueRange:", v6);
    uint64_t v9 = [(HKOverlayRoomViewController *)self currentChartDateInterval];
    char v10 = [v8 isEqual:v9];

    if ((v10 & 1) == 0)
    {
      [(HKOverlayRoomViewController *)self setCurrentChartDateInterval:v8];
      [(HKOverlayRoomViewController *)self _refreshContextItemsAndUpdateChart:0];
    }
  }
  else
  {
    if (a4 != 1) {
      goto LABEL_8;
    }
    id v11 = v6;
    id v6 = (id)[(HKOverlayRoomViewController *)self _disableDefaultOverlaySelectionIfNecessary];
  }
  id v7 = v11;
LABEL_8:
  MEMORY[0x1F41817F8](v6, v7);
}

- (void)didUpdateSeriesWithNewValueRange:(id)a3
{
  if (a3) {
    [(HKOverlayRoomViewController *)self _refreshUpdatedItemsWithChartUpdate:0 invalidateChartItems:0];
  }
}

- (void)sampleTypeDateRangeController:(id)a3 didUpdateDateRanges:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __81__HKOverlayRoomViewController_sampleTypeDateRangeController_didUpdateDateRanges___block_invoke;
  v7[3] = &unk_1E6D513B0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __81__HKOverlayRoomViewController_sampleTypeDateRangeController_didUpdateDateRanges___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _shouldUpdateContextItemsForChanges:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(a1 + 32) _invalidateContextItems];
    id v3 = *(void **)(a1 + 32);
    return [v3 _refreshContextItemsAndUpdateChart:1];
  }
  return result;
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a5;
  if ([a6 count] || objc_msgSend(v10, "count") || v7) {
    [(HKOverlayRoomViewController *)self _refreshUpdatedItemsWithChartUpdate:1 invalidateChartItems:1];
  }
}

- (void)updateController:(id)a3 didReceiveHighFrequencyUpdateForType:(id)a4
{
}

- (void)_refreshUpdatedItemsWithChartUpdate:(BOOL)a3 invalidateChartItems:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__HKOverlayRoomViewController__refreshUpdatedItemsWithChartUpdate_invalidateChartItems___block_invoke;
  v4[3] = &unk_1E6D51778;
  BOOL v5 = a4;
  v4[4] = self;
  BOOL v6 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

uint64_t __88__HKOverlayRoomViewController__refreshUpdatedItemsWithChartUpdate_invalidateChartItems___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _invalidateContextItems];
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 41);
  return [v2 _refreshContextItemsAndUpdateChart:v3];
}

- (void)setRestorationUserActivity:(id)a3
{
}

- (void)restoreUserActivityState:(id)a3
{
  id v4 = a3;
  id v15 = [v4 userInfo];
  [(HKOverlayRoomViewController *)self setShowAllFiltersActivity:v4];

  BOOL v5 = [v15 objectForKeyedSubscript:@"HKOverlayRoomViewControllerRestorationShowAllFiltersKey"];
  if ([(HKOverlayRoomViewController *)self supportsShowAllFilters]
    && [v5 BOOLValue])
  {
    [(HKOverlayRoomViewController *)self _showAllFilters];
  }
  BOOL v6 = [v15 objectForKeyedSubscript:@"HKOverlayRoomViewControllerRestorationModeKey"];
  BOOL v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 integerValue];
    if (v8 == [(HKOverlayRoomViewController *)self controllerMode])
    {
      uint64_t v9 = [v15 objectForKeyedSubscript:@"HKOverlayRoomViewControllerRestorationContextContainer"];
      id v10 = [v15 objectForKeyedSubscript:@"HKOverlayRoomViewControllerRestorationContextSection"];
      id v11 = [v15 objectForKeyedSubscript:@"HKOverlayRoomViewControllerRestorationContextItemIndex"];
      uint64_t v12 = v11;
      if (v10 && v11)
      {
        uint64_t v13 = -[HKOverlayContextLocation initWithContainerIndex:sectionIndex:itemIndex:]([HKOverlayContextLocation alloc], "initWithContainerIndex:sectionIndex:itemIndex:", [v9 integerValue], objc_msgSend(v10, "integerValue"), objc_msgSend(v11, "integerValue"));
        [(HKOverlayRoomViewController *)self _selectContextItemAtLocation:v13 animated:0];
        int v14 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
        [(HKOverlayRoomViewController *)self _updateChartForOverlaySelection:v14 previousSelection:0];
      }
    }
  }
}

- (id)restorationStateDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  BOOL v4 = [(HKOverlayRoomViewController *)self showAllFiltersVisible]
    || [(HKOverlayRoomViewController *)self controllerMode] == 3;
  BOOL v5 = [NSNumber numberWithBool:v4];
  [v3 setObject:v5 forKeyedSubscript:@"HKOverlayRoomViewControllerRestorationShowAllFiltersKey"];

  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HKOverlayRoomViewController controllerMode](self, "controllerMode"));
  [v3 setObject:v6 forKeyedSubscript:@"HKOverlayRoomViewControllerRestorationModeKey"];

  BOOL v7 = [(HKOverlayRoomViewController *)self restorationContextLocation];

  if (v7)
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = [(HKOverlayRoomViewController *)self restorationContextLocation];
    id v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "containerIndex"));
    [v3 setObject:v10 forKeyedSubscript:@"HKOverlayRoomViewControllerRestorationContextContainer"];

    id v11 = NSNumber;
    uint64_t v12 = [(HKOverlayRoomViewController *)self restorationContextLocation];
    uint64_t v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "sectionIndex"));
    [v3 setObject:v13 forKeyedSubscript:@"HKOverlayRoomViewControllerRestorationContextSection"];

    int v14 = NSNumber;
    id v15 = [(HKOverlayRoomViewController *)self restorationContextLocation];
    char v16 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "itemIndex"));
    [v3 setObject:v16 forKeyedSubscript:@"HKOverlayRoomViewControllerRestorationContextItemIndex"];
  }
  return v3;
}

- (void)saveRestorationState
{
  id v10 = [(HKOverlayRoomViewController *)self restorationStateDictionary];
  id v3 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  BOOL v4 = [(HKOverlayRoomViewController *)self applicationItems];
  BOOL v5 = [v4 healthStore];
  BOOL v6 = +[HKInteractiveChartViewController standardChartRestorationDictionary:v3 healthStore:v5];

  BOOL v7 = +[HKInteractiveChartViewController mergeRestorationDictionary:v10 otherDictionary:v6];
  uint64_t v8 = [(HKOverlayRoomViewController *)self primaryDisplayType];
  uint64_t v9 = +[HKInteractiveChartViewController standardChartRestorationActivity:v7 primaryDisplayType:v8];

  +[HKInteractiveChartViewController saveRestorationUserActivity:v9 viewController:self];
}

- (BOOL)_shouldUpdateContextItemsForChanges:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HKOverlayRoomViewController__shouldUpdateContextItemsForChanges___block_invoke;
  v7[3] = &unk_1E6D517A0;
  uint64_t v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(HKOverlayRoomViewController *)self _enumerateContextItemsWithBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __67__HKOverlayRoomViewController__shouldUpdateContextItemsForChanges___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 sampleTypeForDateRangeUpdates];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    *(unsigned char *)(v4 + 24) = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v3];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5 != 0;
  }
  if ([(id)objc_opt_class() conformsToProtocol:&unk_1F3C88288])
  {
    BOOL v6 = [v9 stackedSampleTypeForDateRangeUpdates];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(unsigned char *)(v7 + 24))
    {
      *(unsigned char *)(v7 + 24) = 1;
    }
    else
    {
      id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8 != 0;
    }
  }
}

- (void)_enumerateContextItemsWithBlock:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
  uint64_t v20 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v5;
        BOOL v6 = *(void **)(*((void *)&v30 + 1) + 8 * v5);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v7 = [v6 overlayContextSections];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v27;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * v11);
              long long v22 = 0u;
              long long v23 = 0u;
              long long v24 = 0u;
              long long v25 = 0u;
              char v13 = [v12 overlayContextItems];
              uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v34 count:16];
              if (v14)
              {
                uint64_t v15 = v14;
                uint64_t v16 = *(void *)v23;
                do
                {
                  uint64_t v17 = 0;
                  do
                  {
                    if (*(void *)v23 != v16) {
                      objc_enumerationMutation(v13);
                    }
                    v4[2](v4, *(void *)(*((void *)&v22 + 1) + 8 * v17++));
                  }
                  while (v15 != v17);
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v34 count:16];
                }
                while (v15);
              }

              ++v11;
            }
            while (v11 != v9);
            uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v35 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v20);
  }
}

- (void)_invalidateContextItems
{
}

void __54__HKOverlayRoomViewController__invalidateContextItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector()) {
    [v2 invalidateContextItem];
  }
}

- (void)_refreshContextItemsAndUpdateChart:(BOOL)a3
{
  objc_initWeak(&location, self);
  uint64_t v5 = [(HKOverlayRoomViewController *)self currentChartDateInterval];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__HKOverlayRoomViewController__refreshContextItemsAndUpdateChart___block_invoke;
  v6[3] = &unk_1E6D517E8;
  objc_copyWeak(&v7, &location);
  BOOL v8 = a3;
  [(HKOverlayRoomViewController *)self fetchContextItemsIfNeededWithDateInterval:v5 completion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__HKOverlayRoomViewController__refreshContextItemsAndUpdateChart___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = [WeakRetained currentSelectedContextLocation];
    [WeakRetained _selectContextItemAtLocation:v2 animated:0];

    if (*(unsigned char *)(a1 + 40))
    {
      id v3 = [WeakRetained currentSelectedContextLocation];
      uint64_t v4 = [WeakRetained currentSelectedContextLocation];
      [WeakRetained _updateChartForOverlaySelection:v3 previousSelection:v4];
    }
  }
}

- (void)_unselectCurrentContext
{
  id v3 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];

  if (v3)
  {
    id v5 = [(HKOverlayRoomViewController *)self currentSelectedContextLocation];
    [(HKOverlayRoomViewController *)self _updateChartForOverlaySelection:0 previousSelection:v5 animated:1];
    uint64_t v4 = [(HKOverlayRoomViewController *)self sectionedContextView];
    [v4 deselectAllItemsAnimated:0];
  }
  else
  {
    [(HKOverlayRoomViewController *)self _updateChartForOverlaySelection:0 previousSelection:0];
  }
}

- (id)_selectedOverlayContextWithLocation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4
    && (unint64_t v6 = [v4 containerIndex],
        [(HKOverlayRoomViewController *)self overlayContextSectionContainers],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unint64_t v8 = [v7 count],
        v7,
        v6 < v8))
  {
    uint64_t v9 = [(HKOverlayRoomViewController *)self overlayContextSectionContainers];
    uint64_t v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v5, "containerIndex"));

    unint64_t v11 = [v5 sectionIndex];
    uint64_t v12 = [v10 overlayContextSections];
    unint64_t v13 = [v12 count];

    if (v11 >= v13)
    {
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v14 = [v10 overlayContextSections];
      uint64_t v15 = objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v5, "sectionIndex"));

      uint64_t v16 = [v15 overlayContextItems];
      uint64_t v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v5, "itemIndex"));
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (BOOL)_shouldInstallDefaultOverlayDeselectionTimerForMode:(int64_t)a3 initialSelectedLocation:(id)a4
{
  uint64_t v5 = [(HKOverlayRoomViewController *)self _selectedOverlayContextWithLocation:a4];
  unint64_t v6 = (void *)v5;
  BOOL v7 = 0;
  if (a3 != 3)
  {
    if (v5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        BOOL v7 = 1;
      }
    }
  }

  return v7;
}

- (void)_installDefaultOverlayDeselectionTimer
{
  [(HKOverlayRoomViewController *)self _invalidateDefaultOverlayDeselectionTimer];
  objc_initWeak(&location, self);
  id v3 = (void *)MEMORY[0x1E4F1CB00];
  double v4 = _DefaultOverlayDeselectDelay();
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  unint64_t v8 = __69__HKOverlayRoomViewController__installDefaultOverlayDeselectionTimer__block_invoke;
  uint64_t v9 = &unk_1E6D51810;
  objc_copyWeak(&v10, &location);
  uint64_t v5 = [v3 scheduledTimerWithTimeInterval:0 repeats:&v6 block:v4];
  -[HKOverlayRoomViewController setDefaultOverlayDeselectTimer:](self, "setDefaultOverlayDeselectTimer:", v5, v6, v7, v8, v9);

  [(HKOverlayRoomViewController *)self _registerPresentationControllerTransitionNotificationsForOverlayDeselectionTimer];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __69__HKOverlayRoomViewController__installDefaultOverlayDeselectionTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _disableDefaultOverlaySelection];
}

- (void)_invalidateDefaultOverlayDeselectionTimer
{
  [(NSTimer *)self->_defaultOverlayDeselectTimer invalidate];
  defaultOverlayDeselectTimer = self->_defaultOverlayDeselectTimer;
  self->_defaultOverlayDeselectTimer = 0;
}

- (void)_disableDefaultOverlaySelection
{
  [(HKOverlayRoomViewController *)self setUserHasOverriddenPreferredOverlay:1];
  [(HKOverlayRoomViewController *)self _unselectCurrentContext];
  [(HKOverlayRoomViewController *)self _invalidateDefaultOverlayDeselectionTimer];
  [(HKOverlayRoomViewController *)self _unregisterPresentationControllerTransitionNotificationsForOverlayDeselectionTimer];
}

- (void)_disableDefaultOverlaySelectionIfNecessary
{
  if (self->_defaultOverlayDeselectTimer) {
    [(HKOverlayRoomViewController *)self _disableDefaultOverlaySelection];
  }
}

- (void)_registerPresentationControllerTransitionNotificationsForOverlayDeselectionTimer
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handlePresentationControllerPresentationTransitionDidEnd_ name:*MEMORY[0x1E4FB2E70] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel__handlePresentationControllerDismissalDidEnd_ name:*MEMORY[0x1E4FB2E60] object:0];
}

- (void)_unregisterPresentationControllerTransitionNotificationsForOverlayDeselectionTimer
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2E70] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB2E60] object:0];
}

- (void)_handlePresentationControllerPresentationTransitionDidEnd:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = [(HKOverlayRoomViewController *)self presentedViewController];

  if (v4 == v5)
  {
    [(HKOverlayRoomViewController *)self _pauseDefaultOverlayDeselectionTimerIfNecessary];
  }
}

- (void)_handlePresentationControllerDismissalDidEnd:(id)a3
{
  id v4 = [a3 object];
  uint64_t v5 = [(HKOverlayRoomViewController *)self presentedViewController];

  if (v4 == v5)
  {
    [(HKOverlayRoomViewController *)self _restartDefaultOverlayDeselectionTimerIfNecessary];
  }
}

- (void)_pauseDefaultOverlayDeselectionTimerIfNecessary
{
  if ([(NSTimer *)self->_defaultOverlayDeselectTimer isValid])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
    [(NSTimer *)self->_defaultOverlayDeselectTimer setFireDate:v3];
  }
}

- (void)_restartDefaultOverlayDeselectionTimerIfNecessary
{
  if ([(NSTimer *)self->_defaultOverlayDeselectTimer isValid])
  {
    id v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:_DefaultOverlayDeselectDelay()];
    [(NSTimer *)self->_defaultOverlayDeselectTimer setFireDate:v3];
  }
}

- (NSString)chartOverlayVersion
{
  return (NSString *)@"overlays";
}

- (HKOverlayRoomApplicationItems)applicationItems
{
  return self->_applicationItems;
}

- (void)setApplicationItems:(id)a3
{
}

- (HKDisplayType)primaryDisplayType
{
  return self->_primaryDisplayType;
}

- (void)setPrimaryDisplayType:(id)a3
{
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (int64_t)controllerMode
{
  return self->_controllerMode;
}

- (void)setControllerMode:(int64_t)a3
{
  self->_unint64_t controllerMode = a3;
}

- (HKInteractiveChartOverlayViewController)chartController
{
  return self->_chartController;
}

- (void)setChartController:(id)a3
{
}

- (BOOL)shouldSelectInitialOverlay
{
  return self->_shouldSelectInitialOverlay;
}

- (void)setShouldSelectInitialOverlay:(BOOL)a3
{
  self->_shouldSelectInitialOverlay = a3;
}

- (unint64_t)additionalChartOptions
{
  return self->_additionalChartOptions;
}

- (void)setAdditionalChartOptions:(unint64_t)a3
{
  self->_additionalChartOptions = a3;
}

- (HKValueRange)initialVisibleDateRange
{
  return self->_initialVisibleDateRange;
}

- (void)setInitialVisibleDateRange:(id)a3
{
}

- (NSUserActivity)restorationUserActivity
{
  return self->_restorationUserActivity;
}

- (NSArray)factorDisplayTypes
{
  return self->_factorDisplayTypes;
}

- (int64_t)currentChartTimeScope
{
  return self->_currentChartTimeScope;
}

- (void)setCurrentChartTimeScope:(int64_t)a3
{
  self->_currentChartTimeScope = a3;
}

- (NSDateInterval)currentChartDateInterval
{
  return self->_currentChartDateInterval;
}

- (void)setCurrentChartDateInterval:(id)a3
{
}

- (HKOverlayContextLocation)currentSelectedContextLocation
{
  return self->_currentSelectedContextLocation;
}

- (void)setCurrentSelectedContextLocation:(id)a3
{
}

- (HKDisplayTypeSectionedContextView)sectionedContextView
{
  return self->_sectionedContextView;
}

- (void)setSectionedContextView:(id)a3
{
}

- (HKMaximumSizeView)singleContextMaximumSizeView
{
  return self->_singleContextMaximumSizeView;
}

- (void)setSingleContextMaximumSizeView:(id)a3
{
}

- (BOOL)userHasOverriddenPreferredOverlay
{
  return self->_userHasOverriddenPreferredOverlay;
}

- (void)setUserHasOverriddenPreferredOverlay:(BOOL)a3
{
  self->_userHasOverriddenPreferredOverlay = a3;
}

- (NSArray)overlayContextSectionContainers
{
  return self->_overlayContextSectionContainers;
}

- (void)setOverlayContextSectionContainers:(id)a3
{
}

- (HKOverlayContextLocation)initialSelectedContextLocation
{
  return self->_initialSelectedContextLocation;
}

- (void)setInitialSelectedContextLocation:(id)a3
{
}

- (OS_dispatch_queue)contextUpdateQueue
{
  return self->_contextUpdateQueue;
}

- (void)setContextUpdateQueue:(id)a3
{
}

- (BOOL)showAllFiltersVisible
{
  return self->_showAllFiltersVisible;
}

- (void)setShowAllFiltersVisible:(BOOL)a3
{
  self->_showAllFiltersVisible = a3;
}

- (NSUserActivity)showAllFiltersActivity
{
  return self->_showAllFiltersActivity;
}

- (void)setShowAllFiltersActivity:(id)a3
{
}

- (HKOverlayContextLocation)restorationContextLocation
{
  return self->_restorationContextLocation;
}

- (void)setRestorationContextLocation:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
}

- (UIView)segmentedControlContainer
{
  return self->_segmentedControlContainer;
}

- (void)setSegmentedControlContainer:(id)a3
{
}

- (int64_t)topLevelAxis
{
  return self->_topLevelAxis;
}

- (void)setTopLevelAxis:(int64_t)a3
{
  self->_topLevelAxis = a3;
}

- (UIView)topLevelChartView
{
  return self->_topLevelChartView;
}

- (NSLayoutConstraint)topLevelChartViewLeadingConstraint
{
  return self->_topLevelChartViewLeadingConstraint;
}

- (void)setTopLevelChartViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topLevelChartViewTrailingConstraint
{
  return self->_topLevelChartViewTrailingConstraint;
}

- (void)setTopLevelChartViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topLevelChartViewBottomConstraint
{
  return self->_topLevelChartViewBottomConstraint;
}

- (void)setTopLevelChartViewBottomConstraint:(id)a3
{
}

- (UIView)topLevelOverlaysWithOptionalSegmentView
{
  return self->_topLevelOverlaysWithOptionalSegmentView;
}

- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewLeadingConstraint
{
  return self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint;
}

- (void)setTopLevelOverlaysWithOptionalSegmentViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewTrailingConstraint
{
  return self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint;
}

- (void)setTopLevelOverlaysWithOptionalSegmentViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewTopConstraint
{
  return self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint;
}

- (void)setTopLevelOverlaysWithOptionalSegmentViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)topLevelOverlaysWithOptionalSegmentViewWidthConstraint
{
  return self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint;
}

- (void)setTopLevelOverlaysWithOptionalSegmentViewWidthConstraint:(id)a3
{
}

- (UIStackView)chartOverlayStackView
{
  return self->_chartOverlayStackView;
}

- (NSLayoutConstraint)chartControllerViewHeightConstraint
{
  return self->_chartControllerViewHeightConstraint;
}

- (void)setChartControllerViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)chartControllerViewToTopLevelChartViewBottomConstraint
{
  return self->_chartControllerViewToTopLevelChartViewBottomConstraint;
}

- (void)setChartControllerViewToTopLevelChartViewBottomConstraint:(id)a3
{
}

- (UIStackView)overlaysWithOptionalSegmentController
{
  return self->_overlaysWithOptionalSegmentController;
}

- (NSLayoutConstraint)overlaysWithOptionalSegmentLeadingConstraint
{
  return self->_overlaysWithOptionalSegmentLeadingConstraint;
}

- (void)setOverlaysWithOptionalSegmentLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)overlaysWithOptionalSegmentTrailingConstraint
{
  return self->_overlaysWithOptionalSegmentTrailingConstraint;
}

- (void)setOverlaysWithOptionalSegmentTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)overlaysWithOptionalSegmentTopConstraint
{
  return self->_overlaysWithOptionalSegmentTopConstraint;
}

- (void)setOverlaysWithOptionalSegmentTopConstraint:(id)a3
{
}

- (NSTimer)defaultOverlayDeselectTimer
{
  return self->_defaultOverlayDeselectTimer;
}

- (void)setDefaultOverlayDeselectTimer:(id)a3
{
}

- (int64_t)previousHorizontalSizeClass
{
  return self->_previousHorizontalSizeClass;
}

- (void)setPreviousHorizontalSizeClass:(int64_t)a3
{
  self->_previousHorizontalSizeClass = a3;
}

- (int64_t)previousWidthDesignation
{
  return self->_previousWidthDesignation;
}

- (void)setPreviousWidthDesignation:(int64_t)a3
{
  self->_previousWidthDesignation = a3;
}

- (_TtC8HealthUI45HKInteractiveChartInteractionAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (NSArray)previousStackHeights
{
  return self->_previousStackHeights;
}

- (void)setPreviousStackHeights:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousStackHeights, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_defaultOverlayDeselectTimer, 0);
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentTopConstraint, 0);
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_overlaysWithOptionalSegmentController, 0);
  objc_storeStrong((id *)&self->_chartControllerViewToTopLevelChartViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_chartControllerViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_chartOverlayStackView, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelOverlaysWithOptionalSegmentView, 0);
  objc_storeStrong((id *)&self->_topLevelChartViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelChartViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelChartViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topLevelChartView, 0);
  objc_storeStrong((id *)&self->_segmentedControlContainer, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_restorationContextLocation, 0);
  objc_storeStrong((id *)&self->_showAllFiltersActivity, 0);
  objc_storeStrong((id *)&self->_contextUpdateQueue, 0);
  objc_storeStrong((id *)&self->_initialSelectedContextLocation, 0);
  objc_storeStrong((id *)&self->_overlayContextSectionContainers, 0);
  objc_storeStrong((id *)&self->_singleContextMaximumSizeView, 0);
  objc_storeStrong((id *)&self->_sectionedContextView, 0);
  objc_storeStrong((id *)&self->_currentSelectedContextLocation, 0);
  objc_storeStrong((id *)&self->_currentChartDateInterval, 0);
  objc_storeStrong((id *)&self->_factorDisplayTypes, 0);
  objc_storeStrong((id *)&self->_restorationUserActivity, 0);
  objc_storeStrong((id *)&self->_initialVisibleDateRange, 0);
  objc_storeStrong((id *)&self->_chartController, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_primaryDisplayType, 0);
  objc_storeStrong((id *)&self->_applicationItems, 0);
}

@end