@interface AKInkOverlayView
+ (CGRect)_convertRect:(CGRect)a3 fromPageControllerModelSpace:(id)a4 toDrawingInCanvasViewSpace:(id)a5;
+ (id)newAKInkOverlayViewForCurrentPlatformWithPageController:(id)a3 drawingUndoTarget:(id)a4;
+ (id)newDrawingUndoTargetWithPageController:(id)a3;
- (AKInkOverlayView)initWithFrame:(CGRect)a3;
- (AKInkOverlayView)initWithPageController:(id)a3 drawingUndoTarget:(id)a4;
- (AKInkOverlayViewDelegate)delegate;
- (AKPageController)pageController;
- (BOOL)_canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4;
- (BOOL)canvasNeedsUpdate;
- (CGRect)previousPageRectInAKModel;
- (CGSize)canvasSizeInPKDrawingSpace;
- (PKCanvasView)canvasView;
- (PKInk)ink;
- (PKRulerHostingDelegate)rulerHostingDelegate;
- (UIGestureRecognizer)drawingGestureRecognizer;
- (UIGestureRecognizer)pinchGestureRecognizer;
- (id)drawingUndoTarget;
- (id)updatedDrawingForPageRectUpdate;
- (void)_calculateFixedPixelSize:(CGSize *)a3 drawingScale:(double *)a4;
- (void)_canvasView:(id)a3 beganStroke:(id)a4;
- (void)_canvasView:(id)a3 cancelledStroke:(id)a4;
- (void)_canvasView:(id)a3 endedStroke:(id)a4;
- (void)_updateCanvasViewInk;
- (void)_updatedSelectedStrokesWithColor:(id)a3;
- (void)awakeFromNib;
- (void)canvasViewDidBeginDrawing:(id)a3;
- (void)canvasViewDidEndDrawing:(id)a3;
- (void)canvasViewDrawingDidChange:(id)a3;
- (void)commonInit;
- (void)commonPostInit;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)removeStrokesFromDrawing:(id)a3;
- (void)setCanvasSizeInPKDrawingSpace:(CGSize)a3;
- (void)setCanvasView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDrawingUndoTarget:(id)a3;
- (void)setInk:(id)a3;
- (void)setPageController:(id)a3;
- (void)setPreviousPageRectInAKModel:(CGRect)a3;
- (void)setRulerHostingDelegate:(id)a3;
- (void)setupInkView;
- (void)teardown;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation AKInkOverlayView

+ (id)newAKInkOverlayViewForCurrentPlatformWithPageController:(id)a3 drawingUndoTarget:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPageController:v6 drawingUndoTarget:v5];

  return v7;
}

+ (id)newDrawingUndoTargetWithPageController:(id)a3
{
  id v3 = a3;
  v4 = [[_AKInkOverlayDrawingUndoTarget alloc] initWithPageController:v3];

  return v4;
}

- (AKInkOverlayView)initWithPageController:(id)a3 drawingUndoTarget:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = -[AKInkOverlayView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    [(AKInkOverlayView *)v8 setPageController:v6];
    [(AKInkOverlayView *)v9 setDrawingUndoTarget:v7];
    [(AKInkOverlayView *)v9 commonPostInit];
  }

  return v9;
}

- (AKInkOverlayView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKInkOverlayView;
  id v3 = -[AKInkOverlayView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(AKInkOverlayView *)v3 commonInit];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)AKInkOverlayView;
  [(AKInkOverlayView *)&v3 awakeFromNib];
  [(AKInkOverlayView *)self commonInit];
}

- (void)commonInit
{
  objc_super v3 = (NSHashTable *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:10];
  reportedStrokes = self->_reportedStrokes;
  self->_reportedStrokes = v3;

  CGSize v5 = *(CGSize *)(MEMORY[0x263F001A0] + 16);
  self->_previousPageRectInAKModel.origin = (CGPoint)*MEMORY[0x263F001A0];
  self->_previousPageRectInAKModel.size = v5;
}

- (void)commonPostInit
{
  objc_super v3 = [(AKInkOverlayView *)self pageController];
  v4 = [v3 controller];
  CGSize v5 = [v4 attributeController];
  id v12 = [v5 ink];

  if (!v12
    || ([v12 identifier],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        id v7 = v12,
        !v6))
  {
    NSLog(&cfstr_SInvalidInitia.isa, "-[AKInkOverlayView commonPostInit]");
    v8 = (void *)MEMORY[0x263F14B48];
    uint64_t v9 = *MEMORY[0x263F14CA8];
    v10 = [MEMORY[0x263F1C550] blackColor];
    uint64_t v11 = [v8 inkWithIdentifier:v9 color:v10 weight:0.0];

    id v7 = (id)v11;
  }
  id v13 = v7;
  [(AKInkOverlayView *)self setInk:v7];
}

- (void)teardown
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(AKInkOverlayView *)self canvasView];
  [v4 setDelegate:0];

  CGSize v5 = [(AKInkOverlayView *)self canvasView];
  [v5 removeFromSuperview];

  [(AKInkOverlayView *)self setCanvasView:0];

  [(AKInkOverlayView *)self setDelegate:0];
}

- (PKInk)ink
{
  return self->_ink;
}

- (void)setInk:(id)a3
{
  p_ink = &self->_ink;
  id v7 = a3;
  if (([v7 isEqual:*p_ink] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_ink, a3);
    [(AKInkOverlayView *)self _updateCanvasViewInk];
  }
  if (-[PKInk _isLassoInk](*p_ink, "_isLassoInk") && [v7 _isLassoInk])
  {
    objc_super v6 = [v7 color];
    [(AKInkOverlayView *)self _updatedSelectedStrokesWithColor:v6];
  }

  MEMORY[0x270F9A758]();
}

- (void)_updateCanvasViewInk
{
  objc_super v3 = [(AKInkOverlayView *)self canvasView];

  if (v3)
  {
    id v5 = [(AKInkOverlayView *)self ink];
    v4 = [(AKInkOverlayView *)self canvasView];
    [v4 setInk:v5];
  }
}

- (void)_updatedSelectedStrokesWithColor:(id)a3
{
  id v6 = a3;
  v4 = [(AKInkOverlayView *)self canvasView];

  if (v4)
  {
    id v5 = [(AKInkOverlayView *)self canvasView];
    [v5 _setSelectedStrokesColor:v6];
  }
}

- (void)removeStrokesFromDrawing:(id)a3
{
  id v4 = a3;
  id v13 = [(AKInkOverlayView *)self canvasView];
  id v5 = [v13 drawing];
  id v6 = [v5 strokes];
  id v7 = (void *)[v6 mutableCopy];

  [v7 minusOrderedSet:v4];
  id v8 = objc_alloc(MEMORY[0x263F14AE0]);
  uint64_t v9 = (void *)[v7 copy];
  v10 = [(AKInkOverlayView *)self canvasView];
  uint64_t v11 = [v10 drawing];
  id v12 = (void *)[v8 initWithStrokes:v9 fromDrawing:v11];
  [v13 setDrawing:v12];
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = [(AKInkOverlayView *)self canvasView];
  if (v4)
  {
    id v5 = v4;
    [v4 setDelegate:0];
    [v5 setDrawingUndoTarget:0];
    [(AKInkOverlayView *)self setCanvasView:0];
    id v4 = v5;
  }
}

- (void)didMoveToSuperview
{
  objc_super v3 = [(AKInkOverlayView *)self superview];

  if (v3)
  {
    [(AKInkOverlayView *)self bounds];
    if (!+[AKGeometryHelper isUnpresentableRect:](AKGeometryHelper, "isUnpresentableRect:"))
    {
      MEMORY[0x270F9A6D0](self, sel_setupInkView);
    }
  }
}

- (void)setupInkView
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(AKInkOverlayView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v36 = *MEMORY[0x263F001B0];
  double v35 = 1.0;
  if (+[AKGeometryHelper isUnpresentableRect:v3])
  {
    __asm { FMOV            V0.2D, #5.0 }
    long long v36 = _Q0;
    double v6 = 0.0;
    double v10 = 5.0;
    double v8 = 5.0;
    double v4 = 0.0;
  }
  else
  {
    [(AKInkOverlayView *)self _calculateFixedPixelSize:&v36 drawingScale:&v35];
  }
  id v16 = objc_alloc(MEMORY[0x263F14AD0]);
  v17 = objc_msgSend(v16, "initWithFrame:fixedPixelSize:drawingScale:layerFixedPixelSize:", 1, v4, v6, v8, v10, v36, v35);
  [(AKInkOverlayView *)self setCanvasView:v17];
  [v17 setOpaque:0];
  [v17 setDelegate:self];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);
  if (WeakRetained) {
    [v17 setRulerHostingDelegate:WeakRetained];
  }
  [v17 setOverrideUserInterfaceStyle:1];
  [(AKInkOverlayView *)self _updateCanvasViewInk];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [v17 layer];
  objc_msgSend(v19, "setAnchorPoint:", 0.5, 0.5);

  memset(&v34, 0, sizeof(v34));
  CGAffineTransformMakeScale(&v34, 1.0, -1.0);
  CGAffineTransform v33 = v34;
  [v17 setTransform:&v33];
  objc_msgSend(v17, "setFrame:", v4, v6, v8, v10);
  v20 = [(AKInkOverlayView *)self drawingUndoTarget];
  [v17 setDrawingUndoTarget:v20];

  [v17 setDrawingUndoSelector:sel_performUndo_];
  [(AKInkOverlayView *)self addSubview:v17];
  v21 = [v17 centerXAnchor];
  v22 = [(AKInkOverlayView *)self centerXAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  [v23 setActive:1];

  v24 = [v17 centerYAnchor];
  v25 = [(AKInkOverlayView *)self centerYAnchor];
  v26 = [v24 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [v17 widthAnchor];
  v28 = [(AKInkOverlayView *)self widthAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v29 setActive:1];

  v30 = [v17 heightAnchor];
  v31 = [(AKInkOverlayView *)self heightAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  [v32 setActive:1];

  [MEMORY[0x263F158F8] commit];
}

- (BOOL)canvasNeedsUpdate
{
  [(AKInkOverlayView *)self previousPageRectInAKModel];
  if (CGRectIsNull(v24))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    double v4 = [(AKInkOverlayView *)self pageController];
    [v4 maxPageRect];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(AKInkOverlayView *)self previousPageRectInAKModel];
    v28.origin.x = v13;
    v28.origin.y = v14;
    v28.size.width = v15;
    v28.size.height = v16;
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    BOOL v3 = !CGRectEqualToRect(v25, v28);
  }
  v17 = [(AKInkOverlayView *)self canvasView];
  if (v17)
  {
    v18 = [(AKInkOverlayView *)self canvasView];
    [v18 _fixedPixelSize];
    if (v19 == 5.0)
    {
      v20 = [(AKInkOverlayView *)self canvasView];
      [v20 frame];
      if (CGRectGetWidth(v26) <= 10.0)
      {
        BOOL v22 = 0;
      }
      else
      {
        v21 = [(AKInkOverlayView *)self canvasView];
        [v21 frame];
        BOOL v22 = CGRectGetHeight(v27) > 10.0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v3 || v22;
}

- (id)updatedDrawingForPageRectUpdate
{
  [(AKInkOverlayView *)self previousPageRectInAKModel];
  if (CGRectIsNull(v52))
  {
    BOOL v3 = [(AKInkOverlayView *)self canvasView];
    double v4 = [v3 drawing];
  }
  else
  {
    BOOL v3 = [(AKInkOverlayView *)self pageController];
    double v5 = objc_opt_class();
    [(AKInkOverlayView *)self previousPageRectInAKModel];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    CGFloat v14 = [(AKInkOverlayView *)self canvasView];
    objc_msgSend(v5, "_convertRect:fromPageControllerModelSpace:toDrawingInCanvasViewSpace:", v3, v14, v7, v9, v11, v13);
    CGFloat v16 = v15;
    CGFloat recta = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v23 = objc_opt_class();
    [v3 maxPageRect];
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    v32 = [(AKInkOverlayView *)self canvasView];
    objc_msgSend(v23, "_convertRect:fromPageControllerModelSpace:toDrawingInCanvasViewSpace:", v3, v32, v25, v27, v29, v31);
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;

    v53.origin.x = v16;
    v53.origin.y = v18;
    v53.size.width = v20;
    v53.size.height = v22;
    double MinX = CGRectGetMinX(v53);
    v54.origin.x = v34;
    v54.origin.y = v36;
    v54.size.width = v38;
    v54.size.height = v40;
    CGFloat v42 = MinX - CGRectGetMinX(v54);
    v55.origin.x = recta;
    v55.origin.y = v18;
    v55.size.width = v20;
    v55.size.height = v22;
    double MinY = CGRectGetMinY(v55);
    v56.origin.x = v34;
    v56.origin.y = v36;
    v56.size.width = v38;
    v56.size.height = v40;
    CGFloat v44 = CGRectGetMinY(v56);
    memset(&v50, 0, sizeof(v50));
    CGAffineTransformMakeTranslation(&v50, v42, MinY - v44);
    v45 = [(AKInkOverlayView *)self canvasView];
    v46 = [v45 drawing];
    CGAffineTransform rect_8 = v50;
    double v4 = [v46 drawingByApplyingTransform:&rect_8];
  }

  return v4;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)AKInkOverlayView;
  [(AKInkOverlayView *)&v9 layoutSubviews];
  BOOL v3 = [(AKInkOverlayView *)self pageController];
  if ([(AKInkOverlayView *)self canvasNeedsUpdate])
  {
    long long v8 = *MEMORY[0x263F001B0];
    double v7 = 1.0;
    [(AKInkOverlayView *)self _calculateFixedPixelSize:&v8 drawingScale:&v7];
    double v4 = [(AKInkOverlayView *)self canvasView];
    [v4 _setFixedPixelSize:v8 drawingScale:v7];

    double v5 = [(AKInkOverlayView *)self updatedDrawingForPageRectUpdate];
    double v6 = [(AKInkOverlayView *)self canvasView];
    [v6 setDrawing:v5];

    [v3 updateOverlayViewLayers];
  }
  [v3 maxPageRect];
  -[AKInkOverlayView setPreviousPageRectInAKModel:](self, "setPreviousPageRectInAKModel:");
}

- (void)setRulerHostingDelegate:(id)a3
{
  id v6 = a3;
  objc_storeWeak((id *)&self->_rulerHostingDelegate, v6);
  double v4 = [(AKInkOverlayView *)self canvasView];

  if (v4)
  {
    double v5 = [(AKInkOverlayView *)self canvasView];
    [v5 setRulerHostingDelegate:v6];
  }
}

- (void)_calculateFixedPixelSize:(CGSize *)a3 drawingScale:(double *)a4
{
  double v7 = *MEMORY[0x263F001B0];
  double v8 = *(double *)(MEMORY[0x263F001B0] + 8);
  objc_super v9 = [(AKInkOverlayView *)self pageController];
  double v10 = [v9 controller];
  double v11 = [MEMORY[0x263F086E0] mainBundle];
  double v12 = [v11 bundleIdentifier];
  char v13 = [v12 isEqualToString:@"com.apple.ScreenshotServicesService"];

  CGFloat v14 = self;
  [v9 maxPageRect];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [v10 akModelToCanvasFixedPixelScaleOfFirstEncounteredPage];
  CGFloat v24 = v23;
  [v10 screenPixelsToCanvasPixelsDownscale];
  if (v24 == 0.0)
  {
    double v26 = [MEMORY[0x263F086E0] mainBundle];
    double v27 = [v26 bundleIdentifier];
    int v28 = [v27 isEqualToString:@"com.apple.iBooks"];

    double v29 = v8;
    double v30 = v7;
    if (v28)
    {
      double v31 = v16;
      v32 = [(AKInkOverlayView *)v14 window];
      double v33 = [v32 screen];
      [v33 scale];
      double v35 = v34;

      double v36 = fmax(v35, 1.0);
      [(AKInkOverlayView *)v14 bounds];
      if (v37 >= v38) {
        double v39 = v38;
      }
      else {
        double v39 = v37;
      }
      if (v39 > 0.0 && v39 < 768.0)
      {
        double v40 = 768.0 / v39;
        double v37 = v37 * v40;
        double v38 = v38 * v40;
      }
      double v30 = v36 * v37;
      double v29 = v36 * v38;
      CGFloat v16 = v31;
    }
    if (v30 == v7 && v29 == v8)
    {
      [(AKInkOverlayView *)v14 bounds];
      +[AKGeometryHelper convertRect:fromViewToScreenPixels:useNativeScale:](AKGeometryHelper, "convertRect:fromViewToScreenPixels:useNativeScale:", v14, 1);
    }
    double v42 = v29 * v30;
    double v43 = 1.0;
    double v79 = v8;
    double v44 = v7;
    CGFloat v45 = v16;
    CGFloat v46 = v22;
    if (v29 * v30 > 5595136.0)
    {
      double v42 = sqrt(v42);
      double v43 = 2365.40398 / v42;
      double v30 = v30 * (2365.40398 / v42);
      double v29 = v29 * (2365.40398 / v42);
    }
    double v47 = round(v30);
    double v48 = round(v29);
    BOOL v49 = +[AKGeometryHelper exifOrientationHasReversedAxes:](AKGeometryHelper, "exifOrientationHasReversedAxes:", objc_msgSend(v9, "currentModelToScreenExifOrientation", v42, *(void *)&v79));
    if (v49) {
      double v50 = v47;
    }
    else {
      double v50 = v48;
    }
    double v81 = v50;
    if (v49) {
      double v47 = v48;
    }
    v83.origin.x = v45;
    v83.origin.y = v18;
    v83.size.width = v20;
    v83.size.height = v46;
    [v10 setAkModelToCanvasFixedPixelScaleOfFirstEncounteredPage:v47 / CGRectGetWidth(v83)];
    [v10 setScreenPixelsToCanvasPixelsDownscale:v43];
    double v7 = v44;
    double v8 = v80;
  }
  else
  {
    double v43 = v25;
    CGAffineTransformMakeScale(&v82, v24, v24);
    v84.origin.x = v16;
    v84.origin.y = v18;
    v84.size.width = v20;
    v84.size.height = v22;
    CGRect v85 = CGRectApplyAffineTransform(v84, &v82);
    double v47 = round(v85.size.width);
    double v81 = round(v85.size.height);
  }
  v51 = [v9 pageModelController];
  CGRect v52 = [v51 inkCanvasAnnotation];

  double v53 = v7;
  double v54 = v8;
  if (v52)
  {
    objc_msgSend(v52, "drawingSize", v7, v8);
    double v56 = v55;
    double v58 = v57;
    BOOL v59 = +[AKGeometryHelper isUnpresentableSize:](AKGeometryHelper, "isUnpresentableSize:");
    if (v59) {
      double v53 = v7;
    }
    else {
      double v53 = v56;
    }
    if (v59) {
      double v54 = v8;
    }
    else {
      double v54 = v58;
    }
  }
  if (v53 == v7 && v54 == v8)
  {
    if (v13)
    {
      [v10 akModelToCanvasFixedPixelScaleOfFirstEncounteredPage];
      double v62 = v64;
    }
    else
    {
      v67 = [(AKInkOverlayView *)v14 window];
      v68 = [v67 screen];
      [v68 bounds];
      double v70 = v69;
      double v72 = v71;

      if (v70 >= v72) {
        double v73 = v72;
      }
      else {
        double v73 = v70;
      }
      double v74 = v73 / 768.0;
      v75 = [(AKInkOverlayView *)v14 window];
      v76 = [v75 screen];
      [v76 nativeScale];
      double v78 = v74 * v77;

      double v62 = v43 * v78;
    }
    CGFloat v63 = v81;
    -[AKInkOverlayView setCanvasSizeInPKDrawingSpace:](v14, "setCanvasSizeInPKDrawingSpace:", v47 / v62, v81 / v62);
  }
  else if (v13)
  {
    [v10 akModelToCanvasFixedPixelScaleOfFirstEncounteredPage];
    double v62 = v61;
    CGFloat v63 = v81;
  }
  else
  {
    double v65 = v47 / v53;
    CGFloat v63 = v81;
    double v66 = v81 / v54;
    if (v65 >= v66) {
      double v62 = v65;
    }
    else {
      double v62 = v66;
    }
  }
  if (a3)
  {
    a3->width = v47;
    a3->height = v63;
  }
  if (a4) {
    *a4 = v62;
  }
}

+ (CGRect)_convertRect:(CGRect)a3 fromPageControllerModelSpace:(id)a4 toDrawingInCanvasViewSpace:(id)a5
{
  if (a4 && a5)
  {
    double height = a3.size.height;
    double width = a3.size.width;
    double y = a3.origin.y;
    double x = a3.origin.x;
    memset(&v31, 0, sizeof(v31));
    id v10 = a5;
    id v11 = a4;
    [v10 drawingTransform];
    CGAffineTransformInvert(&v31, &v30);
    objc_msgSend(v11, "convertRectFromModelToOverlay:", x, y, width, height);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    CGFloat v20 = [v11 overlayView];

    objc_msgSend(v20, "convertRect:toView:", v10, v13, v15, v17, v19);
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;

    CGAffineTransform v29 = v31;
    v32.origin.double x = v22;
    v32.origin.double y = v24;
    v32.size.double width = v26;
    v32.size.double height = v28;
    return CGRectApplyAffineTransform(v32, &v29);
  }
  else
  {
    return *(CGRect *)*(void *)&MEMORY[0x263F001A8];
  }
}

- (BOOL)_canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4
{
  id v5 = a4;
  id v6 = [(AKInkOverlayView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 inputViewCanBeginDrawing:self withTouch:v5];
  }
  else {
    char v7 = 1;
  }

  return v7;
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  id v12 = a3;
  double v4 = [(AKInkOverlayView *)self delegate];
  [v4 inputViewDidBeginStroke:self];

  id v5 = [(AKInkOverlayView *)self pageController];
  id v6 = [v5 controller];

  char v7 = [v6 modernToolbarView];
  double v8 = [(AKInkOverlayView *)self window];
  objc_super v9 = [v8 firstResponder];
  if (v9)
  {
  }
  else
  {
    char v10 = [v7 shouldHide];

    if ((v10 & 1) == 0) {
      [v12 becomeFirstResponder];
    }
  }
  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:qword_268923718 object:v6];
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  double v4 = off_268923710;
  id v5 = [(AKInkOverlayView *)self pageController];
  id v6 = [v5 controller];
  [v7 postNotificationName:v4 object:v6];
}

- (void)_canvasView:(id)a3 beganStroke:(id)a4
{
  id v5 = a4;
  id v8 = [(AKInkOverlayView *)self pageController];
  id v6 = [v8 controller];
  id v7 = [v6 sidecarController];
  [v7 handleLiveStrokeBegan:v5 onInkOverlayView:self];
}

- (void)_canvasView:(id)a3 endedStroke:(id)a4
{
  id v6 = [(AKInkOverlayView *)self pageController];
  double v4 = [v6 controller];
  id v5 = [v4 sidecarController];
  [v5 handleLiveStrokeComplete:1];
}

- (void)_canvasView:(id)a3 cancelledStroke:(id)a4
{
  double v4 = [(AKInkOverlayView *)self pageController];
  id v7 = [v4 controller];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:qword_268923720 object:v7];

  id v6 = [v7 sidecarController];
  [v6 handleLiveStrokeComplete:0];
}

- (void)canvasViewDrawingDidChange:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AKInkOverlayView *)self pageController];
  id v6 = [v5 controller];
  id v7 = [v6 undoController];
  id v8 = [v7 undoManager];

  int v9 = [v8 isUndoRegistrationEnabled];
  if (v9) {
    [v8 disableUndoRegistration];
  }
  char v10 = [v4 drawing];
  if (v10)
  {
    int v22 = v9;
    id v11 = objc_opt_new();
    id v12 = [v10 strokes];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          if (![(NSHashTable *)self->_reportedStrokes containsObject:v17])
          {
            [(NSHashTable *)self->_reportedStrokes addObject:v17];
            [v11 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }
    id v18 = objc_alloc(MEMORY[0x263F14AE0]);
    double v19 = (void *)[v11 copy];
    CGFloat v20 = (void *)[v18 initWithStrokes:v19 fromDrawing:v10];

    double v21 = [(AKInkOverlayView *)self delegate];
    [v21 inputView:self didCollectDrawingForAnalysis:v20];

    int v9 = v22;
  }
  if (v9) {
    [v8 enableUndoRegistration];
  }
}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  v2 = [(AKInkOverlayView *)self canvasView];
  BOOL v3 = [v2 drawingGestureRecognizer];

  return (UIGestureRecognizer *)v3;
}

- (UIGestureRecognizer)pinchGestureRecognizer
{
  v2 = [(AKInkOverlayView *)self canvasView];
  BOOL v3 = [v2 pinchGestureRecognizer];

  return (UIGestureRecognizer *)v3;
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (id)drawingUndoTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_drawingUndoTarget);

  return WeakRetained;
}

- (void)setDrawingUndoTarget:(id)a3
{
}

- (PKCanvasView)canvasView
{
  return (PKCanvasView *)objc_getProperty(self, a2, 440, 1);
}

- (void)setCanvasView:(id)a3
{
}

- (AKInkOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKInkOverlayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)canvasSizeInPKDrawingSpace
{
  objc_copyStruct(v4, &self->_canvasSizeInPKDrawingSpace, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setCanvasSizeInPKDrawingSpace:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_canvasSizeInPKDrawingSpace, &v3, 16, 1, 0);
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rulerHostingDelegate);

  return (PKRulerHostingDelegate *)WeakRetained;
}

- (CGRect)previousPageRectInAKModel
{
  double x = self->_previousPageRectInAKModel.origin.x;
  double y = self->_previousPageRectInAKModel.origin.y;
  double width = self->_previousPageRectInAKModel.size.width;
  double height = self->_previousPageRectInAKModel.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousPageRectInAKModel:(CGRect)a3
{
  self->_previousPageRectInAKModel = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rulerHostingDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_destroyWeak(&self->_drawingUndoTarget);
  objc_destroyWeak((id *)&self->_pageController);
  objc_storeStrong((id *)&self->_reportedStrokes, 0);

  objc_storeStrong((id *)&self->_ink, 0);
}

@end