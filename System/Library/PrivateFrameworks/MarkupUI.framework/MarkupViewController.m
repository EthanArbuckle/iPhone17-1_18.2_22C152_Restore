@interface MarkupViewController
+ (BOOL)_isInLowMemoryEnvironment;
+ (BOOL)hasPrivateImageMetadata:(id)a3;
+ (double)_maxImageDimensionInView;
+ (id)cleanImageMetadataFromData:(id)a3;
+ (id)markupBarButtonItemWithTarget:(id)a3 action:(SEL)a4;
+ (id)supportedOutputTypes;
- (AKController)annotationController;
- (AKToolbarView)modernToolbar;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldShowUndoRedoButtonsInNavigationBar;
- (BOOL)_sourceImageMayContainBaseImageAndModel;
- (BOOL)_useLegacyToolbar;
- (BOOL)_writeToDataConsumer:(CGDataConsumer *)a3 embedSourceImageAndEditModel:(BOOL)a4 error:(id *)a5;
- (BOOL)_writeToDataConsumer:(CGDataConsumer *)a3 embedSourceImageAndEditModel:(BOOL)a4 options:(id)a5 error:(id *)a6;
- (BOOL)allEditingDisabled;
- (BOOL)allowShakeToUndo;
- (BOOL)allowsThumbnailViewPageReordering;
- (BOOL)alreadyLoggedSavingForThisDocument;
- (BOOL)annotationEditingEnabled;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)centersIgnoringContentInsets;
- (BOOL)contentViewController:(id)a3 shouldHandleURL:(id)a4;
- (BOOL)encryptPrivateMetadata;
- (BOOL)fixedThumbnailView;
- (BOOL)forcesPDFViewTopAlignment;
- (BOOL)formFillingEnabled;
- (BOOL)isAnimatingMarkupExtensionTransition;
- (BOOL)isNavigationModeHorizontal;
- (BOOL)isObservingAKCurrentPageIndex;
- (BOOL)isShapeDetectionEnabled;
- (BOOL)isThumbnailViewHidden;
- (BOOL)isToolbarHidden;
- (BOOL)isTouchInThumbnailView:(id)a3;
- (BOOL)isUsedOnDarkBackground;
- (BOOL)needToPerformDocumentClosedTeardown;
- (BOOL)needToPerformFullTeardown;
- (BOOL)needsToolPickerVisibleWhenAnnotationControllerIsAvailable;
- (BOOL)pencilAlwaysDraws;
- (BOOL)rulerHostWantsSharedRuler;
- (BOOL)showAsFormSheet;
- (BOOL)showShareButtonInToolbar;
- (BOOL)showThumbnailViewForMultipage;
- (BOOL)useFancyTransition;
- (BOOL)userDidCancel;
- (BOOL)validateRedo:(id)a3;
- (BOOL)validateUndo:(id)a3;
- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 options:(id)a5 error:(id *)a6;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5;
- (CGSize)adjustedSourceImageSize;
- (MUContentViewControllerProtocol)contentViewController;
- (MarkupViewController)initWithCoder:(id)a3;
- (MarkupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MarkupViewControllerDelegate)delegate;
- (NSData)archivedModelData;
- (NSLayoutConstraint)toolbarBottomConstraint;
- (NSLayoutConstraint)toolbarTopAttachedConstraint;
- (NSLayoutConstraint)toolbarTopConstraint;
- (NSString)hostProcessBundleIdentifier;
- (NSString)originalImageDescription;
- (NSString)outputType;
- (NSString)preferredFileDisplayName;
- (NSString)sourceContentType;
- (NSUndoManager)akUndoManager;
- (UIBarButtonItem)cancelButton;
- (UIBarButtonItem)doneButton;
- (UIColor)backgroundColor;
- (UIColor)navBarTitleColor;
- (UIColor)toolbarItemTintColor;
- (UIColor)toolbarTintColor;
- (UIEdgeInsets)sketchOverlayInsets;
- (UIImage)placeholderImage;
- (UIImageView)placeholderImageView;
- (UINavigationBar)navBar;
- (UINavigationItem)navItem;
- (UIScrollView)contentViewScrollView;
- (UIView)contentContainerView;
- (UIView)imageViewCombinedContentView;
- (UIView)pageLabelView;
- (UIView)toolbar;
- (UIView)transitionDimmingView;
- (UIView)whiteView;
- (UTType)outputContentType;
- (double)initialContentScale;
- (id)_effectiveBackgroundColor;
- (id)_effectiveNavBarTitleColor;
- (id)_effectiveToolbarItemTintColor;
- (id)_effectiveToolbarTintColor;
- (id)_markupBlackColor;
- (id)_pdfDocument;
- (id)_pdfView;
- (id)annotationControllerOfContentViewController:(id)a3 willSetToolbarItems:(id)a4;
- (id)createArchivedModelData;
- (id)dataRepresentationEmbeddingSourceImageAndEditModel:(BOOL)a3 error:(id *)a4;
- (id)dataRepresentationWithError:(id *)a3;
- (id)digestedSourceContent;
- (id)filteredToolbarItemsForItems:(id)a3 fromController:(id)a4;
- (id)getMenuElementsForPage:(id)a3;
- (id)sourceContent;
- (int64_t)positionForBar:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)thumbnailViewStyle;
- (int64_t)toolbarController:(id)a3 positionForBar:(id)a4;
- (int64_t)toolbarPosition;
- (unint64_t)currentPDFPageIndex;
- (unint64_t)inkStyle;
- (void)_cancel;
- (void)_cleanupPlaceholderImage;
- (void)_commonInit;
- (void)_createCancelDoneNavBar;
- (void)_installContentViewControllerForUTI:(id)a3;
- (void)_loadSourceContentWithCompletion:(id)a3;
- (void)_notifyDidChangeShowingSignaturesUI;
- (void)_presentPlaceholderImage;
- (void)_saveEditing:(id)a3;
- (void)_setFileURL:(id)a3 withArchivedModelData:(id)a4 withCompletion:(id)a5;
- (void)_setLegacyToolbarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)_setThumbnailViewHidden:(BOOL)a3;
- (void)_setupAnnotationController;
- (void)_setupInitialBaseModelScaleFactorWithScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4;
- (void)_showTextStyleOptions:(id)a3;
- (void)_startObservingAnnotationController;
- (void)_stopObservingAnnotationController;
- (void)_toolbarShareButtonTapped:(id)a3;
- (void)_updateAndLoadSourceContent:(id)a3 withArchivedModelData:(id)a4 withCompletion:(id)a5;
- (void)_updateAppearanceForTraitCollection:(id)a3;
- (void)_updateConstraintsForBarPosition:(int64_t)a3;
- (void)_updateNavBarProperties;
- (void)_updateundoBarButtonWithController:(id)a3;
- (void)adjustContentInsetsForBars;
- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4;
- (void)cancel:(id)a3;
- (void)controllerWillDismissSignatureCaptureView:(id)a3;
- (void)controllerWillDismissSignatureManagerView:(id)a3;
- (void)controllerWillShowSignatureCaptureView:(id)a3;
- (void)controllerWillShowSignatureManagerView:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)documentDidCloseTeardown;
- (void)done:(id)a3;
- (void)duplicate:(id)a3;
- (void)editTextAnnotation:(id)a3;
- (void)finalizeCrop;
- (void)fullTeardown;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)positionSketchOverlay:(id)a3 forContentViewController:(id)a4;
- (void)redo:(id)a3;
- (void)restoreToolModeForContentType;
- (void)revert;
- (void)setAkUndoManager:(id)a3;
- (void)setAllEditingDisabled:(BOOL)a3;
- (void)setAllowShakeToUndo:(BOOL)a3;
- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3;
- (void)setAlreadyLoggedSavingForThisDocument:(BOOL)a3;
- (void)setAnnotationEditingEnabled:(BOOL)a3;
- (void)setArchivedModelData:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCentersIgnoringContentInsets:(BOOL)a3;
- (void)setContentContainerView:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setCurrentPDFPageIndex:(unint64_t)a3;
- (void)setData:(id)a3;
- (void)setData:(id)a3 withArchivedModelData:(id)a4;
- (void)setData:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDigestedSourceContent:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setEncryptPrivateMetadata:(BOOL)a3;
- (void)setFileURL:(id)a3;
- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4;
- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5;
- (void)setFixedThumbnailView:(BOOL)a3;
- (void)setForcesPDFViewTopAlignment:(BOOL)a3;
- (void)setFormFillingEnabled:(BOOL)a3;
- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4;
- (void)setHostProcessBundleIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 withArchivedModelData:(id)a4;
- (void)setImage:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5;
- (void)setInitialContentScale:(double)a3;
- (void)setInkStyle:(unint64_t)a3;
- (void)setIsAnimatingMarkupExtensionTransition:(BOOL)a3;
- (void)setModernToolbar:(id)a3;
- (void)setNavBar:(id)a3;
- (void)setNavBarTitleColor:(id)a3;
- (void)setNavItem:(id)a3;
- (void)setNavigationModeHorizontal:(BOOL)a3;
- (void)setNeedToPerformDocumentClosedTeardown:(BOOL)a3;
- (void)setNeedToPerformFullTeardown:(BOOL)a3;
- (void)setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:(BOOL)a3;
- (void)setObservingAKCurrentPageIndex:(BOOL)a3;
- (void)setOriginalImageDescription:(id)a3;
- (void)setPencilAlwaysDraws:(BOOL)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setPlaceholderImageView:(id)a3;
- (void)setPreferredFileDisplayName:(id)a3;
- (void)setShapeDetectionEnabled:(BOOL)a3;
- (void)setShowAsFormSheet:(BOOL)a3;
- (void)setShowShareButtonInToolbar:(BOOL)a3;
- (void)setShowThumbnailViewForMultipage:(BOOL)a3;
- (void)setSourceContent:(id)a3;
- (void)setSourceContent:(id)a3 withArchivedModelData:(id)a4;
- (void)setSourceContentType:(id)a3;
- (void)setThumbnailViewStyle:(int64_t)a3;
- (void)setToolbar:(id)a3;
- (void)setToolbarBottomConstraint:(id)a3;
- (void)setToolbarHidden:(BOOL)a3;
- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setToolbarItemTintColor:(id)a3;
- (void)setToolbarPosition:(int64_t)a3;
- (void)setToolbarTintColor:(id)a3;
- (void)setToolbarTopAttachedConstraint:(id)a3;
- (void)setToolbarTopConstraint:(id)a3;
- (void)setTransitionDimmingView:(id)a3;
- (void)setUseFancyTransition:(BOOL)a3;
- (void)setUserDidCancel:(BOOL)a3;
- (void)setWhiteView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)undo:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willBeginLoadingNewDocument;
@end

@implementation MarkupViewController

- (MarkupViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MarkupViewController;
  v3 = [(MarkupViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(MarkupViewController *)v3 _commonInit];
  }
  return v4;
}

- (MarkupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MarkupViewController;
  v4 = [(MarkupViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(MarkupViewController *)v4 _commonInit];
  }
  return v5;
}

- (void)_commonInit
{
  kdebug_trace();
  v3 = [MEMORY[0x263F086E0] mainBundle];
  v4 = [v3 bundleIdentifier];
  hostProcessBundleIdentifier = self->_hostProcessBundleIdentifier;
  self->_hostProcessBundleIdentifier = v4;

  [MEMORY[0x263F14770] EnableAnnotationKit];
  self->_toolbarHidden = 0;
  self->_shapeDetectionEnabled = 1;
  self->_toolbarPosition = 1;
  self->_allowShakeToUndo = 1;
  self->_thumbnailViewHidden = 1;
  self->_navigationModeHorizontal = 0;
  self->_initialContentScale = 1.0;
  self->_encryptPrivateMetadata = 1;
  self->_showAsFormSheet = 0;
  self->_pencilAlwaysDraws = [MEMORY[0x263F24BB8] canConnectToStylus];
  if (![(MarkupViewController *)self _useLegacyToolbar])
  {
    id v6 = objc_alloc(MEMORY[0x263F24C78]);
    objc_super v7 = (AKToolbarView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    modernToolbar = self->_modernToolbar;
    self->_modernToolbar = v7;

    objc_storeStrong((id *)&self->_toolbar, self->_modernToolbar);
    [(AKToolbarView *)self->_modernToolbar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(AKToolbarView *)self->_modernToolbar setContentsHidden:1];
  }
  [(MarkupViewController *)self setNeedToPerformFullTeardown:1];
}

- (void)dealloc
{
  [(MarkupViewController *)self fullTeardown];
  v3.receiver = self;
  v3.super_class = (Class)MarkupViewController;
  [(MarkupViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  objc_super v3 = [(MarkupViewController *)self delegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v4 = [v3 controllerCanShowWhileLocked:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)willBeginLoadingNewDocument
{
  if ([(MarkupViewController *)self needToPerformDocumentClosedTeardown]) {
    [(MarkupViewController *)self documentDidCloseTeardown];
  }
  [(MarkupViewController *)self setNeedToPerformDocumentClosedTeardown:1];
}

- (void)fullTeardown
{
  if ([(MarkupViewController *)self needToPerformFullTeardown])
  {
    [(MarkupViewController *)self setNeedToPerformFullTeardown:0];
    [(MarkupViewController *)self documentDidCloseTeardown];
    [(MarkupViewController *)self setContentContainerView:0];
    NSLog(&cfstr_FullteardownPe.isa);
  }
}

- (void)documentDidCloseTeardown
{
  NSLog(&cfstr_Documentdidclo.isa, a2);
  if ([(MarkupViewController *)self needToPerformDocumentClosedTeardown])
  {
    [(MarkupViewController *)self setNeedToPerformDocumentClosedTeardown:0];
    objc_super v3 = [(MarkupViewController *)self contentViewController];
    [v3 uninstallAllAnnotationControllerOverlays];

    char v4 = [(MarkupViewController *)self toolbarTopConstraint];
    [v4 setActive:0];

    v5 = [(MarkupViewController *)self toolbarTopAttachedConstraint];
    [v5 setActive:0];

    id v6 = [(MarkupViewController *)self toolbarBottomConstraint];
    [v6 setActive:0];

    [(MarkupViewController *)self setToolbarTopConstraint:0];
    [(MarkupViewController *)self setToolbarTopAttachedConstraint:0];
    [(MarkupViewController *)self setToolbarBottomConstraint:0];
    if ([(MarkupViewController *)self _useLegacyToolbar])
    {
      objc_super v7 = [(MarkupViewController *)self annotationController];
      v8 = [v7 toolbarViewController];

      v9 = [v8 view];
      [v9 setDelegate:0];

      [v8 willMoveToParentViewController:0];
      [v8 removeFromParentViewController];
      v10 = [(MarkupViewController *)self annotationController];
      v11 = [v10 toolbarView];
      [v11 removeFromSuperview];
    }
    v12 = [(MarkupViewController *)self toolbar];
    [v12 removeFromSuperview];

    [(MarkupViewController *)self setToolbar:0];
    [(MarkupViewController *)self _stopObservingAnnotationController];
    v13 = [(MarkupViewController *)self contentViewController];
    [v13 willMoveToParentViewController:0];

    v14 = [(MarkupViewController *)self contentViewController];
    [v14 removeFromParentViewController];

    v15 = [(MarkupViewController *)self contentViewController];
    v16 = [v15 view];
    [v16 removeFromSuperview];

    v17 = [(MarkupViewController *)self contentViewController];
    [v17 teardown];

    [(MarkupViewController *)self setContentViewController:0];
    [(MarkupViewController *)self setAkUndoManager:0];
    [(MarkupViewController *)self setSourceContent:0];
    [(MarkupViewController *)self setDigestedSourceContent:0];
    [(MarkupViewController *)self setSourceContentType:0];
    v18 = [(MarkupViewController *)self navBar];
    [v18 setDelegate:0];

    [(MarkupViewController *)self setNavBar:0];
    [(MarkupViewController *)self setNavItem:0];
    [(MarkupViewController *)self setCancelButton:0];
    [(MarkupViewController *)self setDoneButton:0];
    v19 = [(MarkupViewController *)self transitionDimmingView];
    [v19 removeFromSuperview];

    [(MarkupViewController *)self setTransitionDimmingView:0];
    v20 = [(MarkupViewController *)self whiteView];
    [v20 removeFromSuperview];

    [(MarkupViewController *)self setWhiteView:0];
    [(MarkupViewController *)self setAlreadyLoggedSavingForThisDocument:0];
    NSLog(&cfstr_Documentdidclo_0.isa);
  }
}

- (void)viewDidLoad
{
  kdebug_trace();
  v19.receiver = self;
  v19.super_class = (Class)MarkupViewController;
  [(MarkupViewController *)&v19 viewDidLoad];
  objc_super v3 = [(MarkupViewController *)self view];
  [v3 addSubview:self->_modernToolbar];

  if ([(AKToolbarView *)self->_modernToolbar useNewFullscreenPalette])
  {
    char v4 = [(MarkupViewController *)self view];
    [v4 bringSubviewToFront:self->_modernToolbar];
  }
  v5 = [(AKToolbarView *)self->_modernToolbar bottomAnchor];
  id v6 = [(MarkupViewController *)self view];
  objc_super v7 = [v6 bottomAnchor];
  v8 = [v5 constraintEqualToAnchor:v7];
  [(MarkupViewController *)self setToolbarBottomConstraint:v8];

  v9 = [(AKToolbarView *)self->_modernToolbar leadingAnchor];
  v10 = [(MarkupViewController *)self view];
  v11 = [v10 leadingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  v13 = [(AKToolbarView *)self->_modernToolbar trailingAnchor];
  v14 = [(MarkupViewController *)self view];
  v15 = [v14 trailingAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  [(AKToolbarView *)self->_modernToolbar setShareButtonAction:sel__toolbarShareButtonTapped_];
  [(AKToolbarView *)self->_modernToolbar setShareButtonTarget:self];
  v17 = [(MarkupViewController *)self toolbarBottomConstraint];
  [v17 setActive:1];

  v18 = [(MarkupViewController *)self view];
  [(MarkupViewController *)self setContentContainerView:v18];

  [(MarkupViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MarkupViewController;
  [(MarkupViewController *)&v6 viewWillAppear:a3];
  char v4 = [(MarkupViewController *)self navBar];

  if (!v4)
  {
    v5 = [(MarkupViewController *)self contentViewController];
    [(MarkupViewController *)self _updateundoBarButtonWithController:v5];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  kdebug_trace();
  v8.receiver = self;
  v8.super_class = (Class)MarkupViewController;
  [(MarkupViewController *)&v8 viewDidAppear:v3];
  if (!self->_toolbarHidden)
  {
    v5 = [(MarkupViewController *)self annotationController];
    if (v5)
    {
      objc_super v6 = [(MarkupViewController *)self annotationController];
      objc_super v7 = [v6 toolPicker];

      [v7 setVisible:1 forFirstResponder:self];
      [(AKToolbarView *)self->_modernToolbar setContentsHidden:0];
    }
    else
    {
      [(MarkupViewController *)self setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:1];
    }
    [(MarkupViewController *)self becomeFirstResponder];
  }
}

- (BOOL)canBecomeFirstResponder
{
  if (self->_showingSignaturesUI) {
    return 0;
  }
  BOOL v3 = [(MarkupViewController *)self _pdfDocument];
  char v4 = [v3 isLocked];

  if (v4) {
    return 0;
  }
  objc_super v7 = [(MarkupViewController *)self delegate];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v5 = [v7 controllerCanBecomeFirstResponder:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MarkupViewController;
  [(MarkupViewController *)&v3 viewWillLayoutSubviews];
  [(MarkupViewController *)self adjustContentInsetsForBars];
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MarkupViewController;
  [(MarkupViewController *)&v4 viewDidLayoutSubviews];
  [(MarkupViewController *)self adjustContentInsetsForBars];
  objc_super v3 = [(MarkupViewController *)self contentViewController];
  [(MarkupViewController *)self _updateundoBarButtonWithController:v3];
}

- (UIEdgeInsets)sketchOverlayInsets
{
  objc_super v3 = [(MarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v3 customSketchOverlayInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
  }
  else
  {
    v12 = [(MarkupViewController *)self contentViewController];
    [v12 edgeInsets];
    double v5 = v13;
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
  }
  double v17 = v5;
  double v18 = v7;
  double v19 = v9;
  double v20 = v11;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MarkupViewController;
  [(MarkupViewController *)&v13 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 userInterfaceIdiom];
  double v6 = [(MarkupViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v5 != v7)
  {
    double v8 = [(MarkupViewController *)self traitCollection];
    [(MarkupViewController *)self _updateAppearanceForTraitCollection:v8];
  }
  uint64_t v9 = [v4 horizontalSizeClass];
  double v10 = [(MarkupViewController *)self traitCollection];
  uint64_t v11 = [v10 horizontalSizeClass];

  if (v9 != v11)
  {
    v12 = [(MarkupViewController *)self contentViewController];
    [(MarkupViewController *)self _updateundoBarButtonWithController:v12];
  }
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(MarkupViewController *)self traitCollection];
  int64_t v3 = [v2 userInterfaceIdiom] != 1;

  return v3;
}

- (BOOL)_useLegacyToolbar
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__MarkupViewController__useLegacyToolbar__block_invoke;
  block[3] = &unk_2649C2828;
  block[4] = self;
  if (_useLegacyToolbar_onceToken != -1) {
    dispatch_once(&_useLegacyToolbar_onceToken, block);
  }
  return _useLegacyToolbar__isItunesU;
}

void __41__MarkupViewController__useLegacyToolbar__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) hostProcessBundleIdentifier];
  v1 = [v2 lowercaseString];
  _useLegacyToolbar__isItunesU = [v1 containsString:@"itunesu"];
}

- (void)_setLegacyToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = !a3;
  double v8 = [(MarkupViewController *)self annotationController];
  uint64_t v9 = [v8 toolbarViewController];

  [v9 beginAppearanceTransition:v7 animated:v4];
  if (v4 && !v5)
  {
    double v10 = [(MarkupViewController *)self toolbar];
    [v10 setAlpha:0.0];

    uint64_t v11 = [(MarkupViewController *)self toolbar];
    [v11 setHidden:0];
  }
  if (v4)
  {
    v12 = (void *)MEMORY[0x263F1CB60];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __57__MarkupViewController__setLegacyToolbarHidden_animated___block_invoke;
    v18[3] = &unk_2649C2B18;
    v18[4] = self;
    BOOL v19 = v5;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__MarkupViewController__setLegacyToolbarHidden_animated___block_invoke_2;
    v14[3] = &unk_2649C2B40;
    id v15 = v9;
    double v16 = self;
    BOOL v17 = v5;
    [v12 _animateUsingDefaultTimingWithOptions:6 animations:v18 completion:v14];
  }
  else
  {
    [v9 endAppearanceTransition];
    objc_super v13 = [(MarkupViewController *)self toolbar];
    [v13 setHidden:v5];
  }
}

void __57__MarkupViewController__setLegacyToolbarHidden_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) toolbar];
  [v2 setAlpha:v1];
}

void __57__MarkupViewController__setLegacyToolbarHidden_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) endAppearanceTransition];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = [*(id *)(a1 + 40) toolbar];
  [v3 setHidden:v2];
}

- (void)setToolbarHidden:(BOOL)a3
{
}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_toolbarHidden != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_toolbarHidden = a3;
    if ([(MarkupViewController *)self _useLegacyToolbar])
    {
      [(MarkupViewController *)self _setLegacyToolbarHidden:v5 animated:v4];
    }
    else
    {
      BOOL v7 = [(MarkupViewController *)self annotationController];
      id v12 = [v7 toolPicker];

      [v12 setVisible:1 forFirstResponder:self];
      if (self->_toolbarHidden)
      {
        if (([(MarkupViewController *)self isFirstResponder] & 1) == 0) {
          [(MarkupViewController *)self becomeFirstResponder];
        }
        double v8 = [(MarkupViewController *)self toolbar];
        [v8 endAnnotationEditing];

        uint64_t v9 = [(MarkupViewController *)self toolbar];
        [v9 dismissPresentedPopoversAnimated:1];

        double v10 = [(MarkupViewController *)self toolbar];
        [v10 forceHideRuler];

        [v12 setVisible:0 forFirstResponder:self];
      }
      else
      {
        [(MarkupViewController *)self becomeFirstResponder];
      }
      uint64_t v11 = [(MarkupViewController *)self toolbar];
      [v11 setContentsHidden:v5 animated:v4];
    }
  }
}

- (void)setToolbarPosition:(int64_t)a3
{
  if ([(MarkupViewController *)self _useLegacyToolbar])
  {
    if (self->_toolbarPosition != a3)
    {
      self->_toolbarPosition = a3;
      [(MarkupViewController *)self _updateConstraintsForBarPosition:a3];
    }
  }
  else
  {
    NSLog(&cfstr_ThisApiIsDepre.isa);
  }
}

- (void)setShowThumbnailViewForMultipage:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(MarkupViewController *)self contentViewController];
  BOOL v5 = !v3
    || (objc_opt_respondsToSelector() & 1) == 0
    || -[MarkupViewController thumbnailViewStyle](self, "thumbnailViewStyle") != 1 && [v6 pageCount] == 1;
  [(MarkupViewController *)self _setThumbnailViewHidden:v5];
}

- (void)_setThumbnailViewHidden:(BOOL)a3
{
  self->_thumbnailViewHidden = a3;
  uint64_t v4 = [(MarkupViewController *)self contentViewController];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 setShowsThumbnailView:!self->_thumbnailViewHidden];
    }
  }
  MEMORY[0x270F9A828]();
}

- (void)setFixedThumbnailView:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(MarkupViewController *)self contentViewController];
    [v7 setFixedThumbnailView:v3];
  }
}

- (BOOL)fixedThumbnailView
{
  BOOL v3 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  BOOL v5 = [(MarkupViewController *)self contentViewController];
  char v6 = [v5 fixedThumbnailView];

  return v6;
}

- (BOOL)isTouchInThumbnailView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(MarkupViewController *)self contentViewController];
    char v8 = [v7 isTouchInThumbnailView:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setNavigationModeHorizontal:(BOOL)a3
{
  self->_navigationModeHorizontal = a3;
  uint64_t v4 = [(MarkupViewController *)self contentViewController];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    if (objc_opt_respondsToSelector()) {
      [v5 setNavigationModeHorizontal:self->_navigationModeHorizontal];
    }
  }
  MEMORY[0x270F9A828]();
}

- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = dispatch_get_global_queue(2, 0);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __74__MarkupViewController_setFileURL_withArchivedModelData_placeholderImage___block_invoke;
  v15[3] = &unk_2649C2B90;
  id v16 = v10;
  BOOL v17 = self;
  id v18 = v8;
  id v19 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_sync(v11, v15);
}

void __74__MarkupViewController_setFileURL_withArchivedModelData_placeholderImage___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    [*(id *)(a1 + 40) setPlaceholderImageView:v2];

    [*(id *)(a1 + 40) setPlaceholderImage:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) _presentPlaceholderImage];
  }
  objc_initWeak(&location, *(id *)(a1 + 40));
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  char v9 = 1;
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__MarkupViewController_setFileURL_withArchivedModelData_placeholderImage___block_invoke_2;
  v6[3] = &unk_2649C2B68;
  v6[4] = v8;
  objc_copyWeak(&v7, &location);
  [v3 _setFileURL:v4 withArchivedModelData:v5 withCompletion:v6];
  objc_destroyWeak(&v7);
  _Block_object_dispose(v8, 8);
  objc_destroyWeak(&location);
}

void __74__MarkupViewController_setFileURL_withArchivedModelData_placeholderImage___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _cleanupPlaceholderImage];
}

- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4
{
}

- (void)_setFileURL:(id)a3 withArchivedModelData:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  BOOL v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:0];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__MarkupViewController__setFileURL_withArchivedModelData_withCompletion___block_invoke;
  v13[3] = &unk_2649C2BB8;
  v13[4] = &v14;
  [v11 coordinateReadingItemAtURL:v8 options:0 error:0 byAccessor:v13];
  id v12 = (id)v15[5];

  [(MarkupViewController *)self _updateAndLoadSourceContent:v12 withArchivedModelData:v9 withCompletion:v10];
  _Block_object_dispose(&v14, 8);
}

void __73__MarkupViewController__setFileURL_withArchivedModelData_withCompletion___block_invoke(uint64_t a1, void *a2)
{
}

- (void)setFileURL:(id)a3
{
}

- (void)setImage:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    [(MarkupViewController *)self setPlaceholderImageView:v11];

    [(MarkupViewController *)self setPlaceholderImage:v10];
  }
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __72__MarkupViewController_setImage_withArchivedModelData_placeholderImage___block_invoke;
  id v15 = &unk_2649C2878;
  objc_copyWeak(&v16, &location);
  [(MarkupViewController *)self _updateAndLoadSourceContent:v8 withArchivedModelData:v9 withCompletion:&v12];
  [(MarkupViewController *)self _presentPlaceholderImage];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __72__MarkupViewController_setImage_withArchivedModelData_placeholderImage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanupPlaceholderImage];
    id WeakRetained = v2;
  }
}

- (void)setImage:(id)a3 withArchivedModelData:(id)a4
{
}

- (void)setImage:(id)a3
{
}

- (void)setData:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    [(MarkupViewController *)self setPlaceholderImageView:v11];

    [(MarkupViewController *)self setPlaceholderImage:v10];
  }
  objc_initWeak(&location, self);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __71__MarkupViewController_setData_withArchivedModelData_placeholderImage___block_invoke;
  id v15 = &unk_2649C2878;
  objc_copyWeak(&v16, &location);
  [(MarkupViewController *)self _setData:v8 withArchivedModelData:v9 withCompletion:&v12];
  [(MarkupViewController *)self _presentPlaceholderImage];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __71__MarkupViewController_setData_withArchivedModelData_placeholderImage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanupPlaceholderImage];
    id WeakRetained = v2;
  }
}

- (void)setData:(id)a3 withArchivedModelData:(id)a4
{
}

- (void)setData:(id)a3
{
}

- (UTType)outputContentType
{
  id v2 = [(MarkupViewController *)self sourceContentType];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x263F1D920] typeWithIdentifier:v2];
    uint64_t v4 = (void *)*MEMORY[0x263F1DBF0];
    if ([v3 conformsToType:*MEMORY[0x263F1DBF0]]
      || (uint64_t v4 = (void *)*MEMORY[0x263F1DC08], [v3 conformsToType:*MEMORY[0x263F1DC08]])
      || (uint64_t v4 = (void *)*MEMORY[0x263F1DCE0], [v3 conformsToType:*MEMORY[0x263F1DCE0]]))
    {
      id v5 = v4;
    }
    else
    {
      if (![v3 conformsToType:*MEMORY[0x263F1DB18]])
      {
        NSLog(&cfstr_SNullOutputtyp.isa, "-[MarkupViewController outputContentType]", v2);
        char v6 = 0;
        goto LABEL_7;
      }
      id v5 = (id)*MEMORY[0x263F1DB40];
    }
    char v6 = v5;
LABEL_7:

    goto LABEL_9;
  }
  NSLog(&cfstr_SSourcecontent.isa, "-[MarkupViewController outputContentType]");
  char v6 = 0;
LABEL_9:

  return (UTType *)v6;
}

- (NSString)outputType
{
  id v2 = [(MarkupViewController *)self outputContentType];
  BOOL v3 = [v2 identifier];

  return (NSString *)v3;
}

+ (id)supportedOutputTypes
{
  return &unk_26E189F68;
}

- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 error:(id *)a5
{
  return [(MarkupViewController *)self writeToURL:a3 embeddingSourceImageAndEditModel:a4 options:0 error:a5];
}

- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 options:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  CGDataConsumerRef v11 = CGDataConsumerCreateWithURL((CFURLRef)a3);
  if (v11)
  {
    CGDataConsumerRef v12 = v11;
    BOOL v13 = [(MarkupViewController *)self _writeToDataConsumer:v11 embedSourceImageAndEditModel:v7 options:v10 error:a6];
    CFRelease(v12);
    if (!a6) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v13 = 0;
    if (!a6) {
      goto LABEL_8;
    }
  }
  if (!v13 && !*a6)
  {
    *a6 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
  }
LABEL_8:

  return v13;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  return [(MarkupViewController *)self writeToURL:a3 embeddingSourceImageAndEditModel:1 error:a4];
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  return [(MarkupViewController *)self writeToURL:a3 embeddingSourceImageAndEditModel:1 options:a4 error:a5];
}

- (id)dataRepresentationEmbeddingSourceImageAndEditModel:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  BOOL v7 = [MEMORY[0x263EFF990] data];
  CGDataConsumerRef v8 = CGDataConsumerCreateWithCFData(v7);
  if (!v8)
  {
    id v16 = 0;
    int v17 = 1;
    if (!a4) {
      goto LABEL_21;
    }
    goto LABEL_18;
  }
  CGDataConsumerRef v9 = v8;
  BOOL v10 = [(MarkupViewController *)self _writeToDataConsumer:v8 embedSourceImageAndEditModel:v5 error:a4];
  if (v10)
  {
    uint64_t v11 = _MUWriteOutputToTemp_cachedValue;
    if (_MUWriteOutputToTemp_cachedValue == -2)
    {
      CGDataConsumerRef v12 = [MEMORY[0x263EFFA40] standardUserDefaults];
      BOOL v13 = [v12 objectForKey:@"MUWriteOutputToTemp"];

      if (v13)
      {
        uint64_t v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
        _MUWriteOutputToTemp_cachedValue = [v14 BOOLForKey:@"MUWriteOutputToTemp"];

        if (_MUWriteOutputToTemp_cachedValue) {
          id v15 = @"YES";
        }
        else {
          id v15 = @"NO";
        }
        NSLog(&stru_26E181F88.isa, @"MUWriteOutputToTemp", v15);
      }
      else
      {
        _MUWriteOutputToTemp_cachedValue = 0;
      }

      uint64_t v11 = _MUWriteOutputToTemp_cachedValue;
    }
    if (v11)
    {
      id v18 = [(MarkupViewController *)self outputContentType];
      id v19 = [v18 preferredFilenameExtension];

      double v20 = NSTemporaryDirectory();
      v21 = [v20 stringByAppendingPathComponent:@"output"];
      v22 = [v21 stringByAppendingPathExtension:v19];

      NSLog(&cfstr_WritingOutputT.isa, v22);
      [(__CFData *)v7 writeToFile:v22 atomically:0];
    }
    id v16 = v7;
  }
  else
  {
    id v16 = 0;
  }
  CFRelease(v9);
  int v17 = !v10;
  if (a4)
  {
LABEL_18:
    if (v17 && !*a4)
    {
      *a4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
    }
  }
LABEL_21:

  return v16;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return [(MarkupViewController *)self dataRepresentationEmbeddingSourceImageAndEditModel:1 error:a3];
}

- (id)createArchivedModelData
{
  BOOL v3 = objc_alloc_init(MUImageWriter);
  uint64_t v4 = [(MarkupViewController *)self annotationController];
  BOOL v5 = [(MUImageWriter *)v3 encodedModelFromAnnotationsController:v4 encrypt:0];

  return v5;
}

- (void)finalizeCrop
{
  if (self->_contentViewController
    && [(id)objc_opt_class() instancesRespondToSelector:sel_finalizeCrop])
  {
    contentViewController = self->_contentViewController;
    [(MUContentViewControllerProtocol *)contentViewController performSelector:sel_finalizeCrop];
  }
}

- (void)done:(id)a3
{
}

- (void)cancel:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MarkupViewController *)self annotationController];
  int v6 = [v5 validateUndo:0];

  if (v6)
  {
    BOOL v7 = [MEMORY[0x263F1C3F8] alertControllerWithTitle:0 message:0 preferredStyle:0];
    CGDataConsumerRef v8 = (void *)MEMORY[0x263F1C3F0];
    CGDataConsumerRef v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v10 = [v9 localizedStringForKey:@"Discard Changes" value:&stru_26E1811C8 table:@"MarkupViewController"];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __31__MarkupViewController_cancel___block_invoke;
    v18[3] = &unk_2649C2BE0;
    v18[4] = self;
    uint64_t v11 = [v8 actionWithTitle:v10 style:2 handler:v18];
    [v7 addAction:v11];

    CGDataConsumerRef v12 = (void *)MEMORY[0x263F1C3F0];
    BOOL v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"Cancel" value:&stru_26E1811C8 table:@"MarkupViewController"];
    id v15 = [v12 actionWithTitle:v14 style:1 handler:0];
    [v7 addAction:v15];

    [v7 setModalPresentationStyle:7];
    id v16 = [v7 popoverPresentationController];
    [v16 setPermittedArrowDirections:1];

    int v17 = [v7 popoverPresentationController];
    [v17 setBarButtonItem:v4];

    [(MarkupViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    [(MarkupViewController *)self _cancel];
  }
}

uint64_t __31__MarkupViewController_cancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)_cancel
{
  [(MarkupViewController *)self setUserDidCancel:1];
  if ([(MarkupViewController *)self useFancyTransition])
  {
    id v4 = [(MarkupViewController *)self _remoteViewControllerProxy];
    [v4 serviceDidFinishwithResults:0 andSandboxExtension:0];
  }
  else
  {
    id v4 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:3072 userInfo:0];
    BOOL v3 = [(MarkupViewController *)self extensionContext];
    [v3 cancelRequestWithError:v4];

    [(MarkupViewController *)self documentDidCloseTeardown];
  }
}

- (BOOL)validateRedo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MarkupViewController *)self annotationController];
  char v6 = [v5 validateRedo:v4];

  return v6;
}

- (BOOL)validateUndo:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MarkupViewController *)self annotationController];
  char v6 = [v5 validateUndo:v4];

  return v6;
}

- (void)undo:(id)a3
{
  id v4 = a3;
  id v5 = [(MarkupViewController *)self annotationController];
  [v5 undo:v4];
}

- (void)redo:(id)a3
{
  id v4 = a3;
  id v5 = [(MarkupViewController *)self annotationController];
  [v5 redo:v4];
}

- (void)revert
{
  BOOL v3 = [(MarkupViewController *)self undoManager];
  int v4 = [v3 canUndo];

  if (v4)
  {
    do
    {
      id v5 = [(MarkupViewController *)self undoManager];
      [v5 undo];

      char v6 = [(MarkupViewController *)self undoManager];
      char v7 = [v6 canUndo];
    }
    while ((v7 & 1) != 0);
  }
  id v8 = [(MarkupViewController *)self undoManager];
  [v8 removeAllActions];
}

- (BOOL)_writeToDataConsumer:(CGDataConsumer *)a3 embedSourceImageAndEditModel:(BOOL)a4 error:(id *)a5
{
  return [(MarkupViewController *)self _writeToDataConsumer:a3 embedSourceImageAndEditModel:a4 options:0 error:a5];
}

- (BOOL)_writeToDataConsumer:(CGDataConsumer *)a3 embedSourceImageAndEditModel:(BOOL)a4 options:(id)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  uint64_t v11 = [(MarkupViewController *)self undoManager];
  if ([v11 canUndo])
  {
    BOOL alreadyLoggedSavingForThisDocument = self->_alreadyLoggedSavingForThisDocument;

    if (!alreadyLoggedSavingForThisDocument)
    {
      BOOL v13 = [(MarkupViewController *)self sourceContentType];
      uint64_t v14 = [(MarkupViewController *)self hostProcessBundleIdentifier];
      +[MUStatistics logFileTypeSaved:v13 byProcess:v14];

      [(MarkupViewController *)self setAlreadyLoggedSavingForThisDocument:1];
    }
  }
  else
  {
  }
  id v15 = [(MarkupViewController *)self annotationController];
  [v15 endLogging];

  id v16 = [(MarkupViewController *)self outputContentType];
  if ([v16 conformsToType:*MEMORY[0x263F1DB18]])
  {
    int v17 = objc_alloc_init(MUImageWriter);
    id v18 = [(MarkupViewController *)self digestedSourceContent];
    id v19 = [(MarkupViewController *)self annotationController];
    double v20 = [v16 identifier];
    char v21 = [(MUImageWriter *)v17 writeUsingBaseImage:v18 withAnnotationsFromController:v19 asImageOfType:v20 toConsumer:a3 embedSourceImageAndAnnotationsAsMetadata:v7 encryptPrivateMetadata:[(MarkupViewController *)self encryptPrivateMetadata] error:a6];
  }
  else if ([v16 conformsToType:*MEMORY[0x263F1DBF0]])
  {
    v22 = [(MarkupViewController *)self digestedSourceContent];
    id v23 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [v23 setValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F148E8]];
    if (v10 && [v10 count]) {
      [v23 addEntriesFromDictionary:v10];
    }
    v24 = (void *)[v23 copy];
    char v21 = [v22 writeToConsumer:a3 withOptions:v24];
  }
  else
  {
    NSLog(&cfstr_SUnexpectedOut.isa, "-[MarkupViewController _writeToDataConsumer:embedSourceImageAndEditModel:options:error:]", v16);
    if (a6)
    {
      [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:518 userInfo:0];
      char v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v21 = 0;
    }
  }

  return v21;
}

- (void)_updateAndLoadSourceContent:(id)a3 withArchivedModelData:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  kdebug_trace();
  [(MarkupViewController *)self willBeginLoadingNewDocument];
  [(MarkupViewController *)self setSourceContent:v10 withArchivedModelData:v9];

  uint64_t v11 = [(MarkupViewController *)self sourceContentType];

  if (v11)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __89__MarkupViewController__updateAndLoadSourceContent_withArchivedModelData_withCompletion___block_invoke;
    v12[3] = &unk_2649C2A28;
    v12[4] = self;
    id v13 = v8;
    [(MarkupViewController *)self _loadSourceContentWithCompletion:v12];
  }
  else
  {
    [(MarkupViewController *)self _bailFailedAnimateEnterMarkup];
  }
}

void __89__MarkupViewController__updateAndLoadSourceContent_withArchivedModelData_withCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  BOOL v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v8 = [*(id *)(a1 + 32) view];
  [v8 frame];
  double v10 = v9;
  double v12 = v11;

  id v13 = [*(id *)(a1 + 32) contentViewController];
  uint64_t v14 = [v13 view];
  [v14 frame];
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(*(id *)(a1 + 32), "_setupInitialBaseModelScaleFactorWithScreenSize:windowDecorationSize:", v5, v7, v10 - v16, v12 - v18);
  id v19 = *(unsigned __int8 **)(a1 + 32);
  uint64_t v20 = v19[1014];
  char v21 = [v19 annotationController];
  [v21 setPencilAlwaysDraws:v20];

  [*(id *)(a1 + 32) restoreToolModeForContentType];
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(void))(v22 + 16))();
  }
  id v23 = [MEMORY[0x263F08A00] defaultCenter];
  [v23 postNotificationName:@"_MUDocumentFinishedLoading" object:*(void *)(a1 + 32)];

  kdebug_trace();
  v24 = [*(id *)(a1 + 32) contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v26 = (id *)MEMORY[0x263F24B80];
  if (isKindOfClass) {
    v26 = (id *)MEMORY[0x263F24B88];
  }
  id v28 = *v26;
  v27 = [*(id *)(a1 + 32) annotationController];
  [v27 beginLogging:@"markup" documentType:v28];
}

- (void)_loadSourceContentWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = [(MarkupViewController *)self sourceContent];

  if (v5)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __57__MarkupViewController__loadSourceContentWithCompletion___block_invoke;
    block[3] = &unk_2649C2878;
    objc_copyWeak(&v23, &location);
    dispatch_async(MEMORY[0x263EF83A0], block);
    double v6 = [(MarkupViewController *)self sourceContentType];
    [(MarkupViewController *)self _installContentViewControllerForUTI:v6];

    double v7 = (void *)MEMORY[0x263F1D920];
    id v8 = [(MarkupViewController *)self sourceContentType];
    double v9 = [v7 typeWithIdentifier:v8];

    if ([v9 conformsToType:*MEMORY[0x263F1DBF0]])
    {
      double v10 = [(MarkupViewController *)self contentViewController];
      objc_msgSend(v10, "setForcesPDFViewTopAlignment:", -[MarkupViewController forcesPDFViewTopAlignment](self, "forcesPDFViewTopAlignment"));

      double v11 = [(MarkupViewController *)self contentViewController];
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      double v18 = __57__MarkupViewController__loadSourceContentWithCompletion___block_invoke_2;
      id v19 = &unk_2649C2A28;
      uint64_t v20 = self;
      id v21 = v4;
      [v11 loadContentWithCompletionBlock:&v16];
    }
    else if ([v9 conformsToType:*MEMORY[0x263F1DB18]])
    {
      [(MarkupViewController *)self _setupAnnotationController];
      double v12 = [(MarkupViewController *)self contentViewController];
      id v13 = [(MarkupViewController *)self placeholderImage];
      [v12 setTentativePlaceholderImage:v13];

      uint64_t v14 = [(MarkupViewController *)self contentViewController];
      [v14 loadContentWithCompletionBlock:v4];
    }
    -[MarkupViewController setAllEditingDisabled:](self, "setAllEditingDisabled:", 0, v16, v17, v18, v19, v20);
    [(MarkupViewController *)self setAnnotationEditingEnabled:1];
    [(MarkupViewController *)self setFormFillingEnabled:0];
    [(MarkupViewController *)self _startObservingAnnotationController];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  double v15 = [(MarkupViewController *)self contentViewController];
  [(MarkupViewController *)self _updateundoBarButtonWithController:v15];
}

void __57__MarkupViewController__loadSourceContentWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = [WeakRetained _hostApplicationBundleIdentifier];
    if (v2) {
      [v5 setHostProcessBundleIdentifier:v2];
    }
    BOOL v3 = [v5 sourceContentType];
    id v4 = [v5 hostProcessBundleIdentifier];
    +[MUStatistics logFileTypeOpened:v3 byProcess:v4];

    id WeakRetained = v5;
  }
}

uint64_t __57__MarkupViewController__loadSourceContentWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupAnnotationController];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (BOOL)allEditingDisabled
{
  id v2 = [(MarkupViewController *)self annotationController];
  char v3 = [v2 allEditingDisabled];

  return v3;
}

- (void)setAllEditingDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MarkupViewController *)self annotationController];
  [v4 setAllEditingDisabled:v3];
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(MarkupViewController *)self annotationController];
  if ([v6 annotationEditingEnabled] != v3)
  {
    [v6 setAnnotationEditingEnabled:v3];
    if (v3)
    {
      [(MarkupViewController *)self restoreToolModeForContentType];
    }
    else
    {
      id v5 = [v6 modelController];
      [v5 deselectAllAnnotations];

      [v6 resetToDefaultToolMode];
    }
  }
}

- (void)setFormFillingEnabled:(BOOL)a3
{
}

- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [(MarkupViewController *)self _pdfView];
  if (v6)
  {
    id v10 = v6;
    BOOL v7 = [v6 isInFormFillingMode] == v4;
    id v6 = v10;
    if (!v7)
    {
      [v10 setInFormFillingMode:v4];
      id v6 = v10;
      if (!v4)
      {
        id v8 = [(MarkupViewController *)self annotationController];
        double v9 = [v8 modelController];
        [v9 deselectAllAnnotations];

        id v6 = v10;
      }
    }
  }
}

- (void)restoreToolModeForContentType
{
  id v6 = [(MarkupViewController *)self annotationController];
  if ([(MarkupViewController *)self annotationEditingEnabled]
    && ([(MarkupViewController *)self contentViewController],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 defaultToolTag],
        v3,
        v4 != 763000))
  {
    id v5 = objc_opt_new();
    [v5 setTag:v4];
    [v6 performActionForSender:v5];
    if ([v6 toolMode] != 4) {
      [v6 performActionForSender:v5];
    }
  }
  else
  {
    [v6 resetToDefaultToolMode];
  }
}

- (BOOL)annotationEditingEnabled
{
  id v2 = [(MarkupViewController *)self annotationController];
  char v3 = [v2 annotationEditingEnabled];

  return v3;
}

- (BOOL)formFillingEnabled
{
  id v2 = [(MarkupViewController *)self annotationController];
  char v3 = [v2 formFillingEnabled];

  return v3;
}

- (void)setPencilAlwaysDraws:(BOOL)a3
{
  self->_int pencilAlwaysDraws = [MEMORY[0x263F24BB8] canConnectToStylus] & a3;
  uint64_t v4 = [(MarkupViewController *)self annotationController];
  int pencilAlwaysDraws = self->_pencilAlwaysDraws;
  id v6 = v4;
  if (pencilAlwaysDraws != [v4 pencilAlwaysDraws]) {
    [v6 setPencilAlwaysDraws:self->_pencilAlwaysDraws];
  }
}

- (BOOL)pencilAlwaysDraws
{
  char v3 = [(MarkupViewController *)self annotationController];
  int pencilAlwaysDraws = self->_pencilAlwaysDraws;
  if (pencilAlwaysDraws != [v3 pencilAlwaysDraws]) {
    NSLog(&cfstr_TheAkcontrolle.isa);
  }
  BOOL v5 = self->_pencilAlwaysDraws;

  return v5;
}

- (void)_saveEditing:(id)a3
{
  v38[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = [(MarkupViewController *)self extensionContext];

  if (v4)
  {
    BOOL v5 = [(MarkupViewController *)self outputContentType];
    id v6 = +[MUImageDownsamplingUtilities _uniqueTemporaryDirectory];
    BOOL v7 = [(MarkupViewController *)self preferredFileDisplayName];
    id v8 = [v5 preferredFilenameExtension];
    if (v8)
    {
      uint64_t v9 = [v7 stringByAppendingPathExtension:v8];

      BOOL v7 = (void *)v9;
    }
    else
    {
      NSLog(&cfstr_SNoPreferredFi.isa, "-[MarkupViewController _saveEditing:]");
    }
    id v10 = [v6 URLByAppendingPathComponent:v7];
    double v11 = [v10 filePathURL];

    double v12 = [MEMORY[0x263F08850] defaultManager];
    id v36 = 0;
    [v12 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:&v36];
    id v13 = v36;

    if (v13) {
      NSLog(&cfstr_FailedToCreate_1.isa, v13);
    }
    id v35 = 0;
    [(MarkupViewController *)self writeToURL:v11 error:&v35];
    id v14 = v35;
    double v15 = v14;
    if (v14)
    {
      NSLog(&cfstr_FailedToWriteF.isa, v14);
      uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:512 userInfo:0];
      uint64_t v17 = [(MarkupViewController *)self extensionContext];
      [v17 cancelRequestWithError:v16];

      [(MarkupViewController *)self documentDidCloseTeardown];
    }
    else
    {
      v30 = v5;
      id v18 = objc_alloc_init(MEMORY[0x263F088E0]);
      id v19 = [(id)*MEMORY[0x263F1DAA0] identifier];
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __37__MarkupViewController__saveEditing___block_invoke;
      v33[3] = &unk_2649C2C08;
      id v31 = v11;
      id v34 = v31;
      [v18 registerItemForTypeIdentifier:v19 loadHandler:v33];

      id v20 = v18;
      id v21 = objc_opt_new();
      v29 = v20;
      v38[0] = v20;
      uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];
      [v21 setAttachments:v22];

      v37 = v21;
      uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
      if ([(MarkupViewController *)self useFancyTransition])
      {
        id v28 = [(MarkupViewController *)self _remoteViewControllerProxy];
        id v23 = [v31 path];
        [v23 UTF8String];

        uint64_t v24 = sandbox_extension_issue_file();
        if (v24)
        {
          v25 = (void *)v24;
          v26 = [NSString stringWithUTF8String:v24];
          free(v25);
        }
        else
        {
          NSLog(&cfstr_SFailedToCreat.isa, "-[MarkupViewController _saveEditing:]", v31);
          v26 = 0;
        }
        BOOL v5 = v30;
        [v28 serviceDidFinishwithResults:v31 andSandboxExtension:v26];
      }
      else
      {
        v27 = [(MarkupViewController *)self extensionContext];
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __37__MarkupViewController__saveEditing___block_invoke_2;
        v32[3] = &unk_2649C2C30;
        v32[4] = self;
        [v27 completeRequestReturningItems:v16 completionHandler:v32];

        BOOL v5 = v30;
      }
    }
  }
}

uint64_t __37__MarkupViewController__saveEditing___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0);
}

void __37__MarkupViewController__saveEditing___block_invoke_2(uint64_t a1)
{
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    id v2 = *(void **)(a1 + 32);
    [v2 documentDidCloseTeardown];
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__MarkupViewController__saveEditing___block_invoke_3;
    block[3] = &unk_2649C2828;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __37__MarkupViewController__saveEditing___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) documentDidCloseTeardown];
}

- (void)setSourceContent:(id)a3 withArchivedModelData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  p_sourceContent = &self->_sourceContent;
  if (self->_sourceContent == v7) {
    goto LABEL_67;
  }
  objc_storeStrong(&self->_sourceContent, a3);
  [(MarkupViewController *)self setSourceContentType:0];
  [(MarkupViewController *)self setDigestedSourceContent:0];
  [(MarkupViewController *)self setPreferredFileDisplayName:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [(id)*MEMORY[0x263F1DB40] identifier];
    [(MarkupViewController *)self setSourceContentType:v10];

    double v11 = [(MarkupViewController *)self sourceContent];
    [(MarkupViewController *)self setDigestedSourceContent:v11];

    __int16 v62 = 0;
    +[MUImageDownsamplingUtilities _shouldFlattenEXIFOrientation:(char *)&v62 + 1 andDownsample:&v62 sourceContent:v7];
    if ([(id)objc_opt_class() _isInLowMemoryEnvironment])
    {
      int v12 = v62;
    }
    else
    {
      int v12 = 0;
      LOBYTE(v62) = 0;
    }
    if (HIBYTE(v62) | v12)
    {
      id v14 = +[MUImageDownsamplingUtilities _flattenRotation:HIBYTE(v62) != 0 withDownsampling:v12 != 0 sourceImage:v7];
      if (v14)
      {
        id v15 = v14;

        [(MarkupViewController *)self setSourceContent:v15];
        uint64_t v16 = [(MarkupViewController *)self sourceContent];
        [(MarkupViewController *)self setDigestedSourceContent:v16];

        [(MarkupViewController *)self _cleanupPlaceholderImage];
        id v7 = v15;
      }
    }
    id v17 = objc_alloc_init(MEMORY[0x263F08C50]);
    [(MarkupViewController *)self setAkUndoManager:v17];
    goto LABEL_63;
  }
  id v13 = self;
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    id v18 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (v7) {
        NSLog(&cfstr_SUnsupportedSo.isa, "-[MarkupViewController setSourceContent:withArchivedModelData:]", v7);
      }
      goto LABEL_64;
    }
  }
  id v17 = +[MUImageDownsamplingUtilities _sourceContentType:v7];
  if (v17)
  {
    id v20 = objc_alloc_init(MEMORY[0x263F08C50]);
    [(MarkupViewController *)self setAkUndoManager:v20];

    id v21 = [MEMORY[0x263F1D920] typeWithIdentifier:v17];
    if (![v21 conformsToType:*MEMORY[0x263F1DBF0]])
    {
      if ([v21 conformsToType:*MEMORY[0x263F1DB18]])
      {
        __int16 v61 = 0;
        +[MUImageDownsamplingUtilities _shouldFlattenEXIFOrientation:(char *)&v61 + 1 andDownsample:&v61 sourceContent:v7];
        if ([(id)objc_opt_class() _isInLowMemoryEnvironment])
        {
          int v28 = v61;
        }
        else
        {
          int v28 = 0;
          LOBYTE(v61) = 0;
        }
        if (HIBYTE(v61) | v28)
        {
          BOOL v35 = HIBYTE(v61) != 0;
          BOOL v36 = v28 != 0;
          v37 = [(MarkupViewController *)self outputContentType];
          v38 = +[MUImageDownsamplingUtilities _flattenEXIFOrientation:v35 withDownsampling:v36 sourceContent:v7 withContentType:v37];

          if (v38
            || (+[MUImageDownsamplingUtilities _flattenEXIFOrientation:HIBYTE(v61) withDownsampling:v61 sourceContent:v7 withContentType:*MEMORY[0x263F1DB40]], (v38 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            objc_storeStrong(&self->_sourceContent, v38);
            id v34 = v38;

            [(MarkupViewController *)self _cleanupPlaceholderImage];
            id v7 = v34;
          }
          else
          {
            id v34 = 0;
          }
        }
        else
        {
          id v34 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          v59 = objc_alloc_init(MUImageReader);
          id v58 = v34;
          if ([(MarkupViewController *)self _sourceImageMayContainBaseImageAndModel])
          {
            char v60 = 0;
            v39 = [(MarkupViewController *)self sourceContent];
            v40 = self;
            char v41 = objc_opt_isKindOfClass();

            v42 = [(MarkupViewController *)self sourceContent];
            if (v41)
            {
              v43 = v59;
              [(MUImageReader *)v59 readBaseImageFromData:v42 baseWasValid:&v60];
            }
            else
            {
              v43 = v59;
              [(MUImageReader *)v59 readBaseImageFromImageAtURL:v42 baseWasValid:&v60];
            v44 = };

            if (v44)
            {
              if (v60)
              {
                v47 = [(MarkupViewController *)self sourceContent];
                v48 = self;
                char v49 = objc_opt_isKindOfClass();

                v50 = [(MarkupViewController *)self sourceContent];
                v43 = v59;
                if (v49) {
                  [(MUImageReader *)v59 readArchivedModelDataFromImageData:v50];
                }
                else {
                id v45 = [(MUImageReader *)v59 readArchivedModelDataFromImageURL:v50];
                }
              }
              else
              {
                id v45 = 0;
              }
              [(MarkupViewController *)self setDigestedSourceContent:v44];
            }
            else
            {
              id v45 = 0;
            }
          }
          else
          {
            v44 = [(MarkupViewController *)self sourceContent];
            [(MarkupViewController *)self setDigestedSourceContent:v44];
            id v45 = 0;
            v43 = v59;
          }

          if (v8)
          {
            id v34 = v58;
            if (!v45) {
              id v45 = v8;
            }
          }
          else
          {
            id v34 = v58;
          }
          [(MarkupViewController *)self setArchivedModelData:v45];
          [(MarkupViewController *)self setSourceContentType:v17];
          v51 = [(MarkupViewController *)self originalImageDescription];

          if (!v51)
          {
            v52 = [(MarkupViewController *)self sourceContent];
            v53 = +[MUImageReader imageDescriptionFromSourceContent:v52];
            [(MarkupViewController *)self setOriginalImageDescription:v53];

            v43 = v59;
          }
        }
        else
        {
          v46 = (objc_class *)objc_opt_class();
          v43 = NSStringFromClass(v46);
          NSLog(&cfstr_SEncounteredAn.isa, "-[MarkupViewController setSourceContent:withArchivedModelData:]", v43);
        }
      }
      goto LABEL_59;
    }
    uint64_t v22 = [(MarkupViewController *)self sourceContent];
    id v23 = self;
    char v24 = objc_opt_isKindOfClass();

    if (v24)
    {
      id v25 = objc_alloc(MEMORY[0x263F14738]);
      v26 = [(MarkupViewController *)self sourceContent];
      uint64_t v27 = [v25 initWithURL:v26];
    }
    else
    {
      v29 = [(MarkupViewController *)self sourceContent];
      v30 = self;
      char v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0)
      {
LABEL_59:
        v54 = [(MarkupViewController *)self sourceContentType];

        if (v54)
        {
          v55 = +[MUImageDownsamplingUtilities _preferredFileDisplayNameForSourceContent:v7];
          [(MarkupViewController *)self setPreferredFileDisplayName:v55];
        }
        else
        {
          NSLog(&cfstr_SUnsupportedCo.isa, "-[MarkupViewController setSourceContent:withArchivedModelData:]", v17);
          [(MarkupViewController *)self _stopObservingAnnotationController];
          [(MarkupViewController *)self setAkUndoManager:0];
        }

        goto LABEL_63;
      }
      id v32 = objc_alloc(MEMORY[0x263F14738]);
      v26 = [(MarkupViewController *)self sourceContent];
      uint64_t v27 = [v32 initWithData:v26];
    }
    v33 = (void *)v27;

    if (v33)
    {
      [(MarkupViewController *)self setDigestedSourceContent:v33];
      [(MarkupViewController *)self setSourceContentType:v17];
    }
    goto LABEL_59;
  }
  NSLog(&cfstr_SFailedToGetCo.isa, "-[MarkupViewController setSourceContent:withArchivedModelData:]", v7);
LABEL_63:

LABEL_64:
  if (*p_sourceContent)
  {
    v56 = [(MarkupViewController *)self sourceContentType];

    if (!v56)
    {
      NSLog(&cfstr_SClearingSourc.isa, "-[MarkupViewController setSourceContent:withArchivedModelData:]");
      id v57 = *p_sourceContent;
      id *p_sourceContent = 0;

      [(MarkupViewController *)self setDigestedSourceContent:0];
    }
  }
LABEL_67:
}

- (void)setPreferredFileDisplayName:(id)a3
{
  id v6 = (id)[a3 copy];
  uint64_t v4 = [v6 stringByDeletingPathExtension];
  preferredFileDisplayName = self->_preferredFileDisplayName;
  self->_preferredFileDisplayName = v4;
}

- (id)_pdfView
{
  char v3 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(MarkupViewController *)self contentViewController];
    id v6 = [v5 pdfView];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_pdfDocument
{
  char v3 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(MarkupViewController *)self contentViewController];
    id v6 = [v5 pdfDocument];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (int64_t)thumbnailViewStyle
{
  char v3 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  BOOL v5 = [(MarkupViewController *)self contentViewController];
  int64_t v6 = [v5 thumbnailViewStyle];

  return v6;
}

- (void)setThumbnailViewStyle:(int64_t)a3
{
  BOOL v5 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(MarkupViewController *)self contentViewController];
    [v7 setThumbnailViewStyle:a3];
  }
}

- (BOOL)allowsThumbnailViewPageReordering
{
  char v3 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  BOOL v5 = [(MarkupViewController *)self contentViewController];
  char v6 = [v5 allowsThumbnailViewPageReordering];

  return v6;
}

- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [(MarkupViewController *)self contentViewController];
    [v7 setAllowsThumbnailViewPageReordering:v3];
  }
}

- (UIScrollView)contentViewScrollView
{
  id v2 = [(MarkupViewController *)self contentViewController];
  BOOL v3 = [v2 contentViewScrollView];

  return (UIScrollView *)v3;
}

- (UIView)imageViewCombinedContentView
{
  id v2 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [v2 combinedContentView];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (UIView *)v3;
}

- (unint64_t)currentPDFPageIndex
{
  BOOL v3 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  BOOL v5 = [(MarkupViewController *)self annotationController];
  unint64_t v6 = [v5 currentPageIndex];

  return v6;
}

- (void)setCurrentPDFPageIndex:(unint64_t)a3
{
  BOOL v5 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v11 = [(MarkupViewController *)self contentViewController];
    id v7 = [v11 pdfView];
    id v8 = [v7 document];
    uint64_t v9 = v8;
    if (v7 && v8)
    {
      id v10 = [v8 pageAtIndex:a3];
      if (v10) {
        [v7 goToPage:v10];
      }
    }
  }
}

- (void)setShapeDetectionEnabled:(BOOL)a3
{
  if (self->_shapeDetectionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_shapeDetectionEnabled = a3;
    id v4 = [(MarkupViewController *)self annotationController];
    [v4 setShapeDetectionEnabled:v3];
  }
}

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  return +[MUImageReader hasPrivateImageMetadata:a3];
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  return +[MUImageReader cleanImageMetadataFromData:a3];
}

- (id)_markupBlackColor
{
  return (id)[MEMORY[0x263F1C550] colorWithRed:0.0901960784 green:0.0901960784 blue:0.0901960784 alpha:1.0];
}

- (id)filteredToolbarItemsForItems:(id)a3 fromController:(id)a4
{
  id v4 = a3;
  return v4;
}

- (void)setForcesPDFViewTopAlignment:(BOOL)a3
{
  self->_forcesPDFViewTopAlignment = a3;
  id v4 = [(MarkupViewController *)self contentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(MarkupViewController *)self contentViewController];
    objc_msgSend(v6, "setForcesPDFViewTopAlignment:", -[MarkupViewController forcesPDFViewTopAlignment](self, "forcesPDFViewTopAlignment"));
  }
}

+ (id)markupBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return (id)[MEMORY[0x263F24BB8] markupBarButtonItemWithTarget:a3 action:a4];
}

- (void)setShowShareButtonInToolbar:(BOOL)a3
{
  self->_showShareButtonInToolbar = a3;
  BOOL v3 = !a3;
  id v5 = [(MarkupViewController *)self annotationController];
  id v4 = [v5 modernToolbarView];
  [v4 setShareButtonHidden:v3];
}

- (AKController)annotationController
{
  id v2 = [(MarkupViewController *)self contentViewController];
  BOOL v3 = [v2 annotationController];

  return (AKController *)v3;
}

+ (BOOL)_isInLowMemoryEnvironment
{
  return [MEMORY[0x263F24BB8] _isInLowMemoryEnvironment];
}

+ (double)_maxImageDimensionInView
{
  id v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 < v6) {
    double v4 = v6;
  }
  id v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 nativeScale];
  double v9 = v4 * floor(v8);

  return fmax(v9, 1500.0);
}

- (BOOL)_sourceImageMayContainBaseImageAndModel
{
  return 1;
}

- (void)_setupInitialBaseModelScaleFactorWithScreenSize:(CGSize)a3 windowDecorationSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  double v9 = [(MarkupViewController *)self contentViewController];
  objc_msgSend(v9, "idealContentSizeForScreenSize:windowDecorationSize:", v7, v6, width, height);
  double v11 = v10;

  int v12 = [(MarkupViewController *)self contentViewController];
  [v12 contentSize];
  double v14 = v13;

  [(MarkupViewController *)self setInitialContentScale:v14 / v11];
}

- (BOOL)_shouldShowUndoRedoButtonsInNavigationBar
{
  double v3 = [(MarkupViewController *)self traitCollection];
  if ([v3 horizontalSizeClass] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    double v5 = [(MarkupViewController *)self traitCollection];
    BOOL v4 = [v5 userInterfaceIdiom] == 0;
  }
  return v4;
}

- (void)_updateundoBarButtonWithController:(id)a3
{
  id v18 = a3;
  BOOL v4 = [(MarkupViewController *)self extensionContext];
  if (objc_opt_respondsToSelector())
  {
    if ([(MarkupViewController *)self _shouldShowUndoRedoButtonsInNavigationBar])
    {
      double v5 = [(MarkupViewController *)self undoManager];
    }
    else
    {
      double v5 = 0;
    }
    [v4 setUndoManagerForBarButtons:v5];
  }
  double v6 = [(MarkupViewController *)self navItem];

  if (v6)
  {
    uint64_t v7 = [(MarkupViewController *)self navItem];
  }
  else
  {
    double v8 = [(MarkupViewController *)self navigationItem];

    if (!v8)
    {
LABEL_18:
      double v9 = 0;
      goto LABEL_27;
    }
    uint64_t v7 = [(MarkupViewController *)self navigationItem];
  }
  double v8 = (void *)v7;
  if (!v7) {
    goto LABEL_18;
  }
  double v9 = [MEMORY[0x263EFF980] array];
  double v10 = [v8 rightBarButtonItems];

  if (v10)
  {
    double v11 = [v8 rightBarButtonItems];
    [v9 addObjectsFromArray:v11];
  }
  if (v18)
  {
    int v12 = [v18 annotationController];
    double v13 = [v12 toolbarButtonItemOfType:10];

    double v14 = [v18 annotationController];
    id v15 = [v14 toolbarButtonItemOfType:11];

    if ([(MarkupViewController *)self _useLegacyToolbar])
    {
      if (v13 && ([v9 containsObject:v13] & 1) == 0) {
        [v9 addObject:v13];
      }
      goto LABEL_26;
    }
    uint64_t v16 = [(MarkupViewController *)self toolbar];
    BOOL v17 = [(MarkupViewController *)self _shouldShowUndoRedoButtonsInNavigationBar];
    if (v17)
    {
      if (!v13 || !v15) {
        goto LABEL_25;
      }
      [v9 removeObjectIdenticalTo:v13];
      [v9 removeObjectIdenticalTo:v15];
      [v9 addObject:v15];
      [v9 addObject:v13];
    }
    else
    {
      [v9 removeObject:v13];
      [v9 removeObject:v15];
    }
    [v16 setUndoRedoButtonsHidden:v17];
LABEL_25:

LABEL_26:
  }
LABEL_27:
  [v8 setRightBarButtonItems:v9];
}

- (void)_presentPlaceholderImage
{
  double v3 = [(MarkupViewController *)self placeholderImage];

  if (v3)
  {
    BOOL v4 = [(MarkupViewController *)self contentViewController];
    double v5 = [(MarkupViewController *)self view];
    [v4 visibleContentRectInCoordinateSpace:v5];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    double v14 = [(MarkupViewController *)self placeholderImageView];
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    id v15 = [(MarkupViewController *)self placeholderImage];
    uint64_t v16 = [(MarkupViewController *)self placeholderImageView];
    [v16 setImage:v15];

    BOOL v17 = [(MarkupViewController *)self annotationController];
    id v24 = [v17 toolbarView];

    id v18 = [v24 superview];
    id v19 = [(MarkupViewController *)self view];

    id v20 = [(MarkupViewController *)self view];
    id v21 = [(MarkupViewController *)self placeholderImageView];
    if (v18 == v19)
    {
      uint64_t v22 = [(MarkupViewController *)self annotationController];
      id v23 = [v22 toolbarView];
      [v20 insertSubview:v21 belowSubview:v23];
    }
    else
    {
      [v20 addSubview:v21];
    }
  }
}

- (void)_cleanupPlaceholderImage
{
  double v3 = [(MarkupViewController *)self placeholderImageView];
  [v3 removeFromSuperview];

  [(MarkupViewController *)self setPlaceholderImageView:0];
  [(MarkupViewController *)self setPlaceholderImage:0];
}

- (void)_startObservingAnnotationController
{
  uint64_t v3 = [(MarkupViewController *)self annotationController];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    BOOL v5 = [(MarkupViewController *)self isObservingAKCurrentPageIndex];

    if (!v5)
    {
      [(MarkupViewController *)self setObservingAKCurrentPageIndex:1];
      id v6 = [(MarkupViewController *)self annotationController];
      [v6 addObserver:self forKeyPath:@"currentPageIndex" options:11 context:@"MUVCcurrentPageObservationContext"];
    }
  }
}

- (void)_stopObservingAnnotationController
{
  uint64_t v3 = [(MarkupViewController *)self annotationController];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    BOOL v5 = [(MarkupViewController *)self isObservingAKCurrentPageIndex];

    if (v5)
    {
      [(MarkupViewController *)self setObservingAKCurrentPageIndex:0];
      id v6 = [(MarkupViewController *)self annotationController];
      [v6 removeObserver:self forKeyPath:@"currentPageIndex" context:@"MUVCcurrentPageObservationContext"];
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  double v11 = v10;
  if (a6 == @"MUVCcurrentPageObservationContext")
  {
    double v12 = [v10 objectForKey:*MEMORY[0x263F081C0]];
    int v13 = [v12 BOOLValue];

    if (v13)
    {
      [(MarkupViewController *)self willChangeValueForKey:@"currentPDFPageIndex"];
      goto LABEL_16;
    }
    [(MarkupViewController *)self didChangeValueForKey:@"currentPDFPageIndex"];
    double v14 = [(MarkupViewController *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([(MarkupViewController *)self contentViewController],
          id v15 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v15,
          (isKindOfClass & 1) == 0))
    {
LABEL_15:

      goto LABEL_16;
    }
    BOOL v17 = [v11 objectForKey:*MEMORY[0x263F081B8]];
    id v18 = [v11 objectForKey:*MEMORY[0x263F081C8]];
    id v19 = v18;
    if (v18)
    {
      uint64_t v20 = [v18 unsignedIntegerValue];
      if (v17)
      {
LABEL_9:
        uint64_t v21 = [v17 unsignedIntegerValue];
LABEL_12:
        if (v20 != v21) {
          objc_msgSend(v14, "controller:didChangeToPDFPageIndex:", self);
        }

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      if (v17) {
        goto LABEL_9;
      }
    }
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  v22.receiver = self;
  v22.super_class = (Class)MarkupViewController;
  [(MarkupViewController *)&v22 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
LABEL_16:
}

- (void)_installContentViewControllerForUTI:(id)a3
{
  id v23 = a3;
  BOOL v4 = [(MarkupViewController *)self contentContainerView];

  if (!v4)
  {
    BOOL v5 = [(MarkupViewController *)self view];
    [(MarkupViewController *)self setContentContainerView:v5];
  }
  if (v23)
  {
    id v6 = objc_msgSend(MEMORY[0x263F1D920], "typeWithIdentifier:");
  }
  else
  {
    id v6 = 0;
  }
  if (![v6 conformsToType:*MEMORY[0x263F1DBF0]])
  {
    if ([v6 conformsToType:*MEMORY[0x263F1DB18]])
    {
      double v9 = [MUImageContentViewController alloc];
      id v10 = [(MarkupViewController *)self digestedSourceContent];
      double v11 = [(MarkupViewController *)self archivedModelData];
      double v8 = [(MUImageContentViewController *)v9 initWithSourceContent:v10 archivedDataModel:v11 delegate:self];

      [(MUPDFContentViewController *)v8 setInkStyle:[(MarkupViewController *)self inkStyle]];
      if (v8) {
        goto LABEL_11;
      }
    }
    else
    {
      NSLog(&cfstr_SUnexpectedCon.isa, "-[MarkupViewController _installContentViewControllerForUTI:]", v23);
    }
LABEL_23:
    NSLog(&cfstr_FailedToLoadFi.isa, v23);
    goto LABEL_24;
  }
  double v7 = [(MarkupViewController *)self digestedSourceContent];
  double v8 = [[MUPDFContentViewController alloc] initWithPDFDocument:v7 delegate:self];
  [(MUPDFContentViewController *)v8 setInkStyle:[(MarkupViewController *)self inkStyle]];

  if (!v8) {
    goto LABEL_23;
  }
LABEL_11:
  [(MarkupViewController *)self setContentViewController:v8];
  double v12 = [(MarkupViewController *)self contentViewController];
  [(MarkupViewController *)self addChildViewController:v12];

  if (objc_opt_respondsToSelector()) {
    [(MUPDFContentViewController *)v8 setShowsThumbnailView:!self->_thumbnailViewHidden];
  }
  if (objc_opt_respondsToSelector()) {
    [(MUPDFContentViewController *)v8 setCentersIgnoringContentInsets:[(MarkupViewController *)self centersIgnoringContentInsets]];
  }
  if (objc_opt_respondsToSelector()) {
    [(MUPDFContentViewController *)v8 setNavigationModeHorizontal:[(MarkupViewController *)self isNavigationModeHorizontal]];
  }
  [(MUPDFContentViewController *)v8 setup];
  if (objc_opt_respondsToSelector())
  {
    [(id)objc_opt_class() _maxImageDimensionInView];
    -[MUPDFContentViewController setMaxImageDimension:](v8, "setMaxImageDimension:");
  }
  int v13 = [(MarkupViewController *)self contentViewController];
  double v14 = [v13 view];

  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v15 = [(MarkupViewController *)self _effectiveBackgroundColor];
  [v14 setBackgroundColor:v15];

  uint64_t v16 = [(MarkupViewController *)self contentContainerView];
  [v16 insertSubview:v14 atIndex:0];

  if ([(MarkupViewController *)self useFancyTransition]) {
    [v14 setAlpha:0.0];
  }
  BOOL v17 = [(MarkupViewController *)self contentViewController];
  [v17 didMoveToParentViewController:self];

  id v18 = _NSDictionaryOfVariableBindings(&cfstr_Contentview.isa, v14, 0);
  id v19 = (void *)MEMORY[0x263F08938];
  uint64_t v20 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:0 views:v18];
  [v19 activateConstraints:v20];

  uint64_t v21 = (void *)MEMORY[0x263F08938];
  objc_super v22 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:0 views:v18];
  [v21 activateConstraints:v22];

LABEL_24:
}

- (void)_setupAnnotationController
{
  uint64_t v3 = [(MarkupViewController *)self annotationController];
  id v42 = v3;
  if (v3)
  {
    BOOL v4 = [v3 legacyDoodleController];
    [v4 setPreferDoodle:1];

    BOOL v5 = [v42 legacyDoodleController];
    [v5 setCoalescesDoodles:1];

    [v42 setSelectNewlyCreatedAnnotations:1];
    objc_msgSend(v42, "setShapeDetectionEnabled:", -[MarkupViewController isShapeDetectionEnabled](self, "isShapeDetectionEnabled"));
    objc_msgSend(v42, "setIsUsedOnDarkBackground:", -[MarkupViewController isUsedOnDarkBackground](self, "isUsedOnDarkBackground"));
    id v6 = [v42 attributeController];
    double v7 = [MEMORY[0x263F1C550] whiteColor];
    int v8 = [v6 strokeColorIsEqualTo:v7];

    if (v8)
    {
      double v9 = [v42 attributeController];
      [v9 restoreStrokeColorToSystemDefault];
    }
    if ([(MarkupViewController *)self _useLegacyToolbar])
    {
      id v10 = [v42 toolbarViewController];
      [(MarkupViewController *)self addChildViewController:v10];
      double v11 = [v10 view];
      [v11 setDelegate:self];

      [v10 beginAppearanceTransition:1 animated:0];
      double v12 = [(MarkupViewController *)self contentContainerView];
      int v13 = [v10 view];
      [v12 addSubview:v13];

      [v10 didMoveToParentViewController:self];
      [v10 endAppearanceTransition];
      double v14 = [v42 toolbarView];
      [(MarkupViewController *)self setToolbar:v14];

      BOOL v15 = [(MarkupViewController *)self isToolbarHidden];
      uint64_t v16 = [(MarkupViewController *)self toolbar];
      [v16 setHidden:v15];

      BOOL v17 = [(MarkupViewController *)self toolbar];
      [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v18 = [(MarkupViewController *)self _effectiveToolbarTintColor];
      [v10 setBarTintColor:v18];

      id v19 = [(MarkupViewController *)self _effectiveToolbarItemTintColor];
      [v10 setTintColor:v19];

      if ([(MarkupViewController *)self useFancyTransition])
      {
        uint64_t v20 = [(MarkupViewController *)self toolbar];
        [v20 setAlpha:0.0];

        uint64_t v21 = [v10 floatingAttributeToolbarContainer];
        [v21 setAlpha:0.0];
      }
      objc_super v22 = [(MarkupViewController *)self toolbar];
      id v23 = [v22 leadingAnchor];
      id v24 = [(MarkupViewController *)self contentContainerView];
      id v25 = [v24 leadingAnchor];
      v26 = [v23 constraintEqualToAnchor:v25];
      [v26 setActive:1];

      uint64_t v27 = [(MarkupViewController *)self toolbar];
      int v28 = [v27 trailingAnchor];
      v29 = [(MarkupViewController *)self contentContainerView];
      v30 = [v29 trailingAnchor];
      char v31 = [v28 constraintEqualToAnchor:v30];
      [v31 setActive:1];

      id v32 = [(MarkupViewController *)self toolbar];
      LODWORD(v33) = 1148846080;
      [v32 setContentHuggingPriority:1 forAxis:v33];

      [(MarkupViewController *)self _updateConstraintsForBarPosition:self->_toolbarPosition];
    }
    else
    {
      id v34 = [(MarkupViewController *)self modernToolbar];
      [v34 setAnnotationController:v42];

      uint64_t v35 = [(MarkupViewController *)self showShareButtonInToolbar] ^ 1;
      BOOL v36 = [(MarkupViewController *)self modernToolbar];
      [v36 setShareButtonHidden:v35];

      id v10 = [(MarkupViewController *)self modernToolbar];
      [(MarkupViewController *)self setToolbar:v10];
    }

    [v42 setRulerHostingDelegate:self];
    [(MarkupViewController *)self adjustContentInsetsForBars];
    if ([(MarkupViewController *)self needsToolPickerVisibleWhenAnnotationControllerIsAvailable])
    {
      v37 = [(MarkupViewController *)self annotationController];
      v38 = [v37 toolPicker];
      [v38 setVisible:1 forFirstResponder:self];

      [(AKToolbarView *)self->_modernToolbar setContentsHidden:0];
      [(MarkupViewController *)self setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:0];
    }
    v39 = [(MarkupViewController *)self contentViewController];
    v40 = [v39 view];
    [v40 layoutSubviews];

    char v41 = [(MarkupViewController *)self view];
    [v41 layoutSubviews];
  }
  else
  {
    NSLog(&cfstr_FailedToLoadAk.isa);
  }
}

- (BOOL)rulerHostWantsSharedRuler
{
  return 1;
}

- (void)_createCancelDoneNavBar
{
  v30[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MarkupViewController *)self navBar];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C7E0]);
    BOOL v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v5 setDelegate:self];
    id v6 = [(MarkupViewController *)self contentContainerView];
    [v6 addSubview:v5];

    [(MarkupViewController *)self setNavBar:v5];
    [(MarkupViewController *)self _updateNavBarProperties];
    if ([(MarkupViewController *)self useFancyTransition])
    {
      double v7 = [(MarkupViewController *)self navBar];
      [v7 setAlpha:0.0];
    }
    int v8 = _NSDictionaryOfVariableBindings(&cfstr_Navbar.isa, v5, 0);
    double v9 = [(MarkupViewController *)self contentContainerView];
    id v10 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:|[navBar]|" options:0 metrics:0 views:v8];
    [v9 addConstraints:v10];

    if ([(MarkupViewController *)self showAsFormSheet]
      && [(MarkupViewController *)self useFancyTransition])
    {
      double v11 = (void *)MEMORY[0x263F08938];
      double v12 = [(MarkupViewController *)self contentContainerView];
      int v13 = [v11 constraintWithItem:v5 attribute:3 relatedBy:0 toItem:v12 attribute:3 multiplier:1.0 constant:0.0];
    }
    else
    {
      double v12 = [v5 topAnchor];
      double v14 = [(MarkupViewController *)self view];
      BOOL v15 = [v14 safeAreaLayoutGuide];
      uint64_t v16 = [v15 topAnchor];
      int v13 = [v12 constraintEqualToAnchor:v16];
    }
    [v13 setActive:1];
    id v17 = objc_alloc(MEMORY[0x263F1C800]);
    id v18 = [(MarkupViewController *)self title];
    id v19 = (void *)[v17 initWithTitle:v18];
    [(MarkupViewController *)self setNavItem:v19];

    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_cancel_];
    [(MarkupViewController *)self setCancelButton:v20];

    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:self action:sel_done_];
    [(MarkupViewController *)self setDoneButton:v21];

    objc_super v22 = [(MarkupViewController *)self navItem];
    id v23 = [(MarkupViewController *)self cancelButton];
    v30[0] = v23;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:1];
    [v22 setLeftBarButtonItems:v24];

    id v25 = [(MarkupViewController *)self navItem];
    v26 = [(MarkupViewController *)self doneButton];
    [v25 setRightBarButtonItem:v26];

    uint64_t v27 = [(MarkupViewController *)self navItem];
    v29 = v27;
    int v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
    [v5 setItems:v28];
  }
}

- (void)adjustContentInsetsForBars
{
  id v44 = [(MarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v44 customEdgeInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    if (![(MarkupViewController *)self _useLegacyToolbar]) {
      goto LABEL_17;
    }
    double v11 = [(MarkupViewController *)self annotationController];
    double v12 = [v11 toolbarViewController];
    [v12 visibleHeightOfAttributeBar];
    double v8 = v8 + v13;
    goto LABEL_10;
  }
  double v14 = (double *)MEMORY[0x263F1D1C0];
  double v6 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v10 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  BOOL v15 = [(MarkupViewController *)self navBar];

  if (v15)
  {
    if (![(MarkupViewController *)self showAsFormSheet]
      || (double v16 = 0.0, ![(MarkupViewController *)self useFancyTransition]))
    {
      id v17 = [(MarkupViewController *)self view];
      [v17 safeAreaInsets];
      double v16 = v18;
    }
    id v19 = [(MarkupViewController *)self navBar];
    [v19 frame];
    double v4 = v16 + v20;

    if ([(MarkupViewController *)self _useLegacyToolbar])
    {
      double v11 = [(MarkupViewController *)self annotationController];
      double v12 = [v11 toolbarViewController];
      [v12 heightIncludingAdditionalVisibleBars];
      double v8 = v21;
LABEL_10:

      goto LABEL_17;
    }
    BOOL v36 = [(MarkupViewController *)self modernToolbar];
    v37 = [(MarkupViewController *)self view];
    [v37 bounds];
    objc_msgSend(v36, "sizeThatFits:", CGRectGetWidth(v46), 1000.0);

    double v8 = 0.0;
  }
  else
  {
    double v22 = *v14;
    double v23 = v14[2];
    id v24 = [(MarkupViewController *)self view];
    [v24 safeAreaInsets];
    double v26 = v25;

    double v4 = v22 + fmax(v26, 0.0);
    uint64_t v27 = [(MarkupViewController *)self view];
    [v27 safeAreaInsets];
    double v29 = v28;

    double v8 = v23 + fmax(v29, 0.0);
    if (![(MarkupViewController *)self isToolbarHidden])
    {
      unint64_t toolbarPosition = self->_toolbarPosition;
      BOOL v31 = toolbarPosition >= 2;
      unint64_t v32 = toolbarPosition - 2;
      if (v31)
      {
        if (v32 <= 1)
        {
          double v33 = [(MarkupViewController *)self toolbar];
          [v33 frame];
          double v35 = v34;

          double v4 = v4 + v35;
        }
      }
      else
      {
        if (![(MarkupViewController *)self _useLegacyToolbar])
        {
          double v11 = [(MarkupViewController *)self modernToolbar];
          double v12 = [(MarkupViewController *)self view];
          [v12 bounds];
          objc_msgSend(v11, "sizeThatFits:", CGRectGetWidth(v47), 1000.0);
          double v8 = v43;
          goto LABEL_10;
        }
        v39 = [(MarkupViewController *)self annotationController];
        v40 = [v39 toolbarViewController];
        [v40 heightIncludingAdditionalVisibleBars];
        double v42 = v41;

        double v8 = v8 + v42;
      }
    }
  }
LABEL_17:
  v38 = [(MarkupViewController *)self contentViewController];
  objc_msgSend(v38, "setEdgeInsets:", v4, v6, v8, v10);
}

- (void)_updateConstraintsForBarPosition:(int64_t)a3
{
  double v5 = [(MarkupViewController *)self toolbarTopConstraint];
  [v5 setActive:0];

  double v6 = [(MarkupViewController *)self toolbarTopAttachedConstraint];
  [v6 setActive:0];

  double v7 = [(MarkupViewController *)self toolbarBottomConstraint];
  [v7 setActive:0];

  if ((unint64_t)a3 < 2)
  {
    double v14 = [(MarkupViewController *)self toolbarBottomConstraint];

    if (!v14)
    {
      BOOL v15 = [(MarkupViewController *)self toolbar];
      double v16 = [v15 bottomAnchor];
      id v17 = [(MarkupViewController *)self view];
      double v18 = [v17 bottomAnchor];
      id v19 = [v16 constraintEqualToAnchor:v18];
      [(MarkupViewController *)self setToolbarBottomConstraint:v19];
    }
    double v13 = [(MarkupViewController *)self toolbarBottomConstraint];
  }
  else if (a3 == 3)
  {
    double v20 = [(MarkupViewController *)self toolbarTopAttachedConstraint];

    if (!v20)
    {
      double v21 = [(MarkupViewController *)self toolbar];
      double v22 = [v21 topAnchor];
      double v23 = [(MarkupViewController *)self view];
      id v24 = [v23 safeAreaLayoutGuide];
      double v25 = [v24 topAnchor];
      double v26 = [v22 constraintEqualToAnchor:v25];
      [(MarkupViewController *)self setToolbarTopAttachedConstraint:v26];
    }
    double v13 = [(MarkupViewController *)self toolbarTopAttachedConstraint];
  }
  else
  {
    if (a3 != 2) {
      return;
    }
    double v8 = [(MarkupViewController *)self toolbarTopConstraint];

    if (!v8)
    {
      double v9 = (void *)MEMORY[0x263F08938];
      double v10 = [(MarkupViewController *)self toolbar];
      double v11 = [(MarkupViewController *)self contentContainerView];
      double v12 = [v9 constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:0.0];
      [(MarkupViewController *)self setToolbarTopConstraint:v12];
    }
    double v13 = [(MarkupViewController *)self toolbarTopConstraint];
  }
  id v27 = v13;
  [v13 setActive:1];
}

- (void)_updateAppearanceForTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = [(MarkupViewController *)self contentViewController];
  double v6 = [v5 view];
  [v6 alpha];
  double v8 = v7;

  if (v8 == 1.0)
  {
    double v9 = [(MarkupViewController *)self _effectiveBackgroundColor];
    double v10 = [(MarkupViewController *)self contentContainerView];
    [v10 setBackgroundColor:v9];
  }
  double v11 = [(MarkupViewController *)self _effectiveBackgroundColor];
  double v12 = [(MarkupViewController *)self contentViewController];
  double v13 = [v12 view];
  [v13 setBackgroundColor:v11];

  if ([(MarkupViewController *)self _useLegacyToolbar])
  {
    double v14 = [(MarkupViewController *)self annotationController];
    BOOL v15 = [v14 toolbarViewController];

    double v16 = [(MarkupViewController *)self _effectiveToolbarTintColor];
    [v15 setBarTintColor:v16];

    id v17 = [(MarkupViewController *)self _effectiveToolbarItemTintColor];
    [v15 setTintColor:v17];
  }
  [(MarkupViewController *)self _updateNavBarProperties];
  double v18 = [(MarkupViewController *)self annotationController];
  id v19 = [v18 toolbarViewController];
  [v19 traitCollectionDidChange:v4];

  [(MarkupViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)setNavBar:(id)a3
{
  double v5 = (UINavigationBar *)a3;
  p_navBar = &self->_navBar;
  if (self->_navBar != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_navBar, a3);
    p_navBar = (UINavigationBar **)[(MarkupViewController *)self _updateNavBarProperties];
    double v5 = v7;
  }
  MEMORY[0x270F9A758](p_navBar, v5);
}

- (void)_updateNavBarProperties
{
  v9[1] = *MEMORY[0x263EF8340];
  double v3 = [(MarkupViewController *)self _effectiveToolbarTintColor];
  id v4 = [(MarkupViewController *)self navBar];
  [v4 setBarTintColor:v3];

  double v5 = [(MarkupViewController *)self _effectiveNavBarTitleColor];
  if (v5)
  {
    uint64_t v8 = *MEMORY[0x263F1C240];
    id v4 = [(MarkupViewController *)self _effectiveNavBarTitleColor];
    v9[0] = v4;
    double v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1];
  }
  else
  {
    double v6 = 0;
  }
  double v7 = [(MarkupViewController *)self navBar];
  [v7 setTitleTextAttributes:v6];

  if (v5)
  {
  }
}

- (void)setBackgroundColor:(id)a3
{
  id v11 = a3;
  id v4 = [(MarkupViewController *)self backgroundColor];
  char v5 = [v4 isEqual:v11];

  if ((v5 & 1) == 0)
  {
    double v6 = (UIColor *)[v11 copy];
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v6;

    uint64_t v8 = self->_backgroundColor;
    double v9 = [(MarkupViewController *)self contentViewController];
    double v10 = [v9 view];
    [v10 setBackgroundColor:v8];
  }
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (id)_effectiveBackgroundColor
{
  double v3 = [(MarkupViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 1) {
    [MEMORY[0x263F1C550] whiteColor];
  }
  else {
  id v4 = [(MarkupViewController *)self _markupBlackColor];
  }

  char v5 = [(MarkupViewController *)self backgroundColor];
  if (v5)
  {
    id v6 = [(MarkupViewController *)self backgroundColor];
  }
  else
  {
    id v6 = v4;
  }
  double v7 = v6;

  return v7;
}

- (UIColor)toolbarItemTintColor
{
  return self->_toolbarItemTintColor;
}

- (void)setToolbarItemTintColor:(id)a3
{
  id v10 = a3;
  id v4 = [(MarkupViewController *)self toolbarItemTintColor];
  char v5 = [v4 isEqual:v10];

  if ((v5 & 1) == 0 && [(MarkupViewController *)self _useLegacyToolbar])
  {
    id v6 = (UIColor *)[v10 copy];
    toolbarItemTintColor = self->_toolbarItemTintColor;
    self->_toolbarItemTintColor = v6;

    uint64_t v8 = [(MarkupViewController *)self annotationController];
    double v9 = [v8 toolbarViewController];

    [v9 setTintColor:v10];
  }
}

- (id)_effectiveToolbarItemTintColor
{
  double v3 = [(MarkupViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 1) {
    [MEMORY[0x263F1C550] systemBlueColor];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] whiteColor];
  }

  if (self->_toolbarItemTintColor) {
    toolbarItemTintColor = self->_toolbarItemTintColor;
  }
  else {
    toolbarItemTintColor = v4;
  }
  id v6 = toolbarItemTintColor;

  return v6;
}

- (UIColor)toolbarTintColor
{
  return self->_toolbarTintColor;
}

- (void)setToolbarTintColor:(id)a3
{
  id v10 = a3;
  id v4 = [(MarkupViewController *)self toolbarTintColor];
  char v5 = [v4 isEqual:v10];

  if ((v5 & 1) == 0 && [(MarkupViewController *)self _useLegacyToolbar])
  {
    id v6 = (UIColor *)[v10 copy];
    toolbarTintColor = self->_toolbarTintColor;
    self->_toolbarTintColor = v6;

    uint64_t v8 = [(MarkupViewController *)self annotationController];
    double v9 = [v8 toolbarViewController];

    [v9 setBarTintColor:self->_toolbarTintColor];
  }
}

- (id)_effectiveToolbarTintColor
{
  double v3 = [(MarkupViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 1)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(MarkupViewController *)self _markupBlackColor];
  }

  toolbarTintColor = v4;
  if (self->_toolbarItemTintColor) {
    toolbarTintColor = self->_toolbarTintColor;
  }
  id v6 = toolbarTintColor;

  return v6;
}

- (UIColor)navBarTitleColor
{
  return self->_navBarTitleColor;
}

- (void)setNavBarTitleColor:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(MarkupViewController *)self navBarTitleColor];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    double v7 = (UIColor *)[v4 copy];
    navBarTitleColor = self->_navBarTitleColor;
    self->_navBarTitleColor = v7;

    double v9 = self->_navBarTitleColor;
    if (v9)
    {
      uint64_t v12 = *MEMORY[0x263F1C240];
      v13[0] = v9;
      id v10 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
    }
    else
    {
      id v10 = 0;
    }
    id v11 = [(MarkupViewController *)self navBar];
    [v11 setTitleTextAttributes:v10];

    if (v9) {
  }
    }
}

- (id)_effectiveNavBarTitleColor
{
  double v3 = [(MarkupViewController *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 1) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  id v4 = [MEMORY[0x263F1C550] whiteColor];
  }

  char v5 = [(MarkupViewController *)self navBarTitleColor];
  if (v5)
  {
    id v6 = [(MarkupViewController *)self navBarTitleColor];
  }
  else
  {
    id v6 = v4;
  }
  double v7 = v6;

  return v7;
}

- (BOOL)isUsedOnDarkBackground
{
  return 0;
}

- (void)delete:(id)a3
{
  id v7 = a3;
  id v4 = [(MarkupViewController *)self annotationController];
  int v5 = [v4 validateDelete:v7];

  if (v5)
  {
    id v6 = [(MarkupViewController *)self annotationController];
    [v6 delete:v7];
  }
}

- (void)duplicate:(id)a3
{
  id v7 = a3;
  id v4 = [(MarkupViewController *)self annotationController];
  int v5 = [v4 validateDuplicate:v7];

  if (v5)
  {
    id v6 = [(MarkupViewController *)self annotationController];
    [v6 duplicate:v7];
  }
}

- (void)editTextAnnotation:(id)a3
{
  id v7 = a3;
  id v4 = [(MarkupViewController *)self annotationController];
  int v5 = [v4 validateEditTextAnnotation:v7];

  if (v5)
  {
    id v6 = [(MarkupViewController *)self annotationController];
    [v6 editTextAnnotation:v7];
  }
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(MarkupViewController *)self allowShakeToUndo];
  if (a3 == 1 && v7)
  {
    uint64_t v8 = [(MarkupViewController *)self annotationController];
    int v9 = [v8 validateUndo:0];

    id v10 = [(MarkupViewController *)self annotationController];
    int v11 = [v10 validateRedo:0];

    uint64_t v12 = [(MarkupViewController *)self annotationController];
    objc_initWeak(location, v12);

    objc_initWeak(&from, self);
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __46__MarkupViewController_motionEnded_withEvent___block_invoke;
    v43[3] = &unk_2649C2878;
    objc_copyWeak(&v44, &from);
    double v13 = (void *)MEMORY[0x230F8ECA0](v43);
    if ((v9 & 1) != 0 || v11)
    {
      double v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v15 = [v14 localizedStringForKey:@"Undo" value:&stru_26E1811C8 table:@"MarkupViewController"];
      unint64_t v32 = v13;

      double v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v17 = [v16 localizedStringForKey:@"Redo" value:&stru_26E1811C8 table:@"MarkupViewController"];

      v30 = (void *)v15;
      BOOL v31 = (void *)v17;
      if (v9) {
        double v18 = (void *)v15;
      }
      else {
        double v18 = (void *)v17;
      }
      id v29 = v18;
      id v19 = objc_msgSend(MEMORY[0x263F1C3F8], "alertControllerWithTitle:message:preferredStyle:", 0);
      double v20 = (void *)MEMORY[0x263F1C3F0];
      double v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v22 = [v21 localizedStringForKey:@"Cancel" value:&stru_26E1811C8 table:@"MarkupViewController"];
      v41[0] = MEMORY[0x263EF8330];
      v41[1] = 3221225472;
      v41[2] = __46__MarkupViewController_motionEnded_withEvent___block_invoke_2;
      v41[3] = &unk_2649C2C58;
      id v23 = v32;
      id v42 = v23;
      id v24 = [v20 actionWithTitle:v22 style:1 handler:v41];
      [v19 addAction:v24];

      if (v9)
      {
        double v25 = (void *)MEMORY[0x263F1C3F0];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __46__MarkupViewController_motionEnded_withEvent___block_invoke_3;
        void v38[3] = &unk_2649C2C80;
        objc_copyWeak(&v40, location);
        id v39 = v23;
        double v26 = [v25 actionWithTitle:v30 style:0 handler:v38];
        [v19 addAction:v26];

        objc_destroyWeak(&v40);
      }
      if (v11)
      {
        id v27 = (void *)MEMORY[0x263F1C3F0];
        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        v35[2] = __46__MarkupViewController_motionEnded_withEvent___block_invoke_4;
        v35[3] = &unk_2649C2C80;
        objc_copyWeak(&v37, location);
        id v36 = v23;
        double v28 = [v27 actionWithTitle:v31 style:0 handler:v35];
        [v19 addAction:v28];

        objc_destroyWeak(&v37);
      }
      [(MarkupViewController *)self presentViewController:v19 animated:1 completion:0];

      double v13 = v32;
    }

    objc_destroyWeak(&v44);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)MarkupViewController;
    if ([(MarkupViewController *)&v34 respondsToSelector:sel_motionEnded_withEvent_])
    {
      v33.receiver = self;
      v33.super_class = (Class)MarkupViewController;
      [(MarkupViewController *)&v33 motionEnded:a3 withEvent:v6];
    }
  }
}

void __46__MarkupViewController_motionEnded_withEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained becomeFirstResponder];
}

uint64_t __46__MarkupViewController_motionEnded_withEvent___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __46__MarkupViewController_motionEnded_withEvent___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained undo:0];
}

void __46__MarkupViewController_motionEnded_withEvent___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained redo:0];
}

- (void)_showTextStyleOptions:(id)a3
{
  id v7 = a3;
  id v4 = [(MarkupViewController *)self annotationController];
  int v5 = [v4 validateShowAttributeInspector:v7];

  if (v5)
  {
    id v6 = [(MarkupViewController *)self annotationController];
    [v6 showAttributeInspector:v7];
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel__showTextStyleOptions_ == a3)
  {
    uint64_t v8 = [(MarkupViewController *)self annotationController];
    char v9 = [v8 validateShowAttributeInspector:v6];
LABEL_10:
    BOOL v7 = v9;

    goto LABEL_11;
  }
  if (sel_editTextAnnotation_ == a3)
  {
    uint64_t v8 = [(MarkupViewController *)self annotationController];
    char v9 = [v8 validateEditTextAnnotation:v6];
    goto LABEL_10;
  }
  if (sel_duplicate_ == a3)
  {
    uint64_t v8 = [(MarkupViewController *)self annotationController];
    char v9 = [v8 validateDuplicate:v6];
    goto LABEL_10;
  }
  if (sel_delete_ == a3)
  {
    uint64_t v8 = [(MarkupViewController *)self annotationController];
    char v9 = [v8 validateDelete:v6];
    goto LABEL_10;
  }
  v11.receiver = self;
  v11.super_class = (Class)MarkupViewController;
  BOOL v7 = [(MarkupViewController *)&v11 canPerformAction:a3 withSender:v6];
LABEL_11:

  return v7;
}

- (void)positionSketchOverlay:(id)a3 forContentViewController:(id)a4
{
  id v49 = a3;
  int v5 = [(MarkupViewController *)self toolbar];
  id v6 = [v5 superview];

  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(MarkupViewController *)self sketchOverlayInsets];
  double v16 = v8 + v15;
  double v18 = v10 + v17;
  double v20 = v12 - (v15 + v19);
  double v22 = v14 - (v17 + v21);
  NSClassFromString(&cfstr_Aksmoothpathvi.isa);
  if (objc_opt_isKindOfClass())
  {
    id v23 = [(MarkupViewController *)self contentViewController];
    [v23 visibleContentRectInCoordinateSpace:v6];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;

    unint64_t v32 = [(MarkupViewController *)self contentViewController];
    objc_super v33 = [v32 view];
    objc_msgSend(v33, "convertRect:toView:", v6, v25, v27, v29, v31);
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;

    v51.origin.double x = v16;
    v51.origin.double y = v18;
    v51.size.double width = v20;
    v51.size.double height = v22;
    v55.origin.double x = v35;
    v55.origin.double y = v37;
    v55.size.double width = v39;
    v55.size.double height = v41;
    CGRect v52 = CGRectIntersection(v51, v55);
    double x = v52.origin.x;
    double y = v52.origin.y;
    double width = v52.size.width;
    double height = v52.size.height;
    if (!CGRectIsNull(v52))
    {
      double v22 = height;
      double v20 = width;
      double v18 = y;
      double v16 = x;
    }
  }
  objc_msgSend(v6, "convertRect:toView:", 0, v16, v18, v20, v22);
  CGRect v54 = CGRectIntegral(v53);
  objc_msgSend(v6, "convertRect:fromView:", 0, v54.origin.x, v54.origin.y, v54.size.width, v54.size.height);
  objc_msgSend(v49, "setFrame:");
  CGRect v46 = [v49 superview];

  if (v46 != v6)
  {
    [v49 setAutoresizingMask:18];
    CGRect v47 = [(MarkupViewController *)self toolbar];
    v48 = [v47 superview];
    [v48 addSubview:v49];
  }
}

- (id)annotationControllerOfContentViewController:(id)a3 willSetToolbarItems:(id)a4
{
  id v6 = a4;
  double v7 = [a3 annotationController];
  double v8 = [(MarkupViewController *)self sourceContent];
  double v9 = +[MUImageDownsamplingUtilities _sourceContentType:v8];

  if (v9)
  {
    double v10 = [MEMORY[0x263F1D920] typeWithIdentifier:v9];
  }
  else
  {
    double v10 = 0;
  }
  if (([v10 conformsToType:*MEMORY[0x263F1DBF0]] & 1) == 0)
  {
    uint64_t v11 = [v6 indexOfObjectPassingTest:&__block_literal_global_0];
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = v11;
      double v13 = (void *)[v6 mutableCopy];
      [v13 removeObjectAtIndex:v12];

      id v6 = v13;
    }
  }
  double v14 = [(MarkupViewController *)self filteredToolbarItemsForItems:v6 fromController:v7];

  double v15 = [(MarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v16 = [v15 controller:self willSetToolbarItems:v14];

    double v14 = (void *)v16;
  }

  return v14;
}

BOOL __88__MarkupViewController_annotationControllerOfContentViewController_willSetToolbarItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  BOOL result = [a2 akToolbarButtonItemType] == 12;
  *a4 = result;
  return result;
}

- (BOOL)contentViewController:(id)a3 shouldHandleURL:(id)a4
{
  id v5 = a4;
  id v6 = [(MarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 controller:self shouldOpenLinkAtURL:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)annotationController:(id)a3 detectedEditOfType:(unint64_t)a4
{
  uint64_t v5 = [(MarkupViewController *)self delegate];
  if (v5)
  {
    id v6 = (void *)v5;
    if (objc_opt_respondsToSelector()) {
      [v6 controllerDidChangeContent:self];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)controllerWillShowSignatureCaptureView:(id)a3
{
  self->_showingSignaturesUI = 1;
  [(MarkupViewController *)self _notifyDidChangeShowingSignaturesUI];
}

- (void)controllerWillDismissSignatureCaptureView:(id)a3
{
  self->_showingSignaturesUI = 0;
  [(MarkupViewController *)self _notifyDidChangeShowingSignaturesUI];
}

- (void)controllerWillShowSignatureManagerView:(id)a3
{
  self->_showingSignaturesUI = 1;
  [(MarkupViewController *)self _notifyDidChangeShowingSignaturesUI];
}

- (void)controllerWillDismissSignatureManagerView:(id)a3
{
  self->_showingSignaturesUI = 0;
  [(MarkupViewController *)self _notifyDidChangeShowingSignaturesUI];
}

- (void)_notifyDidChangeShowingSignaturesUI
{
  id v3 = [(MarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 markupViewController:self didChangeShowingSignaturesUI:self->_showingSignaturesUI];
  }
}

- (CGSize)adjustedSourceImageSize
{
  double v2 = *MEMORY[0x263F001B0];
  double v3 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (int64_t)positionForBar:(id)a3
{
  id v4 = a3;
  id v5 = [(MarkupViewController *)self navBar];

  if (v5 == v4) {
    return 3;
  }
  else {
    return self->_toolbarPosition;
  }
}

- (UIView)toolbar
{
  if ([(MarkupViewController *)self _useLegacyToolbar])
  {
    double v3 = [(MarkupViewController *)self annotationController];
    id v4 = [v3 toolbarView];
  }
  else
  {
    id v4 = [(MarkupViewController *)self modernToolbar];
  }
  return (UIView *)v4;
}

- (void)_toolbarShareButtonTapped:(id)a3
{
  id v4 = [(MarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 performSelector:sel_controllerWantsToShowShareSheet_ withObject:self];
  }
}

- (int64_t)toolbarController:(id)a3 positionForBar:(id)a4
{
  return self->_toolbarPosition;
}

- (id)getMenuElementsForPage:(id)a3
{
  id v4 = a3;
  id v5 = [(MarkupViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 menuElementsForPage:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (UIView)pageLabelView
{
  return 0;
}

- (NSUndoManager)akUndoManager
{
  return self->_akUndoManager;
}

- (void)setAkUndoManager:(id)a3
{
}

- (BOOL)allowShakeToUndo
{
  return self->_allowShakeToUndo;
}

- (void)setAllowShakeToUndo:(BOOL)a3
{
  self->_allowShakeToUndo = a3;
}

- (BOOL)centersIgnoringContentInsets
{
  return self->_centersIgnoringContentInsets;
}

- (void)setCentersIgnoringContentInsets:(BOOL)a3
{
  self->_centersIgnoringContentInsets = a3;
}

- (MarkupViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MarkupViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)encryptPrivateMetadata
{
  return self->_encryptPrivateMetadata;
}

- (void)setEncryptPrivateMetadata:(BOOL)a3
{
  self->_encryptPrivateMetadata = a3;
}

- (BOOL)forcesPDFViewTopAlignment
{
  return self->_forcesPDFViewTopAlignment;
}

- (NSString)hostProcessBundleIdentifier
{
  return self->_hostProcessBundleIdentifier;
}

- (void)setHostProcessBundleIdentifier:(id)a3
{
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (BOOL)isNavigationModeHorizontal
{
  return self->_navigationModeHorizontal;
}

- (UIImageView)placeholderImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 1072, 1);
}

- (void)setPlaceholderImageView:(id)a3
{
}

- (BOOL)isShapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (BOOL)showShareButtonInToolbar
{
  return self->_showShareButtonInToolbar;
}

- (BOOL)showThumbnailViewForMultipage
{
  return self->_showThumbnailViewForMultipage;
}

- (BOOL)isThumbnailViewHidden
{
  return self->_thumbnailViewHidden;
}

- (BOOL)isToolbarHidden
{
  return self->_toolbarHidden;
}

- (int64_t)toolbarPosition
{
  return self->_toolbarPosition;
}

- (MUContentViewControllerProtocol)contentViewController
{
  return (MUContentViewControllerProtocol *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setContentViewController:(id)a3
{
}

- (BOOL)needToPerformFullTeardown
{
  return self->_needToPerformFullTeardown;
}

- (void)setNeedToPerformFullTeardown:(BOOL)a3
{
  self->_needToPerformFullTeardown = a3;
}

- (BOOL)needToPerformDocumentClosedTeardown
{
  return self->_needToPerformDocumentClosedTeardown;
}

- (void)setNeedToPerformDocumentClosedTeardown:(BOOL)a3
{
  self->_needToPerformDocumentClosedTeardown = a3;
}

- (BOOL)isObservingAKCurrentPageIndex
{
  return self->_observingAKCurrentPageIndex;
}

- (void)setObservingAKCurrentPageIndex:(BOOL)a3
{
  self->_observingAKCurrentPageIndedouble x = a3;
}

- (NSString)sourceContentType
{
  return (NSString *)objc_getProperty(self, a2, 1096, 1);
}

- (void)setSourceContentType:(id)a3
{
}

- (id)sourceContent
{
  return self->_sourceContent;
}

- (void)setSourceContent:(id)a3
{
}

- (id)digestedSourceContent
{
  return objc_getProperty(self, a2, 1112, 1);
}

- (void)setDigestedSourceContent:(id)a3
{
}

- (NSData)archivedModelData
{
  return (NSData *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setArchivedModelData:(id)a3
{
}

- (double)initialContentScale
{
  return self->_initialContentScale;
}

- (void)setInitialContentScale:(double)a3
{
  self->_initialContentScale = a3;
}

- (void)setToolbar:(id)a3
{
}

- (AKToolbarView)modernToolbar
{
  return (AKToolbarView *)objc_getProperty(self, a2, 1144, 1);
}

- (void)setModernToolbar:(id)a3
{
}

- (NSLayoutConstraint)toolbarTopConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setToolbarTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolbarTopAttachedConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setToolbarTopAttachedConstraint:(id)a3
{
}

- (NSLayoutConstraint)toolbarBottomConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setToolbarBottomConstraint:(id)a3
{
}

- (UINavigationItem)navItem
{
  return self->_navItem;
}

- (void)setNavItem:(id)a3
{
}

- (UIBarButtonItem)cancelButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setCancelButton:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setDoneButton:(id)a3
{
}

- (UIImage)placeholderImage
{
  return (UIImage *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setPlaceholderImage:(id)a3
{
}

- (BOOL)alreadyLoggedSavingForThisDocument
{
  return self->_alreadyLoggedSavingForThisDocument;
}

- (void)setAlreadyLoggedSavingForThisDocument:(BOOL)a3
{
  self->_BOOL alreadyLoggedSavingForThisDocument = a3;
}

- (BOOL)needsToolPickerVisibleWhenAnnotationControllerIsAvailable
{
  return self->_needsToolPickerVisibleWhenAnnotationControllerIsAvailable;
}

- (void)setNeedsToolPickerVisibleWhenAnnotationControllerIsAvailable:(BOOL)a3
{
  self->_needsToolPickerVisibleWhenAnnotationControllerIsAvailable = a3;
}

- (NSString)preferredFileDisplayName
{
  return self->_preferredFileDisplayName;
}

- (UIView)contentContainerView
{
  return (UIView *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setContentContainerView:(id)a3
{
}

- (UIView)transitionDimmingView
{
  return (UIView *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setTransitionDimmingView:(id)a3
{
}

- (UIView)whiteView
{
  return (UIView *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setWhiteView:(id)a3
{
}

- (BOOL)useFancyTransition
{
  return self->_useFancyTransition;
}

- (void)setUseFancyTransition:(BOOL)a3
{
  self->_useFancyTransition = a3;
}

- (BOOL)isAnimatingMarkupExtensionTransition
{
  return self->_isAnimatingMarkupExtensionTransition;
}

- (void)setIsAnimatingMarkupExtensionTransition:(BOOL)a3
{
  self->_isAnimatingMarkupExtensionTransition = a3;
}

- (BOOL)userDidCancel
{
  return self->_userDidCancel;
}

- (void)setUserDidCancel:(BOOL)a3
{
  self->_userDidCancel = a3;
}

- (BOOL)showAsFormSheet
{
  return self->_showAsFormSheet;
}

- (void)setShowAsFormSheet:(BOOL)a3
{
  self->_showAsFormSheet = a3;
}

- (NSString)originalImageDescription
{
  return self->_originalImageDescription;
}

- (void)setOriginalImageDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalImageDescription, 0);
  objc_storeStrong((id *)&self->_whiteView, 0);
  objc_storeStrong((id *)&self->_transitionDimmingView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_preferredFileDisplayName, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_navItem, 0);
  objc_storeStrong((id *)&self->_toolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarTopAttachedConstraint, 0);
  objc_storeStrong((id *)&self->_toolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_modernToolbar, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_archivedModelData, 0);
  objc_storeStrong(&self->_digestedSourceContent, 0);
  objc_storeStrong(&self->_sourceContent, 0);
  objc_storeStrong((id *)&self->_sourceContentType, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_hostProcessBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_akUndoManager, 0);
  objc_storeStrong((id *)&self->_navBarTitleColor, 0);
  objc_storeStrong((id *)&self->_toolbarTintColor, 0);
  objc_storeStrong((id *)&self->_toolbarItemTintColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end