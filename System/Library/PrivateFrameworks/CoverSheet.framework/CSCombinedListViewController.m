@interface CSCombinedListViewController
- (BOOL)_allowNotificationsRevealPolicy;
- (BOOL)_allowsDateViewOrProudLockScroll;
- (BOOL)_allowsNotificationListTopInset;
- (BOOL)_allowsSeparateAdjunctList;
- (BOOL)_disableScrolling;
- (BOOL)_hasExperiencedSignificantScrollingOnScrollView:(id)a3;
- (BOOL)_hasUserInteraction;
- (BOOL)_integratesAdjunctListIntoFullList;
- (BOOL)_isClockSnoozeAlarmNotificationRequest:(id)a3;
- (BOOL)_isScreenOn;
- (BOOL)_notificationListExpandsVisibleRegionOnSignificantScroll;
- (BOOL)_shouldFilterNotificationRequest:(id)a3;
- (BOOL)_shouldHideProudLockForScroll;
- (BOOL)_shouldPadBottomSpacing;
- (BOOL)_shouldPadBottomSpacingIsDragging:(BOOL)a3;
- (BOOL)_shouldPreventNotificationHistoryRevealForActiveDNDState;
- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3;
- (BOOL)_shouldUpdateProudLockMaterialBackgroundForScrolling;
- (BOOL)allowsDNDStateService;
- (BOOL)disableBackgroundAnimation;
- (BOOL)dismissGestureDisabled;
- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3;
- (BOOL)footerCallToActionLabelHidden;
- (BOOL)handleEvent:(id)a3;
- (BOOL)hasContent;
- (BOOL)hasPresentationDirtiedAppearance;
- (BOOL)hasVisibleBreakthroughContent;
- (BOOL)hasVisibleContentToReveal;
- (BOOL)interpretsViewAsAdjunctContent:(id)a3;
- (BOOL)interpretsViewAsContent:(id)a3;
- (BOOL)isInteractingWithNotificationList;
- (BOOL)isNotificationContentExtensionVisible:(id)a3;
- (BOOL)isNotificationHistoryRevealed;
- (BOOL)isNotificationListSignificantlyScrolled;
- (BOOL)isPresentingNotificationInLongLook;
- (BOOL)isScrollingListContent;
- (BOOL)isShowingFocusActivityView;
- (BOOL)isShowingMediaControls;
- (BOOL)isTouchLocationInRestrictedRect:(CGPoint)a3;
- (BOOL)notificationListHidden;
- (BOOL)notificationStructuredListViewController:(id)a3 isClockNotificationRequest:(id)a4;
- (BOOL)notificationStructuredListViewController:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4;
- (BOOL)notificationStructuredListViewController:(id)a3 shouldFilterNotificationRequest:(id)a4;
- (BOOL)notificationStructuredListViewControllerShouldAllowLongPressGesture:(id)a3;
- (BOOL)notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:(id)a3;
- (BOOL)notificationStructuredListViewControllerShouldHintForDefaultAction:(id)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)showNotificationsInAlwaysOn;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CGPoint)_determineMaxContentOffsetForContentInset:(UIEdgeInsets)a3;
- (CGRect)_suggestedListViewFrame;
- (CGSize)_adjunctListViewSize;
- (CGSize)_adjunctListViewSizeIncludingSpacing;
- (CGSize)effectiveContentSizeForScrollView:(id)a3;
- (CGSize)sizeToMimicForAdjunctListViewController:(id)a3;
- (CGSize)sizeToMimicForItemContentHost;
- (CSActivityItemObserving)activityItemObserver;
- (CSApplicationInforming)applicationInformer;
- (CSCombinedListViewController)initWithDNDBedtimeController:(id)a3;
- (CSCombinedListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CSCombinedListViewController)initWithNibName:(id)a3 bundle:(id)a4 dndBedtimeController:(id)a5;
- (CSCombinedListViewControllerAudioCategoriesObserver)audioCategoriesObserver;
- (CSCombinedListViewControllerDelegate)delegate;
- (CSCombinedListViewControllerNotificationObserver)notificationObserver;
- (CSCoverSheetGestureHandling)coverSheetGestureHandling;
- (CSCoverSheetViewPresenting)coverSheetViewPresenting;
- (CSDeviceOrientationProviding)deviceOrientationProvider;
- (CSHomeAffordanceControlling)homeAffordanceController;
- (CSLayoutStrategy)layoutStrategy;
- (CSListItemManager)supplementaryItemManager;
- (CSLockScreenSettings)lockScreenSettings;
- (CSNotificationAdjunctListViewController)adjunctListViewController;
- (CSNotificationDispatcher)dispatcher;
- (CSNotificationPresenting)notificationPresenter;
- (CSPageViewControllerProtocol)page;
- (CSPlatterHomeGestureManaging)platterHomeGestureManager;
- (CSProximitySensorProviding)proximitySensorProvider;
- (CSRemoteContentInlineProviding)remoteContentInlineProvider;
- (CSScrollablePageViewControllerProtocol)scrollablePage;
- (CSUnlockRequesting)unlockRequester;
- (CSUserPresenceMonitor)userPresenceMonitor;
- (Class)notificationStructuredListViewControllerNotificationViewControllerClass:(id)a3;
- (DNDEventBehaviorResolutionService)dndEventBehaviorResolutionService;
- (DNDStateService)dndStateService;
- (NCNotificationRequest)activeRaiseToListenNotificationRequest;
- (NCNotificationViewController)activePlatterHomeAffordanceOwningNotificationViewController;
- (NSLayoutConstraint)adjunctListViewTopConstraint;
- (NSMutableDictionary)adjunctViewControllersByIdentifier;
- (NSMutableDictionary)supplementaryItemContainersByIdentifier;
- (NSMutableSet)hasUserInteractionReasons;
- (NSSet)audioCategoriesDisablingVolumeHUD;
- (NSString)listViewControllerBackgroundGroupName;
- (PRWidgetMetricsProvider)widgetMetricsProvider;
- (SBFActionProviding)contentActionProvider;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (SBFTouchPassThroughView)debugViewLeft;
- (SBFTouchPassThroughView)debugViewRight;
- (SBSLockScreenContentAssertion)digestOnboardingSuggestionViewControllerAssertion;
- (UIEdgeInsets)_listViewAdjustedContentInsets;
- (UIEdgeInsets)_listViewDefaultContentInsets;
- (UIEdgeInsets)insetMarginsToMimicForAdjunctListViewController:(id)a3;
- (UIEdgeInsets)notificationStructuredListViewControllerRequestsEdgeInsetsForOverlayFooterView:(id)a3 forOrientation:(int64_t)a4;
- (UIScrollView)notificationListScrollView;
- (UIViewController)digestOnboardingSuggestionViewController;
- (UIViewController)notificationListViewController;
- (double)_minInsetsToPushDateOffScreen;
- (double)_minListHeightForPadding;
- (double)_sanitizedContentOffset:(double)a3 forContentInset:(UIEdgeInsets)a4;
- (double)_statusBarHeight;
- (double)clippingOffset;
- (double)defaultRestingOffsetExcludingAdjunct;
- (double)distanceFromBarToContent;
- (double)horizontalInsetMargin;
- (double)interItemSpacingToMimicForAdjunctListViewController:(id)a3;
- (double)itemSpacing;
- (id)_identifierForNotificationRequest:(id)a3;
- (id)_modeIdentifierForDNDState:(id)a3;
- (id)_testingNotificationRequestWithIdentifier:(id)a3 sectionIdentifier:(id)a4;
- (id)_threadIdentifierForNotificationRequest:(id)a3;
- (id)_updateProximitySensorAssertion:(id)a3 wantsAssertion:(BOOL)a4 forReason:(id)a5;
- (id)acquireOverrideNotificationListDisplayStyleAssertionWithStyle:(int64_t)a3 hideNotificationCount:(BOOL)a4 reason:(id)a5;
- (id)groupNameBaseForAdjunctListViewController:(id)a3;
- (id)hideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:(id)a3;
- (id)legibilitySettingsForNotificationStructuredListViewController:(id)a3;
- (id)metadataForTriggeredInteraction:(id)a3;
- (id)notificationStructuredListViewController:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4;
- (id)notificationStructuredListViewController:(id)a3 keyboardAssertionForGestureWindow:(id)a4;
- (id)notificationStructuredListViewController:(id)a3 notificationRequestForUUID:(id)a4;
- (id)notificationStructuredListViewController:(id)a3 requestsSectionSettingsForSectionIdentifier:(id)a4;
- (id)notificationStructuredListViewControllerRequestsSystemSettings:(id)a3;
- (id)notificationUsageTrackingStateForNotificationStructuredListViewController:(id)a3;
- (id)presentationRegions;
- (id)sceneHostEnvironmentEntriesForBacklightSession;
- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationStructuredListViewController:(id)a3;
- (id)unhideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:(id)a3;
- (int64_t)_uiBacklightLuminanceForBLSBacklightState:(int64_t)a3;
- (int64_t)presentationPriority;
- (int64_t)presentationTransition;
- (int64_t)presentationType;
- (unint64_t)visibleNotificationCount;
- (void)_addStateCaptureHandlers;
- (void)_didUpdateSetHasUserInteraction;
- (void)_dismissDNDBedtimeGreetingViewAnimated:(BOOL)a3;
- (void)_evaluateShouldShowGreeting:(id)a3 animated:(BOOL)a4;
- (void)_homeButtonPressDetected;
- (void)_layoutListView;
- (void)_liftToWakeGestureDetected;
- (void)_lockButtonPressDetected;
- (void)_noteListContentsPotentiallyChanged;
- (void)_noteListContentsPotentiallyChangedAfterTransitionFrom:(BOOL)a3 to:(BOOL)a4;
- (void)_noteVisibleBreakthroughContentPotentiallyChanged;
- (void)_performSelfCorrectingListViewAction:(id)a3;
- (void)_publishVisibleNotificationCountOnContentChange;
- (void)_removeAllUserInteractionReasons;
- (void)_requestAuthenticationWithCompletion:(id)a3;
- (void)_screenTimeExpirationApplicationsDidChange:(id)a3;
- (void)_setDisableBackgroundAnimation:(BOOL)a3 forReason:(id)a4;
- (void)_setDisableScrolling:(BOOL)a3;
- (void)_setDismissGestureDisabled:(BOOL)a3 forReason:(id)a4;
- (void)_setFooterCallToActionLabelHidden:(BOOL)a3 forReason:(id)a4;
- (void)_setHasUserInteraction:(BOOL)a3 forReason:(id)a4;
- (void)_setInlineContentHidden:(BOOL)a3;
- (void)_setListHasContent:(BOOL)a3;
- (void)_setNotificationListHidden:(BOOL)a3 forReason:(id)a4;
- (void)_setQuickActionsHidden:(BOOL)a3 forReason:(id)a4;
- (void)_setScreenOn:(BOOL)a3;
- (void)_snapScrollView:(id)a3 toAcceptableOffsetAnimated:(BOOL)a4;
- (void)_snapToAcceptableOffsetForScrollView:(id)a3;
- (void)_startScreenOnTimer;
- (void)_stopScreenOnTimer;
- (void)_tearDownContainerViewForExpandedNotificationContent;
- (void)_testingClearAllNotificationRequests;
- (void)_testingCoalesceExpandedBundleForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)_testingExpandCoalescedBundleForNotificationRequest:(id)a3 withCompletion:(id)a4;
- (void)_toggleGestureStudyInteractionIfNecessary;
- (void)_triggerSignificantUserInteractionIfNeeded;
- (void)_updateActiveDNDState:(id)a3;
- (void)_updateAudioCategoriesDisablingVolumeHUD;
- (void)_updateCaptureOnlyMaterialView;
- (void)_updateDeviceWakeProximitySensorAssertion;
- (void)_updateFaceDetectMonitoring;
- (void)_updateHidingQuickActionsForSignificantScrolling:(BOOL)a3;
- (void)_updateListItemAppearanceState;
- (void)_updateListViewContentInset;
- (void)_updateNotificationListOffsetForExternalUpdate;
- (void)_updateNotificationLongPressProximitySensorAssertion;
- (void)_updatePresentationForReason:(id)a3;
- (void)_updateProudLockForHidden:(BOOL)a3 scrollOffset:(double)a4;
- (void)_updateQuickActionsVisibilityForScrollView:(id)a3;
- (void)_updateRaiseGestureDetectionForNotificationRequest:(id)a3;
- (void)_updateStructuredListOverrideUserInterfaceStyle;
- (void)_updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:(int64_t)a3;
- (void)activeActivityDidChangeForManager:(id)a3;
- (void)addVisibleBreakthroughContentObserver:(id)a3;
- (void)adjunctListViewController:(id)a3 didAddSectionWithIdentifier:(id)a4;
- (void)adjunctListViewController:(id)a3 didAddViewController:(id)a4 withIdentifier:(id)a5;
- (void)adjunctListViewController:(id)a3 didUpdateWithSize:(CGSize)a4;
- (void)adjunctListViewController:(id)a3 updatedNowPlayingVisbility:(BOOL)a4;
- (void)adjunctListViewController:(id)a3 willRemoveViewWithIdentifier:(id)a4;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)applicationInformer:(id)a3 updatedApplications:(id)a4;
- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4;
- (void)coverSheetViewControllerWillPresentPosterSwitcher:(id)a3;
- (void)dealloc;
- (void)didReceiveRaiseGesture;
- (void)dismissDNDBedtimeGreetingViewController:(id)a3 animated:(BOOL)a4;
- (void)focusActivityViewChangedToVisible:(BOOL)a3;
- (void)forceNotificationHistoryRevealed:(BOOL)a3 animated:(BOOL)a4;
- (void)handleDisplayWake:(BOOL)a3;
- (void)homeGestureParticipantOwningHomeGestureDidChange:(id)a3 ownsHomeGesture:(BOOL)a4;
- (void)itemManager:(id)a3 cancelTouchesForInteractionWithItem:(id)a4;
- (void)itemManager:(id)a3 insertItem:(id)a4;
- (void)itemManager:(id)a3 insertSection:(id)a4;
- (void)itemManager:(id)a3 removeItem:(id)a4;
- (void)itemManager:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4;
- (void)itemManager:(id)a3 requestsModalPresentationOfViewController:(id)a4 forItem:(id)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)itemManager:(id)a3 setNowPlayingItem:(id)a4;
- (void)itemManager:(id)a3 significantUserInteractionBeganWithItem:(id)a4;
- (void)itemManager:(id)a3 significantUserInteractionEndedWithItem:(id)a4;
- (void)itemManager:(id)a3 updateItem:(id)a4;
- (void)itemManagerDidAddNewSceneHostEnvironment;
- (void)migrateIncomingNotificationsToNotificationCenter;
- (void)notificationStructuredListViewController:(id)a3 didBeginUserInteractionWithViewController:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 didEndUserInteractionWithViewController:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 didUpdateOverlayFooterContentVisibility:(BOOL)a4;
- (void)notificationStructuredListViewController:(id)a3 isPresentingLongLookForViewController:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7;
- (void)notificationStructuredListViewController:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 requestsCancelTouches:(BOOL)a4 onSupplementaryViewController:(id)a5;
- (void)notificationStructuredListViewController:(id)a3 requestsClearingFromIncomingSectionNotificationRequests:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 requestsClearingNotificationRequests:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 requestsClearingSupplementaryViewControllers:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8;
- (void)notificationStructuredListViewController:(id)a3 requestsPresentingDigestOnboardingSuggestionViewController:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 requestsPresentingFocusActivityPickerFromView:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationStructuredListViewController:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationStructuredListViewController:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationStructuredListViewController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationStructuredListViewController:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationStructuredListViewController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7;
- (void)notificationStructuredListViewController:(id)a3 setNotificationSystemSettings:(id)a4;
- (void)notificationStructuredListViewController:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5;
- (void)notificationStructuredListViewController:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5;
- (void)notificationStructuredListViewController:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6;
- (void)notificationStructuredListViewControllerDidBeginUserInteraction:(id)a3;
- (void)notificationStructuredListViewControllerDidEndUserInteraction:(id)a3;
- (void)notificationStructuredListViewControllerDidScrollToRevealNotificationHistory:(id)a3;
- (void)notificationStructuredListViewControllerDidSignificantUserInteraction:(id)a3;
- (void)notificationStructuredListViewControllerDidUpdateVisibleContentExtent:(id)a3;
- (void)notificationStructuredListViewControllerWillExpandNotificationListCount:(id)a3;
- (void)notificationsLoadedForSectionIdentifier:(id)a3;
- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5;
- (void)postNotificationRequest:(id)a3;
- (void)proximitySensorProvider:(id)a3 objectWithinProximityDidChange:(BOOL)a4;
- (void)rebuildEverythingForReason:(id)a3;
- (void)removeVisibleBreakthroughContentObserver:(id)a3;
- (void)resetContentOffset;
- (void)resetOverrideNotificationListDisplayStyleSetting;
- (void)revealNotificationHistory:(BOOL)a3 animated:(BOOL)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActivePlatterHomeAffordanceOwningNotificationViewController:(id)a3;
- (void)setActiveRaiseToListenNotificationRequest:(id)a3;
- (void)setActivityItemObserver:(id)a3;
- (void)setAdjunctListViewController:(id)a3;
- (void)setAdjunctListViewTopConstraint:(id)a3;
- (void)setAdjunctViewControllersByIdentifier:(id)a3;
- (void)setAllowsDNDStateService:(BOOL)a3;
- (void)setApplicationInformer:(id)a3;
- (void)setAudioCategoriesObserver:(id)a3;
- (void)setAuthenticationStatusProvider:(id)a3;
- (void)setContentActionProvider:(id)a3;
- (void)setCoverSheetGestureHandling:(id)a3;
- (void)setCoverSheetViewPresenting:(id)a3;
- (void)setDebugViewLeft:(id)a3;
- (void)setDebugViewRight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceOrientationProvider:(id)a3;
- (void)setDigestOnboardingSuggestionViewController:(id)a3;
- (void)setDigestOnboardingSuggestionViewControllerAssertion:(id)a3;
- (void)setDispatcher:(id)a3;
- (void)setDndEventBehaviorResolutionService:(id)a3;
- (void)setDndStateService:(id)a3;
- (void)setHasUserInteractionReasons:(id)a3;
- (void)setHomeAffordanceController:(id)a3;
- (void)setLayoutStrategy:(id)a3;
- (void)setLockScreenSettings:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setNotificationPresenter:(id)a3;
- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3;
- (void)setPage:(id)a3;
- (void)setPlatterHomeGestureManager:(id)a3;
- (void)setPresentationDirtiedAppearance:(BOOL)a3;
- (void)setProximitySensorProvider:(id)a3;
- (void)setRemoteContentInlineProvider:(id)a3;
- (void)setRestrictsTouchesForRemoteView:(BOOL)a3;
- (void)setScrollablePage:(id)a3;
- (void)setShowNotificationsInAlwaysOn:(BOOL)a3;
- (void)setShowingFocusActivityView:(BOOL)a3;
- (void)setSupplementaryItemContainersByIdentifier:(id)a3;
- (void)setSupplementaryItemManager:(id)a3;
- (void)setUnlockRequester:(id)a3;
- (void)setUserPresenceMonitor:(id)a3;
- (void)setWidgetMetricsProvider:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)settleContentOffset;
- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4;
- (void)structuredListContentChanged:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAppearanceForHidden:(BOOL)a3 offset:(double)a4;
- (void)updateAppearanceForStatusBarBackgroundHidden:(BOOL)a3;
- (void)updateForLegibilitySettings:(id)a3;
- (void)updateNotificationRequest:(id)a3;
- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4;
- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)withdrawNotificationRequest:(id)a3;
@end

@implementation CSCombinedListViewController

- (void)proximitySensorProvider:(id)a3 objectWithinProximityDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E4FB3750];
  v8 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 67109120;
    LODWORD(v18) = v4;
    _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Proximity Sensor changed to objectWithinProximity: %{BOOL}d", (uint8_t *)&v17, 8u);
  }
  int proximitySensorCoveredSinceWake = self->_proximitySensorCoveredSinceWake;
  BOOL v10 = [(CSCombinedListViewController *)self _isScreenOn];
  int v11 = self->_proximitySensorCoveredSinceWake;
  if (v10)
  {
    int v11 = self->_proximitySensorCoveredSinceWake && v4;
    self->_int proximitySensorCoveredSinceWake = v11;
  }
  if (proximitySensorCoveredSinceWake != v11 && self->_deviceWakeProximitySensorAssertionCaptureTime)
  {
    v12 = [MEMORY[0x1E4F1C9C8] date];
    [v12 timeIntervalSinceDate:self->_deviceWakeProximitySensorAssertionCaptureTime];

    if (BSFloatGreaterThanFloat())
    {
      v13 = [MEMORY[0x1E4F4F330] sharedInstance];
      if (objc_opt_respondsToSelector()) {
        [v13 proximityDidUnoccludeAfterWake];
      }
    }
    deviceWakeProximitySensorAssertionCaptureTime = self->_deviceWakeProximitySensorAssertionCaptureTime;
    self->_deviceWakeProximitySensorAssertionCaptureTime = 0;
  }
  if (self->_deviceWakeProximitySensorAssertion)
  {
    v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      v18 = @"NotificationDeviceWake";
      _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Invalidating proximity sensor assertion for %@", (uint8_t *)&v17, 0xCu);
    }
    [(BSInvalidatable *)self->_deviceWakeProximitySensorAssertion invalidate];
    deviceWakeProximitySensorAssertion = self->_deviceWakeProximitySensorAssertion;
    self->_deviceWakeProximitySensorAssertion = 0;
  }
}

- (CSCombinedListViewController)initWithDNDBedtimeController:(id)a3
{
  return [(CSCombinedListViewController *)self initWithNibName:0 bundle:0 dndBedtimeController:a3];
}

- (CSCombinedListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [CSDNDBedtimeController alloc];
  v9 = [MEMORY[0x1E4F5F760] serviceForClientIdentifier:@"com.apple.springboard.dashboard.bedtime"];
  BOOL v10 = [(CSDNDBedtimeController *)v8 initWithStateService:v9 initialObserver:self];

  int v11 = [(CSCombinedListViewController *)self initWithNibName:v7 bundle:v6 dndBedtimeController:v10];
  return v11;
}

- (CSCombinedListViewController)initWithNibName:(id)a3 bundle:(id)a4 dndBedtimeController:(id)a5
{
  id v9 = a5;
  v62.receiver = self;
  v62.super_class = (Class)CSCombinedListViewController;
  BOOL v10 = [(CSCoverSheetViewControllerBase *)&v62 initWithNibName:a3 bundle:a4];
  if (v10)
  {
    uint64_t v11 = +[CSLockScreenDomain rootSettings];
    lockScreenSettings = v10->_lockScreenSettings;
    v10->_lockScreenSettings = (CSLockScreenSettings *)v11;

    [(PTSettings *)v10->_lockScreenSettings addKeyObserver:v10];
    v13 = [(CSLockScreenSettings *)v10->_lockScreenSettings dashBoardNotificationScrollSettings];
    [v13 addKeyObserver:v10];

    v14 = +[CSComponent dateView];
    v15 = [(CSCoverSheetViewControllerBase *)v10 appearanceIdentifier];
    uint64_t v16 = [v14 identifier:v15];
    dateViewComponent = v10->_dateViewComponent;
    v10->_dateViewComponent = (CSComponent *)v16;

    v18 = objc_opt_new();
    uint64_t v19 = [(CSCoverSheetViewControllerBase *)v10 appearanceIdentifier];
    uint64_t v20 = [v18 identifier:v19];
    complicationContainerComponent = v10->_complicationContainerComponent;
    v10->_complicationContainerComponent = (CSComponent *)v20;

    v22 = objc_opt_new();
    v23 = [(CSCoverSheetViewControllerBase *)v10 appearanceIdentifier];
    uint64_t v24 = [v22 identifier:v23];
    remoteInlineContentComponent = v10->_remoteInlineContentComponent;
    v10->_remoteInlineContentComponent = (CSComponent *)v24;

    v26 = objc_opt_new();
    v27 = [(CSCoverSheetViewControllerBase *)v10 appearanceIdentifier];
    uint64_t v28 = [v26 identifier:v27];
    statusBarBackgroundComponent = v10->_statusBarBackgroundComponent;
    v10->_statusBarBackgroundComponent = (CSStatusBarBackgroundComponent *)v28;

    [(CSStatusBarBackgroundComponent *)v10->_statusBarBackgroundComponent setShowBackgroundWhileTransitioning:1];
    [(CSComponent *)v10->_statusBarBackgroundComponent setHidden:1];
    v30 = objc_opt_new();
    v31 = [(CSCoverSheetViewControllerBase *)v10 appearanceIdentifier];
    uint64_t v32 = [v30 identifier:v31];
    statusBarComponent = v10->_statusBarComponent;
    v10->_statusBarComponent = (CSStatusBarComponent *)v32;

    v34 = +[CSComponent proudLock];
    v35 = [(CSCoverSheetViewControllerBase *)v10 appearanceIdentifier];
    uint64_t v36 = [v34 identifier:v35];
    proudLockComponent = v10->_proudLockComponent;
    v10->_proudLockComponent = (CSComponent *)v36;

    v38 = objc_opt_new();
    v39 = [(CSCoverSheetViewControllerBase *)v10 appearanceIdentifier];
    uint64_t v40 = [v38 identifier:v39];
    wallpaperFloatingLayerComponent = v10->_wallpaperFloatingLayerComponent;
    v10->_wallpaperFloatingLayerComponent = (CSWallpaperFloatingLayerComponent *)v40;

    v42 = objc_opt_new();
    v43 = [(CSCoverSheetViewControllerBase *)v10 appearanceIdentifier];
    v44 = [v42 identifier:v43];
    uint64_t v45 = [v44 suppressVisibleChanges:1];
    quickActionsComponent = v10->_quickActionsComponent;
    v10->_quickActionsComponent = (CSQuickActionsComponent *)v45;

    v47 = (NCNotificationStructuredListViewController *)objc_alloc_init(MEMORY[0x1E4FB3910]);
    structuredListViewController = v10->_structuredListViewController;
    v10->_structuredListViewController = v47;

    [(NCNotificationStructuredListViewController *)v10->_structuredListViewController setDelegate:v10];
    [(NCNotificationStructuredListViewController *)v10->_structuredListViewController setDeviceAuthenticated:0];
    [(NCNotificationStructuredListViewController *)v10->_structuredListViewController addContentObserver:v10];
    v49 = objc_alloc_init(CSNotificationAdjunctListViewController);
    adjunctListViewController = v10->_adjunctListViewController;
    v10->_adjunctListViewController = v49;

    [(CSNotificationAdjunctListViewController *)v10->_adjunctListViewController setDelegate:v10];
    uint64_t v51 = +[CSListItemManager itemManagerWithItemContainer:v10];
    supplementaryItemManager = v10->_supplementaryItemManager;
    v10->_supplementaryItemManager = (CSListItemManager *)v51;

    [(CSCoverSheetViewControllerBase *)v10->_adjunctListViewController setPresenter:v10];
    objc_storeStrong((id *)&v10->_dndBedtimeController, a5);
    if (v9) {
      v10->_allowsDNDStateService = 1;
    }
    [(CSCombinedListViewController *)v10 setDefinesPresentationContext:1];
    uint64_t v53 = [MEMORY[0x1E4FA7C68] sharedInstance];
    biometricResource = v10->_biometricResource;
    v10->_biometricResource = (SBUIBiometricResource *)v53;

    v55 = [MEMORY[0x1E4F4F330] sharedInstance];
    v56 = [v55 sensorCharacteristics];
    v10->_hasProximitySensor = [v56 hasDiscreteProximitySensor];

    uint64_t v57 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    breakthroughContentObservers = v10->_breakthroughContentObservers;
    v10->_breakthroughContentObservers = (NSHashTable *)v57;

    uint64_t v59 = [MEMORY[0x1E4F62278] sharedActivityManager];
    focusActivityManager = v10->_focusActivityManager;
    v10->_focusActivityManager = (FCActivityManager *)v59;

    [(FCActivityManager *)v10->_focusActivityManager addObserver:v10];
    [(CSCombinedListViewController *)v10 _addStateCaptureHandlers];
  }

  return v10;
}

- (void)dealloc
{
  [(PTSettings *)self->_lockScreenSettings removeKeyObserver:self];
  v3 = [(CSLockScreenSettings *)self->_lockScreenSettings dashBoardNotificationScrollSettings];
  [v3 removeKeyObserver:self];

  [(BSAbsoluteMachTimer *)self->_significantUserInteractionTimer invalidate];
  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FA7A68] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4FA7A70] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4FA7A78] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F43480] object:0];
  v5 = [(CSCombinedListViewController *)self dndStateService];
  [v5 removeStateUpdateListener:self];

  [(FCActivityManager *)self->_focusActivityManager removeObserver:self];
  v6.receiver = self;
  v6.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v6 dealloc];
}

- (UIViewController)notificationListViewController
{
  return (UIViewController *)self->_structuredListViewController;
}

- (UIScrollView)notificationListScrollView
{
  return (UIScrollView *)[(NCNotificationStructuredListViewController *)self->_structuredListViewController scrollView];
}

- (void)_addStateCaptureHandlers
{
  objc_initWeak(&location, self);
  id v2 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v4, &location);
  id v3 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

__CFString *__56__CSCombinedListViewController__addStateCaptureHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _disableScrolling]) {
    id v2 = @"Scrolling Disabled";
  }
  else {
    id v2 = &stru_1F3020248;
  }
  id v3 = v2;

  return v3;
}

- (BOOL)_allowsNotificationListTopInset
{
  id v2 = [(CSLockScreenSettings *)self->_lockScreenSettings dashBoardRemoteContentSettings];
  if ([v2 shouldHostContentInNotificationList]) {
    int v3 = [v2 includesDateTimeStandinInAdjunctList] ^ 1;
  }
  else {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (BOOL)_allowsSeparateAdjunctList
{
  id v2 = [(CSLockScreenSettings *)self->_lockScreenSettings dashBoardRemoteContentSettings];
  if ([v2 shouldHostContentInNotificationList]) {
    int v3 = [v2 hostsInlineContentNativelyInNotificationList] ^ 1;
  }
  else {
    LOBYTE(v3) = 1;
  }

  return v3;
}

- (BOOL)hasVisibleContentToReveal
{
  return [(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleContentToReveal];
}

- (BOOL)hasVisibleBreakthroughContent
{
  return [(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleUrgentBreakthroughContent];
}

- (BOOL)isShowingMediaControls
{
  if ([(CSNotificationAdjunctListViewController *)self->_adjunctListViewController isShowingMediaControls])
  {
    return 1;
  }
  id v4 = [(CSListItemManager *)self->_supplementaryItemManager nowPlayingItem];
  BOOL v3 = v4 != 0;

  return v3;
}

- (double)itemSpacing
{
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController itemSpacing];
  return result;
}

- (double)horizontalInsetMargin
{
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController insetMargins];
  return v2;
}

- (void)resetContentOffset
{
  id v2 = [(CSCombinedListViewController *)self notificationListScrollView];
  [v2 _scrollToTopIfPossible:0];
}

- (void)settleContentOffset
{
  id v3 = [(CSCombinedListViewController *)self notificationListScrollView];
  [(CSCombinedListViewController *)self _snapScrollView:v3 toAcceptableOffsetAnimated:0];
}

- (NSString)listViewControllerBackgroundGroupName
{
  return (NSString *)[(NCNotificationStructuredListViewController *)self->_structuredListViewController backgroundGroupNameBase];
}

- (SBFActionProviding)contentActionProvider
{
  return [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController contentActionProvider];
}

- (void)setContentActionProvider:(id)a3
{
}

- (void)setApplicationInformer:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationInformer);
  if (WeakRetained != obj)
  {
    [WeakRetained removeApplicationInformationObserver:self];
    objc_storeWeak((id *)&self->_applicationInformer, obj);
    [obj addApplicationInformationObserver:self];
  }
}

- (BOOL)interpretsViewAsContent:(id)a3
{
  id v4 = a3;
  char v5 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController interpretsViewAsContent:v4];
  if ([(CSCombinedListViewController *)self _allowsSeparateAdjunctList])
  {
    objc_super v6 = [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController view];
    char v7 = [v6 containsView:v4];
  }
  else
  {
    char v7 = 0;
  }
  if (v4) {
    char v8 = v5 | v7;
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)interpretsViewAsAdjunctContent:(id)a3
{
  id v4 = a3;
  if ([(CSCombinedListViewController *)self _allowsSeparateAdjunctList])
  {
    char v5 = [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController view];
    char v6 = [v5 containsView:v4];
  }
  else
  {
    char v6 = 0;
  }
  if (!v4) {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isTouchLocationInRestrictedRect:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  char v6 = [(CSListItemManager *)self->_supplementaryItemManager nowPlayingItem];
  char v7 = [v6 contentHost];

  char v8 = self;
  id v9 = v7;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  id v11 = v10;

  [v11 activityHostTouchRestrictedRects];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "CGRectValue", (void)v37);
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        v25 = [(CSCombinedListViewController *)self view];
        v26 = [v9 view];
        objc_msgSend(v25, "convertRect:fromView:", v26, v18, v20, v22, v24);
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        CGFloat v32 = v31;
        CGFloat v34 = v33;

        v44.origin.CGFloat x = v28;
        v44.origin.CGFloat y = v30;
        v44.size.width = v32;
        v44.size.height = v34;
        v43.CGFloat x = x;
        v43.CGFloat y = y;
        if (CGRectContainsPoint(v44, v43))
        {
          BOOL v35 = 1;
          goto LABEL_16;
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  BOOL v35 = 0;
LABEL_16:

  return v35;
}

- (void)setProximitySensorProvider:(id)a3
{
  p_proximitySensorProvider = &self->_proximitySensorProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_proximitySensorProvider, v5);
  [v5 addProximitySensorProviderObserver:self];
}

- (void)setRemoteContentInlineProvider:(id)a3
{
  p_remoteContentInlineProvider = &self->_remoteContentInlineProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_remoteContentInlineProvider, v5);
  [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController setRemoteContentInlineProvider:v5];
}

- (void)setWidgetMetricsProvider:(id)a3
{
}

- (PRWidgetMetricsProvider)widgetMetricsProvider
{
  return [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController widgetMetricsProvider];
}

- (id)acquireOverrideNotificationListDisplayStyleAssertionWithStyle:(int64_t)a3 hideNotificationCount:(BOOL)a4 reason:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  overrideNotificationListDisplayStyleAssertions = self->_overrideNotificationListDisplayStyleAssertions;
  if (!overrideNotificationListDisplayStyleAssertions)
  {
    BOOL v10 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    id v11 = self->_overrideNotificationListDisplayStyleAssertions;
    self->_overrideNotificationListDisplayStyleAssertions = v10;

    overrideNotificationListDisplayStyleAssertions = self->_overrideNotificationListDisplayStyleAssertions;
  }
  id v12 = [(NSMapTable *)overrideNotificationListDisplayStyleAssertions objectForKey:v8];
  uint64_t v13 = v12;
  if (v12) {
    [v12 cancel];
  }
  uint64_t v14 = [CSOverrideNotificationListDisplayStyleAssertion alloc];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  double v20 = __123__CSCombinedListViewController_acquireOverrideNotificationListDisplayStyleAssertionWithStyle_hideNotificationCount_reason___block_invoke;
  double v21 = &unk_1E6AD88C0;
  double v22 = self;
  id v23 = v8;
  id v15 = v8;
  uint64_t v16 = [(CSOverrideNotificationListDisplayStyleAssertion *)v14 initWithNotificationListDisplayStyle:a3 hideNotificationCount:v5 reason:v15 invalidationHandler:&v18];

  -[NSMapTable setObject:forKey:](self->_overrideNotificationListDisplayStyleAssertions, "setObject:forKey:", v16, v15, v18, v19, v20, v21, v22);
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController setOverrideNotificationListDisplayStyleSetting:a3 forReason:v15 hideNotificationCount:v5];

  return v16;
}

uint64_t __123__CSCombinedListViewController_acquireOverrideNotificationListDisplayStyleAssertionWithStyle_hideNotificationCount_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1056) removeOverrideNotificationListDisplayStyleSettingForReason:*(void *)(a1 + 40)];
}

- (BOOL)isScrollingListContent
{
  return [(NCNotificationStructuredListViewController *)self->_structuredListViewController isScrollingListContent];
}

- (void)handleDisplayWake:(BOOL)a3
{
}

- (void)addVisibleBreakthroughContentObserver:(id)a3
{
  id v4 = a3;
  if (![(NSHashTable *)self->_breakthroughContentObservers count]) {
    self->_hadBreakthroughContent = [(CSCombinedListViewController *)self hasVisibleBreakthroughContent];
  }
  [(NSHashTable *)self->_breakthroughContentObservers addObject:v4];
}

- (void)removeVisibleBreakthroughContentObserver:(id)a3
{
}

- (BOOL)isNotificationHistoryRevealed
{
  return self->_historyWasRevealed;
}

- (void)revealNotificationHistory:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)setRestrictsTouchesForRemoteView:(BOOL)a3
{
}

- (void)setShowNotificationsInAlwaysOn:(BOOL)a3
{
}

- (unint64_t)visibleNotificationCount
{
  return [(NCNotificationStructuredListViewController *)self->_structuredListViewController visibleNotificationCount];
}

- (void)setUserPresenceMonitor:(id)a3
{
  BOOL v5 = (CSUserPresenceMonitor *)a3;
  p_userPresenceMonitor = &self->_userPresenceMonitor;
  if (self->_userPresenceMonitor != v5)
  {
    char v7 = v5;
    objc_storeStrong((id *)p_userPresenceMonitor, a3);
    p_userPresenceMonitor = (CSUserPresenceMonitor **)[(CSCombinedListViewController *)self _updateFaceDetectMonitoring];
    BOOL v5 = v7;
  }

  MEMORY[0x1F41817F8](p_userPresenceMonitor, v5);
}

- (void)viewDidLoad
{
  id v3 = [(CSCombinedListViewController *)self view];
  id v4 = [(CSCombinedListViewController *)self notificationListViewController];
  BOOL v5 = [(CSCombinedListViewController *)self notificationListScrollView];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __43__CSCombinedListViewController_viewDidLoad__block_invoke;
  v23[3] = &unk_1E6AD9F50;
  v23[4] = self;
  id v6 = v3;
  id v24 = v6;
  id v7 = v4;
  id v25 = v7;
  [(CSCombinedListViewController *)self bs_addChildViewController:v7 animated:0 transitionBlock:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __43__CSCombinedListViewController_viewDidLoad__block_invoke_2;
  v21[3] = &unk_1E6AD8AF8;
  v21[4] = self;
  id v8 = v5;
  id v22 = v8;
  id v9 = (void *)MEMORY[0x1D9487300](v21);
  if ([(CSCombinedListViewController *)self _allowsSeparateAdjunctList]) {
    objc_msgSend(v7, "bs_addChildViewController:withSuperview:animated:transitionBlock:", self->_adjunctListViewController, v8, 0, v9);
  }
  [v8 setClipsToBounds:0];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1
      || SBFEffectiveHomeButtonType() != 2)
    {
      goto LABEL_12;
    }
LABEL_11:
    [(CSCombinedListViewController *)self _statusBarHeight];
    objc_msgSend(v8, "setScrollIndicatorInsets:");
    goto LABEL_12;
  }
  BOOL v10 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v10 userInterfaceIdiom])
  {

    goto LABEL_12;
  }
  uint64_t v11 = SBFEffectiveHomeButtonType();

  if (v11 == 2) {
    goto LABEL_11;
  }
LABEL_12:
  [(CSCoverSheetViewControllerBase *)self registerView:v8 forRole:2 options:1];
  if ([(CSCombinedListViewController *)self _allowsSeparateAdjunctList])
  {
    id v12 = [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController view];
    [(CSCoverSheetViewControllerBase *)self registerView:v12 forRole:2 options:1];
  }
  [(CSCombinedListViewController *)self _updatePresentationForReason:@"viewDidLoad"];
  uint64_t v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel__updateCaptureOnlyMaterialView name:*MEMORY[0x1E4F43480] object:0];
  [v13 addObserver:self selector:sel__liftToWakeGestureDetected name:*MEMORY[0x1E4FA7A68] object:0];
  [v13 addObserver:self selector:sel__lockButtonPressDetected name:*MEMORY[0x1E4FA7A70] object:0];
  [v13 addObserver:self selector:sel__homeButtonPressDetected name:*MEMORY[0x1E4FA7A78] object:0];
  structuredListViewController = self->_structuredListViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationStatusProvider);
  -[NCNotificationStructuredListViewController setDeviceAuthenticated:](structuredListViewController, "setDeviceAuthenticated:", [WeakRetained isAuthenticated]);

  if (self->_allowsDNDStateService)
  {
    uint64_t v16 = [MEMORY[0x1E4F5F760] serviceForClientIdentifier:@"com.apple.springboard.SBDashBoardCombinedListViewController"];
    dndStateService = self->_dndStateService;
    self->_dndStateService = v16;

    [(DNDStateService *)self->_dndStateService addStateUpdateListener:self withCompletionHandler:0];
    uint64_t v18 = self->_dndStateService;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __43__CSCombinedListViewController_viewDidLoad__block_invoke_3;
    v20[3] = &unk_1E6AD9F78;
    v20[4] = self;
    [(DNDStateService *)v18 queryCurrentStateWithCompletionHandler:v20];
  }
  v19.receiver = self;
  v19.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v19 viewDidLoad];
}

void __43__CSCombinedListViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  [v3 _layoutListView];
  id v4 = *(void **)(a1 + 40);
  BOOL v5 = [*(id *)(a1 + 48) view];
  [v4 addSubview:v5];

  [*(id *)(a1 + 32) _updateCaptureOnlyMaterialView];
  v6[2]();
}

void __43__CSCombinedListViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1 + 32) + 1576);
  id v4 = a2;
  id v18 = [v3 view];
  BOOL v5 = [*(id *)(a1 + 40) frameLayoutGuide];
  id v6 = [v18 leadingAnchor];
  id v7 = [v5 leadingAnchor];
  id v8 = [v6 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  id v9 = [v18 trailingAnchor];
  BOOL v10 = [v5 trailingAnchor];
  uint64_t v11 = [v9 constraintEqualToAnchor:v10];
  [v11 setActive:1];

  id v12 = [*(id *)(a1 + 40) contentLayoutGuide];
  uint64_t v13 = [v18 topAnchor];
  uint64_t v14 = [v12 topAnchor];
  uint64_t v15 = [v13 constraintEqualToAnchor:v14];
  uint64_t v16 = *(void *)(a1 + 32);
  double v17 = *(void **)(v16 + 1608);
  *(void *)(v16 + 1608) = v15;

  [*(id *)(*(void *)(a1 + 32) + 1608) setActive:1];
  [v18 setNeedsLayout];
  [*(id *)(a1 + 32) _layoutListView];
  v4[2](v4);
}

void __43__CSCombinedListViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__CSCombinedListViewController_viewDidLoad__block_invoke_4;
  v5[3] = &unk_1E6AD88C0;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __43__CSCombinedListViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActiveDNDState:*(void *)(a1 + 40)];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewWillLayoutSubviews];
  [(CSCombinedListViewController *)self _layoutListView];
  id v3 = [(CSCombinedListViewController *)self view];
  id v4 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController view];
  [v3 sendSubviewToBack:v4];

  BOOL v5 = [(CSCombinedListViewController *)self view];
  id v6 = [(UIViewController *)self->_captureOnlyMaterialViewController view];
  [v5 sendSubviewToBack:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v16 viewWillAppear:a3];
  [(CSCombinedListViewController *)self _updateFaceDetectMonitoring];
  [(CSCombinedListViewController *)self _updateNotificationLongPressProximitySensorAssertion];
  id v4 = [(CSCombinedListViewController *)self activeRaiseToListenNotificationRequest];
  [(CSCombinedListViewController *)self _updateRaiseGestureDetectionForNotificationRequest:v4];

  BOOL v5 = [(CSCombinedListViewController *)self notificationListScrollView];
  if (![(CSCombinedListViewController *)self _integratesAdjunctListIntoFullList])
  {
    [v5 contentOffset];
    double v7 = v6;
    double v9 = v8;
    [v5 contentInset];
    -[CSCombinedListViewController _sanitizedContentOffset:forContentInset:](self, "_sanitizedContentOffset:forContentInset:", v9, v10, v11, v12, v13);
    if ((BSFloatEqualToFloat() & 1) == 0) {
      objc_msgSend(v5, "setContentOffset:animated:", 0, v7, v9);
    }
  }
  [(CSCombinedListViewController *)self _updateQuickActionsVisibilityForScrollView:v5];
  adjunctListViewController = self->_adjunctListViewController;
  [(CSCombinedListViewController *)self topContentInset];
  [(CSNotificationAdjunctListViewController *)adjunctListViewController setProminentElementHeightToMimic:v15 + -8.666666];
  [(CSCombinedListViewController *)self _updateListItemAppearanceState];
  [(CSCombinedListViewController *)self _updatePresentationForReason:@"viewWillAppear"];
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewDidAppear:a3];
  id v4 = [(CSCombinedListViewController *)self view];
  BOOL v5 = [v4 window];
  double v6 = objc_msgSend(v5, "sb_coronaAnimationController");

  [v6 addParticipant:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSCombinedListViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v12, sel_viewWillDisappear_);
  if (!self->_listSuppressLongLookDismissal) {
    [(NCNotificationStructuredListViewController *)self->_structuredListViewController dismissModalFullScreenAnimated:v3];
  }
  [(CSCombinedListViewController *)self _updateFaceDetectMonitoring];
  [(CSCombinedListViewController *)self _updateNotificationLongPressProximitySensorAssertion];
  BOOL v5 = [(CSCombinedListViewController *)self activeRaiseToListenNotificationRequest];
  [(CSCombinedListViewController *)self _updateRaiseGestureDetectionForNotificationRequest:v5];

  double v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
    -[CSCombinedListViewController viewWillDisappear:](v6);
  }
  objc_super v7 = [MEMORY[0x1E4FA5F90] sharedInstance];
  [v7 removeGestureObserver:self];

  [(BSAbsoluteMachTimer *)self->_significantUserInteractionTimer invalidate];
  significantUserInteractionTimer = self->_significantUserInteractionTimer;
  self->_significantUserInteractionTimer = 0;

  double v9 = [(CSCombinedListViewController *)self view];
  double v10 = [v9 window];
  double v11 = objc_msgSend(v10, "sb_coronaAnimationController");

  [v11 removeParticipant:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidDisappear:a3];
  [(CSCombinedListViewController *)self _updateListItemAppearanceState];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)CSCombinedListViewController;
  id v7 = a4;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__CSCombinedListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E6AD97F8;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__CSCombinedListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E6AD97F8;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

uint64_t __83__CSCombinedListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePresentationForReason:@"transitionToSizeAlongside"];
}

uint64_t __83__CSCombinedListViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePresentationForReason:@"transitionToSizeCompletion"];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSCombinedListViewController;
  [(CSCombinedListViewController *)&v4 traitCollectionDidChange:a3];
  [(CSCombinedListViewController *)self _updateStructuredListOverrideUserInterfaceStyle];
}

- (void)aggregateAppearance:(id)a3
{
  v37[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v35 aggregateAppearance:v4];
  BOOL v5 = (void *)MEMORY[0x1E4F1CAD0];
  dateViewComponent = self->_dateViewComponent;
  v37[0] = self->_statusBarBackgroundComponent;
  v37[1] = dateViewComponent;
  statusBarComponent = self->_statusBarComponent;
  v37[2] = self->_complicationContainerComponent;
  v37[3] = statusBarComponent;
  v37[4] = self->_proudLockComponent;
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:5];
  double v9 = [v5 setWithArray:v8];

  if ([(CSComponent *)self->_remoteInlineContentComponent isHidden])
  {
    uint64_t v10 = [v9 setByAddingObject:self->_remoteInlineContentComponent];

    double v9 = (void *)v10;
  }
  if ([(CSComponent *)self->_quickActionsComponent isHidden])
  {
    uint64_t v11 = [v9 setByAddingObject:self->_quickActionsComponent];

    double v9 = (void *)v11;
  }
  if (self->_homeAffordanceComponent)
  {
    uint64_t v12 = objc_msgSend(v9, "setByAddingObject:");
  }
  else
  {
    if (![(NCNotificationStructuredListViewController *)self->_structuredListViewController isOverlayFooterContentVisible])goto LABEL_10; {
    double v13 = objc_opt_new();
    }
    uint64_t v14 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
    double v15 = [v13 identifier:v14];
    objc_super v16 = [v15 suppressTeachableMomentsAnimation:1];
    uint64_t v12 = [v9 setByAddingObject:v16];

    double v9 = v13;
  }

  double v9 = (void *)v12;
LABEL_10:
  if (self->_footerCallToActionLabelComponent)
  {
    uint64_t v17 = objc_msgSend(v9, "setByAddingObject:");

    double v9 = (void *)v17;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * i), "setPriority:", 10, (void)v31);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v20);
  }

  if ([self->_activeDNDState sb_isDimmingModeActive])
  {
    id v23 = objc_opt_new();
    id v24 = [v23 priority:10];
    id v25 = [NSNumber numberWithInteger:7];
    v26 = [v24 style:v25];
    [v4 addComponent:v26];

    double v27 = CSGetLegibilitySettingsForBackgroundStyle(7);
    [v4 setLegibilitySettings:v27];
  }
  if ([(CSWallpaperFloatingLayerComponent *)self->_wallpaperFloatingLayerComponent shouldRenderInline])
  {
    uint64_t v28 = [v18 setByAddingObject:self->_wallpaperFloatingLayerComponent];

    id v18 = (id)v28;
  }
  double v29 = [v4 components];
  CGFloat v30 = [v29 setByAddingObjectsFromSet:v18];
  [v4 setComponents:v30];
}

- (void)aggregateBehavior:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v11 aggregateBehavior:v4];
  BOOL v5 = [(CSLockScreenSettings *)self->_lockScreenSettings idleTimerSettings];
  int v6 = [v5 increaseNotificationScrollLogging];

  if ([(CSCombinedListViewController *)self _hasUserInteraction])
  {
    if (v6)
    {
      id v7 = SBLogIdleTimer();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[CSCombinedList][AggBehavior] has user interaction - automatic", v10, 2u);
      }
    }
    [v4 setIdleTimerDuration:10];
    [v4 setIdleTimerMode:1];
    [v4 addRestrictedCapabilities:256];
  }
  else if ([(CSCombinedListViewController *)self hasContent])
  {
    if (v6)
    {
      double v8 = SBLogIdleTimer();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1D839D000, v8, OS_LOG_TYPE_DEFAULT, "[CSCombinedList][AggBehavior] has content", v10, 2u);
      }
    }
    [v4 setIdleTimerDuration:4];
    [v4 removeRestrictedCapabilities:256];
  }
  if (v6
    && [(NSMutableSet *)self->_quickActionsHiddenReasons containsObject:@"CSQuickActionsScrolledSignificantlyReason"])
  {
    double v9 = SBLogIdleTimer();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[CSCombinedList][AggBehavior] has scrolled significantly - noop", v10, 2u);
    }
  }
  if ([(CSCombinedListViewController *)self _disableScrolling]) {
    [v4 setScrollingStrategy:3];
  }
  if (self->_dismissGestureDisabled) {
    [v4 addRestrictedCapabilities:4096];
  }
  else {
    [v4 removeRestrictedCapabilities:4096];
  }
}

- (void)rebuildEverythingForReason:(id)a3
{
  id v4 = a3;
  [(CSCombinedListViewController *)self _updatePresentationForReason:@"rebuildEverythingForReason"];
  v5.receiver = self;
  v5.super_class = (Class)CSCombinedListViewController;
  [(CSCoverSheetViewControllerBase *)&v5 rebuildEverythingForReason:v4];
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  if (a5) {
    (*((void (**)(id))a5 + 2))(a5);
  }
}

- (CGSize)effectiveContentSizeForScrollView:(id)a3
{
  id v4 = a3;
  id v5 = [(CSCombinedListViewController *)self notificationListScrollView];
  if (v5 == v4)
  {
    [v4 contentSize];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CSCombinedListViewController;
    [(CSCoverSheetViewControllerBase *)&v12 effectiveContentSizeForScrollView:v4];
  }
  double v8 = v6;
  double v9 = v7;

  double v10 = v8;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)postNotificationRequest:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    double v9 = [v4 notificationIdentifier];
    double v10 = objc_msgSend(v9, "un_logDigest");
    double v11 = (objc_class *)objc_opt_class();
    objc_super v12 = NSStringFromClass(v11);
    *(_DWORD *)buf = 138543874;
    id v18 = v8;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    __int16 v21 = 2114;
    id v22 = v12;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ posting notification %{public}@ to %{public}@", buf, 0x20u);
  }
  if (self->_dndBedtimeGreetingViewController)
  {
    [(CSCombinedListViewController *)self _dismissDNDBedtimeGreetingViewAnimated:1];
    double v13 = SBLogDoNotDisturbBedtime();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, "Post notification request dismissed greeting view.", buf, 2u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__CSCombinedListViewController_postNotificationRequest___block_invoke;
  v15[3] = &unk_1E6AD88C0;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [(CSCombinedListViewController *)self _performSelfCorrectingListViewAction:v15];
}

uint64_t __56__CSCombinedListViewController_postNotificationRequest___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1056) insertNotificationRequest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateNotificationListOffsetForExternalUpdate];
  id v2 = *(void **)(a1 + 32);

  return [v2 _publishVisibleNotificationCountOnContentChange];
}

- (void)updateNotificationRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    double v9 = [v4 notificationIdentifier];
    double v10 = objc_msgSend(v9, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    double v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification %{public}@", buf, 0x16u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__CSCombinedListViewController_updateNotificationRequest___block_invoke;
  v12[3] = &unk_1E6AD88C0;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(CSCombinedListViewController *)self _performSelfCorrectingListViewAction:v12];
}

uint64_t __58__CSCombinedListViewController_updateNotificationRequest___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1056) modifyNotificationRequest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateNotificationListOffsetForExternalUpdate];
  id v2 = *(void **)(a1 + 32);

  return [v2 _publishVisibleNotificationCountOnContentChange];
}

- (void)withdrawNotificationRequest:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    double v7 = (objc_class *)objc_opt_class();
    double v8 = NSStringFromClass(v7);
    double v9 = [v4 notificationIdentifier];
    double v10 = objc_msgSend(v9, "un_logDigest");
    *(_DWORD *)buf = 138543618;
    double v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v10;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ withdrawing notification %{public}@", buf, 0x16u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__CSCombinedListViewController_withdrawNotificationRequest___block_invoke;
  v12[3] = &unk_1E6AD88C0;
  v12[4] = self;
  id v13 = v4;
  id v11 = v4;
  [(CSCombinedListViewController *)self _performSelfCorrectingListViewAction:v12];
}

uint64_t __60__CSCombinedListViewController_withdrawNotificationRequest___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1056) removeNotificationRequest:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _updateNotificationListOffsetForExternalUpdate];
  id v2 = *(void **)(a1 + 32);

  return [v2 _publishVisibleNotificationCountOnContentChange];
}

- (void)_updateNotificationListOffsetForExternalUpdate
{
  BOOL v3 = [(CSCombinedListViewController *)self notificationListScrollView];
  if ([(CSCombinedListViewController *)self _shouldPadBottomSpacing])
  {
    if (![(CSCombinedListViewController *)self _integratesAdjunctListIntoFullList])
    {
      [v3 contentOffset];
      [(CSCombinedListViewController *)self defaultRestingOffsetExcludingAdjunct];
      CSAdjustTargetContentOffset(v3);
      objc_msgSend(v3, "setContentOffset:animated:", 1);
    }
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __78__CSCombinedListViewController__updateNotificationListOffsetForExternalUpdate__block_invoke;
    v4[3] = &unk_1E6AD87F8;
    v4[4] = self;
    [MEMORY[0x1E4F42FF0] _animateUsingDefaultTimingWithOptions:2 animations:v4 completion:0];
  }
}

void __78__CSCombinedListViewController__updateNotificationListOffsetForExternalUpdate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) notificationListScrollView];
  [v1 _scrollToTopIfPossible:0];
}

- (void)updateNotificationSectionSettings:(id)a3 previousSectionSettings:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    double v9 = v8;
    double v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    objc_super v12 = [v6 sectionIdentifier];
    int v13 = 138543618;
    id v14 = v11;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification section settings for section %@", (uint8_t *)&v13, 0x16u);
  }
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController updateNotificationSectionSettings:v6 previousSectionSettings:v7];
}

- (void)updateNotificationSystemSettings:(id)a3 previousSystemSettings:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    double v9 = v8;
    double v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    int v12 = 138543362;
    int v13 = v11;
    _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ updating notification system settings", (uint8_t *)&v12, 0xCu);
  }
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController updateNotificationSystemSettings:v6 previousSystemSettings:v7];
}

- (void)notificationsLoadedForSectionIdentifier:(id)a3
{
}

- (void)applicationInformer:(id)a3 updatedApplications:(id)a4
{
}

- (id)groupNameBaseForAdjunctListViewController:(id)a3
{
  return (id)[(NCNotificationStructuredListViewController *)self->_structuredListViewController backgroundGroupNameBase];
}

- (CGSize)sizeToMimicForAdjunctListViewController:(id)a3
{
  BOOL v3 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (UIEdgeInsets)insetMarginsToMimicForAdjunctListViewController:(id)a3
{
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController insetMargins];
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (double)interItemSpacingToMimicForAdjunctListViewController:(id)a3
{
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController itemSpacing];
  return result;
}

- (void)adjunctListViewController:(id)a3 didUpdateWithSize:(CGSize)a4
{
  if (self->_adjunctListViewController == a3)
  {
    CGFloat height = a4.height;
    int v6 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleContent];
    BOOL v7 = [(CSCombinedListViewController *)self _allowsSeparateAdjunctList];
    if (v7) {
      BOOL v7 = [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController isPresentingTransientContent];
    }
    [(CSCombinedListViewController *)self _setListHasContent:v6 | v7];
    [(CSCombinedListViewController *)self _adjunctListViewSizeIncludingSpacing];
    double v9 = v8;
    if (![(CSCombinedListViewController *)self _allowsSeparateAdjunctList]) {
      CGFloat height = v9;
    }
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      self->_cachedAdjunctHeight = height;
      [(CSCombinedListViewController *)self _updateListViewContentInset];
      [(CSCombinedListViewController *)self _updatePresentationForReason:@"didUpdateWithSize"];
    }
  }
}

- (void)adjunctListViewController:(id)a3 didAddSectionWithIdentifier:(id)a4
{
  __int16 v16 = (CSNotificationAdjunctListViewController *)a3;
  id v6 = a4;
  if (self->_adjunctListViewController == v16)
  {
    if (!self->_supplementaryItemContainersByIdentifier)
    {
      BOOL v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
      self->_supplementaryItemContainersByIdentifier = v7;
    }
    if (!self->_adjunctViewControllersByIdentifier)
    {
      double v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      adjunctViewControllersByIdentifier = self->_adjunctViewControllersByIdentifier;
      self->_adjunctViewControllersByIdentifier = v9;
    }
    if (![(CSCombinedListViewController *)self _allowsSeparateAdjunctList])
    {
      id v11 = [(NSMutableDictionary *)self->_supplementaryItemContainersByIdentifier objectForKeyedSubscript:v6];

      if (!v11)
      {
        int v12 = [NSString stringWithFormat:@"CoverSheet supplementary items - %@", v6];
        int v13 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController insertSupplementaryViewsContainerAtListPosition:1 identifier:v6 withDescription:v12];
        [v13 setSupplementaryContainerDelegate:v16];
        uint64_t v14 = [(CSNotificationAdjunctListViewController *)v16 itemsGroupSortComparatorForListSectionIdentifier:v6];
        [v13 setGroupSortComparator:v14];

        __int16 v15 = [(CSNotificationAdjunctListViewController *)v16 itemsViewControllerSortComparatorForListSectionIdentifier:v6];
        [v13 setViewControllerSortComparator:v15];

        [(NSMutableDictionary *)self->_supplementaryItemContainersByIdentifier setObject:v13 forKey:v6];
      }
    }
  }
}

- (void)adjunctListViewController:(id)a3 didAddViewController:(id)a4 withIdentifier:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  if (self->_adjunctListViewController == a3)
  {
    double v9 = [(NSMutableDictionary *)self->_supplementaryItemContainersByIdentifier objectForKey:@"AdjunctTopSticky"];
    [(NSMutableDictionary *)self->_adjunctViewControllersByIdentifier setObject:v15 forKey:v8];
    double v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = v8;
    if ([v11 isEqualToString:@"com.apple.SpringBoard.prominentUI"]) {
      int v12 = @"PROMINENT_NOTIFICATION_GROUP_NAME";
    }
    else {
      int v12 = @"SLEEP_NOTIFICATION_GROUP_NAME";
    }
    int v13 = [v10 localizedStringForKey:v12 value:&stru_1F3020248 table:@"CoverSheet"];
    id v14 = objc_alloc_init(MEMORY[0x1E4FB38E8]);
    [v14 setGroupName:v13];
    [v14 setGroupingIdentifier:v11];

    [v14 setMaterialRecipe:0];
    [v14 setPreventsUserDismissal:1];
    [v9 insertSupplementaryViewController:v15 withConfiguration:v14];
  }
}

- (void)adjunctListViewController:(id)a3 willRemoveViewWithIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_adjunctListViewController == a3)
  {
    BOOL v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      id v11 = v6;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Removing adjunct with identifier: %{public}@ from notification list", (uint8_t *)&v10, 0xCu);
    }

    id v8 = [(NSMutableDictionary *)self->_supplementaryItemContainersByIdentifier objectForKey:@"AdjunctTopSticky"];
    double v9 = [(NSMutableDictionary *)self->_adjunctViewControllersByIdentifier objectForKeyedSubscript:v6];
    if (v9) {
      [v8 removeSupplementaryViewController:v9];
    }
  }
}

- (void)focusActivityViewChangedToVisible:(BOOL)a3
{
  [(CSCombinedListViewController *)self setShowingFocusActivityView:a3];

  [(CSCombinedListViewController *)self layoutListView];
}

- (void)adjunctListViewController:(id)a3 updatedNowPlayingVisbility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CSCombinedListViewController *)self delegate];
  [v6 combinedListViewController:self isShowingMediaControls:v4];
}

- (void)itemManager:(id)a3 insertSection:(id)a4
{
  id v15 = a3;
  id v6 = [a4 identifier];
  supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
  if (!supplementaryItemContainersByIdentifier)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v9 = self->_supplementaryItemContainersByIdentifier;
    self->_supplementaryItemContainersByIdentifier = v8;

    supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
  }
  int v10 = [(NSMutableDictionary *)supplementaryItemContainersByIdentifier objectForKey:v6];

  if (!v10)
  {
    id v11 = [NSString stringWithFormat:@"CoverSheet supplementary items - %@", v6];
    uint64_t v12 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController insertSupplementaryViewsContainerAtListPosition:0 identifier:v6 withDescription:v11];
    [v12 setSupplementaryContainerDelegate:v15];
    int v13 = [v15 itemsGroupSortComparatorForListSectionIdentifier:v6];
    [v12 setGroupSortComparator:v13];

    id v14 = [v15 itemsViewControllerSortComparatorForListSectionIdentifier:v6];
    [v12 setViewControllerSortComparator:v14];

    [(NSMutableDictionary *)self->_supplementaryItemContainersByIdentifier setObject:v12 forKey:v6];
  }
}

- (void)itemManager:(id)a3 insertItem:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_supplementaryItemManager == a3)
  {
    BOOL v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = v6;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Inserting supplementary item: %{public}@ into notification list", (uint8_t *)&v18, 0xCu);
    }

    supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
    double v9 = [v6 sectionIdentifier];
    int v10 = [(NSMutableDictionary *)supplementaryItemContainersByIdentifier objectForKey:v9];

    id v11 = [v6 contentHost];
    if (objc_opt_respondsToSelector()) {
      [v11 setScreenOn:self->_screenOn];
    }
    uint64_t v12 = [v6 configuration];
    [v10 insertSupplementaryViewController:v11 withConfiguration:v12];

    [(CSCombinedListViewController *)self _noteListContentsPotentiallyChanged];
    uint64_t v13 = [(CSCombinedListViewController *)self bs_isAppearingOrAppeared];
    if (objc_opt_respondsToSelector()) {
      [v11 setListAppeared:v13];
    }
    id v14 = self;
    id v15 = v11;
    if (v14)
    {
      if (objc_opt_isKindOfClass()) {
        __int16 v16 = v15;
      }
      else {
        __int16 v16 = 0;
      }
    }
    else
    {
      __int16 v16 = 0;
    }
    id v17 = v16;

    [v17 setDelegate:self];
    if (v13 && [(CSCombinedListViewController *)self _isScreenOn]) {
      [v17 setPresentationMode:1];
    }
  }
}

- (void)itemManager:(id)a3 updateItem:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_supplementaryItemManager == a3)
  {
    BOOL v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Updating supplementary item: %@ in notification list", (uint8_t *)&v14, 0xCu);
    }

    supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
    double v9 = [v6 sectionIdentifier];
    int v10 = [(NSMutableDictionary *)supplementaryItemContainersByIdentifier objectForKey:v9];

    id v11 = [v6 contentHost];
    uint64_t v12 = [v6 configuration];
    [v10 updateSupplementaryViewController:v11 withConfiguration:v12];

    uint64_t v13 = [v6 contentHost];
    [v10 updatePositionIfNeededForSupplementaryViewController:v13];

    [(CSCombinedListViewController *)self _noteListContentsPotentiallyChanged];
  }
}

- (void)itemManager:(id)a3 removeItem:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_supplementaryItemManager == a3)
  {
    BOOL v7 = SBLogDashBoard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Removing supplementary item from: %{public}@ into notification list", (uint8_t *)&v12, 0xCu);
    }

    supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
    double v9 = [v6 sectionIdentifier];
    int v10 = [(NSMutableDictionary *)supplementaryItemContainersByIdentifier objectForKey:v9];

    id v11 = [v6 contentHost];
    [v10 removeSupplementaryViewController:v11];

    [(CSCombinedListViewController *)self _noteListContentsPotentiallyChanged];
  }
}

- (void)itemManager:(id)a3 requestsModalPresentationOfViewController:(id)a4 forItem:(id)a5 animated:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  supplementaryItemContainersByIdentifier = self->_supplementaryItemContainersByIdentifier;
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = [v12 sectionIdentifier];
  id v16 = [(NSMutableDictionary *)supplementaryItemContainersByIdentifier objectForKey:v14];

  id v15 = [v12 contentHost];

  [v16 presentViewControllerModally:v13 fromSupplementaryViewController:v15 animated:v7 completion:v11];
}

- (CGSize)sizeToMimicForItemContentHost
{
  id v2 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.CGFloat height = v8;
  result.double width = v7;
  return result;
}

- (void)itemManager:(id)a3 setNowPlayingItem:(id)a4
{
  BOOL v5 = a4 != 0;
  id v6 = [(CSCombinedListViewController *)self delegate];
  [v6 combinedListViewController:self isShowingMediaControls:v5];
}

- (void)itemManager:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__CSCombinedListViewController_itemManager_requestsAuthenticationAndPerformBlock___block_invoke;
  v7[3] = &unk_1E6AD8B48;
  id v8 = v5;
  id v6 = v5;
  [(CSCombinedListViewController *)self _requestAuthenticationWithCompletion:v7];
}

uint64_t __82__CSCombinedListViewController_itemManager_requestsAuthenticationAndPerformBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)itemManager:(id)a3 cancelTouchesForInteractionWithItem:(id)a4
{
  id v9 = [(CSCombinedListViewController *)self coverSheetGestureHandling];
  if (v9) {
    [v9 contentRequestCancellingGesture];
  }
  id v5 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController scrollView];
  id v6 = [v5 panGestureRecognizer];
  [v6 setEnabled:0];

  double v7 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController scrollView];
  id v8 = [v7 panGestureRecognizer];
  [v8 setEnabled:1];
}

- (void)itemManager:(id)a3 significantUserInteractionBeganWithItem:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogCoverSheetActivities();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = _SBFLoggingMethodProem();
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  [(CSCombinedListViewController *)self _triggerSignificantUserInteractionIfNeeded];
}

- (void)itemManager:(id)a3 significantUserInteractionEndedWithItem:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = SBLogCoverSheetActivities();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = _SBFLoggingMethodProem();
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);
  }
  [(CSCombinedListViewController *)self _triggerSignificantUserInteractionIfNeeded];
}

- (void)itemManagerDidAddNewSceneHostEnvironment
{
  uint64_t v2 = [(CSCombinedListViewController *)self activityItemObserver];
  if (v2)
  {
    double v3 = (void *)v2;
    uint64_t v2 = objc_opt_respondsToSelector();
    if (v2) {
      uint64_t v2 = [v3 didAddNewActivityItemSceneHostEnvironment];
    }
  }

  MEMORY[0x1F4181820](v2);
}

- (BOOL)isNotificationContentExtensionVisible:(id)a3
{
  id v4 = a3;
  if ([(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleContent])char v5 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController isContentExtensionVisible:v4]; {
  else
  }
    char v5 = 0;

  return v5;
}

- (BOOL)isPresentingNotificationInLongLook
{
  int v3 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleContent];
  if (v3)
  {
    structuredListViewController = self->_structuredListViewController;
    LOBYTE(v3) = [(NCNotificationStructuredListViewController *)structuredListViewController isPresentingNotificationInLongLook];
  }
  return v3;
}

- (BOOL)dismissNotificationInLongLookAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleContent];
  if (v5)
  {
    structuredListViewController = self->_structuredListViewController;
    LOBYTE(v5) = [(NCNotificationStructuredListViewController *)structuredListViewController dismissModalFullScreenAnimated:v3];
  }
  return v5;
}

- (void)notificationStructuredListViewController:(id)a3 requestPermissionToExecuteAction:(id)a4 forNotificationRequest:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  id v11 = a7;
  self->_listSuppressLongLookDismissal = 1;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(CSCombinedListViewController *)self dispatcher];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __155__CSCombinedListViewController_notificationStructuredListViewController_requestPermissionToExecuteAction_forNotificationRequest_withParameters_completion___block_invoke;
  v17[3] = &unk_1E6AD9000;
  v17[4] = self;
  id v18 = v11;
  id v16 = v11;
  [v15 destination:self requestPermissionToExecuteAction:v14 forNotificationRequest:v13 withParameters:v12 completion:v17];
}

uint64_t __155__CSCombinedListViewController_notificationStructuredListViewController_requestPermissionToExecuteAction_forNotificationRequest_withParameters_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1120) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)notificationStructuredListViewController:(id)a3 requestsExecuteAction:(id)a4 forNotificationRequest:(id)a5 requestAuthentication:(BOOL)a6 withParameters:(id)a7 completion:(id)a8
{
  BOOL v9 = a6;
  id v13 = a8;
  self->_listSuppressLongLookDismissal = 1;
  id v14 = a7;
  id v15 = a5;
  id v16 = a4;
  id v17 = [(CSCombinedListViewController *)self dispatcher];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __166__CSCombinedListViewController_notificationStructuredListViewController_requestsExecuteAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke;
  v19[3] = &unk_1E6AD9000;
  v19[4] = self;
  id v20 = v13;
  id v18 = v13;
  [v17 destination:self performAction:v16 forNotificationRequest:v15 requestAuthentication:v9 withParameters:v14 completion:v19];
}

uint64_t __166__CSCombinedListViewController_notificationStructuredListViewController_requestsExecuteAction_forNotificationRequest_requestAuthentication_withParameters_completion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1120) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)notificationStructuredListViewController:(id)a3 containerViewProviderForExpandedContentForViewController:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v5 = (UIView *)a4;
  int v6 = [(CSCombinedListViewController *)self isViewLoaded];
  id v7 = 0;
  if (v5 && v6)
  {
    id v8 = (os_log_t *)MEMORY[0x1E4FB3750];
    BOOL v9 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CGRect v44 = v5;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Notification structured list view controller requesting container view for view controller: %{public}@", buf, 0xCu);
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    int v10 = self->_notificationContainerViewAssertions;
    uint64_t v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v39;
LABEL_7:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v39 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v38 + 1) + 8 * v14);
        id v16 = [v15 requester];

        if (v16 == v5) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v12) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v7 = v15;

      if (v7) {
        goto LABEL_22;
      }
    }
    else
    {
LABEL_13:
    }
    if (!self->_containerViewForExpandedNotificationContent)
    {
      id v17 = [(CSCombinedListViewController *)self view];
      id v18 = [v17 superview];
      [v17 frame];
      objc_msgSend(v18, "convertRect:toView:", 0);
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;

      double v27 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v20, v22, v24, v26);
      containerViewForExpandedNotificationContent = self->_containerViewForExpandedNotificationContent;
      self->_containerViewForExpandedNotificationContent = v27;

      [(UIView *)self->_containerViewForExpandedNotificationContent setAutoresizingMask:18];
      double v29 = [v17 window];
      [v29 addSubview:self->_containerViewForExpandedNotificationContent];

      CGFloat v30 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        long long v31 = self->_containerViewForExpandedNotificationContent;
        *(_DWORD *)buf = 138543362;
        CGRect v44 = v31;
        _os_log_impl(&dword_1D839D000, v30, OS_LOG_TYPE_DEFAULT, "Instantiated new container view for expanded notification content: %{public}@", buf, 0xCu);
      }
    }
    if (!self->_notificationContainerViewAssertions)
    {
      long long v32 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      notificationContainerViewAssertions = self->_notificationContainerViewAssertions;
      self->_notificationContainerViewAssertions = v32;
    }
    id v34 = objc_alloc(MEMORY[0x1E4FA79B0]);
    objc_super v35 = self->_containerViewForExpandedNotificationContent;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __130__CSCombinedListViewController_notificationStructuredListViewController_containerViewProviderForExpandedContentForViewController___block_invoke;
    v37[3] = &unk_1E6AD9FA0;
    v37[4] = self;
    id v7 = (id)[v34 initWithRequester:v5 containerView:v35 reason:@"Container view requested for notification view controller" invalidationBlock:v37];
    [(NSHashTable *)self->_notificationContainerViewAssertions addObject:v7];
  }
LABEL_22:

  return v7;
}

uint64_t __130__CSCombinedListViewController_notificationStructuredListViewController_containerViewProviderForExpandedContentForViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) removeObject:a2];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1072) count];
  if (!result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 _tearDownContainerViewForExpandedNotificationContent];
  }
  return result;
}

- (void)notificationStructuredListViewController:(id)a3 shouldFinishLongLookTransitionForNotificationRequest:(id)a4 trigger:(int64_t)a5 withCompletionBlock:(id)a6
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  BOOL v9 = (void (**)(id, uint64_t))a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationStatusProvider);
  uint64_t v11 = [MEMORY[0x1E4FA60C0] standardDefaults];
  int v44 = [v11 alwaysAllowLongLookGesture];

  uint64_t v12 = [(CSCoverSheetViewControllerBase *)self activeBehavior];
  int v13 = [v12 areRestrictedCapabilities:0x20000];

  int v14 = [WeakRetained hasAuthenticatedAtLeastOnceSinceBoot];
  int v15 = [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled];
  BOOL v43 = [(CSUserPresenceMonitor *)self->_userPresenceMonitor isDetectionEnabled];
  id v16 = [v8 defaultAction];

  v50 = v8;
  id v17 = [v8 options];
  uint64_t v47 = [v17 contentPreviewSetting];
  BOOL v18 = v47 == 0;

  int v19 = [WeakRetained isAuthenticated];
  BOOL v46 = [(CSUserPresenceMonitor *)self->_userPresenceMonitor userPresenceDetectedSinceWake];
  BOOL v45 = self->_hasProximitySensor && !self->_proximitySensorCoveredSinceWake;
  BOOL coverSheetWasDismissed = self->_coverSheetWasDismissed;
  BOOL historyWasRevealed = self->_historyWasRevealed;
  int v49 = v19;
  if ((v13 | v14 ^ 1))
  {
    int v21 = 0;
  }
  else
  {
    double v22 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v23 = [v22 userInterfaceIdiom];

    BOOL v25 = (a5 & 0xFFFFFFFFFFFFFFFELL) != 2 && (v23 & 0xFFFFFFFFFFFFFFFBLL) != 1 && !coverSheetWasDismissed;
    int v26 = v46;
    if (!v25) {
      int v26 = 1;
    }
    if (v47) {
      int v27 = v15;
    }
    else {
      int v27 = 0;
    }
    int v21 = v26 | v27 | v19 | v45;
  }
  uint64_t v28 = (os_log_t *)MEMORY[0x1E4FB3750];
  double v29 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    id v30 = WeakRetained;
    long long v31 = v9;
    BOOL v32 = v16 != 0;
    long long v33 = v29;
    id v34 = NCStringFromLongLookPresentationTrigger();
    objc_super v35 = [v50 notificationIdentifier];
    uint64_t v36 = objc_msgSend(v35, "un_logDigest");
    *(_DWORD *)buf = 138546178;
    v52 = v34;
    __int16 v53 = 2114;
    *(void *)v54 = v36;
    *(_WORD *)&v54[8] = 1024;
    *(_DWORD *)v55 = coverSheetWasDismissed;
    *(_WORD *)&v55[4] = 1024;
    BOOL v56 = historyWasRevealed;
    __int16 v57 = 1024;
    BOOL v58 = v43;
    __int16 v59 = 1024;
    BOOL v60 = v46;
    __int16 v61 = 1024;
    BOOL v62 = v32;
    BOOL v9 = v31;
    id WeakRetained = v30;
    BOOL v18 = v47 == 0;
    __int16 v63 = 1024;
    BOOL v64 = v18;
    __int16 v65 = 1024;
    int v66 = v49;
    __int16 v67 = 1024;
    BOOL v68 = v45;
    __int16 v69 = 1024;
    int v70 = v44;
    __int16 v71 = 1024;
    int v72 = v21;
    _os_log_impl(&dword_1D839D000, v33, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Should finish long look transition via %{public}@ for notification %{public}@: [ pulled-down: %{BOOL}d revealed-history: %{BOOL}d face-detecting: %{BOOL}d face-detected: %{BOOL}d default-action: %{BOOL}d content-preview-always: %{BOO}d authenticated: %{BOOL}d proximity-uncovered-after-wake: %{BOOL}d override: %{BOOL}d ]: %{BOOL}d", buf, 0x52u);

    uint64_t v28 = (os_log_t *)MEMORY[0x1E4FB3750];
  }
  if (v21)
  {
    if (v47) {
      int v37 = v49;
    }
    else {
      int v37 = 1;
    }
    os_log_t v38 = *v28;
    if (os_log_type_enabled(*v28, OS_LOG_TYPE_DEFAULT))
    {
      long long v39 = v38;
      long long v40 = [v50 notificationIdentifier];
      long long v41 = objc_msgSend(v40, "un_logDigest");
      *(_DWORD *)buf = 138544130;
      v52 = v41;
      __int16 v53 = 1024;
      *(_DWORD *)v54 = v49;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v18;
      *(_WORD *)v55 = 1024;
      *(_DWORD *)&v55[2] = v37 ^ 1;
      _os_log_impl(&dword_1D839D000, v39, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Should request authentication for notification %{public}@: [ authenticated: %{BOOL}d content-preview-always: %{BOOL}d]: %{BOOL}d", buf, 0x1Eu);
    }
    if (v37)
    {
      v9[2](v9, 1);
    }
    else
    {
      self->_confirmedNotInPocket = 1;
      [(CSCombinedListViewController *)self _requestAuthenticationWithCompletion:v9];
    }
  }
  else if (v9)
  {
    v9[2](v9, 0);
  }
}

- (Class)notificationStructuredListViewControllerNotificationViewControllerClass:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)notificationStructuredListViewControllerDidSignificantUserInteraction:(id)a3
{
  id v4 = SBLogDashBoard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CSCombinedListViewController notificationStructuredListViewControllerDidSignificantUserInteraction:]();
  }

  [(CSCombinedListViewController *)self _triggerSignificantUserInteractionIfNeeded];
  self->_interactingWithNotificationList = 1;
}

- (void)notificationStructuredListViewControllerDidBeginUserInteraction:(id)a3
{
  [(CSCombinedListViewController *)self _setHasUserInteraction:1 forReason:@"NotificationInteraction"];

  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
}

- (void)notificationStructuredListViewControllerDidEndUserInteraction:(id)a3
{
  [(CSCombinedListViewController *)self _setHasUserInteraction:0 forReason:@"NotificationInteraction"];

  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
}

- (void)notificationStructuredListViewControllerDidUpdateVisibleContentExtent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = [(CSCombinedListViewController *)self notificationListScrollView];
  if ([v4 isDragging] & 1) != 0 || (objc_msgSend(v4, "isDecelerating")) {
    int v5 = 1;
  }
  else {
    int v5 = [v4 isScrollAnimating];
  }
  int v6 = [MEMORY[0x1E4F42FF0] _isInAnimationBlock];
  BOOL listBeingLaidOut = self->_listBeingLaidOut;
  id v8 = SBLogDashBoard();
  BOOL v9 = v8;
  if ((v6 & 1) != 0 || (v5 & 1) != 0 || listBeingLaidOut)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67240704;
      v10[1] = v6;
      __int16 v11 = 1026;
      int v12 = v5;
      __int16 v13 = 1026;
      BOOL v14 = listBeingLaidOut;
      _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "Early exiting notificationStructuredListViewControllerDidUpdateVisibleContentExtent. isInAnimationBlock: %{public}d. isScrolling: %{public}d. _listBeingLaidOut: %{public}d", (uint8_t *)v10, 0x14u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CSCombinedListViewController notificationStructuredListViewControllerDidUpdateVisibleContentExtent:](v9);
    }

    [(CSCombinedListViewController *)self _updatePresentationForReason:@"didUpdateVisibleContentExtent"];
  }
}

- (void)notificationStructuredListViewController:(id)a3 didBeginUserInteractionWithViewController:(id)a4
{
  -[CSStatusBarComponent setFakeStatusBar:](self->_statusBarComponent, "setFakeStatusBar:", 1, a4);
  [(CSStatusBarComponent *)self->_statusBarComponent setFakeStatusBarLevel:&unk_1F306BF38];
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];

  [(CSCombinedListViewController *)self _setHasUserInteraction:1 forReason:@"NotificationInteraction"];
}

- (void)notificationStructuredListViewController:(id)a3 didEndUserInteractionWithViewController:(id)a4
{
  -[CSStatusBarComponent setFakeStatusBar:](self->_statusBarComponent, "setFakeStatusBar:", 0, a4);
  [(CSStatusBarComponent *)self->_statusBarComponent setFakeStatusBarLevel:0];
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];

  [(CSCombinedListViewController *)self _setHasUserInteraction:0 forReason:@"NotificationInteraction"];
}

- (void)notificationStructuredListViewControllerWillExpandNotificationListCount:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained combinedListViewControllerWillExpandNotificationListCount:self];
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  p_scrollablePage = &self->_scrollablePage;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_scrollablePage);
  [WeakRetained scrollViewWillBeginDragging:v5];

  self->_shouldPadBottomSpacingWhileDragging = [(CSCombinedListViewController *)self _shouldPadBottomSpacingIsDragging:0];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollablePage);
  objc_msgSend(WeakRetained, "scrollViewWillEndDragging:withVelocity:", v9, x, y);

  if (!self->_listBeingLaidOut)
  {
    __int16 v11 = SBLogDashBoard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CSCombinedListViewController notificationStructuredListViewControllerDidSignificantUserInteraction:]();
    }

    if ([(CSCombinedListViewController *)self _allowsDateViewOrProudLockScroll]
      && ![(CSCombinedListViewController *)self _integratesAdjunctListIntoFullList])
    {
      [(CSCombinedListViewController *)self defaultRestingOffsetExcludingAdjunct];
      CSAdjustTargetContentOffset(v9);
      a5->double x = v12;
      a5->double y = v13;
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(CSCombinedListViewController *)self _snapScrollView:a3 toAcceptableOffsetAnimated:1];
  }
}

- (void)_snapToAcceptableOffsetForScrollView:(id)a3
{
}

- (void)_snapScrollView:(id)a3 toAcceptableOffsetAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  if (![(CSCombinedListViewController *)self _integratesAdjunctListIntoFullList])
  {
    [v10 contentOffset];
    [(CSCombinedListViewController *)self defaultRestingOffsetExcludingAdjunct];
    CSAdjustTargetContentOffset(v10);
    double v7 = v6;
    double v9 = v8;
    [v10 contentOffset];
    if ((BSPointEqualToPoint() & 1) == 0) {
      objc_msgSend(v10, "setContentOffset:animated:", v4, v7, v9);
    }
  }
}

- (double)defaultRestingOffsetExcludingAdjunct
{
  [(CSCombinedListViewController *)self clippingOffset];
  return v3 - self->_cachedAdjunctHeight;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollablePage);
  [WeakRetained scrollViewDidScroll:v4];

  if (self->_listBeingLaidOut) {
    goto LABEL_21;
  }
  double v6 = SBLogDashBoard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[CSCombinedListViewController notificationStructuredListViewControllerDidSignificantUserInteraction:]();
  }

  [(CSCombinedListViewController *)self _updatePresentationForReason:@"didScroll"];
  int v7 = [(NSMutableSet *)self->_quickActionsHiddenReasons containsObject:@"CSQuickActionsScrolledSignificantlyReason"];
  BOOL v8 = [(CSCombinedListViewController *)self _hasExperiencedSignificantScrollingOnScrollView:v4];
  double v9 = [(CSLockScreenSettings *)self->_lockScreenSettings idleTimerSettings];
  int v10 = [v9 increaseNotificationScrollLogging];

  if (v10)
  {
    if (!(!v8 | v7))
    {
      __int16 v11 = SBLogIdleTimer();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        CGFloat v12 = "Switching to scrolling significantly";
        CGFloat v13 = buf;
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (!(v8 | v7 ^ 1u))
    {
      __int16 v11 = SBLogIdleTimer();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        CGFloat v12 = "No longer scrolling significantly";
        CGFloat v13 = (uint8_t *)&v16;
LABEL_11:
        _os_log_impl(&dword_1D839D000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  BOOL v14 = v8
     && [(CSCombinedListViewController *)self _notificationListExpandsVisibleRegionOnSignificantScroll];
  -[CSCombinedListViewController _updateHidingQuickActionsForSignificantScrolling:](self, "_updateHidingQuickActionsForSignificantScrolling:", v14, v16);
  [(CSCombinedListViewController *)self _setInlineContentHidden:v8];
  if ((unint64_t)([(CSCombinedListViewController *)self interfaceOrientation] - 1) < 2
    && v8)
  {
    [(CSCombinedListViewController *)self _dismissDNDBedtimeGreetingViewAnimated:1];
  }
LABEL_21:
}

- (void)_updateQuickActionsVisibilityForScrollView:(id)a3
{
  if ([(CSCombinedListViewController *)self _hasExperiencedSignificantScrollingOnScrollView:a3])
  {
    BOOL v4 = [(CSCombinedListViewController *)self _notificationListExpandsVisibleRegionOnSignificantScroll];
  }
  else
  {
    BOOL v4 = 0;
  }

  [(CSCombinedListViewController *)self _updateHidingQuickActionsForSignificantScrolling:v4];
}

- (void)_updateHidingQuickActionsForSignificantScrolling:(BOOL)a3
{
}

- (BOOL)_hasExperiencedSignificantScrollingOnScrollView:(id)a3
{
  id v3 = a3;
  [v3 contentOffset];
  [v3 contentInset];

  return BSFloatGreaterThanFloat();
}

- (BOOL)isNotificationListSignificantlyScrolled
{
  uint64_t v2 = self;
  id v3 = [(CSCombinedListViewController *)self notificationListScrollView];
  LOBYTE(v2) = [(CSCombinedListViewController *)v2 _hasExperiencedSignificantScrollingOnScrollView:v3];

  return (char)v2;
}

- (BOOL)_notificationListExpandsVisibleRegionOnSignificantScroll
{
  return [(NCNotificationStructuredListViewController *)self->_structuredListViewController notificationListExpandsVisibleRegionOnSignificantScroll];
}

- (void)notificationStructuredListViewController:(id)a3 isPresentingLongLookForViewController:(id)a4
{
  id v12 = a4;
  BOOL v6 = v12 != 0;
  [(CSCombinedListViewController *)self _setDisableScrolling:v6];
  [(CSCombinedListViewController *)self _setDisableBackgroundAnimation:v6 forReason:@"Long Look"];
  [(CSCombinedListViewController *)self _setDismissGestureDisabled:v6 forReason:@"Long Look"];
  [(CSCombinedListViewController *)self _setHasUserInteraction:v6 forReason:@"NotificationLongLook"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
  id v8 = objc_loadWeakRetained((id *)&self->_platterHomeGestureManager);
  if (v12)
  {
    double v9 = [MEMORY[0x1E4FA5E78] sharedInstance];
    [v9 emitEvent:41];

    if (SBFEffectiveHomeButtonType() == 2)
    {
      int v10 = [v8 homeGestureContextForViewController:v12];
      if (v10)
      {
        [v12 setHomeGestureContext:v10];
        objc_storeStrong((id *)&self->_activePlatterHomeAffordanceOwningNotificationViewController, a4);
      }
      else
      {
        [WeakRetained registerHomeGestureParticipant:self withIdentifier:0];
      }
    }
  }
  else if (SBFEffectiveHomeButtonType() == 2)
  {
    if (self->_activePlatterHomeAffordanceOwningNotificationViewController)
    {
      objc_msgSend(v8, "unregisterHomeGestureContextForViewController:");
      activePlatterHomeAffordanceOwningNotificationViewController = self->_activePlatterHomeAffordanceOwningNotificationViewController;
      self->_activePlatterHomeAffordanceOwningNotificationViewController = 0;
    }
    else
    {
      [WeakRetained unregisterHomeGestureParticipant:self withIdentifier:0];
    }
  }
}

- (id)notificationStructuredListViewController:(id)a3 requestsSectionSettingsForSectionIdentifier:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CSCombinedListViewController *)self dispatcher];
  int v7 = [v6 destination:self settingsForSectionIdentifier:v5];

  return v7;
}

- (id)notificationStructuredListViewControllerRequestsSystemSettings:(id)a3
{
  BOOL v4 = [(CSCombinedListViewController *)self dispatcher];
  id v5 = [v4 notificationSystemSettingsForDestination:self];

  return v5;
}

- (void)notificationStructuredListViewController:(id)a3 requestsClearingNotificationRequestsInSections:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CSCombinedListViewController *)self dispatcher];
  [v6 destination:self clearNotificationRequestsInSections:v5];

  id v7 = [MEMORY[0x1E4FA5E78] sharedInstance];
  [v7 emitEvent:40];
}

- (void)notificationStructuredListViewController:(id)a3 requestsClearingNotificationRequests:(id)a4
{
  id v5 = a4;
  id v6 = [(CSCombinedListViewController *)self dispatcher];
  [v6 destination:self clearNotificationRequests:v5];
}

- (BOOL)notificationStructuredListViewController:(id)a3 shouldFilterNotificationRequest:(id)a4
{
  return [(CSCombinedListViewController *)self _shouldFilterNotificationRequest:a4];
}

- (void)notificationStructuredListViewController:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111__CSCombinedListViewController_notificationStructuredListViewController_requestsAuthenticationAndPerformBlock___block_invoke;
  v7[3] = &unk_1E6AD8B48;
  id v8 = v5;
  id v6 = v5;
  [(CSCombinedListViewController *)self _requestAuthenticationWithCompletion:v7];
}

uint64_t __111__CSCombinedListViewController_notificationStructuredListViewController_requestsAuthenticationAndPerformBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)notificationStructuredListViewController:(id)a3 shouldAllowInteractionsForNotificationRequest:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  int v5 = [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled];
  int v6 = [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport];
  int v7 = _AXSAttentionAwarenessFeaturesEnabled();
  if (v7) {
    char v8 = 1;
  }
  else {
    char v8 = v6 & v5;
  }
  double v9 = [MEMORY[0x1E4F42D90] mainScreen];
  int v10 = [v9 traitCollection];
  uint64_t v11 = [v10 forceTouchCapability];

  id v12 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v13 = @"off";
    if (v5) {
      CGFloat v13 = @"on";
    }
    BOOL v14 = @"noPearl";
    BOOL hasProximitySensor = self->_hasProximitySensor;
    if (v6) {
      BOOL v14 = @"hasPearl";
    }
    uint64_t v16 = @"attentionAware";
    int v24 = 138413314;
    BOOL v25 = v13;
    id v17 = @"forceTouch";
    if (!v7) {
      uint64_t v16 = @"noAttention";
    }
    if (v11 != 2) {
      id v17 = @"noForce";
    }
    __int16 v26 = 2112;
    int v27 = v14;
    __int16 v28 = 2112;
    double v29 = v16;
    __int16 v30 = 2112;
    long long v31 = v17;
    if (hasProximitySensor) {
      BOOL v18 = @"hasProx";
    }
    else {
      BOOL v18 = @"noProx";
    }
    __int16 v32 = 2112;
    long long v33 = v18;
    _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "shouldAllowInteractions biometric %@ - %@ - %@ - %@ - %@", (uint8_t *)&v24, 0x34u);
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      char v19 = 1;
    }
    else {
      char v19 = v8;
    }
    BOOL v20 = 1;
    if ((v19 & 1) == 0 && v11 != 2) {
      return self->_hasProximitySensor;
    }
  }
  else
  {
    int v21 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v21 userInterfaceIdiom] == 1) {
      char v22 = 1;
    }
    else {
      char v22 = v8;
    }
    BOOL v20 = 1;
    if ((v22 & 1) == 0 && v11 != 2) {
      BOOL v20 = self->_hasProximitySensor;
    }
  }
  return v20;
}

- (BOOL)notificationStructuredListViewControllerShouldAllowLongPressGesture:(id)a3
{
  int v4 = [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled];
  int v5 = [(SBUIBiometricResource *)self->_biometricResource hasPearlSupport] & v4;
  if (_AXSAttentionAwarenessFeaturesEnabled()) {
    char v6 = 1;
  }
  else {
    char v6 = v5;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      char v7 = 1;
    }
    else {
      char v7 = v6;
    }
    return (v7 & 1) != 0 || self->_hasProximitySensor;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v9 userInterfaceIdiom] == 1) {
      char v10 = 1;
    }
    else {
      char v10 = v6;
    }
    BOOL v8 = (v10 & 1) != 0 || self->_hasProximitySensor;
  }
  return v8;
}

- (BOOL)notificationStructuredListViewController:(id)a3 isClockNotificationRequest:(id)a4
{
  return [(CSCombinedListViewController *)self _isClockSnoozeAlarmNotificationRequest:a4];
}

- (id)legibilitySettingsForNotificationStructuredListViewController:(id)a3
{
  id v3 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  int v4 = [v3 legibilitySettings];

  return v4;
}

- (BOOL)notificationStructuredListViewControllerShouldHintForDefaultAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = [(SBUIBiometricResource *)self->_biometricResource hasBiometricAuthenticationCapabilityEnabled];
  int v4 = [MEMORY[0x1E4FA60C0] standardDefaults];
  int v5 = [v4 alwaysAllowDefaultAction];

  char v6 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    char v7 = @"notCape";
    if (v3) {
      char v7 = @"capable";
    }
    BOOL v8 = @"allowsDefault";
    if (!v5) {
      BOOL v8 = @"doesn'tForceDefault";
    }
    int v12 = 138412546;
    CGFloat v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "shouldHintForDefault hinting %@ - %@", (uint8_t *)&v12, 0x16u);
  }
  double v9 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 0;
  }
  else {
    return (v3 | v5) ^ 1;
  }
}

- (BOOL)notificationStructuredListViewControllerShouldAllowNotificationHistoryReveal:(id)a3
{
  BOOL v4 = [(CSCombinedListViewController *)self _allowNotificationsRevealPolicy];
  return v4 & ![(CSCombinedListViewController *)self _shouldPreventNotificationHistoryRevealForActiveDNDState];
}

- (void)notificationStructuredListViewControllerDidScrollToRevealNotificationHistory:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FA5E78], "sharedInstance", a3);
  [v4 emitEvent:39];

  self->_BOOL historyWasRevealed = 1;
}

- (void)notificationStructuredListViewController:(id)a3 requestsClearingFromIncomingSectionNotificationRequests:(id)a4
{
  id v5 = a4;
  id v7 = [(CSCombinedListViewController *)self dispatcher];
  char v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  [v7 destination:self clearNotificationRequestsFromIncomingSection:v6];
}

- (void)notificationStructuredListViewController:(id)a3 setAllowsNotifications:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSCombinedListViewController *)self dispatcher];
  [v8 destination:self setAllowsNotifications:v5 forSectionIdentifier:v7];
}

- (void)notificationStructuredListViewController:(id)a3 setDeliverQuietly:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSCombinedListViewController *)self dispatcher];
  [v8 destination:self setDeliverQuietly:v5 forSectionIdentifier:v7];
}

- (void)notificationStructuredListViewController:(id)a3 setMuted:(BOOL)a4 untilDate:(id)a5 forSectionIdentifier:(id)a6 threadIdentifier:(id)a7
{
  BOOL v9 = a4;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = [(CSCombinedListViewController *)self dispatcher];
  [v14 destination:self setMuted:v9 untilDate:v13 forSectionIdentifier:v12 threadIdentifier:v11];
}

- (void)notificationStructuredListViewController:(id)a3 setAllowsCriticalAlerts:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSCombinedListViewController *)self dispatcher];
  [v8 destination:self setAllowsCriticalAlerts:v5 forSectionIdentifier:v7];
}

- (void)notificationStructuredListViewController:(id)a3 setAllowsTimeSensitive:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSCombinedListViewController *)self dispatcher];
  [v8 destination:self setAllowsTimeSensitive:v5 forSectionIdentifier:v7];
}

- (void)notificationStructuredListViewController:(id)a3 setAllowsDirectMessages:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSCombinedListViewController *)self dispatcher];
  [v8 destination:self setAllowsDirectMessages:v5 forSectionIdentifier:v7];
}

- (void)notificationStructuredListViewController:(id)a3 setScheduledDelivery:(BOOL)a4 forSectionIdentifier:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSCombinedListViewController *)self dispatcher];
  [v8 destination:self setScheduledDelivery:v5 forSectionIdentifier:v7];
}

- (void)notificationStructuredListViewController:(id)a3 setSystemScheduledDeliveryEnabled:(BOOL)a4 scheduledDeliveryTimes:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = [(CSCombinedListViewController *)self dispatcher];
  [v8 destination:self setSystemScheduledDeliveryEnabled:v5 scheduledDeliveryTimes:v7];
}

- (void)notificationStructuredListViewController:(id)a3 setNotificationSystemSettings:(id)a4
{
  id v5 = a4;
  id v6 = [(CSCombinedListViewController *)self dispatcher];
  [v6 destination:self setNotificationSystemSettings:v5];
}

- (id)notificationStructuredListViewController:(id)a3 notificationRequestForUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(CSCombinedListViewController *)self dispatcher];
  id v7 = [v6 destination:self notificationRequestForUUID:v5];

  return v7;
}

- (id)notificationUsageTrackingStateForNotificationStructuredListViewController:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FB3858];
  uint64_t v6 = *MEMORY[0x1E4FB3898];
  v7[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (id)notificationStructuredListViewController:(id)a3 keyboardAssertionForGestureWindow:(id)a4
{
  id v5 = a4;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
    id v7 = [WeakRetained keyboardAssertionForGestureWindow:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)hideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
  BOOL v4 = [WeakRetained hideHomeAffordanceAnimationSettings];

  return v4;
}

- (id)unhideHomeAffordanceAnimationSettingsForNotificationStructuredListViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
  BOOL v4 = [WeakRetained unhideHomeAffordanceAnimationSettings];

  return v4;
}

- (id)settleHomeAffordanceAnimationBehaviorDescriptionForNotificationStructuredListViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
  BOOL v4 = [WeakRetained settleHomeAffordanceAnimationBehaviorDescription];

  return v4;
}

- (void)notificationStructuredListViewController:(id)a3 requestsPresentingDigestOnboardingSuggestionViewController:(id)a4
{
  id v9 = a3;
  uint64_t v6 = (UIViewController *)a4;
  if (self->_digestOnboardingSuggestionViewController != v6)
  {
    objc_storeStrong((id *)&self->_digestOnboardingSuggestionViewController, a4);
    [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController setDigestOnboardingSuggestionViewController:v6];
    if (self->_digestOnboardingSuggestionViewController)
    {
      id v7 = [MEMORY[0x1E4FA6B28] acquireContentProviderAssertionForType:1 slot:*MEMORY[0x1E4FA7040] identifier:*MEMORY[0x1E4FA6D10] errorHandler:0];
      digestOnboardingSuggestionViewControllerAssertion = self->_digestOnboardingSuggestionViewControllerAssertion;
      self->_digestOnboardingSuggestionViewControllerAssertion = v7;
    }
    else
    {
      [(SBSLockScreenContentAssertion *)self->_digestOnboardingSuggestionViewControllerAssertion invalidate];
      digestOnboardingSuggestionViewControllerAssertion = self->_digestOnboardingSuggestionViewControllerAssertion;
      self->_digestOnboardingSuggestionViewControllerAssertion = 0;
    }
  }
}

- (UIEdgeInsets)notificationStructuredListViewControllerRequestsEdgeInsetsForOverlayFooterView:(id)a3 forOrientation:(int64_t)a4
{
  id v6 = a3;
  if (!+[CSQuickActionsViewController deviceSupportsButtons])
  {
    [(CSCombinedListViewController *)self _listViewDefaultContentInsets];
    double v11 = v10;
    id v12 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v13 = [v12 userInterfaceIdiom];

    if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if ((unint64_t)(a4 - 3) >= 2) {
        double v14 = 80.0;
      }
      else {
        double v14 = 46.0;
      }
    }
    else
    {
      double v14 = 50.0;
    }
    double v16 = v14;
    goto LABEL_515;
  }
  int v7 = __sb__runningInSpringBoard();
  id v323 = v6;
  if (v7)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v8 = 0;
      int v9 = 0;
      goto LABEL_17;
    }
  }
  else
  {
    v286 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v286 userInterfaceIdiom] != 1)
    {
      int v8 = 0;
      int v9 = 1;
      goto LABEL_17;
    }
  }
  int v9 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v273 = [MEMORY[0x1E4F42D90] mainScreen];
      [v273 _referenceBounds];
    }
    int v8 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v42 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v41 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v321 = v15 ^ 1;
      int v322 = v9;
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      uint64_t v301 = 0;
      uint64_t v313 = 0;
      int v307 = 0;
      int v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, sizeof(v317));
      unint64_t v318 = 0;
      unint64_t v319 = 0;
      memset(v320, 0, sizeof(v320));
      os_log_t v38 = &qword_1D8505CC8;
      goto LABEL_74;
    }
  }
  else
  {
    int v8 = 0;
  }
LABEL_17:
  int v17 = __sb__runningInSpringBoard();
  int v321 = v8;
  int v322 = v9;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v18 = 0;
      int v19 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    v283 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v283 userInterfaceIdiom] != 1)
    {
      int v18 = 0;
      int v19 = 1;
      goto LABEL_26;
    }
  }
  int v19 = v17 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v272 = [MEMORY[0x1E4F42D90] mainScreen];
      [v272 _referenceBounds];
    }
    int v18 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      HIDWORD(v319) = v15 ^ 1;
      *(_DWORD *)v320 = v19;
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      uint64_t v301 = 0;
      uint64_t v313 = 0;
      int v307 = 0;
      int v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, sizeof(v317));
      *(void *)&v320[4] = 0;
      unint64_t v318 = 0;
      LODWORD(v319) = 0;
      os_log_t v38 = &qword_1D8505CF0;
      goto LABEL_74;
    }
  }
  else
  {
    int v18 = 0;
  }
LABEL_26:
  int v20 = __sb__runningInSpringBoard();
  HIDWORD(v319) = v18;
  *(_DWORD *)v320 = v19;
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v21 = 0;
      int v22 = 0;
      goto LABEL_35;
    }
  }
  else
  {
    v280 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v280 userInterfaceIdiom] != 1)
    {
      int v21 = 0;
      int v22 = 1;
      goto LABEL_35;
    }
  }
  int v22 = v20 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v271 = [MEMORY[0x1E4F42D90] mainScreen];
      [v271 _referenceBounds];
    }
    int v21 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v45 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      HIDWORD(v318) = v15 ^ 1;
      LODWORD(v319) = v22;
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      uint64_t v301 = 0;
      uint64_t v313 = 0;
      int v307 = 0;
      int v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, sizeof(v317));
      *(void *)&v320[4] = 0;
      LODWORD(v318) = 0;
      os_log_t v38 = &qword_1D8505CE0;
      goto LABEL_74;
    }
  }
  else
  {
    int v21 = 0;
  }
LABEL_35:
  int v23 = __sb__runningInSpringBoard();
  HIDWORD(v318) = v21;
  LODWORD(v319) = v22;
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v24 = 0;
      int v25 = 0;
      goto LABEL_44;
    }
  }
  else
  {
    v279 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v279 userInterfaceIdiom] != 1)
    {
      int v24 = 0;
      int v25 = 1;
      goto LABEL_44;
    }
  }
  int v25 = v23 ^ 1;
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v276 = [MEMORY[0x1E4F42D90] mainScreen];
    [v276 _referenceBounds];
  }
  int v24 = v15 ^ 1;
  BSSizeRoundForScale();
  if (v27 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    *(_DWORD *)&v317[64] = v15 ^ 1;
    LODWORD(v318) = v25;
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    uint64_t v313 = 0;
    int v307 = 0;
    int v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 64);
    *(void *)&v320[4] = 0;
    os_log_t v38 = &qword_1D8505CE8;
    goto LABEL_74;
  }
LABEL_44:
  int v28 = __sb__runningInSpringBoard();
  *(_DWORD *)&v317[64] = v24;
  LODWORD(v318) = v25;
  if (v28)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v320[4] = 0;
      goto LABEL_54;
    }
  }
  else
  {
    v278 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v278 userInterfaceIdiom] != 1)
    {
      *(void *)&v320[4] = 0x100000000;
      goto LABEL_54;
    }
  }
  *(_DWORD *)&v320[8] = v28 ^ 1;
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v274 = [MEMORY[0x1E4F42D90] mainScreen];
    [v274 _referenceBounds];
  }
  *(_DWORD *)&v320[4] = v15 ^ 1;
  BSSizeRoundForScale();
  if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    uint64_t v313 = 0;
    int v307 = 0;
    int v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 64);
    os_log_t v38 = &qword_1D8505CD8;
    goto LABEL_74;
  }
LABEL_54:
  int v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v317[56] = 0;
      goto LABEL_526;
    }
  }
  else
  {
    v277 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v277 userInterfaceIdiom] != 1)
    {
      *(void *)&v317[56] = 0x100000000;
      goto LABEL_526;
    }
  }
  *(_DWORD *)&v317[60] = v40 ^ 1;
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v270 = [MEMORY[0x1E4F42D90] mainScreen];
    [v270 _referenceBounds];
  }
  *(_DWORD *)&v317[56] = v15 ^ 1;
  BSSizeRoundForScale();
  if (v110 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    uint64_t v313 = 0;
    int v307 = 0;
    int v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 56);
    os_log_t v38 = &qword_1D8505CD0;
    goto LABEL_74;
  }
LABEL_526:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_528;
    }
LABEL_534:
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    uint64_t v313 = 0;
    int v307 = 0;
    int v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 52);
    os_log_t v38 = &qword_1D8505CC0;
    *(_DWORD *)&v317[52] = v15 ^ 1;
    goto LABEL_74;
  }
  v275 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v275 userInterfaceIdiom] == 1) {
    goto LABEL_534;
  }
LABEL_528:
  *(_DWORD *)&v317[52] = v15 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_532:
    *(void *)&v317[40] = 0;
    goto LABEL_572;
  }
  int v111 = __sb__runningInSpringBoard();
  if (v111)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_532;
    }
  }
  else
  {
    v268 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v268 userInterfaceIdiom])
    {
      *(void *)&v317[40] = 1;
      goto LABEL_572;
    }
  }
  *(_DWORD *)&v317[40] = v111 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v261 = [MEMORY[0x1E4F42D90] mainScreen];
      [v261 _referenceBounds];
    }
    *(_DWORD *)&v317[44] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v122 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      uint64_t v301 = 0;
      uint64_t v313 = 0;
      int v307 = 0;
      int v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, 40);
      *(_DWORD *)&v317[48] = 0;
      os_log_t v38 = &qword_1D8505CA0;
      goto LABEL_74;
    }
  }
  else
  {
    *(_DWORD *)&v317[44] = 0;
  }
LABEL_572:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[36] = 0;
      *(_DWORD *)&v317[48] = 0;
      goto LABEL_582;
    }
  }
  else
  {
    v269 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v269 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[36] = 0;
      *(_DWORD *)&v317[48] = 1;
      goto LABEL_582;
    }
  }
  *(_DWORD *)&v317[48] = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v264 = [MEMORY[0x1E4F42D90] mainScreen];
      [v264 _referenceBounds];
    }
    *(_DWORD *)&v317[36] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v116 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_586;
    }
  }
  else
  {
    *(_DWORD *)&v317[36] = 0;
  }
LABEL_582:
  if (_SBF_Private_IsD94Like())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    uint64_t v313 = 0;
    int v307 = 0;
    int v310 = 0;
    memset(v316, 0, sizeof(v316));
    memset(v317, 0, 36);
    os_log_t v38 = &qword_1D8505CA8;
    goto LABEL_74;
  }
LABEL_586:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_590:
    *(void *)&v317[28] = 0;
    goto LABEL_656;
  }
  int v117 = __sb__runningInSpringBoard();
  if (v117)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_590;
    }
  }
  else
  {
    v265 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v265 userInterfaceIdiom])
    {
      *(void *)&v317[28] = 0x100000000;
      goto LABEL_656;
    }
  }
  *(_DWORD *)&v317[32] = v117 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v256 = [MEMORY[0x1E4F42D90] mainScreen];
      [v256 _referenceBounds];
    }
    *(_DWORD *)&v317[28] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v137 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      uint64_t v301 = 0;
      uint64_t v313 = 0;
      int v307 = 0;
      int v310 = 0;
      memset(v316, 0, sizeof(v316));
      memset(v317, 0, 28);
      os_log_t v38 = &qword_1D8505CB0;
      goto LABEL_74;
    }
  }
  else
  {
    *(_DWORD *)&v317[28] = 0;
  }
LABEL_656:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[16] = 0;
      *(_DWORD *)&v317[24] = 0;
      goto LABEL_666;
    }
  }
  else
  {
    v267 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v267 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[16] = 0;
      *(_DWORD *)&v317[24] = 1;
      goto LABEL_666;
    }
  }
  *(_DWORD *)&v317[24] = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v260 = [MEMORY[0x1E4F42D90] mainScreen];
      [v260 _referenceBounds];
    }
    *(_DWORD *)&v317[16] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v125 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_670;
    }
  }
  else
  {
    *(_DWORD *)&v317[16] = 0;
  }
LABEL_666:
  if (_SBF_Private_IsD64Like())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    uint64_t v313 = 0;
    int v307 = 0;
    int v310 = 0;
    *(void *)&v317[4] = 0;
    memset(v316, 0, sizeof(v316));
    *(_DWORD *)v317 = 0;
    *(_DWORD *)&v317[12] = 0;
    *(_DWORD *)&v317[20] = 0;
    os_log_t v38 = &qword_1D8505CB8;
    goto LABEL_74;
  }
LABEL_670:
  int v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[12] = 0;
      *(_DWORD *)&v317[20] = 0;
      goto LABEL_680;
    }
  }
  else
  {
    v266 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v266 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[12] = 0;
      *(_DWORD *)&v317[20] = 1;
      goto LABEL_680;
    }
  }
  *(_DWORD *)&v317[20] = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v127 = __sb__runningInSpringBoard();
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v257 = [MEMORY[0x1E4F42D90] mainScreen];
      [v257 _referenceBounds];
    }
    uint64_t v15 = v127 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[12] = v15;
    if (v134 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      uint64_t v301 = 0;
      uint64_t v313 = 0;
      int v307 = 0;
      int v310 = 0;
      *(void *)&v317[4] = 0;
      memset(v316, 0, sizeof(v316));
      *(_DWORD *)v317 = 0;
      os_log_t v38 = &qword_1D8505C90;
      goto LABEL_74;
    }
  }
  else
  {
    *(_DWORD *)&v317[12] = 0;
  }
LABEL_680:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v316 = 0;
      *(_DWORD *)v317 = 0;
      goto LABEL_758;
    }
  }
  else
  {
    v263 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v263 userInterfaceIdiom])
    {
      *(_DWORD *)v316 = 0;
      *(_DWORD *)v317 = 1;
      goto LABEL_758;
    }
  }
  *(_DWORD *)v317 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v255 = [MEMORY[0x1E4F42D90] mainScreen];
      [v255 _referenceBounds];
    }
    *(_DWORD *)v316 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v140 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_792;
    }
  }
  else
  {
    *(_DWORD *)v316 = 0;
  }
LABEL_758:
  if (_SBF_Private_IsD54())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    uint64_t v313 = 0;
    int v307 = 0;
    int v310 = 0;
    *(void *)&v316[4] = 0;
    *(void *)&v317[4] = 0;
    os_log_t v38 = &qword_1D8505C98;
    goto LABEL_74;
  }
LABEL_792:
  int v141 = __sb__runningInSpringBoard();
  if (v141)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v317[4] = 0;
      goto LABEL_818;
    }
  }
  else
  {
    v262 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v262 userInterfaceIdiom])
    {
      *(void *)&v317[4] = 0x100000000;
      goto LABEL_818;
    }
  }
  *(_DWORD *)&v317[8] = v141 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v146 = __sb__runningInSpringBoard();
    if (v146)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    uint64_t v15 = v146 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[4] = v15;
    if (v149 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      uint64_t v301 = 0;
      uint64_t v313 = 0;
      int v307 = 0;
      int v310 = 0;
      *(void *)&v316[4] = 0;
      os_log_t v38 = &qword_1D8505C60;
      goto LABEL_74;
    }
  }
  else
  {
    *(_DWORD *)&v317[4] = 0;
  }
LABEL_818:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v316[4] = 0;
      goto LABEL_848;
    }
  }
  else
  {
    v259 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v259 userInterfaceIdiom])
    {
      *(void *)&v316[4] = 0x100000000;
      goto LABEL_848;
    }
  }
  *(_DWORD *)&v316[8] = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v251 = [MEMORY[0x1E4F42D90] mainScreen];
      [v251 _referenceBounds];
    }
    *(_DWORD *)&v316[4] = v15 ^ 1;
    BSSizeRoundForScale();
    if (v152 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_879;
    }
  }
  else
  {
    *(_DWORD *)&v316[4] = 0;
  }
LABEL_848:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    uint64_t v313 = 0;
    int v307 = 0;
    int v310 = 0;
    os_log_t v38 = &qword_1D8505C68;
    goto LABEL_74;
  }
LABEL_879:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_883:
    int v307 = 0;
    int v310 = 0;
    goto LABEL_908;
  }
  int v153 = __sb__runningInSpringBoard();
  if (v153)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_883;
    }
  }
  else
  {
    v254 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v254 userInterfaceIdiom])
    {
      int v307 = 0;
      int v310 = 1;
      goto LABEL_908;
    }
  }
  int v310 = v153 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v158 = __sb__runningInSpringBoard();
    if (v158)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v245 = [MEMORY[0x1E4F42D90] mainScreen];
      [v245 _referenceBounds];
    }
    uint64_t v15 = v158 ^ 1u;
    BSSizeRoundForScale();
    int v307 = v15;
    if (v173 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      uint64_t v301 = 0;
      uint64_t v313 = 0;
      os_log_t v38 = &qword_1D8505C50;
      goto LABEL_74;
    }
  }
  else
  {
    int v307 = 0;
  }
LABEL_908:
  int v159 = __sb__runningInSpringBoard();
  if (v159)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v15 = 0;
      HIDWORD(v313) = 0;
      goto LABEL_918;
    }
  }
  else
  {
    v258 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v258 userInterfaceIdiom])
    {
      uint64_t v15 = 0;
      HIDWORD(v313) = 1;
      goto LABEL_918;
    }
  }
  HIDWORD(v313) = v159 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v160 = __sb__runningInSpringBoard();
    if (v160)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v248 = [MEMORY[0x1E4F42D90] mainScreen];
      [v248 _referenceBounds];
    }
    uint64_t v15 = v160 ^ 1u;
    BSSizeRoundForScale();
    if (v161 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_922;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_918:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v313) = v15;
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    uint64_t v298 = 0;
    int v304 = 0;
    uint64_t v301 = 0;
    os_log_t v38 = &qword_1D8505C58;
    goto LABEL_74;
  }
LABEL_922:
  LODWORD(v313) = v15;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_926:
    uint64_t v301 = 0;
    goto LABEL_992;
  }
  int v162 = __sb__runningInSpringBoard();
  if (v162)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_926;
    }
  }
  else
  {
    v249 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v249 userInterfaceIdiom])
    {
      uint64_t v301 = 0x100000000;
      goto LABEL_992;
    }
  }
  HIDWORD(v301) = v162 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v241 = [MEMORY[0x1E4F42D90] mainScreen];
      [v241 _referenceBounds];
    }
    LODWORD(v301) = v15 ^ 1;
    BSSizeRoundForScale();
    if (v188 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      uint64_t v292 = 0;
      uint64_t v295 = 0;
      uint64_t v298 = 0;
      int v304 = 0;
      os_log_t v38 = &qword_1D8505C80;
      goto LABEL_74;
    }
  }
  else
  {
    LODWORD(v301) = 0;
  }
LABEL_992:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v298) = 0;
      int v304 = 0;
      goto LABEL_1002;
    }
  }
  else
  {
    v253 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v253 userInterfaceIdiom])
    {
      HIDWORD(v298) = 0;
      int v304 = 1;
      goto LABEL_1002;
    }
  }
  int v304 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v244 = [MEMORY[0x1E4F42D90] mainScreen];
      [v244 _referenceBounds];
    }
    HIDWORD(v298) = v15 ^ 1;
    BSSizeRoundForScale();
    if (v176 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1006;
    }
  }
  else
  {
    HIDWORD(v298) = 0;
  }
LABEL_1002:
  if (_SBF_Private_IsD63Like())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    uint64_t v292 = 0;
    uint64_t v295 = 0;
    LODWORD(v298) = 0;
    os_log_t v38 = &qword_1D8505C88;
    goto LABEL_74;
  }
LABEL_1006:
  int v177 = __sb__runningInSpringBoard();
  if (v177)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v292) = 0;
      LODWORD(v298) = 0;
      goto LABEL_1016;
    }
  }
  else
  {
    v250 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v250 userInterfaceIdiom])
    {
      LODWORD(v292) = 0;
      LODWORD(v298) = 1;
      goto LABEL_1016;
    }
  }
  LODWORD(v298) = v177 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v178 = __sb__runningInSpringBoard();
    if (v178)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v242 = [MEMORY[0x1E4F42D90] mainScreen];
      [v242 _referenceBounds];
    }
    uint64_t v15 = v178 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v292) = v15;
    if (v185 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      uint64_t v289 = 0;
      HIDWORD(v292) = 0;
      uint64_t v295 = 0;
      os_log_t v38 = &qword_1D8505C70;
      goto LABEL_74;
    }
  }
  else
  {
    LODWORD(v292) = 0;
  }
LABEL_1016:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v295 = 0;
      goto LABEL_1094;
    }
  }
  else
  {
    v247 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v247 userInterfaceIdiom])
    {
      uint64_t v295 = 0x100000000;
      goto LABEL_1094;
    }
  }
  HIDWORD(v295) = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v240 = [MEMORY[0x1E4F42D90] mainScreen];
      [v240 _referenceBounds];
    }
    LODWORD(v295) = v15 ^ 1;
    BSSizeRoundForScale();
    if (v191 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1128;
    }
  }
  else
  {
    LODWORD(v295) = 0;
  }
LABEL_1094:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    int v37 = 0;
    uint64_t v289 = 0;
    HIDWORD(v292) = 0;
    os_log_t v38 = &qword_1D8505C78;
    goto LABEL_74;
  }
LABEL_1128:
  int v192 = __sb__runningInSpringBoard();
  if (v192)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v289) = 0;
      HIDWORD(v292) = 0;
      goto LABEL_1154;
    }
  }
  else
  {
    v246 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v246 userInterfaceIdiom])
    {
      HIDWORD(v289) = 0;
      HIDWORD(v292) = 1;
      goto LABEL_1154;
    }
  }
  HIDWORD(v292) = v192 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v239 = [MEMORY[0x1E4F42D90] mainScreen];
      [v239 _referenceBounds];
    }
    HIDWORD(v289) = v15 ^ 1;
    BSSizeRoundForScale();
    if (v201 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      int v35 = 0;
      int v36 = 0;
      int v37 = 0;
      LODWORD(v289) = 0;
      os_log_t v38 = &qword_1D8505C40;
      goto LABEL_74;
    }
  }
  else
  {
    HIDWORD(v289) = 0;
  }
LABEL_1154:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v37 = 0;
      LODWORD(v289) = 0;
      goto LABEL_1184;
    }
  }
  else
  {
    v243 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v243 userInterfaceIdiom])
    {
      int v37 = 0;
      LODWORD(v289) = 1;
      goto LABEL_1184;
    }
  }
  LODWORD(v289) = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v238 = [MEMORY[0x1E4F42D90] mainScreen];
      [v238 _referenceBounds];
    }
    int v37 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v204 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1209;
    }
  }
  else
  {
    int v37 = 0;
  }
LABEL_1184:
  if (_SBF_Private_IsD53())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    os_log_t v38 = &qword_1D8505C48;
    goto LABEL_74;
  }
LABEL_1209:
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    os_log_t v38 = &qword_1D8505C20;
    goto LABEL_74;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    os_log_t v38 = &qword_1D8505C28;
    goto LABEL_74;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    os_log_t v38 = &qword_1D8505C10;
    goto LABEL_74;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v29 = 0;
    int v30 = 0;
    int v31 = 0;
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    int v35 = 0;
    int v36 = 0;
    os_log_t v38 = &qword_1D8505C18;
    goto LABEL_74;
  }
  int v207 = __sb__runningInSpringBoard();
  if (v207)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v35 = 0;
      int v36 = 0;
      goto LABEL_1265;
    }
  }
  else
  {
    v237 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v237 userInterfaceIdiom])
    {
      int v35 = 0;
      int v36 = 1;
      goto LABEL_1265;
    }
  }
  int v36 = v207 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v15 = __sb__runningInSpringBoard();
    if (v15)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v233 = [MEMORY[0x1E4F42D90] mainScreen];
      [v233 _referenceBounds];
    }
    int v35 = v15 ^ 1;
    BSSizeRoundForScale();
    if (v219 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      int v33 = 0;
      int v34 = 0;
      os_log_t v38 = &qword_1D8505C30;
      goto LABEL_74;
    }
  }
  else
  {
    int v35 = 0;
  }
LABEL_1265:
  uint64_t v15 = __sb__runningInSpringBoard();
  if (v15)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v33 = 0;
      int v34 = 0;
      goto LABEL_1295;
    }
  }
  else
  {
    v236 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v236 userInterfaceIdiom])
    {
      int v33 = 0;
      int v34 = 1;
      goto LABEL_1295;
    }
  }
  int v34 = v15 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v210 = __sb__runningInSpringBoard();
    if (v210)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v232 = [MEMORY[0x1E4F42D90] mainScreen];
      [v232 _referenceBounds];
    }
    int v33 = v210 ^ 1;
    BSSizeRoundForScale();
    if (v222 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v29 = 0;
      int v30 = 0;
      int v31 = 0;
      int v32 = 0;
      os_log_t v38 = &qword_1D8505C38;
      goto LABEL_74;
    }
  }
  else
  {
    int v33 = 0;
  }
LABEL_1295:
  int v211 = __sb__runningInSpringBoard();
  if (v211)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v31 = 0;
      int v32 = 0;
      goto LABEL_1325;
    }
  }
  else
  {
    v235 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v235 userInterfaceIdiom])
    {
      int v31 = 0;
      int v32 = 1;
      goto LABEL_1325;
    }
  }
  int v32 = v211 ^ 1;
  int v214 = __sb__runningInSpringBoard();
  if (v214)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v234 = [MEMORY[0x1E4F42D90] mainScreen];
    [v234 _referenceBounds];
  }
  int v31 = v214 ^ 1;
  BSSizeRoundForScale();
  if (v215 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v29 = 0;
    int v30 = 0;
    os_log_t v38 = &qword_1D8505C08;
    goto LABEL_74;
  }
LABEL_1325:
  int v216 = __sb__runningInSpringBoard();
  if (v216)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v29 = 0;
      int v30 = 0;
      goto LABEL_1376;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v15 userInterfaceIdiom])
    {
      int v29 = 0;
      int v30 = 1;
      goto LABEL_1376;
    }
  }
  int v30 = v216 ^ 1;
  int v225 = __sb__runningInSpringBoard();
  if (v225)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v231 = [MEMORY[0x1E4F42D90] mainScreen];
    [v231 _referenceBounds];
  }
  int v29 = v225 ^ 1;
  BSSizeRoundForScale();
  if (v226 >= *(double *)(MEMORY[0x1E4FA6E50] + 40))
  {
    os_log_t v38 = &qword_1D8505C00;
    goto LABEL_1378;
  }
LABEL_1376:
  os_log_t v38 = &CSQuickActionButtonDiameter;
LABEL_1378:
  __int16 v26 = v231;
LABEL_74:
  double v46 = *(double *)v38;
  if (v29)
  {

    if (!v30) {
      goto LABEL_76;
    }
  }
  else if (!v30)
  {
LABEL_76:
    if (!v31) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }

  if (v31) {
LABEL_77:
  }

LABEL_78:
  if (v32) {

  }
  if (v33) {
  if (v34)
  }

  if (v35) {
  if (v36)
  }

  uint64_t v47 = v319;
  if (v37) {

  }
  if (v289) {
  if (HIDWORD(v289))
  }

  if (HIDWORD(v292)) {
  if (v295)
  }

  if (HIDWORD(v295)) {
  if (v292)
  }

  if (v298) {
  if (HIDWORD(v298))
  }

  if (v304) {
  if (v301)
  }

  if (HIDWORD(v301)) {
  if (v313)
  }

  if (HIDWORD(v313)) {
  if (v307)
  }

  if (v310) {
  if (*(_DWORD *)&v316[4])
  }

  if (*(_DWORD *)&v316[8]) {
  if (*(_DWORD *)&v317[4])
  }

  if (*(_DWORD *)&v317[8]) {
  if (*(_DWORD *)v316)
  }

  if (*(_DWORD *)v317) {
  if (*(_DWORD *)&v317[12])
  }

  if (*(_DWORD *)&v317[20]) {
  if (*(_DWORD *)&v317[16])
  }

  if (*(_DWORD *)&v317[24]) {
  if (*(_DWORD *)&v317[28])
  }

  if (*(_DWORD *)&v317[32]) {
  if (*(_DWORD *)&v317[36])
  }

  if (*(_DWORD *)&v317[48]) {
  if (*(_DWORD *)&v317[44])
  }

  if (*(_DWORD *)&v317[40]) {
  if (*(_DWORD *)&v317[52])
  }

  if (*(_DWORD *)&v317[56]) {
  if (*(_DWORD *)&v317[60])
  }

  if (*(_DWORD *)&v320[4]) {
  if (*(_DWORD *)&v320[8])
  }
  {

    if (!*(_DWORD *)&v317[64]) {
      goto LABEL_162;
    }
  }
  else if (!*(_DWORD *)&v317[64])
  {
LABEL_162:
    if (v318) {
      goto LABEL_163;
    }
    goto LABEL_178;
  }

  if (v318)
  {
LABEL_163:

    if (!HIDWORD(v318)) {
      goto LABEL_164;
    }
    goto LABEL_179;
  }
LABEL_178:
  if (!HIDWORD(v318))
  {
LABEL_164:
    if (v319) {
      goto LABEL_165;
    }
    goto LABEL_180;
  }
LABEL_179:

  if (v319)
  {
LABEL_165:

    if (!HIDWORD(v319)) {
      goto LABEL_166;
    }
    goto LABEL_181;
  }
LABEL_180:
  if (!HIDWORD(v319))
  {
LABEL_166:
    if (*(_DWORD *)v320) {
      goto LABEL_167;
    }
    goto LABEL_182;
  }
LABEL_181:

  if (*(_DWORD *)v320)
  {
LABEL_167:

    if (!v321) {
      goto LABEL_168;
    }
    goto LABEL_183;
  }
LABEL_182:
  if (!v321)
  {
LABEL_168:
    if (!v322) {
      goto LABEL_170;
    }
    goto LABEL_169;
  }
LABEL_183:

  if (v322) {
LABEL_169:
  }

LABEL_170:
  int v48 = __sb__runningInSpringBoard();
  uint64_t v49 = (uint64_t)&CSQuickActionButtonInsetY;
  if (v48)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v50 = 0;
      int v51 = 0;
      goto LABEL_191;
    }
  }
  else
  {
    v278 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v278 userInterfaceIdiom] != 1)
    {
      int v51 = 0;
      uint64_t v50 = 1;
      goto LABEL_191;
    }
  }
  uint64_t v50 = v48 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v279 = [MEMORY[0x1E4F42D90] mainScreen];
      [v279 _referenceBounds];
    }
    int v51 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v73 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v72 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v321 = v52 ^ 1;
      int v322 = v50;
      memset(v320, 0, sizeof(v320));
      unint64_t v319 = 0;
      unint64_t v318 = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      int v311 = 0;
      int v308 = 0;
      uint64_t v314 = 0;
      uint64_t v299 = 0;
      uint64_t v302 = 0;
      int v305 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505EC8;
      goto LABEL_245;
    }
  }
  else
  {
    int v51 = 0;
  }
LABEL_191:
  int v53 = __sb__runningInSpringBoard();
  int v321 = v51;
  int v322 = v50;
  if (v53)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v54 = 0;
      uint64_t v47 = 0;
      goto LABEL_200;
    }
  }
  else
  {
    v277 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v277 userInterfaceIdiom] != 1)
    {
      uint64_t v47 = 0;
      int v54 = 1;
      goto LABEL_200;
    }
  }
  int v54 = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v269 = [MEMORY[0x1E4F42D90] mainScreen];
      [v269 _referenceBounds];
    }
    uint64_t v47 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      *(void *)v320 = __PAIR64__(v54, v47);
      unint64_t v319 = 0;
      unint64_t v318 = 0;
      *(_DWORD *)&v320[8] = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      int v311 = 0;
      int v308 = 0;
      uint64_t v314 = 0;
      uint64_t v299 = 0;
      uint64_t v302 = 0;
      int v305 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505EF0;
      goto LABEL_245;
    }
  }
  else
  {
    uint64_t v47 = 0;
  }
LABEL_200:
  int v55 = __sb__runningInSpringBoard();
  *(void *)v320 = __PAIR64__(v54, v47);
  if (v55)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v56 = 0;
      unsigned int v57 = 0;
      goto LABEL_209;
    }
  }
  else
  {
    v276 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v276 userInterfaceIdiom] != 1)
    {
      unsigned int v57 = 0;
      int v56 = 1;
      goto LABEL_209;
    }
  }
  int v56 = v55 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v268 = [MEMORY[0x1E4F42D90] mainScreen];
      [v268 _referenceBounds];
    }
    unsigned int v57 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v75 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v319) = v52 ^ 1;
      HIDWORD(v319) = v56;
      unint64_t v318 = 0;
      *(_DWORD *)&v320[8] = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      int v311 = 0;
      int v308 = 0;
      uint64_t v314 = 0;
      uint64_t v299 = 0;
      uint64_t v302 = 0;
      int v305 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505EE0;
      goto LABEL_245;
    }
  }
  else
  {
    unsigned int v57 = 0;
  }
LABEL_209:
  int v58 = __sb__runningInSpringBoard();
  unint64_t v319 = __PAIR64__(v56, v57);
  if (v58)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v59 = 0;
      unsigned int v60 = 0;
      goto LABEL_218;
    }
  }
  else
  {
    v275 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v275 userInterfaceIdiom] != 1)
    {
      unsigned int v60 = 0;
      int v59 = 1;
      goto LABEL_218;
    }
  }
  int v59 = v58 ^ 1;
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v272 = [MEMORY[0x1E4F42D90] mainScreen];
    [v272 _referenceBounds];
  }
  unsigned int v60 = v52 ^ 1;
  BSSizeRoundForScale();
  if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    LODWORD(v318) = v52 ^ 1;
    HIDWORD(v318) = v59;
    *(_DWORD *)&v320[8] = 0;
    memset(v317, 0, sizeof(v317));
    memset(v316, 0, sizeof(v316));
    int v311 = 0;
    int v308 = 0;
    uint64_t v314 = 0;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505EE8;
    goto LABEL_245;
  }
LABEL_218:
  int v62 = __sb__runningInSpringBoard();
  unint64_t v318 = __PAIR64__(v59, v60);
  if (v62)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v49 = 0;
      *(_DWORD *)&v320[8] = 0;
      goto LABEL_228;
    }
  }
  else
  {
    v274 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v274 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v320[8] = 0;
      uint64_t v49 = 1;
      goto LABEL_228;
    }
  }
  uint64_t v49 = v62 ^ 1u;
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v270 = [MEMORY[0x1E4F42D90] mainScreen];
    [v270 _referenceBounds];
  }
  *(_DWORD *)&v320[8] = v52 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    *(_DWORD *)&v317[64] = v49;
    memset(v317, 0, 64);
    memset(v316, 0, sizeof(v316));
    int v311 = 0;
    int v308 = 0;
    uint64_t v314 = 0;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505ED8;
    goto LABEL_245;
  }
LABEL_228:
  int v71 = __sb__runningInSpringBoard();
  *(_DWORD *)&v317[64] = v49;
  if (v71)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v317[56] = 0;
      goto LABEL_538;
    }
  }
  else
  {
    v273 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v273 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v317[56] = 0;
      *(_DWORD *)&v317[60] = 1;
      goto LABEL_538;
    }
  }
  *(_DWORD *)&v317[60] = v71 ^ 1;
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v267 = [MEMORY[0x1E4F42D90] mainScreen];
    [v267 _referenceBounds];
  }
  *(_DWORD *)&v317[56] = v52 ^ 1;
  BSSizeRoundForScale();
  if (v112 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v317, 0, 56);
    memset(v316, 0, sizeof(v316));
    int v311 = 0;
    int v308 = 0;
    uint64_t v314 = 0;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505ED0;
    goto LABEL_245;
  }
LABEL_538:
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_540;
    }
LABEL_546:
    memset(v317, 0, 52);
    memset(v316, 0, sizeof(v316));
    int v311 = 0;
    int v308 = 0;
    uint64_t v314 = 0;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505EC0;
    *(_DWORD *)&v317[52] = v52 ^ 1;
    goto LABEL_245;
  }
  v271 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v271 userInterfaceIdiom] == 1) {
    goto LABEL_546;
  }
LABEL_540:
  *(_DWORD *)&v317[52] = v52 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_544:
    *(void *)&v317[40] = 0;
    goto LABEL_597;
  }
  int v113 = __sb__runningInSpringBoard();
  if (v113)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_544;
    }
  }
  else
  {
    v265 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v265 userInterfaceIdiom])
    {
      *(void *)&v317[40] = 1;
      goto LABEL_597;
    }
  }
  *(_DWORD *)&v317[40] = v113 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v258 = [MEMORY[0x1E4F42D90] mainScreen];
      [v258 _referenceBounds];
    }
    *(_DWORD *)&v317[44] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v123 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      *(_DWORD *)&v317[48] = 0;
      memset(v317, 0, 40);
      memset(v316, 0, sizeof(v316));
      int v311 = 0;
      int v308 = 0;
      uint64_t v314 = 0;
      uint64_t v299 = 0;
      uint64_t v302 = 0;
      int v305 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505EA0;
      goto LABEL_245;
    }
  }
  else
  {
    *(_DWORD *)&v317[44] = 0;
  }
LABEL_597:
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[48] = 0;
      *(_DWORD *)&v317[36] = 0;
      goto LABEL_607;
    }
  }
  else
  {
    v266 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v266 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[36] = 0;
      *(_DWORD *)&v317[48] = 1;
      goto LABEL_607;
    }
  }
  *(_DWORD *)&v317[48] = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v261 = [MEMORY[0x1E4F42D90] mainScreen];
      [v261 _referenceBounds];
    }
    *(_DWORD *)&v317[36] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v118 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_611;
    }
  }
  else
  {
    *(_DWORD *)&v317[36] = 0;
  }
LABEL_607:
  if (_SBF_Private_IsD94Like())
  {
    memset(v317, 0, 36);
    memset(v316, 0, sizeof(v316));
    int v311 = 0;
    int v308 = 0;
    uint64_t v314 = 0;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505EA8;
    goto LABEL_245;
  }
LABEL_611:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_615:
    *(void *)&v317[28] = 0;
    goto LABEL_690;
  }
  int v119 = __sb__runningInSpringBoard();
  if (v119)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_615;
    }
  }
  else
  {
    v262 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v262 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[28] = 0;
      *(_DWORD *)&v317[32] = 1;
      goto LABEL_690;
    }
  }
  *(_DWORD *)&v317[32] = v119 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v253 = [MEMORY[0x1E4F42D90] mainScreen];
      [v253 _referenceBounds];
    }
    *(_DWORD *)&v317[28] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v138 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v317, 0, 28);
      memset(v316, 0, sizeof(v316));
      int v311 = 0;
      int v308 = 0;
      uint64_t v314 = 0;
      uint64_t v299 = 0;
      uint64_t v302 = 0;
      int v305 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505EB0;
      goto LABEL_245;
    }
  }
  else
  {
    *(_DWORD *)&v317[28] = 0;
  }
LABEL_690:
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[24] = 0;
      *(_DWORD *)&v317[16] = 0;
      goto LABEL_700;
    }
  }
  else
  {
    v264 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v264 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[16] = 0;
      *(_DWORD *)&v317[24] = 1;
      goto LABEL_700;
    }
  }
  *(_DWORD *)&v317[24] = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v257 = [MEMORY[0x1E4F42D90] mainScreen];
      [v257 _referenceBounds];
    }
    *(_DWORD *)&v317[16] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v128 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_704;
    }
  }
  else
  {
    *(_DWORD *)&v317[16] = 0;
  }
LABEL_700:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v317[20] = 0;
    *(void *)v317 = 0;
    *(void *)&v317[8] = 0;
    memset(v316, 0, sizeof(v316));
    int v311 = 0;
    int v308 = 0;
    uint64_t v314 = 0;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505EB8;
    goto LABEL_245;
  }
LABEL_704:
  int v129 = __sb__runningInSpringBoard();
  if (v129)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[20] = 0;
      *(_DWORD *)&v317[12] = 0;
      goto LABEL_714;
    }
  }
  else
  {
    v263 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v263 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[12] = 0;
      *(_DWORD *)&v317[20] = 1;
      goto LABEL_714;
    }
  }
  *(_DWORD *)&v317[20] = v129 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v130 = __sb__runningInSpringBoard();
    if (v130)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v254 = [MEMORY[0x1E4F42D90] mainScreen];
      [v254 _referenceBounds];
    }
    uint64_t v52 = v130 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[12] = v52;
    if (v135 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v317 = 0;
      memset(v316, 0, sizeof(v316));
      *(_DWORD *)&v317[8] = 0;
      int v311 = 0;
      int v308 = 0;
      uint64_t v314 = 0;
      uint64_t v299 = 0;
      uint64_t v302 = 0;
      int v305 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505E90;
      goto LABEL_245;
    }
  }
  else
  {
    *(_DWORD *)&v317[12] = 0;
  }
LABEL_714:
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v317 = 0;
      *(_DWORD *)v316 = 0;
      goto LABEL_764;
    }
  }
  else
  {
    v260 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v260 userInterfaceIdiom])
    {
      *(_DWORD *)v316 = 0;
      *(_DWORD *)v317 = 1;
      goto LABEL_764;
    }
  }
  *(_DWORD *)v317 = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    *(_DWORD *)v316 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v142 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_800;
    }
  }
  else
  {
    *(_DWORD *)v316 = 0;
  }
LABEL_764:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v317[4] = 0;
    *(void *)&v316[4] = 0;
    int v311 = 0;
    int v308 = 0;
    uint64_t v314 = 0;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E98;
    goto LABEL_245;
  }
LABEL_800:
  int v143 = __sb__runningInSpringBoard();
  if (v143)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v317[4] = 0;
      goto LABEL_828;
    }
  }
  else
  {
    v259 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v259 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[4] = 0;
      *(_DWORD *)&v317[8] = 1;
      goto LABEL_828;
    }
  }
  *(_DWORD *)&v317[8] = v143 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v147 = __sb__runningInSpringBoard();
    if (v147)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v249 = [MEMORY[0x1E4F42D90] mainScreen];
      [v249 _referenceBounds];
    }
    uint64_t v52 = v147 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[4] = v52;
    if (v150 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v316[4] = 0;
      int v311 = 0;
      int v308 = 0;
      uint64_t v314 = 0;
      uint64_t v299 = 0;
      uint64_t v302 = 0;
      int v305 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505E60;
      goto LABEL_245;
    }
  }
  else
  {
    *(_DWORD *)&v317[4] = 0;
  }
LABEL_828:
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v316[4] = 0;
      goto LABEL_855;
    }
  }
  else
  {
    v256 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v256 userInterfaceIdiom])
    {
      *(_DWORD *)&v316[4] = 0;
      *(_DWORD *)&v316[8] = 1;
      goto LABEL_855;
    }
  }
  *(_DWORD *)&v316[8] = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v248 = [MEMORY[0x1E4F42D90] mainScreen];
      [v248 _referenceBounds];
    }
    *(_DWORD *)&v316[4] = v52 ^ 1;
    BSSizeRoundForScale();
    if (v154 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_888;
    }
  }
  else
  {
    *(_DWORD *)&v316[4] = 0;
  }
LABEL_855:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v311 = 0;
    int v308 = 0;
    uint64_t v314 = 0;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E68;
    goto LABEL_245;
  }
LABEL_888:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_892:
    int v311 = 0;
    int v308 = 0;
    goto LABEL_933;
  }
  int v155 = __sb__runningInSpringBoard();
  if (v155)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_892;
    }
  }
  else
  {
    v251 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v251 userInterfaceIdiom])
    {
      int v308 = 0;
      int v311 = 1;
      goto LABEL_933;
    }
  }
  int v311 = v155 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v163 = __sb__runningInSpringBoard();
    if (v163)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v242 = [MEMORY[0x1E4F42D90] mainScreen];
      [v242 _referenceBounds];
    }
    uint64_t v52 = v163 ^ 1u;
    BSSizeRoundForScale();
    int v308 = v52;
    if (v174 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v314 = 0;
      uint64_t v299 = 0;
      uint64_t v302 = 0;
      int v305 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505E50;
      goto LABEL_245;
    }
  }
  else
  {
    int v308 = 0;
  }
LABEL_933:
  int v164 = __sb__runningInSpringBoard();
  if (v164)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v314) = 0;
      uint64_t v52 = 0;
      goto LABEL_943;
    }
  }
  else
  {
    v255 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v255 userInterfaceIdiom])
    {
      uint64_t v52 = 0;
      HIDWORD(v314) = 1;
      goto LABEL_943;
    }
  }
  HIDWORD(v314) = v164 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v165 = __sb__runningInSpringBoard();
    if (v165)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v245 = [MEMORY[0x1E4F42D90] mainScreen];
      [v245 _referenceBounds];
    }
    uint64_t v52 = v165 ^ 1u;
    BSSizeRoundForScale();
    if (v166 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_947;
    }
  }
  else
  {
    uint64_t v52 = 0;
  }
LABEL_943:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v314) = v52;
    uint64_t v299 = 0;
    uint64_t v302 = 0;
    int v305 = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E58;
    goto LABEL_245;
  }
LABEL_947:
  LODWORD(v314) = v52;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_951:
    uint64_t v302 = 0;
    goto LABEL_1026;
  }
  int v167 = __sb__runningInSpringBoard();
  if (v167)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_951;
    }
  }
  else
  {
    v246 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v246 userInterfaceIdiom])
    {
      uint64_t v302 = 0x100000000;
      goto LABEL_1026;
    }
  }
  HIDWORD(v302) = v167 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v238 = [MEMORY[0x1E4F42D90] mainScreen];
      [v238 _referenceBounds];
    }
    LODWORD(v302) = v52 ^ 1;
    BSSizeRoundForScale();
    if (v189 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v305 = 0;
      uint64_t v296 = 0;
      uint64_t v299 = 0;
      uint64_t v290 = 0;
      uint64_t v293 = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505E80;
      goto LABEL_245;
    }
  }
  else
  {
    LODWORD(v302) = 0;
  }
LABEL_1026:
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v305 = 0;
      HIDWORD(v299) = 0;
      goto LABEL_1036;
    }
  }
  else
  {
    v250 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v250 userInterfaceIdiom])
    {
      HIDWORD(v299) = 0;
      int v305 = 1;
      goto LABEL_1036;
    }
  }
  int v305 = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v241 = [MEMORY[0x1E4F42D90] mainScreen];
      [v241 _referenceBounds];
    }
    HIDWORD(v299) = v52 ^ 1;
    BSSizeRoundForScale();
    if (v179 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1040;
    }
  }
  else
  {
    HIDWORD(v299) = 0;
  }
LABEL_1036:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v299) = 0;
    uint64_t v290 = 0;
    uint64_t v293 = 0;
    uint64_t v296 = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E88;
    goto LABEL_245;
  }
LABEL_1040:
  int v180 = __sb__runningInSpringBoard();
  if (v180)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v299) = 0;
      HIDWORD(v290) = 0;
      goto LABEL_1050;
    }
  }
  else
  {
    v247 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v247 userInterfaceIdiom])
    {
      HIDWORD(v290) = 0;
      LODWORD(v299) = 1;
      goto LABEL_1050;
    }
  }
  LODWORD(v299) = v180 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v181 = __sb__runningInSpringBoard();
    if (v181)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v239 = [MEMORY[0x1E4F42D90] mainScreen];
      [v239 _referenceBounds];
    }
    uint64_t v52 = v181 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v290) = v52;
    if (v186 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v293 = 0;
      uint64_t v296 = 0;
      LODWORD(v290) = 0;
      int v287 = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505E70;
      goto LABEL_245;
    }
  }
  else
  {
    HIDWORD(v290) = 0;
  }
LABEL_1050:
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v296 = 0;
      goto LABEL_1100;
    }
  }
  else
  {
    v244 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v244 userInterfaceIdiom])
    {
      uint64_t v296 = 0x100000000;
      goto LABEL_1100;
    }
  }
  HIDWORD(v296) = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v237 = [MEMORY[0x1E4F42D90] mainScreen];
      [v237 _referenceBounds];
    }
    LODWORD(v296) = v52 ^ 1;
    BSSizeRoundForScale();
    if (v193 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1136;
    }
  }
  else
  {
    LODWORD(v296) = 0;
  }
LABEL_1100:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v293 = 0;
    LODWORD(v290) = 0;
    int v287 = 0;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E78;
    goto LABEL_245;
  }
LABEL_1136:
  int v194 = __sb__runningInSpringBoard();
  if (v194)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v293) = 0;
      LODWORD(v290) = 0;
      goto LABEL_1164;
    }
  }
  else
  {
    v243 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v243 userInterfaceIdiom])
    {
      LODWORD(v290) = 0;
      HIDWORD(v293) = 1;
      goto LABEL_1164;
    }
  }
  HIDWORD(v293) = v194 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v236 = [MEMORY[0x1E4F42D90] mainScreen];
      [v236 _referenceBounds];
    }
    LODWORD(v290) = v52 ^ 1;
    BSSizeRoundForScale();
    if (v202 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v287 = 0;
      LODWORD(v293) = 0;
      int v284 = 0;
      int v281 = 0;
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505E40;
      goto LABEL_245;
    }
  }
  else
  {
    LODWORD(v290) = 0;
  }
LABEL_1164:
  int v197 = __sb__runningInSpringBoard();
  if (v197)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v287 = 0;
      uint64_t v52 = 0;
      goto LABEL_1190;
    }
  }
  else
  {
    v240 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v240 userInterfaceIdiom])
    {
      uint64_t v52 = 0;
      int v287 = 1;
      goto LABEL_1190;
    }
  }
  int v287 = v197 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v199 = __sb__runningInSpringBoard();
    if (v199)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v235 = [MEMORY[0x1E4F42D90] mainScreen];
      [v235 _referenceBounds];
    }
    uint64_t v52 = v199 ^ 1u;
    BSSizeRoundForScale();
    if (v205 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1221;
    }
  }
  else
  {
    uint64_t v52 = 0;
  }
LABEL_1190:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v293) = v52;
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E48;
    goto LABEL_245;
  }
LABEL_1221:
  LODWORD(v293) = v52;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E20;
    goto LABEL_245;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E28;
    goto LABEL_245;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E10;
    goto LABEL_245;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v284 = 0;
    int v281 = 0;
    int v63 = 0;
    int v64 = 0;
    int v65 = 0;
    int v66 = 0;
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E18;
    goto LABEL_245;
  }
  int v208 = __sb__runningInSpringBoard();
  if (v208)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v284 = 0;
      int v281 = 0;
      goto LABEL_1275;
    }
  }
  else
  {
    v234 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v234 userInterfaceIdiom])
    {
      int v281 = 0;
      int v284 = 1;
      goto LABEL_1275;
    }
  }
  int v284 = v208 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v232 = [MEMORY[0x1E4F42D90] mainScreen];
      [v232 _referenceBounds];
    }
    int v281 = v52 ^ 1;
    BSSizeRoundForScale();
    if (v220 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v63 = 0;
      int v64 = 0;
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505E30;
      goto LABEL_245;
    }
  }
  else
  {
    int v281 = 0;
  }
LABEL_1275:
  uint64_t v52 = __sb__runningInSpringBoard();
  if (v52)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v63 = 0;
      int v64 = 0;
      goto LABEL_1305;
    }
  }
  else
  {
    v233 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v233 userInterfaceIdiom])
    {
      int v64 = 0;
      int v63 = 1;
      goto LABEL_1305;
    }
  }
  int v63 = v52 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v231 = [MEMORY[0x1E4F42D90] mainScreen];
      [v231 _referenceBounds];
    }
    int v64 = v50 ^ 1;
    BSSizeRoundForScale();
    if (v223 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v65 = 0;
      int v66 = 0;
      int v67 = 0;
      int v68 = 0;
      __int16 v69 = &qword_1D8505E38;
      goto LABEL_245;
    }
  }
  else
  {
    int v64 = 0;
  }
LABEL_1305:
  int v212 = __sb__runningInSpringBoard();
  if (v212)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v65 = 0;
      int v66 = 0;
      goto LABEL_1336;
    }
  }
  else
  {
    uint64_t v52 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v52 userInterfaceIdiom])
    {
      int v66 = 0;
      int v65 = 1;
      goto LABEL_1336;
    }
  }
  int v65 = v212 ^ 1;
  uint64_t v50 = __sb__runningInSpringBoard();
  if (v50)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v49 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v49 _referenceBounds];
  }
  int v66 = v50 ^ 1;
  BSSizeRoundForScale();
  if (v217 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v67 = 0;
    int v68 = 0;
    __int16 v69 = &qword_1D8505E08;
    goto LABEL_245;
  }
LABEL_1336:
  uint64_t v50 = __sb__runningInSpringBoard();
  if (v50)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v67 = 0;
      int v68 = 0;
LABEL_1383:
      __int16 v69 = &CSQuickActionButtonInsetY;
      goto LABEL_245;
    }
  }
  else
  {
    uint64_t v47 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v47 userInterfaceIdiom])
    {
      int v68 = 0;
      int v67 = 1;
      goto LABEL_1383;
    }
  }
  int v67 = v50 ^ 1;
  int v227 = __sb__runningInSpringBoard();
  if (v227)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v50 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v50 _referenceBounds];
  }
  int v68 = v227 ^ 1;
  BSSizeRoundForScale();
  if (v228 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_1383;
  }
  __int16 v69 = &qword_1D8505E00;
LABEL_245:
  double v16 = *(double *)v69;
  if (v68) {

  }
  if (v67) {
  if (v66)
  }

  uint64_t v76 = *(unsigned int *)v320;
  if (v65) {

  }
  if (v64) {
  if (v63)
  }

  if (v281) {
  if (v284)
  }

  if (v293) {
  if (v287)
  }

  if (v290) {
  if (HIDWORD(v293))
  }

  if (v296) {
  if (HIDWORD(v296))
  }

  if (HIDWORD(v290)) {
  if (v299)
  }

  if (HIDWORD(v299)) {
  if (v305)
  }

  if (v302) {
  if (HIDWORD(v302))
  }

  if (v314) {
  if (HIDWORD(v314))
  }

  if (v308) {
  if (v311)
  }

  if (*(_DWORD *)&v316[4]) {
  if (*(_DWORD *)&v316[8])
  }

  if (*(_DWORD *)&v317[4]) {
  if (*(_DWORD *)&v317[8])
  }

  if (*(_DWORD *)v316) {
  if (*(_DWORD *)v317)
  }

  if (*(_DWORD *)&v317[12]) {
  if (*(_DWORD *)&v317[20])
  }

  if (*(_DWORD *)&v317[16]) {
  if (*(_DWORD *)&v317[24])
  }

  if (*(_DWORD *)&v317[28]) {
  if (*(_DWORD *)&v317[32])
  }

  if (*(_DWORD *)&v317[36]) {
  if (*(_DWORD *)&v317[48])
  }

  if (*(_DWORD *)&v317[44]) {
  if (*(_DWORD *)&v317[40])
  }

  if (*(_DWORD *)&v317[52]) {
  if (*(_DWORD *)&v317[56])
  }

  if (*(_DWORD *)&v317[60]) {
  if (*(_DWORD *)&v320[8])
  }
  {

    if (!*(_DWORD *)&v317[64]) {
      goto LABEL_333;
    }
  }
  else if (!*(_DWORD *)&v317[64])
  {
LABEL_333:
    if (v318) {
      goto LABEL_334;
    }
    goto LABEL_344;
  }

  if (v318)
  {
LABEL_334:

    if (!HIDWORD(v318)) {
      goto LABEL_335;
    }
    goto LABEL_345;
  }
LABEL_344:
  if (!HIDWORD(v318))
  {
LABEL_335:
    if (v319) {
      goto LABEL_336;
    }
    goto LABEL_346;
  }
LABEL_345:

  if (v319)
  {
LABEL_336:

    if (!HIDWORD(v319)) {
      goto LABEL_337;
    }
    goto LABEL_347;
  }
LABEL_346:
  if (!HIDWORD(v319))
  {
LABEL_337:
    if (*(_DWORD *)v320) {
      goto LABEL_338;
    }
    goto LABEL_348;
  }
LABEL_347:

  if (*(_DWORD *)v320)
  {
LABEL_338:

    if (!*(_DWORD *)&v320[4]) {
      goto LABEL_339;
    }
    goto LABEL_349;
  }
LABEL_348:
  if (!*(_DWORD *)&v320[4])
  {
LABEL_339:
    if (v321) {
      goto LABEL_340;
    }
LABEL_350:
    if (!v322) {
      goto LABEL_352;
    }
    goto LABEL_351;
  }
LABEL_349:

  if (!v321) {
    goto LABEL_350;
  }
LABEL_340:

  if (v322) {
LABEL_351:
  }

LABEL_352:
  int v77 = __sb__runningInSpringBoard();
  uint64_t v78 = (uint64_t)&CSQuickActionButtonInsetX;
  if (v77)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v79 = 0;
      int v80 = 0;
      goto LABEL_361;
    }
  }
  else
  {
    v278 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v278 userInterfaceIdiom] != 1)
    {
      int v80 = 0;
      uint64_t v79 = 1;
      goto LABEL_361;
    }
  }
  uint64_t v79 = v77 ^ 1u;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v279 = [MEMORY[0x1E4F42D90] mainScreen];
      [v279 _referenceBounds];
    }
    int v80 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v102 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v101 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      int v321 = v81 ^ 1;
      int v322 = v79;
      memset(v320, 0, sizeof(v320));
      unint64_t v319 = 0;
      unint64_t v318 = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      int v312 = 0;
      int v309 = 0;
      uint64_t v315 = 0;
      uint64_t v300 = 0;
      uint64_t v303 = 0;
      int v306 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505DC8;
      goto LABEL_415;
    }
  }
  else
  {
    int v80 = 0;
  }
LABEL_361:
  int v82 = __sb__runningInSpringBoard();
  int v321 = v80;
  int v322 = v79;
  if (v82)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v83 = 0;
      uint64_t v76 = 0;
      goto LABEL_370;
    }
  }
  else
  {
    v277 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v277 userInterfaceIdiom] != 1)
    {
      uint64_t v76 = 0;
      int v83 = 1;
      goto LABEL_370;
    }
  }
  int v83 = v82 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v269 = [MEMORY[0x1E4F42D90] mainScreen];
      [v269 _referenceBounds];
    }
    uint64_t v76 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v103 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      *(void *)v320 = __PAIR64__(v83, v76);
      unint64_t v319 = 0;
      unint64_t v318 = 0;
      *(_DWORD *)&v320[8] = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      int v312 = 0;
      int v309 = 0;
      uint64_t v315 = 0;
      uint64_t v300 = 0;
      uint64_t v303 = 0;
      int v306 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505DF0;
      goto LABEL_415;
    }
  }
  else
  {
    uint64_t v76 = 0;
  }
LABEL_370:
  int v84 = __sb__runningInSpringBoard();
  *(void *)v320 = __PAIR64__(v83, v76);
  if (v84)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v85 = 0;
      unsigned int v86 = 0;
      goto LABEL_379;
    }
  }
  else
  {
    v276 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v276 userInterfaceIdiom] != 1)
    {
      unsigned int v86 = 0;
      int v85 = 1;
      goto LABEL_379;
    }
  }
  int v85 = v84 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v268 = [MEMORY[0x1E4F42D90] mainScreen];
      [v268 _referenceBounds];
    }
    unsigned int v86 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v104 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      LODWORD(v319) = v81 ^ 1;
      HIDWORD(v319) = v85;
      unint64_t v318 = 0;
      *(_DWORD *)&v320[8] = 0;
      memset(v317, 0, sizeof(v317));
      memset(v316, 0, sizeof(v316));
      int v312 = 0;
      int v309 = 0;
      uint64_t v315 = 0;
      uint64_t v300 = 0;
      uint64_t v303 = 0;
      int v306 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505DE0;
      goto LABEL_415;
    }
  }
  else
  {
    unsigned int v86 = 0;
  }
LABEL_379:
  int v87 = __sb__runningInSpringBoard();
  unint64_t v319 = __PAIR64__(v85, v86);
  if (v87)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v88 = 0;
      unsigned int v89 = 0;
      goto LABEL_388;
    }
  }
  else
  {
    v275 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v275 userInterfaceIdiom] != 1)
    {
      unsigned int v89 = 0;
      int v88 = 1;
      goto LABEL_388;
    }
  }
  int v88 = v87 ^ 1;
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v272 = [MEMORY[0x1E4F42D90] mainScreen];
    [v272 _referenceBounds];
  }
  unsigned int v89 = v81 ^ 1;
  BSSizeRoundForScale();
  if (v90 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    LODWORD(v318) = v81 ^ 1;
    HIDWORD(v318) = v88;
    *(_DWORD *)&v320[8] = 0;
    memset(v317, 0, sizeof(v317));
    memset(v316, 0, sizeof(v316));
    int v312 = 0;
    int v309 = 0;
    uint64_t v315 = 0;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505DE8;
    goto LABEL_415;
  }
LABEL_388:
  int v91 = __sb__runningInSpringBoard();
  unint64_t v318 = __PAIR64__(v88, v89);
  if (v91)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v78 = 0;
      *(_DWORD *)&v320[8] = 0;
      goto LABEL_398;
    }
  }
  else
  {
    v274 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v274 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v320[8] = 0;
      uint64_t v78 = 1;
      goto LABEL_398;
    }
  }
  uint64_t v78 = v91 ^ 1u;
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v270 = [MEMORY[0x1E4F42D90] mainScreen];
    [v270 _referenceBounds];
  }
  *(_DWORD *)&v320[8] = v81 ^ 1;
  BSSizeRoundForScale();
  if (v99 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    *(_DWORD *)&v317[64] = v78;
    memset(v317, 0, 64);
    memset(v316, 0, sizeof(v316));
    int v312 = 0;
    int v309 = 0;
    uint64_t v315 = 0;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505DD8;
    goto LABEL_415;
  }
LABEL_398:
  int v100 = __sb__runningInSpringBoard();
  *(_DWORD *)&v317[64] = v78;
  if (v100)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)&v317[56] = 0;
      goto LABEL_550;
    }
  }
  else
  {
    v273 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v273 userInterfaceIdiom] != 1)
    {
      *(_DWORD *)&v317[56] = 0;
      *(_DWORD *)&v317[60] = 1;
      goto LABEL_550;
    }
  }
  *(_DWORD *)&v317[60] = v100 ^ 1;
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v267 = [MEMORY[0x1E4F42D90] mainScreen];
    [v267 _referenceBounds];
  }
  *(_DWORD *)&v317[56] = v81 ^ 1;
  BSSizeRoundForScale();
  if (v114 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v317, 0, 56);
    memset(v316, 0, sizeof(v316));
    int v312 = 0;
    int v309 = 0;
    uint64_t v315 = 0;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505DD0;
    goto LABEL_415;
  }
LABEL_550:
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_552;
    }
LABEL_558:
    memset(v317, 0, 52);
    memset(v316, 0, sizeof(v316));
    int v312 = 0;
    int v309 = 0;
    uint64_t v315 = 0;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505DC0;
    *(_DWORD *)&v317[52] = v81 ^ 1;
    goto LABEL_415;
  }
  v271 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v271 userInterfaceIdiom] == 1) {
    goto LABEL_558;
  }
LABEL_552:
  *(_DWORD *)&v317[52] = v81 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_556:
    *(void *)&v317[40] = 0;
    goto LABEL_622;
  }
  int v115 = __sb__runningInSpringBoard();
  if (v115)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_556;
    }
  }
  else
  {
    v265 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v265 userInterfaceIdiom])
    {
      *(void *)&v317[40] = 1;
      goto LABEL_622;
    }
  }
  *(_DWORD *)&v317[40] = v115 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v258 = [MEMORY[0x1E4F42D90] mainScreen];
      [v258 _referenceBounds];
    }
    *(_DWORD *)&v317[44] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v124 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      *(_DWORD *)&v317[48] = 0;
      memset(v317, 0, 40);
      memset(v316, 0, sizeof(v316));
      int v312 = 0;
      int v309 = 0;
      uint64_t v315 = 0;
      uint64_t v300 = 0;
      uint64_t v303 = 0;
      int v306 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505DA0;
      goto LABEL_415;
    }
  }
  else
  {
    *(_DWORD *)&v317[44] = 0;
  }
LABEL_622:
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[48] = 0;
      *(_DWORD *)&v317[36] = 0;
      goto LABEL_632;
    }
  }
  else
  {
    v266 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v266 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[36] = 0;
      *(_DWORD *)&v317[48] = 1;
      goto LABEL_632;
    }
  }
  *(_DWORD *)&v317[48] = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v261 = [MEMORY[0x1E4F42D90] mainScreen];
      [v261 _referenceBounds];
    }
    *(_DWORD *)&v317[36] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v120 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_636;
    }
  }
  else
  {
    *(_DWORD *)&v317[36] = 0;
  }
LABEL_632:
  if (_SBF_Private_IsD94Like())
  {
    memset(v317, 0, 36);
    memset(v316, 0, sizeof(v316));
    int v312 = 0;
    int v309 = 0;
    uint64_t v315 = 0;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505DA8;
    goto LABEL_415;
  }
LABEL_636:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_640:
    *(void *)&v317[28] = 0;
    goto LABEL_724;
  }
  int v121 = __sb__runningInSpringBoard();
  if (v121)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_640;
    }
  }
  else
  {
    v262 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v262 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[28] = 0;
      *(_DWORD *)&v317[32] = 1;
      goto LABEL_724;
    }
  }
  *(_DWORD *)&v317[32] = v121 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v253 = [MEMORY[0x1E4F42D90] mainScreen];
      [v253 _referenceBounds];
    }
    *(_DWORD *)&v317[28] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v139 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v317, 0, 28);
      memset(v316, 0, sizeof(v316));
      int v312 = 0;
      int v309 = 0;
      uint64_t v315 = 0;
      uint64_t v300 = 0;
      uint64_t v303 = 0;
      int v306 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505DB0;
      goto LABEL_415;
    }
  }
  else
  {
    *(_DWORD *)&v317[28] = 0;
  }
LABEL_724:
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[24] = 0;
      *(_DWORD *)&v317[16] = 0;
      goto LABEL_734;
    }
  }
  else
  {
    v264 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v264 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[16] = 0;
      *(_DWORD *)&v317[24] = 1;
      goto LABEL_734;
    }
  }
  *(_DWORD *)&v317[24] = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v257 = [MEMORY[0x1E4F42D90] mainScreen];
      [v257 _referenceBounds];
    }
    *(_DWORD *)&v317[16] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v131 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_738;
    }
  }
  else
  {
    *(_DWORD *)&v317[16] = 0;
  }
LABEL_734:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v317[20] = 0;
    *(void *)v317 = 0;
    *(void *)&v317[8] = 0;
    memset(v316, 0, sizeof(v316));
    int v312 = 0;
    int v309 = 0;
    uint64_t v315 = 0;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505DB8;
    goto LABEL_415;
  }
LABEL_738:
  int v132 = __sb__runningInSpringBoard();
  if (v132)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v317[20] = 0;
      *(_DWORD *)&v317[12] = 0;
      goto LABEL_748;
    }
  }
  else
  {
    v263 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v263 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[12] = 0;
      *(_DWORD *)&v317[20] = 1;
      goto LABEL_748;
    }
  }
  *(_DWORD *)&v317[20] = v132 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v133 = __sb__runningInSpringBoard();
    if (v133)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v254 = [MEMORY[0x1E4F42D90] mainScreen];
      [v254 _referenceBounds];
    }
    uint64_t v81 = v133 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[12] = v81;
    if (v136 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v317 = 0;
      memset(v316, 0, sizeof(v316));
      *(_DWORD *)&v317[8] = 0;
      int v312 = 0;
      int v309 = 0;
      uint64_t v315 = 0;
      uint64_t v300 = 0;
      uint64_t v303 = 0;
      int v306 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505D90;
      goto LABEL_415;
    }
  }
  else
  {
    *(_DWORD *)&v317[12] = 0;
  }
LABEL_748:
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v317 = 0;
      *(_DWORD *)v316 = 0;
      goto LABEL_770;
    }
  }
  else
  {
    v260 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v260 userInterfaceIdiom])
    {
      *(_DWORD *)v316 = 0;
      *(_DWORD *)v317 = 1;
      goto LABEL_770;
    }
  }
  *(_DWORD *)v317 = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v252 = [MEMORY[0x1E4F42D90] mainScreen];
      [v252 _referenceBounds];
    }
    *(_DWORD *)v316 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v144 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_808;
    }
  }
  else
  {
    *(_DWORD *)v316 = 0;
  }
LABEL_770:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v317[4] = 0;
    *(void *)&v316[4] = 0;
    int v312 = 0;
    int v309 = 0;
    uint64_t v315 = 0;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D98;
    goto LABEL_415;
  }
LABEL_808:
  int v145 = __sb__runningInSpringBoard();
  if (v145)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v317[4] = 0;
      goto LABEL_838;
    }
  }
  else
  {
    v259 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v259 userInterfaceIdiom])
    {
      *(_DWORD *)&v317[4] = 0;
      *(_DWORD *)&v317[8] = 1;
      goto LABEL_838;
    }
  }
  *(_DWORD *)&v317[8] = v145 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v148 = __sb__runningInSpringBoard();
    if (v148)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v249 = [MEMORY[0x1E4F42D90] mainScreen];
      [v249 _referenceBounds];
    }
    uint64_t v81 = v148 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v317[4] = v81;
    if (v151 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(void *)&v316[4] = 0;
      int v312 = 0;
      int v309 = 0;
      uint64_t v315 = 0;
      uint64_t v300 = 0;
      uint64_t v303 = 0;
      int v306 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505D60;
      goto LABEL_415;
    }
  }
  else
  {
    *(_DWORD *)&v317[4] = 0;
  }
LABEL_838:
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v316[4] = 0;
      goto LABEL_862;
    }
  }
  else
  {
    v256 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v256 userInterfaceIdiom])
    {
      *(_DWORD *)&v316[4] = 0;
      *(_DWORD *)&v316[8] = 1;
      goto LABEL_862;
    }
  }
  *(_DWORD *)&v316[8] = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v248 = [MEMORY[0x1E4F42D90] mainScreen];
      [v248 _referenceBounds];
    }
    *(_DWORD *)&v316[4] = v81 ^ 1;
    BSSizeRoundForScale();
    if (v156 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_897;
    }
  }
  else
  {
    *(_DWORD *)&v316[4] = 0;
  }
LABEL_862:
  if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    int v312 = 0;
    int v309 = 0;
    uint64_t v315 = 0;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D68;
    goto LABEL_415;
  }
LABEL_897:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_901:
    int v312 = 0;
    int v309 = 0;
    goto LABEL_958;
  }
  int v157 = __sb__runningInSpringBoard();
  if (v157)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_901;
    }
  }
  else
  {
    v251 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v251 userInterfaceIdiom])
    {
      int v309 = 0;
      int v312 = 1;
      goto LABEL_958;
    }
  }
  int v312 = v157 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v168 = __sb__runningInSpringBoard();
    if (v168)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v242 = [MEMORY[0x1E4F42D90] mainScreen];
      [v242 _referenceBounds];
    }
    uint64_t v81 = v168 ^ 1u;
    BSSizeRoundForScale();
    int v309 = v81;
    if (v175 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      uint64_t v315 = 0;
      uint64_t v300 = 0;
      uint64_t v303 = 0;
      int v306 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505D50;
      goto LABEL_415;
    }
  }
  else
  {
    int v309 = 0;
  }
LABEL_958:
  int v169 = __sb__runningInSpringBoard();
  if (v169)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v315) = 0;
      uint64_t v81 = 0;
      goto LABEL_968;
    }
  }
  else
  {
    v255 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v255 userInterfaceIdiom])
    {
      uint64_t v81 = 0;
      HIDWORD(v315) = 1;
      goto LABEL_968;
    }
  }
  HIDWORD(v315) = v169 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v170 = __sb__runningInSpringBoard();
    if (v170)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v245 = [MEMORY[0x1E4F42D90] mainScreen];
      [v245 _referenceBounds];
    }
    uint64_t v81 = v170 ^ 1u;
    BSSizeRoundForScale();
    if (v171 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_972;
    }
  }
  else
  {
    uint64_t v81 = 0;
  }
LABEL_968:
  if (_SBF_Private_IsD93Like())
  {
    LODWORD(v315) = v81;
    uint64_t v300 = 0;
    uint64_t v303 = 0;
    int v306 = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D58;
    goto LABEL_415;
  }
LABEL_972:
  LODWORD(v315) = v81;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_976:
    uint64_t v303 = 0;
    goto LABEL_1060;
  }
  int v172 = __sb__runningInSpringBoard();
  if (v172)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_976;
    }
  }
  else
  {
    v246 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v246 userInterfaceIdiom])
    {
      uint64_t v303 = 0x100000000;
      goto LABEL_1060;
    }
  }
  HIDWORD(v303) = v172 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v238 = [MEMORY[0x1E4F42D90] mainScreen];
      [v238 _referenceBounds];
    }
    LODWORD(v303) = v81 ^ 1;
    BSSizeRoundForScale();
    if (v190 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v306 = 0;
      uint64_t v297 = 0;
      uint64_t v300 = 0;
      uint64_t v291 = 0;
      uint64_t v294 = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505D80;
      goto LABEL_415;
    }
  }
  else
  {
    LODWORD(v303) = 0;
  }
LABEL_1060:
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v306 = 0;
      HIDWORD(v300) = 0;
      goto LABEL_1070;
    }
  }
  else
  {
    v250 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v250 userInterfaceIdiom])
    {
      HIDWORD(v300) = 0;
      int v306 = 1;
      goto LABEL_1070;
    }
  }
  int v306 = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v241 = [MEMORY[0x1E4F42D90] mainScreen];
      [v241 _referenceBounds];
    }
    HIDWORD(v300) = v81 ^ 1;
    BSSizeRoundForScale();
    if (v182 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1074;
    }
  }
  else
  {
    HIDWORD(v300) = 0;
  }
LABEL_1070:
  if (_SBF_Private_IsD63Like())
  {
    LODWORD(v300) = 0;
    uint64_t v291 = 0;
    uint64_t v294 = 0;
    uint64_t v297 = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D88;
    goto LABEL_415;
  }
LABEL_1074:
  int v183 = __sb__runningInSpringBoard();
  if (v183)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v300) = 0;
      HIDWORD(v291) = 0;
      goto LABEL_1084;
    }
  }
  else
  {
    v247 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v247 userInterfaceIdiom])
    {
      HIDWORD(v291) = 0;
      LODWORD(v300) = 1;
      goto LABEL_1084;
    }
  }
  LODWORD(v300) = v183 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v184 = __sb__runningInSpringBoard();
    if (v184)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v239 = [MEMORY[0x1E4F42D90] mainScreen];
      [v239 _referenceBounds];
    }
    uint64_t v81 = v184 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v291) = v81;
    if (v187 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      uint64_t v294 = 0;
      uint64_t v297 = 0;
      LODWORD(v291) = 0;
      int v288 = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505D70;
      goto LABEL_415;
    }
  }
  else
  {
    HIDWORD(v291) = 0;
  }
LABEL_1084:
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      uint64_t v297 = 0;
      goto LABEL_1106;
    }
  }
  else
  {
    v244 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v244 userInterfaceIdiom])
    {
      uint64_t v297 = 0x100000000;
      goto LABEL_1106;
    }
  }
  HIDWORD(v297) = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v237 = [MEMORY[0x1E4F42D90] mainScreen];
      [v237 _referenceBounds];
    }
    LODWORD(v297) = v81 ^ 1;
    BSSizeRoundForScale();
    if (v195 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_1144;
    }
  }
  else
  {
    LODWORD(v297) = 0;
  }
LABEL_1106:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    uint64_t v294 = 0;
    LODWORD(v291) = 0;
    int v288 = 0;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D78;
    goto LABEL_415;
  }
LABEL_1144:
  int v196 = __sb__runningInSpringBoard();
  if (v196)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v294) = 0;
      LODWORD(v291) = 0;
      goto LABEL_1174;
    }
  }
  else
  {
    v243 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v243 userInterfaceIdiom])
    {
      LODWORD(v291) = 0;
      HIDWORD(v294) = 1;
      goto LABEL_1174;
    }
  }
  HIDWORD(v294) = v196 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v236 = [MEMORY[0x1E4F42D90] mainScreen];
      [v236 _referenceBounds];
    }
    LODWORD(v291) = v81 ^ 1;
    BSSizeRoundForScale();
    if (v203 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v288 = 0;
      LODWORD(v294) = 0;
      int v285 = 0;
      int v282 = 0;
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505D40;
      goto LABEL_415;
    }
  }
  else
  {
    LODWORD(v291) = 0;
  }
LABEL_1174:
  int v198 = __sb__runningInSpringBoard();
  if (v198)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v288 = 0;
      uint64_t v81 = 0;
      goto LABEL_1196;
    }
  }
  else
  {
    v240 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v240 userInterfaceIdiom])
    {
      uint64_t v81 = 0;
      int v288 = 1;
      goto LABEL_1196;
    }
  }
  int v288 = v198 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v200 = __sb__runningInSpringBoard();
    if (v200)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v235 = [MEMORY[0x1E4F42D90] mainScreen];
      [v235 _referenceBounds];
    }
    uint64_t v81 = v200 ^ 1u;
    BSSizeRoundForScale();
    if (v206 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_1233;
    }
  }
  else
  {
    uint64_t v81 = 0;
  }
LABEL_1196:
  if (_SBF_Private_IsD53())
  {
    LODWORD(v294) = v81;
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D48;
    goto LABEL_415;
  }
LABEL_1233:
  LODWORD(v294) = v81;
  if _SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D20;
    goto LABEL_415;
  }
  if _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16())
  {
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D28;
    goto LABEL_415;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D10;
    goto LABEL_415;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v285 = 0;
    int v282 = 0;
    int v92 = 0;
    int v93 = 0;
    int v94 = 0;
    int v95 = 0;
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D18;
    goto LABEL_415;
  }
  int v209 = __sb__runningInSpringBoard();
  if (v209)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v285 = 0;
      int v282 = 0;
      goto LABEL_1285;
    }
  }
  else
  {
    v234 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v234 userInterfaceIdiom])
    {
      int v282 = 0;
      int v285 = 1;
      goto LABEL_1285;
    }
  }
  int v285 = v209 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v81 = __sb__runningInSpringBoard();
    if (v81)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v232 = [MEMORY[0x1E4F42D90] mainScreen];
      [v232 _referenceBounds];
    }
    int v282 = v81 ^ 1;
    BSSizeRoundForScale();
    if (v221 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v92 = 0;
      int v93 = 0;
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505D30;
      goto LABEL_415;
    }
  }
  else
  {
    int v282 = 0;
  }
LABEL_1285:
  uint64_t v81 = __sb__runningInSpringBoard();
  if (v81)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v92 = 0;
      int v93 = 0;
      goto LABEL_1315;
    }
  }
  else
  {
    v233 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v233 userInterfaceIdiom])
    {
      int v93 = 0;
      int v92 = 1;
      goto LABEL_1315;
    }
  }
  int v92 = v81 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v79 = __sb__runningInSpringBoard();
    if (v79)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v231 = [MEMORY[0x1E4F42D90] mainScreen];
      [v231 _referenceBounds];
    }
    int v93 = v79 ^ 1;
    BSSizeRoundForScale();
    if (v224 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v94 = 0;
      int v95 = 0;
      int v96 = 0;
      int v97 = 0;
      v98 = &qword_1D8505D38;
      goto LABEL_415;
    }
  }
  else
  {
    int v93 = 0;
  }
LABEL_1315:
  int v213 = __sb__runningInSpringBoard();
  if (v213)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v94 = 0;
      int v95 = 0;
      goto LABEL_1347;
    }
  }
  else
  {
    uint64_t v81 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v81 userInterfaceIdiom])
    {
      int v95 = 0;
      int v94 = 1;
      goto LABEL_1347;
    }
  }
  int v94 = v213 ^ 1;
  uint64_t v79 = __sb__runningInSpringBoard();
  if (v79)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v78 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v78 _referenceBounds];
  }
  int v95 = v79 ^ 1;
  BSSizeRoundForScale();
  if (v218 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v96 = 0;
    int v97 = 0;
    v98 = &qword_1D8505D08;
    goto LABEL_415;
  }
LABEL_1347:
  uint64_t v79 = __sb__runningInSpringBoard();
  if (v79)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v96 = 0;
      int v97 = 0;
LABEL_1389:
      v98 = &CSQuickActionButtonInsetX;
      goto LABEL_415;
    }
  }
  else
  {
    uint64_t v76 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v76 userInterfaceIdiom])
    {
      int v97 = 0;
      int v96 = 1;
      goto LABEL_1389;
    }
  }
  int v96 = v79 ^ 1;
  int v229 = __sb__runningInSpringBoard();
  if (v229)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v79 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v79 _referenceBounds];
  }
  int v97 = v229 ^ 1;
  BSSizeRoundForScale();
  if (v230 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_1389;
  }
  v98 = &qword_1D8505D00;
LABEL_415:
  double v105 = *(double *)v98;
  if (v97) {

  }
  if (v96) {
  id v6 = v323;
  }
  if (v95) {

  }
  if (v94) {
  if (v93)
  }

  if (v92) {
  if (v282)
  }

  if (v285) {
  if (v294)
  }

  if (v288) {
  if (v291)
  }

  if (HIDWORD(v294)) {
  if (v297)
  }

  if (HIDWORD(v297)) {
  if (HIDWORD(v291))
  }

  if (v300) {
  if (HIDWORD(v300))
  }

  if (v306) {
  if (v303)
  }

  if (HIDWORD(v303)) {
  if (v315)
  }

  if (HIDWORD(v315)) {
  if (v309)
  }

  if (v312) {
  if (*(_DWORD *)&v316[4])
  }

  if (*(_DWORD *)&v316[8]) {
  if (*(_DWORD *)&v317[4])
  }

  if (*(_DWORD *)&v317[8]) {
  if (*(_DWORD *)v316)
  }

  if (*(_DWORD *)v317) {
  if (*(_DWORD *)&v317[12])
  }

  if (*(_DWORD *)&v317[20]) {
  if (*(_DWORD *)&v317[16])
  }

  if (*(_DWORD *)&v317[24]) {
  if (*(_DWORD *)&v317[28])
  }

  if (*(_DWORD *)&v317[32]) {
  if (*(_DWORD *)&v317[36])
  }

  if (*(_DWORD *)&v317[48]) {
  if (*(_DWORD *)&v317[44])
  }

  if (*(_DWORD *)&v317[40]) {
  if (*(_DWORD *)&v317[52])
  }

  if (*(_DWORD *)&v317[56]) {
  if (*(_DWORD *)&v317[60])
  }

  if (*(_DWORD *)&v320[8])
  {

    if (!*(_DWORD *)&v317[64]) {
      goto LABEL_503;
    }
  }
  else if (!*(_DWORD *)&v317[64])
  {
LABEL_503:
    if (v318) {
      goto LABEL_504;
    }
    goto LABEL_518;
  }

  if (v318)
  {
LABEL_504:

    if (!HIDWORD(v318)) {
      goto LABEL_505;
    }
    goto LABEL_519;
  }
LABEL_518:
  if (!HIDWORD(v318))
  {
LABEL_505:
    if (v319) {
      goto LABEL_506;
    }
    goto LABEL_520;
  }
LABEL_519:

  if (v319)
  {
LABEL_506:

    if (!HIDWORD(v319)) {
      goto LABEL_507;
    }
LABEL_521:

    if (!*(_DWORD *)v320) {
      goto LABEL_509;
    }
    goto LABEL_508;
  }
LABEL_520:
  if (HIDWORD(v319)) {
    goto LABEL_521;
  }
LABEL_507:
  if (*(_DWORD *)v320) {
LABEL_508:
  }

LABEL_509:
  if (*(_DWORD *)&v320[4]) {

  }
  if (v321) {
  double v14 = v46 + v16;
  }
  double v11 = v46 + v105;
  if (v322) {

  }
LABEL_515:
  double v106 = v14;
  double v107 = v11;
  double v108 = v16;
  double v109 = v11;
  result.right = v109;
  result.bottom = v108;
  result.left = v107;
  result.top = v106;
  return result;
}

- (void)notificationStructuredListViewController:(id)a3 didUpdateOverlayFooterContentVisibility:(BOOL)a4
{
}

- (void)notificationStructuredListViewController:(id)a3 requestsPresentingFocusActivityPickerFromView:(id)a4
{
  id v5 = a4;
  id v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
    -[CSCombinedListViewController notificationStructuredListViewController:requestsPresentingFocusActivityPickerFromView:](v6);
  }
  int v7 = [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController focusActivityManager];
  int v8 = [(CSCombinedListViewController *)self coverSheetViewPresenting];
  [v7 presentFocusActivityPickerViewControllerFromView:v5 coverSheetViewPresenting:v8];
}

- (void)notificationStructuredListViewController:(id)a3 requestsClearingSupplementaryViewControllers:(id)a4
{
}

- (void)notificationStructuredListViewController:(id)a3 requestsCancelTouches:(BOOL)a4 onSupplementaryViewController:(id)a5
{
}

- (void)structuredListContentChanged:(BOOL)a3
{
  BOOL v5 = [(CSCombinedListViewController *)self hasContent];
  if (a3
    || [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController isPresentingTransientContent])
  {
    uint64_t v6 = 1;
LABEL_4:
    [(CSCombinedListViewController *)self _setListHasContent:v6];
    goto LABEL_5;
  }
  uint64_t v6 = 0;
  if (!self->_listDismissingContent) {
    goto LABEL_4;
  }
LABEL_5:
  [(CSCombinedListViewController *)self _noteListContentsPotentiallyChangedAfterTransitionFrom:v5 to:v6];

  [(CSCombinedListViewController *)self _publishVisibleNotificationCountOnContentChange];
}

- (void)homeGestureParticipantOwningHomeGestureDidChange:(id)a3 ownsHomeGesture:(BOOL)a4
{
  if (a4)
  {
    BOOL v5 = SBFEffectiveHomeButtonType() == 2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);
    id v7 = [WeakRetained screenEdgePanGesture];
  }
  else
  {
    id v7 = 0;
    BOOL v5 = 0;
  }
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController setHomeAffordanceVisible:v5];
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController setHomeAffordancePanGesture:v7];
}

- (void)didReceiveRaiseGesture
{
  id v2 = a1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D839D000, v5, v6, "%{public}@ received raise gesture", v7, v8, v9, v10, v11);
}

- (int64_t)presentationType
{
  return 1;
}

- (int64_t)presentationPriority
{
  return 4;
}

- (int64_t)presentationTransition
{
  return 1;
}

- (void)coverSheetViewControllerWillPresentPosterSwitcher:(id)a3
{
  id v3 = [(CSCombinedListViewController *)self supplementaryItemManager];
  [v3 willPresentPosterSwitcher];
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CSCombinedListViewController;
  if ([(CSCoverSheetViewControllerBase *)&v23 handleEvent:v4]) {
    char v5 = [v4 isConsumable];
  }
  else {
    char v5 = 0;
  }
  if (([v4 isConsumable] & 1) == 0) {
    [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController handleEvent:v4];
  }
  if ((v5 & 1) == 0)
  {
    char v6 = 0;
    switch([v4 type])
    {
      case 1:
        double v14 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
        uint64_t v15 = [v14 legibilitySettings];

        [(CSCombinedListViewController *)self updateForLegibilitySettings:v15];
        goto LABEL_35;
      case 5:
        char v6 = 0;
        self->_BOOL coverSheetWasDismissed = 1;
        goto LABEL_36;
      case 6:
        [(NCNotificationStructuredListViewController *)self->_structuredListViewController dismissModalFullScreenAnimated:0];
        goto LABEL_35;
      case 9:
        char v6 = 0;
        self->_homeButtonPressDetected = 0;
        self->_lockButtonPressDetected = 0;
        self->_liftDetected = 0;
        uint64_t v16 = 1357;
        goto LABEL_40;
      case 10:
        self->_coverSheetResignedActive = 1;
        goto LABEL_25;
      case 11:
        self->_coverSheetResignedActive = 0;
LABEL_25:
        [(CSCombinedListViewController *)self _updateFaceDetectMonitoring];
        goto LABEL_35;
      case 12:
      case 22:
        [(CSCombinedListViewController *)self _dismissDNDBedtimeGreetingViewAnimated:1];
        goto LABEL_35;
      case 13:
        int v17 = [v4 value];
        uint64_t v18 = [v17 BOOLValue];

        [(NCNotificationStructuredListViewController *)self->_structuredListViewController setDeviceAuthenticated:v18];
        if ((v18 & 1) == 0
          && ![(CSCombinedListViewController *)self _allowNotificationsRevealPolicy])
        {
          [(NCNotificationStructuredListViewController *)self->_structuredListViewController revealNotificationHistory:0 animated:0];
        }
        goto LABEL_35;
      case 24:
        [(CSCombinedListViewController *)self _setScreenOn:1];
        if ([(CSCombinedListViewController *)self _hasUserInteraction])
        {
          int v19 = (void *)*MEMORY[0x1E4FB3750];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
            -[CSCombinedListViewController handleEvent:](v19);
          }
          [(CSCombinedListViewController *)self _removeAllUserInteractionReasons];
        }
        [(CSCombinedListViewController *)self _updateFaceDetectMonitoring];
        [(CSCombinedListViewController *)self _updateDeviceWakeProximitySensorAssertion];
        [(CSCombinedListViewController *)self _updateNotificationLongPressProximitySensorAssertion];
        [(CSCombinedListViewController *)self _updatePresentationForReason:@"handleEvent:CSEventTypeScreenOn"];
        [(NCNotificationStructuredListViewController *)self->_structuredListViewController revealNotificationHistory:0 animated:0];
        goto LABEL_34;
      case 25:
        [(CSCombinedListViewController *)self _setScreenOn:0];
        self->_homeButtonPressDetected = 0;
        self->_lockButtonPressDetected = 0;
        self->_liftDetected = 0;
        self->_BOOL historyWasRevealed = 0;
        self->_BOOL coverSheetWasDismissed = 0;
        self->_interactingWithNotificationList = 0;
        self->_int proximitySensorCoveredSinceWake = self->_hasProximitySensor;
        [(CSCombinedListViewController *)self _updateFaceDetectMonitoring];
        [(CSCombinedListViewController *)self _updateDeviceWakeProximitySensorAssertion];
        [(CSCombinedListViewController *)self _updateNotificationLongPressProximitySensorAssertion];
        [(CSCombinedListViewController *)self _updatePresentationForReason:@"handleEvent:CSEventTypeScreenOff"];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __44__CSCombinedListViewController_handleEvent___block_invoke;
        v22[3] = &unk_1E6AD87F8;
        v22[4] = self;
        [(CSCombinedListViewController *)self _performSelfCorrectingListViewAction:v22];
        uint64_t v7 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
        -[CSCombinedListViewController _updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:](self, "_updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:", -[CSCombinedListViewController _uiBacklightLuminanceForBLSBacklightState:](self, "_uiBacklightLuminanceForBLSBacklightState:", [v7 backlightState]));

        uint64_t v8 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController scrollView];
        [v8 _scrollToTopIfPossible:0];

        [(NCNotificationStructuredListViewController *)self->_structuredListViewController dismissModalFullScreenAnimated:0];
        self->_confirmedNotInPocket = 0;
        [(CSCombinedListViewController *)self _stopScreenOnTimer];
        goto LABEL_35;
      case 26:
        [(NCNotificationStructuredListViewController *)self->_structuredListViewController listViewControllerPresentedByUserAction];
LABEL_34:
        [(CSCombinedListViewController *)self _startScreenOnTimer];
        goto LABEL_35;
      case 27:
        if ([(NCNotificationStructuredListViewController *)self->_structuredListViewController dismissModalFullScreenAnimated:1])
        {
          uint64_t v9 = (void *)*MEMORY[0x1E4FB3750];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = v9;
            uint8_t v11 = (objc_class *)objc_opt_class();
            id v12 = NSStringFromClass(v11);
            *(_DWORD *)buf = 138543362;
            int v25 = v12;
            _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "Destination %{public}@ handled home button tap dismissing long look", buf, 0xCu);
          }
          uint64_t v13 = SBLogDashBoard();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
            -[CSCombinedListViewController handleEvent:]();
          }
        }
        else
        {
          dndBedtimeGreetingViewController = self->_dndBedtimeGreetingViewController;
          if (!dndBedtimeGreetingViewController
            || ![(CSDNDBedtimeGreetingViewController *)dndBedtimeGreetingViewController handleEvent:v4])
          {
LABEL_35:
            char v6 = 0;
            goto LABEL_36;
          }
        }
        break;
      case 35:
        [(NCNotificationStructuredListViewController *)self->_structuredListViewController migrateNotifications];
        goto LABEL_35;
      case 36:
        if ([(CSCombinedListViewController *)self _allowNotificationsRevealPolicy]) {
          [(NCNotificationStructuredListViewController *)self->_structuredListViewController revealNotificationHistory:1 animated:0];
        }
        char v6 = 0;
        uint64_t v16 = 1394;
LABEL_40:
        *((unsigned char *)&self->super.super.super.super.isa + v16) = 0;
        goto LABEL_36;
      default:
        goto LABEL_36;
    }
  }
  char v6 = [v4 isConsumable];
LABEL_36:

  return v6;
}

void __44__CSCombinedListViewController_handleEvent___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1056) revealNotificationHistory:0 animated:0];
  if (([MEMORY[0x1E4F42FF0] areAnimationsEnabled] & 1) == 0)
  {
    id v2 = [*(id *)(*(void *)(a1 + 32) + 1056) view];
    [v2 layoutIfNeeded];
    [v2 _removeAllRetargetableAnimations:1];
  }
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSCombinedListViewController;
  return [(CSCoverSheetViewControllerBase *)&v4 wouldHandleButtonEvent:a3];
}

- (id)metadataForTriggeredInteraction:(id)a3
{
  if (self->_gestureStudyInteraction == a3)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v5 = [(CSCombinedListViewController *)self deviceOrientationProvider];
    char v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "rawDeviceOrientationIgnoringOrientationLocks"));
    [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F43FE0]];

    uint64_t v7 = [(CSCombinedListViewController *)self proximitySensorProvider];
    uint64_t v8 = [v7 isObjectInProximity];
    uint64_t v9 = [NSNumber numberWithBool:v8];
    [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F44018]];

    uint64_t v10 = [NSNumber numberWithBool:self->_proximitySensorCoveredSinceWake];
    [v3 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F44010]];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationStatusProvider);
    id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "isAuthenticated"));
    [v3 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F43FD0]];

    uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(WeakRetained, "hasPasscodeSet"));
    [v3 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F44008]];

    double v14 = objc_msgSend(NSNumber, "numberWithBool:", -[CSUserPresenceMonitor userPresenceDetectedSinceWake](self->_userPresenceMonitor, "userPresenceDetectedSinceWake"));
    [v3 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F43FE8]];

    if (self->_screenOnTime)
    {
      uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
      [v15 timeIntervalSinceDate:self->_screenOnTime];
      double v17 = v16;

      uint64_t v18 = [NSNumber numberWithDouble:v17];
      [v3 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F44020]];
    }
    int v19 = [MEMORY[0x1E4FA60D0] sharedInstance];
    int v20 = [v19 activeWakeSourceDescription];
    [v3 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F44028]];

    int v21 = [NSNumber numberWithBool:self->_liftDetected];
    [v3 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F43FF8]];

    int v22 = [NSNumber numberWithBool:self->_homeButtonPressDetected];
    [v3 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F43FF0]];

    objc_super v23 = [NSNumber numberWithBool:self->_lockButtonPressDetected];
    [v3 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F44000]];

    int v24 = [NSNumber numberWithBool:self->_coverSheetWasDismissed];
    [v3 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F43FD8]];

    int v25 = [NSNumber numberWithBool:self->_historyWasRevealed];
    [v3 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F43FC8]];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)sceneHostEnvironmentEntriesForBacklightSession
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = [(NSMutableDictionary *)self->_supplementaryItemContainersByIdentifier allValues];
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        uint64_t v8 = [v7 supplementaryViewControllers];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * j);
              if (objc_opt_respondsToSelector())
              {
                double v14 = [v13 sceneHostEnvironmentEntriesForBacklightSession];
                if (v14) {
                  [v3 unionSet:v14];
                }
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v10);
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)presentationRegions
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)CSCombinedListViewController;
  id v3 = [(CSCoverSheetViewControllerBase *)&v25 presentationRegions];
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController visibleContentExtent];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController scrollView];
  uint64_t v13 = +[CSRegion regionForCoordinateSpace:withExtent:](CSRegion, "regionForCoordinateSpace:withExtent:", v12, v5, v7, v9, v11);
  double v14 = [v13 role:2];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __51__CSCombinedListViewController_presentationRegions__block_invoke;
  v23[3] = &unk_1E6AD9FC8;
  id v15 = v12;
  id v24 = v15;
  double v16 = objc_msgSend(v3, "bs_filter:", v23);
  uint64_t v17 = (void *)[v16 mutableCopy];

  long long v18 = SBLogDashBoard();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    long long v20 = (objc_class *)objc_opt_class();
    long long v21 = NSStringFromClass(v20);
    v34.origin.double x = v5;
    v34.origin.double y = v7;
    v34.size.double width = v9;
    v34.size.CGFloat height = v11;
    long long v22 = NSStringFromCGRect(v34);
    *(_DWORD *)buf = 138412802;
    double v27 = v21;
    __int16 v28 = 2112;
    id v29 = v15;
    __int16 v30 = 2112;
    int v31 = v22;
    _os_log_debug_impl(&dword_1D839D000, v18, OS_LOG_TYPE_DEBUG, "Confining extent of %@'s scrollView region with identity %@ to its visibleContentExtent: %@", buf, 0x20u);
  }
  [v17 addObject:v14];

  return v17;
}

uint64_t __51__CSCombinedListViewController_presentationRegions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identity];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

- (void)_setListHasContent:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_listDismissingContent = 0;
  if (self->_listPresentingContent != a3)
  {
    BOOL v3 = a3;
    double v5 = (void *)*MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
    {
      double v6 = v5;
      double v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      double v9 = (void *)v8;
      double v10 = @"NO";
      if (v3) {
        double v10 = @"YES";
      }
      int v12 = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v10;
      _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "%@: Setting notification list has content to %@", (uint8_t *)&v12, 0x16u);
    }
    self->_listPresentingContent = v3;
    double v11 = [(CSCombinedListViewController *)self delegate];
    [v11 combinedListViewController:self hasContent:v3];

    [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
    [(CSCombinedListViewController *)self _updateFaceDetectMonitoring];
    [(CSCombinedListViewController *)self _updateNotificationLongPressProximitySensorAssertion];
    [(CSListItemManager *)self->_supplementaryItemManager setListHasNotificationContent:[(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleContent]];
  }
}

- (void)_performSelfCorrectingListViewAction:(id)a3
{
  double v7 = (void (**)(void))a3;
  BOOL v4 = ([(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleContent] & 1) != 0|| [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController isPresentingTransientContent];
  if (v7) {
    v7[2]();
  }
  if (![(NCNotificationStructuredListViewController *)self->_structuredListViewController hasVisibleContent])
  {
    BOOL v6 = [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController isPresentingTransientContent];
    uint64_t v5 = v6;
    if (v4 == v6) {
      goto LABEL_14;
    }
    if (v6)
    {
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v5 = 0;
      if (self->_listDismissingContent) {
        goto LABEL_14;
      }
    }
    goto LABEL_13;
  }
  uint64_t v5 = 1;
  if (!v4) {
LABEL_13:
  }
    [(CSCombinedListViewController *)self _setListHasContent:v5];
LABEL_14:
  [(CSCombinedListViewController *)self _noteListContentsPotentiallyChangedAfterTransitionFrom:v4 to:v5];
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
}

- (void)_updatePresentationForReason:(id)a3
{
  id v4 = a3;
  currentPresentationUpdateCauses = self->_currentPresentationUpdateCauses;
  if (!currentPresentationUpdateCauses)
  {
    BOOL v6 = [MEMORY[0x1E4F1CA80] set];
    double v7 = self->_currentPresentationUpdateCauses;
    self->_currentPresentationUpdateCauses = v6;

    currentPresentationUpdateCauses = self->_currentPresentationUpdateCauses;
  }
  if ([(NSMutableSet *)currentPresentationUpdateCauses containsObject:v4])
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_ERROR)) {
      -[CSCombinedListViewController _updatePresentationForReason:]();
    }
  }
  else
  {
    [(NSMutableSet *)self->_currentPresentationUpdateCauses addObject:v4];
    [(CSCombinedListViewController *)self _minInsetsToPushDateOffScreen];
    double v9 = v8;
    if ([(CSCombinedListViewController *)self _shouldPadBottomSpacing]) {
      double v10 = v9;
    }
    else {
      double v10 = 0.0;
    }
    double v11 = [(CSLayoutStrategy *)self->_layoutStrategy persistentLayout];
    [v11 bottomContentInset];
    double v13 = v12;

    double v14 = fmax(v10 - v13, 0.0);
    if ((BSFloatEqualToFloat() & 1) == 0)
    {
      self->_footerOffset = v14;
      [(CSCombinedListViewController *)self _updateListViewContentInset];
      id v15 = [(CSCombinedListViewController *)self view];
      [v15 setNeedsLayout];
    }
    uint64_t v16 = [(CSCombinedListViewController *)self notificationListScrollView];
    [v16 contentOffset];
    double v18 = v17;
    [(NCNotificationStructuredListViewController *)self->_structuredListViewController scrollViewVisibleContentLayoutOffset];
    double v20 = v19;
    [v16 contentInset];
    double v22 = -v21;
    double v23 = v18 - v20 - v21;
    if (v23 <= v22) {
      double v23 = v22;
    }
    BOOL v24 = v18 >= v22 && v20 <= 0.0;
    double cachedAdjunctHeight = self->_cachedAdjunctHeight;
    self->_presentationDirtiedAppearance = 0;
    if (v24) {
      double v26 = v18;
    }
    else {
      double v26 = v23;
    }
    [(NSLayoutConstraint *)self->_adjunctListViewTopConstraint setConstant:-cachedAdjunctHeight];
    [(CSCombinedListViewController *)self _listViewDefaultContentInsets];
    double v28 = v27;
    if ([(CSCombinedListViewController *)self _allowsDateViewOrProudLockScroll])
    {
      [(CSCombinedListViewController *)self scrollingContentInset];
      [(CSCombinedListViewController *)self clippingOffset];
      [(CSCombinedListViewController *)self updateAppearanceForHidden:BSFloatGreaterThanOrEqualToFloat() offset:cachedAdjunctHeight + v26];
    }
    else
    {
      [(CSCombinedListViewController *)self updateAppearanceForHidden:0 offset:0.0];
    }
    [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController setProminentElementHeightToMimic:v28 + -8.666666];
    CSUpdateStatusBarBackgroundComponent(self);
    if (self->_presentationDirtiedAppearance) {
      [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
    }
    [(NSMutableSet *)self->_currentPresentationUpdateCauses removeObject:v4];
  }
}

- (void)_layoutListView
{
  self->_BOOL listBeingLaidOut = 1;
  id v14 = [(CSCombinedListViewController *)self notificationListViewController];
  BOOL v3 = [(CSCombinedListViewController *)self notificationListScrollView];
  [(CSCombinedListViewController *)self _suggestedListViewFrame];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double MinX = CGRectGetMinX(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v17);
  double v10 = [(CSCombinedListViewController *)self view];
  [v10 bounds];
  double v11 = CGRectGetHeight(v18);

  double v12 = [(UIViewController *)self->_captureOnlyMaterialViewController view];
  objc_msgSend(v12, "setFrame:", MinX, 0.0, v9, v11);

  double v13 = [v14 view];
  objc_msgSend(v13, "setFrame:", MinX, 0.0, v9, v11);

  objc_msgSend(v3, "setFrame:", 0.0, 0.0, v9, v11);
  [(CSCombinedListViewController *)self _updateListViewContentInset];
  self->_BOOL listBeingLaidOut = 0;
  [(CSCombinedListViewController *)self _updatePresentationForReason:@"_layoutListView"];
}

- (void)_updateListViewContentInset
{
  BOOL v3 = [(CSCombinedListViewController *)self notificationListScrollView];
  [v3 contentOffset];
  uint64_t v32 = v4;
  double v6 = v5;
  [v3 contentInset];
  double v8 = v7;
  [(CSCombinedListViewController *)self _listViewAdjustedContentInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13 + self->_cachedAdjunctHeight;
  double v16 = v15 + self->_footerOffset;
  -[CSCombinedListViewController _sanitizedContentOffset:forContentInset:](self, "_sanitizedContentOffset:forContentInset:", v6 - (v14 - v8), v14, v9, v16, v11);
  uint64_t v31 = v17;
  int v18 = BSFloatEqualToFloat();
  int v19 = BSFloatEqualToFloat();
  int v20 = BSFloatEqualToFloat();
  int v21 = BSFloatEqualToFloat();
  if ([v3 isDragging])
  {
    objc_msgSend(v3, "setContentInset:", v14, v10, v16, v12);
  }
  else
  {
    char v22 = [v3 isDecelerating];
    objc_msgSend(v3, "setContentInset:", v14, v10, v16, v12);
    if ((v22 & 1) == 0 && (v19 & v20 & v21 & v18 & 1) == 0)
    {
      int v23 = v19 & ~v20 & v21 & v18;
      BOOL v24 = [(CSCombinedListViewController *)self _shouldPadBottomSpacing];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __59__CSCombinedListViewController__updateListViewContentInset__block_invoke;
      v35[3] = &unk_1E6AD9FF0;
      v35[4] = self;
      id v25 = v3;
      id v36 = v25;
      uint64_t v37 = v32;
      double v38 = v6 - (v14 - v8);
      uint64_t v39 = v31;
      double v26 = (void *)MEMORY[0x1D9487300](v35);
      if (v23 == 1 && v24)
      {
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v26];
      }
      else
      {
        if (v23 && !v24) {
          [v25 _scrollToTopIfPossible:1];
        }
        double v27 = (void *)MEMORY[0x1E4F42FF0];
        [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController listViewContentAnimationDuration];
        double v29 = v28;
        [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController listViewContentAnimationDampingRatio];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __59__CSCombinedListViewController__updateListViewContentInset__block_invoke_2;
        v33[3] = &unk_1E6ADA018;
        BOOL v34 = v24;
        v33[4] = self;
        [v27 animateWithDuration:0 delay:v26 usingSpringWithDamping:v33 initialSpringVelocity:v29 options:0.0 animations:v30 completion:0.0];
      }
    }
  }
}

uint64_t __59__CSCombinedListViewController__updateListViewContentInset__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _integratesAdjunctListIntoFullList] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 40), "setContentOffset:", *(double *)(a1 + 48), *(double *)(a1 + 64));
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 _updateQuickActionsVisibilityForScrollView:v3];
}

uint64_t __59__CSCombinedListViewController__updateListViewContentInset__block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _updatePresentationForReason:@"_updateListViewContentInset"];
  }
  return result;
}

- (double)_sanitizedContentOffset:(double)a3 forContentInset:(UIEdgeInsets)a4
{
  double top = a4.top;
  -[CSCombinedListViewController _determineMaxContentOffsetForContentInset:](self, "_determineMaxContentOffsetForContentInset:", a4.top, a4.left, a4.bottom, a4.right);
  double v7 = v6;
  double v8 = -top;
  int v9 = BSFloatGreaterThanFloat();
  if (v7 >= a3) {
    double result = v7;
  }
  else {
    double result = a3;
  }
  if (result >= v8) {
    double result = v8;
  }
  if (v7 <= a3) {
    double v11 = v7;
  }
  else {
    double v11 = a3;
  }
  if (v9) {
    return v11;
  }
  return result;
}

- (CGPoint)_determineMaxContentOffsetForContentInset:(UIEdgeInsets)a3
{
  double bottom = a3.bottom;
  double left = a3.left;
  double v6 = [(CSCombinedListViewController *)self notificationListScrollView];
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController effectiveContentSize];
  double v8 = v7;
  [v6 bounds];
  double v10 = bottom + v8 - v9;

  double v11 = -left;
  double v12 = v10;
  result.CGFloat y = v12;
  result.CGFloat x = v11;
  return result;
}

- (BOOL)_allowNotificationsRevealPolicy
{
  id v2 = [(CSCoverSheetViewControllerBase *)self activeBehavior];
  char v3 = [v2 areRestrictedCapabilities:0x10000] ^ 1;

  return v3;
}

- (void)_updateCaptureOnlyMaterialView
{
  if (!self->_captureOnlyMaterialViewController)
  {
    char v3 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController captureOnlyMaterialViewController];
    captureOnlyMaterialViewController = self->_captureOnlyMaterialViewController;
    self->_captureOnlyMaterialViewController = v3;

    double v5 = self->_captureOnlyMaterialViewController;
    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __62__CSCombinedListViewController__updateCaptureOnlyMaterialView__block_invoke;
      v6[3] = &unk_1E6AD8820;
      v6[4] = self;
      [(CSCombinedListViewController *)self bs_addChildViewController:v5 animated:0 transitionBlock:v6];
    }
  }
}

void __62__CSCombinedListViewController__updateCaptureOnlyMaterialView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  char v3 = [*(id *)(*(void *)(a1 + 32) + 1048) view];
  [v2 addSubview:v3];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 setNeedsLayout];
}

- (void)_setDisableScrolling:(BOOL)a3
{
  if (self->_disableScrolling != a3)
  {
    self->_disableScrolling = a3;
    [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
  }
}

- (void)_setScreenOn:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_screenOn != a3)
  {
    BOOL v3 = a3;
    self->_screenOn = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = [(CSListItemManager *)self->_supplementaryItemManager allItems];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          double v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) contentHost];
          if (objc_opt_respondsToSelector()) {
            [v9 setScreenOn:v3];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)_updateListItemAppearanceState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSCombinedListViewController *)self bs_isAppearingOrAppeared];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(CSListItemManager *)self->_supplementaryItemManager allItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        double v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) contentHost];
        if (objc_opt_respondsToSelector()) {
          [v9 setListAppeared:v3];
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_setDisableBackgroundAnimation:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    backgroundAnimationDisabledReasons = self->_backgroundAnimationDisabledReasons;
    id v17 = v7;
    if (v4)
    {
      if (!backgroundAnimationDisabledReasons)
      {
        double v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v10 = self->_backgroundAnimationDisabledReasons;
        self->_backgroundAnimationDisabledReasons = v9;

        id v7 = v17;
        backgroundAnimationDisabledReasons = self->_backgroundAnimationDisabledReasons;
      }
      [(NSMutableSet *)backgroundAnimationDisabledReasons addObject:v7];
    }
    else
    {
      [(NSMutableSet *)backgroundAnimationDisabledReasons removeObject:v7];
    }
    id v6 = (id)[(NSMutableSet *)self->_backgroundAnimationDisabledReasons count];
    BOOL v11 = v6 != 0;
    id v7 = v17;
    if (self->_disableBackgroundAnimation != v11)
    {
      self->_disableBackgroundAnimation = v11;
      if (v6)
      {
        long long v12 = objc_opt_new();
        long long v13 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
        double v14 = [v12 identifier:v13];
        uint64_t v15 = [v14 suppressTeachableMomentsAnimation:1];
        homeAffordanceComponent = self->_homeAffordanceComponent;
        self->_homeAffordanceComponent = v15;
      }
      else
      {
        long long v12 = self->_homeAffordanceComponent;
        self->_homeAffordanceComponent = 0;
      }

      id v6 = (id)[(CSCoverSheetViewControllerBase *)self rebuildAppearance];
      id v7 = v17;
    }
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_setFooterCallToActionLabelHidden:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    footerCallToActionHiddenReasons = self->_footerCallToActionHiddenReasons;
    id v17 = v7;
    if (v4)
    {
      if (!footerCallToActionHiddenReasons)
      {
        double v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v10 = self->_footerCallToActionHiddenReasons;
        self->_footerCallToActionHiddenReasons = v9;

        id v7 = v17;
        footerCallToActionHiddenReasons = self->_footerCallToActionHiddenReasons;
      }
      [(NSMutableSet *)footerCallToActionHiddenReasons addObject:v7];
    }
    else
    {
      [(NSMutableSet *)footerCallToActionHiddenReasons removeObject:v7];
    }
    id v6 = (id)[(NSMutableSet *)self->_footerCallToActionHiddenReasons count];
    BOOL v11 = v6 != 0;
    id v7 = v17;
    if (self->_footerCallToActionLabelHidden != v11)
    {
      self->_footerCallToActionLabelHidden = v11;
      if (v6)
      {
        long long v12 = +[CSComponent footerCallToActionLabel];
        long long v13 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
        double v14 = [v12 identifier:v13];
        uint64_t v15 = [v14 hidden:1];
        footerCallToActionLabelComponent = self->_footerCallToActionLabelComponent;
        self->_footerCallToActionLabelComponent = v15;
      }
      else
      {
        long long v12 = self->_footerCallToActionLabelComponent;
        self->_footerCallToActionLabelComponent = 0;
      }

      id v6 = (id)[(CSCoverSheetViewControllerBase *)self rebuildAppearance];
      id v7 = v17;
    }
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_setNotificationListHidden:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    notificationListHiddenReasons = self->_notificationListHiddenReasons;
    id v16 = v7;
    if (v4)
    {
      if (!notificationListHiddenReasons)
      {
        double v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v10 = self->_notificationListHiddenReasons;
        self->_notificationListHiddenReasons = v9;

        id v7 = v16;
        notificationListHiddenReasons = self->_notificationListHiddenReasons;
      }
      [(NSMutableSet *)notificationListHiddenReasons addObject:v7];
    }
    else
    {
      [(NSMutableSet *)notificationListHiddenReasons removeObject:v7];
    }
    id v6 = (id)[(NSMutableSet *)self->_notificationListHiddenReasons count];
    BOOL v11 = v6 != 0;
    id v7 = v16;
    if (self->_notificationListHidden != v11)
    {
      id v12 = v6;
      self->_notificationListHidden = v11;
      long long v13 = [(NCNotificationStructuredListViewController *)self->_structuredListViewController view];
      double v14 = v13;
      double v15 = 1.0;
      if (v12) {
        double v15 = 0.0;
      }
      [v13 setAlpha:v15];

      id v7 = v16;
    }
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (void)_setDismissGestureDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    dismissGestureDisabledReasons = self->_dismissGestureDisabledReasons;
    id v12 = v7;
    if (v4)
    {
      if (!dismissGestureDisabledReasons)
      {
        double v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        long long v10 = self->_dismissGestureDisabledReasons;
        self->_dismissGestureDisabledReasons = v9;

        id v7 = v12;
        dismissGestureDisabledReasons = self->_dismissGestureDisabledReasons;
      }
      [(NSMutableSet *)dismissGestureDisabledReasons addObject:v7];
    }
    else
    {
      [(NSMutableSet *)dismissGestureDisabledReasons removeObject:v7];
    }
    id v6 = (id)[(NSMutableSet *)self->_dismissGestureDisabledReasons count];
    BOOL v11 = v6 != 0;
    id v7 = v12;
    if (self->_dismissGestureDisabled != v11)
    {
      self->_dismissGestureDisabled = v11;
      id v6 = (id)[(CSCoverSheetViewControllerBase *)self rebuildBehavior];
      id v7 = v12;
    }
  }

  MEMORY[0x1F41817F8](v6, v7);
}

- (double)_statusBarHeight
{
  id v2 = (void *)MEMORY[0x1E4F42E28];
  uint64_t v3 = [(CSCombinedListViewController *)self interfaceOrientation];

  [v2 heightForStyle:1 orientation:v3];
  return result;
}

- (void)_requestAuthenticationWithCompletion:(id)a3
{
  p_unlockRequester = &self->_unlockRequester;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_unlockRequester);
  id v6 = [WeakRetained createUnlockRequest];
  [v6 setSource:10];
  [v6 setIntent:2];
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = NSStringFromClass(v7);
  [v6 setName:v8];

  [v6 setWantsBiometricPresentation:1];
  [v6 setConfirmedNotInPocket:self->_confirmedNotInPocket];
  [WeakRetained unlockWithRequest:v6 completion:v5];
}

- (BOOL)_isClockSnoozeAlarmNotificationRequest:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationInformer);
  id v6 = [v4 sectionIdentifier];
  if ([WeakRetained isBundleIdentifierClock:v6])
  {
    id v7 = [v4 categoryIdentifier];
    char v8 = [v7 isEqualToString:@"AlarmSnoozeCountdown"];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)_updateFaceDetectMonitoring
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CSUserPresenceMonitor *)self->_userPresenceMonitor userPresenceDetectedSinceWake];
  int v4 = [(CSCombinedListViewController *)self bs_isAppearingOrAppeared];
  int v5 = v4;
  BOOL v6 = !self->_screenOn || v4 == 0;
  if (v6 || !self->_listPresentingContent || self->_coverSheetWasDismissed) {
    int v7 = 0;
  }
  else {
    int v7 = !self->_coverSheetResignedActive && !v3;
  }
  char v8 = (os_log_t *)MEMORY[0x1E4FB3750];
  double v9 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL screenOn = self->_screenOn;
    BOOL listPresentingContent = self->_listPresentingContent;
    BOOL coverSheetWasDismissed = self->_coverSheetWasDismissed;
    BOOL coverSheetResignedActive = self->_coverSheetResignedActive;
    v16[0] = 67110656;
    v16[1] = screenOn;
    __int16 v17 = 1024;
    int v18 = v5;
    __int16 v19 = 1024;
    BOOL v20 = listPresentingContent;
    __int16 v21 = 1024;
    BOOL v22 = coverSheetWasDismissed;
    __int16 v23 = 1024;
    BOOL v24 = coverSheetResignedActive;
    __int16 v25 = 1024;
    BOOL v26 = v3;
    __int16 v27 = 1024;
    int v28 = v7;
    _os_log_impl(&dword_1D839D000, v9, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Wants face detect monitoring [ screen: %{BOOL}d view: %{BOOL}d notifications: %{BOOL}d pull-down: %{BOOL}d resigned-active: %{BOOL}d user-presence-detetected-since-wake: %{BOOL}d ]: %{BOOL}d", (uint8_t *)v16, 0x2Cu);
  }
  if (v7)
  {
    double v14 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_1D839D000, v14, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Monitoring face detection", (uint8_t *)v16, 2u);
    }
    [(CSUserPresenceMonitor *)self->_userPresenceMonitor enableDetectionForReason:@"CSCombinedListViewController"];
  }
  else if (self->_userPresenceMonitor)
  {
    double v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_1D839D000, v15, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Stopped monitoring face detection", (uint8_t *)v16, 2u);
    }
    [(CSUserPresenceMonitor *)self->_userPresenceMonitor disableDetectionForReason:@"CSCombinedListViewController"];
  }
}

- (void)_updateNotificationLongPressProximitySensorAssertion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = [(CSCombinedListViewController *)self bs_isAppearingOrAppeared];
  int v4 = v3;
  BOOL v6 = self->_hasProximitySensor
    && (self->_screenOn ? (int v5 = v3) : (int v5 = 0), v5 == 1 && self->_listPresentingContent)
    && !self->_coverSheetWasDismissed;
  int v7 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasProximitySensor = self->_hasProximitySensor;
    BOOL screenOn = self->_screenOn;
    BOOL listPresentingContent = self->_listPresentingContent;
    BOOL coverSheetWasDismissed = self->_coverSheetWasDismissed;
    int v14 = 138413826;
    double v15 = @"NotificationLongPress";
    __int16 v16 = 1024;
    BOOL v17 = hasProximitySensor;
    __int16 v18 = 1024;
    BOOL v19 = screenOn;
    __int16 v20 = 1024;
    int v21 = v4;
    __int16 v22 = 1024;
    BOOL v23 = listPresentingContent;
    __int16 v24 = 1024;
    BOOL v25 = coverSheetWasDismissed;
    __int16 v26 = 1024;
    BOOL v27 = v6;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Wants proximity sensor assertion for %@ [ proximity-sensor: %{BOOL}d screen: %{BOOL}d view: %{BOOL}d notifications: %{BOOL}d pull-down: %{BOOL}d ]: %{BOOL}d", (uint8_t *)&v14, 0x30u);
  }
  id v12 = [(CSCombinedListViewController *)self _updateProximitySensorAssertion:self->_notificationLongPressProximitySensorAssertion wantsAssertion:v6 forReason:@"NotificationLongPress"];
  notificationLongPressProximitySensorAssertion = self->_notificationLongPressProximitySensorAssertion;
  self->_notificationLongPressProximitySensorAssertion = v12;
}

- (void)_updateDeviceWakeProximitySensorAssertion
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int v3 = [(CSCombinedListViewController *)self bs_isAppearingOrAppeared];
  int v4 = v3;
  BOOL v6 = self->_hasProximitySensor
    && (self->_screenOn ? (int v5 = v3) : (int v5 = 0), v5 == 1)
    && self->_proximitySensorCoveredSinceWake;
  int v7 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    BOOL hasProximitySensor = self->_hasProximitySensor;
    BOOL screenOn = self->_screenOn;
    BOOL proximitySensorCoveredSinceWake = self->_proximitySensorCoveredSinceWake;
    int v15 = 138413570;
    __int16 v16 = @"NotificationDeviceWake";
    __int16 v17 = 1024;
    BOOL v18 = hasProximitySensor;
    __int16 v19 = 1024;
    BOOL v20 = screenOn;
    __int16 v21 = 1024;
    int v22 = v4;
    __int16 v23 = 1024;
    BOOL v24 = proximitySensorCoveredSinceWake;
    __int16 v25 = 1024;
    BOOL v26 = v6;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Wants proximity sensor assertion for %@ [ proximity-sensor: %{BOOL}d screen: %{BOOL}d view: %{BOOL}d covered-since-wake: %{BOOL}d ]: %{BOOL}d", (uint8_t *)&v15, 0x2Au);
  }
  BOOL v11 = [MEMORY[0x1E4F1C9C8] date];
  deviceWakeProximitySensorAssertionCaptureTime = self->_deviceWakeProximitySensorAssertionCaptureTime;
  self->_deviceWakeProximitySensorAssertionCaptureTime = v11;

  long long v13 = [(CSCombinedListViewController *)self _updateProximitySensorAssertion:self->_deviceWakeProximitySensorAssertion wantsAssertion:v6 forReason:@"NotificationDeviceWake"];
  deviceWakeProximitySensorAssertion = self->_deviceWakeProximitySensorAssertion;
  self->_deviceWakeProximitySensorAssertion = v13;
}

- (id)_updateProximitySensorAssertion:(id)a3 wantsAssertion:(BOOL)a4 forReason:(id)a5
{
  BOOL v6 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = a3;
  id v9 = a5;
  if (!WeakRetained && v6)
  {
    long long v10 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1D839D000, v10, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Acquiring proximity sensor assertion for %@", (uint8_t *)&v14, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_proximitySensorProvider);
    uint64_t v11 = [WeakRetained requestProximityMode:13 forReason:v9];
LABEL_11:

    id WeakRetained = (id)v11;
    goto LABEL_12;
  }
  if (WeakRetained && !v6)
  {
    id v12 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_1D839D000, v12, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Invalidating proximity sensor assertion for reason %@", (uint8_t *)&v14, 0xCu);
    }
    [WeakRetained invalidate];
    uint64_t v11 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return WeakRetained;
}

- (void)_homeButtonPressDetected
{
  int v3 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Home button pressed", v4, 2u);
  }
  self->_homeButtonPressDetected = 1;
}

- (void)_lockButtonPressDetected
{
  int v3 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Lock button pressed", v4, 2u);
  }
  self->_lockButtonPressDetected = 1;
}

- (void)_liftToWakeGestureDetected
{
  int v3 = *MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[Notification Long Press Gesture] Lift detected", v4, 2u);
  }
  self->_liftDetected = 1;
}

- (void)_tearDownContainerViewForExpandedNotificationContent
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_containerViewForExpandedNotificationContent)
  {
    int v3 = *MEMORY[0x1E4FB3750];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEFAULT))
    {
      containerViewForExpandedNotificationContent = self->_containerViewForExpandedNotificationContent;
      int v6 = 138543362;
      int v7 = containerViewForExpandedNotificationContent;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "Tearing down container view for expanded notification content: %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [(UIView *)self->_containerViewForExpandedNotificationContent removeFromSuperview];
    int v5 = self->_containerViewForExpandedNotificationContent;
    self->_containerViewForExpandedNotificationContent = 0;
  }
}

- (void)_noteListContentsPotentiallyChangedAfterTransitionFrom:(BOOL)a3 to:(BOOL)a4
{
  if (a3 || a4) {
    [(CSCombinedListViewController *)self _noteListContentsPotentiallyChanged];
  }
}

- (void)_noteListContentsPotentiallyChanged
{
  [(CSCombinedListViewController *)self _noteVisibleBreakthroughContentPotentiallyChanged];
  int v3 = +[CSAction actionWithType:13 animated:1];
  [(CSCoverSheetViewControllerBase *)self sendAction:v3];

  id v4 = [(CSCombinedListViewController *)self activityItemObserver];
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 activityItemsMayHaveChanged];
  }
  [(CSCombinedListViewController *)self _updateAudioCategoriesDisablingVolumeHUD];
}

- (void)_noteVisibleBreakthroughContentPotentiallyChanged
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_breakthroughContentObservers count])
  {
    BOOL v3 = [(CSCombinedListViewController *)self hasVisibleBreakthroughContent];
    if (self->_hadBreakthroughContent != v3)
    {
      BOOL v4 = v3;
      self->_hadBreakthroughContent = v3;
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      int v5 = self->_breakthroughContentObservers;
      uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "combinedListViewController:didChangeVisibleBreakthroughContent:", self, v4, (void)v10);
          }
          while (v7 != v9);
          uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
}

- (void)_triggerSignificantUserInteractionIfNeeded
{
  BOOL v3 = [(CSLockScreenSettings *)self->_lockScreenSettings idleTimerSettings];
  int v4 = [v3 increaseNotificationScrollLogging];

  if (self->_significantUserInteractionTimer)
  {
    if (v4)
    {
      int v5 = SBLogIdleTimer();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "[SignificantUserInteraction] dropped, timer already active", (uint8_t *)buf, 2u);
      }
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = SBLogIdleTimer();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1D839D000, v6, OS_LOG_TYPE_DEFAULT, "[SignificantUserInteraction] Creating new timer", (uint8_t *)buf, 2u);
      }
    }
    objc_initWeak(buf, self);
    uint64_t v7 = (BSAbsoluteMachTimer *)[objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"CSCombinedListViewController.significantUserInteractionTimer"];
    significantUserInteractionTimer = self->_significantUserInteractionTimer;
    self->_significantUserInteractionTimer = v7;

    uint64_t v9 = self->_significantUserInteractionTimer;
    uint64_t v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__CSCombinedListViewController__triggerSignificantUserInteractionIfNeeded__block_invoke;
    v12[3] = &unk_1E6ADA040;
    objc_copyWeak(&v13, buf);
    char v14 = v4;
    [(BSAbsoluteMachTimer *)v9 scheduleWithFireInterval:v10 leewayInterval:v12 queue:1.0 handler:0.0];

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
}

void __74__CSCombinedListViewController__triggerSignificantUserInteractionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (*(unsigned char *)(a1 + 40))
  {
    BOOL v3 = SBLogIdleTimer();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "[SignificantUserInteraction] 1s timer fired", v6, 2u);
    }
  }
  if ([WeakRetained participantState] == 2)
  {
    int v4 = +[CSAction actionWithType:4];
    [WeakRetained sendAction:v4];
  }
  if (WeakRetained)
  {
    [WeakRetained[139] invalidate];
    id v5 = WeakRetained[139];
    WeakRetained[139] = 0;
  }
}

- (void)_publishVisibleNotificationCountOnContentChange
{
  id v3 = [(CSCombinedListViewController *)self notificationObserver];
  if (v3) {
    objc_msgSend(v3, "combinedListViewController:didUpdateVisibleNotificationCount:", self, -[CSCombinedListViewController visibleNotificationCount](self, "visibleNotificationCount"));
  }
}

- (void)_updateAudioCategoriesDisablingVolumeHUD
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(NSMutableDictionary *)self->_supplementaryItemContainersByIdentifier allValues];
  uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
  id v2 = 0;
  if (v23)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        int v4 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v5 = [v4 supplementaryViewControllers];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v38 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v7; ++j)
            {
              if (*(void *)v25 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * j);
              id v11 = self;
              char isKindOfClass = objc_opt_isKindOfClass();

              if (isKindOfClass)
              {
                id v13 = v10;
                char v14 = [v13 audioCategoriesDisablingVolumeHUD];
                uint64_t v15 = SBFAudioCategoriesDisablingVolumeHUDUnion();

                id v2 = (void *)v15;
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v38 count:16];
          }
          while (v7);
        }
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v39 count:16];
    }
    while (v23);
  }

  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, v2);
    uint64_t v16 = SBLogDashBoard();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      int v33 = v17;
      __int16 v34 = 2048;
      int v35 = self;
      __int16 v36 = 2114;
      uint64_t v37 = v2;
      id v18 = v17;
      _os_log_impl(&dword_1D839D000, v16, OS_LOG_TYPE_DEFAULT, "(%@:%p) Updating audioCategoriesDisablingVolumeHUD to '%{public}@'", buf, 0x20u);
    }
    __int16 v19 = [(CSCombinedListViewController *)self audioCategoriesObserver];
    [v19 combinedListViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:self];
  }
}

- (BOOL)_integratesAdjunctListIntoFullList
{
  return _os_feature_enabled_impl();
}

- (double)clippingOffset
{
  [(CSCombinedListViewController *)self _statusBarHeight];
  return -v2;
}

- (void)updateAppearanceForHidden:(BOOL)a3 offset:(double)a4
{
  BOOL v5 = a3;
  BOOL v7 = [(CSCombinedListViewController *)self _allowsDateViewOrProudLockScroll];
  uint64_t v8 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  int v9 = 1;
  uint64_t v10 = [v8 componentForType:1 property:2];

  id v11 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  long long v12 = [v11 componentForType:1 property:1];

  if (v5)
  {
    int v9 = [v12 isHidden] ^ 1;
    BOOL v13 = v7;
  }
  else
  {
    BOOL v13 = 0;
  }
  [v10 offset];
  if (v15 == 0.0) {
    int v16 = v9;
  }
  else {
    int v16 = 1;
  }
  if (v14 == a4) {
    int v17 = v16;
  }
  else {
    int v17 = 1;
  }
  [(CSComponent *)self->_dateViewComponent setHidden:v13];
  double v18 = 0.0;
  if (v7)
  {
    [(CSCombinedListViewController *)self scrollingContentInset];
    double v18 = v19 + a4;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  CSComponentTransitionInputsMake(0, (uint64_t)&v26, 0.0, 0.0, v18, 0.0, 0.0);
  if (self->_screenOn)
  {
    uint64_t v20 = 12;
  }
  else if ([v12 isHidden])
  {
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = 12;
  }
  [(CSComponent *)self->_dateViewComponent setTransitionModifiers:v20];
  dateViewComponent = self->_dateViewComponent;
  long long v23 = v26;
  long long v24 = v27;
  long long v25 = v28;
  [(CSComponent *)dateViewComponent setTransitionInputs:&v23];
  [(CSCombinedListViewController *)self _updateProudLockForHidden:v5 scrollOffset:v18];
  [(CSComponent *)self->_complicationContainerComponent setTransitionModifiers:v20];
  complicationContainerComponent = self->_complicationContainerComponent;
  long long v23 = v26;
  long long v24 = v27;
  long long v25 = v28;
  [(CSComponent *)complicationContainerComponent setTransitionInputs:&v23];
  if (v17) {
    self->_presentationDirtiedAppearance = 1;
  }
}

- (void)_updateProudLockForHidden:(BOOL)a3 scrollOffset:(double)a4
{
  BOOL v5 = a3;
  BOOL v7 = [(CSCombinedListViewController *)self _shouldUpdateProudLockMaterialBackgroundForScrolling];
  BOOL v8 = v7;
  if (a4 <= 0.0 || v7)
  {
    [(CSComponent *)self->_proudLockComponent setTransitionModifiers:0];
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    CSComponentTransitionInputsMake(0, (uint64_t)&v26, 0.0, 0.0, -a4, 0.0, 0.0);
    [(CSComponent *)self->_proudLockComponent setTransitionModifiers:8];
    proudLockComponent = self->_proudLockComponent;
    v25[0] = v26;
    v25[1] = v27;
    v25[2] = v28;
    [(CSComponent *)proudLockComponent setTransitionInputs:v25];
  }
  BOOL v10 = [(CSCombinedListViewController *)self _shouldHideProudLockForScroll];
  BOOL v11 = v5 | v10;
  long long v12 = self->_proudLockComponent;
  if (v8)
  {
    uint64_t v13 = objc_opt_class();
    double v14 = v12;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        double v15 = v14;
      }
      else {
        double v15 = 0;
      }
    }
    else
    {
      double v15 = 0;
    }
    int v17 = v15;

    [(CSComponent *)v17 setSupportsMaterialBackground:v10];
    BOOL v16 = v10;
  }
  else
  {
    [(CSComponent *)v12 setHidden:v11];
    BOOL v16 = v11;
  }
  double v18 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  double v19 = [v18 componentForType:11 property:-1];

  if (v8)
  {
    uint64_t v20 = objc_opt_class();
    id v21 = v19;
    if (v20)
    {
      if (objc_opt_isKindOfClass()) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 0;
      }
    }
    else
    {
      uint64_t v22 = 0;
    }
    id v24 = v22;

    if (v24) {
      LOBYTE(v23) = v10 ^ [v24 supportsMaterialBackground];
    }
    else {
      LOBYTE(v23) = 0;
    }
  }
  else
  {
    int v23 = v11 ^ [v19 isHidden];
  }
  self->_presentationDirtiedAppearance = v16 | v23;
}

- (BOOL)_shouldHideProudLockForScroll
{
  id v3 = [(CSCombinedListViewController *)self notificationListScrollView];
  [v3 contentOffset];
  int v4 = [(CSCombinedListViewController *)self view];
  [v4 bounds];
  CGRectGetHeight(v7);

  [(CSCombinedListViewController *)self clippingOffset];

  return BSFloatGreaterThanOrEqualToFloat();
}

- (BOOL)_shouldUpdateProudLockMaterialBackgroundForScrolling
{
  return MEMORY[0x1F415C628](self, a2);
}

- (double)distanceFromBarToContent
{
  uint64_t v3 = SBFEffectiveHomeButtonType();
  if (__sb__runningInSpringBoard())
  {
    if ((!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1) && v3 == 2)
    {
LABEL_5:
      [(CSCombinedListViewController *)self topContentInset];
      goto LABEL_11;
    }
  }
  else
  {
    int v4 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5) {
      BOOL v6 = 0;
    }
    else {
      BOOL v6 = v3 == 2;
    }
    if (v6) {
      goto LABEL_5;
    }
  }
  CGRect v7 = [(CSLayoutStrategy *)self->_layoutStrategy persistentLayout];
  [v7 timeLabelBaselineY];
  [MEMORY[0x1E4FA5F58] timeFontMetrics];

LABEL_11:
  [(CSCombinedListViewController *)self _statusBarHeight];
  SBFMainScreenScale();

  BSFloatRoundForScale();
  return result;
}

- (void)updateAppearanceForStatusBarBackgroundHidden:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
  id v6 = [v5 componentForType:8 property:1];

  LODWORD(v5) = [v6 isHidden];
  [(CSComponent *)self->_statusBarBackgroundComponent setHidden:v3];
  if (v5 != v3) {
    self->_presentationDirtiedAppearance = 1;
  }
}

- (CGRect)_suggestedListViewFrame
{
  [(NCNotificationStructuredListViewController *)self->_structuredListViewController insetMargins];
  double v4 = v3;
  double v6 = v5;
  layoutStrategCGFloat y = self->_layoutStrategy;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  int v9 = [(CSCombinedListViewController *)self view];
  [v9 bounds];
  -[CSLayoutStrategy suggestedFrameForListForPage:bounds:](layoutStrategy, "suggestedFrameForListForPage:bounds:", WeakRetained);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11 - v4;
  double v19 = v13 + 0.0;
  double v20 = v15 - (-v6 - v4);
  double v21 = v17;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (UIEdgeInsets)_listViewDefaultContentInsets
{
  layoutStrategCGFloat y = self->_layoutStrategy;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);
  [(CSLayoutStrategy *)layoutStrategy suggestedContentInsetsForListForPage:WeakRetained];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

- (UIEdgeInsets)_listViewAdjustedContentInsets
{
  [(CSCombinedListViewController *)self _listViewDefaultContentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(CSCombinedListViewController *)self _allowsNotificationListTopInset];
  double v12 = 0.0;
  if (v11) {
    double v12 = v4;
  }
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  result.right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

- (CGSize)_adjunctListViewSize
{
  if ([(CSCombinedListViewController *)self _allowsSeparateAdjunctList])
  {
    double v3 = [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController view];
    objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4F43B90], *(double *)(MEMORY[0x1E4F43B90] + 8));
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v8 = v5;
  double v9 = v7;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)_adjunctListViewSizeIncludingSpacing
{
  if ([(CSCombinedListViewController *)self _allowsSeparateAdjunctList])
  {
    [(CSCombinedListViewController *)self _adjunctListViewSize];
    double v4 = v3;
    double v6 = v5;
    BOOL v7 = [(CSNotificationAdjunctListViewController *)self->_adjunctListViewController isPresentingContent];
    double v8 = 0.0;
    if (v7)
    {
      int v9 = BSFloatGreaterThanFloat();
      double v8 = 8.0;
      if (!v9) {
        double v8 = 0.0;
      }
    }
    double v10 = v6 + v8;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v11 = v4;
  result.CGFloat height = v10;
  result.CGFloat width = v11;
  return result;
}

- (double)_minInsetsToPushDateOffScreen
{
  double v3 = [(CSCombinedListViewController *)self view];
  [v3 bounds];
  double Height = CGRectGetHeight(v11);

  [(CSCombinedListViewController *)self clippingOffset];
  double v6 = v5;
  BOOL v7 = [(CSCombinedListViewController *)self notificationListScrollView];
  [v7 contentSize];
  double v9 = v8;

  return Height + v6 - v9 - self->_cachedAdjunctHeight;
}

- (BOOL)_shouldPadBottomSpacing
{
  double v2 = self;
  double v3 = [(CSCombinedListViewController *)self notificationListScrollView];
  LOBYTE(v2) = -[CSCombinedListViewController _shouldPadBottomSpacingIsDragging:](v2, "_shouldPadBottomSpacingIsDragging:", [v3 isDragging]);

  return (char)v2;
}

- (BOOL)_shouldPadBottomSpacingIsDragging:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CSCombinedListViewController *)self notificationListScrollView];
  [v5 contentSize];

  if (v3) {
    return self->_shouldPadBottomSpacingWhileDragging;
  }
  [(CSCombinedListViewController *)self _minListHeightForPadding];

  return BSFloatGreaterThanFloat();
}

- (double)_minListHeightForPadding
{
  BOOL v3 = [(CSCombinedListViewController *)self notificationListScrollView];
  [v3 bounds];
  double Height = CGRectGetHeight(v9);
  [(CSCombinedListViewController *)self _listViewDefaultContentInsets];
  double v7 = Height - (v5 + v6);

  return v7;
}

- (id)_identifierForNotificationRequest:(id)a3
{
  BOOL v3 = NSString;
  id v4 = a3;
  double v5 = [v4 sectionIdentifier];
  double v6 = [v4 notificationIdentifier];

  double v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return v7;
}

- (id)_threadIdentifierForNotificationRequest:(id)a3
{
  BOOL v3 = NSString;
  id v4 = a3;
  double v5 = [v4 sectionIdentifier];
  double v6 = [v4 threadIdentifier];

  double v7 = [v3 stringWithFormat:@"%@:%@", v5, v6];

  return v7;
}

- (BOOL)_allowsDateViewOrProudLockScroll
{
  double v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  return (v3 & 0xFFFFFFFFFFFFFFFBLL) == 1
      || (unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 1) < 2;
}

- (BOOL)_hasUserInteraction
{
  return [(NSMutableSet *)self->_hasUserInteractionReasons count] != 0;
}

- (void)_removeAllUserInteractionReasons
{
  [(NSMutableSet *)self->_hasUserInteractionReasons removeAllObjects];

  [(CSCombinedListViewController *)self _didUpdateSetHasUserInteraction];
}

- (void)_setHasUserInteraction:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  hasUserInteractionReasons = self->_hasUserInteractionReasons;
  id v10 = v6;
  if (v4)
  {
    if (hasUserInteractionReasons)
    {
      double v8 = hasUserInteractionReasons;
    }
    else
    {
      double v8 = [MEMORY[0x1E4F1CA80] set];
    }
    CGRect v9 = self->_hasUserInteractionReasons;
    self->_hasUserInteractionReasons = v8;

    [(NSMutableSet *)self->_hasUserInteractionReasons addObject:v10];
  }
  else
  {
    [(NSMutableSet *)hasUserInteractionReasons removeObject:v6];
  }
  [(CSCombinedListViewController *)self _didUpdateSetHasUserInteraction];
}

- (void)_didUpdateSetHasUserInteraction
{
  [(CSCombinedListViewController *)self _setQuickActionsHidden:[(CSCombinedListViewController *)self _hasUserInteraction] forReason:@"CSQuickActionsUserInteractionReason"];

  [(CSCoverSheetViewControllerBase *)self rebuildBehavior];
}

- (void)_updateRaiseGestureDetectionForNotificationRequest:(id)a3
{
  id v4 = a3;
  if (v4) {
    int v5 = [(CSCombinedListViewController *)self bs_isAppearingOrAppeared];
  }
  else {
    int v5 = 0;
  }
  id v6 = (void *)*MEMORY[0x1E4FB3750];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3750], OS_LOG_TYPE_DEBUG)) {
    -[CSCombinedListViewController _updateRaiseGestureDetectionForNotificationRequest:](v6);
  }
  double v7 = [MEMORY[0x1E4FA5F90] sharedInstance];
  double v8 = v7;
  if (v5) {
    [v7 addGestureObserver:self];
  }
  else {
    [v7 removeGestureObserver:self];
  }

  [(CSCombinedListViewController *)self setActiveRaiseToListenNotificationRequest:v4];
}

- (void)stateService:(id)a3 didReceiveDoNotDisturbStateUpdate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)*MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    double v7 = v6;
    double v8 = [v5 state];
    CGRect v9 = [(CSCombinedListViewController *)self _modeIdentifierForDNDState:v8];
    id v10 = [v5 previousState];
    CGRect v11 = [(CSCombinedListViewController *)self _modeIdentifierForDNDState:v10];
    *(_DWORD *)buf = 138543618;
    double v16 = v9;
    __int16 v17 = 2114;
    double v18 = v11;
    _os_log_impl(&dword_1D839D000, v7, OS_LOG_TYPE_DEFAULT, "Received DND state update for current mode %{public}@ and previous mode %{public}@", buf, 0x16u);
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__CSCombinedListViewController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke;
  v13[3] = &unk_1E6AD88C0;
  v13[4] = self;
  id v14 = v5;
  id v12 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

void __79__CSCombinedListViewController_stateService_didReceiveDoNotDisturbStateUpdate___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) state];
  [v1 _updateActiveDNDState:v2];
}

- (void)_updateActiveDNDState:(id)a3
{
  id v4 = (DNDState *)a3;
  BSDispatchQueueAssertMain();
  activeDNDState = self->_activeDNDState;
  self->_activeDNDState = v4;

  [(CSCombinedListViewController *)self _updateStructuredListOverrideUserInterfaceStyle];
}

- (int64_t)_uiBacklightLuminanceForBLSBacklightState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return -1;
  }
  else {
    return qword_1D8505BD8[a3];
  }
}

- (void)_updateStructuredListOverrideUserInterfaceStyle
{
  id v3 = [(CSCombinedListViewController *)self traitCollection];
  -[CSCombinedListViewController _updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:](self, "_updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:", [v3 _backlightLuminance]);
}

- (void)_updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance:(int64_t)a3
{
  id v5 = [(CSCombinedListViewController *)self overrideTraitCollectionForChildViewController:self->_structuredListViewController];
  BOOL v6 = [v5 userInterfaceStyle] != 2;

  BOOL v7 = [self->_activeDNDState sb_isDimmingModeActive];
  int v8 = a3 == 1 || v7;
  if (((v6 ^ v8) & 1) == 0)
  {
    int v9 = [MEMORY[0x1E4F42FF0] areAnimationsEnabled];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __102__CSCombinedListViewController__updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance___block_invoke;
    v14[3] = &unk_1E6AD8CD0;
    char v15 = v8;
    v14[4] = self;
    uint64_t v10 = MEMORY[0x1D9487300](v14);
    CGRect v11 = (void *)v10;
    if (v9)
    {
      id v12 = (void *)MEMORY[0x1E4F42FF0];
      double v13 = [(CSCombinedListViewController *)self view];
      [v12 transitionWithView:v13 duration:5242880 options:v11 animations:0 completion:0.2];
    }
    else
    {
      (*(void (**)(uint64_t))(v10 + 16))(v10);
    }
  }
}

void __102__CSCombinedListViewController__updateStructuredListOverrideUserInterfaceStyleWithBacklightLuminance___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  }
  else
  {
    uint64_t v2 = 0;
  }
  id v3 = (id)v2;
  [*(id *)(a1 + 32) setOverrideTraitCollection:v2 forChildViewController:*(void *)(*(void *)(a1 + 32) + 1056)];
  [*(id *)(a1 + 32) setOverrideTraitCollection:v3 forChildViewController:*(void *)(*(void *)(a1 + 32) + 1048)];
  [*(id *)(*(void *)(a1 + 32) + 1208) setShouldRenderInline:*(unsigned __int8 *)(a1 + 40)];
  [*(id *)(a1 + 32) updateAppearanceForController:*(void *)(a1 + 32)];
}

- (void)activeActivityDidChangeForManager:(id)a3
{
  if (self->_focusActivityManager == a3)
  {
    id v4 = [a3 activeActivity];
    [(CSCombinedListViewController *)self _setFooterCallToActionLabelHidden:v4 != 0 forReason:@"Focus Activity"];
  }
}

- (BOOL)_shouldFilterNotificationRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 options];
  if ([v5 overridesDowntime])
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v7 = [v4 sectionIdentifier];
    BOOL v6 = [(CSCombinedListViewController *)self _shouldScreenTimeSuppressNotificationsForBundleIdentifier:v7];
  }
  return v6;
}

- (BOOL)_shouldScreenTimeSuppressNotificationsForBundleIdentifier:(id)a3
{
  p_applicationInformer = &self->_applicationInformer;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_applicationInformer);
  char v6 = [WeakRetained shouldScreenTimeSuppressNotificationsForBundleIdentifier:v4];

  return v6;
}

- (void)_screenTimeExpirationApplicationsDidChange:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v27;
    CGRect v11 = (os_log_t *)MEMORY[0x1E4FB3778];
    *(void *)&long long v8 = 138412546;
    long long v24 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        BOOL v14 = -[CSCombinedListViewController _shouldScreenTimeSuppressNotificationsForBundleIdentifier:](self, "_shouldScreenTimeSuppressNotificationsForBundleIdentifier:", v13, v24);
        os_log_t v15 = *v11;
        BOOL v16 = os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          __int16 v17 = v5;
          if (v16)
          {
            double v18 = v15;
            uint64_t v19 = (objc_class *)objc_opt_class();
            double v20 = NSStringFromClass(v19);
            *(_DWORD *)buf = v24;
            long long v31 = v20;
            __int16 v32 = 2112;
            uint64_t v33 = v13;
            _os_log_impl(&dword_1D839D000, v18, OS_LOG_TYPE_DEFAULT, "%@ received blocked event for screen time expiration for section: %@", buf, 0x16u);

            CGRect v11 = (os_log_t *)MEMORY[0x1E4FB3778];
            __int16 v17 = v5;
          }
        }
        else
        {
          __int16 v17 = v6;
          if (v16)
          {
            double v21 = v15;
            uint64_t v22 = (objc_class *)objc_opt_class();
            int v23 = NSStringFromClass(v22);
            *(_DWORD *)buf = v24;
            long long v31 = v23;
            __int16 v32 = 2112;
            uint64_t v33 = v13;
            _os_log_impl(&dword_1D839D000, v21, OS_LOG_TYPE_DEFAULT, "%@ received unblocked event for screen time expiration for section: %@", buf, 0x16u);

            CGRect v11 = (os_log_t *)MEMORY[0x1E4FB3778];
            __int16 v17 = v6;
          }
        }
        [v17 addObject:v13];
        [(NCNotificationStructuredListViewController *)self->_structuredListViewController toggleFilteringForSectionIdentifier:v13 shouldFilter:v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v9);
  }
}

- (void)dismissDNDBedtimeGreetingViewController:(id)a3 animated:(BOOL)a4
{
}

- (void)_evaluateShouldShowGreeting:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  int v8 = [v6 shouldShowGreeting];
  if (![(CSCombinedListViewController *)self bs_isAppearingOrAppeared]) {
    goto LABEL_15;
  }
  if ((unint64_t)(v7 - 1) < 2)
  {
LABEL_5:
    int v9 = [v6 isGreetingDisabled] ^ 1;
    goto LABEL_10;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
LABEL_15:
      [(CSCombinedListViewController *)self _dismissDNDBedtimeGreetingViewAnimated:v4];
      goto LABEL_16;
    }
    goto LABEL_5;
  }
  uint64_t v10 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v10 userInterfaceIdiom] == 1) {
    int v9 = [v6 isGreetingDisabled] ^ 1;
  }
  else {
    int v9 = 0;
  }

LABEL_10:
  if ((v8 & v9) != 1) {
    goto LABEL_15;
  }
  if (!self->_dndBedtimeGreetingViewController)
  {
    CGRect v11 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
    id v12 = [v11 legibilitySettings];
    uint64_t v13 = [v12 primaryColor];

    BOOL v14 = [[CSDNDBedtimeGreetingViewController alloc] initWithLegibilityPrimaryColor:v13];
    dndBedtimeGreetingViewController = self->_dndBedtimeGreetingViewController;
    self->_dndBedtimeGreetingViewController = v14;

    BOOL v16 = SBLogDoNotDisturbBedtime();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = self->_dndBedtimeGreetingViewController;
      *(_DWORD *)buf = 138543362;
      double v21 = v17;
      _os_log_impl(&dword_1D839D000, v16, OS_LOG_TYPE_DEFAULT, "Presenting greeting view: %{public}@", buf, 0xCu);
    }

    double v18 = self->_dndBedtimeGreetingViewController;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__CSCombinedListViewController__evaluateShouldShowGreeting_animated___block_invoke;
    v19[3] = &unk_1E6AD8820;
    v19[4] = self;
    [(CSCombinedListViewController *)self bs_addChildViewController:v18 animated:v4 transitionBlock:v19];
  }
LABEL_16:
}

void __69__CSCombinedListViewController__evaluateShouldShowGreeting_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 1240);
  uint64_t v7 = a2;
  [v4 setDelegate:v3];
  [*(id *)(a1 + 32) _setNotificationListHidden:1 forReason:@"Bedtime Greeting"];
  [*(id *)(a1 + 32) _setDisableBackgroundAnimation:1 forReason:@"Bedtime Greeting"];
  [*(id *)(a1 + 32) _setFooterCallToActionLabelHidden:1 forReason:@"Bedtime Greeting"];
  id v5 = *(void **)(a1 + 32);
  id v6 = +[CSAction actionWithType:7];
  [v5 sendAction:v6];

  v7[2]();
}

- (void)_dismissDNDBedtimeGreetingViewAnimated:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_dndBedtimeGreetingViewController)
  {
    BOOL v3 = a3;
    id v5 = SBLogDoNotDisturbBedtime();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dndBedtimeGreetingViewController = self->_dndBedtimeGreetingViewController;
      *(_DWORD *)buf = 138543362;
      id v12 = dndBedtimeGreetingViewController;
      _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing greeting view: %{public}@", buf, 0xCu);
    }

    double v7 = 0.3;
    int v8 = self->_dndBedtimeGreetingViewController;
    v9[1] = 3221225472;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[2] = __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke;
    v9[3] = &unk_1E6ADA068;
    if (!v3) {
      double v7 = 0.0;
    }
    *(double *)&void v9[5] = v7;
    v9[4] = self;
    BOOL v10 = v3;
    [(CSCombinedListViewController *)self bs_removeChildViewController:v8 animated:v3 transitionBlock:v9];
  }
}

void __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F42FF0];
  double v3 = *(double *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke_2;
  v6[3] = &unk_1E6AD8CD0;
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 48);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke_3;
  v5[3] = &unk_1E6AD8A40;
  v5[4] = v7;
  BOOL v4 = a2;
  [v2 animateWithDuration:v6 animations:v5 completion:v3];
  v4[2](v4);
}

uint64_t __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = +[CSAction actionWithType:8 animated:*(unsigned __int8 *)(a1 + 40)];
  [v2 sendAction:v3];

  BOOL v4 = [*(id *)(*(void *)(a1 + 32) + 1240) view];
  [v4 setAlpha:0.0];

  id v5 = *(void **)(a1 + 32);

  return [v5 _setNotificationListHidden:0 forReason:@"Bedtime Greeting"];
}

void __71__CSCombinedListViewController__dismissDNDBedtimeGreetingViewAnimated___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDisableBackgroundAnimation:0 forReason:@"Bedtime Greeting"];
  [*(id *)(a1 + 32) _setFooterCallToActionLabelHidden:0 forReason:@"Bedtime Greeting"];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 1240);
  *(void *)(v2 + 1240) = 0;
}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __98__CSCombinedListViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v4[3] = &unk_1E6AD87F8;
  v4[4] = self;
  [a4 addAnimations:v4];
}

void __98__CSCombinedListViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1056) view];
  double v3 = [*(id *)(*(void *)(a1 + 32) + 1048) view];
  BOOL v4 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __98__CSCombinedListViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
  BOOL v10 = &unk_1E6AD88C0;
  id v11 = v3;
  id v12 = v2;
  id v5 = v2;
  id v6 = v3;
  [v4 performWithoutAnimation:&v7];
  objc_msgSend(v5, "pl_performCrossFadeIfNecessary", v7, v8, v9, v10);
}

uint64_t __98__CSCombinedListViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 layoutIfNeeded];
}

- (void)_setInlineContentHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CSComponent *)self->_remoteInlineContentComponent isHidden] != a3)
  {
    [(CSComponent *)self->_remoteInlineContentComponent setHidden:v3];
    [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  }
}

- (void)_setQuickActionsHidden:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  id v12 = a4;
  if (v12)
  {
    uint64_t v6 = [(NSMutableSet *)self->_quickActionsHiddenReasons count];
    quickActionsHiddenReasons = self->_quickActionsHiddenReasons;
    if (v4)
    {
      if (!quickActionsHiddenReasons)
      {
        uint64_t v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
        int v9 = self->_quickActionsHiddenReasons;
        self->_quickActionsHiddenReasons = v8;

        quickActionsHiddenReasons = self->_quickActionsHiddenReasons;
      }
      [(NSMutableSet *)quickActionsHiddenReasons addObject:v12];
    }
    else
    {
      [(NSMutableSet *)quickActionsHiddenReasons removeObject:v12];
    }
    BOOL v10 = self->_quickActionsHiddenReasons;
    if (v10)
    {
      BOOL v11 = [(NSMutableSet *)v10 count] != 0;
      if ((v6 == 0) != v11) {
        goto LABEL_13;
      }
    }
    else
    {
      if (!v6) {
        goto LABEL_13;
      }
      BOOL v11 = 0;
    }
    [(CSComponent *)self->_quickActionsComponent setHidden:v11];
    [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  }
LABEL_13:
}

- (void)updateForLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(NCNotificationStructuredListViewController *)self->_structuredListViewController adjustForLegibilitySettingsChange:v5];
  }
}

- (id)_modeIdentifierForDNDState:(id)a3
{
  BOOL v3 = [a3 activeModeConfiguration];
  BOOL v4 = [v3 mode];
  id v5 = [v4 modeIdentifier];

  return v5;
}

- (BOOL)_shouldPreventNotificationHistoryRevealForActiveDNDState
{
  activeDNDState = self->_activeDNDState;
  if (activeDNDState) {
    LOBYTE(activeDNDState) = [activeDNDState sb_isDrivingModeActive];
  }
  return (char)activeDNDState;
}

- (void)_toggleGestureStudyInteractionIfNecessary
{
  BOOL v3 = [(CSCombinedListViewController *)self hasContent];
  gestureStudyInteraction = self->_gestureStudyInteraction;
  if (v3)
  {
    if (!gestureStudyInteraction) {
      return;
    }
    id v5 = [(CSCombinedListViewController *)self view];
    [v5 removeInteraction:self->_gestureStudyInteraction];

    uint64_t v6 = self->_gestureStudyInteraction;
    self->_gestureStudyInteraction = 0;
  }
  else
  {
    if (gestureStudyInteraction) {
      return;
    }
    uint64_t v7 = (_UIGestureStudyInteraction *)[objc_alloc(MEMORY[0x1E4F43168]) initWithDelegate:self];
    uint64_t v8 = self->_gestureStudyInteraction;
    self->_gestureStudyInteraction = v7;

    id v9 = [(CSCombinedListViewController *)self view];
    [v9 addInteraction:self->_gestureStudyInteraction];
    uint64_t v6 = (_UIGestureStudyInteraction *)v9;
  }
}

- (void)_startScreenOnTimer
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  screenOnTime = self->_screenOnTime;
  self->_screenOnTime = v3;

  MEMORY[0x1F41817F8](v3, screenOnTime);
}

- (void)_stopScreenOnTimer
{
  self->_screenOnTime = 0;
  MEMORY[0x1F41817F8]();
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  BOOL v4 = [(CSLockScreenSettings *)self->_lockScreenSettings dashBoardNotificationScrollSettings];
}

- (void)forceNotificationHistoryRevealed:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)migrateIncomingNotificationsToNotificationCenter
{
}

- (id)_testingNotificationRequestWithIdentifier:(id)a3 sectionIdentifier:(id)a4
{
  return (id)[(NCNotificationStructuredListViewController *)self->_structuredListViewController notificationRequestWithNotificationIdentifier:a3 sectionIdentifier:a4];
}

- (void)_testingExpandCoalescedBundleForNotificationRequest:(id)a3 withCompletion:(id)a4
{
}

- (void)_testingCoalesceExpandedBundleForNotificationRequest:(id)a3 withCompletion:(id)a4
{
}

- (void)_testingClearAllNotificationRequests
{
  id v5 = [(CSCombinedListViewController *)self dispatcher];
  BOOL v3 = [v5 notificationSectionSettingsForDestination:self];
  BOOL v4 = objc_msgSend(v3, "bs_map:", &__block_literal_global_12);
  [v5 destination:self clearNotificationRequestsInSections:v4];
}

uint64_t __68__CSCombinedListViewController__testingClearAllNotificationRequests__block_invoke(uint64_t a1, void *a2)
{
  return [a2 sectionIdentifier];
}

- (void)setOverrideNotificationListDisplayStyleSetting:(int64_t)a3
{
}

- (void)resetOverrideNotificationListDisplayStyleSetting
{
}

- (BOOL)hasContent
{
  return self->_listPresentingContent;
}

- (CSCombinedListViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSCombinedListViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSApplicationInforming)applicationInformer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_applicationInformer);

  return (CSApplicationInforming *)WeakRetained;
}

- (CSUserPresenceMonitor)userPresenceMonitor
{
  return self->_userPresenceMonitor;
}

- (CSNotificationDispatcher)dispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dispatcher);

  return (CSNotificationDispatcher *)WeakRetained;
}

- (void)setDispatcher:(id)a3
{
}

- (CSLayoutStrategy)layoutStrategy
{
  return self->_layoutStrategy;
}

- (void)setLayoutStrategy:(id)a3
{
}

- (BOOL)isShowingFocusActivityView
{
  return self->_showingFocusActivityView;
}

- (void)setShowingFocusActivityView:(BOOL)a3
{
  self->_showingFocusActivityView = a3;
}

- (CSPageViewControllerProtocol)page
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_page);

  return (CSPageViewControllerProtocol *)WeakRetained;
}

- (void)setPage:(id)a3
{
}

- (CSScrollablePageViewControllerProtocol)scrollablePage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollablePage);

  return (CSScrollablePageViewControllerProtocol *)WeakRetained;
}

- (void)setScrollablePage:(id)a3
{
}

- (CSHomeAffordanceControlling)homeAffordanceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceController);

  return (CSHomeAffordanceControlling *)WeakRetained;
}

- (void)setHomeAffordanceController:(id)a3
{
}

- (CSPlatterHomeGestureManaging)platterHomeGestureManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platterHomeGestureManager);

  return (CSPlatterHomeGestureManaging *)WeakRetained;
}

- (void)setPlatterHomeGestureManager:(id)a3
{
}

- (CSUnlockRequesting)unlockRequester
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unlockRequester);

  return (CSUnlockRequesting *)WeakRetained;
}

- (void)setUnlockRequester:(id)a3
{
}

- (CSNotificationPresenting)notificationPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationPresenter);

  return (CSNotificationPresenting *)WeakRetained;
}

- (void)setNotificationPresenter:(id)a3
{
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_authenticationStatusProvider);

  return (SBFAuthenticationStatusProvider *)WeakRetained;
}

- (void)setAuthenticationStatusProvider:(id)a3
{
}

- (CSProximitySensorProviding)proximitySensorProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proximitySensorProvider);

  return (CSProximitySensorProviding *)WeakRetained;
}

- (CSDeviceOrientationProviding)deviceOrientationProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceOrientationProvider);

  return (CSDeviceOrientationProviding *)WeakRetained;
}

- (void)setDeviceOrientationProvider:(id)a3
{
}

- (CSRemoteContentInlineProviding)remoteContentInlineProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteContentInlineProvider);

  return (CSRemoteContentInlineProviding *)WeakRetained;
}

- (CSCoverSheetViewPresenting)coverSheetViewPresenting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetViewPresenting);

  return (CSCoverSheetViewPresenting *)WeakRetained;
}

- (void)setCoverSheetViewPresenting:(id)a3
{
}

- (CSCoverSheetGestureHandling)coverSheetGestureHandling
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coverSheetGestureHandling);

  return (CSCoverSheetGestureHandling *)WeakRetained;
}

- (void)setCoverSheetGestureHandling:(id)a3
{
}

- (CSActivityItemObserving)activityItemObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityItemObserver);

  return (CSActivityItemObserving *)WeakRetained;
}

- (void)setActivityItemObserver:(id)a3
{
}

- (BOOL)showNotificationsInAlwaysOn
{
  return self->_showNotificationsInAlwaysOn;
}

- (BOOL)isInteractingWithNotificationList
{
  return self->_interactingWithNotificationList;
}

- (CSCombinedListViewControllerNotificationObserver)notificationObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationObserver);

  return (CSCombinedListViewControllerNotificationObserver *)WeakRetained;
}

- (void)setNotificationObserver:(id)a3
{
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (CSCombinedListViewControllerAudioCategoriesObserver)audioCategoriesObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioCategoriesObserver);

  return (CSCombinedListViewControllerAudioCategoriesObserver *)WeakRetained;
}

- (void)setAudioCategoriesObserver:(id)a3
{
}

- (CSNotificationAdjunctListViewController)adjunctListViewController
{
  return self->_adjunctListViewController;
}

- (void)setAdjunctListViewController:(id)a3
{
}

- (CSListItemManager)supplementaryItemManager
{
  return self->_supplementaryItemManager;
}

- (void)setSupplementaryItemManager:(id)a3
{
}

- (NSMutableDictionary)adjunctViewControllersByIdentifier
{
  return self->_adjunctViewControllersByIdentifier;
}

- (void)setAdjunctViewControllersByIdentifier:(id)a3
{
}

- (NSMutableDictionary)supplementaryItemContainersByIdentifier
{
  return self->_supplementaryItemContainersByIdentifier;
}

- (void)setSupplementaryItemContainersByIdentifier:(id)a3
{
}

- (NSLayoutConstraint)adjunctListViewTopConstraint
{
  return self->_adjunctListViewTopConstraint;
}

- (void)setAdjunctListViewTopConstraint:(id)a3
{
}

- (NCNotificationRequest)activeRaiseToListenNotificationRequest
{
  return self->_activeRaiseToListenNotificationRequest;
}

- (void)setActiveRaiseToListenNotificationRequest:(id)a3
{
}

- (NCNotificationViewController)activePlatterHomeAffordanceOwningNotificationViewController
{
  return self->_activePlatterHomeAffordanceOwningNotificationViewController;
}

- (void)setActivePlatterHomeAffordanceOwningNotificationViewController:(id)a3
{
}

- (DNDEventBehaviorResolutionService)dndEventBehaviorResolutionService
{
  return self->_dndEventBehaviorResolutionService;
}

- (void)setDndEventBehaviorResolutionService:(id)a3
{
}

- (DNDStateService)dndStateService
{
  return self->_dndStateService;
}

- (void)setDndStateService:(id)a3
{
}

- (CSLockScreenSettings)lockScreenSettings
{
  return self->_lockScreenSettings;
}

- (void)setLockScreenSettings:(id)a3
{
}

- (SBFTouchPassThroughView)debugViewLeft
{
  return self->_debugViewLeft;
}

- (void)setDebugViewLeft:(id)a3
{
}

- (SBFTouchPassThroughView)debugViewRight
{
  return self->_debugViewRight;
}

- (void)setDebugViewRight:(id)a3
{
}

- (NSMutableSet)hasUserInteractionReasons
{
  return self->_hasUserInteractionReasons;
}

- (void)setHasUserInteractionReasons:(id)a3
{
}

- (BOOL)_disableScrolling
{
  return self->_disableScrolling;
}

- (BOOL)_isScreenOn
{
  return self->_screenOn;
}

- (BOOL)disableBackgroundAnimation
{
  return self->_disableBackgroundAnimation;
}

- (BOOL)footerCallToActionLabelHidden
{
  return self->_footerCallToActionLabelHidden;
}

- (BOOL)notificationListHidden
{
  return self->_notificationListHidden;
}

- (BOOL)dismissGestureDisabled
{
  return self->_dismissGestureDisabled;
}

- (BOOL)hasPresentationDirtiedAppearance
{
  return self->_presentationDirtiedAppearance;
}

- (void)setPresentationDirtiedAppearance:(BOOL)a3
{
  self->_presentationDirtiedAppearance = a3;
}

- (UIViewController)digestOnboardingSuggestionViewController
{
  return self->_digestOnboardingSuggestionViewController;
}

- (void)setDigestOnboardingSuggestionViewController:(id)a3
{
}

- (SBSLockScreenContentAssertion)digestOnboardingSuggestionViewControllerAssertion
{
  return self->_digestOnboardingSuggestionViewControllerAssertion;
}

- (void)setDigestOnboardingSuggestionViewControllerAssertion:(id)a3
{
}

- (BOOL)allowsDNDStateService
{
  return self->_allowsDNDStateService;
}

- (void)setAllowsDNDStateService:(BOOL)a3
{
  self->_allowsDNDStateService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionViewControllerAssertion, 0);
  objc_storeStrong((id *)&self->_digestOnboardingSuggestionViewController, 0);
  objc_storeStrong((id *)&self->_hasUserInteractionReasons, 0);
  objc_storeStrong((id *)&self->_debugViewRight, 0);
  objc_storeStrong((id *)&self->_debugViewLeft, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_storeStrong((id *)&self->_dndStateService, 0);
  objc_storeStrong((id *)&self->_dndEventBehaviorResolutionService, 0);
  objc_storeStrong((id *)&self->_activePlatterHomeAffordanceOwningNotificationViewController, 0);
  objc_storeStrong((id *)&self->_activeRaiseToListenNotificationRequest, 0);
  objc_storeStrong((id *)&self->_adjunctListViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_supplementaryItemContainersByIdentifier, 0);
  objc_storeStrong((id *)&self->_adjunctViewControllersByIdentifier, 0);
  objc_storeStrong((id *)&self->_supplementaryItemManager, 0);
  objc_storeStrong((id *)&self->_adjunctListViewController, 0);
  objc_destroyWeak((id *)&self->_audioCategoriesObserver);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_destroyWeak((id *)&self->_notificationObserver);
  objc_destroyWeak((id *)&self->_activityItemObserver);
  objc_destroyWeak((id *)&self->_coverSheetGestureHandling);
  objc_destroyWeak((id *)&self->_coverSheetViewPresenting);
  objc_destroyWeak((id *)&self->_remoteContentInlineProvider);
  objc_destroyWeak((id *)&self->_deviceOrientationProvider);
  objc_destroyWeak((id *)&self->_proximitySensorProvider);
  objc_destroyWeak((id *)&self->_authenticationStatusProvider);
  objc_destroyWeak((id *)&self->_notificationPresenter);
  objc_destroyWeak((id *)&self->_unlockRequester);
  objc_destroyWeak((id *)&self->_platterHomeGestureManager);
  objc_destroyWeak((id *)&self->_homeAffordanceController);
  objc_destroyWeak((id *)&self->_scrollablePage);
  objc_destroyWeak((id *)&self->_page);
  objc_storeStrong((id *)&self->_layoutStrategy, 0);
  objc_destroyWeak((id *)&self->_dispatcher);
  objc_storeStrong((id *)&self->_userPresenceMonitor, 0);
  objc_destroyWeak((id *)&self->_applicationInformer);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_focusActivityManager, 0);
  objc_storeStrong((id *)&self->_breakthroughContentObservers, 0);
  objc_storeStrong((id *)&self->_activeDNDState, 0);
  objc_storeStrong((id *)&self->_deviceWakeProximitySensorAssertionCaptureTime, 0);
  objc_storeStrong((id *)&self->_deviceWakeProximitySensorAssertion, 0);
  objc_storeStrong((id *)&self->_notificationLongPressProximitySensorAssertion, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_currentPresentationUpdateCauses, 0);
  objc_storeStrong((id *)&self->_screenOnTime, 0);
  objc_storeStrong((id *)&self->_gestureStudyInteraction, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_dismissGestureDisabledReasons, 0);
  objc_storeStrong((id *)&self->_notificationListHiddenReasons, 0);
  objc_storeStrong((id *)&self->_footerCallToActionHiddenReasons, 0);
  objc_storeStrong((id *)&self->_backgroundAnimationDisabledReasons, 0);
  objc_storeStrong((id *)&self->_dndBedtimeGreetingViewController, 0);
  objc_storeStrong((id *)&self->_dndBedtimeController, 0);
  objc_storeStrong((id *)&self->_quickActionsComponent, 0);
  objc_storeStrong((id *)&self->_quickActionsHiddenReasons, 0);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerComponent, 0);
  objc_storeStrong((id *)&self->_statusBarComponent, 0);
  objc_storeStrong((id *)&self->_footerCallToActionLabelComponent, 0);
  objc_storeStrong((id *)&self->_homeAffordanceComponent, 0);
  objc_storeStrong((id *)&self->_proudLockComponent, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundComponent, 0);
  objc_storeStrong((id *)&self->_remoteInlineContentComponent, 0);
  objc_storeStrong((id *)&self->_complicationContainerComponent, 0);
  objc_storeStrong((id *)&self->_dateViewComponent, 0);
  objc_storeStrong((id *)&self->_overrideNotificationListDisplayStyleAssertions, 0);
  objc_storeStrong((id *)&self->_significantUserInteractionTimer, 0);
  objc_storeStrong((id *)&self->_clippingView, 0);
  objc_storeStrong((id *)&self->_notificationContainerViewAssertions, 0);
  objc_storeStrong((id *)&self->_containerViewForExpandedNotificationContent, 0);
  objc_storeStrong((id *)&self->_structuredListViewController, 0);

  objc_storeStrong((id *)&self->_captureOnlyMaterialViewController, 0);
}

- (void)viewWillDisappear:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  BOOL v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  BOOL v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D839D000, v5, v6, "%{public}@ stopped listening to raise gesture", v7, v8, v9, v10, v11);
}

- (void)notificationStructuredListViewControllerDidSignificantUserInteraction:.cold.1()
{
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_1D839D000, v1, v2, "%@", v3, v4, v5, v6, v7);
}

- (void)notificationStructuredListViewControllerDidUpdateVisibleContentExtent:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1D839D000, log, OS_LOG_TYPE_DEBUG, "Updating presentation because visible Notification List View Controller visible content extent changed", v1, 2u);
}

- (void)notificationStructuredListViewController:(void *)a1 requestsPresentingFocusActivityPickerFromView:.cold.1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0(&dword_1D839D000, v5, v6, "%{public}@ presenting focus activity picker from notification list", v7, v8, v9, v10, v11);
}

- (void)handleEvent:(void *)a1 .cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = (objc_class *)OUTLINED_FUNCTION_3_0();
  uint64_t v4 = NSStringFromClass(v3);
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D839D000, v1, OS_LOG_TYPE_ERROR, "Destination %{public}@ resetting user interaction on screen ON", v5, 0xCu);
}

- (void)handleEvent:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_3(&dword_1D839D000, v2, v3, "Destination %@ handled home button tap dismissing long look", v4, v5, v6, v7, v8);
}

- (void)_updatePresentationForReason:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_1D839D000, v0, OS_LOG_TYPE_ERROR, "CSCombinedListViewController attempted a second presentation update for reason: %@", v1, 0xCu);
}

- (void)_updateRaiseGestureDetectionForNotificationRequest:(void *)a1 .cold.1(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_4();
  __int16 v6 = 2114;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_1D839D000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@ to raise gesture", v5, 0x16u);
}

@end