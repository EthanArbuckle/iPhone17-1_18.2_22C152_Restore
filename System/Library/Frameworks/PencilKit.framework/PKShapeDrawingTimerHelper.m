@interface PKShapeDrawingTimerHelper
- (PKShapeDrawingTimerHelper)initWithDelegate:(id)a3;
- (id)shapeDrawingControllerRendererController:(id)a3;
- (void)addStrokePoint:(CGPoint)a3 inputPoint:(id *)a4;
- (void)beginStrokeAtPoint:(CGPoint)a3;
- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3;
- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4;
- (void)teardown;
@end

@implementation PKShapeDrawingTimerHelper

- (PKShapeDrawingTimerHelper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKShapeDrawingTimerHelper;
  v5 = [(PKShapeDrawingTimerHelper *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (PKShapeDrawingController *)-[PKShapeDrawingController initWithDelegate:]([PKShapeDrawingController alloc], v6);
    shapeDrawingController = v6->_shapeDrawingController;
    v6->_shapeDrawingController = v7;

    v9 = v6->_shapeDrawingController;
    if (v9) {
      v9->_shapeRecognitionOn = 1;
    }
  }

  return v6;
}

- (void)beginStrokeAtPoint:(CGPoint)a3
{
  [(PKShapeDrawingController *)(uint64_t)self->_shapeDrawingController beginStrokeAtPoint:a3.y];
  shapeDrawingController = self->_shapeDrawingController;
  if (shapeDrawingController)
  {
    -[PKShapeDrawingController _checkDetectedStroke]((uint64_t)shapeDrawingController);
    v5 = self->_shapeDrawingController;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;
  v7 = (void *)MEMORY[0x1E4F1CB00];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__PKShapeDrawingTimerHelper_beginStrokeAtPoint___block_invoke;
  v11[3] = &unk_1E64C98E8;
  v12 = v6;
  v8 = v6;
  v9 = [v7 scheduledTimerWithTimeInterval:1 repeats:v11 block:0.05];
  timer = self->_timer;
  self->_timer = v9;
}

void __48__PKShapeDrawingTimerHelper_beginStrokeAtPoint___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    -[PKShapeDrawingController _checkDetectedStroke](v1);
  }
}

- (void)addStrokePoint:(CGPoint)a3 inputPoint:(id *)a4
{
  shapeDrawingController = self->_shapeDrawingController;
  long long v6 = *(_OWORD *)&a4->var9;
  void v11[4] = *(_OWORD *)&a4->var7;
  v11[5] = v6;
  long long v7 = *(_OWORD *)&a4->var13;
  v11[6] = *(_OWORD *)&a4->var11;
  v11[7] = v7;
  long long v8 = *(_OWORD *)&a4->var1;
  v11[0] = a4->var0;
  v11[1] = v8;
  long long v9 = *(_OWORD *)&a4->var5;
  v11[2] = *(_OWORD *)&a4->var3;
  v11[3] = v9;
  [(PKShapeDrawingController *)(uint64_t)shapeDrawingController addStrokePoint:a3.x inputPoint:a3.y];
  v10 = self->_shapeDrawingController;
  if (v10)
  {
    -[PKShapeDrawingController _checkDetectedStroke]((uint64_t)v10);
  }
}

- (void)teardown
{
  [(NSTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;
}

- (id)shapeDrawingControllerRendererController:(id)a3
{
  return 0;
}

- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4
{
  v5 = [PKShape alloc];
  long long v6 = [(PKShape *)v5 initWithShapeType:8 strokes:MEMORY[0x1E4F1CBF0] originalStroke:0];
  -[PKShapeDrawingController setDetectedShape:]((uint64_t)self->_shapeDrawingController, v6);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shapeGestureDetectedOnShapeDrawingTimerHelper:self];
}

- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3
{
  -[PKShapeDrawingController setDetectedShape:]((uint64_t)self->_shapeDrawingController, 0);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained shapeGestureCancelledOnShapeDrawingTimerHelper:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_shapeDrawingController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end