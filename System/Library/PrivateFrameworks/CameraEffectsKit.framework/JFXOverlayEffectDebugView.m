@interface JFXOverlayEffectDebugView
- (CALayer)rootLayer;
- (CALayer)textBoundingBoxesContainerLayer;
- (CALayer)textCornerPointsContainerLayer;
- (CAShapeLayer)additionalRectsLayer;
- (CAShapeLayer)additionalRectsTransformedLayer;
- (CAShapeLayer)cornerPointsLayer;
- (CAShapeLayer)documentBoundingBoxLayer;
- (CAShapeLayer)hitAreaBoundingBoxLayer;
- (CAShapeLayer)hitAreaMinimumSizeBoundingBoxLayer;
- (CAShapeLayer)hitAreaPointsLayer;
- (CAShapeLayer)midpointLayer;
- (CAShapeLayer)objectAlignedBoundingBoxLayer;
- (CAShapeLayer)originCrosshairLayer;
- (CAShapeLayer)outputROILayer;
- (CAShapeLayer)overlayCenterLayer;
- (CATransformLayer)rootTransformLayer;
- (JFXOverlayEffectDebugView)initWithCoder:(id)a3;
- (JFXOverlayEffectDebugView)initWithFrame:(CGRect)a3 delegate:(id)a4;
- (JFXOverlayEffectDebugViewDelegate)delegate;
- (JFXOverlayEffectDebugViewOptions)options;
- (UIView)rootContainerView;
- (id)additionalRectsToDraw;
- (void)setAdditionalRectsLayer:(id)a3;
- (void)setAdditionalRectsTransformedLayer:(id)a3;
- (void)setCornerPointsLayer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentBoundingBoxLayer:(id)a3;
- (void)setHitAreaBoundingBoxLayer:(id)a3;
- (void)setHitAreaMinimumSizeBoundingBoxLayer:(id)a3;
- (void)setHitAreaPointsLayer:(id)a3;
- (void)setMidpointLayer:(id)a3;
- (void)setObjectAlignedBoundingBoxLayer:(id)a3;
- (void)setOptions:(id)a3;
- (void)setOriginCrosshairLayer:(id)a3;
- (void)setOutputROILayer:(id)a3;
- (void)setOverlayCenterLayer:(id)a3;
- (void)setRootContainerView:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setRootTransformLayer:(id)a3;
- (void)setTextBoundingBoxesContainerLayer:(id)a3;
- (void)setTextCornerPointsContainerLayer:(id)a3;
- (void)setupViews;
- (void)updateAdditionalRects:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 rects:(id)a6;
- (void)updateBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6;
- (void)updateCrosshairLayer:(id)a3 center:(CGPoint)a4 color:(id)a5 size:(CGSize)a6 thickness:(CGSize)a7;
- (void)updateDottedBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8;
- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6;
- (void)updateFilledPolygonLayer:(id)a3 path:(CGPath *)a4 fillColor:(id)a5;
- (void)updatePointsLayers:(id)a3 points:(id)a4 colors:(id)a5 size:(double)a6;
- (void)updatePolygonLayer:(id)a3 points:(id)a4 borderWidth:(double)a5 borderColor:(id)a6;
- (void)updateWithEffectFrame:(id)a3;
@end

@implementation JFXOverlayEffectDebugView

- (JFXOverlayEffectDebugView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)JFXOverlayEffectDebugView;
  v10 = -[JFXOverlayEffectDebugView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    [(JFXOverlayEffectDebugView *)v10 setDelegate:v9];
    [(JFXOverlayEffectDebugView *)v11 setupViews];
  }

  return v11;
}

- (JFXOverlayEffectDebugView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)JFXOverlayEffectDebugView;
  v3 = [(JFXOverlayEffectDebugView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(JFXOverlayEffectDebugView *)v3 setupViews];
  }
  return v4;
}

- (void)setupViews
{
  [(JFXOverlayEffectDebugView *)self setUserInteractionEnabled:0];
  id v3 = objc_alloc(MEMORY[0x263F1CB60]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(JFXOverlayEffectDebugView *)self setRootContainerView:v4];

  v5 = [(JFXOverlayEffectDebugView *)self rootContainerView];
  [v5 setHidden:1];

  objc_super v6 = [(JFXOverlayEffectDebugView *)self rootContainerView];
  [(JFXOverlayEffectDebugView *)self addSubview:v6];

  v7 = [(JFXOverlayEffectDebugView *)self rootContainerView];
  v8 = [v7 layer];
  [(JFXOverlayEffectDebugView *)self setRootLayer:v8];

  id v9 = [MEMORY[0x263F15908] layer];
  [(JFXOverlayEffectDebugView *)self setRootTransformLayer:v9];

  double v10 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  v12 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  objc_msgSend(v12, "setAnchorPoint:", v10, v11);

  objc_super v13 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v14 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  [v13 addSublayer:v14];

  v15 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setDocumentBoundingBoxLayer:v15];

  v16 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  v17 = [(JFXOverlayEffectDebugView *)self documentBoundingBoxLayer];
  [v16 addSublayer:v17];

  v18 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setOutputROILayer:v18];

  v19 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  v20 = [(JFXOverlayEffectDebugView *)self outputROILayer];
  [v19 addSublayer:v20];

  v21 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setObjectAlignedBoundingBoxLayer:v21];

  v22 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  v23 = [(JFXOverlayEffectDebugView *)self objectAlignedBoundingBoxLayer];
  [v22 addSublayer:v23];

  v24 = [MEMORY[0x263F157E8] layer];
  [(JFXOverlayEffectDebugView *)self setTextBoundingBoxesContainerLayer:v24];

  v25 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v26 = [(JFXOverlayEffectDebugView *)self textBoundingBoxesContainerLayer];
  [v25 addSublayer:v26];

  v27 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setHitAreaBoundingBoxLayer:v27];

  v28 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v29 = [(JFXOverlayEffectDebugView *)self hitAreaBoundingBoxLayer];
  [v28 addSublayer:v29];

  v30 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setHitAreaMinimumSizeBoundingBoxLayer:v30];

  v31 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v32 = [(JFXOverlayEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
  [v31 addSublayer:v32];

  v33 = [(JFXOverlayEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
  LODWORD(v34) = 1050253722;
  [v33 setOpacity:v34];

  v35 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setMidpointLayer:v35];

  v36 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v37 = [(JFXOverlayEffectDebugView *)self midpointLayer];
  [v36 addSublayer:v37];

  v38 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setOverlayCenterLayer:v38];

  v39 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v40 = [(JFXOverlayEffectDebugView *)self overlayCenterLayer];
  [v39 addSublayer:v40];

  v41 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setOriginCrosshairLayer:v41];

  v42 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  v43 = [(JFXOverlayEffectDebugView *)self originCrosshairLayer];
  [v42 addSublayer:v43];

  v44 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setCornerPointsLayer:v44];

  v45 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v46 = [(JFXOverlayEffectDebugView *)self cornerPointsLayer];
  [v45 addSublayer:v46];

  v47 = [MEMORY[0x263F157E8] layer];
  [(JFXOverlayEffectDebugView *)self setTextCornerPointsContainerLayer:v47];

  v48 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v49 = [(JFXOverlayEffectDebugView *)self textCornerPointsContainerLayer];
  [v48 addSublayer:v49];

  v50 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setHitAreaPointsLayer:v50];

  v51 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v52 = [(JFXOverlayEffectDebugView *)self hitAreaPointsLayer];
  [v51 addSublayer:v52];

  v53 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setAdditionalRectsLayer:v53];

  v54 = [(JFXOverlayEffectDebugView *)self rootLayer];
  v55 = [(JFXOverlayEffectDebugView *)self additionalRectsLayer];
  [v54 addSublayer:v55];

  v56 = [MEMORY[0x263F15880] layer];
  [(JFXOverlayEffectDebugView *)self setAdditionalRectsTransformedLayer:v56];

  v57 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  uint64_t v58 = [(JFXOverlayEffectDebugView *)self additionalRectsTransformedLayer];
  [v57 addSublayer:v58];

  v59 = [(JFXOverlayEffectDebugView *)self delegate];
  LOBYTE(v58) = objc_opt_respondsToSelector();

  if ((v58 & 1) != 0
    && ([(JFXOverlayEffectDebugView *)self delegate],
        v60 = objc_claimAutoreleasedReturnValue(),
        [v60 overlayEffectDebugViewOptions],
        id v63 = (id)objc_claimAutoreleasedReturnValue(),
        v60,
        v63))
  {
    v61 = self;
    uint64_t v62 = (uint64_t)v63;
  }
  else
  {
    uint64_t v62 = objc_opt_new();
    v61 = self;
    id v63 = (id)v62;
  }
  [(JFXOverlayEffectDebugView *)v61 setOptions:v62];
}

- (void)updateDottedBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6 borderPhase:(double)a7 borderDashPattern:(id)a8
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v16 = a8;
  id v17 = a6;
  id v18 = a3;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  pv_CGRect_to_NSArray(v22);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  v19 = [MEMORY[0x263F1C550] clearColor];
  setShapeLayerPathFromPointsWithStyle(v18, v20, v19, v17, v16, a7, a5 * 0.5);
}

- (void)updateBorderedLayer:(id)a3 borderRect:(CGRect)a4 borderWidth:(double)a5 borderColor:(id)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v12 = a6;
  id v13 = a3;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  pv_CGRect_to_NSArray(v17);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = [MEMORY[0x263F1C550] clearColor];
  setShapeLayerPathFromPointsWithStyle(v13, v15, v14, v12, 0, 0.0, a5);
}

- (void)updatePolygonLayer:(id)a3 points:(id)a4 borderWidth:(double)a5 borderColor:(id)a6
{
  id v9 = (void *)MEMORY[0x263F1C550];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v9 clearColor];
  setShapeLayerPathFromPointsWithStyle(v12, v11, v13, v10, 0, 0.0, a5);
}

- (void)updateFilledPolygonLayer:(id)a3 path:(CGPath *)a4 fillColor:(id)a5
{
  id v7 = a3;
  v8 = (void *)MEMORY[0x263F1C550];
  id v9 = a5;
  id v10 = [v8 clearColor];
  id v11 = v9;
  id v14 = v7;
  uint64_t v12 = [v11 CGColor];

  [v14 setFillColor:v12];
  id v13 = v10;
  objc_msgSend(v14, "setStrokeColor:", objc_msgSend(v13, "CGColor"));
  [v14 setLineDashPhase:0.0];
  [v14 setLineDashPattern:0];
  [v14 setLineWidth:0.0];
  [v14 setPath:a4];
}

- (void)updatePointsLayers:(id)a3 points:(id)a4 colors:(id)a5 size:(double)a6
{
  id v9 = a4;
  id v10 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __67__JFXOverlayEffectDebugView_updatePointsLayers_points_colors_size___block_invoke;
  v13[3] = &unk_264C0D3A8;
  double v16 = a6;
  id v14 = v9;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [a3 enumerateObjectsUsingBlock:v13];
}

void __67__JFXOverlayEffectDebugView_updatePointsLayers_points_colors_size___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 objectAtIndexedSubscript:a3];
  [v7 CGPointValue];
  double v9 = v8;

  v14.origin.CGFloat x = CGRectMakeSquareWithSizeAndCenterPoint(*(double *)(a1 + 48), v9);
  pv_CGRect_to_NSArray(v14);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 % objc_msgSend(*(id *)(a1 + 40), "count"));
  id v11 = [MEMORY[0x263F1C550] clearColor];
  setShapeLayerPathFromPointsWithStyle(v6, v12, v10, v11, 0, 0.0, 0.0);
}

- (void)updateFilledCircleLayer:(id)a3 center:(CGPoint)a4 radius:(double)a5 fillColor:(id)a6
{
  double x = a4.x;
  id v9 = a3;
  id v10 = a6;
  v18.origin.double x = CGRectMakeSquareWithSizeAndCenterPoint(a5 + a5, x);
  id v11 = CGPathCreateWithEllipseInRect(v18, 0);
  id v12 = [MEMORY[0x263F1C550] clearColor];
  id v13 = v10;
  id v16 = v9;
  uint64_t v14 = [v13 CGColor];

  [v16 setFillColor:v14];
  id v15 = v12;
  objc_msgSend(v16, "setStrokeColor:", objc_msgSend(v15, "CGColor"));
  [v16 setLineDashPhase:0.0];
  [v16 setLineDashPattern:0];
  [v16 setLineWidth:0.0];
  [v16 setPath:v11];

  CGPathRelease(v11);
}

- (void)updateCrosshairLayer:(id)a3 center:(CGPoint)a4 color:(id)a5 size:(CGSize)a6 thickness:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  double v9 = a6.height;
  double v10 = a6.width;
  double y = a4.y;
  double x = a4.x;
  v25[24] = *(double *)MEMORY[0x263EF8340];
  id v24 = a3;
  id v14 = a5;
  double v15 = CGSizeScale(v10, v9, 0.5);
  double v17 = v16;
  double v18 = CGSizeScale(width, height, 0.5);
  v25[0] = -v18;
  v25[1] = v19;
  v25[2] = -v15;
  v25[3] = v19;
  v25[4] = -v15;
  v25[5] = -v19;
  v25[6] = -v18;
  v25[7] = -v19;
  v25[8] = -v18;
  v25[9] = -v17;
  v25[10] = v18;
  v25[11] = -v17;
  v25[12] = v18;
  v25[13] = -v19;
  v25[14] = v15;
  v25[15] = -v19;
  v25[16] = v15;
  v25[17] = v19;
  v25[18] = v18;
  v25[19] = v19;
  v25[20] = v18;
  v25[21] = v17;
  v25[22] = -v18;
  v25[23] = v17;
  id v20 = [MEMORY[0x263EFF980] arrayWithCapacity:12];
  for (uint64_t i = 0; i != 24; i += 2)
  {
    CGRect v22 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", x + v25[i], y + v25[i + 1], v24);
    [v20 addObject:v22];
  }
  v23 = [MEMORY[0x263F1C550] clearColor];
  setShapeLayerPathFromPointsWithStyle(v24, v20, v14, v23, 0, 0.0, 0.0);
}

- (void)updateAdditionalRects:(id)a3 transformedLayer:(id)a4 effectScale:(double)a5 rects:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  objc_msgSend(v9, "setHidden:", objc_msgSend(v11, "count") == 0);
  objc_msgSend(v10, "setHidden:", objc_msgSend(v9, "isHidden"));
  if (([v9 isHidden] & 1) == 0)
  {
    id v12 = [v9 sublayers];
    id v13 = (void *)[v12 copy];

    [v13 enumerateObjectsUsingBlock:&__block_literal_global_68];
    id v14 = [v10 sublayers];
    double v15 = (void *)[v14 copy];

    [v15 enumerateObjectsUsingBlock:&__block_literal_global_46];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __86__JFXOverlayEffectDebugView_updateAdditionalRects_transformedLayer_effectScale_rects___block_invoke_3;
    v16[3] = &unk_264C0D3F0;
    double v19 = a5;
    id v17 = v9;
    id v18 = v10;
    [v11 enumerateObjectsUsingBlock:v16];
  }
}

uint64_t __86__JFXOverlayEffectDebugView_updateAdditionalRects_transformedLayer_effectScale_rects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

uint64_t __86__JFXOverlayEffectDebugView_updateAdditionalRects_transformedLayer_effectScale_rects___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 removeFromSuperlayer];
}

void __86__JFXOverlayEffectDebugView_updateAdditionalRects_transformedLayer_effectScale_rects___block_invoke_3(uint64_t x0_0, void *a2)
{
  id v12 = a2;
  char v3 = [v12 ignoreTransform];
  [v12 borderWidth];
  double v5 = v4;
  if ((v3 & 1) == 0) {
    double v5 = v4 / *(double *)(x0_0 + 48);
  }
  id v6 = [MEMORY[0x263F15880] layer];
  [v12 frame];
  id v7 = pv_CGRect_to_NSArray(v14);
  double v8 = [MEMORY[0x263F1C550] clearColor];
  id v9 = [v12 borderColor];
  setShapeLayerPathFromPointsWithStyle(v6, v7, v8, v9, 0, 0.0, v5);

  int v10 = [v12 ignoreTransform];
  uint64_t v11 = 40;
  if (v10) {
    uint64_t v11 = 32;
  }
  [*(id *)(x0_0 + v11) addSublayer:v6];
}

- (void)updateWithEffectFrame:(id)a3
{
  uint64_t v289 = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = v4;
  if (!v4 || [v4 isTrackedButTrackingUnavailable])
  {
    id v6 = [(JFXOverlayEffectDebugView *)self rootContainerView];
    [v6 setHidden:1];

    goto LABEL_65;
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id v7 = [(JFXOverlayEffectDebugView *)self rootContainerView];
  [v7 setHidden:0];

  [v5 relativeToSize];
  v290.origin.double x = CGRectMakeWithSize();
  double x = v290.origin.x;
  double y = v290.origin.y;
  double width = v290.size.width;
  double height = v290.size.height;
  double MidX = CGRectGetMidX(v290);
  v291.origin.double x = x;
  v291.origin.double y = y;
  v291.size.double width = width;
  v291.size.double height = height;
  double MidY = CGRectGetMidY(v291);
  long long v271 = 0u;
  long long v272 = 0u;
  long long v270 = 0u;
  [(JFXOverlayEffectDebugView *)self transform];
  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v269[0] = *MEMORY[0x263F000D0];
  v269[1] = v14;
  v269[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(JFXOverlayEffectDebugView *)self setTransform:v269];
  -[JFXOverlayEffectDebugView setFrame:](self, "setFrame:", x, y, width, height);
  v268[0] = v270;
  v268[1] = v271;
  v268[2] = v272;
  [(JFXOverlayEffectDebugView *)self setTransform:v268];
  double v15 = [(JFXOverlayEffectDebugView *)self rootContainerView];
  objc_msgSend(v15, "setFrame:", x, y, width, height);

  double v16 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v267[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v267[5] = v17;
  long long v18 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v267[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v267[7] = v18;
  long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v267[0] = *MEMORY[0x263F15740];
  v267[1] = v19;
  long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v267[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v267[3] = v20;
  [v16 setTransform:v267];

  v21 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  objc_msgSend(v21, "setBounds:", x, y, width, height);

  double v23 = *MEMORY[0x263F00148];
  double v22 = *(double *)(MEMORY[0x263F00148] + 8);
  id v24 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  double v246 = v22;
  objc_msgSend(v24, "setPosition:", v23, v22);

  long long v265 = 0u;
  long long v266 = 0u;
  long long v263 = 0u;
  long long v264 = 0u;
  memset(&v262[16], 0, 64);
  [v5 transformInfo];
  double v25 = fmax(fabs(*(double *)&v263), 0.001);
  [v5 transform];
  long long v247 = v262[11];
  long long v250 = v262[9];
  long long v238 = v262[10];
  long long v240 = v262[8];
  long long v242 = v262[15];
  long long v244 = v262[13];
  long long v234 = v262[14];
  long long v236 = v262[12];
  v26 = [(JFXOverlayEffectDebugView *)self rootTransformLayer];
  v262[0] = v240;
  v262[1] = v250;
  v262[2] = v238;
  v262[3] = v247;
  v262[4] = v236;
  v262[5] = v244;
  v262[6] = v234;
  v262[7] = v242;
  [v26 setTransform:v262];

  v27 = [(JFXOverlayEffectDebugView *)self documentBoundingBoxLayer];
  objc_msgSend(v27, "setBounds:", x, y, width, height);

  v28 = [(JFXOverlayEffectDebugView *)self documentBoundingBoxLayer];
  objc_msgSend(v28, "setPosition:", MidX, MidY);

  v29 = [(JFXOverlayEffectDebugView *)self outputROILayer];
  objc_msgSend(v29, "setBounds:", x, y, width, height);

  v30 = [(JFXOverlayEffectDebugView *)self outputROILayer];
  objc_msgSend(v30, "setPosition:", MidX, MidY);

  v31 = [(JFXOverlayEffectDebugView *)self objectAlignedBoundingBoxLayer];
  objc_msgSend(v31, "setBounds:", x, y, width, height);

  v32 = [(JFXOverlayEffectDebugView *)self objectAlignedBoundingBoxLayer];
  objc_msgSend(v32, "setPosition:", MidX, MidY);

  v33 = [(JFXOverlayEffectDebugView *)self textBoundingBoxesContainerLayer];
  objc_msgSend(v33, "setBounds:", x, y, width, height);

  double v34 = [(JFXOverlayEffectDebugView *)self textBoundingBoxesContainerLayer];
  objc_msgSend(v34, "setPosition:", MidX, MidY);

  v35 = [(JFXOverlayEffectDebugView *)self midpointLayer];
  objc_msgSend(v35, "setBounds:", x, y, width, height);

  v36 = [(JFXOverlayEffectDebugView *)self midpointLayer];
  objc_msgSend(v36, "setPosition:", MidX, MidY);

  v37 = [(JFXOverlayEffectDebugView *)self overlayCenterLayer];
  objc_msgSend(v37, "setBounds:", x, y, width, height);

  v38 = [(JFXOverlayEffectDebugView *)self overlayCenterLayer];
  objc_msgSend(v38, "setPosition:", MidX, MidY);

  v39 = [(JFXOverlayEffectDebugView *)self originCrosshairLayer];
  objc_msgSend(v39, "setBounds:", x, y, width, height);

  v40 = [(JFXOverlayEffectDebugView *)self originCrosshairLayer];
  objc_msgSend(v40, "setPosition:", MidX, MidY);

  v41 = [(JFXOverlayEffectDebugView *)self cornerPointsLayer];
  objc_msgSend(v41, "setBounds:", x, y, width, height);

  v42 = [(JFXOverlayEffectDebugView *)self cornerPointsLayer];
  objc_msgSend(v42, "setPosition:", MidX, MidY);

  v43 = [(JFXOverlayEffectDebugView *)self textCornerPointsContainerLayer];
  objc_msgSend(v43, "setBounds:", x, y, width, height);

  v44 = [(JFXOverlayEffectDebugView *)self textCornerPointsContainerLayer];
  objc_msgSend(v44, "setPosition:", MidX, MidY);

  v45 = [(JFXOverlayEffectDebugView *)self hitAreaPointsLayer];
  objc_msgSend(v45, "setBounds:", x, y, width, height);

  v46 = [(JFXOverlayEffectDebugView *)self hitAreaPointsLayer];
  objc_msgSend(v46, "setPosition:", MidX, MidY);

  v47 = [(JFXOverlayEffectDebugView *)self additionalRectsLayer];
  objc_msgSend(v47, "setBounds:", x, y, width, height);

  v48 = [(JFXOverlayEffectDebugView *)self additionalRectsLayer];
  objc_msgSend(v48, "setPosition:", MidX, MidY);

  v49 = [(JFXOverlayEffectDebugView *)self additionalRectsTransformedLayer];
  double v243 = x;
  double v241 = y;
  double v239 = width;
  double v237 = height;
  double v50 = height;
  double v51 = v25;
  objc_msgSend(v49, "setBounds:", x, y, width, v50);

  v52 = [(JFXOverlayEffectDebugView *)self additionalRectsTransformedLayer];
  objc_msgSend(v52, "setPosition:", MidX, MidY);

  v53 = [(JFXOverlayEffectDebugView *)self options];
  int v54 = [v53 showDocumentBoundingBox];

  uint64_t v55 = v54 ^ 1u;
  v56 = [(JFXOverlayEffectDebugView *)self documentBoundingBoxLayer];
  [v56 setHidden:v55];

  if ((v55 & 1) == 0)
  {
    double SquareWithSize = CGRectMakeSquareWithSize();
    double v59 = v58;
    double v61 = v60;
    double v63 = v62;
    [v5 effectSize];
    CGFloat v65 = v64;
    CGFloat v67 = v66;
    int v68 = [v5 effectOrigin];
    uint64_t v69 = 0;
    double v281 = SquareWithSize;
    double v282 = v59;
    double v283 = SquareWithSize + v61;
    double v284 = v59;
    double v285 = SquareWithSize + v61;
    double v286 = v59 + v63;
    double v287 = SquareWithSize;
    double v288 = v59 + v63;
    while (1)
    {
      double v251 = *(double *)((char *)&v281 + v69);
      double v248 = *(double *)((char *)&v281 + v69 + 8);
      if (v68 == 2) {
        break;
      }
      CGFloat v70 = v246;
      CGFloat v71 = v23;
      if (v68 != 1) {
        goto LABEL_10;
      }
      memset(&v273, 0, sizeof(v273));
      CGAffineTransformMakeScale(&v273, v65, v67);
      CGAffineTransform v274 = v273;
      CGAffineTransformTranslate(&v275, &v274, v23, 1.0);
      CGAffineTransform v273 = v275;
      CGAffineTransform v274 = v275;
      CGAffineTransformScale(&v275, &v274, 1.0, -1.0);
LABEL_11:
      CGAffineTransform v273 = v275;
      *(float64x2_t *)((char *)&v281 + v69) = vaddq_f64(*(float64x2_t *)&v275.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v275.c, v248), *(float64x2_t *)&v275.a, v251));
      v69 += 16;
      if (v69 == 64)
      {
        uint64_t v72 = 0;
        double v73 = -1.79769313e308;
        double v74 = 1.79769313e308;
        double v75 = -1.79769313e308;
        double v76 = 1.79769313e308;
        do
        {
          double v77 = *(double *)((char *)&v281 + v72);
          double v78 = *(double *)((char *)&v281 + v72 + 8);
          if (v77 < v76) {
            double v76 = *(double *)((char *)&v281 + v72);
          }
          if (v77 > v75) {
            double v75 = *(double *)((char *)&v281 + v72);
          }
          if (v78 > v73) {
            double v73 = *(double *)((char *)&v281 + v72 + 8);
          }
          if (v78 < v74) {
            double v74 = *(double *)((char *)&v281 + v72 + 8);
          }
          v72 += 16;
        }
        while (v72 != 64);
        double v79 = v75 - v76;
        double v80 = v73 - v74;
        v81 = [(JFXOverlayEffectDebugView *)self documentBoundingBoxLayer];
        v82 = [(JFXOverlayEffectDebugView *)self options];
        v83 = [v82 documentBoundingBoxColor];
        v84 = [NSNumber numberWithDouble:8.0 / v51];
        v280[0] = v84;
        v85 = [NSNumber numberWithDouble:5.0 / v51];
        v280[1] = v85;
        v86 = [MEMORY[0x263EFF8C0] arrayWithObjects:v280 count:2];
        -[JFXOverlayEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v81, v83, v86, v76, v74, v79, v80, 2.0 / v51, 0.0);

        goto LABEL_23;
      }
    }
    CGFloat v70 = -0.5;
    CGFloat v71 = -0.5;
LABEL_10:
    memset(&v273, 0, sizeof(v273));
    CGAffineTransformMakeScale(&v273, v65, v67);
    CGAffineTransform v274 = v273;
    CGAffineTransformTranslate(&v275, &v274, v71, v70);
    goto LABEL_11;
  }
LABEL_23:
  v87 = [(JFXOverlayEffectDebugView *)self options];
  int v88 = [v87 showDocumentBoundingBox];

  uint64_t v89 = v88 ^ 1u;
  v90 = [(JFXOverlayEffectDebugView *)self outputROILayer];
  [v90 setHidden:v89];

  CGFloat v245 = v23;
  if (v89) {
    goto LABEL_42;
  }
  double v235 = v51;
  [v5 outputROI];
  double v92 = v91;
  double v94 = v93;
  double v96 = v95;
  double v98 = v97;
  [v5 effectSize];
  double v100 = v99;
  double v102 = v101;
  [v5 effectSize];
  double v104 = v103;
  double v106 = v105;
  int v107 = [v5 effectOrigin];
  uint64_t v108 = 0;
  double v281 = v92;
  double v282 = v94;
  double v283 = v92 + v96;
  double v284 = v94;
  double v285 = v92 + v96;
  double v286 = v94 + v98;
  double v287 = v92;
  double v288 = v94 + v98;
  double v109 = v104 / v100;
  double v110 = v106 / v102;
  do
  {
    double v252 = *(double *)((char *)&v281 + v108);
    double v249 = *(double *)((char *)&v281 + v108 + 8);
    if (v107 == 2)
    {
      double v111 = v102 * -0.5;
      double v112 = v100 * -0.5;
    }
    else
    {
      double v111 = v246;
      double v112 = v245;
      if (v107 == 1)
      {
        memset(&v273, 0, sizeof(v273));
        CGAffineTransformMakeScale(&v273, v109, v110);
        CGAffineTransform v274 = v273;
        CGAffineTransformTranslate(&v275, &v274, v245, v102);
        CGAffineTransform v273 = v275;
        CGAffineTransform v274 = v275;
        CGAffineTransformScale(&v275, &v274, 1.0, -1.0);
        goto LABEL_30;
      }
    }
    memset(&v273, 0, sizeof(v273));
    CGAffineTransformMakeScale(&v273, v109, v110);
    CGAffineTransform v274 = v273;
    CGAffineTransformTranslate(&v275, &v274, v112, v111);
LABEL_30:
    CGAffineTransform v273 = v275;
    *(float64x2_t *)((char *)&v281 + v108) = vaddq_f64(*(float64x2_t *)&v275.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v275.c, v249), *(float64x2_t *)&v275.a, v252));
    v108 += 16;
  }
  while (v108 != 64);
  uint64_t v113 = 0;
  double v114 = -1.79769313e308;
  double v115 = 1.79769313e308;
  double v116 = -1.79769313e308;
  double v117 = 1.79769313e308;
  do
  {
    double v118 = *(double *)((char *)&v281 + v113);
    double v119 = *(double *)((char *)&v281 + v113 + 8);
    if (v118 < v117) {
      double v117 = *(double *)((char *)&v281 + v113);
    }
    if (v118 > v116) {
      double v116 = *(double *)((char *)&v281 + v113);
    }
    if (v119 > v114) {
      double v114 = *(double *)((char *)&v281 + v113 + 8);
    }
    if (v119 < v115) {
      double v115 = *(double *)((char *)&v281 + v113 + 8);
    }
    v113 += 16;
  }
  while (v113 != 64);
  double v120 = v116 - v117;
  double v121 = v114 - v115;
  v122 = [(JFXOverlayEffectDebugView *)self outputROILayer];
  double v51 = v235;
  v123 = [(JFXOverlayEffectDebugView *)self options];
  v124 = [v123 outputROIColor];
  v125 = [NSNumber numberWithDouble:6.0 / v235];
  v279[0] = v125;
  v126 = [NSNumber numberWithDouble:4.0 / v235];
  v279[1] = v126;
  v127 = [MEMORY[0x263EFF8C0] arrayWithObjects:v279 count:2];
  -[JFXOverlayEffectDebugView updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:](self, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v122, v124, v127, v117, v115, v120, v121, 2.0 / v235, 0.0);

  double v23 = v245;
LABEL_42:
  v128 = [(JFXOverlayEffectDebugView *)self options];
  int v129 = [v128 showObjectAlignedBoundingBox];

  uint64_t v130 = v129 ^ 1u;
  v131 = [(JFXOverlayEffectDebugView *)self objectAlignedBoundingBoxLayer];
  [v131 setHidden:v130];

  if ((v130 & 1) == 0)
  {
    v132 = [(JFXOverlayEffectDebugView *)self objectAlignedBoundingBoxLayer];
    [v5 objectBounds];
    double v134 = v133;
    double v136 = v135;
    double v138 = v137;
    double v140 = v139;
    v141 = [(JFXOverlayEffectDebugView *)self options];
    v142 = [v141 objectAlignedBoundingBoxColor];
    double v23 = v245;
    -[JFXOverlayEffectDebugView updateBorderedLayer:borderRect:borderWidth:borderColor:](self, "updateBorderedLayer:borderRect:borderWidth:borderColor:", v132, v142, v134, v136, v138, v140, 2.0 / v51);
  }
  v143 = [(JFXOverlayEffectDebugView *)self options];
  if ([v143 showTextBoundingBoxes])
  {
    v144 = [v5 textFrames];
    uint64_t v145 = [v144 count];

    v146 = [(JFXOverlayEffectDebugView *)self textBoundingBoxesContainerLayer];
    [v146 setHidden:v145 == 0];

    if (v145)
    {
      v147 = [(JFXOverlayEffectDebugView *)self textBoundingBoxesContainerLayer];
      v148 = [v5 textFrames];
      ensureNSublayers(v147, [v148 count]);

      v149 = [v5 textFrames];
      v256[0] = MEMORY[0x263EF8330];
      v256[1] = 3221225472;
      v256[2] = __51__JFXOverlayEffectDebugView_updateWithEffectFrame___block_invoke;
      v256[3] = &unk_264C0D418;
      v256[4] = self;
      double v258 = v243;
      double v259 = v241;
      double v260 = v239;
      double v261 = v237;
      id v257 = v5;
      [v149 enumerateObjectsUsingBlock:v256];
    }
  }
  else
  {

    v150 = [(JFXOverlayEffectDebugView *)self textBoundingBoxesContainerLayer];
    [v150 setHidden:1];
  }
  v151 = [(JFXOverlayEffectDebugView *)self options];
  int v152 = [v151 showHitAreaBoundingBox];

  v153 = [(JFXOverlayEffectDebugView *)self hitAreaBoundingBoxLayer];
  v154 = v153;
  if (v152)
  {
    [v153 setHidden:0];

    v155 = [(JFXOverlayEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    [v155 setHidden:0];

    v156 = [(JFXOverlayEffectDebugView *)self hitAreaBoundingBoxLayer];
    v157 = [v5 hitAreaPoints];
    v158 = [(JFXOverlayEffectDebugView *)self options];
    v159 = [v158 hitAreaBoundingBoxColor];
    [(JFXOverlayEffectDebugView *)self updatePolygonLayer:v156 points:v157 borderWidth:v159 borderColor:3.0];

    v160 = [(JFXOverlayEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    ensureNSublayers(v160, 1uLL);

    v161 = [(JFXOverlayEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    v162 = [v161 sublayers];
    v163 = [v162 firstObject];

    uint64_t v164 = [v5 hitAreaPath];
    v165 = [(JFXOverlayEffectDebugView *)self options];
    v166 = [v165 hitAreaBoundingBoxColor];
    [(JFXOverlayEffectDebugView *)self updateFilledPolygonLayer:v163 path:v164 fillColor:v166];

    v167 = [(JFXOverlayEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    uint64_t v168 = [v5 expandedHitAreaPath];
    v169 = [(JFXOverlayEffectDebugView *)self options];
    v170 = [v169 hitAreaBoundingBoxColor];
    [(JFXOverlayEffectDebugView *)self updateFilledPolygonLayer:v167 path:v168 fillColor:v170];
  }
  else
  {
    [v153 setHidden:1];

    v163 = [(JFXOverlayEffectDebugView *)self hitAreaMinimumSizeBoundingBoxLayer];
    [v163 setHidden:1];
  }

  v171 = [(JFXOverlayEffectDebugView *)self options];
  int v172 = [v171 showCornerPoints];

  uint64_t v173 = v172 ^ 1u;
  v174 = [(JFXOverlayEffectDebugView *)self cornerPointsLayer];
  [v174 setHidden:v173];

  if ((v173 & 1) == 0)
  {
    v175 = [(JFXOverlayEffectDebugView *)self cornerPointsLayer];
    ensureNSublayers(v175, 4uLL);

    v176 = [(JFXOverlayEffectDebugView *)self cornerPointsLayer];
    v177 = [v176 sublayers];

    [v5 cornerPoints];
    v178 = PVCGPointQuad_to_NSArray(&v255);
    v179 = [(JFXOverlayEffectDebugView *)self options];
    v180 = [v179 cornerPointColors];
    [(JFXOverlayEffectDebugView *)self updatePointsLayers:v177 points:v178 colors:v180 size:4.0];
  }
  v181 = [(JFXOverlayEffectDebugView *)self options];
  int v182 = [v181 showMidpoint];

  uint64_t v183 = v182 ^ 1u;
  v184 = [(JFXOverlayEffectDebugView *)self midpointLayer];
  [v184 setHidden:v183];

  if ((v183 & 1) == 0)
  {
    v185 = [(JFXOverlayEffectDebugView *)self midpointLayer];
    v278 = v185;
    v186 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v278 count:1];
    v187 = (void *)MEMORY[0x263F08D40];
    [v5 center];
    v188 = objc_msgSend(v187, "valueWithCGPoint:");
    v277 = v188;
    v189 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v277 count:1];
    v190 = [(JFXOverlayEffectDebugView *)self options];
    v191 = [v190 midpointColor];
    v276 = v191;
    v192 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v276 count:1];
    [(JFXOverlayEffectDebugView *)self updatePointsLayers:v186 points:v189 colors:v192 size:6.0];

    v193 = [(JFXOverlayEffectDebugView *)self overlayCenterLayer];
    [v5 overlayCenter];
    double v195 = v194;
    double v197 = v196;
    v198 = [(JFXOverlayEffectDebugView *)self options];
    v199 = [v198 overlayCenterColor];
    -[JFXOverlayEffectDebugView updateFilledCircleLayer:center:radius:fillColor:](self, "updateFilledCircleLayer:center:radius:fillColor:", v193, v199, v195, v197, 6.0);

    v200 = [(JFXOverlayEffectDebugView *)self originCrosshairLayer];
    v201 = [(JFXOverlayEffectDebugView *)self options];
    v202 = [v201 originCrosshairColor];
    -[JFXOverlayEffectDebugView updateCrosshairLayer:center:color:size:thickness:](self, "updateCrosshairLayer:center:color:size:thickness:", v200, v202, v23, v246, 10.0 / v51, 10.0 / v51, 2.0 / v51, 2.0 / v51);
  }
  v203 = [(JFXOverlayEffectDebugView *)self options];
  if ([v203 showTextCornerPoints])
  {
    v204 = [v5 textFrames];
    uint64_t v205 = [v204 count];

    v206 = [(JFXOverlayEffectDebugView *)self textCornerPointsContainerLayer];
    [v206 setHidden:v205 == 0];

    if (v205)
    {
      v207 = [(JFXOverlayEffectDebugView *)self textCornerPointsContainerLayer];
      v208 = [v5 textFrames];
      ensureNSublayers(v207, 4 * [v208 count]);

      v209 = [(JFXOverlayEffectDebugView *)self textCornerPointsContainerLayer];
      v210 = [v209 sublayers];

      v211 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v210, "count"));
      v212 = [v5 textFrames];
      v253[0] = MEMORY[0x263EF8330];
      v253[1] = 3221225472;
      v253[2] = __51__JFXOverlayEffectDebugView_updateWithEffectFrame___block_invoke_2;
      v253[3] = &unk_264C0D440;
      id v254 = v211;
      id v213 = v211;
      [v212 enumerateObjectsUsingBlock:v253];

      v214 = [(JFXOverlayEffectDebugView *)self options];
      v215 = [v214 textCornerPointColors];
      [(JFXOverlayEffectDebugView *)self updatePointsLayers:v210 points:v213 colors:v215 size:4.0];

      goto LABEL_59;
    }
  }
  else
  {

    v210 = [(JFXOverlayEffectDebugView *)self textCornerPointsContainerLayer];
    [v210 setHidden:1];
LABEL_59:
  }
  v216 = [(JFXOverlayEffectDebugView *)self options];
  int v217 = [v216 showHitAreaPoints];

  uint64_t v218 = v217 ^ 1u;
  v219 = [(JFXOverlayEffectDebugView *)self hitAreaPointsLayer];
  [v219 setHidden:v218];

  if ((v218 & 1) == 0)
  {
    v220 = [(JFXOverlayEffectDebugView *)self hitAreaPointsLayer];
    v221 = [v5 hitAreaPoints];
    ensureNSublayers(v220, [v221 count]);

    v222 = [(JFXOverlayEffectDebugView *)self hitAreaPointsLayer];
    v223 = [v222 sublayers];

    v224 = [v5 hitAreaPoints];
    v225 = [(JFXOverlayEffectDebugView *)self options];
    v226 = [v225 hitAreaPointColors];
    [(JFXOverlayEffectDebugView *)self updatePointsLayers:v223 points:v224 colors:v226 size:4.0];
  }
  v227 = [(JFXOverlayEffectDebugView *)self options];
  int v228 = [v227 showAdditionalRects];

  uint64_t v229 = v228 ^ 1u;
  v230 = [(JFXOverlayEffectDebugView *)self additionalRectsLayer];
  [v230 setHidden:v229];

  if ((v229 & 1) == 0)
  {
    v231 = [(JFXOverlayEffectDebugView *)self additionalRectsLayer];
    v232 = [(JFXOverlayEffectDebugView *)self additionalRectsTransformedLayer];
    v233 = [(JFXOverlayEffectDebugView *)self additionalRectsToDraw];
    [(JFXOverlayEffectDebugView *)self updateAdditionalRects:v231 transformedLayer:v232 effectScale:v233 rects:v51];
  }
  [MEMORY[0x263F158F8] commit];
LABEL_65:
}

void __51__JFXOverlayEffectDebugView_updateWithEffectFrame___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  v53[2] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) textBoundingBoxesContainerLayer];
  id v7 = [v6 sublayers];
  double v8 = [v7 objectAtIndexedSubscript:a3];

  ensureNSublayers(v8, 1uLL);
  long long v9 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v52[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v52[5] = v9;
  long long v10 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v52[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v52[7] = v10;
  long long v11 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v52[0] = *MEMORY[0x263F15740];
  v52[1] = v11;
  long long v12 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v52[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v52[3] = v12;
  [v8 setTransform:v52];
  objc_msgSend(v8, "setBounds:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  double v13 = *MEMORY[0x263F00148];
  double v14 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(v8, "setPosition:", *MEMORY[0x263F00148], v14);
  objc_msgSend(v8, "setAnchorPoint:", v13, v14);
  if (v5)
  {
    [v5 transform];
    long long v16 = v44;
    long long v15 = v45;
    long long v18 = v46;
    long long v17 = v47;
    long long v20 = v48;
    long long v19 = v49;
    long long v21 = v50;
    long long v22 = v51;
  }
  else
  {
    long long v21 = 0uLL;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v22 = 0uLL;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v20 = 0uLL;
    long long v19 = 0uLL;
    long long v18 = 0uLL;
    long long v17 = 0uLL;
    long long v16 = 0uLL;
    long long v15 = 0uLL;
    long long v44 = 0u;
    long long v45 = 0u;
  }
  v43[0] = v16;
  v43[1] = v15;
  v43[2] = v18;
  v43[3] = v17;
  v43[4] = v20;
  v43[5] = v19;
  v43[6] = v21;
  v43[7] = v22;
  [v8 setTransform:v43];
  if (v5) {
    [v5 transformInfo];
  }
  double v23 = fmax(fabs(0.0), 0.001);
  id v24 = [v8 sublayers];
  double v25 = [v24 objectAtIndexedSubscript:0];

  v26 = *(void **)(a1 + 32);
  [v5 objectBounds];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  v35 = [*(id *)(a1 + 32) options];
  v36 = [v35 textBoundingBoxColors];
  v37 = [*(id *)(a1 + 40) textFrames];
  v38 = objc_msgSend(v36, "objectAtIndexedSubscript:", a3 % objc_msgSend(v37, "count"));
  v42 = v5;
  v39 = [NSNumber numberWithDouble:6.0 / v23];
  v53[0] = v39;
  v40 = [NSNumber numberWithDouble:3.0 / v23];
  v53[1] = v40;
  v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:2];
  objc_msgSend(v26, "updateDottedBorderedLayer:borderRect:borderWidth:borderColor:borderPhase:borderDashPattern:", v25, v38, v41, v28, v30, v32, v34, 1.0 / v23, 0.0);
}

void __51__JFXOverlayEffectDebugView_updateWithEffectFrame___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    [a2 cornerPoints];
  }
  else {
    memset(&v4, 0, sizeof(v4));
  }
  char v3 = PVCGPointQuad_to_NSArray(&v4);
  [v2 addObjectsFromArray:v3];
}

- (id)additionalRectsToDraw
{
  char v3 = [(JFXOverlayEffectDebugView *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(JFXOverlayEffectDebugView *)self delegate];
    id v6 = [v5 overlayEffectDebugViewAdditionalRectsToDraw];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (UIView)rootContainerView
{
  return self->_rootContainerView;
}

- (void)setRootContainerView:(id)a3
{
}

- (CALayer)rootLayer
{
  return self->_rootLayer;
}

- (void)setRootLayer:(id)a3
{
}

- (CATransformLayer)rootTransformLayer
{
  return self->_rootTransformLayer;
}

- (void)setRootTransformLayer:(id)a3
{
}

- (CAShapeLayer)documentBoundingBoxLayer
{
  return self->_documentBoundingBoxLayer;
}

- (void)setDocumentBoundingBoxLayer:(id)a3
{
}

- (CAShapeLayer)outputROILayer
{
  return self->_outputROILayer;
}

- (void)setOutputROILayer:(id)a3
{
}

- (CAShapeLayer)objectAlignedBoundingBoxLayer
{
  return self->_objectAlignedBoundingBoxLayer;
}

- (void)setObjectAlignedBoundingBoxLayer:(id)a3
{
}

- (CALayer)textBoundingBoxesContainerLayer
{
  return self->_textBoundingBoxesContainerLayer;
}

- (void)setTextBoundingBoxesContainerLayer:(id)a3
{
}

- (CAShapeLayer)hitAreaBoundingBoxLayer
{
  return self->_hitAreaBoundingBoxLayer;
}

- (void)setHitAreaBoundingBoxLayer:(id)a3
{
}

- (CAShapeLayer)hitAreaMinimumSizeBoundingBoxLayer
{
  return self->_hitAreaMinimumSizeBoundingBoxLayer;
}

- (void)setHitAreaMinimumSizeBoundingBoxLayer:(id)a3
{
}

- (CAShapeLayer)midpointLayer
{
  return self->_midpointLayer;
}

- (void)setMidpointLayer:(id)a3
{
}

- (CAShapeLayer)overlayCenterLayer
{
  return self->_overlayCenterLayer;
}

- (void)setOverlayCenterLayer:(id)a3
{
}

- (CAShapeLayer)originCrosshairLayer
{
  return self->_originCrosshairLayer;
}

- (void)setOriginCrosshairLayer:(id)a3
{
}

- (CAShapeLayer)cornerPointsLayer
{
  return self->_cornerPointsLayer;
}

- (void)setCornerPointsLayer:(id)a3
{
}

- (CALayer)textCornerPointsContainerLayer
{
  return self->_textCornerPointsContainerLayer;
}

- (void)setTextCornerPointsContainerLayer:(id)a3
{
}

- (CAShapeLayer)hitAreaPointsLayer
{
  return self->_hitAreaPointsLayer;
}

- (void)setHitAreaPointsLayer:(id)a3
{
}

- (CAShapeLayer)additionalRectsLayer
{
  return self->_additionalRectsLayer;
}

- (void)setAdditionalRectsLayer:(id)a3
{
}

- (CAShapeLayer)additionalRectsTransformedLayer
{
  return self->_additionalRectsTransformedLayer;
}

- (void)setAdditionalRectsTransformedLayer:(id)a3
{
}

- (JFXOverlayEffectDebugViewOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (JFXOverlayEffectDebugViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (JFXOverlayEffectDebugViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_additionalRectsTransformedLayer, 0);
  objc_storeStrong((id *)&self->_additionalRectsLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaPointsLayer, 0);
  objc_storeStrong((id *)&self->_textCornerPointsContainerLayer, 0);
  objc_storeStrong((id *)&self->_cornerPointsLayer, 0);
  objc_storeStrong((id *)&self->_originCrosshairLayer, 0);
  objc_storeStrong((id *)&self->_overlayCenterLayer, 0);
  objc_storeStrong((id *)&self->_midpointLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaMinimumSizeBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_hitAreaBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_textBoundingBoxesContainerLayer, 0);
  objc_storeStrong((id *)&self->_objectAlignedBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_outputROILayer, 0);
  objc_storeStrong((id *)&self->_documentBoundingBoxLayer, 0);
  objc_storeStrong((id *)&self->_rootTransformLayer, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);
  objc_storeStrong((id *)&self->_rootContainerView, 0);
}

@end