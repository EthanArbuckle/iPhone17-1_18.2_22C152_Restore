@interface DiagnosticHUDLayer
+ (id)layer;
- (CALayer)previewLayer;
- (CAShapeLayer)cameraAreaLayer;
- (CAShapeLayer)focusIndicatorLayer;
- (CAShapeLayer)focusPointLayer;
- (CAShapeLayer)frameIndicator;
- (CGRect)previewLayerVisibleRect;
- (CGSize)cameraResolution;
- (CRColor)freshPointColor;
- (CRColor)stalePointColor;
- (DiagnosticHUDLayer)init;
- (NSMutableArray)pointLayers;
- (void)layoutSublayers;
- (void)refreshFrameIndicator;
- (void)setAdjustingFocus:(BOOL)a3 pointOfInterestSupported:(BOOL)a4 focusPoint:(CGPoint)a5;
- (void)setBoxPoints:(id)a3;
- (void)setCameraAreaLayer:(id)a3;
- (void)setCameraResolution:(CGSize)a3;
- (void)setFocusIndicatorLayer:(id)a3;
- (void)setFocusPointLayer:(id)a3;
- (void)setFrameIndicator:(id)a3;
- (void)setFreshPointColor:(id)a3;
- (void)setPointLayers:(id)a3;
- (void)setPreviewLayer:(id)a3;
- (void)setPreviewLayer:(id)a3 visibleRect:(CGRect)a4 cameraResolution:(CGSize)a5;
- (void)setPreviewLayerVisibleRect:(CGRect)a3;
- (void)setStalePointColor:(id)a3;
@end

@implementation DiagnosticHUDLayer

+ (id)layer
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (DiagnosticHUDLayer)init
{
  v68.receiver = self;
  v68.super_class = (Class)DiagnosticHUDLayer;
  id v2 = [(DiagnosticHUDLayer *)&v68 init];
  if (v2)
  {
    v3 = +[CRColor greenColor];
    [(DiagnosticHUDLayer *)v2 setFreshPointColor:v3];

    v4 = +[CRColor yellowColor];
    [(DiagnosticHUDLayer *)v2 setStalePointColor:v4];

    v5 = [MEMORY[0x263F15880] layer];
    [(DiagnosticHUDLayer *)v2 setCameraAreaLayer:v5];

    id v6 = +[CRColor blackColor];
    uint64_t v7 = [v6 CGColor];
    v8 = [(DiagnosticHUDLayer *)v2 cameraAreaLayer];
    [v8 setBackgroundColor:v7];

    id v9 = +[CRColor yellowColor];
    uint64_t v10 = [v9 CGColor];
    v11 = [(DiagnosticHUDLayer *)v2 cameraAreaLayer];
    [v11 setFillColor:v10];

    v12 = [(DiagnosticHUDLayer *)v2 cameraAreaLayer];
    LODWORD(v13) = 0.5;
    [v12 setOpacity:v13];

    v14 = [(DiagnosticHUDLayer *)v2 cameraAreaLayer];
    [(DiagnosticHUDLayer *)v2 addSublayer:v14];

    v15 = [MEMORY[0x263EFF980] array];
    [(DiagnosticHUDLayer *)v2 setPointLayers:v15];

    double v16 = 0.0;
    int v17 = 4;
    do
    {
      v18 = [MEMORY[0x263F15880] layer];
      objc_msgSend(v18, "setBounds:", 0.0, 0.0, v16 * -2.5 + 20.0, v16 * -2.5 + 20.0);
      [v18 setHidden:1];
      [v18 bounds];
      objc_msgSend(v18, "setPath:", CGPathCreateWithEllipseInRect(v69, 0));
      [(DiagnosticHUDLayer *)v2 addSublayer:v18];
      v19 = [(DiagnosticHUDLayer *)v2 pointLayers];
      [v19 addObject:v18];

      double v16 = v16 + 1.0;
      --v17;
    }
    while (v17);
    v20 = [MEMORY[0x263F15880] layer];
    [(DiagnosticHUDLayer *)v2 setFocusIndicatorLayer:v20];

    v21 = [(DiagnosticHUDLayer *)v2 focusIndicatorLayer];
    objc_msgSend(v21, "setBounds:", 0.0, 0.0, 20.0, 20.0);

    v22 = [(DiagnosticHUDLayer *)v2 focusIndicatorLayer];
    [v22 setHidden:1];

    v23 = [(DiagnosticHUDLayer *)v2 focusIndicatorLayer];
    [v23 bounds];
    CGPathRef v24 = CGPathCreateWithEllipseInRect(v70, 0);
    v25 = [(DiagnosticHUDLayer *)v2 focusIndicatorLayer];
    [v25 setPath:v24];

    id v26 = +[CRColor blueColor];
    uint64_t v27 = [v26 CGColor];
    v28 = [(DiagnosticHUDLayer *)v2 focusIndicatorLayer];
    [v28 setFillColor:v27];

    v29 = [(DiagnosticHUDLayer *)v2 focusIndicatorLayer];
    [(DiagnosticHUDLayer *)v2 addSublayer:v29];

    v30 = [MEMORY[0x263F15880] layer];
    [(DiagnosticHUDLayer *)v2 setFocusPointLayer:v30];

    v31 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    objc_msgSend(v31, "setBounds:", 0.0, 0.0, 30.0, 30.0);

    v32 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [v32 setHidden:1];

    v33 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [v33 bounds];
    CGPathRef v34 = CGPathCreateWithEllipseInRect(v71, 0);
    v35 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [v35 setPath:v34];

    v36 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    LODWORD(v37) = 0.5;
    [v36 setOpacity:v37];

    id v38 = +[CRColor clearColor];
    uint64_t v39 = [v38 CGColor];
    v40 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [v40 setFillColor:v39];

    id v41 = +[CRColor grayColor];
    uint64_t v42 = [v41 CGColor];
    v43 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [v43 setStrokeColor:v42];

    v44 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [v44 setLineWidth:4.0];

    v45 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [v45 bounds];
    CGFloat v46 = CGRectGetWidth(v72) * 3.14159265 / 20.0;

    v47 = (void *)MEMORY[0x263EFF8C0];
    v48 = [NSNumber numberWithDouble:v46];
    v49 = [NSNumber numberWithDouble:v46];
    v50 = objc_msgSend(v47, "arrayWithObjects:", v48, v49, 0);
    v51 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [v51 setLineDashPattern:v50];

    v52 = [(DiagnosticHUDLayer *)v2 focusPointLayer];
    [(DiagnosticHUDLayer *)v2 addSublayer:v52];

    v53 = [MEMORY[0x263F15880] layer];
    [(DiagnosticHUDLayer *)v2 setFrameIndicator:v53];

    v54 = [(DiagnosticHUDLayer *)v2 frameIndicator];
    objc_msgSend(v54, "setBounds:", 0.0, 0.0, 20.0, 20.0);

    v55 = [(DiagnosticHUDLayer *)v2 frameIndicator];
    [v55 bounds];
    CGPathRef v56 = CGPathCreateWithEllipseInRect(v73, 0);
    v57 = [(DiagnosticHUDLayer *)v2 frameIndicator];
    [v57 setPath:v56];

    v58 = [(DiagnosticHUDLayer *)v2 frameIndicator];
    LODWORD(v59) = 0.5;
    [v58 setOpacity:v59];

    id v60 = +[CRColor redColor];
    uint64_t v61 = [v60 CGColor];
    v62 = [(DiagnosticHUDLayer *)v2 frameIndicator];
    [v62 setFillColor:v61];

    id v63 = +[CRColor grayColor];
    uint64_t v64 = [v63 CGColor];
    v65 = [(DiagnosticHUDLayer *)v2 frameIndicator];
    [v65 setStrokeColor:v64];

    v66 = [(DiagnosticHUDLayer *)v2 frameIndicator];
    [(DiagnosticHUDLayer *)v2 addSublayer:v66];
  }
  return v2;
}

- (void)layoutSublayers
{
  v3 = [(DiagnosticHUDLayer *)self previewLayer];

  if (v3)
  {
    [(DiagnosticHUDLayer *)self cameraResolution];
    if (v5 == *MEMORY[0x263F001B0] && v4 == *(double *)(MEMORY[0x263F001B0] + 8))
    {
      v19 = [(DiagnosticHUDLayer *)self cameraAreaLayer];
      [v19 setPath:0];
    }
    else
    {
      [MEMORY[0x263F158F8] begin];
      [MEMORY[0x263F158F8] setDisableActions:1];
      [(DiagnosticHUDLayer *)self cameraResolution];
      double v8 = v7;
      [(DiagnosticHUDLayer *)self cameraResolution];
      double v10 = v9;
      v11 = [(DiagnosticHUDLayer *)self cameraAreaLayer];
      objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v10);

      [(DiagnosticHUDLayer *)self bounds];
      double Width = CGRectGetWidth(v58);
      [(DiagnosticHUDLayer *)self bounds];
      double Height = CGRectGetHeight(v59);
      [(DiagnosticHUDLayer *)self bounds];
      if (Width <= Height) {
        double v18 = CGRectGetHeight(*(CGRect *)&v14);
      }
      else {
        double v18 = CGRectGetWidth(*(CGRect *)&v14);
      }
      double v20 = v18 / 5.0;
      [(DiagnosticHUDLayer *)self bounds];
      double v21 = CGRectGetWidth(v60);
      [(DiagnosticHUDLayer *)self bounds];
      double v22 = CGRectGetHeight(v61);
      [(DiagnosticHUDLayer *)self bounds];
      if (v21 <= v22) {
        double v27 = CGRectGetWidth(*(CGRect *)&v23);
      }
      else {
        double v27 = CGRectGetHeight(*(CGRect *)&v23);
      }
      double v28 = v27 / 15.0;
      v29 = [(DiagnosticHUDLayer *)self cameraAreaLayer];
      [v29 bounds];
      CGFloat v30 = v20 / CGRectGetWidth(v62);

      CGAffineTransformMakeScale(&v57, v30, v30);
      v31 = [(DiagnosticHUDLayer *)self cameraAreaLayer];
      CGAffineTransform v56 = v57;
      [v31 setAffineTransform:&v56];

      v32 = [(DiagnosticHUDLayer *)self cameraAreaLayer];
      objc_msgSend(v32, "setAnchorPoint:", 1.0, 1.0);

      [(DiagnosticHUDLayer *)self bounds];
      CGFloat v33 = CGRectGetMaxX(v63) - v28;
      [(DiagnosticHUDLayer *)self bounds];
      CGFloat v34 = CGRectGetMaxY(v64) - v28;
      v35 = [(DiagnosticHUDLayer *)self cameraAreaLayer];
      objc_msgSend(v35, "setPosition:", v33, v34);

      [(DiagnosticHUDLayer *)self visibleRect];
      double MinX = CGRectGetMinX(v65);
      [(DiagnosticHUDLayer *)self cameraResolution];
      CGFloat v38 = MinX * v37;
      [(DiagnosticHUDLayer *)self visibleRect];
      double MinY = CGRectGetMinY(v66);
      [(DiagnosticHUDLayer *)self cameraResolution];
      CGFloat v41 = MinY * v40;
      [(DiagnosticHUDLayer *)self visibleRect];
      double v42 = CGRectGetWidth(v67);
      [(DiagnosticHUDLayer *)self cameraResolution];
      CGFloat v44 = v42 * v43;
      [(DiagnosticHUDLayer *)self visibleRect];
      double v45 = CGRectGetHeight(v68);
      [(DiagnosticHUDLayer *)self cameraResolution];
      v69.size.height = v45 * v46;
      v69.origin.x = v38;
      v69.origin.y = v41;
      v69.size.width = v44;
      CGPathRef v47 = CGPathCreateWithRect(v69, 0);
      CFTypeRef v48 = CFAutorelease(v47);
      v49 = [(DiagnosticHUDLayer *)self cameraAreaLayer];
      [v49 setPath:v48];

      [MEMORY[0x263F158F8] commit];
    }
  }
  [(DiagnosticHUDLayer *)self bounds];
  CGFloat v50 = CGRectGetMaxX(v70) + -40.0;
  [(DiagnosticHUDLayer *)self bounds];
  CGFloat v51 = CGRectGetMinY(v71) + 40.0;
  v52 = [(DiagnosticHUDLayer *)self focusIndicatorLayer];
  objc_msgSend(v52, "setPosition:", v50, v51);

  [(DiagnosticHUDLayer *)self bounds];
  CGFloat v53 = CGRectGetMinX(v72) + 40.0;
  [(DiagnosticHUDLayer *)self bounds];
  CGFloat v54 = CGRectGetMinY(v73) + 80.0;
  v55 = [(DiagnosticHUDLayer *)self frameIndicator];
  objc_msgSend(v55, "setPosition:", v53, v54);
}

- (void)setBoxPoints:(id)a3
{
  id v16 = a3;
  [MEMORY[0x263F158F8] begin];
  double v4 = [MEMORY[0x263F15760] animationWithKeyPath:@"fillColor"];
  id v5 = [(DiagnosticHUDLayer *)self freshPointColor];
  objc_msgSend(v4, "setFromValue:", objc_msgSend(v5, "CGColor"));

  id v6 = [(DiagnosticHUDLayer *)self stalePointColor];
  objc_msgSend(v4, "setToValue:", objc_msgSend(v6, "CGColor"));

  [v4 setDuration:1.0];
  for (uint64_t i = 0; i != 4; ++i)
  {
    double v8 = [v16 objectAtIndex:i];
    double v9 = [(DiagnosticHUDLayer *)self pointLayers];
    double v10 = [v9 objectAtIndex:i];

    [v10 removeAllAnimations];
    [v10 setHidden:v8 == 0];
    [v8 CGPointValue];
    objc_msgSend(v10, "setPosition:");
    v11 = NSDictionary;
    v12 = [MEMORY[0x263EFF9D0] null];
    double v13 = [MEMORY[0x263EFF9D0] null];
    uint64_t v14 = objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", v12, @"hidden", v13, @"position", 0);
    [v10 setActions:v14];

    [v10 addAnimation:v4 forKey:@"fillColor"];
    v15 = [v4 toValue];
    [v10 setFillColor:v15];
  }
  [MEMORY[0x263F158F8] commit];
}

- (void)setPreviewLayer:(id)a3 visibleRect:(CGRect)a4 cameraResolution:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.size.height;
  double v8 = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  [(DiagnosticHUDLayer *)self setPreviewLayer:a3];
  -[DiagnosticHUDLayer setPreviewLayerVisibleRect:](self, "setPreviewLayerVisibleRect:", x, y, v8, v7);
  -[DiagnosticHUDLayer setCameraResolution:](self, "setCameraResolution:", width, height);
  [(DiagnosticHUDLayer *)self setNeedsLayout];
}

- (void)setAdjustingFocus:(BOOL)a3 pointOfInterestSupported:(BOOL)a4 focusPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v7 = a4;
  BOOL v8 = a3;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  double v10 = [(DiagnosticHUDLayer *)self focusIndicatorLayer];
  [v10 setHidden:!v8];

  v11 = [(DiagnosticHUDLayer *)self focusPointLayer];
  v12 = v11;
  if (v7)
  {
    [v11 setHidden:0];

    if (v8) {
      +[CRColor blueColor];
    }
    else {
    id v13 = +[CRColor grayColor];
    }
    uint64_t v14 = [v13 CGColor];
    v15 = [(DiagnosticHUDLayer *)self focusPointLayer];
    [v15 setStrokeColor:v14];

    v12 = [(DiagnosticHUDLayer *)self focusPointLayer];
    objc_msgSend(v12, "setPosition:", x, y);
  }
  else
  {
    [v11 setHidden:1];
  }

  id v16 = (void *)MEMORY[0x263F158F8];
  [v16 commit];
}

- (void)refreshFrameIndicator
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:0];
  v3 = [(DiagnosticHUDLayer *)self frameIndicator];
  [v3 setHidden:0];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__DiagnosticHUDLayer_refreshFrameIndicator__block_invoke;
  v4[3] = &unk_26429E0D8;
  v4[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v4];
  [MEMORY[0x263F158F8] commit];
}

uint64_t __43__DiagnosticHUDLayer_refreshFrameIndicator__block_invoke(uint64_t a1)
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:0];
  [MEMORY[0x263F158F8] setAnimationDuration:2.0];
  id v2 = [*(id *)(a1 + 32) frameIndicator];
  [v2 setHidden:1];

  v3 = (void *)MEMORY[0x263F158F8];
  return [v3 commit];
}

- (CALayer)previewLayer
{
  return (CALayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPreviewLayer:(id)a3
{
}

- (CGRect)previewLayerVisibleRect
{
  objc_copyStruct(v6, &self->_previewLayerVisibleRect, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setPreviewLayerVisibleRect:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_previewLayerVisibleRect, &v3, 32, 1, 0);
}

- (CGSize)cameraResolution
{
  objc_copyStruct(v4, &self->_cameraResolution, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setCameraResolution:(CGSize)a3
{
  CGSize v3 = a3;
  objc_copyStruct(&self->_cameraResolution, &v3, 16, 1, 0);
}

- (CRColor)freshPointColor
{
  return (CRColor *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFreshPointColor:(id)a3
{
}

- (CRColor)stalePointColor
{
  return (CRColor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStalePointColor:(id)a3
{
}

- (NSMutableArray)pointLayers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPointLayers:(id)a3
{
}

- (CAShapeLayer)cameraAreaLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCameraAreaLayer:(id)a3
{
}

- (CAShapeLayer)focusIndicatorLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setFocusIndicatorLayer:(id)a3
{
}

- (CAShapeLayer)focusPointLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFocusPointLayer:(id)a3
{
}

- (CAShapeLayer)frameIndicator
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFrameIndicator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameIndicator, 0);
  objc_storeStrong((id *)&self->_focusPointLayer, 0);
  objc_storeStrong((id *)&self->_focusIndicatorLayer, 0);
  objc_storeStrong((id *)&self->_cameraAreaLayer, 0);
  objc_storeStrong((id *)&self->_pointLayers, 0);
  objc_storeStrong((id *)&self->_stalePointColor, 0);
  objc_storeStrong((id *)&self->_freshPointColor, 0);
  objc_storeStrong((id *)&self->_previewLayer, 0);
}

@end