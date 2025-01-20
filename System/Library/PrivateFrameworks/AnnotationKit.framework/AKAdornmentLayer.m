@interface AKAdornmentLayer
+ (Class)_adornmentClassForAnnotation:(id)a3;
+ (id)newAdornmentLayerForAnnotation:(id)a3 withPageController:(id)a4;
- (AKAnnotation)annotation;
- (AKPageController)pageController;
- (BOOL)isObservingAnnotation;
- (BOOL)isObservingEventHandling;
- (BOOL)needsUpdateWhenDraggingStartsOrEnds;
- (CALayer)handleContainerLayer;
- (double)currentScaleFactor;
- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4;
- (id)actionForKey:(id)a3;
- (id)handleSublayerWithStyle:(unint64_t)a3;
- (unint64_t)currentlyDraggedArea;
- (void)_addHandleSublayerAtPoint:(CGPoint)a3 withStyle:(unint64_t)a4;
- (void)_startObservingAnnotation;
- (void)_startObservingAnnotationEventHandlers;
- (void)_stopObservingAnnotation;
- (void)_stopObservingAnnotationEventHandlers;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAnnotation:(id)a3;
- (void)setCurrentScaleFactor:(double)a3;
- (void)setHandleContainerLayer:(id)a3;
- (void)setIsObservingAnnotation:(BOOL)a3;
- (void)setIsObservingEventHandling:(BOOL)a3;
- (void)setPageController:(id)a3;
- (void)teardown;
- (void)updateAdornmentElements;
- (void)updatePixelAlignment;
- (void)updateSublayersWithScale:(double)a3;
@end

@implementation AKAdornmentLayer

+ (id)newAdornmentLayerForAnnotation:(id)a3 withPageController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "_adornmentClassForAnnotation:", v7)), "_initWithAnnotation:andPageController:", v7, v6);

  return v8;
}

- (id)_initWithAnnotation:(id)a3 andPageController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKAdornmentLayer;
  v8 = [(AKAdornmentLayer *)&v14 init];
  v9 = v8;
  if (v8)
  {
    [(AKAdornmentLayer *)v8 setAnnotation:v6];
    [(AKAdornmentLayer *)v9 setPageController:v7];
    [(AKAdornmentLayer *)v9 setCurrentScaleFactor:9.22337204e18];
    v10 = [v7 geometryHelper];
    [v10 adornmentLayerFrameForAnnotation:v6];
    -[AKAdornmentLayer setFrame:](v9, "setFrame:");

    id v11 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(AKAdornmentLayer *)v9 setHandleContainerLayer:v11];

    v12 = [(AKAdornmentLayer *)v9 handleContainerLayer];
    [(AKAdornmentLayer *)v9 addSublayer:v12];

    [(AKAdornmentLayer *)v9 updateAdornmentElements];
    [(AKAdornmentLayer *)v9 _startObservingAnnotation];
    if ([(AKAdornmentLayer *)v9 needsUpdateWhenDraggingStartsOrEnds]) {
      [(AKAdornmentLayer *)v9 _startObservingAnnotationEventHandlers];
    }
  }

  return v9;
}

- (void)dealloc
{
  [(AKAdornmentLayer *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)AKAdornmentLayer;
  [(AKAdornmentLayer *)&v3 dealloc];
}

- (void)teardown
{
  [(AKAdornmentLayer *)self _stopObservingAnnotation];

  [(AKAdornmentLayer *)self _stopObservingAnnotationEventHandlers];
}

- (id)actionForKey:(id)a3
{
  return 0;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == @"AKAdornmentLayer.modelAnnotationObservationContext")
  {
    if ([v10 isEqualToString:@"drawingBounds"])
    {
      v13 = [(AKAdornmentLayer *)self pageController];
      objc_super v14 = [v13 geometryHelper];
      v15 = [(AKAdornmentLayer *)self annotation];
      [v14 adornmentLayerFrameForAnnotation:v15];
      -[AKAdornmentLayer setFrame:](self, "setFrame:");
    }
    goto LABEL_6;
  }
  if (a6 == @"AKAdornmentLayer.eventHandlingObservationContext")
  {
LABEL_6:
    [(AKAdornmentLayer *)self updateAdornmentElements];
    goto LABEL_7;
  }
  v16.receiver = self;
  v16.super_class = (Class)AKAdornmentLayer;
  [(AKAdornmentLayer *)&v16 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
LABEL_7:
}

- (BOOL)needsUpdateWhenDraggingStartsOrEnds
{
  return 0;
}

- (unint64_t)currentlyDraggedArea
{
  objc_super v3 = [(AKAdornmentLayer *)self pageController];
  v4 = [v3 controller];
  v5 = [v4 mainEventHandler];
  id v6 = [v5 annotationEventHandler];

  if (v6
    && ([v6 annotation],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [(AKAdornmentLayer *)self annotation],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v7 == v8))
  {
    unint64_t v9 = [v6 initiallyDraggedArea];
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (void)updatePixelAlignment
{
  objc_super v3 = [(AKAdornmentLayer *)self pageController];
  if (v3)
  {
    id v4 = v3;
    [(AKAdornmentLayer *)self updateAdornmentElements];
    objc_super v3 = v4;
  }
}

- (void)updateAdornmentElements
{
  objc_super v3 = [(AKAdornmentLayer *)self pageController];
  id v37 = 0;
  id v38 = 0;
  id v4 = [(AKAdornmentLayer *)self annotation];
  +[AKAnnotationPointOfInterestHelper pointsOfInterest:&v38 withVisualStyle:&v37 ofAnnotation:v4 pageControllerForPixelAlignment:v3];
  id v5 = v38;
  id v6 = v37;

  id v7 = [v5 reverseObjectEnumerator];
  v8 = [v7 allObjects];

  unint64_t v9 = [v6 reverseObjectEnumerator];
  id v10 = [v9 allObjects];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  id v11 = [(AKAdornmentLayer *)self handleContainerLayer];
  id v12 = [(AKAdornmentLayer *)self annotation];
  if (![v12 isEditingText])
  {
    BOOL v16 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = [(AKAdornmentLayer *)self annotation];
  int v14 = [v13 isMemberOfClass:objc_opt_class()];

  if (v14)
  {
    id v12 = [(AKAdornmentLayer *)self annotation];
    v15 = [v12 fillColor];
    if (v15)
    {
      BOOL v16 = 0;
    }
    else
    {
      v17 = [v12 strokeColor];
      if (v17)
      {
        [v12 strokeWidth];
        BOOL v16 = v18 <= 0.0;
      }
      else
      {
        BOOL v16 = 1;
      }
    }
    goto LABEL_12;
  }
  BOOL v16 = 0;
LABEL_13:
  uint64_t v19 = [v8 count];
  v20 = [v11 sublayers];
  uint64_t v21 = [v20 count];

  if (v19 != v21 || v16)
  {
    v22 = [v11 sublayers];
    [v22 makeObjectsPerformSelector:sel_removeFromSuperlayer];
  }
  v23 = [v11 sublayers];
  uint64_t v24 = [v23 count];

  if (v24)
  {
    v25 = [v11 sublayers];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = sub_23767C770;
    v30[3] = &unk_264CDB6F0;
    v26 = &v31;
    id v31 = v8;
    v27 = (id *)v32;
    v32[0] = v3;
    v32[1] = self;
    [v25 enumerateObjectsUsingBlock:v30];
  }
  else
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = sub_23767C680;
    v33[3] = &unk_264CDB6C8;
    v26 = &v34;
    id v34 = v10;
    BOOL v36 = v16;
    v27 = (id *)v35;
    v35[0] = v3;
    v35[1] = self;
    [v8 enumerateObjectsUsingBlock:v33];
  }

  v28 = [(AKAdornmentLayer *)self handleContainerLayer];
  [v28 removeFromSuperlayer];

  v29 = [(AKAdornmentLayer *)self handleContainerLayer];
  [(AKAdornmentLayer *)self addSublayer:v29];

  [MEMORY[0x263F158F8] commit];
}

- (void)updateSublayersWithScale:(double)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  -[AKAdornmentLayer setCurrentScaleFactor:](self, "setCurrentScaleFactor:");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(AKAdornmentLayer *)self handleContainerLayer];
  id v6 = [v5 sublayers];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    double v10 = 1.0 / a3;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        CGAffineTransformMakeScale(&v13, v10, v10);
        [v12 setAffineTransform:&v13];
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (id)handleSublayerWithStyle:(unint64_t)a3
{
  if (a3 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [(__objc2_class *)*off_264CDB710[a3] layer];
  }
  [(AKAdornmentLayer *)self currentScaleFactor];
  if (v5 != 9.22337204e18)
  {
    CGAffineTransformMakeScale(&v7, 1.0 / v5, 1.0 / v5);
    [v4 setAffineTransform:&v7];
  }

  return v4;
}

- (void)_addHandleSublayerAtPoint:(CGPoint)a3 withStyle:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = [(AKAdornmentLayer *)self handleSublayerWithStyle:a4];
  if (v8)
  {
    CGAffineTransform v7 = [(AKAdornmentLayer *)self handleContainerLayer];
    [v7 addSublayer:v8];

    objc_msgSend(v8, "setPosition:", x, y);
  }
}

- (void)_startObservingAnnotation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (![(AKAdornmentLayer *)self isObservingAnnotation])
  {
    objc_super v3 = [(AKAdornmentLayer *)self annotation];
    id v4 = [v3 keysForValuesToObserveForAdornments];
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
          [v3 addObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) options:0 context:@"AKAdornmentLayer.modelAnnotationObservationContext"];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    [(AKAdornmentLayer *)self setIsObservingAnnotation:1];
  }
}

- (void)_stopObservingAnnotation
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if ([(AKAdornmentLayer *)self isObservingAnnotation])
  {
    objc_super v3 = [(AKAdornmentLayer *)self annotation];
    id v4 = [v3 keysForValuesToObserveForAdornments];
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
          [v3 removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v8++) context:@"AKAdornmentLayer.modelAnnotationObservationContext"];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    [(AKAdornmentLayer *)self setIsObservingAnnotation:0];
  }
}

- (void)_startObservingAnnotationEventHandlers
{
  if (![(AKAdornmentLayer *)self isObservingEventHandling])
  {
    id v5 = [(AKAdornmentLayer *)self pageController];
    objc_super v3 = [v5 controller];
    id v4 = [v3 mainEventHandler];
    [v4 addObserver:self forKeyPath:@"annotationEventHandler" options:0 context:@"AKAdornmentLayer.eventHandlingObservationContext"];
    [(AKAdornmentLayer *)self setIsObservingEventHandling:1];
  }
}

- (void)_stopObservingAnnotationEventHandlers
{
  if ([(AKAdornmentLayer *)self isObservingEventHandling])
  {
    id v5 = [(AKAdornmentLayer *)self pageController];
    objc_super v3 = [v5 controller];
    id v4 = [v3 mainEventHandler];
    [v4 removeObserver:self forKeyPath:@"annotationEventHandler" context:@"AKAdornmentLayer.eventHandlingObservationContext"];
    [(AKAdornmentLayer *)self setIsObservingEventHandling:0];
  }
}

+ (Class)_adornmentClassForAnnotation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && ![v3 isMemberOfClass:objc_opt_class()])
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v3 visualStyle];
            }
          }
        }
      }
    }
  }
  id v4 = (objc_class *)(id)objc_opt_class();

  return v4;
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

- (double)currentScaleFactor
{
  return self->_currentScaleFactor;
}

- (void)setCurrentScaleFactor:(double)a3
{
  self->_currentScaleFactor = a3;
}

- (BOOL)isObservingAnnotation
{
  return self->_isObservingAnnotation;
}

- (void)setIsObservingAnnotation:(BOOL)a3
{
  self->_isObservingAnnotation = a3;
}

- (CALayer)handleContainerLayer
{
  return (CALayer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setHandleContainerLayer:(id)a3
{
}

- (BOOL)isObservingEventHandling
{
  return self->_isObservingEventHandling;
}

- (void)setIsObservingEventHandling:(BOOL)a3
{
  self->_isObservingEventHandling = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleContainerLayer, 0);
  objc_destroyWeak((id *)&self->_pageController);

  objc_storeStrong((id *)&self->_annotation, 0);
}

@end