@interface PKLassoRenderer
- (CGPoint)editMenuLocation;
- (PKLassoRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4;
- (id)_accessibilityUserTestingChildren;
- (id)_expandBezierPathIfNecessary:(void *)a1;
- (id)adornmentLayer;
- (id)initForLiveSelectionWithRenderingDelegate:(id)a3;
- (id)lassoPath;
- (uint64_t)_setupAccessibilityObservers;
- (uint64_t)_setupAnimatedLasso;
- (void)_didBeginDraggingSelection;
- (void)_didEndDraggingSelection;
- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6;
- (void)_setupLassoLayerAppearanceWithBezierPath:(id *)a1;
- (void)_setupSelectionAdornment;
- (void)_updateLassoForAccessibility:(id)a3;
- (void)addAnimationsToSelectionLayer:(void *)a3 whiteLayer:;
- (void)dealloc;
@end

@implementation PKLassoRenderer

- (id)initForLiveSelectionWithRenderingDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKLassoRenderer;
  v5 = [(PKLassoRenderer *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_renderingDelegate, v4);
    if (!v6->_lassoLayer)
    {
      uint64_t v7 = [MEMORY[0x1E4F39C88] layer];
      lassoLayer = v6->_lassoLayer;
      v6->_lassoLayer = (CAShapeLayer *)v7;

      uint64_t v9 = [MEMORY[0x1E4F39C88] layer];
      whiteLassoLayer = v6->_whiteLassoLayer;
      v6->_whiteLassoLayer = (CAShapeLayer *)v9;

      -[PKLassoRenderer _setupLassoLayerAppearanceWithBezierPath:]((id *)&v6->super.isa, 0);
      [(CAShapeLayer *)v6->_lassoLayer addSublayer:v6->_whiteLassoLayer];
      -[PKLassoRenderer _setupAccessibilityObservers](v6);
    }
  }

  return v6;
}

- (uint64_t)_setupAccessibilityObservers
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:a1 selector:sel__updateLassoForAccessibility_ name:*MEMORY[0x1E4FB2438] object:0];

  return [a1 _updateLassoForAccessibility:0];
}

- (void)_setupLassoLayerAppearanceWithBezierPath:(id *)a1
{
  id v29 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = [a1[6] drawing];
  [WeakRetained scaleForDrawing:v4];
  double v6 = v5;

  id v7 = a1[1];
  id v8 = a1[2];
  [v7 setContentsScale:v6];
  id v9 = v29;
  objc_msgSend(v7, "setPath:", objc_msgSend(v9, "CGPath"));
  [v7 setLineWidth:2.0];
  id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
  objc_msgSend(v7, "setFillColor:", objc_msgSend(v10, "CGColor"));

  id v11 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v12 = [v11 CGColor];

  [v7 setStrokeColor:v12];
  uint64_t v13 = *MEMORY[0x1E4F3A478];
  [v7 setLineJoin:*MEMORY[0x1E4F3A478]];
  v14 = (void *)MEMORY[0x1E4F1C978];
  v15 = [NSNumber numberWithInt:4];
  v16 = [NSNumber numberWithInt:10];
  v17 = objc_msgSend(v14, "arrayWithObjects:", v15, v16, 0);
  [v7 setLineDashPattern:v17];

  uint64_t v18 = *MEMORY[0x1E4F3A458];
  [v7 setLineCap:*MEMORY[0x1E4F3A458]];
  LODWORD(v19) = 0.5;
  [v7 setOpacity:v19];
  v20 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v20 scale];
  objc_msgSend(v8, "setContentsScale:");

  id v28 = v9;
  objc_msgSend(v8, "setPath:", objc_msgSend(v28, "CGPath"));
  [v8 setLineWidth:2.0];
  id v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0];
  objc_msgSend(v8, "setFillColor:", objc_msgSend(v21, "CGColor"));

  id v22 = [MEMORY[0x1E4FB1618] whiteColor];
  objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v22, "CGColor"));

  LODWORD(v23) = 1.0;
  [v8 setOpacity:v23];
  [v8 setLineJoin:v13];
  v24 = (void *)MEMORY[0x1E4F1C978];
  v25 = [NSNumber numberWithInt:4];
  v26 = [NSNumber numberWithInt:10];
  v27 = objc_msgSend(v24, "arrayWithObjects:", v25, v26, 0);
  [v8 setLineDashPattern:v27];

  [v8 setLineCap:v18];
}

- (void)_updateLassoForAccessibility:(id)a3
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    double v4 = 4.0;
  }
  else {
    double v4 = 2.0;
  }
  [(CAShapeLayer *)self->_lassoLayer setLineWidth:v4];
  [(CAShapeLayer *)self->_whiteLassoLayer setLineWidth:v4];
  BOOL v5 = UIAccessibilityDarkerSystemColorsEnabled();
  double v6 = (id *)MEMORY[0x1E4F3A460];
  if (!v5) {
    double v6 = (id *)MEMORY[0x1E4F3A458];
  }
  id v7 = *v6;
  -[CAShapeLayer setLineCap:](self->_lassoLayer, "setLineCap:");
  [(CAShapeLayer *)self->_whiteLassoLayer setLineCap:v7];
}

- (id)adornmentLayer
{
  return self->_lassoLayer;
}

- (PKLassoRenderer)initWithStrokeSelection:(id)a3 renderingDelegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKLassoRenderer;
  id v9 = [(PKLassoRenderer *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_strokeSelection, a3);
    objc_storeWeak((id *)&v10->_renderingDelegate, v8);
  }

  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  if (self)
  {
    id calculateSelectionHullBlock = self->_calculateSelectionHullBlock;
    if (calculateSelectionHullBlock)
    {
      dispatch_block_cancel(calculateSelectionHullBlock);
      objc_setProperty_nonatomic_copy(self, v5, 0, 64);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)PKLassoRenderer;
  [(PKLassoRenderer *)&v6 dealloc];
}

- (id)lassoPath
{
  return self->_lassoPath;
}

- (void)_setupSelectionAdornment
{
  -[PKLassoRenderer _setupAnimatedLasso]((uint64_t)self);
  if (self->_strokeSelection)
  {
    lassoLayer = self->_lassoLayer;
    whiteLassoLayer = self->_whiteLassoLayer;
    -[PKLassoRenderer addAnimationsToSelectionLayer:whiteLayer:]((uint64_t)self, lassoLayer, whiteLassoLayer);
  }
}

- (uint64_t)_setupAnimatedLasso
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    if (!*(void *)(result + 8))
    {
      uint64_t v2 = [MEMORY[0x1E4F39C88] layer];
      v3 = *(void **)(v1 + 8);
      *(void *)(v1 + 8) = v2;

      uint64_t v4 = [MEMORY[0x1E4F39C88] layer];
      SEL v5 = *(void **)(v1 + 16);
      *(void *)(v1 + 16) = v4;

      v39 = [*(id *)(v1 + 48) strokes];
      objc_super v6 = *(void **)(v1 + 8);
      id v7 = *(void **)(v1 + 16);
      id v8 = [*(id *)(v1 + 48) lassoStroke];
      id v40 = v39;
      id v9 = v6;
      id v10 = v7;
      id v11 = v8;
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 56));
      id v13 = *(id *)(v1 + 48);
      v14 = [v13 drawing];
      [WeakRetained scaleForDrawing:v14];
      v16 = v15;

      v56 = 0;
      uint64_t v57 = 0;
      v55 = 0;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      *(_OWORD *)__p = 0u;
      id v17 = v40;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:block count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v52;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v52 != v19) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v51 + 1) + 8 * i) _appendPointsOfInterestForSelection:&v55 step:1.0];
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:block count:16];
        }
        while (v18);
      }

      *(void *)&long long v51 = 0;
      *((void *)&v51 + 1) = &v51;
      *(void *)&long long v52 = 0x4812000000;
      *((void *)&v52 + 1) = __Block_byref_object_copy__32;
      *(void *)&long long v53 = __Block_byref_object_dispose__32;
      *((void *)&v53 + 1) = "";
      +[PKPathUtility unorderedSimplifiedPointsFromPoints:&v55 factor:4.0 / *(double *)&v16];
      objc_initWeak(&location, v9);
      objc_initWeak(&v49, v10);
      objc_initWeak(&from, (id)v1);
      [*(id *)(v1 + 48) bounds];
      id v22 = v21;
      v24 = v23;
      v26 = v25;
      id v28 = v27;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke;
      block[3] = &unk_1E64CAF30;
      block[4] = &v51;
      objc_copyWeak(&v59, &from);
      v61[1] = v22;
      v61[2] = v24;
      v61[3] = v26;
      v61[4] = v28;
      v61[5] = v16;
      char v62 = 1;
      objc_copyWeak(&v60, &location);
      objc_copyWeak(v61, &v49);
      dispatch_block_t v29 = dispatch_block_create((dispatch_block_flags_t)0, block);
      objc_setProperty_nonatomic_copy((id)v1, v30, v29, 64);

      id v31 = objc_loadWeakRetained((id *)(v1 + 56));
      v32 = [v31 selectionHullQueue];
      dispatch_async(v32, *(dispatch_block_t *)(v1 + 64));

      [*(id *)(v1 + 48) bounds];
      memset(&v47, 0, sizeof(v47));
      CGAffineTransformMakeTranslation(&v47, -v33, -v34);
      CGAffineTransform t1 = v47;
      CGAffineTransformMakeScale(&t2, *(CGFloat *)&v16, *(CGFloat *)&v16);
      CGAffineTransformConcat(&v46, &t1, &t2);
      CGAffineTransform v47 = v46;
      if (v11)
      {
        v35 = (const CGPath *)[v11 _newPathRepresentation];
        v36 = [MEMORY[0x1E4FB14C0] bezierPathWithCGPath:v35];
        memset(&v46, 0, sizeof(v46));
        [v11 _transform];
        CGAffineTransform v42 = v47;
        CGAffineTransformConcat(&v46, &v43, &v42);
        CGAffineTransform v41 = v46;
        [v36 applyTransform:&v41];
        CGPathRelease(v35);
        uint64_t v37 = -[PKLassoRenderer _expandBezierPathIfNecessary:](v36);
        v38 = *(void **)(v1 + 40);
        *(void *)(v1 + 40) = v37;
      }
      else
      {
        v36 = 0;
      }
      -[PKLassoRenderer _setupLassoLayerAppearanceWithBezierPath:]((id *)v1, v36);

      objc_destroyWeak(v61);
      objc_destroyWeak(&v60);
      objc_destroyWeak(&v59);
      objc_destroyWeak(&from);
      objc_destroyWeak(&v49);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v51, 8);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v55)
      {
        v56 = v55;
        operator delete(v55);
      }

      [*(id *)(v1 + 8) addSublayer:*(void *)(v1 + 16)];
      return -[PKLassoRenderer _setupAccessibilityObservers]((void *)v1);
    }
  }
  return result;
}

- (void)addAnimationsToSelectionLayer:(void *)a3 whiteLayer:
{
  id v17 = a2;
  id v5 = a3;
  if (a1)
  {
    objc_super v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"lineDashPhase"];
    LODWORD(v7) = 14.0;
    id v8 = [NSNumber numberWithFloat:v7];
    [v6 setFromValue:v8];

    id v9 = [NSNumber numberWithFloat:0.0];
    [v6 setToValue:v9];

    [v6 setDuration:1.0];
    LODWORD(v10) = 2139095039;
    [v6 setRepeatCount:v10];
    [v17 addAnimation:v6 forKey:@"linePhase"];
    id v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"lineDashPhase"];
    LODWORD(v12) = 21.0;
    id v13 = [NSNumber numberWithFloat:v12];
    [v11 setFromValue:v13];

    LODWORD(v14) = 7.0;
    v15 = [NSNumber numberWithFloat:v14];
    [v11 setToValue:v15];

    [v11 setDuration:1.0];
    LODWORD(v16) = 2139095039;
    [v11 setRepeatCount:v16];
    [v5 addAnimation:v11 forKey:@"linePhase"];
  }
}

- (void)_didBeginDraggingSelection
{
}

- (void)_didEndDraggingSelection
{
  LODWORD(v2) = 0.5;
  [(CAShapeLayer *)self->_lassoLayer setOpacity:v2];
}

- (CGPoint)editMenuLocation
{
  double x = self->_editMenuLocation.x;
  double y = self->_editMenuLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_renderLiveSelectionPath:(CGPath *)a3 forStrokes:(id)a4 inDrawing:(id)a5 liveScrollOffset:(CGPoint)a6
{
  -[PKLassoRenderer _setupAnimatedLasso]((uint64_t)self);
  if (self)
  {
    [(CAShapeLayer *)self->_lassoLayer setPath:a3];
    [(CAShapeLayer *)self->_whiteLassoLayer setPath:a3];
  }
  lassoLayer = self->_lassoLayer;
  if (a3)
  {
    whiteLassoLayer = self->_whiteLassoLayer;
    -[PKLassoRenderer addAnimationsToSelectionLayer:whiteLayer:]((uint64_t)self, lassoLayer, whiteLassoLayer);
  }
  else
  {
    [(CAShapeLayer *)self->_lassoLayer removeAllAnimations];
    double v10 = self->_whiteLassoLayer;
    [(CAShapeLayer *)v10 removeAllAnimations];
  }
}

void __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8) + 48;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_2;
  v4[3] = &unk_1E64CAF08;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  long long v3 = *(_OWORD *)(a1 + 80);
  long long v8 = *(_OWORD *)(a1 + 64);
  long long v9 = v3;
  uint64_t v10 = *(void *)(a1 + 96);
  char v11 = *(unsigned char *)(a1 + 104);
  objc_copyWeak(&v6, (id *)(a1 + 48));
  objc_copyWeak(&v7, (id *)(a1 + 56));
  +[PKPathUtility smoothedHullForPoints:v2 completion:v4];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
}

void __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_3;
  v6[3] = &unk_1E64CAEE0;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  long long v4 = *(_OWORD *)(a1 + 72);
  long long v11 = *(_OWORD *)(a1 + 56);
  long long v12 = v4;
  uint64_t v13 = *(void *)(a1 + 88);
  id v7 = v3;
  char v14 = *(unsigned char *)(a1 + 96);
  id v5 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  objc_copyWeak(&v10, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x1E4F14428], v6);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&v8);
}

void __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_3(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = *(double *)(a1 + 64);
    double v4 = *(double *)(a1 + 72);
    memset(&v36, 0, sizeof(v36));
    CGAffineTransformMakeTranslation(&v36, -v3, -v4);
    CGAffineTransform t1 = v36;
    CGAffineTransformMakeScale(&t2, *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 96));
    CGAffineTransformConcat(&v38, &t1, &t2);
    CGAffineTransform v36 = v38;
    id v5 = *(void **)(a1 + 32);
    CGAffineTransform v33 = v38;
    [v5 applyTransform:&v33];
    id v6 = *(id *)(a1 + 32);
    id v7 = v6;
    if (*(unsigned char *)(a1 + 104))
    {
      uint64_t v8 = -[PKLassoRenderer _expandBezierPathIfNecessary:](v6);
      id v9 = (void *)WeakRetained[5];
      WeakRetained[5] = v8;
    }
    id v10 = [WeakRetained lassoPath];
    long long v11 = (void *)[v10 CGPath];

    long long v12 = (void *)MEMORY[0x1E4FB1EB0];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_4;
    v30[3] = &unk_1E64CAEB8;
    objc_copyWeak(&v31, (id *)(a1 + 48));
    v32[1] = v11;
    objc_copyWeak(v32, (id *)(a1 + 56));
    [v12 animateWithDuration:v30 animations:0 completion:0.300000012];
    BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)v11);
    double MidX = CGRectGetMidX(BoundingBox);
    v25 = 0;
    v26 = 0;
    uint64_t v27 = 0;
    PKPointsFromPath((const CGPath *)v11, (const void **)&v25, 1.79769313e308, 0.0);
    v38.a = MidX;
    v38.b = 0.0;
    v38.c = MidX;
    v38.d = 10000.0;
    char v14 = v25;
    uint64_t v15 = v26 - (unsigned char *)v25;
    if (v26 == (unsigned char *)v25)
    {
      char v14 = v26;
      if (!v26)
      {
LABEL_16:
        objc_destroyWeak(v32);
        objc_destroyWeak(&v31);

        goto LABEL_17;
      }
    }
    else
    {
      unint64_t v16 = 0;
      unint64_t v17 = v15 >> 4;
      if ((unint64_t)(v15 >> 4) <= 1) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = v15 >> 4;
      }
      double v19 = 1.79769313e308;
      v20 = v25;
      do
      {
        ++v16;
        uint64_t v23 = 0;
        long long v21 = *v20++;
        v37[0] = v21;
        v37[1] = v14[v16 % v17];
        unsigned __int8 v22 = DKDIntersectionOfLines(&v38.a, (double *)v37, (double *)&v23, &v24, &v28, 0, 0);
        if ((v22 & (v29 < v19)) != 0)
        {
          double MidX = v28;
          double v19 = v29;
        }
      }
      while (v18 != v16);
      if (v19 < 1.79769313e308)
      {
        *((double *)WeakRetained + 3) = MidX;
        *((double *)WeakRetained + 4) = v19;
      }
    }
    v26 = v14;
    operator delete(v14);
    goto LABEL_16;
  }
LABEL_17:
}

- (id)_expandBezierPathIfNecessary:(void *)a1
{
  id v1 = a1;
  BoundingBoCGFloat x = CGPathGetBoundingBox((CGPathRef)[v1 CGPath]);
  CGFloat x = BoundingBox.origin.x;
  CGFloat width = BoundingBox.size.width;
  CGFloat height = BoundingBox.size.height;
  if (BoundingBox.size.width < 60.0 && BoundingBox.size.height < 60.0)
  {
    CGFloat y = BoundingBox.origin.y;
    double MidX = CGRectGetMidX(BoundingBox);
    v13.origin.CGFloat x = x;
    v13.origin.CGFloat y = y;
    v13.size.CGFloat width = width;
    v13.size.CGFloat height = height;
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", MidX + -30.0, CGRectGetMidY(v13) + -30.0, 60.0);

    id v1 = (id)v8;
  }
  id v9 = v1;

  return v9;
}

void __100__PKLassoRenderer__setupAnimatedLassoForStrokes_lassoLayer_whiteLassoLayer_isSelection_lassoStroke___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPath:v2];

  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 setPath:v3];
}

- (id)_accessibilityUserTestingChildren
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calculateSelectionHullBlock, 0);
  objc_destroyWeak((id *)&self->_renderingDelegate);
  objc_storeStrong((id *)&self->_strokeSelection, 0);
  objc_storeStrong((id *)&self->_lassoPath, 0);
  objc_storeStrong((id *)&self->_whiteLassoLayer, 0);

  objc_storeStrong((id *)&self->_lassoLayer, 0);
}

@end