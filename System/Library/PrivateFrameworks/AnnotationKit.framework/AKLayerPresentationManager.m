@interface AKLayerPresentationManager
- (AKLayerPresentationManager)initWithPageController:(id)a3;
- (AKPageController)pageController;
- (AKPageModelController)pageModelController;
- (BOOL)adornmentsHidden;
- (BOOL)isObservingModel;
- (BOOL)shouldPixelate;
- (CALayer)cropAdornmentLayer;
- (CALayer)cropAnnotationLayer;
- (CALayer)rootLayer;
- (CAShapeLayer)alignmentGuideXLayer;
- (CAShapeLayer)alignmentGuideYLayer;
- (NSMapTable)annotationsToAdornmentLayers;
- (NSMapTable)annotationsToAnnotationLayers;
- (double)_hiDPIScaleFactor;
- (double)alignmentGuidePositionX;
- (double)alignmentGuidePositionY;
- (double)currentScaleFactor;
- (id)adornmentLayerForAnnotation:(id)a3;
- (void)_addAdornmentLayerForAnnotation:(id)a3;
- (void)_addLayerForAnnotation:(id)a3;
- (void)_applyUpdatesWithScale:(double)a3 toLayers:(id)a4 isLiveUpdate:(BOOL)a5 forceUpdate:(BOOL)a6;
- (void)_removeAdornmentLayerForAnnotation:(id)a3;
- (void)_removeLayerForAnnotation:(id)a3;
- (void)_setNeedsDisplayOnNewLayer:(id)a3;
- (void)_startObservingModel;
- (void)_stopObservingModel;
- (void)_updateLoupeAnnotationsContributedToByAnnotation:(id)a3;
- (void)_updateLoupeAnnotationsIntersectingRemovedAnnotation:(id)a3;
- (void)dealloc;
- (void)forceUpdateAnnotationLayer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAdornmentsHidden:(BOOL)a3;
- (void)setAlignmentGuidePositionX:(double)a3;
- (void)setAlignmentGuidePositionY:(double)a3;
- (void)setAlignmentGuideXLayer:(id)a3;
- (void)setAlignmentGuideYLayer:(id)a3;
- (void)setAnnotationsToAdornmentLayers:(id)a3;
- (void)setAnnotationsToAnnotationLayers:(id)a3;
- (void)setCropAdornmentLayer:(id)a3;
- (void)setCropAnnotationLayer:(id)a3;
- (void)setCurrentScaleFactor:(double)a3;
- (void)setIsObservingModel:(BOOL)a3;
- (void)setPageController:(id)a3;
- (void)setPageModelController:(id)a3;
- (void)setRootLayer:(id)a3;
- (void)setShouldPixelate:(BOOL)a3;
- (void)setup;
- (void)teardown;
- (void)updateScaleFactor:(double)a3 isLiveUpdate:(BOOL)a4 forceUpdate:(BOOL)a5;
@end

@implementation AKLayerPresentationManager

- (AKLayerPresentationManager)initWithPageController:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AKLayerPresentationManager;
  v5 = [(AKLayerPresentationManager *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(AKLayerPresentationManager *)v5 setPageController:v4];
    id v7 = objc_alloc_init(MEMORY[0x263F157E8]);
    [(AKLayerPresentationManager *)v6 setRootLayer:v7];

    v8 = [(AKLayerPresentationManager *)v6 rootLayer];
    [v8 setMasksToBounds:1];

    v9 = [(AKLayerPresentationManager *)v6 rootLayer];
    [v9 setAllowsGroupBlending:0];

    v10 = [(AKLayerPresentationManager *)v6 rootLayer];
    [v10 setEdgeAntialiasingMask:0];

    v11 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    [(AKLayerPresentationManager *)v6 setAnnotationsToAnnotationLayers:v11];

    v12 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    [(AKLayerPresentationManager *)v6 setAnnotationsToAdornmentLayers:v12];

    [(AKLayerPresentationManager *)v6 setCurrentScaleFactor:1.0];
    [(AKLayerPresentationManager *)v6 setAlignmentGuidePositionX:1.79769313e308];
    [(AKLayerPresentationManager *)v6 setAlignmentGuidePositionY:1.79769313e308];
  }

  return v6;
}

- (void)dealloc
{
  [(AKLayerPresentationManager *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)AKLayerPresentationManager;
  [(AKLayerPresentationManager *)&v3 dealloc];
}

- (void)setup
{
}

- (void)teardown
{
}

- (void)setShouldPixelate:(BOOL)a3
{
  self->_shouldPixelate = a3;
  [(AKLayerPresentationManager *)self updateScaleFactor:0 isLiveUpdate:1 forceUpdate:9.22337204e18];
}

- (void)setAdornmentsHidden:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_adornmentsHidden != a3)
  {
    BOOL v3 = a3;
    self->_adornmentsHidden = a3;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = [(AKLayerPresentationManager *)self annotationsToAdornmentLayers];
    v6 = [v5 objectEnumerator];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) setHidden:v3];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [MEMORY[0x263F158F8] commit];
  }
}

- (void)updateScaleFactor:(double)a3 isLiveUpdate:(BOOL)a4 forceUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v10 = [(AKLayerPresentationManager *)self rootLayer];
  uint64_t v9 = [v10 sublayers];
  [(AKLayerPresentationManager *)self _applyUpdatesWithScale:v9 toLayers:v6 isLiveUpdate:v5 forceUpdate:a3];
}

- (void)setAlignmentGuidePositionX:(double)a3
{
  if (self->_alignmentGuidePositionX != a3)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    self->_alignmentGuidePositionX = a3;
    BOOL v5 = [(AKLayerPresentationManager *)self alignmentGuideXLayer];
    BOOL v6 = v5;
    if (a3 == 1.79769313e308)
    {
      [v5 removeFromSuperlayer];

      [(AKLayerPresentationManager *)self setAlignmentGuideXLayer:0];
    }
    else
    {

      if (!v6)
      {
        uint64_t v7 = [AKAlignmentGuideLineLayer alloc];
        [(AKLayerPresentationManager *)self currentScaleFactor];
        double v9 = v8;
        id v10 = [(AKLayerPresentationManager *)self rootLayer];
        [v10 bounds];
        long long v11 = [(AKAlignmentGuideLineLayer *)v7 initWithScaleFactor:1 forVerticalOrientation:v9 withMaxSize:CGRectGetHeight(v35)];
        [(AKLayerPresentationManager *)self setAlignmentGuideXLayer:v11];

        double v12 = (double)(unint64_t)(AKAdornmentZPositionOffset - 1);
        long long v13 = [(AKLayerPresentationManager *)self alignmentGuideXLayer];
        [v13 setZPosition:v12];

        double v14 = *MEMORY[0x263F001A8];
        double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v17 = *(double *)(MEMORY[0x263F001A8] + 24);
        v18 = [(AKLayerPresentationManager *)self alignmentGuideXLayer];
        objc_msgSend(v18, "setFrame:", v14, v15, v16, v17);

        v19 = [(AKLayerPresentationManager *)self rootLayer];
        v20 = [(AKLayerPresentationManager *)self alignmentGuideXLayer];
        [v19 addSublayer:v20];
      }
      v21 = [(AKLayerPresentationManager *)self alignmentGuideXLayer];
      [v21 position];
      double v23 = v22;

      v24 = [(AKLayerPresentationManager *)self pageController];
      v25 = [v24 geometryHelper];
      v26 = [(AKLayerPresentationManager *)self alignmentGuideXLayer];
      [v26 lineWidth];
      objc_msgSend(v25, "screenStrokeAlignedRectForRect:withStrokeWidth:", a3, v23, 0.0, 0.0, v27);
      double v29 = v28;
      double v31 = v30;

      v32 = [(AKLayerPresentationManager *)self alignmentGuideXLayer];
      objc_msgSend(v32, "setPosition:", v29, v31);
    }
    v33 = (void *)MEMORY[0x263F158F8];
    [v33 commit];
  }
}

- (void)setAlignmentGuidePositionY:(double)a3
{
  if (self->_alignmentGuidePositionY != a3)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    self->_alignmentGuidePositionY = a3;
    BOOL v5 = [(AKLayerPresentationManager *)self alignmentGuideYLayer];
    BOOL v6 = v5;
    if (a3 == 1.79769313e308)
    {
      [v5 removeFromSuperlayer];

      [(AKLayerPresentationManager *)self setAlignmentGuideYLayer:0];
    }
    else
    {

      if (!v6)
      {
        uint64_t v7 = [AKAlignmentGuideLineLayer alloc];
        [(AKLayerPresentationManager *)self currentScaleFactor];
        double v9 = v8;
        id v10 = [(AKLayerPresentationManager *)self rootLayer];
        [v10 bounds];
        long long v11 = [(AKAlignmentGuideLineLayer *)v7 initWithScaleFactor:0 forVerticalOrientation:v9 withMaxSize:CGRectGetWidth(v35)];
        [(AKLayerPresentationManager *)self setAlignmentGuideYLayer:v11];

        double v12 = (double)(unint64_t)(AKAdornmentZPositionOffset - 1);
        long long v13 = [(AKLayerPresentationManager *)self alignmentGuideYLayer];
        [v13 setZPosition:v12];

        double v14 = *MEMORY[0x263F001A8];
        double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
        double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
        double v17 = *(double *)(MEMORY[0x263F001A8] + 24);
        v18 = [(AKLayerPresentationManager *)self alignmentGuideYLayer];
        objc_msgSend(v18, "setFrame:", v14, v15, v16, v17);

        v19 = [(AKLayerPresentationManager *)self rootLayer];
        v20 = [(AKLayerPresentationManager *)self alignmentGuideYLayer];
        [v19 addSublayer:v20];
      }
      v21 = [(AKLayerPresentationManager *)self alignmentGuideYLayer];
      [v21 position];
      double v23 = v22;

      v24 = [(AKLayerPresentationManager *)self pageController];
      v25 = [v24 geometryHelper];
      v26 = [(AKLayerPresentationManager *)self alignmentGuideYLayer];
      [v26 lineWidth];
      objc_msgSend(v25, "screenStrokeAlignedRectForRect:withStrokeWidth:", v23, a3, 0.0, 0.0, v27);
      double v29 = v28;
      double v31 = v30;

      v32 = [(AKLayerPresentationManager *)self alignmentGuideYLayer];
      objc_msgSend(v32, "setPosition:", v29, v31);
    }
    v33 = (void *)MEMORY[0x263F158F8];
    [v33 commit];
  }
}

- (id)adornmentLayerForAnnotation:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AKLayerPresentationManager *)self annotationsToAdornmentLayers];
  BOOL v6 = [v5 objectForKey:v4];

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = v12;
  if (a6 == @"AKLayerPresentationManager.modelAnnotationsObservationContext")
  {
    double v14 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    double v15 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    id v53 = v11;
    id v55 = v10;
    v51 = v14;
    v52 = v13;
    v50 = v15;
    if (v14)
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      obuint64_t j = v14;
      uint64_t v16 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v81 != v18) {
              objc_enumerationMutation(obj);
            }
            v20 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            -[AKLayerPresentationManager _updateLoupeAnnotationsIntersectingRemovedAnnotation:](self, "_updateLoupeAnnotationsIntersectingRemovedAnnotation:", v20, v50, v51);
            long long v78 = 0u;
            long long v79 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            v21 = [v20 keysForValuesToObserveForRedrawing];
            uint64_t v22 = [v21 countByEnumeratingWithState:&v76 objects:v88 count:16];
            if (v22)
            {
              uint64_t v23 = v22;
              uint64_t v24 = *(void *)v77;
              do
              {
                for (uint64_t j = 0; j != v23; ++j)
                {
                  if (*(void *)v77 != v24) {
                    objc_enumerationMutation(v21);
                  }
                  [v20 removeObserver:self forKeyPath:*(void *)(*((void *)&v76 + 1) + 8 * j) context:@"AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"];
                }
                uint64_t v23 = [v21 countByEnumeratingWithState:&v76 objects:v88 count:16];
              }
              while (v23);
            }

            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
              [(AKLayerPresentationManager *)self _removeAdornmentLayerForAnnotation:v20];
            }
            [(AKLayerPresentationManager *)self _removeLayerForAnnotation:v20];
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v80 objects:v89 count:16];
        }
        while (v17);
      }

      id v11 = v53;
      id v10 = v55;
      double v14 = v51;
      long long v13 = v52;
      double v15 = v50;
    }
    if (v15)
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id obja = v15;
      uint64_t v26 = [obja countByEnumeratingWithState:&v72 objects:v87 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v73;
        do
        {
          for (uint64_t k = 0; k != v27; ++k)
          {
            if (*(void *)v73 != v28) {
              objc_enumerationMutation(obja);
            }
            double v30 = *(void **)(*((void *)&v72 + 1) + 8 * k);
            -[AKLayerPresentationManager _addLayerForAnnotation:](self, "_addLayerForAnnotation:", v30, v50, v51);
            objc_opt_class();
            if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
              [(AKLayerPresentationManager *)self _addAdornmentLayerForAnnotation:v30];
            }
            [(AKLayerPresentationManager *)self _updateLoupeAnnotationsContributedToByAnnotation:v30];
            long long v70 = 0u;
            long long v71 = 0u;
            long long v68 = 0u;
            long long v69 = 0u;
            double v31 = [v30 keysForValuesToObserveForRedrawing];
            uint64_t v32 = [v31 countByEnumeratingWithState:&v68 objects:v86 count:16];
            if (v32)
            {
              uint64_t v33 = v32;
              uint64_t v34 = *(void *)v69;
              do
              {
                for (uint64_t m = 0; m != v33; ++m)
                {
                  if (*(void *)v69 != v34) {
                    objc_enumerationMutation(v31);
                  }
                  [v30 addObserver:self forKeyPath:*(void *)(*((void *)&v68 + 1) + 8 * m) options:0 context:@"AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"];
                }
                uint64_t v33 = [v31 countByEnumeratingWithState:&v68 objects:v86 count:16];
              }
              while (v33);
            }
          }
          uint64_t v27 = [obja countByEnumeratingWithState:&v72 objects:v87 count:16];
        }
        while (v27);
      }

      id v11 = v53;
      id v10 = v55;
      double v14 = v51;
      long long v13 = v52;
      double v15 = v50;
    }
    objc_msgSend(MEMORY[0x263F158F8], "commit", v50, v51);
  }
  else if (a6 == @"AKLayerPresentationManager.modelSelectionsObservationContext")
  {
    id v54 = v11;
    id v56 = v10;
    v36 = [v12 objectForKey:*MEMORY[0x263F081C8]];
    v37 = [v13 objectForKey:*MEMORY[0x263F081B8]];
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    if (v36)
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v38 = v36;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v64 objects:v85 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v65;
        do
        {
          for (uint64_t n = 0; n != v40; ++n)
          {
            if (*(void *)v65 != v41) {
              objc_enumerationMutation(v38);
            }
            uint64_t v43 = *(void *)(*((void *)&v64 + 1) + 8 * n);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [(AKLayerPresentationManager *)self _removeAdornmentLayerForAnnotation:v43];
            }
          }
          uint64_t v40 = [v38 countByEnumeratingWithState:&v64 objects:v85 count:16];
        }
        while (v40);
      }
    }
    if (v37)
    {
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      id v44 = v37;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v60 objects:v84 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v61;
        do
        {
          for (iuint64_t i = 0; ii != v46; ++ii)
          {
            if (*(void *)v61 != v47) {
              objc_enumerationMutation(v44);
            }
            uint64_t v49 = *(void *)(*((void *)&v60 + 1) + 8 * ii);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              [(AKLayerPresentationManager *)self _addAdornmentLayerForAnnotation:v49];
            }
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v60 objects:v84 count:16];
        }
        while (v46);
      }
    }
    [MEMORY[0x263F158F8] commit];

    id v11 = v54;
    id v10 = v56;
  }
  else if (a6 == @"AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext")
  {
    [(AKLayerPresentationManager *)self _updateLoupeAnnotationsContributedToByAnnotation:v11];
  }
  else
  {
    v59.receiver = self;
    v59.super_class = (Class)AKLayerPresentationManager;
    [(AKLayerPresentationManager *)&v59 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)_updateLoupeAnnotationsContributedToByAnnotation:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  BOOL v5 = [(AKLayerPresentationManager *)self pageModelController];
  BOOL v6 = [v5 annotations];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    unint64_t v10 = 0x264CDA000uLL;
    do
    {
      uint64_t v11 = 0;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v13 = [(AKLayerPresentationManager *)self pageController];
          double v14 = [v13 annotationsBeneathLoupe:v12];
          if ([v14 containsObject:v4])
          {
            [(AKLayerPresentationManager *)self annotationsToAnnotationLayers];
            uint64_t v15 = v9;
            uint64_t v16 = self;
            unint64_t v17 = v10;
            uint64_t v18 = v6;
            v20 = id v19 = v4;
            v21 = [v20 objectForKey:v12];

            id v4 = v19;
            BOOL v6 = v18;
            unint64_t v10 = v17;
            self = v16;
            uint64_t v9 = v15;
            uint64_t v8 = v22;
            [v21 updateContents];
          }
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }
}

- (void)_updateLoupeAnnotationsIntersectingRemovedAnnotation:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v5 = [(AKLayerPresentationManager *)self pageModelController];
  BOOL v6 = [v5 annotations];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v11 drawingBounds];
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          [v4 drawingBounds];
          v33.origin.x = v20;
          v33.origin.y = v21;
          v33.size.width = v22;
          v33.size.height = v23;
          v32.origin.x = v13;
          v32.origin.y = v15;
          v32.size.width = v17;
          v32.size.height = v19;
          if (CGRectIntersectsRect(v32, v33))
          {
            long long v24 = [(AKLayerPresentationManager *)self annotationsToAnnotationLayers];
            long long v25 = [v24 objectForKey:v11];

            [v25 updateContents];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
  }
}

- (void)forceUpdateAnnotationLayer:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AKLayerPresentationManager *)self annotationsToAnnotationLayers];
  id v6 = [v5 objectForKey:v4];

  [v6 updateContents];
}

- (void)_setNeedsDisplayOnNewLayer:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v7 count:1];

  -[AKLayerPresentationManager _applyUpdatesWithScale:toLayers:isLiveUpdate:forceUpdate:](self, "_applyUpdatesWithScale:toLayers:isLiveUpdate:forceUpdate:", v6, 0, 1, 9.22337204e18, v7, v8);
}

- (void)_applyUpdatesWithScale:(double)a3 toLayers:(id)a4 isLiveUpdate:(BOOL)a5 forceUpdate:(BOOL)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a4;
  if (a3 == 9.22337204e18)
  {
    [(AKLayerPresentationManager *)self currentScaleFactor];
    if (v10 == 9.22337204e18) {
      a3 = 1.0;
    }
    else {
      a3 = v10;
    }
  }
  [(AKLayerPresentationManager *)self _hiDPIScaleFactor];
  double v12 = a3 * v11;
  BOOL v13 = [(AKLayerPresentationManager *)self shouldPixelate];
  double v14 = 1.0;
  if (a3 < 2.0) {
    double v14 = v12;
  }
  CGFloat v15 = (void *)*MEMORY[0x263F15CC8];
  double v16 = (void *)*MEMORY[0x263F15D28];
  if (a3 < 2.0) {
    double v16 = (void *)*MEMORY[0x263F15CC8];
  }
  if (v13) {
    double v17 = v14;
  }
  else {
    double v17 = v12;
  }
  if (v13) {
    CGFloat v15 = v16;
  }
  id v18 = v15;
  [(AKLayerPresentationManager *)self setCurrentScaleFactor:a3];
  if ([v9 count])
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v31 = v9;
    id v19 = v9;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (!v20) {
      goto LABEL_34;
    }
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v34;
    while (1)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v34 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || a5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
          [v24 updateSublayersWithScale:a3];
          goto LABEL_31;
        }
        long long v25 = [v24 annotation];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          long long v27 = v24;
          double v28 = v12;
          goto LABEL_30;
        }
        if (!a6)
        {
          [v24 contentsScale];
          if (vabdd_f64(v29, v17) <= 0.00001)
          {
            id v30 = [v24 minificationFilter];

            if (v30 == v18) {
              continue;
            }
          }
        }
        objc_msgSend(v24, "setMinificationFilter:", v18, v31);
        [v24 setMagnificationFilter:v18];
        long long v27 = v24;
        double v28 = v17;
LABEL_30:
        objc_msgSend(v27, "setContentsScale:", v28, v31);
LABEL_31:
        objc_msgSend(v24, "updatePixelAlignment", v31);
        continue;
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (!v21)
      {
LABEL_34:

        [MEMORY[0x263F158F8] commit];
        id v9 = v31;
        break;
      }
    }
  }
}

- (double)_hiDPIScaleFactor
{
  v2 = [(AKLayerPresentationManager *)self pageController];
  BOOL v3 = [v2 overlayView];
  id v4 = [v3 window];
  id v5 = [v4 screen];

  if (v5)
  {
    id v6 = [v3 window];
    id v7 = [v6 screen];
    [v7 scale];
    double v9 = v8;
  }
  else
  {
    id v6 = [MEMORY[0x263F1C920] mainScreen];
    [v6 scale];
    double v9 = v10;
  }

  return v9;
}

- (void)_startObservingModel
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (![(AKLayerPresentationManager *)self isObservingModel])
  {
    BOOL v3 = [(AKLayerPresentationManager *)self pageController];
    double v28 = [v3 pageModelController];
    -[AKLayerPresentationManager setPageModelController:](self, "setPageModelController:");
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    id v4 = (void *)MEMORY[0x263F158F8];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = sub_2376D60A8;
    v42[3] = &unk_264CDAE40;
    id v27 = v3;
    id v43 = v27;
    [v4 setCompletionBlock:v42];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v5 = [(AKLayerPresentationManager *)self pageModelController];
    id v6 = [v5 annotations];

    obuint64_t j = v6;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(obj);
          }
          double v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [(AKLayerPresentationManager *)self _addLayerForAnnotation:v11];
          long long v36 = 0u;
          long long v37 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          double v12 = [v11 keysForValuesToObserveForRedrawing];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v35 != v15) {
                  objc_enumerationMutation(v12);
                }
                [v11 addObserver:self forKeyPath:*(void *)(*((void *)&v34 + 1) + 8 * j) options:0 context:@"AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"];
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v34 objects:v45 count:16];
            }
            while (v14);
          }

          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [(AKLayerPresentationManager *)self _addAdornmentLayerForAnnotation:v11];
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v8);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    double v17 = [(AKLayerPresentationManager *)self pageModelController];
    id v18 = [v17 selectedAnnotations];

    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          [(AKLayerPresentationManager *)self _addAdornmentLayerForAnnotation:*(void *)(*((void *)&v30 + 1) + 8 * k)];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v44 count:16];
      }
      while (v20);
    }

    CGFloat v23 = [(AKLayerPresentationManager *)self pageModelController];
    long long v24 = [v23 cropAnnotation];

    if (v24)
    {
      long long v25 = [(AKLayerPresentationManager *)self pageModelController];
      long long v26 = [v25 cropAnnotation];
      [(AKLayerPresentationManager *)self _addAdornmentLayerForAnnotation:v26];
    }
    [MEMORY[0x263F158F8] commit];
    [v28 addObserver:self forKeyPath:@"annotations" options:3 context:@"AKLayerPresentationManager.modelAnnotationsObservationContext"];
    [v28 addObserver:self forKeyPath:@"selectedAnnotations" options:3 context:@"AKLayerPresentationManager.modelSelectionsObservationContext"];
    [(AKLayerPresentationManager *)self setIsObservingModel:1];
  }
}

- (void)_stopObservingModel
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if ([(AKLayerPresentationManager *)self isObservingModel])
  {
    BOOL v3 = [(AKLayerPresentationManager *)self pageModelController];
    [v3 removeObserver:self forKeyPath:@"selectedAnnotations" context:@"AKLayerPresentationManager.modelSelectionsObservationContext"];

    id v4 = [(AKLayerPresentationManager *)self pageModelController];
    [v4 removeObserver:self forKeyPath:@"annotations" context:@"AKLayerPresentationManager.modelAnnotationsObservationContext"];

    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    id v5 = [(AKLayerPresentationManager *)self pageModelController];
    id v6 = [v5 cropAnnotation];

    if (v6)
    {
      uint64_t v7 = [(AKLayerPresentationManager *)self pageModelController];
      uint64_t v8 = [v7 cropAnnotation];
      [(AKLayerPresentationManager *)self _removeAdornmentLayerForAnnotation:v8];
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v9 = [(AKLayerPresentationManager *)self pageModelController];
    double v10 = [v9 selectedAnnotations];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v37;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          [(AKLayerPresentationManager *)self _removeAdornmentLayerForAnnotation:*(void *)(*((void *)&v36 + 1) + 8 * v14++)];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v12);
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v15 = [(AKLayerPresentationManager *)self pageModelController];
    double v16 = [v15 annotations];

    obuint64_t j = v16;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v32 + 1) + 8 * v20);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v22 = [v21 keysForValuesToObserveForRedrawing];
          uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = *(void *)v29;
            do
            {
              uint64_t v26 = 0;
              do
              {
                if (*(void *)v29 != v25) {
                  objc_enumerationMutation(v22);
                }
                [v21 removeObserver:self forKeyPath:*(void *)(*((void *)&v28 + 1) + 8 * v26++) context:@"AKLayerPresentationManager.modelAnnotationsAppearanceObservationContext"];
              }
              while (v24 != v26);
              uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
            }
            while (v24);
          }

          [(AKLayerPresentationManager *)self _removeLayerForAnnotation:v21];
          ++v20;
        }
        while (v20 != v18);
        uint64_t v18 = [obj countByEnumeratingWithState:&v32 objects:v41 count:16];
      }
      while (v18);
    }

    [MEMORY[0x263F158F8] commit];
    [(AKLayerPresentationManager *)self setPageModelController:0];
    [(AKLayerPresentationManager *)self setIsObservingModel:0];
  }
}

- (void)_addLayerForAnnotation:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [(AKLayerPresentationManager *)self pageController];
    id v6 = +[AKAnnotationLayer newAnnotationLayerForAnnotation:v4 withPageController:v5];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AKLayerPresentationManager *)self setCropAnnotationLayer:v6];
    }
    uint64_t v7 = [(AKLayerPresentationManager *)self rootLayer];
    [v7 addSublayer:v6];

    [v6 updatePixelAlignment];
    uint64_t v8 = [(AKLayerPresentationManager *)self annotationsToAnnotationLayers];
    [v8 setObject:v6 forKey:v4];

    [(AKLayerPresentationManager *)self _setNeedsDisplayOnNewLayer:v6];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v9 = [v5 pageModelController];
    double v10 = [v9 annotations];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v22 = v6;
      uint64_t v23 = v5;
      unint64_t v13 = 0;
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v17 = [(AKLayerPresentationManager *)self annotationsToAnnotationLayers];
          uint64_t v18 = [v17 objectForKey:v16];

          [v18 setZPosition:(double)(v13 + i)];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
        v13 += i;
      }
      while (v12);
      double v19 = (double)v13;
      id v6 = v22;
      id v5 = v23;
    }
    else
    {
      double v19 = 0.0;
    }

    uint64_t v20 = [(AKLayerPresentationManager *)self cropAnnotationLayer];

    if (v20)
    {
      uint64_t v21 = [(AKLayerPresentationManager *)self cropAnnotationLayer];
      [v21 setZPosition:v19];
    }
  }
}

- (void)_removeLayerForAnnotation:(id)a3
{
  id v8 = a3;
  id v4 = [(AKLayerPresentationManager *)self annotationsToAnnotationLayers];
  id v5 = [v4 objectForKey:v8];

  if (v5)
  {
    [v5 removeFromSuperlayer];
    id v6 = [(AKLayerPresentationManager *)self annotationsToAnnotationLayers];
    [v6 removeObjectForKey:v8];

    uint64_t v7 = [(AKLayerPresentationManager *)self cropAnnotationLayer];

    if (v5 == v7) {
      [(AKLayerPresentationManager *)self setCropAnnotationLayer:0];
    }
  }
}

- (void)_addAdornmentLayerForAnnotation:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(AKLayerPresentationManager *)self pageController];
  id v6 = +[AKAdornmentLayer newAdornmentLayerForAnnotation:v4 withPageController:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(AKLayerPresentationManager *)self setCropAdornmentLayer:v6];
  }
  uint64_t v7 = [(AKLayerPresentationManager *)self rootLayer];
  [v7 addSublayer:v6];

  [v6 updatePixelAlignment];
  id v8 = [(AKLayerPresentationManager *)self annotationsToAdornmentLayers];
  [v8 setObject:v6 forKey:v4];

  [(AKLayerPresentationManager *)self _setNeedsDisplayOnNewLayer:v6];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [v5 pageModelController];
  double v10 = [v9 annotations];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v22 = v5;
    id v23 = v4;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v17 = [(AKLayerPresentationManager *)self annotationsToAdornmentLayers];
        uint64_t v18 = [v17 objectForKey:v16];

        [v18 setZPosition:(double)(unint64_t)(v13 + i + AKAdornmentZPositionOffset)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
      v13 += i;
    }
    while (v12);
    id v5 = v22;
    id v4 = v23;
  }
  else
  {
    uint64_t v13 = 0;
  }

  double v19 = [(AKLayerPresentationManager *)self cropAdornmentLayer];

  if (v19)
  {
    double v20 = (double)(unint64_t)(AKAdornmentZPositionOffset + v13);
    uint64_t v21 = [(AKLayerPresentationManager *)self cropAdornmentLayer];
    [v21 setZPosition:v20];
  }
}

- (void)_removeAdornmentLayerForAnnotation:(id)a3
{
  id v4 = a3;
  id v5 = [(AKLayerPresentationManager *)self annotationsToAdornmentLayers];
  id v9 = [v5 objectForKey:v4];

  [v9 removeFromSuperlayer];
  id v6 = [(AKLayerPresentationManager *)self annotationsToAdornmentLayers];
  [v6 removeObjectForKey:v4];

  [v9 teardown];
  id v7 = [(AKLayerPresentationManager *)self cropAdornmentLayer];

  id v8 = v9;
  if (v9 == v7)
  {
    [(AKLayerPresentationManager *)self setCropAdornmentLayer:0];
    id v8 = v9;
  }
}

- (AKPageController)pageController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pageController);

  return (AKPageController *)WeakRetained;
}

- (void)setPageController:(id)a3
{
}

- (CALayer)rootLayer
{
  return (CALayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRootLayer:(id)a3
{
}

- (BOOL)shouldPixelate
{
  return self->_shouldPixelate;
}

- (BOOL)adornmentsHidden
{
  return self->_adornmentsHidden;
}

- (double)alignmentGuidePositionX
{
  return self->_alignmentGuidePositionX;
}

- (double)alignmentGuidePositionY
{
  return self->_alignmentGuidePositionY;
}

- (NSMapTable)annotationsToAnnotationLayers
{
  return (NSMapTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAnnotationsToAnnotationLayers:(id)a3
{
}

- (NSMapTable)annotationsToAdornmentLayers
{
  return (NSMapTable *)objc_getProperty(self, a2, 56, 1);
}

- (void)setAnnotationsToAdornmentLayers:(id)a3
{
}

- (CALayer)cropAnnotationLayer
{
  return (CALayer *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCropAnnotationLayer:(id)a3
{
}

- (CALayer)cropAdornmentLayer
{
  return (CALayer *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCropAdornmentLayer:(id)a3
{
}

- (CAShapeLayer)alignmentGuideXLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAlignmentGuideXLayer:(id)a3
{
}

- (CAShapeLayer)alignmentGuideYLayer
{
  return (CAShapeLayer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAlignmentGuideYLayer:(id)a3
{
}

- (AKPageModelController)pageModelController
{
  return (AKPageModelController *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPageModelController:(id)a3
{
}

- (BOOL)isObservingModel
{
  return self->_isObservingModel;
}

- (void)setIsObservingModel:(BOOL)a3
{
  self->_isObservingModel = a3;
}

- (double)currentScaleFactor
{
  return self->_currentScaleFactor;
}

- (void)setCurrentScaleFactor:(double)a3
{
  self->_currentScaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageModelController, 0);
  objc_storeStrong((id *)&self->_alignmentGuideYLayer, 0);
  objc_storeStrong((id *)&self->_alignmentGuideXLayer, 0);
  objc_storeStrong((id *)&self->_cropAdornmentLayer, 0);
  objc_storeStrong((id *)&self->_cropAnnotationLayer, 0);
  objc_storeStrong((id *)&self->_annotationsToAdornmentLayers, 0);
  objc_storeStrong((id *)&self->_annotationsToAnnotationLayers, 0);
  objc_storeStrong((id *)&self->_rootLayer, 0);

  objc_destroyWeak((id *)&self->_pageController);
}

@end