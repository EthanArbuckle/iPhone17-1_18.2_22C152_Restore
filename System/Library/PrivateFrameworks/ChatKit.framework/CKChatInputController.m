@interface CKChatInputController
+ (id)previewQueue;
- (BOOL)_isAppBrowserFullScreen;
- (BOOL)_isBusinessConversation;
- (BOOL)_isCombinedStickersApp;
- (BOOL)_isRunningInMVS;
- (BOOL)_isRunningPPT;
- (BOOL)_isiMessageConversation;
- (BOOL)_pluginCanMessageAPI:(id)a3;
- (BOOL)_presentPluginIfNecessaryWithPayload:(id)a3 withPayloadID:(id)a4;
- (BOOL)_shouldDeferCallbackForInsertingPayload;
- (BOOL)_shouldSendTypingIndicatorDataForPluginIdentifier:(id)a3;
- (BOOL)_shouldShowHandwriting;
- (BOOL)_switcherPluginCanMessageAPI;
- (BOOL)appManagerIsDisplayed;
- (BOOL)appModalIsDisplayed;
- (BOOL)appStoreIsDisplayed;
- (BOOL)browserShouldAutorotate;
- (BOOL)canHandleClientActionFromUrl:(id)a3;
- (BOOL)commitPayloadBypassingValidation:(id)a3 forPlugin:(id)a4;
- (BOOL)currentPluginAppDidRecieveTouchForSendAPI;
- (BOOL)currentPluginIsDT;
- (BOOL)currentPluginIsGenerativePlayground;
- (BOOL)currentPluginIsPhotos;
- (BOOL)didDismissAppCardForStickerDrag;
- (BOOL)dismissPluginAfterReplaceAlertInteractedWith;
- (BOOL)handwritingIsDisplayed;
- (BOOL)hasStickerReactionSession;
- (BOOL)inCollapseOrExpandAnimation;
- (BOOL)inputViewWillBecomeVisible;
- (BOOL)isAppCardAppearing;
- (BOOL)isAppCardDismissing;
- (BOOL)isAppCardDraggingBelowKeyboardDetent;
- (BOOL)isAppCardPresentationStyleExpanded;
- (BOOL)isAppCardPresented;
- (BOOL)isAppCardUsingPopoverPresentation;
- (BOOL)isAppCardUsingSheetPresentation;
- (BOOL)isDismissingAppCardForKeyboardPresentation;
- (BOOL)isDismissingAppModal;
- (BOOL)isDisplayingReplaceCompositionAlert;
- (BOOL)isEntryViewFirstResponder;
- (BOOL)isHandwritingLandscape;
- (BOOL)isInputViewVisible;
- (BOOL)isKeyboardSnapshotted;
- (BOOL)isPresentingStickerPicker;
- (BOOL)isShowingAppCardForExtensionIdentifier:(id)a3;
- (BOOL)keyboardIsHiding;
- (BOOL)keyboardIsVisible;
- (BOOL)messageEntryShouldHideCaret:(id)a3;
- (BOOL)messageEntryViewShouldResignFirstResponder:(id)a3;
- (BOOL)messageEntryViewShouldVerticallyInsetForPresentedAppCard:(id)a3;
- (BOOL)presentedAppBypassesSendMenu;
- (BOOL)preventResignFirstResponder;
- (BOOL)shouldBlurForMessageEditing;
- (BOOL)shouldInterfaceBeRestrictedToPortraitForPluginID:(id)a3;
- (BOOL)shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:(id)a3;
- (BOOL)shouldPresentAppCardInSendMenuWithTraitCollection:(id)a3;
- (BOOL)shouldPreventAppFromDisplayingForBundleIdentifier:(id)a3;
- (BOOL)shouldRestoreAppSwitcher;
- (BOOL)shouldShowMoneyActionWithAmount:(id)a3 currencies:(id)a4;
- (BOOL)shouldSuppressStatusBarForHandwriting;
- (BOOL)shouldSuppressStatusBarForSendMenu;
- (BOOL)switcherPluginCanMessageAPIOnBehalfOfPlugin:(id)a3;
- (CKAppCardPresentationOverseer)appCardPresentationOverseer;
- (CKBrowserSwitcherViewController)browserSwitcher;
- (CKBrowserViewControllerProtocol)macBrowserViewController;
- (CKChatEagerUploadController)eagerUploadController;
- (CKChatInputController)init;
- (CKChatInputControllerDelegate)delegate;
- (CKComposition)deferredComposition;
- (CKConversation)targetConversation;
- (CKDeviceOrientationManager)orientationManager;
- (CKExternalPluginViewControllerProvider)externalPluginControllerProvider;
- (CKHandwritingPresentationController)handwritingPresentationController;
- (CKKeyboardContentViewController)currentInputViewController;
- (CKKeyboardContentViewController)switcherInputViewController;
- (CKMessageEntryView)entryView;
- (CKMessagePartChatItem)stickerPickerMessagePartChatItem;
- (CKMessagePartChatItem)stickerPickerMessagePartParentChatItem;
- (CKScheduledUpdater)orientationUpdater;
- (CKStickerReactionSession)stickerReactionSession;
- (CKTranscriptPluginPresentationConfiguration)currentPresentationConfig;
- (IMBalloonPlugin)browserPlugin;
- (IMBalloonPlugin)pluginToResumeForStickerDrag;
- (IMBalloonPluginDataSource)browserPluginDataSource;
- (IMBalloonPluginDataSource)deferredPluginDataSource;
- (IMScheduledUpdater)dismissEntryViewShelfUpdater;
- (UINavigationController)presentedBrowserNavigationController;
- (UINavigationController)wolfBrowserNavController;
- (UITextInputPayloadController)textInputPayloadController;
- (UIViewController)statusBarStyleViewController;
- (double)_appCardHeightWithSafeArea;
- (double)appCardDismissPadding;
- (double)appCardOverseerCompactHeightExcludingSafeArea;
- (id)_adamIDFromPluginPayloadData:(id)a3;
- (id)_browserViewControllerForInterfaceOrientationMethods;
- (id)_entryViewSnapshotWithFrame:(CGRect)a3;
- (id)_formattedPayload:(id)a3 forPayloadID:(id)a4;
- (id)_stickerPickerPlugin;
- (id)activeSendMenuPresentationForAppCardOverseer;
- (id)appIconOverride;
- (id)appTitleOverride;
- (id)balloonPluginForIndexPath:(id)a3;
- (id)configurePhotosDraftAssetArchivesWithConversationID:(id)a3;
- (id)dragControllerTranscriptDelegate;
- (id)inputViewController;
- (id)insertPayloadCompletionHandler;
- (id)localizedTitleForClientActionFromUrl:(id)a3 context:(id)a4;
- (id)participantHandles;
- (id)pluginBundleID;
- (id)pluginContextForPlugin:(id)a3;
- (id)sendLaterPluginInfo;
- (id)workingDirForDraft;
- (id)workingDraftDirForPluginIdentifier:(id)a3;
- (int64_t)determineSendMenuPresentationStyleCompatibleWithTraitCollection:(id)a3;
- (int64_t)lastSeenOrientation;
- (int64_t)messageEntryViewHighLightInputButton:(id)a3;
- (unint64_t)appPresentationStyleForShowingPluginID:(id)a3;
- (unint64_t)browserSupportedInterfaceOrientations;
- (unint64_t)presentationStyleInOrientation:(int64_t)a3 inPopover:(BOOL)a4 forPluginID:(id)a5;
- (unint64_t)savedStyleForDragCompletion;
- (void)_beginPreviewCreationWithFileURL:(id)a3;
- (void)_deferredCommitSticker:(id)a3;
- (void)_deferredDismissToKeyboardAndFocusEntryView:(id)a3;
- (void)_deferredRequestFullScreenModalForPluginIdentifier:(id)a3 dataSource:(id)a4 preferredContentSize:(CGSize)a5;
- (void)_deferredRequestPresentationStyleExpanded:(id)a3;
- (void)_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:(BOOL)a3 focusEntryView:(BOOL)a4;
- (void)_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:(BOOL)a3 overrideExceptions:(BOOL)a4 focusEntryView:(BOOL)a5;
- (void)_dismissBrowserViewControllerAndReloadInputViews:(BOOL)a3;
- (void)_dismissCompactSwitcherOverKeyboardWithCompletion:(id)a3;
- (void)_handleOrientation;
- (void)_informDelegateOfUpdatedAppCardHeightAnimated:(BOOL)a3;
- (void)_insertUISticker:(id)a3;
- (void)_insertUIStickerAsAdaptiveImageGlyph:(id)a3;
- (void)_launchAppExtensionForDebugging;
- (void)_loadPhotosBrowser;
- (void)_loadPhotosBrowserCollapsingEntryField:(BOOL)a3;
- (void)_openContainingBundleID:(id)a3 applicationService:(id)a4 withURL:(id)a5 pluginID:(id)a6 completionHandler:(id)a7;
- (void)_presentCompactSwitcherOverKeyboardWithCompletion:(id)a3;
- (void)_presentFullScreenModalBrowserForPlugin:(id)a3 dataSource:(id)a4;
- (void)_presentPluginWithBundleID:(id)a3 sendingTextInputPayload:(id)a4 withPayloadID:(id)a5;
- (void)_presentPluginWithBundleID:(id)a3 sendingTextInputPayload:(id)a4 withPayloadID:(id)a5 style:(unint64_t)a6;
- (void)_presentSendLaterUnsupportedAlertForIdentifier:(id)a3 handler:(id)a4;
- (void)_presentSendMenuForAppCardContentViewController:(id)a3 appCardPresentationStyle:(unint64_t)a4 withCompletion:(id)a5;
- (void)_reconfigurePluginDataSourceWithBalloonControllerIfNecessary;
- (void)_sendLaterSelectedFromSendMenuWithPresentation:(id)a3;
- (void)_setupObserverForLaunchAppExtensionForDebugging;
- (void)_showFullScreenBrowser:(id)a3;
- (void)_stageStickerWithFileURL:(id)a3 accessibilityLabel:(id)a4;
- (void)_startEditingPayload:(id)a3;
- (void)_stickerPickerPlugin;
- (void)adjustSupportedInterfaceOrientationForPluginID:(id)a3 requiredPortrait:(BOOL *)a4;
- (void)appCardDidMoveToWindow:(id)a3;
- (void)appCardOverseerCardDidChangeHeight:(double)a3 isBelowKeyboardDetent:(BOOL)a4 isDragging:(BOOL)a5 isGeneratingEndOfDragAnimations:(BOOL)a6;
- (void)appCardOverseerDidDismissAppCard;
- (void)appCardOverseerDidPresentAppCard;
- (void)appCardOverseerDidRecognizeTouchTracker;
- (void)appCardOverseerViewStateDidChange:(BOOL)a3;
- (void)appCardOverseerWillDismissAppCard;
- (void)appCardOverseerWillPresentAppCard;
- (void)appSelectionInterfaceSelectedItem:(id)a3;
- (void)appendMediaPayloadToText:(id)a3;
- (void)applicationWillAddDeactivationReasonNotification:(id)a3;
- (void)beginStickerReactionSessionWithChatItem:(id)a3 cell:(id)a4;
- (void)browserAppManagerDidSelectPlugin:(id)a3;
- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4;
- (void)browserWillDismiss;
- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)chatControllerReceivedKeyboardDidHideNotification:(id)a3;
- (void)chatControllerReceivedKeyboardDidShowNotification:(id)a3;
- (void)chatControllerReceivedKeyboardWillHideNotification:(id)a3;
- (void)chatControllerReceivedKeyboardWillShowNotification:(id)a3;
- (void)checkForTouchInRemoteProcessIfNecessaryWithCompletion:(id)a3;
- (void)clearBrowserViewControllerIfNecessary;
- (void)commitPayload:(CKBrowserItemPayload *)a3 forPlugin:(NSString *)a4 allowAllCommits:(BOOL)a5 completionHandler:(id)a6;
- (void)commitPayload:(id)a3;
- (void)commitSticker:(id)a3 atScreenCoordinate:(CGPoint)a4 scale:(double)a5 rotation:(double)a6 stickerFrame:(CGRect)a7;
- (void)commitSticker:(id)a3 forPlugin:(id)a4 bypassValidation:(BOOL)a5 stickerFrame:(CGRect)a6;
- (void)commitSticker:(id)a3 forPlugin:(id)a4 stickerFrame:(CGRect)a5;
- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4;
- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5;
- (void)commitStickerBypassingValidation:(id)a3 forPlugin:(id)a4 stickerFrame:(CGRect)a5;
- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3;
- (void)dealloc;
- (void)deferredCommitPayload:(id)a3;
- (void)deviceOrientationManager:(id)a3 orientationDidChange:(int64_t)a4;
- (void)didBeginInstallingAppWithBundleIdentifier:(id)a3;
- (void)didSelectPlugin:(id)a3;
- (void)didStageAssetArchive:(id)a3 identifier:(id)a4;
- (void)dismiss;
- (void)dismissAndReloadInputViews:(BOOL)a3;
- (void)dismissAndReloadInputViews:(BOOL)a3 forPlugin:(id)a4;
- (void)dismissAppCardIfNecessary;
- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 isFocusingKeyboard:(BOOL)a4 completion:(id)a5;
- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 isFocusingKeyboard:(BOOL)a4 overrideExceptions:(BOOL)a5 completion:(id)a6;
- (void)dismissBrowserViewController;
- (void)dismissEntryViewShelf;
- (void)dismissOrHideHandwritingBrowser;
- (void)dismissPlugin;
- (void)dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded;
- (void)dismissStickerPickerPreservingChatItem:(BOOL)a3 completion:(id)a4;
- (void)dismissToKeyboard:(BOOL)a3;
- (void)eagerUploadCancelIdentifier:(id)a3;
- (void)eagerUploadPayload:(id)a3 identifier:(id)a4 replace:(BOOL)a5;
- (void)endStickerReactionSession;
- (void)entryViewDidChangeSize;
- (void)expandedAppViewControllerWantsToCollapse:(id)a3;
- (void)extensionRemoteConnectionWasInterrupted:(id)a3;
- (void)forceDismissBrowserWithoutAnimation;
- (void)generatePreviewAndStoreInCacheForSendingPhotoFromPayload:(id)a3;
- (void)handleClientActionFromUrl:(id)a3 context:(id)a4;
- (void)handleMoneyActionWithAmount:(id)a3 currencies:(id)a4;
- (void)handlePayload:(id)a3 withPayloadId:(id)a4;
- (void)handleTextInputPayload:(id)a3 withPayloadID:(id)a4 forPlugin:(id)a5;
- (void)handwritingPresentationControllerDidShowHandwriting:(id)a3;
- (void)handwritingPresentationControllerWillHideHandwriting:(id)a3;
- (void)insertUIStickerAsAdaptiveImageGlyph:(id)a3;
- (void)launchAndShowBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5;
- (void)launchAndShowBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6;
- (void)messageEntryView:(id)a3 didLongPressPlusButton:(id)a4;
- (void)messageEntryView:(id)a3 didSelectPluginAtIndex:(id)a4;
- (void)messageEntryView:(id)a3 didSelectPlusButton:(id)a4;
- (void)messageEntryView:(id)a3 didSelectUIStickerInEmojiPicker:(id)a4;
- (void)messageEntryView:(id)a3 touchCancelForPlusButton:(id)a4;
- (void)messageEntryView:(id)a3 touchDragExitForPlusButton:(id)a4;
- (void)messageEntryView:(id)a3 touchUpOutsidePlusButton:(id)a4;
- (void)messageEntryViewBrowserButtonHit:(id)a3;
- (void)messageEntryViewDidExpand:(id)a3;
- (void)messageEntryViewInputDidTakeFocus:(id)a3;
- (void)messageEntryViewPhotoButtonTouchCancel:(id)a3;
- (void)messageEntryViewPhotoButtonTouchDown:(id)a3;
- (void)messageEntryViewPhotoButtonTouchUpOutside:(id)a3;
- (void)notifyActiveBrowserAssetArchiveWasRemoved:(id)a3;
- (void)notifyBrowserViewControllerOfMatchingNewMessages:(id)a3;
- (void)openAppExtensionWithAdamID:(id)a3;
- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6;
- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5;
- (void)popoverPresentationControllerDidDismissPopover:(id)a3;
- (void)prepareForSuspend;
- (void)presentAppManager;
- (void)presentAppStoreForAdamID:(id)a3;
- (void)presentAppStoreForURL:(id)a3;
- (void)presentAppStoreForURL:(id)a3 fromSourceApplication:(id)a4;
- (void)presentModernCardForPlugin:(id)a3 dataSource:(id)a4 presentationStyle:(unint64_t)a5;
- (void)presentPluginWithBundleID:(id)a3 appLaunchPayload:(id)a4;
- (void)presentSendMenuForAppCardOverseerWithAppCardViewController:(id)a3 presentationStyle:(unint64_t)a4;
- (void)presentViewControllerWithPluginChatItem:(id)a3 presentationStyle:(unint64_t)a4;
- (void)presentViewControllerWithPluginChatItem:(id)a3 presentationStyle:(unint64_t)a4 presentationConfiguration:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)registerForTextInputPayloadHandling:(BOOL)a3 isGroupChat:(BOOL)a4;
- (void)registerForTextInputPayloadHandlingForSenderHandleID:(id)a3 receiverHandleID:(id)a4;
- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestPhotoBrowserInitFromDraft:(id)a3;
- (void)requestPhotoBrowserToAppendFinalImagesToComposition;
- (void)requestPhotoBrowserToEnumerateSelectedImagesUsingBlock:(id)a3;
- (void)requestPhotoBrowserToPrepareForDraft;
- (void)requestPhotoBrowserToPrepareForDraftClearingPhotoShelfViewController:(BOOL)a3;
- (void)requestPhotoBrowserToUnstageAllImages;
- (void)requestPhotoBrowserToUnstageImages:(id)a3;
- (void)requestPresentationStyleExpanded:(BOOL)a3;
- (void)requestPresentationStyleExpanded:(BOOL)a3 forPlugin:(id)a4;
- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 dataSource:(id)a4 preferredContentSize:(CGSize)a5 skipValidation:(BOOL)a6;
- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 dataSource:(id)a4 skipValidation:(BOOL)a5;
- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 preferredContentSize:(CGSize)a4;
- (void)requestTransitionPluginFromFullScreen:(id)a3 toExpanded:(BOOL)a4;
- (void)sendLaterPluginInfoUpdated;
- (void)sendMenuDidAppear:(id)a3 presentationStyle:(int64_t)a4;
- (void)sendMenuViewController:(id)a3 didSelectExtensionIdentifier:(id)a4;
- (void)sendMenuViewControllerDidFinishDismissAnimation:(id)a3;
- (void)sendMenuViewControllerRequestDismiss:(id)a3;
- (void)sendMenuViewControllerWillPerformFullScreenDismissAnimation:(id)a3;
- (void)setAppCardDismissPadding:(double)a3;
- (void)setAppCardPresentationOverseer:(id)a3;
- (void)setBrowserPlugin:(id)a3;
- (void)setBrowserPluginDataSource:(id)a3;
- (void)setBrowserSwitcher:(id)a3;
- (void)setConversationAndRecipientsForBrowser:(id)a3;
- (void)setCurrentInputViewController:(id)a3;
- (void)setCurrentPluginAppDidRecieveTouchForSendAPI:(BOOL)a3;
- (void)setCurrentPresentationConfig:(id)a3;
- (void)setDeferredComposition:(id)a3;
- (void)setDeferredPluginDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDismissAppCardForStickerDrag:(BOOL)a3;
- (void)setDismissEntryViewShelfUpdater:(id)a3;
- (void)setDismissPluginAfterReplaceAlertInteractedWith:(BOOL)a3;
- (void)setEagerUploadController:(id)a3;
- (void)setEntryView:(id)a3;
- (void)setEntryViewHidden:(BOOL)a3;
- (void)setExternalPluginControllerProvider:(id)a3;
- (void)setHandwritingPresentationController:(id)a3;
- (void)setInCollapseOrExpandAnimation:(BOOL)a3;
- (void)setInputViewVisible:(BOOL)a3;
- (void)setInputViewVisible:(BOOL)a3 entryFieldCollapsed:(BOOL)a4 animated:(BOOL)a5;
- (void)setInputViewVisible:(BOOL)a3 entryFieldCollapsed:(BOOL)a4 animated:(BOOL)a5 messageDelegate:(BOOL)a6;
- (void)setInputViewWillBecomeVisible:(BOOL)a3;
- (void)setInsertPayloadCompletionHandler:(id)a3;
- (void)setIsAppCardDraggingBelowKeyboardDetent:(BOOL)a3;
- (void)setIsAppCardUsingPopoverPresentation:(BOOL)a3;
- (void)setIsDismissingAppCardForKeyboardPresentation:(BOOL)a3;
- (void)setIsDisplayingReplaceCompositionAlert:(BOOL)a3;
- (void)setKeyboardIsHiding:(BOOL)a3;
- (void)setKeyboardIsVisible:(BOOL)a3;
- (void)setLastSeenOrientation:(int64_t)a3;
- (void)setLocalUserIsTyping:(BOOL)a3;
- (void)setMacBrowserViewController:(id)a3;
- (void)setOrientationManager:(id)a3;
- (void)setOrientationUpdater:(id)a3;
- (void)setPluginToResumeForStickerDrag:(id)a3;
- (void)setPresentedBrowserNavigationController:(id)a3;
- (void)setPreventResignFirstResponder:(BOOL)a3;
- (void)setSavedStyleForDragCompletion:(unint64_t)a3;
- (void)setShouldBlurForMessageEditing:(BOOL)a3;
- (void)setShouldRestoreAppSwitcher:(BOOL)a3;
- (void)setShouldSuppressStatusBarForHandwriting:(BOOL)a3;
- (void)setShouldSuppressStatusBarForSendMenu:(BOOL)a3;
- (void)setStatusBarStyleViewController:(id)a3;
- (void)setStickerPickerMessagePartChatItem:(id)a3;
- (void)setStickerPickerMessagePartParentChatItem:(id)a3;
- (void)setStickerReactionSession:(id)a3;
- (void)setSwitcherInputViewController:(id)a3;
- (void)setTextInputPayloadController:(id)a3;
- (void)setWolfBrowserNavController:(id)a3;
- (void)set_isRunningPPT:(BOOL)a3;
- (void)showBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5;
- (void)showBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6;
- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)showBrowserPopoverForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6;
- (void)showDTCompose;
- (void)showEntryViewPhotosShelf:(id)a3 completion:(id)a4;
- (void)showExpandedBrowserPopover:(id)a3 presentationConfiguration:(id)a4;
- (void)showFindMyPlugin;
- (void)showFunCamera;
- (void)showFunCamera:(id)a3;
- (void)showHandwritingBrowser;
- (void)showHandwritingBrowserWithExistingPayload:(id)a3;
- (void)showKeyboard;
- (void)showLocationPlugin;
- (void)showModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)showPhotosBrowser;
- (void)showPhotosBrowserCollapsingEntryField:(BOOL)a3;
- (void)showPhotosExtension;
- (void)showPluginWithExtensionIdentifier:(id)a3;
- (void)showPluginWithExtensionIdentifier:(id)a3 sourceView:(id)a4;
- (void)showSendLater;
- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5;
- (void)startEditingPayload:(id)a3;
- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4;
- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5;
- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5 completion:(id)a6;
- (void)startEditingPayloadBypassingValidation:(id)a3 forPlugin:(id)a4 completion:(id)a5;
- (void)stickerDropAnimationFinished;
- (void)stickerDruidDragStarted;
- (void)stickerPickerWasHidden;
- (void)stickerPickerWasHiddenPreservingChatItem:(BOOL)a3;
- (void)swipeDismissBrowser;
- (void)switcherViewController:(id)a3 didSelectPluginAtIndexPath:(id)a4;
- (void)switcherViewController:(id)a3 hasUpdatedLastTouchDate:(id)a4;
- (void)switcherViewController:(id)a3 willPresentBrowserModally:(id)a4;
- (void)switcherViewControllerDidCollapse:(id)a3;
- (void)switcherViewControllerDidFinishSwitching:(id)a3 toViewController:(id)a4;
- (void)switcherViewControllerDidSelectAppManager:(id)a3 shouldRestoreAppSwitcher:(BOOL)a4;
- (void)switcherViewControllerDidSelectAppStore:(id)a3 shouldRestoreAppSwitcher:(BOOL)a4;
- (void)switcherViewControllerWillAppear:(id)a3;
- (void)switcherViewControllerWillDisappear:(id)a3;
- (void)unregisterForTextInputPayloadHandling;
- (void)willSendComposition;
@end

@implementation CKChatInputController

- (void)_presentCompactSwitcherOverKeyboardWithCompletion:(id)a3
{
  id v4 = a3;
  [(CKChatInputController *)self setInputViewWillBecomeVisible:1];
  v5 = [CKPresentationControllerWindow alloc];
  v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 bounds];
  v7 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:](v5, "initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:", 0, 0, 0);

  v8 = [(CKChatInputController *)self browserSwitcher];
  [v8 beginAppearanceTransition:1 animated:1];

  v9 = [(CKPresentationControllerWindow *)v7 rootViewController];
  v10 = [v9 view];
  v11 = [(CKChatInputController *)self browserSwitcher];
  [v9 addChildViewController:v11];

  v12 = [(CKChatInputController *)self browserSwitcher];
  v13 = [v12 view];
  [v10 addSubview:v13];

  v14 = [(CKChatInputController *)self browserSwitcher];
  [v14 didMoveToParentViewController:v9];

  v75[0] = 0;
  +[CKInputView defaultContentSizeLargerThanKeyboard:v75];
  double v16 = v15;
  v17 = (double *)MEMORY[0x1E4F1DB28];
  double v18 = *MEMORY[0x1E4F1DB28];
  [(CKPresentationControllerWindow *)v7 bounds];
  double v19 = CGRectGetMaxY(v76) - v16;
  [(CKPresentationControllerWindow *)v7 bounds];
  double Width = CGRectGetWidth(v77);
  v21 = [(CKChatInputController *)self browserSwitcher];
  v22 = [v21 view];
  objc_msgSend(v22, "setFrame:", v18, v19, Width, v16);

  [(CKPresentationControllerWindow *)v7 setHidden:0];
  v23 = [(CKChatInputController *)self browserSwitcher];
  v24 = [v23 view];
  [v24 layoutIfNeeded];

  v25 = [(CKChatInputController *)self browserSwitcher];
  v26 = [v25 view];
  [v26 setUserInteractionEnabled:0];

  if (v75[0])
  {
    v27 = [(CKChatInputController *)self entryView];
    [v27 frame];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    v36 = [(CKChatInputController *)self entryView];
    -[CKPresentationControllerWindow convertRect:fromView:](v7, "convertRect:fromView:", v36, v29, v31, v33, v35);
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;

    v45 = [CKMessageEntryViewSnapshot alloc];
    v46 = [(CKChatInputController *)self entryView];
    v47 = -[CKMessageEntryViewSnapshot initWithFrame:entryView:](v45, "initWithFrame:entryView:", v46, v38, v40, v42, v44);

    v48 = [(CKChatInputController *)self browserSwitcher];
    v49 = [v48 view];
    [v10 insertSubview:v47 belowSubview:v49];
  }
  else
  {
    v47 = 0;
    double v40 = v17[1];
    double v42 = v17[2];
    double v38 = v18;
    double v44 = v17[3];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke;
  aBlock[3] = &unk_1E5622C20;
  id v50 = v9;
  id v70 = v50;
  id v51 = v10;
  id v71 = v51;
  v72 = self;
  v52 = v7;
  v73 = v52;
  id v53 = v4;
  id v74 = v53;
  v54 = _Block_copy(aBlock);
  [MEMORY[0x1E4F39CF8] begin];
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    v55 = [(CKChatInputController *)self delegate];
    [v55 chatInputControllerRequestShowKeyboardSnapshot:self];
  }
  v56 = [(CKChatInputController *)self browserSwitcher];
  [v56 animateInCompactWithCompletion:v54];

  v57 = [(CKChatInputController *)self entryView];
  [v57 prepareForBrowserSwitcherCompactTransitionIsSnapshotting:v75[0]];

  if (v75[0])
  {
    v78.origin.x = v18;
    v78.origin.y = v19;
    v78.size.width = Width;
    v78.size.height = v16;
    double MinY = CGRectGetMinY(v78);
    v79.origin.x = v38;
    v79.origin.y = v40;
    v79.size.width = v42;
    v79.size.height = v44;
    CGFloat v59 = MinY - CGRectGetHeight(v79);
    v60 = [MEMORY[0x1E4F39C90] animation];
    [v60 setKeyPath:@"position.y"];
    [v60 setBeginTime:CACurrentMediaTime() + 0.0500000007];
    [v60 setDuration:0.400000006];
    [v60 setMass:1.0];
    [v60 setStiffness:450.0];
    [v60 setDamping:35.0];
    [v60 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v60 setRemovedOnCompletion:0];
    v61 = NSNumber;
    v80.origin.x = v38;
    v80.origin.y = v40;
    v80.size.width = v42;
    v80.size.height = v44;
    CGRectGetMidX(v80);
    v81.origin.x = v38;
    v81.origin.y = v40;
    v81.size.width = v42;
    v81.size.height = v44;
    v62 = [v61 numberWithDouble:CGRectGetMidY(v81)];
    [v60 setFromValue:v62];

    v63 = NSNumber;
    v82.origin.x = v38;
    v82.origin.y = v59;
    v82.size.width = v42;
    v82.size.height = v44;
    CGRectGetMidX(v82);
    v83.origin.x = v38;
    v83.origin.y = v59;
    v83.size.width = v42;
    v83.size.height = v44;
    v64 = [v63 numberWithDouble:CGRectGetMidY(v83)];
    [v60 setToValue:v64];

    v65 = [(CKMessageEntryViewSnapshot *)v47 layer];
    [v65 addAnimation:v60 forKey:@"SpringPresentation"];

    v66 = (void *)MEMORY[0x1E4F42FF0];
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_6;
    v67[3] = &unk_1E5620C40;
    v68 = v47;
    [v66 animateWithDuration:v67 animations:0.400000006];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  v3 = [v2 snapshotViewAfterScreenUpdates:0];

  id v4 = [*(id *)(a1 + 32) view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  [*(id *)(a1 + 40) addSubview:v3];
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    v5 = [*(id *)(a1 + 48) delegate];
    [v5 chatInputControllerRequestDismissKeyboardSnapshot:*(void *)(a1 + 48)];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_2;
  block[3] = &unk_1E5622BA8;
  v6 = *(void **)(a1 + 56);
  block[4] = *(void *)(a1 + 48);
  id v8 = v6;
  id v9 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
  [*(id *)(a1 + 48) setInputViewWillBecomeVisible:0];
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_2(uint64_t a1)
{
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_3;
  v14[3] = &unk_1E5620C40;
  v14[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v14];
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI]) {
    int64_t v2 = 400000000;
  }
  else {
    int64_t v2 = 100000000;
  }
  dispatch_time_t v3 = dispatch_time(0, v2);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_4;
  v10 = &unk_1E5622BA8;
  id v4 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v4;
  id v13 = *(id *)(a1 + 48);
  dispatch_after(v3, MEMORY[0x1E4F14428], &v7);
  v5 = objc_msgSend(*(id *)(a1 + 32), "browserSwitcher", v7, v8, v9, v10, v11);
  v6 = [v5 view];
  [v6 setUserInteractionEnabled:1];
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_3(uint64_t a1)
{
  int64_t v2 = [*(id *)(a1 + 32) switcherInputViewController];
  dispatch_time_t v3 = [*(id *)(a1 + 32) browserSwitcher];
  [v2 setViewController:v3];

  id v4 = *(void **)(a1 + 32);
  v5 = [v4 switcherInputViewController];
  [v4 setCurrentInputViewController:v5];

  [*(id *)(a1 + 32) setInputViewVisible:1];
  id v6 = [*(id *)(a1 + 32) entryView];
  [v6 finishBrowserSwitcherCompactTransition];
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_4(id *a1)
{
  int64_t v2 = [a1[4] entryView];
  [v2 setAlpha:1.0];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_5;
  block[3] = &unk_1E5625E70;
  id v5 = a1[5];
  id v3 = a1[6];
  id v6 = a1[4];
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:1];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id v3 = [*(id *)(a1 + 40) browserSwitcher];
  [v3 endAppearanceTransition];
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_6(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) browserButton];
  v1 = +[CKUIBehavior sharedBehaviors];
  uint64_t v2 = [v1 theme];
  id v3 = [v2 appTintColor];
  [v4 setTintColor:v3];
}

- (void)_dismissCompactSwitcherOverKeyboardWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [CKPresentationControllerWindow alloc];
  id v6 = [MEMORY[0x1E4F42D90] mainScreen];
  [v6 bounds];
  id v7 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:](v5, "initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:", 0, 0, 0);

  char v76 = 0;
  +[CKInputView defaultContentSizeLargerThanKeyboard:&v76];
  double v59 = v8;
  id v9 = [(CKPresentationControllerWindow *)v7 rootViewController];
  v10 = [v9 view];
  uint64_t v11 = [(CKChatInputController *)self browserSwitcher];
  [v11 beginAppearanceTransition:0 animated:1];

  id v12 = [(CKChatInputController *)self browserSwitcher];
  id v13 = [v12 view];

  v14 = [v13 snapshotViewAfterScreenUpdates:0];
  [v13 frame];
  -[CKPresentationControllerWindow convertRect:fromView:](v7, "convertRect:fromView:", v13);
  double v16 = v15;
  CGFloat v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [(CKPresentationControllerWindow *)v7 bounds];
  double MaxY = CGRectGetMaxY(v77);
  v78.origin.x = v16;
  v78.origin.y = v18;
  v78.size.width = v20;
  v78.size.height = v22;
  double v24 = MaxY - CGRectGetHeight(v78);
  [v10 addSubview:v14];
  objc_msgSend(v14, "setFrame:", v16, v24, v20, v22);
  uint64_t v57 = *MEMORY[0x1E4F1DB28];
  if (v76)
  {
    v25 = [(CKChatInputController *)self entryView];
    [v25 frame];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    double v34 = [(CKChatInputController *)self entryView];
    -[CKPresentationControllerWindow convertRect:fromView:](v7, "convertRect:fromView:", v34, v27, v29, v31, v33);
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;

    double v43 = [CKMessageEntryViewSnapshot alloc];
    double v44 = [(CKChatInputController *)self entryView];
    v45 = -[CKMessageEntryViewSnapshot initWithFrame:entryView:](v43, "initWithFrame:entryView:", v44, v36, v38, v40, v42);

    [v10 addSubview:v45];
    [MEMORY[0x1E4F42B08] sizeForInterfaceOrientation:CKNonFlatDeviceOrientation() ignoreInputView:1];
    double v47 = v46;
    [v10 bounds];
    CGFloat v48 = CGRectGetHeight(v79) - v47;
    v80.origin.x = v36;
    v80.origin.y = v38;
    v80.size.width = v40;
    v80.size.height = v42;
    double v49 = v48 - CGRectGetHeight(v80);
  }
  else
  {
    v45 = 0;
    double v49 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v40 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v42 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    double v38 = v49;
    double v36 = *MEMORY[0x1E4F1DB28];
  }
  -[CKPresentationControllerWindow setHidden:](v7, "setHidden:", 0, v57);
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke;
  v74[3] = &unk_1E5622A18;
  v74[4] = self;
  char v75 = v76;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v74];
  id v50 = [(CKChatInputController *)self browserSwitcher];
  [v9 addChildViewController:v50];

  [v10 insertSubview:v13 belowSubview:v14];
  id v51 = [(CKChatInputController *)self browserSwitcher];
  [v51 didMoveToParentViewController:v9];

  [(CKPresentationControllerWindow *)v7 bounds];
  CGFloat v52 = CGRectGetMaxY(v81) - v59;
  [(CKPresentationControllerWindow *)v7 bounds];
  objc_msgSend(v13, "setFrame:", v58, v52, CGRectGetWidth(v82), v59);
  [v13 layoutIfNeeded];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_68;
  block[3] = &unk_1E5625E98;
  void block[4] = self;
  v61 = v7;
  v63 = v45;
  id v64 = v4;
  char v73 = v76;
  double v65 = v36;
  double v66 = v38;
  double v67 = v40;
  double v68 = v42;
  double v69 = v36;
  double v70 = v49;
  double v71 = v40;
  double v72 = v42;
  id v62 = v14;
  id v53 = v45;
  id v54 = v14;
  id v55 = v4;
  v56 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInputViewVisible:0];
  [*(id *)(a1 + 32) setCurrentInputViewController:0];
  uint64_t v2 = [*(id *)(a1 + 32) switcherInputViewController];
  [v2 setViewController:0];

  [*(id *)(a1 + 32) setSwitcherInputViewController:0];
  if (*(unsigned char *)(a1 + 40))
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v5 = 0;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Setting entry view alpha to 0", v5, 2u);
      }
    }
    id v4 = [*(id *)(a1 + 32) entryView];
    [v4 setAlpha:0.0];
  }
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_68(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 chatInputControllerWillDismissCompactBrowserViewController:*(void *)(a1 + 32)];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E5622BA8;
  id v3 = *(void **)(a1 + 40);
  void aBlock[4] = *(void *)(a1 + 32);
  id v23 = v3;
  id v24 = *(id *)(a1 + 64);
  id v4 = _Block_copy(aBlock);
  [*(id *)(a1 + 48) setHidden:1];
  [MEMORY[0x1E4F39CF8] begin];
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    id v5 = [*(id *)(a1 + 32) delegate];
    [v5 chatInputControllerRequestShowKeyboardSnapshot:*(void *)(a1 + 32)];
  }
  id v6 = [*(id *)(a1 + 32) browserSwitcher];
  [v6 animateOutCompactWithCompletion:v4];

  if (*(unsigned char *)(a1 + 136))
  {
    id v7 = [MEMORY[0x1E4F39B48] animation];
    [v7 setKeyPath:@"position.y"];
    double v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    [v7 setTimingFunction:v8];

    [v7 setBeginTime:CACurrentMediaTime()];
    [v7 setDuration:0.100000001];
    id v9 = NSNumber;
    CGFloat v10 = *(double *)(a1 + 72);
    CGFloat v11 = *(double *)(a1 + 80);
    CGFloat v12 = *(double *)(a1 + 88);
    CGFloat v13 = *(double *)(a1 + 96);
    v25.origin.x = v10;
    v25.origin.y = v11;
    v25.size.width = v12;
    v25.size.height = v13;
    CGRectGetMidX(v25);
    v26.origin.x = v10;
    v26.origin.y = v11;
    v26.size.width = v12;
    v26.size.height = v13;
    v14 = [v9 numberWithDouble:CGRectGetMidY(v26)];
    [v7 setFromValue:v14];

    double v15 = NSNumber;
    CGFloat v16 = *(double *)(a1 + 104);
    CGFloat v17 = *(double *)(a1 + 112);
    CGFloat v18 = *(double *)(a1 + 120);
    CGFloat v19 = *(double *)(a1 + 128);
    v27.origin.x = v16;
    v27.origin.y = v17;
    v27.size.width = v18;
    v27.size.height = v19;
    CGRectGetMidX(v27);
    v28.origin.x = v16;
    v28.origin.y = v17;
    v28.size.width = v18;
    v28.size.height = v19;
    double v20 = [v15 numberWithDouble:CGRectGetMidY(v28)];
    [v7 setToValue:v20];

    [v7 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v7 setRemovedOnCompletion:0];
    double v21 = [*(id *)(a1 + 56) layer];
    [v21 addAnimation:v7 forKey:@"EntryViewSlideout"];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryView];
  [v2 setAlpha:1.0];

  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 chatInputControllerRequestDismissKeyboardSnapshot:*(void *)(a1 + 32)];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_3;
  block[3] = &unk_1E5622BA8;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) browserSwitcher];
  [v2 endAppearanceTransition];

  [*(id *)(a1 + 32) setBrowserSwitcher:0];
  [*(id *)(a1 + 40) setHidden:1];
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 chatInputControllerDidDismissCompactBrowserViewController:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (id)_entryViewSnapshotWithFrame:(CGRect)a3
{
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v4 setBackgroundColor:0];
  [v4 setClipsToBounds:1];
  id v5 = objc_alloc(MEMORY[0x1E4F430A8]);
  id v6 = +[CKUIBehavior sharedBehaviors];
  id v7 = [v6 theme];
  double v8 = [v7 entryViewBackdropSettings];
  id v9 = (void *)[v5 initWithSettings:v8];

  [v9 setAutoresizingMask:18];
  [v4 bounds];
  objc_msgSend(v4, "setFrame:");
  [v4 addSubview:v9];
  CGFloat v10 = [(CKChatInputController *)self entryView];
  CGFloat v11 = [v10 snapshotForCompactBrowserAnimation];

  [v11 setAutoresizingMask:18];
  [v4 bounds];
  objc_msgSend(v11, "setFrame:");
  [v4 addSubview:v11];

  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.MobileSMS.CKAppExtension.launch", 0);
  id v4 = [(CKChatInputController *)self textInputPayloadController];
  id v5 = [v4 payloadDelegate];

  if (v5 == self)
  {
    [v4 setPayloadDelegate:0];
    [v4 setSupportedPayloadIds:MEMORY[0x1E4F1CBF0]];
  }
  id v6 = [__DDActionClass() clientActionsDelegate];

  if (v6 == self) {
    [__DDActionClass() setClientActionsDelegate:0];
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  double v8 = [(CKBrowserSwitcherViewController *)self->_browserSwitcher transitionCoordinator];
  [v8 dismissCurrentFullScreenModalAnimated:0 completion:0];

  id v9 = [(CKBrowserSwitcherViewController *)self->_browserSwitcher transitionCoordinator];
  [v9 dismissCurrentExpandedBrowserAnimated:0 completion:0];

  [(CKScheduledUpdater *)self->_orientationUpdater invalidate];
  [(CKDeviceOrientationManager *)self->_orientationManager setDelegate:0];
  [(CKDeviceOrientationManager *)self->_orientationManager invalidate];
  [(CKHandwritingPresentationController *)self->_handwritingPresentationController setSendDelegate:0];

  v10.receiver = self;
  v10.super_class = (Class)CKChatInputController;
  [(CKChatInputController *)&v10 dealloc];
}

- (CKChatInputController)init
{
  v16.receiver = self;
  v16.super_class = (Class)CKChatInputController;
  uint64_t v2 = [(CKChatInputController *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    v2->_isAppCardDraggingBelowKeyboardDetent = 0;
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel_applicationWillAddDeactivationReasonNotification_ name:*MEMORY[0x1E4F43F88] object:0];
    [v4 addObserver:v3 selector:sel_composeRecipientViewDidBecomeFirstResponder_ name:@"com.apple.ChatKit.CKComposeRecipientView.BecameFirstResponder" object:0];
    [v4 addObserver:v3 selector:sel_extensionRemoteConnectionWasInterrupted_ name:*MEMORY[0x1E4F6D348] object:0];
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F6C3D8]) initWithTarget:0 action:0];
    dismissEntryViewShelfUpdater = v3->_dismissEntryViewShelfUpdater;
    v3->_dismissEntryViewShelfUpdater = (IMScheduledUpdater *)v5;

    id v7 = [[CKScheduledUpdater alloc] initWithTarget:v3 action:sel__handleOrientation];
    orientationUpdater = v3->_orientationUpdater;
    v3->_orientationUpdater = v7;

    id v9 = objc_alloc_init(CKDeviceOrientationManager);
    orientationManager = v3->_orientationManager;
    v3->_orientationManager = v9;

    [(CKDeviceOrientationManager *)v3->_orientationManager setDelegate:v3];
    [(CKDeviceOrientationManager *)v3->_orientationManager beginListeningForOrientationEventsWithKey:@"KeyboardVisible"];
    CGFloat v11 = objc_alloc_init(CKChatEagerUploadController);
    eagerUploadController = v3->_eagerUploadController;
    v3->_eagerUploadController = v11;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__CKChatInputController_init__block_invoke;
    block[3] = &unk_1E5620C40;
    double v15 = v3;
    if (init_launchAppExtensionIfNecessaryToken != -1) {
      dispatch_once(&init_launchAppExtensionIfNecessaryToken, block);
    }
  }
  return v3;
}

uint64_t __29__CKChatInputController_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupObserverForLaunchAppExtensionForDebugging];
}

- (void)setEntryView:(id)a3
{
  id v4 = (CKMessageEntryView *)a3;
  [(CKMessageEntryView *)self->_entryView setInputDelegate:0];
  entryView = self->_entryView;
  self->_entryView = v4;
  id v6 = v4;

  [(CKMessageEntryView *)self->_entryView setInputDelegate:self];
  if (v6)
  {
    id v7 = [(CKChatInputController *)self deferredComposition];

    if (v7)
    {
      double v8 = [(CKChatInputController *)self entryView];
      id v9 = [(CKChatInputController *)self deferredComposition];
      [v8 setComposition:v9];

      [(CKChatInputController *)self setDeferredComposition:0];
    }
  }
}

- (id)inputViewController
{
  if ([(CKChatInputController *)self isInputViewVisible])
  {
    id v3 = [(CKChatInputController *)self currentInputViewController];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)clearBrowserViewControllerIfNecessary
{
  if ([(CKChatInputController *)self keyboardIsHiding]
    && ![(CKChatInputController *)self appModalIsDisplayed]
    && ![(CKChatInputController *)self inCollapseOrExpandAnimation])
  {
    [(CKChatInputController *)self setInputViewVisible:0];
  }
}

- (void)_loadPhotosBrowser
{
}

- (BOOL)_isRunningInMVS
{
  return CKIsRunningInMessagesViewService() != 0;
}

- (void)_loadPhotosBrowserCollapsingEntryField:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_switcherInputViewController)
  {
    uint64_t v5 = [(CKChatInputController *)self browserSwitcher];
    [v5 unloadRemoteViewControllers];

    [(CKChatInputController *)self setBrowserSwitcher:0];
    [(CKChatInputController *)self setSwitcherInputViewController:0];
    [(CKChatInputController *)self setCurrentInputViewController:0];
  }
  if ([(CKChatInputController *)self _isRunningInMVS])
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Asked to show AE in MVS, bailing!", buf, 2u);
      }
    }
  }
  else
  {
    id v7 = +[CKBalloonPluginManager sharedInstance];
    id v13 = [v7 existingPhotoBrowserViewController];

    if (!v13)
    {
      double v8 = +[CKBalloonPluginManager sharedInstance];
      id v13 = [v8 photosBrowserViewControllerWithPluginPayloads:0];
    }
    [v13 setSendDelegate:self];
    id v9 = [v13 balloonPlugin];
    [(CKChatInputController *)self setBrowserPlugin:v9];

    objc_super v10 = [CKKeyboardContentViewController alloc];
    CGFloat v11 = [(CKKeyboardContentViewController *)v10 initWithViewController:v13 identifier:*MEMORY[0x1E4F6CBF8]];
    CGFloat v12 = [(CKKeyboardContentViewController *)v11 view];
    [v13 setDragTargetView:v12];

    [(CKChatInputController *)self setCurrentInputViewController:v11];
    [(CKChatInputController *)self setInputViewVisible:1 entryFieldCollapsed:v3 animated:1];
  }
}

- (void)showPhotosExtension
{
  IMBalloonExtensionIDWithSuffix();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CKChatInputController *)self showPluginWithExtensionIdentifier:v3];
}

- (void)showPhotosBrowser
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  uint64_t v4 = [v3 isAccessibilityPreferredContentSizeCategory] ^ 1;

  [(CKChatInputController *)self showPhotosBrowserCollapsingEntryField:v4];
}

- (void)showPhotosBrowserCollapsingEntryField:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKChatInputController *)self isInputViewVisible])
  {
    uint64_t v5 = [(CKChatInputController *)self currentInputViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v9 = [(CKChatInputController *)self currentInputViewController];
      id v7 = [v9 identifier];
      char v8 = [v7 isEqualToString:*MEMORY[0x1E4F6CBF8]];

      if (v8)
      {
        [(CKChatInputController *)self setBrowserPlugin:0];
        [(CKChatInputController *)self setBrowserPluginDataSource:0];
        [(CKChatInputController *)self dismissBrowserViewController];

        return;
      }
    }
  }

  [(CKChatInputController *)self _loadPhotosBrowserCollapsingEntryField:v3];
}

- (void)showFunCamera
{
  if (+[CKFunCameraUserConsentManager shouldPromptUserForFunCameraConsent])
  {
    BOOL v3 = [(CKChatInputController *)self delegate];
    uint64_t v4 = [v3 activeSendMenuPresentationForChatInputController:self];

    id location = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__CKChatInputController_showFunCamera__block_invoke;
    aBlock[3] = &unk_1E5622AB8;
    objc_copyWeak(&v11, &location);
    id v5 = v4;
    id v10 = v5;
    id v6 = _Block_copy(aBlock);
    id v7 = [v5 sendMenuViewController];
    +[CKFunCameraUserConsentManager presentFromViewController:v7 presentedBlock:&__block_literal_global_188 confirmBlock:v6 cancelBlock:0];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    id v8 = [(CKChatInputController *)self entryView];
    [(CKChatInputController *)self showFunCamera:v8];
  }
}

void __38__CKChatInputController_showFunCamera__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [WeakRetained entryView];
  [WeakRetained showFunCamera:v2];

  BOOL v3 = [*(id *)(a1 + 32) sendMenuViewController];
  [v3 performFullScreenDismissAnimationWithCompletion:0];
}

- (void)showFunCamera:(id)a3
{
  id v4 = a3;
  if ([(CKChatInputController *)self _isiMessageConversation])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Camera button is hit and perfrom MMCS prewarm", buf, 2u);
      }
    }
    id v6 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    [v6 preWarmConnection];
  }
  id v7 = [(CKChatInputController *)self delegate];
  id v8 = [v7 activeSendMenuPresentationForChatInputController:self];

  if (v8 && [v8 presentationStyle] == 1)
  {
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__CKChatInputController_showFunCamera___block_invoke;
    v13[3] = &unk_1E5623970;
    objc_copyWeak(&v14, (id *)buf);
    [v8 dismissAnimated:1 completion:v13];
    id v9 = &v14;
  }
  else
  {
    if (![(CKChatInputController *)self isAppCardPresented])
    {
      id v10 = [(CKChatInputController *)self delegate];
      [v10 chatInputControllerDidSelectFunCamera:self];

      goto LABEL_14;
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __39__CKChatInputController_showFunCamera___block_invoke_2;
    v11[3] = &unk_1E56215C8;
    objc_copyWeak(&v12, (id *)buf);
    [(CKChatInputController *)self dismissAppCardIfNecessaryAnimated:1 completion:v11];
    id v9 = &v12;
  }
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)buf);
LABEL_14:
}

void __39__CKChatInputController_showFunCamera___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v2 = [WeakRetained delegate];
    [v2 chatInputControllerDidSelectFunCamera:WeakRetained];
  }
}

void __39__CKChatInputController_showFunCamera___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 chatInputControllerDidSelectFunCamera:WeakRetained];
}

- (void)showDTCompose
{
  BOOL v3 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v4 = [v3 balloonPluginForBundleID:*MEMORY[0x1E4F6CBA0]];

  [(CKChatInputController *)self showBrowserForPlugin:v4 dataSource:0 style:0];
}

- (void)showSendLater
{
  BOOL v3 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v11 = [v3 balloonPluginForBundleID:*MEMORY[0x1E4F6CC20]];

  if (IMSharedHelperDeviceIsiPad())
  {
    id v4 = [(CKChatInputController *)self entryView];
    id v5 = [v4 contentView];
    id v6 = [v5 sendLaterView];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(CKChatInputController *)self entryView];
    }
    id v10 = v8;

    id v9 = [[CKTranscriptPluginPresentationConfiguration alloc] initWithSourceView:v10 permittedArrowDirections:2 shouldDisableSnapshotView:0];
  }
  else
  {
    id v9 = 0;
  }
  [(CKChatInputController *)self showBrowserForPlugin:v11 dataSource:0 style:0 presentationConfiguration:v9];
}

- (void)_sendLaterSelectedFromSendMenuWithPresentation:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v6 = [v5 balloonPluginForBundleID:*MEMORY[0x1E4F6CC20]];

  id v7 = [(CKChatInputController *)self entryView];
  id v8 = [v7 composition];
  int v9 = [v8 hasContent];

  id v10 = [(CKChatInputController *)self browserPlugin];
  id v11 = [v10 identifier];
  id v12 = [v6 identifier];
  int v13 = [v11 isEqualToString:v12];

  uint64_t v14 = [v4 presentationStyle];
  if (IMOSLoggingEnabled())
  {
    double v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      int v25 = v9;
      __int16 v26 = 1024;
      int v27 = v13;
      __int16 v28 = 1024;
      BOOL v29 = v14 == 1;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "_sendLaterSelectedFromSendMenu preferDatePicker: %{BOOL}d, datePickerIsPresented: %{BOOL}d, sendMenuInPopover: %{BOOL}d", buf, 0x14u);
    }
  }
  if (v9)
  {
    if ((v13 & 1) == 0)
    {
      if (v14 == 1)
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __72__CKChatInputController__sendLaterSelectedFromSendMenuWithPresentation___block_invoke;
        v23[3] = &unk_1E5620BF0;
        v23[4] = self;
        [v4 dismissAnimated:1 completion:v23];
      }
      else
      {
        [(CKChatInputController *)self showSendLater];
      }
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  objc_super v16 = [(CKChatInputController *)self pluginContextForPlugin:v6];
  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v17 = [(CKChatInputController *)self entryView];
      [v17 setSendLaterPluginInfo:v16 animated:1];
    }
  }

  if (v13)
  {
LABEL_14:
    if (IMOSLoggingEnabled())
    {
      CGFloat v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "_sendLaterSelectedFromSendMenuWithPresentation: Date Picker already presented. Not changing input mode.", buf, 2u);
      }
    }
    int v19 = 0;
    goto LABEL_20;
  }
  int v19 = 1;
LABEL_20:
  if (v14 == 1) {
    char v20 = v9;
  }
  else {
    char v20 = 1;
  }
  if (v20)
  {
    if (v19) {
      [(CKChatInputController *)self showKeyboard];
    }
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __72__CKChatInputController__sendLaterSelectedFromSendMenuWithPresentation___block_invoke_2;
    v21[3] = &unk_1E56287B0;
    char v22 = v19;
    v21[4] = self;
    [v4 dismissAnimated:1 completion:v21];
  }
LABEL_27:
}

uint64_t __72__CKChatInputController__sendLaterSelectedFromSendMenuWithPresentation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showSendLater];
}

uint64_t __72__CKChatInputController__sendLaterSelectedFromSendMenuWithPresentation___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) showKeyboard];
  }
  return result;
}

- (void)sendLaterPluginInfoUpdated
{
  BOOL v3 = [(CKChatInputController *)self entryView];
  id v4 = [v3 sendLaterPluginInfo];

  if (!v4)
  {
    if (IMSharedHelperDeviceIsiPad()
      && ([(CKChatInputController *)self browserPlugin],
          id v5 = objc_claimAutoreleasedReturnValue(),
          [v5 identifier],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 isEqualToString:*MEMORY[0x1E4F6CC20]],
          v6,
          v5,
          v7))
    {
      [(CKChatInputController *)self dismissBrowserViewController];
    }
    else
    {
      id v14 = [(CKChatInputController *)self appCardPresentationOverseer];
      uint64_t v8 = [v14 browserViewController];
      if (v8)
      {
        int v9 = (void *)v8;
        id v10 = [v14 browserViewController];
        id v11 = [v10 balloonPlugin];
        id v12 = [v11 identifier];
        int v13 = [v12 isEqualToString:*MEMORY[0x1E4F6CC20]];

        if (v13)
        {
          if ([MEMORY[0x1E4F42B08] isInHardwareKeyboardMode]) {
            [(CKChatInputController *)self dismissAppCardIfNecessaryAnimated:1 isFocusingKeyboard:1 completion:0];
          }
          else {
            [(CKChatInputController *)self showKeyboard];
          }
        }
      }
    }
  }
}

- (void)_showFullScreenBrowser:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 balloonPlugin];
  [(CKChatInputController *)self setBrowserPlugin:v5];

  [v4 setSendDelegate:self];
  id v6 = [[CKFullscreenBrowserNavigationController alloc] initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
  int v7 = [CKExpandedAppViewController alloc];
  uint64_t v8 = [(CKChatInputController *)self targetConversation];
  int v9 = [v4 balloonPlugin];
  id v10 = [(CKExpandedAppViewController *)v7 initWithConversation:v8 plugin:v9];

  [(CKExpandedAppViewController *)v10 setContentViewController:v4];
  [(CKExpandedAppViewController *)v10 setDelegate:self];
  v16[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [(CKFullscreenBrowserNavigationController *)v6 setViewControllers:v11];

  [(CKChatInputController *)self setStatusBarStyleViewController:v4];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__CKChatInputController__showFullScreenBrowser___block_invoke;
  v15[3] = &unk_1E5620C40;
  v15[4] = self;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__CKChatInputController__showFullScreenBrowser___block_invoke_145;
  v14[3] = &unk_1E5620BF0;
  v14[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v15 animations:v14 completion:0.5];
  [(CKChatInputController *)self setPresentedBrowserNavigationController:v6];
  id v12 = [(CKChatInputController *)self delegate];
  int v13 = [v12 viewControllerForChatInputModalPresentation];
  [v13 presentViewController:v6 animated:1 completion:0];
}

void __48__CKChatInputController__showFullScreenBrowser___block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Setting entry view alpha to 0", v4, 2u);
    }
  }
  BOOL v3 = [*(id *)(a1 + 32) entryView];
  [v3 setAlpha:0.0];
}

void __48__CKChatInputController__showFullScreenBrowser___block_invoke_145(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) entryView];
  [v1 setHidden:1];
}

- (void)appSelectionInterfaceSelectedItem:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v6 = objc_msgSend(v4, "__ck_identifier");
  int v7 = [v5 balloonPluginForBundleID:v6];

  uint64_t v8 = objc_msgSend(v4, "__ck_identifier");
  int v9 = [v8 isEqualToString:@"kAppMenuAudio"];

  id v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isScheduledMessagesEnabled];

  if (!v11)
  {
    int v13 = 0;
    if (!v7) {
      goto LABEL_3;
    }
LABEL_6:
    CGFloat v17 = [(CKChatInputController *)self entryView];
    CGFloat v18 = [v17 sendMenuSourceView];
    int v19 = [[CKTranscriptPluginPresentationConfiguration alloc] initWithSourceView:v18 permittedArrowDirections:8 shouldDisableSnapshotView:0];
    [(CKChatInputController *)self showBrowserForPlugin:v7 dataSource:0 style:1 presentationConfiguration:v19];

    goto LABEL_10;
  }
  id v12 = objc_msgSend(v4, "__ck_identifier");
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F6CC20]];

  if (v7) {
    goto LABEL_6;
  }
LABEL_3:
  id v14 = objc_msgSend(v4, "__ck_identifier");
  int v15 = [v14 isEqualToString:@"kAppMenuPhotosItemIdentifier"];

  if (v15)
  {
    objc_super v16 = [(CKChatInputController *)self delegate];
    [v16 chatInputDidSelectPhotoPicker];
LABEL_9:

    goto LABEL_10;
  }
  char v20 = objc_msgSend(v4, "__ck_identifier");
  int v21 = [v20 isEqualToString:@"kAppMenuEffectsItemIdentifier"];

  if (v21)
  {
    objc_super v16 = [(CKChatInputController *)self delegate];
    [v16 chatInputDidSelectEffectPicker];
    goto LABEL_9;
  }
  char v22 = objc_msgSend(v4, "__ck_identifier");
  if ([v22 isEqualToString:@"kAppMenuEmoji"])
  {
    id v23 = [(CKChatInputController *)self delegate];
    char v24 = objc_opt_respondsToSelector();

    if (v24)
    {
      objc_super v16 = [(CKChatInputController *)self delegate];
      [v16 chatInputDidSelectEmojiPicker];
      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v9)
  {
    int v25 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v26 = [v25 isAudioMessagesEntryViewRecordingEnabled];

    if (v26)
    {
      objc_super v16 = [(CKChatInputController *)self entryView];
      [v16 startRecordingForAudioButtonInEntryView];
      goto LABEL_9;
    }
  }
  if (v13)
  {
    int v27 = [(CKChatInputController *)self entryView];
    __int16 v28 = [v27 composition];
    BOOL v29 = [v28 shelfPluginPayload];

    if (v29 && ([v29 supportsSendLater] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        double v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          double v35 = [v29 pluginBundleID];
          int v37 = 138412290;
          double v38 = v35;
          _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_INFO, "User selected send later, but the currently staged plugin payload (%@) does not allow presentation alongside Send Later. Presenting unsupported item alert and aborting.", (uint8_t *)&v37, 0xCu);
        }
      }
      double v36 = [v29 pluginBundleID];
      [(CKChatInputController *)self _presentSendLaterUnsupportedAlertForIdentifier:v36 handler:0];
    }
    else
    {
      uint64_t v30 = [(CKChatInputController *)self sendLaterPluginInfo];
      double v31 = [(CKChatInputController *)self entryView];
      [v31 setSendLaterPluginInfo:v30 animated:1];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    double v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      double v33 = objc_msgSend(v4, "__ck_identifier");
      int v37 = 138412290;
      double v38 = v33;
      _os_log_impl(&dword_18EF18000, v32, OS_LOG_TYPE_INFO, "unknown CKAppMenuItem:  %@", (uint8_t *)&v37, 0xCu);
    }
  }
LABEL_10:
}

- (void)showHandwritingBrowser
{
}

- (void)swipeDismissBrowser
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  uint64_t v4 = [v3 isAccessibilityPreferredContentSizeCategory] ^ 1;

  [(CKChatInputController *)self setInputViewVisible:0 entryFieldCollapsed:v4 animated:0 messageDelegate:0];
}

- (void)dismissAppCardIfNecessary
{
}

- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 completion:(id)a4
{
}

- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 isFocusingKeyboard:(BOOL)a4 completion:(id)a5
{
}

- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 isFocusingKeyboard:(BOOL)a4 overrideExceptions:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  uint64_t v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  if (CKIsAppCardsEnabled())
  {
    int v11 = [(CKChatInputController *)self appCardPresentationOverseer];
    int v12 = [v11 isPresentingCard];

    if (v12)
    {
      if ([(CKChatInputController *)self isDismissingAppCardForKeyboardPresentation]|| v7)
      {
        int v13 = [(CKChatInputController *)self appCardPresentationOverseer];
        uint64_t v7 = [v13 shouldAnimateDismissal] ^ 1;
      }
      [(CKChatInputController *)self setIsDismissingAppCardForKeyboardPresentation:v7];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __108__CKChatInputController_dismissAppCardIfNecessaryAnimated_isFocusingKeyboard_overrideExceptions_completion___block_invoke;
      aBlock[3] = &unk_1E5622A18;
      char v29 = v7;
      void aBlock[4] = self;
      id v14 = (void (**)(void))_Block_copy(aBlock);
      uint64_t v15 = [(CKChatInputController *)self activeSendMenuPresentationForAppCardOverseer];
      if (v15
        && (objc_super v16 = (void *)v15,
            -[CKChatInputController activeSendMenuPresentationForAppCardOverseer](self, "activeSendMenuPresentationForAppCardOverseer"), v17 = objc_claimAutoreleasedReturnValue(), uint64_t v18 = [v17 presentationStyle], v17, v16, v18 == 1))
      {
        char v19 = 1;
      }
      else
      {
        v14[2](v14);
        char v19 = 0;
      }
      int v21 = [(CKChatInputController *)self appCardPresentationOverseer];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __108__CKChatInputController_dismissAppCardIfNecessaryAnimated_isFocusingKeyboard_overrideExceptions_completion___block_invoke_2;
      v24[3] = &unk_1E56245F8;
      char v27 = v19;
      id v25 = v14;
      id v26 = v10;
      char v22 = v14;
      [v21 dismissCardAnimated:v8 overrideExceptions:v6 completion:v24];
    }
    else if (IMOSLoggingEnabled())
    {
      char v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v23 = 0;
      }
    }
  }
}

uint64_t __108__CKChatInputController_dismissAppCardIfNecessaryAnimated_isFocusingKeyboard_overrideExceptions_completion___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) showKeyboard];
  }
  return result;
}

uint64_t __108__CKChatInputController_dismissAppCardIfNecessaryAnimated_isFocusingKeyboard_overrideExceptions_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)setAppCardDismissPadding:(double)a3
{
  self->_appCardDismissPadding = a3;
  if (CKIsAppCardsEnabled())
  {
    id v5 = [(CKChatInputController *)self appCardPresentationOverseer];
    [v5 setAppCardDismissPadding:a3];
  }
}

- (BOOL)isAppCardPresented
{
  BOOL v3 = CKIsAppCardsEnabled();
  if (v3)
  {
    uint64_t v4 = [(CKChatInputController *)self appCardPresentationOverseer];
    char v5 = [v4 isPresentingCard];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)presentedAppBypassesSendMenu
{
  BOOL v3 = CKIsAppCardsEnabled();
  if (v3)
  {
    uint64_t v4 = [(CKChatInputController *)self appCardPresentationOverseer];
    char v5 = [v4 presentedAppBypassesSendMenu];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_adamIDFromPluginPayloadData:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v12 = 0;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v3 error:&v12];
  id v5 = v12;
  if (objc_opt_respondsToSelector())
  {
    [v4 _enableStrictSecureDecodingMode];
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "strict-decoding 019 _enableStrictSecureDecodingMode called", buf, 2u);
      }
    }
  }
  uint64_t v7 = IMExtensionPayloadUnarchivingClasses();
  BOOL v8 = [v4 decodeObjectOfClasses:v7 forKey:*MEMORY[0x1E4F284E8]];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = [v8 objectForKey:*MEMORY[0x1E4F6D2D0]];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Failed to unarchive the pluginPayload data. Error: %@", buf, 0xCu);
      }
    }
    int v9 = 0;
  }

  return v9;
}

- (void)presentViewControllerWithPluginChatItem:(id)a3 presentationStyle:(unint64_t)a4
{
}

- (void)presentViewControllerWithPluginChatItem:(id)a3 presentationStyle:(unint64_t)a4 presentationConfiguration:(id)a5
{
  id v20 = a5;
  BOOL v8 = [a3 IMChatItem];
  int v9 = [v8 dataSource];

  id v10 = [MEMORY[0x1E4F6BC18] sharedInstance];
  int v11 = [v9 bundleID];
  id v12 = [v10 balloonPluginForBundleID:v11];

  int v13 = [(CKChatInputController *)self browserPluginDataSource];
  if (v13 != v9)
  {

    goto LABEL_3;
  }
  char v19 = [(CKChatInputController *)self browserPlugin];

  if (a4 == 2 || v19 != v12)
  {
LABEL_3:
    id v14 = [v12 identifier];
    if ([v14 isEqualToString:*MEMORY[0x1E4F6CBE8]])
    {
      uint64_t v15 = [v9 pluginPayload];
      objc_super v16 = [v15 data];

      CGFloat v17 = [(CKChatInputController *)self _adamIDFromPluginPayloadData:v16];
      [(CKChatInputController *)self setDeferredPluginDataSource:v9];
      [(CKChatInputController *)self presentAppStoreForAdamID:v17];
      uint64_t v18 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v18 trackEvent:*MEMORY[0x1E4F6D750]];
    }
    else
    {
      [(CKChatInputController *)self launchAndShowBrowserForPlugin:v12 dataSource:v9 style:a4 presentationConfiguration:v20];
    }
  }
}

- (void)presentAppStoreForAdamID:(id)a3
{
  id v4 = a3;
  id v5 = +[CKBalloonPluginManager sharedInstance];
  uint64_t v6 = *MEMORY[0x1E4F6CB80];
  uint64_t v7 = [v5 viewControllerForPluginIdentifier:*MEMORY[0x1E4F6CB80] dataSource:0];

  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [v7 setAdamID:v4];
    }
    BOOL v8 = [MEMORY[0x1E4F6BC18] sharedInstance];
    int v9 = [v8 balloonPluginForBundleID:v6];

    [(CKChatInputController *)self showBrowserForPlugin:v9 dataSource:0 style:1];
  }
  else if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Not launching the app store, got nil back for the VC", v11, 2u);
    }
  }
}

- (void)presentAppStoreForURL:(id)a3
{
}

- (void)presentAppStoreForURL:(id)a3 fromSourceApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[CKBalloonPluginManager sharedInstance];
  uint64_t v9 = *MEMORY[0x1E4F6CB80];
  id v10 = [v8 viewControllerForPluginIdentifier:*MEMORY[0x1E4F6CB80] dataSource:0];

  if (v10)
  {
    [v10 setSendDelegate:self];
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v10 setStoreLaunchURL:v6 sourceApplication:v7];
    }
    int v11 = [MEMORY[0x1E4F6BC18] sharedInstance];
    id v12 = [v11 balloonPluginForBundleID:v9];

    [(CKChatInputController *)self showBrowserForPlugin:v12 dataSource:0 style:1];
  }
  else if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Not launching the app store, got nil back for the VC", v14, 2u);
    }
  }
}

- (void)presentAppManager
{
  id v3 = +[CKBalloonPluginManager sharedInstance];
  id v4 = [v3 viewControllerForPluginIdentifier:@"com.apple.messages.browser.MorePlugin" dataSource:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 setDelegate:self];
  }
  if (v4)
  {
    id v5 = [v4 balloonPlugin];
    [(CKChatInputController *)self setBrowserPlugin:v5];

    [v4 setSendDelegate:self];
    [v4 setModalPresentationStyle:2];
    id v6 = [(CKChatInputController *)self delegate];
    id v7 = [v6 viewControllerForChatInputModalPresentation];
    [v7 presentViewController:v4 animated:1 completion:0];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_6;
    }
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Not launching the app manager, got nil back for the VC", v8, 2u);
    }
  }

LABEL_6:
}

- (void)notifyBrowserViewControllerOfMatchingNewMessages:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          int v11 = [v10 dataSource];
          id v12 = [v11 bundleID];

          int v13 = [(CKChatInputController *)self pluginBundleID];
          int v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            uint64_t v15 = [(CKChatInputController *)self browserSwitcher];
            objc_super v16 = [v15 currentViewController];

            if (objc_opt_respondsToSelector())
            {
              CGFloat v17 = [v10 dataSource];
              [v16 messageAddedWithDataSource:v17];
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
}

- (void)requestPhotoBrowserToAppendFinalImagesToComposition
{
  id v3 = +[CKBalloonPluginManager sharedInstance];
  id v20 = [v3 existingPhotoBrowserViewController];

  id v4 = [(CKChatInputController *)self entryView];
  uint64_t v5 = [v4 composition];

  uint64_t v6 = [v5 shelfPluginPayload];
  uint64_t v7 = [v6 pluginBundleID];
  if (v20) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || ![v7 isEqualToString:*MEMORY[0x1E4F6CBF8]])
  {
    id v12 = IMBalloonExtensionIDWithSuffix();
    int v13 = [v7 isEqualToString:v12];

    if (!v13) {
      goto LABEL_17;
    }
    int v14 = +[CKBalloonPluginManager sharedInstance];
    id v9 = [v14 viewControllerForPluginIdentifier:v7];

    [v9 setSendDelegate:self];
    id v11 = v6;
    uint64_t v15 = [v11 photoShelfViewController];

    if (v15)
    {
      objc_super v16 = [(CKChatInputController *)self dismissEntryViewShelfUpdater];
      [v16 beginHoldingUpdatesForKey:_kHoldShelfUpdateForSend];

      if (objc_opt_respondsToSelector())
      {
        CGFloat v17 = [v9 fetchPluginPayloadsAndClear:1];
      }
      else
      {
        CGFloat v17 = 0;
      }
      long long v19 = [(CKChatInputController *)self dismissEntryViewShelfUpdater];
      [v19 endHoldingUpdatesForKey:_kHoldShelfUpdateForSend];

      [v11 setAttachments:v17];
    }
  }
  else
  {
    id v9 = v20;
    id v10 = [(CKChatInputController *)self dismissEntryViewShelfUpdater];
    [v10 beginHoldingUpdatesForKey:_kHoldShelfUpdateForSend];

    if (objc_opt_respondsToSelector())
    {
      id v11 = [v9 fetchPluginPayloadsAndClear:1];
    }
    else
    {
      id v11 = 0;
    }
    long long v18 = [(CKChatInputController *)self dismissEntryViewShelfUpdater];
    [v18 endHoldingUpdatesForKey:_kHoldShelfUpdateForSend];

    [v6 setAttachments:v11];
  }

LABEL_17:
}

- (void)requestPhotoBrowserToPrepareForDraft
{
}

- (void)requestPhotoBrowserToPrepareForDraftClearingPhotoShelfViewController:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[CKBalloonPluginManager sharedInstance];
  id v21 = [v5 existingPhotoBrowserViewController];

  uint64_t v6 = [(CKChatInputController *)self entryView];
  uint64_t v7 = [v6 composition];

  BOOL v8 = [v7 shelfPluginPayload];
  if (v21) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9
    || ([v8 pluginBundleID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 isEqualToString:*MEMORY[0x1E4F6CBF8]],
        v10,
        !v11))
  {
    int v13 = [v8 pluginBundleID];
    int v14 = IMBalloonExtensionIDWithSuffix();
    int v15 = [v13 isEqualToString:v14];

    if (!v15) {
      goto LABEL_15;
    }
    objc_super v16 = +[CKBalloonPluginManager sharedInstance];
    CGFloat v17 = [v8 pluginBundleID];
    id v12 = [v16 viewControllerForPluginIdentifier:v17];

    [v12 setSendDelegate:self];
  }
  else
  {
    id v12 = v21;
  }
  long long v18 = [(CKChatInputController *)self dismissEntryViewShelfUpdater];
  [v18 beginHoldingUpdatesForKey:_kHoldShelfUpdateForDraft];

  if (objc_opt_respondsToSelector())
  {
    long long v19 = [v12 fetchPluginPayloadsAndClear:0];
  }
  else
  {
    long long v19 = 0;
  }
  id v20 = [(CKChatInputController *)self dismissEntryViewShelfUpdater];
  [v20 endHoldingUpdatesForKey:_kHoldShelfUpdateForDraft];

  [v8 setAttachments:v19];
  if (v3) {
    [v8 setPhotoShelfViewController:0];
  }

LABEL_15:
}

- (void)requestPhotoBrowserInitFromDraft:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 shelfPluginPayload];
  uint64_t v6 = [v5 pluginBundleID];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F6CBF8]];

  if (v7)
  {
    BOOL v8 = +[CKBalloonPluginManager sharedInstance];
    BOOL v9 = [v5 attachments];
    id v10 = [v8 photosBrowserViewControllerWithPluginPayloads:v9];

    [v10 setSendDelegate:self];
    int v11 = [v10 balloonPlugin];
    [(CKChatInputController *)self setBrowserPlugin:v11];

    [v5 setAttachments:0];
  }
  else
  {
    id v12 = [v5 pluginBundleID];
    int v13 = IMBalloonExtensionIDWithSuffix();
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      int v15 = +[CKBalloonPluginManager sharedInstance];
      [v15 invalidatePhotosViewController];

      objc_super v16 = +[CKBalloonPluginManager sharedInstance];
      CGFloat v17 = [v5 pluginBundleID];
      long long v18 = [v16 viewControllerForPluginIdentifier:v17];

      if (v18)
      {
        long long v19 = v5;
        id v20 = [v19 attachments];
        uint64_t v21 = [v20 count];

        if (v21)
        {
          if (IMOSLoggingEnabled())
          {
            char v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)char v24 = 0;
              _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Setting photo draft", v24, 2u);
            }
          }
          [v18 setSendDelegate:self];
          if (objc_opt_respondsToSelector()) {
            [v18 restoreDraftStateFromPayload:v19];
          }
          uint64_t v23 = [v18 balloonPlugin];
          [(CKChatInputController *)self setBrowserPlugin:v23];
        }
        else
        {
          uint64_t v23 = IMLogHandleForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[CKChatInputController requestPhotoBrowserInitFromDraft:]();
          }
        }
      }
      else
      {
        long long v19 = IMLogHandleForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[CKChatInputController requestPhotoBrowserInitFromDraft:]();
        }
      }
    }
  }
}

- (void)requestPhotoBrowserToEnumerateSelectedImagesUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[CKBalloonPluginManager sharedInstance];
  uint64_t v6 = [v5 existingPhotoBrowserViewController];

  int v7 = [(CKChatInputController *)self entryView];
  BOOL v8 = [v7 composition];

  BOOL v9 = [v8 shelfPluginPayload];
  id v10 = [v9 pluginBundleID];
  int v11 = v10;
  if (v6) {
    BOOL v12 = v9 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || ![v10 isEqualToString:*MEMORY[0x1E4F6CBF8]])
  {
    IMBalloonExtensionIDWithSuffix();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (![v11 isEqualToString:v13])
    {
      int v14 = 0;
LABEL_16:
      objc_super v16 = 0;
      goto LABEL_17;
    }
    int v14 = [v9 photoShelfViewController];

    if (!v14)
    {
      objc_super v16 = 0;
      goto LABEL_18;
    }
    int v15 = +[CKBalloonPluginManager sharedInstance];
    id v13 = [v15 viewControllerForPluginIdentifier:v11];
  }
  else
  {
    id v13 = v6;
  }
  if (objc_opt_respondsToSelector())
  {
    int v14 = [v13 fetchPluginPayloadsAndClear:0];
  }
  else
  {
    int v14 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_16;
  }
  objc_super v16 = [v13 fetchPluginStagedIdentifiers];
LABEL_17:

LABEL_18:
  uint64_t v17 = [v16 count];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __80__CKChatInputController_requestPhotoBrowserToEnumerateSelectedImagesUsingBlock___block_invoke;
  v20[3] = &unk_1E5629FE0;
  id v22 = v4;
  uint64_t v23 = v17;
  id v21 = v16;
  id v18 = v4;
  id v19 = v16;
  [v14 enumerateObjectsUsingBlock:v20];
}

void __80__CKChatInputController_requestPhotoBrowserToEnumerateSelectedImagesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  if (*(void *)(a1 + 48) <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)requestPhotoBrowserToUnstageImages:(id)a3
{
  id v14 = a3;
  if ([v14 count])
  {
    id v4 = +[CKBalloonPluginManager sharedInstance];
    uint64_t v5 = [v4 existingPhotoBrowserViewController];

    id v6 = [(CKChatInputController *)self entryView];
    int v7 = [v6 composition];

    BOOL v8 = [v7 shelfPluginPayload];
    BOOL v9 = [v8 pluginBundleID];
    id v10 = v9;
    if (v5 && v8 && [v9 isEqualToString:*MEMORY[0x1E4F6CBF8]])
    {
      id v11 = v5;
    }
    else
    {
      IMBalloonExtensionIDWithSuffix();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (![v10 isEqualToString:v11])
      {
LABEL_11:

        goto LABEL_12;
      }
      BOOL v12 = [v8 photoShelfViewController];

      if (!v12)
      {
LABEL_12:

        goto LABEL_13;
      }
      id v13 = +[CKBalloonPluginManager sharedInstance];
      id v11 = [v13 viewControllerForPluginIdentifier:v10];
    }
    if (objc_opt_respondsToSelector()) {
      [v11 clearPluginPackagesWithIdentifiers:v14];
    }
    goto LABEL_11;
  }
LABEL_13:
}

- (void)requestPhotoBrowserToUnstageAllImages
{
  BOOL v3 = +[CKBalloonPluginManager sharedInstance];
  id v12 = [v3 existingPhotoBrowserViewController];

  id v4 = [(CKChatInputController *)self entryView];
  uint64_t v5 = [v4 composition];

  id v6 = [v5 shelfPluginPayload];
  int v7 = [v6 pluginBundleID];
  if (v12) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8 && [v7 isEqualToString:*MEMORY[0x1E4F6CBF8]])
  {
    id v9 = v12;
LABEL_10:
    if (objc_opt_respondsToSelector()) {
      [v9 clearAllStagedPluginPackages];
    }
    goto LABEL_12;
  }
  IMBalloonExtensionIDWithSuffix();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqualToString:v9])
  {
    id v10 = [v6 photoShelfViewController];

    if (!v10) {
      goto LABEL_13;
    }
    id v11 = +[CKBalloonPluginManager sharedInstance];
    id v9 = [v11 viewControllerForPluginIdentifier:v7];

    goto LABEL_10;
  }
LABEL_12:

LABEL_13:
}

- (void)prepareForSuspend
{
  BOOL v3 = +[CKPluginExtensionStateObserver sharedInstance];
  int v4 = [v3 passKitUIPresented];

  if (v4)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    __int16 v14 = 0;
    id v6 = "prepareForSuspend not doing suspend work as we are suspending due to passkit UI";
    int v7 = (uint8_t *)&v14;
LABEL_9:
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
LABEL_10:

    return;
  }
  BOOL v8 = +[CKPluginExtensionStateObserver sharedInstance];
  int v9 = [v8 iTunesStoreDialogPresented];

  if (v9)
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_10;
    }
    __int16 v13 = 0;
    id v6 = "prepareForSuspend not doing suspend work as we are suspending due to iTunesStore UI";
    int v7 = (uint8_t *)&v13;
    goto LABEL_9;
  }
  id v10 = [(CKBrowserSwitcherViewController *)self->_browserSwitcher transitionCoordinator];
  [v10 dismissCurrentFullScreenModalAnimated:0 completion:0];

  id v11 = [(CKBrowserSwitcherViewController *)self->_browserSwitcher transitionCoordinator];
  [v11 dismissCurrentExpandedBrowserAnimated:0 completion:0];

  [(CKChatInputController *)self dismiss];
  [(CKChatInputController *)self dismissBrowserViewController];
  id v12 = [(CKChatInputController *)self currentInputViewController];
  [v12 setViewController:0];

  [(CKChatInputController *)self setBrowserSwitcher:0];

  [(CKChatInputController *)self setSwitcherInputViewController:0];
}

- (void)applicationWillAddDeactivationReasonNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKChatInputController *)self browserPlugin];
  if (v5)
  {
    id v6 = (void *)v5;
    int v7 = CKIsRunningInMacCatalyst();

    if (!v7)
    {
      BOOL v8 = [v4 userInfo];
      int v9 = [v8 objectForKey:*MEMORY[0x1E4F43F58]];
      int v10 = [v9 longLongValue];

      if (v10 == 11)
      {
        id v11 = +[CKPluginExtensionStateObserver sharedInstance];
        int v12 = [v11 passKitUIPresented];

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            __int16 v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              __int16 v19 = 0;
              __int16 v14 = "prepareForSuspend not doing suspend work as we are suspending due to passkit UI";
              int v15 = (uint8_t *)&v19;
LABEL_12:
              _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, v14, v15, 2u);
              goto LABEL_13;
            }
            goto LABEL_13;
          }
        }
        else
        {
          objc_super v16 = +[CKPluginExtensionStateObserver sharedInstance];
          int v17 = [v16 iTunesStoreDialogPresented];

          if (!v17)
          {
            [(CKChatInputController *)self setShouldRestoreAppSwitcher:0];
            [(CKChatInputController *)self dismiss];
            goto LABEL_15;
          }
          if (IMOSLoggingEnabled())
          {
            __int16 v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              __int16 v18 = 0;
              __int16 v14 = "prepareForSuspend not doing suspend work as we are suspending due to iTunesStore UI";
              int v15 = (uint8_t *)&v18;
              goto LABEL_12;
            }
LABEL_13:
          }
        }
      }
    }
  }
LABEL_15:
}

- (void)chatControllerReceivedKeyboardWillHideNotification:(id)a3
{
  id v4 = [(CKChatInputController *)self entryView];
  [v4 beginDeferringEntryFieldCollapsedStateChanges];

  [(CKChatInputController *)self setKeyboardIsHiding:1];

  [(CKChatInputController *)self stickerPickerWasHidden];
}

- (void)chatControllerReceivedKeyboardDidHideNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "keyboardDidHide: called", v8, 2u);
    }
  }
  [(CKChatInputController *)self setKeyboardIsHiding:0];
  [(CKChatInputController *)self setKeyboardIsVisible:0];
  id v6 = [(CKChatInputController *)self orientationManager];
  [v6 endListeningForOrientationEventsWithKey:@"KeyboardVisible"];

  int v7 = [(CKChatInputController *)self entryView];
  [v7 endDeferringEntryFieldCollapsedStateChanges];
}

- (void)chatControllerReceivedKeyboardWillShowNotification:(id)a3
{
  id v3 = [(CKChatInputController *)self orientationManager];
  [v3 beginListeningForOrientationEventsWithKey:@"KeyboardVisible"];
}

- (void)chatControllerReceivedKeyboardDidShowNotification:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "keyboardDidShow: called", buf, 2u);
    }
  }
  [(CKChatInputController *)self setKeyboardIsVisible:1];
  id v6 = [(CKChatInputController *)self appCardPresentationOverseer];
  if ([v6 isPresentingCard]
    && ([v6 isPresentingInSendMenuPopover] & 1) == 0
    && ([v6 isExpanded] & 1) == 0
    && [(CKChatInputController *)self isEntryViewFirstResponder])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __75__CKChatInputController_chatControllerReceivedKeyboardDidShowNotification___block_invoke;
    v7[3] = &unk_1E5620C40;
    id v8 = v6;
    [v8 fadeOutCardWithCompletion:v7];
  }
}

uint64_t __75__CKChatInputController_chatControllerReceivedKeyboardDidShowNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissCardAnimated:0 overrideExceptions:1 completion:&__block_literal_global_178_0];
}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  if (!CKIsRunningInMacCatalyst())
  {
    [(CKChatInputController *)self setBrowserPlugin:0];
    [(CKChatInputController *)self setBrowserPluginDataSource:0];
    [(CKChatInputController *)self dismissBrowserViewController];
  }
}

- (BOOL)isHandwritingLandscape
{
  uint64_t v2 = [(CKChatInputController *)self handwritingPresentationController];
  char v3 = [v2 isHandwritingLandscape];

  return v3;
}

- (void)setBrowserPlugin:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (IMBalloonPlugin *)a3;
  browserPlugin = self->_browserPlugin;
  p_browserPlugin = &self->_browserPlugin;
  if (browserPlugin != v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = [(IMBalloonPlugin *)*p_browserPlugin identifier];
        int v10 = [(IMBalloonPlugin *)v5 identifier];
        int v11 = 138412546;
        id v12 = v9;
        __int16 v13 = 2112;
        __int16 v14 = v10;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "CKChatInputController browserPlugin changing from %@ to %@", (uint8_t *)&v11, 0x16u);
      }
    }
    objc_storeStrong((id *)p_browserPlugin, a3);
  }
}

- (void)setInputViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  uint64_t v6 = [v5 isAccessibilityPreferredContentSizeCategory] ^ 1;

  [(CKChatInputController *)self setInputViewVisible:v3 entryFieldCollapsed:v6 animated:1];
}

- (void)setInputViewVisible:(BOOL)a3 entryFieldCollapsed:(BOOL)a4 animated:(BOOL)a5
{
}

- (void)setInputViewVisible:(BOOL)a3 entryFieldCollapsed:(BOOL)a4 animated:(BOOL)a5 messageDelegate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  int v11 = [(CKChatInputController *)self delegate];
  int v12 = [v11 keyboardIsVisibleForChatInputController:self];

  if (self->_inputViewVisible != v9 || v9 & ~v12)
  {
    self->_inputViewVisible = v9;
    if (v6)
    {
      __int16 v14 = [(CKChatInputController *)self delegate];
      [v14 chatInputDidUpdateInputViewShowingBrowser:v9 entryFieldCollapsed:v8 animated:v7];
    }
    uint64_t v15 = [(CKChatInputController *)self entryView];
    [v15 setNeedsLayout];

    if (!v9)
    {
      id v16 = +[CKBalloonPluginManager sharedInstance];
      [v16 commitInteractionTimeOrderingChanges];
    }
  }
}

- (void)setCurrentInputViewController:(id)a3
{
  uint64_t v5 = (CKKeyboardContentViewController *)a3;
  if (self->_currentInputViewController != v5)
  {
    BOOL v8 = v5;
    objc_storeStrong((id *)&self->_currentInputViewController, a3);
    BOOL v6 = [(CKChatInputController *)self isInputViewVisible];
    uint64_t v5 = v8;
    if (v6)
    {
      BOOL v7 = [(CKChatInputController *)self delegate];
      [v7 chatInputDidUpdateWithNewInputViewController:self->_currentInputViewController];

      uint64_t v5 = v8;
    }
  }
}

- (CKBrowserSwitcherViewController)browserSwitcher
{
  browserSwitcher = self->_browserSwitcher;
  if (!browserSwitcher)
  {
    id v4 = [CKBrowserSwitcherViewController alloc];
    uint64_t v5 = [(CKChatInputController *)self targetConversation];
    BOOL v6 = [(CKChatInputController *)self delegate];
    BOOL v7 = [v6 viewControllerForChatInputModalPresentation];
    BOOL v8 = [(CKBrowserSwitcherViewController *)v4 initWithConversation:v5 sendDelegate:self presentingViewController:v7];
    BOOL v9 = self->_browserSwitcher;
    self->_browserSwitcher = v8;

    [(CKBrowserSwitcherViewController *)self->_browserSwitcher setDelegate:self];
    browserSwitcher = self->_browserSwitcher;
  }

  return browserSwitcher;
}

- (CKAppCardPresentationOverseer)appCardPresentationOverseer
{
  appCardPresentationOverseer = self->_appCardPresentationOverseer;
  if (!appCardPresentationOverseer)
  {
    id v4 = [CKAppCardPresentationOverseer alloc];
    uint64_t v5 = [(CKChatInputController *)self delegate];
    BOOL v6 = [v5 viewControllerForChatInputModalPresentation];
    BOOL v7 = [(CKAppCardPresentationOverseer *)v4 initWithPresentingViewController:v6 sendDelegate:self];
    BOOL v8 = self->_appCardPresentationOverseer;
    self->_appCardPresentationOverseer = v7;

    [(CKAppCardPresentationOverseer *)self->_appCardPresentationOverseer setDelegate:self];
    appCardPresentationOverseer = self->_appCardPresentationOverseer;
  }

  return appCardPresentationOverseer;
}

- (CKKeyboardContentViewController)switcherInputViewController
{
  switcherInputViewController = self->_switcherInputViewController;
  if (!switcherInputViewController
    || ([(CKKeyboardContentViewController *)switcherInputViewController viewController],
        id v4 = (CKBrowserSwitcherViewController *)objc_claimAutoreleasedReturnValue(),
        browserSwitcher = self->_browserSwitcher,
        v4,
        v4 != browserSwitcher))
  {
    BOOL v6 = [CKKeyboardContentViewController alloc];
    BOOL v7 = [(CKChatInputController *)self browserSwitcher];
    BOOL v8 = [(CKKeyboardContentViewController *)v6 initWithViewController:v7 identifier:@"Switcher"];
    BOOL v9 = self->_switcherInputViewController;
    self->_switcherInputViewController = v8;

    int v10 = [(CKKeyboardContentViewController *)self->_switcherInputViewController view];
    [v10 intrinsicContentSize];
  }
  int v11 = self->_switcherInputViewController;

  return v11;
}

- (UITextInputPayloadController)textInputPayloadController
{
  textInputPayloadController = self->_textInputPayloadController;
  if (!textInputPayloadController)
  {
    id v4 = [MEMORY[0x1E4F42F20] sharedInstance];
    uint64_t v5 = self->_textInputPayloadController;
    self->_textInputPayloadController = v4;

    textInputPayloadController = self->_textInputPayloadController;
  }

  return textInputPayloadController;
}

- (CKConversation)targetConversation
{
  BOOL v3 = [(CKChatInputController *)self delegate];
  id v4 = [v3 targetConversationForChatInputController:self];

  return (CKConversation *)v4;
}

- (BOOL)_isiMessageConversation
{
  uint64_t v2 = [(CKChatInputController *)self targetConversation];
  BOOL v3 = [v2 sendingService];
  char v4 = objc_msgSend(v3, "__ck_isiMessage");

  return v4;
}

- (BOOL)_isBusinessConversation
{
  uint64_t v2 = [(CKChatInputController *)self targetConversation];
  char v3 = [v2 isBusinessConversation];

  return v3;
}

- (BOOL)hasStickerReactionSession
{
  uint64_t v2 = [(CKChatInputController *)self stickerReactionSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)beginStickerReactionSessionWithChatItem:(id)a3 cell:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [CKStickerReactionSession alloc];
  id v10 = [(CKChatInputController *)self targetConversation];
  BOOL v9 = [(CKStickerReactionSession *)v8 initWithConversation:v10 chatItem:v7 cell:v6];

  [(CKChatInputController *)self setStickerReactionSession:v9];
}

- (void)endStickerReactionSession
{
  [(CKChatInputController *)self setStickerReactionSession:0];

  [(CKChatInputController *)self setCurrentPresentationConfig:0];
}

- (void)presentSendMenuForAppCardOverseerWithAppCardViewController:(id)a3 presentationStyle:(unint64_t)a4
{
}

- (BOOL)shouldPresentAppCardInSendMenuWithTraitCollection:(id)a3
{
  return [(CKChatInputController *)self determineSendMenuPresentationStyleCompatibleWithTraitCollection:a3] == 1;
}

- (id)activeSendMenuPresentationForAppCardOverseer
{
  BOOL v3 = [(CKChatInputController *)self delegate];
  char v4 = [v3 activeSendMenuPresentationForChatInputController:self];

  return v4;
}

- (void)appCardOverseerDidDismissAppCard
{
  self->_isAppCardDismissing = 0;
  [(CKChatInputController *)self browserWillDismiss];
  [(CKChatInputController *)self setIsDismissingAppCardForKeyboardPresentation:0];
  if (![(CKChatInputController *)self hasStickerReactionSession])
  {
    BOOL v3 = [(CKChatInputController *)self delegate];
    [v3 updateActiveEntryViewPositioningGuide];
  }
  char v4 = [(CKChatInputController *)self delegate];
  [v4 appCardDidDismiss];

  self->_isAppCardDraggingBelowKeyboardDetent = 0;
}

- (void)appCardOverseerWillDismissAppCard
{
  self->_isAppCardDismissing = 1;
  if (![(CKChatInputController *)self hasStickerReactionSession])
  {
    id v3 = [(CKChatInputController *)self delegate];
    [v3 updateActiveEntryViewPositioningGuide];
  }
}

- (void)appCardDidMoveToWindow:(id)a3
{
  id v3 = [(CKChatInputController *)self delegate];
  [v3 enforceSendMenuOrderingInWindowSubviews];
}

- (void)appCardOverseerWillPresentAppCard
{
  self->_isAppCardAppearing = 1;
  id v2 = [(CKChatInputController *)self delegate];
  [v2 updateActiveEntryViewPositioningGuide];
}

- (void)appCardOverseerDidPresentAppCard
{
  self->_isAppCardAppearing = 0;
  [(CKChatInputController *)self _informDelegateOfUpdatedAppCardHeightAnimated:1];
  id v3 = [(CKChatInputController *)self delegate];
  [v3 updateActiveEntryViewPositioningGuide];
}

- (void)appCardOverseerCardDidChangeHeight:(double)a3 isBelowKeyboardDetent:(BOOL)a4 isDragging:(BOOL)a5 isGeneratingEndOfDragAnimations:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  if (a5) {
    self->_isAppCardDraggingBelowKeyboardDetent = a4;
  }
  if (a4 && ![(CKChatInputController *)self preventResignFirstResponder])
  {
    id v10 = [(CKChatInputController *)self delegate];
    [v10 appCardDidChangeEntryViewAlignmentHeight:!v7 | v6 animated:a3];
  }
}

- (double)appCardOverseerCompactHeightExcludingSafeArea
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 keyboardSizeDeterminesAppCardDetentHeight];

  if (v4)
  {
    uint64_t v5 = CKNonFlatDeviceOrientation();
    BOOL v6 = [(CKChatInputController *)self entryView];
    BOOL v7 = [v6 contentView];
    BOOL v8 = [v7 textView];

    [MEMORY[0x1E4F42B08] sizeForInterfaceOrientation:v5 inputDelegate:v8];
    double v10 = v9;
    int v11 = [(CKChatInputController *)self delegate];
    int v12 = [v11 viewControllerForChatInputModalPresentation];

    __int16 v13 = [v12 view];
    [v13 safeAreaInsets];
    double v15 = v14;

    double v16 = v10 - v15;
    if (IMOSLoggingEnabled())
    {
      int v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v26 = 134217984;
        double v27 = v16;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "ChatInputController resolved compact app card height %.2f", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  else
  {
    __int16 v18 = [(CKChatInputController *)self delegate];
    __int16 v19 = [v18 viewControllerForChatInputModalPresentation];

    id v20 = [v19 view];
    [v20 frame];
    double v22 = v21;

    uint64_t v23 = [v19 traitCollection];
    [v23 displayScale];
    double v16 = round(v22 * 0.4 * v24) / v24;
  }
  return v16;
}

- (void)appCardOverseerDidRecognizeTouchTracker
{
}

- (void)appCardOverseerViewStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKChatInputController *)self delegate];
  [v4 appCardViewStateDidChange:v3];
}

- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Hiding entry view", v10, 2u);
    }
  }
  BOOL v8 = [(CKChatInputController *)self entryView];
  [v8 setHidden:1];

  if (!a4)
  {
    [(CKChatInputController *)self setInCollapseOrExpandAnimation:1];
    double v9 = [(CKChatInputController *)self delegate];
    [v9 chatInputControllerWillTransitionExpanded:self];
    goto LABEL_9;
  }
  if (a4 == 2)
  {
    double v9 = [(CKChatInputController *)self delegate];
    [v9 chatInputControllerWillPresentModalBrowserViewController:self];
LABEL_9:
  }
}

- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  id v6 = [(CKChatInputController *)self entryView];
  [v6 setHidden:0];

  if (a4)
  {
    if (a4 != 2) {
      goto LABEL_6;
    }
    BOOL v7 = [(CKChatInputController *)self delegate];
    [v7 chatInputControllerDidPresentModalBrowserViewController:self];
  }
  else
  {
    [(CKChatInputController *)self setInCollapseOrExpandAnimation:0];
    BOOL v7 = [(CKChatInputController *)self delegate];
    [v7 chatInputControllerDidTransitionExpanded:self];
  }

LABEL_6:
  BOOL v8 = [(CKChatInputController *)self browserPlugin];
  id v9 = [v8 identifier];

  [(CKChatInputController *)self adjustSupportedInterfaceOrientationForPluginID:v9 requiredPortrait:0];
}

- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  if (a4 != 5)
  {
    [(CKChatInputController *)self _reconfigurePluginDataSourceWithBalloonControllerIfNecessary];
    if (a4 == 3)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke_2;
      v9[3] = &unk_1E5620C40;
      v9[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v9];
      BOOL v7 = [(CKChatInputController *)self delegate];
      [v7 chatInputControllerWillDismissModalBrowserViewController:self];
    }
    else
    {
      if (a4 != 1)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke_3;
        v8[3] = &unk_1E5620C40;
        v8[4] = self;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v8];
        goto LABEL_8;
      }
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke;
      v10[3] = &unk_1E5620C40;
      v10[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v10];
      BOOL v7 = [(CKChatInputController *)self delegate];
      [v7 chatInputControllerWillTransitionCollapsed:self];
    }
  }
LABEL_8:
}

uint64_t __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInCollapseOrExpandAnimation:1];
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 switcherInputViewController];
  [v2 setCurrentInputViewController:v3];

  id v4 = [*(id *)(a1 + 32) entryView];
  uint64_t v5 = [v4 contentView];
  id v6 = [v5 pluginEntryViewController];
  BOOL v7 = v6 == 0;

  BOOL v8 = *(void **)(a1 + 32);

  return [v8 setInputViewVisible:1 entryFieldCollapsed:v7 animated:1];
}

uint64_t __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentInputViewController:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 setInputViewVisible:1 entryFieldCollapsed:0 animated:0];
}

uint64_t __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke_3(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 switcherInputViewController];
  [v2 setCurrentInputViewController:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 setInputViewVisible:1 entryFieldCollapsed:1 animated:0];
}

- (void)_reconfigurePluginDataSourceWithBalloonControllerIfNecessary
{
  if ([(CKChatInputController *)self currentPluginIsDT])
  {
    id v8 = [(CKChatInputController *)self browserPluginDataSource];
    BOOL v3 = [(CKChatInputController *)self delegate];
    id v4 = [v3 chatInputTranscriptIdentifier];

    uint64_t v5 = [(CKChatInputController *)self browserPlugin];
    id v6 = [v8 messageGUID];
    BOOL v7 = [v5 existingBalloonControllerWithMessageGUID:v6 contextIdentifier:v4];

    [v7 setDataSource:v8];
    [(CKChatInputController *)self setBrowserPluginDataSource:0];
  }
}

- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(CKChatInputController *)self setInCollapseOrExpandAnimation:0];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__CKChatInputController_browserTransitionCoordinatorDidCollapseOrDismiss_withReason___block_invoke;
    block[3] = &unk_1E5620C40;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if (a4 == 3)
  {
    BOOL v7 = [(CKChatInputController *)self delegate];
    [v7 chatInputControllerDidDismissModalBrowserViewController:self];

    [(CKChatInputController *)self setBrowserPlugin:0];
    [(CKChatInputController *)self setInputViewVisible:0];
    [(CKChatInputController *)self setBrowserSwitcher:0];
    [(CKChatInputController *)self setCurrentInputViewController:0];
    [(CKChatInputController *)self setSwitcherInputViewController:0];
  }
}

void __85__CKChatInputController_browserTransitionCoordinatorDidCollapseOrDismiss_withReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 chatInputControllerDidTransitionCollapsed:*(void *)(a1 + 32)];
}

- (id)appTitleOverride
{
  id v2 = [(CKChatInputController *)self targetConversation];
  if ([v2 isBusinessConversation])
  {
    BOOL v3 = [v2 chat];
    id v4 = [v3 recipient];
    uint64_t v5 = [v4 name];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)appIconOverride
{
  id v2 = [(CKChatInputController *)self targetConversation];
  if ([v2 isBusinessConversation])
  {
    BOOL v3 = [v2 chat];
    id v4 = [v3 recipient];

    uint64_t v5 = (void *)MEMORY[0x1E4F42A80];
    id v6 = [v4 brandSquareLogoImageData];
    BOOL v7 = [MEMORY[0x1E4F42D90] mainScreen];
    [v7 scale];
    id v8 = objc_msgSend(v5, "imageWithData:scale:", v6);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)switcherViewControllerWillAppear:(id)a3
{
  id v4 = [a3 balloonPlugin];
  id v5 = [v4 identifier];

  [(CKChatInputController *)self adjustSupportedInterfaceOrientationForPluginID:v5 requiredPortrait:0];
}

- (void)switcherViewControllerWillDisappear:(id)a3
{
  id v3 = [(CKChatInputController *)self delegate];
  [v3 stopForcingOrientation];
}

- (void)switcherViewControllerDidFinishSwitching:(id)a3 toViewController:(id)a4
{
}

- (void)setConversationAndRecipientsForBrowser:(id)a3
{
  id v16 = a3;
  BOOL v4 = [(CKChatInputController *)self appManagerIsDisplayed];
  id v5 = v16;
  if (v16 && !v4)
  {
    id v6 = [(CKChatInputController *)self targetConversation];
    if (objc_opt_respondsToSelector())
    {
      BOOL v7 = [v6 senderIdentifier];
      [v16 setSender:v7];
    }
    if (objc_opt_respondsToSelector())
    {
      id v8 = [v6 recipientStrings];
      [v16 setRecipients:v8];
    }
    if (objc_opt_respondsToSelector())
    {
      id v9 = [(CKChatInputController *)self delegate];
      double v10 = [v9 generatedSummary];
      [v16 setGeneratedSummary:v10];
    }
    if (objc_opt_respondsToSelector())
    {
      int v11 = [(CKChatInputController *)self delegate];
      int v12 = [v11 generativeContext];
      [v16 setGenerativeContext:v12];
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v16, "setIsiMessage:", -[CKChatInputController _isiMessageConversation](self, "_isiMessageConversation"));
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v16, "setIsBusiness:", -[CKChatInputController _isBusinessConversation](self, "_isBusinessConversation"));
    }
    if (objc_opt_respondsToSelector())
    {
      __int16 v13 = [v6 chat];
      double v14 = [v13 guid];
      [v16 setConversationID:v14];
    }
    double v15 = [v16 balloonPlugin];
    [(CKChatInputController *)self setBrowserPlugin:v15];

    id v5 = v16;
  }
}

- (void)switcherViewControllerDidCollapse:(id)a3
{
  BOOL v4 = [(CKChatInputController *)self switcherInputViewController];
  [(CKChatInputController *)self setCurrentInputViewController:v4];

  [(CKChatInputController *)self setInputViewVisible:1];
}

- (void)switcherViewControllerDidSelectAppStore:(id)a3 shouldRestoreAppSwitcher:(BOOL)a4
{
  [(CKChatInputController *)self setShouldRestoreAppSwitcher:a4];
  [(CKChatInputController *)self presentAppStoreForAdamID:0];
  id v5 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v5 trackEvent:*MEMORY[0x1E4F6D760]];
}

- (void)switcherViewControllerDidSelectAppManager:(id)a3 shouldRestoreAppSwitcher:(BOOL)a4
{
  [(CKChatInputController *)self setShouldRestoreAppSwitcher:a4];

  [(CKChatInputController *)self presentAppManager];
}

- (void)switcherViewController:(id)a3 didSelectPluginAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CKChatInputController *)self entryView];
  [v6 selectPluginAtIndexPath:v5];
}

- (void)switcherViewController:(id)a3 hasUpdatedLastTouchDate:(id)a4
{
}

- (void)switcherViewController:(id)a3 willPresentBrowserModally:(id)a4
{
}

- (void)_launchAppExtensionForDebugging
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.MobileSMS.CKAppExtension.launch", 0);
  BOOL v4 = CKAppExtensionDevelopmentTargetBundle();
  if ([v4 length])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [MEMORY[0x1E4F6BC18] sharedInstance];
    id v6 = [v5 allPlugins];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v12 = [v11 identifier];
          char v13 = [v12 containsString:v4];

          if (v13) {
            break;
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      id v14 = v11;

      if (!v14) {
        goto LABEL_14;
      }
      [(CKChatInputController *)self showBrowserForPlugin:v14 dataSource:0 style:0];
      double v15 = [(CKChatInputController *)self browserSwitcher];
      [v15 showPlugin:v14];

      id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 removeObserver:self name:*MEMORY[0x1E4F6B878] object:0];
    }
    else
    {
LABEL_11:

LABEL_14:
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__CKChatInputController__launchAppExtensionForDebugging__block_invoke;
      block[3] = &unk_1E5620C40;
      void block[4] = self;
      if (_launchAppExtensionForDebugging_onceToken != -1) {
        dispatch_once(&_launchAppExtensionForDebugging_onceToken, block);
      }
    }
  }
}

void __56__CKChatInputController__launchAppExtensionForDebugging__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__launchAppExtensionForDebugging name:*MEMORY[0x1E4F6B878] object:0];
}

- (void)_setupObserverForLaunchAppExtensionForDebugging
{
  CKAppExtensionDevelopmentTargetBundle();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ([v4 length])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_LaunchAppExtensionForDebuggingNotificationHandler, @"com.apple.MobileSMS.CKAppExtension.launch", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)launchAndShowBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5
{
}

- (void)launchAndShowBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6
{
  id v19 = a3;
  id v10 = a4;
  id v11 = a6;
  int v12 = +[CKBalloonPluginManager sharedInstance];
  char v13 = [v19 identifier];
  char v14 = [v12 isPluginEnabled:v13];

  if ((v14 & 1) == 0)
  {
    double v15 = [v19 identifier];
    [v12 setEnabled:1 forPlugin:v15];
  }
  id v16 = [v12 visibleDrawerPlugins];
  char v17 = [v16 containsObject:v19];

  if ((v17 & 1) == 0)
  {
    long long v18 = [v19 identifier];
    [v12 updateInteractionTimeForPlugin:v18];

    [v12 commitInteractionTimeOrderingChanges];
  }
  [(CKChatInputController *)self showBrowserForPlugin:v19 dataSource:v10 style:a5 presentationConfiguration:v11];
}

- (void)showBrowserPopoverForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6
{
  id v33 = a3;
  id v10 = a4;
  id v11 = a6;
  int v12 = (objc_class *)[v33 browserClass];
  if (a5 > 1)
  {
    _IMLog();
  }
  else
  {
    char v13 = (void *)[[v12 alloc] initWithBalloonPlugin:v33 dataSource:v10];
    char v14 = [v33 identifier];
    double v15 = IMBalloonExtensionIDWithSuffix();
    char v16 = [v14 isEqualToString:v15];

    if (v16)
    {
      double v17 = 380.0;
      double v18 = 280.0;
    }
    else
    {
      id v19 = [v33 identifier];
      long long v20 = IMBalloonExtensionIDWithSuffix();
      int v21 = [v19 isEqualToString:v20];

      if (v21)
      {
        double v22 = +[CKUIBehavior sharedBehaviors];
        [v22 stickerPopoverSize];
        double v18 = v23;
        double v17 = v24;
      }
      else
      {
        double v17 = 480.0;
        double v18 = 320.0;
      }
    }
    objc_msgSend(v13, "setPreferredContentSize:", v18, v17);
    id v25 = objc_alloc_init(CKBrowserTransitionCoordinator);
    int v26 = [(CKChatInputController *)self targetConversation];
    [(CKBrowserTransitionCoordinator *)v25 setConversation:v26];

    [(CKBrowserTransitionCoordinator *)v25 updateBrowser:v13];
    double v27 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v28 = [v27 isScheduledMessagesCoreEnabled];

    if (v28)
    {
      char v29 = [(CKChatInputController *)self pluginContextForPlugin:v33];
      uint64_t v30 = [v33 identifier];
      int v31 = [v30 isEqual:*MEMORY[0x1E4F6CC20]];

      if (v31)
      {
        if (objc_opt_respondsToSelector()) {
          [v13 performSelector:sel_setPluginContext_ withObject:v29];
        }
        if (v29)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v32 = [(CKChatInputController *)self entryView];
            [v32 setSendLaterPluginInfo:v29 animated:1];
          }
        }
      }
    }
    [(CKChatInputController *)self showExpandedBrowserPopover:v13 presentationConfiguration:v11];
  }
}

- (void)showExpandedBrowserPopover:(id)a3 presentationConfiguration:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v6)
  {
    [v14 setSendDelegate:self];
    if (objc_opt_respondsToSelector()) {
      [v14 setCurrentBrowserConsumer:2];
    }
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v14, "setShouldDisableSnapshotView:", objc_msgSend(v6, "shouldDisableSnapshotView"));
    }
    [v14 setModalPresentationStyle:7];
    uint64_t v7 = [(CKChatInputController *)self delegate];
    uint64_t v8 = [v7 viewControllerForChatInputModalPresentation];
    [v8 presentViewController:v14 animated:1 completion:0];

    uint64_t v9 = [v6 sourceView];
    id v10 = [v14 popoverPresentationController];
    [v10 setSourceView:v9];

    uint64_t v11 = [v6 permittedArrowDirections];
    int v12 = [v14 popoverPresentationController];
    [v12 setPermittedArrowDirections:v11];

    char v13 = [v14 popoverPresentationController];
    [v13 setDelegate:self];
  }
  else
  {
    _IMLog();
  }
}

- (void)showBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5
{
}

- (BOOL)isShowingAppCardForExtensionIdentifier:(id)a3
{
  id v4 = a3;
  if (CKIsAppCardsEnabled()
    && ([(CKChatInputController *)self appCardPresentationOverseer],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isPresentingCard],
        v5,
        v6))
  {
    uint64_t v7 = [(CKChatInputController *)self browserPlugin];
    uint64_t v8 = [v7 extensionIdentifier];

    char v9 = [v8 isEqualToString:v4];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)showBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  char v13 = [v10 appBundle];
  id v14 = [v13 bundleIdentifier];
  BOOL v15 = [(CKChatInputController *)self shouldPreventAppFromDisplayingForBundleIdentifier:v14];

  if (!v15)
  {
    id v19 = [v10 identifier];
    int v20 = [v19 isEqualToString:*MEMORY[0x1E4F6CC20]];

    int v21 = [(CKChatInputController *)self entryView];
    double v22 = [v21 composition];
    double v59 = [v22 shelfPluginPayload];

    if (v59)
    {
      char v23 = [v59 supportsSendLater];
      if (v20)
      {
        if ((v23 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            double v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              id v25 = [v59 pluginBundleID];
              *(_DWORD *)buf = 138412290;
              v61 = v25;
              _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "showBrowserForPlugin: User selected send later, but the currently staged plugin payload (%@) does not allow presentation alongside Send Later. Presenting unsupported item alert and aborting.", buf, 0xCu);
            }
          }
          int v26 = [v59 pluginBundleID];
          [(CKChatInputController *)self _presentSendLaterUnsupportedAlertForIdentifier:v26 handler:0];

          goto LABEL_53;
        }
      }
    }
    double v27 = v11;
    int v28 = self;
    if (v12)
    {
      id v29 = v12;
    }
    else
    {
      [(CKChatInputController *)self setStickerPickerMessagePartChatItem:0];
      [(CKChatInputController *)self setStickerPickerMessagePartParentChatItem:0];
      int v28 = self;
      id v29 = 0;
    }
    [(CKChatInputController *)v28 setCurrentPresentationConfig:v29];
    if (CKIsAppCardsEnabled())
    {
      uint64_t v30 = [(CKChatInputController *)self browserPlugin];
      int v31 = [v30 identifier];
      double v32 = [v10 identifier];
      if ([v31 isEqualToString:v32])
      {
        id v33 = [(CKChatInputController *)self appCardPresentationOverseer];
        int v34 = [v33 isPresentingCard];

        if (v34)
        {
          id v11 = v27;
          if (IMOSLoggingEnabled())
          {
            double v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              double v36 = [v10 identifier];
              *(_DWORD *)buf = 138412290;
              v61 = v36;
              _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "presentModernCardForPlugin identifier is already the current plugin: %@. Doing nothing.", buf, 0xCu);
            }
          }
          int v37 = [(CKChatInputController *)self browserPluginDataSource];
          if (v37 == v27)
          {
          }
          else
          {
            double v38 = [(CKChatInputController *)self appCardPresentationOverseer];
            int v39 = [v38 updateCurrentBrowserWithDataSource:v27];

            if (v39)
            {
              double v40 = [(CKChatInputController *)self appCardPresentationOverseer];
              [v40 requestPresentationStyle:a5 animated:1];

              [(CKChatInputController *)self setBrowserPluginDataSource:v27];
            }
          }
          goto LABEL_53;
        }
      }
      else
      {
      }
    }
    if (a5 == 2)
    {
      id v11 = v27;
      [(CKChatInputController *)self _presentFullScreenModalBrowserForPlugin:v10 dataSource:v27];
LABEL_53:

      goto LABEL_54;
    }
    [(CKChatInputController *)self setBrowserPlugin:v10];
    [(CKChatInputController *)self setBrowserPluginDataSource:v27];
    double v41 = [(CKChatInputController *)self delegate];
    double v42 = [v41 viewControllerForChatInputModalPresentation];
    double v43 = [v42 traitCollection];
    double v44 = v27;

    int64_t v45 = [(CKChatInputController *)self determineSendMenuPresentationStyleCompatibleWithTraitCollection:v43];
    int v46 = CKIsRunningInMacCatalyst();
    BOOL v47 = v45 == 1 && v12 != 0;
    if (v46 || v47)
    {
      id v11 = v44;
      [(CKChatInputController *)self showBrowserPopoverForPlugin:v10 dataSource:v44 style:a5 presentationConfiguration:v12];
      goto LABEL_52;
    }
    id v11 = v44;
    if (CKIsAppCardsEnabled())
    {
      [(CKChatInputController *)self presentModernCardForPlugin:v10 dataSource:v44 presentationStyle:a5];
LABEL_52:

      goto LABEL_53;
    }
    if (a5)
    {
      if (a5 != 1) {
        goto LABEL_52;
      }
      CGFloat v48 = [(CKChatInputController *)self browserSwitcher];
      [v48 showBrowserFullscreenForPlugin:v10 datasource:v44];

      [(CKChatInputController *)self setCurrentInputViewController:0];
      double v49 = self;
      uint64_t v50 = 0;
LABEL_51:
      [(CKChatInputController *)v49 setInputViewVisible:v50];
      goto LABEL_52;
    }
    id v51 = [(CKChatInputController *)self browserSwitcher];
    [v51 showBrowserInSwitcherForPlugin:v10 datasource:v44 reloadData:0];

    CGFloat v52 = +[CKUIBehavior sharedBehaviors];
    if ([v52 canPresentOverKeyboard])
    {
      id v53 = [(CKChatInputController *)self delegate];
      if ([v53 keyboardIsVisibleForChatInputController:self])
      {
        BOOL v54 = [(CKChatInputController *)self isInputViewVisible];

        if (!v54)
        {
          buf[0] = 0;
          id v55 = [(CKChatInputController *)self delegate];
          id v11 = v44;
          +[CKInputView defaultContentSizeLargerThanKeyboard:buf];
          [v55 chatInputWillChangeHeightForCompactPresentation:v56];

          if (!buf[0])
          {
            uint64_t v57 = [(CKChatInputController *)self entryView];
            [v57 setNeedsLayout];
          }
          [(CKChatInputController *)self _presentCompactSwitcherOverKeyboardWithCompletion:0];
          goto LABEL_52;
        }
        goto LABEL_50;
      }
    }
LABEL_50:
    double v58 = [(CKChatInputController *)self switcherInputViewController];
    id v11 = v44;
    [(CKChatInputController *)self setCurrentInputViewController:v58];

    double v49 = self;
    uint64_t v50 = 1;
    goto LABEL_51;
  }
  [(CKChatInputController *)self dismissAndReloadInputViews:1];
  if (IMOSLoggingEnabled())
  {
    char v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      double v17 = [v10 appBundle];
      double v18 = [v17 bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      v61 = v18;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Dismissing App Browser: User attempted to open a plugin that is not allowed by App Limits with Bundle ID%@", buf, 0xCu);
    }
  }
LABEL_54:
}

- (void)_presentFullScreenModalBrowserForPlugin:(id)a3 dataSource:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CKChatInputController *)self browserPlugin];
  char v9 = [v6 identifier];
  id v10 = [v8 identifier];
  char v11 = [v9 isEqualToString:v10];

  [(CKChatInputController *)self setBrowserPlugin:v6];
  [(CKChatInputController *)self setBrowserPluginDataSource:v7];
  if (![(CKChatInputController *)self isAppCardPresented] || (v11 & 1) != 0)
  {
    char v16 = [v6 identifier];
    [(CKChatInputController *)self requestPresentationStyleFullScreenModalForPlugin:v16 dataSource:v7 skipValidation:1];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        char v13 = [v8 identifier];
        id v14 = [v6 identifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v22 = 2112;
        char v23 = v14;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "_presentFullScreenModalBrowserForPlugin: dismissing Send Menu presentation for outgoing plugin: %@, new plugin: %@", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    BOOL v15 = [(CKChatInputController *)self appCardPresentationOverseer];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__CKChatInputController__presentFullScreenModalBrowserForPlugin_dataSource___block_invoke;
    v17[3] = &unk_1E5622A90;
    objc_copyWeak(&v20, (id *)buf);
    id v18 = v6;
    id v19 = v7;
    [v15 dismissCardAnimated:1 completion:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

void __76__CKChatInputController__presentFullScreenModalBrowserForPlugin_dataSource___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [*(id *)(a1 + 32) identifier];
  [WeakRetained requestPresentationStyleFullScreenModalForPlugin:v2 dataSource:*(void *)(a1 + 40) skipValidation:1];
}

- (void)_presentSendLaterUnsupportedAlertForIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = CKFrameworkBundle();
  char v9 = [v8 localizedStringForKey:@"SHELF_SEND_LATER_UNSUPPORTED_ITEM_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v10 = CKFrameworkBundle();
  char v11 = [v10 localizedStringForKey:@"SHELF_SEND_LATER_UNSUPPORTED_ITEM" value:&stru_1EDE4CA38 table:@"ChatKit"];

  id v12 = IMBalloonExtensionIDWithSuffix();
  int v13 = [v7 isEqualToString:v12];

  if (v13)
  {
    id v14 = CKFrameworkBundle();
    uint64_t v15 = [v14 localizedStringForKey:@"SHELF_SEND_LATER_UNSUPPORTED_APPLE_CASH_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

    char v16 = CKFrameworkBundle();
    uint64_t v17 = [v16 localizedStringForKey:@"SHELF_SEND_LATER_UNSUPPORTED_APPLE_CASH" value:&stru_1EDE4CA38 table:@"ChatKit"];

    char v11 = (void *)v17;
    char v9 = (void *)v15;
  }
  id v18 = +[CKAlertController alertControllerWithTitle:v9 message:v11 preferredStyle:1];
  id v19 = CKFrameworkBundle();
  id v20 = [v19 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  int v26 = __80__CKChatInputController__presentSendLaterUnsupportedAlertForIdentifier_handler___block_invoke;
  double v27 = &unk_1E5628118;
  int v28 = self;
  id v29 = v6;
  id v21 = v6;
  __int16 v22 = +[CKAlertAction actionWithTitle:v20 style:0 handler:&v24];
  objc_msgSend(v18, "addAction:", v22, v24, v25, v26, v27, v28);

  [(CKChatInputController *)self setIsDisplayingReplaceCompositionAlert:1];
  char v23 = [(CKChatInputController *)self delegate];
  [v18 presentFromViewController:v23 animated:1 completion:0];
}

uint64_t __80__CKChatInputController__presentSendLaterUnsupportedAlertForIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  [*(id *)(a1 + 32) dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded];
  id v3 = *(void **)(a1 + 32);

  return [v3 setIsDisplayingReplaceCompositionAlert:0];
}

- (id)sendLaterPluginInfo
{
  id v3 = [(CKChatInputController *)self entryView];
  uint64_t v4 = [v3 sendLaterPluginInfo];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(CKChatInputController *)self entryView];
    id v7 = [v6 sendLaterPluginInfo];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v9 = [(CKChatInputController *)self entryView];
      uint64_t v10 = [v9 sendLaterPluginInfo];
      goto LABEL_6;
    }
  }
  else
  {
  }
  char v11 = [CKSendLaterPluginInfo alloc];
  char v9 = [(CKChatInputController *)self targetConversation];
  uint64_t v10 = [(CKSendLaterPluginInfo *)v11 initWithConversation:v9];
LABEL_6:
  id v12 = (void *)v10;

  return v12;
}

- (id)pluginContextForPlugin:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isScheduledMessagesCoreEnabled];

  if (v6
    && ([v4 identifier],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:*MEMORY[0x1E4F6CC20]],
        v7,
        v8))
  {
    char v9 = [(CKChatInputController *)self sendLaterPluginInfo];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "No pluginContext type known for plugin: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    char v9 = 0;
  }

  return v9;
}

- (void)presentModernCardForPlugin:(id)a3 dataSource:(id)a4 presentationStyle:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [(CKChatInputController *)self appCardPresentationOverseer];
  char v11 = [(CKChatInputController *)self pluginContextForPlugin:v9];
  int v12 = [v10 updateCurrentBrowserForPlugin:v9 dataSource:v8 pluginContext:v11];

  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [(CKChatInputController *)self entryView];
      [v13 setSendLaterPluginInfo:v11 animated:1];
    }
  }
  [(CKChatInputController *)self setConversationAndRecipientsForBrowser:v12];
  if ([v10 isPresentingInSendMenuPopover])
  {
    int v14 = 1;
  }
  else
  {
    uint64_t v15 = [(CKChatInputController *)self delegate];
    int v16 = [v15 isKeyboardVisible];

    if (v16) {
      [(CKChatInputController *)self setPreventResignFirstResponder:1];
    }
    int v14 = v16 ^ 1;
  }
  uint64_t v17 = [(CKChatInputController *)self appCardPresentationOverseer];
  unsigned int v18 = [v17 shouldAnimatePresentationForPresentationStyle:a5];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __81__CKChatInputController_presentModernCardForPlugin_dataSource_presentationStyle___block_invoke;
  v21[3] = &unk_1E5623DE8;
  id v19 = v10;
  id v22 = v19;
  char v23 = self;
  char v24 = v14 | v18;
  [v19 presentCardWithStyle:a5 animated:v14 | v18 completion:v21];
  if (v18)
  {
    [(CKChatInputController *)self setPreventResignFirstResponder:0];
    id v20 = [(CKChatInputController *)self delegate];
    [v20 dismissKeyboard];
  }
}

void __81__CKChatInputController_presentModernCardForPlugin_dataSource_presentationStyle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) appCardDismissPadding];
  objc_msgSend(*(id *)(a1 + 32), "setAppCardDismissPadding:");
  if (!*(unsigned char *)(a1 + 48))
  {
    [*(id *)(a1 + 40) setPreventResignFirstResponder:0];
    uint64_t v2 = [*(id *)(a1 + 40) delegate];
    [v2 dismissKeyboard];

    id v3 = [*(id *)(a1 + 40) appCardPresentationOverseer];
    char v4 = [v3 isExpanded];

    if ((v4 & 1) == 0)
    {
      [*(id *)(a1 + 40) _informDelegateOfUpdatedAppCardHeightAnimated:1];
      id v5 = [*(id *)(a1 + 40) delegate];
      [v5 updateActiveEntryViewPositioningGuide];
    }
  }
}

- (void)extensionRemoteConnectionWasInterrupted:(id)a3
{
  char v4 = [a3 userInfo];
  id v8 = [v4 _stringForKey:*MEMORY[0x1E4F6D340]];

  id v5 = IMStickersExtensionIdentifier();
  int v6 = IMBalloonExtensionIDWithSuffix();
  int v7 = [v8 isEqualToString:v6];

  if (v7) {
    [(CKChatInputController *)self dismissStickerPickerPreservingChatItem:0 completion:0];
  }
}

- (void)_informDelegateOfUpdatedAppCardHeightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CKChatInputController *)self delegate];
  [(CKChatInputController *)self _appCardHeightWithSafeArea];
  objc_msgSend(v5, "appCardDidChangeEntryViewAlignmentHeight:animated:", v3);
}

- (double)_appCardHeightWithSafeArea
{
  BOOL v3 = [(CKChatInputController *)self delegate];
  char v4 = [v3 viewControllerForChatInputModalPresentation];

  [(CKChatInputController *)self appCardOverseerCompactHeightExcludingSafeArea];
  double v6 = v5;
  int v7 = [v4 view];
  [v7 safeAreaInsets];
  double v9 = v6 + v8;

  return v9;
}

- (BOOL)isAppCardUsingSheetPresentation
{
  uint64_t v2 = [(CKChatInputController *)self appCardPresentationOverseer];
  char v3 = [v2 isPresentingInSheetController];

  return v3;
}

- (BOOL)isAppCardPresentationStyleExpanded
{
  uint64_t v2 = [(CKChatInputController *)self appCardPresentationOverseer];
  char v3 = [v2 isExpanded];

  return v3;
}

- (void)dismissBrowserViewController
{
  [(CKChatInputController *)self setDeferredPluginDataSource:0];

  [(CKChatInputController *)self _dismissBrowserViewControllerAndReloadInputViews:0];
}

- (void)_dismissBrowserViewControllerAndReloadInputViews:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(CKChatInputController *)self _deferredDismissToKeyboardAndFocusEntryView:v4];
}

- (void)showKeyboard
{
  if (!CKIsAppCardsEnabled()) {
    [(CKChatInputController *)self dismissBrowserViewController];
  }
  char v3 = [(CKChatInputController *)self entryView];
  id v4 = [v3 contentView];
  double v5 = [v4 textView];
  [v5 becomeFirstResponder];

  if (IMOSLoggingEnabled())
  {
    double v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v7 = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "showKeyboard called", v7, 2u);
    }
  }
}

- (BOOL)isEntryViewFirstResponder
{
  char v3 = [(CKChatInputController *)self entryView];
  id v4 = [v3 contentView];
  uint64_t v5 = [v4 subjectView];
  char v6 = [(id)v5 isFirstResponder];

  int v7 = [(CKChatInputController *)self entryView];
  double v8 = [v7 contentView];
  double v9 = [v8 textView];
  LOBYTE(v5) = [v9 isFirstResponder];

  return v6 | v5;
}

- (BOOL)currentPluginIsDT
{
  uint64_t v2 = [(CKChatInputController *)self browserPlugin];
  char v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CBA0]];

  return v4;
}

- (BOOL)currentPluginIsPhotos
{
  uint64_t v2 = [(CKChatInputController *)self browserPlugin];
  char v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CBF8]];

  return v4;
}

- (BOOL)currentPluginIsGenerativePlayground
{
  uint64_t v2 = [(CKChatInputController *)self browserPlugin];
  char v3 = [v2 identifier];
  char v4 = IMBalloonExtensionIDWithSuffix();
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (BOOL)switcherPluginCanMessageAPIOnBehalfOfPlugin:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKChatInputController *)self _isCombinedStickersApp]
    || ![v4 length]
    || ([(CKChatInputController *)self browserPlugin],
        char v5 = objc_claimAutoreleasedReturnValue(),
        [v5 identifier],
        char v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 isEqualToString:v4],
        v6,
        v5,
        (v7 & 1) != 0))
  {
    if (CKIsRunningInMacCatalyst()) {
      BOOL v8 = 1;
    }
    else {
      BOOL v8 = [(CKChatInputController *)self _switcherPluginCanMessageAPI];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = [(CKBrowserSwitcherViewController *)self->_browserSwitcher balloonPlugin];
        char v11 = [v10 identifier];
        int v13 = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        int v16 = v11;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Denying action for plugin %@ (the current plugin is %@)", (uint8_t *)&v13, 0x16u);
      }
    }
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_pluginCanMessageAPI:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = IMBalloonExtensionIDWithSuffix();
    char v5 = [v3 isEqualToString:v4];

    char v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v7 = [v6 isZelkovaEnabled];

    if (v7)
    {
      BOOL v8 = IMBalloonExtensionIDWithSuffix();
      char v9 = [v3 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
    char v10 = v5 | v9;
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)_isCombinedStickersApp
{
  uint64_t v2 = [(CKChatInputController *)self browserPlugin];
  id v3 = [v2 identifier];
  char v4 = [v3 hasSuffix:*MEMORY[0x1E4F6CAF8]];

  return v4;
}

- (BOOL)_switcherPluginCanMessageAPI
{
  if (!CKIsAppCardsEnabled())
  {
    if (!self->_browserSwitcher) {
      return 0;
    }
    char v4 = [(CKChatInputController *)self browserSwitcher];
    if (([v4 isBrowserReadyForUserInteraction] & 1) == 0)
    {
      char v5 = [(CKChatInputController *)self browserSwitcher];
      char v6 = [v5 transitionCoordinator];
      BOOL v3 = [v6 currentConsumer] == 2;

LABEL_13:
      return v3;
    }
LABEL_8:
    BOOL v3 = 1;
    goto LABEL_13;
  }
  if (![(CKChatInputController *)self appModalIsDisplayed])
  {
    int v7 = [(CKChatInputController *)self stickerReactionSession];

    char v4 = [(CKChatInputController *)self appCardPresentationOverseer];
    if (([v4 isPresentingCard] & 1) == 0)
    {
      char v8 = [v4 presentationBegan];
      if (v7) {
        BOOL v3 = 1;
      }
      else {
        BOOL v3 = v8;
      }
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)_shouldShowHandwriting
{
  uint64_t v2 = self;
  BOOL v3 = [(CKChatInputController *)self delegate];
  LOBYTE(v2) = [v3 chatInputControllerShouldShowHandwriting:v2];

  return (char)v2;
}

- (void)showHandwritingBrowserWithExistingPayload:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKChatInputController *)self _shouldShowHandwriting])
  {
    char v5 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if (v6)
    {
      if (v4)
      {
        v28[0] = v4;
        int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      }
      else
      {
        int v7 = 0;
      }
      id v21 = +[CKBalloonPluginManager sharedInstance];
      id v22 = [v21 handwritingViewControllerWithPluginPayloads:v7];

      [v22 setSendDelegate:self];
      char v23 = [v22 balloonPlugin];
      [(CKChatInputController *)self setBrowserPlugin:v23];

      char v24 = [CKKeyboardContentViewController alloc];
      uint64_t v25 = [(CKKeyboardContentViewController *)v24 initWithViewController:v22 identifier:*MEMORY[0x1E4F6CBD8]];
      [(CKChatInputController *)self setCurrentInputViewController:v25];
      [(CKChatInputController *)self setInputViewVisible:1];
    }
    else
    {
      char v8 = [(CKChatInputController *)self orientationManager];
      [v8 beginListeningForOrientationEventsWithKey:@"HandwritingOnscreen"];

      char v9 = [(CKChatInputController *)self handwritingPresentationController];

      if (!v9)
      {
        char v10 = objc_alloc_init(CKHandwritingPresentationController);
        [(CKChatInputController *)self setHandwritingPresentationController:v10];

        char v11 = [(CKChatInputController *)self handwritingPresentationController];
        [v11 setDelegate:self];

        int v12 = [(CKChatInputController *)self handwritingPresentationController];
        [v12 setSendDelegate:self];

        int v13 = [(CKChatInputController *)self orientationManager];
        id v14 = [(CKChatInputController *)self handwritingPresentationController];
        [v14 setDeviceOrientationManager:v13];
      }
      __int16 v15 = [(CKChatInputController *)self handwritingPresentationController];
      [v15 setPluginPayload:v4];

      int v16 = [(CKChatInputController *)self orientationManager];
      int v17 = [v16 isListeningForOrientationEvents];

      if (v17)
      {
        unsigned int v18 = [(CKChatInputController *)self orientationManager];
        uint64_t v19 = [v18 currentDeviceOrientation];

        if (v19 == 3) {
          uint64_t v20 = 3;
        }
        else {
          uint64_t v20 = 4 * (v19 == 4);
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      int v26 = [(CKChatInputController *)self handwritingPresentationController];
      [v26 setInitialInterfaceOrientation:v20];

      double v27 = [(CKChatInputController *)self handwritingPresentationController];
      [v27 setVisible:1 animated:1];
    }
  }
}

- (BOOL)handwritingIsDisplayed
{
  BOOL v3 = [(CKChatInputController *)self browserPlugin];
  id v4 = [v3 identifier];
  if ([v4 isEqualToString:*MEMORY[0x1E4F6CBD8]])
  {
    char v5 = 1;
  }
  else
  {
    uint64_t v6 = [(CKChatInputController *)self handwritingPresentationController];
    char v5 = [v6 visible];
  }
  return v5;
}

- (BOOL)appStoreIsDisplayed
{
  uint64_t v2 = [(CKChatInputController *)self browserPlugin];
  BOOL v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F6CB80]];

  return v4;
}

- (BOOL)appManagerIsDisplayed
{
  uint64_t v2 = [(CKChatInputController *)self browserPlugin];
  BOOL v3 = [v2 identifier];
  char v4 = [v3 isEqualToString:@"com.apple.messages.browser.MorePlugin"];

  return v4;
}

- (BOOL)appModalIsDisplayed
{
  uint64_t v2 = [(CKBrowserSwitcherViewController *)self->_browserSwitcher transitionCoordinator];
  char v3 = [v2 isPresentingFullScreenModal];

  return v3;
}

- (id)_browserViewControllerForInterfaceOrientationMethods
{
  char v3 = [(CKChatInputController *)self inputViewController];
  char v4 = [(CKBrowserSwitcherViewController *)self->_browserSwitcher transitionCoordinator];
  int v5 = [v4 isExpanded];

  if (v5)
  {
    uint64_t v6 = [(CKChatInputController *)self browserSwitcher];
    int v7 = [v6 transitionCoordinator];
    char v8 = [v7 expandedAppViewController];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = [v3 viewController];

      if (v8)
      {
        char v8 = [v3 viewController];
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (BOOL)browserShouldAutorotate
{
  uint64_t v2 = [(CKChatInputController *)self _browserViewControllerForInterfaceOrientationMethods];
  char v3 = v2;
  if (v2) {
    char v4 = [v2 shouldAutorotate];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (unint64_t)browserSupportedInterfaceOrientations
{
  uint64_t v2 = [(CKChatInputController *)self _browserViewControllerForInterfaceOrientationMethods];
  char v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 supportedInterfaceOrientations];
  }
  else {
    unint64_t v4 = 30;
  }

  return v4;
}

- (void)_handleOrientation
{
  char v3 = [(CKChatInputController *)self orientationManager];
  uint64_t v4 = [v3 currentDeviceOrientation];

  if ([(CKChatInputController *)self lastSeenOrientation])
  {
    if (v4 != [(CKChatInputController *)self lastSeenOrientation])
    {
      int v5 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (!v6
        && (unint64_t)(v4 - 1) <= 1
        && [(CKChatInputController *)self handwritingIsDisplayed])
      {
        int v7 = [(CKChatInputController *)self handwritingPresentationController];
        char v8 = [v7 pluginPayload];

        if (v8)
        {
          [(CKChatInputController *)self startEditingPayload:v8 dismiss:1];
        }
        else
        {
          char v9 = [(CKChatInputController *)self handwritingPresentationController];
          [v9 setVisible:0 animated:1];
        }
      }
    }
  }

  [(CKChatInputController *)self setLastSeenOrientation:v4];
}

- (void)setEntryViewHidden:(BOOL)a3
{
}

- (void)setShouldBlurForMessageEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKChatInputController *)self entryView];
  [v4 setShouldBlurForMessageEditing:v3];
}

- (BOOL)shouldBlurForMessageEditing
{
  uint64_t v2 = [(CKChatInputController *)self entryView];
  char v3 = [v2 shouldBlurForMessageEditing];

  return v3;
}

- (int64_t)determineSendMenuPresentationStyleCompatibleWithTraitCollection:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  int64_t v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && [v3 horizontalSizeClass] == 2;
  return v6;
}

- (void)handleTextInputPayload:(id)a3 withPayloadID:(id)a4 forPlugin:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length])
  {
    char v11 = +[CKBalloonPluginManager sharedInstance];
    int v12 = [v11 viewControllerForPluginIdentifier:v10];

    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v12 setSendDelegate:self];
      int v13 = (void *)[v8 mutableCopy];
      [v13 setObject:&unk_1EDF169A0 forKeyedSubscript:@"sessionStartEntryType"];
      id v14 = (void *)[v13 copy];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__CKChatInputController_handleTextInputPayload_withPayloadID_forPlugin___block_invoke;
      v15[3] = &unk_1E5620BF0;
      id v16 = v10;
      [v12 handleTextInputPayload:v14 withPayloadID:v9 completion:v15];
    }
  }
}

void __72__CKChatInputController_handleTextInputPayload_withPayloadID_forPlugin___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 1024;
      int v9 = a2;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Plugin %@ did handle text input payload: %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (void)showLocationPlugin
{
  id v3 = [(CKChatInputController *)self delegate];
  id v10 = [v3 activeSendMenuPresentationForChatInputController:self];

  id v4 = +[CKBalloonPluginManager sharedInstance];
  uint64_t v5 = IMBalloonExtensionIDWithSuffix();
  int v6 = [v4 pluginForExtensionIdentifier:v5];
  if (v6)
  {
    BOOL v7 = [v10 presentationStyle] == 1;
    __int16 v8 = [(CKChatInputController *)self delegate];
    uint64_t v9 = [v8 sceneInterfaceOrientation];

    [(CKChatInputController *)self showBrowserForPlugin:v6 dataSource:0 style:[(CKChatInputController *)self presentationStyleInOrientation:v9 inPopover:v7 forPluginID:v5]];
  }
}

- (void)sendMenuViewController:(id)a3 didSelectExtensionIdentifier:(id)a4
{
  id v5 = a4;
  int v6 = [(CKChatInputController *)self delegate];
  BOOL v7 = [v6 activeSendMenuPresentationForChatInputController:self];

  __int16 v8 = IMBalloonExtensionIDWithSuffix();
  int v9 = [v5 isEqualToString:v8];

  if (v9)
  {
    [(CKChatInputController *)self showFunCamera];
    goto LABEL_22;
  }
  id v10 = IMBalloonExtensionIDWithSuffix();
  if ([v5 isEqualToString:v10])
  {
    char v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v12 = [v11 isZelkovaEnabled];

    if (v12)
    {
      int v13 = [MEMORY[0x1E4F6E940] sharedCoordinator];
      id v14 = [v13 appPayloadID];

      __int16 v15 = +[CKBalloonPluginManager sharedInstance];
      id v16 = [v15 viewControllerForPluginIdentifier:v5];

      int v17 = [MEMORY[0x1E4F6E940] sharedCoordinator];
      unsigned int v18 = [v17 appPayload];

      if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v16 setSendDelegate:self];
        uint64_t v19 = (void *)[v18 mutableCopy];
        [v19 setObject:&unk_1EDF169B8 forKeyedSubscript:@"sessionStartEntryType"];
        uint64_t v20 = (void *)[v19 copy];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __77__CKChatInputController_sendMenuViewController_didSelectExtensionIdentifier___block_invoke;
        v32[3] = &unk_1E5620BF0;
        id v33 = v5;
        [v16 handleTextInputPayload:v20 withPayloadID:v14 completion:v32];
      }
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {
  }
  id v21 = IMBalloonExtensionIDWithSuffix();
  if (([v5 isEqualToString:v21] & 1) == 0)
  {

    goto LABEL_15;
  }
  id v22 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v23 = [v22 isAudioMessagesEntryViewRecordingEnabled];

  if (!v23)
  {
LABEL_15:
    uint64_t v25 = IMBalloonExtensionIDWithSuffix();
    int v26 = [v5 isEqualToString:v25];

    if (v26)
    {
      [(CKChatInputController *)self _sendLaterSelectedFromSendMenuWithPresentation:v7];
      goto LABEL_22;
    }
    id v14 = +[CKBalloonPluginManager sharedInstance];
    id v16 = [v14 pluginForExtensionIdentifier:v5];
    if (v16)
    {
      BOOL v27 = [v7 presentationStyle] == 1;
      int v28 = [(CKChatInputController *)self delegate];
      uint64_t v29 = [v28 sceneInterfaceOrientation];

      unint64_t v30 = [(CKChatInputController *)self presentationStyleInOrientation:v29 inPopover:v27 forPluginID:v5];
      [(CKChatInputController *)self showBrowserForPlugin:v16 dataSource:0 style:v30];
      int v31 = IMSharedHelperDeviceIsiPad();
      if (v30 == 2)
      {
        if (v31) {
          [v7 dismissAnimated:1 completion:0];
        }
      }
    }
    goto LABEL_21;
  }
  char v24 = [(CKChatInputController *)self entryView];
  [v24 startRecordingForAudioButtonInEntryView];

  if ([v7 presentationStyle] == 1) {
    [v7 dismissAnimated:1 completion:0];
  }
LABEL_22:
  if (![v7 presentationStyle]) {
    [v7 dismissAnimated:1 completion:0];
  }
}

void __77__CKChatInputController_sendMenuViewController_didSelectExtensionIdentifier___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 1024;
      int v9 = a2;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Plugin %@ did handle text input payload: %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (void)sendMenuViewControllerRequestDismiss:(id)a3
{
  id v4 = [(CKChatInputController *)self delegate];
  id v5 = [v4 activeSendMenuPresentationForChatInputController:self];

  [v5 dismissAnimated:1 completion:0];
}

- (void)sendMenuViewControllerWillPerformFullScreenDismissAnimation:(id)a3
{
  id v4 = a3;
  id v5 = [(CKChatInputController *)self entryView];
  [v5 endSendMenuPresentation];

  [(CKChatInputController *)self setShouldSuppressStatusBarForSendMenu:0];
  id v6 = [(CKChatInputController *)self delegate];
  [v6 chatInputController:self willBeginFullScreenDismissAnimationForSendMenuViewController:v4];
}

- (void)sendMenuDidAppear:(id)a3 presentationStyle:(int64_t)a4
{
  id v5 = [(CKChatInputController *)self entryView];
  if (a4 == 1)
  {
    id v6 = v5;
    [v5 beginSendMenuPopoverPresentation];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v6 = v5;
    [v5 beginSendMenuFullScreenPresentation];
  }
  id v5 = v6;
LABEL_6:
}

- (void)sendMenuViewControllerDidFinishDismissAnimation:(id)a3
{
  id v4 = a3;
  [(CKChatInputController *)self setShouldSuppressStatusBarForSendMenu:0];
  id v5 = [(CKChatInputController *)self delegate];
  [v5 chatInputController:self didFinishDismissAnimationForSendMenuViewController:v4];
}

- (BOOL)isKeyboardSnapshotted
{
  uint64_t v2 = [(CKChatInputController *)self delegate];
  char v3 = [v2 isKeyboardSnapshotted];

  return v3;
}

- (void)messageEntryViewDidExpand:(id)a3
{
  id v4 = [(CKChatInputController *)self insertPayloadCompletionHandler];

  if (v4)
  {
    id v5 = [(CKChatInputController *)self insertPayloadCompletionHandler];
    v5[2](v5, 0);

    [(CKChatInputController *)self setInsertPayloadCompletionHandler:0];
  }
}

- (void)messageEntryViewInputDidTakeFocus:(id)a3
{
  if (!CKIsAppCardsEnabled())
  {
    [(CKChatInputController *)self browserWillDismiss];
    [(CKChatInputController *)self dismissBrowserViewController];
  }
}

- (void)browserWillDismiss
{
  [(CKChatInputController *)self setBrowserPlugin:0];

  [(CKChatInputController *)self setBrowserPluginDataSource:0];
}

- (void)messageEntryViewPhotoButtonTouchDown:(id)a3
{
  id v4 = [(CKChatInputController *)self delegate];
  [v4 chatInputControllerWillSelectFunCamera:self];
}

- (void)messageEntryViewPhotoButtonTouchUpOutside:(id)a3
{
  id v4 = [(CKChatInputController *)self delegate];
  [v4 chatInputControllerCancelSelectFunCamera:self];
}

- (void)messageEntryViewPhotoButtonTouchCancel:(id)a3
{
  id v4 = [(CKChatInputController *)self delegate];
  [v4 chatInputControllerCancelSelectFunCamera:self];
}

- (void)messageEntryView:(id)a3 touchUpOutsidePlusButton:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:self];
}

- (void)messageEntryView:(id)a3 touchCancelForPlusButton:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:self];
}

- (void)messageEntryView:(id)a3 touchDragExitForPlusButton:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:self];
}

- (void)messageEntryView:(id)a3 didLongPressPlusButton:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:self];

  [(CKChatInputController *)self showPhotosExtension];
}

- (BOOL)shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:(id)a3
{
  id v4 = IMBalloonExtensionIDWithSuffix();
  BOOL v5 = [(CKChatInputController *)self isShowingAppCardForExtensionIdentifier:v4];
  if (v5)
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CKChatInputController shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:]();
    }
  }
  return !v5;
}

- (void)messageEntryView:(id)a3 didSelectPlusButton:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:self];

  [(CKChatInputController *)self _presentSendMenuForAppCardContentViewController:0 appCardPresentationStyle:0 withCompletion:&__block_literal_global_259_0];
}

- (void)_presentSendMenuForAppCardContentViewController:(id)a3 appCardPresentationStyle:(unint64_t)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v11 = [v10 userInterfaceIdiom];

  if (v11 == 1)
  {
    int v12 = [MEMORY[0x1E4F43058] keyWindow];
    int v13 = [v12 firstResponder];

    id v14 = [(CKChatInputController *)self entryView];
    __int16 v15 = [v14 contentView];
    id v16 = [v15 textView];

    int v17 = [(CKChatInputController *)self entryView];
    unsigned int v18 = [v17 contentView];
    uint64_t v19 = [v18 textView];
    if ((void *)v19 == v13)
    {
    }
    else
    {
      uint64_t v20 = (void *)v19;
      BOOL v21 = [(CKChatInputController *)self keyboardIsVisible];

      if (v21) {
        [(CKChatInputController *)self showKeyboard];
      }
    }
    if (v16 == v13)
    {
      int v23 = [MEMORY[0x1E4F43058] keyWindow];
      char v24 = [v23 firstResponder];
      [v24 resignFirstResponder];
    }
    else
    {
      dispatch_time_t v22 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __113__CKChatInputController__presentSendMenuForAppCardContentViewController_appCardPresentationStyle_withCompletion___block_invoke;
      block[3] = &unk_1E5620C40;
      void block[4] = self;
      dispatch_after(v22, MEMORY[0x1E4F14428], block);
    }
  }
  uint64_t v25 = [(CKChatInputController *)self delegate];
  int v26 = [v25 viewControllerForChatInputModalPresentation];

  BOOL v27 = [CKDefaultSceneOverlayPresentationContext alloc];
  int v28 = [v26 traitCollection];
  uint64_t v29 = [(CKDefaultSceneOverlayPresentationContext *)v27 initWithChatInputController:self initialTraitCollection:v28];

  if (v8)
  {
    unint64_t v30 = +[CKSendMenuPresentationRequest requestWithPresentationContext:v29 appCardContentViewController:v8 resolvedAppCardPresentationStyle:a4 completion:v9];
  }
  else
  {
    int v31 = [[CKSendMenuViewController alloc] initWithPresentationContext:v29];
    [(CKSendMenuViewController *)v31 setSendMenuViewControllerDelegate:self];
    [(CKChatInputController *)self setShouldSuppressStatusBarForSendMenu:[(CKSendMenuViewController *)v31 prefersStatusBarHidden]];
    unint64_t v30 = +[CKSendMenuPresentationRequest requestWithPresentationContext:v29 sendMenuViewController:v31 completion:v9];
  }
  double v32 = [(CKChatInputController *)self delegate];
  [v32 chatInputController:self requestPresentSendMenu:v30];
}

void __113__CKChatInputController__presentSendMenuForAppCardContentViewController_appCardPresentationStyle_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F43058] keyWindow];
  char v3 = [v2 firstResponder];
  id v4 = [*(id *)(a1 + 32) entryView];
  BOOL v5 = [v4 contentView];
  id v6 = [v5 textView];

  if (v3 == v6)
  {
    id v8 = [MEMORY[0x1E4F43058] keyWindow];
    uint64_t v7 = [v8 firstResponder];
    [v7 resignFirstResponder];
  }
}

- (BOOL)messageEntryViewShouldResignFirstResponder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F42B08] usesInputSystemUI])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8[0] = 67109120;
        v8[1] = [(CKChatInputController *)self preventResignFirstResponder];
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "messageEntryViewShouldResignFirstResponder called: prevented? %{BOOL}d", (uint8_t *)v8, 8u);
      }
    }
    BOOL v6 = ![(CKChatInputController *)self preventResignFirstResponder];
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)messageEntryViewBrowserButtonHit:(id)a3
{
  id v4 = [(CKChatInputController *)self delegate];
  [v4 chatInputWillUpdateInputViewShowingBrowser];

  if (!CKIsRunningInMacCatalyst())
  {
    BOOL v5 = [(CKChatInputController *)self browserPlugin];

    if (v5)
    {
      [(CKChatInputController *)self setBrowserPlugin:0];
      [(CKChatInputController *)self setBrowserPluginDataSource:0];
      [(CKChatInputController *)self dismissBrowserViewController];
    }
  }
}

- (BOOL)messageEntryShouldHideCaret:(id)a3
{
  char v3 = [(CKChatInputController *)self inputViewController];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)messageEntryViewHighLightInputButton:(id)a3
{
  if (![(CKChatInputController *)self isInputViewVisible]
    && ![(CKChatInputController *)self inputViewWillBecomeVisible])
  {
    return 0;
  }
  BOOL v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v5 = [v4 isSendMenuEnabled];

  if (v5) {
    return 0;
  }
  uint64_t v7 = [(CKChatInputController *)self browserPlugin];
  id v8 = [v7 identifier];

  if (v8)
  {
    if ([v8 isEqualToString:*MEMORY[0x1E4F6CBF8]]) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (BOOL)shouldPreventAppFromDisplayingForBundleIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  BOOL v4 = IMSharedDowntimeController();
  char v5 = [v4 allowedToShowAppExtensionWithBundleIdentifier:v3];

  return v5 ^ 1;
}

- (void)didSelectPlugin:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int64_t v6 = [v4 identifier];
      *(_DWORD *)buf = 138412290;
      int v23 = v6;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Entry view selected plugin: %@", buf, 0xCu);
    }
  }
  uint64_t v7 = +[CKBalloonPluginManager sharedInstance];
  [v7 updateLaunchTimeForPlugin:v4];

  id v8 = [(CKChatInputController *)self delegate];
  uint64_t v9 = [v8 sceneInterfaceOrientation];

  uint64_t v10 = [v4 identifier];
  int v11 = [v10 isEqualToString:@"com.apple.messages.browser.MorePlugin"];

  if (v11)
  {
    [(CKChatInputController *)self dismissBrowserViewController];
    int v12 = [(CKChatInputController *)self browserSwitcher];
    [(CKChatInputController *)self switcherViewControllerDidSelectAppManager:v12 shouldRestoreAppSwitcher:0];
  }
  else
  {
    int v13 = [v4 identifier];
    unint64_t v14 = [(CKChatInputController *)self presentationStyleInOrientation:v9 inPopover:0 forPluginID:v13];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__CKChatInputController_didSelectPlugin___block_invoke;
    aBlock[3] = &unk_1E5620E38;
    void aBlock[4] = self;
    id v15 = v4;
    id v20 = v15;
    unint64_t v21 = v14;
    id v16 = (void (**)(void))_Block_copy(aBlock);
    buf[0] = 0;
    int v17 = [v15 identifier];
    [(CKChatInputController *)self adjustSupportedInterfaceOrientationForPluginID:v17 requiredPortrait:buf];

    if (buf[0] && (unint64_t)(v9 - 3) <= 1)
    {
      dispatch_time_t v18 = dispatch_time(0, 50000000);
      dispatch_after(v18, MEMORY[0x1E4F14428], v16);
    }
    else
    {
      v16[2](v16);
    }
  }
}

uint64_t __41__CKChatInputController_didSelectPlugin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showBrowserForPlugin:*(void *)(a1 + 40) dataSource:0 style:*(void *)(a1 + 48)];
}

- (BOOL)messageEntryViewShouldVerticallyInsetForPresentedAppCard:(id)a3
{
  id v4 = [(CKChatInputController *)self appCardPresentationOverseer];
  int v5 = [v4 isPresentingCard];

  return v5 && !self->_isAppCardDraggingBelowKeyboardDetent;
}

- (void)adjustSupportedInterfaceOrientationForPluginID:(id)a3 requiredPortrait:(BOOL *)a4
{
  BOOL v7 = -[CKChatInputController shouldInterfaceBeRestrictedToPortraitForPluginID:](self, "shouldInterfaceBeRestrictedToPortraitForPluginID:");
  if (a3)
  {
    BOOL v8 = v7;
    if (a4) {
      *a4 = v7;
    }
    uint64_t v9 = [(CKChatInputController *)self delegate];
    id v10 = v9;
    if (v8) {
      [v9 updateSupportedInterfaceOrientations:2];
    }
    else {
      [v9 stopForcingOrientation];
    }
  }
}

- (BOOL)shouldInterfaceBeRestrictedToPortraitForPluginID:(id)a3
{
  uint64_t v3 = *MEMORY[0x1E4F6CB80];
  id v4 = a3;
  LOBYTE(v3) = [v4 isEqualToString:v3];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F6CBA0]];

  return v3 | v5;
}

- (unint64_t)presentationStyleInOrientation:(int64_t)a3 inPopover:(BOOL)a4 forPluginID:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  if (([v7 isEqualToString:*MEMORY[0x1E4F6CB80]] & 1) != 0
    || (IMBalloonExtensionIDWithSuffix(),
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 isEqualToString:v8],
        v8,
        (v9 & 1) != 0))
  {
    unint64_t v10 = 1;
  }
  else
  {
    int v12 = IMBalloonExtensionIDWithSuffix();
    char v13 = [v7 isEqualToString:v12];

    if (v13)
    {
      unint64_t v10 = 2;
    }
    else
    {
      unint64_t v14 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v15 = [v14 userInterfaceIdiom];

      if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v5)
      {
        id v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        if ([v16 isSendMenuEnabled])
        {
          int v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
          unsigned int v18 = [v17 isAppCardsEnabled];

          unint64_t v10 = v18;
        }
        else
        {

          unint64_t v10 = 0;
        }
      }
      else
      {
        uint64_t v19 = [MEMORY[0x1E4F42948] currentDevice];
        uint64_t v20 = [v19 userInterfaceIdiom];

        unint64_t v10 = (unint64_t)(a3 - 3) < 2 && (v20 & 0xFFFFFFFFFFFFFFFBLL) != 1;
      }
    }
  }

  return v10;
}

- (id)balloonPluginForIndexPath:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 item];
  BOOL v5 = +[CKBalloonPluginManager sharedInstance];
  int64_t v6 = [v5 visibleDrawerPlugins];

  if ([v6 count] <= v4)
  {
    BOOL v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKChatInputController balloonPluginForIndexPath:]();
    }

    id v7 = 0;
  }
  else
  {
    id v7 = [v6 objectAtIndexedSubscript:v4];
  }

  return v7;
}

- (void)messageEntryView:(id)a3 didSelectPluginAtIndex:(id)a4
{
  id v5 = a4;
  int64_t v6 = [(CKChatInputController *)self balloonPluginForIndexPath:v5];
  id v7 = v6;
  if (v6)
  {
    BOOL v8 = [v6 appBundle];
    char v9 = [v8 bundleIdentifier];

    if ([(CKChatInputController *)self shouldPreventAppFromDisplayingForBundleIdentifier:v9])
    {
      unint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 postNotificationName:@"com.apple.messages.CKScreenTimeDidEnterCurrentAppRestrictionNotification" object:0];
    }
    else
    {
      [(CKChatInputController *)self didSelectPlugin:v7];
    }
  }
  else
  {
    char v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CKChatInputController messageEntryView:didSelectPluginAtIndex:]((uint64_t)v5, v9);
    }
  }
}

- (void)messageEntryView:(id)a3 didSelectUIStickerInEmojiPicker:(id)a4
{
}

- (void)entryViewDidChangeSize
{
  id v2 = [(CKChatInputController *)self delegate];
  [v2 chatInputDidChangeSize];
}

- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CKChatInputController *)self switcherPluginCanMessageAPIOnBehalfOfPlugin:v9])
  {
    if (v8)
    {
      int v11 = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_3;
      block[3] = &unk_1E5625E70;
      int v12 = (id *)v18;
      v18[0] = v8;
      id v13 = v10;
      v18[1] = self;
      id v19 = v13;
      dispatch_async(v11, block);

LABEL_16:
      goto LABEL_17;
    }
    if (v10)
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_2;
      v20[3] = &unk_1E5620F48;
      int v12 = &v21;
      id v21 = v10;
      uint64_t v15 = MEMORY[0x1E4F14428];
      id v16 = v20;
      goto LABEL_15;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(13);
      unint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "_openURL not allowed as we are not user interactable", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
    if (v10)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke;
      v22[3] = &unk_1E5620F48;
      int v12 = &v23;
      id v23 = v10;
      uint64_t v15 = MEMORY[0x1E4F14428];
      id v16 = v22;
LABEL_15:
      dispatch_async(v15, v16);
      goto LABEL_16;
    }
  }
LABEL_17:
}

uint64_t __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v3 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_4;
  v6[3] = &unk_1E562A008;
  id v8 = *(id *)(a1 + 48);
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  [v2 openURL:v3 configuration:0 completionHandler:v6];
}

void __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 48))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_5;
    v5[3] = &unk_1E56267D8;
    id v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    id v8 = *(id *)(a1 + 48);
    id v7 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(13);
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 32);
      uint64_t v4 = *(void *)(a1 + 40);
      int8x16_t v5 = _Block_copy(*(const void **)(a1 + 56));
      id v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      uint64_t v12 = v3;
      if (v7) {
        id v8 = @"YES";
      }
      else {
        id v8 = @"NO";
      }
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      unsigned int v18 = v8;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "LS _openURL %@ URL %@ completionHandler %@, result %@", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    id v9 = _Block_copy(*(const void **)(a1 + 56));
    _CKLogExternal();
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(void *)(a1 + 48) != 0);
}

- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init((Class)MEMORY[0x192FBA860](@"FBSOpenApplicationService", @"FrontBoardServices"));
  [(CKChatInputController *)self _openContainingBundleID:v12 applicationService:v14 withURL:v13 pluginID:v11 completionHandler:v10];
}

- (void)_openContainingBundleID:(id)a3 applicationService:(id)a4 withURL:(id)a5 pluginID:(id)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = (CKChatInputController *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  BOOL v17 = [(CKChatInputController *)self switcherPluginCanMessageAPIOnBehalfOfPlugin:v15];
  int v18 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v18)
    {
      CKLogCStringForType(13);
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = _Block_copy(v16);
        *(_DWORD *)buf = 138412802;
        double v40 = self;
        __int16 v41 = 2112;
        id v42 = v14;
        __int16 v43 = 2112;
        double v44 = v20;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "_openURL %@ URL %@ completionHandler %@", buf, 0x20u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      uint64_t v29 = _Block_copy(v16);
      _CKLogExternal();
    }
    if (v14)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(13);
        id v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          double v40 = v12;
          _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "_openURL containingBundleID: %@", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
        _CKLogExternal();
      }
      uint64_t v22 = _openContainingBundleID_applicationService_withURL_pluginID_completionHandler____FBSOpenApplicationOptionKeyPayloadURL;
      if (!_openContainingBundleID_applicationService_withURL_pluginID_completionHandler____FBSOpenApplicationOptionKeyPayloadURL)
      {
        id v23 = (void **)MEMORY[0x192FBA870]("FBSOpenApplicationOptionKeyPayloadURL", @"FrontBoardServices");
        if (v23) {
          uint64_t v24 = *v23;
        }
        else {
          uint64_t v24 = 0;
        }
        objc_storeStrong((id *)&_openContainingBundleID_applicationService_withURL_pluginID_completionHandler____FBSOpenApplicationOptionKeyPayloadURL, v24);
        uint64_t v22 = _openContainingBundleID_applicationService_withURL_pluginID_completionHandler____FBSOpenApplicationOptionKeyPayloadURL;
      }
      BOOL v27 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v14, v22, 0, v29);
      if (__FBSOpenApplicationOptionsClass_onceToken != -1) {
        dispatch_once(&__FBSOpenApplicationOptionsClass_onceToken, &__block_literal_global_1352);
      }
      int v28 = [ (id) __FBSOpenApplicationOptionsClass__optionsClass optionsWithDictionary:v27];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_289;
      v30[3] = &unk_1E562A030;
      id v31 = v14;
      double v32 = v12;
      id v33 = v27;
      id v34 = v16;
      id v26 = v27;
      [v13 openApplication:v32 withOptions:v28 completion:v30];
    }
    else
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_281;
      v35[3] = &unk_1E5620F48;
      id v36 = v16;
      dispatch_async(MEMORY[0x1E4F14428], v35);
      id v26 = v36;
    }
    goto LABEL_35;
  }
  if (v18)
  {
    CKLogCStringForType(13);
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "_openURL not allowed as we are not user interactable", buf, 2u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
    _CKLogExternal();
  }
  if (v16)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke;
    block[3] = &unk_1E5620F48;
    id v38 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v26 = v38;
LABEL_35:
  }
}

uint64_t __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_281(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_289(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(13);
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 138413058;
        uint64_t v15 = v8;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        __int16 v18 = 2112;
        uint64_t v19 = v10;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "_openURL error when trying to openURL %@ with bundle ID %@ options dict %@ error %@", buf, 0x2Au);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
      _CKLogExternal();
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_293;
  block[3] = &unk_1E56225E0;
  id v12 = *(id *)(a1 + 56);
  BOOL v13 = v6 == 0;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_293(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)commitPayload:(id)a3
{
}

- (BOOL)commitPayloadBypassingValidation:(id)a3 forPlugin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setUseDirectSend:1];
  uint64_t v8 = [v6 pluginBundleID];

  if (!v8) {
    [v6 setPluginBundleID:v7];
  }
  [(CKChatInputController *)self performSelector:sel_deferredCommitPayload_ withObject:v6 afterDelay:0.1];

  return 1;
}

- (void)checkForTouchInRemoteProcessIfNecessaryWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CKChatInputController *)self appCardPresentationOverseer];
  [v5 checkForTouchInExtensionWithCompletion:v4];
}

- (void)deferredCommitPayload:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 setIsFromMe:1];
  if ([v4 isUpdate])
  {
    id v5 = [(CKChatInputController *)self browserPluginDataSource];
    uint64_t v6 = [v4 datasource];
    id v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = (void *)v6;
    }
    else {
      uint64_t v8 = v5;
    }
    [v4 setDatasource:v8];

    uint64_t v9 = [v4 messageGUID];
    if (v9)
    {
      [v4 setMessageGUID:v9];
    }
    else
    {
      uint64_t v10 = [v5 messageGUID];
      [v4 setMessageGUID:v10];
    }
  }
  BOOL v11 = [(CKChatInputController *)self handwritingIsDisplayed];
  id v12 = [(CKChatInputController *)self handwritingPresentationController];

  if (v12)
  {
    BOOL v13 = [(CKChatInputController *)self handwritingPresentationController];
    [v13 setVisible:0 animated:1];
  }
  if (v4
    && ([v4 pluginBundleID], id v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    if ([v4 shouldExpire]) {
      id v15 = +[CKComposition newExpirableCompositionWithText:0 subject:0 shelfPluginPayload:v4];
    }
    else {
      id v15 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__CKChatInputController_deferredCommitPayload___block_invoke;
    aBlock[3] = &unk_1E56237D8;
    void aBlock[4] = self;
    id v18 = v4;
    id v25 = v18;
    uint64_t v19 = _Block_copy(aBlock);
    __int16 v20 = v19;
    if (v15)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __47__CKChatInputController_deferredCommitPayload___block_invoke_2;
      v21[3] = &unk_1E5623828;
      id v23 = v19;
      id v22 = v15;
      dispatch_async(MEMORY[0x1E4F14428], v21);
    }
    else
    {
      +[CKComposition compositionWithShelfPluginPayload:v18 completionHandler:v19];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [(CKChatInputController *)self pluginBundleID];
        *(_DWORD *)buf = 138412290;
        BOOL v27 = v17;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Attempting to commit nil payload or payload with no identifier; current visible plugin is %@",
          buf,
          0xCu);
      }
    }
    if (v11) {
      [(CKChatInputController *)self dismissBrowserViewController];
    }
  }
}

void __47__CKChatInputController_deferredCommitPayload___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 delegate];
    [v5 chatInputSentComposition:v4];
  }
  id v7 = +[CKBalloonPluginManager sharedInstance];
  uint64_t v6 = [*(id *)(a1 + 40) pluginBundleID];
  [v7 updateInteractionTimeForPlugin:v6];
}

uint64_t __47__CKChatInputController_deferredCommitPayload___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (id)_stickerPickerPlugin
{
  id v2 = IMStickersExtensionIdentifier();
  uint64_t v3 = IMBalloonExtensionIDWithSuffix();

  id v4 = [MEMORY[0x1E4F6BC18] sharedInstance];
  [v4 loadExtensionWithIdentifierIfNeeded:v3];

  id v5 = [MEMORY[0x1E4F6BC18] sharedInstance];
  uint64_t v6 = [v5 balloonPluginForBundleID:v3];

  if (!v6)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKChatInputController _stickerPickerPlugin]();
    }
  }
  uint64_t v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CKChatInputController _stickerPickerPlugin]();
  }

  return v6;
}

- (void)dismissStickerPickerPreservingChatItem:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  dispatch_block_t block = a4;
  uint64_t v6 = [(CKChatInputController *)self stickerPickerMessagePartChatItem];

  if (v6)
  {
    if (!v4)
    {
      [(CKChatInputController *)self setStickerPickerMessagePartChatItem:0];
      [(CKChatInputController *)self setStickerPickerMessagePartParentChatItem:0];
      [(CKChatInputController *)self endStickerReactionSession];
    }
    if (CKIsAppCardsEnabled())
    {
      id v7 = [(CKChatInputController *)self delegate];
      uint64_t v8 = [v7 viewControllerForChatInputModalPresentation];
      [v8 dismissViewControllerAnimated:1 completion:block];

      [(CKChatInputController *)self forceDismissBrowserWithoutAnimation];
    }
    else
    {
      [(CKChatInputController *)self dismissBrowserViewController];
      uint64_t v9 = [(CKChatInputController *)self entryView];
      uint64_t v10 = [v9 contentView];
      BOOL v11 = [v10 textView];
      [v11 resignFirstResponder];

      if (block)
      {
        dispatch_time_t v12 = dispatch_time(0, 300000000);
        dispatch_after(v12, MEMORY[0x1E4F14428], block);
      }
    }
    [(CKChatInputController *)self setBrowserPlugin:0];
    [(CKChatInputController *)self stickerPickerWasHiddenPreservingChatItem:v4];
  }
}

- (BOOL)isPresentingStickerPicker
{
  id v2 = [(CKChatInputController *)self stickerPickerMessagePartChatItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)stickerPickerWasHidden
{
}

- (void)stickerPickerWasHiddenPreservingChatItem:(BOOL)a3
{
  id v5 = [(CKChatInputController *)self stickerPickerMessagePartChatItem];

  if (v5)
  {
    uint64_t v6 = [(CKChatInputController *)self stickerPickerMessagePartChatItem];
    if (!a3)
    {
      [(CKChatInputController *)self setStickerPickerMessagePartChatItem:0];
      [(CKChatInputController *)self setStickerPickerMessagePartParentChatItem:0];
      [(CKChatInputController *)self endStickerReactionSession];
    }
    id v7 = [(CKChatInputController *)self delegate];
    [v7 chatInputController:self didPresentStickerPickerForChatItem:v6];

    uint64_t v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CKChatInputController stickerPickerWasHiddenPreservingChatItem:]();
    }
  }
}

- (void)commitStickerBypassingValidation:(id)a3 forPlugin:(id)a4 stickerFrame:(CGRect)a5
{
}

- (void)commitSticker:(id)a3 forPlugin:(id)a4 stickerFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  id v12 = a3;
  BOOL v13 = [(CKChatInputController *)self delegate];
  id v14 = [v13 viewControllerForChatInputModalPresentation];
  id v15 = [v14 presentedViewController];
  id v29 = [v15 view];

  __int16 v16 = [(CKChatInputController *)self delegate];
  uint64_t v17 = [v16 viewControllerForChatInputModalPresentation];
  id v18 = [v17 view];
  uint64_t v19 = [v18 window];
  __int16 v20 = [v19 coordinateSpace];
  objc_msgSend(v29, "convertRect:toCoordinateSpace:", v20, x, y, width, height);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  -[CKChatInputController commitSticker:forPlugin:bypassValidation:stickerFrame:](self, "commitSticker:forPlugin:bypassValidation:stickerFrame:", v12, v11, 0, v22, v24, v26, v28);
}

- (void)commitSticker:(id)a3 forPlugin:(id)a4 bypassValidation:(BOOL)a5 stickerFrame:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = [(CKChatInputController *)self delegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F43058] keyWindow];
    id v18 = [v17 firstResponder];
    uint64_t v19 = IMLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412546;
      id v28 = v17;
      __int16 v29 = 2048;
      unint64_t v30 = v18;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "Current keyWindow:%@ firstResponder: %p", (uint8_t *)&v27, 0x16u);
    }

    __int16 v20 = [(CKChatInputController *)self delegate];
    int v21 = [v20 commitStickerAsTapback:v13];

    if (v21)
    {
      double v22 = IMLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412290;
        id v28 = v13;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Committed sticker as tapback: %@", (uint8_t *)&v27, 0xCu);
      }

      goto LABEL_15;
    }
  }
  uint64_t v17 = [(CKChatInputController *)self stickerReactionSession];
  if (v17)
  {
    id v18 = [(CKChatInputController *)self delegate];
    double v23 = [(CKChatInputController *)self stickerPickerMessagePartChatItem];
    double v24 = [(CKChatInputController *)self stickerPickerMessagePartParentChatItem];
    objc_msgSend(v18, "sendAutomaticallyPlacedSticker:stickerReactionSession:forChatItem:forParentChatItem:stickerFrame:animationCompletionHandler:", v13, v17, v23, v24, 0, x, y, width, height);

LABEL_15:
    goto LABEL_16;
  }
  if (a5
    || -[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v14)|| (IMBalloonExtensionIDWithSuffix(), v25 = objc_claimAutoreleasedReturnValue(), int v26 = [v14 isEqualToString:v25], v25, v26))
  {
    [(CKChatInputController *)self performSelector:sel__deferredCommitSticker_ withObject:v13 afterDelay:0.1];
    id v18 = +[CKBalloonPluginManager sharedInstance];
    [v18 updateInteractionTimeForPlugin:v14];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  uint64_t v10 = [(CKChatInputController *)self browserPlugin];
  id v12 = [v10 identifier];

  id v11 = +[CKBalloonPluginManager sharedInstance];
  [v11 updateInteractionTimeForPlugin:v12];

  -[CKChatInputController commitSticker:forPlugin:stickerFrame:](self, "commitSticker:forPlugin:stickerFrame:", v9, 0, x, y, width, height);
}

- (void)_deferredCommitSticker:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Deferred Committing sticker: %@", buf, 0xCu);
  }

  uint64_t v6 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v6 trackEvent:*MEMORY[0x1E4F6DCA0]];

  id v7 = [v4 uiSticker];
  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __48__CKChatInputController__deferredCommitSticker___block_invoke;
    v8[3] = &unk_1E5624AF0;
    v8[4] = self;
    objc_msgSend(v7, "stk_renderBakedInRepIfNecessaryWithCompletion:", v8);
  }
  else
  {
    [(CKChatInputController *)self _insertUISticker:v7];
  }
}

void __48__CKChatInputController__deferredCommitSticker___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__CKChatInputController__deferredCommitSticker___block_invoke_2;
  v5[3] = &unk_1E5620AF8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __48__CKChatInputController__deferredCommitSticker___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _insertUISticker:*(void *)(a1 + 40)];
}

- (void)_insertUISticker:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "_ck_plainStringEmojiText");
  if ([v5 length])
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Handling sticker app sticker insertion as plain string system emoji text", buf, 2u);
    }

    id v7 = [(CKChatInputController *)self entryView];
    uint64_t v8 = [v7 contentView];
    id v9 = [v8 textView];

    [v9 insertText:v5];
  }
  else
  {
    id v10 = [(CKChatInputController *)self targetConversation];
    int v11 = [v10 supportsInlineAdaptiveImageGlyphs];

    int v12 = objc_msgSend(v4, "_ck_shouldInsertInCompositionAsAdaptiveImageGlyph");
    id v13 = IMLogHandleForCategory();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11 && v12)
    {
      if (v14)
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Handling sticker app sticker insertion as adaptive image glyph", v18, 2u);
      }

      [(CKChatInputController *)self insertUIStickerAsAdaptiveImageGlyph:v4];
    }
    else
    {
      if (v14)
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Handling sticker app sticker insertion as sticker added to shelf", v17, 2u);
      }

      id v15 = (void *)[objc_alloc(MEMORY[0x1E4F6EA58]) initWithUISticker:v4 adaptiveImageGlyph:0];
      char v16 = +[CKBrowserItemPayload browserItemFromSticker:v15];
      [(CKChatInputController *)self startEditingPayload:v16];
    }
  }
}

- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = [v9 description];
    int v20 = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    double v23 = v12;
    _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Committing sticker: %@, for drag target: %@", (uint8_t *)&v20, 0x16u);
  }
  id v13 = [(CKChatInputController *)self stickerReactionSession];
  char v14 = [v13 didSendSticker];

  if ((v14 & 1) == 0)
  {
    id v15 = [(CKChatInputController *)self browserPlugin];
    char v16 = [v15 identifier];

    uint64_t v17 = +[CKBalloonPluginManager sharedInstance];
    [v17 updateInteractionTimeForPlugin:v16];

    id v18 = [(CKChatInputController *)self delegate];
    [v18 sendSticker:v8 withDragTarget:v9 draggedSticker:v10];

    uint64_t v19 = [(CKChatInputController *)self stickerReactionSession];

    if (v19)
    {
      [(CKChatInputController *)self endStickerReactionSession];
      [(CKChatInputController *)self dismissStickerPickerPreservingChatItem:0 completion:0];
    }
  }
}

- (void)stickerDropAnimationFinished
{
  if ([(CKChatInputController *)self didDismissAppCardForStickerDrag])
  {
    [(CKChatInputController *)self setDidDismissAppCardForStickerDrag:0];
    id v12 = [(CKChatInputController *)self pluginToResumeForStickerDrag];
    if (!v12)
    {
      id v3 = +[CKBalloonPluginManager sharedInstance];
      id v4 = IMStickersExtensionIdentifier();
      id v5 = IMBalloonExtensionIDWithSuffix();
      id v12 = [v3 pluginForIdentifier:v5];
    }
    [(CKChatInputController *)self setPluginToResumeForStickerDrag:0];
    [(CKChatInputController *)self showBrowserForPlugin:v12 dataSource:0 style:[(CKChatInputController *)self savedStyleForDragCompletion]];
    [(CKChatInputController *)self setSavedStyleForDragCompletion:0];
  }
  else
  {
    uint64_t v6 = [(CKChatInputController *)self currentPresentationConfig];
    if (!v6) {
      return;
    }
    id v7 = (void *)v6;
    id v8 = [(CKChatInputController *)self stickerReactionSession];

    if (!v8) {
      return;
    }
    IMStickersExtensionIdentifier();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = IMBalloonExtensionIDWithSuffix();
    id v10 = [(CKChatInputController *)self currentPresentationConfig];
    int v11 = [v10 sourceView];
    [(CKChatInputController *)self showPluginWithExtensionIdentifier:v9 sourceView:v11];
  }
}

- (void)commitSticker:(id)a3 atScreenCoordinate:(CGPoint)a4 scale:(double)a5 rotation:(double)a6 stickerFrame:(CGRect)a7
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = IMLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v29.double x = x;
    v29.double y = y;
    char v14 = NSStringFromPoint(v29);
    int v20 = 138413058;
    id v21 = v12;
    __int16 v22 = 2112;
    double v23 = v14;
    __int16 v24 = 2048;
    double v25 = a5;
    __int16 v26 = 2048;
    double v27 = a6;
    _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Committing sticker %@ at screen coordinate: %@, scale: %f, rotation: %f", (uint8_t *)&v20, 0x2Au);
  }
  id v15 = +[CKBrowserDragControllerTarget targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:](CKBrowserDragControllerTarget, "targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:", 0, x, y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), a5, 0.4, a6);
  char v16 = [(CKChatInputController *)self browserPlugin];
  uint64_t v17 = [v16 identifier];

  id v18 = +[CKBalloonPluginManager sharedInstance];
  [v18 updateInteractionTimeForPlugin:v17];

  uint64_t v19 = [(CKChatInputController *)self delegate];
  [v19 sendSticker:v12 withDragTarget:v15 draggedSticker:0];

  [(CKChatInputController *)self dismissStickerPickerPreservingChatItem:0 completion:0];
}

- (id)dragControllerTranscriptDelegate
{
  id v2 = [(CKChatInputController *)self delegate];
  id v3 = [v2 dragControllerTranscriptDelegate];

  return v3;
}

- (void)dismissToKeyboard:(BOOL)a3
{
}

- (void)dismiss
{
}

- (void)dismissAndReloadInputViews:(BOOL)a3
{
}

- (void)dismissAndReloadInputViews:(BOOL)a3 forPlugin:(id)a4
{
  id v6 = a4;
  dispatch_time_t v7 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CKChatInputController_dismissAndReloadInputViews_forPlugin___block_invoke;
  block[3] = &unk_1E5623DE8;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x1E4F14428], block);
}

void __62__CKChatInputController_dismissAndReloadInputViews_forPlugin___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  if (([*(id *)(a1 + 32) currentPluginIsDT] & 1) != 0
    || ([*(id *)(a1 + 32) handwritingIsDisplayed] & 1) != 0
    || ([*(id *)(a1 + 32) appStoreIsDisplayed] & 1) != 0
    || [*(id *)(a1 + 32) appManagerIsDisplayed])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [NSNumber numberWithBool:v2 != 0];
    [v3 _deferredDismissToKeyboardAndFocusEntryView:v4];

    id v11 = [*(id *)(a1 + 32) delegate];
    [v11 stopForcingOrientation];
    goto LABEL_6;
  }
  if (([*(id *)(a1 + 32) switcherPluginCanMessageAPIOnBehalfOfPlugin:*(void *)(a1 + 40)] & 1) != 0
    || ([*(id *)(a1 + 32) appModalIsDisplayed] & 1) != 0)
  {
    int v5 = 1;
    if (v2) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v7 = 0;
    if (!v5) {
      return;
    }
    goto LABEL_16;
  }
  id v8 = [*(id *)(a1 + 32) appCardPresentationOverseer];
  int v5 = [v8 isPresentingCard];

  if (!v2) {
    goto LABEL_15;
  }
LABEL_12:
  id v6 = [*(id *)(a1 + 32) appCardPresentationOverseer];
  uint64_t v7 = [v6 shouldAnimateDismissal] ^ 1;

  if (!v5) {
    return;
  }
LABEL_16:
  char v9 = [*(id *)(a1 + 32) isDisplayingReplaceCompositionAlert];
  id v10 = *(unsigned char **)(a1 + 32);
  if (v9)
  {
    v10[19] = 1;
    return;
  }
  id v11 = [NSNumber numberWithBool:v7];
  [v10 performSelector:sel__deferredDismissToKeyboardAndFocusEntryView_ withObject:v11 afterDelay:0.1];
LABEL_6:
}

- (void)dismissOrHideHandwritingBrowser
{
  id v3 = [(CKChatInputController *)self handwritingPresentationController];

  if (v3)
  {
    id v4 = [(CKChatInputController *)self handwritingPresentationController];
    [v4 setVisible:0 animated:1];
  }
  else
  {
    [(CKChatInputController *)self dismissBrowserViewController];
  }
}

- (void)_deferredDismissToKeyboardAndFocusEntryView:(id)a3
{
  id v4 = a3;
  if ([(CKChatInputController *)self isDisplayingReplaceCompositionAlert])
  {
    self->_dismissPluginAfterReplaceAlertInteractedWith = 1;
    goto LABEL_31;
  }
  [(CKChatInputController *)self setIsDisplayingReplaceCompositionAlert:0];
  int v5 = [(CKChatInputController *)self handwritingPresentationController];

  if (v5)
  {
    id v6 = [(CKChatInputController *)self handwritingPresentationController];
    [v6 setVisible:0 animated:1];
  }
  uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v9 = 1;
  }
  else
  {
    id v10 = [(CKChatInputController *)self appCardPresentationOverseer];
    uint64_t v9 = [v10 shouldAnimateDismissal];
  }
  uint64_t v11 = [v4 BOOLValue];
  if ((v11 & 1) != 0 || [(CKChatInputController *)self appManagerIsDisplayed])
  {
    id v12 = [(CKChatInputController *)self entryView];
    [v12 clearAppStripSelection];
  }
  if ([(CKChatInputController *)self appManagerIsDisplayed])
  {
    [(CKChatInputController *)self setStatusBarStyleViewController:0];
    [(CKChatInputController *)self setBrowserPlugin:0];
    if ([(CKChatInputController *)self shouldRestoreAppSwitcher])
    {
      [(CKChatInputController *)self setInputViewVisible:1 entryFieldCollapsed:1 animated:0];
      [(CKChatInputController *)self setShouldRestoreAppSwitcher:0];
    }
    id v13 = [(CKChatInputController *)self entryView];
    [v13 setHidden:0];

    char v14 = [(CKChatInputController *)self entryView];
    [v14 setAlpha:1.0];

    id v15 = [(CKChatInputController *)self delegate];
    char v16 = [v15 viewControllerForChatInputModalPresentation];

    uint64_t v17 = [v16 presentedViewController];

    if (v17)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke;
      v32[3] = &unk_1E5620C40;
      void v32[4] = self;
      [v16 dismissViewControllerAnimated:1 completion:v32];
    }
    if (v11)
    {
      [v16 becomeFirstResponder];
      [v16 reloadInputViews];
    }
    goto LABEL_28;
  }
  if ([(CKChatInputController *)self appModalIsDisplayed])
  {
    self->_isDismissingAppModal = 1;
    id v18 = [(CKChatInputController *)self entryView];
    [v18 setBrowserButtonEnabled:0];

    uint64_t v19 = [(CKChatInputController *)self browserSwitcher];
    char v16 = [v19 transitionCoordinator];

    if (v11)
    {
      [(CKChatInputController *)self setInputViewVisible:0];
      [(CKChatInputController *)self setBrowserSwitcher:0];
      [(CKChatInputController *)self setSwitcherInputViewController:0];
      [(CKChatInputController *)self setCurrentInputViewController:0];
      v31[5] = MEMORY[0x1E4F143A8];
      v31[6] = 3221225472;
      v31[7] = __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_2;
      v31[8] = &unk_1E5620C40;
      v31[9] = self;
      im_dispatch_after();
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_3;
      v31[3] = &unk_1E5620C40;
      v31[4] = self;
      [MEMORY[0x1E4F42FF0] performWithoutAnimation:v31];
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_4;
    v30[3] = &unk_1E5620C40;
    void v30[4] = self;
    [v16 dismissCurrentFullScreenModalAnimated:1 completion:v30];
LABEL_28:

    goto LABEL_29;
  }
  if ([(CKChatInputController *)self _isAppBrowserFullScreen])
  {
    if (v11) {
      im_dispatch_after();
    }
    if (CKIsAppCardsEnabled())
    {
      [(CKChatInputController *)self _dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:v9 overrideExceptions:1 focusEntryView:v11];
      goto LABEL_29;
    }
    double v25 = [(CKChatInputController *)self browserSwitcher];
    [v25 dismissBrowserFullscreenAnimated:1 withCompletion:0];
  }
  else
  {
    int v20 = +[CKUIBehavior sharedBehaviors];
    if ([v20 canPresentOverKeyboard])
    {
      BOOL v21 = [(CKChatInputController *)self isInputViewVisible];

      if (v21)
      {
        [MEMORY[0x1E4F42B08] sizeForInterfaceOrientation:CKNonFlatDeviceOrientation() ignoreInputView:1];
        double v23 = v22;
        __int16 v24 = [(CKChatInputController *)self delegate];
        [v24 chatInputWillChangeHeightForCompactPresentation:v23];

        [(CKChatInputController *)self _dismissCompactSwitcherOverKeyboardWithCompletion:0];
        goto LABEL_29;
      }
    }
    else
    {
    }
    [(CKChatInputController *)self setInputViewVisible:0];
    [(CKChatInputController *)self setBrowserSwitcher:0];
    [(CKChatInputController *)self setSwitcherInputViewController:0];
    [(CKChatInputController *)self setCurrentInputViewController:0];
    [(CKChatInputController *)self setBrowserPlugin:0];
    [(CKChatInputController *)self setBrowserPluginDataSource:0];
    if (CKIsAppCardsEnabled()) {
      [(CKChatInputController *)self _dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:v9 overrideExceptions:1 focusEntryView:v11];
    }
    if (!CKIsRunningInMacCatalyst()) {
      goto LABEL_29;
    }
    __int16 v26 = [(CKChatInputController *)self delegate];
    double v25 = [v26 viewControllerForChatInputModalPresentation];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v27 = [v25 isModal] ^ 1;
    }
    else {
      int v27 = 1;
    }
    uint64_t v28 = [v25 presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0 && v27) {
      [v25 dismissViewControllerAnimated:1 completion:0];
    }
  }

LABEL_29:
  if ([(CKChatInputController *)self isPresentingStickerPicker]) {
    [(CKChatInputController *)self dismissStickerPickerPreservingChatItem:0 completion:0];
  }
LABEL_31:
}

uint64_t __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBrowserPluginDataSource:0];
  int v2 = *(void **)(a1 + 32);

  return [v2 setPresentedBrowserNavigationController:0];
}

void __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 chatInputControllerRequestInputViewFocusFromFullscreen:*(void *)(a1 + 32)];
}

uint64_t __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isInputViewVisible])
  {
    id v2 = *(void **)(a1 + 32);
    id v3 = [v2 switcherInputViewController];
    [v2 setCurrentInputViewController:v3];

    id v4 = [*(id *)(a1 + 32) entryView];
    [v4 setKeyboardVisible:1];
  }
  int v5 = [*(id *)(a1 + 32) entryView];
  id v6 = [v5 contentView];
  uint64_t v7 = [v6 pluginEntryViewController];
  BOOL v8 = v7 == 0;

  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = [v9 isInputViewVisible];

  return [v9 setInputViewVisible:v10 entryFieldCollapsed:v8 animated:1];
}

void __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  id v2 = [*(id *)(a1 + 32) entryView];
  [v2 setBrowserButtonEnabled:1];

  id v3 = [*(id *)(a1 + 32) macBrowserViewController];

  if (v3)
  {
    id v4 = [CKTranscriptPluginPresentationConfiguration alloc];
    int v5 = [*(id *)(a1 + 32) entryView];
    id v6 = [v5 sendMenuSourceView];
    uint64_t v9 = [(CKTranscriptPluginPresentationConfiguration *)v4 initWithSourceView:v6 permittedArrowDirections:8 shouldDisableSnapshotView:0];

    uint64_t v7 = *(void **)(a1 + 32);
    BOOL v8 = [v7 macBrowserViewController];
    [v7 showExpandedBrowserPopover:v8 presentationConfiguration:v9];

    [*(id *)(a1 + 32) setMacBrowserViewController:0];
  }
}

void __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 chatInputControllerRequestInputViewFocusFromFullscreen:*(void *)(a1 + 32)];
}

- (void)_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:(BOOL)a3 focusEntryView:(BOOL)a4
{
}

- (void)_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:(BOOL)a3 overrideExceptions:(BOOL)a4 focusEntryView:(BOOL)a5
{
  uint64_t v9 = [(CKChatInputController *)self appCardPresentationOverseer];
  int v10 = [v9 isPresentingCard];

  if (v10)
  {
    dispatch_time_t v11 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __126__CKChatInputController__dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention_overrideExceptions_focusEntryView___block_invoke;
    block[3] = &unk_1E562A058;
    void block[4] = self;
    BOOL v14 = a3;
    BOOL v15 = a5;
    BOOL v16 = a4;
    dispatch_after(v11, MEMORY[0x1E4F14428], block);
  }
  else if ([(CKChatInputController *)self _isAppBrowserFullScreen])
  {
    id v12 = [(CKChatInputController *)self browserSwitcher];
    [v12 dismissBrowserFullscreenAnimated:1 withCompletion:0];
  }
}

uint64_t __126__CKChatInputController__dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention_overrideExceptions_focusEntryView___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) preventResignFirstResponder];
  [*(id *)(a1 + 32) setPreventResignFirstResponder:1];
  [*(id *)(a1 + 32) dismissAppCardIfNecessaryAnimated:*(unsigned __int8 *)(a1 + 40) isFocusingKeyboard:*(unsigned __int8 *)(a1 + 41) overrideExceptions:*(unsigned __int8 *)(a1 + 42) completion:0];
  id v3 = *(void **)(a1 + 32);

  return [v3 setPreventResignFirstResponder:v2];
}

- (void)forceDismissBrowserWithoutAnimation
{
  [(CKChatInputController *)self setInputViewVisible:0];
  [(CKChatInputController *)self setBrowserSwitcher:0];
  [(CKChatInputController *)self setSwitcherInputViewController:0];
  [(CKChatInputController *)self setCurrentInputViewController:0];
  if ([(CKChatInputController *)self isPresentingStickerPicker])
  {
    [(CKChatInputController *)self stickerPickerWasHiddenPreservingChatItem:1];
  }
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
}

- (void)stickerDruidDragStarted
{
  id v3 = [(CKChatInputController *)self delegate];
  id v17 = [v3 activeSendMenuPresentationForChatInputController:self];

  id v4 = [(CKChatInputController *)self delegate];
  int v5 = [v4 viewControllerForChatInputModalPresentation];

  if (v17)
  {
    [v17 dismissAnimated:1 completion:0];
    goto LABEL_12;
  }
  id v6 = [(CKChatInputController *)self appCardPresentationOverseer];
  if ([v6 isPresentingCard])
  {
    uint64_t v7 = [v5 traitCollection];
    uint64_t v8 = [v7 verticalSizeClass];

    if (v8 == 1)
    {
      uint64_t v9 = [(CKChatInputController *)self appCardPresentationOverseer];
      int v10 = v9;
      dispatch_time_t v11 = &__block_literal_global_316_2;
LABEL_9:
      [v9 dismissCardAnimated:1 completion:v11];

      goto LABEL_12;
    }
  }
  else
  {
  }
  id v12 = [(CKChatInputController *)self appCardPresentationOverseer];
  int v13 = [v12 isExpanded];

  if (v13)
  {
    [(CKChatInputController *)self setDidDismissAppCardForStickerDrag:1];
    BOOL v14 = [(CKChatInputController *)self browserPlugin];
    [(CKChatInputController *)self setPluginToResumeForStickerDrag:v14];

    BOOL v15 = [(CKChatInputController *)self appCardPresentationOverseer];
    -[CKChatInputController setSavedStyleForDragCompletion:](self, "setSavedStyleForDragCompletion:", [v15 isExpanded]);

    uint64_t v9 = [(CKChatInputController *)self appCardPresentationOverseer];
    int v10 = v9;
    dispatch_time_t v11 = &__block_literal_global_318_1;
    goto LABEL_9;
  }
  BOOL v16 = [(CKChatInputController *)self stickerReactionSession];

  if (v16) {
    [(CKChatInputController *)self dismissStickerPickerPreservingChatItem:1 completion:0];
  }
LABEL_12:
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  if ([(CKChatInputController *)self switcherPluginCanMessageAPIOnBehalfOfPlugin:v8])
  {
    uint64_t v7 = [v8 isEqualToString:*MEMORY[0x1E4F6CB80]];
  }
  else
  {
    uint64_t v7 = 0;
  }
  v6[2](v6, v7);
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  uint64_t v7 = (void (**)(void))a5;
  if (-[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v8)&& [v8 isEqualToString:*MEMORY[0x1E4F6CB80]])
  {
    [(CKChatInputController *)self presentAppStoreForURL:0];
  }
  if (v7) {
    v7[2](v7);
  }
}

- (void)requestPresentationStyleExpanded:(BOOL)a3 forPlugin:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [NSNumber numberWithBool:v4];
  if ([(CKChatInputController *)self currentPluginIsDT])
  {
    [(CKChatInputController *)self _deferredRequestPresentationStyleExpanded:v6];
  }
  else if ([(CKChatInputController *)self switcherPluginCanMessageAPIOnBehalfOfPlugin:v7])
  {
    [(CKChatInputController *)self performSelector:sel__deferredRequestPresentationStyleExpanded_ withObject:v6 afterDelay:0.1];
  }
}

- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 preferredContentSize:(CGSize)a4
{
}

- (void)requestTransitionPluginFromFullScreen:(id)a3 toExpanded:(BOOL)a4
{
  id v6 = a3;
  [(CKChatInputController *)self _deferredDismissToKeyboardAndFocusEntryView:MEMORY[0x1E4F1CC28]];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CKChatInputController_requestTransitionPluginFromFullScreen_toExpanded___block_invoke;
  block[3] = &unk_1E5623DE8;
  BOOL v11 = a4;
  id v9 = v6;
  int v10 = self;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__CKChatInputController_requestTransitionPluginFromFullScreen_toExpanded___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  id v4 = +[CKBalloonPluginManager sharedInstance];
  id v3 = [v4 pluginForExtensionIdentifier:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) showBrowserForPlugin:v3 dataSource:0 style:v2];
}

- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 dataSource:(id)a4 skipValidation:(BOOL)a5
{
}

- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 dataSource:(id)a4 preferredContentSize:(CGSize)a5 skipValidation:(BOOL)a6
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  id v11 = a3;
  id v12 = a4;
  if (a6
    || [(CKChatInputController *)self switcherPluginCanMessageAPIOnBehalfOfPlugin:v11])
  {
    dispatch_time_t v13 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __121__CKChatInputController_requestPresentationStyleFullScreenModalForPlugin_dataSource_preferredContentSize_skipValidation___block_invoke;
    block[3] = &unk_1E562A080;
    void block[4] = self;
    id v15 = v11;
    id v16 = v12;
    CGFloat v17 = width;
    CGFloat v18 = height;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __121__CKChatInputController_requestPresentationStyleFullScreenModalForPlugin_dataSource_preferredContentSize_skipValidation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deferredRequestFullScreenModalForPluginIdentifier:dataSource:preferredContentSize:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_deferredRequestPresentationStyleExpanded:(id)a3
{
  unsigned int v4 = [a3 BOOLValue];
  if (CKIsAppCardsEnabled())
  {
    id v6 = [(CKChatInputController *)self appCardPresentationOverseer];
    [v6 requestPresentationStyle:v4 animated:1];
  }
  else
  {
    int v5 = [(CKChatInputController *)self browserSwitcher];
    id v6 = v5;
    if (v4) {
      [v5 transitionToFullscreen];
    }
    else {
      [v5 transitionToCollapsed];
    }
  }
}

- (void)_deferredRequestFullScreenModalForPluginIdentifier:(id)a3 dataSource:(id)a4 preferredContentSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  id v10 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    id v11 = [(CKChatInputController *)self delegate];
    id v12 = [v11 viewControllerForChatInputModalPresentation];
    dispatch_time_t v13 = [v12 presentedViewController];

    if ([v13 conformsToProtocol:&unk_1EDFCFEB0]) {
      [(CKChatInputController *)self setMacBrowserViewController:v13];
    }
  }
  BOOL v14 = [MEMORY[0x1E4F6BC18] sharedInstance];
  id v16 = [v14 balloonPluginForBundleID:v10];

  id v15 = [(CKChatInputController *)self browserSwitcher];
  objc_msgSend(v15, "showBrowserFullscreenModalForPlugin:datasource:preferredContentSize:", v16, v9, width, height);
}

- (BOOL)_isAppBrowserFullScreen
{
  if (CKIsAppCardsEnabled())
  {
    id v3 = [(CKChatInputController *)self appCardPresentationOverseer];
    char v4 = [v3 isExpanded];
  }
  else
  {
    id v3 = [(CKChatInputController *)self browserSwitcher];
    int v5 = [v3 transitionCoordinator];
    char v4 = [v5 currentConsumer] == 2;
  }
  return v4;
}

- (BOOL)_shouldDeferCallbackForInsertingPayload
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isSendMenuEnabled];

  if (v4)
  {
    return [(CKChatInputController *)self _isAppBrowserFullScreen];
  }
  else
  {
    id v6 = [(CKChatInputController *)self entryView];
    if ([v6 entryFieldCollapsed]) {
      BOOL v7 = [(CKChatInputController *)self _isAppBrowserFullScreen];
    }
    else {
      BOOL v7 = 1;
    }

    return v7;
  }
}

- (void)startEditingPayloadBypassingValidation:(id)a3 forPlugin:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  if (v10)
  {
    if ([(CKChatInputController *)self _shouldDeferCallbackForInsertingPayload])
    {
      [(CKChatInputController *)self setInsertPayloadCompletionHandler:v10];
    }
    else
    {
      v10[2](v10, 0);
    }
  }
  dispatch_time_t v11 = dispatch_time(0, 100000000);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  id v16 = __85__CKChatInputController_startEditingPayloadBypassingValidation_forPlugin_completion___block_invoke;
  CGFloat v17 = &unk_1E5620AF8;
  CGFloat v18 = self;
  id v19 = v8;
  id v12 = v8;
  dispatch_after(v11, MEMORY[0x1E4F14428], &v14);
  dispatch_time_t v13 = +[CKBalloonPluginManager sharedInstance];
  [v13 updateInteractionTimeForPlugin:v9];
}

uint64_t __85__CKChatInputController_startEditingPayloadBypassingValidation_forPlugin_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startEditingPayload:*(void *)(a1 + 40)];
}

- (void)appendMediaPayloadToText:(id)a3
{
  id v4 = a3;
  id v5 = [(CKChatInputController *)self delegate];
  [v5 chatInputController:self didRequestAppendToCompositionForPayload:v4];
}

- (void)startEditingPayload:(id)a3
{
  id v6 = a3;
  id v4 = [(CKChatInputController *)self entryView];
  id v5 = [v4 contentView];
  [v5 prepareForShelfPayloadAnimation];

  [(CKChatInputController *)self _startEditingPayload:v6];
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4
{
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5
{
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  if ([(CKChatInputController *)self currentPluginIsDT]
    || [(CKChatInputController *)self handwritingIsDisplayed])
  {
    [(CKChatInputController *)self startEditingPayload:v10];
  }
  else if ([(CKChatInputController *)self _pluginCanMessageAPI:v11] {
         || [(CKChatInputController *)self switcherPluginCanMessageAPIOnBehalfOfPlugin:v11])
  }
  {
    if (v12)
    {
      if ([(CKChatInputController *)self _shouldDeferCallbackForInsertingPayload])
      {
        [(CKChatInputController *)self setInsertPayloadCompletionHandler:v12];
      }
      else
      {
        v12[2](v12, 0);
      }
    }
    dispatch_time_t v16 = dispatch_time(0, 100000000);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __74__CKChatInputController_startEditingPayload_dismiss_forPlugin_completion___block_invoke;
    int v20 = &unk_1E5620AF8;
    BOOL v21 = self;
    id v22 = v10;
    dispatch_after(v16, MEMORY[0x1E4F14428], &v17);
  }
  dispatch_time_t v13 = +[CKBalloonPluginManager sharedInstance];
  [v13 updateInteractionTimeForPlugin:v11];

  if (v8)
  {
    [(CKChatInputController *)self dismiss];
    uint64_t v14 = [(CKChatInputController *)self handwritingPresentationController];

    if (v14)
    {
      uint64_t v15 = [(CKChatInputController *)self handwritingPresentationController];
      [v15 setVisible:0 animated:1];
    }
  }
}

uint64_t __74__CKChatInputController_startEditingPayload_dismiss_forPlugin_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startEditingPayload:*(void *)(a1 + 40)];
}

- (void)_startEditingPayload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pluginBundleID];

  if (!v5)
  {
    id v6 = [(CKChatInputController *)self pluginBundleID];
    [v4 setPluginBundleID:v6];
  }
  [v4 setIsFromMe:1];
  if (v4)
  {
    if ([v4 shouldExpire]) {
      id v7 = +[CKComposition newExpirableCompositionWithText:0 subject:0 shelfPluginPayload:v4];
    }
    else {
      id v7 = 0;
    }
    [(CKChatInputController *)self setIsDisplayingReplaceCompositionAlert:0];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    dispatch_time_t v13 = __46__CKChatInputController__startEditingPayload___block_invoke;
    uint64_t v14 = &unk_1E56237D8;
    uint64_t v15 = self;
    id v8 = v4;
    id v16 = v8;
    id v9 = _Block_copy(&v11);
    id v10 = v9;
    if (v7) {
      (*((void (**)(void *, id, void))v9 + 2))(v9, v7, 0);
    }
    else {
      +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v8, v9, v11, v12, v13, v14, v15);
    }
  }
  else if ([(CKChatInputController *)self handwritingIsDisplayed])
  {
    [(CKChatInputController *)self dismissBrowserViewController];
  }
}

void __46__CKChatInputController__startEditingPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) eagerUploadPayload:*(void *)(a1 + 40) identifier:0 replace:1];
    id v4 = [*(id *)(a1 + 32) entryView];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __46__CKChatInputController__startEditingPayload___block_invoke_2;
    v8[3] = &unk_1E562A0D0;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v9 = v5;
    uint64_t v10 = v6;
    id v11 = v3;
    id v12 = v4;
    id v7 = v4;
    [v7 compositionWithAcceptedAutocorrection:v8];
  }
}

void __46__CKChatInputController__startEditingPayload___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 shelfPluginPayload];
  id v5 = [v4 pluginBundleID];
  uint64_t v6 = [*(id *)(a1 + 32) pluginBundleID];
  char v7 = [v5 isEqualToString:v6];

  id v38 = [v4 pluginBundleID];
  if ([v38 isEqualToString:*MEMORY[0x1E4F6CBF8]]) {
    char v8 = 1;
  }
  else {
    char v8 = [v38 containsString:*MEMORY[0x1E4F6CC00]];
  }
  if ([*(id *)(a1 + 40) _isiMessageConversation])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Insert extension file and ask for MMCS prewarm", buf, 2u);
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    [v10 preWarmConnection];
  }
  id v11 = *(void **)(a1 + 48);
  if (v3)
  {
    id v12 = [v3 compositionByAppendingComposition:v11];
  }
  else
  {
    id v12 = v11;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CKChatInputController__startEditingPayload___block_invoke_563;
  aBlock[3] = &unk_1E562A0A8;
  id v41 = *(id *)(a1 + 56);
  id v13 = v12;
  char v44 = v8;
  uint64_t v14 = *(void *)(a1 + 40);
  id v37 = v13;
  id v42 = v13;
  uint64_t v43 = v14;
  uint64_t v15 = (void (**)(void *, void))_Block_copy(aBlock);
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __46__CKChatInputController__startEditingPayload___block_invoke_2_564;
  v39[3] = &unk_1E5621178;
  v39[4] = *(void *)(a1 + 40);
  id v16 = _Block_copy(v39);
  if (([*(id *)(a1 + 32) supportsSendLater] & 1) != 0
    || ([*(id *)(a1 + 40) entryView],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        [v17 sendLaterPluginInfo],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        BOOL v19 = v18 == 0,
        v18,
        v17,
        v19))
  {
    if (v4) {
      char v24 = v7;
    }
    else {
      char v24 = 1;
    }
    if (v24)
    {
      v15[2](v15, 0);
    }
    else
    {
      [*(id *)(a1 + 40) setIsDisplayingReplaceCompositionAlert:1];
      double v25 = CKFrameworkBundle();
      __int16 v26 = [v25 localizedStringForKey:@"SHELF_REPLACE_ITEM_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      int v27 = CKFrameworkBundle();
      uint64_t v28 = [v27 localizedStringForKey:@"SHELF_REPLACE_ITEM" value:&stru_1EDE4CA38 table:@"ChatKit"];
      NSPoint v29 = +[CKAlertController alertControllerWithTitle:v26 message:v28 preferredStyle:1];

      unint64_t v30 = CKFrameworkBundle();
      uint64_t v31 = [v30 localizedStringForKey:@"SHELF_REPLACE_ITEM_OK_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      double v32 = +[CKAlertAction actionWithTitle:v31 style:0 handler:v15];
      [v29 addAction:v32];

      id v33 = CKFrameworkBundle();
      id v34 = [v33 localizedStringForKey:@"SHELF_REPLACE_ITEM_CANCEL_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      double v35 = +[CKAlertAction actionWithTitle:v34 style:0 handler:v16];
      [v29 addAction:v35];

      id v36 = [*(id *)(a1 + 40) delegate];
      [v29 presentFromViewController:v36 animated:1 completion:0];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        BOOL v21 = [*(id *)(a1 + 32) pluginBundleID];
        *(_DWORD *)buf = 138412290;
        int v46 = v21;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "_startEditingPayload: Plugin bundle ID (%@) not supported for Send Later. Presenting alert and aborting.", buf, 0xCu);
      }
    }
    id v22 = *(void **)(a1 + 40);
    double v23 = [*(id *)(a1 + 32) pluginBundleID];
    [v22 _presentSendLaterUnsupportedAlertForIdentifier:v23 handler:v16];
  }
}

uint64_t __46__CKChatInputController__startEditingPayload___block_invoke_563(uint64_t a1)
{
  [*(id *)(a1 + 32) setComposition:*(void *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = +[CKBalloonPluginManager sharedInstance];
    [v2 invalidatePhotosPlugin];
  }
  uint64_t v3 = [*(id *)(a1 + 48) insertPayloadCompletionHandler];
  if (v3)
  {
    id v4 = (void *)v3;
    if ([*(id *)(a1 + 48) _isAppBrowserFullScreen])
    {
    }
    else
    {
      char v5 = [*(id *)(a1 + 48) appModalIsDisplayed];

      if ((v5 & 1) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t v6 = [*(id *)(a1 + 48) insertPayloadCompletionHandler];
    v6[2](v6, 0);

    [*(id *)(a1 + 48) setInsertPayloadCompletionHandler:0];
  }
LABEL_8:
  [*(id *)(a1 + 48) dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded];
  char v7 = *(void **)(a1 + 48);

  return [v7 setIsDisplayingReplaceCompositionAlert:0];
}

uint64_t __46__CKChatInputController__startEditingPayload___block_invoke_2_564(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setIsDisplayingReplaceCompositionAlert:0];
}

- (void)dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded
{
  if (self->_dismissPluginAfterReplaceAlertInteractedWith)
  {
    [(CKChatInputController *)self performSelector:sel__deferredDismissToKeyboardAndFocusEntryView_ withObject:MEMORY[0x1E4F1CC38] afterDelay:0.1];
    self->_dismissPluginAfterReplaceAlertInteractedWith = 0;
  }
}

- (BOOL)_shouldSendTypingIndicatorDataForPluginIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    BOOL v4 = [v3 rangeOfString:*MEMORY[0x1E4F6CBE8]] != 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)pluginBundleID
{
  id v3 = [(CKChatInputController *)self handwritingPresentationController];
  int v4 = [v3 visible];

  if (v4)
  {
    char v5 = [(CKChatInputController *)self handwritingPresentationController];
    [v5 pluginBundleID];
  }
  else
  {
    char v5 = [(CKChatInputController *)self browserPlugin];
    [v5 identifier];
  uint64_t v6 = };

  return v6;
}

- (void)setLocalUserIsTyping:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(CKChatInputController *)self pluginBundleID];
  BOOL v6 = [(CKChatInputController *)self _shouldSendTypingIndicatorDataForPluginIdentifier:v5];

  if (v6)
  {
    char v7 = [(CKChatInputController *)self browserPlugin];
    objc_msgSend(v7, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:", 0.2);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }
  char v8 = [(CKChatInputController *)self delegate];
  id v9 = [(CKChatInputController *)self pluginBundleID];
  [v8 setLocalUserIsComposing:v3 withPluginBundleID:v9 typingIndicatorData:v10];
}

- (void)expandedAppViewControllerWantsToCollapse:(id)a3
{
  id v4 = [NSNumber numberWithBool:0];
  [(CKChatInputController *)self _deferredRequestPresentationStyleExpanded:v4];
}

- (void)showEntryViewPhotosShelf:(id)a3 completion:(id)a4
{
  id v49 = a3;
  BOOL v6 = (void (**)(id, uint64_t))a4;
  char v7 = IMBalloonExtensionIDWithSuffix();
  char v8 = [(CKChatInputController *)self entryView];
  id v9 = [v8 composition];
  id v10 = [v9 shelfPluginPayload];

  id v11 = [v10 pluginBundleID];
  int v48 = [v11 isEqualToString:*MEMORY[0x1E4F6CBF8]];
  if (v7)
  {
    id v12 = IMBalloonExtensionIDWithSuffix();
    int v13 = [v7 isEqualToString:v12];
  }
  else
  {
    uint64_t v14 = v11;
    id v12 = [v10 pluginBundleID];
    uint64_t v15 = IMBalloonExtensionIDWithSuffix();
    if ([v12 isEqualToString:v15]) {
      int v13 = [v10 shouldSendAsMediaObject];
    }
    else {
      int v13 = 0;
    }

    id v11 = v14;
  }

  id v16 = objc_alloc_init(CKBrowserItemPayload);
  uint64_t v47 = v7;
  [(CKBrowserItemPayload *)v16 setPluginBundleID:v7];
  [(CKBrowserItemPayload *)v16 setPhotoShelfViewController:v49];
  uint64_t v17 = +[CKComposition compositionWithShelfPluginPayload:v16];
  uint64_t v18 = [(CKChatInputController *)self entryView];
  BOOL v19 = [v18 composition];

  int v20 = [v19 shelfPluginPayload];

  if ([(CKChatInputController *)self _isiMessageConversation])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "User insert Photo and ask for MMCS prewarm", buf, 2u);
      }
    }
    id v22 = [MEMORY[0x1E4F6BCC8] sharedInstance];
    [v22 preWarmConnection];
  }
  int v46 = v17;
  if (v19)
  {
    id v23 = [v19 compositionByAppendingComposition:v17];
  }
  else
  {
    id v23 = v17;
  }
  if (v20) {
    int v24 = v48;
  }
  else {
    int v24 = 1;
  }
  if ((v24 | v13))
  {
    double v25 = [(CKChatInputController *)self entryView];

    if (v25)
    {
      __int16 v26 = [(CKChatInputController *)self entryView];
      [v26 setComposition:v23];
    }
    else
    {
      [(CKChatInputController *)self setDeferredComposition:v23];
    }
    uint64_t v43 = v10;
    id v42 = v47;
    if (v6) {
      v6[2](v6, 1);
    }
  }
  else
  {
    int v27 = CKFrameworkBundle();
    char v44 = v16;
    [v27 localizedStringForKey:@"SHELF_REPLACE_ITEM_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v28 = v45 = v11;
    CKFrameworkBundle();
    v30 = NSPoint v29 = v6;
    uint64_t v31 = [v30 localizedStringForKey:@"SHELF_REPLACE_ITEM" value:&stru_1EDE4CA38 table:@"ChatKit"];
    double v32 = +[CKAlertController alertControllerWithTitle:v28 message:v31 preferredStyle:1];

    id v33 = CKFrameworkBundle();
    id v34 = [v33 localizedStringForKey:@"SHELF_REPLACE_ITEM_OK_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __61__CKChatInputController_showEntryViewPhotosShelf_completion___block_invoke;
    v53[3] = &unk_1E5623030;
    v53[4] = self;
    id v54 = v23;
    double v35 = v29;
    id v55 = v35;
    id v36 = +[CKAlertAction actionWithTitle:v34 style:0 handler:v53];
    [v32 addAction:v36];

    BOOL v6 = v29;
    id v37 = CKFrameworkBundle();
    id v38 = [v37 localizedStringForKey:@"SHELF_REPLACE_ITEM_CANCEL_ACTION_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __61__CKChatInputController_showEntryViewPhotosShelf_completion___block_invoke_2;
    v50[3] = &unk_1E562A0F8;
    char v52 = v48;
    v50[4] = self;
    int v39 = v35;
    id v11 = v45;
    id v51 = v39;
    double v40 = +[CKAlertAction actionWithTitle:v38 style:0 handler:v50];
    [v32 addAction:v40];

    id v16 = v44;
    id v41 = [(CKChatInputController *)self delegate];
    [v32 presentFromViewController:v41 animated:1 completion:0];

    uint64_t v43 = v10;
    id v42 = v47;
  }
}

uint64_t __61__CKChatInputController_showEntryViewPhotosShelf_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryView];
  [v2 setComposition:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __61__CKChatInputController_showEntryViewPhotosShelf_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    BOOL v3 = +[CKBalloonPluginManager sharedInstance];
    [v3 invalidatePhotosPlugin];

    [*(id *)(a1 + 32) _loadPhotosBrowser];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)generatePreviewAndStoreInCacheForSendingPhotoFromPayload:(id)a3
{
  id v4 = [a3 fileURL];
  [(CKChatInputController *)self _beginPreviewCreationWithFileURL:v4];
}

+ (id)previewQueue
{
  if (previewQueue_onceToken_0 != -1) {
    dispatch_once(&previewQueue_onceToken_0, &__block_literal_global_580_0);
  }
  uint64_t v2 = (void *)previewQueue__previewQueue_0;

  return v2;
}

uint64_t __37__CKChatInputController_previewQueue__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  id v1 = (void *)previewQueue__previewQueue_0;
  previewQueue__previewQueue_0 = (uint64_t)v0;

  [(id)previewQueue__previewQueue_0 setQualityOfService:33];
  uint64_t v2 = (void *)previewQueue__previewQueue_0;

  return [v2 setMaxConcurrentOperationCount:-1];
}

- (void)_beginPreviewCreationWithFileURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [[CKDBFileTransfer alloc] initWithFileURL:v4 transcoderUserInfo:0 attributionInfo:0 hideAttachment:0];
    BOOL v6 = [v4 lastPathComponent];
    [(CKDBFileTransfer *)v5 setFilename:v6];

    [(CKDBFileTransfer *)v5 setTransferState:5];
    [(CKDBFileTransfer *)v5 setPreviewGenerationState:1];
    char v7 = +[CKMediaObjectManager sharedInstance];
    char v8 = [(CKDBFileTransfer *)v5 filename];
    id v9 = (objc_class *)[v7 classForFilename:v8];

    id v10 = +[CKMessageContext selfContext];
    id v11 = (void *)[[v9 alloc] initWithTransfer:v5 context:v10 forceInlinePreview:1];
    id v12 = +[CKUIBehavior sharedBehaviors];
    [v12 previewMaxWidth];
    uint64_t v14 = v13;

    uint64_t v15 = [v11 previewCacheKeyWithOrientation:1];
    id v16 = [(CKChatInputController *)self delegate];
    uint64_t v17 = [v16 fileURLKeyToGuidMapping];
    [v17 setObject:v15 forKey:v4];

    if (([v11 needsAnimation] & 1) == 0)
    {
      uint64_t v18 = +[CKChatInputController previewQueue];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __58__CKChatInputController__beginPreviewCreationWithFileURL___block_invoke;
      v19[3] = &unk_1E5622950;
      id v20 = v11;
      uint64_t v21 = v14;
      [v18 addOperationWithBlock:v19];
    }
  }
  else
  {
    IMLogHandleForCategory();
    id v5 = (CKDBFileTransfer *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
      -[CKChatInputController _beginPreviewCreationWithFileURL:]();
    }
  }
}

id __58__CKChatInputController__beginPreviewCreationWithFileURL___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) previewForWidth:1 orientation:*(double *)(a1 + 40)];
}

- (void)showModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(CKChatInputController *)self appCardPresentationOverseer];
  int v11 = [v10 isPresentingCard];

  if (v11)
  {
    id v13 = [(CKChatInputController *)self appCardPresentationOverseer];
    id v12 = [v13 containerViewController];
    [v12 presentViewController:v9 animated:v5 completion:v8];

    id v8 = v9;
    id v9 = v12;
  }
  else
  {
    id v13 = [(CKChatInputController *)self delegate];
    [v13 chatInputController:self presentShelfModal:v9 animated:v5 completion:v8];
  }
}

- (void)dismissEntryViewShelf
{
  BOOL v3 = [(CKChatInputController *)self dismissEntryViewShelfUpdater];
  char v4 = [v3 isHoldingUpdates];

  if ((v4 & 1) == 0)
  {
    id v5 = [(CKChatInputController *)self entryView];
    [v5 invalidateCompositionForReason:2];
  }
}

- (id)workingDirForDraft
{
  return [(CKChatInputController *)self workingDraftDirForPluginIdentifier:*MEMORY[0x1E4F6CBF8]];
}

- (id)workingDraftDirForPluginIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKChatInputController *)self targetConversation];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = @"Pending";
      goto LABEL_6;
    }
    BOOL v6 = [v5 uniqueIdentifier];
    if (v6)
    {
LABEL_6:
      id v8 = CKPluginTmpSubDirectoryURL(v6, v4);
      id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v15 = 0;
      [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v15];
      id v7 = v15;

      if (v8) {
        goto LABEL_20;
      }
      goto LABEL_9;
    }
    id v7 = 0;
  }
  else
  {
    id v7 = 0;
    BOOL v6 = 0;
  }
LABEL_9:
  id v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[CKChatInputController workingDraftDirForPluginIdentifier:]();
  }

  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Failure info - guid: %@, error: %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [(CKChatInputController *)self entryView];
      *(_DWORD *)buf = 138412290;
      uint64_t v17 = v13;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Failure info - entryView: %@", buf, 0xCu);
    }
  }
  id v8 = 0;
LABEL_20:

  return v8;
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = IMBalloonExtensionIDWithSuffix();
  int v11 = +[CKBalloonPluginManager sharedInstance];
  id v12 = [v11 viewControllerForPluginIdentifier:v10];

  [v12 setSendDelegate:self];
  if (objc_opt_respondsToSelector())
  {
    [v12 _stageAssetArchive:v8 skipShelf:v6 completionHandler:v9];
  }
  else if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Failed to dispatch asset archive to the photos browser", v14, 2u);
    }
  }
}

- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = IMBalloonExtensionIDWithSuffix();
  id v9 = +[CKBalloonPluginManager sharedInstance];
  id v10 = [v9 viewControllerForPluginIdentifier:v8];

  [v10 setSendDelegate:self];
  if (objc_opt_respondsToSelector())
  {
    [v10 _removeAssetArchiveWithIdentifier:v6 completionHandler:v7];
  }
  else if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Failed to dispatch asset archive removal to the photos browser", v12, 2u);
    }
  }
}

- (void)notifyActiveBrowserAssetArchiveWasRemoved:(id)a3
{
  id v8 = a3;
  if ([(CKChatInputController *)self currentPluginIsPhotos]
    || [(CKChatInputController *)self currentPluginIsGenerativePlayground])
  {
    uint64_t v4 = IMBalloonExtensionIDWithSuffix();
    if (v4)
    {
      id v5 = (void *)v4;
      id v6 = +[CKBalloonPluginManager sharedInstance];
      id v7 = [v6 viewControllerForPluginIdentifier:v5];

      [v7 _assetArchiveRemoved:v8];
    }
  }
}

- (id)configurePhotosDraftAssetArchivesWithConversationID:(id)a3
{
  id v4 = a3;
  id v5 = IMBalloonExtensionIDWithSuffix();
  id v6 = +[CKBalloonPluginManager sharedInstance];
  id v7 = [v6 viewControllerForPluginIdentifier:v5];

  [v7 setSendDelegate:self];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v7 _configurePhotosDraftAssetArchivesWithConversationID:v4];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v11 = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Failed to dispatch configureDraftAssetArchives to the photos browser", v11, 2u);
      }
    }
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void)didStageAssetArchive:(id)a3 identifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6E6D0] sharedManager];
  if ([v8 checksForSensitivityOnSend])
  {
    id v9 = [v6 mediaObjectFromPayload];
    id v10 = [MEMORY[0x1E4F6E6C8] sharedManager];
    int v11 = [v9 fileURL];
    id v12 = [(CKChatInputController *)self targetConversation];
    id v13 = [v12 chat];
    uint64_t v14 = [v13 chatIdentifier];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __57__CKChatInputController_didStageAssetArchive_identifier___block_invoke;
    v16[3] = &unk_1E56211F0;
    id v17 = v9;
    id v15 = v9;
    [v10 isSensitiveContent:v11 withChatID:v14 completionHandler:v16];
  }
  [(CKChatInputController *)self eagerUploadPayload:v6 identifier:v7 replace:0];
}

void __57__CKChatInputController_didStageAssetArchive_identifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [*(id *)(a1 + 32) filename];
      id v8 = (void *)v7;
      id v9 = @"NO";
      if (a2) {
        id v9 = @"YES";
      }
      int v10 = 138412546;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Staged asset %@ is sensitive: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)dismissPlugin
{
  [(CKChatInputController *)self dismiss];
  [(CKChatInputController *)self dismissBrowserViewController];
  BOOL v3 = [(CKChatInputController *)self handwritingPresentationController];

  if (v3)
  {
    id v4 = [(CKChatInputController *)self handwritingPresentationController];
    [v4 setVisible:0 animated:1];
  }
}

- (void)handwritingPresentationControllerDidShowHandwriting:(id)a3
{
  [(CKChatInputController *)self setShouldSuppressStatusBarForHandwriting:1];
  id v4 = [(CKChatInputController *)self delegate];
  [v4 chatInputControllerDidShowHandwriting:self];
}

- (void)handwritingPresentationControllerWillHideHandwriting:(id)a3
{
  [(CKChatInputController *)self setShouldSuppressStatusBarForHandwriting:0];
  id v4 = [(CKChatInputController *)self delegate];
  [v4 chatInputControllerWillHideHandwriting:self];
}

- (void)didBeginInstallingAppWithBundleIdentifier:(id)a3
{
  id v7 = a3;
  if (!v7)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CKChatInputController.m" lineNumber:4137 description:@"Cannot call -didBeginInstallingAppWithBundleIdentifier: with nil identifier!"];
  }
  id v5 = +[CKAppInstallationWatcher sharedInstance];
  [v5 startListeningForAppBundleIdentifier:v7];
}

- (void)openAppExtensionWithAdamID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = objc_msgSend(MEMORY[0x1E4F6BC18], "sharedInstance", 0);
  id v6 = [v5 allPlugins];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v6);
      }
      int v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v10 adamID];
        char v12 = [v11 isEqualToNumber:v4];

        if (v12) {
          break;
        }
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
    id v13 = v10;

    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = [(CKChatInputController *)self browserSwitcher];
    id v15 = [v14 transitionCoordinator];
    unsigned int v16 = [v15 isExpanded];

    id v17 = [(CKChatInputController *)self deferredPluginDataSource];
    [(CKChatInputController *)self showBrowserForPlugin:v13 dataSource:v17 style:v16];

    [(CKChatInputController *)self setDeferredPluginDataSource:0];
  }
  else
  {
LABEL_10:

LABEL_13:
    if (IMOSLoggingEnabled())
    {
      __int16 v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v4;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Failed to find and open app with adam ID: %@", buf, 0xCu);
      }
    }
  }
}

- (void)deviceOrientationManager:(id)a3 orientationDidChange:(int64_t)a4
{
  id v4 = [(CKChatInputController *)self orientationUpdater];
  [v4 setNeedsUpdate];
}

- (void)showFindMyPlugin
{
  IMBalloonExtensionIDWithSuffix();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(CKChatInputController *)self showPluginWithExtensionIdentifier:v3];
}

- (void)showPluginWithExtensionIdentifier:(id)a3
{
}

- (unint64_t)appPresentationStyleForShowingPluginID:(id)a3
{
  id v4 = a3;
  id v5 = [(CKChatInputController *)self delegate];
  id v6 = [v5 viewControllerForChatInputModalPresentation];
  uint64_t v7 = [v6 traitCollection];

  unint64_t v8 = -[CKChatInputController presentationStyleInOrientation:inPopover:forPluginID:](self, "presentationStyleInOrientation:inPopover:forPluginID:", [v5 sceneInterfaceOrientation], -[CKChatInputController determineSendMenuPresentationStyleCompatibleWithTraitCollection:](self, "determineSendMenuPresentationStyleCompatibleWithTraitCollection:", v7) == 1, v4);
  return v8;
}

- (void)showPluginWithExtensionIdentifier:(id)a3 sourceView:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = +[CKBalloonPluginManager sharedInstance];
  unint64_t v8 = [v7 pluginForExtensionIdentifier:v11];
  if (v8)
  {
    unint64_t v9 = [(CKChatInputController *)self appPresentationStyleForShowingPluginID:v11];
    if (v6) {
      int v10 = [[CKTranscriptPluginPresentationConfiguration alloc] initWithSourceView:v6 permittedArrowDirections:15 shouldDisableSnapshotView:0];
    }
    else {
      int v10 = 0;
    }
    [(CKChatInputController *)self showBrowserForPlugin:v8 dataSource:0 style:v9 presentationConfiguration:v10];
  }
}

- (void)browserAppManagerDidSelectPlugin:(id)a3
{
}

- (void)willSendComposition
{
}

- (void)eagerUploadCancelIdentifier:(id)a3
{
}

- (void)eagerUploadPayload:(id)a3 identifier:(id)a4 replace:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if ([(CKChatInputController *)self _isiMessageConversation])
  {
    int v10 = [(CKChatInputController *)self targetConversation];
    if (([v10 isBusinessConversation] & 1) == 0)
    {
      id v11 = _os_activity_create(&dword_18EF18000, "com.apple.messages.iMessageAttachmentEagerUpload", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      v20.opaque[0] = 0;
      v20.opaque[1] = 0;
      os_activity_scope_enter(v11, &v20);
      char v12 = [v8 mediaObjectFromPayload];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || ([v12 duration], double v14 = v13, objc_msgSend(v10, "maxTrimDurationForMedia:", v12), v14 <= v15))
      {
        unsigned int v16 = [v12 transfer];
        BOOL v17 = CKFileSizeEligibleForEagerUpload([v16 totalBytes]);

        if (v17)
        {
          eagerUploadController = self->_eagerUploadController;
          long long v19 = [(CKChatInputController *)self participantHandles];
          [(CKChatEagerUploadController *)eagerUploadController uploadPayload:v8 identifier:v9 replace:v5 recipients:v19];
        }
      }

      os_activity_scope_leave(&v20);
    }
  }
}

- (id)participantHandles
{
  uint64_t v2 = [(CKChatInputController *)self targetConversation];
  id v3 = [v2 senderIdentifier];
  id v4 = IMChatCanonicalIDSIDsForAddress();

  if (v4)
  {
    BOOL v5 = [v2 recipients];
    id v6 = objc_msgSend(v5, "__im_canonicalIDSAddressesFromEntities");
    uint64_t v7 = [v6 arrayByAddingObject:v4];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "canonicalAddress is nil!", v10, 2u);
      }
    }
    BOOL v5 = [v2 recipients];
    uint64_t v7 = objc_msgSend(v5, "__im_canonicalIDSAddressesFromEntities");
  }

  return v7;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v5 = a3;
  if ([(CKChatInputController *)self isPresentingStickerPicker])
  {
    id v4 = [(CKChatInputController *)self delegate];
    [v4 inputController:self willDismissPresentationController:v5];

    [(CKChatInputController *)self endStickerReactionSession];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v7 = a3;
  id v4 = [v7 presentedViewController];
  int v5 = [v4 conformsToProtocol:&unk_1EDFCFEB0];

  if (v5
    && CKIsRunningInMacCatalyst()
    && ![(CKChatInputController *)self appModalIsDisplayed])
  {
    [(CKChatInputController *)self browserWillDismiss];
    id v6 = [v7 presentedViewController];
    if (objc_opt_respondsToSelector()) {
      [v6 deferredForceTearDownRemoteView];
    }
  }
}

- (BOOL)currentPluginAppDidRecieveTouchForSendAPI
{
  return self->_currentPluginAppDidRecieveTouchForSendAPI;
}

- (CKChatInputControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKChatInputControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKExternalPluginViewControllerProvider)externalPluginControllerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalPluginControllerProvider);

  return (CKExternalPluginViewControllerProvider *)WeakRetained;
}

- (void)setExternalPluginControllerProvider:(id)a3
{
}

- (IMBalloonPlugin)browserPlugin
{
  return self->_browserPlugin;
}

- (IMBalloonPluginDataSource)browserPluginDataSource
{
  return self->_browserPluginDataSource;
}

- (void)setBrowserPluginDataSource:(id)a3
{
}

- (BOOL)isDismissingAppModal
{
  return self->_isDismissingAppModal;
}

- (BOOL)preventResignFirstResponder
{
  return self->_preventResignFirstResponder;
}

- (void)setPreventResignFirstResponder:(BOOL)a3
{
  self->_preventResignFirstResponder = a3;
}

- (UIViewController)statusBarStyleViewController
{
  return self->_statusBarStyleViewController;
}

- (void)setStatusBarStyleViewController:(id)a3
{
}

- (void)setTextInputPayloadController:(id)a3
{
}

- (CKMessagePartChatItem)stickerPickerMessagePartChatItem
{
  return self->_stickerPickerMessagePartChatItem;
}

- (void)setStickerPickerMessagePartChatItem:(id)a3
{
}

- (CKMessagePartChatItem)stickerPickerMessagePartParentChatItem
{
  return self->_stickerPickerMessagePartParentChatItem;
}

- (void)setStickerPickerMessagePartParentChatItem:(id)a3
{
}

- (double)appCardDismissPadding
{
  return self->_appCardDismissPadding;
}

- (BOOL)isAppCardDismissing
{
  return self->_isAppCardDismissing;
}

- (BOOL)isAppCardAppearing
{
  return self->_isAppCardAppearing;
}

- (BOOL)isAppCardUsingPopoverPresentation
{
  return self->_isAppCardUsingPopoverPresentation;
}

- (void)setIsAppCardUsingPopoverPresentation:(BOOL)a3
{
  self->_isAppCardUsingPopoverPresentation = a3;
}

- (BOOL)shouldSuppressStatusBarForHandwriting
{
  return self->_shouldSuppressStatusBarForHandwriting;
}

- (void)setShouldSuppressStatusBarForHandwriting:(BOOL)a3
{
  self->_shouldSuppressStatusBarForHandwriting = a3;
}

- (BOOL)shouldSuppressStatusBarForSendMenu
{
  return self->_shouldSuppressStatusBarForSendMenu;
}

- (void)setShouldSuppressStatusBarForSendMenu:(BOOL)a3
{
  self->_shouldSuppressStatusBarForSendMenu = a3;
}

- (BOOL)_isRunningPPT
{
  return self->__isRunningPPT;
}

- (void)set_isRunningPPT:(BOOL)a3
{
  self->__isRunningPPT = a3;
}

- (BOOL)isInputViewVisible
{
  return self->_inputViewVisible;
}

- (CKMessageEntryView)entryView
{
  return self->_entryView;
}

- (CKKeyboardContentViewController)currentInputViewController
{
  return self->_currentInputViewController;
}

- (BOOL)inputViewWillBecomeVisible
{
  return self->_inputViewWillBecomeVisible;
}

- (void)setInputViewWillBecomeVisible:(BOOL)a3
{
  self->_inputViewWillBecomeVisible = a3;
}

- (void)setSwitcherInputViewController:(id)a3
{
}

- (void)setBrowserSwitcher:(id)a3
{
}

- (void)setAppCardPresentationOverseer:(id)a3
{
}

- (void)setCurrentPluginAppDidRecieveTouchForSendAPI:(BOOL)a3
{
  self->_currentPluginAppDidRecieveTouchForSendAPI = a3;
}

- (CKDeviceOrientationManager)orientationManager
{
  return self->_orientationManager;
}

- (void)setOrientationManager:(id)a3
{
}

- (int64_t)lastSeenOrientation
{
  return self->_lastSeenOrientation;
}

- (void)setLastSeenOrientation:(int64_t)a3
{
  self->_lastSeenOrientation = a3;
}

- (UINavigationController)presentedBrowserNavigationController
{
  return self->_presentedBrowserNavigationController;
}

- (void)setPresentedBrowserNavigationController:(id)a3
{
}

- (CKBrowserViewControllerProtocol)macBrowserViewController
{
  return self->_macBrowserViewController;
}

- (void)setMacBrowserViewController:(id)a3
{
}

- (UINavigationController)wolfBrowserNavController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_wolfBrowserNavController);

  return (UINavigationController *)WeakRetained;
}

- (void)setWolfBrowserNavController:(id)a3
{
}

- (CKStickerReactionSession)stickerReactionSession
{
  return self->_stickerReactionSession;
}

- (void)setStickerReactionSession:(id)a3
{
}

- (BOOL)dismissPluginAfterReplaceAlertInteractedWith
{
  return self->_dismissPluginAfterReplaceAlertInteractedWith;
}

- (void)setDismissPluginAfterReplaceAlertInteractedWith:(BOOL)a3
{
  self->_dismissPluginAfterReplaceAlertInteractedWith = a3;
}

- (BOOL)isDisplayingReplaceCompositionAlert
{
  return self->_isDisplayingReplaceCompositionAlert;
}

- (void)setIsDisplayingReplaceCompositionAlert:(BOOL)a3
{
  self->_isDisplayingReplaceCompositionAlert = a3;
}

- (BOOL)keyboardIsHiding
{
  return self->_keyboardIsHiding;
}

- (void)setKeyboardIsHiding:(BOOL)a3
{
  self->_keyboardIsHiding = a3;
}

- (BOOL)keyboardIsVisible
{
  return self->_keyboardIsVisible;
}

- (void)setKeyboardIsVisible:(BOOL)a3
{
  self->_keyboardIsVisible = a3;
}

- (BOOL)isDismissingAppCardForKeyboardPresentation
{
  return self->_isDismissingAppCardForKeyboardPresentation;
}

- (void)setIsDismissingAppCardForKeyboardPresentation:(BOOL)a3
{
  self->_isDismissingAppCardForKeyboardPresentation = a3;
}

- (BOOL)inCollapseOrExpandAnimation
{
  return self->_inCollapseOrExpandAnimation;
}

- (void)setInCollapseOrExpandAnimation:(BOOL)a3
{
  self->_inCollapseOrExpandAnimation = a3;
}

- (IMScheduledUpdater)dismissEntryViewShelfUpdater
{
  return self->_dismissEntryViewShelfUpdater;
}

- (void)setDismissEntryViewShelfUpdater:(id)a3
{
}

- (unint64_t)savedStyleForDragCompletion
{
  return self->_savedStyleForDragCompletion;
}

- (void)setSavedStyleForDragCompletion:(unint64_t)a3
{
  self->_savedStyleForDragCompletion = a3;
}

- (CKScheduledUpdater)orientationUpdater
{
  return self->_orientationUpdater;
}

- (void)setOrientationUpdater:(id)a3
{
}

- (CKHandwritingPresentationController)handwritingPresentationController
{
  return self->_handwritingPresentationController;
}

- (void)setHandwritingPresentationController:(id)a3
{
}

- (BOOL)shouldRestoreAppSwitcher
{
  return self->_shouldRestoreAppSwitcher;
}

- (void)setShouldRestoreAppSwitcher:(BOOL)a3
{
  self->_shouldRestoreAppSwitcher = a3;
}

- (BOOL)didDismissAppCardForStickerDrag
{
  return self->_didDismissAppCardForStickerDrag;
}

- (void)setDidDismissAppCardForStickerDrag:(BOOL)a3
{
  self->_didDismissAppCardForStickerDrag = a3;
}

- (IMBalloonPlugin)pluginToResumeForStickerDrag
{
  return self->_pluginToResumeForStickerDrag;
}

- (void)setPluginToResumeForStickerDrag:(id)a3
{
}

- (id)insertPayloadCompletionHandler
{
  return self->_insertPayloadCompletionHandler;
}

- (void)setInsertPayloadCompletionHandler:(id)a3
{
}

- (IMBalloonPluginDataSource)deferredPluginDataSource
{
  return self->_deferredPluginDataSource;
}

- (void)setDeferredPluginDataSource:(id)a3
{
}

- (CKChatEagerUploadController)eagerUploadController
{
  return self->_eagerUploadController;
}

- (void)setEagerUploadController:(id)a3
{
}

- (BOOL)isAppCardDraggingBelowKeyboardDetent
{
  return self->_isAppCardDraggingBelowKeyboardDetent;
}

- (void)setIsAppCardDraggingBelowKeyboardDetent:(BOOL)a3
{
  self->_isAppCardDraggingBelowKeyboardDetent = a3;
}

- (CKTranscriptPluginPresentationConfiguration)currentPresentationConfig
{
  return self->_currentPresentationConfig;
}

- (void)setCurrentPresentationConfig:(id)a3
{
}

- (CKComposition)deferredComposition
{
  return self->_deferredComposition;
}

- (void)setDeferredComposition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredComposition, 0);
  objc_storeStrong((id *)&self->_currentPresentationConfig, 0);
  objc_storeStrong((id *)&self->_eagerUploadController, 0);
  objc_storeStrong((id *)&self->_deferredPluginDataSource, 0);
  objc_storeStrong(&self->_insertPayloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pluginToResumeForStickerDrag, 0);
  objc_storeStrong((id *)&self->_handwritingPresentationController, 0);
  objc_storeStrong((id *)&self->_orientationUpdater, 0);
  objc_storeStrong((id *)&self->_dismissEntryViewShelfUpdater, 0);
  objc_storeStrong((id *)&self->_stickerReactionSession, 0);
  objc_destroyWeak((id *)&self->_wolfBrowserNavController);
  objc_storeStrong((id *)&self->_macBrowserViewController, 0);
  objc_storeStrong((id *)&self->_presentedBrowserNavigationController, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_appCardPresentationOverseer, 0);
  objc_storeStrong((id *)&self->_browserSwitcher, 0);
  objc_storeStrong((id *)&self->_switcherInputViewController, 0);
  objc_storeStrong((id *)&self->_currentInputViewController, 0);
  objc_storeStrong((id *)&self->_entryView, 0);
  objc_storeStrong((id *)&self->_stickerPickerMessagePartParentChatItem, 0);
  objc_storeStrong((id *)&self->_stickerPickerMessagePartChatItem, 0);
  objc_storeStrong((id *)&self->_textInputPayloadController, 0);
  objc_storeStrong((id *)&self->_statusBarStyleViewController, 0);
  objc_storeStrong((id *)&self->_browserPluginDataSource, 0);
  objc_storeStrong((id *)&self->_browserPlugin, 0);
  objc_destroyWeak((id *)&self->_externalPluginControllerProvider);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerForTextInputPayloadHandling:(BOOL)a3 isGroupChat:(BOOL)a4
{
  v11[2] = *MEMORY[0x1E4F143B8];
  if (!CKIsRunningInMessagesViewService())
  {
    id v7 = [(CKChatInputController *)self textInputPayloadController];
    v11[0] = @"com.apple.messages.currentLocation";
    v11[1] = @"com.apple.messages.stageSticker";
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    if (+[CKMentionsUtilities supportsSupplementalLexiconMentions])
    {
      uint64_t v9 = [v8 arrayByAddingObject:@"com.apple.messages.mentions"];

      id v8 = (void *)v9;
    }
    if (!a3)
    {
      int v10 = [v8 arrayByAddingObject:@"com.apple.messages.photos"];

      if (!CKShouldShowSURF() || a4)
      {
        id v8 = v10;
      }
      else
      {
        id v8 = [v10 arrayByAddingObject:@"com.apple.messages.surf"];
      }
    }
    [getDDActionClass() setClientActionsDelegate:self];
    [v7 setSupportedPayloadIds:v8];
    [v7 setPayloadDelegate:self];
  }
}

- (void)registerForTextInputPayloadHandlingForSenderHandleID:(id)a3 receiverHandleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v9 = [v8 isZelkovaEnabled];

  if (v9)
  {
    int v10 = [MEMORY[0x1E4F6E940] sharedCoordinator];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __114__CKChatInputController_TextInputPayloads__registerForTextInputPayloadHandlingForSenderHandleID_receiverHandleID___block_invoke;
    void v11[3] = &unk_1E5625140;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v7;
    [v10 shouldShowKeyboardSuggestionForInitiator:v12 andReceiver:v13 completion:v11];
  }
}

void __114__CKChatInputController_TextInputPayloads__registerForTextInputPayloadHandlingForSenderHandleID_receiverHandleID___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __114__CKChatInputController_TextInputPayloads__registerForTextInputPayloadHandlingForSenderHandleID_receiverHandleID___block_invoke_2;
    block[3] = &unk_1E5620AA8;
    id v3 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v5 = v3;
    id v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __114__CKChatInputController_TextInputPayloads__registerForTextInputPayloadHandlingForSenderHandleID_receiverHandleID___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) textInputPayloadController];
  id v3 = [v2 supportedPayloadIds];
  id v4 = (void *)[v3 mutableCopy];

  [v4 addObject:*MEMORY[0x1E4F6CB28]];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      int v9 = 138412802;
      int v10 = v4;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Updating supported Payload IDs: %@ for sender:%@ and receiver: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  id v8 = (void *)[v4 copy];
  [v2 setSupportedPayloadIds:v8];
}

- (void)unregisterForTextInputPayloadHandling
{
  id v5 = [(CKChatInputController *)self textInputPayloadController];
  id v3 = [v5 payloadDelegate];

  if (v3 == self)
  {
    [v5 setPayloadDelegate:0];
    [v5 setSupportedPayloadIds:MEMORY[0x1E4F1CBF0]];
  }
  id v4 = [getDDActionClass() clientActionsDelegate];

  if (v4 == self) {
    [getDDActionClass() setClientActionsDelegate:0];
  }
}

- (void)presentPluginWithBundleID:(id)a3 appLaunchPayload:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  if ([v6 count]) {
    uint64_t v7 = @"com.apple.messages.appLaunchURLPluginPayload";
  }
  else {
    uint64_t v7 = 0;
  }
  [(CKChatInputController *)self _presentPluginWithBundleID:v8 sendingTextInputPayload:v6 withPayloadID:v7];
}

- (void)handlePayload:(id)a3 withPayloadId:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if ([v7 isEqualToString:@"com.apple.messages.currentLocation"])
    {
      int v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v10 = [v9 isWaldoEnabled];

      if (v10)
      {
        __int16 v11 = [v6 valueForKey:@"shouldSendRequestLocation"];
        uint64_t v12 = [v6 valueForKey:@"shouldSendCurrentLocation"];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 BOOLValue])
        {
          __int16 v13 = [(CKChatInputController *)self delegate];
          [v13 chatInputControllerDidSelectRequestLocation:self];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v12 BOOLValue]) {
            [(CKChatInputController *)self showFindMyPlugin];
          }
        }
      }
      else
      {
        uint64_t v26 = [(CKChatInputController *)self delegate];
        [v26 sendCurrentLocation];
      }
    }
    else
    {
      if ([v8 isEqualToString:*MEMORY[0x1E4F6CB28]])
      {
        uint64_t v14 = (void *)*MEMORY[0x1E4F6CBE8];
        id v15 = v8;
        unsigned int v16 = [v14 stringByAppendingFormat:@":%@:%@", @"0000000000", v15];
        BOOL v17 = [MEMORY[0x1E4F6E940] sharedCoordinator];

        id v8 = [v17 appPayloadID];

        __int16 v18 = +[CKBalloonPluginManager sharedInstance];
        long long v19 = [v18 viewControllerForPluginIdentifier:v16];

        if (objc_opt_respondsToSelector())
        {
          [v19 setSendDelegate:self];
          os_activity_scope_state_s v20 = (void *)[v6 mutableCopy];
          [v20 setObject:&unk_1EDF16E08 forKeyedSubscript:@"sessionStartEntryType"];
          long long v21 = (void *)[v20 copy];
          v49[0] = MEMORY[0x1E4F143A8];
          v49[1] = 3221225472;
          v49[2] = __72__CKChatInputController_TextInputPayloads__handlePayload_withPayloadId___block_invoke;
          v49[3] = &unk_1E5621EA8;
          id v50 = v8;
          id v51 = self;
          [v19 handleTextInputPayload:v21 withPayloadID:v50 completion:v49];
        }
      }
      if ([v8 isEqualToString:@"com.apple.messages.mentions"])
      {
        if (+[CKMentionsUtilities supportsSupplementalLexiconMentions])
        {
          long long v22 = [v6 objectForKeyedSubscript:@"name"];
          if ([v22 length])
          {
            id v23 = [(CKChatInputController *)self entryView];
            id v24 = [v23 contentView];
            double v25 = [v24 textView];
            [v25 insertMentionByName:v22];
          }
        }
      }
      else if (![(CKChatInputController *)self _presentPluginIfNecessaryWithPayload:v6 withPayloadID:v8])
      {
        if ([v8 isEqualToString:@"com.apple.messages.stageSticker"])
        {
          int v27 = _UIStickerCreateStickerFromTextInputPayload();
          uint64_t v28 = [v27 representations];
          BOOL v29 = [v28 count] == 0;

          if (v29)
          {
            unint64_t v30 = IMLogHandleForCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              -[CKNotificationChatController(TextInputPayloadsInternal) _handleStickerTextInputPayload:](v30, v36, v37, v38, v39, v40, v41, v42);
            }
          }
          else
          {
            unint64_t v30 = objc_msgSend(v27, "_ck_plainStringEmojiText");
            if ([v30 length])
            {
              uint64_t v31 = IMLogHandleForCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "Handling received sticker payload as plain string system emoji text", buf, 2u);
              }

              double v32 = [(CKChatInputController *)self entryView];
              id v33 = [v32 contentView];
              id v34 = [v33 textView];

              [v34 insertText:v30];
            }
            else
            {
              uint64_t v43 = [(CKChatInputController *)self targetConversation];
              int v44 = [v43 supportsInlineAdaptiveImageGlyphs];

              int v45 = objc_msgSend(v27, "_ck_shouldInsertInCompositionAsAdaptiveImageGlyph");
              int v46 = IMLogHandleForCategory();
              BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_INFO);
              if ((v44 & v45) != 0)
              {
                if (v47)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18EF18000, v46, OS_LOG_TYPE_INFO, "Handling received sticker payload as an adaptive image glyph", buf, 2u);
                }

                [(CKChatInputController *)self insertUIStickerAsAdaptiveImageGlyph:v27];
              }
              else
              {
                if (v47)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18EF18000, v46, OS_LOG_TYPE_INFO, "Handling received sticker payload as staged sticker object", buf, 2u);
                }

                int v48 = (void *)[objc_alloc(MEMORY[0x1E4F6EA58]) initWithUISticker:v27 adaptiveImageGlyph:0];
                -[CKChatInputController commitStickerBypassingValidation:forPlugin:stickerFrame:](self, "commitStickerBypassingValidation:forPlugin:stickerFrame:", v48, *MEMORY[0x1E4F6CAF8], *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
              }
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          double v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v53 = v8;
            _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "Unhandled text input payload ID: %@", buf, 0xCu);
          }
        }
      }
    }
  }
}

void __72__CKChatInputController_TextInputPayloads__handlePayload_withPayloadId___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v5;
      __int16 v9 = 1024;
      int v10 = a2;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Keyboard Suggestion. Plugin %@ did handle text input payload: %d", buf, 0x12u);
    }
  }
  if (a2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__CKChatInputController_TextInputPayloads__handlePayload_withPayloadId___block_invoke_127;
    block[3] = &unk_1E5620C40;
    void block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __72__CKChatInputController_TextInputPayloads__handlePayload_withPayloadId___block_invoke_127(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v1 = [*(id *)(a1 + 32) textInputPayloadController];
  uint64_t v2 = [v1 supportedPayloadIds];
  id v3 = (void *)[v2 mutableCopy];

  [v3 removeObject:*MEMORY[0x1E4F6CB28]];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Removing SafetyMonitor as a supported payloadID. Updated list: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = (void *)[v3 copy];
  [v1 setSupportedPayloadIds:v5];
}

- (void)insertUIStickerAsAdaptiveImageGlyph:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __80__CKChatInputController_TextInputPayloads__insertUIStickerAsAdaptiveImageGlyph___block_invoke;
    v5[3] = &unk_1E5624AF0;
    v5[4] = self;
    objc_msgSend(v4, "stk_renderBakedInRepIfNecessaryWithCompletion:", v5);
  }
  else
  {
    [(CKChatInputController *)self _insertUIStickerAsAdaptiveImageGlyph:v4];
  }
}

void __80__CKChatInputController_TextInputPayloads__insertUIStickerAsAdaptiveImageGlyph___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__CKChatInputController_TextInputPayloads__insertUIStickerAsAdaptiveImageGlyph___block_invoke_2;
  v5[3] = &unk_1E5620AF8;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __80__CKChatInputController_TextInputPayloads__insertUIStickerAsAdaptiveImageGlyph___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _insertUIStickerAsAdaptiveImageGlyph:*(void *)(a1 + 40)];
}

- (void)_insertUIStickerAsAdaptiveImageGlyph:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _UIStickerCreateAdaptiveImageGlyphFromSticker();
  if (v5)
  {
    id v6 = [(CKChatInputController *)self entryView];
    id v7 = [v6 contentView];
    uint64_t v8 = [v7 textView];

    id v9 = [v8 existingMediaObjectMatchingAdaptiveImageGlyph:v5];
    if (!v9)
    {
      int v10 = (void *)[objc_alloc(MEMORY[0x1E4F6EA58]) initWithUISticker:v4 adaptiveImageGlyph:v5];
      uint64_t v11 = +[CKMediaObjectManager sharedInstance];
      uint64_t v12 = [v11 mediaObjectWithSticker:v10 stickerUserInfo:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v12;
      }
      else
      {
        os_activity_scope_state_s v20 = IMLogHandleForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[CKNotificationChatController(TextInputPayloadsInternal) _insertUIStickerAsAdaptiveImageGlyph:](v20, v21, v22, v23, v24, v25, v26, v27);
        }

        id v9 = 0;
      }
    }
    [v8 insertAdaptiveImageGlyph:v5 withMediaObject:v9];
  }
  else
  {
    uint64_t v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CKNotificationChatController(TextInputPayloadsInternal) _insertUIStickerAsAdaptiveImageGlyph:](v8, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (BOOL)_presentPluginIfNecessaryWithPayload:(id)a3 withPayloadID:(id)a4
{
  void v16[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F6CC30];
  v15[0] = @"com.apple.messages.surf";
  v15[1] = @"com.apple.messages.photos";
  uint64_t v9 = *MEMORY[0x1E4F6CC00];
  v16[0] = v8;
  v16[1] = v9;
  void v16[2] = *MEMORY[0x1E4F6CB78];
  v15[2] = @"com.apple.messages.animoji.stickers";
  v15[3] = @"com.apple.messages.stickers";
  int v10 = IMStickersExtensionIdentifier();
  v16[3] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  uint64_t v12 = [v11 objectForKeyedSubscript:v7];
  if (v12)
  {
    uint64_t v13 = [(CKChatInputController *)self _formattedPayload:v6 forPayloadID:v7];
    -[CKChatInputController _presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:style:](self, "_presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:style:", v12, v13, v7, [v12 isEqualToString:v9]);
  }
  return v12 != 0;
}

- (void)_stageStickerWithFileURL:(id)a3 accessibilityLabel:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F6EA58];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  int v10 = [v8 lastPathComponent];
  uint64_t v11 = *MEMORY[0x1E4F6CB78];
  id v12 = (id)[v9 initWithStickerID:v10 stickerPackID:*MEMORY[0x1E4F6CB78] fileURL:v8 accessibilityLabel:v7 accessibilityName:0 searchText:0 sanitizedPrompt:0 moodCategory:0 stickerName:0];

  -[CKChatInputController commitStickerBypassingValidation:forPlugin:stickerFrame:](self, "commitStickerBypassingValidation:forPlugin:stickerFrame:", v12, v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (id)_formattedPayload:(id)a3 forPayloadID:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v7;
  if (([v6 isEqualToString:@"com.apple.messages.surf"] & 1) == 0)
  {
    id v8 = v7;
    if ([v6 isEqualToString:@"com.apple.messages.photos"])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      int v10 = [v7 objectForKeyedSubscript:@"message"];
      if (v10) {
        [v9 setObject:v10 forKeyedSubscript:@"Text"];
      }
      uint64_t v15 = @"Photos";
      uint64_t v11 = (void *)[v9 copy];
      uint64_t v14 = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      v16[0] = v12;
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    }
  }

  return v8;
}

- (void)_presentPluginWithBundleID:(id)a3 sendingTextInputPayload:(id)a4 withPayloadID:(id)a5
{
}

- (void)_presentPluginWithBundleID:(id)a3 sendingTextInputPayload:(id)a4 withPayloadID:(id)a5 style:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[CKBalloonPluginManager sharedInstance];
  id v14 = [v13 balloonPluginIdentifierForAppExtensionBundleIdentifier:v10];

  if (!v14)
  {
    if ([v10 isEqualToString:*MEMORY[0x1E4F6CC30]])
    {
      id v15 = (id)*MEMORY[0x1E4F6CC38];

      uint64_t v16 = +[CKBalloonPluginManager sharedInstance];
      id v14 = [v16 balloonPluginIdentifierForAppExtensionBundleIdentifier:v15];

      id v10 = v15;
    }
    else
    {
      id v14 = 0;
    }
  }
  if ([v10 containsString:*MEMORY[0x1E4F6CB28]])
  {
    uint64_t v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v18 = [v17 isZelkovaEnabled];

    if (v18)
    {
      uint64_t v19 = [v12 length];
      id v20 = v10;

      id v10 = v20;
      if (!v19)
      {
        id v10 = [v20 stringByReplacingOccurrencesOfString:@".NewMessage" withString:&stru_1EDE4CA38];
      }
      uint64_t v21 = +[CKBalloonPluginManager sharedInstance];
      uint64_t v22 = [v21 balloonPluginIdentifierForAppExtensionBundleIdentifier:v10];

      if (!v11)
      {
        uint64_t v23 = [MEMORY[0x1E4F6E940] sharedCoordinator];
        id v11 = [v23 appPayload];
      }
      uint64_t v24 = +[CKBalloonPluginManager sharedInstance];
      uint64_t v25 = [v24 viewControllerForPluginIdentifier:v22];

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        id v14 = v22;
        id v12 = v20;
        goto LABEL_31;
      }
      [v25 setSendDelegate:self];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __115__CKChatInputController_TextInputPayloads___presentPluginWithBundleID_sendingTextInputPayload_withPayloadID_style___block_invoke;
      v37[3] = &unk_1E5620BF0;
      uint64_t v26 = &v38;
      id v14 = v22;
      id v38 = v14;
      [v25 handleTextInputPayload:v11 withPayloadID:v20 completion:v37];
      id v12 = v20;
LABEL_29:

LABEL_31:
      goto LABEL_32;
    }
  }
  if (v14
    || [v10 isEqualToString:*MEMORY[0x1E4F6CB88]]
    && (+[CKBalloonPluginManager sharedInstance],
        uint64_t v31 = objc_claimAutoreleasedReturnValue(),
        [v31 balloonPluginIdentifierForAppExtensionBundleIdentifier:v10],
        id v14 = (id)objc_claimAutoreleasedReturnValue(),
        v31,
        v14))
  {
    uint64_t v27 = +[CKBalloonPluginManager sharedInstance];
    uint64_t v25 = [v27 viewControllerForPluginIdentifier:v14];

    uint64_t v28 = [(CKChatInputController *)self browserPlugin];
    BOOL v29 = [v28 identifier];
    if ([v29 isEqualToString:v14])
    {
      BOOL v30 = [(CKChatInputController *)self isInputViewVisible];

      if (v30)
      {
LABEL_25:
        uint64_t v34 = [v11 count];
        if (!v12 || !v34 || (objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_31;
        }
        [v25 setSendDelegate:self];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __115__CKChatInputController_TextInputPayloads___presentPluginWithBundleID_sendingTextInputPayload_withPayloadID_style___block_invoke_154;
        v35[3] = &unk_1E5620BF0;
        uint64_t v26 = &v36;
        id v14 = v14;
        id v36 = v14;
        [v25 handleTextInputPayload:v11 withPayloadID:v12 completion:v35];
        goto LABEL_29;
      }
    }
    else
    {
    }
    double v32 = [v25 balloonPlugin];
    if ((CKIsSendMenuEnabled() & 1) != 0 || [v32 showInBrowser])
    {
      id v33 = [v25 balloonPluginDataSource];
      [(CKChatInputController *)self launchAndShowBrowserForPlugin:v32 dataSource:v33 style:a6];
    }
    goto LABEL_25;
  }
LABEL_32:
}

void __115__CKChatInputController_TextInputPayloads___presentPluginWithBundleID_sendingTextInputPayload_withPayloadID_style___block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 1024;
      int v9 = a2;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Plugin %@ did handle text input payload: %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

void __115__CKChatInputController_TextInputPayloads___presentPluginWithBundleID_sendingTextInputPayload_withPayloadID_style___block_invoke_154(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 1024;
      int v9 = a2;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Plugin %@ did handle text input payload: %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (BOOL)canHandleClientActionFromUrl:(id)a3
{
  return 1;
}

- (id)localizedTitleForClientActionFromUrl:(id)a3 context:(id)a4
{
  id v4 = CKFrameworkBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"DATA_DETECTORS_PHOTOS_ACTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

  return v5;
}

- (void)handleClientActionFromUrl:(id)a3 context:(id)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  __int16 v8 = (void *)getkDataDetectorsReferenceDateKeySymbolLoc_ptr_0;
  uint64_t v30 = getkDataDetectorsReferenceDateKeySymbolLoc_ptr_0;
  if (!getkDataDetectorsReferenceDateKeySymbolLoc_ptr_0)
  {
    int v9 = (void *)DataDetectorsUILibrary_0();
    v28[3] = (uint64_t)dlsym(v9, "kDataDetectorsReferenceDateKey");
    getkDataDetectorsReferenceDateKeySymbolLoc_ptr_0 = v28[3];
    __int16 v8 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v8) {
    -[CKChatInputController(DDClientActionsDelegate) handleClientActionFromUrl:context:]();
  }
  uint64_t v25 = self;
  uint64_t v10 = [v6 objectForKeyedSubscript:*v8];
  if (v10) {
    [v7 setObject:v10 forKeyedSubscript:@"Timestamp"];
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  id v12 = (void *)getkDataDetectorsLeadingTextSymbolLoc_ptr;
  uint64_t v30 = getkDataDetectorsLeadingTextSymbolLoc_ptr;
  if (!getkDataDetectorsLeadingTextSymbolLoc_ptr)
  {
    uint64_t v13 = (void *)DataDetectorsUILibrary_0();
    v28[3] = (uint64_t)dlsym(v13, "kDataDetectorsLeadingText");
    getkDataDetectorsLeadingTextSymbolLoc_ptr = v28[3];
    id v12 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v12) {
    -[CKChatInputController(DDClientActionsDelegate) handleClientActionFromUrl:context:]();
  }
  id v14 = [v6 objectForKeyedSubscript:*v12];
  if (v14) {
    [v11 appendString:v14];
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  id v15 = (void *)getkDataDetectorsMiddleTextSymbolLoc_ptr;
  uint64_t v30 = getkDataDetectorsMiddleTextSymbolLoc_ptr;
  if (!getkDataDetectorsMiddleTextSymbolLoc_ptr)
  {
    uint64_t v16 = (void *)DataDetectorsUILibrary_0();
    v28[3] = (uint64_t)dlsym(v16, "kDataDetectorsMiddleText");
    getkDataDetectorsMiddleTextSymbolLoc_ptr = v28[3];
    id v15 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v15) {
    -[CKChatInputController(DDClientActionsDelegate) handleClientActionFromUrl:context:]();
  }
  uint64_t v17 = [v6 objectForKeyedSubscript:*v15];
  if (v17) {
    [v11 appendString:v17];
  }
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  int v18 = (void *)getkDataDetectorsTrailingTextSymbolLoc_ptr;
  uint64_t v30 = getkDataDetectorsTrailingTextSymbolLoc_ptr;
  if (!getkDataDetectorsTrailingTextSymbolLoc_ptr)
  {
    uint64_t v19 = (void *)DataDetectorsUILibrary_0();
    v28[3] = (uint64_t)dlsym(v19, "kDataDetectorsTrailingText");
    getkDataDetectorsTrailingTextSymbolLoc_ptr = v28[3];
    int v18 = (void *)v28[3];
  }
  _Block_object_dispose(&v27, 8);
  if (!v18) {
    -[CKChatInputController(DDClientActionsDelegate) handleClientActionFromUrl:context:].cold.4();
  }
  id v20 = [v6 objectForKeyedSubscript:*v18];
  if (v20) {
    [v11 appendString:v20];
  }
  if ([v11 length])
  {
    uint64_t v21 = (void *)[v11 copy];
    [v7 setObject:v21 forKeyedSubscript:@"Text"];
  }
  double v32 = @"Photos";
  uint64_t v22 = (void *)[v7 copy];
  uint64_t v31 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
  v33[0] = v23;
  uint64_t v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];

  [(CKChatInputController *)v25 _presentPluginWithBundleID:*MEMORY[0x1E4F6CC00] sendingTextInputPayload:v24 withPayloadID:@"com.apple.messages.datadetectors.photos" style:1];
}

- (BOOL)shouldShowMoneyActionWithAmount:(id)a3 currencies:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (!v6) {
    goto LABEL_9;
  }
  if (![v7 count]) {
    goto LABEL_9;
  }
  int v9 = [(CKChatInputController *)self delegate];
  uint64_t v10 = [v9 recipientsCount];

  if (!v10 || !CKShouldShowSURF()) {
    goto LABEL_9;
  }
  if (shouldShowMoneyActionWithAmount_currencies___pred_PKPeerPaymentShouldDisplayResultForDetectedAmountPassKitCore != -1) {
    dispatch_once(&shouldShowMoneyActionWithAmount_currencies___pred_PKPeerPaymentShouldDisplayResultForDetectedAmountPassKitCore, &__block_literal_global_260);
  }
  id v11 = [v8 firstObject];
  char ShouldDisplayResultForDetectedAmount = PKPeerPaymentShouldDisplayResultForDetectedAmount();

  if (ShouldDisplayResultForDetectedAmount) {
    BOOL v13 = 1;
  }
  else {
LABEL_9:
  }
    BOOL v13 = 0;

  return v13;
}

uint64_t __93__CKChatInputController_DDClientActionsDelegate__shouldShowMoneyActionWithAmount_currencies___block_invoke()
{
  uint64_t result = MEMORY[0x192FBA870]("PKPeerPaymentShouldDisplayResultForDetectedAmount", @"PassKitCore");
  shouldShowMoneyActionWithAmount_currencies___PKPeerPaymentchar ShouldDisplayResultForDetectedAmount = result;
  return result;
}

- (void)handleMoneyActionWithAmount:(id)a3 currencies:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (v6 && [v7 count])
  {
    id v20 = v6;
    int v9 = [v6 stringValue];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v27[0] = @"CurrencyType";
          v27[1] = @"CurrencyValue";
          v28[0] = v16;
          v28[1] = v9;
          uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
          [v10 addObject:v17];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v13);
    }

    uint64_t v25 = @"Currency";
    int v18 = (void *)[v10 copy];
    id v26 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

    [(CKChatInputController *)self _presentPluginWithBundleID:*MEMORY[0x1E4F6CC30] sendingTextInputPayload:v19 withPayloadID:@"com.apple.messages.datadetectors.currency"];
    id v6 = v20;
  }
}

- (void)commitPayload:(CKBrowserItemPayload *)a3 forPlugin:(NSString *)a4 allowAllCommits:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB442C50);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(void *)(v15 + 24) = a4;
  *(unsigned char *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_18F7B9AE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  void v17[4] = &unk_1E923ECA8;
  v17[5] = v15;
  int v18 = (void *)swift_allocObject();
  void v18[2] = 0;
  v18[3] = 0;
  v18[4] = a0nu;
  v18[5] = v17;
  uint64_t v19 = a3;
  id v20 = a4;
  long long v21 = self;
  sub_18EF277D4((uint64_t)v13, (uint64_t)&unk_1E9239EF0, (uint64_t)v18);
  swift_release();
}

- (void)requestPhotoBrowserInitFromDraft:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Tried to load a photo draft but the plugin isn't available yet", v2, v3, v4, v5, v6);
}

- (void)requestPhotoBrowserInitFromDraft:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Tried to load a photo draft but there is no attachment available", v2, v3, v4, v5, v6);
}

- (void)shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_18EF18000, v0, OS_LOG_TYPE_DEBUG, "Not attempting to launch photos app following long press on plus button, photos app is already shown.", v1, 2u);
}

- (void)balloonPluginForIndexPath:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18EF18000, v1, OS_LOG_TYPE_ERROR, "Tried to select a balloon plugin at an invalid index: %@, visiblePlugins: %@", v2, 0x16u);
}

- (void)messageEntryView:(uint64_t)a1 didSelectPluginAtIndex:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  __int16 v3 = "-[CKChatInputController messageEntryView:didSelectPluginAtIndex:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "%s can't select plugin at index: %@, aborting.", (uint8_t *)&v2, 0x16u);
}

- (void)_stickerPickerPlugin
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18EF18000, v0, OS_LOG_TYPE_ERROR, "Unable to load plugin for id: %@", v1, 0xCu);
}

- (void)stickerPickerWasHiddenPreservingChatItem:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_18EF18000, v0, OS_LOG_TYPE_DEBUG, "Sticker picker for chat item was hidden: %@", v1, 0xCu);
}

- (void)_beginPreviewCreationWithFileURL:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Trying to generate preview with nil URL.", v2, v3, v4, v5, v6);
}

- (void)workingDraftDirForPluginIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_18EF18000, v0, OS_LOG_TYPE_ERROR, "Failed to create draft directory for conversation: %@", v1, 0xCu);
}

@end