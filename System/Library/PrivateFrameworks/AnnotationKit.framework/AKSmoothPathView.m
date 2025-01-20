@interface AKSmoothPathView
+ (id)newSmoothPathViewForCurrentPlatformWithController:(id)a3;
- (AKBitmapFIFO)bitmapFifo;
- (AKController)controller;
- (AKSmoothPathView)initWithController:(id)a3;
- (AKSmoothPathView)initWithFrame:(CGRect)a3;
- (AKSmoothPathViewDelegate)delegate;
- (BOOL)_catchUpAccumulatedTouchesForRecognizer:(id)a3;
- (BOOL)applyModelBaseScaleFactorToStroke;
- (BOOL)disableSingleDotSpecialCase;
- (BOOL)hasShadow;
- (BOOL)isAddingPointWithoutSmoothing;
- (BOOL)isOpaque;
- (BOOL)prestrokedOutputMode;
- (BOOL)startedTouchDrawing;
- (CGRect)singleDotRect;
- (CHBoxcarFilterPointFIFO)smoothingFIFO;
- (CHPointStrokeFIFO)strokeFIFO;
- (CHQuadCurvePointFIFO)interpolatingFIFO;
- (UIColor)strokeColor;
- (__n128)_pointForRecognizer:(void *)a3;
- (__n128)_pointForTouch:(void *)a3;
- (double)_convertValueFromModelToSelf:(double)a3;
- (double)_effectiveStrokeWidthInModel;
- (double)_windowBackingScaleFactor;
- (double)cachedModelToViewScale;
- (double)currentWeight;
- (double)maxPressure;
- (double)maxThickness;
- (double)minPressure;
- (double)minThickness;
- (double)shadowRadiusInModel;
- (double)shadowRadiusInView;
- (double)singleDotCurrentSize;
- (double)strokeWidth;
- (double)weightForValue:(double)a3;
- (id)drawing;
- (void)_clear;
- (void)_setupFilterChainWithBitmapFifo:(BOOL)a3;
- (void)_setupShadowInContext:(CGContext *)a3;
- (void)_updateInterpolatingFifoLineWidth;
- (void)_updateShadowRadiusInView;
- (void)awakeFromNib;
- (void)callDelegate;
- (void)commonInit;
- (void)continueStroke:(AKSmoothPathView *)self;
- (void)continueStrokeWithoutSmoothing:(AKSmoothPathView *)self;
- (void)drawRect:(CGRect)a3;
- (void)handleDragAction:(id)a3;
- (void)handleForwardedEvent:(id)a3;
- (void)handleTapAction:(id)a3;
- (void)setApplyModelBaseScaleFactorToStroke:(BOOL)a3;
- (void)setBitmapFifo:(id)a3;
- (void)setCachedModelToViewScale:(double)a3;
- (void)setController:(id)a3;
- (void)setCurrentWeight:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableSingleDotSpecialCase:(BOOL)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setInterpolatingFIFO:(id)a3;
- (void)setIsAddingPointWithoutSmoothing:(BOOL)a3;
- (void)setMaxPressure:(double)a3;
- (void)setMaxThickness:(double)a3;
- (void)setMinPressure:(double)a3;
- (void)setMinThickness:(double)a3;
- (void)setPrestrokedOutputMode:(BOOL)a3;
- (void)setShadowRadiusInModel:(double)a3;
- (void)setShadowRadiusInView:(double)a3;
- (void)setSingleDotCurrentSize:(double)a3;
- (void)setSingleDotRect:(CGRect)a3;
- (void)setSmoothingFIFO:(id)a3;
- (void)setStartedTouchDrawing:(BOOL)a3;
- (void)setStrokeColor:(id)a3;
- (void)setStrokeFIFO:(id)a3;
- (void)setStrokeWidth:(double)a3;
- (void)startStroke;
- (void)teardown;
- (void)terminateStroke;
- (void)updateInterpolatingFifoUnitScale;
@end

@implementation AKSmoothPathView

+ (id)newSmoothPathViewForCurrentPlatformWithController:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithController:v3];

  return v4;
}

- (AKSmoothPathView)initWithController:(id)a3
{
  id v4 = a3;
  v5 = -[AKSmoothPathView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5) {
    [(AKSmoothPathView *)v5 setController:v4];
  }

  return v6;
}

- (AKSmoothPathView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKSmoothPathView;
  id v3 = -[AKSmoothPathView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(AKSmoothPathView *)v3 commonInit];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)AKSmoothPathView;
  [(AKSmoothPathView *)&v3 awakeFromNib];
  [(AKSmoothPathView *)self commonInit];
}

- (void)commonInit
{
  [(AKSmoothPathView *)self setUserInteractionEnabled:0];
  [(AKSmoothPathView *)self setMinPressure:0.015];
  [(AKSmoothPathView *)self setMaxPressure:0.25];
  [(AKSmoothPathView *)self setMinThickness:0.04];
  [(AKSmoothPathView *)self setMaxThickness:1.1];
  [(AKSmoothPathView *)self setCurrentWeight:1.0];
  [(AKSmoothPathView *)self setStartedTouchDrawing:0];
  [(AKSmoothPathView *)self setStrokeWidth:6.0];
  objc_super v3 = [MEMORY[0x263F1C550] akColorWithSRGBRed:0.705882353 green:0.88627451 blue:0.968627451 alpha:1.0];
  [(AKSmoothPathView *)self setStrokeColor:v3];

  [(AKSmoothPathView *)self setPrestrokedOutputMode:0];
}

- (void)teardown
{
  objc_super v3 = [(AKSmoothPathView *)self bitmapFifo];
  [v3 teardown];

  [(AKSmoothPathView *)self setBitmapFifo:0];
  [(AKSmoothPathView *)self setInterpolatingFIFO:0];
  [(AKSmoothPathView *)self setSmoothingFIFO:0];
  [(AKSmoothPathView *)self setStrokeFIFO:0];

  [(AKSmoothPathView *)self setDelegate:0];
}

- (void)_setupFilterChainWithBitmapFifo:(BOOL)a3
{
  if (a3)
  {
    id v4 = [[AKBitmapFIFO alloc] initWithFIFO:0];
    [(AKSmoothPathView *)self setBitmapFifo:v4];

    v5 = [(AKSmoothPathView *)self bitmapFifo];
    [v5 setView:self];

    objc_super v6 = [(AKSmoothPathView *)self bitmapFifo];
    [v6 setIsInLiveDraw:0];

    v7 = [(AKSmoothPathView *)self bitmapFifo];
    [v7 setBitmapSizeMultiplier:3.0];

    [(AKSmoothPathView *)self _updateShadowRadiusInView];
    v8 = (void *)[objc_alloc(MEMORY[0x263F35C98]) initWithFIFO:0 drawingTarget:0];
    [(AKSmoothPathView *)self setInterpolatingFIFO:v8];

    v9 = [(AKSmoothPathView *)self interpolatingFIFO];
    [v9 setEmitInterpolatedPoints:1];

    objc_initWeak(&location, self);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = sub_237696EE0;
    v26[3] = &unk_264CDB910;
    v10 = &v27;
    objc_copyWeak(&v27, &location);
    v11 = [(AKSmoothPathView *)self interpolatingFIFO];
    [v11 setEmissionHandler:v26];
  }
  else
  {
    v12 = [(AKSmoothPathView *)self bitmapFifo];
    [v12 teardown];

    [(AKSmoothPathView *)self setBitmapFifo:0];
    v13 = (void *)[objc_alloc(MEMORY[0x263F35C98]) initWithFIFO:0 drawingTarget:self];
    [(AKSmoothPathView *)self setInterpolatingFIFO:v13];

    v14 = [(AKSmoothPathView *)self interpolatingFIFO];
    [v14 setEmitInterpolatedPoints:0];

    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_237696FF0;
    v24[3] = &unk_264CDB910;
    v10 = &v25;
    objc_copyWeak(&v25, &location);
    v11 = [(AKSmoothPathView *)self interpolatingFIFO];
    [v11 setEmissionHandler:v24];
  }

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  [(AKSmoothPathView *)self updateInterpolatingFifoUnitScale];
  [(AKSmoothPathView *)self _updateInterpolatingFifoLineWidth];
  [(AKSmoothPathView *)self _windowBackingScaleFactor];
  double v16 = 1.0 / v15;
  id v17 = objc_alloc(MEMORY[0x263F35C80]);
  v18 = [(AKSmoothPathView *)self interpolatingFIFO];
  double v19 = v16 * 4.0;
  *(float *)&double v19 = v16 * 4.0;
  v20 = (void *)[v17 initWithFIFO:v18 width:3 spacing:v19];
  [(AKSmoothPathView *)self setSmoothingFIFO:v20];

  id v21 = objc_alloc(MEMORY[0x263F35C90]);
  v22 = [(AKSmoothPathView *)self smoothingFIFO];
  v23 = (void *)[v21 initWithFIFO:v22];
  [(AKSmoothPathView *)self setStrokeFIFO:v23];

  [(AKSmoothPathView *)self setStartedTouchDrawing:0];
}

- (void)updateInterpolatingFifoUnitScale
{
  [(AKSmoothPathView *)self _windowBackingScaleFactor];
  *(float *)&double v3 = v3;
  float v4 = 5.0 / *(float *)&v3;
  id v6 = [(AKSmoothPathView *)self interpolatingFIFO];
  *(float *)&double v5 = v4;
  [v6 setUnitScale:v5];
}

- (void)callDelegate
{
  if ([(AKSmoothPathView *)self prestrokedOutputMode])
  {
    double v3 = [(AKSmoothPathView *)self bitmapFifo];
    float v4 = (const CGPath *)[v3 newPathFromCurrentBitmap];
  }
  else
  {
    if (![(AKSmoothPathView *)self disableSingleDotSpecialCase])
    {
      CGFloat v5 = *MEMORY[0x263F001A8];
      CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 8);
      CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 16);
      CGFloat v8 = *(double *)(MEMORY[0x263F001A8] + 24);
      [(AKSmoothPathView *)self singleDotRect];
      v27.origin.x = v9;
      v27.origin.y = v10;
      v27.size.double width = v11;
      v27.size.double height = v12;
      v24.origin.x = v5;
      v24.origin.y = v6;
      v24.size.double width = v7;
      v24.size.double height = v8;
      if (!CGRectEqualToRect(v24, v27))
      {
        [(AKSmoothPathView *)self singleDotRect];
        float v4 = CGPathCreateWithEllipseInRect(v26, 0);
        int v14 = 1;
        if (!v4) {
          goto LABEL_18;
        }
        goto LABEL_7;
      }
    }
    v13 = [(AKSmoothPathView *)self interpolatingFIFO];
    float v4 = (const CGPath *)[v13 path];

    CGPathRetain(v4);
  }
  int v14 = 0;
  if (!v4) {
    goto LABEL_18;
  }
LABEL_7:
  if (!CGPathIsEmpty(v4))
  {
    CGRect BoundingBox = CGPathGetBoundingBox(v4);
    double width = BoundingBox.size.width;
    double height = BoundingBox.size.height;
    -[AKSmoothPathView convertRect:toView:](self, "convertRect:toView:", 0, 0.0, 0.0, 1.0, 1.0);
    if (width * v18 > 2.0 || height * v17 > 2.0)
    {
      int v20 = v14 | [(AKSmoothPathView *)self prestrokedOutputMode];
      id v21 = [(AKSmoothPathView *)self delegate];
      v22 = v21;
      if (v20 == 1) {
        [v21 inputView:self didCollectPrestrokedPath:v4];
      }
      else {
        [v21 inputView:self didCollectPath:v4];
      }
    }
  }
LABEL_18:
  CGPathRelease(v4);

  MEMORY[0x270F9A6D0](self, sel__clear);
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)setPrestrokedOutputMode:(BOOL)a3
{
  self->_prestrokedOutputMode = a3;
  [(AKSmoothPathView *)self setCurrentWeight:1.0];

  MEMORY[0x270F9A6D0](self, sel__setupFilterChainWithBitmapFifo_);
}

- (void)setStartedTouchDrawing:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_startedTouchDrawing != a3) {
    self->_startedTouchDrawing = a3;
  }
  id v4 = [(AKSmoothPathView *)self bitmapFifo];
  [v4 setIsInLiveDraw:v3];
}

- (void)setStrokeWidth:(double)a3
{
  if (self->_strokeWidth != a3)
  {
    self->_strokeWidth = a3;
    [(AKSmoothPathView *)self setApplyModelBaseScaleFactorToStroke:fabs(a3 + -1.0) >= 0.0005];
    [(AKSmoothPathView *)self _updateInterpolatingFifoLineWidth];
    [(AKSmoothPathView *)self updateInterpolatingFifoUnitScale];
  }
}

- (void)setHasShadow:(BOOL)a3
{
  self->_hasShadow = a3;
  double v4 = 0.0;
  if (a3)
  {
    CGFloat v5 = [(AKSmoothPathView *)self controller];
    CGFloat v6 = [v5 currentPageController];
    [v6 modelBaseScaleFactor];
    double v4 = v7 * 3.0;
  }
  [(AKSmoothPathView *)self setShadowRadiusInModel:v4];

  [(AKSmoothPathView *)self _updateShadowRadiusInView];
}

- (id)drawing
{
  v2 = [(AKSmoothPathView *)self strokeFIFO];
  BOOL v3 = [v2 strokes];

  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(AKSmoothPathView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v63.origin.CGFloat x = x;
  v63.origin.CGFloat y = y;
  CGFloat v56 = height;
  v63.size.CGFloat width = width;
  v63.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v63);
  v64.origin.CGFloat x = v9;
  v64.origin.CGFloat y = v11;
  v64.size.CGFloat width = v13;
  v64.size.CGFloat height = v15;
  if (v16 <= CGRectGetWidth(v64) * 0.9)
  {
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.CGFloat width = width;
    v65.size.CGFloat height = v56;
    double v17 = CGRectGetHeight(v65);
    v66.origin.CGFloat x = v9;
    v66.origin.CGFloat y = v11;
    v66.size.CGFloat width = v13;
    v66.size.CGFloat height = v15;
    if (v17 <= CGRectGetHeight(v66) * 0.9)
    {
      double v18 = [(AKSmoothPathView *)self controller];
      CGFloat v19 = v56;
      if ([v18 currentPageIndex] != 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([(AKSmoothPathView *)self hasShadow])
        {
          [(AKSmoothPathView *)self shadowRadiusInModel];
          if (v20 == 0.0) {
            [(AKSmoothPathView *)self setHasShadow:1];
          }
        }
        id v21 = [(AKSmoothPathView *)self _getPlatformCGContext];
        CGContextSaveGState(v21);
        if ([(AKSmoothPathView *)self hasShadow])
        {
          [(AKSmoothPathView *)self shadowRadiusInView];
          double v23 = v22;
          [(AKSmoothPathView *)self shadowRadiusInView];
          CGFloat v25 = v24 * -2.0;
          v67.origin.CGFloat x = x;
          v67.origin.CGFloat y = y;
          v67.size.CGFloat width = width;
          v67.size.CGFloat height = v19;
          CGRect v68 = CGRectInset(v67, v23 * -2.0, v25);
          CGFloat x = v68.origin.x;
          CGFloat y = v68.origin.y;
          CGFloat width = v68.size.width;
          CGFloat v19 = v68.size.height;
        }
        CGRect v26 = [MEMORY[0x263F1C550] clearColor];
        [v26 set];

        v69.origin.CGFloat x = x;
        v69.origin.CGFloat y = y;
        v69.size.CGFloat width = width;
        v69.size.CGFloat height = v19;
        CGContextFillRect(v21, v69);
        [(AKSmoothPathView *)self _updateInterpolatingFifoLineWidth];
        if ([(AKSmoothPathView *)self hasShadow])
        {
          [(AKSmoothPathView *)self _setupShadowInContext:v21];
          v70.origin.CGFloat x = x;
          v70.origin.CGFloat y = y;
          v70.size.CGFloat width = width;
          v70.size.CGFloat height = v19;
          CGContextBeginTransparencyLayerWithRect(v21, v70, 0);
        }
        CGContextSaveGState(v21);
        if ([(AKSmoothPathView *)self prestrokedOutputMode])
        {
          CGRect v27 = [(AKSmoothPathView *)self bitmapFifo];
          v28 = (CGImage *)[v27 currentBitmap];

          if (v28)
          {
            memset(&v62, 0, sizeof(v62));
            v29 = [(AKSmoothPathView *)self bitmapFifo];
            v30 = v29;
            if (v29) {
              [v29 viewToBitmapTransform];
            }
            else {
              memset(&v62, 0, sizeof(v62));
            }

            CGAffineTransform v60 = v62;
            memset(&v61, 0, sizeof(v61));
            CGAffineTransformInvert(&v61, &v60);
            CGAffineTransform transform = v61;
            CGContextConcatCTM(v21, &transform);
            v45 = [(AKSmoothPathView *)self bitmapFifo];
            [v45 bitmapRectInView];
            CGAffineTransform v58 = v62;
            CGRect v74 = CGRectApplyAffineTransform(v73, &v58);
            CGFloat v46 = v74.origin.x;
            CGFloat v47 = v74.origin.y;
            CGFloat v48 = v74.size.width;
            CGFloat v49 = v74.size.height;

            CGAffineTransform v57 = v62;
            v75.origin.CGFloat x = x;
            v75.origin.CGFloat y = y;
            v75.size.CGFloat width = width;
            v75.size.CGFloat height = v19;
            CGRect v76 = CGRectApplyAffineTransform(v75, &v57);
            CGFloat v50 = v76.origin.x;
            CGFloat v51 = v76.origin.y;
            CGFloat v52 = v76.size.width;
            CGFloat v53 = v76.size.height;
            v76.origin.CGFloat x = v46;
            v76.origin.CGFloat y = v47;
            v76.size.CGFloat width = v48;
            v76.size.CGFloat height = v49;
            CGContextClipToMask(v21, v76, v28);
            id v54 = [(AKSmoothPathView *)self strokeColor];
            CGContextSetFillColorWithColor(v21, (CGColorRef)[v54 CGColor]);

            v77.origin.CGFloat x = v50;
            v77.origin.CGFloat y = v51;
            v77.size.CGFloat width = v52;
            v77.size.CGFloat height = v53;
            CGContextFillRect(v21, v77);
          }
          v55 = [(AKSmoothPathView *)self bitmapFifo];
          [v55 resetDirtyRect];
        }
        else
        {
          if (self->_applyModelBaseScaleFactorToStroke) {
            double cachedModelToViewScale = self->_cachedModelToViewScale;
          }
          else {
            double cachedModelToViewScale = 1.0;
          }
          [(AKSmoothPathView *)self _effectiveStrokeWidthInModel];
          double v33 = v32;
          CGContextSetLineJoin(v21, kCGLineJoinRound);
          CGContextSetLineCap(v21, kCGLineCapSquare);
          CGContextSetLineWidth(v21, cachedModelToViewScale * v33);
          if ([(AKSmoothPathView *)self disableSingleDotSpecialCase]) {
            goto LABEL_20;
          }
          CGFloat v34 = *MEMORY[0x263F001A8];
          CGFloat v35 = *(double *)(MEMORY[0x263F001A8] + 8);
          CGFloat v36 = *(double *)(MEMORY[0x263F001A8] + 16);
          CGFloat v37 = *(double *)(MEMORY[0x263F001A8] + 24);
          [(AKSmoothPathView *)self singleDotRect];
          v78.origin.CGFloat x = v38;
          v78.origin.CGFloat y = v39;
          v78.size.CGFloat width = v40;
          v78.size.CGFloat height = v41;
          v71.origin.CGFloat x = v34;
          v71.origin.CGFloat y = v35;
          v71.size.CGFloat width = v36;
          v71.size.CGFloat height = v37;
          if (CGRectEqualToRect(v71, v78))
          {
LABEL_20:
            v42 = [(AKSmoothPathView *)self interpolatingFIFO];
            v43 = (const CGPath *)[v42 path];

            if (v43 && !CGPathIsEmpty(v43))
            {
              CGContextAddPath(v21, v43);
              id v44 = [(AKSmoothPathView *)self strokeColor];
              CGContextSetStrokeColorWithColor(v21, (CGColorRef)[v44 CGColor]);

              CGContextStrokePath(v21);
            }
          }
          else
          {
            [(AKSmoothPathView *)self singleDotRect];
            CGContextAddEllipseInRect(v21, v72);
            CGContextFillPath(v21);
          }
        }
        CGContextRestoreGState(v21);
        if ([(AKSmoothPathView *)self hasShadow]) {
          CGContextEndTransparencyLayer(v21);
        }
        CGContextRestoreGState(v21);
      }
    }
  }
}

- (void)startStroke
{
  [(AKSmoothPathView *)self setDisableSingleDotSpecialCase:0];
  [(AKSmoothPathView *)self setSingleDotCurrentSize:0.2];
  -[AKSmoothPathView setSingleDotRect:](self, "setSingleDotRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(AKSmoothPathView *)self _effectiveStrokeWidthInModel];
  self->_cachedEffectiveStrokeWidthInModel = v3;
  double v4 = self;
  CGFloat v5 = (double *)v4;
  if (v4->_applyModelBaseScaleFactorToStroke)
  {
    CGFloat v6 = [(AKSmoothPathView *)v4 controller];
    double v7 = [v6 currentPageController];
    objc_msgSend(v7, "convertRectFromModelToOverlay:", 0.0, 0.0, 1.0, 1.0);
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v16 = [v6 currentPageController];
    double v17 = [v16 overlayView];
    objc_msgSend(v17, "convertRect:toView:", v5, v9, v11, v13, v15);
    double v19 = v18;
    double v21 = v20;

    if (v19 < v21) {
      double v19 = v21;
    }
  }
  else
  {
    double v19 = 1.0;
  }

  v5[52] = v19;
  [v5 setStartedTouchDrawing:1];
  double v22 = [v5 delegate];
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    id v24 = [v5 delegate];
    [v24 inputViewWillStartDrawing:v5];
  }
}

- (void)continueStroke:(AKSmoothPathView *)self
{
}

- (void)continueStrokeWithoutSmoothing:(AKSmoothPathView *)self
{
  -[AKSmoothPathView setIsAddingPointWithoutSmoothing:](self, "setIsAddingPointWithoutSmoothing:", 1, v2);
  double v4 = [(CHQuadCurvePointFIFO *)self->_interpolatingFIFO emissionHandler];
  ((void (**)(void, long long *, uint64_t, void, void))v4)[2](v4, &v5, 1, 0, 0);

  [(AKSmoothPathView *)self setIsAddingPointWithoutSmoothing:0];
}

- (void)terminateStroke
{
  [(CHPointStrokeFIFO *)self->_strokeFIFO flush];
  [(AKBitmapFIFO *)self->_bitmapFifo flush];
  [(AKSmoothPathView *)self setStartedTouchDrawing:0];
  dispatch_time_t v3 = dispatch_time(0, 10000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_237697EB8;
  block[3] = &unk_264CDB628;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

- (void)handleForwardedEvent:(id)a3
{
}

- (void)handleTapAction:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 3)
  {
    [(AKSmoothPathView *)self startStroke];
    [(AKSmoothPathView *)self _pointForRecognizer:v4];
    [(AKSmoothPathView *)self continueStrokeWithoutSmoothing:"continueStrokeWithoutSmoothing:"];
    [(AKSmoothPathView *)self terminateStroke];
  }
}

- (BOOL)_catchUpAccumulatedTouchesForRecognizer:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = [v4 accumulatedTouches];
  [v4 resetAccumulatedTouches];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        -[AKSmoothPathView _pointForTouch:](self, "_pointForTouch:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        -[AKSmoothPathView continueStroke:](self, "continueStroke:");
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  BOOL v10 = [v6 count] != 0;
  return v10;
}

- (void)handleDragAction:(id)a3
{
  id v5 = a3;
  switch([v5 state])
  {
    case 1:
      [(AKSmoothPathView *)self startStroke];
      BOOL v4 = [(AKSmoothPathView *)self _catchUpAccumulatedTouchesForRecognizer:v5];
      goto LABEL_5;
    case 2:
      BOOL v4 = [(AKSmoothPathView *)self _catchUpAccumulatedTouchesForRecognizer:v5];
LABEL_5:
      if (!v4)
      {
        [(AKSmoothPathView *)self _pointForRecognizer:v5];
        -[AKSmoothPathView continueStroke:](self, "continueStroke:");
      }
      break;
    case 3:
      if (![(AKSmoothPathView *)self _catchUpAccumulatedTouchesForRecognizer:v5])
      {
        [(AKSmoothPathView *)self _pointForRecognizer:v5];
        -[AKSmoothPathView continueStroke:](self, "continueStroke:");
      }
      goto LABEL_2;
    case 4:
    case 5:
LABEL_2:
      [(AKSmoothPathView *)self terminateStroke];
      break;
    default:
      break;
  }
}

- (double)weightForValue:(double)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2376982D0;
  block[3] = &unk_264CDB628;
  block[4] = self;
  if (qword_2689252F8 != -1) {
    dispatch_once(&qword_2689252F8, block);
  }
  double v4 = (*(double *)&qword_268925318 - *(double *)&qword_268925310)
     / (*(double *)&qword_268925308 - *(double *)&qword_268925300);
  double v5 = *(double *)&qword_268925310 + v4 * (a3 - *(double *)&qword_268925300);
  if (v5 <= *(double *)&qword_268925318) {
    double v6 = *(double *)&qword_268925310 + v4 * (a3 - *(double *)&qword_268925300);
  }
  else {
    double v6 = *(double *)&qword_268925318;
  }
  if (v5 >= *(double *)&qword_268925310) {
    return v6;
  }
  else {
    return *(double *)&qword_268925310;
  }
}

- (void)_clear
{
  [(CHPointStrokeFIFO *)self->_strokeFIFO clear];
  [(AKBitmapFIFO *)self->_bitmapFifo clear];

  [(AKSmoothPathView *)self setNeedsDisplay];
}

- (void)_setupShadowInContext:(CGContext *)a3
{
  id v17 = [(AKSmoothPathView *)self controller];
  double v5 = [v17 currentPageController];
  uint64_t v6 = [v5 currentModelToScreenExifOrientation];

  int64_t v7 = +[AKGeometryHelper inverseExifOrientation:v6];
  [(AKSmoothPathView *)self shadowRadiusInModel];
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", v7, 0.0, -v8, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(AKSmoothPathView *)self shadowRadiusInModel];
  CGFloat v14 = v13;
  id v15 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.3];
  double v16 = (CGColor *)[v15 CGColor];
  v19.CGFloat width = v10;
  v19.CGFloat height = v12;
  CGContextSetShadowWithColor(a3, v19, v14, v16);
}

- (void)_updateShadowRadiusInView
{
  [(AKSmoothPathView *)self shadowRadiusInModel];
  double v4 = v3;
  double v5 = 0.0;
  if (v4 != 0.0)
  {
    [(AKSmoothPathView *)self shadowRadiusInModel];
    -[AKSmoothPathView _convertValueFromModelToSelf:](self, "_convertValueFromModelToSelf:");
    -[AKSmoothPathView setShadowRadiusInView:](self, "setShadowRadiusInView:");
    [(AKSmoothPathView *)self shadowRadiusInView];
    double v5 = v6 + v6;
  }
  [(AKSmoothPathView *)self setShadowRadiusInView:v5];
  int64_t v7 = [(AKSmoothPathView *)self bitmapFifo];

  if (v7)
  {
    [(AKSmoothPathView *)self shadowRadiusInView];
    double v9 = v8;
    id v10 = [(AKSmoothPathView *)self bitmapFifo];
    [v10 setShadowRadiusInView:v9];
  }
}

- (double)_effectiveStrokeWidthInModel
{
  [(AKSmoothPathView *)self strokeWidth];
  double v4 = v3;
  if (self->_applyModelBaseScaleFactorToStroke)
  {
    double v5 = [(AKSmoothPathView *)self controller];
    double v6 = [v5 currentPageController];
    [v6 modelBaseScaleFactor];
    double v8 = v7;

    double v9 = 1.0;
    if (v8 > 0.0) {
      double v9 = v8;
    }
    double v4 = v4 * v9;
  }
  return v4;
}

- (double)_convertValueFromModelToSelf:(double)a3
{
  double v5 = [(AKSmoothPathView *)self controller];
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  double v8 = [v5 currentPageController];
  objc_msgSend(v8, "convertPointFromModelToOverlay:", a3, 0.0);
  double v10 = v9;
  double v12 = v11;

  double v13 = [v5 currentPageController];
  objc_msgSend(v13, "convertPointFromModelToOverlay:", v6, v7);
  double v15 = v14;
  double v17 = v16;

  double v18 = [v5 currentPageController];
  CGSize v19 = [v18 overlayView];
  objc_msgSend(v19, "convertPoint:toView:", self, v10, v12);
  double v21 = v20;
  double v23 = v22;

  id v24 = [v5 currentPageController];
  CGFloat v25 = [v24 overlayView];
  objc_msgSend(v25, "convertPoint:toView:", self, v15, v17);
  double v27 = v26;
  double v29 = v28;

  double v30 = vabdd_f64(v21, v27);
  double v31 = vabdd_f64(v23, v29);
  if (v30 >= v31) {
    double v32 = v30;
  }
  else {
    double v32 = v31;
  }

  return v32;
}

- (__n128)_pointForTouch:(void *)a3
{
  id v4 = a3;
  [v4 locationInView:a1];
  double v6 = v5;
  double v8 = v7;
  [v4 maximumPossibleForce];
  if (v9 == 0.0)
  {
    double v14 = 1.0;
  }
  else
  {
    [v4 force];
    double v11 = v10;
    [v4 maximumPossibleForce];
    [a1 weightForValue:v11 / v12];
    double v14 = v13;
  }
  [a1 setCurrentWeight:v14];
  *(float *)&unsigned int v15 = v6;
  *(float *)&unsigned int v16 = v8;
  *(float *)&unsigned int v17 = v14;
  *(void *)&long long v18 = __PAIR64__(v16, v15);
  *((void *)&v18 + 1) = v17;
  long long v20 = v18;

  return (__n128)v20;
}

- (__n128)_pointForRecognizer:(void *)a3
{
  id v4 = a3;
  [v4 locationInView:a1];
  double v6 = v5;
  double v8 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 currentMaxWeight];
    if (v9 == 0.0)
    {
      double v14 = 1.0;
    }
    else
    {
      [v4 currentWeight];
      double v11 = v10;
      [v4 currentMaxWeight];
      [a1 weightForValue:v11 / v12];
      double v14 = v13;
    }
  }
  else
  {
    objc_opt_class();
    double v14 = 1.0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v15 = (objc_class *)objc_opt_class();
      unsigned int v16 = NSStringFromClass(v15);
      NSLog(&cfstr_SUnexpectedGes.isa, "-[AKSmoothPathView _pointForRecognizer:]", v16);
    }
  }
  [a1 setCurrentWeight:v14];
  *(float *)&unsigned int v17 = v6;
  *(float *)&unsigned int v18 = v8;
  *(float *)&unsigned int v19 = v14;
  *(void *)&long long v20 = __PAIR64__(v18, v17);
  *((void *)&v20 + 1) = v19;
  long long v22 = v20;

  return (__n128)v22;
}

- (double)_windowBackingScaleFactor
{
  double v3 = [(AKSmoothPathView *)self window];
  id v4 = [v3 screen];

  if (v4)
  {
    double v5 = [(AKSmoothPathView *)self window];
    double v6 = [v5 screen];
    [v6 scale];
    double v8 = v7;
  }
  else
  {
    double v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 scale];
    double v8 = v9;
  }

  return v8;
}

- (void)_updateInterpolatingFifoLineWidth
{
  double v3 = 0.0;
  if (![(AKSmoothPathView *)self prestrokedOutputMode])
  {
    [(AKSmoothPathView *)self _effectiveStrokeWidthInModel];
    double v5 = v4;
    [(AKSmoothPathView *)self shadowRadiusInModel];
    [(AKSmoothPathView *)self _convertValueFromModelToSelf:(v6 + v6) * 1.25 + v5 * 1.75];
    double v3 = v7;
  }
  id v8 = [(AKSmoothPathView *)self interpolatingFIFO];
  [v8 setLineWidth:v3];
}

- (AKController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (AKController *)WeakRetained;
}

- (void)setController:(id)a3
{
}

- (AKSmoothPathViewDelegate)delegate
{
  return (AKSmoothPathViewDelegate *)objc_getProperty(self, a2, 440, 1);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)prestrokedOutputMode
{
  return self->_prestrokedOutputMode;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (void)setStrokeColor:(id)a3
{
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (BOOL)hasShadow
{
  return self->_hasShadow;
}

- (BOOL)applyModelBaseScaleFactorToStroke
{
  return self->_applyModelBaseScaleFactorToStroke;
}

- (void)setApplyModelBaseScaleFactorToStroke:(BOOL)a3
{
  self->_applyModelBaseScaleFactorToStroke = a3;
}

- (BOOL)startedTouchDrawing
{
  return self->_startedTouchDrawing;
}

- (BOOL)isAddingPointWithoutSmoothing
{
  return self->_isAddingPointWithoutSmoothing;
}

- (void)setIsAddingPointWithoutSmoothing:(BOOL)a3
{
  self->_isAddingPointWithoutSmoothing = a3;
}

- (CGRect)singleDotRect
{
  objc_copyStruct(v6, &self->_singleDotRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setSingleDotRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_singleDotRect, &v3, 32, 1, 0);
}

- (double)shadowRadiusInModel
{
  return self->_shadowRadiusInModel;
}

- (void)setShadowRadiusInModel:(double)a3
{
  self->_shadowRadiusInModel = a3;
}

- (double)shadowRadiusInView
{
  return self->_shadowRadiusInView;
}

- (void)setShadowRadiusInView:(double)a3
{
  self->_shadowRadiusInView = a3;
}

- (double)cachedModelToViewScale
{
  return self->_cachedModelToViewScale;
}

- (void)setCachedModelToViewScale:(double)a3
{
  self->_double cachedModelToViewScale = a3;
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

- (CHPointStrokeFIFO)strokeFIFO
{
  return self->_strokeFIFO;
}

- (void)setStrokeFIFO:(id)a3
{
}

- (CHBoxcarFilterPointFIFO)smoothingFIFO
{
  return self->_smoothingFIFO;
}

- (void)setSmoothingFIFO:(id)a3
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

- (double)currentWeight
{
  return self->_currentWeight;
}

- (void)setCurrentWeight:(double)a3
{
  self->_currentWeight = a3;
}

- (BOOL)disableSingleDotSpecialCase
{
  return self->_disableSingleDotSpecialCase;
}

- (void)setDisableSingleDotSpecialCase:(BOOL)a3
{
  self->_disableSingleDotSpecialCase = a3;
}

- (double)singleDotCurrentSize
{
  return self->_singleDotCurrentSize;
}

- (void)setSingleDotCurrentSize:(double)a3
{
  self->_singleDotCurrentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmapFifo, 0);
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_smoothingFIFO, 0);
  objc_storeStrong((id *)&self->_strokeFIFO, 0);
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_destroyWeak((id *)&self->_controller);
}

@end