@interface PKTextInputReserveSpaceController
- (BOOL)_canvasControllerIsDrawing;
- (BOOL)_wasAskedToReserveSpace;
- (BOOL)isReserveSpaceActive;
- (BOOL)isReserveSpacePlaceholderVisible;
- (BOOL)tapPointIsInPlaceholder:(CGPoint)a3;
- (CGPoint)_targetPointInElement;
- (CGRect)placeholderFrameInCoordinateSpace:(id)a3;
- (NSTimer)_dismissTimer;
- (PKTextInputElementContent)_targetElementContent;
- (PKTextInputFeedbackController)feedbackController;
- (PKTextInputReserveSpaceController)initWithFeedbackController:(id)a3;
- (PKTextInputReserveSpaceControllerDelegate)delegate;
- (PKTextInputTextPlaceholder)_textPlaceholder;
- (int64_t)_insertionCharacterLocation;
- (int64_t)_preferredInsertionLocation;
- (int64_t)_reserveSpaceState;
- (void)_finishAndResetStateInsertingWhitespace:(BOOL)a3;
- (void)_handleAutodismissTimer;
- (void)_insertWhitespaceWithElement:(id)a3 atReferencePoint:(CGPoint)a4 completion:(id)a5;
- (void)_moveToContentLoadedIfReady;
- (void)_moveToInsertingPlaceholderIfReady;
- (void)_moveToShowingIntroIfReady;
- (void)_moveToShowingPlaceholderIfReady;
- (void)_setReserveSpaceState:(int64_t)a3;
- (void)_setTargetElementContent:(id)a3;
- (void)_startDismissTimerWithDelay:(double)a3;
- (void)_updateReserveSpaceState;
- (void)beginIfPossibleWithElement:(id)a3 atLocation:(CGPoint)a4 coordinateSpace:(id)a5;
- (void)cancelReserveSpaceIntro;
- (void)finishReserveSpaceAndInsertWhitespace:(BOOL)a3;
- (void)reportDebugStateDescription:(id)a3;
- (void)reserveSpaceWhenReady;
- (void)setCanvasControllerIsDrawing:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)set_canvasControllerIsDrawing:(BOOL)a3;
- (void)set_dismissTimer:(id)a3;
- (void)set_insertionCharacterLocation:(int64_t)a3;
- (void)set_targetPointInElement:(CGPoint)a3;
- (void)set_textPlaceholder:(id)a3;
- (void)set_wasAskedToReserveSpace:(BOOL)a3;
@end

@implementation PKTextInputReserveSpaceController

- (PKTextInputReserveSpaceController)initWithFeedbackController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputReserveSpaceController;
  v6 = [(PKTextInputReserveSpaceController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_feedbackController, a3);
    v7->__wasAskedToReserveSpace = 0;
    v7->__insertionCharacterLocation = 0x7FFFFFFFFFFFFFFFLL;
    v7->__reserveSpaceState = 0;
  }

  return v7;
}

- (void)beginIfPossibleWithElement:(id)a3 atLocation:(CGPoint)a4 coordinateSpace:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v9 = a3;
  id v10 = a5;
  BOOL v11 = [(PKTextInputReserveSpaceController *)self isReserveSpaceActive];
  if (v9)
  {
    if (!v11)
    {
      uint64_t v12 = -[PKTextInputElement coordinateSpace]((uint64_t)v9);
      if (v12)
      {
        v13 = (void *)v12;
        int v14 = -[PKTextInputElement isEditableElement]((uint64_t)v9);

        if (v14)
        {
          if ((-[PKTextInputElement isFocused]((uint64_t)v9) & 1) != 0
            || (-[PKTextInputElement shouldPostponeFocusing](v9) & 1) == 0)
          {
            v15 = os_log_create("com.apple.pencilkit", "PencilTextInput");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v23 = v9;
              _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "ReserveSpace: beginIfPossibleWithElement, element: %@", buf, 0xCu);
            }

            v16 = -[PKTextInputElement coordinateSpace]((uint64_t)v9);
            double v17 = PK_convertRectFromCoordinateSpaceToCoordinateSpace(v10, v16, x, y, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
            double v19 = v18;

            v26.origin.double x = -[PKTextInputElement frame]((uint64_t)v9);
            v25.double x = v17;
            v25.double y = v19;
            if (CGRectContainsPoint(v26, v25))
            {
              [(PKTextInputReserveSpaceController *)self _setReserveSpaceState:1];
              v20 = [(PKTextInputReserveSpaceController *)self delegate];
              [v20 reserveSpaceController:self willFocusElement:v9];

              v21[0] = MEMORY[0x1E4F143A8];
              v21[1] = 3221225472;
              v21[2] = __91__PKTextInputReserveSpaceController_beginIfPossibleWithElement_atLocation_coordinateSpace___block_invoke;
              v21[3] = &unk_1E64CA1E0;
              v21[4] = self;
              *(double *)&v21[5] = v17;
              *(double *)&v21[6] = v19;
              -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:]((uint64_t)v9, 0, v21, v17, v19, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
            }
          }
        }
      }
    }
  }
}

void __91__PKTextInputReserveSpaceController_beginIfPossibleWithElement_atLocation_coordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _reserveSpaceState];
  v4 = v8;
  if (v3 == 1)
  {
    if (v8)
    {
      uint64_t v5 = *((void *)v8 + 3);
      v6 = *(void **)(a1 + 32);
      if (v5) {
        BOOL v7 = v5 == 3;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7)
      {
        [v6 _setTargetElementContent:v8];
        objc_msgSend(*(id *)(a1 + 32), "set_targetPointInElement:", *(double *)(a1 + 40), *(double *)(a1 + 48));
        [*(id *)(a1 + 32) _updateReserveSpaceState];
LABEL_9:
        v4 = v8;
        goto LABEL_10;
      }
    }
    else
    {
      v6 = *(void **)(a1 + 32);
    }
    [v6 _finishAndResetStateInsertingWhitespace:0];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)reserveSpaceWhenReady
{
  uint64_t v3 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "ReserveSpace: reserveSpaceWhenReady", v4, 2u);
  }

  if ([(PKTextInputReserveSpaceController *)self isReserveSpaceActive])
  {
    [(PKTextInputReserveSpaceController *)self set_wasAskedToReserveSpace:1];
    [(PKTextInputReserveSpaceController *)self _updateReserveSpaceState];
  }
}

- (void)cancelReserveSpaceIntro
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PKTextInputReserveSpaceController *)self _reserveSpaceState] - 1;
  v4 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (v3 >= 4) {
      uint64_t v5 = @"N";
    }
    else {
      uint64_t v5 = @"Y";
    }
    uint64_t v6 = [(PKTextInputReserveSpaceController *)self _targetElementContent];
    BOOL v7 = (void *)v6;
    if (v6) {
      id v8 = *(void **)(v6 + 8);
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
    int v10 = 138412546;
    BOOL v11 = v5;
    __int16 v12 = 2048;
    id v13 = v9;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "ReserveSpace: cancelIntro, canCancel: %@, element: %p", (uint8_t *)&v10, 0x16u);
  }
  if (v3 <= 3) {
    [(PKTextInputReserveSpaceController *)self _finishAndResetStateInsertingWhitespace:0];
  }
}

- (void)finishReserveSpaceAndInsertWhitespace:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(PKTextInputReserveSpaceController *)self _reserveSpaceState];
  uint64_t v6 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v5) {
      BOOL v7 = @"Y";
    }
    else {
      BOOL v7 = @"N";
    }
    uint64_t v8 = [(PKTextInputReserveSpaceController *)self _targetElementContent];
    id v9 = (void *)v8;
    if (v8) {
      int v10 = *(void **)(v8 + 8);
    }
    else {
      int v10 = 0;
    }
    id v11 = v10;
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2048;
    id v15 = v11;
    _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "ReserveSpace: finish. Can finish and remove placeholder: %@, element: %p", (uint8_t *)&v12, 0x16u);
  }
  if (v5) {
    [(PKTextInputReserveSpaceController *)self _finishAndResetStateInsertingWhitespace:v3];
  }
}

- (void)_updateReserveSpaceState
{
  switch([(PKTextInputReserveSpaceController *)self _reserveSpaceState])
  {
    case 1:
      [(PKTextInputReserveSpaceController *)self _moveToContentLoadedIfReady];
      break;
    case 2:
      [(PKTextInputReserveSpaceController *)self _moveToShowingIntroIfReady];
      break;
    case 3:
      [(PKTextInputReserveSpaceController *)self _moveToInsertingPlaceholderIfReady];
      break;
    case 4:
      [(PKTextInputReserveSpaceController *)self _moveToShowingPlaceholderIfReady];
      break;
    default:
      return;
  }
}

- (void)_moveToContentLoadedIfReady
{
  BOOL v3 = [(PKTextInputReserveSpaceController *)self _targetElementContent];

  if (v3)
  {
    [(PKTextInputReserveSpaceController *)self _setReserveSpaceState:2];
  }
}

- (void)_moveToShowingIntroIfReady
{
  id v6 = [(PKTextInputReserveSpaceController *)self _targetElementContent];
  int64_t v3 = [(PKTextInputReserveSpaceController *)self _preferredInsertionLocation];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(PKTextInputReserveSpaceController *)self _finishAndResetStateInsertingWhitespace:0];
  }
  else
  {
    int64_t v4 = v3;
    [(PKTextInputReserveSpaceController *)self set_insertionCharacterLocation:v3];
    [(PKTextInputReserveSpaceController *)self _setReserveSpaceState:3];
    int64_t v5 = [(PKTextInputReserveSpaceController *)self feedbackController];
    objc_msgSend(v5, "setReferenceElementContent:referenceRange:feedbackType:", v6, v4, 0, 3);
  }
}

- (void)_moveToInsertingPlaceholderIfReady
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([(PKTextInputReserveSpaceController *)self _wasAskedToReserveSpace]
    && [(PKTextInputReserveSpaceController *)self _reserveSpaceState] == 3)
  {
    int64_t v3 = [(PKTextInputReserveSpaceController *)self _targetElementContent];
    int v4 = -[PKTextInputElementContent isSingleLineDocumentContent]((uint64_t)v3);
    if (v4) {
      double v5 = 100.0;
    }
    else {
      double v5 = 0.0;
    }
    if (v4) {
      double v6 = 0.0;
    }
    else {
      double v6 = 30.0;
    }
    [(PKTextInputReserveSpaceController *)self _setReserveSpaceState:4];
    BOOL v7 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v27.width = v5;
      v27.height = v6;
      uint64_t v8 = NSStringFromCGSize(v27);
      int64_t v9 = [(PKTextInputReserveSpaceController *)self _insertionCharacterLocation];
      uint64_t v10 = [(PKTextInputReserveSpaceController *)self _targetElementContent];
      id v11 = (void *)v10;
      if (v10) {
        int v12 = *(void **)(v10 + 8);
      }
      else {
        int v12 = 0;
      }
      id v13 = v12;
      *(_DWORD *)buf = 138412802;
      v21 = v8;
      __int16 v22 = 2048;
      int64_t v23 = v9;
      __int16 v24 = 2048;
      id v25 = v13;
      _os_log_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEFAULT, "ReserveSpace: ready, insert placeholder of size: %@, location: %ld, element: %p", buf, 0x20u);
    }
    uint64_t v14 = [(PKTextInputReserveSpaceController *)self _insertionCharacterLocation];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__PKTextInputReserveSpaceController__moveToInsertingPlaceholderIfReady__block_invoke;
    v16[3] = &unk_1E64CA230;
    v16[4] = self;
    id v17 = v3;
    double v18 = v5;
    double v19 = v6;
    id v15 = v3;
    [(PKTextInputElementContent *)v15 selectTextInRange:0 completion:v16];
  }
}

void __71__PKTextInputReserveSpaceController__moveToInsertingPlaceholderIfReady__block_invoke(uint64_t a1, int a2)
{
  if ([*(id *)(a1 + 32) _reserveSpaceState] == 4)
  {
    if (a2)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __71__PKTextInputReserveSpaceController__moveToInsertingPlaceholderIfReady__block_invoke_2;
      v6[3] = &unk_1E64CA208;
      int v4 = *(void **)(a1 + 40);
      v6[4] = *(void *)(a1 + 32);
      id v7 = v4;
      [(PKTextInputElementContent *)(uint64_t)v7 _insertTextPlaceholderWithSize:*(double *)(a1 + 48) completionHandler:*(double *)(a1 + 56)];
    }
    else
    {
      double v5 = *(void **)(a1 + 32);
      [v5 _finishAndResetStateInsertingWhitespace:0];
    }
  }
}

void __71__PKTextInputReserveSpaceController__moveToInsertingPlaceholderIfReady__block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(a1 + 32) _reserveSpaceState] == 4)
  {
    int64_t v3 = *(void **)(a1 + 32);
    if (v6)
    {
      objc_msgSend(v3, "set_textPlaceholder:");
      int v4 = [*(id *)(a1 + 32) feedbackController];
      double v5 = [*(id *)(a1 + 32) _textPlaceholder];
      [v4 beginDisplayForReserveSpacePlaceholder:v5];

      [*(id *)(a1 + 32) _updateReserveSpaceState];
    }
    else
    {
      objc_msgSend(v3, "_finishAndResetStateInsertingWhitespace:");
    }
  }
  else
  {
    -[PKTextInputElementContent _removeTextPlaceholder:willInsertText:completionHandler:](*(void *)(a1 + 40), v6, 0, &__block_literal_global_71);
  }
}

- (void)_moveToShowingPlaceholderIfReady
{
  uint64_t v3 = [(PKTextInputReserveSpaceController *)self _textPlaceholder];
  if (v3)
  {
    int v4 = (void *)v3;
    int64_t v5 = [(PKTextInputReserveSpaceController *)self _reserveSpaceState];

    if (v5 == 4)
    {
      [(PKTextInputReserveSpaceController *)self _startDismissTimerWithDelay:5.0];
      [(PKTextInputReserveSpaceController *)self _setReserveSpaceState:5];
    }
  }
}

- (void)_finishAndResetStateInsertingWhitespace:(BOOL)a3
{
  int64_t v5 = [(PKTextInputReserveSpaceController *)self feedbackController];
  [v5 cancelShowingReserveSpaceIntro];

  id v6 = [(PKTextInputReserveSpaceController *)self _targetElementContent];
  id v7 = [(PKTextInputReserveSpaceController *)self _textPlaceholder];

  if (v7 && v6)
  {
    uint64_t v8 = [(PKTextInputReserveSpaceController *)self feedbackController];
    int64_t v9 = [(PKTextInputReserveSpaceController *)self _textPlaceholder];
    [v8 endDisplayForReserveSpacePlaceholder:v9];

    uint64_t v10 = [(PKTextInputReserveSpaceController *)self _textPlaceholder];
    id v11 = [v10 rects];
    int v12 = [v11 firstObject];
    [v12 rect];
    uint64_t v14 = v13;
    uint64_t v16 = v15;

    id v17 = [(PKTextInputReserveSpaceController *)self _textPlaceholder];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __77__PKTextInputReserveSpaceController__finishAndResetStateInsertingWhitespace___block_invoke;
    v19[3] = &unk_1E64CA258;
    BOOL v23 = a3;
    v19[4] = self;
    id v20 = v6;
    uint64_t v21 = v14;
    uint64_t v22 = v16;
    -[PKTextInputElementContent _removeTextPlaceholder:willInsertText:completionHandler:]((uint64_t)v20, v17, 0, v19);
  }
  [(PKTextInputReserveSpaceController *)self _setTargetElementContent:0];
  -[PKTextInputReserveSpaceController set_targetPointInElement:](self, "set_targetPointInElement:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(PKTextInputReserveSpaceController *)self set_textPlaceholder:0];
  [(PKTextInputReserveSpaceController *)self set_insertionCharacterLocation:0x7FFFFFFFFFFFFFFFLL];
  [(PKTextInputReserveSpaceController *)self set_wasAskedToReserveSpace:0];
  double v18 = [(PKTextInputReserveSpaceController *)self _dismissTimer];
  [v18 invalidate];

  [(PKTextInputReserveSpaceController *)self set_dismissTimer:0];
  [(PKTextInputReserveSpaceController *)self _setReserveSpaceState:0];
}

void __77__PKTextInputReserveSpaceController__finishAndResetStateInsertingWhitespace___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v2 = *(void **)(a1 + 40);
    if (v2) {
      v2 = (void *)v2[1];
    }
    int v4 = v2;
    objc_msgSend(v3, "_insertWhitespaceWithElement:atReferencePoint:completion:", v4, &__block_literal_global_32, *(double *)(a1 + 48), *(double *)(a1 + 56));
  }
}

- (void)_setReserveSpaceState:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t reserveSpaceState = self->__reserveSpaceState;
    if (reserveSpaceState > 5) {
      id v7 = &stru_1F1FB2C00;
    }
    else {
      id v7 = off_1E64CA2F0[reserveSpaceState];
    }
    if ((unint64_t)a3 > 5) {
      uint64_t v8 = &stru_1F1FB2C00;
    }
    else {
      uint64_t v8 = off_1E64CA2F0[a3];
    }
    int v13 = 138412546;
    uint64_t v14 = v7;
    __int16 v15 = 2112;
    uint64_t v16 = v8;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "ReserveSpace: state changed %@ -> %@", (uint8_t *)&v13, 0x16u);
  }

  BOOL v9 = [(PKTextInputReserveSpaceController *)self isReserveSpaceActive];
  BOOL v10 = [(PKTextInputReserveSpaceController *)self isReserveSpacePlaceholderVisible];
  self->__unint64_t reserveSpaceState = a3;
  if (v9 != [(PKTextInputReserveSpaceController *)self isReserveSpaceActive])
  {
    id v11 = [(PKTextInputReserveSpaceController *)self delegate];
    [v11 reserveSpaceControllerIsActiveChanged:self];
  }
  if (v10 != [(PKTextInputReserveSpaceController *)self isReserveSpacePlaceholderVisible])
  {
    int v12 = [(PKTextInputReserveSpaceController *)self delegate];
    [v12 reserveSpaceControllerIsPlaceholderVisibleChanged:self];
  }
  +[PKTextInputDebugStateIntrospector debugStateDidChange];
  [(PKTextInputReserveSpaceController *)self _updateReserveSpaceState];
}

- (BOOL)isReserveSpaceActive
{
  return (unint64_t)([(PKTextInputReserveSpaceController *)self _reserveSpaceState] - 1) < 5;
}

- (BOOL)isReserveSpacePlaceholderVisible
{
  return [(PKTextInputReserveSpaceController *)self _reserveSpaceState] == 5;
}

- (void)setCanvasControllerIsDrawing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKTextInputReserveSpaceController *)self _canvasControllerIsDrawing] != a3)
  {
    [(PKTextInputReserveSpaceController *)self set_canvasControllerIsDrawing:v3];
    if (v3)
    {
      int64_t v5 = [(PKTextInputReserveSpaceController *)self _dismissTimer];
      [v5 invalidate];

      [(PKTextInputReserveSpaceController *)self set_dismissTimer:0];
    }
    else if ([(PKTextInputReserveSpaceController *)self isReserveSpaceActive])
    {
      [(PKTextInputReserveSpaceController *)self _startDismissTimerWithDelay:2.0];
    }
  }
}

- (void)_startDismissTimerWithDelay:(double)a3
{
  int64_t v5 = [(PKTextInputReserveSpaceController *)self _dismissTimer];
  [v5 invalidate];

  id v6 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__handleAutodismissTimer selector:0 userInfo:0 repeats:a3];
  [(PKTextInputReserveSpaceController *)self set_dismissTimer:v6];
}

- (void)_handleAutodismissTimer
{
}

- (int64_t)_preferredInsertionLocation
{
  uint64_t v3 = [(PKTextInputReserveSpaceController *)self _targetElementContent];
  uint64_t v4 = v3;
  if (v3) {
    int64_t v5 = *(void **)(v3 + 8);
  }
  else {
    int64_t v5 = 0;
  }
  id v6 = v5;
  id v7 = -[PKTextInputElement coordinateSpace]((uint64_t)v6);

  if (!v7)
  {
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_19;
  }
  uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  [(PKTextInputReserveSpaceController *)self _targetPointInElement];
  if (v4)
  {
    uint64_t v11 = [(PKTextInputElementContent *)(id *)v4 characterIndexClosestToPoint:0 inCoordinateSpace:1 forInsertingText:v9 adjustForLastCharacter:v10];
    int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (v11 < -[PKTextInputElementContent contentLength](v4))
  {
    uint64_t v13 = 15;
    if (v11 > 15) {
      uint64_t v13 = v11;
    }
    int64_t v14 = v13 - 15;
    uint64_t v15 = -[PKTextInputElementContent contentLength](v4);
    uint64_t v16 = v11 + 15 >= v15 ? v15 : v11 + 15;
    [(PKTextInputReserveSpaceController *)self _targetPointInElement];
    if (v14 < v16)
    {
      double v19 = v17;
      CGFloat v20 = v18;
      int v21 = 0;
      uint64_t v22 = v14;
      while (1)
      {
        [(PKTextInputElementContent *)(id *)v4 firstRectForRange:1uLL inCoordinateSpace:v7];
        CGFloat x = v43.origin.x;
        CGFloat y = v43.origin.y;
        double width = v43.size.width;
        CGFloat height = v43.size.height;
        v42.CGFloat x = v19;
        v42.CGFloat y = v20;
        if (CGRectContainsPoint(v43, v42)) {
          break;
        }
        v21 |= width == 0.0;
        if (v16 == ++v22) {
          goto LABEL_16;
        }
      }
      unint64_t v28 = -[PKTextInputElementContent rangeOfCharacterAtIndex:](v4, v22);
      uint64_t v30 = v28 + v29;
      if ((uint64_t)(v28 + v29) >= v16 - 1)
      {
        BOOL v32 = 0;
      }
      else
      {
        v44.origin.CGFloat x = x;
        v44.origin.CGFloat y = y;
        v44.size.double width = width;
        v44.size.CGFloat height = height;
        CGFloat MidX = CGRectGetMidX(v44);
        BOOL v32 = v19 >= MidX;
        if (v19 >= MidX) {
          uint64_t v22 = v30;
        }
      }
      unint64_t v40 = v30;
      int v41 = v32;
      if (v4 && v22 >= 1 && *(void *)(v4 + 64))
      {
        v33 = [(PKTextInputElementContent *)v4 stringInRange:1];
        if ([v33 length] == 1)
        {
          int v34 = objc_msgSend(v8, "characterIsMember:", objc_msgSend(v33, "characterAtIndex:", 0));
          v41 &= v34 ^ 1;
          if (v34) {
            --v22;
          }
        }
      }
      v35 = [(PKTextInputElementContent *)v4 stringInRange:1];
      int32_t IntPropertyValue = u_getIntPropertyValue([v35 characterAtIndex:0], UCHAR_GRAPHEME_CLUSTER_BREAK);

      int v37 = v41;
      if (v41 && IntPropertyValue == 10 && v22 > v14)
      {
        uint64_t v22 = v28;
      }
      else
      {
        if (IntPropertyValue != 10) {
          int v37 = 1;
        }
        if (((v37 ^ 1) & v21) == 1 && v28 > v14)
        {
          unint64_t v28 = -[PKTextInputElementContent rangeOfCharacterAtIndex:](v4, v28 - 1);
          uint64_t v22 = v28;
        }
        else
        {
          if (v22 >= v16) {
            LOBYTE(v37) = 1;
          }
          BOOL v38 = IntPropertyValue == 10;
          if (v37) {
            goto LABEL_46;
          }
          uint64_t v22 = v40;
          unint64_t v28 = v40;
        }
      }
      v39 = [(PKTextInputElementContent *)v4 stringInRange:1];
      BOOL v38 = u_getIntPropertyValue([v39 characterAtIndex:0], UCHAR_GRAPHEME_CLUSTER_BREAK) == 10;

LABEL_46:
      if (v38) {
        int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        int64_t v12 = v22;
      }
      goto LABEL_17;
    }
  }
LABEL_16:
  int64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_17:

LABEL_19:
  return v12;
}

- (void)_insertWhitespaceWithElement:(id)a3 atReferencePoint:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = [(PKTextInputReserveSpaceController *)self delegate];
  [v11 reserveSpaceController:self willFocusElement:v10];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __94__PKTextInputReserveSpaceController__insertWhitespaceWithElement_atReferencePoint_completion___block_invoke;
  v17[3] = &unk_1E64CA2A8;
  id v18 = v9;
  CGFloat v12 = *MEMORY[0x1E4F1DB20];
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v16 = v9;
  -[PKTextInputElement loadContentFocusingIfNeededWithReferencePoint:alwaysSetSelectionFromReferencePoint:rectOfInterest:completion:]((uint64_t)v10, 1, v17, x, y, v12, v13, v14, v15);
}

void __94__PKTextInputReserveSpaceController__insertWhitespaceWithElement_atReferencePoint_completion___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = -[PKTextInputElementContent isSingleLineDocumentContent]((uint64_t)v3);
  int64_t v5 = @"\n\n";
  if (v4) {
    int64_t v5 = @"  ";
  }
  v13[0] = v5;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = v5;
  uint64_t v8 = [v6 arrayWithObjects:v13 count:1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__PKTextInputReserveSpaceController__insertWhitespaceWithElement_atReferencePoint_completion___block_invoke_2;
  v10[3] = &unk_1E64CA280;
  id v11 = v3;
  id v12 = *(id *)(a1 + 32);
  id v9 = (id *)v3;
  [(PKTextInputElementContent *)v9 insertTextsToCommit:&unk_1F200EF70 withAlternatives:0 activePreviewText:0x7FFFFFFFFFFFFFFFLL replacingRange:0 completion:v10];
}

void __94__PKTextInputReserveSpaceController__insertWhitespaceWithElement_atReferencePoint_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = -[PKTextInputElementContent selectedRange](*(void *)(a1 + 32));
    uint64_t v5 = v4;
    if (v3) {
      BOOL v6 = v3 == 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 - 1;
    }
    uint64_t v8 = *(id **)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    [(PKTextInputElementContent *)v8 selectTextInRange:v5 completion:v9];
  }
}

- (CGRect)placeholderFrameInCoordinateSpace:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x1E4F1DB20];
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  if ([(PKTextInputReserveSpaceController *)self isReserveSpacePlaceholderVisible])
  {
    uint64_t v9 = [(PKTextInputReserveSpaceController *)self _textPlaceholder];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [(PKTextInputReserveSpaceController *)self _targetElementContent];

      if (v11)
      {
        id v12 = [(PKTextInputReserveSpaceController *)self _targetElementContent];
        CGFloat v13 = [(PKTextInputReserveSpaceController *)self _textPlaceholder];
        double v5 = -[PKTextInputElementContent frameForTextPlaceholder:inCoordinateSpace:]((uint64_t)v12, v13, v4);
        double v6 = v14;
        double v7 = v15;
        double v8 = v16;
      }
    }
  }

  double v17 = v5;
  double v18 = v6;
  double v19 = v7;
  double v20 = v8;
  result.size.CGFloat height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (BOOL)tapPointIsInPlaceholder:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (![(PKTextInputReserveSpaceController *)self isReserveSpacePlaceholderVisible]) {
    return 0;
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  double v6 = [(PKTextInputReserveSpaceController *)self _textPlaceholder];
  double v7 = [v6 rects];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PKTextInputReserveSpaceController_tapPointIsInPlaceholder___block_invoke;
  v10[3] = &unk_1E64CA2D0;
  void v10[4] = &v11;
  *(CGFloat *)&v10[5] = x;
  *(CGFloat *)&v10[6] = y;
  [v7 enumerateObjectsUsingBlock:v10];

  BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

BOOL __61__PKTextInputReserveSpaceController_tapPointIsInPlaceholder___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    BOOL result = 1;
  }
  else
  {
    [a2 rect];
    BOOL result = CGRectContainsPoint(v8, *(CGPoint *)(a1 + 40));
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  *(unsigned char *)(v6 + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

- (void)reportDebugStateDescription:(id)a3
{
  id v13 = a3;
  BOOL v5 = [(PKTextInputReserveSpaceController *)self isReserveSpaceActive];
  CGRect v8 = (void (*)(id, __CFString *, __CFString *))*((void *)a3 + 2);
  double v7 = (void (**)(id, __CFString *, __CFString *))((char *)a3 + 16);
  uint64_t v6 = v8;
  if (v5) {
    uint64_t v9 = @"Yes";
  }
  else {
    uint64_t v9 = @"No";
  }
  v6(v13, @"Reserve space active", v9);
  if ([(PKTextInputReserveSpaceController *)self isReserveSpacePlaceholderVisible]) {
    id v10 = @"Yes";
  }
  else {
    id v10 = @"No";
  }
  (*v7)(v13, @"Placeholder visible", v10);
  unint64_t v11 = [(PKTextInputReserveSpaceController *)self _reserveSpaceState];
  if (v11 > 5) {
    id v12 = &stru_1F1FB2C00;
  }
  else {
    id v12 = off_1E64CA2F0[v11];
  }
  (*v7)(v13, @"State", v12);
}

- (PKTextInputReserveSpaceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTextInputReserveSpaceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKTextInputFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (int64_t)_reserveSpaceState
{
  return self->__reserveSpaceState;
}

- (PKTextInputElementContent)_targetElementContent
{
  return self->__targetElementContent;
}

- (void)_setTargetElementContent:(id)a3
{
}

- (CGPoint)_targetPointInElement
{
  double x = self->__targetPointInElement.x;
  double y = self->__targetPointInElement.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_targetPointInElement:(CGPoint)a3
{
  self->__targetPointInElement = a3;
}

- (int64_t)_insertionCharacterLocation
{
  return self->__insertionCharacterLocation;
}

- (void)set_insertionCharacterLocation:(int64_t)a3
{
  self->__insertionCharacterLocation = a3;
}

- (BOOL)_wasAskedToReserveSpace
{
  return self->__wasAskedToReserveSpace;
}

- (void)set_wasAskedToReserveSpace:(BOOL)a3
{
  self->__wasAskedToReserveSpace = a3;
}

- (BOOL)_canvasControllerIsDrawing
{
  return self->__canvasControllerIsDrawing;
}

- (void)set_canvasControllerIsDrawing:(BOOL)a3
{
  self->__canvasControllerIsDrawing = a3;
}

- (PKTextInputTextPlaceholder)_textPlaceholder
{
  return self->__textPlaceholder;
}

- (void)set_textPlaceholder:(id)a3
{
}

- (NSTimer)_dismissTimer
{
  return self->__dismissTimer;
}

- (void)set_dismissTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dismissTimer, 0);
  objc_storeStrong((id *)&self->__textPlaceholder, 0);
  objc_storeStrong((id *)&self->__targetElementContent, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end