@interface DKInkView
+ (BOOL)gpuAvailable;
+ (CGVector)normalizeVector:(CGVector)a3;
+ (double)windowBackingScaleFactor:(id)a3;
- (BOOL)_deviceSupportsGL;
- (BOOL)ak_forceAvailableForTouch:(id)a3;
- (BOOL)allowInput;
- (BOOL)canvasHasInk;
- (BOOL)isAddingPointWithoutSmoothing;
- (BOOL)isRenderingPaused;
- (BOOL)scaleDrawingToFitCanvas;
- (BOOL)trackingTouches;
- (CADisplayLink)displayLink;
- (CGPoint)_velocityForTouch:(id)a3;
- (CGPoint)strokeLastLocation;
- (CGPoint)strokeStartLocation;
- (CGRect)aggregateInvalid;
- (CGRect)inkBounds;
- (CGRect)unionDrawingRect;
- (DKDrawing)currentDrawing;
- (DKDrawingStroke)currentBrushStroke;
- (DKInkRenderer)renderer;
- (DKInkView)initWithCoder:(id)a3;
- (DKInkView)initWithFrame:(CGRect)a3;
- (DKInkViewRenderDelegate)renderPreviewDelegate;
- (DKPointSmoothing)inputFIFO;
- (NSMutableArray)cachedInterpolatedAnimationPoints;
- (NSMutableArray)cachedInterpolatedAnimationStrokes;
- (NSMutableArray)cachedInterpolatedBrushStrokes;
- (NSMutableArray)computedAnimationFrames;
- (NSMutableArray)currentInterpolatedBrushStroke;
- (NSUndoManager)strokeUndoManager;
- (UIColor)strokeColor;
- (__n128)_vector4ForTouchSettingWeightAndVelocity:(void *)a3 average:(uint64_t)a4;
- (__n128)lastVectorPoint;
- (double)currentWeight;
- (double)drawingScale;
- (double)interfaceScale;
- (double)maxPressure;
- (double)maxThickness;
- (double)minPressure;
- (double)minThickness;
- (double)strokeStartTime;
- (double)weightForTouch:(id)a3;
- (double)weightForValue:(double)a3;
- (id)snapshotRendererState;
- (int64_t)countOfCurrentStroke;
- (unint64_t)animationType;
- (unint64_t)mode;
- (unint64_t)renderPreviewMode;
- (unint64_t)totalPointsAdded;
- (void)_addUninterpolatedPoints:(DKInkView *)self controlPoint:(SEL)a2 count:flushing:;
- (void)_commonInit;
- (void)_computeAnimationFramesFittingInMaxDuration:(double)a3;
- (void)_display;
- (void)_notifyRenderDelegate;
- (void)_postTouchesBeganNotification:(CGPoint)a3;
- (void)_postTouchesEndedNotification:(CGPoint)a3;
- (void)_renderEmittedPoints:(DKInkView *)self count:(SEL)a2;
- (void)_replayAnimationTick:(id)a3;
- (void)_setDrawingOnRenderer:(id)a3;
- (void)_setDrawingOnRendererWithBleedAnimation:(id)a3;
- (void)_setDrawingOnRendererWithReplayAnimation:(id)a3;
- (void)_startDisplayLink;
- (void)_stopDisplayLink;
- (void)_undoLastStroke:(id)a3;
- (void)_updateVelocityWithTouch:(id)a3 average:(BOOL)a4;
- (void)clear;
- (void)continueStroke:(DKInkView *)self;
- (void)continueStrokeWithoutSmoothing:(DKInkView *)self;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)handleCoalescedTouches:(id)a3 forTouch:(id)a4 average:(BOOL)a5;
- (void)inkDidCompleteRender:(id)a3;
- (void)inkDidRender:(id)a3;
- (void)layoutSubviews;
- (void)pauseRendering;
- (void)resumeRendering;
- (void)setAggregateInvalid:(CGRect)a3;
- (void)setAllowInput:(BOOL)a3;
- (void)setAnimationType:(unint64_t)a3;
- (void)setCachedInterpolatedAnimationPoints:(id)a3;
- (void)setCachedInterpolatedAnimationStrokes:(id)a3;
- (void)setCachedInterpolatedBrushStrokes:(id)a3;
- (void)setComputedAnimationFrames:(id)a3;
- (void)setCurrentBrushStroke:(id)a3;
- (void)setCurrentDrawing:(id)a3;
- (void)setCurrentDrawing:(id)a3 scaleDrawingToFitBounds:(BOOL)a4 withAnimationType:(unint64_t)a5 animationCompletionHandler:(id)a6;
- (void)setCurrentInterpolatedBrushStroke:(id)a3;
- (void)setCurrentWeight:(double)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDrawingScale:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInputFIFO:(id)a3;
- (void)setIsAddingPointWithoutSmoothing:(BOOL)a3;
- (void)setLastVectorPoint:(DKInkView *)self;
- (void)setMaxPressure:(double)a3;
- (void)setMaxThickness:(double)a3;
- (void)setMinPressure:(double)a3;
- (void)setMinThickness:(double)a3;
- (void)setMode:(unint64_t)a3;
- (void)setRenderPreviewDelegate:(id)a3;
- (void)setRenderPreviewMode:(unint64_t)a3;
- (void)setRenderer:(id)a3;
- (void)setScaleDrawingToFitCanvas:(BOOL)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeLastLocation:(CGPoint)a3;
- (void)setStrokeStartLocation:(CGPoint)a3;
- (void)setStrokeStartTime:(double)a3;
- (void)setStrokeUndoManager:(id)a3;
- (void)setTotalPointsAdded:(unint64_t)a3;
- (void)setUnionDrawingRect:(CGRect)a3;
- (void)setupRenderer;
- (void)startStroke:(DKInkView *)self;
- (void)teardown;
- (void)terminateStroke;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)undoLastStroke;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation DKInkView

+ (BOOL)gpuAvailable
{
  return +[DKGLUtilities gpuAvailable];
}

- (DKInkView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DKInkView;
  v3 = -[DKInkView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(DKInkView *)v3 _commonInit];
  }
  return v4;
}

- (DKInkView)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DKInkView;
  v5 = [(DKInkView *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5) {
    [(DKInkView *)v5 _commonInit];
  }

  return v6;
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_renderPreviewDelegate, 0);
  [(DKInkRenderer *)self->_renderer setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)DKInkView;
  [(DKInkView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)DKInkView;
  [(DKInkView *)&v27 layoutSubviews];
  if (!self->_isRenderingPaused)
  {
    strokeColor = self->_strokeColor;
    id v4 = [(DKInkView *)self renderer];
    [v4 setInkColor:strokeColor];

    if (!self->_scaleDrawingToFitCanvas
      || !self->_currentDrawing
      || ([(DKInkView *)self bounds], (CGRectIsUnrepresentable(v5, v6, v7, v8) & 1) != 0)
      || ([(DKDrawing *)self->_currentDrawing canvasBounds],
          (CGRectIsUnrepresentable(v9, v10, v11, v12) & 1) != 0)
      || ([(DKDrawing *)self->_currentDrawing strokesFrame],
          (CGRectIsUnrepresentable(v13, v14, v15, v16) & 1) != 0))
    {
      if (([(DKInkRenderer *)self->_renderer initialized] & 1) == 0) {
        [(DKInkRenderer *)self->_renderer setNeedsLayout];
      }
      [(DKInkView *)self bounds];
      renderer = self->_renderer;
    }
    else
    {
      [(DKDrawing *)self->_currentDrawing canvasBounds];
      -[DKInkRenderer setFrame:](self->_renderer, "setFrame:");
      [(DKInkView *)self bounds];
      if (CGRectGetWidth(v28) <= 0.0) {
        goto LABEL_11;
      }
      [(DKInkView *)self bounds];
      if (CGRectGetHeight(v29) <= 0.0) {
        goto LABEL_11;
      }
      [(DKDrawing *)self->_currentDrawing strokesFrame];
      double v19 = v18;
      double v21 = v20;
      [(DKInkView *)self bounds];
      double v24 = v23 / v19;
      memset(&v26.c, 0, 32);
      if (v23 / v19 >= v22 / v21) {
        double v24 = v22 / v21;
      }
      *(_OWORD *)&v26.a = 0uLL;
      CGAffineTransformMakeScale(&v26, v24, v24);
      CGAffineTransform v25 = v26;
      [(DKInkRenderer *)self->_renderer setTransform:&v25];
      [(DKInkRenderer *)self->_renderer frame];
      renderer = self->_renderer;
    }
    -[DKInkRenderer setFrame:](renderer, "setFrame:");
LABEL_11:
    [(DKInkView *)self _startDisplayLink];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DKInkView;
  [(DKInkView *)&v5 willMoveToSuperview:v4];
  if (!v4) {
    [(DKInkView *)self _stopDisplayLink];
  }
}

- (void)didMoveToSuperview
{
  v7.receiver = self;
  v7.super_class = (Class)DKInkView;
  [(DKInkView *)&v7 didMoveToSuperview];
  uint64_t v3 = [(DKInkView *)self superview];
  if (v3)
  {
    id v4 = (void *)v3;
    objc_super v5 = [(DKInkView *)self window];
    if (v5)
    {
      int v6 = [(DKInkRenderer *)self->_renderer initialized];

      if (v6) {
        [(DKInkView *)self _startDisplayLink];
      }
    }
    else
    {
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DKInkView;
  [(DKInkView *)&v5 willMoveToWindow:v4];
  if (!v4) {
    [(DKInkView *)self _stopDisplayLink];
  }
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)DKInkView;
  [(DKInkView *)&v6 didMoveToWindow];
  uint64_t v3 = [(DKInkView *)self superview];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = [(DKInkRenderer *)self->_renderer initialized];

    if (v5) {
      [(DKInkView *)self _startDisplayLink];
    }
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DKInkView;
  -[DKInkView setHidden:](&v6, sel_setHidden_);
  [(CADisplayLink *)self->_displayLink setPaused:v3];
  int v5 = [(DKInkView *)self renderer];
  [v5 setHidden:v3];
}

- (void)setupRenderer
{
  BOOL v3 = [(DKInkView *)self renderer];

  if (v3)
  {
    id v4 = [(DKInkView *)self renderer];
    [v4 removeFromSuperview];

    int v5 = [(DKInkView *)self renderer];
    [v5 setDelegate:0];

    [(DKInkView *)self setRenderer:0];
  }
  if ([(DKInkView *)self _deviceSupportsGL]
    && +[DKGLUtilities gpuAvailable])
  {
    objc_super v6 = [DKInkRendererGL alloc];
    [(DKInkView *)self bounds];
    objc_super v7 = -[DKInkRendererGL initWithFrame:](v6, "initWithFrame:");
    [(DKInkView *)self setRenderer:v7];
  }
  else
  {
    CGFloat v8 = [DKInkRendererCG alloc];
    [(DKInkView *)self bounds];
    objc_super v7 = -[DKInkRendererCG initWithFrame:](v8, "initWithFrame:");
    [(DKInkView *)self setRenderer:v7];
  }

  CGFloat v9 = [MEMORY[0x263F1C550] systemBackgroundColor];
  CGFloat v10 = [(DKInkView *)self renderer];
  [v10 setBackgroundColor:v9];

  [(DKInkView *)self setMode:0];
  [(DKInkView *)self setScaleDrawingToFitCanvas:0];
  [(DKInkView *)self setAllowInput:1];
  CGFloat v11 = [(DKInkView *)self renderer];
  [v11 setDelegate:self];

  CGFloat v12 = [(DKInkView *)self renderer];
  CGFloat v13 = [(DKInkView *)self strokeColor];
  [v12 setInkColor:v13];

  CGFloat v14 = [(DKInkView *)self renderer];
  [(DKInkView *)self addSubview:v14];

  [(DKInkView *)self layoutIfNeeded];
}

- (BOOL)_deviceSupportsGL
{
  v2 = [MEMORY[0x263F1C5C0] currentDevice];
  char v3 = objc_msgSend(v2, "dk_deviceSupportsGL");

  return v3;
}

- (void)_commonInit
{
  [(DKInkView *)self setExclusiveTouch:1];
  [(DKInkView *)self setDrawingScale:1.0];
  [(DKInkView *)self setupRenderer];
  char v3 = [MEMORY[0x263F1C550] blackColor];
  [(DKInkView *)self setStrokeColor:v3];

  [(DKInkView *)self setCurrentWeight:2.0];
  [(DKInkView *)self setRenderPreviewMode:0];
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_unionDrawingRect.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_unionDrawingRect.size = v4;
  int v5 = objc_alloc_init(DKDrawing);
  [(DKInkView *)self setCurrentDrawing:v5];

  id v6 = objc_alloc_init(MEMORY[0x263F08C50]);
  [(DKInkView *)self setStrokeUndoManager:v6];

  [(DKInkView *)self setMinPressure:0.0];
  [(DKInkView *)self setMaxPressure:0.2];
  [(DKInkView *)self setMinThickness:0.2];
  [(DKInkView *)self setMaxThickness:3.0];
  objc_super v7 = [DKPointSmoothing alloc];
  LODWORD(v8) = 1068149978;
  CGFloat v9 = [(DKPointSmoothing *)v7 initWithWidth:3 spacing:v8];
  inputFIFO = self->_inputFIFO;
  self->_inputFIFO = v9;

  [(DKPointSmoothing *)self->_inputFIFO setEmitInterpolatedPoints:0];
  LODWORD(v11) = 1059761370;
  [(DKPointSmoothing *)self->_inputFIFO setUnitScale:v11];
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __24__DKInkView__commonInit__block_invoke;
  v12[3] = &unk_2648857B0;
  objc_copyWeak(&v13, &location);
  [(DKPointSmoothing *)self->_inputFIFO setEmissionHandler:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __24__DKInkView__commonInit__block_invoke(uint64_t a1, long long *a2, uint64_t a3, long long *a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CGFloat v10 = WeakRetained;
  if (a3)
  {
    long long v11 = *a2;
    long long v12 = *a2;
    long long v19 = *a2;
    if (a3 != 1)
    {
      long long v11 = *a2;
      long long v12 = *a2;
      if (a4)
      {
        long long v12 = *a4;
        long long v11 = a2[1];
      }
    }
    objc_msgSend(WeakRetained, "_addUninterpolatedPoints:controlPoint:count:flushing:", a2, a4, a3, a5, v11, v12);
    id v13 = [v10 inputFIFO];
    [v13 unitScale];
    int v15 = v14;

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __24__DKInkView__commonInit__block_invoke_2;
    v20[3] = &unk_264885788;
    id v21 = v10;
    LODWORD(v16) = v15;
    +[DKPointSmoothing _interpolateFromPoint:v20 toPoint:*(double *)&v19 withControlPoint:v17 atUnitScale:v18 emissionHandler:v16];
  }
}

uint64_t __24__DKInkView__commonInit__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _renderEmittedPoints:a2 count:a3];
}

- (void)_addUninterpolatedPoints:(DKInkView *)self controlPoint:(SEL)a2 count:flushing:
{
  int v6 = v5;
  uint64_t v7 = v4;
  double v8 = v3;
  CGFloat v9 = v2;
  id v20 = [(DKDrawingStroke *)self->_currentBrushStroke strokePoints];
  if (v7)
  {
    if (v7 == 1)
    {
      long long v10 = *v9;
      long long v17 = *v9;
      if (v8) {
        long long v10 = *v8;
      }
      long long v15 = v10;
      long long v11 = objc_opt_new();
      [v11 setLocation:vcvtq_f64_f32(*(float32x2_t *)&v17)];
      [v11 setForce:*((float *)&v17 + 3)];
      [v11 setVelocity:*((float *)&v17 + 2)];
      long long v12 = objc_opt_new();
      [v12 setLocation:vcvtq_f64_f32(*(float32x2_t *)&v15)];
      [v12 setForce:*((float *)&v15 + 3)];
      [v12 setVelocity:*((float *)&v15 + 2)];
    }
    else
    {
      long long v13 = *v9;
      long long v18 = *v9;
      if (v8) {
        long long v13 = *v8;
      }
      long long v16 = v13;
      long long v11 = objc_opt_new();
      [v11 setLocation:vcvtq_f64_f32(*(float32x2_t *)&v18)];
      [v11 setForce:*((float *)&v18 + 3)];
      [v11 setVelocity:*((float *)&v18 + 2)];
      long long v12 = objc_opt_new();
      [v12 setLocation:vcvtq_f64_f32(*(float32x2_t *)&v16)];
      [v12 setForce:*((float *)&v16 + 3)];
      [v12 setVelocity:*((float *)&v16 + 2)];
      [v20 addObject:v11];
      [v20 addObject:v12];
      if (v6)
      {
        long long v19 = *v9;
        int v14 = objc_opt_new();
        [v14 setLocation:vcvtq_f64_f32(*(float32x2_t *)&v19)];
        [v14 setForce:*((float *)&v19 + 3)];
        [v14 setVelocity:*((float *)&v19 + 2)];
        [v20 addObject:v14];
      }
    }
  }
}

- (void)_renderEmittedPoints:(DKInkView *)self count:(SEL)a2
{
  uint64_t v4 = v3;
  int v5 = v2;
  long long v30 = *(_OWORD *)&self->_lastVectorPoint[16];
  long long v31 = *(_OWORD *)self->_lastVectorPoint;
  CGFloat v7 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v33 = *(double *)(MEMORY[0x263F001A0] + 24);
  CGFloat v34 = *MEMORY[0x263F001A0];
  p_currentInterpolatedBrushStroke = &self->_currentInterpolatedBrushStroke;
  long long v10 = self->_currentInterpolatedBrushStroke;
  [(DKInkView *)self interfaceScale];
  if (v4)
  {
    float v12 = v11;
    float v13 = 1.0;
    uint64_t v14 = v4;
    while (1)
    {
      float32x4_t v15 = *v5;
      LODWORD(v16) = HIDWORD(*(unsigned long long *)v5);
      double v17 = (float)(vmuls_lane_f32(v16 + v13, *v5, 2) * v12);
      if (v17 > 0.00001) {
        break;
      }
LABEL_14:
      ++v5;
      if (!--v14) {
        goto LABEL_15;
      }
    }
    double v18 = v16;
    float v19 = v15.f32[2] / 3.0;
    if (v15.f32[2] >= 3.0) {
      float v19 = v13;
    }
    float64x2_t v32 = vcvtq_f64_f32(*(float32x2_t *)v15.f32);
    float64x2_t v39 = v32;
    double v20 = v19;
    double v40 = v17;
    double v41 = v19;
    double v42 = v18;
    id v21 = objc_msgSend(MEMORY[0x263F08D40], "dk_valueWithRenderPoint:", &v39, v30, v31);
    unint64_t animationType = self->_animationType;
    p_cachedInterpolatedAnimationPoints = p_currentInterpolatedBrushStroke;
    if (animationType != 1)
    {
      if (animationType != 2)
      {
        renderer = self->_renderer;
        float64x2_t v35 = v32;
        double v36 = v17;
        double v37 = v20;
        double v38 = v18;
        [(DKInkRenderer *)renderer addPoint:&v35];
        goto LABEL_11;
      }
      p_cachedInterpolatedAnimationPoints = &self->_cachedInterpolatedAnimationPoints;
    }
    [(NSMutableArray *)*p_cachedInterpolatedAnimationPoints addObject:v21];
LABEL_11:
    [(NSMutableArray *)v10 addObject:v21];
    v43.origin.CGFloat x = v32.f64[0] - v17 * 0.5;
    v43.origin.CGFloat y = v32.f64[1] - v17 * 0.5;
    v43.size.CGFloat width = v17;
    v43.size.CGFloat height = v17;
    CGRect v44 = CGRectInset(v43, -5.0, -5.0);
    NSRect v45 = NSIntegralRectWithOptions(v44, 0xF00uLL);
    CGFloat x = v45.origin.x;
    CGFloat y = v45.origin.y;
    CGFloat width = v45.size.width;
    CGFloat height = v45.size.height;
    v45.size.CGFloat height = v33;
    v45.origin.CGFloat x = v34;
    v45.origin.CGFloat y = v7;
    v45.size.CGFloat width = v8;
    if (!CGRectIsNull(v45))
    {
      v46.size.CGFloat height = v33;
      v46.origin.CGFloat x = v34;
      v46.origin.CGFloat y = v7;
      v46.size.CGFloat width = v8;
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = width;
      v51.size.CGFloat height = height;
      CGRect v47 = CGRectUnion(v46, v51);
      CGFloat x = v47.origin.x;
      CGFloat y = v47.origin.y;
      CGFloat width = v47.size.width;
      CGFloat height = v47.size.height;
    }

    CGFloat v33 = height;
    CGFloat v34 = x;
    CGFloat v7 = y;
    CGFloat v8 = width;
    float v13 = 1.0;
    goto LABEL_14;
  }
LABEL_15:
  self->_totalPointsAdded += v4;
  *(_OWORD *)self->_lastVectorPoint = v31;
  *(_OWORD *)&self->_lastVectorPoint[16] = v30;
  v48.size.CGFloat height = v33;
  v48.origin.CGFloat x = v34;
  v48.origin.CGFloat y = v7;
  v48.size.CGFloat width = v8;
  if (!CGRectIsNull(v48))
  {
    p_unionDrawingRect = &self->_unionDrawingRect;
    if (!CGRectIsNull(self->_unionDrawingRect))
    {
      v49.origin.CGFloat x = p_unionDrawingRect->origin.x;
      v49.origin.CGFloat y = self->_unionDrawingRect.origin.y;
      v49.size.CGFloat width = self->_unionDrawingRect.size.width;
      v49.size.CGFloat height = self->_unionDrawingRect.size.height;
      v52.size.CGFloat height = v33;
      v52.origin.CGFloat x = v34;
      v52.origin.CGFloat y = v7;
      v52.size.CGFloat width = v8;
      CGRect v50 = CGRectUnion(v49, v52);
      CGFloat v33 = v50.size.height;
      CGFloat v34 = v50.origin.x;
      CGFloat v7 = v50.origin.y;
      CGFloat v8 = v50.size.width;
    }
    p_unionDrawingRect->origin.CGFloat x = v34;
    self->_unionDrawingRect.origin.CGFloat y = v7;
    self->_unionDrawingRect.size.CGFloat width = v8;
    self->_unionDrawingRect.size.CGFloat height = v33;
    -[DKDrawing setStrokesFrame:](self->_currentDrawing, "setStrokesFrame:", v30, v31);
  }
}

- (void)teardown
{
  id animationCompletionHandler = self->_animationCompletionHandler;
  self->_id animationCompletionHandler = 0;

  uint64_t v4 = [(DKInkView *)self inputFIFO];
  [v4 setEmissionHandler:0];

  [(DKInkView *)self setInputFIFO:0];
  objc_storeWeak((id *)&self->_renderPreviewDelegate, 0);
  [(DKInkView *)self _stopDisplayLink];
  int v5 = [(DKInkView *)self renderer];
  [v5 teardown];

  int v6 = [(DKInkView *)self renderer];
  [v6 setDelegate:0];

  [(DKInkView *)self setRenderer:0];
}

- (void)pauseRendering
{
  self->_isRenderingPaused = 1;
  [(CADisplayLink *)self->_displayLink setPaused:1];
  if (+[DKGLUtilities gpuAvailable])
  {
    renderer = self->_renderer;
    [(DKInkRenderer *)renderer flush];
  }
}

- (void)resumeRendering
{
  self->_isRenderingPaused = 0;
  [(CADisplayLink *)self->_displayLink setPaused:0];
  [(DKInkView *)self setNeedsLayout];
}

- (void)setCurrentDrawing:(id)a3 scaleDrawingToFitBounds:(BOOL)a4 withAnimationType:(unint64_t)a5 animationCompletionHandler:(id)a6
{
  BOOL v8 = a4;
  CGFloat v33 = (DKDrawing *)a3;
  id v10 = a6;
  int v11 = [(DKInkRenderer *)self->_renderer supportsBleedAnimation];
  if (a5 == 2) {
    int v12 = v11;
  }
  else {
    int v12 = 1;
  }
  if (!v12) {
    a5 = 0;
  }
  id animationCompletionHandler = self->_animationCompletionHandler;
  self->_id animationCompletionHandler = 0;

  if (a5)
  {
    uint64_t v14 = (void *)MEMORY[0x230F37A40](v10);
    id v15 = self->_animationCompletionHandler;
    self->_id animationCompletionHandler = v14;
  }
  [(DKInkView *)self setAnimationType:a5];
  [(DKInkView *)self setScaleDrawingToFitCanvas:v8];
  if (self->_currentDrawing != v33)
  {
    [(DKInkView *)self clear];
    if (v8)
    {
      [(DKInkView *)self bounds];
      double v17 = v16;
      [(DKDrawing *)v33 strokesFrame];
      double v19 = v18;
      [(DKInkView *)self bounds];
      double v21 = v20;
      [(DKDrawing *)v33 strokesFrame];
      if (v17 / v19 >= v21 / v22) {
        double v23 = v21 / v22;
      }
      else {
        double v23 = v17 / v19;
      }
      [(DKInkView *)self bounds];
      id v24 = +[DKDrawing copyOfDrawing:toFitInBounds:](DKDrawing, "copyOfDrawing:toFitInBounds:", v33);

      [(DKInkView *)self setDrawingScale:v23];
      CGAffineTransform v25 = (DKDrawing *)v24;
      CGFloat v33 = v25;
    }
    else
    {
      [(DKInkView *)self setDrawingScale:1.0];
      CGAffineTransform v25 = (DKDrawing *)[(DKDrawing *)v33 copy];
    }
    currentDrawing = self->_currentDrawing;
    self->_currentDrawing = v25;

    if (!self->_cachedInterpolatedBrushStrokes)
    {
      objc_super v27 = [MEMORY[0x263EFF980] array];
      cachedInterpolatedBrushStrokes = self->_cachedInterpolatedBrushStrokes;
      self->_cachedInterpolatedBrushStrokes = v27;
    }
    if (!self->_cachedInterpolatedAnimationPoints)
    {
      CGRect v29 = [MEMORY[0x263EFF980] array];
      cachedInterpolatedAnimationPoints = self->_cachedInterpolatedAnimationPoints;
      self->_cachedInterpolatedAnimationPoints = v29;
    }
    if (!self->_cachedInterpolatedAnimationStrokes)
    {
      long long v31 = [MEMORY[0x263EFF980] array];
      cachedInterpolatedAnimationStrokes = self->_cachedInterpolatedAnimationStrokes;
      self->_cachedInterpolatedAnimationStrokes = v31;
    }
    if (a5 == 2)
    {
      [(DKInkView *)self _setDrawingOnRendererWithBleedAnimation:self->_currentDrawing];
    }
    else if (a5 == 1)
    {
      [(DKInkView *)self _setDrawingOnRendererWithReplayAnimation:self->_currentDrawing];
    }
    else
    {
      [(DKInkView *)self _setDrawingOnRenderer:self->_currentDrawing];
    }
  }
}

- (void)setCurrentDrawing:(id)a3
{
}

- (DKDrawing)currentDrawing
{
  return self->_currentDrawing;
}

- (void)setRenderer:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_renderer, a3);
  [(DKInkRenderer *)self->_renderer setDrawingScale:self->_drawingScale];
  [(DKInkRenderer *)self->_renderer setMode:self->_mode];
  [(DKInkRenderer *)self->_renderer setScaleDrawingToFitCanvas:self->_scaleDrawingToFitCanvas];
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
  -[DKInkRenderer setMode:](self->_renderer, "setMode:");
}

- (void)setScaleDrawingToFitCanvas:(BOOL)a3
{
  self->_scaleDrawingToFitCanvas = a3;
  -[DKInkRenderer setScaleDrawingToFitCanvas:](self->_renderer, "setScaleDrawingToFitCanvas:");
}

- (void)setDrawingScale:(double)a3
{
  self->_double drawingScale = a3;
  -[DKInkRenderer setDrawingScale:](self->_renderer, "setDrawingScale:");
  double drawingScale = self->_drawingScale;
  inputFIFO = self->_inputFIFO;
  LODWORD(drawingScale) = dword_22AF74710[drawingScale < 1.0];
  [(DKPointSmoothing *)inputFIFO setUnitScale:drawingScale];
}

- (id)snapshotRendererState
{
  return (id)[(DKInkRenderer *)self->_renderer snapshotImage];
}

- (CGRect)inkBounds
{
  currentDrawing = self->_currentDrawing;
  if (currentDrawing)
  {
    [(DKDrawing *)currentDrawing strokesFrame];
  }
  else
  {
    double v3 = *MEMORY[0x263F001A8];
    double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (void)_notifyRenderDelegate
{
  id v4 = [(DKInkView *)self renderPreviewDelegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v5 = [(DKInkView *)self renderPreviewDelegate];
    [v5 performSelector:sel_inkViewDidRender_ withObject:self afterDelay:0.0];
  }
}

- (void)_postTouchesBeganNotification:(CGPoint)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  id v5 = (void *)MEMORY[0x263F089F8];
  uint64_t v6 = DKInkViewTouchesBeganNotification;
  uint64_t v10 = DKInkViewTouchesEndedLocationInViewUserInfoKey;
  v11[0] = DictionaryRepresentation;
  CGFloat v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v8 = [v5 notificationWithName:v6 object:self userInfo:v7];

  CGFloat v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotification:v8];
}

- (void)_postTouchesEndedNotification:(CGPoint)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  CFDictionaryRef DictionaryRepresentation = CGPointCreateDictionaryRepresentation(a3);
  id v5 = (void *)MEMORY[0x263F089F8];
  uint64_t v6 = DKInkViewTouchesEndedNotification;
  uint64_t v10 = DKInkViewTouchesEndedLocationInViewUserInfoKey;
  v11[0] = DictionaryRepresentation;
  CGFloat v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  BOOL v8 = [v5 notificationWithName:v6 object:self userInfo:v7];

  CGFloat v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotification:v8];
}

+ (double)windowBackingScaleFactor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 screen];

  if (v4) {
    [v3 screen];
  }
  else {
  id v5 = [MEMORY[0x263F1C920] mainScreen];
  }
  [v5 scale];
  double v7 = v6;

  return v7;
}

- (double)interfaceScale
{
  return 2.0;
}

- (void)setStrokeColor:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_strokeColor, a3);
  id v5 = [(DKInkView *)self renderer];
  [v5 setInkColor:v6];
}

- (void)clear
{
  id v3 = [(DKInkView *)self renderer];
  [v3 completeAnimationsImmediately];

  id v4 = [(DKInkView *)self renderer];
  [v4 resetRendererState];

  id v5 = [(DKInkView *)self renderer];
  [v5 clear];

  [(DKPointSmoothing *)self->_inputFIFO clear];
  CGSize v6 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_unionDrawingRect.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_unionDrawingRect.size = v6;
  [(NSMutableArray *)self->_cachedInterpolatedBrushStrokes removeAllObjects];
  [(NSMutableArray *)self->_cachedInterpolatedAnimationPoints removeAllObjects];
  [(NSMutableArray *)self->_cachedInterpolatedAnimationStrokes removeAllObjects];
  [(NSMutableArray *)self->_computedAnimationFrames removeAllObjects];
  double v7 = [(DKInkView *)self currentDrawing];
  [v7 reset];

  BOOL v8 = [(DKInkView *)self strokeUndoManager];
  [v8 removeAllActions];

  memset(v9, 0, sizeof(v9));
  [(DKInkView *)self setLastVectorPoint:v9];
  [(DKInkView *)self bounds];
  -[DKInkView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
  [(DKInkView *)self _notifyRenderDelegate];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(DKInkView *)self frame];
  double v9 = v8;
  double v11 = v10;
  v16.receiver = self;
  v16.super_class = (Class)DKInkView;
  -[DKInkView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (width != v9 || height != v11)
  {
    if (self->_scaleDrawingToFitCanvas)
    {
      currentDrawing = self->_currentDrawing;
      self->_currentDrawing = 0;
      uint64_t v14 = currentDrawing;

      [(DKInkView *)self setCurrentDrawing:v14];
    }
    id v15 = [(DKInkView *)self renderer];
    [(DKInkView *)self bounds];
    objc_msgSend(v15, "setNeedsDisplayInRect:");
  }
}

- (int64_t)countOfCurrentStroke
{
  v2 = [(DKDrawingStroke *)self->_currentBrushStroke strokePoints];
  int64_t v3 = [v2 count];

  return v3;
}

- (BOOL)canvasHasInk
{
  int64_t v3 = [(DKInkView *)self currentDrawing];
  uint64_t v4 = [v3 totalPoints];
  id v5 = [(DKDrawingStroke *)self->_currentBrushStroke strokePoints];
  uint64_t v6 = [v5 count] + v4;

  return v6 > 0;
}

- (void)_startDisplayLink
{
  if (!self->_displayLink)
  {
    int64_t v3 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel__display];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:60];
    id v5 = self->_displayLink;
    uint64_t v6 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x263EFF478]];

    uint64_t v7 = [(DKInkView *)self isHidden];
    double v8 = self->_displayLink;
    [(CADisplayLink *)v8 setPaused:v7];
  }
}

- (void)_stopDisplayLink
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;
}

- (void)_display
{
  if (+[DKInkView gpuAvailable])
  {
    if ([(NSMutableArray *)self->_computedAnimationFrames count]) {
      [(DKInkView *)self _replayAnimationTick:self];
    }
    id v3 = [(DKInkView *)self renderer];
    [v3 display];
  }
  else
  {
    id v3 = [(DKInkView *)self renderer];
    [(DKInkView *)self bounds];
    objc_msgSend(v3, "setNeedsDisplayInRect:");
  }
}

- (void)_setDrawingOnRenderer:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  char v58 = 0;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v39 = a3;
  uint64_t v4 = [v39 strokes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v51 objects:v59 count:16];
  if (v5)
  {
    uint64_t v41 = *(void *)v52;
    double v40 = v4;
    do
    {
      uint64_t v42 = v5;
      for (uint64_t i = 0; i != v42; ++i)
      {
        if (*(void *)v52 != v41) {
          objc_enumerationMutation(v4);
        }
        uint64_t v7 = [*(id *)(*((void *)&v51 + 1) + 8 * i) strokePoints];
        if ((unint64_t)[v7 count] >= 3)
        {
          double v8 = [MEMORY[0x263EFF980] array];
          currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
          self->_currentInterpolatedBrushStroke = v8;

          unint64_t v10 = 0;
          *(_OWORD *)self->_lastVectorPoint = 0u;
          *(_OWORD *)&self->_lastVectorPoint[16] = 0u;
          while (v10 < [v7 count] - 2)
          {
            double v11 = [v7 objectAtIndexedSubscript:v10];
            unint64_t v12 = v10 + 1;
            float v13 = [v7 objectAtIndexedSubscript:v10 + 1];
            v10 += 2;
            uint64_t v14 = [v7 objectAtIndexedSubscript:v12 + 1];
            [v11 location];
            double v16 = v15;
            [v11 location];
            double v18 = v17;
            [v11 velocity];
            [v11 force];
            [v13 location];
            double v20 = v19;
            [v13 location];
            double v22 = v21;
            [v13 velocity];
            [v13 force];
            [v14 location];
            float64_t v47 = v23;
            [v14 location];
            float64_t v46 = v24;
            [v14 velocity];
            float64_t v45 = v25;
            [v14 force];
            float64_t v44 = v26;
            objc_initWeak(&location, self);
            [(DKPointSmoothing *)self->_inputFIFO unitScale];
            unsigned int v43 = v27;
            v48[0] = MEMORY[0x263EF8330];
            v48[1] = 3221225472;
            v48[2] = __35__DKInkView__setDrawingOnRenderer___block_invoke;
            v48[3] = &unk_2648857D8;
            objc_copyWeak(&v49, &location);
            *(float *)&double v28 = v16;
            float v29 = v18;
            *((float *)&v28 + 1) = v29;
            *(float *)&double v30 = v20;
            float v31 = v22;
            *((float *)&v30 + 1) = v31;
            v32.f64[0] = v45;
            v32.f64[1] = v44;
            v33.f64[0] = v47;
            v33.f64[1] = v46;
            v48[4] = &v55;
            +[DKPointSmoothing _interpolateFromPoint:v48 toPoint:v28 withControlPoint:*(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v33), v32).i64 atUnitScale:v30 emissionHandler:COERCE_DOUBLE(__PAIR64__(HIDWORD(v46), v43))];
            objc_destroyWeak(&v49);
            objc_destroyWeak(&location);
          }
          [(NSMutableArray *)self->_cachedInterpolatedBrushStrokes addObject:self->_currentInterpolatedBrushStroke];
          CGFloat v34 = self->_currentInterpolatedBrushStroke;
          self->_currentInterpolatedBrushStroke = 0;
        }
        uint64_t v4 = v40;
      }
      uint64_t v5 = [v40 countByEnumeratingWithState:&v51 objects:v59 count:16];
    }
    while (v5);
  }

  if (*((unsigned char *)v56 + 24))
  {
    float64x2_t v35 = [(DKInkView *)self renderer];
    [v35 endStroke];
  }
  double v36 = [v39 strokes];
  BOOL v37 = [v36 count] == 0;

  if (!v37)
  {
    double v38 = [(DKInkView *)self renderer];
    [v38 force];
  }
  _Block_object_dispose(&v55, 8);
}

void __35__DKInkView__setDrawingOnRenderer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    if (!*(unsigned char *)(v7 + 24))
    {
      *(unsigned char *)(v7 + 24) = 1;
      double v8 = [WeakRetained renderer];
      [v8 beginStroke];

      id WeakRetained = v9;
    }
  }
  [WeakRetained _renderEmittedPoints:a2 count:a3];
}

- (void)_setDrawingOnRendererWithBleedAnimation:(id)a3
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v56 = a3;
  if ([(DKInkRenderer *)self->_renderer supportsBleedAnimation])
  {
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    obuint64_t j = [v56 strokes];
    uint64_t v4 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
    if (v4)
    {
      uint64_t v58 = *(void *)v83;
      do
      {
        uint64_t v59 = v4;
        for (uint64_t i = 0; i != v59; ++i)
        {
          if (*(void *)v83 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = [*(id *)(*((void *)&v82 + 1) + 8 * i) strokePoints];
          if ((unint64_t)[v6 count] >= 3)
          {
            uint64_t v7 = [MEMORY[0x263EFF980] array];
            currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
            self->_currentInterpolatedBrushStroke = v7;

            unint64_t v9 = 0;
            *(_OWORD *)self->_lastVectorPoint = 0u;
            *(_OWORD *)&self->_lastVectorPoint[16] = 0u;
            while (v9 < [v6 count] - 2)
            {
              unint64_t v10 = [v6 objectAtIndexedSubscript:v9];
              unint64_t v11 = v9 + 1;
              unint64_t v12 = [v6 objectAtIndexedSubscript:v9 + 1];
              v9 += 2;
              float v13 = [v6 objectAtIndexedSubscript:v11 + 1];
              [v10 location];
              double v15 = v14;
              [v10 location];
              double v17 = v16;
              [v10 velocity];
              [v10 force];
              [v12 location];
              double v19 = v18;
              [v12 location];
              double v21 = v20;
              [v12 velocity];
              [v12 force];
              [v13 location];
              float64_t v64 = v22;
              [v13 location];
              float64_t v63 = v23;
              [v13 velocity];
              float64_t v62 = v24;
              [v13 force];
              float64_t v61 = v25;
              objc_initWeak(location, self);
              [(DKPointSmoothing *)self->_inputFIFO unitScale];
              unsigned int v60 = v26;
              v80[0] = MEMORY[0x263EF8330];
              v80[1] = 3221225472;
              v80[2] = __53__DKInkView__setDrawingOnRendererWithBleedAnimation___block_invoke;
              v80[3] = &unk_264885800;
              objc_copyWeak(&v81, location);
              *(float *)&double v27 = v15;
              float v28 = v17;
              *((float *)&v27 + 1) = v28;
              *(float *)&double v29 = v19;
              float v30 = v21;
              *((float *)&v29 + 1) = v30;
              v31.f64[0] = v62;
              v31.f64[1] = v61;
              v32.f64[0] = v64;
              v32.f64[1] = v63;
              +[DKPointSmoothing _interpolateFromPoint:v80 toPoint:v27 withControlPoint:*(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v32), v31).i64 atUnitScale:v29 emissionHandler:COERCE_DOUBLE(__PAIR64__(HIDWORD(v63), v60))];
              objc_destroyWeak(&v81);
              objc_destroyWeak(location);
            }
            [(NSMutableArray *)self->_cachedInterpolatedBrushStrokes addObject:self->_currentInterpolatedBrushStroke];
            float64x2_t v33 = self->_currentInterpolatedBrushStroke;
            self->_currentInterpolatedBrushStroke = 0;
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v82 objects:v88 count:16];
      }
      while (v4);
    }

    uint64_t v34 = [(DKInkRenderer *)self->_renderer maximumPointsForBleedAnimation];
    if ([(NSMutableArray *)self->_cachedInterpolatedAnimationPoints count]) {
      BOOL v35 = v34 < 1;
    }
    else {
      BOOL v35 = 1;
    }
    if (!v35)
    {
      uint64_t v36 = [(NSMutableArray *)self->_cachedInterpolatedAnimationPoints count];
      uint64_t v37 = [(NSMutableArray *)self->_cachedInterpolatedAnimationPoints count];
      uint64_t v38 = (v36 - v34) & ~((v36 - v34) >> 63);
      id v39 = -[NSMutableArray subarrayWithRange:](self->_cachedInterpolatedAnimationPoints, "subarrayWithRange:", 0, v38);
      double v40 = -[NSMutableArray subarrayWithRange:](self->_cachedInterpolatedAnimationPoints, "subarrayWithRange:", v38, v37 - v38);
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v41 = v39;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v76 objects:v87 count:16];
      if (v42)
      {
        char v43 = 0;
        uint64_t v44 = *(void *)v77;
        do
        {
          for (uint64_t j = 0; j != v42; ++j)
          {
            if (*(void *)v77 != v44) {
              objc_enumerationMutation(v41);
            }
            float64_t v46 = *(void **)(*((void *)&v76 + 1) + 8 * j);
            uint64_t v75 = 0;
            *(_OWORD *)id location = 0u;
            long long v74 = 0u;
            if (v46) {
              objc_msgSend(v46, "dk_renderPointValue");
            }
            if ((v43 & 1) == 0) {
              [(DKInkRenderer *)self->_renderer beginStroke];
            }
            renderer = self->_renderer;
            v71[0] = *(_OWORD *)location;
            v71[1] = v74;
            uint64_t v72 = v75;
            [(DKInkRenderer *)renderer addPoint:v71];
            char v43 = 1;
          }
          uint64_t v42 = [v41 countByEnumeratingWithState:&v76 objects:v87 count:16];
        }
        while (v42);

        [(DKInkRenderer *)self->_renderer endStroke];
        [(DKInkRenderer *)self->_renderer force];
      }
      else
      {
      }
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v48 = v40;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v67 objects:v86 count:16];
      if (v49)
      {
        char v50 = 0;
        uint64_t v51 = *(void *)v68;
        do
        {
          for (uint64_t k = 0; k != v49; ++k)
          {
            if (*(void *)v68 != v51) {
              objc_enumerationMutation(v48);
            }
            long long v53 = *(void **)(*((void *)&v67 + 1) + 8 * k);
            uint64_t v75 = 0;
            *(_OWORD *)id location = 0u;
            long long v74 = 0u;
            if (v53) {
              objc_msgSend(v53, "dk_renderPointValue");
            }
            if ((v50 & 1) == 0) {
              [(DKInkRenderer *)self->_renderer beginStroke];
            }
            long long v54 = self->_renderer;
            v65[0] = *(_OWORD *)location;
            v65[1] = v74;
            uint64_t v66 = v75;
            [(DKInkRenderer *)v54 addPoint:v65];
            char v50 = 1;
          }
          uint64_t v49 = [v48 countByEnumeratingWithState:&v67 objects:v86 count:16];
        }
        while (v49);

        [(DKInkRenderer *)self->_renderer endStroke];
      }
      else
      {
      }
      cachedInterpolatedAnimationPoints = self->_cachedInterpolatedAnimationPoints;
      self->_cachedInterpolatedAnimationPoints = 0;

      self->_unint64_t animationType = 0;
    }
  }
  else
  {
    [(DKInkView *)self _setDrawingOnRenderer:v56];
  }
}

void __53__DKInkView__setDrawingOnRendererWithBleedAnimation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renderEmittedPoints:a2 count:a3];
}

- (void)_setDrawingOnRendererWithReplayAnimation:(id)a3
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v45 = a3;
  uint64_t v61 = 0;
  float64_t v62 = &v61;
  uint64_t v63 = 0x2020000000;
  char v64 = 0;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  computedAnimationFrames = self->_computedAnimationFrames;
  self->_computedAnimationFrames = v4;

  uint64_t v6 = (void *)MEMORY[0x263EFF980];
  uint64_t v7 = [v45 strokes];
  objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  double v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  cachedInterpolatedAnimationStrokes = self->_cachedInterpolatedAnimationStrokes;
  self->_cachedInterpolatedAnimationStrokes = v8;

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  unint64_t v10 = [v45 strokes];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (v11)
  {
    uint64_t v47 = *(void *)v58;
    float64_t v46 = v10;
    do
    {
      uint64_t v48 = v11;
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v58 != v47) {
          objc_enumerationMutation(v10);
        }
        float v13 = [*(id *)(*((void *)&v57 + 1) + 8 * i) strokePoints];
        if ((unint64_t)[v13 count] >= 3)
        {
          double v14 = [MEMORY[0x263EFF980] array];
          currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
          self->_currentInterpolatedBrushStroke = v14;

          unint64_t v16 = 0;
          *(_OWORD *)self->_lastVectorPoint = 0u;
          *(_OWORD *)&self->_lastVectorPoint[16] = 0u;
          while (v16 < [v13 count] - 2)
          {
            double v17 = [v13 objectAtIndexedSubscript:v16];
            unint64_t v18 = v16 + 1;
            double v19 = [v13 objectAtIndexedSubscript:v16 + 1];
            v16 += 2;
            double v20 = [v13 objectAtIndexedSubscript:v18 + 1];
            [v17 location];
            double v22 = v21;
            [v17 location];
            double v24 = v23;
            [v17 velocity];
            [v17 force];
            [v19 location];
            double v26 = v25;
            [v19 location];
            double v28 = v27;
            [v19 velocity];
            [v19 force];
            [v20 location];
            float64_t v53 = v29;
            [v20 location];
            float64_t v52 = v30;
            [v20 velocity];
            float64_t v51 = v31;
            [v20 force];
            float64_t v50 = v32;
            objc_initWeak(&location, self);
            [(DKPointSmoothing *)self->_inputFIFO unitScale];
            unsigned int v49 = v33;
            v54[0] = MEMORY[0x263EF8330];
            v54[1] = 3221225472;
            v54[2] = __54__DKInkView__setDrawingOnRendererWithReplayAnimation___block_invoke;
            v54[3] = &unk_2648857D8;
            objc_copyWeak(&v55, &location);
            *(float *)&double v34 = v22;
            float v35 = v24;
            *((float *)&v34 + 1) = v35;
            *(float *)&double v36 = v26;
            float v37 = v28;
            *((float *)&v36 + 1) = v37;
            v38.f64[0] = v51;
            v38.f64[1] = v50;
            v39.f64[0] = v53;
            v39.f64[1] = v52;
            v54[4] = &v61;
            +[DKPointSmoothing _interpolateFromPoint:v54 toPoint:v34 withControlPoint:*(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39), v38).i64 atUnitScale:v36 emissionHandler:COERCE_DOUBLE(__PAIR64__(HIDWORD(v52), v49))];
            objc_destroyWeak(&v55);
            objc_destroyWeak(&location);
          }
          [(NSMutableArray *)self->_cachedInterpolatedAnimationStrokes addObject:self->_currentInterpolatedBrushStroke];
          double v40 = self->_currentInterpolatedBrushStroke;
          self->_currentInterpolatedBrushStroke = 0;
        }
        unint64_t v10 = v46;
      }
      uint64_t v11 = [v46 countByEnumeratingWithState:&v57 objects:v65 count:16];
    }
    while (v11);
  }

  if (*((unsigned char *)v62 + 24))
  {
    id v41 = [(DKInkView *)self renderer];
    [v41 endStroke];
  }
  uint64_t v42 = [(NSMutableArray *)self->_cachedInterpolatedAnimationStrokes firstObject];
  char v43 = (NSMutableArray *)[v42 mutableCopy];
  cachedInterpolatedAnimationPoints = self->_cachedInterpolatedAnimationPoints;
  self->_cachedInterpolatedAnimationPoints = v43;

  [(DKInkView *)self _computeAnimationFramesFittingInMaxDuration:15.0];
  _Block_object_dispose(&v61, 8);
}

void __54__DKInkView__setDrawingOnRendererWithReplayAnimation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (a3)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    if (!*(unsigned char *)(v7 + 24))
    {
      *(unsigned char *)(v7 + 24) = 1;
      double v8 = [WeakRetained renderer];
      [v8 beginStroke];

      id WeakRetained = v9;
    }
  }
  [WeakRetained _renderEmittedPoints:a2 count:a3];
}

- (void)_computeAnimationFramesFittingInMaxDuration:(double)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = self->_cachedInterpolatedAnimationStrokes;
  uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v24)
  {
    uint64_t v4 = (double *)MEMORY[0x263F00148];
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        double v6 = *v4;
        double v7 = v4[1];
        double v8 = [MEMORY[0x263EFF980] array];
        unint64_t v9 = 0;
        double v10 = 0.0;
        while (v9 < [v5 count])
        {
          uint64_t v11 = [v5 objectAtIndex:v9];
          unint64_t v12 = v11;
          if (v11) {
            objc_msgSend(v11, "dk_renderPointValue");
          }
          if (v6 != *v4 || v7 != v4[1]) {
            double v10 = v10 + DKDistanceBetweenPoints(0.0, 0.0, v6, v7);
          }
          double v7 = 0.0;
          double v6 = 0.0;
          [v8 addObject:v12];
          if (v10 > 7.0 && v9 > 2 || v9 == [v5 count] - 1)
          {
            computedAnimationFrames = self->_computedAnimationFrames;
            double v15 = [MEMORY[0x263EFF8C0] arrayWithArray:v8];
            [(NSMutableArray *)computedAnimationFrames addObject:v15];

            double v10 = 0.0;
            [v8 removeAllObjects];
          }

          ++v9;
        }
        unint64_t v16 = [(NSMutableArray *)self->_cachedInterpolatedAnimationStrokes indexOfObject:v5] + 1;
        if (v16 < [(NSMutableArray *)self->_cachedInterpolatedAnimationStrokes count])
        {
          double v25 = [v5 lastObject];
          double v17 = [(NSMutableArray *)self->_cachedInterpolatedAnimationStrokes objectAtIndex:v16];
          unint64_t v18 = [v17 firstObject];

          if (v25 && v18)
          {
            uint64_t v19 = arc4random_uniform(0x14u) + 10;
            do
            {
              double v20 = self->_computedAnimationFrames;
              double v21 = [MEMORY[0x263EFF8C0] array];
              [(NSMutableArray *)v20 addObject:v21];

              --v19;
            }
            while (v19);
          }
        }
      }
      uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v24);
  }
}

- (void)_replayAnimationTick:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_computedAnimationFrames firstObject];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v14 = 0;
        long long v12 = 0u;
        long long v13 = 0u;
        if (v8) {
          objc_msgSend(v8, "dk_renderPointValue");
        }
        unint64_t v9 = [(DKInkView *)self renderer];
        v10[0] = v12;
        v10[1] = v13;
        uint64_t v11 = v14;
        [v9 addPoint:v10];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_computedAnimationFrames removeObjectAtIndex:0];
}

- (void)inkDidRender:(id)a3
{
  id v5 = a3;
  unint64_t renderPreviewMode = self->_renderPreviewMode;
  if (renderPreviewMode == 1
    || renderPreviewMode == 2 && ![(DKInkView *)self countOfCurrentStroke])
  {
    [(DKInkView *)self _notifyRenderDelegate];
  }
}

- (void)inkDidCompleteRender:(id)a3
{
  id animationCompletionHandler = (void (**)(id, SEL, id))self->_animationCompletionHandler;
  if (animationCompletionHandler)
  {
    animationCompletionHandler[2](animationCompletionHandler, a2, a3);
    id v5 = self->_animationCompletionHandler;
    self->_id animationCompletionHandler = 0;
  }
}

- (void)undoLastStroke
{
  strokeUndoManager = self->_strokeUndoManager;
  if (strokeUndoManager)
  {
    [(NSUndoManager *)strokeUndoManager undo];
    if (![(NSUndoManager *)self->_strokeUndoManager canUndo])
    {
      id v4 = self->_strokeUndoManager;
      [(NSUndoManager *)v4 removeAllActions];
    }
  }
}

- (void)_undoLastStroke:(id)a3
{
  [a3 getValue:v10 size:104];
  id v4 = [(DKDrawing *)self->_currentDrawing mutableStrokes];
  [v4 count];
  [v4 removeLastObject];
  -[DKDrawing setStrokesFrame:](self->_currentDrawing, "setStrokesFrame:", v10[0], v10[1], v10[2], v10[3]);
  self->_totalPointsAdded = v13;
  [(NSMutableArray *)self->_cachedInterpolatedBrushStrokes removeLastObject];
  CGSize v5 = v12;
  self->_unionDrawingRect.origin = v11;
  self->_unionDrawingRect.size = v5;
  LODWORD(v5.width) = v15;
  v9[0] = v14;
  v9[1] = v5;
  [(DKInkView *)self setLastVectorPoint:v9];
  uint64_t v6 = [(DKInkView *)self renderer];
  [v6 removeLastStroke];

  double v7 = [(DKInkView *)self renderer];
  double v8 = [(DKInkView *)self renderer];
  [v8 bounds];
  objc_msgSend(v7, "setNeedsDisplayInRect:");

  [(DKInkView *)self _notifyRenderDelegate];
}

- (void)startStroke:(DKInkView *)self
{
  float32x2_t v21 = v2;
  id v4 = [(DKInkView *)self currentDrawing];
  CGSize v5 = [v4 strokes];
  uint64_t v26 = [v5 count];

  uint64_t v6 = [(DKInkView *)self currentDrawing];
  [v6 strokesFrame];
  v23[0] = v7;
  v23[1] = v8;
  v23[2] = v9;
  v23[3] = v10;

  unint64_t totalPointsAdded = self->_totalPointsAdded;
  CGSize size = self->_unionDrawingRect.size;
  CGPoint origin = self->_unionDrawingRect.origin;
  CGSize v25 = size;
  long long v28 = *(_OWORD *)self->_lastVectorPoint;
  int v29 = *(_DWORD *)&self->_lastVectorPoint[16];
  CGSize v12 = [MEMORY[0x263F08D40] valueWithBytes:v23 objCType:"{?={CGRect={CGPoint=dd}{CGSize=dd}}{CGRect={CGPoint=dd}{CGSize=dd}}qQfffff}"];
  unint64_t v13 = [(DKInkView *)self strokeUndoManager];
  [v13 registerUndoWithTarget:self selector:sel__undoLastStroke_ object:v12];

  [(DKInkView *)self setStrokeStartTime:CFAbsoluteTimeGetCurrent()];
  [(DKInkView *)self setStrokeLastLocation:vcvtq_f64_f32(v21)];
  [(DKInkView *)self strokeLastLocation];
  -[DKInkView setStrokeStartLocation:](self, "setStrokeStartLocation:");
  [(DKInkView *)self setTotalPointsAdded:0];
  memset(v22, 0, sizeof(v22));
  [(DKInkView *)self setLastVectorPoint:v22];
  if (!self->_cachedInterpolatedBrushStrokes)
  {
    long long v14 = [MEMORY[0x263EFF980] array];
    cachedInterpolatedBrushStrokes = self->_cachedInterpolatedBrushStrokes;
    self->_cachedInterpolatedBrushStrokes = v14;
  }
  long long v16 = [MEMORY[0x263EFF980] arrayWithCapacity:2000];
  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  self->_currentInterpolatedBrushStroke = v16;

  long long v18 = (DKDrawingStroke *)objc_opt_new();
  currentBrushStroke = self->_currentBrushStroke;
  self->_currentBrushStroke = v18;

  [(DKPointSmoothing *)self->_inputFIFO clear];
  uint64_t v20 = [(DKInkView *)self renderer];
  [v20 beginStroke];
}

- (void)continueStroke:(DKInkView *)self
{
  double v5 = *(double *)&v2;
  [(DKInkView *)self setStrokeLastLocation:vcvtq_f64_f32(v2)];
  inputFIFO = self->_inputFIFO;
  [(DKPointSmoothing *)inputFIFO addPoint:v5];
}

- (void)continueStrokeWithoutSmoothing:(DKInkView *)self
{
  -[DKInkView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 1, v2);
  id v4 = [(DKPointSmoothing *)self->_inputFIFO emissionHandler];
  ((void (**)(void, long long *, uint64_t, void, void))v4)[2](v4, &v5, 1, 0, 0);

  [(DKInkView *)self setIsAddingPointWithoutSmoothing:0];
}

- (void)terminateStroke
{
  [(DKPointSmoothing *)self->_inputFIFO flush];
  double Current = CFAbsoluteTimeGetCurrent();
  [(DKInkView *)self strokeStartTime];
  double v5 = v4;
  if ([(DKInkView *)self totalPointsAdded])
  {
    if ([(DKInkView *)self totalPointsAdded] <= 9)
    {
      double v6 = Current - v5;
      if (Current - v5 > 0.0 && v6 < 0.2)
      {
        [(DKInkView *)self strokeStartLocation];
        double v8 = v7;
        *(_OWORD *)uint64_t v24 = v9;
        [(DKInkView *)self strokeLastLocation];
        double v11 = v10;
        double v13 = v12;
        double v14 = DKDistanceBetweenPoints(v8, *(double *)v24, v10, v12);
        double v6 = 15.0;
        if (v14 < 15.0)
        {
          if (v14 > 0.0)
          {
            objc_msgSend((id)objc_opt_class(), "normalizeVectorPoint:", v11 - v8, v13 - *(double *)v24);
            double v8 = v8 + v14 * v15 * 0.5;
            *((id *)&v17 + 1) = v24[1];
            *(double *)&long long v17 = *(double *)v24 + v14 * v16 * 0.5;
            *(_OWORD *)uint64_t v24 = v17;
          }
          [(DKInkView *)self currentWeight];
          *(float *)&unsigned int v18 = v8;
          v20.f64[0] = v25;
          v20.f64[1] = fmax(v19, 2.4);
          *(float32x2_t *)v21.i8 = vcvt_f32_f64(v20);
          [(DKInkView *)self continueStrokeWithoutSmoothing:*(double *)vtrn1q_s32((int32x4_t)v18, vzip1q_s32(v21, v21)).i64];
        }
      }
    }
  }
  if (self->_currentInterpolatedBrushStroke) {
    [(NSMutableArray *)self->_cachedInterpolatedBrushStrokes addObject:v6];
  }
  if (self->_currentBrushStroke)
  {
    [(DKDrawing *)self->_currentDrawing addBrushStroke:v6];
    currentBrushStroke = self->_currentBrushStroke;
  }
  else
  {
    currentBrushStroke = 0;
  }
  self->_currentBrushStroke = 0;

  currentInterpolatedBrushStroke = self->_currentInterpolatedBrushStroke;
  self->_currentInterpolatedBrushStroke = 0;

  uint64_t v26 = [(DKInkView *)self renderer];
  [v26 endStroke];
}

- (double)weightForValue:(double)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__DKInkView_weightForValue___block_invoke;
  block[3] = &unk_264885828;
  block[4] = self;
  if (-[DKInkView weightForValue:]::onceToken != -1) {
    dispatch_once(&-[DKInkView weightForValue:]::onceToken, block);
  }
  float v4 = a3;
  float v5 = fminf(fmaxf((float)(v4 + -0.3) + (float)(v4 + -0.3), 0.0), 1.0);
  float v6 = (float)(v5 * v5) * (float)((float)(v5 * -2.0) + 3.0);
  float v7 = *(double *)&-[DKInkView weightForValue:]::MIN_PRESSURE;
  float v8 = *(double *)&-[DKInkView weightForValue:]::MAX_PRESSURE;
  if (v6 <= v8) {
    float v8 = v6;
  }
  if (v6 >= v7) {
    return v8;
  }
  return v7;
}

uint64_t __28__DKInkView_weightForValue___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) minPressure];
  -[DKInkView weightForValue:]::MIN_PRESSURE = v2;
  uint64_t result = [*(id *)(a1 + 32) maxPressure];
  -[DKInkView weightForValue:]::MAX_PRESSURE = v4;
  return result;
}

- (BOOL)ak_forceAvailableForTouch:(id)a3
{
  [a3 maximumPossibleForce];
  return v3 != 0.0;
}

- (double)weightForTouch:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([(DKInkView *)self ak_forceAvailableForTouch:v4])
  {
    [v4 force];
    double v7 = v6;
    [v4 maximumPossibleForce];
    [(DKInkView *)self weightForValue:v7 / v8];
    double v5 = v9;
  }

  return v5;
}

- (CGPoint)_velocityForTouch:(id)a3
{
  id v4 = a3;
  [v4 previousLocationInView:0];
  double v6 = v5;
  double v8 = v7;
  [v4 locationInView:0];
  double v10 = v9;
  double v12 = v11;
  [v4 timestamp];
  double v14 = v13 - self->_lastTouchTime;
  if (v14 >= 0.001)
  {
    double v16 = (v10 - v6) / v14;
    double v15 = (v12 - v8) / v14;
  }
  else
  {
    double v16 = *MEMORY[0x263F00148];
    double v15 = *(double *)(MEMORY[0x263F00148] + 8);
  }

  double v17 = v16;
  double v18 = v15;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_allowInput)
  {
    self->_lastTouchTime = 0.0;
    self->_trackingTouches = 1;
    double v8 = [v6 anyObject];
    [(DKInkView *)self _vector4ForTouchSettingWeightAndVelocity:v8 average:0];
    -[DKInkView startStroke:](self, "startStroke:");
    [v8 locationInView:self];
    -[DKInkView _postTouchesBeganNotification:](self, "_postTouchesBeganNotification:");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DKInkView;
    [(DKInkView *)&v9 touchesBegan:v6 withEvent:v7];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_allowInput)
  {
    self->_trackingTouches = 1;
    double v8 = [v6 anyObject];
    if (objc_opt_respondsToSelector())
    {
      objc_super v9 = [v7 coalescedTouchesForTouch:v8];
      [(DKInkView *)self handleCoalescedTouches:v9 forTouch:v8 average:1];
    }
    else
    {
      [(DKInkView *)self _vector4ForTouchSettingWeightAndVelocity:v8 average:0];
      -[DKInkView continueStroke:](self, "continueStroke:");
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DKInkView;
    [(DKInkView *)&v10 touchesMoved:v6 withEvent:v7];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_allowInput)
  {
    double v8 = [v6 anyObject];
    [(DKInkView *)self _vector4ForTouchSettingWeightAndVelocity:v8 average:1];
    -[DKInkView continueStroke:](self, "continueStroke:");
    [(DKInkView *)self terminateStroke];
    self->_trackingTouches = 0;
    [v8 locationInView:self];
    -[DKInkView _postTouchesEndedNotification:](self, "_postTouchesEndedNotification:");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)DKInkView;
    [(DKInkView *)&v9 touchesEnded:v6 withEvent:v7];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_allowInput)
  {
    double v8 = [(DKDrawingStroke *)self->_currentBrushStroke strokePoints];
    unint64_t v9 = [v8 count];

    [(DKInkView *)self terminateStroke];
    if (v9 <= 4) {
      [(NSUndoManager *)self->_strokeUndoManager undo];
    }
    self->_trackingTouches = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)DKInkView;
    [(DKInkView *)&v10 touchesCancelled:v6 withEvent:v7];
  }
}

- (void)handleCoalescedTouches:(id)a3 forTouch:(id)a4 average:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = a3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        -[DKInkView _vector4ForTouchSettingWeightAndVelocity:average:](self, "_vector4ForTouchSettingWeightAndVelocity:average:", *(void *)(*((void *)&v11 + 1) + 8 * v10), v5, (void)v11);
        -[DKInkView continueStroke:](self, "continueStroke:");
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (__n128)_vector4ForTouchSettingWeightAndVelocity:(void *)a3 average:(uint64_t)a4
{
  id v6 = a3;
  [v6 locationInView:a1];
  float64_t v25 = v8;
  float64_t v26 = v7;
  [(id)a1 weightForTouch:v6];
  double v10 = v9;
  objc_msgSend((id)a1, "setCurrentWeight:");
  [(id)a1 _updateVelocityWithTouch:v6 average:a4];
  float64x2_t v24 = *(float64x2_t *)(a1 + 440);
  [(id)a1 minThickness];
  double v12 = v11;
  [(id)a1 maxThickness];
  float32x2_t v14 = vcvt_f32_f64(v24);
  float v15 = sqrtf(vaddv_f32(vmul_f32(v14, v14)));
  if (v15 >= *(float *)&MaxVelocityValue) {
    float v15 = *(float *)&MaxVelocityValue;
  }
  float v16 = fminf(fmaxf(v15 / (float)(*(float *)&MaxVelocityValue * 0.5), 0.0), 1.0);
  float v17 = 1.0 - (float)((float)(v16 * v16) * (float)((float)(v16 * -2.0) + 3.0));
  float v18 = v13;
  float v19 = (float)(v17 * v17) * v18;
  if (v19 <= v18) {
    float v18 = v19;
  }
  float v20 = v12;
  if (v19 < v20) {
    float v18 = v12;
  }
  v21.f64[0] = v26;
  v21.f64[1] = v25;
  *(float32x2_t *)&v21.f64[0] = vcvt_f32_f64(v21);
  *(float *)&v21.f64[1] = v18;
  float v22 = v10;
  *((float *)&v21.f64[1] + 1) = v22;
  float64x2_t v27 = v21;

  return (__n128)v27;
}

- (void)_updateVelocityWithTouch:(id)a3 average:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double x = self->_velocityInWindow.x;
  double y = self->_velocityInWindow.y;
  id v12 = v6;
  -[DKInkView _velocityForTouch:](self, "_velocityForTouch:");
  if (v4)
  {
    double v10 = y * 0.15 + v10 * 0.85;
    double v9 = x * 0.15 + v9 * 0.85;
  }
  self->_velocityInWindow.double x = v9;
  self->_velocityInWindow.double y = v10;
  [v12 timestamp];
  self->_lastTouchTime = v11;
}

+ (CGVector)normalizeVector:(CGVector)a3
{
  ddouble y = a3.dy;
  ddouble x = a3.dx;
  objc_msgSend(a1, "lengthOfVector:");
  double v6 = dy / v5;
  double v7 = dx / v5;
  result.ddouble y = v6;
  result.ddouble x = v7;
  return result;
}

- (BOOL)trackingTouches
{
  return self->_trackingTouches;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)minPressure
{
  return self->_minPressure;
}

- (void)setMinPressure:(double)a3
{
  self->_minPressure = a3;
}

- (double)maxPressure
{
  return self->_maxPressure;
}

- (void)setMaxPressure:(double)a3
{
  self->_maxPressure = a3;
}

- (double)minThickness
{
  return self->_minThickness;
}

- (void)setMinThickness:(double)a3
{
  self->_minThickness = a3;
}

- (double)maxThickness
{
  return self->_maxThickness;
}

- (void)setMaxThickness:(double)a3
{
  self->_maxThickness = a3;
}

- (DKInkRenderer)renderer
{
  return self->_renderer;
}

- (DKDrawingStroke)currentBrushStroke
{
  return self->_currentBrushStroke;
}

- (void)setCurrentBrushStroke:(id)a3
{
}

- (NSMutableArray)currentInterpolatedBrushStroke
{
  return self->_currentInterpolatedBrushStroke;
}

- (void)setCurrentInterpolatedBrushStroke:(id)a3
{
}

- (NSMutableArray)cachedInterpolatedBrushStrokes
{
  return self->_cachedInterpolatedBrushStrokes;
}

- (void)setCachedInterpolatedBrushStrokes:(id)a3
{
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (unint64_t)totalPointsAdded
{
  return self->_totalPointsAdded;
}

- (void)setTotalPointsAdded:(unint64_t)a3
{
  self->_unint64_t totalPointsAdded = a3;
}

- (CGPoint)strokeStartLocation
{
  objc_copyStruct(v4, &self->_strokeStartLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setStrokeStartLocation:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_strokeStartLocation, &v3, 16, 1, 0);
}

- (CGPoint)strokeLastLocation
{
  objc_copyStruct(v4, &self->_strokeLastLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setStrokeLastLocation:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_strokeLastLocation, &v3, 16, 1, 0);
}

- (double)strokeStartTime
{
  return self->_strokeStartTime;
}

- (void)setStrokeStartTime:(double)a3
{
  self->_strokeStartTime = a3;
}

- (BOOL)isAddingPointWithoutSmoothing
{
  return self->_isAddingPointWithoutSmoothing;
}

- (void)setIsAddingPointWithoutSmoothing:(BOOL)a3
{
  self->_isAddingPointWithoutSmoothing = a3;
}

- (__n128)lastVectorPoint
{
  __n128 result = *(__n128 *)(a1 + 704);
  long long v3 = *(_OWORD *)(a1 + 720);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

- (void)setLastVectorPoint:(DKInkView *)self
{
  long long v3 = v2[1];
  *(_OWORD *)self->_lastVectorPoint = *v2;
  *(_OWORD *)&self->_lastVectorPoint[16] = v3;
}

- (DKPointSmoothing)inputFIFO
{
  return self->_inputFIFO;
}

- (void)setInputFIFO:(id)a3
{
}

- (CGRect)aggregateInvalid
{
  double x = self->_aggregateInvalid.origin.x;
  double y = self->_aggregateInvalid.origin.y;
  double width = self->_aggregateInvalid.size.width;
  double height = self->_aggregateInvalid.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setAggregateInvalid:(CGRect)a3
{
  self->_aggregateInvalid = a3;
}

- (CGRect)unionDrawingRect
{
  double x = self->_unionDrawingRect.origin.x;
  double y = self->_unionDrawingRect.origin.y;
  double width = self->_unionDrawingRect.size.width;
  double height = self->_unionDrawingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setUnionDrawingRect:(CGRect)a3
{
  self->_unionDrawingRect = a3;
}

- (unint64_t)animationType
{
  return self->_animationType;
}

- (void)setAnimationType:(unint64_t)a3
{
  self->_unint64_t animationType = a3;
}

- (NSMutableArray)cachedInterpolatedAnimationPoints
{
  return self->_cachedInterpolatedAnimationPoints;
}

- (void)setCachedInterpolatedAnimationPoints:(id)a3
{
}

- (NSMutableArray)cachedInterpolatedAnimationStrokes
{
  return self->_cachedInterpolatedAnimationStrokes;
}

- (void)setCachedInterpolatedAnimationStrokes:(id)a3
{
}

- (NSMutableArray)computedAnimationFrames
{
  return self->_computedAnimationFrames;
}

- (void)setComputedAnimationFrames:(id)a3
{
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (NSUndoManager)strokeUndoManager
{
  return self->_strokeUndoManager;
}

- (void)setStrokeUndoManager:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (BOOL)scaleDrawingToFitCanvas
{
  return self->_scaleDrawingToFitCanvas;
}

- (BOOL)allowInput
{
  return self->_allowInput;
}

- (void)setAllowInput:(BOOL)a3
{
  self->_allowInput = a3;
}

- (BOOL)isRenderingPaused
{
  return self->_isRenderingPaused;
}

- (DKInkViewRenderDelegate)renderPreviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renderPreviewDelegate);
  return (DKInkViewRenderDelegate *)WeakRetained;
}

- (void)setRenderPreviewDelegate:(id)a3
{
}

- (unint64_t)renderPreviewMode
{
  return self->_renderPreviewMode;
}

- (void)setRenderPreviewMode:(unint64_t)a3
{
  self->_unint64_t renderPreviewMode = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_renderPreviewDelegate);
  objc_storeStrong((id *)&self->_strokeUndoManager, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_computedAnimationFrames, 0);
  objc_storeStrong((id *)&self->_cachedInterpolatedAnimationStrokes, 0);
  objc_storeStrong((id *)&self->_cachedInterpolatedAnimationPoints, 0);
  objc_storeStrong((id *)&self->_inputFIFO, 0);
  objc_storeStrong((id *)&self->_cachedInterpolatedBrushStrokes, 0);
  objc_storeStrong((id *)&self->_currentInterpolatedBrushStroke, 0);
  objc_storeStrong((id *)&self->_currentBrushStroke, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong(&self->_animationCompletionHandler, 0);
  objc_storeStrong(&self->_trackingTouchID, 0);
  objc_storeStrong((id *)&self->_currentDrawing, 0);
}

@end