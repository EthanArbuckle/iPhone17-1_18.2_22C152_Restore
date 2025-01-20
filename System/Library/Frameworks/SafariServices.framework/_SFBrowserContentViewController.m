@interface _SFBrowserContentViewController
+ (void)createDefaultWebsiteDataStore;
- (BOOL)_canSaveWebpage;
- (BOOL)_canSaveWebpageForURL:(id)a3;
- (BOOL)_canScrollToTopInView:(id)a3;
- (BOOL)_canShowDownloadWithoutPrompting:(id)a3;
- (BOOL)_canShowPageFormatMenu;
- (BOOL)_canTranslateWebpages;
- (BOOL)_currentlyEditingText;
- (BOOL)_dismissTransientUIAnimated:(BOOL)a3;
- (BOOL)_effectiveBarCollapsingEnabled;
- (BOOL)_hideFindOnPage;
- (BOOL)_isPresentedAsSheet;
- (BOOL)_isPreviewing;
- (BOOL)_isSplitScreen;
- (BOOL)_isUsedForAuthentication;
- (BOOL)_notifyInitialLoadDidFinish:(BOOL)a3;
- (BOOL)_onlyWantsWebAppShortcuts;
- (BOOL)_personaShouldUseScreenTime;
- (BOOL)_readerViewControllerNeedsSetUp;
- (BOOL)_redirectToHostAppForAuthenticationSession:(id)a3;
- (BOOL)_redirectToHostAppWithNavigationResult:(id)a3 options:(id)a4;
- (BOOL)_safeAreaShouldAffectWebViewObscuredInsets;
- (BOOL)_shouldAllowAutomaticReader;
- (BOOL)_shouldAllowUniversalLinkBanner;
- (BOOL)_shouldGoBackToOwnerWebView;
- (BOOL)_shouldReloadImmediatelyAfterPageLoadError;
- (BOOL)_shouldUpdateCurrentScrollViewInsets;
- (BOOL)_showICSControllerForPath:(id)a3 sourceURL:(id)a4;
- (BOOL)_suppressReloadToPreventLoadingJavaScriptIfNecessary;
- (BOOL)_updateAppInfoOverlayForBanner:(id)a3;
- (BOOL)_usesScrollToTopView;
- (BOOL)_willURLOpenHostApp:(id)a3;
- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3;
- (BOOL)allowsBrowsingAssistant;
- (BOOL)becomeFirstResponder;
- (BOOL)browserHasMultipleProfiles;
- (BOOL)canAddToBookmarks;
- (BOOL)canAddToQuickNote;
- (BOOL)canAddToReadingList;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canFindOnPage;
- (BOOL)canHideToolbar;
- (BOOL)canMoveToTabGroup;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPrint;
- (BOOL)canPrintCurrentTab;
- (BOOL)canReadActiveLanguage;
- (BOOL)canTogglePinningTab;
- (BOOL)createFluidProgressState;
- (BOOL)currentTabIsPinned;
- (BOOL)didNotifyInitialLoadFinish;
- (BOOL)dynamicBarAnimator:(id)a3 canTransitionToState:(int64_t)a4 byDraggingWithOffset:(double)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasDedicatedDownloadsToolbarItem;
- (BOOL)hasDedicatedExtensionsButton;
- (BOOL)hasDedicatedMediaStateButton;
- (BOOL)hasEnteredScribbleMode;
- (BOOL)hasFailedURL;
- (BOOL)hasUnviewedDownloads;
- (BOOL)isBlockedByScreenTime;
- (BOOL)isDisplayingQuickLookDocumentForCustomizationController:(id)a3;
- (BOOL)isNavigatingViaReloadWithoutPrivateRelay;
- (BOOL)isPageEligibileToShowNotSecureWarning;
- (BOOL)isPlayingAudio;
- (BOOL)isPrivate;
- (BOOL)isPrivateBrowsing;
- (BOOL)isPrivateBrowsingEnabled;
- (BOOL)isReaderAvailableForCustomizationController:(id)a3;
- (BOOL)isSafariRestricted;
- (BOOL)isSecure;
- (BOOL)isShowingErrorPage;
- (BOOL)isShowingReader;
- (BOOL)isShowingReaderForCustomizationController:(id)a3;
- (BOOL)isShowingSystemStartPage;
- (BOOL)keepBarsMinimized;
- (BOOL)linkPreviewHelper:(id)a3 supportsAction:(int64_t)a4 forURL:(id)a5;
- (BOOL)pageLoadErrorControllerShouldHandleCertificateError:(id)a3;
- (BOOL)pageLoadErrorControllerShouldPermanentlyAcceptCertificate:(id)a3;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)printControllerCanPresentPrintUI:(id)a3;
- (BOOL)printControllerPageIsLoading:(id)a3;
- (BOOL)printControllerShouldPrintReader:(id)a3;
- (BOOL)privacyReportShouldSeparateBlockedTrackers;
- (BOOL)readerViewIsVisibleForMailContentProvider:(id)a3;
- (BOOL)remoteSwipeGestureEnabled;
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (BOOL)shouldBlockAppSuggestionBanner:(id)a3;
- (BOOL)shouldShowListeningControls;
- (BOOL)storeBannersAreDisabled;
- (BOOL)supportsAdvancedPrivacyProtectionsForURL:(id)a3;
- (BOOL)supportsPrivacyReport;
- (BOOL)supportsSiriReadThis;
- (BOOL)translationContextIsUsingPrivateBrowsing:(id)a3;
- (BOOL)viewDidAppearInHostApp;
- (BOOL)wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections;
- (BOOL)wasLoadedWithContentBlockersEnabled;
- (BOOL)wasLoadedWithPrivateRelay;
- (BOOL)webViewControllerCanFindNextOrPrevious:(id)a3;
- (BOOL)webViewControllerCanPromptForAccountSecurityRecommendation:(id)a3;
- (BOOL)webViewControllerShouldAutofillESimInformation:(id)a3;
- (BOOL)webViewControllerShouldFillStringForFind:(id)a3;
- (BOOL)webViewLayoutUnderlapsStatusBar;
- (NSArray)linkActions;
- (NSArray)normalBrowsingUserContentControllers;
- (NSString)_hostAppBundleId;
- (NSString)bundleIdentifierForProfileInstallation;
- (NSURL)URLForPerSitePreferences;
- (NSUUID)uuid;
- (SFContentBlockerManager)contentBlockerManager;
- (SFNavigationBarItem)navigationBarItem;
- (SFReaderContext)readerContext;
- (SFReaderEnabledWebViewController)rootWebViewController;
- (SFReaderEnabledWebViewController)webViewController;
- (SFSafariViewControllerConfiguration)configuration;
- (SFScribbleController)sfScribbleController;
- (SFWebExtensionsController)webExtensionsController;
- (UIColor)preferredBarTintColor;
- (UIColor)preferredControlTintColor;
- (UIEdgeInsets)_effectiveWebViewSafeAreaInsets;
- (WBSBrowsingAssistantController)assistantController;
- (WBSPrivateBrowsingUserDefinedContentBlockerManager)privateBrowsingUserDefinedContentBlockerManager;
- (WBSScribbleQuirksManager)scribbleQuirksManager;
- (WBSTranslationContext)translationContext;
- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager;
- (WBSWebExtensionTab)activeTabForExtensions;
- (WKPreferences)wkPreferences;
- (WKUserContentController)userContentController;
- (WKWebView)webView;
- (_SFBrowserContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_SFBrowserContentViewControllerDelegate)delegate;
- (_SFBrowserView)browserView;
- (_SFNavigationUtilitiesManager)_navigationUtilitiesManager;
- (_SFPageZoomPreferenceManager)pageZoomManager;
- (_SFPerSitePreferencesVendor)perSitePreferencesVendor;
- (_SFReloadOptionsController)reloadOptionsController;
- (_WKActivatedElementInfo)activatedElementInfo;
- (double)_bottomToolbarHeight;
- (double)_crashBannerDraggingOffsetForContentOffset:(CGPoint)a3;
- (double)_maximumHeightObscuredByBottomBar;
- (double)_offsetForDynamicBarAnimator;
- (double)dynamicBarAnimator:(id)a3 minimumTopBarHeightForOffset:(double)a4;
- (double)estimatedProgress;
- (id)_EVOrganizationName;
- (id)_applicationPayloadForOpeningInSafari;
- (id)_committedDomainForPreferences;
- (id)_contextMenuConfigurationForWebView:(id)a3 element:(id)a4;
- (id)_contextMenuContentPreviewForWebView:(id)a3 element:(id)a4;
- (id)_createPersistentDataStoreWithConfiguration:(id)a3;
- (id)_currentWebView;
- (id)_digitalHealthManager;
- (id)_fallbackURLForWellKnownChangePasswordURL:(id)a3;
- (id)_fallbackURLForWellKnownChangePasswordURLFromQuirks:(id)a3;
- (id)_homePageURLToUseAsFallbackWhenTryingToChangePassword:(id)a3;
- (id)_itemProviderCollectionForSharingURL:(id)a3 title:(id)a4;
- (id)_mailContentProvider;
- (id)_makeReaderViewController;
- (id)_openNewWebViewIfNeededWithConfiguration:(id)a3 forNavigationAction:(id)a4;
- (id)_quickLookDocumentForDownload:(id)a3;
- (id)_requestBySettingAdvancedPrivacyProtectionsFlag:(id)a3;
- (id)currentFluidProgressStateSource;
- (id)currentHostForScribbleController:(id)a3;
- (id)dataForQuickLookDocument:(id)a3;
- (id)expectedOrCurrentURL;
- (id)handoffURL;
- (id)legacyTLSHostManager;
- (id)linkPreviewHelper:(id)a3 previewViewControllerForURL:(id)a4;
- (id)linkPreviewHelper:(id)a3 resultOfLoadingURL:(id)a4;
- (id)navigationBarURLForSharing:(id)a3;
- (id)newProcessPool;
- (id)overlayContainerViewForScribbleController:(id)a3;
- (id)pageFormatMenuController;
- (id)pageLoadErrorControllerGetSecIdentityPreferencesController:(id)a3;
- (id)printControllerForContentProvider:(id)a3;
- (id)processPool;
- (id)processPoolConfiguration;
- (id)progressState;
- (id)quickLookDocument;
- (id)quickLookDocumentForCurrentBackForwardListItem;
- (id)readerControllerForMailContentProvider:(id)a3;
- (id)resultOfLoadingRequest:(id)a3 inMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5;
- (id)safariApplicationVersionForTranslationContext:(id)a3;
- (id)sfWebExtensionsControllersContentBlockerManagersForAllProfiles:(id)a3;
- (id)sfWebExtensionsControllersForAllProfiles:(id)a3;
- (id)suggestedFileExtensionForQuickLookDocument:(id)a3;
- (id)suggestedFileNameForQuickLookDocument:(id)a3;
- (id)webViewConfiguration;
- (id)webViewController:(id)a3 contextMenuContentPreviewForElement:(id)a4;
- (id)webViewController:(id)a3 didStartDownload:(id)a4;
- (id)webViewForCustomizationController:(id)a3;
- (id)webViewForMailContentProvider:(id)a3;
- (id)websiteDataStore;
- (id)websiteDataStoreConfiguration;
- (int64_t)_persona;
- (int64_t)dismissButtonStyle;
- (int64_t)displayMode;
- (int64_t)hostAppModalPresentationStyle;
- (int64_t)preferredStatusBarStyle;
- (int64_t)safariDataSharingMode;
- (int64_t)siriReaderPlaybackStateForActiveTab;
- (int64_t)webViewController:(id)a3 presentationPolicyForDialog:(id)a4;
- (unint64_t)downloadsCount;
- (unint64_t)mediaStateIcon;
- (void)_cancelPendingUpdateUserActivityTimer;
- (void)_checkForAppLink;
- (void)_cleanUpAfterRedirectToExternalApp;
- (void)_cleanUpWebViewController:(id)a3;
- (void)_closePreviewDocumentTimerFired:(id)a3;
- (void)_completeRedirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 dialogResult:(int64_t)a5;
- (void)_decreasePageZoomSetting;
- (void)_determineResultOfLoadingRequest:(id)a3 inMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 completionHandler:(id)a6;
- (void)_didCompleteScrolling;
- (void)_didCompleteViewSizeTransition;
- (void)_didDecideNavigationPolicy:(int64_t)a3 forNavigationAction:(id)a4;
- (void)_didDecideNavigationPolicy:(int64_t)a3 forNavigationResponse:(id)a4;
- (void)_dismiss;
- (void)_emailCurrentPageWithPreferredContentType:(int64_t)a3;
- (void)_fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4 completion:(id)a5;
- (void)_fetchSharingURLWithCompletionHandler:(id)a3;
- (void)_getSafariDataSharingModeWithCompletion:(id)a3;
- (void)_goBack;
- (void)_goForward;
- (void)_hideCrashBanner;
- (void)_hideDigitalHealthOverlay;
- (void)_hideNavigationBarGestureRecognized:(id)a3;
- (void)_hideQuickLookDocumentView;
- (void)_hideReaderAnimated:(BOOL)a3 deactivationMode:(unint64_t)a4;
- (void)_increasePageZoomSetting;
- (void)_initialLoadFinishedWithSuccess:(BOOL)a3;
- (void)_initializeWebKitExperimentalFeatures;
- (void)_internalWebViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)_internalWebViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 withResult:(id)a5 decisionHandler:(id)a6;
- (void)_invalidateEVOrganizationName;
- (void)_invalidatePreviewCloseTimer;
- (void)_invalidateUserActivity;
- (void)_invalidateWebViewControllers;
- (void)_invokeCustomActivity;
- (void)_layOutBrowserViewForSizeTransition;
- (void)_openCurrentURLInSafari;
- (void)_perSiteAutomaticReaderActivationPreferenceDidChange:(id)a3;
- (void)_perSiteLockdownModePreferenceDidChange:(id)a3;
- (void)_perSitePageZoomPreferenceDidChange:(id)a3;
- (void)_popWebViewController;
- (void)_presentActivityViewController;
- (void)_presentSaveWebpageViewController;
- (void)_presentTranslationConsentAlertWithType:(unint64_t)a3 completionHandler:(id)a4;
- (void)_pushWebViewController:(id)a3;
- (void)_queueAlertForRedirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 isMainFrame:(BOOL)a5 promptPolicy:(int64_t)a6 userAction:(id)a7;
- (void)_receivedTouchDown:(id)a3;
- (void)_receivedTouchUp:(id)a3;
- (void)_redirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 promptPolicy:(int64_t)a5 isMainFrame:(BOOL)a6 userAction:(id)a7;
- (void)_redirectToNewsIfNeededForRequest:(id)a3 isMainFrame:(BOOL)a4 userAction:(id)a5 decisionHandler:(id)a6;
- (void)_reloadFromOrigin:(BOOL)a3;
- (void)_resetPageZoomSetting;
- (void)_scrollToTopFromScrollToTopView;
- (void)_setCurrentWebViewController:(id)a3;
- (void)_setShowingCrashBanner:(BOOL)a3 animated:(BOOL)a4;
- (void)_setShowingPinnableBanner:(id)a3 animated:(BOOL)a4;
- (void)_setShowingReader:(BOOL)a3;
- (void)_setShowingReader:(BOOL)a3 deactivationMode:(unint64_t)a4 animated:(BOOL)a5;
- (void)_setSuppressingPreviewProgressAnimation:(BOOL)a3;
- (void)_setUpAnalyticsPersona;
- (void)_setUpCalendarEventDetectorIfNeeded;
- (void)_setUpCookieStoragePolicyForDataStore:(id)a3;
- (void)_setUpInterfaceIfNeeded;
- (void)_setUpMenu;
- (void)_setUpReaderViewController;
- (void)_setUpReloadOptionsControllerIfNeeded;
- (void)_setUpToolbar;
- (void)_setUpTopBarAndBottomBar;
- (void)_setUpWebViewControllerIfNeeded;
- (void)_setWebViewController:(id)a3;
- (void)_showBars;
- (void)_showBarsFromBottomBarTap:(id)a3;
- (void)_showCrashBanner:(id)a3 animated:(BOOL)a4;
- (void)_showDigitalHealthOverlayWithPolicy:(int64_t)a3;
- (void)_showDownload:(id)a3;
- (void)_showFinanceKitOrderPreviewControllerWithURL:(id)a3 dismissalHandler:(id)a4;
- (void)_showGenericDownloadAlert;
- (void)_showPassBookControllerForPasses:(id)a3;
- (void)_showQuickLookDocumentView;
- (void)_showReaderAnimated:(BOOL)a3;
- (void)_translationAvailabilityDidChange:(id)a3;
- (void)_translationContextStateDidChange:(id)a3;
- (void)_updateBarItems;
- (void)_updateBarTheme;
- (void)_updateCrashBannerOffset;
- (void)_updateCurrentScrollViewInsets;
- (void)_updateDarkModeEnabled;
- (void)_updateDigitalHealthTracking;
- (void)_updateDynamicBarGeometry;
- (void)_updateHomeIndicatorAutoHideState;
- (void)_updateInterfaceFillsScreen;
- (void)_updateMaxVisibleHeightPercentageUserDriven:(BOOL)a3;
- (void)_updateModalInPresentation;
- (void)_updateNavigationBar;
- (void)_updatePageZoomWithPreference;
- (void)_updatePinnableBannerFrame;
- (void)_updatePinnableBannerOffset;
- (void)_updatePreviewLoadingUI;
- (void)_updateScrollIndicatorVerticalInsets:(UIEdgeInsets)a3 horizontalInsets:(UIEdgeInsets)a4;
- (void)_updateScrollToTopView;
- (void)_updateStatusBarStyleForced:(BOOL)a3;
- (void)_updateTrackerProtectionPreferences;
- (void)_updateUI;
- (void)_updateUserActivity;
- (void)_updateUserActivitySoon;
- (void)_updateUserActivityTimerFired;
- (void)_updateUsesLockdownStatusBar;
- (void)_updateUsesNarrowLayout;
- (void)_updateWebViewLayoutSize;
- (void)_updateWebViewShrinkToFit;
- (void)_willBeginUserInitiatedNavigation;
- (void)_willCommitContextMenuForWebView:(id)a3 withAnimator:(id)a4;
- (void)activityViewController:(id)a3 prepareActivity:(id)a4 completion:(id)a5;
- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5;
- (void)addPassesViewControllerDidFinish:(id)a3;
- (void)addTrustedEventAttribution:(id)a3;
- (void)authenticationChallengeDidNegotiateModernTLS:(id)a3;
- (void)autoFillFormKeyPressed;
- (void)barManager:(id)a3 didReceiveTapForBarItem:(int64_t)a4;
- (void)beginDigitalHealthTracking;
- (void)browsingAssistantController:(id)a3 didUpdateContentOptionsForURL:(id)a4;
- (void)browsingAssistantControllerDidReset:(id)a3;
- (void)browsingAssistantControllerDidUpdateUserConsentState:(id)a3;
- (void)cancelKeyPressed;
- (void)clearFluidProgressState;
- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3;
- (void)contextMenuConfigurationForReaderViewController:(id)a3 element:(id)a4 completionHandler:(id)a5;
- (void)customizationControllerCustomizationsDidChange:(id)a3;
- (void)dealloc;
- (void)decideDataSharingModeAndSetUpWebViewWithCompletionHandler:(id)a3;
- (void)didMoveToParentViewController:(id)a3;
- (void)dismissAppSuggestionBanner:(id)a3;
- (void)downloadDidFail:(id)a3;
- (void)downloadDidFinish:(id)a3;
- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4;
- (void)dynamicBarAnimatorOutputsDidChange:(id)a3;
- (void)dynamicBarAnimatorStateDidChange:(id)a3;
- (void)dynamicBarAnimatorWillEnterSteadyState:(id)a3;
- (void)emailCurrentPage;
- (void)find:(id)a3;
- (void)fluidProgressRocketAnimationDidComplete;
- (void)handleSearchResult:(id)a3;
- (void)linkPreviewHelper:(id)a3 commitPreviewViewControllerForAction:(int64_t)a4 withTabOrder:(int64_t)a5;
- (void)linkPreviewHelper:(id)a3 didProduceNavigationIntent:(id)a4 forAction:(int64_t)a5;
- (void)linkPreviewHelper:(id)a3 redirectToExternalNavigationResult:(id)a4;
- (void)linkPreviewHelperWillDisableLinkPreview;
- (void)linkPreviewHelperWillOpenUniversalLinkLocally:(id)a3;
- (void)loadRequest:(id)a3;
- (void)loadView;
- (void)navigationBar:(id)a3 didCreateLeadingToolbar:(id)a4 trailingToolbar:(id)a5;
- (void)navigationBarFormatMenuButtonBecameUnavailable:(id)a3;
- (void)navigationBarFormatMenuButtonStartedInteraction:(id)a3;
- (void)navigationBarFormatMenuButtonWasTapped:(id)a3;
- (void)navigationBarMediaStateMuteButtonWasTapped:(id)a3;
- (void)navigationBarMetricsDidChange:(id)a3;
- (void)navigationBarReaderButtonWasTapped:(id)a3;
- (void)navigationBarReloadButtonWasTapped:(id)a3;
- (void)navigationBarStopLoadingButtonWasTapped:(id)a3;
- (void)navigationBarTranslateButtonWasTapped:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayDidHide:(id)a3;
- (void)pageLoadErrorController:(id)a3 allowLegacyTLSConnectionForURL:(id)a4 navigateToURL:(id)a5;
- (void)pageLoadErrorController:(id)a3 loadFailedRequestAfterError:(id)a4;
- (void)pageLoadErrorController:(id)a3 presentViewController:(id)a4;
- (void)pageLoadErrorControllerReloadUsingHTTPSOnlyBypass:(id)a3;
- (void)pageLoadErrorControllerReloadWithoutPrivateRelay:(id)a3;
- (void)perSiteSettingsUIPresentSettings;
- (void)presentModalViewController:(id)a3 completion:(id)a4;
- (void)printController:(id)a3 didCreatePrintInfo:(id)a4;
- (void)readerViewController:(id)a3 contextMenuDidEndForElement:(id)a4;
- (void)readerViewController:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5;
- (void)reload;
- (void)reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:(BOOL)a3;
- (void)reloadDisablingContentBlockers:(BOOL)a3;
- (void)reloadEnablingDowngradedPrivateRelay:(BOOL)a3;
- (void)reloadFromOriginKeyPressed;
- (void)reloadKeyPressed;
- (void)saveToFilesOperation:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)saveToFilesOperation:(id)a3 presentViewController:(id)a4;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActivatedElementInfo:(id)a3;
- (void)setAppSuggestionBanner:(id)a3 isPinned:(BOOL)a4;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDismissButtonStyle:(int64_t)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setHostAppModalPresentationStyle:(int64_t)a3;
- (void)setIsNavigatingViaReloadWithoutPrivateRelay:(BOOL)a3;
- (void)setKeepBarsMinimized:(BOOL)a3;
- (void)setLinkActions:(id)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setPreferredBarTintColor:(id)a3;
- (void)setPreferredControlTintColor:(id)a3;
- (void)setQuickLookDocumentForCurrentBackForwardListItem:(id)a3;
- (void)setReloadOptionsController:(id)a3;
- (void)setRemoteSwipeGestureEnabled:(BOOL)a3;
- (void)setSafariDataSharingMode:(int64_t)a3;
- (void)setShouldShowListeningControls:(BOOL)a3;
- (void)setStoreBannersAreDisabled:(BOOL)a3;
- (void)setTranslationContext:(id)a3;
- (void)setUuid:(id)a3;
- (void)setViewDidAppearInHostApp:(BOOL)a3;
- (void)setWebViewLayoutUnderlapsStatusBar:(BOOL)a3;
- (void)set_navigationUtilitiesManager:(id)a3;
- (void)sfScribbleController:(id)a3 presentAlert:(id)a4;
- (void)sfScribbleControllerDidEndScribbling:(id)a3;
- (void)sfScribbleControllerDidStartScribbling:(id)a3;
- (void)sfScribbleControllerDidUpdateHiddenElementCount:(id)a3;
- (void)showFindOnPage;
- (void)stopDigitalHealthTrackingWithCompletionHandler:(id)a3;
- (void)stopLoading;
- (void)takeFindStringKeyPressed;
- (void)takeOwnershipOfStepperContainer:(id)a3;
- (void)toggleShowingReaderForUserAction;
- (void)traitCollectionDidChange:(id)a3;
- (void)translationContext:(id)a3 shouldReportProgressInUnifiedField:(BOOL)a4;
- (void)translationContext:(id)a3 showFeedbackConsentAlertWithCompletionHandler:(id)a4;
- (void)translationContext:(id)a3 showFirstTimeConsentAlertWithCompletionHandler:(id)a4;
- (void)translationContext:(id)a3 showTranslationErrorAlertWithTitle:(id)a4 message:(id)a5;
- (void)translationContext:(id)a3 urlForCurrentPageWithCompletionHandler:(id)a4;
- (void)translationContextNeedsScrollHeightVisibilityUpdate:(id)a3;
- (void)translationContextReloadPageInOriginalLanguage:(id)a3;
- (void)translationContextWillRequestTranslatingWebpage:(id)a3;
- (void)updateBottomBarOffset:(double)a3 topBarHeight:(double)a4;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)webViewController:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5;
- (void)webViewController:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5;
- (void)webViewController:(id)a3 contextMenuDidEndForElement:(id)a4;
- (void)webViewController:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5;
- (void)webViewController:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 completionHandler:(id)a6;
- (void)webViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5;
- (void)webViewController:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5;
- (void)webViewController:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6;
- (void)webViewController:(id)a3 didChangeFullScreen:(BOOL)a4;
- (void)webViewController:(id)a3 didClickLinkInReaderWithRequest:(id)a4;
- (void)webViewController:(id)a3 didCommitNavigation:(id)a4;
- (void)webViewController:(id)a3 didEndNavigationGestureToBackForwardListItem:(id)a4;
- (void)webViewController:(id)a3 didExtractTextSamplesForTranslation:(id)a4;
- (void)webViewController:(id)a3 didFailNavigation:(id)a4 withError:(id)a5;
- (void)webViewController:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5;
- (void)webViewController:(id)a3 didFindAppBannerWithContent:(id)a4;
- (void)webViewController:(id)a3 didFinishDocumentLoadForNavigation:(id)a4;
- (void)webViewController:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4;
- (void)webViewController:(id)a3 didFinishNavigation:(id)a4;
- (void)webViewController:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5;
- (void)webViewController:(id)a3 didSameDocumentNavigation:(id)a4 ofType:(int64_t)a5;
- (void)webViewController:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5;
- (void)webViewController:(id)a3 didStartProvisionalNavigation:(id)a4;
- (void)webViewController:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4;
- (void)webViewController:(id)a3 printFrame:(id)a4;
- (void)webViewController:(id)a3 webViewDidClose:(id)a4;
- (void)webViewController:(id)a3 willEndNavigationGestureToBackForwardListItem:(id)a4;
- (void)webViewController:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5;
- (void)webViewControllerDidChangeEstimatedProgress:(id)a3;
- (void)webViewControllerDidChangeHasOnlySecureContent:(id)a3;
- (void)webViewControllerDidChangeLoadingState:(id)a3;
- (void)webViewControllerDidChangeSafeAreaInsets:(id)a3;
- (void)webViewControllerDidChangeSafeAreaShouldAffectObscuredInsets:(id)a3;
- (void)webViewControllerDidDetermineReaderAvailability:(id)a3 dueTo:(int64_t)a4;
- (void)webViewControllerDidFirstPaint:(id)a3;
- (void)webViewControllerDidFirstVisuallyNonEmptyLayout:(id)a3;
- (void)webViewControllerWebProcessDidCrash:(id)a3;
- (void)webViewControllerWillPresentJavaScriptDialog:(id)a3;
- (void)willDismissBrowsingAssistantInSheet:(BOOL)a3;
- (void)willPresentBrowsingAssistantInSheet:(BOOL)a3;
@end

@implementation _SFBrowserContentViewController

- (_SFBrowserContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)_SFBrowserContentViewController;
  v8 = [(_SFBrowserContentViewController *)&v54 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    id v50 = v6;
    objc_initWeak(&location, v8);
    v9 = (_OWORD *)MEMORY[0x1E4FB2848];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4FB2848] + 16);
    *(_OWORD *)&v8->_verticalScrollIndicatorBaseInsets.top = *MEMORY[0x1E4FB2848];
    *(_OWORD *)&v8->_verticalScrollIndicatorBaseInsets.bottom = v10;
    long long v11 = v9[1];
    *(_OWORD *)&v8->_horizontalScrollIndicatorBaseInsets.top = *v9;
    *(_OWORD *)&v8->_horizontalScrollIndicatorBaseInsets.bottom = v11;
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    uuid = v8->_uuid;
    v8->_uuid = (NSUUID *)v12;

    v14 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    v15 = (WKPreferences *)objc_alloc_init(MEMORY[0x1E4F46688]);
    wkPreferences = v8->_wkPreferences;
    v8->_wkPreferences = v15;

    -[WKPreferences setJavaScriptCanOpenWindowsAutomatically:](v8->_wkPreferences, "setJavaScriptCanOpenWindowsAutomatically:", objc_msgSend(v14, "safari_javaScriptCanOpenWindowsAutomatically"));
    -[WKPreferences setJavaScriptEnabled:](v8->_wkPreferences, "setJavaScriptEnabled:", objc_msgSend(v14, "safari_isJavaScriptEnabled"));
    [v14 addObserver:v8 forKeyPath:*MEMORY[0x1E4F78940] options:3 context:kvoContext];
    uint64_t v17 = *MEMORY[0x1E4F78898];
    -[WKPreferences _setApplePayCapabilityDisclosureAllowed:](v8->_wkPreferences, "_setApplePayCapabilityDisclosureAllowed:", [v14 BOOLForKey:*MEMORY[0x1E4F78898]]);
    [v14 addObserver:v8 forKeyPath:v17 options:3 context:kvoContext];
    [(WKPreferences *)v8->_wkPreferences _setShouldSuppressKeyboardInputDuringProvisionalNavigation:1];
    [(WKPreferences *)v8->_wkPreferences _setShouldAllowUserInstalledFonts:0];
    [(WKPreferences *)v8->_wkPreferences setShouldPrintBackgrounds:1];
    -[WKPreferences _setNeedsSiteSpecificQuirks:](v8->_wkPreferences, "_setNeedsSiteSpecificQuirks:", [v14 BOOLForKey:*MEMORY[0x1E4F789F8]]);
    [(WKPreferences *)v8->_wkPreferences _setMediaDevicesEnabled:1];
    [(WKPreferences *)v8->_wkPreferences _setInterruptAudioOnPageVisibilityChangeEnabled:1];
    if (objc_opt_respondsToSelector()) {
      -[WKPreferences _setTextExtractionEnabled:](v8->_wkPreferences, "_setTextExtractionEnabled:", [MEMORY[0x1E4F98AF8] isWebKitTextExtractionEnabled]);
    }
    [(_SFBrowserContentViewController *)v8 _initializeWebKitExperimentalFeatures];
    v18 = objc_alloc_init(SFSafariViewControllerConfiguration);
    configuration = v8->_configuration;
    v8->_configuration = v18;

    v20 = [_SFPerSitePreferencesVendor alloc];
    v21 = [(_SFBrowserContentViewController *)v8 webExtensionsController];
    uint64_t v22 = [(_SFPerSitePreferencesVendor *)v20 initWithExtensionsController:v21 profileProvider:0];
    perSitePreferencesVendor = v8->_perSitePreferencesVendor;
    v8->_perSitePreferencesVendor = (_SFPerSitePreferencesVendor *)v22;

    v24 = [[_SFNavigationUtilitiesManager alloc] initWithPerSitePreferencesVendor:v8->_perSitePreferencesVendor];
    [(_SFBrowserContentViewController *)v8 set_navigationUtilitiesManager:v24];

    v25 = [(_SFBrowserContentViewController *)v8 normalBrowsingUserDefinedContentBlockerManager];
    v26 = [(_SFBrowserContentViewController *)v8 _navigationUtilitiesManager];
    [v26 setUserDefinedContentBlockerManager:v25];

    v27 = [(_SFBrowserContentViewController *)v8 _navigationUtilitiesManager];
    [v27 setBrowserDocument:v8];

    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v8 selector:sel__perSiteAutomaticReaderActivationPreferenceDidChange_ name:*MEMORY[0x1E4F99370] object:0];
    [v28 addObserver:v8 selector:sel__perSitePageZoomPreferenceDidChange_ name:*MEMORY[0x1E4F992F8] object:0];
    [v28 addObserver:v8 selector:sel__perSiteLockdownModePreferenceDidChange_ name:*MEMORY[0x1E4F99380] object:0];
    id v29 = objc_alloc_init(MEMORY[0x1E4F466F8]);
    uint64_t v30 = [v29 defaultWebpagePreferences];
    defaultWebpagePreferences = v8->_defaultWebpagePreferences;
    v8->_defaultWebpagePreferences = (WKWebpagePreferences *)v30;

    [(WKWebpagePreferences *)v8->_defaultWebpagePreferences addObserver:v8 forKeyPath:*MEMORY[0x1E4F99298] options:4 context:kvoContext];
    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v8 selector:sel__translationAvailabilityDidChange_ name:*MEMORY[0x1E4F99728] object:0];

    v8->_canOpenDownloadForInitialLoad = 1;
    v33 = objc_alloc_init(_SFBarManager);
    barManager = v8->_barManager;
    v8->_barManager = v33;

    [(_SFBarManager *)v8->_barManager setDelegate:v8];
    v35 = v8->_barManager;
    v36 = (void *)MEMORY[0x1E4FB1970];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __58___SFBrowserContentViewController_initWithNibName_bundle___block_invoke;
    v51[3] = &unk_1E5C76F58;
    objc_copyWeak(&v52, &location);
    v37 = objc_msgSend(v36, "safari_menuWithTitle:uncachedChildrenProvider:", @"Debug (Internal Only)", v51);
    [(_SFBarManager *)v35 setBarItem:6 menu:v37];

    [(_SFBrowserContentViewController *)v8 beginDigitalHealthTracking];
    id v38 = objc_alloc(MEMORY[0x1E4F98980]);
    v39 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariCoreBundle");
    v40 = [v39 URLForResource:@"WBSAutoFillQuirks" withExtension:@"plist"];
    v41 = [MEMORY[0x1E4F28CB8] defaultManager];
    v42 = objc_msgSend(v41, "safari_autoFillQuirksDownloadDirectoryURL");
    uint64_t v43 = [v38 initWithBuiltInQuirksURL:v40 downloadsDirectoryURL:v42 resourceName:@"AutoFillQuirks" resourceVersion:@"1" updateDateDefaultsKey:*MEMORY[0x1E4F99430] updateInterval:0.0];
    autoFillQuirksManager = v8->_autoFillQuirksManager;
    v8->_autoFillQuirksManager = (WBSAutoFillQuirksManager *)v43;

    [(WBSAutoFillQuirksManager *)v8->_autoFillQuirksManager setShouldAttemptToDownloadConfiguration:0];
    [(WBSAutoFillQuirksManager *)v8->_autoFillQuirksManager beginLoadingQuirksFromDisk];
    uint64_t v45 = [MEMORY[0x1E4F1CA48] array];
    webViewControllers = v8->_webViewControllers;
    v8->_webViewControllers = (NSMutableArray *)v45;

    char v47 = [MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari];
    v8->_pendingNavigationWillLoadWithLockdownModeEnabled = v47;
    v8->_wasLoadedWithLockdownModeEnabled = v47;
    v48 = v8;
    objc_destroyWeak(&v52);

    objc_destroyWeak(&location);
    id v6 = v50;
  }

  return v8;
}

- (void)dealloc
{
  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator removeObserver:self forKeyPath:@"UIShouldReflectCommittedURLInsteadOfCurrentURL" context:kvoContext];
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v3 removeObserver:self forKeyPath:*MEMORY[0x1E4F78940] context:kvoContext];
  [v3 removeObserver:self forKeyPath:*MEMORY[0x1E4F78898] context:kvoContext];
  [v3 removeObserver:self forKeyPath:*MEMORY[0x1E4FB6F30] context:kvoContext];
  [(_SFBrowserContentViewController *)self stopDigitalHealthTrackingWithCompletionHandler:0];
  [(_SFBrowserContentViewController *)self _invalidateUserActivity];
  [(WBSWellKnownURLResponseCodeReliabilityChecker *)self->_wellKnownURLResponseCodeReliabilityChecker cancel];
  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4F99370] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F99728] object:0];
  [(_SFBrowserContentViewController *)self _invalidateWebViewControllers];
  [(_SFReloadOptionsController *)self->_reloadOptionsController invalidate];
  pendingNavigationActionDueToExternalSchemePromptHandler = (void (**)(id, void))self->_pendingNavigationActionDueToExternalSchemePromptHandler;
  if (pendingNavigationActionDueToExternalSchemePromptHandler) {
    pendingNavigationActionDueToExternalSchemePromptHandler[2](pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  }

  v6.receiver = self;
  v6.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v6 dealloc];
}

- (void)loadView
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v22 loadView];
  v3 = [(_SFBrowserContentViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [_SFBrowserView alloc];
  [v3 bounds];
  objc_super v6 = -[_SFBrowserView initWithFrame:](v5, "initWithFrame:");
  browserView = self->_browserView;
  self->_browserView = v6;

  [(_SFBrowserView *)self->_browserView setAutoresizingMask:18];
  [(_SFBrowserView *)self->_browserView setDelegate:self];
  [v3 addSubview:self->_browserView];
  v8 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__showBarsFromBottomBarTap_];
  showBarsFromBottomBarRecognizer = self->_showBarsFromBottomBarRecognizer;
  self->_showBarsFromBottomBarRecognizer = v8;

  [(UITapGestureRecognizer *)self->_showBarsFromBottomBarRecognizer setDelegate:self];
  [(_SFBrowserView *)self->_browserView addGestureRecognizer:self->_showBarsFromBottomBarRecognizer];
  long long v10 = (WBSURLSpoofingMitigator *)objc_alloc_init(MEMORY[0x1E4F98F78]);
  URLSpoofingMitigator = self->_URLSpoofingMitigator;
  self->_URLSpoofingMitigator = v10;

  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator addObserver:self forKeyPath:@"UIShouldReflectCommittedURLInsteadOfCurrentURL" options:0 context:kvoContext];
  uint64_t v12 = objc_alloc_init(_SFPrintController);
  printController = self->_printController;
  self->_printController = v12;

  [(_SFPrintController *)self->_printController setDelegate:self];
  v14 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  [v14 addObserver:self forKeyPath:*MEMORY[0x1E4FB6F30] options:3 context:kvoContext];

  [(_SFBrowserContentViewController *)self _updateTrackerProtectionPreferences];
  [v3 bounds];
  CGRectGetWidth(v24);
  self->_usesNarrowLayout = _SFWidthIsCompactSizeClass();
  [(_SFBrowserContentViewController *)self _setUpTopBarAndBottomBar];
  [(_SFBrowserContentViewController *)self _updateStatusBarStyleForced:1];
  v15 = [(_SFBrowserView *)self->_browserView navigationBar];
  +[_SFBarHoverAssistant attachToBar:v15 withAnimator:self->_dynamicBarAnimator inContainerView:v3];

  v23[0] = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v17 = (id)[(_SFBrowserContentViewController *)self registerForTraitChanges:v16 withTarget:self action:sel__updateDarkModeEnabled];

  v18 = (SFTouchDownGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F78480]) initWithTarget:self action:sel__receivedTouchDown_];
  touchDownGestureRecognizer = self->_touchDownGestureRecognizer;
  self->_touchDownGestureRecognizer = v18;

  [(SFTouchDownGestureRecognizer *)self->_touchDownGestureRecognizer setDelegate:self];
  [(_SFBrowserView *)self->_browserView addGestureRecognizer:self->_touchDownGestureRecognizer];
  v20 = (SFTouchUpGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F78488]) initWithTarget:self action:sel__receivedTouchUp_];
  touchUpGestureRecognizer = self->_touchUpGestureRecognizer;
  self->_touchUpGestureRecognizer = v20;

  [(SFTouchUpGestureRecognizer *)self->_touchUpGestureRecognizer setDelegate:self];
  [(_SFBrowserView *)self->_browserView addGestureRecognizer:self->_touchUpGestureRecognizer];
}

- (void)_updateDarkModeEnabled
{
  id v6 = [(_SFBrowserContentViewController *)self traitCollection];
  uint64_t v3 = [v6 userInterfaceStyle];

  v4 = [(_SFBrowserContentViewController *)self webViewController];
  id v7 = [v4 readerController];

  v5 = [v7 configurationManager];
  if (((v3 == 2) ^ [v5 darkModeEnabled]))
  {
    [v5 setDarkModeEnabled:v3 == 2];
    [v7 sendConfigurationToWebProcess];
    [(_SFBrowserContentViewController *)self _updateBarTheme];
  }
}

- (_SFBrowserView)browserView
{
  [(_SFBrowserContentViewController *)self loadViewIfNeeded];
  browserView = self->_browserView;

  return browserView;
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3 = [(_SFBrowserContentViewController *)self _currentWebView];
  v4 = [v3 URL];

  if (v4)
  {
    v5 = [(_SFBrowserContentViewController *)self _currentWebView];
    LOBYTE(v6) = [v5 becomeFirstResponder];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)_SFBrowserContentViewController;
    uint64_t v6 = [(_SFBrowserContentViewController *)&v8 becomeFirstResponder];
  }

  return v6;
}

- (BOOL)canBecomeFirstResponder
{
  uint64_t v3 = [(_SFBrowserContentViewController *)self _currentWebView];
  v4 = [v3 URL];
  if (v4)
  {
    v5 = [(_SFBrowserContentViewController *)self _currentWebView];
    char v6 = [v5 canBecomeFirstResponder];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_currentlyEditingText
{
  uint64_t v3 = [(_SFBrowserContentViewController *)self webView];
  if (objc_msgSend(v3, "sf_inResponderChain"))
  {
    v4 = [(_SFBrowserContentViewController *)self webViewController];
    char v5 = [v4 hasFormControlInteraction];
  }
  else
  {
    v4 = [MEMORY[0x1E4FB1900] activeInstance];
    char v6 = [v4 inputDelegate];
    char v5 = v6 != 0;
  }
  return v5;
}

- (BOOL)_onlyWantsWebAppShortcuts
{
  return [(_SFBrowserContentViewController *)self _persona] == 3 && self->_displayMode == 2;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_6;
  }
  id v7 = [MEMORY[0x1E4F781F8] sharedProvider];
  if (([v7 commandConflictsWithTextEditing:v6] & 1) == 0)
  {

    goto LABEL_6;
  }
  BOOL v8 = [(_SFBrowserContentViewController *)self _currentlyEditingText];

  if (!v8)
  {
LABEL_6:
    BOOL v10 = [(_SFBrowserContentViewController *)self _onlyWantsWebAppShortcuts];
    long long v11 = [(_SFBrowserContentViewController *)self webViewController];
    uint64_t v12 = v11;
    if (sel_reloadKeyPressed == a3 || sel_reloadFromOriginKeyPressed == a3) {
      goto LABEL_21;
    }
    if (sel_find_ == a3 || sel_takeFindStringKeyPressed == a3)
    {
      unsigned __int8 v13 = [(_SFBrowserContentViewController *)self canFindOnPage];
      goto LABEL_24;
    }
    if (sel_navigateBackKeyPressed == a3)
    {
      v14 = [v11 webView];
      char v16 = [v14 canGoBack];
    }
    else
    {
      if (sel_navigateForwardKeyPressed != a3)
      {
        if (sel_toggleReaderKeyPressed == a3)
        {
          if (!v10)
          {
            unsigned __int8 v13 = [(_SFBrowserContentViewController *)self _canShowPageFormatMenu];
            goto LABEL_24;
          }
          goto LABEL_41;
        }
        if (sel_emailCurrentPage == a3)
        {
          if (v10 || ![getMFMailComposeViewControllerClass() canSendMail]) {
            goto LABEL_41;
          }
          v14 = [v12 webView];
          v15 = [v14 URL];
          goto LABEL_22;
        }
        if (sel_increaseSize_ != a3 && sel_decreaseSize_ != a3 && sel_resetPageZoomLevelAndFontSize != a3)
        {
          if (sel_dismissSFSafariViewControllerKeyPressed == a3)
          {
            if (!self->_webViewIsInFullScreen)
            {
              BOOL v9 = [(_SFBrowserContentViewController *)self _persona] == 1;
              goto LABEL_29;
            }
          }
          else
          {
            if (sel_saveKeyPressed != a3 && sel_saveWebpageAlternativeKeyPressed != a3)
            {
              v18.receiver = self;
              v18.super_class = (Class)_SFBrowserContentViewController;
              unsigned __int8 v13 = [(_SFBrowserContentViewController *)&v18 canPerformAction:a3 withSender:v6];
LABEL_24:
              BOOL v9 = v13;
LABEL_29:

              goto LABEL_30;
            }
            if (!v10)
            {
              unsigned __int8 v13 = [(_SFBrowserContentViewController *)self _canSaveWebpage];
              goto LABEL_24;
            }
          }
LABEL_41:
          BOOL v9 = 0;
          goto LABEL_29;
        }
        if (v10) {
          goto LABEL_41;
        }
LABEL_21:
        v14 = [v11 webView];
        v15 = [v14 URL];
LABEL_22:
        BOOL v9 = v15 != 0;

LABEL_28:
        goto LABEL_29;
      }
      v14 = [v11 webView];
      char v16 = [v14 canGoForward];
    }
    BOOL v9 = v16;
    goto LABEL_28;
  }
  BOOL v9 = 0;
LABEL_30:

  return v9;
}

- (void)_cleanUpWebViewController:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    [(_SFTelephonyNavigationMitigationPolicy *)self->_telephonyNavigationPolicy setDialogPresenter:0];
    [v9 setDelegate:0];
    v4 = [v9 view];
    [v4 removeFromSuperview];

    [v9 removeFromParentViewController];
    [v9 invalidate];
    [(_SFBrowserContentViewController *)self _setWebViewController:0];
    sharingExtensionController = self->_sharingExtensionController;
    self->_sharingExtensionController = 0;

    [(_SFReloadOptionsController *)self->_reloadOptionsController invalidate];
    reloadOptionsController = self->_reloadOptionsController;
    self->_reloadOptionsController = 0;

    [(_SFCalendarEventDetector *)self->_calendarEventDetector cancelCheckForConfirmationPage];
    calendarEventDetector = self->_calendarEventDetector;
    self->_calendarEventDetector = 0;

    [(_SFPageLoadErrorController *)self->_pageLoadErrorController invalidate];
    pageLoadErrorController = self->_pageLoadErrorController;
    self->_pageLoadErrorController = 0;
  }
}

- (void)_setCurrentWebViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    telephonyNavigationPolicy = self->_telephonyNavigationPolicy;
    objc_super v18 = v4;
    if (!telephonyNavigationPolicy)
    {
      id v6 = objc_alloc_init(_SFTelephonyNavigationMitigationPolicy);
      id v7 = self->_telephonyNavigationPolicy;
      self->_telephonyNavigationPolicy = v6;

      telephonyNavigationPolicy = self->_telephonyNavigationPolicy;
      id v4 = v18;
    }
    [(_SFTelephonyNavigationMitigationPolicy *)telephonyNavigationPolicy setDialogPresenter:v4];
    BOOL v8 = [v18 webView];
    id v9 = [v8 scrollView];
    [v9 _setIndicatorInsetAdjustmentBehavior:2];

    BOOL v10 = _SFCustomUserAgentStringIfNeeded();
    if (v10) {
      [v8 setCustomUserAgent:v10];
    }

    [v18 setDelegate:self];
    [(_SFBrowserContentViewController *)self addChildViewController:v18];
    [v18 didMoveToParentViewController:self];
    [(_SFBrowserContentViewController *)self _setWebViewController:v18];
    long long v11 = [_SFPageLoadErrorController alloc];
    uint64_t v12 = [v18 webView];
    unsigned __int8 v13 = [(_SFPageLoadErrorController *)v11 initWithWebView:v12];
    pageLoadErrorController = self->_pageLoadErrorController;
    self->_pageLoadErrorController = v13;

    [(_SFPageLoadErrorController *)self->_pageLoadErrorController setDelegate:self];
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController setDialogPresenter:v18];
    [(_SFPrintController *)self->_printController setWebView:v8];
    v15 = [v18 readerController];
    [(_SFPrintController *)self->_printController setReaderController:v15];

    [(_SFPrintController *)self->_printController setDialogPresenter:v18];
    [(_SFBrowserContentViewController *)self _setUpReloadOptionsControllerIfNeeded];
    [(_SFBrowserContentViewController *)self _setUpCalendarEventDetectorIfNeeded];
    [(_SFBrowserContentViewController *)self _updateTrackerProtectionPreferences];
    [(_SFBrowserContentViewController *)self _invalidateEVOrganizationName];
    [(_SFBrowserContentViewController *)self _setUpToolbar];
    [(_SFBrowserContentViewController *)self _updateUI];
    [(_SFBrowserContentViewController *)self _setUpAnalyticsPersona];
    [(_SFBrowserContentViewController *)self _setUpMenu];
    char v16 = [(SFScribbleController *)self->_sfScribbleController webView];

    if (v16 != v8)
    {
      [(SFScribbleController *)self->_sfScribbleController invalidate];
      sfScribbleController = self->_sfScribbleController;
      self->_sfScribbleController = 0;
    }
    id v4 = v18;
  }
}

- (SFReaderEnabledWebViewController)webViewController
{
  return (SFReaderEnabledWebViewController *)[(NSMutableArray *)self->_webViewControllers lastObject];
}

- (void)_pushWebViewController:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  [(_SFBrowserContentViewController *)self _cleanUpWebViewController:v4];

  [(NSMutableArray *)self->_webViewControllers addObject:v5];
  [(_SFBrowserContentViewController *)self _setCurrentWebViewController:v5];
}

- (void)_popWebViewController
{
  id v3 = [(_SFBrowserContentViewController *)self webViewController];
  -[_SFBrowserContentViewController _cleanUpWebViewController:](self, "_cleanUpWebViewController:");

  [(NSMutableArray *)self->_webViewControllers removeLastObject];
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  -[_SFBrowserContentViewController _setCurrentWebViewController:](self, "_setCurrentWebViewController:");
}

- (void)_invalidateWebViewControllers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = self->_webViewControllers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "invalidate", (void)v8);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  id v7 = [(_SFBrowserContentViewController *)self webViewController];
  [(_SFBrowserContentViewController *)self _cleanUpWebViewController:v7];

  [(NSMutableArray *)self->_webViewControllers removeAllObjects];
}

- (void)_setUpAnalyticsPersona
{
  id v7 = [MEMORY[0x1E4F98948] sharedLogger];
  id v3 = objc_msgSend(MEMORY[0x1E4F28B50], "_sf_safariServicesBundle");
  uint64_t v4 = objc_msgSend(v3, "safari_normalizedVersion");
  unint64_t v5 = [(_SFBrowserContentViewController *)self _persona] - 1;
  if (v5 > 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = qword_1A6A8B8B0[v5];
  }
  [v7 registerSafariVersion:v4 persona:v6];
}

- (SFReaderEnabledWebViewController)rootWebViewController
{
  return (SFReaderEnabledWebViewController *)[(NSMutableArray *)self->_webViewControllers firstObject];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  long long v11 = (WKWebpagePreferences *)a4;
  id v12 = a5;
  uint64_t v13 = v12;
  if ((void *)kvoContext == a6)
  {
    if ((WKWebpagePreferences *)self->_URLSpoofingMitigator == v11)
    {
      if ([v10 isEqualToString:@"UIShouldReflectCommittedURLInsteadOfCurrentURL"]) {
        [(_SFBrowserContentViewController *)self _updateUI];
      }
    }
    else if (self->_defaultWebpagePreferences == v11)
    {
      if ([v10 isEqualToString:*MEMORY[0x1E4F99298]]) {
        [(_SFBrowserContentViewController *)self _updateUsesLockdownStatusBar];
      }
    }
    else
    {
      uint64_t v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
      uint64_t v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
      if (v14 | v15 && ([(id)v14 isEqual:v15] & 1) == 0)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __82___SFBrowserContentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v16[3] = &unk_1E5C72628;
        id v17 = v10;
        objc_super v18 = self;
        dispatch_async(MEMORY[0x1E4F14428], v16);
      }
    }
  }
}

- (void)setDisplayMode:(int64_t)a3
{
  if (self->_displayMode != a3)
  {
    BOOL v5 = [(_SFBrowserContentViewController *)self _isPreviewing];
    browserView = self->_browserView;
    if (v5)
    {
      [(_SFBrowserView *)browserView setPreviewHeader:0];
    }
    else
    {
      [(_SFBrowserView *)browserView setNavigationBar:0];
      [(_SFBrowserView *)self->_browserView setToolbar:0];
    }
    self->_displayMode = a3;
    [(_SFBrowserContentViewController *)self _setSuppressingPreviewProgressAnimation:[(_SFBrowserContentViewController *)self _isPreviewing]];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50___SFBrowserContentViewController_setDisplayMode___block_invoke;
    v7[3] = &unk_1E5C73108;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
}

- (id)processPoolConfiguration
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F46780]);
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  BOOL v5 = [v4 builtInPlugInsURL];
  uint64_t v6 = [v5 URLByAppendingPathComponent:@"SafariServices.wkbundle" isDirectory:1];
  [v3 setInjectedBundleURL:v6];

  v9[0] = @"safari-reader";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setCachePartitionedURLSchemes:v7];

  [v3 setPrewarmsProcessesAutomatically:1];
  objc_msgSend(v3, "setJITEnabled:", -[SFSafariViewControllerConfiguration _isJITEnabled](self->_configuration, "_isJITEnabled"));

  return v3;
}

- (id)newProcessPool
{
  id v3 = objc_alloc(MEMORY[0x1E4F46690]);
  uint64_t v4 = [(_SFBrowserContentViewController *)self processPoolConfiguration];
  BOOL v5 = (void *)[v3 _initWithConfiguration:v4];

  uint64_t v6 = [MEMORY[0x1E4FB60D0] sharedWebFilterSettings];
  LODWORD(v3) = [v6 isWebFilterEnabled];

  if (v3)
  {
    long long v8 = +[_SFSearchEngineController sharedInstance];
    long long v9 = [v8 engines];
    [v5 _setObject:v9 forBundleParameter:*MEMORY[0x1E4F997C0]];
  }
  SafariShared::ReaderAvailabilityController::configureProcessPool((SafariShared::ReaderAvailabilityController *)v5, v7);
  return v5;
}

- (id)processPool
{
  id v3 = (void *)-[_SFBrowserContentViewController processPool]::processPool;
  if (!-[_SFBrowserContentViewController processPool]::processPool)
  {
    id v4 = [(_SFBrowserContentViewController *)self newProcessPool];
    BOOL v5 = (void *)-[_SFBrowserContentViewController processPool]::processPool;
    -[_SFBrowserContentViewController processPool]::processPool = (uint64_t)v4;

    id v3 = (void *)-[_SFBrowserContentViewController processPool]::processPool;
  }

  return v3;
}

- (id)websiteDataStoreConfiguration
{
  return 0;
}

+ (void)createDefaultWebsiteDataStore
{
  id v2 = mobileSafariDefaultDataStore();
}

- (id)_createPersistentDataStoreWithConfiguration:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x1E4F46710], "safari_dataStoreWithConfiguration:", a3);

  return v3;
}

- (id)websiteDataStore
{
  if ([(_SFBrowserContentViewController *)self safariDataSharingMode] == 4
    || [(_SFBrowserContentViewController *)self isSafariRestricted])
  {
    uint64_t v3 = mobileSafariNonPersistentDataStore(self->_configuration);
  }
  else
  {
    if ([(_SFBrowserContentViewController *)self safariDataSharingMode] != 1
      && [(_SFBrowserContentViewController *)self safariDataSharingMode] != 3)
    {
      uint64_t v6 = [(_SFBrowserContentViewController *)self websiteDataStoreConfiguration];
      if (v6) {
        [(_SFBrowserContentViewController *)self _createPersistentDataStoreWithConfiguration:v6];
      }
      else {
      id v4 = mobileSafariNonPersistentDataStore(self->_configuration);
      }

      goto LABEL_5;
    }
    uint64_t v3 = mobileSafariDefaultDataStore();
  }
  id v4 = (void *)v3;
LABEL_5:

  return v4;
}

- (WKUserContentController)userContentController
{
  if ([(_SFBrowserContentViewController *)self isPrivate]) {
    objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
  }
  else {
  id v2 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_userContentController");
  }

  return (WKUserContentController *)v2;
}

- (void)_setUpCookieStoragePolicyForDataStore:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 httpCookieStore];
  objc_msgSend(v5, "sf_applySafariCookieStoragePolicy");

  [(WKPreferences *)self->_wkPreferences sf_applySafariStorageBlockingPolicy];
  uint64_t v6 = (id)WBS_LOG_CHANNEL_PREFIXSVCPrivacy();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
    int v8 = 134217984;
    uint64_t v9 = [v7 cookieAcceptPolicy];
    _os_log_impl(&dword_1A690B000, v6, OS_LOG_TYPE_DEFAULT, "Set cookie storage policy to %ld", (uint8_t *)&v8, 0xCu);
  }
}

- (id)webViewConfiguration
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F466F8]);
  id v4 = [(_SFBrowserContentViewController *)self websiteDataStore];
  [v3 setWebsiteDataStore:v4];
  BOOL v5 = [(_SFBrowserContentViewController *)self processPool];
  [v3 setProcessPool:v5];

  uint64_t v6 = [(_SFBrowserContentViewController *)self userContentController];
  [v3 setUserContentController:v6];

  [v3 setPreferences:self->_wkPreferences];
  [v3 setAllowsPictureInPictureMediaPlayback:0];
  id v7 = _SFApplicationNameForUserAgent();
  [v3 setApplicationNameForUserAgent:v7];

  [v3 _setApplePayEnabled:1];
  [v3 setIgnoresViewportScaleLimits:1];
  [v3 _setNeedsStorageAccessFromFileURLsQuirk:0];
  int v8 = [v3 preferences];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v11 = objc_msgSend(v10, "safari_warnAboutFraudulentWebsites");
    id v12 = [v3 preferences];
    [v12 _setSafeBrowsingEnabled:v11];
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  LODWORD(v14) = [v13 BOOLForKey:*MEMORY[0x1E4F788A0]];
  if ([v13 BOOLForKey:*MEMORY[0x1E4F789D8]]) {
    uint64_t v14 = v14 | 2;
  }
  else {
    uint64_t v14 = v14;
  }
  [v3 setMediaTypesRequiringUserActionForPlayback:v14];
  unsigned int IsPad = _SFDeviceIsPad();
  if (v14) {
    uint64_t v16 = IsPad;
  }
  else {
    uint64_t v16 = 1;
  }
  [v3 _setMediaDataLoadsAutomatically:v16];
  objc_msgSend(v3, "_setMainContentUserGestureOverrideEnabled:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E4F78958]));
  objc_msgSend(v3, "setAllowsInlineMediaPlayback:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E4F78970]));
  objc_msgSend(v3, "_setInlineMediaPlaybackRequiresPlaysInlineAttribute:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E4F78928]));
  objc_msgSend(v3, "_setInvisibleAutoplayNotPermitted:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E4F78930]));
  objc_msgSend(v3, "_setLegacyEncryptedMediaAPIEnabled:", objc_msgSend(v13, "BOOLForKey:", *MEMORY[0x1E4F78950]));
  [v3 _setDragLiftDelay:2];
  id v17 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  uint64_t v18 = objc_msgSend(v17, "webui_trackerProtectionEnabled");
  v19 = [v3 websiteDataStore];
  [v19 _setResourceLoadStatisticsEnabled:v18];

  v20 = [v3 defaultWebpagePreferences];
  v21 = _SFApplicationNameForDesktopUserAgent();
  [v20 _setApplicationNameForUserAgentWithModernCompatibility:v21];

  [v3 _setSystemPreviewEnabled:1];
  objc_super v22 = [(_SFBrowserContentViewController *)self _hostAppBundleId];
  if (v22)
  {
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      CGRect v24 = [(_SFBrowserContentViewController *)self _hostAppBundleId];
      [v3 _setAttributedBundleIdentifier:v24];
    }
  }
  [(_SFBrowserContentViewController *)self _setUpCookieStoragePolicyForDataStore:v4];

  return v3;
}

- (BOOL)isSafariRestricted
{
  id v2 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:@"com.apple.mobilesafari"];
  id v3 = [v2 appState];
  char v4 = [v3 isRestricted];

  return v4;
}

- (_SFReloadOptionsController)reloadOptionsController
{
  [(_SFBrowserContentViewController *)self _setUpReloadOptionsControllerIfNeeded];
  reloadOptionsController = self->_reloadOptionsController;

  return reloadOptionsController;
}

- (void)_updateTrackerProtectionPreferences
{
  id v2 = [(_SFBrowserContentViewController *)self webView];
  id v3 = [v2 configuration];
  id v5 = [v3 websiteDataStore];

  char v4 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  objc_msgSend(v5, "_setResourceLoadStatisticsEnabled:", objc_msgSend(v4, "webui_trackerProtectionEnabled"));
}

- (void)_initializeWebKitExperimentalFeatures
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v4 = objc_msgSend(MEMORY[0x1E4F46688], "_experimentalFeatures", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        char v9 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_keyForWebKitExperimentalFeature:", v8);
        uint64_t v10 = [v3 objectForKey:v9];
        BOOL v11 = v10 == 0;

        if (!v11) {
          -[WKPreferences _setEnabled:forExperimentalFeature:](self->_wkPreferences, "_setEnabled:forExperimentalFeature:", [v3 BOOLForKey:v9], v8);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_setUpWebViewControllerIfNeeded
{
  if (![(NSMutableArray *)self->_webViewControllers count])
  {
    id v3 = [SFReaderEnabledWebViewController alloc];
    char v4 = [(_SFBrowserContentViewController *)self webViewConfiguration];
    uint64_t v5 = [(_SFBrowserContentViewController *)self contentBlockerManager];
    uint64_t v6 = [(SFWebViewController *)v3 initWithWebViewConfiguration:v4 contentBlockerManager:v5];

    [(_SFBrowserContentViewController *)self _pushWebViewController:v6];
    [(_SFBrowserContentViewController *)self _didLoadWebView];
  }
}

- (BOOL)_hideFindOnPage
{
  id v2 = [(_SFBrowserContentViewController *)self _currentWebView];
  id v3 = [v2 findInteraction];

  char v4 = [v3 isFindNavigatorVisible];
  if (v4) {
    [v3 dismissFindNavigator];
  }

  return v4;
}

- (BOOL)_shouldGoBackToOwnerWebView
{
  if ((unint64_t)[(NSMutableArray *)self->_webViewControllers count] < 2) {
    return 0;
  }
  id v3 = [(_SFBrowserContentViewController *)self webView];
  char v4 = [v3 backForwardList];
  uint64_t v5 = [v4 backList];
  BOOL v6 = (unint64_t)[v5 count] < 2;

  return v6;
}

- (void)_willBeginUserInitiatedNavigation
{
  id v3 = [(_SFBrowserContentViewController *)self webViewController];
  [v3 willBeginUserInitiatedNavigation];

  URLSpoofingMitigator = self->_URLSpoofingMitigator;

  [(WBSURLSpoofingMitigator *)URLSpoofingMitigator willStartNewBrowserChromeInitiatedNavigation];
}

- (void)_goBack
{
  [(_SFBrowserContentViewController *)self _dismissTransientUIAnimated:1];
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  if ([(_SFBrowserContentViewController *)self _shouldGoBackToOwnerWebView])
  {
    [(_SFBrowserContentViewController *)self _goBackToOwnerWebView];
  }
  else
  {
    self->_loadWasUserDriven = 1;
    [(_SFBrowserContentViewController *)self _willBeginUserInitiatedNavigation];
    id v4 = [(_SFBrowserContentViewController *)self webView];
    id v3 = (id)[v4 goBack];
  }
}

- (void)_goForward
{
  [(_SFBrowserContentViewController *)self _dismissTransientUIAnimated:1];
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  self->_loadWasUserDriven = 1;
  [(_SFBrowserContentViewController *)self _willBeginUserInitiatedNavigation];
  id v4 = [(_SFBrowserContentViewController *)self webView];
  id v3 = (id)[v4 goForward];
}

- (void)_setUpReloadOptionsControllerIfNeeded
{
  if (!self->_reloadOptionsController)
  {
    id v3 = [(_SFBrowserContentViewController *)self webView];
    if (v3)
    {
      id v14 = v3;
      id v4 = [[_SFInjectedJavaScriptController alloc] initWithWebView:v3];
      uint64_t v5 = [_SFReloadOptionsController alloc];
      BOOL v6 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor requestDesktopSitePreferenceManager];
      id v7 = [(_SFReloadOptionsController *)v5 initWithWebView:v14 activityJSController:v4 perSitePreferenceManager:v6];
      reloadOptionsController = self->_reloadOptionsController;
      self->_reloadOptionsController = v7;

      char v9 = [v14 URL];
      [(_SFReloadOptionsController *)self->_reloadOptionsController setSupportsAdvancedPrivacyProtections:[(_SFBrowserContentViewController *)self supportsAdvancedPrivacyProtectionsForURL:v9]];

      uint64_t v10 = self->_reloadOptionsController;
      BOOL v11 = [(_SFBrowserContentViewController *)self _navigationUtilitiesManager];
      [v11 setReloadOptionsController:v10];

      int64_t v12 = [(_SFBrowserContentViewController *)self _persona];
      long long v13 = [(_SFBrowserContentViewController *)self _navigationUtilitiesManager];
      [v13 setPersona:v12];

      id v3 = v14;
    }
  }
}

- (void)_setUpCalendarEventDetectorIfNeeded
{
  if (!self->_calendarEventDetector)
  {
    id v3 = [_SFCalendarEventDetector alloc];
    id v6 = [(_SFBrowserContentViewController *)self webView];
    id v4 = -[_SFCalendarEventDetector initWithWebView:](v3, "initWithWebView:");
    calendarEventDetector = self->_calendarEventDetector;
    self->_calendarEventDetector = v4;
  }
}

- (void)_setUpTopBarAndBottomBar
{
  switch(self->_displayMode)
  {
    case 0:
    case 3:
      id v3 = [_SFBrowserNavigationBar alloc];
      v19 = -[_SFNavigationBar initWithFrame:inputMode:](v3, "initWithFrame:inputMode:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      objc_storeStrong((id *)&self->_navigationBar, v19);
      id v4 = _SFBackdropGroupNameForOwner();
      [(_SFLinkPreviewHeader *)v19 setBackdropGroupName:v4];

      [(_SFLinkPreviewHeader *)v19 setDelegate:self];
      [(_SFLinkPreviewHeader *)v19 setUsesNarrowLayout:self->_usesNarrowLayout];
      [(_SFBrowserView *)self->_browserView setNavigationBar:v19];
      uint64_t v5 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__hideNavigationBarGestureRecognized_];
      hideNavigationBarGestureRecognizer = self->_hideNavigationBarGestureRecognizer;
      self->_hideNavigationBarGestureRecognizer = v5;

      [(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer _setCanPanHorizontally:0];
      [(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer setDelegate:self];
      [(_SFLinkPreviewHeader *)v19 addGestureRecognizer:self->_hideNavigationBarGestureRecognizer];
      id v7 = (SFNavigationBarItem *)objc_alloc_init(MEMORY[0x1E4F782E8]);
      navigationBarItem = self->_navigationBarItem;
      self->_navigationBarItem = v7;

      [(SFNavigationBarItem *)self->_navigationBarItem setCustomPlaceholderText:&stru_1EFB97EB8];
      [(_SFBrowserContentViewController *)self _setUpToolbar];
      char v9 = objc_alloc_init(_SFDynamicBarAnimator);
      dynamicBarAnimator = self->_dynamicBarAnimator;
      self->_dynamicBarAnimator = v9;

      [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator setDelegate:self];
      [(_SFBrowserContentViewController *)self _updateDynamicBarGeometry];
      BOOL v11 = (WBSFluidProgressController *)objc_alloc_init(MEMORY[0x1E4F98B08]);
      fluidProgressController = self->_fluidProgressController;
      self->_fluidProgressController = v11;

      [(WBSFluidProgressController *)self->_fluidProgressController setWindowDelegate:self];
      [(SFNavigationBarItem *)self->_navigationBarItem setFluidProgressController:self->_fluidProgressController];
      [(_SFBrowserContentViewController *)self _updateBarTheme];
      [(_SFNavigationBar *)self->_navigationBar setItem:self->_navigationBarItem];
      goto LABEL_6;
    case 1:
      v19 = [[_SFLinkPreviewHeader alloc] initWithMinimumPreviewUI:0];
      -[_SFBrowserView setPreviewHeader:](self->_browserView, "setPreviewHeader:");
      long long v13 = (WBSFluidProgressController *)objc_alloc_init(MEMORY[0x1E4F98B08]);
      id v14 = self->_fluidProgressController;
      self->_fluidProgressController = v13;

      [(WBSFluidProgressController *)self->_fluidProgressController setWindowDelegate:self];
      long long v15 = [(_SFLinkPreviewHeader *)v19 progressView];
      [(WBSFluidProgressController *)self->_fluidProgressController setDelegate:v15];
      goto LABEL_5;
    case 2:
      uint64_t v18 = self->_dynamicBarAnimator;
      self->_dynamicBarAnimator = 0;

      self->_shouldAutoHideHomeIndicator = 1;
      return;
    case 4:
      v19 = [[_SFLinkPreviewHeader alloc] initWithMinimumPreviewUI:1];
      -[_SFBrowserView setPreviewHeader:](self->_browserView, "setPreviewHeader:");
      uint64_t v16 = (WBSFluidProgressController *)objc_alloc_init(MEMORY[0x1E4F98B08]);
      uint64_t v17 = self->_fluidProgressController;
      self->_fluidProgressController = v16;

      [(WBSFluidProgressController *)self->_fluidProgressController setWindowDelegate:self];
      long long v15 = [(_SFLinkPreviewHeader *)v19 progressView];
      [(WBSFluidProgressController *)self->_fluidProgressController setDelegate:v15];
LABEL_5:

LABEL_6:

      break;
    default:
      return;
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [(_SFReaderViewController *)self->_readerViewController readerWebView];
    id v6 = [v5 scrollView];
    [v6 setDelegate:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v7 didMoveToParentViewController:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v5 viewWillAppear:a3];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50___SFBrowserContentViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_1E5C73108;
  v4[4] = self;
  [(_SFBrowserContentViewController *)self decideDataSharingModeAndSetUpWebViewWithCompletionHandler:v4];
  [(_SFBrowserView *)self->_browserView setNeedsLayout];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v3 viewDidAppear:a3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v4 viewDidDisappear:a3];
  [(_SFBrowserContentViewController *)self _cancelPendingUpdateUserActivityTimer];
  [(_SFBrowserContentViewController *)self _invalidateUserActivity];
}

- (BOOL)_isPreviewing
{
  int64_t displayMode = self->_displayMode;
  return displayMode == 1 || displayMode == 4;
}

- (void)decideDataSharingModeAndSetUpWebViewWithCompletionHandler:(id)a3
{
  objc_super v4 = (void (**)(void))a3;
  objc_super v5 = [(_SFBrowserContentViewController *)self webViewController];

  if (v5)
  {
    v4[2](v4);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __93___SFBrowserContentViewController_decideDataSharingModeAndSetUpWebViewWithCompletionHandler___block_invoke;
    v10[3] = &unk_1E5C76F80;
    v10[4] = self;
    BOOL v11 = v4;
    id v6 = (void (**)(void))MEMORY[0x1AD0C36A0](v10);
    objc_super v7 = v6;
    if (self->_safariDataSharingMode)
    {
      v6[2](v6);
    }
    else
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __93___SFBrowserContentViewController_decideDataSharingModeAndSetUpWebViewWithCompletionHandler___block_invoke_2;
      v8[3] = &unk_1E5C76FA8;
      v8[4] = self;
      char v9 = v6;
      [(_SFBrowserContentViewController *)self _getSafariDataSharingModeWithCompletion:v8];
    }
  }
}

- (void)_setUpInterfaceIfNeeded
{
  if (!self->_didSetUpInterface)
  {
    self->_didSetUpInterface = 1;
    [(_SFBrowserContentViewController *)self _updateInterfaceFillsScreen];
    [(_SFBrowserContentViewController *)self _updateDynamicBarGeometry];
    [(_SFBrowserContentViewController *)self _updateUsesNarrowLayout];
    [(_SFBrowserContentViewController *)self _updateScrollToTopView];
    [(_SFBrowserContentViewController *)self _updateUsesLockdownStatusBar];
    [(_SFBrowserContentViewController *)self _updateWebViewLayoutSize];
    [(_SFBrowserContentViewController *)self _updateWebViewShrinkToFit];
    [(_SFBrowserContentViewController *)self _updateDarkModeEnabled];
    if ([(_SFBrowserContentViewController *)self _isPreviewing])
    {
      dispatch_time_t v3 = dispatch_time(0, 250000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58___SFBrowserContentViewController__setUpInterfaceIfNeeded__block_invoke;
      block[3] = &unk_1E5C73108;
      block[4] = self;
      dispatch_after(v3, MEMORY[0x1E4F14428], block);
    }
  }
}

- (void)_getSafariDataSharingModeWithCompletion:(id)a3
{
}

- (BOOL)_redirectToHostAppForAuthenticationSession:(id)a3
{
  return 0;
}

- (void)_layOutBrowserViewForSizeTransition
{
  dispatch_time_t v3 = [(_SFBrowserContentViewController *)self view];
  [v3 frame];
  self->_lastSizeUsedForBrowserViewLayout.width = v4;
  self->_lastSizeUsedForBrowserViewLayout.height = v5;

  id v6 = [(_SFBrowserContentViewController *)self view];
  [v6 bounds];
  -[_SFBrowserView setFrame:](self->_browserView, "setFrame:");

  [(_SFBrowserContentViewController *)self _updateInterfaceFillsScreen];
  [(_SFBrowserContentViewController *)self _updateDynamicBarGeometry];
  [(_SFBrowserContentViewController *)self _updateUsesNarrowLayout];
  [(_SFBrowserContentViewController *)self _updateWebViewLayoutSize];
  [(_SFBrowserContentViewController *)self _updatePinnableBannerFrame];
  [(_SFPageFormatMenuController *)self->_pageFormatMenuController dismissMenu];
  browserView = self->_browserView;

  [(_SFBrowserView *)browserView setNeedsLayout];
}

- (void)_didCompleteViewSizeTransition
{
  [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
  [(_SFBrowserContentViewController *)self _updateUI];
  [(_SFBrowserContentViewController *)self _updateScrollToTopView];
  [(_SFBrowserContentViewController *)self _updateWebViewShrinkToFit];

  [(_SFBrowserContentViewController *)self _updateMaxVisibleHeightPercentageUserDriven:1];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)_SFBrowserContentViewController;
  -[_SFBrowserContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  ++self->_sizeTransitionCount;
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __86___SFBrowserContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5C76FD0;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86___SFBrowserContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E5C76FD0;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

- (void)_updateHomeIndicatorAutoHideState
{
  BOOL autoHidingHomeIndicatorPermitted = self->_autoHidingHomeIndicatorPermitted;
  if (self->_autoHidingHomeIndicatorPermitted) {
    BOOL autoHidingHomeIndicatorPermitted = self->_shouldAutoHideHomeIndicator;
  }
  if (self->_prefersHomeIndicatorAutoHidden != autoHidingHomeIndicatorPermitted)
  {
    self->_prefersHomeIndicatorAutoHidden = autoHidingHomeIndicatorPermitted;
    [(_SFBrowserContentViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return self->_prefersHomeIndicatorAutoHidden;
}

- (BOOL)_safeAreaShouldAffectWebViewObscuredInsets
{
  id v2 = [(_SFBrowserView *)self->_browserView currentWebView];
  char v3 = [v2 _safeAreaShouldAffectObscuredInsets];

  return v3;
}

- (UIEdgeInsets)_effectiveWebViewSafeAreaInsets
{
  if ([(_SFBrowserContentViewController *)self _safeAreaShouldAffectWebViewObscuredInsets])
  {
    char v3 = [(_SFBrowserView *)self->_browserView currentWebView];
    [v3 safeAreaInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    double v10 = 0.0;
  }
  else
  {
    double v5 = *MEMORY[0x1E4FB2848];
    double v7 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v10;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_updateWebViewLayoutSize
{
  if (self->_displayMode == 2)
  {
    id v38 = [(_SFBrowserView *)self->_browserView statusBarBackgroundView];
    [v38 bounds];
    CGRectGetHeight(v43);
  }
  else
  {
    id v38 = [(_SFBrowserContentViewController *)self _currentWebView];
    [v38 safeAreaInsets];
    char v3 = (double *)MEMORY[0x1E4F1DB30];
    -[_SFToolbar sizeThatFits:](self->_bottomToolbar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
    double v4 = [(_SFBrowserView *)self->_browserView navigationBar];
    [v4 defaultHeight];
    [v4 defaultHeight];
    [(_SFBrowserView *)self->_browserView toolbar];

    if (!self->_keepBarsMinimized)
    {
      objc_msgSend(v4, "sizeThatFits:", *v3, v3[1]);
      [(_SFBrowserView *)self->_browserView toolbar];
    }
  }

  [(_SFBrowserContentViewController *)self _effectiveWebViewSafeAreaInsets];
  UIEdgeInsetsMax();
  id v39 = v5;
  double v36 = v6;
  double v37 = v7;
  double v35 = v8;
  UIEdgeInsetsMax();
  double v33 = v10;
  double v34 = v9;
  double v32 = v11;
  double v13 = v12;
  UIEdgeInsetsMax();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  BOOL v22 = [(_SFBrowserContentViewController *)self _isPreviewing];
  browserView = self->_browserView;
  if (v22) {
    [(_SFBrowserView *)browserView unscaledWebViewBounds];
  }
  else {
    [(_SFBrowserView *)browserView bounds];
  }
  double v26 = v24 - (v36 + v35);
  double v27 = v25 - (*(double *)&v39 + v37);
  double v28 = v24 - (v32 + v13);
  double v29 = v25 - (v34 + v33);
  double v30 = v24 - (v17 + v21);
  double v31 = v25 - (v15 + v19);
  id v40 = [(_SFBrowserContentViewController *)self webView];
  objc_msgSend(v40, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v26, v27, v28, v29, v30, v31);

  id v41 = [(_SFReaderViewController *)self->_readerViewController readerWebView];
  objc_msgSend(v41, "_overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSizeOverride:maximumUnobscuredSizeOverride:", v26, v27, v28, v29, v30, v31);
}

- (BOOL)_isSplitScreen
{
  id v2 = [(_SFBrowserContentViewController *)self view];
  char v3 = [v2 window];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v12 bounds];
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.double width = v15;
  v20.size.double height = v16;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  BOOL v17 = !CGRectEqualToRect(v19, v20);

  return v17;
}

- (void)_updateWebViewShrinkToFit
{
  BOOL v3 = [(_SFBrowserContentViewController *)self _isSplitScreen];
  id v4 = [(_SFBrowserContentViewController *)self webView];
  [v4 _setAllowsViewportShrinkToFit:v3];
}

- (BOOL)_shouldUpdateCurrentScrollViewInsets
{
  id v2 = [(_SFBrowserView *)self->_browserView currentWebView];
  uint64_t v3 = [v2 fullscreenState];

  return v3 == 0;
}

- (void)_updateCurrentScrollViewInsets
{
  if ([(_SFBrowserContentViewController *)self _shouldUpdateCurrentScrollViewInsets])
  {
    id v87 = [(_SFBrowserView *)self->_browserView currentWebView];
    uint64_t v3 = (double *)MEMORY[0x1E4FB2848];
    double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v86 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    if ([(_SFBrowserContentViewController *)self _isPreviewing])
    {
      CGFloat v5 = [(_SFBrowserView *)self->_browserView previewHeader];
      objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
      double v7 = v6;

      [(_SFBrowserView *)self->_browserView previewScaleFactor];
      double v83 = v7 / v8;
    }
    else
    {
      browserView = self->_browserView;
      if (self->_displayMode == 2)
      {
        double v10 = [(_SFBrowserView *)browserView statusBarBackgroundView];
        [v10 bounds];
        CGFloat Height = CGRectGetHeight(v89);

        double v83 = Height;
      }
      else
      {
        [(_SFBrowserView *)browserView safeAreaInsets];
        double v13 = v12;
        CGFloat v14 = [(_SFBrowserView *)self->_browserView crashBanner];
        [v14 bounds];
        double v15 = CGRectGetHeight(v90);

        CGFloat v16 = [(_SFBrowserView *)self->_browserView pinnableBanner];
        [v16 bounds];
        CGRectGetHeight(v91);

        BOOL v17 = [(_SFBrowserView *)self->_browserView navigationBar];
        [v17 defaultHeight];
        double v19 = v15 + v13 + v18;

        if (self->_showingReader) {
          double v20 = v13;
        }
        else {
          double v20 = v19;
        }
        [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator topBarHeight];
        if (self->_showingCrashBanner) {
          [(_SFBrowserView *)self->_browserView crashBannerOffset];
        }
        if (self->_showingPinnableBanner)
        {
          [(_SFBrowserView *)self->_browserView pinnableBannerOffset];
          double v21 = [v87 scrollView];
          [v21 contentOffset];
        }
        double v83 = v20;
        [(_SFBrowserContentViewController *)self _maximumHeightObscuredByBottomBar];
        double v23 = v22;
        [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator bottomBarOffset];
        double v4 = v23 - v24;
      }
    }
    double v85 = v4;
    if (self->_showingReader)
    {
      [(_SFBrowserView *)self->_browserView safeAreaInsets];
      double v85 = v4 - v25;
    }
    [v87 safeAreaInsets];
    UIEdgeInsetsMax();
    UIEdgeInsetsSubtract();
    double v75 = v27;
    double v76 = v26;
    double v77 = v29;
    double v78 = v28;
    [(_SFBrowserContentViewController *)self _effectiveWebViewSafeAreaInsets];
    UIEdgeInsetsMax();
    double v79 = v31;
    double v81 = v30;
    double v33 = v32;
    double v35 = v34;
    UIEdgeInsetsMax();
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    v44 = [v87 scrollView];
    objc_msgSend(v44, "_sf_setContentInsetAdjustments:", v81, v33, v79, v35);

    objc_msgSend(v87, "_setObscuredInsets:", v37, v39, v41, v43);
    p_verticalScrollIndicatorBaseInsets = &self->_verticalScrollIndicatorBaseInsets;
    if ((objc_msgSend(MEMORY[0x1E4FB1BE0], "_sf_baseVerticalScrollIndicatorInsetsExtendFullHeight:", self->_verticalScrollIndicatorBaseInsets.top, self->_verticalScrollIndicatorBaseInsets.left, self->_verticalScrollIndicatorBaseInsets.bottom, self->_verticalScrollIndicatorBaseInsets.right) & 1) != 0&& objc_msgSend(MEMORY[0x1E4FB1BE0], "_sf_baseHorizontalScrollIndicatorInsetsExtendFullWidth:", self->_horizontalScrollIndicatorBaseInsets.top, self->_horizontalScrollIndicatorBaseInsets.left, self->_horizontalScrollIndicatorBaseInsets.bottom, self->_horizontalScrollIndicatorBaseInsets.right))
    {
      UIEdgeInsetsMax();
      double v80 = v46;
      double v82 = v47;
      double left = v48;
      double v50 = v49;
      UIEdgeInsetsMax();
      double top = v51;
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;
    }
    else
    {
      double left = self->_verticalScrollIndicatorBaseInsets.left;
      double top = self->_horizontalScrollIndicatorBaseInsets.top;
      double v59 = self->_horizontalScrollIndicatorBaseInsets.left;
      double right = self->_horizontalScrollIndicatorBaseInsets.right;
      if (p_verticalScrollIndicatorBaseInsets->top <= v83) {
        double v61 = v83;
      }
      else {
        double v61 = p_verticalScrollIndicatorBaseInsets->top;
      }
      double v80 = v61;
      double v82 = self->_verticalScrollIndicatorBaseInsets.right;
      if (self->_verticalScrollIndicatorBaseInsets.bottom <= v85) {
        double bottom = v85;
      }
      else {
        double bottom = self->_verticalScrollIndicatorBaseInsets.bottom;
      }
      double v50 = bottom;
      if (v85 <= self->_horizontalScrollIndicatorBaseInsets.bottom) {
        double v63 = self->_horizontalScrollIndicatorBaseInsets.bottom;
      }
      else {
        double v63 = v85;
      }
      double v56 = v63;
      v64 = [(_SFBrowserContentViewController *)self view];
      [v64 safeAreaInsets];
      double v66 = v65;

      if (v56 >= v66) {
        double v67 = 0.0;
      }
      else {
        double v67 = v59;
      }
      if (v56 >= v66) {
        double v58 = 0.0;
      }
      else {
        double v58 = right;
      }
      if (v86 <= v67) {
        double v68 = v67;
      }
      else {
        double v68 = v86;
      }
      double v54 = v68;
    }
    v69 = [v87 scrollView];
    objc_msgSend(v69, "setVerticalScrollIndicatorInsets:", v80, left, v50, v82);
    objc_msgSend(v69, "setHorizontalScrollIndicatorInsets:", top, v54, v56, v58);
    BOOL v70 = [(_SFBrowserContentViewController *)self _safeAreaShouldAffectWebViewObscuredInsets];
    double v71 = *v3;
    double v72 = v3[1];
    if (!v70)
    {
      double v71 = v76;
      double v72 = v75;
    }
    double v73 = v3[2];
    double v74 = v3[3];
    if (!v70)
    {
      double v73 = v78;
      double v74 = v77;
    }
    objc_msgSend(v87, "_setUnobscuredSafeAreaInsets:", v71, v72, v73, v74);
  }
}

- (void)_updateScrollIndicatorVerticalInsets:(UIEdgeInsets)a3 horizontalInsets:(UIEdgeInsets)a4
{
  self->_verticalScrollIndicatorBaseInsets = a3;
  self->_horizontalScrollIndicatorBaseInsets = a4;
  [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
}

- (void)webViewControllerDidChangeSafeAreaInsets:(id)a3
{
  [(_SFBrowserContentViewController *)self _updateWebViewLayoutSize];

  [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
}

- (void)webViewControllerDidChangeSafeAreaShouldAffectObscuredInsets:(id)a3
{
  [(_SFBrowserContentViewController *)self _updateWebViewLayoutSize];

  [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
}

- (BOOL)_canScrollToTopInView:(id)a3
{
  id v4 = a3;
  [v4 contentOffset];
  double v6 = v5;
  [v4 contentInset];
  BOOL v8 = v6 > -v7 || [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator state] == 0;

  return v8;
}

- (void)_scrollToTopFromScrollToTopView
{
  uint64_t v3 = [(_SFBrowserContentViewController *)self _currentWebView];
  id v8 = [v3 scrollView];

  if ([(_SFBrowserContentViewController *)self _canScrollToTopInView:v8])
  {
    [v8 contentOffset];
    double v5 = v4;
    [v8 contentInset];
    double v7 = v6;
    if ([(_SFBrowserContentViewController *)self scrollViewShouldScrollToTop:v8]) {
      objc_msgSend(v8, "setContentOffset:animated:", 1, v5, -v7);
    }
  }
}

- (BOOL)_usesScrollToTopView
{
  uint64_t v3 = [(_SFBrowserContentViewController *)self view];
  double v4 = [v3 window];
  double v5 = [v4 windowScene];
  double v6 = [v5 statusBarManager];
  if ([v6 isStatusBarHidden])
  {
    double v7 = [(_SFBrowserContentViewController *)self _currentWebView];
    id v8 = [v7 scrollView];
    BOOL v9 = [(_SFBrowserContentViewController *)self _canScrollToTopInView:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_updateScrollToTopView
{
  BOOL v3 = [(_SFBrowserView *)self->_browserView shouldUseScrollToTopView];
  [(_SFBrowserView *)self->_browserView setShouldUseScrollToTopView:[(_SFBrowserContentViewController *)self _usesScrollToTopView]];
  double v4 = [(_SFBrowserView *)self->_browserView scrollToTopView];

  if (v4 && !v3)
  {
    id v6 = [(_SFBrowserView *)self->_browserView scrollToTopView];
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__scrollToTopFromScrollToTopView];
    [v6 addGestureRecognizer:v5];
  }
}

- (void)viewWillLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v11 viewWillLayoutSubviews];
  BOOL v3 = [(_SFBrowserContentViewController *)self view];
  double v4 = [v3 window];
  double v5 = [v4 rootViewController];

  id v6 = [(_SFBrowserContentViewController *)self view];
  [v6 bounds];
  CGRectGetWidth(v12);
  uint64_t v7 = _SFSizeClassForWidth();
  id v8 = [v5 traitOverrides];
  [v8 setHorizontalSizeClass:v7];

  if ([(_SFBrowserContentViewController *)self _isPreviewing])
  {
    [(_SFBrowserContentViewController *)self preferredContentSize];
    double v10 = Width;
    if (Width == 0.0)
    {
      id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v6 bounds];
      double Width = CGRectGetWidth(v13);
    }
    [(_SFBrowserView *)self->_browserView setUnscaledWebViewWidth:Width];
    if (v10 == 0.0) {
  }
    }
  else
  {
    [(_SFBrowserView *)self->_browserView setUnscaledWebViewWidth:0.0];
  }
}

- (void)viewDidLayoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v9 viewDidLayoutSubviews];
  BOOL v3 = [(_SFBrowserContentViewController *)self view];
  [v3 frame];
  if (v5 == self->_lastSizeUsedForBrowserViewLayout.width && v4 == self->_lastSizeUsedForBrowserViewLayout.height)
  {
  }
  else
  {
    unint64_t sizeTransitionCount = self->_sizeTransitionCount;

    if (!sizeTransitionCount)
    {
      [(_SFBrowserContentViewController *)self _layOutBrowserViewForSizeTransition];
      [(_SFBrowserContentViewController *)self _didCompleteViewSizeTransition];
    }
  }
  [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
  if (self->_interfaceFillsScreen || (BOOL showingReader = self->_showingReader)) {
    BOOL showingReader = self->_quickLookDocumentController == 0;
  }
  self->_BOOL autoHidingHomeIndicatorPermitted = showingReader;
  [(_SFBrowserContentViewController *)self _updateHomeIndicatorAutoHideState];
  [(_SFBrowserContentViewController *)self _updateWebViewLayoutSize];
}

- (int64_t)preferredStatusBarStyle
{
  return self->_customPreferredStatusBarStyle;
}

- (void)_updateStatusBarStyleForced:(BOOL)a3
{
  double v5 = [(_SFBrowserView *)self->_browserView navigationBar];
  id v6 = [v5 effectiveTheme];
  if ([v6 backdropIsDark]) {
    int64_t v7 = 1;
  }
  else {
    int64_t v7 = 3;
  }

  if (self->_customPreferredStatusBarStyle != v7 || a3)
  {
    self->_customPreferredStatusBarStyle = v7;
    [(_SFBrowserContentViewController *)self setNeedsStatusBarAppearanceUpdate];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v10 traitCollectionDidChange:v4];
  double v5 = [v4 preferredContentSizeCategory];
  id v6 = [(_SFBrowserContentViewController *)self traitCollection];
  int64_t v7 = [v6 preferredContentSizeCategory];
  NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v5, v7);

  if (v8)
  {
    objc_super v9 = [(_SFBrowserView *)self->_browserView pinnableBanner];
    [v9 contentSizeCategoryDidChange];
  }
}

- (void)_setUpToolbar
{
  BOOL v3 = [(_SFBrowserView *)self->_browserView navigationBar];

  if (v3)
  {
    int64_t displayMode = self->_displayMode;
    BOOL v6 = !self->_usesNarrowLayout && displayMode != 3;
    bottomToolbar = self->_bottomToolbar;
    if (!self->_usesNarrowLayout || displayMode == 3)
    {
      if (bottomToolbar)
      {
        self->_bottomToolbar = 0;
      }
    }
    else if (!bottomToolbar)
    {
      objc_super v9 = [[_SFToolbar alloc] initWithPlacement:1];
      objc_super v10 = self->_bottomToolbar;
      self->_bottomToolbar = v9;

      objc_super v11 = _SFBackdropGroupNameForOwner();
      [(_SFToolbar *)self->_bottomToolbar setBackdropGroupName:v11];

      [(_SFBarManager *)self->_barManager registerToolbar:self->_bottomToolbar withLayout:2 persona:[(_SFBrowserContentViewController *)self _persona]];
    }
    [(_SFBrowserView *)self->_browserView setToolbar:self->_bottomToolbar];
    navigationBar = self->_navigationBar;
    [(_SFNavigationBar *)navigationBar setHasToolbar:v6];
  }
}

- (void)setPreferredBarTintColor:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_preferredBarTintColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredBarTintColor, a3);
    double v5 = [(_SFBrowserContentViewController *)self viewIfLoaded];
    [v5 setNeedsLayout];
  }
}

- (void)setPreferredControlTintColor:(id)a3
{
  id v6 = a3;
  if (([v6 isEqual:self->_preferredControlTintColor] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredControlTintColor, a3);
    double v5 = [(_SFBrowserContentViewController *)self viewIfLoaded];
    [v5 setNeedsLayout];
  }
}

- (void)setHostAppModalPresentationStyle:(int64_t)a3
{
  self->_hostAppModalPresentationStyle = a3;
  if (![(_SFBrowserContentViewController *)self _effectiveBarCollapsingEnabled])
  {
    [(_SFBrowserContentViewController *)self _showBars];
  }
}

- (BOOL)_effectiveBarCollapsingEnabled
{
  BOOL v3 = [(SFSafariViewControllerConfiguration *)self->_configuration barCollapsingEnabled];
  if (v3) {
    LOBYTE(v3) = ![(_SFBrowserContentViewController *)self _isPresentedAsSheet];
  }
  return v3;
}

- (BOOL)_isPresentedAsSheet
{
  return (unint64_t)(self->_hostAppModalPresentationStyle - 1) < 2;
}

- (void)_updateBarTheme
{
  id v7 = [(_SFBrowserContentViewController *)self traitCollection];
  uint64_t v3 = [v7 userInterfaceStyle];

  if (v3 == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  id v8 = [MEMORY[0x1E4F78548] themeWithBarTintStyle:v4 preferredBarTintColor:self->_preferredBarTintColor controlsTintColor:self->_preferredControlTintColor];
  -[_SFNavigationBar setTheme:](self->_navigationBar, "setTheme:");
  [(_SFToolbar *)self->_bottomToolbar setTheme:v8];
  double v5 = [MEMORY[0x1E4F781D8] themeWithTheme:v8];
  id v6 = [(_SFBrowserView *)self->_browserView crashBanner];
  [v6 setTheme:v5];
}

- (void)setDismissButtonStyle:(int64_t)a3
{
  self->_dismissButtonStyle = a3;
  -[_SFBrowserView updateDismissButtonStyle:](self->_browserView, "updateDismissButtonStyle:");
}

- (void)setConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_configuration, a3);
  [(_SFBrowserContentViewController *)self _updateModalInPresentation];
  customButtonUIActivity = self->_customButtonUIActivity;
  self->_customButtonUIActivity = 0;

  self->_customActivityButtonIsValid = 0;
  id v7 = [(SFSafariViewControllerConfiguration *)self->_configuration activityButton];
  id v8 = v7;
  if (v7)
  {
    if ([v7 _fieldsAreValid])
    {
      objc_super v9 = [v8 extensionIdentifier];
      id v18 = 0;
      objc_super v10 = [MEMORY[0x1E4F28C70] extensionWithIdentifier:v9 error:&v18];
      id v11 = v18;
      if (v11 || !v10)
      {
        CGRect v12 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          CGFloat v16 = objc_msgSend(v11, "safari_privacyPreservingDescription");
          -[_SFBrowserContentViewController setConfiguration:]((uint64_t)v9, v16, buf, v12);
        }
      }
      else
      {
        CGRect v12 = [(_SFBrowserContentViewController *)self _hostAppBundleId];
        CGRect v13 = [(UIApplicationExtensionActivity *)[_SFApplicationExtensionActivity alloc] initWithApplicationExtension:v10];
        BOOL v14 = [(_SFApplicationExtensionActivity *)v13 validateExtensionHasSameContainerAsHostApp:v12];
        self->_customActivityButtonIsValid = v14;
        if (v14)
        {
          objc_storeStrong((id *)&self->_customButtonUIActivity, v13);
        }
        else
        {
          BOOL v17 = WBS_LOG_CHANNEL_PREFIXExtensions();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            [(_SFBrowserContentViewController *)(uint64_t)v9 setConfiguration:v17];
          }
        }
      }
    }
    else
    {
      double v15 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[_SFBrowserContentViewController setConfiguration:]();
      }
    }
  }
  [(_SFBrowserContentViewController *)self _updateUI];
}

- (void)_updateUsesNarrowLayout
{
  uint64_t v3 = [(_SFBrowserContentViewController *)self view];
  [v3 bounds];
  uint64_t IsCompactSizeClass = _SFWidthIsCompactSizeClass();

  if (self->_usesNarrowLayout != IsCompactSizeClass)
  {
    self->_usesNarrowLayout = IsCompactSizeClass;
    [(_SFNavigationBar *)self->_navigationBar setUsesNarrowLayout:IsCompactSizeClass];
    [(_SFBrowserContentViewController *)self _setUpToolbar];
  }
}

- (void)_updateInterfaceFillsScreen
{
  uint64_t v3 = [(_SFBrowserContentViewController *)self traitCollection];
  self->_BOOL interfaceFillsScreen = [v3 verticalSizeClass] == 1;

  BOOL interfaceFillsScreen = self->_interfaceFillsScreen;
  browserView = self->_browserView;

  [(_SFBrowserView *)browserView setNavigationBarBehavior:interfaceFillsScreen];
}

- (void)_updateUsesLockdownStatusBar
{
  int v3 = [MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari];
  if (v3) {
    id v4 = objc_alloc_init(MEMORY[0x1E4F782D0]);
  }
  else {
    id v4 = 0;
  }
  [(_SFNavigationBar *)self->_navigationBar setLockdownStatusBar:v4];
  if (v3) {

  }
  navigationBarItem = self->_navigationBarItem;
  id v6 = [(_SFNavigationBar *)self->_navigationBar lockdownStatusBar];
  [v6 setNavigationBarItem:navigationBarItem];

  [(_SFBrowserContentViewController *)self _updateDynamicBarGeometry];
}

- (id)_currentWebView
{
  if (self->_showingReader) {
    [(_SFReaderViewController *)self->_readerViewController readerWebView];
  }
  else {
  id v2 = [(_SFBrowserContentViewController *)self webView];
  }

  return v2;
}

- (double)_maximumHeightObscuredByBottomBar
{
  if (!self->_usesNarrowLayout) {
    return 0.0;
  }
  -[_SFToolbar sizeThatFits:](self->_bottomToolbar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;
  [(_SFBrowserContentViewController *)self _sf_bottomUnsafeAreaFrameForToolbar];
  return v4 + CGRectGetHeight(v6);
}

- (void)_updateDynamicBarGeometry
{
  dynamicBarAnimator = self->_dynamicBarAnimator;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60___SFBrowserContentViewController__updateDynamicBarGeometry__block_invoke;
  v3[3] = &unk_1E5C73108;
  v3[4] = self;
  [(_SFDynamicBarAnimator *)dynamicBarAnimator performBatchUpdates:v3];
}

- (double)_offsetForDynamicBarAnimator
{
  if ([(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer state] == 2)
  {
    [(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer translationInView:self->_navigationBar];
    return -v3;
  }
  else
  {
    id v5 = [(_SFBrowserContentViewController *)self _currentWebView];
    CGRect v6 = [v5 scrollView];
    [v6 contentOffset];
    double v4 = v7;
  }
  return v4;
}

- (double)dynamicBarAnimator:(id)a3 minimumTopBarHeightForOffset:(double)a4
{
  id v6 = a3;
  if (self->_keepBarsMinimized || self->_alwaysShowTopBar)
  {
    double v7 = 2.22507386e-308;
  }
  else
  {
    objc_super v9 = [(_SFBrowserView *)self->_browserView navigationBar];
    [v9 defaultHeight];
    double v11 = v10;

    CGRect v12 = [(_SFBrowserContentViewController *)self _currentWebView];
    CGRect v13 = [v12 scrollView];
    [v13 contentInset];
    double v7 = v11 - v14 - a4;
  }
  return v7;
}

- (double)_bottomToolbarHeight
{
  -[_SFToolbar sizeThatFits:](self->_bottomToolbar, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  return v2;
}

- (void)_setWebViewController:(id)a3
{
  id v6 = a3;
  -[_SFBrowserView addWebViewController:](self->_browserView, "addWebViewController:");
  double v4 = [v6 webView];
  id v5 = [v4 scrollView];
  [v5 setDelegate:self];

  [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
  objc_msgSend(v4, "_setFindInteractionEnabled:", -[_SFBrowserContentViewController _onlyWantsWebAppShortcuts](self, "_onlyWantsWebAppShortcuts") ^ 1);
  [(_SFBrowserContentViewController *)self becomeFirstResponder];
}

- (WKWebView)webView
{
  double v2 = [(_SFBrowserContentViewController *)self webViewController];
  double v3 = [v2 webView];

  return (WKWebView *)v3;
}

- (void)_hideReaderAnimated:(BOOL)a3 deactivationMode:(unint64_t)a4
{
}

- (void)_showReaderAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_SFBrowserContentViewController *)self isBlockedByScreenTime])
  {
    [(_SFBrowserContentViewController *)self _setShowingReader:1 deactivationMode:2 animated:v3];
  }
}

- (BOOL)_readerViewControllerNeedsSetUp
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webView];
  double v4 = [v3 backForwardList];
  id v5 = [v4 currentItem];

  if (self->_readerViewController) {
    int v6 = [v5 isEqual:self->_lastBackFowardListItemOnWhichReaderWasActivated] ^ 1;
  }
  else {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)_setUpReaderViewController
{
  if ([(_SFBrowserContentViewController *)self _readerViewControllerNeedsSetUp])
  {
    BOOL v3 = [(_SFBrowserContentViewController *)self _makeReaderViewController];
    readerViewController = self->_readerViewController;
    self->_readerViewController = v3;
  }
}

- (id)_makeReaderViewController
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webViewController];
  double v4 = [v3 webView];
  id v5 = [v4 backForwardList];
  int v6 = [v5 currentItem];

  double v7 = [[_SFReaderViewController alloc] initWithOriginalWebView:v4];
  [(_SFReaderViewController *)v7 setDelegate:self];
  id v8 = [v4 URL];
  objc_msgSend(v3, "setSupportsAdvancedPrivacyProtections:", -[_SFBrowserContentViewController supportsAdvancedPrivacyProtectionsForURL:](self, "supportsAdvancedPrivacyProtectionsForURL:", v8));

  objc_super v9 = [(_SFReaderViewController *)v7 view];
  [v3 setUpReaderWithReaderWebView:v9];

  lastBackFowardListItemOnWhichReaderWasActivated = self->_lastBackFowardListItemOnWhichReaderWasActivated;
  self->_lastBackFowardListItemOnWhichReaderWasActivated = v6;

  return v7;
}

- (void)_setShowingReader:(BOOL)a3 deactivationMode:(unint64_t)a4 animated:(BOOL)a5
{
  if (self->_showingReader != a3)
  {
    BOOL v5 = a5;
    BOOL v7 = a3;
    -[_SFBrowserContentViewController _setShowingReader:](self, "_setShowingReader:");
    [(_SFBrowserContentViewController *)self _updateUI];
    [(_SFBrowserContentViewController *)self _updateUserActivitySoon];
    objc_super v9 = [(_SFBrowserContentViewController *)self pageFormatMenuController];
    double v10 = [v9 viewController];
    [v10 dismissViewControllerAnimated:1 completion:0];

    double v11 = [(_SFBrowserContentViewController *)self webViewController];
    CGRect v12 = [v11 dialogController];
    [v12 owningTabWillClose];

    CGRect v13 = [(_SFBrowserView *)self->_browserView contentContainerView];
    double v14 = [v13 snapshotViewAfterScreenUpdates:0];

    if (v7)
    {
      [(_SFBrowserContentViewController *)self _setUpReaderViewController];
      [(_SFBrowserContentViewController *)self addChildViewController:self->_readerViewController];
      [(_SFReaderViewController *)self->_readerViewController didMoveToParentViewController:self];
      [(_SFBrowserContentViewController *)self _setWebViewController:self->_readerViewController];
      if (!v5) {
        goto LABEL_10;
      }
    }
    else
    {
      [(_SFReaderViewController *)self->_readerViewController willMoveToParentViewController:0];
      [(_SFReaderViewController *)self->_readerViewController removeFromParentViewController];
      [(_SFBrowserContentViewController *)self _setWebViewController:v11];
      self->_lastReaderDeactivationMode = a4;
      if (!v5)
      {
LABEL_10:

        return;
      }
    }
    double v15 = [(_SFBrowserView *)self->_browserView window];
    [v15 setUserInteractionEnabled:0];
    uint64_t v34 = 0;
    double v35 = (double *)&v34;
    uint64_t v36 = 0x5012000000;
    double v37 = __Block_byref_object_copy__10;
    double v38 = __Block_byref_object_dispose__10;
    double v39 = &unk_1A6ABB4C3;
    long long v40 = 0u;
    long long v41 = 0u;
    [v14 bounds];
    *(void *)&long long v40 = v16;
    *((void *)&v40 + 1) = v17;
    *(void *)&long long v41 = v18;
    *((void *)&v41 + 1) = v19;
    id v20 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v21 = objc_msgSend(v20, "initWithFrame:", v35[6], v35[7], v35[8], v35[9]);
    [v21 setClipsToBounds:1];
    [v21 addSubview:v14];
    double v22 = [(_SFBrowserView *)self->_browserView contentContainerView];
    if (self->_showingReader) {
      [(_SFReaderViewController *)self->_readerViewController view];
    }
    else {
    double v23 = [v11 view];
    }
    [v22 insertSubview:v21 aboveSubview:v23];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke;
    v28[3] = &unk_1E5C77070;
    id v24 = v15;
    double v33 = &v34;
    id v29 = v24;
    double v30 = self;
    id v25 = v21;
    id v31 = v25;
    id v32 = v14;
    double v26 = (void *)MEMORY[0x1AD0C36A0](v28);
    double v27 = [v11 readerController];
    [v27 setUpReaderWebViewIfNeededAndPerformBlock:v26];

    _Block_object_dispose(&v34, 8);
    goto LABEL_10;
  }
}

- (void)_setShowingReader:(BOOL)a3
{
  if (self->_showingReader != a3)
  {
    BOOL v3 = a3;
    self->_BOOL showingReader = a3;
    id v8 = [(_SFBrowserContentViewController *)self webViewController];
    BOOL v5 = [v8 readerController];
    [v5 setReaderIsActive:v3];

    if (v3)
    {
      int v6 = [(_SFBrowserContentViewController *)self processPool];
      SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(v6, v7);
    }
  }
}

- (id)_requestBySettingAdvancedPrivacyProtectionsFlag:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 URL];
  BOOL v6 = [(_SFBrowserContentViewController *)self supportsAdvancedPrivacyProtectionsForURL:v5];

  BOOL v7 = objc_msgSend(v4, "safari_requestBySettingAdvancedPrivacyProtectionsFlagIsEnabled:", v6);

  return v7;
}

- (void)loadRequest:(id)a3
{
  id v4 = a3;
  self->_loadWasUserDriven = 1;
  [(_SFBrowserContentViewController *)self _willBeginUserInitiatedNavigation];
  BOOL v5 = [(_SFBrowserContentViewController *)self _requestBySettingAdvancedPrivacyProtectionsFlag:v4];

  if (self->_originalRequestURL
    || ([v5 URL],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = objc_msgSend(v6, "safari_isWellKnownChangePasswordURL"),
        v6,
        !v7))
  {
    CGRect v13 = [(_SFBrowserContentViewController *)self webView];
    id v14 = (id)[v13 loadRequest:v5];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x1E4F98FC8]);
    objc_super v9 = [v5 URL];
    double v10 = (WBSWellKnownURLResponseCodeReliabilityChecker *)[v8 initWithURL:v9];
    wellKnownURLResponseCodeReliabilityChecker = self->_wellKnownURLResponseCodeReliabilityChecker;
    self->_wellKnownURLResponseCodeReliabilityChecker = v10;

    objc_initWeak(&location, self);
    CGRect v12 = self->_wellKnownURLResponseCodeReliabilityChecker;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47___SFBrowserContentViewController_loadRequest___block_invoke;
    v17[3] = &unk_1E5C74A08;
    objc_copyWeak(&v19, &location);
    id v18 = v5;
    [(WBSWellKnownURLResponseCodeReliabilityChecker *)v12 checkReliabilityWithCompletion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  [(_SFPageLoadErrorController *)self->_pageLoadErrorController clearFailedRequest];
  double v15 = [v5 URL];
  originalRequestURL = self->_originalRequestURL;
  self->_originalRequestURL = v15;

  [(_SFBrowserContentViewController *)self becomeFirstResponder];
}

- (void)addTrustedEventAttribution:(id)a3
{
  id v4 = a3;
  BOOL v5 = WBS_LOG_CHANNEL_PREFIXEventAttribution();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1A690B000, v5, OS_LOG_TYPE_INFO, "Giving valid UIEventAttribution to WebKit", v8, 2u);
  }
  BOOL v6 = [(_SFBrowserContentViewController *)self webView];
  int v7 = [(_SFBrowserContentViewController *)self _hostAppBundleId];
  [v6 _setEphemeralUIEventAttribution:v4 forApplicationWithBundleID:v7];
}

- (BOOL)isShowingErrorPage
{
  BOOL v3 = [(_SFBrowserContentViewController *)self quickLookDocument];

  id v4 = [(_SFBrowserContentViewController *)self webView];
  BOOL v5 = v4;
  if (!v3)
  {
    id v8 = [v4 _unreachableURL];
    if (v8)
    {
      BOOL v7 = 1;
      goto LABEL_9;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [v5 _safeBrowsingWarning];
    BOOL v7 = v6 != 0;

    if (!v3) {
      goto LABEL_6;
    }
  }
  else
  {
    BOOL v7 = 0;
    if (!v3)
    {
LABEL_6:
      id v8 = 0;
LABEL_9:
    }
  }

  return v7;
}

- (BOOL)isSecure
{
  double v2 = [(_SFBrowserContentViewController *)self webView];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ([v2 _negotiatedLegacyTLS] & 1) != 0
    || ![v2 hasOnlySecureContent])
  {
    char v5 = 0;
  }
  else
  {
    BOOL v3 = [v2 URL];
    id v4 = [v2 _committedURL];
    char v5 = [v3 isEqual:v4];
  }
  return v5;
}

- (id)_EVOrganizationName
{
  if ([(_SFBrowserContentViewController *)self isSecure])
  {
    if (self->_EVOrganizationNameIsValid)
    {
      BOOL v3 = self->_EVOrganizationName;
    }
    else
    {
      self->_EVOrganizationNameIsValid = 1;
      id v4 = [(_SFBrowserContentViewController *)self webView];
      char v5 = [v4 evOrganizationName];
      EVOrganizationName = self->_EVOrganizationName;
      self->_EVOrganizationName = v5;

      BOOL v3 = self->_EVOrganizationName;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_invalidateEVOrganizationName
{
  EVOrganizationName = self->_EVOrganizationName;
  self->_EVOrganizationName = 0;

  self->_EVOrganizationNameIsValid = 0;
}

- (void)_updateNavigationBar
{
  if (self->_navigationBarItem)
  {
    BOOL v3 = [(_SFBrowserContentViewController *)self webViewController];
    id v4 = [v3 webView];
    if (-[WBSURLSpoofingMitigator UIShouldReflectCommittedURLInsteadOfCurrentURL](self->_URLSpoofingMitigator, "UIShouldReflectCommittedURLInsteadOfCurrentURL"))[v4 _committedURL]; {
    else
    }
    char v5 = [v4 URL];
    if (!v5)
    {
      activeDownload = self->_activeDownload;
      if (activeDownload)
      {
        char v5 = [(_SFDownload *)activeDownload sourceURL];
      }
      else
      {
        char v5 = 0;
      }
    }
    BOOL v7 = objc_msgSend(v5, "safari_userVisibleStringConsideringLongURLs");
    id v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(SFNavigationBarItem *)self->_navigationBarItem customPlaceholderText];
    }
    double v10 = v9;

    unint64_t v30 = 0;
    objc_msgSend(v10, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 5, 0, &v30);
    double v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    unint64_t v29 = 0;
    double v28 = objc_msgSend(v10, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, &v29);
    if (self->_isShowingHTTPAuthenticationDialog)
    {
      uint64_t v12 = _WBSLocalizedString();

      double v11 = (__CFString *)v12;
      [(SFNavigationBarItem *)self->_navigationBarItem setText:v12 textWhenExpanded:v12 startIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    else if (objc_msgSend(v5, "safari_isDataURL"))
    {

      double v11 = @"data:";
      [(SFNavigationBarItem *)self->_navigationBarItem setText:@"data:" textWhenExpanded:@"data:" startIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    else
    {
      if (v29 >= v30) {
        uint64_t v13 = v29 - v30;
      }
      else {
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      [(SFNavigationBarItem *)self->_navigationBarItem setText:v28 textWhenExpanded:v11 startIndex:v13];
    }
    if (v28
      && [(_SFBrowserContentViewController *)self isPageEligibileToShowNotSecureWarning])
    {
      navigationBarItem = self->_navigationBarItem;
      uint64_t v15 = [v3 hasFocusedInputFieldOnCurrentPage];
      uint64_t v16 = 1;
    }
    else
    {
      navigationBarItem = self->_navigationBarItem;
      uint64_t v15 = [v3 hasFocusedInputFieldOnCurrentPage];
      uint64_t v16 = 0;
    }
    [navigationBarItem setSecurityAnnotation:v16 hasFocusedInputFieldOnCurrentPage:v15];
    if (self->_wasLoadedWithLockdownModeEnabled) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    [(SFNavigationBarItem *)self->_navigationBarItem setLockdownModeAnnotation:v17];
    BOOL v18 = !self->_isShowingHTTPAuthenticationDialog && [(_SFBrowserContentViewController *)self isSecure];
    [(SFNavigationBarItem *)self->_navigationBarItem setShowsLockIcon:v18];
    id v19 = self->_navigationBarItem;
    BOOL isShowingHTTPAuthenticationDialog = self->_isShowingHTTPAuthenticationDialog;
    if (self->_isShowingHTTPAuthenticationDialog)
    {
      uint64_t v21 = 0;
    }
    else
    {
      navigationBarItem = [v3 readerController];
      uint64_t v21 = [navigationBarItem isReaderAvailable];
    }
    [v19 setShowsReaderButton:v21 showsAvailabilityText:0];
    if (!isShowingHTTPAuthenticationDialog) {

    }
    [(SFNavigationBarItem *)self->_navigationBarItem setShowsTranslationButton:[(WBSTranslationContext *)self->_translationContext detectionNotificationLevel] == 1 showsAvailabilityText:0];
    [(SFNavigationBarItem *)self->_navigationBarItem setReaderButtonSelected:self->_showingReader];
    double v22 = [v4 URL];
    [(SFNavigationBarItem *)self->_navigationBarItem setShowsStopReloadButtons:v22 != 0];

    -[SFNavigationBarItem setStopReloadButtonShowsStop:](self->_navigationBarItem, "setStopReloadButtonShowsStop:", [v3 isLoading]);
    char v23 = objc_opt_respondsToSelector();
    if (v23)
    {
      id v19 = [v4 _safeBrowsingWarning];
      BOOL v24 = v19 != 0;
    }
    else
    {
      BOOL v24 = 0;
    }
    [(SFNavigationBarItem *)self->_navigationBarItem setOverrideBarStyleForSecurityWarning:v24];
    if (v23) {

    }
    [(SFNavigationBarItem *)self->_navigationBarItem setShowsPageFormatButton:[(_SFBrowserContentViewController *)self _canShowPageFormatMenu]];
    uint64_t v25 = [(SFNavigationBarItem *)self->_navigationBarItem showsLockIcon];
    nanoDomainContainerView = self->_nanoDomainContainerView;
    double v27 = [(SFNavigationBarItem *)self->_navigationBarItem text];
    [(SFNanoDomainContainerView *)nanoDomainContainerView updateWithDomain:v27 isSecure:v25 showsNotSecureAnnotation:0];

    [(_SFBrowserContentViewController *)self didUpdateNavigationBarItem:self->_navigationBarItem];
  }
}

- (BOOL)_canShowPageFormatMenu
{
  double v2 = [(_SFBrowserContentViewController *)self webView];
  BOOL v3 = [v2 URL];
  if (!objc_msgSend(v3, "safari_isHTTPFamilyURL")
    || ([v2 _isDisplayingPDF] & 1) != 0
    || ([v2 _isDisplayingStandaloneImageDocument] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v2 _isDisplayingStandaloneMediaDocument] ^ 1;
  }

  return v4;
}

- (void)_updatePreviewLoadingUI
{
  BOOL v3 = [(_SFBrowserView *)self->_browserView previewHeader];

  if (v3)
  {
    int v4 = [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator UIShouldReflectCommittedURLInsteadOfCurrentURL];
    char v5 = [(_SFBrowserContentViewController *)self webView];
    id v10 = v5;
    if (v4) {
      [v5 _committedURL];
    }
    else {
    uint64_t v6 = [v5 URL];
    }

    activeDownload = (void *)v6;
    if (!v6)
    {
      activeDownload = self->_activeDownload;
      if (activeDownload)
      {
        activeDownload = [activeDownload sourceURL];
      }
    }
    browserView = self->_browserView;
    id v11 = activeDownload;
    id v9 = objc_msgSend(activeDownload, "safari_userVisibleString");
    [(_SFBrowserView *)browserView updatePreviewHeaderWithURLString:v9];
  }
}

- (void)_updateBarItems
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webView];
  barManager = self->_barManager;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50___SFBrowserContentViewController__updateBarItems__block_invoke;
  v6[3] = &unk_1E5C72628;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(_SFBarManager *)barManager performCoalescedUpdates:v6];
}

- (void)_updateUI
{
  [(_SFBrowserContentViewController *)self _updateNavigationBar];
  [(_SFBrowserContentViewController *)self _updateBarItems];
  [(_SFBrowserContentViewController *)self _updatePreviewLoadingUI];
  [(_SFBrowserContentViewController *)self _updateStatusBarStyleForced:0];
  BOOL v3 = [(_SFBrowserContentViewController *)self webView];
  -[_SFBrowserContentViewController setRemoteSwipeGestureEnabled:](self, "setRemoteSwipeGestureEnabled:", [v3 canGoBack] ^ 1);

  [(_SFBrowserContentViewController *)self _updateBarTheme];
}

- (void)setRemoteSwipeGestureEnabled:(BOOL)a3
{
  if (self->_remoteSwipeGestureEnabled != a3)
  {
    self->_remoteSwipeGestureEnabled = a3;
    [(_SFBrowserContentViewController *)self _updateRemoteSwipeGestureState];
  }
}

- (void)_showGenericDownloadAlert
{
}

- (double)_crashBannerDraggingOffsetForContentOffset:(CGPoint)a3
{
  double y = a3.y;
  unint64_t v5 = [(_SFBrowserView *)self->_browserView navigationBarBehavior];
  [(_SFNavigationBar *)self->_navigationBar maximumHeight];
  double v7 = v6;
  double v8 = 0.0;
  if (!v5)
  {
    [(_SFNavigationBar *)self->_navigationBar minimumHeight];
    double v8 = v9;
  }
  id v10 = [(_SFBrowserView *)self->_browserView currentWebView];
  id v11 = [v10 scrollView];
  [v11 adjustedContentInset];
  double v13 = v12;
  id v14 = [(_SFBrowserView *)self->_browserView pinnableBanner];
  [v14 frame];
  double v15 = v7 - v8 - v13 + CGRectGetHeight(v17);

  if (v15 <= y) {
    return y;
  }
  else {
    return v15;
  }
}

- (void)_updateCrashBannerOffset
{
  BOOL v3 = [(_SFBrowserView *)self->_browserView crashBanner];
  id v11 = v3;
  if (self->_showingCrashBanner)
  {
    [(_SFBrowserView *)self->_browserView setCrashBannerOffset:0.0];
    if (self->_scrollViewIsDragging)
    {
      [(_SFBrowserView *)self->_browserView crashBannerOffset];
      double v5 = v4;
      double crashBannerDraggingOffset = self->_crashBannerDraggingOffset;
      double v7 = [(_SFBrowserContentViewController *)self _currentWebView];
      double v8 = [v7 scrollView];
      [v8 contentOffset];
      if (v5 >= crashBannerDraggingOffset - v9) {
        double v10 = crashBannerDraggingOffset - v9;
      }
      else {
        double v10 = v5;
      }
      [(_SFBrowserView *)self->_browserView setCrashBannerOffset:v10];
    }
  }
  else
  {
    [v3 bounds];
    [(_SFBrowserView *)self->_browserView setCrashBannerOffset:-CGRectGetHeight(v13)];
  }
}

- (void)_updatePinnableBannerOffset
{
  BOOL v3 = [(_SFBrowserView *)self->_browserView pinnableBanner];
  if (v3 && self->_showingPinnableBanner)
  {
    id v15 = v3;
    [v3 frame];
    double Height = CGRectGetHeight(v17);
    if (self->_showingCrashBanner)
    {
      double v5 = [(_SFBrowserView *)self->_browserView crashBanner];
      [v5 frame];
      double v6 = CGRectGetHeight(v18);
      [(_SFBrowserView *)self->_browserView crashBannerOffset];
      double v8 = v6 + v7 + 0.0;
    }
    else
    {
      double v8 = 0.0;
    }
    if (self->_showingPinnableBanner) {
      double v9 = Height;
    }
    else {
      double v9 = -0.0;
    }
    [(_SFNavigationBar *)self->_navigationBar bounds];
    double MaxY = CGRectGetMaxY(v19);
    id v11 = [(_SFBrowserContentViewController *)self _currentWebView];
    double v12 = [v11 scrollView];
    objc_msgSend(v12, "convertPoint:fromView:", self->_navigationBar, 0.0, v8 + v9 + MaxY);

    CGRect v13 = [(_SFBrowserContentViewController *)self _currentWebView];
    id v14 = [v13 scrollView];
    [v14 contentOffset];
    -[_SFBrowserView setPinnableBannerOffset:](self->_browserView, "setPinnableBannerOffset:");

    BOOL v3 = v15;
  }
}

- (void)_hideCrashBanner
{
}

- (void)_updatePinnableBannerFrame
{
  BOOL v3 = [(_SFBrowserView *)self->_browserView pinnableBanner];
  if (v3 && self->_showingPinnableBanner)
  {
    id v22 = v3;
    double v4 = [(_SFBrowserView *)self->_browserView currentWebView];
    double v5 = [(_SFBrowserContentViewController *)self view];
    [v5 layoutMargins];
    objc_msgSend(v22, "setLayoutMargins:");

    double v6 = [v4 scrollView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    objc_msgSend(v22, "sizeThatFits:", v10, v12);
    objc_msgSend(v22, "setFrame:", v8, 0.0, v13, v14);
    [(_SFBrowserView *)self->_browserView layoutIfNeeded];
    [(_SFBrowserContentViewController *)self _updatePinnableBannerOffset];
    [(_SFBrowserContentViewController *)self _updateBarTheme];
    [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
    id v15 = [v4 scrollView];
    [v15 contentOffset];
    double v17 = v16;
    double v19 = v18;
    [v15 adjustedContentInset];
    if (v19 <= -v20) {
      double v21 = -v20;
    }
    else {
      double v21 = v19;
    }
    objc_msgSend(v15, "setContentOffset:", v17, v21);

    BOOL v3 = v22;
  }
}

- (BOOL)_updateAppInfoOverlayForBanner:(id)a3
{
  id v4 = a3;
  double v5 = [v4 overlayProvider];
  double v6 = [(_SFBrowserView *)self->_browserView currentWebView];
  double v7 = [v6 scrollView];

  if (!v4)
  {
    [v5 hideOverlayAnimated:0];
    goto LABEL_5;
  }
  if (![v5 isAvailable])
  {
LABEL_5:
    [(_SFBrowserView *)self->_browserView setAppInfoOverlay:0];
    [v5 setDelegate:0];
    BOOL v11 = 0;
    goto LABEL_6;
  }
  [v5 setDelegate:self];
  double v8 = [(_SFBrowserContentViewController *)self webViewController];
  [v5 showOverlayInScrollView:v7 viewController:v8];

  [(_SFBrowserView *)self->_browserView setPinnableBanner:v4];
  double v9 = [v5 overlayViewController];
  double v10 = [v9 view];
  [(_SFBrowserView *)self->_browserView setAppInfoOverlay:v10];

  BOOL v11 = 1;
LABEL_6:

  return v11;
}

- (void)_setShowingPinnableBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(_SFBrowserContentViewController *)self _updateAppInfoOverlayForBanner:v6])
  {
    BOOL v7 = v6 != 0;
    if (self->_showingPinnableBanner != v7)
    {
      self->_showingPinnableBanner = v7;
      if (v6)
      {
        [(_SFBrowserView *)self->_browserView setPinnableBanner:v6];
        [(_SFBrowserContentViewController *)self _updatePinnableBannerFrame];
        double v8 = [(_SFBrowserView *)self->_browserView currentWebView];
        double v9 = [v8 scrollView];

        [v6 frame];
        double MaxY = CGRectGetMaxY(v18);
        navigationBar = self->_navigationBar;
        [(_SFNavigationBar *)navigationBar bounds];
        -[_SFNavigationBar convertPoint:toView:](navigationBar, "convertPoint:toView:", v9, 0.0, CGRectGetMaxY(v19));
        if (MaxY >= v12 && ([v6 isInitiallyBehindNavigationBar] & 1) == 0)
        {
          [v9 contentOffset];
          double v14 = v13;
          [v9 adjustedContentInset];
          objc_msgSend(v9, "setContentOffset:", v14, -v15);
        }
      }
      else
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __70___SFBrowserContentViewController__setShowingPinnableBanner_animated___block_invoke;
        v17[3] = &unk_1E5C73108;
        void v17[4] = self;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __70___SFBrowserContentViewController__setShowingPinnableBanner_animated___block_invoke_2;
        v16[3] = &unk_1E5C77048;
        void v16[4] = self;
        objc_msgSend(MEMORY[0x1E4FB1EB0], "sf_animate:usingDefaultTimingWithOptions:animations:completion:", v4, 2, v17, v16);
      }
    }
  }
}

- (void)_setShowingCrashBanner:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(_SFBrowserView *)self->_browserView crashBanner];
  id v10 = v7;
  BOOL v8 = self->_showingCrashBanner != v5 || v7 == 0;
  if (v8 || [v7 messageType])
  {
    if (v5) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F78258]);
    }
    else {
      id v9 = 0;
    }
    [(_SFBrowserContentViewController *)self _showCrashBanner:v9 animated:v4];
  }
}

- (void)_showCrashBanner:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(_SFBrowserView *)self->_browserView crashBanner];
  BOOL v8 = (void *)v7;
  if (v6 && v7)
  {
    uint64_t v9 = [v6 messageType];
    if (v9 == [v8 messageType]) {
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  if (v6 && !v7)
  {
    id v10 = _SFBackdropGroupNameForOwner();
    [v6 setBackdropGroupName:v10];

    BOOL v11 = [v6 closeButton];
    [v11 addTarget:self action:sel__hideCrashBanner forControlEvents:64];

    [(_SFBrowserView *)self->_browserView setCrashBanner:v6];
    [(_SFBrowserView *)self->_browserView bounds];
    double v13 = v12;
    double v15 = v14;
    objc_msgSend(v6, "sizeThatFits:", v16, v17);
    objc_msgSend(v6, "setFrame:", v13, v15, v18, v19);
    [(_SFBrowserContentViewController *)self _updateCrashBannerOffset];
    [(_SFBrowserView *)self->_browserView layoutIfNeeded];
    [(_SFBrowserContentViewController *)self _updateBarTheme];
LABEL_8:
    self->_showingCrashBanner = v6 != 0;
LABEL_10:
    double v20 = [(_SFBrowserView *)self->_browserView navigationBar];
    [v20 setSuppressesBlur:0];

    goto LABEL_11;
  }
  self->_showingCrashBanner = v6 != 0;
  if (v6) {
    goto LABEL_10;
  }
LABEL_11:
  double v21 = (void *)MEMORY[0x1E4FB1EB0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  void v23[2] = __61___SFBrowserContentViewController__showCrashBanner_animated___block_invoke;
  v23[3] = &unk_1E5C72628;
  v23[4] = self;
  id v24 = v6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61___SFBrowserContentViewController__showCrashBanner_animated___block_invoke_2;
  v22[3] = &unk_1E5C77048;
  v22[4] = self;
  objc_msgSend(v21, "sf_animate:usingDefaultTimingWithOptions:animations:completion:", v4, 2, v23, v22);

LABEL_12:
}

- (BOOL)_notifyInitialLoadDidFinish:(BOOL)a3
{
  return 1;
}

- (void)_initialLoadFinishedWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  originalRequestURL = self->_originalRequestURL;
  self->_originalRequestURL = 0;

  if (!self->_didNotifyInitialLoadFinish)
  {
    if ([(_SFBrowserContentViewController *)self _notifyInitialLoadDidFinish:v3]) {
      self->_didNotifyInitialLoadFinish = 1;
    }
  }
}

- (void)_fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4 completion:(id)a5
{
}

- (BOOL)canPrint
{
  return 0;
}

- (id)_applicationPayloadForOpeningInSafari
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webView];
  BOOL v4 = [v3 _sessionState];
  BOOL v5 = [v4 data];

  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [NSNumber numberWithBool:self->_showingReader];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F78780]];

  [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F78788]];
  BOOL v8 = (void *)[v6 copy];

  return v8;
}

- (void)_openCurrentURLInSafari
{
  v10[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_SFBrowserContentViewController *)self _applicationPayloadForOpeningInSafari];
  BOOL v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  BOOL v5 = [(_SFBrowserContentViewController *)self webView];
  id v6 = [v5 URL];
  uint64_t v7 = *MEMORY[0x1E4F22338];
  v9[0] = *MEMORY[0x1E4F22358];
  v9[1] = v7;
  v10[0] = v3;
  v10[1] = MEMORY[0x1E4F1CC38];
  BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  objc_msgSend(v4, "_sf_openURL:withOptions:completionHandler:", v6, v8, 0);
}

- (void)_updatePageZoomWithPreference
{
  objc_initWeak(&location, self);
  BOOL v3 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor pageZoomPreferenceManager];
  BOOL v4 = [(_SFBrowserContentViewController *)self webView];
  BOOL v5 = [v4 URL];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64___SFBrowserContentViewController__updatePageZoomWithPreference__block_invoke;
  v6[3] = &unk_1E5C770E8;
  objc_copyWeak(&v7, &location);
  [v3 getPageZoomFactorForURL:v5 usingBlock:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_increasePageZoomSetting
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webViewController];
  BOOL v4 = v3;
  if (self->_showingReader)
  {
    BOOL v5 = [v3 readerController];
    int v6 = [v5 canIncreaseReaderTextSize];

    if (v6)
    {
      id v7 = [v4 readerController];
      [v7 increaseReaderTextSize];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    BOOL v8 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor pageZoomPreferenceManager];
    uint64_t v9 = [v4 webView];
    id v10 = [v9 URL];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59___SFBrowserContentViewController__increasePageZoomSetting__block_invoke;
    v11[3] = &unk_1E5C77110;
    objc_copyWeak(&v12, &location);
    [v8 zoomInOnURL:v10 completionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_decreasePageZoomSetting
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webViewController];
  BOOL v4 = v3;
  if (self->_showingReader)
  {
    BOOL v5 = [v3 readerController];
    int v6 = [v5 canDecreaseReaderTextSize];

    if (v6)
    {
      id v7 = [v4 readerController];
      [v7 decreaseReaderTextSize];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    BOOL v8 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor pageZoomPreferenceManager];
    uint64_t v9 = [v4 webView];
    id v10 = [v9 URL];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __59___SFBrowserContentViewController__decreasePageZoomSetting__block_invoke;
    v11[3] = &unk_1E5C77110;
    objc_copyWeak(&v12, &location);
    [v8 zoomOutOnURL:v10 completionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)_resetPageZoomSetting
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webViewController];
  BOOL v4 = v3;
  if (self->_showingReader)
  {
    BOOL v5 = [v3 readerController];
    [v5 resetReaderTextSize];
  }
  else
  {
    objc_initWeak(&location, self);
    int v6 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor pageZoomPreferenceManager];
    id v7 = [v4 webView];
    BOOL v8 = [v7 URL];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __56___SFBrowserContentViewController__resetPageZoomSetting__block_invoke;
    v9[3] = &unk_1E5C77110;
    objc_copyWeak(&v10, &location);
    [v6 resetZoomLevelOnURL:v8 completionHandler:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_invokeCustomActivity
{
  BOOL v3 = [(UIApplicationExtensionActivity *)self->_customButtonUIActivity applicationExtension];
  BOOL v4 = [v3 extensionPointIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.share-services"];

  if (v5) {
    getSLComposeViewControllerClass();
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke;
  v6[3] = &unk_1E5C77160;
  void v6[4] = self;
  [(_SFBrowserContentViewController *)self _fetchSharingURLWithCompletionHandler:v6];
}

- (void)_showQuickLookDocumentView
{
  id v6 = [(_SFBrowserContentViewController *)self webView];
  BOOL v3 = [v6 scrollView];
  [v3 setZoomScale:1.0];

  BOOL v4 = [v6 scrollView];
  [v4 setZoomEnabled:0];

  int v5 = [(SFQuickLookDocumentController *)self->_quickLookDocumentController documentView];
  [(_SFBrowserView *)self->_browserView setQuickLookDocumentView:v5];

  [v6 setHidden:1];
}

- (void)_hideQuickLookDocumentView
{
  [(_SFBrowserView *)self->_browserView setQuickLookDocumentView:0];
  id v4 = [(_SFBrowserContentViewController *)self webView];
  [v4 setHidden:0];
  BOOL v3 = [v4 scrollView];
  [v3 setZoomEnabled:1];
}

- (WBSTranslationContext)translationContext
{
  if ([(_SFBrowserContentViewController *)self _canTranslateWebpages]) {
    BOOL v3 = self->_translationContext;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_canTranslateWebpages
{
  return (unint64_t)([(_SFBrowserContentViewController *)self _persona] - 5) < 0xFFFFFFFFFFFFFFFELL;
}

- (id)dataForQuickLookDocument:(id)a3
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webView];
  id v4 = [v3 _dataForDisplayedPDF];

  return v4;
}

- (id)suggestedFileNameForQuickLookDocument:(id)a3
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webView];
  id v4 = objc_msgSend(v3, "_sf_suggestedFilename");

  return v4;
}

- (id)suggestedFileExtensionForQuickLookDocument:(id)a3
{
  return @"pdf";
}

- (id)quickLookDocumentForCurrentBackForwardListItem
{
  double v2 = [(_SFBrowserContentViewController *)self webView];
  BOOL v3 = [v2 backForwardList];
  id v4 = [v3 currentItem];
  int v5 = objc_msgSend(v4, "_sf_quickLookDocument");

  return v5;
}

- (void)setQuickLookDocumentForCurrentBackForwardListItem:(id)a3
{
  id v7 = a3;
  id v4 = [(_SFBrowserContentViewController *)self webView];
  int v5 = [v4 backForwardList];
  id v6 = [v5 currentItem];
  objc_msgSend(v6, "_sf_setQuickLookDocument:", v7);
}

- (id)quickLookDocument
{
  quickLookDocument = self->_quickLookDocument;
  if (!self->_quickLookDocumentCheckCompleted && quickLookDocument == 0)
  {
    self->_quickLookDocumentCheckCompleted = 1;
    id v6 = [(SFQuickLookDocumentWriter *)self->_quickLookDocumentWriter quickLookDocument];
    id v7 = self->_quickLookDocument;
    self->_quickLookDocument = v6;

    if (self->_quickLookDocument) {
      -[_SFBrowserContentViewController setQuickLookDocumentForCurrentBackForwardListItem:](self, "setQuickLookDocumentForCurrentBackForwardListItem:");
    }
    BOOL v8 = [(_SFBrowserContentViewController *)self webView];
    uint64_t v9 = v8;
    if (!self->_quickLookDocument)
    {
      if ([v8 _isDisplayingPDF])
      {
        id v10 = objc_msgSend(v9, "_sf_suggestedFilename");
        id v11 = objc_alloc(MEMORY[0x1E4F78328]);
        id v12 = (SFQuickLookDocument *)[v11 initWithFileName:v10 mimeType:0 uti:*MEMORY[0x1E4F22668] needsQuickLookDocumentView:0];
        double v13 = self->_quickLookDocument;
        self->_quickLookDocument = v12;
      }
      if (!self->_quickLookDocument)
      {
        double v14 = [(_SFBrowserContentViewController *)self quickLookDocumentForCurrentBackForwardListItem];
        double v15 = self->_quickLookDocument;
        self->_quickLookDocument = v14;
      }
    }
    double v16 = [v9 URL];
    [(SFQuickLookDocument *)self->_quickLookDocument setSourceURL:v16];

    [(SFQuickLookDocument *)self->_quickLookDocument setDocumentSource:self];
    id v4 = self->_quickLookDocument;
  }
  else
  {
    id v4 = quickLookDocument;
  }

  return v4;
}

- (void)webViewController:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v15 = a3;
  [(_SFCalendarEventDetector *)self->_calendarEventDetector cancelCheckForConfirmationPage];
  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator didStartProvisionalNavigationWithUserInitiatedAction:self->_lastUserInitiatedAction];
  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  self->_quickLookDocumentWriter = 0;

  quickLookDocument = self->_quickLookDocument;
  self->_quickLookDocument = 0;

  id v7 = [v15 webView];
  BOOL v8 = [v7 _unreachableURL];

  if (!v8)
  {
    lastLoadErrorForFormatMenu = self->_lastLoadErrorForFormatMenu;
    self->_lastLoadErrorForFormatMenu = 0;
  }
  pinnableBannerPendingFirstPaint = self->_pinnableBannerPendingFirstPaint;
  self->_pinnableBannerPendingFirstPaint = 0;

  id v11 = [(_SFBrowserContentViewController *)self webView];
  if (!self->_translationContext)
  {
    id v12 = [MEMORY[0x1E4F98F48] translationContextWithWebView:v11 delegate:self];
    translationContext = self->_translationContext;
    self->_translationContext = v12;

    [(WBSTranslationContext *)self->_translationContext setFluidProgressController:self->_fluidProgressController];
    double v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:self selector:sel__translationContextStateDidChange_ name:*MEMORY[0x1E4F99740] object:self->_translationContext];
  }
  [(_SFBrowserContentViewController *)self _updateUserActivitySoon];
}

- (void)webViewController:(id)a3 authenticationChallenge:(id)a4 shouldAllowLegacyTLS:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, uint64_t))a5;
  id v10 = [(_SFBrowserContentViewController *)self legacyTLSHostManager];
  id v11 = [v8 protectionSpace];
  id v12 = [v11 host];
  uint64_t v13 = [v10 isLegacyTLSAllowedForHost:v12];

  if ((v13 & 1) == 0)
  {
    pageLoadErrorController = self->_pageLoadErrorController;
    id v15 = [v8 protectionSpace];
    double v16 = objc_msgSend(v15, "safari_URL");
    double v17 = [v19 webView];
    double v18 = [v17 URL];
    [(_SFPageLoadErrorController *)pageLoadErrorController handleLegacyTLSWithFailingURL:v16 clickThroughURL:v18 authenticationChallenge:v8];
  }
  v9[2](v9, v13);
}

- (void)authenticationChallengeDidNegotiateModernTLS:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFBrowserContentViewController *)self legacyTLSHostManager];
  int v5 = [v6 host];
  [v4 clearLegacyTLSForHostIfPresent:v5];
}

- (void)webViewController:(id)a3 didCommitNavigation:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  -[_SFReloadOptionsController setEffectiveContentMode:](self->_reloadOptionsController, "setEffectiveContentMode:", [v6 effectiveContentMode]);
  id v7 = [v27 webView];
  id v8 = v7;
  if (self->_suggestedFilenameForNextCommit)
  {
    objc_msgSend(v7, "setSuggestedFilenameForCurrentBackForwardListItem:");
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;
  }
  id v10 = [(_SFBrowserContentViewController *)self sfScribbleController];
  id v11 = [v6 _request];
  id v12 = [v11 URL];
  uint64_t v13 = [v12 host];
  [v10 updateUserDefinedContentBlockerWithHost:v13];

  self->_wasLoadedWithLockdownModeEnabled = self->_pendingNavigationWillLoadWithLockdownModeEnabled;
  [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator didCommitNavigation];
  self->_externalAppRedirectState = 0;
  [(_SFBrowserContentViewController *)self _setShowingPinnableBanner:0 animated:0];
  [(_SFBrowserContentViewController *)self _hideReaderAnimated:1 deactivationMode:0];
  [(_SFBrowserContentViewController *)self _invalidateEVOrganizationName];
  [(_SFBrowserContentViewController *)self _updateUI];
  [(_SFBrowserContentViewController *)self _updateUserActivitySoon];
  [(WBSFluidProgressController *)self->_fluidProgressController progressStateSourceDidCommitLoad:self loadingSingleResource:0];
  int64_t v14 = [(_SFBrowserContentViewController *)self _persona];
  if (v6 || v14 != 3) {
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController clearFailedRequest];
  }
  [(_SFBrowserContentViewController *)self _updatePageZoomWithPreference];
  downloadToShowInQuickLook = self->_downloadToShowInQuickLook;
  if (downloadToShowInQuickLook)
  {
    double v16 = [(_SFDownload *)downloadToShowInQuickLook quickLookDocument];
    quickLookDocument = self->_quickLookDocument;
    self->_quickLookDocument = v16;

    double v18 = self->_downloadToShowInQuickLook;
    self->_downloadToShowInQuickLook = 0;

    quickLookDocumentController = self->_quickLookDocumentController;
    if (!quickLookDocumentController)
    {
      double v20 = (SFQuickLookDocumentController *)objc_alloc_init(MEMORY[0x1E4F78330]);
      double v21 = self->_quickLookDocumentController;
      self->_quickLookDocumentController = v20;

      [(_SFBrowserContentViewController *)self _showQuickLookDocumentView];
      quickLookDocumentController = self->_quickLookDocumentController;
    }
    [(SFQuickLookDocumentController *)quickLookDocumentController updateWithQuickLookDocument:self->_quickLookDocument];
  }
  else
  {
    id v22 = self->_quickLookDocument;
    self->_quickLookDocument = 0;

    self->_quickLookDocumentCheckCompleted = 0;
    if (self->_quickLookDocumentController)
    {
      [(_SFBrowserContentViewController *)self _hideQuickLookDocumentView];
      char v23 = self->_quickLookDocumentController;
      self->_quickLookDocumentController = 0;
    }
  }
  [(_SFBrowserContentViewController *)self _checkForAppLink];
  id v24 = [(_SFBrowserContentViewController *)self translationContext];
  uint64_t v25 = [v8 URL];
  [v24 owningWebViewDidCommitNavigationWithURL:v25 completionHandler:0];

  double v26 = [(_SFBrowserContentViewController *)self assistantController];
  [v26 clearAssistantResult];
}

- (void)webViewController:(id)a3 didFinishNavigation:(id)a4
{
  id v13 = a3;
  [(_SFBrowserContentViewController *)self _updateUI];
  [(WBSFluidProgressController *)self->_fluidProgressController finishFluidProgressWithProgressStateSource:self];
  [(_SFPageLoadErrorController *)self->_pageLoadErrorController scheduleResetCrashCount];
  [(_SFCalendarEventDetector *)self->_calendarEventDetector containsCalendarEventForPageWithSchemaOrgMarkup:0];
  [(_SFBrowserContentViewController *)self _initialLoadFinishedWithSuccess:1];
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 0;
  self->_canOpenDownloadForInitialLoad = 0;
  [(_SFBrowserContentViewController *)self _updateUserActivitySoon];
  if ([(_SFBrowserContentViewController *)self _persona] == 1)
  {
    reloadOptionsController = self->_reloadOptionsController;
    id v6 = [v13 webView];
    id v7 = [v6 URL];
    [(_SFReloadOptionsController *)reloadOptionsController logCompletedPageloadToDifferentialPrivacy:v7];
  }
  [(_SFBrowserContentViewController *)self _updateDigitalHealthTracking];
  id v8 = [MEMORY[0x1E4F98A08] sharedManager];
  uint64_t v9 = [(_SFBrowserContentViewController *)self webView];
  id v10 = [v9 URL];
  id v11 = [v10 host];
  id v12 = [(_SFBrowserContentViewController *)self webView];
  objc_msgSend(v8, "clearCertificateBypassesForHostIfNecessary:withTrust:", v11, objc_msgSend(v12, "serverTrust"));
}

- (void)webViewController:(id)a3 didFinishDocumentLoadForNavigation:(id)a4
{
  id v6 = [(_SFBrowserContentViewController *)self webView];
  int v5 = [v6 _committedURL];
  [(_SFBrowserContentViewController *)self _didResolveDestinationURL:v5 pendingAppLinkCheck:0];
}

- (void)_checkForAppLink
{
  if ([(_SFBrowserContentViewController *)self _shouldAllowUniversalLinkBanner])
  {
    BOOL v3 = [(_SFBrowserContentViewController *)self webView];
    id v4 = [v3 URL];
    if (objc_msgSend(v4, "safari_isHTTPFamilyURL")
      && ![(_SFBrowserContentViewController *)self isShowingErrorPage])
    {
      id v6 = [v3 backForwardList];
      id v7 = [v6 currentItem];
      backForwardListItemForCurrentAppLinkBannerCheck = self->_backForwardListItemForCurrentAppLinkBannerCheck;
      self->_backForwardListItemForCurrentAppLinkBannerCheck = v7;

      BOOL shouldRevealAppLinkBannerForNextCommit = self->_shouldRevealAppLinkBannerForNextCommit;
      self->_BOOL shouldRevealAppLinkBannerForNextCommit = 0;
      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F98950]) initWithURL:v4];
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __51___SFBrowserContentViewController__checkForAppLink__block_invoke;
      v12[3] = &unk_1E5C771D8;
      id v11 = v10;
      id v13 = v11;
      objc_copyWeak(&v15, &location);
      id v14 = v3;
      BOOL v16 = shouldRevealAppLinkBannerForNextCommit;
      [v11 decideOpenStrategyWithCompletionHandler:v12];

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      int v5 = self->_backForwardListItemForCurrentAppLinkBannerCheck;
      self->_backForwardListItemForCurrentAppLinkBannerCheck = 0;
    }
  }
}

- (BOOL)_shouldAllowUniversalLinkBanner
{
  return (unint64_t)[(_SFBrowserContentViewController *)self _persona] < 2;
}

- (void)dismissAppSuggestionBanner:(id)a3
{
}

- (void)setAppSuggestionBanner:(id)a3 isPinned:(BOOL)a4
{
}

- (BOOL)shouldBlockAppSuggestionBanner:(id)a3
{
  return 0;
}

- (void)webViewController:(id)a3 didFindAppBannerWithContent:(id)a4
{
  id v5 = a4;
  if (!self->_storeBannersAreDisabled)
  {
    id v6 = [(_SFBrowserContentViewController *)self expectedOrCurrentURL];
    id v7 = [(_SFBrowserContentViewController *)self _hostAppBundleId];
    SFCreateAppSuggestionBannerFromMetaTagContent();
  }
}

- (void)webViewControllerDidFirstPaint:(id)a3
{
  pinnableBannerPendingFirstPaint = self->_pinnableBannerPendingFirstPaint;
  if (pinnableBannerPendingFirstPaint)
  {
    [(_SFBrowserContentViewController *)self _setShowingPinnableBanner:pinnableBannerPendingFirstPaint animated:0];
    id v5 = self->_pinnableBannerPendingFirstPaint;
    self->_pinnableBannerPendingFirstPaint = 0;
  }
}

- (void)webViewControllerDidDetermineReaderAvailability:(id)a3 dueTo:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 2)
  {
    [(_SFBrowserContentViewController *)self _updateUI];
    id v7 = [(_SFBrowserContentViewController *)self webViewController];
    id v8 = [v7 readerController];
    char v9 = [v8 isReaderAvailable];

    if (v9)
    {
      if (![(SFSafariViewControllerConfiguration *)self->_configuration entersReaderIfAvailable])
      {
        id v10 = [(_SFBrowserContentViewController *)self _committedDomainForPreferences];
        if (![v10 length]
          || a4 == 1 && self->_lastReaderDeactivationMode == 1
          || ![(_SFBrowserContentViewController *)self _shouldAllowAutomaticReader])
        {
          [(SFNavigationBarItem *)self->_navigationBarItem setShowsReaderButton:1 showsAvailabilityText:0];
        }
        else
        {
          objc_initWeak(&location, self);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __89___SFBrowserContentViewController_webViewControllerDidDetermineReaderAvailability_dueTo___block_invoke;
          v13[3] = &unk_1E5C77250;
          objc_copyWeak(&v15, &location);
          id v14 = v6;
          id v11 = (void *)MEMORY[0x1AD0C36A0](v13);
          id v12 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor automaticReaderActivationManager];
          [v12 getAutomaticReaderEnabledForDomain:v10 usingBlock:v11];

          objc_destroyWeak(&v15);
          objc_destroyWeak(&location);
        }
        goto LABEL_12;
      }
      [(SFNavigationBarItem *)self->_navigationBarItem setShowsReaderButton:1 showsAvailabilityText:0];
      [(_SFBrowserContentViewController *)self _showReaderAnimated:self->_displayMode == 0];
      if (![(_SFBrowserContentViewController *)self isBlockedByScreenTime])
      {
        id v10 = [MEMORY[0x1E4F98948] sharedLogger];
        [v10 didActivateReaderWithTrigger:3];
LABEL_12:
      }
    }
  }
}

- (void)webViewController:(id)a3 didClickLinkInReaderWithRequest:(id)a4
{
}

- (void)webViewController:(id)a3 didExtractTextSamplesForTranslation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(_SFBrowserContentViewController *)self translationContext];
  char v9 = [v6 webView];
  id v10 = [v9 URL];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89___SFBrowserContentViewController_webViewController_didExtractTextSamplesForTranslation___block_invoke;
  v12[3] = &unk_1E5C77278;
  objc_copyWeak(&v14, &location);
  id v11 = v6;
  id v13 = v11;
  [v8 setWebpageLocaleWithExtractedTextSamples:v7 url:v10 completionHandler:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)webViewControllerDidChangeLoadingState:(id)a3
{
  id v6 = a3;
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  int v5 = [v4 isLoading];

  if (v5) {
    [(WBSFluidProgressController *)self->_fluidProgressController startFluidProgressWithProgressStateSource:self];
  }
  if (([v6 isLoading] & 1) == 0) {
    self->_loadWasUserDriven = 0;
  }
  [(_SFBrowserContentViewController *)self _updateUI];
}

- (void)webViewControllerDidChangeEstimatedProgress:(id)a3
{
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  int v5 = [v4 isLoading];

  if (v5)
  {
    fluidProgressController = self->_fluidProgressController;
    [(WBSFluidProgressController *)fluidProgressController updateFluidProgressWithProgressStateSource:self];
  }
}

- (void)webViewController:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8 = a5;
  if ((objc_msgSend(v8, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F46810], 204) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, a5);
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;

    [(WBSFluidProgressController *)self->_fluidProgressController cancelFluidProgressWithProgressStateSource:self];
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController handleFrameLoadError:v8];
    [(_SFBrowserContentViewController *)self _initialLoadFinishedWithSuccess:0];
    [(_SFBrowserContentViewController *)self _updateUserActivitySoon];
  }
}

- (void)webViewControllerDidFirstVisuallyNonEmptyLayout:(id)a3
{
  [(_SFBrowserContentViewController *)self _updateUI];

  [(_SFBrowserContentViewController *)self _updateDigitalHealthTracking];
}

- (BOOL)_redirectToHostAppWithNavigationResult:(id)a3 options:(id)a4
{
  return 0;
}

- (void)_cleanUpAfterRedirectToExternalApp
{
  if ([(_SFBrowserContentViewController *)self _shouldGoBackToOwnerWebView])
  {
    [(_SFBrowserContentViewController *)self _goBack];
  }
  else
  {
    [(_SFBrowserContentViewController *)self _dismiss];
  }
}

- (void)_completeRedirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 dialogResult:(int64_t)a5
{
  id v10 = a3;
  id v7 = [(_SFBrowserContentViewController *)self webView];
  id v8 = [v7 _committedURL];

  if (v8)
  {
    if (([v10 appliesOneTimeUserInitiatedActionPolicy] & 1) == 0)
    {
      unint64_t externalAppRedirectState = self->_externalAppRedirectState;
      self->_unint64_t externalAppRedirectState = externalAppRedirectState | 2;
      if (a5) {
        self->_unint64_t externalAppRedirectState = externalAppRedirectState | 6;
      }
    }
  }
  else
  {
    [(_SFBrowserContentViewController *)self _cleanUpAfterRedirectToExternalApp];
  }
}

- (void)_queueAlertForRedirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 isMainFrame:(BOOL)a5 promptPolicy:(int64_t)a6 userAction:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  objc_initWeak(&location, self);
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  char v23 = __140___SFBrowserContentViewController__queueAlertForRedirectToExternalNavigationResult_fromOriginalRequest_isMainFrame_promptPolicy_userAction___block_invoke;
  id v24 = &unk_1E5C772A0;
  objc_copyWeak(&v28, &location);
  id v15 = v12;
  id v25 = v15;
  id v16 = v13;
  id v26 = v16;
  BOOL v29 = a5;
  id v17 = v14;
  id v27 = v17;
  double v18 = (void *)MEMORY[0x1AD0C36A0](&v21);
  if ((objc_msgSend(v15, "externalApplicationCategory", v21, v22, v23, v24) | 2) == 2)
  {
    self->_externalAppRedirectState |= 8uLL;
    pageLoadErrorController = self->_pageLoadErrorController;
    double v20 = [MEMORY[0x1E4F78270] redirectDialogWithNavigationResult:v15 promptPolicy:a6 completionHandler:v18];
    [(_SFPageLoadErrorController *)pageLoadErrorController addDialog:v20];
  }
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (BOOL)_willURLOpenHostApp:(id)a3
{
  return 0;
}

- (void)_redirectToExternalNavigationResult:(id)a3 fromOriginalRequest:(id)a4 promptPolicy:(int64_t)a5 isMainFrame:(BOOL)a6 userAction:(id)a7
{
  BOOL v8 = a6;
  v33[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [v12 URL];
  if ([(id)*MEMORY[0x1E4FB2608] canOpenURL:v15])
  {
    uint64_t v16 = [v13 valueForHTTPHeaderField:@"Referer"];
    id v17 = (void *)v16;
    if (v16)
    {
      uint64_t v32 = *MEMORY[0x1E4F22370];
      v33[0] = v16;
      double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    }
    else
    {
      double v18 = 0;
    }
    if ([(_SFBrowserContentViewController *)self _redirectToHostAppWithNavigationResult:v12 options:v18]|| self->_externalAppRedirectState == 8)
    {
      goto LABEL_18;
    }
    if (objc_msgSend(v12, "shouldPromptWithPolicy:telephonyNavigationPolicy:userAction:inBackgroundOrPrivateBrowsing:inLockdownMode:", a5, self->_telephonyNavigationPolicy, v14, -[_SFBrowserContentViewController viewDidAppearInHostApp](self, "viewDidAppearInHostApp") ^ 1, self->_wasLoadedWithLockdownModeEnabled))
    {
      [(_SFBrowserContentViewController *)self _queueAlertForRedirectToExternalNavigationResult:v12 fromOriginalRequest:v13 isMainFrame:v8 promptPolicy:a5 userAction:v14];
    }
    else
    {
      uint64_t v19 = [v12 externalApplicationCategory];
      if (!v19 || v19 == 2)
      {
        char v23 = [MEMORY[0x1E4F223E0] defaultWorkspace];
        id v24 = [v12 externalApplication];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke_3;
        v25[3] = &unk_1E5C74810;
        v25[4] = self;
        id v26 = v12;
        id v27 = v13;
        objc_msgSend(v23, "_sf_openURL:inApplication:withOptions:completionHandler:", v15, v24, v18, v25);

        uint64_t v21 = &v26;
        uint64_t v22 = &v27;
      }
      else
      {
        if (v19 != 1 || self->_isDisplayingTelephonyPrompt) {
          goto LABEL_18;
        }
        self->_isDisplayingTelephonyPrompt = 1;
        telephonyNavigationPolicdouble y = self->_telephonyNavigationPolicy;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke;
        v28[3] = &unk_1E5C772C8;
        void v28[4] = self;
        id v29 = v15;
        id v30 = v12;
        id v31 = v13;
        [(_SFTelephonyNavigationMitigationPolicy *)telephonyNavigationPolicy handleNavigationToURL:v29 completionHandler:v28];
        uint64_t v21 = &v29;
        uint64_t v22 = &v30;
        char v23 = v31;
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  if (v8) {
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController addInvalidURLAlert];
  }
LABEL_19:
}

- (id)resultOfLoadingRequest:(id)a3 inMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101___SFBrowserContentViewController_resultOfLoadingRequest_inMainFrame_disallowRedirectToExternalApps___block_invoke;
  v12[3] = &unk_1E5C772F0;
  id v13 = v8;
  id v14 = self;
  id v9 = v8;
  id v10 = +[_SFNavigationResult resultOfLoadingRequest:v9 isMainFrame:v6 disallowRedirectToExternalApps:v5 preferredApplicationBundleIdentifier:0 redirectDecisionHandler:v12];

  return v10;
}

- (void)_determineResultOfLoadingRequest:(id)a3 inMainFrame:(BOOL)a4 disallowRedirectToExternalApps:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v12 = [(_SFBrowserContentViewController *)self webView];
  id v13 = [v12 _committedURL];

  LOBYTE(v12) = [(_SFReloadOptionsController *)self->_reloadOptionsController loadedUsingDesktopUserAgent];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __129___SFBrowserContentViewController__determineResultOfLoadingRequest_inMainFrame_disallowRedirectToExternalApps_completionHandler___block_invoke;
  v16[3] = &unk_1E5C77318;
  id v14 = v10;
  id v17 = v14;
  id v15 = v13;
  id v18 = v15;
  char v19 = (char)v12;
  +[_SFNavigationResult determineResultOfLoadingRequest:v14 isMainFrame:v8 disallowRedirectToExternalApps:v7 preferredApplicationBundleIdentifier:0 redirectDecisionHandler:v16 completionHandler:v11];
}

- (void)_redirectToNewsIfNeededForRequest:(id)a3 isMainFrame:(BOOL)a4 userAction:(id)a5 decisionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 URL];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F98950]) initWithURL:v13];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __108___SFBrowserContentViewController__redirectToNewsIfNeededForRequest_isMainFrame_userAction_decisionHandler___block_invoke;
  v19[3] = &unk_1E5C77340;
  id v15 = v12;
  id v23 = v15;
  v19[4] = self;
  id v16 = v10;
  id v20 = v16;
  id v21 = v14;
  id v17 = v11;
  id v22 = v17;
  BOOL v24 = a4;
  id v18 = v14;
  objc_msgSend(v18, "_sf_decideOpenStrategyAndCallCompletionHandlerOnMainThread:", v19);
}

- (void)webViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 targetFrame];
  if (v11
    && ([v9 targetFrame],
        id v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isMainFrame],
        v12,
        v11,
        !v13))
  {
    char v19 = 0;
  }
  else
  {
    p_concurrentNavigationActionPolicyDecisions = &self->_concurrentNavigationActionPolicyDecisions;
    ++self->_concurrentNavigationActionPolicyDecisions;
    id v15 = WBS_LOG_CHANNEL_PREFIXPageLoading();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *p_concurrentNavigationActionPolicyDecisions;
      *(_DWORD *)buf = 134218240;
      id v28 = self;
      __int16 v29 = 2048;
      uint64_t v30 = v16;
      _os_log_impl(&dword_1A690B000, v15, OS_LOG_TYPE_INFO, "(%p) Concurrent navigation action policy decisions: %zd", buf, 0x16u);
    }
    if (*p_concurrentNavigationActionPolicyDecisions >= 21)
    {
      id v17 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[_SFBrowserContentViewController webViewController:decidePolicyForNavigationAction:decisionHandler:](&self->_concurrentNavigationActionPolicyDecisions, v17);
      }
      id v18 = [v8 webView];
      [v18 _killWebContentProcessAndResetState];
    }
    char v19 = 1;
  }
  objc_initWeak((id *)buf, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __101___SFBrowserContentViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v22[3] = &unk_1E5C77368;
  objc_copyWeak(&v25, (id *)buf);
  id v20 = v9;
  id v23 = v20;
  id v21 = v10;
  id v24 = v21;
  char v26 = v19;
  [(_SFBrowserContentViewController *)self _internalWebViewController:v8 decidePolicyForNavigationAction:v20 decisionHandler:v22];

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)_internalWebViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v45 = v8;
  id v11 = [v9 request];
  id v12 = [v11 URL];

  v44 = v12;
  int v13 = [v9 targetFrame];
  double v43 = v13;
  if (v13) {
    uint64_t v14 = [v13 isMainFrame];
  }
  else {
    uint64_t v14 = 1;
  }
  objc_initWeak(location, self);
  if ((self->_externalAppRedirectState & 8) != 0)
  {
    if (!v14) {
      goto LABEL_10;
    }
  }
  else if (!self->_isDisplayingTelephonyPrompt || (v14 & 1) == 0)
  {
    goto LABEL_10;
  }
  id v15 = [v9 request];
  uint64_t v16 = [v15 URL];
  BOOL v17 = [(_SFBrowserContentViewController *)self _willURLOpenHostApp:v16];

  if (v17)
  {
LABEL_10:
    id v40 = v10;
    id v18 = (void *)[v9 navigationType];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_2;
    v52[3] = &unk_1E5C773E0;
    objc_copyWeak(v56, location);
    id v19 = v10;
    id v55 = v19;
    id v20 = v9;
    id v53 = v20;
    id v21 = v12;
    char v57 = v14;
    id v54 = v21;
    v56[1] = v18;
    id v22 = (void (**)(id, void))MEMORY[0x1AD0C36A0](v52);
    self->_didReceivePolicyForInitialLoad = 1;
    id v23 = [v20 _userInitiatedAction];
    lastUserInitiatedAction = self->_lastUserInitiatedAction;
    self->_lastUserInitiatedAction = v23;

    [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator setNavigationSource:!self->_loadWasUserDriven];
    long long v41 = &v53;
    double v42 = &v55;
    id v25 = &v54;
    if (v14
      && ((objc_msgSend(v21, "safari_isHTTPFamilyURL") & 1) != 0
       || objc_msgSend(v21, "safari_hasScheme:", @"ftp"))
      && objc_msgSend(v21, "safari_hasUserOrPassword"))
    {
      v22[2](v22, 0);
      char v26 = objc_msgSend(v21, "safari_URLByDeletingUserAndPassword");
      id v27 = v56;
      id v10 = v40;
      if (v26)
      {
        id v28 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v26);
        [(_SFBrowserContentViewController *)self loadRequest:v28];
      }
    }
    else
    {
      if (objc_msgSend(v20, "safari_shouldProhibitNavigationToSafariSpecificURL"))
      {
        v22[2](v22, 0);
      }
      else
      {
        int v29 = objc_msgSend(v20, "_sf_shouldAskAboutInsecureFormSubmission");
        pageLoadErrorController = self->_pageLoadErrorController;
        if (v29)
        {
          uint64_t v31 = _WBSLocalizedString();
          [(_SFPageLoadErrorController *)pageLoadErrorController addFormAlertWithTitle:v31 decisionHandler:v22];
        }
        else
        {
          if ([(_SFPageLoadErrorController *)self->_pageLoadErrorController crashesSinceLastSuccessfulLoad])
          {
            if (v14)
            {
              double v39 = [v20 targetFrame];
              uint64_t v34 = [v39 request];
              double v35 = [v34 URL];

              if (v35) {
                [(_SFBrowserContentViewController *)self _setShowingCrashBanner:0 animated:1];
              }
            }
          }
          if ((self->_externalAppRedirectState & 4) != 0) {
            uint64_t v36 = [v20 _isUserInitiated] ^ 1;
          }
          else {
            uint64_t v36 = 0;
          }
          double v37 = [v20 request];
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_4;
          v46[3] = &unk_1E5C77408;
          objc_copyWeak(&v51, location);
          id v49 = v19;
          id v47 = v45;
          id v48 = v20;
          double v38 = v22;
          id v50 = v38;
          [(_SFBrowserContentViewController *)self _determineResultOfLoadingRequest:v37 inMainFrame:v14 disallowRedirectToExternalApps:v36 completionHandler:v46];

          objc_destroyWeak(&v51);
          id v22 = v38;
        }
      }
      id v27 = v56;
      id v10 = v40;
    }
    goto LABEL_33;
  }
  pendingNavigationActionDueToExternalSchemePromptHandler = (void (**)(id, void))self->_pendingNavigationActionDueToExternalSchemePromptHandler;
  if (pendingNavigationActionDueToExternalSchemePromptHandler) {
    pendingNavigationActionDueToExternalSchemePromptHandler[2](pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  }
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke;
  v58[3] = &unk_1E5C77390;
  id v27 = &v62;
  objc_copyWeak(&v62, location);
  double v42 = &v61;
  id v61 = v10;
  long long v41 = &v59;
  id v59 = v8;
  id v25 = &v60;
  id v60 = v9;
  double v33 = (void *)MEMORY[0x1AD0C36A0](v58);
  id v22 = (void (**)(id, void))self->_pendingNavigationActionDueToExternalSchemePromptHandler;
  self->_pendingNavigationActionDueToExternalSchemePromptHandler = v33;
LABEL_33:

  objc_destroyWeak(v27);
  objc_destroyWeak(location);
}

- (void)_internalWebViewController:(id)a3 decidePolicyForNavigationAction:(id)a4 withResult:(id)a5 decisionHandler:(id)a6
{
  id v29 = a4;
  id v9 = a5;
  id v10 = (void (**)(id, void))a6;
  id v11 = [v29 request];
  id v12 = [v11 URL];

  int v13 = [v29 targetFrame];
  uint64_t v14 = v13;
  if (v13) {
    uint64_t v15 = [v13 isMainFrame];
  }
  else {
    uint64_t v15 = 1;
  }
  if ([(_SFBrowserContentViewController *)self _redirectToHostAppForAuthenticationSession:v12])
  {
LABEL_5:
    v10[2](v10, 0);
    goto LABEL_6;
  }
  switch([v9 type])
  {
    case 0:
      uint64_t v16 = [v9 URL];
      int v17 = objc_msgSend(v16, "_webkit_isJavaScriptURL");

      if (v17)
      {
        [(_SFPageLoadErrorController *)self->_pageLoadErrorController addDisallowedUseOfJavaScriptAlert];
      }
      else if (v15 {
             && ![(_SFBrowserContentViewController *)self _redirectToHostAppForAuthenticationSession:v12])
      }
      {
        [(_SFPageLoadErrorController *)self->_pageLoadErrorController addInvalidURLAlert];
      }
      goto LABEL_5;
    case 1:
      if ((self->_externalAppRedirectState & 4) != 0 && ![v29 _isUserInitiated])
      {
        int v21 = 1;
        if (v15) {
          goto LABEL_39;
        }
        goto LABEL_46;
      }
      if (self->_wasLoadedWithLockdownModeEnabled)
      {
        int v21 = [v12 hasTelephonyScheme] ^ 1;
        if (v21)
        {
LABEL_38:
          if (v15)
          {
LABEL_39:
            id v25 = [v9 URL];
            [(_SFBrowserContentViewController *)self _didResolveDestinationURL:v25 pendingAppLinkCheck:1];

            int v26 = [v29 _shouldOpenAppLinks];
            if (v21) {
              uint64_t v27 = 3;
            }
            else {
              uint64_t v27 = 1;
            }
            if (v26) {
              uint64_t v28 = v27;
            }
            else {
              uint64_t v28 = 3;
            }
            goto LABEL_47;
          }
LABEL_46:
          uint64_t v28 = 3;
LABEL_47:
          v10[2](v10, v28);
          goto LABEL_6;
        }
      }
      else
      {
        int v21 = 0;
      }
      if ((v15 ^ 1)) {
        goto LABEL_38;
      }
      if (![v29 _shouldOpenExternalSchemes]
        || self->_displayMode == 1
        || !objc_msgSend(v12, "safari_isAppleNewsURL"))
      {
        int v21 = 0;
        goto LABEL_38;
      }
      id v19 = [v29 request];
      id v20 = [v29 _userInitiatedAction];
      [(_SFBrowserContentViewController *)self _redirectToNewsIfNeededForRequest:v19 isMainFrame:v15 userAction:v20 decisionHandler:v10];
LABEL_13:

LABEL_6:

      return;
    case 2:
      v10[2](v10, 0);
      id v18 = (void *)MEMORY[0x1E4F18DA8];
      id v19 = [v9 URL];
      id v20 = objc_msgSend(v18, "safari_nonAppInitiatedRequestWithURL:", v19);
      [(_SFBrowserContentViewController *)self loadRequest:v20];
      goto LABEL_13;
    case 3:
      v10[2](v10, 0);
      id v22 = [v9 URL];
      [(_SFBrowserContentViewController *)self _didResolveDestinationURL:v22 pendingAppLinkCheck:0];

      if (!v15 || ![v29 _shouldOpenExternalSchemes] || self->_displayMode == 1) {
        goto LABEL_6;
      }
      if (self->_wasLoadedWithLockdownModeEnabled) {
        goto LABEL_24;
      }
      if (objc_msgSend(v29, "_sf_allowsExternalRedirectWithoutPrompting"))
      {
        uint64_t v24 = 0;
      }
      else if (self->_didNotifyInitialLoadFinish)
      {
LABEL_24:
        id v23 = [v29 _userInitiatedAction];
        if (v23) {
          uint64_t v24 = 2;
        }
        else {
          uint64_t v24 = 3;
        }
      }
      else
      {
        uint64_t v24 = 1;
      }
      id v19 = [v29 request];
      id v20 = [v29 _userInitiatedAction];
      [(_SFBrowserContentViewController *)self _redirectToExternalNavigationResult:v9 fromOriginalRequest:v19 promptPolicy:v24 isMainFrame:1 userAction:v20];
      goto LABEL_13;
    case 4:
      [(_SFPageLoadErrorController *)self->_pageLoadErrorController addDisallowedFileURLAlert];
      goto LABEL_5;
    default:
      goto LABEL_5;
  }
}

- (id)_quickLookDocumentForDownload:(id)a3
{
  id v3 = a3;
  id v4 = [v3 filename];
  BOOL v5 = objc_msgSend(v4, "safari_lastPathComponentWithoutZipExtension");

  id v6 = objc_alloc(MEMORY[0x1E4F78328]);
  BOOL v7 = [v3 response];
  id v8 = [v7 MIMEType];
  id v9 = (void *)[v6 initWithFileName:v5 mimeType:v8 uti:0 needsQuickLookDocumentView:1];

  id v10 = [v3 sourceURL];
  [v9 setSourceURL:v10];

  return v9;
}

- (id)_fallbackURLForWellKnownChangePasswordURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_SFBrowserContentViewController *)self _fallbackURLForWellKnownChangePasswordURLFromQuirks:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(_SFBrowserContentViewController *)self _homePageURLToUseAsFallbackWhenTryingToChangePassword:v4];
  }
  id v8 = v7;

  return v8;
}

- (id)_fallbackURLForWellKnownChangePasswordURLFromQuirks:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WBSAutoFillQuirksManager *)self->_autoFillQuirksManager changePasswordURLManager];
  id v6 = [v4 host];
  id v7 = objc_msgSend(v6, "safari_highLevelDomainFromHost");
  id v8 = [v5 changePasswordURLForHighLevelDomain:v7];

  return v8;
}

- (id)_homePageURLToUseAsFallbackWhenTryingToChangePassword:(id)a3
{
  id v3 = objc_msgSend(a3, "safari_URLByRemovingUserPasswordPathQueryAndFragment");
  id v4 = objc_msgSend(v3, "safari_URLByReplacingSchemeWithString:", @"https");

  return v4;
}

- (void)_didDecideNavigationPolicy:(int64_t)a3 forNavigationResponse:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 1)
  {
    uint64_t v14 = v6;
    int v8 = [v6 isForMainFrame];
    id v7 = v14;
    if (v8)
    {
      id v9 = [v14 _frame];
      id v10 = [v9 webView];
      id v11 = [(_SFBrowserContentViewController *)self webView];

      id v7 = v14;
      if (v10 == v11)
      {
        objc_msgSend(v14, "_sf_explicitSuggestedFilename");
        id v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
        self->_suggestedFilenameForNextCommit = v12;

        id v7 = v14;
      }
    }
  }
}

- (void)webViewController:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v41 = a3;
  id v8 = a4;
  id v9 = a5;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __103___SFBrowserContentViewController_webViewController_decidePolicyForNavigationResponse_decisionHandler___block_invoke;
  v44[3] = &unk_1E5C77430;
  v44[4] = self;
  id v10 = v8;
  id v45 = v10;
  id v11 = v9;
  id v46 = v11;
  id v12 = (void (**)(void, void))MEMORY[0x1AD0C36A0](v44);
  int v13 = [v10 response];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v13, "safari_statusCodeGroup") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    uint64_t v14 = self->_originalRequestURL;
    if ([(NSURL *)v14 safari_isWellKnownChangePasswordURL])
    {
      v12[2](v12, 0);
      uint64_t v15 = [(_SFBrowserContentViewController *)self _fallbackURLForWellKnownChangePasswordURLFromQuirks:v14];
      if (v15)
      {
        objc_storeStrong((id *)&self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL, v15);
        uint64_t v16 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v15);
        [(_SFBrowserContentViewController *)self loadRequest:v16];
      }
      else
      {
        uint64_t v36 = (void *)MEMORY[0x1E4F18DA8];
        uint64_t v16 = [(_SFBrowserContentViewController *)self _homePageURLToUseAsFallbackWhenTryingToChangePassword:v14];
        double v37 = objc_msgSend(v36, "safari_nonAppInitiatedRequestWithURL:", v16);
        [(_SFBrowserContentViewController *)self loadRequest:v37];
      }
      goto LABEL_35;
    }
    if ([(NSURL *)v14 isEqual:self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL])
    {
      v12[2](v12, 0);
      urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL = self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL;
      self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL = 0;

      id v18 = (void *)MEMORY[0x1E4F18DA8];
      uint64_t v15 = [(_SFBrowserContentViewController *)self _homePageURLToUseAsFallbackWhenTryingToChangePassword:v14];
      uint64_t v16 = objc_msgSend(v18, "safari_nonAppInitiatedRequestWithURL:", v15);
      [(_SFBrowserContentViewController *)self loadRequest:v16];
LABEL_35:

      goto LABEL_36;
    }
  }
  id v42 = 0;
  uint64_t v43 = 0;
  uint64_t v19 = objc_msgSend(v10, "_sf_responsePolicy:uti:", &v43, &v42);
  uint64_t v14 = (NSURL *)v42;
  if (!v19)
  {
    uint64_t v20 = 1;
    goto LABEL_13;
  }
  if (self->_activeDownload)
  {
    uint64_t v20 = 0;
LABEL_13:
    v12[2](v12, v20);
    goto LABEL_36;
  }
  int v21 = [v13 MIMEType];
  id v22 = [v13 suggestedFilename];
  id v23 = objc_msgSend(v22, "safari_filenameByFixingIllegalCharacters");
  id v40 = objc_msgSend(v23, "safari_lastPathComponentWithoutZipExtension");

  uint64_t v24 = v43;
  if (v43 == 3)
  {
    if (([getPKAddPassesViewControllerClass() canAddPasses] & 1) == 0)
    {
LABEL_19:
      uint64_t v43 = 0;
      goto LABEL_20;
    }
    uint64_t v24 = v43;
  }
  if (v24 == 7 && ([getPKAddPassesViewControllerClass() canAddPasses] & 1) == 0) {
    goto LABEL_19;
  }
LABEL_20:
  id v25 = [v40 pathExtension];
  uint64_t v26 = [v25 caseInsensitiveCompare:@"swf"];

  uint64_t v27 = [v21 caseInsensitiveCompare:@"application/x-shockwave-flash"];
  int v28 = [v10 isForMainFrame];
  if (v26) {
    BOOL v29 = v27 == 0;
  }
  else {
    BOOL v29 = 1;
  }
  int v30 = v29;
  if (!v43 || (v30 & ~v28 & 1) != 0)
  {
    v12[2](v12, 0);
  }
  else
  {
    double v38 = v21;
    uint64_t v31 = [v10 _request];
    uint64_t v32 = objc_msgSend(v10, "_sf_suggestedFilename");
    double v33 = +[_SFDownload provisionalDownloadWithMIMEType:v21 request:v31 response:v13 filename:v32 uti:v14 userInitiatedAction:self->_lastUserInitiatedAction];

    if (v43 == 2)
    {
      double v39 = [(_SFBrowserContentViewController *)self _quickLookDocumentForDownload:v33];
    }
    else
    {
      double v39 = 0;
    }
    uint64_t v34 = +[_SFDownloadDispatcher sharedDownloadDispatcher];
    double v35 = [v41 webView];
    [v34 setPendingDownload:v33 forWebView:v35];

    [v33 setQuickLookDocument:v39];
    [v33 setDelegate:self];
    [v33 setFluidProgressController:self->_fluidProgressController];
    objc_storeStrong((id *)&self->_activeDownload, v33);
    v12[2](v12, 2 * (v33 != 0));

    int v21 = v38;
  }

LABEL_36:
}

- (void)_didDecideNavigationPolicy:(int64_t)a3 forNavigationAction:(id)a4
{
  id v10 = a4;
  id v6 = [(_SFBrowserContentViewController *)self translationContext];
  id v7 = [(_SFBrowserContentViewController *)self webView];
  id v8 = [v7 backForwardList];
  id v9 = [v8 currentItem];
  [v6 owningWebViewDidDecidePolicy:a3 forNavigationAction:v10 currentBackForwardListItem:v9];
}

- (void)webViewController:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v11 = a5;
  if ([(NSURL *)self->_originalRequestURL safari_isWellKnownChangePasswordURL])
  {
    id v7 = (void *)MEMORY[0x1E4F18DA8];
    id v8 = [(_SFBrowserContentViewController *)self _fallbackURLForWellKnownChangePasswordURL:self->_originalRequestURL];
    id v9 = objc_msgSend(v7, "safari_nonAppInitiatedRequestWithURL:", v8);
    [(_SFBrowserContentViewController *)self loadRequest:v9];
  }
  else
  {
    objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, a5);
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
    self->_suggestedFilenameForNextCommit = 0;

    [(WBSURLSpoofingMitigator *)self->_URLSpoofingMitigator didFailProvisionalNavigationWithError:v11];
    [(WBSFluidProgressController *)self->_fluidProgressController cancelFluidProgressWithProgressStateSource:self];
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController handleFrameLoadError:v11];
    [(_SFBrowserContentViewController *)self _initialLoadFinishedWithSuccess:0];
    [(_SFBrowserContentViewController *)self _updateUserActivitySoon];
    [(_SFBrowserContentViewController *)self _updateNavigationBar];
  }
}

- (void)webViewController:(id)a3 didSameDocumentNavigation:(id)a4 ofType:(int64_t)a5
{
  if (a5)
  {
    if (self->_shouldDismissReaderInReponseToSameDocumentNavigation) {
      [(_SFBrowserContentViewController *)self _hideReaderAnimated:0 deactivationMode:0];
    }
    self->_shouldDismissReaderInReponseToSameDocumentNavigation = 0;
  }
}

- (void)webViewController:(id)a3 willEndNavigationGestureToBackForwardListItem:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  self->_shouldDismissReaderInReponseToSameDocumentNavigation = 1;
  if (v6 && [(_SFBrowserContentViewController *)self _shouldGoBackToOwnerWebView]) {
    self->_gestureRequiresGoingBackToOwnerWebView = 1;
  }
}

- (void)webViewController:(id)a3 didEndNavigationGestureToBackForwardListItem:(id)a4
{
  if (a4)
  {
    if (self->_gestureRequiresGoingBackToOwnerWebView)
    {
      [(_SFBrowserContentViewController *)self _goBackToOwnerWebView];
      self->_gestureRequiresGoingBackToOwnerWebView = 0;
    }
  }
}

- (void)webViewController:(id)a3 willGoToBackForwardListItem:(id)a4 inPageCache:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v7 = [(_SFBrowserContentViewController *)self translationContext];
  [v7 owningWebViewWillNavigateToBackForwardListItem:v8 inPageCache:v5];
}

- (id)_openNewWebViewIfNeededWithConfiguration:(id)a3 forNavigationAction:(id)a4
{
  id v5 = a3;
  id v6 = [(_SFBrowserContentViewController *)self webView];
  id v7 = [v6 backForwardList];
  id v8 = [v7 currentItem];

  [v6 _saveBackForwardSnapshotForItem:v8];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96___SFBrowserContentViewController__openNewWebViewIfNeededWithConfiguration_forNavigationAction___block_invoke;
  v18[3] = &unk_1E5C77458;
  id v9 = v8;
  id v19 = v9;
  id v10 = [v6 _sessionStateWithFilter:v18];
  id v11 = [SFReaderEnabledWebViewController alloc];
  id v12 = [(_SFBrowserContentViewController *)self contentBlockerManager];
  int v13 = [(SFWebViewController *)v11 initWithWebViewConfiguration:v5 contentBlockerManager:v12];

  [(_SFBrowserContentViewController *)self _pushWebViewController:v13];
  uint64_t v14 = [(SFWebViewController *)v13 webView];
  id v15 = (id)[v14 _restoreSessionState:v10 andNavigate:0];

  uint64_t v16 = [(_SFBrowserContentViewController *)self webView];

  return v16;
}

- (void)webViewController:(id)a3 createWebViewWithConfiguration:(id)a4 forNavigationAction:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void *))a6;
  if ([v10 _isUserInitiated])
  {
    id v12 = [(_SFBrowserContentViewController *)self _openNewWebViewIfNeededWithConfiguration:v9 forNavigationAction:v10];
    v11[2](v11, v12);
  }
  else
  {
    int v13 = (void *)MEMORY[0x1E4F78270];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __122___SFBrowserContentViewController_webViewController_createWebViewWithConfiguration_forNavigationAction_completionHandler___block_invoke;
    id v19 = &unk_1E5C77480;
    uint64_t v20 = self;
    id v21 = v9;
    id v22 = v10;
    id v23 = v11;
    uint64_t v14 = [v13 blockedPopupWindowDialogWithCompletionHandler:&v16];
    id v15 = [(_SFBrowserContentViewController *)self webViewController];
    [v15 presentDialog:v14 sender:self];
  }
}

- (void)webViewController:(id)a3 webViewDidClose:(id)a4
{
  uint64_t v5 = [(NSMutableArray *)self->_webViewControllers count];
  if (v5)
  {
    if (v5 == 1)
    {
      id v6 = [(NSMutableArray *)self->_webViewControllers objectAtIndexedSubscript:0];
      id v7 = [v6 webView];
      id v8 = [v7 _committedURL];

      if (!v8)
      {
        [(_SFBrowserContentViewController *)self _dismiss];
      }
    }
    else
    {
      [(_SFBrowserContentViewController *)self _popWebViewController];
    }
  }
}

- (void)webViewControllerWebProcessDidCrash:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  [(_SFBrowserContentViewController *)self setMediaStateIcon:0];
  [(_SFPageLoadErrorController *)self->_pageLoadErrorController clearCrashCountResetTimer];
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  uint64_t v5 = [v4 webView];
  id v6 = [v5 URL];
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
LABEL_4:
    uint64_t v22 = *MEMORY[0x1E4F289B0];
    v23[0] = v6;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    char v11 = 0;
    goto LABEL_5;
  }
  id v8 = [v5 backForwardList];
  id v9 = [v8 currentItem];
  id v6 = [v9 URL];

  id v7 = (void *)MEMORY[0x1E4F28C58];
  if (v6) {
    goto LABEL_4;
  }
  id v10 = 0;
  char v11 = 1;
LABEL_5:
  id v12 = [v7 errorWithDomain:@"com.apple.SafariViewService" code:0 userInfo:v10];
  if ((v11 & 1) == 0) {

  }
  pageLoadErrorController = self->_pageLoadErrorController;
  uint64_t v14 = objc_msgSend(v6, "safari_userVisibleString");
  LODWORD(pageLoadErrorController) = [(_SFPageLoadErrorController *)pageLoadErrorController updateCrashesAndShowCrashError:v12 URLString:v14];

  if (pageLoadErrorController)
  {
    [(_SFBrowserContentViewController *)self _setShowingCrashBanner:0 animated:1];
  }
  else if ((v11 & 1) == 0)
  {
    [(_SFBrowserContentViewController *)self _setShowingCrashBanner:1 animated:1];
    [(_SFBrowserContentViewController *)self _willBeginUserInitiatedNavigation];
    id v15 = [v5 _committedURL];
    int v16 = [v15 isEqual:v6];

    if (v16)
    {
      id v17 = (id)[v5 reload];
    }
    else
    {
      id v18 = [MEMORY[0x1E4F18DA8] requestWithURL:v6];
      id v19 = [(_SFBrowserContentViewController *)self _requestBySettingAdvancedPrivacyProtectionsFlag:v18];

      id v20 = (id)[v5 loadRequest:v19];
    }
    [(_SFReaderViewController *)self->_readerViewController setDelegate:0];
    readerViewController = self->_readerViewController;
    self->_readerViewController = 0;
  }
}

- (void)webViewControllerDidChangeHasOnlySecureContent:(id)a3
{
  [(_SFBrowserContentViewController *)self _invalidateEVOrganizationName];

  [(_SFBrowserContentViewController *)self _updateUI];
}

- (void)webViewController:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = [v7 protectionSpace];
  id v10 = [v7 protectionSpace];
  char v11 = [v10 authenticationMethod];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F18CB8]];

  if (v12)
  {
    int v13 = [MEMORY[0x1E4F98A08] sharedManager];
    uint64_t v14 = [v7 protectionSpace];
    int v15 = [v13 didInvalidCertificateExceptionsApplySuccessfullyForProtectionSpace:v14 inPrivateBrowsing:0];

    if (v15)
    {
      int v16 = (void *)MEMORY[0x1E4F18D88];
      id v17 = [v7 protectionSpace];
      id v18 = objc_msgSend(v16, "credentialForTrust:", objc_msgSend(v17, "serverTrust"));
      v8[2](v8, 0, v18);
LABEL_10:

      goto LABEL_11;
    }
    id v23 = [v7 protectionSpace];
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController setProtectionSpaceForInvalidCertificateBypass:v23];

    goto LABEL_8;
  }
  id v19 = [v7 protectionSpace];
  char v20 = objc_msgSend(v19, "_sf_canAuthenticate");

  if ((v20 & 1) == 0)
  {
LABEL_8:
    v8[2](v8, 3, 0);
    goto LABEL_11;
  }
  id v21 = [v9 authenticationMethod];
  int v22 = [v21 isEqualToString:*MEMORY[0x1E4F18C78]];

  if (!v22)
  {
    id v17 = [(_SFBrowserContentViewController *)self webViewController];
    uint64_t v24 = (void *)MEMORY[0x1E4F78270];
    id v25 = [v17 webView];
    uint64_t v26 = [v25 _committedURL];
    id v18 = [v24 authenticationDialogWithAuthenticationChallenge:v7 committedURL:v26 completionHandler:v8];

    uint64_t v27 = [v17 dialogController];
    void v28[4] = self;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __105___SFBrowserContentViewController_webViewController_didReceiveAuthenticationChallenge_completionHandler___block_invoke;
    v29[3] = &unk_1E5C73108;
    v29[4] = self;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __105___SFBrowserContentViewController_webViewController_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2;
    v28[3] = &unk_1E5C73108;
    [v27 presentDialog:v18 animateAlongsidePresentation:v29 dismissal:v28];

    goto LABEL_10;
  }
  [(_SFPageLoadErrorController *)self->_pageLoadErrorController handleClientCertificateAuthenticationChallenge:v7 completionHandler:v8];
LABEL_11:
}

- (BOOL)webViewControllerCanPromptForAccountSecurityRecommendation:(id)a3
{
  return ![(SFSafariViewControllerConfiguration *)self->_configuration _isPerformingAccountSecurityUpgrade];
}

- (BOOL)webViewControllerShouldFillStringForFind:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F98E00]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76___SFBrowserContentViewController_webViewControllerShouldFillStringForFind___block_invoke;
  v6[3] = &unk_1E5C73108;
  void v6[4] = self;
  [v4 setHandler:v6];
  LOBYTE(self) = self->_shouldFillStringForFind;

  return (char)self;
}

- (BOOL)webViewControllerCanFindNextOrPrevious:(id)a3
{
  id v4 = a3;
  if ([(_SFBrowserContentViewController *)self _onlyWantsWebAppShortcuts])
  {
    BOOL v5 = 0;
  }
  else
  {
    id v6 = [v4 webView];
    id v7 = [v6 URL];
    if (v7)
    {
      id v8 = [MEMORY[0x1E4F466F0] _stringForFind];
      BOOL v5 = [v8 length] != 0;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (BOOL)webViewControllerShouldAutofillESimInformation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  [(_SFBrowserContentViewController *)self _hostAuditToken];
  memset(&v22[2], 0, 32);
  BOOL v5 = WBSAuditTokenValueArrayForEntitlement();
  if ([v5 containsObject:@"public-cellular-plan"])
  {
    v22[0] = v23;
    v22[1] = v24;
    id v21 = 0;
    id v6 = [MEMORY[0x1E4F223F8] bundleRecordForAuditToken:v22 error:&v21];
    id v7 = v21;
    if (v6)
    {
      id v8 = [v6 bundleIdentifier];
      if ([v8 isEqualToString:@"com.apple.Preferences"])
      {
LABEL_4:
        BOOL v9 = 1;
LABEL_20:

        goto LABEL_21;
      }
      id v10 = [v6 bundleIdentifier];
      char v11 = [v10 isEqualToString:@"com.apple.sfapp"];

      if (v11)
      {
        BOOL v9 = 1;
LABEL_21:

        goto LABEL_22;
      }
      id v8 = [objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];

      if (objc_opt_respondsToSelector())
      {
        int v12 = [v4 webView];
        int v13 = [v12 URL];
        uint64_t v14 = [v13 host];
        int v15 = [v6 bundleIdentifier];
        id v20 = 0;
        char v16 = [v8 isAutofilleSIMIdAllowedForDomain:v14 clientBundleIdentifier:v15 error:&v20];
        id v7 = v20;

        if (v16) {
          goto LABEL_4;
        }
        if (v7)
        {
          id v17 = (id)WBS_LOG_CHANNEL_PREFIXESim();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "safari_privacyPreservingDescription");
            objc_claimAutoreleasedReturnValue();
            -[_SFBrowserContentViewController webViewControllerShouldAutofillESimInformation:]();
          }
        }
      }
      else
      {
        id v18 = WBS_LOG_CHANNEL_PREFIXESim();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[_SFBrowserContentViewController webViewControllerShouldAutofillESimInformation:]();
        }
        id v7 = 0;
      }
    }
    else
    {
      id v8 = (id)WBS_LOG_CHANNEL_PREFIXESim();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[_SFBrowserContentViewController webViewControllerShouldAutofillESimInformation:]();
      }
    }
    BOOL v9 = 0;
    goto LABEL_20;
  }
  BOOL v9 = 0;
LABEL_22:

  return v9;
}

- (id)_contextMenuConfigurationForWebView:(id)a3 element:(id)a4
{
  id v4 = +[_SFLinkPreviewHelper contextMenuConfigurationForWebView:a3 elementInfo:a4 handler:self];

  return v4;
}

- (id)_contextMenuContentPreviewForWebView:(id)a3 element:(id)a4
{
  id v4 = +[_SFLinkPreviewHelper contextMenuContentPreviewForWebView:a3 elementInfo:a4 handler:self];

  return v4;
}

- (void)_willCommitContextMenuForWebView:(id)a3 withAnimator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 previewViewController];
  objc_opt_class();
  [v6 setPreferredCommitStyle:objc_opt_isKindOfClass() & 1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __81___SFBrowserContentViewController__willCommitContextMenuForWebView_withAnimator___block_invoke;
  v9[3] = &unk_1E5C73108;
  id v8 = v5;
  id v10 = v8;
  [v6 addAnimations:v9];
}

- (void)webViewController:(id)a3 contextMenuConfigurationForElement:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  id v8 = (void (**)(id, void *))a5;
  BOOL v9 = [a3 webView];
  id v10 = [(_SFBrowserContentViewController *)self _contextMenuConfigurationForWebView:v9 element:v11];
  v8[2](v8, v10);
}

- (id)webViewController:(id)a3 contextMenuContentPreviewForElement:(id)a4
{
  id v6 = a4;
  id v7 = [a3 webView];
  id v8 = [(_SFBrowserContentViewController *)self _contextMenuContentPreviewForWebView:v7 element:v6];

  return v8;
}

- (void)webViewController:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v8 = a5;
  id v7 = [a3 webView];
  [(_SFBrowserContentViewController *)self _willCommitContextMenuForWebView:v7 withAnimator:v8];
}

- (void)webViewController:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id v8 = a3;
  id v5 = [v8 webView];
  +[_SFLinkPreviewHelper invalidateLinkPreviewHelperForWebView:v5];

  [(_SFBrowserContentViewController *)self _invalidatePreviewCloseTimer];
  id v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__closePreviewDocumentTimerFired_ selector:0 userInfo:0 repeats:0.0];
  previewCloseTimer = self->_previewCloseTimer;
  self->_previewCloseTimer = v6;
}

- (void)_closePreviewDocumentTimerFired:(id)a3
{
  [(WKWebView *)self->_previewWebView _close];
  previewWebView = self->_previewWebView;
  self->_previewWebView = 0;

  [(_SFBrowserContentViewController *)self _invalidatePreviewCloseTimer];
}

- (void)_invalidatePreviewCloseTimer
{
  [(NSTimer *)self->_previewCloseTimer invalidate];
  previewCloseTimer = self->_previewCloseTimer;
  self->_previewCloseTimer = 0;
}

- (void)contextMenuConfigurationForReaderViewController:(id)a3 element:(id)a4 completionHandler:(id)a5
{
  id v11 = a4;
  id v8 = (void (**)(id, void *))a5;
  BOOL v9 = [a3 readerWebView];
  id v10 = [(_SFBrowserContentViewController *)self _contextMenuConfigurationForWebView:v9 element:v11];
  v8[2](v8, v10);
}

- (void)readerViewController:(id)a3 contextMenuForElement:(id)a4 willCommitWithAnimator:(id)a5
{
  id v8 = a5;
  id v7 = [a3 readerWebView];
  [(_SFBrowserContentViewController *)self _willCommitContextMenuForWebView:v7 withAnimator:v8];
}

- (void)readerViewController:(id)a3 contextMenuDidEndForElement:(id)a4
{
  id v4 = [a3 readerWebView];
  +[_SFLinkPreviewHelper invalidateLinkPreviewHelperForWebView:](_SFLinkPreviewHelper, "invalidateLinkPreviewHelperForWebView:");
}

- (id)linkPreviewHelper:(id)a3 previewViewControllerForURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(_SFBrowserContentViewController);
  BOOL v9 = [(_SFBrowserContentViewController *)v8 browserView];
  [v9 setContentReadyForDisplay];
  id v10 = [v6 elementInfo];
  [(_SFBrowserContentViewController *)v8 setActivatedElementInfo:v10];

  id v11 = [(_SFBrowserContentViewController *)self view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(_SFBrowserContentViewController *)v8 view];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  id v21 = [MEMORY[0x1E4FB1618] whiteColor];
  int v22 = [(_SFBrowserContentViewController *)v8 view];
  [v22 setBackgroundColor:v21];

  long long v23 = [SFReaderEnabledWebViewController alloc];
  long long v24 = [(_SFBrowserContentViewController *)self webViewConfiguration];
  uint64_t v25 = [(_SFBrowserContentViewController *)self contentBlockerManager];
  uint64_t v26 = [(SFWebViewController *)v23 initWithWebViewConfiguration:v24 contentBlockerManager:v25];

  [(_SFBrowserContentViewController *)v8 _pushWebViewController:v26];
  uint64_t v27 = [(_SFBrowserContentViewController *)v8 webViewController];
  int v28 = [v27 webView];
  [v28 _setAllowsMediaDocumentInlinePlayback:1];

  [(_SFBrowserContentViewController *)v8 _didLoadWebView];
  BOOL v29 = [(_SFBrowserContentViewController *)v8 webViewController];
  int v30 = [v29 webView];
  previewWebView = self->_previewWebView;
  self->_previewWebView = v30;

  uint64_t v32 = [(_SFBrowserContentViewController *)self webView];
  double v33 = [v32 _sessionState];

  uint64_t v34 = [(_SFBrowserContentViewController *)v8 webViewController];
  double v35 = [v34 webView];
  id v36 = (id)[v35 _restoreSessionState:v33 andNavigate:0];

  [(_SFBrowserContentViewController *)v8 setDisplayMode:1];
  [(_SFReloadOptionsController *)v8->_reloadOptionsController setSupportsAdvancedPrivacyProtections:[(_SFBrowserContentViewController *)self supportsAdvancedPrivacyProtectionsForURL:v7]];
  if ([(_SFReloadOptionsController *)self->_reloadOptionsController loadedUsingDesktopUserAgent])
  {
    [(_SFReloadOptionsController *)v8->_reloadOptionsController requestDesktopSiteWithURL:v7];
  }
  else
  {
    double v37 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v7);
    double v38 = [(_SFBrowserContentViewController *)self _requestBySettingAdvancedPrivacyProtectionsFlag:v37];

    [(_SFBrowserContentViewController *)v8 loadRequest:v38];
  }
  double v39 = [v9 previewHeader];
  [v6 setActiveLinkPreviewHeader:v39];

  return v8;
}

- (void)linkPreviewHelper:(id)a3 commitPreviewViewControllerForAction:(int64_t)a4 withTabOrder:(int64_t)a5
{
  id v6 = a3;
  id v7 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_DEFAULT, "Committing link preview of webpage link", buf, 2u);
  }
  [(_SFBrowserContentViewController *)self _invalidatePreviewCloseTimer];
  previewWebView = self->_previewWebView;
  self->_previewWebView = 0;

  BOOL v9 = [v6 previewContentViewController];
  id v10 = [v9 webViewController];
  id v11 = [v10 webView];
  double v12 = [(_SFBrowserContentViewController *)self view];
  [v12 bounds];
  objc_msgSend(v11, "setBounds:");

  double v13 = [(_SFBrowserContentViewController *)self view];
  [v13 bounds];
  UIRectGetCenter();
  objc_msgSend(v11, "setCenter:");

  long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v16[0] = *MEMORY[0x1E4F1DAB8];
  v16[1] = v14;
  v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v11 setTransform:v16];
  [v11 _setAllowsMediaDocumentInlinePlayback:0];
  double v15 = [v11 _unreachableURL];

  if (v15) {
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController webViewDidCommitErrorPagePreview:v11];
  }
  [v9 _invalidateWebViewControllers];
  [(_SFBrowserContentViewController *)self _popWebViewController];
  [(_SFBrowserContentViewController *)self _pushWebViewController:v10];
  [(_SFBrowserContentViewController *)self _hideReaderAnimated:0 deactivationMode:0];
  [(_SFBrowserContentViewController *)self _updateUI];
}

- (BOOL)linkPreviewHelper:(id)a3 supportsAction:(int64_t)a4 forURL:(id)a5
{
  return (unint64_t)a4 > 4 || (a4 & 0x1F) == 2;
}

- (id)linkPreviewHelper:(id)a3 resultOfLoadingURL:(id)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", a4);
  id v6 = [(_SFBrowserContentViewController *)self resultOfLoadingRequest:v5 inMainFrame:1 disallowRedirectToExternalApps:0];

  return v6;
}

- (void)linkPreviewHelper:(id)a3 redirectToExternalNavigationResult:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F18DA8];
  id v9 = v5;
  id v7 = [v5 URL];
  id v8 = objc_msgSend(v6, "safari_nonAppInitiatedRequestWithURL:", v7);
  [(_SFBrowserContentViewController *)self _redirectToExternalNavigationResult:v9 fromOriginalRequest:v8 promptPolicy:0 isMainFrame:1 userAction:0];
}

- (void)linkPreviewHelper:(id)a3 didProduceNavigationIntent:(id)a4 forAction:(int64_t)a5
{
  id v6 = (void *)MEMORY[0x1E4F18DA8];
  objc_msgSend(a4, "URL", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = objc_msgSend(v6, "safari_nonAppInitiatedRequestWithURL:");
  [(_SFBrowserContentViewController *)self loadRequest:v7];
}

- (void)linkPreviewHelperWillDisableLinkPreview
{
  [(WKWebView *)self->_previewWebView _close];
  previewWebView = self->_previewWebView;
  self->_previewWebView = 0;
}

- (void)linkPreviewHelperWillOpenUniversalLinkLocally:(id)a3
{
  self->_BOOL shouldRevealAppLinkBannerForNextCommit = 1;
}

- (void)webViewControllerWillPresentJavaScriptDialog:(id)a3
{
}

- (void)webViewController:(id)a3 printFrame:(id)a4
{
  id v5 = a4;
  if ([(_SFBrowserContentViewController *)self canPrint]) {
    [(_SFPrintController *)self->_printController printFrame:v5 initiatedByWebContent:1 completion:0];
  }
}

- (void)webViewController:(id)a3 didStartLoadForQuickLookDocumentInMainFrameWithFileName:(id)a4 uti:(id)a5
{
  double v12 = (NSString *)a4;
  id v7 = a5;
  id v8 = objc_alloc(MEMORY[0x1E4F78338]);
  if (self->_suggestedFilenameForNextCommit) {
    suggestedFilenameForNextCommit = self->_suggestedFilenameForNextCommit;
  }
  else {
    suggestedFilenameForNextCommit = v12;
  }
  id v10 = (SFQuickLookDocumentWriter *)[v8 initWithFileName:suggestedFilenameForNextCommit uti:v7];
  quickLookDocumentWriter = self->_quickLookDocumentWriter;
  self->_quickLookDocumentWriter = v10;
}

- (void)webViewController:(id)a3 didFinishLoadForQuickLookDocumentInMainFrame:(id)a4
{
}

- (int64_t)webViewController:(id)a3 presentationPolicyForDialog:(id)a4
{
  return objc_msgSend(a4, "completionHandlerBlocksWebProcess", a3) && self->_showingReader;
}

- (void)webViewController:(id)a3 didChangeFullScreen:(BOOL)a4
{
  self->_webViewIsInFullScreen = a4;
}

- (id)webViewController:(id)a3 didStartDownload:(id)a4
{
  id v5 = a4;
  if (self->_activeDownload)
  {
    id v6 = 0;
  }
  else
  {
    id v7 = +[_SFDownloadDispatcher sharedDownloadDispatcher];
    id v6 = [v7 downloadFromWKDownload:v5 userInitiatedAction:self->_lastUserInitiatedAction];
    [v6 setDelegate:self];
    [v6 setFluidProgressController:self->_fluidProgressController];
    objc_storeStrong((id *)&self->_activeDownload, v6);
  }

  return v6;
}

- (void)webViewController:(id)a3 decidePolicyForSOAuthorizationLoadWithCurrentPolicy:(int64_t)a4 forExtension:(id)a5 completionHandler:(id)a6
{
  id v7 = (void (**)(id, void))a6;
  v7[2](v7, [(_SFBrowserContentViewController *)self _isPreviewing]);
}

- (BOOL)printControllerShouldPrintReader:(id)a3
{
  return self->_showingReader;
}

- (BOOL)printControllerPageIsLoading:(id)a3
{
  id v3 = [(_SFBrowserContentViewController *)self webViewController];
  char v4 = [v3 isLoading];

  return v4;
}

- (BOOL)printControllerCanPresentPrintUI:(id)a3
{
  return ![(_SFBrowserContentViewController *)self isBlockedByScreenTime];
}

- (void)printController:(id)a3 didCreatePrintInfo:(id)a4
{
}

- (BOOL)isPageEligibileToShowNotSecureWarning
{
  id v3 = [(_SFBrowserContentViewController *)self webViewController];
  char v4 = [v3 webView];
  id v5 = [(_SFBrowserView *)self->_browserView quickLookDocumentView];

  if (v5)
  {
    if ([v3 didFirstVisuallyNonEmptyLayout])
    {
      id v6 = [(_SFBrowserContentViewController *)self expectedOrCurrentURL];
      char v7 = objc_msgSend(v6, "safari_isEligibleToShowNotSecureWarning");
LABEL_11:

      goto LABEL_12;
    }
  }
  else if ([v3 didFirstVisuallyNonEmptyLayout])
  {
    id v6 = [(_SFBrowserContentViewController *)self expectedOrCurrentURL];
    if ((objc_msgSend(v6, "safari_isEligibleToShowNotSecureWarning") & 1) != 0
      || (objc_opt_respondsToSelector() & 1) != 0 && [v4 _negotiatedLegacyTLS])
    {
      id v8 = [v4 _committedURL];
      id v9 = [v8 host];
      id v10 = objc_msgSend(v9, "safari_highLevelDomainFromHost");
      id v11 = [(_SFBrowserContentViewController *)self expectedOrCurrentURL];
      double v12 = [v11 host];
      double v13 = objc_msgSend(v12, "safari_highLevelDomainFromHost");
      char v7 = [v10 isEqualToString:v13];
    }
    else
    {
      char v7 = 0;
    }
    goto LABEL_11;
  }
  char v7 = 0;
LABEL_12:

  return v7;
}

- (void)updateBottomBarOffset:(double)a3 topBarHeight:(double)a4
{
  [(_SFBrowserView *)self->_browserView setBottomBarOffset:a3];
  browserView = self->_browserView;

  [(_SFBrowserView *)browserView setTopBarHeight:a4];
}

- (void)_dismiss
{
}

- (void)_showBarsFromBottomBarTap:(id)a3
{
  self->_pageScrollsWithBottomBar = 1;
  [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:1 animated:1];
}

- (void)_receivedTouchDown:(id)a3
{
  if ([a3 state] == 3)
  {
    stepperContainer = self->_stepperContainer;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54___SFBrowserContentViewController__receivedTouchDown___block_invoke;
    v5[3] = &unk_1E5C73108;
    v5[4] = self;
    [(SFStepperContainer *)stepperContainer hideStepperWithCompletion:v5];
  }
}

- (void)_receivedTouchUp:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3 && self->_stepperMovedToRootView)
  {
    self->_stepperMovedToRootView = 0;
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:1 animated:1];
  }
}

- (void)stopLoading
{
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  [v4 setLoading:0];
  id v3 = [v4 webView];
  [v3 stopLoading];

  [(WBSFluidProgressController *)self->_fluidProgressController cancelFluidProgressWithProgressStateSource:self];
}

- (BOOL)dynamicBarAnimator:(id)a3 canTransitionToState:(int64_t)a4 byDraggingWithOffset:(double)a5
{
  id v9 = a3;
  if (a4 == 1)
  {
    BOOL v5 = !self->_keepBarsMinimized;
  }
  else if (!a4)
  {
    if ([(UIPanGestureRecognizer *)self->_hideNavigationBarGestureRecognizer state] <= 0)
    {
      id v10 = [(_SFBrowserContentViewController *)self _currentWebView];
      id v11 = [v10 scrollView];

      [v11 contentSize];
      double v13 = v12;
      [v11 contentInset];
      double v15 = v14;
      [v11 bounds];
      double MaxY = CGRectGetMaxY(v19);
      [(_SFBrowserContentViewController *)self _bottomToolbarHeight];
      BOOL v5 = v13 + v15 - MaxY - a5 > v17;
    }
    else
    {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (void)dynamicBarAnimatorWillEnterSteadyState:(id)a3
{
  id v4 = a3;
  [(_SFBrowserContentViewController *)self _updateMaxVisibleHeightPercentageUserDriven:1];
  if ([v4 state] == 1)
  {
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator setIgnoresDragging:0];
    self->_alwaysShowTopBar = 0;
  }
}

- (void)dynamicBarAnimatorStateDidChange:(id)a3
{
  id v4 = a3;
  if (self->_keepBarsMinimized && [v4 state] == 1)
  {
    self->_keepBarsMinimized = 0;
    [(_SFBrowserContentViewController *)self _updateWebViewLayoutSize];
  }
}

- (void)dynamicBarAnimatorOutputsDidChange:(id)a3
{
  id v9 = a3;
  [v9 topBarHeight];
  if (self->_alwaysShowTopBar)
  {
    id v4 = [(_SFBrowserView *)self->_browserView navigationBar];
    [v4 defaultHeight];
  }
  [v9 bottomBarOffset];
  -[_SFBrowserContentViewController updateBottomBarOffset:topBarHeight:](self, "updateBottomBarOffset:topBarHeight:");
  [(_SFBrowserContentViewController *)self _updateCrashBannerOffset];
  [(_SFBrowserContentViewController *)self _updatePinnableBannerOffset];
  [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
  if (self->_pageScrollsWithBottomBar)
  {
    [(_SFBrowserView *)self->_browserView safeAreaInsets];
    [v9 bottomBarOffset];
    [(_SFBrowserView *)self->_browserView bounds];
    CGRectGetHeight(v11);
    BOOL v5 = [(_SFBrowserView *)self->_browserView toolbar];
    [v5 bounds];
    CGRectGetHeight(v12);

    id v6 = [(_SFBrowserView *)self->_browserView toolbar];
    [v6 frame];
    CGRectGetMinY(v13);

    char v7 = [(_SFBrowserView *)self->_browserView currentWebView];
    id v8 = [v7 scrollView];

    [v8 contentOffset];
    objc_msgSend(v8, "setContentOffset:");
  }
  self->_shouldAutoHideHomeIndicator = [v9 state] == 0;
  [(_SFBrowserContentViewController *)self _updateHomeIndicatorAutoHideState];
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  id v4 = a3;
  dynamicBarAnimator = self->_dynamicBarAnimator;
  if (dynamicBarAnimator && ![(_SFDynamicBarAnimator *)dynamicBarAnimator state])
  {
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:1 animated:1];
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  self->_scrollViewIsDragging = 1;
  id v8 = v4;
  [v4 contentOffset];
  -[_SFBrowserContentViewController _crashBannerDraggingOffsetForContentOffset:](self, "_crashBannerDraggingOffsetForContentOffset:");
  self->_double crashBannerDraggingOffset = v5;
  if ([(_SFBrowserContentViewController *)self _effectiveBarCollapsingEnabled])
  {
    dynamicBarAnimator = self->_dynamicBarAnimator;
    [v8 contentOffset];
    [(_SFDynamicBarAnimator *)dynamicBarAnimator beginDraggingWithOffset:v7];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v10 = a3;
  [(_SFBrowserContentViewController *)self _updateScrollToTopView];
  if (self->_showingCrashBanner)
  {
    [(_SFBrowserContentViewController *)self _updateCrashBannerOffset];
    [(_SFBrowserView *)self->_browserView crashBannerOffset];
    double v5 = v4;
    BOOL v6 = [(_SFBrowserView *)self->_browserView crashBanner];
    [v6 bounds];
    CGFloat v7 = -CGRectGetHeight(v12);

    if (v5 < v7) {
      [(_SFBrowserContentViewController *)self _setShowingCrashBanner:0 animated:0];
    }
  }
  if (self->_showingPinnableBanner) {
    [(_SFBrowserContentViewController *)self _updatePinnableBannerOffset];
  }
  if (self->_showingCrashBanner || self->_showingPinnableBanner) {
    [(_SFBrowserContentViewController *)self _updateCurrentScrollViewInsets];
  }
  [(_SFBrowserView *)self->_browserView layoutIfNeeded];
  if ([(_SFBrowserContentViewController *)self _effectiveBarCollapsingEnabled])
  {
    if ([(_SFDynamicBarAnimator *)self->_dynamicBarAnimator isTrackingDrag]) {
      self->_pageScrollsWithBottomBar = 0;
    }
    [(_SFBrowserContentViewController *)self _updateDynamicBarGeometry];
    if (self->_scrollViewIsDragging)
    {
      if (self->_usesNarrowLayout
        && objc_msgSend(v10, "_sf_isScrolledToOrPastBottom")
        && !self->_keepBarsMinimized)
      {
        [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:1 animated:1];
      }
      dynamicBarAnimator = self->_dynamicBarAnimator;
      [v10 contentOffset];
      [(_SFDynamicBarAnimator *)dynamicBarAnimator updateDraggingWithOffset:v9];
      [(_SFBrowserContentViewController *)self _updateMaxVisibleHeightPercentageUserDriven:1];
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  id v8 = a3;
  if (self->_scrollViewIsDragging)
  {
    self->_scrollViewIsDragging = 0;
    if ([(_SFBrowserContentViewController *)self _effectiveBarCollapsingEnabled]) {
      [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator endDraggingWithTargetOffset:a5->y velocity:y * 1000.0];
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(_SFBrowserContentViewController *)self _didCompleteScrolling];
  }
}

- (void)_didCompleteScrolling
{
}

- (void)_updateModalInPresentation
{
  if ([(_SFBrowserContentViewController *)self _isUsedForAuthentication]
    || [(SFSafariViewControllerConfiguration *)self->_configuration _isPerformingAccountSecurityUpgrade])
  {
    [(_SFBrowserContentViewController *)self setModalInPresentation:1];
  }
}

- (NSString)_hostAppBundleId
{
  return 0;
}

- (BOOL)_shouldReloadImmediatelyAfterPageLoadError
{
  double v2 = [(_SFBrowserContentViewController *)self viewIfLoaded];
  id v3 = [v2 window];
  double v4 = [v3 windowScene];

  if (v4) {
    BOOL v5 = [v4 activationState] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setSafariDataSharingMode:(int64_t)a3
{
  if (self->_safariDataSharingMode != a3)
  {
    BOOL v5 = [(_SFBrowserContentViewController *)self webView];
    id v14 = [v5 URL];

    [(_SFBrowserContentViewController *)self _hideReaderAnimated:0 deactivationMode:0];
    [(_SFBrowserContentViewController *)self _invalidateWebViewControllers];
    bottomToolbar = self->_bottomToolbar;
    self->_bottomToolbar = 0;

    self->_safariDataSharingMode = a3;
    CGFloat v7 = [SFReaderEnabledWebViewController alloc];
    id v8 = [(_SFBrowserContentViewController *)self webViewConfiguration];
    double v9 = [(_SFBrowserContentViewController *)self contentBlockerManager];
    id v10 = [(SFWebViewController *)v7 initWithWebViewConfiguration:v8 contentBlockerManager:v9];

    [(_SFBrowserContentViewController *)self _pushWebViewController:v10];
    int64_t v11 = [(_SFBrowserContentViewController *)self _persona];
    CGRect v12 = [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor requestDesktopSitePreferenceManager];
    [v12 setClientPrefersMobileUserAgentByDefault:((v11 - 2) & 0xFFFFFFFFFFFFFFFDLL) == 0];

    if (v14)
    {
      CGRect v13 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v14);
      [(_SFBrowserContentViewController *)self loadRequest:v13];
    }
    [(_SFBrowserContentViewController *)self _updateModalInPresentation];
  }
}

- (void)navigationBarMetricsDidChange:(id)a3
{
  [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator attemptTransitionToState:1 animated:0];
  double v4 = [(_SFBrowserView *)self->_browserView navigationBar];
  [v4 defaultHeight];
  -[_SFBrowserView setTopBarHeight:](self->_browserView, "setTopBarHeight:");

  [(_SFBrowserContentViewController *)self _layOutBrowserViewForSizeTransition];

  [(_SFBrowserContentViewController *)self _didCompleteViewSizeTransition];
}

- (void)_showBars
{
}

- (id)pageFormatMenuController
{
  pageFormatMenuController = self->_pageFormatMenuController;
  if (!pageFormatMenuController)
  {
    double v4 = [[_SFPageFormatMenuController alloc] initWithBrowserContentController:self];
    BOOL v5 = self->_pageFormatMenuController;
    self->_pageFormatMenuController = v4;

    pageFormatMenuController = self->_pageFormatMenuController;
  }

  return pageFormatMenuController;
}

- (void)navigationBarFormatMenuButtonWasTapped:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_SFBrowserContentViewController *)self pageFormatMenuController];
  BOOL v6 = [v5 viewController];
  CGFloat v7 = [v6 presentingViewController];

  if (!v7)
  {
    id v8 = [MEMORY[0x1E4F98948] sharedLogger];
    [v8 reportSVCToolbarButtonUsage:35];
  }
  [(_SFBrowserContentViewController *)self _dismissTransientUIAnimated:1];
  double v9 = [v4 formatMenuButtonPopoverSourceInfo];
  char v10 = [v5 presentMenuFromViewController:self withSourceInfo:v9 fromSafariViewController:1];

  if (v10)
  {
    int64_t v11 = [(_SFBrowserContentViewController *)self assistantController];
    CGRect v12 = [(_SFBrowserContentViewController *)self webView];
    CGRect v13 = [v12 _committedURL];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __74___SFBrowserContentViewController_navigationBarFormatMenuButtonWasTapped___block_invoke;
    v14[3] = &unk_1E5C77048;
    id v15 = v5;
    [v11 updateAssistantContentForURL:v13 completionHandler:v14];
  }
}

- (void)navigationBarFormatMenuButtonBecameUnavailable:(id)a3
{
  id v4 = [(_SFBrowserContentViewController *)self pageFormatMenuController];
  id v3 = [v4 viewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_hideNavigationBarGestureRecognized:(id)a3
{
  id v10 = a3;
  [v10 translationInView:self->_browserView];
  double v5 = v4;
  BOOL v6 = [(_SFBrowserView *)self->_browserView currentWebView];
  uint64_t v7 = [v10 state];
  if ((unint64_t)(v7 - 3) >= 3)
  {
    double v9 = -v5;
    if (v7 == 1)
    {
      [v6 _beginInteractiveObscuredInsetsChange];
      [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator beginDraggingWithOffset:v9];
    }
    else if (v7 == 2)
    {
      [(_SFBrowserContentViewController *)self _updateDynamicBarGeometry];
      [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator updateDraggingWithOffset:v9];
    }
  }
  else
  {
    [v6 _endInteractiveObscuredInsetsChange];
    [v10 velocityInView:self->_browserView];
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator endDraggingWithTargetOffset:(double)(v8 / log(*MEMORY[0x1E4FB2EF0]) - v5) velocity:v8 * -1000.0];
    if (![(_SFDynamicBarAnimator *)self->_dynamicBarAnimator targetState]) {
      self->_keepBarsMinimized = 1;
    }
  }
}

- (void)navigationBarReaderButtonWasTapped:(id)a3
{
  id v8 = a3;
  if (self->_showingReader
    || ([(_SFBrowserContentViewController *)self webViewController],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 readerController],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isReaderAvailable],
        v5,
        v4,
        v6))
  {
    [(_SFBrowserContentViewController *)self toggleShowingReaderForUserAction];
  }
  uint64_t v7 = [MEMORY[0x1E4F98948] sharedLogger];
  [v7 reportSVCToolbarButtonUsage:25];
}

- (void)navigationBarTranslateButtonWasTapped:(id)a3
{
  id v10 = a3;
  double v4 = [(_SFBrowserContentViewController *)self translationContext];
  double v5 = [v4 availableTargetLocaleIdentifiers];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    if (v6 == 1)
    {
      uint64_t v7 = [v5 objectAtIndexedSubscript:0];
      [v4 requestTranslatingWebpageToLocale:v7 completionHandler:0];
    }
    else
    {
      uint64_t v7 = [[_SFTranslationTargetLocaleAlertController alloc] initWithTranslationContext:v4];
      id v8 = [v10 formatMenuButtonPopoverSourceInfo];
      [(_SFTranslationTargetLocaleAlertController *)v7 configurePopoverWithSourceInfo:v8];

      [(_SFBrowserContentViewController *)self presentViewController:v7 animated:1 completion:0];
    }
  }
  double v9 = [MEMORY[0x1E4F98948] sharedLogger];
  [v9 reportSVCToolbarButtonUsage:27];
}

- (void)_translationAvailabilityDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69___SFBrowserContentViewController__translationAvailabilityDidChange___block_invoke;
  v6[3] = &unk_1E5C72628;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)navigationBarFormatMenuButtonStartedInteraction:(id)a3
{
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  id v3 = [v4 readerController];
  [v3 checkReaderAvailability];
}

- (void)navigationBarReloadButtonWasTapped:(id)a3
{
  if (![(_SFBrowserContentViewController *)self _suppressReloadToPreventLoadingJavaScriptIfNecessary])
  {
    [(_SFBrowserContentViewController *)self _reloadFromOrigin:0];
    self->_isNavigatingViaNormalReload = 1;
    id v4 = [MEMORY[0x1E4F98948] sharedLogger];
    [v4 reportSVCToolbarButtonUsage:22];
  }
}

- (void)_reloadFromOrigin:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(_SFBrowserContentViewController *)self _suppressReloadToPreventLoadingJavaScriptIfNecessary])
  {
    self->_unint64_t externalAppRedirectState = 4;
    self->_loadWasUserDriven = 1;
    [(_SFBrowserContentViewController *)self _willBeginUserInitiatedNavigation];
    id v9 = [(_SFBrowserContentViewController *)self webViewController];
    id v5 = [v9 webView];
    [v9 setLoading:1];
    if (v3) {
      id v6 = (id)[v5 reloadFromOrigin];
    }
    else {
      id v7 = (id)[v5 reload];
    }
    [(_SFReaderViewController *)self->_readerViewController setDelegate:0];
    readerViewController = self->_readerViewController;
    self->_readerViewController = 0;
  }
}

- (void)navigationBarStopLoadingButtonWasTapped:(id)a3
{
  id v5 = [(_SFBrowserContentViewController *)self webViewController];
  [v5 setLoading:0];
  BOOL v3 = [v5 webView];
  [v3 stopLoading];

  id v4 = [MEMORY[0x1E4F98948] sharedLogger];
  [v4 reportSVCToolbarButtonUsage:23];
}

- (id)navigationBarURLForSharing:(id)a3
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webView];
  id v4 = [v3 URL];
  id v5 = [v3 title];
  [v4 _setTitle:v5];

  return v4;
}

- (void)navigationBarMediaStateMuteButtonWasTapped:(id)a3
{
  id v4 = [(_SFBrowserContentViewController *)self webView];
  if (_SFMediaStateIconIsMuted()) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  [v4 _setPageMuted:v3];
}

- (void)navigationBar:(id)a3 didCreateLeadingToolbar:(id)a4 trailingToolbar:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  int64_t v8 = [(_SFBrowserContentViewController *)self _persona];
  [(_SFBarManager *)self->_barManager registerToolbar:v9 withLayout:0 persona:v8];
  [(_SFBarManager *)self->_barManager registerToolbar:v7 withLayout:1 persona:v8];
}

- (BOOL)createFluidProgressState
{
  downloadToShowInQuickLook = self->_downloadToShowInQuickLook;
  if (!downloadToShowInQuickLook && !self->_fluidProgressState)
  {
    id v4 = (WBSFluidProgressState *)[objc_alloc(MEMORY[0x1E4F98B10]) initWithType:0];
    fluidProgressState = self->_fluidProgressState;
    self->_fluidProgressState = v4;

    id v6 = self->_fluidProgressState;
    id v7 = [(_SFBrowserContentViewController *)self expectedOrCurrentURL];
    int64_t v8 = objc_msgSend(v7, "safari_originalDataAsString");
    [(WBSFluidProgressState *)v6 setLoadURL:v8];
  }
  return downloadToShowInQuickLook == 0;
}

- (void)clearFluidProgressState
{
  fluidProgressState = self->_fluidProgressState;
  self->_fluidProgressState = 0;
}

- (id)progressState
{
  return self->_fluidProgressState;
}

- (void)_setSuppressingPreviewProgressAnimation:(BOOL)a3
{
  if (self->_isSuppressingPreviewProgressAnimation != a3)
  {
    BOOL v3 = a3;
    self->_isSuppressingPreviewProgressAnimation = a3;
    id v5 = [(_SFBrowserView *)self->_browserView previewHeader];
    id v6 = [v5 progressView];

    if (v6) {
      [(WBSFluidProgressController *)self->_fluidProgressController setProgressAnimationSuppressed:v3 forProgressStateSource:self animated:0];
    }
  }
}

- (id)expectedOrCurrentURL
{
  double v2 = [(_SFBrowserContentViewController *)self webView];
  BOOL v3 = [v2 URL];

  return v3;
}

- (double)estimatedProgress
{
  double v2 = [(_SFBrowserContentViewController *)self webView];
  [v2 estimatedProgress];
  double v4 = v3;

  return v4;
}

- (BOOL)hasFailedURL
{
  double v2 = [(_SFBrowserContentViewController *)self webView];
  double v3 = [v2 _unreachableURL];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)currentFluidProgressStateSource
{
  activeDownload = self->_activeDownload;
  if (activeDownload)
  {
    double v3 = activeDownload;
  }
  else
  {
    uint64_t v5 = [(_SFBrowserContentViewController *)self translationContext];
    double v3 = (_SFDownload *)v5;
    if (!self->_shouldReflectTranslationAsFluidProgress || v5 == 0)
    {
      id v7 = self;

      double v3 = (_SFDownload *)v7;
    }
  }

  return v3;
}

- (void)fluidProgressRocketAnimationDidComplete
{
  if (self->_shouldReflectTranslationAsFluidProgress)
  {
    id v2 = [(_SFBrowserContentViewController *)self translationContext];
    [v2 clearFluidProgressState];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_showBarsFromBottomBarRecognizer == v6)
  {
    if (self->_keepBarsMinimized || [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator state])
    {
      BOOL v8 = 0;
    }
    else
    {
      [(_SFBrowserView *)self->_browserView bounds];
      double v11 = v10;
      [v7 locationInView:self->_browserView];
      double v13 = v12;
      id v14 = [(_SFBrowserView *)self->_browserView toolbar];
      [v14 bounds];
      BOOL v8 = v11 - v13 < CGRectGetHeight(v15);
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return self->_showBarsFromBottomBarRecognizer == a3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  BOOL v4 = (UITapGestureRecognizer *)a3;
  uint64_t v5 = v4;
  if ((UITapGestureRecognizer *)self->_hideNavigationBarGestureRecognizer == v4)
  {
    LOBYTE(self) = [(_SFBrowserContentViewController *)self canHideToolbar];
  }
  else if (self->_showBarsFromBottomBarRecognizer == v4)
  {
    LODWORD(self) = ![(_SFDynamicBarAnimator *)self->_dynamicBarAnimator isTrackingDrag];
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return self->_touchDownGestureRecognizer == a3 || self->_touchUpGestureRecognizer == a3;
}

- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5
{
}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  return 1;
}

- (BOOL)pageLoadErrorControllerShouldHandleCertificateError:(id)a3
{
  return 1;
}

- (void)pageLoadErrorController:(id)a3 loadFailedRequestAfterError:(id)a4
{
}

- (id)pageLoadErrorControllerGetSecIdentityPreferencesController:(id)a3
{
  secIdentityPreferencesController = self->_secIdentityPreferencesController;
  if (!secIdentityPreferencesController)
  {
    uint64_t v5 = +[_SFSecIdentityPreferencesController sharedPersistentSecIdentityPreferencesController];
    id v6 = self->_secIdentityPreferencesController;
    self->_secIdentityPreferencesController = v5;

    secIdentityPreferencesController = self->_secIdentityPreferencesController;
  }

  return secIdentityPreferencesController;
}

- (void)pageLoadErrorController:(id)a3 presentViewController:(id)a4
{
}

- (BOOL)pageLoadErrorControllerShouldPermanentlyAcceptCertificate:(id)a3
{
  return 1;
}

- (void)pageLoadErrorControllerReloadUsingHTTPSOnlyBypass:(id)a3
{
  BOOL v4 = [(_SFBrowserContentViewController *)self webView];
  uint64_t v5 = [v4 URL];
  id v6 = [v5 host];
  objc_msgSend(v6, "safari_highLevelDomainFromHost");
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  highLevelDomainForHTTPSOnlyBypass = self->_highLevelDomainForHTTPSOnlyBypass;
  self->_highLevelDomainForHTTPSOnlyBypass = v7;

  [(_SFBrowserContentViewController *)self reload];
}

- (void)pageLoadErrorControllerReloadWithoutPrivateRelay:(id)a3
{
}

- (void)downloadDidFail:(id)a3
{
  activeDownload = self->_activeDownload;
  self->_activeDownload = 0;
}

- (void)downloadDidFinish:(id)a3
{
  id v4 = a3;
  activeDownload = self->_activeDownload;
  self->_activeDownload = 0;

  if ([(_SFBrowserContentViewController *)self _canShowDownloadWithoutPrompting:v4])
  {
    [(_SFBrowserContentViewController *)self _showDownload:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = (void *)MEMORY[0x1E4F78270];
    uint64_t v7 = [v4 fileType];
    BOOL v8 = [(_SFBrowserContentViewController *)self webView];
    id v9 = [v8 URL];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __53___SFBrowserContentViewController_downloadDidFinish___block_invoke;
    v12[3] = &unk_1E5C77250;
    objc_copyWeak(&v14, &location);
    id v13 = v4;
    double v10 = [v6 downloadBlockedDialogWithFileType:v7 initiatingURL:v9 completionHandler:v12];

    double v11 = [(_SFBrowserContentViewController *)self webViewController];
    [v11 presentDialog:v10 sender:self];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

- (void)downloadShouldContinueAfterReceivingResponse:(id)a3 decisionHandler:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  if ([v9 fileType] == 2)
  {
    uint64_t v7 = [v9 quickLookDocument];

    if (!v7)
    {
      BOOL v8 = [(_SFBrowserContentViewController *)self _quickLookDocumentForDownload:v9];
      [v9 setQuickLookDocument:v8];
    }
  }
  v6[2](v6, 1);
}

- (BOOL)_canShowDownloadWithoutPrompting:(id)a3
{
  id v4 = a3;
  if ([v4 fileType] == 1 || objc_msgSend(v4, "fileType") == 6)
  {
    LOBYTE(v5) = 0;
  }
  else if ([v4 fileType] == 2 || self->_canOpenDownloadForInitialLoad)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v7 = [v4 userInitiatedAction];
    BOOL v8 = v7;
    if (v7 && v7 == self->_lastUserInitiatedAction) {
      int v5 = [(_WKUserInitiatedAction *)v7 isConsumed] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (void)_showDownload:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 fileType];
  uint64_t v7 = [v5 fileDownloadPath];
  self->_canOpenDownloadForInitialLoad = 0;
  BOOL v8 = [v5 userInitiatedAction];
  char v9 = [v8 isConsumed];

  if ((v9 & 1) == 0)
  {
    double v10 = [v5 userInitiatedAction];
    [v10 consume];
  }
  switch(v6)
  {
    case 1:
      double v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v7];
      double v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      objc_msgSend(v12, "_web_removeFileOnlyAtPath:", v7);

      if (v11)
      {
        id v13 = [MEMORY[0x1E4F74230] sharedConnection];
        id v14 = [v7 lastPathComponent];
        CGRect v15 = [(_SFBrowserContentViewController *)self bundleIdentifierForProfileInstallation];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __49___SFBrowserContentViewController__showDownload___block_invoke_355;
        v41[3] = &unk_1E5C774D0;
        v41[4] = self;
        [v13 queueFileDataForAcceptance:v11 originalFileName:v14 forBundleID:v15 completion:v41];

        goto LABEL_22;
      }
      double v38 = WBS_LOG_CHANNEL_PREFIXDownloads();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[_SFBrowserContentViewController _showDownload:]();
      }
      [(_SFPageLoadErrorController *)self->_pageLoadErrorController addInvalidProfileAlert];
      goto LABEL_23;
    case 2:
      double v16 = [MEMORY[0x1E4F98948] sharedLogger];
      double v17 = [v5 mimeType];
      double v18 = [v5 uti];
      objc_msgSend(v16, "_sf_didBeginDownloadWithMIMEType:uti:downloadType:promptType:browserPersona:", v17, v18, 0, 0, -[_SFBrowserContentViewController _persona](self, "_persona"));

      objc_storeStrong((id *)&self->_downloadToShowInQuickLook, a3);
      CGRect v19 = [v5 quickLookDocument];
      [v19 setSavedPath:v7 shouldDelete:1];

      double v11 = [(_SFBrowserContentViewController *)self webView];
      id v13 = [v5 sourceURL];
      [(_SFContactPreviewViewController *)v11 _loadAlternateHTMLString:0 baseURL:0 forUnreachableURL:v13];
      goto LABEL_22;
    case 3:
      id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v7 isDirectory:0];
      int v22 = [v5 uti];
      if (v22)
      {
        long long v23 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v22];
        long long v24 = v23;
        if (v23 && ([v23 conformsToType:*MEMORY[0x1E4F44580]] & 1) != 0)
        {
          uint64_t v51 = 0;
          id v52 = &v51;
          uint64_t v53 = 0x2050000000;
          uint64_t v25 = (void *)getPKPassesXPCContainerClass(void)::softClass;
          uint64_t v54 = getPKPassesXPCContainerClass(void)::softClass;
          if (!getPKPassesXPCContainerClass(void)::softClass)
          {
            uint64_t v46 = MEMORY[0x1E4F143A8];
            uint64_t v47 = 3221225472;
            id v48 = ___ZL28getPKPassesXPCContainerClassv_block_invoke;
            id v49 = &unk_1E5C72498;
            id v50 = &v51;
            ___ZL28getPKPassesXPCContainerClassv_block_invoke((uint64_t)&v46);
            uint64_t v25 = (void *)v52[3];
          }
          uint64_t v26 = v25;
          _Block_object_dispose(&v51, 8);
          uint64_t v27 = (void *)[[v26 alloc] initWithFileURL:v21];
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __49___SFBrowserContentViewController__showDownload___block_invoke;
          v43[3] = &unk_1E5C774A8;
          id v44 = v20;
          [v27 unarchivePassesWithBlock:v43];
          id v28 = 0;
          BOOL v29 = v44;
          goto LABEL_35;
        }
      }
      else
      {
        long long v24 = 0;
      }
      uint64_t v27 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v21];
      uint64_t v51 = 0;
      id v52 = &v51;
      uint64_t v53 = 0x2050000000;
      double v39 = (void *)getPKPassClass(void)::softClass;
      uint64_t v54 = getPKPassClass(void)::softClass;
      if (!getPKPassClass(void)::softClass)
      {
        uint64_t v46 = MEMORY[0x1E4F143A8];
        uint64_t v47 = 3221225472;
        id v48 = ___ZL14getPKPassClassv_block_invoke;
        id v49 = &unk_1E5C72498;
        id v50 = &v51;
        ___ZL14getPKPassClassv_block_invoke((uint64_t)&v46);
        double v39 = (void *)v52[3];
      }
      id v40 = v39;
      _Block_object_dispose(&v51, 8);
      id v45 = 0;
      BOOL v29 = (void *)[v40 createWithData:v27 warnings:0 error:&v45];
      id v28 = v45;
      objc_msgSend(v20, "safari_addObjectUnlessNil:", v29);
LABEL_35:

      if (![v20 count] || v28) {
        [(_SFBrowserContentViewController *)self _showGenericDownloadAlert];
      }
      else {
        [(_SFBrowserContentViewController *)self _showPassBookControllerForPasses:v20];
      }

LABEL_24:
      return;
    case 4:
      int v30 = [v5 sourceURL];
      BOOL v31 = [(_SFBrowserContentViewController *)self _showICSControllerForPath:v7 sourceURL:v30];

      if (!v31)
      {
        uint64_t v32 = WBS_LOG_CHANNEL_PREFIXDownloads();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[_SFBrowserContentViewController _showDownload:]();
        }
        double v33 = [MEMORY[0x1E4F28CB8] defaultManager];
        objc_msgSend(v33, "_web_removeFileOnlyAtPath:", v7);

        [(_SFBrowserContentViewController *)self _showGenericDownloadAlert];
      }
      goto LABEL_24;
    case 5:
      uint64_t v34 = [_SFContactPreviewViewController alloc];
      double v35 = [v5 sourceURL];
      double v11 = [(_SFContactPreviewViewController *)v34 initWithFilePath:v7 sourceURL:v35 deleteFileWhenDone:1 beforeDismissHandler:0];

      if (v11)
      {
        [(_SFBrowserContentViewController *)self presentViewController:v11 animated:1 completion:0];
      }
      else
      {
        [v5 removeFromDisk];
        [(_SFBrowserContentViewController *)self _showGenericDownloadAlert];
      }
      goto LABEL_23;
    case 6:
      uint64_t v51 = 0;
      id v52 = &v51;
      uint64_t v53 = 0x2050000000;
      id v36 = (void *)getCLKWatchFaceLibraryClass(void)::softClass;
      uint64_t v54 = getCLKWatchFaceLibraryClass(void)::softClass;
      if (!getCLKWatchFaceLibraryClass(void)::softClass)
      {
        uint64_t v46 = MEMORY[0x1E4F143A8];
        uint64_t v47 = 3221225472;
        id v48 = ___ZL27getCLKWatchFaceLibraryClassv_block_invoke;
        id v49 = &unk_1E5C72498;
        id v50 = &v51;
        ___ZL27getCLKWatchFaceLibraryClassv_block_invoke((uint64_t)&v46);
        id v36 = (void *)v52[3];
      }
      double v37 = v36;
      _Block_object_dispose(&v51, 8);
      double v11 = (_SFContactPreviewViewController *)objc_alloc_init(v37);
      id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __49___SFBrowserContentViewController__showDownload___block_invoke_352;
      v42[3] = &unk_1E5C73238;
      v42[4] = self;
      [(_SFContactPreviewViewController *)v11 _addWatchFaceAtURL:v13 shouldValidate:0 completionHandler:v42];
LABEL_22:

      goto LABEL_23;
    case 7:
      double v11 = (_SFContactPreviewViewController *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v7 isDirectory:0];
      [(_SFBrowserContentViewController *)self _showFinanceKitOrderPreviewControllerWithURL:v11 dismissalHandler:0];
      if (([v5 explicitlySaved] & 1) == 0) {
        [v5 removeFromDisk];
      }
LABEL_23:

      goto LABEL_24;
    default:
      goto LABEL_24;
  }
}

- (void)_showPassBookControllerForPasses:(id)a3
{
  id v5 = a3;
  id v4 = (void *)[objc_alloc((Class)getPKAddPassesViewControllerClass()) initWithPasses:v5 fromPresentationSource:0];
  [v4 setDelegate:self];
  [(_SFBrowserContentViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)_showFinanceKitOrderPreviewControllerWithURL:(id)a3 dismissalHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v16 = 0;
  double v17 = &v16;
  uint64_t v18 = 0x2050000000;
  BOOL v8 = (void *)getFKSaveOrderClass(void)::softClass;
  uint64_t v19 = getFKSaveOrderClass(void)::softClass;
  if (!getFKSaveOrderClass(void)::softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = ___ZL19getFKSaveOrderClassv_block_invoke;
    v15[3] = &unk_1E5C72498;
    v15[4] = &v16;
    ___ZL19getFKSaveOrderClassv_block_invoke((uint64_t)v15);
    BOOL v8 = (void *)v17[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v16, 8);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke;
  v11[3] = &unk_1E5C774F8;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v9 saveOrderAtURL:v6 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (BOOL)_showICSControllerForPath:(id)a3 sourceURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [[_SFICSPreviewViewController alloc] initWithFilePath:v6 sourceURL:v7];
  id v9 = v8;
  if (v8)
  {
    [(_SFICSPreviewViewController *)v8 setModalPresentationStyle:2];
    [(_SFBrowserContentViewController *)self presentViewController:v9 animated:1 completion:0];
  }

  return v9 != 0;
}

- (void)_fetchSharingURLWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(_SFBrowserContentViewController *)self webView];
  id v6 = [v5 URL];
  id v7 = [[_SFSharingLinkExtractor alloc] initWithWebView:v5];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73___SFBrowserContentViewController__fetchSharingURLWithCompletionHandler___block_invoke;
  void v10[3] = &unk_1E5C77520;
  id v8 = v6;
  id v11 = v8;
  id v9 = v4;
  id v12 = v9;
  [(_SFSharingLinkExtractor *)v7 fetchSharingLinkWithCompletionHandler:v10];
}

- (id)_itemProviderCollectionForSharingURL:(id)a3 title:(id)a4
{
  id v5 = a3;
  id v6 = [(_SFBrowserContentViewController *)self webView];
  id v7 = [[_SFActivityItemProviderCollection alloc] initWithWebView:v6];
  -[_SFActivityItemProviderCollection setDisplayingStandaloneImage:](v7, "setDisplayingStandaloneImage:", [v6 _isDisplayingStandaloneImageDocument]);
  -[_SFActivityItemProviderCollection setDisplayingStandaloneMedia:](v7, "setDisplayingStandaloneMedia:", [v6 _isDisplayingStandaloneMediaDocument]);
  id v8 = [_SFLinkWithPreviewActivityItemProvider alloc];
  id v9 = [v6 title];
  id v10 = [(_SFLinkWithPreviewActivityItemProvider *)v8 initWithPlaceholderItem:v5 URL:v5 pageTitle:v9 webView:v6];
  [(_SFActivityItemProviderCollection *)v7 setLinkProvider:v10];

  if (![(_SFBrowserContentViewController *)self isShowingErrorPage])
  {
    id v11 = +[_SFActivityViewController activeWebPageExtensionItemForURL:v5 withPreviewImageHandler:0];
    id v12 = [_SFActivityExtensionItemProvider alloc];
    id v13 = [v6 title];
    id v14 = [(_SFActivityExtensionItemProvider *)v12 initWithExtensionItem:v11 URL:v5 pageTitle:v13 webView:v6];

    [(_SFActivityItemProviderCollection *)v7 setJavaScriptExtensionProvider:v14];
  }
  CGRect v15 = [_SFDownloadActivityItemProvider alloc];
  uint64_t v16 = [(_SFBrowserContentViewController *)self quickLookDocument];
  double v17 = [(_SFDownloadActivityItemProvider *)v15 initWithQuickLookDocument:v16 URL:v5 webView:v6];
  [(_SFActivityItemProviderCollection *)v7 setDownloadProvider:v17];

  uint64_t v18 = [[_SFPrintActivityItemProvider alloc] initWithPrintController:self->_printController webView:v6];
  [(_SFActivityItemProviderCollection *)v7 setPrintProvider:v18];

  uint64_t v19 = [[_SFBrowserDocumentActivityItemProvider alloc] initWithBrowserDocument:self];
  [(_SFActivityItemProviderCollection *)v7 setDocumentProvider:v19];

  return v7;
}

- (void)_presentActivityViewController
{
  p_navigationBar = (id *)&self->_navigationBar;
  if (![(_SFNavigationBar *)self->_navigationBar hasToolbar]) {
    p_navigationBar = (id *)&self->_bottomToolbar;
  }
  id v4 = [*p_navigationBar popoverSourceInfoForBarItem:6];
  id v5 = [(_SFBrowserContentViewController *)self quickLookDocument];
  if (v5
    && (quickLookDocumentController = self->_quickLookDocumentController, v5, quickLookDocumentController))
  {
    [(SFQuickLookDocumentController *)self->_quickLookDocumentController presentDocumentInteractionControllerFromSource:v4];
  }
  else
  {
    id v7 = [(_SFBrowserContentViewController *)self webView];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __65___SFBrowserContentViewController__presentActivityViewController__block_invoke;
    v9[3] = &unk_1E5C77570;
    void v9[4] = self;
    id v10 = v7;
    id v11 = v4;
    id v8 = v7;
    [(_SFBrowserContentViewController *)self _fetchSharingURLWithCompletionHandler:v9];
  }
}

- (void)activityViewController:(id)a3 prepareActivity:(id)a4 completion:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = (void (**)(void))&__block_literal_global_379;
  }
  id v11 = [(_SFBrowserContentViewController *)self webView];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = [v8 activityViewController];
      getSLComposeViewControllerClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v11 title];
        [v12 setInitialText:v18];
      }
    }
    else
    {
      uint64_t v19 = [v8 activityType];
      int v20 = [v19 isEqualToString:*MEMORY[0x1E4F435B0]];

      if (!v20)
      {
        v10[2](v10);
        goto LABEL_16;
      }
      id v12 = [v8 activityViewController];
      if (objc_msgSend(v12, "_sf_isMFMailComposeViewController"))
      {
        id v21 = [(_SFBrowserContentViewController *)self _mailContentProvider];
        [v21 setRestrictAddingPDFContent:1];
        int v22 = [v25 customizationController];
        uint64_t v23 = _SFPreferredMailContentTypeForActivityContentType([v22 selectedContentType]);

        long long v24 = [v25 sharingURL];
        [v21 prepareMailComposeViewController:v12 withMailToURL:0 contentURL:v24 preferredContentType:v23 completionHandler:v10];

        [v21 setRestrictAddingPDFContent:0];
        goto LABEL_15;
      }
    }
    v10[2](v10);
    goto LABEL_15;
  }
  id v12 = v8;
  id v13 = [v12 bookmarkNavigationController];
  id v14 = [v11 title];
  CGRect v15 = [v25 sharingURL];
  uint64_t v16 = objc_msgSend(v15, "safari_userVisibleString");
  id v17 = (id)[v13 addBookmarkWithTitle:v14 address:v16 parentBookmark:0];

  v10[2](v10);
LABEL_15:

LABEL_16:
}

- (void)perSiteSettingsUIPresentSettings
{
  double v3 = [_SFPerSitePreferencesPopoverViewController alloc];
  id v4 = [(_SFBrowserContentViewController *)self perSitePreferencesVendor];
  id v6 = [(_SFPerSitePreferencesPopoverViewController *)v3 initWithBrowserDocument:self perSitePreferencesVendor:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v6];
  [v5 setModalPresentationStyle:2];
  [(_SFBrowserContentViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (BOOL)_suppressReloadToPreventLoadingJavaScriptIfNecessary
{
  double v3 = [(_SFBrowserContentViewController *)self expectedOrCurrentURL];
  id v4 = [v3 absoluteString];
  char v5 = objc_msgSend(v4, "safari_isJavaScriptURLString");

  if (v5) {
    [(_SFPageLoadErrorController *)self->_pageLoadErrorController addDisallowedUseOfJavaScriptAlert];
  }
  return v5;
}

- (void)reload
{
}

- (void)reloadEnablingDowngradedPrivateRelay:(BOOL)a3
{
  if (![(_SFBrowserContentViewController *)self _suppressReloadToPreventLoadingJavaScriptIfNecessary])
  {
    char v5 = [(_SFBrowserView *)self->_browserView currentWebView];
    id v6 = [v5 URL];
    urlToReloadEnablingPrivateReladouble y = self->_urlToReloadEnablingPrivateRelay;
    self->_urlToReloadEnablingPrivateReladouble y = v6;

    self->_disablePrivateRelayWhenReloading = a3;
    self->_isNavigatingViaReloadWithoutPrivateReladouble y = a3;
    [(_SFBrowserContentViewController *)self _reloadFromOrigin:0];
  }
}

- (BOOL)wasLoadedWithContentBlockersEnabled
{
  return self->_wasLoadedWithContentBlockersEnabled;
}

- (void)reloadDisablingContentBlockers:(BOOL)a3
{
  if (![(_SFBrowserContentViewController *)self _suppressReloadToPreventLoadingJavaScriptIfNecessary])
  {
    char v5 = [(_SFBrowserView *)self->_browserView currentWebView];
    id v6 = [v5 URL];
    urlToReloadForcingContentBlockers = self->_urlToReloadForcingContentBlockers;
    self->_urlToReloadForcingContentBlockers = v6;

    self->_disableContentBlockersWhenReloading = a3;
    [(_SFBrowserContentViewController *)self _reloadFromOrigin:0];
  }
}

- (void)reloadDisablingAdvancedPrivateBrowsingPrivacyProtections:(BOOL)a3
{
  if (![(_SFBrowserContentViewController *)self _suppressReloadToPreventLoadingJavaScriptIfNecessary])
  {
    char v5 = [(_SFBrowserContentViewController *)self webView];
    id v6 = [v5 URL];
    urlToReloadForAdvancedPrivateBrowsingPrivacyProtections = self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections;
    self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections = v6;

    self->_disableAdvancedPrivateBrowsingPrivacyProtectionsWhenReloading = a3;
    [(_SFBrowserContentViewController *)self _reloadFromOrigin:0];
  }
}

- (BOOL)browserHasMultipleProfiles
{
  return 0;
}

- (_SFPerSitePreferencesVendor)perSitePreferencesVendor
{
  return self->_perSitePreferencesVendor;
}

- (_SFPageZoomPreferenceManager)pageZoomManager
{
  return [(_SFPerSitePreferencesVendor *)self->_perSitePreferencesVendor pageZoomPreferenceManager];
}

- (BOOL)isPrivateBrowsingEnabled
{
  return 0;
}

- (BOOL)privacyReportShouldSeparateBlockedTrackers
{
  id v2 = self;
  double v3 = [(_SFBrowserContentViewController *)self webView];
  id v4 = [v3 URL];
  LOBYTE(v2) = [(_SFBrowserContentViewController *)v2 supportsAdvancedPrivacyProtectionsForURL:v4];

  return (char)v2;
}

- (BOOL)canHideToolbar
{
  return 0;
}

- (NSURL)URLForPerSitePreferences
{
  double v3 = [(_SFBrowserContentViewController *)self webView];
  id v4 = [v3 _committedURL];

  if (!v4
    || (objc_msgSend(v4, "safari_isHTTPFamilyURL") & 1) == 0
    && [(_SFBrowserContentViewController *)self isShowingErrorPage])
  {
    char v5 = [(_SFBrowserContentViewController *)self webView];
    uint64_t v6 = [v5 URL];

    id v4 = (void *)v6;
  }

  return (NSURL *)v4;
}

- (SFReaderContext)readerContext
{
  id v2 = [(_SFBrowserContentViewController *)self webViewController];
  double v3 = [v2 readerController];

  return (SFReaderContext *)v3;
}

- (BOOL)hasEnteredScribbleMode
{
  return 0;
}

- (SFScribbleController)sfScribbleController
{
  sfScribbleController = self->_sfScribbleController;
  if (!sfScribbleController)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F78348]);
    char v5 = [(_SFBrowserContentViewController *)self webView];
    uint64_t v6 = (SFScribbleController *)[v4 initWithWebView:v5 delegate:self];
    id v7 = self->_sfScribbleController;
    self->_sfScribbleController = v6;

    [(SFScribbleController *)self->_sfScribbleController setUserInitiatedScribblingDisabled:1];
    sfScribbleController = self->_sfScribbleController;
  }

  return sfScribbleController;
}

- (BOOL)isShowingReader
{
  return self->_showingReader;
}

- (void)toggleShowingReaderForUserAction
{
  if (self->_showingReader)
  {
    [(_SFBrowserContentViewController *)self _hideReaderAnimated:1 deactivationMode:1];
  }
  else
  {
    [(_SFBrowserContentViewController *)self _showReaderAnimated:1];
    id v2 = [MEMORY[0x1E4F98948] sharedLogger];
    [v2 didActivateReaderWithTrigger:0];
  }
}

- (BOOL)canReadActiveLanguage
{
  return 0;
}

- (void)presentModalViewController:(id)a3 completion:(id)a4
{
}

- (BOOL)canFindOnPage
{
  if ([(_SFBrowserContentViewController *)self _onlyWantsWebAppShortcuts]) {
    return 0;
  }
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  char v5 = [v4 webView];
  uint64_t v6 = [v5 URL];
  BOOL v3 = v6 != 0;

  return v3;
}

- (BOOL)allowsBrowsingAssistant
{
  return [MEMORY[0x1E4F989E8] userConsentState] == 1;
}

- (WBSBrowsingAssistantController)assistantController
{
  assistantController = self->_assistantController;
  if (!assistantController)
  {
    id v4 = (WBSBrowsingAssistantController *)objc_alloc_init(MEMORY[0x1E4F989E8]);
    char v5 = self->_assistantController;
    self->_assistantController = v4;

    [(WBSBrowsingAssistantController *)self->_assistantController setDelegate:self];
    assistantController = self->_assistantController;
  }

  return assistantController;
}

- (void)willPresentBrowsingAssistantInSheet:(BOOL)a3
{
  if (a3)
  {
    self->_alwaysShowTopBar = 1;
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator setIgnoresDragging:1];
    [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator setMinimumTopBarHeight:2.22507386e-308];
    dynamicBarAnimator = self->_dynamicBarAnimator;
    [(_SFDynamicBarAnimator *)dynamicBarAnimator attemptTransitionToState:0 animated:1];
  }
}

- (void)willDismissBrowsingAssistantInSheet:(BOOL)a3
{
  if (a3
    && ![(_SFPageFormatMenuController *)self->_pageFormatMenuController stepperIsInTransitionView])
  {
    dynamicBarAnimator = self->_dynamicBarAnimator;
    [(_SFDynamicBarAnimator *)dynamicBarAnimator attemptTransitionToState:1 animated:1];
  }
}

- (void)showFindOnPage
{
  id v2 = [(_SFBrowserContentViewController *)self activeWebView];
  [v2 find:0];
}

- (void)handleSearchResult:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F18DA8];
  objc_msgSend(a3, "_sf_punchoutURL");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  char v5 = objc_msgSend(v4, "requestWithURL:");
  [(_SFBrowserContentViewController *)self loadRequest:v5];
}

- (BOOL)canAddToBookmarks
{
  return 0;
}

- (BOOL)canAddToQuickNote
{
  return 0;
}

- (BOOL)canAddToReadingList
{
  return 0;
}

- (BOOL)canMoveToTabGroup
{
  return 0;
}

- (BOOL)canPrintCurrentTab
{
  return 0;
}

- (BOOL)canTogglePinningTab
{
  return 0;
}

- (BOOL)currentTabIsPinned
{
  return 0;
}

- (void)takeOwnershipOfStepperContainer:(id)a3
{
  id v5 = a3;
  if (!self->_stepperContainer)
  {
    id v8 = v5;
    objc_storeStrong((id *)&self->_stepperContainer, a3);
    id v6 = [(_SFBrowserContentViewController *)self view];
    [v8 bounds];
    objc_msgSend(v6, "convertRect:fromView:", v8);
    objc_msgSend(v8, "setFrame:");

    id v7 = [(_SFBrowserContentViewController *)self view];
    [v7 addSubview:v8];

    self->_stepperMovedToRootView = 1;
    id v5 = v8;
  }
}

- (void)setKeepBarsMinimized:(BOOL)a3
{
  if (self->_keepBarsMinimized != a3)
  {
    self->_keepBarsMinimized = a3;
    if (a3)
    {
      [(_SFDynamicBarAnimator *)self->_dynamicBarAnimator setMinimumTopBarHeight:2.22507386e-308];
      dynamicBarAnimator = self->_dynamicBarAnimator;
      [(_SFDynamicBarAnimator *)dynamicBarAnimator attemptTransitionToState:0 animated:1];
    }
  }
}

- (BOOL)keepBarsMinimized
{
  return self->_keepBarsMinimized;
}

- (BOOL)hasUnviewedDownloads
{
  return 0;
}

- (unint64_t)downloadsCount
{
  return 0;
}

- (BOOL)supportsPrivacyReport
{
  return 0;
}

- (BOOL)supportsSiriReadThis
{
  return 0;
}

- (BOOL)hasDedicatedMediaStateButton
{
  return 1;
}

- (BOOL)hasDedicatedDownloadsToolbarItem
{
  return 0;
}

- (SFContentBlockerManager)contentBlockerManager
{
  contentBlockerManager = self->_contentBlockerManager;
  if (!contentBlockerManager)
  {
    id v4 = [SFContentBlockerManager alloc];
    id v5 = [(_SFBrowserContentViewController *)self userContentController];
    id v6 = [(_SFBrowserContentViewController *)self webExtensionsController];
    id v7 = [(SFContentBlockerManager *)v4 initWithUserContentController:v5 webExtensionsController:v6];
    id v8 = self->_contentBlockerManager;
    self->_contentBlockerManager = v7;

    contentBlockerManager = self->_contentBlockerManager;
  }

  return contentBlockerManager;
}

- (SFWebExtensionsController)webExtensionsController
{
  webExtensionsController = self->_webExtensionsController;
  if (!webExtensionsController)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F78530]);
    uint64_t v5 = *MEMORY[0x1E4F99128];
    id v6 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_userContentController");
    id v7 = (SFWebExtensionsController *)[v4 initWithProfileServerID:v5 userContentController:v6];
    id v8 = self->_webExtensionsController;
    self->_webExtensionsController = v7;

    [(SFWebExtensionsController *)self->_webExtensionsController setProfileDelegate:self];
    webExtensionsController = self->_webExtensionsController;
  }

  return webExtensionsController;
}

- (WBSWebExtensionTab)activeTabForExtensions
{
  return 0;
}

- (BOOL)hasDedicatedExtensionsButton
{
  return 0;
}

- (void)collectDiagnosticsForAutoFillWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  [v4 collectDiagnosticsForAutoFillWithCompletionHandler:v5];
}

- (id)sfWebExtensionsControllersForAllProfiles:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_SFBrowserContentViewController *)self webExtensionsController];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)sfWebExtensionsControllersContentBlockerManagersForAllProfiles:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(_SFBrowserContentViewController *)self contentBlockerManager];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)_updateUserActivitySoon
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "Will update NSUserActivity soon", v2, v3, v4, v5, v6);
}

- (void)_updateUserActivityTimerFired
{
  [(_SFBrowserContentViewController *)self _cancelPendingUpdateUserActivityTimer];

  [(_SFBrowserContentViewController *)self _updateUserActivity];
}

- (void)_cancelPendingUpdateUserActivityTimer
{
  updateContinuityTimer = self->_updateContinuityTimer;
  if (updateContinuityTimer)
  {
    [(NSTimer *)updateContinuityTimer invalidate];
    uint64_t v4 = self->_updateContinuityTimer;
    self->_updateContinuityTimer = 0;
  }
}

- (id)handoffURL
{
  uint64_t v2 = [(_SFBrowserContentViewController *)self webView];
  uint64_t v3 = [v2 URL];

  return v3;
}

- (void)_updateUserActivity
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Invalid URL for NSUserActivity; it won't be updated",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_invalidateUserActivity
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A690B000, v0, v1, "Invalidating NSUserActivity", v2, v3, v4, v5, v6);
}

- (void)_setUpMenu
{
  id v3 = [MEMORY[0x1E4F781F8] sharedProvider];
  objc_msgSend(v3, "rebuildMenuIfNeededForPersona:", -[_SFBrowserContentViewController _persona](self, "_persona"));
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFBrowserContentViewController;
  [(_SFBrowserContentViewController *)&v6 validateCommand:v4];
  if ((char *)[v4 action] == sel_saveKeyPressed)
  {
    uint64_t v5 = _WBSLocalizedString();
    [v4 setDiscoverabilityTitle:v5];
  }
}

- (void)reloadKeyPressed
{
  if (![(_SFBrowserContentViewController *)self _suppressReloadToPreventLoadingJavaScriptIfNecessary])
  {
    [(_SFBrowserContentViewController *)self _reloadFromOrigin:0];
    self->_isNavigatingViaNormalReload = 1;
  }
}

- (void)reloadFromOriginKeyPressed
{
  [(_SFBrowserContentViewController *)self _dismissTransientUIAnimated:1];
  if (![(_SFBrowserContentViewController *)self _suppressReloadToPreventLoadingJavaScriptIfNecessary])
  {
    [(_SFBrowserContentViewController *)self _reloadFromOrigin:1];
  }
}

- (void)find:(id)a3
{
  id v3 = [(_SFBrowserContentViewController *)self activeWebView];
  [v3 find:0];

  id v4 = [MEMORY[0x1E4F98948] sharedLogger];
  [v4 didFindOnPageWithTrigger:0];
}

- (void)takeFindStringKeyPressed
{
  self->_shouldFillStringForFind = 1;
  id v2 = [(_SFBrowserContentViewController *)self _currentWebView];
  [v2 _takeFindStringFromSelection:0];
}

- (void)cancelKeyPressed
{
  if (self->_showingReader)
  {
    [(_SFBrowserContentViewController *)self _hideReaderAnimated:1 deactivationMode:1];
  }
  else if (![(_SFBrowserContentViewController *)self _dismissTransientUIAnimated:1])
  {
    id v3 = [(_SFBrowserContentViewController *)self webView];
    [v3 stopLoading];
  }
}

- (BOOL)_dismissTransientUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(_SFBrowserContentViewController *)self _hideFindOnPage];
  objc_super v6 = [(_SFBrowserContentViewController *)self webViewController];
  id v7 = [v6 dialogController];

  id v8 = [v7 presentedDialog];
  id v9 = v8;
  if (v8 && [v8 presentationStyle] == 1)
  {
    [v7 cancelPresentedDialogIfNeeded];
    BOOL v5 = 1;
  }
  id v10 = [(_SFBrowserContentViewController *)self presentedViewController];
  id v11 = v10;
  if (v10 && ([v10 isBeingDismissed] & 1) == 0)
  {
    [v11 dismissViewControllerAnimated:v3 completion:0];
    goto LABEL_9;
  }
  if (v5)
  {
LABEL_9:
    BOOL v12 = 1;
    goto LABEL_10;
  }
  BOOL v12 = [(_SFPrintController *)self->_printController isDisplayingPrintUI];
LABEL_10:
  [(_SFPrintController *)self->_printController dismissPrintInteractionControllerAnimated:1];

  return v12;
}

- (void)autoFillFormKeyPressed
{
  id v2 = [(_SFBrowserContentViewController *)self webViewController];
  [v2 performPageLevelAutoFill];
}

- (void)emailCurrentPage
{
}

- (void)_emailCurrentPageWithPreferredContentType:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77___SFBrowserContentViewController__emailCurrentPageWithPreferredContentType___block_invoke;
  v3[3] = &unk_1E5C775C0;
  v3[4] = self;
  void v3[5] = a3;
  [(_SFBrowserContentViewController *)self _fetchSharingURLWithCompletionHandler:v3];
}

- (id)_mailContentProvider
{
  cachedMailContentProvider = self->_cachedMailContentProvider;
  if (!cachedMailContentProvider)
  {
    id v4 = objc_alloc_init(_SFMailContentProvider);
    BOOL v5 = self->_cachedMailContentProvider;
    self->_cachedMailContentProvider = v4;

    [(_SFMailContentProvider *)self->_cachedMailContentProvider setDataSource:self];
    cachedMailContentProvider = self->_cachedMailContentProvider;
  }

  return cachedMailContentProvider;
}

- (id)readerControllerForMailContentProvider:(id)a3
{
  BOOL v3 = [(_SFBrowserContentViewController *)self webViewController];
  id v4 = [v3 readerController];

  return v4;
}

- (BOOL)readerViewIsVisibleForMailContentProvider:(id)a3
{
  return self->_showingReader;
}

- (id)webViewForMailContentProvider:(id)a3
{
  id v4 = [(_SFBrowserContentViewController *)self webViewController];
  BOOL v5 = v4;
  if (self->_showingReader)
  {
    objc_super v6 = [v4 readerController];
    id v7 = [v6 readerWebView];
  }
  else
  {
    id v7 = [v4 webView];
  }

  return v7;
}

- (id)printControllerForContentProvider:(id)a3
{
  return self->_printController;
}

- (id)_committedDomainForPreferences
{
  id v2 = [(_SFBrowserContentViewController *)self webView];
  BOOL v3 = [v2 _committedURL];
  id v4 = objc_msgSend(v3, "safari_userVisibleHostWithoutWWWSubdomain");

  return v4;
}

- (BOOL)_shouldAllowAutomaticReader
{
  unint64_t v2 = [(_SFBrowserContentViewController *)self _persona];
  return (v2 > 4) | (3u >> v2) & 1;
}

- (void)_perSiteAutomaticReaderActivationPreferenceDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __88___SFBrowserContentViewController__perSiteAutomaticReaderActivationPreferenceDidChange___block_invoke;
  v6[3] = &unk_1E5C72628;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_perSitePageZoomPreferenceDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __71___SFBrowserContentViewController__perSitePageZoomPreferenceDidChange___block_invoke;
  v6[3] = &unk_1E5C72628;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)_perSiteLockdownModePreferenceDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __75___SFBrowserContentViewController__perSiteLockdownModePreferenceDidChange___block_invoke;
  v6[3] = &unk_1E5C72628;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (id)_digitalHealthManager
{
  cachedDigitalHealthManager = self->_cachedDigitalHealthManager;
  if (!cachedDigitalHealthManager)
  {
    id v4 = (WBSDigitalHealthManager *)objc_alloc_init(MEMORY[0x1E4F98AB8]);
    id v5 = self->_cachedDigitalHealthManager;
    self->_cachedDigitalHealthManager = v4;

    [(WBSDigitalHealthManager *)self->_cachedDigitalHealthManager setDelegate:self];
    [(WBSDigitalHealthManager *)self->_cachedDigitalHealthManager startObserving];
    cachedDigitalHealthManager = self->_cachedDigitalHealthManager;
  }

  return cachedDigitalHealthManager;
}

- (void)_updateDigitalHealthTracking
{
  if ([(_SFBrowserContentViewController *)self _personaShouldUseScreenTime])
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke;
    v3[3] = &unk_1E5C731C0;
    objc_copyWeak(&v4, &location);
    dispatch_async(MEMORY[0x1E4F14428], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

- (void)_showDigitalHealthOverlayWithPolicy:(int64_t)a3
{
  if ([(_SFBrowserContentViewController *)self _personaShouldUseScreenTime])
  {
    if (self->_showingReader) {
      [(_SFBrowserContentViewController *)self _hideReaderAnimated:0 deactivationMode:1];
    }
    if (![(_SFBrowserContentViewController *)self isBlockedByScreenTime])
    {
      id v12 = [(_SFBrowserContentViewController *)self webViewController];
      id v5 = [v12 webView];
      objc_super v6 = [v5 URL];

      if (v6)
      {
        id v7 = (SFScreenTimeOverlayViewController *)objc_alloc_init(MEMORY[0x1E4F78340]);
        screenTimeOverlayViewController = self->_screenTimeOverlayViewController;
        self->_screenTimeOverlayViewController = v7;

        id v9 = (id)[(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController showBlockingViewControllerForURL:v6 withPolicy:a3 animated:1];
        [v12 addChildViewController:self->_screenTimeOverlayViewController];
        [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController didMoveToParentViewController:v12];
        id v10 = [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController view];
        id v11 = [v12 view];
        [v11 bounds];
        objc_msgSend(v10, "setFrame:");
        [v11 addSubview:v10];
      }
    }
  }
}

- (void)_hideDigitalHealthOverlay
{
  if ([(_SFBrowserContentViewController *)self _personaShouldUseScreenTime]
    && [(_SFBrowserContentViewController *)self isBlockedByScreenTime])
  {
    [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController willMoveToParentViewController:0];
    [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController removeFromParentViewController];
    BOOL v3 = [(SFScreenTimeOverlayViewController *)self->_screenTimeOverlayViewController view];
    [v3 removeFromSuperview];

    screenTimeOverlayViewController = self->_screenTimeOverlayViewController;
    self->_screenTimeOverlayViewController = 0;
  }
}

- (BOOL)isBlockedByScreenTime
{
  return self->_screenTimeOverlayViewController != 0;
}

- (void)beginDigitalHealthTracking
{
  if ([(_SFBrowserContentViewController *)self _personaShouldUseScreenTime])
  {
    id v5 = [(_SFBrowserContentViewController *)self _digitalHealthManager];
    currentUsageTrackingURL = self->_currentUsageTrackingURL;
    id v4 = [(_SFBrowserContentViewController *)self _hostAppBundleId];
    [v5 updateUsageTrackingForURL:currentUsageTrackingURL withBundleIdentifier:v4 profileIdentifier:*MEMORY[0x1E4F99128] toState:2];

    [v5 startObserving];
  }
}

- (void)stopDigitalHealthTrackingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E5C77610;
  id v5 = v4;
  id v15 = v5;
  objc_super v6 = (void (**)(void))MEMORY[0x1AD0C36A0](v14);
  if ([(_SFBrowserContentViewController *)self _personaShouldUseScreenTime])
  {
    id v7 = [(_SFBrowserContentViewController *)self _digitalHealthManager];
    currentUsageTrackingURL = self->_currentUsageTrackingURL;
    uint64_t v9 = *MEMORY[0x1E4F99128];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E5C76F80;
    id v12 = v7;
    id v13 = v5;
    id v10 = v7;
    [v10 stopUsageTrackingForURL:currentUsageTrackingURL profileIdentifier:v9 withCompletionHandler:v11];
  }
  else
  {
    v6[2](v6);
  }
}

- (BOOL)_personaShouldUseScreenTime
{
  return (([(_SFBrowserContentViewController *)self _persona] - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (BOOL)isPlayingAudio
{
  unint64_t v2 = [(_SFBrowserContentViewController *)self webView];
  char v3 = [v2 _isPlayingAudio];

  return v3;
}

- (BOOL)isShowingSystemStartPage
{
  return 0;
}

- (void)barManager:(id)a3 didReceiveTapForBarItem:(int64_t)a4
{
  id v7 = a3;
  switch(a4)
  {
    case 0:
      [(_SFBrowserContentViewController *)self _goBack];
      objc_super v6 = [MEMORY[0x1E4F98948] sharedLogger];
      [v6 reportSVCToolbarButtonUsage:0];
      goto LABEL_7;
    case 1:
      [(_SFBrowserContentViewController *)self _goForward];
      objc_super v6 = [MEMORY[0x1E4F98948] sharedLogger];
      [v6 reportSVCToolbarButtonUsage:1];
      goto LABEL_7;
    case 6:
      [(_SFBrowserContentViewController *)self _presentActivityViewController];
      objc_super v6 = [MEMORY[0x1E4F98948] sharedLogger];
      [v6 reportSVCToolbarButtonUsage:3];
      goto LABEL_7;
    case 9:
      [(_SFBrowserContentViewController *)self _openCurrentURLInSafari];
      objc_super v6 = [MEMORY[0x1E4F98948] sharedLogger];
      [v6 reportSVCToolbarButtonUsage:36];
      goto LABEL_7;
    case 10:
      [(_SFBrowserContentViewController *)self _invokeCustomActivity];
      objc_super v6 = [MEMORY[0x1E4F98948] sharedLogger];
      [v6 reportSVCToolbarButtonUsage:37];
LABEL_7:

      break;
    default:
      break;
  }
}

- (unint64_t)mediaStateIcon
{
  return self->_cachedMediaStateIcon;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_cachedMediaStateIcon != a3)
  {
    self->_cachedMediaStateIcon = a3;
    -[SFNavigationBarItem setMediaStateIcon:](self->_navigationBarItem, "setMediaStateIcon:");
  }
}

- (void)webViewController:(id)a3 mediaCaptureStateDidChange:(unint64_t)a4
{
  id v9 = a3;
  uint64_t v6 = 1;
  uint64_t v7 = 4;
  if ((a4 & 8) == 0) {
    uint64_t v7 = ((uint64_t)(a4 << 61) >> 63) & 3;
  }
  if ((a4 & 1) == 0) {
    uint64_t v6 = v7;
  }
  if ((a4 & 2) != 0) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = v6;
  }
  [(_SFBrowserContentViewController *)self setMediaStateIcon:v8];
}

- (BOOL)_canSaveWebpage
{
  unint64_t v2 = self;
  char v3 = [(_SFBrowserContentViewController *)self webView];
  id v4 = [v3 URL];
  LOBYTE(v2) = [(_SFBrowserContentViewController *)v2 _canSaveWebpageForURL:v4];

  return (char)v2;
}

- (BOOL)_canSaveWebpageForURL:(id)a3
{
  id v4 = a3;
  if (v4 && !self->_saveToFilesOperation) {
    BOOL v5 = ![(_SFBrowserContentViewController *)self isBlockedByScreenTime];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_presentSaveWebpageViewController
{
  if ([(_SFBrowserContentViewController *)self _canSaveWebpage])
  {
    char v3 = [(_SFBrowserContentViewController *)self webView];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __68___SFBrowserContentViewController__presentSaveWebpageViewController__block_invoke;
    v5[3] = &unk_1E5C77638;
    v5[4] = self;
    id v6 = v3;
    id v4 = v3;
    [(_SFBrowserContentViewController *)self _fetchSharingURLWithCompletionHandler:v5];
  }
}

- (void)saveToFilesOperation:(id)a3 presentViewController:(id)a4
{
}

- (void)saveToFilesOperation:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  saveToFilesOperation = self->_saveToFilesOperation;
  self->_saveToFilesOperation = 0;
}

- (void)customizationControllerCustomizationsDidChange:(id)a3
{
}

- (id)webViewForCustomizationController:(id)a3
{
  char v3 = [(_SFBrowserContentViewController *)self webView];

  return v3;
}

- (BOOL)isDisplayingQuickLookDocumentForCustomizationController:(id)a3
{
  char v3 = [(_SFBrowserContentViewController *)self quickLookDocument];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)isReaderAvailableForCustomizationController:(id)a3
{
  char v3 = [(_SFBrowserContentViewController *)self webViewController];
  BOOL v4 = [v3 readerController];
  char v5 = [v4 isReaderAvailable];

  return v5;
}

- (BOOL)isShowingReaderForCustomizationController:(id)a3
{
  return self->_showingReader;
}

- (void)translationContextReloadPageInOriginalLanguage:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82___SFBrowserContentViewController_translationContextReloadPageInOriginalLanguage___block_invoke;
  block[3] = &unk_1E5C73108;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (BOOL)translationContextIsUsingPrivateBrowsing:(id)a3
{
  return 0;
}

- (void)translationContext:(id)a3 urlForCurrentPageWithCompletionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93___SFBrowserContentViewController_translationContext_urlForCurrentPageWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C73040;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (void)translationContext:(id)a3 showFirstTimeConsentAlertWithCompletionHandler:(id)a4
{
}

- (void)translationContext:(id)a3 showFeedbackConsentAlertWithCompletionHandler:(id)a4
{
}

- (id)safariApplicationVersionForTranslationContext:(id)a3
{
  char v3 = objc_msgSend(MEMORY[0x1E4F28B50], "_sf_safariServicesBundle", a3);
  BOOL v4 = objc_msgSend(v3, "safari_normalizedVersion");

  return v4;
}

- (void)translationContext:(id)a3 showTranslationErrorAlertWithTitle:(id)a4 message:(id)a5
{
  id v6 = a5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97___SFBrowserContentViewController_translationContext_showTranslationErrorAlertWithTitle_message___block_invoke;
  v8[3] = &unk_1E5C72628;
  id v9 = v6;
  id v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

- (void)translationContext:(id)a3 shouldReportProgressInUnifiedField:(BOOL)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89___SFBrowserContentViewController_translationContext_shouldReportProgressInUnifiedField___block_invoke;
  v4[3] = &unk_1E5C77660;
  v4[4] = self;
  BOOL v5 = a4;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

- (void)translationContextNeedsScrollHeightVisibilityUpdate:(id)a3
{
}

- (void)translationContextWillRequestTranslatingWebpage:(id)a3
{
  BOOL v4 = [(_SFBrowserContentViewController *)self processPool];
  SafariShared::ReaderAvailabilityController::updateReaderOrTranslationLastActivated(v4, v3);
}

- (void)_updateMaxVisibleHeightPercentageUserDriven:(BOOL)a3
{
  BOOL v3 = a3;
  id v14 = [(_SFBrowserContentViewController *)self webView];
  BOOL v5 = [v14 scrollView];
  [v5 contentSize];
  double v7 = v6;
  if ([(_SFToolbar *)self->_bottomToolbar placement] == 1)
  {
    id v8 = [(_SFToolbar *)self->_bottomToolbar superview];
    [(_SFToolbar *)self->_bottomToolbar origin];
    objc_msgSend(v8, "convertPoint:toView:", v5);
    double v10 = v9;
  }
  else
  {
    [v5 contentOffset];
    double v12 = v11;
    [v14 frame];
    double v10 = v12 + v13;
  }
  [(WBSTranslationContext *)self->_translationContext updateMaxVisibleHeightPercentageIfNeeded:v3 userDriven:v10 / v7];
}

- (void)_translationContextStateDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69___SFBrowserContentViewController__translationContextStateDidChange___block_invoke;
  block[3] = &unk_1E5C73108;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_presentTranslationConsentAlertWithType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93___SFBrowserContentViewController__presentTranslationConsentAlertWithType_completionHandler___block_invoke;
  block[3] = &unk_1E5C776B0;
  id v9 = v6;
  unint64_t v10 = a3;
  block[4] = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)addPassesViewControllerDidFinish:(id)a3
{
  id v6 = a3;
  BOOL v4 = [(_SFBrowserContentViewController *)self _currentWebView];
  BOOL v5 = [v4 _committedURL];

  if (v5) {
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
  else {
    [(_SFBrowserContentViewController *)self _dismiss];
  }
}

- (id)legacyTLSHostManager
{
  cachedLegacyTLSHostManager = self->_cachedLegacyTLSHostManager;
  if (!cachedLegacyTLSHostManager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98940]);
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v6 = (WBSAllowedLegacyTLSHostManager *)[v4 initWithBrowserDefaults:v5];
    id v7 = self->_cachedLegacyTLSHostManager;
    self->_cachedLegacyTLSHostManager = v6;

    cachedLegacyTLSHostManager = self->_cachedLegacyTLSHostManager;
  }

  return cachedLegacyTLSHostManager;
}

- (void)pageLoadErrorController:(id)a3 allowLegacyTLSConnectionForURL:(id)a4 navigateToURL:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(_SFBrowserContentViewController *)self legacyTLSHostManager];
  id v9 = [v11 host];
  [v8 allowLegacyTLSForHost:v9];

  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F18DA8], "safari_nonAppInitiatedRequestWithURL:", v7);
  [(_SFBrowserContentViewController *)self loadRequest:v10];
}

- (BOOL)isPrivate
{
  return [(_SFBrowserContentViewController *)self safariDataSharingMode] == 4;
}

- (void)overlayDidHide:(id)a3
{
  id v11 = a3;
  id v4 = [(_SFBrowserView *)self->_browserView pinnableBanner];
  [(_SFBrowserContentViewController *)self _setShowingPinnableBanner:v4 animated:1];

  if (([v11 isAvailable] & 1) == 0)
  {
    BOOL v5 = [(_SFBrowserView *)self->_browserView currentWebView];
    id v6 = [v5 scrollView];

    id v7 = [(_SFBrowserView *)self->_browserView pinnableBanner];
    [v7 frame];
    double MaxY = CGRectGetMaxY(v13);

    navigationBar = self->_navigationBar;
    [(_SFNavigationBar *)navigationBar bounds];
    -[_SFNavigationBar convertPoint:toView:](navigationBar, "convertPoint:toView:", v6, 0.0, CGRectGetMaxY(v14));
    if (MaxY > v10)
    {
      [v6 contentOffset];
      objc_msgSend(v6, "setContentOffset:");
    }
  }
}

- (BOOL)supportsAdvancedPrivacyProtectionsForURL:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend(v4, "safari_isSafariWebExtensionURL") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults"),
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_msgSend(v5, "safari_enableAdvancedPrivacyProtections:", 0),
        v5,
        (v6 & 1) == 0))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    unint64_t v7 = [(_SFBrowserContentViewController *)self _persona];
    if (v7 <= 3) {
      unsigned int v8 = (3u >> (v7 & 0xF)) & 1;
    }
    else {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (void)browsingAssistantControllerDidReset:(id)a3
{
}

- (void)browsingAssistantController:(id)a3 didUpdateContentOptionsForURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(_SFBrowserContentViewController *)self webView];
  id v9 = [v8 _committedURL];

  if (WBSIsEqual())
  {
    double v10 = [v6 result];
    uint64_t v11 = [v10 contentOptions];

    double v12 = [v6 result];
    int v13 = [v12 tableOfContentsAvailable];

    CGRect v14 = [(_SFBrowserContentViewController *)self webViewController];
    id v15 = [v14 readerController];

    if (self->_showingReader
      && ((v11 | v13) & 1) != 0
      && [(_SFBrowserContentViewController *)self allowsBrowsingAssistant])
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __93___SFBrowserContentViewController_browsingAssistantController_didUpdateContentOptionsForURL___block_invoke;
      _OWORD v16[3] = &unk_1E5C776D8;
      id v17 = v15;
      uint64_t v18 = self;
      id v19 = v9;
      [v6 fetchAssistantContentFromPegasusForURL:v19 withCompletionHandler:v16];
    }
    [(SFNavigationBarItem *)self->_navigationBarItem updateContentOptions:v11];
  }
}

- (void)browsingAssistantControllerDidUpdateUserConsentState:(id)a3
{
  id v6 = a3;
  if ([(_SFBrowserContentViewController *)self allowsBrowsingAssistant])
  {
    id v4 = [(_SFBrowserContentViewController *)self expectedOrCurrentURL];
    BOOL v5 = [(WBSTranslationContext *)self->_translationContext webpageLocale];
    [v6 checkForAssistantContentFromPegasusForURL:v4 locale:v5];
  }
}

- (id)currentHostForScribbleController:(id)a3
{
  BOOL v3 = [(_SFBrowserContentViewController *)self expectedOrCurrentURL];
  id v4 = [v3 host];

  return v4;
}

- (void)sfScribbleControllerDidEndScribbling:(id)a3
{
  [(SFNavigationBarItem *)self->_navigationBarItem setOverlayConfiguration:0];

  [(_SFBrowserContentViewController *)self _updateUI];
}

- (void)sfScribbleControllerDidStartScribbling:(id)a3
{
  id v5 = a3;
  [(_SFPageFormatMenuController *)self->_pageFormatMenuController dismissMenu];
  id v4 = [v5 urlFieldOverlayConfiguration];
  [(SFNavigationBarItem *)self->_navigationBarItem setOverlayConfiguration:v4];

  [(_SFBrowserContentViewController *)self _updateUI];
}

- (void)sfScribbleControllerDidUpdateHiddenElementCount:(id)a3
{
  id v5 = a3;
  -[SFNavigationBarItem setHasHiddenElements:](self->_navigationBarItem, "setHasHiddenElements:", [v5 hiddenElementCount] != 0);
  if ([v5 isScribbling])
  {
    id v4 = [v5 urlFieldOverlayConfiguration];
    [(SFNavigationBarItem *)self->_navigationBarItem setOverlayConfiguration:v4];
  }
  [(_SFPageFormatMenuController *)self->_pageFormatMenuController reloadBrowsingAssistantIfNeeded];
}

- (void)sfScribbleController:(id)a3 presentAlert:(id)a4
{
}

- (id)overlayContainerViewForScribbleController:(id)a3
{
  BOOL v3 = [(_SFBrowserView *)self->_browserView contentContainerView];

  return v3;
}

- (BOOL)isPrivateBrowsing
{
  return 0;
}

- (NSArray)normalBrowsingUserContentControllers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_userContentController");
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (WBSUserDefinedContentBlockerManager)normalBrowsingUserDefinedContentBlockerManager
{
  unint64_t v2 = (void *)-[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager;
  if (!-[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F98F88]);
    id v4 = [MEMORY[0x1E4F98F90] sharedStore];
    uint64_t v5 = [v3 initWithDataStore:v4];
    id v6 = (void *)-[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager;
    -[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager = v5;

    unint64_t v2 = (void *)-[_SFBrowserContentViewController normalBrowsingUserDefinedContentBlockerManager]::manager;
  }

  return (WBSUserDefinedContentBlockerManager *)v2;
}

- (WBSPrivateBrowsingUserDefinedContentBlockerManager)privateBrowsingUserDefinedContentBlockerManager
{
  id v3 = (void *)-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager;
  if (!-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F98D18]);
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F98F90]) initWithDatabaseURL:0];
    uint64_t v6 = [v4 initWithDataStore:v5];
    id v7 = (void *)-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager;
    -[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager = v6;

    unsigned int v8 = [(_SFBrowserContentViewController *)self normalBrowsingUserDefinedContentBlockerManager];
    [(id)-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager setNormalBrowsingUserDefinedContentBlockerManager:v8];

    id v3 = (void *)-[_SFBrowserContentViewController privateBrowsingUserDefinedContentBlockerManager]::manager;
  }

  return (WBSPrivateBrowsingUserDefinedContentBlockerManager *)v3;
}

- (WBSScribbleQuirksManager)scribbleQuirksManager
{
  unint64_t v2 = (void *)-[_SFBrowserContentViewController scribbleQuirksManager]::manager;
  if (!-[_SFBrowserContentViewController scribbleQuirksManager]::manager)
  {
    uint64_t v3 = objc_opt_new();
    id v4 = (void *)-[_SFBrowserContentViewController scribbleQuirksManager]::manager;
    -[_SFBrowserContentViewController scribbleQuirksManager]::manager = v3;

    unint64_t v2 = (void *)-[_SFBrowserContentViewController scribbleQuirksManager]::manager;
  }

  return (WBSScribbleQuirksManager *)v2;
}

- (BOOL)wasLoadedWithPrivateRelay
{
  return self->_wasLoadedWithPrivateRelay;
}

- (BOOL)isNavigatingViaReloadWithoutPrivateRelay
{
  return self->_isNavigatingViaReloadWithoutPrivateRelay;
}

- (void)setIsNavigatingViaReloadWithoutPrivateRelay:(BOOL)a3
{
  self->_isNavigatingViaReloadWithoutPrivateReladouble y = a3;
}

- (BOOL)wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections
{
  return self->_wasLoadedWithAdvancedPrivateBrowsingPrivacyProtections;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)siriReaderPlaybackStateForActiveTab
{
  return self->siriReaderPlaybackStateForActiveTab;
}

- (BOOL)shouldShowListeningControls
{
  return self->shouldShowListeningControls;
}

- (void)setShouldShowListeningControls:(BOOL)a3
{
  self->shouldShowListeningControls = a3;
}

- (_SFBrowserContentViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFBrowserContentViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (void)setReloadOptionsController:(id)a3
{
}

- (BOOL)storeBannersAreDisabled
{
  return self->_storeBannersAreDisabled;
}

- (void)setStoreBannersAreDisabled:(BOOL)a3
{
  self->_storeBannersAreDisabled = a3;
}

- (WKPreferences)wkPreferences
{
  return self->_wkPreferences;
}

- (NSArray)linkActions
{
  return self->_linkActions;
}

- (void)setLinkActions:(id)a3
{
}

- (_WKActivatedElementInfo)activatedElementInfo
{
  return self->_activatedElementInfo;
}

- (void)setActivatedElementInfo:(id)a3
{
}

- (BOOL)remoteSwipeGestureEnabled
{
  return self->_remoteSwipeGestureEnabled;
}

- (UIColor)preferredBarTintColor
{
  return self->_preferredBarTintColor;
}

- (UIColor)preferredControlTintColor
{
  return self->_preferredControlTintColor;
}

- (int64_t)hostAppModalPresentationStyle
{
  return self->_hostAppModalPresentationStyle;
}

- (int64_t)dismissButtonStyle
{
  return self->_dismissButtonStyle;
}

- (SFSafariViewControllerConfiguration)configuration
{
  return self->_configuration;
}

- (BOOL)webViewLayoutUnderlapsStatusBar
{
  return self->_webViewLayoutUnderlapsStatusBar;
}

- (void)setWebViewLayoutUnderlapsStatusBar:(BOOL)a3
{
  self->_webViewLayoutUnderlapsStatusBar = a3;
}

- (NSString)bundleIdentifierForProfileInstallation
{
  return self->_bundleIdentifierForProfileInstallation;
}

- (BOOL)_isUsedForAuthentication
{
  return self->__isUsedForAuthentication;
}

- (int64_t)_persona
{
  return self->__persona;
}

- (int64_t)safariDataSharingMode
{
  return self->_safariDataSharingMode;
}

- (BOOL)didNotifyInitialLoadFinish
{
  return self->_didNotifyInitialLoadFinish;
}

- (BOOL)viewDidAppearInHostApp
{
  return self->_viewDidAppearInHostApp;
}

- (void)setViewDidAppearInHostApp:(BOOL)a3
{
  self->_viewDidAppearInHostApp = a3;
}

- (_SFNavigationUtilitiesManager)_navigationUtilitiesManager
{
  return self->__navigationUtilitiesManager;
}

- (void)set_navigationUtilitiesManager:(id)a3
{
}

- (SFNavigationBarItem)navigationBarItem
{
  return self->_navigationBarItem;
}

- (void)setTranslationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translationContext, 0);
  objc_storeStrong((id *)&self->__navigationUtilitiesManager, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForProfileInstallation, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_preferredControlTintColor, 0);
  objc_storeStrong((id *)&self->_preferredBarTintColor, 0);
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);
  objc_storeStrong((id *)&self->_linkActions, 0);
  objc_storeStrong((id *)&self->_wkPreferences, 0);
  objc_storeStrong((id *)&self->_reloadOptionsController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_touchUpGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_touchDownGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_stepperContainer, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_storeStrong((id *)&self->_urlForPendingNavigationToFallbackURLForWellKnownChangePasswordURL, 0);
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
  objc_storeStrong((id *)&self->_contentBlockerManager, 0);
  objc_storeStrong((id *)&self->_urlToReloadForAdvancedPrivateBrowsingPrivacyProtections, 0);
  objc_storeStrong((id *)&self->_defaultWebpagePreferences, 0);
  objc_storeStrong((id *)&self->_wellKnownURLResponseCodeReliabilityChecker, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_cachedLegacyTLSHostManager, 0);
  objc_storeStrong((id *)&self->_backForwardListItemForCurrentAppLinkBannerCheck, 0);
  objc_storeStrong(&self->_pendingNavigationActionDueToExternalSchemePromptHandler, 0);
  objc_storeStrong((id *)&self->_lastLoadErrorForFormatMenu, 0);
  objc_storeStrong((id *)&self->_hideNavigationBarGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pageFormatMenuController, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_saveToFilesOperation, 0);
  objc_storeStrong((id *)&self->_customButtonUIActivity, 0);
  objc_storeStrong((id *)&self->_suggestedFilenameForNextCommit, 0);
  objc_storeStrong((id *)&self->_downloadToShowInQuickLook, 0);
  objc_storeStrong((id *)&self->_quickLookDocumentWriter, 0);
  objc_storeStrong((id *)&self->_quickLookDocumentController, 0);
  objc_storeStrong((id *)&self->_quickLookDocument, 0);
  objc_storeStrong((id *)&self->_sfScribbleController, 0);
  objc_storeStrong((id *)&self->_originalRequestURL, 0);
  objc_storeStrong((id *)&self->_webViewControllers, 0);
  objc_storeStrong((id *)&self->_highLevelDomainForHTTPSOnlyBypass, 0);
  objc_storeStrong((id *)&self->_urlToReloadEnablingPrivateRelay, 0);
  objc_storeStrong((id *)&self->_urlToReloadForcingContentBlockers, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesVendor, 0);
  objc_storeStrong((id *)&self->_secIdentityPreferencesController, 0);
  objc_storeStrong((id *)&self->_printController, 0);
  objc_storeStrong((id *)&self->_telephonyNavigationPolicy, 0);
  objc_storeStrong((id *)&self->_sharingExtensionController, 0);
  objc_storeStrong((id *)&self->_EVOrganizationName, 0);
  objc_storeStrong((id *)&self->_pinnableBannerPendingFirstPaint, 0);
  objc_storeStrong((id *)&self->_activeDownload, 0);
  objc_storeStrong((id *)&self->_calendarEventDetector, 0);
  objc_storeStrong((id *)&self->_pageLoadErrorController, 0);
  objc_storeStrong((id *)&self->_showBarsFromBottomBarRecognizer, 0);
  objc_storeStrong((id *)&self->_fluidProgressController, 0);
  objc_storeStrong((id *)&self->_fluidProgressState, 0);
  objc_storeStrong((id *)&self->_URLSpoofingMitigator, 0);
  objc_storeStrong((id *)&self->_navigationBarItem, 0);
  objc_storeStrong((id *)&self->_dynamicBarAnimator, 0);
  objc_storeStrong((id *)&self->_updateContinuityTimer, 0);
  objc_storeStrong((id *)&self->_nanoDomainContainerView, 0);
  objc_storeStrong((id *)&self->_barManager, 0);
  objc_storeStrong((id *)&self->_lastUserInitiatedAction, 0);
  objc_storeStrong((id *)&self->_cachedMailContentProvider, 0);
  objc_storeStrong((id *)&self->_bottomToolbar, 0);
  objc_storeStrong((id *)&self->_navigationBar, 0);
  objc_storeStrong((id *)&self->_lastBackFowardListItemOnWhichReaderWasActivated, 0);
  objc_storeStrong((id *)&self->_readerViewController, 0);
  objc_storeStrong((id *)&self->_browserView, 0);
  objc_storeStrong((id *)&self->_previewCloseTimer, 0);
  objc_storeStrong((id *)&self->_previewWebView, 0);
  objc_storeStrong((id *)&self->_currentUsageTrackingURL, 0);
  objc_storeStrong((id *)&self->_screenTimeOverlayViewController, 0);

  objc_storeStrong((id *)&self->_cachedDigitalHealthManager, 0);
}

- (void)setConfiguration:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Can't run extension '%{public}@' because it isn't part of the app '%{public}@'", (uint8_t *)&v3, 0x16u);
}

- (void)setConfiguration:(uint8_t *)buf .cold.2(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Couldn't find extension '%{public}@': %{public}@; the button won't be shown",
    buf,
    0x16u);
}

- (void)setConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Some fields of the toolbar button are not valid; the button won't be shown",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)webViewController:(uint64_t *)a1 decidePolicyForNavigationAction:(NSObject *)a2 decisionHandler:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1A690B000, a2, OS_LOG_TYPE_ERROR, "Killing web process as a mitigation after it has rapidly attempted %zd navigations concurrently", (uint8_t *)&v3, 0xCu);
}

- (void)webViewControllerShouldAutofillESimInformation:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Could not fetch bundle record for connected process: %{public}@.", v5);
}

- (void)webViewControllerShouldAutofillESimInformation:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Failed to check if domain is allowed with error %@", v5);
}

- (void)webViewControllerShouldAutofillESimInformation:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "CoreTelephonyClient does not respond to selector isAutofilleSIMIdAllowedForDomain:clientBundleIdentifier:error:", v2, v3, v4, v5, v6);
}

- (void)_showDownload:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Failed to download calendar file", v2, v3, v4, v5, v6);
}

- (void)_showDownload:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1(&dword_1A690B000, v0, v1, "Failed to download Profile; data is nil on disk", v2, v3, v4, v5, v6);
}

@end