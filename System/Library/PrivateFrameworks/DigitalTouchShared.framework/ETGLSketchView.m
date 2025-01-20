@interface ETGLSketchView
+ (Class)layerClass;
- (BOOL)_doesPoint:(id *)a3 predateTime:(double)a4;
- (BOOL)_getCurrentSketchPoint:(id *)a3;
- (BOOL)isPaused;
- (BOOL)isPlaying;
- (BOOL)playbackCompleted;
- (BOOL)useFastVerticalWisp;
- (CGImage)createImageForTime:(double)a3;
- (CGImage)createRenderedFrameImage;
- (EAGLContext)context;
- (ETBoxcarFilterPointFIFO)secondarySmoothingFIFO;
- (ETBoxcarFilterPointFIFO)smoothingFIFO;
- (ETGLSketchRenderer)renderer;
- (ETGLSketchView)initWithFrame:(CGRect)a3;
- (ETPointFIFO)pointFIFO;
- (ETPointFIFO)secondaryPointFIFO;
- (ETQuadCurvePointFIFO)interpolatingFIFO;
- (ETQuadCurvePointFIFO)secondaryInterpolatingFIFO;
- (ETSketchMessage)messageData;
- (double)delayBetweenStrokes;
- (double)timestampForLastDrawnPoint;
- (double)wispDelay;
- (float)unitSize;
- (id).cxx_construct;
- (unint64_t)vertexOffset;
- (vector<float)controlBatches;
- (vector<std::vector<float)vertexBatches;
- (vector<unsigned)secondaryVertexBatchCount;
- (vector<unsigned)vertexBatchCount;
- (void)_drawCurrentPointAdvancingPlayback;
- (void)_endPlayback;
- (void)animateOutWithCompletion:(id)a3;
- (void)beginStrokeWithColor:(id)a3;
- (void)clear;
- (void)clearAllPoints;
- (void)didCompleteStroke;
- (void)drawFrameBeforeWisp;
- (void)drawView:(id)a3;
- (void)handleSketchAtPosition:(CGPoint)a3;
- (void)handleTapAtPosition:(CGPoint)a3;
- (void)layoutSubviews;
- (void)setContext:(id)a3;
- (void)setControlBatches:(vector<float)__attribute__((ext_vector_type(2;
- (void)setDelayBetweenStrokes:(double)a3;
- (void)setGLContextAsCurrent;
- (void)setInterpolatingFIFO:(id)a3;
- (void)setMessageData:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPlaybackCompleted:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setPointFIFO:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setSecondaryInterpolatingFIFO:(id)a3;
- (void)setSecondaryPointFIFO:(id)a3;
- (void)setSecondarySmoothingFIFO:(id)a3;
- (void)setSecondaryVertexBatchCount:(vector<unsigned)long;
- (void)setSmoothingFIFO:(id)a3;
- (void)setTimestampForLastDrawnPoint:(double)a3;
- (void)setUnitSize:(float)a3;
- (void)setUseFastVerticalWisp:(BOOL)a3;
- (void)setVertexBatchCount:(vector<unsigned)long;
- (void)setVertexBatches:(vector<std::vector<float)__attribute__((ext_vector_type(2;
- (void)setVertexOffset:(unint64_t)a3;
- (void)setWispDelay:(double)a3;
- (void)sketchRendererDidReachVertexLimit:(id)a3;
- (void)updateRendererWithPoints:(ETGLSketchView *)self count:(SEL)a2 controlPoint:flush:;
- (void)updateRendererWithSecondaryPoints:(ETGLSketchView *)self count:(SEL)a2 controlPoint:flush:;
@end

@implementation ETGLSketchView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setGLContextAsCurrent
{
}

- (ETGLSketchView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v60[2] = *MEMORY[0x263EF8340];
  v58.receiver = self;
  v58.super_class = (Class)ETGLSketchView;
  v5 = -[ETGLSketchView initWithFrame:](&v58, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    v7 = [(ETGLSketchView *)v5 layer];
    [v7 setOpaque:0];
    v59[0] = *MEMORY[0x263F14710];
    v8 = [NSNumber numberWithBool:0];
    v59[1] = *MEMORY[0x263F14708];
    v60[0] = v8;
    v60[1] = *MEMORY[0x263F146F0];
    v9 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:2];
    [v7 setDrawableProperties:v9];

    [v7 setAsynchronous:0];
    v10 = [MEMORY[0x263F1C920] mainScreen];
    [v10 scale];
    BOOL v12 = v11 > 1.0;

    if (v12)
    {
      v13 = [MEMORY[0x263F1C920] mainScreen];
      [v13 scale];
      -[ETGLSketchView setContentScaleFactor:](v6, "setContentScaleFactor:");
    }
    uint64_t v14 = [objc_alloc(MEMORY[0x263F146E8]) initWithAPI:2];
    context = v6->_context;
    v6->_context = (EAGLContext *)v14;

    if (v6->_context)
    {
      [(ETGLSketchView *)v6 setGLContextAsCurrent];
      v16 = [ETGLSketchRenderer alloc];
      v17 = v6->_context;
      v18 = [(ETGLSketchView *)v6 layer];
      uint64_t v19 = [(ETGLSketchRenderer *)v16 initWithContext:v17 andDrawable:v18];
      renderer = v6->_renderer;
      v6->_renderer = (ETGLSketchRenderer *)v19;

      v21 = v6->_renderer;
      if (v21)
      {
        [(ETGLSketchRenderer *)v21 setDelegate:v6];
        [(ETGLSketchRenderer *)v6->_renderer setUseFastVerticalWisp:v6->_useFastVerticalWisp];
        double v22 = fmax(width / 156.0, 1.0);
        if (v22 > 3.0) {
          double v22 = 3.0;
        }
        [(ETGLSketchRenderer *)v6->_renderer setLineWidthScaleFactor:v22];
        v6->_paused = 1;
        [(ETGLSketchView *)v6 contentScaleFactor];
        double v24 = v23;
        [(ETGLSketchView *)v6 contentScaleFactor];
        float v25 = 2.0 / (width * v24);
        float v27 = 2.0 / (height * v26);
        if (v25 >= v27) {
          float v28 = v27;
        }
        else {
          float v28 = 2.0 / (width * v24);
        }
        v6->_unitSize = v28;
        v29 = [[ETPointFIFO alloc] initWithFIFO:0];
        pointFIFO = v6->_pointFIFO;
        v6->_pointFIFO = v29;

        v31 = [ETBoxcarFilterPointFIFO alloc];
        *(float *)&double v32 = v6->_unitSize * 5.0;
        uint64_t v33 = [(ETBoxcarFilterPointFIFO *)v31 initWithFIFO:v6->_pointFIFO width:2 spacing:v32];
        smoothingFIFO = v6->_smoothingFIFO;
        v6->_smoothingFIFO = (ETBoxcarFilterPointFIFO *)v33;

        v35 = [[ETQuadCurvePointFIFO alloc] initWithFIFO:v6->_smoothingFIFO];
        interpolatingFIFO = v6->_interpolatingFIFO;
        v6->_interpolatingFIFO = v35;

        *(float *)&double v37 = v28;
        [(ETQuadCurvePointFIFO *)v6->_interpolatingFIFO setUnitSize:v37];
        objc_initWeak(&location, v6);
        v55[0] = MEMORY[0x263EF8330];
        v55[1] = 3221225472;
        v55[2] = __32__ETGLSketchView_initWithFrame___block_invoke;
        v55[3] = &unk_264DEC8A8;
        objc_copyWeak(&v56, &location);
        [(ETQuadCurvePointFIFO *)v6->_interpolatingFIFO setEmissionHandler:v55];
        [(ETQuadCurvePointFIFO *)v6->_interpolatingFIFO setEmitInterpolatedPoints:0];
        v38 = [[ETPointFIFO alloc] initWithFIFO:0];
        secondaryPointFIFO = v6->_secondaryPointFIFO;
        v6->_secondaryPointFIFO = v38;

        v40 = [ETBoxcarFilterPointFIFO alloc];
        *(float *)&double v41 = v6->_unitSize * 5.0;
        uint64_t v42 = [(ETBoxcarFilterPointFIFO *)v40 initWithFIFO:v6->_secondaryPointFIFO width:3 spacing:v41];
        secondarySmoothingFIFO = v6->_secondarySmoothingFIFO;
        v6->_secondarySmoothingFIFO = (ETBoxcarFilterPointFIFO *)v42;

        v44 = [[ETQuadCurvePointFIFO alloc] initWithFIFO:v6->_secondarySmoothingFIFO];
        secondaryInterpolatingFIFO = v6->_secondaryInterpolatingFIFO;
        v6->_secondaryInterpolatingFIFO = v44;

        *(float *)&double v46 = v28;
        [(ETQuadCurvePointFIFO *)v6->_secondaryInterpolatingFIFO setUnitSize:v46];
        uint64_t v50 = MEMORY[0x263EF8330];
        uint64_t v51 = 3221225472;
        v52 = __32__ETGLSketchView_initWithFrame___block_invoke_2;
        v53 = &unk_264DEC8A8;
        objc_copyWeak(&v54, &location);
        [(ETQuadCurvePointFIFO *)v6->_secondaryInterpolatingFIFO setEmissionHandler:&v50];
        -[ETQuadCurvePointFIFO setEmitInterpolatedPoints:](v6->_secondaryInterpolatingFIFO, "setEmitInterpolatedPoints:", 0, v50, v51, v52, v53);
        [(ETGLSketchView *)v6 setUserInteractionEnabled:0];
        objc_destroyWeak(&v54);
        objc_destroyWeak(&v56);
        objc_destroyWeak(&location);

        goto LABEL_12;
      }
      if (IMOSLoggingEnabled())
      {
        v48 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          LOWORD(location) = 0;
          _os_log_impl(&dword_23B55A000, v48, OS_LOG_TYPE_INFO, "ERROR: Couldn't allocate ETGLSketchRenderer", (uint8_t *)&location, 2u);
        }
LABEL_20:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        LOWORD(location) = 0;
        _os_log_impl(&dword_23B55A000, v48, OS_LOG_TYPE_INFO, "ERROR: Couldn't allocate EAGLContext", (uint8_t *)&location, 2u);
      }
      goto LABEL_20;
    }

    v47 = 0;
    goto LABEL_22;
  }
LABEL_12:
  v47 = v6;
LABEL_22:

  return v47;
}

void __32__ETGLSketchView_initWithFrame___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateRendererWithPoints:a2 count:a3 controlPoint:a4 flush:a5];
}

void __32__ETGLSketchView_initWithFrame___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateRendererWithSecondaryPoints:a2 count:a3 controlPoint:a4 flush:a5];
}

- (void)setWispDelay:(double)a3
{
}

- (void)setMessageData:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_messageData, a3);
  uint64_t v5 = [v6 isRenderingOffscreen];
  self->_renderingOffscreen = v5;
  [(ETGLSketchRenderer *)self->_renderer setRenderingOffscreen:v5];
}

- (void)animateOutWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_initWeak(&location, self);
  id v6 = [(ETGLSketchView *)self messageData];
  objc_initWeak(&from, v6);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__ETGLSketchView_animateOutWithCompletion___block_invoke;
  v9[3] = &unk_264DEC8D0;
  objc_copyWeak(&v11, &from);
  objc_copyWeak(&v12, &location);
  id v7 = v4;
  id v10 = v7;
  v8 = (void (**)(void))MEMORY[0x23ECC8210](v9);
  if ([(ETGLSketchView *)self isPaused]) {
    v8[2](v8);
  }
  else {
    [(ETGLSketchRenderer *)self->_renderer animateOutWithCompletion:v8];
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

uint64_t __43__ETGLSketchView_animateOutWithCompletion___block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_23B55A000, v2, OS_LOG_TYPE_INFO, "Completed animation. Stopping displaylink and removing view", v8, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  char v4 = [WeakRetained didEndWisping];

  if ((v4 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    [v5 didEndWisp];
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 clear];

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)beginStrokeWithColor:(id)a3
{
  id v4 = a3;
  if (!self->_playing)
  {
    id v5 = [(ETGLSketchView *)self messageData];
    [v5 addStrokeWithColor:v4];
  }
  id v6 = [(UIColor *)self->_currentStrokeColor CGColor];
  id v7 = v4;
  if (!CGColorEqualToColor(v6, (CGColorRef)[v7 CGColor]))
  {
    objc_storeStrong((id *)&self->_currentStrokeColor, v7);
    float64_t v25 = 0.0;
    float64_t v26 = 0.0;
    float64_t v23 = 0.0;
    float64_t v24 = 0.0;
    [v7 getRed:&v26 green:&v25 blue:&v24 alpha:&v23];
    v8.f64[0] = v26;
    v8.f64[1] = v25;
    v9.f64[0] = v24;
    v9.f64[1] = v23;
    float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v8), v9);
    id v10 = [(ETGLSketchView *)self renderer];
    [v10 setFinalDrawingColor:&v22];

    double v20 = 0.0;
    double v21 = 0.0;
    double v19 = 0.0;
    [v7 getHue:&v21 saturation:&v20 brightness:&v19 alpha:&v23];
    float v11 = v21 + -0.05 + 1.0;
    float v12 = fmodf(v11, 1.0);
    float v13 = v20 + -0.05;
    double v20 = fmaxf(fminf(v13, 1.0), 0.0);
    double v21 = v12;
    float v14 = v19 + 0.2;
    double v19 = fmaxf(fminf(v14, 1.0), 0.0);
    v15 = objc_msgSend(MEMORY[0x263F1C550], "colorWithHue:saturation:brightness:alpha:");
    [v15 getRed:&v26 green:&v25 blue:&v24 alpha:&v23];
    v16.f64[0] = v26;
    v16.f64[1] = v25;
    v17.f64[0] = v24;
    v17.f64[1] = v23;
    float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v17);
    v18 = [(ETGLSketchView *)self renderer];
    [v18 setInitialDrawingColor:&v22];
  }
}

- (void)_drawCurrentPointAdvancingPlayback
{
  v3 = [(ETSketchMessage *)self->_messageData strokes];
  unint64_t currentStrokeIndex = self->_currentStrokeIndex;
  if (currentStrokeIndex < [v3 count])
  {
    id v5 = [v3 objectAtIndexedSubscript:self->_currentStrokeIndex];
    unint64_t currentPointIndex = self->_currentPointIndex;
    if (currentPointIndex >= [v5 count])
    {
      self->_unint64_t currentPointIndex = 0;
      ++self->_currentStrokeIndex;
      ++self->_numberOfDrawnStrokes;
      unint64_t v7 = self->_currentStrokeIndex;
      if (v7 >= [v3 count])
      {
        self->_playbackCompleted = 1;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v8 = [v3 objectAtIndexedSubscript:self->_currentStrokeIndex];

      id v5 = (void *)v8;
    }
    float64x2_t v9 = [v5 objectAtIndexedSubscript:self->_currentPointIndex];
    [v9 getValue:&v23];

    LOWORD(v10) = v24;
    self->_timestampForLastDrawnPoint = (double)v10 / 1000.0;
    unsigned int v11 = v23;
    uint64_t v12 = [v5 count];
    double v13 = (double)(unsigned __int16)v11 / 32767.0 + -1.0;
    double v14 = (double)HIWORD(v11) / 32767.0 + -1.0;
    if (!self->_currentPointIndex)
    {
      BOOL v15 = [(ETSketchMessage *)self->_messageData hasMultipleColors];
      messageData = self->_messageData;
      if (v15)
      {
        float64x2_t v17 = [(ETSketchMessage *)messageData colorsInMessage];
        v18 = [v17 objectAtIndex:self->_numberOfDrawnStrokes];
      }
      else
      {
        v18 = [(ETMessage *)messageData color];
      }
      [(ETGLSketchView *)self beginStrokeWithColor:v18];
      if (v12 == 1)
      {
        -[ETGLSketchView handleTapAtPosition:](self, "handleTapAtPosition:", v13, v14);
        self->_renderingDelay = 0.1;
      }
    }
    -[ETGLSketchView handleSketchAtPosition:](self, "handleSketchAtPosition:", v13, v14);
    unint64_t v19 = self->_currentPointIndex + 1;
    self->_unint64_t currentPointIndex = v19;
    if (v19 == [v5 count])
    {
      [(ETGLSketchView *)self didCompleteStroke];
      ++self->_currentStrokeIndex;
      ++self->_numberOfDrawnStrokes;
      self->_unint64_t currentPointIndex = 0;
      if (v12 != 1) {
        self->_renderingDelay = 0.3;
      }
    }
    unint64_t v20 = self->_currentStrokeIndex;
    if (v20 == [v3 count])
    {
      self->_playbackCompleted = 1;
      [(ETGLSketchView *)self setPlaying:0];
      if ([(ETMessage *)self->_messageData isRenderingOffscreen])
      {
        [(ETGLSketchView *)self _endPlayback];
      }
      else
      {
        dispatch_time_t v21 = dispatch_time(0, 300000000);
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = __52__ETGLSketchView__drawCurrentPointAdvancingPlayback__block_invoke;
        v22[3] = &unk_264DEC8F8;
        v22[4] = self;
        dispatch_after(v21, MEMORY[0x263EF83A0], v22);
      }
    }
    goto LABEL_21;
  }
  self->_playbackCompleted = 1;
LABEL_22:
}

uint64_t __52__ETGLSketchView__drawCurrentPointAdvancingPlayback__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endPlayback];
}

- (void)drawFrameBeforeWisp
{
  [(ETGLSketchView *)self setGLContextAsCurrent];
  [(ETGLSketchView *)self setPlaying:1];
  do
  {
    [(ETGLSketchView *)self _drawCurrentPointAdvancingPlayback];
    [(ETGLSketchRenderer *)self->_renderer render];
    v3 = [(ETGLSketchView *)self messageData];
    int v4 = [v3 didDrawPoints];
  }
  while (!v4);
  int v5 = 18;
  do
  {
    [(ETGLSketchView *)self _drawCurrentPointAdvancingPlayback];
    [(ETGLSketchRenderer *)self->_renderer render];
    --v5;
  }
  while (v5);
}

- (BOOL)_doesPoint:(id *)a3 predateTime:(double)a4
{
  double renderingStartTime = self->_renderingStartTime;
  double v5 = a4 - renderingStartTime;
  LOWORD(renderingStartTime) = a3->var1.var0;
  return v5 >= (double)*(unint64_t *)&renderingStartTime / 1000.0;
}

- (void)drawView:(id)a3
{
  id v4 = a3;
  [(ETGLSketchView *)self setGLContextAsCurrent];
  if (self->_playing)
  {
    [v4 timestamp];
    double v6 = v5;
    if (self->_renderingStartTime == 0.0) {
      self->_double renderingStartTime = v5;
    }
    if ([(ETMessage *)self->_messageData supportsPlaybackTimeOffset])
    {
      BOOL v7 = [(ETGLSketchView *)self _getCurrentSketchPoint:v12];
      uint64_t v8 = -601;
      while (self->_playing)
      {
        if (!v7) {
          break;
        }
        if (![(ETGLSketchView *)self _doesPoint:v12 predateTime:v6]) {
          break;
        }
        if (__CFADD__(v8++, 1)) {
          break;
        }
        [(ETGLSketchView *)self _drawCurrentPointAdvancingPlayback];
        BOOL v7 = [(ETGLSketchView *)self _getCurrentSketchPoint:v12];
      }
      if ([(ETSketchMessage *)self->_messageData hideComet] && self->_playbackCompleted)
      {
        double v10 = v6 + 1000.0;
        *(float *)&double v10 = v6 + 1000.0;
        [(ETGLSketchRenderer *)self->_renderer updateGLWithTime:v10];
      }
    }
    else
    {
      self->_renderingDelay = fmax(self->_renderingDelay - (v6 - self->_lastDisplayLinkTime), 0.0);
      self->_lastDisplayLinkTime = v6;
      if (self->_renderingDelay == 0.0) {
        [(ETGLSketchView *)self _drawCurrentPointAdvancingPlayback];
      }
    }
  }
  unsigned int v11 = [(ETGLSketchView *)self renderer];
  [v11 render];
}

- (BOOL)_getCurrentSketchPoint:(id *)a3
{
  double v5 = [(ETSketchMessage *)self->_messageData strokes];
  unint64_t currentStrokeIndex = self->_currentStrokeIndex;
  if (currentStrokeIndex >= [v5 count])
  {
    BOOL v11 = 0;
  }
  else
  {
    BOOL v7 = [v5 objectAtIndexedSubscript:self->_currentStrokeIndex];
    unint64_t currentPointIndex = self->_currentPointIndex;
    unint64_t v9 = [v7 count];
    BOOL v10 = currentPointIndex >= v9;
    BOOL v11 = currentPointIndex < v9;
    if (!v10)
    {
      uint64_t v12 = [v7 objectAtIndexedSubscript:self->_currentPointIndex];
      [v12 getValue:a3];
    }
  }

  return v11;
}

- (CGImage)createRenderedFrameImage
{
  v2 = [(ETGLSketchView *)self renderer];
  v3 = (CGImage *)[v2 createRenderedFrameImageUsingAlpha:0];

  return v3;
}

- (CGImage)createImageForTime:(double)a3
{
  [(ETGLSketchView *)self setGLContextAsCurrent];
  self->_playing = 1;
  if (self->_playbackCompleted)
  {
LABEL_4:
    if (![(ETMessage *)self->_messageData delayWisp])
    {
      double v5 = [(ETGLSketchView *)self renderer];
      [v5 setIsDying:1];
    }
  }
  else
  {
    while (self->_timestampForLastDrawnPoint <= a3)
    {
      [(ETGLSketchView *)self _drawCurrentPointAdvancingPlayback];
      if (self->_playbackCompleted) {
        goto LABEL_4;
      }
    }
  }
  double v6 = [(ETGLSketchView *)self renderer];
  *(float *)&double v7 = a3;
  [v6 updateGLWithTime:v7];

  uint64_t v8 = [(ETGLSketchView *)self renderer];
  [v8 render];

  self->_playing = 0;
  unint64_t v9 = [(ETGLSketchView *)self renderer];
  BOOL v10 = (CGImage *)objc_msgSend(v9, "createRenderedFrameImageUsingAlpha:", -[ETMessage isRenderingOffscreenOpaque](self->_messageData, "isRenderingOffscreenOpaque") ^ 1);

  return v10;
}

- (void)_endPlayback
{
  [(ETGLSketchView *)self setPlaying:0];
  [(ETSketchMessage *)self->_messageData willBeginWisp];
  if (![(ETMessage *)self->_messageData delayWisp]
    && ![(ETMessage *)self->_messageData isRenderingOffscreen])
  {
    [(ETGLSketchView *)self animateOutWithCompletion:0];
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    if (!self->_renderingOffscreen)
    {
      if (a3)
      {
        self->_pauseTime = CFAbsoluteTimeGetCurrent();
        [(CADisplayLink *)self->_displayLink invalidate];
        displayLink = self->_displayLink;
        self->_displayLink = 0;

        if ([(ETSketchMessage *)self->_messageData didDrawPoints]
          && ![(ETSketchMessage *)self->_messageData didEndWisping]
          && ![(ETMessage *)self->_messageData delayWisp])
        {
          [(ETGLSketchView *)self animateOutWithCompletion:0];
        }
      }
      else
      {
        double v5 = [MEMORY[0x263F15780] displayLinkWithTarget:self selector:sel_drawView_];
        double v6 = self->_displayLink;
        self->_displayLink = v5;

        [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:60];
        if (self->_pauseTime != 0.0)
        {
          self->_double renderingStartTime = CFAbsoluteTimeGetCurrent() - self->_pauseTime + self->_renderingStartTime;
          self->_pauseTime = 0.0;
        }
        double v7 = self->_displayLink;
        id v8 = [MEMORY[0x263EFF9F0] mainRunLoop];
        -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:");
      }
    }
  }
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    if (a3)
    {
      currentStrokeColor = self->_currentStrokeColor;
      self->_currentStrokeColor = 0;

      self->_unint64_t currentPointIndex = 0;
      self->_numberOfDrawnStrokes = 0;
      self->_double renderingStartTime = 0.0;
      self->_renderingDelay = 0.0;
      double v5 = [(ETGLSketchView *)self messageData];
      [v5 setDidDrawPoints:0];
      [v5 setDidEndWisping:0];
      double v6 = [v5 color];
      [(ETGLSketchView *)self beginStrokeWithColor:v6];

      [(ETGLSketchView *)self setPaused:0];
      if (IMOSLoggingEnabled())
      {
        double v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v8 = 0;
          _os_log_impl(&dword_23B55A000, v7, OS_LOG_TYPE_INFO, "message playback mode has begun", v8, 2u);
        }
      }
    }
  }
}

- (void)clear
{
  [(ETGLSketchView *)self setPlaying:0];
  [(ETGLSketchView *)self setPaused:1];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_23B55A000, v3, OS_LOG_TYPE_INFO, "Clearing Renderer", v6, 2u);
    }
  }
  [(ETGLSketchView *)self setGLContextAsCurrent];
  [(ETGLSketchRenderer *)self->_renderer erase];
  [(ETGLSketchRenderer *)self->_renderer reset];
  renderer = self->_renderer;
  self->_renderer = 0;

  [(ETGLSketchView *)self clearAllPoints];
  context = self->_context;
  self->_context = 0;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)ETGLSketchView;
  [(ETGLSketchView *)&v20 layoutSubviews];
  [(ETGLSketchView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(ETGLSketchView *)self contentScaleFactor];
  float v8 = 2.0 / (v7 * v4);
  [(ETGLSketchView *)self contentScaleFactor];
  float v10 = 2.0 / (v6 * v9);
  if (v8 < v10) {
    float v10 = v8;
  }
  double v11 = v4 / 156.0;
  float v12 = fmax(v11 * 0.7, 1.0) * v10;
  self->_unitSize = v12;
  renderer = self->_renderer;
  double v14 = [(ETGLSketchView *)self layer];
  [(ETGLSketchRenderer *)renderer resizeFromLayer:v14];

  [(ETGLSketchRenderer *)self->_renderer setUseFastVerticalWisp:self->_useFastVerticalWisp];
  double v15 = fmax(v11, 1.0);
  if (v15 > 3.0) {
    double v15 = 3.0;
  }
  [(ETGLSketchRenderer *)self->_renderer setLineWidthScaleFactor:v15];
  *(float *)&double v16 = self->_unitSize * 5.0;
  [(ETBoxcarFilterPointFIFO *)self->_smoothingFIFO setSpacing:v16];
  *(float *)&double v17 = self->_unitSize;
  [(ETQuadCurvePointFIFO *)self->_interpolatingFIFO setUnitSize:v17];
  *(float *)&double v18 = self->_unitSize * 5.0;
  [(ETBoxcarFilterPointFIFO *)self->_secondarySmoothingFIFO setSpacing:v18];
  *(float *)&double v19 = self->_unitSize;
  [(ETQuadCurvePointFIFO *)self->_secondaryInterpolatingFIFO setUnitSize:v19];
}

- (void)handleTapAtPosition:(CGPoint)a3
{
  if (!self->_playing)
  {
    CGFloat x = a3.x;
    CGFloat y = a3.y;
    -[ETSketchMessage addSketchPoint:](self->_messageData, "addSketchPoint:", a3.x, a3.y);
    a3.CGFloat x = x;
    a3.CGFloat y = y;
  }
  CGFloat v4 = a3.y;
  float32x2_t v7 = vcvt_f32_f64((float64x2_t)a3);
  [(ETGLSketchRenderer *)self->_renderer appendPointArray:&v7 length:1];
}

- (void)updateRendererWithPoints:(ETGLSketchView *)self count:(SEL)a2 controlPoint:flush:
{
  double v5 = v4;
  unint64_t v6 = v3;
  __p = 0;
  v49 = 0;
  uint64_t v50 = 0;
  if (v3)
  {
    uint64_t v8 = v2;
    double v9 = 0;
    uint64_t v10 = 0;
    do
    {
      if (v9 >= v50)
      {
        uint64_t v11 = (v9 - (unsigned char *)__p) >> 3;
        if ((unint64_t)(v11 + 1) >> 61) {
          _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        unint64_t v12 = (v50 - (unsigned char *)__p) >> 2;
        if (v12 <= v11 + 1) {
          unint64_t v12 = v11 + 1;
        }
        if ((unint64_t)(v50 - (unsigned char *)__p) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v13 = v12;
        }
        if (v13) {
          double v14 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&v50, v13);
        }
        else {
          double v14 = 0;
        }
        double v15 = &v14[8 * v11];
        *(void *)double v15 = *(void *)(v8 + 8 * v10);
        double v9 = v15 + 8;
        double v17 = (char *)__p;
        double v16 = v49;
        if (v49 != __p)
        {
          do
          {
            uint64_t v18 = *((void *)v16 - 1);
            v16 -= 8;
            *((void *)v15 - 1) = v18;
            v15 -= 8;
          }
          while (v16 != v17);
          double v16 = (char *)__p;
        }
        __p = v15;
        v49 = v9;
        uint64_t v50 = &v14[8 * v13];
        if (v16) {
          operator delete(v16);
        }
      }
      else
      {
        *(void *)double v9 = *(void *)(v8 + 8 * v10);
        v9 += 8;
      }
      v49 = v9;
      ++v10;
    }
    while (v10 != v6);
  }
  end = (char *)self->_vertexBatches.__end_;
  if (end >= self->_vertexBatches.__end_cap_.__value_)
  {
    objc_super v20 = (void *)_ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE21__push_back_slow_pathIRKS4_EEPS4_OT_((uint64_t *)&self->_vertexBatches, (uint64_t)&__p);
  }
  else
  {
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE22__construct_one_at_endB8ne180100IJRKS4_EEEvDpOT_((uint64_t)&self->_vertexBatches, (uint64_t)&__p);
    objc_super v20 = end + 24;
  }
  self->_vertexBatches.__end_ = v20;
  p_controlBatches = &self->_controlBatches;
  float32x4_t v22 = *(void **)self->_anon_278;
  unint64_t v23 = *(void *)&self->_anon_278[8];
  if ((unint64_t)v22 >= v23)
  {
    uint64_t v25 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)v22
        - p_controlBatches->var0;
    if ((unint64_t)(v25 + 1) >> 61) {
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v26 = v23 - (unint64_t)p_controlBatches->var0;
    uint64_t v27 = v26 >> 2;
    if (v26 >> 2 <= (unint64_t)(v25 + 1)) {
      uint64_t v27 = v25 + 1;
    }
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v28 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v28 = v27;
    }
    if (v28) {
      v29 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_278[8], v28);
    }
    else {
      v29 = 0;
    }
    v30 = (__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> **)&v29[8 * v25];
    v31 = &v29[8 * v28];
    *v30 = *v5;
    __int16 v24 = v30 + 1;
    var0 = p_controlBatches->var0;
    double v32 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_278;
    if (v32 != p_controlBatches->var0)
    {
      do
      {
        v34 = *--v32;
        *--v30 = v34;
      }
      while (v32 != var0);
      double v32 = p_controlBatches->var0;
    }
    p_controlBatches->var0 = v30;
    *(void *)self->_anon_278 = v24;
    *(void *)&self->_anon_278[8] = v31;
    if (v32) {
      operator delete(v32);
    }
  }
  else
  {
    *float32x4_t v22 = *v5;
    __int16 v24 = v22 + 1;
  }
  *(void *)self->_anon_278 = v24;
  p_vertexBatchCount = &self->_vertexBatchCount;
  v36 = self->_vertexBatchCount.__end_;
  value = self->_vertexBatchCount.__end_cap_.__value_;
  if (v36 >= value)
  {
    begin = p_vertexBatchCount->__begin_;
    uint64_t v40 = v36 - p_vertexBatchCount->__begin_;
    unint64_t v41 = v40 + 1;
    if ((unint64_t)(v40 + 1) >> 61) {
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v42 = (char *)value - (char *)begin;
    if (v42 >> 2 > v41) {
      unint64_t v41 = v42 >> 2;
    }
    if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v43 = v41;
    }
    if (v43)
    {
      v44 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_vertexBatchCount.__end_cap_, v43);
      begin = p_vertexBatchCount->__begin_;
      v36 = self->_vertexBatchCount.__end_;
    }
    else
    {
      v44 = 0;
    }
    v45 = (unint64_t *)&v44[8 * v40];
    double v46 = (unint64_t *)&v44[8 * v43];
    unint64_t *v45 = v6;
    v38 = v45 + 1;
    while (v36 != begin)
    {
      unint64_t v47 = *--v36;
      *--v45 = v47;
    }
    p_vertexBatchCount->__begin_ = v45;
    self->_vertexBatchCount.__end_ = v38;
    self->_vertexBatchCount.__end_cap_.__value_ = v46;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    unint64_t *v36 = v6;
    v38 = v36 + 1;
  }
  self->_vertexBatchCount.__end_ = v38;
  self->_vertexOffset += v6;
  if (__p)
  {
    v49 = (char *)__p;
    operator delete(__p);
  }
}

- (void)updateRendererWithSecondaryPoints:(ETGLSketchView *)self count:(SEL)a2 controlPoint:flush:
{
  int v6 = v5;
  float32x2_t v7 = v4;
  unint64_t v8 = v3;
  uint64_t v9 = v2;
  [(ETGLSketchView *)self setGLContextAsCurrent];
  p_secondaryVertexBatchCount = &self->_secondaryVertexBatchCount;
  end = self->_secondaryVertexBatchCount.__end_;
  value = self->_secondaryVertexBatchCount.__end_cap_.__value_;
  if (end >= value)
  {
    begin = p_secondaryVertexBatchCount->__begin_;
    uint64_t v18 = end - p_secondaryVertexBatchCount->__begin_;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 61) {
      _ZNKSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    uint64_t v20 = (char *)value - (char *)begin;
    if (v20 >> 2 > v19) {
      unint64_t v19 = v20 >> 2;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    double v15 = v7;
    if (v21)
    {
      float32x4_t v22 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv2_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_secondaryVertexBatchCount.__end_cap_, v21);
      begin = p_secondaryVertexBatchCount->__begin_;
      end = self->_secondaryVertexBatchCount.__end_;
    }
    else
    {
      float32x4_t v22 = 0;
    }
    unint64_t v23 = (unint64_t *)&v22[8 * v18];
    __int16 v24 = (unint64_t *)&v22[8 * v21];
    *unint64_t v23 = v8;
    double v16 = v23 + 1;
    while (end != begin)
    {
      unint64_t v25 = *--end;
      *--unint64_t v23 = v25;
    }
    p_secondaryVertexBatchCount->__begin_ = v23;
    self->_secondaryVertexBatchCount.__end_ = v16;
    self->_secondaryVertexBatchCount.__end_cap_.__value_ = v24;
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    double v15 = v7;
    unint64_t *end = v8;
    double v16 = end + 1;
  }
  self->_secondaryVertexBatchCount.__end_ = v16;
  if (v6)
  {
    uint64_t v26 = self->_vertexBatchCount.__begin_;
    uint64_t v27 = (char *)self->_vertexBatchCount.__end_ - (char *)v26;
    uint64_t v28 = (char *)v16 - (char *)p_secondaryVertexBatchCount->__begin_;
    uint64_t v29 = v28 >> 3;
    unint64_t v30 = (v28 >> 3) - 1;
    if (v30 < v27 >> 3)
    {
      unint64_t v31 = v8;
      uint64_t v32 = v9;
      uint64_t v33 = v15;
      uint64_t v34 = 0;
      uint64_t v44 = 600;
      uint64_t v45 = (v27 >> 3) - (v28 >> 3) + 2;
      uint64_t v42 = 528;
      uint64_t v43 = 624;
      uint64_t v35 = 24 * v29 - 24;
      uint64_t v36 = 8 * v29 - 8;
      do
      {
        *(float *)&double v11 = self->_unitSize;
        unint64_t v37 = v31;
        objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v42), "appendDualPointArray:length:controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:", *(void *)(*(char **)((char *)&self->super.super.super.isa + v44) + v35), *(unint64_t *)((char *)&v26[v34] + v36), v32, v31, v34, v45, *(double *)(*(char **)((char *)&self->super.super.super.isa + v43) + 8 * v34 + v36), *v33, v11, v42, v43, v44, v45);
        unint64_t v31 = v37;
        ++v34;
        uint64_t v26 = self->_vertexBatchCount.__begin_;
        v35 += 24;
      }
      while (v30 + v34 < self->_vertexBatchCount.__end_ - v26);
    }
  }
  else
  {
    uint64_t v38 = (char *)v16 - (char *)p_secondaryVertexBatchCount->__begin_;
    if ((unint64_t)v38 >= 9)
    {
      v39 = self->_controlBatches.var0[(v38 >> 3) - 1];
      renderer = self->_renderer;
      double v41 = *v15;
      *(float *)&double v11 = self->_unitSize;
      -[ETGLSketchRenderer appendDualPointArray:length:controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:](renderer, "appendDualPointArray:length:controlPoint:alternatePoints:alternateLength:alternateControlPoint:unitSize:segmentIndex:segmentCount:", *(double *)&v39, v41, v11);
    }
  }
}

- (void)handleSketchAtPosition:(CGPoint)a3
{
  double x = a3.x;
  double y = a3.y;
  [(ETGLSketchView *)self setGLContextAsCurrent];
  if (!self->_playing) {
    -[ETSketchMessage addSketchPoint:](self->_messageData, "addSketchPoint:", x, y);
  }
  v4.f64[0] = x;
  v4.f64[1] = y;
  float32x2_t v7 = vcvt_f32_f64(v4);
  [(ETPointFIFO *)self->_pointFIFO addPoints:&v7 count:1];
  [(ETPointFIFO *)self->_secondaryPointFIFO addPoints:&v7 count:1];
}

- (void)didCompleteStroke
{
  *(void *)self->_anon_278 = self->_controlBatches.var0;
  self->_vertexBatchCount.__end_ = self->_vertexBatchCount.__begin_;
  self->_secondaryVertexBatchCount.__end_ = self->_secondaryVertexBatchCount.__begin_;
}

- (void)clearAllPoints
{
  *(void *)self->_anon_278 = self->_controlBatches.var0;
  self->_vertexBatchCount.__end_ = self->_vertexBatchCount.__begin_;
  self->_secondaryVertexBatchCount.__end_ = self->_secondaryVertexBatchCount.__begin_;
}

- (void)sketchRendererDidReachVertexLimit:(id)a3
{
}

- (ETSketchMessage)messageData
{
  return self->_messageData;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)wispDelay
{
  return self->_wispDelay;
}

- (double)timestampForLastDrawnPoint
{
  return self->_timestampForLastDrawnPoint;
}

- (void)setTimestampForLastDrawnPoint:(double)a3
{
  self->_timestampForLastDrawnPoint = a3;
}

- (BOOL)playbackCompleted
{
  return self->_playbackCompleted;
}

- (void)setPlaybackCompleted:(BOOL)a3
{
  self->_playbackCompleted = a3;
}

- (BOOL)useFastVerticalWisp
{
  return self->_useFastVerticalWisp;
}

- (void)setUseFastVerticalWisp:(BOOL)a3
{
  self->_useFastVerticalWisp = a3;
}

- (EAGLContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (ETGLSketchRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
}

- (ETQuadCurvePointFIFO)interpolatingFIFO
{
  return self->_interpolatingFIFO;
}

- (void)setInterpolatingFIFO:(id)a3
{
}

- (ETBoxcarFilterPointFIFO)smoothingFIFO
{
  return self->_smoothingFIFO;
}

- (void)setSmoothingFIFO:(id)a3
{
}

- (ETPointFIFO)pointFIFO
{
  return self->_pointFIFO;
}

- (void)setPointFIFO:(id)a3
{
}

- (ETQuadCurvePointFIFO)secondaryInterpolatingFIFO
{
  return self->_secondaryInterpolatingFIFO;
}

- (void)setSecondaryInterpolatingFIFO:(id)a3
{
}

- (ETBoxcarFilterPointFIFO)secondarySmoothingFIFO
{
  return self->_secondarySmoothingFIFO;
}

- (void)setSecondarySmoothingFIFO:(id)a3
{
}

- (ETPointFIFO)secondaryPointFIFO
{
  return self->_secondaryPointFIFO;
}

- (void)setSecondaryPointFIFO:(id)a3
{
}

- (float)unitSize
{
  return self->_unitSize;
}

- (void)setUnitSize:(float)a3
{
  self->_unitSize = a3;
}

- (vector<std::vector<float)vertexBatches
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<std::vector<float __attribute__((ext_vector_type(2)))>, std::allocator<std::vector<float __attribute__((ext_vector_type(2)))>>> *)_ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE16__init_with_sizeB8ne180100IPS4_S8_EEvT_T0_m(retstr, (uint64_t)self->_vertexBatches.__begin_, (uint64_t)self->_vertexBatches.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)self->_vertexBatches.__end_ - (char *)self->_vertexBatches.__begin_) >> 3));
}

- (void)setVertexBatches:(vector<std::vector<float)__attribute__((ext_vector_type(2
{
  p_vertexBatches = &self->_vertexBatches;
  if (p_vertexBatches != a3) {
    _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE18__assign_with_sizeB8ne180100IPS4_S8_EEvT_T0_l((uint64_t)p_vertexBatches, (uint64_t)a3->__begin_, (uint64_t)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  }
}

- (vector<float)controlBatches
{
  v2[1] = 0;
  v2[2] = 0;
  void *v2 = 0;
  return (vector<float __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>>)_ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPS1_S6_EEvT_T0_m(v2, self->_controlBatches.var0, *(void *)self->_anon_278, (uint64_t)(*(void *)self->_anon_278 - (unint64_t)self->_controlBatches.var0) >> 3);
}

- (void)setControlBatches:(vector<float)__attribute__((ext_vector_type(2
{
  p_controlBatches = (char *)&self->_controlBatches;
  if (p_controlBatches != (char *)a3.var0) {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_controlBatches, *(char **)a3.var0, *((void *)a3.var0 + 1), (uint64_t)(*((void *)a3.var0 + 1) - (unint64_t)*a3.var0) >> 3);
  }
}

- (vector<unsigned)vertexBatchCount
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_vertexBatchCount.__begin_, (uint64_t)self->_vertexBatchCount.__end_, self->_vertexBatchCount.__end_- self->_vertexBatchCount.__begin_);
}

- (void)setVertexBatchCount:(vector<unsigned)long
{
  p_vertexBatchCount = (char *)&self->_vertexBatchCount;
  if (p_vertexBatchCount != (char *)a3) {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_vertexBatchCount, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (vector<unsigned)secondaryVertexBatchCount
{
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  return (vector<unsigned long, std::allocator<unsigned long>> *)std::vector<unsigned long>::__init_with_size[abi:ne180100]<unsigned long *,unsigned long *>(retstr, self->_secondaryVertexBatchCount.__begin_, (uint64_t)self->_secondaryVertexBatchCount.__end_, self->_secondaryVertexBatchCount.__end_- self->_secondaryVertexBatchCount.__begin_);
}

- (void)setSecondaryVertexBatchCount:(vector<unsigned)long
{
  p_secondaryVertexBatchCount = (char *)&self->_secondaryVertexBatchCount;
  if (p_secondaryVertexBatchCount != (char *)a3) {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(p_secondaryVertexBatchCount, (char *)a3->__begin_, (uint64_t)a3->__end_, a3->__end_ - a3->__begin_);
  }
}

- (unint64_t)vertexOffset
{
  return self->_vertexOffset;
}

- (void)setVertexOffset:(unint64_t)a3
{
  self->_vertexOffset = a3;
}

- (double)delayBetweenStrokes
{
  return self->_delayBetweenStrokes;
}

- (void)setDelayBetweenStrokes:(double)a3
{
  self->_delayBetweenStrokes = a3;
}

- (void).cxx_destruct
{
  p_secondaryVertexBatchCount = &self->_secondaryVertexBatchCount;
  begin = self->_secondaryVertexBatchCount.__begin_;
  if (begin)
  {
    p_secondaryVertexBatchCount->__end_ = begin;
    operator delete(begin);
  }
  int v5 = self->_vertexBatchCount.__begin_;
  if (v5)
  {
    self->_vertexBatchCount.__end_ = v5;
    operator delete(v5);
  }
  var0 = self->_controlBatches.var0;
  if (var0)
  {
    *(void *)self->_anon_278 = var0;
    operator delete(var0);
  }
  p_vertexBatches = &self->_vertexBatches;
  _ZNSt3__16vectorINS0_IDv2_fNS_9allocatorIS1_EEEENS2_IS4_EEE16__destroy_vectorclB8ne180100Ev((void ***)&p_vertexBatches);
  objc_storeStrong((id *)&self->_secondaryPointFIFO, 0);
  objc_storeStrong((id *)&self->_secondarySmoothingFIFO, 0);
  objc_storeStrong((id *)&self->_secondaryInterpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_pointFIFO, 0);
  objc_storeStrong((id *)&self->_smoothingFIFO, 0);
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_currentStrokeColor, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

- (id).cxx_construct
{
  *((void *)self + 76) = 0;
  *((void *)self + 77) = 0;
  *((void *)self + 75) = 0;
  *((void *)self + 79) = 0;
  *((void *)self + 80) = 0;
  *((void *)self + 78) = 0;
  *((void *)self + 82) = 0;
  *((void *)self + 83) = 0;
  *((void *)self + 81) = 0;
  *((void *)self + 85) = 0;
  *((void *)self + 86) = 0;
  *((void *)self + 84) = 0;
  return self;
}

@end