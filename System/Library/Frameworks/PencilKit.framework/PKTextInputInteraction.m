@interface PKTextInputInteraction
+ (BOOL)writeCurrentPencilSharpenerLogsToURL:(id)a3 fullLogs:(BOOL)a4 windowScene:(id)a5;
+ (id)interactionForScene:(id)a3;
- (BOOL)_beginGestureIfPossible:(id)a3;
- (BOOL)_handleDrawingGestureTapInElement:(id)a3 gesture:(id)a4 touch:(id)a5;
- (BOOL)_handwritingInteractionEnabled;
- (BOOL)_isTapAwayFromCurrentStrokesAtCanvasViewLocation:(CGPoint)a3;
- (BOOL)_shouldAvoidStartingDrawingOnView:(id)a3 location:(CGPoint)a4;
- (BOOL)cursorControllerCustomHighlightFeedbackIsVisible:(id)a3;
- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5;
- (BOOL)drawingGestureRecognizer:(id)a3 shouldFinishGestureWithTouch:(id)a4;
- (BOOL)drawingGestureRecognizerLongPressShouldBegin:(id)a3;
- (BOOL)drawingGestureRecognizerRequiresPastTapToBegin:(id)a3;
- (BOOL)drawingGestureRecognizerRequiresTargetElementToBegin:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isCursorWeak;
- (BOOL)isFloatingKeyboardVisible;
- (CGRect)editingOverlayContainerSceneBounds;
- (NSArray)enabledLanguageIdentifiers;
- (NSString)currentLanguageIdentifier;
- (PKPencilObserverInteraction)_pencilObserverInteraction;
- (PKPencilSqueezeInteraction)_pencilSqueezeInteraction;
- (PKTContainerView)_containerView;
- (PKTextInputCanvasController)_canvasController;
- (PKTextInputCursorController)_cursorController;
- (PKTextInputDebugLogController)_debugLogController;
- (PKTextInputDebugStateIntrospector)_debugStateIntrospector;
- (PKTextInputDebugViewController)_debugViewController;
- (PKTextInputDrawingGestureRecognizer)drawingGestureRecognizer;
- (PKTextInputElement)_beginGestureElement;
- (PKTextInputElementContent)_beginGestureElementContentForLineBreak;
- (PKTextInputElementsController)_elementsController;
- (PKTextInputFeedbackController)_feedbackController;
- (PKTextInputHandwritingController)_handwritingController;
- (PKTextInputHoverController)_hoverController;
- (PKTextInputInteraction)init;
- (PKTextInputKeyboardSuppressionPolicyDelegate)_keyboardSuppressionPolicyDelegate;
- (PKTextInputPaletteController)_paletteController;
- (PKTextInputReserveSpaceController)_reserveSpaceController;
- (PKTextInputSingleElementFinder)_drawingGestureElementFinder;
- (PKTextInputTouchDetectionGestureRecognizer)_touchDetectionGestureRecognizer;
- (UIView)view;
- (double)_lastDebugCornerEventTimestamp;
- (double)_lastHandwritingEventTimestamp;
- (id)_findControlFromHitView:(id)a3 referenceView:(id)a4;
- (id)_topLevelHitViewForContainerViewPosition:(CGPoint)a3 event:(id)a4;
- (id)canvasControllerDrawingGestureRecognizer:(id)a3;
- (id)canvasControllerPreferredStrokeColor:(id)a3 animated:(BOOL *)a4;
- (id)containerView:(id)a3 hitTest:(CGPoint)a4 withEvent:(id)a5;
- (id)hoverController:(id)a3 topLevelHitViewAt:(CGPoint)a4;
- (id)paletteControllerDebugSharpenerLog:(id)a3;
- (id)windowSceneForController:(id)a3;
- (int64_t)cursorControllerWritingState:(id)a3;
- (unint64_t)_debugControllerAnchorCorner;
- (void)_drawingGestureElementFinderDidFinishWithLocationInContainerView:(CGPoint)a3;
- (void)_handlePotentialDebugOverlayGestureAtPoint:(CGPoint)a3;
- (void)_notifyTargetElementOfTouches:(id)a3 event:(id)a4;
- (void)_setDebugControllerAnchorCorner:(unint64_t)a3;
- (void)_setHandwritingInteractionEnabled:(BOOL)a3;
- (void)_setLastHandwritingEventTimestamp:(double)a3;
- (void)_updateCanvasController;
- (void)_updateCanvasStrokeColor;
- (void)_updateContainerView;
- (void)_updateDebugController;
- (void)_updateElementsController;
- (void)_updateGestureRecognizers;
- (void)_updateHandwritingController;
- (void)_updateInteractionEnabled;
- (void)_updateKeyboardSuppressionPolicy;
- (void)_updatePaletteController;
- (void)cancelReplay;
- (void)canvasController:(id)a3 drawingDidChange:(id)a4;
- (void)canvasControllerCanvasDidFinishAnimatingStrokes:(id)a3;
- (void)canvasControllerDidCancelStroke:(id)a3 strokeAcceptanceState:(int64_t)a4;
- (void)canvasControllerDidEndDrawing:(id)a3;
- (void)canvasControllerEndedStroke:(id)a3;
- (void)canvasControllerInProgressStrokeDidChange:(id)a3;
- (void)dealloc;
- (void)debugViewControllerNeedsDismiss:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)dismissFloatingKeyboard;
- (void)drawingGestureRecognizerDrawingTargetIsDrawingDidChange:(id)a3;
- (void)drawingGestureRecognizerLongPressStateDidChange:(id)a3;
- (void)drawingGestureStrokeAcceptanceStateDidChange:(id)a3;
- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3;
- (void)elementsControllerLastDiscoveredElementsDidChange:(id)a3;
- (void)feedbackControllerShowingCustomFeedbackDidChange:(id)a3;
- (void)handwritingControllerDidFinishActiveCommands:(id)a3;
- (void)handwritingControllerWritingStateDidChange:(id)a3;
- (void)hoverControllerDidLift:(id)a3;
- (void)presentFloatingKeyboard;
- (void)presentProblemReportingView;
- (void)reportDebugStateDescription:(id)a3;
- (void)reserveSpaceController:(id)a3 willFocusElement:(id)a4;
- (void)reserveSpaceControllerIsActiveChanged:(id)a3;
- (void)reserveSpaceControllerIsPlaceholderVisibleChanged:(id)a3;
- (void)saveInteractionForScene:(id)a3;
- (void)setCurrentLanguageIdentifier:(id)a3;
- (void)setDrawingGestureRecognizer:(id)a3;
- (void)setEditingOverlayContainerSceneBounds:(CGRect)a3;
- (void)setView:(id)a3;
- (void)set_beginGestureElement:(id)a3;
- (void)set_beginGestureElementContentForLineBreak:(id)a3;
- (void)set_containerView:(id)a3;
- (void)set_cursorController:(id)a3;
- (void)set_debugLogController:(id)a3;
- (void)set_debugStateIntrospector:(id)a3;
- (void)set_debugViewController:(id)a3;
- (void)set_drawingGestureElementFinder:(id)a3;
- (void)set_elementsController:(id)a3;
- (void)set_feedbackController:(id)a3;
- (void)set_handwritingController:(id)a3;
- (void)set_hoverController:(id)a3;
- (void)set_keyboardSuppressionPolicyDelegate:(id)a3;
- (void)set_lastDebugCornerEventTimestamp:(double)a3;
- (void)set_paletteController:(id)a3;
- (void)set_pencilObserverInteraction:(id)a3;
- (void)set_pencilSqueezeInteraction:(id)a3;
- (void)set_reserveSpaceController:(id)a3;
- (void)set_touchDetectionGestureRecognizer:(id)a3;
- (void)simulateReserveSpaceForTextInputView:(id)a3 location:(CGPoint)a4 completion:(id)a5;
- (void)textInputLanguageSelectionControllerDidChangeLanguage:(id)a3;
- (void)textInputPaletteControllerFloatingKeyboardWillHide:(id)a3;
- (void)textInputPaletteControllerFloatingKeyboardWillShow:(id)a3;
- (void)touchesDetected;
- (void)willMoveToView:(id)a3;
@end

@implementation PKTextInputInteraction

+ (id)interactionForScene:(id)a3
{
  return (id)[(id)_perSceneTextInputInteraction objectForKey:a3];
}

- (PKTextInputInteraction)init
{
  v22.receiver = self;
  v22.super_class = (Class)PKTextInputInteraction;
  id v2 = [(PKTextInputInteraction *)&v22 init];
  if (v2)
  {
    int64_t v3 = +[PKTextInputSettings featureLevel];
    *((unsigned char *)v2 + 8) = v3 != 0;
    if (v3)
    {
      v4 = objc_alloc_init(PKTextInputCanvasController);
      v5 = (void *)*((void *)v2 + 4);
      *((void *)v2 + 4) = v4;

      -[PKTextInputCanvasController setDelegate:](*((void *)v2 + 4), v2);
      uint64_t v6 = *((void *)v2 + 4);
      if (v6) {
        objc_storeWeak((id *)(v6 + 80), v2);
      }
      v7 = objc_alloc_init(PKTextInputFeedbackController);
      v8 = (void *)*((void *)v2 + 5);
      *((void *)v2 + 5) = v7;

      [*((id *)v2 + 5) setDelegate:v2];
      v9 = objc_alloc_init(PKTextInputPaletteController);
      v10 = (void *)*((void *)v2 + 6);
      *((void *)v2 + 6) = v9;

      [*((id *)v2 + 6) setDelegate:v2];
      v11 = objc_alloc_init(PKTextInputCursorController);
      v12 = (void *)*((void *)v2 + 18);
      *((void *)v2 + 18) = v11;

      [*((id *)v2 + 18) setDelegate:v2];
      v13 = [[PKTextInputReserveSpaceController alloc] initWithFeedbackController:*((void *)v2 + 5)];
      v14 = (void *)*((void *)v2 + 19);
      *((void *)v2 + 19) = v13;

      [*((id *)v2 + 19) setDelegate:v2];
      v15 = objc_alloc_init(PKTextInputDebugLogController);
      v16 = (void *)*((void *)v2 + 14);
      *((void *)v2 + 14) = v15;

      v17 = objc_alloc_init(PKTextInputKeyboardSuppressionPolicyDelegate);
      v18 = (void *)*((void *)v2 + 13);
      *((void *)v2 + 13) = v17;

      v19 = [MEMORY[0x1E4F1C9C8] distantPast];
      [v19 timeIntervalSinceReferenceDate];
      *((void *)v2 + 10) = v20;

      +[PKTextInputAnalyticsController beginObservingSessionAnalytics];
      +[PKPencilTouchDetectionService beginObservingTouchesForDetection];
    }
  }
  return (PKTextInputInteraction *)v2;
}

- (void)dealloc
{
  int64_t v3 = [(PKTextInputInteraction *)self _canvasController];
  -[PKTextInputCanvasController setDelegate:]((uint64_t)v3, 0);

  uint64_t v4 = [(PKTextInputInteraction *)self _canvasController];
  v5 = (void *)v4;
  if (v4) {
    objc_storeWeak((id *)(v4 + 80), 0);
  }

  uint64_t v6 = [(PKTextInputInteraction *)self _reserveSpaceController];
  [v6 setDelegate:0];

  uint64_t v7 = [(PKTextInputInteraction *)self _containerView];
  v8 = (void *)v7;
  if (v7) {
    objc_storeWeak((id *)(v7 + 408), 0);
  }

  v9 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
  [v9 setDelegate:0];

  v10.receiver = self;
  v10.super_class = (Class)PKTextInputInteraction;
  [(PKTextInputInteraction *)&v10 dealloc];
}

+ (BOOL)writeCurrentPencilSharpenerLogsToURL:(id)a3 fullLogs:(BOOL)a4 windowScene:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if (os_variant_has_internal_diagnostics())
  {
    v9 = +[PKTextInputInteraction interactionForScene:v8];
    v12 = [v9 debugLogController];
    v13 = -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v12);

    if (v6) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 1;
    }
    id v19 = 0;
    int v10 = [v13 writeToURL:v7 withContentLevel:v14 excludeEntyIndexes:0 error:&v19];
    id v15 = v19;
    v16 = v15;
    if (v10) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 0;
    }
    if (!v17)
    {
      v18 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v7;
        __int16 v22 = 2112;
        v23 = v16;
        _os_log_error_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_ERROR, "Error writing pencil sharpener logs to url: %@, %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_ERROR, "Only available in internal builds.", buf, 2u);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)willMoveToView:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4FB18E0] suppressionPolicyDelegate];
    BOOL v6 = [(PKTextInputInteraction *)self _keyboardSuppressionPolicyDelegate];

    if (v5 == v6) {
      [MEMORY[0x1E4FB18E0] setSuppressionPolicyDelegate:0];
    }
  }
  [(PKTextInputInteraction *)self set_hoverController:0];
  id v7 = [(PKTextInputInteraction *)self _pencilObserverInteraction];

  if (v7)
  {
    id v8 = [(PKTextInputInteraction *)self view];
    v9 = [(PKTextInputInteraction *)self _pencilObserverInteraction];
    [v8 removeInteraction:v9];

    [(PKTextInputInteraction *)self set_pencilObserverInteraction:0];
  }
  int v10 = _os_feature_enabled_impl();
  if (v4 && v10)
  {
    if (!self->__pencilSqueezeInteraction)
    {
      v11 = [v4 window];
      v12 = [v11 windowScene];
      v13 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v12];
      uint64_t v14 = v13;
      id v15 = v13
          ? (PKPencilSqueezeInteraction *)v13
          : objc_alloc_init(PKPencilSqueezeInteraction);
      pencilSqueezeInteraction = self->__pencilSqueezeInteraction;
      self->__pencilSqueezeInteraction = v15;

      if (self->__pencilSqueezeInteraction)
      {
        uint64_t v24 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = self->__pencilSqueezeInteraction;
          int v26 = 134218243;
          v27 = v25;
          __int16 v28 = 2113;
          id v29 = v4;
          _os_log_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_DEFAULT, "Adding pencil squeeze interaction: %p, to view: %{private}@", (uint8_t *)&v26, 0x16u);
        }

        [v4 addInteraction:self->__pencilSqueezeInteraction];
      }
    }
  }
  else if (!v4)
  {
    if (self->__pencilSqueezeInteraction)
    {
      v16 = [(PKTextInputInteraction *)self view];
      BOOL v17 = [v16 interactions];
      uint64_t v18 = [v17 indexOfObject:self->__pencilSqueezeInteraction];

      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v19 = os_log_create("com.apple.pencilkit", "PencilSqueeze");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [(PKTextInputInteraction *)self view];
          int v26 = 138477827;
          v27 = v20;
          _os_log_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_DEFAULT, "Removing pencil squeeze interaction from view: %{private}@", (uint8_t *)&v26, 0xCu);
        }
        id v21 = [(PKTextInputInteraction *)self view];
        [v21 removeInteraction:self->__pencilSqueezeInteraction];

        __int16 v22 = self->__pencilSqueezeInteraction;
        self->__pencilSqueezeInteraction = 0;
      }
    }
  }
}

- (void)didMoveToView:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (!v6) {
      goto LABEL_10;
    }
    if (self->_shouldBeActive) {
      id v7 = @"On";
    }
    else {
      id v7 = @"Off";
    }
    *(_DWORD *)buf = 138412290;
    v39 = v7;
    id v8 = "Interaction moved to a view. Should be active: %@";
    v9 = v5;
    uint32_t v10 = 12;
  }
  else
  {
    if (!v6) {
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    id v8 = "Interaction uninstalled from its view.";
    v9 = v5;
    uint32_t v10 = 2;
  }
  _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_10:

  if (self->_shouldBeActive)
  {
    v11 = [v4 window];
    v12 = [v11 windowScene];
    [(PKTextInputInteraction *)self saveInteractionForScene:v12];

    [(PKTextInputInteraction *)self setView:v4];
    v13 = [(PKTextInputInteraction *)self view];

    if (v13)
    {
      uint64_t v14 = [PKTextInputElementsController alloc];
      id v15 = [(PKTextInputInteraction *)self view];
      v16 = -[PKTextInputElementsController initWithContainerView:]((id *)&v14->super.isa, v15);
      [(PKTextInputInteraction *)self set_elementsController:v16];

      uint64_t v17 = [(PKTextInputInteraction *)self _elementsController];
      uint64_t v18 = (void *)v17;
      if (v17) {
        objc_storeWeak((id *)(v17 + 32), self);
      }

      id v19 = +[PKTextInputLanguageSelectionController sharedInstance];
      [v19 addObserver:self];
    }
    else
    {
      [(PKTextInputInteraction *)self set_elementsController:0];
    }
    if (PK_UIApplicationIsSystemShell_onceToken != -1) {
      dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_72);
    }
    BOOL v20 = PK_UIApplicationIsSystemShell___result == 0;
    id v21 = [(PKTextInputInteraction *)self view];
    __int16 v22 = v21;
    if (v20)
    {
      v23 = [v21 window];
      uint64_t v24 = [v23 windowScene];
      v25 = [v24 coordinateSpace];
      [v25 bounds];
      -[PKTextInputInteraction setEditingOverlayContainerSceneBounds:](self, "setEditingOverlayContainerSceneBounds:");
    }
    else
    {
      v23 = [v21 superview];
      [v23 bounds];
      -[PKTextInputInteraction setEditingOverlayContainerSceneBounds:](self, "setEditingOverlayContainerSceneBounds:");
    }

    [(PKTextInputInteraction *)self _updateInteractionEnabled];
    [(PKTextInputInteraction *)self _updateGestureRecognizers];
    [(PKTextInputInteraction *)self _updateElementsController];
    [(PKTextInputInteraction *)self _updatePaletteController];
    [(PKTextInputInteraction *)self _updateContainerView];
    if (v4)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __40__PKTextInputInteraction_didMoveToView___block_invoke;
      block[3] = &unk_1E64C5998;
      objc_copyWeak(&v37, (id *)buf);
      dispatch_async(MEMORY[0x1E4F14428], block);
      int v26 = [v4 window];
      v27 = [v26 screen];
      __int16 v28 = [v27 displayIdentity];
      char v29 = [v28 expectsSecureRendering];

      uint64_t v30 = _PKSignpostLog();
      if (os_signpost_enabled(v30))
      {
        *(_WORD *)v35 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C44F8000, v30, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Prewarm text input block", (const char *)&unk_1C48540E6, v35, 2u);
      }

      v31 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1C44F8000, v31, OS_LOG_TYPE_INFO, "BEGIN \"Prewarm text input block\"", v35, 2u);
      }

      v32 = dispatch_get_global_queue(25, 0);
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __40__PKTextInputInteraction_didMoveToView___block_invoke_32;
      v33[3] = &__block_descriptor_33_e5_v8__0l;
      char v34 = v29;
      dispatch_async(v32, v33);

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)buf);
    }
  }
  +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

void __40__PKTextInputInteraction_didMoveToView___block_invoke(uint64_t a1)
{
  id v2 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_INFO, "Checking if hover is supported", buf, 2u);
  }

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__PKTextInputInteraction_didMoveToView___block_invoke_26;
  v10[3] = &unk_1E64C6CE0;
  int64_t v3 = (id *)(a1 + 32);
  objc_copyWeak(&v11, v3);
  +[PKHoverSettings checkIfHoverIsSupported:v10];
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = (void *)MEMORY[0x1E4FB18E0];
    id v7 = [WeakRetained _keyboardSuppressionPolicyDelegate];
    [v6 setSuppressionPolicyDelegate:v7];

    id v8 = [v5 _keyboardSuppressionPolicyDelegate];
    [v8 updateKeyboardSuppressionPolicy];

    v9 = [v5 _paletteController];
    [v9 updateFirstResponderVisibility];
  }
  objc_destroyWeak(&v11);
}

void __40__PKTextInputInteraction_didMoveToView___block_invoke_26(uint64_t a1, int a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v15[0] = 67109120;
    v15[1] = a2;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_INFO, "Hover supported reply: %d", (uint8_t *)v15, 8u);
  }

  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    BOOL v6 = [WeakRetained view];

    if (v6)
    {
      id v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "Adding Hover interaction and controller", (uint8_t *)v15, 2u);
      }

      id v8 = -[PKPencilObserverInteraction initWithDelegate:]([PKPencilObserverInteraction alloc], WeakRetained);
      v9 = (void *)WeakRetained[24];
      WeakRetained[24] = v8;

      uint32_t v10 = [WeakRetained view];
      [v10 addInteraction:WeakRetained[24]];

      uint64_t v11 = [WeakRetained _containerView];
      if (v11)
      {
        v12 = (void *)v11;
        if (PK_UIApplicationIsSystemShell_onceToken != -1) {
          dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_72);
        }
        int v13 = PK_UIApplicationIsSystemShell___result;

        if (!v13)
        {
          uint64_t v14 = -[PKTextInputHoverController initWithDelegate:]((id *)[PKTextInputHoverController alloc], WeakRetained);
          objc_msgSend(WeakRetained, "set_hoverController:", v14);
        }
      }
    }
  }
}

void __40__PKTextInputInteraction_didMoveToView___block_invoke_32(uint64_t a1)
{
  id v2 = _PKSignpostLog();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Prewarm text input work", (const char *)&unk_1C48540E6, buf, 2u);
  }

  int64_t v3 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_INFO, "BEGIN \"Prewarm text input work\"", v12, 2u);
  }

  +[PKTextInputCanvasController prewarmFutureCanvasesIfNecessarySecureRendering:]((uint64_t)PKTextInputCanvasController, *(unsigned __int8 *)(a1 + 32));
  id v4 = _PKSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Prewarm text input work", (const char *)&unk_1C48540E6, v11, 2u);
  }

  v5 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint32_t v10 = 0;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "END \"Prewarm text input work\"", v10, 2u);
  }

  BOOL v6 = _PKSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Prewarm text input block", (const char *)&unk_1C48540E6, v9, 2u);
  }

  id v7 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "END \"Prewarm text input block\"", v8, 2u);
  }
}

- (void)saveInteractionForScene:(id)a3
{
  id v15 = a3;
  id v4 = [(PKTextInputInteraction *)self view];
  v5 = [v4 window];
  BOOL v6 = [v5 windowScene];

  if (v6)
  {
    id v7 = (void *)_perSceneTextInputInteraction;
    id v8 = [(PKTextInputInteraction *)self view];
    v9 = [v8 window];
    uint32_t v10 = [v9 windowScene];
    [v7 removeObjectForKey:v10];
  }
  uint64_t v11 = v15;
  if (v15)
  {
    v12 = (void *)_perSceneTextInputInteraction;
    if (!_perSceneTextInputInteraction)
    {
      uint64_t v13 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
      uint64_t v14 = (void *)_perSceneTextInputInteraction;
      _perSceneTextInputInteraction = v13;

      v12 = (void *)_perSceneTextInputInteraction;
    }
    [v12 setObject:self forKey:v15];
    uint64_t v11 = v15;
  }
}

- (void)_setHandwritingInteractionEnabled:(BOOL)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->__handwritingInteractionEnabled != a3)
  {
    BOOL v3 = a3;
    self->__handwritingInteractionEnabled = a3;
    v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = @"Off";
      if (v3) {
        BOOL v6 = @"On";
      }
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Changed interaction enabled state to: %@", (uint8_t *)&v7, 0xCu);
    }

    [(PKTextInputInteraction *)self _updateContainerView];
    [(PKTextInputInteraction *)self _updateCanvasController];
    [(PKTextInputInteraction *)self _updateElementsController];
    [(PKTextInputInteraction *)self _updateHandwritingController];
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (void)_setLastHandwritingEventTimestamp:(double)a3
{
  self->__lastHandwritingEventTimestamp = a3;
  [(PKTextInputInteraction *)self _updateCanvasController];
  [(PKTextInputInteraction *)self _updateContainerView];
  [(PKTextInputInteraction *)self _updateInteractionEnabled];

  +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

- (void)setEditingOverlayContainerSceneBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_editingOverlayContainerSceneBounds, a3))
  {
    self->_editingOverlayContainerSceneBounds.origin.CGFloat x = x;
    self->_editingOverlayContainerSceneBounds.origin.CGFloat y = y;
    self->_editingOverlayContainerSceneBounds.size.CGFloat width = width;
    self->_editingOverlayContainerSceneBounds.size.CGFloat height = height;
    [(PKTextInputInteraction *)self _updatePaletteController];
  }
}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (PK_UIApplicationIsSystemShell_onceToken != -1) {
    dispatch_once(&PK_UIApplicationIsSystemShell_onceToken, &__block_literal_global_72);
  }
  if (PK_UIApplicationIsSystemShell___result) {
    double v8 = height;
  }
  else {
    double v8 = width;
  }
  if (PK_UIApplicationIsSystemShell___result) {
    double height = width;
  }
  -[PKTextInputInteraction setEditingOverlayContainerSceneBounds:](self, "setEditingOverlayContainerSceneBounds:", x, y, v8, height);
  id v9 = [(PKTextInputInteraction *)self _paletteController];
  objc_msgSend(v9, "editingOverlayContainerDidChangeToSceneBounds:", x, y, v8, height);
}

- (void)_updateInteractionEnabled
{
  BOOL v3 = [(PKTextInputInteraction *)self view];
  BOOL v4 = v3 != 0;

  uint64_t v5 = [(PKTextInputInteraction *)self _canvasController];
  BOOL v6 = (void *)v5;
  if (v5 && ([*(id *)(v5 + 96) isDrawing] & 1) != 0)
  {
    char v7 = 1;
  }
  else
  {
    double v8 = [(PKTextInputInteraction *)self _reserveSpaceController];
    char v7 = [v8 isReserveSpaceActive];
  }
  id v9 = [(PKTextInputInteraction *)self _handwritingController];
  if (v9)
  {
    uint32_t v10 = [(PKTextInputInteraction *)self _handwritingController];
    uint64_t v11 = [v10 writingState];

    if (v11 == 1) {
      char v7 = 1;
    }
  }

  if (v3 && (v7 & 1) == 0)
  {
    v12 = +[PKTextInputSettings sharedSettings];
    [v12 interactionDisablingDelay];
    double v14 = v13;

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v16 = v15;
    [(PKTextInputInteraction *)self _lastHandwritingEventTimestamp];
    BOOL v4 = v16 - v17 < v14;
  }
  [(PKTextInputInteraction *)self _setHandwritingInteractionEnabled:v4];
  uint64_t v18 = [(PKTextInputInteraction *)self _canvasController];
  id v19 = (void *)v18;
  if (v18 && *(unsigned char *)(v18 + 65) != v4)
  {
    *(unsigned char *)(v18 + 65) = v4;
    -[PKTextInputCanvasController _updateCanvasView](v18);
  }

  if (v4)
  {
    BOOL v20 = +[PKTextInputSettings sharedSettings];
    [v20 interactionDisablingDelay];
    double v22 = v21;

    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateInteractionEnabled object:0];
    [(PKTextInputInteraction *)self performSelector:sel__updateInteractionEnabled withObject:0 afterDelay:v22 + 0.1];
  }
}

- (void)_updateGestureRecognizers
{
  BOOL v3 = [(PKTextInputInteraction *)self view];

  BOOL v4 = [(PKTextInputInteraction *)self drawingGestureRecognizer];

  if (!v3 || v4)
  {
    if (!v3 && v4)
    {
      char v7 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
      [v7 setDelegate:0];

      double v8 = [(PKTextInputInteraction *)self view];
      id v9 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
      [v8 removeGestureRecognizer:v9];

      [(PKTextInputInteraction *)self setDrawingGestureRecognizer:0];
    }
  }
  else
  {
    uint64_t v5 = objc_alloc_init(PKTextInputDrawingGestureRecognizer);
    [(PKTextInputInteraction *)self setDrawingGestureRecognizer:v5];
    [(PKTextInputDrawingGestureRecognizer *)v5 setDelegate:self];
    BOOL v6 = [(PKTextInputInteraction *)self view];
    [v6 addGestureRecognizer:v5];
  }
  uint32_t v10 = [(PKTextInputInteraction *)self view];
  if (v10)
  {
    uint64_t v11 = [(PKTextInputInteraction *)self reserveSpaceController];
    int v12 = [v11 isReserveSpaceActive];
  }
  else
  {
    int v12 = 0;
  }

  double v13 = [(PKTextInputInteraction *)self _touchDetectionGestureRecognizer];

  if (!v12 || v13)
  {
    if (v13) {
      char v16 = v12;
    }
    else {
      char v16 = 1;
    }
    if ((v16 & 1) == 0)
    {
      double v17 = [(PKTextInputInteraction *)self view];
      uint64_t v18 = [(PKTextInputInteraction *)self _touchDetectionGestureRecognizer];
      [v17 removeGestureRecognizer:v18];

      id v19 = [(PKTextInputInteraction *)self _touchDetectionGestureRecognizer];
      [v19 setDelegate:0];

      [(PKTextInputInteraction *)self set_touchDetectionGestureRecognizer:0];
    }
  }
  else
  {
    double v14 = objc_alloc_init(PKTextInputTouchDetectionGestureRecognizer);
    [(PKTextInputTouchDetectionGestureRecognizer *)v14 setDelegate:self];
    [(PKTextInputInteraction *)self set_touchDetectionGestureRecognizer:v14];
    double v15 = [(PKTextInputInteraction *)self view];
    [v15 addGestureRecognizer:v14];
  }

  [(PKTextInputInteraction *)self _updateCanvasController];
}

- (void)_updateContainerView
{
  v52[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKTextInputInteraction *)self view];

  BOOL v4 = [(PKTextInputInteraction *)self _containerView];

  if (v3 && !v4)
  {
    v47 = v3;
    uint64_t v5 = [PKTContainerView alloc];
    BOOL v6 = -[PKTContainerView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setHidden:1];
    if (v6) {
      objc_storeWeak(v6 + 51, self);
    }
    [(PKTextInputInteraction *)self set_containerView:v6];
    char v7 = [(PKTextInputInteraction *)self view];
    [v7 addSubview:v6];

    v45 = [v6 topAnchor];
    v46 = [(PKTextInputInteraction *)self view];
    v44 = [v46 topAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v52[0] = v43;
    v41 = [v6 bottomAnchor];
    v42 = [(PKTextInputInteraction *)self view];
    uint64_t v40 = [v42 bottomAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v52[1] = v39;
    v38 = [v6 leadingAnchor];
    double v8 = [(PKTextInputInteraction *)self view];
    id v9 = [v8 leadingAnchor];
    uint32_t v10 = [v38 constraintEqualToAnchor:v9];
    v52[2] = v10;
    uint64_t v11 = [v6 trailingAnchor];
    int v12 = [(PKTextInputInteraction *)self view];
    double v13 = [v12 trailingAnchor];
    double v14 = [v11 constraintEqualToAnchor:v13];
    v52[3] = v14;
    double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:4];

    [MEMORY[0x1E4F28DC8] activateConstraints:v15];
    BOOL v4 = 0;
    BOOL v3 = v47;
    goto LABEL_10;
  }
  if (!v3 && v4)
  {
    char v16 = [(PKTextInputInteraction *)self _containerView];
    [v16 removeFromSuperview];

    [(PKTextInputInteraction *)self set_containerView:0];
    goto LABEL_25;
  }
  if (v3)
  {
LABEL_10:
    double v17 = [(PKTextInputInteraction *)self _containerView];
    int v18 = [v17 isHidden];

    uint64_t v19 = [(PKTextInputInteraction *)self _handwritingController];
    if (v19)
    {
      BOOL v20 = (void *)v19;
      double v21 = [(PKTextInputInteraction *)self _handwritingController];
      uint64_t v22 = [v21 writingState];

      if (v22 == 1)
      {
        BOOL v24 = 1;
        goto LABEL_17;
      }
      if (v22)
      {
        BOOL v24 = 0;
        goto LABEL_21;
      }
    }
    v23 = [(PKTextInputInteraction *)self canvasController];
    if (v23) {
      BOOL v24 = v23[64] != 0;
    }
    else {
      BOOL v24 = 0;
    }

LABEL_17:
    if ((v24 & v18) == 1)
    {
      v25 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v30 = [(PKTextInputInteraction *)self _handwritingController];
        if (v30) {
          v31 = @"Y";
        }
        else {
          v31 = @"N";
        }
        v32 = [(PKTextInputInteraction *)self _handwritingController];
        v33 = PKTextInputDescriptionForWritingState([v32 writingState]);
        *(_DWORD *)buf = 138412546;
        v49 = v31;
        __int16 v50 = 2112;
        v51 = v33;
        _os_log_debug_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEBUG, "Showing container view. Has handwritingController: %@, writingState: %@", buf, 0x16u);
      }
      int v26 = [(PKTextInputInteraction *)self _containerView];
      v27 = v26;
      uint64_t v28 = 0;
LABEL_24:
      [v26 setHidden:v28];

      +[PKTextInputDebugStateIntrospector debugStateDidChange];
      goto LABEL_25;
    }
LABEL_21:
    if ((v24 | v18)) {
      goto LABEL_25;
    }
    char v29 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      char v34 = [(PKTextInputInteraction *)self _handwritingController];
      if (v34) {
        v35 = @"Y";
      }
      else {
        v35 = @"N";
      }
      v36 = [(PKTextInputInteraction *)self _handwritingController];
      id v37 = PKTextInputDescriptionForWritingState([v36 writingState]);
      *(_DWORD *)buf = 138412546;
      v49 = v35;
      __int16 v50 = 2112;
      v51 = v37;
      _os_log_debug_impl(&dword_1C44F8000, v29, OS_LOG_TYPE_DEBUG, "Hiding container view. Has handwritingController: %@, writingState: %@", buf, 0x16u);
    }
    int v26 = [(PKTextInputInteraction *)self _containerView];
    v27 = v26;
    uint64_t v28 = 1;
    goto LABEL_24;
  }
LABEL_25:
  if ((v3 != 0) != (v4 != 0))
  {
    [(PKTextInputInteraction *)self _updateCanvasController];
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (void)_updateCanvasController
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKTextInputInteraction *)self _canvasController];
  if (v3) {
    int v4 = v3[64] != 0;
  }
  else {
    int v4 = 0;
  }

  uint64_t v5 = [(PKTextInputInteraction *)self _reserveSpaceController];
  char v6 = [v5 isReserveSpaceActive];

  if (v6) {
    goto LABEL_4;
  }
  uint64_t v8 = [(PKTextInputInteraction *)self _handwritingController];
  if (v8)
  {
    id v9 = (void *)v8;
    uint32_t v10 = [(PKTextInputInteraction *)self _handwritingController];
    uint64_t v11 = [v10 writingState];

    if (v11 == 1)
    {
LABEL_4:
      int v7 = 1;
      goto LABEL_13;
    }
    if (v11)
    {
      int v7 = 0;
      goto LABEL_13;
    }
  }
  int v12 = [(PKTextInputInteraction *)self _canvasController];
  if (-[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)v12))
  {
    int v7 = 1;
  }
  else
  {
    double v13 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
    int v7 = [v13 drawingTargetIsDrawing];
  }
LABEL_13:
  uint64_t v14 = [(PKTextInputInteraction *)self _canvasController];
  double v15 = (void *)v14;
  if (v14 && *(unsigned __int8 *)(v14 + 64) != v7)
  {
    *(unsigned char *)(v14 + 64) = v7;
    -[PKTextInputCanvasController _updateCanvasView](v14);
  }

  if (v4 != v7) {
    [(PKTextInputInteraction *)self _updateContainerView];
  }
  if (((v4 | v7 ^ 1) & 1) == 0)
  {
    double v17 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v18 = [(PKTextInputInteraction *)self _handwritingController];
      uint64_t v19 = PKTextInputDescriptionForWritingState([v18 writingState]);
      BOOL v20 = [(PKTextInputInteraction *)self _canvasController];
      if (-[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)v20)) {
        double v21 = @"Yes";
      }
      else {
        double v21 = @"No";
      }
      uint64_t v22 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
      int v30 = 138412802;
      if ([v22 drawingTargetIsDrawing]) {
        v23 = @"Yes";
      }
      else {
        v23 = @"No";
      }
      v31 = v19;
      __int16 v32 = 2112;
      v33 = v21;
      __int16 v34 = 2112;
      v35 = v23;
      _os_log_debug_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEBUG, "Showing canvas view. writingState: %@, canvas has strokes: %@, gesture is drawing: %@", (uint8_t *)&v30, 0x20u);
    }
    os_log_t v16 = [(PKTextInputInteraction *)self view];
    [v16 layoutIfNeeded];
    goto LABEL_25;
  }
  if ((v7 & 1) == 0 && ((v4 ^ 1) & 1) == 0)
  {
    os_log_t v16 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      BOOL v24 = [(PKTextInputInteraction *)self _handwritingController];
      v25 = PKTextInputDescriptionForWritingState([v24 writingState]);
      int v26 = [(PKTextInputInteraction *)self _canvasController];
      if (-[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)v26)) {
        v27 = @"Yes";
      }
      else {
        v27 = @"No";
      }
      uint64_t v28 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
      int v30 = 138412802;
      if ([v28 drawingTargetIsDrawing]) {
        char v29 = @"Yes";
      }
      else {
        char v29 = @"No";
      }
      v31 = v25;
      __int16 v32 = 2112;
      v33 = v27;
      __int16 v34 = 2112;
      v35 = v29;
      _os_log_debug_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEBUG, "Hiding canvas view. writingState: %@, canvas has strokes: %@, gesture is drawing: %@", (uint8_t *)&v30, 0x20u);
    }
LABEL_25:
  }
}

- (void)_updateHandwritingController
{
  if ([(PKTextInputInteraction *)self _handwritingInteractionEnabled])
  {
    BOOL v3 = [(PKTextInputInteraction *)self _elementsController];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  uint64_t v5 = [(PKTextInputInteraction *)self _handwritingController];

  if (!v4 || v5)
  {
    if (v5) {
      char v15 = v4;
    }
    else {
      char v15 = 1;
    }
    if ((v15 & 1) == 0)
    {
      os_log_t v16 = [(PKTextInputInteraction *)self _handwritingController];
      [v16 setDelegate:0];

      [(PKTextInputInteraction *)self set_handwritingController:0];
    }
  }
  else
  {
    char v6 = [PKTextInputHandwritingController alloc];
    int v7 = [(PKTextInputInteraction *)self _canvasController];
    uint64_t v8 = [(PKTextInputInteraction *)self _elementsController];
    id v9 = [(PKTextInputInteraction *)self _feedbackController];
    uint32_t v10 = [(PKTextInputInteraction *)self _reserveSpaceController];
    uint64_t v11 = [(PKTextInputInteraction *)self _debugLogController];
    int v12 = [(PKTextInputInteraction *)self _cursorController];
    double v13 = [(PKTextInputHandwritingController *)v6 initWithCanvasController:v7 elementsController:v8 feedbackController:v9 reserveSpaceController:v10 debugLogController:v11 cursorController:v12];
    [(PKTextInputInteraction *)self set_handwritingController:v13];

    uint64_t v14 = [(PKTextInputInteraction *)self _handwritingController];
    [v14 setDelegate:self];
  }
  if (v4 != (v5 != 0))
  {
    [(PKTextInputInteraction *)self _updateContainerView];
  }
}

- (void)_updateElementsController
{
  if (![(PKTextInputInteraction *)self _handwritingInteractionEnabled]
    || ([(PKTextInputInteraction *)self view],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    BOOL v4 = [(PKTextInputInteraction *)self _elementsController];
    -[PKTextInputElementsController flushDiscoveredElements]((uint64_t)v4);
  }

  [(PKTextInputInteraction *)self _updateDebugController];
}

- (void)_updatePaletteController
{
  [(PKTextInputInteraction *)self editingOverlayContainerSceneBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(PKTextInputInteraction *)self _paletteController];
  objc_msgSend(v11, "setEditingOverlayContainerSceneBounds:", v4, v6, v8, v10);
}

- (void)_setDebugControllerAnchorCorner:(unint64_t)a3
{
  if (self->__debugControllerAnchorCorner != a3)
  {
    self->__debugControllerAnchorCorner = a3;
    [(PKTextInputInteraction *)self _updateDebugController];
  }
}

- (void)_handlePotentialDebugOverlayGestureAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (!os_variant_has_internal_diagnostics()) {
    return;
  }
  double v6 = [(PKTextInputInteraction *)self view];
  [v6 bounds];
  double MaxX = CGRectGetMaxX(v20);

  double v8 = [(PKTextInputInteraction *)self view];
  [v8 bounds];
  double MaxY = CGRectGetMaxY(v21);

  if (x > 20.0 || x < 0.0 || y > 20.0 || y < 0.0)
  {
    BOOL v11 = MaxX - x <= 20.0;
    if (MaxX - x <= 0.0) {
      BOOL v11 = 0;
    }
    if (!v11 || y > 20.0)
    {
      double v13 = MaxY - y;
      if (x > 20.0 || (v13 > 0.0 ? (BOOL v14 = v13 > 20.0) : (BOOL v14 = 1), v14))
      {
        if (v13 <= 0.0) {
          BOOL v11 = 0;
        }
        if (!v11 || v13 > 20.0)
        {
          uint64_t v10 = 0;
          double v16 = 0.0;
LABEL_29:
          [(PKTextInputInteraction *)self _setDebugControllerAnchorCorner:v10];
          goto LABEL_30;
        }
        uint64_t v10 = 8;
      }
      else
      {
        uint64_t v10 = 4;
      }
    }
    else
    {
      uint64_t v10 = 2;
    }
  }
  else
  {
    uint64_t v10 = 1;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v16 = v17;
  [(PKTextInputInteraction *)self _lastDebugCornerEventTimestamp];
  if (v16 - v18 < 0.2) {
    goto LABEL_29;
  }
LABEL_30:

  [(PKTextInputInteraction *)self set_lastDebugCornerEventTimestamp:v16];
}

- (void)_updateDebugController
{
  unint64_t v3 = [(PKTextInputInteraction *)self _debugControllerAnchorCorner];
  double v4 = [(PKTextInputInteraction *)self _debugViewController];

  if (!v3 || v4)
  {
    if (!v3 && v4)
    {
      BOOL v14 = [(PKTextInputInteraction *)self _debugViewController];
      char v15 = [v14 view];
      [v15 removeFromSuperview];

      double v16 = [(PKTextInputInteraction *)self _debugViewController];
      [v16 willMoveToParentViewController:0];

      double v17 = [(PKTextInputInteraction *)self _debugViewController];
      [v17 removeFromParentViewController];

      double v18 = [(PKTextInputInteraction *)self _debugViewController];
      [v18 setIntrospectorDataSource:0];

      uint64_t v19 = [(PKTextInputInteraction *)self _debugStateIntrospector];
      [v19 setDelegate:0];

      [(PKTextInputInteraction *)self set_debugStateIntrospector:0];
      [(PKTextInputInteraction *)self set_debugViewController:0];
    }
  }
  else
  {
    double v5 = objc_alloc_init(PKTextInputDebugViewController);
    [(PKTextInputInteraction *)self set_debugViewController:v5];
    [(PKTextInputDebugViewController *)v5 setDelegate:self];
    double v6 = [(PKTextInputInteraction *)self _debugLogController];
    [(PKTextInputDebugViewController *)v5 setDebugLogController:v6];

    double v7 = [(PKTextInputDebugViewController *)v5 view];
    double v8 = [(PKTextInputInteraction *)self view];
    [v8 bounds];
    objc_msgSend(v7, "setFrame:");

    [v7 setAutoresizingMask:18];
    double v9 = [(PKTextInputInteraction *)self view];
    [v9 addSubview:v7];

    uint64_t v10 = [[PKTextInputDebugStateIntrospector alloc] initWithInteraction:self];
    [(PKTextInputInteraction *)self set_debugStateIntrospector:v10];

    BOOL v11 = [(PKTextInputInteraction *)self _debugStateIntrospector];
    [v11 setDelegate:v5];

    int v12 = [(PKTextInputInteraction *)self _debugStateIntrospector];
    [(PKTextInputDebugViewController *)v5 setIntrospectorDataSource:v12];

    double v13 = [(PKTextInputInteraction *)self _debugViewController];
    [v13 setNeedsReloadDebugStateData];
  }
  CGRect v20 = [(PKTextInputInteraction *)self elementsController];
  CGRect v21 = [(PKTextInputInteraction *)self _debugViewController];
  [v21 setElementsController:v20];

  unint64_t v22 = [(PKTextInputInteraction *)self _debugControllerAnchorCorner];
  id v23 = [(PKTextInputInteraction *)self _debugViewController];
  [v23 setStatusViewAnchorCorner:v22];
}

- (id)paletteControllerDebugSharpenerLog:(id)a3
{
  unint64_t v3 = [(PKTextInputInteraction *)self debugLogController];
  double v4 = -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v3);

  return v4;
}

- (void)textInputPaletteControllerFloatingKeyboardWillHide:(id)a3
{
  id v3 = [(PKTextInputInteraction *)self _keyboardSuppressionPolicyDelegate];
  [v3 setIsFloatingKeyboardVisible:0];
}

- (void)textInputPaletteControllerFloatingKeyboardWillShow:(id)a3
{
  double v4 = [(PKTextInputInteraction *)self _cursorController];
  [v4 makeCursorStrong];

  id v5 = [(PKTextInputInteraction *)self _keyboardSuppressionPolicyDelegate];
  [v5 setIsFloatingKeyboardVisible:1];
}

- (id)canvasControllerDrawingGestureRecognizer:(id)a3
{
  [(PKTextInputInteraction *)self _updateGestureRecognizers];

  return [(PKTextInputInteraction *)self drawingGestureRecognizer];
}

- (void)canvasControllerCanvasDidFinishAnimatingStrokes:(id)a3
{
  double v7 = (id *)a3;
  double v4 = [(PKTextInputInteraction *)self handwritingController];
  uint64_t v5 = [v4 writingState];

  double v6 = v7;
  if (v7 && !v5)
  {
    [v7[12] removeStuckStrokesAndSimulateCrashIfNecessary];
    double v6 = v7;
  }
}

- (void)canvasControllerDidEndDrawing:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [v4 timeIntervalSinceReferenceDate];
  -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
  double v6 = [(PKTextInputInteraction *)self _handwritingController];
  [v6 canvasControllerDidEndDrawing:v5];

  double v7 = [(PKTextInputInteraction *)self _reserveSpaceController];
  [v7 setCanvasControllerIsDrawing:0];

  [(PKTextInputInteraction *)self _updateCanvasController];

  [(PKTextInputInteraction *)self _updateInteractionEnabled];
}

- (void)canvasControllerInProgressStrokeDidChange:(id)a3
{
  id v9 = a3;
  double v4 = [(PKTextInputInteraction *)self _hoverController];
  -[PKTextInputHoverController didReceiveNormalTouch:](v4, 0);

  id v5 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
  if ([v5 strokeAcceptanceState] == 1)
  {
    uint64_t v6 = [(PKTextInputInteraction *)self canvasController];
    if (v6)
    {
      double v7 = (void *)v6;
      int v8 = [*(id *)(v6 + 96) isDrawing];

      if (!v8) {
        goto LABEL_6;
      }
      id v5 = [(PKTextInputInteraction *)self _handwritingController];
      [v5 canvasControllerInProgressStrokeDidChange:v9];
    }
  }

LABEL_6:
}

- (void)canvasControllerDidCancelStroke:(id)a3 strokeAcceptanceState:(int64_t)a4
{
  id v6 = a3;
  double v7 = [(PKTextInputInteraction *)self _handwritingController];
  [v7 canvasControllerDidCancelStroke:v6 strokeAcceptanceState:a4];

  int v8 = [(PKTextInputInteraction *)self _reserveSpaceController];
  [v8 setCanvasControllerIsDrawing:0];

  [(PKTextInputInteraction *)self _updateCanvasController];
}

- (void)canvasControllerEndedStroke:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [v4 timeIntervalSinceReferenceDate];
  -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
  id v6 = [(PKTextInputInteraction *)self _handwritingController];
  [v6 canvasControllerEndedStroke:v5];

  double v7 = [(PKTextInputInteraction *)self _reserveSpaceController];
  [v7 setCanvasControllerIsDrawing:0];

  [(PKTextInputInteraction *)self _updateCanvasController];
}

- (void)canvasController:(id)a3 drawingDidChange:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [(PKTextInputInteraction *)self _handwritingController];
  [v8 canvasController:v7 drawingDidChange:v6];

  [(PKTextInputInteraction *)self _updateCanvasController];
}

- (id)canvasControllerPreferredStrokeColor:(id)a3 animated:(BOOL *)a4
{
  id v6 = [(PKTextInputInteraction *)self _canvasController];
  id v7 = -[PKTextInputCanvasController defaultStrokeColor](v6);

  int v8 = [(PKTextInputInteraction *)self handwritingController];
  [v8 strokeAlphaOverride];
  double v10 = v9;

  BOOL v11 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
  if ([v11 strokeAcceptanceState])
  {
  }
  else
  {
    int v12 = [(PKTextInputInteraction *)self _handwritingController];
    uint64_t v13 = [v12 writingState];

    if (!v13)
    {
      BOOL v14 = 0;
      double v10 = 0.2;
      goto LABEL_8;
    }
  }
  if (v10 >= 1.0)
  {
    BOOL v14 = 0;
    goto LABEL_9;
  }
  BOOL v14 = 1;
LABEL_8:
  uint64_t v15 = [v7 colorWithAlphaComponent:v10];

  id v7 = (void *)v15;
LABEL_9:
  *a4 = v14;

  return v7;
}

- (void)_updateCanvasStrokeColor
{
  id v2 = [(PKTextInputInteraction *)self _canvasController];
  -[PKTextInputCanvasController reloadPreferredStrokeColor]((uint64_t)v2);
}

- (BOOL)isCursorWeak
{
  id v2 = [(PKTextInputInteraction *)self cursorController];
  char v3 = [v2 isCursorWeak];

  return v3;
}

- (BOOL)cursorControllerCustomHighlightFeedbackIsVisible:(id)a3
{
  double v4 = [(PKTextInputInteraction *)self _feedbackController];
  int v5 = [v4 showingCustomFeedback];

  if (!v5) {
    return 0;
  }
  id v6 = [(PKTextInputInteraction *)self _feedbackController];
  uint64_t v7 = [v6 feedbackType];

  return (unint64_t)(v7 - 1) < 2;
}

- (int64_t)cursorControllerWritingState:(id)a3
{
  double v4 = [(PKTextInputInteraction *)self _handwritingController];
  if (v4)
  {
    int v5 = [(PKTextInputInteraction *)self _handwritingController];
    int64_t v6 = [v5 writingState];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)windowSceneForController:(id)a3
{
  char v3 = [(PKTextInputInteraction *)self _containerView];
  double v4 = [v3 window];
  int v5 = [v4 windowScene];

  return v5;
}

- (id)hoverController:(id)a3 topLevelHitViewAt:(CGPoint)a4
{
  return -[PKTextInputInteraction _topLevelHitViewForContainerViewPosition:event:](self, "_topLevelHitViewForContainerViewPosition:event:", 0, a4.x, a4.y);
}

- (void)hoverControllerDidLift:(id)a3
{
  double v4 = +[PKHoverSettings sharedSettings];
  int v5 = [v4 scribbleCommitOnLift];

  if (v5)
  {
    id v6 = [(PKTextInputInteraction *)self _handwritingController];
    [v6 quickCommitIfPossible];
  }
}

- (void)feedbackControllerShowingCustomFeedbackDidChange:(id)a3
{
  id v3 = [(PKTextInputInteraction *)self _cursorController];
  [v3 customHighlightFeedbackVisibilityDidChange];
}

- (void)handwritingControllerWritingStateDidChange:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  [v4 timeIntervalSinceReferenceDate];
  -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
  uint64_t v6 = [v5 writingState];

  uint64_t v7 = [(PKTextInputInteraction *)self _paletteController];
  [v7 _setWritingStateActive:v6 == 1];

  int v8 = [(PKTextInputInteraction *)self _cursorController];
  [v8 writingStateDidChange];

  [(PKTextInputInteraction *)self _updateCanvasStrokeColor];
}

- (void)handwritingControllerDidFinishActiveCommands:(id)a3
{
  id v3 = [(PKTextInputInteraction *)self _keyboardSuppressionPolicyDelegate];
  [v3 updateKeyboardSuppressionPolicy];
}

- (void)elementsControllerLastDiscoveredElementsDidChange:(id)a3
{
  id v3 = [(PKTextInputInteraction *)self _debugViewController];
  [v3 setNeedsReloadTargetsVisualization];
}

- (id)containerView:(id)a3 hitTest:(CGPoint)a4 withEvent:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  double v9 = v8;
  if (v8 && [v8 type] != 11)
  {
    double v10 = [(PKTextInputInteraction *)self _hoverController];
    -[PKTextInputHoverController didReceiveNormalTouch:](v10, 0);
  }
  if (!objc_msgSend(v9, "PK_isEventFromPencil"))
  {
LABEL_7:
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  BOOL v11 = +[PKTextInputSettings sharedSettings];
  if ([v11 isScribbleActive])
  {
    int v12 = [(PKTextInputInteraction *)self _containerView];
    int v13 = [v12 isHidden];

    if (!v13) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }

  if (v9)
  {
LABEL_10:
    if (objc_msgSend(v9, "PK_isEventFromPencil")) {
      goto LABEL_13;
    }
    BOOL v14 = [(PKTextInputInteraction *)self handwritingController];
    uint64_t v15 = [v14 writingState];

    if (v15 != 1) {
      goto LABEL_13;
    }
LABEL_12:
    double v16 = [(PKTextInputInteraction *)self _containerView];
    goto LABEL_14;
  }
LABEL_13:
  double v16 = 0;
LABEL_14:

  return v16;
}

- (id)_topLevelHitViewForContainerViewPosition:(CGPoint)a3 event:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(PKTextInputInteraction *)self view];
  double v9 = [v8 window];

  double v10 = [v9 windowScene];
  BOOL v11 = [v10 _visibleWindows];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v35;
    double v17 = -1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        CGRect v20 = [(PKTextInputInteraction *)self _containerView];
        objc_msgSend(v20, "PK_convertPoint:toView:", v19, x, y);
        double v22 = v21;
        double v24 = v23;

        v25 = objc_msgSend(v19, "hitTest:withEvent:", 0, v22, v24);
        int v26 = v25;
        if (v25)
        {
          v27 = [v25 window];
          [v27 windowLevel];
          double v29 = v28;

          if (v29 > v17)
          {
            id v30 = v26;

            v31 = [v30 window];
            [v31 windowLevel];
            double v17 = v32;

            uint64_t v15 = v30;
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)_shouldAvoidStartingDrawingOnView:(id)a3 location:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (+[PKTextInputElementsFinder responderSupportsPencilTextInput:]((uint64_t)PKTextInputElementsFinder, v6) & 1) == 0)
  {
    BOOL v7 = +[PKTextInputElementsFinder shouldConsiderTextInputSearchForView:(uint64_t)PKTextInputElementsFinder referenceHitPoint:v6 referenceCoordSpace:v6];
    id v8 = v6;
    double v9 = v8;
    if (v8)
    {
      double v10 = v8;
      while (1)
      {
        BOOL v11 = PKScribbleInteractionInView(v10);
        if ([v11 isElementContainer]) {
          break;
        }
        uint64_t v12 = [v10 superview];

        double v10 = (void *)v12;
        if (!v12) {
          goto LABEL_7;
        }
      }
    }
    else
    {
LABEL_7:
      if (!v7)
      {
        uint64_t v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = -[NSObject _pkDebugStringRepresentation](v9);
          int v26 = 138412290;
          v27 = v14;
          _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Avoid starting to draw on view %@ because it's a control and is not an editable text view", (uint8_t *)&v26, 0xCu);
        }
        goto LABEL_26;
      }
    }
  }
  uint64_t v15 = PKScribbleInteractionInView(v6);
  os_log_t v16 = v15;
  if (v15 && (-[NSObject shouldBeginAtLocation:](v15, "shouldBeginAtLocation:", x, y) & 1) == 0)
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v6, "set_textInputSource:", 0);
    }
    double v23 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      double v24 = -[NSObject _pkDebugStringRepresentation](v6);
      int v26 = 138412290;
      v27 = v24;
      _os_log_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_DEFAULT, "Avoid starting to draw on view %@ because interaction delegate shouldBeginAtLocation: N", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_25;
  }

  double v17 = +[PKTextInputSettings sharedSettings];
  char v18 = [v17 enableOnRemoteViews];

  if ((v18 & 1) == 0)
  {
    uint64_t v19 = [v6 window];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      os_log_t v16 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        double v21 = -[NSObject _pkDebugStringRepresentation](v6);
        int v26 = 138412290;
        v27 = v21;
        _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEFAULT, "Avoid starting to draw on view %@ because it is in a hosted window", (uint8_t *)&v26, 0xCu);
      }
LABEL_25:

LABEL_26:
      char v22 = 1;
      goto LABEL_27;
    }
  }
  char v22 = +[PKTextInputElementsFinder shouldAvoidElementWithHitView:]((uint64_t)PKTextInputElementsFinder, v6);
LABEL_27:

  return v22;
}

- (BOOL)_isTapAwayFromCurrentStrokesAtCanvasViewLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(PKTextInputInteraction *)self _canvasController];
  double v6 = -[PKTextInputCanvasController renderedStrokesBounds]((uint64_t)v5);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v24.origin.double x = v6;
  v24.origin.double y = v8;
  v24.size.double width = v10;
  v24.size.double height = v12;
  if (CGRectIsNull(v24)) {
    return 0;
  }
  if (x >= v6)
  {
    double v13 = v6 + v10;
    BOOL v14 = x <= v6 + v10;
    double v6 = x;
    if (!v14) {
      double v6 = v13;
    }
  }
  double v15 = v8 + v12;
  if (y <= v8 + v12) {
    double v15 = y;
  }
  if (y >= v8) {
    double v8 = v15;
  }
  if (v6 - x >= 0.0) {
    double v16 = v6 - x;
  }
  else {
    double v16 = -(v6 - x);
  }
  double v17 = +[PKTextInputSettings sharedSettings];
  [v17 drawingGestureDetectTapAwayFromCurrentStrokesHorizontalDistance];
  if (v16 > v18)
  {
  }
  else
  {
    if (v8 - y >= 0.0) {
      double v19 = v8 - y;
    }
    else {
      double v19 = -(v8 - y);
    }
    CGRect v20 = +[PKTextInputSettings sharedSettings];
    [v20 drawingGestureDetectTapAwayFromCurrentStrokesVerticalDistance];
    double v22 = v21;

    if (v19 <= v22) {
      return 0;
    }
  }
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(PKTextInputInteraction *)self _touchDetectionGestureRecognizer];

  if (v6 != v5)
  {
    [(PKTextInputInteraction *)self _touchDetectionGestureRecognizer];
  }
  return 1;
}

- (void)touchesDetected
{
  id v3 = [(PKTextInputInteraction *)self _handwritingController];
  uint64_t v4 = [v3 writingState];

  if (v4 != 1)
  {
    id v5 = [(PKTextInputInteraction *)self _reserveSpaceController];
    [v5 finishReserveSpaceAndInsertWhitespace:0];
  }
}

- (void)reserveSpaceControllerIsActiveChanged:(id)a3
{
  [(PKTextInputInteraction *)self _updateCanvasController];
  [(PKTextInputInteraction *)self _updateInteractionEnabled];
  [(PKTextInputInteraction *)self _updateGestureRecognizers];
  uint64_t v4 = [(PKTextInputInteraction *)self _handwritingController];
  [v4 reserveSpaceControllerIsActiveChanged];

  id v5 = [(PKTextInputInteraction *)self _reserveSpaceController];
  int v6 = [v5 isReserveSpaceActive];

  if (v6)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
  }
}

- (void)reserveSpaceControllerIsPlaceholderVisibleChanged:(id)a3
{
  uint64_t v4 = [(PKTextInputInteraction *)self reserveSpaceController];
  int v5 = [v4 isReserveSpacePlaceholderVisible];

  if (v5)
  {
    int v6 = [(PKTextInputInteraction *)self cursorController];
    [v6 makeCursorStrong];

    id v7 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
    [v7 cancelDrawing];
  }
}

- (void)reserveSpaceController:(id)a3 willFocusElement:(id)a4
{
  id v5 = a4;
  id v6 = [(PKTextInputInteraction *)self handwritingController];
  [v6 reserveSpaceControllerWillFocusElement:v5];
}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(PKTextInputInteraction *)self _containerView];
  v104 = v8;
  [v8 locationInView:v11];
  double v13 = v12;
  double v15 = v14;

  double v16 = [(PKTextInputInteraction *)self _containerView];
  uint64_t v17 = [v16 window];
  double v18 = [(id)v17 windowScene];
  double v19 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v18];

  CGRect v20 = v10;
  double v21 = [(PKTextInputInteraction *)self _containerView];
  LOBYTE(v17) = objc_msgSend(v19, "_isPointInsidePaletteView:fromView:withEvent:", v21, v10, v13, v15);

  if (v17)
  {
    BOOL v22 = 0;
    double v23 = v104;
    goto LABEL_59;
  }
  [(PKTextInputInteraction *)self set_beginGestureElement:0];
  [(PKTextInputInteraction *)self set_beginGestureElementContentForLineBreak:0];
  CGRect v24 = [(PKTextInputInteraction *)self _hoverController];
  -[PKTextInputHoverController didReceiveNormalTouch:](v24, 0);

  v102 = v19;
  if (!objc_msgSend(v10, "PK_isEventFromPencil"))
  {
LABEL_12:
    char v32 = 1;
    goto LABEL_13;
  }
  v25 = +[PKTextInputSettings sharedSettings];
  char v26 = [v25 isScribbleActive];

  if ((v26 & 1) == 0)
  {
    v33 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      long long v34 = [v104 drawingTouch];
      *(_DWORD *)buf = 134217984;
      v117 = v34;
      _os_log_impl(&dword_1C44F8000, v33, OS_LOG_TYPE_DEFAULT, "Delegate to gesture touch %p, shouldBeginDrawing: N, because there is no active locale.", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v99 = v10;
  v27 = [(PKTextInputInteraction *)self view];
  uint64_t v28 = [v27 window];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v29 = (void *)MEMORY[0x1E4FB1D68];
    id v30 = [v28 windowScene];
    v31 = [v29 activeTextEffectsWindowForWindowScene:v30];

    if (v31 != v28)
    {

LABEL_8:
      char v32 = 1;
LABEL_31:
      double v23 = v104;
LABEL_50:
      CGRect v20 = v99;
      goto LABEL_51;
    }
  }

  v100 = v9;
  long long v35 = [v9 anyObject];
  long long v36 = [v35 view];
  long long v37 = [v36 window];
  v38 = [v37 windowScene];

  if (v38)
  {
    uint64_t v39 = [(PKTextInputInteraction *)self view];
    [v104 locationInView:v39];
    double v41 = v40;
    double v43 = v42;

    -[PKTextInputInteraction _handlePotentialDebugOverlayGestureAtPoint:](self, "_handlePotentialDebugOverlayGestureAtPoint:", v41, v43);
  }
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v9 = v100;
  id obj = v100;
  uint64_t v44 = [obj countByEnumeratingWithState:&v112 objects:v120 count:16];
  if (!v44) {
    goto LABEL_28;
  }
  uint64_t v45 = v44;
  uint64_t v103 = *(void *)v113;
  while (2)
  {
    for (uint64_t i = 0; i != v45; ++i)
    {
      if (*(void *)v113 != v103) {
        objc_enumerationMutation(obj);
      }
      v47 = *(void **)(*((void *)&v112 + 1) + 8 * i);
      v48 = [v47 window];
      v49 = [(PKTextInputInteraction *)self view];
      uint64_t v50 = [v49 window];
      if (v48 == (void *)v50)
      {
      }
      else
      {
        v51 = (void *)v50;
        v52 = [v47 window];
        [v52 windowLevel];
        double v54 = v53;
        v55 = [(PKTextInputInteraction *)self view];
        v56 = [v55 window];
        [v56 windowLevel];
        double v58 = v57;

        if (v54 > v58)
        {
          v71 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
          double v23 = v104;
          if (v72)
          {
            v73 = [v104 drawingTouch];
            v74 = [v47 window];
            v75 = -[NSObject _pkDebugStringRepresentation](v74);
            *(_DWORD *)buf = 134218242;
            v117 = v73;
            __int16 v118 = 2112;
            v119 = v75;
            _os_log_impl(&dword_1C44F8000, v71, OS_LOG_TYPE_DEFAULT, "Delegate to gesture touch %p, shouldBeginDrawing: N, because the touch is on a higher level window %@", buf, 0x16u);
          }
LABEL_49:
          id v9 = v100;

          char v32 = 1;
          goto LABEL_50;
        }
      }
      v59 = [v47 window];
      v60 = [v59 windowScene];
      v61 = [(PKTextInputInteraction *)self view];
      v62 = [v61 window];
      v63 = [v62 windowScene];

      if (v60 != v63)
      {
        v71 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        double v23 = v104;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
        {
          v68 = [v104 drawingTouch];
          v69 = [v47 window];
          v70 = [v69 windowScene];
          *(_DWORD *)buf = 134218242;
          v117 = v68;
          __int16 v118 = 2112;
          v119 = v70;
          _os_log_impl(&dword_1C44F8000, v71, OS_LOG_TYPE_DEFAULT, "Delegate to gesture touch %p, shouldBeginDrawing: N, because the touch is on a different scene %@", buf, 0x16u);
        }
        goto LABEL_49;
      }
    }
    uint64_t v45 = [obj countByEnumeratingWithState:&v112 objects:v120 count:16];
    id v9 = v100;
    if (v45) {
      continue;
    }
    break;
  }
LABEL_28:

  uint64_t v64 = [(PKTextInputInteraction *)self _handwritingController];
  if (v64)
  {
    v65 = (void *)v64;
    v66 = [(PKTextInputInteraction *)self _handwritingController];
    uint64_t v67 = [v66 writingState];

    if (v67)
    {
      char v32 = 0;
      goto LABEL_31;
    }
  }
  v76 = -[PKTextInputInteraction _topLevelHitViewForContainerViewPosition:event:](self, "_topLevelHitViewForContainerViewPosition:event:", 0, v13, v15);
  if (v76)
  {
    v77 = [(PKTextInputInteraction *)self _containerView];
    BOOL v78 = [(PKTextInputInteraction *)self _shouldAvoidStartingDrawingOnView:v76 location:PK_convertRectFromCoordinateSpaceToCoordinateSpace(v77, v76, v13, v15, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8))];

    if (v78)
    {
      v79 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        v80 = [v104 drawingTouch];
        v81 = -[NSObject _pkDebugStringRepresentation](v76);
        *(_DWORD *)buf = 134218242;
        v117 = v80;
        __int16 v118 = 2112;
        v119 = v81;
        _os_log_impl(&dword_1C44F8000, v79, OS_LOG_TYPE_DEFAULT, "Delegate to gesture touch %p, shouldBeginDrawing: N, because should avoid drawing on hit view %@", buf, 0x16u);
      }
      goto LABEL_8;
    }
  }

  v82 = [(PKTextInputInteraction *)self view];
  v83 = [v82 window];
  v84 = [v83 windowScene];
  uint64_t v85 = [v84 _visibleWindows];
  v86 = (void *)v85;
  v87 = (void *)MEMORY[0x1E4F1CBF0];
  if (v85) {
    v87 = (void *)v85;
  }
  id v88 = v87;

  v89 = -[PKTextInputElementsFinder initWithWindowsToSearch:]([PKTextInputSingleElementFinder alloc], v88);
  CGRect v20 = v99;
  if (v89)
  {
    if (v89[9])
    {
      uint64_t v90 = [(PKTextInputInteraction *)self _hoverController];
      if (!v90
        || (v91 = (void *)v90, CFTimeInterval v92 = CACurrentMediaTime() - *(double *)(v90 + 136), v91, v92 >= 0.1))
      {
        v89[9] = 0;
      }
    }
  }
  [(PKTextInputInteraction *)self set_drawingGestureElementFinder:v89];
  v93 = (void *)[obj copy];
  v94 = [(PKTextInputInteraction *)self _containerView];
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __87__PKTextInputInteraction_drawingGestureRecognizer_shouldBeginDrawingWithTouches_event___block_invoke;
  v105[3] = &unk_1E64C6D28;
  id v106 = v89;
  v107 = self;
  id v108 = v93;
  id v109 = v99;
  double v110 = v13;
  double v111 = v15;
  id v95 = v93;
  v96 = v89;
  objc_msgSend(v96, "findSingleElementCloseToPosition:coordinateSpace:completion:", v94, v105, v13, v15);

  char v32 = 0;
LABEL_13:
  double v23 = v104;
LABEL_51:
  if ([v23 state] == 5 || (objc_msgSend(v23, "state") == 4 ? (char v97 = 1) : (char v97 = v32), (v97 & 1) != 0))
  {
    BOOL v22 = 0;
  }
  else
  {
    [(PKTextInputInteraction *)self _updateCanvasStrokeColor];
    BOOL v22 = 1;
  }
  double v19 = v102;
LABEL_59:

  return v22;
}

void __87__PKTextInputInteraction_drawingGestureRecognizer_shouldBeginDrawingWithTouches_event___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) _drawingGestureElementFinder];

  if (v2 == v3)
  {
    [*(id *)(a1 + 40) _notifyTargetElementOfTouches:*(void *)(a1 + 48) event:*(void *)(a1 + 56)];
    uint64_t v4 = *(void **)(a1 + 40);
    double v5 = *(double *)(a1 + 64);
    double v6 = *(double *)(a1 + 72);
    objc_msgSend(v4, "_drawingGestureElementFinderDidFinishWithLocationInContainerView:", v5, v6);
  }
}

- (BOOL)drawingGestureRecognizerRequiresTargetElementToBegin:(id)a3
{
  uint64_t v4 = [(PKTextInputInteraction *)self _handwritingController];
  if (v4)
  {
    double v5 = [(PKTextInputInteraction *)self _handwritingController];
    uint64_t v6 = [v5 writingState];

    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)drawingGestureRecognizerRequiresPastTapToBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKTextInputInteraction *)self _handwritingController];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    BOOL v7 = [(PKTextInputInteraction *)self _handwritingController];
    uint64_t v8 = [v7 writingState];

    if (v8 == 1)
    {
      id v10 = [(PKTextInputInteraction *)self _containerView];
      [v4 locationInView:v10];
      BOOL v9 = -[PKTextInputInteraction _isTapAwayFromCurrentStrokesAtCanvasViewLocation:](self, "_isTapAwayFromCurrentStrokesAtCanvasViewLocation:");

      goto LABEL_7;
    }
    if (v8)
    {
      BOOL v9 = 0;
      goto LABEL_7;
    }
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)drawingGestureRecognizerLongPressShouldBegin:(id)a3
{
  id v4 = +[PKTextInputSettings sharedSettings];
  int v5 = [v4 enableReserveSpace];

  if (!v5) {
    return 0;
  }
  uint64_t v6 = [(PKTextInputInteraction *)self _handwritingController];
  if (v6)
  {
    BOOL v7 = [(PKTextInputInteraction *)self _handwritingController];
    uint64_t v8 = [v7 writingState];

    BOOL v9 = v8 == 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)drawingGestureRecognizerLongPressStateDidChange:(id)a3
{
  id v12 = a3;
  switch([v12 longPressState])
  {
    case 0:
    case 3:
      id v4 = [(PKTextInputInteraction *)self _reserveSpaceController];
      [v4 cancelReserveSpaceIntro];
      goto LABEL_5;
    case 1:
      id v4 = [v12 targetElement];
      int v5 = [(PKTextInputInteraction *)self view];
      [v12 locationInView:v5];
      double v7 = v6;
      double v9 = v8;

      id v10 = [(PKTextInputInteraction *)self _reserveSpaceController];
      double v11 = [(PKTextInputInteraction *)self view];
      objc_msgSend(v10, "beginIfPossibleWithElement:atLocation:coordinateSpace:", v4, v11, v7, v9);

      goto LABEL_5;
    case 2:
      id v4 = [(PKTextInputInteraction *)self _reserveSpaceController];
      [v4 reserveSpaceWhenReady];
LABEL_5:

      break;
    default:
      break;
  }
}

- (void)drawingGestureStrokeAcceptanceStateDidChange:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 strokeAcceptanceState];
  if (v4 == 2)
  {
    [v8 cancel];
  }
  else if (v4 == 1)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[PKTextInputInteraction _setLastHandwritingEventTimestamp:](self, "_setLastHandwritingEventTimestamp:");
    int v5 = [(PKTextInputInteraction *)self _handwritingController];
    double v6 = [(PKTextInputInteraction *)self _canvasController];
    [v5 canvasControllerDidBeginDrawing:v6];

    double v7 = [(PKTextInputInteraction *)self _reserveSpaceController];
    [v7 setCanvasControllerIsDrawing:1];
  }
  [(PKTextInputInteraction *)self _updateCanvasStrokeColor];
  [(PKTextInputInteraction *)self _updateCanvasController];
}

- (void)drawingGestureRecognizerDrawingTargetIsDrawingDidChange:(id)a3
{
  id v4 = a3;
  [(PKTextInputInteraction *)self _updateCanvasController];
  LODWORD(self) = [v4 drawingTargetIsDrawing];

  if (self)
  {
    id v5 = [MEMORY[0x1E4FB1978] sharedMenuController];
    [v5 hideMenu];
  }
}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldFinishGestureWithTouch:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 strokeAcceptanceState] != 1)
  {
    double v9 = [v6 targetElement];
    if (!v9 || [v6 state] || (objc_msgSend(v6, "hasMovedPastTapUseTimestampFromTouch:", 1) & 1) != 0)
    {
      id v10 = [(PKTextInputInteraction *)self _containerView];
      char v11 = [v10 isHidden];

      if (v11)
      {
        BOOL v8 = 0;
LABEL_14:

        goto LABEL_15;
      }
      id v12 = [(PKTextInputInteraction *)self _containerView];
      [v6 locationInView:v12];
      double v13 = -[PKTextInputInteraction _topLevelHitViewForContainerViewPosition:event:](self, "_topLevelHitViewForContainerViewPosition:event:", 0);

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v13 sendActionsForControlEvents:64];
        double v14 = os_log_create("com.apple.pencilkit", "PencilTextInput");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          double v15 = -[NSObject _pkDebugStringRepresentation](v13);
          int v17 = 138412290;
          double v18 = v15;
          _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, "Using drawing gesture as touch up inside control: %@", (uint8_t *)&v17, 0xCu);
        }
      }
      BOOL v8 = 0;
    }
    else
    {
      BOOL v8 = [(PKTextInputInteraction *)self _handleDrawingGestureTapInElement:v9 gesture:v6 touch:v7];
      double v13 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        double v18 = v9;
        _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Using drawing gesture as tap instead. element: %@", (uint8_t *)&v17, 0xCu);
      }
    }

    goto LABEL_14;
  }
  BOOL v8 = 1;
LABEL_15:

  return v8;
}

- (void)_notifyTargetElementOfTouches:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PKTextInputInteraction *)self _drawingGestureElementFinder];
  BOOL v8 = [v9 foundElement];
  -[PKTextInputElement didTargetElementForTouches:event:](v8, v7, v6);
}

- (void)_drawingGestureElementFinderDidFinishWithLocationInContainerView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(PKTextInputInteraction *)self _drawingGestureElementFinder];
  [(PKTextInputInteraction *)self set_drawingGestureElementFinder:0];
  id v7 = [(PKTextInputInteraction *)self drawingGestureRecognizer];
  BOOL v8 = [v6 foundElement];
  id v9 = [v6 candidateElements];
  [v7 finishedElementFindingWithElement:v8 candidateElements:v9];

  [(PKTextInputInteraction *)self _updateCanvasStrokeColor];
  uint64_t v10 = [(PKTextInputInteraction *)self _handwritingController];
  if (!v10
    || (char v11 = (void *)v10,
        [(PKTextInputInteraction *)self _handwritingController],
        id v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 writingState],
        v12,
        v11,
        !v13))
  {
    double v14 = +[PKTextInputSettings sharedSettings];
    int v15 = [v14 lineBreakOnTapEnabled];

    if (v15)
    {
      [(PKTextInputInteraction *)self set_beginGestureElementContentForLineBreak:0];
      [(PKTextInputInteraction *)self set_beginGestureElement:0];
      double v16 = [v6 foundElement];
      int v17 = -[PKTextInputElement isFocused]((uint64_t)v16);

      if (v17)
      {
        double v18 = [v6 foundElement];
        [(PKTextInputInteraction *)self set_beginGestureElement:v18];

        uint64_t v19 = [(PKTextInputInteraction *)self _containerView];
        CGRect v20 = [(PKTextInputInteraction *)self _beginGestureElement];
        double v21 = -[PKTextInputElement coordinateSpace]((uint64_t)v20);
        double v22 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v19, v21, x, y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        CGFloat v24 = v23;

        objc_initWeak(&location, self);
        v25 = [(PKTextInputInteraction *)self _beginGestureElement];
        char v26 = [(PKTextInputInteraction *)self _cursorController];
        LOBYTE(v20) = [v26 isCursorWeak];
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __91__PKTextInputInteraction__drawingGestureElementFinderDidFinishWithLocationInContainerView___block_invoke;
        v27[3] = &unk_1E64C6D50;
        objc_copyWeak(&v28, &location);
        [(PKTextInputElement *)(uint64_t)v25 evaluateLineBreakForTapAtLocation:0 weakCursor:v27 allowTrailingWhitespace:v22 completion:v24];

        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __91__PKTextInputInteraction__drawingGestureElementFinderDidFinishWithLocationInContainerView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "set_beginGestureElementContentForLineBreak:", v3);
}

- (BOOL)_beginGestureIfPossible:(id)a3
{
  id v4 = a3;
  if ([v4 state])
  {
    BOOL v5 = 0;
  }
  else
  {
    [v4 setState:1];
    BOOL v5 = [v4 state] == 1;
  }
  [(PKTextInputInteraction *)self set_beginGestureElement:0];
  [(PKTextInputInteraction *)self set_beginGestureElementContentForLineBreak:0];

  return v5;
}

- (id)_findControlFromHitView:(id)a3 referenceView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  BOOL v8 = v7;
  id v9 = 0;
  id v10 = v7;
  if (v7 && v7 != v6)
  {
    char v11 = v7;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      id v10 = [v11 superview];

      id v9 = 0;
      if (v10)
      {
        char v11 = v10;
        if (v10 != v6) {
          continue;
        }
      }
      goto LABEL_9;
    }
    id v10 = v11;
    id v9 = v10;
  }
LABEL_9:

  return v9;
}

- (BOOL)_handleDrawingGestureTapInElement:(id)a3 gesture:(id)a4 touch:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v8 = (id *)a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    char v11 = -[PKTextInputElement coordinateSpace]((uint64_t)v8);

    if (v11)
    {
      id v12 = [(PKTextInputInteraction *)self _containerView];
      objc_msgSend(v10, "PK_locationInView:", v12);
      double v14 = v13;
      double v16 = v15;

      int v17 = -[PKTextInputInteraction _topLevelHitViewForContainerViewPosition:event:](self, "_topLevelHitViewForContainerViewPosition:event:", 0, v14, v16);
      if (!v17) {
        goto LABEL_8;
      }
      uint64_t v18 = -[PKTextInputElement referenceView](v8);
      if (!v18) {
        goto LABEL_8;
      }
      uint64_t v19 = (void *)v18;
      CGRect v20 = -[PKTextInputElement referenceView](v8);

      if (v17 == v20) {
        goto LABEL_8;
      }
      double v21 = -[PKTextInputElement referenceView](v8);
      LODWORD(v22) = [v17 isDescendantOfView:v21];

      if (!v22)
      {
LABEL_27:

        goto LABEL_28;
      }
      double v23 = -[PKTextInputElement referenceView](v8);
      CGFloat v24 = [(PKTextInputInteraction *)self _findControlFromHitView:v17 referenceView:v23];

      if (!v24)
      {
LABEL_8:
        v25 = [(PKTextInputInteraction *)self _containerView];
        char v26 = -[PKTextInputElement coordinateSpace]((uint64_t)v8);
        objc_msgSend(v25, "PK_convertPoint:toCoordinateSpace:", v26, v14, v16);
        double v28 = v27;
        CGFloat v30 = v29;

        if (-[PKTextInputElement isFocused]((uint64_t)v8))
        {
          v31 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            int v52 = 138412290;
            double v53 = v8;
            _os_log_impl(&dword_1C44F8000, v31, OS_LOG_TYPE_DEFAULT, "Detected a pencil tap on focused element: %@", (uint8_t *)&v52, 0xCu);
          }

          char v32 = [(PKTextInputInteraction *)self _cursorController];
          [v32 makeCursorStrong];

          v33 = +[PKTextInputSettings sharedSettings];
          if ([v33 enableReserveSpaceTapForNewlines]
            && (-[PKTextInputElement coordinateSpace]((uint64_t)v8), (uint64_t v34 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            long long v35 = (void *)v34;
            long long v36 = [(PKTextInputInteraction *)self _reserveSpaceController];
            int v37 = [v36 isReserveSpaceActive];

            if (!v37
              || ([(PKTextInputInteraction *)self _reserveSpaceController],
                  v38 = objc_claimAutoreleasedReturnValue(),
                  int v39 = objc_msgSend(v38, "tapPointIsInPlaceholder:", v28, v30),
                  v38,
                  !v39)
              || ![(PKTextInputInteraction *)self _beginGestureIfPossible:v9])
            {
              int v40 = 1;
LABEL_23:
              uint64_t v44 = [MEMORY[0x1E4FB1978] sharedMenuController];
              [v44 hideMenu];
              if (v40
                && ([(PKTextInputInteraction *)self _hoverController],
                    uint64_t v45 = objc_claimAutoreleasedReturnValue(),
                    char v46 = [(PKTextInputHoverController *)(uint64_t)v45 performLineBreakAfterTapIfPossibleForElement:v28 location:v30], v45, (v46 & 1) == 0))
              {
                double v22 = [(PKTextInputInteraction *)self _beginGestureElementContentForLineBreak];
                if (v22)
                {
                  v48 = [(PKTextInputInteraction *)self _beginGestureElement];
                  unsigned int v49 = -[PKTextInputElement isEquivalentToElement:](v8, v48);

                  if (v49)
                  {
                    uint64_t v50 = [(PKTextInputInteraction *)self _beginGestureElementContentForLineBreak];
                    uint64_t v51 = -[PKTextInputElementContent contentLength]((uint64_t)v50);
                    [(PKTextInputElementContent *)v50 insertTextsToCommit:&unk_1F200EBB0 withAlternatives:0 activePreviewText:v51 replacingRange:0 completion:&__block_literal_global_21];
                  }
                  LOBYTE(v22) = 0;
                }
              }
              else
              {
                LOBYTE(v22) = 1;
              }
              [(PKTextInputInteraction *)self set_beginGestureElement:0];
              [(PKTextInputInteraction *)self set_beginGestureElementContentForLineBreak:0];

              goto LABEL_27;
            }
            v33 = [(PKTextInputInteraction *)self _reserveSpaceController];
            [v33 finishReserveSpaceAndInsertWhitespace:1];
            int v40 = 0;
          }
          else
          {
            int v40 = 1;
          }

          goto LABEL_23;
        }
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v42 = v41;
        double v43 = [(PKTextInputInteraction *)self cursorController];
        [v43 setLastElementTapToFocusTimestamp:v42];
      }
      LOBYTE(v22) = 0;
      goto LABEL_27;
    }
  }
  LOBYTE(v22) = 0;
LABEL_28:

  return (char)v22;
}

- (void)debugViewControllerNeedsDismiss:(id)a3
{
}

- (BOOL)isFloatingKeyboardVisible
{
  if (_os_feature_enabled_impl())
  {
    id v3 = [(PKTextInputInteraction *)self _paletteController];
    id v4 = [v3 _floatingKeyboardController];
    BOOL v5 = -[PKPaletteFloatingKeyboardController isPresentingKeyboard]((uint64_t)v4);

    return v5;
  }
  else
  {
    id v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v8, 2u);
    }

    return 0;
  }
}

- (void)presentFloatingKeyboard
{
  if (_os_feature_enabled_impl())
  {
    if (![(PKTextInputInteraction *)self isFloatingKeyboardVisible])
    {
      id v5 = [(PKTextInputInteraction *)self _paletteController];
      id v3 = [v5 _floatingKeyboardController];
      -[PKPaletteFloatingKeyboardController presentOrDismissIfPresented]((uint64_t)v3);
    }
  }
  else
  {
    id v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", buf, 2u);
    }
  }
}

- (void)dismissFloatingKeyboard
{
  if (_os_feature_enabled_impl())
  {
    id v3 = [(PKTextInputInteraction *)self _paletteController];
    id v4 = [v3 _floatingKeyboardController];
    -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v4, @"Majel SPI called");
  }
  else
  {
    id v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v10, 2u);
    }
  }

  id v5 = [MEMORY[0x1E4FB1928] activeKeyboardSceneDelegate];
  id v6 = [v5 scene];
  id v7 = +[PKPaletteViewInteraction existingPaletteViewInteractionForWindowScene:v6];

  BOOL v8 = [v7 paletteView];
  id v9 = [v8 floatingKeyboardController];
  -[PKPaletteFloatingKeyboardController dismissWithReason:]((uint64_t)v9, @"UIKit SPI called");
}

- (NSArray)enabledLanguageIdentifiers
{
  if (_os_feature_enabled_impl())
  {
    id v2 = +[PKTextInputLanguageSelectionController supportedAndEnabledLocaleIdentifiers];
  }
  else
  {
    id v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v5, 2u);
    }

    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v2;
}

- (NSString)currentLanguageIdentifier
{
  if (_os_feature_enabled_impl())
  {
    id v2 = +[PKTextInputLanguageSelectionController sharedInstance];
    id v3 = [v2 currentLanguageIdentifiers];
    id v4 = [v3 firstObject];
  }
  else
  {
    id v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v7, 2u);
    }

    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setCurrentLanguageIdentifier:(id)a3
{
  id v3 = a3;
  if (_os_feature_enabled_impl())
  {
    id v4 = +[PKTextInputLanguageSelectionController sharedInstance];
    id v5 = (void *)[v3 copy];
    [v4 _switchToLanguageIfSupported:v5];
  }
  else
  {
    id v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", v6, 2u);
    }
  }
}

- (void)presentProblemReportingView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if _os_feature_enabled_impl() && (os_variant_has_internal_diagnostics())
  {
    id v4 = [(PKTextInputInteraction *)self view];
    id v5 = [v4 window];
    id v3 = [v5 rootViewController];

    if (v3)
    {
      id v6 = [(PKTextInputInteraction *)self debugLogController];
      id v7 = -[PKTextInputDebugLogController sharpenerLogWithCurrentContent](v6);

      BOOL v8 = [[PKTextInputDebugRadarViewController alloc] initWithSharpenerLog:v7];
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v8];
      [v9 setModalPresentationStyle:2];
      [v3 presentViewController:v9 animated:1 completion:0];
      id v10 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_INFO, "Problem reporting UI presented from view controller %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412290;
        id v12 = 0;
        _os_log_error_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_ERROR, "Can't present internal-only problem reporting UI from view controller %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    id v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_INFO, "Feature Flag is not enabled or not an internal build.", (uint8_t *)&v11, 2u);
    }
  }
}

- (void)textInputLanguageSelectionControllerDidChangeLanguage:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v10 = @"UITextInputUpdateKeyboardLanguageKey";
    uint64_t v4 = [(PKTextInputInteraction *)self currentLanguageIdentifier];
    id v5 = (void *)v4;
    id v6 = &stru_1F1FB2C00;
    if (v4) {
      id v6 = (__CFString *)v4;
    }
    v11[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

    BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"UITextInputUpdateKeyboardLanguageNotification" object:self userInfo:v7];
  }
  else
  {
    id v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "Feature Flag is not enabled. Language selection change can't be notified.", v9, 2u);
    }
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (PKTContainerView)_containerView
{
  return self->__containerView;
}

- (void)set_containerView:(id)a3
{
}

- (PKTextInputCanvasController)_canvasController
{
  return self->__canvasController;
}

- (PKTextInputFeedbackController)_feedbackController
{
  return self->__feedbackController;
}

- (void)set_feedbackController:(id)a3
{
}

- (PKTextInputPaletteController)_paletteController
{
  return self->__paletteController;
}

- (void)set_paletteController:(id)a3
{
}

- (PKTextInputTouchDetectionGestureRecognizer)_touchDetectionGestureRecognizer
{
  return self->__touchDetectionGestureRecognizer;
}

- (void)set_touchDetectionGestureRecognizer:(id)a3
{
}

- (PKTextInputElementsController)_elementsController
{
  return self->__elementsController;
}

- (void)set_elementsController:(id)a3
{
}

- (PKTextInputHandwritingController)_handwritingController
{
  return self->__handwritingController;
}

- (void)set_handwritingController:(id)a3
{
}

- (BOOL)_handwritingInteractionEnabled
{
  return self->__handwritingInteractionEnabled;
}

- (double)_lastHandwritingEventTimestamp
{
  return self->__lastHandwritingEventTimestamp;
}

- (PKTextInputDrawingGestureRecognizer)drawingGestureRecognizer
{
  return self->_drawingGestureRecognizer;
}

- (void)setDrawingGestureRecognizer:(id)a3
{
}

- (PKTextInputSingleElementFinder)_drawingGestureElementFinder
{
  return self->__drawingGestureElementFinder;
}

- (void)set_drawingGestureElementFinder:(id)a3
{
}

- (PKTextInputKeyboardSuppressionPolicyDelegate)_keyboardSuppressionPolicyDelegate
{
  return self->__keyboardSuppressionPolicyDelegate;
}

- (void)set_keyboardSuppressionPolicyDelegate:(id)a3
{
}

- (PKTextInputDebugLogController)_debugLogController
{
  return self->__debugLogController;
}

- (void)set_debugLogController:(id)a3
{
}

- (unint64_t)_debugControllerAnchorCorner
{
  return self->__debugControllerAnchorCorner;
}

- (PKTextInputDebugViewController)_debugViewController
{
  return self->__debugViewController;
}

- (void)set_debugViewController:(id)a3
{
}

- (PKTextInputDebugStateIntrospector)_debugStateIntrospector
{
  return self->__debugStateIntrospector;
}

- (void)set_debugStateIntrospector:(id)a3
{
}

- (PKTextInputCursorController)_cursorController
{
  return self->__cursorController;
}

- (void)set_cursorController:(id)a3
{
}

- (PKTextInputReserveSpaceController)_reserveSpaceController
{
  return self->__reserveSpaceController;
}

- (void)set_reserveSpaceController:(id)a3
{
}

- (CGRect)editingOverlayContainerSceneBounds
{
  double x = self->_editingOverlayContainerSceneBounds.origin.x;
  double y = self->_editingOverlayContainerSceneBounds.origin.y;
  double width = self->_editingOverlayContainerSceneBounds.size.width;
  double height = self->_editingOverlayContainerSceneBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_lastDebugCornerEventTimestamp
{
  return self->__lastDebugCornerEventTimestamp;
}

- (void)set_lastDebugCornerEventTimestamp:(double)a3
{
  self->__lastDebugCornerEventTimestamp = a3;
}

- (PKTextInputElement)_beginGestureElement
{
  return self->__beginGestureElement;
}

- (void)set_beginGestureElement:(id)a3
{
}

- (PKTextInputElementContent)_beginGestureElementContentForLineBreak
{
  return self->__beginGestureElementContentForLineBreak;
}

- (void)set_beginGestureElementContentForLineBreak:(id)a3
{
}

- (PKTextInputHoverController)_hoverController
{
  return self->__hoverController;
}

- (void)set_hoverController:(id)a3
{
}

- (PKPencilObserverInteraction)_pencilObserverInteraction
{
  return self->__pencilObserverInteraction;
}

- (void)set_pencilObserverInteraction:(id)a3
{
}

- (PKPencilSqueezeInteraction)_pencilSqueezeInteraction
{
  return self->__pencilSqueezeInteraction;
}

- (void)set_pencilSqueezeInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__pencilSqueezeInteraction, 0);
  objc_storeStrong((id *)&self->__pencilObserverInteraction, 0);
  objc_storeStrong((id *)&self->__hoverController, 0);
  objc_storeStrong((id *)&self->__beginGestureElementContentForLineBreak, 0);
  objc_storeStrong((id *)&self->__beginGestureElement, 0);
  objc_storeStrong((id *)&self->__reserveSpaceController, 0);
  objc_storeStrong((id *)&self->__cursorController, 0);
  objc_storeStrong((id *)&self->__debugStateIntrospector, 0);
  objc_storeStrong((id *)&self->__debugViewController, 0);
  objc_storeStrong((id *)&self->__debugLogController, 0);
  objc_storeStrong((id *)&self->__keyboardSuppressionPolicyDelegate, 0);
  objc_storeStrong((id *)&self->__drawingGestureElementFinder, 0);
  objc_storeStrong((id *)&self->_drawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__handwritingController, 0);
  objc_storeStrong((id *)&self->__elementsController, 0);
  objc_storeStrong((id *)&self->__touchDetectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__paletteController, 0);
  objc_storeStrong((id *)&self->__feedbackController, 0);
  objc_storeStrong((id *)&self->__canvasController, 0);
  objc_storeStrong((id *)&self->__containerView, 0);

  objc_destroyWeak((id *)&self->_view);
}

- (void)_updateKeyboardSuppressionPolicy
{
  id v2 = [(PKTextInputInteraction *)self _keyboardSuppressionPolicyDelegate];
  [v2 updateKeyboardSuppressionPolicy];
}

- (void)reportDebugStateDescription:(id)a3
{
  id v5 = a3;
  id v6 = [(PKTextInputInteraction *)self view];
  if (v6) {
    id v7 = @"Yes";
  }
  else {
    id v7 = @"No";
  }
  id v9 = (void (*)(id, __CFString *, __CFString *))*((void *)a3 + 2);
  BOOL v8 = (void (**)(id, __CFString *, __CFString *))((char *)a3 + 16);
  v9(v5, @"Installed in view", v7);

  if ([(PKTextInputInteraction *)self _handwritingInteractionEnabled]) {
    id v10 = @"Yes";
  }
  else {
    id v10 = @"No";
  }
  (*v8)(v5, @"Interaction enabled", v10);
  int v11 = [(PKTextInputInteraction *)self _containerView];
  if ([v11 isHidden]) {
    id v12 = @"No";
  }
  else {
    id v12 = @"Yes";
  }
  (*v8)(v5, @"Container view visible", v12);

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v14 = v13;
  [(PKTextInputInteraction *)self _lastHandwritingEventTimestamp];
  objc_msgSend(NSString, "stringWithFormat:", @"%0.1fs ago", v14 - v15);
  double v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  (*v8)(v5, @"Last pencil event", v16);
}

- (void)simulateReserveSpaceForTextInputView:(id)a3 location:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  self->_replayCancelled = 0;
  int v11 = -[PKTextInputElement initWithTextInput:]((id *)[PKTextInputElement alloc], v9);
  objc_initWeak(&location, self);
  id v12 = [(PKTextInputInteraction *)self _reserveSpaceController];
  double v13 = -[PKTextInputElement coordinateSpace]((uint64_t)v11);
  objc_msgSend(v12, "beginIfPossibleWithElement:atLocation:coordinateSpace:", v11, v13, x, y);

  dispatch_time_t v14 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__PKTextInputInteraction_Internal__simulateReserveSpaceForTextInputView_location_completion___block_invoke;
  block[3] = &unk_1E64C6D78;
  objc_copyWeak(&v18, &location);
  id v17 = v10;
  id v15 = v10;
  dispatch_after(v14, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __93__PKTextInputInteraction_Internal__simulateReserveSpaceForTextInputView_location_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained && !WeakRetained[9])
  {
    id v3 = [WeakRetained _reserveSpaceController];
    [v3 reserveSpaceWhenReady];
    uint64_t v4 = 1;
  }
  else
  {
    id v3 = [WeakRetained _reserveSpaceController];
    [v3 cancelReserveSpaceIntro];
    uint64_t v4 = 0;
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v4);
  }
}

- (void)cancelReplay
{
  self->_replayCancelled = 1;
  id v2 = [(PKTextInputInteraction *)self handwritingController];
  [v2 cleanUpFromCancelledReplay];
}

@end