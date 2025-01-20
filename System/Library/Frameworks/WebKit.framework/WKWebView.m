@interface WKWebView
+ (BOOL)_handlesSafeBrowsing;
+ (BOOL)_willUpgradeToHTTPS:(id)a3;
+ (BOOL)accessInstanceVariablesDirectly;
+ (BOOL)automaticallyNotifiesObserversOfUnderPageBackgroundColor;
+ (BOOL)handlesURLScheme:(NSString *)urlScheme;
+ (NSString)_stringForFind;
+ (void)_clearLockdownModeWarningNeeded;
+ (void)_permissionChanged:(id)a3 forOrigin:(id)a4;
+ (void)_setApplicationBundleIdentifier:(id)a3;
+ (void)_setStringForFind:(id)a3;
- (BOOL)_addsVisitedLinks;
- (BOOL)_allMediaPresentationsClosed;
- (BOOL)_allowAnimationControls;
- (BOOL)_allowsAnyAnimationToPlay;
- (BOOL)_allowsDoubleTapGestures;
- (BOOL)_allowsMediaDocumentInlinePlayback;
- (BOOL)_allowsViewportShrinkToFit;
- (BOOL)_backgroundExtendsBeyondPage;
- (BOOL)_beginBackSwipeForTesting;
- (BOOL)_canEnterFullscreen;
- (BOOL)_canToggleInWindow;
- (BOOL)_canTogglePictureInPicture;
- (BOOL)_canUseCredentialStorage;
- (BOOL)_completeBackSwipeForTesting;
- (BOOL)_contentViewIsFirstResponder;
- (BOOL)_deferrableUserScriptsNeedNotification;
- (BOOL)_dontResetTransientActivationAfterRunJavaScript;
- (BOOL)_effectiveAppearanceIsDark;
- (BOOL)_effectiveUserInterfaceLevelIsElevated;
- (BOOL)_findInteractionEnabled;
- (BOOL)_hasActiveNowPlayingSession;
- (BOOL)_hasOverriddenLayoutParameters;
- (BOOL)_hasResizeAssertion;
- (BOOL)_hasServiceWorkerBackgroundActivityForTesting;
- (BOOL)_hasServiceWorkerForegroundActivityForTesting;
- (BOOL)_hasSleepDisabler;
- (BOOL)_haveSetObscuredInsets;
- (BOOL)_haveSetUnobscuredSafeAreaInsets;
- (BOOL)_isAnimatingDragCancel;
- (BOOL)_isBackground;
- (BOOL)_isBeingInspected;
- (BOOL)_isClosed;
- (BOOL)_isDisplayingPDF;
- (BOOL)_isDisplayingStandaloneImageDocument;
- (BOOL)_isDisplayingStandaloneMediaDocument;
- (BOOL)_isEditable;
- (BOOL)_isInFullscreen;
- (BOOL)_isInWindowActive;
- (BOOL)_isKeyboardScrollingAnimationRunning;
- (BOOL)_isLoggerEnabledForTesting;
- (BOOL)_isNavigationSwipeGestureRecognizer:(id)a3;
- (BOOL)_isPictureInPictureActive;
- (BOOL)_isPlayingAudio;
- (BOOL)_isRetainingActiveFocusedState;
- (BOOL)_isShowingDataListSuggestions;
- (BOOL)_isShowingNavigationGestureSnapshot;
- (BOOL)_isShowingVideoPictureInPicture;
- (BOOL)_isSuspended;
- (BOOL)_isValid;
- (BOOL)_isWindowResizingEnabled;
- (BOOL)_mayAutomaticallyShowVideoPictureInPicture;
- (BOOL)_mayContainEditableElementsInRect:(CGRect)a3;
- (BOOL)_mediaCaptureEnabled;
- (BOOL)_negotiatedLegacyTLS;
- (BOOL)_networkRequestsInProgress;
- (BOOL)_paginationBehavesLikeColumns;
- (BOOL)_paginationLineGridEnabled;
- (BOOL)_restoreScrollAndZoomStateForTransaction:(const void *)a3;
- (BOOL)_safeAreaShouldAffectObscuredInsets;
- (BOOL)_scrollPerformanceDataCollectionEnabled;
- (BOOL)_scrollToRect:(FloatRect)a3 origin:(FloatPoint)a4 minimumScrollDistance:(float)a5;
- (BOOL)_scrollViewIsRubberBanding:(id)a3;
- (BOOL)_scrollViewIsRubberBandingForRefreshControl;
- (BOOL)_scrollingUpdatesDisabledForTesting;
- (BOOL)_selectionRectIsFullyVisibleAndNonEmpty;
- (BOOL)_shouldAvoidResizingWhenInputViewBoundsChange;
- (BOOL)_shouldAvoidSecurityHeuristicScoreUpdates;
- (BOOL)_shouldBypassGeolocationPromptForTesting;
- (BOOL)_shouldDeferGeometryUpdates;
- (BOOL)_shouldUpdateKeyboardWithInfo:(id)a3;
- (BOOL)_supportsTextZoom;
- (BOOL)_tryClose;
- (BOOL)_tryToHandleKeyEventInCustomContentView:(id)a3;
- (BOOL)_updateScrollViewContentInsetsIfNecessary;
- (BOOL)_userContentExtensionsEnabled;
- (BOOL)_wasPrivateRelayed;
- (BOOL)_webProcessIsResponsive;
- (BOOL)_wirelessVideoPlaybackDisabled;
- (BOOL)_writingToolsTextReplacementsFinished;
- (BOOL)_zoomToRect:(FloatRect)a3 withOrigin:(FloatPoint)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7 minimumScrollDistance:(float)a8;
- (BOOL)allowsBackForwardNavigationGestures;
- (BOOL)allowsLinkPreview;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canGoBack;
- (BOOL)canGoForward;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)findInteractionEnabled;
- (BOOL)hasFullScreenWindowController;
- (BOOL)hasOnlySecureContent;
- (BOOL)isFindInteractionEnabled;
- (BOOL)isInspectable;
- (BOOL)isLoading;
- (BOOL)isWritingToolsActive;
- (BOOL)resignFirstResponder;
- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3;
- (BOOL)supportsTextReplacement;
- (BOOL)usesStandardContentView;
- (CALayer)_layerForFindOverlay;
- (CGFloat)pageZoom;
- (CGPoint)_contentOffsetAdjustedForObscuredInset:(CGPoint)a3;
- (CGPoint)_convertPointFromContentsToView:(CGPoint)a3;
- (CGPoint)_convertPointFromViewToContents:(CGPoint)a3;
- (CGPoint)_initialContentOffsetForScrollView;
- (CGRect)_contentBoundsExtendedForRubberbandingWithScale:(double)a3;
- (CGRect)_contentRectForUserInteraction;
- (CGRect)_contentVisibleRect;
- (CGRect)_dragCaretRect;
- (CGRect)_inputViewBoundsInWindow;
- (CGRect)_tapHighlightViewRect;
- (CGRect)_uiTextCaretRect;
- (CGRect)_visibleContentRect;
- (CGRect)_visibleRectInEnclosingView:(id)a3;
- (CGSize)_fixedLayoutSize;
- (CGSize)_maximumUnobscuredSizeOverride;
- (CGSize)_minimumLayoutSizeOverride;
- (CGSize)_minimumUnobscuredSizeOverride;
- (CGSize)_viewportSizeForCSSViewportUnits;
- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5;
- (Class)_printFormatterClass;
- (FloatRect)visibleRectInViewCoordinates;
- (FloatSize)activeViewLayoutSize:(const CGRect *)a3;
- (NSArray)_certificateChain;
- (NSArray)_scrollPerformanceData;
- (NSArray)certificateChain;
- (NSData)_dataForDisplayedPDF;
- (NSData)_sessionStateData;
- (NSNumber)_stableStateOverride;
- (NSString)_MIMEType;
- (NSString)_applicationNameForUserAgent;
- (NSString)_caLayerTreeAsText;
- (NSString)_remoteInspectionNameOverride;
- (NSString)_scrollingTreeAsText;
- (NSString)_suggestedFilenameForDisplayedPDF;
- (NSString)_uiViewTreeAsText;
- (NSString)_userAgent;
- (NSString)customUserAgent;
- (NSString)formInputLabel;
- (NSString)mediaType;
- (NSString)selectFormPopoverTitle;
- (NSString)textContentTypeForTesting;
- (NSString)title;
- (NSURL)URL;
- (NSURL)_committedURL;
- (NSURL)_mainFrameURL;
- (NSURL)_requiredWebExtensionBaseURL;
- (NSURL)_resourceDirectoryURL;
- (NSURL)_unreachableURL;
- (NakedPtr<WebKit::WebPageProxy>)_page;
- (OpaqueWKPage)_pageForTesting;
- (OptionSet<WebKit::ViewStabilityFlag>)_viewStabilityState:(id)a3;
- (RefPtr<WebKit::ViewSnapshot,)_takeViewSnapshot;
- (SecTrustRef)serverTrust;
- (UIColor)_pageExtendedBackgroundColor;
- (UIColor)_sampledPageTopColor;
- (UIColor)themeColor;
- (UIColor)underPageBackgroundColor;
- (UIEdgeInsets)_computedContentInset;
- (UIEdgeInsets)_computedObscuredInset;
- (UIEdgeInsets)_computedObscuredInsetForWarningView;
- (UIEdgeInsets)_computedUnobscuredSafeAreaInset;
- (UIEdgeInsets)_contentInsetsFromSystemMinimumLayoutMargins;
- (UIEdgeInsets)_obscuredInsets;
- (UIEdgeInsets)_scrollViewSystemContentInset;
- (UIEdgeInsets)_unobscuredSafeAreaInsets;
- (UIEdgeInsets)currentlyVisibleContentInsetsWithScale:(double)a3 obscuredInsets:(UIEdgeInsets)a4;
- (UIEdgeInsets)maximumViewportInset;
- (UIEdgeInsets)minimumViewportInset;
- (UIEventAttribution)_uiEventAttribution;
- (UIFindInteraction)findInteraction;
- (UIGestureRecognizer)_imageAnalysisGestureRecognizer;
- (UIScrollView)scrollView;
- (UITapGestureRecognizer)_singleTapGestureRecognizer;
- (UITextRange)selectedTextRange;
- (UIView)_safeBrowsingWarning;
- (WKBackForwardList)backForwardList;
- (WKBrowsingContextHandle)_handle;
- (WKFullscreenState)fullscreenState;
- (WKHistoryDelegatePrivate)_historyDelegate;
- (WKMediaCaptureState)cameraCaptureState;
- (WKMediaCaptureState)microphoneCaptureState;
- (WKNavigation)goBack;
- (WKNavigation)goForward;
- (WKNavigation)goToBackForwardListItem:(WKBackForwardListItem *)item;
- (WKNavigation)loadData:(NSData *)data MIMEType:(NSString *)MIMEType characterEncodingName:(NSString *)characterEncodingName baseURL:(NSURL *)baseURL;
- (WKNavigation)loadFileRequest:(NSURLRequest *)request allowingReadAccessToURL:(NSURL *)readAccessURL;
- (WKNavigation)loadFileURL:(NSURL *)URL allowingReadAccessToURL:(NSURL *)readAccessURL;
- (WKNavigation)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;
- (WKNavigation)loadRequest:(NSURLRequest *)request;
- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request response:(NSURLResponse *)response responseData:(NSData *)data;
- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request responseHTMLString:(NSString *)string;
- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request withResponse:(NSURLResponse *)response responseData:(NSData *)data;
- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request withResponseHTMLString:(NSString *)string;
- (WKNavigation)reload;
- (WKNavigation)reloadFromOrigin;
- (WKPasswordView)_passwordView;
- (WKVelocityTrackingScrollView)_scrollViewInternal;
- (WKWebView)initWithCoder:(NSCoder *)coder;
- (WKWebView)initWithFrame:(CGRect)a3;
- (WKWebView)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration;
- (WKWebViewConfiguration)configuration;
- (WKWebViewContentProviderRegistry)_contentProviderRegistry;
- (_UIFindInteraction)_findInteraction;
- (_WKAppHighlightDelegate)_appHighlightDelegate;
- (_WKDiagnosticLoggingDelegate)_diagnosticLoggingDelegate;
- (_WKFindDelegate)_findDelegate;
- (_WKFrameHandle)_mainFrame;
- (_WKFullscreenDelegate)_fullscreenDelegate;
- (_WKIconLoadingDelegate)_iconLoadingDelegate;
- (_WKInputDelegate)_inputDelegate;
- (_WKInspector)_inspector;
- (_WKResourceLoadDelegate)_resourceLoadDelegate;
- (_WKSessionState)_sessionState;
- (_WKTextManipulationDelegate)_textManipulationDelegate;
- (_WKWebViewPrintProvider)_printProvider;
- (double)_audioRoutingArbitrationUpdateTime;
- (double)_contentZoomScale;
- (double)_gapBetweenPages;
- (double)_initialScaleFactor;
- (double)_mediaCaptureReportingDelayForTesting;
- (double)_minimumEffectiveDeviceWidth;
- (double)_overrideDeviceScaleFactor;
- (double)_pageLength;
- (double)_pageScale;
- (double)_targetContentZoomScaleForRect:(const FloatRect *)a3 currentScale:(double)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7;
- (double)_textZoomFactor;
- (double)_viewScale;
- (double)estimatedProgress;
- (double)timePickerValueHour;
- (double)timePickerValueMinute;
- (float)_adjustScrollRectToAvoidHighlightOverlay:(FloatRect)a3;
- (id).cxx_construct;
- (id)UIDelegate;
- (id)_animationForFindOverlay:(BOOL)a3;
- (id)_attachmentForIdentifier:(id)a3;
- (id)_contentSizeCategory;
- (id)_contentsOfUserInterfaceItem:(id)a3;
- (id)_currentContentView;
- (id)_dataDetectionResults;
- (id)_enableFinalTextAnimationForElementWithID:(id)a3;
- (id)_enableSourceTextAnimationAfterElementWithID:(id)a3;
- (id)_filePickerAcceptedTypeIdentifiers;
- (id)_fullScreenPlaceholderView;
- (id)_insertAttachmentWithFileWrapper:(id)a3 contentType:(id)a4 completion:(id)a5;
- (id)_insertAttachmentWithFileWrapper:(id)a3 contentType:(id)a4 options:(id)a5 completion:(id)a6;
- (id)_insertAttachmentWithFilename:(id)a3 contentType:(id)a4 data:(id)a5 options:(id)a6 completion:(id)a7;
- (id)_insertionPointColor;
- (id)_loadData:(id)a3 MIMEType:(id)a4 characterEncodingName:(id)a5 baseURL:(id)a6 userData:(id)a7;
- (id)_loadRequest:(id)a3 shouldOpenExternalURLs:(BOOL)a4;
- (id)_loadRequest:(id)a3 shouldOpenExternalURLsPolicy:(int64_t)a4;
- (id)_propertiesOfLayerWithID:(unint64_t)a3;
- (id)_reloadExpiredOnly;
- (id)_reloadWithoutContentBlockers;
- (id)_remoteObjectRegistry;
- (id)_restoreSessionState:(id)a3 andNavigate:(BOOL)a4;
- (id)_retainActiveFocusedState;
- (id)_scrollbarState:(unint64_t)a3 processID:(unint64_t)a4 isVertical:(BOOL)a5;
- (id)_scrollbarStateForScrollingNodeID:(unint64_t)a3 processID:(unint64_t)a4 isVertical:(BOOL)a5;
- (id)_searchableObject;
- (id)_sessionStateWithFilter:(id)a3;
- (id)_snapshotLayerContentsForBackForwardListItem:(id)a3;
- (id)_suspendMediaPlaybackCounter;
- (id)_textInputTraits;
- (id)_viewForFindUI;
- (id)_wkScrollView;
- (id)browsingContextController;
- (id)findInteraction:(id)a3 sessionForView:(id)a4;
- (id)fullScreenWindowController;
- (id)inputAccessoryView;
- (id)inputAssistantItem;
- (id)inputView;
- (id)interactionState;
- (id)navigationDelegate;
- (id)targetForAction:(SEL)a3 withSender:(id)a4;
- (id)undoManager;
- (id)valueForUndefinedKey:(id)a3;
- (id)viewForIntelligenceTextEffectCoordinator:(id)a3;
- (id)viewForZoomingInScrollView:(id)a3;
- (int)_audioRoutingArbitrationStatus;
- (int)_deviceOrientationIgnoringOverrides;
- (int)_gpuProcessIdentifier;
- (int)_modelProcessIdentifier;
- (int)_networkProcessIdentifier;
- (int)_provisionalWebProcessIdentifier;
- (int)_webProcessIdentifier;
- (int64_t)_displayCaptureState;
- (int64_t)_effectiveDataOwner:(int64_t)a3;
- (int64_t)_interfaceOrientationOverride;
- (int64_t)_paginationMode;
- (int64_t)_selectionGranularity;
- (int64_t)_systemAudioCaptureState;
- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5;
- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4 inDocument:(id)a5;
- (int64_t)writingToolsBehavior;
- (optional<BOOL>)_resolutionForShareSheetImmediateCompletionForTesting;
- (uint64_t)_doAfterNextVisibleContentRectAndPresentationUpdate:;
- (uint64_t)_evaluateJavaScript:(WTF *)this asAsyncFunction:(void *)a2 withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:;
- (uint64_t)_evaluateJavaScript:(uint64_t)a1 asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:;
- (uint64_t)_internalDoAfterNextPresentationUpdate:(const void *)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:;
- (uint64_t)_internalDoAfterNextPresentationUpdate:(uint64_t)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:;
- (uint64_t)_internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:;
- (uint64_t)_showWarningView:(uint64_t)a1 completionHandler:;
- (uint64_t)closeAllMediaPresentationsWithCompletionHandler:(WTF *)this;
- (uint64_t)closeAllMediaPresentationsWithCompletionHandler:(uint64_t)a1;
- (uint64_t)createPDFWithConfiguration:(const void *)a1 completionHandler:;
- (uint64_t)createPDFWithConfiguration:(uint64_t)a1 completionHandler:;
- (uint64_t)createWebArchiveDataWithCompletionHandler:(const void *)a1;
- (uint64_t)createWebArchiveDataWithCompletionHandler:(uint64_t)a1;
- (uint64_t)didEndWritingToolsSession:accepted:;
- (uint64_t)findString:(const void *)a1 withConfiguration:completionHandler:;
- (uint64_t)findString:(uint64_t)a1 withConfiguration:completionHandler:;
- (uint64_t)intelligenceTextEffectCoordinator:(const void *)a1 decorateReplacementsForRange:completion:;
- (uint64_t)intelligenceTextEffectCoordinator:(const void *)a1 rectsForProofreadingSuggestionsInRange:completion:;
- (uint64_t)intelligenceTextEffectCoordinator:(const void *)a1 setSelectionForRange:completion:;
- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 decorateReplacementsForRange:completion:;
- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 rectsForProofreadingSuggestionsInRange:completion:;
- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 setSelectionForRange:completion:;
- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 textPreviewsForRange:completion:;
- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 updateTextVisibilityForRange:visible:identifier:completion:;
- (uint64_t)proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:;
- (uint64_t)requestMediaPlaybackStateWithCompletionHandler:(const void *)a1;
- (uint64_t)requestMediaPlaybackStateWithCompletionHandler:(uint64_t)a1;
- (uint64_t)resumeDownloadFromResumeData:(const void *)a1 completionHandler:;
- (uint64_t)resumeDownloadFromResumeData:(uint64_t)a1 completionHandler:;
- (uint64_t)resumeDownloadFromResumeData:(uint64_t)result completionHandler:(uint64_t)a2;
- (uint64_t)setCameraCaptureState:(const void *)a1 completionHandler:;
- (uint64_t)setCameraCaptureState:(uint64_t)a1 completionHandler:;
- (uint64_t)setMicrophoneCaptureState:(const void *)a1 completionHandler:;
- (uint64_t)setMicrophoneCaptureState:(uint64_t)a1 completionHandler:;
- (uint64_t)startDownloadUsingRequest:(const void *)a1 completionHandler:;
- (uint64_t)startDownloadUsingRequest:(uint64_t)a1 completionHandler:;
- (uint64_t)startDownloadUsingRequest:(uint64_t)result completionHandler:(uint64_t)a2;
- (uint64_t)takeSnapshotWithConfiguration:(const void *)a1 completionHandler:;
- (uint64_t)takeSnapshotWithConfiguration:(uint64_t)a1 completionHandler:;
- (uint64_t)willBeginWritingToolsSession:(const void *)a1 requestContexts:;
- (uint64_t)willBeginWritingToolsSession:(uint64_t)a1 requestContexts:;
- (uint64_t)willBeginWritingToolsSession:(uint64_t)a1 requestContexts:(uint64_t)a2;
- (unint64_t)_countOfUpdatesWithLayerChanges;
- (unint64_t)_displayCaptureSurfaces;
- (unint64_t)_dragInteractionPolicy;
- (unint64_t)_effectiveObscuredInsetEdgesAffectedBySafeArea;
- (unint64_t)_layoutMode;
- (unint64_t)_mediaCaptureState;
- (unint64_t)_mediaMutedState;
- (unint64_t)_obscuredInsetEdgesAffectedBySafeArea;
- (unint64_t)_observedRenderingProgressEvents;
- (unint64_t)_pageCount;
- (unint64_t)_resetFocusPreservationCount;
- (unint64_t)_selectionAttributes;
- (unint64_t)allowedWritingToolsResultOptions;
- (unint64_t)axesToPreventScrollingForPanGestureInScrollView:(id)a3;
- (void)_accessibilityClearSelection;
- (void)_accessibilityRetrieveRectsAtSelectionOffset:(int64_t)a3 withText:(id)a4 completionHandler:(id)a5;
- (void)_accessibilityRetrieveSpeakSelectionContent;
- (void)_accessibilitySettingsDidChange:(id)a3;
- (void)_accessibilityStoreSelection;
- (void)_acquireResizeAssertionForReason:(id)a3;
- (void)_addAppHighlight;
- (void)_addAppHighlightInNewGroup:(BOOL)a3 originatedInApp:(BOOL)a4;
- (void)_addEventAttributionWithSourceID:(unsigned __int8)a3 destinationURL:(id)a4 sourceDescription:(id)a5 purchaser:(id)a6 reportEndpoint:(id)a7 optionalNonce:(id)a8 applicationBundleID:(id)a9 ephemeral:(BOOL)a10;
- (void)_addLayerForFindOverlay;
- (void)_addShortcut:(id)a3;
- (void)_addTextAnimationForAnimationID:(id)a3 withData:(const TextAnimationData *)a4;
- (void)_addUpdateVisibleContentRectPreCommitHandler;
- (void)_adjustVisibilityForTargetedElements:(id)a3 completionHandler:(id)a4;
- (void)_alignCenter:(id)a3;
- (void)_alignJustified:(id)a3;
- (void)_alignLeft:(id)a3;
- (void)_alignRight:(id)a3;
- (void)_appPrivacyReportTestingData:(id)a3;
- (void)_archiveWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)_becomeFirstResponderWithSelectionMovingForward:(BOOL)a3 completionHandler:(id)a4;
- (void)_beginAnimatedFullScreenExit;
- (void)_beginAnimatedResizeWithUpdates:(id)a3;
- (void)_beginAutomaticLiveResizeIfNeeded;
- (void)_beginInteractiveObscuredInsetsChange;
- (void)_beginLiveResize;
- (void)_callAsyncJavaScript:(id)a3 arguments:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 completionHandler:(id)a7;
- (void)_cancelAnimatedResize;
- (void)_changeListType:(id)a3;
- (void)_clearAppPrivacyReportTestingData:(id)a3;
- (void)_clearBackForwardCache;
- (void)_clearInterfaceOrientationOverride;
- (void)_clearOverrideLayoutParameters;
- (void)_clearOverrideZoomScaleParameters;
- (void)_clearServiceWorkerEntitlementOverride:(id)a3;
- (void)_clearWarningView;
- (void)_clearWarningViewIfForMainFrameNavigation;
- (void)_close;
- (void)_closeAllMediaPresentations;
- (void)_completeTextManipulation:(id)a3 completion:(id)a4;
- (void)_completeTextManipulationForItems:(id)a3 completion:(id)a4;
- (void)_computePagesForPrinting:(id)a3 completionHandler:(id)a4;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_couldNotRestorePageState;
- (void)_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5;
- (void)_createMediaSessionCoordinatorForTesting:(id)a3 completionHandler:(id)a4;
- (void)_dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (void)_dataTaskWithRequest:(id)a3 runAtForegroundPriority:(BOOL)a4 completionHandler:(id)a5;
- (void)_decreaseListLevel:(id)a3;
- (void)_decrementFocusPreservationCount;
- (void)_define:(id)a3;
- (void)_denyNextUserMediaRequest;
- (void)_destroyResizeAnimationView;
- (void)_detectDataWithTypes:(unint64_t)a3 completionHandler:(id)a4;
- (void)_didAddLayerForFindOverlay:(id)a3;
- (void)_didChangeEditorState;
- (void)_didCommitLayerTree:(const void *)a3;
- (void)_didCommitLayerTreeDuringAnimatedResize:(const void *)a3;
- (void)_didCommitLoadForMainFrame;
- (void)_didCompleteAnimatedResize;
- (void)_didDisableBrowserExtensions:(id)a3;
- (void)_didEnableBrowserExtensions:(id)a3;
- (void)_didEndPartialIntelligenceTextAnimation;
- (void)_didFailNavigation:(Navigation *)a3;
- (void)_didFinishLoadingDataForCustomContentProviderWithSuggestedFilename:(const void *)a3 data:(id)a4;
- (void)_didFinishNavigation:(Navigation *)a3;
- (void)_didFinishScrolling:(id)a3;
- (void)_didFinishTextInteractionInTextInputContext:(id)a3;
- (void)_didInsertAttachment:(void *)a3 withSource:(id)a4;
- (void)_didInvalidateDataForAttachment:(void *)a3;
- (void)_didInvokeUIScrollViewDelegateCallback;
- (void)_didLoadAppInitiatedRequest:(id)a3;
- (void)_didLoadNonAppInitiatedRequest:(id)a3;
- (void)_didRelaunchProcess;
- (void)_didRemoveAttachment:(void *)a3;
- (void)_didRemoveLayerForFindOverlay;
- (void)_didRequestPasswordForDocument;
- (void)_didSameDocumentNavigationForMainFrame:(unsigned __int8)a3;
- (void)_didScroll;
- (void)_didStartProvisionalLoadForMainFrame;
- (void)_didStopDeferringGeometryUpdates;
- (void)_didStopRequestingPasswordForDocument;
- (void)_disableBackForwardSnapshotVolatilityForTesting;
- (void)_disableTextAnimationWithUUID:(id)a3;
- (void)_disableURLSchemeCheckInDataDetectors;
- (void)_dismissContactPickerWithContacts:(id)a3;
- (void)_dismissFilePicker;
- (void)_dispatchSetDeviceOrientation:(int)a3;
- (void)_dispatchSetOrientationForMediaCapture:(int)a3;
- (void)_dispatchSetViewLayoutSize:(FloatSize)a3;
- (void)_doAfterActivityStateUpdate:(id)a3;
- (void)_doAfterNextPresentationUpdate:(id)a3;
- (void)_doAfterNextPresentationUpdateWithoutWaitingForAnimatedResizeForTesting:(id)a3;
- (void)_doAfterNextPresentationUpdateWithoutWaitingForPainting:(id)a3;
- (void)_doAfterNextStablePresentationUpdate:(id)a3;
- (void)_doAfterNextVisibleContentRectAndPresentationUpdate:;
- (void)_doAfterNextVisibleContentRectAndPresentationUpdate:(id)a3;
- (void)_doAfterNextVisibleContentRectAndStablePresentationUpdate:(id)a3;
- (void)_doAfterNextVisibleContentRectUpdate:(id)a3;
- (void)_doAfterProcessingAllPendingMouseEvents:(id)a3;
- (void)_doAfterReceivingEditDragSnapshotForTesting:(id)a3;
- (void)_dumpPrivateClickMeasurement:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_enclosingScrollerScrollingEnded:(id)a3;
- (void)_endAnimatedFullScreenExit;
- (void)_endAnimatedResize;
- (void)_endInteractiveObscuredInsetsChange;
- (void)_endLiveResize;
- (void)_enhancedWindowingToggled:(id)a3;
- (void)_ensureResizeAnimationView;
- (void)_enterFullscreen;
- (void)_enterInWindow;
- (void)_evaluateJavaScript:(id)a3 asAsyncFunction:(BOOL)a4 withSourceURL:(id)a5 withArguments:(id)a6 forceUserGesture:(BOOL)a7 inFrame:(id)a8 inWorld:(id)a9 completionHandler:(id)a10;
- (void)_evaluateJavaScript:(id)a3 inFrame:(id)a4 inContentWorld:(id)a5 completionHandler:(id)a6;
- (void)_evaluateJavaScript:(id)a3 withSourceURL:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 completionHandler:(id)a7;
- (void)_evaluateJavaScript:(id)a3 withSourceURL:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 withUserGesture:(BOOL)a7 completionHandler:(id)a8;
- (void)_evaluateJavaScript:(uint64_t)a1 asAsyncFunction:(WebCore::SerializedScriptValue *)a2 withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:;
- (void)_evaluateJavaScript:(void *)a1 asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:;
- (void)_evaluateJavaScriptWithoutUserGesture:(id)a3 completionHandler:(id)a4;
- (void)_executeEditCommand:(id)a3 argument:(id)a4 completion:(id)a5;
- (void)_exitInWindow;
- (void)_findSelected:(id)a3;
- (void)_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5;
- (void)_firePresentationUpdateForPendingStableStatePresentationCallbacks;
- (void)_focusTextInputContext:(id)a3 placeCaretAt:(CGPoint)a4 completionHandler:(id)a5;
- (void)_frameOrBoundsMayHaveChanged;
- (void)_frameOrBoundsWillChange;
- (void)_frameTrees:(id)a3;
- (void)_frames:(id)a3;
- (void)_getApplicationManifestWithCompletionHandler:(id)a3;
- (void)_getContentsAsAttributedStringWithCompletionHandler:(id)a3;
- (void)_getContentsAsStringWithCompletionHandler:(id)a3;
- (void)_getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:(id)a3;
- (void)_getContentsOfAllFramesAsStringWithCompletionHandler:(id)a3;
- (void)_getMainResourceDataWithCompletionHandler:(id)a3;
- (void)_getPDFFirstPageSizeInFrame:(id)a3 completionHandler:(id)a4;
- (void)_getProcessDisplayNameWithCompletionHandler:(id)a3;
- (void)_getTextFragmentMatchWithCompletionHandler:(id)a3;
- (void)_getWebArchiveDataWithCompletionHandler:(id)a3;
- (void)_gpuToWebProcessConnectionCountForTesting:(id)a3;
- (void)_grantAccessToAssetServices;
- (void)_hideContentUntilNextUpdate;
- (void)_hideFindOverlay;
- (void)_hideFindUI;
- (void)_hidePasswordView;
- (void)_increaseListLevel:(id)a3;
- (void)_incrementFocusPreservationCount;
- (void)_indent:(id)a3;
- (void)_initializeWithConfiguration:(id)a3;
- (void)_insertNestedOrderedList:(id)a3;
- (void)_insertNestedUnorderedList:(id)a3;
- (void)_insertOrderedList:(id)a3;
- (void)_insertUnorderedList:(id)a3;
- (void)_internalDoAfterNextPresentationUpdate:(id)a3 withoutWaitingForPainting:(BOOL)a4 withoutWaitingForAnimatedResize:(BOOL)a5;
- (void)_internalDoAfterNextPresentationUpdate:(uint64_t)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:;
- (void)_invalidateResizeAssertions;
- (void)_isForcedIntoAppBoundMode:(id)a3;
- (void)_isJITEnabled:(id)a3;
- (void)_isLayerTreeFrozenForTesting:(id)a3;
- (void)_isNavigatingToAppBoundDomain:(id)a3;
- (void)_keyboardChangedWithInfo:(id)a3 adjustScrollView:(BOOL)a4;
- (void)_keyboardDidChangeFrame:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)_keyboardWillChangeFrame:(id)a3;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_killWebContentProcess;
- (void)_killWebContentProcessAndResetState;
- (void)_lastNavigationWasAppInitiated:(id)a3;
- (void)_launchInitialProcessIfNecessary;
- (void)_layerTreeCommitComplete;
- (void)_loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5;
- (void)_loadAndDecodeImage:(id)a3 constrainedToSize:(CGSize)a4 maximumBytesFromNetwork:(unint64_t)a5 completionHandler:(id)a6;
- (void)_loadServiceWorker:(id)a3 completionHandler:(id)a4;
- (void)_loadServiceWorker:(id)a3 usingModules:(BOOL)a4 completionHandler:(id)a5;
- (void)_lookup:(id)a3;
- (void)_navigationGestureDidBegin;
- (void)_navigationGestureDidEnd;
- (void)_nextAccessoryTab:(id)a3;
- (void)_notifyUserScripts;
- (void)_nowPlayingMediaTitleAndArtist:(id)a3;
- (void)_numberOfVisibilityAdjustmentRectsWithCompletionHandler:(id)a3;
- (void)_outdent:(id)a3;
- (void)_overrideLayoutParametersWithMinimumLayoutSize:(CGSize)a3 maximumUnobscuredSizeOverride:(CGSize)a4;
- (void)_overrideLayoutParametersWithMinimumLayoutSize:(CGSize)a3 minimumUnobscuredSizeOverride:(CGSize)a4 maximumUnobscuredSizeOverride:(CGSize)a5;
- (void)_overrideViewportWithArguments:(id)a3;
- (void)_overrideZoomScaleParametersWithMinimumZoomScale:(double)a3 maximumZoomScale:(double)a4 allowUserScaling:(BOOL)a5;
- (void)_pasteAndMatchStyle:(id)a3;
- (void)_pasteAsQuotation:(id)a3;
- (void)_pauseAllAnimationsWithCompletionHandler:(id)a3;
- (void)_pauseNowPlayingMediaSession:(id)a3;
- (void)_playAllAnimationsWithCompletionHandler:(id)a3;
- (void)_playPredominantOrNowPlayingMediaSession:(id)a3;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_preconnectToServer:(id)a3;
- (void)_presentLockdownMode;
- (void)_presentLockdownModeAlertIfNeeded;
- (void)_previousAccessoryTab:(id)a3;
- (void)_processDidExit;
- (void)_processDidResumeForTesting;
- (void)_processWillSuspendForTesting:(id)a3;
- (void)_processWillSuspendImminentlyForTesting;
- (void)_processWillSwap;
- (void)_processWillSwapOrDidExit;
- (void)_promptForReplace:(id)a3;
- (void)_proofreadingSessionShowDetailsForSuggestionWithUUID:(id)a3 relativeToRect:(CGRect)a4;
- (void)_proofreadingSessionUpdateState:(unsigned __int8)a3 forSuggestionWithUUID:(id)a4;
- (void)_recalculateViewportSizesWithMinimumViewportInset:(UIEdgeInsets)a3 maximumViewportInset:(UIEdgeInsets)a4 throwOnInvalidInput:(BOOL)a5;
- (void)_registerForNotifications;
- (void)_removeDataDetectedLinks:(id)a3;
- (void)_removeLayerForFindOverlay;
- (void)_removeTextAnimationForAnimationID:(id)a3;
- (void)_requestActivatedElementAtPosition:(CGPoint)a3 completionBlock:(id)a4;
- (void)_requestActiveNowPlayingSessionInfo:(id)a3;
- (void)_requestRectForFoundTextRange:(id)a3 completionHandler:(id)a4;
- (void)_requestTargetedElementInfo:(id)a3 completionHandler:(id)a4;
- (void)_requestTextExtraction:(CGRect)a3 completionHandler:(id)a4;
- (void)_requestTextExtractionForSwift:(id)a3;
- (void)_requestTextInputContextsInRect:(CGRect)a3 completionHandler:(id)a4;
- (void)_rescheduleEndLiveResizeTimer;
- (void)_resetCachedScrollViewBackgroundColor;
- (void)_resetContentOffset;
- (void)_resetInteraction;
- (void)_resetNavigationGestureStateForTesting;
- (void)_resetObscuredInsets;
- (void)_resetObscuredInsetsForTesting;
- (void)_resetScrollViewInsetAdjustmentBehavior;
- (void)_resetUnobscuredSafeAreaInsets;
- (void)_resetVisibilityAdjustmentsForTargetedElements:(id)a3 completionHandler:(id)a4;
- (void)_resizeWhileHidingContentWithUpdates:(id)a3;
- (void)_restoreAndScrollToAppHighlight:(id)a3;
- (void)_restoreAppHighlights:(id)a3;
- (void)_restoreFromSessionStateData:(id)a3;
- (void)_restorePageScrollPosition:(optional<WebCore:(FloatPoint)a4 :(RectEdges<float>)a5 FloatPoint>)a3 scrollOrigin:(double)a6 previousObscuredInset:scale:;
- (void)_restorePageStateToUnobscuredCenter:(optional<WebCore:(double)a4 :FloatPoint>)a3 scale:;
- (void)_resumeAllMediaPlayback;
- (void)_resumePage:(id)a3;
- (void)_revokeAccessToAssetServices;
- (void)_saveBackForwardSnapshotForItem:(id)a3;
- (void)_saveResources:(id)a3 suggestedFileName:(id)a4 completionHandler:(id)a5;
- (void)_scheduleForcedVisibleContentRectUpdate;
- (void)_scheduleVisibleContentRectUpdate;
- (void)_scheduleVisibleContentRectUpdateAfterScrollInView:(id)a3;
- (void)_scrollToAndRevealSelectionIfNeeded;
- (void)_scrollToContentScrollPosition:(FloatPoint)a3 scrollOrigin:(IntPoint)a4 animated:(BOOL)a5;
- (void)_scrollViewDidInterruptDecelerating:(id)a3;
- (void)_selectDataListOption:(int)a3;
- (void)_serviceWorkersEnabled:(id)a3;
- (void)_setAddsVisitedLinks:(BOOL)a3;
- (void)_setAllowsMediaDocumentInlinePlayback:(BOOL)a3;
- (void)_setAllowsViewportShrinkToFit:(BOOL)a3;
- (void)_setAppHighlightDelegate:(id)a3;
- (void)_setApplicationNameForUserAgent:(id)a3;
- (void)_setAvoidsUnsafeArea:(BOOL)a3;
- (void)_setBackgroundExtendsBeyondPage:(BOOL)a3;
- (void)_setCanUseCredentialStorage:(BOOL)a3;
- (void)_setContinuousSpellCheckingEnabledForTesting:(BOOL)a3;
- (void)_setDefersLoadingForTesting:(BOOL)a3;
- (void)_setDeviceHasAGXCompilerServiceForTesting;
- (void)_setDeviceOrientationUserPermissionHandlerForTesting:(id)a3;
- (void)_setDiagnosticLoggingDelegate:(id)a3;
- (void)_setDisplayCaptureState:(int64_t)a3 completionHandler:(id)a4;
- (void)_setDontResetTransientActivationAfterRunJavaScript:(BOOL)a3;
- (void)_setDragInteractionPolicy:(unint64_t)a3;
- (void)_setEditable:(BOOL)a3;
- (void)_setEphemeralUIEventAttribution:(id)a3;
- (void)_setEphemeralUIEventAttribution:(id)a3 forApplicationWithBundleID:(id)a4;
- (void)_setFindDelegate:(id)a3;
- (void)_setFixedLayoutSize:(CGSize)a3;
- (void)_setFont:(id)a3 sender:(id)a4;
- (void)_setFontSize:(double)a3 sender:(id)a4;
- (void)_setFullscreenDelegate:(id)a3;
- (void)_setGapBetweenPages:(double)a3;
- (void)_setGrammarCheckingEnabledForTesting:(BOOL)a3;
- (void)_setHasActiveNowPlayingSession:(BOOL)a3;
- (void)_setHasCustomContentView:(BOOL)a3 loadedMIMEType:(const void *)a4;
- (void)_setHistoryDelegate:(id)a3;
- (void)_setIconLoadingDelegate:(id)a3;
- (void)_setIndexOfGetDisplayMediaDeviceSelectedForTesting:(id)a3;
- (void)_setInputDelegate:(id)a3;
- (void)_setInterfaceOrientationOverride:(int64_t)a3;
- (void)_setLayoutMode:(unint64_t)a3;
- (void)_setMediaCaptureEnabled:(BOOL)a3;
- (void)_setMediaCaptureReportingDelayForTesting:(double)a3;
- (void)_setMinimumEffectiveDeviceWidth:(double)a3;
- (void)_setNowPlayingMetadataObserver:(id)a3;
- (void)_setObscuredInsetEdgesAffectedBySafeArea:(unint64_t)a3;
- (void)_setObscuredInsets:(UIEdgeInsets)a3;
- (void)_setObservedRenderingProgressEvents:(unint64_t)a3;
- (void)_setOpaqueInternal:(BOOL)a3;
- (void)_setOverlaidAccessoryViewsInset:(CGSize)a3;
- (void)_setOverrideDeviceScaleFactor:(double)a3;
- (void)_setPageLength:(double)a3;
- (void)_setPageMuted:(unint64_t)a3;
- (void)_setPageScale:(double)a3 withOrigin:(CGPoint)a4;
- (void)_setPageZoomFactor:(double)a3;
- (void)_setPaginationBehavesLikeColumns:(BOOL)a3;
- (void)_setPaginationMode:(int64_t)a3;
- (void)_setPrivateClickMeasurementAppBundleIDForTesting:(id)a3 completionHandler:(id)a4;
- (void)_setPrivateClickMeasurementAttributionReportURLsForTesting:(id)a3 destinationURL:(id)a4 completionHandler:(id)a5;
- (void)_setPrivateClickMeasurementAttributionTokenPublicKeyURLForTesting:(id)a3 completionHandler:(id)a4;
- (void)_setPrivateClickMeasurementAttributionTokenSignatureURLForTesting:(id)a3 completionHandler:(id)a4;
- (void)_setPrivateClickMeasurementOverrideTimerForTesting:(BOOL)a3 completionHandler:(id)a4;
- (void)_setRemoteInspectionNameOverride:(id)a3;
- (void)_setResourceLoadDelegate:(id)a3;
- (void)_setScrollPerformanceDataCollectionEnabled:(BOOL)a3;
- (void)_setShareSheetCompletesImmediatelyWithResolutionForTesting:(BOOL)a3;
- (void)_setStatisticsCrossSiteLoadWithLinkDecorationForTesting:(id)a3 withToHost:(id)a4 withWasFiltered:(BOOL)a5 withCompletionHandler:(id)a6;
- (void)_setSuppressSoftwareKeyboard:(BOOL)a3;
- (void)_setSystemAudioCaptureState:(int64_t)a3 completionHandler:(id)a4;
- (void)_setSystemCanPromptForGetDisplayMediaForTesting:(BOOL)a3;
- (void)_setSystemPreviewCompletionHandlerForLoadTesting:(id)a3;
- (void)_setTextColor:(id)a3 sender:(id)a4;
- (void)_setTextManipulationDelegate:(id)a3;
- (void)_setTextZoomFactor:(double)a3;
- (void)_setThrottleStateForTesting:(int)a3;
- (void)_setUIEventAttribution:(id)a3;
- (void)_setUnobscuredSafeAreaInsets:(UIEdgeInsets)a3;
- (void)_setViewScale:(double)a3;
- (void)_setViewportSizeForCSSViewportUnits:(CGSize)a3;
- (void)_setupPageConfiguration:(void *)a3 withPool:(void *)a4;
- (void)_setupScrollAndContentViews;
- (void)_share:(id)a3;
- (void)_showFindOverlay;
- (void)_showPasswordViewWithDocumentName:(id)a3 passwordHandler:(id)a4;
- (void)_showWarningView:(const void *)a3 completionHandler:(void *)a4;
- (void)_showWarningView:(uint64_t)a1 completionHandler:(uint64_t)a2;
- (void)_showWarningViewWithTitle:(id)a3 warning:(id)a4 details:(id)a5 completionHandler:(id)a6;
- (void)_showWarningViewWithURL:(id)a3 title:(id)a4 warning:(id)a5 details:(id)a6 completionHandler:(id)a7;
- (void)_showWarningViewWithURL:(id)a3 title:(id)a4 warning:(id)a5 detailsWithLinks:(id)a6 completionHandler:(id)a7;
- (void)_simulateClickOverFirstMatchingTextInViewportWithUserInteraction:(id)a3 completionHandler:(id)a4;
- (void)_simulateDeviceOrientationChangeWithAlpha:(double)a3 beta:(double)a4 gamma:(double)a5;
- (void)_simulateElementAction:(int64_t)a3 atLocation:(CGPoint)a4;
- (void)_simulateLongPressActionAtLocation:(CGPoint)a3;
- (void)_simulateSelectionStart;
- (void)_simulateTextEntered:(id)a3;
- (void)_snapshotRect:(CGRect)a3 intoImageOfWidth:(double)a4 completionHandler:(id)a5;
- (void)_snapshotRectAfterScreenUpdates:(BOOL)a3 rectInViewCoordinates:(CGRect)a4 intoImageOfWidth:(double)a5 completionHandler:(id)a6;
- (void)_startImageAnalysis:(id)a3 target:(id)a4;
- (void)_startTextManipulationsWithConfiguration:(id)a3 completion:(id)a4;
- (void)_stopAllMediaPlayback;
- (void)_stopMediaCapture;
- (void)_storeAppHighlight:(const void *)a3;
- (void)_suspendAllMediaPlayback;
- (void)_suspendPage:(id)a3;
- (void)_switchFromStaticFontRegistryToUserFontRegistry;
- (void)_takeFindStringFromSelection:(id)a3;
- (void)_takePDFSnapshotWithConfiguration:(id)a3 completionHandler:(id)a4;
- (void)_targetedPreviewForElementWithID:(id)a3 completionHandler:(id)a4;
- (void)_toggleInWindow;
- (void)_togglePictureInPicture;
- (void)_toggleStrikeThrough:(id)a3;
- (void)_trackTransactionCommit:(const void *)a3;
- (void)_translate:(id)a3;
- (void)_transliterateChinese:(id)a3;
- (void)_triggerSystemPreviewActionOnElement:(unint64_t)a3 document:(id)a4 page:(unint64_t)a5;
- (void)_updateDrawingAreaSize;
- (void)_updateFindOverlayPosition;
- (void)_updateFindOverlaysOutsideContentView:(id)a3;
- (void)_updateLastKnownWindowSizeAndOrientation;
- (void)_updateLiveResizeTransform;
- (void)_updateMediaPlaybackControlsManager;
- (void)_updatePageLoadObserverState;
- (void)_updateScrollViewBackground;
- (void)_updateScrollViewForTransaction:(const void *)a3;
- (void)_updateScrollViewIndicatorStyle;
- (void)_updateScrollViewInsetAdjustmentBehavior;
- (void)_updateVisibleContentRects;
- (void)_updateWebpagePreferences:(id)a3;
- (void)_videoControlsManagerDidChange;
- (void)_willBeginTextInteractionInTextInputContext:(id)a3;
- (void)_willInvokeUIScrollViewDelegateCallback;
- (void)_willOpenAppLink;
- (void)_windowDidRotate:(id)a3;
- (void)_zoomOutWithOrigin:(FloatPoint)a3 animated:(BOOL)a4;
- (void)_zoomToCenter:(FloatPoint)a3 atScale:(double)a4 animated:(BOOL)a5 honorScrollability:(BOOL)a6;
- (void)_zoomToFocusRect:(const FloatRect *)a3 selectionRect:(const FloatRect *)a4 fontSize:(float)a5 minimumScale:(double)a6 maximumScale:(double)a7 allowScaling:(BOOL)a8 forceScroll:(BOOL)a9;
- (void)_zoomToInitialScaleWithOrigin:(FloatPoint)a3 animated:(BOOL)a4;
- (void)_zoomToRect:(FloatRect)a3 atScale:(double)a4 origin:(FloatPoint)a5 animated:(BOOL)a6;
- (void)addShortcut:(id)a3;
- (void)buildMenuWithBuilder:(id)a3;
- (void)callAsyncJavaScript:(NSString *)functionBody arguments:(NSDictionary *)arguments inFrame:(WKFrameInfo *)frame inContentWorld:(WKContentWorld *)contentWorld completionHandler:(void *)completionHandler;
- (void)captureTextFromCamera:(id)a3;
- (void)clearAllDecoratedFoundText;
- (void)closeAllMediaPresentations;
- (void)closeAllMediaPresentationsWithCompletionHandler:(void *)a1;
- (void)closeAllMediaPresentationsWithCompletionHandler:(void *)completionHandler;
- (void)closeFullScreenWindowController;
- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)copy:(id)a3;
- (void)createPDFWithConfiguration:(WKPDFConfiguration *)pdfConfiguration completionHandler:(void *)completionHandler;
- (void)createPDFWithConfiguration:(uint64_t)a1 completionHandler:(WebCore::SharedBuffer *)a2;
- (void)createWebArchiveDataWithCompletionHandler:(void *)completionHandler;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5;
- (void)decreaseSize:(id)a3;
- (void)define:(id)a3;
- (void)didBeginTextSearchOperation;
- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4;
- (void)didEndTextSearchOperation;
- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4;
- (void)didEndWritingToolsSession:accepted:;
- (void)didMoveToWindow;
- (void)dismissFormAccessoryView;
- (void)encodeWithCoder:(id)a3;
- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void *)completionHandler;
- (void)evaluateJavaScript:(NSString *)javaScriptString inFrame:(WKFrameInfo *)frame inContentWorld:(WKContentWorld *)contentWorld completionHandler:(void *)completionHandler;
- (void)find:(id)a3;
- (void)findAndReplace:(id)a3;
- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4;
- (void)findInteraction:(id)a3 didEndFindSession:(id)a4;
- (void)findNext:(id)a3;
- (void)findPrevious:(id)a3;
- (void)findSelected:(id)a3;
- (void)findString:(NSString *)string withConfiguration:(WKFindConfiguration *)configuration completionHandler:(void *)completionHandler;
- (void)findString:(uint64_t)a1 withConfiguration:(uint64_t)a2 completionHandler:;
- (void)increaseSize:(id)a3;
- (void)intelligenceTextEffectCoordinator:(id)a3 decorateReplacementsForRange:(_NSRange)a4 completion:(id)a5;
- (void)intelligenceTextEffectCoordinator:(id)a3 rectsForProofreadingSuggestionsInRange:(_NSRange)a4 completion:(id)a5;
- (void)intelligenceTextEffectCoordinator:(id)a3 setSelectionForRange:(_NSRange)a4 completion:(id)a5;
- (void)intelligenceTextEffectCoordinator:(id)a3 textPreviewsForRange:(_NSRange)a4 completion:(id)a5;
- (void)intelligenceTextEffectCoordinator:(id)a3 updateTextVisibilityForRange:(_NSRange)a4 visible:(BOOL)a5 identifier:(id)a6 completion:(id)a7;
- (void)intelligenceTextEffectCoordinator:(uint64_t)a1 rectsForProofreadingSuggestionsInRange:(uint64_t *)a2 completion:;
- (void)intelligenceTextEffectCoordinator:(uint64_t)a1 textPreviewsForRange:(const WebCore::TextIndicatorData *)a2 completion:;
- (void)intelligenceTextEffectCoordinator:(uint64_t)a1 updateTextVisibilityForRange:visible:identifier:completion:;
- (void)keyboardAccessoryBarNext;
- (void)keyboardAccessoryBarPrevious;
- (void)layoutSubviews;
- (void)lookup:(id)a3;
- (void)makeTextWritingDirectionLeftToRight:(id)a3;
- (void)makeTextWritingDirectionNatural:(id)a3;
- (void)makeTextWritingDirectionRightToLeft:(id)a3;
- (void)paste:(id)a3;
- (void)pasteAndMatchStyle:(id)a3;
- (void)pauseAllMediaPlaybackWithCompletionHandler:(void *)completionHandler;
- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)promptForReplace:(id)a3;
- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7;
- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6;
- (void)proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:;
- (void)removeFromSuperview;
- (void)replace:(id)a3;
- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5;
- (void)requestMediaPlaybackStateWithCompletionHandler:(void *)completionHandler;
- (void)resumeAllMediaPlayback:(void *)completionHandler;
- (void)resumeDownloadFromResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler;
- (void)safeAreaInsetsDidChange;
- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4;
- (void)scrollView:(id)a3 handleScrollUpdate:(id)a4 completion:(id)a5;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)select:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectFormAccessoryPickerRow:(int)a3;
- (void)selectWordBackwardForTesting;
- (void)setAllMediaPlaybackSuspended:(BOOL)suspended completionHandler:(void *)completionHandler;
- (void)setAllowsBackForwardNavigationGestures:(BOOL)allowsBackForwardNavigationGestures;
- (void)setAllowsLinkPreview:(BOOL)allowsLinkPreview;
- (void)setBackgroundColor:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCameraCaptureState:(WKMediaCaptureState)state completionHandler:(void *)completionHandler;
- (void)setCustomUserAgent:(NSString *)customUserAgent;
- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled;
- (void)setFrame:(CGRect)a3;
- (void)setInspectable:(BOOL)inspectable;
- (void)setInteractionState:(id)interactionState;
- (void)setMediaType:(NSString *)mediaType;
- (void)setMicrophoneCaptureState:(WKMediaCaptureState)state completionHandler:(void *)completionHandler;
- (void)setMinimumViewportInset:(UIEdgeInsets)minimumViewportInset maximumViewportInset:(UIEdgeInsets)maximumViewportInset;
- (void)setNavigationDelegate:(id)navigationDelegate;
- (void)setOpaque:(BOOL)a3;
- (void)setPageZoom:(CGFloat)pageZoom;
- (void)setSelectedColorForColorPicker:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setTimePickerValueToHour:(int64_t)a3 minute:(int64_t)a4;
- (void)setUIDelegate:(id)UIDelegate;
- (void)setUnderPageBackgroundColor:(UIColor *)underPageBackgroundColor;
- (void)share:(id)a3;
- (void)startDownloadUsingRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler;
- (void)stopLoading;
- (void)suspendAllMediaPlayback:(void *)completionHandler;
- (void)takeSnapshotWithConfiguration:(WKSnapshotConfiguration *)snapshotConfiguration completionHandler:(void *)completionHandler;
- (void)takeSnapshotWithConfiguration:(uint64_t)a1 completionHandler:;
- (void)toggleBoldface:(id)a3;
- (void)toggleItalics:(id)a3;
- (void)toggleUnderline:(id)a3;
- (void)translate:(id)a3;
- (void)transliterateChinese:(id)a3;
- (void)useSelectionForFind:(id)a3;
- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4;
- (void)willFinishIgnoringCalloutBarFadeAfterPerformingAction;
- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4;
@end

@implementation WKWebView

- (WKWebViewConfiguration)configuration
{
  v2 = (void *)CFMakeCollectable((CFTypeRef)[self->_configuration.m_ptr copy]);

  return (WKWebViewConfiguration *)v2;
}

- (BOOL)hasFullScreenWindowController
{
  return self->_fullScreenWindowController.m_ptr != 0;
}

- (id)viewForZoomingInScrollView:(id)a3
{
  if (self->_resizeAnimationView.m_ptr) {
    return 0;
  }
  else {
    return [(WKWebView *)self _currentContentView];
  }
}

- (UIEdgeInsets)_obscuredInsets
{
  double top = self->_obscuredInsets.top;
  double left = self->_obscuredInsets.left;
  double bottom = self->_obscuredInsets.bottom;
  double right = self->_obscuredInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)_isInFullscreen
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 51);
  if (v2) {
    return (*(uint64_t (**)(void))(**(void **)(v2 + 32) + 24))();
  }
  else {
    return 0;
  }
}

- (NSURL)URL
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CB10];
  WebKit::PageLoadState::activeURL((unsigned __int8 *)(*((void *)self->_page.m_ptr + 4) + 1000), &v7);
  v4 = (NSURL *)objc_msgSend(v2, "_web_URLWithWTFString:", &v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  return v4;
}

- (void)_setAllowsViewportShrinkToFit:(BOOL)a3
{
  self->_allowsViewportShrinkToFit = a3;
}

- (UIFindInteraction)findInteraction
{
  return (UIFindInteraction *)self->_findInteraction.m_ptr;
}

- (NSURL)_committedURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", *((void *)self->_page.m_ptr + 4) + 1032);
}

- (UIView)_safeBrowsingWarning
{
  return (UIView *)self->_warningView.m_ptr;
}

- (NSString)title
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  uint64_t v3 = 1088;
  if (!*(void *)(v2 + 1088)) {
    uint64_t v3 = 1080;
  }
  if (*(void *)(v2 + v3)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v3 = WTF::linkedOnOrAfterSDKWithBehavior();
  if ((v3 & 1) == 0 && (+[WKWebView accessInstanceVariablesDirectly]::didLogFault & 1) == 0)
  {
    +[WKWebView accessInstanceVariablesDirectly]::didLogFault = 1;
    v4 = qword_1EB357B50;
    if (os_log_type_enabled((os_log_t)qword_1EB357B50, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136446210;
      Name = class_getName((Class)a1);
      _os_log_fault_impl(&dword_1985F2000, v4, OS_LOG_TYPE_FAULT, "Do not access private instance variables of %{public}s via key-value coding. This will raise an exception when linking against newer SDKs.", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)isLoading
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (*(void *)(v2 + 1016))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    unsigned int v4 = *(unsigned __int8 *)(v2 + 1000);
    if (v4 > 2) {
      LOBYTE(v3) = 0;
    }
    else {
      return (3u >> (v4 & 7)) & 1;
    }
  }
  return v3;
}

- (BOOL)hasOnlySecureContent
{
  return WebKit::PageLoadState::hasOnlySecureContent((WebKit::PageLoadState *)(*((void *)self->_page.m_ptr + 4) + 1000), (const Data *)a2);
}

- (void)_setUnobscuredSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_haveSetUnobscuredSafeAreaInsets = 1;
  if (self->_unobscuredSafeAreaInsets.left != a3.left
    || self->_unobscuredSafeAreaInsets.top != a3.top
    || self->_unobscuredSafeAreaInsets.right != a3.right
    || self->_unobscuredSafeAreaInsets.bottom != a3.bottom)
  {
    self->_unobscuredSafeAreaInsets = a3;
    [(WKWebView *)self _scheduleVisibleContentRectUpdate];
  }
}

- (NSURL)_unreachableURL
{
  return (NSURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", *((void *)self->_page.m_ptr + 4) + 1072);
}

- (BOOL)canGoBack
{
  if (self)
  {
    BOOL didAccessBackForwardList = self->_didAccessBackForwardList;
    self->_BOOL didAccessBackForwardList = 1;
    if (!didAccessBackForwardList) {
      -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
    }
  }
  return *(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 1136);
}

- (void)_setInterfaceOrientationOverride:(int64_t)a3
{
  if (!self->_overridesInterfaceOrientation || self->_interfaceOrientationOverride != a3)
  {
    self->_overridesInterfaceOrientation = 1;
    self->_interfaceOrientationOverride = a3;
    if (![(WKWebView *)self _shouldDeferGeometryUpdates])
    {
      unint64_t v4 = self->_interfaceOrientationOverride - 2;
      if (v4 > 2) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = dword_1994F6750[v4];
      }
      [(WKWebView *)self _dispatchSetDeviceOrientation:v5];
    }
  }
}

- (void)_setObscuredInsets:(UIEdgeInsets)a3
{
  self->_haveSetObscuredInsets = 1;
  if (self->_obscuredInsets.left != a3.left
    || self->_obscuredInsets.top != a3.top
    || self->_obscuredInsets.right != a3.right
    || self->_obscuredInsets.bottom != a3.bottom)
  {
    self->_obscuredInsets = a3;
    [(WKWebView *)self _scheduleVisibleContentRectUpdate];
    m_ptr = self->_warningView.m_ptr;
    [(WKWebView *)self _computedObscuredInsetForWarningView];
    objc_msgSend(m_ptr, "setContentInset:");
  }
}

- (void)safeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)WKWebView;
  [(WKWebView *)&v4 safeAreaInsetsDidChange];
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
  m_ptr = self->_warningView.m_ptr;
  [(WKWebView *)self _computedObscuredInsetForWarningView];
  objc_msgSend(m_ptr, "setContentInset:");
}

- (UIEdgeInsets)_computedObscuredInsetForWarningView
{
  if (self->_haveSetObscuredInsets)
  {
    double top = self->_obscuredInsets.top;
    double left = self->_obscuredInsets.left;
    double bottom = self->_obscuredInsets.bottom;
    double right = self->_obscuredInsets.right;
  }
  else
  {
    [(WKWebView *)self _scrollViewSystemContentInset];
    [(WKWebView *)self _effectiveObscuredInsetEdgesAffectedBySafeArea];
    UIEdgeInsetsAdd();
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  if (self->_scrollView.m_ptr == a3) {
    [a3 updateInteractiveScrollVelocity];
  }
  if (![(WKWebView *)self usesStandardContentView]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_customContentView.m_ptr, "web_scrollViewDidScroll:", a3);
  }
  [(WKWebView *)self _updateFindOverlayPosition];
  [(WKWebView *)self _scheduleVisibleContentRectUpdateAfterScrollInView:a3];
  uint64_t v5 = (WebKit::RemoteLayerTreeScrollingPerformanceData *)*((void *)self->_page.m_ptr + 123);
  if (v5)
  {
    [(WKWebView *)self visibleRectInViewCoordinates];
    v11.super.isa = (Class)__PAIR64__(v7, v6);
    v11._attr.refcount = v8;
    v11._attr.magic = v9;
    unsigned int v10 = WebKit::RemoteLayerTreeScrollingPerformanceData::blankPixelCount(v5, &v11);
    WebKit::RemoteLayerTreeScrollingPerformanceData::appendBlankPixelCount(v5, 1, v10);
  }
}

- (void)_frameOrBoundsMayHaveChanged
{
  [(WKWebView *)self bounds];
  double width = v3;
  double height = v5;
  v14[4] = v7;
  v14[5] = v8;
  v15.double width = v3;
  v15.double height = v5;
  objc_msgSend(self->_scrollView.m_ptr, "setFrame:");
  [(WKWebView *)self _updateFindOverlayPosition];
  if (self->_perProcessState.liveResizeParameters.__engaged_) {
    [(WKWebView *)self _updateLiveResizeTransform];
  }
  if (![(WKWebView *)self _shouldDeferGeometryUpdates])
  {
    if (!self->_overriddenLayoutParameters.__engaged_)
    {
      [(WKWebView *)self bounds];
      v14[0] = v9;
      v14[1] = v10;
      v14[2] = v11;
      v14[3] = v12;
      [(WKWebView *)self activeViewLayoutSize:v14];
      [(WKWebView *)self _dispatchSetViewLayoutSize:"_dispatchSetViewLayoutSize:"];
      m_ptr = self->_page.m_ptr;
      WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v14, &v15);
      WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)m_ptr, (const WebCore::FloatSize *)v14);
    }
    -[WKWebView _recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:](self, "_recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:", 0, self->_minimumViewportInset.top, self->_minimumViewportInset.left, self->_minimumViewportInset.bottom, self->_minimumViewportInset.right, self->_maximumViewportInset.top, self->_maximumViewportInset.left, self->_maximumViewportInset.bottom, self->_maximumViewportInset.right);
    [(WKWebView *)self _updateDrawingAreaSize];
    double width = v15.width;
    double height = v15.height;
  }
  objc_msgSend(self->_customContentView.m_ptr, "web_setMinimumSize:", width, height);
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
  -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
}

- (void)_overrideLayoutParametersWithMinimumLayoutSize:(CGSize)a3 minimumUnobscuredSizeOverride:(CGSize)a4 maximumUnobscuredSizeOverride:(CGSize)a5
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat v7 = a4.height;
  CGFloat v8 = a4.width;
  double v9 = a3.height;
  double v10 = a3.width;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a3.width < 0.0 || a3.height < 0.0)
  {
    uint64_t v12 = qword_1EB3587A8;
    if (os_log_type_enabled((os_log_t)qword_1EB3587A8, OS_LOG_TYPE_FAULT))
    {
      v26.CGFloat width = v10;
      v26.CGFloat height = v9;
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[WKWebView(WKPrivateIOS) _overrideLayoutParametersWithMinimumLayoutSize:minimumUnobscuredSiz"
                           "eOverride:maximumUnobscuredSizeOverride:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = NSStringFromCGSize(v26);
      _os_log_fault_impl(&dword_1985F2000, v12, OS_LOG_TYPE_FAULT, "%s: Error: attempting to override layout parameters with negative width or height: %@", buf, 0x16u);
    }
  }
  *(void *)buf = fmax(v10, 0.0);
  *(void *)&buf[8] = fmax(v9, 0.0);
  *(CGFloat *)&buf[16] = v8;
  *(CGFloat *)&buf[24] = v7;
  v24.CGFloat width = width;
  v24.CGFloat height = height;
  BOOL engaged = self->_overriddenLayoutParameters.__engaged_;
  CGSize v14 = v24;
  long long v15 = *(_OWORD *)buf;
  self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize = *(CGSize *)&buf[16];
  self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize = v14;
  *(_OWORD *)&self->_overriddenLayoutParameters.var0.__null_state_ = v15;
  if (!engaged) {
    self->_overriddenLayoutParameters.__engaged_ = 1;
  }
  if (![(WKWebView *)self _shouldDeferGeometryUpdates])
  {
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v22, (const CGSize *)buf);
    LODWORD(v16) = v22[0];
    LODWORD(v17) = v22[1];
    -[WKWebView _dispatchSetViewLayoutSize:](self, "_dispatchSetViewLayoutSize:", v16, v17);
    m_ptr = self->_page.m_ptr;
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v21, (const CGSize *)&buf[16]);
    WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)m_ptr, (const WebCore::FloatSize *)&v21);
    v19 = self->_page.m_ptr;
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v21, &v24);
    WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)v19, (const WebCore::FloatSize *)&v21);
    v20 = self->_page.m_ptr;
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v21, &v24);
    WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)v20, (const WebCore::FloatSize *)&v21);
  }
}

- (BOOL)_shouldDeferGeometryUpdates
{
  return self->_perProcessState.liveResizeParameters.__engaged_
      || self->_perProcessState.dynamicViewportUpdateMode
      || self->_perProcessState.isAnimatingFullScreenExit;
}

- (void)_dispatchSetViewLayoutSize:(FloatSize)a3
{
  m_ptr = self->_page.m_ptr;
  FloatSize v15 = a3;
  double v5 = *((double *)m_ptr + 136);
  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.lastSentViewLayoutSize.__engaged_
    || ((WebCore::FloatSize::operator CGSize(), double v8 = v7, v10 = v9, WebCore::FloatSize::operator CGSize(), v8 == v12)
      ? (BOOL v13 = v10 == v11)
      : (BOOL v13 = 0),
        !v13
     || !p_perProcessState->lastSentMinimumEffectiveDeviceWidth.__engaged_
     || p_perProcessState->lastSentMinimumEffectiveDeviceWidth.var0.__val_ != v5))
  {
    WebKit::WebPageProxy::setViewportConfigurationViewLayoutSize((uint64_t)self->_page.m_ptr, (const WebCore::FloatSize *)&v15, *((double *)self->_page.m_ptr + 135), v5);
    FloatSize v14 = v15;
    if (!p_perProcessState->lastSentViewLayoutSize.__engaged_) {
      p_perProcessState->lastSentViewLayoutSize.__engaged_ = 1;
    }
    p_perProcessState->lastSentViewLayoutSize.var0.__val_ = v14;
    p_perProcessState->lastSentMinimumEffectiveDeviceWidth.var0.__val_ = v5;
    p_perProcessState->lastSentMinimumEffectiveDeviceWidth.__engaged_ = 1;
  }
}

- (void)_scheduleVisibleContentRectUpdate
{
}

- (void)_updateFindOverlayPosition
{
  p_findOverlaysOutsideContentView = &self->_findOverlaysOutsideContentView;
  if (self->_findOverlaysOutsideContentView.__engaged_)
  {
    m_ptr = self->_scrollView.m_ptr;
    [self->_contentView.m_ptr bounds];
    double v6 = v5;
    double v8 = v7;
    [self->_contentView.m_ptr frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [m_ptr contentOffset];
    double v51 = v17;
    [m_ptr contentOffset];
    double v19 = v18;
    [m_ptr bounds];
    double v21 = v20;
    [m_ptr contentOffset];
    double v23 = v21 + v22;
    if (v23 >= v6) {
      double v6 = v23;
    }
    [m_ptr bounds];
    double v25 = v24;
    [m_ptr contentOffset];
    double v27 = v25 + v26;
    if (v25 + v26 < v8) {
      double v27 = v8;
    }
    if (!p_findOverlaysOutsideContentView->__engaged_) {
      goto LABEL_32;
    }
    double v49 = v27;
    double v28 = fmin(v19, 0.0);
    v29 = p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr;
    v54.origin.x = v10;
    v54.origin.y = v12;
    v54.size.CGFloat width = v14;
    v54.size.CGFloat height = v16;
    double MinX = CGRectGetMinX(v54);
    v55.origin.x = v10;
    v55.origin.y = v12;
    v55.size.CGFloat width = v14;
    v55.size.CGFloat height = v16;
    double v50 = v6;
    double v31 = v6 - CGRectGetMinX(v55);
    double v32 = v31 >= 0.0 ? v31 : 0.0;
    v56.origin.x = v10;
    v56.origin.y = v12;
    v56.size.CGFloat width = v14;
    v56.size.CGFloat height = v16;
    double v33 = CGRectGetMinY(v56) - v28;
    double v34 = v33 >= 0.0 ? v33 : 0.0;
    objc_msgSend(v29, "setFrame:", MinX, v28, v32, v34);
    if (!p_findOverlaysOutsideContentView->__engaged_) {
      goto LABEL_32;
    }
    v35 = p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr;
    v57.origin.x = v10;
    v57.origin.y = v12;
    v57.size.CGFloat width = v14;
    v57.size.CGFloat height = v16;
    double MaxX = CGRectGetMaxX(v57);
    v58.origin.x = v10;
    v58.origin.y = v12;
    v58.size.CGFloat width = v14;
    v58.size.CGFloat height = v16;
    double MinY = CGRectGetMinY(v58);
    v59.origin.x = v10;
    v59.origin.y = v12;
    v59.size.CGFloat width = v14;
    v59.size.CGFloat height = v16;
    double v37 = v50 - CGRectGetMaxX(v59);
    double v38 = v37 >= 0.0 ? v37 : 0.0;
    v60.origin.x = v10;
    v60.origin.y = v12;
    v60.size.CGFloat width = v14;
    v60.size.CGFloat height = v16;
    double v39 = v49 - CGRectGetMinY(v60);
    double v40 = v39 >= 0.0 ? v39 : 0.0;
    objc_msgSend(v35, "setFrame:", MaxX, MinY, v38, v40);
    if (!p_findOverlaysOutsideContentView->__engaged_) {
      goto LABEL_32;
    }
    double v41 = fmin(v51, 0.0);
    v42 = p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr;
    v61.origin.x = v10;
    v61.origin.y = v12;
    v61.size.CGFloat width = v14;
    v61.size.CGFloat height = v16;
    double MaxY = CGRectGetMaxY(v61);
    v62.origin.x = v10;
    v62.origin.y = v12;
    v62.size.CGFloat width = v14;
    v62.size.CGFloat height = v16;
    double v43 = CGRectGetMaxX(v62) - v41;
    double v44 = v43 >= 0.0 ? v43 : 0.0;
    v63.origin.x = v10;
    v63.origin.y = v12;
    v63.size.CGFloat width = v14;
    v63.size.CGFloat height = v16;
    double v45 = v49 - CGRectGetMaxY(v63);
    double v46 = v45 >= 0.0 ? v45 : 0.0;
    objc_msgSend(v42, "setFrame:", v41, MaxY, v44, v46);
    if (p_findOverlaysOutsideContentView->__engaged_)
    {
      v47 = p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr;
      v64.origin.x = v10;
      v64.origin.y = v12;
      v64.size.CGFloat width = v14;
      v64.size.CGFloat height = v16;
      CGRectGetMinX(v64);
      v65.origin.x = v10;
      v65.origin.y = v12;
      v65.size.CGFloat width = v14;
      v65.size.CGFloat height = v16;
      CGRectGetMaxY(v65);
      [v47 setFrame:v41];
    }
    else
    {
LABEL_32:
      __break(1u);
    }
  }
}

- (void)_updatePageLoadObserverState
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = *(void *)(a1 + 1768);
    if (v2)
    {
      if (*(unsigned char *)(a1 + 1760))
      {
        if ((*(_WORD *)(*(void *)(*(void *)(a1 + 416) + 32) + 64) & 4) != 0)
        {
          [(id)a1 bounds];
          double v8 = v7;
          double v10 = v9;
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)a1, "window"), "screen"), "bounds");
          double v13 = v8 * v10 / (v12 * v11);
          if (v12 == 0.0 || v11 == 0.0 || v13 < 0.7)
          {
            uint64_t v20 = qword_1EB358258;
            if (os_log_type_enabled((os_log_t)qword_1EB358258, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v21 = *(void *)(a1 + 1768);
              *(_DWORD *)buf = 134218499;
              *(void *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 2117;
              *(void *)&buf[14] = v21;
              *(_WORD *)&buf[22] = 2048;
              *(double *)&buf[24] = v13;
              objc_super v4 = "_updatePageLoadObserverState(%p): skipping event for host %{sensitive}@, screen area ratio %.2f";
              double v5 = v20;
              uint32_t v6 = 32;
              goto LABEL_10;
            }
          }
          else
          {
            if (qword_1EB359940 != -1) {
              dispatch_once(&qword_1EB359940, &__block_literal_global_971);
            }
            CGFloat v14 = qword_1EB359948;
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3321888768;
            v24[2] = __60__WKWebView_WKViewInternalIOS___updatePageLoadObserverState__block_invoke;
            v24[3] = &__block_descriptor_80_e8_32c74_ZTSKZ60__WKWebView_WKViewInternalIOS___updatePageLoadObserverState_E4__20_e5_v8__0l;
            double v15 = *(const void **)(a1 + 1768);
            if (v15) {
              CFRetain(*(CFTypeRef *)(a1 + 1768));
            }
            uint64_t v16 = *(void *)(API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*(void *)(*(void *)(a1 + 416) + 48) + 24))
                            + 48);
            long long v17 = *(_OWORD *)(v16 + 116);
            *(_OWORD *)buf = *(_OWORD *)(v16 + 100);
            *(_OWORD *)&buf[16] = v17;
            int v30 = *(_DWORD *)(v16 + 132);
            CFTypeRef cf = v15;
            if (v15)
            {
              CFRetain(v15);
              long long v26 = *(_OWORD *)buf;
              long long v27 = *(_OWORD *)&buf[16];
              int v28 = v30;
              dispatch_async(v14, v24);
              CFRelease(v15);
            }
            else
            {
              double v22 = (long long *)(v16 + 100);
              long long v23 = v22[1];
              long long v26 = *v22;
              long long v27 = v23;
              int v28 = *((_DWORD *)v22 + 8);
              dispatch_async(v14, v24);
            }
            double v18 = *(const void **)(a1 + 1768);
            *(void *)(a1 + 1768) = 0;
            if (v18) {
              CFRelease(v18);
            }
            CFTypeRef v19 = cf;
            CFTypeRef cf = 0;
            if (v19) {
              CFRelease(v19);
            }
          }
        }
        else
        {
          uint64_t v3 = qword_1EB358258;
          if (os_log_type_enabled((os_log_t)qword_1EB358258, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218243;
            *(void *)&buf[4] = a1;
            *(_WORD *)&buf[12] = 2117;
            *(void *)&buf[14] = v2;
            objc_super v4 = "_updatePageLoadObserverState(%p): skipping event for host %{sensitive}@, not visible";
LABEL_9:
            double v5 = v3;
            uint32_t v6 = 22;
LABEL_10:
            _os_log_debug_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEBUG, v4, buf, v6);
          }
        }
      }
      else
      {
        uint64_t v3 = qword_1EB358258;
        if (os_log_type_enabled((os_log_t)qword_1EB358258, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218243;
          *(void *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2117;
          *(void *)&buf[14] = v2;
          objc_super v4 = "_updatePageLoadObserverState(%p): skipping event for host %{sensitive}@, never accessed bflist";
          goto LABEL_9;
        }
      }
    }
  }
}

- (void)_updateDrawingAreaSize
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    uint64_t v3 = (int32x2_t *)*((void *)m_ptr + 29);
    if (v3)
    {
      [(WKWebView *)self bounds];
      v11[1] = v5;
      v11[2] = v6;
      v12.CGFloat width = v7;
      v12.CGFloat height = v8;
      WebCore::IntSize::IntSize((WebCore::IntSize *)&v13, &v12);
      v11[0] = 0;
      if (WebKit::DrawingAreaProxy::setSize(v3, &v13, v11, v9, v10))
      {
        if ([(WKWebView *)self usesStandardContentView]) {
          [self->_contentView.m_ptr setSizeChangedSinceLastVisibleContentRectUpdate:1];
        }
      }
    }
  }
}

- (void)_recalculateViewportSizesWithMinimumViewportInset:(UIEdgeInsets)a3 maximumViewportInset:(UIEdgeInsets)a4 throwOnInvalidInput:(BOOL)a5
{
  BOOL v5 = a5;
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v10 = a3.right;
  double v11 = a3.bottom;
  double v12 = a3.left;
  double v13 = a3.top;
  [(WKWebView *)self frame];
  v31[1] = v15;
  v32.CGFloat width = v16;
  v32.CGFloat height = v17;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v33, &v32);
  float v18 = left + right;
  float v19 = bottom + top + 0.0;
  float v21 = *((float *)&v33 + 1);
  float v20 = *(float *)&v33;
  *(float *)uint64_t v31 = *(float *)&v33 - v18;
  *((float *)v31 + 1) = *((float *)&v33 + 1) - v19;
  if ((float)(*(float *)&v33 - v18) <= 0.0 || (float)(*((float *)&v33 + 1) - v19) <= 0.0)
  {
    if (v18 > 0.0 && v19 > 0.0)
    {
      if (v5)
      {
        double v22 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v23 = *MEMORY[0x1E4F1C3C8];
        double v24 = @"maximumViewportInset cannot be larger than frame";
LABEL_16:
        [v22 raise:v23 format:v24];
        return;
      }
      double v25 = qword_1EB358758;
      if (os_log_type_enabled((os_log_t)qword_1EB358758, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1985F2000, v25, OS_LOG_TYPE_ERROR, "maximumViewportInset cannot be larger than frame", buf, 2u);
      }
    }
    v31[0] = v33;
    float v21 = *((float *)&v33 + 1);
    float v20 = *(float *)&v33;
  }
  float v26 = v12 + v10;
  float v27 = v11 + v13 + 0.0;
  *(float *)buf = v20 - v26;
  *(float *)&buf[4] = v21 - v27;
  if ((float)(v20 - v26) <= 0.0 || (float)(v21 - v27) <= 0.0)
  {
    if (v26 > 0.0 && v27 > 0.0)
    {
      if (v5)
      {
        double v22 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v23 = *MEMORY[0x1E4F1C3C8];
        double v24 = @"minimumViewportInset cannot be larger than frame";
        goto LABEL_16;
      }
      int v28 = qword_1EB358758;
      if (os_log_type_enabled((os_log_t)qword_1EB358758, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v29 = 0;
        _os_log_error_impl(&dword_1985F2000, v28, OS_LOG_TYPE_ERROR, "minimumViewportInset cannot be larger than frame", v29, 2u);
      }
    }
    *(void *)buf = v33;
  }
  if (!self->_overriddenLayoutParameters.__engaged_)
  {
    WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)self->_page.m_ptr, (const WebCore::FloatSize *)v31);
    WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)self->_page.m_ptr, (const WebCore::FloatSize *)buf);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WKWebView *)self frame];
  if (v9 == width && v8 == height)
  {
    v11.receiver = self;
    v11.super_class = (Class)WKWebView;
    -[WKWebView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  }
  else
  {
    [(WKWebView *)self _frameOrBoundsWillChange];
    v11.receiver = self;
    v11.super_class = (Class)WKWebView;
    -[WKWebView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    [(WKWebView *)self _frameOrBoundsMayHaveChanged];
    -[WKWebView _acquireResizeAssertionForReason:](self, "_acquireResizeAssertionForReason:", @"-[WKWebView setFrame:]");
  }
}

- (FloatSize)activeViewLayoutSize:(const CGRect *)a3
{
  p_overriddenLayoutParameters = &self->_overriddenLayoutParameters;
  if (!self->_overriddenLayoutParameters.__engaged_)
  {
    double width = a3->size.width;
    double height = a3->size.height;
    [(WKWebView *)self _scrollViewSystemContentInset];
    p_overriddenLayoutParameters = (optional<OverriddenLayoutParameters> *)v12;
    v12[0] = width - (v6 + v7);
    v12[1] = height - (v8 + v9);
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v13, (const CGSize *)p_overriddenLayoutParameters);
  float v10 = *(float *)v13;
  float v11 = *(float *)&v13[1];
  result.m_double height = v11;
  result.m_double width = v10;
  return result;
}

- (UIEdgeInsets)_scrollViewSystemContentInset
{
  [self->_scrollView.m_ptr _contentScrollInset];
  [(WKWebView *)self safeAreaInsets];
  [self->_scrollView.m_ptr _edgesApplyingSafeAreaInsetsToContentInset];

  UIEdgeInsetsAdd();
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (void)_updateLastKnownWindowSizeAndOrientation
{
  double v3 = objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene");
  objc_msgSend((id)objc_msgSend(v3, "coordinateSpace"), "bounds");
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  int64_t v8 = [v3 interfaceOrientation];
  self->_lastKnownWindowSizeAndOrientation.first.double width = v5;
  self->_lastKnownWindowSizeAndOrientation.first.double height = v7;
  self->_lastKnownWindowSizeAndOrientation.second = v8;
}

- (void)_setupScrollAndContentViews
{
  [(WKWebView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  float v11 = -[WKScrollView initWithFrame:]([WKScrollView alloc], "initWithFrame:", v3, v5, v7, v9);
  m_ptr = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = v11;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    float v11 = (WKScrollView *)self->_scrollView.m_ptr;
  }
  [(WKScrollView *)v11 setInternalDelegate:self];
  [self->_scrollView.m_ptr setBaseScrollViewDelegate:self];
  [self->_scrollView.m_ptr setBouncesZoom:1];
  if (objc_opt_respondsToSelector())
  {
    [self->_scrollView.m_ptr setTracksImmediatelyWhileDecelerating:0];
    [self->_scrollView.m_ptr _setAvoidsJumpOnInterruptedBounce:1];
  }
  double v13 = objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "panGestureRecognizer"), "allowedTouchTypes");
  CGFloat v14 = v13;
  if (v13) {
    CFRetain(v13);
  }
  uint64_t v15 = self->_scrollViewDefaultAllowedTouchTypes.m_ptr;
  self->_scrollViewDefaultAllowedTouchTypes.m_ptr = v14;
  if (v15) {
    CFRelease(v15);
  }
  [(WKWebView *)self _updateScrollViewInsetAdjustmentBehavior];
  [(WKWebView *)self addSubview:self->_scrollView.m_ptr];
  [(WKWebView *)self _dispatchSetDeviceOrientation:[(WKWebView *)self _deviceOrientationIgnoringOverrides]];
  [(WKWebView *)self _dispatchSetOrientationForMediaCapture:[(WKWebView *)self _deviceOrientationIgnoringOverrides]];
  objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "layer"), "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  objc_msgSend(self->_contentView.m_ptr, "setFrame:", v4, v6, v8, v10);
  [self->_scrollView.m_ptr addSubview:self->_contentView.m_ptr];
  CGFloat v16 = self->_scrollView.m_ptr;
  uint64_t v17 = [self->_contentView.m_ptr unscaledView];

  [v16 addSubview:v17];
}

- (int)_deviceOrientationIgnoringOverrides
{
  double v3 = (void *)[MEMORY[0x1E4F42738] sharedApplication];
  if ([v3 _appAdoptsUISceneLifecycle])
  {
    double v4 = (char *)objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene");
    if (!v4) {
      return (int)v4;
    }
    double v4 = (char *)[v4 interfaceOrientation];
  }
  else
  {
    double v4 = (char *)[v3 statusBarOrientation];
  }
  if ((unint64_t)(v4 - 2) > 2) {
    LODWORD(v4) = 0;
  }
  else {
    LODWORD(v4) = dword_1994F6750[(void)(v4 - 2)];
  }
  return (int)v4;
}

- (void)_dispatchSetDeviceOrientation:(int)a3
{
  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.lastSentDeviceOrientation.__engaged_
    || self->_perProcessState.lastSentDeviceOrientation.var0.__val_ != a3)
  {
    WebKit::WebPageProxy::setDeviceOrientation((WebKit::WebPageProxy *)self->_page.m_ptr, a3);
    p_perProcessState->lastSentDeviceOrientation.var0.__val_ = a3;
    p_perProcessState->lastSentDeviceOrientation.__engaged_ = 1;
  }
}

- (void)_dispatchSetOrientationForMediaCapture:(int)a3
{
  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.lastSentOrientationForMediaCapture.__engaged_
    || self->_perProcessState.lastSentOrientationForMediaCapture.var0.__val_ != a3)
  {
    WebKit::WebPageProxy::setOrientationForMediaCapture((unsigned int *)self->_page.m_ptr, *(uint64_t *)&a3, *(const WTF::StringImpl **)&a3);
    p_perProcessState->lastSentOrientationForMediaCapture.var0.__val_ = a3;
    p_perProcessState->lastSentOrientationForMediaCapture.__engaged_ = 1;
  }
}

- (void)_updateScrollViewInsetAdjustmentBehavior
{
  if (([self->_scrollView.m_ptr _contentInsetAdjustmentBehaviorWasExternallyOverridden] & 1) == 0)
  {
    m_ptr = self->_scrollView.m_ptr;
    if ([(WKWebView *)self _safeAreaShouldAffectObscuredInsets]) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
    [m_ptr _setContentInsetAdjustmentBehaviorInternal:v4];
  }
}

- (BOOL)_isBackground
{
  if ([(WKWebView *)self usesStandardContentView] || (objc_opt_respondsToSelector() & 1) == 0)
  {
    m_ptr = self->_contentView.m_ptr;
    return [m_ptr isBackground];
  }
  else
  {
    double v3 = self->_customContentView.m_ptr;
    return objc_msgSend(v3, "web_isBackground");
  }
}

- (BOOL)_safeAreaShouldAffectObscuredInsets
{
  BOOL v3 = [(WKWebView *)self usesStandardContentView];
  if (v3) {
    LOBYTE(v3) = self->_perProcessState.avoidsUnsafeArea;
  }
  return v3;
}

- (BOOL)usesStandardContentView
{
  return !self->_customContentView.m_ptr && self->_passwordView.m_ptr == 0;
}

- (BOOL)_mayAutomaticallyShowVideoPictureInPicture
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && (BOOL v3 = (WebKit::VideoPresentationManagerProxy *)*((void *)m_ptr + 54)) != 0) {
    return WebKit::VideoPresentationManagerProxy::mayAutomaticallyShowVideoPictureInPicture(v3);
  }
  else {
    return 0;
  }
}

- (BOOL)_isShowingVideoPictureInPicture
{
  m_ptr = self->_page.m_ptr;
  return m_ptr
      && (BOOL v3 = (WebKit::VideoPresentationManagerProxy *)*((void *)m_ptr + 54)) != 0
      && WebKit::VideoPresentationManagerProxy::hasMode(v3, 2);
}

- (BOOL)_isRetainingActiveFocusedState
{
  return self->_focusPreservationCount || self->_activeFocusedStateRetainCount != 0;
}

- (BOOL)_contentViewIsFirstResponder
{
  id v2 = [(WKWebView *)self _currentContentView];

  return [v2 isFirstResponder];
}

- (NakedPtr<WebKit::WebPageProxy>)_page
{
  void *v2 = self->_page.m_ptr;
  return (NakedPtr<WebKit::WebPageProxy>)self;
}

- (BOOL)_haveSetObscuredInsets
{
  return self->_haveSetObscuredInsets;
}

- (void)scrollViewDidZoom:(id)a3
{
  if (![(WKWebView *)self usesStandardContentView]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_customContentView.m_ptr, "web_scrollViewDidZoom:", a3);
  }
  [(WKWebView *)self _updateScrollViewBackground];

  [(WKWebView *)self _scheduleVisibleContentRectUpdateAfterScrollInView:a3];
}

void __76__WKWebView_WKViewInternalIOS___addUpdateVisibleContentRectPreCommitHandler__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = *(unsigned char **)(a1 + 32);
  if ([v1 _isValid])
  {
    [v1 _updateVisibleContentRects];
    v1[854] = 0;
  }
  else
  {
    id v2 = qword_1EB358730;
    if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134217984;
      uint64_t v4 = v1;
      _os_log_impl(&dword_1985F2000, v2, OS_LOG_TYPE_DEFAULT, "In CATransaction preCommitHandler, WKWebView %p is invalid", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (int)_webProcessIdentifier
{
  int result = [(WKWebView *)self _isValid];
  if (result)
  {
    m_ptr = self->_page.m_ptr;
    if (*((unsigned char *)m_ptr + 801)) {
      return 0;
    }
    uint64_t v5 = *(void *)(*((void *)m_ptr + 32) + 136);
    if (!v5) {
      return 0;
    }
    else {
      return *(_DWORD *)(v5 + 108);
    }
  }
  return result;
}

- (BOOL)_isValid
{
  m_ptr = self->_page.m_ptr;
  return m_ptr && !*((unsigned char *)m_ptr + 801) && *((unsigned char *)m_ptr + 800) != 0;
}

- (void)_updateVisibleContentRects
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  uint64_t m_storage = self->_viewStabilityWhenVisibleContentRectUpdateScheduled.m_storage;
  uint64_t v4 = (WTF::MonotonicTime *)[(WKWebView *)self usesStandardContentView];
  if ((v4 & 1) == 0)
  {
    m_ptr = self->_passwordView.m_ptr;
    [(WKWebView *)self bounds];
    objc_msgSend(m_ptr, "setFrame:");
    objc_msgSend(self->_customContentView.m_ptr, "web_computedContentInsetDidChange");
    self->_perProcessState.didDeferUpdateVisibleContentRectsForAnyReason = 1;
    uint64_t v12 = qword_1EB358730;
    if (!os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v16 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v16;
    CGFloat v14 = "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - usesStandardContentView is NO, bailing";
    goto LABEL_11;
  }
  WTF::MonotonicTime::now(v4);
  double v6 = v5;
  p_timeOfFirstVisibleContentRectUpdateWithPendingCommit = &self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit;
  if (self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
  {
    double v8 = v5 - p_timeOfFirstVisibleContentRectUpdateWithPendingCommit->var0.__val_.m_value;
    if (v8 > 5.0)
    {
      double v9 = qword_1EB358730;
      if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
        unint64_t m_identifier = self->_perProcessState.lastTransactionID.m_identifier;
        *(_DWORD *)buf = 134218752;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2048;
        *(double *)&buf[24] = v8;
        *(_WORD *)&unsigned char buf[32] = 2048;
        unint64_t v141 = m_identifier;
        _os_log_impl(&dword_1985F2000, v9, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - have not received a commit %.2fs after visible content rect update; lastTransactionID %llu",
          buf,
          0x2Au);
      }
    }
  }
  if (self->_perProcessState.invokingUIScrollViewDelegateCallback)
  {
    *(_WORD *)&self->_perProcessState.didDeferUpdateVisibleContentRectsForUIScrollViewDelegateCallback = 257;
    uint64_t v12 = qword_1EB358730;
    if (!os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    uint64_t v13 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    *(_DWORD *)buf = 134218240;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v13;
    CGFloat v14 = "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - _invokingUIScrollViewDelegateCallback is YES, bailing";
LABEL_11:
    uint64_t v17 = v12;
    uint32_t v18 = 22;
LABEL_12:
    _os_log_impl(&dword_1985F2000, v17, OS_LOG_TYPE_DEFAULT, v14, buf, v18);
    return;
  }
  if (!CGRectIsEmpty(self->_perProcessState.animatedResizeOldBounds)) {
    [(WKWebView *)self _cancelAnimatedResize];
  }
  if (![(WKWebView *)self _shouldDeferGeometryUpdates]
    && (!self->_perProcessState.needsResetViewStateAfterCommitLoadForMainFrame
     || [self->_contentView.m_ptr sizeChangedSinceLastVisibleContentRectUpdate])
    && ([self->_scrollView.m_ptr isZoomBouncing] & 1) == 0
    && !self->_perProcessState.currentlyAdjustingScrollViewInsetsForKeyboard)
  {
    if (self->_perProcessState.didDeferUpdateVisibleContentRectsForAnyReason)
    {
      float v27 = qword_1EB358730;
      if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v28;
        _os_log_impl(&dword_1985F2000, v27, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - performing first visible content rect update after deferring updates", buf, 0x16u);
      }
    }
    *(_WORD *)&self->_perProcessState.didDeferUpdateVisibleContentRectsForUIScrollViewDelegateCallback = 0;
    self->_perProcessState.didDeferUpdateVisibleContentRectsForUnstableScrollView = 0;
    [(WKWebView *)self _updateScrollViewContentInsetsIfNecessary];
    [(WKWebView *)self _visibleContentRect];
    double v134 = v30;
    double v135 = v29;
    double v132 = v32;
    double v133 = v31;
    [(WKWebView *)self _computedObscuredInset];
    double v35 = v34;
    double v37 = v36;
    double v38 = v33;
    double v40 = v39;
    if (!self->_haveSetObscuredInsets) {
      double v38 = v33 - self->_totalScrollViewBottomInsetAdjustmentForKeyboard;
    }
    double v41 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v41)
    {
      [v41 affineTransform];
      double v42 = *(double *)buf;
    }
    else
    {
      double v42 = 0.0;
    }
    double v137 = v42;
    [(WKWebView *)self bounds];
    double v130 = v44 - (v37 + v40);
    double v131 = v37 + v43;
    double v136 = v35 + v45;
    double v129 = v46 - (v35 + v38);
    if (self->_perProcessState.frozenUnobscuredContentRect.__engaged_)
    {
      CGSize size = self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.size;
      *(_OWORD *)buf = *(_OWORD *)&self->_perProcessState.frozenUnobscuredContentRect.var0.__null_state_;
      *(CGSize *)&buf[16] = size;
    }
    else
    {
      -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr);
      *(void *)buf = v48;
      *(void *)&uint8_t buf[8] = v49;
      *(void *)&buf[16] = v50;
      *(void *)&buf[24] = v51;
    }
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v139, (const CGRect *)buf);
    if (([self->_contentView.m_ptr sizeChangedSinceLastVisibleContentRectUpdate] & 1) == 0)
    {
      [(WKWebView *)self _contentBoundsExtendedForRubberbandingWithScale:v137];
      *(void *)buf = v52;
      *(void *)&uint8_t buf[8] = v53;
      *(void *)&buf[16] = v54;
      *(void *)&buf[24] = v55;
      WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v138, (const CGRect *)buf);
      WebCore::FloatRect::intersect((WebCore::FloatRect *)v139, (const WebCore::FloatRect *)v138);
    }
    -[WKWebView currentlyVisibleContentInsetsWithScale:obscuredInsets:](self, "currentlyVisibleContentInsetsWithScale:obscuredInsets:", v137, v35, v37, v38, v40);
    uint64_t v127 = v57;
    uint64_t v128 = v56;
    uint64_t v125 = v59;
    uint64_t v126 = v58;
    if (!m_storage)
    {
      v88 = self->_page.m_ptr;
      v89 = (WebKit::RemoteScrollingCoordinatorProxyIOS *)*((void *)v88 + 31);
      if (v89)
      {
        if (WebKit::RemoteScrollingCoordinatorProxyIOS::hasActiveSnapPoint(*((WebKit::RemoteScrollingCoordinatorProxyIOS **)v88
                                                                            + 31)))
        {
          [self->_scrollView.m_ptr contentOffset];
          double v91 = v90;
          double v93 = v92;
          *(double *)buf = v90;
          *(double *)&uint8_t buf[8] = v92;
          double v96 = WebKit::RemoteScrollingCoordinatorProxyIOS::nearestActiveContentInsetAdjustedSnapOffset(v89, v136, (const CGPoint *)buf);
          double v97 = v95;
          if (v96 != v91 || v95 != v93)
          {
            v98 = self->_scrollView.m_ptr;
            if (v98) {
              v94 = (WTF::RunLoop *)CFRetain(self->_scrollView.m_ptr);
            }
            WTF::RunLoop::main(v94);
            if (v98) {
              CFRetain(v98);
            }
            uint64_t v99 = WTF::fastMalloc((WTF *)0x20);
            *(void *)uint64_t v99 = &unk_1EE9CD668;
            *(void *)(v99 + 8) = v98;
            *(double *)(v99 + 16) = v96;
            *(double *)(v99 + 24) = v97;
            v138[0] = v99;
            WTF::RunLoop::dispatch();
            uint64_t v100 = v138[0];
            v138[0] = 0;
            if (!v100)
            {
              if (!v98) {
                goto LABEL_37;
              }
              goto LABEL_51;
            }
            (*(void (**)(uint64_t))(*(void *)v100 + 8))(v100);
            if (v98) {
LABEL_51:
            }
              CFRelease(v98);
          }
        }
      }
    }
LABEL_37:
    CGRect v60 = self->_contentView.m_ptr;
    WebCore::FloatRect::operator CGRect();
    double v123 = v62;
    double v124 = v61;
    double v121 = v64;
    double v122 = v63;
    CGFloat left = self->_obscuredInsets.left;
    CGFloat top = self->_obscuredInsets.top;
    CGFloat right = self->_obscuredInsets.right;
    CGFloat bottom = self->_obscuredInsets.bottom;
    [(WKWebView *)self _computedUnobscuredSafeAreaInset];
    uint64_t v115 = v66;
    uint64_t v116 = v65;
    uint64_t v113 = v68;
    uint64_t v114 = v67;
    CGFloat y = self->_inputViewBoundsInWindow.origin.y;
    CGFloat x = self->_inputViewBoundsInWindow.origin.x;
    CGFloat height = self->_inputViewBoundsInWindow.size.height;
    CGFloat width = self->_inputViewBoundsInWindow.size.width;
    [self->_scrollView.m_ptr minimumZoomScale];
    uint64_t v70 = v69;
    v71 = (void *)[(WKWebView *)self _scroller];
    v72 = v71;
    if (v71)
    {
      [v71 contentInset];
      double v74 = v73;
      double v76 = v75;
      double v78 = v77;
      double v80 = v79;
      [v72 contentSize];
      double v82 = v81;
      double v84 = v83;
      [v72 bounds];
      BOOL v87 = v78 + v74 + v84 > v86 || v80 + v76 + v82 > v85;
    }
    else
    {
      BOOL v87 = 0;
    }
    objc_msgSend(v60, "didUpdateVisibleRect:unobscuredRect:contentInsets:unobscuredRectInScrollViewCoordinates:obscuredInsets:unobscuredSafeAreaInsets:inputViewBounds:scale:minimumScale:viewStability:enclosedInScrollableAncestorView:sendEvenIfUnchanged:", m_storage, v87, self->_alwaysSendNextVisibleContentRectUpdate, v135, v134, v133, v132, v124, v123, v122, v121, v128, v127, v126, v125, *(void *)&v131,
      *(void *)&v136,
      *(void *)&v130,
      *(void *)&v129,
      *(void *)&top,
      *(void *)&left,
      *(void *)&bottom,
      *(void *)&right,
      v116,
      v115,
      v114,
      v113,
      *(void *)&x,
      *(void *)&y,
      *(void *)&width,
      *(void *)&height,
      *(void *)&v137,
      v70);
    p_visibleContentRectUpdateCallbacks = &self->_visibleContentRectUpdateCallbacks;
    while (1)
    {
      m_CGSize size = self->_visibleContentRectUpdateCallbacks.m_size;
      if (!m_size) {
        break;
      }
      uint64_t v103 = (uint64_t)p_visibleContentRectUpdateCallbacks->m_buffer + 8 * m_size;
      v104 = *(void (***)(void))(v103 - 8);
      *(void *)(v103 - 8) = 0;
      uint64_t v105 = self->_visibleContentRectUpdateCallbacks.m_size;
      if (!v105)
      {
        __break(0xC471u);
        return;
      }
      unsigned int v106 = v105 - 1;
      _Block_release(*((const void **)p_visibleContentRectUpdateCallbacks->m_buffer + v105 - 1));
      self->_visibleContentRectUpdateCallbacks.m_CGSize size = v106;
      v104[2](v104);
      _Block_release(v104);
    }
    double v107 = v6 - self->_timeOfRequestForVisibleContentRectUpdate.m_value;
    if (v107 > 1.0)
    {
      v108 = qword_1EB358730;
      if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v107;
        _os_log_impl(&dword_1985F2000, v108, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _updateVisibleContentRects:] finally ran %.2fs after being scheduled", buf, 0x16u);
      }
    }
    self->_alwaysSendNextVisibleContentRectUpdate = 0;
    self->_timeOfLastVisibleContentRectUpdate.m_value = v6;
    if (!self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
    {
      self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_ = 1;
      p_timeOfFirstVisibleContentRectUpdateWithPendingCommit->var0.__val_.m_value = v6;
    }
    return;
  }
  *(_WORD *)&self->_perProcessState.didDeferUpdateVisibleContentRectsForAnyReason = 257;
  uint64_t v19 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    BOOL v21 = [(WKWebView *)self _shouldDeferGeometryUpdates];
    int dynamicViewportUpdateMode = self->_perProcessState.dynamicViewportUpdateMode;
    BOOL needsResetViewStateAfterCommitLoadForMainFrame = self->_perProcessState.needsResetViewStateAfterCommitLoadForMainFrame;
    int v24 = [self->_contentView.m_ptr sizeChangedSinceLastVisibleContentRectUpdate];
    int v25 = [self->_scrollView.m_ptr isZoomBouncing];
    BOOL currentlyAdjustingScrollViewInsetsForKeyboard = self->_perProcessState.currentlyAdjustingScrollViewInsetsForKeyboard;
    *(_DWORD *)buf = 134219776;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v20;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v21;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = dynamicViewportUpdateMode;
    LOWORD(v141) = 1024;
    *(_DWORD *)((char *)&v141 + 2) = needsResetViewStateAfterCommitLoadForMainFrame;
    HIWORD(v141) = 1024;
    int v142 = v24;
    __int16 v143 = 1024;
    int v144 = v25;
    __int16 v145 = 1024;
    BOOL v146 = currentlyAdjustingScrollViewInsetsForKeyboard;
    CGFloat v14 = "%p (pageProxyID=%llu) -[WKWebView _updateVisibleContentRects:] - scroll view state is non-stable, bailing (sho"
          "uldDeferGeometryUpdates %d, dynamicViewportUpdateMode %d, needsResetViewStateAfterCommitLoadForMainFrame %d, s"
          "izeChangedSinceLastVisibleContentRectUpdate %d, [_scrollView isZoomBouncing] %d, currentlyAdjustingScrollViewI"
          "nsetsForKeyboard %d)";
    uint64_t v17 = v19;
    uint32_t v18 = 58;
    goto LABEL_12;
  }
}

- (id)_currentContentView
{
  if (self->_customContentView.m_ptr) {
    return (id)objc_msgSend(self->_customContentView.m_ptr, "web_contentView");
  }
  else {
    return self->_contentView.m_ptr;
  }
}

- (UIEdgeInsets)currentlyVisibleContentInsetsWithScale:(double)a3 obscuredInsets:(UIEdgeInsets)a4
{
  double left = a4.left;
  double top = a4.top;
  objc_msgSend(self->_scrollView.m_ptr, "contentInset", a3, a4.top, a4.left, a4.bottom, a4.right);
  double v7 = v6;
  double v9 = v8;
  double v42 = v11;
  double v43 = v10;
  [self->_scrollView.m_ptr bounds];
  double v13 = v12;
  double v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  [self->_scrollView.m_ptr contentSize];
  double v21 = v20;
  double v40 = v22;
  double v23 = left + v13;
  v45.origin.CGFloat x = v13;
  v45.origin.CGFloat y = v15;
  v45.size.CGFloat width = v17;
  v45.size.CGFloat height = v19;
  double Height = CGRectGetHeight(v45);
  v46.origin.CGFloat x = v13;
  v46.origin.CGFloat y = v15;
  v46.size.CGFloat width = v17;
  v46.size.CGFloat height = v19;
  double Width = CGRectGetWidth(v46);
  double v25 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  if (v9 <= 0.0)
  {
    double v26 = a3;
  }
  else
  {
    double v26 = a3;
    if (v23 < 0.0)
    {
      double v27 = -v23;
      if (v9 < -v23) {
        double v27 = v9;
      }
      double v25 = v27 / a3;
    }
  }
  double v28 = top + v15;
  double v29 = v21 - Width;
  double v30 = *MEMORY[0x1E4F437F8];
  if (v7 > 0.0 && v28 < 0.0)
  {
    double v31 = -v28;
    if (v7 < -v28) {
      double v31 = v7;
    }
    double v30 = v31 / v26;
  }
  double v32 = v40 - Height;
  if (v42 <= 0.0 || v23 <= v29)
  {
    double v34 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  else
  {
    double v35 = v23 - v29;
    if (v42 < v35) {
      double v35 = v42;
    }
    double v34 = v35 / v26;
  }
  if (v43 <= 0.0 || v28 <= v32)
  {
    double v37 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  }
  else
  {
    double v38 = v28 - v32;
    if (v43 < v38) {
      double v38 = v43;
    }
    double v37 = v38 / v26;
  }
  result.CGFloat right = v34;
  result.CGFloat bottom = v37;
  result.double left = v25;
  result.double top = v30;
  return result;
}

- (CGRect)_visibleContentRect
{
  if (self->_perProcessState.frozenVisibleContentRect.__engaged_)
  {
    CGFloat x = self->_perProcessState.frozenVisibleContentRect.var0.__val_.origin.x;
    CGFloat y = self->_perProcessState.frozenVisibleContentRect.var0.__val_.origin.y;
    CGFloat width = self->_perProcessState.frozenVisibleContentRect.var0.__val_.size.width;
    CGFloat height = self->_perProcessState.frozenVisibleContentRect.var0.__val_.size.height;
  }
  else
  {
    [(WKWebView *)self bounds];
    -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr);
    CGFloat x = v7;
    CGFloat y = v8;
    CGFloat width = v9;
    CGFloat height = v10;
    double v11 = [(WKWebView *)self _enclosingViewForExposedRectComputation];
    if (v11)
    {
      [(WKWebView *)self _visibleRectInEnclosingView:v11];
      -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr);
      v23.origin.CGFloat x = v12;
      v23.origin.CGFloat y = v13;
      v23.size.CGFloat width = v14;
      v23.size.CGFloat height = v15;
      v20.origin.CGFloat x = x;
      v20.origin.CGFloat y = y;
      v20.size.CGFloat width = width;
      v20.size.CGFloat height = height;
      CGRect v21 = CGRectIntersection(v20, v23);
      CGFloat x = v21.origin.x;
      CGFloat y = v21.origin.y;
      CGFloat width = v21.size.width;
      CGFloat height = v21.size.height;
    }
  }
  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)_visibleRectInEnclosingView:(id)a3
{
  if (a3)
  {
    [a3 bounds];
    objc_msgSend(a3, "convertRect:toView:", self);
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(WKWebView *)self bounds];
    v24.origin.CGFloat x = v13;
    v24.origin.CGFloat y = v14;
    v24.size.CGFloat width = v15;
    v24.size.CGFloat height = v16;
    v21.origin.CGFloat x = v6;
    v21.origin.CGFloat y = v8;
    v21.size.CGFloat width = v10;
    v21.size.CGFloat height = v12;
    if (CGRectIntersectsRect(v21, v24))
    {
      [(WKWebView *)self bounds];
      v25.origin.CGFloat x = v17;
      v25.origin.CGFloat y = v18;
      v25.size.CGFloat width = v19;
      v25.size.CGFloat height = v20;
      v22.origin.CGFloat x = v6;
      v22.origin.CGFloat y = v8;
      v22.size.CGFloat width = v10;
      v22.size.CGFloat height = v12;
      return CGRectIntersection(v22, v25);
    }
    else
    {
      return *(CGRect *)*(void *)&MEMORY[0x1E4F1DB28];
    }
  }
  else
  {
    [(WKWebView *)self bounds];
  }
  return result;
}

- (void)_updateScrollViewForTransaction:(const void *)a3
{
  m_ptr = self->_page.m_ptr;
  [self->_contentView.m_ptr frame];
  uint64_t v8 = 764;
  if (!*((unsigned char *)m_ptr + 768)) {
    uint64_t v8 = 760;
  }
  objc_msgSend(self->_scrollView.m_ptr, "_setContentSizePreservingContentOffsetDuringRubberband:", floor(v6 * *(float *)((char *)m_ptr + v8)) / *(float *)((char *)m_ptr + v8), floor(v7 * *(float *)((char *)m_ptr + v8)) / *(float *)((char *)m_ptr + v8));
  p_overriddenZoomScaleParameters = (optional<OverriddenZoomScaleParameters> *)((char *)a3 + 208);
  p_maximumZoomScale = (double *)((char *)a3 + 216);
  p_allowUserScaling = (BOOL *)a3 + 267;
  if (self->_overriddenZoomScaleParameters.__engaged_)
  {
    p_allowUserScaling = &self->_overriddenZoomScaleParameters.var0.__val_.allowUserScaling;
    p_maximumZoomScale = &self->_overriddenZoomScaleParameters.var0.__val_.maximumZoomScale;
    p_overriddenZoomScaleParameters = &self->_overriddenZoomScaleParameters;
  }
  double v12 = *p_maximumZoomScale;
  BOOL v13 = *p_allowUserScaling;
  [self->_scrollView.m_ptr setMinimumZoomScale:p_overriddenZoomScaleParameters->var0.__val_.minimumZoomScale];
  [self->_scrollView.m_ptr setMaximumZoomScale:v12];
  [self->_scrollView.m_ptr _setZoomEnabledInternal:v13];
  if ([self->_scrollView.m_ptr showsHorizontalScrollIndicator]
    && [self->_scrollView.m_ptr showsVerticalScrollIndicator])
  {
    [self->_scrollView.m_ptr setShowsHorizontalScrollIndicator:WebCore::ScrollingTree::mainFrameScrollbarWidth(*(WebCore::ScrollingTree **)(*((void *)self->_page.m_ptr+ 31)+ 24)) != 2];
    [self->_scrollView.m_ptr setShowsVerticalScrollIndicator:WebCore::ScrollingTree::mainFrameScrollbarWidth(*(WebCore::ScrollingTree **)(*((void *)self->_page.m_ptr+ 31)+ 24)) != 2];
  }
  int v14 = WebCore::ScrollingTree::mainFrameHorizontalOverscrollBehavior(*(WebCore::ScrollingTree **)(*((void *)self->_page.m_ptr + 31)
                                                                                                 + 24));
  int v15 = WebCore::ScrollingTree::mainFrameVerticalOverscrollBehavior(*(WebCore::ScrollingTree **)(*((void *)self->_page.m_ptr
                                                                                                 + 31)
                                                                                               + 24));
  WebKit::ScrollingTreeScrollingNodeDelegateIOS::updateScrollViewForOverscrollBehavior(self->_scrollView.m_ptr, v14, v15, 0);
  IsEmptCGFloat y = CGRectIsEmpty(self->_inputViewBoundsInWindow);
  BOOL v17 = IsEmpty;
  double v18 = *((double *)a3 + 25);
  float v19 = v18;
  double v20 = *((double *)a3 + 28);
  float v21 = v20;
  BOOL v22 = !WebKit::scalesAreEssentiallyEqual((WebKit *)IsEmpty, v19, v21);
  BOOL v23 = v18 > v20 && v22;
  CGRect v24 = self->_page.m_ptr;
  if (!self->_overriddenLayoutParameters.__engaged_
    || ((CGRect v25 = (float *)*((void *)v24 + 4), v26 = v25[204], v27 = v25[205], v25[211] == v26)
      ? (BOOL v28 = v25[212] == v27)
      : (BOOL v28 = 0),
        v28))
  {
    BOOL v31 = 0;
  }
  else
  {
    float v29 = v25[577];
    BOOL v30 = v26 == v25[576];
    BOOL v31 = v27 == v29 && v30;
  }
  if (WebKit::RemoteScrollingCoordinatorProxy::hasScrollableOrZoomedMainFrame(*((WebKit::RemoteScrollingCoordinatorProxy **)v24
                                                                               + 31))
    || !v17
    || v23
    || v31)
  {
    double v32 = self->_scrollViewDefaultAllowedTouchTypes.m_ptr;
  }
  else
  {
    double v32 = (void *)MEMORY[0x1E4F1CBF0];
  }
  objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "panGestureRecognizer"), "setAllowedTouchTypes:", v32);
  [self->_scrollView.m_ptr _setScrollEnabledInternal:1];
  if (!*((unsigned char *)a3 + 266)
    && ([self->_scrollView.m_ptr isZooming] & 1) == 0
    && ([self->_scrollView.m_ptr isZoomBouncing] & 1) == 0
    && (objc_msgSend(self->_scrollView.m_ptr, "_wk_isZoomAnimating") & 1) == 0)
  {
    double v33 = (WebKit *)[self->_scrollView.m_ptr zoomScale];
    *(float *)&double v34 = v34;
    float v35 = *((double *)a3 + 25);
    if (!WebKit::scalesAreEssentiallyEqual(v33, *(float *)&v34, v35))
    {
      [self->_scrollView.m_ptr contentOffset];
      double v37 = v36 * *((double *)a3 + 25);
      [self->_scrollView.m_ptr zoomScale];
      CGFloat v39 = v37 / v38;
      [self->_scrollView.m_ptr setZoomScale:*((double *)a3 + 25)];
      double v40 = (UIScrollView *)self->_scrollView.m_ptr;
      [(UIScrollView *)v40 contentOffset];
      v42.CGFloat x = v41;
      v42.CGFloat y = v39;
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v43, &v42);
      changeContentOffsetBoundedInValidRange(v40);
    }
  }
}

- (void)_scheduleVisibleContentRectUpdateAfterScrollInView:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (WTF::MonotonicTime *)[(WKWebView *)self _viewStabilityState:a3];
  self->_viewStabilityWhenVisibleContentRectUpdateScheduled.uint64_t m_storage = v4;
  if (self->_perProcessState.hasScheduledVisibleRectUpdate)
  {
    WTF::MonotonicTime::now(v4);
    double v6 = v5;
    double v7 = v5 - self->_timeOfRequestForVisibleContentRectUpdate.m_value;
    if (v7 > 1.0)
    {
      uint64_t v8 = qword_1EB358730;
      if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
      {
        double v9 = v6 - self->_timeOfLastVisibleContentRectUpdate.m_value;
        *(_DWORD *)int v14 = 134218752;
        *(void *)&v14[4] = self;
        __int16 v15 = 2048;
        double v16 = v7;
        __int16 v17 = 2048;
        double v18 = v9;
        __int16 v19 = 1024;
        BOOL v20 = [(WKWebView *)self _isValid];
        _os_log_impl(&dword_1985F2000, v8, OS_LOG_TYPE_DEFAULT, "-[WKWebView %p _scheduleVisibleContentRectUpdateAfterScrollInView]: hasScheduledVisibleRectUpdate is true but haven't updated visible content rects for %.2fs (last update was %.2fs ago) - valid %d", v14, 0x26u);
      }
    }
  }
  else
  {
    self->_perProcessState.hasScheduledVisibleRectUpdate = 1;
    WTF::MonotonicTime::now(v4);
    self->_timeOfRequestForVisibleContentRectUpdate.m_value = v10;
    double v11 = (WTF::RunLoop *)[MEMORY[0x1E4F39CF8] currentPhase];
    if ((v11 + 1) > 1)
    {
      WTF::RunLoop::main(v11);
      CFRetain(self);
      double v12 = (void *)WTF::fastMalloc((WTF *)0x10);
      *double v12 = &unk_1EE9CD640;
      v12[1] = self;
      *(void *)int v14 = v12;
      WTF::RunLoop::dispatch();
      uint64_t v13 = *(void *)v14;
      *(void *)int v14 = 0;
      if (v13) {
        (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
      }
    }
    else
    {
      [(WKWebView *)self _addUpdateVisibleContentRectPreCommitHandler];
    }
  }
}

- (OptionSet<WebKit::ViewStabilityFlag>)_viewStabilityState:(id)a3
{
  unsigned __int8 v5 = ([a3 isDragging] & 1) != 0 || objc_msgSend(a3, "isZooming");
  if (([a3 isDecelerating] & 1) != 0
    || (objc_msgSend(a3, "_wk_isZoomAnimating") & 1) != 0
    || (objc_msgSend(a3, "_wk_isScrollAnimating") & 1) != 0
    || [a3 isZoomBouncing])
  {
    v5 |= 2u;
  }
  if (self->_scrollView.m_ptr == a3 && self->_isChangingObscuredInsetsInteractively) {
    v5 |= 8u;
  }
  if ([(WKWebView *)self _scrollViewIsRubberBanding:a3]) {
    v6.uint64_t m_storage = v5 | 4;
  }
  else {
    v6.uint64_t m_storage = v5;
  }
  double v7 = [(WKWebView *)self _stableStateOverride];
  if (v7)
  {
    if ([(NSNumber *)v7 BOOLValue]) {
      return (OptionSet<WebKit::ViewStabilityFlag>)0;
    }
    else {
      return (OptionSet<WebKit::ViewStabilityFlag>)(v6.m_storage | 0x10);
    }
  }
  return v6;
}

- (BOOL)_scrollViewIsRubberBanding:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v5 = 764;
  if (!*((unsigned char *)m_ptr + 768)) {
    uint64_t v5 = 760;
  }
  float v6 = *(float *)((char *)m_ptr + v5);
  [a3 contentOffset];
  double x = v12.x;
  double y = v12.y;
  contentOffsetBoundedInValidRange((UIScrollView *)a3, v12);
  return fabs(x * v6 - v10 * v6) >= 0.00000011920929 || fabs(y * v6 - v9 * v6) >= 0.00000011920929;
}

- (NSNumber)_stableStateOverride
{
  return 0;
}

- (BOOL)_updateScrollViewContentInsetsIfNecessary
{
  return 0;
}

- (CGRect)_contentBoundsExtendedForRubberbandingWithScale:(double)a3
{
  [self->_scrollView.m_ptr contentOffset];
  double x = v17.x;
  double y = v17.y;
  contentOffsetBoundedInValidRange((UIScrollView *)self->_scrollView.m_ptr, v17);
  double v8 = (x - v7) / a3;
  double v10 = (y - v9) / a3;
  [self->_contentView.m_ptr bounds];
  double v15 = v8 + v13;
  if (v8 <= 0.0) {
    double v15 = v13;
  }
  double v16 = v13 - v8;
  if (v8 < 0.0) {
    double v11 = v8 + v11;
  }
  else {
    double v16 = v15;
  }
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      double v14 = v10 + v14;
    }
  }
  else
  {
    double v12 = v10 + v12;
    double v14 = v14 - v10;
  }
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v16;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (UIEdgeInsets)_computedUnobscuredSafeAreaInset
{
  if (self->_haveSetUnobscuredSafeAreaInsets)
  {
    p_unobscuredSafeAreaInsets = &self->_unobscuredSafeAreaInsets;
  }
  else
  {
    if (![(WKWebView *)self _safeAreaShouldAffectObscuredInsets])
    {
      [(WKWebView *)self safeAreaInsets];
      goto LABEL_7;
    }
    p_unobscuredSafeAreaInsets = (UIEdgeInsets *)MEMORY[0x1E4F437F8];
  }
  double top = p_unobscuredSafeAreaInsets->top;
  double left = p_unobscuredSafeAreaInsets->left;
  double bottom = p_unobscuredSafeAreaInsets->bottom;
  double right = p_unobscuredSafeAreaInsets->right;
LABEL_7:
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)_computedObscuredInset
{
  if ((WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    [(WKWebView *)self _computedContentInset];
LABEL_5:
    CGFloat top = v7;
    CGFloat left = v8;
    CGFloat bottom = v9;
    CGFloat right = v10;
    goto LABEL_6;
  }
  if (!self->_haveSetObscuredInsets)
  {
    BOOL v15 = [(WKWebView *)self _safeAreaShouldAffectObscuredInsets];
    CGFloat top = *MEMORY[0x1E4F437F8];
    CGFloat left = *(double *)(MEMORY[0x1E4F437F8] + 8);
    CGFloat bottom = *(double *)(MEMORY[0x1E4F437F8] + 16);
    CGFloat right = *(double *)(MEMORY[0x1E4F437F8] + 24);
    if (!v15) {
      goto LABEL_6;
    }
    [(WKWebView *)self _scrollViewSystemContentInset];
    [(WKWebView *)self _effectiveObscuredInsetEdgesAffectedBySafeArea];
    UIEdgeInsetsAdd();
    goto LABEL_5;
  }
  CGFloat top = self->_obscuredInsets.top;
  CGFloat left = self->_obscuredInsets.left;
  CGFloat bottom = self->_obscuredInsets.bottom;
  CGFloat right = self->_obscuredInsets.right;
LABEL_6:
  double v11 = top;
  double v12 = left;
  double v13 = bottom;
  double v14 = right;
  result.CGFloat right = v14;
  result.CGFloat bottom = v13;
  result.CGFloat left = v12;
  result.CGFloat top = v11;
  return result;
}

- (BOOL)_allowsViewportShrinkToFit
{
  return self->_allowsViewportShrinkToFit;
}

- (void)_didCommitLayerTree:(const void *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  -[WKWebView _trackTransactionCommit:](self, "_trackTransactionCommit:");
  self->_perProcessState.lastTransactionID.unint64_t m_identifier = *((void *)a3 + 31);
  if (![(WKWebView *)self usesStandardContentView]) {
    return;
  }
  int updated = WebKit::WebPageProxy::updateLayoutViewportParameters((uint64_t)self->_page.m_ptr, (uint64_t)a3);
  if (self->_perProcessState.dynamicViewportUpdateMode)
  {
    [(WKWebView *)self _didCommitLayerTreeDuringAnimatedResize:a3];
    return;
  }
  if (self->_perProcessState.liveResizeParameters.__engaged_) {
    return;
  }
  int v6 = updated;
  if (self->_resizeAnimationView.m_ptr)
  {
    double v7 = qword_1EB358730;
    if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.super.isa) = 134217984;
      *(Class *)((char *)&buf.super.isa + 4) = (Class)self;
      _os_log_impl(&dword_1985F2000, v7, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _didCommitLayerTree:] - dynamicViewportUpdateMode is NotResizing, but still have a live resizeAnimationView (unpaired begin/endAnimatedResize?)", (uint8_t *)&buf, 0xCu);
    }
  }
  [(WKWebView *)self _updateScrollViewForTransaction:a3];
  *(_WORD *)&self->_perProcessState.viewportMetaTagWidthWasExplicit = *(_WORD *)((char *)a3 + 269);
  *(int8x16_t *)&self->_perProcessState.viewportMetaTagdouble Width = vextq_s8(*((int8x16_t *)a3 + 14), *((int8x16_t *)a3 + 14), 8uLL);
  if (*(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 2448)) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = *((unsigned char *)a3 + 271) == 0;
  }
  if (!v8 && [self->_stableStatePresentationUpdateCallbacks.m_ptr count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    m_ptr = self->_stableStatePresentationUpdateCallbacks.m_ptr;
    uint64_t v10 = [m_ptr countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(m_ptr);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v25 + 1) + 8 * i) + 16))();
        }
        uint64_t v10 = [m_ptr countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v10);
    }
    [self->_stableStatePresentationUpdateCallbacks.m_ptr removeAllObjects];
    double v13 = self->_stableStatePresentationUpdateCallbacks.m_ptr;
    self->_stableStatePresentationUpdateCallbacks.m_ptr = 0;
    if (v13) {
      CFRelease(v13);
    }
  }
  if (([self->_contentView.m_ptr _mayDisableDoubleTapGesturesDuringSingleTap] & 1) == 0) {
    objc_msgSend(self->_contentView.m_ptr, "_setDoubleTapGesturesEnabled:", -[WKWebView _allowsDoubleTapGestures](self, "_allowsDoubleTapGestures"));
  }
  [(WKWebView *)self _updateScrollViewBackground];
  [(WKWebView *)self _setAvoidsUnsafeArea:*((unsigned __int8 *)a3 + 268)];
  value = self->_gestureController.__ptr_.__value_;
  if (value) {
    WebKit::ViewGestureController::setRenderTreeSize((uint64_t)value, *((void *)a3 + 30));
  }
  if (self->_perProcessState.needsResetViewStateAfterCommitLoadForMainFrame
    && *((void *)a3 + 31) >= self->_perProcessState.firstPaintAfterCommitLoadTransactionID.m_identifier)
  {
    self->_perProcessState.BOOL needsResetViewStateAfterCommitLoadForMainFrame = 0;
    if (![(WKWebView *)self _scrollViewIsRubberBandingForRefreshControl]) {
      [(WKWebView *)self _resetContentOffset];
    }
    if ((self->_observedRenderingProgressEvents & 0x40) != 0) {
      WebKit::NavigationState::didFirstPaint((id *)self->_navigationState.__ptr_.__value_);
    }
    [(WKWebView *)self _restoreScrollAndZoomStateForTransaction:a3];
  }
  else if (([(WKWebView *)self _restoreScrollAndZoomStateForTransaction:a3] | v6) != 1)
  {
    goto LABEL_39;
  }
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
LABEL_39:
  BOOL v15 = (WebKit::RemoteLayerTreeScrollingPerformanceData *)*((void *)self->_page.m_ptr + 123);
  if (v15)
  {
    [(WKWebView *)self visibleRectInViewCoordinates];
    buf.super.isa = (Class)__PAIR64__(v17, v16);
    buf._attr.refcount = v18;
    buf._attr.magic = v19;
    unsigned int v20 = WebKit::RemoteLayerTreeScrollingPerformanceData::blankPixelCount(v15, &buf);
    WebKit::RemoteLayerTreeScrollingPerformanceData::appendBlankPixelCount(v15, 0, v20);
  }
  if (self->_perProcessState.pendingFindLayerID.m_value.m_object.m_identifier)
  {
    uint64_t v21 = *((void *)self->_page.m_ptr + 29);
    if (*(unsigned char *)(v21 + 36))
    {
      __break(0xC471u);
      JUMPOUT(0x19861D320);
    }
    uint64_t v22 = *(void *)(v21 + 72);
    *(Markable<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>, WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>::MarkableTraits> *)&buf.super.isa = self->_perProcessState.pendingFindLayerID;
    LOBYTE(buf._attr.layer) = 1;
    uint64_t v23 = WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>>,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>((uint64_t *)(v22 + 16), &buf);
    if (v23) {
      CGRect v24 = *(void **)(v23 + 40);
    }
    else {
      CGRect v24 = 0;
    }
    if ([v24 superlayer]) {
      [(WKWebView *)self _didAddLayerForFindOverlay:v24];
    }
  }
}

- (void)_updateScrollViewBackground
{
  scrollViewBackgroundColor(&v12, self, 1);
  unint64_t m_colorAndFlags = self->_perProcessState.scrollViewBackgroundColor.m_colorAndFlags;
  if ((m_colorAndFlags & 0x8000000000000) != 0)
  {
    if ((v12 & 0x8000000000000) != 0)
    {
      BOOL v10 = 0;
      unint64_t v11 = 0;
      *(_OWORD *)CFTypeRef cf = *(_OWORD *)((m_colorAndFlags & 0xFFFFFFFFFFFFLL) + 4);
      long long v13 = *(_OWORD *)((v12 & 0xFFFFFFFFFFFFLL) + 4);
      do
      {
        if (*((float *)cf + v11) != *((float *)&cf[-2] + v11)) {
          break;
        }
        BOOL v10 = v11++ > 2;
      }
      while (v11 != 4);
      if (v10 && HIBYTE(m_colorAndFlags) == HIBYTE(v12) && BYTE6(m_colorAndFlags) == BYTE6(v12)) {
        goto LABEL_9;
      }
    }
  }
  else if (m_colorAndFlags == v12 && (v12 & 0x8000000000000) == 0)
  {
    goto LABEL_9;
  }
  m_ptr = self->_scrollView.m_ptr;
  WebCore::cocoaColor((uint64_t *)cf, (WebCore *)&v12, v3);
  [m_ptr _setBackgroundColorInternal:cf[0]];
  CFTypeRef v7 = cf[0];
  cf[0] = 0;
  if (v7) {
    CFRelease(v7);
  }
  WebCore::Color::operator=();
LABEL_9:
  [(WKWebView *)self _updateScrollViewIndicatorStyle];
  if ((v12 & 0x8000000000000) != 0)
  {
    double v9 = (unsigned int *)(v12 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v12 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v9);
      WTF::fastFree((WTF *)v9, v8);
    }
  }
}

- (void)_updateScrollViewIndicatorStyle
{
  scrollViewBackgroundColor(&v7, self, 0);
  WebCore::Color::lightness((WebCore::Color *)&v7);
  if (v3 > 0.5) {
    goto LABEL_2;
  }
  if ((v7 & 0x8000000000000) != 0)
  {
    if (*(float *)((v7 & 0xFFFFFFFFFFFFLL) + 0x10) <= 0.0)
    {
LABEL_2:
      uint64_t v4 = 1;
      goto LABEL_8;
    }
  }
  else if (!(_BYTE)v7)
  {
    goto LABEL_2;
  }
  uint64_t v4 = 2;
LABEL_8:
  [self->_scrollView.m_ptr _setIndicatorStyleInternal:v4];
  if ((v7 & 0x8000000000000) != 0)
  {
    int v6 = (unsigned int *)(v7 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v7 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, v5);
    }
  }
}

- (void)_trackTransactionCommit:(const void *)a3
{
  uint64_t v4 = self;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  p_perProcessState = &self->_perProcessState;
  if (self->_perProcessState.didDeferUpdateVisibleContentRectsForUnstableScrollView)
  {
    int v6 = qword_1EB358730;
    self = (WKWebView *)os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT);
    if (self)
    {
      uint64_t v7 = *(void *)(*((void *)v4->_page.m_ptr + 4) + 760);
      double v8 = *((double *)a3 + 31);
      int dynamicViewportUpdateMode = p_perProcessState->dynamicViewportUpdateMode;
      BOOL needsResetViewStateAfterCommitLoadForMainFrame = p_perProcessState->needsResetViewStateAfterCommitLoadForMainFrame;
      unint64_t m_identifier = p_perProcessState->firstPaintAfterCommitLoadTransactionID.m_identifier;
      int v12 = [v4->_contentView.m_ptr sizeChangedSinceLastVisibleContentRectUpdate];
      int v13 = [v4->_scrollView.m_ptr isZoomBouncing];
      BOOL currentlyAdjustingScrollViewInsetsForKeyboard = p_perProcessState->currentlyAdjustingScrollViewInsetsForKeyboard;
      int v20 = 134220032;
      uint64_t v21 = v4;
      __int16 v22 = 2048;
      uint64_t v23 = v7;
      __int16 v24 = 2048;
      double v25 = v8;
      __int16 v26 = 1024;
      *(_DWORD *)long long v27 = dynamicViewportUpdateMode;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = needsResetViewStateAfterCommitLoadForMainFrame;
      __int16 v28 = 2048;
      unint64_t v29 = m_identifier;
      __int16 v30 = 1024;
      int v31 = v12;
      __int16 v32 = 1024;
      int v33 = v13;
      __int16 v34 = 1024;
      BOOL v35 = currentlyAdjustingScrollViewInsetsForKeyboard;
      _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _didCommitLayerTree:] - received a commit (%llu) while deferring visible content rect updates (dynamicViewportUpdateMode %d, needsResetViewStateAfterCommitLoadForMainFrame %d (wants commit %llu), sizeChangedSinceLastVisibleContentRectUpdate %d, [_scrollView isZoomBouncing] %d, currentlyAdjustingScrollViewInsetsForKeyboard %d)", (uint8_t *)&v20, 0x48u);
    }
  }
  if (v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_)
  {
    WTF::MonotonicTime::now((WTF::MonotonicTime *)self);
    if (!v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_) {
      __break(1u);
    }
    double v16 = v15 - v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.var0.__val_.m_value;
    if (v16 <= 5.0) {
      goto LABEL_9;
    }
    unsigned int v17 = qword_1EB358730;
    if (!os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v18 = *(void *)(*((void *)v4->_page.m_ptr + 4) + 760);
    uint64_t v19 = *((void *)a3 + 31);
    int v20 = 134218752;
    uint64_t v21 = v4;
    __int16 v22 = 2048;
    uint64_t v23 = v18;
    __int16 v24 = 2048;
    double v25 = v16;
    __int16 v26 = 2048;
    *(void *)long long v27 = v19;
    _os_log_impl(&dword_1985F2000, v17, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _didCommitLayerTree:] - finally received commit %.2fs after visible content rect update request; transactionID %llu",
      (uint8_t *)&v20,
      0x2Au);
    if (v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_) {
LABEL_9:
    }
      v4->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_ = 0;
  }
}

- (void)_setAvoidsUnsafeArea:(BOOL)a3
{
  if (self->_perProcessState.avoidsUnsafeArea != a3)
  {
    BOOL v3 = a3;
    self->_perProcessState.avoidsUnsafeArea = a3;
    if ([(WKWebView *)self _updateScrollViewContentInsetsIfNecessary]
      && ![(WKWebView *)self _shouldDeferGeometryUpdates]
      && !self->_overriddenLayoutParameters.__engaged_)
    {
      [(WKWebView *)self bounds];
      v10[0] = v5;
      v10[1] = v6;
      v10[2] = v7;
      v10[3] = v8;
      [(WKWebView *)self activeViewLayoutSize:v10];
      [(WKWebView *)self _dispatchSetViewLayoutSize:"_dispatchSetViewLayoutSize:"];
    }
    [(WKWebView *)self _updateScrollViewInsetAdjustmentBehavior];
    [(WKWebView *)self _scheduleVisibleContentRectUpdate];
    id v9 = [(WKWebView *)self UIDelegate];
    if (objc_opt_respondsToSelector()) {
      [v9 _webView:self didChangeSafeAreaShouldAffectObscuredInsets:v3];
    }
  }
}

- (BOOL)_restoreScrollAndZoomStateForTransaction:(const void *)a3
{
  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_
    || *((void *)a3 + 31) < self->_perProcessState.firstTransactionIDAfterPageRestore.var0.__val_.m_identifier)
  {
    return 0;
  }
  self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_ = 0;
  if (self->_perProcessState.scrollOffsetToRestore.__engaged_
    && ![(WKWebView *)self _scrollViewIsRubberBandingForRefreshControl])
  {
    if (!p_perProcessState->scrollOffsetToRestore.__engaged_) {
      goto LABEL_25;
    }
    p_perProcessState->scrollOffsetToRestore.__engaged_ = 0;
    uint64_t v8 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v8)
    {
      uint64_t v8 = (void *)[v8 affineTransform];
      float v9 = v25;
    }
    else
    {
      float v9 = 0.0;
    }
    float scaleToRestore = self->_scaleToRestore;
    BOOL v4 = 1;
    if (WebKit::scalesAreEssentiallyEqual((WebKit *)v8, v9, scaleToRestore))
    {
      changeContentOffsetBoundedInValidRange((UIScrollView *)self->_scrollView.m_ptr);
      p_perProcessState->commitDidRestoreScrollPosition = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  if (!p_perProcessState->unobscuredCenterToRestore.__engaged_
    || [(WKWebView *)self _scrollViewIsRubberBandingForRefreshControl])
  {
LABEL_19:
    value = self->_gestureController.__ptr_.__value_;
    if (value) {
      WebKit::ViewGestureController::SnapshotRemovalTracker::stopWaitingForEvent((WebKit::ViewGestureController::SnapshotRemovalTracker *)((char *)value + 168), (WebKit::ViewGestureController::SnapshotRemovalTracker *)0x20, "outstanding event occurred: ", 29, 1);
    }
    return v4;
  }
  if (p_perProcessState->unobscuredCenterToRestore.__engaged_)
  {
    p_perProcessState->unobscuredCenterToRestore.__engaged_ = 0;
    uint64_t v6 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v6)
    {
      uint64_t v6 = (void *)[v6 affineTransform];
      float v7 = v25;
    }
    else
    {
      float v7 = 0.0;
    }
    float v10 = self->_scaleToRestore;
    if (WebKit::scalesAreEssentiallyEqual((WebKit *)v6, v7, v10))
    {
      [(WKWebView *)self bounds];
      double top = self->_obscuredInsets.top;
      double left = self->_obscuredInsets.left;
      CGFloat v14 = v13 - (left + self->_obscuredInsets.right);
      CGFloat v16 = v15 - (top + self->_obscuredInsets.bottom);
      double v25 = v17 + left;
      double v26 = v18 + top;
      v27.CGFloat width = v14;
      v27.CGFloat height = v16;
      WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v24, &v27);
      changeContentOffsetBoundedInValidRange((UIScrollView *)self->_scrollView.m_ptr);
    }
    BOOL v4 = 1;
    goto LABEL_19;
  }
LABEL_25:
  __int16 v22 = (WKWebView *)std::__throw_bad_optional_access[abi:sn180100]();
  return [(WKWebView *)v22 _allowsDoubleTapGestures];
}

- (BOOL)_allowsDoubleTapGestures
{
  if (self->_fastClickingIsDisabled) {
    goto LABEL_2;
  }
  int v2 = [self->_scrollView.m_ptr isZoomEnabled];
  if (!v2) {
    return v2;
  }
  [self->_scrollView.m_ptr minimumZoomScale];
  double v5 = v4;
  [self->_scrollView.m_ptr maximumZoomScale];
  if (v5 >= v6
    || ([self->_scrollView.m_ptr minimumZoomScale],
        float v8 = v7,
        float v9 = (WebKit *)[self->_scrollView.m_ptr maximumZoomScale],
        float v11 = v10,
        WebKit::scalesAreEssentiallyEqual(v9, v8, v11)))
  {
    LOBYTE(v2) = 0;
    return v2;
  }
  p_perProcessState = &self->_perProcessState;
  if (!self->_perProcessState.viewportMetaTagWidthWasExplicit
    || self->_perProcessState.viewportMetaTagCameFromImageDocument
    || p_perProcessState->viewportMetaTagWidth != -2.0)
  {
LABEL_2:
    LOBYTE(v2) = 1;
  }
  else
  {
    double v13 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView", p_perProcessState->viewportMetaTagWidth), "layer");
    if (v13)
    {
      double v13 = (void *)[v13 affineTransform];
      float v14 = v17;
    }
    else
    {
      float v14 = 0.0;
    }
    float initialScaleFactor = self->_perProcessState.initialScaleFactor;
    LOBYTE(v2) = !WebKit::scalesAreEssentiallyEqual((WebKit *)v13, v14, initialScaleFactor);
  }
  return v2;
}

- (void)_resetCachedScrollViewBackgroundColor
{
  WebCore::Color::operator=();
}

- (void)_willInvokeUIScrollViewDelegateCallback
{
  self->_perProcessState.invokingUIScrollViewDelegateCallback = 1;
}

- (void)_didInvokeUIScrollViewDelegateCallback
{
  self->_perProcessState.invokingUIScrollViewDelegateCallback = 0;
  if (self->_perProcessState.didDeferUpdateVisibleContentRectsForUIScrollViewDelegateCallback)
  {
    self->_perProcessState.didDeferUpdateVisibleContentRectsForUIScrollViewDelegateCallback = 0;
    [(WKWebView *)self _scheduleVisibleContentRectUpdate];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfUnderPageBackgroundColor
{
  return 0;
}

- (void)_setMinimumEffectiveDeviceWidth:(double)a3
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  if (*((double *)m_ptr + 136) != a3)
  {
    BOOL v6 = [(WKWebView *)self _shouldDeferGeometryUpdates];
    double v7 = self->_page.m_ptr;
    if (v6)
    {
      *((double *)v7 + 136) = a3;
    }
    else
    {
      uint64_t v8 = *(void *)(*((void *)v7 + 4) + 2132);
      WebKit::WebPageProxy::setViewportConfigurationViewLayoutSize((uint64_t)v7, (const WebCore::FloatSize *)&v8, *((double *)v7 + 135), a3);
    }
  }
}

- (BOOL)_effectiveUserInterfaceLevelIsElevated
{
  return objc_msgSend((id)-[WKWebView traitCollection](self, "traitCollection"), "userInterfaceLevel") == 1;
}

- (BOOL)_effectiveAppearanceIsDark
{
  return objc_msgSend((id)-[WKWebView traitCollection](self, "traitCollection"), "userInterfaceStyle") == 2;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_scrollView.m_ptr;
}

- (WKWebViewContentProviderRegistry)_contentProviderRegistry
{
  UIEdgeInsets result = (WKWebViewContentProviderRegistry *)self->_contentProviderRegistry.m_ptr;
  if (!result)
  {
    UIEdgeInsets result = [[WKWebViewContentProviderRegistry alloc] initWithConfiguration:[(WKWebView *)self configuration]];
    m_ptr = self->_contentProviderRegistry.m_ptr;
    self->_contentProviderRegistry.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return (WKWebViewContentProviderRegistry *)self->_contentProviderRegistry.m_ptr;
    }
  }
  return result;
}

- (void)_setAppHighlightDelegate:(id)a3
{
}

- (UIColor)underPageBackgroundColor
{
  WebKit::WebPageProxy::underPageBackgroundColor((WebKit::WebPageProxy *)self->_page.m_ptr, &v9);
  WebCore::cocoaColor((uint64_t *)&cf, (WebCore *)&v9, v2);
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  double v5 = (id)CFMakeCollectable(v3);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  if ((v9 & 0x8000000000000) != 0)
  {
    uint64_t v8 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v8);
      WTF::fastFree((WTF *)v8, v4);
    }
  }
  return v5;
}

- (void)_layerTreeCommitComplete
{
  self->_perProcessState.commitDidRestoreScrollPosition = 0;
}

- (id)_insertionPointColor
{
  id result = (id)objc_msgSend(-[WKWebView _textInputTraits](self, "_textInputTraits"), "insertionPointColor");
  if (!result)
  {
    CFTypeRef v3 = (void *)MEMORY[0x1E4F428B8];
    return (id)[v3 insertionPointColor];
  }
  return result;
}

- (id)_textInputTraits
{
  if (![(WKWebView *)self usesStandardContentView]) {
    return 0;
  }
  m_ptr = self->_contentView.m_ptr;

  return (id)[m_ptr textInputTraitsForWebView];
}

- (void)_addUpdateVisibleContentRectPreCommitHandler
{
  if (self) {
    CFRetain(self);
  }
  CFTypeRef v3 = (void *)MEMORY[0x1E4F39CF8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3321888768;
  v5[2] = __76__WKWebView_WKViewInternalIOS___addUpdateVisibleContentRectPreCommitHandler__block_invoke;
  v5[3] = &__block_descriptor_40_e8_32c90_ZTSKZ76__WKWebView_WKViewInternalIOS___addUpdateVisibleContentRectPreCommitHandler_E4__11_e5_v8__0l;
  if (self)
  {
    CFRetain(self);
    CFTypeRef cf = self;
    CFRetain(self);
  }
  else
  {
    CFTypeRef cf = 0;
  }
  [v3 addCommitHandler:v5 forPhase:1];
  if (self) {
    CFRelease(self);
  }
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
  if (self) {
    CFRelease(self);
  }
}

- (WKVelocityTrackingScrollView)_scrollViewInternal
{
  return (WKVelocityTrackingScrollView *)self->_scrollView.m_ptr;
}

- (void)_registerForNotifications
{
  CFTypeRef v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__keyboardWillChangeFrame_ name:*MEMORY[0x1E4F43B70] object:0];
  [v3 addObserver:self selector:sel__keyboardDidChangeFrame_ name:*MEMORY[0x1E4F43AB8] object:0];
  [v3 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];
  [v3 addObserver:self selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];
  [v3 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];
  [v3 addObserver:self selector:sel__windowDidRotate_ name:*MEMORY[0x1E4F43F10] object:0];
  [v3 addObserver:self selector:sel__contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];
  [v3 addObserver:self selector:sel__accessibilitySettingsDidChange_ name:*MEMORY[0x1E4F43438] object:0];
  [v3 addObserver:self selector:sel__accessibilitySettingsDidChange_ name:*MEMORY[0x1E4F43440] object:0];
  [v3 addObserver:self selector:sel__accessibilitySettingsDidChange_ name:*MEMORY[0x1E4F43478] object:0];
  uint64_t v4 = *MEMORY[0x1E4F44290];

  [v3 addObserver:self selector:sel__enhancedWindowingToggled_ name:v4 object:0];
}

- (BOOL)_isEditable
{
  m_ptr = self->_page.m_ptr;
  return m_ptr && *((unsigned char *)m_ptr + 688) != 0;
}

- (BOOL)allowsLinkPreview
{
  return self->_allowsLinkPreview;
}

- (unint64_t)_dragInteractionPolicy
{
  return self->_dragInteractionPolicy;
}

- (void)_setupPageConfiguration:(void *)a3 withPool:(void *)a4
{
  double v7 = *(API::PageConfiguration **)a3;
  uint64_t v8 = [self->_configuration.m_ptr preferences];
  uint64_t v9 = v8 + 8;
  if (v8) {
    CFRetain(*(CFTypeRef *)(v8 + 16));
  }
  uint64_t v10 = *((void *)v7 + 5);
  *((void *)v7 + 5) = v9;
  if (v10) {
    CFRelease(*(CFTypeRef *)(v10 + 8));
  }
  uint64_t v11 = [self->_configuration.m_ptr _relatedWebView];
  if (v11)
  {
    double v13 = *(API::PageConfiguration **)a3;
    uint64_t v14 = *(void *)(v11 + 416);
    if (v14)
    {
      WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v14 + 24), v14 + 16);
      double v15 = *(atomic_uint **)(v14 + 24);
      if (v15) {
        atomic_fetch_add(v15, 1u);
      }
    }
    else
    {
      double v15 = 0;
    }
    CGFloat v16 = (unsigned int *)*((void *)v13 + 17);
    *((void *)v13 + 17) = v15;
    if (v16 && atomic_fetch_add((atomic_uint *volatile)v16, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v16);
      WTF::fastFree((WTF *)v16, v12);
    }
  }
  uint64_t v17 = [self->_configuration.m_ptr _webViewToCloneSessionStorageFrom];
  if (v17)
  {
    uint64_t v19 = *(API::PageConfiguration **)a3;
    uint64_t v20 = *(void *)(v17 + 416);
    if (v20)
    {
      WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)(v20 + 24), v20 + 16);
      uint64_t v21 = *(atomic_uint **)(v20 + 24);
      if (v21) {
        atomic_fetch_add(v21, 1u);
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    __int16 v22 = (unsigned int *)*((void *)v19 + 24);
    *((void *)v19 + 24) = v21;
    if (v22 && atomic_fetch_add((atomic_uint *volatile)v22, 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v22);
      WTF::fastFree((WTF *)v22, v18);
    }
  }
  SEL v23 = *(API::PageConfiguration **)a3;
  uint64_t v24 = [self->_configuration.m_ptr userContentController];
  uint64_t v25 = v24 + 8;
  CFRetain(*(CFTypeRef *)(v24 + 16));
  uint64_t v26 = *((void *)v23 + 4);
  *((void *)v23 + 4) = v25;
  if (v26) {
    CFRelease(*(CFTypeRef *)(v26 + 8));
  }
  CGSize v27 = *(API::PageConfiguration **)a3;
  uint64_t v28 = [self->_configuration.m_ptr _visitedLinkStore];
  uint64_t v29 = v28 + 8;
  if (v28) {
    CFRetain(*(CFTypeRef *)(v28 + 16));
  }
  uint64_t v30 = *((void *)v27 + 6);
  *((void *)v27 + 6) = v29;
  if (v30) {
    CFRelease(*(CFTypeRef *)(v30 + 8));
  }
  int v31 = *(API::PageConfiguration **)a3;
  uint64_t v32 = [self->_configuration.m_ptr websiteDataStore];
  uint64_t v33 = v32 + 8;
  if (v32) {
    CFRetain(*(CFTypeRef *)(v32 + 16));
  }
  uint64_t v34 = *((void *)v31 + 8);
  *((void *)v31 + 8) = v33;
  if (v34) {
    CFRelease(*(CFTypeRef *)(v34 + 8));
  }
  BOOL v35 = *(API::PageConfiguration **)a3;
  uint64_t v36 = [self->_configuration.m_ptr defaultWebpagePreferences];
  uint64_t v37 = v36 + 8;
  if (v36) {
    CFRetain(*(CFTypeRef *)(v36 + 16));
  }
  uint64_t v38 = *((void *)v35 + 7);
  *((void *)v35 + 7) = v37;
  if (v38) {
    CFRelease(*(CFTypeRef *)(v38 + 8));
  }
  CGFloat v39 = (void *)[self->_configuration.m_ptr _strongWebExtensionController];
  if (v39)
  {
    double v40 = *(API::PageConfiguration **)a3;
    uint64_t v41 = [v39 _webExtensionController];
    CFRetain(*(CFTypeRef *)(v41 + 8));
    uint64_t v42 = *((void *)v40 + 14);
    *((void *)v40 + 14) = v41;
    if (v42) {
      CFRelease(*(CFTypeRef *)(v42 + 8));
    }
  }
  int v43 = (void *)[self->_configuration.m_ptr _weakWebExtensionController];
  if (v43) {
    API::PageConfiguration::setWeakWebExtensionController(*(API::PageConfiguration **)a3, (WebKit::WebExtensionController *)[v43 _webExtensionController]);
  }
  double v44 = (void *)[self->_configuration.m_ptr _groupIdentifier];
  if ([v44 length])
  {
    CGRect v45 = *(API::PageConfiguration **)a3;
    MEMORY[0x19972EAD0](v126, v44);
    CGRect v46 = (CFTypeRef *)API::Object::newObject(0x30uLL, 88);
    v47 = WebKit::WebPageGroup::WebPageGroup((WebKit::WebPageGroup *)v46, v126);
    CFRetain(*((CFTypeRef *)v47 + 1));
    uint64_t v48 = *((void *)v45 + 16);
    *((void *)v45 + 16) = v46;
    if (v48) {
      CFRelease(*(CFTypeRef *)(v48 + 8));
    }
    CFRelease(v46[1]);
    uint64_t v50 = v126[0];
    v126[0] = 0;
    if (v50)
    {
      if (*(_DWORD *)v50 == 2) {
        WTF::StringImpl::destroy(v50, v49);
      }
      else {
        *(_DWORD *)v50 -= 2;
      }
    }
  }
  uint64_t v51 = *(API::PageConfiguration **)a3;
  WTF::makeVector<WTF::String>((void *)[self->_configuration.m_ptr _additionalSupportedImageTypes], (uint64_t)&v124);
  v126[0] = v124;
  uint64_t v52 = v125;
  double v124 = 0;
  uint64_t v125 = 0;
  v126[1] = v52;
  char v127 = 1;
  std::__optional_storage_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>::__assign_from[abi:sn180100]<std::__optional_move_assign_base<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,false>>((API::PageConfiguration *)((char *)v51 + 288), (uint64_t *)v126);
  if (v127) {
    WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v126, v53);
  }
  WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v124, v53);
  uint64_t v54 = *(API::PageConfiguration **)a3;
  *((unsigned char *)v54 + 237) = [self->_configuration.m_ptr _waitsForPaintAfterViewDidMoveToWindow];
  uint64_t v55 = *(API::PageConfiguration **)a3;
  *((unsigned char *)v55 + 238) = [self->_configuration.m_ptr _drawsBackground];
  uint64_t v56 = *(API::PageConfiguration **)a3;
  *((unsigned char *)v56 + 239) = [self->_configuration.m_ptr _isControlledByAutomation];
  uint64_t v57 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  int v58 = *((_DWORD *)v57 + 26);
  if (!v58) {
    *((unsigned char *)v57 + 108) = 0;
  }
  *((_DWORD *)v57 + 26) = v58 + 1;
  uint64_t v59 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr suppressesIncrementalRendering];
  WebKit::WebPreferences::setSuppressesIncrementalRendering(v59, (const BOOL *)v126);
  if ((WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    CGRect v60 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
    LOBYTE(v126[0]) = [self->_configuration.m_ptr _printsBackgrounds];
    WebKit::WebPreferences::setShouldPrintBackgrounds(v60, (const BOOL *)v126);
  }
  double v61 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  [self->_configuration.m_ptr _incrementalRenderingSuppressionTimeout];
  v126[0] = v62;
  WebKit::WebPreferences::setIncrementalRenderingSuppressionTimeout(v61, (double *)v126);
  double v63 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _allowsJavaScriptMarkup];
  WebKit::WebPreferences::setJavaScriptMarkupEnabled(v63, (const BOOL *)v126);
  double v64 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _convertsPositionStyleOnCopy];
  WebKit::WebPreferences::setShouldConvertPositionStyleOnCopy(v64, (const BOOL *)v126);
  uint64_t v65 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _allowsMetaRefresh];
  WebKit::WebPreferences::setHTTPEquivEnabled(v65, (const BOOL *)v126);
  uint64_t v66 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _allowUniversalAccessFromFileURLs];
  WebKit::WebPreferences::setAllowUniversalAccessFromFileURLs(v66, (const BOOL *)v126);
  uint64_t v67 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _allowTopNavigationToDataURLs];
  WebKit::WebPreferences::setAllowTopNavigationToDataURLs(v67, (const BOOL *)v126);
  uint64_t v68 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _incompleteImageBorderEnabled];
  WebKit::WebPreferences::setIncompleteImageBorderEnabled(v68, (const BOOL *)v126);
  uint64_t v69 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _shouldDeferAsynchronousScriptsUntilAfterDocumentLoad];
  WebKit::WebPreferences::setShouldDeferAsynchronousScriptsUntilAfterDocumentLoadOrFirstPaint(v69, (const BOOL *)v126);
  uint64_t v70 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  if (byte_1E93CF602 == 1)
  {
    char v71 = byte_1E93CF601;
  }
  else
  {
    char v71 = WTF::linkedOnOrAfterSDKWithBehavior();
    byte_1E93CF601 = v71;
    byte_1E93CF602 = 1;
  }
  LOBYTE(v126[0]) = v71;
  WebKit::WebPreferences::setShouldRestrictBaseURLSchemes(v70, (const BOOL *)v126);
  v72 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr allowsInlineMediaPlayback];
  WebKit::WebPreferences::setAllowsInlineMediaPlayback(v72, (const BOOL *)v126);
  double v73 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _allowsInlineMediaPlaybackAfterFullscreen];
  WebKit::WebPreferences::setAllowsInlineMediaPlaybackAfterFullscreen(v73, (const BOOL *)v126);
  double v74 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _inlineMediaPlaybackRequiresPlaysInlineAttribute];
  WebKit::WebPreferences::setInlineMediaPlaybackRequiresPlaysInlineAttribute(v74, (const BOOL *)v126);
  double v75 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  int v76 = [self->_configuration.m_ptr allowsPictureInPictureMediaPlayback];
  if (v76)
  {
    if (byte_1E93CF604 == 1)
    {
      LOBYTE(v76) = byte_1E93CF603 != 0;
    }
    else
    {
      LOBYTE(v76) = WTF::linkedOnOrAfterSDKWithBehavior();
      byte_1E93CF603 = v76;
      byte_1E93CF604 = 1;
    }
  }
  LOBYTE(v126[0]) = v76;
  WebKit::WebPreferences::setAllowsPictureInPictureMediaPlayback(v75, (const BOOL *)v126);
  double v77 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LODWORD(v126[0]) = 0;
  WebKit::WebPreferences::setUserInterfaceDirectionPolicy(v77, (const unsigned int *)v126);
  double v78 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LODWORD(v126[0]) = 0;
  WebKit::WebPreferences::setSystemLayoutDirection(v78, (const unsigned int *)v126);
  double v79 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  if (byte_1E93CF606 == 1)
  {
    char v80 = byte_1E93CF605;
  }
  else
  {
    double v122 = v79;
    isCardiogram = (WebCore::IOSApplication *)WebCore::IOSApplication::isCardiogram(v79);
    if ((isCardiogram & 1) != 0 || WebCore::IOSApplication::isNike(isCardiogram)) {
      char v80 = WTF::linkedOnOrAfterSDKWithBehavior() ^ 1;
    }
    else {
      char v80 = 0;
    }
    byte_1E93CF605 = v80;
    byte_1E93CF606 = 1;
    double v79 = v122;
  }
  LOBYTE(v126[0]) = v80;
  WebKit::WebPreferences::setAllowSettingAnyXHRHeaderFromFileURLs(v79, (const BOOL *)v126);
  double v81 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _shouldDecidePolicyBeforeLoadingQuickLookPreview];
  WebKit::WebPreferences::setShouldDecidePolicyBeforeLoadingQuickLookPreview(v81, (const BOOL *)v126);
  double v82 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = WTF::linkedOnOrAfterSDKWithBehavior();
  WebKit::WebPreferences::setDeviceOrientationPermissionAPIEnabled(v82, (const BOOL *)v126);
  double v83 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _systemPreviewEnabled];
  WebKit::WebPreferences::setSystemPreviewEnabled(v83, (const BOOL *)v126);
  double v84 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _scrollToTextFragmentIndicatorEnabled];
  WebKit::WebPreferences::setScrollToTextFragmentIndicatorEnabled(v84, (const BOOL *)v126);
  double v85 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _scrollToTextFragmentMarkingEnabled];
  WebKit::WebPreferences::setScrollToTextFragmentMarkingEnabled(v85, (const BOOL *)v126);
  LOBYTE(v85) = [self->_configuration.m_ptr mediaTypesRequiringUserActionForPlayback];
  double v86 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = (v85 & 2) != 0;
  WebKit::WebPreferences::setRequiresUserGestureForVideoPlayback(v86, (const BOOL *)v126);
  BOOL v87 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = v85 & 1;
  WebKit::WebPreferences::setRequiresUserGestureForAudioPlayback(v87, (const BOOL *)v126);
  v88 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  if (byte_1E93CF608 == 1)
  {
    char v89 = byte_1E93CF607;
  }
  else
  {
    char v89 = WTF::linkedOnOrAfterSDKWithBehavior();
    byte_1E93CF607 = v89;
    byte_1E93CF608 = 1;
  }
  LOBYTE(v126[0]) = v89;
  WebKit::WebPreferences::setRequiresUserGestureToLoadVideo(v88, (const BOOL *)v126);
  double v90 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _mainContentUserGestureOverrideEnabled];
  WebKit::WebPreferences::setMainContentUserGestureOverrideEnabled(v90, (const BOOL *)v126);
  double v91 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _invisibleAutoplayNotPermitted];
  WebKit::WebPreferences::setInvisibleAutoplayNotPermitted(v91, (const BOOL *)v126);
  double v92 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _mediaDataLoadsAutomatically];
  WebKit::WebPreferences::setMediaDataLoadsAutomatically(v92, (const BOOL *)v126);
  double v93 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _attachmentElementEnabled];
  WebKit::WebPreferences::setAttachmentElementEnabled(v93, (const BOOL *)v126);
  v94 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _attachmentWideLayoutEnabled];
  WebKit::WebPreferences::setAttachmentWideLayoutEnabled(v94, (const BOOL *)v126);
  double v95 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr dataDetectorTypes] & 0x7F;
  LODWORD(v126[0]) = LOBYTE(v126[0]);
  WebKit::WebPreferences::setDataDetectorTypes(v95, (const unsigned int *)v126);
  double v96 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr allowsAirPlayForMediaPlayback];
  WebKit::WebPreferences::setAllowsAirPlayForMediaPlayback(v96, (const BOOL *)v126);
  double v97 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _applePayEnabled];
  WebKit::WebPreferences::setApplePayEnabled(v97, (const BOOL *)v126);
  v98 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _needsStorageAccessFromFileURLsQuirk];
  WebKit::WebPreferences::setNeedsStorageAccessFromFileURLsQuirk(v98, (const BOOL *)v126);
  uint64_t v99 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  MEMORY[0x19972EAD0](v126, [self->_configuration.m_ptr _mediaContentTypesRequiringHardwareSupport]);
  WebKit::WebPreferences::setMediaContentTypesRequiringHardwareSupport(v99, v126);
  v101 = v126[0];
  v126[0] = 0;
  if (v101)
  {
    if (*(_DWORD *)v101 == 2) {
      WTF::StringImpl::destroy(v101, v100);
    }
    else {
      *(_DWORD *)v101 -= 2;
    }
  }
  v102 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _allowMediaContentTypesRequiringHardwareSupportAsFallback];
  WebKit::WebPreferences::setAllowMediaContentTypesRequiringHardwareSupportAsFallback(v102, (const BOOL *)v126);
  uint64_t v103 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  {
    WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferences *)((char *)v103 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::mediaDevicesEnabledKey(void)::key, v104) & 1) == 0)
  {
    uint64_t v105 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
    LOBYTE(v126[0]) = [self->_configuration.m_ptr _mediaCaptureEnabled];
    WebKit::WebPreferences::setMediaDevicesEnabled(v105, (const BOOL *)v126);
  }
  unsigned int v106 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _colorFilterEnabled];
  WebKit::WebPreferences::setColorFilterEnabled(v106, (const BOOL *)v126);
  double v107 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _undoManagerAPIEnabled];
  WebKit::WebPreferences::setUndoManagerAPIEnabled(v107, (const BOOL *)v126);
  v108 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _appHighlightsEnabled];
  WebKit::WebPreferences::setAppHighlightsEnabled(v108, (const BOOL *)v126);
  v109 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _legacyEncryptedMediaAPIEnabled];
  WebKit::WebPreferences::setLegacyEncryptedMediaAPIEnabled(v109, (const BOOL *)v126);
  if (((WTF::processHasEntitlement() & 1) == 0 && !WTF::processHasEntitlement()
     || objc_msgSend((id)objc_msgSend(self->_configuration.m_ptr, "preferences"), "_serviceWorkerEntitlementDisabledForTesting"))&& (objc_msgSend(self->_configuration.m_ptr, "limitsNavigationsToAppBoundDomains") & 1) == 0)
  {
    v110 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
    LOBYTE(v126[0]) = 0;
    WebKit::WebPreferences::setServiceWorkersEnabled(v110, (const BOOL *)v126);
  }
  v111 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = objc_msgSend((id)objc_msgSend(self->_configuration.m_ptr, "preferences"), "_serviceWorkerEntitlementDisabledForTesting");
  WebKit::WebPreferences::setServiceWorkerEntitlementDisabledForTesting(v111, (const BOOL *)v126);
  v112 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  [self->_configuration.m_ptr _sampledPageTopColorMaxDifference];
  v126[0] = v113;
  WebKit::WebPreferences::setSampledPageTopColorMaxDifference(v112, (double *)v126);
  uint64_t v114 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  [self->_configuration.m_ptr _sampledPageTopColorMinHeight];
  v126[0] = v115;
  WebKit::WebPreferences::setSampledPageTopColorMinHeight(v114, (double *)v126);
  if ((WTF::linkedOnOrAfterSDKWithBehavior() & 1) == 0)
  {
    uint64_t v116 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
    LOBYTE(v126[0]) = 0;
    WebKit::WebPreferences::setNeedsSiteSpecificQuirks(v116, (const BOOL *)v126);
  }
  v117 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = PAL::currentUserInterfaceIdiomIsVision(v117);
  WebKit::WebPreferences::setAlternateFormControlDesignEnabled(v117, (const BOOL *)v126);
  v118 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = [self->_configuration.m_ptr _allowTestOnlyIPC];
  WebKit::WebPreferences::setAllowTestOnlyIPC(v118, (const BOOL *)v126);
  v119 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  LOBYTE(v126[0]) = *(unsigned char *)(*((void *)a4 + 6) + 96);
  WebKit::WebPreferences::setUsesSingleWebProcess(v119, (const BOOL *)v126);
  v120 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebPreferences,&API::PageConfiguration::Data::createWebPreferences>::get((WebKit::WebPreferences **)(*(void *)a3 + 40));
  int v121 = *((_DWORD *)v120 + 26) - 1;
  *((_DWORD *)v120 + 26) = v121;
  if (!v121)
  {
    if (*((unsigned char *)v120 + 108)) {
      WebKit::WebPreferences::update(v120);
    }
  }
}

- (void)_setDiagnosticLoggingDelegate:(id)a3
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 16);
  if (v3) {
    WebKit::DiagnosticLoggingClient::setDelegate(v3, a3);
  }
}

- (id)_remoteObjectRegistry
{
  id result = self->_remoteObjectRegistry.m_ptr;
  if (!result)
  {
    id v4 = [[_WKRemoteObjectRegistry alloc] _initWithWebPageProxy:self->_page.m_ptr];
    m_ptr = self->_remoteObjectRegistry.m_ptr;
    self->_remoteObjectRegistry.m_ptr = v4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v6 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*((void *)self->_page.m_ptr + 6) + 24));
    uint64_t v7 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    uint64_t v8 = [self->_remoteObjectRegistry.m_ptr remoteObjectRegistry];
    v10[0] = 106;
    v10[1] = v7;
    WTF::HashMap<std::pair<IPC::ReceiverName,unsigned long long>,WTF::WeakPtr<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>,WTF::DefaultHash<std::pair<IPC::ReceiverName,unsigned long long>>,WTF::PairHashTraits<WTF::StrongEnumHashTraits<IPC::ReceiverName>,WTF::HashTraits<unsigned long long>>,WTF::HashTraits<WTF::WeakPtr<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTableTraits>::inlineSet<std::pair<IPC::ReceiverName,unsigned long long>,IPC::MessageReceiver&>((uint64_t *)(v6 + 64), (unsigned __int8 *)v10, v8, &v9);
    return self->_remoteObjectRegistry.m_ptr;
  }
  return result;
}

- (BOOL)canGoForward
{
  if (self)
  {
    BOOL didAccessBackForwardList = self->_didAccessBackForwardList;
    self->_BOOL didAccessBackForwardList = 1;
    if (!didAccessBackForwardList) {
      -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
    }
  }
  return *(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 1137);
}

- (void)_setObservedRenderingProgressEvents:(unint64_t)a3
{
  self->_observedRenderingProgressEvents = a3;
  WebKit::WebPageProxy::listenForLayoutMilestones((uint64_t)self->_page.m_ptr, a3 & 0x1B7 | (((a3 >> 3) & 1) << 6));
}

- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5
{
  m_ptr = self->_page.m_ptr;
  uint64_t v6 = 764;
  if (!*((unsigned char *)m_ptr + 768)) {
    uint64_t v6 = 760;
  }
  double v7 = *(float *)((char *)m_ptr + v6);
  double v8 = floor(a5.width * v7) / v7;
  double v9 = floor(a5.height * v7) / v7;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (void)didMoveToWindow
{
  if (!self->_overridesInterfaceOrientation) {
    [(WKWebView *)self _dispatchSetDeviceOrientation:[(WKWebView *)self _deviceOrientationIgnoringOverrides]];
  }
  [(WKWebView *)self _dispatchSetOrientationForMediaCapture:[(WKWebView *)self _deviceOrientationIgnoringOverrides]];
  WebKit::WebPageProxy::activityStateDidChange((uint64_t)self->_page.m_ptr, 1023, 0, 0);
  WebKit::WebPageProxy::webViewDidMoveToWindow((WebKit::WebPageProxy *)self->_page.m_ptr);
  [(WKWebView *)self _presentLockdownModeAlertIfNeeded];
  m_ptr = self->_page.m_ptr;
  if (!*((unsigned char *)m_ptr + 801) && *((unsigned char *)m_ptr + 800) && [(WKWebView *)self window])
  {
    id v4 = self->_page.m_ptr;
    BOOL v5 = [(WKWebView *)self _isWindowResizingEnabled];
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsWindowResizingEnabled>(*((void *)v4 + 32), (char *)&v5, *(void *)(*((void *)v4 + 4) + 1928), 0);
  }
  [(WKWebView *)self _invalidateResizeAssertions];
  [(WKWebView *)self _endLiveResize];

  [(WKWebView *)self _updateLastKnownWindowSizeAndOrientation];
}

- (BOOL)_isWindowResizingEnabled
{
  int v2 = objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene");

  return [v2 _enhancedWindowingEnabled];
}

- (void)_presentLockdownModeAlertIfNeeded
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__WKWebView_WKViewInternalIOS___presentLockdownModeAlertIfNeeded__block_invoke;
  block[3] = &unk_1E5812158;
  block[4] = self;
  if (-[WKWebView(WKViewInternalIOS) _presentLockdownModeAlertIfNeeded]::onceToken != -1) {
    dispatch_once(&-[WKWebView(WKViewInternalIOS) _presentLockdownModeAlertIfNeeded]::onceToken, block);
  }
  if (lockdownModeWarningNeeded)
  {
    if (self->_needsToPresentLockdownModeMessage)
    {
      [(WKWebView *)self _presentLockdownMode];
      self->_needsToPresentLockdownModeMessage = 0;
    }
  }
}

- (void)_invalidateResizeAssertions
{
  m_buffer = (CFTypeRef *)self->_resizeAssertions.m_buffer;
  double v8 = m_buffer;
  m_CGSize size = self->_resizeAssertions.m_size;
  m_capacitdouble y = self->_resizeAssertions.m_capacity;
  int v10 = m_size;
  v7[0] = 0;
  self->_resizeAssertions.m_buffer = 0;
  v7[1] = 0;
  *(void *)&self->_resizeAssertions.m_capacitdouble y = 0;
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, (void *)a2);
  if (m_size)
  {
    uint64_t v5 = 8 * m_size;
    do
    {
      uint64_t v6 = (void *)*m_buffer;
      if (*m_buffer) {
        CFRetain(*m_buffer);
      }
      [v6 _invalidate];
      if (v6) {
        CFRelease(v6);
      }
      ++m_buffer;
      v5 -= 8;
    }
    while (v5);
  }
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v8, v4);
}

- (void)_endLiveResize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    *(_DWORD *)CALayer buf = 134218240;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _endLiveResize]", buf, 0x16u);
  }
  if (self->_perProcessState.liveResizeParameters.__engaged_)
  {
    [self->_endLiveResizeTimer.m_ptr invalidate];
    m_ptr = self->_endLiveResizeTimer.m_ptr;
    self->_endLiveResizeTimer.m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v6 = (void *)[(WKWebView *)self snapshotViewAfterScreenUpdates:0];
    double v7 = v6;
    if (v6) {
      CFRetain(v6);
    }
    [(WKWebView *)self bounds];
    objc_msgSend(v7, "setFrame:");
    [(WKWebView *)self addSubview:v7];
    if (self->_perProcessState.liveResizeParameters.__engaged_) {
      self->_perProcessState.liveResizeParameters.__engaged_ = 0;
    }
    [(WKWebView *)self _destroyResizeAnimationView];
    [(WKWebView *)self _didStopDeferringGeometryUpdates];
    if (v7) {
      CFRetain(v7);
    }
    id v14 = 0;
    objc_initWeak(&v14, self);
    *(void *)CALayer buf = v7;
    *(void *)&uint8_t buf[8] = 0;
    objc_moveWeak((id *)&buf[8], &v14);
    double v8 = malloc_type_malloc(0x30uLL, 0x10E00408BA55B3FuLL);
    *(void *)double v8 = MEMORY[0x1E4F14398];
    *((void *)v8 + 1) = 50331650;
    *((void *)v8 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKViewInternalIOS) _endLiveResize]::$_2>(-[WKWebView(WKViewInternalIOS) _endLiveResize]::$_2)::{lambda(void *)#1}::__invoke;
    *((void *)v8 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKViewInternalIOS) _endLiveResize]::$_2>(-[WKWebView(WKViewInternalIOS) _endLiveResize]::$_2)::descriptor;
    uint64_t v9 = *(void *)buf;
    *(void *)CALayer buf = 0;
    *((void *)v8 + 4) = v9;
    *((void *)v8 + 5) = 0;
    objc_moveWeak((id *)v8 + 5, (id *)&buf[8]);
    objc_destroyWeak((id *)&buf[8]);
    int v10 = *(const void **)buf;
    *(void *)CALayer buf = 0;
    if (v10) {
      CFRelease(v10);
    }
    [(WKWebView *)self _doAfterNextVisibleContentRectUpdate:v8];
    _Block_release(v8);
    objc_destroyWeak(&v14);
    WTF::RunLoop::main(0);
    if (v7) {
      CFRetain(v7);
    }
    uint64_t v11 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v11 = &unk_1EE9CD690;
    v11[1] = v7;
    *(void *)CALayer buf = v11;
    WTF::RunLoop::dispatchAfter();
    if (v13) {
      WTF::ThreadSafeRefCounted<WTF::RunLoop::DispatchTimer,(WTF::DestructionThread)0>::deref((unsigned int *)(v13 + 24));
    }
    uint64_t v12 = *(void *)buf;
    *(void *)CALayer buf = 0;
    if (v12)
    {
      (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
      if (!v7) {
        return;
      }
    }
    else if (!v7)
    {
      return;
    }
    CFRelease(v7);
  }
}

- (void)_setFullscreenDelegate:(id)a3
{
  uint64_t v4 = (unsigned int (***)(void, uint64_t))*((void *)self->_page.m_ptr + 52);
  if ((**v4)(v4, 1))
  {
    WebKit::FullscreenClient::setDelegate((uint64_t)v4, a3);
  }
}

- (void)_setHistoryDelegate:(id)a3
{
  m_ptr = self->_page.m_ptr;
  WebKit::NavigationState::createHistoryClient((WebKit::NavigationState *)self->_navigationState.__ptr_.__value_, &v8);
  uint64_t v6 = *((void *)m_ptr + 10);
  *((void *)m_ptr + 10) = v8;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  value = self->_navigationState.__ptr_.__value_;

  WebKit::NavigationState::setHistoryDelegate((uint64_t)value, a3);
}

- (void)setFindInteractionEnabled:(BOOL)findInteractionEnabled
{
  if (self->_findInteractionEnabled != findInteractionEnabled)
  {
    BOOL v3 = findInteractionEnabled;
    self->_findInteractionEnabled = findInteractionEnabled;
    m_ptr = self->_findInteraction.m_ptr;
    if (v3)
    {
      if (!m_ptr)
      {
        m_ptr = (void *)[objc_alloc(MEMORY[0x1E4F42A10]) initWithSessionDelegate:self];
        uint64_t v6 = self->_findInteraction.m_ptr;
        self->_findInteraction.m_ptr = m_ptr;
        if (v6)
        {
          CFRelease(v6);
          m_ptr = self->_findInteraction.m_ptr;
        }
      }
      [(WKWebView *)self addInteraction:m_ptr];
    }
    else
    {
      [(WKWebView *)self removeInteraction:m_ptr];
      double v7 = self->_findInteraction.m_ptr;
      self->_findInteraction.m_ptr = 0;
      if (v7)
      {
        CFRelease(v7);
      }
    }
  }
}

- (void)setAllowsBackForwardNavigationGestures:(BOOL)allowsBackForwardNavigationGestures
{
  BOOL v3 = allowsBackForwardNavigationGestures;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  if (self->_allowsBackForwardNavigationGestures != v3)
  {
    self->_allowsBackForwardNavigationGestures = v3;
    if (v3 && !self->_gestureController.__ptr_.__value_)
    {
      uint64_t v6 = self->_page.m_ptr;
      double v7 = (WebKit::ViewGestureController *)WTF::fastMalloc((WTF *)0xF8);
      WebKit::ViewGestureController::ViewGestureController(v7, (WebKit::WebPageProxy *)v6);
      value = self->_gestureController.__ptr_.__value_;
      self->_gestureController.__ptr_.__value_ = (ViewGestureController *)v7;
      if (value)
      {
        (*(void (**)(ViewGestureController *))(*(void *)value + 8))(value);
        double v7 = (WebKit::ViewGestureController *)self->_gestureController.__ptr_.__value_;
      }
      WebKit::ViewGestureController::installSwipeHandler(v7, &self->super, (UIView *)[(WKWebView *)self scrollView]);
      uint64_t v9 = [self->_configuration.m_ptr _alternateWebViewForNavigationGestures];
      if (v9) {
        WebKit::ViewGestureController::setAlternateBackForwardListSourcePage((WebKit::ViewGestureController *)self->_gestureController.__ptr_.__value_, *(WebKit::WebPageProxy **)(v9 + 416));
      }
    }
    int v10 = self->_gestureController.__ptr_.__value_;
    if (v10) {
      *((unsigned char *)v10 + 28) = v3;
    }
    *((unsigned char *)self->_page.m_ptr + 927) = v3;
  }
}

- (WKWebView)initWithFrame:(CGRect)frame configuration:(WKWebViewConfiguration *)configuration
{
  v8.receiver = self;
  v8.super_class = (Class)WKWebView;
  uint64_t v5 = -[WKWebView initWithFrame:](&v8, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  uint64_t v6 = v5;
  if (v5) {
    [(WKWebView *)v5 _initializeWithConfiguration:configuration];
  }
  return v6;
}

- (void)_initializeWithConfiguration:(id)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Configuration cannot be nil"];
  }
  uint64_t v5 = (void *)[a3 copy];
  m_ptr = self->_configuration.m_ptr;
  self->_configuration.m_ptr = v5;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    uint64_t v5 = self->_configuration.m_ptr;
  }
  uint64_t v7 = [v5 _relatedWebView];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = [self->_configuration.m_ptr processPool];
    uint64_t v10 = [*(id *)(v8 + 408) processPool];
    uint64_t v11 = v10;
    if (v9) {
      BOOL v12 = v9 == v10;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Related web view %@ has process pool %@ but configuration specifies a different process pool %@", v8, v10, objc_msgSend(a3, "processPool") format];
    }
    uint64_t v13 = [*(id *)(v8 + 408) websiteDataStore];
    if (v13 != [self->_configuration.m_ptr websiteDataStore]
      && WTF::linkedOnOrAfterSDKWithBehavior())
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Related web view %@ has data store %@ but configuration specifies a different data store %@", v8, objc_msgSend(*(id *)(v8 + 408), "websiteDataStore"), objc_msgSend(self->_configuration.m_ptr, "websiteDataStore") format];
    }
    [self->_configuration.m_ptr setProcessPool:v11];
  }
  uint64_t v14 = [self->_configuration.m_ptr processPool] + 8;
  API::PageConfiguration::copy((API::PageConfiguration *)((char *)self->_configuration.m_ptr + 8), (API::PageConfiguration **)&v72);
  [(WKWebView *)self _setupPageConfiguration:&v72 withPool:v14];
  self->_usePlatformFindUI = 1;
  self->_obscuredInsetEdgesAffectedBySafeArea = 11;
  self->_allowsViewportShrinkToFit = 0;
  self->_allowsLinkPreview = WTF::linkedOnOrAfterSDKWithBehavior();
  self->_findInteractionEnabled = 0;
  self->_needsToPresentLockdownModeMessage = 1;
  double v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"WebKitFastClickingDisabled");
  if (v15) {
    LOBYTE(v15) = [v15 BOOLValue];
  }
  self->_fastClickingIsDisabled = (char)v15;
  self->_dragInteractionPolicdouble y = 0;
  uint64_t v16 = [WKContentView alloc];
  [(WKWebView *)self bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  uint64_t v25 = (WTF::StringImpl *)v72;
  CFRetain(v72[1]);
  double v73 = v25;
  uint64_t v26 = -[WKContentView initWithFrame:processPool:configuration:webView:](v16, "initWithFrame:processPool:configuration:webView:", v14, &v73, self, v18, v20, v22, v24);
  CGSize v27 = self->_contentView.m_ptr;
  self->_contentView.m_ptr = v26;
  if (v27) {
    CFRelease(v27);
  }
  uint64_t v28 = v73;
  double v73 = 0;
  if (v28) {
    CFRelease(*((CFTypeRef *)v28 + 1));
  }
  uint64_t v29 = [self->_contentView.m_ptr page];
  uint64_t v30 = (WebPageProxy *)v29;
  if (v29) {
    CFRetain(*(CFTypeRef *)(v29 + 8));
  }
  int v31 = self->_page.m_ptr;
  self->_page.m_ptr = v30;
  if (v31) {
    CFRelease(*((CFTypeRef *)v31 + 1));
  }
  [(WKWebView *)self _setupScrollAndContentViews];
  if ([(WKWebView *)self isOpaque] && *((unsigned char *)v72 + 238)) {
    [(WKWebView *)self _updateScrollViewBackground];
  }
  else {
    [(WKWebView *)self _setOpaqueInternal:0];
  }
  [(WKWebView *)self _frameOrBoundsMayHaveChanged];
  [(WKWebView *)self _registerForNotifications];
  uint64_t v32 = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v71, [(WKWebView *)self _contentSizeCategory]);
  uint64_t v33 = *((void *)v32 + 32);
  double v73 = (WTF::StringImpl *)&v71;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ContentSizeCategoryDidChange>(v33, (uint64_t **)&v73, *(void *)(*((void *)v32 + 4) + 1928), 0);
  BOOL v35 = v71;
  char v71 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 2) {
      WTF::StringImpl::destroy(v35, v34);
    }
    else {
      *(_DWORD *)v35 -= 2;
    }
  }
  WebKit::WebPageProxy::setForceAlwaysUserScalable((uint64_t)self->_page.m_ptr, [self->_configuration.m_ptr ignoresViewportScaleLimits]);
  if ([a3 applicationNameForUserAgent])
  {
    uint64_t v36 = (WTF **)self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v73);
    WebKit::WebPageProxy::setApplicationNameForUserAgent(v36, &v73, v37);
    CGFloat v39 = v73;
    double v73 = 0;
    if (v39)
    {
      if (*(_DWORD *)v39 == 2) {
        WTF::StringImpl::destroy(v39, v38);
      }
      else {
        *(_DWORD *)v39 -= 2;
      }
    }
  }
  double v40 = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v73, [a3 _applicationNameForDesktopUserAgent]);
  WTF::String::operator=((uint64_t *)v40 + 46, &v73);
  uint64_t v42 = v73;
  double v73 = 0;
  if (v42)
  {
    if (*(_DWORD *)v42 == 2) {
      WTF::StringImpl::destroy(v42, v41);
    }
    else {
      *(_DWORD *)v42 -= 2;
    }
  }
  int v43 = (WebKit::NavigationState *)WTF::fastMalloc((WTF *)0x60);
  WebKit::NavigationState::NavigationState(v43, self);
  std::unique_ptr<WebKit::NavigationState>::reset[abi:sn180100]((WebKit::NavigationState **)&self->_navigationState, v43);
  double v44 = self->_page.m_ptr;
  WebKit::NavigationState::createNavigationClient((WebKit::NavigationState *)self->_navigationState.__ptr_.__value_, &v73);
  uint64_t v45 = *((void *)v44 + 9);
  *((void *)v44 + 9) = v73;
  if (v45) {
    (*(void (**)(uint64_t))(*(void *)v45 + 8))(v45);
  }
  CGRect v46 = (WebKit::UIDelegate *)WTF::fastMalloc((WTF *)0x20);
  WebKit::UIDelegate::UIDelegate(v46, self);
  std::unique_ptr<WebKit::UIDelegate>::reset[abi:sn180100]((uint64_t *)&self->_uiDelegate, (uint64_t)v46);
  v47 = self->_page.m_ptr;
  uint64_t v48 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x20);
  *(void *)uint64_t v48 = &unk_1EE9CE060;
  *((void *)v48 + 1) = self;
  *((void *)v48 + 2) = 0;
  double v73 = v48;
  WebKit::WebPageProxy::setFindClient((uint64_t)v47, (void **)&v73);
  if (v73) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v73 + 8))(v73);
  }
  uint64_t v49 = self->_page.m_ptr;
  uint64_t v50 = (void *)WTF::fastMalloc((WTF *)0x20);
  *uint64_t v50 = &unk_1EE9CDC70;
  v50[1] = self;
  v50[2] = 0;
  uint64_t v51 = *((void *)v49 + 16);
  *((void *)v49 + 16) = v50;
  if (v51) {
    (*(void (**)(uint64_t))(*(void *)v51 + 8))(v51);
  }
  uint64_t v52 = WTF::fastMalloc((WTF *)0x20);
  *(_DWORD *)uint64_t v52 = 0;
  *(void *)(v52 + 8) = self;
  *(void *)(v52 + 16) = 0;
  value = (id *)self->_iconLoadingDelegate.__ptr_.__value_;
  self->_iconLoadingDelegate.__ptr_.__value_ = (IconLoadingDelegate *)v52;
  if (value) {
    WebKit::IconLoadingDelegate::operator delete(value);
  }
  uint64_t v54 = (WebKit::ResourceLoadDelegate *)WTF::fastMalloc((WTF *)0x20);
  WebKit::ResourceLoadDelegate::ResourceLoadDelegate(v54, self);
  uint64_t v55 = (id *)self->_resourceLoadDelegate.__ptr_.__value_;
  self->_resourceLoadDelegate.__ptr_.__value_ = (ResourceLoadDelegate *)v54;
  if (v55) {
    WebKit::ResourceLoadDelegate::operator delete(v55);
  }
  uint64_t v56 = v72 + 42;
  uint64_t v57 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::WallTime>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::WallTime>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::WallTime,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::WallTime>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::begin((void **)v72 + 42);
  int v58 = v57;
  CGRect v60 = v59;
  if (*v56) {
    uint64_t v61 = *v56 + 16 * *(unsigned int *)(*v56 - 4);
  }
  else {
    uint64_t v61 = 0;
  }
  if ((void *)v61 != v57)
  {
    do
    {
      double v62 = self->_page.m_ptr;
      double v63 = (WTF::StringImpl *)v58[1];
      ++*((_DWORD *)v63 + 2);
      double v73 = v63;
      WebKit::WebPageProxy::setURLSchemeHandlerForScheme(v62, &v73);
      double v64 = v73;
      double v73 = 0;
      if (v64)
      {
        if (*((_DWORD *)v64 + 2) == 1) {
          (*(void (**)(WTF::StringImpl *))(*(void *)v64 + 8))(v64);
        }
        else {
          --*((_DWORD *)v64 + 2);
        }
      }
      while (1)
      {
        v58 += 2;
        if (v58 == v60) {
          break;
        }
        if ((unint64_t)(*v58 + 1) > 1) {
          goto LABEL_64;
        }
      }
      int v58 = v60;
LABEL_64:
      ;
    }
    while (v58 != (void *)v61);
  }
  objc_storeWeak((id *)(*((void *)self->_page.m_ptr + 4) + 2016), self);
  WTF::MonotonicTime::now((WTF::MonotonicTime *)[MEMORY[0x1E4FB6208] installForWebViewIfNeeded:self kind:@"WKWebView" deprecated:0]);
  self->_timeOfRequestForVisibleContentRectUpdate.m_value = v65;
  self->_timeOfLastVisibleContentRectUpdate.m_value = v65;
  if (!self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_) {
    self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.__engaged_ = 1;
  }
  self->_timeOfFirstVisibleContentRectUpdateWithPendingCommit.var0.__val_.m_value = v65;
  uint64_t v66 = self->_activeWritingToolsSession.m_ptr;
  self->_activeWritingToolsSession.m_ptr = 0;
  if (v66) {
    CFRelease(v66);
  }
  uint64_t v67 = (void *)[MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
  uint64_t v68 = v67;
  if (v67) {
    CFRetain(v67);
  }
  uint64_t v69 = self->_writingToolsTextSuggestions.m_ptr;
  self->_writingToolsTextSuggestions.m_ptr = v68;
  if (v69) {
    CFRelease(v69);
  }
  uint64_t v70 = v72;
  v72 = 0;
  if (v70) {
    CFRelease(v70[1]);
  }
}

- (void)layoutSubviews
{
  m_ptr = self->_warningView.m_ptr;
  [(WKWebView *)self bounds];
  objc_msgSend(m_ptr, "setFrame:");
  v4.receiver = self;
  v4.super_class = (Class)WKWebView;
  [(WKWebView *)&v4 layoutSubviews];
  [(WKWebView *)self _frameOrBoundsMayHaveChanged];
}

- (id)_contentSizeCategory
{
  int v2 = (void *)[MEMORY[0x1E4F42738] sharedApplication];

  return (id)[v2 preferredContentSizeCategory];
}

- (void)setNavigationDelegate:(id)navigationDelegate
{
  m_ptr = self->_page.m_ptr;
  WebKit::NavigationState::createNavigationClient((WebKit::NavigationState *)self->_navigationState.__ptr_.__value_, &v8);
  uint64_t v6 = *((void *)m_ptr + 9);
  *((void *)m_ptr + 9) = v8;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  value = self->_navigationState.__ptr_.__value_;

  WebKit::NavigationState::setNavigationDelegate((uint64_t)value, navigationDelegate);
}

- (void)_setBackgroundExtendsBeyondPage:(BOOL)a3
{
  BOOL v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setBackgroundExtendsBeyondPage((uint64_t)m_ptr, v3);
}

- (void)setInspectable:(BOOL)inspectable
{
  BOOL v3 = inspectable;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setInspectable((WebKit::WebPageProxy *)m_ptr, v3);
}

- (void)_setInputDelegate:(id)a3
{
  objc_storeWeak(&self->_inputDelegate.m_weakReference, a3);
  m_ptr = self->_page.m_ptr;
  if (a3)
  {
    uint64_t v6 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v6 = &unk_1EE9C4DF0;
    *(void *)(v6 + 8) = 0;
    objc_initWeak((id *)(v6 + 8), self);
    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  WebKit::WebPageProxy::setFormClient((uint64_t)m_ptr, &v7);
  if (v7) {
    (*(void (**)(void *))(*v7 + 8))(v7);
  }
}

uint64_t __65__WKWebView_WKViewInternalIOS___presentLockdownModeAlertIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _presentLockdownMode];
  *(unsigned char *)(*(void *)(a1 + 32) + 1281) = 0;
  return result;
}

- (void)_presentLockdownMode
{
  if ((WebCore::IOSApplication::isMobileSafari((WebCore::IOSApplication *)self) & 1) != 0
    || !+[WKProcessPool _lockdownModeEnabledGloballyForTesting])
  {
    lockdownModeWarningNeeded = 0;
    return;
  }
  char v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"WebKitCaptivePortalModeAlertShown");
  lockdownModeWarningNeeded = v3 ^ 1;
  if (v3) {
    return;
  }
  WebCore::copyLocalizedString((uint64_t *)&arg, (WebCore *)@"Certain experiences and features may not function as expected. You can turn off Lockdown Mode for this app in Settings.", v4);
  if (!arg)
  {
    CFTypeRef v5 = 0;
    if (!self) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  CFAutorelease(arg);
  CFTypeRef v5 = arg;
  if (self) {
LABEL_6:
  }
    CFRetain(self);
LABEL_7:
  uint64_t v6 = malloc_type_malloc(0x30uLL, 0x10E00408A4B35D9uLL);
  *uint64_t v6 = MEMORY[0x1E4F14398];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(WKDialogResult)>::fromCallable<-[WKWebView(WKViewInternalIOS) _presentLockdownMode]::$_3>([(WKWebView(WKViewInternalIOS) *)void * _presentLockdownMode]#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(WKDialogResult)>::fromCallable<-[WKWebView(WKViewInternalIOS) _presentLockdownMode]::$_3>(-[WKWebView(WKViewInternalIOS) _presentLockdownMode]::$_3)::descriptor;
  v6[4] = v5;
  v6[5] = self;
  [(WKWebView *)self UIDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(-[WKWebView UIDelegate](self, "UIDelegate"), "webView:showLockdownModeFirstUseMessage:completionHandler:", self, v5, v6);
  }
  else {
    ((void (*)(void *, uint64_t))v6[2])(v6, 1);
  }
  _Block_release(v6);
}

- (void)_setIconLoadingDelegate:(id)a3
{
  m_ptr = self->_page.m_ptr;
  WebKit::IconLoadingDelegate::createIconLoadingClient((WebKit::IconLoadingDelegate *)self->_iconLoadingDelegate.__ptr_.__value_, &v7);
  WebKit::WebPageProxy::setIconLoadingClient((uint64_t)m_ptr, &v7);
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  value = self->_iconLoadingDelegate.__ptr_.__value_;

  WebKit::IconLoadingDelegate::setDelegate((uint64_t)value, a3);
}

- (void)setUnderPageBackgroundColor:(UIColor *)underPageBackgroundColor
{
  m_ptr = self->_page.m_ptr;
  CFStringRef v4 = [(UIColor *)underPageBackgroundColor CGColor];
  uint64_t v6 = WebCore::roundAndClampToSRGBALossy(v4, v5);
  uint64_t v7 = bswap32(v6) | 0x1104000000000000;
  if (!BYTE4(v6)) {
    uint64_t v7 = 0;
  }
  uint64_t v10 = v7;
  WebKit::WebPageProxy::setUnderPageBackgroundColorOverride((WebKit::WebPageProxy *)m_ptr, (unint64_t *)&v10);
  if ((v10 & 0x8000000000000) != 0)
  {
    uint64_t v9 = (unsigned int *)(v10 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v10 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v9);
      WTF::fastFree((WTF *)v9, v8);
    }
  }
}

- (BOOL)_hasActiveNowPlayingSession
{
  return self->__hasActiveNowPlayingSession;
}

- (void)setAllowsLinkPreview:(BOOL)allowsLinkPreview
{
  BOOL v3 = allowsLinkPreview;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  if (self->_allowsLinkPreview != v3)
  {
    self->_allowsLinkPreview = v3;
    uint64_t v6 = self->_contentView.m_ptr;
    if (v3) {
      [v6 _registerPreview];
    }
    else {
      [v6 _unregisterPreview];
    }
    uint64_t v7 = self->_contentView.m_ptr;
    [v7 _didChangeLinkPreviewAvailability];
  }
}

- (void)setUIDelegate:(id)UIDelegate
{
  WebKit::UIDelegate::setDelegate((uint64_t)self->_uiDelegate.__ptr_.__value_, UIDelegate);
  m_ptr = self->_page.m_ptr;
  WebKit::UIDelegate::createUIClient((WebKit::UIDelegate *)self->_uiDelegate.__ptr_.__value_, &v6);
  WebKit::WebPageProxy::setUIClient((uint64_t)m_ptr, (uint64_t *)&v6);
  CFTypeRef v5 = v6;
  uint64_t v6 = 0;
  if (v5) {
    (*(void (**)(WebKit::UIDelegate::UIClient *))(*(void *)v5 + 8))(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 53) = 0;
  *((void *)self + 54) = 0;
  *((void *)self + 55) = 0;
  *((void *)self + 56) = 0;
  *((void *)self + 57) = 0;
  *((void *)self + 58) = 0;
  *((void *)self + 59) = 0;
  *((void *)self + 60) = 0;
  *((_WORD *)self + 244) = 0;
  *((void *)self + 73) = 0;
  *((void *)self + 74) = 0;
  *((void *)self + 75) = 0;
  *((void *)self + 78) = 0;
  *((void *)self + 79) = 0;
  *((void *)self + 80) = 0;
  *((void *)self + 81) = 0;
  *((void *)self + 82) = 0;
  *((void *)self + 83) = 0;
  *((void *)self + 84) = 0;
  *((unsigned char *)self + 688) = 0;
  *((unsigned char *)self + 720) = 0;
  *((void *)self + 91) = 0;
  *((void *)self + 92) = 0;
  *(_OWORD *)((char *)self + 744) = xmmword_1994F6270;
  *((_WORD *)self + 380) = 0;
  *((_DWORD *)self + 191) = 0;
  *((_WORD *)self + 384) = 0;
  *((void *)self + 97) = 0;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *((_OWORD *)self + 49) = *MEMORY[0x1E4F1DB28];
  *((_OWORD *)self + 50) = v2;
  *((unsigned char *)self + 816) = 0;
  *((unsigned char *)self + 824) = 0;
  *((unsigned char *)self + 828) = 0;
  *((unsigned char *)self + 836) = 0;
  *((void *)self + 105) = 0;
  *((void *)self + 106) = 0;
  *((_WORD *)self + 428) = 1;
  *((unsigned char *)self + 858) = 0;
  *((unsigned char *)self + 860) = 0;
  *((unsigned char *)self + 868) = 0;
  *((unsigned char *)self + 872) = 0;
  *((unsigned char *)self + 876) = 0;
  *((unsigned char *)self + 880) = 0;
  *((unsigned char *)self + 884) = 0;
  *((unsigned char *)self + 888) = 0;
  *((unsigned char *)self + 896) = 0;
  *((unsigned char *)self + 904) = 0;
  *((unsigned char *)self + 936) = 0;
  *((unsigned char *)self + 944) = 0;
  *((unsigned char *)self + 976) = 0;
  *((unsigned char *)self + 1008) = 0;
  *((unsigned char *)self + 1072) = 0;
  *((void *)self + 123) = 0;
  *((void *)self + 124) = 0;
  *((unsigned char *)self + 1000) = 0;
  *(_OWORD *)((char *)self + 1016) = 0u;
  *(_OWORD *)((char *)self + 1032) = 0u;
  *((unsigned char *)self + 1048) = 0;
  *((unsigned char *)self + 1080) = 0;
  *((unsigned char *)self + 1128) = 0;
  *((unsigned char *)self + 1136) = 0;
  *((unsigned char *)self + 1160) = 0;
  *((void *)self + 188) = 0;
  *((void *)self + 191) = 0;
  *((void *)self + 192) = 0;
  *((void *)self + 190) = 0;
  *((void *)self + 193) = 0;
  *((void *)self + 194) = 0;
  *((void *)self + 195) = 0;
  *((void *)self + 197) = 0;
  *((void *)self + 198) = 0;
  *((void *)self + 200) = 0;
  *((void *)self + 201) = 0;
  *((void *)self + 202) = 0;
  *((void *)self + 206) = 0;
  *((void *)self + 207) = 0;
  *((void *)self + 208) = 0;
  *((void *)self + 209) = 0;
  *((unsigned char *)self + 1680) = 0;
  *(_WORD *)((char *)self + 1681) = 0;
  *((void *)self + 213) = 0;
  *((void *)self + 214) = 0;
  *((unsigned char *)self + 1720) = 0;
  *((unsigned char *)self + 1728) = 0;
  *((void *)self + 219) = 0;
  *((void *)self + 221) = 0;
  *((void *)self + 222) = 0;
  return self;
}

- (void)_resizeWhileHidingContentWithUpdates:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFTypeRef v5 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    int v7 = 134218240;
    uint64_t v8 = self;
    __int16 v9 = 2048;
    uint64_t v10 = v6;
    _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _resizeWhileHidingContentWithUpdates:]", (uint8_t *)&v7, 0x16u);
  }
  [(WKWebView *)self _beginAnimatedResizeWithUpdates:a3];
  if (self->_perProcessState.dynamicViewportUpdateMode == 1)
  {
    [self->_contentView.m_ptr setHidden:1];
    self->_perProcessState.int dynamicViewportUpdateMode = 2;
    self->_perProcessState.waitingForEndAnimatedReCGSize size = 0;
  }
}

- (void)_beginAnimatedResizeWithUpdates:(id)a3
{
  uint64_t v155 = *MEMORY[0x1E4F143B8];
  p_perProcessState = &self->_perProcessState;
  int dynamicViewportUpdateMode = self->_perProcessState.dynamicViewportUpdateMode;
  [(WKWebView *)self bounds];
  v146.origin.double x = v157.origin.x;
  v146.origin.double y = v157.origin.y;
  m_ptr = self->_page.m_ptr;
  v146.size.CGFloat width = v157.size.width;
  v146.size.CGFloat height = v157.size.height;
  uint64_t v8 = (float *)*((void *)m_ptr + 4);
  float v9 = v8[574];
  float v10 = v8[575];
  float v11 = v8[576];
  float v12 = v8[577];
  BOOL v13 = CGRectIsEmpty(v157) && CGRectIsEmpty(p_perProcessState->animatedResizeOldBounds);
  if (![(WKWebView *)self usesStandardContentView]
    || (!p_perProcessState->hasCommittedLoadForMainFrame ? (char v14 = 1) : (char v14 = v13),
        (v14 & 1) != 0 || v11 <= 0.0 || v12 <= 0.0 || p_perProcessState->liveResizeParameters.__engaged_))
  {
    if (objc_opt_respondsToSelector())
    {
      double v15 = self->_customContentView.m_ptr;
      objc_msgSend(v15, "web_beginAnimatedResizeWithUpdates:", a3);
    }
    else
    {
      uint64_t v16 = (void (*)(id))*((void *)a3 + 2);
      v16(a3);
    }
    return;
  }
  double v17 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    *(_DWORD *)CALayer buf = 134218240;
    *(void *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_1985F2000, v17, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _beginAnimatedResizeWithUpdates:]", buf, 0x16u);
  }
  p_origin = &p_perProcessState->animatedResizeOldBounds.origin;
  v158.origin.double x = p_perProcessState->animatedResizeOldBounds.origin.x;
  p_perProcessState->int dynamicViewportUpdateMode = 1;
  v158.origin.double y = p_perProcessState->animatedResizeOldBounds.origin.y;
  v158.size.CGFloat width = p_perProcessState->animatedResizeOldBounds.size.width;
  v158.size.CGFloat height = p_perProcessState->animatedResizeOldBounds.size.height;
  if (!CGRectIsEmpty(v158))
  {
    CGSize size = p_perProcessState->animatedResizeOldBounds.size;
    v146.origin = *p_origin;
    v146.CGSize size = size;
    int animatedResizeOldOrientation = self->_animatedResizeOldOrientation;
    double left = self->_animatedResizeOldObscuredInsets.left;
    animatedResizeOldMinimumEffectiveDevicedouble Width = self->_animatedResizeOldMinimumEffectiveDeviceWidth;
    double bottom = self->_animatedResizeOldObscuredInsets.bottom;
    double right = self->_animatedResizeOldObscuredInsets.right;
    double top = self->_animatedResizeOldObscuredInsets.top;
    CGPoint *p_origin = 0u;
    p_perProcessState->animatedResizeOldBounds.CGSize size = 0u;
    goto LABEL_30;
  }
  [(WKWebView *)self _minimumEffectiveDeviceWidth];
  animatedResizeOldMinimumEffectiveDevicedouble Width = v20;
  if (self->_overridesInterfaceOrientation)
  {
    unint64_t v21 = self->_interfaceOrientationOverride - 2;
    if (v21 >= 3)
    {
      int animatedResizeOldOrientation = 0;
      goto LABEL_29;
    }
    double v22 = (int *)&dword_1994F6750[v21];
  }
  else
  {
    double v22 = (int *)((char *)self->_page.m_ptr + 444);
  }
  int animatedResizeOldOrientation = *v22;
LABEL_29:
  double top = self->_obscuredInsets.top;
  double left = self->_obscuredInsets.left;
  double bottom = self->_obscuredInsets.bottom;
  double right = self->_obscuredInsets.right;
LABEL_30:
  [(WKWebView *)self activeViewLayoutSize:&v146];
  float v120 = v25;
  float v121 = v24;
  if (self->_overriddenLayoutParameters.__engaged_) {
    p_minimumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize;
  }
  else {
    p_minimumUnobscuredSize = &v146.size;
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)buf, p_minimumUnobscuredSize);
  float32x2_t v119 = *(float32x2_t *)buf;
  if (self->_overriddenLayoutParameters.__engaged_) {
    p_maximumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize;
  }
  else {
    p_maximumUnobscuredSize = &v146.size;
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)buf, p_maximumUnobscuredSize);
  float32x2_t v118 = *(float32x2_t *)buf;
  (*((void (**)(id))a3 + 2))(a3);
  memset(&v145, 0, sizeof(v145));
  [(WKWebView *)self bounds];
  v145.origin.double x = v28;
  v145.origin.double y = v29;
  v145.size.CGFloat width = v30;
  v145.size.CGFloat height = v31;
  [(WKWebView *)self _minimumEffectiveDeviceWidth];
  double v122 = v32;
  [(WKWebView *)self activeViewLayoutSize:&v145];
  float v138 = v34;
  float v139 = v33;
  if (self->_overriddenLayoutParameters.__engaged_) {
    p_CGSize size = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize;
  }
  else {
    p_CGSize size = &v145.size;
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)buf, p_size);
  float32x2_t v136 = *(float32x2_t *)buf;
  if (self->_overriddenLayoutParameters.__engaged_) {
    uint64_t v36 = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize;
  }
  else {
    uint64_t v36 = &v145.size;
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)buf, v36);
  if (self->_overridesInterfaceOrientation)
  {
    unint64_t v37 = self->_interfaceOrientationOverride - 2;
    uint64_t v38 = &OBJC_IVAR___WKObservablePageState__page;
    if (v37 >= 3)
    {
      unsigned int v135 = 0;
      goto LABEL_48;
    }
    CGFloat v39 = &dword_1994F6750[v37];
  }
  else
  {
    CGFloat v39 = (unsigned int *)((char *)self->_page.m_ptr + 444);
    uint64_t v38 = &OBJC_IVAR___WKObservablePageState__page;
  }
  unsigned int v135 = *v39;
LABEL_48:
  float32x2_t v137 = *(float32x2_t *)buf;
  double v40 = (double *)((char *)self + v38[99]);
  double v41 = *v40;
  double v42 = v40[1];
  double v115 = v40[2];
  double v117 = v40[3];
  double v127 = *v40 + v145.origin.y;
  double v128 = v42 + v145.origin.x;
  v144.origin.double x = v42 + v145.origin.x;
  v144.origin.double y = v127;
  double v125 = v145.size.height - (v41 + v115);
  double v126 = v145.size.width - (v42 + v117);
  v144.size.CGFloat width = v126;
  v144.size.CGFloat height = v125;
  objc_msgSend(self->_contentView.m_ptr, "bounds", *(void *)&v115);
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  double v123 = v48;
  double v124 = v47;
  if (CGRectIsEmpty(v145)) {
    goto LABEL_53;
  }
  if (v139 <= 0.0) {
    goto LABEL_53;
  }
  if (v138 <= 0.0) {
    goto LABEL_53;
  }
  v159.origin.double y = v127;
  v159.origin.double x = v128;
  v159.size.CGFloat height = v125;
  v159.size.CGFloat width = v126;
  if (CGRectIsEmpty(v159)
    || (v160.origin.x = v44, v160.origin.y = v46, v160.size.height = v123, v160.size.CGFloat width = v124, CGRectIsEmpty(v160)))
  {
LABEL_53:
    if (CGRectIsEmpty(v145))
    {
      CGSize v49 = v146.size;
      CGPoint *p_origin = v146.origin;
      p_perProcessState->animatedResizeOldBounds.CGSize size = v49;
      self->_animatedResizeOldMinimumEffectiveDevicedouble Width = animatedResizeOldMinimumEffectiveDeviceWidth;
      self->_int animatedResizeOldOrientation = animatedResizeOldOrientation;
      self->_animatedResizeOldObscuredInsets.double top = top;
      self->_animatedResizeOldObscuredInsets.double left = left;
      self->_animatedResizeOldObscuredInsets.double bottom = bottom;
      self->_animatedResizeOldObscuredInsets.double right = right;
      *(_WORD *)&p_perProcessState->waitingForEndAnimatedReCGSize size = 257;
    }
    else
    {
      [(WKWebView *)self _cancelAnimatedResize];
    }
    [(WKWebView *)self _frameOrBoundsMayHaveChanged];
    if (self->_overriddenLayoutParameters.__engaged_)
    {
      *(float *)&double v51 = v138;
      *(float *)&double v50 = v139;
      -[WKWebView _dispatchSetViewLayoutSize:](self, "_dispatchSetViewLayoutSize:", v50, v51);
      uint64_t v52 = self->_page.m_ptr;
      *(float32x2_t *)CALayer buf = v136;
      WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)v52, (const WebCore::FloatSize *)buf);
      uint64_t v53 = self->_page.m_ptr;
      *(float32x2_t *)CALayer buf = v137;
      WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)v53, (const WebCore::FloatSize *)buf);
      uint64_t v54 = self->_page.m_ptr;
      *(float32x2_t *)CALayer buf = v137;
      WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)v54, (const WebCore::FloatSize *)buf);
    }
    if (self->_overridesInterfaceOrientation) {
      [(WKWebView *)self _dispatchSetDeviceOrientation:v135];
    }
  }
  else if (!dynamicViewportUpdateMode {
         && CGRectEqualToRect(v146, v145)
  }
         && v121 == v139
         && v120 == v138
         && (int32x2_t v55 = vceq_f32(v119, v136), (v55.i32[0] & v55.i32[1] & 1) != 0)
         && (int32x2_t v56 = vceq_f32(v118, v137), (v56.i8[0] & 1) != 0)
         && (v56.i8[4] & 1) != 0
         && animatedResizeOldOrientation == v135
         && animatedResizeOldMinimumEffectiveDeviceWidth == v122
         && left == v42
         && top == v41
         && right == v117
         && bottom == v116)
  {
    [(WKWebView *)self _cancelAnimatedResize];
  }
  else
  {
    uint64_t v57 = (_OWORD *)MEMORY[0x1E4F39B10];
    long long v58 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v60 = *MEMORY[0x1E4F39B10];
    long long v59 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23 = v58;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m11 = v60;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13 = v59;
    long long v61 = v57[7];
    long long v63 = v57[4];
    long long v62 = v57[5];
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41 = v57[6];
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43 = v61;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31 = v63;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33 = v62;
    [(WKWebView *)self _ensureResizeAnimationView];
    double v64 = self->_scrollView.m_ptr;
    double v65 = v139 / v124;
    [v64 minimumZoomScale];
    if (v66 >= v65) {
      double v66 = v139 / v124;
    }
    [v64 setMinimumZoomScale:v66];
    uint64_t v67 = self->_scrollView.m_ptr;
    [v67 maximumZoomScale];
    if (v65 >= v68) {
      double v68 = v139 / v124;
    }
    [v67 setMaximumZoomScale:v68];
    BOOL v69 = [(WKWebView *)self _isWindowResizingEnabled];
    if (v124 <= v11) {
      double v70 = v124;
    }
    else {
      double v70 = v11;
    }
    if (v69) {
      double v70 = v124;
    }
    p_perProcessState->animatedResizeOriginalContentdouble Width = v70;
    double v71 = v139 / v70;
    v72 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v72)
    {
      [v72 affineTransform];
      double v73 = *(double *)buf;
    }
    else
    {
      double v73 = 0.0;
    }
    double v74 = self->_resizeAnimationView.m_ptr;
    CGAffineTransformMakeScale(&v143, v71 / v73, v71 / v73);
    [v74 setTransform:&v143];
    *(float *)CALayer buf = v9 + (float)(v11 * 0.5);
    *(float *)&buf[4] = v10 + (float)(v12 * 0.5);
    WebCore::FloatPoint::operator CGPoint();
    -[WKWebView convertPoint:fromView:](self, "convertPoint:fromView:", self->_contentView.m_ptr);
    double v76 = v75;
    double v78 = v77;
    [self->_scrollView.m_ptr contentOffset];
    double v80 = v76 - (v128 + v126 * 0.5) + v79;
    double v82 = v78 - (v127 + v125 * 0.5) + v81;
    double v84 = v40[2];
    double v83 = v40[3];
    double v85 = v123 * v71;
    if (v124 * v71 - v145.size.width + v83 < v80) {
      double v80 = v124 * v71 - v145.size.width + v83;
    }
    if (v85 - v145.size.height + v84 < v82) {
      double v82 = v85 - v145.size.height + v84;
    }
    double v86 = *v40;
    if (v80 >= -v40[1]) {
      double v87 = v80;
    }
    else {
      double v87 = -v40[1];
    }
    double v88 = -v86;
    if (v82 >= -v86) {
      double v88 = v82;
    }
    if (v123 + -1.0 >= (float)(v10 + v12)) {
      double v89 = v88;
    }
    else {
      double v89 = v85 - v145.size.height + v84;
    }
    if (v10 < 1.0)
    {
      [(WKWebView *)self _initialContentOffsetForScrollView];
      double v89 = v90;
    }
    double v91 = self->_page.m_ptr;
    uint64_t v92 = 764;
    if (!*((unsigned char *)v91 + 768)) {
      uint64_t v92 = 760;
    }
    objc_msgSend(self->_scrollView.m_ptr, "setContentSize:", floor(v124 * v71 * *(float *)((char *)v91 + v92)) / *(float *)((char *)v91 + v92), floor(v85 * *(float *)((char *)v91 + v92)) / *(float *)((char *)v91 + v92));
    objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:", v87, v89);
    -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, *(_OWORD *)&v145.origin, v145.size.width, v145.size.height);
    v142.origin.double x = v93;
    v142.origin.double y = v94;
    v142.size.CGFloat width = v95;
    v142.size.CGFloat height = v96;
    -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, v128, v127, v126, v125);
    v141.origin.double x = v97;
    v141.origin.double y = v98;
    v141.size.CGFloat width = v99;
    v141.size.CGFloat height = v100;
    [(WKWebView *)self _computedUnobscuredSafeAreaInset];
    float v102 = v101;
    float v104 = v103;
    float v106 = v105;
    float v108 = v107;
    if (!p_perProcessState->lastSentViewLayoutSize.__engaged_) {
      p_perProcessState->lastSentViewLayoutSize.__engaged_ = 1;
    }
    p_perProcessState->lastSentViewLayoutSize.var0.__val_.m_CGFloat width = v139;
    p_perProcessState->lastSentViewLayoutSize.var0.__val_.m_CGFloat height = v138;
    p_perProcessState->lastSentDeviceOrientation.var0.__val_ = v135;
    p_perProcessState->lastSentDeviceOrientation.__engaged_ = 1;
    p_perProcessState->lastSentMinimumEffectiveDeviceWidth.var0.__val_ = v122;
    p_perProcessState->lastSentMinimumEffectiveDeviceWidth.__engaged_ = 1;
    v109 = self->_page.m_ptr;
    *(float *)CALayer buf = v139;
    *(float *)&buf[4] = v138;
    *(float32x2_t *)&long long v110 = v136;
    *((float32x2_t *)&v110 + 1) = v137;
    *(_OWORD *)&uint8_t buf[8] = v110;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v148, &v142);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v149, &v141);
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v150, &v144);
    *(float *)&v150[4] = v102;
    *(float *)&v150[5] = v104;
    *(float *)&v150[6] = v106;
    *(float *)&v150[7] = v108;
    double v151 = v71;
    unsigned int v152 = v135;
    double v153 = v122;
    unint64_t v111 = self->_currentDynamicViewportSizeUpdateID + 1;
    self->_currentDynamicViewportSizeUpdateID = v111;
    unint64_t v154 = v111;
    WebKit::WebPageProxy::dynamicViewportSizeUpdate((uint64_t)v109, (uint64_t)buf);
    v112 = (int32x2_t *)*((void *)self->_page.m_ptr + 29);
    if (v112)
    {
      WebCore::IntSize::IntSize((WebCore::IntSize *)buf, &v145.size);
      IntSize v140 = 0;
      WebKit::DrawingAreaProxy::setSize(v112, (const IntSize *)buf, (int32x2_t *)&v140, v113, v114);
    }
    *(_WORD *)&p_perProcessState->waitingForEndAnimatedReCGSize size = 257;
  }
}

- (WKWebView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = objc_alloc_init(WKWebViewConfiguration);
  float v9 = -[WKWebView initWithFrame:configuration:](self, "initWithFrame:configuration:", v8, x, y, width, height);
  if (v8) {
    CFRelease(v8);
  }
  return v9;
}

- (WKWebView)initWithCoder:(NSCoder *)coder
{
  v6.receiver = self;
  v6.super_class = (Class)WKWebView;
  CFStringRef v4 = -[WKWebView initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    [(WKWebView *)v4 _initializeWithConfiguration:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"configuration"]];
    [(WKWebView *)v4 setAllowsBackForwardNavigationGestures:[(NSCoder *)coder decodeBoolForKey:@"allowsBackForwardNavigationGestures"]];
    [(WKWebView *)v4 setCustomUserAgent:[(NSCoder *)coder decodeObjectOfClass:objc_opt_class() forKey:@"customUserAgent"]];
    [(WKWebView *)v4 setAllowsLinkPreview:[(NSCoder *)coder decodeBoolForKey:@"allowsLinkPreview"]];
    [(WKWebView *)v4 setFindInteractionEnabled:[(NSCoder *)coder decodeBoolForKey:@"findInteractionEnabled"]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  -[WKWebView encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_configuration.m_ptr forKey:@"configuration"];
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebView allowsBackForwardNavigationGestures](self, "allowsBackForwardNavigationGestures"), @"allowsBackForwardNavigationGestures");
  objc_msgSend(a3, "encodeObject:forKey:", -[WKWebView customUserAgent](self, "customUserAgent"), @"customUserAgent");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebView allowsLinkPreview](self, "allowsLinkPreview"), @"allowsLinkPreview");
  objc_msgSend(a3, "encodeBool:forKey:", -[WKWebView isFindInteractionEnabled](self, "isFindInteractionEnabled"), @"findInteractionEnabled");
}

- (void)dealloc
{
  BOOL v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainRunLoop(v3, (objc_object *)self) & 1) == 0)
  {
    [(WKWebView *)self _setResourceLoadDelegate:0];
    [self->_contentView.m_ptr _webViewDestroyed];
    m_ptr = self->_page.m_ptr;
    if (m_ptr)
    {
      if (!self->_remoteObjectRegistry.m_ptr
        || (uint64_t v5 = API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*((void *)m_ptr + 6) + 24)),
            IPC::MessageReceiverMap::removeMessageReceiver(v5 + 56, 0x6Au, *(void *)(*((void *)self->_page.m_ptr + 4) + 760)), (m_ptr = self->_page.m_ptr) != 0))
      {
        WebKit::WebPageProxy::close((unsigned int *)m_ptr);
      }
    }
    [self->_remoteObjectRegistry.m_ptr _invalidate];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
    [self->_scrollView.m_ptr setInternalDelegate:0];
    [(WKWebView *)self _invalidateResizeAssertions];
    v6.receiver = self;
    v6.super_class = (Class)WKWebView;
    [(WKWebView *)&v6 dealloc];
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"serverTrust"])
  {
    return [(WKWebView *)self serverTrust];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WKWebView;
    return [(WKWebView *)&v6 valueForUndefinedKey:a3];
  }
}

- (WKBackForwardList)backForwardList
{
  if (self)
  {
    BOOL didAccessBackForwardList = self->_didAccessBackForwardList;
    self->_BOOL didAccessBackForwardList = 1;
    if (!didAccessBackForwardList) {
      -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
    }
  }
  return *(WKBackForwardList **)(*((void *)self->_page.m_ptr + 83) + 8);
}

- (id)navigationDelegate
{
  WebKit::NavigationState::navigationDelegate((id *)self->_navigationState.__ptr_.__value_, &cf);
  long long v2 = (void *)CFMakeCollectable(cf);

  return v2;
}

- (id)UIDelegate
{
  WebKit::DiagnosticLoggingClient::delegate((id *)self->_uiDelegate.__ptr_.__value_, &cf);
  long long v2 = (void *)CFMakeCollectable(cf);

  return v2;
}

- (_WKIconLoadingDelegate)_iconLoadingDelegate
{
  WebKit::DiagnosticLoggingClient::delegate((id *)self->_iconLoadingDelegate.__ptr_.__value_, &cf);
  long long v2 = (void *)CFMakeCollectable(cf);

  return (_WKIconLoadingDelegate *)v2;
}

- (_WKResourceLoadDelegate)_resourceLoadDelegate
{
  WebKit::DiagnosticLoggingClient::delegate((id *)self->_resourceLoadDelegate.__ptr_.__value_, &cf);
  long long v2 = (void *)CFMakeCollectable(cf);

  return (_WKResourceLoadDelegate *)v2;
}

- (void)_setResourceLoadDelegate:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    value = self->_resourceLoadDelegate.__ptr_.__value_;
    if (value)
    {
      if (a3)
      {
        WebKit::ResourceLoadDelegate::createResourceLoadClient((WebKit::ResourceLoadDelegate *)value, &v9);
        WebKit::WebPageProxy::setResourceLoadClient(m_ptr, &v9);
        if (v9) {
          (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
        }
        int v7 = self->_resourceLoadDelegate.__ptr_.__value_;
        id v8 = a3;
      }
      else
      {
        uint64_t v9 = 0;
        WebKit::WebPageProxy::setResourceLoadClient(m_ptr, &v9);
        if (v9) {
          (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
        }
        int v7 = self->_resourceLoadDelegate.__ptr_.__value_;
        id v8 = 0;
      }
      WebKit::ResourceLoadDelegate::setDelegate((uint64_t)v7, v8);
    }
  }
}

- (WKNavigation)loadRequest:(NSURLRequest *)request
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  if (*((unsigned char *)m_ptr + 1190))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView was used to load a service worker"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x199732A50](v12, request);
  WebKit::WebPageProxy::loadRequest((uint64_t)m_ptr, (WebCore::ResourceRequestBase *)v12, 1, 0, 0, &v14);
  uint64_t v6 = v14;
  if (v14)
  {
    int v7 = *(const void **)(v14 + 8);
    if (v7)
    {
      CFRetain(*(CFTypeRef *)(v14 + 8));
      id v8 = *(const void **)(v6 + 8);
    }
    else
    {
      id v8 = 0;
    }
    CFRelease(v8);
  }
  else
  {
    int v7 = 0;
  }
  uint64_t v9 = (id)CFMakeCollectable(v7);
  CFTypeRef v10 = cf;
  CFTypeRef cf = 0;
  if (v10) {
    CFRelease(v10);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v12);
  return v9;
}

- (WKNavigation)loadFileURL:(NSURL *)URL allowingReadAccessToURL:(NSURL *)readAccessURL
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  if (*((unsigned char *)m_ptr + 1190)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView was used to load a service worker"];
  }
  if (![(NSURL *)URL isFileURL]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", URL format];
  }
  if (![(NSURL *)readAccessURL isFileURL]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", readAccessURL format];
  }
  id v8 = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v19, [[(NSURL *)URL filePathURL] absoluteString]);
  MEMORY[0x19972EAD0](&v18, [(NSURL *)readAccessURL absoluteString]);
  WebKit::WebPageProxy::loadFile((WebKit::WebPageProxy *)v8, (const WTF::String *)&v19, (const WTF::String *)&v18, 1, 0);
  uint64_t v9 = v20;
  if (v20)
  {
    uint64_t v20 = 0;
    CFTypeRef v10 = *(const void **)(v9 + 8);
    if (v10)
    {
      CFRetain(*(CFTypeRef *)(v9 + 8));
      float v11 = *(const void **)(v9 + 8);
    }
    else
    {
      float v11 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    CFTypeRef v10 = 0;
  }
  BOOL v13 = (id)CFMakeCollectable(v10);
  uint64_t v14 = v20;
  uint64_t v20 = 0;
  if (v14) {
    CFRelease(*(CFTypeRef *)(v14 + 8));
  }
  double v15 = v18;
  uint64_t v18 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v12);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  uint64_t v16 = v19;
  double v19 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v12);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  return v13;
}

- (WKNavigation)loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  id v8 = [(NSString *)string dataUsingEncoding:4];

  return [(WKWebView *)self loadData:v8 MIMEType:@"text/html" characterEncodingName:@"UTF-8" baseURL:baseURL];
}

- (WKNavigation)loadData:(NSData *)data MIMEType:(NSString *)MIMEType characterEncodingName:(NSString *)characterEncodingName baseURL:(NSURL *)baseURL
{
  uint64_t v26 = data;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  if (*((unsigned char *)m_ptr + 1190))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView was used to load a service worker"];
    m_ptr = self->_page.m_ptr;
  }
  WebCore::SharedBuffer::create<NSData *&>((WebCore::FragmentedSharedBuffer **)&v26, (NSData *)a2, (uint64_t *)&v24);
  MEMORY[0x19972EAD0](&v23, MIMEType);
  MEMORY[0x19972EAD0](&v22, characterEncodingName);
  MEMORY[0x19972EAD0](&v21, [(NSURL *)baseURL absoluteString]);
  WebKit::WebPageProxy::loadData((uint64_t)m_ptr, &v24, &v23, &v22, &v21, 0, 0, &v25);
  uint64_t v11 = v25;
  if (v25)
  {
    float v12 = *(const void **)(v25 + 8);
    if (v12)
    {
      CFRetain(*(CFTypeRef *)(v25 + 8));
      BOOL v13 = *(const void **)(v11 + 8);
    }
    else
    {
      BOOL v13 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    float v12 = 0;
  }
  double v15 = (id)CFMakeCollectable(v12);
  uint64_t v16 = v21;
  unint64_t v21 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v14);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  double v17 = v22;
  double v22 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v14);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  uint64_t v18 = v23;
  double v23 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy(v18, v14);
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  double v19 = (unsigned int *)v24;
  float v24 = 0;
  if (v19) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v19, v14);
  }
  return v15;
}

- (void)startDownloadUsingRequest:(NSURLRequest *)request completionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x199732A50](v12, request);
  int v7 = _Block_copy(completionHandler);
  uint64_t v8 = WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v8 = &unk_1EE9C4FE8;
  *(void *)(v8 + 8) = v7;
  uint64_t v11 = (StringImpl *)v8;
  WebKit::WebPageProxy::downloadRequest((WebKit::WebPageProxy *)m_ptr, v12, &v11);
  if (v11) {
    (*(void (**)(StringImpl *))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  CFTypeRef v9 = cf;
  CFTypeRef cf = 0;
  if (v9) {
    CFRelease(v9);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v12);
}

- (void)resumeDownloadFromResumeData:(NSData *)resumeData completionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:resumeData error:0];
  [v7 setDecodingFailurePolicy:0];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  double v15 = objc_msgSend(v7, "decodeObjectOfClasses:forKey:", objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0), @"NSKeyedArchiveRootObjectKey");
  [v7 finishDecoding];
  uint64_t v16 = [v15 objectForKey:@"NSURLSessionResumeInfoLocalPath"];
  if (!v16) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid resume data"];
  }
  double v17 = self->_page.m_ptr;
  CFTypeRef cf = resumeData;
  if (resumeData) {
    CFRetain(resumeData);
  }
  API::Data::createWithoutCopying((id *)&cf, &v29);
  uint64_t v18 = v29;
  MEMORY[0x19972EAD0](&v27, v16);
  double v19 = _Block_copy(completionHandler);
  uint64_t v20 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v20 = &unk_1EE9C5010;
  v20[1] = v19;
  uint64_t v26 = v20;
  WebKit::WebPageProxy::resumeDownload((uint64_t)v17, (uint64_t)v18, &v27, (uint64_t *)&v26);
  if (v26) {
    (*(void (**)(void *))(*v26 + 8))(v26);
  }
  _Block_release(0);
  double v22 = v27;
  CGSize v27 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy(v22, v21);
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
  double v23 = v29;
  CGFloat v29 = 0;
  if (v23) {
    CFRelease(*((CFTypeRef *)v23 + 1));
  }
  CFTypeRef v24 = cf;
  CFTypeRef cf = 0;
  if (v24) {
    CFRelease(v24);
  }
  if (v7) {
    CFRelease(v7);
  }
}

- (WKNavigation)goToBackForwardListItem:(WKBackForwardListItem *)item
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::goToBackForwardItem((uint64_t)m_ptr, (uint64_t)[(WKBackForwardListItem *)item _item], 3u, &v11);
  uint64_t v5 = v11;
  if (v11)
  {
    uint64_t v6 = *(const void **)(v11 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v11 + 8));
      int v7 = *(const void **)(v5 + 8);
    }
    else
    {
      int v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v8 = (void *)CFMakeCollectable(v6);

  return (WKNavigation *)v8;
}

- (NSURL)_resourceDirectoryURL
{
  WebKit::WebPageProxy::currentResourceDirectoryURL((WebKit::WebPageProxy *)self->_page.m_ptr, (uint64_t)&v6);
  BOOL v3 = (NSURL *)WTF::URL::operator NSURL *();
  CFStringRef v4 = v6;
  uint64_t v6 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v2);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
  return v3;
}

- (double)estimatedProgress
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  double result = *(double *)(v2 + 1144);
  if (*(void *)(v2 + 1016)) {
    return 0.1;
  }
  return result;
}

- (SecTrustRef)serverTrust
{
  return *(SecTrustRef *)(*((void *)self->_page.m_ptr + 4) + 1160);
}

- (WKNavigation)goBack
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  BOOL didAccessBackForwardList = self->_didAccessBackForwardList;
  self->_BOOL didAccessBackForwardList = 1;
  if (!didAccessBackForwardList) {
    -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
  }
  if ([(WKWebView *)self _safeBrowsingWarning])
  {
    return [(WKWebView *)self reload];
  }
  else
  {
    WebKit::WebPageProxy::goBack((WebKit::WebPageProxy *)self->_page.m_ptr, &v11);
    uint64_t v6 = v11;
    if (v11)
    {
      uint64_t v11 = 0;
      int v7 = *(const void **)(v6 + 8);
      if (v7)
      {
        CFRetain(*(CFTypeRef *)(v6 + 8));
        uint64_t v8 = *(const void **)(v6 + 8);
      }
      else
      {
        uint64_t v8 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      int v7 = 0;
    }
    uint64_t v9 = (id)CFMakeCollectable(v7);
    uint64_t v10 = v11;
    uint64_t v11 = 0;
    if (v10) {
      CFRelease(*(CFTypeRef *)(v10 + 8));
    }
    return v9;
  }
}

- (WKNavigation)goForward
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  BOOL didAccessBackForwardList = self->_didAccessBackForwardList;
  self->_BOOL didAccessBackForwardList = 1;
  if (!didAccessBackForwardList) {
    -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
  }
  WebKit::WebPageProxy::goForward((WebKit::WebPageProxy *)self->_page.m_ptr, &v11);
  uint64_t v5 = v11;
  if (v11)
  {
    uint64_t v11 = 0;
    uint64_t v6 = *(const void **)(v5 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v5 + 8));
      int v7 = *(const void **)(v5 + 8);
    }
    else
    {
      int v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v8 = (id)CFMakeCollectable(v6);
  uint64_t v9 = v11;
  uint64_t v11 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  return v8;
}

- (WKNavigation)reload
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  char v4 = WTF::linkedOnOrAfterSDKWithBehavior();
  WebKit::WebPageProxy::reload((uint64_t)self->_page.m_ptr, v4, &v11);
  uint64_t v5 = v11;
  if (v11)
  {
    uint64_t v11 = 0;
    uint64_t v6 = *(const void **)(v5 + 8);
    if (v6)
    {
      CFRetain(*(CFTypeRef *)(v5 + 8));
      int v7 = *(const void **)(v5 + 8);
    }
    else
    {
      int v7 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v8 = (id)CFMakeCollectable(v6);
  uint64_t v9 = v11;
  uint64_t v11 = 0;
  if (v9) {
    CFRelease(*(CFTypeRef *)(v9 + 8));
  }
  return v8;
}

- (WKNavigation)reloadFromOrigin
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::reload((uint64_t)m_ptr, 2, &v10);
  uint64_t v4 = v10;
  if (v10)
  {
    uint64_t v10 = 0;
    uint64_t v5 = *(const void **)(v4 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      uint64_t v6 = *(const void **)(v4 + 8);
    }
    else
    {
      uint64_t v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v5 = 0;
  }
  int v7 = (id)CFMakeCollectable(v5);
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (v8) {
    CFRelease(*(CFTypeRef *)(v8 + 8));
  }
  return v7;
}

- (void)stopLoading
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::stopLoading((WebKit::WebPageProxy *)m_ptr);
}

- (void)evaluateJavaScript:(NSString *)javaScriptString completionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  [(WKWebView *)self _evaluateJavaScript:javaScriptString asAsyncFunction:0 withSourceURL:0 withArguments:0 forceUserGesture:1 inFrame:0 inWorld:+[WKContentWorld pageWorld] completionHandler:completionHandler];
}

- (void)evaluateJavaScript:(NSString *)javaScriptString inFrame:(WKFrameInfo *)frame inContentWorld:(WKContentWorld *)contentWorld completionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  [(WKWebView *)self _evaluateJavaScript:javaScriptString asAsyncFunction:0 withSourceURL:0 withArguments:0 forceUserGesture:1 inFrame:frame inWorld:contentWorld completionHandler:completionHandler];
}

- (void)callAsyncJavaScript:(NSString *)functionBody arguments:(NSDictionary *)arguments inFrame:(WKFrameInfo *)frame inContentWorld:(WKContentWorld *)contentWorld completionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  [(WKWebView *)self _evaluateJavaScript:functionBody asAsyncFunction:1 withSourceURL:0 withArguments:arguments forceUserGesture:1 inFrame:frame inWorld:contentWorld completionHandler:completionHandler];
}

- (void)closeAllMediaPresentations
{
}

- (void)closeAllMediaPresentationsWithCompletionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v6 = &unk_1EE9C5C50;
  v6[1] = completionHandler;
  uint64_t v7 = WTF::fastMalloc((WTF *)0x10);
  uint64_t v8 = (atomic_uint *)v7;
  *(_DWORD *)uint64_t v7 = 1;
  *(void *)(v7 + 8) = v6;
  uint64_t v9 = self->_page.m_ptr;
  uint64_t v10 = (void *)*((void *)v9 + 54);
  if (v10)
  {
    atomic_fetch_add((atomic_uint *volatile)v7, 1u);
    uint64_t v11 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v11 = &unk_1EE9C5038;
    v11[1] = v8;
    uint64_t v16 = v11;
    WebKit::VideoPresentationManagerProxy::forEachSession(v10, &v16);
    uint64_t v12 = v16;
    uint64_t v16 = 0;
    if (v12) {
      (*(void (**)(void *))(*v12 + 8))(v12);
    }
    uint64_t v9 = self->_page.m_ptr;
  }
  uint64_t v13 = *((void *)v9 + 51);
  if (v13)
  {
    if ((*(unsigned int (**)(void))(**(void **)(v13 + 32) + 24))(*(void *)(v13 + 32)))
    {
      atomic_fetch_add(v8, 1u);
      uint64_t v14 = (void *)WTF::fastMalloc((WTF *)0x10);
      *uint64_t v14 = &unk_1EE9C5088;
      v14[1] = v8;
      uint64_t v16 = v14;
      WebKit::WebFullScreenManagerProxy::closeWithCallback(v13, (unint64_t)&v16);
      double v15 = v16;
      uint64_t v16 = 0;
      if (v15) {
        (*(void (**)(void *))(*v15 + 8))(v15);
      }
    }
  }
  WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>,(WTF::DestructionThread)0>::deref((unsigned int *)v8);
}

- (void)pauseAllMediaPlaybackWithCompletionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
    if (completionHandler) {
      goto LABEL_4;
    }
  }
  else if (completionHandler)
  {
LABEL_4:
    uint64_t v5 = _Block_copy(completionHandler);
    uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v6 = &unk_1EE9C5C00;
    v6[1] = v5;
    uint64_t v11 = v6;
    WebKit::WebPageProxy::pauseAllMediaPlayback((uint64_t)m_ptr, (uint64_t *)&v11);
    uint64_t v7 = (uint64_t)v11;
    uint64_t v11 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    _Block_release(0);
    return;
  }
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C50B0;
  uint64_t v11 = v9;
  WebKit::WebPageProxy::pauseAllMediaPlayback((uint64_t)m_ptr, (uint64_t *)&v11);
  uint64_t v10 = (uint64_t)v11;
  uint64_t v11 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
}

- (void)resumeAllMediaPlayback:(void *)completionHandler
{
}

- (void)suspendAllMediaPlayback:(void *)completionHandler
{
}

- (void)setAllMediaPlaybackSuspended:(BOOL)suspended completionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  BOOL v5 = suspended;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((unsigned char *)m_ptr + 1362))
  {
    if (completionHandler) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  if (!v4)
  {
LABEL_4:
    uint64_t v4 = v13;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3321888768;
    _DWORD v13[2] = __60__WKWebView_setAllMediaPlaybackSuspended_completionHandler___block_invoke;
    v13[3] = &__block_descriptor_33_e8_32c74_ZTSKZ60__WKWebView_setAllMediaPlaybackSuspended_completionHandler__E4__19_e5_v8__0l;
  }
LABEL_5:
  uint64_t v8 = self->_page.m_ptr;
  uint64_t v9 = _Block_copy(v4);
  uint64_t v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v10 = &unk_1EE9C5C00;
  v10[1] = v9;
  uint64_t v12 = v10;
  if (v5) {
    WebKit::WebPageProxy::suspendAllMediaPlayback((uint64_t)v8, (uint64_t *)&v12);
  }
  else {
    WebKit::WebPageProxy::resumeAllMediaPlayback((uint64_t)v8, (uint64_t *)&v12);
  }
  uint64_t v11 = (uint64_t)v12;
  uint64_t v12 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
}

- (void)requestMediaPlaybackStateWithCompletionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    if (!completionHandler) {
      return;
    }
  }
  else if (!completionHandler)
  {
    return;
  }
  uint64_t v6 = self->_page.m_ptr;
  uint64_t v7 = _Block_copy(completionHandler);
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v8 = &unk_1EE9C50D8;
  v8[1] = v7;
  uint64_t v10 = v8;
  WebKit::WebPageProxy::requestMediaPlaybackState((uint64_t)v6, (uint64_t *)&v10);
  uint64_t v9 = (uint64_t)v10;
  uint64_t v10 = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  _Block_release(0);
}

- (WKMediaCaptureState)cameraCaptureState
{
  unsigned int v2 = *(_DWORD *)(*((void *)self->_page.m_ptr + 4) + 1704);
  if ((v2 & 0x1000) != 0) {
    return 1;
  }
  else {
    return (unint64_t)((v2 >> 13) & 2);
  }
}

- (WKMediaCaptureState)microphoneCaptureState
{
  unsigned int v2 = *(_DWORD *)(*((void *)self->_page.m_ptr + 4) + 1704);
  if ((v2 & 0x800) != 0) {
    return 1;
  }
  else {
    return (unint64_t)((v2 >> 12) & 2);
  }
}

- (void)setMicrophoneCaptureState:(WKMediaCaptureState)state completionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((unsigned char *)m_ptr + 1362))
  {
    if (completionHandler) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  if (!v4)
  {
LABEL_4:
    uint64_t v4 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3321888768;
    v18[2] = __57__WKWebView_setMicrophoneCaptureState_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_33_e8_32c71_ZTSKZ57__WKWebView_setMicrophoneCaptureState_completionHandler__E4__21_e5_v8__0l;
  }
LABEL_5:
  uint64_t v8 = self->_page.m_ptr;
  if (state)
  {
    unsigned __int8 v9 = *(unsigned char *)(*((void *)v8 + 4) + 904);
    unsigned __int8 v10 = v9 | 2;
    if (state == WKMediaCaptureStateActive) {
      v9 &= ~2u;
    }
    if (state == WKMediaCaptureStateMuted) {
      unsigned __int8 v11 = v10;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    uint64_t v12 = _Block_copy(v4);
    uint64_t v13 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v13 = &unk_1EE9C5128;
    v13[1] = v12;
    double v17 = v13;
    WebKit::WebPageProxy::setMuted((uint64_t)v8, v11, (uint64_t *)&v17);
  }
  else
  {
    uint64_t v14 = _Block_copy(v4);
    double v15 = (void *)WTF::fastMalloc((WTF *)0x10);
    *double v15 = &unk_1EE9C5100;
    v15[1] = v14;
    double v17 = v15;
    WebKit::WebPageProxy::stopMediaCapture((uint64_t)v8, 0, (uint64_t *)&v17);
  }
  uint64_t v16 = (uint64_t)v17;
  double v17 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  _Block_release(0);
}

- (void)setCameraCaptureState:(WKMediaCaptureState)state completionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((unsigned char *)m_ptr + 1362))
  {
    if (completionHandler) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  if (!v4)
  {
LABEL_4:
    uint64_t v4 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3321888768;
    v18[2] = __53__WKWebView_setCameraCaptureState_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_33_e8_32c67_ZTSKZ53__WKWebView_setCameraCaptureState_completionHandler__E4__24_e5_v8__0l;
  }
LABEL_5:
  uint64_t v8 = self->_page.m_ptr;
  if (state)
  {
    unsigned __int8 v9 = *(unsigned char *)(*((void *)v8 + 4) + 904);
    unsigned __int8 v10 = v9 | 4;
    if (state == WKMediaCaptureStateActive) {
      v9 &= ~4u;
    }
    if (state == WKMediaCaptureStateMuted) {
      unsigned __int8 v11 = v10;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    uint64_t v12 = _Block_copy(v4);
    uint64_t v13 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v13 = &unk_1EE9C5178;
    v13[1] = v12;
    double v17 = v13;
    WebKit::WebPageProxy::setMuted((uint64_t)v8, v11, (uint64_t *)&v17);
  }
  else
  {
    uint64_t v14 = _Block_copy(v4);
    double v15 = (void *)WTF::fastMalloc((WTF *)0x10);
    *double v15 = &unk_1EE9C5150;
    v15[1] = v14;
    double v17 = v15;
    WebKit::WebPageProxy::stopMediaCapture((uint64_t)v8, 1, (uint64_t *)&v17);
  }
  uint64_t v16 = (uint64_t)v17;
  double v17 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  _Block_release(0);
}

- (void)_evaluateJavaScript:(id)a3 asAsyncFunction:(BOOL)a4 withSourceURL:(id)a5 withArguments:(id)a6 forceUserGesture:(BOOL)a7 inFrame:(id)a8 inWorld:(id)a9 completionHandler:(id)a10
{
  LODWORD(v11) = a4;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
LABEL_109:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  uint64_t v14 = [a10 copy];
  LOBYTE(v94) = 0;
  char v95 = 0;
  if (v11)
  {
    uint64_t v94 = 0;
    char v95 = 1;
  }
  char v63 = (char)v11;
  CFTypeRef cf = (CFTypeRef)v14;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  double v15 = (WebKit *)[a6 countByEnumeratingWithState:&v90 objects:v96 count:16];
  if (!v15)
  {
LABEL_65:
    unint64_t v49 = (unint64_t)a8;
    if (a8)
    {
      double v15 = (WebKit *)[a8 _handle];
      if (v15)
      {
        double v15 = (WebKit *)[a8 _handle];
        if (*((void *)v15 + 3))
        {
          double v15 = (WebKit *)[a8 _handle];
          uint64_t v50 = *((void *)v15 + 3);
          uint64_t v10 = *((void *)v15 + 4);
          unint64_t v49 = v50 & 0xFFFFFFFFFFFFFF00;
          char v51 = 1;
LABEL_71:
          if (self->_dontResetTransientActivationAfterRunJavaScript) {
            char shouldEvaluateJavaScriptWithoutTransientActivation = 0;
          }
          else {
            char shouldEvaluateJavaScriptWithoutTransientActivation = WebKit::shouldEvaluateJavaScriptWithoutTransientActivation(v15);
          }
          uint64_t v53 = self->_page.m_ptr;
          MEMORY[0x19972EAD0](&v79, a3);
          MEMORY[0x19972E8A0](&v76, a5);
          uint64_t v54 = v79;
          double v79 = 0;
          double v80 = v54;
          char v81 = 0;
          int32x2_t v55 = v76;
          double v76 = 0;
          double v82 = v55;
          long long v83 = v77;
          long long v84 = v78;
          LODWORD(v77) = v77 & 0xFFFFFFFE;
          char v85 = v63;
          LOBYTE(v86) = 0;
          char v87 = 0;
          if (v95)
          {
            uint64_t v62 = v94;
            uint64_t v94 = 0;
            uint64_t v86 = v62;
            char v87 = 1;
          }
          BOOL v88 = a7;
          char v89 = shouldEvaluateJavaScriptWithoutTransientActivation;
          v74[0] = v50 | v49;
          v74[1] = v10;
          char v75 = v51;
          CGFloat v44 = cf;
          if (cf) {
            CFRetain(cf);
          }
          int32x2_t v56 = (void *)WTF::fastMalloc((WTF *)0x10);
          *int32x2_t v56 = &unk_1EE9C51C8;
          v56[1] = cf;
          double v73 = v56;
          WebKit::WebPageProxy::runJavaScriptInFrameInScriptWorld((uint64_t)v53, (uint64_t)&v80, (uint64_t)v74, (uint64_t)a9 + 8, (uint64_t *)&v73);
          uint64_t v57 = (uint64_t)v73;
          double v73 = 0;
          if (v57) {
            (*(void (**)(uint64_t))(*(void *)v57 + 8))(v57);
          }
          if (v87 && v86) {
            WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v86, v47);
          }
          long long v58 = v82;
          double v82 = 0;
          if (v58)
          {
            if (*(_DWORD *)v58 == 2) {
              WTF::StringImpl::destroy(v58, (WTF::StringImpl *)v47);
            }
            else {
              *(_DWORD *)v58 -= 2;
            }
          }
          long long v59 = v80;
          double v80 = 0;
          if (v59)
          {
            if (*(_DWORD *)v59 == 2) {
              WTF::StringImpl::destroy(v59, (WTF::StringImpl *)v47);
            }
            else {
              *(_DWORD *)v59 -= 2;
            }
          }
          long long v60 = v76;
          double v76 = 0;
          if (v60)
          {
            if (*(_DWORD *)v60 == 2) {
              WTF::StringImpl::destroy(v60, (WTF::StringImpl *)v47);
            }
            else {
              *(_DWORD *)v60 -= 2;
            }
          }
          long long v61 = v79;
          double v79 = 0;
          if (v61)
          {
            if (*(_DWORD *)v61 == 2) {
              WTF::StringImpl::destroy(v61, (WTF::StringImpl *)v47);
            }
            else {
              *(_DWORD *)v61 -= 2;
            }
          }
          goto LABEL_97;
        }
      }
      unint64_t v49 = 0;
    }
    LOBYTE(v50) = 0;
    char v51 = 0;
    goto LABEL_71;
  }
  uint64_t v71 = *(void *)v91;
  uint64_t v10 = 24;
LABEL_7:
  double v70 = v15;
  a10 = 0;
LABEL_8:
  if (*(void *)v91 != v71) {
    objc_enumerationMutation(a6);
  }
  uint64_t v16 = *(void *)(*((void *)&v90 + 1) + 8 * (void)a10);
  uint64_t v17 = [a6 objectForKey:v16];
  API::SerializedScriptValue::createFromNSObject(v17, v18, &v80);
  if (v80)
  {
    if (!v95)
    {
      __break(1u);
      goto LABEL_109;
    }
    MEMORY[0x19972EAD0](&v76, v16);
    uint64_t v21 = *((void *)v80 + 2);
    uint64_t v22 = v94;
    if (v94
      || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(&v94, 0), (uint64_t v22 = v94) != 0))
    {
      int v23 = *(_DWORD *)(v22 - 8);
    }
    else
    {
      int v23 = 0;
    }
    unsigned int v24 = *((_DWORD *)v76 + 4);
    if (v24 >= 0x100) {
      unsigned int v25 = v24 >> 8;
    }
    else {
      unsigned int v25 = WTF::StringImpl::hashSlowCase(v76);
    }
    uint64_t v26 = 0;
    for (int i = 1; ; ++i)
    {
      unsigned int v28 = v25 & v23;
      uint64_t v29 = v22 + 24 * (v25 & v23);
      CGFloat v30 = *(WTF **)v29;
      if (*(void *)v29 == -1)
      {
        uint64_t v26 = (void *)(v22 + 24 * v28);
      }
      else
      {
        if (!v30)
        {
          if (v26)
          {
            *uint64_t v26 = 0;
            v26[1] = 0;
            v26[2] = 0;
            --*(_DWORD *)(v94 - 16);
            uint64_t v29 = (uint64_t)v26;
          }
          CGFloat v31 = v76;
          double v76 = 0;
          double v32 = *(WTF::StringImpl **)v29;
          *(void *)uint64_t v29 = v31;
          unsigned __int8 v11 = v70;
          if (v32)
          {
            if (*(_DWORD *)v32 == 2) {
              WTF::StringImpl::destroy(v32, v19);
            }
            else {
              *(_DWORD *)v32 -= 2;
            }
          }
          int v33 = *(_DWORD *)(v21 + 20);
          if (v33)
          {
            float v34 = (void *)WTF::fastMalloc((WTF *)*(unsigned int *)(v21 + 20));
            memcpy(v34, *(const void **)(v21 + 8), *(unsigned int *)(v21 + 20));
          }
          else
          {
            float v34 = 0;
          }
          BOOL v35 = *(WTF **)(v29 + 8);
          if (v35)
          {
            *(void *)(v29 + 8) = 0;
            *(_DWORD *)(v29 + 16) = 0;
            WTF::fastFree(v35, v19);
          }
          *(void *)(v29 + 8) = v34;
          *(_DWORD *)(v29 + 16) = v33;
          *(_DWORD *)(v29 + 20) = v33;
          if (v94) {
            int v36 = *(_DWORD *)(v94 - 12) + 1;
          }
          else {
            int v36 = 1;
          }
          *(_DWORD *)(v94 - 12) = v36;
          if (v94) {
            int v37 = *(_DWORD *)(v94 - 12);
          }
          else {
            int v37 = 0;
          }
          uint64_t v38 = (*(_DWORD *)(v94 - 16) + v37);
          unint64_t v39 = *(unsigned int *)(v94 - 4);
          if (v39 > 0x400)
          {
            if (v39 <= 2 * v38) {
LABEL_44:
            }
              WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(&v94, v29);
          }
          else if (3 * v39 <= 4 * v38)
          {
            goto LABEL_44;
          }
LABEL_45:
          double v40 = v76;
          double v76 = 0;
          if (v40)
          {
            if (*(_DWORD *)v40 == 2) {
              WTF::StringImpl::destroy(v40, v19);
            }
            else {
              *(_DWORD *)v40 -= 2;
            }
          }
          double v41 = v80;
          double v80 = 0;
          if (v41) {
            CFRelease(*((CFTypeRef *)v41 + 1));
          }
          a10 = (char *)a10 + 1;
          if (a10 == v11)
          {
            double v15 = (WebKit *)[a6 countByEnumeratingWithState:&v90 objects:v96 count:16];
            if (!v15) {
              goto LABEL_65;
            }
            goto LABEL_7;
          }
          goto LABEL_8;
        }
        if (WTF::equal(v30, v76, v20))
        {
          WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::operator=((unsigned int *)(v22 + 24 * v28 + 8), v21 + 8);
          unsigned __int8 v11 = v70;
          goto LABEL_45;
        }
      }
      unsigned int v25 = i + v28;
    }
  }
  if (!cf) {
    goto LABEL_65;
  }
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v42, "setObject:forKey:", localizedDescriptionForErrorCode(WKErrorJavaScriptExceptionOccurred, v43), *MEMORY[0x1E4F28568]);
  [v42 setObject:@"Function argument values must be one of the following types, or contain only the following types: NSNumber, NSNull, NSDate, NSString, NSArray, and NSDictionary", @"WKJavaScriptExceptionMessage" forKey];
  CGFloat v44 = cf;
  double v45 = (WTF::RunLoop *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"WKErrorDomain" code:4 userInfo:v42];
  WTF::RunLoop::main(v45);
  CFRetain(cf);
  if (v45) {
    CFRetain(v45);
  }
  CGFloat v46 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x18);
  *(void *)CGFloat v46 = &unk_1EE9C51A0;
  *((void *)v46 + 1) = cf;
  *((void *)v46 + 2) = v45;
  double v80 = v46;
  WTF::RunLoop::dispatch();
  double v48 = v80;
  double v80 = 0;
  if (v48)
  {
    (*(void (**)(WTF::StringImpl *))(*(void *)v48 + 8))(v48);
    if (!v45) {
      goto LABEL_63;
    }
  }
  else if (!v45)
  {
LABEL_63:
    if (!v42) {
      goto LABEL_97;
    }
    goto LABEL_64;
  }
  CFRelease(v45);
  if (v42) {
LABEL_64:
  }
    CFRelease(v42);
LABEL_97:
  if (v95 && v94) {
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v94, v47);
  }
  if (v44) {
    CFRelease(v44);
  }
}

- (void)takeSnapshotWithConfiguration:(WKSnapshotConfiguration *)snapshotConfiguration completionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  kdebug_trace();
  if (snapshotConfiguration)
  {
    [(WKSnapshotConfiguration *)snapshotConfiguration rect];
    if (CGRectIsNull(v45)) {
      [(WKWebView *)self bounds];
    }
    else {
      [(WKSnapshotConfiguration *)snapshotConfiguration rect];
    }
    double v13 = v8;
    double v15 = v9;
    double v17 = v10;
    double v19 = v11;
    [(NSNumber *)[(WKSnapshotConfiguration *)snapshotConfiguration snapshotWidth] doubleValue];
    if (v22 == 0.0) {
      double v21 = v17;
    }
    else {
      double v21 = v22;
    }
  }
  else
  {
    [(WKWebView *)self bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    [(WKWebView *)self bounds];
    double v21 = v20;
  }
  int v23 = _Block_copy(completionHandler);
  v46.origin.double x = v13;
  v46.origin.double y = v15;
  v46.size.double width = v17;
  v46.size.double height = v19;
  IsEmptdouble y = CGRectIsEmpty(v46);
  int v25 = v21 == 0.0 || IsEmpty;
  if (v25 != 1)
  {
    if (objc_msgSend((id)objc_opt_class(), "web_requiresCustomSnapshotting"))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "scale");
      double v29 = v28;
      double v30 = 1.0;
    }
    else
    {
      CGFloat v31 = self->_page.m_ptr;
      uint64_t v32 = 764;
      if (!*((unsigned char *)v31 + 768)) {
        uint64_t v32 = 760;
      }
      double v30 = *(float *)((char *)v31 + v32);
      double v29 = v30;
    }
    CFRetain(self);
    if (snapshotConfiguration) {
      BOOL v33 = [(WKSnapshotConfiguration *)snapshotConfiguration afterScreenUpdates];
    }
    else {
      BOOL v33 = 0;
    }
    CFRetain(self);
    float v34 = _Block_copy(v23);
    double v35 = v21 * v30;
    if ((!snapshotConfiguration
       || [(WKSnapshotConfiguration *)snapshotConfiguration afterScreenUpdates])
      && (WTF::linkedOnOrAfterSDKWithBehavior() & 1) != 0)
    {
      int v36 = self->_page.m_ptr;
      if (!*((unsigned char *)v36 + 801) && *((unsigned char *)v36 + 800) && *((void *)v36 + 29))
      {
        unint64_t v39 = _Block_copy(v23);
        double v40 = self->_page.m_ptr;
        CFRetain(*((CFTypeRef *)v40 + 1));
        double v41 = (void *)WTF::fastMalloc((WTF *)0x60);
        *double v41 = &unk_1EE9C5218;
        v41[1] = self;
        *((unsigned char *)v41 + 16) = v33;
        *((double *)v41 + 3) = v13;
        *((double *)v41 + 4) = v15;
        *((double *)v41 + 5) = v17;
        *((double *)v41 + 6) = v19;
        *((double *)v41 + 7) = v35;
        *((double *)v41 + 8) = v29;
        v41[9] = v34;
        v41[10] = v39;
        v41[11] = v40;
        cf[0] = v41;
        WebKit::WebPageProxy::callAfterNextPresentationUpdate((uint64_t)v36, (uint64_t *)cf);
        if (cf[0]) {
          (*(void (**)(CFTypeRef))(*(void *)cf[0] + 8))(cf[0]);
        }
        _Block_release(0);
        _Block_release(0);
        _Block_release(0);
        goto LABEL_35;
      }
      kdebug_trace();
      createNSError(WKErrorUnknown, 0, cf);
      (*((void (**)(void *, void, CFTypeRef))v23 + 2))(v23, 0, cf[0]);
      CFTypeRef v37 = cf[0];
      cf[0] = 0;
      if (v37) {
        CFRelease(v37);
      }
    }
    else
    {
      cf[0] = (CFTypeRef)MEMORY[0x1E4F143A8];
      cf[1] = (CFTypeRef)3321888768;
      CFTypeRef cf[2] = ___ZZ61__WKWebView_takeSnapshotWithConfiguration_completionHandler__ENK4__30clEv_block_invoke;
      cf[3] = &__block_descriptor_48_e8_32c96_ZTSKZZ61__WKWebView_takeSnapshotWithConfiguration_completionHandler__ENK4__30clEvEUlP7CGImageE__e18_v16__0__CGImage__8l;
      uint64_t v38 = _Block_copy(v34);
      aBlock = _Block_copy(v38);
      double v44 = v29;
      -[WKWebView _snapshotRectAfterScreenUpdates:rectInViewCoordinates:intoImageOfWidth:completionHandler:](self, "_snapshotRectAfterScreenUpdates:rectInViewCoordinates:intoImageOfWidth:completionHandler:", v33, cf, v13, v15, v17, v19, v35);
      _Block_release(v38);
      _Block_release(aBlock);
    }
    _Block_release(v34);
    CFRelease(self);
LABEL_35:
    CFRelease(self);
    goto LABEL_36;
  }
  WTF::RunLoop::main((WTF::RunLoop *)IsEmpty);
  uint64_t v26 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v26 = &unk_1EE9C51F0;
  v26[1] = v23;
  cf[0] = v26;
  WTF::RunLoop::dispatch();
  CFTypeRef v27 = cf[0];
  cf[0] = 0;
  if (v27) {
    (*(void (**)(CFTypeRef))(*(void *)v27 + 8))(v27);
  }
  _Block_release(0);
  int v23 = 0;
LABEL_36:
  _Block_release(v23);
}

- (BOOL)allowsBackForwardNavigationGestures
{
  return self->_allowsBackForwardNavigationGestures;
}

- (NSString)customUserAgent
{
  if (*((void *)self->_page.m_ptr + 47)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setCustomUserAgent:(NSString *)customUserAgent
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19972EAD0](&v9, customUserAgent);
  WebKit::WebPageProxy::setCustomUserAgent((WTF **)m_ptr, &v9, v5);
  uint64_t v7 = v9;
  double v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
}

- (void)setPageZoom:(CGFloat)pageZoom
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setPageZoomFactor((uint64_t)m_ptr, pageZoom);
}

- (CGFloat)pageZoom
{
  m_ptr = self->_page.m_ptr;
  uint64_t v3 = 720;
  if (!*((unsigned char *)m_ptr + 929)) {
    uint64_t v3 = 704;
  }
  return *(double *)((char *)m_ptr + v3);
}

- (void)findString:(NSString *)string withConfiguration:(WKFindConfiguration *)configuration completionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  if ([(NSString *)string length])
  {
    double v10 = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v23, string);
    BOOL v11 = [(WKFindConfiguration *)configuration caseSensitive];
    BOOL v12 = [(WKFindConfiguration *)configuration backwards];
    BOOL v13 = [(WKFindConfiguration *)configuration wraps];
    unsigned int v14 = !v11;
    if (v12) {
      unsigned int v14 = !v11 | 8;
    }
    if (v13) {
      double v15 = (const WTF::StringImpl *)(v14 | 0x10);
    }
    else {
      double v15 = (const WTF::StringImpl *)v14;
    }
    double v16 = _Block_copy(completionHandler);
    double v17 = (void *)WTF::fastMalloc((WTF *)0x10);
    *double v17 = &unk_1EE9C52A0;
    v17[1] = v16;
    double v22 = v17;
    WebKit::WebPageProxy::findString((uint64_t)v10, &v23, v15, 1, (uint64_t *)&v22);
    uint64_t v18 = (uint64_t)v22;
    double v22 = 0;
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
    }
    _Block_release(0);
    double v20 = v23;
    int v23 = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2) {
        WTF::StringImpl::destroy(v20, v19);
      }
      else {
        *(_DWORD *)v20 -= 2;
      }
    }
  }
  else
  {
    id v21 = [[WKFindResult alloc] _initWithMatchFound:0];
    (*((void (**)(void *, id))completionHandler + 2))(completionHandler, v21);
    if (v21)
    {
      CFRelease(v21);
    }
  }
}

+ (BOOL)handlesURLScheme:(NSString *)urlScheme
{
  MEMORY[0x19972EAD0](&v8, urlScheme);
  char isBuiltinScheme = WebCore::LegacySchemeRegistry::isBuiltinScheme((WebCore::LegacySchemeRegistry *)&v8, v3);
  uint64_t v6 = v8;
  double v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  return isBuiltinScheme;
}

- (void)setMediaType:(NSString *)mediaType
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19972EAD0](&v8, mediaType);
  WebKit::WebPageProxy::setOverriddenMediaType((WebKit::WebPageProxy *)m_ptr, &v8);
  uint64_t v6 = v8;
  double v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (NSString)mediaType
{
  double result = (NSString *)*((void *)self->_page.m_ptr + 159);
  if (result) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return result;
}

- (id)interactionState
{
  m_ptr = self->_page.m_ptr;
  uint64_t v8 = 0;
  WebKit::WebPageProxy::sessionState((uint64_t)m_ptr, &v8, (uint64_t)v9);
  WebKit::encodeSessionState((WebKit *)v9, &v11);
  CFTypeRef v4 = (id)CFMakeCollectable(v11);
  BOOL v5 = v10;
  double v10 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v9, v3);
  uint64_t v6 = v8;
  uint64_t v8 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  return (id)v4;
}

- (void)setInteractionState:(id)interactionState
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BYTE4(v18) = 0;
    v16.super.isa = 0;
    uint64_t v17 = 0;
    LOBYTE(v18) = 0;
    WTF::URL::URL((WTF::URL *)&v19);
    BOOL v22 = 1;
    if (WebKit::decodeSessionState((WebKit *)interactionState, &v16, v6))
    {
      uint64_t v8 = self->_page.m_ptr;
      WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v14, (uint64_t)&v16);
      *(_OWORD *)&v14.backForwardListState.currentIndex.var0.__null_state_ = v18;
      double v9 = (StringImpl *)v19;
      if (v19) {
        *(_DWORD *)v19 += 2;
      }
      v14.provisionalURL.m_string.m_impl.m_ptr = v9;
      *(_OWORD *)((char *)&v14.provisionalURL + 8) = v20;
      *(_OWORD *)&v14.provisionalURL.m_hostEnd = v21;
      v14.isAppInitiated = v22;
      WebKit::WebPageProxy::restoreFromSessionState((WebKit::WebPageProxy *)v8, &v14, 1, &v15);
      uint64_t v11 = v15;
      uint64_t v15 = 0;
      if (v11) {
        CFRelease(*(CFTypeRef *)(v11 + 8));
      }
      BOOL v12 = v14.provisionalURL.m_string.m_impl.m_ptr;
      v14.provisionalURL.m_string.m_impl.m_ptr = 0;
      if (v12)
      {
        if (*(_DWORD *)v12 == 2) {
          WTF::StringImpl::destroy((WTF::StringImpl *)v12, v10);
        }
        else {
          *(_DWORD *)v12 -= 2;
        }
      }
      WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v14, v10);
    }
    BOOL v13 = v19;
    double v19 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v7);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
    WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v16, v7);
  }
}

- (BOOL)isInspectable
{
  unsigned int v2 = (Inspector::RemoteInspectionTarget *)*((void *)self->_page.m_ptr + 144);
  if (v2) {
    LOBYTE(v2) = Inspector::RemoteInspectionTarget::inspectable(v2);
  }
  return (char)v2;
}

- (BOOL)findInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (void)_showWarningView:(const void *)a3 completionHandler:(void *)a4
{
  uint64_t v7 = [_WKWarningView alloc];
  [(WKWebView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v16 = *(void *)a4;
  *(void *)a4 = 0;
  uint64_t v24 = v16;
  uint64_t v17 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v17 = &unk_1EE9C52C8;
  *(void *)(v17 + 8) = 0;
  objc_moveWeak((id *)(v17 + 8), &location);
  uint64_t v18 = v24;
  uint64_t v24 = 0;
  uint64_t v25 = v17;
  *(void *)(v17 + 16) = v18;
  double v19 = -[_WKWarningView initWithFrame:browsingWarning:completionHandler:](v7, "initWithFrame:browsingWarning:completionHandler:", a3, &v25, v9, v11, v13, v15);
  m_ptr = self->_warningView.m_ptr;
  self->_warningView.m_ptr = v19;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v21 = v25;
  uint64_t v25 = 0;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  uint64_t v22 = v24;
  uint64_t v24 = 0;
  if (v22) {
    (*(void (**)(uint64_t))(*(void *)v22 + 8))(v22);
  }
  objc_destroyWeak(&location);
  [(WKWebView *)self addSubview:self->_warningView.m_ptr];
}

- (void)_clearWarningView
{
  m_ptr = self->_warningView.m_ptr;
  self->_warningView.m_ptr = 0;
  [m_ptr removeFromSuperview];
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (void)_clearWarningViewIfForMainFrameNavigation
{
  if ([self->_warningView.m_ptr forMainFrameNavigation])
  {
    [(WKWebView *)self _clearWarningView];
  }
}

- (void)_internalDoAfterNextPresentationUpdate:(id)a3 withoutWaitingForPainting:(BOOL)a4 withoutWaitingForAnimatedResize:(BOOL)a5
{
  BOOL v6 = a4;
  double v9 = (WTF::RunLoop *)[(WKWebView *)self usesStandardContentView];
  if (v9)
  {
    if (v6)
    {
      *((unsigned char *)self->_page.m_ptr + 674) = 1;
      double v10 = _Block_copy(a3);
      BOOL v11 = self == 0;
    }
    else
    {
      double v10 = _Block_copy(a3);
      if (!self)
      {
        BOOL v11 = 1;
        goto LABEL_10;
      }
      BOOL v11 = 0;
    }
    CFRetain(self);
LABEL_10:
    m_ptr = self->_page.m_ptr;
    uint64_t v16 = _Block_copy(v10);
    if (!v11) {
      CFRetain(self);
    }
    uint64_t v17 = WTF::fastMalloc((WTF *)0x20);
    *(void *)uint64_t v17 = &unk_1EE9C5318;
    *(void *)(v17 + 8) = v16;
    *(unsigned char *)(v17 + 16) = a5;
    *(void *)(v17 + 24) = self;
    uint64_t v18 = (void *)v17;
    WebKit::WebPageProxy::callAfterNextPresentationUpdate((uint64_t)m_ptr, (uint64_t *)&v18);
    if (v18) {
      (*(void (**)(void *))(*v18 + 8))(v18);
    }
    _Block_release(0);
    if (!v11) {
      CFRelease(self);
    }
    _Block_release(v10);
    return;
  }
  WTF::RunLoop::main(v9);
  double v12 = _Block_copy(a3);
  double v13 = (void *)WTF::fastMalloc((WTF *)0x10);
  *double v13 = &unk_1EE9C52F0;
  v13[1] = v12;
  uint64_t v18 = v13;
  WTF::RunLoop::dispatch();
  uint64_t v14 = (uint64_t)v18;
  uint64_t v18 = 0;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
  }
  _Block_release(0);
}

- (void)_doAfterNextVisibleContentRectAndPresentationUpdate:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  BOOL v5 = _Block_copy(a3);
  BOOL v6 = malloc_type_malloc(0x30uLL, 0x10E00408BA55B3FuLL);
  *BOOL v6 = MEMORY[0x1E4F14398];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView _doAfterNextVisibleContentRectAndPresentationUpdate:]::$_10>(-[WKWebView _doAfterNextVisibleContentRectAndPresentationUpdate:]::$_10)::{lambda(void *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView _doAfterNextVisibleContentRectAndPresentationUpdate:]::$_10>(-[WKWebView _doAfterNextVisibleContentRectAndPresentationUpdate:]::$_10)::descriptor;
  v6[4] = self;
  v6[5] = v5;
  _Block_release(0);
  [(WKWebView *)self _doAfterNextVisibleContentRectUpdate:v6];
  _Block_release(v6);

  _Block_release(0);
}

- (void)_didInsertAttachment:(void *)a3 withSource:(id)a4
{
  id v7 = [(WKWebView *)self UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = *((void *)a3 + 1);
    [v7 _webView:self didInsertAttachment:v8 withSource:a4];
  }
}

- (void)_didRemoveAttachment:(void *)a3
{
  id v5 = [(WKWebView *)self UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = *((void *)a3 + 1);
    [v5 _webView:self didRemoveAttachment:v6];
  }
}

- (void)_didInvalidateDataForAttachment:(void *)a3
{
  id v5 = [(WKWebView *)self UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = *((void *)a3 + 1);
    [v5 _webView:self didInvalidateDataForAttachment:v6];
  }
}

- (_WKAppHighlightDelegate)_appHighlightDelegate
{
  return (_WKAppHighlightDelegate *)objc_loadWeak(&self->_appHighlightDelegate.m_weakReference);
}

- (void)_storeAppHighlight:(const void *)a3
{
  id v5 = [(WKWebView *)self _appHighlightDelegate];
  if (v5)
  {
    uint64_t v6 = v5;
    if (objc_opt_respondsToSelector())
    {
      if (*((unsigned char *)a3 + 16))
      {
        if (*((void *)a3 + 1)) {
          id v7 = (__CFString *)WTF::StringImpl::operator NSString *();
        }
        else {
          id v7 = &stru_1EEA10550;
        }
      }
      else
      {
        id v7 = 0;
      }
      uint64_t v8 = [_WKAppHighlight alloc];
      WebCore::FragmentedSharedBuffer::makeContiguous((uint64_t *)&v13, *(WebCore::FragmentedSharedBuffer **)a3);
      WebCore::SharedBuffer::createNSData((uint64_t *)&cf, v13);
      double v10 = [(_WKAppHighlight *)v8 initWithHighlight:cf text:v7 image:0];
      CFTypeRef v11 = cf;
      CFTypeRef cf = 0;
      if (v11) {
        CFRelease(v11);
      }
      double v12 = (unsigned int *)v13;
      double v13 = 0;
      if (v12) {
        WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v12, v9);
      }
      if (objc_opt_respondsToSelector()) {
        -[_WKAppHighlightDelegate _webView:storeAppHighlight:inNewGroup:requestOriginatedInApp:](v6, "_webView:storeAppHighlight:inNewGroup:requestOriginatedInApp:", self, v10, *((unsigned __int8 *)a3 + 24), *((unsigned __int8 *)a3 + 25), v13, cf);
      }
      if (v10) {
        CFRelease(v10);
      }
    }
  }
}

- (OpaqueWKPage)_pageForTesting
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    return (OpaqueWKPage *)*((void *)m_ptr + 1);
  }
  else {
    return 0;
  }
}

- (optional<BOOL>)_resolutionForShareSheetImmediateCompletionForTesting
{
  return self->_resolutionForShareSheetImmediateCompletionForTesting;
}

- (void)createPDFWithConfiguration:(WKPDFConfiguration *)pdfConfiguration completionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v8 = *((void *)m_ptr + 41);
  if (v8)
  {
    uint64_t v9 = *(void *)(v8 + 272);
    uint64_t v10 = *(void *)(v8 + 280);
    v20[0] = 0;
    char v21 = 0;
    if (pdfConfiguration)
    {
      [(WKPDFConfiguration *)pdfConfiguration rect];
      if (!CGRectIsNull(v22))
      {
        [(WKPDFConfiguration *)pdfConfiguration rect];
        cf.origin.CGFloat x = v11;
        cf.origin.double y = v12;
        cf.size.double width = v13;
        cf.size.double height = v14;
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v20, &cf);
        char v21 = 1;
      }
      LOBYTE(pdfConfiguration) = [(WKPDFConfiguration *)pdfConfiguration allowTransparentBackground];
      m_ptr = self->_page.m_ptr;
    }
    double v15 = _Block_copy(completionHandler);
    uint64_t v16 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v16 = &unk_1EE9C5368;
    v16[1] = v15;
    *(void *)&cf.origin.CGFloat x = v16;
    WebKit::WebPageProxy::drawToPDF((uint64_t)m_ptr, v9, v10, (uint64_t)v20, (char)pdfConfiguration, (uint64_t *)&cf);
    CGFloat x = cf.origin.x;
    cf.origin.CGFloat x = 0.0;
    if (x != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&x + 8))(COERCE_CGFLOAT(*(void *)&x));
    }
    _Block_release(0);
  }
  else
  {
    createNSError(WKErrorUnknown, 0, &cf);
    (*((void (**)(void *, void, void))completionHandler + 2))(completionHandler, 0, *(void *)&cf.origin.x);
    CGFloat v18 = cf.origin.x;
    cf.origin.CGFloat x = 0.0;
    if (v18 != 0.0) {
      CFRelease(*(CFTypeRef *)&v18);
    }
  }
}

- (void)createWebArchiveDataWithCompletionHandler:(void *)completionHandler
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  id v5 = _Block_copy(completionHandler);
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v6 = &unk_1EE9C5390;
  v6[1] = v5;
  uint64_t v9 = v6;
  WebKit::WebPageProxy::getWebArchiveOfFrame((uint64_t)m_ptr, 0, (uint64_t *)&v9);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_didChangeEditorState
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *((void *)self->_page.m_ptr + 4);
  int v4 = *(unsigned __int8 *)(v3 + 249);
  BOOL v5 = *(unsigned char *)(v3 + 250) == 0;
  uint64_t v6 = 1;
  if (!v5) {
    uint64_t v6 = 2;
  }
  if (v4) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }
  if (self->_selectionAttributes != v7)
  {
    uint64_t v8 = NSStringFromSelector(sel__selectionAttributes);
    [(WKWebView *)self willChangeValueForKey:v8];
    self->_selectionAttributes = v7;
    [(WKWebView *)self didChangeValueForKey:v8];
  }
  id v9 = [(WKWebView *)self UIDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v10 = (unsigned __int8 *)*((void *)self->_page.m_ptr + 4);
    if (v10[576])
    {
      uint64_t v28 = MEMORY[0x1E4F1CC38];
      unsigned int v11 = v10[272];
      CGRect v22 = @"post-layout-data";
      int v23 = @"bold";
      int32x2_t v12 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vdup_n_s32(v11), (int8x8_t)0x200000001));
      v13.i64[0] = v12.i32[0];
      v13.i64[1] = v12.i32[1];
      uint64_t v14 = MEMORY[0x1E4F1CC28];
      int8x16_t v29 = vbslq_s8(v13, (int8x16_t)vdupq_n_s64(MEMORY[0x1E4F1CC28]), (int8x16_t)vdupq_n_s64(MEMORY[0x1E4F1CC38]));
      uint64_t v24 = @"italic";
      uint64_t v25 = @"underline";
      if ((v11 & 4) != 0) {
        uint64_t v14 = MEMORY[0x1E4F1CC38];
      }
      uint64_t v30 = v14;
      uint64_t v26 = @"text-alignment";
      if ((v10[288] - 1) > 3u) {
        uint64_t v15 = 4;
      }
      else {
        uint64_t v15 = qword_1994F6280[(char)(v10[288] - 1)];
      }
      uint64_t v31 = [NSNumber numberWithInteger:v15];
      CFTypeRef v27 = @"text-color";
      WebCore::serializationForCSS((uint64_t *)&v21, (WebCore *)(v10 + 296), v17);
      if (v21) {
        CGFloat v18 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        CGFloat v18 = &stru_1EEA10550;
      }
      uint64_t v32 = v18;
      uint64_t v16 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v22 count:6];
      long long v20 = v21;
      char v21 = 0;
      if (v20)
      {
        if (*(_DWORD *)v20 == 2) {
          WTF::StringImpl::destroy(v20, v19);
        }
        else {
          *(_DWORD *)v20 -= 2;
        }
      }
    }
    else
    {
      uint64_t v16 = &unk_1EEA53200;
    }
    objc_msgSend(v9, "_webView:editorStateDidChange:", self, v16, v21, v22, v23, v24, v25, v26);
  }
}

- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request response:(NSURLResponse *)response responseData:(NSData *)data
{
  uint64_t v26 = data;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x199732A50](v23, request);
  WebCore::ResourceResponse::ResourceResponse((WebCore::ResourceResponse *)v21, response);
  WebCore::SharedBuffer::create<NSData *&>((WebCore::FragmentedSharedBuffer **)&v26, v8, (uint64_t *)&v20);
  WebKit::WebPageProxy::loadSimulatedRequest((uint64_t)m_ptr, (uint64_t)v23, (uint64_t)v21, &v20, &v25);
  uint64_t v9 = v25;
  if (v25)
  {
    uint64_t v25 = 0;
    uint64_t v10 = *(const void **)(v9 + 8);
    if (v10)
    {
      CFRetain(*(CFTypeRef *)(v9 + 8));
      unsigned int v11 = *(const void **)(v9 + 8);
    }
    else
    {
      unsigned int v11 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    uint64_t v10 = 0;
  }
  int8x16_t v13 = (id)CFMakeCollectable(v10);
  uint64_t v14 = v25;
  uint64_t v25 = 0;
  if (v14) {
    CFRelease(*(CFTypeRef *)(v14 + 8));
  }
  uint64_t v15 = (unsigned int *)v20;
  long long v20 = 0;
  if (v15) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v15, v12);
  }
  CFTypeRef v16 = cf;
  CFTypeRef cf = 0;
  if (v16) {
    CFRelease(v16);
  }
  WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v21, (WTF::StringImpl *)v12);
  CFTypeRef v17 = v24;
  CFTypeRef v24 = 0;
  if (v17) {
    CFRelease(v17);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v23);
  return v13;
}

- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request withResponse:(NSURLResponse *)response responseData:(NSData *)data
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  return [(WKWebView *)self loadSimulatedRequest:request response:response responseData:data];
}

- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request responseHTMLString:(NSString *)string
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  uint64_t v8 = [(NSString *)string dataUsingEncoding:4];
  uint64_t v9 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E4F18DB0]), "initWithURL:MIMEType:expectedContentLength:textEncodingName:", -[NSURLRequest URL](request, "URL"), @"text/html", -[NSString length](string, "length"), @"UTF-8");
  uint64_t v10 = [(WKWebView *)self loadSimulatedRequest:request response:v9 responseData:v8];
  if (v9) {
    CFRelease(v9);
  }
  return v10;
}

- (WKNavigation)loadSimulatedRequest:(NSURLRequest *)request withResponseHTMLString:(NSString *)string
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  return [(WKWebView *)self loadSimulatedRequest:request responseHTMLString:string];
}

- (WKNavigation)loadFileRequest:(NSURLRequest *)request allowingReadAccessToURL:(NSURL *)readAccessURL
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  uint64_t v8 = [(NSURLRequest *)request URL];
  if (![(NSURL *)v8 isFileURL]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", v8 format];
  }
  if (![(NSURL *)readAccessURL isFileURL]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ is not a file URL", readAccessURL format];
  }
  NSURLRequestAttribution v9 = [(NSURLRequest *)request attribution];
  uint64_t v10 = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v21, [(NSURL *)v8 absoluteString]);
  MEMORY[0x19972EAD0](&v20, [(NSURL *)readAccessURL absoluteString]);
  WebKit::WebPageProxy::loadFile((WebKit::WebPageProxy *)v10, (const WTF::String *)&v21, (const WTF::String *)&v20, v9 == NSURLRequestAttributionDeveloper, 0);
  uint64_t v11 = v22;
  if (v22)
  {
    uint64_t v22 = 0;
    int32x2_t v12 = *(const void **)(v11 + 8);
    if (v12)
    {
      CFRetain(*(CFTypeRef *)(v11 + 8));
      int8x16_t v13 = *(const void **)(v11 + 8);
    }
    else
    {
      int8x16_t v13 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    int32x2_t v12 = 0;
  }
  uint64_t v15 = (id)CFMakeCollectable(v12);
  uint64_t v16 = v22;
  uint64_t v22 = 0;
  if (v16) {
    CFRelease(*(CFTypeRef *)(v16 + 8));
  }
  CFTypeRef v17 = v20;
  long long v20 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v14);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  CGFloat v18 = v21;
  char v21 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy(v18, v14);
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  return v15;
}

- (UIColor)themeColor
{
  WebCore::Color::Color((WebCore::Color *)&v9, (const Color *)(*((void *)self->_page.m_ptr + 4) + 1776));
  WebCore::cocoaColorOrNil((uint64_t *)&cf, (WebCore *)&v9, v2);
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  BOOL v5 = (id)CFMakeCollectable(v3);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  if ((v9 & 0x8000000000000) != 0)
  {
    uint64_t v8 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v8);
      WTF::fastFree((WTF *)v8, v4);
    }
  }
  return v5;
}

- (WKFullscreenState)fullscreenState
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 51);
  if (v2 && (unsigned int v3 = *(unsigned __int8 *)(v2 + 40) - 1, v3 <= 2)) {
    return v3 + 1;
  }
  else {
    return 0;
  }
}

- (void)setMinimumViewportInset:(UIEdgeInsets)minimumViewportInset maximumViewportInset:(UIEdgeInsets)maximumViewportInset
{
  double right = maximumViewportInset.right;
  double bottom = maximumViewportInset.bottom;
  double left = maximumViewportInset.left;
  double top = maximumViewportInset.top;
  double v8 = minimumViewportInset.right;
  double v9 = minimumViewportInset.bottom;
  double v10 = minimumViewportInset.left;
  double v11 = minimumViewportInset.top;
  int8x16_t v13 = (void *)MEMORY[0x1E4F1C3C8];
  if (minimumViewportInset.top < 0.0
    || minimumViewportInset.left < 0.0
    || minimumViewportInset.bottom < 0.0
    || minimumViewportInset.right < 0.0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"minimumViewportInset cannot be negative"];
  }
  if (top < 0.0 || left < 0.0 || bottom < 0.0 || right < 0.0) {
    [MEMORY[0x1E4F1CA00] raise:*v13 format:@"maximumViewportInset cannot be negative"];
  }
  double v14 = v8 + v10;
  if (v11 + v9 > top + bottom || v14 > right + left) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *v13, @"minimumViewportInset cannot be larger than maximumViewportInset", v14);
  }
  -[WKWebView _recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:](self, "_recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:", 1, v11, v10, v9, v8, top, left, bottom, right);
  self->_minimumViewportInset.double top = v11;
  self->_minimumViewportInset.double left = v10;
  self->_minimumViewportInset.double bottom = v9;
  self->_minimumViewportInset.double right = v8;
  self->_maximumViewportInset.double top = top;
  self->_maximumViewportInset.double left = left;
  self->_maximumViewportInset.double bottom = bottom;
  self->_maximumViewportInset.double right = right;
}

- (BOOL)isWritingToolsActive
{
  return *((unsigned char *)self->_page.m_ptr + 1456);
}

- (unint64_t)allowedWritingToolsResultOptions
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 4);
  if (*(unsigned char *)(v2 + 254)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 253) == 0;
  }
  if (v3) {
    return 15;
  }
  else {
    return 1;
  }
}

- (int64_t)writingToolsBehavior
{
  unsigned int v2 = WebKit::WebPageProxy::writingToolsBehavior((WebKit::WebPageProxy *)self->_page.m_ptr) - 1;
  if (v2 > 2) {
    return -1;
  }
  else {
    return qword_1994F62A0[(char)v2];
  }
}

- (void)willBeginWritingToolsSession:(id)a3 requestContexts:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  WebKit::convertToWebSession(a3, (uint64_t)v15);
  if (a3)
  {
    CFRetain(a3);
    m_ptr = self->_activeWritingToolsSession.m_ptr;
    self->_activeWritingToolsSession.m_ptr = a3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    WebKit::WebPageProxy::setWritingToolsActive((uint64_t)self->_page.m_ptr, 1);
  }
  double v8 = self->_page.m_ptr;
  double v9 = _Block_copy(a4);
  double v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *double v10 = &unk_1EE9C53B8;
  v10[1] = v9;
  int8x16_t v13 = v10;
  uint64_t v11 = *((void *)v8 + 32);
  double v14 = v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::WillBeginWritingToolsSession,WTF::CompletionHandler<void ()(WTF::Vector<WebCore::WritingTools::Context,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> const&)>>(v11, (uint64_t *)&v14, (uint64_t *)&v13, *(void *)(*((void *)v8 + 4) + 1928), 0, 1);
  uint64_t v12 = (uint64_t)v13;
  int8x16_t v13 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  _Block_release(0);
}

- (void)didBeginWritingToolsSession:(id)a3 contexts:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  WebKit::convertToWebSession(a3, (uint64_t)v38);
  if (v38[32])
  {
    id v26 = a3;
    CFTypeRef v27 = self;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = [a4 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(a4);
        }
        WebKit::convertToWebContext(*(void **)(*((void *)&v28 + 1) + 8 * v9), (uint64_t)&v34);
        if (!v36) {
          break;
        }
        unsigned int v11 = HIDWORD(v33);
        if (HIDWORD(v33) == v33)
        {
          uint64_t v12 = (_OWORD *)WTF::Vector<WebCore::WritingTools::Context,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v32, HIDWORD(v33) + 1, (unint64_t)&v34);
          unsigned int v13 = HIDWORD(v33);
          uint64_t v14 = v32;
          uint64_t v15 = (_OWORD *)(v32 + 80 * HIDWORD(v33));
          *uint64_t v15 = *v12;
          MEMORY[0x199732DC0](v15 + 1, v12 + 1);
          uint64_t v16 = v14 + 80 * v13;
          long long v17 = *(_OWORD *)((char *)v12 + 56);
        }
        else
        {
          uint64_t v18 = v32;
          double v19 = (_OWORD *)(v32 + 80 * HIDWORD(v33));
          _OWORD *v19 = v34;
          MEMORY[0x199732DC0](v19 + 1, v35);
          uint64_t v16 = v18 + 80 * v11;
          long long v17 = *(_OWORD *)&v35[40];
        }
        *(_OWORD *)(v16 + 56) = v17;
        ++HIDWORD(v33);
        if (v36) {
          MEMORY[0x199732DE0](v35);
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [a4 countByEnumeratingWithState:&v28 objects:v37 count:16];
          if (v7) {
            goto LABEL_4;
          }
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      m_ptr = v27->_page.m_ptr;
      uint64_t v21 = *((void *)m_ptr + 32);
      *(void *)&long long v34 = v38;
      *((void *)&v34 + 1) = &v32;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidBeginWritingToolsSession>(v21, (uint64_t *)&v34, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
      if ([v26 type] == 1)
      {
        uint64_t v22 = (void *)[objc_alloc((Class)WebKit::getWKIntelligenceTextEffectCoordinatorClass((WebKit *)1)) initWithDelegate:v27];
        int v23 = v27->_intelligenceTextEffectCoordinator.m_ptr;
        v27->_intelligenceTextEffectCoordinator.m_ptr = v22;
        if (v23)
        {
          CFRelease(v23);
          uint64_t v22 = v27->_intelligenceTextEffectCoordinator.m_ptr;
        }
        uint64_t v24 = objc_msgSend((id)objc_msgSend(a4, "firstObject"), "range");
        objc_msgSend(v22, "startAnimationForRange:completion:", v24, v25, &__block_literal_global_586);
      }
    }
    WTF::Vector<WebCore::WritingTools::Context,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v32, v10);
  }
}

- (void)proofreadingSession:(id)a3 didReceiveSuggestions:(id)a4 processedRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  v82[1] = *(id *)MEMORY[0x1E4F143B8];
  WebKit::convertToWebSession(a3, (uint64_t)v71);
  if (v72)
  {
    WebKit::convertToWebContext(a6, (uint64_t)&v68);
    if (v70)
    {
      NSUInteger v49 = location;
      uint64_t v54 = 0;
      uint64_t v55 = 0;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      unsigned int v13 = (WebKit *)[a4 countByEnumeratingWithState:&v50 objects:v67 count:16];
      uint64_t v14 = v13;
      if (v13)
      {
        uint64_t v15 = *(void *)v51;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v51 != v15) {
              objc_enumerationMutation(a4);
            }
            long long v17 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v16);
            WebKit::convertToWebTextSuggestion(v17, (uint64_t)&v73);
            if ((_BYTE)v76)
            {
              unsigned int v18 = HIDWORD(v55);
              if (HIDWORD(v55) == v55)
              {
                unint64_t v19 = WTF::Vector<WebCore::WritingTools::TextSuggestion,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v54, HIDWORD(v55) + 1, (unint64_t)&v73);
                unsigned int v18 = HIDWORD(v55);
                uint64_t v20 = v54;
                uint64_t v21 = (_OWORD *)(v54 + 48 * HIDWORD(v55));
                long long v22 = *(_OWORD *)(v19 + 16);
                *uint64_t v21 = *(_OWORD *)v19;
                v21[1] = v22;
                int v23 = *(_DWORD **)(v19 + 32);
                if (v23) {
                  *v23 += 2;
                }
                uint64_t v24 = v20 + 48 * v18;
                *(void *)(v24 + 32) = v23;
                uint64_t v25 = (unsigned char *)(v24 + 40);
                id v26 = (WTF::StringImpl **)(v19 + 40);
              }
              else
              {
                uint64_t v27 = v54;
                long long v28 = (_OWORD *)(v54 + 48 * HIDWORD(v55));
                long long v29 = v74;
                *long long v28 = v73;
                v28[1] = v29;
                long long v30 = v75[0];
                if (v75[0]) {
                  *(_DWORD *)v75[0] += 2;
                }
                uint64_t v31 = v27 + 48 * v18;
                *(void *)(v31 + 32) = v30;
                uint64_t v25 = (unsigned char *)(v31 + 40);
                id v26 = &v75[1];
              }
              *uint64_t v25 = *(unsigned char *)v26;
              HIDWORD(v55) = v18 + 1;
              objc_msgSend(self->_writingToolsTextSuggestions.m_ptr, "setObject:forKey:", v17, objc_msgSend(v17, "uuid"));
              if ((_BYTE)v76)
              {
                uint64_t v33 = v75[0];
                v75[0] = 0;
                if (v33)
                {
                  if (*(_DWORD *)v33 == 2) {
                    WTF::StringImpl::destroy(v33, v32);
                  }
                  else {
                    *(_DWORD *)v33 -= 2;
                  }
                }
              }
            }
            uint64_t v16 = (WebKit *)((char *)v16 + 1);
          }
          while (v14 != v16);
          unsigned int v13 = (WebKit *)[a4 countByEnumeratingWithState:&v50 objects:v67 count:16];
          uint64_t v14 = v13;
        }
        while (v13);
      }
      uint64_t v34 = [(id)WebKit::getWKIntelligenceTextEffectCoordinatorClass(v13) characterDeltaForReceivedSuggestions:a4];
      long long v56 = v71[0];
      long long v57 = v71[1];
      LOBYTE(v58) = v72;
      uint64_t v59 = 0;
      LODWORD(v60) = 0;
      HIDWORD(v60) = HIDWORD(v55);
      if (HIDWORD(v55))
      {
        if (HIDWORD(v55) >= 0x5555556)
        {
          __break(0xC471u);
          return;
        }
        unsigned int v35 = 48 * HIDWORD(v55);
        uint64_t v36 = WTF::fastMalloc((WTF *)(48 * HIDWORD(v55)));
        LODWORD(v60) = v35 / 0x30;
        uint64_t v59 = v36;
        if (HIDWORD(v55))
        {
          uint64_t v37 = v54;
          uint64_t v38 = v54 + 48 * HIDWORD(v55);
          do
          {
            long long v39 = *(_OWORD *)(v37 + 16);
            *(_OWORD *)uint64_t v36 = *(_OWORD *)v37;
            *(_OWORD *)(v36 + 16) = v39;
            double v40 = *(_DWORD **)(v37 + 32);
            if (v40) {
              *v40 += 2;
            }
            *(void *)(v36 + 32) = v40;
            *(unsigned char *)(v36 + 40) = *(unsigned char *)(v37 + 40);
            v37 += 48;
            v36 += 48;
          }
          while (v37 != v38);
        }
      }
      *(void *)&long long v61 = v49;
      *((void *)&v61 + 1) = length;
      LOBYTE(v62) = 0;
      char v64 = 0;
      if (v70)
      {
        long long v62 = v68;
        MEMORY[0x199732DC0](v63, v69);
        *(_OWORD *)&v63[40] = *(_OWORD *)&v69[40];
        char v64 = 1;
      }
      BOOL v65 = v7;
      id v66 = 0;
      objc_initWeak(&v66, self);
      long long v73 = v56;
      long long v74 = v57;
      *(_OWORD *)char v75 = v58;
      uint64_t v76 = v59;
      uint64_t v41 = v60;
      uint64_t v59 = 0;
      uint64_t v60 = 0;
      uint64_t v77 = v41;
      long long v78 = v61;
      std::__optional_move_base<WebCore::WritingTools::Context,false>::__optional_move_base[abi:sn180100]((uint64_t)v79, (uint64_t)&v62);
      BOOL v81 = v65;
      v82[0] = 0;
      objc_moveWeak(v82, &v66);
      id v42 = malloc_type_malloc(0xE0uLL, 0x10F2040419B18D0uLL);
      *(void *)id v42 = MEMORY[0x1E4F14398];
      *((void *)v42 + 1) = 50331650;
      *((void *)v42 + 2) = WTF::BlockPtr<void ()(void({block_pointer})(void))>::fromCallable<-[WKWebView proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:]::$_11>(-[WKWebView proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:]::$_11)::{lambda(void *,void({block_pointer})(void))#1}::__invoke;
      *((void *)v42 + 3) = &WTF::BlockPtr<void ()(void({block_pointer})(void))>::fromCallable<-[WKWebView proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:]::$_11>(-[WKWebView proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:]::$_11)::descriptor;
      long long v43 = v74;
      *((_OWORD *)v42 + 2) = v73;
      *((_OWORD *)v42 + 3) = v43;
      *((_OWORD *)v42 + 4) = *(_OWORD *)v75;
      *((void *)v42 + 10) = v76;
      uint64_t v76 = 0;
      uint64_t v44 = v77;
      uint64_t v77 = 0;
      *((void *)v42 + 11) = v44;
      *((_OWORD *)v42 + 6) = v78;
      std::__optional_move_base<WebCore::WritingTools::Context,false>::__optional_move_base[abi:sn180100]((uint64_t)v42 + 112, (uint64_t)v79);
      BOOL v45 = v81;
      *((void *)v42 + 27) = 0;
      *((unsigned char *)v42 + 208) = v45;
      objc_moveWeak((id *)v42 + 27, v82);
      objc_destroyWeak(v82);
      if (v80[64]) {
        MEMORY[0x199732DE0](v80);
      }
      WTF::Vector<WebCore::WritingTools::TextSuggestion,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v76, v46);
      objc_destroyWeak(&v66);
      if (v64) {
        MEMORY[0x199732DE0](v63);
      }
      WTF::Vector<WebCore::WritingTools::TextSuggestion,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v59, v47);
      objc_msgSend(self->_intelligenceTextEffectCoordinator.m_ptr, "requestReplacementWithProcessedRange:finished:characterDelta:operation:completion:", v49, length, v7, v34, v42, &__block_literal_global_588);
      _Block_release(v42);
      WTF::Vector<WebCore::WritingTools::TextSuggestion,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v54, v48);
      if (v70) {
        MEMORY[0x199732DE0](v69);
      }
    }
  }
}

- (void)proofreadingSession:(id)a3 didUpdateState:(int64_t)a4 forSuggestionWithUUID:(id)a5 inContext:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  WebKit::convertToWebSession(a3, (uint64_t)v26);
  if (v26[32])
  {
    WebKit::convertToWebContext(a6, (uint64_t)v23);
    if (v25)
    {
      if ((unint64_t)a4 >= 5) {
        char v10 = 3;
      }
      else {
        char v10 = 0x302030100uLL >> (8 * a4);
      }
      unsigned int v11 = (void *)[self->_writingToolsTextSuggestions.m_ptr objectForKey:a5];
      if (v11)
      {
        WebKit::convertToWebTextSuggestion(v11, (uint64_t)v20);
        if (v22)
        {
          if (!v25) {
            __break(1u);
          }
          m_ptr = self->_page.m_ptr;
          uint64_t v13 = *((void *)m_ptr + 32);
          uint64_t v16 = v26;
          char v17 = v10;
          unsigned int v18 = v20;
          unint64_t v19 = v23;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ProofreadingSessionDidUpdateStateForSuggestion>(v13, (uint64_t)&v16, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
          if (v22)
          {
            uint64_t v15 = v21;
            uint64_t v21 = 0;
            if (v15)
            {
              if (*(_DWORD *)v15 == 2) {
                WTF::StringImpl::destroy(v15, v14);
              }
              else {
                *(_DWORD *)v15 -= 2;
              }
            }
          }
        }
      }
      if (v25) {
        MEMORY[0x199732DE0](&v24);
      }
    }
  }
}

- (void)didEndWritingToolsSession:(id)a3 accepted:(BOOL)a4
{
  v23[2] = *(id *)MEMORY[0x1E4F143B8];
  WebKit::convertToWebSession(a3, (uint64_t)v17);
  if (v18)
  {
    m_ptr = self->_activeWritingToolsSession.m_ptr;
    self->_activeWritingToolsSession.m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    [self->_writingToolsTextSuggestions.m_ptr removeAllObjects];
    if ([a3 type] == 1)
    {
      uint64_t v8 = self->_intelligenceTextEffectCoordinator.m_ptr;
      long long v13 = v17[0];
      long long v14 = v17[1];
      LOBYTE(v15) = v18;
      id v16 = 0;
      objc_initWeak(&v16, self);
      long long v19 = v13;
      long long v20 = v14;
      long long v21 = v15;
      BOOL v22 = a4;
      v23[0] = 0;
      objc_moveWeak(v23, &v16);
      uint64_t v9 = malloc_type_malloc(0x60uLL, 0x10E0040AD1225A2uLL);
      *(void *)uint64_t v9 = MEMORY[0x1E4F14398];
      *((void *)v9 + 1) = 50331650;
      *((void *)v9 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView didEndWritingToolsSession:accepted:]::$_12>(-[WKWebView didEndWritingToolsSession:accepted:]::$_12)::{lambda(void *)#1}::__invoke;
      *((void *)v9 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView didEndWritingToolsSession:accepted:]::$_12>(-[WKWebView didEndWritingToolsSession:accepted:]::$_12)::descriptor;
      long long v10 = v20;
      *((_OWORD *)v9 + 2) = v19;
      *((_OWORD *)v9 + 3) = v10;
      *((_OWORD *)v9 + 4) = v21;
      *((unsigned char *)v9 + 80) = v22;
      *((void *)v9 + 11) = 0;
      objc_moveWeak((id *)v9 + 11, v23);
      objc_destroyWeak(v23);
      [v8 flushReplacementsWithCompletion:v9];
      _Block_release(v9);
      objc_destroyWeak(&v16);
    }
    else
    {
      WebKit::WebPageProxy::setWritingToolsActive((uint64_t)self->_page.m_ptr, 0);
      unsigned int v11 = self->_page.m_ptr;
      uint64_t v12 = *((void *)v11 + 32);
      *(void *)&long long v19 = v17;
      BYTE8(v19) = a4;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidEndWritingToolsSession>(v12, (uint64_t)&v19, *(void *)(*((void *)v11 + 4) + 1928), 0);
    }
  }
}

- (void)compositionSession:(id)a3 didReceiveText:(id)a4 replacementRange:(_NSRange)a5 inContext:(id)a6 finished:(BOOL)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  WebKit::convertToWebSession(a3, (uint64_t)v24);
  if (v24[32])
  {
    WebKit::convertToWebContext(a6, (uint64_t)v21);
    if (v23)
    {
      self->_writingToolsTextReplacementsFinished = a7;
      ++self->_partialIntelligenceTextAnimationCount;
      m_ptr = self->_page.m_ptr;
      CFTypeRef cf = a4;
      if (a4) {
        CFRetain(a4);
      }
      WebCore::AttributedString::fromNSAttributedString();
      v16[0] = location;
      v16[1] = length;
      if (!v23) {
        __break(1u);
      }
      uint64_t v14 = *((void *)m_ptr + 32);
      v19[0] = v24;
      v19[1] = v18;
      v19[2] = v16;
      v19[3] = v21;
      BOOL v20 = a7;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::CompositionSessionDidReceiveTextWithReplacementRange>(v14, (uint64_t)v19, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
      MEMORY[0x199732DE0](v18);
      CFTypeRef v15 = cf;
      CFTypeRef cf = 0;
      if (v15) {
        CFRelease(v15);
      }
      if (v23) {
        MEMORY[0x199732DE0](&v22);
      }
    }
  }
}

- (void)writingToolsSession:(id)a3 didReceiveAction:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  WebKit::convertToWebSession(a3, (uint64_t)v11);
  if (v11[32])
  {
    char v6 = a4 == 2;
    if (a4 == 3)
    {
      char v6 = 2;
      self->_writingToolsTextReplacementsFinished = 0;
      self->_partialIntelligenceTextAnimationCount = 0;
    }
    m_ptr = self->_page.m_ptr;
    uint64_t v8 = *((void *)m_ptr + 32);
    uint64_t v9 = v11;
    char v10 = v6;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WritingToolsSessionDidReceiveAction>(v8, (uint64_t)&v9, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  }
}

- (id)viewForIntelligenceTextEffectCoordinator:(id)a3
{
  return self->_contentView.m_ptr;
}

- (void)intelligenceTextEffectCoordinator:(id)a3 rectsForProofreadingSuggestionsInRange:(_NSRange)a4 completion:(id)a5
{
  m_ptr = self->_page.m_ptr;
  _NSRange v10 = a4;
  char v6 = _Block_copy(a5);
  BOOL v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C53E0;
  v7[1] = v6;
  uint64_t v9 = v7;
  WebKit::WebPageProxy::proofreadingSessionSuggestionTextRectsInRootViewCoordinates((uint64_t)m_ptr, (uint64_t *)&v10, (uint64_t *)&v9);
  uint64_t v8 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (void)intelligenceTextEffectCoordinator:(id)a3 updateTextVisibilityForRange:(_NSRange)a4 visible:(BOOL)a5 identifier:(id)a6 completion:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  WTF::UUID::fromNSUUID(v19, (WTF::UUID *)a6, (NSUUID *)a2);
  if (v20)
  {
    m_ptr = self->_page.m_ptr;
    v18[0] = location;
    v18[1] = length;
    aBlock = _Block_copy(a7);
    id v16 = 0;
    objc_initWeak(&v16, self);
    uint64_t v13 = WTF::fastMalloc((WTF *)0x18);
    *(void *)uint64_t v13 = &unk_1EE9C5408;
    *(void *)(v13 + 8) = aBlock;
    *(void *)(v13 + 16) = 0;
    objc_moveWeak((id *)(v13 + 16), &v16);
    uint64_t v17 = v13;
    WebKit::WebPageProxy::updateTextVisibilityForActiveWritingToolsSession((uint64_t)m_ptr, (uint64_t)v18, a5, (uint64_t)v19, &v17);
    uint64_t v14 = v17;
    uint64_t v17 = 0;
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 8))(v14);
    }
    objc_destroyWeak(&v16);
    _Block_release(0);
  }
  else
  {
    (*((void (**)(id))a7 + 2))(a7);
  }
}

- (void)intelligenceTextEffectCoordinator:(id)a3 textPreviewsForRange:(_NSRange)a4 completion:(id)a5
{
  m_ptr = self->_page.m_ptr;
  _NSRange v12 = a4;
  aBlock = _Block_copy(a5);
  id v10 = 0;
  objc_initWeak(&v10, self);
  uint64_t v7 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v7 = &unk_1EE9C5430;
  *(void *)(v7 + 8) = aBlock;
  *(void *)(v7 + 16) = 0;
  objc_moveWeak((id *)(v7 + 16), &v10);
  uint64_t v11 = v7;
  WebKit::WebPageProxy::textPreviewDataForActiveWritingToolsSession((uint64_t)m_ptr, (uint64_t *)&v12, &v11);
  uint64_t v8 = v11;
  uint64_t v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  objc_destroyWeak(&v10);
  _Block_release(0);
}

- (void)intelligenceTextEffectCoordinator:(id)a3 decorateReplacementsForRange:(_NSRange)a4 completion:(id)a5
{
  m_ptr = self->_page.m_ptr;
  _NSRange v10 = a4;
  char v6 = _Block_copy(a5);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C5458;
  v7[1] = v6;
  uint64_t v9 = v7;
  WebKit::WebPageProxy::decorateTextReplacementsForActiveWritingToolsSession((uint64_t)m_ptr, (uint64_t *)&v10, (uint64_t *)&v9);
  uint64_t v8 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (void)intelligenceTextEffectCoordinator:(id)a3 setSelectionForRange:(_NSRange)a4 completion:(id)a5
{
  m_ptr = self->_page.m_ptr;
  _NSRange v10 = a4;
  char v6 = _Block_copy(a5);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C5480;
  v7[1] = v6;
  uint64_t v9 = v7;
  WebKit::WebPageProxy::setSelectionForActiveWritingToolsSession((uint64_t)m_ptr, (uint64_t *)&v10, (uint64_t *)&v9);
  uint64_t v8 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (void)_proofreadingSessionShowDetailsForSuggestionWithUUID:(id)a3 relativeToRect:(CGRect)a4
{
  m_ptr = self->_activeWritingToolsSession.m_ptr;
  if (m_ptr)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    uint64_t v11 = (void *)[m_ptr textViewDelegate];
    if (objc_opt_respondsToSelector())
    {
      _NSRange v12 = self->_contentView.m_ptr;
      if (v12) {
        CFRetain(self->_contentView.m_ptr);
      }
      objc_msgSend(v11, "proofreadingSessionWithUUID:showDetailsForSuggestionWithUUID:relativeToRect:inView:", objc_msgSend(self->_activeWritingToolsSession.m_ptr, "uuid"), a3, v12, x, y, width, height);
      if (v12)
      {
        CFRelease(v12);
      }
    }
  }
}

- (void)_proofreadingSessionUpdateState:(unsigned __int8)a3 forSuggestionWithUUID:(id)a4
{
  m_ptr = self->_activeWritingToolsSession.m_ptr;
  if (m_ptr)
  {
    int v7 = a3;
    uint64_t v8 = (void *)[m_ptr textViewDelegate];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [self->_activeWritingToolsSession.m_ptr uuid];
      if ((v7 - 1) > 2) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = qword_1994F62B8[(char)(v7 - 1)];
      }
      [v8 proofreadingSessionWithUUID:v9 updateState:v10 forSuggestionWithUUID:a4];
    }
  }
}

- (void)_didEndPartialIntelligenceTextAnimation
{
  unint64_t partialIntelligenceTextAnimationCount = self->_partialIntelligenceTextAnimationCount;
  if (partialIntelligenceTextAnimationCount)
  {
    unint64_t v3 = partialIntelligenceTextAnimationCount - 1;
    self->_unint64_t partialIntelligenceTextAnimationCount = v3;
    if (!v3 && self->_writingToolsTextReplacementsFinished) {
      WebKit::WebPageProxy::intelligenceTextAnimationsDidComplete((uint64_t)self->_page.m_ptr);
    }
  }
}

- (BOOL)_writingToolsTextReplacementsFinished
{
  return self->_writingToolsTextReplacementsFinished;
}

- (void)_addTextAnimationForAnimationID:(id)a3 withData:(const TextAnimationData *)a4
{
}

- (void)_removeTextAnimationForAnimationID:(id)a3
{
}

- (UIEdgeInsets)minimumViewportInset
{
  double top = self->_minimumViewportInset.top;
  double left = self->_minimumViewportInset.left;
  double bottom = self->_minimumViewportInset.bottom;
  double right = self->_minimumViewportInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)maximumViewportInset
{
  double top = self->_maximumViewportInset.top;
  double left = self->_maximumViewportInset.left;
  double bottom = self->_maximumViewportInset.bottom;
  double right = self->_maximumViewportInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isFindInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (void)_setHasActiveNowPlayingSession:(BOOL)a3
{
  self->__hasActiveNowPlayingSession = a3;
}

- (void).cxx_destruct
{
  m_ptr = self->_gamepadsRecentlyAccessedState.m_ptr;
  self->_gamepadsRecentlyAccessedState.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  int v4 = self->_pendingPageLoadObserverHost.m_ptr;
  self->_pendingPageLoadObserverHost.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  BOOL v5 = self->_scrollViewDefaultAllowedTouchTypes.m_ptr;
  self->_scrollViewDefaultAllowedTouchTypes.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  char v6 = self->_passwordView.m_ptr;
  self->_passwordView.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  int v7 = self->_stableStatePresentationUpdateCallbacks.m_ptr;
  self->_stableStatePresentationUpdateCallbacks.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_callbacksDeferredDuringResize, (void *)a2);
  uint64_t v9 = self->_enclosingScrollViewScrollTimer.m_ptr;
  self->_enclosingScrollViewScrollTimer.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = self->_customContentFixedOverlayView.m_ptr;
  self->_customContentFixedOverlayView.m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = self->_customContentView.m_ptr;
  self->_customContentView.m_ptr = 0;
  if (v11) {
    CFRelease(v11);
  }
  WTF::Vector<WTF::RetainPtr<__SecCertificate *>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_resizeAssertions, v8);
  uint64_t v13 = self->_endLiveResizeTimer.m_ptr;
  self->_endLiveResizeTimer.m_ptr = 0;
  if (v13) {
    CFRelease(v13);
  }
  uint64_t v14 = self->_resizeAnimationView.m_ptr;
  self->_resizeAnimationView.m_ptr = 0;
  if (v14) {
    CFRelease(v14);
  }
  unint64_t m_colorAndFlags = self->_perProcessState.scrollViewBackgroundColor.m_colorAndFlags;
  if ((m_colorAndFlags & 0x8000000000000) != 0)
  {
    uint64_t v36 = (unsigned int *)(m_colorAndFlags & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(m_colorAndFlags & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v36);
      WTF::fastFree((WTF *)v36, v12);
    }
  }
  id v16 = self->_remoteObjectRegistry.m_ptr;
  self->_remoteObjectRegistry.m_ptr = 0;
  if (v16) {
    CFRelease(v16);
  }
  uint64_t v17 = self->_findInteraction.m_ptr;
  self->_findInteraction.m_ptr = 0;
  if (v17) {
    CFRelease(v17);
  }
  p_findOverlaysOutsideContentView = &self->_findOverlaysOutsideContentView;
  if (self->_findOverlaysOutsideContentView.__engaged_)
  {
    long long v19 = self->_findOverlaysOutsideContentView.var0.__val_.left.m_ptr;
    self->_findOverlaysOutsideContentView.var0.__val_.left.m_ptr = 0;
    if (v19) {
      CFRelease(v19);
    }
    char v20 = self->_findOverlaysOutsideContentView.var0.__val_.bottom.m_ptr;
    self->_findOverlaysOutsideContentView.var0.__val_.bottom.m_ptr = 0;
    if (v20) {
      CFRelease(v20);
    }
    uint64_t v21 = self->_findOverlaysOutsideContentView.var0.__val_.right.m_ptr;
    self->_findOverlaysOutsideContentView.var0.__val_.right.m_ptr = 0;
    if (v21) {
      CFRelease(v21);
    }
    uint64_t v22 = p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr;
    p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr = 0;
    if (v22) {
      CFRelease(v22);
    }
  }
  char v23 = self->_fullScreenWindowController.m_ptr;
  self->_fullScreenWindowController.m_ptr = 0;
  if (v23) {
    CFRelease(v23);
  }
  uint64_t v24 = self->_contentProviderRegistry.m_ptr;
  self->_contentProviderRegistry.m_ptr = 0;
  if (v24) {
    CFRelease(v24);
  }
  WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&self->_visibleContentRectUpdateCallbacks, v12);
  value = self->_gestureController.__ptr_.__value_;
  self->_gestureController.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(ViewGestureController *))(*(void *)value + 8))(value);
  }
  id v26 = self->_contentView.m_ptr;
  self->_contentView.m_ptr = 0;
  if (v26) {
    CFRelease(v26);
  }
  uint64_t v27 = self->_scrollView.m_ptr;
  self->_scrollView.m_ptr = 0;
  if (v27) {
    CFRelease(v27);
  }
  long long v28 = self->_intelligenceTextEffectCoordinator.m_ptr;
  self->_intelligenceTextEffectCoordinator.m_ptr = 0;
  if (v28) {
    CFRelease(v28);
  }
  long long v29 = self->_activeWritingToolsSession.m_ptr;
  self->_activeWritingToolsSession.m_ptr = 0;
  if (v29) {
    CFRelease(v29);
  }
  long long v30 = self->_writingToolsTextSuggestions.m_ptr;
  self->_writingToolsTextSuggestions.m_ptr = 0;
  if (v30) {
    CFRelease(v30);
  }
  uint64_t v31 = self->_warningView.m_ptr;
  self->_warningView.m_ptr = 0;
  if (v31) {
    CFRelease(v31);
  }
  objc_destroyWeak(&self->_appHighlightDelegate.m_weakReference);
  objc_destroyWeak(&self->_inputDelegate.m_weakReference);
  objc_destroyWeak(&self->_textManipulationDelegate.m_weakReference);
  uint64_t v32 = (id *)self->_resourceLoadDelegate.__ptr_.__value_;
  self->_resourceLoadDelegate.__ptr_.__value_ = 0;
  if (v32) {
    WebKit::ResourceLoadDelegate::operator delete(v32);
  }
  uint64_t v33 = (id *)self->_iconLoadingDelegate.__ptr_.__value_;
  self->_iconLoadingDelegate.__ptr_.__value_ = 0;
  if (v33) {
    WebKit::IconLoadingDelegate::operator delete(v33);
  }
  std::unique_ptr<WebKit::UIDelegate>::reset[abi:sn180100]((uint64_t *)&self->_uiDelegate, 0);
  std::unique_ptr<WebKit::NavigationState>::reset[abi:sn180100]((WebKit::NavigationState **)&self->_navigationState, 0);
  uint64_t v34 = self->_page.m_ptr;
  self->_page.m_ptr = 0;
  if (v34) {
    CFRelease(*((CFTypeRef *)v34 + 1));
  }
  unsigned int v35 = self->_configuration.m_ptr;
  self->_configuration.m_ptr = 0;
  if (v35)
  {
    CFRelease(v35);
  }
}

- (void)_alignCenter:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _alignCenterForWebView:a3];
  }
}

- (void)_alignJustified:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _alignJustifiedForWebView:a3];
  }
}

- (void)_alignLeft:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _alignLeftForWebView:a3];
  }
}

- (void)_alignRight:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _alignRightForWebView:a3];
  }
}

- (void)_indent:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _indentForWebView:a3];
  }
}

- (void)_outdent:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _outdentForWebView:a3];
  }
}

- (void)_toggleStrikeThrough:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _toggleStrikeThroughForWebView:a3];
  }
}

- (void)_insertOrderedList:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _insertOrderedListForWebView:a3];
  }
}

- (void)_insertUnorderedList:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _insertUnorderedListForWebView:a3];
  }
}

- (void)_insertNestedOrderedList:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _insertNestedOrderedListForWebView:a3];
  }
}

- (void)_insertNestedUnorderedList:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _insertNestedUnorderedListForWebView:a3];
  }
}

- (void)_increaseListLevel:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _increaseListLevelForWebView:a3];
  }
}

- (void)_decreaseListLevel:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _decreaseListLevelForWebView:a3];
  }
}

- (void)_changeListType:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _changeListTypeForWebView:a3];
  }
}

- (void)_pasteAsQuotation:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _pasteAsQuotationForWebView:a3];
  }
}

- (void)_pasteAndMatchStyle:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _pasteAndMatchStyleForWebView:a3];
  }
}

- (id)inputAccessoryView
{
  return (id)[self->_contentView.m_ptr inputAccessoryViewForWebView];
}

- (id)inputView
{
  return (id)[self->_contentView.m_ptr inputViewForWebView];
}

- (id)inputAssistantItem
{
  return (id)[self->_contentView.m_ptr inputAssistantItemForWebView];
}

- (unint64_t)_selectionAttributes
{
  return self->_selectionAttributes;
}

- (CGSize)_viewportSizeForCSSViewportUnits
{
  WebCore::FloatSize::operator CGSize();
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_setViewportSizeForCSSViewportUnits:(CGSize)a3
{
  CGSize v8 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v6, &v8);
  *(float *)&double v5 = v6;
  if (v6 <= 0.0 || (*(float *)&double v5 = v7, v7 <= 0.0)) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Viewport size should not be empty", v5);
  }
  WebKit::WebPageProxy::setViewportSizeForCSSViewportUnits((uint64_t)self->_page.m_ptr, (const WebCore::FloatSize *)&v6);
}

- (BOOL)_isBeingInspected
{
  m_ptr = self->_page.m_ptr;
  return m_ptr && *((_DWORD *)m_ptr + 225) != 0;
}

- (_WKInspector)_inspector
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 801)) {
    return 0;
  }
  uint64_t v4 = *((void *)m_ptr + 50);
  if (!v4) {
    return 0;
  }
  else {
    return *(_WKInspector **)(v4 + 8);
  }
}

- (void)_didEnableBrowserExtensions:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  unsigned int v6 = WTF::HashTable<WebCore::PermissionsPolicy::Feature,WTF::KeyValuePair<WebCore::PermissionsPolicy::Feature,WebCore::Allowlist>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WebCore::PermissionsPolicy::Feature,WebCore::Allowlist>>,WTF::IntHash<WebCore::PermissionsPolicy::Feature>,WTF::HashMap<WebCore::PermissionsPolicy::Feature,WebCore::Allowlist,WTF::IntHash<WebCore::PermissionsPolicy::Feature>,WTF::StrongEnumHashTraits<WebCore::PermissionsPolicy::Feature>,WTF::HashTraits<WebCore::Allowlist>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::StrongEnumHashTraits<WebCore::PermissionsPolicy::Feature>>::computeBestTableSize([a3 count]);
  if (v6 <= 8) {
    unsigned int v7 = 8;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = WTF::fastZeroedMalloc((WTF *)(16 * v7 + 16));
  _NSRange v12 = (WTF::StringImpl **)(v8 + 16);
  *(_DWORD *)(v8 + 8) = v7 - 1;
  *(_DWORD *)(v8 + 12) = v7;
  *(void *)uint64_t v8 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3321888768;
  v11[2] = __52__WKWebView_WKPrivate___didEnableBrowserExtensions___block_invoke;
  int32x2_t v11[3] = &__block_descriptor_40_e8_32c66_ZTSKZ52__WKWebView_WKPrivate___didEnableBrowserExtensions__E4__47_e35_v32__0__NSString_8__NSString_16_B24l;
  v11[4] = &v12;
  [a3 enumerateKeysAndObjectsUsingBlock:v11];
  uint64_t v10 = *(void *)(*((void *)self->_page.m_ptr + 143) + 56);
  if (v10) {
    WebKit::InspectorBrowserAgent::extensionsEnabled(v10, &v12);
  }
  if (v12) {
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::String>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v12, v9);
  }
}

WTF::StringImpl *__52__WKWebView_WKPrivate___didEnableBrowserExtensions___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(uint64_t **)(a1 + 32);
  MEMORY[0x19972EAD0](&v33);
  uint64_t v7 = *v4;
  if (*v4
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::String>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(v4, 0), (uint64_t v7 = *v4) != 0))
  {
    int v8 = *(_DWORD *)(v7 - 8);
  }
  else
  {
    int v8 = 0;
  }
  unsigned int v9 = *((_DWORD *)v33 + 4);
  if (v9 >= 0x100) {
    unsigned int v10 = v9 >> 8;
  }
  else {
    unsigned int v10 = WTF::StringImpl::hashSlowCase(v33);
  }
  uint64_t v11 = 0;
  for (int i = 1; ; ++i)
  {
    uint64_t v13 = v10 & v8;
    uint64_t v14 = (WTF **)(v7 + 16 * v13);
    CFTypeRef v15 = *v14;
    if (*v14 != (WTF *)-1) {
      break;
    }
    uint64_t v11 = (WTF **)(v7 + 16 * v13);
LABEL_13:
    unsigned int v10 = i + v13;
  }
  if (!v15)
  {
    if (v11)
    {
      *uint64_t v11 = 0;
      v11[1] = 0;
      --*(_DWORD *)(*v4 - 16);
      uint64_t v14 = v11;
    }
    id v16 = v33;
    uint64_t v33 = 0;
    uint64_t v17 = *v14;
    *uint64_t v14 = v16;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v5);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
    MEMORY[0x19972EAD0](&v34, a3);
    char v23 = v34;
    uint64_t v34 = 0;
    uint64_t v24 = v14[1];
    v14[1] = v23;
    if (v24)
    {
      int v25 = *(_DWORD *)v24 - 2;
      if (*(_DWORD *)v24 != 2) {
        goto LABEL_29;
      }
      WTF::StringImpl::destroy(v24, v18);
      uint64_t v24 = v34;
      uint64_t v34 = 0;
      if (!v24) {
        goto LABEL_30;
      }
      int v25 = *(_DWORD *)v24 - 2;
      if (*(_DWORD *)v24 == 2) {
        WTF::StringImpl::destroy(v24, v18);
      }
      else {
LABEL_29:
      }
        *(_DWORD *)uint64_t v24 = v25;
    }
LABEL_30:
    uint64_t v26 = *v4;
    if (*v4) {
      int v27 = *(_DWORD *)(v26 - 12) + 1;
    }
    else {
      int v27 = 1;
    }
    *(_DWORD *)(v26 - 12) = v27;
    uint64_t v28 = *v4;
    if (*v4) {
      int v29 = *(_DWORD *)(v28 - 12);
    }
    else {
      int v29 = 0;
    }
    uint64_t v30 = (*(_DWORD *)(v28 - 16) + v29);
    unint64_t v31 = *(unsigned int *)(v28 - 4);
    if (v31 > 0x400)
    {
      if (v31 > 2 * v30) {
        goto LABEL_39;
      }
    }
    else if (3 * v31 > 4 * v30)
    {
      goto LABEL_39;
    }
    WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::String>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::String>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(v4, v14);
    goto LABEL_39;
  }
  if (!WTF::equal(v15, v33, v6)) {
    goto LABEL_13;
  }
  MEMORY[0x19972EAD0](&v34, a3);
  uint64_t v19 = v7 + 16 * v13;
  char v20 = v34;
  uint64_t v34 = 0;
  uint64_t v21 = *(WTF::StringImpl **)(v19 + 8);
  *(void *)(v19 + 8) = v20;
  if (v21)
  {
    int v22 = *(_DWORD *)v21 - 2;
    if (*(_DWORD *)v21 != 2) {
      goto LABEL_23;
    }
    WTF::StringImpl::destroy(v21, v18);
    uint64_t v21 = v34;
    uint64_t v34 = 0;
    if (!v21) {
      goto LABEL_39;
    }
    int v22 = *(_DWORD *)v21 - 2;
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v18);
    }
    else {
LABEL_23:
    }
      *(_DWORD *)uint64_t v21 = v22;
  }
LABEL_39:
  CGSize result = v33;
  uint64_t v33 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 2) {
      return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v18);
    }
    else {
      *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (void)_didDisableBrowserExtensions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  int v22 = 0;
  unsigned int v6 = WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::computeBestTableSize([a3 count]);
  if (v6 <= 8) {
    unsigned int v7 = 8;
  }
  else {
    unsigned int v7 = v6;
  }
  uint64_t v8 = WTF::fastZeroedMalloc((WTF *)(8 * v7 + 16));
  int v22 = (WTF::StringImpl **)(v8 + 16);
  *(_DWORD *)(v8 + 8) = v7 - 1;
  *(_DWORD *)(v8 + 12) = v7;
  *(void *)uint64_t v8 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(a3);
        }
        MEMORY[0x19972EAD0](&v17, *(void *)(*((void *)&v18 + 1) + 8 * i));
        WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::add((uint64_t *)&v22, &v17, v13, (uint64_t)v23);
        CFTypeRef v15 = v17;
        uint64_t v17 = 0;
        if (v15)
        {
          if (*(_DWORD *)v15 == 2) {
            WTF::StringImpl::destroy(v15, v14);
          }
          else {
            *(_DWORD *)v15 -= 2;
          }
        }
      }
      uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }
  uint64_t v16 = *(void *)(*((void *)self->_page.m_ptr + 143) + 56);
  if (v16) {
    WebKit::InspectorBrowserAgent::extensionsDisabled(v16, &v22);
  }
  if (v22) {
    WTF::HashTable<WTF::String,WTF::String,WTF::IdentityExtractor,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::String>>::deallocateTable(v22, v9);
  }
}

- (_WKFrameHandle)_mainFrame
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 41);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(v2 + 272);
  uint64_t v4 = *(void *)(v2 + 280);
  uint64_t v5 = API::Object::newObject(0x28uLL, 11);
  *(void *)uint64_t v5 = &unk_1EE9D1E28;
  WebKit::InitializeWebKit2((WebKit *)v5);
  *(void *)uint64_t v5 = &unk_1EE9B3E30;
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v4;
  *(unsigned char *)(v5 + 32) = 0;
  unsigned int v6 = *(const void **)(v5 + 8);
  if (v6) {
    CFRetain(*(CFTypeRef *)(v5 + 8));
  }
  unsigned int v7 = (id)CFMakeCollectable(v6);
  CFRelease(*(CFTypeRef *)(v5 + 8));
  return v7;
}

- (BOOL)_negotiatedLegacyTLS
{
  return *(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 1002);
}

- (BOOL)_wasPrivateRelayed
{
  return *(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 1003);
}

- (void)_frames:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v5 = _Block_copy(a3);
  unsigned int v6 = self->_page.m_ptr;
  CFRetain(*((CFTypeRef *)v6 + 1));
  unsigned int v7 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v7 = &unk_1EE9C54A8;
  v7[1] = v5;
  void v7[2] = v6;
  unsigned int v9 = v7;
  WebKit::WebPageProxy::getAllFrames((uint64_t)m_ptr, (uint64_t *)&v9);
  uint64_t v8 = (uint64_t)v9;
  unsigned int v9 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (void)_frameTrees:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v5 = _Block_copy(a3);
  unsigned int v6 = self->_page.m_ptr;
  CFRetain(*((CFTypeRef *)v6 + 1));
  unsigned int v7 = (void *)WTF::fastMalloc((WTF *)0x18);
  void *v7 = &unk_1EE9C54D0;
  v7[1] = v5;
  void v7[2] = v6;
  uint64_t v8 = v7;
  WebKit::WebPageProxy::getAllFrameTrees(m_ptr, (uint64_t *)&v8);
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }

  _Block_release(0);
}

- (void)_setEditable:(BOOL)a3
{
  int v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  int v6 = *((unsigned char *)m_ptr + 688) != 0;
  WebKit::WebPageProxy::setEditable((uint64_t)m_ptr, v3);
  if (v6 != v3)
  {
    unsigned int v7 = self->_contentView.m_ptr;
    [v7 _didChangeWebViewEditability];
  }
}

- (void)_executeEditCommand:(id)a3 argument:(id)a4 completion:(id)a5
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19972EAD0](&v18, a3);
  MEMORY[0x19972EAD0](&v17, a4);
  unsigned int v9 = _Block_copy(a5);
  uint64_t v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v10 = &unk_1EE9C54F8;
  v10[1] = v9;
  uint64_t v16 = v10;
  WebKit::WebPageProxy::executeEditCommand((uint64_t)m_ptr, &v18, &v17, (uint64_t *)&v16);
  uint64_t v11 = (uint64_t)v16;
  uint64_t v16 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
  uint64_t v13 = v17;
  uint64_t v17 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  uint64_t v14 = v18;
  long long v18 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v12);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
}

- (_WKTextManipulationDelegate)_textManipulationDelegate
{
  return (_WKTextManipulationDelegate *)objc_loadWeak(&self->_textManipulationDelegate.m_weakReference);
}

- (void)_setTextManipulationDelegate:(id)a3
{
}

- (void)_startTextManipulationsWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  char v8 = [a3 includeSubframes];
  id WeakRetained = objc_loadWeakRetained(&self->_textManipulationDelegate.m_weakReference);
  if (WeakRetained && (CFRelease(WeakRetained), (uint64_t v10 = self->_page.m_ptr) != 0) && *((void *)v10 + 41))
  {
    char v36 = v8;
    id v37 = a4;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    if (a3)
    {
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v11 = (void *)[a3 exclusionRules];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v43 != v13) {
              objc_enumerationMutation(v11);
            }
            CFTypeRef v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            char v16 = [v15 isExclusion] ^ 1;
            if ([v15 attributeName])
            {
              LOBYTE(v39) = v16;
              uint64_t v17 = (WTF::AtomStringImpl *)[v15 attributeName];
              WTF::AtomStringImpl::add((uint64_t *)&v48, v17, v18);
              location[0] = v48;
              MEMORY[0x19972EAD0](&location[1], [v15 attributeValue]);
              long long v19 = *(_OWORD *)location;
              location[0] = 0;
              location[1] = 0;
              long long v40 = v19;
              int v41 = 1;
              if (HIDWORD(v47) == v47)
              {
                WTF::Vector<WebCore::TextManipulationControllerExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::TextManipulationControllerExclusionRule>((uint64_t)&v46, (unint64_t)&v39);
              }
              else
              {
                char v23 = (unsigned char *)(v46 + 32 * HIDWORD(v47));
                *char v23 = v39;
                std::__variant_detail::__move_constructor<std::__variant_detail::__traits<WebCore::TextManipulationControllerExclusionRule::ElementRule,WebCore::TextManipulationControllerExclusionRule::AttributeRule,WebCore::TextManipulationControllerExclusionRule::ClassRule>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)(v23 + 8), (uint64_t)&v40);
                ++HIDWORD(v47);
              }
              if (v41 != -1) {
                ((void (*)(void **, long long *))off_1EE9C4DA8[v41])(&v48, &v40);
              }
              int v41 = -1;
              uint64_t v24 = (WTF::StringImpl *)location[1];
              location[1] = 0;
              if (v24)
              {
                if (*(_DWORD *)v24 == 2) {
                  WTF::StringImpl::destroy(v24, v20);
                }
                else {
                  *(_DWORD *)v24 -= 2;
                }
              }
              uint64_t v25 = (WTF::StringImpl *)location[0];
              location[0] = 0;
              if (v25)
              {
                if (*(_DWORD *)v25 == 2) {
                  WTF::StringImpl::destroy(v25, v20);
                }
                else {
                  *(_DWORD *)v25 -= 2;
                }
              }
              continue;
            }
            if ([v15 className])
            {
              LOBYTE(v39) = v16;
              long long v21 = (WTF::AtomStringImpl *)[v15 className];
              WTF::AtomStringImpl::add((uint64_t *)location, v21, v22);
              *(id *)&long long v40 = location[0];
              int v41 = 2;
              if (HIDWORD(v47) == v47) {
                goto LABEL_18;
              }
            }
            else
            {
              LOBYTE(v39) = v16;
              uint64_t v26 = (WTF::AtomStringImpl *)[v15 elementName];
              WTF::AtomStringImpl::add((uint64_t *)location, v26, v27);
              *(id *)&long long v40 = location[0];
              int v41 = 0;
              if (HIDWORD(v47) == v47)
              {
LABEL_18:
                WTF::Vector<WebCore::TextManipulationControllerExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::TextManipulationControllerExclusionRule>((uint64_t)&v46, (unint64_t)&v39);
                goto LABEL_32;
              }
            }
            uint64_t v28 = (unsigned char *)(v46 + 32 * HIDWORD(v47));
            *uint64_t v28 = v39;
            std::__variant_detail::__move_constructor<std::__variant_detail::__traits<WebCore::TextManipulationControllerExclusionRule::ElementRule,WebCore::TextManipulationControllerExclusionRule::AttributeRule,WebCore::TextManipulationControllerExclusionRule::ClassRule>,(std::__variant_detail::_Trait)1>::__move_constructor((uint64_t)(v28 + 8), (uint64_t)&v40);
            ++HIDWORD(v47);
LABEL_32:
            if (v41 != -1) {
              ((void (*)(id *, long long *))off_1EE9C4DA8[v41])(location, &v40);
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v49 count:16];
        }
        while (v12);
      }
    }
    int v29 = self->_page.m_ptr;
    location[0] = 0;
    objc_initWeak(location, self);
    uint64_t v30 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v30 = &unk_1EE9C5520;
    *(void *)(v30 + 8) = 0;
    objc_moveWeak((id *)(v30 + 8), location);
    uint64_t v39 = v30;
    unint64_t v31 = _Block_copy(v37);
    uint64_t v32 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v32 = &unk_1EE9C5548;
    v32[1] = v31;
    double v48 = v32;
    WebKit::WebPageProxy::startTextManipulations((uint64_t)v29, (uint64_t)&v46, v36, &v39, (uint64_t *)&v48);
    uint64_t v33 = v48;
    double v48 = 0;
    if (v33) {
      (*(void (**)(void *))(*(void *)v33 + 8))(v33);
    }
    _Block_release(0);
    if (v39) {
      (*(void (**)(uint64_t))(*(void *)v39 + 8))(v39);
    }
    objc_destroyWeak(location);
    WTF::Vector<WebCore::TextManipulationControllerExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v46, v34);
  }
  else
  {
    unsigned int v35 = (void (*)(id))*((void *)a4 + 2);
    v35(a4);
  }
}

- (void)_completeTextManipulation:(id)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (m_ptr
    && (!*((unsigned char *)m_ptr + 1362)
     || ([MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"],
         self->_page.m_ptr))
    && ([a3 identifier], coreTextManipulationItemIdentifierFromString(v43), v45))
  {
    uint64_t v32 = self;
    id aBlock = a4;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    char v8 = (void *)[a3 tokens];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v13 = (WTF::StringImpl *)objc_msgSend((id)objc_msgSend(v12, "identifier"), "longLongValue");
          if (v13 == (WTF::StringImpl *)-1)
          {
            __break(0xC471u);
            JUMPOUT(0x198B86EF4);
          }
          v46[0] = v13;
          MEMORY[0x19972EAD0](&v46[1], [v12 content]);
          LOBYTE(v47) = 0;
          char v49 = 0;
          char v50 = 0;
          unsigned int v14 = HIDWORD(v42);
          if (HIDWORD(v42) == v42)
          {
            WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::TextManipulationToken>((uint64_t)&v41, (unint64_t)v46);
          }
          else
          {
            uint64_t v16 = v41;
            uint64_t v17 = v41 + 96 * HIDWORD(v42);
            *(WTF::StringImpl **)uint64_t v17 = v46[0];
            CFStringRef v18 = v46[1];
            v46[1] = 0;
            *(void *)(v17 + 8) = v18;
            std::__optional_move_base<WebCore::TextManipulationTokenInfo,false>::__optional_move_base[abi:sn180100](v17 + 16, (uint64_t)&v47);
            *(unsigned char *)(v16 + 96 * v14 + 88) = v50;
            ++HIDWORD(v42);
          }
          std::__optional_destruct_base<WebCore::TextManipulationTokenInfo,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v47, v15);
          long long v20 = v46[1];
          v46[1] = 0;
          if (v20)
          {
            if (*(_DWORD *)v20 == 2) {
              WTF::StringImpl::destroy(v20, v19);
            }
            else {
              *(_DWORD *)v20 -= 2;
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v9);
    }
    *(_OWORD *)uint64_t v46 = *(_OWORD *)v43;
    LOWORD(v47) = 0;
    *((void *)&v47 + 1) = v44;
    v48[0] = v41;
    uint64_t v21 = v42;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    v48[1] = v21;
    CFStringRef v22 = (_OWORD *)WTF::fastMalloc((WTF *)0x30);
    int v35 = 1;
    uint64_t v34 = v22;
    long long v23 = v47;
    *CFStringRef v22 = *(_OWORD *)v46;
    v22[1] = v23;
    WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)(v22 + 2), (uint64_t)v48);
    int v36 = 1;
    WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v48, v24);
    uint64_t v25 = (uint64_t)v32->_page.m_ptr;
    uint64_t v26 = _Block_copy(aBlock);
    CFStringRef v27 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(void *)CFStringRef v27 = &unk_1EE9C5570;
    *((void *)v27 + 1) = v26;
    v46[0] = v27;
    WebKit::WebPageProxy::completeTextManipulation(v25, (WTF *)&v34, (uint64_t *)v46);
    uint64_t v28 = v46[0];
    v46[0] = 0;
    if (v28) {
      (*(void (**)(WTF::StringImpl *))(*(void *)v28 + 8))(v28);
    }
    _Block_release(0);
    WTF::Vector<WebCore::TextManipulationItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v34, v29);
    WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v41, v30);
  }
  else
  {
    unint64_t v31 = (void (*)(id, void))*((void *)a4 + 2);
    v31(a4, 0);
  }
}

- (void)_completeTextManipulationForItems:(id)a3 completion:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (!m_ptr
    || *((unsigned char *)m_ptr + 1362)
    && ([MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"],
        !self->_page.m_ptr))
  {
    makeFailureSetForAllTextManipulationItems(v57, a3);
    long long v39 = v57[0];
    (*((void (**)(id, WTF::StringImpl *))a4 + 2))(a4, v57[0]);
    if (v39) {
      CFRelease(v39);
    }
    return;
  }
  uint64_t v55 = 0;
  uint64_t v56 = 0;
  unint64_t v8 = [a3 count];
  if (v8)
  {
    if (v8 >= 0x5555556)
    {
      __break(0xC471u);
      goto LABEL_43;
    }
    LODWORD(v56) = 48 * (int)v8 / 0x30u;
    uint64_t v55 = WTF::fastMalloc((WTF *)(48 * v8));
  }
  long long v40 = self;
  id v41 = a4;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v9 = [a3 countByEnumeratingWithState:&v51 objects:v63 count:16];
  id obj = a3;
  if (!v9) {
    goto LABEL_28;
  }
  uint64_t v43 = *(void *)v52;
  do
  {
    uint64_t v10 = 0;
    uint64_t v44 = v9;
    do
    {
      if (*(void *)v52 != v43) {
        objc_enumerationMutation(obj);
      }
      uint64_t v11 = *(void **)(*((void *)&v51 + 1) + 8 * v10);
      unint64_t v12 = objc_msgSend((id)objc_msgSend(v11, "tokens"), "count");
      unint64_t v13 = v12;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      if (v12)
      {
        if (v12 >= 0x2AAAAAB)
        {
          __break(0xC471u);
          JUMPOUT(0x198B8774CLL);
        }
        unsigned int v14 = 96 * v12;
        uint64_t v15 = WTF::fastMalloc((WTF *)(96 * v12));
        uint64_t v16 = 0;
        LODWORD(v50) = v14 / 0x60;
        uint64_t v49 = v15;
        while (1)
        {
          uint64_t v17 = objc_msgSend((id)objc_msgSend(v11, "tokens"), "objectAtIndexedSubscript:", v16);
          CFStringRef v18 = (WTF::StringImpl *)objc_msgSend((id)objc_msgSend(v17, "identifier"), "longLongValue");
          if (v18 == (WTF::StringImpl *)-1) {
            break;
          }
          v57[0] = v18;
          MEMORY[0x19972EAD0](&v57[1], [v17 content]);
          LOBYTE(v58) = 0;
          char v61 = 0;
          char v62 = 0;
          unsigned int v19 = HIDWORD(v50);
          uint64_t v20 = v49;
          uint64_t v21 = v49 + 96 * HIDWORD(v50);
          *(WTF::StringImpl **)uint64_t v21 = v57[0];
          CFStringRef v22 = v57[1];
          v57[1] = 0;
          *(void *)(v21 + 8) = v22;
          std::__optional_move_base<WebCore::TextManipulationTokenInfo,false>::__optional_move_base[abi:sn180100](v21 + 16, (uint64_t)&v58);
          *(unsigned char *)(v20 + 96 * v19 + 88) = v62;
          ++HIDWORD(v50);
          std::__optional_destruct_base<WebCore::TextManipulationTokenInfo,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)&v58, v23);
          uint64_t v25 = v57[1];
          v57[1] = 0;
          if (v25)
          {
            if (*(_DWORD *)v25 == 2) {
              WTF::StringImpl::destroy(v25, v24);
            }
            else {
              *(_DWORD *)v25 -= 2;
            }
          }
          if (v13 == ++v16) {
            goto LABEL_20;
          }
        }
        __break(0xC471u);
LABEL_43:
        JUMPOUT(0x198B8760CLL);
      }
LABEL_20:
      [v11 identifier];
      coreTextManipulationItemIdentifierFromString(v46);
      long long v45 = 0uLL;
      if (v48)
      {
        long long v45 = *(_OWORD *)v46;
        uint64_t v27 = v47;
      }
      else
      {
        uint64_t v27 = 0;
      }
      *(_OWORD *)long long v57 = v45;
      LOWORD(v58) = 0;
      *((void *)&v58 + 1) = v27;
      uint64_t v59 = v49;
      uint64_t v28 = v50;
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      uint64_t v60 = v28;
      if (HIDWORD(v56) == v56)
      {
        WTF::Vector<WebCore::TextManipulationItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::TextManipulationItem>((uint64_t)&v55, (unint64_t)v57);
      }
      else
      {
        uint64_t v29 = v55 + 48 * HIDWORD(v56);
        long long v30 = v58;
        *(_OWORD *)uint64_t v29 = *(_OWORD *)v57;
        *(_OWORD *)(v29 + 16) = v30;
        *(void *)(v29 + 32) = 0;
        *(void *)(v29 + 40) = 0;
        uint64_t v31 = v59;
        uint64_t v59 = 0;
        *(void *)(v29 + 32) = v31;
        LODWORD(v31) = v60;
        LODWORD(v60) = 0;
        *(_DWORD *)(v29 + 40) = v31;
        LODWORD(v31) = HIDWORD(v60);
        HIDWORD(v60) = 0;
        *(_DWORD *)(v29 + 44) = v31;
        ++HIDWORD(v56);
      }
      WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v59, v26);
      WTF::Vector<WebCore::TextManipulationToken,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v49, v32);
      ++v10;
    }
    while (v10 != v44);
    a3 = obj;
    uint64_t v9 = [obj countByEnumeratingWithState:&v51 objects:v63 count:16];
  }
  while (v9);
LABEL_28:
  if (a3)
  {
    CFRetain(a3);
    uint64_t v33 = v41;
    uint64_t v34 = v40->_page.m_ptr;
    CFRetain(a3);
  }
  else
  {
    uint64_t v34 = self->_page.m_ptr;
    uint64_t v33 = v41;
  }
  int v35 = _Block_copy(v33);
  int v36 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x18);
  *(void *)int v36 = &unk_1EE9C5598;
  *((void *)v36 + 1) = a3;
  *((void *)v36 + 2) = v35;
  v57[0] = v36;
  WebKit::WebPageProxy::completeTextManipulation((uint64_t)v34, (WTF *)&v55, (uint64_t *)v57);
  long long v37 = v57[0];
  v57[0] = 0;
  if (v37) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v37 + 8))(v37);
  }
  _Block_release(0);
  if (a3) {
    CFRelease(a3);
  }
  WTF::Vector<WebCore::TextManipulationItem,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v55, v38);
}

- (void)_startImageAnalysis:(id)a3 target:(id)a4
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((unsigned char *)m_ptr + 1362)
      || ([MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"],
          (m_ptr = self->_page.m_ptr) != 0))
    {
      uint64_t v8 = *((void *)m_ptr + 34);
      {
        WebKit::WebPreferencesKey::visualTranslationEnabledKey(void)::$_0::operator() const(void)::impl += 2;
        WebKit::WebPreferencesKey::visualTranslationEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::visualTranslationEnabledKey(void)::$_0::operator() const(void)::impl;
      }
      if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v8 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::visualTranslationEnabledKey(void)::key, (const WTF::StringImpl *)a3)&& WebKit::languageIdentifierSupportsLiveText((WebKit *)a3, v9))
      {
        uint64_t v10 = self->_page.m_ptr;
        MEMORY[0x19972EAD0](&v15, a3);
        MEMORY[0x19972EAD0](&v14, a4);
        WebKit::WebPageProxy::startVisualTranslation((uint64_t)v10, (const WTF::String *)&v15, (const WTF::String *)&v14);
        unint64_t v12 = v14;
        unsigned int v14 = 0;
        if (v12)
        {
          if (*(_DWORD *)v12 == 2) {
            WTF::StringImpl::destroy(v12, v11);
          }
          else {
            *(_DWORD *)v12 -= 2;
          }
        }
        unint64_t v13 = v15;
        uint64_t v15 = 0;
        if (v13)
        {
          if (*(_DWORD *)v13 == 2) {
            WTF::StringImpl::destroy(v13, v11);
          }
          else {
            *(_DWORD *)v13 -= 2;
          }
        }
      }
    }
  }
}

- (void)_dataTaskWithRequest:(id)a3 runAtForegroundPriority:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  MEMORY[0x199732A50](v13, a3);
  v15[0] = 0;
  char v17 = 0;
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C55C0;
  v9[1] = v8;
  unint64_t v12 = v9;
  WebKit::WebPageProxy::dataTaskWithRequest((uint64_t)m_ptr, (WebCore::ResourceRequestBase *)v13, (uint64_t)v15, v6, (uint64_t *)&v12);
  uint64_t v10 = (uint64_t)v12;
  unint64_t v12 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  _Block_release(0);
  if (v17 && v16 != -1) {
    ((void (*)(void **, unsigned char *))off_1EE9C4DC0[v16])(&v12, v15);
  }
  CFTypeRef v11 = cf;
  CFTypeRef cf = 0;
  if (v11) {
    CFRelease(v11);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v13);
}

- (void)_dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
}

- (void)_takeFindStringFromSelection:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v8 = 0;
  WebKit::WebPageProxy::executeEditCommand((WebKit::WebPageProxy *)m_ptr, &v9, &v8);
  uint64_t v5 = v8;
  uint64_t v8 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  BOOL v6 = v9;
  uint64_t v9 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

+ (NSString)_stringForFind
{
  {
    WebKit::globalStringForFind(void)::string = 0;
    return (NSString *)&stru_1EEA10550;
  }
  uint64_t v2 = (WTF::StringImpl *)WebKit::globalStringForFind(void)::string;
  if (!WebKit::globalStringForFind(void)::string) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)WebKit::globalStringForFind(void)::string += 2;
  uint64_t v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v2 == 2) {
    WTF::StringImpl::destroy(v2, v3);
  }
  else {
    *(_DWORD *)v2 -= 2;
  }
  return v4;
}

+ (void)_setStringForFind:(id)a3
{
  MEMORY[0x19972EAD0](&v5, a3);
  {
    WebKit::globalStringForFind(void)::string = 0;
  }
  WTF::String::operator=(&WebKit::globalStringForFind(void)::string, &v5);
  uint64_t v4 = v5;
  uint64_t v5 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2) {
      WTF::StringImpl::destroy(v4, v3);
    }
    else {
      *(_DWORD *)v4 -= 2;
    }
  }
}

- (WKBrowsingContextHandle)_handle
{
  uint64_t v2 = (void *)CFMakeCollectable([[WKBrowsingContextHandle alloc] _initWithPageProxy:self->_page.m_ptr]);

  return (WKBrowsingContextHandle *)v2;
}

- (unint64_t)_observedRenderingProgressEvents
{
  return self->_observedRenderingProgressEvents;
}

- (WKHistoryDelegatePrivate)_historyDelegate
{
  WebKit::NavigationState::historyDelegate((id *)self->_navigationState.__ptr_.__value_, &cf);
  uint64_t v2 = (void *)CFMakeCollectable(cf);

  return (WKHistoryDelegatePrivate *)v2;
}

- (void)_updateMediaPlaybackControlsManager
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (*((unsigned char *)m_ptr + 1362)) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    }
  }
}

- (BOOL)_isSuspended
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 32);
  return *(unsigned char *)(v2 + 389) && *(void *)(v2 + 224) == 0;
}

- (BOOL)_canTogglePictureInPicture
{
  return 0;
}

- (BOOL)_canToggleInWindow
{
  return 0;
}

- (BOOL)_canEnterFullscreen
{
  return WebKit::WebPageProxy::canEnterFullscreen((WebKit::WebPageProxy *)self->_page.m_ptr);
}

- (BOOL)_isPictureInPictureActive
{
  return 0;
}

- (BOOL)_isInWindowActive
{
  return 0;
}

- (void)_togglePictureInPicture
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (*((unsigned char *)m_ptr + 1362)) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    }
  }
}

- (void)_nowPlayingMediaTitleAndArtist:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  uint64_t v5 = (void (*)(id, void, void))*((void *)a3 + 2);

  v5(a3, 0, 0);
}

- (void)_toggleInWindow
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (*((unsigned char *)m_ptr + 1362)) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    }
  }
}

- (void)_enterInWindow
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (*((unsigned char *)m_ptr + 1362)) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    }
  }
}

- (void)_exitInWindow
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (*((unsigned char *)m_ptr + 1362)) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    }
  }
}

- (void)_enterFullscreen
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
    WebKit::WebPageProxy::enterFullscreen(m_ptr);
    int v3 = (const void *)*((void *)m_ptr + 1);
    CFRelease(v3);
  }
}

- (void)_pauseAllAnimationsWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
LABEL_4:
    uint64_t v5 = _Block_copy(a3);
    BOOL v6 = (void *)WTF::fastMalloc((WTF *)0x10);
    *BOOL v6 = &unk_1EE9C5C00;
    v6[1] = v5;
    CFTypeRef v11 = v6;
    WebKit::WebPageProxy::pauseAllAnimations((uint64_t)m_ptr, (uint64_t *)&v11);
    uint64_t v7 = (uint64_t)v11;
    CFTypeRef v11 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    _Block_release(0);
    return;
  }
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C55E8;
  CFTypeRef v11 = v9;
  WebKit::WebPageProxy::pauseAllAnimations((uint64_t)m_ptr, (uint64_t *)&v11);
  uint64_t v10 = (uint64_t)v11;
  CFTypeRef v11 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
}

- (void)_playAllAnimationsWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
LABEL_4:
    uint64_t v5 = _Block_copy(a3);
    BOOL v6 = (void *)WTF::fastMalloc((WTF *)0x10);
    *BOOL v6 = &unk_1EE9C5C00;
    v6[1] = v5;
    CFTypeRef v11 = v6;
    WebKit::WebPageProxy::playAllAnimations((uint64_t)m_ptr, (uint64_t *)&v11);
    uint64_t v7 = (uint64_t)v11;
    CFTypeRef v11 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    _Block_release(0);
    return;
  }
  uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v9 = &unk_1EE9C5610;
  CFTypeRef v11 = v9;
  WebKit::WebPageProxy::playAllAnimations((uint64_t)m_ptr, (uint64_t *)&v11);
  uint64_t v10 = (uint64_t)v11;
  CFTypeRef v11 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
}

- (BOOL)_allowsAnyAnimationToPlay
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  return *((unsigned char *)m_ptr + 1056);
}

- (BOOL)_allowAnimationControls
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  if (byte_1E93CF609 == 1)
  {
    int v3 = (unsigned int (*)(void))off_1E93CF620;
    if (off_1E93CF620) {
LABEL_6:
    }
      LOBYTE(v3) = v3() == 0;
  }
  else
  {
    if (byte_1E93CF60A == 1)
    {
      uint64_t v4 = (void *)qword_1E93CF628;
    }
    else
    {
      uint64_t v4 = dlopen("/usr/lib/libAccessibility.dylib", 2);
      qword_1E93CF628 = (uint64_t)v4;
      byte_1E93CF60A = 1;
    }
    int v3 = (unsigned int (*)(void))dlsym(v4, "_AXSReduceMotionAutoplayAnimatedImagesEnabled");
    off_1E93CF620 = v3;
    byte_1E93CF609 = 1;
    if (v3) {
      goto LABEL_6;
    }
  }
  return (char)v3;
}

- (void)_setStatisticsCrossSiteLoadWithLinkDecorationForTesting:(id)a3 withToHost:(id)a4 withWasFiltered:(BOOL)a5 withCompletionHandler:(id)a6
{
  uint64_t v6 = *((void *)self->_page.m_ptr + 190);
  if (v6)
  {
    MEMORY[0x19972EAD0](&v21, a3);
    MEMORY[0x19972E890](v22, &v21, 0);
    MEMORY[0x19972EAD0](&v19, a4);
    MEMORY[0x19972E890](v20, &v19, 0);
    uint64_t v10 = _Block_copy(a6);
    CFTypeRef v11 = (void *)WTF::fastMalloc((WTF *)0x10);
    *CFTypeRef v11 = &unk_1EE9C5C00;
    v11[1] = v10;
    uint64_t v18 = v11;
    WebKit::WebPageProxyTesting::setCrossSiteLoadWithLinkDecorationForTesting(v6, (const WTF::URL *)v22, (const WTF::URL *)v20, a5, (uint64_t *)&v18);
    uint64_t v12 = (uint64_t)v18;
    uint64_t v18 = 0;
    if (v12) {
      (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
    }
    _Block_release(0);
    unsigned int v14 = v20[0];
    v20[0] = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v13);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
    uint64_t v15 = v19;
    unsigned int v19 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v13);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    int v16 = v22[0];
    v22[0] = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v13);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    char v17 = v21;
    uint64_t v21 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v13);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
  }
}

- (unint64_t)_mediaMutedState
{
  unint64_t v2 = *(unsigned __int8 *)(*((void *)self->_page.m_ptr + 4) + 904);
  uint64_t v3 = v2 & 1;
  if ((v2 & 6) != 0) {
    uint64_t v3 = v2 & 1 | 2;
  }
  return v3 | (v2 >> 1) & 4;
}

- (void)_closeAllMediaPresentations
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self closeAllMediaPresentationsWithCompletionHandler:&__block_literal_global_1077];
}

- (void)_stopMediaCapture
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::stopMediaCapture((uint64_t)m_ptr, 4);
}

- (void)_stopAllMediaPlayback
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self pauseAllMediaPlaybackWithCompletionHandler:0];
}

- (void)_suspendAllMediaPlayback
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self setAllMediaPlaybackSuspended:1 completionHandler:0];
}

- (void)_resumeAllMediaPlayback
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self setAllMediaPlaybackSuspended:0 completionHandler:0];
}

- (void)_restoreAppHighlights:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  v14[0] = 0;
  v14[1] = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(a3);
        }
        convertAndAddHighlight((uint64_t)v14, *(void **)(*((void *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v6);
  }
  WebKit::WebPageProxy::restoreAppHighlightsAndScrollToIndex((uint64_t)self->_page.m_ptr, v14, 0);
  WTF::Vector<WTF::Ref<WebCore::SharedMemory,WTF::RawPtrTraits<WebCore::SharedMemory>,WTF::DefaultRefDerefTraits<WebCore::SharedMemory>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v14, v9);
}

- (void)_restoreAndScrollToAppHighlight:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  v7[0] = 0;
  v7[1] = 0;
  convertAndAddHighlight((uint64_t)v7, a3);
  WebKit::WebPageProxy::restoreAppHighlightsAndScrollToIndex((uint64_t)self->_page.m_ptr, v7, 0x100000000);
  WTF::Vector<WTF::Ref<WebCore::SharedMemory,WTF::RawPtrTraits<WebCore::SharedMemory>,WTF::DefaultRefDerefTraits<WebCore::SharedMemory>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v7, v6);
}

- (void)_addAppHighlight
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self _addAppHighlightInNewGroup:0 originatedInApp:1];
}

- (void)_addAppHighlightInNewGroup:(BOOL)a3 originatedInApp:(BOOL)a4
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::createAppHighlightInSelectedRange((IPC::Encoder *)m_ptr, a3, a4);
}

- (void)_requestTargetedElementInfo:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_page.m_ptr;
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C5638;
  v7[1] = v6;
  uint64_t v9 = v7;
  WebKit::WebPageProxy::requestTargetedElement((WebKit::WebPageProxy *)m_ptr, (API::TargetedElementRequest *)((char *)a3 + 8), (uint64_t *)&v9);
  uint64_t v8 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (NSURL)_mainFrameURL
{
  if (*((void *)self->_page.m_ptr + 41)) {
    return (NSURL *)WTF::URL::operator NSURL *();
  }
  else {
    return 0;
  }
}

- (void)_loadAlternateHTMLString:(id)a3 baseURL:(id)a4 forUnreachableURL:(id)a5
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  long long v10 = (const void *)[a3 dataUsingEncoding:4];
  if (v10)
  {
    long long v11 = self->_page.m_ptr;
    uint64_t v21 = v10;
  }
  else
  {
    long long v10 = (const void *)[MEMORY[0x1E4F1C9B8] data];
    long long v11 = self->_page.m_ptr;
    uint64_t v21 = v10;
    if (!v10) {
      goto LABEL_8;
    }
  }
  CFRetain(v10);
LABEL_8:
  WebCore::DataSegment::create();
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  uint64_t v20 = v19[0];
  MEMORY[0x19972E8A0](v19, a4);
  MEMORY[0x19972E8A0](v18, a5);
  WebKit::WebPageProxy::loadAlternateHTML((uint64_t)v11, &v22, &v20, (uint64_t)v19, (uint64_t)v18, 0);
  long long v13 = v18[0];
  v18[0] = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  unsigned int v14 = v19[0];
  v19[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v12);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  uint64_t v15 = v20;
  uint64_t v20 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v12);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  uint64_t v16 = (unsigned int *)v22;
  CFStringRef v22 = 0;
  if (v16) {
    WTF::ThreadSafeRefCounted<WebCore::DataSegment,(WTF::DestructionThread)0>::deref(v16, v12);
  }
  char v17 = v21;
  uint64_t v21 = 0;
  if (v17) {
    CFRelease(v17);
  }
}

- (id)_loadData:(id)a3 MIMEType:(id)a4 characterEncodingName:(id)a5 baseURL:(id)a6 userData:(id)a7
{
  uint64_t v34 = (WebCore::FragmentedSharedBuffer *)a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  WebCore::SharedBuffer::create<NSData *&>(&v34, (NSData *)a2, (uint64_t *)&v32);
  MEMORY[0x19972EAD0](&v31, a4);
  MEMORY[0x19972EAD0](&v30, a5);
  MEMORY[0x19972EAD0](&v29, [a6 absoluteString]);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    CFTypeRef cf = a7;
    if (a7) {
      CFRetain(a7);
    }
    API::Data::createWithoutCopying((id *)&cf, &v28);
    long long v13 = v28;
  }
  else
  {
    long long v13 = 0;
  }
  WebKit::WebPageProxy::loadData((uint64_t)m_ptr, &v32, &v31, &v30, &v29, v13, 0, &v33);
  uint64_t v14 = v33;
  if (v33)
  {
    uint64_t v15 = *(const void **)(v33 + 8);
    if (v15)
    {
      CFRetain(*(CFTypeRef *)(v33 + 8));
      uint64_t v16 = *(const void **)(v14 + 8);
    }
    else
    {
      uint64_t v16 = 0;
    }
    CFRelease(v16);
  }
  else
  {
    uint64_t v15 = 0;
  }
  CFTypeRef v18 = (id)CFMakeCollectable(v15);
  if (isKindOfClass)
  {
    unsigned int v19 = v28;
    uint64_t v28 = 0;
    if (v19) {
      CFRelease(*((CFTypeRef *)v19 + 1));
    }
    CFTypeRef v20 = cf;
    CFTypeRef cf = 0;
    if (v20) {
      CFRelease(v20);
    }
  }
  uint64_t v21 = v29;
  uint64_t v29 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v17);
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  CFStringRef v22 = v30;
  long long v30 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy(v22, v17);
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
  long long v23 = v31;
  uint64_t v31 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2) {
      WTF::StringImpl::destroy(v23, v17);
    }
    else {
      *(_DWORD *)v23 -= 2;
    }
  }
  uint64_t v24 = (unsigned int *)v32;
  uint64_t v32 = 0;
  if (v24) {
    WTF::ThreadSafeRefCounted<WebCore::FragmentedSharedBuffer,(WTF::DestructionThread)0>::deref(v24, v17);
  }
  return (id)v18;
}

- (id)_loadRequest:(id)a3 shouldOpenExternalURLs:(BOOL)a4
{
  BOOL v4 = a4;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  return [(WKWebView *)self _loadRequest:a3 shouldOpenExternalURLsPolicy:v4];
}

- (id)_loadRequest:(id)a3 shouldOpenExternalURLsPolicy:(int64_t)a4
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  if (a4 == 2) {
    char v7 = 1;
  }
  else {
    char v7 = 2 * (a4 == 1);
  }
  MEMORY[0x199732A50](v15, a3);
  WebKit::WebPageProxy::loadRequest((uint64_t)m_ptr, (WebCore::ResourceRequestBase *)v15, v7, 0, 0, &v17);
  uint64_t v8 = v17;
  if (v17)
  {
    uint64_t v9 = *(const void **)(v17 + 8);
    if (v9)
    {
      CFRetain(*(CFTypeRef *)(v17 + 8));
      long long v10 = *(const void **)(v8 + 8);
    }
    else
    {
      long long v10 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    uint64_t v9 = 0;
  }
  CFTypeRef v11 = (id)CFMakeCollectable(v9);
  CFTypeRef v12 = cf;
  CFTypeRef cf = 0;
  if (v12) {
    CFRelease(v12);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v15);
  return (id)v11;
}

- (void)_loadAndDecodeImage:(id)a3 constrainedToSize:(CGSize)a4 maximumBytesFromNetwork:(unint64_t)a5 completionHandler:(id)a6
{
  CGSize v34 = a4;
  if (a4.height == 0.0 && a4.width == 0.0)
  {
    int v10 = 0;
    uint64_t v11 = 0;
  }
  else
  {
    WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v32, &v34);
    int v10 = 1;
    uint64_t v11 = v32[0];
  }
  MEMORY[0x199732A50](v32, a3);
  uint64_t v12 = WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)v32);
  long long v13 = *(WTF::StringImpl **)v12;
  if (*(void *)v12) {
    *(_DWORD *)v13 += 2;
  }
  long long v14 = *(_OWORD *)(v12 + 24);
  long long v30 = *(_OWORD *)(v12 + 8);
  long long v31 = v14;
  m_ptr = self->_page.m_ptr;
  MEMORY[0x199732A50](v28, a3);
  id aBlock = _Block_copy(a6);
  if (v13) {
    *(_DWORD *)v13 += 2;
  }
  uint64_t v24 = v13;
  long long v25 = v30;
  long long v26 = v31;
  uint64_t v16 = (void *)WTF::fastMalloc((WTF *)0x38);
  *uint64_t v16 = &unk_1EE9C5660;
  v16[1] = aBlock;
  WTF::URL::URL((uint64_t)(v16 + 2), (uint64_t *)&v24);
  uint64_t v27 = v16;
  WebKit::WebPageProxy::loadAndDecodeImage((uint64_t)m_ptr, (WebCore::ResourceRequest *)v28, v11, v10, a5, (uint64_t *)&v27);
  uint64_t v18 = (uint64_t)v27;
  uint64_t v27 = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  unsigned int v19 = v24;
  uint64_t v24 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2) {
      WTF::StringImpl::destroy(v19, v17);
    }
    else {
      *(_DWORD *)v19 -= 2;
    }
  }
  _Block_release(0);
  CFTypeRef v20 = cf;
  CFTypeRef cf = 0;
  if (v20) {
    CFRelease(v20);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v28);
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v21);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  CFTypeRef v22 = v33;
  CFTypeRef v33 = 0;
  if (v22) {
    CFRelease(v22);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v32);
}

- (void)_loadServiceWorker:(id)a3 usingModules:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  if (*((unsigned char *)m_ptr + 1190))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView was already used to load a service worker"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19972E8A0](v16, a3);
  int v10 = _Block_copy(a5);
  uint64_t v11 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v11 = &unk_1EE9C5688;
  v11[1] = v10;
  uint64_t v15 = v11;
  WebKit::WebPageProxy::loadServiceWorker((uint64_t)m_ptr, (WTF::URL *)v16, v6, (uint64_t *)&v15);
  uint64_t v12 = (uint64_t)v15;
  uint64_t v15 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  _Block_release(0);
  long long v14 = v16[0];
  v16[0] = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v13);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
}

- (void)_loadServiceWorker:(id)a3 completionHandler:(id)a4
{
}

- (void)_grantAccessToAssetServices
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((unsigned char *)m_ptr + 1362)
      || ([MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"],
          (m_ptr = self->_page.m_ptr) != 0))
    {
      WebKit::WebPageProxy::grantAccessToAssetServices((WebKit::WebPageProxy *)m_ptr);
    }
  }
}

- (void)_revokeAccessToAssetServices
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((unsigned char *)m_ptr + 1362)
      || ([MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"],
          (m_ptr = self->_page.m_ptr) != 0))
    {
      uint64_t v3 = *((void *)m_ptr + 32);
      char v5 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebProcess::RevokeAccessToAssetServices>(v3, (uint64_t)&v5, 0, 0);
    }
  }
}

- (void)_disableURLSchemeCheckInDataDetectors
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((unsigned char *)m_ptr + 1362)
      || ([MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"],
          (m_ptr = self->_page.m_ptr) != 0))
    {
      uint64_t v3 = *((void *)m_ptr + 32);
      char v5 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebProcess::DisableURLSchemeCheckInDataDetectors>(v3, (uint64_t)&v5, 0, 0);
    }
  }
}

- (void)_switchFromStaticFontRegistryToUserFontRegistry
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (!*((unsigned char *)m_ptr + 1362)
      || ([MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"],
          (m_ptr = self->_page.m_ptr) != 0))
    {
      WebKit::WebPageProxy::switchFromStaticFontRegistryToUserFontRegistry((WebKit::WebPageProxy *)m_ptr);
    }
  }
}

- (void)_didLoadAppInitiatedRequest:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  char v5 = _Block_copy(a3);
  BOOL v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *BOOL v6 = &unk_1EE9C56B0;
  v6[1] = v5;
  uint64_t v9 = v6;
  WebKit::WebPageProxy::appPrivacyReportTestingData((uint64_t)m_ptr, (uint64_t *)&v9);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_didLoadNonAppInitiatedRequest:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  char v5 = _Block_copy(a3);
  BOOL v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *BOOL v6 = &unk_1EE9C56D8;
  v6[1] = v5;
  uint64_t v9 = v6;
  WebKit::WebPageProxy::appPrivacyReportTestingData((uint64_t)m_ptr, (uint64_t *)&v9);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_suspendPage:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    BOOL v4 = _Block_copy(a3);
    char v5 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v5 = &unk_1EE9C5700;
    v5[1] = v4;
    uint64_t v8 = v5;
    WebKit::WebPageProxy::suspend((uint64_t)m_ptr, (uint64_t *)&v8);
    uint64_t v6 = (uint64_t)v8;
    uint64_t v8 = 0;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    }
    _Block_release(0);
  }
  else
  {
    uint64_t v7 = (void (*)(id, void))*((void *)a3 + 2);
    v7(a3, 0);
  }
}

- (void)_resumePage:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    BOOL v4 = _Block_copy(a3);
    char v5 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v5 = &unk_1EE9C5728;
    v5[1] = v4;
    uint64_t v8 = v5;
    WebKit::WebPageProxy::resume((uint64_t)m_ptr, (uint64_t *)&v8);
    uint64_t v6 = (uint64_t)v8;
    uint64_t v8 = 0;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    }
    _Block_release(0);
  }
  else
  {
    uint64_t v7 = (void (*)(id, void))*((void *)a3 + 2);
    v7(a3, 0);
  }
}

- (NSArray)_certificateChain
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 41);
  if (!v2) {
    return 0;
  }
  WebCore::CertificateInfo::certificateChainFromSecTrust((uint64_t *)&arg, *(WebCore::CertificateInfo **)(v2 + 256), (__SecTrust *)a2);
  CGSize result = (NSArray *)arg;
  if (arg)
  {
    CFAutorelease(arg);
    return (NSArray *)arg;
  }
  return result;
}

- (NSString)_MIMEType
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 41);
  if (!v2) {
    return 0;
  }
  if (*(void *)(v2 + 224)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  return (NSString *)&stru_1EEA10550;
}

- (NSString)_userAgent
{
  if (*((void *)self->_page.m_ptr + 44)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (NSString)_applicationNameForUserAgent
{
  if (*((void *)self->_page.m_ptr + 45)) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)_setApplicationNameForUserAgent:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19972EAD0](&v12, a3);
  WebKit::WebPageProxy::setApplicationNameForUserAgent((WTF **)m_ptr, &v12, v6);
  uint64_t v8 = v12;
  uint64_t v12 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v7);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  uint64_t v9 = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v12, a3);
  WTF::String::operator=((uint64_t *)v9 + 46, &v12);
  uint64_t v11 = v12;
  uint64_t v12 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
}

- (BOOL)_userContentExtensionsEnabled
{
  return 1;
}

- (int)_provisionalWebProcessIdentifier
{
  int result = [(WKWebView *)self _isValid];
  if (result)
  {
    uint64_t v4 = *((void *)self->_page.m_ptr + 149);
    if (v4 && (uint64_t v5 = *(void *)(*(void *)(*(void *)(v4 + 40) + 16) + 136)) != 0) {
      return *(_DWORD *)(v5 + 108);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (int)_gpuProcessIdentifier
{
  int result = [(WKWebView *)self _isValid];
  if (result)
  {
    m_ptr = self->_page.m_ptr;
    return WebKit::WebPageProxy::gpuProcessID((WebKit::WebPageProxy *)m_ptr);
  }
  return result;
}

- (int)_modelProcessIdentifier
{
  return 0;
}

- (BOOL)_webProcessIsResponsive
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 32);
  return *(unsigned char *)(v2 + 104) && *(unsigned char *)(v2 + 496) != 0;
}

- (void)_killWebContentProcess
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  if ([(WKWebView *)self _isValid])
  {
    uint64_t v4 = *(void (**)(void))(**((void **)self->_page.m_ptr + 32) + 80);
    v4();
  }
}

- (id)_reloadWithoutContentBlockers
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::reload((uint64_t)m_ptr, 4, &v10);
  uint64_t v4 = v10;
  if (v10)
  {
    uint64_t v10 = 0;
    uint64_t v5 = *(const void **)(v4 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      uint64_t v6 = *(const void **)(v4 + 8);
    }
    else
    {
      uint64_t v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v5 = 0;
  }
  CFTypeRef v7 = (id)CFMakeCollectable(v5);
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (v8) {
    CFRelease(*(CFTypeRef *)(v8 + 8));
  }
  return (id)v7;
}

- (id)_reloadExpiredOnly
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  WebKit::WebPageProxy::reload((uint64_t)m_ptr, 1, &v10);
  uint64_t v4 = v10;
  if (v10)
  {
    uint64_t v10 = 0;
    uint64_t v5 = *(const void **)(v4 + 8);
    if (v5)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      uint64_t v6 = *(const void **)(v4 + 8);
    }
    else
    {
      uint64_t v6 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    uint64_t v5 = 0;
  }
  CFTypeRef v7 = (id)CFMakeCollectable(v5);
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (v8) {
    CFRelease(*(CFTypeRef *)(v8 + 8));
  }
  return (id)v7;
}

- (void)_killWebContentProcessAndResetState
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v4 = *((void *)m_ptr + 32);
  atomic_fetch_add((atomic_uint *volatile)(v4 + 16), 1u);
  WebKit::WebProcessProxy::requestTermination((unsigned int *)v4, 2);
  uint64_t v5 = *((void *)self->_page.m_ptr + 149);
  if (v5)
  {
    uint64_t v6 = *(unsigned int **)(*(void *)(v5 + 40) + 16);
    CFTypeRef v7 = v6 + 4;
    atomic_fetch_add((atomic_uint *volatile)v6 + 4, 1u);
    WebKit::WebProcessProxy::requestTermination(v6, 2);
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref(v7);
  }
  if (v4)
  {
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)(v4 + 16));
  }
}

- (void)_takePDFSnapshotWithConfiguration:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    if (a3) {
      goto LABEL_4;
    }
  }
  else if (a3)
  {
LABEL_4:
    uint64_t v8 = objc_alloc_init(WKPDFConfiguration);
    [a3 rect];
    -[WKPDFConfiguration setRect:](v8, "setRect:");
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:
  [(WKWebView *)self createPDFWithConfiguration:v8 completionHandler:a4];
  if (v8)
  {
    CFRelease(v8);
  }
}

- (void)_getPDFFirstPageSizeInFrame:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v8 = *((void *)a3 + 3);
  uint64_t v7 = *((void *)a3 + 4);
  uint64_t v9 = _Block_copy(a4);
  uint64_t v10 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v10 = &unk_1EE9C5750;
  v10[1] = v9;
  v15[0] = v8;
  v15[1] = v7;
  long long v13 = v10;
  long long v14 = v15;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetPDFFirstPageSize,WTF::CompletionHandler<void ()(WebCore::FloatSize)>>(*((void *)m_ptr + 32), &v14, (uint64_t *)&v13, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v11 = (uint64_t)v13;
  long long v13 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
}

- (NSData)_sessionStateData
{
  m_ptr = self->_page.m_ptr;
  uint64_t v12 = 0;
  WebKit::WebPageProxy::sessionState((uint64_t)m_ptr, &v12, (uint64_t)v13);
  WebKit::encodeLegacySessionState((WebKit *)v13, &v15);
  uint64_t v3 = v15;
  if (v15)
  {
    uint64_t v15 = 0;
    uint64_t v4 = (const void *)*((void *)v3 + 1);
    if (v4)
    {
      CFRetain(*((CFTypeRef *)v3 + 1));
      uint64_t v5 = (const void *)*((void *)v3 + 1);
    }
    else
    {
      uint64_t v5 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v7 = (id)CFMakeCollectable(v4);
  uint64_t v8 = v15;
  uint64_t v15 = 0;
  if (v8) {
    CFRelease(*((CFTypeRef *)v8 + 1));
  }
  uint64_t v9 = v14;
  long long v14 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v6);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v13, v6);
  uint64_t v10 = v12;
  uint64_t v12 = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  return v7;
}

- (_WKSessionState)_sessionState
{
  uint64_t v3 = [_WKSessionState alloc];
  m_ptr = self->_page.m_ptr;
  uint64_t v10 = 0;
  WebKit::WebPageProxy::sessionState((uint64_t)m_ptr, &v10, (uint64_t)v11);
  uint64_t v6 = (id)CFMakeCollectable([(_WKSessionState *)v3 _initWithSessionState:v11]);
  uint64_t v7 = v12;
  uint64_t v12 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v5);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v11, v5);
  uint64_t v8 = v10;
  uint64_t v10 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  return v6;
}

- (id)_sessionStateWithFilter:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C5778;
  v5[1] = a3;
  uint64_t v21 = v5;
  WebKit::WebPageProxy::sessionState((uint64_t)m_ptr, &v21, (uint64_t)v22);
  uint64_t v6 = v21;
  uint64_t v21 = 0;
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }
  uint64_t v7 = [_WKSessionState alloc];
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)v15, (uint64_t)v22);
  long long v16 = v23;
  uint64_t v8 = v24;
  if (v24) {
    *(_DWORD *)v24 += 2;
  }
  uint64_t v17 = v8;
  long long v18 = v25;
  long long v19 = v26;
  char v20 = v27;
  CFTypeRef v10 = (id)CFMakeCollectable([(_WKSessionState *)v7 _initWithSessionState:v15]);
  uint64_t v11 = v17;
  uint64_t v17 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v9);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v15, v9);
  long long v13 = v24;
  uint64_t v24 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2) {
      WTF::StringImpl::destroy(v13, v12);
    }
    else {
      *(_DWORD *)v13 -= 2;
    }
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v22, v12);
  return (id)v10;
}

- (void)_restoreFromSessionStateData:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  BYTE4(v20) = 0;
  long long v18 = 0;
  uint64_t v19 = 0;
  LOBYTE(v20) = 0;
  WTF::URL::URL((WTF::URL *)&v21);
  BOOL v24 = 1;
  if (a3)
  {
    uint64_t v6 = [a3 bytes];
    unint64_t v7 = [a3 length];
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
  }
  if (WebKit::decodeLegacySessionState(v6, v7, (uint64_t)&v18))
  {
    uint64_t v9 = self->_page.m_ptr;
    v16.backForwardListState.items.m_buffer = v18;
    uint64_t v10 = v19;
    long long v18 = 0;
    uint64_t v19 = 0;
    *(void *)&v16.backForwardListState.items.m_capacitdouble y = v10;
    *(_OWORD *)&v16.backForwardListState.currentIndex.var0.__null_state_ = v20;
    uint64_t v11 = (StringImpl *)v21;
    uint64_t v21 = 0;
    v16.provisionalURL.m_string.m_impl.m_ptr = v11;
    *(_OWORD *)((char *)&v16.provisionalURL + 8) = v22;
    *(_OWORD *)&v16.provisionalURL.m_hostEnd = v23;
    LODWORD(v22) = v22 & 0xFFFFFFFE;
    v16.isAppInitiated = v24;
    WebKit::WebPageProxy::restoreFromSessionState((WebKit::WebPageProxy *)v9, &v16, 1, &v17);
    uint64_t v13 = v17;
    uint64_t v17 = 0;
    if (v13) {
      CFRelease(*(CFTypeRef *)(v13 + 8));
    }
    long long v14 = v16.provisionalURL.m_string.m_impl.m_ptr;
    v16.provisionalURL.m_string.m_impl.m_ptr = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy((WTF::StringImpl *)v14, v12);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
    WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v16, v12);
  }
  uint64_t v15 = v21;
  uint64_t v21 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v8);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v18, v8);
}

- (id)_restoreSessionState:(id)a3 andNavigate:(BOOL)a4
{
  BOOL v4 = a4;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
    if (a3) {
      goto LABEL_4;
    }
LABEL_8:
    v19.backForwardListState.currentIndex.__engaged_ = 0;
    v19.renderTreeSize = 0;
    memset(&v19, 0, 17);
    WTF::URL::URL((WTF::URL *)&v19.provisionalURL);
    char v9 = 1;
    goto LABEL_9;
  }
  if (!a3) {
    goto LABEL_8;
  }
LABEL_4:
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t)&v19, (uint64_t)a3 + 8);
  *(_OWORD *)&v19.backForwardListState.currentIndex.var0.__null_state_ = *(_OWORD *)((char *)a3 + 24);
  unint64_t v7 = (StringImpl *)*((void *)a3 + 5);
  if (v7) {
    *(_DWORD *)v7 += 2;
  }
  v19.provisionalURL.m_string.m_impl.m_ptr = v7;
  long long v8 = *((_OWORD *)a3 + 4);
  *(_OWORD *)((char *)&v19.provisionalURL + 8) = *((_OWORD *)a3 + 3);
  *(_OWORD *)&v19.provisionalURL.m_hostEnd = v8;
  char v9 = *((unsigned char *)a3 + 80);
LABEL_9:
  v19.isAppInitiated = v9;
  WebKit::WebPageProxy::restoreFromSessionState((WebKit::WebPageProxy *)m_ptr, &v19, v4, &v20);
  uint64_t v11 = v20;
  if (v20)
  {
    uint64_t v20 = 0;
    uint64_t v12 = *(const void **)(v11 + 8);
    if (v12)
    {
      CFRetain(*(CFTypeRef *)(v11 + 8));
      uint64_t v13 = *(const void **)(v11 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    CFRelease(v13);
  }
  else
  {
    uint64_t v12 = 0;
  }
  CFTypeRef v15 = (id)CFMakeCollectable(v12);
  uint64_t v16 = v20;
  uint64_t v20 = 0;
  if (v16) {
    CFRelease(*(CFTypeRef *)(v16 + 8));
  }
  uint64_t v17 = v19.provisionalURL.m_string.m_impl.m_ptr;
  v19.provisionalURL.m_string.m_impl.m_ptr = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v17, v14);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  WTF::Vector<WebKit::BackForwardListItemState,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v19, v14);
  return (id)v15;
}

- (void)_close
{
}

- (BOOL)_tryClose
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  return WebKit::WebPageProxy::tryClose((WebKit::WebPageProxy *)m_ptr);
}

- (BOOL)_isClosed
{
  return *((unsigned char *)self->_page.m_ptr + 801);
}

- (id)_insertAttachmentWithFilename:(id)a3 contentType:(id)a4 data:(id)a5 options:(id)a6 completion:(id)a7
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"The WKWebView is suspended", a5, a6);
  }
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28CF0]) initRegularFileWithContents:a5];
  long long v14 = v13;
  if (a3) {
    [v13 setPreferredFilename:a3];
  }
  id v15 = [(WKWebView *)self _insertAttachmentWithFileWrapper:v14 contentType:a4 completion:a7];
  if (v14) {
    CFRelease(v14);
  }
  return v15;
}

- (id)_insertAttachmentWithFileWrapper:(id)a3 contentType:(id)a4 options:(id)a5 completion:(id)a6
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"The WKWebView is suspended", a5);
  }

  return [(WKWebView *)self _insertAttachmentWithFileWrapper:a3 contentType:a4 completion:a6];
}

- (id)_insertAttachmentWithFileWrapper:(id)a3 contentType:(id)a4 completion:(id)a5
{
  long long v8 = self;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    self = (WKWebView *)[MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  WTF::createVersion4UUIDString((uint64_t *)&v24, (WTF *)self);
  uint64_t v10 = (WebKit::WebPageProxy *)v8->_page.m_ptr;
  uint64_t v11 = (CFTypeRef *)API::Object::newObject(0x48uLL, 41);
  uint64_t v12 = API::Attachment::Attachment((API::Attachment *)v11, (const WTF::String *)&v24, v10);
  API::Attachment::setFileWrapperAndUpdateContentType(v12, (NSFileWrapper *)a3, (__CFString *)a4);
  uint64_t v13 = v8->_page.m_ptr;
  CFRetain(v11[1]);
  long long v23 = v11;
  long long v14 = _Block_copy(a5);
  id v15 = (void *)WTF::fastMalloc((WTF *)0x10);
  *id v15 = &unk_1EE9C57A0;
  v15[1] = v14;
  long long v22 = v15;
  WebKit::WebPageProxy::insertAttachment(v13, (API::Attachment **)&v23, (uint64_t *)&v22);
  uint64_t v16 = (uint64_t)v22;
  long long v22 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  _Block_release(0);
  uint64_t v17 = (API::Attachment *)v23;
  long long v23 = 0;
  if (v17) {
    CFRelease(*((CFTypeRef *)v17 + 1));
  }
  CFTypeRef v18 = v11[1];
  CFRelease(v18);
  uint64_t v20 = v24;
  BOOL v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2) {
      WTF::StringImpl::destroy(v20, v19);
    }
    else {
      *(_DWORD *)v20 -= 2;
    }
  }
  return (id)v18;
}

- (id)_attachmentForIdentifier:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19972EAD0](&v11, a3);
  WebKit::WebPageProxy::attachmentForIdentifier(m_ptr, &v11, v5, &v12);
  unint64_t v7 = v11;
  uint64_t v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  if (!v12) {
    return 0;
  }
  long long v8 = *(const void **)(v12 + 8);
  CFRelease(v8);
  return (id)v8;
}

- (void)_simulateDeviceOrientationChangeWithAlpha:(double)a3 beta:(double)a4 gamma:(double)a5
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  v10[0] = a3;
  v10[1] = a4;
  void v10[2] = a5;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SimulateDeviceOrientationChange>(*((void *)m_ptr + 32), v10, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (void)_launchInitialProcessIfNecessary
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::launchInitialProcessIfNecessary((WebKit::WebProcessProxy **)m_ptr);
}

- (void)_clearBackForwardCache
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  BOOL v4 = *(WebKit::WebBackForwardCache **)(API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*((void *)m_ptr + 6) + 24))
                                       + 760);
  uint64_t v5 = self->_page.m_ptr;

  WebKit::WebBackForwardCache::removeEntriesForPage(v4, (WebKit::WebPageProxy *)v5);
}

+ (BOOL)_handlesSafeBrowsing
{
  return 1;
}

+ (BOOL)_willUpgradeToHTTPS:(id)a3
{
  MEMORY[0x19972E8A0](v8, a3);
  char shouldBeMadeSecure = WebCore::ContentExtensions::ContentExtensionsBackend::shouldBeMadeSecure((WebCore::ContentExtensions::ContentExtensionsBackend *)v8, v3);
  uint64_t v6 = v8[0];
  v8[0] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v4);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  return shouldBeMadeSecure;
}

- (void)_showWarningViewWithTitle:(id)a3 warning:(id)a4 details:(id)a5 completionHandler:(id)a6
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  double v12[2] = __84__WKWebView_WKPrivate___showWarningViewWithTitle_warning_details_completionHandler___block_invoke;
  v12[3] = &unk_1E5812368;
  v12[4] = a6;
  [(WKWebView *)self _showWarningViewWithURL:0 title:a3 warning:a4 detailsWithLinks:a5 completionHandler:v12];
}

uint64_t __84__WKWebView_WKPrivate___showWarningViewWithTitle_warning_details_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showWarningViewWithURL:(id)a3 title:(id)a4 warning:(id)a5 details:(id)a6 completionHandler:(id)a7
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  _DWORD v13[2] = __88__WKWebView_WKPrivate___showWarningViewWithURL_title_warning_details_completionHandler___block_invoke;
  v13[3] = &unk_1E5812368;
  v13[4] = a7;
  [(WKWebView *)self _showWarningViewWithURL:0 title:a4 warning:a5 detailsWithLinks:a6 completionHandler:v13];
}

uint64_t __88__WKWebView_WKPrivate___showWarningViewWithURL_title_warning_details_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showWarningViewWithURL:(id)a3 title:(id)a4 warning:(id)a5 detailsWithLinks:(id)a6 completionHandler:(id)a7
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  MEMORY[0x19972E8A0](v28, a3);
  MEMORY[0x19972EAD0](&v27, a4);
  MEMORY[0x19972EAD0](&v26, a5);
  CFTypeRef cf = a6;
  if (a6) {
    CFRetain(a6);
  }
  uint64_t v23 = 0;
  int v24 = 0;
  long long v14 = (_DWORD *)WTF::fastMalloc((WTF *)0x60);
  WebKit::BrowsingWarning::BrowsingWarning((uint64_t)v14, (uint64_t *)v28, (uint64_t *)&v27, (uint64_t *)&v26, (uint64_t *)&cf, (uint64_t)&v23);
  if (v24 != -1) {
    ((void (*)(char *, uint64_t *))off_1EE9C4DD0[v24])(&v29, &v23);
  }
  if (cf) {
    CFRelease(cf);
  }
  uint64_t v16 = v26;
  long long v26 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2) {
      WTF::StringImpl::destroy(v16, v15);
    }
    else {
      *(_DWORD *)v16 -= 2;
    }
  }
  uint64_t v17 = v27;
  char v27 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2) {
      WTF::StringImpl::destroy(v17, v15);
    }
    else {
      *(_DWORD *)v17 -= 2;
    }
  }
  CFTypeRef v18 = v28[0];
  v28[0] = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy(v18, v15);
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  SessionState v19 = _Block_copy(a7);
  uint64_t v20 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(void *)uint64_t v20 = &unk_1EE9C57C8;
  *((void *)v20 + 1) = v19;
  v28[0] = v20;
  [(WKWebView *)self _showWarningView:v14 completionHandler:v28];
  uint64_t v21 = v28[0];
  v28[0] = 0;
  if (v21) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v21 + 8))(v21);
  }
  _Block_release(0);
  WTF::RefCounted<WebKit::BrowsingWarning>::deref(v14, v22);
}

- (void)_isJITEnabled:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v6 = &unk_1EE9C57F0;
  v6[1] = v5;
  uint64_t v10 = v6;
  WebKit::WebPageProxy::launchInitialProcessIfNecessary((WebKit::WebProcessProxy **)m_ptr);
  uint64_t v7 = *((void *)m_ptr + 32);
  char v11 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebProcess::IsJITEnabled,WTF::CompletionHandler<void ()(BOOL)>>(v7, (uint64_t)&v11, (uint64_t *)&v10, 0, 0, 1);
  uint64_t v8 = (uint64_t)v10;
  uint64_t v10 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (void)_evaluateJavaScriptWithoutUserGesture:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  [(WKWebView *)self _evaluateJavaScript:a3 asAsyncFunction:0 withSourceURL:0 withArguments:0 forceUserGesture:0 inFrame:0 inWorld:+[WKContentWorld pageWorld] completionHandler:a4];
}

- (void)_callAsyncJavaScript:(id)a3 arguments:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 completionHandler:(id)a7
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  [(WKWebView *)self _evaluateJavaScript:a3 asAsyncFunction:1 withSourceURL:0 withArguments:a4 forceUserGesture:1 inFrame:a5 inWorld:a6 completionHandler:a7];
}

- (BOOL)_allMediaPresentationsClosed
{
  m_ptr = self->_page.m_ptr;
  uint64_t v3 = (WebKit::VideoPresentationManagerProxy *)*((void *)m_ptr + 54);
  if (v3)
  {
    if (WebKit::VideoPresentationManagerProxy::hasMode(*((WebKit::VideoPresentationManagerProxy **)m_ptr + 54), 2)
      || WebKit::VideoPresentationManagerProxy::hasMode(v3, 1))
    {
      return 0;
    }
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v6 = *((void *)m_ptr + 51);
  if (v6) {
    return (*(uint64_t (**)(void, SEL))(**(void **)(v6 + 32) + 24))(*(void *)(v6 + 32), a2) ^ 1;
  }
  else {
    return 1;
  }
}

- (void)_evaluateJavaScript:(id)a3 inFrame:(id)a4 inContentWorld:(id)a5 completionHandler:(id)a6
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  [(WKWebView *)self _evaluateJavaScript:a3 asAsyncFunction:0 withSourceURL:0 withArguments:0 forceUserGesture:1 inFrame:a4 inWorld:a5 completionHandler:a6];
}

- (void)_evaluateJavaScript:(id)a3 withSourceURL:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 completionHandler:(id)a7
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  [(WKWebView *)self _evaluateJavaScript:a3 asAsyncFunction:0 withSourceURL:a4 withArguments:0 forceUserGesture:1 inFrame:a5 inWorld:a6 completionHandler:a7];
}

- (void)_evaluateJavaScript:(id)a3 withSourceURL:(id)a4 inFrame:(id)a5 inContentWorld:(id)a6 withUserGesture:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  [(WKWebView *)self _evaluateJavaScript:a3 asAsyncFunction:0 withSourceURL:a4 withArguments:0 forceUserGesture:v9 inFrame:a5 inWorld:a6 completionHandler:a8];
}

- (void)_updateWebpagePreferences:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  uint64_t v6 = [a3 _websiteDataStore];
  uint64_t v7 = (void *)MEMORY[0x1E4F1C3C8];
  if (v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Updating WKWebsiteDataStore is only supported during decidePolicyForNavigationAction."];
  }
  if ([a3 _userContentController]) {
    [MEMORY[0x1E4F1CA00] raise:*v7 format:@"Updating WKUserContentController is only supported during decidePolicyForNavigationAction."];
  }
  API::WebsitePolicies::data((API::WebsitePolicies *)((char *)a3 + 8), v9);
  WebKit::WebPageProxy::updateWebsitePolicies(self->_page.m_ptr, (uint64_t)v9);
  WebKit::WebsitePoliciesData::~WebsitePoliciesData((WebKit::WebsitePoliciesData *)v9, v8);
}

- (void)_notifyUserScripts
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  *((unsigned char *)m_ptr + 1334) = 1;
  char v4 = 0;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::NotifyUserScripts>(*((void *)m_ptr + 32), (uint64_t)&v4, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (BOOL)_deferrableUserScriptsNeedNotification
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  return *(unsigned char *)(*((void *)m_ptr + 6) + 369) && *((unsigned char *)m_ptr + 1334) == 0;
}

- (NSString)_remoteInspectionNameOverride
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 144);
  if (v2) {
    uint64_t v3 = (WTF::StringImpl **)(v2 + 48);
  }
  else {
    uint64_t v3 = (WTF::StringImpl **)MEMORY[0x1E4F30978];
  }
  char v4 = *v3;
  if (!*v3) {
    return (NSString *)&stru_1EEA10550;
  }
  *(_DWORD *)v4 += 2;
  uint64_t v6 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v4 == 2) {
    WTF::StringImpl::destroy(v4, v5);
  }
  else {
    *(_DWORD *)v4 -= 2;
  }
  return v6;
}

- (void)_setRemoteInspectionNameOverride:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  MEMORY[0x19972EAD0](&v8, a3);
  WebKit::WebPageProxy::setRemoteInspectionNameOverride((uint64_t)m_ptr, &v8);
  uint64_t v6 = v8;
  uint64_t v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (BOOL)_addsVisitedLinks
{
  return *((unsigned char *)self->_page.m_ptr + 897);
}

- (void)_setAddsVisitedLinks:(BOOL)a3
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  *((unsigned char *)m_ptr + 897) = a3;
}

- (BOOL)_networkRequestsInProgress
{
  return *(unsigned char *)(*((void *)self->_page.m_ptr + 4) + 1152);
}

- (void)_saveResources:(id)a3 suggestedFileName:(id)a4 completionHandler:(id)a5
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v9 = *((void *)m_ptr + 41);
  v20[0] = 0;
  v20[1] = 0;
  MEMORY[0x19972EAD0](&v19, [a3 path]);
  MEMORY[0x19972EAD0](&v18, a4);
  uint64_t v10 = _Block_copy(a5);
  char v11 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v11 = &unk_1EE9C5818;
  v11[1] = v10;
  uint64_t v17 = v11;
  WebKit::WebPageProxy::saveResources((uint64_t)m_ptr, v9, (uint64_t)v20, (_DWORD **)&v19, &v18, (uint64_t *)&v17);
  uint64_t v12 = (uint64_t)v17;
  uint64_t v17 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  _Block_release(0);
  long long v14 = v18;
  CFTypeRef v18 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2) {
      WTF::StringImpl::destroy(v14, v13);
    }
    else {
      *(_DWORD *)v14 -= 2;
    }
  }
  id v15 = v19;
  SessionState v19 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2) {
      WTF::StringImpl::destroy(v15, v13);
    }
    else {
      *(_DWORD *)v15 -= 2;
    }
  }
  WTF::Vector<WebCore::MarkupExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v20, v13);
}

- (void)_archiveWithConfiguration:(id)a3 completionHandler:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((unsigned char *)m_ptr + 1362))
  {
    if (a3) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  if (!a3) {
LABEL_4:
  }
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Configuration cannot be nil"];
LABEL_5:
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v43 = a3;
  uint64_t v6 = (void *)[a3 exclusionRules];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v50 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        if ([v10 elementLocalName]
          || [v10 attributeLocalNames]
          && objc_msgSend((id)objc_msgSend(v10, "attributeLocalNames"), "count"))
        {
          unsigned int v11 = 0;
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          while (objc_msgSend((id)objc_msgSend(v10, "attributeLocalNames"), "count") > (unint64_t)v11)
          {
            uint64_t v12 = (WTF::AtomStringImpl *)objc_msgSend((id)objc_msgSend(v10, "attributeLocalNames"), "objectAtIndex:", v11);
            uint64_t v13 = objc_msgSend((id)objc_msgSend(v10, "attributeValues"), "objectAtIndex:", v11);
            if (v12)
            {
              long long v14 = (WTF::AtomStringImpl *)v13;
              if (![(WTF::AtomStringImpl *)v12 length])
              {
                WTF::AtomStringImpl::add((uint64_t *)&v55, v12, v15);
                uint64_t v44 = v55;
                WTF::AtomStringImpl::add((uint64_t *)&v55, v14, v16);
                long long v45 = v55;
                if (HIDWORD(v48) == v48)
                {
                  WTF::Vector<std::pair<WTF::String,WTF::RefPtr<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,std::pair<WTF::String,WTF::RefPtr<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>>>((uint64_t)&v47, (unint64_t)&v44);
                }
                else
                {
                  int v18 = HIDWORD(v48) + 1;
                  SessionState v19 = (WTF::StringImpl **)((char *)v47 + 16 * HIDWORD(v48));
                  uint64_t v20 = v44;
                  uint64_t v44 = 0;
                  WTF::StringImpl *v19 = v20;
                  uint64_t v21 = v45;
                  long long v45 = 0;
                  v19[1] = v21;
                  HIDWORD(v48) = v18;
                }
                long long v22 = v45;
                long long v45 = 0;
                if (v22)
                {
                  if (*(_DWORD *)v22 == 2) {
                    WTF::StringImpl::destroy(v22, v17);
                  }
                  else {
                    *(_DWORD *)v22 -= 2;
                  }
                }
                uint64_t v23 = v44;
                uint64_t v44 = 0;
                if (v23)
                {
                  if (*(_DWORD *)v23 == 2) {
                    WTF::StringImpl::destroy(v23, v17);
                  }
                  else {
                    *(_DWORD *)v23 -= 2;
                  }
                }
              }
            }
            ++v11;
          }
          int v24 = (WTF::AtomStringImpl *)[v10 elementLocalName];
          WTF::AtomStringImpl::add((uint64_t *)&v55, v24, v25);
          char v27 = v55;
          uint64_t v44 = v55;
          long long v45 = v47;
          uint64_t v28 = v48;
          uint64_t v47 = 0;
          uint64_t v48 = 0;
          uint64_t v46 = v28;
          if (HIDWORD(v54) == v54)
          {
            WTF::Vector<WebCore::MarkupExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WebCore::MarkupExclusionRule>((uint64_t)&v53, (unint64_t)&v44);
          }
          else
          {
            uint64_t v29 = v53 + 24 * HIDWORD(v54);
            uint64_t v44 = 0;
            *(void *)(v29 + 8) = 0;
            *(void *)(v29 + 16) = 0;
            *(void *)uint64_t v29 = v27;
            long long v30 = v45;
            long long v45 = 0;
            *(void *)(v29 + 8) = v30;
            LODWORD(v30) = v46;
            LODWORD(v46) = 0;
            *(_DWORD *)(v29 + 16) = v30;
            LODWORD(v30) = HIDWORD(v46);
            HIDWORD(v46) = 0;
            *(_DWORD *)(v29 + 20) = v30;
            ++HIDWORD(v54);
          }
          WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v45, v26);
          uint64_t v32 = v44;
          uint64_t v44 = 0;
          if (v32)
          {
            if (*(_DWORD *)v32 == 2) {
              WTF::StringImpl::destroy(v32, v31);
            }
            else {
              *(_DWORD *)v32 -= 2;
            }
          }
          WTF::Vector<WebCore::HTTPHeaderField,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v47, v31);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v7);
  }
  CFTypeRef v33 = self->_page.m_ptr;
  uint64_t v34 = *((void *)v33 + 41);
  MEMORY[0x19972EAD0](&v44, objc_msgSend((id)objc_msgSend(v43, "directory"), "path"));
  MEMORY[0x19972EAD0](&v47, [v43 suggestedFileName]);
  int v35 = _Block_copy(a4);
  int v36 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
  *(void *)int v36 = &unk_1EE9C5840;
  *((void *)v36 + 1) = v35;
  uint64_t v55 = v36;
  WebKit::WebPageProxy::saveResources((uint64_t)v33, v34, (uint64_t)&v53, (_DWORD **)&v44, &v47, (uint64_t *)&v55);
  long long v37 = v55;
  uint64_t v55 = 0;
  if (v37) {
    (*(void (**)(WTF::StringImpl *))(*(void *)v37 + 8))(v37);
  }
  _Block_release(0);
  long long v39 = v47;
  uint64_t v47 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 2) {
      WTF::StringImpl::destroy(v39, v38);
    }
    else {
      *(_DWORD *)v39 -= 2;
    }
  }
  long long v40 = v44;
  uint64_t v44 = 0;
  if (v40)
  {
    if (*(_DWORD *)v40 == 2) {
      WTF::StringImpl::destroy(v40, v38);
    }
    else {
      *(_DWORD *)v40 -= 2;
    }
  }
  WTF::Vector<WebCore::MarkupExclusionRule,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)&v53, v38);
}

- (void)_getMainResourceDataWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = *((void *)m_ptr + 41);
  uint64_t v6 = _Block_copy(a3);
  uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C5868;
  v7[1] = v6;
  uint64_t v10 = v7;
  WebKit::WebPageProxy::getMainResourceDataOfFrame((uint64_t)m_ptr, v5, (uint64_t *)&v10);
  uint64_t v8 = (uint64_t)v10;
  uint64_t v10 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
}

- (void)_getWebArchiveDataWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self createWebArchiveDataWithCompletionHandler:a3];
}

- (void)_getContentsAsStringWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v6 = &unk_1EE9C5890;
  v6[1] = v5;
  uint64_t v9 = v6;
  char v10 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((void *)m_ptr + 32), &v10, (uint64_t *)&v9, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_getContentsAsStringWithCompletionHandlerKeepIPCConnectionAliveForTesting:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  aBlock[0] = _Block_copy(a3);
  WebKit::AuxiliaryProcessProxy::protectedConnection(*((WebKit::AuxiliaryProcessProxy **)self->_page.m_ptr + 32), (atomic_uchar *volatile **)&aBlock[1]);
  uint64_t v6 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v6 = &unk_1EE9C58B8;
  long long v7 = *(_OWORD *)aBlock;
  aBlock[1] = 0;
  *(_OWORD *)(v6 + 8) = v7;
  uint64_t v11 = v6;
  char v12 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((void *)m_ptr + 32), &v12, &v11, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v8 = v11;
  uint64_t v11 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  uint64_t v9 = (atomic_uchar **)aBlock[1];
  aBlock[1] = 0;
  if (v9) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<IPC::Connection,(WTF::DestructionThread)2>(*v9);
  }
  _Block_release(0);
}

- (void)_getContentsOfAllFramesAsStringWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v6 = &unk_1EE9C58E0;
  v6[1] = v5;
  uint64_t v9 = v6;
  char v10 = 1;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetContentsAsString,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((void *)m_ptr + 32), &v10, (uint64_t *)&v9, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_getContentsAsAttributedStringWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v6 = &unk_1EE9C5908;
  v6[1] = v5;
  uint64_t v9 = v6;
  WebKit::WebPageProxy::getContentsAsAttributedString((uint64_t)m_ptr, (uint64_t *)&v9);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_getApplicationManifestWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v6 = &unk_1EE9C5930;
  v6[1] = v5;
  uint64_t v9 = v6;
  char v10 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetApplicationManifest,WTF::CompletionHandler<void ()(std::optional<WebCore::ApplicationManifest> const&)>>(*((void *)m_ptr + 32), (uint64_t)&v10, (uint64_t *)&v9, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_getTextFragmentMatchWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v6 = &unk_1EE9C5958;
  v6[1] = v5;
  uint64_t v9 = v6;
  char v10 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetTextFragmentMatch,WTF::CompletionHandler<void ()(WTF::String const&)>>(*((void *)m_ptr + 32), (uint64_t)&v10, (uint64_t *)&v9, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (int64_t)_paginationMode
{
  if (((*((unsigned char *)self->_page.m_ptr + 781) - 1) & 0xFC) != 0) {
    return 0;
  }
  else {
    return (*((unsigned char *)self->_page.m_ptr + 781) - 1) + 1;
  }
}

- (void)_setPaginationMode:(int64_t)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  if ((unint64_t)a3 <= 4)
  {
    uint64_t v6 = self->_page.m_ptr;
    WebKit::WebPageProxy::setPaginationMode((uint64_t)v6, a3);
  }
}

- (BOOL)_paginationBehavesLikeColumns
{
  return *((unsigned char *)self->_page.m_ptr + 782);
}

- (void)_setPaginationBehavesLikeColumns:(BOOL)a3
{
  BOOL v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setPaginationBehavesLikeColumns((uint64_t)m_ptr, v3);
}

- (double)_pageLength
{
  return *((double *)self->_page.m_ptr + 98);
}

- (void)_setPageLength:(double)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setPageLength((uint64_t)m_ptr, a3);
}

- (double)_gapBetweenPages
{
  return *((double *)self->_page.m_ptr + 99);
}

- (void)_setGapBetweenPages:(double)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setGapBetweenPages((uint64_t)m_ptr, a3);
}

- (BOOL)_paginationLineGridEnabled
{
  return 0;
}

- (unint64_t)_pageCount
{
  return *((unsigned int *)self->_page.m_ptr + 233);
}

- (BOOL)_supportsTextZoom
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 41);
  if (v2) {
    return WebCore::Image::supportsType((WebCore::Image *)(v2 + 224), (const WTF::String *)a2) ^ 1;
  }
  else {
    return 0;
  }
}

- (double)_textZoomFactor
{
  return *((double *)self->_page.m_ptr + 87);
}

- (void)_setTextZoomFactor:(double)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setTextZoomFactor((uint64_t)m_ptr, a3);
}

- (void)_setPageZoomFactor:(double)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self setPageZoom:a3];
}

- (_WKDiagnosticLoggingDelegate)_diagnosticLoggingDelegate
{
  int result = (_WKDiagnosticLoggingDelegate *)*((void *)self->_page.m_ptr + 16);
  if (result)
  {
    WebKit::DiagnosticLoggingClient::delegate((id *)result, &cf);
    BOOL v3 = (void *)CFMakeCollectable(cf);
    return (_WKDiagnosticLoggingDelegate *)v3;
  }
  return result;
}

- (_WKFindDelegate)_findDelegate
{
  WebKit::DiagnosticLoggingClient::delegate(*((id **)self->_page.m_ptr + 14), &cf);
  uint64_t v2 = (void *)CFMakeCollectable(cf);

  return (_WKFindDelegate *)v2;
}

- (void)_setFindDelegate:(id)a3
{
}

- (void)_countStringMatches:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  char v10 = self->_customContentView.m_ptr;
  if (v10)
  {
    objc_msgSend(v10, "web_countStringMatches:options:maxCount:", a3, a4, a5);
  }
  else
  {
    uint64_t v11 = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v14, a3);
    WebKit::WebPageProxy::countStringMatches((IPC::Encoder *)v11, &v14, a4 | (((a4 >> 8) & 1) << 9) | (a4 >> 1) & 0x100, a5);
    uint64_t v13 = v14;
    long long v14 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2) {
        WTF::StringImpl::destroy(v13, v12);
      }
      else {
        *(_DWORD *)v13 -= 2;
      }
    }
  }
}

- (void)_findString:(id)a3 options:(unint64_t)a4 maxCount:(unint64_t)a5
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  MEMORY[0x19972EAD0](&v16, a3);
  {
    WebKit::globalStringForFind(void)::string = 0;
  }
  WTF::String::operator=(&WebKit::globalStringForFind(void)::string, &v16);
  uint64_t v11 = v16;
  CFStringRef v16 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2) {
      WTF::StringImpl::destroy(v11, v10);
    }
    else {
      *(_DWORD *)v11 -= 2;
    }
  }
  char v12 = self->_customContentView.m_ptr;
  if (v12)
  {
    objc_msgSend(v12, "web_findString:options:maxCount:", a3, a4, a5);
  }
  else
  {
    uint64_t v13 = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v16, a3);
    WebKit::WebPageProxy::findString((uint64_t)v13, &v16, a4 | (((a4 >> 8) & 1) << 9) | (a4 >> 1) & 0x100, a5);
    CFStringRef v15 = v16;
    CFStringRef v16 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v14);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
  }
}

- (void)_hideFindUI
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  char v4 = self->_customContentView.m_ptr;
  if (v4)
  {
    objc_msgSend(v4, "web_hideFindUI");
  }
  else
  {
    uint64_t v5 = self->_page.m_ptr;
    char v6 = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::HideFindUI>(*((void *)v5 + 32), (uint64_t)&v6, *(void *)(*((void *)v5 + 4) + 1928), 0);
  }
}

- (void)_saveBackForwardSnapshotForItem:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    if (!a3) {
      return;
    }
  }
  else if (!a3)
  {
    return;
  }
  char v6 = self->_page.m_ptr;
  uint64_t v7 = (WTF::StringImpl **)[a3 _item];
  if (*((unsigned char *)v6 + 927))
  {
    {
      byte_1EB35A7F0 = 0;
      WebKit::ViewSnapshotStore::singleton(void)::store = 0u;
      *(_OWORD *)&qword_1EB35A7E0 = 0u;
    }
    WebKit::ViewSnapshotStore::recordSnapshot((WebKit::ViewSnapshot *)&WebKit::ViewSnapshotStore::singleton(void)::store, (WebKit::WebPageProxy *)v6, v7);
  }
}

- (void)_serviceWorkersEnabled:(id)a3
{
  uint64_t v4 = [self->_configuration.m_ptr preferences];
  {
    WebKit::WebPreferencesKey::serviceWorkersEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::serviceWorkersEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::serviceWorkersEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  BoolValueForKedouble y = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v4 + 48), (WTF::StringImpl **)&WebKit::WebPreferencesKey::serviceWorkersEnabledKey(void)::key, v5);
  uint64_t v7 = (void (*)(id, uint64_t))*((void *)a3 + 2);

  v7(a3, BoolValueForKey);
}

- (void)_clearServiceWorkerEntitlementOverride:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = _Block_copy(a3);
  char v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *char v6 = &unk_1EE9C5980;
  v6[1] = v5;
  uint64_t v9 = v6;
  WebKit::WebPageProxy::clearServiceWorkerEntitlementOverride((uint64_t)m_ptr, (uint64_t *)&v9);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_preconnectToServer:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  MEMORY[0x19972E8A0](v11, a3);
  WebCore::ResourceRequestBase::ResourceRequestBase((uint64_t)v12, (const String *)v11, 0);
  CFTypeRef cf = 0;
  uint64_t v7 = v11[0];
  v11[0] = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v6);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  uint64_t v8 = (WTF::StringImpl *)*((void *)self->_page.m_ptr + 44);
  if (v8)
  {
    int v9 = *(_DWORD *)v8;
    *(_DWORD *)v8 += 2;
    v11[0] = v8;
    if (*((_DWORD *)v8 + 1))
    {
      WebCore::ResourceRequestBase::setHTTPUserAgent((WebCore::ResourceRequestBase *)v12, (const WTF::String *)v11);
      uint64_t v8 = v11[0];
      v11[0] = 0;
      if (!v8) {
        goto LABEL_15;
      }
      int v9 = *(_DWORD *)v8 - 2;
      if (*(_DWORD *)v8 != 2) {
        goto LABEL_12;
      }
    }
    else
    {
      v11[0] = 0;
      if (v9)
      {
LABEL_12:
        *(_DWORD *)uint64_t v8 = v9;
        goto LABEL_15;
      }
    }
    WTF::StringImpl::destroy(v8, v6);
  }
LABEL_15:
  WebKit::WebPageProxy::preconnectTo((uint64_t)self->_page.m_ptr, (WebCore::ResourceRequestBase *)v12);
  CFTypeRef v10 = cf;
  CFTypeRef cf = 0;
  if (v10) {
    CFRelease(v10);
  }
  WebCore::ResourceRequestBase::~ResourceRequestBase((WebCore::ResourceRequestBase *)v12);
}

- (BOOL)_canUseCredentialStorage
{
  return *((unsigned char *)self->_page.m_ptr + 1336);
}

- (void)_setCanUseCredentialStorage:(BOOL)a3
{
  m_ptr = self->_page.m_ptr;
  if (*((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  *((unsigned char *)m_ptr + 1336) = a3;
  BOOL v6 = a3;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetCanUseCredentialStorage>(*((void *)m_ptr + 32), (char *)&v6, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
}

- (UIColor)_pageExtendedBackgroundColor
{
  WebCore::Color::Color((WebCore::Color *)&v9, (const Color *)(*((void *)self->_page.m_ptr + 4) + 944));
  WebCore::cocoaColorOrNil((uint64_t *)&cf, (WebCore *)&v9, v2);
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  uint64_t v5 = (id)CFMakeCollectable(v3);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  if ((v9 & 0x8000000000000) != 0)
  {
    uint64_t v8 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v8);
      WTF::fastFree((WTF *)v8, v4);
    }
  }
  return v5;
}

- (UIColor)_sampledPageTopColor
{
  WebCore::Color::Color((WebCore::Color *)&v9, (const Color *)(*((void *)self->_page.m_ptr + 4) + 1752));
  WebCore::cocoaColorOrNil((uint64_t *)&cf, (WebCore *)&v9, v2);
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  uint64_t v5 = (id)CFMakeCollectable(v3);
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  if ((v9 & 0x8000000000000) != 0)
  {
    uint64_t v8 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFLL);
    if (atomic_fetch_add((atomic_uint *volatile)(v9 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
    {
      atomic_store(1u, v8);
      WTF::fastFree((WTF *)v8, v4);
    }
  }
  return v5;
}

- (_WKInputDelegate)_inputDelegate
{
  return (_WKInputDelegate *)objc_loadWeak(&self->_inputDelegate.m_weakReference);
}

- (BOOL)_isDisplayingPDF
{
  WebCore::MIMETypeRegistry::pdfMIMETypes((uint64_t *)&v15, (WebCore::MIMETypeRegistry *)self);
  uint64_t v4 = v15;
  if (v15) {
    uint64_t v5 = (char *)v15 + 8;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v15) {
    CFTypeRef v6 = (char *)v15 + 16 * *(unsigned int *)v15 + 8;
  }
  else {
    CFTypeRef v6 = 0;
  }
  if (v5 == v6)
  {
    char isKindOfClass = 0;
  }
  else
  {
    uint64_t v7 = v5 + 16;
    do
    {
      uint64_t v8 = [(WKWebView *)self _contentProviderRegistry];
      MEMORY[0x19972EAD0](&v14, [NSString stringWithUTF8String:*((void *)v7 - 2)]);
      [(WKWebViewContentProviderRegistry *)v8 providerForMIMEType:&v14];
      CFTypeRef v10 = v14;
      long long v14 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v9);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
      char isKindOfClass = objc_opt_isKindOfClass();
      char v12 = isKindOfClass | (v7 == v6);
      v7 += 16;
    }
    while ((v12 & 1) == 0);
    uint64_t v4 = v15;
  }
  CFStringRef v15 = 0;
  if (v4) {
    WTF::fastFree(v4, v3);
  }
  return isKindOfClass & 1;
}

- (BOOL)_isDisplayingStandaloneImageDocument
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 41);
  if (v2) {
    return WebCore::Image::supportsType((WebCore::Image *)(v2 + 224), (const WTF::String *)a2);
  }
  else {
    return 0;
  }
}

- (BOOL)_isDisplayingStandaloneMediaDocument
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 41);
  if (v2) {
    return MEMORY[0x1F416E988](v2 + 224, a2);
  }
  else {
    return 0;
  }
}

- (BOOL)_isPlayingAudio
{
  return *(_DWORD *)(*((void *)self->_page.m_ptr + 4) + 824) & 1;
}

- (BOOL)_isShowingNavigationGestureSnapshot
{
  return *((unsigned char *)self->_page.m_ptr + 928);
}

- (unint64_t)_layoutMode
{
  return *((unsigned __int8 *)self->_page.m_ptr + 777);
}

- (void)_setLayoutMode:(unint64_t)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setUseFixedLayout((uint64_t)m_ptr, a3 - 1 < 2);
}

- (CGSize)_fixedLayoutSize
{
  WebCore::IntSize::operator CGSize();
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_setFixedLayoutSize:(CGSize)a3
{
  CGSize v12 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v10, &v12);
  float v4 = ceilf(v10[0]);
  uint64_t v5 = 0x7FFFFFFFLL;
  uint64_t v6 = 0x80000000;
  if (v4 > -2147500000.0) {
    uint64_t v6 = (int)v4;
  }
  if (v4 < 2147500000.0) {
    uint64_t v5 = v6;
  }
  float v7 = ceilf(v10[1]);
  if (v7 >= 2147500000.0)
  {
    unint64_t v8 = 0x7FFFFFFF00000000;
  }
  else if (v7 <= -2147500000.0)
  {
    unint64_t v8 = 0x8000000000000000;
  }
  else
  {
    unint64_t v8 = (unint64_t)(int)v7 << 32;
  }
  unint64_t v11 = v8 | v5;
  WebKit::WebPageProxy::setFixedLayoutSize((uint64_t)m_ptr, (const WebCore::IntSize *)&v11);
}

- (BOOL)_backgroundExtendsBeyondPage
{
  return *((unsigned char *)self->_page.m_ptr + 926);
}

- (double)_viewScale
{
  return *((double *)self->_page.m_ptr + 135);
}

- (void)_setViewScale:(double)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }
  double v6 = fabs(a3);
  if (a3 <= 0.0 || v6 == INFINITY) {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"View scale should be a positive number", v6);
  }
  unint64_t v8 = self->_page.m_ptr;
  if (*((double *)v8 + 135) != a3)
  {
    uint64_t v9 = *(void *)(*((void *)v8 + 4) + 2132);
    WebKit::WebPageProxy::setViewportConfigurationViewLayoutSize((uint64_t)v8, (const WebCore::FloatSize *)&v9, a3, *((double *)v8 + 136));
  }
}

- (void)_getProcessDisplayNameWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  uint64_t v5 = _Block_copy(a3);
  double v6 = (void *)WTF::fastMalloc((WTF *)0x10);
  *double v6 = &unk_1EE9C59A8;
  v6[1] = v5;
  uint64_t v9 = v6;
  char v10 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::GetProcessDisplayName,WTF::CompletionHandler<void ()(WTF::String &&)>>(*((void *)m_ptr + 32), (uint64_t)&v10, (uint64_t *)&v9, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v7 = (uint64_t)v9;
  uint64_t v9 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (double)_minimumEffectiveDeviceWidth
{
  return *((double *)self->_page.m_ptr + 136);
}

- (void)_setScrollPerformanceDataCollectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setScrollPerformanceDataCollectionEnabled((uint64_t)m_ptr, v3);
}

- (BOOL)_scrollPerformanceDataCollectionEnabled
{
  return *((unsigned char *)self->_page.m_ptr + 992);
}

- (NSArray)_scrollPerformanceData
{
  CGSize result = (NSArray *)*((void *)self->_page.m_ptr + 123);
  if (result) {
    return (NSArray *)WebKit::RemoteLayerTreeScrollingPerformanceData::data((WebKit::RemoteLayerTreeScrollingPerformanceData *)result);
  }
  return result;
}

- (BOOL)_allowsMediaDocumentInlinePlayback
{
  return *((unsigned char *)self->_page.m_ptr + 585);
}

- (void)_setAllowsMediaDocumentInlinePlayback:(BOOL)a3
{
  BOOL v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setAllowsMediaDocumentInlinePlayback((uint64_t)m_ptr, v3);
}

- (_WKFullscreenDelegate)_fullscreenDelegate
{
  double v2 = (id *)*((void *)self->_page.m_ptr + 52);
  if (!(*(unsigned int (**)(id *, uint64_t))*v2)(v2, 1)) {
    return 0;
  }
  WebKit::DiagnosticLoggingClient::delegate(v2, &cf);
  BOOL v3 = (void *)CFMakeCollectable(cf);

  return (_WKFullscreenDelegate *)v3;
}

- (unint64_t)_mediaCaptureState
{
  return ((unint64_t)*(unsigned int *)(*((void *)self->_page.m_ptr + 4) + 1704) >> 11) & 0xF;
}

- (void)_setMediaCaptureEnabled:(BOOL)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }

  WebKit::WebPageProxy::setMediaCaptureEnabled(m_ptr, a3);
}

- (BOOL)_mediaCaptureEnabled
{
  return *((unsigned char *)self->_page.m_ptr + 962);
}

- (void)_setPageMuted:(unint64_t)a3
{
  char v3 = a3;
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  if ((v3 & 2) != 0) {
    char v6 = v3 & 1 | 6;
  }
  else {
    char v6 = v3 & 1;
  }
  unsigned __int8 v7 = v6 & 0xF7 | (8 * ((v3 & 4) != 0));

  WebKit::WebPageProxy::setMuted((uint64_t)m_ptr, v7);
}

- (void)_removeDataDetectedLinks:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362))
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
    m_ptr = self->_page.m_ptr;
  }
  char v6 = _Block_copy(a3);
  unsigned __int8 v7 = self->_page.m_ptr;
  if (v7)
  {
    unint64_t v8 = (atomic_uint **)((char *)v7 + 24);
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)v7 + 6, (uint64_t)v7 + 16);
    uint64_t v9 = *v8;
    if (v9) {
      atomic_fetch_add(v9, 1u);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  char v10 = (void *)WTF::fastMalloc((WTF *)0x18);
  *char v10 = &unk_1EE9C59D0;
  v10[1] = v6;
  float v10[2] = v9;
  CGSize v12 = v10;
  WebKit::WebPageProxy::removeDataDetectedLinks((uint64_t)m_ptr, (uint64_t *)&v12);
  uint64_t v11 = (uint64_t)v12;
  CGSize v12 = 0;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
  }
  _Block_release(0);
}

- (void)_doAfterNextPresentationUpdate:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self _internalDoAfterNextPresentationUpdate:a3 withoutWaitingForPainting:0 withoutWaitingForAnimatedResize:0];
}

- (void)_doAfterNextPresentationUpdateWithoutWaitingForPainting:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((unsigned char *)m_ptr + 1362)) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  }

  [(WKWebView *)self _internalDoAfterNextPresentationUpdate:a3 withoutWaitingForPainting:1 withoutWaitingForAnimatedResize:0];
}

- (void)_doAfterNextVisibleContentRectUpdate:(id)a3
{
  p_visibleContentRectUpdateCallbacks = &self->_visibleContentRectUpdateCallbacks;
  uint64_t v5 = _Block_copy(a3);
  uint64_t v13 = v5;
  m_CGSize size = p_visibleContentRectUpdateCallbacks->m_size;
  if (m_size == p_visibleContentRectUpdateCallbacks->m_capacity)
  {
    unsigned __int8 v7 = (uint64_t *)WTF::Vector<WTF::BlockPtr<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)p_visibleContentRectUpdateCallbacks, m_size + 1, (unint64_t)&v13);
    uint64_t v8 = p_visibleContentRectUpdateCallbacks->m_size;
    m_CGSize size = (unint64_t)p_visibleContentRectUpdateCallbacks->m_buffer;
    uint64_t v9 = *v7;
    uint64_t *v7 = 0;
    *(void *)(m_size + 8 * v8) = v9;
    LODWORD(m_size) = p_visibleContentRectUpdateCallbacks->m_size;
    char v10 = v13;
  }
  else
  {
    uint64_t v11 = v5;
    char v10 = 0;
    m_buffer = p_visibleContentRectUpdateCallbacks->m_buffer;
    uint64_t v13 = 0;
    m_buffer[m_size] = v11;
  }
  p_visibleContentRectUpdateCallbacks->m_CGSize size = m_size + 1;
  _Block_release(v10);
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
}

- (unint64_t)_displayCaptureSurfaces
{
  int v2 = *(_DWORD *)(*((void *)self->_page.m_ptr + 4) + 1704);
  if ((v2 & 0xE00000) != 0) {
    return ((v2 & 0x1C0000) != 0) | 2;
  }
  else {
    return (v2 & 0x1C0000) != 0;
  }
}

- (int64_t)_displayCaptureState
{
  int v2 = *(_DWORD *)(*((void *)self->_page.m_ptr + 4) + 1704);
  if ((v2 & 0x240000) != 0) {
    return 1;
  }
  else {
    return 2 * ((v2 & 0x480000) != 0);
  }
}

- (int64_t)_systemAudioCaptureState
{
  unsigned int v2 = *(_DWORD *)(*((void *)self->_page.m_ptr + 4) + 1704);
  if ((v2 & 0x1000000) != 0) {
    return 1;
  }
  else {
    return HIBYTE(v2) & 2;
  }
}

- (void)_setDisplayCaptureState:(int64_t)a3 completionHandler:(id)a4
{
  float v4 = a4;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((unsigned char *)m_ptr + 1362))
  {
    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  if (!v4)
  {
LABEL_4:
    float v4 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3321888768;
    void v18[2] = __66__WKWebView_WKPrivate___setDisplayCaptureState_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_33_e8_32c80_ZTSKZ66__WKWebView_WKPrivate___setDisplayCaptureState_completionHandler__E4__80_e5_v8__0l;
  }
LABEL_5:
  uint64_t v8 = self->_page.m_ptr;
  if (a3)
  {
    unsigned __int8 v9 = *(unsigned char *)(*((void *)v8 + 4) + 904);
    unsigned __int8 v10 = v9 | 0x18;
    if (a3 == 1) {
      v9 &= 0xE7u;
    }
    if (a3 == 2) {
      unsigned __int8 v11 = v10;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    CGSize v12 = _Block_copy(v4);
    uint64_t v13 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v13 = &unk_1EE9C5A20;
    v13[1] = v12;
    uint64_t v17 = v13;
    WebKit::WebPageProxy::setMuted((uint64_t)v8, v11, (uint64_t *)&v17);
  }
  else
  {
    long long v14 = _Block_copy(v4);
    CFStringRef v15 = (void *)WTF::fastMalloc((WTF *)0x10);
    *CFStringRef v15 = &unk_1EE9C59F8;
    v15[1] = v14;
    uint64_t v17 = v15;
    WebKit::WebPageProxy::stopMediaCapture((uint64_t)v8, 2, (uint64_t *)&v17);
  }
  uint64_t v16 = (uint64_t)v17;
  uint64_t v17 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  _Block_release(0);
}

- (void)_setSystemAudioCaptureState:(int64_t)a3 completionHandler:(id)a4
{
  float v4 = a4;
  m_ptr = self->_page.m_ptr;
  if (!m_ptr || !*((unsigned char *)m_ptr + 1362))
  {
    if (a4) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"The WKWebView is suspended"];
  if (!v4)
  {
LABEL_4:
    float v4 = v18;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3321888768;
    void v18[2] = __70__WKWebView_WKPrivate___setSystemAudioCaptureState_completionHandler___block_invoke;
    v18[3] = &__block_descriptor_33_e8_32c84_ZTSKZ70__WKWebView_WKPrivate___setSystemAudioCaptureState_completionHandler__E4__83_e5_v8__0l;
  }
LABEL_5:
  uint64_t v8 = self->_page.m_ptr;
  if (a3)
  {
    unsigned __int8 v9 = *(unsigned char *)(*((void *)v8 + 4) + 904);
    unsigned __int8 v10 = v9 | 0x10;
    if (a3 == 1) {
      v9 &= ~0x10u;
    }
    if (a3 == 2) {
      unsigned __int8 v11 = v10;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    CGSize v12 = _Block_copy(v4);
    uint64_t v13 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v13 = &unk_1EE9C5A70;
    v13[1] = v12;
    uint64_t v17 = v13;
    WebKit::WebPageProxy::setMuted((uint64_t)v8, v11, (uint64_t *)&v17);
  }
  else
  {
    long long v14 = _Block_copy(v4);
    CFStringRef v15 = (void *)WTF::fastMalloc((WTF *)0x10);
    *CFStringRef v15 = &unk_1EE9C5A48;
    v15[1] = v14;
    uint64_t v17 = v15;
    WebKit::WebPageProxy::stopMediaCapture((uint64_t)v8, 3, (uint64_t *)&v17);
  }
  uint64_t v16 = (uint64_t)v17;
  uint64_t v17 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  _Block_release(0);
}

- (void)_setOverrideDeviceScaleFactor:(double)a3
{
  float v3 = a3;
  WebKit::WebPageProxy::setCustomDeviceScaleFactor((uint64_t)self->_page.m_ptr, v3);
}

- (double)_overrideDeviceScaleFactor
{
  m_ptr = self->_page.m_ptr;
  double result = *((float *)m_ptr + 191);
  if (!*((unsigned char *)m_ptr + 768)) {
    return 0.0;
  }
  return result;
}

+ (void)_permissionChanged:(id)a3 forOrigin:(id)a4
{
  MEMORY[0x19972EAD0](&v9, a3);
  unsigned __int16 v7 = WebCore::Permissions::toPermissionName((WebCore::Permissions *)&v9, v5);
  uint64_t v8 = v9;
  unsigned __int8 v9 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2) {
      WTF::StringImpl::destroy(v8, v6);
    }
    else {
      *(_DWORD *)v8 -= 2;
    }
  }
  if (v7 >= 0x100u) {
    WebKit::WebProcessProxy::permissionChanged(v7, (uint64_t)a4 + 24);
  }
}

- (NSURL)_requiredWebExtensionBaseURL
{
  return (NSURL *)[self->_configuration.m_ptr _requiredWebExtensionBaseURL];
}

- (void)_resetVisibilityAdjustmentsForTargetedElements:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_page.m_ptr;
  elementsFromWKElements((uint64_t)v11, a3);
  char v6 = _Block_copy(a4);
  unsigned __int16 v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C5A98;
  v7[1] = v6;
  unsigned __int8 v10 = v7;
  WebKit::WebPageProxy::resetVisibilityAdjustmentsForTargetedElements((IPC::Encoder *)m_ptr, (uint64_t)v11, (uint64_t *)&v10);
  uint64_t v8 = (uint64_t)v10;
  unsigned __int8 v10 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  _Block_release(0);
  WTF::Vector<WTF::Ref<WebKit::WebPageProxy,WTF::RawPtrTraits<WebKit::WebPageProxy>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v11, v9);
}

- (void)_adjustVisibilityForTargetedElements:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_page.m_ptr;
  elementsFromWKElements((uint64_t)v11, a3);
  char v6 = _Block_copy(a4);
  unsigned __int16 v7 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v7 = &unk_1EE9C5AC0;
  v7[1] = v6;
  unsigned __int8 v10 = v7;
  WebKit::WebPageProxy::adjustVisibilityForTargetedElements((uint64_t)m_ptr, (uint64_t)v11, &v10);
  uint64_t v8 = v10;
  unsigned __int8 v10 = 0;
  if (v8) {
    (*(void (**)(void *))(*v8 + 8))(v8);
  }
  _Block_release(0);
  WTF::Vector<WTF::Ref<WebKit::WebPageProxy,WTF::RawPtrTraits<WebKit::WebPageProxy>,WTF::DefaultRefDerefTraits<WebKit::WebPageProxy>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v11, v9);
}

- (void)_numberOfVisibilityAdjustmentRectsWithCompletionHandler:(id)a3
{
  m_ptr = self->_page.m_ptr;
  float v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C5AE8;
  v5[1] = v4;
  unsigned __int16 v7 = v5;
  WebKit::WebPageProxy::numberOfVisibilityAdjustmentRects((uint64_t)m_ptr, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  unsigned __int16 v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_playPredominantOrNowPlayingMediaSession:(id)a3
{
  if ([(WKWebView *)self _isValid])
  {
    m_ptr = self->_page.m_ptr;
    uint64_t v6 = _Block_copy(a3);
    unsigned __int16 v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9C5B10;
    v7[1] = v6;
    unsigned __int8 v10 = v7;
    WebKit::WebPageProxy::playPredominantOrNowPlayingMediaSession((uint64_t)m_ptr, (uint64_t *)&v10);
    uint64_t v8 = (uint64_t)v10;
    unsigned __int8 v10 = 0;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
    _Block_release(0);
  }
  else
  {
    unsigned __int8 v9 = (void (*)(id, void))*((void *)a3 + 2);
    v9(a3, 0);
  }
}

- (void)_pauseNowPlayingMediaSession:(id)a3
{
  if ([(WKWebView *)self _isValid])
  {
    m_ptr = (uint64_t **)self->_page.m_ptr;
    uint64_t v6 = _Block_copy(a3);
    unsigned __int16 v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9C5B38;
    v7[1] = v6;
    unsigned __int8 v10 = v7;
    WebKit::WebPageProxy::tryToSendCommandToActiveControlledVideo(m_ptr, 2);
    WTF::CompletionHandler<void ()(BOOL)>::operator()((uint64_t *)&v10);
    uint64_t v8 = (uint64_t)v10;
    unsigned __int8 v10 = 0;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
    _Block_release(0);
  }
  else
  {
    unsigned __int8 v9 = (void (*)(id, void))*((void *)a3 + 2);
    v9(a3, 0);
  }
}

- (void)_simulateClickOverFirstMatchingTextInViewportWithUserInteraction:(id)a3 completionHandler:(id)a4
{
  if (![a3 length]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The target text must be non-empty."];
  }
  if ([(WKWebView *)self _isValid])
  {
    m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v15, a3);
    uint64_t v8 = _Block_copy(a4);
    unsigned __int8 v9 = (void *)WTF::fastMalloc((WTF *)0x10);
    *unsigned __int8 v9 = &unk_1EE9C5B60;
    v9[1] = v8;
    long long v14 = v9;
    uint64_t v16 = &v15;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::SimulateClickOverFirstMatchingTextInViewportWithUserInteraction,WTF::CompletionHandler<void ()(BOOL)>>(*((void *)m_ptr + 32), (uint64_t **)&v16, (uint64_t *)&v14, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
    uint64_t v10 = (uint64_t)v14;
    long long v14 = 0;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
    _Block_release(0);
    CGSize v12 = v15;
    CFStringRef v15 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v11);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
  }
  else
  {
    uint64_t v13 = (void (*)(id, void))*((void *)a4 + 2);
    v13(a4, 0);
  }
}

- (BOOL)_dontResetTransientActivationAfterRunJavaScript
{
  return self->_dontResetTransientActivationAfterRunJavaScript;
}

- (void)_setDontResetTransientActivationAfterRunJavaScript:(BOOL)a3
{
  self->_dontResetTransientActivationAfterRunJavaScript = a3;
}

- (void)_targetedPreviewForElementWithID:(id)a3 completionHandler:(id)a4
{
  m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v14, a3);
  id aBlock = _Block_copy(a4);
  id v12 = 0;
  objc_initWeak(&v12, self);
  uint64_t v7 = WTF::fastMalloc((WTF *)0x18);
  *(void *)uint64_t v7 = &unk_1EE9C5B88;
  *(void *)(v7 + 8) = aBlock;
  *(void *)(v7 + 16) = 0;
  objc_moveWeak((id *)(v7 + 16), &v12);
  uint64_t v13 = v7;
  WebKit::WebPageProxy::createTextIndicatorForElementWithID((uint64_t)m_ptr, (uint64_t *)&v14, &v13);
  uint64_t v8 = v13;
  uint64_t v13 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  objc_destroyWeak(&v12);
  _Block_release(0);
  uint64_t v10 = v14;
  long long v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
}

- (id)_enableSourceTextAnimationAfterElementWithID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (WTF::UUID *)[MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = v5;
  if (v5) {
    CFRetain(v5);
  }
  WTF::UUID::fromNSUUID(&v18, v7, v6);
  if (!v19)
  {
    unsigned __int8 v11 = 0;
    if (!v7) {
      return v11;
    }
    goto LABEL_11;
  }
  m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](v14, a3);
  WebKit::WebPageProxy::enableSourceTextAnimationAfterElementWithID((uint64_t)m_ptr, (const WTF::String *)v14);
  uint64_t v10 = v14[0];
  v14[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  id v12 = self->_contentView.m_ptr;
  LOWORD(v14[0]) = 512;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  [v12 addTextAnimationForAnimationID:v7 withData:v14];
  unsigned __int8 v11 = v7;
  if (v7) {
LABEL_11:
  }
    CFRelease(v7);
  return v11;
}

- (id)_enableFinalTextAnimationForElementWithID:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (WTF::UUID *)[MEMORY[0x1E4F29128] UUID];
  uint64_t v7 = v5;
  if (v5) {
    CFRetain(v5);
  }
  WTF::UUID::fromNSUUID(&v18, v7, v6);
  if (!v19)
  {
    unsigned __int8 v11 = 0;
    if (!v7) {
      return v11;
    }
    goto LABEL_11;
  }
  m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](v14, a3);
  WebKit::WebPageProxy::enableTextAnimationTypeForElementWithID((uint64_t)m_ptr, (const WTF::String *)v14);
  uint64_t v10 = v14[0];
  v14[0] = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2) {
      WTF::StringImpl::destroy(v10, v9);
    }
    else {
      *(_DWORD *)v10 -= 2;
    }
  }
  id v12 = self->_contentView.m_ptr;
  LOWORD(v14[0]) = 514;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  [v12 addTextAnimationForAnimationID:v7 withData:v14];
  unsigned __int8 v11 = v7;
  if (v7) {
LABEL_11:
  }
    CFRelease(v7);
  return v11;
}

- (void)_disableTextAnimationWithUUID:(id)a3
{
}

- (NSArray)certificateChain
{
  WebCore::CertificateInfo::certificateChainFromSecTrust((uint64_t *)&arg, *(WebCore::CertificateInfo **)(*((void *)self->_page.m_ptr + 4) + 1160), (__SecTrust *)a2);
  if (arg)
  {
    CFAutorelease(arg);
    unsigned int v2 = (NSArray *)arg;
  }
  else
  {
    unsigned int v2 = 0;
  }
  if (v2) {
    return v2;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (void)_requestTextExtractionForSwift:(id)a3
{
  [a3 rectInWebView];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (a3) {
    CFRetain(a3);
  }
  uint64_t v13 = malloc_type_malloc(0x28uLL, 0x10E0040F37F48A8uLL);
  *uint64_t v13 = MEMORY[0x1E4F14398];
  v13[1] = 50331650;
  _DWORD v13[2] = WTF::BlockPtr<void ()(WKTextExtractionItem *)>::fromCallable<-[WKWebView(WKTextExtraction) _requestTextExtractionForSwift:]::$_93>(-[WKWebView(WKTextExtraction) _requestTextExtractionForSwift:]::$_93)::{lambda(void *,WKTextExtractionItem *)#1}::__invoke;
  v13[3] = &WTF::BlockPtr<void ()(WKTextExtractionItem *)>::fromCallable<-[WKWebView(WKTextExtraction) _requestTextExtractionForSwift:]::$_93>(-[WKWebView(WKTextExtraction) _requestTextExtractionForSwift:]::$_93)::descriptor;
  v13[4] = a3;
  -[WKWebView _requestTextExtraction:completionHandler:](self, "_requestTextExtraction:completionHandler:", v13, v6, v8, v10, v12);

  _Block_release(v13);
}

- (void)_requestTextExtraction:(CGRect)a3 completionHandler:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(WKWebView *)self _isValid]) {
    goto LABEL_7;
  }
  uint64_t v11 = *((void *)self->_page.m_ptr + 34);
  {
    WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v11 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::textExtractionEnabledKey(void)::key, v10))
  {
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    if (CGRectIsNull(v26))
    {
      char v12 = 0;
      v23[0] = 0;
    }
    else
    {
      -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, x, y, width, height);
      aBlock.origin.double x = v14;
      aBlock.origin.double y = v15;
      aBlock.size.double width = v16;
      aBlock.size.double height = v17;
      WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v23, &aBlock);
      char v12 = 1;
    }
    unsigned char v23[16] = v12;
    m_ptr = self->_page.m_ptr;
    *(void *)&aBlock.origin.double x = _Block_copy(a4);
    aBlock.origin.double y = 0.0;
    objc_initWeak((id *)&aBlock.origin.y, self);
    uint64_t v19 = WTF::fastMalloc((WTF *)0x18);
    *(void *)uint64_t v19 = &unk_1EE9C5BB0;
    CGFloat v20 = aBlock.origin.x;
    aBlock.origin.double x = 0.0;
    *(CGFloat *)(v19 + 8) = v20;
    *(void *)(v19 + 16) = 0;
    objc_moveWeak((id *)(v19 + 16), (id *)&aBlock.origin.y);
    uint64_t v22 = v19;
    WebKit::WebPageProxy::requestTextExtraction((uint64_t)m_ptr, (uint64_t)v23, &v22);
    uint64_t v21 = v22;
    uint64_t v22 = 0;
    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
    }
    objc_destroyWeak((id *)&aBlock.origin.y);
    _Block_release(*(const void **)&aBlock.origin.x);
  }
  else
  {
LABEL_7:
    uint64_t v13 = (void (*)(id, void))*((void *)a4 + 2);
    v13(a4, 0);
  }
}

- (void)_doAfterNextVisibleContentRectAndPresentationUpdate:
{
  _Block_release(*(const void **)(a1 + 40));
  unsigned int v2 = *(const void **)(a1 + 32);
  *(void *)(a1 + 32) = 0;
  if (v2)
  {
    CFRelease(v2);
  }
}

- (uint64_t)_doAfterNextVisibleContentRectAndPresentationUpdate:
{
  return [*(id *)(a1 + 32) _doAfterNextPresentationUpdate:*(void *)(a1 + 40)];
}

- (uint64_t)proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (void)proofreadingSession:didReceiveSuggestions:processedRange:inContext:finished:
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 216));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 64)
      && (v5 = WeakRetained, uint64_t v6 = WeakRetained[52], v13 = *(_OWORD *)(a1 + 96), *(unsigned char *)(a1 + 192)))
    {
      int v7 = *(unsigned __int8 *)(a1 + 208);
      double v8 = _Block_copy(a2);
      double v9 = (void *)WTF::fastMalloc((WTF *)0x10);
      *double v9 = &unk_1EE9C4D28;
      v9[1] = v8;
      char v12 = v9;
      WebKit::WebPageProxy::proofreadingSessionDidReceiveSuggestions(v6, a1 + 32, a1 + 80, (uint64_t)&v13, a1 + 112, v7 != 0, (uint64_t *)&v12);
      uint64_t v10 = (uint64_t)v12;
      char v12 = 0;
      if (v10) {
        (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
      }
      _Block_release(0);
      CFRelease(v5);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    uint64_t v11 = (void (*)(void *))a2[2];
    v11(a2);
  }
}

- (void)didEndWritingToolsSession:accepted:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (*(unsigned char *)(a1 + 64))
  {
    float v3 = WeakRetained;
    uint64_t v4 = *((void *)WeakRetained + 52);
    char v5 = *(unsigned char *)(a1 + 80);
    uint64_t v6 = *(void *)(v4 + 256);
    uint64_t v7 = a1 + 32;
    char v8 = v5;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::DidEndWritingToolsSession>(v6, (uint64_t)&v7, *(void *)(*(void *)(v4 + 32) + 1928), 0);
    CFRelease(v3);
  }
  else
  {
    __break(1u);
  }
}

- (uint64_t)didEndWritingToolsSession:accepted:
{
  *a1 = &unk_1EE9C4D70;
  objc_destroyWeak(a1 + 9);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)startDownloadUsingRequest:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9C4FE8;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)startDownloadUsingRequest:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C4FE8;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)startDownloadUsingRequest:(uint64_t)result completionHandler:(uint64_t)a2
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 8) + 16))();
  }
  return result;
}

- (uint64_t)resumeDownloadFromResumeData:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9C5010;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)resumeDownloadFromResumeData:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C5010;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)resumeDownloadFromResumeData:(uint64_t)result completionHandler:(uint64_t)a2
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 8) + 16))();
  }
  return result;
}

- (void)closeAllMediaPresentationsWithCompletionHandler:(void *)a1
{
  unsigned int v2 = (unsigned int *)a1[1];
  *a1 = &unk_1EE9C5088;
  a1[1] = 0;
  if (v2) {
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>,(WTF::DestructionThread)0>::deref(v2);
  }
  return a1;
}

- (uint64_t)closeAllMediaPresentationsWithCompletionHandler:(WTF *)this
{
  float v3 = (unsigned int *)*((void *)this + 1);
  *(void *)this = &unk_1EE9C5088;
  *((void *)this + 1) = 0;
  if (v3) {
    WTF::ThreadSafeRefCounted<WTF::CallbackAggregatorOnThread<(WTF::DestructionThread)0>,(WTF::DestructionThread)0>::deref(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)closeAllMediaPresentationsWithCompletionHandler:(uint64_t)a1
{
  float v3 = *(atomic_uint **)(a1 + 8);
  atomic_fetch_add(v3, 1u);
  uint64_t v4 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v4 = &unk_1EE9C5060;
  v4[1] = v3;
  uint64_t v6 = v4;
  WebKit::VideoPresentationModelContext::requestCloseAllMediaPresentations(a2, 0, (uint64_t *)&v6);
  uint64_t result = (uint64_t)v6;
  uint64_t v6 = 0;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8))(result);
  }
  return result;
}

- (uint64_t)requestMediaPlaybackStateWithCompletionHandler:(uint64_t)a1
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)requestMediaPlaybackStateWithCompletionHandler:(const void *)a1
{
  *a1 = &unk_1EE9C50D8;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)setMicrophoneCaptureState:(uint64_t)a1 completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)setMicrophoneCaptureState:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C5128;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)setCameraCaptureState:(uint64_t)a1 completionHandler:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)setCameraCaptureState:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C5178;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_evaluateJavaScript:(void *)a1 asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
{
  unsigned int v2 = (const void *)a1[1];
  *a1 = &unk_1EE9C51C8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)_evaluateJavaScript:(WTF *)this asAsyncFunction:(void *)a2 withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
{
  float v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9C51C8;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (uint64_t)_evaluateJavaScript:(uint64_t)a1 asAsyncFunction:withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 8) + 16))(*(void *)(a1 + 8), 0, *(void *)(a1 + 16));
}

- (void)_evaluateJavaScript:(uint64_t)a1 asAsyncFunction:(WebCore::SerializedScriptValue *)a2 withSourceURL:withArguments:forceUserGesture:inFrame:inWorld:completionHandler:
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2)
  {
    int v4 = *((_DWORD *)a2 + 8);
    if (v4)
    {
      if (v4 != 1)
      {
        CGFloat v17 = (_Unwind_Exception *)std::__throw_bad_variant_access[abi:sn180100]();
        CFTypeRef v18 = cf;
        CFTypeRef cf = 0;
        if (v18) {
          CFRelease(v18);
        }
        _Unwind_Resume(v17);
      }
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      unint64_t v7 = *((char *)a2 + 16);
      if (v7 > 2) {
        WKErrorCode v8 = 0;
      }
      else {
        WKErrorCode v8 = qword_1994F62E8[v7];
      }
      objc_msgSend(v6, "setObject:forKey:", localizedDescriptionForErrorCode(v8, v5), *MEMORY[0x1E4F28568]);
      if (*(void *)a2) {
        uint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
      }
      else {
        uint64_t v11 = &stru_1EEA10550;
      }
      [v6 setObject:v11 forKey:@"WKJavaScriptExceptionMessage"];
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", *((unsigned int *)a2 + 2)), @"WKJavaScriptExceptionLineNumber");
      objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", *((unsigned int *)a2 + 3)), @"WKJavaScriptExceptionColumnNumber");
      uint64_t v14 = *((void *)a2 + 3);
      long long v13 = (char *)a2 + 24;
      uint64_t v12 = v14;
      if (v14 && *(_DWORD *)(v12 + 4)) {
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F1CB10], "_web_URLWithWTFString:", v13), @"WKJavaScriptExceptionSourceURL");
      }
      CGFloat v15 = (const void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"WKErrorDomain" code:v8 userInfo:v6];
      if (v6) {
        CFRelease(v6);
      }
      (*(void (**)(uint64_t, void, const void *))(v2 + 16))(v2, 0, v15);
      if (v15)
      {
        CFRelease(v15);
      }
    }
    else if (*(void *)a2)
    {
      uint64_t v9 = API::SerializedScriptValue::deserialize(*(API::SerializedScriptValue **)(*(void *)a2 + 16), a2);
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
      v10(v2, v9, 0);
    }
    else
    {
      createNSError(WKErrorJavaScriptResultTypeIsUnsupported, 0, &cf);
      (*(void (**)(uint64_t, void, CFTypeRef))(v2 + 16))(v2, 0, cf);
      CFTypeRef v16 = cf;
      CFTypeRef cf = 0;
      if (v16) {
        CFRelease(v16);
      }
    }
  }
}

- (uint64_t)takeSnapshotWithConfiguration:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9C5218;
  uint64_t v2 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
  _Block_release(*(const void **)(a1 + 80));
  _Block_release(*(const void **)(a1 + 72));
  float v3 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v3) {
    CFRelease(v3);
  }
  return a1;
}

{
  uint64_t v2;
  void *v3;
  const void *v4;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C5218;
  uint64_t v2 = *(void *)(a1 + 88);
  *(void *)(a1 + 88) = 0;
  if (v2) {
    CFRelease(*(CFTypeRef *)(v2 + 8));
  }
  _Block_release(*(const void **)(a1 + 80));
  _Block_release(*(const void **)(a1 + 72));
  int v4 = *(const void **)(a1 + 8);
  *(void *)(a1 + 8) = 0;
  if (v4) {
    CFRelease(v4);
  }

  return WTF::fastFree((WTF *)a1, v3);
}

- (uint64_t)takeSnapshotWithConfiguration:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C51F0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)takeSnapshotWithConfiguration:(uint64_t)a1 completionHandler:
{
  uint64_t v2 = *(void *)(a1 + 88);
  if (*(unsigned char *)(v2 + 801) || !*(unsigned char *)(v2 + 800))
  {
    kdebug_trace();
    createNSError(WKErrorUnknown, 0, v11);
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    CFTypeRef v3 = (CFTypeRef)v11[0];
    v11[0] = 0;
    if (v3) {
LABEL_10:
    }
      CFRelease(v3);
  }
  else
  {
    [MEMORY[0x1E4F39CF8] activate];
    int v4 = (void *)MEMORY[0x1E4F39CF8];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3321888768;
    v11[2] = ___ZZ61__WKWebView_takeSnapshotWithConfiguration_completionHandler__EN4__31clEv_block_invoke;
    int32x2_t v11[3] = &__block_descriptor_104_e8_32c87_ZTSKZZ61__WKWebView_takeSnapshotWithConfiguration_completionHandler__EN4__31clEvEUlvE__e5_v8__0l;
    CFStringRef v5 = *(const void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
    long long v7 = *(_OWORD *)(a1 + 16);
    long long v8 = *(_OWORD *)(a1 + 32);
    long long v9 = *(_OWORD *)(a1 + 48);
    id v6 = *(const void **)(a1 + 72);
    uint64_t v10 = *(void *)(a1 + 64);
    *(void *)(a1 + 72) = 0;
    CFTypeRef cf = v5;
    if (v5) {
      CFRetain(v5);
    }
    long long v13 = v7;
    long long v14 = v8;
    long long v15 = v9;
    uint64_t v16 = v10;
    CGRect aBlock = _Block_copy(v6);
    [v4 addCommitHandler:v11 forPhase:2];
    _Block_release(v6);
    if (v5) {
      CFRelease(v5);
    }
    _Block_release(aBlock);
    CFTypeRef v3 = cf;
    CFTypeRef cf = 0;
    if (v3) {
      goto LABEL_10;
    }
  }
}

- (uint64_t)findString:(uint64_t)a1 withConfiguration:completionHandler:
{
  *(void *)a1 = &unk_1EE9C52A0;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)findString:(const void *)a1 withConfiguration:completionHandler:
{
  *a1 = &unk_1EE9C52A0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)findString:(uint64_t)a1 withConfiguration:(uint64_t)a2 completionHandler:
{
  id v3 = [[WKFindResult alloc] _initWithMatchFound:a2];
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v3)
  {
    CFRelease(v3);
  }
}

- (uint64_t)_showWarningView:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9C52C8;
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  objc_destroyWeak((id *)(a1 + 8));
  return a1;
}

{
  uint64_t v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C52C8;
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  objc_destroyWeak((id *)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v3);
}

- (void)_showWarningView:(uint64_t)a1 completionHandler:(uint64_t)a2
{
  id v3 = (id *)(a1 + 8);
  WTF::CompletionHandler<void ()(std::variant<WebKit::ContinueUnsafeLoad,WTF::URL> &&)>::operator()((uint64_t *)(a1 + 16));
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    CFStringRef v5 = WeakRetained;
    int v6 = *(_DWORD *)(a2 + 40);
    if (v6 == 1)
    {
      BOOL v7 = 1;
    }
    else
    {
      if (v6)
      {
        std::__throw_bad_variant_access[abi:sn180100]();
        __break(1u);
        return;
      }
      BOOL v7 = *(unsigned char *)a2 != 0;
    }
    int v8 = [WeakRetained[60] forMainFrameNavigation];
    if (v7 & v8) {
      goto LABEL_16;
    }
    id v9 = v5[60];
    if (v9) {
      int v10 = v7;
    }
    else {
      int v10 = 1;
    }
    if ((v10 | v8))
    {
      v5[60] = 0;
      [v9 removeFromSuperview];
      if (v9)
      {
        uint64_t v11 = v9;
LABEL_15:
        CFRelease(v11);
      }
    }
    else
    {
      WebKit::WebPageProxy::goBack((WebKit::WebPageProxy *)v5[52], &v13);
      uint64_t v12 = v13;
      uint64_t v13 = 0;
      if (v12)
      {
        uint64_t v11 = *(const void **)(v12 + 8);
        goto LABEL_15;
      }
    }
LABEL_16:
    CFRelease(v5);
  }
}

- (uint64_t)_internalDoAfterNextPresentationUpdate:(uint64_t)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:
{
  *(void *)a1 = &unk_1EE9C5318;
  uint64_t v2 = *(const void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v2) {
    CFRelease(v2);
  }
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C5318;
  uint64_t v2 = *(const void **)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v2) {
    CFRelease(v2);
  }
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v3);
}

- (uint64_t)_internalDoAfterNextPresentationUpdate:(const void *)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:
{
  *a1 = &unk_1EE9C52F0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)_internalDoAfterNextPresentationUpdate:(uint64_t)a1 withoutWaitingForPainting:withoutWaitingForAnimatedResize:
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16) || (uint64_t v4 = *(void *)(a1 + 24), !*(_DWORD *)(v4 + 764)))
    {
      id v3 = (void (*)(void))v2[2];
      v3();
    }
    else
    {
      uint64_t v5 = v4 + 1648;
      int v6 = _Block_copy(v2);
      unint64_t v7 = *(unsigned int *)(v5 + 12);
      if (v7 == *(_DWORD *)(v5 + 8))
      {
        unint64_t v8 = v7 + (v7 >> 2);
        if (v8 >= 0x10) {
          unint64_t v9 = v8 + 1;
        }
        else {
          unint64_t v9 = 16;
        }
        if (v9 <= v7 + 1) {
          unint64_t v10 = v7 + 1;
        }
        else {
          unint64_t v10 = v9;
        }
        WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>(v5, v10);
        unint64_t v7 = *(unsigned int *)(v5 + 12);
        uint64_t v11 = *(void *)v5;
        uint64_t v12 = (void *)WTF::fastMalloc((WTF *)0x10);
      }
      else
      {
        uint64_t v11 = *(void *)v5;
        uint64_t v12 = (void *)WTF::fastMalloc((WTF *)0x10);
      }
      *uint64_t v12 = &unk_1EE9C5340;
      v12[1] = v6;
      *(void *)(v11 + 8 * v7) = v12;
      ++*(_DWORD *)(v5 + 12);
      _Block_release(0);
    }
  }
}

- (uint64_t)_internalDoAfterNextPresentationUpdate:withoutWaitingForPainting:withoutWaitingForAnimatedResize:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)createPDFWithConfiguration:(uint64_t)a1 completionHandler:
{
  *(void *)a1 = &unk_1EE9C5368;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)createPDFWithConfiguration:(const void *)a1 completionHandler:
{
  *a1 = &unk_1EE9C5368;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)createPDFWithConfiguration:(uint64_t)a1 completionHandler:(WebCore::SharedBuffer *)a2
{
  id v3 = *a2;
  if (*a2 && *((void *)v3 + 6))
  {
    WebCore::SharedBuffer::createCFData((uint64_t *)&cf, v3);
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  else
  {
    createNSError(WKErrorUnknown, 0, &cf);
    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  }
  CFTypeRef v4 = cf;
  CFTypeRef cf = 0;
  if (v4) {
    CFRelease(v4);
  }
}

- (uint64_t)createWebArchiveDataWithCompletionHandler:(uint64_t)a1
{
  if (!a2) {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"WKErrorDomain" code:1 userInfo:0];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 8) + 16);

  return v3();
}

- (uint64_t)createWebArchiveDataWithCompletionHandler:(const void *)a1
{
  *a1 = &unk_1EE9C5390;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)willBeginWritingToolsSession:(uint64_t)a1 requestContexts:
{
  *(void *)a1 = &unk_1EE9C53B8;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)willBeginWritingToolsSession:(const void *)a1 requestContexts:
{
  *a1 = &unk_1EE9C53B8;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)willBeginWritingToolsSession:(uint64_t)a1 requestContexts:(uint64_t)a2
{
  CFTypeRef v4 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:*(unsigned int *)(a2 + 12)];
  uint64_t v5 = *(unsigned int *)(a2 + 12);
  if (v5)
  {
    int v6 = *(void **)a2;
    uint64_t v7 = 80 * v5;
    do
    {
      WebKit::convertToPlatformContext(v6, &cf);
      [v4 addObject:cf];
      CFTypeRef v8 = cf;
      CFTypeRef cf = 0;
      if (v8) {
        CFRelease(v8);
      }
      v6 += 10;
      v7 -= 80;
    }
    while (v7);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 rectsForProofreadingSuggestionsInRange:completion:
{
  *(void *)a1 = &unk_1EE9C53E0;
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

- (uint64_t)intelligenceTextEffectCoordinator:(const void *)a1 rectsForProofreadingSuggestionsInRange:completion:
{
  *a1 = &unk_1EE9C53E0;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)intelligenceTextEffectCoordinator:(uint64_t)a1 rectsForProofreadingSuggestionsInRange:(uint64_t *)a2 completion:
{
  CFTypeRef v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)a2 + 3)];
  uint64_t v5 = *((unsigned int *)a2 + 3);
  if (v5)
  {
    uint64_t v6 = *a2;
    uint64_t v7 = 16 * v5;
    do
    {
      CFTypeRef v8 = (void *)MEMORY[0x1E4F29238];
      WebCore::FloatRect::operator CGRect();
      uint64_t v9 = objc_msgSend(v8, "valueWithRect:");
      if (v9) {
        [v4 addObject:v9];
      }
      v6 += 16;
      v7 -= 16;
    }
    while (v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
  if (v4)
  {
    CFRelease(v4);
  }
}

- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 updateTextVisibilityForRange:visible:identifier:completion:
{
  *(void *)a1 = &unk_1EE9C5408;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  void *v2;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C5408;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)intelligenceTextEffectCoordinator:(uint64_t)a1 updateTextVisibilityForRange:visible:identifier:completion:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  uint64_t v3 = *(void *)(a1 + 8);
  if (WeakRetained)
  {
    CFTypeRef v4 = WeakRetained;
    [WeakRetained _doAfterNextPresentationUpdate:v3];
    CFRelease(v4);
  }
  else
  {
    uint64_t v5 = *(void (**)(uint64_t))(v3 + 16);
    uint64_t v6 = *(void *)(a1 + 8);
    v5(v6);
  }
}

- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 textPreviewsForRange:completion:
{
  *(void *)a1 = &unk_1EE9C5430;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  void *v2;
  uint64_t vars8;

  *(void *)a1 = &unk_1EE9C5430;
  objc_destroyWeak((id *)(a1 + 16));
  _Block_release(*(const void **)(a1 + 8));

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)intelligenceTextEffectCoordinator:(uint64_t)a1 textPreviewsForRange:(const WebCore::TextIndicatorData *)a2 completion:
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    if (*((unsigned char *)a2 + 112))
    {
      uint64_t v6 = (void *)*((void *)WeakRetained + 79);
      WebCore::TextIndicatorData::TextIndicatorData((WebCore::TextIndicatorData *)v16, a2);
      uint64_t v7 = (const void *)[v6 _createTargetedPreviewFromTextIndicator:v16 previewContainer:v5];
      uint64_t v9 = v7;
      if (v7) {
        CFRetain(v7);
      }
      if ((v22 & 0x8000000000000) != 0)
      {
        long long v15 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFLL);
        if (atomic_fetch_add((atomic_uint *volatile)(v22 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v15);
          WTF::fastFree((WTF *)v15, v8);
        }
      }
      unint64_t v10 = v21;
      uint64_t v21 = 0;
      if (v10)
      {
        if (v10[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v10 + 8))(v10);
        }
        else {
          --v10[2];
        }
      }
      uint64_t v12 = v20;
      CGFloat v20 = 0;
      if (v12)
      {
        if (v12[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v12 + 8))(v12);
        }
        else {
          --v12[2];
        }
      }
      uint64_t v13 = v19;
      uint64_t v19 = 0;
      if (v13)
      {
        if (v13[2] == 1) {
          (*(void (**)(_DWORD *))(*(void *)v13 + 8))(v13);
        }
        else {
          --v13[2];
        }
      }
      long long v14 = v17;
      if (v17)
      {
        CGFloat v17 = 0;
        int v18 = 0;
        WTF::fastFree(v14, v8);
      }
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
      if (v9) {
        CFRelease(v9);
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    }
    CFRelease(v5);
  }
  else
  {
    uint64_t v11 = *(void (**)(void))(*(void *)(a1 + 8) + 16);
    v11();
  }
}

- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 decorateReplacementsForRange:completion:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)intelligenceTextEffectCoordinator:(const void *)a1 decorateReplacementsForRange:completion:
{
  *a1 = &unk_1EE9C5458;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)intelligenceTextEffectCoordinator:(uint64_t)a1 setSelectionForRange:completion:
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

- (uint64_t)intelligenceTextEffectCoordinator:(const void *)a1 setSelectionForRange:completion:
{
  *a1 = &unk_1EE9C5480;
  _Block_release(a1[1]);

  return WTF::fastFree((WTF *)a1, v2);
}

- (NSString)_caLayerTreeAsText
{
  unint64_t v10 = 0;
  uint64_t v11 = 0;
  int v12 = 0;
  char v13 = 1;
  int v14 = 0;
  __int16 v15 = 256;
  int v16 = 0;
  WTF::TextStream::startGroup((WTF::TextStream *)&v10);
  WTF::TextStream::operator<<();
  dumpCALayer((WTF::TextStream *)&v10, (CALayer *)[self->_contentView.m_ptr layer]);
  WTF::TextStream::endGroup((WTF::TextStream *)&v10);
  WTF::TextStream::release((uint64_t *)&v9, (WTF::TextStream *)&v10);
  if (v9)
  {
    CFTypeRef v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    uint64_t v5 = v9;
    uint64_t v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    CFTypeRef v4 = &stru_1EEA10550;
  }
  uint64_t v6 = v11;
  uint64_t v11 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v3);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  uint64_t v7 = v10;
  unint64_t v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v3);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return &v4->isa;
}

- (void)_addEventAttributionWithSourceID:(unsigned __int8)a3 destinationURL:(id)a4 sourceDescription:(id)a5 purchaser:(id)a6 reportEndpoint:(id)a7 optionalNonce:(id)a8 applicationBundleID:(id)a9 ephemeral:(BOOL)a10
{
  MEMORY[0x19972E8A0](v30, a7, a3, a4, a5, a6);
  WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v31, (const WTF::URL *)v30);
  MEMORY[0x19972E8A0](v28, a4);
  WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v29, (const WTF::URL *)v28);
  int v14 = (WTF::WallTime *)MEMORY[0x19972EAD0](&v27, a9);
  WTF::WallTime::now(v14);
  v32[0] = a3;
  CGFloat v17 = v31;
  if (v31) {
    *(_DWORD *)v31 += 2;
  }
  CFTypeRef v33 = v17;
  int v18 = v29;
  if (v29) {
    *(_DWORD *)v29 += 2;
  }
  uint64_t v34 = v18;
  uint64_t v35 = v16;
  BOOL v36 = a10;
  char v37 = 0;
  char v38 = 0;
  char v39 = 0;
  char v40 = 0;
  char v41 = 0;
  char v42 = 0;
  char v43 = 0;
  char v44 = 0;
  char v45 = 0;
  char v46 = 0;
  char v50 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  char v49 = 0;
  uint64_t v19 = v27;
  if (v27)
  {
    int v20 = *(_DWORD *)v27;
    *(_DWORD *)v27 += 2;
    long long v51 = v19;
    char v27 = 0;
    if (v20)
    {
      *(_DWORD *)uint64_t v19 = v20;
    }
    else
    {
      WTF::StringImpl::destroy(v19, v15);
      int v18 = v29;
    }
  }
  else
  {
    long long v51 = 0;
  }
  uint64_t v29 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2) {
      WTF::StringImpl::destroy(v18, v15);
    }
    else {
      *(_DWORD *)v18 -= 2;
    }
  }
  uint64_t v21 = v28[0];
  v28[0] = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v15);
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  uint64_t v22 = v31;
  long long v31 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2) {
      WTF::StringImpl::destroy(v22, v15);
    }
    else {
      *(_DWORD *)v22 -= 2;
    }
  }
  uint64_t v23 = v30[0];
  v30[0] = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
    {
      WTF::StringImpl::destroy(v23, v15);
      if (!a8) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
    *(_DWORD *)v23 -= 2;
  }
  if (!a8) {
    goto LABEL_31;
  }
LABEL_27:
  MEMORY[0x19972EAD0](v30, a8);
  WebCore::PrivateClickMeasurement::setEphemeralSourceNonce();
  CFStringRef v25 = v30[0];
  v30[0] = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2) {
      WTF::StringImpl::destroy(v25, v24);
    }
    else {
      *(_DWORD *)v25 -= 2;
    }
  }
LABEL_31:
  WebKit::WebPageProxy::setPrivateClickMeasurement((uint64_t)self->_page.m_ptr, v32);
  WebCore::PrivateClickMeasurement::~PrivateClickMeasurement((WebCore::PrivateClickMeasurement *)v32, v26);
}

- (void)_setPageScale:(double)a3 withOrigin:(CGPoint)a4
{
  CGPoint v14 = a4;
  m_ptr = self->_page.m_ptr;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v12, &v14);
  float v6 = roundf(v12[0]);
  uint64_t v7 = 0x7FFFFFFFLL;
  uint64_t v8 = (int)v6;
  if (v6 <= -2147500000.0) {
    uint64_t v8 = 0x80000000;
  }
  if (v6 < 2147500000.0) {
    uint64_t v7 = v8;
  }
  float v9 = roundf(v12[1]);
  uint64_t v10 = 0x7FFFFFFF00000000;
  unint64_t v11 = 0x8000000000000000;
  if (v9 > -2147500000.0) {
    unint64_t v11 = (unint64_t)(int)v9 << 32;
  }
  if (v9 < 2147500000.0) {
    uint64_t v10 = v11;
  }
  uint64_t v13 = v10 | v7;
  WebKit::WebPageProxy::scalePage((uint64_t)m_ptr, a3, (const WebCore::IntPoint *)&v13);
}

- (double)_pageScale
{
  m_ptr = self->_page.m_ptr;
  uint64_t v3 = 744;
  if (!*((unsigned char *)m_ptr + 929)) {
    uint64_t v3 = 712;
  }
  return *(double *)((char *)m_ptr + v3);
}

- (void)_setContinuousSpellCheckingEnabledForTesting:(BOOL)a3
{
}

- (void)_setGrammarCheckingEnabledForTesting:(BOOL)a3
{
}

- (id)_contentsOfUserInterfaceItem:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if ([a3 isEqualToString:@"validationBubble"])
  {
    uint64_t v5 = *((void *)self->_page.m_ptr + 111);
    float v6 = (WTF::StringImpl **)(v5 + 16);
    if (!v5) {
      float v6 = (WTF::StringImpl **)MEMORY[0x1E4F30980];
    }
    uint64_t v7 = *v6;
    if (*v6) {
      *(_DWORD *)v7 += 2;
    }
    if (v5) {
      double v8 = *(double *)(v5 + 24);
    }
    else {
      double v8 = 0.0;
    }
    id v16 = a3;
    v14[0] = @"message";
    if (v7) {
      unint64_t v11 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v11 = &stru_1EEA10550;
    }
    v14[1] = @"fontSize";
    v15[0] = v11;
    v15[1] = [NSNumber numberWithDouble:v8];
    v17[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    uint64_t v13 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    if (v7)
    {
      if (*(_DWORD *)v7 == 2) {
        WTF::StringImpl::destroy(v7, v12);
      }
      else {
        *(_DWORD *)v7 -= 2;
      }
    }
    return v13;
  }
  else
  {
    m_ptr = self->_contentView.m_ptr;
    return (id)[m_ptr _contentsOfUserInterfaceItem:a3];
  }
}

- (void)_requestActiveNowPlayingSessionInfo:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    float v6 = _Block_copy(a3);
    uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9C69A0;
    v7[1] = v6;
    unint64_t v11 = v7;
    uint64_t v8 = *((void *)m_ptr + 32);
    char v12 = 0;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::RequestActiveNowPlayingSessionInfo,WTF::CompletionHandler<void ()(BOOL,WebCore::NowPlayingInfo &&)>>(v8, (uint64_t)&v12, (uint64_t *)&v11, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
    uint64_t v9 = (uint64_t)v11;
    unint64_t v11 = 0;
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
    }
    _Block_release(0);
  }
  else
  {
    uint64_t v10 = (void (*)(id, void, void, __CFString *, void, __n128, __n128))*((void *)a3 + 2);
    v3.n128_u64[0] = 0x7FF8000000000000;
    v4.n128_u64[0] = 0x7FF8000000000000;
    v10(a3, 0, 0, &stru_1EEA10550, 0, v3, v4);
  }
}

- (void)_setNowPlayingMetadataObserver:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    CFRetain(*((CFTypeRef *)m_ptr + 1));
    if (a3)
    {
      uint64_t v5 = _Block_copy(a3);
      float v6 = (void *)WTF::fastMalloc((WTF *)0x10);
      uint64_t v7 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v7 = &unk_1EE9C6968;
      v7[1] = v5;
      *float v6 = 0;
      v6[1] = v7;
      uint64_t v9 = v6;
      _Block_release(0);
    }
    else
    {
      uint64_t v9 = 0;
    }
    WebKit::WebPageProxy::setNowPlayingMetadataObserverForTesting((uint64_t)m_ptr, &v9);
    uint64_t v8 = v9;
    uint64_t v9 = 0;
    if (v8) {
      std::default_delete<WTF::Observer<void ()(WebCore::NowPlayingMetadata const&)>>::operator()[abi:sn180100]((uint64_t)&v9, (uint64_t)v8);
    }
    CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
}

- (BOOL)_scrollingUpdatesDisabledForTesting
{
  return 0;
}

- (NSString)_scrollingTreeAsText
{
  uint64_t v2 = (WebKit::RemoteScrollingCoordinatorProxy *)*((void *)self->_page.m_ptr + 31);
  if (!v2) {
    return (NSString *)&stru_1EEA10550;
  }
  WebKit::RemoteScrollingCoordinatorProxy::scrollingTreeAsText(v2, &v7);
  if (!v7) {
    return (NSString *)&stru_1EEA10550;
  }
  __n128 v4 = (NSString *)WTF::StringImpl::operator NSString *();
  uint64_t v5 = v7;
  uint64_t v7 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v3);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
  return v4;
}

- (int)_networkProcessIdentifier
{
  uint64_t v2 = *(void *)(*((void *)self->_page.m_ptr + 39) + 400);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 136);
    if (v3) {
      return *(_DWORD *)(v3 + 108);
    }
    else {
      return 0;
    }
  }
  else
  {
    int result = 275;
    __break(0xC471u);
  }
  return result;
}

- (unint64_t)_countOfUpdatesWithLayerChanges
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 29);
  if (v2 && !*(unsigned char *)(v2 + 36)) {
    return *(unsigned int *)(v2 + 200);
  }
  else {
    return 0;
  }
}

- (void)_doAfterNextPresentationUpdateWithoutWaitingForAnimatedResizeForTesting:(id)a3
{
}

- (void)_disableBackForwardSnapshotVolatilityForTesting
{
  {
    WebKit::ViewSnapshotStore::singleton(void)::store = 0u;
    *(_OWORD *)&qword_1EB35A7E0 = 0u;
  }
  byte_1EB35A7F0 = 1;
}

- (BOOL)_beginBackSwipeForTesting
{
  value = self->_gestureController.__ptr_.__value_;
  if (value) {
    LOBYTE(value) = WebKit::ViewGestureController::beginSimulatedSwipeInDirectionForTesting((uint64_t)value, 0);
  }
  return (char)value;
}

- (BOOL)_completeBackSwipeForTesting
{
  value = self->_gestureController.__ptr_.__value_;
  if (value) {
    objc_msgSend((id)objc_msgSend(*((id *)value + 17), "transitionForDirection:", 0), "_completeStoppedInteractiveTransition");
  }
  return value != 0;
}

- (void)_resetNavigationGestureStateForTesting
{
  value = self->_gestureController.__ptr_.__value_;
  if (value)
  {
    WebKit::ViewGestureController::removeSwipeSnapshot((WebKit::ViewGestureController *)self->_gestureController.__ptr_.__value_);
    WebKit::ViewGestureController::resetState((WebKit::ViewGestureController *)value);
  }
}

- (void)_setDefersLoadingForTesting:(BOOL)a3
{
  uint64_t v3 = (WebKit::WebPageProxyTesting *)*((void *)self->_page.m_ptr + 190);
  if (v3) {
    WebKit::WebPageProxyTesting::setDefersLoading(v3, a3);
  }
}

- (void)_setShareSheetCompletesImmediatelyWithResolutionForTesting:(BOOL)a3
{
  self->_resolutionForShareSheetImmediateCompletionForTesting = (optional<BOOL>)(a3 | 0x100);
}

- (void)_processWillSuspendForTesting:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *((void *)m_ptr + 32);
    uint64_t v5 = _Block_copy(a3);
    float v6 = (void *)WTF::fastMalloc((WTF *)0x10);
    *float v6 = &unk_1EE9C69C8;
    v6[1] = v5;
    uint64_t v9 = v6;
    WebKit::WebProcessProxy::sendPrepareToSuspend(v4, 0, (uint64_t *)&v9, 0.0);
    uint64_t v7 = (uint64_t)v9;
    uint64_t v9 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    _Block_release(0);
  }
  else
  {
    uint64_t v8 = (void (*)(id))*((void *)a3 + 2);
    v8(a3);
  }
}

- (void)_processWillSuspendImminentlyForTesting
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    uint64_t v3 = *((void *)m_ptr + 32);
    uint64_t v4 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v4 = &unk_1EE9C69F0;
    float v6 = v4;
    WebKit::WebProcessProxy::sendPrepareToSuspend(v3, 1, (uint64_t *)&v6, 0.0);
    uint64_t v5 = (uint64_t)v6;
    float v6 = 0;
    if (v5) {
      (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
    }
  }
}

- (void)_processDidResumeForTesting
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    WebKit::WebProcessProxy::sendProcessDidResume(*((WebKit::WebProcessProxy **)m_ptr + 32));
  }
}

- (void)_setThrottleStateForTesting:(int)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    uint64_t v4 = *((void *)m_ptr + 32);
    *(unsigned char *)(v4 + 680) = 1;
    WebKit::WebProcessProxy::didChangeThrottleState(v4, a3);
    *(unsigned char *)(v4 + 680) = 0;
  }
}

- (BOOL)_hasServiceWorkerBackgroundActivityForTesting
{
  m_ptr = self->_page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v3 = (WebKit::WebProcessPool *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*((void *)m_ptr + 6) + 24));

  return WebKit::WebProcessPool::hasServiceWorkerBackgroundActivityForTesting(v3);
}

- (BOOL)_hasServiceWorkerForegroundActivityForTesting
{
  m_ptr = self->_page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  uint64_t v3 = (WebKit::WebProcessPool *)API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*((void *)m_ptr + 6) + 24));

  return WebKit::WebProcessPool::hasServiceWorkerForegroundActivityForTesting(v3);
}

- (void)_denyNextUserMediaRequest
{
  {
    qword_1E93CFBE0 = 0;
    unk_1E93CFBE8 = 0;
    WebKit::UserMediaProcessManager::singleton(void)::manager = (uint64_t)&unk_1EE9D78F0;
    qword_1E93CFBF0 = 0;
    LOBYTE(word_1E93CFBF8) = 1;
  }
  HIBYTE(word_1E93CFBF8) = 1;
}

- (void)_setIndexOfGetDisplayMediaDeviceSelectedForTesting:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (a3)
    {
      int v5 = [a3 unsignedIntValue];
      unsigned int v6 = v5 & 0xFFFFFF00;
      int v7 = v5;
      m_ptr = self->_page.m_ptr;
      uint64_t v8 = 0x100000000;
    }
    else
    {
      uint64_t v8 = 0;
      int v7 = 0;
      unsigned int v6 = 0;
    }
    if (*((void *)m_ptr + 190))
    {
      {
        dword_1E93CFBBC = 0;
      }
      WebKit::DisplayCaptureSessionManager::singleton(void)::manager = v8 | v6 | v7;
      byte_1E93CFBB8 = BYTE4(v8);
    }
  }
}

- (void)_setSystemCanPromptForGetDisplayMediaForTesting:(BOOL)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr && *((void *)m_ptr + 190))
  {
    {
      LOBYTE(WebKit::DisplayCaptureSessionManager::singleton(void)::manager) = 0;
      byte_1E93CFBB8 = 0;
    }
    if (a3) {
      int v4 = 1;
    }
    else {
      int v4 = 2;
    }
    dword_1E93CFBBC = v4;
  }
}

- (double)_mediaCaptureReportingDelayForTesting
{
  return *((double *)self->_page.m_ptr + 133);
}

- (void)_setMediaCaptureReportingDelayForTesting:(double)a3
{
  *((double *)self->_page.m_ptr + 133) = a3;
}

- (BOOL)_wirelessVideoPlaybackDisabled
{
  uint64_t v2 = (WebKit::PlaybackSessionManagerProxy *)*((void *)self->_page.m_ptr + 53);
  if (v2) {
    LOBYTE(v2) = WebKit::PlaybackSessionManagerProxy::wirelessVideoPlaybackDisabled(v2);
  }
  return (char)v2;
}

- (void)_doAfterProcessingAllPendingMouseEvents:(id)a3
{
  m_ptr = (uint64_t *)self->_page.m_ptr;
  int v4 = _Block_copy(a3);
  int v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6A18;
  v5[1] = v4;
  int v7 = v5;
  WebKit::WebPageProxy::doAfterProcessingAllPendingMouseEvents(m_ptr, (unint64_t)&v7);
  unsigned int v6 = v7;
  int v7 = 0;
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }
  _Block_release(0);
}

+ (void)_setApplicationBundleIdentifier:(id)a3
{
  MEMORY[0x19972EAD0](&v6, a3);
  WebCore::setApplicationBundleIdentifierOverride((WebCore *)&v6, v3);
  int v5 = v6;
  unsigned int v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (BOOL)_hasSleepDisabler
{
  m_ptr = self->_page.m_ptr;
  return m_ptr && (uint64_t v3 = *(void *)(*((void *)m_ptr + 4) + 2000)) != 0 && *(_DWORD *)(v3 - 12) != 0;
}

- (id)_scrollbarStateForScrollingNodeID:(unint64_t)a3 processID:(unint64_t)a4 isVertical:(BOOL)a5
{
  m_ptr = self->_page.m_ptr;
  if (!m_ptr) {
    return &stru_1EEA10550;
  }
  if (a3 == -1 || a4 == -1)
  {
    __break(0xC471u);
    JUMPOUT(0x198BC2C08);
  }
  if (*((void *)m_ptr + 31))
  {
    WebKit::RemoteScrollingCoordinatorProxy::scrollbarStateForScrollingNodeID(&v11);
    if (!v11) {
      return &stru_1EEA10550;
    }
  }
  else
  {
    int v7 = (WTF::StringImpl *)MEMORY[0x1E4F30960];
    *MEMORY[0x1E4F30960] += 2;
    unint64_t v11 = v7;
  }
  unsigned int v6 = (void *)WTF::StringImpl::operator NSString *();
  uint64_t v9 = v11;
  unint64_t v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2) {
      WTF::StringImpl::destroy(v9, v8);
    }
    else {
      *(_DWORD *)v9 -= 2;
    }
  }
  return v6;
}

- (int)_audioRoutingArbitrationStatus
{
  return 0;
}

- (double)_audioRoutingArbitrationUpdateTime
{
  return 0.0;
}

- (void)_doAfterActivityStateUpdate:(id)a3
{
  m_ptr = self->_page.m_ptr;
  int v4 = _Block_copy(a3);
  int v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C5C00;
  v5[1] = v4;
  int v7 = v5;
  WebKit::WebPageProxy::addActivityStateUpdateCompletionHandler((unint64_t)m_ptr, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  int v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (id)_suspendMediaPlaybackCounter
{
  return (id)[NSNumber numberWithUnsignedLong:*((void *)self->_page.m_ptr + 168)];
}

- (void)_setPrivateClickMeasurementOverrideTimerForTesting:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v4 = *((void *)self->_page.m_ptr + 190);
  if (v4)
  {
    uint64_t v6 = _Block_copy(a4);
    int v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9C6A40;
    v7[1] = v6;
    uint64_t v10 = v7;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementOverrideTimer(v4, a3, (uint64_t *)&v10);
    uint64_t v8 = (uint64_t)v10;
    uint64_t v10 = 0;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
    _Block_release(0);
  }
  else
  {
    uint64_t v9 = (void (*)(id))*((void *)a4 + 2);
    v9(a4);
  }
}

- (void)_setPrivateClickMeasurementAttributionReportURLsForTesting:(id)a3 destinationURL:(id)a4 completionHandler:(id)a5
{
  uint64_t v6 = *((void *)self->_page.m_ptr + 190);
  if (v6)
  {
    MEMORY[0x19972E8A0](v17, a3);
    MEMORY[0x19972E8A0](v16, a4);
    uint64_t v8 = _Block_copy(a5);
    uint64_t v9 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v9 = &unk_1EE9C6A68;
    v9[1] = v8;
    __int16 v15 = v9;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementAttributionReportURLs(v6, (uint64_t *)v17, (uint64_t *)v16, (uint64_t *)&v15);
    uint64_t v10 = (uint64_t)v15;
    __int16 v15 = 0;
    if (v10) {
      (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    }
    _Block_release(0);
    char v12 = v16[0];
    v16[0] = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v11);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    CGPoint v14 = v17[0];
    v17[0] = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v11);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
  }
  else
  {
    uint64_t v13 = (void (*)(id))*((void *)a5 + 2);
    v13(a5);
  }
}

- (void)_setPrivateClickMeasurementAttributionTokenPublicKeyURLForTesting:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = *((void *)self->_page.m_ptr + 190);
  if (v5)
  {
    MEMORY[0x19972E8A0](v13, a3);
    uint64_t v6 = _Block_copy(a4);
    int v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9C6A90;
    v7[1] = v6;
    char v12 = v7;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementTokenPublicKeyURL(v5, (uint64_t *)v13, (uint64_t *)&v12);
    uint64_t v8 = (uint64_t)v12;
    char v12 = 0;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
    _Block_release(0);
    uint64_t v10 = v13[0];
    v13[0] = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v9);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
  }
  else
  {
    unint64_t v11 = (void (*)(id))*((void *)a4 + 2);
    v11(a4);
  }
}

- (void)_setPrivateClickMeasurementAttributionTokenSignatureURLForTesting:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = *((void *)self->_page.m_ptr + 190);
  if (v5)
  {
    MEMORY[0x19972E8A0](v13, a3);
    uint64_t v6 = _Block_copy(a4);
    int v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9C6AB8;
    v7[1] = v6;
    char v12 = v7;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementTokenSignatureURL(v5, (uint64_t *)v13, (uint64_t *)&v12);
    uint64_t v8 = (uint64_t)v12;
    char v12 = 0;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
    _Block_release(0);
    uint64_t v10 = v13[0];
    v13[0] = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v9);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
  }
  else
  {
    unint64_t v11 = (void (*)(id))*((void *)a4 + 2);
    v11(a4);
  }
}

- (void)_setPrivateClickMeasurementAppBundleIDForTesting:(id)a3 completionHandler:(id)a4
{
  uint64_t v5 = *((void *)self->_page.m_ptr + 190);
  if (v5)
  {
    MEMORY[0x19972EAD0](&v13, a3);
    uint64_t v6 = _Block_copy(a4);
    int v7 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v7 = &unk_1EE9C6AE0;
    v7[1] = v6;
    char v12 = v7;
    WebKit::WebPageProxyTesting::setPrivateClickMeasurementAppBundleID(v5, (uint64_t *)&v13, (uint64_t *)&v12);
    uint64_t v8 = (uint64_t)v12;
    char v12 = 0;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
    _Block_release(0);
    uint64_t v10 = v13;
    uint64_t v13 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2) {
        WTF::StringImpl::destroy(v10, v9);
      }
      else {
        *(_DWORD *)v10 -= 2;
      }
    }
  }
  else
  {
    unint64_t v11 = (void (*)(id))*((void *)a4 + 2);
    v11(a4);
  }
}

- (void)_dumpPrivateClickMeasurement:(id)a3
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 190);
  if (v3)
  {
    uint64_t v4 = _Block_copy(a3);
    uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v5 = &unk_1EE9C6B08;
    v5[1] = v4;
    uint64_t v8 = v5;
    WebKit::WebPageProxyTesting::dumpPrivateClickMeasurement(v3, (uint64_t *)&v8);
    uint64_t v6 = (uint64_t)v8;
    uint64_t v8 = 0;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
    }
    _Block_release(0);
  }
  else
  {
    int v7 = (void (*)(id, void))*((void *)a3 + 2);
    v7(a3, 0);
  }
}

- (BOOL)_shouldBypassGeolocationPromptForTesting
{
  return 0;
}

- (void)_resetInteraction
{
  [self->_contentView.m_ptr cleanUpInteraction];
  m_ptr = self->_contentView.m_ptr;

  [m_ptr setUpInteraction];
}

- (void)_dismissContactPickerWithContacts:(id)a3
{
}

- (void)_lastNavigationWasAppInitiated:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6B30;
  v5[1] = v4;
  uint64_t v8 = v5;
  uint64_t v6 = *((void *)m_ptr + 32);
  char v9 = 0;
  WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::LastNavigationWasAppInitiated,WTF::CompletionHandler<void ()(BOOL)>>(v6, (uint64_t)&v9, (uint64_t *)&v8, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
  uint64_t v7 = (uint64_t)v8;
  uint64_t v8 = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  _Block_release(0);
}

- (void)_appPrivacyReportTestingData:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6B58;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebPageProxy::appPrivacyReportTestingData((uint64_t)m_ptr, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_clearAppPrivacyReportTestingData:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9C6B80;
  v5[1] = v4;
  uint64_t v7 = v5;
  WebKit::WebPageProxy::clearAppPrivacyReportTestingData((uint64_t)m_ptr, (uint64_t *)&v7);
  uint64_t v6 = (uint64_t)v7;
  uint64_t v7 = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  _Block_release(0);
}

- (void)_isLayerTreeFrozenForTesting:(id)a3
{
  uint64_t v3 = *((void *)self->_page.m_ptr + 190);
  if (v3)
  {
    uint64_t v4 = _Block_copy(a3);
    uint64_t v5 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v5 = &unk_1EE9C6BA8;
    v5[1] = v4;
    char v9 = v5;
    char v10 = 0;
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 56))(v3);
    IPC::MessageSender::sendWithAsyncReply<Messages::WebPageTesting::IsLayerTreeFrozen,WTF::CompletionHandler<void ()(BOOL)>>(v3, (uint64_t)&v10, (uint64_t *)&v9, v6, 0);
    uint64_t v7 = (uint64_t)v9;
    char v9 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    _Block_release(0);
  }
  else
  {
    uint64_t v8 = (void (*)(id, void))*((void *)a3 + 2);
    v8(a3, 0);
  }
}

- (void)_computePagesForPrinting:(id)a3 completionHandler:(id)a4
{
  memset(v11, 0, 29);
  m_ptr = self->_page.m_ptr;
  uint64_t v5 = *((void *)a3 + 3);
  uint64_t v6 = *((void *)a3 + 4);
  uint64_t v7 = _Block_copy(a4);
  uint64_t v8 = (void *)WTF::fastMalloc((WTF *)0x10);
  *uint64_t v8 = &unk_1EE9C6BD0;
  v8[1] = v7;
  char v10 = v8;
  WebKit::WebPageProxy::computePagesForPrinting((uint64_t)m_ptr, v5, v6, (uint64_t)v11, (uint64_t)&v10);
  char v9 = v10;
  char v10 = 0;
  if (v9) {
    (*(void (**)(void *))(*v9 + 8))(v9);
  }
  _Block_release(0);
}

- (void)_gpuToWebProcessConnectionCountForTesting:(id)a3
{
  uint64_t v4 = *(void *)(API::PageConfiguration::Data::LazyInitializedRef<WebKit::WebProcessPool,&API::PageConfiguration::Data::createWebProcessPool>::get((uint64_t *)(*((void *)self->_page.m_ptr + 6) + 24))
                 + 176);
  if (v4)
  {
    atomic_fetch_add((atomic_uint *volatile)(v4 + 16), 1u);
    uint64_t v5 = _Block_copy(a3);
    uint64_t v6 = (void *)WTF::fastMalloc((WTF *)0x10);
    *uint64_t v6 = &unk_1EE9C6BF8;
    v6[1] = v5;
    char v9 = v6;
    char v10 = 0;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::GPUProcess::WebProcessConnectionCountForTesting,WTF::CompletionHandler<void ()(unsigned long long)>>(v4, (uint64_t)&v10, (uint64_t *)&v9, 0, 0, 1);
    uint64_t v7 = (uint64_t)v9;
    char v9 = 0;
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
    }
    _Block_release(0);
    WTF::ThreadSafeRefCounted<WebKit::AuxiliaryProcessProxy,(WTF::DestructionThread)2>::deref((unsigned int *)(v4 + 16));
  }
  else
  {
    uint64_t v8 = (void (*)(id, void))*((void *)a3 + 2);
    v8(a3, 0);
  }
}

- (void)_setSystemPreviewCompletionHandlerForLoadTesting:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = (WTF *)WTF::fastMalloc((WTF *)0x10);
  uint64_t v6 = v5;
  *(void *)uint64_t v5 = &unk_1EE9C6C20;
  *((void *)v5 + 1) = v4;
  uint64_t v7 = *((void *)m_ptr + 57);
  if (v7)
  {
    uint64_t v8 = *(void *)(v7 + 272);
    *(void *)(v7 + 272) = v6;
    if (v8) {
      (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
    }
  }
  else
  {
    *(void *)uint64_t v5 = &unk_1EE9C6C20;
    _Block_release(v4);
    WTF::fastFree(v6, v9);
  }

  _Block_release(0);
}

- (void)_createMediaSessionCoordinatorForTesting:(id)a3 completionHandler:(id)a4
{
}

- (BOOL)_isLoggerEnabledForTesting
{
  return *(unsigned char *)(WebKit::WebPageProxy::logger((WebKit::WebPageProxy *)self->_page.m_ptr) + 12);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WKWebView *)self bounds];
  BOOL v10 = v9 == height && v8 == width;
  if (!v10) {
    [(WKWebView *)self _frameOrBoundsWillChange];
  }
  v12.receiver = self;
  v12.super_class = (Class)WKWebView;
  -[WKWebView setBounds:](&v12, sel_setBounds_, x, y, width, height);
  m_ptr = self->_customContentFixedOverlayView.m_ptr;
  [(WKWebView *)self bounds];
  objc_msgSend(m_ptr, "setFrame:");
  if (!v10)
  {
    [(WKWebView *)self _frameOrBoundsMayHaveChanged];
    -[WKWebView _acquireResizeAssertionForReason:](self, "_acquireResizeAssertionForReason:", @"-[WKWebView setBounds:]");
  }
}

- (void)_incrementFocusPreservationCount
{
}

- (void)_decrementFocusPreservationCount
{
  unint64_t focusPreservationCount = self->_focusPreservationCount;
  if (focusPreservationCount) {
    self->_unint64_t focusPreservationCount = focusPreservationCount - 1;
  }
}

- (unint64_t)_resetFocusPreservationCount
{
  unint64_t focusPreservationCount = self->_focusPreservationCount;
  self->_unint64_t focusPreservationCount = 0;
  return focusPreservationCount;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    WebKit::WebPageProxy::effectiveAppearanceDidChange((WebKit::WebPageProxy *)m_ptr);
    [(WKWebView *)self _updateScrollViewBackground];
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  -[WKWebView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_);
  if (self->_scrollView.m_ptr) {
    objc_msgSend(a3, "removeObject:");
  }
  if (self->_customContentFixedOverlayView.m_ptr) {
    objc_msgSend(a3, "removeObject:");
  }
}

- (id)browsingContextController
{
  if (WTF::linkedOnOrAfterSDKWithBehavior()) {
    return 0;
  }
  m_ptr = self->_contentView.m_ptr;

  return (id)[m_ptr browsingContextController];
}

- (BOOL)becomeFirstResponder
{
  id v3 = [(WKWebView *)self _currentContentView];
  uint64_t v4 = v3;
  if (self->_contentView.m_ptr == v3 && [v3 superview])
  {
    if ([self->_contentView.m_ptr becomeFirstResponderForWebView]) {
      return 1;
    }
    v8.receiver = self;
    objc_super v5 = &v8;
  }
  else
  {
    if ([v4 becomeFirstResponder]) {
      return 1;
    }
    uint64_t v7 = self;
    objc_super v5 = (objc_super *)&v7;
  }
  v5->super_class = (Class)WKWebView;
  return [(objc_super *)v5 becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  id v3 = [(WKWebView *)self _currentContentView];
  if (self->_contentView.m_ptr != v3) {
    return 1;
  }

  return [v3 canBecomeFirstResponderForWebView];
}

- (BOOL)resignFirstResponder
{
  if ([self->_contentView.m_ptr isFirstResponder])
  {
    m_ptr = self->_contentView.m_ptr;
    return [m_ptr resignFirstResponderForWebView];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WKWebView;
    return [(WKWebView *)&v5 resignFirstResponder];
  }
}

- (id)undoManager
{
  id v3 = [(WKWebView *)self _currentContentView];
  if (self->_contentView.m_ptr == v3)
  {
    return (id)[v3 undoManagerForWebView];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WKWebView;
    return [(WKWebView *)&v5 undoManager];
  }
}

- (void)captureTextFromCamera:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr captureTextFromCameraForWebView:a3];
  }
}

- (void)useSelectionForFind:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr useSelectionForFindForWebView:a3];
  }
}

- (void)findSelected:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr findSelectedForWebView:a3];
  }
}

- (void)_findSelected:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _findSelectedForWebView:a3];
  }
}

- (void)addShortcut:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr addShortcutForWebView:a3];
  }
}

- (void)_addShortcut:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _addShortcutForWebView:a3];
  }
}

- (void)define:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr defineForWebView:a3];
  }
}

- (void)_define:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _defineForWebView:a3];
  }
}

- (void)lookup:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr lookupForWebView:a3];
  }
}

- (void)_lookup:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _lookupForWebView:a3];
  }
}

- (void)translate:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr translateForWebView:a3];
  }
}

- (void)_translate:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _translateForWebView:a3];
  }
}

- (void)promptForReplace:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr promptForReplaceForWebView:a3];
  }
}

- (void)_promptForReplace:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _promptForReplaceForWebView:a3];
  }
}

- (void)share:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr shareForWebView:a3];
  }
}

- (void)_share:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _shareForWebView:a3];
  }
}

- (void)transliterateChinese:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr transliterateChineseForWebView:a3];
  }
}

- (void)_transliterateChinese:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _transliterateChineseForWebView:a3];
  }
}

- (void)_nextAccessoryTab:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _nextAccessoryTabForWebView:a3];
  }
}

- (void)_previousAccessoryTab:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _previousAccessoryTabForWebView:a3];
  }
}

- (void)copy:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr copyForWebView:a3];
  }
}

- (void)cut:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr cutForWebView:a3];
  }
}

- (void)paste:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr pasteForWebView:a3];
  }
}

- (void)replace:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr replaceForWebView:a3];
  }
}

- (void)select:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr selectForWebView:a3];
  }
}

- (void)selectAll:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr selectAllForWebView:a3];
  }
}

- (void)toggleBoldface:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr toggleBoldfaceForWebView:a3];
  }
}

- (void)toggleItalics:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr toggleItalicsForWebView:a3];
  }
}

- (void)toggleUnderline:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr toggleUnderlineForWebView:a3];
  }
}

- (void)increaseSize:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr increaseSizeForWebView:a3];
  }
}

- (void)decreaseSize:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr decreaseSizeForWebView:a3];
  }
}

- (void)pasteAndMatchStyle:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr pasteAndMatchStyleForWebView:a3];
  }
}

- (void)makeTextWritingDirectionNatural:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr makeTextWritingDirectionNaturalForWebView:a3];
  }
}

- (void)makeTextWritingDirectionLeftToRight:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr makeTextWritingDirectionLeftToRightForWebView:a3];
  }
}

- (void)makeTextWritingDirectionRightToLeft:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr makeTextWritingDirectionRightToLeftForWebView:a3];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v6 = self;
  if (sel_captureTextFromCamera_ == a3
    || sel_useSelectionForFind_ == a3
    || sel_findSelected_ == a3
    || sel__findSelected_ == a3
    || sel_addShortcut_ == a3
    || sel__addShortcut_ == a3
    || sel_define_ == a3
    || sel__define_ == a3
    || sel_lookup_ == a3
    || sel__lookup_ == a3
    || sel_translate_ == a3
    || sel__translate_ == a3
    || sel_promptForReplace_ == a3
    || sel__promptForReplace_ == a3
    || sel_share_ == a3
    || sel__share_ == a3
    || sel_transliterateChinese_ == a3
    || sel__transliterateChinese_ == a3
    || sel__nextAccessoryTab_ == a3
    || sel__previousAccessoryTab_ == a3
    || sel_copy_ == a3
    || sel_cut_ == a3
    || sel_paste_ == a3
    || sel_replace_ == a3
    || sel_select_ == a3
    || sel_selectAll_ == a3
    || sel_toggleBoldface_ == a3
    || sel_toggleItalics_ == a3
    || sel_toggleUnderline_ == a3
    || sel_increaseSize_ == a3
    || sel_decreaseSize_ == a3
    || sel_pasteAndMatchStyle_ == a3
    || sel_makeTextWritingDirectionNatural_ == a3
    || sel_makeTextWritingDirectionLeftToRight_ == a3
    || sel_makeTextWritingDirectionRightToLeft_ == a3
    || sel__alignCenter_ == a3
    || sel__alignJustified_ == a3
    || sel__alignLeft_ == a3
    || sel__alignRight_ == a3
    || sel__indent_ == a3
    || sel__outdent_ == a3
    || sel__toggleStrikeThrough_ == a3
    || sel__insertOrderedList_ == a3
    || sel__insertUnorderedList_ == a3
    || sel__insertNestedOrderedList_ == a3
    || sel__insertNestedUnorderedList_ == a3
    || sel__increaseListLevel_ == a3
    || sel__decreaseListLevel_ == a3
    || sel__changeListType_ == a3
    || sel__pasteAsQuotation_ == a3
    || sel__pasteAndMatchStyle_ == a3
    || sel__setTextColor_sender_ == a3
    || sel__setFontSize_sender_ == a3
    || sel__setFont_sender_ == a3)
  {
    LODWORD(self) = [(WKWebView *)self usesStandardContentView];
    if (self)
    {
      m_ptr = v6->_contentView.m_ptr;
      LOBYTE(self) = [m_ptr canPerformActionForWebView:a3 withSender:a4];
    }
  }
  else if (sel_find_ == a3 || sel_findNext_ == a3 || sel_findPrevious_ == a3)
  {
    LOBYTE(self) = self->_findInteractionEnabled;
  }
  else if (sel_findAndReplace_ == a3)
  {
    if (self->_findInteractionEnabled)
    {
      LOBYTE(self) = [(WKWebView *)self supportsTextReplacement];
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WKWebView;
    LOBYTE(self) = [(WKWebView *)&v9 canPerformAction:a3 withSender:a4];
  }
  return (char)self;
}

- (id)targetForAction:(SEL)a3 withSender:(id)a4
{
  if (sel_captureTextFromCamera_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_useSelectionForFind_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_findSelected_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__findSelected_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_addShortcut_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__addShortcut_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_define_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__define_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_lookup_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__lookup_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_translate_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__translate_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_promptForReplace_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__promptForReplace_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_share_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__share_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_transliterateChinese_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__transliterateChinese_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__nextAccessoryTab_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__previousAccessoryTab_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_copy_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_cut_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_paste_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_replace_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_select_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_selectAll_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_toggleBoldface_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_toggleItalics_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_toggleUnderline_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_increaseSize_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_decreaseSize_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_pasteAndMatchStyle_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel_makeTextWritingDirectionNatural_ == a3
    && [(WKWebView *)self usesStandardContentView]
    || sel_makeTextWritingDirectionLeftToRight_ == a3
    && [(WKWebView *)self usesStandardContentView]
    || sel_makeTextWritingDirectionRightToLeft_ == a3
    && [(WKWebView *)self usesStandardContentView]
    || sel__alignCenter_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__alignJustified_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__alignLeft_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__alignRight_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__indent_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__outdent_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__toggleStrikeThrough_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__insertOrderedList_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__insertUnorderedList_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__insertNestedOrderedList_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__insertNestedUnorderedList_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__increaseListLevel_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__decreaseListLevel_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__changeListType_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__pasteAsQuotation_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__pasteAndMatchStyle_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__setTextColor_sender_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__setFontSize_sender_ == a3 && [(WKWebView *)self usesStandardContentView]
    || sel__setFont_sender_ == a3 && [(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    return (id)[m_ptr targetForActionForWebView:a3 withSender:a4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WKWebView;
    return [(WKWebView *)&v9 targetForAction:a3 withSender:a4];
  }
}

- (void)find:(id)a3
{
}

- (void)findNext:(id)a3
{
}

- (void)findPrevious:(id)a3
{
}

- (void)findAndReplace:(id)a3
{
}

- (void)willFinishIgnoringCalloutBarFadeAfterPerformingAction
{
}

- (id)_wkScrollView
{
  return self->_scrollView.m_ptr;
}

- (int64_t)_selectionGranularity
{
  return [self->_configuration.m_ptr selectionGranularity];
}

- (void)_setHasCustomContentView:(BOOL)a3 loadedMIMEType:(const void *)a4
{
  if (a3
    && (uint64_t v6 = [(WKWebViewContentProviderRegistry *)[(WKWebView *)self _contentProviderRegistry] providerForMIMEType:a4]) != 0)
  {
    uint64_t v7 = v6;
    [self->_customContentView.m_ptr removeFromSuperview];
    [self->_customContentFixedOverlayView.m_ptr removeFromSuperview];
    id v8 = [v7 alloc];
    [(WKWebView *)self bounds];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    if (*(void *)a4) {
      CGFloat v17 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      CGFloat v17 = &stru_1EEA10550;
    }
    int v18 = objc_msgSend(v8, "web_initWithFrame:webView:mimeType:", self, v17, v10, v12, v14, v16);
    m_ptr = self->_customContentView.m_ptr;
    self->_customContentView.m_ptr = v18;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    id v20 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(WKWebView *)self bounds];
    uint64_t v21 = objc_msgSend(v20, "initWithFrame:");
    uint64_t v22 = self->_customContentFixedOverlayView.m_ptr;
    self->_customContentFixedOverlayView.m_ptr = v21;
    if (v22)
    {
      CFRelease(v22);
      uint64_t v21 = self->_customContentFixedOverlayView.m_ptr;
    }
    objc_msgSend((id)objc_msgSend(v21, "layer"), "setName:", @"CustomContentFixedOverlay");
    [self->_customContentFixedOverlayView.m_ptr setUserInteractionEnabled:0];
    objc_msgSend((id)objc_msgSend(self->_contentView.m_ptr, "unscaledView"), "removeFromSuperview");
    [self->_contentView.m_ptr removeFromSuperview];
    [self->_scrollView.m_ptr addSubview:self->_customContentView.m_ptr];
    [(WKWebView *)self addSubview:self->_customContentFixedOverlayView.m_ptr];
    uint64_t v23 = self->_customContentView.m_ptr;
    [(WKWebView *)self bounds];
    objc_msgSend(v23, "web_setMinimumSize:", v24, v25);
    objc_msgSend(self->_customContentView.m_ptr, "web_setFixedOverlayView:", self->_customContentFixedOverlayView.m_ptr);
    WebCore::Color::operator=();
    [(WKWebView *)self _resetContentOffset];
    objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "panGestureRecognizer"), "setAllowedTouchTypes:", self->_scrollViewDefaultAllowedTouchTypes.m_ptr);
    [self->_scrollView.m_ptr _setScrollEnabledInternal:1];
    [(WKWebView *)self _setAvoidsUnsafeArea:0];
  }
  else
  {
    CGRect v26 = self->_customContentView.m_ptr;
    if (v26)
    {
      [v26 removeFromSuperview];
      char v27 = self->_customContentView.m_ptr;
      self->_customContentView.m_ptr = 0;
      if (v27) {
        CFRelease(v27);
      }
      [self->_customContentFixedOverlayView.m_ptr removeFromSuperview];
      uint64_t v28 = self->_customContentFixedOverlayView.m_ptr;
      self->_customContentFixedOverlayView.m_ptr = 0;
      if (v28) {
        CFRelease(v28);
      }
      [self->_scrollView.m_ptr addSubview:self->_contentView.m_ptr];
      objc_msgSend(self->_scrollView.m_ptr, "addSubview:", objc_msgSend(self->_contentView.m_ptr, "unscaledView"));
      uint64_t v29 = self->_scrollView.m_ptr;
      long long v30 = self->_page.m_ptr;
      [self->_contentView.m_ptr frame];
      uint64_t v33 = 764;
      if (!*((unsigned char *)v30 + 768)) {
        uint64_t v33 = 760;
      }
      objc_msgSend(v29, "setContentSize:", floor(v31 * *(float *)((char *)v30 + v33)) / *(float *)((char *)v30 + v33), floor(v32 * *(float *)((char *)v30 + v33)) / *(float *)((char *)v30 + v33));
      uint64_t v34 = self->_customContentFixedOverlayView.m_ptr;
      [(WKWebView *)self bounds];
      objc_msgSend(v34, "setFrame:");
      [(WKWebView *)self addSubview:self->_customContentFixedOverlayView.m_ptr];
    }
  }
  if ([(WKWebView *)self isFirstResponder])
  {
    id v35 = [(WKWebView *)self _currentContentView];
    BOOL v36 = v35;
    if (self->_contentView.m_ptr != v35)
    {
      if (![v35 canBecomeFirstResponder]) {
        return;
      }
      goto LABEL_21;
    }
    if ([v35 canBecomeFirstResponderForWebView]) {
LABEL_21:
    }
      [v36 becomeFirstResponder];
  }
}

- (void)_didFinishLoadingDataForCustomContentProviderWithSuggestedFilename:(const void *)a3 data:(id)a4
{
  m_ptr = self->_customContentView.m_ptr;
  if (*(void *)a3) {
    uint64_t v7 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    uint64_t v7 = &stru_1EEA10550;
  }
  id v8 = (WTF::WallTime *)objc_msgSend(m_ptr, "web_setContentProviderData:suggestedFilename:", a4, v7);
  double v9 = self->_page.m_ptr;
  WTF::WallTime::now(v8);

  WebKit::WebPageProxy::didReachLayoutMilestone((uint64_t)v9, 7u, v10);
}

- (BOOL)_tryToHandleKeyEventInCustomContentView:(id)a3
{
  return [(WKWebView *)self isFirstResponder]
      && [a3 _hidEvent]
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(self->_customContentView.m_ptr, "web_handleKeyEvent:", a3) & 1) != 0;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if (![(WKWebView *)self _tryToHandleKeyEventInCustomContentView:a4])
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebView;
    [(WKWebView *)&v7 pressesBegan:a3 withEvent:a4];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  if (![(WKWebView *)self _tryToHandleKeyEventInCustomContentView:a4])
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebView;
    [(WKWebView *)&v7 pressesChanged:a3 withEvent:a4];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if (![(WKWebView *)self _tryToHandleKeyEventInCustomContentView:a4])
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebView;
    [(WKWebView *)&v7 pressesEnded:a3 withEvent:a4];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  if (![(WKWebView *)self _tryToHandleKeyEventInCustomContentView:a4])
  {
    v7.receiver = self;
    v7.super_class = (Class)WKWebView;
    [(WKWebView *)&v7 pressesCancelled:a3 withEvent:a4];
  }
}

- (void)_videoControlsManagerDidChange
{
  m_ptr = self->_fullScreenWindowController.m_ptr;
  if (m_ptr) {
    [m_ptr videoControlsManagerDidChange];
  }
}

- (CGPoint)_initialContentOffsetForScrollView
{
  [(WKWebView *)self _computedContentInset];
  double v3 = -v2;
  double v5 = -v4;
  double v6 = v3;
  result.double y = v5;
  result.double x = v6;
  return result;
}

- (CGPoint)_contentOffsetAdjustedForObscuredInset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(WKWebView *)self _computedObscuredInset];
  double v6 = x - v5;
  double v8 = y - v7;
  double v9 = v6;
  result.double y = v8;
  result.double x = v9;
  return result;
}

- (unint64_t)_effectiveObscuredInsetEdgesAffectedBySafeArea
{
  if ([(WKWebView *)self usesStandardContentView]) {
    return self->_obscuredInsetEdgesAffectedBySafeArea;
  }
  else {
    return 15;
  }
}

- (UIEdgeInsets)_contentInsetsFromSystemMinimumLayoutMargins
{
  double v3 = [(UIView *)self _wk_viewControllerForFullScreenPresentation];
  if (v3)
  {
    double v4 = v3;
    [(UIViewController *)v3 systemMinimumLayoutMargins];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    m_ptr = self->_page.m_ptr;
    if (m_ptr)
    {
      int v14 = WebKit::WebPageProxy::userInterfaceLayoutDirection((WebKit::WebPageProxy *)m_ptr);
      if (v14) {
        double v15 = v12;
      }
      else {
        double v15 = v8;
      }
      if (v14) {
        double v12 = v8;
      }
      double v8 = v15;
    }
    double v16 = [(UIViewController *)v4 viewIfLoaded];
    if (v16)
    {
      CGFloat v17 = v16;
      [(UIView *)v16 bounds];
      CGFloat v40 = v19;
      CGFloat v41 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      [(WKWebView *)self bounds];
      -[WKWebView convertRect:toView:](self, "convertRect:toView:", v17);
      double v39 = v12;
      CGFloat height = v43.size.height;
      CGFloat y = v43.origin.y;
      CGFloat x = v43.origin.x;
      CGFloat v37 = v43.origin.x;
      double v38 = v8;
      CGFloat v25 = v43.origin.y;
      CGFloat width = v43.size.width;
      double MinY = CGRectGetMinY(v43);
      v44.origin.CGFloat x = v41;
      v44.origin.CGFloat y = v40;
      v44.size.CGFloat width = v21;
      v44.size.CGFloat height = v23;
      double v42 = fmax(v6 - fmax(MinY - CGRectGetMinY(v44), 0.0), 0.0);
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = v25;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v45);
      v46.origin.CGFloat x = v41;
      v46.origin.CGFloat y = v40;
      v46.size.CGFloat width = v21;
      v46.size.CGFloat height = v23;
      double v8 = fmax(v38 - fmax(MinX - CGRectGetMinX(v46), 0.0), 0.0);
      v47.origin.CGFloat x = v41;
      v47.origin.CGFloat y = v40;
      v47.size.CGFloat width = v21;
      v47.size.CGFloat height = v23;
      double MaxY = CGRectGetMaxY(v47);
      v48.origin.CGFloat x = v37;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      double v10 = fmax(v10 - fmax(MaxY - CGRectGetMaxY(v48), 0.0), 0.0);
      v49.origin.CGFloat y = v40;
      v49.origin.CGFloat x = v41;
      v49.size.CGFloat height = v23;
      v49.size.CGFloat width = v21;
      double MaxX = CGRectGetMaxX(v49);
      v50.origin.CGFloat x = v37;
      double v6 = v42;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      double v12 = fmax(v39 - fmax(MaxX - CGRectGetMaxX(v50), 0.0), 0.0);
    }
  }
  else
  {
    double v6 = *MEMORY[0x1E4F437F8];
    double v8 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  double v31 = v6;
  double v32 = v8;
  double v33 = v10;
  double v34 = v12;
  result.double right = v34;
  result.double bottom = v33;
  result.double left = v32;
  result.double top = v31;
  return result;
}

- (UIEdgeInsets)_computedContentInset
{
  if (self->_haveSetObscuredInsets)
  {
    CGFloat top = self->_obscuredInsets.top;
    CGFloat left = self->_obscuredInsets.left;
    CGFloat bottom = self->_obscuredInsets.bottom;
    CGFloat right = self->_obscuredInsets.right;
  }
  else
  {
    [self->_scrollView.m_ptr contentInset];
    CGFloat top = v7;
    CGFloat left = v8;
    CGFloat bottom = v9;
    CGFloat right = v10;
    if ([(WKWebView *)self _safeAreaShouldAffectObscuredInsets])
    {
      [(WKWebView *)self _scrollViewSystemContentInset];
      [(WKWebView *)self _effectiveObscuredInsetEdgesAffectedBySafeArea];
      UIEdgeInsetsAdd();
      CGFloat top = v11;
      CGFloat left = v12;
      CGFloat bottom = v13;
      CGFloat right = v14;
    }
  }
  double v15 = top;
  double v16 = left;
  double v17 = bottom;
  double v18 = right;
  result.CGFloat right = v18;
  result.CGFloat bottom = v17;
  result.CGFloat left = v16;
  result.CGFloat top = v15;
  return result;
}

- (void)_processWillSwapOrDidExit
{
  [(WKWebView *)self _hidePasswordView];
  [(WKWebView *)self _cancelAnimatedResize];
  [(WKWebView *)self _destroyResizeAnimationView];
  [self->_contentView.m_ptr setHidden:0];
  [(WKWebView *)self _invalidateResizeAssertions];
  value = (unsigned __int8 *)self->_gestureController.__ptr_.__value_;
  if (value) {
    WebKit::ViewGestureController::disconnectFromProcess(value);
  }
  LOWORD(v5) = 0;
  DWORD1(v5) = 0;
  WORD4(v5) = 0;
  *(void *)double v6 = 0;
  *(_OWORD *)&v6[8] = *MEMORY[0x1E4F1DB28];
  *(_OWORD *)&v6[24] = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  v6[40] = 0;
  v6[48] = 0;
  v6[52] = 0;
  v6[60] = 0;
  *(void *)&long long v7 = 0;
  WORD4(v7) = 1;
  BYTE10(v7) = 0;
  BYTE12(v7) = 0;
  BYTE4(v8) = 0;
  BYTE8(v8) = 0;
  BYTE12(v8) = 0;
  LOBYTE(v9) = 0;
  BYTE4(v9) = 0;
  BYTE8(v9) = 0;
  LOBYTE(v10) = 0;
  BYTE8(v10) = 0;
  BYTE8(v12) = 0;
  LOBYTE(v13) = 0;
  LOBYTE(v15) = 0;
  v17[0] = 0;
  *(void *)&long long v16 = 0;
  BYTE8(v16) = 0;
  memset(&v17[8], 0, 33);
  p_perProcessState = &self->_perProcessState;
  *(_OWORD *)&p_perProcessState->animatedResizeOriginalContentdouble Width = *(_OWORD *)v6;
  *(_OWORD *)&p_perProcessState->animatedResizeOldBounds.origin.CGFloat y = *(_OWORD *)&v6[16];
  *(_OWORD *)&p_perProcessState->animatedResizeOldBounds.size.CGFloat height = *(_OWORD *)&v6[32];
  *(_OWORD *)((char *)&p_perProcessState->scrollOffsetToRestore.var0.__val_.m_y + 1) = *(_OWORD *)&v6[45];
  *(_OWORD *)&p_perProcessState->viewportMetaTagdouble Width = xmmword_1994F6270;
  *(_OWORD *)&p_perProcessState->hasCommittedLoadForMainFrame = v5;
  WebCore::Color::operator=();
  p_perProcessState->liveResizeParameters.__engaged_ = 0;
  p_perProcessState->frozenUnobscuredContentRect.var0.__val_.CGSize size = v14;
  *(_OWORD *)&p_perProcessState->frozenUnobscuredContentRect.__engaged_ = v15;
  *(_OWORD *)&p_perProcessState->lastTransactionID.unint64_t m_identifier = v16;
  *(_OWORD *)&p_perProcessState->lastSentMinimumEffectiveDeviceWidth.__engaged_ = v10;
  *(_OWORD *)&p_perProcessState->frozenVisibleContentRect.var0.__val_.origin.CGFloat y = v11;
  *(_OWORD *)&p_perProcessState->frozenVisibleContentRect.var0.__val_.size.CGFloat height = v12;
  *(_OWORD *)&p_perProcessState->frozenUnobscuredContentRect.var0.__null_state_ = v13;
  *(_OWORD *)&p_perProcessState->isAnimatingFullScreenExit = v7;
  *(_OWORD *)&p_perProcessState->lastSentViewLayoutSize.var0.__val_.m_CGFloat height = v8;
  *(_OWORD *)&p_perProcessState->lastSentOrientationForMediaCapture.var0.__null_state_ = v9;
  *(_OWORD *)&p_perProcessState->committedFindLayerID.m_value.m_processIdentifier.unint64_t m_identifier = *(_OWORD *)&v17[32];
  p_perProcessState->liveResizeParameters.var0.__val_.initialScrollPosition = v18;
  *(_OWORD *)&p_perProcessState->firstTransactionIDAfterPageRestore.__engaged_ = *(_OWORD *)v17;
  *(_OWORD *)&p_perProcessState->pendingFindLayerID.m_value.m_processIdentifier.unint64_t m_identifier = *(_OWORD *)&v17[16];
}

- (void)_processWillSwap
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  double v3 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    long long v5 = self;
    _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _processWillSwap]", (uint8_t *)&v4, 0xCu);
  }
  [(WKWebView *)self _processWillSwapOrDidExit];
}

- (void)_processDidExit
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v3 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    uint64_t v6 = self;
    _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _processDidExit]", (uint8_t *)&v5, 0xCu);
  }
  [(WKWebView *)self _processWillSwapOrDidExit];
  m_ptr = self->_contentView.m_ptr;
  [(WKWebView *)self bounds];
  objc_msgSend(m_ptr, "setFrame:");
  objc_msgSend(self->_scrollView.m_ptr, "_setBackgroundColorInternal:", objc_msgSend(self->_contentView.m_ptr, "backgroundColor"));
  [(WKWebView *)self _resetContentOffset];
  [self->_scrollView.m_ptr setZoomScale:1.0];
}

- (void)_didRelaunchProcess
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  double v3 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    m_ptr = self->_page.m_ptr;
    if (*((unsigned char *)m_ptr + 801))
    {
      LODWORD(v5) = 0;
    }
    else
    {
      uint64_t v5 = *(void *)(*((void *)m_ptr + 32) + 136);
      if (v5) {
        LODWORD(v5) = *(_DWORD *)(v5 + 108);
      }
    }
    int v7 = 134218240;
    long long v8 = self;
    __int16 v9 = 1024;
    int v10 = v5;
    _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _didRelaunchProcess] (pid=%d)", (uint8_t *)&v7, 0x12u);
  }
  self->_perProcessState.hasScheduledVisibleRectUpdate = 0;
  self->_viewStabilityWhenVisibleContentRectUpdateScheduled.uint64_t m_storage = 0;
  value = (unsigned __int8 *)self->_gestureController.__ptr_.__value_;
  if (value) {
    WebKit::ViewGestureController::connectToProcess(value);
  }
}

- (void)_didCommitLoadForMainFrame
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 29);
  if (*(unsigned char *)(v2 + 36))
  {
    __break(0xC471u);
    JUMPOUT(0x198CBBED0);
  }
  self->_perProcessState.firstPaintAfterCommitLoadTransactionID.unint64_t m_identifier = *(void *)(v2 + 104) + 1;
  *(_WORD *)&self->_perProcessState.hasCommittedLoadForMainFrame = 257;
  if (![(WKWebView *)self _scrollViewIsRubberBandingForRefreshControl]) {
    objc_msgSend(self->_scrollView.m_ptr, "_wk_stopScrollingAndZooming");
  }
  if (self->_findInteractionEnabled)
  {
    [self->_findInteraction.m_ptr dismissFindNavigator];
    int v4 = (void *)[self->_findInteraction.m_ptr activeFindSession];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (v4) {
        objc_msgSend(v4, "setSearchableObject:", -[WKWebView _searchableObject](self, "_searchableObject"));
      }
    }
  }
  WebKit::WebPageProxy::currentURL((WebKit::WebPageProxy *)self->_page.m_ptr, (uint64_t *)&v13);
  MEMORY[0x19972E890](&v14, &v13, 0);
  uint64_t v6 = v13;
  long long v13 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  if ((~v15 & 3) == 0)
  {
    WTF::URL::hostAndPort((uint64_t *)&v13, (WTF::URL *)&v14);
    if (v13)
    {
      long long v8 = (__CFString *)WTF::StringImpl::operator NSString *();
      p_pendingPageLoadObserverHost = &self->_pendingPageLoadObserverHost;
      if (!v8)
      {
LABEL_16:
        m_ptr = p_pendingPageLoadObserverHost->m_ptr;
        p_pendingPageLoadObserverHost->m_ptr = v8;
        if (m_ptr) {
          CFRelease(m_ptr);
        }
        uint64_t v11 = v13;
        long long v13 = 0;
        if (v11)
        {
          if (*(_DWORD *)v11 == 2) {
            WTF::StringImpl::destroy(v11, v7);
          }
          else {
            *(_DWORD *)v11 -= 2;
          }
        }
        -[WKWebView _updatePageLoadObserverState]((uint64_t)self);
        goto LABEL_23;
      }
    }
    else
    {
      p_pendingPageLoadObserverHost = &self->_pendingPageLoadObserverHost;
      long long v8 = &stru_1EEA10550;
    }
    CFRetain(v8);
    goto LABEL_16;
  }
LABEL_23:
  long long v12 = v14;
  CGSize v14 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v5);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
}

- (FloatRect)visibleRectInViewCoordinates
{
  [(WKWebView *)self bounds];
  v18.origin.CGFloat x = v3;
  v18.origin.CGFloat y = v4;
  v18.size.CGFloat width = v5;
  v18.size.CGFloat height = v6;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v19, &v18);
  [self->_scrollView.m_ptr contentOffset];
  v18.origin.CGFloat x = v7;
  v18.origin.CGFloat y = v8;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v17, &v18.origin);
  float32x2_t v19 = vadd_f32(v17[0], v19);
  [self->_contentView.m_ptr bounds];
  v18.origin.CGFloat x = v9;
  v18.origin.CGFloat y = v10;
  v18.size.CGFloat width = v11;
  v18.size.CGFloat height = v12;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v17, &v18);
  WebCore::FloatRect::intersect((WebCore::FloatRect *)&v19, (const WebCore::FloatRect *)v17);
  float32_t v14 = v19.f32[1];
  float32_t v13 = v19.f32[0];
  float v15 = v20;
  float v16 = v21;
  result.m_size.m_CGFloat height = v16;
  result.m_size.m_CGFloat width = v15;
  result.m_location.m_CGFloat y = v14;
  result.m_location.m_CGFloat x = v13;
  return result;
}

- (void)_didCommitLayerTreeDuringAnimatedResize:(const void *)a3
{
  if (*((unsigned char *)a3 + 776)) {
    BOOL v3 = *((void *)a3 + 96) == self->_currentDynamicViewportSizeUpdateID;
  }
  else {
    BOOL v3 = 0;
  }
  if (v3)
  {
    double v5 = *((double *)a3 + 25);
    int v7 = *((_DWORD *)a3 + 42);
    int v6 = *((_DWORD *)a3 + 43);
    CGFloat v8 = (void *)[self->_resizeAnimationView.m_ptr layer];
    double v9 = 0.0;
    double m11 = 0.0;
    if (v8)
    {
      [v8 transform];
      double m11 = v36.m11;
    }
    CGFloat v11 = (void *)[self->_contentView.m_ptr layer];
    if (v11)
    {
      [v11 transform];
      double v9 = v36.m11;
    }
    CATransform3DMakeScale(&v36, v5 / (m11 * v9), v5 / (m11 * v9), 1.0);
    long long v12 = *(_OWORD *)&v36.m33;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31 = *(_OWORD *)&v36.m31;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33 = v12;
    long long v13 = *(_OWORD *)&v36.m43;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41 = *(_OWORD *)&v36.m41;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43 = v13;
    long long v14 = *(_OWORD *)&v36.m13;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.double m11 = *(_OWORD *)&v36.m11;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13 = v14;
    long long v15 = *(_OWORD *)&v36.m23;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21 = *(_OWORD *)&v36.m21;
    *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23 = v15;
    -[WKWebView _contentOffsetAdjustedForObscuredInset:](self, "_contentOffsetAdjustedForObscuredInset:", v5 * (double)v7, v5 * (double)v6);
    double v17 = v16;
    double v19 = v18;
    [self->_scrollView.m_ptr contentOffset];
    self->_resizeAnimationTransformAdjustments.m41 = (v20 - v17) / m11;
    self->_resizeAnimationTransformAdjustments.m42 = (v21 - v19) / m11;
    long long v22 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33;
    long long v32 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31;
    long long v33 = v22;
    long long v23 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13;
    long long v28 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m11;
    long long v29 = v23;
    long long v24 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23;
    long long v30 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21;
    long long v31 = v24;
    long long v25 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43;
    long long v34 = *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41;
    long long v35 = v25;
    CGRect v26 = (void *)[self->_resizeAnimationView.m_ptr layer];
    v27[4] = v32;
    v27[5] = v33;
    v27[6] = v34;
    v27[7] = v35;
    v27[0] = v28;
    v27[1] = v29;
    v27[2] = v30;
    v27[3] = v31;
    [v26 setSublayerTransform:v27];
    self->_perProcessState.waitingForCommitAfterAnimatedReCGSize size = 0;
    if (!self->_perProcessState.waitingForEndAnimatedResize) {
      [(WKWebView *)self _didCompleteAnimatedResize];
    }
  }
}

- (void)_couldNotRestorePageState
{
  value = self->_gestureController.__ptr_.__value_;
  if (value) {
    WebKit::ViewGestureController::SnapshotRemovalTracker::stopWaitingForEvent((WebKit::ViewGestureController::SnapshotRemovalTracker *)((char *)value + 168), (WebKit::ViewGestureController::SnapshotRemovalTracker *)0x20, "outstanding event occurred: ", 29, 1);
  }
}

- (void)_restorePageScrollPosition:(optional<WebCore:(FloatPoint)a4 :(RectEdges<float>)a5 FloatPoint>)a3 scrollOrigin:(double)a6 previousObscuredInset:scale:
{
  float v7 = a5.m_sides.__elems_[3];
  float v8 = a5.m_sides.__elems_[2];
  float v9 = a5.m_sides.__elems_[1];
  float v10 = a5.m_sides.__elems_[0];
  m_CGFloat y = a4.m_y;
  m_CGFloat x = a4.m_x;
  BOOL engaged = a3.__engaged_;
  float v14 = a3.var0.__val_.m_x;
  float v16 = a3.var0.__val_.m_y;
  if ([(WKWebView *)self _shouldDeferGeometryUpdates])
  {
    if (self)
    {
      CFRetain(self);
      CFRetain(self);
    }
    p_callbacksDeferredDuringReCGSize size = &self->_callbacksDeferredDuringResize;
    m_CGSize size = self->_callbacksDeferredDuringResize.m_size;
    if (m_size == self->_callbacksDeferredDuringResize.m_capacity)
    {
      unint64_t v21 = m_size + (m_size >> 2);
      if (v21 >= 0x10) {
        unint64_t v22 = v21 + 1;
      }
      else {
        unint64_t v22 = 16;
      }
      if (v22 <= m_size + 1) {
        unint64_t v23 = m_size + 1;
      }
      else {
        unint64_t v23 = v22;
      }
      WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&self->_callbacksDeferredDuringResize, v23);
      m_CGSize size = self->_callbacksDeferredDuringResize.m_size;
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      uint64_t v25 = WTF::fastMalloc((WTF *)0x40);
      *(void *)uint64_t v25 = &unk_1EE9CD578;
      *(void *)(v25 + 8) = self;
      *(float *)(v25 + 16) = v14;
      *(float *)(v25 + 20) = v16;
      *(unsigned char *)(v25 + 24) = engaged;
      *(_WORD *)(v25 + 25) = v26;
      *(unsigned char *)(v25 + 27) = v27;
    }
    else
    {
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      uint64_t v25 = WTF::fastMalloc((WTF *)0x40);
      *(void *)uint64_t v25 = &unk_1EE9CD578;
      *(void *)(v25 + 8) = self;
      *(float *)(v25 + 16) = v14;
      *(float *)(v25 + 20) = v16;
      *(unsigned char *)(v25 + 24) = engaged;
      *(_WORD *)(v25 + 25) = v26;
      *(unsigned char *)(v25 + 27) = v27;
    }
    *(void *)(v25 + 28) = LODWORD(m_x) | ((unint64_t)LODWORD(m_y) << 32);
    *(float *)(v25 + 36) = v10;
    *(float *)(v25 + 40) = v9;
    *(float *)(v25 + 44) = v8;
    *(float *)(v25 + 48) = v7;
    *(double *)(v25 + 56) = a6;
    m_buffer[m_size] = v25;
    ++self->_callbacksDeferredDuringResize.m_size;
    CFRelease(self);
  }
  else if ([(WKWebView *)self usesStandardContentView])
  {
    uint64_t v17 = *((void *)self->_page.m_ptr + 29);
    if (*(unsigned char *)(v17 + 36))
    {
      __break(0xC471u);
    }
    else
    {
      unint64_t v18 = *(void *)(v17 + 104) + 1;
      if (!self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_) {
        self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_ = 1;
      }
      self->_perProcessState.firstTransactionIDAfterPageRestore.var0.__val_.unint64_t m_identifier = v18;
      if (engaged)
      {
        if (!self->_perProcessState.scrollOffsetToRestore.__engaged_) {
          self->_perProcessState.scrollOffsetToRestore.__engaged_ = 1;
        }
        self->_perProcessState.scrollOffsetToRestore.var0.__val_.m_CGFloat x = m_x + v14;
        self->_perProcessState.scrollOffsetToRestore.var0.__val_.m_CGFloat y = m_y + v16;
      }
      else if (self->_perProcessState.scrollOffsetToRestore.__engaged_)
      {
        self->_perProcessState.scrollOffsetToRestore.__engaged_ = 0;
      }
      self->_obscuredInsetsWhenSaved.m_sides.__elems_[0] = v10;
      self->_obscuredInsetsWhenSaved.m_sides.__elems_[1] = v9;
      self->_obscuredInsetsWhenSaved.m_sides.__elems_[2] = v8;
      self->_obscuredInsetsWhenSaved.m_sides.__elems_[3] = v7;
      self->_float scaleToRestore = a6;
    }
  }
}

- (void)_restorePageStateToUnobscuredCenter:(optional<WebCore:(double)a4 :FloatPoint>)a3 scale:
{
  BOOL engaged = a3.__engaged_;
  $541F38E9D169863A2E95E92C2F796FD9 var0 = a3.var0;
  if ([(WKWebView *)self _shouldDeferGeometryUpdates])
  {
    if (self)
    {
      CFRetain(self);
      CFRetain(self);
    }
    p_callbacksDeferredDuringReCGSize size = &self->_callbacksDeferredDuringResize;
    m_CGSize size = self->_callbacksDeferredDuringResize.m_size;
    if (m_size == self->_callbacksDeferredDuringResize.m_capacity)
    {
      unint64_t v12 = m_size + (m_size >> 2);
      if (v12 >= 0x10) {
        unint64_t v13 = v12 + 1;
      }
      else {
        unint64_t v13 = 16;
      }
      if (v13 <= m_size + 1) {
        unint64_t v14 = m_size + 1;
      }
      else {
        unint64_t v14 = v13;
      }
      WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)p_callbacksDeferredDuringResize, v14);
      m_CGSize size = self->_callbacksDeferredDuringResize.m_size;
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      uint64_t v16 = WTF::fastMalloc((WTF *)0x28);
    }
    else
    {
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      uint64_t v16 = WTF::fastMalloc((WTF *)0x28);
    }
    *(void *)uint64_t v16 = &unk_1EE9CD5A0;
    *(void *)(v16 + 8) = self;
    *($541F38E9D169863A2E95E92C2F796FD9 *)(v16 + 16) = var0;
    *(unsigned char *)(v16 + 24) = engaged;
    *(_DWORD *)(v16 + 25) = *(_DWORD *)v17;
    *(_DWORD *)(v16 + 28) = *(_DWORD *)&v17[3];
    *(double *)(v16 + 32) = a4;
    m_buffer[m_size] = v16;
    ++self->_callbacksDeferredDuringResize.m_size;
    CFRelease(self);
  }
  else if ([(WKWebView *)self usesStandardContentView])
  {
    uint64_t v8 = *((void *)self->_page.m_ptr + 29);
    if (*(unsigned char *)(v8 + 36))
    {
      __break(0xC471u);
    }
    else
    {
      unint64_t v9 = *(void *)(v8 + 104) + 1;
      if (!self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_) {
        self->_perProcessState.firstTransactionIDAfterPageRestore.__engaged_ = 1;
      }
      self->_perProcessState.firstTransactionIDAfterPageRestore.var0.__val_.unint64_t m_identifier = v9;
      self->_perProcessState.unobscuredCenterToRestore.$541F38E9D169863A2E95E92C2F796FD9 var0 = var0;
      self->_perProcessState.unobscuredCenterToRestore.__engaged_ = engaged;
      self->_float scaleToRestore = a4;
    }
  }
}

- (RefPtr<WebKit::ViewSnapshot,)_takeViewSnapshot
{
  CGFloat v4 = v2;
  WebCore::screenScaleFactor(0, (UIScreen *)a2);
  float v6 = v5;
  [(WKWebView *)self bounds];
  v30.double m11 = v7;
  v30.m12 = v8;
  v30.m13 = v9;
  v30.m14 = v10;
  CGFloat v11 = (WebCore::IOSurface *)WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v31, (const CGSize *)&v30.m13);
  float v12 = v6 * v32;
  float v31 = v6 * v31;
  float v32 = v6 * v32;
  if (v31 > 0.0
    && v12 > 0.0
    && (memset(&v30, 0, sizeof(v30)),
        CATransform3DMakeScale(&v30, v6, v6, 1.0),
        unint64_t v14 = (WebCore::DestinationColorSpace *)WebCore::screenSupportsExtendedColor(0, v13),
        WebCore::DestinationColorSpace::SRGB(v14),
        CGFloat v11 = (WebCore::IOSurface *)WebCore::IOSurface::create(),
        v29))
  {
    objc_msgSend((id)objc_msgSend((id)-[WKWebView layer](self, "layer"), "context"), "contextId");
    [(WKWebView *)self layer];
    CARenderServerRenderLayerWithTransform();
    if (WebCore::IOSurface::allowConversionFromFormatToFormat())
    {
      char v27 = 0;
      WebKit::ViewSnapshot::create(&v27, &v28);
      if (v27)
      {
        WebCore::IOSurface::~IOSurface(v27);
        WTF::fastFree(v21, v22);
      }
      long long v15 = v28;
      ++*(_DWORD *)v28;
      uint64_t v16 = (void *)WTF::fastMalloc((WTF *)0x10);
      *uint64_t v16 = &unk_1EE9CD5C8;
      v16[1] = v15;
      __int16 v26 = v16;
      WebCore::IOSurface::convertToFormat();
      uint64_t v17 = v26;
      __int16 v26 = 0;
      if (v17) {
        (*(void (**)(void *))(*v17 + 8))(v17);
      }
      void *v4 = v15;
    }
    else
    {
      unint64_t v18 = v29;
      long long v29 = 0;
      uint64_t v25 = v18;
      WebKit::ViewSnapshot::create(&v25, &v28);
      void *v4 = v28;
      if (v25)
      {
        WebCore::IOSurface::~IOSurface(v25);
        WTF::fastFree(v23, v24);
      }
    }
    CGFloat v11 = v29;
    long long v29 = 0;
    if (v11)
    {
      WebCore::IOSurface::~IOSurface(v11);
      return (RefPtr<WebKit::ViewSnapshot, WTF::RawPtrTraits<WebKit::ViewSnapshot>, WTF::DefaultRefDerefTraits<WebKit::ViewSnapshot>>)WTF::fastFree(v19, v20);
    }
  }
  else
  {
    void *v4 = 0;
  }
  return (RefPtr<WebKit::ViewSnapshot, WTF::RawPtrTraits<WebKit::ViewSnapshot>, WTF::DefaultRefDerefTraits<WebKit::ViewSnapshot>>)v11;
}

- (void)_zoomToCenter:(FloatPoint)a3 atScale:(double)a4 animated:(BOOL)a5 honorScrollability:(BOOL)a6
{
  BOOL v6 = a6;
  m_CGFloat y = a3.m_y;
  m_CGFloat x = a3.m_x;
  float v12 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v12)
  {
    [v12 affineTransform];
    double v14 = v35[0];
  }
  else
  {
    double v14 = 0.0;
  }
  if (v14 == a4) {
    goto LABEL_6;
  }
  double v16 = vabdd_f64(a4, v14);
  double v17 = fabs(a4);
  BOOL v18 = v17 < 1.0 && v17 * 1.79769313e308 < v16;
  if (v18
    || (v17 * 2.22507386e-308 > v16 ? (BOOL v19 = v17 <= 1.0) : (BOOL v19 = 1),
        v19 && v16 / v17 > 2.22044605e-16
     || (double v20 = fabs(v14), v20 < 1.0) && v20 * 1.79769313e308 < v16
     || (v20 * 2.22507386e-308 > v16 ? (BOOL v21 = v20 <= 1.0) : (BOOL v21 = 1),
         (double v13 = v16 / v20, v21) ? (v22 = v13 > 2.22044605e-16) : (v22 = 0),
         v22)))
  {
    m_ptr = self->_page.m_ptr;
    uint64_t v24 = *((void *)m_ptr + 32);
    LOBYTE(v35[0]) = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WillStartUserTriggeredZooming>(v24, (uint64_t)v35, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
    char v15 = 0;
  }
  else
  {
LABEL_6:
    if (v6 && ![self->_scrollView.m_ptr isScrollEnabled]) {
      return;
    }
    char v15 = 1;
  }
  objc_msgSend(self->_scrollView.m_ptr, "bounds", v13);
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  double v29 = CGRectGetWidth(v36) / a4;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  double v30 = CGRectGetHeight(v37) / a4;
  if (a5)
  {
    if (v15)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __82__WKWebView_WKViewInternalIOS___zoomToCenter_atScale_animated_honorScrollability___block_invoke;
      v34[3] = &unk_1E5812A80;
      v34[4] = self;
      *(double *)&v34[5] = m_x - v29 * 0.5;
      *(double *)&v34[6] = m_y - v30 * 0.5;
      *(double *)&v34[7] = v29;
      *(double *)&v34[8] = v30;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v34 animations:0.25];
      return;
    }
    float v31 = self->_scrollView.m_ptr;
    double v32 = v29;
    uint64_t v33 = 1;
  }
  else
  {
    float v31 = self->_scrollView.m_ptr;
    double v32 = v29;
    uint64_t v33 = 0;
  }
  objc_msgSend(v31, "zoomToRect:animated:", v33, m_x - v29 * 0.5, m_y - v30 * 0.5, v32);
}

uint64_t __82__WKWebView_WKViewInternalIOS___zoomToCenter_atScale_animated_honorScrollability___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 624), "zoomToRect:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_zoomToRect:(FloatRect)a3 atScale:(double)a4 origin:(FloatPoint)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  m_CGFloat y = a5.m_y;
  m_double x = a5.m_x;
  m_CGFloat height = a3.m_size.m_height;
  m_CGFloat width = a3.m_size.m_width;
  float v32 = a3.m_location.m_y;
  float v33 = a3.m_location.m_x;
  CGFloat v9 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v9)
  {
    [v9 affineTransform];
    double x = v40.origin.x;
  }
  else
  {
    double x = 0.0;
  }
  double v11 = x / a4;
  [(WKWebView *)self bounds];
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", [(WKWebView *)self _currentContentView], v12, v13, v14, v15);
  v40.origin.double x = v16;
  v40.origin.CGFloat y = v17;
  v40.size.CGFloat width = v18;
  v40.size.CGFloat height = v19;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v39, &v40);
  [(WKWebView *)self _contentRectForUserInteraction];
  v40.origin.double x = v20;
  v40.origin.CGFloat y = v21;
  v40.size.CGFloat width = v22;
  v40.size.CGFloat height = v23;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v37, &v40);
  float v24 = v11;
  float32x2_t v25 = vmul_n_f32(vsub_f32(v37, v39[0]), v24);
  float32x2_t v26 = vmul_n_f32(vsub_f32(vadd_f32(v39[0], v39[1]), vadd_f32(v37, v38)), v24);
  float32x2_t v27 = vmul_n_f32(v38, v24);
  float32x2_t v28 = vsub_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(LODWORD(m_height), LODWORD(m_width)), v27), (int8x8_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(m_y), LODWORD(m_x)), vmul_f32(v27, (float32x2_t)0x3F0000003F000000)), (int8x8_t)vsub_f32((float32x2_t)__PAIR64__(LODWORD(v32), LODWORD(v33)), vmul_f32(vsub_f32(v27, (float32x2_t)__PAIR64__(LODWORD(m_height), LODWORD(m_width))), (float32x2_t)0x3F0000003F000000))), v25);
  float32x2_t v29 = vadd_f32(v25, v26);
  double v30 = COERCE_DOUBLE(vadd_f32(v28, vmul_f32(vadd_f32(v27, v29), (float32x2_t)0x3F0000003F000000)));
  v29.i32[0] = HIDWORD(v30);
  -[WKWebView _zoomToCenter:atScale:animated:honorScrollability:](self, "_zoomToCenter:atScale:animated:honorScrollability:", v6, 1, v30, *(double *)&v29, a4);
}

- (void)_scrollToContentScrollPosition:(FloatPoint)a3 scrollOrigin:(IntPoint)a4 animated:(BOOL)a5
{
  IntPoint v36 = a4;
  p_perProcessState = &self->_perProcessState;
  if (self->_perProcessState.commitDidRestoreScrollPosition) {
    return;
  }
  BOOL v6 = a5;
  m_CGFloat y = a3.m_y;
  m_double x = a3.m_x;
  if ([(WKWebView *)self _shouldDeferGeometryUpdates]) {
    return;
  }
  uint64_t v8 = *(void *)(*(void *)(*((void *)self->_page.m_ptr + 31) + 24) + 16);
  if ((!v8 || *(unsigned char *)(v8 + 250) == 1 && *(unsigned char *)(v8 + 251) == 1)
    && ([self->_scrollView.m_ptr zoomScale],
        float v10 = v9,
        double v11 = (WebKit *)[self->_scrollView.m_ptr minimumZoomScale],
        float v13 = v12,
        !WebKit::scalesAreEssentiallyEqual(v11, v10, v13)))
  {
    [(WKWebView *)self _scheduleForcedVisibleContentRectUpdate];
  }
  else
  {
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v37, &v36);
    double v14 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
    if (v14) {
      [v14 affineTransform];
    }
    WebCore::FloatPoint::operator CGPoint();
    -[WKWebView _contentOffsetAdjustedForObscuredInset:](self, "_contentOffsetAdjustedForObscuredInset:");
    contentOffsetBoundedInValidRange((UIScrollView *)self->_scrollView.m_ptr, v40);
    double v16 = v15;
    double v18 = v17;
    objc_msgSend(self->_scrollView.m_ptr, "_wk_stopScrollingAndZooming");
    [self->_scrollView.m_ptr contentOffset];
    if (v16 != v19 || v18 != v20)
    {
      if (m_x == 0.0)
      {
        BOOL v22 = 1;
      }
      else
      {
        float v26 = fabsf(m_x);
        if (v26 >= 1.0 || (float)(v26 * 3.4028e38) >= v26)
        {
          BOOL v31 = v26 <= 1.0;
          if ((float)(v26 * 1.1755e-38) <= v26) {
            BOOL v31 = 1;
          }
          float v27 = m_y;
          if ((float)(m_x / m_x) > 0.00000011921 && v31)
          {
            BOOL v22 = 0;
          }
          else
          {
            float v33 = v26 / 0.0;
            if (m_x < 0.0) {
              float v33 = 3.4028e38;
            }
            if (m_x > 0.0) {
              float v33 = 3.4028e38;
            }
            BOOL v22 = v33 <= 0.00000011921;
          }
          goto LABEL_24;
        }
        BOOL v22 = 0;
      }
      float v27 = m_y;
LABEL_24:
      if (v19 >= 0.0 || !v22) {
        double v19 = v16;
      }
      if (v27 == 0.0)
      {
        BOOL v28 = 1;
      }
      else
      {
        float v29 = fabsf(v27);
        if (v29 < 1.0 && (float)(v29 * 3.4028e38) < v29) {
          goto LABEL_34;
        }
        BOOL v30 = v29 <= 1.0;
        if ((float)(v29 * 1.1755e-38) <= v29) {
          BOOL v30 = 1;
        }
        if ((float)(v27 / v27) > 0.00000011921 && v30)
        {
LABEL_34:
          BOOL v28 = 0;
        }
        else
        {
          float v32 = v29 / 0.0;
          if (v27 < 0.0) {
            float v32 = 3.4028e38;
          }
          if (v27 > 0.0) {
            float v32 = 3.4028e38;
          }
          BOOL v28 = v32 <= 0.00000011921;
        }
      }
      if (!v28 || v20 >= 0.0) {
        double v20 = v18;
      }
      objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:animated:", v6, v19, v20);
      return;
    }
    if (!p_perProcessState->didDeferUpdateVisibleContentRectsForAnyReason)
    {
      m_ptr = self->_page.m_ptr;
      uint64_t v24 = *((void *)m_ptr + 32);
      uint64_t v25 = *((void *)m_ptr + 4);
      uint64_t v38 = *(void *)(v25 + 1928);
      v37[0] = &v38;
      v37[1] = v25 + 2280;
      WebKit::AuxiliaryProcessProxy::send<Messages::ViewUpdateDispatcher::VisibleContentRectUpdate>(v24, (uint64_t)v37, 0, 0);
    }
  }
}

- (float)_adjustScrollRectToAvoidHighlightOverlay:(FloatRect)a3
{
  FloatRect v40 = a3;
  CGFloat v4 = (void *)*((void *)self->_page.m_ptr + 173);
  if (v4)
  {
    [v4 visibleFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  -[WKWebView convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "screen"), "coordinateSpace"), v6, v8, v10, v12);
  v36.origin.double x = v13;
  v36.origin.CGFloat y = v14;
  v36.size.CGFloat width = v15;
  v36.size.CGFloat height = v16;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v37, &v36);
  WebCore::FloatRect::operator CGRect();
  float v17 = 0.0;
  if (!CGRectIsNull(v41))
  {
    __asm { FMOV            V1.2S, #5.0 }
    float32x2_t v39 = vadd_f32(v39, _D1);
    if (WebCore::FloatRect::intersects((WebCore::FloatRect *)&v40, (const WebCore::FloatRect *)v37))
    {
      double v23 = v38;
      [(WKWebView *)self bounds];
      float v25 = v23 - v24;
      [(WKWebView *)self bounds];
      double v27 = v26;
      [(WKWebView *)self bounds];
      *(float *)&double v27 = v27 + v28 - (float)(v38 + v39.f32[1]);
      [(WKWebView *)self center];
      float v30 = v29;
      [(WKWebView *)self bounds];
      double v31 = v30;
      double v33 = v32 + (float)(*(float *)&v27 * 0.5);
      double v34 = v32 + (float)(v25 * 0.5);
      if (v25 <= *(float *)&v27)
      {
        double v34 = v30;
        double v31 = v33;
      }
      return v31 - v34;
    }
  }
  return v17;
}

- (BOOL)_scrollToRect:(FloatRect)a3 origin:(FloatPoint)a4 minimumScrollDistance:(float)a5
{
  m_CGFloat y = a4.m_y;
  m_float x = a4.m_x;
  m_CGFloat height = a3.m_size.m_height;
  m_CGFloat width = a3.m_size.m_width;
  float v10 = a3.m_location.m_y;
  float v11 = a3.m_location.m_x;
  if (![self->_scrollView.m_ptr isScrollEnabled]) {
    return 0;
  }
  float v63 = a5;
  [(WKWebView *)self _contentRectForUserInteraction];
  v74.origin.float x = v13;
  v74.origin.CGFloat y = v14;
  v74.size.CGFloat width = v15;
  v74.size.CGFloat height = v16;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v72, &v74);
  float v17 = *(float *)v72;
  float v64 = *(float *)&v72[1];
  objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "bounds");
  v74.origin.float x = v18;
  v74.origin.CGFloat y = v19;
  v74.size.CGFloat width = v20;
  v74.size.CGFloat height = v21;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v71, &v74.size);
  [self->_scrollView.m_ptr adjustedContentInset];
  double v23 = v22;
  float v25 = v24;
  float v26 = -v25;
  float v27 = v23;
  float v28 = -v27;
  *(float *)&unint64_t v70 = -v25;
  *((float *)&v70 + 1) = -v27;
  if (self->_haveSetObscuredInsets)
  {
    float left = self->_obscuredInsets.left;
    float top = self->_obscuredInsets.top;
    *(float *)&unint64_t v70 = left - v25;
    *((float *)&v70 + 1) = top - v27;
    v74.origin.float x = 0.0;
    WebCore::FloatPoint::constrainedBetween((WebCore::FloatPoint *)&v70, (const WebCore::FloatPoint *)&v70, (const WebCore::FloatPoint *)&v74);
    unint64_t v70 = __PAIR64__(LODWORD(v28), LODWORD(v26));
  }
  unint64_t v67 = __PAIR64__(LODWORD(v28), LODWORD(v26));
  float x = 0.0;
  if (m_width <= v73.f32[0]) {
    float v32 = m_width;
  }
  else {
    float v32 = 0.0;
  }
  float v33 = v73.f32[0] - v32;
  if (m_width <= v73.f32[0]) {
    float v34 = v11;
  }
  else {
    float v34 = m_x;
  }
  float v35 = v34 - (float)(v33 * 0.5);
  if (m_height <= v73.f32[1]) {
    float v36 = m_height;
  }
  else {
    float v36 = 0.0;
  }
  float v37 = v73.f32[1] - v36;
  if (m_height <= v73.f32[1]) {
    float v38 = v10;
  }
  else {
    float v38 = m_y;
  }
  *(float *)&v74.origin.float x = v35;
  *((float *)&v74.origin.x + 1) = v38 - (float)(v37 * 0.5);
  float32x2_t v66 = vsub_f32(v71, v73);
  WebCore::FloatPoint::constrainedBetween((WebCore::FloatPoint *)&v74, (const WebCore::FloatPoint *)&v67, (const WebCore::FloatPoint *)&v66);
  if (v17 == v39 && v64 == v40)
  {
    unint64_t v67 = v70;
    if (m_width > v73.f32[0]) {
      float v39 = m_x - (float)(0.5 * v73.f32[0]);
    }
    float v41 = m_y - vmuls_lane_f32(0.5, v73, 1);
    if (m_height > v73.f32[1]) {
      float v40 = v41;
    }
    *(void *)&v74.origin.float x = __PAIR64__(LODWORD(v40), LODWORD(v39));
    float32x2_t v66 = vsub_f32(v71, v73);
    WebCore::FloatPoint::constrainedBetween((WebCore::FloatPoint *)&v74, (const WebCore::FloatPoint *)&v67, (const WebCore::FloatPoint *)&v66);
  }
  float v42 = v39 - v17;
  float v43 = v40 - v64;
  CGRect v44 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v44)
  {
    [v44 affineTransform];
    float x = v74.origin.x;
  }
  float v45 = v42 * x;
  float v46 = v43 * x;
  float v47 = hypotf(v45, v46);
  unint64_t v67 = __PAIR64__(LODWORD(v10), LODWORD(v11));
  float v68 = m_width;
  float v69 = m_height;
  WebCore::FloatRect::operator CGRect();
  -[WKWebView convertRect:fromView:](self, "convertRect:fromView:", [(WKWebView *)self _currentContentView], v48, v49, v50, v51);
  v74.origin.float x = v52;
  v74.origin.CGFloat y = v53;
  v74.size.CGFloat width = v54;
  v74.size.CGFloat height = v55;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v66, &v74);
  v66.f32[0] = v66.f32[0] - v45;
  v66.f32[1] = v66.f32[1] - v46;
  -[WKWebView _adjustScrollRectToAvoidHighlightOverlay:](self, "_adjustScrollRectToAvoidHighlightOverlay:");
  BOOL v57 = v47 >= v63;
  if (v47 >= v63)
  {
    float v58 = v46 + v56;
    [self->_contentView.m_ptr willStartZoomOrScroll];
    m_ptr = self->_scrollView.m_ptr;
    [m_ptr contentOffset];
    v74.origin.float x = v60;
    v74.origin.CGFloat y = v61;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v65, &v74.origin);
    v65[2] = (float)(v45 + 0.0) + v65[0];
    v65[3] = v58 + v65[1];
    WebCore::FloatPoint::operator CGPoint();
    objc_msgSend(m_ptr, "setContentOffset:animated:", 1);
  }
  return v57;
}

- (void)_zoomOutWithOrigin:(FloatPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  m_CGFloat y = a3.m_y;
  m_float x = a3.m_x;
  [self->_scrollView.m_ptr minimumZoomScale];
  double v8 = v9;
  *(float *)&double v9 = m_x;
  *(float *)&double v10 = m_y;

  -[WKWebView _zoomToCenter:atScale:animated:honorScrollability:](self, "_zoomToCenter:atScale:animated:honorScrollability:", v4, 1, v9, v10, v8);
}

- (void)_zoomToInitialScaleWithOrigin:(FloatPoint)a3 animated:(BOOL)a4
{
}

- (BOOL)_selectionRectIsFullyVisibleAndNonEmpty
{
  float v3 = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates((WebKit::WebPageProxy *)self->_page.m_ptr);
  BOOL result = 0;
  if (v5 > 0.0 && v6 > 0.0)
  {
    [(WKWebView *)self _contentRectForUserInteraction];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    WebCore::FloatRect::operator CGRect();
    v21.origin.float x = v16;
    v21.origin.CGFloat y = v17;
    v21.size.CGFloat width = v18;
    v21.size.CGFloat height = v19;
    v20.origin.float x = v9;
    v20.origin.CGFloat y = v11;
    v20.size.CGFloat width = v13;
    v20.size.CGFloat height = v15;
    return CGRectContainsRect(v20, v21);
  }
  return result;
}

- (void)_scrollToAndRevealSelectionIfNeeded
{
  if ([self->_scrollView.m_ptr isScrollEnabled])
  {
    float v33 = WebKit::WebPageProxy::selectionBoundingRectInRootViewCoordinates((WebKit::WebPageProxy *)self->_page.m_ptr)
        + -4.0;
    float v34 = v4 + -4.0;
    float v35 = (float)(v3 + 4.0) + 4.0;
    float v36 = (float)(v5 + 4.0) + 4.0;
    [self->_contentView.m_ptr bounds];
    v37.origin.double x = v6;
    v37.origin.CGFloat y = v7;
    v37.size.CGFloat width = v8;
    v37.size.CGFloat height = v9;
    WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v29, &v37);
    WebCore::FloatRect::intersect((WebCore::FloatRect *)&v33, (const WebCore::FloatRect *)&v29);
    if (v35 > 0.0)
    {
      *(float *)&double v10 = v36;
      if (v36 > 0.0)
      {
        [(WKWebView *)self _contentRectForUserInteraction];
        v37.origin.double x = v11;
        v37.origin.CGFloat y = v12;
        v37.size.CGFloat width = v13;
        v37.size.CGFloat height = v14;
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v29, &v37);
        float v15 = v30 + v32;
        float v16 = v34 + v36;
        double v17 = (float)(v34 - v30);
        if (v30 <= v34) {
          double v17 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        }
        BOOL v18 = v15 < v16;
        double v19 = (float)(v16 - v15);
        if (v18) {
          double v20 = v19;
        }
        else {
          double v20 = v17;
        }
        float v21 = v29 + v31;
        float v22 = v33 + v35;
        double v23 = (float)(v33 - v29);
        if (v29 <= v33) {
          double v23 = *MEMORY[0x1E4F1DB30];
        }
        if (v21 < v22) {
          double v24 = (float)(v22 - v21);
        }
        else {
          double v24 = v23;
        }
        if (v24 != *MEMORY[0x1E4F1DB30] || v20 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
        {
          float v25 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
          if (v25)
          {
            [v25 affineTransform];
            double x = v37.origin.x;
          }
          else
          {
            double x = 0.0;
          }
          [self->_scrollView.m_ptr contentOffset];
          objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:animated:", 1, v27 + v24 * x, v28 + v20 * x);
        }
      }
    }
  }
}

- (void)_zoomToFocusRect:(const FloatRect *)a3 selectionRect:(const FloatRect *)a4 fontSize:(float)a5 minimumScale:(double)a6 maximumScale:(double)a7 allowScaling:(BOOL)a8 forceScroll:(BOOL)a9
{
  BOOL v9 = a9;
  BOOL v10 = a8;
  CGFloat v14 = (void *)[self->_scrollView.m_ptr window];
  [(WKWebView *)self bounds];
  p_obscuredInsets = &self->_obscuredInsets;
  double top = self->_obscuredInsets.top;
  double left = self->_obscuredInsets.left;
  CGFloat v19 = v18 + left;
  CGFloat v21 = v20 + top;
  CGFloat v23 = v22 - (left + self->_obscuredInsets.right);
  CGFloat v25 = v24 - (top + self->_obscuredInsets.bottom);
  [v14 bounds];
  objc_msgSend(v14, "convertRect:toView:", self);
  v146.origin.CGFloat x = v26;
  v146.origin.CGFloat y = v27;
  v146.size.CGFloat width = v28;
  v146.size.CGFloat height = v29;
  double v119 = v21;
  rect1.origin.CGFloat x = v19;
  v126.origin.CGFloat x = v19;
  v126.origin.CGFloat y = v21;
  v126.size.CGFloat width = v23;
  v126.size.CGFloat height = v25;
  CGRect v127 = CGRectIntersection(v126, v146);
  CGFloat x = v127.origin.x;
  CGFloat y = v127.origin.y;
  CGFloat width = v127.size.width;
  CGFloat height = v127.size.height;
  objc_msgSend(v14, "convertRect:toView:", self, self->_inputViewBoundsInWindow.origin.x, self->_inputViewBoundsInWindow.origin.y, self->_inputViewBoundsInWindow.size.width, self->_inputViewBoundsInWindow.size.height);
  v147.origin.CGFloat x = v34;
  v147.origin.CGFloat y = v35;
  v147.size.CGFloat width = v36;
  v147.size.CGFloat height = v37;
  v128.origin.CGFloat x = x;
  CGFloat rect = y;
  v128.origin.CGFloat y = y;
  rect1.origin.CGFloat y = width;
  v128.size.CGFloat width = width;
  v128.size.CGFloat height = height;
  CGRect v129 = CGRectIntersection(v128, v147);
  CGFloat v38 = v129.origin.x;
  CGFloat v39 = v129.origin.y;
  CGFloat v40 = v129.size.width;
  CGFloat v41 = v129.size.height;
  IsEmptCGFloat y = CGRectIsEmpty(v129);
  double v43 = 0.0;
  *(double *)&uint64_t v44 = 0.0;
  double v45 = 0.0;
  rect1.size.CGFloat width = height;
  if (!IsEmpty)
  {
    v130.origin.CGFloat x = v38;
    v130.origin.CGFloat y = v39;
    v130.size.CGFloat width = v40;
    v130.size.CGFloat height = v41;
    rect1.size.CGFloat width = CGRectGetMinY(v130);
    v131.origin.CGFloat x = x;
    v131.origin.CGFloat y = rect;
    v131.size.CGFloat width = rect1.origin.y;
    v131.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v131);
    CGFloat v47 = x;
    double v48 = rect1.size.width - MinY;
    rect1.size.CGFloat width = v47;
    v132.origin.CGFloat x = v47;
    v132.origin.CGFloat y = rect;
    v132.size.CGFloat width = rect1.origin.y;
    v132.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v132);
    v133.origin.CGFloat x = v38;
    v133.origin.CGFloat y = v39;
    v133.size.CGFloat width = v40;
    v133.size.CGFloat height = v41;
    double v50 = MaxY - CGRectGetMaxY(v133);
    if (v48 >= 106.0 || v50 < v48)
    {
      rect1.size.CGFloat width = v48;
      *(double *)&uint64_t v44 = 50.0;
      double v45 = 0.0;
    }
    else
    {
      v134.origin.CGFloat x = v38;
      v134.origin.CGFloat y = v39;
      v134.size.CGFloat width = v40;
      v134.size.CGFloat height = v41;
      double v52 = CGRectGetMaxY(v134);
      v135.origin.CGFloat x = rect1.size.width;
      v135.origin.CGFloat y = rect;
      v135.size.CGFloat width = rect1.origin.y;
      v135.size.CGFloat height = height;
      double v45 = v52 - CGRectGetMinY(v135);
      *(double *)&uint64_t v44 = 0.0;
      rect1.size.CGFloat width = v50;
    }
    double v43 = 0.0;
  }
  double v53 = *(double *)&v44;
  CGFloat v54 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v54)
  {
    [v54 affineTransform];
    double v43 = v125.origin.x;
  }
  double recta = v43;
  if (v10)
  {
    double v55 = 16.0 / a5;
    double v56 = a6;
    if (v55 > a6) {
      double v56 = 16.0 / a5;
    }
    if (v55 >= a7) {
      double v43 = a7;
    }
    else {
      double v43 = v56;
    }
  }
  [self->_contentView.m_ptr bounds];
  double v58 = round(v43 * v57) / v57;
  FloatRect v124 = *a3;
  float v59 = v58;
  WebCore::FloatRect::scale((WebCore::FloatRect *)&v124, v59, v59);
  [self->_contentView.m_ptr frame];
  v125.origin.CGFloat x = v60;
  v125.origin.CGFloat y = v61;
  v125.size.CGFloat width = v62;
  v125.size.CGFloat height = v63;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v123, &v125.origin);
  v124.m_NSUInteger location = (FloatPoint)vadd_f32(v123[0], (float32x2_t)v124.m_location);
  BOOL isZero = WebCore::FloatSize::isZero((WebCore::FloatSize *)&a4->m_size);
  if (v9 && ![self->_contentView.m_ptr _shouldAvoidScrollingWhenFocusedContentIsVisible]) {
    goto LABEL_22;
  }
  WebCore::FloatRect::operator CGRect();
  -[WKWebView convertRect:fromView:](self, "convertRect:fromView:", self->_contentView.m_ptr);
  v148.origin.CGFloat x = v65;
  v148.origin.CGFloat y = v66;
  v148.size.CGFloat width = v67;
  v148.size.CGFloat height = v68;
  v136.origin.CGFloat x = rect1.origin.x;
  v136.origin.CGFloat y = v119 + v45;
  v136.size.CGFloat width = rect1.origin.y;
  v136.size.CGFloat height = rect1.size.width - v53;
  if (!CGRectContainsRect(v136, v148))
  {
    if (isZero) {
      goto LABEL_22;
    }
    WebCore::FloatRect::operator CGRect();
    -[WKWebView convertRect:fromView:](self, "convertRect:fromView:", self->_contentView.m_ptr);
    v149.origin.CGFloat x = v69;
    v149.origin.CGFloat y = v70;
    v149.size.CGFloat width = v71;
    v149.size.CGFloat height = v72;
    v137.origin.CGFloat x = rect1.origin.x;
    v137.origin.CGFloat y = v119 + v45;
    v137.size.CGFloat width = rect1.origin.y;
    v137.size.CGFloat height = rect1.size.width - v53;
    if (!CGRectContainsRect(v137, v149))
    {
LABEL_22:
      rect1.origin.CGFloat x = v58;
      double v73 = v45;
      double v74 = (rect1.origin.y - v124.m_size.m_width) * 0.5;
      double v75 = rect1.size.width - v124.m_size.m_height;
      [self->_scrollView.m_ptr adjustedContentInset];
      double v77 = v76;
      double v79 = v78;
      [self->_scrollView.m_ptr contentOffset];
      if (self->_haveSetObscuredInsets)
      {
        double v80 = v80 + self->_obscuredInsets.left;
        double v81 = v81 + p_obscuredInsets->top;
      }
      double v82 = v75 * 0.5;
      if (v74 <= 0.0)
      {
        double v84 = -v79;
        if (v124.m_location.m_x + rect1.origin.y * -0.5 > -v79) {
          double v84 = v124.m_location.m_x + rect1.origin.y * -0.5;
        }
        if (v80 > v84) {
          double v84 = v80;
        }
        if (v80 >= v124.m_location.m_x) {
          m_CGFloat x = v124.m_location.m_x;
        }
        else {
          m_CGFloat x = v84;
        }
      }
      else
      {
        m_CGFloat x = v124.m_location.m_x - v74;
      }
      double v120 = m_x;
      if (v82 <= 0.0)
      {
        m_CGFloat y = -v77;
        if (v124.m_location.m_y + rect1.size.width * -0.5 > -v77) {
          m_CGFloat y = v124.m_location.m_y + rect1.size.width * -0.5;
        }
        if (v81 > m_y) {
          m_CGFloat y = v81;
        }
        if (v81 >= v124.m_location.m_y) {
          m_CGFloat y = v124.m_location.m_y;
        }
      }
      else
      {
        m_CGFloat y = v124.m_location.m_y - v82;
      }
      double v86 = m_y - v73;
      [self->_contentView.m_ptr bounds];
      v125.origin.CGFloat x = v87;
      v125.origin.CGFloat y = v88;
      v125.size.CGFloat width = v89;
      v125.size.CGFloat height = v90;
      WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v123, &v125);
      WebCore::FloatRect::scale((WebCore::FloatRect *)v123, v59, v59);
      [self->_contentView.m_ptr frame];
      v125.origin.CGFloat x = v91;
      v125.origin.CGFloat y = v92;
      v125.size.CGFloat width = v93;
      v125.size.CGFloat height = v94;
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v122, &v125.origin);
      v123[0] = vadd_f32((float32x2_t)v122.m_location, v123[0]);
      WebCore::FloatRect::operator CGRect();
      double v95 = CGRectGetMaxX(v138) - rect1.origin.y;
      WebCore::FloatRect::operator CGRect();
      double v96 = CGRectGetMaxY(v139) - rect1.size.width;
      if (isZero)
      {
        double v97 = -INFINITY;
        double v98 = -INFINITY;
      }
      else
      {
        FloatRect v122 = *a4;
        WebCore::FloatRect::scale((WebCore::FloatRect *)&v122, v59, v59);
        [self->_contentView.m_ptr frame];
        v125.origin.CGFloat x = v99;
        v125.origin.CGFloat y = v100;
        v125.size.CGFloat width = v101;
        v125.size.CGFloat height = v102;
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&rect1.size.height, &v125.origin);
        v122.m_NSUInteger location = (FloatPoint)vadd_f32(*(float32x2_t *)&rect1.size.height, (float32x2_t)v122.m_location);
        WebCore::FloatRect::operator CGRect();
        double v97 = CGRectGetMaxX(v140) + 8.0 - rect1.origin.y;
        WebCore::FloatRect::operator CGRect();
        double v98 = CGRectGetMaxY(v141) + 8.0 - rect1.size.width - v73;
        WebCore::FloatRect::operator CGRect();
        double v103 = CGRectGetMinX(v142) + -8.0;
        if (v103 < v95) {
          double v95 = v103;
        }
        WebCore::FloatRect::operator CGRect();
        double v104 = CGRectGetMinY(v143) + -8.0 - v73;
        if (v104 < v96) {
          double v96 = v104;
        }
      }
      if (v120 > v97) {
        double v105 = v120;
      }
      else {
        double v105 = v97;
      }
      if (v120 >= v95) {
        double v106 = v95;
      }
      else {
        double v106 = v105;
      }
      if (v86 > v98) {
        double v107 = v86;
      }
      else {
        double v107 = v98;
      }
      if (v86 >= v96) {
        double v108 = v96;
      }
      else {
        double v108 = v107;
      }
      if (self->_haveSetObscuredInsets)
      {
        double v106 = v106 - self->_obscuredInsets.left;
        double v108 = v108 - p_obscuredInsets->top;
      }
      [(WKWebView *)self bounds];
      CGFloat v109 = v106 + CGRectGetWidth(v144) * 0.5;
      [(WKWebView *)self bounds];
      CGFloat v110 = CGRectGetHeight(v145);
      v125.origin.CGFloat x = v109;
      v125.origin.CGFloat y = v108 + v110 * 0.5;
      WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v122, &v125.origin);
      if (rect1.origin.x != recta)
      {
        m_ptr = self->_page.m_ptr;
        uint64_t v112 = *((void *)m_ptr + 32);
        LOBYTE(v125.origin.x) = 0;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WillStartUserTriggeredZooming>(v112, (uint64_t)&v125, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
      }
      float v113 = 1.0 / rect1.origin.x;
      v122.m_location.m_CGFloat x = v122.m_location.m_x * v113;
      v122.m_location.m_CGFloat y = v122.m_location.m_y * v113;
      -[WKWebView _zoomToCenter:atScale:animated:honorScrollability:](self, "_zoomToCenter:atScale:animated:honorScrollability:", 1, 0);
    }
  }
}

- (double)_initialScaleFactor
{
  return self->_perProcessState.initialScaleFactor;
}

- (double)_contentZoomScale
{
  uint64_t v2 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (!v2) {
    return 0.0;
  }
  [v2 affineTransform];
  return v4;
}

- (double)_targetContentZoomScaleForRect:(const FloatRect *)a3 currentScale:(double)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7
{
  [(WKWebView *)self _contentRectForUserInteraction];
  v20.CGFloat width = v9;
  v20.CGFloat height = v10;
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v21, &v20);
  float64x2_t v11 = vdivq_f64(vmulq_n_f64(vcvtq_f64_f32(v21), a4), vcvtq_f64_f32((float32x2_t)a3->m_size));
  float64x2_t v12 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a6, 0);
  float64x2_t v13 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v12, v11), (int8x16_t)v12, (int8x16_t)v11);
  float64x2_t v14 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a7, 0);
  int8x16_t v15 = vbslq_s8((int8x16_t)vcgtq_f64(v13, v14), (int8x16_t)v14, (int8x16_t)v13);
  if (a5 && *(double *)&v15.i64[1] < *(double *)v15.i64) {
    v15.i64[0] = v15.i64[1];
  }
  return *(double *)v15.i64;
}

- (BOOL)_zoomToRect:(FloatRect)a3 withOrigin:(FloatPoint)a4 fitEntireRect:(BOOL)a5 minimumScale:(double)a6 maximumScale:(double)a7 minimumScrollDistance:(float)a8
{
  BOOL v10 = a5;
  m_CGFloat y = a4.m_y;
  m_CGFloat x = a4.m_x;
  FloatRect v26 = a3;
  float64x2_t v14 = objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "layer");
  if (v14)
  {
    [v14 affineTransform];
    double v15 = v27;
  }
  else
  {
    double v15 = 0.0;
  }
  [(WKWebView *)self _targetContentZoomScaleForRect:&v26 currentScale:v10 fitEntireRect:v15 minimumScale:a6 maximumScale:a7];
  double v21 = v20;
  double v22 = vabdd_f64(v20, v15);
  HIDWORD(v23) = 1066695393;
  if (v22 >= 0.0199999996)
  {
    if (v21 != v15)
    {
      *(float *)&double v22 = v26.m_location.m_x;
      *(float *)&double v23 = v26.m_location.m_y;
      *(float *)&double v16 = v26.m_size.m_width;
      *(float *)&double v17 = v26.m_size.m_height;
      BOOL v24 = 1;
      *(float *)&double v18 = m_x;
      *(float *)&double v19 = m_y;
      -[WKWebView _zoomToRect:atScale:origin:animated:](self, "_zoomToRect:atScale:origin:animated:", 1, v22, v23, v16, v17, v21, v18, v19);
      return v24;
    }
    return 0;
  }
  *(float *)&double v19 = a8;
  *(float *)&double v22 = v26.m_location.m_x;
  *(float *)&double v23 = v26.m_location.m_y;
  *(float *)&double v16 = v26.m_size.m_width;
  *(float *)&double v17 = v26.m_size.m_height;
  *(float *)&double v21 = m_x;
  *(float *)&double v18 = m_y;
  return -[WKWebView _scrollToRect:origin:minimumScrollDistance:](self, "_scrollToRect:origin:minimumScrollDistance:", v22, v23, v16, v17, v21, v18, v19);
}

- (void)_setOpaqueInternal:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WKWebView;
  -[WKWebView setOpaque:](&v10, sel_setOpaque_);
  [self->_contentView.m_ptr setOpaque:v3];
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    LOBYTE(v8) = 0;
    char v9 = 0;
    if (!v3)
    {
      std::optional<WebCore::Color>::operator=[abi:sn180100]<WebCore::Color,void>((uint64_t)&v8);
      m_ptr = self->_page.m_ptr;
    }
    WebKit::WebPageProxy::setBackgroundColor((uint64_t)m_ptr, (unsigned __int8 *)&v8);
    [(WKWebView *)self _updateScrollViewBackground];
    if (v9 && (v8 & 0x8000000000000) != 0)
    {
      CGFloat v7 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFLL);
      if (atomic_fetch_add((atomic_uint *volatile)(v8 & 0xFFFFFFFFFFFFLL), 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, v7);
        WTF::fastFree((WTF *)v7, v6);
      }
    }
  }
}

- (void)setOpaque:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WKWebView *)self isOpaque] != a3)
  {
    [(WKWebView *)self _setOpaqueInternal:v3];
  }
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  -[WKWebView setBackgroundColor:](&v5, sel_setBackgroundColor_);
  [self->_contentView.m_ptr setBackgroundColor:a3];
  [(WKWebView *)self _updateScrollViewBackground];
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    if (objc_msgSend((id)objc_msgSend(a3, "pinchGestureRecognizer"), "state") == 1)
    {
      m_ptr = self->_page.m_ptr;
      uint64_t v8 = *((void *)m_ptr + 32);
      char v12 = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::WillStartUserTriggeredZooming>(v8, (uint64_t)&v12, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
      [self->_contentView.m_ptr scrollViewWillStartPanOrPinchGesture];
    }
    [self->_contentView.m_ptr willStartZoomOrScroll];
    objc_super v10 = self->_contentView.m_ptr;
    uint64_t v11 = [a3 pinchGestureRecognizer];
    [v10 cancelPointersForGestureRecognizer:v11];
  }
  else if (objc_opt_respondsToSelector())
  {
    char v9 = self->_customContentView.m_ptr;
    objc_msgSend(v9, "web_scrollViewWillBeginZooming:withView:", a3, a4);
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    if (objc_msgSend((id)objc_msgSend(a3, "panGestureRecognizer"), "state") == 1) {
      [self->_contentView.m_ptr scrollViewWillStartPanOrPinchGesture];
    }
    [self->_contentView.m_ptr willStartZoomOrScroll];
    objc_super v5 = (WebKit::RemoteScrollingCoordinatorProxyIOS *)*((void *)self->_page.m_ptr + 31);
    if (v5)
    {
      m_ptr = self->_scrollView.m_ptr;
      BOOL shouldSetScrollViewDecelerationRateFast = WebKit::RemoteScrollingCoordinatorProxyIOS::shouldSetScrollViewDecelerationRateFast(v5);
      uint64_t v8 = (double *)MEMORY[0x1E4F43CD8];
      if (!shouldSetScrollViewDecelerationRateFast) {
        uint64_t v8 = (double *)MEMORY[0x1E4F43CE0];
      }
      [m_ptr _setDecelerationRateInternal:*v8];
      WebKit::RemoteScrollingCoordinatorProxyIOS::setRootNodeIsInUserScroll((uint64_t)v5, 1);
    }
  }
}

- (void)_didFinishScrolling:(id)a3
{
  if (self->_scrollView.m_ptr == a3)
  {
    if ([(WKWebView *)self usesStandardContentView])
    {
      [(WKWebView *)self _scheduleVisibleContentRectUpdate];
      [self->_contentView.m_ptr didFinishScrolling];
      uint64_t v4 = *((void *)self->_page.m_ptr + 31);
      if (v4)
      {
        objc_super v5 = *(void (**)(void))(*(void *)v4 + 120);
        v5();
      }
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  if ([a3 isZooming])
  {
    [a3 contentOffset];
    a5->double x = v11;
LABEL_12:
    a5->double y = v10;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = a3;
  }
  else {
    id v12 = 0;
  }
  char v13 = [v12 axesToPreventMomentumScrolling];
  if ([self->_contentView.m_ptr preventsPanningInXAxis] & 1) != 0 || (v13)
  {
    [a3 contentOffset];
    a5->double x = v14;
  }
  if (([self->_contentView.m_ptr preventsPanningInYAxis] & 1) != 0 || (v13 & 2) != 0)
  {
    [a3 contentOffset];
    goto LABEL_12;
  }
LABEL_13:
  double v15 = (WebKit::RemoteScrollingCoordinatorProxyIOS *)*((void *)self->_page.m_ptr + 31);
  if (v15)
  {
    [a3 contentSize];
    double v17 = v16;
    [a3 bounds];
    double v19 = v17 - v18;
    [a3 contentSize];
    double v21 = v20;
    [a3 bounds];
    double v23 = v21 - v22;
    id v24 = [(WKWebView *)self UIDelegate];
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v24, "_webView:finalObscuredInsetsForScrollView:withVelocity:targetContentOffset:", self, a3, a5, x, y);
    }
    else {
      [(WKWebView *)self _computedObscuredInset];
    }
    double v26 = v25;
    [(WKWebView *)self bounds];
    double v28 = v26 + v27;
    [a3 contentOffset];
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    double v33 = v19;
    double v34 = v23;
    double v35 = x;
    double v36 = y;
    WebKit::RemoteScrollingCoordinatorProxyIOS::adjustTargetContentOffsetForSnapping(v15, *(CGSize *)&v33, *(CGPoint *)&v35, v28, *(CGPoint *)&v30, a5);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(WKWebView *)self _didFinishScrolling:a3];
  }
}

- (void)scrollView:(id)a3 handleScrollUpdate:(id)a4 completion:(id)a5
{
  uint64_t v8 = [a3 isScrollEnabled] ^ 1;
  if (![a4 phase])
  {
    if (self->_currentScrollGestureState.__engaged_) {
      self->_currentScrollGestureState.__engaged_ = 0;
    }
    self->_wheelEventCountInCurrentScrollGesture = 0;
  }
  [a4 locationInView:self->_contentView.m_ptr];
  v30.double x = v9;
  v30.double y = v10;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v26, &v30);
  float v12 = roundf(*(float *)&v26);
  uint64_t v13 = 0x7FFFFFFFLL;
  uint64_t v14 = 0x80000000;
  if (v12 > -2147500000.0) {
    uint64_t v14 = (int)v12;
  }
  if (v12 < 2147500000.0) {
    uint64_t v13 = v14;
  }
  float v15 = roundf(*((float *)&v26 + 1));
  uint64_t v16 = 0x7FFFFFFF00000000;
  unint64_t v17 = 0x8000000000000000;
  if (v15 > -2147500000.0) {
    unint64_t v17 = (unint64_t)(int)v15 << 32;
  }
  if (v15 < 2147500000.0) {
    uint64_t v16 = v17;
  }
  uint64_t v31 = v16 | v13;
  char v18 = WebKit::eventListenerTypesAtPoint((WebKit *)self->_contentView.m_ptr, (UIView *)&v31, v11);
  if ((v18 & 1) == 0) {
    goto LABEL_24;
  }
  char v19 = v18;
  LODWORD(v30.x) = WebKit::WebIOSEventFactory::translationInView(a4, (uint64_t)self->_contentView.m_ptr);
  HIDWORD(v30.x) = v20;
  if (WebCore::FloatSize::isZero((WebCore::FloatSize *)&v30) && [a4 phase] != 2) {
    goto LABEL_24;
  }
  BOOL v21 = (v19 & 2) != 0
     && (!self->_currentScrollGestureState.__engaged_ || self->_currentScrollGestureState.var0.__null_state_ == 0);
  WebKit::WebIOSEventFactory::createWebWheelEvent(a4, (uint64_t)self->_contentView.m_ptr, (self->_wheelEventCountInCurrentScrollGesture == 0) | ((unint64_t)(self->_wheelEventCountInCurrentScrollGesture == 0) << 32), (uint64_t)&v30);
  ++self->_wheelEventCountInCurrentScrollGesture;
  m_ptr = self->_page.m_ptr;
  id v26 = 0;
  objc_initWeak(&v26, self);
  CGRect aBlock = _Block_copy(a5);
  LOBYTE(v28) = v21;
  HIBYTE(v28) = v8;
  uint64_t v23 = WTF::fastMalloc((WTF *)0x20);
  *(void *)uint64_t v23 = &unk_1EE9CD5F0;
  *(void *)(v23 + 8) = 0;
  objc_moveWeak((id *)(v23 + 8), &v26);
  id v24 = aBlock;
  CGRect aBlock = 0;
  *(void *)(v23 + 16) = v24;
  *(_WORD *)(v23 + 24) = v28;
  uint64_t v29 = v23;
  WebKit::WebPageProxy::dispatchWheelEventWithoutScrolling(m_ptr, (uint64_t)&v30, &v29);
  uint64_t v25 = v29;
  uint64_t v29 = 0;
  if (v25) {
    (*(void (**)(uint64_t))(*(void *)v25 + 8))(v25);
  }
  _Block_release(aBlock);
  objc_destroyWeak(&v26);
  if (!v21) {
LABEL_24:
  }
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v8);
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  if (![(WKWebView *)self usesStandardContentView]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(self->_customContentView.m_ptr, "web_scrollViewDidEndZooming:withView:atScale:", a3, a4, a5);
  }
  m_ptr = self->_contentView.m_ptr;
  [(WKWebView *)self bounds];
  objc_msgSend(m_ptr, "setCenter:");
  [(WKWebView *)self _scheduleVisibleContentRectUpdateAfterScrollInView:a3];
  CGFloat v10 = self->_contentView.m_ptr;

  [v10 didZoomToScale:a5];
}

- (void)_scrollViewDidInterruptDecelerating:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    [self->_contentView.m_ptr didInterruptScrolling];
    [(WKWebView *)self _scheduleVisibleContentRectUpdateAfterScrollInView:a3];
  }
}

- (void)_didScroll
{
  [(WKWebView *)self _scheduleVisibleContentRectUpdateAfterScrollInView:[(WKWebView *)self _scroller]];
  if (!self->_enclosingScrollViewScrollTimer.m_ptr)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CB00]);
    uint64_t v4 = objc_msgSend(v3, "initWithFireDate:interval:target:selector:userInfo:repeats:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", 0.032), self, sel__enclosingScrollerScrollingEnded_, 0, 1, 0.0);
    m_ptr = self->_enclosingScrollViewScrollTimer.m_ptr;
    self->_enclosingScrollViewScrollTimer.m_ptr = v4;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    CGFloat v6 = (void *)[MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v6 addTimer:self->_enclosingScrollViewScrollTimer.m_ptr forMode:*MEMORY[0x1E4F1C3A0]];
  }
  self->_didScrollSinceLastTimerFire = 1;
}

- (void)_enclosingScrollerScrollingEnded:(id)a3
{
  if (self->_didScrollSinceLastTimerFire)
  {
    self->_didScrollSinceLastTimerFire = 0;
  }
  else
  {
    [(WKWebView *)self _scheduleVisibleContentRectUpdate];
    [self->_enclosingScrollViewScrollTimer.m_ptr invalidate];
    m_ptr = self->_enclosingScrollViewScrollTimer.m_ptr;
    self->_enclosingScrollViewScrollTimer.m_ptr = 0;
    if (m_ptr)
    {
      CFRelease(m_ptr);
    }
  }
}

- (void)_beginAutomaticLiveResizeIfNeeded
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    uint64_t v5 = *((void *)m_ptr + 34);
    {
      WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v5 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::key, v2))
    {
      if ([(WKWebView *)self usesStandardContentView])
      {
        if ([(WKWebView *)self window])
        {
          [(WKWebView *)self bounds];
          if (!CGRectIsEmpty(v7) && !self->_perProcessState.dynamicViewportUpdateMode)
          {
            [(WKWebView *)self _rescheduleEndLiveResizeTimer];
            if (!self->_perProcessState.liveResizeParameters.__engaged_)
            {
              [(WKWebView *)self _beginLiveResize];
            }
          }
        }
      }
    }
  }
}

- (void)_rescheduleEndLiveResizeTimer
{
  [self->_endLiveResizeTimer.m_ptr invalidate];
  id v3 = (void *)MEMORY[0x1E4F1CB00];
  id v8 = 0;
  objc_initWeak(&v8, self);
  id to = 0;
  objc_moveWeak(&to, &v8);
  uint64_t v4 = malloc_type_malloc(0x28uLL, 0x10E0040799C3B1DuLL);
  *(void *)uint64_t v4 = MEMORY[0x1E4F14398];
  *((void *)v4 + 1) = 50331650;
  *((void *)v4 + 2) = WTF::BlockPtr<void ()(NSTimer *)>::fromCallable<-[WKWebView(WKViewInternalIOS) _rescheduleEndLiveResizeTimer]::$_0>([(WKWebView(WKViewInternalIOS) *)void * _rescheduleEndLiveResizeTimer]#1}::__invoke;
  *((void *)v4 + 3) = &WTF::BlockPtr<void ()(NSTimer *)>::fromCallable<-[WKWebView(WKViewInternalIOS) _rescheduleEndLiveResizeTimer]::$_0>(-[WKWebView(WKViewInternalIOS) _rescheduleEndLiveResizeTimer]::$_0)::descriptor;
  *((void *)v4 + 4) = 0;
  objc_moveWeak((id *)v4 + 4, &to);
  objc_destroyWeak(&to);
  uint64_t v5 = (void *)[v3 scheduledTimerWithTimeInterval:0 repeats:v4 block:0.5];
  CGFloat v6 = v5;
  if (v5) {
    CFRetain(v5);
  }
  m_ptr = self->_endLiveResizeTimer.m_ptr;
  self->_endLiveResizeTimer.m_ptr = v6;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  _Block_release(v4);
  objc_destroyWeak(&v8);
}

- (void)_updateLiveResizeTransform
{
  [(WKWebView *)self bounds];
  if (self->_perProcessState.liveResizeParameters.__engaged_)
  {
    viewdouble Width = self->_perProcessState.liveResizeParameters.var0.__val_.viewWidth;
    memset(&v14, 0, sizeof(v14));
    CGFloat v5 = v3 / viewWidth;
    CGAffineTransformMakeScale(&v14, v5, v5);
    -[WKWebView _contentOffsetAdjustedForObscuredInset:](self, "_contentOffsetAdjustedForObscuredInset:", v5 * self->_perProcessState.liveResizeParameters.var0.__val_.initialScrollPosition.x, v5 * self->_perProcessState.liveResizeParameters.var0.__val_.initialScrollPosition.y);
    double v7 = v6;
    double v9 = v8;
    [self->_scrollView.m_ptr contentOffset];
    v14.tdouble x = v10 - v7;
    v14.tdouble y = v11 - v9;
    m_ptr = self->_resizeAnimationView.m_ptr;
    CGAffineTransform v13 = v14;
    [m_ptr setTransform:&v13];
  }
  else
  {
    __break(1u);
  }
}

- (void)_frameOrBoundsWillChange
{
  p_lastKnownWindowSizeAndOrientation = &self->_lastKnownWindowSizeAndOrientation;
  double width = self->_lastKnownWindowSizeAndOrientation.first.width;
  int64_t second = self->_lastKnownWindowSizeAndOrientation.second;
  [(WKWebView *)self _updateLastKnownWindowSizeAndOrientation];
  if (width != p_lastKnownWindowSizeAndOrientation->first.width
    && second == p_lastKnownWindowSizeAndOrientation->second)
  {
    [(WKWebView *)self _beginAutomaticLiveResizeIfNeeded];
  }
}

- (void)_acquireResizeAssertionForReason:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (!m_ptr) {
    goto LABEL_46;
  }
  uint64_t v6 = *((void *)m_ptr + 34);
  {
    WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::kedouble y = (uint64_t)&WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v6 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::automaticLiveResizeEnabledKey(void)::key, (const WTF::StringImpl *)a3) & 1) == 0)
  {
LABEL_46:
    uint64_t v7 = objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene");
    if (v7)
    {
      double v8 = (void *)v7;
      p_resizeAssertions = &self->_resizeAssertions;
      if (!self->_resizeAssertions.m_size)
      {
        uint64_t v10 = WTF::fastMalloc((WTF *)8);
        *(_DWORD *)uint64_t v10 = 1;
        *(unsigned char *)(v10 + 4) = 0;
        id location = 0;
        objc_initWeak(&location, self);
        atomic_fetch_add((atomic_uint *volatile)v10, 1u);
        CGFloat v38 = (WTF *)v10;
        id to = 0;
        objc_moveWeak(&to, &location);
        double v11 = v38;
        CGFloat v38 = 0;
        CGFloat v40 = v11;
        float v12 = malloc_type_malloc(0x30uLL, 0x10E00409BB9573DuLL);
        *(void *)float v12 = MEMORY[0x1E4F14398];
        *((void *)v12 + 1) = 50331650;
        *((void *)v12 + 2) = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKViewInternalIOS) _acquireResizeAssertionForReason:]::$_1>(-[WKWebView(WKViewInternalIOS) _acquireResizeAssertionForReason:]::$_1)::{lambda(void *)#1}::__invoke;
        *((void *)v12 + 3) = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKViewInternalIOS) _acquireResizeAssertionForReason:]::$_1>(-[WKWebView(WKViewInternalIOS) _acquireResizeAssertionForReason:]::$_1)::descriptor;
        *((void *)v12 + 4) = 0;
        objc_moveWeak((id *)v12 + 4, &to);
        *((void *)v12 + 5) = v40;
        CGFloat v40 = 0;
        objc_destroyWeak(&to);
        [(WKWebView *)self _doAfterNextVisibleContentRectUpdate:v12];
        _Block_release(v12);
        CGAffineTransform v14 = (unsigned int *)v38;
        CGFloat v38 = 0;
        if (v14 && atomic_fetch_add((atomic_uint *volatile)v14, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v14);
          WTF::fastFree((WTF *)v14, v13);
        }
        objc_destroyWeak(&location);
        WTF::RunLoop::main(v15);
        id to = 0;
        objc_initWeak(&to, self);
        atomic_fetch_add((atomic_uint *volatile)v10, 1u);
        CGFloat v40 = (WTF *)v10;
        uint64_t v16 = WTF::fastMalloc((WTF *)0x18);
        *(void *)uint64_t v16 = &unk_1EE9CD618;
        *(void *)(v16 + 8) = 0;
        objc_moveWeak((id *)(v16 + 8), &to);
        unint64_t v17 = v40;
        CGFloat v40 = 0;
        *(void *)(v16 + 16) = v17;
        id location = (id)v16;
        WTF::RunLoop::dispatchAfter();
        if (v36) {
          WTF::ThreadSafeRefCounted<WTF::RunLoop::DispatchTimer,(WTF::DestructionThread)0>::deref((unsigned int *)(v36 + 24));
        }
        id v19 = location;
        id location = 0;
        if (v19) {
          (*(void (**)(id))(*(void *)v19 + 8))(v19);
        }
        int v20 = (unsigned int *)v40;
        CGFloat v40 = 0;
        if (v20 && atomic_fetch_add((atomic_uint *volatile)v20, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v20);
          WTF::fastFree((WTF *)v20, v18);
        }
        objc_destroyWeak(&to);
        if (atomic_fetch_add((atomic_uint *volatile)v10, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, (unsigned int *)v10);
          WTF::fastFree((WTF *)v10, v21);
        }
      }
      double v22 = (const void *)[v8 _holdLiveResizeSnapshotForReason:a3];
      uint64_t v23 = v22;
      if (v22) {
        CFRetain(v22);
      }
      m_CGSize size = p_resizeAssertions->m_size;
      if (m_size == p_resizeAssertions->m_capacity)
      {
        unint64_t v25 = m_size + (m_size >> 2);
        if (v25 >= 0x10) {
          unint64_t v26 = v25 + 1;
        }
        else {
          unint64_t v26 = 16;
        }
        if (v26 <= m_size + 1) {
          unint64_t v27 = m_size + 1;
        }
        else {
          unint64_t v27 = v26;
        }
        if (v27 >> 29)
        {
          __break(0xC471u);
          return;
        }
        m_buffer = (WTF *)p_resizeAssertions->m_buffer;
        CGPoint v30 = (WTF *)WTF::fastMalloc((WTF *)(8 * v27));
        p_resizeAssertions->m_capacitdouble y = v27;
        p_resizeAssertions->m_buffer = v30;
        if (m_size)
        {
          uint64_t v31 = 8 * m_size;
          uint64_t v32 = m_buffer;
          do
          {
            double v33 = *(const void **)v32;
            *(void *)uint64_t v32 = 0;
            *(void *)CGPoint v30 = v33;
            double v34 = *(const void **)v32;
            *(void *)uint64_t v32 = 0;
            if (v34) {
              CFRelease(v34);
            }
            CGPoint v30 = (WTF *)((char *)v30 + 8);
            uint64_t v32 = (WTF *)((char *)v32 + 8);
            v31 -= 8;
          }
          while (v31);
          CGPoint v30 = (WTF *)p_resizeAssertions->m_buffer;
        }
        if (m_buffer)
        {
          if (v30 == m_buffer)
          {
            p_resizeAssertions->m_buffer = 0;
            p_resizeAssertions->m_capacitdouble y = 0;
          }
          WTF::fastFree(m_buffer, v29);
          CGPoint v30 = (WTF *)p_resizeAssertions->m_buffer;
        }
        m_CGSize size = p_resizeAssertions->m_size;
        double v35 = (void *)((char *)v30 + 8 * m_size);
      }
      else
      {
        double v35 = (char *)p_resizeAssertions->m_buffer + 8 * m_size;
      }
      void *v35 = v23;
      p_resizeAssertions->m_CGSize size = m_size + 1;
    }
  }
}

- (CGRect)_contentRectForUserInteraction
{
  double top = self->_obscuredInsets.top;
  double left = self->_obscuredInsets.left;
  double right = self->_obscuredInsets.right;
  if (self->_obscuredInsets.bottom >= self->_inputViewBoundsInWindow.size.height) {
    double bottom = self->_obscuredInsets.bottom;
  }
  else {
    double bottom = self->_inputViewBoundsInWindow.size.height;
  }
  [(WKWebView *)self bounds];
  double v8 = left + v7;
  double v10 = top + v9;
  double v12 = v11 - (left + right);
  double v14 = v13 - (top + bottom);
  id v15 = [(WKWebView *)self _currentContentView];

  -[WKWebView convertRect:toView:](self, "convertRect:toView:", v15, v8, v10, v12, v14);
  result.size.CGFloat height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (BOOL)_scrollViewIsRubberBandingForRefreshControl
{
  if (![self->_scrollView.m_ptr refreshControl]) {
    return 0;
  }
  [self->_scrollView.m_ptr contentOffset];
  double v4 = v3;
  [self->_scrollView.m_ptr adjustedContentInset];
  if (v4 >= -v5) {
    return 0;
  }
  m_ptr = self->_scrollView.m_ptr;

  return [(WKWebView *)self _scrollViewIsRubberBanding:m_ptr];
}

- (void)_scheduleForcedVisibleContentRectUpdate
{
  self->_alwaysSendNextVisibleContentRectUpdate = 1;
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
}

- (void)_didStartProvisionalLoadForMainFrame
{
  value = self->_gestureController.__ptr_.__value_;
  if (value) {
    WebKit::ViewGestureController::didStartProvisionalOrSameDocumentLoadForMainFrame((WTF::MonotonicTime *)value);
  }
}

- (void)_ensureResizeAnimationView
{
  if (!self->_resizeAnimationView.m_ptr)
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "subviews"), "indexOfObject:", self->_contentView.m_ptr);
    id v4 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    m_ptr = self->_resizeAnimationView.m_ptr;
    self->_resizeAnimationView.m_ptr = v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      id v4 = self->_resizeAnimationView.m_ptr;
    }
    objc_msgSend((id)objc_msgSend(v4, "layer"), "setName:", @"ResizeAnimation");
    [self->_scrollView.m_ptr insertSubview:self->_resizeAnimationView.m_ptr atIndex:v3];
    [self->_resizeAnimationView.m_ptr addSubview:self->_contentView.m_ptr];
    uint64_t v6 = self->_resizeAnimationView.m_ptr;
    uint64_t v7 = [self->_contentView.m_ptr unscaledView];
    [v6 addSubview:v7];
  }
}

- (void)_destroyResizeAnimationView
{
  if (self->_resizeAnimationView.m_ptr)
  {
    uint64_t v3 = objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "subviews"), "indexOfObject:", self->_resizeAnimationView.m_ptr);
    [self->_scrollView.m_ptr insertSubview:self->_contentView.m_ptr atIndex:v3];
    objc_msgSend(self->_scrollView.m_ptr, "insertSubview:atIndex:", objc_msgSend(self->_contentView.m_ptr, "unscaledView"), v3 + 1);
    [self->_resizeAnimationView.m_ptr removeFromSuperview];
    m_ptr = self->_resizeAnimationView.m_ptr;
    self->_resizeAnimationView.m_ptr = 0;
    if (m_ptr)
    {
      CFRelease(m_ptr);
    }
  }
}

- (void)_cancelAnimatedResize
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    int dynamicViewportUpdateMode = self->_perProcessState.dynamicViewportUpdateMode;
    int v13 = 134218496;
    double v14 = self;
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 1024;
    int v18 = dynamicViewportUpdateMode;
    _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _cancelAnimatedResize] dynamicViewportUpdateMode %d", (uint8_t *)&v13, 0x1Cu);
  }
  if (self->_perProcessState.dynamicViewportUpdateMode)
  {
    if (!self->_customContentView.m_ptr)
    {
      [(WKWebView *)self _destroyResizeAnimationView];
      [self->_contentView.m_ptr setHidden:0];
      uint64_t v6 = (_OWORD *)MEMORY[0x1E4F39B10];
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      long long v9 = *MEMORY[0x1E4F39B10];
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23 = v7;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.double m11 = v9;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13 = v8;
      long long v10 = v6[7];
      long long v12 = v6[4];
      long long v11 = v6[5];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41 = v6[6];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43 = v10;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31 = v12;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33 = v11;
    }
    self->_perProcessState.int dynamicViewportUpdateMode = 0;
    self->_perProcessState.animatedResizeOldBounds.origin = 0u;
    self->_perProcessState.animatedResizeOldBounds.CGSize size = 0u;
    [(WKWebView *)self _scheduleVisibleContentRectUpdate];
  }
}

- (void)_didCompleteAnimatedResize
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  p_perProcessState = &self->_perProcessState;
  if (self->_perProcessState.dynamicViewportUpdateMode)
  {
    [self->_contentView.m_ptr setHidden:0];
    m_ptr = self->_resizeAnimationView.m_ptr;
    double v5 = qword_1EB358730;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT);
    if (m_ptr)
    {
      if (v6)
      {
        uint64_t v7 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
        *(_DWORD *)CALayer buf = 134218240;
        *(void *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _didCompleteAnimatedResize]", buf, 0x16u);
      }
      uint64_t v8 = objc_msgSend((id)objc_msgSend(self->_scrollView.m_ptr, "subviews"), "indexOfObject:", self->_resizeAnimationView.m_ptr);
      [self->_scrollView.m_ptr insertSubview:self->_contentView.m_ptr atIndex:v8];
      objc_msgSend(self->_scrollView.m_ptr, "insertSubview:atIndex:", objc_msgSend(self->_contentView.m_ptr, "unscaledView"), v8 + 1);
      long long v9 = (void *)[self->_contentView.m_ptr layer];
      double m11 = self->_resizeAnimationTransformAdjustments.m11;
      long long v11 = (long long *)MEMORY[0x1E4F39B10];
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
      v40[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
      v40[5] = v12;
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
      v40[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
      v40[7] = v13;
      long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
      v40[0] = *MEMORY[0x1E4F39B10];
      v40[1] = v14;
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
      v40[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
      v40[3] = v15;
      [v9 setSublayerTransform:v40];
      uint64_t v16 = (void *)[self->_resizeAnimationView.m_ptr layer];
      if (v16)
      {
        [v16 transform];
        double v17 = *(double *)buf;
      }
      else
      {
        double v17 = 0.0;
      }
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      memset(buf, 0, sizeof(buf));
      if (v9) {
        [v9 transform];
      }
      int v18 = (void *)[self->_resizeAnimationView.m_ptr layer];
      if (v18)
      {
        [v18 transform];
        double v19 = v39;
      }
      else
      {
        double v19 = 0.0;
      }
      *(double *)CALayer buf = m11 * (v19 * *(double *)buf);
      *((void *)&v42 + 1) = *(void *)buf;
      v38[4] = v44;
      v38[5] = v45;
      v38[6] = v46;
      v38[7] = v47;
      v38[0] = *(_OWORD *)buf;
      v38[1] = *(_OWORD *)&buf[16];
      v38[2] = v42;
      v38[3] = v43;
      [v9 setTransform:v38];
      [self->_scrollView.m_ptr contentOffset];
      double v21 = v20;
      double v23 = v22;
      double v24 = v17 * self->_resizeAnimationTransformAdjustments.m41;
      unint64_t v25 = self->_scrollView.m_ptr;
      double v26 = v17 * self->_resizeAnimationTransformAdjustments.m42;
      unint64_t v27 = self->_page.m_ptr;
      [self->_contentView.m_ptr frame];
      uint64_t v30 = 764;
      if (!*((unsigned char *)v27 + 768)) {
        uint64_t v30 = 760;
      }
      objc_msgSend(v25, "setContentSize:", floor(v28 * *(float *)((char *)v27 + v30)) / *(float *)((char *)v27 + v30), floor(v29 * *(float *)((char *)v27 + v30)) / *(float *)((char *)v27 + v30));
      objc_msgSend(self->_scrollView.m_ptr, "setContentOffset:", v21 - v24, v23 - v26);
      [self->_resizeAnimationView.m_ptr removeFromSuperview];
      uint64_t v31 = self->_resizeAnimationView.m_ptr;
      self->_resizeAnimationView.m_ptr = 0;
      if (v31) {
        CFRelease(v31);
      }
      long long v32 = *v11;
      long long v33 = v11[1];
      long long v34 = v11[3];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m21 = v11[2];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m23 = v34;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.double m11 = v32;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m13 = v33;
      long long v35 = v11[4];
      long long v36 = v11[5];
      long long v37 = v11[7];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m41 = v11[6];
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m43 = v37;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m31 = v35;
      *(_OWORD *)&self->_resizeAnimationTransformAdjustments.m33 = v36;
      p_perProcessState->int dynamicViewportUpdateMode = 0;
      p_perProcessState->animatedResizeOldBounds.origin = 0u;
      p_perProcessState->animatedResizeOldBounds.CGSize size = 0u;
      [(WKWebView *)self _didStopDeferringGeometryUpdates];
    }
    else
    {
      if (v6)
      {
        *(_DWORD *)CALayer buf = 134217984;
        *(void *)&buf[4] = self;
        _os_log_impl(&dword_1985F2000, v5, OS_LOG_TYPE_DEFAULT, "%p -[WKWebView _didCompleteAnimatedResize:] - _resizeAnimationView is nil", buf, 0xCu);
      }
      [(WKWebView *)self _cancelAnimatedResize];
    }
  }
}

- (void)_didStopDeferringGeometryUpdates
{
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
  [(WKWebView *)self bounds];
  v28[0] = v3;
  v28[1] = v4;
  v29[0] = v5;
  v29[1] = v6;
  [(WKWebView *)self activeViewLayoutSize:v28];
  float v8 = v7;
  float v10 = v9;
  if (self->_overriddenLayoutParameters.__engaged_) {
    p_minimumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize;
  }
  else {
    p_minimumUnobscuredSize = (CGSize *)v29;
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v30, p_minimumUnobscuredSize);
  uint64_t v12 = v30;
  if (self->_overriddenLayoutParameters.__engaged_) {
    p_maximumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize;
  }
  else {
    p_maximumUnobscuredSize = (CGSize *)v29;
  }
  WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v30, p_maximumUnobscuredSize);
  if (!self->_overridesInterfaceOrientation)
  {
    long long v15 = (unsigned int *)((char *)self->_page.m_ptr + 444);
    goto LABEL_11;
  }
  unint64_t v14 = self->_interfaceOrientationOverride - 2;
  if (v14 < 3)
  {
    long long v15 = &dword_1994F6750[v14];
LABEL_11:
    uint64_t v16 = *v15;
    goto LABEL_13;
  }
  uint64_t v16 = 0;
LABEL_13:
  uint64_t v17 = v30;
  [(WKWebView *)self _minimumEffectiveDeviceWidth];
  if (!self->_perProcessState.lastSentViewLayoutSize.__engaged_) {
    goto LABEL_21;
  }
  if (v8 != self->_perProcessState.lastSentViewLayoutSize.var0.__val_.m_width
    || v10 != self->_perProcessState.lastSentViewLayoutSize.var0.__val_.m_height)
  {
    goto LABEL_21;
  }
  if (!self->_perProcessState.lastSentMinimumEffectiveDeviceWidth.__engaged_)
  {
    unint64_t v27 = (_Unwind_Exception *)std::__throw_bad_optional_access[abi:sn180100]();
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    _Unwind_Resume(v27);
  }
  double val = self->_perProcessState.lastSentMinimumEffectiveDeviceWidth.var0.__val_;
  if (v18 != val)
  {
LABEL_21:
    *(float *)&double v18 = v8;
    *(float *)&double val = v10;
    -[WKWebView _dispatchSetViewLayoutSize:](self, "_dispatchSetViewLayoutSize:", v18, val);
  }
  if (self->_overriddenLayoutParameters.__engaged_)
  {
    m_ptr = self->_page.m_ptr;
    uint64_t v30 = v12;
    WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)m_ptr, (const WebCore::FloatSize *)&v30);
    double v22 = self->_page.m_ptr;
    uint64_t v30 = v17;
    WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)v22, (const WebCore::FloatSize *)&v30);
    double v23 = self->_page.m_ptr;
    uint64_t v30 = v17;
    WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)v23, (const WebCore::FloatSize *)&v30);
  }
  -[WKWebView _recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:](self, "_recalculateViewportSizesWithMinimumViewportInset:maximumViewportInset:throwOnInvalidInput:", 0, self->_minimumViewportInset.top, self->_minimumViewportInset.left, self->_minimumViewportInset.bottom, self->_minimumViewportInset.right, self->_maximumViewportInset.top, self->_maximumViewportInset.left, self->_maximumViewportInset.bottom, self->_maximumViewportInset.right);
  if (!self->_perProcessState.lastSentDeviceOrientation.__engaged_
    || v16 != self->_perProcessState.lastSentDeviceOrientation.var0.__val_)
  {
    [(WKWebView *)self _dispatchSetDeviceOrientation:v16];
  }
  [(WKWebView *)self _updateDrawingAreaSize];
  p_callbacksDeferredDuringReCGSize size = &self->_callbacksDeferredDuringResize;
  while (1)
  {
    m_CGSize size = p_callbacksDeferredDuringResize->m_size;
    if (!m_size) {
      break;
    }
    uint64_t v26 = *((void *)p_callbacksDeferredDuringResize->m_buffer + m_size - 1);
    *((void *)p_callbacksDeferredDuringResize->m_buffer + m_size - 1) = 0;
    WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::shrink((uint64_t)p_callbacksDeferredDuringResize, m_size - 1);
    (*(void (**)(uint64_t))(*(void *)v26 + 16))(v26);
    (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
  }
}

- (void)_didFinishNavigation:(Navigation *)a3
{
  value = self->_gestureController.__ptr_.__value_;
  if (value) {
    WebKit::ViewGestureController::didReachNavigationTerminalState((uint64_t)value, (API::Navigation *)a3);
  }
}

- (void)_didFailNavigation:(Navigation *)a3
{
  value = self->_gestureController.__ptr_.__value_;
  if (value) {
    WebKit::ViewGestureController::didReachNavigationTerminalState((uint64_t)value, (API::Navigation *)a3);
  }
}

- (void)_didSameDocumentNavigationForMainFrame:(unsigned __int8)a3
{
  m_ptr = self->_customContentView.m_ptr;
  if ((a3 - 1) < 3) {
    uint64_t v6 = (a3 - 1) + 1;
  }
  else {
    uint64_t v6 = 0;
  }
  objc_msgSend(m_ptr, "web_didSameDocumentNavigation:", v6);
  value = self->_gestureController.__ptr_.__value_;
  if (value)
  {
    WebKit::ViewGestureController::didSameDocumentNavigationForMainFrame((uint64_t)value, a3);
  }
}

- (void)_keyboardChangedWithInfo:(id)a3 adjustScrollView:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [a3 objectForKey:*MEMORY[0x1E4F43AF0]];
  if (v7)
  {
    float v8 = (void *)v7;
    p_inputViewBoundsInWindow = &self->_inputViewBoundsInWindow;
    CGFloat x = self->_inputViewBoundsInWindow.origin.x;
    CGFloat y = self->_inputViewBoundsInWindow.origin.y;
    CGFloat width = self->_inputViewBoundsInWindow.size.width;
    CGFloat height = self->_inputViewBoundsInWindow.size.height;
    BOOL v14 = [(WKWebView *)self _selectionRectIsFullyVisibleAndNonEmpty];
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42C68], "sharedInstance"), "isUndocked"))
    {
      CGFloat v15 = *MEMORY[0x1E4F1DB28];
      CGFloat v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [v8 CGRectValue];
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      if ((objc_msgSend((id)-[WKWebView window](self, "window"), "_isHostedInAnotherProcess") & 1) == 0)
      {
        objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "screen"), "bounds");
        v41.origin.CGFloat x = v27;
        v41.origin.CGFloat y = v28;
        v41.size.CGFloat width = v29;
        v41.size.CGFloat height = v30;
        v36.origin.CGFloat x = v20;
        v36.origin.CGFloat y = v22;
        v36.size.CGFloat width = v24;
        v36.size.CGFloat height = v26;
        CGRect v37 = CGRectIntersection(v36, v41);
        double v20 = v37.origin.x;
        double v22 = v37.origin.y;
        double v24 = v37.size.width;
        double v26 = v37.size.height;
      }
      objc_msgSend((id)-[WKWebView window](self, "window"), "convertRect:fromCoordinateSpace:", objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "screen"), "coordinateSpace"), v20, v22, v24, v26);
    }
    p_inputViewBoundsInWindow->origin.CGFloat x = v15;
    self->_inputViewBoundsInWindow.origin.CGFloat y = v16;
    self->_inputViewBoundsInWindow.size.CGFloat width = v17;
    self->_inputViewBoundsInWindow.size.CGFloat height = v18;
    if (v4)
    {
      [self->_scrollView.m_ptr contentInset];
      double v32 = v31;
      BOOL currentlyAdjustingScrollViewInsetsForKeyboard = self->_perProcessState.currentlyAdjustingScrollViewInsetsForKeyboard;
      self->_perProcessState.BOOL currentlyAdjustingScrollViewInsetsForKeyboard = 1;
      [self->_scrollView.m_ptr _adjustForAutomaticKeyboardInfo:a3 animated:1 lastAdjustment:&self->_lastAdjustmentForScroller];
      [self->_scrollView.m_ptr contentInset];
      if (v32 != v34) {
        self->_totalScrollViewBottomInsetAdjustmentForKeyboard = v34
      }
                                                               - v32
                                                               + self->_totalScrollViewBottomInsetAdjustmentForKeyboard;
      self->_perProcessState.BOOL currentlyAdjustingScrollViewInsetsForKeyboard = currentlyAdjustingScrollViewInsetsForKeyboard;
    }
    if (v14)
    {
      if ([self->_contentView.m_ptr _hasFocusedElement])
      {
        v38.origin.CGFloat x = x;
        v38.origin.CGFloat y = y;
        v38.size.CGFloat width = width;
        v38.size.CGFloat height = height;
        if (!CGRectIsEmpty(v38))
        {
          v39.origin.CGFloat x = p_inputViewBoundsInWindow->origin.x;
          v39.origin.CGFloat y = self->_inputViewBoundsInWindow.origin.y;
          v39.size.CGFloat width = self->_inputViewBoundsInWindow.size.width;
          v39.size.CGFloat height = self->_inputViewBoundsInWindow.size.height;
          if (!CGRectIsEmpty(v39))
          {
            v42.origin.CGFloat x = p_inputViewBoundsInWindow->origin.x;
            v42.origin.CGFloat y = self->_inputViewBoundsInWindow.origin.y;
            v42.size.CGFloat width = self->_inputViewBoundsInWindow.size.width;
            v42.size.CGFloat height = self->_inputViewBoundsInWindow.size.height;
            v40.origin.CGFloat x = x;
            v40.origin.CGFloat y = y;
            v40.size.CGFloat width = width;
            v40.size.CGFloat height = height;
            if (!CGRectEqualToRect(v40, v42)) {
              [(WKWebView *)self _scrollToAndRevealSelectionIfNeeded];
            }
          }
        }
      }
    }
    [(WKWebView *)self _scheduleVisibleContentRectUpdate];
  }
}

- (BOOL)_shouldUpdateKeyboardWithInfo:(id)a3
{
  if (([self->_contentView.m_ptr isFocusingElement] & 1) != 0
    || ([self->_findInteraction.m_ptr isFindNavigatorVisible] & 1) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v5 = (void *)[a3 valueForKey:*MEMORY[0x1E4F43B08]];
    if (v5) {
      LOBYTE(v5) = [v5 BOOLValue] ^ 1;
    }
  }
  return (char)v5;
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  if (-[WKWebView _shouldUpdateKeyboardWithInfo:](self, "_shouldUpdateKeyboardWithInfo:", [a3 userInfo]))
  {
    uint64_t v5 = [a3 userInfo];
    [(WKWebView *)self _keyboardChangedWithInfo:v5 adjustScrollView:1];
  }
}

- (void)_keyboardDidChangeFrame:(id)a3
{
  uint64_t v4 = [a3 userInfo];

  [(WKWebView *)self _keyboardChangedWithInfo:v4 adjustScrollView:0];
}

- (void)_keyboardWillShow:(id)a3
{
  if (-[WKWebView _shouldUpdateKeyboardWithInfo:](self, "_shouldUpdateKeyboardWithInfo:", [a3 userInfo])) {
    -[WKWebView _keyboardChangedWithInfo:adjustScrollView:](self, "_keyboardChangedWithInfo:adjustScrollView:", [a3 userInfo], 1);
  }
  *((unsigned char *)self->_page.m_ptr + 449) = 1;
  m_ptr = self->_contentView.m_ptr;

  [m_ptr _keyboardWillShow];
}

- (void)_keyboardDidShow:(id)a3
{
  *((unsigned char *)self->_page.m_ptr + 449) = 0;
  objc_msgSend(self->_contentView.m_ptr, "_keyboardDidShow", a3);
}

- (void)_keyboardWillHide:(id)a3
{
  if (([self->_contentView.m_ptr shouldIgnoreKeyboardWillHideNotification] & 1) == 0)
  {
    uint64_t v5 = [a3 userInfo];
    [(WKWebView *)self _keyboardChangedWithInfo:v5 adjustScrollView:1];
  }
}

- (void)_windowDidRotate:(id)a3
{
  if (!self->_overridesInterfaceOrientation) {
    [(WKWebView *)self _dispatchSetDeviceOrientation:[(WKWebView *)self _deviceOrientationIgnoringOverrides]];
  }
  uint64_t v4 = [(WKWebView *)self _deviceOrientationIgnoringOverrides];

  [(WKWebView *)self _dispatchSetOrientationForMediaCapture:v4];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  m_ptr = self->_page.m_ptr;
  MEMORY[0x19972EAD0](&v7, [(WKWebView *)self _contentSizeCategory]);
  uint64_t v4 = *((void *)m_ptr + 32);
  float v8 = &v7;
  WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::ContentSizeCategoryDidChange>(v4, (uint64_t **)&v8, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
  uint64_t v6 = v7;
  uint64_t v7 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
}

- (void)_accessibilitySettingsDidChange:(id)a3
{
}

- (BOOL)_isNavigationSwipeGestureRecognizer:(id)a3
{
  value = self->_gestureController.__ptr_.__value_;
  if (value) {
    return [*((id *)value + 17) isNavigationSwipeGestureRecognizer:a3];
  }
  else {
    return 0;
  }
}

- (void)_navigationGestureDidBegin
{
  [(WKWebView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(WKWebView *)self _computedObscuredInset];
  double v12 = v4 + v11;
  double v14 = v6 + v13;
  double v16 = v8 - (v11 + v15);
  double v18 = v10 - (v13 + v17);
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, v4, v6, v8, v10);
  BOOL engaged = self->_perProcessState.frozenVisibleContentRect.__engaged_;
  self->_perProcessState.frozenVisibleContentRect.var0.__val_.origin.CGFloat x = v20;
  self->_perProcessState.frozenVisibleContentRect.var0.__val_.origin.CGFloat y = v21;
  self->_perProcessState.frozenVisibleContentRect.var0.__val_.size.CGFloat width = v22;
  self->_perProcessState.frozenVisibleContentRect.var0.__val_.size.CGFloat height = v23;
  if (!engaged) {
    self->_perProcessState.frozenVisibleContentRect.__engaged_ = 1;
  }
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, v12, v14, v16, v18);
  BOOL v24 = self->_perProcessState.frozenUnobscuredContentRect.__engaged_;
  self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.origin.CGFloat x = v25;
  self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.origin.CGFloat y = v26;
  self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.size.CGFloat width = v27;
  self->_perProcessState.frozenUnobscuredContentRect.var0.__val_.size.CGFloat height = v28;
  if (!v24) {
    self->_perProcessState.frozenUnobscuredContentRect.__engaged_ = 1;
  }
  self->_contentViewShouldBecomeFirstResponderAfterNavigationGesture = [self->_contentView.m_ptr isFirstResponder];
}

- (void)_navigationGestureDidEnd
{
  if (self->_perProcessState.frozenVisibleContentRect.__engaged_) {
    self->_perProcessState.frozenVisibleContentRect.__engaged_ = 0;
  }
  if (self->_perProcessState.frozenUnobscuredContentRect.__engaged_) {
    self->_perProcessState.frozenUnobscuredContentRect.__engaged_ = 0;
  }
  if (self->_contentViewShouldBecomeFirstResponderAfterNavigationGesture)
  {
    if ([(WKWebView *)self window])
    {
      if (([self->_contentView.m_ptr isFirstResponder] & 1) == 0) {
        [self->_contentView.m_ptr becomeFirstResponder];
      }
    }
    self->_contentViewShouldBecomeFirstResponderAfterNavigationGesture = 0;
  }
}

- (void)_showPasswordViewWithDocumentName:(id)a3 passwordHandler:(id)a4
{
  double v7 = [WKPasswordView alloc];
  [(WKWebView *)self bounds];
  double v8 = -[WKPasswordView initWithFrame:documentName:](v7, "initWithFrame:documentName:", a3);
  m_ptr = self->_passwordView.m_ptr;
  self->_passwordView.m_ptr = v8;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    double v8 = (WKPasswordView *)self->_passwordView.m_ptr;
  }
  [(WKPasswordView *)v8 setUserDidEnterPassword:a4];
  [self->_passwordView.m_ptr showInScrollView:self->_scrollView.m_ptr];
  objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "setHidden:", 1);

  [(WKWebView *)self _didRequestPasswordForDocument];
}

- (void)_hidePasswordView
{
  if (self->_passwordView.m_ptr)
  {
    objc_msgSend(-[WKWebView _currentContentView](self, "_currentContentView"), "setHidden:", 0);
    [self->_passwordView.m_ptr hide];
    m_ptr = self->_passwordView.m_ptr;
    self->_passwordView.m_ptr = 0;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    [(WKWebView *)self _didStopRequestingPasswordForDocument];
  }
}

- (void)_didRequestPasswordForDocument
{
}

- (void)_didStopRequestingPasswordForDocument
{
}

- (WKPasswordView)_passwordView
{
  return (WKPasswordView *)self->_passwordView.m_ptr;
}

- (void)_resetScrollViewInsetAdjustmentBehavior
{
  [self->_scrollView.m_ptr _resetContentInsetAdjustmentBehavior];

  [(WKWebView *)self _updateScrollViewInsetAdjustmentBehavior];
}

- (void)_beginAnimatedFullScreenExit
{
  self->_perProcessState.isAnimatingFullScreenExit = 1;
}

- (void)_endAnimatedFullScreenExit
{
  BOOL isAnimatingFullScreenExit = self->_perProcessState.isAnimatingFullScreenExit;
  self->_perProcessState.BOOL isAnimatingFullScreenExit = 0;
  if (isAnimatingFullScreenExit && ![(WKWebView *)self _shouldDeferGeometryUpdates])
  {
    [(WKWebView *)self _didStopDeferringGeometryUpdates];
  }
}

- (void)removeFromSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)WKWebView;
  [(WKWebView *)&v3 removeFromSuperview];
  if ([self->_fullScreenWindowController.m_ptr isFullScreen]) {
    [self->_fullScreenWindowController.m_ptr webViewDidRemoveFromSuperviewWhileInFullscreen];
  }
}

- (void)_firePresentationUpdateForPendingStableStatePresentationCallbacks
{
  if (self) {
    CFRetain(self);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3321888768;
  v4[2] = __97__WKWebView_WKViewInternalIOS___firePresentationUpdateForPendingStableStatePresentationCallbacks__block_invoke;
  v4[3] = &__block_descriptor_40_e8_32c111_ZTSKZ97__WKWebView_WKViewInternalIOS___firePresentationUpdateForPendingStableStatePresentationCallbacks_E4__15_e5_v8__0l;
  if (self)
  {
    CFRetain(self);
    CFTypeRef cf = self;
    CFRetain(self);
  }
  else
  {
    CFTypeRef cf = 0;
  }
  [(WKWebView *)self _doAfterNextPresentationUpdate:v4];
  if (self) {
    CFRelease(self);
  }
  CFTypeRef v3 = cf;
  CFTypeRef cf = 0;
  if (v3) {
    CFRelease(v3);
  }
  if (self) {
    CFRelease(self);
  }
}

uint64_t __97__WKWebView_WKViewInternalIOS___firePresentationUpdateForPendingStableStatePresentationCallbacks__block_invoke(WTF::RunLoop *a1)
{
  WTF::RunLoop::main(a1);
  uint64_t v2 = (const void *)*((void *)a1 + 4);
  if (v2) {
    CFRetain(v2);
  }
  CFTypeRef v3 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v3 = &unk_1EE9CD420;
  v3[1] = v2;
  double v5 = v3;
  WTF::RunLoop::dispatch();
  uint64_t result = (uint64_t)v5;
  if (v5) {
    return (*(uint64_t (**)(void *))(*v5 + 8))(v5);
  }
  return result;
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WKWebView;
  -[WKWebView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    WebKit::WebPageProxy::setUserInterfaceLayoutDirection((uint64_t)m_ptr, [MEMORY[0x1E4F42FF0] userInterfaceLayoutDirectionForSemanticContentAttribute:a3] == 1);
  }
}

- (void)buildMenuWithBuilder:(id)a3
{
  if ([(WKWebView *)self usesStandardContentView]) {
    [self->_contentView.m_ptr buildMenuForWebViewWithBuilder:a3];
  }
  v5.receiver = self;
  v5.super_class = (Class)WKWebView;
  [(WKWebView *)&v5 buildMenuWithBuilder:a3];
}

- (BOOL)_shouldAvoidSecurityHeuristicScoreUpdates
{
  return [self->_contentView.m_ptr _shouldAvoidSecurityHeuristicScoreUpdates];
}

- (void)_beginLiveResize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_perProcessState = &self->_perProcessState;
  if (self->_perProcessState.liveResizeParameters.__engaged_)
  {
    CFTypeRef v3 = qword_1EB358438;
    if (!os_log_type_enabled((os_log_t)qword_1EB358438, OS_LOG_TYPE_FAULT)) {
      return;
    }
    LOWORD(v12) = 0;
    double v4 = "Error: _beginLiveResize called with an outstanding live resize.";
LABEL_7:
    _os_log_fault_impl(&dword_1985F2000, v3, OS_LOG_TYPE_FAULT, v4, (uint8_t *)&v12, 2u);
    return;
  }
  if (self->_perProcessState.dynamicViewportUpdateMode)
  {
    CFTypeRef v3 = qword_1EB358438;
    if (!os_log_type_enabled((os_log_t)qword_1EB358438, OS_LOG_TYPE_FAULT)) {
      return;
    }
    LOWORD(v12) = 0;
    double v4 = "Error: _beginLiveResize called during an animated resize.";
    goto LABEL_7;
  }
  objc_super v6 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    int v12 = 134218240;
    double v13 = self;
    __int16 v14 = 2048;
    uint64_t v15 = v7;
    _os_log_impl(&dword_1985F2000, v6, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _beginLiveResize]", (uint8_t *)&v12, 0x16u);
  }
  [(WKWebView *)self bounds];
  double v9 = v8;
  [(UIScrollView *)[(WKWebView *)self scrollView] contentOffset];
  p_perProcessState->liveResizeParameters.var0.__val_.viewdouble Width = v9;
  p_perProcessState->liveResizeParameters.var0.__val_.initialScrollPosition.CGFloat x = v10;
  p_perProcessState->liveResizeParameters.var0.__val_.initialScrollPosition.CGFloat y = v11;
  p_perProcessState->liveResizeParameters.__engaged_ = 1;
  [(WKWebView *)self _ensureResizeAnimationView];
}

- (id)_searchableObject
{
  p_m_ptr = &self->_customContentView.m_ptr;
  if (([self->_customContentView.m_ptr conformsToProtocol:&unk_1EEA718D0] & 1) == 0) {
    p_m_ptr = &self->_contentView.m_ptr;
  }
  return *p_m_ptr;
}

- (BOOL)supportsTextReplacement
{
  if (objc_opt_respondsToSelector())
  {
    m_ptr = self->_customContentView.m_ptr;
    return [m_ptr supportsTextReplacement];
  }
  else
  {
    objc_super v5 = self->_contentView.m_ptr;
    return [v5 supportsTextReplacementForWebView];
  }
}

- (id)_animationForFindOverlay:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = (void *)[MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
  objc_super v5 = v4;
  if (v3) {
    objc_super v6 = &unk_1EEA52DE0;
  }
  else {
    objc_super v6 = &unk_1EEA52DF8;
  }
  if (v3) {
    uint64_t v7 = &unk_1EEA52DF8;
  }
  else {
    uint64_t v7 = &unk_1EEA52DE0;
  }
  [v4 setFromValue:v6];
  [v5 setToValue:v7];
  [v5 setDuration:0.200000003];
  LODWORD(v8) = 1055119114;
  LODWORD(v9) = 1028443341;
  LODWORD(v10) = 1057803469;
  LODWORD(v11) = 1064514355;
  objc_msgSend(v5, "setTimingFunction:", objc_msgSend(MEMORY[0x1E4F39C10], "functionWithControlPoints::::", v8, v9, v10, v11));
  return v5;
}

- (void)_showFindOverlay
{
  p_findOverlaysOutsideContentView = &self->_findOverlaysOutsideContentView;
  if (!self->_findOverlaysOutsideContentView.__engaged_)
  {
    uint64_t v7 = [MEMORY[0x1E4F428B8] colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.250980392];
    id v8 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v8 setBackgroundColor:v7];
    [self->_scrollView.m_ptr insertSubview:v8 belowSubview:self->_contentView.m_ptr];
    uint64_t v9 = [MEMORY[0x1E4F428B8] colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.250980392];
    id v10 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v10 setBackgroundColor:v9];
    [self->_scrollView.m_ptr insertSubview:v10 belowSubview:self->_contentView.m_ptr];
    uint64_t v11 = [MEMORY[0x1E4F428B8] colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.250980392];
    id v12 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v12 setBackgroundColor:v11];
    [self->_scrollView.m_ptr insertSubview:v12 belowSubview:self->_contentView.m_ptr];
    uint64_t v13 = [MEMORY[0x1E4F428B8] colorWithRed:0.101960784 green:0.101960784 blue:0.101960784 alpha:0.250980392];
    id v14 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [v14 setBackgroundColor:v13];
    [self->_scrollView.m_ptr insertSubview:v14 belowSubview:self->_contentView.m_ptr];
    if (p_findOverlaysOutsideContentView->__engaged_)
    {
      m_ptr = p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr;
      p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr = v8;
      if (m_ptr) {
        CFRelease(m_ptr);
      }
      uint64_t v16 = p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr;
      p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr = v10;
      if (v16) {
        CFRelease(v16);
      }
      double v17 = p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr;
      p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr = v12;
      if (v17) {
        CFRelease(v17);
      }
      double v18 = p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr;
      p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr = v14;
      if (v18) {
        CFRelease(v18);
      }
    }
    else
    {
      p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr = v8;
      p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr = v10;
      p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr = v12;
      p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr = v14;
      p_findOverlaysOutsideContentView->__engaged_ = 1;
    }
  }
  [(WKWebView *)self _updateFindOverlayPosition];
  double v4 = [(WKWebView *)self _layerForFindOverlay];
  if (v4)
  {
    objc_super v5 = v4;
    [(WKWebView *)self _updateFindOverlaysOutsideContentView:&__block_literal_global_22];
    [(CALayer *)v5 removeAllAnimations];
    LODWORD(v6) = 1.0;
    [(CALayer *)v5 setOpacity:v6];
  }
  else
  {
    [(WKWebView *)self _updateFindOverlaysOutsideContentView:&__block_literal_global_303];
    [(WKWebView *)self _addLayerForFindOverlay];
  }
}

uint64_t __48__WKWebView_WKViewInternalIOS___showFindOverlay__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a2, "layer"), "removeAllAnimations");

  return [a2 setAlpha:1.0];
}

uint64_t __48__WKWebView_WKViewInternalIOS___showFindOverlay__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAlpha:0.0];
}

- (void)_hideFindOverlay
{
  unint64_t v3 = [(WKWebView *)self _layerForFindOverlay];
  if (self->_findOverlaysOutsideContentView.__engaged_) {
    uint64_t v4 = [self->_findOverlaysOutsideContentView.var0.__val_.top.m_ptr layer];
  }
  else {
    uint64_t v4 = 0;
  }
  if (v4 | v3)
  {
    if (![(id)v4 animationForKey:@"findOverlayFadeOut"])
    {
      [(id)v3 removeAllAnimations];
      [(WKWebView *)self _updateFindOverlaysOutsideContentView:&__block_literal_global_308];
      [MEMORY[0x1E4F39CF8] begin];
      id v5 = [(WKWebView *)self _animationForFindOverlay:0];
      double v6 = (void *)MEMORY[0x1E4F39CF8];
      id location = 0;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3321888768;
      v9[2] = __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_2;
      v9[3] = &__block_descriptor_40_e8_32c62_ZTSKZ48__WKWebView_WKViewInternalIOS___hideFindOverlay_E4__18_e5_v8__0l;
      objc_initWeak(&location, self);
      id v10 = 0;
      objc_copyWeak(&v10, &location);
      [v6 setCompletionBlock:v9];
      objc_destroyWeak(&location);
      [(id)v3 addAnimation:v5 forKey:@"findOverlayFadeOut"];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      uint64_t v7[2] = __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_310;
      v7[3] = &unk_1E5812AC8;
      v7[4] = v5;
      [(WKWebView *)self _updateFindOverlaysOutsideContentView:v7];
      [MEMORY[0x1E4F39CF8] commit];
      [(id)v3 setOpacity:0.0];
      [(WKWebView *)self _updateFindOverlaysOutsideContentView:&__block_literal_global_313];
      objc_destroyWeak(&v10);
    }
  }
}

uint64_t __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 layer];

  return [v2 removeAllAnimations];
}

void __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    unint64_t v3 = WeakRetained + 688;
    int v4 = WeakRetained[720];
    if (!WeakRetained[720] || ([*(id *)v3 alpha], v5 == 0.0))
    {
      [v2 _removeLayerForFindOverlay];
      if (v4)
      {
        [v2 _updateFindOverlaysOutsideContentView:&__block_literal_global_955];
        if (v3[32])
        {
          double v6 = (const void *)*((void *)v3 + 3);
          *((void *)v3 + 3) = 0;
          if (v6) {
            CFRelease(v6);
          }
          uint64_t v7 = (const void *)*((void *)v3 + 2);
          *((void *)v3 + 2) = 0;
          if (v7) {
            CFRelease(v7);
          }
          id v8 = (const void *)*((void *)v3 + 1);
          *((void *)v3 + 1) = 0;
          if (v8) {
            CFRelease(v8);
          }
          id v9 = *(id *)v3;
          *(void *)unint64_t v3 = 0;
          if (v9) {
            CFRelease(v9);
          }
          v3[32] = 0;
        }
      }
    }
    CFRelease(v2);
  }
}

uint64_t __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_310(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)[a2 layer];
  uint64_t v4 = *(void *)(a1 + 32);

  return [v3 addAnimation:v4 forKey:@"findOverlayFadeOut"];
}

uint64_t __48__WKWebView_WKViewInternalIOS___hideFindOverlay__block_invoke_2_311(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)[a2 layer];

  return [v2 setOpacity:0.0];
}

- (void)_enhancedWindowingToggled:(id)a3
{
  uint64_t v4 = [a3 object];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    uint64_t v4 = 0;
  }
  if (v4 == objc_msgSend((id)-[WKWebView window](self, "window"), "windowScene"))
  {
    m_ptr = self->_page.m_ptr;
    if (m_ptr)
    {
      if (!*((unsigned char *)m_ptr + 801))
      {
        if (*((unsigned char *)m_ptr + 800))
        {
          BOOL v6 = [(WKWebView *)self _isWindowResizingEnabled];
          WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetIsWindowResizingEnabled>(*((void *)m_ptr + 32), (char *)&v6, *(void *)(*((void *)m_ptr + 4) + 1928), 0);
        }
      }
    }
  }
}

+ (void)_clearLockdownModeWarningNeeded
{
  lockdownModeWarningNeeded = 1;
}

- (int64_t)_effectiveDataOwner:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3)
    {
      return 0;
    }
    else if (objc_msgSend((id)objc_msgSend((id)((uint64_t (*)(WKWebView *, SEL))*MEMORY[0x1E4FB6348])(self, a2), "sharedConnection"), "isURLManaged:", -[WKWebView URL](self, "URL")))
    {
      return 2;
    }
    else
    {
      return 1;
    }
  }
  return a3;
}

- (void)_updateFindOverlaysOutsideContentView:(id)a3
{
  p_findOverlaysOutsideContentView = &self->_findOverlaysOutsideContentView;
  if (self->_findOverlaysOutsideContentView.__engaged_)
  {
    (*((void (**)(id, void *))a3 + 2))(a3, p_findOverlaysOutsideContentView->var0.__val_.top.m_ptr);
    if (p_findOverlaysOutsideContentView->__engaged_
      && ((*((void (**)(id, void *))a3 + 2))(a3, p_findOverlaysOutsideContentView->var0.__val_.bottom.m_ptr),
          p_findOverlaysOutsideContentView->__engaged_)
      && ((*((void (**)(id, void *))a3 + 2))(a3, p_findOverlaysOutsideContentView->var0.__val_.left.m_ptr),
          p_findOverlaysOutsideContentView->__engaged_))
    {
      m_ptr = p_findOverlaysOutsideContentView->var0.__val_.right.m_ptr;
      BOOL v6 = (void (*)(id, void *))*((void *)a3 + 2);
      v6(a3, m_ptr);
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)_didAddLayerForFindOverlay:(id)a3
{
  Markable<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>, WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>::MarkableTraits> pendingFindLayerID = self->_perProcessState.pendingFindLayerID;
  self->_perProcessState.pendingFindLayerID.m_value.m_object.unint64_t m_identifier = 0;
  self->_perProcessState.pendingFindLayerID.m_value.m_processIdentifier.unint64_t m_identifier = 0;
  self->_perProcessState.committedFindLayerID = pendingFindLayerID;
  (*(void (**)(void))(**((void **)self->_page.m_ptr + 14) + 40))(*((void *)self->_page.m_ptr + 14));
  id v6 = [(WKWebView *)self _animationForFindOverlay:1];
  [a3 addAnimation:v6 forKey:@"findOverlayFadeIn"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__WKWebView_WKViewInternalIOS___didAddLayerForFindOverlay___block_invoke;
  v8[3] = &unk_1E5812AC8;
  v8[4] = v6;
  [(WKWebView *)self _updateFindOverlaysOutsideContentView:v8];
  LODWORD(v7) = 1.0;
  [a3 setOpacity:v7];
}

uint64_t __59__WKWebView_WKViewInternalIOS___didAddLayerForFindOverlay___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = (void *)[a2 layer];
  [v3 addAnimation:*(void *)(a1 + 32) forKey:@"findOverlayFadeIn"];
  LODWORD(v4) = 1.0;

  return [v3 setOpacity:v4];
}

- (void)_didRemoveLayerForFindOverlay
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr) {
    (*(void (**)(void))(**((void **)m_ptr + 14) + 48))();
  }
}

- (BOOL)_haveSetUnobscuredSafeAreaInsets
{
  return self->_haveSetUnobscuredSafeAreaInsets;
}

- (void)_resetContentOffset
{
  m_ptr = self->_scrollView.m_ptr;
  [(WKWebView *)self _initialContentOffsetForScrollView];

  objc_msgSend(m_ptr, "setContentOffset:");
}

- (void)_resetUnobscuredSafeAreaInsets
{
  self->_haveSetUnobscuredSafeAreaInsets = 0;
  *(_OWORD *)&self->_unobscuredSafeAreaInsets.double top = 0u;
  *(_OWORD *)&self->_unobscuredSafeAreaInsets.double bottom = 0u;
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
}

- (BOOL)_hasOverriddenLayoutParameters
{
  return self->_overriddenLayoutParameters.__engaged_;
}

- (void)_resetObscuredInsets
{
  self->_haveSetObscuredInsets = 0;
  *(_OWORD *)&self->_obscuredInsets.double top = 0u;
  *(_OWORD *)&self->_obscuredInsets.double bottom = 0u;
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
}

- (unint64_t)axesToPreventScrollingForPanGestureInScrollView:(id)a3
{
  double v5 = (void *)[a3 panGestureRecognizer];
  if (([self->_contentView.m_ptr preventsPanningInXAxis] & 1) == 0
    && ![self->_contentView.m_ptr preventsPanningInYAxis])
  {
    unint64_t v6 = 0;
LABEL_11:
    [self->_contentView.m_ptr cancelPointersForGestureRecognizer:v5];
    return v6;
  }
  unint64_t v6 = [self->_contentView.m_ptr preventsPanningInXAxis];
  if ([self->_contentView.m_ptr preventsPanningInYAxis]) {
    v6 |= 2uLL;
  }
  [v5 translationInView:a3];
  double v8 = v7;
  double v10 = v9;
  if (([self->_contentView.m_ptr preventsPanningInXAxis] & 1) == 0 && fabs(v8) > 2.22044605e-16
    || ([self->_contentView.m_ptr preventsPanningInYAxis] & 1) == 0 && fabs(v10) > 2.22044605e-16)
  {
    goto LABEL_11;
  }
  return v6;
}

- (void)_overrideZoomScaleParametersWithMinimumZoomScale:(double)a3 maximumZoomScale:(double)a4 allowUserScaling:(BOOL)a5
{
  BOOL v5 = a5;
  if (!self->_overriddenZoomScaleParameters.__engaged_) {
    self->_overriddenZoomScaleParameters.__engaged_ = 1;
  }
  self->_overriddenZoomScaleParameters.var0.__val_.minimumZoomScale = a3;
  self->_overriddenZoomScaleParameters.var0.__val_.maximumZoomScale = a4;
  self->_overriddenZoomScaleParameters.var0.__val_.allowUserScaling = a5;
  objc_msgSend(self->_scrollView.m_ptr, "setMinimumZoomScale:");
  [self->_scrollView.m_ptr setMaximumZoomScale:a4];
  m_ptr = self->_scrollView.m_ptr;

  [m_ptr _setZoomEnabledInternal:v5];
}

- (void)_clearOverrideZoomScaleParameters
{
  if (self->_overriddenZoomScaleParameters.__engaged_) {
    self->_overriddenZoomScaleParameters.__engaged_ = 0;
  }
}

WTF *__60__WKWebView_WKViewInternalIOS___updatePageLoadObserverState__block_invoke(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (long long *)(a1 + 40);
  if ((_MergedGlobals_77 & 1) == 0)
  {
    qword_1EB359950 = 0;
    _MergedGlobals_77 = 1;
    goto LABEL_18;
  }
  uint64_t v3 = qword_1EB359950;
  if (!qword_1EB359950) {
    goto LABEL_18;
  }
  long long v4 = *(_OWORD *)(a1 + 56);
  long long v51 = *v2;
  long long v52 = v4;
  int v53 = *(_DWORD *)(a1 + 72);
  if (!*(unsigned char *)(qword_1EB359950 + 36))
  {
    if ((_BYTE)v53) {
      goto LABEL_18;
    }
LABEL_65:
    ++*(_DWORD *)qword_1EB359950;
    goto LABEL_46;
  }
  if ((_BYTE)v53)
  {
    BOOL v5 = *(void *)(qword_1EB359950 + 4) == (void)v51 && *(void *)(qword_1EB359950 + 12) == *((void *)&v51 + 1);
    BOOL v6 = v5 && *(void *)(qword_1EB359950 + 20) == (void)v52;
    if (v6 && *(void *)(qword_1EB359950 + 28) == *((void *)&v52 + 1)) {
      goto LABEL_65;
    }
  }
LABEL_18:
  long long v8 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)buf.double val = *v2;
  *(_OWORD *)&buf.val[4] = v8;
  LODWORD(v57) = *(_DWORD *)(a1 + 72);
  uint64_t v3 = WTF::fastMalloc((WTF *)0x40);
  *(_DWORD *)uint64_t v3 = 1;
  char v9 = v57;
  *(_DWORD *)(v3 + 36) = v57;
  *(audit_token_t *)(v3 + 4) = buf;
  *(void *)(v3 + 40) = 0;
  *(_DWORD *)(v3 + 48) = 0;
  *(void *)(v3 + 56) = 0;
  CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (v9)
  {
    audit_token_t token = buf;
    uint64_t v11 = SecTaskCreateWithAuditToken(v10, &token);
  }
  else
  {
    uint64_t v11 = SecTaskCreateFromSelf(v10);
  }
  uint64_t v13 = v11;
  if (!v11) {
    goto LABEL_43;
  }
  CFStringRef v14 = SecTaskCopySigningIdentifier(v11, 0);
  CFStringRef v15 = v14;
  if (v14) {
    CFRetain(v14);
  }
  uint64_t v16 = *(const void **)(v3 + 40);
  *(void *)(v3 + 40) = v15;
  if (v16) {
    CFRelease(v16);
  }
  if (WTF::hasEntitlement())
  {
    int v17 = 1;
LABEL_30:
    *(_DWORD *)(v3 + 48) = v17;
    goto LABEL_31;
  }
  if ([*(id *)(v3 + 40) isEqualToString:@"com.apple.webapp"])
  {
    int v17 = 2;
    goto LABEL_30;
  }
LABEL_31:
  if (*(unsigned char *)(v3 + 36)) {
    *(_DWORD *)(v3 + 48) = 3;
  }
  CFTypeRef v18 = SecTaskCopyValueForEntitlement(v13, @"com.apple.developer.associated-domains", 0);
  double v19 = WTF::dynamic_cf_cast<__CFArray const*>(v18);
  if (v19)
  {
    CGFloat v20 = (const void *)[MEMORY[0x1E4F9F408] serviceSpecifiersWithEntitlementValue:v19 serviceType:*MEMORY[0x1E4F9F410] error:0];
    CGFloat v21 = v20;
    if (v20) {
      CFRetain(v20);
    }
    CGFloat v22 = *(const void **)(v3 + 56);
    *(void *)(v3 + 56) = v21;
    if (v22) {
      CFRelease(v22);
    }
  }
  if (v18) {
    CFRelease(v18);
  }
  if (v15) {
    CFRelease(v15);
  }
  CFRelease(v13);
LABEL_43:
  ++*(_DWORD *)v3;
  CGFloat v23 = (WTF *)qword_1EB359950;
  qword_1EB359950 = v3;
  if (v23) {
  BOOL v24 = qword_1EB358258;
  }
  if (os_log_type_enabled((os_log_t)qword_1EB358258, OS_LOG_TYPE_DEBUG))
  {
    CGRect v38 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(v3 + 56), "count"));
    long long v59 = 0u;
    long long v60 = 0u;
    memset(&token, 0, sizeof(token));
    CGRect v39 = *(void **)(v3 + 56);
    uint64_t v40 = [v39 countByEnumeratingWithState:&token objects:&buf count:16];
    if (v40)
    {
      uint64_t v41 = **(void **)&token.val[4];
      while (2)
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (**(void **)&token.val[4] != v41) {
            objc_enumerationMutation(v39);
          }
          uint64_t v43 = [*(id *)(*(void *)&token.val[2] + 8 * i) domain];
          if (v43)
          {
            if ((unint64_t)[v38 count] >= 6)
            {
              [v38 addObject:@"..."];
              goto LABEL_78;
            }
            [v38 addObject:v43];
          }
        }
        uint64_t v40 = [v39 countByEnumeratingWithState:&token objects:&buf count:16];
        if (v40) {
          continue;
        }
        break;
      }
    }
LABEL_78:
    long long v44 = *(__CFString **)(v3 + 40);
    if (!v44) {
      long long v44 = @"unknown";
    }
    v55[0] = v44;
    v54[0] = @"bundleID";
    v54[1] = @"appType";
    uint64_t v45 = [NSNumber numberWithInt:*(unsigned int *)(v3 + 48)];
    v54[2] = @"domains";
    v55[1] = v45;
    v55[2] = v38;
    long long v46 = (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];
    long long v47 = v46;
    if (v46) {
      CFRetain(v46);
    }
    if (v38) {
      CFRelease(v38);
    }
    int v49 = 138739971;
    double v50 = v47;
    _os_log_debug_impl(&dword_1985F2000, v24, OS_LOG_TYPE_DEBUG, "Loaded app state: %{sensitive}@", (uint8_t *)&v49, 0xCu);
    if (v47) {
      CFRelease(v47);
    }
  }
LABEL_46:
  if (*(_DWORD *)(v3 + 48) == 1)
  {
    uint64_t v25 = 1;
  }
  else
  {
    uint64_t v26 = *(void *)(a1 + 32);
    memset(&token, 0, sizeof(token));
    long long v59 = 0u;
    long long v60 = 0u;
    CGFloat v27 = *(void **)(v3 + 56);
    uint64_t v28 = [v27 countByEnumeratingWithState:&token objects:&buf count:16];
    if (v28)
    {
      uint64_t v29 = **(void **)&token.val[4];
      while (2)
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (**(void **)&token.val[4] != v29) {
            objc_enumerationMutation(v27);
          }
          if ([*(id *)(*(void *)&token.val[2] + 8 * j) domainEncompassesDomain:v26])
          {
            CGRect v36 = qword_1EB358258;
            if (os_log_type_enabled((os_log_t)qword_1EB358258, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v48 = *(void *)(a1 + 32);
              buf.val[0] = 138739971;
              *(void *)&buf.val[1] = v48;
              _os_log_debug_impl(&dword_1985F2000, v36, OS_LOG_TYPE_DEBUG, "Ignoring event: host %{sensitive}@ matches first party domain", (uint8_t *)&buf, 0xCu);
            }
          }
        }
        uint64_t v28 = [v27 countByEnumeratingWithState:&token objects:&buf count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
    uint64_t v25 = *(unsigned int *)(v3 + 48);
  }
  double v31 = *(__CFString **)(v3 + 40);
  if (!v31) {
    double v31 = @"unknown";
  }
  *(void *)token.double val = v31;
  *(void *)&long long v51 = @"bundleID";
  *((void *)&v51 + 1) = @"appType";
  uint64_t v32 = [NSNumber numberWithInt:v25];
  *(void *)&long long v52 = @"pageLoadCount";
  *(void *)&token.val[2] = v32;
  *(void *)&token.val[4] = &unk_1EEA52DF8;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&token forKeys:&v51 count:3];
  double v34 = qword_1EB358258;
  if (os_log_type_enabled((os_log_t)qword_1EB358258, OS_LOG_TYPE_DEBUG))
  {
    buf.val[0] = 138739971;
    *(void *)&buf.val[1] = v33;
    _os_log_debug_impl(&dword_1985F2000, v34, OS_LOG_TYPE_DEBUG, "Submitting event %{sensitive}@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)buf.double val = MEMORY[0x1E4F143A8];
  *(void *)&buf.val[2] = 3221225472;
  *(void *)&buf.val[4] = ___ZL26sendPageLoadAnalyticsEventON3WTF9RetainPtrI8NSStringEENSt3__18optionalI13audit_token_tEE_block_invoke;
  *(void *)&buf.val[6] = &unk_1E5812AF0;
  uint64_t v57 = v33;
  AnalyticsSendEventLazy();
}

- (void)_setUIEventAttribution:(id)a3
{
  if (a3)
  {
    char v5 = [a3 sourceIdentifier];
    MEMORY[0x19972E8A0](v27, [a3 reportEndpoint]);
    WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v28, (const WTF::URL *)v27);
    MEMORY[0x19972E8A0](v25, [a3 destinationURL]);
    BOOL v6 = WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v26, (const WTF::URL *)v25);
    double v7 = (WTF::WallTime *)WebCore::applicationBundleIdentifier((uint64_t *)&v24, v6);
    WTF::WallTime::now(v7);
    v29[0] = v5;
    CFAllocatorRef v10 = v28;
    if (v28) {
      *(_DWORD *)v28 += 2;
    }
    CGFloat v30 = v10;
    uint64_t v11 = v26;
    if (v26) {
      *(_DWORD *)v26 += 2;
    }
    double v31 = v11;
    uint64_t v32 = v9;
    char v33 = 0;
    char v34 = 0;
    char v35 = 0;
    char v36 = 0;
    char v37 = 0;
    char v38 = 0;
    char v39 = 0;
    char v40 = 0;
    char v41 = 0;
    char v42 = 0;
    char v43 = 0;
    char v47 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
    char v46 = 0;
    id v12 = v24;
    if (v24)
    {
      int v13 = *(_DWORD *)v24;
      *(_DWORD *)v24 += 2;
      uint64_t v48 = v12;
      BOOL v24 = 0;
      if (v13)
      {
        *(_DWORD *)id v12 = v13;
      }
      else
      {
        WTF::StringImpl::destroy(v12, v8);
        uint64_t v11 = v26;
      }
    }
    else
    {
      uint64_t v48 = 0;
    }
    uint64_t v26 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v8);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
    CFStringRef v15 = v25[0];
    v25[0] = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2) {
        WTF::StringImpl::destroy(v15, v8);
      }
      else {
        *(_DWORD *)v15 -= 2;
      }
    }
    uint64_t v16 = v28;
    uint64_t v28 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v8);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    int v17 = v27[0];
    v27[0] = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v8);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
    m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v23, [a3 sourceDescription]);
    MEMORY[0x19972EAD0](&v22, [a3 purchaser]);
    WebKit::WebPageProxy::setPrivateClickMeasurement((uint64_t)m_ptr, v29, &v23, &v22);
    CGFloat v20 = v22;
    CGFloat v22 = 0;
    if (v20)
    {
      if (*(_DWORD *)v20 == 2) {
        WTF::StringImpl::destroy(v20, v19);
      }
      else {
        *(_DWORD *)v20 -= 2;
      }
    }
    CGFloat v21 = v23;
    CGFloat v23 = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2) {
        WTF::StringImpl::destroy(v21, v19);
      }
      else {
        *(_DWORD *)v21 -= 2;
      }
    }
    WebCore::PrivateClickMeasurement::~PrivateClickMeasurement((WebCore::PrivateClickMeasurement *)v29, v19);
  }
  else
  {
    CFStringRef v14 = (WebCore::PrivateClickMeasurement *)(*((void *)self->_page.m_ptr + 4) + 1368);
    std::__optional_destruct_base<WebKit::PrivateClickMeasurementAndMetadata,false>::reset[abi:sn180100](v14, (WTF::StringImpl *)a2);
  }
}

- (UIEventAttribution)_uiEventAttribution
{
  WebKit::WebPageProxy::privateClickMeasurementEventAttribution((uint64_t)self->_page.m_ptr, (uint64_t)v18);
  if (!v22)
  {
    double v7 = 0;
LABEL_24:
    std::__optional_destruct_base<WebKit::WebPageProxy::EventAttribution,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v18, v2);
    return v7;
  }
  uint64_t v3 = v19;
  if (v19) {
    *(_DWORD *)v19 += 2;
  }
  CFStringRef v15 = v3;
  v23[0] = (uint64_t)"https://";
  v23[1] = 9;
  uint64_t result = (UIEventAttribution *)WTF::tryMakeString<WTF::ASCIILiteral,WTF::String>(v23, (uint64_t *)&v15, &v16);
  if (v16)
  {
    MEMORY[0x19972E890](&v17, &v16, 0);
    BOOL v6 = v16;
    uint64_t v16 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v5);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    long long v8 = v15;
    CFStringRef v15 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2) {
        WTF::StringImpl::destroy(v8, v5);
      }
      else {
        *(_DWORD *)v8 -= 2;
      }
    }
    uint64_t result = (UIEventAttribution *)objc_alloc(MEMORY[0x1E4F42A00]);
    if (v22)
    {
      uint64_t v9 = result;
      uint64_t v10 = v18[0];
      uint64_t result = (UIEventAttribution *)WTF::URL::operator NSURL *();
      if (v22)
      {
        uint64_t v11 = result;
        if (!v20)
        {
          id v12 = (UIEventAttribution *)&stru_1EEA10550;
          goto LABEL_18;
        }
        uint64_t result = (UIEventAttribution *)WTF::StringImpl::operator NSString *();
        id v12 = result;
        if (v22)
        {
LABEL_18:
          if (v21) {
            int v13 = (__CFString *)WTF::StringImpl::operator NSString *();
          }
          else {
            int v13 = &stru_1EEA10550;
          }
          double v7 = (id)CFMakeCollectable(-[UIEventAttribution initWithSourceIdentifier:destinationURL:sourceDescription:purchaser:](v9, "initWithSourceIdentifier:destinationURL:sourceDescription:purchaser:", v10, v11, v12, v13, v15, v16));
          CFStringRef v14 = v17;
          int v17 = 0;
          if (v14)
          {
            if (*(_DWORD *)v14 == 2) {
              WTF::StringImpl::destroy(v14, v2);
            }
            else {
              *(_DWORD *)v14 -= 2;
            }
          }
          goto LABEL_24;
        }
      }
    }
  }
  else
  {
    __break(0xC471u);
  }
  __break(1u);
  return result;
}

- (void)_setEphemeralUIEventAttribution:(id)a3
{
}

- (void)_setEphemeralUIEventAttribution:(id)a3 forApplicationWithBundleID:(id)a4
{
  if (a3)
  {
    char v7 = [a3 sourceIdentifier];
    MEMORY[0x19972E8A0](v28, [a3 reportEndpoint]);
    WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v29, (const WTF::URL *)v28);
    MEMORY[0x19972E8A0](v26, [a3 destinationURL]);
    WebCore::RegistrableDomain::RegistrableDomain((WebCore::RegistrableDomain *)&v27, (const WTF::URL *)v26);
    long long v8 = (WTF::WallTime *)MEMORY[0x19972EAD0](&v25, a4);
    WTF::WallTime::now(v8);
    v30[0] = v7;
    uint64_t v11 = v29;
    if (v29) {
      *(_DWORD *)v29 += 2;
    }
    double v31 = v11;
    id v12 = v27;
    if (v27) {
      *(_DWORD *)v27 += 2;
    }
    uint64_t v32 = v12;
    uint64_t v33 = v10;
    char v34 = 1;
    char v35 = 0;
    char v36 = 0;
    char v37 = 0;
    char v38 = 0;
    char v39 = 0;
    char v40 = 0;
    char v41 = 0;
    char v42 = 0;
    char v43 = 0;
    char v44 = 0;
    char v48 = 0;
    long long v45 = 0u;
    long long v46 = 0u;
    char v47 = 0;
    int v13 = v25;
    if (v25)
    {
      int v14 = *(_DWORD *)v25;
      *(_DWORD *)v25 += 2;
      int v49 = v13;
      uint64_t v25 = 0;
      if (v14)
      {
        *(_DWORD *)int v13 = v14;
      }
      else
      {
        WTF::StringImpl::destroy(v13, v9);
        id v12 = v27;
      }
    }
    else
    {
      int v49 = 0;
    }
    CGFloat v27 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2) {
        WTF::StringImpl::destroy(v12, v9);
      }
      else {
        *(_DWORD *)v12 -= 2;
      }
    }
    uint64_t v16 = v26[0];
    v26[0] = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v9);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    int v17 = v29;
    uint64_t v29 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v9);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
    CFTypeRef v18 = v28[0];
    v28[0] = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2) {
        WTF::StringImpl::destroy(v18, v9);
      }
      else {
        *(_DWORD *)v18 -= 2;
      }
    }
    m_ptr = self->_page.m_ptr;
    MEMORY[0x19972EAD0](&v24, [a3 sourceDescription]);
    MEMORY[0x19972EAD0](&v23, [a3 purchaser]);
    WebKit::WebPageProxy::setPrivateClickMeasurement((uint64_t)m_ptr, v30, &v24, &v23);
    uint64_t v21 = v23;
    CGFloat v23 = 0;
    if (v21)
    {
      if (*(_DWORD *)v21 == 2) {
        WTF::StringImpl::destroy(v21, v20);
      }
      else {
        *(_DWORD *)v21 -= 2;
      }
    }
    char v22 = v24;
    BOOL v24 = 0;
    if (v22)
    {
      if (*(_DWORD *)v22 == 2) {
        WTF::StringImpl::destroy(v22, v20);
      }
      else {
        *(_DWORD *)v22 -= 2;
      }
    }
    WebCore::PrivateClickMeasurement::~PrivateClickMeasurement((WebCore::PrivateClickMeasurement *)v30, v20);
  }
  else
  {
    CFStringRef v15 = (WebCore::PrivateClickMeasurement *)(*((void *)self->_page.m_ptr + 4) + 1368);
    std::__optional_destruct_base<WebKit::PrivateClickMeasurementAndMetadata,false>::reset[abi:sn180100](v15, (WTF::StringImpl *)a2);
  }
}

- (CGRect)_contentVisibleRect
{
  [(WKWebView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(WKWebView *)self _currentContentView];

  -[WKWebView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGSize)_minimumLayoutSizeOverride
{
  p_overriddenLayoutParameters = &self->_overriddenLayoutParameters;
  if (!self->_overriddenLayoutParameters.__engaged_) {
    p_overriddenLayoutParameters = (optional<OverriddenLayoutParameters> *)MEMORY[0x1E4F1DB30];
  }
  double width = p_overriddenLayoutParameters->var0.__val_.viewLayoutSize.width;
  double height = p_overriddenLayoutParameters->var0.__val_.viewLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)_minimumUnobscuredSizeOverride
{
  p_double height = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize.height;
  if (self->_overriddenLayoutParameters.__engaged_) {
    p_minimumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.minimumUnobscuredSize;
  }
  else {
    p_minimumUnobscuredSize = (CGSize *)MEMORY[0x1E4F1DB30];
  }
  if (!self->_overriddenLayoutParameters.__engaged_) {
    p_double height = (CGFloat *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v4 = *p_height;
  double width = p_minimumUnobscuredSize->width;
  result.double height = v4;
  result.double width = width;
  return result;
}

- (CGSize)_maximumUnobscuredSizeOverride
{
  p_double height = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize.height;
  if (self->_overriddenLayoutParameters.__engaged_) {
    p_maximumUnobscuredSize = &self->_overriddenLayoutParameters.var0.__val_.maximumUnobscuredSize;
  }
  else {
    p_maximumUnobscuredSize = (CGSize *)MEMORY[0x1E4F1DB30];
  }
  if (!self->_overriddenLayoutParameters.__engaged_) {
    p_double height = (CGFloat *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v4 = *p_height;
  double width = p_maximumUnobscuredSize->width;
  result.double height = v4;
  result.double width = width;
  return result;
}

- (unint64_t)_obscuredInsetEdgesAffectedBySafeArea
{
  return self->_obscuredInsetEdgesAffectedBySafeArea;
}

- (void)_setObscuredInsetEdgesAffectedBySafeArea:(unint64_t)a3
{
  if (self->_obscuredInsetEdgesAffectedBySafeArea != a3)
  {
    self->_obscuredInsetEdgesAffectedBySafeArea = a3;
    [(WKWebView *)self _scheduleVisibleContentRectUpdate];
  }
}

- (UIEdgeInsets)_unobscuredSafeAreaInsets
{
  double top = self->_unobscuredSafeAreaInsets.top;
  double left = self->_unobscuredSafeAreaInsets.left;
  double bottom = self->_unobscuredSafeAreaInsets.bottom;
  double right = self->_unobscuredSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)_interfaceOrientationOverride
{
  return self->_interfaceOrientationOverride;
}

- (void)_clearInterfaceOrientationOverride
{
  self->_overridesInterfaceOrientation = 0;
  self->_interfaceOrientationOverride = 1;
}

- (NSData)_dataForDisplayedPDF
{
  if (![(WKWebView *)self _isDisplayingPDF]) {
    return 0;
  }
  m_ptr = self->_customContentView.m_ptr;

  return (NSData *)objc_msgSend(m_ptr, "web_dataRepresentation");
}

- (NSString)_suggestedFilenameForDisplayedPDF
{
  if (![(WKWebView *)self _isDisplayingPDF]) {
    return 0;
  }
  m_ptr = self->_customContentView.m_ptr;

  return (NSString *)objc_msgSend(m_ptr, "web_suggestedFilename");
}

- (void)_setDragInteractionPolicy:(unint64_t)a3
{
  if (self->_dragInteractionPolicy != a3)
  {
    self->_dragInteractionPolicCGFloat y = a3;
    [self->_contentView.m_ptr _didChangeDragInteractionPolicy];
  }
}

- (BOOL)_shouldAvoidResizingWhenInputViewBoundsChange
{
  return [self->_contentView.m_ptr _shouldAvoidResizingWhenInputViewBoundsChange];
}

- (CGRect)_uiTextCaretRect
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (CGPoint)_convertPointFromContentsToView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(WKWebView *)self _currentContentView];

  -[WKWebView convertPoint:fromView:](self, "convertPoint:fromView:", v6, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGPoint)_convertPointFromViewToContents:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(WKWebView *)self _currentContentView];

  -[WKWebView convertPoint:toView:](self, "convertPoint:toView:", v6, x, y);
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)_doAfterNextStablePresentationUpdate:(id)a3
{
  double v5 = (WTF::RunLoop *)[(WKWebView *)self usesStandardContentView];
  if (v5)
  {
    id v6 = _Block_copy(a3);
    m_ptr = self->_stableStatePresentationUpdateCallbacks.m_ptr;
    if (m_ptr)
    {
      [m_ptr addObject:v6];
    }
    else
    {
      double v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v6, 0);
      id v11 = self->_stableStatePresentationUpdateCallbacks.m_ptr;
      self->_stableStatePresentationUpdateCallbacks.m_ptr = v10;
      if (v11) {
        CFRelease(v11);
      }
      [(WKWebView *)self _firePresentationUpdateForPendingStableStatePresentationCallbacks];
    }
    _Block_release(v6);
  }
  else
  {
    WTF::RunLoop::main(v5);
    double v8 = _Block_copy(a3);
    double v9 = (void *)WTF::fastMalloc((WTF *)0x10);
    *double v9 = &unk_1EE9CD6B8;
    v9[1] = v8;
    double v12 = v9;
    WTF::RunLoop::dispatch();
    if (v12) {
      (*(void (**)(void *))(*v12 + 8))(v12);
    }
    _Block_release(0);
  }
}

- (void)_setFont:(id)a3 sender:(id)a4
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _setFontForWebView:a3 sender:a4];
  }
}

- (void)_setFontSize:(double)a3 sender:(id)a4
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _setFontSizeForWebView:a4 sender:a3];
  }
}

- (void)_setTextColor:(id)a3 sender:(id)a4
{
  if ([(WKWebView *)self usesStandardContentView])
  {
    m_ptr = self->_contentView.m_ptr;
    [m_ptr _setTextColorForWebView:a3 sender:a4];
  }
}

- (void)_detectDataWithTypes:(unint64_t)a3 completionHandler:(id)a4
{
  char v4 = a3;
  m_ptr = self->_page.m_ptr;
  double v7 = _Block_copy(a4);
  double v8 = self->_page.m_ptr;
  if (v8)
  {
    double v9 = (atomic_uint **)((char *)v8 + 24);
    WTF::WeakPtrFactory<IPC::MessageReceiver,WTF::DefaultWeakPtrImpl>::initializeIfNeeded((unsigned int *)v8 + 6, (uint64_t)v8 + 16);
    double v10 = *v9;
    if (v10) {
      atomic_fetch_add(v10, 1u);
    }
  }
  else
  {
    double v10 = 0;
  }
  id v11 = (void *)WTF::fastMalloc((WTF *)0x18);
  *id v11 = &unk_1EE9CD6E0;
  v11[1] = v7;
  v11[2] = v10;
  double v13 = v11;
  WebKit::WebPageProxy::detectDataInAllFrames((uint64_t)m_ptr, v4 & 0x7F, (uint64_t *)&v13);
  uint64_t v12 = (uint64_t)v13;
  double v13 = 0;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
  }
  _Block_release(0);
}

- (void)_requestActivatedElementAtPosition:(CGPoint)a3 completionBlock:(id)a4
{
  CGPoint v17 = a3;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v16, &v17);
  float v6 = roundf(v16[0]);
  uint64_t v7 = 0x80000000;
  if (v6 > -2147500000.0) {
    uint64_t v7 = (int)v6;
  }
  if (v6 < 2147500000.0) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0x7FFFFFFFLL;
  }
  float v9 = roundf(v16[1]);
  unint64_t v10 = 0x8000000000000000;
  if (v9 > -2147500000.0) {
    unint64_t v10 = (unint64_t)(int)v9 << 32;
  }
  if (v9 < 2147500000.0) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0x7FFFFFFF00000000;
  }
  m_ptr = self->_contentView.m_ptr;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  void v14[2] = __78__WKWebView_WKPrivateIOS___requestActivatedElementAtPosition_completionBlock___block_invoke;
  v14[3] = &__block_descriptor_40_e8_32c92_ZTSKZ78__WKWebView_WKPrivateIOS___requestActivatedElementAtPosition_completionBlock__E4__24_e6320_v648__0_InteractionInformationAtPosition__InteractionInformationRequest__IntPoint_ii_BBBBBBB_B_optional_BOOL_____cB_B_CBBBBBBBBBBBBB_Markable_WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____WebCore::ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__::MarkableTraits___ProcessQualified_WTF::ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes____ObjectIdentifierGeneric_WebCore::ScrollingNodeIDType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___BBBBBB_FloatPoint_ff__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__URL__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___b1b1b1b3b26IIIIIII__String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____IntRect__IntPoint_ii__IntSize_ii___RefPtr_WebCore::ShareableBitmap__WTF::RawPtrTraits_WebCore::ShareableBitmap___WTF::DefaultRefDerefTraits_WebCore::ShareableBitmap_____ShareableBitmap___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl___f_FloatRect__FloatPoint_ff__FloatSize_ff___optional_WebCore::Cursor_____c_Cursor_C_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___IntPoint_ii__v__B__TextIndicatorData__FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___FloatRect__FloatPoint_ff__FloatSize_ff___Vector_WebCore::FloatRect__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____FloatRect_II_f_RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___RefPtr_WebCore::Image__WTF::RawPtrTraits_WebCore::Image___WTF::DefaultRefDerefTraits_WebCore::Image_____Image___Color_Q_C_OptionSet_WebCore::TextIndicatorOption__S___String__RefPtr_WTF::StringImpl__WTF::RawPtrTraits_WTF::StringImpl___WTF::DefaultRefDerefTraits_WTF::StringImpl_____StringImpl____RetainPtr_NSArray___v__IntRect__IntPoint_ii__IntSize_ii___optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__optional_WebCore::ElementContext_____c_ElementContext__FloatRect__FloatPoint_ff__FloatSize_ff___Markable_WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::PageIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q___ProcessQualified_WTF::UUID___UUID_T__ObjectIdentifierGeneric_WebCore::ProcessIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::Yes__Q___Markable_WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No___WTF::ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No_::MarkableTraits___ObjectIdentifierGeneric_WebCore::ElementIdentifierType__WTF::ObjectIdentifierMainThreadAccessTraits_uint64_t___unsigned_long_long__WTF::SupportsObjectIdentifierNullState::No__Q____B__Vector_WebCore::ElementAnimationContext__0UL__WTF::CrashOnOverflow__16UL__WTF::FastMalloc____ElementAnimationContext_II__8l;
  double v13 = _Block_copy(a4);
  CGRect aBlock = _Block_copy(v13);
  objc_msgSend(m_ptr, "doAfterPositionInformationUpdate:forRequest:", v14, v11 | v8, 16777217);
  _Block_release(v13);
  _Block_release(aBlock);
}

uint64_t __78__WKWebView_WKPrivateIOS___requestActivatedElementAtPosition_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  +[_WKActivatedElementInfo activatedElementInfoWithInteractionInformationAtPosition:a2 userInfo:0];
  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)_beginInteractiveObscuredInsetsChange
{
  self->_isChangingObscuredInsetsInteractiveldouble y = 1;
}

- (void)_endInteractiveObscuredInsetsChange
{
  self->_isChangingObscuredInsetsInteractiveldouble y = 0;
  [(WKWebView *)self _scheduleVisibleContentRectUpdate];
}

- (void)_hideContentUntilNextUpdate
{
  uint64_t v2 = *((void *)self->_page.m_ptr + 29);
  if (v2) {
    (*(void (**)(void))(*(void *)v2 + 176))();
  }
}

- (void)_endAnimatedResize
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v3 = qword_1EB358730;
  if (os_log_type_enabled((os_log_t)qword_1EB358730, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(*((void *)self->_page.m_ptr + 4) + 760);
    int dynamicViewportUpdateMode = self->_perProcessState.dynamicViewportUpdateMode;
    int v6 = 134218496;
    uint64_t v7 = self;
    __int16 v8 = 2048;
    uint64_t v9 = v4;
    __int16 v10 = 1024;
    int v11 = dynamicViewportUpdateMode;
    _os_log_impl(&dword_1985F2000, v3, OS_LOG_TYPE_DEFAULT, "%p (pageProxyID=%llu) -[WKWebView _endAnimatedResize] dynamicViewportUpdateMode %d", (uint8_t *)&v6, 0x1Cu);
  }
  self->_perProcessState.waitingForEndAnimatedReCGSize size = 0;
  if (!self->_perProcessState.waitingForCommitAfterAnimatedResize) {
    [(WKWebView *)self _didCompleteAnimatedResize];
  }
}

- (void)_setSuppressSoftwareKeyboard:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WKWebView;
  [(WKWebView *)&v4 _setSuppressSoftwareKeyboard:a3];
  [self->_contentView.m_ptr updateSoftwareKeyboardSuppressionStateFromWebView];
}

- (void)_snapshotRectAfterScreenUpdates:(BOOL)a3 rectInViewCoordinates:(CGRect)a4 intoImageOfWidth:(double)a5 completionHandler:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v12 = a3;
  if ([(WKWebView *)self _shouldDeferGeometryUpdates])
  {
    if (self) {
      CFRetain(self);
    }
    double v14 = _Block_copy(a6);
    p_callbacksDeferredDuringReCGSize size = &self->_callbacksDeferredDuringResize;
    m_CGSize size = self->_callbacksDeferredDuringResize.m_size;
    if (m_size == self->_callbacksDeferredDuringResize.m_capacity)
    {
      unint64_t v17 = m_size + (m_size >> 2);
      if (v17 >= 0x10) {
        unint64_t v18 = v17 + 1;
      }
      else {
        unint64_t v18 = 16;
      }
      if (v18 <= m_size + 1) {
        unint64_t v19 = m_size + 1;
      }
      else {
        unint64_t v19 = v18;
      }
      WTF::Vector<WTF::Function<void ()(void)>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)&self->_callbacksDeferredDuringResize, v19);
      m_CGSize size = self->_callbacksDeferredDuringResize.m_size;
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      uint64_t v21 = WTF::fastMalloc((WTF *)0x48);
    }
    else
    {
      m_buffer = p_callbacksDeferredDuringResize->m_buffer;
      uint64_t v21 = WTF::fastMalloc((WTF *)0x48);
    }
    *(void *)uint64_t v21 = &unk_1EE9CD708;
    *(void *)(v21 + 8) = self;
    *(unsigned char *)(v21 + 16) = v12;
    *(double *)(v21 + 24) = x;
    *(double *)(v21 + 32) = y;
    *(double *)(v21 + 40) = width;
    *(double *)(v21 + 48) = height;
    *(double *)(v21 + 56) = a5;
    *(void *)(v21 + 64) = v14;
    m_buffer[m_size] = v21;
    ++self->_callbacksDeferredDuringResize.m_size;
    _Block_release(0);
  }
  else
  {
    double v59 = x;
    double v60 = y;
    -[WKWebView convertRect:toView:](self, "convertRect:toView:", [(WKWebView *)self _currentContentView], x, y, width, height);
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    *(double *)CGFloat v69 = v22;
    *(double *)&v69[1] = v24;
    *(double *)&v69[2] = v26;
    *(double *)&v69[3] = v28;
    double v30 = a5 / v26;
    double v31 = v28 * (a5 / v26);
    v68.double width = a5;
    v68.double height = v31;
    if (objc_msgSend((id)objc_opt_class(), "web_requiresCustomSnapshotting"))
    {
      m_ptr = self->_customContentView.m_ptr;
      objc_msgSend(m_ptr, "web_snapshotRectInContentViewCoordinates:snapshotWidth:completionHandler:", a6, v23, v25, v27, v29, a5);
    }
    else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[WKWebView window](self, "window"), "screen"), "displayConfiguration"), "name")&& (objc_msgSend((id)-[WKWebView window](self, "window"), "isHidden") & 1) == 0)
    {
      kdebug_trace();
      char v37 = (WebCore::DestinationColorSpace *)WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v66, &v68);
      WebCore::DestinationColorSpace::SRGB(v37);
      WebCore::IOSurface::create();
      if (v67)
      {
        if (v12) {
          [MEMORY[0x1E4F39CF8] synchronize];
        }
        memset(&v66, 0, sizeof(v66));
        CATransform3DMakeScale(&v66, a5 / width, a5 / width, 1.0);
        CATransform3D v64 = v66;
        CATransform3DTranslate(&v65, &v64, -v59, -v60, 0.0);
        CATransform3D v66 = v65;
        objc_msgSend((id)objc_msgSend((id)-[WKWebView layer](self, "layer"), "context"), "contextId");
        [(WKWebView *)self layer];
        CARenderServerRenderDisplayLayerWithTransformAndTimeOffset();
        WebCore::IOSurface::createPlatformContext(v67);
        char v38 = v67;
        CGFloat v67 = 0;
        CGFloat m11 = v65.m11;
        v65.CGFloat m11 = 0.0;
        CGFloat cf = m11;
        CGFloat v62 = v38;
        WebCore::IOSurface::sinkIntoImage();
        (*((void (**)(id))a6 + 2))(a6);
        if (v63) {
          CFRelease(v63);
        }
        if (cf != 0.0) {
          CFRelease(*(CFTypeRef *)&cf);
        }
        if (v62)
        {
          WebCore::IOSurface::~IOSurface(v62);
          WTF::fastFree(v57, v58);
        }
        CGFloat v40 = v65.m11;
        v65.CGFloat m11 = 0.0;
        if (v40 != 0.0) {
          CFRelease(*(CFTypeRef *)&v40);
        }
      }
      else
      {
        (*((void (**)(id, void))a6 + 2))(a6, 0);
      }
      CGFloat v54 = v67;
      CGFloat v67 = 0;
      if (v54)
      {
        WebCore::IOSurface::~IOSurface(v54);
        WTF::fastFree(v55, v56);
      }
      kdebug_trace();
    }
    else if (self->_customContentView.m_ptr)
    {
      v71.double width = a5;
      v71.double height = v31;
      UIGraphicsBeginImageContextWithOptions(v71, 1, 1.0);
      char v34 = self->_customContentView.m_ptr;
      objc_msgSend((id)objc_msgSend(v34, "backgroundColor"), "set");
      v72.origin.double x = 0.0;
      v72.origin.double y = 0.0;
      v72.size.double width = a5;
      v72.size.double height = v31;
      UIRectFill(v72);
      CurrentContext = UIGraphicsGetCurrentContext();
      CGContextTranslateCTM(CurrentContext, -(v23 * v30), -(v25 * v30));
      CGContextScaleCTM(CurrentContext, v30, v30);
      objc_msgSend((id)objc_msgSend(v34, "layer"), "renderInContext:", CurrentContext);
      char v36 = [(UIImage *)UIGraphicsGetImageFromCurrentImageContext() CGImage];
      (*((void (**)(id, CGImage *))a6 + 2))(a6, v36);
      UIGraphicsEndImageContext();
    }
    else
    {
      char v41 = self->_page.m_ptr;
      uint64_t v42 = WebCore::enclosingIntRect((WebCore *)v69, v33);
      uint64_t v44 = v43;
      WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v66, &v68);
      float v45 = ceilf(*(float *)&v66.m11);
      uint64_t v46 = 0x80000000;
      if (v45 > -2147500000.0) {
        uint64_t v46 = (int)v45;
      }
      if (v45 < 2147500000.0) {
        uint64_t v47 = v46;
      }
      else {
        uint64_t v47 = 0x7FFFFFFFLL;
      }
      float v48 = ceilf(*((float *)&v66.m11 + 1));
      unint64_t v49 = 0x8000000000000000;
      if (v48 > -2147500000.0) {
        unint64_t v49 = (unint64_t)(int)v48 << 32;
      }
      if (v48 < 2147500000.0) {
        uint64_t v50 = v49;
      }
      else {
        uint64_t v50 = 0x7FFFFFFF00000000;
      }
      long long v51 = _Block_copy(a6);
      long long v52 = (void *)WTF::fastMalloc((WTF *)0x10);
      *long long v52 = &unk_1EE9CD730;
      v52[1] = v51;
      *(void *)&v65.CGFloat m11 = v52;
      WebKit::WebPageProxy::takeSnapshot((uint64_t)v41, v42, v44, v50 | v47, 32, (uint64_t *)&v65);
      CGFloat v53 = v65.m11;
      v65.CGFloat m11 = 0.0;
      if (v53 != 0.0) {
        (*(void (**)(CGFloat))(**(void **)&v53 + 8))(COERCE_CGFLOAT(*(void *)&v53));
      }
      _Block_release(0);
    }
  }
}

- (void)_snapshotRect:(CGRect)a3 intoImageOfWidth:(double)a4 completionHandler:(id)a5
{
}

- (void)_overrideLayoutParametersWithMinimumLayoutSize:(CGSize)a3 maximumUnobscuredSizeOverride:(CGSize)a4
{
}

- (void)_clearOverrideLayoutParameters
{
  if (self->_overriddenLayoutParameters.__engaged_) {
    self->_overriddenLayoutParameters.__engaged_ = 0;
  }
  m_ptr = self->_page.m_ptr;
  uint64_t v6 = 0;
  WebKit::WebPageProxy::setMinimumUnobscuredSize((uint64_t)m_ptr, (const WebCore::FloatSize *)&v6);
  objc_super v4 = self->_page.m_ptr;
  uint64_t v6 = 0;
  WebKit::WebPageProxy::setDefaultUnobscuredSize((uint64_t)v4, (const WebCore::FloatSize *)&v6);
  double v5 = self->_page.m_ptr;
  uint64_t v6 = 0;
  WebKit::WebPageProxy::setMaximumUnobscuredSize((uint64_t)v5, (const WebCore::FloatSize *)&v6);
}

- (void)_overrideViewportWithArguments:(id)a3
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    if (a3)
    {
      v14[0] = 3;
      __asm { FMOV            V0.4S, #-1.0 }
      *(_OWORD *)&void v14[4] = _Q0;
      *(_OWORD *)&v14[20] = _Q0;
      *(_WORD *)&v14[36] = 0;
      __int16 v10 = malloc_type_malloc(0x28uLL, 0x10E004053C0834CuLL);
      *__int16 v10 = MEMORY[0x1E4F14398];
      v10[1] = 50331650;
      float v10[2] = WTF::BlockPtr<void ()(NSString *,NSString *,BOOL *)>::fromCallable<viewportArgumentsFromDictionary(NSDictionary<NSString *,NSString *> *)::$_0>(viewportArgumentsFromDictionary(NSDictionary<NSString *,NSString *> *)::$_0)::{lambda(void *,NSString *,NSString *,BOOL *)#1}::__invoke;
      double v10[3] = &WTF::BlockPtr<void ()(NSString *,NSString *,BOOL *)>::fromCallable<viewportArgumentsFromDictionary(NSDictionary<NSString *,NSString *> *)::$_0>(viewportArgumentsFromDictionary(NSDictionary<NSString *,NSString *> *)::$_0)::descriptor;
      void v10[4] = v14;
      [a3 enumerateKeysAndObjectsUsingBlock:v10];
      _Block_release(v10);
      v11[0] = *(_OWORD *)v14;
      v11[1] = *(_OWORD *)&v14[16];
      uint64_t v12 = *(void *)&v14[32];
      char v13 = 1;
    }
    else
    {
      LOBYTE(v11[0]) = 0;
      char v13 = 0;
    }
    WebKit::WebPageProxy::setOverrideViewportArguments((uint64_t)m_ptr, (uint64_t)v11);
  }
}

- (id)_viewForFindUI
{
  double v3 = [(WKWebView *)self scrollView];

  return [(WKWebView *)self viewForZoomingInScrollView:v3];
}

- (void)_setOverlaidAccessoryViewsInset:(CGSize)a3
{
}

- (id)_retainActiveFocusedState
{
  ++self->_activeFocusedStateRetainCount;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3321888768;
  v3[2] = __52__WKWebView_WKPrivateIOS___retainActiveFocusedState__block_invoke;
  v3[3] = &__block_descriptor_40_e8_32c66_ZTSKZ52__WKWebView_WKPrivateIOS___retainActiveFocusedState_E4__28_e5_v8__0l;
  v3[4] = self;
  return (id)(id)CFMakeCollectable((CFTypeRef)[v3 copy]);
}

uint64_t __52__WKWebView_WKPrivateIOS___retainActiveFocusedState__block_invoke(uint64_t result)
{
  return result;
}

- (void)_becomeFirstResponderWithSelectionMovingForward:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  if (a4) {
    uint64_t v6 = _Block_copy(a4);
  }
  else {
    uint64_t v6 = 0;
  }
  m_ptr = self->_contentView.m_ptr;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3321888768;
  v8[2] = __93__WKWebView_WKPrivateIOS___becomeFirstResponderWithSelectionMovingForward_completionHandler___block_invoke;
  v8[3] = &__block_descriptor_40_e8_32c107_ZTSKZ93__WKWebView_WKPrivateIOS___becomeFirstResponderWithSelectionMovingForward_completionHandler__E4__29_e8_v12__0B8l;
  v8[4] = v6;
  [m_ptr _becomeFirstResponderWithSelectionMovingForward:v4 completionHandler:v8];
}

void __93__WKWebView_WKPrivateIOS___becomeFirstResponderWithSelectionMovingForward_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    double v3 = *(const void **)(a1 + 32);
    _Block_release(v3);
  }
}

- (id)_snapshotLayerContentsForBackForwardListItem:(id)a3
{
  uint64_t v4 = *((void *)self->_page.m_ptr + 83);
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5 || !*(void *)(v5 + 8) || !*(unsigned char *)(v4 + 48))
  {
    [a3 _item];
    goto LABEL_12;
  }
  unint64_t v6 = *(void *)(v4 + 40);
  if (v6 >= *(unsigned int *)(v4 + 36)) {
    goto LABEL_22;
  }
  uint64_t v8 = *(void *)(*(void *)(v4 + 24) + 8 * v6);
  if (v8 != [a3 _item]) {
    goto LABEL_12;
  }
  m_ptr = self->_page.m_ptr;
  uint64_t v10 = *((void *)m_ptr + 83);
  uint64_t v11 = *(void *)(v10 + 16);
  if (v11 && *(void *)(v11 + 8) && *(unsigned char *)(v10 + 48))
  {
    unint64_t v12 = *(void *)(v10 + 40);
    if (v12 < *(unsigned int *)(v10 + 36))
    {
      char v13 = *(WTF::StringImpl ***)(*(void *)(v10 + 24) + 8 * v12);
      goto LABEL_18;
    }
LABEL_22:
    __break(0xC471u);
    JUMPOUT(0x198CC484CLL);
  }
  char v13 = 0;
LABEL_18:
  if (*((unsigned char *)m_ptr + 927))
  {
    {
      byte_1EB35A7F0 = 0;
      WebKit::ViewSnapshotStore::singleton(void)::store = 0u;
      *(_OWORD *)&qword_1EB35A7E0 = 0u;
    }
    WebKit::ViewSnapshotStore::recordSnapshot((WebKit::ViewSnapshot *)&WebKit::ViewSnapshotStore::singleton(void)::store, (WebKit::WebPageProxy *)m_ptr, v13);
  }
LABEL_12:
  id result = *(id *)([a3 _item] + 336);
  if (result)
  {
    return (id)WebKit::ViewSnapshot::asLayerContents((WebKit::ViewSnapshot *)result);
  }
  return result;
}

- (id)_dataDetectionResults
{
  return (id)[self->_contentView.m_ptr _dataDetectionResults];
}

- (void)_accessibilityRetrieveRectsAtSelectionOffset:(int64_t)a3 withText:(id)a4 completionHandler:(id)a5
{
  m_ptr = self->_contentView.m_ptr;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3321888768;
  v9[2] = __99__WKWebView_WKPrivateIOS___accessibilityRetrieveRectsAtSelectionOffset_withText_completionHandler___block_invoke;
  v9[3] = &__block_descriptor_40_e8_32c113_ZTSKZ99__WKWebView_WKPrivateIOS___accessibilityRetrieveRectsAtSelectionOffset_withText_completionHandler__E4__30_e10_v16__0r_v8l;
  uint64_t v8 = _Block_copy(a5);
  CGRect aBlock = _Block_copy(v8);
  [m_ptr _accessibilityRetrieveRectsAtSelectionOffset:a3 withText:a4 completionHandler:v9];
  _Block_release(v8);
  _Block_release(aBlock);
}

void __99__WKWebView_WKPrivateIOS___accessibilityRetrieveRectsAtSelectionOffset_withText_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(a2 + 12)];
    unsigned int v5 = *(_DWORD *)(a2 + 12);
    if (v5)
    {
      unint64_t v6 = *(WebCore::SelectionGeometry **)a2;
      uint64_t v7 = 84 * v5;
      do
      {
        uint64_t v8 = (void *)MEMORY[0x1E4F29238];
        uint64_t v11 = WebCore::SelectionGeometry::rect(v6);
        uint64_t v12 = v9;
        WebCore::IntRect::operator CGRect();
        uint64_t v10 = objc_msgSend(v8, "valueWithCGRect:", v11, v12);
        if (v10) {
          [v4 addObject:v10];
        }
        unint64_t v6 = (WebCore::SelectionGeometry *)((char *)v6 + 84);
        v7 -= 84;
      }
      while (v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    if (v4) {
      CFRelease(v4);
    }
  }
}

- (void)_accessibilityStoreSelection
{
}

- (void)_accessibilityClearSelection
{
}

- (void)_accessibilityRetrieveSpeakSelectionContent
{
}

- (id)_fullScreenPlaceholderView
{
  return (id)[self->_fullScreenWindowController.m_ptr webViewPlaceholder];
}

- (void)_willOpenAppLink
{
  m_ptr = (unsigned int *)self->_page.m_ptr;
  if (m_ptr) {
    WebKit::WebPageProxy::willOpenAppLink(m_ptr);
  }
}

- (void)_isNavigatingToAppBoundDomain:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v4 = _Block_copy(a3);
  unsigned int v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9CD758;
  v5[1] = v4;
  unint64_t v6 = v5;
  WebKit::WebPageProxy::isNavigatingToAppBoundDomainTesting((uint64_t)m_ptr, (uint64_t *)&v6);
  if (v6) {
    (*(void (**)(void *))(*v6 + 8))(v6);
  }

  _Block_release(0);
}

- (void)_isForcedIntoAppBoundMode:(id)a3
{
  m_ptr = self->_page.m_ptr;
  uint64_t v4 = (void (**)(void *, void))_Block_copy(a3);
  unsigned int v5 = (void *)WTF::fastMalloc((WTF *)0x10);
  void *v5 = &unk_1EE9CD780;
  v5[1] = v4;
  v4[2](v4, *((unsigned __int8 *)m_ptr + 1333));
  (*(void (**)(void *))(*v5 + 8))(v5);

  _Block_release(0);
}

- (BOOL)_findInteractionEnabled
{
  return self->_findInteractionEnabled;
}

- (_UIFindInteraction)_findInteraction
{
  return (_UIFindInteraction *)self->_findInteraction.m_ptr;
}

- (UITextRange)selectedTextRange
{
  return 0;
}

- (int64_t)offsetFromPosition:(id)a3 toPosition:(id)a4 inDocument:(id)a5
{
  return [self->_contentView.m_ptr offsetFromPosition:a3 toPosition:a4 inDocument:a5];
}

- (int64_t)compareFoundRange:(id)a3 toRange:(id)a4 inDocument:(id)a5
{
  return [self->_contentView.m_ptr compareFoundRange:a3 toRange:a4 inDocument:a5];
}

- (void)performTextSearchWithQueryString:(id)a3 usingOptions:(id)a4 resultAggregator:(id)a5
{
  id v8 = [(WKWebView *)self _searchableObject];

  [v8 performTextSearchWithQueryString:a3 usingOptions:a4 resultAggregator:a5];
}

- (void)replaceFoundTextInRange:(id)a3 inDocument:(id)a4 withText:(id)a5
{
}

- (void)decorateFoundTextRange:(id)a3 inDocument:(id)a4 usingStyle:(int64_t)a5
{
}

- (void)scrollRangeToVisible:(id)a3 inDocument:(id)a4
{
}

- (void)clearAllDecoratedFoundText
{
}

- (void)didBeginTextSearchOperation
{
}

- (void)didEndTextSearchOperation
{
}

- (void)_requestRectForFoundTextRange:(id)a3 completionHandler:(id)a4
{
}

- (id)findInteraction:(id)a3 sessionForView:(id)a4
{
  uint64_t v4 = (void *)CFMakeCollectable((CFTypeRef)objc_msgSend(objc_alloc(MEMORY[0x1E4F42F40]), "initWithSearchableObject:", -[WKWebView _searchableObject](self, "_searchableObject")));

  return v4;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v5 = [(WKWebView *)self _searchableObject];
  if (v5 == self->_contentView.m_ptr)
  {
    [v5 didBeginTextSearchOperation];
  }
}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  id v5 = [(WKWebView *)self _searchableObject];
  if (v5 == self->_contentView.m_ptr)
  {
    [v5 didEndTextSearchOperation];
  }
}

- (void)_addLayerForFindOverlay
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr
    && !self->_perProcessState.pendingFindLayerID.m_value.m_object.m_identifier
    && !self->_perProcessState.committedFindLayerID.m_value.m_object.m_identifier)
  {
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v3 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v3 = &unk_1EE9CD7A8;
    *(void *)(v3 + 8) = 0;
    objc_moveWeak((id *)(v3 + 8), &location);
    uint64_t v6 = v3;
    char v7 = 0;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::AddLayerForFindOverlay,WTF::CompletionHandler<void ()(std::optional<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>)>>(*((void *)m_ptr + 32), (uint64_t)&v7, &v6, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
    uint64_t v4 = v6;
    uint64_t v6 = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    objc_destroyWeak(&location);
  }
}

- (void)_removeLayerForFindOverlay
{
  if (self->_page.m_ptr
    && (self->_perProcessState.pendingFindLayerID.m_value.m_object.m_identifier
     || self->_perProcessState.committedFindLayerID.m_value.m_object.m_identifier))
  {
    self->_perProcessState.Markable<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>, WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>::MarkableTraits> pendingFindLayerID = 0u;
    self->_perProcessState.committedFindLayerID = 0u;
    m_ptr = self->_page.m_ptr;
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v3 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v3 = &unk_1EE9CD7D0;
    *(void *)(v3 + 8) = 0;
    objc_moveWeak((id *)(v3 + 8), &location);
    uint64_t v6 = v3;
    char v7 = 0;
    WebKit::AuxiliaryProcessProxy::sendWithAsyncReply<Messages::WebPage::RemoveLayerForFindOverlay,WTF::CompletionHandler<void ()(void)>>(*((void *)m_ptr + 32), (uint64_t)&v7, &v6, *(void *)(*((void *)m_ptr + 4) + 1928), 0, 1);
    uint64_t v4 = v6;
    uint64_t v6 = 0;
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
    }
    objc_destroyWeak(&location);
  }
}

- (CALayer)_layerForFindOverlay
{
  m_ptr = self->_page.m_ptr;
  if (!m_ptr) {
    return 0;
  }
  if (!self->_perProcessState.committedFindLayerID.m_value.m_object.m_identifier) {
    return 0;
  }
  uint64_t v3 = *((void *)m_ptr + 29);
  if (!v3) {
    return 0;
  }
  if (*(unsigned char *)(v3 + 36))
  {
    id result = (CALayer *)96;
    __break(0xC471u);
  }
  else
  {
    uint64_t v4 = *(void *)(v3 + 72);
    Markable<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>, WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType, WTF::ObjectIdentifierMainThreadAccessTraits<uint64_t>, unsigned long long, WTF::SupportsObjectIdentifierNullState::No>>::MarkableTraits> committedFindLayerID = self->_perProcessState.committedFindLayerID;
    char v7 = 1;
    id result = (CALayer *)WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>>,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>((uint64_t *)(v4 + 16), &committedFindLayerID);
    if (result) {
      return *(CALayer **)&result[1]._attr.refcount;
    }
  }
  return result;
}

- (void)closeFullScreenWindowController
{
  m_ptr = self->_fullScreenWindowController.m_ptr;
  if (m_ptr)
  {
    [m_ptr close];
    uint64_t v4 = self->_fullScreenWindowController.m_ptr;
    self->_fullScreenWindowController.m_ptr = 0;
    if (v4)
    {
      CFRelease(v4);
    }
  }
}

- (id)fullScreenWindowController
{
  id result = self->_fullScreenWindowController.m_ptr;
  if (!result)
  {
    id result = [[WKFullScreenWindowController alloc] initWithWebView:self];
    m_ptr = self->_fullScreenWindowController.m_ptr;
    self->_fullScreenWindowController.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return self->_fullScreenWindowController.m_ptr;
    }
  }
  return result;
}

- (Class)_printFormatterClass
{
  return (Class)objc_opt_class();
}

- (_WKWebViewPrintProvider)_printProvider
{
  m_ptr = (_WKWebViewPrintProvider *)self->_customContentView.m_ptr;
  if (!m_ptr) {
    m_ptr = (_WKWebViewPrintProvider *)self->_contentView.m_ptr;
  }
  if ([(_WKWebViewPrintProvider *)m_ptr conformsToProtocol:&unk_1EEAA7BA0]) {
    return m_ptr;
  }
  else {
    return 0;
  }
}

- (void)_requestTextInputContextsInRect:(CGRect)a3 completionHandler:(id)a4
{
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", self->_contentView.m_ptr, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  m_ptr = self->_contentView.m_ptr;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3321888768;
  float32x2_t v17[2] = __77__WKWebView_WKTestingIOS___requestTextInputContextsInRect_completionHandler___block_invoke;
  v17[3] = &__block_descriptor_48_e8_32c91_ZTSKZ77__WKWebView_WKTestingIOS___requestTextInputContextsInRect_completionHandler__E4__38_e17_v16__0__NSArray_8l;
  id v15 = 0;
  objc_initWeak(&v15, self);
  CGRect aBlock = _Block_copy(a4);
  id v18 = 0;
  objc_copyWeak(&v18, &v15);
  unint64_t v19 = _Block_copy(aBlock);
  objc_msgSend(m_ptr, "_requestTextInputContextsInRect:completionHandler:", v17, v7, v9, v11, v13);
  _Block_release(aBlock);
  objc_destroyWeak(&v15);
  _Block_release(v19);
  objc_destroyWeak(&v18);
}

void __77__WKWebView_WKTestingIOS___requestTextInputContextsInRect_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [a2 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a2, "count"));
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v21;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(a2);
          }
          double v9 = (_OWORD *)[*(id *)(*((void *)&v20 + 1) + 8 * v8) _textInputContext];
          v24[0] = *v9;
          long long v10 = v9[1];
          long long v11 = v9[2];
          long long v12 = v9[4];
          v24[3] = v9[3];
          void v24[4] = v12;
          v24[1] = v10;
          v24[2] = v11;
          WebCore::FloatRect::operator CGRect();
          objc_msgSend(WeakRetained, "convertRect:fromView:", WeakRetained[79]);
          v18.origin.double x = v13;
          v18.origin.double y = v14;
          v18.size.double width = v15;
          v18.size.double height = v16;
          WebCore::FloatRect::FloatRect((WebCore::FloatRect *)&v19, &v18);
          v24[0] = v19;
          id v17 = [[_WKTextInputContext alloc] _initWithTextInputContext:v24];
          [v5 addObject:v17];
          if (v17) {
            CFRelease(v17);
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [a2 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v6);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    if (!WeakRetained) {
      return;
    }
  }
  CFRelease(WeakRetained);
}

- (void)_focusTextInputContext:(id)a3 placeCaretAt:(CGPoint)a4 completionHandler:(id)a5
{
  -[WKWebView convertPoint:toView:](self, "convertPoint:toView:", self->_contentView.m_ptr, a4.x, a4.y);
  m_ptr = self->_contentView.m_ptr;

  objc_msgSend(m_ptr, "_focusTextInputContext:placeCaretAt:completionHandler:", a3, a5);
}

- (void)_willBeginTextInteractionInTextInputContext:(id)a3
{
}

- (void)selectWordBackwardForTesting
{
}

- (void)_didFinishTextInteractionInTextInputContext:(id)a3
{
}

- (BOOL)_mayContainEditableElementsInRect:(CGRect)a3
{
  m_ptr = (WebKit *)self->_contentView.m_ptr;
  -[WKWebView convertRect:toView:](self, "convertRect:toView:", m_ptr, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10.origin.double x = v4;
  v10.origin.double y = v5;
  v10.size.double width = v6;
  v10.size.double height = v7;
  WebCore::FloatRect::FloatRect((WebCore::FloatRect *)_20, &v10);
  return WebKit::mayContainEditableElementsInRect(m_ptr, (UIView *)_20, v8);
}

- (void)keyboardAccessoryBarNext
{
}

- (void)keyboardAccessoryBarPrevious
{
}

- (void)dismissFormAccessoryView
{
}

- (id)_filePickerAcceptedTypeIdentifiers
{
  return (id)[self->_contentView.m_ptr filePickerAcceptedTypeIdentifiers];
}

- (void)_dismissFilePicker
{
}

- (void)setTimePickerValueToHour:(int64_t)a3 minute:(int64_t)a4
{
}

- (double)timePickerValueHour
{
  [self->_contentView.m_ptr timePickerValueHour];
  return result;
}

- (double)timePickerValueMinute
{
  [self->_contentView.m_ptr timePickerValueMinute];
  return result;
}

- (void)selectFormAccessoryPickerRow:(int)a3
{
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  return [self->_contentView.m_ptr selectFormAccessoryHasCheckedItemAtRow:a3];
}

- (NSString)selectFormPopoverTitle
{
  return (NSString *)[self->_contentView.m_ptr selectFormPopoverTitle];
}

- (void)setSelectedColorForColorPicker:(id)a3
{
}

- (void)_selectDataListOption:(int)a3
{
}

- (BOOL)_isShowingDataListSuggestions
{
  return [self->_contentView.m_ptr isShowingDataListSuggestions];
}

- (NSString)textContentTypeForTesting
{
  return (NSString *)[self->_contentView.m_ptr textContentTypeForTesting];
}

- (NSString)formInputLabel
{
  return (NSString *)[self->_contentView.m_ptr formInputLabel];
}

- (CGRect)_inputViewBoundsInWindow
{
  double x = self->_inputViewBoundsInWindow.origin.x;
  double y = self->_inputViewBoundsInWindow.origin.y;
  double width = self->_inputViewBoundsInWindow.size.width;
  double height = self->_inputViewBoundsInWindow.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (NSString)_uiViewTreeAsText
{
  CGRect v10 = 0;
  long long v11 = 0;
  int v12 = 0;
  char v13 = 1;
  int v14 = 0;
  __int16 v15 = 256;
  int v16 = 0;
  WTF::TextStream::startGroup((WTF::TextStream *)&v10);
  WTF::TextStream::operator<<();
  dumpUIView((WTF::TextStream *)&v10, &self->super);
  WTF::TextStream::endGroup((WTF::TextStream *)&v10);
  WTF::TextStream::release((uint64_t *)&v9, (WTF::TextStream *)&v10);
  if (v9)
  {
    CGFloat v4 = (__CFString *)WTF::StringImpl::operator NSString *();
    CGFloat v5 = v9;
    double v9 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2) {
        WTF::StringImpl::destroy(v5, v3);
      }
      else {
        *(_DWORD *)v5 -= 2;
      }
    }
  }
  else
  {
    CGFloat v4 = &stru_1EEA10550;
  }
  CGFloat v6 = v11;
  long long v11 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v3);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  CGFloat v7 = v10;
  CGRect v10 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2) {
      WTF::StringImpl::destroy(v7, v3);
    }
    else {
      *(_DWORD *)v7 -= 2;
    }
  }
  return &v4->isa;
}

- (id)_scrollbarState:(unint64_t)a3 processID:(unint64_t)a4 isVertical:(BOOL)a5
{
  uint64_t v6 = *(void *)(*(void *)(*((void *)self->_page.m_ptr + 31) + 24) + 16);
  if (v6)
  {
    uint64_t v7 = *(void *)(v6 + 48);
    uint64_t v6 = *(void *)(v6 + 56);
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (a3 == -1)
  {
    __break(0xC471u);
    JUMPOUT(0x198CC61DCLL);
  }
  if (a4 == -1)
  {
    __break(0xC471u);
    JUMPOUT(0x198CC61BCLL);
  }
  if (v7 == a3 && v6 == a4)
  {
    __int16 v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 1;
    int v19 = 0;
    __int16 v20 = 256;
    int v21 = 0;
    WTF::TextStream::startGroup((WTF::TextStream *)&v15);
    [self->_scrollView.m_ptr showsHorizontalScrollIndicator];
    WTF::TextStream::operator<<();
    WTF::TextStream::endGroup((WTF::TextStream *)&v15);
    WTF::TextStream::release((uint64_t *)&v14, (WTF::TextStream *)&v15);
    if (v14)
    {
      double v9 = (__CFString *)WTF::StringImpl::operator NSString *();
      CGRect v10 = v14;
      int v14 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2) {
          WTF::StringImpl::destroy(v10, v8);
        }
        else {
          *(_DWORD *)v10 -= 2;
        }
      }
    }
    else
    {
      double v9 = &stru_1EEA10550;
    }
    long long v11 = v16;
    int v16 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v8);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
  }
  else
  {
    WebKit::RemoteScrollingCoordinatorProxy::scrollbarStateForScrollingNodeID(&v15);
    if (!v15) {
      return &stru_1EEA10550;
    }
    double v9 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  int v12 = v15;
  __int16 v15 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2) {
      WTF::StringImpl::destroy(v12, v8);
    }
    else {
      *(_DWORD *)v12 -= 2;
    }
  }
  return v9;
}

- (id)_propertiesOfLayerWithID:(unint64_t)a3
{
  uint64_t v3 = MEMORY[0x1F4188790](self, a2, a3);
  v104[14] = *MEMORY[0x1E4F143B8];
  if (v4 == 0.0) {
    return 0;
  }
  uint64_t v5 = *(void *)(v3 + 416);
  uint64_t v6 = *(void *)(v5 + 232);
  if (*(unsigned char *)(v6 + 36))
  {
    __break(0xC471u);
    JUMPOUT(0x198CC6C44);
  }
  if (v4 == NAN)
  {
    __break(0xC471u);
    JUMPOUT(0x198CC6C64);
  }
  double v7 = *(double *)(*(void *)(v5 + 256) + 176);
  uint64_t v8 = *(void *)(v6 + 72);
  v91[0] = v4;
  v91[1] = v7;
  char v92 = 1;
  id result = (id)WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::get<WTF::IdentityHashTranslator<WTF::HashMap<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>,std::unique_ptr<WebKit::RemoteLayerTreeNode>,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>,WTF::HashTraits<std::unique_ptr<WebKit::RemoteLayerTreeNode>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::DefaultHash<WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>>,WebCore::ProcessQualified<WTF::ObjectIdentifierGeneric<WebCore::PlatformLayerIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long,(WTF::SupportsObjectIdentifierNullState)0>>>((uint64_t *)(v8 + 16), v91);
  if (result)
  {
    CGRect v10 = (void *)*((void *)result + 5);
    if (v10)
    {
      v103[0] = @"bounds";
      v101[0] = @"x";
      long long v11 = NSNumber;
      [v10 bounds];
      v102[0] = objc_msgSend(v11, "numberWithDouble:");
      v101[1] = @"y";
      int v12 = NSNumber;
      [v10 bounds];
      v102[1] = objc_msgSend(v12, "numberWithDouble:");
      v101[2] = @"width";
      char v13 = NSNumber;
      [v10 bounds];
      v102[2] = [v13 numberWithDouble:v14];
      v101[3] = @"height";
      __int16 v15 = NSNumber;
      [v10 bounds];
      v102[3] = [v15 numberWithDouble:v16];
      v104[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:4];
      v103[1] = @"position";
      v99[0] = @"x";
      int v17 = NSNumber;
      [v10 position];
      v100[0] = objc_msgSend(v17, "numberWithDouble:");
      v99[1] = @"y";
      char v18 = NSNumber;
      [v10 position];
      v100[1] = [v18 numberWithDouble:v19];
      v104[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2];
      v103[2] = @"zPosition";
      __int16 v20 = NSNumber;
      [v10 zPosition];
      v104[2] = objc_msgSend(v20, "numberWithDouble:");
      v103[3] = @"anchorPoint";
      v97[0] = @"x";
      int v21 = NSNumber;
      [v10 anchorPoint];
      v98[0] = objc_msgSend(v21, "numberWithDouble:");
      v97[1] = @"y";
      long long v22 = NSNumber;
      [v10 anchorPoint];
      v98[1] = [v22 numberWithDouble:v23];
      v104[3] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:v97 count:2];
      v103[4] = @"anchorPointZ";
      double v24 = NSNumber;
      [v10 anchorPointZ];
      v104[4] = objc_msgSend(v24, "numberWithDouble:");
      v103[5] = @"transform";
      v95[0] = @"m11";
      double v25 = NSNumber;
      [v10 transform];
      v96[0] = [v25 numberWithDouble:v91[0]];
      v95[1] = @"m12";
      uint64_t v26 = NSNumber;
      [v10 transform];
      v96[1] = [v26 numberWithDouble:v90];
      v95[2] = @"m13";
      double v27 = NSNumber;
      [v10 transform];
      v96[2] = [v27 numberWithDouble:v89];
      v95[3] = @"m14";
      double v28 = NSNumber;
      [v10 transform];
      v96[3] = [v28 numberWithDouble:v88];
      v95[4] = @"m21";
      double v29 = NSNumber;
      [v10 transform];
      v96[4] = [v29 numberWithDouble:v87];
      v95[5] = @"m22";
      double v30 = NSNumber;
      [v10 transform];
      v96[5] = [v30 numberWithDouble:v86];
      v95[6] = @"m23";
      double v31 = NSNumber;
      [v10 transform];
      v96[6] = [v31 numberWithDouble:v85];
      v95[7] = @"m24";
      uint64_t v32 = NSNumber;
      [v10 transform];
      v96[7] = [v32 numberWithDouble:v84];
      v95[8] = @"m31";
      uint64_t v33 = NSNumber;
      [v10 transform];
      v96[8] = [v33 numberWithDouble:v83];
      v95[9] = @"m32";
      char v34 = NSNumber;
      [v10 transform];
      v96[9] = [v34 numberWithDouble:v82];
      v95[10] = @"m33";
      char v35 = NSNumber;
      [v10 transform];
      v96[10] = [v35 numberWithDouble:v81];
      v95[11] = @"m34";
      char v36 = NSNumber;
      [v10 transform];
      v96[11] = [v36 numberWithDouble:v80];
      v95[12] = @"m41";
      char v37 = NSNumber;
      [v10 transform];
      v96[12] = [v37 numberWithDouble:v79];
      v95[13] = @"m42";
      char v38 = NSNumber;
      [v10 transform];
      v96[13] = [v38 numberWithDouble:v78];
      v95[14] = @"m43";
      char v39 = NSNumber;
      [v10 transform];
      v96[14] = [v39 numberWithDouble:v77];
      v95[15] = @"m44";
      CGFloat v40 = NSNumber;
      [v10 transform];
      v96[15] = [v40 numberWithDouble:v76];
      v104[5] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:v95 count:16];
      v103[6] = @"sublayerTransform";
      v93[0] = @"m11";
      char v41 = NSNumber;
      [v10 sublayerTransform];
      v94[0] = [v41 numberWithDouble:v75];
      v93[1] = @"m12";
      uint64_t v42 = NSNumber;
      [v10 sublayerTransform];
      v94[1] = [v42 numberWithDouble:v74];
      v93[2] = @"m13";
      uint64_t v43 = NSNumber;
      [v10 sublayerTransform];
      v94[2] = [v43 numberWithDouble:v73];
      v93[3] = @"m14";
      uint64_t v44 = NSNumber;
      [v10 sublayerTransform];
      v94[3] = [v44 numberWithDouble:v72];
      v93[4] = @"m21";
      float v45 = NSNumber;
      [v10 sublayerTransform];
      v94[4] = [v45 numberWithDouble:v71];
      v93[5] = @"m22";
      uint64_t v46 = NSNumber;
      [v10 sublayerTransform];
      v94[5] = [v46 numberWithDouble:v70];
      v93[6] = @"m23";
      uint64_t v47 = NSNumber;
      [v10 sublayerTransform];
      v94[6] = [v47 numberWithDouble:v69];
      v93[7] = @"m24";
      float v48 = NSNumber;
      [v10 sublayerTransform];
      v94[7] = [v48 numberWithDouble:v68];
      v93[8] = @"m31";
      unint64_t v49 = NSNumber;
      [v10 sublayerTransform];
      v94[8] = [v49 numberWithDouble:v67];
      v93[9] = @"m32";
      uint64_t v50 = NSNumber;
      [v10 sublayerTransform];
      v94[9] = [v50 numberWithDouble:v66];
      v93[10] = @"m33";
      long long v51 = NSNumber;
      [v10 sublayerTransform];
      v94[10] = [v51 numberWithDouble:v65];
      v93[11] = @"m34";
      long long v52 = NSNumber;
      [v10 sublayerTransform];
      v94[11] = [v52 numberWithDouble:v64];
      v93[12] = @"m41";
      CGFloat v53 = NSNumber;
      [v10 sublayerTransform];
      v94[12] = [v53 numberWithDouble:v63];
      v93[13] = @"m42";
      CGFloat v54 = NSNumber;
      [v10 sublayerTransform];
      v94[13] = [v54 numberWithDouble:v62];
      v93[14] = @"m43";
      double v55 = NSNumber;
      [v10 sublayerTransform];
      v94[14] = [v55 numberWithDouble:v61];
      v93[15] = @"m44";
      double v56 = NSNumber;
      [v10 sublayerTransform];
      v94[15] = [v56 numberWithDouble:v60];
      v104[6] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:16];
      v103[7] = @"hidden";
      v104[7] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isHidden"));
      v103[8] = @"doubleSided";
      v104[8] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isDoubleSided"));
      v103[9] = @"masksToBounds";
      v104[9] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "masksToBounds"));
      v103[10] = @"contentsScale";
      uint64_t v57 = NSNumber;
      [v10 contentsScale];
      v104[10] = objc_msgSend(v57, "numberWithDouble:");
      v103[11] = @"rasterizationScale";
      double v58 = NSNumber;
      [v10 rasterizationScale];
      v104[11] = objc_msgSend(v58, "numberWithDouble:");
      v103[12] = @"opaque";
      v104[12] = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v10, "isOpaque"));
      v103[13] = @"opacity";
      double v59 = NSNumber;
      [v10 opacity];
      v104[13] = objc_msgSend(v59, "numberWithFloat:");
      return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:14];
    }
    return 0;
  }
  return result;
}

- (void)_doAfterReceivingEditDragSnapshotForTesting:(id)a3
{
}

- (CGRect)_dragCaretRect
{
  WebCore::IntRect::operator CGRect();
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (BOOL)_isAnimatingDragCancel
{
  return [self->_contentView.m_ptr isAnimatingDragCancel];
}

- (CGRect)_tapHighlightViewRect
{
  [self->_contentView.m_ptr tapHighlightViewRect];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (UIGestureRecognizer)_imageAnalysisGestureRecognizer
{
  return (UIGestureRecognizer *)[self->_contentView.m_ptr imageAnalysisGestureRecognizer];
}

- (UITapGestureRecognizer)_singleTapGestureRecognizer
{
  return (UITapGestureRecognizer *)[self->_contentView.m_ptr singleTapGestureRecognizer];
}

- (BOOL)_isKeyboardScrollingAnimationRunning
{
  return [self->_contentView.m_ptr isKeyboardScrollingAnimationRunning];
}

- (void)_simulateElementAction:(int64_t)a3 atLocation:(CGPoint)a4
{
}

- (void)_simulateLongPressActionAtLocation:(CGPoint)a3
{
}

- (void)_simulateTextEntered:(id)a3
{
}

- (void)_triggerSystemPreviewActionOnElement:(unint64_t)a3 document:(id)a4 page:(unint64_t)a5
{
  m_ptr = self->_page.m_ptr;
  if (m_ptr)
  {
    uint64_t v6 = (WebKit::SystemPreviewController *)*((void *)m_ptr + 57);
    if (v6) {
      WebKit::SystemPreviewController::triggerSystemPreviewActionWithTargetForTesting(v6, a3, (NSString *)a4, a5);
    }
  }
}

- (void)_setDeviceOrientationUserPermissionHandlerForTesting:(id)a3
{
  if (a3)
  {
    double v4 = _Block_copy(a3);
    double v5 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v5 = &unk_1EE9CD7F8;
    v5[1] = v4;
    _Block_release(0);
  }
  else
  {
    double v5 = 0;
  }
  m_ptr = self->_page.m_ptr;
  uint64_t v7 = *((void *)m_ptr + 137);
  *((void *)m_ptr + 137) = v5;
  if (v7)
  {
    uint64_t v8 = *(void (**)(void))(*(void *)v7 + 8);
    v8();
  }
}

- (void)_setDeviceHasAGXCompilerServiceForTesting
{
  if (self->_page.m_ptr) {
    MEMORY[0x1F41723E0]();
  }
}

- (void)_resetObscuredInsetsForTesting
{
  if ([(WKWebView *)self _haveSetObscuredInsets])
  {
    [(WKWebView *)self _resetObscuredInsets];
  }
}

- (BOOL)_hasResizeAssertion
{
  return self->_resizeAssertions.m_size != 0;
}

- (void)_simulateSelectionStart
{
}

- (void)_doAfterNextVisibleContentRectAndStablePresentationUpdate:(id)a3
{
  if (self) {
    CFRetain(self);
  }
  double v5 = _Block_copy(a3);
  uint64_t v6 = malloc_type_malloc(0x30uLL, 0x10E00408BA55B3FuLL);
  *uint64_t v6 = MEMORY[0x1E4F14398];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKTestingIOS) _doAfterNextVisibleContentRectAndStablePresentationUpdate:]::$_35>(-[WKWebView(WKTestingIOS) _doAfterNextVisibleContentRectAndStablePresentationUpdate:]::$_35)::{lambda(void *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WKWebView(WKTestingIOS) _doAfterNextVisibleContentRectAndStablePresentationUpdate:]::$_35>(-[WKWebView(WKTestingIOS) _doAfterNextVisibleContentRectAndStablePresentationUpdate:]::$_35)::descriptor;
  v6[4] = self;
  v6[5] = v5;
  _Block_release(0);
  [(WKWebView *)self _doAfterNextVisibleContentRectUpdate:v6];
  _Block_release(v6);

  _Block_release(0);
}

@end