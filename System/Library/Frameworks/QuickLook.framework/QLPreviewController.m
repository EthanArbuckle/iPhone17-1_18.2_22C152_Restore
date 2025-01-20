@interface QLPreviewController
+ (BOOL)canPreviewDocumentType:(id)a3;
+ (BOOL)canPreviewItem:(id)item;
+ (BOOL)canPreviewMIMEType:(id)a3;
+ (BOOL)copyPreviewItemToPasteboard:(id)a3;
+ (QLPreviewController)controllerWithItemStore:(id)a3;
+ (id)contentTypeForPreviewItem:(id)a3;
+ (id)printPageRendererForItem:(id)a3;
+ (id)titleForPreviewItem:(id)a3;
+ (void)logDeprecatedMessageForMethodName:(id)a3;
+ (void)logDeprecatedMessageForSelector:(SEL)a3;
+ (void)presentPreviewItem:(id)a3 onViewController:(id)a4 withDelegate:(id)a5 animated:(BOOL)a6;
- (BOOL)_adoptPersona:(id)a3 andPerformBlock:(id)a4;
- (BOOL)_barButtonItemArray:(id)a3 isEqualToArray:(id)a4;
- (BOOL)_basePreviewControllerIsBeingFullyDismissed;
- (BOOL)_canDisplayOpenInButtonForItem:(id)a3;
- (BOOL)_canPerformBarButtonAction;
- (BOOL)_dismissQuickLookIfBlocked;
- (BOOL)_isBeingFullyDismissed;
- (BOOL)_isInPickMode;
- (BOOL)_isQuickLookVisible;
- (BOOL)_isToolbarVisibleForTraitCollection:(id)a3;
- (BOOL)_needsListButton;
- (BOOL)_quickLookWillBecomeVisible;
- (BOOL)_shouldAllowInteractiveTransitions;
- (BOOL)_shouldDisplayOpenInInChromeIfAvailable;
- (BOOL)_shouldDoneButtonBePlacedLeft;
- (BOOL)_topViewControllerBelongsToHierarchy:(id)a3;
- (BOOL)accessibilityPerformEscape;
- (BOOL)allowInteractiveTransitions;
- (BOOL)alwaysDisplayPreviewItemTitle;
- (BOOL)canChangeCurrentPage;
- (BOOL)canDismissWithGesture;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canPerformExportForItem:(id)a3 atURL:(id)a4;
- (BOOL)canPerformPrintForItem:(id)a3 atURL:(id)a4;
- (BOOL)canPerformPrintForItem:(id)a3 customPrinter:(id *)a4 shouldUseDefaultPrinter:(BOOL *)a5;
- (BOOL)canShowNavBar;
- (BOOL)canShowToolbar;
- (BOOL)currentPreviewHasUnsavedEdits;
- (BOOL)didTransitionFromInternalView;
- (BOOL)forceDismissActionsPresentation;
- (BOOL)forceModalPresentation;
- (BOOL)fullScreen;
- (BOOL)hasEditedItems;
- (BOOL)hasItemsToPreview;
- (BOOL)isContentManaged;
- (BOOL)isInteractivePopEnabled;
- (BOOL)isObtainingEditsFromServiceBeforeDismissing;
- (BOOL)isTopPreviewController;
- (BOOL)itemStore:(id)a3 canEditItem:(id)a4;
- (BOOL)itemStore:(id)a3 canHandleEditedCopyOfPreviewItem:(id)a4;
- (BOOL)itemStore:(id)a3 canMachineReadableCodeBeDetectedInPreviewItem:(id)a4;
- (BOOL)itemStore:(id)a3 canShareItem:(id)a4;
- (BOOL)overlayFrozen;
- (BOOL)overlayHidden;
- (BOOL)parentIsNavigationController;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)previousStatusBarHidden;
- (BOOL)shouldUseNativeTransition;
- (BOOL)showActionAsDefaultButton;
- (BOOL)useCustomActionButton;
- (BOOL)willTransitionToInternalView;
- (CGRect)contentFrame;
- (CGRect)frameForAdditionalButtonWithActionName:(SEL)a3;
- (NSArray)additionalLeftBarButtonItems;
- (NSArray)additionalRightBarButtonItems;
- (NSArray)excludedToolbarButtonIdentifiers;
- (NSArray)originalLeftBarButtonItems;
- (NSArray)originalRightBarButtonItems;
- (NSArray)previewToolbarButtons;
- (NSInteger)currentPreviewItemIndex;
- (NSMutableDictionary)previewKeyCommands;
- (NSSet)_pdfItemAllowedOutputClasses;
- (NSString)currentTitleFromItemViewController;
- (NSString)overrideParentApplicationDisplayIdentifier;
- (NSString)personaUniqueString;
- (NSURL)accessedUrlForSharingController;
- (QLActivityItemProvider)currentItemProvider;
- (QLCustomURLSharingProxyDelegate)customURLSharingProxyDelegate;
- (QLItem)internalCurrentPreviewItem;
- (QLNavigationState)previousNavigationVCState;
- (QLPinchRotationTracker)pinchRotationTracker;
- (QLPreviewCollectionProtocol)previewCollection;
- (QLPreviewController)initWithNibName:(id)a3 bundle:(id)a4;
- (QLPreviewController)initWithPreviewItems:(id)a3;
- (QLPreviewControllerDelegate)strongDelegate;
- (QLPreviewItemStore)previewItemStore;
- (QLPrintingProtocol)printer;
- (QLRemotePopoverTracker)shareSheetPopoverTracker;
- (QLStateManager)stateManager;
- (QLSwipeDownTracker)swipeDownTracker;
- (QLToolbarController)toolbarController;
- (QLTransitionController)currentAnimator;
- (UIColor)backgroundColor;
- (UIColor)fullscreenBackgroundColor;
- (UIColor)navigationBarTintColor;
- (UIColor)toolbarTintColor;
- (UIDocumentInteractionController)sharingInteractionController;
- (UINavigationController)internalNavigationController;
- (UIPanGestureRecognizer)slideGesture;
- (UIPinchGestureRecognizer)pinchGesture;
- (UIRotationGestureRecognizer)rotationGesture;
- (UIView)transitionSourceView;
- (double)navigationBarGradientAlpha;
- (double)toolbarGradientAlpha;
- (id)_actionButton;
- (id)_buttonWithAccessibilityIdentifierPointer:(id)a3 inButtons:(id)a4;
- (id)_childViewControllerForWhitePointAdaptivityStyle;
- (id)_copyBarButtons:(id)a3;
- (id)_dismissActions;
- (id)_dismissActionsForEditedPreviewItems:(id)a3;
- (id)_displayedButtonWithAccessibilityIdentifier:(id)a3;
- (id)_doneButton;
- (id)_editedItemsForDoneActionControllerWithItems:(id)a3;
- (id)_listButton;
- (id)_navigationBarLeftButtonsWithTraitCollection:(id)a3;
- (id)_navigationBarRightButtonsWithTraitCollection:(id)a3;
- (id)_openInButton;
- (id)_openInTitleForOpenInType:(unint64_t)a3 claimBinding:(id)a4;
- (id)_preferredBackgroundColor;
- (id)_toolBarButtonsWithTraitCollection:(id)a3;
- (id)_topNavigationItem;
- (id)_topPreviewController;
- (id)_topViewController;
- (id)activityControllerForURL:(id)a3;
- (id)activityItemForDocumentInteractionController:(id)a3;
- (id)activityItemsConfiguration;
- (id)additionalActivitiesForDocumentInteractionController:(id)a3;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)animatorForShowing:(BOOL)a3 previewController:(id)a4 presentingController:(id)a5;
- (id)childViewControllerForStatusBarHidden;
- (id)currentPreviewItem;
- (id)currentTracker;
- (id)dataSource;
- (id)delegate;
- (id)editedItems;
- (id)excludedActivityTypesForCurrentPreviewItem;
- (id)flexibleSpace;
- (id)interactionControllerForDismissal:(id)a3;
- (id)interactionControllerForPresentation:(id)a3;
- (id)itemProviderForItem:(id)a3 shareableURL:(id)a4;
- (id)keyCommands;
- (id)lockPDFActionForItem:(id)a3 atURL:(id)a4;
- (id)menuActionsForDismissActions:(id)a3 containsAtLeastOneUnsavedCopy:(BOOL)a4 editedPreviewItems:(id)a5 shouldPresentDefaultActions:(BOOL)a6;
- (id)navigationBarGradientView;
- (id)previewItemAtIndex:(int64_t)a3;
- (id)previewItemDisplayStateForItem:(id)a3;
- (id)printActionForItem:(id)a3 atURL:(id)a4;
- (id)printInfoForDocumentInteractionController:(id)a3;
- (id)saveToFilesActionForItem:(id)a3 atURL:(id)a4;
- (id)saveToPhotosActionForItem:(id)a3 atURL:(id)a4;
- (id)shareSheetDismissCompletion;
- (id)titleMenuElementsForItem:(id)a3 atURL:(id)a4 withSuggestedActions:(id)a5;
- (id)toolbarGradientView;
- (id)userActivity;
- (id)viewForAdditionalButtonWithActionName:(SEL)a3;
- (int)mode;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)_preferredWhitePointAdaptivityStyle;
- (int64_t)itemStore:(id)a3 editingModeForPreviewItem:(id)a4;
- (int64_t)numberOfPreviewItems;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (unint64_t)_computePresentationMode;
- (unint64_t)_numberOfButtonsExcludingSpacersInButtons:(id)a3 disappearingOnTap:(BOOL)a4;
- (unint64_t)appearanceActions;
- (unint64_t)currentOrbMode;
- (unint64_t)forcedSupportedInterfaceOrientations;
- (unint64_t)itemStore:(id)a3 editedFileBehaviorForItem:(id)a4;
- (unint64_t)presentationMode;
- (unint64_t)presentationStyle;
- (unint64_t)quickLookVisibility;
- (unint64_t)supportedInterfaceOrientations;
- (void)_actionButtonTapped:(id)a3;
- (void)_asynchronouslyUpdateContentsOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5;
- (void)_configurePreviewCollectionIfNeeded;
- (void)_copyToButtonTapped:(id)a3;
- (void)_didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6;
- (void)_didObtainEditsFromService;
- (void)_dismissQuickLookFromKeyboardCommand;
- (void)_handleEditedPreviewItem:(id)a3 editedCopy:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6;
- (void)_installGradientViewsIfNeeded;
- (void)_invalidatePreviewCollectionIfNeeded;
- (void)_invalidatePreviewCollectionIfNeededNow;
- (void)_keyCommandWasPerformed:(id)a3;
- (void)_listButtonTapped:(id)a3;
- (void)_nextPreview;
- (void)_notifyFirstAppearanceIfNeeded;
- (void)_notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler:(id)a3;
- (void)_obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler:(id)a3;
- (void)_openInButtonTapped:(id)a3;
- (void)_performOpenInWithFileURL:(id)a3 claimBinding:(id)a4 additionalLaunchServicesOptions:(id)a5 completion:(id)a6;
- (void)_performQuickLookDismissalAnimated:(BOOL)a3;
- (void)_prepareDelayedAppearance;
- (void)_presentLoadedPreviewCollection:(id)a3;
- (void)_presentPreviewCollection;
- (void)_previousPreview;
- (void)_printDocument:(id)a3;
- (void)_promptUserAndOpenURLIfNeeded:(id)a3;
- (void)_refreshCurrentPreviewItemAnimated:(BOOL)a3;
- (void)_registerForApplicationStateChangesNotifications;
- (void)_reloadDataIfNeeded;
- (void)_removePreviewCollectionFromViewHierarchy;
- (void)_saveAndDismissQuickLookIfBlocked:(id)a3;
- (void)_saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler:(id)a3;
- (void)_saveAndObtainEditsBeforeDismissalWithCompletionHandler:(id)a3;
- (void)_savePreviousNavigationVCState;
- (void)_setCurrentPreviewItemIndex:(int64_t)a3 updatePreview:(BOOL)a4 animated:(BOOL)a5;
- (void)_setDefaultFullscreenStateIfNeeded;
- (void)_setFullScreen:(BOOL)a3 animated:(BOOL)a4 force:(BOOL)a5;
- (void)_setPreferredWhitePointAdaptivityStyle:(int64_t)a3;
- (void)_setPresentationMode:(unint64_t)a3;
- (void)_setupDocumentInteractionControllerForPresentation:(id)a3;
- (void)_setupDocumentInteractionControllerForPresentationWithURL:(id)a3 isCustomURL:(BOOL)a4 completionHandler:(id)a5;
- (void)_showPreviewCollection;
- (void)_showShareSheetFromBarButton:(id)a3;
- (void)_stopAccessingUrlForSharingController;
- (void)_synchronouslyUpdateContentsOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5;
- (void)_toggleDebugView;
- (void)_toolbarButtonPressed:(id)a3;
- (void)_triggerOverlayUpdateAfterDelay;
- (void)_uninstallGradientViews;
- (void)_unregisterForApplicationStateChangesNotifications;
- (void)_updateAllowInteractiveTransitionsIfNeeded;
- (void)_updateAppearance:(BOOL)a3;
- (void)_updateBackgroundColor;
- (void)_updateBarGradientOpacity;
- (void)_updateBarTintColors;
- (void)_updateCurrentPopoverButtonIfNeeded:(id)a3;
- (void)_updateDoneButtonMenu:(id)a3;
- (void)_updateNavigationBarBehaviorStyle;
- (void)_updateOverlayButtonsForTraitCollection:(id)a3 animated:(BOOL)a4;
- (void)_updateOverlayButtonsIfNeededWithTraitCollection:(id)a3 animated:(BOOL)a4 updatedToolbarButtons:(id *)a5;
- (void)_updatePreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5;
- (void)_updateToolbarSuperview;
- (void)_updateViewHierarchyPresentation;
- (void)_viewControllerPresentationDidInitiate;
- (void)_willStartObtainingEditsFromService;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidEnterBackground:(id)a3;
- (void)applyPreviewItemDisplayState:(id)a3 toItem:(id)a4;
- (void)beginInteractiveTransition;
- (void)createDocumentPropertiesWithItem:(id)a3 shareableURL:(id)a4;
- (void)createTemporaryEditDirectoryForItemAtIndex:(unint64_t)a3 completionHandler:(id)a4;
- (void)currentPreviewItemViewControllerHasUnsavedEdits:(BOOL)a3 forItemUUID:(id)a4;
- (void)currentPreviewItemViewControllerIsReadyForDisplay;
- (void)dealloc;
- (void)didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4;
- (void)didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 completionHandler:(id)a5;
- (void)didSelectPreviewItem:(id)a3;
- (void)dismissQuickLook;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)expandContentOfItemAtIndex:(unint64_t)a3 withUUID:(id)a4 unarchivedItemsURLWrapper:(id)a5;
- (void)export:(id)a3;
- (void)exportItem:(id)a3 atURL:(id)a4;
- (void)forwardMessage:(id)a3 toItemAtIndex:(unint64_t)a4 withUUID:(id)a5 completionHandler:(id)a6;
- (void)getStateRestorationUserInfo:(id)a3;
- (void)handleKeyPressWithInput:(id)a3 modifierFlags:(int64_t)a4;
- (void)handleShortcutsActionOutputFile:(id)a3 forAction:(id)a4;
- (void)hideNoDataView;
- (void)loadView;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)obtainAndUpdateEditedCopyOfCurrentPreviewItem:(id)a3;
- (void)openURLIfAllowed:(id)a3;
- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3;
- (void)presentAlertControllerForScenario:(int64_t)a3;
- (void)presentDismissActions:(id)a3;
- (void)presentError:(id)a3 forAction:(id)a4;
- (void)presentPreviewItem:(id)a3 onViewController:(id)a4 withDelegate:(id)a5 animated:(BOOL)a6;
- (void)presentSaveToFilesForEditedItems:(id)a3;
- (void)presentSaveToPhotoError:(id)a3 forItem:(id)a4;
- (void)previewCollectionPrefersWhitePointAdaptivityStyle:(int64_t)a3;
- (void)previewCollectionUpdatePreviewItem:(int64_t)a3;
- (void)previewItemAtIndex:(unint64_t)a3 wasUpdatedWithLifecycleState:(int64_t)a4 withError:(id)a5;
- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4;
- (void)printItem:(id)a3 atURL:(id)a4;
- (void)printItemAtURL:(id)a3 withCustomPrinter:(id)a4 shouldUseDefaultPrinter:(BOOL)a5;
- (void)refreshCurrentPreviewItem;
- (void)registerForScreenshotService;
- (void)reloadData;
- (void)remoteViewControllerWasInvalidated;
- (void)saveAndForceDismissQuickLookAnimated:(BOOL)a3;
- (void)saveEditsIfNecessary:(id)a3;
- (void)sceneWillDeactivate:(id)a3;
- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4;
- (void)setAccessedUrlForSharingController:(id)a3;
- (void)setAccessoryViewVisible:(BOOL)a3;
- (void)setAdditionalLeftBarButtonItems:(id)a3;
- (void)setAdditionalRightBarButtonItems:(id)a3;
- (void)setAllowInteractiveTransitions:(BOOL)a3;
- (void)setAlwaysDisplayPreviewItemTitle:(BOOL)a3;
- (void)setAppearanceActions:(unint64_t)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCanChangeCurrentPage:(BOOL)a3;
- (void)setCanDismissWithGesture:(BOOL)a3;
- (void)setCanShowNavBar:(BOOL)a3;
- (void)setCanShowToolbar:(BOOL)a3;
- (void)setContentFrame:(CGRect)a3;
- (void)setCurrentAnimator:(id)a3;
- (void)setCurrentItemProvider:(id)a3;
- (void)setCurrentOrbMode:(unint64_t)a3;
- (void)setCurrentPreviewItemIndex:(NSInteger)currentPreviewItemIndex;
- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setCurrentTitleFromItemViewController:(id)a3;
- (void)setCustomURLSharingProxyDelegate:(id)a3;
- (void)setDataSource:(id)dataSource;
- (void)setDelegate:(id)delegate;
- (void)setDidTransitionFromInternalView:(BOOL)a3;
- (void)setForceDismissActionsPresentation:(BOOL)a3;
- (void)setForceModalPresentation:(BOOL)a3;
- (void)setForcedSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setFullscreenBackgroundColor:(id)a3;
- (void)setInternalNavigationController:(id)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setIsInteractivePopEnabled:(BOOL)a3;
- (void)setIsObtainingEditsFromServiceBeforeDismissing:(BOOL)a3;
- (void)setLoadingTextForMissingFiles:(id)a3;
- (void)setNavigationBarGradientAlpha:(double)a3;
- (void)setNavigationBarShouldBeChromeless:(BOOL)a3;
- (void)setNavigationBarTintColor:(id)a3;
- (void)setOriginalLeftBarButtonItems:(id)a3;
- (void)setOriginalRightBarButtonItems:(id)a3;
- (void)setOverlayFrozen:(BOOL)a3;
- (void)setOverlayHidden:(BOOL)a3;
- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setPinchGesture:(id)a3;
- (void)setPinchRotationTracker:(id)a3;
- (void)setPresentationStyle:(unint64_t)a3;
- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4;
- (void)setPreviewKeyCommands:(id)a3;
- (void)setPreviousStatusBarHidden:(BOOL)a3;
- (void)setPrinter:(id)a3;
- (void)setQuickLookVisibility:(unint64_t)a3;
- (void)setQuickLookVisibility:(unint64_t)a3 animated:(BOOL)a4;
- (void)setRotationGesture:(id)a3;
- (void)setScreenEdgePanWidth:(double)a3;
- (void)setShareSheetDismissCompletion:(id)a3;
- (void)setShareSheetPopoverTracker:(id)a3;
- (void)setSharingInteractionController:(id)a3;
- (void)setShowActionAsDefaultButton:(BOOL)a3;
- (void)setSlideGesture:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setStrongDelegate:(id)a3;
- (void)setSwipeDownTracker:(id)a3;
- (void)setToolbarGradientAlpha:(double)a3;
- (void)setToolbarShouldBeChromeless:(BOOL)a3;
- (void)setToolbarTintColor:(id)a3;
- (void)setTransitionSourceView:(id)a3;
- (void)setUseCustomActionButton:(BOOL)a3;
- (void)setUserActivity:(id)a3;
- (void)setWillTransitionToInternalView:(BOOL)a3;
- (void)shareSheetDidDismiss;
- (void)shareableURLForCurrentPreviewItem:(id)a3;
- (void)showNoDataViewIfNeeded;
- (void)showShareSheet;
- (void)showShareSheetFromBarButton:(id)a3;
- (void)showShareSheetFromRemoteViewWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5;
- (void)showShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5;
- (void)toggleChromelessIfNeeded;
- (void)triggerQuickLookDismissal;
- (void)unregisterFromScreenshotService;
- (void)updateChromelessBars;
- (void)updateContentFrame:(CGRect)a3;
- (void)updateDocumentPropertiesActivityProviderWithShareableURL:(id)a3;
- (void)updateDocumentPropertiesDragItemsProviderWithItem:(id)a3 shareableURL:(id)a4;
- (void)updateDocumentPropertiesMetadataForItem:(id)a3 withShareableURL:(id)a4;
- (void)updateDoneButtonMenu;
- (void)updateKeyCommands;
- (void)updateNavigationTitle;
- (void)updateOverlayAnimated:(BOOL)a3 animatedButtons:(BOOL)a4 forceRefresh:(BOOL)a5 withTraitCollection:(id)a6;
- (void)updateOverlayAnimated:(BOOL)a3 forceRefresh:(BOOL)a4;
- (void)updateOverlayAnimated:(BOOL)a3 forceRefresh:(BOOL)a4 withTraitCollection:(id)a5;
- (void)updateOverlayButtons:(BOOL)a3;
- (void)updateOverlayButtonsAnimated:(BOOL)a3 buttons:(id)a4 excludedButtonIdentifiers:(id)a5;
- (void)updatePreferredContentSize:(CGSize)a3;
- (void)updatePreferredTransition;
- (void)updatePreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 completionHandler:(id)a5;
- (void)updateRemoteOverlayIfNeeded;
- (void)updateStateRestorationWithUserInfo:(id)a3;
- (void)updateStatusBarAnimated:(BOOL)a3;
- (void)updateTitle:(id)a3;
- (void)updateTitleMenuAndDocumentProperties;
- (void)updateTitleMenuWithItem:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)waitForPreviewCollectionWithCompletionHandler:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation QLPreviewController

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_print_ == a3 || sel__printDocument_ == a3)
  {
    v8 = [(QLPreviewController *)self internalCurrentPreviewItem];
    v9 = [v8 shareableURL];
    BOOL v10 = [(QLPreviewController *)self canPerformPrintForItem:v8 atURL:v9];
LABEL_10:
    BOOL v11 = v10;

    goto LABEL_11;
  }
  if (sel_export_ == a3)
  {
    v8 = [(QLPreviewController *)self internalCurrentPreviewItem];
    v9 = [v8 shareableURL];
    BOOL v10 = [(QLPreviewController *)self canPerformExportForItem:v8 atURL:v9];
    goto LABEL_10;
  }
  v13.receiver = self;
  v13.super_class = (Class)QLPreviewController;
  BOOL v11 = [(QLPreviewController *)&v13 canPerformAction:a3 withSender:v6];
LABEL_11:

  return v11;
}

- (void)_printDocument:(id)a3
{
  id v4 = a3;
  v5 = [(QLPreviewController *)self internalCurrentPreviewItem];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__QLPreviewController_DocumentMenu___printDocument___block_invoke;
  v7[3] = &unk_2642F4F88;
  id v6 = v5;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [v6 prepareShareableURL:v7];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __52__QLPreviewController_DocumentMenu___printDocument___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) shareableURL];
  if (v2)
  {
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    id v6 = v2;
    QLRunInMainThread();

    objc_destroyWeak(&v7);
  }
  else
  {
    v3 = (NSObject **)MEMORY[0x263F62940];
    id v4 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_ERROR, "Could not get share URL to update document menu. This could lead to no button to dismiss. #AnyItemViewController", buf, 2u);
    }
  }
}

void __52__QLPreviewController_DocumentMenu___printDocument___block_invoke_104(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained printItem:*(void *)(a1 + 32) atURL:*(void *)(a1 + 40)];
}

- (void)export:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewController *)self internalCurrentPreviewItem];
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__QLPreviewController_DocumentMenu__export___block_invoke;
  v7[3] = &unk_2642F4F88;
  id v6 = v5;
  id v8 = v6;
  objc_copyWeak(&v9, &location);
  [v6 prepareShareableURL:v7];
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __44__QLPreviewController_DocumentMenu__export___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) shareableURL];
  if (v2)
  {
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    id v6 = v2;
    QLRunInMainThread();

    objc_destroyWeak(&v7);
  }
  else
  {
    v3 = (NSObject **)MEMORY[0x263F62940];
    id v4 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_ERROR, "Could not get share URL to update document menu. This could lead to no button to dismiss. #AnyItemViewController", buf, 2u);
    }
  }
}

void __44__QLPreviewController_DocumentMenu__export___block_invoke_106(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained exportItem:*(void *)(a1 + 32) atURL:*(void *)(a1 + 40)];
}

- (id)_topNavigationItem
{
  v2 = [(QLPreviewController *)self _topViewController];
  v3 = [v2 navigationItem];

  return v3;
}

- (void)updateTitleMenuAndDocumentProperties
{
  if (_UIBarsDesktopNavigationBarEnabled())
  {
    v3 = [(QLPreviewController *)self _topNavigationItem];

    if (v3)
    {
      id v4 = [(QLPreviewController *)self internalCurrentPreviewItem];
      objc_initWeak(&location, self);
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __73__QLPreviewController_DocumentMenu__updateTitleMenuAndDocumentProperties__block_invoke;
      v6[3] = &unk_2642F4F88;
      id v5 = v4;
      id v7 = v5;
      objc_copyWeak(&v8, &location);
      [v5 prepareShareableURL:v6];
      objc_destroyWeak(&v8);

      objc_destroyWeak(&location);
    }
  }
}

void __73__QLPreviewController_DocumentMenu__updateTitleMenuAndDocumentProperties__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) shareableURL];
  if (v2)
  {
    objc_copyWeak(&v7, (id *)(a1 + 40));
    id v5 = *(id *)(a1 + 32);
    id v6 = v2;
    QLRunInMainThread();

    objc_destroyWeak(&v7);
  }
  else
  {
    v3 = (NSObject **)MEMORY[0x263F62940];
    id v4 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_ERROR, "Could not get share URL to update document menu. This could lead to no button to dismiss. #AnyItemViewController", buf, 2u);
    }
  }
}

void __73__QLPreviewController_DocumentMenu__updateTitleMenuAndDocumentProperties__block_invoke_107(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained updateTitleMenuWithItem:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  [v4 createDocumentPropertiesWithItem:*(void *)(a1 + 32) shareableURL:*(void *)(a1 + 40)];
}

- (void)updateTitleMenuWithItem:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke;
  v7[3] = &unk_2642F5000;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  id v6 = [(QLPreviewController *)self _topNavigationItem];
  [v6 setTitleMenuProvider:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

id __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x263F82658];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_2;
  v11[3] = &unk_2642F4FD8;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  id v12 = *(id *)(a1 + 32);
  id v5 = v3;
  id v13 = v5;
  id v6 = [v4 elementWithProvider:v11];
  id v7 = (void *)MEMORY[0x263F82940];
  v15[0] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  id v9 = [v7 menuWithChildren:v8];

  objc_destroyWeak(&v14);

  return v9;
}

void __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_2(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_3;
    v5[3] = &unk_2642F4FB0;
    objc_copyWeak(&v9, a1 + 6);
    id v8 = v3;
    id v6 = a1[4];
    id v7 = a1[5];
    [WeakRetained saveEditsIfNecessary:v5];

    objc_destroyWeak(&v9);
  }
  else
  {
    (*((void (**)(id, void))v3 + 2))(v3, MEMORY[0x263EFFA68]);
  }
}

void __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_3(id *a1)
{
  objc_copyWeak(&v5, a1 + 7);
  id v4 = a1[6];
  id v2 = a1[4];
  id v3 = a1[5];
  QLRunInMainThread();

  objc_destroyWeak(&v5);
}

void __61__QLPreviewController_DocumentMenu__updateTitleMenuWithItem___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = [*(id *)(a1 + 32) saveURL];
    id v4 = [*(id *)(a1 + 32) editedFileURL];

    if (!v4) {
      goto LABEL_5;
    }
    id v5 = [*(id *)(a1 + 32) lastSavedEditedCopy];
    id v6 = [*(id *)(a1 + 32) editedCopy];
    if ([v5 isEqual:v6])
    {
      char v7 = [*(id *)(a1 + 32) originalContentWasUpdated];

      if (v7)
      {
LABEL_5:
        if (v3)
        {
LABEL_6:
          [WeakRetained updateDocumentPropertiesMetadataForItem:*(void *)(a1 + 32) withShareableURL:v3];
          id v8 = [WeakRetained titleMenuElementsForItem:*(void *)(a1 + 32) atURL:v3 withSuggestedActions:*(void *)(a1 + 40)];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          [WeakRetained updateDocumentPropertiesActivityProviderWithShareableURL:v3];
          [WeakRetained updateDocumentPropertiesDragItemsProviderWithItem:*(void *)(a1 + 32) shareableURL:v3];

LABEL_15:
          goto LABEL_16;
        }
LABEL_10:
        BOOL v10 = (NSObject **)MEMORY[0x263F62940];
        BOOL v11 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          BOOL v11 = *v10;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)id v12 = 0;
          _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_ERROR, "Could not get share URL to update document menu. This could lead to no button to dismiss. #AnyItemViewController", v12, 2u);
        }
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        goto LABEL_15;
      }
    }
    else
    {
    }
    uint64_t v9 = [*(id *)(a1 + 32) editedFileURL];

    id v3 = (void *)v9;
    if (v9) {
      goto LABEL_6;
    }
    goto LABEL_10;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_16:
}

- (void)createDocumentPropertiesWithItem:(id)a3 shareableURL:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F826A0];
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)[[v6 alloc] initWithURL:v7];
  uint64_t v9 = [(QLPreviewController *)self _topNavigationItem];
  [v9 setDocumentProperties:v10];

  [(QLPreviewController *)self updateDocumentPropertiesActivityProviderWithShareableURL:v7];
  [(QLPreviewController *)self updateDocumentPropertiesDragItemsProviderWithItem:v8 shareableURL:v7];
}

- (void)updateDocumentPropertiesActivityProviderWithShareableURL:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesActivityProviderWithShareableURL___block_invoke;
  v8[3] = &unk_2642F5028;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = [(QLPreviewController *)self _topNavigationItem];
  id v7 = [v6 documentProperties];
  [v7 setActivityViewControllerProvider:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

id __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesActivityProviderWithShareableURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained previewCollection];
    [v4 documentMenuActionWillBegin];

    id v5 = [v3 activityControllerForURL:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)updateDocumentPropertiesDragItemsProviderWithItem:(id)a3 shareableURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x263EF8330];
  objc_copyWeak(&v15, &location);
  id v8 = v6;
  id v13 = v8;
  id v9 = v7;
  id v14 = v9;
  id v10 = [(QLPreviewController *)self _topNavigationItem];
  BOOL v11 = [v10 documentProperties];
  [v11 setDragItemsProvider:&v12];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

id __100__QLPreviewController_DocumentMenu__updateDocumentPropertiesDragItemsProviderWithItem_shareableURL___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained itemProviderForItem:*(void *)(a1 + 32) shareableURL:*(void *)(a1 + 40)];
    id v5 = (void *)[objc_alloc(MEMORY[0x263F826C8]) initWithItemProvider:v4];
    [v5 setLocalObject:*(void *)(a1 + 32)];
    v8[0] = v5;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v6 = (void *)MEMORY[0x263EFFA68];
  }

  return v6;
}

- (void)updateDocumentPropertiesMetadataForItem:(id)a3 withShareableURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F103B8]);
  id v9 = [v6 previewItemContentType];
  [v8 setType:v9];

  id v10 = [v6 previewItemTitle];
  [v8 setName:v10];

  BOOL v11 = [v6 fetcher];
  uint64_t v12 = [v11 itemSize];
  objc_msgSend(v8, "setSize:", objc_msgSend(v12, "unsignedIntegerValue"));

  id v13 = objc_alloc_init(MEMORY[0x263F103C8]);
  [v13 setType:0];
  id v14 = objc_alloc(MEMORY[0x263F103C0]);
  id v15 = [v6 MIMEType];
  v16 = (void *)[v14 initByReferencingFileURL:v7 MIMEType:v15 properties:v13];
  [v8 setThumbnail:v16];

  id v17 = objc_alloc(MEMORY[0x263F160C8]);
  QLCGSizeFromQLItemThumbnailSize();
  double v19 = v18;
  double v21 = v20;
  v22 = [MEMORY[0x263F82B60] mainScreen];
  [v22 scale];
  v24 = objc_msgSend(v17, "initWithFileAtURL:size:scale:representationTypes:", v7, -1, v19, v21, v23);

  objc_initWeak(&location, self);
  v25 = [MEMORY[0x263F160D0] sharedGenerator];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesMetadataForItem_withShareableURL___block_invoke;
  v30[3] = &unk_2642F50A0;
  objc_copyWeak(&v32, &location);
  id v26 = v13;
  id v31 = v26;
  [v25 generateBestRepresentationForRequest:v24 completionHandler:v30];

  id v27 = objc_alloc_init(MEMORY[0x263F103D8]);
  [v27 setOriginalURL:v7];
  [v27 setSpecialization:v8];
  v28 = [(QLPreviewController *)self _topNavigationItem];
  v29 = [v28 documentProperties];
  [v29 setMetadata:v27];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesMetadataForItem_withShareableURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = v3;
    id v6 = *(id *)(a1 + 32);
    QLRunInMainThread();
  }
}

void __94__QLPreviewController_DocumentMenu__updateDocumentPropertiesMetadataForItem_withShareableURL___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _topNavigationItem];
  id v3 = [v2 documentProperties];
  id v4 = [v3 metadata];
  id v11 = (id)[v4 copy];

  id v5 = objc_alloc(MEMORY[0x263F103C0]);
  id v6 = [*(id *)(a1 + 40) UIImage];
  id v7 = (void *)[v5 initWithPlatformImage:v6 properties:*(void *)(a1 + 48)];
  id v8 = [v11 specialization];
  [v8 setThumbnail:v7];

  id v9 = [*(id *)(a1 + 32) _topNavigationItem];
  id v10 = [v9 documentProperties];
  [v10 setMetadata:v11];
}

- (id)titleMenuElementsForItem:(id)a3 atURL:(id)a4 withSuggestedActions:(id)a5
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x263EFF980] array];
  uint64_t v12 = [MEMORY[0x263EFF980] array];
  v49 = self;
  v46 = v9;
  v47 = v8;
  uint64_t v13 = [(QLPreviewController *)self saveToFilesActionForItem:v8 atURL:v9];
  if (v13) {
    [v12 addObject:v13];
  }
  uint64_t v14 = [(QLPreviewController *)self saveToPhotosActionForItem:v8 atURL:v46];
  if (v14) {
    [v12 addObject:v14];
  }
  uint64_t v15 = [(QLPreviewController *)self lockPDFActionForItem:v47 atURL:v46];
  if (v15) {
    [v12 addObject:v15];
  }
  v41 = (void *)v15;
  v42 = (void *)v14;
  v43 = (void *)v13;
  if ([v12 count])
  {
    v16 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C8FAD38 image:0 identifier:0 options:1 children:v12];
    [v11 addObject:v16];
  }
  v44 = v12;
  v45 = v11;
  id v17 = [MEMORY[0x263EFF980] array];
  int v48 = [MEMORY[0x263F086E0] mainBundleSupportsPrintCommand];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v10;
  uint64_t v18 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
  double v19 = v49;
  unint64_t v20 = 0x263F82000uLL;
  if (v18)
  {
    uint64_t v21 = v18;
    uint64_t v22 = *(void *)v55;
    uint64_t v51 = *MEMORY[0x263F83888];
    uint64_t v50 = *MEMORY[0x263F83848];
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v55 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v54 + 1) + 8 * v23);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v26 = 0;
          goto LABEL_21;
        }
        id v25 = v24;
        id v26 = v25;
        if (!v25) {
          goto LABEL_21;
        }
        id v27 = [v25 identifier];
        int v28 = [v27 isEqual:v51];

        if (v28)
        {
          if ([(QLPreviewController *)v19 canPerformAction:sel_print_ withSender:v19])
          {
            if (v48)
            {
              v29 = v17;
              v30 = v26;
              goto LABEL_22;
            }
            v36 = [(QLPreviewController *)v19 printActionForItem:v47 atURL:v46];
            if (v36) {
              [v17 addObject:v36];
            }
          }
          else
          {
            v35 = *MEMORY[0x263F62940];
            if (!*MEMORY[0x263F62940])
            {
              QLSInitLogging();
              v35 = *MEMORY[0x263F62940];
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_217F61000, v35, OS_LOG_TYPE_DEFAULT, "Print can be offered by a responder in the responder chain but QuickLook only shows its own #AnyItemViewController", buf, 2u);
            }
          }
        }
        else
        {
          id v31 = [v26 identifier];
          if (([v31 isEqual:v50] & 1) == 0)
          {

LABEL_21:
            v29 = v17;
            v30 = v24;
LABEL_22:
            [v29 addObject:v30];
            goto LABEL_23;
          }
          id v32 = [MEMORY[0x263F086E0] mainBundle];
          v33 = [v32 bundleIdentifier];
          char v34 = [v33 isEqualToString:@"com.apple.DocumentsApp"];

          if (v34)
          {
            double v19 = v49;
            unint64_t v20 = 0x263F82000;
            goto LABEL_21;
          }
          v37 = *MEMORY[0x263F62940];
          if (!*MEMORY[0x263F62940])
          {
            QLSInitLogging();
            v37 = *MEMORY[0x263F62940];
          }
          double v19 = v49;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_217F61000, v37, OS_LOG_TYPE_DEFAULT, "QuickLook only shows document-related suggested items in its title menu when presented from Files #AnyItemViewController", buf, 2u);
          }
          unint64_t v20 = 0x263F82000;
        }
LABEL_23:

        ++v23;
      }
      while (v21 != v23);
      uint64_t v38 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
      uint64_t v21 = v38;
    }
    while (v38);
  }

  if ([v17 count])
  {
    v39 = [*(id *)(v20 + 2368) menuWithTitle:&stru_26C8FAD38 image:0 identifier:0 options:1 children:v17];
    [v45 addObject:v39];
  }

  return v45;
}

- (void)presentError:(id)a3 forAction:(id)a4
{
  id v5 = a4;
  id v6 = [a3 userInfo];
  id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = NSString;
    id v11 = QLLocalizedString();
    uint64_t v12 = [v5 displayString];
    objc_msgSend(v10, "stringWithFormat:", v11, v12);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v13 = v9;
  QLRunInMainThread();
}

void __60__QLPreviewController_DocumentMenu__presentError_forAction___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:*(void *)(a1 + 32) preferredStyle:1];
  id v2 = [MEMORY[0x263F82400] actionWithTitle:@"OK" style:0 handler:0];
  [v5 addAction:v2];
  id v3 = [v5 actions];
  id v4 = [v3 lastObject];
  [v5 setPreferredAction:v4];

  [*(id *)(a1 + 40) presentViewController:v5 animated:1 completion:0];
}

- (void)handleShortcutsActionOutputFile:(id)a3 forAction:(id)a4
{
  id v5 = a3;
  id v4 = v5;
  QLRunInMainThread();
}

void __79__QLPreviewController_DocumentMenu__handleShortcutsActionOutputFile_forAction___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(MEMORY[0x263F82698]);
  id v3 = [*(id *)(a1 + 32) fileURL];
  v6[0] = v3;
  id v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  id v5 = (void *)[v2 initForExportingURLs:v4 asCopy:1];

  objc_msgSend(v5, "_setIsContentManaged:", objc_msgSend(*(id *)(a1 + 40), "isContentManaged"));
  [*(id *)(a1 + 40) presentViewController:v5 animated:1 completion:0];
}

- (id)saveToFilesActionForItem:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = QLLocalizedString();
  id v9 = [MEMORY[0x263F827E8] systemImageNamed:@"folder"];
  objc_initWeak(&location, self);
  id v10 = (void *)MEMORY[0x263F823D0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke;
  v23[3] = &unk_2642F50F0;
  objc_copyWeak(&v25, &location);
  id v11 = v7;
  id v24 = v11;
  uint64_t v12 = [v10 actionWithTitle:v8 image:v9 identifier:0 handler:v23];
  uint64_t v13 = [v6 saveURL];
  uint64_t v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (void *)v13;
  }
  else {
    uint64_t v15 = v11;
  }
  id v16 = v15;

  if (FPURLMightBeInFileProvider())
  {
    id v17 = (void *)MEMORY[0x263F82658];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_2;
    v20[3] = &unk_2642F5168;
    id v21 = v16;
    id v22 = v12;
    id v18 = [v17 elementWithProvider:v20];
  }
  else
  {
    id v18 = v12;
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v18;
}

void __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained previewCollection];
    [v4 documentMenuActionWillBegin];

    id v5 = objc_alloc(MEMORY[0x263F82698]);
    v8[0] = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    id v7 = (void *)[v5 initForExportingURLs:v6 asCopy:1];

    objc_msgSend(v7, "_setIsContentManaged:", objc_msgSend(v3, "isContentManaged"));
    [v3 presentViewController:v7 animated:1 completion:0];
  }
}

void __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F054C0] defaultManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_3;
  v7[3] = &unk_2642F5140;
  id v9 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v6 = v3;
  [v4 fetchItemForURL:v5 completionHandler:v7];
}

void __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  QLRunInMainThread();
}

void __68__QLPreviewController_DocumentMenu__saveToFilesActionForItem_atURL___block_invoke_4(void *a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = a1[6];
  if (a1[4])
  {
    id v2 = *(void (**)(uint64_t, uint64_t))(v1 + 16);
    uint64_t v3 = MEMORY[0x263EFFA68];
    uint64_t v4 = a1[6];
    v2(v4, v3);
  }
  else
  {
    v6[0] = a1[5];
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);
  }
}

- (void)exportItem:(id)a3 atURL:(id)a4
{
  v52[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v34 = v6;
  if ([v6 previewItemType] == 2 && objc_msgSend(v6, "editingMode"))
  {
    v35 = (void *)[objc_alloc(MEMORY[0x263F85210]) initWithSurface:1];
    id v8 = objc_alloc(MEMORY[0x263F85218]);
    id v9 = (void *)MEMORY[0x263F1D920];
    id v32 = v7;
    id v10 = [v7 pathExtension];
    id v11 = [v9 typeWithFilenameExtension:v10];
    uint64_t v12 = [v8 initWithFileURL:v32 type:v11];

    v30 = (void *)v12;
    v52[0] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];
    [v35 setFiles:v13];

    uint64_t v14 = [MEMORY[0x263F85128] standardClient];
    id v45 = 0;
    id v31 = [v14 contextualActionsForContext:v35 error:&v45];
    id v33 = v45;

    if (v33)
    {
      uint64_t v15 = (NSObject **)MEMORY[0x263F62940];
      id v16 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v16 = *v15;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v33;
        _os_log_impl(&dword_217F61000, v16, OS_LOG_TYPE_DEFAULT, "Fetching contextual actions from Shortcuts failed with error: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      id v17 = [MEMORY[0x263F85128] standardClient];
      id v44 = 0;
      v29 = [v17 filteredContextualActions:v31 forContext:v35 byType:0 error:&v44];
      id v33 = v44;

      if (v33)
      {
        id v18 = (NSObject **)MEMORY[0x263F62940];
        double v19 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          double v19 = *v18;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v33;
          _os_log_impl(&dword_217F61000, v19, OS_LOG_TYPE_DEFAULT, "Filtering fetched contextual actions from Shortcuts failed with error: %@ #AnyItemViewController", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id obj = v29;
        uint64_t v20 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v41;
          uint64_t v22 = *MEMORY[0x263F856A0];
          do
          {
            for (uint64_t i = 0; i != v20; ++i)
            {
              if (*(void *)v41 != v21) {
                objc_enumerationMutation(obj);
              }
              id v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              id v25 = objc_msgSend(v24, "identifier", v29);
              int v26 = [v25 isEqualToString:v22];

              if (v26)
              {
                id v27 = [(QLPreviewController *)self previewCollection];
                [v27 documentMenuActionWillBegin];

                objc_initWeak(&location, self);
                *(void *)&long long buf = 0;
                *((void *)&buf + 1) = &buf;
                uint64_t v47 = 0x3032000000;
                int v48 = __Block_byref_object_copy_;
                v49 = __Block_byref_object_dispose_;
                id v50 = (id)objc_opt_new();
                int v28 = *(void **)(*((void *)&buf + 1) + 40);
                if (v28)
                {
                  v37[0] = MEMORY[0x263EF8330];
                  v37[1] = 3221225472;
                  v37[2] = __54__QLPreviewController_DocumentMenu__exportItem_atURL___block_invoke;
                  v37[3] = &unk_2642F5190;
                  objc_copyWeak(&v38, &location);
                  v37[4] = v24;
                  v37[5] = &buf;
                  [v28 runAction:v24 withContext:v35 completionHandler:v37];
                  objc_destroyWeak(&v38);
                }
                _Block_object_dispose(&buf, 8);

                objc_destroyWeak(&location);
              }
            }
            uint64_t v20 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
          }
          while (v20);
        }
      }
    }

    id v7 = v32;
  }
}

void __54__QLPreviewController_DocumentMenu__exportItem_atURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 domain];
  if (v7 == (void *)*MEMORY[0x263F07F70] && [v6 code] == 3072)
  {
  }
  else
  {
    id v8 = [v6 domain];
    BOOL v9 = v8 != (void *)*MEMORY[0x263F08410] || [v6 code] != -128;

    if (v6 && v9)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained presentError:v6 forAction:*(void *)(a1 + 32)];
      goto LABEL_17;
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id WeakRetained = v5;
  uint64_t v11 = [WeakRetained countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(WeakRetained);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v14);
        id v16 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v16, "handleShortcutsActionOutputFile:forAction:", v15, *(void *)(a1 + 32), (void)v19);

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [WeakRetained countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
LABEL_17:

  uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
  id v18 = *(void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;
}

- (BOOL)canPerformExportForItem:(id)a3 atURL:(id)a4
{
  v49[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 previewItemType] == 2 && objc_msgSend(v6, "editingMode"))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F85210]) initWithSurface:1];
    id v9 = objc_alloc(MEMORY[0x263F85218]);
    id v10 = (void *)MEMORY[0x263F1D920];
    uint64_t v11 = [v7 pathExtension];
    uint64_t v12 = [v10 typeWithFilenameExtension:v11];
    uint64_t v13 = (void *)[v9 initWithFileURL:v7 type:v12];

    v49[0] = v13;
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
    [v8 setFiles:v14];

    uint64_t v15 = [MEMORY[0x263F85128] standardClient];
    id v45 = 0;
    uint64_t v16 = [v15 contextualActionsForContext:v8 error:&v45];
    id v17 = v45;

    v39 = (void *)v16;
    if (v17)
    {
      id v18 = (NSObject **)MEMORY[0x263F62940];
      long long v19 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        long long v19 = *v18;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v48 = v17;
        _os_log_impl(&dword_217F61000, v19, OS_LOG_TYPE_DEFAULT, "Fetching contextual actions from Shortcuts failed with error: %@ #AnyItemViewController", buf, 0xCu);
      }
      BOOL v20 = 0;
    }
    else
    {
      long long v21 = [MEMORY[0x263F85128] standardClient];
      id v44 = 0;
      long long v22 = [v21 filteredContextualActions:v16 forContext:v8 byType:0 error:&v44];
      id v17 = v44;

      id v38 = v22;
      if (v17)
      {
        uint64_t v23 = (NSObject **)MEMORY[0x263F62940];
        uint64_t v24 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          uint64_t v24 = *v23;
        }
        BOOL v20 = 0;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v48 = v17;
          _os_log_impl(&dword_217F61000, v24, OS_LOG_TYPE_DEFAULT, "Filtering fetched contextual actions from Shortcuts failed with error: %@ #AnyItemViewController", buf, 0xCu);
          BOOL v20 = 0;
        }
      }
      else
      {
        v35 = self;
        v36 = v13;
        v37 = v8;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        id v25 = v22;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v40 objects:v46 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = *(void *)v41;
          uint64_t v29 = *MEMORY[0x263F856A0];
          while (2)
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v41 != v28) {
                objc_enumerationMutation(v25);
              }
              id v31 = [*(id *)(*((void *)&v40 + 1) + 8 * i) identifier];
              char v32 = [v31 isEqualToString:v29];

              if (v32)
              {
                id v33 = [(QLPreviewController *)v35 previewCollection];
                [v33 documentMenuActionWillBegin];

                BOOL v20 = 1;
                goto LABEL_25;
              }
            }
            uint64_t v27 = [v25 countByEnumeratingWithState:&v40 objects:v46 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }

        BOOL v20 = 0;
LABEL_25:
        uint64_t v13 = v36;
        id v8 = v37;
      }
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)printActionForItem:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(QLPreviewController *)self printer];
  char v23 = 0;
  id v22 = v8;
  BOOL v9 = [(QLPreviewController *)self canPerformPrintForItem:v6 customPrinter:&v22 shouldUseDefaultPrinter:&v23];
  id v10 = v22;

  if (v9)
  {
    uint64_t v11 = QLLocalizedString();
    uint64_t v12 = [MEMORY[0x263F827E8] systemImageNamed:@"printer"];
    objc_initWeak(&location, self);
    uint64_t v13 = (void *)MEMORY[0x263F823D0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __62__QLPreviewController_DocumentMenu__printActionForItem_atURL___block_invoke;
    v16[3] = &unk_2642F51B8;
    objc_copyWeak(&v19, &location);
    id v17 = v7;
    id v18 = v10;
    char v20 = v23;
    uint64_t v14 = [v13 actionWithTitle:v11 image:v12 identifier:0 handler:v16];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __62__QLPreviewController_DocumentMenu__printActionForItem_atURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained printItemAtURL:*(void *)(a1 + 32) withCustomPrinter:*(void *)(a1 + 40) shouldUseDefaultPrinter:*(unsigned __int8 *)(a1 + 56)];
}

- (BOOL)canPerformPrintForItem:(id)a3 atURL:(id)a4
{
  id v5 = a3;
  id v6 = [(QLPreviewController *)self printer];
  char v10 = 0;
  id v9 = v6;
  LOBYTE(self) = [(QLPreviewController *)self canPerformPrintForItem:v5 customPrinter:&v9 shouldUseDefaultPrinter:&v10];

  id v7 = v9;
  return (char)self;
}

- (BOOL)canPerformPrintForItem:(id)a3 customPrinter:(id *)a4 shouldUseDefaultPrinter:(BOOL *)a5
{
  id v7 = [a3 previewItemContentType];
  if (v7)
  {
    id v8 = [MEMORY[0x263F1D920] typeWithIdentifier:v7];
  }
  else
  {
    id v8 = 0;
  }
  BOOL v9 = 0;
  if (([v8 conformsToType:*MEMORY[0x263F1DB70]] & 1) == 0)
  {
    char v10 = [MEMORY[0x263F61090] printableUTIs];
    *a5 = [v10 containsObject:v7];

    if (*a5 || *a4) {
      BOOL v9 = 1;
    }
  }

  return v9;
}

- (void)printItemAtURL:(id)a3 withCustomPrinter:(id)a4 shouldUseDefaultPrinter:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = [(QLPreviewController *)self previewCollection];
  [v10 documentMenuActionWillBegin];

  id v11 = objc_alloc_init(MEMORY[0x263F61090]);
  objc_msgSend(v11, "setIsContentManaged:", -[QLPreviewController isContentManaged](self, "isContentManaged"));
  char v12 = [v8 startAccessingSecurityScopedResource];
  [v11 setPrintingItem:v8];
  if (v9 && !a5)
  {
    uint64_t v13 = [[QLPreviewPrinter alloc] initWithPreviewPrinter:v9];
    [v11 setPrintPageRenderer:v13];
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  void v15[2] = __94__QLPreviewController_DocumentMenu__printItemAtURL_withCustomPrinter_shouldUseDefaultPrinter___block_invoke;
  v15[3] = &unk_2642F51E0;
  char v17 = v12;
  id v16 = v8;
  id v14 = v8;
  [v11 presentAnimated:1 completionHandler:v15];
}

uint64_t __94__QLPreviewController_DocumentMenu__printItemAtURL_withCustomPrinter_shouldUseDefaultPrinter___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

- (void)printItem:(id)a3 atURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(QLPreviewController *)self printer];
  unsigned __int8 v12 = 0;
  id v11 = v8;
  BOOL v9 = [(QLPreviewController *)self canPerformPrintForItem:v7 customPrinter:&v11 shouldUseDefaultPrinter:&v12];

  id v10 = v11;
  if (v9) {
    [(QLPreviewController *)self printItemAtURL:v6 withCustomPrinter:v10 shouldUseDefaultPrinter:v12];
  }
}

- (id)activityControllerForURL:(id)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F1C3E8]);
  v11[0] = v4;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v7 = (void *)[v5 initWithActivityItems:v6 applicationActivities:0];

  objc_msgSend(v7, "setIsContentManaged:", -[QLPreviewController isContentManaged](self, "isContentManaged"));
  id v8 = [(QLPreviewController *)self excludedActivityTypesForCurrentPreviewItem];
  [v7 setExcludedActivityTypes:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__QLPreviewController_DocumentMenu__activityControllerForURL___block_invoke;
  v10[3] = &unk_2642F5208;
  v10[4] = self;
  [v7 setCompletionWithItemsHandler:v10];
  if ([v4 startAccessingSecurityScopedResource]) {
    [(QLPreviewController *)self setAccessedUrlForSharingController:v4];
  }

  return v7;
}

uint64_t __62__QLPreviewController_DocumentMenu__activityControllerForURL___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) shareSheetDidDismiss];
}

- (id)lockPDFActionForItem:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 previewItemType] == 11)
  {
    id v8 = QLLocalizedString();
    BOOL v9 = [MEMORY[0x263F827E8] systemImageNamed:@"lock"];
    objc_initWeak(&location, self);
    id v10 = (void *)MEMORY[0x263F82658];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    void v15[2] = __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke;
    v15[3] = &unk_2642F4FD8;
    objc_copyWeak(&v18, &location);
    id v11 = v8;
    id v16 = v11;
    id v12 = v9;
    id v17 = v12;
    uint64_t v13 = [v10 elementWithProvider:v15];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

void __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v5 = [WeakRetained previewCollection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_2;
  v7[3] = &unk_2642F5280;
  id v8 = a1[4];
  id v9 = a1[5];
  objc_copyWeak(&v11, a1 + 6);
  id v6 = v3;
  id v10 = v6;
  [v5 shouldDisplayLockActivityWithCompletionHandler:v7];

  objc_destroyWeak(&v11);
}

void __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_2(id *a1, char a2)
{
  char v7 = a2;
  id v3 = a1[4];
  id v4 = a1[5];
  objc_copyWeak(&v6, a1 + 7);
  id v5 = a1[6];
  QLRunInMainThread();

  objc_destroyWeak(&v6);
}

void __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_3(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  if (*(unsigned char *)(a1 + 64))
  {
    id v2 = (void *)MEMORY[0x263F823D0];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_4;
    v9[3] = &unk_2642F5230;
    objc_copyWeak(&v10, (id *)(a1 + 56));
    id v5 = [v2 actionWithTitle:v3 image:v4 identifier:0 handler:v9];
    uint64_t v6 = *(void *)(a1 + 48);
    v11[0] = v5;
    char v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    objc_destroyWeak(&v10);
  }
  else
  {
    id v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v8();
  }
}

void __64__QLPreviewController_DocumentMenu__lockPDFActionForItem_atURL___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained previewCollection];
  [v3 documentMenuActionWillBegin];

  id v5 = objc_loadWeakRetained(v1);
  uint64_t v4 = [v5 previewCollection];
  [v4 requestLockForCurrentItem];
}

- (id)saveToPhotosActionForItem:(id)a3 atURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 previewItemType] != 2
    && [v6 previewItemType] != 3
    && [v6 previewItemType] != 1)
  {
    goto LABEL_16;
  }
  if ([v6 previewItemType] == 1)
  {
    id v8 = [v6 previewItemContentType];
    if (v8)
    {
      id v9 = [MEMORY[0x263F1D920] typeWithIdentifier:v8];
    }
    else
    {
      id v9 = 0;
    }
    if ([v9 conformsToType:*MEMORY[0x263F1D9B8]])
    {

LABEL_16:
      id v16 = 0;
      goto LABEL_17;
    }
    char v10 = [v9 conformsToType:*MEMORY[0x263F1DB70]];

    if (v10) {
      goto LABEL_16;
    }
  }
  id v11 = [(QLPreviewController *)self previewCollection];
  int v12 = [v11 isRemote];

  if (!v12) {
    goto LABEL_16;
  }
  uint64_t v13 = [MEMORY[0x263F827E8] systemImageNamed:@"square.and.arrow.down"];
  if ([v6 previewItemType] == 2
    || [v6 previewItemType] == 3
    || [v6 previewItemType] == 1)
  {
    id v14 = QLLocalizedString();
  }
  else
  {
    id v14 = 0;
  }
  objc_initWeak(&location, self);
  uint64_t v15 = (void *)MEMORY[0x263F823D0];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__QLPreviewController_DocumentMenu__saveToPhotosActionForItem_atURL___block_invoke;
  v18[3] = &unk_2642F52D0;
  objc_copyWeak(&v22, &location);
  id v19 = v7;
  char v20 = self;
  id v21 = v6;
  id v16 = [v15 actionWithTitle:v14 image:v13 identifier:0 handler:v18];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

LABEL_17:

  return v16;
}

void __69__QLPreviewController_DocumentMenu__saveToPhotosActionForItem_atURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained previewCollection];
    [v6 documentMenuActionWillBegin];

    id v7 = [MEMORY[0x263F054E0] wrapperWithURL:*(void *)(a1 + 32) readonly:1 error:0];
    id v8 = [*(id *)(a1 + 40) previewCollection];
    uint64_t v9 = [*(id *)(a1 + 48) previewItemType];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__QLPreviewController_DocumentMenu__saveToPhotosActionForItem_atURL___block_invoke_2;
    v10[3] = &unk_2642F52A8;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    id v11 = *(id *)(a1 + 48);
    [v8 saveIntoPhotoLibraryMediaWithURLWrapper:v7 previewItemType:v9 completionHandler:v10];

    objc_destroyWeak(&v12);
  }
}

void __69__QLPreviewController_DocumentMenu__saveToPhotosActionForItem_atURL___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (NSObject **)MEMORY[0x263F62940];
    id v7 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_DEFAULT, "Saved item to photos #AnyItemViewController", v9, 2u);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained presentSaveToPhotoError:v5 forItem:*(void *)(a1 + 32)];
  }
}

- (void)presentSaveToPhotoError:(id)a3 forItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v9 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    char v10 = v9;
    id v11 = [v6 localizedDescription];
    *(_DWORD *)long long buf = 138412290;
    char v20 = v11;
    _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "Error saving item to photos: %@ #AnyItemViewController", buf, 0xCu);
  }
  if ([v7 previewItemType] == 2
    || [v7 previewItemType] == 3
    || [v7 previewItemType] == 1)
  {
    id v12 = QLLocalizedString();
  }
  else
  {
    id v12 = 0;
  }
  uint64_t v13 = [MEMORY[0x263F82418] alertControllerWithTitle:@"Error" message:v12 preferredStyle:1];
  id v14 = (void *)MEMORY[0x263F82400];
  uint64_t v15 = QLLocalizedString();
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __69__QLPreviewController_DocumentMenu__presentSaveToPhotoError_forItem___block_invoke;
  v18[3] = &unk_2642F52F8;
  void v18[4] = self;
  id v16 = [v14 actionWithTitle:v15 style:0 handler:v18];
  [v13 addAction:v16];

  id v17 = v13;
  QLRunInMainThread();
}

uint64_t __69__QLPreviewController_DocumentMenu__presentSaveToPhotoError_forItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __69__QLPreviewController_DocumentMenu__presentSaveToPhotoError_forItem___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (id)excludedActivityTypesForCurrentPreviewItem
{
  id v3 = objc_opt_new();
  uint64_t v4 = (void *)MEMORY[0x263F62978];
  id v5 = [(QLPreviewController *)self currentPreviewItem];
  id v6 = [v4 itemWithPreviewItem:v5];

  if ([v6 previewItemType] == 3) {
    [v3 addObject:*MEMORY[0x263F1D010]];
  }
  id v7 = [(QLPreviewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(QLPreviewController *)self delegate];
    char v10 = [v9 excludedActivityTypesForPreviewController:self];
    [v3 addObjectsFromArray:v10];
  }
  [v3 addObject:*MEMORY[0x263F1CFC0]];
  [v3 addObject:*MEMORY[0x263F1D018]];

  return v3;
}

- (id)printInfoForDocumentInteractionController:(id)a3
{
  id v3 = [(QLPreviewController *)self currentItemProvider];
  uint64_t v4 = [v3 printInfo];

  return v4;
}

- (id)activityItemForDocumentInteractionController:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewController *)self internalCurrentPreviewItem];
  uint64_t v6 = [v5 previewItemType];

  if (v6 == 3)
  {
    gotLoadHelper_x8__OBJC_CLASS___PUVideoComplementItemSource(v7);
    id v9 = objc_alloc(*(Class *)(v8 + 1184));
    char v10 = [v4 URL];
    id v11 = (void *)[v9 initWithVideoComplementBundleAtURL:v10];
  }
  else
  {
    id v12 = [(QLPreviewController *)self currentItemProvider];

    if (!v12)
    {
      uint64_t v13 = objc_opt_new();
      [(QLPreviewController *)self setCurrentItemProvider:v13];
    }
    id v14 = [(QLPreviewController *)self internalCurrentPreviewItem];
    uint64_t v15 = [(QLPreviewController *)self currentItemProvider];
    [v15 setActivityPreviewItem:v14];

    id v16 = [QLPreviewPrinter alloc];
    id v17 = [(QLPreviewController *)self printer];
    id v18 = [(QLPreviewPrinter *)v16 initWithPreviewPrinter:v17];
    id v19 = [(QLPreviewController *)self currentItemProvider];
    [v19 setPrinter:v18];

    id v11 = [(QLPreviewController *)self currentItemProvider];
  }

  return v11;
}

- (id)additionalActivitiesForDocumentInteractionController:(id)a3
{
  id v4 = objc_opt_new();
  id v5 = [(QLPreviewController *)self internalCurrentPreviewItem];
  uint64_t v6 = [v5 previewItemType];

  if (v6 == 3)
  {
    gotLoadHelper_x8__OBJC_CLASS___PUUISaveToCameraRollActivity(v7);
    uint64_t v8 = objc_opt_new();
    [v4 addObject:v8];
  }
  id v9 = [(QLPreviewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = [(QLPreviewController *)self delegate];
    id v12 = [v11 additionalActivitiesTypesForPreviewController:self];
    [v4 addObjectsFromArray:v12];
  }

  return v4;
}

- (id)activityItemsConfiguration
{
  v19[1] = *MEMORY[0x263EF8340];
  id v3 = [(QLPreviewController *)self internalCurrentPreviewItem];
  id v4 = [v3 saveURL];
  id v5 = [v3 editedFileURL];

  if (v5)
  {
    uint64_t v6 = [v3 lastSavedEditedCopy];
    double v7 = [v3 editedCopy];
    if ([v6 isEqual:v7])
    {
      char v8 = [v3 originalContentWasUpdated];

      if (v8) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    uint64_t v9 = [v3 editedFileURL];

    id v4 = (void *)v9;
  }
LABEL_7:
  char v10 = [(QLPreviewController *)self itemProviderForItem:v3 shareableURL:v4];
  id v11 = objc_alloc(MEMORY[0x263F823F8]);
  v19[0] = v10;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  uint64_t v13 = (void *)[v11 initWithItemProviders:v12];

  id v14 = [(QLPreviewController *)self title];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __59__QLPreviewController_Activity__activityItemsConfiguration__block_invoke;
  v17[3] = &unk_2642F5340;
  id v18 = v14;
  id v15 = v14;
  [v13 setMetadataProvider:v17];

  return v13;
}

id __59__QLPreviewController_Activity__activityItemsConfiguration__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 isEqual:*MEMORY[0x263F832F8]])
  {
    id v3 = objc_alloc_init(MEMORY[0x263F103D8]);
    [v3 setTitle:*(void *)(a1 + 32)];
  }
  else
  {
    id v3 = *(id *)(a1 + 32);
  }

  return v3;
}

- (id)itemProviderForItem:(id)a3 shareableURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F088E0]);
  uint64_t v9 = [v6 previewItemTitle];
  [v8 setSuggestedName:v9];

  char v10 = [v6 fetcher];
  id v11 = [v10 shareableItem];

  id v12 = [v6 previewItemContentType];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x263F1D920] typeWithIdentifier:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_initWeak(location, self);
  if (v7)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke;
    aBlock[3] = &unk_2642F5390;
    objc_copyWeak(&v30, location);
    id v14 = v6;
    id v28 = v14;
    id v15 = v7;
    id v29 = v15;
    id v16 = _Block_copy(aBlock);
    if (v13)
    {
      [v8 registerFileRepresentationForContentType:v13 visibility:0 openInPlace:1 loadHandler:v16];
    }
    else if (v12)
    {
      [v8 registerFileRepresentationForTypeIdentifier:v12 fileOptions:1 visibility:0 loadHandler:v16];
    }
    else
    {
      uint64_t v19 = objc_opt_class();
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_3;
      v23[3] = &unk_2642F53B8;
      objc_copyWeak(&v26, location);
      id v24 = v14;
      id v25 = v15;
      [v8 registerObjectOfClass:v19 visibility:0 loadHandler:v23];

      objc_destroyWeak(&v26);
    }

    objc_destroyWeak(&v30);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_5;
    v20[3] = &unk_2642F53E0;
    objc_copyWeak(&v22, location);
    id v21 = v6;
    id v17 = _Block_copy(v20);
    if (v13)
    {
      [v8 registerDataRepresentationForContentType:v13 visibility:0 loadHandler:v17];
    }
    else if (v12)
    {
      [v8 registerDataRepresentationForTypeIdentifier:v12 visibility:0 loadHandler:v17];
    }

    objc_destroyWeak(&v22);
  }
  objc_destroyWeak(location);

  return v8;
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [WeakRetained internalCurrentPreviewItem];

    if (v6 == v7)
    {
      id v11 = objc_loadWeakRetained((id *)(a1 + 48));
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_2;
      v13[3] = &unk_2642F5368;
      id v14 = v3;
      [v11 shareableURLForCurrentPreviewItem:v13];
    }
    else
    {
      (*((void (**)(id, void, uint64_t, void))v3 + 2))(v3, *(void *)(a1 + 40), 1, 0);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F07F80];
    v16[0] = @"QLPreviewController not available anymore.";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    char v10 = [v8 errorWithDomain:@"com.apple.quicklook.QLPreviewController" code:0 userInfo:v9];

    (*((void (**)(id, void, void, void *))v3 + 2))(v3, 0, 0, v10);
  }

  return 0;
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_3(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [WeakRetained internalCurrentPreviewItem];

    if (v6 == v7)
    {
      id v11 = objc_loadWeakRetained((id *)(a1 + 48));
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_4;
      v13[3] = &unk_2642F5368;
      id v14 = v3;
      [v11 shareableURLForCurrentPreviewItem:v13];
    }
    else
    {
      (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), 0);
    }
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = *MEMORY[0x263F07F80];
    v16[0] = @"QLPreviewController not available anymore.";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
    char v10 = [v8 errorWithDomain:@"com.apple.quicklook.QLPreviewController" code:0 userInfo:v9];

    (*((void (**)(id, void, void *))v3 + 2))(v3, 0, v10);
  }

  return 0;
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __66__QLPreviewController_Activity__itemProviderForItem_shareableURL___block_invoke_5(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  if (WeakRetained)
  {
    id v6 = [*(id *)(a1 + 32) fetcher];
    id v7 = [v6 shareableItem];
    v4[2](v4, v7, 0);
  }
  else
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v11 = *MEMORY[0x263F07F80];
    v12[0] = @"QLPreviewController not available anymore.";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
    id v6 = [v8 errorWithDomain:@"com.apple.quicklook.QLPreviewController" code:0 userInfo:v9];

    ((void (**)(id, void *, void *))v4)[2](v4, 0, v6);
  }

  return 0;
}

- (QLPreviewController)initWithPreviewItems:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewController;
  id v5 = [(QLPreviewController *)&v10 init];
  if (v5)
  {
    id v6 = [[QLPreviewItemStore alloc] initWithPreviewItems:v4];
    previewItemStore = v5->_previewItemStore;
    v5->_previewItemStore = v6;

    [(QLPreviewItemStore *)v5->_previewItemStore setDelegate:v5];
    [(QLPreviewController *)v5 setDataSource:v5->_previewItemStore];
    id v8 = v5;
  }

  return v5;
}

+ (QLPreviewController)controllerWithItemStore:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  id v5 = (void *)v4[160];
  v4[160] = v3;
  id v6 = v3;

  [v4 setDataSource:v6];

  return (QLPreviewController *)v4;
}

- (QLPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v17.receiver = self;
  v17.super_class = (Class)QLPreviewController;
  id v4 = [(QLPreviewController *)&v17 initWithNibName:0 bundle:0];
  id v5 = v4;
  if (v4)
  {
    v4->_currentPreviewItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    [(QLPreviewController *)v4 setAutomaticallyAdjustsScrollViewInsets:0];
    v5->_presentationMode = 0;
    v5->_willTransitionToInternalView = 0;
    [(QLPreviewController *)v5 setAllowInteractiveTransitions:1];
    v5->_changingCurrentPreview = 0;
    uint64_t v6 = objc_opt_new();
    toolbarController = v5->_toolbarController;
    v5->_toolbarController = (QLToolbarController *)v6;

    uint64_t v8 = objc_opt_new();
    previewItemStore = v5->_previewItemStore;
    v5->_previewItemStore = (QLPreviewItemStore *)v8;

    [(QLPreviewItemStore *)v5->_previewItemStore setItemProvider:v5];
    [(QLPreviewItemStore *)v5->_previewItemStore setDelegate:v5];
    [(QLPreviewController *)v5 setModalPresentationCapturesStatusBarAppearance:1];
    id v10 = (id)[MEMORY[0x263F628F8] sharedManager];
    v5->_whitePointAdaptivityStyle = 0;
    v5->_canChangeCurrentPage = 1;
    v5->_canShowToolbar = 1;
    v5->_canShowNavBar = 1;
    v5->_deferredSetIndex = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v11;

    uint64_t v13 = [MEMORY[0x263F825C8] blackColor];
    fullscreenBackgroundColor = v5->_fullscreenBackgroundColor;
    v5->_fullscreenBackgroundColor = (UIColor *)v13;

    [(QLPreviewController *)v5 _registerForApplicationStateChangesNotifications];
    uint64_t v15 = v5;
  }

  return v5;
}

- (void)viewDidLoad
{
  void v11[2] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v10 viewDidLoad];
  id v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  id v4 = [(QLPreviewController *)self view];
  [v4 setBackgroundColor:v3];

  [(QLPreviewController *)self setTransitioningDelegate:self];
  [(QLPreviewController *)self toggleChromelessIfNeeded];
  objc_initWeak(&location, self);
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__QLPreviewController_viewDidLoad__block_invoke;
  v7[3] = &unk_2642F5408;
  objc_copyWeak(&v8, &location);
  id v6 = (id)[(QLPreviewController *)self registerForTraitChanges:v5 withHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __34__QLPreviewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateNavigationBarBehaviorStyle];
}

- (void)willMoveToParentViewController:(id)a3
{
  if (a3 && [(QLPreviewController *)self parentIsNavigationController])
  {
    [(QLPreviewController *)self _savePreviousNavigationVCState];
    id v4 = [(QLPreviewController *)self view];
    id v5 = [v4 window];
    id v6 = [v5 windowScene];
    id v7 = [v6 statusBarManager];
    -[QLPreviewController setPreviousStatusBarHidden:](self, "setPreviousStatusBarHidden:", [v7 isStatusBarHidden]);
  }

  MEMORY[0x270F9A758]();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_viewWillAppearPerformed = 0;
  id v5 = [(QLPreviewController *)self presentationController];
  id v6 = [v5 delegate];

  if (!v6)
  {
    id v7 = [(QLPreviewController *)self presentationController];
    [v7 setDelegate:self];
  }
  [(QLPreviewController *)self setQuickLookVisibility:3 animated:v3];
  id v8 = [(QLPreviewController *)self originalLeftBarButtonItems];

  if (!v8)
  {
    uint64_t v9 = [(QLPreviewController *)self navigationItem];
    objc_super v10 = [v9 leftBarButtonItems];
    uint64_t v11 = [v10 copy];
    id v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = MEMORY[0x263EFFA68];
    }
    [(QLPreviewController *)self setOriginalLeftBarButtonItems:v13];
  }
  id v14 = [(QLPreviewController *)self originalRightBarButtonItems];

  if (!v14)
  {
    uint64_t v15 = [(QLPreviewController *)self navigationItem];
    id v16 = [v15 rightBarButtonItems];
    uint64_t v17 = [v16 copy];
    id v18 = (void *)v17;
    if (v17) {
      uint64_t v19 = v17;
    }
    else {
      uint64_t v19 = MEMORY[0x263EFFA68];
    }
    [(QLPreviewController *)self setOriginalRightBarButtonItems:v19];
  }
  [(QLPreviewController *)self _reloadDataIfNeeded];
  unint64_t v20 = [(QLPreviewController *)self _computePresentationMode];
  if (v20 == 1)
  {
    id v21 = [(QLPreviewController *)self navigationController];
    id v22 = [v21 navigationBar];
    [v22 setTranslucent:1];
  }
  [(QLPreviewController *)self _setPresentationMode:v20];
  self->_enqueuedWhitePointAdaptivityStyle = self->_whitePointAdaptivityStyle;
  char v23 = [(QLPreviewController *)self internalCurrentPreviewItem];
  self->_whitePointAdaptivityStyle = [v23 defaultWhitePointAdaptivityStyle];

  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __38__QLPreviewController_viewWillAppear___block_invoke;
  v33[3] = &unk_2642F5430;
  v33[4] = self;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __38__QLPreviewController_viewWillAppear___block_invoke_2;
  v32[3] = &unk_2642F5458;
  v32[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v33 animations:v32 completion:0.5];
  [(QLPreviewController *)self _presentPreviewCollection];
  id v24 = [(QLPreviewController *)self traitCollection];
  if ([(QLPreviewController *)self _isToolbarVisibleForTraitCollection:v24])
  {
  }
  else
  {
    id v25 = [(QLPreviewController *)self toolbarController];
    char v26 = [v25 isHidden];

    if (v26) {
      goto LABEL_19;
    }
  }
  uint64_t v27 = [(QLPreviewController *)self internalNavigationController];
  id v28 = [v27 toolbar];
  [(QLToolbarController *)self->_toolbarController setOriginalToolbar:v28];

LABEL_19:
  id v29 = [(QLPreviewController *)self currentPreviewItem];

  if (v29) {
    [(QLPreviewController *)self previewItemAtIndex:self->_currentPreviewItemIndex wasUpdatedWithLifecycleState:2 withError:0];
  }
  self->_overlayHidden = self->_fullScreen;
  id v30 = [(QLPreviewController *)self traitCollection];
  [(QLPreviewController *)self updateOverlayAnimated:0 animatedButtons:v3 forceRefresh:1 withTraitCollection:v30];

  [(QLPreviewController *)self _updateBackgroundColor];
  [(QLPreviewController *)self showNoDataViewIfNeeded];
  [(QLPreviewController *)self _updateToolbarSuperview];
  self->_viewWillAppearPerformed = 1;
  v31.receiver = self;
  v31.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v31 viewWillAppear:v3];
}

uint64_t __38__QLPreviewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsWhitePointAdaptivityStyleUpdate];
}

void *__38__QLPreviewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[129] != result[128]) {
    return objc_msgSend(result, "_setPreferredWhitePointAdaptivityStyle:");
  }
  return result;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v4 viewIsAppearing:a3];
  [(QLPreviewController *)self _updateAppearance:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(QLPreviewController *)self presentationMode] == 3)
  {
    id v5 = [(QLPreviewController *)self view];
    id v6 = [v5 window];
    id v7 = [v6 rootViewController];

    if (v7 == self) {
      [(QLPreviewController *)self _setPresentationMode:2];
    }
  }
  if (self->_willTransitionToInternalView)
  {
    self->_willTransitionToInternalView = 0;
  }
  else if ([(QLPreviewController *)self presentationMode] == 1 {
         && ![(QLPreviewController *)self fullScreen])
  }
  {
    id v8 = [(QLPreviewController *)self previousNavigationVCState];
    int v9 = [v8 toolBarHidden];

    if (v9)
    {
      objc_super v10 = [(QLPreviewController *)self internalNavigationController];
      uint64_t v11 = [v10 toolbar];
      [v11 _removeAllAnimations:1];
    }
  }
  [(QLPreviewController *)self setQuickLookVisibility:2 animated:v3];
  [(QLPreviewController *)self _notifyFirstAppearanceIfNeeded];
  id v12 = [(QLPreviewController *)self internalCurrentPreviewItem];

  if (v12) {
    [(QLPreviewController *)self previewItemAtIndex:self->_currentPreviewItemIndex wasUpdatedWithLifecycleState:3 withError:0];
  }
  v25.receiver = self;
  v25.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v25 viewDidAppear:v3];
  [(QLPreviewController *)self setCurrentAnimator:0];
  [(QLPreviewController *)self _updateAppearance:0];
  uint64_t v13 = (NSObject **)MEMORY[0x263F62940];
  id v14 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v14 = *v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v24 = 0;
    _os_log_impl(&dword_217F61000, v14, OS_LOG_TYPE_DEBUG, "Setting currentAnimator to nil from viewDidAppear #AppearanceTransition", v24, 2u);
  }
  uint64_t v15 = [(QLToolbarController *)self->_toolbarController originalToolbar];
  id v16 = [(QLPreviewController *)self internalNavigationController];
  uint64_t v17 = [v16 toolbar];

  if (v15 != v17)
  {
    id v18 = [(QLPreviewController *)self internalNavigationController];
    uint64_t v19 = [v18 toolbar];
    [(QLToolbarController *)self->_toolbarController setOriginalToolbar:v19];
  }
  [(QLPreviewController *)self _updateToolbarSuperview];
  [(QLPreviewController *)self registerForScreenshotService];
  if (os_variant_has_internal_diagnostics())
  {
    unint64_t v20 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__toggleDebugView];
    multiTapDebugGestureRecognizer = self->_multiTapDebugGestureRecognizer;
    self->_multiTapDebugGestureRecognizer = v20;

    [(UITapGestureRecognizer *)self->_multiTapDebugGestureRecognizer setNumberOfTapsRequired:4];
    [(UITapGestureRecognizer *)self->_multiTapDebugGestureRecognizer setNumberOfTouchesRequired:2];
    [(UITapGestureRecognizer *)self->_multiTapDebugGestureRecognizer setDelegate:self];
    id v22 = [(UINavigationController *)self->_internalNavigationController navigationBar];
    [v22 addGestureRecognizer:self->_multiTapDebugGestureRecognizer];
  }
  char v23 = [(QLPreviewController *)self transitionSourceView];
  [v23 removeFromSuperview];

  [(QLPreviewController *)self setTransitionSourceView:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(QLPreviewController *)self presentationMode] == 1
    && ![(QLPreviewController *)self didTransitionFromInternalView]
    && [(QLPreviewController *)self currentPreviewHasUnsavedEdits])
  {
    previewCollection = self->_previewCollection;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __41__QLPreviewController_viewWillDisappear___block_invoke;
    v25[3] = &unk_2642F5480;
    v25[4] = self;
    [(QLPreviewCollectionProtocol *)previewCollection saveCurrentPreviewEditsSynchronously:1 withCompletionHandler:v25];
  }
  BOOL v6 = [(QLPreviewController *)self didTransitionFromInternalView];
  id v7 = [(QLPreviewController *)self traitCollection];
  int v8 = v6 | ![(QLPreviewController *)self _isToolbarVisibleForTraitCollection:v7];

  if ([(QLPreviewController *)self presentationMode] == 1)
  {
    int v9 = [(QLPreviewController *)self transitionCoordinator];
    char v10 = v8 | [v9 isCancelled];

    if ((v10 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v8)
  {
LABEL_9:
    uint64_t v11 = [(QLPreviewController *)self toolbarController];
    [v11 restoreOriginalToolbar];
  }
LABEL_10:
  if ([(QLPreviewController *)self parentIsNavigationController]
    && ![(QLPreviewController *)self willTransitionToInternalView])
  {
    BOOL v12 = [(QLNavigationState *)self->_previousNavigationVCState translucentNavigationBar];
    uint64_t v13 = [(QLPreviewController *)self navigationController];
    id v14 = [v13 navigationBar];
    [v14 setTranslucent:v12];

    BOOL v15 = [(QLNavigationState *)self->_previousNavigationVCState navigationBarHidden];
    id v16 = [(QLPreviewController *)self navigationController];
    [v16 setNavigationBarHidden:v15];

    BOOL v17 = [(QLNavigationState *)self->_previousNavigationVCState toolBarHidden];
    id v18 = [(QLPreviewController *)self navigationController];
    [v18 setToolbarHidden:v17];
  }
  if (![(QLPreviewController *)self willTransitionToInternalView])
  {
    if ([(QLPreviewController *)self _isBeingFullyDismissed])
    {
      uint64_t v19 = [(QLPreviewController *)self delegate];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        if ([(QLPreviewController *)self presentationMode] == 4)
        {
          dispatch_time_t v21 = dispatch_time(0, 100000000);
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __41__QLPreviewController_viewWillDisappear___block_invoke_2;
          block[3] = &unk_2642F5430;
          block[4] = self;
          dispatch_after(v21, MEMORY[0x263EF83A0], block);
        }
        else
        {
          id v22 = [(QLPreviewController *)self delegate];
          [v22 previewControllerWillDismiss:self];
        }
      }
    }
  }
  [(QLPreviewController *)self setQuickLookVisibility:1 animated:v3];
  [(QLPreviewController *)self updateStatusBarAnimated:0];
  [(QLPreviewController *)self unregisterFromScreenshotService];
  v23.receiver = self;
  v23.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v23 viewWillDisappear:v3];
}

uint64_t __41__QLPreviewController_viewWillDisappear___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) didEditCopyOfPreviewItemAtIndex:a2 editedCopy:a3];
}

void __41__QLPreviewController_viewWillDisappear___block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) quickLookVisibility]
    || [*(id *)(a1 + 32) quickLookVisibility] == 1)
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 previewControllerWillDismiss:*(void *)(a1 + 32)];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didSetDefaultFullscreenState = 0;
  self->_didStartDelayingPresentation = 0;
  self->_didEndDelayingPresentation = 0;
  self->_fullScreen = 0;
  [(QLPreviewController *)self setQuickLookVisibility:0 animated:a3];
  id v5 = [(QLPreviewController *)self currentPreviewItem];

  if (v5) {
    [(QLPreviewController *)self previewItemAtIndex:self->_currentPreviewItemIndex wasUpdatedWithLifecycleState:4 withError:0];
  }
  BOOL v6 = [(QLPreviewController *)self currentAnimator];
  id v7 = [v6 transitionContext];
  int v8 = [v7 transitionWasCancelled];

  if (v8)
  {
    int v9 = [(QLNavigationState *)self->_previousNavigationVCState navigationController];
    char v10 = [v9 navigationBar];
    [v10 setTranslucent:1];

    uint64_t v11 = [(QLPreviewController *)self internalNavigationController];
    BOOL v12 = [v11 toolbar];
    uint64_t v13 = [(QLPreviewController *)self toolbarController];
    [v13 setOriginalToolbar:v12];
  }
  else if ([(QLPreviewController *)self _isBeingFullyDismissed])
  {
    if (![(QLPreviewController *)self didTransitionFromInternalView])
    {
      id v14 = [(QLPreviewController *)self toolbarController];
      [v14 restoreOriginalToolbar];
    }
    if (self->_previousNavigationVCState)
    {
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __40__QLPreviewController_viewDidDisappear___block_invoke;
      v30[3] = &unk_2642F5430;
      void v30[4] = self;
      [MEMORY[0x263F82E00] performWithoutAnimation:v30];
      BOOL v15 = [(QLNavigationState *)self->_previousNavigationVCState translucentToolbar];
      id v16 = [(QLNavigationState *)self->_previousNavigationVCState navigationController];
      BOOL v17 = [v16 toolbar];
      [v17 setTranslucent:v15];

      previousNavigationVCState = self->_previousNavigationVCState;
      self->_previousNavigationVCState = 0;
    }
    uint64_t v19 = [(QLPreviewController *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      if ([(QLPreviewController *)self presentationMode] == 4)
      {
        dispatch_time_t v21 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __40__QLPreviewController_viewDidDisappear___block_invoke_2;
        block[3] = &unk_2642F5430;
        block[4] = self;
        dispatch_after(v21, MEMORY[0x263EF83A0], block);
      }
      else
      {
        id v22 = [(QLPreviewController *)self delegate];
        [v22 previewControllerDidDismiss:self];
      }
    }
    [(QLPreviewController *)self setModalPresentationStyle:0];
    [(QLPreviewController *)self setTransitioningDelegate:self];
    [(QLPreviewController *)self setStrongDelegate:0];
  }
  [(QLPreviewController *)self setCurrentAnimator:0];
  objc_super v23 = (NSObject **)MEMORY[0x263F62940];
  id v24 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v24 = *v23;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_217F61000, v24, OS_LOG_TYPE_DEBUG, "Setting currentAnimator to nil from viewDidDisappear #AppearanceTransition", buf, 2u);
  }
  if ([(QLPreviewController *)self _basePreviewControllerIsBeingFullyDismissed])
  {
    [(QLPreviewController *)self _invalidatePreviewCollectionIfNeeded];
  }
  objc_super v25 = [(QLPreviewController *)self transitionSourceView];
  [v25 removeFromSuperview];

  [(QLPreviewController *)self setTransitionSourceView:0];
  if (self->_updatedWhileDisappearing || ![(QLPreviewController *)self _isBeingFullyDismissed])
  {
    self->_updatedWhileDisappearing = 0;
  }
  else
  {
    char v26 = [(QLPreviewController *)self previewItemStore];
    [v26 clearCache];

    self->_currentPreviewItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  v27.receiver = self;
  v27.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v27 viewDidDisappear:v3];
}

void __40__QLPreviewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1256) toolBarHidden] ^ 1;
  BOOL v3 = [*(id *)(*(void *)(a1 + 32) + 1256) navigationController];
  [v3 setToolbarHidden:v2];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 1256) toolBarHidden];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 1256) navigationController];
  [v5 setToolbarHidden:v4];
}

void __40__QLPreviewController_viewDidDisappear___block_invoke_2(uint64_t a1)
{
  if (![*(id *)(a1 + 32) quickLookVisibility])
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 previewControllerDidDismiss:*(void *)(a1 + 32)];
  }
}

- (void)_updateNavigationBarBehaviorStyle
{
  BOOL v3 = [(QLPreviewController *)self traitCollection];
  BOOL v4 = [(QLPreviewController *)self _isToolbarVisibleForTraitCollection:v3];

  if (v4) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 2;
  }
  [(UIView *)self->_toolbarGradientView setHidden:!v4];
  BOOL v6 = [(QLPreviewController *)self _topViewController];
  id v7 = [v6 navigationItem];
  uint64_t v8 = [v7 style];

  if (v8 != v5)
  {
    id v10 = [(QLPreviewController *)self _topViewController];
    int v9 = [v10 navigationItem];
    [v9 setStyle:v5];
  }
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v10 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v7 = [(QLPreviewController *)self traitCollection];
  if ([v7 horizontalSizeClass] == 1 && objc_msgSend(v6, "horizontalSizeClass") == 2)
  {
    uint64_t v8 = [(QLPreviewController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [(QLPreviewController *)self dismissViewControllerAnimated:0 completion:0];
    }
  }
  else
  {
  }
  [(QLPreviewController *)self _updateOverlayButtonsForTraitCollection:v6 animated:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)QLPreviewController;
  id v7 = a4;
  -[QLPreviewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  void v8[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__QLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_2642F54A8;
  void v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __74__QLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_2642F54A8;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

void __74__QLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 traitCollection];
  [v1 updateOverlayAnimated:0 forceRefresh:1 withTraitCollection:v2];
}

uint64_t __74__QLPreviewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRemoteOverlayIfNeeded];
}

- (unint64_t)supportedInterfaceOrientations
{
  unint64_t result = [(QLPreviewController *)self forcedSupportedInterfaceOrientations];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)QLPreviewController;
    return [(QLPreviewController *)&v4 supportedInterfaceOrientations];
  }
  return result;
}

- (void)dealloc
{
  [(QLPreviewController *)self _unregisterForApplicationStateChangesNotifications];
  v3.receiver = self;
  v3.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v3 dealloc];
}

- (BOOL)_isBeingFullyDismissed
{
  if ([(QLPreviewController *)self presentationMode] == 2
    && ([(QLPreviewController *)self isBeingDismissed] & 1) != 0)
  {
    return 1;
  }
  if ([(QLPreviewController *)self presentationMode] == 2) {
    return 0;
  }
  objc_super v4 = [(QLPreviewController *)self parentViewController];
  if (v4)
  {
    uint64_t v5 = [(QLPreviewController *)self parentViewController];
    char v3 = [v5 isBeingDismissed];
  }
  else
  {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)_basePreviewControllerIsBeingFullyDismissed
{
  if ([(QLPreviewController *)self didTransitionFromInternalView]) {
    return 0;
  }

  return [(QLPreviewController *)self _isBeingFullyDismissed];
}

- (void)_registerForApplicationStateChangesNotifications
{
  char v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];

  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_sceneWillDeactivate_ name:*MEMORY[0x263F83950] object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];
}

- (void)_unregisterForApplicationStateChangesNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];
}

- (void)sceneWillDeactivate:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x263F62940];
  id v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, "Scene will deactivate: %@ #Generic", (uint8_t *)&v7, 0xCu);
  }
  if (objc_opt_respondsToSelector()) {
    [(QLPreviewCollectionProtocol *)self->_previewCollection hostSceneWillDeactivate];
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (NSObject **)MEMORY[0x263F62940];
  id v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, "xxx applicationDidEnterBackground: %@ #Generic", (uint8_t *)&v9, 0xCu);
  }
  previewCollection = self->_previewCollection;
  id v8 = [MEMORY[0x263F82438] sharedApplication];
  -[QLPreviewCollectionProtocol hostApplicationDidEnterBackground:](previewCollection, "hostApplicationDidEnterBackground:", [v8 isSuspendedUnderLock]);
}

- (void)applicationDidBecomeActive:(id)a3
{
}

- (void)_presentPreviewCollection
{
  if ([(QLPreviewController *)self hasItemsToPreview]
    && !self->_previewCollectionIsLoading
    && [(QLPreviewController *)self presentationMode])
  {
    id v3 = (void *)MEMORY[0x263F62978];
    id v4 = [(QLPreviewController *)self previewItemStore];
    int v5 = [v3 shouldUseRemoteCollection:v4];

    previewCollection = self->_previewCollection;
    if (!previewCollection)
    {
LABEL_8:
      self->_previewCollectionNeedsConfiguration = 1;
      self->_previewCollectionIsLoading = 1;
      int v7 = self->_previewCollection;
      self->_previewCollection = 0;

      id v8 = self->_userActivity;
      objc_initWeak(&location, self);
      int v9 = [(QLPreviewController *)self personaUniqueString];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __48__QLPreviewController__presentPreviewCollection__block_invoke;
      void v11[3] = &unk_2642F54F8;
      char v14 = v5;
      id v10 = v8;
      BOOL v12 = v10;
      objc_copyWeak(&v13, &location);
      [(QLPreviewController *)self _adoptPersona:v9 andPerformBlock:v11];

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);

      return;
    }
    if (![(QLPreviewCollectionProtocol *)previewCollection isAvailable]
      || v5 != [(QLPreviewCollectionProtocol *)self->_previewCollection isRemote])
    {
      [(QLPreviewController *)self _removePreviewCollectionFromViewHierarchy];
      goto LABEL_8;
    }
    [(QLPreviewController *)self _showPreviewCollection];
  }
}

void __48__QLPreviewController__presentPreviewCollection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__QLPreviewController__presentPreviewCollection__block_invoke_2;
  v3[3] = &unk_2642F54D0;
  id v4 = *(id *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 40));
  +[QLPreviewCollection previewCollectionUsingRemoteViewController:v2 completionHandler:v3];
  objc_destroyWeak(&v5);
}

void __48__QLPreviewController__presentPreviewCollection__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setUserActivity:v3];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _presentLoadedPreviewCollection:v4];
}

- (void)_presentLoadedPreviewCollection:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __55__QLPreviewController__presentLoadedPreviewCollection___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1232), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) toolbarController];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 1232) accessoryView];
  [v2 setAccessoryView:v3];

  [*(id *)(a1 + 32) _showPreviewCollection];
  [*(id *)(a1 + 32) _configurePreviewCollectionIfNeeded];
  *(unsigned char *)(*(void *)(a1 + 32) + 994) = 0;
  [*(id *)(a1 + 32) _notifyFirstAppearanceIfNeeded];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 1008);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 1008);
  *(void *)(v9 + 1008) = 0;
}

- (void)_invalidatePreviewCollectionIfNeeded
{
  if ([(QLPreviewController *)self presentationMode] == 4)
  {
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__QLPreviewController__invalidatePreviewCollectionIfNeeded__block_invoke;
    block[3] = &unk_2642F5430;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x263EF83A0], block);
  }
  else
  {
    [(QLPreviewController *)self _invalidatePreviewCollectionIfNeededNow];
  }
}

uint64_t __59__QLPreviewController__invalidatePreviewCollectionIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) quickLookVisibility];
  if (!result)
  {
    dispatch_time_t v3 = *(void **)(a1 + 32);
    return [v3 _invalidatePreviewCollectionIfNeededNow];
  }
  return result;
}

- (void)_invalidatePreviewCollectionIfNeededNow
{
  dispatch_time_t v3 = self->_previewCollection;
  previewCollection = self->_previewCollection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __62__QLPreviewController__invalidatePreviewCollectionIfNeededNow__block_invoke;
  v6[3] = &unk_2642F50C8;
  void v6[4] = self;
  uint64_t v7 = v3;
  uint64_t v5 = v3;
  [(QLPreviewCollectionProtocol *)previewCollection preparePreviewCollectionForInvalidationWithCompletionHandler:v6];
}

uint64_t __62__QLPreviewController__invalidatePreviewCollectionIfNeededNow__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) quickLookVisibility];
  if (!result)
  {
    [*(id *)(a1 + 32) _removePreviewCollectionFromViewHierarchy];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 1232);
    *(void *)(v3 + 1232) = 0;

    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 invalidateServiceWithCompletionHandler:&__block_literal_global_0];
  }
  return result;
}

- (void)_notifyFirstAppearanceIfNeeded
{
  if (!self->_previewCollectionIsLoading
    && self->_previewCollection
    && [(QLPreviewController *)self presentationMode] != 1)
  {
    previewCollection = self->_previewCollection;
    unint64_t v4 = [(QLPreviewController *)self appearanceActions];
    [(QLPreviewCollectionProtocol *)previewCollection notifyFirstTimeAppearanceWithActions:v4];
  }
}

- (void)_setDefaultFullscreenStateIfNeeded
{
  id obj = self;
  objc_sync_enter(obj);
  if (!obj->_didSetDefaultFullscreenState)
  {
    obj->_didSetDefaultFullscreenState = 1;
    uint64_t v2 = [(QLPreviewController *)obj internalCurrentPreviewItem];
    BOOL v3 = [v2 shouldOpenInFullScreen]
      && (obj->_appearanceActions & 4) == 0
      && [(QLPreviewController *)obj presentationMode] == 2;

    [(QLPreviewController *)obj _setFullScreen:v3 animated:0 force:0];
  }
  objc_sync_exit(obj);
}

- (void)_configurePreviewCollectionIfNeeded
{
  if (self->_previewCollectionNeedsConfiguration
    && self->_previewCollection
    && [(QLPreviewController *)self quickLookVisibility] != 1)
  {
    [(QLPreviewController *)self _updateAppearance:0];
    [(QLPreviewCollectionProtocol *)self->_previewCollection overrideParentApplicationDisplayIdentifierWithIdentifier:self->_overrideParentApplicationDisplayIdentifier];
    [(QLPreviewCollectionProtocol *)self->_previewCollection setLoadingString:self->_loadingTextForMissingFiles];
    id v9 = (id)objc_opt_new();
    [v9 setStateManager:self];
    [(QLPreviewController *)self _setDefaultFullscreenStateIfNeeded];
    int v3 = _os_feature_enabled_impl();
    previewCollection = self->_previewCollection;
    uint64_t v5 = [(QLPreviewController *)self previewItemStore];
    uint64_t v6 = [v5 numberOfItems];
    NSInteger v7 = [(QLPreviewController *)self currentPreviewItemIndex];
    uint64_t v8 = [(QLPreviewController *)self previewItemStore];
    if (v3) {
      [(QLPreviewCollectionProtocol *)previewCollection configureWithNumberOfItems:v6 currentPreviewItemIndex:v7 itemProvider:v8 stateManager:v9 fullScreen:[(QLPreviewController *)self fullScreen]];
    }
    else {
      [(QLPreviewCollectionProtocol *)previewCollection configureWithNumberOfItems:v6 currentPreviewItemIndex:v7 itemProvider:v8 stateManager:v9];
    }

    [(QLPreviewController *)self _notifyFirstAppearanceIfNeeded];
    [(QLPreviewController *)self _updateAllowInteractiveTransitionsIfNeeded];
    [(QLPreviewController *)self updateDoneButtonMenu];
    [(QLPreviewCollectionProtocol *)self->_previewCollection setAllowInteractiveTransitions:[(QLPreviewController *)self allowInteractiveTransitions]];
    [(QLPreviewCollectionProtocol *)self->_previewCollection hostViewControlerTransitionToState:[(QLPreviewController *)self quickLookVisibility] animated:0];
    [(QLPreviewCollectionProtocol *)self->_previewCollection setIsContentManaged:[(QLPreviewController *)self isContentManaged]];
    [(QLPreviewController *)self toggleChromelessIfNeeded];
    self->_previewCollectionNeedsConfiguration = 0;
  }
}

- (void)toggleChromelessIfNeeded
{
  if (_os_feature_enabled_impl())
  {
    [(QLPreviewController *)self setOverrideUserInterfaceStyle:2];
    [(QLPreviewCollectionProtocol *)self->_previewCollection setOverrideUserInterfaceStyle:2];
    [(UIViewController *)self QL_enableChromelessBarsUI];
    previewCollection = self->_previewCollection;
    [(QLPreviewCollectionProtocol *)previewCollection QL_enableChromelessBarsUI];
  }
  else
  {
    [(QLPreviewController *)self setOverrideUserInterfaceStyle:0];
    [(QLPreviewCollectionProtocol *)self->_previewCollection setOverrideUserInterfaceStyle:0];
    unint64_t v4 = [(QLPreviewController *)self internalCurrentPreviewItem];
    int v5 = [v4 supportsChromelessUI];

    if (v5)
    {
      [(UIViewController *)self QL_enableChromelessBarsUI];
      [(QLPreviewCollectionProtocol *)self->_previewCollection QL_enableChromelessBarsUI];
      [(QLPreviewController *)self updateChromelessBars];
    }
    else
    {
      [(UIViewController *)self QL_disableChromelessBarsUI];
      uint64_t v6 = self->_previewCollection;
      [(QLPreviewCollectionProtocol *)v6 QL_disableChromelessBarsUI];
    }
  }
}

- (void)_showPreviewCollection
{
  v26[1] = *MEMORY[0x263EF8340];
  if ([(QLPreviewController *)self presentationMode] != 1
    && [(QLPreviewController *)self presentationMode] != 3
    && [(QLPreviewController *)self presentationMode] != 5
    && [(QLPreviewController *)self presentationMode] != 4
    || ([(QLPreviewCollectionProtocol *)self->_previewCollection parentViewController],
        int v3 = (QLPreviewController *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3 != self))
  {
    if ([(QLPreviewController *)self presentationMode] != 2
      || ([(QLPreviewCollectionProtocol *)self->_previewCollection parentViewController],
          unint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [(QLPreviewController *)self internalNavigationController],
          int v5 = objc_claimAutoreleasedReturnValue(),
          v5,
          v4,
          v4 != v5))
    {
      uint64_t v6 = [(QLPreviewCollectionProtocol *)self->_previewCollection parentViewController];

      if (v6) {
        [(QLPreviewController *)self _removePreviewCollectionFromViewHierarchy];
      }
      unint64_t v7 = [(QLPreviewController *)self presentationMode];
      if (v7 - 3 < 3 || v7 == 1)
      {
        [(QLPreviewController *)self addChildViewController:self->_previewCollection];
        long long v11 = [(QLPreviewController *)self view];
        long long v12 = [(QLPreviewCollectionProtocol *)self->_previewCollection view];
        [v11 insertSubview:v12 atIndex:0];

        [(QLPreviewCollectionProtocol *)self->_previewCollection didMoveToParentViewController:self];
        long long v13 = [(QLPreviewCollectionProtocol *)self->_previewCollection view];
        [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

        long long v14 = [(QLPreviewController *)self view];
        BOOL v15 = (void *)MEMORY[0x263F08938];
        id v24 = @"previewCollection";
        uint64_t v16 = [(QLPreviewCollectionProtocol *)self->_previewCollection view];
        objc_super v25 = v16;
        BOOL v17 = [NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        id v18 = [v15 constraintsWithVisualFormat:@"H:|[previewCollection]|" options:0 metrics:0 views:v17];
        [v14 addConstraints:v18];

        id v9 = [(QLPreviewController *)self view];
        uint64_t v19 = (void *)MEMORY[0x263F08938];
        id v10 = [(QLPreviewCollectionProtocol *)self->_previewCollection view];
        objc_super v23 = v10;
        char v20 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        dispatch_time_t v21 = [v19 constraintsWithVisualFormat:@"V:|[previewCollection]|" options:0 metrics:0 views:v20];
        [v9 addConstraints:v21];
      }
      else
      {
        if (v7 != 2)
        {
LABEL_16:
          [(QLPreviewController *)self _updateAppearance:0];
          [(QLPreviewController *)self updateOverlayAnimated:0 forceRefresh:0];
          return;
        }
        uint64_t v8 = [(QLPreviewCollectionProtocol *)self->_previewCollection view];
        [v8 setTranslatesAutoresizingMaskIntoConstraints:1];

        id v9 = [(QLPreviewController *)self internalNavigationController];
        v26[0] = self->_previewCollection;
        id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
        [v9 setViewControllers:v10];
      }

      goto LABEL_16;
    }
  }
}

- (void)_removePreviewCollectionFromViewHierarchy
{
  [(QLPreviewCollectionProtocol *)self->_previewCollection willMoveToParentViewController:0];
  int v3 = [(QLPreviewCollectionProtocol *)self->_previewCollection view];
  [v3 removeFromSuperview];

  previewCollection = self->_previewCollection;

  [(QLPreviewCollectionProtocol *)previewCollection removeFromParentViewController];
}

- (CGRect)frameForAdditionalButtonWithActionName:(SEL)a3
{
  int v3 = [(QLPreviewController *)self viewForAdditionalButtonWithActionName:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    int v5 = [v3 superview];
    [v4 frame];
    objc_msgSend(v5, "convertRect:toView:", 0);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v7 = *MEMORY[0x263F001A0];
    double v9 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A0] + 24);
  }

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)viewForAdditionalButtonWithActionName:(SEL)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  int v5 = [(QLPreviewController *)self _topViewController];
  double v6 = [v5 navigationItem];
  double v7 = [v6 leftBarButtonItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v38 != v10) {
        objc_enumerationMutation(v7);
      }
      double v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
      if ((SEL)[v12 action] == a3)
      {
        uint64_t v13 = [v12 valueForKey:@"view"];
        if (v13) {
          break;
        }
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v43 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v14 = [(QLPreviewController *)self _topViewController];
    double v15 = [v14 navigationItem];
    double v7 = [v15 rightBarButtonItems];

    uint64_t v16 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
LABEL_12:
      uint64_t v19 = 0;
      while (1)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v7);
        }
        char v20 = *(void **)(*((void *)&v33 + 1) + 8 * v19);
        if ((SEL)[v20 action] == a3)
        {
          uint64_t v13 = [v20 valueForKey:@"view"];
          if (v13) {
            break;
          }
        }
        if (v17 == ++v19)
        {
          uint64_t v17 = [v7 countByEnumeratingWithState:&v33 objects:v42 count:16];
          if (v17) {
            goto LABEL_12;
          }
          goto LABEL_19;
        }
      }
    }
    else
    {
LABEL_19:

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      dispatch_time_t v21 = [(QLPreviewController *)self _topViewController];
      double v7 = [v21 toolbarItems];

      uint64_t v22 = [v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
      if (!v22)
      {
LABEL_28:
        objc_super v27 = 0;
        goto LABEL_30;
      }
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v30;
LABEL_21:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v7);
        }
        char v26 = *(void **)(*((void *)&v29 + 1) + 8 * v25);
        if ((SEL)[v26 action] == a3)
        {
          uint64_t v13 = [v26 valueForKey:@"view"];
          if (v13) {
            break;
          }
        }
        if (v23 == ++v25)
        {
          uint64_t v23 = [v7 countByEnumeratingWithState:&v29 objects:v41 count:16];
          if (v23) {
            goto LABEL_21;
          }
          goto LABEL_28;
        }
      }
    }
  }
  objc_super v27 = (void *)v13;
LABEL_30:

  return v27;
}

- (void)waitForPreviewCollectionWithCompletionHandler:(id)a3
{
  unint64_t v4 = (void (**)(void))a3;
  aBlock = v4;
  if (self->_previewCollection)
  {
    v4[2]();
  }
  else
  {
    previewCollectionReadyCompletionBlocks = self->_previewCollectionReadyCompletionBlocks;
    if (!previewCollectionReadyCompletionBlocks)
    {
      double v6 = (NSMutableArray *)objc_opt_new();
      double v7 = self->_previewCollectionReadyCompletionBlocks;
      self->_previewCollectionReadyCompletionBlocks = v6;

      unint64_t v4 = aBlock;
      previewCollectionReadyCompletionBlocks = self->_previewCollectionReadyCompletionBlocks;
    }
    uint64_t v8 = _Block_copy(v4);
    [(NSMutableArray *)previewCollectionReadyCompletionBlocks addObject:v8];
  }
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewController *)self previewCollection];
  [v5 prepareForActionSheetPresentationWithCompletionHandler:v4];
}

- (void)setAdditionalLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_additionalLeftBarButtonItems, a3);
  BOOL v4 = [(QLPreviewController *)self presentationStyle] != 1;

  [(QLPreviewController *)self updateOverlayAnimated:v4 forceRefresh:0];
}

- (void)setAdditionalRightBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_additionalRightBarButtonItems, a3);
  BOOL v4 = [(QLPreviewController *)self presentationStyle] != 1;

  [(QLPreviewController *)self updateOverlayAnimated:v4 forceRefresh:0];
}

- (void)_setCurrentPreviewItemIndex:(int64_t)a3 updatePreview:(BOOL)a4 animated:(BOOL)a5
{
  if (self->_deferReloadData)
  {
    self->_deferredSetIndex = a3;
  }
  else
  {
    BOOL v7 = a5;
    BOOL v8 = a4;
    uint64_t v9 = [(QLPreviewController *)self previewItemStore];
    unint64_t v10 = [v9 possibleRange];
    unint64_t v12 = v11;

    if (a3 >= v10 && a3 - v10 < v12 && self->_currentPreviewItemIndex != a3)
    {
      [(QLPreviewController *)self willChangeValueForKey:@"currentPreviewItemIndex"];
      self->_currentPreviewItemIndex = a3;
      [(QLPreviewController *)self updateOverlayAnimated:1 forceRefresh:0];
      if (v8 && [(QLPreviewController *)self quickLookVisibility] != 1) {
        [(QLPreviewController *)self _refreshCurrentPreviewItemAnimated:v7];
      }
      if ([(QLPreviewController *)self _isQuickLookVisible]) {
        [(QLPreviewController *)self previewItemAtIndex:a3 wasUpdatedWithLifecycleState:3 withError:0];
      }
      if (_os_feature_enabled_impl()) {
        [(QLPreviewController *)self toggleChromelessIfNeeded];
      }
      -[QLPreviewController setContentFrame:](self, "setContentFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [(QLPreviewController *)self didChangeValueForKey:@"currentPreviewItemIndex"];
    }
  }
}

- (void)setCurrentPreviewItemIndex:(NSInteger)currentPreviewItemIndex
{
  if ([(QLPreviewController *)self quickLookVisibility] == 1) {
    self->_updatedWhileDisappearing = 1;
  }

  [(QLPreviewController *)self setCurrentPreviewItemIndex:currentPreviewItemIndex animated:0];
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
}

- (NSInteger)currentPreviewItemIndex
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = (NSObject **)MEMORY[0x263F62940];
  BOOL v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    BOOL v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t currentPreviewItemIndex = self->_currentPreviewItemIndex;
    int v7 = 134217984;
    int64_t v8 = currentPreviewItemIndex;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_DEFAULT, "[API] currentPreviewItemIndex called, returning %li #PreviewController", (uint8_t *)&v7, 0xCu);
  }
  return self->_currentPreviewItemIndex;
}

- (id)currentPreviewItem
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(QLPreviewController *)self internalCurrentPreviewItem];
  int v3 = [v2 originalPreviewItem];

  BOOL v4 = (NSObject **)MEMORY[0x263F62940];
  id v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    int64_t v8 = v3;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_DEFAULT, "[API] currentPreviewItem called, returning %@ #PreviewController", (uint8_t *)&v7, 0xCu);
  }

  return v3;
}

- (QLItem)internalCurrentPreviewItem
{
  if ([(QLPreviewController *)self currentPreviewItemIndex] == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3032000000;
    unint64_t v11 = __Block_byref_object_copy__0;
    unint64_t v12 = __Block_byref_object_dispose__0;
    id v13 = 0;
    BOOL v4 = [(QLPreviewController *)self previewItemStore];
    NSInteger v5 = [(QLPreviewController *)self currentPreviewItemIndex];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __49__QLPreviewController_internalCurrentPreviewItem__block_invoke;
    v7[3] = &unk_2642F5520;
    void v7[4] = &v8;
    [v4 previewItemAtIndex:v5 withCompletionHandler:v7];

    id v3 = (id)v9[5];
    _Block_object_dispose(&v8, 8);
  }

  return (QLItem *)v3;
}

void __49__QLPreviewController_internalCurrentPreviewItem__block_invoke(uint64_t a1, void *a2)
{
}

- (void)setDataSource:(id)dataSource
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  NSInteger v5 = (QLPreviewController *)dataSource;
  double v6 = (NSObject **)MEMORY[0x263F62940];
  int v7 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    int v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_DEFAULT, "[API] setDataSource: %@ #PreviewController", (uint8_t *)&v12, 0xCu);
  }
  id WeakRetained = (QLPreviewController *)objc_loadWeakRetained((id *)&self->_dataSource);

  if (WeakRetained != v5)
  {
    objc_storeWeak((id *)&self->_dataSource, v5);
    if ([(QLPreviewController *)self _isQuickLookVisible])
    {
      if ([(QLPreviewController *)self presentationMode] == 4)
      {
        uint64_t v9 = *v6;
        if (!*v6)
        {
          QLSInitLogging();
          uint64_t v9 = *v6;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = v9;
          unint64_t v11 = NSStringFromSelector(a2);
          int v12 = 138412546;
          id v13 = self;
          __int16 v14 = 2112;
          double v15 = v11;
          _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "%@ %@: The datasource should not be updated during the peeking session. This can result in unintended side effects. #PreviewController", (uint8_t *)&v12, 0x16u);
        }
      }
      [(QLPreviewController *)self reloadData];
    }
    else
    {
      self->_deferReloadData = 1;
    }
    [(QLPreviewController *)self updatePreferredTransition];
  }
}

- (void)setAppearanceActions:(unint64_t)a3
{
  self->_appearanceActions = a3;
  [(QLPreviewController *)self _notifyFirstAppearanceIfNeeded];
}

- (void)_setFullScreen:(BOOL)a3 animated:(BOOL)a4 force:(BOOL)a5
{
  BOOL v6 = a4;
  if (self->_fullScreen == a3)
  {
    if (!a5) {
      return;
    }
  }
  else if ([(QLPreviewController *)self isBeingDismissed] && !a5)
  {
    return;
  }
  self->_fullScreen = a3;
  double v9 = 0.2;
  if (!v6) {
    double v9 = 0.0;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __53__QLPreviewController__setFullScreen_animated_force___block_invoke;
  void v11[3] = &unk_2642F5430;
  void v11[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v11 animations:v9];
  self->_overlayHidden = a3;
  [(QLPreviewController *)self updateOverlayAnimated:v6 animatedButtons:0 forceRefresh:0 withTraitCollection:0];
  [(QLPreviewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  uint64_t v10 = [(QLPreviewController *)self toolbarController];
  [v10 updateLayout];
}

uint64_t __53__QLPreviewController__setFullScreen_animated_force___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackgroundColor];
}

- (void)setNavigationBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_navigationBarTintColor, a3);

  [(QLPreviewController *)self _updateBarTintColors];
}

- (void)setToolbarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarTintColor, a3);

  [(QLPreviewController *)self _updateBarTintColors];
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);

  [(QLPreviewController *)self _updateBackgroundColor];
}

- (void)setFullscreenBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenBackgroundColor, a3);

  [(QLPreviewController *)self _updateBackgroundColor];
}

- (id)_preferredBackgroundColor
{
  if ([(QLPreviewController *)self fullScreen] || (_os_feature_enabled_impl() & 1) != 0)
  {
    id v3 = [(QLPreviewController *)self fullscreenBackgroundColor];
  }
  else
  {
    id v3 = [(QLPreviewController *)self backgroundColor];
  }

  return v3;
}

- (void)setOverlayHidden:(BOOL)a3 animated:(BOOL)a4
{
  self->_overlayHidden = a3;
  [(QLPreviewController *)self updateOverlayAnimated:a4 forceRefresh:0];
}

- (void)_setPresentationMode:(unint64_t)a3
{
  if (self->_presentationMode != a3)
  {
    self->_presentationMode = a3;
    [(QLPreviewController *)self _updateViewHierarchyPresentation];
    [(QLPreviewController *)self updateChromelessBars];
  }

  [(QLPreviewController *)self _updateAppearance:0];
}

- (int64_t)_preferredModalPresentationStyle
{
  return 0;
}

- (void)_updateViewHierarchyPresentation
{
  if (self->_presentationMode) {
    id v3 = [(QLPreviewController *)self internalNavigationController];
  }
  [(QLPreviewController *)self _presentPreviewCollection];
  [(QLPreviewController *)self setAllowInteractiveTransitions:[(QLPreviewController *)self _shouldAllowInteractiveTransitions]];

  [(QLPreviewController *)self _updateToolbarSuperview];
}

- (void)_updateToolbarSuperview
{
  if ([(QLPreviewController *)self presentationMode] == 2)
  {
    id v9 = [(QLPreviewController *)self toolbarController];
    id v3 = [(QLPreviewController *)self internalNavigationController];
    BOOL v4 = [v3 view];
    NSInteger v5 = [(QLPreviewController *)self internalNavigationController];
    BOOL v6 = [v5 view];
    [v9 setPreferredSuperview:v4 preferredParentViewForSafeAreaInset:v6];

LABEL_3:
    goto LABEL_9;
  }
  if ([(QLPreviewController *)self presentationMode] == 1)
  {
    int v7 = [(QLPreviewController *)self previousNavigationVCState];
    if ([v7 toolBarHidden]
      && ![(QLPreviewController *)self didTransitionFromInternalView])
    {
      BOOL v8 = [(QLPreviewController *)self willTransitionToInternalView];

      if (!v8)
      {
        id v9 = [(QLPreviewController *)self toolbarController];
        id v3 = [(QLPreviewController *)self view];
        BOOL v4 = [(QLPreviewController *)self internalNavigationController];
        NSInteger v5 = [v4 view];
        [v9 setPreferredSuperview:v3 preferredParentViewForSafeAreaInset:v5];
        goto LABEL_3;
      }
    }
    else
    {
    }
  }
  id v9 = [(QLPreviewController *)self toolbarController];
  id v3 = [(QLPreviewController *)self internalNavigationController];
  BOOL v4 = [v3 view];
  [v9 setPreferredSuperview:0 preferredParentViewForSafeAreaInset:v4];
LABEL_9:
}

- (UINavigationController)internalNavigationController
{
  v30[1] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(QLPreviewController *)self presentationMode];
  if (v3 - 3 < 3) {
    goto LABEL_4;
  }
  if (v3 != 2)
  {
    if (v3 != 1)
    {
LABEL_8:
      int v7 = 0;
      goto LABEL_12;
    }
LABEL_4:
    internalNavigationController = self->_internalNavigationController;
    if (internalNavigationController)
    {
      [(UINavigationController *)internalNavigationController willMoveToParentViewController:0];
      NSInteger v5 = [(UINavigationController *)self->_internalNavigationController view];
      [v5 removeFromSuperview];

      [(UINavigationController *)self->_internalNavigationController removeFromParentViewController];
      BOOL v6 = self->_internalNavigationController;
      self->_internalNavigationController = 0;
    }
    if ([(QLPreviewController *)self parentIsNavigationController])
    {
      int v7 = [(QLPreviewController *)self navigationController];
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  BOOL v8 = self->_internalNavigationController;
  if (!v8)
  {
    id v9 = objc_opt_new();
    objc_storeWeak((id *)&self->_modalRootViewController, v9);
    uint64_t v10 = (UINavigationController *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v9];
    unint64_t v11 = self->_internalNavigationController;
    self->_internalNavigationController = v10;

    [(UINavigationController *)self->_internalNavigationController setDelegate:self];
    int v12 = [(UINavigationController *)self->_internalNavigationController toolbar];
    [v12 setAccessibilityIdentifier:@"QLCustomToolBarModalAccessibilityIdentifier"];

    [(QLPreviewController *)self addChildViewController:self->_internalNavigationController];
    id v13 = [(QLPreviewController *)self view];
    __int16 v14 = [(UINavigationController *)self->_internalNavigationController view];
    [v13 insertSubview:v14 atIndex:0];

    [(UINavigationController *)self->_internalNavigationController didMoveToParentViewController:self];
    double v15 = [(UINavigationController *)self->_internalNavigationController view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v16 = [(QLPreviewController *)self view];
    uint64_t v17 = (void *)MEMORY[0x263F08938];
    long long v29 = @"mainView";
    uint64_t v18 = [(UINavigationController *)self->_internalNavigationController view];
    v30[0] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
    char v20 = [v17 constraintsWithVisualFormat:@"H:|[mainView]|" options:0 metrics:0 views:v19];
    [v16 addConstraints:v20];

    dispatch_time_t v21 = [(QLPreviewController *)self view];
    uint64_t v22 = (void *)MEMORY[0x263F08938];
    objc_super v27 = @"mainView";
    uint64_t v23 = [(UINavigationController *)self->_internalNavigationController view];
    id v28 = v23;
    uint64_t v24 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v25 = [v22 constraintsWithVisualFormat:@"V:|[mainView]|" options:0 metrics:0 views:v24];
    [v21 addConstraints:v25];

    [(QLPreviewController *)self _updateNavigationBarBehaviorStyle];
    BOOL v8 = self->_internalNavigationController;
  }
  int v7 = v8;
LABEL_12:

  return v7;
}

- (id)previewItemAtIndex:(int64_t)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unint64_t v11 = __Block_byref_object_copy__0;
  int v12 = __Block_byref_object_dispose__0;
  id v13 = 0;
  BOOL v4 = [(QLPreviewController *)self previewItemStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__QLPreviewController_previewItemAtIndex___block_invoke;
  v7[3] = &unk_2642F5520;
  void v7[4] = &v8;
  [v4 previewItemAtIndex:a3 withCompletionHandler:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __42__QLPreviewController_previewItemAtIndex___block_invoke(uint64_t a1, void *a2)
{
}

- (int64_t)numberOfPreviewItems
{
  uint64_t v2 = [(QLPreviewController *)self previewItemStore];
  int64_t v3 = [v2 numberOfItems];

  return v3;
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  if (self->_allowInteractiveTransitions != a3)
  {
    self->_allowInteractiveTransitions = a3;
    previewCollection = self->_previewCollection;
    BOOL v4 = [(QLPreviewController *)self allowInteractiveTransitions];
    [(QLPreviewCollectionProtocol *)previewCollection setAllowInteractiveTransitions:v4];
  }
}

- (void)setLoadingTextForMissingFiles:(id)a3
{
  p_loadingTextForMissingFiles = &self->_loadingTextForMissingFiles;
  objc_storeStrong((id *)&self->_loadingTextForMissingFiles, a3);
  id v6 = a3;
  [(QLPreviewCollectionProtocol *)self->_previewCollection setLoadingString:*p_loadingTextForMissingFiles];
}

- (void)setUseCustomActionButton:(BOOL)a3
{
  if (self->_useCustomActionButton != a3)
  {
    self->_useCustomActionButton = a3;
    [(QLPreviewController *)self updateOverlayAnimated:0 forceRefresh:1];
  }
}

- (void)setShowActionAsDefaultButton:(BOOL)a3
{
  if (self->_showActionAsDefaultButton != a3)
  {
    self->_showActionAsDefaultButton = a3;
    [(QLPreviewController *)self updateOverlayAnimated:0 forceRefresh:1];
  }
}

- (void)setDelegate:(id)delegate
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = delegate;
  id v5 = (NSObject **)MEMORY[0x263F62940];
  id v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_DEFAULT, "[API] setDelegate: %@ #PreviewController", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_delegate, v4);
    [(QLPreviewController *)self updatePreferredTransition];
  }
}

- (id)delegate
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int64_t v3 = (void **)MEMORY[0x263F62940];
  id v4 = (void *)*MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v4 = *v3;
  }
  id v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = (QLPreviewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
    strongDelegate = WeakRetained;
    if (!WeakRetained) {
      strongDelegate = self->_strongDelegate;
    }
    int v12 = 138412290;
    id v13 = strongDelegate;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_DEFAULT, "[API] getDelegate: %@ #PreviewController", (uint8_t *)&v12, 0xCu);
  }
  int v8 = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = v8;
  if (!v8) {
    int v8 = self->_strongDelegate;
  }
  id v10 = v8;

  return v10;
}

- (void)updatePreferredTransition
{
  if (_os_feature_enabled_impl())
  {
    objc_initWeak(&location, self);
    id v3 = objc_alloc_init(MEMORY[0x263F82EB0]);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __48__QLPreviewController_updatePreferredTransition__block_invoke;
    v23[3] = &unk_2642F5548;
    objc_copyWeak(&v24, &location);
    [v3 setAlignmentRectProvider:v23];
    id v4 = [(QLPreviewController *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      [(QLPreviewController *)self setTransitioningDelegate:0];
      id v6 = (void *)MEMORY[0x263F82E20];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __48__QLPreviewController_updatePreferredTransition__block_invoke_258;
      v21[3] = &unk_2642F5570;
      int v7 = &v22;
      objc_copyWeak(&v22, &location);
      int v8 = [v6 zoomWithOptions:v3 sourceViewProvider:v21];
      [(QLPreviewController *)self setPreferredTransition:v8];
    }
    else
    {
      id v9 = [(QLPreviewController *)self delegate];
      char v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) == 0)
      {
        int v12 = [(QLPreviewController *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          id v13 = [(QLPreviewController *)self delegate];
          char v14 = objc_opt_respondsToSelector();

          if (v14)
          {
            [(QLPreviewController *)self setTransitioningDelegate:0];
            double v15 = (void *)MEMORY[0x263F82E20];
            v17[0] = MEMORY[0x263EF8330];
            v17[1] = 3221225472;
            v17[2] = __48__QLPreviewController_updatePreferredTransition__block_invoke_267;
            v17[3] = &unk_2642F5570;
            int v7 = &v18;
            objc_copyWeak(&v18, &location);
            int v8 = [v15 zoomWithOptions:v3 sourceViewProvider:v17];
            [(QLPreviewController *)self setPreferredTransition:v8];
            goto LABEL_6;
          }
        }
        else
        {
        }
        [(QLPreviewController *)self setTransitioningDelegate:0];
        uint64_t v16 = [MEMORY[0x263F82E20] zoomWithOptions:v3 sourceViewProvider:&__block_literal_global_271];
        [(QLPreviewController *)self setPreferredTransition:v16];

        goto LABEL_7;
      }
      [(QLPreviewController *)self setTransitioningDelegate:0];
      unint64_t v11 = (void *)MEMORY[0x263F82E20];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      void v19[2] = __48__QLPreviewController_updatePreferredTransition__block_invoke_262;
      v19[3] = &unk_2642F5570;
      int v7 = &v20;
      objc_copyWeak(&v20, &location);
      int v8 = [v11 zoomWithOptions:v3 sourceViewProvider:v19];
      [(QLPreviewController *)self setPreferredTransition:v8];
    }
LABEL_6:

    objc_destroyWeak(v7);
LABEL_7:
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }
}

double __48__QLPreviewController_updatePreferredTransition__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained contentFrame];
  if (CGRectIsEmpty(v86)) {
    goto LABEL_4;
  }
  id v6 = objc_loadWeakRetained(v4);
  [v6 contentFrame];
  if (v7 < 0.0)
  {

LABEL_4:
    goto LABEL_5;
  }
  id v53 = objc_loadWeakRetained(v4);
  [v53 contentFrame];
  double v55 = v54;

  if (v55 < 0.0)
  {
LABEL_5:
    id v8 = objc_loadWeakRetained(v4);
    id v9 = [v8 internalCurrentPreviewItem];
    if ([v9 previewItemType] != 2)
    {
      id v10 = objc_loadWeakRetained(v4);
      unint64_t v11 = [v10 internalCurrentPreviewItem];
      if ([v11 previewItemType] != 3)
      {
        id v78 = objc_loadWeakRetained(v4);
        v79 = [v78 internalCurrentPreviewItem];
        uint64_t v80 = [v79 previewItemType];

        if (v80 != 1)
        {
          id v50 = [v3 zoomedViewController];
          uint64_t v51 = [v50 view];
          [v51 frame];
          double v38 = v81;
          goto LABEL_46;
        }
LABEL_9:
        int v12 = [v3 sourceView];
        id v13 = [v12 window];
        [v13 frame];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        double v19 = v18;
        double v21 = v20;

        v87.origin.x = v15;
        v87.origin.y = v17;
        v87.size.double width = v19;
        v87.size.double height = v21;
        if (CGRectIsEmpty(v87))
        {
          id v22 = (NSObject **)MEMORY[0x263F62940];
          uint64_t v23 = *MEMORY[0x263F62940];
          if (!*MEMORY[0x263F62940])
          {
            QLSInitLogging();
            uint64_t v23 = *v22;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_217F61000, v23, OS_LOG_TYPE_ERROR, "Could not get the source view's window for the zoom transition, falling back to screen bounds! #PreviewController", buf, 2u);
          }
          id v24 = [MEMORY[0x263F82B60] mainScreen];
          [v24 bounds];
          double v19 = v25;
          double v21 = v26;
        }
        id v27 = objc_loadWeakRetained(v4);
        [v27 preferredContentSize];
        double v29 = v28;
        double v31 = v30;

        double v33 = *MEMORY[0x263F001B0];
        double v32 = *(double *)(MEMORY[0x263F001B0] + 8);
        if (v29 == *MEMORY[0x263F001B0] && v31 == v32)
        {
          long long v34 = (NSObject **)MEMORY[0x263F62940];
          long long v35 = *MEMORY[0x263F62940];
          if (!*MEMORY[0x263F62940])
          {
            QLSInitLogging();
            long long v35 = *v34;
          }
          double v29 = v19;
          double v31 = v21;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_217F61000, v35, OS_LOG_TYPE_INFO, "Preview controller has no preferred content size, falling back to window bounds for alignment rectangle #PreviewController", buf, 2u);
            double v29 = v19;
            double v31 = v21;
          }
        }
        if (v29 == v33 && v31 == v32)
        {
          long long v36 = (NSObject **)MEMORY[0x263F62940];
          long long v37 = *MEMORY[0x263F62940];
          if (!*MEMORY[0x263F62940])
          {
            QLSInitLogging();
            long long v37 = *v36;
          }
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_217F61000, v37, OS_LOG_TYPE_ERROR, "Could not compute alignment rectangle for zoom transition #PreviewController", buf, 2u);
          }
          double v38 = *MEMORY[0x263F001A8];
          goto LABEL_47;
        }
        id v39 = objc_loadWeakRetained(v4);
        long long v40 = [v39 internalCurrentPreviewItem];
        objc_msgSend(v40, "previewSizeForItemViewControllerSize:", v19, v21);

        UIRectCenteredRect();
        double v38 = v41;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        id v48 = (NSObject **)MEMORY[0x263F62940];
        v49 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          v49 = *v48;
        }
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          id v50 = v49;
          v88.origin.x = v38;
          v88.origin.y = v43;
          v88.size.double width = v45;
          v88.size.double height = v47;
          uint64_t v51 = NSStringFromCGRect(v88);
          *(_DWORD *)long long buf = 138412290;
          v84 = v51;
          v52 = "[ZOOM]: Frame alignmentRect = %@ #PreviewController";
LABEL_32:
          _os_log_impl(&dword_217F61000, v50, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
LABEL_46:

          goto LABEL_47;
        }
        goto LABEL_47;
      }
    }
    goto LABEL_9;
  }
  id v56 = objc_loadWeakRetained(v4);
  [v56 contentFrame];
  double v38 = v57;
  double v59 = v58;
  double v61 = v60;
  double v63 = v62;

  v64 = (NSObject **)MEMORY[0x263F62940];
  v65 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v65 = *v64;
  }
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    v66 = v65;
    v89.origin.x = v38;
    v89.origin.y = v59;
    v89.size.double width = v61;
    v89.size.double height = v63;
    v67 = NSStringFromCGRect(v89);
    *(_DWORD *)long long buf = 138412290;
    v84 = v67;
    _os_log_impl(&dword_217F61000, v66, OS_LOG_TYPE_DEFAULT, "[ZOOM] ContentFrame alignmentRect = %@ #PreviewController", buf, 0xCu);
  }
  if (v38 == 0.0 && v59 == 0.0)
  {
    v68 = [v3 zoomedViewController];
    v69 = [v68 view];
    [v69 frame];
    double v71 = v70;
    double v73 = v72;

    double v74 = v71 * 0.5;
    double v75 = v73 * 0.5;
    v76 = *v64;
    if (!*v64)
    {
      QLSInitLogging();
      v76 = *v64;
    }
    double v38 = v74 - v61 * 0.5;
    double v77 = v75 - v63 * 0.5;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      id v50 = v76;
      v90.origin.x = v38;
      v90.origin.y = v77;
      v90.size.double width = v61;
      v90.size.double height = v63;
      uint64_t v51 = NSStringFromCGRect(v90);
      *(_DWORD *)long long buf = 138412290;
      v84 = v51;
      v52 = "[ZOOM] Recentering alignmentRect to %@ #PreviewController";
      goto LABEL_32;
    }
  }
LABEL_47:

  return v38;
}

id __48__QLPreviewController_updatePreferredTransition__block_invoke_258(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v1);
  char v5 = [v4 currentPreviewItem];
  id v6 = [v3 previewController:v4 transitionViewForPreviewItem:v5];

  double v7 = (NSObject **)MEMORY[0x263F62940];
  id v8 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    [v6 frame];
    id v10 = NSStringFromCGRect(v16);
    int v12 = 138412290;
    id v13 = v10;
    _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_DEFAULT, "[ZOOM] client gave us a view with frame: %@ #PreviewController", (uint8_t *)&v12, 0xCu);
  }

  return v6;
}

id __48__QLPreviewController_updatePreferredTransition__block_invoke_262(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  memset(&v13, 0, sizeof(v13));
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v1);
  char v5 = [v4 currentPreviewItem];
  id v6 = [v3 previewController:v4 transitionViewForPreviewItem:v5 uncroppedSourceFrame:&v13];

  double v7 = (NSObject **)MEMORY[0x263F62940];
  id v8 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    [v6 frame];
    id v10 = NSStringFromCGRect(v20);
    unint64_t v11 = NSStringFromCGRect(v13);
    *(_DWORD *)long long buf = 138412546;
    CGFloat v15 = v10;
    __int16 v16 = 2112;
    CGFloat v17 = v11;
    _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_DEFAULT, "[ZOOM] client gaev us a view with frame: %@, uncroppedFrame: %@ #PreviewController", buf, 0x16u);
  }

  return v6;
}

id __48__QLPreviewController_updatePreferredTransition__block_invoke_267(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v1);
  char v5 = [v4 currentPreviewItem];
  id v57 = 0;
  [v3 previewController:v4 frameForPreviewItem:v5 inSourceView:&v57];
  double v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  id v14 = v57;
  CGFloat v15 = (NSObject **)MEMORY[0x263F62940];
  __int16 v16 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    __int16 v16 = *v15;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v17 = v16;
    v66.origin.double x = v7;
    v66.origin.double y = v9;
    v66.size.double width = v11;
    v66.size.double height = v13;
    uint64_t v18 = NSStringFromCGRect(v66);
    LODWORD(buf.origin.x) = 138412290;
    *(void *)((char *)&buf.origin.x + 4) = v18;
    _os_log_impl(&dword_217F61000, v17, OS_LOG_TYPE_DEFAULT, "[ZOOM] sourceFrame sent by client: %{PUBLIC}@ #PreviewController", (uint8_t *)&buf, 0xCu);
  }
  if (v14)
  {
    double v19 = (CGRect *)MEMORY[0x263F001A8];
    CGSize v20 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    buf.origin = (CGPoint)*MEMORY[0x263F001A8];
    buf.size = v20;
    id v21 = objc_loadWeakRetained(v1);
    id v22 = [v21 delegate];
    id v23 = objc_loadWeakRetained(v1);
    id v24 = [v23 currentPreviewItem];
    double v25 = [v22 previewController:v23 transitionImageForPreviewItem:v24 contentRect:&buf];

    double v26 = *v15;
    if (!*v15)
    {
      QLSInitLogging();
      double v26 = *v15;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v26;
      [v25 size];
      double v28 = NSStringFromCGSize(v65);
      double v29 = NSStringFromCGRect(buf);
      *(_DWORD *)double v58 = 138412546;
      double v59 = v28;
      __int16 v60 = 2112;
      double v61 = v29;
      _os_log_impl(&dword_217F61000, v27, OS_LOG_TYPE_DEFAULT, "[ZOOM] client returned image with size: %{PUBLIC}@ and contentRect: %{PUBLIC}@ #PreviewController", v58, 0x16u);
    }
    double x = buf.origin.x;
    double y = buf.origin.y;
    double height = buf.size.height;
    double width = buf.size.width;
    long long v34 = *v15;
    if (!*v15)
    {
      QLSInitLogging();
      long long v34 = *v15;
    }
    double v35 = v7 + x;
    double v36 = v9 + y;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      long long v37 = v34;
      v67.origin.double x = v35;
      v67.origin.double y = v36;
      v67.size.double width = width;
      v67.size.double height = height;
      double v38 = NSStringFromCGRect(v67);
      *(_DWORD *)double v58 = 138412290;
      double v59 = v38;
      _os_log_impl(&dword_217F61000, v37, OS_LOG_TYPE_DEFAULT, "[ZOOM] Adjusted source frame: %{PUBLIC}@ #PreviewController", v58, 0xCu);
    }
    double v39 = *MEMORY[0x263F001B0];
    double v40 = *(double *)(MEMORY[0x263F001B0] + 8);
    v68.origin.double x = v35;
    v68.origin.double y = v36;
    v68.size.double width = width;
    v68.size.double height = height;
    BOOL v41 = CGRectEqualToRect(v68, *v19);
    v69.origin.double x = v35;
    v69.origin.double y = v36;
    v69.size.double width = width;
    v69.size.double height = height;
    BOOL IsNull = CGRectIsNull(v69);
    v70.origin.double x = v35;
    v70.origin.double y = v36;
    v70.size.double width = width;
    v70.size.double height = height;
    IsEmptdouble y = CGRectIsEmpty(v70);
    v71.origin.double x = v35;
    v71.origin.double y = v36;
    v71.size.double width = width;
    v71.size.double height = height;
    BOOL IsInfinite = CGRectIsInfinite(v71);
    BOOL v45 = height == v40 && width == v39;
    if (v45 || v41 || IsNull || IsEmpty || IsInfinite)
    {
      double v46 = *v15;
      if (!*v15)
      {
        QLSInitLogging();
        double v46 = *v15;
      }
      double height = 1.0;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v58 = 0;
        _os_log_impl(&dword_217F61000, v46, OS_LOG_TYPE_FAULT, "-previewController:transitionImageForPreviewItem:contentRect: returned an invalid content rect, this is undefined behavior. Please return a valid CGRect. #PreviewController", v58, 2u);
      }
      double width = 1.0;
    }
    CGFloat v47 = *v15;
    if (!*v15)
    {
      QLSInitLogging();
      CGFloat v47 = *v15;
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = v47;
      v72.origin.double x = v35;
      v72.origin.double y = v36;
      v72.size.double width = width;
      v72.size.double height = height;
      v49 = NSStringFromCGRect(v72);
      *(_DWORD *)double v58 = 138412290;
      double v59 = v49;
      _os_log_impl(&dword_217F61000, v48, OS_LOG_TYPE_DEFAULT, "[ZOOM] Creating UIImageView with frame: %{PUBLIC}@ #PreviewController", v58, 0xCu);
    }
    id v50 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v35, v36, width, height);
    [v50 setImage:v25];
    [v50 setContentMode:1];
    uint64_t v51 = [MEMORY[0x263F825C8] clearColor];
    [v50 setBackgroundColor:v51];

    [v14 addSubview:v50];
    id v52 = objc_loadWeakRetained(v1);
    id v53 = [v52 transitionSourceView];
    [v53 removeFromSuperview];

    id v54 = objc_loadWeakRetained(v1);
    [v54 setTransitionSourceView:v50];
  }
  else
  {
    double v55 = *v15;
    if (!*v15)
    {
      QLSInitLogging();
      double v55 = *v15;
    }
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.origin.x) = 0;
      _os_log_impl(&dword_217F61000, v55, OS_LOG_TYPE_DEFAULT, "[ZOOM] sourceView is nil, bailing out #PreviewController", (uint8_t *)&buf, 2u);
    }
    id v50 = 0;
  }

  return v50;
}

uint64_t __48__QLPreviewController_updatePreferredTransition__block_invoke_269()
{
  return 0;
}

- (BOOL)hasItemsToPreview
{
  return [(QLPreviewController *)self numberOfPreviewItems] > 0;
}

- (void)setQuickLookVisibility:(unint64_t)a3
{
}

- (void)setQuickLookVisibility:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_quickLookVisibilitdouble y = a3;
  -[QLPreviewCollectionProtocol hostViewControlerTransitionToState:animated:](self->_previewCollection, "hostViewControlerTransitionToState:animated:");
  id v10 = [(QLPreviewController *)self internalCurrentPreviewItem];
  if ([v10 shouldOpenInFullScreen])
  {
    quickLookVisibilitdouble y = self->_quickLookVisibility;

    if (quickLookVisibility == 2)
    {
      double v7 = 0.0;
      if (v4)
      {
        double v8 = (void *)[objc_alloc(MEMORY[0x263F82C10]) initWithDefaultParameters];
        [v8 duration];
        double v7 = v9;
      }
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      void v11[2] = __55__QLPreviewController_setQuickLookVisibility_animated___block_invoke;
      void v11[3] = &unk_2642F5430;
      void v11[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v11 animations:v7];
    }
  }
  else
  {
  }
}

uint64_t __55__QLPreviewController_setQuickLookVisibility_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)setIsContentManaged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  char v5 = (NSObject **)MEMORY[0x263F62940];
  double v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    double v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = @"NO";
    if (v3) {
      double v7 = @"YES";
    }
    int v8 = 138412290;
    double v9 = v7;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_DEFAULT, "MDM : Client is setting isContentManaged to : %@ #PreviewController", (uint8_t *)&v8, 0xCu);
  }
  [(QLPreviewController *)self willChangeValueForKey:@"isContentManaged"];
  self->_isContentManaged = v3;
  [(QLPreviewController *)self didChangeValueForKey:@"isContentManaged"];
  [(QLPreviewCollectionProtocol *)self->_previewCollection setIsContentManaged:v3];
}

- (double)navigationBarGradientAlpha
{
  [(UIView *)self->_navigationBarGradientView alpha];
  return result;
}

- (void)setNavigationBarGradientAlpha:(double)a3
{
}

- (double)toolbarGradientAlpha
{
  [(UIView *)self->_toolbarGradientView alpha];
  return result;
}

- (void)setToolbarGradientAlpha:(double)a3
{
}

- (id)navigationBarGradientView
{
  p_navigationBarGradientView = &self->_navigationBarGradientView;
  navigationBarGradientView = self->_navigationBarGradientView;
  if (navigationBarGradientView)
  {
    BOOL v4 = navigationBarGradientView;
  }
  else
  {
    BOOL v4 = objc_alloc_init(_TtC9QuickLook14QLGradientView);
    [(QLGradientView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(QLGradientView *)v4 setUserInteractionEnabled:0];
    objc_storeStrong((id *)p_navigationBarGradientView, v4);
  }

  return v4;
}

- (id)toolbarGradientView
{
  p_toolbarGradientView = &self->_toolbarGradientView;
  toolbarGradientView = self->_toolbarGradientView;
  if (toolbarGradientView)
  {
    BOOL v4 = toolbarGradientView;
  }
  else
  {
    BOOL v4 = objc_alloc_init(_TtC9QuickLook14QLGradientView);
    [(QLGradientView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(QLGradientView *)v4 setUserInteractionEnabled:0];
    [(QLGradientView *)v4 setReversed:1];
    objc_storeStrong((id *)p_toolbarGradientView, v4);
  }

  return v4;
}

- (void)_installGradientViewsIfNeeded
{
  void v49[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(UIView *)self->_navigationBarGradientView superview];
  if (!v3
    || (BOOL v4 = (void *)v3,
        [(UIView *)self->_toolbarGradientView superview],
        char v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        !v5))
  {
    double v6 = [(QLPreviewController *)self internalNavigationController];
    double v7 = [v6 view];

    if (v7)
    {
      int v8 = [(QLPreviewController *)self navigationBarGradientView];
      double v9 = [(QLPreviewController *)self internalNavigationController];
      uint64_t v10 = [v9 navigationBar];
      [v7 insertSubview:v8 belowSubview:v10];

      double v32 = (void *)MEMORY[0x263F08938];
      double v46 = [(QLPreviewController *)self navigationBarGradientView];
      double v44 = [v46 leadingAnchor];
      double v42 = [v7 leadingAnchor];
      double v40 = [v44 constraintEqualToAnchor:v42];
      v49[0] = v40;
      double v38 = [(QLPreviewController *)self navigationBarGradientView];
      double v36 = [v38 trailingAnchor];
      long long v34 = [v7 trailingAnchor];
      double v31 = [v36 constraintEqualToAnchor:v34];
      v49[1] = v31;
      CGFloat v11 = [(QLPreviewController *)self navigationBarGradientView];
      double v12 = [v11 topAnchor];
      CGFloat v13 = [v7 topAnchor];
      id v14 = [v12 constraintEqualToAnchor:v13];
      v49[2] = v14;
      CGFloat v15 = [(QLPreviewController *)self navigationBarGradientView];
      __int16 v16 = [v15 heightAnchor];
      CGFloat v17 = [v16 constraintEqualToConstant:100.0];
      v49[3] = v17;
      uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
      [v32 activateConstraints:v18];

      double v19 = [(QLPreviewController *)self toolbarGradientView];
      CGSize v20 = [(QLPreviewController *)self internalNavigationController];
      id v21 = [v20 toolbar];
      [v7 insertSubview:v19 belowSubview:v21];

      double v33 = (void *)MEMORY[0x263F08938];
      CGFloat v47 = [(QLPreviewController *)self toolbarGradientView];
      BOOL v45 = [v47 leadingAnchor];
      CGFloat v43 = [v7 leadingAnchor];
      BOOL v41 = [v45 constraintEqualToAnchor:v43];
      v48[0] = v41;
      double v39 = [(QLPreviewController *)self toolbarGradientView];
      long long v37 = [v39 trailingAnchor];
      double v35 = [v7 trailingAnchor];
      id v22 = [v37 constraintEqualToAnchor:v35];
      v48[1] = v22;
      id v23 = [(QLPreviewController *)self toolbarGradientView];
      id v24 = [v23 bottomAnchor];
      double v25 = [v7 bottomAnchor];
      double v26 = [v24 constraintEqualToAnchor:v25];
      v48[2] = v26;
      id v27 = [(QLPreviewController *)self toolbarGradientView];
      double v28 = [v27 heightAnchor];
      double v29 = [v28 constraintEqualToConstant:100.0];
      v48[3] = v29;
      double v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:4];
      [v33 activateConstraints:v30];
    }
  }
}

- (void)_uninstallGradientViews
{
  [(UIView *)self->_navigationBarGradientView removeFromSuperview];
  toolbarGradientView = self->_toolbarGradientView;

  [(UIView *)toolbarGradientView removeFromSuperview];
}

- (void)_updateBarTintColors
{
  if (_os_feature_enabled_impl())
  {
    uint64_t v3 = [MEMORY[0x263F825C8] whiteColor];
    BOOL v4 = [(QLPreviewController *)self internalNavigationController];
    char v5 = [v4 navigationBar];
    [v5 setTintColor:v3];

    [(QLPreviewController *)self _installGradientViewsIfNeeded];
  }
  else if ([(QLPreviewController *)self presentationMode] == 2)
  {
    double v6 = [(QLPreviewController *)self navigationBarTintColor];
    double v7 = [(QLPreviewController *)self internalNavigationController];
    int v8 = [v7 navigationBar];
    [v8 setTintColor:v6];

    double v9 = [(QLPreviewController *)self toolbarTintColor];
    uint64_t v10 = [(QLPreviewController *)self toolbarController];
    [v10 setBarTintColor:v9];

    [(QLPreviewController *)self _uninstallGradientViews];
  }
  else if ([(QLPreviewController *)self presentationMode])
  {
    [(QLPreviewController *)self _uninstallGradientViews];
    if (_updateBarTintColors_onceToken != -1) {
      dispatch_once(&_updateBarTintColors_onceToken, &__block_literal_global_284);
    }
  }

  [(QLPreviewController *)self _updateBarGradientOpacity];
}

void __43__QLPreviewController__updateBarTintColors__block_invoke()
{
  v0 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v1 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v1 = *v0;
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl(&dword_217F61000, v1, OS_LOG_TYPE_DEFAULT, "Warning: setNavigationBarTintColor:; and setToolbarTintColor:; are only supported when QuickLook is being presente"
      "d modally. #Support",
      v2,
      2u);
  }
}

- (void)_updateBackgroundColor
{
}

void __45__QLPreviewController__updateBackgroundColor__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentAnimator];
  if (!v2
    || (uint64_t v3 = (void *)v2,
        [*(id *)(a1 + 32) currentAnimator],
        BOOL v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 transitionState],
        v4,
        v3,
        v5 == 2))
  {
    id v7 = [*(id *)(a1 + 32) _preferredBackgroundColor];
    double v6 = [*(id *)(a1 + 32) view];
    [v6 setBackgroundColor:v7];

    if (objc_opt_respondsToSelector()) {
      [*(id *)(*(void *)(a1 + 32) + 1232) hostViewControllerBackgroundColorChanged:v7];
    }
    [*(id *)(a1 + 32) _updateBarGradientOpacity];
  }
}

- (void)_updateBarGradientOpacity
{
  if ([(QLPreviewController *)self fullScreen]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  [(QLPreviewController *)self setNavigationBarGradientAlpha:v3];
  if ([(QLPreviewController *)self fullScreen]) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }

  [(QLPreviewController *)self setToolbarGradientAlpha:v4];
}

- (BOOL)accessibilityPerformEscape
{
  double v3 = [(QLPreviewController *)self currentAnimator];

  if (!v3) {
    [(QLPreviewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  return v3 == 0;
}

- (void)setNavigationBarShouldBeChromeless:(BOOL)a3
{
  if (self->_navigationBarShouldBeChromeless != a3)
  {
    self->_navigationBarShouldBeChromeless = a3;
    QLRunInMainThread();
  }
}

uint64_t __58__QLPreviewController_setNavigationBarShouldBeChromeless___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateChromelessBars];
}

- (void)setToolbarShouldBeChromeless:(BOOL)a3
{
  if (self->_toolbarShouldBeChromeless != a3)
  {
    self->_toolbarShouldBeChromeless = a3;
    QLRunInMainThread();
  }
}

uint64_t __52__QLPreviewController_setToolbarShouldBeChromeless___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateChromelessBars];
}

- (void)updateChromelessBars
{
  if (self->_navigationBarShouldBeChromeless) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  double v4 = [(QLPreviewController *)self _topViewController];
  uint64_t v5 = [v4 navigationItem];
  [v5 _setManualScrollEdgeAppearanceProgress:v3];

  double v6 = [(QLPreviewController *)self _topViewController];
  id v7 = [v6 navigationItem];
  [v7 _setManualScrollEdgeAppearanceEnabled:1];

  if (self->_toolbarShouldBeChromeless) {
    double v8 = 0.0;
  }
  else {
    double v8 = 1.0;
  }
  double v9 = [(QLPreviewController *)self toolbarController];
  uint64_t v10 = [v9 customToolbar];
  CGFloat v11 = [v10 _backgroundView];
  [v11 setAlpha:v8];

  if (self->_toolbarShouldBeChromeless) {
    double v12 = 0.0;
  }
  else {
    double v12 = 1.0;
  }
  id v15 = [(QLPreviewController *)self toolbarController];
  CGFloat v13 = [v15 originalToolbar];
  id v14 = [v13 _backgroundView];
  [v14 setAlpha:v12];
}

- (void)previewCollectionUpdatePreviewItem:(int64_t)a3
{
}

uint64_t __58__QLPreviewController_previewCollectionUpdatePreviewItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCurrentPreviewItemIndex:*(void *)(a1 + 40) updatePreview:0 animated:0];
}

- (void)previewCollectionPrefersWhitePointAdaptivityStyle:(int64_t)a3
{
}

void __73__QLPreviewController_previewCollectionPrefersWhitePointAdaptivityStyle___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(void *)(*(void *)(a1 + 32) + 1032) = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) transitionCoordinator];

  double v3 = (NSObject **)MEMORY[0x263F62940];
  double v4 = *MEMORY[0x263F62940];
  if (v2)
  {
    if (!v4)
    {
      QLSInitLogging();
      double v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = v4;
      double v6 = _UIStringFromWhitePointAdaptivityStyle();
      *(_DWORD *)CGRect buf = 138412290;
      double v12 = v6;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_INFO, "Harmony: Skipping setting white point adaptivity style to '%@', since view controller transition seems to be in progress. #Harmony", buf, 0xCu);
    }
  }
  else
  {
    if (!v4)
    {
      QLSInitLogging();
      double v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v7 = v4;
      double v8 = _UIStringFromWhitePointAdaptivityStyle();
      *(_DWORD *)CGRect buf = 138412290;
      double v12 = v8;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_INFO, "Harmony: Will set style to '%@' – no transition seems to be in progress. #Harmony", buf, 0xCu);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __73__QLPreviewController_previewCollectionPrefersWhitePointAdaptivityStyle___block_invoke_287;
    v10[3] = &unk_2642F55B8;
    uint64_t v9 = *(void *)(a1 + 40);
    void v10[4] = *(void *)(a1 + 32);
    void v10[5] = v9;
    [MEMORY[0x263F82E00] animateWithDuration:v10 animations:0.3];
  }
}

uint64_t __73__QLPreviewController_previewCollectionPrefersWhitePointAdaptivityStyle___block_invoke_287(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPreferredWhitePointAdaptivityStyle:*(void *)(a1 + 40)];
}

- (void)setFullScreen:(BOOL)a3
{
}

uint64_t __37__QLPreviewController_setFullScreen___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setFullScreen:*(unsigned __int8 *)(a1 + 40) animated:1 force:0];
}

- (void)setScreenEdgePanWidth:(double)a3
{
}

uint64_t __45__QLPreviewController_setScreenEdgePanWidth___block_invoke(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    double v3 = *(void **)(*(void *)(a1 + 32) + 1232);
    double v4 = *(double *)(a1 + 40);
    return [v3 setScreenEdgePanWidth:v4];
  }
  return result;
}

- (void)setAccessoryViewVisible:(BOOL)a3
{
}

uint64_t __47__QLPreviewController_setAccessoryViewVisible___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __47__QLPreviewController_setAccessoryViewVisible___block_invoke_2;
  v2[3] = &unk_2642F55E0;
  v2[4] = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  return [MEMORY[0x263F82E00] animateWithDuration:v2 animations:0.2];
}

void __47__QLPreviewController_setAccessoryViewVisible___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) toolbarController];
  [v2 setAccessoryViewHidden:*(unsigned char *)(a1 + 40) == 0];

  id v3 = [*(id *)(a1 + 32) toolbarController];
  [v3 updateLayout];
}

- (void)setPrinter:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInBackgroundThread();
}

void __34__QLPreviewController_setPrinter___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  CGFloat v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  id v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  char v2 = objc_opt_respondsToSelector();
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__QLPreviewController_setPrinter___block_invoke_2;
    v9[3] = &unk_2642F5608;
    void v9[4] = &v10;
    id v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v9];
  }
  else
  {
    id v4 = v3;
  }
  uint64_t v5 = v4;
  if (v11[5])
  {
    double v6 = (NSObject **)MEMORY[0x263F62940];
    id v7 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = v11[5];
      *(_DWORD *)CGRect buf = 138412290;
      uint64_t v17 = v8;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_ERROR, "Error getting the printer proxy (%@) #Generic", buf, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 1208), v4);
  }

  _Block_object_dispose(&v10, 8);
}

void __34__QLPreviewController_setPrinter___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)updateOverlayButtonsAnimated:(BOOL)a3 buttons:(id)a4 excludedButtonIdentifiers:(id)a5
{
  BOOL v24 = a3;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v23 = (NSArray *)a5;
  double v26 = (NSArray *)objc_opt_new();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(obj);
        }
        CGFloat v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v12 = self->_previewToolbarButtons;
        uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (!v13)
        {

LABEL_18:
          id v15 = v11;
          goto LABEL_19;
        }
        uint64_t v14 = v13;
        id v15 = 0;
        uint64_t v16 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * j);
            if ([v18 isEqual:v11])
            {
              id v19 = v18;

              id v15 = v19;
            }
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v14);

        if (!v15) {
          goto LABEL_18;
        }
LABEL_19:
        [(NSArray *)v26 addObject:v15];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v8);
  }

  previewToolbarButtons = self->_previewToolbarButtons;
  self->_previewToolbarButtons = v26;
  id v21 = v26;

  excludedToolbarButtonIdentifiers = self->_excludedToolbarButtonIdentifiers;
  self->_excludedToolbarButtonIdentifiers = v23;

  [(QLPreviewController *)self updateOverlayAnimated:v24 forceRefresh:1];
}

- (void)_updateOverlayButtonsForTraitCollection:(id)a3 animated:(BOOL)a4
{
  previewCollection = self->_previewCollection;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__QLPreviewController__updateOverlayButtonsForTraitCollection_animated___block_invoke;
  v5[3] = &unk_2642F5658;
  void v5[4] = self;
  BOOL v6 = a4;
  [(QLPreviewCollectionProtocol *)previewCollection toolbarButtonsForTraitCollection:a3 withCompletionHandler:v5];
}

void __72__QLPreviewController__updateOverlayButtonsForTraitCollection_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v7 = a3;
  id v5 = v7;
  id v6 = v4;
  QLRunInMainThread();
}

uint64_t __72__QLPreviewController__updateOverlayButtonsForTraitCollection_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateOverlayButtonsAnimated:*(unsigned __int8 *)(a1 + 56) buttons:*(void *)(a1 + 40) excludedButtonIdentifiers:*(void *)(a1 + 48)];
}

- (void)updateOverlayButtons:(BOOL)a3
{
}

void __44__QLPreviewController_updateOverlayButtons___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  id v4 = [v2 view];
  id v3 = [v4 traitCollection];
  [v2 _updateOverlayButtonsForTraitCollection:v3 animated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)openURLIfAllowed:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || ([(QLPreviewController *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(QLPreviewController *)self currentPreviewItem],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v7 previewController:self shouldOpenURL:v4 forPreviewItem:v8],
        v8,
        v7,
        v9))
  {
    if (objc_opt_respondsToSelector())
    {
      if ([v4 isTelephonyURL])
      {
        gotLoadHelper_x8__OBJC_CLASS___TUDialRequest(v10);
        uint64_t v12 = (void *)[objc_alloc(*(Class *)(v11 + 560)) initWithURL:v4];
        [v12 setShowUIPrompt:1];
        uint64_t v13 = [v12 URL];

        id v4 = (id)v13;
      }
    }
    else
    {
      uint64_t v14 = (NSObject **)MEMORY[0x263F62940];
      id v15 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v15 = *v14;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CGRect buf = 0;
        _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_ERROR, "-[NSURL isTelephonyURL] is not available from TelephonyUtilities #Generic", buf, 2u);
      }
    }
    if (v4)
    {
      id v4 = v4;
      QLRunInMainThread();
    }
  }
}

uint64_t __40__QLPreviewController_openURLIfAllowed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptUserAndOpenURLIfNeeded:*(void *)(a1 + 40)];
}

- (void)_promptUserAndOpenURLIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v6 = objc_msgSend(v5, "ql_applicationName");

  if (v6) {
    id v7 = (__CFString *)v6;
  }
  else {
    id v7 = @"current application";
  }
  uint64_t v8 = NSString;
  int v9 = QLLocalizedString();
  double v10 = objc_msgSend(v8, "localizedStringWithFormat:", v9, v7);

  uint64_t v11 = (void *)MEMORY[0x263F82418];
  uint64_t v12 = [v4 absoluteString];
  uint64_t v13 = [v11 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

  uint64_t v14 = (void *)MEMORY[0x263F82400];
  id v15 = QLLocalizedStringWithDefaultValue();
  uint64_t v16 = [v14 actionWithTitle:v15 style:1 handler:0];
  [v13 addAction:v16];

  uint64_t v17 = (void *)MEMORY[0x263F82400];
  uint64_t v18 = QLLocalizedStringWithDefaultValue();
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __53__QLPreviewController__promptUserAndOpenURLIfNeeded___block_invoke;
  v21[3] = &unk_2642F52F8;
  id v22 = v4;
  id v19 = v4;
  CGSize v20 = [v17 actionWithTitle:v18 style:0 handler:v21];
  [v13 addAction:v20];

  [(QLPreviewController *)self presentViewController:v13 animated:1 completion:0];
}

void __53__QLPreviewController__promptUserAndOpenURLIfNeeded___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)showShareSheet
{
}

uint64_t __37__QLPreviewController_showShareSheet__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showShareSheetFromBarButton:0];
}

- (void)showShareSheetWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5
{
  id v7 = a3;
  id v11 = a4;
  id v12 = a5;
  id v8 = v12;
  id v9 = v11;
  id v10 = v7;
  QLRunInMainThread();
}

uint64_t __90__QLPreviewController_showShareSheetWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showShareSheetFromRemoteViewWithPopoverTracker:*(void *)(a1 + 40) customSharedURL:*(void *)(a1 + 48) dismissCompletion:*(void *)(a1 + 56)];
}

- (void)triggerQuickLookDismissal
{
}

uint64_t __48__QLPreviewController_triggerQuickLookDismissal__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissQuickLook];
}

- (id)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
}

- (void)getStateRestorationUserInfo:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __51__QLPreviewController_getStateRestorationUserInfo___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1144) userInfo];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)updateStateRestorationWithUserInfo:(id)a3
{
  id v9 = a3;
  userActivitdouble y = self->_userActivity;
  if (!userActivity)
  {
    id v7 = (NSUserActivity *)[objc_alloc(MEMORY[0x263F018D0]) initWithActivityType:@"com.apple.quicklookGenericActivityType"];
    id v8 = self->_userActivity;
    self->_userActivitdouble y = v7;

    goto LABEL_5;
  }
  id v5 = [(NSUserActivity *)userActivity userInfo];

  uint64_t v6 = v9;
  if (v5 != v9)
  {
LABEL_5:
    [(NSUserActivity *)self->_userActivity setUserInfo:v9];
    uint64_t v6 = v9;
  }
}

- (void)_dismissQuickLookFromKeyboardCommand
{
}

uint64_t __59__QLPreviewController__dismissQuickLookFromKeyboardCommand__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissQuickLook];
}

- (void)updateKeyCommands
{
  v22[3] = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83760] modifierFlags:0 action:sel__previousPreview];
  id v4 = QLLocalizedString();
  [v3 setDiscoverabilityTitle:v4];

  id v5 = [MEMORY[0x263F82890] keyCommandWithInput:*MEMORY[0x263F83768] modifierFlags:0 action:sel__nextPreview];
  uint64_t v6 = QLLocalizedString();
  [v5 setDiscoverabilityTitle:v6];

  id v7 = [MEMORY[0x263F82890] keyCommandWithInput:@"w" modifierFlags:0x100000 action:sel__dismissQuickLookFromKeyboardCommand];
  id v8 = QLLocalizedString();
  [v7 setDiscoverabilityTitle:v8];

  uint64_t v9 = [MEMORY[0x263F629A0] keyCommandWithKeyCommand:v3 identifier:0];
  v22[0] = v9;
  id v10 = [MEMORY[0x263F629A0] keyCommandWithKeyCommand:v5 identifier:1];
  v22[1] = v10;
  id v11 = [MEMORY[0x263F629A0] keyCommandWithKeyCommand:v7 identifier:8];
  v22[2] = v11;
  id v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];

  uint64_t v13 = [(QLPreviewController *)self delegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  objc_initWeak(&location, self);
  char v14 = v9 & 1;
  previewCollection = self->_previewCollection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __40__QLPreviewController_updateKeyCommands__block_invoke;
  v17[3] = &unk_2642F56F8;
  char v20 = v14;
  void v17[4] = self;
  id v16 = v12;
  id v18 = v16;
  objc_copyWeak(&v19, &location);
  [(QLPreviewCollectionProtocol *)previewCollection keyCommandsWithCompletionHandler:v17];
  objc_destroyWeak(&v19);

  objc_destroyWeak(&location);
}

void __40__QLPreviewController_updateKeyCommands__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v6 = *(unsigned char *)(a1 + 56);
  id v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  QLRunInMainThread();
  objc_destroyWeak(&v5);
}

void __40__QLPreviewController_updateKeyCommands__block_invoke_2(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  double v25 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v31 != v4) {
          objc_enumerationMutation(obj);
        }
        char v6 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v7 = [v6 keyCommand];
        id v8 = (void *)MEMORY[0x263F82890];
        uint64_t v9 = [v7 input];
        id v10 = objc_msgSend(v8, "keyCommandWithInput:modifierFlags:action:", v9, objc_msgSend(v7, "modifierFlags"), sel__keyCommandWasPerformed_);

        id v11 = [v7 discoverabilityTitle];
        [v10 setDiscoverabilityTitle:v11];

        if (!*(unsigned char *)(a1 + 64)
          || ([*(id *)(a1 + 40) delegate],
              id v12 = objc_claimAutoreleasedReturnValue(),
              int v13 = objc_msgSend(v12, "previewController:shouldAllowKeyCommandWithIdentifier:", *(void *)(a1 + 40), objc_msgSend(v6, "keyCommandIdentifier")), v12, v13))
        {
          [v25 setObject:v6 forKey:v10];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v3);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = *(id *)(a1 + 48);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        if (*(unsigned char *)(a1 + 64))
        {
          char v20 = [*(id *)(a1 + 40) delegate];
          int v21 = objc_msgSend(v20, "previewController:shouldAllowKeyCommandWithIdentifier:", *(void *)(a1 + 40), objc_msgSend(v19, "keyCommandIdentifier"));

          if (!v21) {
            continue;
          }
        }
        id v22 = [v19 keyCommand];
        [v25 setObject:v19 forKey:v22];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v16);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setPreviewKeyCommands:v25];
}

- (void)handleKeyPressWithInput:(id)a3 modifierFlags:(int64_t)a4
{
  id v5 = a3;
  id v4 = v5;
  QLRunInMainThread();
}

void __61__QLPreviewController_handleKeyPressWithInput_modifierFlags___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) hasEditedItems])
  {
    uint64_t v2 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v3 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)CGRect buf = 138412546;
      uint64_t v33 = v4;
      __int16 v34 = 2048;
      uint64_t v35 = v5;
      char v6 = "Host will not perform key press unhandled in service because there are remote unsaved edits (input: %@, modif"
           "ier flags: %ld) #PreviewController";
LABEL_21:
      _os_log_impl(&dword_217F61000, v3, OS_LOG_TYPE_INFO, v6, buf, 0x16u);
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = objc_msgSend(*(id *)(a1 + 32), "keyCommands", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          int v13 = [v12 input];
          if ([v13 isEqualToString:*(void *)(a1 + 40)])
          {
            uint64_t v14 = [v12 modifierFlags];
            uint64_t v15 = *(void *)(a1 + 48);

            if (v14 == v15)
            {
              id v19 = (NSObject **)MEMORY[0x263F62940];
              char v20 = *MEMORY[0x263F62940];
              if (!*MEMORY[0x263F62940])
              {
                QLSInitLogging();
                char v20 = *v19;
              }
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                uint64_t v21 = *(void *)(a1 + 40);
                uint64_t v22 = *(void *)(a1 + 48);
                id v23 = v20;
                BOOL v24 = [v12 description];
                *(_DWORD *)CGRect buf = 138412802;
                uint64_t v33 = v21;
                __int16 v34 = 2048;
                uint64_t v35 = v22;
                __int16 v36 = 2112;
                long long v37 = v24;
                _os_log_impl(&dword_217F61000, v23, OS_LOG_TYPE_INFO, "Host can perform key press unhandled in service (input: %@, modifier flags: %ld) with key command (%@) #PreviewController", buf, 0x20u);
              }
              [v12 action];
              if (objc_opt_respondsToSelector())
              {
                double v25 = (char *)[v12 action];
                long long v26 = *(void **)(a1 + 32);
                uint64_t v27 = [v12 action];
                if (v25 == sel__keyCommandWasPerformed_) {
                  [v26 performSelector:v27 withObject:v12];
                }
                else {
                  [v26 performSelector:v27];
                }
              }

              return;
            }
          }
          else
          {
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v38 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    uint64_t v16 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v3 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v3 = *v16;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      *(_DWORD *)CGRect buf = 138412546;
      uint64_t v33 = v17;
      __int16 v34 = 2048;
      uint64_t v35 = v18;
      char v6 = "Key press unhandled in service cannot be handled by the host either: (input: %@, modifier flags: %ld) #PreviewController";
      goto LABEL_21;
    }
  }
}

- (void)remoteViewControllerWasInvalidated
{
  uint64_t v3 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CGRect buf = 0;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_INFO, "Host was notified of remoteViewControllerWasInvalidated #Generic", buf, 2u);
  }
  [(QLPreviewController *)self setFullScreen:0];
  uint64_t v5 = [(QLPreviewController *)self previewCollection];
  if ([v5 isAvailable]) {
    goto LABEL_8;
  }
  char v6 = [(QLPreviewController *)self currentAnimator];

  if (v6)
  {
    uint64_t v5 = [(QLPreviewController *)self currentAnimator];
    [v5 tearDownTransition:1];
LABEL_8:
  }
  self->_previewCollectionNeedsConfiguration = 1;
  [(QLPreviewController *)self setCanChangeCurrentPage:1];
  lastCrashTimeStamp = self->_lastCrashTimeStamp;
  if (!lastCrashTimeStamp || ([(NSDate *)lastCrashTimeStamp timeIntervalSinceNow], v8 < -10.0))
  {
    self->_unint64_t numberOfRetries = 0;
LABEL_12:
    uint64_t v9 = [MEMORY[0x263EFF910] date];
    uint64_t v10 = self->_lastCrashTimeStamp;
    self->_lastCrashTimeStamp = v9;

    [(QLPreviewController *)self _removePreviewCollectionFromViewHierarchy];
    previewCollection = self->_previewCollection;
    self->_previewCollection = 0;

    dispatch_time_t v12 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__QLPreviewController_remoteViewControllerWasInvalidated__block_invoke;
    block[3] = &unk_2642F5430;
    block[4] = self;
    dispatch_after(v12, MEMORY[0x263EF83A0], block);
    return;
  }
  unint64_t numberOfRetries = self->_numberOfRetries;
  if (numberOfRetries <= 2)
  {
    self->_unint64_t numberOfRetries = numberOfRetries + 1;
    goto LABEL_12;
  }
  uint64_t v14 = [MEMORY[0x263EFF910] date];
  uint64_t v15 = self->_lastCrashTimeStamp;
  self->_lastCrashTimeStamp = v14;
}

uint64_t __57__QLPreviewController_remoteViewControllerWasInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentPreviewCollection];
}

- (void)beginInteractiveTransition
{
}

void __49__QLPreviewController_beginInteractiveTransition__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) currentAnimator];
  if (v2)
  {

LABEL_4:
    uint64_t v4 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      char v6 = *(void **)(a1 + 32);
      id v7 = v5;
      double v8 = [v6 currentAnimator];
      uint64_t v9 = [*(id *)(a1 + 32) presentedViewController];
      int v20 = 138412546;
      uint64_t v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_ERROR, "beginInteractiveTransition can't be initiated (currentAnimator: %@, presentedViewController: %@) #AppearanceTransition", (uint8_t *)&v20, 0x16u);
    }
    return;
  }
  uint64_t v3 = [*(id *)(a1 + 32) presentedViewController];

  if (v3) {
    goto LABEL_4;
  }
  uint64_t v10 = objc_opt_new();
  [*(id *)(a1 + 32) setCurrentAnimator:v10];

  id v11 = (NSObject **)MEMORY[0x263F62940];
  dispatch_time_t v12 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    dispatch_time_t v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v13 = *(void **)(a1 + 32);
    uint64_t v14 = v12;
    uint64_t v15 = [v13 currentAnimator];
    int v20 = 138412290;
    uint64_t v21 = v15;
    _os_log_impl(&dword_217F61000, v14, OS_LOG_TYPE_INFO, "beginInteractiveTransition is initiated with new currentAnimator: %@ #AppearanceTransition", (uint8_t *)&v20, 0xCu);
  }
  uint64_t v16 = [*(id *)(a1 + 32) presentationMode];
  uint64_t v17 = *(void **)(a1 + 32);
  if (v16 == 1)
  {
    uint64_t v18 = [v17 internalNavigationController];
    id v19 = (id)[v18 popViewControllerAnimated:1];
  }
  else
  {
    [v17 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)forwardMessage:(id)a3 toItemAtIndex:(unint64_t)a4 withUUID:(id)a5 completionHandler:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v14 = a6;
  int v13 = v9;
  id v10 = v14;
  id v11 = v8;
  id v12 = v9;
  QLRunInMainThread();
}

void __79__QLPreviewController_forwardMessage_toItemAtIndex_withUUID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) previewItemAtIndex:*(void *)(a1 + 64)];
  uint64_t v3 = [v2 originalPreviewItem];
  uint64_t v4 = [v2 uuid];
  int v5 = [v4 isEqual:*(void *)(a1 + 40)];

  if ([v3 conformsToProtocol:&unk_26C971CC0]) {
    unsigned __int8 v6 = objc_opt_respondsToSelector();
  }
  else {
    unsigned __int8 v6 = 0;
  }
  if (v2) {
    int v7 = v5;
  }
  else {
    int v7 = 0;
  }
  if (v7 == 1 && (([v2 previewItemType] == 12) & v6) != 0)
  {
    [v3 handleMessageFromCustomExtension:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
  }
  else
  {
    id v8 = (NSObject **)MEMORY[0x263F62940];
    id v9 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 64);
      int v14 = 138412802;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v2;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_ERROR, "Could not forward message %@ to item %@ at index %lu #PreviewController", (uint8_t *)&v14, 0x20u);
    }
    uint64_t v12 = *(void *)(a1 + 56);
    int v13 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F629F0] code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
}

- (void)expandContentOfItemAtIndex:(unint64_t)a3 withUUID:(id)a4 unarchivedItemsURLWrapper:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  QLRunInMainThread();
}

void __85__QLPreviewController_expandContentOfItemAtIndex_withUUID_unarchivedItemsURLWrapper___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) presentationMode] == 2
    || [*(id *)(a1 + 32) presentationMode] == 1)
  {
    uint64_t v2 = [*(id *)(a1 + 32) previewItemAtIndex:*(void *)(a1 + 56)];
    uint64_t v3 = [v2 uuid];
    int v4 = [v3 isEqual:*(void *)(a1 + 40)];

    if (v2 && v4 && [v2 previewItemType] == 10)
    {
      [*(id *)(a1 + 32) setWillTransitionToInternalView:1];
      int v5 = [[QLPreviewItemStore alloc] initWithItemsOfDirectoryAtURL:*(void *)(a1 + 48)];
      [(QLPreviewItemStore *)v5 setDelegate:*(void *)(a1 + 32)];
      id v6 = +[QLPreviewController controllerWithItemStore:v5];
      [v6 setAllowInteractiveTransitions:0];
      [v6 setDidTransitionFromInternalView:1];
      objc_msgSend(v6, "setIsContentManaged:", objc_msgSend(*(id *)(a1 + 32), "isContentManaged"));
      [v6 setPreferredTransition:0];
      id v7 = [*(id *)(a1 + 32) toolbarController];
      [v7 restoreOriginalToolbar];

      id v8 = [*(id *)(a1 + 32) internalNavigationController];
      [v8 pushViewController:v6 animated:1];
    }
    else
    {
      id v9 = (NSObject **)MEMORY[0x263F62940];
      uint64_t v10 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        uint64_t v10 = *v9;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = *(void *)(a1 + 56);
        int v12 = 138412546;
        int v13 = v2;
        __int16 v14 = 2048;
        uint64_t v15 = v11;
        _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "Could not expand content of item %@ at index %lu #ZIPHandling", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

- (void)presentAlertControllerForScenario:(int64_t)a3
{
}

void __57__QLPreviewController_presentAlertControllerForScenario___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    id v15 = 0;
    uint64_t v1 = 0;
    uint64_t v2 = 0;
    goto LABEL_12;
  }
  int v4 = (void *)MEMORY[0x263F82400];
  int v5 = QLLocalizedString();
  uint64_t v2 = [v4 actionWithTitle:v5 style:0 handler:0];

  id v6 = [MEMORY[0x263F629A8] sharedInstance];
  uint64_t v7 = [v6 networkState];

  if (v7 == 1)
  {
    id v8 = [MEMORY[0x263F629A8] sharedInstance];
    int v9 = [v8 isWifiCapable];

    if (v9) {
      MGGetBoolAnswer();
    }
    QLLocalizedString();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    int v13 = (void *)MEMORY[0x263F82400];
    __int16 v14 = QLLocalizedString();
    uint64_t v1 = [v13 actionWithTitle:v14 style:0 handler:&__block_literal_global_406];

    uint64_t v10 = (uint64_t)v16;
    if (!v16) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v10 = QLLocalizedString();
    uint64_t v1 = 0;
    if (!v10)
    {
LABEL_11:
      id v15 = 0;
      goto LABEL_12;
    }
  }
  id v15 = (id)v10;
  uint64_t v11 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:0 preferredStyle:1];
  int v12 = v11;
  if (v1) {
    [v11 addAction:v1];
  }
  [v12 addAction:v2];
  [*(id *)(a1 + 32) presentViewController:v12 animated:1 completion:0];

LABEL_12:
}

void __57__QLPreviewController_presentAlertControllerForScenario___block_invoke_2()
{
  id v1 = [MEMORY[0x263F01880] defaultWorkspace];
  v0 = [NSURL URLWithString:@"prefs:root=ROOT#AIRPLANE_MODE"];
  [v1 openSensitiveURL:v0 withOptions:0];
}

- (void)createTemporaryEditDirectoryForItemAtIndex:(unint64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThread();
}

void __84__QLPreviewController_createTemporaryEditDirectoryForItemAtIndex_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) previewItemAtIndex:*(void *)(a1 + 48)];
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F62938] code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
  id v5 = [MEMORY[0x263F08850] defaultManager];
  id v6 = [v2 saveURL];
  id v14 = 0;
  uint64_t v7 = [v5 URLForDirectory:99 inDomain:1 appropriateForURL:v6 create:1 error:&v14];
  id v8 = v14;

  if (!v8 || v7)
  {
    if (!v8) {
      goto LABEL_9;
    }
LABEL_8:
    uint64_t v11 = 0;
    goto LABEL_11;
  }
  int v9 = NSURL;
  uint64_t v10 = NSTemporaryDirectory();
  uint64_t v7 = [v9 fileURLWithPath:v10];

  if (!v7) {
    goto LABEL_8;
  }

LABEL_9:
  id v13 = 0;
  uint64_t v11 = [MEMORY[0x263F054E0] wrapperWithURL:v7 readonly:0 error:&v13];
  id v12 = v13;
  if (!v12)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  id v8 = v12;
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_13:
}

- (void)setCanChangeCurrentPage:(BOOL)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(&v4, &location);
  BOOL v5 = a3;
  QLRunInMainThread();
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __47__QLPreviewController_setCanChangeCurrentPage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[1164] = *(unsigned char *)(a1 + 40);
}

- (void)currentPreviewItemViewControllerIsReadyForDisplay
{
}

uint64_t __72__QLPreviewController_currentPreviewItemViewControllerIsReadyForDisplay__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 1162))
  {
    if (!*(unsigned char *)(v1 + 1163))
    {
      *(unsigned char *)(v1 + 1163) = 1;
      return [*(id *)(result + 32) _endDelayingPresentation];
    }
  }
  return result;
}

- (void)currentPreviewItemViewControllerHasUnsavedEdits:(BOOL)a3 forItemUUID:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  BOOL v9 = a3;
  id v7 = v6;
  QLRunInMainThread();

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __83__QLPreviewController_currentPreviewItemViewControllerHasUnsavedEdits_forItemUUID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    if (!WeakRetained[144])
    {
      uint64_t v3 = [MEMORY[0x263EFF9C0] set];
      id v4 = (void *)v7[144];
      v7[144] = v3;

      id WeakRetained = v7;
    }
    BOOL v5 = (void *)WeakRetained[144];
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 56)) {
      [v5 addObject:v6];
    }
    else {
      [v5 removeObject:v6];
    }
    [*(id *)(a1 + 40) _updateAllowInteractiveTransitionsIfNeeded];
    [*(id *)(a1 + 40) updateDoneButtonMenu];
    id WeakRetained = v7;
  }
}

- (BOOL)currentPreviewHasUnsavedEdits
{
  uint64_t v3 = [(QLPreviewController *)self internalCurrentPreviewItem];
  id v4 = v3;
  itemsWithEditsInMemordouble y = self->_itemsWithEditsInMemory;
  if (itemsWithEditsInMemory
    && ([v3 uuid],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [(NSMutableSet *)itemsWithEditsInMemory containsObject:v6],
        v6,
        (v7 & 1) != 0))
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    BOOL v9 = [v4 editedCopy];
    if (v9)
    {
      uint64_t v10 = [v4 editedCopy];
      uint64_t v11 = [v4 lastSavedEditedCopy];
      int v8 = [v10 isEqual:v11] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  if (![(QLPreviewController *)self canDismissWithGesture]
    || [(QLPreviewController *)self hasEditedItems])
  {
    return 0;
  }

  return [(QLPreviewController *)self allowInteractiveTransitions];
}

- (void)_updateAllowInteractiveTransitionsIfNeeded
{
  if ([(QLPreviewController *)self _shouldAllowInteractiveTransitions])
  {
    uint64_t v3 = [(QLPreviewController *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4) {
      uint64_t v5 = [(QLPreviewController *)self hasEditedItems] ^ 1;
    }
    else {
      uint64_t v5 = 1;
    }
    [(QLPreviewController *)self setAllowInteractiveTransitions:v5];
  }
}

- (BOOL)_shouldAllowInteractiveTransitions
{
  if ([(QLPreviewController *)self presentationMode] == 2)
  {
    uint64_t v3 = [(QLPreviewController *)self view];
    char v4 = [v3 window];
    uint64_t v5 = [v4 rootViewController];

    if (v5 == self) {
      return 0;
    }
  }
  if ([(QLPreviewController *)self presentationMode] != 2
    || [(QLPreviewController *)self forceModalPresentation])
  {
    return 0;
  }
  if ([(QLPreviewController *)self modalPresentationStyle]
    && [(QLPreviewController *)self modalPresentationStyle] != 6)
  {
    return [(QLPreviewController *)self modalPresentationStyle] == 5;
  }
  return 1;
}

- (void)previewItemAtIndex:(unint64_t)a3 wasUpdatedWithLifecycleState:(int64_t)a4 withError:(id)a5
{
  id v17 = a5;
  switch(a4)
  {
    case 0:
      int v8 = [(QLPreviewController *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        uint64_t v10 = [(QLPreviewController *)self delegate];
        [v10 previewController:self willLoadPreviewItemAtIndex:a3];
        goto LABEL_14;
      }
      break;
    case 1:
      id v14 = [(QLPreviewController *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        uint64_t v10 = [(QLPreviewController *)self delegate];
        [v10 previewController:self didLoadPreviewItemAtIndex:a3 withError:v17];
        goto LABEL_14;
      }
      break;
    case 2:
      uint64_t v11 = [(QLPreviewController *)self delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        uint64_t v10 = [(QLPreviewController *)self delegate];
        [v10 previewController:self willPresentPreviewItemAtIndex:a3];
        goto LABEL_14;
      }
      break;
    case 3:
      uint64_t v10 = [(QLPreviewController *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_14;
      }
      BOOL v16 = [(QLPreviewController *)self _isQuickLookVisible];

      if (v16)
      {
        uint64_t v10 = [(QLPreviewController *)self delegate];
        [v10 previewController:self didPresentPreviewItemAtIndex:a3];
        goto LABEL_14;
      }
      break;
    case 4:
      uint64_t v10 = [(QLPreviewController *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        BOOL v13 = [(QLPreviewController *)self _isQuickLookVisible];

        if (v13) {
          break;
        }
        uint64_t v10 = [(QLPreviewController *)self delegate];
        [v10 previewController:self didDismissPreviewItemAtIndex:a3];
      }
LABEL_14:

      break;
    default:
      break;
  }
}

- (void)updatePreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  QLRunInMainThread();
}

uint64_t __77__QLPreviewController_updatePreviewItemAtIndex_editedCopy_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEditCopyOfPreviewItemAtIndex:*(void *)(a1 + 56) editedCopy:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
}

- (void)updatePreferredContentSize:(CGSize)a3
{
}

uint64_t __50__QLPreviewController_updatePreferredContentSize___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) preferredContentSize];
  if (v4 != *(double *)(a1 + 40) || v3 != *(double *)(a1 + 48))
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __50__QLPreviewController_updatePreferredContentSize___block_invoke_2;
    v6[3] = &unk_2642F5858;
    void v6[4] = *(void *)(a1 + 32);
    long long v7 = *(_OWORD *)(a1 + 40);
    return [MEMORY[0x263F82E00] animateWithDuration:v6 animations:0.2];
  }
  return result;
}

uint64_t __50__QLPreviewController_updatePreferredContentSize___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)updateContentFrame:(CGRect)a3
{
}

uint64_t __42__QLPreviewController_updateContentFrame___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (NSObject **)MEMORY[0x263F62940];
  double v3 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    double v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v4 = *(double *)(a1 + 40);
    CGFloat v5 = *(double *)(a1 + 48);
    CGFloat v6 = *(double *)(a1 + 56);
    CGFloat v7 = *(double *)(a1 + 64);
    id v8 = v3;
    v14.origin.double x = v4;
    v14.origin.double y = v5;
    v14.size.double width = v6;
    v14.size.double height = v7;
    id v9 = NSStringFromCGRect(v14);
    int v11 = 138412290;
    char v12 = v9;
    _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_DEFAULT, "received contentFrameUpdate: %@ #Generic", (uint8_t *)&v11, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setContentFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)updateTitle:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

uint64_t __35__QLPreviewController_updateTitle___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentTitleFromItemViewController:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateNavigationTitle];
}

- (void)_reloadDataIfNeeded
{
  if (self->_deferReloadData) {
    [(QLPreviewController *)self reloadData];
  }
}

- (BOOL)isTopPreviewController
{
  uint64_t v2 = self;
  id v3 = [(QLPreviewController *)self _topPreviewController];
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (id)_topPreviewController
{
  id v3 = [(QLPreviewController *)self internalNavigationController];
  id v4 = [v3 topViewController];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  CGFloat v6 = v4;
  if ((isKindOfClass & 1) != 0
    || (v7 = [(QLPreviewController *)self _topViewControllerBelongsToHierarchy:v4], CGFloat v6 = self, v7))
  {
    id v8 = v6;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_topViewController
{
  id v3 = [(QLPreviewController *)self internalNavigationController];
  id v4 = [v3 topViewController];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || [(QLPreviewController *)self _topViewControllerBelongsToHierarchy:v4])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)_topViewControllerBelongsToHierarchy:(id)a3
{
  id v4 = (QLPreviewController *)a3;
  id v5 = v4;
  if (v4 == self || (QLPreviewController *)self->_previewCollection == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    id WeakRetained = (QLPreviewController *)objc_loadWeakRetained((id *)&self->_modalRootViewController);
    BOOL v7 = WeakRetained == v5;
  }
  return v7;
}

- (BOOL)_quickLookWillBecomeVisible
{
  return [(QLPreviewController *)self quickLookVisibility] == 3;
}

- (BOOL)_isQuickLookVisible
{
  return [(QLPreviewController *)self quickLookVisibility] == 2;
}

- (void)_updateAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(QLPreviewController *)self toolbarController];
  double v6 = 0.0;
  if (([v5 isAccessoryViewHidden] & 1) == 0)
  {
    BOOL v7 = [(QLPreviewController *)self toolbarController];
    id v8 = [v7 accessoryView];
    [v8 frame];
    double v6 = v9;
  }
  uint64_t v10 = [(QLPreviewController *)self previewCollection];
  int v11 = [v10 view];
  [v11 safeAreaInsets];
  double v13 = v6 + v12;

  CGRect v14 = [(QLPreviewController *)self previewCollection];
  char v15 = [v14 view];
  [v15 safeAreaInsets];
  double v17 = v16;

  id v18 = objc_alloc(MEMORY[0x263F62948]);
  unint64_t v19 = [(QLPreviewController *)self presentationMode];
  uint64_t v20 = [MEMORY[0x263F82B60] mainScreen];
  [v20 _peripheryInsets];
  id v25 = (id)objc_msgSend(v18, "initWithTopInset:bottomInset:presentationMode:peripheryInsets:", v19, v17, v13, v21, v22, v23, v24);

  [(QLPreviewCollectionProtocol *)self->_previewCollection setAppearance:v25 animated:v3];
}

- (void)_savePreviousNavigationVCState
{
  BOOL v3 = (QLNavigationState *)objc_opt_new();
  previousNavigationVCState = self->_previousNavigationVCState;
  self->_previousNavigationVCState = v3;

  id v5 = [(QLPreviewController *)self navigationController];
  double v6 = [v5 navigationBar];
  -[QLNavigationState setTranslucentNavigationBar:](self->_previousNavigationVCState, "setTranslucentNavigationBar:", [v6 isTranslucent]);

  BOOL v7 = [(QLPreviewController *)self navigationController];
  id v8 = [v7 toolbar];
  -[QLNavigationState setTranslucentToolbar:](self->_previousNavigationVCState, "setTranslucentToolbar:", [v8 isTranslucent]);

  double v9 = [(QLPreviewController *)self navigationController];
  -[QLNavigationState setNavigationBarHidden:](self->_previousNavigationVCState, "setNavigationBarHidden:", [v9 isNavigationBarHidden]);

  uint64_t v10 = [(QLPreviewController *)self navigationController];
  -[QLNavigationState setToolBarHidden:](self->_previousNavigationVCState, "setToolBarHidden:", [v10 isToolbarHidden]);

  id v11 = [(QLPreviewController *)self navigationController];
  [(QLNavigationState *)self->_previousNavigationVCState setNavigationController:v11];
}

+ (BOOL)canPreviewItem:(id)item
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = item;
  id v4 = (NSObject **)MEMORY[0x263F62940];
  id v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_DEFAULT, "[API] canPreviewIem: %@ #PreviewController", (uint8_t *)&v9, 0xCu);
  }
  double v6 = [MEMORY[0x263F62978] itemWithPreviewItem:v3];
  char v7 = [v6 canBePreviewed];

  return v7;
}

+ (id)printPageRendererForItem:(id)a3
{
  id v3 = a3;
  if ([v3 canBePrintedWithCustomPrinter]) {
    id v4 = [[QLPreviewItemPrinter alloc] initWithItem:v3];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)parentIsNavigationController
{
  uint64_t v2 = [(QLPreviewController *)self parentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)showNoDataViewIfNeeded
{
  v21[1] = *MEMORY[0x263EF8340];
  if (![(QLPreviewController *)self hasItemsToPreview] && !self->_noDataView)
  {
    id v3 = [QLErrorView alloc];
    id v4 = QLLocalizedString();
    id v5 = [(QLErrorView *)v3 initWithTitle:v4];
    noDataView = self->_noDataView;
    self->_noDataView = v5;

    char v7 = [(QLPreviewController *)self view];
    [v7 insertSubview:self->_noDataView atIndex:0];

    [(QLErrorView *)self->_noDataView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [(QLPreviewController *)self view];
    int v9 = (void *)MEMORY[0x263F08938];
    id v10 = self->_noDataView;
    uint64_t v20 = @"error";
    v21[0] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    double v12 = [v9 constraintsWithVisualFormat:@"H:|[error]|" options:0 metrics:0 views:v11];
    [v8 addConstraints:v12];

    double v13 = [(QLPreviewController *)self view];
    CGRect v14 = (void *)MEMORY[0x263F08938];
    char v15 = self->_noDataView;
    id v18 = @"error";
    unint64_t v19 = v15;
    double v16 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    double v17 = [v14 constraintsWithVisualFormat:@"V:|[error]|" options:0 metrics:0 views:v16];
    [v13 addConstraints:v17];
  }
}

- (void)hideNoDataView
{
  [(QLErrorView *)self->_noDataView removeFromSuperview];
  noDataView = self->_noDataView;
  self->_noDataView = 0;
}

- (BOOL)hasEditedItems
{
  previewItemStore = self->_previewItemStore;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __37__QLPreviewController_hasEditedItems__block_invoke;
  v4[3] = &unk_2642F58A8;
  v4[4] = self;
  return [(QLPreviewItemStore *)previewItemStore hasLoadedItemsMatching:v4];
}

uint64_t __37__QLPreviewController_hasEditedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEdited])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 1152);
    double v6 = [v3 uuid];
    uint64_t v4 = [v5 containsObject:v6];
  }
  return v4;
}

- (id)editedItems
{
  previewItemStore = self->_previewItemStore;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34__QLPreviewController_editedItems__block_invoke;
  v5[3] = &unk_2642F58A8;
  void v5[4] = self;
  id v3 = [(QLPreviewItemStore *)previewItemStore loadedItemsMatching:v5];

  return v3;
}

uint64_t __34__QLPreviewController_editedItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEdited])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 1152);
    double v6 = [v3 uuid];
    uint64_t v4 = [v5 containsObject:v6];
  }
  return v4;
}

- (void)_viewControllerPresentationDidInitiate
{
  v5.receiver = self;
  v5.super_class = (Class)QLPreviewController;
  [(QLPreviewController *)&v5 _viewControllerPresentationDidInitiate];
  if (!self->_didStartDelayingPresentation)
  {
    id v3 = [(QLPreviewController *)self presentationController];
    if ([v3 presentationStyle] == 20)
    {
    }
    else
    {
      int v4 = [MEMORY[0x263F82E00] areAnimationsEnabled];

      if (v4)
      {
        [(QLPreviewController *)self _beginDelayingPresentation:0 cancellationHandler:1.0];
        self->_didStartDelayingPresentation = 1;
        self->_didEndDelayingPresentation = 0;
      }
    }
  }
  [(QLPreviewController *)self _reloadDataIfNeeded];
  [(QLPreviewController *)self _setPresentationMode:2];
}

- (void)reloadData
{
  id v3 = (NSObject **)MEMORY[0x263F62940];
  int v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    int v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v15 = 0;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_DEFAULT, "[API] reloadData #PreviewController", v15, 2u);
  }
  if ([(QLPreviewController *)self quickLookVisibility] == 1) {
    self->_updatedWhileDisappearing = 1;
  }
  [(QLPreviewController *)self setCanChangeCurrentPage:1];
  self->_deferReloadData = 0;
  uint64_t v5 = [(QLPreviewController *)self dataSource];
  if (v5
    && (double v6 = (void *)v5,
        [(QLPreviewController *)self dataSource],
        char v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 numberOfPreviewItemsInPreviewController:self],
        v7,
        v6,
        int64_t v9 = v8 - 1,
        v8 >= 1))
  {
    deferredSetIndedouble x = self->_deferredSetIndex;
    if (deferredSetIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      int64_t currentPreviewItemIndex = self->_currentPreviewItemIndex;
      if (currentPreviewItemIndex < v9) {
        int64_t v9 = self->_currentPreviewItemIndex;
      }
      if (currentPreviewItemIndex == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v12 = 0;
      }
      else {
        int64_t v12 = v9;
      }
    }
    else
    {
      if (deferredSetIndex >= v9) {
        int64_t v12 = v8 - 1;
      }
      else {
        int64_t v12 = self->_deferredSetIndex;
      }
      self->_deferredSetIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    }
    self->_int64_t currentPreviewItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    CGRect v14 = [(QLPreviewController *)self previewItemStore];
    [v14 reloadWithNumberOfPreviewItems:v8];

    self->_previewCollectionNeedsConfiguration = 1;
    [(QLPreviewController *)self _setCurrentPreviewItemIndex:v12 updatePreview:1 animated:0];
    if (!self->_updatedWhileDisappearing) {
      [(QLPreviewController *)self _presentPreviewCollection];
    }
    [(QLPreviewController *)self _configurePreviewCollectionIfNeeded];
    [(QLPreviewController *)self hideNoDataView];
  }
  else
  {
    double v13 = [(QLPreviewController *)self previewItemStore];
    [v13 reloadWithNumberOfPreviewItems:0];

    self->_int64_t currentPreviewItemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)refreshCurrentPreviewItem
{
  id v3 = (NSObject **)MEMORY[0x263F62940];
  int v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    int v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_DEFAULT, "[API] refreshCurrentPreviewItem (calls reloadData) #PreviewController", v5, 2u);
  }
  [(QLPreviewController *)self reloadData];
}

- (void)_refreshCurrentPreviewItemAnimated:(BOOL)a3
{
  if (self->_currentPreviewItemIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v3 = a3;
    previewCollection = self->_previewCollection;
    NSInteger v5 = [(QLPreviewController *)self currentPreviewItemIndex];
    [(QLPreviewCollectionProtocol *)previewCollection setCurrentPreviewItemIndex:v5 animated:v3];
  }
}

- (void)_nextPreview
{
  unint64_t v3 = [(QLPreviewController *)self currentPreviewItemIndex];
  if (v3 < [(QLPreviewItemStore *)self->_previewItemStore numberOfItems] - 1)
  {
    NSInteger v4 = [(QLPreviewController *)self currentPreviewItemIndex] + 1;
    [(QLPreviewController *)self _setCurrentPreviewItemIndex:v4 updatePreview:1 animated:0];
  }
}

- (void)_previousPreview
{
  if ([(QLPreviewController *)self currentPreviewItemIndex] >= 1)
  {
    NSInteger v3 = [(QLPreviewController *)self currentPreviewItemIndex] - 1;
    [(QLPreviewController *)self _setCurrentPreviewItemIndex:v3 updatePreview:1 animated:0];
  }
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  id v6 = a3;
  previewItemStore = self->_previewItemStore;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__QLPreviewController_setPreviewItemDisplayState_onItemAtIndex___block_invoke;
  v9[3] = &unk_2642F58D0;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  [(QLPreviewItemStore *)previewItemStore previewItemAtIndex:a4 withCompletionHandler:v9];
}

void __64__QLPreviewController_setPreviewItemDisplayState_onItemAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    [v9 setPreviewItemDisplayState:*(void *)(a1 + 32)];
    id v6 = [*(id *)(a1 + 40) delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [*(id *)(a1 + 40) delegate];
      [v8 previewController:*(void *)(a1 + 40) didUpdateDisplayStateOfPreviewItem:v9];
    }
  }
}

- (id)previewItemDisplayStateForItem:(id)a3
{
  return (id)[a3 previewItemDisplayState];
}

- (void)applyPreviewItemDisplayState:(id)a3 toItem:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  [v6 setPreviewItemDisplayState:v12];
  id v7 = v6;
  if (v7)
  {
    int64_t v8 = [(QLPreviewItemStore *)self->_previewItemStore indexOfPreviewItem:v7];
    id v9 = [(QLPreviewController *)self previewCollection];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      uint64_t v11 = [(QLPreviewController *)self previewCollection];
      [v11 previewItemDisplayState:v12 wasAppliedToItemAtIndex:v8];
    }
  }
}

- (void)presentPreviewItem:(id)a3 onViewController:(id)a4 withDelegate:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  v21[1] = *MEMORY[0x263EF8340];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  double v13 = [v11 view];
  CGRect v14 = [v13 tintColor];
  char v15 = [(QLPreviewController *)self view];
  [v15 setTintColor:v14];

  double v16 = [MEMORY[0x263F62978] itemWithPreviewItem:v12];

  double v17 = [QLPreviewItemStore alloc];
  v21[0] = v16;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  unint64_t v19 = [(QLPreviewItemStore *)v17 initWithPreviewItems:v18];
  previewItemStore = self->_previewItemStore;
  self->_previewItemStore = v19;

  [(QLPreviewItemStore *)self->_previewItemStore setDelegate:self];
  [(QLPreviewController *)self setDataSource:self->_previewItemStore];
  [(QLPreviewController *)self setStrongDelegate:v10];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v11 pushViewController:self animated:v6];
  }
  else {
    [v11 presentViewController:self animated:v6 completion:0];
  }
}

- (void)previewItemAtIndex:(unint64_t)a3 withCompletionHandler:(id)a4
{
  BOOL v6 = (void (**)(id, void *, void *))a4;
  id v7 = [(QLPreviewController *)self dataSource];
  id v10 = [v7 previewController:self previewItemAtIndex:a3];

  int64_t v8 = [MEMORY[0x263F62978] itemWithPreviewItem:v10];
  id v9 = [v8 fetcher];
  v6[2](v6, v8, v9);
}

- (id)keyCommands
{
  NSInteger v3 = [(NSMutableDictionary *)self->_previewKeyCommands allKeys];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __34__QLPreviewController_keyCommands__block_invoke;
  v6[3] = &unk_2642F58F8;
  void v6[4] = self;
  NSInteger v4 = [v3 sortedArrayUsingComparator:v6];

  return v4;
}

uint64_t __34__QLPreviewController_keyCommands__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = NSNumber;
  BOOL v6 = *(void **)(*(void *)(a1 + 32) + 1216);
  id v7 = a3;
  int64_t v8 = [v6 objectForKeyedSubscript:a2];
  id v9 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v8, "keyCommandIdentifier"));
  id v10 = NSNumber;
  id v11 = [*(id *)(*(void *)(a1 + 32) + 1216) objectForKeyedSubscript:v7];

  id v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "keyCommandIdentifier"));
  uint64_t v13 = [v9 compare:v12];

  return v13;
}

- (void)_keyCommandWasPerformed:(id)a3
{
  id v5 = [(NSMutableDictionary *)self->_previewKeyCommands objectForKey:a3];
  if (v5)
  {
    NSInteger v4 = [(QLPreviewController *)self previewCollection];
    [v4 keyCommandWasPerformed:v5];
  }
}

- (void)_setPreferredWhitePointAdaptivityStyle:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  NSInteger v4 = (NSObject **)MEMORY[0x263F62940];
  id v5 = *MEMORY[0x263F62940];
  if (self->_whitePointAdaptivityStyle == a3)
  {
    if (!v5)
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      BOOL v6 = v5;
      id v7 = _UIStringFromWhitePointAdaptivityStyle();
      int64_t whitePointAdaptivityStyle = self->_whitePointAdaptivityStyle;
      *(_DWORD *)CGRect buf = 138412546;
      char v15 = v7;
      __int16 v16 = 2048;
      int64_t v17 = whitePointAdaptivityStyle;
      _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_DEBUG, "No whitepoint adaptivity update required, since requested style matches the current one (%@ [%ld]) #Harmony", buf, 0x16u);
    }
  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v10 = v5;
      id v11 = _UIStringFromWhitePointAdaptivityStyle();
      id v12 = _UIStringFromWhitePointAdaptivityStyle();
      int64_t v13 = self->_whitePointAdaptivityStyle;
      *(_DWORD *)CGRect buf = 138413058;
      char v15 = v11;
      __int16 v16 = 2048;
      int64_t v17 = a3;
      __int16 v18 = 2112;
      unint64_t v19 = v12;
      __int16 v20 = 2048;
      int64_t v21 = v13;
      _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_DEBUG, "Will request whitepoint adaptivity style update, since requested style (%@ [%ld]) doesn't match the current one (%@ [%ld]) #Harmony", buf, 0x2Au);
    }
    self->_int64_t whitePointAdaptivityStyle = a3;
    QLRunInMainThread();
  }
}

uint64_t __62__QLPreviewController__setPreferredWhitePointAdaptivityStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsWhitePointAdaptivityStyleUpdate];
}

- (id)_childViewControllerForWhitePointAdaptivityStyle
{
  NSInteger v3 = [(QLPreviewController *)self internalNavigationController];
  NSInteger v4 = [v3 topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(QLPreviewController *)self internalNavigationController];
    BOOL v6 = [v5 topViewController];
    if (v6 == self)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [(QLPreviewController *)self internalNavigationController];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  NSInteger v3 = (NSObject **)MEMORY[0x263F62940];
  NSInteger v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    NSInteger v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = v4;
    BOOL v6 = _UIStringFromWhitePointAdaptivityStyle();
    int64_t whitePointAdaptivityStyle = self->_whitePointAdaptivityStyle;
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2048;
    int64_t v12 = whitePointAdaptivityStyle;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_DEBUG, "Setting whitepoint adaptivity style to %@ (%ld) #Harmony", (uint8_t *)&v9, 0x16u);
  }
  return self->_whitePointAdaptivityStyle;
}

- (BOOL)itemStore:(id)a3 canShareItem:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(QLPreviewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    int64_t v8 = [(QLPreviewController *)self delegate];
    int v9 = [v5 originalPreviewItem];
    char v10 = [v8 previewController:self canShareItem:v9];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)itemStore:(id)a3 canEditItem:(id)a4
{
  id v6 = a4;
  if ([(QLPreviewController *)self itemStore:a3 editedFileBehaviorForItem:v6] == 1)
  {
    char v7 = [v6 previewItemURL];

    if (v7)
    {
      int64_t v8 = [v6 previewItemURL];
      int v9 = [v8 startAccessingSecurityScopedResource];

      char v10 = [MEMORY[0x263F08850] defaultManager];
      __int16 v11 = [v6 previewItemURL];
      int64_t v12 = [v11 path];
      int v13 = [v10 isWritableFileAtPath:v12];

      if (v9)
      {
        CGRect v14 = [v6 previewItemURL];
        [v14 stopAccessingSecurityScopedResource];

        if ((v13 & 1) == 0) {
          goto LABEL_12;
        }
      }
      else if (!v13)
      {
LABEL_12:
        char v22 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      char v15 = [v6 fpItem];

      if (!v15) {
        goto LABEL_12;
      }
      __int16 v16 = [v6 fpItem];
      char v17 = [v16 isWritable];

      if ((v17 & 1) == 0) {
        goto LABEL_12;
      }
    }
  }
  __int16 v18 = [(QLPreviewController *)self delegate];
  char v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) == 0) {
    goto LABEL_12;
  }
  __int16 v20 = [(QLPreviewController *)self delegate];
  int64_t v21 = [v6 originalPreviewItem];
  char v22 = [v20 previewController:self canEditItem:v21];

LABEL_13:
  return v22;
}

- (BOOL)itemStore:(id)a3 canHandleEditedCopyOfPreviewItem:(id)a4
{
  NSInteger v4 = [(QLPreviewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  return v5 & 1;
}

- (unint64_t)itemStore:(id)a3 editedFileBehaviorForItem:(id)a4
{
  id v5 = a4;
  id v6 = [(QLPreviewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v7 = [(QLPreviewController *)self delegate];
    LODWORD(v8) = [v7 previewController:self shouldSaveEditedItem:v5];

    uint64_t v8 = v8;
  }
  else
  {

    uint64_t v8 = 0;
  }
  int v9 = [(QLPreviewController *)self delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10) {
    uint64_t v11 = v8 | 2;
  }
  else {
    uint64_t v11 = v8;
  }
  int64_t v12 = [(QLPreviewController *)self delegate];
  char v13 = objc_opt_respondsToSelector();

  if (v13) {
    unint64_t v14 = v11 | 4;
  }
  else {
    unint64_t v14 = v11;
  }

  return v14;
}

- (BOOL)itemStore:(id)a3 canMachineReadableCodeBeDetectedInPreviewItem:(id)a4
{
  id v5 = a4;
  id v6 = [(QLPreviewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 previewController:self shouldDetectMachineReadableCodeForPreviewItem:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (int64_t)itemStore:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isArchive]) {
    goto LABEL_6;
  }
  uint64_t v8 = [(QLPreviewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  char v10 = [(QLPreviewController *)self delegate];
  if (v9)
  {
    uint64_t v11 = [v7 originalPreviewItem];
    int64_t v12 = [v10 previewController:self editingModeForPreviewItem:v11];

    goto LABEL_9;
  }
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) != 0 || [v7 previewItemType] == 1)
  {
LABEL_6:
    int64_t v12 = 0;
    goto LABEL_7;
  }
  int64_t v12 = 4;
  [(QLPreviewController *)self setForceDismissActionsPresentation:1];
LABEL_9:
  if (v12 == 1)
  {
    char v15 = [v7 previewItemURL];

    if (v15)
    {
      __int16 v20 = [v7 previewItemURL];
      int v16 = [v20 startAccessingSecurityScopedResource];

      char v17 = [MEMORY[0x263F08850] defaultManager];
      __int16 v18 = [v7 previewItemURL];
      char v19 = [v18 path];
      LODWORD(v20) = [v17 isWritableFileAtPath:v19];

      if (v16)
      {
        int64_t v21 = [v7 previewItemURL];
        [v21 stopAccessingSecurityScopedResource];
LABEL_15:
      }
    }
    else
    {
      __int16 v20 = [v7 fpItem];

      if (v20)
      {
        int64_t v21 = [v7 fpItem];
        LODWORD(v20) = [v21 isWritable];
        goto LABEL_15;
      }
    }
    int64_t v12 = v20 | [(QLPreviewController *)self itemStore:v6 canHandleEditedCopyOfPreviewItem:v7];
  }
LABEL_7:

  return v12;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(QLPreviewController *)self previewCollection];

  if (v7 == v6) {
    self->_willTransitionToInternalView = 0;
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return self->_fullScreen;
}

- (BOOL)_adoptPersona:(id)a3 andPerformBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [MEMORY[0x263F841B0] sharedManager];
  uint64_t v8 = [v7 currentPersona];

  char v9 = [v8 isSystemPersona];
  if (v5 && (v9 & 1) != 0)
  {
    id v15 = 0;
    char v10 = (void *)[v8 copyCurrentPersonaContextWithError:&v15];
    id v11 = v15;
    if (!v11)
    {
      char v13 = [v8 generateAndRestorePersonaContextWithIdentityString:v5];
      v6[2](v6);
      if (v13)
      {
LABEL_9:

        BOOL v12 = 0;
LABEL_10:

        goto LABEL_11;
      }
      id v11 = [v8 restorePersonaWithSavedPersonaContext:v10];
      if (!v11)
      {
        BOOL v12 = 1;
        goto LABEL_10;
      }
    }
    char v13 = v11;
    v6[2](v6);
    goto LABEL_9;
  }
  v6[2](v6);
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (void)_toggleDebugView
{
  previewCollection = self->_previewCollection;
  if (previewCollection) {
    [(QLPreviewCollectionProtocol *)previewCollection toggleDebugView];
  }
}

- (id)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return WeakRetained;
}

- (QLPrintingProtocol)printer
{
  return (QLPrintingProtocol *)objc_getProperty(self, a2, 1208, 1);
}

- (NSMutableDictionary)previewKeyCommands
{
  return self->_previewKeyCommands;
}

- (void)setPreviewKeyCommands:(id)a3
{
}

- (UIView)transitionSourceView
{
  return self->_transitionSourceView;
}

- (void)setTransitionSourceView:(id)a3
{
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (BOOL)canChangeCurrentPage
{
  return self->_canChangeCurrentPage;
}

- (BOOL)canDismissWithGesture
{
  return self->_canDismissWithGesture;
}

- (void)setCanDismissWithGesture:(BOOL)a3
{
  self->_canDismissWithGesture = a3;
}

- (BOOL)overlayHidden
{
  return self->_overlayHidden;
}

- (void)setOverlayHidden:(BOOL)a3
{
  self->_overlayHidden = a3;
}

- (BOOL)overlayFrozen
{
  return self->_overlayFrozen;
}

- (void)setOverlayFrozen:(BOOL)a3
{
  self->_overlayFrozen = a3;
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (BOOL)isInteractivePopEnabled
{
  return self->_isInteractivePopEnabled;
}

- (void)setIsInteractivePopEnabled:(BOOL)a3
{
  self->_isInteractivePopEnabled = a3;
}

- (BOOL)previousStatusBarHidden
{
  return self->_previousStatusBarHidden;
}

- (void)setPreviousStatusBarHidden:(BOOL)a3
{
  self->_previousStatusBarHidden = a3;
}

- (QLPreviewCollectionProtocol)previewCollection
{
  return (QLPreviewCollectionProtocol *)objc_getProperty(self, a2, 1232, 1);
}

- (NSArray)previewToolbarButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1240, 1);
}

- (NSArray)excludedToolbarButtonIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1248, 1);
}

- (QLNavigationState)previousNavigationVCState
{
  return (QLNavigationState *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setInternalNavigationController:(id)a3
{
}

- (BOOL)willTransitionToInternalView
{
  return self->_willTransitionToInternalView;
}

- (void)setWillTransitionToInternalView:(BOOL)a3
{
  self->_willTransitionToInternalView = a3;
}

- (BOOL)didTransitionFromInternalView
{
  return self->_didTransitionFromInternalView;
}

- (void)setDidTransitionFromInternalView:(BOOL)a3
{
  self->_didTransitionFromInternalView = a3;
}

- (BOOL)allowInteractiveTransitions
{
  return self->_allowInteractiveTransitions;
}

- (QLToolbarController)toolbarController
{
  return self->_toolbarController;
}

- (QLPreviewItemStore)previewItemStore
{
  return (QLPreviewItemStore *)objc_getProperty(self, a2, 1280, 1);
}

- (QLActivityItemProvider)currentItemProvider
{
  return (QLActivityItemProvider *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setCurrentItemProvider:(id)a3
{
}

- (QLCustomURLSharingProxyDelegate)customURLSharingProxyDelegate
{
  return self->_customURLSharingProxyDelegate;
}

- (void)setCustomURLSharingProxyDelegate:(id)a3
{
}

- (UIDocumentInteractionController)sharingInteractionController
{
  return (UIDocumentInteractionController *)objc_getProperty(self, a2, 1304, 1);
}

- (void)setSharingInteractionController:(id)a3
{
}

- (QLRemotePopoverTracker)shareSheetPopoverTracker
{
  return self->_shareSheetPopoverTracker;
}

- (void)setShareSheetPopoverTracker:(id)a3
{
}

- (id)shareSheetDismissCompletion
{
  return self->_shareSheetDismissCompletion;
}

- (void)setShareSheetDismissCompletion:(id)a3
{
}

- (NSURL)accessedUrlForSharingController
{
  return self->_accessedUrlForSharingController;
}

- (void)setAccessedUrlForSharingController:(id)a3
{
}

- (NSArray)originalLeftBarButtonItems
{
  return (NSArray *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setOriginalLeftBarButtonItems:(id)a3
{
}

- (NSArray)originalRightBarButtonItems
{
  return (NSArray *)objc_getProperty(self, a2, 1344, 1);
}

- (void)setOriginalRightBarButtonItems:(id)a3
{
}

- (NSString)currentTitleFromItemViewController
{
  return (NSString *)objc_getProperty(self, a2, 1352, 1);
}

- (void)setCurrentTitleFromItemViewController:(id)a3
{
}

- (QLPreviewControllerDelegate)strongDelegate
{
  return self->_strongDelegate;
}

- (void)setStrongDelegate:(id)a3
{
}

- (UIPanGestureRecognizer)slideGesture
{
  return (UIPanGestureRecognizer *)objc_getProperty(self, a2, 1368, 1);
}

- (void)setSlideGesture:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return (UIPinchGestureRecognizer *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setPinchGesture:(id)a3
{
}

- (UIRotationGestureRecognizer)rotationGesture
{
  return (UIRotationGestureRecognizer *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setRotationGesture:(id)a3
{
}

- (QLSwipeDownTracker)swipeDownTracker
{
  return (QLSwipeDownTracker *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setSwipeDownTracker:(id)a3
{
}

- (QLPinchRotationTracker)pinchRotationTracker
{
  return (QLPinchRotationTracker *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setPinchRotationTracker:(id)a3
{
}

- (QLStateManager)stateManager
{
  return (QLStateManager *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setStateManager:(id)a3
{
}

- (QLTransitionController)currentAnimator
{
  return (QLTransitionController *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setCurrentAnimator:(id)a3
{
}

- (BOOL)canShowToolbar
{
  return self->_canShowToolbar;
}

- (void)setCanShowToolbar:(BOOL)a3
{
  self->_canShowToolbar = a3;
}

- (BOOL)canShowNavBar
{
  return self->_canShowNavBar;
}

- (void)setCanShowNavBar:(BOOL)a3
{
  self->_canShowNavBar = a3;
}

- (BOOL)forceDismissActionsPresentation
{
  return self->_forceDismissActionsPresentation;
}

- (void)setForceDismissActionsPresentation:(BOOL)a3
{
  self->_forceDismissActionsPresentation = a3;
}

- (BOOL)isObtainingEditsFromServiceBeforeDismissing
{
  return self->_isObtainingEditsFromServiceBeforeDismissing;
}

- (void)setIsObtainingEditsFromServiceBeforeDismissing:(BOOL)a3
{
  self->_isObtainingEditsFromServiceBeforeDismissing = a3;
}

- (unint64_t)quickLookVisibility
{
  return self->_quickLookVisibility;
}

- (unint64_t)appearanceActions
{
  return self->_appearanceActions;
}

- (BOOL)isContentManaged
{
  return self->_isContentManaged;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (BOOL)useCustomActionButton
{
  return self->_useCustomActionButton;
}

- (BOOL)alwaysDisplayPreviewItemTitle
{
  return self->_alwaysDisplayPreviewItemTitle;
}

- (void)setAlwaysDisplayPreviewItemTitle:(BOOL)a3
{
  self->_alwaysDisplayPreviewItemTitle = a3;
}

- (BOOL)showActionAsDefaultButton
{
  return self->_showActionAsDefaultButton;
}

- (BOOL)forceModalPresentation
{
  return self->_forceModalPresentation;
}

- (void)setForceModalPresentation:(BOOL)a3
{
  self->_forceModalPresentation = a3;
}

- (NSArray)additionalLeftBarButtonItems
{
  return self->_additionalLeftBarButtonItems;
}

- (NSArray)additionalRightBarButtonItems
{
  return self->_additionalRightBarButtonItems;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (void)setPresentationStyle:(unint64_t)a3
{
  self->_presentationStyle = a3;
}

- (UIColor)toolbarTintColor
{
  return self->_toolbarTintColor;
}

- (UIColor)navigationBarTintColor
{
  return self->_navigationBarTintColor;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIColor)fullscreenBackgroundColor
{
  return self->_fullscreenBackgroundColor;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (unint64_t)forcedSupportedInterfaceOrientations
{
  return self->_forcedSupportedInterfaceOrientations;
}

- (void)setForcedSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_forcedSupportedInterfaceOrientations = a3;
}

- (NSString)overrideParentApplicationDisplayIdentifier
{
  return self->_overrideParentApplicationDisplayIdentifier;
}

- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_additionalLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_currentAnimator, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_pinchRotationTracker, 0);
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_rotationGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_slideGesture, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
  objc_storeStrong((id *)&self->_currentTitleFromItemViewController, 0);
  objc_storeStrong((id *)&self->_originalRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_originalLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_accessedUrlForSharingController, 0);
  objc_storeStrong(&self->_shareSheetDismissCompletion, 0);
  objc_storeStrong((id *)&self->_shareSheetPopoverTracker, 0);
  objc_storeStrong((id *)&self->_sharingInteractionController, 0);
  objc_storeStrong((id *)&self->_customURLSharingProxyDelegate, 0);
  objc_storeStrong((id *)&self->_currentItemProvider, 0);
  objc_storeStrong((id *)&self->_previewItemStore, 0);
  objc_storeStrong((id *)&self->_toolbarController, 0);
  objc_storeStrong((id *)&self->_internalNavigationController, 0);
  objc_storeStrong((id *)&self->_previousNavigationVCState, 0);
  objc_storeStrong((id *)&self->_excludedToolbarButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_previewToolbarButtons, 0);
  objc_storeStrong((id *)&self->_previewCollection, 0);
  objc_storeStrong((id *)&self->_transitionSourceView, 0);
  objc_storeStrong((id *)&self->_previewKeyCommands, 0);
  objc_storeStrong((id *)&self->_printer, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemsWithEditsInMemory, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_destroyWeak((id *)&self->_modalRootViewController);
  objc_storeStrong((id *)&self->_toolbarGradientView, 0);
  objc_storeStrong((id *)&self->_navigationBarGradientView, 0);
  objc_storeStrong((id *)&self->_toolbarTintColor, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
  objc_storeStrong((id *)&self->_fullscreenBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_lastCrashTimeStamp, 0);
  objc_storeStrong((id *)&self->_noDataView, 0);
  objc_storeStrong((id *)&self->_loadingTextForMissingFiles, 0);
  objc_storeStrong((id *)&self->_previewCollectionReadyCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_multiTapDebugGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_listButton, 0);

  objc_storeStrong((id *)&self->_actionButton, 0);
}

- (BOOL)_isInPickMode
{
  uint64_t v2 = [(QLPreviewController *)self _existingPresentationControllerImmediate:1 effective:1];
  NSInteger v3 = v2;
  if (v2) {
    BOOL v4 = [v2 presentationStyle] == 20;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (unint64_t)_computePresentationMode
{
  if ([(QLPreviewController *)self _isInPickMode]) {
    return 4;
  }
  if ([(QLPreviewController *)self parentIsNavigationController]) {
    return 1;
  }
  if ([(QLPreviewController *)self forceModalPresentation]) {
    return 2;
  }
  uint64_t v4 = [(QLPreviewController *)self presentingViewController];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(QLPreviewController *)self parentViewController];

    if (!v6) {
      return 2;
    }
  }
  return 3;
}

- (NSSet)_pdfItemAllowedOutputClasses
{
  uint64_t v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

- (void)didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v6 = a4;
  id v9 = a5;
  id v7 = v9;
  id v8 = v6;
  QLRunInMainThread();
}

uint64_t __93__QLPreviewController_Editing__didEditCopyOfPreviewItemAtIndex_editedCopy_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEditCopyOfPreviewItemAtIndex:*(void *)(a1 + 56) editedCopy:*(void *)(a1 + 40) synchronously:0 completionHandler:*(void *)(a1 + 48)];
}

- (void)didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThread();
}

uint64_t __75__QLPreviewController_Editing__didEditCopyOfPreviewItemAtIndex_editedCopy___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didEditCopyOfPreviewItemAtIndex:*(void *)(a1 + 48) editedCopy:*(void *)(a1 + 40) synchronously:1 completionHandler:0];
}

- (void)_didEditCopyOfPreviewItemAtIndex:(unint64_t)a3 editedCopy:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x263EF8340];
  char v10 = (QLPreviewController *)a4;
  id v11 = (void (**)(void))a6;
  if (v10
    && ([(QLPreviewController *)v10 url], BOOL v12 = objc_claimAutoreleasedReturnValue(),
                                                v12,
                                                v12))
  {
    char v13 = [(QLPreviewController *)self previewItemAtIndex:a3];
    NSInteger v14 = [(QLPreviewController *)self currentPreviewItemIndex];
    id v15 = (NSObject **)MEMORY[0x263F62940];
    if (v14 != a3)
    {
      NSInteger v16 = v14;
      char v17 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        char v17 = *v15;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGRect buf = 138413058;
        __int16 v36 = v13;
        __int16 v37 = 2048;
        unint64_t v38 = a3;
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v10;
        __int16 v41 = 2048;
        NSInteger v42 = v16;
        _os_log_impl(&dword_217F61000, v17, OS_LOG_TYPE_INFO, "The item (%@) at index n°%lu is about to be updated with an edited copy (%@) but it's not currently previewed. Current preview item index is %lu. #PreviewController", buf, 0x2Au);
      }
    }
    __int16 v18 = [(QLPreviewController *)v13 lastSavedEditedCopy];
    int v19 = [(QLPreviewController *)v10 isEqual:v18];

    __int16 v20 = *v15;
    if (v19)
    {
      if (!v20)
      {
        QLSInitLogging();
        __int16 v20 = *v15;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGRect buf = 138412546;
        __int16 v36 = v10;
        __int16 v37 = 2048;
        unint64_t v38 = a3;
        _os_log_impl(&dword_217F61000, v20, OS_LOG_TYPE_INFO, "Not saving changes for edited copy %@ of item at index %lu because this version has already been forwarded to the delegate. #PreviewController", buf, 0x16u);
      }
      if (v11) {
        v11[2](v11);
      }
    }
    else
    {
      if (!v20)
      {
        QLSInitLogging();
        __int16 v20 = *v15;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGRect buf = 138412802;
        __int16 v36 = v10;
        __int16 v37 = 2112;
        unint64_t v38 = (unint64_t)v13;
        __int16 v39 = 2048;
        unint64_t v40 = a3;
        _os_log_impl(&dword_217F61000, v20, OS_LOG_TYPE_INFO, "About to save edited copy (%@) over item (%@) at index %lu #PreviewController", buf, 0x20u);
      }
      [(QLPreviewController *)v13 setEditedCopy:v10];
      [(QLPreviewController *)v13 setLastSavedEditedCopy:v10];
      double v23 = *v15;
      if (!*v15)
      {
        QLSInitLogging();
        double v23 = *v15;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGRect buf = 138412802;
        __int16 v36 = self;
        __int16 v37 = 2112;
        unint64_t v38 = (unint64_t)v13;
        __int16 v39 = 2112;
        unint64_t v40 = (unint64_t)v10;
        _os_log_impl(&dword_217F61000, v23, OS_LOG_TYPE_INFO, "Preview controller: %@ is handling updated item: %@, with updated copy: %@. #PreviewController", buf, 0x20u);
      }
      double v24 = [(QLPreviewController *)v10 url];
      char v25 = [v24 startAccessingSecurityScopedResource];

      long long v26 = [(QLPreviewController *)v10 containerURL];
      char v27 = [v26 startAccessingSecurityScopedResource];

      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __108__QLPreviewController_Editing___didEditCopyOfPreviewItemAtIndex_editedCopy_synchronously_completionHandler___block_invoke;
      aBlock[3] = &unk_2642F66F0;
      char v33 = v25;
      long long v28 = v10;
      long long v31 = v28;
      char v34 = v27;
      long long v32 = v11;
      long long v29 = _Block_copy(aBlock);
      if ([(QLPreviewController *)v13 editingMode]) {
        [(QLPreviewController *)self _handleEditedPreviewItem:v13 editedCopy:v28 synchronously:v7 completionHandler:v29];
      }
      else {
        [(QLPreviewController *)self _updatePreviewItem:v13 editedCopy:v28 completionHandler:v29];
      }
    }
  }
  else
  {
    int64_t v21 = (NSObject **)MEMORY[0x263F62940];
    char v22 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      char v22 = *v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)CGRect buf = 138412546;
      __int16 v36 = v10;
      __int16 v37 = 2048;
      unint64_t v38 = a3;
      _os_log_impl(&dword_217F61000, v22, OS_LOG_TYPE_INFO, "Did not receive a valid edited copy (%@) when trying to save edits made to preview item at index: %lu #PreviewController", buf, 0x16u);
    }
    if (v11) {
      v11[2](v11);
    }
  }
}

uint64_t __108__QLPreviewController_Editing___didEditCopyOfPreviewItemAtIndex_editedCopy_synchronously_completionHandler___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = [*(id *)(a1 + 32) url];
    [v2 stopAccessingSecurityScopedResource];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    uint64_t v3 = [*(id *)(a1 + 32) containerURL];
    [v3 stopAccessingSecurityScopedResource];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_updatePreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(void))a5;
  id v11 = [(QLPreviewController *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0
    && ([(QLPreviewController *)self delegate],
        char v13 = objc_claimAutoreleasedReturnValue(),
        [v8 originalPreviewItem],
        NSInteger v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v13 previewController:self shouldSaveEditedItem:v14],
        v14,
        v13,
        (v15 & 1) != 0))
  {
    NSInteger v16 = [(QLPreviewController *)self delegate];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      __int16 v18 = [(QLPreviewController *)self delegate];
      int v19 = [v8 originalPreviewItem];
      [v18 previewController:self willSaveEditedItem:v19];
    }
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __80__QLPreviewController_Editing___updatePreviewItem_editedCopy_completionHandler___block_invoke;
    v28[3] = &unk_2642F6740;
    id v29 = v8;
    long long v30 = self;
    long long v32 = v10;
    id v31 = v9;
    [v29 prepareSaveURL:v28];
  }
  else
  {
    __int16 v20 = [(QLPreviewController *)self delegate];
    char v21 = objc_opt_respondsToSelector();

    char v22 = (NSObject **)MEMORY[0x263F62940];
    if (v21)
    {
      double v23 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        double v23 = *v22;
      }
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGRect buf = 138412290;
        char v34 = self;
        _os_log_impl(&dword_217F61000, v23, OS_LOG_TYPE_INFO, "Preview controller: %@ has notified delegate about the updated contents URL. #PreviewController", buf, 0xCu);
      }
      double v24 = [(QLPreviewController *)self delegate];
      char v25 = [v9 url];
      long long v26 = [v8 originalPreviewItem];
      [v24 previewController:self updatedContentsURL:v25 forEditedItem:v26];
    }
    if (v10)
    {
      char v27 = *v22;
      if (!*v22)
      {
        QLSInitLogging();
        char v27 = *v22;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGRect buf = 138412290;
        char v34 = self;
        _os_log_impl(&dword_217F61000, v27, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
      }
      v10[2](v10);
    }
  }
}

void __80__QLPreviewController_Editing___updatePreviewItem_editedCopy_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) saveURL];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) saveURL];
    char v4 = [v3 startAccessingSecurityScopedResource];

    id v5 = (void *)MEMORY[0x263F08820];
    id v6 = [*(id *)(a1 + 32) saveURL];
    BOOL v7 = [v5 writingIntentWithURL:v6 options:2];

    id v8 = objc_opt_new();
    char v25 = v7;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    char v10 = objc_opt_new();
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__QLPreviewController_Editing___updatePreviewItem_editedCopy_completionHandler___block_invoke_8;
    v18[3] = &unk_2642F6718;
    id v19 = v7;
    id v20 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 40);
    id v21 = v11;
    uint64_t v22 = v12;
    id v23 = *(id *)(a1 + 56);
    char v24 = v4;
    id v13 = v7;
    [v8 coordinateAccessWithIntents:v9 queue:v10 byAccessor:v18];
  }
  else
  {
    NSInteger v14 = (NSObject **)MEMORY[0x263F62940];
    char v15 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      char v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 40);
      *(_DWORD *)CGRect buf = 138412290;
      uint64_t v27 = v16;
      _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_ERROR, "Preview controller: %@ has no saveURL, aborting. #PreviewController", buf, 0xCu);
    }
    uint64_t v17 = *(void *)(a1 + 56);
    if (v17) {
      (*(void (**)(void))(v17 + 16))();
    }
  }
}

void __80__QLPreviewController_Editing___updatePreviewItem_editedCopy_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = (NSObject **)MEMORY[0x263F62940];
  if (v3) {
    goto LABEL_3;
  }
  id v5 = [*(id *)(a1 + 32) URL];
  id v6 = objc_alloc_init(MEMORY[0x263F08850]);
  BOOL v7 = [*(id *)(a1 + 40) url];
  id v18 = 0;
  uint64_t v8 = [v6 replaceItemAtURL:v5 withItemAtURL:v7 backupItemName:0 options:0 resultingItemURL:0 error:&v18];
  id v3 = v18;

  [*(id *)(a1 + 48) setOriginalContentWasUpdated:v8];
  if (v3)
  {
LABEL_3:
    id v9 = *v4;
    if (!*v4)
    {
      QLSInitLogging();
      id v9 = *v4;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CGRect buf = 138412290;
      id v20 = v3;
      _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_ERROR, "Error while attempting to write to the updated file: %@ #PreviewController", buf, 0xCu);
    }
    char v10 = [*(id *)(a1 + 56) delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 56) delegate];
      uint64_t v13 = *(void *)(a1 + 56);
      NSInteger v14 = [*(id *)(a1 + 48) originalPreviewItem];
      [v12 previewController:v13 didFailToSaveEditedItem:v14 withError:v3];
    }
  }
  if (*(void *)(a1 + 64))
  {
    char v15 = *v4;
    if (!*v4)
    {
      QLSInitLogging();
      char v15 = *v4;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void **)(a1 + 56);
      *(_DWORD *)CGRect buf = 138412290;
      id v20 = v16;
      _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v17 = [*(id *)(a1 + 48) saveURL];
    [v17 stopAccessingSecurityScopedResource];
  }
}

- (void)_handleEditedPreviewItem:(id)a3 editedCopy:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = (void (**)(void))a6;
  uint64_t v13 = [v10 editingMode];
  NSInteger v14 = [v11 url];
  id v34 = 0;
  uint64_t v15 = *MEMORY[0x263EFF608];
  id v33 = 0;
  char v16 = [v14 getResourceValue:&v34 forKey:v15 error:&v33];
  id v17 = v34;
  id v18 = (QLPreviewController *)v33;

  if ((v16 & 1) == 0)
  {
    id v19 = (NSObject **)MEMORY[0x263F62940];
    id v20 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CGRect buf = 138412290;
      __int16 v36 = v18;
      _os_log_impl(&dword_217F61000, v20, OS_LOG_TYPE_ERROR, "The content type of the edited copy could not be determined: %@ #PreviewController", buf, 0xCu);
    }
  }
  uint64_t v21 = [v10 previewItemContentType];

  if (v21)
  {
    uint64_t v22 = (void *)MEMORY[0x263F1D920];
    id v23 = [v10 previewItemContentType];
    uint64_t v21 = [v22 typeWithIdentifier:v23];

    int v24 = 0;
    if (v11 && v21) {
      int v24 = [v21 isEqual:v17];
    }
  }
  else
  {
    int v24 = 0;
  }
  if (v13 == 2 || !v24 && (v13 & 1) != 0)
  {
    char v25 = [(QLPreviewController *)self delegate];
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      uint64_t v27 = [(QLPreviewController *)self delegate];
      uint64_t v28 = [v10 originalPreviewItem];
      id v29 = [v11 url];
      [v27 previewController:self didSaveEditedCopyOfPreviewItem:v28 atURL:v29];
    }
    if (v12)
    {
      long long v30 = (NSObject **)MEMORY[0x263F62940];
      id v31 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v31 = *v30;
      }
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      *(_DWORD *)CGRect buf = 138412290;
      __int16 v36 = self;
LABEL_21:
      _os_log_impl(&dword_217F61000, v31, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
LABEL_22:
      v12[2](v12);
    }
  }
  else
  {
    if (v13 != 1 && v13 != 3)
    {
      if (!v12) {
        goto LABEL_23;
      }
      long long v32 = (NSObject **)MEMORY[0x263F62940];
      id v31 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v31 = *v32;
      }
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_INFO)) {
        goto LABEL_22;
      }
      *(_DWORD *)CGRect buf = 138412290;
      __int16 v36 = self;
      goto LABEL_21;
    }
    if (v7) {
      [(QLPreviewController *)self _synchronouslyUpdateContentsOfPreviewItem:v10 editedCopy:v11 completionHandler:v12];
    }
    else {
      [(QLPreviewController *)self _asynchronouslyUpdateContentsOfPreviewItem:v10 editedCopy:v11 completionHandler:v12];
    }
  }
LABEL_23:
}

- (void)_synchronouslyUpdateContentsOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  id v11 = [v8 saveURL];
  if (v11)
  {
    uint64_t v12 = [(QLPreviewController *)self delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      NSInteger v14 = [(QLPreviewController *)self delegate];
      uint64_t v15 = [v8 originalPreviewItem];
      [v14 previewController:self willSaveEditedItem:v15];
    }
    int v16 = [v11 startAccessingSecurityScopedResource];
    uint64_t v43 = 0;
    double v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    *(void *)&long long v51 = 0;
    *((void *)&v51 + 1) = &v51;
    uint64_t v52 = 0x3032000000;
    id v53 = __Block_byref_object_copy__7;
    id v54 = __Block_byref_object_dispose__7;
    id v55 = 0;
    id v17 = objc_opt_new();
    id v18 = (id *)(*((void *)&v51 + 1) + 40);
    id obj = *(id *)(*((void *)&v51 + 1) + 40);
    uint64_t v35 = MEMORY[0x263EF8330];
    uint64_t v36 = 3221225472;
    uint64_t v37 = __103__QLPreviewController_Editing___synchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke;
    unint64_t v38 = &unk_2642F6768;
    id v39 = v9;
    unint64_t v40 = &v51;
    __int16 v41 = &v43;
    [v17 coordinateWritingItemAtURL:v11 options:2 error:&obj byAccessor:&v35];
    objc_storeStrong(v18, obj);

    objc_msgSend(v8, "setOriginalContentWasUpdated:", *((unsigned __int8 *)v44 + 24), v35, v36, v37, v38);
    if (*((unsigned char *)v44 + 24) && !*(void *)(*((void *)&v51 + 1) + 40))
    {
      uint64_t v28 = (NSObject **)MEMORY[0x263F62940];
      id v29 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v29 = *v28;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGRect buf = 138412546;
        id v48 = self;
        __int16 v49 = 2112;
        id v50 = v8;
        _os_log_impl(&dword_217F61000, v29, OS_LOG_TYPE_INFO, "Preview controller: %@ didUpdateContentsOfPreviewItem:%@. #PreviewController", buf, 0x16u);
      }
      long long v30 = [(QLPreviewController *)self delegate];
      char v31 = objc_opt_respondsToSelector();

      if ((v31 & 1) == 0) {
        goto LABEL_25;
      }
      int v24 = [(QLPreviewController *)self delegate];
      char v25 = [v8 originalPreviewItem];
      [v24 previewController:self didUpdateContentsOfPreviewItem:v25];
    }
    else
    {
      id v19 = (NSObject **)MEMORY[0x263F62940];
      id v20 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v20 = *v19;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(QLPreviewController **)(*((void *)&v51 + 1) + 40);
        *(_DWORD *)CGRect buf = 138412290;
        id v48 = v21;
        _os_log_impl(&dword_217F61000, v20, OS_LOG_TYPE_ERROR, "Error while attempting to write to the updated file: %@ #PreviewController", buf, 0xCu);
      }
      uint64_t v22 = [(QLPreviewController *)self delegate];
      char v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) == 0) {
        goto LABEL_25;
      }
      int v24 = [(QLPreviewController *)self delegate];
      char v25 = [v8 originalPreviewItem];
      [v24 previewController:self didFailToSaveEditedItem:v25 withError:*(void *)(*((void *)&v51 + 1) + 40)];
    }

LABEL_25:
    if (v10)
    {
      long long v32 = (NSObject **)MEMORY[0x263F62940];
      id v33 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v33 = *v32;
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CGRect buf = 138412290;
        id v48 = self;
        _os_log_impl(&dword_217F61000, v33, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
      }
      v10[2](v10);
    }
    if (v16)
    {
      id v34 = [v8 saveURL];
      [v34 stopAccessingSecurityScopedResource];
    }
    _Block_object_dispose(&v51, 8);

    _Block_object_dispose(&v43, 8);
    goto LABEL_34;
  }
  if (v10)
  {
    char v26 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v27 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v27 = *v26;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LODWORD(v51) = 138412290;
      *(void *)((char *)&v51 + 4) = self;
      _os_log_impl(&dword_217F61000, v27, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item, because could not obtain URL to save the edited version of the preview. #PreviewController", (uint8_t *)&v51, 0xCu);
    }
    v10[2](v10);
  }
LABEL_34:
}

void __103__QLPreviewController_Editing___synchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x263F08850];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [*(id *)(a1 + 32) url];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v7 + 40);
  int v8 = [v5 replaceItemAtURL:v4 withItemAtURL:v6 backupItemName:0 options:0 resultingItemURL:0 error:&obj];

  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)_asynchronouslyUpdateContentsOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __104__QLPreviewController_Editing___asynchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke;
  v14[3] = &unk_2642F6790;
  id v15 = v8;
  int v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = v10;
  id v13 = v8;
  [v13 prepareSaveURL:v14];
}

void __104__QLPreviewController_Editing___asynchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke(id *a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1[4] saveURL];

  if (v2)
  {
    id v3 = [a1[5] delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [a1[5] delegate];
      id v6 = a1[5];
      uint64_t v7 = [a1[4] originalPreviewItem];
      [v5 previewController:v6 willSaveEditedItem:v7];
    }
    id v8 = [a1[4] saveURL];
    char v9 = [v8 startAccessingSecurityScopedResource];

    id v10 = (void *)MEMORY[0x263F08820];
    id v11 = [a1[4] saveURL];
    id v12 = [v10 writingIntentWithURL:v11 options:2];

    id v13 = objc_opt_new();
    id v29 = v12;
    NSInteger v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    id v15 = objc_opt_new();
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __104__QLPreviewController_Editing___asynchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke_19;
    v22[3] = &unk_2642F6718;
    id v23 = v12;
    id v24 = a1[6];
    id v16 = a1[4];
    id v17 = a1[5];
    id v25 = v16;
    id v26 = v17;
    id v27 = a1[7];
    char v28 = v9;
    id v18 = v12;
    [v13 coordinateAccessWithIntents:v14 queue:v15 byAccessor:v22];
  }
  else if (a1[7])
  {
    id v19 = (NSObject **)MEMORY[0x263F62940];
    id v20 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = a1[5];
      *(_DWORD *)CGRect buf = 138412290;
      id v31 = v21;
      _os_log_impl(&dword_217F61000, v20, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item, because could not obtain URL to save the edited version of the preview. #PreviewController", buf, 0xCu);
    }
    (*((void (**)(void))a1[7] + 2))();
  }
}

void __104__QLPreviewController_Editing___asynchronouslyUpdateContentsOfPreviewItem_editedCopy_completionHandler___block_invoke_19(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) URL];
  id v5 = (void *)v4;
  if (!v3 && v4)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08850]);
    uint64_t v7 = [*(id *)(a1 + 40) url];
    id v25 = 0;
    uint64_t v8 = [v6 replaceItemAtURL:v5 withItemAtURL:v7 backupItemName:0 options:0 resultingItemURL:0 error:&v25];
    id v3 = v25;

    [*(id *)(a1 + 48) setOriginalContentWasUpdated:v8];
  }
  char v9 = (NSObject **)MEMORY[0x263F62940];
  id v10 = *MEMORY[0x263F62940];
  if (v5) {
    BOOL v11 = v3 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    if (!v10)
    {
      QLSInitLogging();
      id v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v18 = *(void **)(a1 + 48);
      id v17 = *(void **)(a1 + 56);
      *(_DWORD *)CGRect buf = 138412546;
      id v27 = v17;
      __int16 v28 = 2112;
      id v29 = v18;
      _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_INFO, "Preview controller: %@ didUpdateContentsOfPreviewItem:%@. #PreviewController", buf, 0x16u);
    }
    id v19 = [*(id *)(a1 + 56) delegate];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      NSInteger v14 = [*(id *)(a1 + 56) delegate];
      uint64_t v21 = *(void *)(a1 + 56);
      id v16 = [*(id *)(a1 + 48) originalPreviewItem];
      [v14 previewController:v21 didUpdateContentsOfPreviewItem:v16];
      goto LABEL_20;
    }
  }
  else
  {
    if (!v10)
    {
      QLSInitLogging();
      id v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CGRect buf = 138412546;
      id v27 = v5;
      __int16 v28 = 2112;
      id v29 = v3;
      _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "Error while attempting to write to the updated file: %@ %@ #PreviewController", buf, 0x16u);
    }
    id v12 = [*(id *)(a1 + 56) delegate];
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      NSInteger v14 = [*(id *)(a1 + 56) delegate];
      uint64_t v15 = *(void *)(a1 + 56);
      id v16 = [*(id *)(a1 + 48) originalPreviewItem];
      [v14 previewController:v15 didFailToSaveEditedItem:v16 withError:v3];
LABEL_20:
    }
  }
  if (*(void *)(a1 + 64))
  {
    uint64_t v22 = *v9;
    if (!*v9)
    {
      QLSInitLogging();
      uint64_t v22 = *v9;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = *(void **)(a1 + 56);
      *(_DWORD *)CGRect buf = 138412290;
      id v27 = v23;
      _os_log_impl(&dword_217F61000, v22, OS_LOG_TYPE_INFO, "Preview controller: %@ has finished handling updated item. #PreviewController", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  if (*(unsigned char *)(a1 + 72))
  {
    id v24 = [*(id *)(a1 + 48) saveURL];
    [v24 stopAccessingSecurityScopedResource];
  }
}

- (void)shareableURLForCurrentPreviewItem:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewController *)self internalCurrentPreviewItem];
  NSInteger v6 = [(QLPreviewController *)self currentPreviewItemIndex];
  if (!v5 || v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    id v16 = __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke;
    id v17 = &unk_2642F5F28;
    uint64_t v7 = &v18;
    id v18 = v4;
    id v9 = v4;
    QLRunInMainThread();
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_2;
    v10[3] = &unk_2642F67B8;
    NSInteger v13 = v6;
    uint64_t v7 = &v11;
    id v11 = v5;
    id v12 = v4;
    id v8 = v4;
    [(QLPreviewController *)self obtainAndUpdateEditedCopyOfCurrentPreviewItem:v10];
  }
}

uint64_t __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 48) == a2)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_3;
    v6[3] = &unk_2642F56A8;
    id v3 = &v8;
    id v4 = *(void **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    [v4 prepareShareableURL:v6];
  }
  else
  {
    id v3 = &v5;
    id v5 = *(id *)(a1 + 40);
    QLRunInMainThread();
  }
}

void __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_3(uint64_t a1)
{
  id v3 = *(id *)(a1 + 40);
  id v2 = *(id *)(a1 + 32);
  QLRunInMainThread();
}

void __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) shareableURL];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t __66__QLPreviewController_Editing__shareableURLForCurrentPreviewItem___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)obtainAndUpdateEditedCopyOfCurrentPreviewItem:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __78__QLPreviewController_Editing__obtainAndUpdateEditedCopyOfCurrentPreviewItem___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalCurrentPreviewItem];
  if ([v2 canBeEdited] && objc_msgSend(v2, "editedFileBehavior")
    || [v2 editingMode])
  {
    id v3 = [*(id *)(a1 + 32) previewCollection];
    if (v3)
    {
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __78__QLPreviewController_Editing__obtainAndUpdateEditedCopyOfCurrentPreviewItem___block_invoke_2;
      v5[3] = &unk_2642F67E0;
      id v4 = *(void **)(a1 + 40);
      void v5[4] = *(void *)(a1 + 32);
      id v6 = v4;
      [v3 saveCurrentPreviewEditsSynchronously:0 withCompletionHandler:v5];
    }
    else
    {
      (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) currentPreviewItemIndex], 0);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), [*(id *)(a1 + 32) currentPreviewItemIndex], 0);
  }
}

void __78__QLPreviewController_Editing__obtainAndUpdateEditedCopyOfCurrentPreviewItem___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = *(id *)(a1 + 40);
  id v5 = v4;
  QLRunInMainThread();
}

void __78__QLPreviewController_Editing__obtainAndUpdateEditedCopyOfCurrentPreviewItem___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) previewItemAtIndex:*(void *)(a1 + 56)];
  id v6 = v2;
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v2, "setEditedCopy:");
    id v2 = v6;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = [v2 editedCopy];
  (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v3, v5);
}

- (void)presentSaveToFilesForEditedItems:(id)a3
{
  id v5 = [a3 valueForKey:@"editedFileURL"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F82698]) initForExportingURLs:v5 asCopy:1];
  [v4 setDelegate:self];
  [(QLPreviewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
}

- (void)updateOverlayAnimated:(BOOL)a3 forceRefresh:(BOOL)a4
{
}

- (void)updateOverlayAnimated:(BOOL)a3 forceRefresh:(BOOL)a4 withTraitCollection:(id)a5
{
}

- (void)updateOverlayAnimated:(BOOL)a3 animatedButtons:(BOOL)a4 forceRefresh:(BOOL)a5 withTraitCollection:(id)a6
{
  BOOL v6 = a3;
  id v8 = a6;
  if ([(QLPreviewController *)self overlayFrozen]
    || ![(QLPreviewController *)self isTopPreviewController])
  {
    goto LABEL_26;
  }
  if (!v8)
  {
    id v8 = [(QLPreviewController *)self traitCollection];
  }
  id v34 = 0;
  [(QLPreviewController *)self _updateOverlayButtonsIfNeededWithTraitCollection:v8 animated:v6 updatedToolbarButtons:&v34];
  id v9 = v34;
  id v10 = [(QLPreviewController *)self internalNavigationController];
  id v11 = [v10 view];
  [v11 frame];
  double v13 = v12;
  double v15 = v14;
  double v16 = *MEMORY[0x263F001B0];
  double v17 = *(double *)(MEMORY[0x263F001B0] + 8);

  if (v13 != v16 || v15 != v17)
  {
    id v19 = [(QLPreviewController *)self internalNavigationController];
    char v20 = [v19 view];
    [v20 setNeedsLayout];

    uint64_t v21 = [(QLPreviewController *)self internalNavigationController];
    uint64_t v22 = [v21 view];
    [v22 layoutIfNeeded];
  }
  [(QLPreviewController *)self updateStatusBarAnimated:v6];
  [(QLPreviewController *)self _updateBarTintColors];
  BOOL v23 = ![(QLPreviewController *)self _isToolbarVisibleForTraitCollection:v8]
     || [(QLPreviewController *)self fullScreen]
     || ![(QLPreviewController *)self canShowToolbar]
     || [v9 count] == 0;
  if ([(QLPreviewController *)self fullScreen]) {
    char v24 = 1;
  }
  else {
    char v24 = ![(QLPreviewController *)self canShowNavBar];
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke;
  aBlock[3] = &unk_2642F6D40;
  void aBlock[4] = self;
  char v31 = v24;
  BOOL v32 = v6;
  BOOL v33 = v23;
  id v25 = (void (**)(void))_Block_copy(aBlock);
  id v26 = [(QLPreviewController *)self toolbarController];
  if (![v26 isHidden]) {
    goto LABEL_21;
  }
  BOOL v27 = [(QLPreviewController *)self fullScreen];

  if (!v27)
  {
    id v26 = [(QLPreviewController *)self toolbarController];
    [v26 setToolbarAlpha:1.0];
LABEL_21:
  }
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke_3;
  v29[3] = &unk_2642F5458;
  v29[4] = self;
  __int16 v28 = (void (**)(void *, uint64_t))_Block_copy(v29);
  if (v6)
  {
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v25 options:v28 animations:0.2 completion:0.0];
  }
  else
  {
    v25[2](v25);
    v28[2](v28, 1);
  }
  [(QLPreviewController *)self updateNavigationTitle];
  [(QLPreviewController *)self _updateAppearance:v6];

LABEL_26:
}

void __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) internalNavigationController];
  [v2 setNavigationBarHidden:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41)];

  uint64_t v3 = [*(id *)(a1 + 32) internalNavigationController];
  [v3 setToolbarHidden:*(unsigned __int8 *)(a1 + 42) animated:*(unsigned __int8 *)(a1 + 41)];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke_2;
  v28[3] = &unk_2642F5430;
  void v28[4] = *(void *)(a1 + 32);
  [MEMORY[0x263F82E00] performWithoutAnimation:v28];
  if (([*(id *)(a1 + 32) fullScreen] & 1) != 0
    || ![*(id *)(a1 + 32) hasItemsToPreview])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) canShowToolbar] ^ 1;
  }
  int v5 = *(unsigned __int8 *)(a1 + 42);
  if (*(unsigned char *)(a1 + 41))
  {
    BOOL v6 = [*(id *)(a1 + 32) toolbarController];
    int v7 = [v6 isHidden];

    if (v4 != v7)
    {
      id v8 = [*(id *)(a1 + 32) toolbarController];
      id v9 = [v8 originalToolbar];
      [v9 _removeAllAnimations:1];

      id v10 = [*(id *)(a1 + 32) toolbarController];
      id v11 = [v10 originalToolbar];
      double v12 = [v11 layer];
      double v13 = [v12 presentationLayer];
      [v13 frame];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      uint64_t v22 = [*(id *)(a1 + 32) toolbarController];
      BOOL v23 = [v22 originalToolbar];
      objc_msgSend(v23, "setFrame:", v15, v17, v19, v21);
    }
  }
  if (v5) {
    uint64_t v24 = v4 ^ 1;
  }
  else {
    uint64_t v24 = 0;
  }
  id v25 = [*(id *)(a1 + 32) toolbarController];
  [v25 setHidden:v4];

  id v26 = [*(id *)(a1 + 32) toolbarController];
  [v26 setOriginalToolbarHidden:v24];

  BOOL v27 = [*(id *)(a1 + 32) toolbarController];
  [v27 updateLayout];
}

void __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) toolbarController];
  [v1 updateLayout];
}

void __103__QLPreviewController_Overlay__updateOverlayAnimated_animatedButtons_forceRefresh_withTraitCollection___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) toolbarController];
  if ([v2 isHidden]) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  uint64_t v4 = [*(id *)(a1 + 32) toolbarController];
  [v4 setToolbarAlpha:v3];

  id v7 = [*(id *)(a1 + 32) toolbarController];
  if ([v7 isHidden]) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  BOOL v6 = [*(id *)(a1 + 32) toolbarController];
  [v6 setOriginalToolbarAlpha:v5];
}

- (void)_updateOverlayButtonsIfNeededWithTraitCollection:(id)a3 animated:(BOOL)a4 updatedToolbarButtons:(id *)a5
{
  BOOL v39 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (!v7)
  {
    id v7 = [(QLPreviewController *)self traitCollection];
  }
  id v8 = [(QLPreviewController *)self _toolBarButtonsWithTraitCollection:v7];
  uint64_t v9 = [(QLPreviewController *)self _navigationBarLeftButtonsWithTraitCollection:v7];
  id v10 = [(QLPreviewController *)self _navigationBarRightButtonsWithTraitCollection:v7];
  unint64_t v11 = [(QLPreviewController *)self _numberOfButtonsExcludingSpacersInButtons:v8 disappearingOnTap:0];
  unint64_t v12 = [(QLPreviewController *)self _numberOfButtonsExcludingSpacersInButtons:v8 disappearingOnTap:1];
  unint64_t v38 = v7;
  if (![v10 count] && v11 <= 1 && v12 <= 1)
  {

    id v10 = v8;
    id v8 = (void *)MEMORY[0x263EFFA68];
  }
  double v13 = [(QLPreviewController *)self _topViewController];
  double v14 = [v13 toolbarItems];
  BOOL v15 = [(QLPreviewController *)self _barButtonItemArray:v8 isEqualToArray:v14];

  double v16 = [(QLPreviewController *)self _topViewController];
  double v17 = [v16 navigationItem];
  double v18 = [v17 leftBarButtonItems];
  __int16 v41 = (void *)v9;
  BOOL v19 = [(QLPreviewController *)self _barButtonItemArray:v9 isEqualToArray:v18];

  double v20 = [(QLPreviewController *)self _topViewController];
  double v21 = [v20 navigationItem];
  uint64_t v22 = [v21 rightBarButtonItems];
  unint64_t v40 = v10;
  BOOL v23 = [(QLPreviewController *)self _barButtonItemArray:v10 isEqualToArray:v22];

  if (!v15 || !v19 || !v23)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v24 = [(QLPreviewController *)self previewToolbarButtons];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v42 + 1) + 8 * i) invalidateCurrentState];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v26);
    }

    id v29 = [(QLPreviewController *)self _topViewController];
    uint64_t v30 = [v29 navigationItem];
    [v30 setLeftItemsSupplementBackButton:1];
  }
  if (!v15)
  {
    char v31 = [(QLPreviewController *)self _topViewController];
    [v31 setToolbarItems:v8 animated:v39];
  }
  if (!v19)
  {
    BOOL v32 = [(QLPreviewController *)self _topViewController];
    BOOL v33 = [v32 navigationItem];
    [v33 setLeftBarButtonItems:v41 animated:v39];
  }
  if (!v23)
  {
    id v34 = [(QLPreviewController *)self _topViewController];
    uint64_t v35 = [v34 navigationItem];
    [v35 setRightBarButtonItems:v40 animated:v39];
  }
  if (!v15 || !v19 || !v23)
  {
    uint64_t v36 = [(QLPreviewController *)self _topViewController];
    uint64_t v37 = [v36 toolbarItems];
    [(QLPreviewController *)self _updateCurrentPopoverButtonIfNeeded:v37];

    [(QLPreviewController *)self _updateNavigationBarBehaviorStyle];
  }
  if (a5) {
    *a5 = v8;
  }
}

- (BOOL)_barButtonItemArray:(id)a3 isEqualToArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  BOOL v8 = 0;
  if (!v5 || !v6) {
    goto LABEL_15;
  }
  uint64_t v9 = [v5 count];
  if (v9 != [v7 count]) {
    goto LABEL_14;
  }
  if (![v5 count])
  {
LABEL_12:
    BOOL v8 = 1;
    goto LABEL_15;
  }
  uint64_t v10 = 0;
  while (1)
  {
    unint64_t v11 = [v5 objectAtIndexedSubscript:v10];
    unint64_t v12 = [v7 objectAtIndexedSubscript:v10];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if (([v11 _qlIsEqual:v12] & 1) == 0) {
      goto LABEL_13;
    }
LABEL_11:

    if (++v10 >= (unint64_t)[v5 count]) {
      goto LABEL_12;
    }
  }
  if ([v11 isEqual:v12]) {
    goto LABEL_11;
  }
LABEL_13:

LABEL_14:
  BOOL v8 = 0;
LABEL_15:

  return v8;
}

- (unint64_t)_numberOfButtonsExcludingSpacersInButtons:(id)a3 disappearingOnTap:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        unint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v4 && [v11 QLType] != 5) {
            ++v8;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v8 += [v11 disappearsOnTap] ^ v4 ^ 1;
          }
          else {
            ++v8;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)updateStatusBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(QLPreviewController *)self presentationMode] != 4
    && ([MEMORY[0x263F086E0] mainBundleRequiresStatusBarHidden] & 1) == 0)
  {
    if ([(QLPreviewController *)self fullScreen]) {
      uint64_t v5 = 0x20000;
    }
    else {
      uint64_t v5 = 0x10000;
    }
    double v6 = 0.0;
    if ([(QLPreviewController *)self preferredStatusBarUpdateAnimation] == 1)
    {
      if (v3)
      {
        uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F82C10]) initWithDefaultParameters];
        [v7 duration];
        double v6 = v8;
      }
    }
    else if (v3)
    {
      if ([(QLPreviewController *)self fullScreen]) {
        double v6 = 0.05;
      }
      else {
        double v6 = 0.18;
      }
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__QLPreviewController_Overlay__updateStatusBarAnimated___block_invoke;
    v9[3] = &unk_2642F5430;
    void v9[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:v5 delay:v9 options:0 animations:v6 completion:0.0];
  }
}

uint64_t __56__QLPreviewController_Overlay__updateStatusBarAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)updateRemoteOverlayIfNeeded
{
  id v6 = [(QLPreviewController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [(QLPreviewController *)self shareSheetPopoverTracker];

    if (v3)
    {
      objc_initWeak(&location, self);
      BOOL v4 = [(QLPreviewController *)self presentedViewController];
      objc_initWeak(&from, v4);

      uint64_t v5 = [(QLPreviewController *)self shareSheetPopoverTracker];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __59__QLPreviewController_Overlay__updateRemoteOverlayIfNeeded__block_invoke;
      v7[3] = &unk_2642F6D90;
      objc_copyWeak(&v8, &location);
      objc_copyWeak(&v9, &from);
      [v5 getFrameWithCompletionBlock:v7];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&v8);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __59__QLPreviewController_Overlay__updateRemoteOverlayIfNeeded__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_copyWeak(&v10, (id *)(a1 + 32));
  objc_copyWeak(v11, (id *)(a1 + 40));
  v11[1] = *(id *)&a2;
  void v11[2] = *(id *)&a3;
  void v11[3] = *(id *)&a4;
  void v11[4] = *(id *)&a5;
  QLRunInMainThread();
  objc_destroyWeak(v11);
  objc_destroyWeak(&v10);
}

void __59__QLPreviewController_Overlay__updateRemoteOverlayIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [WeakRetained presentedViewController];

    if (v4 != v2) {
      goto LABEL_5;
    }
    double v5 = *(double *)(a1 + 48);
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    double v8 = *(double *)(a1 + 72);
    id v9 = [WeakRetained presentedViewController];
    id v10 = [v9 popoverPresentationController];
    objc_msgSend(v10, "setSourceRect:", v5, v6, v7, v8);

    BOOL v3 = [WeakRetained presentedViewController];
    unint64_t v11 = [v3 popoverPresentationController];
    [v11 containerViewWillLayoutSubviews];
  }
LABEL_5:
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  BOOL v3 = [(QLPreviewController *)self internalCurrentPreviewItem];
  int v4 = [v3 shouldOpenInFullScreen];

  if (v4)
  {
    double v5 = [(QLPreviewController *)self currentAnimator];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = [(QLPreviewController *)self canShowNavBar];
  }
  if (v6) {
    return 2;
  }
  else {
    return 1;
  }
}

- (BOOL)prefersStatusBarHidden
{
  BOOL v3 = [(QLPreviewController *)self currentAnimator];
  uint64_t v4 = [v3 transitionContext];
  if (v4)
  {
    double v5 = (void *)v4;
    BOOL v6 = [(QLPreviewController *)self currentAnimator];
    uint64_t v7 = [v6 transitionContext];
    if (!v7)
    {

      goto LABEL_11;
    }
    double v8 = (void *)v7;
    id v9 = [(QLPreviewController *)self currentAnimator];
    id v10 = [v9 transitionContext];
    int v11 = [v10 transitionWasCancelled];

    if (!v11)
    {
LABEL_11:
      long long v14 = [(QLPreviewController *)self currentAnimator];
      uint64_t v15 = [v14 transitionContext];
      long long v13 = [(id)v15 viewControllerForKey:*MEMORY[0x263F83C10]];

      long long v16 = [(QLPreviewController *)self internalCurrentPreviewItem];
      LOBYTE(v15) = [v16 shouldOpenInFullScreen];

      if (v15)
      {
        if (v13 == self
          && [(QLPreviewController *)self fullScreen]
          && [(QLPreviewController *)self quickLookVisibility] == 2)
        {
          goto LABEL_21;
        }
      }
      else
      {
        double v17 = [(QLPreviewController *)self currentAnimator];
        if ([v17 transitionState])
        {
        }
        else
        {
          uint64_t v18 = [(QLPreviewController *)self currentAnimator];
          int v19 = [v18 showing];

          if (v19) {
            goto LABEL_20;
          }
        }
        if ([(QLPreviewController *)self fullScreen])
        {
LABEL_21:
          BOOL v12 = 1;
          goto LABEL_23;
        }
      }
LABEL_20:
      if (![(QLPreviewController *)self previousStatusBarHidden])
      {
        double v20 = [(QLPreviewController *)v13 traitCollection];
        BOOL v12 = [v20 verticalSizeClass] == 1;

        goto LABEL_23;
      }
      goto LABEL_21;
    }
  }
  else
  {
  }
  if (![(QLPreviewController *)self fullScreen]
    || [(QLPreviewController *)self quickLookVisibility] != 2)
  {
    long long v13 = [(QLPreviewController *)self traitCollection];
    BOOL v12 = [(QLPreviewController *)v13 verticalSizeClass] == 1;
LABEL_23:

    return v12;
  }
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  BOOL v3 = [(QLPreviewController *)self internalCurrentPreviewItem];
  if (([v3 shouldOpenInFullScreen] & 1) == 0)
  {

    return 0;
  }
  if ([(QLPreviewController *)self quickLookVisibility] == 2)
  {
    uint64_t v4 = [(QLPreviewController *)self currentAnimator];
    uint64_t v5 = [v4 transitionState];

    if (v5 == 1) {
      return 3;
    }
    return 0;
  }

  return 3;
}

- (id)childViewControllerForStatusBarHidden
{
  BOOL v3 = [(QLPreviewController *)self _topPreviewController];
  uint64_t v4 = v3;
  if (v3 == self) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v3;
  }

  return v5;
}

- (id)_buttonWithAccessibilityIdentifierPointer:(id)a3 inButtons:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__9;
  long long v14 = __Block_byref_object_dispose__9;
  id v15 = 0;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __84__QLPreviewController_Overlay___buttonWithAccessibilityIdentifierPointer_inButtons___block_invoke;
  v9[3] = &unk_2642F6DB8;
  void v9[4] = v5;
  void v9[5] = &v10;
  [v6 enumerateObjectsUsingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __84__QLPreviewController_Overlay___buttonWithAccessibilityIdentifierPointer_inButtons___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 accessibilityIdentifier];
  double v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_updateCurrentPopoverButtonIfNeeded:(id)a3
{
  uint64_t v4 = [(QLPreviewController *)self presentedViewController];

  if (v4)
  {
    id v5 = [(QLPreviewController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [(QLPreviewController *)self _displayedButtonWithAccessibilityIdentifier:@"QLOverlayListButtonAccessibilityIdentifier"];
      if (v8)
      {
        id v7 = [(QLPreviewController *)self presentedViewController];
        [v7 setBarButton:v8];
      }
    }
  }
}

- (void)updateNavigationTitle
{
  id v15 = [(QLPreviewController *)self currentTitleFromItemViewController];
  BOOL v3 = [(QLPreviewController *)self internalCurrentPreviewItem];
  uint64_t v4 = [v3 previewItemTitle];

  if (!v15
    || ([v15 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C8FAD38],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:&stru_26C8FAD38],
        v5,
        v6))
  {
    id v7 = v4;

    id v15 = v7;
  }
  id v8 = v4;
  id v9 = [(QLPreviewController *)self previewCollection];
  [v9 setTitle:v15];

  [(QLPreviewController *)self setTitle:v15];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v8 style:0 target:0 action:0];
  int v11 = [(QLPreviewController *)self previewCollection];
  uint64_t v12 = [v11 navigationItem];
  [v12 setBackBarButtonItem:v10];

  long long v13 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v8 style:0 target:0 action:0];
  long long v14 = [(QLPreviewController *)self navigationItem];
  [v14 setBackBarButtonItem:v13];

  [(QLPreviewController *)self updateTitleMenuAndDocumentProperties];
}

- (BOOL)_canDisplayOpenInButtonForItem:(id)a3
{
  uint64_t v4 = [a3 fetcher];
  char v5 = [v4 isLongFetchOperation];

  LOBYTE(self) = [(QLPreviewController *)self canChangeCurrentPage];
  return +[QLUtilitiesInternal currentAppIsAppleApp] & ~v5 & self;
}

- (BOOL)_shouldDisplayOpenInInChromeIfAvailable
{
  if (_os_feature_enabled_impl())
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    uint64_t v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 == 1)
    {
      int v6 = [(QLPreviewController *)self traitCollection];
      BOOL v3 = ![(QLPreviewController *)self _isToolbarVisibleForTraitCollection:v6];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)_openInButton
{
  BOOL v3 = [(QLPreviewController *)self internalCurrentPreviewItem];
  if ([(QLPreviewController *)self _shouldDisplayOpenInInChromeIfAvailable]
    && [(QLPreviewController *)self _canDisplayOpenInButtonForItem:v3])
  {
    [(QLPreviewController *)self isContentManaged];
    uint64_t v4 = _QLGetOpenInAppClaimBindingForItem(v3);
    if (v4)
    {
      uint64_t v5 = objc_msgSend(MEMORY[0x263F62978], "openInTypeForItem:appIsContentManaged:", v3, -[QLPreviewController isContentManaged](self, "isContentManaged"));
      int v6 = [(QLPreviewController *)self _openInTitleForOpenInType:v5 claimBinding:v4];
      id v7 = [QLBarButtonItem alloc];
      if (v5 == 1)
      {
        id v8 = [(QLBarButtonItem *)v7 initWithTitle:v6 style:0 target:self action:sel__openInButtonTapped_];
        [(QLBarButtonItem *)v8 setQLType:6];
        id v9 = QLOverlayOpenInButtonAccessibilityIdentifier;
      }
      else
      {
        id v8 = [(QLBarButtonItem *)v7 initWithTitle:v6 style:0 target:self action:sel__copyToButtonTapped_];
        [(QLBarButtonItem *)v8 setQLType:7];
        id v9 = QLOverlayCopyToButtonAccessibilityIdentifier;
      }
      [(QLBarButtonItem *)v8 setAccessibilityIdentifier:*v9];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_doneButton
{
  if ([(QLPreviewController *)self showActionAsDefaultButton])
  {
    BOOL v3 = [QLBarButtonItem alloc];
LABEL_4:
    uint64_t v5 = 1;
    goto LABEL_6;
  }
  BOOL v4 = [(QLPreviewController *)self isObtainingEditsFromServiceBeforeDismissing];
  BOOL v3 = [QLBarButtonItem alloc];
  if (v4) {
    goto LABEL_4;
  }
  uint64_t v5 = 0;
LABEL_6:
  int v6 = [(QLBarButtonItem *)v3 initWithBarButtonSystemItem:v5 primaryAction:0];
  [(QLPreviewController *)self _updateDoneButtonMenu:v6];
  [(QLBarButtonItem *)v6 setQLType:1];
  [(QLBarButtonItem *)v6 setAccessibilityIdentifier:@"QLOverlayDoneButtonAccessibilityIdentifier"];

  return v6;
}

- (id)_actionButton
{
  if ([(QLPreviewController *)self useCustomActionButton])
  {
    BOOL v3 = [(QLPreviewController *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      uint64_t v5 = [(QLPreviewController *)self delegate];
      int v6 = [(QLPreviewController *)self currentPreviewItem];
      id v7 = [v5 previewController:self customActionButtonTittleForPreviewItem:v6];

      if (v7)
      {
        [(QLPreviewController *)self showActionAsDefaultButton];
        id v8 = [[QLBarButtonItem alloc] initWithTitle:v7 style:0 target:self action:sel__actionButtonTapped_];
        [(QLBarButtonItem *)v8 setQLType:3];
        [(QLBarButtonItem *)v8 setAccessibilityIdentifier:@"QLOverlayCustomActionButtonAccessibilityIdentifier"];

        goto LABEL_10;
      }
    }
  }
  id v9 = [(QLPreviewController *)self internalCurrentPreviewItem];
  if (([v9 canBeShared] & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v10 = [(QLPreviewController *)self excludedToolbarButtonIdentifiers];
  if ([v10 containsObject:@"QLListButtonIdentifier"])
  {

LABEL_8:
LABEL_9:
    id v8 = 0;
    goto LABEL_10;
  }
  BOOL v12 = +[QLUtilitiesInternal deviceIsLocked];

  if (v12 || ![(QLPreviewController *)self hasItemsToPreview]) {
    goto LABEL_9;
  }
  id v8 = [[QLBarButtonItem alloc] initWithBarButtonSystemItem:9 target:self action:sel__actionButtonTapped_];
  [(QLBarButtonItem *)v8 setQLType:4];
  [(QLBarButtonItem *)v8 setAccessibilityIdentifier:@"QLOverlayDefaultActionButtonAccessibilityIdentifier"];
LABEL_10:

  return v8;
}

- (id)_listButton
{
  BOOL v3 = [QLBarButtonItem alloc];
  char v4 = [MEMORY[0x263F827E8] systemImageNamed:@"list.bullet"];
  uint64_t v5 = [v4 imageFlippedForRightToLeftLayoutDirection];
  int v6 = [(QLBarButtonItem *)v3 initWithImage:v5 style:0 target:self action:sel__listButtonTapped_];

  [(QLBarButtonItem *)v6 setAccessibilityIdentifier:@"QLOverlayListButtonAccessibilityIdentifier"];
  [(QLBarButtonItem *)v6 setQLType:2];

  return v6;
}

- (id)flexibleSpace
{
  id v2 = [[QLBarButtonItem alloc] initWithBarButtonSystemItem:5 target:0 action:0];
  [(QLBarButtonItem *)v2 setQLType:5];

  return v2;
}

- (id)_toolBarButtonsWithTraitCollection:(id)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  if ([(QLPreviewController *)self _isToolbarVisibleForTraitCollection:a3])
  {
    char v4 = objc_opt_new();
    uint64_t v5 = [(QLPreviewController *)self _actionButton];
    if (v5)
    {
      [v4 addObject:v5];
      int v6 = [(QLPreviewController *)self flexibleSpace];
      [v4 addObject:v6];
    }
    uint64_t v63 = (void *)v5;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v7 = [(QLPreviewController *)self previewToolbarButtons];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v80 objects:v88 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v81;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v81 != v10) {
            objc_enumerationMutation(v7);
          }
          BOOL v12 = *(void **)(*((void *)&v80 + 1) + 8 * i);
          if (([v12 forceToNavBar] & 1) == 0 && !objc_msgSend(v12, "placement"))
          {
            long long v13 = [(QLPreviewController *)self internalNavigationController];
            long long v14 = [v13 toolbar];
            [v14 frame];
            double v17 = objc_msgSend(v12, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v15, v16);
            [v4 addObject:v17];

            uint64_t v18 = [(QLPreviewController *)self flexibleSpace];
            [v4 addObject:v18];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v80 objects:v88 count:16];
      }
      while (v9);
    }

    int v19 = [(QLPreviewController *)self _additionalRightButtonItems];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v76 objects:v87 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v77;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v77 != v22) {
            objc_enumerationMutation(v19);
          }
          [v4 addObject:*(void *)(*((void *)&v76 + 1) + 8 * j)];
          uint64_t v24 = [(QLPreviewController *)self flexibleSpace];
          [v4 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v76 objects:v87 count:16];
      }
      while (v21);
    }
    double v62 = v19;
    uint64_t v25 = [(QLPreviewController *)self _openInButton];
    if (v25)
    {
      [v4 addObject:v25];
      uint64_t v26 = [(QLPreviewController *)self flexibleSpace];
      [v4 addObject:v26];
    }
    double v61 = (void *)v25;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    uint64_t v27 = [(QLPreviewController *)self previewToolbarButtons];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v72 objects:v86 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v73;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v73 != v30) {
            objc_enumerationMutation(v27);
          }
          BOOL v32 = *(void **)(*((void *)&v72 + 1) + 8 * k);
          if (([v32 forceToNavBar] & 1) == 0 && objc_msgSend(v32, "placement") == 1)
          {
            BOOL v33 = [(QLPreviewController *)self internalNavigationController];
            id v34 = [v33 toolbar];
            [v34 frame];
            uint64_t v37 = objc_msgSend(v32, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v35, v36);
            [v4 addObject:v37];

            unint64_t v38 = [(QLPreviewController *)self flexibleSpace];
            [v4 addObject:v38];
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v72 objects:v86 count:16];
      }
      while (v29);
    }

    BOOL v39 = [(QLPreviewController *)self _additionalLeftButtonItems];
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    uint64_t v40 = [v39 countByEnumeratingWithState:&v68 objects:v85 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v69;
      do
      {
        for (uint64_t m = 0; m != v41; ++m)
        {
          if (*(void *)v69 != v42) {
            objc_enumerationMutation(v39);
          }
          [v4 addObject:*(void *)(*((void *)&v68 + 1) + 8 * m)];
          long long v44 = [(QLPreviewController *)self flexibleSpace];
          [v4 addObject:v44];
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v68 objects:v85 count:16];
      }
      while (v41);
    }
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v45 = [(QLPreviewController *)self previewToolbarButtons];
    uint64_t v46 = [v45 countByEnumeratingWithState:&v64 objects:v84 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      uint64_t v48 = *(void *)v65;
      do
      {
        for (uint64_t n = 0; n != v47; ++n)
        {
          if (*(void *)v65 != v48) {
            objc_enumerationMutation(v45);
          }
          id v50 = *(void **)(*((void *)&v64 + 1) + 8 * n);
          if (([v50 forceToNavBar] & 1) == 0 && objc_msgSend(v50, "placement") == 2)
          {
            long long v51 = [(QLPreviewController *)self internalNavigationController];
            uint64_t v52 = [v51 toolbar];
            [v52 frame];
            id v55 = objc_msgSend(v50, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v53, v54);
            [v4 addObject:v55];

            uint64_t v56 = [(QLPreviewController *)self flexibleSpace];
            [v4 addObject:v56];
          }
        }
        uint64_t v47 = [v45 countByEnumeratingWithState:&v64 objects:v84 count:16];
      }
      while (v47);
    }

    if ([v4 count]) {
      [v4 removeLastObject];
    }
    id v57 = [v4 lastObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v57 placement] == 1 || v57 == v61)
    {
      double v58 = [(QLPreviewController *)self flexibleSpace];
      [v4 addObject:v58];
    }
  }
  else
  {
    char v4 = (void *)MEMORY[0x263EFFA68];
  }

  return v4;
}

- (id)_navigationBarRightButtonsWithTraitCollection:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  BOOL v4 = [(QLPreviewController *)self _isToolbarVisibleForTraitCollection:a3];
  uint64_t v5 = objc_opt_new();
  if (![(QLPreviewController *)self _shouldDoneButtonBePlacedLeft])
  {
    int v6 = [(QLPreviewController *)self _topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v8 = [(QLPreviewController *)self _doneButton];
      [v5 addObject:v8];
    }
  }
  if (v4)
  {
    uint64_t v9 = [(QLPreviewController *)self previewToolbarButtons];
    uint64_t v10 = [v9 sortedArrayUsingComparator:&__block_literal_global_14];
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __78__QLPreviewController_Overlay___navigationBarRightButtonsWithTraitCollection___block_invoke_2;
    v63[3] = &unk_2642F6E00;
    id v64 = v5;
    long long v65 = self;
    [v10 enumerateObjectsUsingBlock:v63];

    int v11 = v64;
  }
  else
  {
    BOOL v62 = v4;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    BOOL v12 = [(QLPreviewController *)self previewToolbarButtons];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v82 objects:v90 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v83;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v83 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(void **)(*((void *)&v82 + 1) + 8 * i);
          if ([v17 placement] == 2)
          {
            uint64_t v18 = [(QLPreviewController *)self internalNavigationController];
            int v19 = [v18 navigationBar];
            [v19 frame];
            uint64_t v22 = objc_msgSend(v17, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v20, v21);
            [v5 addObject:v22];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v82 objects:v90 count:16];
      }
      while (v14);
    }

    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    BOOL v23 = [(QLPreviewController *)self previewToolbarButtons];
    uint64_t v24 = [v23 countByEnumeratingWithState:&v78 objects:v89 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v79;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v79 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void **)(*((void *)&v78 + 1) + 8 * j);
          if ([v28 placement] == 1)
          {
            uint64_t v29 = [(QLPreviewController *)self internalNavigationController];
            uint64_t v30 = [v29 navigationBar];
            [v30 frame];
            BOOL v33 = objc_msgSend(v28, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v31, v32);
            [v5 addObject:v33];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v78 objects:v89 count:16];
      }
      while (v25);
    }

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id v34 = [(QLPreviewController *)self _additionalRightButtonItems];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v74 objects:v88 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v75;
      do
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v75 != v37) {
            objc_enumerationMutation(v34);
          }
          [v5 addObject:*(void *)(*((void *)&v74 + 1) + 8 * k)];
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v74 objects:v88 count:16];
      }
      while (v36);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    BOOL v39 = [(QLPreviewController *)self previewToolbarButtons];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v70 objects:v87 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v71;
      do
      {
        for (uint64_t m = 0; m != v41; ++m)
        {
          if (*(void *)v71 != v42) {
            objc_enumerationMutation(v39);
          }
          long long v44 = *(void **)(*((void *)&v70 + 1) + 8 * m);
          if (![v44 placement])
          {
            long long v45 = [(QLPreviewController *)self internalNavigationController];
            uint64_t v46 = [v45 navigationBar];
            [v46 frame];
            __int16 v49 = objc_msgSend(v44, "barButtonWithTarget:action:maxSize:", self, sel__toolbarButtonPressed_, v47, v48);
            [v5 addObject:v49];
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v70 objects:v87 count:16];
      }
      while (v41);
    }

    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    int v11 = [(QLPreviewController *)self _additionalLeftButtonItems];
    uint64_t v50 = [v11 countByEnumeratingWithState:&v66 objects:v86 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v67;
      do
      {
        for (uint64_t n = 0; n != v51; ++n)
        {
          if (*(void *)v67 != v52) {
            objc_enumerationMutation(v11);
          }
          [v5 addObject:*(void *)(*((void *)&v66 + 1) + 8 * n)];
        }
        uint64_t v51 = [v11 countByEnumeratingWithState:&v66 objects:v86 count:16];
      }
      while (v51);
    }
    BOOL v4 = v62;
  }

  double v54 = [(QLPreviewController *)self originalRightBarButtonItems];

  if (v54)
  {
    id v55 = [(QLPreviewController *)self originalRightBarButtonItems];
    [v5 addObjectsFromArray:v55];
  }
  if ([(QLPreviewController *)self presentationStyle] == 1)
  {
    uint64_t v56 = [v5 indexOfObjectPassingTest:&__block_literal_global_152];
    if (v56 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v57 = v56;
      double v58 = [v5 objectAtIndexedSubscript:v56];
      [v5 removeObjectAtIndex:v57];
      [v5 addObject:v58];
    }
  }
  if (!v4)
  {
    double v59 = [(QLPreviewController *)self _actionButton];
    if (v59) {
      [v5 addObject:v59];
    }
    __int16 v60 = [(QLPreviewController *)self _openInButton];
    if (v60) {
      [v5 addObject:v60];
    }
  }

  return v5;
}

uint64_t __78__QLPreviewController_Overlay___navigationBarRightButtonsWithTraitCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 placement];
  if (v6 <= [v5 placement])
  {
    unint64_t v8 = [v4 placement];
    uint64_t v7 = v8 < [v5 placement];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

void __78__QLPreviewController_Overlay___navigationBarRightButtonsWithTraitCollection___block_invoke_2(uint64_t a1, void *a2)
{
  id v10 = a2;
  if ([v10 forceToNavBar])
  {
    id v4 = *(void **)(a1 + 32);
    BOOL v3 = *(void **)(a1 + 40);
    id v5 = [v3 internalNavigationController];
    unint64_t v6 = [v5 navigationBar];
    [v6 frame];
    uint64_t v9 = objc_msgSend(v10, "barButtonWithTarget:action:maxSize:", v3, sel__toolbarButtonPressed_, v7, v8);
    [v4 addObject:v9];
  }
}

uint64_t __78__QLPreviewController_Overlay___navigationBarRightButtonsWithTraitCollection___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v5 identifier],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:@"QLVisualSearchButton"],
        v6,
        v7))
  {
    uint64_t v8 = 1;
    *a4 = 1;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldDoneButtonBePlacedLeft
{
  return _UIBarsDesktopNavigationBarEnabled() ^ 1;
}

- (id)_navigationBarLeftButtonsWithTraitCollection:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v4 = [(QLPreviewController *)self _isToolbarVisibleForTraitCollection:a3];
  int v5 = _UIBarsDesktopNavigationBarEnabled();
  unint64_t v6 = objc_opt_new();
  if ([(QLPreviewController *)self _shouldDoneButtonBePlacedLeft])
  {
    int v7 = [(QLPreviewController *)self _topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v9 = [(QLPreviewController *)self _doneButton];
      [v6 addObject:v9];
    }
  }
  if (v5 && [(QLPreviewController *)self _needsListButton])
  {
    id v10 = [(QLPreviewController *)self _listButton];
    [v6 addObject:v10];
  }
  else
  {
    if (v4) {
      goto LABEL_18;
    }
    if ([(QLPreviewController *)self _needsListButton])
    {
      int v11 = [(QLPreviewController *)self _listButton];
      [v6 addObject:v11];
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = [(QLPreviewController *)self _additionalLeftButtonItems];
    uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(v10);
          }
          [v6 addObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        uint64_t v13 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
  }

LABEL_18:
  double v16 = [(QLPreviewController *)self originalLeftBarButtonItems];

  if (v16)
  {
    double v17 = [(QLPreviewController *)self originalLeftBarButtonItems];
    [v6 addObjectsFromArray:v17];
  }

  return v6;
}

- (void)_toolbarButtonPressed:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(QLPreviewController *)self _canPerformBarButtonAction])
  {
    if (objc_opt_respondsToSelector())
    {
      int v5 = (NSObject **)MEMORY[0x263F62940];
      unint64_t v6 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        unint64_t v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = v6;
        uint64_t v8 = [v4 identifier];
        *(_DWORD *)CGRect buf = 138412546;
        uint64_t v12 = self;
        __int16 v13 = 2112;
        uint64_t v14 = v8;
        _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_INFO, "Preview controller: %@ is notifying collection about button pressed with identifier: %@. #PreviewController", buf, 0x16u);
      }
      uint64_t v9 = [(QLPreviewController *)self previewCollection];
      id v10 = [v4 identifier];
      [v9 toolbarButtonPressedWithIdentifier:v10 completionHandler:&__block_literal_global_156];
    }
    else
    {
      uint64_t v9 = [NSString stringWithFormat:@"the sender sent to _toolbarButtonPressed: should have an identifier. Sender: %@", v4];
      NSLog(&cfstr_SError.isa, "-[QLPreviewController(Overlay) _toolbarButtonPressed:]", v9);
    }
  }
}

- (void)_actionButtonTapped:(id)a3
{
  id v8 = a3;
  if ([(QLPreviewController *)self _canPerformBarButtonAction])
  {
    [(QLPreviewController *)self setOverlayFrozen:1];
    if ([(QLPreviewController *)self useCustomActionButton])
    {
      id v4 = [(QLPreviewController *)self delegate];
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        unint64_t v6 = [(QLPreviewController *)self delegate];
        int v7 = [(QLPreviewController *)self internalCurrentPreviewItem];
        [v6 previewController:self customActionButtonWasTappedForPreviewItem:v7];
      }
    }
    else
    {
      [(QLPreviewController *)self showShareSheetFromBarButton:v8];
    }
  }
}

- (void)_copyToButtonTapped:(id)a3
{
  id v4 = a3;
  char v5 = [(QLPreviewController *)self internalCurrentPreviewItem];
  [(QLPreviewController *)self isContentManaged];
  unint64_t v6 = _QLGetOpenInAppClaimBindingForItem(v5);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke;
  v8[3] = &unk_2642F6E48;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [(QLPreviewController *)self shareableURLForCurrentPreviewItem:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke_2;
  v6[3] = &unk_2642F5AF8;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  [WeakRetained _performOpenInWithFileURL:v3 claimBinding:v5 additionalLaunchServicesOptions:0 completion:v6];

  objc_destroyWeak(&v7);
}

void __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke_2(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  QLRunInMainThread();
  objc_destroyWeak(&v1);
}

void __52__QLPreviewController_Overlay___copyToButtonTapped___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissQuickLook];
}

- (void)_openInButtonTapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(QLPreviewController *)self internalCurrentPreviewItem];
  [(QLPreviewController *)self isContentManaged];
  unint64_t v6 = _QLGetOpenInAppClaimBindingForItem(v5);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke;
  v8[3] = &unk_2642F6E98;
  id v7 = v6;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [(QLPreviewController *)self shareableURLForCurrentPreviewItem:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) bundleRecord];
  uint64_t v5 = [v4 bundleIdentifier];
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  objc_copyWeak(&v8, (id *)(a1 + 40));
  FPExtendBookmarkForDocumentURL();

  objc_destroyWeak(&v8);
}

void __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)[a2 copy];
  id v6 = (void *)[a3 copy];
  if (v6)
  {
    id v7 = (NSObject **)MEMORY[0x263F62940];
    id v8 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v9 = *(void **)(a1 + 40);
      int v11 = v8;
      uint64_t v12 = [v9 bundleRecord];
      __int16 v13 = [v12 bundleIdentifier];
      *(_DWORD *)CGRect buf = 138412546;
      uint64_t v25 = v10;
      __int16 v26 = 2112;
      uint64_t v27 = v13;
      _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_ERROR, "Could not obtain bookmark to open file at URL: %@ in place with app: %@. #Sharing", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v14 = (id *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *MEMORY[0x263F01830];
    v22[0] = *MEMORY[0x263F01808];
    v22[1] = v18;
    v23[0] = v5;
    v23[1] = MEMORY[0x263EFFA88];
    long long v19 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke_168;
    v20[3] = &unk_2642F5AF8;
    objc_copyWeak(&v21, v14);
    [WeakRetained _performOpenInWithFileURL:v16 claimBinding:v17 additionalLaunchServicesOptions:v19 completion:v20];

    objc_destroyWeak(&v21);
  }
}

void __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke_168(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  QLRunInMainThread();
  objc_destroyWeak(&v1);
}

void __52__QLPreviewController_Overlay___openInButtonTapped___block_invoke_2_169(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissQuickLook];
}

- (id)_openInTitleForOpenInType:(unint64_t)a3 claimBinding:(id)a4
{
  if (a3 - 1 > 1)
  {
    id v9 = 0;
  }
  else
  {
    id v4 = NSString;
    id v5 = a4;
    id v6 = QLLocalizedString();
    id v7 = [v5 bundleRecord];

    id v8 = [v7 localizedName];
    id v9 = objc_msgSend(v4, "stringWithFormat:", v6, v8);
  }

  return v9;
}

- (void)_performOpenInWithFileURL:(id)a3 claimBinding:(id)a4 additionalLaunchServicesOptions:(id)a5 completion:(id)a6
{
  v31[2] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  __int16 v13 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v14 = *MEMORY[0x263F3F608];
  v30[0] = *MEMORY[0x263F3F5E8];
  v30[1] = v14;
  v31[0] = MEMORY[0x263EFFA88];
  v31[1] = MEMORY[0x263EFFA88];
  uint64_t v15 = NSDictionary;
  id v16 = a4;
  uint64_t v17 = [v15 dictionaryWithObjects:v31 forKeys:v30 count:2];
  uint64_t v18 = [v13 dictionaryWithDictionary:v17];

  if (v11) {
    [v18 addEntriesFromDictionary:v11];
  }
  char v19 = [v10 startAccessingSecurityScopedResource];
  long long v20 = [MEMORY[0x263F01880] defaultWorkspace];
  id v21 = [v16 bundleRecord];

  long long v22 = [v21 bundleIdentifier];
  BOOL v23 = objc_msgSend(v20, "operationToOpenResource:usingApplication:uniqueDocumentIdentifier:isContentManaged:sourceAuditToken:userInfo:options:delegate:", v10, v22, 0, -[QLPreviewController isContentManaged](self, "isContentManaged"), 0, 0, v18, 0);

  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  void v26[2] = __114__QLPreviewController_Overlay___performOpenInWithFileURL_claimBinding_additionalLaunchServicesOptions_completion___block_invoke;
  v26[3] = &unk_2642F6EC0;
  char v29 = v19;
  id v27 = v10;
  id v28 = v12;
  id v24 = v12;
  id v25 = v10;
  [v23 setCompletionBlock:v26];
  [v23 start];
}

uint64_t __114__QLPreviewController_Overlay___performOpenInWithFileURL_claimBinding_additionalLaunchServicesOptions_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)showShareSheetFromBarButton:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[QLUtilitiesInternal deviceIsLocked])
  {
    id v5 = (NSObject **)MEMORY[0x263F62940];
    id v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      id v8 = [(QLPreviewController *)self internalCurrentPreviewItem];
      *(_DWORD *)CGRect buf = 138412290;
      __int16 v13 = v8;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_ERROR, "Could not show share sheet for item %@ because device is locked. #Sharing", buf, 0xCu);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    id v9 = [(QLPreviewController *)self previewCollection];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __60__QLPreviewController_Overlay__showShareSheetFromBarButton___block_invoke;
    v10[3] = &unk_2642F4F88;
    void v10[4] = self;
    objc_copyWeak(&v11, (id *)buf);
    [v9 toolbarButtonPressedWithIdentifier:@"QLActionButtonIdentifier" completionHandler:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __60__QLPreviewController_Overlay__showShareSheetFromBarButton___block_invoke(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 40));
  QLRunInMainThread();
  objc_destroyWeak(&v1);
}

void __60__QLPreviewController_Overlay__showShareSheetFromBarButton___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _displayedButtonWithAccessibilityIdentifier:@"QLOverlayDefaultActionButtonAccessibilityIdentifier"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showShareSheetFromBarButton:v3];
}

- (void)_showShareSheetFromBarButton:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __61__QLPreviewController_Overlay___showShareSheetFromBarButton___block_invoke;
  v6[3] = &unk_2642F50C8;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(QLPreviewController *)self _setupDocumentInteractionControllerForPresentation:v6];
}

void __61__QLPreviewController_Overlay___showShareSheetFromBarButton___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) sharingInteractionController];
  id v4 = v3;
  if (v2)
  {
    char v5 = [v3 presentOptionsMenuFromBarButtonItem:*(void *)(a1 + 32) animated:1];

    if (v5) {
      return;
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) view];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = [*(id *)(a1 + 40) view];
    char v16 = objc_msgSend(v4, "presentOptionsMenuFromRect:inView:animated:", v15, 1, v8, v10, v12, v14);

    if (v16) {
      return;
    }
  }
  uint64_t v17 = *(void **)(a1 + 40);

  [v17 _stopAccessingUrlForSharingController];
}

- (void)showShareSheetFromRemoteViewWithPopoverTracker:(id)a3 customSharedURL:(id)a4 dismissCompletion:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(void))a5;
  if (+[QLUtilitiesInternal deviceIsLocked])
  {
    double v11 = (NSObject **)MEMORY[0x263F62940];
    double v12 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      double v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      double v13 = v12;
      double v14 = [(QLPreviewController *)self internalCurrentPreviewItem];
      *(_DWORD *)CGRect buf = 138412290;
      double v32 = v14;
      _os_log_impl(&dword_217F61000, v13, OS_LOG_TYPE_ERROR, "Could not show share sheet for item %@ because device is locked. #Sharing", buf, 0xCu);
    }
    v10[2](v10);
  }
  else if (v8)
  {
    uint64_t v15 = [(QLPreviewController *)self shareSheetPopoverTracker];

    if (v15)
    {
      char v16 = (NSObject **)MEMORY[0x263F62940];
      uint64_t v17 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        uint64_t v17 = *v16;
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = v17;
        char v19 = [(QLPreviewController *)self internalCurrentPreviewItem];
        *(_DWORD *)CGRect buf = 138412290;
        double v32 = v19;
        _os_log_impl(&dword_217F61000, v18, OS_LOG_TYPE_ERROR, "Won't show share for remote view again for item %@ because it is already visible on screen. #Sharing", buf, 0xCu);
      }
    }
    else
    {
      [(QLPreviewController *)self setShareSheetPopoverTracker:v8];
      objc_initWeak((id *)buf, self);
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke;
      v28[3] = &unk_2642F6EE8;
      objc_copyWeak(&v30, (id *)buf);
      char v29 = v10;
      [(QLPreviewController *)self setShareSheetDismissCompletion:v28];
      id v24 = [(QLPreviewController *)self shareSheetPopoverTracker];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_2;
      v25[3] = &unk_2642F6F38;
      objc_copyWeak(&v27, (id *)buf);
      id v26 = v9;
      [v24 getFrameWithCompletionBlock:v25];

      objc_destroyWeak(&v27);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    long long v20 = (NSObject **)MEMORY[0x263F62940];
    id v21 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v21 = *v20;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = v21;
      BOOL v23 = [(QLPreviewController *)self internalCurrentPreviewItem];
      *(_DWORD *)CGRect buf = 138412290;
      double v32 = v23;
      _os_log_impl(&dword_217F61000, v22, OS_LOG_TYPE_ERROR, "Could not show share sheet for item %@ using popover tracker because popover tracker is nil. #Sharing", buf, 0xCu);
    }
  }
}

uint64_t __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained view];
  [v3 setUserInteractionEnabled:1];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    char v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_copyWeak(v11, (id *)(a1 + 40));
  v11[1] = *(id *)&a2;
  void v11[2] = *(id *)&a3;
  void v11[3] = *(id *)&a4;
  void v11[4] = *(id *)&a5;
  id v10 = *(id *)(a1 + 32);
  QLRunInMainThread();

  objc_destroyWeak(v11);
}

void __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained view];
  [v4 setUserInteractionEnabled:0];

  id v5 = objc_loadWeakRetained(v2);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_4;
  aBlock[3] = &unk_2642F5880;
  id v6 = v5;
  id v11 = v6;
  long long v7 = *(_OWORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  long long v13 = v7;
  id v8 = _Block_copy(aBlock);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    [v6 _setupDocumentInteractionControllerForPresentationWithURL:v9 isCustomURL:1 completionHandler:v8];
  }
  else {
    [v6 _setupDocumentInteractionControllerForPresentation:v8];
  }
}

void __113__QLPreviewController_Overlay__showShareSheetFromRemoteViewWithPopoverTracker_customSharedURL_dismissCompletion___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sharingInteractionController];
  id v3 = [*(id *)(a1 + 32) view];
  char v4 = objc_msgSend(v2, "presentOptionsMenuFromRect:inView:animated:", v3, 1, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  if ((v4 & 1) == 0)
  {
    id v5 = *(void **)(a1 + 32);
    [v5 _stopAccessingUrlForSharingController];
  }
}

- (void)_setupDocumentInteractionControllerForPresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [(QLPreviewController *)self setSharingInteractionController:v5];

  id v6 = [(QLPreviewController *)self sharingInteractionController];
  [v6 setDelegate:self];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __83__QLPreviewController_Overlay___setupDocumentInteractionControllerForPresentation___block_invoke;
  v8[3] = &unk_2642F6F60;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(QLPreviewController *)self shareableURLForCurrentPreviewItem:v8];
}

uint64_t __83__QLPreviewController_Overlay___setupDocumentInteractionControllerForPresentation___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setupDocumentInteractionControllerForPresentationWithURL:a2 isCustomURL:0 completionHandler:*(void *)(a1 + 40)];
}

- (void)_setupDocumentInteractionControllerForPresentationWithURL:(id)a3 isCustomURL:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = objc_opt_new();
  [(QLPreviewController *)self setSharingInteractionController:v10];

  if (v8)
  {
    id v11 = [(QLPreviewController *)self sharingInteractionController];
    [v11 setURL:v8];

    long long v12 = [(QLPreviewController *)self sharingInteractionController];
    long long v13 = [v12 URL];
    int v14 = [v13 startAccessingSecurityScopedResource];

    if (v14)
    {
      uint64_t v15 = [(QLPreviewController *)self sharingInteractionController];
      char v16 = [v15 URL];
      [(QLPreviewController *)self setAccessedUrlForSharingController:v16];
    }
    uint64_t v17 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v18 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v18 = *v17;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      char v19 = v18;
      long long v20 = [(QLPreviewController *)self internalCurrentPreviewItem];
      int v35 = 138412546;
      id v36 = v8;
      __int16 v37 = 2112;
      unint64_t v38 = v20;
      id v21 = "Passing URL: %@ to UIDocumentInteractionController to share item: %@. #Sharing";
      long long v22 = v19;
      uint32_t v23 = 22;
LABEL_12:
      _os_log_impl(&dword_217F61000, v22, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v35, v23);
    }
  }
  else
  {
    id v24 = (NSObject **)MEMORY[0x263F62940];
    id v25 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v25 = *v24;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      char v19 = v25;
      long long v20 = [(QLPreviewController *)self internalCurrentPreviewItem];
      int v35 = 138412290;
      id v36 = v20;
      id v21 = "Passing no URL to UIDocumentInteractionController to share item: %@. #Sharing";
      long long v22 = v19;
      uint32_t v23 = 12;
      goto LABEL_12;
    }
  }
  if (a4)
  {
    id v26 = [[QLCustomURLSharingProxyDelegate alloc] initWithDelegate:self];
    [(QLPreviewController *)self setCustomURLSharingProxyDelegate:v26];

    id v27 = [(QLPreviewController *)self customURLSharingProxyDelegate];
    id v28 = [(QLPreviewController *)self sharingInteractionController];
    [v28 setDelegate:v27];
  }
  else
  {
    char v29 = [(QLPreviewController *)self sharingInteractionController];
    [v29 setDelegate:self];

    id v30 = [(QLPreviewController *)self internalCurrentPreviewItem];
    double v31 = [v30 previewItemContentType];
    double v32 = [(QLPreviewController *)self sharingInteractionController];
    [v32 setUTI:v31];

    id v27 = [(QLPreviewController *)self sharingInteractionController];
    [v27 setShouldUnzipDocument:1];
  }

  BOOL v33 = [(QLPreviewController *)self isContentManaged];
  id v34 = [(QLPreviewController *)self sharingInteractionController];
  [v34 setIsContentManaged:v33];

  v9[2](v9);
}

- (void)_stopAccessingUrlForSharingController
{
  id v3 = [(QLPreviewController *)self accessedUrlForSharingController];

  if (v3)
  {
    id v4 = [(QLPreviewController *)self accessedUrlForSharingController];
    [v4 stopAccessingSecurityScopedResource];

    [(QLPreviewController *)self setAccessedUrlForSharingController:0];
  }
}

- (void)_listButtonTapped:(id)a3
{
  id v9 = a3;
  if ([(QLPreviewController *)self _canPerformBarButtonAction])
  {
    id v4 = [QLListViewController alloc];
    id v5 = [(QLPreviewController *)self previewItemStore];
    id v6 = [(QLPreviewController *)self internalCurrentPreviewItem];
    id v7 = [(QLListViewController *)v4 initWithPreviewItemStore:v5 currentPreviewItem:v6];

    [(QLListViewController *)v7 setBarButton:v9];
    [(QLListViewController *)v7 setArchiveDelegate:self];
    [(QLPreviewController *)self setWillTransitionToInternalView:1];
    [(QLPreviewController *)self presentViewController:v7 animated:1 completion:0];
    id v8 = [(QLPreviewController *)self previewCollection];
    [v8 toolbarButtonPressedWithIdentifier:@"QLListButtonIdentifier" completionHandler:&__block_literal_global_182];
  }
}

- (void)_saveAndObtainEditsBeforeDismissalWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if ([(QLPreviewController *)self isObtainingEditsFromServiceBeforeDismissing])
  {
    [(QLPreviewController *)self _notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler:v4];
  }
  else
  {
    [(QLPreviewController *)self _obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler:v4];
  }
}

- (void)_saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __94__QLPreviewController_Overlay___saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler___block_invoke;
  v6[3] = &unk_2642F6F88;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(QLPreviewController *)self _saveAndObtainEditsBeforeDismissalWithCompletionHandler:v6];
}

void __94__QLPreviewController_Overlay___saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) _editedItemsForDoneActionControllerWithItems:a2];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);
  }
  else
  {
    id v3 = *(void (**)(uint64_t))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4);
  }
}

- (BOOL)_dismissQuickLookIfBlocked
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(QLPreviewController *)self hasItemsToPreview])
  {
    BOOL v4 = 1;
    [(QLPreviewController *)self _performQuickLookDismissalAnimated:1];
    return v4;
  }
  if (![(QLPreviewController *)self _canPerformBarButtonAction])
  {
    id v5 = [(QLPreviewController *)self currentAnimator];

    if (v5)
    {
      id v6 = [(QLPreviewController *)self currentAnimator];
      int v7 = [v6 forceDismissalIfNeeded];

      if (v7)
      {
        id v8 = (NSObject **)MEMORY[0x263F62940];
        id v9 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          id v9 = *v8;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          id v10 = v9;
          id v11 = [(QLPreviewController *)self currentAnimator];
          int v15 = 138412290;
          char v16 = v11;
          _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "Forced dismissal of QLPreviewController using Done button with animator: %@ #PreviewController", (uint8_t *)&v15, 0xCu);
        }
      }
    }
    return 1;
  }
  id v3 = [(QLPreviewController *)self previewCollection];

  if (!v3)
  {
    long long v12 = (NSObject **)MEMORY[0x263F62940];
    long long v13 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      long long v13 = *v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      int v15 = 138412290;
      char v16 = self;
      _os_log_impl(&dword_217F61000, v13, OS_LOG_TYPE_FAULT, "Dismissing QLPreviewController because it does not have a preview collection anymore: %@ #PreviewController", (uint8_t *)&v15, 0xCu);
    }
    [(QLPreviewController *)self _performQuickLookDismissalAnimated:0];
    return 1;
  }
  return 0;
}

- (void)_obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __121__QLPreviewController_Overlay___obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler___block_invoke;
  v6[3] = &unk_2642F5EB8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(QLPreviewController *)self saveEditsIfNecessary:v6];
}

uint64_t __121__QLPreviewController_Overlay___obtainEditsFromServiceAndNotifyPreviewCollectionOfDoneButtonTappedWithCompletionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler:*(void *)(a1 + 40)];
}

- (void)_notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewController *)self previewCollection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __93__QLPreviewController_Overlay___notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler___block_invoke;
  v7[3] = &unk_2642F56A8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 toolbarButtonPressedWithIdentifier:@"QLDoneButtonIdentifier" completionHandler:v7];
}

void __93__QLPreviewController_Overlay___notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  QLRunInMainThread();
}

void __93__QLPreviewController_Overlay___notifyPreviewCollectionOfDoneButtonTapWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) editedItems];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)updateDoneButtonMenu
{
  id v3 = [(QLPreviewController *)self _displayedButtonWithAccessibilityIdentifier:@"QLOverlayDoneButtonAccessibilityIdentifier"];
  if (v3)
  {
    [(QLPreviewController *)self _updateDoneButtonMenu:v3];
  }
  else
  {
    id v4 = (NSObject **)MEMORY[0x263F62940];
    id v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "Could not update done button menu because it was not found #PreviewController", v6, 2u);
    }
  }
}

- (void)_updateDoneButtonMenu:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewController *)self _dismissActions];
  id v6 = v5;
  if (v5 && [v5 count])
  {
    [v4 setPrimaryAction:0];
    id v7 = [MEMORY[0x263F82940] menuWithTitle:&stru_26C8FAD38 image:0 identifier:0 options:1 children:v6];
    [v4 setMenu:v7];
  }
  else
  {
    objc_initWeak(&location, self);
    id v8 = (void *)MEMORY[0x263F823D0];
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    long long v12 = __54__QLPreviewController_Overlay___updateDoneButtonMenu___block_invoke;
    long long v13 = &unk_2642F5230;
    objc_copyWeak(&v14, &location);
    id v9 = [v8 actionWithHandler:&v10];
    objc_msgSend(v4, "setPrimaryAction:", v9, v10, v11, v12, v13);

    [v4 setMenu:0];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __54__QLPreviewController_Overlay___updateDoneButtonMenu___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained saveAndForceDismissQuickLookAnimated:1];
}

- (void)dismissQuickLook
{
  id v3 = [(QLPreviewController *)self _dismissActions];
  id v4 = v3;
  if (v3 && [v3 count]) {
    [(QLPreviewController *)self presentDismissActions:v4];
  }
  else {
    [(QLPreviewController *)self saveAndForceDismissQuickLookAnimated:1];
  }
}

- (void)presentDismissActions:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  val = self;
  id v25 = objc_alloc_init(MEMORY[0x263F82418]);
  id v5 = [(QLPreviewController *)self view];
  id v6 = [v25 popoverPresentationController];
  [v6 setSourceView:v5];

  id v7 = [(QLPreviewController *)self view];
  [v7 bounds];
  double v9 = v8;
  uint64_t v10 = [(QLPreviewController *)self view];
  [v10 bounds];
  double v12 = v11;
  long long v13 = [v25 popoverPresentationController];
  objc_msgSend(v13, "setSourceRect:", v9 * 0.5, v12 * 0.5, 1.0, 1.0);

  objc_initWeak(&location, self);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v19 = [v18 attributes];
        if (v19 != 1)
        {
          if (v19 == 2)
          {
            uint64_t v20 = 2;
          }
          else
          {
            if (v19 == 4) {
              continue;
            }
            uint64_t v20 = 0;
          }
          id v21 = (void *)MEMORY[0x263F82400];
          long long v22 = [v18 title];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          void v26[2] = __54__QLPreviewController_Overlay__presentDismissActions___block_invoke;
          v26[3] = &unk_2642F6FB0;
          void v26[4] = v18;
          objc_copyWeak(&v27, &location);
          uint32_t v23 = [v21 actionWithTitle:v22 style:v20 handler:v26];

          [v25 addAction:v23];
          objc_destroyWeak(&v27);
        }
      }
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v15);
  }

  [(QLPreviewController *)val presentViewController:v25 animated:1 completion:0];
  objc_destroyWeak(&location);
}

void __54__QLPreviewController_Overlay__presentDismissActions___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v1 performWithSender:WeakRetained target:0];
}

- (void)saveAndForceDismissQuickLookAnimated:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__QLPreviewController_Overlay__saveAndForceDismissQuickLookAnimated___block_invoke;
  v3[3] = &unk_2642F6338;
  void v3[4] = self;
  BOOL v4 = a3;
  [(QLPreviewController *)self _saveAndDismissQuickLookIfBlocked:v3];
}

uint64_t __69__QLPreviewController_Overlay__saveAndForceDismissQuickLookAnimated___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _performQuickLookDismissalAnimated:*(unsigned __int8 *)(result + 40)];
  }
  return result;
}

- (void)_saveAndDismissQuickLookIfBlocked:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  objc_copyWeak(&v6, &location);
  id v5 = v4;
  QLRunInMainThread();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __66__QLPreviewController_Overlay___saveAndDismissQuickLookIfBlocked___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__QLPreviewController_Overlay___saveAndDismissQuickLookIfBlocked___block_invoke_2;
  v4[3] = &unk_2642F6FD8;
  objc_copyWeak(&v6, v2);
  id v5 = *(id *)(a1 + 32);
  [WeakRetained _saveAndObtainEditsBeforeDismissalWithCompletionHandler:v4];

  objc_destroyWeak(&v6);
}

uint64_t __66__QLPreviewController_Overlay___saveAndDismissQuickLookIfBlocked___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _dismissQuickLookIfBlocked];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)saveEditsIfNecessary:(id)a3
{
  id v4 = a3;
  [(QLPreviewController *)self _willStartObtainingEditsFromService];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __53__QLPreviewController_Overlay__saveEditsIfNecessary___block_invoke;
  v6[3] = &unk_2642F67E0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(QLPreviewController *)self obtainAndUpdateEditedCopyOfCurrentPreviewItem:v6];
}

void __53__QLPreviewController_Overlay__saveEditsIfNecessary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _didObtainEditsFromService];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __53__QLPreviewController_Overlay__saveEditsIfNecessary___block_invoke_2;
  v8[3] = &unk_2642F5F28;
  id v7 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v7 didEditCopyOfPreviewItemAtIndex:a2 editedCopy:v6 completionHandler:v8];
}

uint64_t __53__QLPreviewController_Overlay__saveEditsIfNecessary___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)menuActionsForDismissActions:(id)a3 containsAtLeastOneUnsavedCopy:(BOOL)a4 editedPreviewItems:(id)a5 shouldPresentDefaultActions:(BOOL)a6
{
  BOOL v39 = a6;
  BOOL v35 = a4;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  val = self;
  id v36 = a5;
  unint64_t v38 = -[QLPreviewController _editedItemsForDoneActionControllerWithItems:](self, "_editedItemsForDoneActionControllerWithItems:");
  uint64_t v9 = [v38 count];
  uint64_t v37 = v9;
  if (v39) {
    uint64_t v10 = v9 + 2;
  }
  else {
    uint64_t v10 = v9;
  }
  uint64_t v42 = [MEMORY[0x263EFF980] arrayWithCapacity:v10];
  objc_initWeak(&location, self);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v51 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x263F823D0];
        uint64_t v16 = [v14 title];
        uint64_t v17 = [v14 image];
        v48[0] = MEMORY[0x263EF8330];
        v48[1] = 3221225472;
        v48[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke;
        v48[3] = &unk_2642F7028;
        objc_copyWeak(&v49, &location);
        void v48[4] = v14;
        v48[5] = val;
        uint64_t v18 = [v15 actionWithTitle:v16 image:v17 identifier:0 handler:v48];

        if ([v14 attributes]) {
          objc_msgSend(v18, "setAttributes:", objc_msgSend(v14, "attributes"));
        }
        [v42 addObject:v18];

        objc_destroyWeak(&v49);
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    }
    while (v11);
  }

  if (v39)
  {
    objc_initWeak(&from, val);
    uint64_t v19 = (void *)MEMORY[0x263F823D0];
    uint64_t v20 = QLLocalizedString();
    id v21 = [MEMORY[0x263F827E8] systemImageNamed:@"folder"];
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_4;
    v45[3] = &unk_2642F5230;
    objc_copyWeak(&v46, &from);
    long long v22 = [v19 actionWithTitle:v20 image:v21 identifier:0 handler:v45];

    [v42 addObject:v22];
    uint32_t v23 = (void *)MEMORY[0x263F823D0];
    id v24 = QLLocalizedString();
    id v25 = [MEMORY[0x263F827E8] systemImageNamed:@"trash"];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_6;
    v43[3] = &unk_2642F5230;
    objc_copyWeak(&v44, &from);
    id v26 = [v23 actionWithTitle:v24 image:v25 identifier:0 handler:v43];

    [v26 setAttributes:2];
    [v42 addObject:v26];

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v46);
    objc_destroyWeak(&from);
  }
  if (v37 != 1)
  {
    if (!v35) {
      goto LABEL_21;
    }
LABEL_19:
    long long v29 = NSString;
    long long v30 = QLLocalizedDictionaryString();
    long long v31 = objc_msgSend(v29, "localizedStringWithFormat:", v30, v37);

    double v32 = [MEMORY[0x263F82940] menuWithTitle:v31 image:0 identifier:0 options:1 children:v42];
    id v33 = [MEMORY[0x263EFF8C0] arrayWithObject:v32];

    goto LABEL_22;
  }
  id v27 = [(QLPreviewController *)val internalCurrentPreviewItem];
  long long v28 = [v27 editedFileURL];
  if (!v28)
  {

    if (!v35) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }

LABEL_21:
  id v33 = v42;
LABEL_22:
  objc_destroyWeak(&location);

  return v33;
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_2;
  v3[3] = &unk_2642F7000;
  long long v4 = *(_OWORD *)(a1 + 32);
  [WeakRetained _saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler:v3];
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) shouldDismissQuickLookAutomatically])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    void v6[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_3;
    v6[3] = &unk_2642F50C8;
    long long v4 = *(void **)(a1 + 40);
    void v6[4] = *(void *)(a1 + 32);
    id v7 = v3;
    [v4 dismissViewControllerAnimated:1 completion:v6];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, void, id))v5)[2](v5, *(void *)(a1 + 32), v3);
  }
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_5;
  v6[3] = &unk_2642F7050;
  objc_copyWeak(&v7, v4);
  [WeakRetained _saveAndObtainEditedItemsBeforeDismissalWithCompletionHandler:v6];

  objc_destroyWeak(&v7);
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained presentSaveToFilesForEditedItems:v3];
}

void __138__QLPreviewController_Overlay__menuActionsForDismissActions_containsAtLeastOneUnsavedCopy_editedPreviewItems_shouldPresentDefaultActions___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:1 completion:0];
}

- (id)_dismissActions
{
  id v3 = [(QLPreviewController *)self editedItems];
  long long v4 = v3;
  if (v3) {
    BOOL v5 = [v3 count] != 0;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = [(QLPreviewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(QLPreviewController *)self delegate];
    int v8 = [v7 shouldPresentDismissActionsWithoutEditedItemsForPreviewController:self];
  }
  else
  {
    int v8 = 0;
  }

  if ((v5 | v8) == 1)
  {
    uint64_t v9 = [(QLPreviewController *)self _dismissActionsForEditedPreviewItems:v4];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_dismissActionsForEditedPreviewItems:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(QLPreviewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(QLPreviewController *)self delegate];
    unsigned int v26 = [v7 shouldAppendDefaultDismissActionsForPreviewController:self];
  }
  else
  {
    unsigned int v26 = 1;
  }
  int v8 = [(QLPreviewController *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(QLPreviewController *)self delegate];
    uint64_t v11 = [v10 dismissActionsForPreviewController:self];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x263EFFA68];
  }
  id v24 = self;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v4;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    char v15 = 0;
    int v16 = 0;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (objc_msgSend(v19, "editingMode", v24) == 4 || objc_msgSend(v19, "editingMode") == 3) {
          int v16 = 1;
        }
        uint64_t v20 = [v19 editedFileURL];

        v15 |= v20 != 0;
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }
  else
  {
    char v15 = 0;
    int v16 = 0;
  }

  if ([v11 count]) {
    uint64_t v21 = v26;
  }
  else {
    uint64_t v21 = v16 & v26;
  }
  if (objc_msgSend(v11, "count", v24) || v21)
  {
    long long v22 = [v25 menuActionsForDismissActions:v11 containsAtLeastOneUnsavedCopy:v15 & 1 editedPreviewItems:v12 shouldPresentDefaultActions:v21];
  }
  else
  {
    long long v22 = 0;
  }

  return v22;
}

- (void)_performQuickLookDismissalAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(QLPreviewController *)self presentationMode] == 1)
  {
    BOOL v5 = (NSObject **)MEMORY[0x263F62940];
    char v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      char v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CGRect buf = 0;
      _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, "Triggered dismissal of pushed QLPreviewController using Back button. #PreviewController", buf, 2u);
    }
    id v7 = [(QLPreviewController *)self internalNavigationController];
    id v8 = (id)[v7 popViewControllerAnimated:v3];
  }
  else
  {
    char v9 = [(QLPreviewController *)self presentingViewController];

    uint64_t v10 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v11 = *MEMORY[0x263F62940];
    if (v9)
    {
      if (!v11)
      {
        QLSInitLogging();
        uint64_t v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "Triggered dismissal of modal QLPreviewController using Done button. #PreviewController", v19, 2u);
      }
      [(QLPreviewController *)self dismissViewControllerAnimated:v3 completion:0];
    }
    else
    {
      if (!v11)
      {
        QLSInitLogging();
        uint64_t v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "Triggered dismissal of modal QLPreviewController using Done button (No presentingVC so calling delegate methods). #PreviewController", v18, 2u);
      }
      id v12 = [(QLPreviewController *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        uint64_t v14 = [(QLPreviewController *)self delegate];
        [v14 previewControllerWillDismiss:self];
      }
      char v15 = [(QLPreviewController *)self delegate];
      char v16 = objc_opt_respondsToSelector();

      if (v16)
      {
        uint64_t v17 = [(QLPreviewController *)self delegate];
        [v17 previewControllerDidDismiss:self];
      }
    }
  }
}

- (BOOL)_canPerformBarButtonAction
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = [(QLPreviewController *)self currentAnimator];
  if (v3)
  {
  }
  else
  {
    id v4 = [(QLPreviewController *)self presentedViewController];

    if (!v4)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
  }
  BOOL v5 = (NSObject **)MEMORY[0x263F62940];
  char v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    char v6 = *v5;
  }
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v7)
  {
    id v8 = v6;
    char v9 = [(QLPreviewController *)self currentAnimator];
    uint64_t v10 = [(QLPreviewController *)self presentedViewController];
    uint64_t v11 = [(QLPreviewController *)self previewCollection];
    int v12 = [v11 isRemote];
    char v13 = @"NO";
    int v15 = 138412802;
    char v16 = v9;
    __int16 v17 = 2112;
    if (v12) {
      char v13 = @"YES";
    }
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_INFO, "Can't perform bar button action. Current animator: %@ Presented view controller: %@. Remote: %@ #Generic", (uint8_t *)&v15, 0x20u);

    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)_willStartObtainingEditsFromService
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(QLPreviewController *)self _triggerOverlayUpdateAfterDelay];

  [(QLPreviewController *)self setIsObtainingEditsFromServiceBeforeDismissing:1];
}

- (void)_didObtainEditsFromService
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);

  [(QLPreviewController *)self setIsObtainingEditsFromServiceBeforeDismissing:0];
}

- (void)_triggerOverlayUpdateAfterDelay
{
  objc_initWeak(&location, self);
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(*MEMORY[0x263F629F8] * 1000000000.0));
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __63__QLPreviewController_Overlay___triggerOverlayUpdateAfterDelay__block_invoke;
  v3[3] = &unk_2642F5AF8;
  objc_copyWeak(&v4, &location);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__QLPreviewController_Overlay___triggerOverlayUpdateAfterDelay__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isObtainingEditsFromServiceBeforeDismissing];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 updateOverlayAnimated:0 forceRefresh:0];
  }
}

- (void)shareSheetDidDismiss
{
  [(QLPreviewController *)self setOverlayFrozen:0];
  [(QLPreviewController *)self _stopAccessingUrlForSharingController];
  [(QLPreviewController *)self setCustomURLSharingProxyDelegate:0];
  [(QLPreviewController *)self setShareSheetPopoverTracker:0];
  [(QLPreviewController *)self setCurrentItemProvider:0];
  [(QLPreviewController *)self setSharingInteractionController:0];
  int v3 = [(QLPreviewController *)self shareSheetDismissCompletion];

  if (v3)
  {
    id v4 = [(QLPreviewController *)self shareSheetDismissCompletion];
    v4[2]();

    [(QLPreviewController *)self setShareSheetDismissCompletion:0];
  }
  BOOL v5 = [(QLPreviewController *)self previewCollection];
  [v5 actionSheetDidDismiss];

  [(QLPreviewController *)self updateOverlayAnimated:1 forceRefresh:0];
}

- (void)didSelectPreviewItem:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  void v6[2] = __53__QLPreviewController_Overlay__didSelectPreviewItem___block_invoke;
  v6[3] = &unk_2642F50C8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(QLPreviewController *)self saveEditsIfNecessary:v6];
}

void __53__QLPreviewController_Overlay__didSelectPreviewItem___block_invoke(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  QLRunInMainThread();
}

void __53__QLPreviewController_Overlay__didSelectPreviewItem___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 previewItemStore];
  objc_msgSend(v2, "setCurrentPreviewItemIndex:", objc_msgSend(v3, "indexOfPreviewItem:", *(void *)(a1 + 40)));
}

- (id)_editedItemsForDoneActionControllerWithItems:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "originalContentWasUpdated", (void)v16)) {
          [v10 saveURL];
        }
        else {
        uint64_t v11 = [v10 editedFileURL];
        }
        int v12 = [QLEditedItem alloc];
        char v13 = [v10 originalPreviewItem];
        uint64_t v14 = [(QLEditedItem *)v12 initWithItem:v13 editedFileURL:v11];

        [v4 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_needsListButton
{
  id v3 = [(QLPreviewController *)self excludedToolbarButtonIdentifiers];
  BOOL v4 = ([v3 containsObject:@"QLListButtonIdentifier"] & 1) == 0
    && [(QLPreviewController *)self numberOfPreviewItems] >= 2
    && [(QLPreviewController *)self canChangeCurrentPage]
    && [(QLPreviewController *)self presentationStyle] != 1;

  return v4;
}

- (BOOL)_isToolbarVisibleForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 userInterfaceIdiom];
  uint64_t v6 = [(QLPreviewController *)self view];
  uint64_t v7 = [v6 window];
  uint64_t v8 = [v7 windowScene];

  if (v8) {
    BOOL v9 = (unint64_t)([v8 interfaceOrientation] - 3) < 2;
  }
  else {
    BOOL v9 = 0;
  }
  uint64_t v10 = [v4 horizontalSizeClass];
  char v11 = !v9;
  if (v5) {
    char v11 = 1;
  }
  if (v10 == 1) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)_copyBarButtons:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "ql_copySystemItem", (void)v12);
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_displayedButtonWithAccessibilityIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewController *)self _topViewController];
  uint64_t v6 = [v5 toolbarItems];
  uint64_t v7 = [(QLPreviewController *)self _buttonWithAccessibilityIdentifierPointer:v4 inButtons:v6];

  if (!v7)
  {
    uint64_t v8 = [(QLPreviewController *)self _topViewController];
    uint64_t v9 = [v8 navigationItem];
    uint64_t v10 = [v9 leftBarButtonItems];
    uint64_t v7 = [(QLPreviewController *)self _buttonWithAccessibilityIdentifierPointer:v4 inButtons:v10];

    if (!v7)
    {
      char v11 = [(QLPreviewController *)self _topViewController];
      long long v12 = [v11 navigationItem];
      long long v13 = [v12 rightBarButtonItems];
      uint64_t v7 = [(QLPreviewController *)self _buttonWithAccessibilityIdentifierPointer:v4 inButtons:v13];
    }
  }

  return v7;
}

+ (void)logDeprecatedMessageForMethodName:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (NSObject **)MEMORY[0x263F62940];
  id v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    id v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_DEFAULT, "Warning: The method '%{public}@' is deprecated and soon will be removed. #Deprecated", (uint8_t *)&v6, 0xCu);
  }
}

+ (void)logDeprecatedMessageForSelector:(SEL)a3
{
  NSStringFromSelector(a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  +[QLPreviewController logDeprecatedMessageForMethodName:v3];
}

+ (id)contentTypeForPreviewItem:(id)a3
{
  return 0;
}

+ (id)titleForPreviewItem:(id)a3
{
  return 0;
}

+ (BOOL)copyPreviewItemToPasteboard:(id)a3
{
  return 0;
}

- (void)setCurrentOrbMode:(unint64_t)a3
{
}

- (unint64_t)currentOrbMode
{
  return 0;
}

- (int)mode
{
  return 0;
}

+ (BOOL)canPreviewDocumentType:(id)a3
{
  return 0;
}

+ (BOOL)canPreviewMIMEType:(id)a3
{
  return 0;
}

+ (void)presentPreviewItem:(id)a3 onViewController:(id)a4 withDelegate:(id)a5 animated:(BOOL)a6
{
}

- (void)_prepareDelayedAppearance
{
}

- (id)currentTracker
{
  id v3 = [(QLPreviewController *)self swipeDownTracker];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(QLPreviewController *)self pinchRotationTracker];
  }
  int v6 = v5;

  return v6;
}

- (id)animatorForShowing:(BOOL)a3 previewController:(id)a4 presentingController:(id)a5
{
  BOOL v6 = a3;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  [(QLPreviewController *)self _reloadDataIfNeeded];
  if ([(QLPreviewController *)self hasItemsToPreview]
    && (![(QLPreviewController *)self modalPresentationStyle]
     || [(QLPreviewController *)self modalPresentationStyle] == 6
     || [(QLPreviewController *)self modalPresentationStyle] == 5)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = [(QLPreviewController *)self currentAnimator];
    if (!v10)
    {
      uint64_t v10 = objc_opt_new();
      [(QLPreviewController *)self setCurrentAnimator:v10];
    }
    long long v12 = [(QLPreviewController *)self currentAnimator];
    [v12 setShowing:v6];

    long long v13 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      long long v16 = (NSObject **)MEMORY[0x263F62940];
      QLSInitLogging();
      long long v13 = *v16;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = v13;
      long long v15 = NSStringFromBOOL();
      int v17 = 138412802;
      long long v18 = v10;
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      long long v22 = v15;
      _os_log_impl(&dword_217F61000, v14, OS_LOG_TYPE_INFO, "Returning transition animator: %@ for previewController: %@ showing: %@ #AppearanceTransition", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)shouldUseNativeTransition
{
  if (!_os_feature_enabled_impl()) {
    return 0;
  }
  id v3 = [(QLPreviewController *)self preferredTransition];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([(QLPreviewController *)self shouldUseNativeTransition])
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(QLPreviewController *)self animatorForShowing:1 previewController:v7 presentingController:v8];
  }

  return v9;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  if ([(QLPreviewController *)self shouldUseNativeTransition])
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(QLPreviewController *)self animatorForShowing:0 previewController:v4 presentingController:0];
  }

  return v5;
}

- (id)interactionControllerForPresentation:(id)a3
{
  id v4 = a3;
  if ([(QLPreviewController *)self shouldUseNativeTransition])
  {
    id v5 = 0;
  }
  else
  {
    if ([v4 conformsToProtocol:&unk_26C9427A0]) {
      BOOL v6 = v4;
    }
    else {
      BOOL v6 = 0;
    }
    id v5 = v6;
  }

  return v5;
}

- (id)interactionControllerForDismissal:(id)a3
{
  id v4 = a3;
  if ([(QLPreviewController *)self shouldUseNativeTransition])
  {
    id v5 = 0;
  }
  else
  {
    if ([v4 conformsToProtocol:&unk_26C9427A0]) {
      BOOL v6 = v4;
    }
    else {
      BOOL v6 = 0;
    }
    id v5 = v6;
  }

  return v5;
}

- (void)registerForScreenshotService
{
  dispatch_time_t v2 = self;
  sub_217FF57B4();
}

- (void)unregisterFromScreenshotService
{
  dispatch_time_t v2 = self;
  sub_217FF58F4();
}

- (void)screenshotService:(id)a3 generatePDFRepresentationWithCompletion:(id)a4
{
  BOOL v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_217FF66B8(v8, v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void)loadView
{
  dispatch_time_t v2 = self;
  QLPreviewController.loadView()();
}

@end