@interface PKPaintAreaView
- (BOOL)_isLiveAnimating;
- (BOOL)beginDrawingAtPoint:(id *)a3 surface:(id)a4 locationInView:(CGPoint)a5 inputType:(int64_t)a6;
- (BOOL)canAddStroke;
- (BOOL)canBecomeFirstResponder;
- (BOOL)drawingDisabled;
- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5;
- (BOOL)fingerDrawingEnabled;
- (BOOL)switchSurfacesDuringStrokes;
- (CGAffineTransform)strokeTransform;
- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3;
- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3 previousPoint:(CGPoint)a4 newSurface:(id *)a5;
- (PKAlternativeStrokesAnimation)alternativeStrokesAnimation;
- (PKPaintAreaView)initWithCoder:(id)a3;
- (PKPaintAreaView)initWithFrame:(CGRect)a3;
- (PKPaintAreaViewDelegate)delegate;
- (PKShapeDrawingController)shapeDrawingController;
- (PKTool)tool;
- (double)liveAnimationStartTime;
- (id)_drawingController;
- (id)_rendererController;
- (id)hitSurface:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)shapeDrawingControllerRendererController:(id)a3;
- (void)_commonInit;
- (void)_drawingBegan:(id *)a3 locationInView:(CGPoint)a4 inputType:(int64_t)a5;
- (void)_endAlternativeStrokeIfNecessaryAccepted:(BOOL)a3;
- (void)checkAnimationsDidEndAtTime:(double)a3;
- (void)drawingBegan:(id)a3;
- (void)drawingCancelled;
- (void)drawingEnded;
- (void)drawingEstimatedPropertiesUpdated:(id)a3;
- (void)drawingMoved:(id)a3 withEvent:(id)a4;
- (void)drawingMovedToPoint:(id *)a3 locationInView:(CGPoint)a4;
- (void)setAlternativeStrokesAnimation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawingDisabled:(BOOL)a3;
- (void)setFingerDrawingEnabled:(BOOL)a3;
- (void)setLiveAnimationStartTime:(double)a3;
- (void)setShapeDrawingController:(id)a3;
- (void)setSwitchSurfacesDuringStrokes:(BOOL)a3;
- (void)setTool:(id)a3;
- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3;
- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4;
- (void)switchToNewPaintSurface:(id)a3;
- (void)vsync:(double)a3;
@end

@implementation PKPaintAreaView

- (PKPaintAreaView)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPaintAreaView;
  v5 = [(PKPaintAreaView *)&v8 initWithCoder:v4];
  v6 = v5;
  if (v5) {
    [(PKPaintAreaView *)v5 _commonInit];
  }

  return v6;
}

- (void)_commonInit
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  liveSurfaces = self->_liveSurfaces;
  self->_liveSurfaces = v3;

  v5 = [MEMORY[0x1E4FB1618] greenColor];
  v6 = +[PKInk inkWithType:@"com.apple.ink.pen" color:v5 weight:0.5];
  v7 = +[PKTool _toolWithInk:v6];
  tool = self->_tool;
  self->_tool = v7;

  v9 = objc_alloc_init(PKDrawingGestureRecognizer);
  drawingGestureRecognizer = self->_drawingGestureRecognizer;
  self->_drawingGestureRecognizer = v9;

  [(PKDrawingGestureRecognizer *)self->_drawingGestureRecognizer setDelegate:self];
  [(PKDrawingGestureRecognizer *)self->_drawingGestureRecognizer setDrawingTarget:self];
  [(PKPaintAreaView *)self addGestureRecognizer:self->_drawingGestureRecognizer];
  v11 = (PKShapeDrawingController *)-[PKShapeDrawingController initWithDelegate:]([PKShapeDrawingController alloc], self);
  shapeDrawingController = self->_shapeDrawingController;
  self->_shapeDrawingController = v11;

  v13 = self->_shapeDrawingController;
  if (v13) {
    v13->_shapeRecognitionOn = 1;
  }
}

- (PKPaintAreaView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaintAreaView;
  v3 = -[PKPaintAreaView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PKPaintAreaView *)v3 _commonInit];
  }
  return v4;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  BOOL v8 = [(PKPaintAreaView *)self drawingDisabled];
  if (v7) {
    char v9 = v8;
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) == 0)
  {
    if ([v7 _hidEvent])
    {
      int v10 = objc_msgSend(v7, "PK_isEventFromPencil");
      if (([(PKPaintAreaView *)self fingerDrawingEnabled] | v10))
      {
        currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
        if (currentPaintSurfaceObject
          && ([(PKPaintAreaViewSurface *)currentPaintSurfaceObject isDrawing]
           || [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject isErasingObjects]))
        {
          v12 = self;
          goto LABEL_17;
        }
        if ([(PKPaintAreaView *)self canAddStroke])
        {
          v21.receiver = self;
          v21.super_class = (Class)PKPaintAreaView;
          -[PKPaintAreaView hitTest:withEvent:](&v21, sel_hitTest_withEvent_, v7, x, y);
          v13 = (PKPaintAreaView *)objc_claimAutoreleasedReturnValue();
          if (v13 != self)
          {
LABEL_13:
            v14 = v13;
LABEL_14:
            self = v14;
            v12 = v14;
LABEL_15:

            goto LABEL_17;
          }
          if ([(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject isDrawing])
          {
            v14 = self;
            goto LABEL_14;
          }
          v16 = -[PKPaintAreaView hitSurface:](self, "hitSurface:", x, y);
          v17 = self->_currentPaintSurfaceObject;
          if (v17
            && ((BOOL v18 = [(PKPaintAreaViewSurface *)v17 waitingForStrokeToEnd], v16)
              ? (BOOL v19 = v18)
              : (BOOL v19 = 0),
                v19))
          {
            v20 = [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject surface];

            if (v16 != v20)
            {

              v12 = 0;
              goto LABEL_15;
            }
          }
          else if (!v16)
          {

            self = 0;
            goto LABEL_32;
          }
          [(PKPaintAreaView *)self switchToNewPaintSurface:v16];
LABEL_32:

          v13 = self;
          goto LABEL_13;
        }
      }
    }
  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (CGAffineTransform)strokeTransform
{
  result = (CGAffineTransform *)self->_currentPaintSurfaceObject;
  if (result) {
    return (CGAffineTransform *)[(CGAffineTransform *)result strokeTransform];
  }
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v4 + 32);
  return result;
}

- (BOOL)canAddStroke
{
  return 1;
}

- (void)switchToNewPaintSurface:(id)a3
{
  id v14 = a3;
  if ([(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject isDrawing]) {
    [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingEndedWithDetectedShape:0 completionBlock:0];
  }
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  if (currentPaintSurfaceObject)
  {
    long long v5 = [(PKPaintAreaViewSurface *)currentPaintSurfaceObject drawingController];
    if (v5)
    {
      char v6 = v5[48];

      if ((v6 & 1) == 0) {
        goto LABEL_8;
      }
      [(NSMutableArray *)self->_liveSurfaces addObject:self->_currentPaintSurfaceObject];
      id v7 = self->_currentPaintSurfaceObject;
      self->_currentPaintSurfaceObject = 0;
    }
    else
    {
      id v7 = 0;
    }
  }
LABEL_8:
  BOOL v8 = [(PKPaintAreaView *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    int v10 = [(PKPaintAreaView *)self delegate];
    v11 = [v10 paintAreaView:self dispatchQueueForSurface:v14];
  }
  else
  {
    v11 = 0;
  }
  v12 = [[PKPaintAreaViewSurface alloc] initWithPaintSurface:v14 dispatchQueue:v11 device:self->_device];
  v13 = self->_currentPaintSurfaceObject;
  self->_currentPaintSurfaceObject = v12;

  [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject setPaintAreaView:self];
}

- (id)hitSurface:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v6 = [(PKPaintAreaView *)self delegate];
  id v7 = objc_msgSend(v6, "paintAreaView:surfaceAtLocation:", self, x, y);

  return v7;
}

- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3
{
  -[PKPaintAreaView applyTransformToTouchLocation:previousPoint:newSurface:](self, "applyTransformToTouchLocation:previousPoint:newSurface:", 0, a3.x, a3.y, NAN, NAN);
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3 previousPoint:(CGPoint)a4 newSurface:(id *)a5
{
  double y = a3.y;
  double x = a3.x;
  if (self->_currentPaintSurfaceObject)
  {
    double v8 = a4.y;
    double v9 = a4.x;
    v11 = [(PKPaintAreaView *)self delegate];
    v12 = [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject surface];
    objc_msgSend(v11, "paintAreaView:transformLocation:surface:newSurface:", self, v12, a5, x, y);
    double x = v13;
    double y = v14;

    if (a5 && *a5)
    {
      double v9 = NAN;
      double v8 = NAN;
    }
    if ((*(void *)&v9 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && (*(void *)&v8 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && (*(void *)&x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
      && (*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
    {
      double v18 = v9 - x >= 0.0 ? v9 - x : -(v9 - x);
      [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingSize];
      if (v18 > v19 * 0.5
        || (v8 - y >= 0.0 ? (double v20 = v8 - y) : (double v20 = -(v8 - y)),
            [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingSize],
            v20 > v21 * 0.5))
      {
        double y = NAN;
        double x = NAN;
      }
    }
  }
  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (BOOL)_isLiveAnimating
{
  [(PKPaintAreaView *)self liveAnimationStartTime];
  return v2 > 0.0;
}

- (id)_drawingController
{
  return [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingController];
}

- (void)_endAlternativeStrokeIfNecessaryAccepted:(BOOL)a3
{
  alternativeStrokesAnimation = self->_alternativeStrokesAnimation;
  if (alternativeStrokesAnimation)
  {
    if (alternativeStrokesAnimation->_crossFadeStartTime == 0.0)
    {
      alternativeStrokesAnimation->_crossFadeStartTime = CACurrentMediaTime();
      alternativeStrokesAnimation->_accepted = a3;
    }
  }
}

- (id)_rendererController
{
  double v2 = [(PKPaintAreaView *)self _drawingController];
  double v3 = v2;
  if (v2) {
    double v2 = (void *)v2[8];
  }
  double v4 = v2;

  return v4;
}

- (void)checkAnimationsDidEndAtTime:(double)a3
{
  [(PKPaintAreaView *)self liveAnimationStartTime];
  if (v5 != 0.0)
  {
    alternativeStrokesAnimation = self->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation)
    {
      if (alternativeStrokesAnimation->_forceDone
        || (double crossFadeStartTime = alternativeStrokesAnimation->_crossFadeStartTime, crossFadeStartTime > 0.0)
        && crossFadeStartTime + alternativeStrokesAnimation->_fadeDuration <= a3)
      {
        self->_alternativeStrokesAnimation = 0;
      }
    }
  }
}

- (void)vsync:(double)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v5 = CACurrentMediaTime();
  if ([(PKPaintAreaView *)self _isLiveAnimating])
  {
    [(PKPaintAreaView *)self liveAnimationStartTime];
    double v7 = v6;
    double v8 = [(PKPaintAreaView *)self _rendererController];
    -[PKMetalRendererController setLiveStrokeElapsedTime:]((uint64_t)v8, v5 - v7);
  }
  uint64_t v9 = [(PKPaintAreaView *)self shapeDrawingController];
  int v10 = (void *)v9;
  if (v9) {
    -[PKShapeDrawingController _checkDetectedStroke](v9);
  }

  if (self->_alternativeStrokesAnimation)
  {
    v11 = [(PKPaintAreaView *)self _rendererController];
    alternativeStrokesAnimation = self->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation) {
      alternativeStrokesAnimation = (PKAlternativeStrokesAnimation *)alternativeStrokesAnimation->_strokes;
    }
    double v13 = alternativeStrokesAnimation;
    double v14 = self->_alternativeStrokesAnimation;
    double v15 = -[PKAlternativeStrokesAnimation alphaAtTime:]((uint64_t)v14, v5);
    double v16 = -[PKAlternativeStrokesAnimation originalStrokeAlphaAtTime:]((uint64_t)v14, v5);
    -[PKMetalRendererController setAlternativeStrokes:alpha:originalStrokeAlpha:]((uint64_t)v11, v13, v15, v16);
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v17 = (void *)[(NSMutableArray *)self->_liveSurfaces copy];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v26;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v17);
        }
        double v21 = *(void **)(*((void *)&v25 + 1) + 8 * v20);
        v22 = [v21 drawingController];
        if (v22 && (BOOL v23 = (v22[48] & 1) == 0, v22, !v23)) {
          [v21 vsync:a3];
        }
        else {
          [(NSMutableArray *)self->_liveSurfaces removeObject:v21];
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v24 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      uint64_t v18 = v24;
    }
    while (v24);
  }

  [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject vsync:a3];
  [(PKPaintAreaView *)self checkAnimationsDidEndAtTime:v5];
}

- (void)_drawingBegan:(id *)a3 locationInView:(CGPoint)a4 inputType:(int64_t)a5
{
  double y = a4.y;
  double x = a4.x;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    unint64_t v10 = [(PKDrawingGestureRecognizer *)self->_drawingGestureRecognizer activeInputProperties];
    currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
    if (currentPaintSurfaceObject)
    {
      -[PKPaintAreaViewSurface setPreviousPoint:](currentPaintSurfaceObject, "setPreviousPoint:", NAN, NAN);
      -[PKPaintAreaView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", x, y);
      if ((v13 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL && (v12 & 0x7FFFFFFFFFFFFFFFuLL) < 0x7FF0000000000000)
      {
        -[PKPaintAreaViewSurface setPreviousPoint:](self->_currentPaintSurfaceObject, "setPreviousPoint:");
        double v14 = self->_currentPaintSurfaceObject;
        long long v15 = *(_OWORD *)&a3->var9;
        v26[4] = *(_OWORD *)&a3->var7;
        v26[5] = v15;
        long long v16 = *(_OWORD *)&a3->var13;
        v26[6] = *(_OWORD *)&a3->var11;
        v26[7] = v16;
        long long v17 = *(_OWORD *)&a3->var1;
        v26[0] = a3->var0;
        v26[1] = v17;
        long long v18 = *(_OWORD *)&a3->var5;
        v26[2] = *(_OWORD *)&a3->var3;
        v26[3] = v18;
        [(PKPaintAreaViewSurface *)v14 drawingBegan:v26 activeInputProperties:v10 inputType:a5];
        uint64_t v19 = [(PKPaintAreaView *)self tool];
        uint64_t v20 = [v19 ink];

        if (![v20 _isStrokeGeneratingInk]
          || ([v20 _isHandwritingInk] & 1) != 0)
        {
          goto LABEL_19;
        }
        double v21 = [(PKPaintAreaView *)self shapeDrawingController];
        if (v21)
        {
          if (v21[192])
          {
          }
          else
          {
            int v24 = v21[193];

            if (!v24)
            {
LABEL_19:

              return;
            }
          }
          long long v25 = [(PKPaintAreaView *)self shapeDrawingController];
          [(PKShapeDrawingController *)(uint64_t)v25 beginStrokeAtPoint:y];
        }
        else
        {
          long long v25 = 0;
        }

        goto LABEL_19;
      }
      drawingGestureRecognizer = self->_drawingGestureRecognizer;
      [(PKDrawingGestureRecognizer *)drawingGestureRecognizer end];
    }
    else
    {
      BOOL v23 = self->_drawingGestureRecognizer;
      [(PKDrawingGestureRecognizer *)v23 cancel];
    }
  }
}

- (BOOL)beginDrawingAtPoint:(id *)a3 surface:(id)a4 locationInView:(CGPoint)a5 inputType:(int64_t)a6
{
  double y = a5.y;
  double x = a5.x;
  id v11 = a4;
  id v12 = [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject surface];

  if (v12 != v11) {
    [(PKPaintAreaView *)self switchToNewPaintSurface:v11];
  }
  long long v13 = *(_OWORD *)&a3->var9;
  v18[4] = *(_OWORD *)&a3->var7;
  v18[5] = v13;
  long long v14 = *(_OWORD *)&a3->var13;
  v18[6] = *(_OWORD *)&a3->var11;
  v18[7] = v14;
  long long v15 = *(_OWORD *)&a3->var1;
  v18[0] = a3->var0;
  v18[1] = v15;
  long long v16 = *(_OWORD *)&a3->var5;
  v18[2] = *(_OWORD *)&a3->var3;
  v18[3] = v16;
  -[PKPaintAreaView _drawingBegan:locationInView:inputType:](self, "_drawingBegan:locationInView:inputType:", v18, a6, x, y);

  return 1;
}

- (void)drawingMovedToPoint:(id *)a3 locationInView:(CGPoint)a4
{
  BOOL v6 = [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject isErasingObjects];
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  if (v6)
  {
    double x = a3->var0.var0.x;
    double y = a3->var0.var0.y;
    -[PKPaintAreaViewSurface eraserMovedToLocation:](currentPaintSurfaceObject, "eraserMovedToLocation:", x, y);
  }
  else
  {
    unint64_t v10 = [(PKPaintAreaViewSurface *)currentPaintSurfaceObject drawingController];
    id v11 = -[PKController inputController](v10);
    long long v12 = *(_OWORD *)&a3->var9;
    v16[4] = *(_OWORD *)&a3->var7;
    v16[5] = v12;
    long long v13 = *(_OWORD *)&a3->var13;
    v16[6] = *(_OWORD *)&a3->var11;
    v16[7] = v13;
    long long v14 = *(_OWORD *)&a3->var1;
    v16[0] = a3->var0;
    v16[1] = v14;
    long long v15 = *(_OWORD *)&a3->var5;
    v16[2] = *(_OWORD *)&a3->var3;
    v16[3] = v15;
    [v11 addPoint:v16];
  }
}

- (void)drawingEnded
{
  uint64_t v3 = [(PKPaintAreaView *)self shapeDrawingController];
  double v4 = (void *)v3;
  if (v3) {
    double v5 = *(void **)(v3 + 208);
  }
  else {
    double v5 = 0;
  }
  id v6 = v5;

  double v7 = [(PKPaintAreaView *)self shapeDrawingController];
  -[PKShapeDrawingController resetStroke]((uint64_t)v7);

  [(PKPaintAreaView *)self _endAlternativeStrokeIfNecessaryAccepted:v6 != 0];
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__PKPaintAreaView_drawingEnded__block_invoke;
  v9[3] = &unk_1E64C5368;
  v9[4] = self;
  [(PKPaintAreaViewSurface *)currentPaintSurfaceObject drawingEndedWithDetectedShape:v6 completionBlock:v9];
}

void __31__PKPaintAreaView_drawingEnded__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(v1 + 416);
  *(void *)(v1 + 416) = 0;
}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5
{
  return self->_alternativeStrokesAnimation == 0;
}

- (void)drawingBegan:(id)a3
{
  id v4 = a3;
  [v4 preciseLocationInView:self];
  double v6 = v5;
  double v8 = v7;
  -[PKPaintAreaView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v4, 0, [(PKDrawingGestureRecognizer *)self->_drawingGestureRecognizer activeInputProperties], v9, v10);
  BOOL v11 = [v4 type] == 2;
  v12[4] = v17;
  v12[5] = v18;
  v12[6] = v19;
  v12[7] = v20;
  v12[0] = v13;
  v12[1] = v14;
  v12[2] = v15;
  v12[3] = v16;
  -[PKPaintAreaView _drawingBegan:locationInView:inputType:](self, "_drawingBegan:locationInView:inputType:", v12, v11, v6, v8);
}

- (void)drawingMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  id v138 = a3;
  id v137 = a4;
  BOOL v6 = [(PKPaintAreaView *)self switchSurfacesDuringStrokes];
  if ([(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject isErasingObjects])
  {
    [v138 preciseLocationInView:self];
    double v8 = v7;
    double v10 = v9;
    [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject previousPoint];
    if (v6) {
      long long v13 = &v172;
    }
    else {
      long long v13 = 0;
    }
    if (v6) {
      id v172 = 0;
    }
    -[PKPaintAreaView applyTransformToTouchLocation:previousPoint:newSurface:](self, "applyTransformToTouchLocation:previousPoint:newSurface:", v13, v8, v10, v11, v12);
    double v15 = v14;
    double v17 = v16;
    if (v6 && (id v18 = v172) != 0)
    {
      id v19 = v18;
      [(PKPaintAreaView *)self switchToNewPaintSurface:v18];
      long long v20 = v19;
    }
    else
    {
      -[PKPaintAreaViewSurface eraserMovedToLocation:](self->_currentPaintSurfaceObject, "eraserMovedToLocation:", v15, v17);
      long long v20 = 0;
    }
    goto LABEL_112;
  }
  double v21 = [v137 coalescedTouchesForTouch:v138];
  unint64_t v22 = [v21 count];

  BOOL v23 = [v137 predictedTouchesForTouch:v138];
  int v24 = v23;
  if (v23)
  {
    if ((unint64_t)[v23 count] >= 3)
    {
      uint64_t v25 = objc_msgSend(v24, "subarrayWithRange:", 0, 2);

      int v24 = (void *)v25;
    }
    v22 += [v24 count];
  }
  v134 = v24;
  v142 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v22];
  v170 = 0;
  v169 = 0;
  unint64_t v171 = 0;
  std::vector<PKInputPoint>::reserve(&v169, v22);
  unint64_t v26 = [(PKDrawingGestureRecognizer *)self->_drawingGestureRecognizer activeInputProperties];
  long long v167 = 0u;
  long long v168 = 0u;
  BOOL v135 = [v138 type] == 2;
  long long v165 = 0u;
  long long v166 = 0u;
  id v27 = [v137 coalescedTouchesForTouch:v138];
  unint64_t v136 = v26;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v165 objects:v174 count:16];
  if (v28)
  {
    v29 = &v164;
    if (!v6) {
      v29 = 0;
    }
    v140 = v29;
    uint64_t v141 = *(void *)v166;
    v133 = &v171;
LABEL_18:
    uint64_t v139 = v28;
    uint64_t v30 = 0;
    while (1)
    {
      if (*(void *)v166 != v141) {
        objc_enumerationMutation(v27);
      }
      v31 = *(void **)(*((void *)&v165 + 1) + 8 * v30);
      objc_msgSend(v31, "preciseLocationInView:", self, v133);
      double v33 = v32;
      double v35 = v34;
      [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject previousPoint];
      if (v6) {
        id v164 = 0;
      }
      -[PKPaintAreaView applyTransformToTouchLocation:previousPoint:newSurface:](self, "applyTransformToTouchLocation:previousPoint:newSurface:", v140, v33, v35, v36, v37);
      double v39 = v38;
      double v41 = v40;
      if (v6)
      {
        id v42 = v164;
        if (v42)
        {
          v43 = v42;
          if (v170 != v169)
          {
            v44 = [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingController];
            v45 = -[PKController inputController](v44);
            v162 = 0;
            __p = 0;
            uint64_t v163 = 0;
            std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&__p, v169, (uint64_t)v170, (v170 - (unsigned char *)v169) >> 7);
            [v45 addPoints:&__p];
            if (__p)
            {
              v162 = __p;
              operator delete(__p);
            }

            std::vector<PKInputPoint>::resize((uint64_t)&v169, 0);
          }
          [(PKPaintAreaView *)self switchToNewPaintSurface:v43];
          if ((*(void *)&v39 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
            && (*(void *)&v41 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
          {
            long long v159 = 0u;
            long long v160 = 0u;
            long long v157 = 0u;
            long long v158 = 0u;
            long long v155 = 0u;
            long long v156 = 0u;
            long long v153 = 0u;
            long long v154 = 0u;
            +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v31, 0, v136, v39, v41);
            currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
            v152[4] = v157;
            v152[5] = v158;
            v152[6] = v159;
            v152[7] = v160;
            v152[0] = v153;
            v152[1] = v154;
            v152[2] = v155;
            v152[3] = v156;
            [(PKPaintAreaViewSurface *)currentPaintSurfaceObject drawingBegan:v152 activeInputProperties:v136 inputType:v135];
          }
          goto LABEL_65;
        }
      }
      if ((*(void *)&v39 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
        || (*(void *)&v41 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
      {
        if ([(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject isDrawing]) {
          [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingEndedWithDetectedShape:0 completionBlock:0];
        }
        -[PKPaintAreaViewSurface setPreviousPoint:](self->_currentPaintSurfaceObject, "setPreviousPoint:", NAN, NAN);
        goto LABEL_105;
      }
      if ([(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject isDrawing])
      {
        -[PKPaintAreaViewSurface setPreviousPoint:](self->_currentPaintSurfaceObject, "setPreviousPoint:", v39, v41);
        long long v159 = 0u;
        long long v160 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v31, 0, [(PKDrawingGestureRecognizer *)self->_drawingGestureRecognizer activeInputProperties], v39, v41);
        v49 = v170;
        if ((unint64_t)v170 >= v171)
        {
          v58 = (char *)v169;
          uint64_t v59 = (v170 - (unsigned char *)v169) >> 7;
          unint64_t v60 = v59 + 1;
          if ((unint64_t)(v59 + 1) >> 57) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v61 = v171 - (void)v169;
          if ((uint64_t)(v171 - (void)v169) >> 6 > v60) {
            unint64_t v60 = v61 >> 6;
          }
          if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFF80) {
            unint64_t v62 = 0x1FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v62 = v60;
          }
          if (v62)
          {
            v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)v133, v62);
            v49 = v170;
            v58 = (char *)v169;
          }
          else
          {
            v63 = 0;
          }
          v64 = &v63[128 * v59];
          long long v65 = v153;
          long long v66 = v154;
          long long v67 = v156;
          *((_OWORD *)v64 + 2) = v155;
          *((_OWORD *)v64 + 3) = v67;
          *(_OWORD *)v64 = v65;
          *((_OWORD *)v64 + 1) = v66;
          long long v68 = v157;
          long long v69 = v158;
          long long v70 = v160;
          *((_OWORD *)v64 + 6) = v159;
          *((_OWORD *)v64 + 7) = v70;
          *((_OWORD *)v64 + 4) = v68;
          *((_OWORD *)v64 + 5) = v69;
          if (v49 == v58)
          {
            v78 = &v63[128 * v59];
          }
          else
          {
            v71 = &v63[128 * v59];
            do
            {
              long long v72 = *((_OWORD *)v49 - 8);
              long long v73 = *((_OWORD *)v49 - 7);
              long long v74 = *((_OWORD *)v49 - 5);
              *((_OWORD *)v71 - 6) = *((_OWORD *)v49 - 6);
              *((_OWORD *)v71 - 5) = v74;
              *((_OWORD *)v71 - 8) = v72;
              *((_OWORD *)v71 - 7) = v73;
              long long v75 = *((_OWORD *)v49 - 4);
              long long v76 = *((_OWORD *)v49 - 3);
              long long v77 = *((_OWORD *)v49 - 1);
              v78 = v71 - 128;
              *((_OWORD *)v71 - 2) = *((_OWORD *)v49 - 2);
              *((_OWORD *)v71 - 1) = v77;
              *((_OWORD *)v71 - 4) = v75;
              *((_OWORD *)v71 - 3) = v76;
              v49 -= 128;
              v71 -= 128;
            }
            while (v49 != v58);
          }
          v56 = v64 + 128;
          v169 = v78;
          v170 = v64 + 128;
          unint64_t v171 = (unint64_t)&v63[128 * v62];
          if (v58) {
            operator delete(v58);
          }
        }
        else
        {
          long long v50 = v153;
          long long v51 = v154;
          long long v52 = v156;
          *((_OWORD *)v170 + 2) = v155;
          *((_OWORD *)v49 + 3) = v52;
          *(_OWORD *)v49 = v50;
          *((_OWORD *)v49 + 1) = v51;
          long long v53 = v157;
          long long v54 = v158;
          long long v55 = v160;
          *((_OWORD *)v49 + 6) = v159;
          *((_OWORD *)v49 + 7) = v55;
          *((_OWORD *)v49 + 4) = v53;
          *((_OWORD *)v49 + 5) = v54;
          v56 = v49 + 128;
        }
        v170 = v56;
        [v142 addObject:v31];
        v79 = [(PKPaintAreaView *)self shapeDrawingController];
        if (!v79)
        {
          v86 = 0;
          goto LABEL_63;
        }
        BOOL v80 = v79[2] == v79[1];

        if (!v80)
        {
          v81 = [(PKPaintAreaView *)self window];
          [v138 locationInView:v81];
          CGFloat v83 = v82;
          CGFloat v85 = v84;

          v86 = [(PKPaintAreaView *)self shapeDrawingController];
          v150[5] = v158;
          v150[6] = v159;
          v150[7] = v160;
          v150[0] = v153;
          v150[1] = v154;
          v150[2] = v155;
          v150[3] = v156;
          v150[4] = v157;
          [(PKShapeDrawingController *)(uint64_t)v86 addStrokePoint:v83 inputPoint:v85];
LABEL_63:
        }
      }
      else
      {
        long long v159 = 0u;
        long long v160 = 0u;
        long long v157 = 0u;
        long long v158 = 0u;
        long long v155 = 0u;
        long long v156 = 0u;
        long long v153 = 0u;
        long long v154 = 0u;
        +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v31, 0, v136, v39, v41);
        v57 = self->_currentPaintSurfaceObject;
        v151[4] = v157;
        v151[5] = v158;
        v151[6] = v159;
        v151[7] = v160;
        v151[0] = v153;
        v151[1] = v154;
        v151[2] = v155;
        v151[3] = v156;
        [(PKPaintAreaViewSurface *)v57 drawingBegan:v151 activeInputProperties:v136 inputType:v135];
      }
      v43 = 0;
LABEL_65:

      if (++v30 == v139)
      {
        uint64_t v28 = [v27 countByEnumeratingWithState:&v165 objects:v174 count:16];
        if (v28) {
          goto LABEL_18;
        }
        break;
      }
    }
  }

  long long v148 = 0u;
  long long v149 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  id v27 = v134;
  uint64_t v87 = [v27 countByEnumeratingWithState:&v146 objects:v173 count:16];
  if (v87)
  {
    uint64_t v88 = *(void *)v147;
    do
    {
      for (uint64_t i = 0; i != v87; ++i)
      {
        if (*(void *)v147 != v88) {
          objc_enumerationMutation(v27);
        }
        v90 = *(void **)(*((void *)&v146 + 1) + 8 * i);
        [v90 preciseLocationInView:self];
        double v92 = v91;
        double v94 = v93;
        [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject previousPoint];
        -[PKPaintAreaView applyTransformToTouchLocation:previousPoint:newSurface:](self, "applyTransformToTouchLocation:previousPoint:newSurface:", 0, v92, v94, v95, v96);
        if ((*(void *)&v97 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
          && (*(void *)&v98 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
        {
          long long v159 = 0u;
          long long v160 = 0u;
          long long v157 = 0u;
          long long v158 = 0u;
          long long v155 = 0u;
          long long v156 = 0u;
          long long v153 = 0u;
          long long v154 = 0u;
          +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v90, 1, [(PKDrawingGestureRecognizer *)self->_drawingGestureRecognizer activeInputProperties], v97, v98);
          v100 = v170;
          if ((unint64_t)v170 >= v171)
          {
            v108 = (char *)v169;
            uint64_t v109 = (v170 - (unsigned char *)v169) >> 7;
            unint64_t v110 = v109 + 1;
            if ((unint64_t)(v109 + 1) >> 57) {
              std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v111 = v171 - (void)v169;
            if ((uint64_t)(v171 - (void)v169) >> 6 > v110) {
              unint64_t v110 = v111 >> 6;
            }
            if ((unint64_t)v111 >= 0x7FFFFFFFFFFFFF80) {
              unint64_t v112 = 0x1FFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v112 = v110;
            }
            if (v112)
            {
              v113 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&v171, v112);
              v100 = v170;
              v108 = (char *)v169;
            }
            else
            {
              v113 = 0;
            }
            v114 = &v113[128 * v109];
            long long v115 = v153;
            long long v116 = v154;
            long long v117 = v156;
            *((_OWORD *)v114 + 2) = v155;
            *((_OWORD *)v114 + 3) = v117;
            *(_OWORD *)v114 = v115;
            *((_OWORD *)v114 + 1) = v116;
            long long v118 = v157;
            long long v119 = v158;
            long long v120 = v160;
            *((_OWORD *)v114 + 6) = v159;
            *((_OWORD *)v114 + 7) = v120;
            *((_OWORD *)v114 + 4) = v118;
            *((_OWORD *)v114 + 5) = v119;
            if (v100 == v108)
            {
              v128 = &v113[128 * v109];
            }
            else
            {
              v121 = &v113[128 * v109];
              do
              {
                long long v122 = *((_OWORD *)v100 - 8);
                long long v123 = *((_OWORD *)v100 - 7);
                long long v124 = *((_OWORD *)v100 - 5);
                *((_OWORD *)v121 - 6) = *((_OWORD *)v100 - 6);
                *((_OWORD *)v121 - 5) = v124;
                *((_OWORD *)v121 - 8) = v122;
                *((_OWORD *)v121 - 7) = v123;
                long long v125 = *((_OWORD *)v100 - 4);
                long long v126 = *((_OWORD *)v100 - 3);
                long long v127 = *((_OWORD *)v100 - 1);
                v128 = v121 - 128;
                *((_OWORD *)v121 - 2) = *((_OWORD *)v100 - 2);
                *((_OWORD *)v121 - 1) = v127;
                *((_OWORD *)v121 - 4) = v125;
                *((_OWORD *)v121 - 3) = v126;
                v100 -= 128;
                v121 -= 128;
              }
              while (v100 != v108);
            }
            v107 = v114 + 128;
            v169 = v128;
            v170 = v114 + 128;
            unint64_t v171 = (unint64_t)&v113[128 * v112];
            if (v108) {
              operator delete(v108);
            }
          }
          else
          {
            long long v101 = v153;
            long long v102 = v154;
            long long v103 = v156;
            *((_OWORD *)v170 + 2) = v155;
            *((_OWORD *)v100 + 3) = v103;
            *(_OWORD *)v100 = v101;
            *((_OWORD *)v100 + 1) = v102;
            long long v104 = v157;
            long long v105 = v158;
            long long v106 = v160;
            *((_OWORD *)v100 + 6) = v159;
            *((_OWORD *)v100 + 7) = v106;
            *((_OWORD *)v100 + 4) = v104;
            *((_OWORD *)v100 + 5) = v105;
            v107 = v100 + 128;
          }
          v170 = v107;
          [v142 addObject:v90];
        }
      }
      uint64_t v87 = [v27 countByEnumeratingWithState:&v146 objects:v173 count:16];
    }
    while (v87);
  }
LABEL_105:

  v130 = v170;
  if (v170 != v169)
  {
    v131 = [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingController];
    v132 = -[PKController inputController](v131);
    v143 = 0;
    v144 = 0;
    uint64_t v145 = 0;
    std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&v143, v169, (uint64_t)v170, (v170 - (unsigned char *)v169) >> 7);
    [v132 addPoints:&v143];
    if (v143)
    {
      v144 = v143;
      operator delete(v143);
    }

    v130 = (char *)v169;
  }
  if (v130)
  {
    v170 = v130;
    operator delete(v130);
  }

  long long v20 = v134;
LABEL_112:
}

- (void)drawingCancelled
{
  id v4 = [(PKPaintAreaView *)self shapeDrawingController];
  -[PKShapeDrawingController resetStroke]((uint64_t)v4);

  [(PKPaintAreaView *)self _endAlternativeStrokeIfNecessaryAccepted:0];
  currentPaintSurfaceObject = self->_currentPaintSurfaceObject;
  self->_currentPaintSurfaceObject = 0;
  double v5 = currentPaintSurfaceObject;

  [(PKPaintAreaViewSurface *)v5 drawingCancelled];
}

- (void)drawingEstimatedPropertiesUpdated:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  if ([(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject isDrawing]
    || ([(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingController],
        (id v4 = (unsigned char *)objc_claimAutoreleasedReturnValue()) != 0)
    && (char v5 = v4[48], v4, (v5 & 1) != 0))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = v16;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v6);
          }
          double v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v10 preciseLocationInView:self];
          -[PKPaintAreaView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:");
          if ((*(void *)&v11 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
            && (*(void *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v10, 0, [(PKDrawingGestureRecognizer *)self->_drawingGestureRecognizer activeInputProperties], v11, v12);
            double v14 = [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingController];
            double v15 = -[PKController inputController](v14);
            v17[4] = v22;
            v17[5] = v23;
            v17[6] = v24;
            v17[7] = v25;
            v17[0] = v18;
            v17[1] = v19;
            v17[2] = v20;
            v17[3] = v21;
            [v15 drawingUpdatePoint:v17];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }
  }
}

- (id)shapeDrawingControllerRendererController:(id)a3
{
  uint64_t v3 = [(PKPaintAreaViewSurface *)self->_currentPaintSurfaceObject drawingController];
  id v4 = v3;
  if (v3) {
    uint64_t v3 = (void *)v3[8];
  }
  char v5 = v3;

  return v5;
}

- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4
{
  char v5 = [(PKPaintAreaView *)self shapeDrawingController];
  uint64_t v6 = [(PKPaintAreaView *)self shapeDrawingController];
  uint64_t v7 = (void *)v6;
  if (v6) {
    [(PKAveragePointGenerator *)*(void *)(v6 + 120) currentInputPoint];
  }
  else {
    memset(v16, 0, sizeof(v16));
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__PKPaintAreaView_shapeDrawingControllerShapeGestureDetected_isFastGesture___block_invoke;
  v15[3] = &unk_1E64C64B0;
  v15[4] = self;
  uint64_t v8 = -[PKShapeDrawingController detectedShapeWithInputScale:averageInputPoint:allowedShapeTypes:createCurrentStrokeBlock:]((uint64_t)v5, v16, 0, v15, 2.0);

  if (v8)
  {
    double v9 = CACurrentMediaTime();
    [(PKPaintAreaView *)self liveAnimationStartTime];
    if (v10 == 0.0) {
      [(PKPaintAreaView *)self setLiveAnimationStartTime:v9];
    }
    double v11 = [PKAlternativeStrokesAnimation alloc];
    double v12 = [v8 strokes];
    long long v13 = -[PKAlternativeStrokesAnimation initWithStrokes:shape:startTime:fadeDuration:]((id *)&v11->super.isa, v12, v8, v9, 0.15);
    [(PKPaintAreaView *)self setAlternativeStrokesAnimation:v13];

    double v14 = [(PKPaintAreaView *)self shapeDrawingController];
    -[PKShapeDrawingController setDetectedShape:]((uint64_t)v14, v8);
  }
}

id __76__PKPaintAreaView_shapeDrawingControllerShapeGestureDetected_isFastGesture___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _drawingController];
  double v2 = -[PKController inputController](v1);
  uint64_t v3 = (void *)[v2 newStrokeWithCurrentData];

  return v3;
}

- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3
{
  id v4 = [(PKPaintAreaView *)self shapeDrawingController];
  -[PKShapeDrawingController setDetectedShape:]((uint64_t)v4, 0);

  [(PKPaintAreaView *)self _endAlternativeStrokeIfNecessaryAccepted:0];
}

- (PKPaintAreaViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaintAreaViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)switchSurfacesDuringStrokes
{
  return self->_switchSurfacesDuringStrokes;
}

- (void)setSwitchSurfacesDuringStrokes:(BOOL)a3
{
  self->_switchSurfacesDuringStrokes = a3;
}

- (BOOL)fingerDrawingEnabled
{
  return self->_fingerDrawingEnabled;
}

- (void)setFingerDrawingEnabled:(BOOL)a3
{
  self->_fingerDrawingEnabled = a3;
}

- (BOOL)drawingDisabled
{
  return self->_drawingDisabled;
}

- (void)setDrawingDisabled:(BOOL)a3
{
  self->_drawingDisabled = a3;
}

- (PKTool)tool
{
  return self->_tool;
}

- (void)setTool:(id)a3
{
}

- (PKShapeDrawingController)shapeDrawingController
{
  return self->_shapeDrawingController;
}

- (void)setShapeDrawingController:(id)a3
{
}

- (PKAlternativeStrokesAnimation)alternativeStrokesAnimation
{
  return self->_alternativeStrokesAnimation;
}

- (void)setAlternativeStrokesAnimation:(id)a3
{
}

- (double)liveAnimationStartTime
{
  return self->_liveAnimationStartTime;
}

- (void)setLiveAnimationStartTime:(double)a3
{
  self->_liveAnimationStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternativeStrokesAnimation, 0);
  objc_storeStrong((id *)&self->_shapeDrawingController, 0);
  objc_storeStrong((id *)&self->_tool, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_liveSurfaces, 0);
  objc_storeStrong((id *)&self->_currentPaintSurfaceObject, 0);

  objc_storeStrong((id *)&self->_drawingGestureRecognizer, 0);
}

@end