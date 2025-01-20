@interface AKCropAdornmentLayer
- (BOOL)_shouldShowHandles;
- (BOOL)needsUpdateWhenDraggingStartsOrEnds;
- (CAShapeLayer)handlesLayer;
- (void)_addHandles;
- (void)_removeHandles;
- (void)_updateHandles;
- (void)setHandlesLayer:(id)a3;
- (void)updateAdornmentElements;
- (void)updateSublayersWithScale:(double)a3;
@end

@implementation AKCropAdornmentLayer

- (BOOL)needsUpdateWhenDraggingStartsOrEnds
{
  return 1;
}

- (void)updateAdornmentElements
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  unint64_t v3 = [(AKAdornmentLayer *)self currentlyDraggedArea];
  if (v3 - 1 < 8 || v3 == 20)
  {
    v4 = [(AKCropAdornmentLayer *)self handlesLayer];

    if (!v4) {
      [(AKCropAdornmentLayer *)self _addHandles];
    }
    [(AKCropAdornmentLayer *)self _updateHandles];
  }
  [MEMORY[0x263F158F8] commit];
  BOOL v5 = [(AKCropAdornmentLayer *)self _shouldShowHandles];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  if (!v5)
  {
    [(AKCropAdornmentLayer *)self _removeHandles];
    v11 = [(AKCropAdornmentLayer *)self handlesLayer];
    v12 = v11;
    double v13 = 0.0;
LABEL_14:
    [v11 setOpacity:v13];

    [MEMORY[0x263F158F8] commit];
    goto LABEL_15;
  }
  v6 = [(AKCropAdornmentLayer *)self handlesLayer];
  v7 = [v6 superlayer];

  v8 = [(AKCropAdornmentLayer *)self handlesLayer];

  if (!v8) {
    [(AKCropAdornmentLayer *)self _addHandles];
  }
  [(AKCropAdornmentLayer *)self _updateHandles];
  [MEMORY[0x263F158F8] commit];
  if (!v7)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:0];
    [MEMORY[0x263F158F8] setAnimationDuration:0.2];
    v11 = [(AKCropAdornmentLayer *)self handlesLayer];
    v12 = v11;
    LODWORD(v13) = 1.0;
    goto LABEL_14;
  }
  v9 = [(AKCropAdornmentLayer *)self handlesLayer];
  LODWORD(v10) = 1.0;
  [v9 setOpacity:v10];

LABEL_15:
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v14.receiver = self;
  v14.super_class = (Class)AKCropAdornmentLayer;
  [(AKAdornmentLayer *)&v14 updateAdornmentElements];
  [MEMORY[0x263F158F8] commit];
}

- (void)updateSublayersWithScale:(double)a3
{
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v5.receiver = self;
  v5.super_class = (Class)AKCropAdornmentLayer;
  [(AKAdornmentLayer *)&v5 updateSublayersWithScale:a3];
  [MEMORY[0x263F158F8] commit];
}

- (BOOL)_shouldShowHandles
{
  v2 = [(AKAdornmentLayer *)self annotation];
  char v3 = [v2 showHandles];

  return v3;
}

- (void)_addHandles
{
  id v14 = [(AKAdornmentLayer *)self annotation];
  char v3 = objc_opt_new();
  [(AKCropAdornmentLayer *)self setHandlesLayer:v3];

  v4 = [(AKCropAdornmentLayer *)self handlesLayer];
  [v4 setMasksToBounds:0];

  objc_super v5 = [(AKCropAdornmentLayer *)self handlesLayer];
  [v5 setOpacity:0.0];

  uint64_t v6 = [v14 color];
  v7 = [(AKCropAdornmentLayer *)self handlesLayer];
  [v7 setFillColor:v6];

  uint64_t v8 = [v14 color];
  v9 = [(AKCropAdornmentLayer *)self handlesLayer];
  [v9 setStrokeColor:v8];

  [(AKAdornmentLayer *)self currentScaleFactor];
  double v11 = 1.0 / v10;
  v12 = [(AKCropAdornmentLayer *)self handlesLayer];
  [v12 setLineWidth:v11];

  double v13 = [(AKCropAdornmentLayer *)self handlesLayer];
  [(AKCropAdornmentLayer *)self addSublayer:v13];
}

- (void)_updateHandles
{
  id v14 = [(AKAdornmentLayer *)self annotation];
  char v3 = [(AKAdornmentLayer *)self pageController];
  Mutable = CGPathCreateMutable();
  objc_super v5 = +[AKCropAnnotationRenderer cropHandle:0 forAnnotation:v14 withPageController:v3];
  uint64_t v6 = +[AKCropAnnotationRenderer cropHandle:1 forAnnotation:v14 withPageController:v3];
  v7 = +[AKCropAnnotationRenderer cropHandle:2 forAnnotation:v14 withPageController:v3];
  uint64_t v8 = +[AKCropAnnotationRenderer cropHandle:3 forAnnotation:v14 withPageController:v3];
  if (v5) {
    CGPathAddPath(Mutable, 0, v5);
  }
  if (v6) {
    CGPathAddPath(Mutable, 0, v6);
  }
  if (v7) {
    CGPathAddPath(Mutable, 0, v7);
  }
  if (v8) {
    CGPathAddPath(Mutable, 0, v8);
  }
  CGPathRelease(v5);
  CGPathRelease(v6);
  CGPathRelease(v7);
  CGPathRelease(v8);
  v9 = +[AKCropAnnotationRenderer cropHandle:4 forAnnotation:v14 withPageController:v3];
  double v10 = +[AKCropAnnotationRenderer cropHandle:5 forAnnotation:v14 withPageController:v3];
  double v11 = +[AKCropAnnotationRenderer cropHandle:6 forAnnotation:v14 withPageController:v3];
  v12 = +[AKCropAnnotationRenderer cropHandle:7 forAnnotation:v14 withPageController:v3];
  CGPathAddPath(Mutable, 0, v9);
  CGPathAddPath(Mutable, 0, v10);
  CGPathAddPath(Mutable, 0, v11);
  CGPathAddPath(Mutable, 0, v12);
  CGPathRelease(v9);
  CGPathRelease(v10);
  CGPathRelease(v11);
  CGPathRelease(v12);
  double v13 = [(AKCropAdornmentLayer *)self handlesLayer];
  [v13 setPath:Mutable];

  CGPathRelease(Mutable);
}

- (void)_removeHandles
{
  char v3 = [(AKCropAdornmentLayer *)self handlesLayer];
  [v3 removeFromSuperlayer];

  v4 = [(AKCropAdornmentLayer *)self handlesLayer];
  [v4 setOpacity:0.0];

  [(AKCropAdornmentLayer *)self setHandlesLayer:0];
}

- (CAShapeLayer)handlesLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHandlesLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end