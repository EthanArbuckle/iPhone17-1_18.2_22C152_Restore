@interface PKDrawingReplayController
+ (BOOL)isDrawingInProgressForWindow:(id)a3;
- (BOOL)cancelled;
- (BOOL)disablePencilInput;
- (BOOL)isAnimating;
- (BOOL)setupComplete;
- (BOOL)shouldEndDrawing;
- (CGAffineTransform)transform;
- (CGPoint)currentOffset;
- (CGPoint)originOffset;
- (CGPoint)startingTextFieldOrigin;
- (NSMutableArray)pointArray;
- (PKDrawing)drawing;
- (PKDrawingReplayController)initWithDrawing:(id)a3 transform:(CGAffineTransform *)a4 sourceTextField:(id)a5;
- (PKDrawingReplayController)initWithSourceTextField:(id)a3;
- (PKTextInputDrawingGestureRecognizer)drawingGestureRecognizer;
- (PKTextInputInteraction)textInputInteraction;
- (PKTiledCanvasView)canvasView;
- (UITextField)textField;
- (double)speedRatio;
- (id)completionHandler;
- (id)pencilTextInputInteractionFromWindowScene:(id)a3;
- (unint64_t)currentPointIndex;
- (void)_beginDrawing;
- (void)_beginStrokeWithPoint:(id)a3;
- (void)_endDrawing;
- (void)_loadPointArray;
- (void)_processNextPoint;
- (void)_setUpIfNecessary;
- (void)_strokeEndedWithReplayPoint:(id)a3;
- (void)_strokeMovedWithReplayPoint:(id)a3;
- (void)beginDrawingAnimationAtPoint:(CGPoint)a3 completion:(id)a4;
- (void)beginDrawingAnimationAtRange:(_NSRange)a3 offset:(CGPoint)a4 completion:(id)a5;
- (void)beginInsertTextAnimationAtIndex:(unint64_t)a3 offset:(CGPoint)a4 completion:(id)a5;
- (void)cancel;
- (void)dealloc;
- (void)setCancelled:(BOOL)a3;
- (void)setCanvasView:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentOffset:(CGPoint)a3;
- (void)setCurrentPointIndex:(unint64_t)a3;
- (void)setDisablePencilInput:(BOOL)a3;
- (void)setDrawing:(id)a3;
- (void)setDrawingGestureRecognizer:(id)a3;
- (void)setIsAnimating:(BOOL)a3;
- (void)setOriginOffset:(CGPoint)a3;
- (void)setPointArray:(id)a3;
- (void)setSetupComplete:(BOOL)a3;
- (void)setSpeedRatio:(double)a3;
- (void)setStartingTextFieldOrigin:(CGPoint)a3;
- (void)setTextField:(id)a3;
- (void)setTextInputInteraction:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation PKDrawingReplayController

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingGestureRecognizer);
  [WeakRetained setIsReplaying:0];

  v4.receiver = self;
  v4.super_class = (Class)PKDrawingReplayController;
  [(PKDrawingReplayController *)&v4 dealloc];
}

+ (BOOL)isDrawingInProgressForWindow:(id)a3
{
  v3 = [a3 windowScene];
  objc_super v4 = +[PKTextInputInteraction interactionForScene:v3];

  v5 = [v4 canvasController];
  char HasVisible = -[PKTextInputCanvasController canvasHasVisibleStrokes]((uint64_t)v5);

  v7 = [v4 drawingGestureRecognizer];
  char v8 = [v7 drawingTargetIsDrawing];

  v9 = [v4 drawingGestureRecognizer];
  char v10 = [v9 isReplaying];

  return v8 | HasVisible | v10;
}

- (PKDrawingReplayController)initWithSourceTextField:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKDrawingReplayController;
  v5 = [(PKDrawingReplayController *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_textField, v4);
    [(PKDrawingReplayController *)v6 _setUpIfNecessary];
  }

  return v6;
}

- (PKDrawingReplayController)initWithDrawing:(id)a3 transform:(CGAffineTransform *)a4 sourceTextField:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKDrawingReplayController;
  v11 = [(PKDrawingReplayController *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_textField, v10);
    objc_storeStrong((id *)&v12->_drawing, a3);
    v12->_originOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
    long long v13 = *(_OWORD *)&a4->a;
    long long v14 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v12->_transform.tx = *(_OWORD *)&a4->tx;
    *(_OWORD *)&v12->_transform.c = v14;
    *(_OWORD *)&v12->_transform.a = v13;
    v12->_speedRatio = 1.0;
    [(PKDrawingReplayController *)v12 _setUpIfNecessary];
  }

  return v12;
}

- (id)pencilTextInputInteractionFromWindowScene:(id)a3
{
  v3 = [MEMORY[0x1E4FB1D68] activeTextEffectsWindowForWindowScene:a3];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 editingOverlayViewController];
  }
  else
  {
    id v4 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 pencilTextInputInteraction];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setDisablePencilInput:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(PKDrawingReplayController *)self drawingGestureRecognizer];
  [v4 setEnabled:v3];
}

- (BOOL)disablePencilInput
{
  v2 = [(PKDrawingReplayController *)self drawingGestureRecognizer];
  char v3 = [v2 isEnabled] ^ 1;

  return v3;
}

- (void)_setUpIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (![(PKDrawingReplayController *)self setupComplete])
  {
    char v3 = [(PKDrawingReplayController *)self textField];
    id v4 = [v3 window];
    v5 = [v4 windowScene];
    v6 = [(PKDrawingReplayController *)self pencilTextInputInteractionFromWindowScene:v5];

    if (v6)
    {
      [(PKDrawingReplayController *)self setTextInputInteraction:v6];
      v7 = [v6 drawingGestureRecognizer];
      [(PKDrawingReplayController *)self setDrawingGestureRecognizer:v7];

      [(PKDrawingReplayController *)self setSetupComplete:1];
      [(PKDrawingReplayController *)self _loadPointArray];
    }
    else
    {
      objc_super v8 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315138;
        id v10 = "textInputInteraction";
        _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "invalid nil value for '%s'", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)beginInsertTextAnimationAtIndex:(unint64_t)a3 offset:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  if ([(PKDrawingReplayController *)self isAnimating])
  {
    id v10 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_ERROR, "Trying to begin replay animation, but an animation is currently running, skipping.", buf, 2u);
    }
  }
  else
  {
    id v10 = [(PKDrawingReplayController *)self textField];
    uint64_t v11 = [v10 beginningOfDocument];
    v12 = [v10 positionFromPosition:v11 offset:a3];

    if (v12)
    {
      [v10 caretRectForPosition:v12];
      double v14 = x + v13;
      [v10 bounds];
      -[NSObject textRectForBounds:](v10, "textRectForBounds:");
      double v15 = v14 + v32.origin.x;
      double v16 = y + CGRectGetMidY(v32);
      long long v28 = unk_1C482BFC8;
      long long v29 = unk_1C482BFD8;
      long long v30 = unk_1C482BFE8;
      uint64_t v31 = 0;
      long long v25 = unk_1C482BF98;
      long long v26 = unk_1C482BFA8;
      long long v27 = unk_1C482BFB8;
      [(PKDrawingReplayController *)self _beginDrawing];
      v17 = [(PKDrawingReplayController *)self drawingGestureRecognizer];
      *(double *)buf = v15;
      double v23 = v16;
      uint64_t v24 = 0x3FE0000000000000;
      [v17 _replayDrawingBegan:buf coordinateSpace:v10 activeInputProperties:23 inputType:1];

      v18 = [(PKDrawingReplayController *)self textInputInteraction];
      v19 = [(PKDrawingReplayController *)self textField];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __79__PKDrawingReplayController_beginInsertTextAnimationAtIndex_offset_completion___block_invoke;
      v20[3] = &unk_1E64C6848;
      v20[4] = self;
      id v21 = v9;
      objc_msgSend(v18, "simulateReserveSpaceForTextInputView:location:completion:", v19, v20, v15, v16);
    }
  }
}

uint64_t __79__PKDrawingReplayController_beginInsertTextAnimationAtIndex_offset_completion___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) cancelled] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 32) drawingGestureRecognizer];
    [v2 _replayDrawingEnded];
  }
  [*(id *)(a1 + 32) _endDrawing];
  char v3 = [*(id *)(a1 + 32) drawingGestureRecognizer];
  [v3 reset];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)beginDrawingAnimationAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[PKDrawingReplayController setOriginOffset:](self, "setOriginOffset:", x, y);
  if ([(PKDrawingReplayController *)self isAnimating])
  {
    objc_super v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v18 = 0;
      id v9 = "Trying to begin replay drawing, but isAnimating is already YES.";
      id v10 = (uint8_t *)&v18;
LABEL_10:
      _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    }
  }
  else
  {
    uint64_t v11 = [(PKDrawingReplayController *)self textInputInteraction];
    v12 = [v11 drawingGestureRecognizer];
    int v13 = [v12 isReplaying];

    if (!v13)
    {
      [(PKDrawingReplayController *)self setCompletionHandler:v7];
      double v14 = [(PKDrawingReplayController *)self textField];
      double v15 = [(PKDrawingReplayController *)self textField];
      double v16 = [v15 window];
      objc_msgSend(v14, "PK_convertPoint:toView:", v16, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
      -[PKDrawingReplayController setStartingTextFieldOrigin:](self, "setStartingTextFieldOrigin:");

      [(PKDrawingReplayController *)self setCurrentPointIndex:0];
      [(PKDrawingReplayController *)self _processNextPoint];
      goto LABEL_8;
    }
    objc_super v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = 0;
      id v9 = "Trying to begin replay drawing, but the gesture recognizer is already replaying";
      id v10 = (uint8_t *)&v17;
      goto LABEL_10;
    }
  }

LABEL_8:
}

- (void)beginDrawingAnimationAtRange:(_NSRange)a3 offset:(CGPoint)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  NSUInteger location = a3.location;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v9)
    {
      uint64_t v11 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v21 = 0;
        _os_log_error_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_ERROR, "NSNotFound is not valid range for replay", v21, 2u);
      }

      v10[2](v10, 0);
    }
  }
  else
  {
    [(PKDrawingReplayController *)self setCompletionHandler:v9];
    v12 = [(PKDrawingReplayController *)self textField];
    int v13 = [v12 beginningOfDocument];
    double v14 = [v12 positionFromPosition:v13 offset:location];

    if (v14)
    {
      [v12 caretRectForPosition:v14];
      double v16 = x + v15;
      double v18 = y + v17;
      [v12 bounds];
      objc_msgSend(v12, "textRectForBounds:");
      -[PKDrawingReplayController beginDrawingAnimationAtPoint:completion:](self, "beginDrawingAnimationAtPoint:completion:", v10, v16 + v19, v18 + v20);
    }
  }
}

- (void)_processNextPoint
{
  char v3 = [(PKDrawingReplayController *)self textField];
  id v4 = [(PKDrawingReplayController *)self textField];
  v5 = [v4 window];
  objc_msgSend(v3, "PK_convertPoint:toView:", v5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v7 = v6;
  double v9 = v8;

  [(PKDrawingReplayController *)self startingTextFieldOrigin];
  if (vabdd_f64(v7, v11) >= 0.01 || vabdd_f64(v9, v10) >= 0.01) {
    [(PKDrawingReplayController *)self cancel];
  }
  v12 = [(PKDrawingReplayController *)self drawingGestureRecognizer];
  int v13 = [v12 drawingTouch];

  if (!v13 && ![(PKDrawingReplayController *)self cancelled])
  {
    double v14 = [(PKDrawingReplayController *)self pointArray];
    unint64_t v15 = [(PKDrawingReplayController *)self currentPointIndex];
    [(PKDrawingReplayController *)self setCurrentPointIndex:v15 + 1];
    if (v15 >= [v14 count])
    {
      double v18 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v19 = 0;
        _os_log_error_impl(&dword_1C44F8000, v18, OS_LOG_TYPE_ERROR, "End Drawing is being called from _processNextPoint, but should have been called _endDrawing instead of calling this method.  Ending drawing.", v19, 2u);
      }

      [(PKDrawingReplayController *)self _endDrawing];
    }
    else
    {
      double v16 = [v14 objectAtIndexedSubscript:v15];
      if (!v15) {
        [(PKDrawingReplayController *)self _beginDrawing];
      }
      uint64_t v17 = [v16 type];
      switch(v17)
      {
        case 3:
          [(PKDrawingReplayController *)self _strokeEndedWithReplayPoint:v16];
          break;
        case 2:
          [(PKDrawingReplayController *)self _strokeMovedWithReplayPoint:v16];
          break;
        case 1:
          [(PKDrawingReplayController *)self _beginStrokeWithPoint:v16];
          break;
      }
    }
  }
}

- (void)_beginDrawing
{
  [(PKDrawingReplayController *)self setIsAnimating:1];
  char v3 = [(PKDrawingReplayController *)self textInputInteraction];
  id v4 = [v3 drawingGestureRecognizer];
  [v4 setIsReplaying:1];

  v5 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v6 = 0;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Beginning replay drawing", v6, 2u);
  }
}

- (void)_endDrawing
{
  [(PKDrawingReplayController *)self setIsAnimating:0];
  char v3 = [(PKDrawingReplayController *)self textInputInteraction];
  id v4 = [v3 drawingGestureRecognizer];
  [v4 setIsReplaying:0];

  v5 = [(PKDrawingReplayController *)self textInputInteraction];
  double v6 = [v5 drawingGestureRecognizer];
  [v6 setState:3];

  double v7 = [(PKDrawingReplayController *)self completionHandler];

  if (v7)
  {
    double v8 = [(PKDrawingReplayController *)self completionHandler];
    v8[2](v8, [(PKDrawingReplayController *)self cancelled] ^ 1);
  }
  [(PKDrawingReplayController *)self setCompletionHandler:0];
  double v9 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v10 = 0;
    _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_INFO, "Ending replay drawing", v10, 2u);
  }
}

- (CGPoint)currentOffset
{
  char v3 = [(PKDrawingReplayController *)self textField];
  id v4 = [(PKDrawingReplayController *)self textInputInteraction];
  v5 = [v4 view];
  objc_msgSend(v3, "PK_convertPoint:toView:", v5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v7 = v6;
  double v9 = v8;

  [(PKDrawingReplayController *)self originOffset];
  double v11 = v7 + v10;
  double v13 = v9 + v12;
  result.double y = v13;
  result.double x = v11;
  return result;
}

- (void)_beginStrokeWithPoint:(id)a3
{
  id v4 = a3;
  if (![(PKDrawingReplayController *)self cancelled])
  {
    [(PKDrawingReplayController *)self currentOffset];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    if (v4) {
      objc_msgSend(v4, "pkInputPointWithOffset:");
    }
    v5 = [(PKDrawingReplayController *)self drawingGestureRecognizer];
    double v6 = [(PKDrawingReplayController *)self canvasView];
    double v7 = [v6 window];
    v8[4] = v13;
    v8[5] = v14;
    v8[6] = v15;
    v8[7] = v16;
    v8[0] = v9;
    v8[1] = v10;
    v8[2] = v11;
    v8[3] = v12;
    [v5 _replayDrawingBegan:v8 coordinateSpace:v7 activeInputProperties:23 inputType:1];

    [(PKDrawingReplayController *)self _processNextPoint];
  }
}

- (void)_strokeMovedWithReplayPoint:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  [v4 delay];
  double v6 = v5;
  [(PKDrawingReplayController *)self speedRatio];
  if (v7 > 0.0)
  {
    [(PKDrawingReplayController *)self speedRatio];
    double v6 = v6 * (1.0 / v8);
  }
  if ([(PKDrawingReplayController *)self shouldEndDrawing])
  {
    [(PKDrawingReplayController *)self _endDrawing];
  }
  else
  {
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PKDrawingReplayController__strokeMovedWithReplayPoint___block_invoke;
    block[3] = &unk_1E64C66B8;
    objc_copyWeak(&v12, &location);
    id v11 = v4;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);
}

void __57__PKDrawingReplayController__strokeMovedWithReplayPoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained cancelled] & 1) == 0)
  {
    [v3 currentOffset];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      objc_msgSend(v4, "pkInputPointWithOffset:");
    }
    double v5 = [v3 drawingGestureRecognizer];
    v6[4] = v11;
    v6[5] = v12;
    v6[6] = v13;
    v6[7] = v14;
    v6[0] = v7;
    v6[1] = v8;
    v6[2] = v9;
    v6[3] = v10;
    [v5 _replayDrawingMoved:v6];

    [v3 _processNextPoint];
  }
}

- (void)_strokeEndedWithReplayPoint:(id)a3
{
  id v4 = a3;
  if ([(PKDrawingReplayController *)self shouldEndDrawing])
  {
    [(PKDrawingReplayController *)self _endDrawing];
  }
  else
  {
    objc_initWeak(&location, self);
    [v4 delay];
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PKDrawingReplayController__strokeEndedWithReplayPoint___block_invoke;
    v7[3] = &unk_1E64C5998;
    objc_copyWeak(&v8, &location);
    dispatch_after(v6, MEMORY[0x1E4F14428], v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __57__PKDrawingReplayController__strokeEndedWithReplayPoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = WeakRetained;
    char v3 = [WeakRetained cancelled];
    v2 = v5;
    if ((v3 & 1) == 0)
    {
      id v4 = [v5 drawingGestureRecognizer];
      [v4 _replayDrawingEnded];

      [v5 _processNextPoint];
      v2 = v5;
    }
  }
}

- (BOOL)shouldEndDrawing
{
  unint64_t v3 = [(PKDrawingReplayController *)self currentPointIndex] + 1;
  id v4 = [(PKDrawingReplayController *)self pointArray];
  LOBYTE(v3) = v3 >= [v4 count];

  return v3;
}

- (void)cancel
{
  if (![(PKDrawingReplayController *)self cancelled])
  {
    [(PKDrawingReplayController *)self setCancelled:1];
    [(PKDrawingReplayController *)self _endDrawing];
    unint64_t v3 = [(PKDrawingReplayController *)self drawingGestureRecognizer];
    [v3 _replayDrawingCancelled];

    id v4 = [(PKDrawingReplayController *)self textInputInteraction];
    [v4 cancelReplay];
  }
}

- (void)_loadPointArray
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PKDrawingReplayController *)self drawing];
  id v4 = [v3 strokes];

  double v5 = [(PKDrawingReplayController *)self drawing];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  float64x2_t v33 = 0u;
  float64x2_t v34 = 0u;
  float64x2_t v32 = 0u;
  [(PKDrawingReplayController *)self transform];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v29;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(obj);
        }
        long long v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) _strokeData];
        uint64_t v14 = [v13 _pointsCount];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = 0;
          uint64_t v17 = v14 - 1;
          double v18 = v11;
          do
          {
            if (v16) {
              uint64_t v19 = 2;
            }
            else {
              uint64_t v19 = 1;
            }
            double v20 = objc_alloc_init(PKDrawingReplayPoint);
            [(PKDrawingReplayPoint *)v20 setType:v19];
            [v13 timestampAtIndex:v16];
            double v11 = v21;
            [(PKDrawingReplayPoint *)v20 setDelay:v21 - v18];
            [v13 locationAtIndex:v16];
            [(PKDrawingReplayPoint *)v20 setPoint:vaddq_f64(v34, vmlaq_n_f64(vmulq_n_f64(v33, v23 - v9), v32, v22 - v7))];
            [v10 addObject:v20];
            if (v17 == v16)
            {
              uint64_t v24 = objc_alloc_init(PKDrawingReplayPoint);
              [(PKDrawingReplayPoint *)v24 setType:3];
              [v10 addObject:v24];
            }
            ++v16;
            double v18 = v11;
          }
          while (v15 != v16);
        }
      }
      uint64_t v27 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v27);
  }

  [(PKDrawingReplayController *)self setPointArray:v10];
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (double)speedRatio
{
  return self->_speedRatio;
}

- (void)setSpeedRatio:(double)a3
{
  self->_speedRatio = a3;
}

- (BOOL)setupComplete
{
  return self->_setupComplete;
}

- (void)setSetupComplete:(BOOL)a3
{
  self->_setupComplete = a3;
}

- (PKTiledCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);

  return (UITextField *)WeakRetained;
}

- (void)setTextField:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (PKTextInputInteraction)textInputInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textInputInteraction);

  return (PKTextInputInteraction *)WeakRetained;
}

- (void)setTextInputInteraction:(id)a3
{
}

- (PKTextInputDrawingGestureRecognizer)drawingGestureRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingGestureRecognizer);

  return (PKTextInputDrawingGestureRecognizer *)WeakRetained;
}

- (void)setDrawingGestureRecognizer:(id)a3
{
}

- (unint64_t)currentPointIndex
{
  return self->_currentPointIndex;
}

- (void)setCurrentPointIndex:(unint64_t)a3
{
  self->_currentPointIndedouble x = a3;
}

- (CGPoint)startingTextFieldOrigin
{
  double x = self->_startingTextFieldOrigin.x;
  double y = self->_startingTextFieldOrigin.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingTextFieldOrigin:(CGPoint)a3
{
  self->_startingTextFieldOrigin = a3;
}

- (CGPoint)originOffset
{
  double x = self->_originOffset.x;
  double y = self->_originOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginOffset:(CGPoint)a3
{
  self->_originOffset = a3;
}

- (void)setCurrentOffset:(CGPoint)a3
{
  self->_currentOffset = a3;
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[3].d;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tdouble x = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (NSMutableArray)pointArray
{
  return self->_pointArray;
}

- (void)setPointArray:(id)a3
{
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointArray, 0);
  objc_destroyWeak((id *)&self->_drawingGestureRecognizer);
  objc_destroyWeak((id *)&self->_textInputInteraction);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_textField);
  objc_storeStrong((id *)&self->_drawing, 0);

  objc_storeStrong((id *)&self->_canvasView, 0);
}

@end