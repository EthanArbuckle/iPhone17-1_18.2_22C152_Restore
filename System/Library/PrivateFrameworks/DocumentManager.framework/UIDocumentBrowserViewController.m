@interface UIDocumentBrowserViewController
+ (id)placeholderURLForDownloadsFolder;
- (BOOL)_canSendDocumentLandingDidPickDocumentsAtURLs;
- (BOOL)_delegateRespondsToSelector:(SEL)a3;
- (BOOL)_expectsRemoteViewController;
- (BOOL)_hasExistingRemoteViewControllerWithInUIPDocumentLanding:(BOOL)a3;
- (BOOL)_shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks:(id)a3;
- (BOOL)_updateAppearanceShowsCreateButton;
- (BOOL)allowsDocumentCreation;
- (BOOL)allowsPickingMultipleItems;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)enclosedInUIPDocumentLanding;
- (BOOL)remoteHasReceivedInitialUIPBrowserState;
- (BOOL)shouldShowFileExtensions;
- (BOOL)supportsRemovableFileProvidersForConfiguration:(id)a3;
- (CGFloat)defaultDocumentAspectRatio;
- (CGSize)preferredContentSize;
- (DOCConfiguration)configuration;
- (DOCDocBrowserVC_UIActivityViewController)activityViewController;
- (DOCDocumentCreationController)documentCreationController;
- (DOCRemoteContainerViewController)remoteViewController;
- (DOCServiceDocumentBrowserViewControllerInterface)serviceProxy;
- (DOCUIPBrowserState)preferredUIPBrowserState;
- (NSArray)additionalLeadingNavigationBarButtonItems;
- (NSArray)additionalTrailingNavigationBarButtonItems;
- (NSArray)allowedContentTypes;
- (NSArray)contentTypesForRecentDocuments;
- (NSArray)customActions;
- (NSArray)leadingBarButtonTrackingViews;
- (NSArray)recentDocumentsContentTypes;
- (NSArray)remoteAdditionalLeadingNavigationBarButtonItems;
- (NSArray)remoteAdditionalTrailingNavigationBarButtonItems;
- (NSArray)trailingBarButtonTrackingViews;
- (NSOperationQueue)serviceQueue;
- (NSString)_activeDocumentCreationIntent;
- (NSString)localizedCreateDocumentActionTitle;
- (UIColor)backgroundColor;
- (UIDocumentBrowserTransitionController)transitionControllerForDocumentAtURL:(NSURL *)documentURL;
- (UIDocumentBrowserUserInterfaceStyle)browserUserInterfaceStyle;
- (UIDocumentBrowserViewController)init;
- (UIDocumentBrowserViewController)initForOpeningContentTypes:(NSArray *)contentTypes;
- (UIDocumentBrowserViewController)initForOpeningFilesWithContentTypes:(NSArray *)allowedContentTypes;
- (UIDocumentBrowserViewController)initWithCoder:(id)a3;
- (UIDocumentBrowserViewController)initWithConfiguration:(id)a3;
- (UISheetPresentationController)observedUIPPresentationController;
- (UIViewController)dummySplitViewController;
- (_UIDocumentLandingPresenter)documentLandingPresenter;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_activityViewControllerWithItemBookmarks:(id)a3 isForTitleMenuFolderSharing:(BOOL)a4 popoverTracker:(id)a5 isContentManaged:(BOOL)a6 additionalActivities:(id)a7 activityRunner:(id)a8;
- (id)_sandboxingURLWrapperForURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5;
- (id)_unavailableConfigurationForTryAgain;
- (id)configurationForOpeningDocumentsWithContentTypes:(id)a3;
- (id)delegate;
- (id)keyCommands;
- (id)preferredFocusEnvironments;
- (id)recentDocumentsContentTypesFromInfoPlist;
- (id)remoteBarButtonForUUID:(id)a3;
- (id)trackingViewForUUID:(id)a3;
- (int64_t)_currentLandingModeBasedForObservedPresentationController;
- (int64_t)_preferredModalPresentationStyle;
- (int64_t)preferredStatusBarStyle;
- (void)__commonInit;
- (void)_applyBrowserStateChange:(id)a3 serviceProxy:(id)a4 animated:(BOOL)a5;
- (void)_beginMonitoringUIPPresentationController;
- (void)_beginTransitionCoordinatorSessionForDocumentURL:(id)a3;
- (void)_checkIfObservedUIPPresentationControllerDetentDidChangeForReason:(id)a3;
- (void)_clearCurrentOpenInteractionUnlessUIPDocumentLanding;
- (void)_clearShownViewControllers;
- (void)_commitDocumentURLPreview:(id)a3;
- (void)_core_didImportDocumentAtURL:(id)a3 toDestinationURL:(id)a4;
- (void)_core_didRequestDocumentCreationWithHandler:(id)a3;
- (void)_core_failedToImportDocumentAtURL:(id)a3 error:(id)a4;
- (void)_didAttachToDocumentLaunchOptionsForUseInUIPDocumentLanding;
- (void)_didDenyCreateDocumentSessionWithError:(id)a3;
- (void)_didPickItemBookmarks:(id)a3;
- (void)_didTapTryAgainButton;
- (void)_didTriggerBarButtonWithUUID:(id)a3 overflowAction:(BOOL)a4;
- (void)_didTriggerCustomActionWithIdentifier:(id)a3 onItemBookmarks:(id)a4;
- (void)_displayActivityControllerWithItemBookmarks:(id)a3 popoverTracker:(id)a4 isContentManaged:(BOOL)a5 additionalActivities:(id)a6 activityProxy:(id)a7;
- (void)_displayRemoteControllerIfNeeded;
- (void)_doc_endDelayingRemotePresentation;
- (void)_doc_performRemoteUpdateAppearanceForReason:(unint64_t)a3;
- (void)_documentPickerWasCancelled;
- (void)_embedDocumentBrowserViewController;
- (void)_embedViewController:(id)a3;
- (void)_endMonitoringUIPPresentationController;
- (void)_endTransitionCoordinatorSession;
- (void)_ensurePreparedForAPIRequringXPC;
- (void)_ensurePreparedForAPIRequringXPC_asLegacy;
- (void)_ensurePreparedForAPIRequringXPC_asUIP;
- (void)_establishFirstResponderOnServiceSideForKeyCommand:(id)a3;
- (void)_fallbackRenameDocumentAtURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5;
- (void)_iOS_didImportDocumentAtURL:(id)a3 toDestinationItemBookmark:(id)a4;
- (void)_iOS_didRequestDocumentCreationWithHandler:(id)a3;
- (void)_iOS_failedToImportDocumentAtURL:(id)a3 error:(id)a4;
- (void)_importDocumentAtURL:(id)a3 neighbourURL:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6;
- (void)_initiateDocumentCreationWithIntent:(id)a3;
- (void)_instantiateRemoteViewControllerWithCompletion:(id)a3;
- (void)_prepareForPresentingInUIPDocumentLanding;
- (void)_presentActivityViewControllerForItemBookmarks:(id)a3 withPopoverTracker:(id)a4 isContentManaged:(BOOL)a5 additionalActivities:(id)a6 activityProxy:(id)a7;
- (void)_requestAnimationInfoForDocumentAtURL:(id)a3 completion:(id)a4;
- (void)_sendBrowserChange:(id)a3 serviceProxy:(id)a4;
- (void)_sendBrowserLandingModeChangeForReason:(id)a3;
- (void)_sendDocumentLandingDidPickDocumentsAtURLs:(id)a3;
- (void)_setURLCurrentlyBeingImported:(id)a3;
- (void)_showDocumentBrowserViewController:(BOOL)a3;
- (void)_showErrorViewController;
- (void)_updateRemoteBarButtonFrames:(id)a3 forUUID:(id)a4;
- (void)_viewControllerPresentationDidInitiate;
- (void)addDummySplitViewControllerForPreferredContentSize;
- (void)addOperationToServiceQueue:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)clearCurrentOpenInteraction;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)forwardHostSceneIdentifier:(id)a3;
- (void)getTrackingViews:(id *)a3 remoteButtons:(id *)a4 fromBarButtons:(id)a5;
- (void)importDocumentAtURL:(NSURL *)documentURL nextToDocumentAtURL:(NSURL *)neighbourURL mode:(UIDocumentBrowserImportMode)importMode completionHandler:(void *)completion;
- (void)importDocumentAtURL:(id)a3 byMoving:(BOOL)a4 toCurrentBrowserLocationWithCompletion:(id)a5;
- (void)importDocumentAtURL:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5;
- (void)manageOverrideIfNecessaryForPresentationController:(id)a3;
- (void)performBrowserStateChange:(id)a3;
- (void)performBrowserStateChange:(id)a3 animated:(BOOL)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)prepareItemBookmarks:(id)a3 forMode:(unint64_t)a4 usingBookmark:(BOOL)a5 completionBlock:(id)a6;
- (void)prepareItemBookmarks:(id)a3 usingBookmark:(BOOL)a4 completionBlock:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4;
- (void)remoteViewControllerDidTerminateViewServiceWithError:(id)a3;
- (void)renameDocumentAtURL:(NSURL *)documentURL proposedName:(NSString *)proposedName completionHandler:(void *)completionHandler;
- (void)revealDocumentAtURL:(NSURL *)url importIfNeeded:(BOOL)importIfNeeded completion:(void *)completion;
- (void)setActivityViewController:(id)a3;
- (void)setAdditionalLeadingNavigationBarButtonItems:(NSArray *)additionalLeadingNavigationBarButtonItems;
- (void)setAdditionalTrailingNavigationBarButtonItems:(NSArray *)additionalTrailingNavigationBarButtonItems;
- (void)setAllowsDocumentCreation:(BOOL)allowsDocumentCreation;
- (void)setAllowsPickingMultipleItems:(BOOL)allowsPickingMultipleItems;
- (void)setBackgroundColor:(id)a3;
- (void)setBrowserUserInterfaceStyle:(UIDocumentBrowserUserInterfaceStyle)browserUserInterfaceStyle;
- (void)setConfiguration:(id)a3;
- (void)setCustomActions:(NSArray *)customActions;
- (void)setDefaultDocumentAspectRatio:(CGFloat)defaultDocumentAspectRatio;
- (void)setDelegate:(id)delegate;
- (void)setDocumentLandingPresenter:(id)a3;
- (void)setDummySplitViewController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeadingBarButtonTrackingViews:(id)a3;
- (void)setLocalizedCreateDocumentActionTitle:(NSString *)localizedCreateDocumentActionTitle;
- (void)setPreferredUIPBrowserState:(id)a3;
- (void)setRemoteAdditionalLeadingNavigationBarButtonItems:(id)a3;
- (void)setRemoteAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)setRemoteHasReceivedInitialUIPBrowserState:(BOOL)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setServiceProxy:(id)a3;
- (void)setServiceQueue:(id)a3;
- (void)setShouldShowFileExtensions:(BOOL)shouldShowFileExtensions;
- (void)setTrailingBarButtonTrackingViews:(id)a3;
- (void)updateBackgroundColor;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIDocumentBrowserViewController

- (BOOL)allowsPickingMultipleItems
{
  return self->_allowsPickingMultipleItems;
}

- (NSArray)customActions
{
  return self->_customActions;
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return self->_additionalTrailingNavigationBarButtonItems;
}

- (NSArray)additionalLeadingNavigationBarButtonItems
{
  return self->_additionalLeadingNavigationBarButtonItems;
}

- (void)updateBackgroundColor
{
  v2 = self;
  v3 = [(UIDocumentBrowserViewController *)self configuration];
  int v4 = [v3 isPickerUI];

  if (v4)
  {
    if (v2->_isDisplayingRemoteViewController)
    {
      v15 = [MEMORY[0x263F825C8] clearColor];
      v5 = [(UIDocumentBrowserViewController *)v2 viewIfLoaded];
      goto LABEL_16;
    }
    v15 = [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  else
  {
    v6 = [(DOCAppearance *)v2->_appearance backgroundColor];
    uint64_t v7 = [(UIDocumentBrowserViewController *)v2 traitCollection];
    v15 = [v6 resolvedColorWithTraitCollection:v7];

    v2 = v2;
    v8 = [(UIDocumentBrowserViewController *)v2 activePresentationController];
    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();

    if (v7)
    {
      objc_opt_class();
      v9 = v2;
      v10 = v9;
      do
      {
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v11 = [v10 parentViewController];
        if (!v11)
        {
          uint64_t v11 = [v10 presentingViewController];
        }

        v10 = (void *)v11;
      }
      while (v11);

      if (!v10) {
        goto LABEL_15;
      }
      uint64_t v12 = [MEMORY[0x263F825C8] clearColor];
      v13 = v15;
      v15 = (UIDocumentBrowserViewController *)v12;
    }
    else
    {
      v13 = v2;
    }
  }
LABEL_15:
  v5 = [(UIDocumentBrowserViewController *)v2 view];
LABEL_16:
  v14 = v5;
  [v5 setBackgroundColor:v15];
}

- (int64_t)_preferredModalPresentationStyle
{
  v3 = [(UIDocumentBrowserViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6) {
    return 2;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentBrowserViewController;
  return [(UIDocumentBrowserViewController *)&v6 _preferredModalPresentationStyle];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)UIDocumentBrowserViewController;
  [(UIDocumentBrowserViewController *)&v6 viewDidLoad];
  v3 = [(UIDocumentBrowserViewController *)self view];
  [v3 bounds];
  -[UIView setFrame:](self->_trackingViewsContainer, "setFrame:");

  [(UIView *)self->_trackingViewsContainer setAutoresizingMask:18];
  uint64_t v4 = [(UIDocumentBrowserViewController *)self view];
  [v4 addSubview:self->_trackingViewsContainer];

  [(UIDocumentBrowserViewController *)self addDummySplitViewControllerForPreferredContentSize];
  [(UIDocumentBrowserViewController *)self _showDocumentBrowserViewController:0];
  [(UIDocumentBrowserViewController *)self effectiveAppearanceDidChange:self->_appearance];
  if ([(UIDocumentBrowserViewController *)self allowsDocumentCreation])
  {
    v5 = [(UIDocumentBrowserViewController *)self documentCreationController];
    [v5 warnIfNoValidCreationHandler];
  }
}

- (void)addDummySplitViewControllerForPreferredContentSize
{
  id v18 = [(UIDocumentBrowserViewController *)self configuration];
  if ([v18 isPickerUI])
  {
    v3 = [(UIDocumentBrowserViewController *)self dummySplitViewController];

    if (v3) {
      return;
    }
    id v18 = (id)[objc_alloc(MEMORY[0x263F82BE8]) initWithStyle:1];
    uint64_t v4 = [v18 view];
    [v4 setHidden:1];

    v5 = [v18 view];
    [v5 setAutoresizingMask:18];

    objc_super v6 = [(UIDocumentBrowserViewController *)self view];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = [v18 view];
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    objc_msgSend(v18, "set_alwaysAllowsSystemPreferredContentSize:", 1);
    [(UIDocumentBrowserViewController *)self addChildViewController:v18];
    v16 = [(UIDocumentBrowserViewController *)self view];
    v17 = [v18 view];
    [v16 addSubview:v17];

    [v18 didMoveToParentViewController:self];
    [(UIDocumentBrowserViewController *)self setDummySplitViewController:v18];
    [v18 preferredContentSize];
    -[UIDocumentBrowserViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)_showDocumentBrowserViewController:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIDocumentBrowserViewController *)self _clearShownViewControllers];
  [(UIDocumentBrowserViewController *)self _embedDocumentBrowserViewController];
  [(UIDocumentBrowserViewController *)self setAllowsDocumentCreation:[(UIDocumentBrowserViewController *)self allowsDocumentCreation]];
  if (v3)
  {
    [(UIDocumentBrowserViewController *)self effectiveAppearanceDidChange:self->_appearance];
    [(UIDocumentBrowserViewController *)self setEditing:[(UIDocumentBrowserViewController *)self isEditing]];
    [(UIDocumentBrowserViewController *)self setAdditionalLeadingNavigationBarButtonItems:self->_additionalLeadingNavigationBarButtonItems];
    [(UIDocumentBrowserViewController *)self setAdditionalTrailingNavigationBarButtonItems:self->_additionalTrailingNavigationBarButtonItems];
    id v5 = [(UIDocumentBrowserViewController *)self customActions];
    [(UIDocumentBrowserViewController *)self setCustomActions:v5];
  }
}

- (void)setAllowsDocumentCreation:(BOOL)allowsDocumentCreation
{
  if (allowsDocumentCreation)
  {
    uint64_t v4 = [(UIDocumentBrowserViewController *)self documentCreationController];
    int v5 = [v4 hasCreationHandlerWithoutValidatingMethodRequirements];

    if (v5)
    {
      objc_super v6 = [(UIDocumentBrowserViewController *)self documentCreationController];
      [v6 warnIfNoValidCreationHandler];

      double v7 = [(UIDocumentBrowserViewController *)self documentCreationController];
      char v8 = [v7 hasCreationHandlerWithRequiredMethods];
    }
    else
    {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }
  self->_allowsDocumentCreation = v8;
  [(UIDocumentBrowserViewController *)self _updateAppearanceShowsCreateButton];
}

- (void)_embedDocumentBrowserViewController
{
  [(UIDocumentBrowserViewController *)self setContentUnavailableConfiguration:0];
  BOOL v3 = [(UIDocumentBrowserViewController *)self configuration];
  char v4 = [v3 inProcess];

  if ((v4 & 1) == 0)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = MEMORY[0x263EF8330];
    uint64_t v6 = 3221225472;
    double v7 = __70__UIDocumentBrowserViewController__embedDocumentBrowserViewController__block_invoke;
    char v8 = &unk_2641B1148;
    objc_copyWeak(&v9, &location);
    [(UIDocumentBrowserViewController *)self _instantiateRemoteViewControllerWithCompletion:&v5];
    -[UIDocumentBrowserViewController _embedViewController:](self, "_embedViewController:", self->_remoteViewController, v5, v6, v7, v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

- (void)_clearShownViewControllers
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(UIDocumentBrowserViewController *)self childViewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v7 willMoveToParentViewController:0];
        char v8 = [v7 view];
        [v8 removeFromSuperview];

        [v7 removeFromParentViewController];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ([(UIDocumentBrowserViewController *)self allowsDocumentCreation])
    {
      uint64_t v5 = [(UIDocumentBrowserViewController *)self viewIfLoaded];

      if (v5)
      {
        uint64_t v6 = [(UIDocumentBrowserViewController *)self documentCreationController];
        [v6 warnIfNoValidCreationHandler];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)allowsDocumentCreation
{
  return self->_allowsDocumentCreation;
}

- (void)__commonInit
{
  customActions = self->_customActions;
  uint64_t v4 = (NSArray *)MEMORY[0x263EFFA68];
  self->_customActions = (NSArray *)MEMORY[0x263EFFA68];

  additionalLeadingNavigationBarButtonItems = self->_additionalLeadingNavigationBarButtonItems;
  self->_additionalLeadingNavigationBarButtonItems = v4;

  additionalTrailingNavigationBarButtonItems = self->_additionalTrailingNavigationBarButtonItems;
  self->_additionalTrailingNavigationBarButtonItems = v4;

  double v7 = objc_alloc_init(DOCAppearance);
  appearance = self->_appearance;
  self->_appearance = v7;

  [(DOCAppearance *)self->_appearance setShowsCreateButton:1];
  self->_allowsDocumentCreation = 1;
  self->_configuredForUIPDocumentLanding = 0;
  long long v9 = [[DOCDocumentCreationController alloc] initForBrowserViewController:self];
  documentCreationController = self->_documentCreationController;
  self->_documentCreationController = v9;

  id v11 = objc_alloc(MEMORY[0x263F82E00]);
  long long v12 = (UIView *)objc_msgSend(v11, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  trackingViewsContainer = self->_trackingViewsContainer;
  self->_trackingViewsContainer = v12;

  uint64_t v14 = [(UIDocumentBrowserViewController *)self configuration];
  char v15 = [v14 inProcess];

  if ((v15 & 1) == 0)
  {
    v16 = (NSOperationQueue *)objc_opt_new();
    serviceQueue = self->_serviceQueue;
    self->_serviceQueue = v16;

    [(NSOperationQueue *)self->_serviceQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)self->_serviceQueue setSuspended:1];
  }
  id v18 = [MEMORY[0x263F08A00] defaultCenter];
  [v18 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F83318] object:0];

  id v20 = [MEMORY[0x263F82DA0] systemTraitsAffectingColorAppearance];
  id v19 = (id)[(UIDocumentBrowserViewController *)self registerForTraitChanges:v20 withAction:sel_updateForChangedTraitsAffectingColors];
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  uint64_t v4 = (DOCAppearance *)a3;
  unint64_t v5 = [(DOCAppearance *)self->_appearance browserUserInterfaceStyle];
  if (v5 != [(DOCAppearance *)v4 browserUserInterfaceStyle])
  {
    [(UIDocumentBrowserViewController *)self updateBackgroundColor];
    if ((dyld_program_sdk_at_least() & 1) == 0) {
      [(UIDocumentBrowserViewController *)self setNeedsStatusBarAppearanceUpdate];
    }
  }
  appearance = self->_appearance;
  self->_appearance = v4;

  [(UIDocumentBrowserViewController *)self _doc_performRemoteUpdateAppearanceForReason:0];
}

- (BOOL)_updateAppearanceShowsCreateButton
{
  int v3 = [(DOCAppearance *)self->_appearance showsCreateButton];
  int allowsDocumentCreation = self->_allowsDocumentCreation;
  if (allowsDocumentCreation != v3)
  {
    unint64_t v5 = (void *)[(DOCAppearance *)self->_appearance copy];
    [v5 setShowsCreateButton:allowsDocumentCreation != 0];
    [(UIDocumentBrowserViewController *)self effectiveAppearanceDidChange:v5];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__UIDocumentBrowserViewController__updateAppearanceShowsCreateButton__block_invoke;
    v7[3] = &__block_descriptor_33_e88_v24__0___DOCServiceDocumentBrowserViewControllerInterface__8__DOCRemoteViewController_16l;
    char v8 = allowsDocumentCreation;
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v7];
  }
  return allowsDocumentCreation != v3;
}

- (void)_doc_performRemoteUpdateAppearanceForReason:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(UIDocumentBrowserViewController *)self _expectsRemoteViewController])
  {
    if (a3)
    {
      if (a3 == 1)
      {
        if (self->_isDelayingRemotePresentation) {
          return;
        }
        unint64_t v5 = @"Update Coordination";
      }
      else
      {
        unint64_t v5 = @"???";
      }
    }
    else
    {
      if (self->_hasScheduledAppearanceUpdateXPC) {
        return;
      }
      unint64_t v5 = @"Appearance Changed";
    }
    BOOL isDelayingRemotePresentation = self->_isDelayingRemotePresentation;
    if (!isDelayingRemotePresentation)
    {
      self->_BOOL isDelayingRemotePresentation = 1;
      [(UIDocumentBrowserViewController *)self _beginDelayingPresentation:0 cancellationHandler:3.0];
    }
    double v7 = [NSString stringWithFormat:@"scheduling appearance update XPC invocation (reason: %@)", v5];
    char v8 = (NSObject **)MEMORY[0x263F3AC58];
    long long v9 = *MEMORY[0x263F3AC58];
    if (!*MEMORY[0x263F3AC58])
    {
      DOCInitLogging();
      long long v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v7;
      id v11 = v9;
      *(_DWORD *)buf = 136315138;
      uint64_t v17 = [v10 UTF8String];
      _os_log_impl(&dword_21361D000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    self->_hasScheduledAppearanceUpdateXPC = 1;
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke;
    v12[3] = &unk_2641B11C0;
    objc_copyWeak(&v14, (id *)buf);
    double v13 = v5;
    BOOL v15 = !isDelayingRemotePresentation;
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

- (void)addOperationToServiceQueue:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(UIDocumentBrowserViewController *)self configuration];
  char v6 = [v5 inProcess];

  if ((v6 & 1) == 0)
  {
    serviceQueue = self->_serviceQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__UIDocumentBrowserViewController_addOperationToServiceQueue___block_invoke;
    v8[3] = &unk_2641B10D0;
    v8[4] = self;
    id v9 = v4;
    [(NSOperationQueue *)serviceQueue addOperationWithBlock:v8];
  }
}

- (BOOL)_expectsRemoteViewController
{
  v2 = [(UIDocumentBrowserViewController *)self configuration];
  char v3 = [v2 inProcess] ^ 1;

  return v3;
}

- (BOOL)enclosedInUIPDocumentLanding
{
  v2 = [(UIDocumentBrowserViewController *)self configuration];
  char v3 = [v2 isInUIPDocumentLanding];

  return v3;
}

- (DOCConfiguration)configuration
{
  return self->_configuration;
}

- (DOCDocumentCreationController)documentCreationController
{
  return self->_documentCreationController;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)[(_UIResilientRemoteViewContainerViewController *)self->_remoteViewController remoteViewController];
}

- (int64_t)preferredStatusBarStyle
{
  return (dyld_program_sdk_at_least() & 1) == 0
      && [(UIDocumentBrowserViewController *)self browserUserInterfaceStyle] == UIDocumentBrowserUserInterfaceStyleDark;
}

- (UIDocumentBrowserViewController)init
{
  return [(UIDocumentBrowserViewController *)self initForOpeningContentTypes:0];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (_UIDocumentLandingPresenter)documentLandingPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentLandingPresenter);
  return (_UIDocumentLandingPresenter *)WeakRetained;
}

- (void)setCustomActions:(NSArray *)customActions
{
  id v4 = customActions;
  unint64_t v5 = (NSArray *)[(NSArray *)v4 copy];
  char v6 = self->_customActions;
  self->_customActions = v5;

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__UIDocumentBrowserViewController_setCustomActions___block_invoke;
  v8[3] = &unk_2641B10A8;
  id v9 = v4;
  double v7 = v4;
  [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v8];
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (NSObject **)MEMORY[0x263F3AC28];
  char v6 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    char v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_21361D000, v6, OS_LOG_TYPE_DEFAULT, "Application did become active.", v10, 2u);
  }
  double v7 = [(UIDocumentBrowserViewController *)self configuration];
  char v8 = [v7 inProcess];

  if ((v8 & 1) == 0)
  {
    id v9 = [(UIDocumentBrowserViewController *)self presentedViewController];

    if (!v9) {
      [(UIDocumentBrowserViewController *)self _establishFirstResponderOnServiceSideForKeyCommand:0];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIDocumentBrowserViewController;
  [(UIDocumentBrowserViewController *)&v4 viewWillAppear:a3];
  [(UIDocumentBrowserViewController *)self _checkIfObservedUIPPresentationControllerDetentDidChangeForReason:@"initial state check (viewWillAppear)"];
}

- (void)_checkIfObservedUIPPresentationControllerDetentDidChangeForReason:(id)a3
{
  id v8 = a3;
  objc_super v4 = self->_observedUIPPresentationController;
  if (v4)
  {
    int64_t v5 = [(UIDocumentBrowserViewController *)self _currentLandingModeBasedForObservedPresentationController];
    char v6 = [(UIDocumentBrowserViewController *)self preferredUIPBrowserState];
    uint64_t v7 = [v6 documentLandingMode];

    if (v5 != v7) {
      [(UIDocumentBrowserViewController *)self _sendBrowserLandingModeChangeForReason:v8];
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)UIDocumentBrowserViewController;
  id v6 = a3;
  [(UIDocumentBrowserViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  if (v6)
  {
    [(UIDocumentBrowserViewController *)self updateBackgroundColor];
    [(UIDocumentBrowserViewController *)self _beginMonitoringUIPPresentationController];
  }
  else
  {
    [(UIDocumentBrowserViewController *)self _endMonitoringUIPPresentationController];
  }
  uint64_t v7 = [v6 rootViewController];

  if (v7 == self) {
    [(UIDocumentBrowserViewController *)self _doc_endDelayingRemotePresentation];
  }
}

- (void)_beginMonitoringUIPPresentationController
{
  if (self->_configuredForUIPDocumentLanding)
  {
    char v3 = [(UIDocumentBrowserViewController *)self presentationController];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v3 != self->_observedUIPPresentationController)
    {
      [(UIDocumentBrowserViewController *)self _endMonitoringUIPPresentationController];
      objc_storeStrong((id *)&self->_observedUIPPresentationController, v3);
      BOOL v4 = [MEMORY[0x263F08A00] defaultCenter];
      uint64_t v5 = *MEMORY[0x263F83CB8];
      id v6 = [MEMORY[0x263F08A48] mainQueue];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __106__UIDocumentBrowserViewController_DOCUIPPresentationController___beginMonitoringUIPPresentationController__block_invoke;
      v8[3] = &unk_2641B1A50;
      void v8[4] = self;
      id v7 = (id)[v4 addObserverForName:v5 object:v3 queue:v6 usingBlock:v8];

      if ([(UIDocumentBrowserViewController *)self _appearState] - 1 <= 1) {
        [(UIDocumentBrowserViewController *)self _checkIfObservedUIPPresentationControllerDetentDidChangeForReason:@"initial state check"];
      }
    }
  }
}

- (void)_doc_endDelayingRemotePresentation
{
  if (self->_isDelayingRemotePresentation)
  {
    self->_BOOL isDelayingRemotePresentation = 0;
    [(UIDocumentBrowserViewController *)self _endDelayingPresentation];
    if (self->_isDelayingParentPresentation)
    {
      self->_isDelayingParentPresentation = 0;
      char v3 = [(UIDocumentBrowserViewController *)self parentViewController];
      [v3 _endDelayingPresentation];
    }
    [(UIDocumentBrowserViewController *)self _displayRemoteControllerIfNeeded];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  uint64_t isKindOfClass = (uint64_t)a3;
  uint64_t v5 = isKindOfClass;
  if (self->_isDelayingRemotePresentation && !self->_isDelayingParentPresentation)
  {
    id v6 = (void *)isKindOfClass;
    objc_opt_class();
    uint64_t isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v5 = (uint64_t)v6;
    if (isKindOfClass)
    {
      self->_isDelayingParentPresentation = 1;
      uint64_t isKindOfClass = [v6 _beginDelayingPresentation:0 cancellationHandler:3.0];
      uint64_t v5 = (uint64_t)v6;
    }
  }
  MEMORY[0x270F9A758](isKindOfClass, v5);
}

void __82__UIDocumentBrowserViewController_supportsRemovableFileProvidersForConfiguration___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFFA40]);
  id v6 = (id)[v2 initWithSuiteName:*MEMORY[0x263F3AB08]];
  char v3 = [v6 BOOLForKey:@"DOCUserDefaultsKeyForceRemovableFPSupport"];
  char v4 = [*(id *)(a1 + 32) forPickingDownloadsFolder];
  char v5 = v4 ^ 1;
  if ((v4 & 1) == 0 && (v3 & 1) == 0) {
    char v5 = dyld_program_sdk_at_least();
  }
  supportsRemovableFileProvidersForConfiguration__supportsRemovableFileProviders = v5;
}

- (UIDocumentBrowserViewController)initForOpeningContentTypes:(NSArray *)contentTypes
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v4 = contentTypes;
  if (v4)
  {
    char v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSArray count](v4, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = v4;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) identifier];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
  }
  else
  {
    char v5 = 0;
  }
  long long v12 = [(UIDocumentBrowserViewController *)self configurationForOpeningDocumentsWithContentTypes:v5];
  v17.receiver = self;
  v17.super_class = (Class)UIDocumentBrowserViewController;
  double v13 = [(UIDocumentBrowserViewController *)&v17 initWithNibName:0 bundle:0];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_configuration, v12);
    [(UIDocumentBrowserViewController *)v14 __commonInit];
    BOOL v15 = v14;
  }

  return v14;
}

- (UIDocumentBrowserViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if ([v5 isPickerUI] && (objc_msgSend(v5, "shouldIgnoreInteractionMode") & 1) == 0) {
    objc_msgSend(v5, "setSupportsRemovableFileProviders:", -[UIDocumentBrowserViewController supportsRemovableFileProvidersForConfiguration:](self, "supportsRemovableFileProvidersForConfiguration:", v5));
  }
  v10.receiver = self;
  v10.super_class = (Class)UIDocumentBrowserViewController;
  id v6 = [(UIDocumentBrowserViewController *)&v10 initWithNibName:0 bundle:0];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(UIDocumentBrowserViewController *)v7 __commonInit];
    uint64_t v8 = v7;
  }

  return v7;
}

- (id)configurationForOpeningDocumentsWithContentTypes:(id)a3
{
  if (a3)
  {
    char v4 = objc_msgSend(MEMORY[0x263F1D928], "doc_contentTypesForIdentifiers:");
  }
  else
  {
    char v4 = 0;
  }
  id v5 = [MEMORY[0x263F3AB80] configurationForImportingDocumentContentTypes:v4 mode:1];
  objc_msgSend(v5, "setSupportsRemovableFileProviders:", -[UIDocumentBrowserViewController supportsRemovableFileProvidersForConfiguration:](self, "supportsRemovableFileProvidersForConfiguration:", v5));
  id v6 = [(UIDocumentBrowserViewController *)self recentDocumentsContentTypesFromInfoPlist];
  [v5 setRecentDocumentsContentTypes:v6];

  return v5;
}

- (BOOL)supportsRemovableFileProvidersForConfiguration:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__UIDocumentBrowserViewController_supportsRemovableFileProvidersForConfiguration___block_invoke;
  block[3] = &unk_2641B15E8;
  id v9 = v3;
  uint64_t v4 = supportsRemovableFileProvidersForConfiguration__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&supportsRemovableFileProvidersForConfiguration__onceToken, block);
  }
  char v6 = supportsRemovableFileProvidersForConfiguration__supportsRemovableFileProviders;

  return v6;
}

- (id)recentDocumentsContentTypesFromInfoPlist
{
  if (recentDocumentsContentTypesFromInfoPlist_onceToken != -1) {
    dispatch_once(&recentDocumentsContentTypesFromInfoPlist_onceToken, &__block_literal_global_279);
  }
  id v2 = (void *)recentDocumentsContentTypesFromInfoPlist_recentDocumentsContentTypesFromInfoPlist;
  return v2;
}

void __75__UIDocumentBrowserViewController_recentDocumentsContentTypesFromInfoPlist__block_invoke()
{
  v0 = [MEMORY[0x263F086E0] mainBundle];
  id v3 = [v0 objectForInfoDictionaryKey:@"UIDocumentBrowserRecentDocumentContentTypes"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    uint64_t v1 = objc_msgSend(MEMORY[0x263F1D928], "doc_contentTypesForIdentifiers:", v3);
    id v2 = (void *)recentDocumentsContentTypesFromInfoPlist_recentDocumentsContentTypesFromInfoPlist;
    recentDocumentsContentTypesFromInfoPlist_recentDocumentsContentTypesFromInfoPlist = v1;
  }
}

- (CGSize)preferredContentSize
{
  id v3 = [(UIDocumentBrowserViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 6)
  {
    double v5 = 640.0;
    double v6 = 960.0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDocumentBrowserViewController;
    [(UIDocumentBrowserViewController *)&v7 preferredContentSize];
  }
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(NSArray *)additionalTrailingNavigationBarButtonItems
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v5 = additionalTrailingNavigationBarButtonItems;
  objc_storeStrong((id *)&self->_additionalTrailingNavigationBarButtonItems, additionalTrailingNavigationBarButtonItems);
  double v6 = [(UIDocumentBrowserViewController *)self configuration];
  char v7 = [v6 inProcess];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = (NSObject **)MEMORY[0x263F3AC28];
    id v9 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_super v10 = v9;
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = [(NSArray *)v5 count];
      _os_log_impl(&dword_21361D000, v10, OS_LOG_TYPE_INFO, "setAdditionalTrailingNavigationBarButtonItems for %lu button", buf, 0xCu);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = self->_trailingBarButtonTrackingViews;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v14++) removeFromSuperview];
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    id v21 = 0;
    id v22 = 0;
    [(UIDocumentBrowserViewController *)self getTrackingViews:&v22 remoteButtons:&v21 fromBarButtons:v5];
    id v15 = v22;
    id v16 = v22;
    id v17 = v21;
    id v18 = v21;
    objc_storeStrong((id *)&self->_trailingBarButtonTrackingViews, v15);
    objc_storeStrong((id *)&self->_remoteAdditionalTrailingNavigationBarButtonItems, v17);
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __81__UIDocumentBrowserViewController_setAdditionalTrailingNavigationBarButtonItems___block_invoke;
    v19[3] = &unk_2641B1610;
    objc_copyWeak(&v20, (id *)buf);
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(NSArray *)additionalLeadingNavigationBarButtonItems
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v5 = additionalLeadingNavigationBarButtonItems;
  double v6 = (NSObject **)MEMORY[0x263F3AC28];
  char v7 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    char v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = v7;
    *(_DWORD *)buf = 134217984;
    uint64_t v29 = [(NSArray *)v5 count];
    _os_log_impl(&dword_21361D000, v8, OS_LOG_TYPE_INFO, "setAdditionalLeadingNavigationBarButtonItems for %lu buttons", buf, 0xCu);
  }
  objc_storeStrong((id *)&self->_additionalLeadingNavigationBarButtonItems, additionalLeadingNavigationBarButtonItems);
  id v9 = [(UIDocumentBrowserViewController *)self configuration];
  char v10 = [v9 inProcess];

  if ((v10 & 1) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = self->_leadingBarButtonTrackingViews;
    uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v14++) removeFromSuperview];
        }
        while (v12 != v14);
        uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v12);
    }

    id v21 = 0;
    id v22 = 0;
    [(UIDocumentBrowserViewController *)self getTrackingViews:&v22 remoteButtons:&v21 fromBarButtons:v5];
    id v15 = v22;
    id v16 = v22;
    id v17 = v21;
    id v18 = v21;
    objc_storeStrong((id *)&self->_leadingBarButtonTrackingViews, v15);
    objc_storeStrong((id *)&self->_remoteAdditionalLeadingNavigationBarButtonItems, v17);
    objc_initWeak((id *)buf, self);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __80__UIDocumentBrowserViewController_setAdditionalLeadingNavigationBarButtonItems___block_invoke;
    v19[3] = &unk_2641B1610;
    objc_copyWeak(&v20, (id *)buf);
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (UIDocumentBrowserViewController)initForOpeningFilesWithContentTypes:(NSArray *)allowedContentTypes
{
  uint64_t v4 = [(UIDocumentBrowserViewController *)self configurationForOpeningDocumentsWithContentTypes:allowedContentTypes];
  v9.receiver = self;
  v9.super_class = (Class)UIDocumentBrowserViewController;
  double v5 = [(UIDocumentBrowserViewController *)&v9 initWithNibName:0 bundle:0];
  double v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_configuration, v4);
    [(UIDocumentBrowserViewController *)v6 __commonInit];
    char v7 = v6;
  }

  return v6;
}

- (UIDocumentBrowserViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIDocumentBrowserViewController;
  double v5 = [(UIDocumentBrowserViewController *)&v14 initWithCoder:v4];
  if (v5)
  {
    double v6 = (void *)MEMORY[0x263F3AB80];
    char v7 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v8 = [v7 bundleIdentifier];
    uint64_t v9 = [v6 configurationForOpeningDocumentsOfApplicationWithBundleIdentifier:v8];
    configuration = v5->_configuration;
    v5->_configuration = (DOCConfiguration *)v9;

    [(DOCConfiguration *)v5->_configuration setSupportsRemovableFileProviders:[(UIDocumentBrowserViewController *)v5 supportsRemovableFileProvidersForConfiguration:v5->_configuration]];
    [(UIDocumentBrowserViewController *)v5 __commonInit];
    id v11 = [v4 decodeObjectForKey:@"UIDocumentBrowserViewControllerAllowsDocumentCreation"];

    if (v11) {
      v5->_int allowsDocumentCreation = [v4 decodeBoolForKey:@"UIDocumentBrowserViewControllerAllowsDocumentCreation"];
    }
    else {
      v5->_int allowsDocumentCreation = 1;
    }
    v5->_allowsPickingMultipleItems = [v4 decodeBoolForKey:@"UIDocumentBrowserViewControllerAllowsPickingMultipleItems"];
    -[DOCAppearance setBrowserUserInterfaceStyle:](v5->_appearance, "setBrowserUserInterfaceStyle:", (int)[v4 decodeIntForKey:@"UIDocumentBrowserViewControllerBrowserUserInterfaceStyle"]);
    uint64_t v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDocumentBrowserViewController allowsDocumentCreation](self, "allowsDocumentCreation"), @"UIDocumentBrowserViewControllerAllowsDocumentCreation");
  objc_msgSend(v4, "encodeBool:forKey:", -[UIDocumentBrowserViewController allowsPickingMultipleItems](self, "allowsPickingMultipleItems"), @"UIDocumentBrowserViewControllerAllowsPickingMultipleItems");
  objc_msgSend(v4, "encodeInteger:forKey:", -[UIDocumentBrowserViewController browserUserInterfaceStyle](self, "browserUserInterfaceStyle"), @"UIDocumentBrowserViewControllerBrowserUserInterfaceStyle");
}

- (void)performBrowserStateChange:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  DOCRunInMainThread();
}

uint64_t __61__UIDocumentBrowserViewController_performBrowserStateChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBrowserStateChange:*(void *)(a1 + 40) animated:1];
}

- (void)performBrowserStateChange:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  if (self->_configuredForUIPDocumentLanding
    && [MEMORY[0x263F3AB90] _UIPDocLandingInfrastructureEnabled]
    && (self->_serviceProxy || !self->_remoteHasReceivedInitialUIPBrowserState))
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __70__UIDocumentBrowserViewController_performBrowserStateChange_animated___block_invoke;
    v6[3] = &unk_2641B1030;
    objc_copyWeak(&v8, &location);
    id v7 = v5;
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __70__UIDocumentBrowserViewController_performBrowserStateChange_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v7 = objc_loadWeakRetained(&to);

  if (v7)
  {
    objc_copyWeak(&v10, &to);
    id v8 = *(id *)(a1 + 32);
    id v9 = v5;
    DOCRunInMainThread();

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&to);
}

void __70__UIDocumentBrowserViewController_performBrowserStateChange_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _applyBrowserStateChange:*(void *)(a1 + 32) serviceProxy:*(void *)(a1 + 40) animated:1];
}

- (void)setPreferredUIPBrowserState:(id)a3
{
  id v5 = a3;
  if ((-[DOCUIPBrowserState isEqual:](self->_preferredUIPBrowserState, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_preferredUIPBrowserState, a3);
    [(UIDocumentBrowserViewController *)self _updateAppearanceShowsCreateButton];
  }
}

- (void)_applyBrowserStateChange:(id)a3 serviceProxy:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  self->_remoteHasReceivedInitialUIPBrowserState = 1;
  id v10 = [(UIDocumentBrowserViewController *)self sheetPresentationController];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke;
  v22[3] = &unk_2641B1058;
  v22[4] = self;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  id v13 = v10;
  id v25 = v13;
  objc_super v14 = (void (**)(void))MEMORY[0x21668E400](v22);
  id v15 = v14;
  if (v5)
  {
    if (v13)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke_2;
      v20[3] = &unk_2641B1080;
      id v21 = v14;
      [v13 animateChanges:v20];
      id v16 = v21;
    }
    else
    {
      id v17 = (void *)MEMORY[0x263F82E00];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke_3;
      v18[3] = &unk_2641B1080;
      long long v19 = v14;
      [v17 animateWithDuration:v18 animations:0.5];
      id v16 = v19;
    }
  }
  else
  {
    v14[2](v14);
  }
}

uint64_t __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _sendBrowserChange:*(void *)(a1 + 40) serviceProxy:*(void *)(a1 + 48)];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 56), "doc_detentForDocumentLandingMode:", objc_msgSend(*(id *)(a1 + 40), "documentLandingMode"));
  uint64_t v3 = v2;
  if (v2)
  {
    id v6 = (void *)v2;
    id v4 = [*(id *)(a1 + 56) selectedDetentIdentifier];

    uint64_t v3 = (uint64_t)v6;
    if (v4 != v6)
    {
      uint64_t v2 = [*(id *)(a1 + 56) setSelectedDetentIdentifier:v6];
      uint64_t v3 = (uint64_t)v6;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__UIDocumentBrowserViewController__applyBrowserStateChange_serviceProxy_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_sendBrowserChange:(id)a3 serviceProxy:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([v9 documentLandingMode] != -1)
  {
    id v7 = [(UIDocumentBrowserViewController *)self preferredUIPBrowserState];
    id v8 = (void *)[v7 copy];

    objc_msgSend(v8, "setDocumentLandingMode:", objc_msgSend(v9, "documentLandingMode"));
    [(UIDocumentBrowserViewController *)self setPreferredUIPBrowserState:v8];
  }
  [v6 applyBrowserStateChange:v9];
}

- (BOOL)_hasExistingRemoteViewControllerWithInUIPDocumentLanding:(BOOL)a3
{
  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    BOOL v5 = [(DOCRemoteContainerViewController *)remoteViewController configuration];
    char v6 = [v5 isInUIPDocumentLanding];

    LOBYTE(remoteViewController) = v6 ^ a3 ^ 1;
  }
  return (char)remoteViewController;
}

- (void)_didAttachToDocumentLaunchOptionsForUseInUIPDocumentLanding
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_6() description];
  [v3 UTF8String];
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_21361D000, v1, OS_LOG_TYPE_FAULT, "UIDocumentBrowserViewController's view should not be created prior to attaching it to UIDocumentViewControllerLaunchOptions. This can cause undefined document launch UI issues. Consider using .viewIfLoaded (vs .view), or reordering your code for %s. ", v4, 0xCu);
}

- (void)_prepareForPresentingInUIPDocumentLanding
{
  id v3 = [(UIDocumentBrowserViewController *)self configuration];
  char v4 = [v3 inProcess];

  if ((v4 & 1) == 0 && !self->_configuredForUIPDocumentLanding)
  {
    self->_configuredForUIPDocumentLanding = 1;
    [(UIDocumentBrowserViewController *)self _didAttachToDocumentLaunchOptionsForUseInUIPDocumentLanding];
    id v5 = objc_alloc_init(MEMORY[0x263F3ABD0]);
    id v6 = objc_alloc_init(MEMORY[0x263F3ABD0]);

    [v6 setContentMode:-1];
    [v6 setDocumentLandingMode:1];
    [(UIDocumentBrowserViewController *)self setPreferredUIPBrowserState:v6];
    [(UIDocumentBrowserViewController *)self performBrowserStateChange:v6 animated:0];
    [(UIDocumentBrowserViewController *)self _doc_performRemoteUpdateAppearanceForReason:1];
    [(UIDocumentBrowserViewController *)self loadViewIfNeeded];
    [(UIDocumentBrowserViewController *)self _beginMonitoringUIPPresentationController];
  }
}

- (void)_initiateDocumentCreationWithIntent:(id)a3
{
  id v4 = a3;
  if (v4 && self->_serviceProxy)
  {
    id v5 = [(UIDocumentBrowserViewController *)self documentCreationController];
    [v5 setActiveDocumentCreationIntent:v4];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __71__UIDocumentBrowserViewController__initiateDocumentCreationWithIntent___block_invoke;
    v6[3] = &unk_2641B10A8;
    id v7 = v4;
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v6];
  }
}

uint64_t __71__UIDocumentBrowserViewController__initiateDocumentCreationWithIntent___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _initiateDocumentCreationWithIntent:*(void *)(a1 + 32)];
}

- (NSString)_activeDocumentCreationIntent
{
  id v2 = [(UIDocumentBrowserViewController *)self documentCreationController];
  id v3 = [v2 activeDocumentCreationIntent];

  return (NSString *)v3;
}

- (void)_didDenyCreateDocumentSessionWithError:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  DOCRunInMainThread();
}

void __74__UIDocumentBrowserViewController__didDenyCreateDocumentSessionWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) documentCreationController];
  [v2 didDenyCreateDocumentSessionWithError:*(void *)(a1 + 40)];
}

- (void)_requestAnimationInfoForDocumentAtURL:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    id v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"UIDocumentBrowserViewController.m", 550, @"Invalid parameter not satisfying: %@", @"url != nil" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_5:
    id v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"UIDocumentBrowserViewController.m", 551, @"Invalid parameter not satisfying: %@", @"completion != nil" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_5;
  }
LABEL_3:
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke;
  v14[3] = &unk_2641B1120;
  objc_copyWeak(&v17, &location);
  id v10 = v9;
  id v16 = v10;
  id v11 = v7;
  id v15 = v11;
  [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    int v5 = [a1[4] startAccessingSecurityScopedResource];
    id v6 = a1[4];
    v13[0] = 0;
    id v7 = [WeakRetained _sandboxingURLWrapperForURL:v6 readonly:1 error:v13];
    id v8 = v13[0];
    if (v5) {
      [a1[4] stopAccessingSecurityScopedResource];
    }
    if (v7)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_4;
      v10[3] = &unk_2641B10F8;
      id v9 = (id *)v11;
      v11[0] = a1[5];
      [v3 _getAnimationInfoForDocumentAtURL:v7 completion:v10];
    }
    else
    {
      v11[1] = MEMORY[0x263EF8330];
      v11[2] = 3221225472;
      v11[3] = __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_3;
      v11[4] = &unk_2641B1080;
      id v9 = &v12;
      id v12 = a1[5];
      DOCRunInMainThread();
    }
  }
  else
  {
    v13[1] = (id)MEMORY[0x263EF8330];
    v13[2] = (id)3221225472;
    v13[3] = __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_2;
    v13[4] = &unk_2641B1080;
    id v14 = a1[5];
    DOCRunInMainThread();
    id v8 = v14;
  }
}

uint64_t __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  DOCRunInMainThread();
}

uint64_t __84__UIDocumentBrowserViewController__requestAnimationInfoForDocumentAtURL_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83318] object:0];

  [(UIDocumentBrowserViewController *)self _endMonitoringUIPPresentationController];
  v4.receiver = self;
  v4.super_class = (Class)UIDocumentBrowserViewController;
  [(UIDocumentBrowserViewController *)&v4 dealloc];
}

- (void)_viewControllerPresentationDidInitiate
{
  if ([(UIDocumentBrowserViewController *)self _expectsRemoteViewController])
  {
    [(UIDocumentBrowserViewController *)self loadViewIfNeeded];
  }
}

- (void)_ensurePreparedForAPIRequringXPC
{
  if ([(UIDocumentBrowserViewController *)self _expectsRemoteViewController])
  {
    if ([MEMORY[0x263F3AB90] _UIPDocLandingInfrastructureEnabled]
      && ([(UIDocumentBrowserViewController *)self documentLandingPresenter],
          id v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      [(UIDocumentBrowserViewController *)self _ensurePreparedForAPIRequringXPC_asUIP];
    }
    else
    {
      [(UIDocumentBrowserViewController *)self _ensurePreparedForAPIRequringXPC_asLegacy];
    }
  }
}

- (void)_ensurePreparedForAPIRequringXPC_asUIP
{
  if (![(UIDocumentBrowserViewController *)self isViewLoaded]
    || !self->_configuredForUIPDocumentLanding)
  {
    [(UIDocumentBrowserViewController *)self _prepareForPresentingInUIPDocumentLanding];
  }
}

- (void)_ensurePreparedForAPIRequringXPC_asLegacy
{
  if (([(UIDocumentBrowserViewController *)self isViewLoaded] & 1) == 0)
  {
    [(UIDocumentBrowserViewController *)self loadViewIfNeeded];
  }
}

void __70__UIDocumentBrowserViewController__embedDocumentBrowserViewController__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      id v10 = (NSObject **)MEMORY[0x263F3AC28];
      id v11 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        id v11 = *v10;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __70__UIDocumentBrowserViewController__embedDocumentBrowserViewController__block_invoke_cold_1();
      }
      [v9 remoteViewControllerDidTerminateViewServiceWithError:v7];
    }
    else
    {
      [WeakRetained setServiceProxy:v6];
      [v9 _displayRemoteControllerIfNeeded];
    }
  }
}

- (void)_instantiateRemoteViewControllerWithCompletion:(id)a3
{
  id v4 = a3;
  [(NSOperationQueue *)self->_serviceQueue setSuspended:1];
  self->_isDisplayingRemoteViewController = 0;
  id v5 = [(UIDocumentBrowserViewController *)self configuration];
  int v6 = [v5 isPickerUI];

  if (v6) {
    [(UIDocumentBrowserViewController *)self updateBackgroundColor];
  }
  objc_initWeak(&location, self);
  id v7 = [(UIDocumentBrowserViewController *)self preferredUIPBrowserState];
  self->_remoteHasReceivedInitialUIPBrowserState = v7 != 0;
  id v8 = [(UIDocumentBrowserViewController *)self configuration];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __82__UIDocumentBrowserViewController__instantiateRemoteViewControllerWithCompletion___block_invoke;
  v13[3] = &unk_2641B1170;
  objc_copyWeak(&v15, &location);
  id v9 = v4;
  id v14 = v9;
  id v10 = +[DOCRemoteViewController instantiateRemoteDocumentBrowserViewControllerWithHostProxy:self configuration:v8 initialUIPBrowserState:v7 completionBlock:v13];
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = v10;

  id v12 = [(DOCRemoteContainerViewController *)self->_remoteViewController view];
  [v12 setAlpha:0.0];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __82__UIDocumentBrowserViewController__instantiateRemoteViewControllerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [v11 setDelegate:WeakRetained];
    id v10 = [WeakRetained serviceQueue];
    [v10 setSuspended:0];
  }
}

- (void)_embedViewController:(id)a3
{
  id v17 = a3;
  id v4 = [v17 view];
  [v4 setAutoresizingMask:18];

  id v5 = [(UIDocumentBrowserViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [v17 view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  [(UIDocumentBrowserViewController *)self addChildViewController:v17];
  id v15 = [(UIDocumentBrowserViewController *)self view];
  id v16 = [v17 view];
  [v15 addSubview:v16];

  [v17 didMoveToParentViewController:self];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UIDocumentBrowserViewController;
  id v4 = a3;
  [(UIDocumentBrowserViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  objc_msgSend(v4, "preferredContentSize", v9.receiver, v9.super_class);
  double v6 = v5;
  double v8 = v7;

  -[UIDocumentBrowserViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
}

- (void)_displayRemoteControllerIfNeeded
{
  if (!self->_isDisplayingRemoteViewController && !self->_isDelayingRemotePresentation && self->_serviceProxy)
  {
    id v3 = (NSObject **)MEMORY[0x263F3AC28];
    id v4 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_21361D000, v4, OS_LOG_TYPE_DEFAULT, "Displaying remote controller", v16, 2u);
    }
    self->_isDisplayingRemoteViewController = 1;
    [(UIDocumentBrowserViewController *)self updateBackgroundColor];
    double v5 = [(DOCRemoteContainerViewController *)self->_remoteViewController view];
    [v5 setAlpha:1.0];

    double v6 = [(UIDocumentBrowserViewController *)self view];
    double v7 = [v6 window];
    double v8 = [v7 windowScene];
    objc_super v9 = [v8 session];
    double v10 = [v9 persistentIdentifier];

    if (v10)
    {
      double v11 = [(UIDocumentBrowserViewController *)self view];
      double v12 = [v11 window];
      double v13 = [v12 windowScene];
      id v14 = [v13 session];
      id v15 = [v14 persistentIdentifier];
      [(UIDocumentBrowserViewController *)self forwardHostSceneIdentifier:v15];
    }
  }
}

void __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v7 = *(id *)(a1 + 32);
  id v8 = v6;
  char v10 = *(unsigned char *)(a1 + 48);
  DOCRunInMainThread();

  objc_destroyWeak(&v9);
}

void __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = [NSString stringWithFormat:@"invoking appearance update XPC invocation (reason: %@)", *(void *)(a1 + 32)];
    id v4 = (NSObject **)MEMORY[0x263F3AC58];
    id v5 = *MEMORY[0x263F3AC58];
    if (!*MEMORY[0x263F3AC58])
    {
      DOCInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v3;
      id v7 = v5;
      *(_DWORD *)buf = 136315138;
      uint64_t v16 = [v6 UTF8String];
      _os_log_impl(&dword_21361D000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
    WeakRetained[979] = 0;
    id v8 = (void *)*((void *)WeakRetained + 124);
    uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_111;
    v12[3] = &unk_2641B0FE0;
    char v10 = *(void **)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    id v14 = WeakRetained;
    id v11 = v8;
    [v10 updateAppearance:v11 shouldFlushCA:1 requiresAck:v9 completionBlock:v12];
  }
}

void __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_111(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_2_112;
  v2[3] = &unk_2641B0FE0;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __79__UIDocumentBrowserViewController__doc_performRemoteUpdateAppearanceForReason___block_invoke_2_112(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = [NSString stringWithFormat:@"got appearance update XPC infocation (reason: %@)", *(void *)(a1 + 32)];
  id v3 = (NSObject **)MEMORY[0x263F3AC58];
  id v4 = *MEMORY[0x263F3AC58];
  if (!*MEMORY[0x263F3AC58])
  {
    DOCInitLogging();
    id v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v2;
    id v6 = v4;
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = [v5 UTF8String];
    _os_log_impl(&dword_21361D000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "_doc_endDelayingRemotePresentation");
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIDocumentBrowserViewController;
  -[UIDocumentBrowserViewController setEditing:animated:](&v10, sel_setEditing_animated_);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__UIDocumentBrowserViewController_setEditing_animated___block_invoke;
  v7[3] = &__block_descriptor_34_e88_v24__0___DOCServiceDocumentBrowserViewControllerInterface__8__DOCRemoteViewController_16l;
  BOOL v8 = a3;
  BOOL v9 = a4;
  [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v7];
}

void __55__UIDocumentBrowserViewController_setEditing_animated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v3 = v4;
  DOCRunInMainThread();
}

uint64_t __55__UIDocumentBrowserViewController_setEditing_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditing:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41)];
}

- (void)revealDocumentAtURL:(NSURL *)url importIfNeeded:(BOOL)importIfNeeded completion:(void *)completion
{
  BOOL v9 = url;
  objc_super v10 = completion;
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = &__block_literal_global_1;
  }
  if (!v9)
  {
    id v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UIDocumentBrowserViewController.m" lineNumber:974 description:@"revealDocumentAtURL:importIfNeeded:completion: should not be called with a nil url"];
  }
  objc_initWeak(&location, self);
  [(UIDocumentBrowserViewController *)self _ensurePreparedForAPIRequringXPC];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2;
  v15[3] = &unk_2641B13B8;
  objc_copyWeak(&v18, &location);
  id v12 = v11;
  id v17 = v12;
  id v13 = v9;
  uint64_t v16 = v13;
  BOOL v19 = importIfNeeded;
  [(UIDocumentBrowserViewController *)self dismissAllPresentedViewControllers:1 completion:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_3;
  v4[3] = &unk_2641B1390;
  objc_copyWeak(&v7, v2);
  id v6 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 56);
  [WeakRetained addOperationToServiceQueue:v4];

  objc_destroyWeak(&v7);
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    char v46 = 0;
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_4;
    v37[3] = &unk_2641B1278;
    v39 = v45;
    id v38 = *(id *)(a1 + 40);
    v40 = &v41;
    char v8 = (void *)MEMORY[0x21668E400](v37);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_123;
    v35[3] = &unk_2641B12C8;
    id v9 = v8;
    id v36 = v9;
    objc_super v10 = (void (**)(void, void))MEMORY[0x21668E400](v35);
    id v11 = v10;
    if (v5)
    {
      id v25 = v6;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_127;
      v31[3] = &unk_2641B1340;
      id v12 = v10;
      id v33 = v12;
      id v13 = WeakRetained;
      id v32 = v13;
      id v34 = v9;
      id v14 = (void *)MEMORY[0x21668E400](v31);
      id v15 = [*(id *)(a1 + 32) absoluteString];
      int v16 = [v15 isEqualToString:UIDocumentBrowserDownloadsFolderPlaceholderPath];

      if (v16)
      {
        id v17 = [v5 remoteObjectProxyWithErrorHandler:v12];
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_132;
        v29[3] = &unk_2641B1368;
        id v30 = v14;
        [v17 _revealSymbolicLocation:0 completion:v29];
        id v18 = v30;
      }
      else
      {
        char v21 = [*(id *)(a1 + 32) startAccessingSecurityScopedResource];
        *((unsigned char *)v42 + 24) = v21;
        uint64_t v22 = *(void *)(a1 + 32);
        id v28 = 0;
        id v18 = [v13 _sandboxingURLWrapperForURL:v22 readonly:1 error:&v28];
        id v17 = v28;
        if (v18)
        {
          id v23 = [v5 remoteObjectProxyWithErrorHandler:v12];
          uint64_t v24 = *(unsigned __int8 *)(a1 + 56);
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_133;
          v26[3] = &unk_2641B1368;
          id v27 = v14;
          [v23 _revealDocumentAtURL:v18 importIfNeeded:v24 completion:v26];
        }
        else
        {
          (*((void (**)(id, id))v12 + 2))(v12, v17);
        }
      }

      id v6 = v25;
    }
    else
    {
      BOOL v19 = (NSObject **)MEMORY[0x263F3AC28];
      id v20 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        id v20 = *v19;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_3_cold_1();
      }
      v11[2](v11, 0);
    }

    _Block_object_dispose(&v41, 8);
    _Block_object_dispose(v45, 8);
  }
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  long long v10 = *(_OWORD *)(a1 + 32);
  id v7 = (id)v10;
  id v11 = v6;
  id v8 = v6;
  id v9 = v5;
  DOCRunInMainThread();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_5(void *a1)
{
  uint64_t v1 = *(void *)(a1[7] + 8);
  if (*(unsigned char *)(v1 + 24))
  {
    id v2 = (NSObject **)MEMORY[0x263F3AC28];
    id v3 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_5_cold_1();
    }
  }
  else
  {
    *(unsigned char *)(v1 + 24) = 1;
    (*(void (**)(void))(a1[6] + 16))();
    uint64_t v5 = *(void *)(a1[8] + 8);
    if (*(unsigned char *)(v5 + 24))
    {
      *(unsigned char *)(v5 + 24) = 0;
      id v6 = (void *)a1[4];
      [v6 stopAccessingSecurityScopedResource];
    }
  }
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_123(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  DOCRunInMainThread();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_124(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.DocumentManager" code:1 userInfo:0];
  }
  id v4 = v3;
  id v5 = (NSObject **)MEMORY[0x263F3AC28];
  id v6 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    id v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_124_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_127(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v10 = a1[5];
  id v9 = a1[4];
  id v11 = a1[6];
  id v6 = v5;
  id v7 = v8;
  DOCRunInMainThread();
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_128(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    id v3 = (NSObject **)MEMORY[0x263F3AC28];
    id v4 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_128_cold_1();
    }
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) configuration];
    uint64_t v7 = [v6 interactionModeForPreparing];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_129;
    v8[3] = &unk_2641B12F0;
    id v10 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 64);
    id v9 = *(id *)(a1 + 40);
    [v5 prepareForMode:v7 usingBookmark:1 completionBlock:v8];
  }
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_129(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v6 = [*(id *)(a1 + 32) fileURL];
    (*(void (**)(uint64_t, id, void))(v3 + 16))(v3, v6, 0);
  }
  else
  {
    id v4 = (NSObject **)MEMORY[0x263F3AC28];
    id v5 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_129_cold_1();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_132(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_133(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    [(UIDocumentBrowserViewController *)self clearCurrentOpenInteraction];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15.receiver = self;
    v15.super_class = (Class)UIDocumentBrowserViewController;
    [(UIDocumentBrowserViewController *)&v15 presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__UIDocumentBrowserViewController_presentViewController_animated_completion___block_invoke;
    v10[3] = &unk_2641B13E0;
    id v11 = v8;
    BOOL v14 = v6;
    id v12 = self;
    id v13 = v9;
    [(UIDocumentBrowserViewController *)self dismissAllPresentedViewControllers:v6 completion:v10];
  }
}

void __77__UIDocumentBrowserViewController_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 48);
  DOCRunInMainThread();
}

id __77__UIDocumentBrowserViewController_presentViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 48);
  v5.receiver = *(id *)(a1 + 40);
  v5.super_class = (Class)UIDocumentBrowserViewController;
  return objc_msgSendSuper2(&v5, sel_presentViewController_animated_completion_, v1, v2, v3);
}

- (void)dismissAllPresentedViewControllers:(BOOL)a3 completion:(id)a4
{
  BOOL v6 = (void (**)(void))a4;
  if ([(UIDocumentBrowserViewController *)self _expectsRemoteViewController])
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __81__UIDocumentBrowserViewController_dismissAllPresentedViewControllers_completion___block_invoke;
    v7[3] = &unk_2641B1408;
    BOOL v9 = a3;
    id v8 = v6;
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v7];
  }
  else
  {
    v6[2](v6);
  }
}

void __81__UIDocumentBrowserViewController_dismissAllPresentedViewControllers_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __81__UIDocumentBrowserViewController_dismissAllPresentedViewControllers_completion___block_invoke_2;
  v4[3] = &unk_2641B1080;
  id v5 = *(id *)(a1 + 32);
  [a2 _dismissAllPresentedViewControllers:v3 completion:v4];
}

uint64_t __81__UIDocumentBrowserViewController_dismissAllPresentedViewControllers_completion___block_invoke_2()
{
  return DOCRunInMainThread();
}

- (void)_beginTransitionCoordinatorSessionForDocumentURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(UIDocumentBrowserTransitionController *)self->_uipTransitionCoordinator isCoordinatingForURL:v4])
  {
    id v5 = (NSObject **)MEMORY[0x263F3AC28];
    BOOL v6 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      BOOL v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_21361D000, v6, OS_LOG_TYPE_INFO, "Beginning UIP transition to open document: %@", buf, 0xCu);
    }
    uint64_t v7 = [UIDocumentBrowserTransitionController alloc];
    serviceProxy = self->_serviceProxy;
    BOOL v9 = [(UIDocumentBrowserViewController *)self view];
    id v10 = [(UIDocumentBrowserTransitionController *)v7 initWithItemURL:v4 documentBrowserProxy:serviceProxy referenceView:v9];

    objc_storeStrong((id *)&self->_uipTransitionCoordinator, v10);
    dispatch_time_t v11 = dispatch_time(0, 30000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__UIDocumentBrowserViewController__beginTransitionCoordinatorSessionForDocumentURL___block_invoke;
    block[3] = &unk_2641B1430;
    void block[4] = self;
    BOOL v14 = v10;
    id v15 = v4;
    id v12 = v10;
    dispatch_after(v11, MEMORY[0x263EF83A0], block);
  }
}

uint64_t __84__UIDocumentBrowserViewController__beginTransitionCoordinatorSessionForDocumentURL___block_invoke(uint64_t result)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(result + 32) + 1008) == *(void *)(result + 40))
  {
    uint64_t v1 = result;
    uint64_t v2 = (NSObject **)MEMORY[0x263F3AC28];
    uint64_t v3 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      uint64_t v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(v1 + 48);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_21361D000, v3, OS_LOG_TYPE_INFO, "Timeout waiting for UIP transition to open document: %@", (uint8_t *)&v5, 0xCu);
    }
    return [*(id *)(v1 + 32) _endTransitionCoordinatorSession];
  }
  return result;
}

- (void)_endTransitionCoordinatorSession
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (self->_uipTransitionCoordinator)
  {
    uint64_t v3 = (NSObject **)MEMORY[0x263F3AC28];
    uint64_t v4 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      uint64_t v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uipTransitionCoordinator = self->_uipTransitionCoordinator;
      uint64_t v6 = v4;
      uint64_t v7 = [(UIDocumentBrowserTransitionController *)uipTransitionCoordinator itemURL];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_21361D000, v6, OS_LOG_TYPE_INFO, "Ending UIP transition to open document: %@", (uint8_t *)&v9, 0xCu);
    }
    [(UIDocumentBrowserTransitionController *)self->_uipTransitionCoordinator setLoadingProgress:0];
    [(UIDocumentBrowserTransitionController *)self->_uipTransitionCoordinator setTargetView:0];
    id v8 = self->_uipTransitionCoordinator;
    self->_uipTransitionCoordinator = 0;

    [(UIDocumentBrowserViewController *)self clearCurrentOpenInteraction];
  }
}

- (UIDocumentBrowserTransitionController)transitionControllerForDocumentAtURL:(NSURL *)documentURL
{
  uint64_t v4 = documentURL;
  uipTransitionCoordinator = self->_uipTransitionCoordinator;
  if (uipTransitionCoordinator
    && [(UIDocumentBrowserTransitionController *)uipTransitionCoordinator isCoordinatingForURL:v4])
  {
    uint64_t v6 = self->_uipTransitionCoordinator;
  }
  else
  {
    uint64_t v7 = [UIDocumentBrowserTransitionController alloc];
    serviceProxy = self->_serviceProxy;
    int v9 = [(UIDocumentBrowserViewController *)self view];
    uint64_t v6 = [(UIDocumentBrowserTransitionController *)v7 initWithItemURL:v4 documentBrowserProxy:serviceProxy referenceView:v9];
  }
  return v6;
}

- (void)importDocumentAtURL:(NSURL *)documentURL nextToDocumentAtURL:(NSURL *)neighbourURL mode:(UIDocumentBrowserImportMode)importMode completionHandler:(void *)completion
{
  id v10 = completion;
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = &__block_literal_global_139;
  }
  id v12 = v11;
  -[UIDocumentBrowserViewController _importDocumentAtURL:neighbourURL:mode:completionHandler:](self, "_importDocumentAtURL:neighbourURL:mode:completionHandler:", documentURL, neighbourURL, importMode);
}

- (void)importDocumentAtURL:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
}

- (void)importDocumentAtURL:(id)a3 byMoving:(BOOL)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  if (a4) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [(UIDocumentBrowserViewController *)self _importDocumentAtURL:a3 neighbourURL:0 mode:v6 completionHandler:a5];
}

- (void)_importDocumentAtURL:(id)a3 neighbourURL:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(UIDocumentBrowserViewController *)self configuration];
  char v14 = [v13 inProcess];

  if (v14)
  {
    if (v11) {
      [(UIDocumentBrowserViewController *)self importDocumentAtURL:v10 nextToDocumentAtURL:v11 mode:a5 completionHandler:v12];
    }
    else {
      [(UIDocumentBrowserViewController *)self importDocumentAtURL:v10 mode:a5 toCurrentBrowserLocationWithCompletion:v12];
    }
  }
  else
  {
    objc_initWeak(&location, self);
    [(UIDocumentBrowserViewController *)self _ensurePreparedForAPIRequringXPC];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke;
    v15[3] = &unk_2641B1520;
    objc_copyWeak(v19, &location);
    BOOL v20 = a5 == 2;
    id v16 = v10;
    id v18 = v12;
    id v17 = v11;
    v19[1] = (id)a5;
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v15];

    objc_destroyWeak(v19);
    objc_destroyWeak(&location);
  }
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = *(unsigned char *)(a1 + 72) == 0;
    uint64_t v7 = *(void *)(a1 + 32);
    v50[0] = 0;
    id v8 = [WeakRetained _sandboxingURLWrapperForURL:v7 readonly:v6 error:v50];
    id v9 = v50[0];
    if (v8)
    {
      v47[0] = MEMORY[0x263EF8330];
      v47[1] = 3221225472;
      v47[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2;
      v47[3] = &unk_2641B14A8;
      id v48 = *(id *)(a1 + 48);
      char v49 = *(unsigned char *)(a1 + 72);
      id v10 = (void *)MEMORY[0x21668E400](v47);
      id v11 = *(void **)(a1 + 40);
      if (v11)
      {
        char v12 = [v11 startAccessingSecurityScopedResource];
        uint64_t v13 = *(void *)(a1 + 40);
        id v46 = 0;
        uint64_t v25 = [v5 _sandboxingURLWrapperForURL:v13 readonly:1 error:&v46];
        id v14 = v46;
        if (v14)
        {
          uint64_t v38 = MEMORY[0x263EF8330];
          uint64_t v39 = 3221225472;
          v40 = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_141;
          uint64_t v41 = &unk_2641B13E0;
          uint64_t v24 = &v42;
          id v42 = *(id *)(a1 + 40);
          id v15 = &v44;
          id v44 = v10;
          id v43 = v14;
          char v45 = v12;
          DOCRunInMainThread();
          id v16 = v43;
          id v17 = (void *)v25;
        }
        else
        {
          v34[0] = MEMORY[0x263EF8330];
          v34[1] = 3221225472;
          v34[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_142;
          v34[3] = &unk_2641B14D0;
          uint64_t v24 = &v36;
          id v21 = v10;
          id v36 = v21;
          char v37 = v12;
          id v35 = *(id *)(a1 + 40);
          id v16 = [v3 remoteObjectProxyWithErrorHandler:v34];
          objc_storeStrong(v5 + 125, *(id *)(a1 + 32));
          uint64_t v23 = *(void *)(a1 + 64);
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_143;
          v30[3] = &unk_2641B14F8;
          id v22 = v21;
          id v15 = &v35;
          id v32 = v22;
          char v33 = v12;
          id v31 = *(id *)(a1 + 40);
          id v17 = (void *)v25;
          [v16 _importDocumentAtURLWrapper:v8 nextToDocumentAtURLWrapper:v25 mode:v23 completionHandler:v30];
        }
      }
      else
      {
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_3_144;
        v28[3] = &unk_2641B12C8;
        id v18 = v10;
        id v29 = v18;
        BOOL v19 = [v3 remoteObjectProxyWithErrorHandler:v28];
        objc_storeStrong(v5 + 125, *(id *)(a1 + 32));
        uint64_t v20 = *(void *)(a1 + 64);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_4;
        v26[3] = &unk_2641B1368;
        id v27 = v18;
        [v19 _importDocumentAtURLWrapper:v8 mode:v20 toCurrentBrowserLocationWithCompletion:v26];

        id v14 = v29;
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (*(void *)(a1 + 32))
  {
    id v8 = v6;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    DOCRunInMainThread();
  }
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32) || !*(void *)(a1 + 40))
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v2();
  }
  else
  {
    id v3 = (NSObject **)MEMORY[0x263F3AC28];
    uint64_t v4 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      uint64_t v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21361D000, v4, OS_LOG_TYPE_INFO, "prepareForMode: _importDocumentAtURL with usingBookmark == YES", buf, 2u);
    }
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 2;
    }
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_140;
    v7[3] = &unk_2641B1458;
    id v6 = *(void **)(a1 + 40);
    id v9 = *(id *)(a1 + 48);
    id v8 = *(id *)(a1 + 40);
    [v6 prepareForMode:v5 usingBookmark:1 completionBlock:v7];
  }
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_140(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (a2)
  {
    id v5 = [*(id *)(a1 + 32) fileURL];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v5, 0);
  }
  else
  {
    id v3 = *(void (**)(uint64_t, void, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 40);
    v3(v4, 0, 0);
  }
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_141(uint64_t a1)
{
  uint64_t v2 = (NSObject **)MEMORY[0x263F3AC28];
  id v3 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_141_cold_1();
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  if (*(unsigned char *)(a1 + 56)) {
    return [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  return result;
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_142(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 stopAccessingSecurityScopedResource];
  }
  return result;
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_143(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 stopAccessingSecurityScopedResource];
  }
  return result;
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_3_144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)UIDocumentBrowserViewController;
  id v7 = a4;
  -[UIDocumentBrowserViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  void v8[4] = self;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_2641B1548;
  v9[4] = self;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_2641B1548;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

uint64_t __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkIfObservedUIPPresentationControllerDetentDidChangeForReason:@"View did transition to new size"];
}

void __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) activityViewController];

  if (v4)
  {
    id v5 = (NSObject **)MEMORY[0x263F3AC28];
    id v6 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21361D000, v6, OS_LOG_TYPE_DEFAULT, "viewWillTransitionToSize performed with the activity VC on screen. Asking for new frames.", (uint8_t *)buf, 2u);
    }
    id v7 = [*(id *)(a1 + 32) activityViewController];
    objc_initWeak(buf, *(id *)(a1 + 32));
    id v8 = [*(id *)(a1 + 32) activityViewController];
    id v9 = [v8 popoverTracker];

    objc_super v10 = *(void **)(a1 + 32);
    if (v9)
    {
      id v11 = [v10 activityViewController];
      char v12 = [v11 popoverTracker];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      id v19[2] = __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_156;
      v19[3] = &unk_2641B1598;
      id v20 = v7;
      objc_copyWeak(&v21, buf);
      [v12 getFrameForRegion:0 waitForNewThumbnail:0 completionBlock:v19];

      objc_destroyWeak(&v21);
      uint64_t v13 = v20;
    }
    else
    {
      id v14 = [v10 activityViewController];
      id v15 = [v14 barButtonItem];

      if (!v15)
      {
LABEL_11:
        objc_destroyWeak(buf);

        goto LABEL_12;
      }
      uint64_t v13 = [*(id *)(a1 + 32) activityViewController];
      id v16 = [v13 barButtonItem];
      id v17 = [*(id *)(a1 + 32) activityViewController];
      id v18 = [v17 popoverPresentationController];
      [v18 setBarButtonItem:v16];
    }
    goto LABEL_11;
  }
LABEL_12:
}

void __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_156(uint64_t a1, double a2, double a3, double a4, double a5)
{
  id v10 = *(id *)(a1 + 32);
  v11[1] = *(id *)&a2;
  v11[2] = *(id *)&a3;
  v11[3] = *(id *)&a4;
  v11[4] = *(id *)&a5;
  objc_copyWeak(v11, (id *)(a1 + 40));
  DOCRunInMainThread();
  objc_destroyWeak(v11);
}

void __86__UIDocumentBrowserViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2_157(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v2 = (NSObject **)MEMORY[0x263F3AC28];
  id v3 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    id v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = v3;
    id v6 = [v4 popoverPresentationController];
    [v6 sourceRect];
    id v7 = NSStringFromCGRect(v21);
    id v8 = NSStringFromCGRect(*(CGRect *)(a1 + 48));
    int v14 = 138412802;
    id v15 = v4;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    BOOL v19 = v8;
    _os_log_impl(&dword_21361D000, v5, OS_LOG_TYPE_DEFAULT, "new popover location retrieved updating location on targetController %@ from: %@ to: %@", (uint8_t *)&v14, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v10 = [*(id *)(a1 + 32) popoverPresentationController];
    objc_msgSend(v10, "setSourceRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    id v11 = [v10 barButtonItem];
    if (v11)
    {
    }
    else
    {
      char v12 = [v10 sourceView];

      if (!v12)
      {
LABEL_10:

        goto LABEL_11;
      }
    }
    uint64_t v13 = [*(id *)(a1 + 32) popoverPresentationController];
    [v13 containerViewWillLayoutSubviews];

    goto LABEL_10;
  }
LABEL_11:
}

- (void)remoteViewControllerDidTerminateViewServiceWithError:(id)a3
{
  id v4 = a3;
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  serviceProxy = self->_serviceProxy;
  self->_serviceProxy = 0;

  [(NSOperationQueue *)self->_serviceQueue setSuspended:1];
  id v7 = (NSObject **)MEMORY[0x263F3AC28];
  if (self->_urlCurrentlyBeingImported)
  {
    id v8 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[UIDocumentBrowserViewController remoteViewControllerDidTerminateViewServiceWithError:]();
    }
    [(UIDocumentBrowserViewController *)self _failedToImportDocumentAtURL:self->_urlCurrentlyBeingImported error:v4];
    urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
    self->_urlCurrentlyBeingImported = 0;
  }
  id v10 = [MEMORY[0x263EFF910] date];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  id v19[2] = __88__UIDocumentBrowserViewController_remoteViewControllerDidTerminateViewServiceWithError___block_invoke;
  v19[3] = &unk_2641B15C0;
  id v11 = v10;
  id v20 = v11;
  char v12 = (double (**)(void))MEMORY[0x21668E400](v19);
  double v13 = v12[2]();
  if (DOCViewServiceRecoveryAttemptTimeThreshold_onceToken != -1) {
    dispatch_once(&DOCViewServiceRecoveryAttemptTimeThreshold_onceToken, &__block_literal_global_746);
  }
  if (v13 <= *(double *)&DOCViewServiceRecoveryAttemptTimeThreshold_interval) {
    uint64_t v14 = remoteViewControllerDidTerminateViewServiceWithError__remoteViewControllerRecoveryAttempts + 1;
  }
  else {
    uint64_t v14 = 1;
  }
  remoteViewControllerDidTerminateViewServiceWithError__remoteViewControllerRecoveryAttempts = v14;
  objc_storeStrong((id *)&remoteViewControllerDidTerminateViewServiceWithError__lastRemoteViewControllerRecoveryAttempt, v10);
  id v15 = *v7;
  if ((unint64_t)remoteViewControllerDidTerminateViewServiceWithError__remoteViewControllerRecoveryAttempts < 4)
  {
    if (!v15)
    {
      DOCInitLogging();
      id v15 = *v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[UIDocumentBrowserViewController remoteViewControllerDidTerminateViewServiceWithError:]();
    }
    [(UIDocumentBrowserViewController *)self _clearShownViewControllers];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __88__UIDocumentBrowserViewController_remoteViewControllerDidTerminateViewServiceWithError___block_invoke_161;
    v18[3] = &unk_2641B15E8;
    void v18[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v18);
  }
  else
  {
    if (!v15)
    {
      DOCInitLogging();
      id v15 = *v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[UIDocumentBrowserViewController remoteViewControllerDidTerminateViewServiceWithError:]();
    }
    __int16 v16 = [(UIDocumentBrowserViewController *)self configuration];
    int v17 = [v16 isPickerUI];

    if (v17) {
      [(UIDocumentBrowserViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
    else {
      [(UIDocumentBrowserViewController *)self _showErrorViewController];
    }
  }
}

double __88__UIDocumentBrowserViewController_remoteViewControllerDidTerminateViewServiceWithError___block_invoke(uint64_t a1)
{
  if (remoteViewControllerDidTerminateViewServiceWithError__lastRemoteViewControllerRecoveryAttempt)
  {
    id v2 = (id)remoteViewControllerDidTerminateViewServiceWithError__lastRemoteViewControllerRecoveryAttempt;
  }
  else
  {
    id v2 = [MEMORY[0x263EFF910] distantPast];
  }
  id v3 = v2;
  [*(id *)(a1 + 32) timeIntervalSinceDate:v2];
  double v5 = v4;

  return v5;
}

uint64_t __88__UIDocumentBrowserViewController_remoteViewControllerDidTerminateViewServiceWithError___block_invoke_161(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showDocumentBrowserViewController:1];
}

- (NSArray)allowedContentTypes
{
  id v2 = (void *)MEMORY[0x263F1D928];
  id v3 = [(UIDocumentBrowserViewController *)self configuration];
  double v4 = [v3 documentContentTypes];
  double v5 = objc_msgSend(v2, "doc_identifiersForContentTypes:", v4);

  return (NSArray *)v5;
}

- (NSArray)recentDocumentsContentTypes
{
  id v2 = (void *)MEMORY[0x263F1D928];
  id v3 = [(UIDocumentBrowserViewController *)self configuration];
  double v4 = [v3 recentDocumentsContentTypes];
  double v5 = objc_msgSend(v2, "doc_identifiersForContentTypes:", v4);

  return (NSArray *)v5;
}

- (NSArray)contentTypesForRecentDocuments
{
  id v2 = [(UIDocumentBrowserViewController *)self configuration];
  id v3 = [v2 recentDocumentsContentTypes];
  double v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  double v5 = v3;

  return v5;
}

void __80__UIDocumentBrowserViewController_setAdditionalLeadingNavigationBarButtonItems___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = [WeakRetained remoteAdditionalLeadingNavigationBarButtonItems];
    [v6 _setAdditionalLeadingNavigationBarButtonItems:v5];
  }
}

void __81__UIDocumentBrowserViewController_setAdditionalTrailingNavigationBarButtonItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v5 = (NSObject **)MEMORY[0x263F3AC28];
    id v6 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_21361D000, v6, OS_LOG_TYPE_INFO, "setAdditionalTrailingNavigationBarButtonItems: sending to service", v8, 2u);
    }
    id v7 = [WeakRetained remoteAdditionalTrailingNavigationBarButtonItems];
    [v3 _setAdditionalTrailingNavigationBarButtonItems:v7];
  }
}

uint64_t __52__UIDocumentBrowserViewController_setCustomActions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setCustomActions:*(void *)(a1 + 32)];
}

- (void)setAllowsPickingMultipleItems:(BOOL)allowsPickingMultipleItems
{
  self->_allowsPickingMultipleItems = allowsPickingMultipleItems;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __65__UIDocumentBrowserViewController_setAllowsPickingMultipleItems___block_invoke;
  v3[3] = &__block_descriptor_33_e88_v24__0___DOCServiceDocumentBrowserViewControllerInterface__8__DOCRemoteViewController_16l;
  BOOL v4 = allowsPickingMultipleItems;
  [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v3];
}

uint64_t __65__UIDocumentBrowserViewController_setAllowsPickingMultipleItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setAllowsPickingMultipleItems:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __69__UIDocumentBrowserViewController__updateAppearanceShowsCreateButton__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setAllowsDocumentCreation:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setDefaultDocumentAspectRatio:(CGFloat)defaultDocumentAspectRatio
{
  [(DOCAppearance *)self->_appearance defaultDocumentAspectRatio];
  if (v5 != defaultDocumentAspectRatio)
  {
    id v6 = (void *)[(DOCAppearance *)self->_appearance copy];
    [v6 setDefaultDocumentAspectRatio:defaultDocumentAspectRatio];
    [(UIDocumentBrowserViewController *)self effectiveAppearanceDidChange:v6];
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__UIDocumentBrowserViewController_setDefaultDocumentAspectRatio___block_invoke;
  v7[3] = &__block_descriptor_40_e88_v24__0___DOCServiceDocumentBrowserViewControllerInterface__8__DOCRemoteViewController_16l;
  *(CGFloat *)&void v7[4] = defaultDocumentAspectRatio;
  [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v7];
}

uint64_t __65__UIDocumentBrowserViewController_setDefaultDocumentAspectRatio___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setDefaultDocumentAspectRatio:*(double *)(a1 + 32)];
}

- (CGFloat)defaultDocumentAspectRatio
{
  [(DOCAppearance *)self->_appearance defaultDocumentAspectRatio];
  return result;
}

- (void)setLocalizedCreateDocumentActionTitle:(NSString *)localizedCreateDocumentActionTitle
{
  BOOL v4 = localizedCreateDocumentActionTitle;
  double v5 = [(DOCAppearance *)self->_appearance collectionCreateButtonTitle];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = (void *)[(DOCAppearance *)self->_appearance copy];
    [v7 setCollectionCreateButtonTitle:v4];
    [(UIDocumentBrowserViewController *)self effectiveAppearanceDidChange:v7];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __73__UIDocumentBrowserViewController_setLocalizedCreateDocumentActionTitle___block_invoke;
  v9[3] = &unk_2641B10A8;
  id v10 = v4;
  id v8 = v4;
  [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v9];
}

uint64_t __73__UIDocumentBrowserViewController_setLocalizedCreateDocumentActionTitle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setCreateButtonTitle:*(void *)(a1 + 32)];
}

- (NSString)localizedCreateDocumentActionTitle
{
  return [(DOCAppearance *)self->_appearance collectionCreateButtonTitle];
}

- (void)setBrowserUserInterfaceStyle:(UIDocumentBrowserUserInterfaceStyle)browserUserInterfaceStyle
{
  if ([(DOCAppearance *)self->_appearance browserUserInterfaceStyle] != browserUserInterfaceStyle)
  {
    [(UIDocumentBrowserViewController *)self setOverrideUserInterfaceStyle:2 * (browserUserInterfaceStyle == UIDocumentBrowserUserInterfaceStyleDark)];
    id v5 = (id)[(DOCAppearance *)self->_appearance copy];
    [v5 setBrowserUserInterfaceStyle:browserUserInterfaceStyle];
    [(UIDocumentBrowserViewController *)self effectiveAppearanceDidChange:v5];
  }
}

- (BOOL)shouldShowFileExtensions
{
  return [(DOCAppearance *)self->_appearance shouldShowFileExtensions];
}

- (void)setShouldShowFileExtensions:(BOOL)shouldShowFileExtensions
{
  BOOL v3 = shouldShowFileExtensions;
  if ([(DOCAppearance *)self->_appearance shouldShowFileExtensions] != shouldShowFileExtensions)
  {
    id v5 = (id)[(DOCAppearance *)self->_appearance copy];
    [v5 setShouldShowFileExtensions:v3];
    [(UIDocumentBrowserViewController *)self effectiveAppearanceDidChange:v5];
  }
}

- (UIDocumentBrowserUserInterfaceStyle)browserUserInterfaceStyle
{
  return [(DOCAppearance *)self->_appearance browserUserInterfaceStyle];
}

- (void)clearCurrentOpenInteraction
{
}

uint64_t __62__UIDocumentBrowserViewController_clearCurrentOpenInteraction__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _clearCurrentOpenInteraction];
}

- (id)_unavailableConfigurationForTryAgain
{
  BOOL v3 = [MEMORY[0x263F086E0] mainBundle];
  BOOL v4 = [v3 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = _DocumentManagerBundle();
    id v6 = [v7 localizedStringForKey:@"Error [UIDocumentBrowserViewController view service error]" value:@"Error" table:@"Localizable"];
  }
  id v8 = _DocumentManagerBundle();
  id v9 = [v8 localizedStringForKey:@"Something went wrong while displaying documents." value:@"Something went wrong while displaying documents." table:@"Localizable"];

  id v10 = [MEMORY[0x263F82600] emptyConfiguration];
  [v10 setText:v6];
  [v10 setSecondaryText:v9];
  if ([(UIDocumentBrowserViewController *)self enclosedInUIPDocumentLanding])
  {
    id v11 = objc_alloc(MEMORY[0x263F82E50]);
    char v12 = [MEMORY[0x263F824D8] effectWithStyle:8];
    double v13 = (void *)[v11 initWithEffect:v12];
    uint64_t v14 = [v10 background];
    [v14 setCustomView:v13];
  }
  id v15 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  __int16 v16 = _DocumentManagerBundle();
  int v17 = [v16 localizedStringForKey:@"Try Again" value:@"Try Again" table:@"Localizable"];
  [v15 setTitle:v17];

  __int16 v18 = [MEMORY[0x263F825C8] systemBlueColor];
  [v15 setBaseForegroundColor:v18];

  objc_initWeak(&location, self);
  [v10 setButton:v15];
  BOOL v19 = (void *)MEMORY[0x263F823D0];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __71__UIDocumentBrowserViewController__unavailableConfigurationForTryAgain__block_invoke;
  long long v26 = &unk_2641B1698;
  objc_copyWeak(&v27, &location);
  id v20 = [v19 actionWithHandler:&v23];
  CGRect v21 = objc_msgSend(v10, "buttonProperties", v23, v24, v25, v26);
  [v21 setPrimaryAction:v20];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return v10;
}

void __71__UIDocumentBrowserViewController__unavailableConfigurationForTryAgain__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didTapTryAgainButton];
}

- (void)_showErrorViewController
{
  [(UIDocumentBrowserViewController *)self _clearShownViewControllers];
  id v3 = [(UIDocumentBrowserViewController *)self _unavailableConfigurationForTryAgain];
  [(UIDocumentBrowserViewController *)self setContentUnavailableConfiguration:v3];
}

- (void)_didTapTryAgainButton
{
  id v4 = [(UIDocumentBrowserViewController *)self contentUnavailableConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v4 buttonProperties];
    [v3 setEnabled:0];

    [(UIDocumentBrowserViewController *)self setContentUnavailableConfiguration:v4];
  }
  [(UIDocumentBrowserViewController *)self _showDocumentBrowserViewController:1];
}

- (BOOL)_delegateRespondsToSelector:(SEL)a3
{
  id v3 = [(UIDocumentBrowserViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (void)prepareItemBookmarks:(id)a3 usingBookmark:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(UIDocumentBrowserViewController *)self configuration];
  -[UIDocumentBrowserViewController prepareItemBookmarks:forMode:usingBookmark:completionBlock:](self, "prepareItemBookmarks:forMode:usingBookmark:completionBlock:", v9, [v10 interactionModeForPreparing], v5, v8);
}

- (void)prepareItemBookmarks:(id)a3 forMode:(unint64_t)a4 usingBookmark:(BOOL)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  char v12 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke;
  block[3] = &unk_2641B16E8;
  BOOL v20 = a5;
  id v16 = v10;
  int v17 = self;
  id v18 = v11;
  unint64_t v19 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = dispatch_group_create();
  id v15 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v16 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(obj);
        }
        char v4 = *(void **)(*((void *)&v24 + 1) + 8 * v3);
        dispatch_group_enter(v2);
        uint64_t v5 = *(void *)(a1 + 56);
        uint64_t v6 = *(unsigned __int8 *)(a1 + 64);
        id v7 = [*(id *)(a1 + 40) configuration];
        uint64_t v8 = [v7 shouldConvert];
        id v9 = [*(id *)(a1 + 40) configuration];
        id v10 = [v9 allowedConversions];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke_2;
        v20[3] = &unk_2641B16C0;
        id v21 = v15;
        id v22 = v4;
        uint64_t v23 = v2;
        [v4 prepareForMode:v5 usingBookmark:v6 shouldConvert:v8 conversionRules:v10 completionBlock:v20];

        ++v3;
      }
      while (v16 != v3);
      uint64_t v16 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v16);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke_3;
  block[3] = &unk_2641B10D0;
  id v11 = *(id *)(a1 + 48);
  id v18 = v15;
  id v19 = v11;
  id v12 = v15;
  dispatch_group_notify(v2, MEMORY[0x263EF83A0], block);
}

void __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    objc_sync_exit(v3);
  }
  char v4 = *(NSObject **)(a1 + 48);
  dispatch_group_leave(v4);
}

void __94__UIDocumentBrowserViewController_prepareItemBookmarks_forMode_usingBookmark_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)getTrackingViews:(id *)a3 remoteButtons:(id *)a4 fromBarButtons:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a5;
  id v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v6;
  uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v32)
  {
    uint64_t v9 = *(void *)v34;
    unint64_t v10 = 0x2641B0000uLL;
    unint64_t v11 = 0x2641B0000uLL;
    uint64_t v30 = *(void *)v34;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(obj);
        }
        id v13 = (void *)[objc_alloc(*(Class *)(v10 + 2856)) initWithBarButton:*(void *)(*((void *)&v33 + 1) + 8 * v12)];
        id v14 = objc_alloc(*(Class *)(v11 + 2864));
        id v15 = [v13 uuid];
        uint64_t v16 = (void *)[v14 initWithUUID:v15];

        [v7 addObject:v13];
        [v8 addObject:v16];
        int v17 = [v13 barButton];
        objc_msgSend(v17, "set_doc_ipi_view:", v16);

        [(UIView *)self->_trackingViewsContainer addSubview:v16];
        id v18 = *MEMORY[0x263F3AC28];
        if (!*MEMORY[0x263F3AC28])
        {
          DOCInitLogging();
          id v18 = *MEMORY[0x263F3AC28];
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = v18;
          [v13 uuid];
          BOOL v20 = v8;
          id v21 = v7;
          uint64_t v23 = v22 = self;
          [v23 UUIDString];
          v25 = unint64_t v24 = v11;
          *(_DWORD *)buf = 138412290;
          uint64_t v38 = v25;
          _os_log_impl(&dword_21361D000, v19, OS_LOG_TYPE_INFO, "getTrackingViews:remoteButtons:fromBarButtons: creating RemoteButton with uuid: %@", buf, 0xCu);

          unint64_t v11 = v24;
          self = v22;
          id v7 = v21;
          uint64_t v8 = v20;
          uint64_t v9 = v30;
          unint64_t v10 = 0x2641B0000;
        }

        ++v12;
      }
      while (v32 != v12);
      uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v32);
  }

  id v26 = v8;
  *a3 = v26;
  id v27 = v7;
  *a4 = v27;
}

- (id)trackingViewForUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 addObjectsFromArray:self->_leadingBarButtonTrackingViews];
  [v5 addObjectsFromArray:self->_trailingBarButtonTrackingViews];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "uuid", (void)v14);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)remoteBarButtonForUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [v5 addObjectsFromArray:self->_remoteAdditionalLeadingNavigationBarButtonItems];
  [v5 addObjectsFromArray:self->_remoteAdditionalTrailingNavigationBarButtonItems];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v10, "uuid", (void)v14);
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

void __62__UIDocumentBrowserViewController_addOperationToServiceQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) serviceProxy];
  id v3 = [*(id *)(a1 + 32) remoteViewController];
  id v4 = [v3 remoteViewController];
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v5, v4);
}

- (void)_displayActivityControllerWithItemBookmarks:(id)a3 popoverTracker:(id)a4 isContentManaged:(BOOL)a5 additionalActivities:(id)a6 activityProxy:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = [(UIDocumentBrowserViewController *)self _activityViewControllerWithItemBookmarks:v12 isForTitleMenuFolderSharing:0 popoverTracker:v13 isContentManaged:v9 additionalActivities:v14 activityRunner:v15];
  long long v17 = (void *)v16;
  if (v13 && v16)
  {
    objc_initWeak(location, self);
    objc_storeWeak((id *)&self->_activityViewController, v17);
    id v20 = v17;
    id v21 = v13;
    objc_copyWeak(&v22, location);
    DOCRunInMainThread();
    objc_destroyWeak(&v22);

    objc_destroyWeak(location);
  }
  else
  {
    id v18 = (NSObject **)MEMORY[0x263F3AC28];
    uint64_t v19 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      uint64_t v19 = *v18;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_21361D000, v19, OS_LOG_TYPE_DEFAULT, "Cannot present the activity view controller without a barButton or popoverTracker", (uint8_t *)location, 2u);
    }
  }
}

void __146__UIDocumentBrowserViewController__displayActivityControllerWithItemBookmarks_popoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPopoverTracker:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __146__UIDocumentBrowserViewController__displayActivityControllerWithItemBookmarks_popoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke_2;
  v3[3] = &unk_2641B1738;
  objc_copyWeak(&v5, (id *)(a1 + 56));
  void v3[4] = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  [v2 getFrameForRegion:0 waitForNewThumbnail:0 completionBlock:v3];

  objc_destroyWeak(&v5);
}

void __146__UIDocumentBrowserViewController__displayActivityControllerWithItemBookmarks_popoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke_2(uint64_t a1, double a2, double a3, double a4, double a5)
{
  objc_copyWeak(v11, (id *)(a1 + 48));
  id v10 = *(id *)(a1 + 40);
  v11[1] = *(id *)&a2;
  v11[2] = *(id *)&a3;
  v11[3] = *(id *)&a4;
  v11[4] = *(id *)&a5;
  DOCRunInMainThread();

  objc_destroyWeak(v11);
}

void __146__UIDocumentBrowserViewController__displayActivityControllerWithItemBookmarks_popoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v16 = WeakRetained;
    id v3 = [*(id *)(a1 + 32) configuration];
    int v4 = [v3 isFilesApp];
    id v5 = [v16 view];
    id v6 = v5;
    if (v4)
    {
      uint64_t v7 = [v5 window];

      id v6 = (void *)v7;
    }

    uint64_t v8 = [*(id *)(a1 + 40) popoverPresentationController];
    [v8 setSourceView:v6];

    double v9 = *(double *)(a1 + 56);
    double v10 = *(double *)(a1 + 64);
    double v11 = *(double *)(a1 + 72);
    double v12 = *(double *)(a1 + 80);
    id v13 = [*(id *)(a1 + 40) popoverPresentationController];
    objc_msgSend(v13, "setSourceRect:", v9, v10, v11, v12);

    id v14 = *(void **)(a1 + 32);
    id v15 = [*(id *)(a1 + 40) presentationController];
    [v14 manageOverrideIfNecessaryForPresentationController:v15];

    [v16 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
    id WeakRetained = v16;
  }
}

- (BOOL)_shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks:(id)a3
{
  id v4 = a3;
  id v5 = [(UIDocumentBrowserViewController *)self configuration];
  id v6 = [v5 documentContentTypes];

  uint64_t v7 = [MEMORY[0x263EFF9C0] set];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  id v19[2] = __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke;
  v19[3] = &unk_2641B1788;
  id v20 = v7;
  id v8 = v7;
  [v4 enumerateObjectsUsingBlock:v19];

  double v9 = [v8 allObjects];
  uint64_t v10 = [v9 indexOfObjectPassingTest:&__block_literal_global_199];

  double v11 = [v8 allObjects];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_3;
  v17[3] = &unk_2641B17D0;
  id v18 = v6;
  id v12 = v6;
  uint64_t v13 = [v11 indexOfObjectPassingTest:v17];

  BOOL v15 = v10 != 0x7FFFFFFFFFFFFFFFLL || v13 != 0x7FFFFFFFFFFFFFFFLL;
  return v15;
}

uint64_t __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 contentType];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v6 = v3;
    uint64_t v3 = [*(id *)(a1 + 32) addObject:v3];
    uint64_t v4 = v6;
  }
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 conformsToType:*MEMORY[0x263F1DAB8]] ^ 1;
}

BOOL __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_4;
  v8[3] = &unk_2641B17D0;
  id v9 = v3;
  id v5 = v3;
  BOOL v6 = [v4 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __106__UIDocumentBrowserViewController__shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) conformsToType:a2];
}

- (id)_activityViewControllerWithItemBookmarks:(id)a3 isForTitleMenuFolderSharing:(BOOL)a4 popoverTracker:(id)a5 isContentManaged:(BOOL)a6 additionalActivities:(id)a7 activityRunner:(id)a8
{
  BOOL v59 = a6;
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v58 = a5;
  id v12 = a7;
  id v68 = a8;
  v61 = v11;
  id obj = v12;
  if (+[DOCItemBookmark isAnyItemBookmarkAFault:v11]
    && !DOCIsNetworkReachable())
  {
    if (!a4) {
      DOCAlertUserTheNetworkIsNotReachable(self);
    }
    goto LABEL_10;
  }
  if (a4
    || ![(UIDocumentBrowserViewController *)self _shouldConsultDelegateShouldShowActivityViewControllerForItemBookmarks:v11])
  {
    goto LABEL_13;
  }
  uint64_t v13 = [(UIDocumentBrowserViewController *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0)
  {
    uint64_t v19 = [(UIDocumentBrowserViewController *)self delegate];
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0) {
      goto LABEL_13;
    }
    id v21 = +[DOCItemBookmark documentsURLsForItemBookmarks:v11];
    id v22 = [(UIDocumentBrowserViewController *)self delegate];
    int v23 = [v22 documentBrowser:self shouldShowActivityViewControllerForDocumentURLs:v21 barButtonItem:0 popoverTracker:v58];

    if (v23) {
      goto LABEL_13;
    }
LABEL_10:
    id v18 = 0;
    goto LABEL_44;
  }
  BOOL v15 = +[DOCItemBookmark documentsURLsForItemBookmarks:v11];
  id v16 = [(UIDocumentBrowserViewController *)self delegate];
  char v17 = [v16 documentBrowser:self shouldShowActivityViewControllerForDocumentURLs:v15 popoverTracker:v58 isContentManaged:v59 additionalActivities:obj activityProxy:v68];

  if ((v17 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_13:
  unint64_t v24 = [(UIDocumentBrowserViewController *)self delegate];
  char v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) == 0) {
    goto LABEL_15;
  }
  id v26 = +[DOCItemBookmark documentsURLsForItemBookmarks:v11];
  id v27 = [(UIDocumentBrowserViewController *)self delegate];
  id v28 = [v27 documentBrowser:self applicationActivitiesForDocumentURLs:v26];

  if (!v28)
  {
LABEL_15:
    id v28 = [MEMORY[0x263EFF980] array];
  }
  v62 = [MEMORY[0x263EFF980] array];
  [v62 addObject:@"com.apple.DocumentManagerUICore.SaveToFiles"];
  uint64_t v29 = [MEMORY[0x263F3AB98] defaultPermission];
  int v30 = [v29 canCopySourceIsContentManaged:v59];

  if (v30)
  {
    uint64_t v31 = [obj arrayByAddingObject:@"com.apple.DocumentManager.action.copy"];

    uint64_t v32 = (void *)v31;
  }
  else
  {
    uint64_t v32 = obj;
  }
  [v62 addObject:*MEMORY[0x263F6BCE8]];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v78 = 0u;
  long long v77 = 0u;
  id obj = v32;
  uint64_t v33 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v78;
    do
    {
      uint64_t v35 = 0;
      long long v36 = v28;
      do
      {
        if (*(void *)v78 != v34) {
          objc_enumerationMutation(obj);
        }
        char v37 = +[DOCActivity activityWithIdentifier:*(void *)(*((void *)&v77 + 1) + 8 * v35) actionPerformerProxy:v68];
        id v28 = [v36 arrayByAddingObject:v37];

        ++v35;
        long long v36 = v28;
      }
      while (v33 != v35);
      uint64_t v33 = [obj countByEnumeratingWithState:&v77 objects:v82 count:16];
    }
    while (v33);
  }

  v67 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v61, "count"));
  v64 = [MEMORY[0x263EFF980] array];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v65 = v61;
  char v38 = 0;
  uint64_t v39 = [v65 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (v39)
  {
    uint64_t v40 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v74 != v40) {
          objc_enumerationMutation(v65);
        }
        id v42 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        id v43 = [v42 fileURL];
        [v67 addObject:v43];
        id v44 = [v42 fileProviderItem];
        char v45 = [v44 isTrashed];

        id v46 = [v42 fileURL];
        int v47 = [v46 startAccessingSecurityScopedResource];

        if (v47)
        {
          id v48 = [v42 fileURL];
          [v64 addObject:v48];
        }
        v38 |= v45;
      }
      uint64_t v39 = [v65 countByEnumeratingWithState:&v73 objects:v81 count:16];
    }
    while (v39);
  }

  objc_initWeak(&location, self);
  char v49 = [[DOCDocBrowserVC_UIActivityViewController alloc] initWithActivityItems:v67 applicationActivities:v28];
  [(DOCDocBrowserVC_UIActivityViewController *)v49 setIsContentManaged:v59];
  v69[0] = MEMORY[0x263EF8330];
  v69[1] = 3221225472;
  v69[2] = __172__UIDocumentBrowserViewController__activityViewControllerWithItemBookmarks_isForTitleMenuFolderSharing_popoverTracker_isContentManaged_additionalActivities_activityRunner___block_invoke;
  v69[3] = &unk_2641B17F8;
  id v50 = v64;
  id v70 = v50;
  objc_copyWeak(&v71, &location);
  [(DOCDocBrowserVC_UIActivityViewController *)v49 setCompletionWithItemsHandler:v69];
  if (!a4)
  {
    v51 = [(UIDocumentBrowserViewController *)self delegate];
    char v52 = objc_opt_respondsToSelector();

    if (v52)
    {
      v53 = [(UIDocumentBrowserViewController *)self delegate];
      [v53 documentBrowser:self willPresentActivityViewController:v49];
    }
  }
  if (v38)
  {
    [v62 addObject:@"com.apple.UIKit.activity.CloudSharing"];
    [v62 addObject:@"com.apple.DocumentManager.action.copySharedLink"];
    v54 = [(DOCDocBrowserVC_UIActivityViewController *)v49 excludedActivityTypes];
    BOOL v55 = [v54 count] == 0;

    if (!v55)
    {
      v56 = [(DOCDocBrowserVC_UIActivityViewController *)v49 excludedActivityTypes];
      [v62 addObjectsFromArray:v56];
    }
  }
  if ([v62 count]) {
    [(DOCDocBrowserVC_UIActivityViewController *)v49 setExcludedActivityTypes:v62];
  }
  [(DOCDocBrowserVC_UIActivityViewController *)v49 setModalPresentationStyle:7];
  id v18 = v49;
  objc_destroyWeak(&v71);

  objc_destroyWeak(&location);
LABEL_44:

  return v18;
}

void __172__UIDocumentBrowserViewController__activityViewControllerWithItemBookmarks_isForTitleMenuFolderSharing_popoverTracker_isContentManaged_additionalActivities_activityRunner___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(a1 + 32);
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
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8++), "stopAccessingSecurityScopedResource", (void)v11);
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v10 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained setEditing:0];
    }
  }
}

- (id)_sandboxingURLWrapperForURL:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  if ([v7 checkPromisedItemIsReachableAndReturnError:a5])
  {
    uint64_t v8 = [MEMORY[0x263F054E0] wrapperWithURL:v7 readonly:v6 error:a5];
  }
  else
  {
    id v9 = (NSObject **)MEMORY[0x263F3AC28];
    uint64_t v10 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      uint64_t v10 = *v9;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_impl(&dword_21361D000, v10, OS_LOG_TYPE_DEFAULT, "Error while trying to reveal a document at a URL: The resource is not reachable.", v12, 2u);
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)keyCommands
{
  id v3 = [(UIDocumentBrowserViewController *)self presentedViewController];
  if ([(UIDocumentBrowserViewController *)self isViewLoaded])
  {
    id v4 = [(UIDocumentBrowserViewController *)self view];
    uint64_t v5 = [v4 window];
    if (v5) {
      BOOL v6 = v3 == 0;
    }
    else {
      BOOL v6 = 0;
    }
    int v7 = v6;

    if (v3) {
      goto LABEL_9;
    }
  }
  else
  {
    int v7 = 0;
    if (v3)
    {
LABEL_9:
      int v8 = [v3 conformsToProtocol:&unk_26C435520];
      goto LABEL_12;
    }
  }
  int v8 = 0;
LABEL_12:
  if ((v7 | v8) == 1)
  {
    char IsKeyInput = DOCFirstResponderIsKeyInput();
    uint64_t v10 = [(UIDocumentBrowserViewController *)self configuration];
    char v11 = [v10 isFilesApp];

    long long v12 = objc_opt_new();
    if ((v11 & 1) == 0)
    {
      long long v13 = objc_opt_new();
      long long v14 = [(UIDocumentBrowserViewController *)self configuration];
      if ([v14 inProcess]) {
        [v13 allKeyCommands];
      }
      else {
      BOOL v15 = [v13 allKeyCommandsWithAction:sel_performKeyCommandNoOpOnHostSide_];
      }

      [v12 addObjectsFromArray:v15];
      uint64_t v16 = [(UIDocumentBrowserViewController *)self configuration];
      char v17 = [v16 inProcess] | IsKeyInput;

      if ((v17 & 1) == 0)
      {
        id v18 = +[DOCKeyboardFocusManager allDirectionalKeyCommandsWithAction:sel_performKeyCommandNoOpOnHostSide_ prioritize:1];
        [v12 addObjectsFromArray:v18];
      }
    }
  }
  else
  {
    long long v12 = 0;
  }

  return v12;
}

- (id)preferredFocusEnvironments
{
  v4.receiver = self;
  v4.super_class = (Class)UIDocumentBrowserViewController;
  uint64_t v2 = [(UIDocumentBrowserViewController *)&v4 preferredFocusEnvironments];
  return v2;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  int v7 = [(UIDocumentBrowserViewController *)self configuration];
  char v8 = [v7 isFilesApp];

  objc_opt_class();
  id v9 = (char *)a3;
  if (objc_opt_isKindOfClass())
  {
    id v9 = (char *)a3;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v10 = [v6 propertyList];
      id v9 = (char *)a3;
      if (v10)
      {
        char v11 = (void *)v10;
        long long v12 = [v6 propertyList];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        id v9 = (char *)a3;
        if (isKindOfClass)
        {
          long long v14 = [v6 propertyList];
          BOOL v15 = [v14 objectForKeyedSubscript:@"com.apple.DocumentManager.keyCommands.originalKeyCommandAction"];

          id v9 = (char *)a3;
          if (v15)
          {
            SEL v16 = NSSelectorFromString(v15);
            if (v16) {
              id v9 = (char *)v16;
            }
            else {
              id v9 = (char *)a3;
            }
          }
        }
      }
    }
  }
  if (v9 == sel_performCreateDocumentOrOpenNewWindow_)
  {
    if ((v8 & 1) == 0)
    {
      unsigned __int8 allowsDocumentCreation = self->_allowsDocumentCreation;
      goto LABEL_20;
    }
LABEL_19:
    unsigned __int8 allowsDocumentCreation = 0;
    goto LABEL_20;
  }
  if (v9 == sel_performPreview_) {
    goto LABEL_19;
  }
  if (v9 == sel_performConnectToServer_ || v9 == sel_performEjectMedium_)
  {
    if ((v8 & 1) == 0)
    {
      uint64_t v19 = [(UIDocumentBrowserViewController *)self configuration];
      unsigned __int8 allowsDocumentCreation = [(UIDocumentBrowserViewController *)self supportsRemovableFileProvidersForConfiguration:v19];

      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (sel_performKeyCommandNoOpOnHostSide_ == a3)
  {
    unsigned __int8 allowsDocumentCreation = 1;
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)UIDocumentBrowserViewController;
    unsigned __int8 allowsDocumentCreation = [(UIDocumentBrowserViewController *)&v20 canPerformAction:a3 withSender:v6];
  }
LABEL_20:

  return allowsDocumentCreation;
}

- (void)_establishFirstResponderOnServiceSideForKeyCommand:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __86__UIDocumentBrowserViewController__establishFirstResponderOnServiceSideForKeyCommand___block_invoke;
  v6[3] = &unk_2641B10A8;
  id v7 = v4;
  id v5 = v4;
  [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v6];
}

uint64_t __86__UIDocumentBrowserViewController__establishFirstResponderOnServiceSideForKeyCommand___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _establishFirstResponderAndPerformKeyCommand:*(void *)(a1 + 32)];
}

- (void)_presentActivityViewControllerForItemBookmarks:(id)a3 withPopoverTracker:(id)a4 isContentManaged:(BOOL)a5 additionalActivities:(id)a6 activityProxy:(id)a7
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  SEL v16 = (NSObject **)MEMORY[0x263F3AC28];
  char v17 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    char v17 = *v16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v28 = v12;
    __int16 v29 = 2112;
    id v30 = v13;
    _os_log_impl(&dword_21361D000, v17, OS_LOG_TYPE_DEFAULT, "Present the activity view controller in the host on items: %@ popoverTracker:%@", buf, 0x16u);
  }
  id v18 = *v16;
  if (!*v16)
  {
    DOCInitLogging();
    id v18 = *v16;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21361D000, v18, OS_LOG_TYPE_INFO, "prepareForMode: _presentActivityViewControllerForItemBookmarks with usingBookmark == NO", buf, 2u);
  }
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __153__UIDocumentBrowserViewController__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke;
  v22[3] = &unk_2641B1820;
  v22[4] = self;
  id v23 = v13;
  BOOL v26 = a5;
  id v24 = v14;
  id v25 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  [(UIDocumentBrowserViewController *)self prepareItemBookmarks:v12 forMode:1 usingBookmark:0 completionBlock:v22];
}

uint64_t __153__UIDocumentBrowserViewController__presentActivityViewControllerForItemBookmarks_withPopoverTracker_isContentManaged_additionalActivities_activityProxy___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _displayActivityControllerWithItemBookmarks:a2 popoverTracker:*(void *)(a1 + 40) isContentManaged:*(unsigned __int8 *)(a1 + 64) additionalActivities:*(void *)(a1 + 48) activityProxy:*(void *)(a1 + 56)];
}

- (BOOL)_canSendDocumentLandingDidPickDocumentsAtURLs
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_documentLandingPresenter);
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)_sendDocumentLandingDidPickDocumentsAtURLs:(id)a3
{
  p_documentLandingPresenter = &self->_documentLandingPresenter;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_documentLandingPresenter);
  [WeakRetained documentLandingBrowser:self didPickDocumentsAtURLs:v5];
}

- (void)_commitDocumentURLPreview:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v10[0] = v4;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__UIDocumentBrowserViewController__commitDocumentURLPreview___block_invoke;
  v7[3] = &unk_2641B1848;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [(UIDocumentBrowserViewController *)self prepareItemBookmarks:v5 usingBookmark:1 completionBlock:v7];
}

void __61__UIDocumentBrowserViewController__commitDocumentURLPreview___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) fileURL];
  v9[0] = v2;
  char v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];

  if ([*(id *)(a1 + 40) _canSendDocumentLandingDidPickDocumentsAtURLs]) {
    [*(id *)(a1 + 40) _sendDocumentLandingDidPickDocumentsAtURLs:v3];
  }
  id v4 = [*(id *)(a1 + 40) delegate];
  char v5 = objc_opt_respondsToSelector();

  id v6 = [*(id *)(a1 + 40) delegate];
  id v7 = v6;
  if (v5)
  {
    [v6 documentBrowser:*(void *)(a1 + 40) didPickDocumentsAtURLs:v3];
LABEL_7:

    goto LABEL_8;
  }
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v7 = [*(id *)(a1 + 40) delegate];
    [v7 documentBrowser:*(void *)(a1 + 40) didPickDocumentURLs:v3];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_didTriggerCustomActionWithIdentifier:(id)a3 onItemBookmarks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = (NSObject **)MEMORY[0x263F3AC28];
  id v9 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    id v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21361D000, v9, OS_LOG_TYPE_INFO, "prepareForMode: _didTriggerCustomActionWithIdentifier with usingBookmark == NO", buf, 2u);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __89__UIDocumentBrowserViewController__didTriggerCustomActionWithIdentifier_onItemBookmarks___block_invoke;
  v11[3] = &unk_2641B1848;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [(UIDocumentBrowserViewController *)self prepareItemBookmarks:v7 forMode:1 usingBookmark:0 completionBlock:v11];
}

void __89__UIDocumentBrowserViewController__didTriggerCustomActionWithIdentifier_onItemBookmarks___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) customActions];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __89__UIDocumentBrowserViewController__didTriggerCustomActionWithIdentifier_onItemBookmarks___block_invoke_2;
  v13[3] = &unk_2641B1870;
  id v14 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 indexOfObjectPassingTest:v13];

  id v6 = [*(id *)(a1 + 32) customActions];
  id v7 = [v6 objectAtIndexedSubscript:v5];
  char v8 = (void *)[v7 copy];

  if (v8)
  {
    id v9 = [v8 resolvedHandler];
    ((void (**)(void, id, void))v9)[2](v9, v3, 0);
  }
  else
  {
    id v10 = (NSObject **)MEMORY[0x263F3AC28];
    char v11 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      char v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_21361D000, v11, OS_LOG_TYPE_INFO, "tried to perform an action that does not exist anymore", v12, 2u);
    }
  }
}

uint64_t __89__UIDocumentBrowserViewController__didTriggerCustomActionWithIdentifier_onItemBookmarks___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 identifier];
  uint64_t v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7) {
    *a4 = 1;
  }
  return v7;
}

- (void)_didPickItemBookmarks:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(UIDocumentBrowserViewController *)self enclosedInUIPDocumentLanding]
    || !self->_uipTransitionCoordinator)
  {
    [(UIDocumentBrowserViewController *)self _clearCurrentOpenInteractionUnlessUIPDocumentLanding];
    BOOL v5 = [(UIDocumentBrowserViewController *)self _delegateRespondsToSelector:sel_documentBrowser_didPickDocumentURLs_];
    BOOL v6 = [(UIDocumentBrowserViewController *)self _delegateRespondsToSelector:sel_documentBrowser_didPickDocumentsAtURLs_];
    BOOL v7 = [(UIDocumentBrowserViewController *)self _canSendDocumentLandingDidPickDocumentsAtURLs];
    BOOL v8 = v7;
    if (v5 || v6 || v7)
    {
      id v9 = [(UIDocumentBrowserViewController *)self configuration];
      uint64_t v10 = [v9 interactionMode];

      char v11 = (NSObject **)MEMORY[0x263F3AC28];
      id v12 = *MEMORY[0x263F3AC28];
      if (!*MEMORY[0x263F3AC28])
      {
        DOCInitLogging();
        id v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = @"NO";
        if (v10 == 1) {
          id v13 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        id v20 = v13;
        _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_INFO, "prepareForMode: _didPickItemBookmarks with usingBookmark == %@", buf, 0xCu);
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke;
      v14[3] = &unk_2641B18C0;
      BOOL v16 = v8;
      void v14[4] = self;
      BOOL v17 = v6;
      BOOL v18 = v5;
      id v15 = v4;
      [(UIDocumentBrowserViewController *)self prepareItemBookmarks:v15 usingBookmark:v10 == 1 completionBlock:v14];
    }
  }
}

void __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v19 + 1) + 8 * v9) fileURL];
        [v4 addObject:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_2;
  v16[3] = &unk_2641B1898;
  char v17 = *(unsigned char *)(a1 + 48);
  v16[4] = *(void *)(a1 + 32);
  __int16 v18 = *(_WORD *)(a1 + 49);
  char v11 = (void (**)(void, void))MEMORY[0x21668E400](v16);
  if ([v4 count]) {
    goto LABEL_14;
  }
  id v12 = [*(id *)(a1 + 32) configuration];
  int v13 = [v12 forSavingDocuments];

  id v14 = (NSObject **)MEMORY[0x263F3AC28];
  id v15 = *MEMORY[0x263F3AC28];
  if (v13)
  {
    if (!v15)
    {
      DOCInitLogging();
      id v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_cold_1();
    }
LABEL_14:
    ((void (**)(void, void *))v11)[2](v11, v4);
    goto LABEL_15;
  }
  if (!v15)
  {
    DOCInitLogging();
    id v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_cold_2();
  }
LABEL_15:
}

void __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 copy];
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _sendDocumentLandingDidPickDocumentsAtURLs:v3];
  }
  if (*(unsigned char *)(a1 + 41))
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 documentBrowser:*(void *)(a1 + 32) didPickDocumentsAtURLs:v3];
LABEL_7:

    goto LABEL_8;
  }
  if (*(unsigned char *)(a1 + 42))
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 documentBrowser:*(void *)(a1 + 32) didPickDocumentURLs:v3];
    goto LABEL_7;
  }
LABEL_8:
  if ([*(id *)(a1 + 32) enclosedInUIPDocumentLanding]
    && !*(void *)(*(void *)(a1 + 32) + 1008))
  {
    DOCRunInMainThread();
  }
}

uint64_t __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearCurrentOpenInteraction];
}

- (void)_clearCurrentOpenInteractionUnlessUIPDocumentLanding
{
  if (![(UIDocumentBrowserViewController *)self enclosedInUIPDocumentLanding])
  {
    if (dyld_program_sdk_at_least())
    {
      objc_initWeak(&location, self);
      void block[5] = MEMORY[0x263EF8330];
      block[6] = 3221225472;
      block[7] = __87__UIDocumentBrowserViewController__clearCurrentOpenInteractionUnlessUIPDocumentLanding__block_invoke;
      block[8] = &unk_2641B18E8;
      objc_copyWeak(&v5, &location);
      DOCRunInMainThread();
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
    else
    {
      dispatch_time_t v3 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __87__UIDocumentBrowserViewController__clearCurrentOpenInteractionUnlessUIPDocumentLanding__block_invoke_2;
      block[3] = &unk_2641B15E8;
      void block[4] = self;
      dispatch_after(v3, MEMORY[0x263EF83A0], block);
    }
  }
}

void __87__UIDocumentBrowserViewController__clearCurrentOpenInteractionUnlessUIPDocumentLanding__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearCurrentOpenInteraction];
}

uint64_t __87__UIDocumentBrowserViewController__clearCurrentOpenInteractionUnlessUIPDocumentLanding__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearCurrentOpenInteraction];
}

- (void)_documentPickerWasCancelled
{
}

void __62__UIDocumentBrowserViewController__documentPickerWasCancelled__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [*(id *)(a1 + 32) delegate];
  id v6 = v4;
  if (v3)
  {
    [v4 documentBrowser:*(void *)(a1 + 32) didPickDocumentURLs:MEMORY[0x263EFFA68]];
  }
  else
  {
    char v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) delegate];
    [v6 documentManagerWasCancelled:*(void *)(a1 + 32)];
  }
}

- (void)_setURLCurrentlyBeingImported:(id)a3
{
}

- (void)_iOS_didRequestDocumentCreationWithHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = objc_msgSend(NSString, "stringWithFormat:", @"Got %s: %s", "iOS", "-[UIDocumentBrowserViewController _iOS_didRequestDocumentCreationWithHandler:]");
  id v6 = (NSObject **)MEMORY[0x263F3AC08];
  uint64_t v7 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    uint64_t v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = v5;
    uint64_t v9 = v7;
    *(_DWORD *)buf = 136315138;
    uint64_t v19 = [v8 UTF8String];
    _os_log_impl(&dword_21361D000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  uint64_t v10 = [(UIDocumentBrowserViewController *)self documentCreationController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__UIDocumentBrowserViewController__iOS_didRequestDocumentCreationWithHandler___block_invoke;
  v13[3] = &unk_2641B1910;
  objc_copyWeak(&v17, (id *)buf);
  id v11 = v4;
  id v16 = v11;
  id v12 = v10;
  id v14 = v12;
  id v15 = self;
  [(UIDocumentBrowserViewController *)self _core_didRequestDocumentCreationWithHandler:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __78__UIDocumentBrowserViewController__iOS_didRequestDocumentCreationWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  id v8 = WeakRetained;
  if (a3 && v6 && WeakRetained)
  {
    id v13 = 0;
    uint64_t v9 = [WeakRetained _sandboxingURLWrapperForURL:v6 readonly:a3 != 2 error:&v13];
    id v10 = v13;
    if (v10)
    {
      id v11 = (NSObject **)MEMORY[0x263F3AC08];
      id v12 = *MEMORY[0x263F3AC08];
      if (!*MEMORY[0x263F3AC08])
      {
        DOCInitLogging();
        id v12 = *v11;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __78__UIDocumentBrowserViewController__iOS_didRequestDocumentCreationWithHandler___block_invoke_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      [*(id *)(a1 + 40) _failedToImportDocumentAtURL:v6 error:v10];
    }
    else
    {
      objc_storeStrong(v8 + 125, a2);
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    [*(id *)(a1 + 32) didEndSessionWithImportedURL:0 canceled:1 error:0];
  }
}

- (void)_core_didRequestDocumentCreationWithHandler:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = NSString;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "stringWithFormat:", @"Got %s: %s", "core", "-[UIDocumentBrowserViewController _core_didRequestDocumentCreationWithHandler:]");
  uint64_t v7 = (NSObject **)MEMORY[0x263F3AC08];
  id v8 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    id v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = v6;
    id v10 = v8;
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = [v9 UTF8String];
    _os_log_impl(&dword_21361D000, v10, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v11 = (void *)MEMORY[0x21668E400](v5);

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke;
  v16[3] = &unk_2641B1938;
  objc_copyWeak(&v18, (id *)buf);
  id v12 = v11;
  id v17 = v12;
  id v13 = (void *)MEMORY[0x21668E400](v16);
  objc_copyWeak(&v15, (id *)buf);
  id v14 = v13;
  DOCRunInMainThread();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v18);

  objc_destroyWeak((id *)buf);
}

void __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = (NSObject **)MEMORY[0x263F3AC08];
  id v8 = *MEMORY[0x263F3AC08];
  if (WeakRetained)
  {
    if (!v8)
    {
      DOCInitLogging();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2048;
      uint64_t v13 = a3;
      _os_log_impl(&dword_21361D000, v8, OS_LOG_TYPE_DEFAULT, "Document creation (core) - completion called with url: %@, mode: %lu.", (uint8_t *)&v10, 0x16u);
    }
    if (v5 && a3) {
      [WeakRetained _setURLCurrentlyBeingImported:v5];
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (!v8)
    {
      DOCInitLogging();
      id v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_21361D000, v8, OS_LOG_TYPE_DEFAULT, "Document creation (core) skipped - strongSelf == nil", (uint8_t *)&v10, 2u);
    }
    id v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

void __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke_258(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained documentCreationController];
    if ([v4 handlesDidRequestDocumentCreation])
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      void v9[2] = __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke_259;
      v9[3] = &unk_2641B1960;
      id v10 = *(id *)(a1 + 32);
      [v4 performDidRequestDocumentCreationWithHandler:v9];
    }
    else
    {
      uint64_t v7 = (NSObject **)MEMORY[0x263F3AC08];
      id v8 = *MEMORY[0x263F3AC08];
      if (!*MEMORY[0x263F3AC08])
      {
        DOCInitLogging();
        id v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21361D000, v8, OS_LOG_TYPE_DEFAULT, "Document creation (core) skipped - handlesDidRequestDocumentCreation == false", buf, 2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    id v5 = (NSObject **)MEMORY[0x263F3AC08];
    id v6 = *MEMORY[0x263F3AC08];
    if (!*MEMORY[0x263F3AC08])
    {
      DOCInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21361D000, v6, OS_LOG_TYPE_DEFAULT, "Document creation (core) skipped - strongSelf == nil", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __79__UIDocumentBrowserViewController__core_didRequestDocumentCreationWithHandler___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_iOS_didImportDocumentAtURL:(id)a3 toDestinationItemBookmark:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Got %s: %s", "iOS", "-[UIDocumentBrowserViewController _iOS_didImportDocumentAtURL:toDestinationItemBookmark:]");
  id v9 = (NSObject **)MEMORY[0x263F3AC08];
  id v10 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    id v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v8;
    __int16 v12 = v10;
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = [v11 UTF8String];
    _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
  self->_urlCurrentlyBeingImported = 0;

  id v16 = v6;
  id v14 = v6;
  id v15 = v7;
  DOCRunInMainThread();
}

void __89__UIDocumentBrowserViewController__iOS_didImportDocumentAtURL_toDestinationItemBookmark___block_invoke(uint64_t a1)
{
  uint64_t v2 = (NSObject **)MEMORY[0x263F3AC08];
  char v3 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    char v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21361D000, v3, OS_LOG_TYPE_INFO, "prepareForMode: _didImportDocumentAtURL with usingBookmark == YES", buf, 2u);
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) configuration];
  uint64_t v6 = [v5 interactionModeForPreparing];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __89__UIDocumentBrowserViewController__iOS_didImportDocumentAtURL_toDestinationItemBookmark___block_invoke_260;
  v8[3] = &unk_2641B16C0;
  id v7 = *(void **)(a1 + 48);
  void v8[4] = *(void *)(a1 + 40);
  id v9 = v7;
  id v10 = *(id *)(a1 + 32);
  [v4 prepareForMode:v6 usingBookmark:1 completionBlock:v8];
}

void __89__UIDocumentBrowserViewController__iOS_didImportDocumentAtURL_toDestinationItemBookmark___block_invoke_260(uint64_t a1, char a2)
{
  if (a2)
  {
    char v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 48) fileURL];
    objc_msgSend(v3, "_core_didImportDocumentAtURL:toDestinationURL:", v4);
  }
  else
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.DocumentManager" code:1 userInfo:0];
    objc_msgSend(*(id *)(a1 + 32), "_failedToImportDocumentAtURL:error:", *(void *)(a1 + 40));
  }
}

- (void)_core_didImportDocumentAtURL:(id)a3 toDestinationURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Got %s: %s", "core", "-[UIDocumentBrowserViewController _core_didImportDocumentAtURL:toDestinationURL:]");
  id v9 = (NSObject **)MEMORY[0x263F3AC08];
  id v10 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    id v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v8;
    __int16 v12 = v10;
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = [v11 UTF8String];
    _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
  self->_urlCurrentlyBeingImported = 0;

  id v16 = v6;
  id v14 = v7;
  id v15 = v6;
  DOCRunInMainThread();
}

void __81__UIDocumentBrowserViewController__core_didImportDocumentAtURL_toDestinationURL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) documentCreationController];
  [v2 performDidImportDocumentAtURL:*(void *)(a1 + 40) toDestinationURL:*(void *)(a1 + 48)];
}

- (void)_iOS_failedToImportDocumentAtURL:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Got %s: %s", "iOS", "-[UIDocumentBrowserViewController _iOS_failedToImportDocumentAtURL:error:]");
  id v9 = (NSObject **)MEMORY[0x263F3AC08];
  id v10 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    id v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v8;
    __int16 v12 = v10;
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = [v11 UTF8String];
    _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
  self->_urlCurrentlyBeingImported = 0;

  id v16 = v6;
  id v14 = v7;
  id v15 = v6;
  DOCRunInMainThread();
}

void __74__UIDocumentBrowserViewController__iOS_failedToImportDocumentAtURL_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) documentCreationController];
  [v2 performFailedToImportDocumentAtURL:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_core_failedToImportDocumentAtURL:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"Got %s: %s", "core", "-[UIDocumentBrowserViewController _core_failedToImportDocumentAtURL:error:]");
  id v9 = (NSObject **)MEMORY[0x263F3AC08];
  id v10 = *MEMORY[0x263F3AC08];
  if (!*MEMORY[0x263F3AC08])
  {
    DOCInitLogging();
    id v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = v8;
    __int16 v12 = v10;
    *(_DWORD *)buf = 136315138;
    uint64_t v18 = [v11 UTF8String];
    _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  urlCurrentlyBeingImported = self->_urlCurrentlyBeingImported;
  self->_urlCurrentlyBeingImported = 0;

  id v16 = v6;
  id v14 = v7;
  id v15 = v6;
  DOCRunInMainThread();
}

void __75__UIDocumentBrowserViewController__core_failedToImportDocumentAtURL_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) documentCreationController];
  [v2 performFailedToImportDocumentAtURL:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)_updateRemoteBarButtonFrames:(id)a3 forUUID:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  DOCRunInMainThread();
}

void __72__UIDocumentBrowserViewController__updateRemoteBarButtonFrames_forUUID___block_invoke(id *a1)
{
  id v2 = [a1[4] presentedViewController];
  id v22 = [v2 popoverPresentationController];

  if ([a1[5] count])
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = [a1[5] objectAtIndexedSubscript:v3];
      [v4 CGRectValue];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;

      uint64_t v13 = [a1[6] objectAtIndexedSubscript:v3];
      id v14 = [a1[4] trackingViewForUUID:v13];
      id v15 = [a1[4] remoteBarButtonForUUID:v13];
      objc_msgSend(v14, "setFrame:", v6, v8, v10, v12);
      if (v22)
      {
        id v16 = [v22 barButtonItem];
        id v17 = [v15 barButton];

        if (v16 == v17)
        {
          uint64_t v18 = [v22 containerView];
          [v18 setNeedsLayout];
        }
      }

      ++v3;
    }
    while ([a1[5] count] > v3);
  }
  uint64_t v19 = [a1[4] delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    uint64_t v21 = [a1[4] delegate];
    [v21 documentBrowserDidUpdateAdditionalNavigationBarButtonItems:a1[4]];
  }
}

- (void)_didTriggerBarButtonWithUUID:(id)a3 overflowAction:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  DOCRunInMainThread();
}

void __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke(uint64_t a1)
{
  *(void *)&v29[5] = *MEMORY[0x263EF8340];
  id v2 = (NSObject **)MEMORY[0x263F3AC28];
  unint64_t v3 = *MEMORY[0x263F3AC28];
  if (!*MEMORY[0x263F3AC28])
  {
    DOCInitLogging();
    unint64_t v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = v3;
    double v6 = [v4 UUIDString];
    *(_DWORD *)buf = 138412290;
    *(void *)__int16 v29 = v6;
    _os_log_impl(&dword_21361D000, v5, OS_LOG_TYPE_INFO, "_didTriggerBarButtonWithUUID: %@", buf, 0xCu);
  }
  double v7 = (void **)(a1 + 32);
  double v8 = [*(id *)(a1 + 40) remoteBarButtonForUUID:*(void *)(a1 + 32)];
  if (v8)
  {
    double v9 = *v2;
    if (!*v2)
    {
      DOCInitLogging();
      double v9 = *v2;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double v10 = *v7;
      double v11 = v9;
      double v12 = [v10 UUIDString];
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v29 = v12;
      _os_log_impl(&dword_21361D000, v11, OS_LOG_TYPE_INFO, "_didTriggerBarButtonWithUUID: %@ button found, perform action", buf, 0xCu);
    }
    if (*(unsigned char *)(a1 + 48)) {
      [v8 performOverflowAction];
    }
    else {
      [v8 performPrimaryAction];
    }
  }
  else
  {
    uint64_t v13 = objc_opt_new();
    [v13 addObjectsFromArray:*(void *)(*(void *)(a1 + 40) + 1072)];
    [v13 addObjectsFromArray:*(void *)(*(void *)(a1 + 40) + 1080)];
    id v14 = *v2;
    if (!*v2)
    {
      DOCInitLogging();
      id v14 = *v2;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_3((uint64_t)v7, v14);
    }
    id v15 = *v2;
    if (!*v2)
    {
      DOCInitLogging();
      id v15 = *v2;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_2();
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * v20);
          id v22 = *v2;
          if (!*v2)
          {
            DOCInitLogging();
            id v22 = *v2;
          }
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_1(buf, v22, v21, v29);
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v18);
    }
  }
}

- (void)_fallbackRenameDocumentAtURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  double v8 = (void (**)(id, void, id))a5;
  id v13 = 0;
  double v9 = +[DOCFileRenamingSupport fallbackRename:v7 toProposedName:a4 error:&v13];
  id v10 = v13;
  double v11 = (NSObject **)MEMORY[0x263F3AC28];
  double v12 = *MEMORY[0x263F3AC28];
  if (!v9)
  {
    if (!v12)
    {
      DOCInitLogging();
      double v12 = *v11;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[UIDocumentBrowserViewController _fallbackRenameDocumentAtURL:proposedName:completionHandler:](v12);
      if (v10) {
        goto LABEL_12;
      }
    }
    else if (v10)
    {
LABEL_12:
      v8[2](v8, 0, v10);
      goto LABEL_13;
    }
    id v10 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
    goto LABEL_12;
  }
  if (!v12)
  {
    DOCInitLogging();
    double v12 = *v11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl(&dword_21361D000, v12, OS_LOG_TYPE_INFO, "Success. Renamed from: %@ to: %@", buf, 0x16u);
  }
  ((void (**)(id, void *, id))v8)[2](v8, v9, 0);
LABEL_13:
}

- (void)renameDocumentAtURL:(NSURL *)documentURL proposedName:(NSString *)proposedName completionHandler:(void *)completionHandler
{
  double v9 = documentURL;
  id v10 = proposedName;
  double v11 = completionHandler;
  double v12 = (void (**)(void, void, void))v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_20:
    id v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"UIDocumentBrowserViewController.m" lineNumber:2715 description:@"renameDocumentAtURL:proposedName:completionHandler: should not be called with a nil completionHandler"];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_21;
  }
  long long v26 = [MEMORY[0x263F08690] currentHandler];
  [v26 handleFailureInMethod:a2 object:self file:@"UIDocumentBrowserViewController.m" lineNumber:2714 description:@"renameDocumentAtURL:proposedName:completionHandler: should not be called with a nil url"];

  if (!v12) {
    goto LABEL_20;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_21:
  id v28 = [MEMORY[0x263F08690] currentHandler];
  [v28 handleFailureInMethod:a2 object:self file:@"UIDocumentBrowserViewController.m" lineNumber:2716 description:@"renameDocumentAtURL:proposedName:completionHandler: should not be called with a nil proposedName"];

LABEL_4:
  v39[0] = 0;
  id v13 = [MEMORY[0x263F054E0] wrapperWithURL:v9 readonly:0 error:v39];
  id v14 = v39[0];
  id v15 = v14;
  if (v13)
  {
    id v30 = v14;
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke;
    v35[3] = &unk_2641B1A00;
    void v35[4] = self;
    __int16 v16 = v9;
    long long v36 = v16;
    uint64_t v17 = v10;
    char v37 = v17;
    uint64_t v18 = v12;
    id v38 = v18;
    __int16 v29 = (void *)MEMORY[0x21668E400](v35);
    uint64_t v19 = self;
    serviceProxy = self->_serviceProxy;
    uint64_t v21 = (NSObject **)MEMORY[0x263F3AC50];
    id v22 = *MEMORY[0x263F3AC50];
    if (serviceProxy)
    {
      if (!v22)
      {
        DOCInitLogging();
        id v22 = *v21;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[UIDocumentBrowserViewController renameDocumentAtURL:proposedName:completionHandler:]();
      }
      long long v23 = v19->_serviceProxy;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_274;
      v33[3] = &unk_2641B12C8;
      uint64_t v34 = v18;
      long long v24 = [(DOCServiceDocumentBrowserViewControllerInterface *)v23 remoteObjectProxyWithErrorHandler:v33];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_3;
      v31[3] = &unk_2641B1A28;
      long long v25 = v29;
      id v32 = v29;
      [v24 _renameDocumentAtURL:v13 newName:v17 completion:v31];
    }
    else
    {
      if (!v22)
      {
        DOCInitLogging();
        id v22 = *v21;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[UIDocumentBrowserViewController renameDocumentAtURL:proposedName:completionHandler:]();
      }
      long long v25 = v29;
      objc_msgSend(MEMORY[0x263F3ABB0], "_spi_renameDocumentAtURL:proposedName:completionHandler:", v16, v17, v29);
    }

    id v15 = v30;
  }
  else
  {
    ((void (**)(void, void, id))v12)[2](v12, 0, v14);
  }
}

void __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = a1[7];
  id v6 = v5;
  id v7 = v8;
  DOCRunInMainThread();
}

uint64_t __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) domain];
  if ([v2 isEqual:*MEMORY[0x263F07F70]])
  {
    uint64_t v3 = [*(id *)(a1 + 32) code];

    if (v3 == 4)
    {
      id v4 = *(void **)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 72);
      return [v4 _fallbackRenameDocumentAtURL:v5 proposedName:v6 completionHandler:v7];
    }
  }
  else
  {
  }
  id v9 = [*(id *)(a1 + 64) path];
  [v9 UTF8String];
  sandbox_extension_update_file();

  id v10 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
  return v10();
}

void __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_274(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = *(id *)(a1 + 32);
  id v4 = v3;
  DOCRunInMainThread();
}

uint64_t __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_2_275(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __86__UIDocumentBrowserViewController_renameDocumentAtURL_proposedName_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 url];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

- (void)forwardHostSceneIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__UIDocumentBrowserViewController_forwardHostSceneIdentifier___block_invoke;
  v6[3] = &unk_2641B10A8;
  id v7 = v4;
  id v5 = v4;
  [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v6];
}

uint64_t __62__UIDocumentBrowserViewController_forwardHostSceneIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setSceneIdentifier:*(void *)(a1 + 32)];
}

+ (id)placeholderURLForDownloadsFolder
{
  if (placeholderURLForDownloadsFolder_onceToken != -1) {
    dispatch_once(&placeholderURLForDownloadsFolder_onceToken, &__block_literal_global_284);
  }
  id v2 = (void *)placeholderURLForDownloadsFolder__placeholderURLForDownloadsFolder;
  return v2;
}

uint64_t __67__UIDocumentBrowserViewController_placeholderURLForDownloadsFolder__block_invoke()
{
  uint64_t v0 = [NSURL URLWithString:UIDocumentBrowserDownloadsFolderPlaceholderPath];
  uint64_t v1 = placeholderURLForDownloadsFolder__placeholderURLForDownloadsFolder;
  placeholderURLForDownloadsFolder__placeholderURLForDownloadsFolder = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)manageOverrideIfNecessaryForPresentationController:(id)a3
{
  id v8 = a3;
  id v4 = [v8 presentedViewController];
  if ([(UIDocumentBrowserViewController *)self overrideUserInterfaceStyle])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (dyld_program_sdk_at_least())
      {
        id v5 = [(UIDocumentBrowserViewController *)self traitCollection];
        uint64_t v6 = [v5 userInterfaceStyle];

        id v7 = [v8 traitOverrides];
        [v7 setUserInterfaceStyle:v6];

        [v8 setDelegate:self];
      }
    }
  }
}

- (void)presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
}

- (NSArray)leadingBarButtonTrackingViews
{
  return self->_leadingBarButtonTrackingViews;
}

- (void)setLeadingBarButtonTrackingViews:(id)a3
{
}

- (NSArray)trailingBarButtonTrackingViews
{
  return self->_trailingBarButtonTrackingViews;
}

- (void)setTrailingBarButtonTrackingViews:(id)a3
{
}

- (NSArray)remoteAdditionalLeadingNavigationBarButtonItems
{
  return self->_remoteAdditionalLeadingNavigationBarButtonItems;
}

- (void)setRemoteAdditionalLeadingNavigationBarButtonItems:(id)a3
{
}

- (NSArray)remoteAdditionalTrailingNavigationBarButtonItems
{
  return self->_remoteAdditionalTrailingNavigationBarButtonItems;
}

- (void)setRemoteAdditionalTrailingNavigationBarButtonItems:(id)a3
{
}

- (UIViewController)dummySplitViewController
{
  return self->_dummySplitViewController;
}

- (void)setDummySplitViewController:(id)a3
{
}

- (DOCRemoteContainerViewController)remoteViewController
{
  return self->_remoteViewController;
}

- (void)setRemoteViewController:(id)a3
{
}

- (DOCDocBrowserVC_UIActivityViewController)activityViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityViewController);
  return (DOCDocBrowserVC_UIActivityViewController *)WeakRetained;
}

- (void)setActivityViewController:(id)a3
{
}

- (DOCServiceDocumentBrowserViewControllerInterface)serviceProxy
{
  return self->_serviceProxy;
}

- (void)setServiceProxy:(id)a3
{
}

- (NSOperationQueue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (DOCUIPBrowserState)preferredUIPBrowserState
{
  return self->_preferredUIPBrowserState;
}

- (BOOL)remoteHasReceivedInitialUIPBrowserState
{
  return self->_remoteHasReceivedInitialUIPBrowserState;
}

- (void)setRemoteHasReceivedInitialUIPBrowserState:(BOOL)a3
{
  self->_remoteHasReceivedInitialUIPBrowserState = a3;
}

- (UISheetPresentationController)observedUIPPresentationController
{
  return self->_observedUIPPresentationController;
}

- (void)setDocumentLandingPresenter:(id)a3
{
}

- (void)setConfiguration:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_documentLandingPresenter);
  objc_storeStrong((id *)&self->_observedUIPPresentationController, 0);
  objc_storeStrong((id *)&self->_preferredUIPBrowserState, 0);
  objc_storeStrong((id *)&self->_documentCreationController, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_destroyWeak((id *)&self->_activityViewController);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_dummySplitViewController, 0);
  objc_storeStrong((id *)&self->_remoteAdditionalTrailingNavigationBarButtonItems, 0);
  objc_storeStrong((id *)&self->_remoteAdditionalLeadingNavigationBarButtonItems, 0);
  objc_storeStrong((id *)&self->_trailingBarButtonTrackingViews, 0);
  objc_storeStrong((id *)&self->_leadingBarButtonTrackingViews, 0);
  objc_storeStrong((id *)&self->_customActions, 0);
  objc_storeStrong((id *)&self->_additionalTrailingNavigationBarButtonItems, 0);
  objc_storeStrong((id *)&self->_additionalLeadingNavigationBarButtonItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uipTransitionCoordinator, 0);
  objc_storeStrong((id *)&self->_urlCurrentlyBeingImported, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_trackingViewsContainer, 0);
}

- (int64_t)_currentLandingModeBasedForObservedPresentationController
{
  id v3 = self->_observedUIPPresentationController;
  id v4 = v3;
  if (v3)
  {
    id v5 = [(UISheetPresentationController *)v3 selectedDetentIdentifier];
    uint64_t v6 = [(UIDocumentBrowserViewController *)self traitCollection];
    uint64_t v7 = [v6 verticalSizeClass];

    if (v7 == 1)
    {
      uint64_t v8 = [(UISheetPresentationController *)v4 doc_detentForDocumentLandingMode:0];

      id v5 = (void *)v8;
    }
    int64_t v9 = [(UISheetPresentationController *)v4 doc_documentLandingModeForDetent:v5];
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

- (void)_sendBrowserLandingModeChangeForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_observedUIPPresentationController;
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F3ABD0]);
    objc_msgSend(v6, "setDocumentLandingMode:", -[UIDocumentBrowserViewController _currentLandingModeBasedForObservedPresentationController](self, "_currentLandingModeBasedForObservedPresentationController"));
    uint64_t v7 = (NSObject **)MEMORY[0x263F3AC28];
    uint64_t v8 = *MEMORY[0x263F3AC28];
    if (!*MEMORY[0x263F3AC28])
    {
      DOCInitLogging();
      uint64_t v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_21361D000, v8, OS_LOG_TYPE_DEFAULT, "Sending updated landingMode change in response to: %@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __104__UIDocumentBrowserViewController_DOCUIPPresentationController___sendBrowserLandingModeChangeForReason___block_invoke;
    v10[3] = &unk_2641B1030;
    objc_copyWeak(&v12, (id *)buf);
    id v9 = v6;
    id v11 = v9;
    [(UIDocumentBrowserViewController *)self addOperationToServiceQueue:v10];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __104__UIDocumentBrowserViewController_DOCUIPPresentationController___sendBrowserLandingModeChangeForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _sendBrowserChange:*(void *)(a1 + 32) serviceProxy:v4];
}

uint64_t __106__UIDocumentBrowserViewController_DOCUIPPresentationController___beginMonitoringUIPPresentationController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkIfObservedUIPPresentationControllerDetentDidChangeForReason:@"did change notification"];
}

- (void)_endMonitoringUIPPresentationController
{
  observedUIPPresentationController = self->_observedUIPPresentationController;
  if (observedUIPPresentationController)
  {
    id v4 = (void *)MEMORY[0x263F08A00];
    uint64_t v7 = observedUIPPresentationController;
    id v5 = [v4 defaultCenter];
    [v5 removeObserver:self name:*MEMORY[0x263F83CB8] object:0];

    id v6 = self->_observedUIPPresentationController;
    self->_observedUIPPresentationController = 0;
  }
}

void __70__UIDocumentBrowserViewController__embedDocumentBrowserViewController__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Failed to get the remote browser View Controller with error (%@)", v2, v3, v4, v5, v6);
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "Unexpected error in revealDocumentAtURL - serviceProxy is nil", v2, v3, v4, v5, v6);
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_21361D000, v0, v1, "Unexpected error in revealDocumentAtURL, completion handler invoked multiple times", v2, v3, v4, v5, v6);
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_124_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "revealDocumentAtURL encountered an error: %@", v2, v3, v4, v5, v6);
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_2_128_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "prepareForMode: revealDocumentAtURL with usingBookmark == YES", v2, v3, v4, v5, v6);
}

void __81__UIDocumentBrowserViewController_revealDocumentAtURL_importIfNeeded_completion___block_invoke_129_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "revealDocumentAtURL was unable to prepareForMode:", v2, v3, v4, v5, v6);
}

void __92__UIDocumentBrowserViewController__importDocumentAtURL_neighbourURL_mode_completionHandler___block_invoke_2_141_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Error trying to create a sandbox extension for the neighbour url %@", v2, v3, v4, v5, v6);
}

- (void)remoteViewControllerDidTerminateViewServiceWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "The UIDocumentBrowserViewController view service crashed for too many times in a row.", v2, v3, v4, v5, v6);
}

- (void)remoteViewControllerDidTerminateViewServiceWithError:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Remote view controller crashed with error: %@. Trying to relaunch.", v2, v3, v4, v5, v6);
}

- (void)remoteViewControllerDidTerminateViewServiceWithError:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_21361D000, v0, v1, "The DocumentManager service was terminated in the middle of importing/creating new document, the service will probably restart but the operation likely failed, so notifying the delegate", v2, v3, v4, v5, v6);
}

void __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Calling delegate -documentBrowser:didPickDocumentURLs: with an empty array of items. This indicates the items failed to be prepared and materialized on disk: %@", v2, v3, v4, v5, v6);
}

void __57__UIDocumentBrowserViewController__didPickItemBookmarks___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_21361D000, v0, v1, "Tried to call delegate -documentBrowser:didPickDocumentURLs: with an empty array of items. This indicates the items failed to be prepared and materialized on disk: %@", v2, v3, v4, v5, v6);
}

void __78__UIDocumentBrowserViewController__iOS_didRequestDocumentCreationWithHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_21361D000, v0, OS_LOG_TYPE_ERROR, "Cannot create urlWrapper for url %@. error %@.", v1, 0x16u);
}

void __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 uuid];
  id v9 = [v8 UUIDString];
  *(_DWORD *)a1 = 138412290;
  *a4 = v9;
  _os_log_error_impl(&dword_21361D000, v7, OS_LOG_TYPE_ERROR, "_didTriggerBarButtonWithUUID                                       %@", a1, 0xCu);
}

void __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21361D000, v0, v1, "_didTriggerBarButtonWithUUID                                       Existing UUIDs:", v2, v3, v4, v5, v6);
}

void __79__UIDocumentBrowserViewController__didTriggerBarButtonWithUUID_overflowAction___block_invoke_cold_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_6() UUIDString];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_21361D000, v5, v6, "_didTriggerBarButtonWithUUID: Button not found to perform action. Requested UUID: %@", v7, v8, v9, v10, v11);
}

- (void)_fallbackRenameDocumentAtURL:(void *)a1 proposedName:completionHandler:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_6() localizedDescription];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_21361D000, v4, v5, "Error. Rename failed: %@", v6, v7, v8, v9, v10);
}

- (void)renameDocumentAtURL:proposedName:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_21361D000, v0, v1, "%@ Starting rename for %@ using XPC service");
}

- (void)renameDocumentAtURL:proposedName:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_21361D000, v0, v1, "%@ Starting rename for %@ using running document manager service");
}

@end