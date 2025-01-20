@interface PKTextInputHandwritingController
+ (BOOL)_isCorrectionResultGesture:(id)a3;
- (BOOL)_evaluateAndProcessResultCommandsQueueImmediateCommit:(BOOL)a3;
- (BOOL)_wantsFloatingBackground;
- (BOOL)handwritingShot:(id)a3 hasCommittedResultsInSessionToElementRecognitionIdentifier:(id)a4;
- (BOOL)handwritingShot:(id)a3 shouldSuppressGesturesForStrokesBounds:(CGRect)a4 coordinateSpace:(id)a5;
- (BOOL)writingSession:(id)a3 elementHasPendingOperations:(id)a4;
- (NSMutableArray)_resultCommandsQueue;
- (NSUUID)_lastInProgressStrokeUUID;
- (PKDrawing)_lastKnownDrawing;
- (PKTextInputCanvasController)canvasController;
- (PKTextInputCursorController)cursorController;
- (PKTextInputDebugLogController)debugLogController;
- (PKTextInputElementsController)elementsController;
- (PKTextInputFeedbackController)feedbackController;
- (PKTextInputHandwritingController)initWithCanvasController:(id)a3 elementsController:(id)a4 feedbackController:(id)a5 reserveSpaceController:(id)a6 debugLogController:(id)a7 cursorController:(id)a8;
- (PKTextInputHandwritingControllerDelegate)delegate;
- (PKTextInputHandwritingShot)_activeHandwritingShot;
- (PKTextInputHandwritingShot)_possibleHandwritingShot;
- (PKTextInputRecognitionManager)_recognitionManager;
- (PKTextInputReserveSpaceController)reserveSpaceController;
- (PKTextInputResultCommand)_activeResultCommand;
- (PKTextInputTargetState)_activeInputTargetState;
- (PKTextInputWritingSession)_writingSession;
- (_NSRange)handwritingShot:(id)a3 activePreviewRangeForElementRecognitionIdentifier:(id)a4 queryItemStableIdentifier:(id)a5;
- (_NSRange)handwritingShot:(id)a3 inProgressGestureInitialSelectedRangeForElementRecognitionIdentifier:(id)a4;
- (double)_continuousRecognitionInterval;
- (double)_floatingBackgroundLastUpdateTime;
- (double)_lastInProgressStrokeUpdateTime;
- (double)strokeAlphaOverride;
- (id)_pendingResultCommand;
- (id)_resultCommandToProcessQueryItem:(id)a3 handwritingShot:(id)a4;
- (id)handwritingShot:(id)a3 preferredTargetElementForQueryItemStableIdentifier:(id)a4 simultaneousItemStableIdentifiers:(id)a5 proposedTargetElement:(id)a6;
- (id)handwritingShotStrokeIdentifiersToExcludeFromRecognition:(id)a3;
- (id)resultCommandSupportedElementDelegate:(id)a3;
- (int64_t)_immediateCommitTypeForQueryItem:(id)a3 handwritingShot:(id)a4;
- (int64_t)handwritingShot:(id)a3 lastCharacterLevelPositionForElementRecognitionIdentifier:(id)a4;
- (int64_t)writingState;
- (void)_cancelInProgressStrokeFromHandwritingShots;
- (void)_cancelPendingResultCommand;
- (void)_createPossibleHandwritingShotIfNeeded;
- (void)_evaluateAndProcessResultCommandsQueue;
- (void)_handleActiveHandwritingShotRecognitionFinished;
- (void)_handleResultCommandFinished:(id)a3;
- (void)_notifyDelegateOfResultCommandState;
- (void)_processPossibleShotIfReady;
- (void)_scheduleCommitForResultCommandIfNeeded:(id)a3;
- (void)_setActiveHandwritingShot:(id)a3;
- (void)_setActiveInputTargetState:(id)a3;
- (void)_setActiveResultCommand:(id)a3;
- (void)_setLastKnownDrawing:(id)a3;
- (void)_setPossibleHandwritingShot:(id)a3;
- (void)_setWritingSession:(id)a3;
- (void)_updateFloatingBackground;
- (void)_updateRecognitionManager;
- (void)_updateStrokeAlphaOverride;
- (void)_updateWritingSession;
- (void)canvasController:(id)a3 drawingDidChange:(id)a4;
- (void)canvasControllerDidBeginDrawing:(id)a3;
- (void)canvasControllerInProgressStrokeDidChange:(id)a3;
- (void)cleanUpFromCancelledReplay;
- (void)handwritingShot:(id)a3 willFocusAndLoadDataForTargetElement:(id)a4;
- (void)handwritingShotDidChangeState:(id)a3;
- (void)handwritingShotDidOverrideStrongCursor:(id)a3;
- (void)quickCommitIfPossible;
- (void)reportDebugStateDescription:(id)a3;
- (void)reserveSpaceControllerWillFocusElement:(id)a3;
- (void)resultCommandStateDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)set_floatingBackgroundLastUpdateTime:(double)a3;
- (void)set_lastInProgressStrokeUUID:(id)a3;
- (void)set_lastInProgressStrokeUpdateTime:(double)a3;
- (void)set_recognitionManager:(id)a3;
- (void)writingSession:(id)a3 didInsertTextInElement:(id)a4;
@end

@implementation PKTextInputHandwritingController

- (PKTextInputHandwritingController)initWithCanvasController:(id)a3 elementsController:(id)a4 feedbackController:(id)a5 reserveSpaceController:(id)a6 debugLogController:(id)a7 cursorController:(id)a8
{
  id v27 = a3;
  id v26 = a4;
  id v15 = a5;
  id v25 = a6;
  id v16 = a7;
  id v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)PKTextInputHandwritingController;
  v18 = [(PKTextInputHandwritingController *)&v28 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_canvasController, a3);
    objc_storeStrong((id *)&v19->_elementsController, a4);
    objc_storeStrong((id *)&v19->_reserveSpaceController, a6);
    objc_storeStrong((id *)&v19->_debugLogController, a7);
    objc_storeStrong((id *)&v19->_cursorController, a8);
    objc_storeStrong((id *)&v19->_feedbackController, a5);
    objc_msgSend(v15, "setReferenceElementContent:referenceRange:feedbackType:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
    v20 = objc_alloc_init(PKTextInputTargetState);
    activeInputTargetState = v19->__activeInputTargetState;
    v19->__activeInputTargetState = v20;

    v19->_strokeAlphaOverride = 1.0;
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    resultCommandsQueue = v19->__resultCommandsQueue;
    v19->__resultCommandsQueue = (NSMutableArray *)v22;
  }
  return v19;
}

- (void)_setWritingSession:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = (PKTextInputWritingSession *)a3;
  if (self->__writingSession != v5)
  {
    int64_t v6 = [(PKTextInputHandwritingController *)self writingState];
    objc_storeStrong((id *)&self->__writingSession, a3);
    v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 == 1) {
        v8 = @"Active";
      }
      else {
        v8 = 0;
      }
      if (v6) {
        v9 = v8;
      }
      else {
        v9 = @"Idle";
      }
      v10 = v9;
      int64_t v11 = [(PKTextInputHandwritingController *)self writingState];
      if (v11 == 1) {
        v12 = @"Active";
      }
      else {
        v12 = 0;
      }
      if (!v11) {
        v12 = @"Idle";
      }
      int v15 = 138412546;
      id v16 = v9;
      __int16 v17 = 2112;
      v18 = v12;
      v13 = v12;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "HWController writing session state changed %@ -> %@", (uint8_t *)&v15, 0x16u);
    }
    v14 = [(PKTextInputHandwritingController *)self delegate];
    [v14 handwritingControllerWritingStateDidChange:self];

    +[PKTextInputDebugStateIntrospector debugStateDidChange];
  }
}

- (int64_t)writingState
{
  v2 = [(PKTextInputHandwritingController *)self _writingSession];
  int64_t v3 = v2 != 0;

  return v3;
}

- (void)_notifyDelegateOfResultCommandState
{
  if (![(PKTextInputHandwritingController *)self writingState])
  {
    int64_t v3 = [(PKTextInputHandwritingController *)self _activeResultCommand];
    if (!v3)
    {
      v4 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
      uint64_t v5 = [v4 count];

      if (v5) {
        return;
      }
      int64_t v6 = [(PKTextInputHandwritingController *)self delegate];
      [v6 handwritingControllerDidFinishActiveCommands:self];
      int64_t v3 = v6;
    }
  }
}

- (void)_setActiveHandwritingShot:(id)a3
{
  uint64_t v5 = (PKTextInputHandwritingShot *)a3;
  if (self->__activeHandwritingShot != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__activeHandwritingShot, a3);
    int64_t v6 = [(PKTextInputHandwritingController *)self _writingSession];
    v7 = v6;
    if (v6) {
      -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v6);
    }

    [(PKTextInputHandwritingController *)self _updateWritingSession];
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    uint64_t v5 = v8;
  }
}

- (void)_setPossibleHandwritingShot:(id)a3
{
  uint64_t v5 = (PKTextInputHandwritingShot *)a3;
  if (self->__possibleHandwritingShot != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__possibleHandwritingShot, a3);
    int64_t v6 = [(PKTextInputHandwritingController *)self _writingSession];
    v7 = v6;
    if (v6) {
      -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v6);
    }

    [(PKTextInputHandwritingController *)self _updateWritingSession];
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    uint64_t v5 = v8;
  }
}

- (void)_setActiveResultCommand:(id)a3
{
  uint64_t v5 = (PKTextInputResultCommand *)a3;
  if (self->__activeResultCommand != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->__activeResultCommand, a3);
    int64_t v6 = [(PKTextInputHandwritingController *)self _writingSession];
    v7 = v6;
    if (v6) {
      -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v6);
    }

    [(PKTextInputHandwritingController *)self _updateWritingSession];
    [(PKTextInputHandwritingController *)self _notifyDelegateOfResultCommandState];
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    uint64_t v5 = v8;
  }
}

- (void)_setLastKnownDrawing:(id)a3
{
  if (self->__lastKnownDrawing != a3)
  {
    v4 = (PKDrawing *)[a3 copy];
    lastKnownDrawing = self->__lastKnownDrawing;
    self->__lastKnownDrawing = v4;

    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    [(PKTextInputHandwritingController *)self _updateFloatingBackground];
  }
}

- (void)_setActiveInputTargetState:(id)a3
{
  uint64_t v5 = (PKTextInputTargetState *)a3;
  if (self->__activeInputTargetState != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->__activeInputTargetState, a3);
    [(PKTextInputHandwritingController *)self _updateWritingSession];
    [(PKTextInputHandwritingController *)self _updateFloatingBackground];
    [(PKTextInputHandwritingController *)self _updateStrokeAlphaOverride];
    uint64_t v5 = v6;
  }
}

- (void)_updateWritingSession
{
  uint64_t v3 = [(PKTextInputHandwritingController *)self canvasController];
  v4 = (void *)v3;
  if (v3 && ([*(id *)(v3 + 96) isDrawing] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    int64_t v6 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
    if (v6)
    {
      BOOL v5 = 1;
    }
    else
    {
      v7 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
      if (v7)
      {
        BOOL v5 = 1;
      }
      else
      {
        v8 = [(PKTextInputHandwritingController *)self _activeResultCommand];
        if (v8)
        {
          BOOL v5 = 1;
        }
        else
        {
          v9 = [(PKTextInputHandwritingController *)self reserveSpaceController];
          if ([v9 isReserveSpaceActive])
          {
            BOOL v5 = 1;
          }
          else
          {
            uint64_t v10 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
            int64_t v11 = (void *)v10;
            if (v10) {
              v12 = *(void **)(v10 + 48);
            }
            else {
              v12 = 0;
            }
            id v13 = v12;
            BOOL v5 = v13 != 0;
          }
        }
      }
    }
  }
  v14 = [(PKTextInputHandwritingController *)self _writingSession];

  if (!v5 || v14)
  {
    if (v14) {
      char v17 = v5;
    }
    else {
      char v17 = 1;
    }
    if ((v17 & 1) == 0)
    {
      v18 = [(PKTextInputHandwritingController *)self _writingSession];
      -[PKTextInputWritingSession invalidate]((uint64_t)v18);

      uint64_t v19 = [(PKTextInputHandwritingController *)self _writingSession];
      v20 = (void *)v19;
      if (v19) {
        objc_storeWeak((id *)(v19 + 48), 0);
      }

      [(PKTextInputHandwritingController *)self _setWritingSession:0];
    }
  }
  else
  {
    int v15 = objc_alloc_init(PKTextInputWritingSession);
    id v16 = v15;
    v21 = v15;
    if (v15)
    {
      objc_storeWeak((id *)&v15->_delegate, self);
      id v16 = v21;
    }
    [(PKTextInputHandwritingController *)self _setWritingSession:v16];
  }
}

- (void)_updateRecognitionManager
{
  uint64_t v3 = [(PKTextInputHandwritingController *)self _recognitionManager];

  if (!v3)
  {
    v4 = objc_alloc_init(PKTextInputRecognitionManager);
    [(PKTextInputHandwritingController *)self set_recognitionManager:v4];
  }
  BOOL v5 = +[PKTextInputLanguageSelectionController sharedInstance];
  [v5 ensureKeyboardLanguageConsistencyIfNeeded];

  int64_t v6 = +[PKTextInputSettings sharedSettings];
  int v7 = [v6 outOfProcessRecognition];

  id v8 = [(PKTextInputHandwritingController *)self _recognitionManager];
  -[PKTextInputRecognitionManager setPreferOutOfProcessRecognition:]((uint64_t)v8, v7);
}

- (void)reserveSpaceControllerWillFocusElement:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PKTextInputHandwritingController *)self _writingSession];
  -[PKTextInputWritingSession setCurrentTargetElement:](v5, v4);
}

- (void)_evaluateAndProcessResultCommandsQueue
{
}

- (BOOL)_evaluateAndProcessResultCommandsQueueImmediateCommit:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
  int64_t v6 = [v5 firstObject];

  if (!v6)
  {
    uint64_t v10 = 0;
    LOBYTE(v3) = 0;
    goto LABEL_28;
  }
  uint64_t v7 = v6[3];
  if (v7 == 7)
  {
    while (1)
    {
      id v8 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
      [v8 removeObjectAtIndex:0];

      v9 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
      uint64_t v10 = [v9 firstObject];

      if (!v10) {
        break;
      }
      int64_t v6 = v10;
      if (v10[3] != 7) {
        goto LABEL_8;
      }
    }
    LOBYTE(v3) = 0;
    goto LABEL_25;
  }
  uint64_t v10 = v6;
LABEL_8:
  int64_t v11 = [(PKTextInputHandwritingController *)self _activeResultCommand];
  if (v11)
  {

    goto LABEL_20;
  }
  uint64_t v12 = v10[3];
  BOOL v13 = v12 == 1 && v3;
  if (v12 != 2 && !v13)
  {
LABEL_20:
    LOBYTE(v3) = 0;
    if (v7 != 7) {
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  [(PKTextInputHandwritingController *)self _setActiveResultCommand:v10];
  int v15 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
  [v15 removeObjectAtIndex:0];

  if (v3)
  {
    if (v10[3] == 1)
    {
      -[PKTextInputResultCommand _setCommandState:]((uint64_t)v10, 2);
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  id v16 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  -[PKTextInputResultCommand beginApplyingResultCommandWithInputTargetState:]((uint64_t)v10, v16);

LABEL_25:
  char v17 = [(PKTextInputHandwritingController *)self _writingSession];
  v18 = v17;
  if (v17) {
    -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v17);
  }

  +[PKTextInputDebugStateIntrospector debugStateDidChange];
LABEL_28:

  return v3;
}

- (void)_handleResultCommandFinished:(id)a3
{
  id v8 = (id *)a3;
  id v4 = [(PKTextInputHandwritingController *)self _activeResultCommand];

  BOOL v5 = v8;
  if (v8 && (char *)v8[3] - 5 <= (char *)1)
  {
    id v6 = v8[9];
    [(PKTextInputHandwritingController *)self _setActiveInputTargetState:v6];
    if (*((unsigned char *)v8 + 8))
    {
      uint64_t v7 = [(PKTextInputHandwritingController *)self debugLogController];
      -[PKTextInputDebugLogController logEntryForAppliedResult:]((uint64_t)v7, v8);
    }
    [(PKTextInputHandwritingController *)self _scheduleCommitForResultCommandIfNeeded:v8];

    BOOL v5 = v8;
  }
  if (v4 == v5)
  {
    [(PKTextInputHandwritingController *)self _setActiveResultCommand:0];
    BOOL v5 = v8;
  }
  if (v5) {
    objc_storeWeak(v8 + 2, 0);
  }
  [(PKTextInputHandwritingController *)self _evaluateAndProcessResultCommandsQueue];
  [(PKTextInputHandwritingController *)self _processPossibleShotIfReady];
  +[PKTextInputDebugStateIntrospector debugStateDidChange];
}

- (void)_scheduleCommitForResultCommandIfNeeded:(id)a3
{
  id v4 = (id *)a3;
  v36 = v4;
  if (v4) {
    id v5 = v4[5];
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  uint64_t v7 = [v6 inputInProgressStroke];

  uint64_t v8 = [(PKTextInputHandwritingController *)self canvasController];
  v9 = (void *)v8;
  if (v8) {
    char v10 = [*(id *)(v8 + 96) isDrawing];
  }
  else {
    char v10 = 0;
  }

  if (!v36)
  {
    id v14 = 0;
    uint64_t v12 = 0;
    id v15 = 0;
    goto LABEL_33;
  }
  int64_t v11 = v36[9];
  uint64_t v12 = v11;
  if (v11) {
    BOOL v13 = (void *)v11[6];
  }
  else {
    BOOL v13 = 0;
  }
  id v14 = v13;
  id v15 = v36[10];
  if (!*((unsigned char *)v36 + 9)) {
    goto LABEL_33;
  }
  char v16 = [v15 length] ? 1 : v10;
  if (v16) {
    goto LABEL_33;
  }
  if (v7) {
    goto LABEL_33;
  }
  char v17 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];

  if (v17) {
    goto LABEL_33;
  }
  id v18 = v36[4];
  uint64_t v19 = [v18 correctionResult];

  v20 = [v6 languageSpec];
  double v21 = -[PKTextInputLanguageSpec standardCommitDelay]((uint64_t)v20);

  if (![v19 isCharacterLevel])
  {
    uint64_t v22 = [v14 length];
    uint64_t v23 = [v14 length];
    if (v22 == 1)
    {
      uint64_t v24 = [v14 characterAtIndex:v23 - 1];
      id v25 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      LODWORD(v24) = [v25 characterIsMember:v24];

      if (!v24) {
        goto LABEL_23;
      }
    }
    else if (v23 || v36[15] != (id)1)
    {
      [v6 recognitionDuration];
      double v21 = fmax(v21 - v27, 0.0);
      goto LABEL_23;
    }
  }
  id v26 = [v6 languageSpec];
  double v21 = -[PKTextInputLanguageSpec singleCharacterCommitDelay]((uint64_t)v26);

LABEL_23:
  objc_super v28 = [PKTextInputResultCommand alloc];
  id v29 = v36[4];
  uint64_t v30 = -[PKTextInputResultCommand initWithQueryItem:handwritingShot:immediateCommitType:applyAfterDelay:]((uint64_t)v28, v29, v6, 1, v21);

  if (v30) {
    objc_storeWeak((id *)(v30 + 16), self);
  }
  if (v12) {
    v31 = (void *)v12[7];
  }
  else {
    v31 = 0;
  }
  id v32 = v31;

  if (v30 && v32)
  {
    *(void *)(v30 + 112) = v36[14];
    *(void *)(v30 + 120) = 0;
  }
  v33 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
  [v33 addObject:v30];

  v34 = [(PKTextInputHandwritingController *)self _writingSession];
  v35 = v34;
  if (v34) {
    -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v34);
  }

  +[PKTextInputDebugStateIntrospector debugStateDidChange];
LABEL_33:
}

- (id)_pendingResultCommand
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
  BOOL v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (v6 && v6[3] == 1)
        {
          BOOL v3 = v6;
          goto LABEL_12;
        }
      }
      BOOL v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)_cancelPendingResultCommand
{
  v2 = [(PKTextInputHandwritingController *)self _pendingResultCommand];
  if (v2)
  {
    id v3 = v2;
    -[PKTextInputResultCommand cancelDelayedCommand]((uint64_t)v2);
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    v2 = v3;
  }
}

- (void)resultCommandStateDidChange:(id)a3
{
  uint64_t v4 = (id *)a3;
  long long v11 = v4;
  if (v4)
  {
    switch((unint64_t)v4[3])
    {
      case 2uLL:
        [(PKTextInputHandwritingController *)self _evaluateAndProcessResultCommandsQueue];
        uint64_t v4 = v11;
        goto LABEL_6;
      case 3uLL:
      case 4uLL:
LABEL_6:
        char v5 = 0;
        goto LABEL_7;
      case 5uLL:
      case 6uLL:
      case 7uLL:
        [(PKTextInputHandwritingController *)self _handleResultCommandFinished:v4];
        uint64_t v4 = v11;
        goto LABEL_4;
      default:
LABEL_4:
        char v5 = 1;
LABEL_7:
        id v6 = v4[6];
        uint64_t v7 = v6;
        if (v6) {
          long long v8 = (void *)*((void *)v6 + 1);
        }
        else {
          long long v8 = 0;
        }
        break;
    }
  }
  else
  {
    uint64_t v7 = 0;
    long long v8 = 0;
    char v5 = 1;
  }
  id v9 = v8;

  if ((v5 & 1) == 0 && v9)
  {
    long long v10 = [(PKTextInputHandwritingController *)self _writingSession];
    -[PKTextInputWritingSession setCurrentTargetElement:](v10, v9);
  }
}

- (id)resultCommandSupportedElementDelegate:(id)a3
{
  uint64_t v4 = [(PKTextInputHandwritingController *)self delegate];
  char v5 = [v4 supportedElementDelegateForHandwritingController:self];

  return v5;
}

- (void)_createPossibleHandwritingShotIfNeeded
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
  char v5 = +[PKTextInputSettings sharedSettings];
  id v6 = [v5 recognitionLocaleIdentifiers];

  if (!v4)
  {
    if ([v6 count])
    {
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v8 = v6;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v24;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v24 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", *(void *)(*((void *)&v23 + 1) + 8 * v12), (void)v23);
            [v7 addObject:v13];

            ++v12;
          }
          while (v10 != v12);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v33 count:16];
        }
        while (v10);
      }

      id v14 = -[PKTextInputLanguageSpec initWithLocales:]([PKTextInputLanguageSpec alloc], v7);
      id v15 = [PKTextInputHandwritingShot alloc];
      char v16 = [(PKTextInputHandwritingController *)self canvasController];
      char v17 = [(PKTextInputHandwritingController *)self elementsController];
      uint64_t v4 = [(PKTextInputHandwritingShot *)v15 initWithCanvasController:v16 elementsController:v17 languageSpec:v14];

      [(PKTextInputHandwritingShot *)v4 setDelegate:self];
      [(PKTextInputHandwritingShot *)v4 setWritingIsActiveAtStart:[(PKTextInputHandwritingController *)self writingState] == 1];
      id v18 = [(PKTextInputHandwritingController *)self cursorController];
      -[PKTextInputHandwritingShot setCursorIsWeakAtStart:](v4, "setCursorIsWeakAtStart:", [v18 isCursorWeak]);

      uint64_t v19 = [(PKTextInputHandwritingController *)self cursorController];
      -[PKTextInputHandwritingShot setCursorIsForcedStrongAtStart:](v4, "setCursorIsForcedStrongAtStart:", [v19 forceStrong]);

      v20 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        double v21 = NSStringFromSelector(a2);
        uint64_t v22 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
        *(_DWORD *)buf = 138412802;
        objc_super v28 = v21;
        __int16 v29 = 2112;
        uint64_t v30 = v4;
        __int16 v31 = 2112;
        id v32 = v22;
        _os_log_debug_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEBUG, "HWController %@: created possible shot: %@, active shot: %@", buf, 0x20u);
      }
      [(PKTextInputHandwritingController *)self _setPossibleHandwritingShot:v4];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
}

- (void)_processPossibleShotIfReady
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
  char v5 = v4;
  if (v4
    && [v4 shotState] == 2
    && ([(PKTextInputHandwritingController *)self _activeHandwritingShot],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6)
    && ([(PKTextInputHandwritingController *)self _activeResultCommand],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    uint64_t v9 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
    uint64_t v10 = [v9 count];

    id v8 = [(PKTextInputHandwritingController *)self _pendingResultCommand];
    if (v10 == (v8 != 0))
    {
      uint64_t v11 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        char v17 = NSStringFromSelector(a2);
        id v18 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
        int v19 = 138412802;
        v20 = v17;
        __int16 v21 = 2112;
        uint64_t v22 = v5;
        __int16 v23 = 2112;
        long long v24 = v18;
        _os_log_debug_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEBUG, "HWController %@: promoting possibleShot to active: %@, old activeShot: %@", (uint8_t *)&v19, 0x20u);
      }
      [(PKTextInputHandwritingController *)self _setActiveHandwritingShot:v5];
      [(PKTextInputHandwritingController *)self _setPossibleHandwritingShot:0];
      [(PKTextInputHandwritingController *)self _updateRecognitionManager];
      uint64_t v12 = [(PKTextInputHandwritingController *)self _recognitionManager];
      uint64_t v13 = [(PKTextInputHandwritingController *)self _writingSession];
      id v14 = (void *)v13;
      if (v13) {
        id v15 = *(void **)(v13 + 32);
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;
      [v5 setWritingSessionIdentifier:v16];

      [v5 beginRecognitionWithRecognitionManager:v12];
      if (v8) {
        [(PKTextInputHandwritingController *)self _cancelPendingResultCommand];
      }
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)_handleActiveHandwritingShotRecognitionFinished
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    char v17 = NSStringFromSelector(a2);
    id v18 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
    int v19 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
    *(_DWORD *)buf = 138412802;
    long long v26 = v17;
    __int16 v27 = 2112;
    objc_super v28 = v18;
    __int16 v29 = 2112;
    uint64_t v30 = v19;
    _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "HWController %@: will process active shot: %@, possibleShot: %@", buf, 0x20u);
  }
  char v5 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
  id v6 = v5;
  if (v5)
  {
    if ([v5 isCancelled])
    {
      uint64_t v7 = 0;
    }
    else
    {
      uint64_t v7 = [v6 resultQueryItems];
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = -[PKTextInputHandwritingController _resultCommandToProcessQueryItem:handwritingShot:](self, "_resultCommandToProcessQueryItem:handwritingShot:", *(void *)(*((void *)&v20 + 1) + 8 * v12), v6, (void)v20);
          if (v13)
          {
            id v14 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
            [v14 addObject:v13];

            id v15 = [(PKTextInputHandwritingController *)self _writingSession];
            id v16 = v15;
            if (v15) {
              -[PKTextInputWritingSession _evaluatePendingWritingEndedElements](v15);
            }
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }

    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    [(PKTextInputHandwritingController *)self _evaluateAndProcessResultCommandsQueue];
  }
}

- (id)_resultCommandToProcessQueryItem:(id)a3 handwritingShot:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 strokeIdentifiers];
  uint64_t v9 = [v7 strokeProvider];
  uint64_t v10 = [v7 resultQueryItems];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    v35 = self;
    uint64_t v36 = *(void *)v42;
    v33 = v10;
    id v34 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v11);
        }
        uint64_t v46 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        id v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v46, 1, v33, v34);
        id v16 = [v9 strokesForSliceIdentifiers:v15];
        char v17 = [v16 anyObject];

        if (!v17) {
          goto LABEL_24;
        }
        id v18 = [v7 inputInProgressStroke];
        char v19 = [v18 isEqual:v17];

        if ((v19 & 1) == 0)
        {
          id v20 = v7;
          long long v21 = v9;
          id v22 = v11;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v23 = [(PKTextInputHandwritingController *)v35 _lastKnownDrawing];
          long long v24 = [v23 strokes];

          uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v38;
            while (2)
            {
              for (uint64_t j = 0; j != v26; ++j)
              {
                if (*(void *)v38 != v27) {
                  objc_enumerationMutation(v24);
                }
                if ([*(id *)(*((void *)&v37 + 1) + 8 * j) isEqual:v17])
                {

                  id v11 = v22;
                  uint64_t v9 = v21;
                  id v7 = v20;
                  goto LABEL_18;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }

          id v11 = v22;
          uint64_t v9 = v21;
          id v7 = v20;
LABEL_24:

          uint64_t v30 = 0;
          uint64_t v10 = v33;
          id v6 = v34;
          goto LABEL_27;
        }
LABEL_18:
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v41 objects:v47 count:16];
      uint64_t v10 = v33;
      id v6 = v34;
      self = v35;
      if (v13) {
        continue;
      }
      break;
    }
  }

  if ((unint64_t)[v10 count] < 2
    || ([v10 firstObject], id v29 = (id)objc_claimAutoreleasedReturnValue(), v29, v29 == v6))
  {
    uint64_t v31 = -[PKTextInputResultCommand initWithQueryItem:handwritingShot:immediateCommitType:applyAfterDelay:]((uint64_t)[PKTextInputResultCommand alloc], v6, v7, [(PKTextInputHandwritingController *)self _immediateCommitTypeForQueryItem:v6 handwritingShot:v7], 0.0);
    uint64_t v30 = (void *)v31;
    if (v31) {
      objc_storeWeak((id *)(v31 + 16), self);
    }
  }
  else
  {
    uint64_t v30 = 0;
  }
LABEL_27:

  return v30;
}

- (int64_t)_immediateCommitTypeForQueryItem:(id)a3 handwritingShot:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 resultQueryItems];
  id v8 = [v5 correctionResult];
  uint64_t v9 = [v8 inputTarget];
  uint64_t v10 = [v9 inputTargetIdentifier];

  if ((unint64_t)[v7 count] <= 1)
  {
    if (v10)
    {
      uint64_t v12 = [v6 textInputElementForRecognitionIdentifier:v10];
      uint64_t v13 = [v6 inputInProgressStroke];

      int64_t v11 = 0;
      if (v12 && !v13)
      {
        id v14 = objc_opt_class();
        id v15 = [v5 correctionResult];
        LODWORD(v14) = [v14 _isCorrectionResultGesture:v15];

        if (v14 && -[PKTextInputElement shouldPostponeFocusing](v12))
        {
          if (-[PKTextInputElement isFocused]((uint64_t)v12)) {
            int64_t v11 = 0;
          }
          else {
            int64_t v11 = 3;
          }
        }
        else
        {
          int64_t v11 = 0;
        }
      }
    }
    else
    {
      int64_t v11 = 0;
    }
  }
  else
  {
    int64_t v11 = 2;
  }

  return v11;
}

- (double)_continuousRecognitionInterval
{
  uint64_t v3 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = *(void **)(v3 + 24);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = [v6 correctionResult];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v9 = v8;
  uint64_t v10 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  if (v10) {
    double v11 = v10[12];
  }
  else {
    double v11 = 0.0;
  }

  uint64_t v12 = +[PKTextInputSettings sharedSettings];
  [v12 continuousRecognitionWritingInterval];
  double v14 = v13;

  if (v7)
  {
    double v15 = 0.3;
    if (v14 >= 0.3) {
      double v16 = v14;
    }
    else {
      double v16 = 0.3;
    }
    double v17 = v16 + 0.5;
    BOOL v18 = v16 < 0.1;
    double v19 = 0.6;
    if (!v18) {
      double v19 = v17;
    }
    if (v9 - v11 < v19)
    {
      uint64_t v20 = [v7 resultType];
      if ((unint64_t)(v20 - 2) >= 7 && v20)
      {
        if (v20 == 1)
        {
          uint64_t v22 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
          long long v23 = (void *)v22;
          if (v22) {
            long long v24 = *(void **)(v22 + 48);
          }
          else {
            long long v24 = 0;
          }
          id v25 = v24;
          unint64_t v26 = [v25 length];

          if (v26 <= 2) {
            double v15 = 0.3;
          }
          else {
            double v15 = v14;
          }
        }
      }
      else
      {
        double v15 = 0.1;
      }
    }
  }
  else
  {
    double v15 = 0.3;
  }

  return v15;
}

- (void)handwritingShotDidChangeState:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [v7 shotState];
  if (v4 == 4)
  {
    id v6 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];

    if (v6 != v7) {
      goto LABEL_8;
    }
    [(PKTextInputHandwritingController *)self _handleActiveHandwritingShotRecognitionFinished];
    [(PKTextInputHandwritingController *)self _setActiveHandwritingShot:0];
    goto LABEL_7;
  }
  if (v4 == 2)
  {
    id v5 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];

    if (v5 == v7) {
LABEL_7:
    }
      [(PKTextInputHandwritingController *)self _processPossibleShotIfReady];
  }
LABEL_8:
}

- (void)handwritingShotDidOverrideStrongCursor:(id)a3
{
  uint64_t v4 = [(PKTextInputHandwritingController *)self cursorController];
  char v5 = [v4 forceStrong];

  if ((v5 & 1) == 0)
  {
    id v6 = [(PKTextInputHandwritingController *)self cursorController];
    [v6 makeCursorWeak];
  }
}

- (id)handwritingShot:(id)a3 preferredTargetElementForQueryItemStableIdentifier:(id)a4 simultaneousItemStableIdentifiers:(id)a5 proposedTargetElement:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  uint64_t v12 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  uint64_t v13 = v12;
  if (v12) {
    double v14 = *(void **)(v12 + 16);
  }
  else {
    double v14 = 0;
  }
  id v15 = v14;
  double v16 = v15;
  id v17 = v11;
  if (v13)
  {
    id v17 = v11;
    if (v15)
    {
      id v18 = *(id *)(v13 + 24);
      double v19 = [v18 itemStableIdentifier];

      id v17 = v11;
      if (v19)
      {
        id v17 = v11;
        if ([v10 isEqualToNumber:v19])
        {
          id v20 = *(id *)(v13 + 48);
          long long v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          uint64_t v22 = [v20 stringByTrimmingCharactersInSet:v21];
          uint64_t v23 = [v22 length];

          id v17 = v11;
          if (*(void *)(v13 + 64) + v23 >= 2)
          {
            long long v24 = [v9 textInputElementForRecognitionIdentifier:v16];
            id v25 = v24;
            id v17 = v11;
            if (v24)
            {
              id v17 = v24;
            }
          }
        }
      }
    }
  }

  return v17;
}

- (void)handwritingShot:(id)a3 willFocusAndLoadDataForTargetElement:(id)a4
{
  id v10 = (id *)a4;
  char v5 = +[PKEmojiAlternativesGenerator sharedInstance]();
  -[PKEmojiAlternativesGenerator cancelScheduledTasks]((uint64_t)v5);

  id v6 = +[PKEmojiAlternativesGenerator sharedInstance]();
  if (v10)
  {
    id WeakRetained = objc_loadWeakRetained(v10 + 13);
    -[PKEmojiAlternativesGenerator clearExistingAlternativesForTextInput:](v6, (uint64_t)WeakRetained);

    double v8 = [(PKTextInputHandwritingController *)self _writingSession];
    -[PKTextInputWritingSession setCurrentTargetElement:](v8, v10);

    if (-[PKTextInputElement isFocused]((uint64_t)v10)) {
      goto LABEL_5;
    }
    id v9 = [(PKTextInputHandwritingController *)self cursorController];
    [v9 makeCursorWeak];
  }
  else
  {
    -[PKEmojiAlternativesGenerator clearExistingAlternativesForTextInput:](v6, 0);

    id v9 = [(PKTextInputHandwritingController *)self _writingSession];
    -[PKTextInputWritingSession setCurrentTargetElement:]((id *)v9, 0);
  }

LABEL_5:
}

- (_NSRange)handwritingShot:(id)a3 activePreviewRangeForElementRecognitionIdentifier:(id)a4 queryItemStableIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = *(void **)(v11 + 16);
  }
  else {
    uint64_t v13 = 0;
  }
  id v14 = v13;
  int v15 = [v14 isEqualToNumber:v9];

  if (!v15) {
    goto LABEL_13;
  }
  if (!v10) {
    goto LABEL_11;
  }
  double v16 = v12 ? (void *)v12[3] : 0;
  id v17 = v16;
  id v18 = [v17 itemStableIdentifier];

  if (!v18) {
    goto LABEL_11;
  }
  double v19 = v12 ? (void *)v12[3] : 0;
  id v20 = v19;
  long long v21 = [v20 itemStableIdentifier];
  int v22 = [v10 isEqualToNumber:v21];

  if (!v22)
  {
LABEL_13:
    NSUInteger v27 = 0;
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
LABEL_11:
    uint64_t v23 = [v8 textInputElementForRecognitionIdentifier:v9];
    long long v24 = v23;
    if (v23)
    {
      uint64_t v25 = [v23 activePreviewRange];
      NSUInteger v27 = v26;
    }
    else
    {
      NSUInteger v27 = 0;
      uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  NSUInteger v28 = v25;
  NSUInteger v29 = v27;
  result.length = v29;
  result.location = v28;
  return result;
}

- (BOOL)handwritingShot:(id)a3 hasCommittedResultsInSessionToElementRecognitionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = *(void **)(v8 + 16);
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;
  char v12 = [v11 isEqualToNumber:v7];

  if ((v12 & 1) != 0
    && ([v6 writingSessionIdentifier], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v14 = (void *)v13;
    if (v9) {
      int v15 = (void *)v9[5];
    }
    else {
      int v15 = 0;
    }
    id v16 = v15;
    id v17 = [v6 writingSessionIdentifier];
    int v18 = [v16 isEqualToNumber:v17];

    BOOL v19 = 0;
    if (v9 && v18) {
      BOOL v19 = v9[8] > 0;
    }
  }
  else
  {

    BOOL v19 = 0;
  }

  return v19;
}

- (int64_t)handwritingShot:(id)a3 lastCharacterLevelPositionForElementRecognitionIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  id v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = *(void **)(v6 + 16);
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  int v10 = [v9 isEqualToNumber:v5];

  if (v10) {
    int64_t v11 = 0;
  }
  else {
    int64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v7 && v10) {
    int64_t v11 = v7[9];
  }

  return v11;
}

- (_NSRange)handwritingShot:(id)a3 inProgressGestureInitialSelectedRangeForElementRecognitionIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  id v9 = (void *)v8;
  if (v8) {
    int v10 = *(void **)(v8 + 16);
  }
  else {
    int v10 = 0;
  }
  id v11 = v10;
  int v12 = [v11 isEqualToNumber:v7];

  if (v12)
  {
    uint64_t v13 = [v6 strokeProvider];
    if (v9) {
      id v14 = (void *)v9[10];
    }
    else {
      id v14 = 0;
    }
    id v15 = v14;

    if (v15)
    {
      if (v9) {
        id v16 = (void *)v9[10];
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;
      int v18 = [v13 containsStrokeWithUUID:v17];

      id v15 = 0;
      if (v18) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v9 && v18)
      {
        uint64_t v19 = v9[13];
        id v15 = (id)v9[14];
      }
    }
    else
    {
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    id v15 = 0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v20 = v19;
  NSUInteger v21 = (NSUInteger)v15;
  result.length = v21;
  result.location = v20;
  return result;
}

- (id)handwritingShotStrokeIdentifiersToExcludeFromRecognition:(id)a3
{
  uint64_t v3 = [(PKTextInputHandwritingController *)self canvasController];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = (void *)[*(id *)(v3 + 8) copy];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)handwritingShot:(id)a3 shouldSuppressGesturesForStrokesBounds:(CGRect)a4 coordinateSpace:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a5;
  id v11 = [(PKTextInputHandwritingController *)self _writingSession];
  if (!v11 || (int v12 = v11[24], v11, !v12))
  {
    id v14 = [(PKTextInputHandwritingController *)self reserveSpaceController];
    [v14 placeholderFrameInCoordinateSpace:v10];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v25.origin.CGFloat x = v16;
    v25.origin.CGFloat y = v18;
    v25.size.CGFloat width = v20;
    v25.size.CGFloat height = v22;
    if (CGRectIsNull(v25)) {
      goto LABEL_9;
    }
    v26.origin.CGFloat x = v16;
    v26.origin.CGFloat y = v18;
    v26.size.CGFloat width = v20;
    v26.size.CGFloat height = v22;
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    if (!CGRectIntersectsRect(v26, v27))
    {
LABEL_9:
      BOOL v13 = 0;
      goto LABEL_10;
    }
    uint64_t v23 = [(PKTextInputHandwritingController *)self _writingSession];
    if (v23) {
      v23[24] = 1;
    }
  }
  BOOL v13 = 1;
LABEL_10:

  return v13;
}

- (BOOL)writingSession:(id)a3 elementHasPendingOperations:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];

  if (v6) {
    goto LABEL_7;
  }
  id v7 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
  char v8 = [v7 isPotentiallyTargetingElement:v5];

  if (v8) {
    goto LABEL_7;
  }
  uint64_t v9 = [(PKTextInputHandwritingController *)self _activeResultCommand];
  id v10 = (void *)v9;
  if (v9)
  {
    id v11 = *(id *)(v9 + 48);
    int v12 = v11;
    if (v11)
    {
      BOOL v13 = (void *)*((void *)v11 + 1);
      goto LABEL_6;
    }
  }
  else
  {
    int v12 = 0;
  }
  BOOL v13 = 0;
LABEL_6:
  id v14 = v13;
  unsigned __int8 v15 = -[PKTextInputElement isEquivalentToElement:](v14, v5);

  if ((v15 & 1) == 0)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    CGFloat v18 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
    uint64_t v16 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (!v16) {
      goto LABEL_26;
    }
    uint64_t v19 = *(void *)v29;
    while (1)
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v18);
        }
        uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * v20);
        if (v21)
        {
          if (*(void *)(v21 + 24) == 7) {
            goto LABEL_19;
          }
          id v22 = *(id *)(v21 + 48);
          uint64_t v23 = v22;
          if (v22)
          {
            long long v24 = (void *)*((void *)v22 + 1);
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        long long v24 = 0;
LABEL_18:
        CGRect v25 = v24;
        unsigned __int8 v26 = -[PKTextInputElement isEquivalentToElement:](v25, v5);

        if (v26)
        {
          LOBYTE(v16) = 1;
          goto LABEL_26;
        }
LABEL_19:
        ++v20;
      }
      while (v16 != v20);
      uint64_t v27 = [v18 countByEnumeratingWithState:&v28 objects:v32 count:16];
      uint64_t v16 = v27;
      if (!v27)
      {
LABEL_26:

        goto LABEL_8;
      }
    }
  }
LABEL_7:
  LOBYTE(v16) = 1;
LABEL_8:

  return v16;
}

- (void)writingSession:(id)a3 didInsertTextInElement:(id)a4
{
  uint64_t v4 = (id *)a4;
  id v5 = +[PKTextInputLanguageSelectionController sharedInstance];
  id v8 = [v5 currentLanguageIdentifiersForEmojiAlternatives];

  id v6 = +[PKEmojiAlternativesGenerator sharedInstance]();
  if (v4) {
    id WeakRetained = objc_loadWeakRetained(v4 + 13);
  }
  else {
    id WeakRetained = 0;
  }

  -[PKEmojiAlternativesGenerator scheduleGenerateAlternativesForTextInput:localeIdentifiers:]((uint64_t)v6, WeakRetained, v8);
}

- (BOOL)_wantsFloatingBackground
{
  uint64_t v3 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  uint64_t v4 = (void *)v3;
  if (v3) {
    id v5 = *(void **)(v3 + 24);
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  id v7 = [v6 correctionResult];

  if (v4) {
    id v8 = (void *)v4[4];
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [v9 strokeProvider];
  if (v4) {
    id v11 = (void *)v4[3];
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  BOOL v13 = [v7 inputTarget];
  id v14 = [v13 inputTargetIdentifier];

  unsigned __int8 v15 = +[PKTextInputSettings sharedSettings];
  int v16 = [v15 floatingBackgroundEnabled];

  LOBYTE(v17) = 0;
  if (v9 && v16 && v7 && v10 && v12 && v14)
  {
    if ([v7 resultType] == 1)
    {
      CGFloat v18 = [v12 strokeIdentifiers];
      [v10 boundsForSliceIdentifiers:v18];
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      double v24 = v23;
      double v26 = v25;
      uint64_t v27 = [v9 textInputElementForRecognitionIdentifier:v14];
      double v17 = -[PKTextInputElement coordinateSpace]((uint64_t)v27);

      if (v17)
      {
        double v28 = -[PKTextInputElement frame]((uint64_t)v27);
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v17 = -[PKTextInputElement coordinateSpace]((uint64_t)v27);
        v35 = [(PKTextInputHandwritingController *)self canvasController];
        -[PKTextInputCanvasController canvasCoordinateSpace](v35);
        uint64_t v36 = v45 = v18;
        double v37 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v17, v36, v28, v30, v32, v34);
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;

        CGFloat v18 = v45;
        v46.origin.CGFloat x = v37;
        v46.origin.CGFloat y = v39;
        v46.size.CGFloat width = v41;
        v46.size.CGFloat height = v43;
        v48.origin.CGFloat x = v20;
        v48.origin.CGFloat y = v22;
        v48.size.CGFloat width = v24;
        v48.size.CGFloat height = v26;
        CGRect v47 = CGRectIntersection(v46, v48);
        LOBYTE(v17) = v24 * v26 - v47.size.width * v47.size.height >= v24 * v26 * 0.8;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
    }
  }

  return (char)v17;
}

- (void)_updateFloatingBackground
{
  v53 = [(PKTextInputHandwritingController *)self canvasController];
  BOOL v3 = [(PKTextInputHandwritingController *)self _wantsFloatingBackground];
  double x = *MEMORY[0x1E4F1DB20];
  double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if (v3)
  {
    if (v53)
    {
      CGFloat v9 = v53[14];
      CGFloat v8 = v53[15];
      CGFloat v10 = v53[16];
      CGFloat v11 = v53[17];
    }
    else
    {
      CGFloat v8 = 0.0;
      CGFloat v10 = 0.0;
      CGFloat v11 = 0.0;
      CGFloat v9 = 0.0;
    }
    id v12 = -[PKTextInputCanvasController inProgressStroke]((uint64_t)v53);
    BOOL v13 = v12;
    if (v12 && [v12 _pointsCount])
    {
      [v13 _bounds];
      v81.origin.double x = v14;
      v81.origin.double y = v15;
      v81.size.double width = v16;
      v81.size.double height = v17;
      v55.origin.double x = x;
      v55.origin.double y = y;
      v55.size.double width = width;
      v55.size.double height = height;
      CGRect v56 = CGRectUnion(v55, v81);
      double x = v56.origin.x;
      double y = v56.origin.y;
      double width = v56.size.width;
      double height = v56.size.height;
    }
    CGFloat v18 = [(PKTextInputHandwritingController *)self _lastKnownDrawing];

    if (v18)
    {
      double v19 = [(PKTextInputHandwritingController *)self _lastKnownDrawing];
      [v19 bounds];
      v82.origin.double x = v20;
      v82.origin.double y = v21;
      v82.size.double width = v22;
      v82.size.double height = v23;
      v57.origin.double x = x;
      v57.origin.double y = y;
      v57.size.double width = width;
      v57.size.double height = height;
      CGRect v58 = CGRectUnion(v57, v82);
      double x = v58.origin.x;
      double y = v58.origin.y;
      double width = v58.size.width;
      double height = v58.size.height;
    }
    v59.origin.double x = x;
    v59.origin.double y = y;
    v59.size.double width = width;
    v59.size.double height = height;
    if (!CGRectIsNull(v59))
    {
      double y = y + -15.0;
      double x = x + -20.0;
      double height = height + 35.0;
      double width = width + 170.0;
    }
    v60.origin.double x = x;
    v60.origin.double y = y;
    v60.size.double width = width;
    v60.size.double height = height;
    if (!CGRectIsNull(v60))
    {
      v61.origin.double x = v9;
      v61.origin.double y = v8;
      v61.size.double width = v10;
      v61.size.double height = v11;
      if (!CGRectIsNull(v61))
      {
        v62.origin.double x = v9;
        v62.origin.double y = v8;
        v62.size.double width = v10;
        v62.size.double height = v11;
        if (!CGRectIsEmpty(v62))
        {
          v63.origin.double x = v9;
          v63.origin.double y = v8;
          v63.size.double width = v10;
          v63.size.double height = v11;
          double MinY = CGRectGetMinY(v63);
          v64.origin.double x = x;
          v64.origin.double y = y;
          v64.size.double width = width;
          v64.size.double height = height;
          double v51 = MinY - CGRectGetMinY(v64);
          v65.origin.double x = v9;
          v65.origin.double y = v8;
          v65.size.double width = v10;
          v65.size.double height = v11;
          double MinX = CGRectGetMinX(v65);
          v66.origin.double x = x;
          v66.origin.double y = y;
          v66.size.double width = width;
          v66.size.double height = height;
          double v48 = MinX - CGRectGetMinX(v66);
          v67.origin.double x = x;
          v67.origin.double y = y;
          v67.size.double width = width;
          v67.size.double height = height;
          double MaxY = CGRectGetMaxY(v67);
          v68.origin.double x = v9;
          v68.origin.double y = v8;
          v68.size.double width = v10;
          v68.size.double height = v11;
          double v45 = MaxY - CGRectGetMaxY(v68);
          v69.origin.double x = x;
          v69.origin.double y = y;
          v69.size.double width = width;
          v69.size.double height = height;
          double MaxX = CGRectGetMaxX(v69);
          v70.origin.double x = v9;
          v70.origin.double y = v8;
          v70.size.double width = v10;
          v70.size.double height = v11;
          double v24 = MaxX - CGRectGetMaxX(v70);
          double v25 = v51;
          BOOL v26 = v51 < 0.0;
          BOOL v27 = v51 > -40.0;
          double v28 = -0.0;
          if (v26 && v27) {
            double v29 = v51;
          }
          else {
            double v29 = -0.0;
          }
          double y = y + v29;
          if (!v26 || !v27) {
            double v25 = 0.0;
          }
          double v30 = height - v25;
          if (v48 < 0.0) {
            double v28 = v48;
          }
          double x = x + v28;
          double v31 = width - fmin(v48, 0.0);
          if (v45 > -40.0 && v45 < 0.0) {
            double v33 = v45;
          }
          else {
            double v33 = 0.0;
          }
          double height = v30 - v33;
          double width = v31 - fmin(v24, 0.0);
        }
      }
    }
    v71.origin.double x = v9;
    v71.origin.double y = v8;
    v71.size.double width = v10;
    v71.size.double height = v11;
    if (CGRectIsNull(v71)) {
      goto LABEL_42;
    }
    v72.origin.double x = v9;
    v72.origin.double y = v8;
    v72.size.double width = v10;
    v72.size.double height = v11;
    if (CGRectIsEmpty(v72)) {
      goto LABEL_42;
    }
    v73.origin.double x = v9;
    v73.origin.double y = v8;
    v73.size.double width = v10;
    v73.size.double height = v11;
    double v52 = CGRectGetMinY(v73);
    v74.origin.double x = x;
    v74.origin.double y = y;
    v74.size.double width = width;
    v74.size.double height = height;
    double v49 = CGRectGetMinY(v74);
    v75.origin.double x = v9;
    v75.origin.double y = v8;
    v75.size.double width = v10;
    v75.size.double height = v11;
    double v46 = CGRectGetMinX(v75);
    v76.origin.double x = x;
    v76.origin.double y = y;
    v76.size.double width = width;
    v76.size.double height = height;
    double v43 = CGRectGetMinX(v76);
    v77.origin.double x = x;
    v77.origin.double y = y;
    v77.size.double width = width;
    v77.size.double height = height;
    double v41 = CGRectGetMaxY(v77);
    v78.origin.double x = v9;
    v78.origin.double y = v8;
    v78.size.double width = v10;
    v78.size.double height = v11;
    double v40 = CGRectGetMaxY(v78);
    v79.origin.double x = x;
    v79.origin.double y = y;
    v79.size.double width = width;
    v79.size.double height = height;
    double v39 = CGRectGetMaxX(v79);
    v80.origin.double x = v9;
    v80.origin.double y = v8;
    v80.size.double width = v10;
    v80.size.double height = v11;
    double v34 = CGRectGetMaxX(v80);
    double v35 = v52 - v49;
    if (v52 - v49 < 0.0) {
      double v35 = -(v52 - v49);
    }
    if (v35 > 12.0) {
      goto LABEL_42;
    }
    double v36 = -(v46 - v43);
    if (v46 - v43 >= 0.0) {
      double v36 = v46 - v43;
    }
    if (v36 > 16.0) {
      goto LABEL_42;
    }
    double v37 = v41 - v40;
    if (v41 - v40 < 0.0) {
      double v37 = -(v41 - v40);
    }
    if (v37 > 16.0) {
      goto LABEL_42;
    }
    double v38 = v39 - v34;
    if (v38 < 0.0) {
      double v38 = -v38;
    }
    if (v38 > 120.0)
    {
LABEL_42:
      CGFloat v8 = y;
      CGFloat v11 = height;
      CGFloat v10 = width;
      CGFloat v9 = x;
    }

    double height = v11;
    double width = v10;
    double y = v8;
    double x = v9;
  }
  -[PKTextInputCanvasController setFloatingBackgroundRect:]((uint64_t)v53, x, y, width, height);
}

- (void)_updateStrokeAlphaOverride
{
  BOOL v3 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
  if (v3 && (uint64_t v4 = v3[16], v3, v4))
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v6 = v5;
    id v7 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
    if (v7) {
      double v8 = v7[11];
    }
    else {
      double v8 = 0.0;
    }
    double v9 = v6 - v8;

    if (v9 >= 0.5)
    {
      uint64_t v11 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
      id v12 = (void *)v11;
      if (v11) {
        BOOL v13 = *(void **)(v11 + 24);
      }
      else {
        BOOL v13 = 0;
      }
      id v14 = v13;
      CGFloat v15 = [v14 correctionResult];

      if (v15)
      {
        if ([v15 resultType] == 3) {
          double v10 = 0.0;
        }
        else {
          double v10 = 0.65;
        }
      }
      else
      {
        double v10 = 0.65;
      }
    }
    else
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__updateStrokeAlphaOverride object:0];
      [(PKTextInputHandwritingController *)self performSelector:sel__updateStrokeAlphaOverride withObject:0 afterDelay:0.5 - v9];
      double v10 = 0.75;
    }
  }
  else
  {
    CGFloat v16 = [(PKTextInputHandwritingController *)self _activeInputTargetState];
    if (!v16 || (uint64_t v17 = v16[18], v16, v10 = 0.75, !v17)) {
      double v10 = 1.0;
    }
  }
  if (v10 != self->_strokeAlphaOverride)
  {
    self->_strokeAlphaOverride = v10;
    id v18 = [(PKTextInputHandwritingController *)self delegate];
    [v18 handwritingControllerStrokeAlphaOverrideDidChange:self];
  }
}

+ (BOOL)_isCorrectionResultGesture:(id)a3
{
  return (unint64_t)([a3 resultType] - 2) < 7;
}

- (void)_cancelInProgressStrokeFromHandwritingShots
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = NSStringFromSelector(a2);
    double v6 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
    int v16 = 138412546;
    uint64_t v17 = v5;
    __int16 v18 = 2112;
    double v19 = v6;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "HWController %@: in progress stroke cancelled. Removing in progress stroke from possible shot %@", (uint8_t *)&v16, 0x16u);
  }
  id v7 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
  double v8 = [v7 inputDrawing];

  double v9 = [v8 strokes];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    uint64_t v11 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
    [v11 setInputDrawing:v8 inputInProgressStroke:0];
  }
  else
  {
    [(PKTextInputHandwritingController *)self _setPossibleHandwritingShot:0];
    [(PKTextInputHandwritingController *)self _setActiveInputTargetState:0];
    id v12 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
    uint64_t v11 = [v12 inputDrawing];

    BOOL v13 = [v11 strokes];
    uint64_t v14 = [v13 count];

    if (!v14)
    {
      CGFloat v15 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
      [v15 setCancelled:1];
    }
  }
}

- (void)canvasControllerDidBeginDrawing:(id)a3
{
  [(PKTextInputHandwritingController *)self _cancelPendingResultCommand];
  [(PKTextInputHandwritingController *)self _createPossibleHandwritingShotIfNeeded];

  [(PKTextInputHandwritingController *)self _updateWritingSession];
}

- (void)canvasControllerInProgressStrokeDidChange:(id)a3
{
  id v25 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  [(PKTextInputHandwritingController *)self _lastInProgressStrokeUpdateTime];
  double v7 = v5 - v6;
  [(PKTextInputHandwritingController *)self _continuousRecognitionInterval];
  if (v7 >= v8)
  {
    double v9 = +[PKTextInputSettings sharedSettings];
    int v10 = [v9 continuousRecognition];

    if (v10)
    {
      uint64_t v11 = -[PKTextInputCanvasController inProgressStroke]((uint64_t)v25);
      id v12 = [(PKTextInputHandwritingController *)self _lastInProgressStrokeUUID];
      BOOL v13 = [v11 _strokeUUID];
      char v14 = [v12 isEqual:v13];

      if (v14) {
        goto LABEL_6;
      }
      [v11 _bounds];
      CGFloat x = v27.origin.x;
      CGFloat y = v27.origin.y;
      CGFloat width = v27.size.width;
      CGFloat height = v27.size.height;
      if (CGRectGetWidth(v27) >= 10.0
        || (v28.origin.CGFloat x = x,
            v28.origin.CGFloat y = y,
            v28.size.CGFloat width = width,
            v28.size.CGFloat height = height,
            CGRectGetHeight(v28) >= 10.0))
      {
LABEL_6:
        [(PKTextInputHandwritingController *)self _createPossibleHandwritingShotIfNeeded];
        double v19 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
        uint64_t v20 = [(PKTextInputHandwritingController *)self _lastKnownDrawing];
        [v19 setInputDrawing:v20 inputInProgressStroke:v11];

        [(PKTextInputHandwritingController *)self set_lastInProgressStrokeUpdateTime:v5];
        CGFloat v21 = [v11 _strokeUUID];
        [(PKTextInputHandwritingController *)self set_lastInProgressStrokeUUID:v21];
      }
    }
  }
  CGFloat v22 = +[PKTextInputSettings sharedSettings];
  int v23 = [v22 floatingBackgroundEnabled];

  if (v23)
  {
    [(PKTextInputHandwritingController *)self _floatingBackgroundLastUpdateTime];
    if (v5 - v24 >= 0.1) {
      [(PKTextInputHandwritingController *)self _updateFloatingBackground];
    }
  }
}

- (void)canvasController:(id)a3 drawingDidChange:(id)a4
{
  id v8 = a4;
  double v5 = [v8 strokes];
  uint64_t v6 = [v5 count];

  if (v6) {
    [(PKTextInputHandwritingController *)self _createPossibleHandwritingShotIfNeeded];
  }
  [(PKTextInputHandwritingController *)self set_lastInProgressStrokeUUID:0];
  double v7 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
  [v7 setInputDrawing:v8 inputInProgressStroke:0];

  [(PKTextInputHandwritingController *)self _setLastKnownDrawing:v8];
}

- (void)reportDebugStateDescription:(id)a3
{
  double v51 = (void (**)(id, __CFString *, __CFString *))a3;
  int64_t v4 = [(PKTextInputHandwritingController *)self writingState];
  double v5 = @"Active";
  if (v4 != 1) {
    double v5 = 0;
  }
  if (v4) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = @"Idle";
  }
  v51[2](v51, @"Writing state", v6);
  uint64_t v7 = [(PKTextInputHandwritingController *)self _writingSession];
  id v8 = (void *)v7;
  if (v7 && (id v9 = *(id *)(v7 + 32)) != 0)
  {
    int v10 = v9;
    uint64_t v11 = [(PKTextInputHandwritingController *)self _writingSession];
    id v12 = (void *)v11;
    if (v11) {
      BOOL v13 = *(void **)(v11 + 32);
    }
    else {
      BOOL v13 = 0;
    }
    id v14 = v13;
    CGFloat v15 = [v14 description];
    v51[2](v51, @"Writing session ID", v15);
  }
  else
  {
    v51[2](v51, @"Writing session ID", &stru_1F1FB2C00);
    int v10 = 0;
  }

  int v16 = [(PKTextInputHandwritingController *)self _lastKnownDrawing];
  if (v16)
  {
    uint64_t v17 = NSString;
    __int16 v18 = [(PKTextInputHandwritingController *)self _lastKnownDrawing];
    double v19 = [v18 strokes];
    objc_msgSend(v17, "stringWithFormat:", @"%ld visible strokes", objc_msgSend(v19, "count"));
    uint64_t v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, @"Last known drawing", v20);
  }
  else
  {
    v51[2](v51, @"Last known drawing", @"None");
  }

  CGFloat v21 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
  if (v21)
  {
    CGFloat v22 = [(PKTextInputHandwritingController *)self _activeHandwritingShot];
    PKTextInputDescriptionForHandwritingShotState([v22 shotState]);
    int v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, @"Active shot", v23);
  }
  else
  {
    v51[2](v51, @"Active shot", @"None");
  }

  double v24 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
  if (v24)
  {
    id v25 = [(PKTextInputHandwritingController *)self _possibleHandwritingShot];
    PKTextInputDescriptionForHandwritingShotState([v25 shotState]);
    BOOL v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, @"Possible shot", v26);
  }
  else
  {
    v51[2](v51, @"Possible shot", @"None");
  }

  CGRect v27 = [(PKTextInputHandwritingController *)self _activeResultCommand];
  if (v27)
  {
    unint64_t v28 = [(PKTextInputHandwritingController *)self _activeResultCommand];
    double v29 = (void *)v28;
    if (v28) {
      unint64_t v28 = *(void *)(v28 + 24);
    }
    PKTextInputDescriptionForResultCommandState(v28);
    double v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, @"Active result command", v30);
  }
  else
  {
    v51[2](v51, @"Active result command", @"None");
  }

  double v31 = [(PKTextInputHandwritingController *)self _pendingResultCommand];
  if (v31)
  {
    unint64_t v32 = [(PKTextInputHandwritingController *)self _pendingResultCommand];
    double v33 = (void *)v32;
    if (v32) {
      unint64_t v32 = *(void *)(v32 + 24);
    }
    PKTextInputDescriptionForResultCommandState(v32);
    double v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v51[2](v51, @"Pending result command", v34);
  }
  else
  {
    v51[2](v51, @"Pending result command", @"None");
  }

  double v35 = NSNumber;
  double v36 = [(PKTextInputHandwritingController *)self _resultCommandsQueue];
  double v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "count"));
  double v38 = [v37 description];
  v51[2](v51, @"Commands in queue", v38);

  uint64_t v39 = [(PKTextInputHandwritingController *)self _writingSession];
  double v40 = (void *)v39;
  if (v39)
  {
    id v41 = *(id *)(v39 + 40);
    if (v41)
    {
      double v42 = v41;
      double v43 = NSString;
      uint64_t v44 = [(PKTextInputHandwritingController *)self _writingSession];
      double v45 = (void *)v44;
      if (v44)
      {
        id v46 = *(id *)(v44 + 40);
        CGRect v47 = v46;
        if (v46)
        {
          double v48 = (void *)*((void *)v46 + 14);
LABEL_36:
          id v49 = v48;
          v50 = [v43 stringWithFormat:@"%@", v49];
          v51[2](v51, @"Current target element", v50);

          goto LABEL_38;
        }
      }
      else
      {
        CGRect v47 = 0;
      }
      double v48 = 0;
      goto LABEL_36;
    }
  }
  v51[2](v51, @"Current target element", @"None");
  double v42 = 0;
LABEL_38:
}

- (PKTextInputHandwritingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputHandwritingControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKTextInputCanvasController)canvasController
{
  return self->_canvasController;
}

- (PKTextInputElementsController)elementsController
{
  return self->_elementsController;
}

- (PKTextInputFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (PKTextInputReserveSpaceController)reserveSpaceController
{
  return self->_reserveSpaceController;
}

- (PKTextInputDebugLogController)debugLogController
{
  return self->_debugLogController;
}

- (PKTextInputCursorController)cursorController
{
  return self->_cursorController;
}

- (double)strokeAlphaOverride
{
  return self->_strokeAlphaOverride;
}

- (PKTextInputRecognitionManager)_recognitionManager
{
  return self->__recognitionManager;
}

- (void)set_recognitionManager:(id)a3
{
}

- (PKTextInputWritingSession)_writingSession
{
  return self->__writingSession;
}

- (PKTextInputHandwritingShot)_activeHandwritingShot
{
  return self->__activeHandwritingShot;
}

- (PKTextInputHandwritingShot)_possibleHandwritingShot
{
  return self->__possibleHandwritingShot;
}

- (PKTextInputResultCommand)_activeResultCommand
{
  return self->__activeResultCommand;
}

- (NSMutableArray)_resultCommandsQueue
{
  return self->__resultCommandsQueue;
}

- (double)_lastInProgressStrokeUpdateTime
{
  return self->__lastInProgressStrokeUpdateTime;
}

- (void)set_lastInProgressStrokeUpdateTime:(double)a3
{
  self->__lastInProgressStrokeUpdateTime = a3;
}

- (NSUUID)_lastInProgressStrokeUUID
{
  return self->__lastInProgressStrokeUUID;
}

- (void)set_lastInProgressStrokeUUID:(id)a3
{
}

- (PKDrawing)_lastKnownDrawing
{
  return self->__lastKnownDrawing;
}

- (PKTextInputTargetState)_activeInputTargetState
{
  return self->__activeInputTargetState;
}

- (double)_floatingBackgroundLastUpdateTime
{
  return self->__floatingBackgroundLastUpdateTime;
}

- (void)set_floatingBackgroundLastUpdateTime:(double)a3
{
  self->__floatingBackgroundLastUpdateTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__activeInputTargetState, 0);
  objc_storeStrong((id *)&self->__lastKnownDrawing, 0);
  objc_storeStrong((id *)&self->__lastInProgressStrokeUUID, 0);
  objc_storeStrong((id *)&self->__resultCommandsQueue, 0);
  objc_storeStrong((id *)&self->__activeResultCommand, 0);
  objc_storeStrong((id *)&self->__possibleHandwritingShot, 0);
  objc_storeStrong((id *)&self->__activeHandwritingShot, 0);
  objc_storeStrong((id *)&self->__writingSession, 0);
  objc_storeStrong((id *)&self->__recognitionManager, 0);
  objc_storeStrong((id *)&self->_cursorController, 0);
  objc_storeStrong((id *)&self->_debugLogController, 0);
  objc_storeStrong((id *)&self->_reserveSpaceController, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_elementsController, 0);
  objc_storeStrong((id *)&self->_canvasController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)quickCommitIfPossible
{
  BOOL v3 = [(PKTextInputHandwritingController *)self _activeResultCommand];

  if (v3)
  {
    uint64_t v4 = [(PKTextInputHandwritingController *)self _activeResultCommand];
    double v5 = (void *)v4;
    if (v4 && *(void *)(v4 + 24) == 1) {
      -[PKTextInputResultCommand _setCommandState:](v4, 2);
    }
  }

  [(PKTextInputHandwritingController *)self _evaluateAndProcessResultCommandsQueueImmediateCommit:1];
}

- (void)cleanUpFromCancelledReplay
{
  BOOL v3 = [(PKTextInputHandwritingController *)self _writingSession];
  -[PKTextInputWritingSession setCurrentTargetElement:](v3, 0);

  [(PKTextInputHandwritingController *)self _setActiveInputTargetState:0];
}

@end