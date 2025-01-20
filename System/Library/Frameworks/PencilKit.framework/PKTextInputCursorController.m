@interface PKTextInputCursorController
- (BOOL)_trackedLastKnownTextInputResponderWindowIsKey;
- (BOOL)canMakeCursorWeakForResponder:(id)a3;
- (BOOL)forceHidden;
- (BOOL)forceStrong;
- (BOOL)forceVisible;
- (BOOL)isCursorTemporarilyStrong;
- (BOOL)isCursorWeak;
- (BOOL)lastKnownTextInputResponderWindowIsKey;
- (BOOL)scribbleEnabled;
- (PKTextInputCursorController)init;
- (PKTextInputCursorController)initWithSettings:(id)a3;
- (PKTextInputCursorControllerDelegate)delegate;
- (PKTextInputSettings)_textInputSettings;
- (UITextCursorAssertionController)implicitAssertionController;
- (UITextInput)_lastKnownTextInputResponder;
- (double)_lastSwitchToIdleWritingStateTime;
- (double)lastElementTapToFocusTimestamp;
- (id)_currentAssertionController;
- (id)_implicitAssertionControllerIfPossible;
- (id)_windowForResponder:(id)a3;
- (int64_t)cursorStyle;
- (int64_t)mode;
- (void)_delayedRevokeTemporaryStrongMode;
- (void)_handleDidPerformReturn:(id)a3;
- (void)_handleUndoRedo:(id)a3;
- (void)_setCursorStyle:(int64_t)a3;
- (void)_setLastKnownTextInputResponder:(id)a3;
- (void)_setMode:(int64_t)a3;
- (void)_setTrackedLastKnownTextInputResponderWindowIsKey:(BOOL)a3;
- (void)_textInputSourceDidChange:(id)a3;
- (void)_updateAssertionsForCurrentState;
- (void)_updateCursorStyle;
- (void)firstResponderDidChange:(id)a3;
- (void)flashCursor;
- (void)invalidateGhostAssertion;
- (void)invalidateNonBlinkingAssertion;
- (void)invalidateNonVisibleAssertion;
- (void)keyWindowDidChange:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)makeCursorStrong;
- (void)makeCursorTemporarilyStrongWhileWriting;
- (void)makeCursorTemporarilyStrongWithTimeout:(double)a3;
- (void)makeCursorWeak;
- (void)removeAllAssertions;
- (void)reportDebugStateDescription:(id)a3;
- (void)resetState;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceHidden:(BOOL)a3;
- (void)setForceStrong:(BOOL)a3;
- (void)setForceVisible:(BOOL)a3;
- (void)setImplicitAssertionController:(id)a3;
- (void)setLastElementTapToFocusTimestamp:(double)a3;
- (void)set_lastSwitchToIdleWritingStateTime:(double)a3;
- (void)set_textInputSettings:(id)a3;
- (void)simulateFirstResponderChangeForTesting:(id)a3;
- (void)simulateResetCursorTimeout;
- (void)textInputSourceDidChange:(id)a3;
- (void)writingStateDidChange;
@end

@implementation PKTextInputCursorController

- (PKTextInputCursorController)init
{
  return [(PKTextInputCursorController *)self initWithSettings:0];
}

- (PKTextInputCursorController)initWithSettings:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKTextInputCursorController;
  v6 = [(PKTextInputCursorController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    v7->_cursorStyle = 0;
    v7->_mode = 0;
    v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v8 timeIntervalSinceReferenceDate];
    v7->__lastSwitchToIdleWritingStateTime = v9;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel_firstResponderDidChange_ name:*MEMORY[0x1E4FB3348] object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel_keyWindowDidChange_ name:*MEMORY[0x1E4FB30E8] object:0];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v7 selector:sel_textInputSourceDidChange_ name:*MEMORY[0x1E4FB3080] object:0];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v7 selector:sel_scrollViewWillBeginDragging_ name:*MEMORY[0x1E4FB32B0] object:0];

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v7 selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v7 selector:sel_keyboardWillChangeFrame_ name:*MEMORY[0x1E4FB2C48] object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel__handleUndoRedo_ name:*MEMORY[0x1E4F28A80] object:0];

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v7 selector:sel__handleUndoRedo_ name:*MEMORY[0x1E4F28A78] object:0];
  }
  return v7;
}

- (PKTextInputSettings)_textInputSettings
{
  settings = self->_settings;
  if (settings)
  {
    v3 = settings;
  }
  else
  {
    v3 = +[PKTextInputSettings sharedSettings];
  }

  return v3;
}

- (void)_setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    [(PKTextInputCursorController *)self _updateCursorStyle];
  }
}

- (BOOL)isCursorWeak
{
  return ![(PKTextInputCursorController *)self forceStrong]
      && [(PKTextInputCursorController *)self mode] == 2;
}

- (BOOL)canMakeCursorWeakForResponder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextInputCursorController *)self _textInputSettings];
  int v6 = [v5 enableWeakCursor];

  if (v6
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v4 _textInputSource] == 3
    && +[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)PKTextInputElementsFinder, v4)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v7 = objc_opt_class();
    v8 = [v4 selectedTextRange];
    double v9 = PKDynamicCast(v7, v8);

    if (v9) {
      char v10 = [v9 isEmpty];
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (void)_setCursorStyle:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_cursorStyle != a3)
  {
    id v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      unint64_t cursorStyle = self->_cursorStyle;
      if (cursorStyle > 3) {
        v12 = 0;
      }
      else {
        v12 = off_1E64C8770[cursorStyle];
      }
      if ((unint64_t)a3 > 3) {
        v13 = 0;
      }
      else {
        v13 = off_1E64C8770[a3];
      }
      unint64_t v14 = [(PKTextInputCursorController *)self mode];
      if (v14 > 2) {
        v15 = 0;
      }
      else {
        v15 = off_1E64C8790[v14];
      }
      *(_DWORD *)buf = 138412802;
      objc_super v19 = v12;
      __int16 v20 = 2112;
      v21 = v13;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "Setting cursor style: %@ -> %@, mode: %@", buf, 0x20u);
    }

    int64_t v6 = self->_cursorStyle;
    self->_unint64_t cursorStyle = a3;
    +[PKTextInputDebugStateIntrospector debugStateDidChange];
    if (v6 == 1 && self->_cursorStyle == 3)
    {
      uint64_t v7 = self->_ghostAssertion;
      ghostAssertion = self->_ghostAssertion;
      self->_ghostAssertion = 0;

      [(PKTextInputCursorController *)self _updateAssertionsForCurrentState];
      if (v7)
      {
        dispatch_time_t v9 = dispatch_time(0, 100000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __47__PKTextInputCursorController__setCursorStyle___block_invoke;
        block[3] = &unk_1E64C61C0;
        v17 = v7;
        char v10 = v7;
        dispatch_after(v9, MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      [(PKTextInputCursorController *)self _updateAssertionsForCurrentState];
    }
  }
}

uint64_t __47__PKTextInputCursorController__setCursorStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_updateAssertionsForCurrentState
{
  [(PKTextInputCursorController *)self removeAllAssertions];
  if (self->_cursorShouldFlash)
  {
    v3 = [(PKTextInputCursorController *)self _currentAssertionController];
    id v4 = @"Non blinking for Scribble flash cursor";
LABEL_3:
    id v10 = v3;
    id v5 = [v3 nonBlinkingAssertionWithReason:v4];
    nonBlinkingAssertion = self->_nonBlinkingAssertion;
    self->_nonBlinkingAssertion = v5;
    goto LABEL_4;
  }
  int64_t cursorStyle = self->_cursorStyle;
  if (cursorStyle == 3)
  {
    id v10 = [(PKTextInputCursorController *)self _currentAssertionController];
    dispatch_time_t v9 = [v10 nonVisibleAssertionWithReason:@"Hidden for Scribble"];
    nonBlinkingAssertion = self->_nonVisibleAssertion;
    self->_nonVisibleAssertion = v9;
    goto LABEL_4;
  }
  if (cursorStyle == 2)
  {
    v3 = [(PKTextInputCursorController *)self _currentAssertionController];
    id v4 = @"Non blinking for Scribble";
    goto LABEL_3;
  }
  if (cursorStyle != 1) {
    return;
  }
  id v10 = [(PKTextInputCursorController *)self _currentAssertionController];
  v8 = [v10 nonBlinkingGhostAssertionWithReason:@"Ghosted for Scribble"];
  nonBlinkingAssertion = self->_ghostAssertion;
  self->_ghostAssertion = v8;
LABEL_4:
}

- (void)_updateCursorStyle
{
  if ([(PKTextInputCursorController *)self scribbleEnabled])
  {
    v3 = [(PKTextInputCursorController *)self delegate];
    if (v3)
    {
      id v4 = [(PKTextInputCursorController *)self delegate];
      uint64_t v5 = [v4 cursorControllerWritingState:self];
    }
    else
    {
      uint64_t v5 = 0;
    }

    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    [(PKTextInputCursorController *)self _lastSwitchToIdleWritingStateTime];
    double v9 = v7 - v8;
    id v10 = [(PKTextInputCursorController *)self _textInputSettings];
    [v10 weakCursorVisibilityTimeout];
    double v12 = v11 - v9;

    v13 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];

    BOOL v14 = [(PKTextInputCursorController *)self lastKnownTextInputResponderWindowIsKey];
    if (v5 == 1)
    {
      BOOL v16 = 0;
      int v15 = 1;
    }
    else
    {
      int v15 = 0;
      if (v5) {
        BOOL v16 = 0;
      }
      else {
        BOOL v16 = v12 > 0.0;
      }
    }
    v17 = [(PKTextInputCursorController *)self delegate];
    int v18 = [v17 cursorControllerCustomHighlightFeedbackIsVisible:self];

    if (v13) {
      int v19 = v14;
    }
    else {
      int v19 = 1;
    }
    int v20 = 1;
    char v21 = 1;
    if (!v18
      && v19
      && ([(PKTextInputCursorController *)self mode] != 2
       || !v13
       || [(PKTextInputCursorController *)self forceStrong]
       || (v15 | [(PKTextInputCursorController *)self forceVisible]) == 1))
    {
      int v20 = 0;
      if (v13) {
        char v21 = (v15 | v16) ^ 1;
      }
      else {
        char v21 = 1;
      }
    }
    if ([(PKTextInputCursorController *)self forceVisible])
    {
      int v22 = 0;
      unsigned __int8 v23 = 0;
      if (!v16) {
        goto LABEL_30;
      }
    }
    else
    {
      BOOL v24 = [(PKTextInputCursorController *)self forceHidden];
      int v22 = v20 | v24;
      unsigned __int8 v23 = v24 | v21;
      if (!v16)
      {
LABEL_30:
        if (v22) {
          uint64_t v25 = 3;
        }
        else {
          uint64_t v25 = 0;
        }
        if (((v22 | v23) & 1) == 0)
        {
          if ([(PKTextInputCursorController *)self mode]) {
            uint64_t v25 = 1;
          }
          else {
            uint64_t v25 = 2;
          }
        }
        [(PKTextInputCursorController *)self _setCursorStyle:v25];
        return;
      }
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__writingStateEvaluationTimerExpired object:0];
    [(PKTextInputCursorController *)self performSelector:sel__writingStateEvaluationTimerExpired withObject:0 afterDelay:v12];
    goto LABEL_30;
  }

  [(PKTextInputCursorController *)self resetState];
}

- (void)makeCursorStrong
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedRevokeTemporaryStrongMode object:0];

  [(PKTextInputCursorController *)self _setMode:0];
}

- (void)flashCursor
{
  if ([(PKTextInputCursorController *)self isCursorWeak])
  {
    id restoreAfterFlashCursorBlock = self->_restoreAfterFlashCursorBlock;
    if (restoreAfterFlashCursorBlock) {
      dispatch_block_cancel(restoreAfterFlashCursorBlock);
    }
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    double v9 = __42__PKTextInputCursorController_flashCursor__block_invoke;
    id v10 = &unk_1E64C5998;
    objc_copyWeak(&v11, &location);
    dispatch_block_t v4 = dispatch_block_create((dispatch_block_flags_t)0, &v7);
    id v5 = self->_restoreAfterFlashCursorBlock;
    self->_id restoreAfterFlashCursorBlock = v4;

    dispatch_time_t v6 = dispatch_time(0, 1000000000);
    dispatch_after(v6, MEMORY[0x1E4F14428], self->_restoreAfterFlashCursorBlock);
    if (!self->_cursorShouldFlash)
    {
      self->_cursorShouldFlash = 1;
      [(PKTextInputCursorController *)self _updateAssertionsForCurrentState];
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __42__PKTextInputCursorController_flashCursor__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;
    v3 = WeakRetained;

    v3[32] = 0;
    [v3 _updateAssertionsForCurrentState];
    WeakRetained = v3;
  }
}

- (void)setForceStrong:(BOOL)a3
{
  if (self->_forceStrong != a3)
  {
    self->_forceStrong = a3;
    [(PKTextInputCursorController *)self _updateCursorStyle];
  }
}

- (void)setForceVisible:(BOOL)a3
{
  if (self->_forceVisible != a3)
  {
    self->_forceVisible = a3;
    if (a3) {
      self->_forceHidden = 0;
    }
    [(PKTextInputCursorController *)self _updateCursorStyle];
  }
}

- (void)setForceHidden:(BOOL)a3
{
  if (self->_forceHidden != a3)
  {
    self->_forceHidden = a3;
    if (a3) {
      self->_forceVisible = 0;
    }
    [(PKTextInputCursorController *)self _updateCursorStyle];
  }
}

- (void)makeCursorWeak
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedRevokeTemporaryStrongMode object:0];

  [(PKTextInputCursorController *)self _setMode:2];
}

- (void)makeCursorTemporarilyStrongWhileWriting
{
  if ([(PKTextInputCursorController *)self mode] == 2)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedRevokeTemporaryStrongMode object:0];
    [(PKTextInputCursorController *)self _setMode:1];
  }
}

- (void)makeCursorTemporarilyStrongWithTimeout:(double)a3
{
  if ([(PKTextInputCursorController *)self mode] == 2)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedRevokeTemporaryStrongMode object:0];
    [(PKTextInputCursorController *)self _setMode:1];
    if (a3 > 0.0)
    {
      [(PKTextInputCursorController *)self performSelector:sel__delayedRevokeTemporaryStrongMode withObject:0 afterDelay:a3];
    }
  }
}

- (void)writingStateDidChange
{
  v3 = [(PKTextInputCursorController *)self delegate];
  uint64_t v4 = [v3 cursorControllerWritingState:self];

  if (!v4)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[PKTextInputCursorController set_lastSwitchToIdleWritingStateTime:](self, "set_lastSwitchToIdleWritingStateTime:");
    if ([(PKTextInputCursorController *)self mode] == 1)
    {
      id v5 = [(PKTextInputCursorController *)self _textInputSettings];
      [v5 weakCursorVisibilityTimeout];
      double v7 = v6;

      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedRevokeTemporaryStrongMode object:0];
      [(PKTextInputCursorController *)self performSelector:sel__delayedRevokeTemporaryStrongMode withObject:0 afterDelay:v7];
    }
  }

  [(PKTextInputCursorController *)self _updateCursorStyle];
}

- (void)_delayedRevokeTemporaryStrongMode
{
  if ([(PKTextInputCursorController *)self mode] == 1)
  {
    [(PKTextInputCursorController *)self makeCursorWeak];
  }
}

- (id)_currentAssertionController
{
  v3 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];
  uint64_t v4 = [v3 _textInteraction];

  if (v4) {
    [v4 _assertionController];
  }
  else {
  id v5 = [(PKTextInputCursorController *)self _implicitAssertionControllerIfPossible];
  }

  return v5;
}

- (id)_implicitAssertionControllerIfPossible
{
  v3 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && [v3 conformsToProtocol:&unk_1F20A7488])
  {
    uint64_t v4 = [(PKTextInputCursorController *)self implicitAssertionController];

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4FB1D58]);
      [(PKTextInputCursorController *)self setImplicitAssertionController:v5];
    }
    double v6 = [(PKTextInputCursorController *)self implicitAssertionController];
    [v6 setSubject:v3];

    double v7 = [(PKTextInputCursorController *)self implicitAssertionController];
  }
  else
  {
    double v7 = 0;
  }

  return v7;
}

- (void)removeAllAssertions
{
  [(PKTextInputCursorController *)self invalidateGhostAssertion];
  [(PKTextInputCursorController *)self invalidateNonVisibleAssertion];

  [(PKTextInputCursorController *)self invalidateNonBlinkingAssertion];
}

- (void)resetState
{
  self->_cursorShouldFlash = 0;
  self->_int64_t cursorStyle = 0;
  self->_mode = 0;
  v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [v3 timeIntervalSinceReferenceDate];
  self->__lastSwitchToIdleWritingStateTime = v4;

  objc_storeWeak((id *)&self->__lastKnownTextInputResponder, 0);

  [(PKTextInputCursorController *)self removeAllAssertions];
}

- (void)invalidateNonBlinkingAssertion
{
  [(UITextCursorAssertion *)self->_nonBlinkingAssertion invalidate];
  nonBlinkingAssertion = self->_nonBlinkingAssertion;
  self->_nonBlinkingAssertion = 0;
}

- (void)invalidateNonVisibleAssertion
{
  [(UITextCursorAssertion *)self->_nonVisibleAssertion invalidate];
  nonVisibleAssertion = self->_nonVisibleAssertion;
  self->_nonVisibleAssertion = 0;
}

- (void)invalidateGhostAssertion
{
  [(UITextCursorAssertion *)self->_ghostAssertion invalidate];
  ghostAssertion = self->_ghostAssertion;
  self->_ghostAssertion = 0;
}

- (BOOL)scribbleEnabled
{
  v2 = [(PKTextInputCursorController *)self _textInputSettings];
  char v3 = [v2 isScribbleActive];

  return v3;
}

- (void)firstResponderDidChange:(id)a3
{
  id v11 = a3;
  if ([(PKTextInputCursorController *)self scribbleEnabled])
  {
    double v4 = [v11 object];
    id v5 = [v4 firstResponder];
    if (+[PKTextInputUtilities isResponderSupportedTextInput:v5])
    {
      id v6 = v5;
    }
    else
    {
      id v6 = 0;
    }
    double v7 = [(PKTextInputCursorController *)self delegate];
    uint64_t v8 = [v7 windowSceneForController:self];

    double v9 = [(PKTextInputCursorController *)self _windowForResponder:v6];
    id v10 = [v9 windowScene];

    if (v8 == v10) {
      [(PKTextInputCursorController *)self _setLastKnownTextInputResponder:v6];
    }
  }
  else
  {
    [(PKTextInputCursorController *)self resetState];
  }
}

- (void)keyWindowDidChange:(id)a3
{
  if ([(PKTextInputCursorController *)self scribbleEnabled])
  {
    double v4 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];

    if (v4) {
      [(PKTextInputCursorController *)self _setTrackedLastKnownTextInputResponderWindowIsKey:[(PKTextInputCursorController *)self lastKnownTextInputResponderWindowIsKey]];
    }
    [(PKTextInputCursorController *)self _updateCursorStyle];
  }
  else
  {
    [(PKTextInputCursorController *)self resetState];
  }
}

- (void)textInputSourceDidChange:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(PKTextInputCursorController *)self _textInputSourceDidChange:v4];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __56__PKTextInputCursorController_textInputSourceDidChange___block_invoke;
    v5[3] = &unk_1E64C5F60;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __56__PKTextInputCursorController_textInputSourceDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _textInputSourceDidChange:*(void *)(a1 + 40)];
}

- (void)_textInputSourceDidChange:(id)a3
{
  if ([(PKTextInputCursorController *)self scribbleEnabled])
  {
    if ([(PKTextInputCursorController *)self mode])
    {
      id v4 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];
      BOOL v5 = [(PKTextInputCursorController *)self canMakeCursorWeakForResponder:v4];

      if (!v5)
      {
        [(PKTextInputCursorController *)self makeCursorStrong];
      }
    }
  }
  else
  {
    [(PKTextInputCursorController *)self resetState];
  }
}

- (void)_setTrackedLastKnownTextInputResponderWindowIsKey:(BOOL)a3
{
  if (self->__trackedLastKnownTextInputResponderWindowIsKey != a3)
  {
    self->__trackedLastKnownTextInputResponderWindowIsKey = a3;
    [(PKTextInputCursorController *)self _updateCursorStyle];
  }
}

- (void)_setLastKnownTextInputResponder:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__lastKnownTextInputResponder);

  if (WeakRetained == v4)
  {
    BOOL v6 = [(PKTextInputCursorController *)self _trackedLastKnownTextInputResponderWindowIsKey];
    if (v6 == [(PKTextInputCursorController *)self lastKnownTextInputResponderWindowIsKey])goto LABEL_13; {
    double v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_INFO, "Last knows text input responder key window tracking out of sync", v13, 2u);
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 removeObserver:self name:@"PKPaletteKeyboardUtilitiesDidPerformReturnNotification" object:0];

  [(PKTextInputCursorController *)self _setCursorStyle:0];
  objc_storeWeak((id *)&self->__lastKnownTextInputResponder, v4);
  self->__trackedLastKnownTextInputResponderWindowIsKey = [(PKTextInputCursorController *)self lastKnownTextInputResponderWindowIsKey];
  if (v4)
  {
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:self selector:sel__handleDidPerformReturn_ name:@"PKPaletteKeyboardUtilitiesDidPerformReturnNotification" object:v4];
  }
  if ([(PKTextInputCursorController *)self canMakeCursorWeakForResponder:v4]
    && ([MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate],
        double v11 = v10,
        [(PKTextInputCursorController *)self lastElementTapToFocusTimestamp],
        v11 - v12 > 0.5))
  {
    [(PKTextInputCursorController *)self makeCursorWeak];
  }
  else
  {
    [(PKTextInputCursorController *)self makeCursorStrong];
  }
  [(PKTextInputCursorController *)self _updateCursorStyle];
LABEL_13:
}

- (BOOL)lastKnownTextInputResponderWindowIsKey
{
  char v3 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];
  id v4 = [(PKTextInputCursorController *)self _windowForResponder:v3];
  char v5 = [v4 isKeyWindow];

  return v5;
}

- (id)_windowForResponder:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 _responderWindow];
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    BOOL v6 = PKDynamicCast(v5, v3);
    id v4 = [v6 window];
  }

  return v4;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  if (![(PKTextInputCursorController *)self scribbleEnabled])
  {
    [(PKTextInputCursorController *)self resetState];
    goto LABEL_13;
  }
  if (![(PKTextInputCursorController *)self mode])
  {
    id v5 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];
    if ([(PKTextInputCursorController *)self canMakeCursorWeakForResponder:v5])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = [v4 object];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v5 = v5;
          uint64_t v8 = [v4 object];
          if ([v5 isDescendantOfView:v8])
          {
            double v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)double v10 = 0;
              _os_log_debug_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEBUG, "Making cursor weak after scrollWillBeginDragging", v10, 2u);
            }

            [(PKTextInputCursorController *)self makeCursorWeak];
            goto LABEL_13;
          }
        }
      }
    }
  }
LABEL_13:
}

- (void)keyboardWillShow:(id)a3
{
  if ([(PKTextInputCursorController *)self scribbleEnabled])
  {
    uint64_t v4 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];
    if (v4)
    {
      id v5 = (void *)v4;
      int64_t v6 = [(PKTextInputCursorController *)self mode];

      if (v6)
      {
        double v7 = [MEMORY[0x1E4FB1900] activeInstance];
        if (([v7 isMinimized] & 1) == 0 && (objc_msgSend(v7, "_suppressSoftwareKeyboard") & 1) == 0)
        {
          uint64_t v8 = os_log_create("com.apple.pencilkit", "PencilTextInput");
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)double v9 = 0;
            _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "Making cursor strong after keyboardWillShow", v9, 2u);
          }

          [(PKTextInputCursorController *)self makeCursorStrong];
        }
      }
    }
  }
  else
  {
    [(PKTextInputCursorController *)self resetState];
  }
}

- (void)reportDebugStateDescription:(id)a3
{
  double v11 = (void (**)(id, __CFString *, __CFString *))a3;
  unint64_t v4 = [(PKTextInputCursorController *)self cursorStyle];
  if (v4 > 3) {
    id v5 = 0;
  }
  else {
    id v5 = off_1E64C8770[v4];
  }
  v11[2](v11, @"Cursor style", v5);
  unint64_t v6 = [(PKTextInputCursorController *)self mode];
  if (v6 > 2) {
    double v7 = 0;
  }
  else {
    double v7 = off_1E64C8790[v6];
  }
  v11[2](v11, @"Cursor mode", v7);
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  double v9 = v8;
  if (self->_nonVisibleAssertion) {
    [v8 addObject:@"hidden"];
  }
  if (self->_nonBlinkingAssertion) {
    [v9 addObject:@"non-blinking"];
  }
  if (self->_ghostAssertion) {
    [v9 addObject:@"ghosted"];
  }
  if ([v9 count])
  {
    double v10 = [v9 componentsJoinedByString:@", "];
  }
  else
  {
    double v10 = @"none";
  }
  v11[2](v11, @"Cursor assertions", v10);
}

- (void)_handleUndoRedo:(id)a3
{
  id v7 = a3;
  if ([(PKTextInputCursorController *)self scribbleEnabled])
  {
    if ([(PKTextInputCursorController *)self isCursorWeak])
    {
      unint64_t v4 = [v7 object];
      id v5 = [(PKTextInputCursorController *)self _lastKnownTextInputResponder];
      unint64_t v6 = [v5 undoManager];

      if (v4 == v6) {
        [(PKTextInputCursorController *)self flashCursor];
      }
    }
  }
  else
  {
    [(PKTextInputCursorController *)self resetState];
  }
}

- (void)_handleDidPerformReturn:(id)a3
{
  if ([(PKTextInputCursorController *)self scribbleEnabled])
  {
    if ([(PKTextInputCursorController *)self isCursorWeak])
    {
      [(PKTextInputCursorController *)self flashCursor];
    }
  }
  else
  {
    [(PKTextInputCursorController *)self resetState];
  }
}

- (void)simulateFirstResponderChangeForTesting:(id)a3
{
  id v4 = a3;
  [(PKTextInputCursorController *)self _setLastKnownTextInputResponder:0];
  [(PKTextInputCursorController *)self _setLastKnownTextInputResponder:v4];
}

- (void)simulateResetCursorTimeout
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__delayedRevokeTemporaryStrongMode object:0];

  [(PKTextInputCursorController *)self _delayedRevokeTemporaryStrongMode];
}

- (PKTextInputCursorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputCursorControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isCursorTemporarilyStrong
{
  return self->_isCursorTemporarilyStrong;
}

- (BOOL)forceStrong
{
  return self->_forceStrong;
}

- (BOOL)forceVisible
{
  return self->_forceVisible;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (double)lastElementTapToFocusTimestamp
{
  return self->_lastElementTapToFocusTimestamp;
}

- (void)setLastElementTapToFocusTimestamp:(double)a3
{
  self->_lastElementTapToFocusTimestamp = a3;
}

- (int64_t)cursorStyle
{
  return self->_cursorStyle;
}

- (int64_t)mode
{
  return self->_mode;
}

- (UITextInput)_lastKnownTextInputResponder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__lastKnownTextInputResponder);

  return (UITextInput *)WeakRetained;
}

- (BOOL)_trackedLastKnownTextInputResponderWindowIsKey
{
  return self->__trackedLastKnownTextInputResponderWindowIsKey;
}

- (UITextCursorAssertionController)implicitAssertionController
{
  return self->_implicitAssertionController;
}

- (void)setImplicitAssertionController:(id)a3
{
}

- (double)_lastSwitchToIdleWritingStateTime
{
  return self->__lastSwitchToIdleWritingStateTime;
}

- (void)set_lastSwitchToIdleWritingStateTime:(double)a3
{
  self->__lastSwitchToIdleWritingStateTime = a3;
}

- (void)set_textInputSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__textInputSettings, 0);
  objc_storeStrong((id *)&self->_implicitAssertionController, 0);
  objc_destroyWeak((id *)&self->__lastKnownTextInputResponder);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong(&self->_restoreAfterFlashCursorBlock, 0);
  objc_storeStrong((id *)&self->_ghostAssertion, 0);
  objc_storeStrong((id *)&self->_nonVisibleAssertion, 0);

  objc_storeStrong((id *)&self->_nonBlinkingAssertion, 0);
}

@end