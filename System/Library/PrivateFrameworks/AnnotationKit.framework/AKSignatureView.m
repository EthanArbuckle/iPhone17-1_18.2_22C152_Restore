@interface AKSignatureView
- (AKBitmapFIFO)bitmapFifo;
- (AKSignatureView)initWithCoder:(id)a3;
- (AKSignatureView)initWithFrame:(CGRect)a3;
- (AKSignatureViewLiveDelegate)liveDelegate;
- (BOOL)ak_forceAvailableForTouch:(id)a3;
- (BOOL)isAddingPointWithoutSmoothing;
- (CGPath)copyStrokedInterpolatedPath;
- (CGPoint)strokeLastLocation;
- (CGPoint)strokeStartLocation;
- (CGRect)aggregateInvalid;
- (CGRect)unionDrawingRect;
- (CHBoxcarFilterPointFIFO)boxcarFIFO;
- (CHPointStrokeFIFO)strokeFIFO;
- (CHQuadCurvePointFIFO)interpolatingFIFO;
- (UIColor)strokeColor;
- (double)_windowBackingScaleFactor;
- (double)currentWeight;
- (double)interfaceScale;
- (double)maxPressure;
- (double)maxThickness;
- (double)minPressure;
- (double)minThickness;
- (double)strokeStartTime;
- (double)weightForTouch:(id)a3;
- (double)weightForValue:(double)a3;
- (unint64_t)totalPointsAdded;
- (void)_commonInit;
- (void)_forceRedisplay;
- (void)clear;
- (void)continueStroke:(AKSignatureView *)self;
- (void)continueStrokeWithoutSmoothing:(AKSignatureView *)self;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)handleCoalescedTouches:(id)a3 forTouch:(id)a4;
- (void)setAggregateInvalid:(CGRect)a3;
- (void)setBitmapFifo:(id)a3;
- (void)setBoxcarFIFO:(id)a3;
- (void)setCurrentWeight:(double)a3;
- (void)setFrame:(CGRect)a3;
- (void)setInterpolatingFIFO:(id)a3;
- (void)setIsAddingPointWithoutSmoothing:(BOOL)a3;
- (void)setLiveDelegate:(id)a3;
- (void)setMaxPressure:(double)a3;
- (void)setMaxThickness:(double)a3;
- (void)setMinPressure:(double)a3;
- (void)setMinThickness:(double)a3;
- (void)setNeedsDisplayInRect:(CGRect)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeFIFO:(id)a3;
- (void)setStrokeLastLocation:(CGPoint)a3;
- (void)setStrokeStartLocation:(CGPoint)a3;
- (void)setStrokeStartTime:(double)a3;
- (void)setTotalPointsAdded:(unint64_t)a3;
- (void)setUnionDrawingRect:(CGRect)a3;
- (void)startStroke:(AKSignatureView *)self;
- (void)teardown;
- (void)terminateStroke;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AKSignatureView

- (AKSignatureView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKSignatureView;
  v3 = -[AKSignatureView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AKSignatureView *)v3 _commonInit];
  }
  return v4;
}

- (AKSignatureView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKSignatureView;
  v3 = [(AKSignatureView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AKSignatureView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  [(AKSignatureView *)self setClearsContextBeforeDrawing:0];
  [(AKSignatureView *)self setOpaque:1];
  [(AKSignatureView *)self setContentMode:3];
  v3 = [MEMORY[0x263F1C550] blackColor];
  [(AKSignatureView *)self setStrokeColor:v3];

  [(AKSignatureView *)self setCurrentWeight:2.0];
  CGSize v4 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_accumulatedSignatureDirtyRect.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_accumulatedSignatureDirtyRect.size = v4;
  [(AKSignatureView *)self setMinPressure:0.0034];
  [(AKSignatureView *)self setMaxPressure:0.45];
  [(AKSignatureView *)self setMinThickness:0.56];
  [(AKSignatureView *)self setMaxThickness:3.0];
  v5 = [[AKBitmapFIFO alloc] initWithFIFO:0];
  bitmapFifo = self->_bitmapFifo;
  self->_bitmapFifo = v5;

  [(AKBitmapFIFO *)self->_bitmapFifo setView:self];
  [(AKBitmapFIFO *)self->_bitmapFifo setIsInLiveDraw:0];
  [(AKBitmapFIFO *)self->_bitmapFifo setBitmapSizeMultiplier:3.0];
  v7 = (CHQuadCurvePointFIFO *)[objc_alloc(MEMORY[0x263F35C98]) initWithFIFO:0];
  interpolatingFIFO = self->_interpolatingFIFO;
  self->_interpolatingFIFO = v7;

  [(CHQuadCurvePointFIFO *)self->_interpolatingFIFO setEmitInterpolatedPoints:1];
  objc_initWeak(&location, self);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  v19 = sub_237655090;
  v20 = &unk_264CDB4A0;
  objc_copyWeak(&v21, &location);
  [(CHQuadCurvePointFIFO *)self->_interpolatingFIFO setEmissionHandler:&v17];
  [(AKSignatureView *)self _windowBackingScaleFactor];
  *(float *)&double v9 = v9;
  float v10 = 1.0 / *(float *)&v9;
  *(float *)&double v9 = (float)(1.0 / *(float *)&v9) * 5.0;
  [(CHQuadCurvePointFIFO *)self->_interpolatingFIFO setUnitScale:v9];
  id v11 = objc_alloc(MEMORY[0x263F35C80]);
  *(float *)&double v12 = v10 * 4.0;
  v13 = (CHBoxcarFilterPointFIFO *)[v11 initWithFIFO:self->_interpolatingFIFO width:3 spacing:v12];
  boxcarFIFO = self->_boxcarFIFO;
  self->_boxcarFIFO = v13;

  v15 = (CHPointStrokeFIFO *)[objc_alloc(MEMORY[0x263F35C90]) initWithFIFO:self->_boxcarFIFO];
  strokeFIFO = self->_strokeFIFO;
  self->_strokeFIFO = v15;

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AKSignatureView;
  [(AKSignatureView *)&v2 dealloc];
}

- (void)teardown
{
  v3 = [(AKSignatureView *)self bitmapFifo];
  [v3 teardown];

  [(AKSignatureView *)self setBitmapFifo:0];
  [(AKSignatureView *)self setInterpolatingFIFO:0];
  [(AKSignatureView *)self setBoxcarFIFO:0];
  [(AKSignatureView *)self setStrokeFIFO:0];

  [(AKSignatureView *)self setStrokeColor:0];
}

- (CGPath)copyStrokedInterpolatedPath
{
  objc_super v2 = [(AKSignatureView *)self bitmapFifo];
  v3 = (CGPath *)[v2 newPathFromCurrentBitmap];

  return v3;
}

- (double)_windowBackingScaleFactor
{
  v3 = [(AKSignatureView *)self window];
  CGSize v4 = [v3 screen];

  if (v4)
  {
    v5 = [(AKSignatureView *)self window];
    objc_super v6 = [v5 screen];
    [v6 scale];
    double v8 = v7;
  }
  else
  {
    v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 scale];
    double v8 = v9;
  }

  return v8;
}

- (double)interfaceScale
{
  return 2.0;
}

- (void)setStrokeColor:(id)a3
{
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  p_accumulatedSignatureDirtyRect = &self->_accumulatedSignatureDirtyRect;
  self->_accumulatedSignatureDirtyRect = CGRectUnion(self->_accumulatedSignatureDirtyRect, a3);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (Current - self->_lastSetNeedsDisplayCallToSuperTime > 0.0166666667)
  {
    self->_lastSetNeedsDisplayCallToSuperTime = Current;
    v7.receiver = self;
    v7.super_class = (Class)AKSignatureView;
    -[AKSignatureView setNeedsDisplayInRect:](&v7, sel_setNeedsDisplayInRect_, p_accumulatedSignatureDirtyRect->origin.x, p_accumulatedSignatureDirtyRect->origin.y, p_accumulatedSignatureDirtyRect->size.width, p_accumulatedSignatureDirtyRect->size.height);
    CGSize v6 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
    p_accumulatedSignatureDirtyRect->origin = (CGPoint)*MEMORY[0x263F001A0];
    p_accumulatedSignatureDirtyRect->size = v6;
  }
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(AKSignatureView *)self totalPointsAdded])
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextSetFillColorWithColor(CurrentContext, [(UIColor *)self->_strokeColor CGColor]);
    double v9 = [(AKSignatureView *)self bitmapFifo];
    float v10 = (CGImage *)[v9 currentBitmap];

    if (v10)
    {
      memset(&v25, 0, sizeof(v25));
      id v11 = [(AKSignatureView *)self bitmapFifo];
      double v12 = v11;
      if (v11) {
        [v11 viewToBitmapTransform];
      }
      else {
        memset(&v25, 0, sizeof(v25));
      }

      CGAffineTransform v23 = v25;
      memset(&v24, 0, sizeof(v24));
      CGAffineTransformInvert(&v24, &v23);
      CGAffineTransform v23 = v24;
      CGContextConcatCTM(CurrentContext, &v23);
      v13 = [(AKSignatureView *)self bitmapFifo];
      [v13 bitmapRectInView];
      CGAffineTransform v23 = v25;
      CGRect v27 = CGRectApplyAffineTransform(v26, &v23);
      CGFloat v14 = v27.origin.x;
      CGFloat v15 = v27.origin.y;
      CGFloat v16 = v27.size.width;
      CGFloat v17 = v27.size.height;

      CGAffineTransform v23 = v25;
      v28.origin.CGFloat x = x;
      v28.origin.CGFloat y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      CGRect v29 = CGRectApplyAffineTransform(v28, &v23);
      CGFloat v18 = v29.origin.x;
      CGFloat v19 = v29.origin.y;
      CGFloat v20 = v29.size.width;
      CGFloat v21 = v29.size.height;
      v29.origin.CGFloat x = v14;
      v29.origin.CGFloat y = v15;
      v29.size.CGFloat width = v16;
      v29.size.CGFloat height = v17;
      CGContextClipToMask(CurrentContext, v29, v10);
      v30.origin.CGFloat x = v18;
      v30.origin.CGFloat y = v19;
      v30.size.CGFloat width = v20;
      v30.size.CGFloat height = v21;
      CGContextFillRect(CurrentContext, v30);
    }
    CGContextRestoreGState(CurrentContext);
    v22 = [(AKSignatureView *)self bitmapFifo];
    [v22 resetDirtyRect];
  }
}

- (void)clear
{
  [(CHPointStrokeFIFO *)self->_strokeFIFO clear];
  [(AKBitmapFIFO *)self->_bitmapFifo clear];
  [(AKSignatureView *)self _forceRedisplay];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveDelegate);
  [WeakRetained signatureViewSignatureUpdated:self];
}

- (void)_forceRedisplay
{
  self->_lastSetNeedsDisplayCallToSuperTime = 0.0;
  [(AKSignatureView *)self setNeedsDisplay];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AKSignatureView;
  -[AKSignatureView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(AKSignatureView *)self setNeedsDisplay];
}

- (void)startStroke:(AKSignatureView *)self
{
  double v5 = v2;
  [(AKSignatureView *)self setStrokeStartTime:CFAbsoluteTimeGetCurrent()];
  [(AKSignatureView *)self setStrokeLastLocation:vcvtq_f64_f32(*(float32x2_t *)&v5)];
  [(AKSignatureView *)self strokeLastLocation];
  -[AKSignatureView setStrokeStartLocation:](self, "setStrokeStartLocation:");
  [(AKSignatureView *)self setTotalPointsAdded:0];
  strokeFIFO = self->_strokeFIFO;

  [(CHPointStrokeFIFO *)strokeFIFO addPoint:v5];
}

- (void)continueStroke:(AKSignatureView *)self
{
  double v5 = *(double *)&v2;
  [(AKSignatureView *)self setStrokeLastLocation:vcvtq_f64_f32(v2)];
  strokeFIFO = self->_strokeFIFO;

  [(CHPointStrokeFIFO *)strokeFIFO addPoint:v5];
}

- (void)continueStrokeWithoutSmoothing:(AKSignatureView *)self
{
  -[AKSignatureView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 1, v2);
  objc_super v4 = [(CHQuadCurvePointFIFO *)self->_interpolatingFIFO emissionHandler];
  ((void (**)(void, long long *, uint64_t, void, void))v4)[2](v4, &v5, 1, 0, 0);

  [(AKSignatureView *)self setIsAddingPointWithoutSmoothing:0];
}

- (void)terminateStroke
{
  [(CHPointStrokeFIFO *)self->_strokeFIFO flush];
  double Current = CFAbsoluteTimeGetCurrent();
  [(AKSignatureView *)self strokeStartTime];
  double v5 = v4;
  if ([(AKSignatureView *)self totalPointsAdded] <= 9)
  {
    double v6 = Current - v5;
    if (Current - v5 > 0.0 && v6 < 0.2)
    {
      [(AKSignatureView *)self strokeStartLocation];
      double v8 = v7;
      double v10 = v9;
      [(AKSignatureView *)self strokeLastLocation];
      double v12 = v11;
      double v14 = v13;
      +[AKGeometryHelper distanceBetweenPoints:andPoint:](AKGeometryHelper, "distanceBetweenPoints:andPoint:", v8, v10, v11, v13);
      double v16 = v15;
      double v6 = 15.0;
      if (v16 < 15.0)
      {
        if (v16 > 0.0)
        {
          +[AKGeometryHelper normalizeVectorPoint:](AKGeometryHelper, "normalizeVectorPoint:", v12 - v8, v14 - v10);
          double v8 = v8 + v16 * v17 * 0.5;
          double v10 = v10 + v16 * v18 * 0.5;
        }
        [(AKSignatureView *)self currentWeight];
        *(float *)&unsigned int v19 = v8;
        *(float *)&unsigned int v20 = v10;
        [(AKSignatureView *)self continueStrokeWithoutSmoothing:COERCE_DOUBLE(__PAIR64__(v20, v19))];
      }
    }
  }
  [(AKBitmapFIFO *)self->_bitmapFifo flush];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2376559AC;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (double)weightForValue:(double)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_237655B0C;
  block[3] = &unk_264CDAE40;
  block[4] = self;
  if (qword_268925188 != -1) {
    dispatch_once(&qword_268925188, block);
  }
  double v4 = (*(double *)&qword_268925180 - *(double *)&qword_268925178)
     / (*(double *)&qword_268925170 - *(double *)&qword_268925168);
  double v5 = *(double *)&qword_268925178 + v4 * (a3 - *(double *)&qword_268925168);
  if (v5 <= *(double *)&qword_268925180) {
    double v6 = *(double *)&qword_268925178 + v4 * (a3 - *(double *)&qword_268925168);
  }
  else {
    double v6 = *(double *)&qword_268925180;
  }
  if (v5 >= *(double *)&qword_268925178) {
    return v6;
  }
  else {
    return *(double *)&qword_268925178;
  }
}

- (BOOL)ak_forceAvailableForTouch:(id)a3
{
  [a3 maximumPossibleForce];
  return v3 != 0.0;
}

- (double)weightForTouch:(id)a3
{
  id v4 = a3;
  double v5 = 2.0;
  if ([(AKSignatureView *)self ak_forceAvailableForTouch:v4])
  {
    [v4 force];
    double v7 = v6;
    [v4 maximumPossibleForce];
    [(AKSignatureView *)self weightForValue:v7 / v8];
    double v5 = v9;
  }

  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v11 = [a3 anyObject];
  [v11 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  [(AKSignatureView *)self weightForTouch:v11];
  -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:");
  *(float *)&unsigned int v9 = v6;
  *(float *)&unsigned int v10 = v8;
  [(AKSignatureView *)self startStroke:COERCE_DOUBLE(__PAIR64__(v10, v9))];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v14 = a4;
  double v6 = [a3 anyObject];
  [v6 locationInView:self];
  double v8 = v7;
  double v10 = v9;
  if (objc_opt_respondsToSelector())
  {
    id v11 = [v14 coalescedTouchesForTouch:v6];
    [(AKSignatureView *)self handleCoalescedTouches:v11 forTouch:v6];
  }
  else
  {
    [(AKSignatureView *)self weightForTouch:v6];
    -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:");
    *(float *)&unsigned int v12 = v8;
    *(float *)&unsigned int v13 = v10;
    [(AKSignatureView *)self continueStroke:COERCE_DOUBLE(__PAIR64__(v13, v12))];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v14 = a4;
  double v6 = [a3 anyObject];
  [v6 locationInView:self];
  double v8 = v7;
  double v10 = v9;
  if (objc_opt_respondsToSelector())
  {
    id v11 = [v14 coalescedTouchesForTouch:v6];
    [(AKSignatureView *)self handleCoalescedTouches:v11 forTouch:v6];
  }
  else
  {
    [(AKSignatureView *)self weightForTouch:v6];
    -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:");
    *(float *)&unsigned int v12 = v8;
    *(float *)&unsigned int v13 = v10;
    [(AKSignatureView *)self continueStroke:COERCE_DOUBLE(__PAIR64__(v13, v12))];
  }
  [(AKSignatureView *)self terminateStroke];
}

- (void)handleCoalescedTouches:(id)a3 forTouch:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 locationInView:self];
        double v12 = v11;
        double v14 = v13;
        [(AKSignatureView *)self weightForTouch:v10];
        -[AKSignatureView setCurrentWeight:](self, "setCurrentWeight:");
        *(float *)&unsigned int v15 = v12;
        *(float *)&unsigned int v16 = v14;
        [(AKSignatureView *)self continueStroke:COERCE_DOUBLE(__PAIR64__(v16, v15))];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
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

- (unint64_t)totalPointsAdded
{
  return self->_totalPointsAdded;
}

- (void)setTotalPointsAdded:(unint64_t)a3
{
  self->_totalPointsAdded = a3;
}

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (CGPoint)strokeStartLocation
{
  objc_copyStruct(v4, &self->_strokeStartLocation, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CGFloat y = v3;
  result.CGFloat x = v2;
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
  result.CGFloat y = v3;
  result.CGFloat x = v2;
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

- (CHPointStrokeFIFO)strokeFIFO
{
  return self->_strokeFIFO;
}

- (void)setStrokeFIFO:(id)a3
{
}

- (CHBoxcarFilterPointFIFO)boxcarFIFO
{
  return self->_boxcarFIFO;
}

- (void)setBoxcarFIFO:(id)a3
{
}

- (CHQuadCurvePointFIFO)interpolatingFIFO
{
  return self->_interpolatingFIFO;
}

- (void)setInterpolatingFIFO:(id)a3
{
}

- (AKBitmapFIFO)bitmapFifo
{
  return self->_bitmapFifo;
}

- (void)setBitmapFifo:(id)a3
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

- (AKSignatureViewLiveDelegate)liveDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_liveDelegate);

  return (AKSignatureViewLiveDelegate *)WeakRetained;
}

- (void)setLiveDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_liveDelegate);
  objc_storeStrong((id *)&self->_bitmapFifo, 0);
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_boxcarFIFO, 0);
  objc_storeStrong((id *)&self->_strokeFIFO, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);

  objc_storeStrong(&self->_trackingTouchID, 0);
}

@end