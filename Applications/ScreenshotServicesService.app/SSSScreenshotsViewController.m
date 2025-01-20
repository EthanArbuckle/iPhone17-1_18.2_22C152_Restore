@interface SSSScreenshotsViewController
+ (id)activityTypeOrder;
- (BOOL)_canShowWhileLocked;
- (BOOL)_contentSwitcherShouldMoveDown;
- (BOOL)_cropPDFEnabled;
- (BOOL)_layoutShouldEnableContentSwitcher;
- (BOOL)_layoutShouldShowContentSwitcher;
- (BOOL)_pencilSqueezeInteractionCanShowPaletteView:(id)a3;
- (BOOL)_shouldSendToDeveloper;
- (BOOL)aaModeEnabled;
- (BOOL)analysisModeEnabled;
- (BOOL)annotationModeEnabled;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)inStateTransition;
- (BOOL)initialAnnotationMode;
- (BOOL)isShowingDeleteConfirmation;
- (BOOL)isShowingDoneActionSheet;
- (BOOL)isShowingModalUI;
- (BOOL)screenshotsUseTrilinearMinificationFilter;
- (BOOL)showsShadow;
- (BOOL)snapshotScreenshotEdits;
- (CGRect)getVisibleBoundsForOverlay;
- (CGRect)screenshotsExtentRect;
- (NSArray)dragItems;
- (NSArray)visibleScreenshots;
- (SSSScreenshot)currentScreenshot;
- (SSSScreenshotsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SSSScreenshotsViewControllerDelegate)delegate;
- (UICoordinateSpace)screenshotsParentCoordinateSpace;
- (VKCImageAnalyzer)imageAnalyzer;
- (double)contentSwitcherAlpha;
- (id)_accessibilityHUDWindow;
- (id)_betaAppActivityItemIfAvailble;
- (id)_betaApplicationName;
- (id)_buildDoneMenu;
- (id)_buildDoneMenuElements;
- (id)_bundleIDForBetaApp;
- (id)_currentScreenshotView;
- (id)_visionKitActivityItemIfAvailble;
- (id)analysisButtonImageForCurrentState;
- (id)previewForDragItem:(id)a3 inContainer:(id)a4;
- (id)targetForCancellingDragItem:(id)a3 inContainer:(id)a4;
- (id)undoManager;
- (unint64_t)state;
- (unint64_t)supportedInterfaceOrientations;
- (void)_actuallyPresentShareFromBarButtonItem:(id)a3;
- (void)_cancelCrop;
- (void)_cancelSharing:(BOOL)a3 completion:(id)a4;
- (void)_clearSecurityScopedResourcesAndTemporaryFiles;
- (void)_configureBarButtonItems;
- (void)_configureBarsIfNecessary;
- (void)_deletePushed;
- (void)_dismissActivityViewController:(BOOL)a3 completion:(id)a4;
- (void)_dismissInflightActivity:(BOOL)a3 completion:(id)a4;
- (void)_dismissWithDeleteOptions:(unint64_t)a3;
- (void)_enterCrop;
- (void)_exitCrop;
- (void)_exportVellumPDF;
- (void)_handlePencilSqueezeInteractionWillShowPaletteViewNotification:(id)a3;
- (void)_image:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5;
- (void)_opacityControlChanged;
- (void)_opacityControlLifted;
- (void)_prepareActivityViewController;
- (void)_prepareActivityViewControllerNeedsActivityUpdate:(BOOL)a3;
- (void)_presentActivityViewControllerFromBarButtonItem:(id)a3;
- (void)_presentUndoRedoAlertControllerIfNecessary;
- (void)_recapPushed;
- (void)_redoPushed;
- (void)_relevantTraitsDidChange;
- (void)_resetCrop;
- (void)_revertPushed;
- (void)_saveImages:(id)a3 toQuickNoteWithDismissalCompletionBlock:(id)a4;
- (void)_savePDFToPhotosPushed;
- (void)_saveToFilesPushed:(BOOL)a3 savePDF:(BOOL)a4;
- (void)_saveToQuickNotePushed:(BOOL)a3 savePDF:(BOOL)a4;
- (void)_screenshotManagerDidProcessDocumentUpdate:(id)a3;
- (void)_screenshotManagerDidProcessMetadataUpdate:(id)a3;
- (void)_selectScreenshotOrFull:(id)a3;
- (void)_sendToDeveloper;
- (void)_sharePushed:(id)a3;
- (void)_undoManagerDidUndoRedoChange:(id)a3;
- (void)_undoPushed;
- (void)_updateActivityViewController;
- (void)_updateActivityViewControllerNeedsActivityUpdate:(BOOL)a3;
- (void)_updateBarButtonItemPositionsAnimated:(BOOL)a3;
- (void)_updatePropertiesOnManagedSubviews;
- (void)_updateTopBarProperties;
- (void)_updateUndoRedoEnabledState;
- (void)aaButtonPressed:(id)a3;
- (void)activeScreenshotViewDidChangeToView:(id)a3 fromView:(id)a4;
- (void)analysisButtonPressed:(id)a3;
- (void)annotationButtonPressed:(id)a3;
- (void)commitInflightEditsIfNecessary;
- (void)cropDidChangeForScreenshotView:(id)a3;
- (void)dealloc;
- (void)didTapOpacityOptionWithAttributeView:(id)a3;
- (void)dismissActivityViewController;
- (void)dismissTFViewController;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)endOpacityEditing;
- (void)loadView;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)parentScreenshotView:(id)a3 animated:(BOOL)a4;
- (void)presentActivityViewController;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)removeChildViewControllers;
- (void)removeScreenshots:(id)a3 forReason:(unint64_t)a4 alongsideAnimations:(id)a5 completion:(id)a6;
- (void)screenshotsView:(id)a3 didHitTestView:(id)a4 point:(CGPoint)a5 withEvent:(id)a6;
- (void)screenshotsView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4;
- (void)screenshotsViewEditModeDidChange:(id)a3;
- (void)sessionDidSubmitFeedback:(id)a3;
- (void)setAaModeEnabled:(BOOL)a3;
- (void)setAnalysisModeEnabled:(BOOL)a3;
- (void)setAnnotationModeEnabled:(BOOL)a3;
- (void)setBorderViewStyleOverride:(int64_t)a3 withAnimator:(id)a4;
- (void)setContentSwitcherAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setInStateTransition:(BOOL)a3;
- (void)setInitialAnnotationMode:(BOOL)a3;
- (void)setScreenshotsUseTrilinearMinificationFilter:(BOOL)a3;
- (void)setShowsShadow:(BOOL)a3 animated:(BOOL)a4;
- (void)setSnapshotScreenshotEdits:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)stateTransitionFinished;
- (void)updateAnalysisButtonStateToVisible:(BOOL)a3;
- (void)updateAnnotationButtonForCurrentState;
- (void)updateForFrame:(CGRect)a3;
- (void)updateForScreenshotViewChangeAnimated:(BOOL)a3 oldView:(id)a4;
- (void)updateScreenshotsInteractionModeIfNecessary;
- (void)updateScreenshotsInteractionModeToMode:(unint64_t)a3;
- (void)viButtonPressed:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SSSScreenshotsViewController

- (SSSScreenshotsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)SSSScreenshotsViewController;
  v8 = [(SSSScreenshotsViewController *)&v24 initWithNibName:v6 bundle:v7];
  v8->_contentSwitcherAlpha = 1.0;
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:v8 selector:"_screenshotManagerDidProcessMetadataUpdate:" name:@"SSSScreenshotManagerDidProcessMetadataUpdate" object:0];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:v8 selector:"_screenshotManagerDidProcessDocumentUpdate:" name:@"SSSScreenshotManagerDidProcessDocumentUpdate" object:0];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:v8 selector:"_undoManagerDidUndoRedoChange:" name:NSUndoManagerDidUndoChangeNotification object:0];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:v8 selector:"_undoManagerDidUndoRedoChange:" name:NSUndoManagerDidRedoChangeNotification object:0];

  v13 = +[NSNotificationCenter defaultCenter];
  [v13 addObserver:v8 selector:"_handlePencilSqueezeInteractionWillShowPaletteViewNotification:" name:PKPencilSqueezeInteractionWillShowPaletteViewNotification object:0];

  v14 = objc_alloc_init(SSSDisplayLinkObserver);
  displayLinkObserver = v8->_displayLinkObserver;
  v8->_displayLinkObserver = v14;

  v16 = +[UITraitCollection systemTraitsAffectingColorAppearance];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  v17 = +[NSArray arrayWithObjects:v25 count:3];
  v18 = [v16 arrayByAddingObjectsFromArray:v17];

  objc_initWeak(&location, v8);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000422F8;
  v21[3] = &unk_10009A9D8;
  objc_copyWeak(&v22, &location);
  id v19 = [(SSSScreenshotsViewController *)v8 registerForTraitChanges:v18 withHandler:v21];
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v8;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"SSSScreenshotManagerDidProcessMetadataUpdate" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"SSSScreenshotManagerDidProcessDocumentUpdate" object:0];

  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:NSUndoManagerDidUndoChangeNotification object:0];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:NSUndoManagerDidRedoChangeNotification object:0];

  if (self->_presentationControllerDismissalObserver)
  {
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self->_presentationControllerDismissalObserver name:UIPresentationControllerDismissalTransitionDidEndNotification object:0];
  }
  v8.receiver = self;
  v8.super_class = (Class)SSSScreenshotsViewController;
  [(SSSScreenshotsViewController *)&v8 dealloc];
}

- (void)parentScreenshotView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  id v6 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v6 parentScreenshotView:v10 animated:v4];

  id v7 = [v10 _internalPDFView];

  if (v7)
  {
    objc_super v8 = +[NSNotificationCenter defaultCenter];
    v9 = [v10 _internalPDFView];
    [v8 addObserver:self selector:"_pdfPageChanged:" name:PDFViewPageChangedNotification object:v9];
  }
  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:v4];
}

- (void)removeScreenshots:(id)a3 forReason:(unint64_t)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (a4)
  {
    v13 = &__NSArray0__struct;
  }
  else
  {
    v14 = [(SSSScreenshotsViewController *)self _screenshotsView];
    v13 = [v14 viewsForScreenshots:v10];
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v46;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        [v20 setIsBeingRemoved:1];
        [v20 updatePaletteVisibilityIfNecessary:0];
      }
      id v17 = [v15 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v17);
  }

  v21 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v21 layoutIfNeeded];

  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1000429DC;
  v41[3] = &unk_10009AA00;
  v41[4] = self;
  id v22 = v10;
  id v42 = v22;
  unint64_t v44 = a4;
  id v23 = v11;
  id v43 = v23;
  objc_super v24 = objc_retainBlock(v41);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100042B18;
  v38[3] = &unk_10009A0B8;
  v38[4] = self;
  id v25 = v15;
  id v39 = v25;
  id v26 = v12;
  id v40 = v26;
  v27 = objc_retainBlock(v38);
  id v28 = [objc_alloc((Class)UICubicTimingParameters) initWithControlPoint1:0.289999992 controlPoint2:0.0133330002 0.816670001 0.493330002];
  id v29 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v28 timingParameters:0.21];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100042C44;
  v37[3] = &unk_100099AE0;
  v37[4] = self;
  v37[5] = a4;
  [v29 addAnimations:v37];
  [v29 startAnimation];
  if (!a4)
  {
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100042CD8;
    v35[3] = &unk_10009A158;
    v30 = (id *)&v36;
    v36 = v24;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100042CE8;
    v33[3] = &unk_10009A1D0;
    v34 = v27;
    +[UIView performSystemAnimation:0 onViews:v25 options:4 animations:v35 completion:v33];

    goto LABEL_15;
  }
  if (a4 == 1)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100042CF8;
    v31[3] = &unk_10009A1D0;
    v30 = (id *)&v32;
    v32 = v27;
    +[UIView _animateUsingDefaultTimingWithOptions:4 animations:v24 completion:v31];
LABEL_15:
  }
}

- (NSArray)dragItems
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  v3 = [v2 dragItems];

  return (NSArray *)v3;
}

- (id)previewForDragItem:(id)a3 inContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(SSSScreenshotsViewController *)self _screenshotsView];
  v9 = [v8 previewForDragItem:v7 inContainer:v6];

  return v9;
}

- (id)targetForCancellingDragItem:(id)a3 inContainer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [(SSSScreenshotsViewController *)self _screenshotsView];
  v9 = [v8 targetForCancellingDragItem:v7 inContainer:v6];

  return v9;
}

- (NSArray)visibleScreenshots
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  v3 = [v2 visibleScreenshots];

  return (NSArray *)v3;
}

- (SSSScreenshot)currentScreenshot
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  v3 = [v2 currentScreenshot];

  return (SSSScreenshot *)v3;
}

- (void)loadView
{
  v3 = objc_alloc_init(SSSScreenshotsView);
  [(SSSScreenshotsView *)v3 setDelegate:self];
  [(SSSScreenshotsViewController *)self setView:v3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v7 updateForFrame:x, y, width, height];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SSSScreenshotsViewController;
  [(SSSScreenshotsViewController *)&v8 viewDidLoad];
  v3 = [(SSSScreenshotsViewController *)self imageAnalyzer];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)VKCImageAnalyzer);
    [(SSSScreenshotsViewController *)self setImageAnalyzer:v4];

    v5 = [(SSSScreenshotsViewController *)self imageAnalyzer];
    [v5 setCreateFeedbackProviders:1];
  }
  id v6 = [(SSSScreenshotsViewController *)self imageAnalyzer];
  id v7 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v7 setImageAnalyzer:v6];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SSSScreenshotsViewController;
  [(SSSScreenshotsViewController *)&v11 viewDidAppear:a3];
  id v4 = [(SSSScreenshotsViewController *)self view];
  v5 = [v4 window];
  id v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  [(SSSScreenshotsViewController *)self becomeFirstResponder];
  id v7 = [(SSSScreenshotsViewController *)self view];
  objc_super v8 = [v7 window];
  v9 = [v8 windowScene];
  id v10 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v9];

  [v10 set_delegate:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SSSScreenshotsViewController;
  [(SSSScreenshotsViewController *)&v5 viewWillDisappear:a3];
  [(SSSScreenshotsViewController *)self resignFirstResponder];
  id v4 = [(SSSScreenshotsViewController *)self presentedViewController];

  if (v4) {
    [(SSSScreenshotsViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned __int8 v4 = [v3 isPerformingFullscreenSetup];

  if (v4) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)SSSScreenshotsViewController;
  return [(SSSScreenshotsViewController *)&v6 canResignFirstResponder];
}

- (void)_presentUndoRedoAlertControllerIfNecessary
{
  v3 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  unsigned int v4 = [v3 canUndo];
  unsigned int v5 = [v3 canRedo];
  unsigned int v6 = v5;
  if ((v4 & 1) != 0 || v5)
  {
    id v7 = [(UIBarButtonItem *)self->_undoItem title];
    uint64_t v8 = [(UIBarButtonItem *)self->_redoItem title];
    v9 = (void *)v8;
    if (v4) {
      id v10 = v7;
    }
    else {
      id v10 = (void *)v8;
    }
    id v11 = v10;
    id v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"CANCEL_SHAKE_TO_UNDO" value:@"Cancel" table:0];

    objc_initWeak(location, self);
    v14 = +[UIAlertController alertControllerWithTitle:0 message:v11 preferredStyle:1];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000435B8;
    v22[3] = &unk_10009AA28;
    objc_copyWeak(&v23, location);
    id v15 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v22];
    [v14 addAction:v15];

    if (v4)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_1000435F8;
      v20[3] = &unk_10009AA28;
      objc_copyWeak(&v21, location);
      id v16 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v20];
      [v14 addAction:v16];

      objc_destroyWeak(&v21);
    }
    if (v6)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100043658;
      v18[3] = &unk_10009AA28;
      objc_copyWeak(&v19, location);
      id v17 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v18];
      [v14 addAction:v17];

      objc_destroyWeak(&v19);
    }
    [(SSSScreenshotsViewController *)self presentViewController:v14 animated:1 completion:0];
    objc_destroyWeak(&v23);

    objc_destroyWeak(location);
  }
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    id v7 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
    unsigned __int8 v8 = [v7 canUndo];
    unsigned int v9 = [v7 canRedo];
    if ((v8 & 1) != 0 || v9)
    {
      id v10 = [(SSSScreenshotsViewController *)self _screenshotsView];
      [v10 dismissOverlayManagedViewControllers];

      [(SSSScreenshotsViewController *)self _presentUndoRedoAlertControllerIfNecessary];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SSSScreenshotsViewController;
    if ([(SSSScreenshotsViewController *)&v12 respondsToSelector:"motionEnded:withEvent:"])
    {
      v11.receiver = self;
      v11.super_class = (Class)SSSScreenshotsViewController;
      [(SSSScreenshotsViewController *)&v11 motionEnded:a3 withEvent:v6];
    }
  }
}

- (BOOL)_pencilSqueezeInteractionCanShowPaletteView:(id)a3
{
  return ![(SSSScreenshotsViewController *)self isShowingModalUI];
}

- (void)setContentSwitcherAlpha:(double)a3
{
  self->_contentSwitcherAlpha = a3;
  -[UIView setAlpha:](self->_contentSwitcherView, "setAlpha:");
}

- (void)_configureBarsIfNecessary
{
  if (!self->_hasConfiguredBarButtonItems)
  {
    self->_hasConfiguredBarButtonItems = 1;
    [(SSSScreenshotsViewController *)self _configureBarButtonItems];
  }
  if (!self->_hasAddedNavigationItemToTopBar)
  {
    v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
    id v4 = [v3 topBar];

    if (v4)
    {
      self->_hasAddedNavigationItemToTopBar = 1;
      [v4 setAlpha:0.0];
      [v4 pushNavigationItem:self->_managedNavigationItem animated:0];
      [v4 setAlpha:1.0];
      [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
    }
  }
}

- (void)_configureBarButtonItems
{
  v3 = (UINavigationItem *)objc_alloc_init((Class)UINavigationItem);
  managedNavigationItem = self->_managedNavigationItem;
  self->_managedNavigationItem = v3;

  +[UIBarButtonItem _sss_shareItemWithTarget:action:](UIBarButtonItem, "_sss_shareItemWithTarget:action:", self);
  unsigned int v5 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  shareItem = self->_shareItem;
  self->_shareItem = v5;

  id v7 = +[NSBundle mainBundle];
  unsigned __int8 v8 = [v7 localizedStringForKey:@"SHARE" value:@"Share" table:0];
  [(UIBarButtonItem *)self->_shareItem setTitle:v8];

  id v9 = objc_alloc((Class)UIBarButtonItem);
  id v10 = [(SSSScreenshotsViewController *)self _buildDoneMenu];
  objc_super v11 = (UIBarButtonItem *)[v9 initWithBarButtonSystemItem:0 menu:v10];
  doneItem = self->_doneItem;
  self->_doneItem = v11;

  +[UIBarButtonItem _sss_undoItemWithTarget:action:](UIBarButtonItem, "_sss_undoItemWithTarget:action:", self);
  v13 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  undoItem = self->_undoItem;
  self->_undoItem = v13;

  id v15 = +[NSBundle mainBundle];
  id v16 = [v15 localizedStringForKey:@"UNDO" value:@"Undo" table:0];
  [(UIBarButtonItem *)self->_undoItem setTitle:v16];

  objc_initWeak(&location, self);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1000442E8;
  v78[3] = &unk_10009AA50;
  objc_copyWeak(&v79, &location);
  [(UIBarButtonItem *)self->_undoItem _setSecondaryActionsProvider:v78];
  +[UIBarButtonItem _sss_redoItemWithTarget:action:](UIBarButtonItem, "_sss_redoItemWithTarget:action:", self);
  id v17 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  redoItem = self->_redoItem;
  self->_redoItem = v17;

  id v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"REDO" value:@"Redo" table:0];
  [(UIBarButtonItem *)self->_redoItem setTitle:v20];

  id v21 = +[UIBarButtonItem _sss_trashItemWithTarget:self action:"_deletePushed"];
  deleteItem = self->_deleteItem;
  self->_deleteItem = v21;

  id v23 = +[NSBundle mainBundle];
  objc_super v24 = [v23 localizedStringForKey:@"DELETE" value:@"Delete" table:0];
  [(UIBarButtonItem *)self->_deleteItem setTitle:v24];

  id v25 = (SSVellumOpacityControl *)objc_alloc_init((Class)SSVellumOpacityControl);
  opacityControl = self->_opacityControl;
  self->_opacityControl = v25;

  v27 = self->_opacityControl;
  +[SSVellumOpacityControl preferredWidth];
  double v29 = v28;
  [(SSVellumOpacityControl *)self->_opacityControl intrinsicContentSize];
  -[SSVellumOpacityControl setFrame:](v27, "setFrame:", 0.0, 0.0, v29, v30);
  [(SSVellumOpacityControl *)self->_opacityControl addTarget:self action:"_opacityControlChanged" forEvents:4096];
  [(SSVellumOpacityControl *)self->_opacityControl addTarget:self action:"_opacityControlLifted" forEvents:64];
  [(SSVellumOpacityControl *)self->_opacityControl addTarget:self action:"_opacityControlLifted" forEvents:128];
  v31 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_opacityControl];
  opacityItem = self->_opacityItem;
  self->_opacityItem = v31;

  v33 = +[UIBarButtonItem _sss_cropItemWithTarget:self action:"_enterCrop"];
  cropItem = self->_cropItem;
  self->_cropItem = v33;

  v35 = +[NSBundle mainBundle];
  v36 = [v35 localizedStringForKey:@"CROP" value:@"Crop" table:0];
  [(UIBarButtonItem *)self->_cropItem setTitle:v36];

  id v37 = objc_alloc((Class)UIBarButtonItem);
  v38 = +[NSBundle mainBundle];
  id v39 = [v38 localizedStringForKey:@"RESET" value:@"Reset" table:0];
  id v40 = (UIBarButtonItem *)[v37 initWithTitle:v39 style:0 target:self action:"_resetCrop"];
  resetCropItem = self->_resetCropItem;
  self->_resetCropItem = v40;

  id v42 = objc_alloc((Class)UIBarButtonItem);
  id v43 = +[NSBundle mainBundle];
  unint64_t v44 = [v43 localizedStringForKey:@"CANCEL" value:@"Cancel" table:0];
  long long v45 = (UIBarButtonItem *)[v42 initWithTitle:v44 style:0 target:self action:"_cancelCrop"];
  cancelCropItem = self->_cancelCropItem;
  self->_cancelCropItem = v45;

  id v47 = objc_alloc((Class)UISegmentedControl);
  long long v48 = +[NSBundle mainBundle];
  v49 = [v48 localizedStringForKey:@"SCREEN" value:@"Screen" table:0];
  v81[0] = v49;
  v50 = +[NSBundle mainBundle];
  v51 = [v50 localizedStringForKey:@"FULL_PAGE" value:@"Full Page" table:0];
  v81[1] = v51;
  v52 = +[NSArray arrayWithObjects:v81 count:2];
  v53 = (UISegmentedControl *)[v47 initWithItems:v52];
  contentSwitcher = self->_contentSwitcher;
  self->_contentSwitcher = v53;

  [(UISegmentedControl *)self->_contentSwitcher addTarget:self action:"_selectScreenshotOrFull:" forControlEvents:4096];
  [(UISegmentedControl *)self->_contentSwitcher setSelectedSegmentIndex:0];
  [(UISegmentedControl *)self->_contentSwitcher setOverrideUserInterfaceStyle:2];
  v55 = (UIView *)objc_alloc_init((Class)UIView);
  contentSwitcherView = self->_contentSwitcherView;
  self->_contentSwitcherView = v55;

  [(UIView *)self->_contentSwitcherView addSubview:self->_contentSwitcher];
  [(UIView *)self->_contentSwitcherView setAlpha:self->_contentSwitcherAlpha];
  v57 = (VKSelectableBarButtonItem *)objc_alloc_init((Class)VKSelectableBarButtonItem);
  annotationEnabledButton = self->_annotationEnabledButton;
  self->_annotationEnabledButton = v57;

  v59 = [(SSSScreenshotsViewController *)self traitCollection];
  if ([v59 horizontalSizeClass] == (id)1)
  {
    v60 = [(SSSScreenshotsViewController *)self traitCollection];
    BOOL v61 = [v60 verticalSizeClass] == (id)1;
  }
  else
  {
    BOOL v61 = 0;
  }

  v62 = +[UIImage systemImageNamed:@"pencil.tip.crop.circle"];
  if (v61) {
    uint64_t v63 = 2;
  }
  else {
    uint64_t v63 = 3;
  }
  v64 = +[UIImageSymbolConfiguration configurationWithTextStyle:scale:](UIImageSymbolConfiguration, "configurationWithTextStyle:scale:", UIFontTextStyleBody, v63, 112);
  v65 = [v62 imageWithSymbolConfiguration:v64];
  [(VKSelectableBarButtonItem *)self->_annotationEnabledButton setImage:v65];

  [(VKSelectableBarButtonItem *)self->_annotationEnabledButton setTarget:self];
  [(VKSelectableBarButtonItem *)self->_annotationEnabledButton setAction:"annotationButtonPressed:"];
  v66 = (UIBarButtonItem *)objc_alloc_init((Class)UIBarButtonItem);
  visualSearchBarButtonItem = self->_visualSearchBarButtonItem;
  self->_visualSearchBarButtonItem = v66;

  v68 = +[UIImage _systemImageNamed:@"info.circle.and.sparkles"];
  [(UIBarButtonItem *)self->_visualSearchBarButtonItem setImage:v68];

  [(UIBarButtonItem *)self->_visualSearchBarButtonItem setTarget:self];
  [(UIBarButtonItem *)self->_visualSearchBarButtonItem setAction:"viButtonPressed:"];
  v69 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v69 setShareItemTarget:self];

  v70 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v70 setShareItemAction:"_sharePushed:"];

  v71 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v71 setUndoItemTarget:self];

  v72 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v72 setUndoItemAction:"_undoPushed"];

  v73 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v73 setRedoItemTarget:self];

  v74 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v74 setRedoItemAction:"_redoPushed"];

  [(UIBarButtonItem *)self->_shareItem setAccessibilityIdentifier:@"share-button"];
  [(UIBarButtonItem *)self->_doneItem setAccessibilityIdentifier:@"done-button"];
  [(UIBarButtonItem *)self->_undoItem setAccessibilityIdentifier:@"undo-button"];
  [(UIBarButtonItem *)self->_redoItem setAccessibilityIdentifier:@"redo-button"];
  [(UIBarButtonItem *)self->_deleteItem setAccessibilityIdentifier:@"delete-button"];
  [(UIBarButtonItem *)self->_cropItem setAccessibilityIdentifier:@"content-toggle-crop"];
  [*(id *)((char *)&self->super.super.super.isa + v77) setAccessibilityIdentifier:@"content-reset-crop"];
  [(UIBarButtonItem *)self->_cancelCropItem setAccessibilityIdentifier:@"content-cancel-crop"];
  [(UISegmentedControl *)self->_contentSwitcher setAccessibilityIdentifier:@"content-switcher-control"];
  if (_SSEnableContinuousScreenCaptureForBugFiling()
    && +[SSSRecapViewController recapAvailable])
  {
    v75 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:15 target:self action:"_recapPushed"];
    recapItem = self->_recapItem;
    self->_recapItem = v75;

    [(UIBarButtonItem *)self->_recapItem setAccessibilityIdentifier:@"recap-button"];
  }
  [(SSSScreenshotsViewController *)self _updateUndoRedoEnabledState];
  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
  objc_destroyWeak(&v79);
  objc_destroyWeak(&location);
}

- (id)_accessibilityHUDWindow
{
  v2 = [(SSSScreenshotsViewController *)self view];
  v3 = [v2 window];

  return v3;
}

- (void)_updateBarButtonItemPositionsAnimated:(BOOL)a3
{
  if (!self->_hasConfiguredBarButtonItems) {
    return;
  }
  BOOL v61 = a3;
  id v4 = +[NSMutableArray array];
  v64 = +[NSMutableArray array];
  +[SSChromeHelper defaultBarButtonSpacing];
  v62 = +[SSChromeHelper createFixedSpaceBarButtonItemWithWidth:](SSChromeHelper, "createFixedSpaceBarButtonItemWithWidth:");
  unsigned int v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  id v6 = [v5 editMode];

  id v7 = [(SSSScreenshotsViewController *)self _screenshotsView];
  uint64_t v63 = [v7 currentLiveTextBarButtonItemIfExists];

  BOOL shouldShowSharrow = self->_shouldShowSharrow;
  recapItem = self->_recapItem;
  unsigned __int8 v9 = +[VKCImageAnalyzer supportedAnalysisTypes];
  +[SSChromeHelper defaultBarButtonSpacing];
  double v11 = v10;
  objc_super v12 = [(SSSScreenshotsViewController *)self traitCollection];
  uint64_t v13 = (uint64_t)[v12 userInterfaceIdiom];

  if (v13 == 1)
  {
    unsigned __int8 v59 = v9;
    [(UIBarButtonItem *)self->_opacityItem _setFlexible:0];
    v14 = [(SSSScreenshotsViewController *)self view];
    +[SSChromeHelper widthForOpacityControlInView:v14 withContentSwitcher:self->_contentSwitcher];
    double v16 = v15;

    opacityControl = self->_opacityControl;
    [(SSVellumOpacityControl *)opacityControl intrinsicContentSize];
    -[SSVellumOpacityControl setFrame:](opacityControl, "setFrame:", 0.0, 0.0, v16, v18);
    [v4 addObject:self->_doneItem];
    id v19 = +[UIBarButtonItem fixedSpaceItemOfWidth:v11];
    [v4 addObject:v19];

    uint64_t v13 = 1;
    [v4 addObject:self->_opacityItem];
    if (v6 != (id)2)
    {
      if (shouldShowSharrow)
      {
        shareItem = self->_shareItem;
        v20 = +[NSArray arrayWithObjects:&shareItem count:1];
        [v64 addObjectsFromArray:v20];
      }
      deleteItem = self->_deleteItem;
      id v21 = +[NSArray arrayWithObjects:&deleteItem count:1];
      [v64 addObjectsFromArray:v21];

      if (recapItem)
      {
        id v22 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:6 target:0 action:0];
        [v22 setWidth:31.0];
        [v64 addObject:v22];

        [v64 addObject:self->_recapItem];
      }
      [v64 addObject:self->_annotationEnabledButton];
      if (v63 && (v59 & 1) != 0) {
        [v64 addObject:v63];
      }
      if ((v59 & 0x30) != 0) {
        [v64 addObject:self->_visualSearchBarButtonItem];
      }
      [v64 addObject:v62];
    }
  }
  else
  {
    [v4 addObject:self->_doneItem];
    if (v6 != (id)2)
    {
      if (shouldShowSharrow)
      {
        v69 = self->_shareItem;
        id v23 = +[NSArray arrayWithObjects:&v69 count:1];
        [v64 addObjectsFromArray:v23];
      }
      v68 = self->_deleteItem;
      objc_super v24 = +[NSArray arrayWithObjects:&v68 count:1];
      [v64 addObjectsFromArray:v24];

      if (recapItem)
      {
        v67 = self->_recapItem;
        id v25 = +[NSArray arrayWithObjects:&v67 count:1];
        [v64 addObjectsFromArray:v25];
      }
      if (!v6)
      {
        annotationEnabledButton = self->_annotationEnabledButton;
        id v26 = +[NSArray arrayWithObjects:&annotationEnabledButton count:1];
        [v64 addObjectsFromArray:v26];
      }
      undoItem = self->_undoItem;
      v65[0] = self->_redoItem;
      v65[1] = undoItem;
      double v28 = +[NSArray arrayWithObjects:v65 count:2];
      [v64 addObjectsFromArray:v28];
    }
  }
  double v29 = [(SSSScreenshotsViewController *)self _screenshotsView];
  double v30 = [v29 topBar];

  [(UIView *)self->_contentSwitcherView setHidden:[(SSSScreenshotsViewController *)self _layoutShouldShowContentSwitcher] ^ 1];
  [(UIView *)self->_contentSwitcherView setUserInteractionEnabled:[(SSSScreenshotsViewController *)self _layoutShouldEnableContentSwitcher]];
  if (![(SSSScreenshotsViewController *)self _layoutShouldShowContentSwitcher])
  {
    id v37 = [(SSSScreenshotsViewController *)self _screenshotsView];
    id v38 = [v37 editMode];

    if (v38)
    {
      id v39 = [(SSSScreenshotsViewController *)self _screenshotsView];
      [v39 setEditMode:0];

      id v38 = 0;
    }
    id v40 = 0;
    v31 = v64;
    goto LABEL_39;
  }
  v31 = v64;
  if ((id)[(UISegmentedControl *)self->_contentSwitcher selectedSegmentIndex] == (id)1)
  {
    if (v13 == 1)
    {
      +[SSChromeHelper defaultBarButtonSpacing];
      v32 = +[SSChromeHelper createFixedSpaceBarButtonItemWithWidth:](SSChromeHelper, "createFixedSpaceBarButtonItemWithWidth:");
      [v4 addObject:v32];
    }
    if ([(SSSScreenshotsViewController *)self _cropPDFEnabled])
    {
      v33 = [(SSSScreenshotsViewController *)self _screenshotsView];
      id v34 = [v33 editMode];

      if (v34 == (id)2)
      {
        [v64 addObject:self->_cancelCropItem];
        [v64 addObject:self->_resetCropItem];
        resetCropItem = self->_resetCropItem;
        v36 = [(SSSScreenshotsViewController *)self _screenshotsView];
        -[UIBarButtonItem setEnabled:](resetCropItem, "setEnabled:", [v36 isCropped]);
      }
      else
      {
        [v4 addObject:self->_cropItem];
      }
    }
  }
  +[SSChromeHelper contentSwitcherPadding];
  if (v6 == (id)2)
  {
    id v38 = 0;
  }
  else
  {
    double v42 = v41;
    if (![(SSSScreenshotsViewController *)self _contentSwitcherShouldMoveDown])
    {
      contentSwitcher = self->_contentSwitcher;
      v49 = [(SSSScreenshotsViewController *)self view];
      +[SSChromeHelper widthForContentSwitcher:contentSwitcher forView:v49];
      double v51 = v50;

      [(UISegmentedControl *)self->_contentSwitcher setWidth:0 forSegmentAtIndex:v51];
      [(UISegmentedControl *)self->_contentSwitcher setWidth:1 forSegmentAtIndex:v51];
      [(UISegmentedControl *)self->_contentSwitcher bounds];
      double v53 = v52;
      double v55 = v54 + v42 * 2.0;
      -[UIView setFrame:](self->_contentSwitcherView, "setFrame:");
      -[UISegmentedControl setFrame:](self->_contentSwitcher, "setFrame:", v42, 0.0, v55, v53);
      id v40 = self->_contentSwitcherView;
      id v38 = 0;
      goto LABEL_39;
    }
    id v38 = [objc_alloc((Class)_UINavigationBarPalette) initWithContentView:self->_contentSwitcherView];
    [v38 setPreferredHeight:38.0];
    contentSwitcherView = self->_contentSwitcherView;
    unint64_t v44 = [(SSSScreenshotsViewController *)self view];
    [v44 frame];
    -[UIView setFrame:](contentSwitcherView, "setFrame:", 0.0, 0.0);

    long long v45 = self->_contentSwitcher;
    long long v46 = [(SSSScreenshotsViewController *)self view];
    [v46 frame];
    -[UISegmentedControl setFrame:](v45, "setFrame:", v42, 4.0, v47 + v42 * -2.0, 30.0);
  }
  id v40 = 0;
LABEL_39:
  [(UINavigationItem *)self->_managedNavigationItem setLeftBarButtonItems:v4 animated:v61];
  [(UINavigationItem *)self->_managedNavigationItem setRightBarButtonItems:v31 animated:v61];
  [(UINavigationItem *)self->_managedNavigationItem setTitleView:v40];
  [(UINavigationItem *)self->_managedNavigationItem _setBottomPalette:v38];
  v56 = [v30 topItem];
  managedNavigationItem = self->_managedNavigationItem;

  if (v56 != managedNavigationItem)
  {
    id v58 = [v30 popNavigationItemAnimated:0];
    [v30 pushNavigationItem:self->_managedNavigationItem animated:0];
  }
}

- (BOOL)_layoutShouldShowContentSwitcher
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned __int8 v3 = [v2 _layoutShouldShowContentSwitcher];

  return v3;
}

- (BOOL)_layoutShouldEnableContentSwitcher
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned __int8 v3 = [v2 _layoutShouldEnableContentSwitcher];

  return v3;
}

- (BOOL)_contentSwitcherShouldMoveDown
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned __int8 v3 = [v2 _contentSwitcherShouldMoveDown];

  return v3;
}

- (void)_presentActivityViewControllerFromBarButtonItem:(id)a3
{
  activityViewController = self->_activityViewController;
  id v5 = a3;
  [(SSSScreenshotsViewController *)self presentViewController:activityViewController animated:1 completion:0];
  id v6 = [(SSSActivityViewController *)self->_activityViewController popoverPresentationController];
  [v6 setBarButtonItem:v5];

  [v6 _setIgnoreBarButtonItemSiblings:1];
}

- (void)_actuallyPresentShareFromBarButtonItem:(id)a3
{
  id v4 = a3;
  [(SSSScreenshotsViewController *)self _updateActivityViewController];
  [(SSSScreenshotsViewController *)self _presentActivityViewControllerFromBarButtonItem:v4];

  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
  id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v5 setIsSharing:1];
}

- (void)_sharePushed:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSScreenshotsViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SSSScreenshotsViewController *)self delegate];
    unsigned __int8 v8 = [v7 screenshotsViewControllerShouldAllowSharing:self];

    if ((v8 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    unsigned __int8 v9 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Sharing was attempted but is not allowed because device is locked", buf, 2u);
    }
  }
  [(SSSScreenshotsViewController *)self becomeFirstResponder];
  double v10 = [(SSSScreenshotsViewController *)self delegate];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100044F08;
  v11[3] = &unk_10009AA78;
  v11[4] = self;
  id v12 = v4;
  [v10 screenshotsViewController:self requestsPresentingActivityViewControllerWithBlock:v11];

LABEL_8:
}

- (void)annotationButtonPressed:(id)a3
{
  [(SSSScreenshotsViewController *)self setAnnotationModeEnabled:[(SSSScreenshotsViewController *)self annotationModeEnabled] ^ 1];
  BOOL v4 = [(SSSScreenshotsViewController *)self annotationModeEnabled];

  __SSSetAnnotationModePreference(v4);
}

- (void)_handlePencilSqueezeInteractionWillShowPaletteViewNotification:(id)a3
{
  BOOL v4 = os_log_create("com.apple.screenshotservices", "Screenshot");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [(SSSScreenshotsViewController *)self annotationModeEnabled];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "will show squeeze palette view, annotationModeEnabled: %{BOOL}d", (uint8_t *)v6, 8u);
  }

  if (![(SSSScreenshotsViewController *)self annotationModeEnabled])
  {
    [(SSSScreenshotsViewController *)self setAnnotationModeEnabled:1];
    id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
    [v5 setNeedsLayout];
  }
}

- (BOOL)isShowingDoneActionSheet
{
  v2 = [(SSSScreenshotsViewController *)self presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_buildDoneMenu
{
  objc_initWeak(&location, self);
  char v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  unsigned __int8 v8 = sub_100045358;
  unsigned __int8 v9 = &unk_10009AAC8;
  objc_copyWeak(&v10, &location);
  v2 = +[UIDeferredMenuElement elementWithUncachedProvider:&v6];
  id v12 = v2;
  unsigned __int8 v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1, v6, v7, v8, v9);
  BOOL v4 = +[UIMenu menuWithChildren:v3];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v4;
}

- (id)_buildDoneMenuElements
{
  v72 = +[NSMutableArray array];
  objc_initWeak(location, self);
  unsigned __int8 v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  id v4 = [v3 editMode];

  id v5 = +[NSBundle mainBundle];
  char v6 = [v5 localizedStringForKey:@"SAVE_TO_PHOTOS" value:@"Save to Photos" table:0];
  uint64_t v7 = +[UIImage systemImageNamed:@"square.and.arrow.down"];
  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472;
  v96[2] = sub_100046440;
  v96[3] = &unk_10009AAF0;
  objc_copyWeak(&v97, location);
  BOOL v98 = v4 == 0;
  uint64_t v63 = +[UIAction actionWithTitle:v6 image:v7 identifier:0 handler:v96];

  v71 = +[UIImage systemImageNamed:@"folder"];
  unsigned __int8 v8 = +[NSBundle mainBundle];
  v69 = [v8 localizedStringForKey:@"SAVE_TO_FILES" value:@"Save to Files" table:0];

  unsigned __int8 v9 = +[NSBundle mainBundle];
  v68 = [v9 localizedStringForKey:@"SAVE_PDF_TO_FILES" value:@"Save PDF to Files" table:0];

  id v10 = v69;
  if (v4) {
    id v10 = v68;
  }
  id v67 = v10;
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_1000464F0;
  v93[3] = &unk_10009AAF0;
  objc_copyWeak(&v94, location);
  BOOL v95 = v4 == 0;
  BOOL v61 = +[UIAction actionWithTitle:v67 image:v71 identifier:0 handler:v93];
  v62 = +[UIImage _systemImageNamed:@"quicknote"];
  if (_SSScreenshotsInQuickNoteEnabled())
  {
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x2020000000;
    double v11 = (uint64_t (*)(void))off_1000B5838;
    v104 = off_1000B5838;
    if (!off_1000B5838)
    {
      location[1] = _NSConcreteStackBlock;
      id location[2] = (id)3221225472;
      location[3] = sub_10004C104;
      location[4] = &unk_100099928;
      v100 = &v101;
      id v12 = (void *)sub_10004C154();
      uint64_t v13 = dlsym(v12, "SYIsQuickNoteAvailable");
      *(void *)(v100[1] + 24) = v13;
      off_1000B5838 = *(_UNKNOWN **)(v100[1] + 24);
      double v11 = (uint64_t (*)(void))v102[3];
    }
    _Block_object_dispose(&v101, 8);
    if (!v11)
    {
      dlerror();
      abort_report_np();
      __break(1u);
    }
    int v14 = v11();
    int v15 = v14;
    if (v4) {
      int v16 = 0;
    }
    else {
      int v16 = v14;
    }
    if (v16 == 1)
    {
      id v17 = +[NSBundle mainBundle];
      double v18 = [v17 localizedStringForKey:@"SAVE_TO_QUICK_NOTE" value:@"Save to Quick Note" table:0];

      v91[0] = _NSConcreteStackBlock;
      v91[1] = 3221225472;
      v91[2] = sub_100046588;
      v91[3] = &unk_10009AB18;
      objc_copyWeak(&v92, location);
      v70 = +[UIAction actionWithTitle:v18 image:v62 identifier:0 handler:v91];
      objc_destroyWeak(&v92);

      int v15 = 1;
      goto LABEL_14;
    }
  }
  else
  {
    int v15 = 0;
  }
  v70 = 0;
LABEL_14:
  id v19 = +[NSBundle mainBundle];
  v66 = [v19 localizedStringForKey:@"SAVE_TO_PHOTOS_AND_FILES" value:@"Save All to Photos and Files" table:0];

  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_100046608;
  v89[3] = &unk_10009AB18;
  objc_copyWeak(&v90, location);
  id v58 = +[UIAction actionWithTitle:v66 image:v71 identifier:0 handler:v89];
  if (v15)
  {
    v20 = +[NSBundle mainBundle];
    id v21 = [v20 localizedStringForKey:@"SAVE_ALL_TO_A_QUICK_NOTE_AND_FILES" value:@"Save All to a Quick Note and Files" table:0];

    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_100046688;
    v87[3] = &unk_10009AB18;
    objc_copyWeak(&v88, location);
    v57 = +[UIAction actionWithTitle:v21 image:v62 identifier:0 handler:v87];
    objc_destroyWeak(&v88);
  }
  else
  {
    v57 = 0;
  }
  id v22 = +[NSBundle mainBundle];
  v65 = [v22 localizedStringForKey:@"SAVE_ALL_TO_FILES" value:@"Save All to Files" table:0];

  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_100046708;
  v85[3] = &unk_10009AB18;
  objc_copyWeak(&v86, location);
  v56 = +[UIAction actionWithTitle:v65 image:v71 identifier:0 handler:v85];
  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_100046788;
  v83[3] = &unk_10009AB18;
  objc_copyWeak(&v84, location);
  unsigned __int8 v59 = +[UIAction actionWithTitle:@"Export Vellum PDF" image:0 identifier:0 handler:v83];
  id v23 = +[NSBundle mainBundle];
  objc_super v24 = [v23 localizedStringForKey:@"SHARE_BETA_FEEDBACK" value:@"Share Beta Feedback…" table:0];
  id v25 = +[UIImage systemImageNamed:@"exclamationmark.bubble"];
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  void v81[2] = sub_1000467C8;
  v81[3] = &unk_10009AB18;
  objc_copyWeak(&v82, location);
  v60 = +[UIAction actionWithTitle:v24 image:v25 identifier:0 handler:v81];

  if ([(SSSScreenshotsViewController *)self _shouldSendToDeveloper]) {
    [v72 addObject:v60];
  }
  id v26 = +[NSBundle mainBundle];
  v27 = [v26 localizedStringForKey:@"COPY_AND_DELETE_ACTION_TITLE" value:@"Copy and Delete" table:0];
  double v28 = +[UIImage _systemImageNamed:@"doc.on.trash"];
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_100046808;
  v79[3] = &unk_10009AB18;
  objc_copyWeak(&v80, location);
  double v29 = +[UIAction actionWithTitle:v27 image:v28 identifier:0 handler:v79];

  [v29 setAttributes:2];
  double v30 = +[NSBundle mainBundle];
  v31 = [v30 localizedStringForKey:@"DELETE_SCREENSHOTS_FORMAT" value:&stru_10009B8B0 table:0];
  v32 = [(SSSScreenshotsViewController *)self visibleScreenshots];
  v64 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v31, [v32 count]);

  v33 = +[UIImage systemImageNamed:@"trash"];
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472;
  v77[2] = sub_1000468A8;
  v77[3] = &unk_10009AB18;
  objc_copyWeak(&v78, location);
  id v34 = +[UIAction actionWithTitle:v64 image:v33 identifier:0 handler:v77];

  [v34 setAttributes:2];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v35 = [(SSSScreenshotsViewController *)self _screenshotsView];
  v36 = [v35 visibleScreenshots];

  id v37 = [v36 countByEnumeratingWithState:&v73 objects:v107 count:16];
  if (!v37)
  {

LABEL_31:
    [v72 addObject:v63];
    goto LABEL_32;
  }
  char v38 = 0;
  uint64_t v39 = *(void *)v74;
  do
  {
    for (i = 0; i != v37; i = (char *)i + 1)
    {
      if (*(void *)v74 != v39) {
        objc_enumerationMutation(v36);
      }
      v38 |= [*(id *)(*((void *)&v73 + 1) + 8 * i) lastViewEditMode] == (id)1;
    }
    id v37 = [v36 countByEnumeratingWithState:&v73 objects:v107 count:16];
  }
  while (v37);

  if ((v38 & 1) == 0) {
    goto LABEL_31;
  }
  double v41 = [(SSSScreenshotsViewController *)self _screenshotsView];
  double v42 = [v41 visibleScreenshots];
  BOOL v43 = (unint64_t)[v42 count] > 1;

  if (v43)
  {
    [v72 addObject:v58];
    [v72 addObject:v56];
    unint64_t v44 = v57;
    if (!v57) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  double v52 = [(SSSScreenshotsViewController *)self _screenshotsView];
  double v53 = [v52 visibleScreenshots];
  double v54 = [v53 firstObject];
  unsigned int v55 = [v54 pdfCanBeConvertedToImage];

  if (v55) {
    goto LABEL_31;
  }
LABEL_32:
  if (self->_shouldShowSharrow) {
    [v72 addObject:v61];
  }
  if (v70)
  {
    unint64_t v44 = v70;
    if (self->_shouldShowSharrow) {
LABEL_36:
    }
      [v72 addObject:v44];
  }
LABEL_37:
  if (self->_shouldShowSharrow && _SSEnableVellumExport()) {
    [v72 addObject:v59];
  }
  id v45 = [v72 copy];
  long long v46 = +[UIMenu menuWithTitle:&stru_10009B8B0 image:0 identifier:0 options:1 children:v45];
  v106[0] = v46;
  v105[0] = v29;
  v105[1] = v34;
  double v47 = +[NSArray arrayWithObjects:v105 count:2];
  long long v48 = +[UIMenu menuWithTitle:&stru_10009B8B0 image:0 identifier:0 options:1 children:v47];
  v106[1] = v48;
  v49 = +[NSArray arrayWithObjects:v106 count:2];
  double v50 = +[UIMenu menuWithTitle:&stru_10009B8B0 image:0 identifier:0 options:1 children:v49];

  objc_destroyWeak(&v78);
  objc_destroyWeak(&v80);

  objc_destroyWeak(&v82);
  objc_destroyWeak(&v84);

  objc_destroyWeak(&v86);
  objc_destroyWeak(&v90);

  objc_destroyWeak(&v94);
  objc_destroyWeak(&v97);
  objc_destroyWeak(location);

  return v50;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v3 setNeedsLayout];
}

- (void)_savePDFToPhotosPushed
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(SSSScreenshotsViewController *)self visibleScreenshots];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned __int8 v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 lastViewEditMode] == (id)1)
        {
          unsigned __int8 v9 = [v8 pdfAsImage];
          id v10 = v9;
          if (v9) {
            UIImageWriteToSavedPhotosAlbum(v9, self, "_image:didFinishSavingWithError:contextInfo:", 0);
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_image:(id)a3 didFinishSavingWithError:(id)a4 contextInfo:(void *)a5
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10005F7C0(v5, v6);
    }
  }
}

- (void)_saveToFilesPushed:(BOOL)a3 savePDF:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100046DB0;
  v26[3] = &unk_10009AB68;
  v26[4] = self;
  uint64_t v7 = objc_retainBlock(v26);
  unsigned __int8 v8 = +[NSMutableArray array];
  unsigned __int8 v9 = +[NSMutableArray array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [(SSSScreenshotsViewController *)self visibleScreenshots];
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        int v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v15 lastViewEditMode])
        {
          int v16 = [v15 temporaryPDFFile];
          if (v16) {
            [v9 addObject:v16];
          }
        }
        else
        {
          [v8 addObject:v15];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v12);
  }

  if (v5)
  {
    id v17 = +[SSSScreenshotManager sharedScreenshotManager];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100046F4C;
    v18[3] = &unk_10009AB90;
    BOOL v21 = v4;
    v20 = v7;
    id v19 = v9;
    [v17 saveScreenshotsToTemporaryLocation:v8 completion:v18];
  }
  else if (v4)
  {
    ((void (*)(void *, void *))v7[2])(v7, v9);
  }
}

- (void)_clearSecurityScopedResourcesAndTemporaryFiles
{
  [(NSMutableArray *)self->_securityScopedResourceURLs enumerateObjectsUsingBlock:&stru_10009ABD0];
  securityScopedResourceURLs = self->_securityScopedResourceURLs;
  self->_securityScopedResourceURLs = 0;

  [(NSMutableArray *)self->_temporaryURLs enumerateObjectsUsingBlock:&stru_10009ABF0];
  temporaryURLs = self->_temporaryURLs;
  self->_temporaryURLs = 0;
}

- (void)_dismissWithDeleteOptions:(unint64_t)a3
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100047334;
  v20[3] = &unk_10009AC40;
  void v20[4] = self;
  v20[5] = a3;
  BOOL v5 = objc_retainBlock(v20);
  uint64_t v6 = [(SSSScreenshotsViewController *)self traitCollection];
  uint64_t v7 = (id *)[v6 userInterfaceIdiom];

  quickNoteImages = self->_quickNoteImages;
  if (quickNoteImages) {
    id v9 = [(NSMutableArray *)quickNoteImages copy];
  }
  else {
    id v9 = &__NSArray0__struct;
  }
  id v10 = self->_quickNoteImages;
  self->_quickNoteImages = 0;

  if (v7)
  {
    objc_initWeak(&location, self);
    id v11 = [v9 count];
    if (v11)
    {
      id v12 = v14;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100047534;
      v14[3] = &unk_100099B08;
      uint64_t v7 = &v16;
      objc_copyWeak(&v16, &location);
      id v3 = &v15;
      id v15 = v9;
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v13 = objc_retainBlock(v12);
    ((void (*)(void *, void *))v5[2])(v5, v13);

    if (v11)
    {

      objc_destroyWeak(v7);
    }
    objc_destroyWeak(&location);
  }
  else if ([v9 count])
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100047520;
    v18[3] = &unk_10009A158;
    id v19 = v5;
    [(SSSScreenshotsViewController *)self _saveImages:v9 toQuickNoteWithDismissalCompletionBlock:v18];
  }
  else
  {
    ((void (*)(void *, void))v5[2])(v5, 0);
  }
}

- (void)_saveImages:(id)a3 toQuickNoteWithDismissalCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = [(SSSScreenshotsViewController *)self traitCollection];
  id v9 = [v8 userInterfaceIdiom];

  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v10 = (void *)qword_1000B5848;
  uint64_t v27 = qword_1000B5848;
  if (!qword_1000B5848)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004C2C8;
    v23[3] = &unk_100099928;
    v23[4] = &v24;
    sub_10004C2C8((uint64_t)v23);
    id v10 = (void *)v25[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v24, 8);
  id v12 = objc_alloc_init(v11);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000477F4;
  v21[3] = &unk_10009AC68;
  id v13 = v6;
  id v22 = v13;
  [v12 insertImagesData:v13 completion:v21];
  if (!v9 && !self->_presentationControllerDismissalObserver)
  {
    long long v14 = +[NSNotificationCenter defaultCenter];
    uint64_t v15 = UIPresentationControllerDismissalTransitionDidEndNotification;
    id v16 = +[NSOperationQueue mainQueue];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100047918;
    v19[3] = &unk_10009AC90;
    id v20 = v7;
    id v17 = [v14 addObserverForName:v15 object:0 queue:v16 usingBlock:v19];
    presentationControllerDismissalObserver = self->_presentationControllerDismissalObserver;
    self->_presentationControllerDismissalObserver = v17;
  }
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  -[SSSScreenshotsViewController _dismissWithDeleteOptions:](self, "_dismissWithDeleteOptions:", self->_saveToFilesDeleteOptions, a4);
  [(SSSScreenshotsViewController *)self _clearSecurityScopedResourcesAndTemporaryFiles];
  id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v5 setNeedsLayout];
}

- (void)documentPickerWasCancelled:(id)a3
{
  [(SSSScreenshotsViewController *)self _clearSecurityScopedResourcesAndTemporaryFiles];
  id v4 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v4 setNeedsLayout];
}

- (void)_saveToQuickNotePushed:(BOOL)a3 savePDF:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = [(SSSScreenshotsViewController *)self _screenshotsView];
    id v7 = [v6 imageItems];

    unsigned __int8 v8 = +[NSMutableArray array];
    quickNoteImages = self->_quickNoteImages;
    self->_quickNoteImages = v8;

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = v7;
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        long long v14 = 0;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = self->_quickNoteImages;
          id v16 = UIImagePNGRepresentation(*(UIImage **)(*((void *)&v27 + 1) + 8 * (void)v14));
          -[NSMutableArray addObject:](v15, "addObject:", v16, (void)v27);

          long long v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v12);
    }

    if (!v4) {
      goto LABEL_13;
    }
    id v17 = [(SSSScreenshotsViewController *)self visibleScreenshots];
    double v18 = [v17 firstObject];
    id v19 = [v18 temporaryPDFFile];

    if (v19)
    {
      if ([v19 startAccessingSecurityScopedResource]) {
        uint64_t v20 = 208;
      }
      else {
        uint64_t v20 = 216;
      }
      BOOL v21 = *(Class *)((char *)&self->super.super.super.isa + v20);
      if (v21)
      {
        [v21 addObject:v19];
      }
      else
      {
        id v22 = +[NSMutableArray arrayWithObject:v19];
        long long v23 = *(Class *)((char *)&self->super.super.super.isa + v20);
        *(Class *)((char *)&self->super.super.super.isa + v20) = v22;
      }
      id v24 = objc_alloc((Class)UIDocumentPickerViewController);
      v31 = v19;
      long long v25 = +[NSArray arrayWithObjects:&v31 count:1];
      id v26 = [v24 initForExportingURLs:v25 asCopy:1];

      [v26 setDelegate:self];
      [(SSSScreenshotsViewController *)self presentViewController:v26 animated:1 completion:0];
    }
    else
    {
LABEL_13:
      -[SSSScreenshotsViewController _dismissWithDeleteOptions:](self, "_dismissWithDeleteOptions:", 2, (void)v27);
    }
  }
}

- (void)_deletePushed
{
  id v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  id v4 = [v3 editMode];

  id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  if ([v5 editMode] == (id)1)
  {
    id v6 = [(SSSScreenshotsViewController *)self currentScreenshot];
    id v7 = [v6 PDFDocument];
    BOOL v8 = [v7 pageCount] == (id)1;
  }
  else
  {
    BOOL v8 = 0;
  }

  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100048118;
  v32[3] = &unk_10009ACB8;
  BOOL v33 = v4 == 0;
  BOOL v34 = v8;
  v32[4] = self;
  id v9 = objc_retainBlock(v32);
  objc_initWeak(&location, self);
  id v10 = +[NSBundle mainBundle];
  if (v4) {
    [v10 localizedStringForKey:@"DELETE_PAGE_ALERT_BUTTON" value:@"Delete Page" table:0];
  }
  else {
  uint64_t v11 = [v10 localizedStringForKey:@"DELETE_SCREENSHOT_ALERT_BUTTON" value:@"Delete Screenshot" table:0];
  }

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000482A8;
  v28[3] = &unk_10009ACE0;
  objc_copyWeak(&v30, &location);
  id v12 = v9;
  id v29 = v12;
  uint64_t v13 = +[UIAlertAction actionWithTitle:v11 style:2 handler:v28];
  long long v14 = +[NSBundle mainBundle];
  uint64_t v15 = [v14 localizedStringForKey:@"DELETE_SCREENSHOT_ALERT_CANCEL_BUTTON" value:@"Cancel" table:0];

  long long v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  long long v25 = sub_100048320;
  id v26 = &unk_10009AA28;
  objc_copyWeak(&v27, &location);
  id v16 = +[UIAlertAction actionWithTitle:v15 style:1 handler:&v23];
  id v17 = +[NSBundle mainBundle];
  if (v4) {
    [v17 localizedStringForKey:@"DELETE_PDF_PAGE_BUTTON_TITLE" value:@"Are you sure you want to delete this page?" table:0];
  }
  else {
  double v18 = [v17 localizedStringForKey:@"DELETE_SCREENSHOT_BUTTON_TITLE" value:@"Are you sure you want to delete this screenshot?" table:0];
  }

  [(SSSScreenshotsViewController *)self becomeFirstResponder];
  id v19 = +[UIAlertController alertControllerWithTitle:v18 message:0 preferredStyle:0];
  deleteActionSheet = self->_deleteActionSheet;
  self->_deleteActionSheet = v19;

  [(UIAlertController *)self->_deleteActionSheet addAction:v13];
  [(UIAlertController *)self->_deleteActionSheet addAction:v16];
  BOOL v21 = [(UIAlertController *)self->_deleteActionSheet popoverPresentationController];
  [v21 setBarButtonItem:self->_deleteItem];

  [(SSSScreenshotsViewController *)self presentViewController:self->_deleteActionSheet animated:1 completion:0];
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (BOOL)isShowingDeleteConfirmation
{
  id v3 = [(SSSScreenshotsViewController *)self presentedViewController];
  if (v3)
  {
    id v4 = [(SSSScreenshotsViewController *)self presentedViewController];
    unsigned __int8 v5 = [v4 isEqual:self->_deleteActionSheet];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)isShowingModalUI
{
  if ([(SSSScreenshotsViewController *)self isShowingDoneActionSheet]
    || [(SSSScreenshotsViewController *)self isShowingDeleteConfirmation])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v4 = [(SSSScreenshotsViewController *)self presentedViewController];
    if (v4)
    {
      unsigned __int8 v5 = [(SSSScreenshotsViewController *)self presentedViewController];
      unsigned int v3 = [v5 isBeingDismissed] ^ 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_exportVellumPDF
{
  unsigned int v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(SSSScreenshotsViewController *)self visibleScreenshots];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      BOOL v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v8) itemProviderPDF];
        [v3 addObject:v9];

        BOOL v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v10 = [SSSActivityViewController alloc];
  uint64_t v11 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  id v12 = -[SSSActivityViewController initWithActivityItems:applicationActivities:editMode:](v10, "initWithActivityItems:applicationActivities:editMode:", v3, 0, [v11 editMode]);

  [(SSSActivityViewController *)v12 setActivityItemProviders:v3];
  uint64_t v13 = [(SSSActivityViewController *)v12 popoverPresentationController];
  [v13 setBarButtonItem:self->_shareItem];

  [(SSSScreenshotsViewController *)self presentViewController:v12 animated:1 completion:0];
}

- (void)_updatePropertiesOnManagedSubviews
{
  if ((id)[(SSSScreenshotsViewController *)self state] == (id)1)
  {
    [(SSSScreenshotsViewController *)self _configureBarsIfNecessary];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = [(SSSScreenshotsViewController *)self parentViewController];
  id v3 = [v2 supportedInterfaceOrientations];

  return (unint64_t)v3;
}

- (CGRect)screenshotsExtentRect
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v2 screenshotsExtentRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (UICoordinateSpace)screenshotsParentCoordinateSpace
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  double v3 = [v2 screenshotsParentCoordinateSpace];

  return (UICoordinateSpace *)v3;
}

- (void)_prepareActivityViewController
{
}

- (void)_prepareActivityViewControllerNeedsActivityUpdate:(BOOL)a3
{
  BOOL v20 = a3;
  long long v23 = +[NSMutableArray array];
  double v4 = [(SSSScreenshotsViewController *)self _betaAppActivityItemIfAvailble];
  if (v4) {
    [v23 addObject:v4];
  }
  BOOL v21 = [(SSSScreenshotsViewController *)self _visionKitActivityItemIfAvailble];
  if (v21) {
    [v23 addObject:];
  }
  double v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  id v22 = [v5 activityItems];

  if ([v22 count])
  {
    if (v4)
    {
      double v6 = [(SSSActivityViewController *)self->_activityViewController includedActivityTypes];
      unsigned int v7 = [v6 containsObject:@"com.apple.screenshotservicesservice.betafeedback"] ^ 1;
    }
    else
    {
      unsigned int v7 = 0;
    }
    p_activityViewController = &self->_activityViewController;
    activityViewController = self->_activityViewController;
    self->_activityViewController = 0;

    double v10 = self->_activityViewController;
    double v11 = [(SSSScreenshotsViewController *)self traitCollection];
    uint64_t v12 = [(SSSScreenshotsViewController *)self state];
    double v13 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
    id v14 = [v13 editMode];
    long long v15 = [(SSSScreenshotsViewController *)self visibleScreenshots];
    long long v16 = sub_1000309A4(v10, (uint64_t)v11, v12, (uint64_t)v14, (uint64_t)[v15 count], v20 | v7, v23, v22);

    objc_storeStrong((id *)&self->_activityViewController, v16);
    if (v4)
    {
      long long v17 = [(id)objc_opt_class() activityTypeOrder];
      [(SSSActivityViewController *)*p_activityViewController setActivityTypeOrder:v17];
    }
    else
    {
      [(SSSActivityViewController *)*p_activityViewController setActivityTypeOrder:0];
    }
    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100048AD4;
    v24[3] = &unk_10009AD08;
    objc_copyWeak(&v25, &location);
    double v18 = objc_retainBlock(v24);
    [v16 setCompletionWithItemsHandler:v18];
    v27[0] = UIActivityTypeSaveToCameraRoll;
    v27[1] = UIActivityTypeMarkupAsPDF;
    v27[2] = UIActivityTypeOpenInIBooks;
    v27[3] = UIActivityTypeAddToReadingList;
    id v19 = +[NSArray arrayWithObjects:v27 count:4];
    [v16 setExcludedActivityTypes:v19];

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
}

+ (id)activityTypeOrder
{
  v4[0] = @"com.apple.screenshotservicesservice.betafeedback";
  v4[1] = UIActivityTypeAssignToContact;
  v4[2] = UIActivityTypeCopyToPasteboard;
  v4[3] = UIActivityTypePrint;
  v4[4] = UIActivityTypeCloudSharing;
  v2 = +[NSArray arrayWithObjects:v4 count:5];

  return v2;
}

- (void)_updateActivityViewController
{
}

- (void)_updateActivityViewControllerNeedsActivityUpdate:(BOOL)a3
{
}

- (void)cropDidChangeForScreenshotView:(id)a3
{
  resetCropItem = self->_resetCropItem;
  double v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  -[UIBarButtonItem setEnabled:](resetCropItem, "setEnabled:", [v5 isCropped]);

  double v6 = [(SSSScreenshotsViewController *)self _screenshotsView];
  id v7 = [v6 editMode];

  if (v7 == (id)2)
  {
    id v8 = +[SSSStatisticsManager sharedStatisticsManager];
    [v8 didCropInFullPageMode];
  }
  else
  {
    if (v7) {
      return;
    }
    id v8 = +[SSSStatisticsManager sharedStatisticsManager];
    [v8 didCropInNormalMode];
  }
}

- (void)removeChildViewControllers
{
  double v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v3 dismissOverlayManagedViewControllers];

  if (![(SSSScreenshotsViewController *)self state])
  {
    [(SSSScreenshotsViewController *)self _cancelSharing:1 completion:0];
  }
}

- (void)_dismissInflightActivity:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  double v6 = [(SSSActivityViewController *)self->_activityViewController activityViewController];
  id v7 = v6;
  if (v6) {
    [v6 dismissViewControllerAnimated:v4 completion:0];
  }
  sub_100026FD4((uint64_t)v8);
}

- (void)_cancelSharing:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100048FEC;
  v13[3] = &unk_100099A20;
  v13[4] = self;
  double v6 = objc_retainBlock(v13);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100049058;
  v12[3] = &unk_100099A20;
  v12[4] = self;
  id v7 = objc_retainBlock(v12);
  id v8 = [(SSSActivityViewController *)self->_activityViewController presentingViewController];

  if (v8)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000490E8;
    v9[3] = &unk_10009AD30;
    double v10 = v6;
    double v11 = v7;
    [(SSSScreenshotsViewController *)self _dismissActivityViewController:v4 completion:v9];
  }
  else
  {
    ((void (*)(void *))v6[2])(v6);
    ((void (*)(void *))v7[2])(v7);
  }
}

- (void)_dismissActivityViewController:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_activityViewController)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000491FC;
    v8[3] = &unk_10009AD58;
    v8[4] = self;
    BOOL v10 = v4;
    id v9 = v6;
    [(SSSScreenshotsViewController *)self _dismissInflightActivity:v4 completion:v8];
  }
  else
  {
    sub_100026FC0((uint64_t)v6);
  }
}

- (void)screenshotsView:(id)a3 didHitTestView:(id)a4 point:(CGPoint)a5 withEvent:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  id v19 = a3;
  id v11 = a4;
  id v12 = a6;
  double v13 = v12;
  if (v12 && [v12 type] != (id)11)
  {
    id v14 = [(SSSScreenshotsViewController *)self view];
    long long v15 = [v14 window];
    long long v16 = [v15 windowScene];

    if (v16)
    {
      long long v17 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v16];
      double v18 = v17;
      if (v17
        && [v17 _paletteViewVisible]
        && (objc_msgSend(v18, "_isPointInsidePaletteView:fromView:withEvent:", v11, v13, x, y) & 1) == 0)
      {
        [v18 _setMiniPaletteVisible:0 hoverLocation:v11 inView:CGPointZero.x, CGPointZero.y];
      }
    }
  }
}

- (void)presentActivityViewController
{
  id v6 = [(SSSScreenshotsViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(SSSScreenshotsViewController *)self delegate];
    unsigned int v4 = [v3 screenshotsViewControllerShouldAllowSharing:self];

    if (v4)
    {
      [(SSSScreenshotsViewController *)self _updateActivityViewControllerNeedsActivityUpdate:1];
      double v5 = [(SSSScreenshotsViewController *)self delegate];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000494D0;
      v7[3] = &unk_100099AB0;
      v7[4] = self;
      [v5 screenshotsViewController:self requestsPresentingActivityViewControllerWithBlock:v7];
    }
  }
  else
  {
  }
}

- (void)dismissActivityViewController
{
}

- (id)_bundleIDForBetaApp
{
  double v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned int v4 = [v3 visibleScreenshots];
  uint64_t v5 = (uint64_t)[v4 count];

  while (v5-- >= 1)
  {
    id v7 = [(SSSScreenshotsViewController *)self _screenshotsView];
    id v8 = [v7 visibleScreenshots];
    id v9 = [v8 objectAtIndex:v5];

    BOOL v10 = [v9 environmentDescription];
    id v11 = [v10 betaApplicationBundleID];

    if (v11) {
      goto LABEL_6;
    }
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

- (id)_betaApplicationName
{
  double v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned int v4 = [v3 visibleScreenshots];
  uint64_t v5 = (uint64_t)[v4 count];

  while (v5-- >= 1)
  {
    id v7 = [(SSSScreenshotsViewController *)self _screenshotsView];
    id v8 = [v7 visibleScreenshots];
    id v9 = [v8 objectAtIndex:v5];

    BOOL v10 = [v9 environmentDescription];
    id v11 = [v10 betaApplicationName];

    if (v11) {
      goto LABEL_6;
    }
  }
  id v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)_shouldSendToDeveloper
{
  double v3 = [(SSSScreenshotsViewController *)self _bundleIDForBetaApp];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(SSSScreenshotsViewController *)self _bundleIDForBetaApp];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (id)_betaAppActivityItemIfAvailble
{
  if ([(SSSScreenshotsViewController *)self _shouldSendToDeveloper])
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000499AC;
    v5[3] = &unk_100099A20;
    v5[4] = self;
    double v3 = [[SSSBetaFeedbackActivity alloc] initWithBlock:v5];
  }
  else
  {
    double v3 = 0;
  }

  return v3;
}

- (id)_visionKitActivityItemIfAvailble
{
  v2 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  double v3 = [v2 visionKitFeedbackActivity];

  return v3;
}

- (void)_sendToDeveloper
{
  double v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  BOOL v4 = [v3 imageItems];
  id v5 = [v4 count];

  if (v5)
  {
    id v6 = +[SSSStatisticsManager sharedStatisticsManager];
    [v6 didTapBetaFeedbackButton];

    id v7 = [(SSSScreenshotsViewController *)self _screenshotsView];
    id v8 = [v7 imageItems];

    id v9 = [(SSSScreenshotsViewController *)self _bundleIDForBetaApp];
    BOOL v10 = [(SSSScreenshotsViewController *)self delegate];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100049B40;
    v13[3] = &unk_10009A090;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v11 = v8;
    id v12 = v9;
    [v10 screenshotsViewController:self requestsPresentingTestFlightFeedbackControllerWithBlock:v13];
  }
}

- (void)dismissTFViewController
{
  testFlightViewController = self->_testFlightViewController;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100049E0C;
  v3[3] = &unk_100099A20;
  v3[4] = self;
  [(UIViewController *)testFlightViewController dismissViewControllerAnimated:1 completion:v3];
}

- (void)sessionDidSubmitFeedback:(id)a3
{
  BOOL v4 = +[SSSStatisticsManager sharedStatisticsManager];
  id v5 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  id v6 = [v5 modelModificationInfo];
  id v7 = [v6 annotations];
  [v4 didSubmitFeedbackWithAnnotationCount:[v7 count]];

  testFlightViewController = self->_testFlightViewController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100049F6C;
  v9[3] = &unk_100099A20;
  void v9[4] = self;
  [(UIViewController *)testFlightViewController dismissViewControllerAnimated:1 completion:v9];
}

- (void)setState:(unint64_t)a3
{
  unint64_t v5 = [(SSSScreenshotsViewController *)self state];
  BOOL v6 = a3 == 1 && v5 == 0;
  char v7 = v6;
  if (v6)
  {
    id v8 = [(SSSScreenshotsViewController *)self _screenshotsView];
    [v8 setIsSharing:0];

    id v9 = [(SSSScreenshotsViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    int v11 = 0;
    if (v10)
    {
      id v12 = [(SSSScreenshotsViewController *)self delegate];
      self->_BOOL shouldShowSharrow = [v12 screenshotsViewControllerShouldAllowSharing:self];

      int v11 = 0;
    }
  }
  else
  {
    int v11 = 0;
    self->_BOOL shouldShowSharrow = 0;
    if (!a3)
    {
      if ([(SSSScreenshotsViewController *)self analysisModeEnabled]) {
        [(SSSScreenshotsViewController *)self setAnalysisModeEnabled:0];
      }
      int v11 = 1;
    }
  }
  double v13 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v13 setState:a3];

  [(SSSScreenshotsViewController *)self _updatePropertiesOnManagedSubviews];
  if ((v7 & 1) == 0)
  {
    id v14 = [(SSSScreenshotsViewController *)self _screenshotsView];
    [v14 layoutIfNeeded];
  }
  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
  if (v11)
  {
    id v15 = [(SSSScreenshotsViewController *)self presentedViewController];

    if (v15)
    {
      long long v16 = [(SSSScreenshotsViewController *)self presentedViewController];
      long long v17 = [v16 popoverPresentationController];

      double v18 = [(SSSScreenshotsViewController *)self presentedViewController];
      id v19 = v18;
      if (v17)
      {
        BOOL v20 = [(SSSActivityViewController *)v18 popoverPresentationController];
        BOOL v21 = [v20 presentedView];

        [v21 setHidden:1];
        id v22 = [(SSSScreenshotsViewController *)self presentedViewController];
        activityViewController = self->_activityViewController;

        if (v22 == activityViewController)
        {
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_10004A300;
          v30[3] = &unk_100099A20;
          uint64_t v24 = &v31;
          v31 = v21;
          id v27 = v21;
          [(SSSScreenshotsViewController *)self _cancelSharing:0 completion:v30];
        }
        else
        {
          v28[0] = _NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = sub_10004A30C;
          v28[3] = &unk_100099A20;
          uint64_t v24 = &v29;
          id v29 = v21;
          id v25 = v21;
          [(SSSScreenshotsViewController *)self dismissViewControllerAnimated:0 completion:v28];
        }
      }
      else
      {
        id v26 = self->_activityViewController;

        if (v19 == v26)
        {
          [(SSSScreenshotsViewController *)self _cancelSharing:1 completion:0];
        }
        else
        {
          [(SSSScreenshotsViewController *)self dismissViewControllerAnimated:1 completion:0];
        }
      }
    }
  }
}

- (unint64_t)state
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  id v3 = [v2 state];

  return (unint64_t)v3;
}

- (BOOL)inStateTransition
{
  v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned __int8 v3 = [v2 inStateTransition];

  return v3;
}

- (void)stateTransitionFinished
{
  id v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v2 stateTransitionFinished];
}

- (void)commitInflightEditsIfNecessary
{
  id v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v2 commitInflightEdits];
}

- (void)setScreenshotsUseTrilinearMinificationFilter:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v4 setScreenshotViewsUseTrilinearMinificationFilter:v3];
}

- (BOOL)screenshotsUseTrilinearMinificationFilter
{
  id v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned __int8 v3 = [v2 screenshotViewsUseTrilinearMinificationFilter];

  return v3;
}

- (void)setShowsShadow:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_10004A55C;
    v6[3] = &unk_10009AD80;
    v6[4] = self;
    BOOL v7 = a3;
    +[UIView _animateUsingDefaultTimingWithOptions:6 animations:v6 completion:0];
  }
  else
  {
    id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
    [v5 setShowsShadow:v4];
  }
}

- (BOOL)showsShadow
{
  id v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned __int8 v3 = [v2 showsShadow];

  return v3;
}

- (void)setBorderViewStyleOverride:(int64_t)a3 withAnimator:(id)a4
{
  id v6 = a4;
  id v7 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v7 setBorderViewStyleOverride:a3 withAnimator:v6];
}

- (void)setSnapshotScreenshotEdits:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v4 setSnapshotScreenshotEdits:v3];
}

- (BOOL)snapshotScreenshotEdits
{
  id v2 = [(SSSScreenshotsViewController *)self _screenshotsView];
  unsigned __int8 v3 = [v2 snapshotScreenshotEdits];

  return v3;
}

- (void)_enterCrop
{
  unsigned __int8 v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v3 setEditMode:2];

  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
  id v4 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v4 enterCrop];

  [(SSSScreenshotsViewController *)self becomeFirstResponder];
  id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v5 setNeedsLayout];
}

- (void)_exitCrop
{
  unsigned __int8 v3 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  [v3 commitInflightEdits];

  id v4 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v4 doneCrop];

  id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v5 setEditMode:1];

  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
  [(SSSScreenshotsViewController *)self becomeFirstResponder];
  id v6 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v6 setNeedsLayout];
}

- (void)_resetCrop
{
  unsigned __int8 v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v3 resetCrop];

  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:1];
}

- (void)_cancelCrop
{
  unsigned __int8 v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v3 cancelCrop];

  id v4 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v4 setEditMode:1];

  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:1];
  [(SSSScreenshotsViewController *)self becomeFirstResponder];
  id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v5 setNeedsLayout];
}

- (void)_selectScreenshotOrFull:(id)a3
{
  id v4 = [a3 selectedSegmentIndex];
  id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v5 commitInflightEdits];

  id v6 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v6 setEditMode:v4 != 0];

  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
  [(SSSScreenshotsViewController *)self _updateTopBarProperties];
  if (v4)
  {
    id v7 = +[SSSStatisticsManager sharedStatisticsManager];
    [v7 didTapFullPageSegment];
  }
}

- (void)setAaModeEnabled:(BOOL)a3
{
  self->_aaModeEnabled = a3;
  if (a3)
  {
    self->_annotationModeEnabled = 0;
    self->_analysisModeEnabled = 0;
  }
  [(SSSScreenshotsViewController *)self updateScreenshotsInteractionModeIfNecessary];
}

- (void)setAnalysisModeEnabled:(BOOL)a3
{
  self->_analysisModeEnabled = a3;
  if (a3)
  {
    self->_annotationModeEnabled = 0;
    self->_aaModeEnabled = 0;
  }
  id v4 = [(SSSScreenshotsViewController *)self analysisButtonImageForCurrentState];
  [(UIBarButtonItem *)self->_visualSearchBarButtonItem setImage:v4];

  [(SSSScreenshotsViewController *)self updateScreenshotsInteractionModeIfNecessary];
}

- (id)analysisButtonImageForCurrentState
{
  unsigned __int8 v3 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  id v4 = v3;
  if (self->_analysisModeEnabled) {
    [v3 vsGlyphFilled];
  }
  else {
  id v5 = [v3 vsGlyph];
  }
  id v6 = +[UIImage _systemImageNamed:v5];

  return v6;
}

- (void)setAnnotationModeEnabled:(BOOL)a3
{
  self->_annotationModeEnabled = a3;
  if (a3)
  {
    self->_analysisModeEnabled = 0;
    self->_aaModeEnabled = 0;
  }
  [(SSSScreenshotsViewController *)self updateAnnotationButtonForCurrentState];

  [(SSSScreenshotsViewController *)self updateScreenshotsInteractionModeIfNecessary];
}

- (void)updateAnnotationButtonForCurrentState
{
  id v3 = [(SSSScreenshotsViewController *)self analysisButtonImageForCurrentState];
  [(UIBarButtonItem *)self->_visualSearchBarButtonItem setImage:v3];
}

- (void)updateScreenshotsInteractionModeToMode:(unint64_t)a3
{
  BOOL v5 = a3 <= 3 && (a3 & 0xF) == 0;
  BOOL v6 = a3 <= 3 && (a3 & 0xF) == 3;
  BOOL v7 = a3 <= 3 && (a3 & 0xF) == 2;
  [(VKSelectableBarButtonItem *)self->_annotationEnabledButton setSelected:v5];
  self->_annotationModeEnabled = v5;
  self->_aaModeEnabled = v6;
  self->_analysisModeEnabled = v7;
  id v8 = [(SSSScreenshotsViewController *)self analysisButtonImageForCurrentState];
  [(UIBarButtonItem *)self->_visualSearchBarButtonItem setImage:v8];

  id v9 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v9 setInteractionMode:a3];
}

- (void)updateScreenshotsInteractionModeIfNecessary
{
  if (self->_annotationModeEnabled)
  {
    [(SSSScreenshotsViewController *)self updateScreenshotsInteractionModeToMode:0];
  }
  else if (self->_analysisModeEnabled)
  {
    [(SSSScreenshotsViewController *)self updateScreenshotsInteractionModeToMode:2];
  }
  else if (self->_aaModeEnabled)
  {
    [(SSSScreenshotsViewController *)self updateScreenshotsInteractionModeToMode:3];
  }
  else
  {
    [(SSSScreenshotsViewController *)self updateScreenshotsInteractionModeToMode:1];
  }
}

- (void)_opacityControlChanged
{
  self->_isChangingOpacitdouble y = 1;
  id v4 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  id v3 = [v4 viewModificationInfo];
  [(SSVellumOpacityControl *)self->_opacityControl value];
  [v3 setVellumOpacity:];
}

- (void)_opacityControlLifted
{
  id v3 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  [v3 promoteViewValueToModelValueForKey:3];

  self->_isChangingOpacitdouble y = 0;
  id v4 = [(SSSScreenshotsViewController *)self _screenshotsView];
  id v5 = [v4 editMode];

  BOOL v6 = +[SSSStatisticsManager sharedStatisticsManager];
  id v7 = v6;
  if (v5 == (id)1) {
    [v6 didChangeOpacityOnFullPage];
  }
  else {
    [v6 didChangeOpacityOnNormalScreenshot];
  }
}

- (id)_currentScreenshotView
{
  id v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  id v4 = [(SSSScreenshotsViewController *)self currentScreenshot];
  id v5 = [v3 screenshotViewForScreenshot:v4];

  return v5;
}

- (void)didTapOpacityOptionWithAttributeView:(id)a3
{
  id v4 = a3;
  id v5 = (UIView *)objc_alloc_init((Class)UIView);
  opacityView = self->_opacityView;
  self->_opacityView = v5;

  [(UIView *)self->_opacityView addSubview:self->_opacityControl];
  [v4 addSubview:self->_opacityView];
  id v7 = self->_opacityView;
  id v8 = +[UIColor whiteColor];
  [(UIView *)v7 setTintColor:v8];

  double v54 = +[UIImage systemImageNamed:@"xmark.circle"];
  id v9 = +[UIButton buttonWithType:1];
  [v9 setImage:v54 forState:0];
  char v10 = +[UIImageSymbolConfiguration configurationWithScale:3];
  [v9 setPreferredSymbolConfiguration:v10 forImageInState:0];

  [v9 addTarget:self action:"endOpacityEditing" forEvents:64];
  [(UIView *)self->_opacityView addSubview:v9];
  id v11 = objc_alloc_init((Class)UILargeContentViewerInteraction);
  [v4 addInteraction:v11];

  double v53 = v9;
  [v9 setShowsLargeContentViewer:1];
  [(UIView *)self->_opacityView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SSVellumOpacityControl *)self->_opacityControl setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v51 = [(UIView *)self->_opacityView bottomAnchor];
  double v47 = [v4 bottomAnchor];
  unint64_t v44 = [v51 constraintEqualToAnchor:v47];
  v57[0] = v44;
  double v42 = [(UIView *)self->_opacityView leftAnchor];
  id v40 = [v4 leftAnchor];
  id v12 = [v42 constraintEqualToAnchor:v40 constant:10.0];
  v57[1] = v12;
  double v13 = [(UIView *)self->_opacityView rightAnchor];
  id v14 = [v4 rightAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14 constant:-10.0];
  v57[2] = v15;
  long long v16 = [(UIView *)self->_opacityView topAnchor];
  long long v17 = [v4 topAnchor];

  double v18 = [v16 constraintEqualToAnchor:v17];
  v57[3] = v18;
  id v19 = +[NSArray arrayWithObjects:v57 count:4];
  +[NSLayoutConstraint activateConstraints:v19];

  BOOL v20 = [(SSVellumOpacityControl *)self->_opacityControl centerXAnchor];
  BOOL v21 = [(UIView *)self->_opacityView centerXAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21];

  LODWORD(v23) = 1144750080;
  double v52 = v22;
  [v22 setPriority:v23];
  v56[0] = v22;
  long long v48 = [(SSVellumOpacityControl *)self->_opacityControl leadingAnchor];
  id v45 = [(UIView *)self->_opacityView leadingAnchor];
  uint64_t v24 = [v48 constraintGreaterThanOrEqualToAnchor:v45];
  v56[1] = v24;
  id v25 = [(SSVellumOpacityControl *)self->_opacityControl centerYAnchor];
  id v26 = [(UIView *)self->_opacityView centerYAnchor];
  id v27 = [v25 constraintEqualToAnchor:v26];
  v56[2] = v27;
  long long v28 = [(SSVellumOpacityControl *)self->_opacityControl widthAnchor];
  +[SSVellumOpacityControl preferredWidth];
  id v29 = [v28 constraintEqualToConstant:];
  v56[3] = v29;
  id v30 = +[NSArray arrayWithObjects:v56 count:4];
  +[NSLayoutConstraint activateConstraints:v30];

  v49 = [v53 centerYAnchor];
  long long v46 = [(SSVellumOpacityControl *)self->_opacityControl centerYAnchor];
  BOOL v43 = [v49 constraintEqualToAnchor:v46];
  v55[0] = v43;
  double v41 = [v53 leadingAnchor];
  double v50 = [(SSVellumOpacityControl *)self->_opacityControl trailingAnchor];
  v31 = [v41 constraintEqualToAnchor:v50 constant:12.0];
  v55[1] = v31;
  v32 = [v53 trailingAnchor];
  BOOL v33 = [(UIView *)self->_opacityView trailingAnchor];
  BOOL v34 = [v32 constraintLessThanOrEqualToAnchor:v33];
  v55[2] = v34;
  v35 = [v53 widthAnchor];
  +[SSChromeHelper defaultBarButtonWidth];
  v36 = [v35 constraintEqualToConstant:];
  v55[3] = v36;
  id v37 = [v53 heightAnchor];
  +[SSChromeHelper defaultBarButtonWidth];
  char v38 = [v37 constraintEqualToConstant:];
  v55[4] = v38;
  uint64_t v39 = +[NSArray arrayWithObjects:v55 count:5];
  +[NSLayoutConstraint activateConstraints:v39];
}

- (void)endOpacityEditing
{
  [(UIView *)self->_opacityView removeFromSuperview];
  id v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v3 endOpacityEditing];
}

- (void)_undoManagerDidUndoRedoChange:(id)a3
{
  id v4 = [a3 object];
  id v5 = [(SSSScreenshotsViewController *)self undoManager];

  if (v4 == v5)
  {
    [(SSSScreenshotsViewController *)self _updateUndoRedoEnabledState];
  }
}

- (id)undoManager
{
  id v3 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  id v4 = [v3 undoManager];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSSScreenshotsViewController;
    id v5 = [(SSSScreenshotsViewController *)&v8 undoManager];
  }
  BOOL v6 = v5;

  return v6;
}

- (void)_undoPushed
{
  id v2 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  [v2 undo];
}

- (void)_redoPushed
{
  id v2 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  [v2 redo];
}

- (void)_updateUndoRedoEnabledState
{
  id v7 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  id v3 = [v7 canUndo];
  id v4 = [v7 canRedo];
  [(UIBarButtonItem *)self->_undoItem setEnabled:v3];
  [(UIBarButtonItem *)self->_redoItem setEnabled:v4];
  opacityControl = self->_opacityControl;
  BOOL v6 = [v7 viewModificationInfo];
  [v6 vellumOpacity];
  -[SSVellumOpacityControl setValue:](opacityControl, "setValue:");

  [(UIView *)self->_contentSwitcherView setHidden:[(SSSScreenshotsViewController *)self _layoutShouldShowContentSwitcher] ^ 1];
}

- (void)_updateTopBarProperties
{
  [(SSSScreenshotsViewController *)self _updateUndoRedoEnabledState];
  id v3 = [(SSSScreenshotsViewController *)self _screenshotsView];
  BOOL v4 = [v3 editMode] != 0;

  if ([(UISegmentedControl *)self->_contentSwitcher selectedSegmentIndex] != v4) {
    [(UISegmentedControl *)self->_contentSwitcher setSelectedSegmentIndex:v4];
  }
  if (!self->_isChangingOpacity)
  {
    [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
  }
}

- (void)_revertPushed
{
  id v3 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  [v3 revert];

  id v4 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v4 setNeedsLayout];
}

- (void)screenshotsView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4
{
}

- (void)aaButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSScreenshotsViewController *)self _currentScreenshotView];

  if (v5 == v4)
  {
    uint64_t v6 = [(SSSScreenshotsViewController *)self aaModeEnabled] ^ 1;
    [(SSSScreenshotsViewController *)self setAaModeEnabled:v6];
  }
}

- (void)viButtonPressed:(id)a3
{
  uint64_t v4 = [(SSSScreenshotsViewController *)self analysisModeEnabled] ^ 1;

  [(SSSScreenshotsViewController *)self setAnalysisModeEnabled:v4];
}

- (void)analysisButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSScreenshotsViewController *)self _currentScreenshotView];

  if (v5 == v4)
  {
    [(SSSScreenshotsViewController *)self setAnalysisModeEnabled:[(SSSScreenshotsViewController *)self analysisModeEnabled] ^ 1];
    [(SSSScreenshotsViewController *)self updateScreenshotsInteractionModeIfNecessary];
    if ([(SSSScreenshotsViewController *)self analysisModeEnabled])
    {
      __SSSetAnnotationModePreference(0);
    }
  }
}

- (void)updateAnalysisButtonStateToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(SSSScreenshotsViewController *)self updateAnnotationButtonForCurrentState];
  }
  visualSearchBarButtonItem = self->_visualSearchBarButtonItem;

  [(UIBarButtonItem *)visualSearchBarButtonItem _setHidden:!v3];
}

- (void)activeScreenshotViewDidChangeToView:(id)a3 fromView:(id)a4
{
}

- (void)screenshotsViewEditModeDidChange:(id)a3
{
}

- (void)updateForScreenshotViewChangeAnimated:(BOOL)a3 oldView:(id)a4
{
  BOOL v4 = a3;
  id v10 = a4;
  self->_aaModeEnabled = 0;
  self->_analysisModeEnabled = 0;
  uint64_t v6 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  id v7 = [v6 editMode];

  if (v10)
  {
    int v8 = [v10 interactionMode] == 0;
    if (v7)
    {
LABEL_3:
      uint64_t v9 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    int v8 = _SSGetAnnotationModePreference();
    if (v7) {
      goto LABEL_3;
    }
  }
  uint64_t v9 = [(SSSScreenshotsViewController *)self initialAnnotationMode] | v8;
LABEL_6:
  [(SSSScreenshotsViewController *)self setAnnotationModeEnabled:v9];
  [(SSSScreenshotsViewController *)self setInitialAnnotationMode:0];
  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:v4];
}

- (void)_recapPushed
{
  BOOL v3 = [SSSRecapViewController alloc];
  BOOL v4 = [(SSSScreenshotsViewController *)self currentScreenshot];
  id v5 = [(SSSRecapViewController *)v3 initWithScreenshot:v4];

  [(SSSScreenshotsViewController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_relevantTraitsDidChange
{
  [(SSSScreenshotsViewController *)self _updatePropertiesOnManagedSubviews];

  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:0];
}

- (void)_screenshotManagerDidProcessMetadataUpdate:(id)a3
{
}

- (void)_screenshotManagerDidProcessDocumentUpdate:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v7 = [v4 objectForKeyedSubscript:@"screenshot"];

  id v5 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v5 didProcessDocumentUpdateForScreenshot:v7];

  [(SSSScreenshotsViewController *)self _updateBarButtonItemPositionsAnimated:1];
  uint64_t v6 = [(SSSScreenshotsViewController *)self _screenshotsView];
  [v6 _updateThumbnailViewVisibilityIfNeededAnimated:1];
}

- (BOOL)_cropPDFEnabled
{
  id v2 = [(SSSScreenshotsViewController *)self _currentScreenshotView];
  BOOL v3 = [v2 _internalPDFView];
  BOOL v4 = [v3 document];
  BOOL v5 = [v4 pageCount] == (id)1;

  return v5;
}

- (CGRect)getVisibleBoundsForOverlay
{
  id v2 = [(SSSScreenshotsViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setInStateTransition:(BOOL)a3
{
  self->_inStateTransition = a3;
}

- (SSSScreenshotsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSScreenshotsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)contentSwitcherAlpha
{
  return self->_contentSwitcherAlpha;
}

- (BOOL)initialAnnotationMode
{
  return self->_initialAnnotationMode;
}

- (void)setInitialAnnotationMode:(BOOL)a3
{
  self->_initialAnnotationMode = a3;
}

- (BOOL)annotationModeEnabled
{
  return self->_annotationModeEnabled;
}

- (BOOL)aaModeEnabled
{
  return self->_aaModeEnabled;
}

- (BOOL)analysisModeEnabled
{
  return self->_analysisModeEnabled;
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLinkObserver, 0);
  objc_storeStrong((id *)&self->_presentationControllerDismissalObserver, 0);
  objc_storeStrong((id *)&self->_deleteActionSheet, 0);
  objc_storeStrong((id *)&self->_quickNoteImages, 0);
  objc_storeStrong((id *)&self->_temporaryURLs, 0);
  objc_storeStrong((id *)&self->_securityScopedResourceURLs, 0);
  objc_storeStrong((id *)&self->_testFlightSession, 0);
  objc_storeStrong((id *)&self->_testFlightViewController, 0);
  objc_storeStrong((id *)&self->_activityViewController, 0);
  objc_storeStrong((id *)&self->_visualSearchBarButtonItem, 0);
  objc_storeStrong((id *)&self->_annotationEnabledButton, 0);
  objc_storeStrong((id *)&self->_contentSwitcherView, 0);
  objc_storeStrong((id *)&self->_contentSwitcher, 0);
  objc_storeStrong((id *)&self->_cancelCropItem, 0);
  objc_storeStrong((id *)&self->_resetCropItem, 0);
  objc_storeStrong((id *)&self->_cropItem, 0);
  objc_storeStrong((id *)&self->_opacityView, 0);
  objc_storeStrong((id *)&self->_opacityControl, 0);
  objc_storeStrong((id *)&self->_opacityItem, 0);
  objc_storeStrong((id *)&self->_undoRedoSpacerItem, 0);
  objc_storeStrong((id *)&self->_redoItem, 0);
  objc_storeStrong((id *)&self->_undoItem, 0);
  objc_storeStrong((id *)&self->_recapItem, 0);
  objc_storeStrong((id *)&self->_deleteItem, 0);
  objc_storeStrong((id *)&self->_doneItem, 0);
  objc_storeStrong((id *)&self->_shareItem, 0);

  objc_storeStrong((id *)&self->_managedNavigationItem, 0);
}

@end