@interface AKController
+ (AKController)controllerWithDelegate:(id)a3;
+ (BOOL)_isInLowMemoryEnvironment;
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (BOOL)canConnectToStylus;
+ (BOOL)hasPressureCapableHardware;
+ (id)akBundle;
+ (id)akBundleIdentifier;
+ (id)colorForHighlightAttributeWithTag:(int64_t)a3;
+ (id)markupBarButtonItemWithTarget:(id)a3 action:(SEL)a4;
+ (void)adjustAnnotationBoundsToFitText:(id)a3;
+ (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4;
- (AKActionController)actionController;
- (AKAttributeController)attributeController;
- (AKController)initWithDelegate:(id)a3;
- (AKControllerDelegateProtocol)delegate;
- (AKControllerOverlayInteractionProtocol)overlayInteractionDelegate;
- (AKFormFeatureDetectorController)formDetectionController;
- (AKHighlightAnnotationController)highlightAnnotationController;
- (AKLegacyDoodleController)legacyDoodleController;
- (AKMainEventHandler)mainEventHandler;
- (AKModelController)modelController;
- (AKPageController)lastCreationCascadingPageController;
- (AKPeripheralAvailabilityManager_iOS)peripheralAvailabilityManager;
- (AKSidecarController)sidecarController;
- (AKSignatureModelController)signatureModelController;
- (AKSignaturesController)signaturesController;
- (AKSparseMutableControllerArray)pageControllers;
- (AKStatistics)statisticsLogger;
- (AKTextEditorController)textEditorController;
- (AKToolController)toolController;
- (AKToolbarView)modernToolbarView;
- (AKToolbarViewController)toolbarViewController;
- (AKUndoController)undoController;
- (BOOL)_isInDFRAction;
- (BOOL)_validateCutCopyDelete;
- (BOOL)allEditingDisabled;
- (BOOL)annotationEditingEnabled;
- (BOOL)canBeginEditingTextAnnotation:(id)a3;
- (BOOL)canPerformKeyCommandAction:(SEL)a3 withSender:(id)a4 handled:(BOOL *)a5;
- (BOOL)formFillingEnabled;
- (BOOL)handleEvent:(id)a3;
- (BOOL)hideAllAdornments;
- (BOOL)isLogging;
- (BOOL)isOverlayViewLoadedAtIndex:(unint64_t)a3;
- (BOOL)isPresentingPopover;
- (BOOL)isTestingInstance;
- (BOOL)isTornDown;
- (BOOL)isUsedOnDarkBackground;
- (BOOL)onlyDrawWithApplePencil;
- (BOOL)overlayShouldPixelate;
- (BOOL)pencilAlwaysDraws;
- (BOOL)selectNewlyCreatedAnnotations;
- (BOOL)shapeDetectionEnabled;
- (BOOL)shouldDrawVariableStrokeDoodles;
- (BOOL)supportForPencilAlwaysDrawsSatisfied;
- (BOOL)supportsFormFill;
- (BOOL)supportsImageDescriptionEditing;
- (BOOL)useHighVisibilityDefaultInks;
- (BOOL)validateDelete:(id)a3;
- (BOOL)validateDuplicate:(id)a3;
- (BOOL)validateEditTextAnnotation:(id)a3;
- (BOOL)validatePaste:(id)a3;
- (BOOL)validateRedo:(id)a3;
- (BOOL)validateSelectAll:(id)a3;
- (BOOL)validateSender:(id)a3;
- (BOOL)validateShowAttributeInspector:(id)a3;
- (BOOL)validateUndo:(id)a3;
- (CGRect)_popoverAnchorFrameInModelForAnnotations:(id)a3;
- (CGRect)contentAlignedRectForRect:(CGRect)a3 onPageAtIndex:(unint64_t)a4;
- (NSArray)cachedKeyCommands;
- (NSMapTable)pageModelControllersToPageControllers;
- (NSString)author;
- (NSString)modifiedImageDescription;
- (PKRulerHostingDelegate)rulerHostingDelegate;
- (PKToolPicker)toolPicker;
- (UIView)toolbarView;
- (double)akModelToCanvasFixedPixelScaleOfFirstEncounteredPage;
- (double)currentModelBaseScaleFactorForPageAtIndex:(unint64_t)a3;
- (double)screenPixelsToCanvasPixelsDownscale;
- (id)_toolpicker_color;
- (id)_toolpicker_inkIdentifier;
- (id)currentPageController;
- (id)doubleTapGestureRecognizer;
- (id)imageForToolbarButtonItemOfType:(unint64_t)a3;
- (id)initForTesting;
- (id)keyCommandsForAnnotations;
- (id)originalOrModifiedImageDescription;
- (id)overlayViewAtIndex:(unint64_t)a3;
- (id)pageControllerForAnnotation:(id)a3;
- (id)pageControllerForPageModelController:(id)a3;
- (id)panGestureRecognizer;
- (id)pressGestureRecognizer;
- (id)rotationGestureRecognizer;
- (id)tapGestureRecognizer;
- (id)toolbarButtonItemOfType:(unint64_t)a3;
- (int64_t)currentExifOrientationForPageAtIndex:(unint64_t)a3;
- (int64_t)lastPasteboardChangeCount;
- (unint64_t)creationCascadingMultiplier;
- (unint64_t)currentPageIndex;
- (unint64_t)pasteCascadingMultiplier;
- (unint64_t)toolMode;
- (void)_didReceiveMemoryWarning:(id)a3;
- (void)_didScrollPDFPage:(id)a3;
- (void)_pageModelControllerSelectedAnnotationsChangedNotification:(id)a3;
- (void)_setupPageModelController:(id)a3;
- (void)_toolpicker_setColor:(id)a3;
- (void)_toolpicker_setInkIdentifier:(id)a3;
- (void)_updateGestureDependencyPriority;
- (void)addPopupToAnnotation:(id)a3 openPopup:(BOOL)a4;
- (void)applyCurrentCrop;
- (void)beginLogging:(id)a3 documentType:(id)a4;
- (void)clearUndoStack;
- (void)commitEditing;
- (void)copy:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)delayedUndoControllerSetup;
- (void)delete:(id)a3;
- (void)didBeginEditingAnnotation:(id)a3;
- (void)didEndEditingAnnotation:(id)a3;
- (void)duplicate:(id)a3;
- (void)editTextAnnotation:(id)a3;
- (void)editTextAnnotation:(id)a3 selectAllText:(BOOL)a4;
- (void)enclosingScrollViewDidScroll:(id)a3;
- (void)endEditingTextAnnotation;
- (void)endLogging;
- (void)hideSelectionMenu:(id)a3;
- (void)highlightableSelectionChanged;
- (void)highlightableSelectionDidEndChanging;
- (void)highlightableSelectionWillBeginChanging;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)paste:(id)a3;
- (void)performActionForSender:(id)a3;
- (void)prepareOverlayAtIndex:(unint64_t)a3;
- (void)redo:(id)a3;
- (void)relinquishOverlayAtIndex:(unint64_t)a3;
- (void)removeNoteFromAnnotation:(id)a3;
- (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4;
- (void)resetToDefaultToolMode;
- (void)selectAll:(id)a3;
- (void)setActionController:(id)a3;
- (void)setAkModelToCanvasFixedPixelScaleOfFirstEncounteredPage:(double)a3;
- (void)setAllEditingDisabled:(BOOL)a3;
- (void)setAnnotationEditingEnabled:(BOOL)a3;
- (void)setAttributeController:(id)a3;
- (void)setAuthor:(id)a3;
- (void)setCreationCascadingMultiplier:(unint64_t)a3;
- (void)setCurrentPageIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFormDetectionController:(id)a3;
- (void)setFormFillingEnabled:(BOOL)a3;
- (void)setHideAllAdornments:(BOOL)a3;
- (void)setHighlightAnnotationController:(id)a3;
- (void)setIsLogging:(BOOL)a3;
- (void)setIsTestingInstance:(BOOL)a3;
- (void)setIsTornDown:(BOOL)a3;
- (void)setIsUsedOnDarkBackground:(BOOL)a3;
- (void)setLastCreationCascadingPageController:(id)a3;
- (void)setLastPasteboardChangeCount:(int64_t)a3;
- (void)setLegacyDoodleController:(id)a3;
- (void)setMainEventHandler:(id)a3;
- (void)setModelController:(id)a3;
- (void)setModernToolbarView:(id)a3;
- (void)setModifiedImageDescription:(id)a3;
- (void)setOverlayInteractionDelegate:(id)a3;
- (void)setOverlayShouldPixelate:(BOOL)a3;
- (void)setPageControllers:(id)a3;
- (void)setPageModelControllersToPageControllers:(id)a3;
- (void)setPasteCascadingMultiplier:(unint64_t)a3;
- (void)setPencilAlwaysDraws:(BOOL)a3;
- (void)setPeripheralAvailabilityManager:(id)a3;
- (void)setRulerHostingDelegate:(id)a3;
- (void)setScreenPixelsToCanvasPixelsDownscale:(double)a3;
- (void)setSelectNewlyCreatedAnnotations:(BOOL)a3;
- (void)setSidecarController:(id)a3;
- (void)setSignatureModelController:(id)a3;
- (void)setSignaturesController:(id)a3;
- (void)setStatisticsLogger:(id)a3;
- (void)setTextEditorController:(id)a3;
- (void)setToolController:(id)a3;
- (void)setToolMode:(unint64_t)a3;
- (void)setToolbarView:(id)a3;
- (void)setToolbarViewController:(id)a3;
- (void)setUndoController:(id)a3;
- (void)setUseHighVisibilityDefaultInks:(BOOL)a3;
- (void)showSelectionMenu:(id)a3;
- (void)strokeAddedNotification:(id)a3;
- (void)teardown;
- (void)toolPickerVisibilityDidChange:(id)a3;
- (void)undo:(id)a3;
- (void)updateOverlayViewAtIndex:(unint64_t)a3;
@end

@implementation AKController

+ (AKController)controllerWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = [[AKController alloc] initWithDelegate:v3];

  return v4;
}

+ (id)akBundle
{
  v2 = [a1 akBundleIdentifier];
  id v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:v2];

  return v3;
}

+ (id)akBundleIdentifier
{
  return @"com.apple.AnnotationKit";
}

+ (BOOL)canConnectToStylus
{
  if (qword_2689251C0 != -1) {
    dispatch_once(&qword_2689251C0, &unk_26EA575D8);
  }
  return byte_2689251B8;
}

+ (BOOL)hasPressureCapableHardware
{
  if (qword_2689251D0 != -1) {
    dispatch_once(&qword_2689251D0, &unk_26EA57898);
  }
  return byte_2689251C8;
}

+ (BOOL)_isInLowMemoryEnvironment
{
  if (qword_2689251E0 != -1) {
    dispatch_once(&qword_2689251E0, &unk_26EA578B8);
  }
  return byte_2689251D8;
}

+ (id)markupBarButtonItemWithTarget:(id)a3 action:(SEL)a4
{
  return (id)MEMORY[0x270F9A6D0](AKMarkupBarButtonItem, sel_markupBarButtonWithTarget_action_);
}

- (AKController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AKController;
  v5 = [(AKController *)&v34 init];
  v6 = v5;
  if (v5)
  {
    [(AKController *)v5 setIsTestingInstance:0];
    [(AKController *)v6 setDelegate:v4];
    v7 = objc_opt_new();
    [(AKController *)v6 setStatisticsLogger:v7];

    v8 = +[AKSparseMutableControllerArray array];
    [(AKController *)v6 setPageControllers:v8];

    *(_WORD *)&v6->_selectNewlyCreatedAnnotations = 1;
    v9 = [MEMORY[0x263F08968] mapTableWithKeyOptions:512 valueOptions:512];
    [(AKController *)v6 setPageModelControllersToPageControllers:v9];

    [(AKController *)v6 setCurrentPageIndex:0x7FFFFFFFFFFFFFFFLL];
    [(AKController *)v6 setAllEditingDisabled:0];
    [(AKController *)v6 setAnnotationEditingEnabled:0];
    [(AKController *)v6 setFormFillingEnabled:0];
    [(AKController *)v6 setPencilAlwaysDraws:0];
    v10 = objc_alloc_init(AKModelController);
    [(AKController *)v6 setModelController:v10];

    v11 = [[AKUndoController alloc] initWithController:v6];
    [(AKController *)v6 setUndoController:v11];

    v12 = [[AKSidecarController alloc] initWithController:v6];
    [(AKController *)v6 setSidecarController:v12];

    v13 = [[AKLegacyDoodleController alloc] initWithController:v6];
    [(AKController *)v6 setLegacyDoodleController:v13];

    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v6 selector:sel_enclosingScrollViewDidScroll_ name:@"AKOverlayView.AKContentScrollViewVisibleRectChangeNotification" object:0];

    v15 = [[AKToolController alloc] initWithController:v6];
    [(AKController *)v6 setToolController:v15];

    v16 = [[AKAttributeController alloc] initWithController:v6];
    [(AKController *)v6 setAttributeController:v16];

    v17 = [[AKActionController alloc] initWithController:v6];
    [(AKController *)v6 setActionController:v17];

    v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithController:v6];
    [(AKController *)v6 setToolbarViewController:v18];

    v19 = [(AKController *)v6 toolbarViewController];
    v20 = [v19 view];
    [(AKController *)v6 setToolbarView:v20];

    id v21 = +[AKMainEventHandler newMainEventHandlerForCurrentPlatformWithController:v6];
    [(AKController *)v6 setMainEventHandler:v21];

    v22 = [[AKTextEditorController alloc] initWithController:v6];
    [(AKController *)v6 setTextEditorController:v22];

    v23 = [[AKSignatureModelController alloc] initWithController:v6];
    [(AKController *)v6 setSignatureModelController:v23];

    v24 = [[AKFormFeatureDetectorController alloc] initWithController:v6];
    [(AKController *)v6 setFormDetectionController:v24];

    v25 = [[AKHighlightAnnotationController alloc] initWithController:v6];
    [(AKController *)v6 setHighlightAnnotationController:v25];

    if (+[AKController canConnectToStylus])
    {
      v26 = objc_alloc_init(AKPeripheralAvailabilityManager_iOS);
      [(AKController *)v6 setPeripheralAvailabilityManager:v26];

      v27 = [(AKController *)v6 peripheralAvailabilityManager];
      [v27 startMonitoringForPeripheralConnection];
    }
    v28 = [[AKSignaturesController alloc] initWithController:v6];
    [(AKController *)v6 setSignaturesController:v28];

    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 addObserver:v6 selector:sel__didReceiveMemoryWarning_ name:*MEMORY[0x263F1D060] object:0];

    v30 = [(AKController *)v6 modelController];
    [v30 addObserver:v6 forKeyPath:@"pageModelControllers" options:3 context:@"AKController.modelObservationContext"];

    [(AKController *)v6 addObserver:v6 forKeyPath:@"currentPageIndex" options:3 context:@"AKController.pageIndexObservationContext"];
    v31 = [MEMORY[0x263F08A00] defaultCenter];
    [v31 addObserver:v6 selector:sel__pageModelControllerSelectedAnnotationsChangedNotification_ name:off_268923F60[0] object:0];

    v32 = [MEMORY[0x263F08A00] defaultCenter];
    [v32 addObserver:v6 selector:sel__didScrollPDFPage_ name:@"PDFScrollViewPageMayHaveChangedNotification" object:0];
  }
  return v6;
}

- (id)initForTesting
{
  v5.receiver = self;
  v5.super_class = (Class)AKController;
  v2 = [(AKController *)&v5 init];
  id v3 = v2;
  if (v2) {
    [(AKController *)v2 setIsTestingInstance:1];
  }
  return v3;
}

- (void)teardown
{
  v2 = self;
  uint64_t v44 = *MEMORY[0x263EF8340];
  [(AKController *)self setIsTornDown:1];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotificationName:@"AKControllerWillTeardownNotification" object:v2];

  if (![(AKController *)v2 isTestingInstance])
  {
    id v4 = [(AKController *)v2 undoController];
    objc_super v5 = [v4 undoManager];

    int v30 = [v5 isUndoRegistrationEnabled];
    if (v30) {
      [v5 disableUndoRegistration];
    }
    v31 = v5;
    [(AKController *)v2 resetToDefaultToolMode];
    v6 = [(AKController *)v2 mainEventHandler];
    [v6 teardown];

    v7 = [(AKController *)v2 toolbarViewController];
    [v7 teardown];

    v8 = [(AKController *)v2 peripheralAvailabilityManager];
    [v8 teardown];

    v9 = [(AKController *)v2 attributeController];
    [v9 setModelControllerToObserveForSelections:0];

    v10 = [(AKController *)v2 legacyDoodleController];
    v11 = [v10 shapeDetectionController];
    [v11 setModelControllerToObserveForAnnotationsAndSelections:0];

    v12 = [(AKController *)v2 modelController];
    [v12 removeObserver:v2 forKeyPath:@"pageModelControllers" context:@"AKController.modelObservationContext"];

    [(AKController *)v2 removeObserver:v2 forKeyPath:@"currentPageIndex" context:@"AKController.pageIndexObservationContext"];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v13 = [(AKController *)v2 modelController];
    v14 = [v13 pageModelControllers];

    obuint64_t j = v14;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v33 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          v18 = v2;
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(obj);
          }
          v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          v20 = [v19 annotations];
          uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v22; ++j)
              {
                if (*(void *)v35 != v23) {
                  objc_enumerationMutation(v20);
                }
                v25 = *(void **)(*((void *)&v34 + 1) + 8 * j);
                if ([v25 shouldObserveEdits]) {
                  [v25 setShouldObserveEdits:0];
                }
                if ([v25 shouldUseAppearanceOverride]) {
                  [v25 setShouldUseAppearanceOverride:0];
                }
                v26 = [v25 appearanceOverride];

                if (v26) {
                  [v25 setAppearanceOverride:0];
                }
              }
              uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
            }
            while (v22);
          }

          v2 = v18;
          v27 = [(AKController *)v18 sidecarController];
          [v27 stopObservingPageModelController:v19];

          v28 = [(AKController *)v18 undoController];
          [v28 stopObservingPageModelController:v19];
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v16);
    }

    [(AKController *)v2 setDelegate:0];
    [(AKController *)v2 setSignatureModelController:0];
    v29 = [MEMORY[0x263F08A00] defaultCenter];
    [v29 removeObserver:v2];

    [(AKController *)v2 setLegacyDoodleController:0];
    [(AKController *)v2 setTextEditorController:0];
    [(AKController *)v2 setMainEventHandler:0];
    [(AKController *)v2 setToolbarView:0];
    [(AKController *)v2 setToolbarViewController:0];
    [(AKController *)v2 setActionController:0];
    [(AKController *)v2 setAttributeController:0];
    [(AKController *)v2 setToolController:0];
    [(AKController *)v2 setUndoController:0];
    [(AKController *)v2 setModelController:0];
    [(AKController *)v2 setPeripheralAvailabilityManager:0];
    if (v30)
    {
      if (([v31 isUndoRegistrationEnabled] & 1) == 0) {
        [v31 enableUndoRegistration];
      }
    }
  }
}

- (void)dealloc
{
  AKLog(@"%s (If you do not see this in a debug build, we've got a world leak to fix.)");
  v3.receiver = self;
  v3.super_class = (Class)AKController;
  -[AKController dealloc](&v3, sel_dealloc, "-[AKController dealloc]");
}

- (void)_didScrollPDFPage:(id)a3
{
  id v4 = [(AKController *)self modernToolbarView];
  [v4 updateCurrentOverlaysToolPickerVisibility:self->_toolPickerVisibleBeforeTextEditing];
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  if (!self->_isEditingAnnotation) {
    self->_toolPickerVisibleBeforeTextEditing = [a3 isVisible];
  }
}

- (void)didBeginEditingAnnotation:(id)a3
{
  self->_isEditingAnnotation = 1;
  id v4 = [(AKController *)self modernToolbarView];
  self->_toolPickerVisibleBeforeTextEditing = [v4 isToolPickerVisible];
}

- (void)didEndEditingAnnotation:(id)a3
{
  self->_isEditingAnnotation = 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (a6 != @"AKController.pageIndexObservationContext")
  {
    if (a6 != @"AKController.modelObservationContext")
    {
      v107.receiver = self;
      v107.super_class = (Class)AKController;
      [(AKController *)&v107 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
      goto LABEL_75;
    }
    id v100 = v11;
    v17 = [v12 objectForKey:*MEMORY[0x263F081B0]];
    v18 = [v13 objectForKey:*MEMORY[0x263F081A8]];
    v19 = [v13 objectForKey:*MEMORY[0x263F081C8]];
    v20 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    v103 = v19;
    v104 = v18;
    v105 = v20;
    v96 = v17;
    v98 = v13;
    if (v19)
    {
      long long v118 = 0u;
      long long v119 = 0u;
      long long v116 = 0u;
      long long v117 = 0u;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v116 objects:v122 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v117;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v117 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void *)(*((void *)&v116 + 1) + 8 * i);
            v27 = [(AKController *)self undoController];
            [v27 stopObservingPageModelController:v26];

            v28 = [(AKController *)self sidecarController];
            [v28 stopObservingPageModelController:v26];

            v29 = [(AKController *)self pageModelControllersToPageControllers];
            int v30 = [v29 objectForKey:v26];

            v31 = [(AKController *)self undoController];
            v32 = [v31 undoManager];
            [v30 unregisterFromUndoManager:v32];

            [v30 teardown];
            uint64_t v33 = [(AKController *)self pageModelControllersToPageControllers];
            [v33 removeObjectForKey:v26];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v116 objects:v122 count:16];
        }
        while (v23);
      }

      v17 = v96;
      v13 = v98;
      v19 = v103;
      v18 = v104;
      v20 = v105;
    }
    if (v20)
    {
      long long v114 = 0u;
      long long v115 = 0u;
      long long v112 = 0u;
      long long v113 = 0u;
      id v34 = v20;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v112 objects:v121 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v113;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v113 != v37) {
              objc_enumerationMutation(v34);
            }
            -[AKController _setupPageModelController:](self, "_setupPageModelController:", *(void *)(*((void *)&v112 + 1) + 8 * j), v96, v98);
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v112 objects:v121 count:16];
        }
        while (v36);
      }

      v20 = v105;
    }
    if (objc_msgSend(v17, "unsignedIntegerValue", v96, v98) == 4 && objc_msgSend(v18, "count"))
    {
      unint64_t v39 = 0;
      do
      {
        if (v39 < [v19 count] && v39 < objc_msgSend(v20, "count"))
        {
          long long v40 = [v19 objectAtIndexedSubscript:v39];
          long long v41 = [v20 objectAtIndexedSubscript:v39];
          v42 = [(AKController *)self attributeController];
          v43 = [v42 modelControllerToObserveForSelections];

          if (v40 == v43)
          {
            uint64_t v44 = [(AKController *)self attributeController];
            [v44 setModelControllerToObserveForSelections:v41];
          }
          v45 = [(AKController *)self legacyDoodleController];
          v46 = [v45 shapeDetectionController];
          v47 = [v46 modelControllerToObserveForAnnotationsAndSelections];

          if (v40 == v47)
          {
            v48 = [(AKController *)self legacyDoodleController];
            v49 = [v48 shapeDetectionController];
            [v49 setModelControllerToObserveForAnnotationsAndSelections:v41];
          }
          v19 = v103;
          v18 = v104;
          v20 = v105;
        }
        ++v39;
      }
      while (v39 < [v18 count]);
    }
    v50 = v17;
    v51 = [(AKController *)self pageControllers];
    [v51 removeAllObjects];

    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    v52 = [(AKController *)self modelController];
    v53 = [v52 pageModelControllers];

    uint64_t v54 = [v53 countByEnumeratingWithState:&v108 objects:v120 count:16];
    if (v54)
    {
      uint64_t v55 = v54;
      uint64_t v106 = 0;
      uint64_t v56 = *(void *)v109;
      unint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (uint64_t k = 0; k != v55; ++k)
        {
          if (*(void *)v109 != v56) {
            objc_enumerationMutation(v53);
          }
          v59 = *(void **)(*((void *)&v108 + 1) + 8 * k);
          v60 = [MEMORY[0x263EFF9D0] null];
          char v61 = [v59 isEqual:v60];

          if ((v61 & 1) == 0)
          {
            v62 = [(AKController *)self pageModelControllersToPageControllers];
            v63 = [v62 objectForKey:v59];

            if (v63)
            {
              v64 = [(AKController *)self pageControllers];
              [v64 replaceObjectAtIndex:v106 + k withObject:v63];

              [v63 setPageIndex:v106 + k];
              if (v106 + k > v57 || v57 == 0x7FFFFFFFFFFFFFFFLL) {
                unint64_t v57 = v106 + k;
              }
            }
          }
        }
        uint64_t v55 = [v53 countByEnumeratingWithState:&v108 objects:v120 count:16];
        v106 += k;
      }
      while (v55);

      uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
      id v11 = v100;
      v67 = v97;
      v13 = v99;
      v68 = v103;
      if (v57 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([(AKController *)self currentPageIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v66 = v57;
        }
        else
        {
          uint64_t v66 = v57;
          if ([(AKController *)self currentPageIndex] < v57) {
            goto LABEL_64;
          }
        }
      }
    }
    else
    {

      uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
      id v11 = v100;
      v68 = v103;
      v67 = v50;
    }
    [(AKController *)self setCurrentPageIndex:v66];
LABEL_64:
    if ([(AKController *)self currentPageIndex] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v75 = [(AKController *)self modelController];
      v76 = [v75 pageModelControllers];
      v77 = objc_msgSend(v76, "objectAtIndex:", -[AKController currentPageIndex](self, "currentPageIndex"));

      v78 = [(AKController *)self attributeController];
      [v78 setModelControllerToObserveForSelections:v77];

      v79 = [(AKController *)self legacyDoodleController];
      v80 = [v79 shapeDetectionController];
      [v80 setModelControllerToObserveForAnnotationsAndSelections:v77];
    }
    goto LABEL_75;
  }
  v14 = [v12 objectForKey:*MEMORY[0x263F081C8]];
  uint64_t v15 = [v13 objectForKey:*MEMORY[0x263F081B8]];
  if (v14) {
    unint64_t v16 = [v14 unsignedIntegerValue];
  }
  else {
    unint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  id v102 = v10;
  if (v15) {
    uint64_t v69 = [v15 unsignedIntegerValue];
  }
  else {
    uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v16 != v69)
  {
    if ([(AKController *)self toolMode] == 6)
    {
      id v70 = v11;
      v71 = [(AKController *)self modelController];
      v72 = [v71 pageModelControllerForPage:v16];

      v73 = [v72 cropAnnotation];
      v74 = v73;
      if (v73 && [v73 cropApplied]) {
        [v74 setShowHandles:0];
      }
      else {
        [v72 removeCropToolAnnotation];
      }
      [(AKController *)self resetToDefaultToolMode];

      id v11 = v70;
    }
    [(AKController *)self setPasteCascadingMultiplier:0];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(AKController *)self pageControllers];
      v81 = id v101 = v11;
      unint64_t v82 = [v81 count];

      id v11 = v101;
      if (v16 < v82)
      {
        v83 = [(AKController *)self pageControllers];
        v84 = [v83 objectAtIndex:v16];

        v85 = [v84 pageModelController];
        v86 = [v85 mutableSetValueForKey:@"selectedAnnotations"];
        v87 = [MEMORY[0x263EFFA08] set];
        [v86 setSet:v87];

        id v11 = v101;
      }
    }
    if (v69 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v88 = [(AKController *)self pageControllers];
      v89 = [v88 objectAtIndex:v69];

      v90 = [v89 pageModelController];
      v91 = [(AKController *)self attributeController];
      [v91 setModelControllerToObserveForSelections:v90];

      v92 = [(AKController *)self legacyDoodleController];
      [v92 shapeDetectionController];
      v94 = id v93 = v11;
      [v94 setModelControllerToObserveForAnnotationsAndSelections:v90];

      id v11 = v93;
      v95 = [(AKController *)self modernToolbarView];
      [v95 updateCurrentOverlaysToolPickerVisibility];
    }
  }

  id v10 = v102;
LABEL_75:
}

- (void)_setupPageModelController:(id)a3
{
  id v9 = a3;
  id v4 = [v9 representedObject];
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_super v5 = +[AKPageController pageControllerWithController:self andPageModelController:v9];
    objc_msgSend(v5, "setShouldPixelate:", -[AKController overlayShouldPixelate](self, "overlayShouldPixelate"));
    v6 = [(AKController *)self pageModelControllersToPageControllers];
    [v6 setObject:v5 forKey:v9];

    v7 = [(AKController *)self undoController];
    [v7 startObservingPageModelController:v9];

    v8 = [(AKController *)self sidecarController];
    [v8 startObservingPageModelController:v9];
  }
}

- (void)enclosingScrollViewDidScroll:(id)a3
{
  id v4 = [(AKController *)self legacyDoodleController];
  objc_super v5 = [v4 shapeDetectionController];
  int v6 = [v5 isShowingCandidatePicker];

  if (v6)
  {
    id v8 = [(AKController *)self legacyDoodleController];
    v7 = [v8 shapeDetectionController];
    [v7 dismissCandidatePicker];
  }
}

- (BOOL)validateSender:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_23;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (char *)[v4 action];
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    v7 = [v6 actionsForTarget:0 forControlEvent:251658240];
    id v8 = [v7 firstObject];
    objc_super v5 = (char *)NSSelectorFromString(v8);
    if ((unint64_t)[v7 count] >= 2) {
      NSLog(&cfstr_WarningMultipl.isa, v6);
    }

    goto LABEL_11;
  }
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v4 methodSignatureForSelector:sel_action];
    if (!v6)
    {
      objc_super v5 = 0;
      goto LABEL_12;
    }
    v7 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v6];
    [v7 setSelector:sel_action];
    [v7 setTarget:v4];
    v13 = 0;
    [v7 invoke];
    [v7 getReturnValue:&v13];
    objc_super v5 = v13;
LABEL_11:

LABEL_12:
    goto LABEL_14;
  }
  objc_super v5 = 0;
LABEL_14:
  if (v5 == sel_undo_)
  {
    BOOL v11 = [(AKController *)self validateUndo:v4];
LABEL_34:
    char v10 = v11;
    goto LABEL_35;
  }
  if (v5 == sel_redo_)
  {
    BOOL v11 = [(AKController *)self validateRedo:v4];
    goto LABEL_34;
  }
  if (v5 == sel_cut_)
  {
    BOOL v11 = [(AKController *)self validateCut:v4];
    goto LABEL_34;
  }
  if (v5 == sel_copy_)
  {
    BOOL v11 = [(AKController *)self validateCopy:v4];
    goto LABEL_34;
  }
  if (v5 == sel_paste_)
  {
    BOOL v11 = [(AKController *)self validatePaste:v4];
    goto LABEL_34;
  }
  if (v5 == sel_delete_)
  {
    BOOL v11 = [(AKController *)self validateDelete:v4];
    goto LABEL_34;
  }
  if (v5 == sel_duplicate_)
  {
    BOOL v11 = [(AKController *)self validateDuplicate:v4];
    goto LABEL_34;
  }
  if (v5 == sel_selectAll_)
  {
    BOOL v11 = [(AKController *)self validateSelectAll:v4];
    goto LABEL_34;
  }
  if (v5 == sel_showAttributeInspector_)
  {
    BOOL v11 = [(AKController *)self validateShowAttributeInspector:v4];
    goto LABEL_34;
  }
LABEL_23:
  id v9 = [(AKController *)self actionController];
  char v10 = [v9 validateSender:v4];

LABEL_35:
  return v10;
}

- (void)performActionForSender:(id)a3
{
  id v9 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (char *)[v9 action];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v9;
      id v6 = [v5 actionsForTarget:0 forControlEvent:251658240];
      v7 = [v6 firstObject];
      id v4 = (char *)NSSelectorFromString(v7);
      if ((unint64_t)[v6 count] >= 2) {
        NSLog(&cfstr_WarningMultipl.isa, v5);
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  if (v4 == sel_undo_)
  {
    [(AKController *)self undo:v9];
  }
  else if (v4 == sel_redo_)
  {
    [(AKController *)self redo:v9];
  }
  else if (v4 == sel_cut_)
  {
    [(AKController *)self cut:v9];
  }
  else if (v4 == sel_copy_)
  {
    [(AKController *)self copy:v9];
  }
  else if (v4 == sel_paste_)
  {
    [(AKController *)self paste:v9];
  }
  else if (v4 == sel_delete_)
  {
    [(AKController *)self delete:v9];
  }
  else if (v4 == sel_duplicate_)
  {
    [(AKController *)self duplicate:v9];
  }
  else if (v4 == sel_selectAll_)
  {
    [(AKController *)self selectAll:v9];
  }
  else
  {
    if (v4 != sel_showAttributeInspector_)
    {
LABEL_18:
      id v8 = [(AKController *)self actionController];
      [v8 performActionForSender:v9];

      goto LABEL_28;
    }
    [(AKController *)self showAttributeInspector:v9];
  }
LABEL_28:
}

- (id)overlayViewAtIndex:(unint64_t)a3
{
  id v4 = [(AKController *)self pageControllers];
  id v5 = [v4 objectAtIndex:a3];

  id v6 = [v5 overlayView];

  return v6;
}

- (BOOL)isOverlayViewLoadedAtIndex:(unint64_t)a3
{
  id v4 = [(AKController *)self pageControllers];
  id v5 = [v4 objectAtIndex:a3];

  if (v5) {
    char v6 = [v5 relinquishablesAreLoaded];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)setRulerHostingDelegate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_rulerHostingDelegate, v4);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(AKController *)self pageControllers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        char v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) inkPageOverlayController];
        [v10 setRulerHostingDelegate:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)prepareOverlayAtIndex:(unint64_t)a3
{
  id v5 = [(AKController *)self pageControllers];
  id v8 = [v5 objectAtIndex:a3];

  [v8 setupRelinquishables];
  uint64_t v6 = [(AKController *)self rulerHostingDelegate];
  if (v6)
  {
    uint64_t v7 = [v8 inkPageOverlayController];
    [v7 setRulerHostingDelegate:v6];
  }
}

- (void)relinquishOverlayAtIndex:(unint64_t)a3
{
  id v4 = [(AKController *)self pageControllers];
  id v5 = [v4 objectAtIndex:a3];

  [v5 releaseRelinquishables];
}

- (void)updateOverlayViewAtIndex:(unint64_t)a3
{
  id v4 = [(AKController *)self pageControllers];
  id v6 = [v4 objectAtIndex:a3];

  if ([v6 relinquishablesAreLoaded])
  {
    id v5 = [v6 overlayView];
    [v5 updateLayers];
  }
}

- (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4
{
}

+ (void)renderAnnotation:(id)a3 inContext:(CGContext *)a4
{
}

- (void)setOverlayShouldPixelate:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->overlayShouldPixelate != a3)
  {
    BOOL v3 = a3;
    self->overlayShouldPixelate = a3;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [(AKController *)self pageControllers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          [v9 setShouldPixelate:v3];
          if ([v9 relinquishablesAreLoaded])
          {
            char v10 = [v9 layerPresentationManager];
            [v10 setShouldPixelate:v3];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)editTextAnnotation:(id)a3 selectAllText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(AKController *)self pageControllerForAnnotation:v6];
  uint64_t v7 = [(AKController *)self textEditorController];
  [v7 beginEditingAnnotation:v6 withPageController:v8 selectAllText:v4];
}

- (void)endEditingTextAnnotation
{
  BOOL v3 = [(AKController *)self textEditorController];
  int v4 = [v3 isEditing];

  if (v4)
  {
    id v5 = [(AKController *)self textEditorController];
    [v5 endEditing];
  }
}

- (void)commitEditing
{
  BOOL v3 = [(AKController *)self textEditorController];
  [v3 commitToModelWithoutEndingEditing];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 postNotificationName:AKControllerWillSaveNotification object:self];
}

- (int64_t)currentExifOrientationForPageAtIndex:(unint64_t)a3
{
  id v4 = [(AKController *)self pageControllers];
  id v5 = [v4 objectAtIndex:a3];

  int64_t v6 = [v5 currentModelToScreenExifOrientation];
  return v6;
}

- (double)currentModelBaseScaleFactorForPageAtIndex:(unint64_t)a3
{
  id v4 = [(AKController *)self pageControllers];
  id v5 = [v4 objectAtIndex:a3];

  [v5 modelBaseScaleFactor];
  double v7 = v6;

  return v7;
}

- (CGRect)contentAlignedRectForRect:(CGRect)a3 onPageAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = [(AKController *)self pageControllers];
  char v10 = [v9 objectAtIndex:a4];

  long long v11 = [v10 geometryHelper];
  objc_msgSend(v11, "contentAlignedRectForRect:", x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

+ (void)adjustAnnotationBoundsToFitText:(id)a3
{
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(AKController *)self mainEventHandler];
  char v6 = [v5 mainHandleEvent:v4 orRecognizer:0];

  return v6;
}

- (id)tapGestureRecognizer
{
  v2 = [(AKController *)self mainEventHandler];
  BOOL v3 = [v2 tapRecognizer];

  return v3;
}

- (id)doubleTapGestureRecognizer
{
  v2 = [(AKController *)self mainEventHandler];
  BOOL v3 = [v2 doubleTapRecognizer];

  return v3;
}

- (id)pressGestureRecognizer
{
  v2 = [(AKController *)self mainEventHandler];
  BOOL v3 = [v2 pressRecognizer];

  return v3;
}

- (id)panGestureRecognizer
{
  v2 = [(AKController *)self mainEventHandler];
  BOOL v3 = [v2 panRecognizer];

  return v3;
}

- (id)rotationGestureRecognizer
{
  v2 = [(AKController *)self mainEventHandler];
  BOOL v3 = [v2 rotationRecognizer];

  return v3;
}

- (void)_updateGestureDependencyPriority
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(AKController *)self pageControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        double v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) inkPageOverlayController];
        [v7 _updateGestureDependencyPriority];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)toolbarButtonItemOfType:(unint64_t)a3
{
  uint64_t v4 = [(AKController *)self toolbarViewController];
  uint64_t v5 = [v4 _toolbarButtonItemOfType:a3];

  return v5;
}

- (id)imageForToolbarButtonItemOfType:(unint64_t)a3
{
  return +[AKToolbarViewController imageForToolbarButtonItemOfType:a3];
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  self->_annotationEditingEnabled = a3;
  if (!a3)
  {
    uint64_t v4 = [(AKController *)self textEditorController];
    int v5 = [v4 isEditing];

    if (v5)
    {
      uint64_t v6 = [(AKController *)self textEditorController];
      [v6 endEditing];
    }
    if ([(AKController *)self supportForPencilAlwaysDrawsSatisfied])
    {
      id v7 = [(AKController *)self attributeController];
      [v7 resetToLastDrawingInk];
    }
  }
}

- (void)setFormFillingEnabled:(BOOL)a3
{
  self->_formFillingEnabled = a3;
  if (!a3)
  {
    uint64_t v4 = [(AKController *)self textEditorController];
    int v5 = [v4 isEditing];

    if (v5)
    {
      id v6 = [(AKController *)self textEditorController];
      [v6 endEditing];
    }
  }
}

- (id)keyCommandsForAnnotations
{
  cachedKeyCommands = self->_cachedKeyCommands;
  if (!cachedKeyCommands)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] arrayWithCapacity:5];
    int v5 = +[AKController akBundle];
    id v6 = [v5 localizedStringForKey:@"Copy" value:&stru_26EA57918 table:@"AKController"];
    id v7 = sub_237669EE0((uint64_t)v6, @"c", 0x100000, (uint64_t)sel_copy_, v6);
    [v4 addObject:v7];

    long long v8 = +[AKController akBundle];
    long long v9 = [v8 localizedStringForKey:@"Cut" value:&stru_26EA57918 table:@"AKController"];
    long long v10 = sub_237669EE0((uint64_t)v9, @"x", 0x100000, (uint64_t)sel_cut_, v9);
    [v4 addObject:v10];

    long long v11 = +[AKController akBundle];
    double v12 = [v11 localizedStringForKey:@"Paste" value:&stru_26EA57918 table:@"AKController"];
    uint64_t v13 = sub_237669EE0((uint64_t)v12, @"v", 0x100000, (uint64_t)sel_paste_, v12);
    [v4 addObject:v13];

    double v14 = +[AKController akBundle];
    double v15 = [v14 localizedStringForKey:@"Delete" value:&stru_26EA57918 table:@"AKController"];
    double v16 = sub_237669EE0((uint64_t)v15, @"\b", 0, (uint64_t)sel_delete_, v15);
    [v4 addObject:v16];

    double v17 = +[AKController akBundle];
    double v18 = [v17 localizedStringForKey:@"Duplicate" value:&stru_26EA57918 table:@"AKController"];
    double v19 = sub_237669EE0((uint64_t)v18, @"d", 0x100000, (uint64_t)sel_duplicate_, v18);
    [v4 addObject:v19];

    double v20 = (NSArray *)[v4 copy];
    double v21 = self->_cachedKeyCommands;
    self->_cachedKeyCommands = v20;

    cachedKeyCommands = self->_cachedKeyCommands;
  }

  return cachedKeyCommands;
}

- (BOOL)canPerformKeyCommandAction:(SEL)a3 withSender:(id)a4 handled:(BOOL *)a5
{
  id v8 = a4;
  if (v8 && [(NSArray *)self->_cachedKeyCommands containsObject:v8])
  {
    if (sel_duplicate_ == a3)
    {
      BOOL v12 = [(AKController *)self validateDuplicate:v8];
    }
    else if (sel_delete_ == a3)
    {
      BOOL v12 = [(AKController *)self validateDelete:v8];
    }
    else if (sel_cut_ == a3)
    {
      BOOL v12 = [(AKController *)self validateCut:v8];
    }
    else if (sel_copy_ == a3)
    {
      BOOL v12 = [(AKController *)self validateCopy:v8];
    }
    else
    {
      if (sel_paste_ != a3)
      {
        BOOL v9 = 0;
        goto LABEL_18;
      }
      BOOL v12 = [(AKController *)self validatePaste:v8];
    }
    BOOL v9 = v12;
LABEL_18:
    BOOL v10 = 1;
    if (!a5) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  BOOL v9 = 0;
  BOOL v10 = 0;
  if (a5) {
LABEL_10:
  }
    *a5 = v10;
LABEL_11:

  return v9;
}

- (void)setPencilAlwaysDraws:(BOOL)a3
{
  self->_pencilAlwaysDraws = +[AKController canConnectToStylus] && a3;
}

- (unint64_t)toolMode
{
  v2 = [(AKController *)self toolController];
  unint64_t v3 = [v2 toolMode];

  return v3;
}

- (void)setToolMode:(unint64_t)a3
{
  id v4 = [(AKController *)self toolController];
  [v4 setToolMode:a3];
}

- (void)resetToDefaultToolMode
{
  id v2 = [(AKController *)self toolController];
  [v2 resetToDefaultMode];
}

- (void)applyCurrentCrop
{
  if ([(AKController *)self toolMode] == 6)
  {
    unint64_t v3 = [(AKController *)self modelController];
    objc_msgSend(v3, "pageModelControllerForPage:", -[AKController currentPageIndex](self, "currentPageIndex"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();

    id v4 = [v5 cropAnnotation];
    [v4 setCropApplied:1];
    [(AKController *)self resetToDefaultToolMode];
  }
}

- (void)clearUndoStack
{
  id v3 = [(AKController *)self undoController];
  id v2 = [v3 undoManager];
  [v2 removeAllActions];
}

- (BOOL)supportsImageDescriptionEditing
{
  id v2 = [(AKController *)self delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v3 = [v2 supportsImageDescriptionEditing];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)supportsFormFill
{
  id v2 = [(AKController *)self delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    char v3 = [v2 supportsFormFill];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)originalOrModifiedImageDescription
{
  char v3 = [(AKController *)self modifiedImageDescription];
  if (!v3)
  {
    id v4 = [(AKController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      char v3 = [v4 originalImageDescription];
    }
    else
    {
      char v3 = 0;
    }
  }

  return v3;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"modifiedImageDescription"])
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___AKController;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_automaticallyNotifiesObserversForKey_, v4);
  }

  return v5;
}

- (void)setModifiedImageDescription:(id)a3
{
  id v8 = (NSString *)a3;
  if (self->_modifiedImageDescription != v8)
  {
    unsigned __int8 v5 = [(AKController *)self originalOrModifiedImageDescription];
    if ((v5 || -[NSString length](v8, "length")) && ([v5 isEqualToString:v8] & 1) == 0)
    {
      id v6 = [(AKController *)self undoController];
      objc_super v7 = [v6 undoManager];
      [v7 registerUndoWithTarget:self selector:sel_setModifiedImageDescription_ object:self->_modifiedImageDescription];

      [(AKController *)self willChangeValueForKey:@"modifiedImageDescription"];
      objc_storeStrong((id *)&self->_modifiedImageDescription, a3);
      [(AKController *)self didChangeValueForKey:@"modifiedImageDescription"];
    }
  }
}

- (void)delayedUndoControllerSetup
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v3 = [[AKUndoController alloc] initWithController:self];
  [(AKController *)self setUndoController:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(AKController *)self pageControllers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        BOOL v10 = [(AKController *)self undoController];
        long long v11 = [v9 pageModelController];
        [v10 startObservingPageModelController:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (void)undo:(id)a3
{
  if ([(AKController *)self validateUndo:0])
  {
    id v4 = [(AKController *)self textEditorController];
    [v4 endEditing];

    id v6 = [(AKController *)self undoController];
    uint64_t v5 = [v6 undoManager];
    [v5 undo];
  }
}

- (BOOL)validateUndo:(id)a3
{
  char v3 = [(AKController *)self undoController];
  id v4 = [v3 undoManager];

  LOBYTE(v3) = [v4 canUndo];
  return (char)v3;
}

- (void)redo:(id)a3
{
  if ([(AKController *)self validateRedo:0])
  {
    id v5 = [(AKController *)self undoController];
    id v4 = [v5 undoManager];
    [v4 redo];
  }
}

- (BOOL)validateRedo:(id)a3
{
  char v3 = [(AKController *)self undoController];
  id v4 = [v3 undoManager];

  LOBYTE(v3) = [v4 canRedo];
  return (char)v3;
}

- (void)cut:(id)a3
{
  id v8 = a3;
  if ([(AKController *)self validateCut:0])
  {
    [(AKController *)self copy:v8];
    [(AKController *)self setPasteCascadingMultiplier:0];
    [(AKController *)self delete:v8];
    id v4 = [(AKController *)self undoController];
    id v5 = [v4 undoManager];
    id v6 = +[AKController akBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Cut" value:&stru_26EA57918 table:@"AKController"];
    [v5 setActionName:v7];
  }
}

- (void)copy:(id)a3
{
  if ([(AKController *)self validateCopy:0])
  {
    id v4 = [(AKController *)self modelController];
    id v6 = [v4 allSelectedAnnotations];

    if ([v6 count])
    {
      id v5 = [MEMORY[0x263F1C840] generalPasteboard];
      [v5 akClearContents];
      [v5 akPasteboardSetAnnotations:v6];
      -[AKController setLastPasteboardChangeCount:](self, "setLastPasteboardChangeCount:", [v5 changeCount]);
      [(AKController *)self setPasteCascadingMultiplier:1];
    }
  }
}

- (void)paste:(id)a3
{
  if ([(AKController *)self validatePaste:0])
  {
    id v20 = [MEMORY[0x263F1C840] generalPasteboard];
    id v4 = [v20 akPasteboardAnnotations];
    if ([v4 count])
    {
      uint64_t v5 = [v20 changeCount];
      if ([(AKController *)self lastPasteboardChangeCount] != v5)
      {
        [(AKController *)self setLastPasteboardChangeCount:v5];
        [(AKController *)self setPasteCascadingMultiplier:0];
      }
      id v6 = [(AKController *)self currentPageController];
      uint64_t v7 = [v6 pageModelController];
      int v8 = [v7 hasMaskBorderAnnotation];

      if (v8)
      {
        BOOL v9 = [v4 indexesOfObjectsPassingTest:&unk_26EA57718];
        uint64_t v10 = [v4 objectsAtIndexes:v9];

        id v4 = (void *)v10;
      }
      if ([v4 count])
      {
        +[AKToolController cascadeAnnotations:v4 onPageController:v6 forPaste:1];
        long long v11 = [v6 pageModelController];
        long long v12 = [v11 mutableArrayValueForKey:@"annotations"];
        [v12 addObjectsFromArray:v4];

        long long v13 = [v6 pageModelController];
        long long v14 = [v13 mutableSetValueForKey:@"selectedAnnotations"];
        long long v15 = [MEMORY[0x263EFFA08] setWithArray:v4];
        [v14 setSet:v15];

        double v16 = [(AKController *)self undoController];
        uint64_t v17 = [v16 undoManager];
        double v18 = +[AKController akBundle];
        double v19 = [v18 localizedStringForKey:@"Paste" value:&stru_26EA57918 table:@"AKController"];
        [v17 setActionName:v19];
      }
    }
  }
}

- (BOOL)validatePaste:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F1C840] generalPasteboard];
  if ([v5 akPasteboardContainsAnnotations])
  {
    id v6 = [(AKController *)self currentPageController];
    uint64_t v7 = [v6 pageModelController];
    int v8 = [v7 hasMaskBorderAnnotation];

    if (v8)
    {
      BOOL v9 = [v5 akPasteboardAnnotations];
      uint64_t v13 = 0;
      long long v14 = &v13;
      uint64_t v15 = 0x2020000000;
      char v16 = 0;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = sub_23766ADE8;
      v12[3] = &unk_264CDB598;
      v12[4] = &v13;
      [v9 enumerateObjectsUsingBlock:v12];
      BOOL v10 = *((unsigned char *)v14 + 24) != 0;
      _Block_object_dispose(&v13, 8);
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)delete:(id)a3
{
  if ([(AKController *)self validateDelete:0])
  {
    id v4 = [(AKController *)self modelController];
    [v4 deleteAllSelectedAnnotations];

    id v8 = [(AKController *)self undoController];
    uint64_t v5 = [v8 undoManager];
    id v6 = +[AKController akBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Delete" value:&stru_26EA57918 table:@"AKController"];
    [v5 setActionName:v7];
  }
}

- (BOOL)validateDelete:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(AKController *)self _validateCutCopyDelete]) {
    return 0;
  }
  id v4 = [(AKController *)self textEditorController];
  int v5 = [v4 isEditing];

  if (!v5) {
    return 1;
  }
  id v6 = [(AKController *)self modelController];
  uint64_t v7 = [v6 allSelectedAnnotations];

  id v8 = [v7 indexesOfObjectsPassingTest:&unk_26EA57738];
  BOOL v9 = [v7 objectsAtIndexes:v8];

  memset(v15, 0, sizeof(v15));
  if ([v9 countByEnumeratingWithState:v15 objects:v16 count:16])
  {
    uint64_t v10 = **((void **)&v15[0] + 1);
    uint64_t v11 = [(AKController *)self textEditorController];
    long long v12 = [(id)v11 annotation];

    LOBYTE(v11) = [v12 isEqual:v10];
    char v13 = v11 ^ 1;
  }
  else
  {
    char v13 = 1;
  }

  return v13;
}

- (void)duplicate:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if ([(AKController *)self validateDuplicate:a3])
  {
    id v4 = [(AKController *)self modelController];
    int v5 = [v4 allSelectedAnnotations];

    id v6 = [v5 indexesOfObjectsPassingTest:&unk_26EA57758];
    uint64_t v7 = [v5 objectsAtIndexes:v6];

    if ([v7 count])
    {
      id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v29 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            objc_msgSend(v14, "setIsBeingCopied:", 1, (void)v28);
            uint64_t v15 = (void *)[v14 copy];
            [v14 setIsBeingCopied:0];
            if (v15) {
              [v8 addObject:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v11);
      }

      char v16 = [(AKController *)self currentPageController];
      uint64_t v17 = [(AKController *)self lastCreationCascadingPageController];
      unint64_t v18 = [(AKController *)self creationCascadingMultiplier];
      [(AKController *)self setLastCreationCascadingPageController:v16];
      [(AKController *)self setCreationCascadingMultiplier:1];
      +[AKToolController cascadeAnnotations:v8 onPageController:v16 forPaste:0];
      [(AKController *)self setLastCreationCascadingPageController:v17];
      [(AKController *)self setCreationCascadingMultiplier:v18];
      double v19 = [v16 pageModelController];
      id v20 = [v19 mutableArrayValueForKey:@"annotations"];
      [v20 addObjectsFromArray:v8];

      double v21 = [v16 pageModelController];
      double v22 = [v21 mutableSetValueForKey:@"selectedAnnotations"];
      double v23 = [MEMORY[0x263EFFA08] setWithArray:v8];
      [v22 setSet:v23];

      uint64_t v24 = [(AKController *)self undoController];
      v25 = [v24 undoManager];
      uint64_t v26 = +[AKController akBundle];
      v27 = [v26 localizedStringForKey:@"Duplicate" value:&stru_26EA57918 table:@"AKController"];
      [v25 setActionName:v27];
    }
  }
}

- (BOOL)validateDuplicate:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = [(AKController *)self modelController];
  int v5 = [v4 allSelectedAnnotations];

  id v8 = [v5 indexesOfObjectsPassingTest:&unk_26EA57778];
  id v6 = [v5 objectsAtIndexes:v8];

  uint64_t v7 = [(AKController *)self textEditorController];
  LODWORD(v8) = [v7 isEditing];

  if (v8)
  {
    id v9 = [(AKController *)self textEditorController];
    uint64_t v10 = [v9 annotation];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v6;
    id v8 = (void *)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v12 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v11);
          }
          if (objc_msgSend(v10, "isEqual:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18))
          {
            LODWORD(v8) = 1;
            goto LABEL_12;
          }
        }
        id v8 = (void *)[v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  uint64_t v14 = objc_msgSend(v6, "count", (void)v18);
  if (v8) {
    BOOL v15 = 1;
  }
  else {
    BOOL v15 = v14 == 0;
  }
  BOOL v16 = !v15;

  return v16;
}

- (void)selectAll:(id)a3
{
  id v4 = [(AKController *)self currentPageController];
  char v3 = [v4 pageModelController];
  [v3 selectAllAnnotations];
}

- (BOOL)validateSelectAll:(id)a3
{
  char v3 = [(AKController *)self currentPageController];
  id v4 = [v3 pageModelController];

  int v5 = [v4 annotations];
  uint64_t v6 = [v5 count];

  uint64_t v7 = [v4 cropAnnotation];

  return v6 - (v7 != 0) > 0;
}

- (BOOL)validateShowAttributeInspector:(id)a3
{
  return 0;
}

- (void)editTextAnnotation:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = [(AKController *)self modelController];
  int v5 = [v4 allSelectedAnnotations];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  id v8 = v6;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v16;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v16 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
      if (objc_msgSend(v12, "conformsToAKTextAnnotationProtocol", (void)v15)) {
        break;
      }
      if (v9 == ++v11)
      {
        uint64_t v9 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          goto LABEL_3;
        }
        id v8 = v6;
        goto LABEL_12;
      }
    }
    id v8 = v12;

    if (!v8) {
      goto LABEL_13;
    }
    char v13 = [(AKController *)self pageControllerForAnnotation:v8];
    uint64_t v14 = [(AKController *)self textEditorController];
    [v14 beginEditingAnnotation:v8 withPageController:v13 selectAllText:0];
  }
LABEL_12:

LABEL_13:
}

- (BOOL)validateEditTextAnnotation:(id)a3
{
  id v4 = [(AKController *)self modelController];
  int v5 = [v4 allSelectedAnnotations];

  if ([v5 count] == 1)
  {
    id v6 = [v5 firstObject];
    BOOL v7 = [(AKController *)self canBeginEditingTextAnnotation:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)canBeginEditingTextAnnotation:(id)a3
{
  id v4 = a3;
  if (([(AKController *)self annotationEditingEnabled]
     || [(AKController *)self formFillingEnabled])
    && [v4 conformsToAKTextAnnotationProtocol])
  {
    id v5 = v4;
    id v6 = [(AKController *)self textEditorController];
    char v7 = [v6 isEditing];

    if (v7)
    {
      char v8 = 0;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v10 = [v5 annotationText];
      BOOL v11 = [v10 length] != 0;

      char v8 = isKindOfClass | v11;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (void)showSelectionMenu:(id)a3
{
  v44[2] = *MEMORY[0x263EF8340];
  id v4 = [(AKController *)self currentPageController];
  id v5 = [v4 overlayView];
  [v5 becomeFirstResponder];

  id v6 = [v4 pageModelController];
  char v7 = [v6 selectedAnnotations];

  if ([v7 count])
  {
    [(AKController *)self _popoverAnchorFrameInModelForAnnotations:v7];
    objc_msgSend(v4, "convertRectFromModelToOverlay:");
    double v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v4 visibleRectOfOverlay];
    objc_msgSend(v4, "convertRectFromModelToOverlay:");
    CGFloat x = v45.origin.x;
    CGFloat y = v45.origin.y;
    CGFloat width = v45.size.width;
    CGFloat height = v45.size.height;
    uint64_t v20 = j__NSStringFromCGRect(v45);
    NSLog(&cfstr_SVisiblerectof.isa, "-[AKController showSelectionMenu:]", v20);

    v46.origin.CGFloat x = v9;
    v46.origin.CGFloat y = v11;
    v46.size.CGFloat width = v13;
    v46.size.CGFloat height = v15;
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    CGRect v47 = CGRectIntersection(v46, v48);
    double v21 = v47.origin.x;
    double v22 = v47.origin.y;
    double v23 = v47.size.width;
    double v24 = v47.size.height;
    BOOL IsNull = CGRectIsNull(v47);
    if (IsNull)
    {
      double v26 = v11;
    }
    else
    {
      double v9 = v21;
      double v26 = v22;
    }
    if (IsNull) {
      double v27 = v13;
    }
    else {
      double v27 = v23;
    }
    if (IsNull) {
      double v24 = v15;
    }
    long long v28 = [v4 overlayView];
    long long v29 = [MEMORY[0x263F1C7B0] sharedMenuController];
    id v30 = objc_alloc(MEMORY[0x263F1C7B8]);
    long long v31 = +[AKController akBundle];
    v32 = [v31 localizedStringForKey:@"STRING_EDIT_BUTTON" value:@"Edit" table:@"AKController"];
    uint64_t v33 = (void *)[v30 initWithTitle:v32 action:sel_editTextAnnotation_];

    id v34 = objc_alloc(MEMORY[0x263F1C7B8]);
    uint64_t v35 = +[AKController akBundle];
    uint64_t v36 = [v35 localizedStringForKey:@"STRING_DUPLICATE_BUTTON" value:@"Duplicate" table:@"AKController"];
    uint64_t v37 = (void *)[v34 initWithTitle:v36 action:sel_duplicate_];

    if ([(AKController *)self validateEditTextAnnotation:self])
    {
      v44[0] = v33;
      v44[1] = v37;
      long long v38 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v39 = (void **)v44;
      uint64_t v40 = 2;
    }
    else
    {
      v43 = v37;
      long long v38 = (void *)MEMORY[0x263EFF8C0];
      unint64_t v39 = &v43;
      uint64_t v40 = 1;
    }
    v42 = [v38 arrayWithObjects:v39 count:v40];
    [v29 setMenuItems:v42];

    if ([v29 isMenuVisible])
    {
      [v29 update];
    }
    else if (([v28 isFirstResponder] & 1) == 0)
    {
      [v28 becomeFirstResponder];
      objc_msgSend(v29, "showMenuFromView:rect:", v28, v9, v26, v27, v24);
      [v28 resignFirstResponder];
      goto LABEL_19;
    }
    objc_msgSend(v29, "showMenuFromView:rect:", v28, v9, v26, v27, v24);
LABEL_19:

    goto LABEL_20;
  }
  long long v41 = [MEMORY[0x263F1C7B0] sharedMenuController];
  [v41 hideMenu];

LABEL_20:
}

- (void)hideSelectionMenu:(id)a3
{
  objc_msgSend(MEMORY[0x263F1C7B0], "sharedMenuController", a3);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 hideMenu];
}

- (void)highlightableSelectionChanged
{
  id v3 = [(AKController *)self toolController];
  uint64_t v4 = [v3 toolMode];

  if (v4 == 3)
  {
    id v5 = [(AKController *)self highlightAnnotationController];
    [v5 continueHighlighting];
  }
}

- (void)highlightableSelectionWillBeginChanging
{
  id v3 = [(AKController *)self toolController];
  uint64_t v4 = [v3 toolMode];

  if (v4 == 3)
  {
    id v5 = [(AKController *)self highlightAnnotationController];
    [v5 beginContinuousHighlighting];
  }
}

- (void)highlightableSelectionDidEndChanging
{
  id v3 = [(AKController *)self toolController];
  uint64_t v4 = [v3 toolMode];

  if (v4 == 3)
  {
    id v5 = [(AKController *)self highlightAnnotationController];
    [v5 endContinuousHighlighting];
  }
}

- (void)setSelectNewlyCreatedAnnotations:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selectNewlyCreatedAnnotations = a3;
  id v4 = [(AKController *)self legacyDoodleController];
  [v4 setSelectNewlyCreatedAnnotations:v3];
}

+ (id)colorForHighlightAttributeWithTag:(int64_t)a3
{
  return +[AKHighlightAppearanceHelper colorForHighlightAttributeWithTag:a3];
}

- (void)addPopupToAnnotation:(id)a3 openPopup:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = -[AKController pageControllerForAnnotation:](self, "pageControllerForAnnotation:");
  char v7 = v6;
  if (v6) {
    [v6 addPopupToAnnotation:v8 openPopup:v4];
  }
}

- (void)removeNoteFromAnnotation:(id)a3
{
  id v6 = a3;
  BOOL v4 = -[AKController pageControllerForAnnotation:](self, "pageControllerForAnnotation:");
  id v5 = v4;
  if (v4) {
    [v4 removeNoteFromAnnotation:v6];
  }
}

- (BOOL)onlyDrawWithApplePencil
{
  return MEMORY[0x270F9A6D0](MEMORY[0x263F1C848], sel_prefersPencilOnlyDrawing);
}

- (PKToolPicker)toolPicker
{
  id v2 = [(AKController *)self modernToolbarView];
  BOOL v3 = [v2 toolPicker];

  return (PKToolPicker *)v3;
}

- (void)_didReceiveMemoryWarning:(id)a3
{
}

- (BOOL)_validateCutCopyDelete
{
  id v2 = [(AKController *)self modelController];
  BOOL v3 = [v2 allSelectedAnnotations];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)shouldDrawVariableStrokeDoodles
{
  if ([(id)objc_opt_class() canConnectToStylus])
  {
    BOOL v3 = [(AKController *)self peripheralAvailabilityManager];
    uint64_t v4 = [v3 currentAvailability];

    if (v4 == 1) {
      return 1;
    }
  }
  uint64_t v6 = objc_opt_class();

  return MEMORY[0x270F9A6D0](v6, sel_hasPressureCapableHardware);
}

- (BOOL)supportForPencilAlwaysDrawsSatisfied
{
  BOOL v3 = +[AKController canConnectToStylus];
  if (v3)
  {
    LOBYTE(v3) = [(AKController *)self pencilAlwaysDraws];
  }
  return v3;
}

- (void)_toolpicker_setColor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v19 = v4;
  uint64_t v6 = [(AKController *)v5 currentPageController];
  char v7 = [v6 pageModelController];

  id v8 = [v7 selectedAnnotations];
  uint64_t v9 = [v8 count];

  if (!v9)
  {
    CGFloat v13 = [(AKController *)v5 attributeController];
    double v14 = [v13 ink];

    CGFloat v15 = (void *)MEMORY[0x263F14B48];
    long long v16 = [(AKMinimalTextColorUserInterfaceItem *)v14 identifier];
    [(AKMinimalTextColorUserInterfaceItem *)v14 weight];
    long long v17 = objc_msgSend(v15, "inkWithIdentifier:color:weight:", v16, v19);

    long long v18 = [(AKMinimalUserInterfaceItem *)[AKMinimalInkChooserUserInterfaceItem alloc] initWithTag:765300];
    [(AKMinimalInkChooserUserInterfaceItem *)v18 setInk:v17];
    [(AKController *)v5 performActionForSender:v18];

LABEL_8:
    goto LABEL_10;
  }
  int64_t v10 = +[AKToolbarUtilities attributeTagForCurrentSelectionState:v5];
  if (v10 == 765106)
  {
    CGFloat v11 = [AKMinimalTextColorUserInterfaceItem alloc];
    uint64_t v12 = 765106;
    goto LABEL_7;
  }
  if (v10 == 765101)
  {
    CGFloat v11 = [AKMinimalColorChooserUserInterfaceItem alloc];
    uint64_t v12 = 765101;
LABEL_7:
    double v14 = [(AKMinimalUserInterfaceItem *)v11 initWithTag:v12];
    [(AKMinimalColorChooserUserInterfaceItem *)v14 setColor:v19];
    [(AKController *)v5 performActionForSender:v14];
    goto LABEL_8;
  }
  NSLog(&cfstr_SCalledWithInc.isa, "-[AKController _toolpicker_setColor:]", v10);
LABEL_10:
}

- (id)_toolpicker_color
{
  id v2 = [(AKController *)self attributeController];
  BOOL v3 = [v2 strokeColor];

  return v3;
}

- (void)_toolpicker_setInkIdentifier:(id)a3
{
  double v14 = self;
  id v4 = a3;
  id v5 = [(AKController *)v14 attributeController];
  uint64_t v6 = [v5 ink];

  char v7 = (void *)MEMORY[0x263F14B48];
  id v8 = [v6 color];
  [v6 weight];
  uint64_t v9 = objc_msgSend(v7, "inkWithIdentifier:color:weight:", v4, v8);

  int64_t v10 = [(AKMinimalUserInterfaceItem *)[AKMinimalInkChooserUserInterfaceItem alloc] initWithTag:765300];
  [(AKMinimalInkChooserUserInterfaceItem *)v10 setInk:v9];
  [(AKController *)v14 performActionForSender:v10];
  CGFloat v11 = [(AKController *)v14 toolController];
  uint64_t v12 = [v11 toolMode];

  if (v12 != 4 && [(AKController *)v14 annotationEditingEnabled])
  {
    CGFloat v13 = [[AKMinimalUserInterfaceItem alloc] initWithTag:764017];
    [(AKController *)v14 performActionForSender:v13];
  }
}

- (id)_toolpicker_inkIdentifier
{
  id v2 = [(AKController *)self attributeController];
  BOOL v3 = [v2 ink];
  id v4 = [v3 identifier];

  return v4;
}

- (id)currentPageController
{
  BOOL v3 = [(AKController *)self pageControllers];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [(AKController *)self pageControllers];
    uint64_t v6 = objc_msgSend(v5, "objectAtIndex:", -[AKController currentPageIndex](self, "currentPageIndex"));
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)pageControllerForPageModelController:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(AKController *)self pageControllers];
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [v9 pageModelController];

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)pageControllerForAnnotation:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(AKController *)self modelController];
  id v6 = [v5 pageModelControllers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 containsAnnotation:v4])
        {
          long long v13 = [(AKController *)self pageModelControllersToPageControllers];
          long long v12 = [v13 objectForKey:v11];

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  long long v12 = 0;
LABEL_11:

  return v12;
}

- (CGRect)_popoverAnchorFrameInModelForAnnotations:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [v3 anyObject];
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      [v4 midPoint];
      double v6 = v26 + -5.0;
      double MidY = v27 + -5.0;
      double v12 = 10.0;
      double v10 = 10.0;
    }
    else
    {
      [v4 drawingBounds];
      double v6 = v5;
      double MidY = v7;
      double v10 = v9;
      double v12 = v11;
    }
  }
  else
  {
    CGFloat v14 = *MEMORY[0x263F00190];
    CGFloat v13 = *(double *)(MEMORY[0x263F00190] + 8);
    CGFloat v16 = *(double *)(MEMORY[0x263F00190] + 16);
    CGFloat v15 = *(double *)(MEMORY[0x263F00190] + 24);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v3;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v21), "drawingBounds", (void)v32);
          CGFloat x = v38.origin.x;
          CGFloat y = v38.origin.y;
          CGFloat width = v38.size.width;
          CGFloat height = v38.size.height;
          if (!CGRectIsInfinite(v38))
          {
            v39.origin.CGFloat x = v14;
            v39.origin.CGFloat y = v13;
            v39.size.CGFloat width = v16;
            v39.size.CGFloat height = v15;
            if (CGRectIsInfinite(v39))
            {
              CGFloat v15 = height;
              CGFloat v16 = width;
              CGFloat v13 = y;
              CGFloat v14 = x;
            }
            else
            {
              v40.origin.CGFloat x = v14;
              v40.origin.CGFloat y = v13;
              v40.size.CGFloat width = v16;
              v40.size.CGFloat height = v15;
              v45.origin.CGFloat x = x;
              v45.origin.CGFloat y = y;
              v45.size.CGFloat width = width;
              v45.size.CGFloat height = height;
              CGRect v41 = CGRectUnion(v40, v45);
              CGFloat v14 = v41.origin.x;
              CGFloat v13 = v41.origin.y;
              CGFloat v16 = v41.size.width;
              CGFloat v15 = v41.size.height;
            }
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }

    v42.origin.CGFloat x = v14;
    v42.origin.CGFloat y = v13;
    v42.size.CGFloat width = v16;
    v42.size.CGFloat height = v15;
    v43.origin.CGFloat x = CGRectGetMidX(v42);
    double v6 = v43.origin.x;
    v43.origin.CGFloat y = v13;
    v43.size.CGFloat width = v16;
    v43.size.CGFloat height = v15;
    double MidY = CGRectGetMidY(v43);
    double v12 = 1.0;
    double v10 = 1.0;
  }

  double v28 = v6;
  double v29 = MidY;
  double v30 = v10;
  double v31 = v12;
  result.size.CGFloat height = v31;
  result.size.CGFloat width = v30;
  result.origin.CGFloat y = v29;
  result.origin.CGFloat x = v28;
  return result;
}

- (BOOL)isPresentingPopover
{
  id v3 = [(AKController *)self toolbarViewController];
  char v4 = [v3 isPresentingPopover];

  if (v4) {
    return 1;
  }
  double v6 = [(AKController *)self modernToolbarView];
  char v7 = [v6 isPresentingPopover];

  return v7;
}

- (void)setHideAllAdornments:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (self->_hideAllAdornments != a3)
  {
    BOOL v3 = a3;
    self->_hideAllAdornments = a3;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = [(AKController *)self pageControllers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ([v10 relinquishablesAreLoaded])
          {
            double v11 = [v10 layerPresentationManager];
            [v11 setAdornmentsHidden:v3];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    [MEMORY[0x263F158F8] commit];
  }
}

- (void)_pageModelControllerSelectedAnnotationsChangedNotification:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  char v4 = [a3 object];
  double v5 = [(AKController *)self modelController];
  uint64_t v6 = [v5 pageModelControllers];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    uint64_t v16 = AKSelectionChangedPageModelControllerKey;
    v17[0] = v4;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    double v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 postNotificationName:AKSelectionChangedNotification object:self userInfo:v8];

    [(AKController *)self _updateGestureDependencyPriority];
    double v10 = [(AKController *)self modelController];
    double v11 = [v10 allSelectedAnnotations];

    if ([v11 count])
    {
      long long v12 = [(AKController *)self currentPageController];
      long long v13 = [v12 overlayView];

      if (v13 && ([v13 isFirstResponder] & 1) == 0)
      {
        long long v14 = [v13 firstResponder];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || ([v14 isDescendantOfView:v13] & 1) == 0)
        {
          long long v15 = [(AKController *)self modernToolbarView];
          [v15 updateCurrentOverlaysToolPickerVisibility];

          [v13 becomeFirstResponder];
        }
      }
    }
    else
    {
      [(AKController *)self hideSelectionMenu:0];
    }
  }
}

- (void)strokeAddedNotification:(id)a3
{
  char v4 = [a3 object];
  if (v4 == self)
  {
    uint64_t v8 = v4;
    double v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    int v7 = [(AKController *)self statisticsLogger];
    [v7 logInkAnnotationStrokeAdded:v6];

    char v4 = v8;
  }
}

- (void)beginLogging:(id)a3 documentType:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!v11 || !v6) {
    NSLog(&cfstr_WarningMissing.isa);
  }
  int v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_strokeAddedNotification_ name:off_268923710 object:0];

  uint64_t v8 = [(AKController *)self statisticsLogger];
  [v8 setClientPrefix:v11];

  double v9 = [(AKController *)self statisticsLogger];
  [v9 setDocumentType:v6];

  double v10 = [(AKController *)self statisticsLogger];
  [v10 resetLogging];
}

- (void)endLogging
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:off_268923710 object:0];

  char v4 = [(AKController *)self statisticsLogger];
  [v4 logDocumentSaved];

  id v5 = [(AKController *)self statisticsLogger];
  [v5 resetLogging];
}

- (BOOL)isUsedOnDarkBackground
{
  return self->_isUsedOnDarkBackground;
}

- (void)setIsUsedOnDarkBackground:(BOOL)a3
{
  self->_isUsedOnDarkBackground = a3;
}

- (BOOL)overlayShouldPixelate
{
  return self->overlayShouldPixelate;
}

- (BOOL)isTornDown
{
  return self->_isTornDown;
}

- (void)setIsTornDown:(BOOL)a3
{
  self->_isTornDown = a3;
}

- (AKControllerDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKControllerDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AKModelController)modelController
{
  return (AKModelController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModelController:(id)a3
{
}

- (UIView)toolbarView
{
  return (UIView *)objc_getProperty(self, a2, 40, 1);
}

- (void)setToolbarView:(id)a3
{
}

- (BOOL)allEditingDisabled
{
  return self->_allEditingDisabled;
}

- (void)setAllEditingDisabled:(BOOL)a3
{
  self->_allEditingDisabled = a3;
}

- (BOOL)annotationEditingEnabled
{
  return self->_annotationEditingEnabled;
}

- (BOOL)formFillingEnabled
{
  return self->_formFillingEnabled;
}

- (BOOL)pencilAlwaysDraws
{
  return self->_pencilAlwaysDraws;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndeCGFloat x = a3;
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);

  return (PKRulerHostingDelegate *)WeakRetained;
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAuthor:(id)a3
{
}

- (NSString)modifiedImageDescription
{
  return self->_modifiedImageDescription;
}

- (BOOL)isTestingInstance
{
  return self->_isTestingInstance;
}

- (void)setIsTestingInstance:(BOOL)a3
{
  self->_isTestingInstance = a3;
}

- (AKSparseMutableControllerArray)pageControllers
{
  return (AKSparseMutableControllerArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setPageControllers:(id)a3
{
}

- (NSMapTable)pageModelControllersToPageControllers
{
  return (NSMapTable *)objc_getProperty(self, a2, 88, 1);
}

- (void)setPageModelControllersToPageControllers:(id)a3
{
}

- (AKActionController)actionController
{
  return (AKActionController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setActionController:(id)a3
{
}

- (AKToolController)toolController
{
  return (AKToolController *)objc_getProperty(self, a2, 104, 1);
}

- (void)setToolController:(id)a3
{
}

- (AKToolbarViewController)toolbarViewController
{
  return (AKToolbarViewController *)objc_getProperty(self, a2, 112, 1);
}

- (void)setToolbarViewController:(id)a3
{
}

- (AKAttributeController)attributeController
{
  return (AKAttributeController *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAttributeController:(id)a3
{
}

- (AKUndoController)undoController
{
  return (AKUndoController *)objc_getProperty(self, a2, 128, 1);
}

- (void)setUndoController:(id)a3
{
}

- (AKSidecarController)sidecarController
{
  return (AKSidecarController *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSidecarController:(id)a3
{
}

- (AKMainEventHandler)mainEventHandler
{
  return (AKMainEventHandler *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMainEventHandler:(id)a3
{
}

- (AKTextEditorController)textEditorController
{
  return (AKTextEditorController *)objc_getProperty(self, a2, 152, 1);
}

- (void)setTextEditorController:(id)a3
{
}

- (AKLegacyDoodleController)legacyDoodleController
{
  return (AKLegacyDoodleController *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLegacyDoodleController:(id)a3
{
}

- (AKSignatureModelController)signatureModelController
{
  return (AKSignatureModelController *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSignatureModelController:(id)a3
{
}

- (AKFormFeatureDetectorController)formDetectionController
{
  return (AKFormFeatureDetectorController *)objc_getProperty(self, a2, 176, 1);
}

- (void)setFormDetectionController:(id)a3
{
}

- (AKHighlightAnnotationController)highlightAnnotationController
{
  return (AKHighlightAnnotationController *)objc_getProperty(self, a2, 184, 1);
}

- (void)setHighlightAnnotationController:(id)a3
{
}

- (AKStatistics)statisticsLogger
{
  return (AKStatistics *)objc_getProperty(self, a2, 192, 1);
}

- (void)setStatisticsLogger:(id)a3
{
}

- (AKPeripheralAvailabilityManager_iOS)peripheralAvailabilityManager
{
  return (AKPeripheralAvailabilityManager_iOS *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPeripheralAvailabilityManager:(id)a3
{
}

- (unint64_t)pasteCascadingMultiplier
{
  return self->_pasteCascadingMultiplier;
}

- (void)setPasteCascadingMultiplier:(unint64_t)a3
{
  self->_pasteCascadingMultiplier = a3;
}

- (int64_t)lastPasteboardChangeCount
{
  return self->_lastPasteboardChangeCount;
}

- (void)setLastPasteboardChangeCount:(int64_t)a3
{
  self->_lastPasteboardChangeCount = a3;
}

- (unint64_t)creationCascadingMultiplier
{
  return self->_creationCascadingMultiplier;
}

- (void)setCreationCascadingMultiplier:(unint64_t)a3
{
  self->_creationCascadingMultiplier = a3;
}

- (AKPageController)lastCreationCascadingPageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastCreationCascadingPageController);

  return (AKPageController *)WeakRetained;
}

- (void)setLastCreationCascadingPageController:(id)a3
{
}

- (BOOL)hideAllAdornments
{
  return self->_hideAllAdornments;
}

- (NSArray)cachedKeyCommands
{
  return self->_cachedKeyCommands;
}

- (double)akModelToCanvasFixedPixelScaleOfFirstEncounteredPage
{
  return self->_akModelToCanvasFixedPixelScaleOfFirstEncounteredPage;
}

- (void)setAkModelToCanvasFixedPixelScaleOfFirstEncounteredPage:(double)a3
{
  self->_akModelToCanvasFixedPixelScaleOfFirstEncounteredPage = a3;
}

- (double)screenPixelsToCanvasPixelsDownscale
{
  return self->_screenPixelsToCanvasPixelsDownscale;
}

- (void)setScreenPixelsToCanvasPixelsDownscale:(double)a3
{
  self->_screenPixelsToCanvasPixelsDownscale = a3;
}

- (BOOL)isLogging
{
  return self->_isLogging;
}

- (void)setIsLogging:(BOOL)a3
{
  self->_isLogging = a3;
}

- (BOOL)selectNewlyCreatedAnnotations
{
  return self->_selectNewlyCreatedAnnotations;
}

- (BOOL)shapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (AKToolbarView)modernToolbarView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_modernToolbarView);

  return (AKToolbarView *)WeakRetained;
}

- (void)setModernToolbarView:(id)a3
{
}

- (AKControllerOverlayInteractionProtocol)overlayInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayInteractionDelegate);

  return (AKControllerOverlayInteractionProtocol *)WeakRetained;
}

- (void)setOverlayInteractionDelegate:(id)a3
{
}

- (BOOL)useHighVisibilityDefaultInks
{
  return self->_useHighVisibilityDefaultInks;
}

- (void)setUseHighVisibilityDefaultInks:(BOOL)a3
{
  self->_useHighVisibilityDefaultInks = a3;
}

- (BOOL)_isInDFRAction
{
  return self->__isInDFRAction;
}

- (AKSignaturesController)signaturesController
{
  return self->_signaturesController;
}

- (void)setSignaturesController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signaturesController, 0);
  objc_destroyWeak((id *)&self->_overlayInteractionDelegate);
  objc_destroyWeak((id *)&self->_modernToolbarView);
  objc_storeStrong((id *)&self->_cachedKeyCommands, 0);
  objc_destroyWeak((id *)&self->_lastCreationCascadingPageController);
  objc_storeStrong((id *)&self->_peripheralAvailabilityManager, 0);
  objc_storeStrong((id *)&self->_statisticsLogger, 0);
  objc_storeStrong((id *)&self->_highlightAnnotationController, 0);
  objc_storeStrong((id *)&self->_formDetectionController, 0);
  objc_storeStrong((id *)&self->_signatureModelController, 0);
  objc_storeStrong((id *)&self->_legacyDoodleController, 0);
  objc_storeStrong((id *)&self->_textEditorController, 0);
  objc_storeStrong((id *)&self->_mainEventHandler, 0);
  objc_storeStrong((id *)&self->_sidecarController, 0);
  objc_storeStrong((id *)&self->_undoController, 0);
  objc_storeStrong((id *)&self->_attributeController, 0);
  objc_storeStrong((id *)&self->_toolbarViewController, 0);
  objc_storeStrong((id *)&self->_toolController, 0);
  objc_storeStrong((id *)&self->_actionController, 0);
  objc_storeStrong((id *)&self->_pageModelControllersToPageControllers, 0);
  objc_storeStrong((id *)&self->_pageControllers, 0);
  objc_storeStrong((id *)&self->_modifiedImageDescription, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_destroyWeak((id *)&self->_rulerHostingDelegate);
  objc_storeStrong((id *)&self->_toolbarView, 0);
  objc_storeStrong((id *)&self->_modelController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end