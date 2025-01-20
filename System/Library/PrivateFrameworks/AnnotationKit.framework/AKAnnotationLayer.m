@interface AKAnnotationLayer
+ (id)newAnnotationLayerForAnnotation:(id)a3 withPageController:(id)a4;
- (AKAnnotation)annotation;
- (AKPageController)pageController;
- (BOOL)isObservingAnnotation;
- (BOOL)lastRedrawWasForDrawingBounds;
- (BOOL)shouldRecalculateLoupeImage;
- (BOOL)wasLastDrawingClipped;
- (CALayer)fastPathLayer;
- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4;
- (id)actionForKey:(id)a3;
- (void)_addDebugVisuals;
- (void)_removeDebugVisuals;
- (void)_startObservingAnnotation;
- (void)_stopObservingAnnotation;
- (void)_updateAnnotationLayerWithLoupeFastPath:(BOOL)a3;
- (void)dealloc;
- (void)drawInContext:(CGContext *)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnnotation:(id)a3;
- (void)setFastPathLayer:(id)a3;
- (void)setIsObservingAnnotation:(BOOL)a3;
- (void)setLastRedrawWasForDrawingBounds:(BOOL)a3;
- (void)setPageController:(id)a3;
- (void)setShouldRecalculateLoupeImage:(BOOL)a3;
- (void)setWasLastDrawingClipped:(BOOL)a3;
- (void)updateContents;
- (void)updatePixelAlignment;
@end

@implementation AKAnnotationLayer

+ (id)newAnnotationLayerForAnnotation:(id)a3 withPageController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithAnnotation:v7 andPageController:v6];

  return v8;
}

- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)AKAnnotationLayer;
  v8 = [(AKAnnotationLayer *)&v28 init];
  v9 = v8;
  if (v8)
  {
    [(AKAnnotationLayer *)v8 setAnnotation:v6];
    [(AKAnnotationLayer *)v9 setPageController:v7];
    [(AKAnnotationLayer *)v9 setShouldRecalculateLoupeImage:1];
    [(AKAnnotationLayer *)v9 setDrawsAsynchronously:1];
    v10 = [v7 geometryHelper];
    v11 = [(AKAnnotationLayer *)v9 annotation];
    [v10 annotationLayerFrameForAnnotation:v11 layerIsClipped:0];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;

    -[AKAnnotationLayer setFrame:](v9, "setFrame:", v13, v15, v17, v19);
    [(AKAnnotationLayer *)v9 _startObservingAnnotation];
    [(AKAnnotationLayer *)v9 _updateAnnotationLayerWithLoupeFastPath:1];
    v20 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v22 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D18]];
      [(AKAnnotationLayer *)v9 setCompositingFilter:v22];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_initWeak(&location, v9);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_237665174;
      block[3] = &unk_264CDB188;
      objc_copyWeak(&v26, &location);
      id v25 = v6;
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    if (sub_2376C95F0()) {
      [(AKAnnotationLayer *)v9 _addDebugVisuals];
    }
  }

  return v9;
}

- (void)dealloc
{
  [(AKAnnotationLayer *)self _stopObservingAnnotation];
  v3.receiver = self;
  v3.super_class = (Class)AKAnnotationLayer;
  [(AKAnnotationLayer *)&v3 dealloc];
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  v7.receiver = self;
  v7.super_class = (Class)AKAnnotationLayer;
  [(AKAnnotationLayer *)&v7 drawInContext:a3];
  v5 = [(AKAnnotationLayer *)self pageController];
  id v6 = [(AKAnnotationLayer *)self annotation];
  +[AKAnnotationRenderer renderAnnotation:v6 intoContext:a3 forDisplay:1 pageControllerOrNil:v5];

  CGContextRestoreGState(a3);
}

- (void)updateContents
{
  [(AKAnnotationLayer *)self _updateAnnotationLayerWithLoupeFastPath:0];

  [(AKAnnotationLayer *)self setNeedsDisplay];
}

- (void)updatePixelAlignment
{
  objc_super v3 = [(AKAnnotationLayer *)self pageController];
  if (v3)
  {
    id v16 = v3;
    v4 = [v3 geometryHelper];
    v5 = [(AKAnnotationLayer *)self annotation];
    [v4 annotationLayerFrameForAnnotation:v5 layerIsClipped:0];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    -[AKAnnotationLayer setFrame:](self, "setFrame:", v7, v9, v11, v13);
    [(AKAnnotationLayer *)self borderWidth];
    if ((((v14 != 1.0) ^ sub_2376C95F0()) & 1) == 0)
    {
      [(AKAnnotationLayer *)self borderWidth];
      if (v15 == 0.0) {
        [(AKAnnotationLayer *)self _addDebugVisuals];
      }
      else {
        [(AKAnnotationLayer *)self _removeDebugVisuals];
      }
    }
    [(AKAnnotationLayer *)self setNeedsDisplay];
    [MEMORY[0x263F158F8] commit];
    objc_super v3 = v16;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  if (a6 == @"AKAnnotationLayer.modelAnnotationObservationContext")
  {
    uint64_t v11 = [(AKAnnotationLayer *)self pageController];
    if (!v11) {
      goto LABEL_30;
    }
    double v12 = (void *)v11;
    BOOL v13 = [(AKAnnotationLayer *)self lastRedrawWasForDrawingBounds];
    [(AKAnnotationLayer *)self setLastRedrawWasForDrawingBounds:0];
    -[AKAnnotationLayer setShouldRecalculateLoupeImage:](self, "setShouldRecalculateLoupeImage:", [v10 isEqualToString:@"strokeColor"] ^ 1);
    if (![v10 isEqualToString:@"drawingBounds"])
    {
      if (v13 && ([v10 isEqualToString:@"rectangle"] & 1) != 0) {
        goto LABEL_29;
      }
      id v26 = [(AKAnnotationLayer *)self annotation];
      if ([v26 isTranslating])
      {
        v27 = [(AKAnnotationLayer *)self annotation];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          goto LABEL_29;
        }
      }
      else
      {
      }
      v38 = [(AKAnnotationLayer *)self annotation];
      -[AKAnnotationLayer _updateAnnotationLayerWithLoupeFastPath:](self, "_updateAnnotationLayerWithLoupeFastPath:", [v38 isDraggingHandle]);

LABEL_29:
      [(AKAnnotationLayer *)self setShouldRecalculateLoupeImage:1];

      goto LABEL_30;
    }
    [MEMORY[0x263F158F8] begin];
    BOOL v14 = 1;
    [MEMORY[0x263F158F8] setDisableActions:1];
    char v42 = 0;
    double v15 = [v12 geometryHelper];
    id v16 = [(AKAnnotationLayer *)self annotation];
    [v15 annotationLayerFrameForAnnotation:v16 layerIsClipped:&v42];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    if (v42)
    {
      BOOL v25 = 0;
    }
    else
    {
      BOOL v25 = [(AKAnnotationLayer *)self wasLastDrawingClipped];
      BOOL v14 = v42 != 0;
    }
    [(AKAnnotationLayer *)self setWasLastDrawingClipped:v14];
    v29 = [(AKAnnotationLayer *)self annotation];
    objc_opt_class();
    char v30 = objc_opt_isKindOfClass();

    if (!v42 && !v25 && (v30 & 1) == 0)
    {
      v31 = [(AKAnnotationLayer *)self annotation];
      if ([v31 isTranslating])
      {
        v32 = [(AKAnnotationLayer *)self annotation];
        char v33 = [v32 isEditingText];

        if ((v33 & 1) == 0)
        {
          v34 = [(AKAnnotationLayer *)self annotation];
          int v35 = [v34 isTranslating];

          if (v35)
          {
            [(AKAnnotationLayer *)self frame];
            double v22 = v36;
            double v24 = v37;
          }
          -[AKAnnotationLayer setFrame:](self, "setFrame:", v18, v20, v22, v24);
          goto LABEL_28;
        }
      }
      else
      {
      }
    }
    -[AKAnnotationLayer setFrame:](self, "setFrame:", v18, v20, v22, v24);
    [(AKAnnotationLayer *)self setLastRedrawWasForDrawingBounds:1];
    v39 = [(AKAnnotationLayer *)self annotation];
    if ([v39 isTranslating])
    {
      [(AKAnnotationLayer *)self _updateAnnotationLayerWithLoupeFastPath:1];
    }
    else
    {
      v40 = [(AKAnnotationLayer *)self annotation];
      -[AKAnnotationLayer _updateAnnotationLayerWithLoupeFastPath:](self, "_updateAnnotationLayerWithLoupeFastPath:", [v40 isDraggingHandle]);
    }
LABEL_28:
    [MEMORY[0x263F158F8] commit];
    goto LABEL_29;
  }
  v41.receiver = self;
  v41.super_class = (Class)AKAnnotationLayer;
  [(AKAnnotationLayer *)&v41 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
LABEL_30:
}

- (void)_updateAnnotationLayerWithLoupeFastPath:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [MEMORY[0x263F08B88] currentThread];
  double v6 = [v5 threadDictionary];

  if (v3) {
    uint64_t v7 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v7 = MEMORY[0x263EFFA80];
  }
  [v6 setObject:v7 forKey:@"AKAnnotationRendererIsFastPathRenderingOnCurrentThread"];
  double v8 = [(AKAnnotationLayer *)self annotation];
  if (!v3
    || !+[AKAnnotationRenderer annotationShouldAvoidRedrawDuringLiveResize:v8])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v9 = [(AKAnnotationLayer *)self pageController];
      id v10 = v8;
      uint64_t v11 = v10;
      if (v3)
      {
        double v12 = [(AKAnnotationLayer *)self fastPathLayer];

        if (!v12)
        {
          BOOL v13 = [MEMORY[0x263F15880] layer];
          [v13 setFillRule:*MEMORY[0x263F15AC0]];
          id v14 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
          objc_msgSend(v13, "setFillColor:", objc_msgSend(v14, "CGColor"));

          double v15 = [MEMORY[0x263F157E8] layer];
          [(AKAnnotationLayer *)self setFastPathLayer:v15];

          id v16 = [(AKAnnotationLayer *)self fastPathLayer];
          [v16 setMask:v13];

          uint64_t v17 = *MEMORY[0x263F15D28];
          double v18 = [(AKAnnotationLayer *)self fastPathLayer];
          [v18 setMinificationFilter:v17];

          double v19 = [(AKAnnotationLayer *)self fastPathLayer];
          [v19 setMagnificationFilter:v17];

          double v20 = [(AKAnnotationLayer *)self superlayer];
          double v21 = [(AKAnnotationLayer *)self fastPathLayer];
          [v20 addSublayer:v21];

          [(AKAnnotationLayer *)self zPosition];
          double v23 = v22 + -0.5;
          double v24 = [(AKAnnotationLayer *)self fastPathLayer];
          [v24 setZPosition:v23];

          id v25 = [MEMORY[0x263F1C550] whiteColor];
          uint64_t v26 = [v25 CGColor];
          v27 = [(AKAnnotationLayer *)self fastPathLayer];
          [v27 setBackgroundColor:v26];

          long long v42 = 0u;
          long long v43 = 0u;
          long long v41 = 0u;
          objc_super v28 = [(AKAnnotationLayer *)self fastPathLayer];
          +[AKLoupeAnnotationImageUpdaterHelper transformForFastPathLayer:v28 ofLoupeAnnotation:v11 onPageController:v9];

          long long v38 = v41;
          long long v39 = v42;
          long long v40 = v43;
          v29 = [(AKAnnotationLayer *)self fastPathLayer];
          v37[0] = v38;
          v37[1] = v39;
          v37[2] = v40;
          [v29 setAffineTransform:v37];
        }
        char v30 = [(AKAnnotationLayer *)self fastPathLayer];
        +[AKLoupeAnnotationImageUpdaterHelper updateFastPathImageOnLoupeAnnotation:v11 withFastPathLayer:v30 onPageController:v9];
      }
      else
      {
        uint64_t v31 = [v10 imageData];
        if (!v31
          || (v32 = (void *)v31,
              BOOL v33 = [(AKAnnotationLayer *)self shouldRecalculateLoupeImage],
              v32,
              v33))
        {
          +[AKLoupeAnnotationImageUpdaterHelper updateModelImageOnLoupeAnnotation:v11 onPageController:v9];
        }
        v34 = [(AKAnnotationLayer *)self fastPathLayer];

        if (v34)
        {
          int v35 = [(AKAnnotationLayer *)self fastPathLayer];
          [v35 removeFromSuperlayer];

          double v36 = [(AKAnnotationLayer *)self fastPathLayer];
          [v36 setContents:0];

          [(AKAnnotationLayer *)self setFastPathLayer:0];
        }
      }
    }
    [(AKAnnotationLayer *)self setNeedsDisplay];
  }
}

- (void)_startObservingAnnotation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(AKAnnotationLayer *)self isObservingAnnotation])
  {
    BOOL v3 = [(AKAnnotationLayer *)self annotation];
    v4 = [v3 keysForValuesToObserveForRedrawing];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:0 context:@"AKAnnotationLayer.modelAnnotationObservationContext"];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    [(AKAnnotationLayer *)self setIsObservingAnnotation:1];
  }
}

- (void)_stopObservingAnnotation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(AKAnnotationLayer *)self isObservingAnnotation])
  {
    BOOL v3 = [(AKAnnotationLayer *)self annotation];
    v4 = [v3 keysForValuesToObserveForRedrawing];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) context:@"AKAnnotationLayer.modelAnnotationObservationContext"];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    [(AKAnnotationLayer *)self setIsObservingAnnotation:0];
  }
}

- (void)_addDebugVisuals
{
  id v3 = [MEMORY[0x263F1C550] blackColor];
  -[AKAnnotationLayer setBorderColor:](self, "setBorderColor:", [v3 CGColor]);

  [(AKAnnotationLayer *)self setBorderWidth:1.0];
  id v8 = objc_alloc_init(MEMORY[0x263F15880]);
  [v8 setZPosition:100.0];
  id v4 = [MEMORY[0x263F1C550] greenColor];
  objc_msgSend(v8, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  id v5 = [MEMORY[0x263F1C550] yellowColor];
  objc_msgSend(v8, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  [v8 setBorderWidth:2.0];
  objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.5);
  objc_msgSend(v8, "setBounds:", 0.0, 0.0, 50.0, 50.0);
  objc_msgSend(v8, "setPosition:", 0.0, 0.0);
  id v6 = objc_alloc_init(MEMORY[0x263F15880]);
  id v7 = [MEMORY[0x263F1C550] yellowColor];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  objc_msgSend(v6, "setAnchorPoint:", 0.0, 0.0);
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, 12.5, 20.0);
  objc_msgSend(v6, "setPosition:", 37.5, 30.0);
  [v8 addSublayer:v6];
  [(AKAnnotationLayer *)self addSublayer:v8];
}

- (void)_removeDebugVisuals
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(AKAnnotationLayer *)self setBorderWidth:0.0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(AKAnnotationLayer *)self sublayers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v8 borderWidth];
          if (v9 == 2.0) {
            [v8 removeFromSuperlayer];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (AKAnnotation)annotation
{
  return (AKAnnotation *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAnnotation:(id)a3
{
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (CALayer)fastPathLayer
{
  return self->_fastPathLayer;
}

- (void)setFastPathLayer:(id)a3
{
}

- (BOOL)isObservingAnnotation
{
  return self->_isObservingAnnotation;
}

- (void)setIsObservingAnnotation:(BOOL)a3
{
  self->_isObservingAnnotation = a3;
}

- (BOOL)wasLastDrawingClipped
{
  return self->_wasLastDrawingClipped;
}

- (void)setWasLastDrawingClipped:(BOOL)a3
{
  self->_wasLastDrawingClipped = a3;
}

- (BOOL)lastRedrawWasForDrawingBounds
{
  return self->_lastRedrawWasForDrawingBounds;
}

- (void)setLastRedrawWasForDrawingBounds:(BOOL)a3
{
  self->_lastRedrawWasForDrawingBounds = a3;
}

- (BOOL)shouldRecalculateLoupeImage
{
  return self->_shouldRecalculateLoupeImage;
}

- (void)setShouldRecalculateLoupeImage:(BOOL)a3
{
  self->_shouldRecalculateLoupeImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastPathLayer, 0);
  objc_destroyWeak((id *)&self->_pageController);

  objc_storeStrong((id *)&self->_annotation, 0);
}

@end