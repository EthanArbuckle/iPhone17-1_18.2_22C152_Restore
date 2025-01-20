@interface BKUICurvesView
- (CGPath)newQuartzPath:(id)a3 transform:(CGAffineTransform *)a4;
- (CGPoint)_getPoint:(id)a3;
- (CGSize)sublayerSize;
- (NSNumber)speed;
- (float)progress;
- (unint64_t)_animateFromLayer:(unint64_t)a3 toProgress:(float)a4 withColor:(id)a5;
- (void)_addEstimateWatchDog;
- (void)_animateEstimateFailure;
- (void)_animateFromLayer:(unint64_t)a3 toLayer:(unint64_t)a4 withColor:(id)a5;
- (void)_checkEstimateFailedAfterAnimation:(id)a3;
- (void)_path:(id)a3 drawCurveToPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6;
- (void)_path:(id)a3 drawLineToPoint:(CGPoint)a4;
- (void)_removeEstimateWatchDog;
- (void)_resetEstimate:(id)a3;
- (void)_resetLayers;
- (void)_startAnimation:(unint64_t)a3 withColor:(id)a4 isLast:(BOOL)a5;
- (void)_waitForInit;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)estimateFailed;
- (void)estimateProgress:(float)a3;
- (void)loadDataFromXML:(id)a3 name:(id)a4 color:(id)a5;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)setProgress:(float)a3;
- (void)setSpeed:(id)a3;
- (void)setSublayerSize:(CGSize)a3;
- (void)setSublayersSize:(CGSize)a3;
@end

@implementation BKUICurvesView

- (void)dealloc
{
  parser = self->_parser;
  if (parser) {
    [(NSXMLParser *)parser abortParsing];
  }
  [(BKUICurvesView *)self _waitForInit];
  v4.receiver = self;
  v4.super_class = (Class)BKUICurvesView;
  [(BKUICurvesView *)&v4 dealloc];
}

- (float)progress
{
  return self->_progress;
}

- (void)_resetLayers
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_pathLayers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "removeFromSuperlayer", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_pathLayers removeAllObjects];
  self->_currentLayer = 0;
}

- (void)_animateFromLayer:(unint64_t)a3 toLayer:(unint64_t)a4 withColor:(id)a5
{
  if (a3 < a4)
  {
    unint64_t v8 = a4 - 1;
    do
    {
      unint64_t v9 = a3 + 1;
      [(BKUICurvesView *)self _startAnimation:a3 withColor:a5 isLast:v8 == a3];
      a3 = v9;
    }
    while (a4 != v9);
  }
}

- (unint64_t)_animateFromLayer:(unint64_t)a3 toProgress:(float)a4 withColor:(id)a5
{
  paths = self->_paths;
  id v9 = a5;
  unint64_t v10 = (unint64_t)(float)((float)(unint64_t)[(NSMutableArray *)paths count] * a4);
  [(BKUICurvesView *)self _animateFromLayer:a3 toLayer:v10 withColor:v9];

  return v10;
}

- (void)_animateEstimateFailure
{
  self->_currentLayer = self->_preEstimateLayer;
}

- (void)_checkEstimateFailedAfterAnimation:(id)a3
{
  uint64_t v4 = (CABasicAnimation *)a3;
  if (self->_lastAnimation == v4)
  {
    lastAnimation = v4;
    uint64_t v6 = v4;
    if (self->_estimateFailed)
    {
      if (self->_progress < 1.0) {
        [(BKUICurvesView *)self _animateEstimateFailure];
      }
      self->_estimateFailed = 0;
      lastAnimation = self->_lastAnimation;
    }
    self->_lastAnimation = 0;

    uint64_t v4 = v6;
    self->_estimating = 0;
  }
}

- (void)_resetEstimate:(id)a3
{
  if (self->_progress < 1.0)
  {
    self->_preEstimateLayer = [a3 unsignedIntegerValue];
    self->_estimateFailed = 1;
    [(BKUICurvesView *)self estimateFailed];
  }
}

- (void)estimateProgress:(float)a3
{
  bkui_curves_view_log = self->bkui_curves_view_log;
  if (os_log_type_enabled(bkui_curves_view_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUICurvesView estimateProgress:](bkui_curves_view_log, v6, v7, v8, v9, v10, v11, v12);
  }
  if (!self->_estimating)
  {
    self->_estimating = 1;
    float v13 = self->_progress + a3;
    float v14 = (float)(self->_currentLayer + 1);
    float v15 = v14 / (float)(unint64_t)[(NSMutableArray *)self->_paths count];
    if (v13 >= v15) {
      float v15 = v13;
    }
    float v16 = fminf(v15, 1.0);
    self->_preEstimateLayer = self->_currentLayer;
    unint64_t currentLayer = self->_currentLayer;
    v18 = [MEMORY[0x1E4F428B8] systemPinkColor];
    *(float *)&double v19 = v16;
    self->_unint64_t currentLayer = [(BKUICurvesView *)self _animateFromLayer:currentLayer toProgress:v18 withColor:v19];

    [(BKUICurvesView *)self _addEstimateWatchDog];
  }
}

- (void)estimateFailed
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Estimate failed", v1, 2u);
}

- (void)setProgress:(float)a3
{
  bkui_curves_view_log = self->bkui_curves_view_log;
  if (os_log_type_enabled(bkui_curves_view_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUICurvesView setProgress:](bkui_curves_view_log, v6, v7, v8, v9, v10, v11, v12);
  }
  [(BKUICurvesView *)self _removeEstimateWatchDog];
  if (a3 <= 1.0) {
    float v13 = a3;
  }
  else {
    float v13 = 1.0;
  }
  float v14 = fmaxf(v13, 0.0);
  if (v14 == 0.0)
  {
    [(BKUICurvesView *)self _resetLayers];
    float v14 = 0.0;
    goto LABEL_18;
  }
  unint64_t v15 = (unint64_t)(float)(v14 * (float)(unint64_t)[(NSMutableArray *)self->_paths count]);
  unint64_t currentLayer = self->_currentLayer;
  if (v14 == 1.0 && currentLayer < v15)
  {
    v17 = [MEMORY[0x1E4F428B8] redColor];
    [(BKUICurvesView *)self _animateFromLayer:currentLayer toLayer:v15 withColor:v17];

LABEL_17:
    self->_unint64_t currentLayer = v15;
    goto LABEL_18;
  }
  uint64_t v18 = [(NSMutableArray *)self->_paths count];
  if (v14 < 1.0 && currentLayer == v18)
  {
    [(BKUICurvesView *)self _animateFromLayer:v15 toLayer:self->_currentLayer withColor:self->_color];
    goto LABEL_17;
  }
LABEL_18:
  self->_progress = v14;
  self->_estimating = 0;
}

- (CGPoint)_getPoint:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@","];
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  [v4 floatValue];
  double v6 = v5;
  uint64_t v7 = [v3 objectAtIndexedSubscript:1];
  [v7 floatValue];
  double v9 = v8;

  double v10 = v6;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_waitForInit
{
  [(NSCondition *)self->_initCondition lock];
  while (!self->_inited)
    [(NSCondition *)self->_initCondition wait];
  initCondition = self->_initCondition;

  [(NSCondition *)initCondition unlock];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  uint64_t v4 = objc_msgSend(a3, "valueForKey:", @"oldLayer", a4);
  if (v4)
  {
    id v5 = v4;
    [v4 removeFromSuperlayer];
    uint64_t v4 = v5;
  }
}

- (void)_startAnimation:(unint64_t)a3 withColor:(id)a4 isLast:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  if ([(NSMutableArray *)self->_paths count] > a3)
  {
    double v9 = [MEMORY[0x1E4F39C88] layer];
    [(BKUICurvesView *)self bounds];
    double v11 = v10;
    [(UIBezierPath *)self->_wholePath bounds];
    double v13 = v11 / v12;
    [(BKUICurvesView *)self bounds];
    double v15 = v14;
    [(UIBezierPath *)self->_wholePath bounds];
    double v17 = v15 / v16;
    if (v13 < v15 / v16) {
      double v17 = v13;
    }
    float v18 = v17;
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeScale(&v32, v18, v18);
    [(UIBezierPath *)self->_wholePath bounds];
    CGFloat v20 = -v19;
    [(UIBezierPath *)self->_wholePath bounds];
    CGAffineTransformTranslate(&v33, &v32, v20, -v21);
    v22 = [(NSMutableArray *)self->_paths objectAtIndexedSubscript:a3];
    v23 = [(BKUICurvesView *)self newQuartzPath:v22 transform:&v33];

    [v9 setPath:v23];
    CFRelease(v23);
    objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v8, "CGColor"));
    [v9 setFillColor:0];
    [v9 setLineWidth:1.5];
    [v9 setLineJoin:*MEMORY[0x1E4F3A468]];
    v24 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
    [v24 setFromValue:&unk_1F4094720];
    [v24 setToValue:&unk_1F4094730];
    [(NSNumber *)self->_speed floatValue];
    [v24 setDuration:v25];
    objc_storeStrong((id *)&self->_lastAnimation, v24);
    if (v5)
    {
      [v24 duration];
      [(BKUICurvesView *)self performSelector:sel__checkEstimateFailedAfterAnimation_ withObject:v24 afterDelay:v26 + 0.0500000007];
    }
    [v9 addAnimation:v24 forKey:@"strokeEnd"];
    if ([(NSMutableArray *)self->_pathLayers count] > a3
      && ([(NSMutableArray *)self->_pathLayers objectAtIndexedSubscript:a3],
          (uint64_t v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = (void *)v27;
      v29 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
      [v29 setFromValue:&unk_1F4094730];
      [v29 setToValue:&unk_1F4094740];
      [(NSNumber *)self->_speed floatValue];
      [v29 setDuration:v30];
      [v29 setDelegate:self];
      [v29 setValue:v28 forKey:@"oldLayer"];
      [v28 addAnimation:v29 forKey:@"opacity"];
      [(NSMutableArray *)self->_pathLayers replaceObjectAtIndex:a3 withObject:v9];
    }
    else
    {
      [(NSMutableArray *)self->_pathLayers addObject:v9];
    }
    v31 = [(BKUICurvesView *)self layer];
    [v31 addSublayer:v9];
  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([v13 isEqualToString:@"path"])
  {
    id v92 = v15;
    id v93 = v14;
    id v94 = v13;
    id v95 = v12;
    id v91 = v16;
    double v17 = [v16 valueForKey:@"d"];
    id v18 = objc_alloc_init(MEMORY[0x1E4F427D0]);
    v90 = v17;
    double v19 = [v17 componentsSeparatedByString:@" "];
    char v20 = 0;
    char v21 = 0;
    int v22 = 0;
LABEL_3:
    char v23 = 0;
LABEL_4:
    char v24 = v23;
    while ([v19 count] > (unint64_t)v22)
    {
      float v25 = [v19 objectAtIndexedSubscript:v22];
      int v26 = [v25 characterAtIndex:0];

      if ((v26 & 0xFFFFFFDF) == 0x4D)
      {
        v56 = [v19 objectAtIndexedSubscript:v22 + 1];
        [(BKUICurvesView *)self _getPoint:v56];
        double v58 = v57;
        double v60 = v59;
        v22 += 2;

        char v23 = 1;
        objc_msgSend(v18, "moveToPoint:", v58, v60);
        char v21 = 0;
        goto LABEL_4;
      }
      BOOL v27 = v26 != 108;
      if (v26 == 108)
      {
        [v18 currentPoint];
        double v48 = v47;
        double v50 = v49;
        v51 = [v19 objectAtIndexedSubscript:v22 + 1];
        [(BKUICurvesView *)self _getPoint:v51];
        double v53 = v52;
        double v55 = v54;
        v22 += 2;

        -[BKUICurvesView _path:drawLineToPoint:](self, "_path:drawLineToPoint:", v18, v48 + v53, v50 + v55);
        char v21 = v27;
      }
      else
      {
        if ((v26 | 0x20) == 0x63)
        {
          [v18 currentPoint];
          double v71 = v70;
          double v73 = v72;
          BOOL v74 = v26 == 67;
          v75 = [v19 objectAtIndexedSubscript:v22 + 1];
          [(BKUICurvesView *)self _getPoint:v75];
          double v77 = v76;
          double v79 = v78;

          v80 = [v19 objectAtIndexedSubscript:v22 + 2];
          [(BKUICurvesView *)self _getPoint:v80];
          double v82 = v81;
          double v84 = v83;

          v85 = [v19 objectAtIndexedSubscript:v22 + 3];
          [(BKUICurvesView *)self _getPoint:v85];
          double v87 = v86;
          double v89 = v88;
          v20 |= v74;

          if ((v20 & 1) == 0)
          {
            double v87 = v71 + v87;
            double v89 = v73 + v89;
            double v77 = v71 + v77;
            double v79 = v73 + v79;
            double v82 = v71 + v82;
            double v84 = v73 + v84;
          }
          -[BKUICurvesView _path:drawCurveToPoint:controlPoint1:controlPoint2:](self, "_path:drawCurveToPoint:controlPoint1:controlPoint2:", v18, v87, v89, v77, v79, v82, v84);
          v22 += 4;
          [v18 currentPoint];
          goto LABEL_3;
        }
        if ((v21 & 1) == 0)
        {
          char v23 = 0;
          char v21 = 1;
          if (v24)
          {
            [v18 currentPoint];
            double v62 = v61;
            double v64 = v63;
            v65 = [v19 objectAtIndexedSubscript:v22];
            [(BKUICurvesView *)self _getPoint:v65];
            double v67 = v66;
            double v69 = v68;
            ++v22;

            char v23 = 1;
            -[BKUICurvesView _path:drawLineToPoint:](self, "_path:drawLineToPoint:", v18, v62 + v67, v64 + v69);
            char v21 = 0;
          }
          goto LABEL_4;
        }
        [v18 currentPoint];
        double v29 = v28;
        double v31 = v30;
        CGAffineTransform v32 = [v19 objectAtIndexedSubscript:v22];
        [(BKUICurvesView *)self _getPoint:v32];
        double v34 = v33;
        double v36 = v35;

        v37 = [v19 objectAtIndexedSubscript:v22 + 1];
        [(BKUICurvesView *)self _getPoint:v37];
        double v39 = v38;
        double v41 = v40;

        v42 = [v19 objectAtIndexedSubscript:v22 + 2];
        [(BKUICurvesView *)self _getPoint:v42];
        double v44 = v43;
        double v46 = v45;

        if ((v20 & 1) == 0)
        {
          double v44 = v29 + v44;
          double v46 = v31 + v46;
          double v34 = v29 + v34;
          double v36 = v31 + v36;
          double v39 = v29 + v39;
          double v41 = v31 + v41;
        }
        -[BKUICurvesView _path:drawCurveToPoint:controlPoint1:controlPoint2:](self, "_path:drawCurveToPoint:controlPoint1:controlPoint2:", v18, v44, v46, v34, v36, v39, v41);
        v22 += 3;
        [v18 currentPoint];
        char v21 = v27;
      }
    }
    [(UIBezierPath *)self->_wholePath appendPath:v18];
    [(NSMutableArray *)self->_paths addObject:v18];

    id v13 = v94;
    id v12 = v95;
    id v15 = v92;
    id v14 = v93;
    id v16 = v91;
  }
}

- (void)_path:(id)a3 drawCurveToPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6
{
}

- (void)_path:(id)a3 drawLineToPoint:(CGPoint)a4
{
}

- (void)loadDataFromXML:(id)a3 name:(id)a4 color:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (OS_os_log *)os_log_create("com.apple.biometrickitui", "CurvesView");
  bkui_curves_view_log = self->bkui_curves_view_log;
  self->bkui_curves_view_log = v11;

  objc_storeStrong((id *)&self->_color, a5);
  id v13 = (UIBezierPath *)objc_alloc_init(MEMORY[0x1E4F427D0]);
  wholePath = self->_wholePath;
  self->_wholePath = v13;

  id v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  paths = self->_paths;
  self->_paths = v15;

  id v17 = objc_alloc(NSNumber);
  LODWORD(v18) = 0.5;
  double v19 = (NSNumber *)[v17 initWithFloat:v18];
  speed = self->_speed;
  self->_speed = v19;

  char v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  pathLayers = self->_pathLayers;
  self->_pathLayers = v21;

  fingerLayer = self->_fingerLayer;
  self->_fingerLayer = 0;

  self->_unint64_t currentLayer = 0;
  self->_preEstimateLayer = 0;
  self->_lastRatio = 0.0;
  self->_inited = 0;
  char v24 = (NSCondition *)objc_alloc_init(MEMORY[0x1E4F28BB0]);
  initCondition = self->_initCondition;
  self->_initCondition = v24;

  self->_lastFrameSize = (CGSize)*MEMORY[0x1E4F1DB30];
  int v26 = self->bkui_curves_view_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_impl(&dword_1E4B6C000, v26, OS_LOG_TYPE_INFO, "BiometricKitUI: Loading bundle: \"%@\" with name: \"%@\", and color: \"%@\"", buf, 0x20u);
  }
  BOOL v27 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke;
  block[3] = &unk_1E6EA21A8;
  block[4] = self;
  id v31 = v8;
  id v32 = v9;
  id v28 = v9;
  id v29 = v8;
  dispatch_async(v27, block);
}

void __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 528);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_cold_2((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
  id v10 = [*(id *)(a1 + 40) pathForResource:*(void *)(a1 + 48) ofType:@"svg"];
  double v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v10];
  uint64_t v12 = [objc_alloc(MEMORY[0x1E4F29250]) initWithData:v11];
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 496);
  *(void *)(v13 + 496) = v12;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 496), "setDelegate:");
  if ([*(id *)(*(void *)(a1 + 32) + 496) parse])
  {
    id v15 = [MEMORY[0x1E4F39C88] layer];
    [*v2 bounds];
    double v17 = v16;
    double v19 = v18;
    [*((id *)*v2 + 63) bounds];
    double v21 = v17 / v20;
    [*((id *)*v2 + 63) bounds];
    double v23 = v19 / v22;
    memset(&v39.c, 0, 32);
    if (v21 < v19 / v22) {
      double v23 = v21;
    }
    *(_OWORD *)&v39.a = 0uLL;
    CGAffineTransformMakeScale(&v38, v23, v23);
    [*((id *)*v2 + 63) bounds];
    CGFloat v25 = -v24;
    [*((id *)*v2 + 63) bounds];
    CGAffineTransformTranslate(&v39, &v38, v25, -v26);
    BOOL v27 = (const void *)[*v2 newQuartzPath:*((void *)*v2 + 63) transform:&v39];
    [v15 setPath:v27];
    CFRelease(v27);
    objc_msgSend(v15, "setStrokeColor:", objc_msgSend(*((id *)*v2 + 52), "CGColor"));
    [v15 setFillColor:0];
    [v15 setLineWidth:1.5];
    [v15 setLineJoin:*MEMORY[0x1E4F3A468]];
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    id v34 = __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_38;
    __int16 v35 = &unk_1E6EA2180;
    id v36 = *v2;
    id v37 = v15;
    id v28 = v15;
    dispatch_async(MEMORY[0x1E4F14428], &v32);
  }
  else
  {
    id v29 = *((void *)*v2 + 66);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_cold_1((uint64_t *)v2, v29);
    }
  }
  double v30 = *((void *)*v2 + 66);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = *v2;
    LODWORD(v39.a) = 138412290;
    *(void *)((char *)&v39.a + 4) = v31;
    _os_log_impl(&dword_1E4B6C000, v30, OS_LOG_TYPE_INFO, "BiometricKitUI: dispatch_async exit, self = %@", (uint8_t *)&v39, 0xCu);
  }
  objc_msgSend(*((id *)*v2 + 60), "lock", v32, v33, v34, v35, v36);
  *((unsigned char *)*v2 + 488) = 1;
  [*((id *)*v2 + 60) signal];
  [*((id *)*v2 + 60) unlock];
}

uint64_t __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_38(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) layer];
  [v2 addSublayer:*(void *)(a1 + 40)];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 520), *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  [v3 sublayerSize];

  return objc_msgSend(v3, "setSublayersSize:");
}

- (void)_addEstimateWatchDog
{
  id v3 = [NSNumber numberWithInteger:self->_preEstimateLayer];
  [(BKUICurvesView *)self performSelector:sel__resetEstimate_ withObject:v3 afterDelay:2.0];
}

- (void)_removeEstimateWatchDog
{
  id v3 = (void *)MEMORY[0x1E4FBA8A8];
  id v4 = [NSNumber numberWithInteger:self->_preEstimateLayer];
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__resetEstimate_ object:v4];
}

- (CGPath)newQuartzPath:(id)a3 transform:(CGAffineTransform *)a4
{
  [a3 CGPath];

  JUMPOUT(0x1E4E88F30);
}

- (void)setSublayersSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  bkui_curves_view_log = self->bkui_curves_view_log;
  if (os_log_type_enabled(bkui_curves_view_log, OS_LOG_TYPE_DEBUG)) {
    [(BKUICurvesView *)bkui_curves_view_log setSublayersSize:height];
  }
  [(BKUICurvesView *)self _waitForInit];
  if (self->_fingerLayer)
  {
    self->_lastFrameSize.double width = width;
    self->_lastFrameSize.double height = height;
    [(UIBezierPath *)self->_wholePath bounds];
    double v8 = width / v7;
    [(UIBezierPath *)self->_wholePath bounds];
    if (v8 >= height / v9) {
      double v10 = height / v9;
    }
    else {
      double v10 = v8;
    }
    double v11 = self->bkui_curves_view_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double lastRatio = self->_lastRatio;
      LODWORD(buf.a) = 134218240;
      *(double *)((char *)&buf.a + 4) = v10;
      WORD2(buf.b) = 2048;
      *(double *)((char *)&buf.b + 6) = lastRatio;
      _os_log_impl(&dword_1E4B6C000, v11, OS_LOG_TYPE_DEFAULT, "setSublayersSize %f (%f)", (uint8_t *)&buf, 0x16u);
    }
    if (v10 != self->_lastRatio)
    {
      self->_double lastRatio = v10;
      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeScale(&v27, v10, v10);
      [(UIBezierPath *)self->_wholePath bounds];
      CGFloat v14 = -v13;
      [(UIBezierPath *)self->_wholePath bounds];
      CGAffineTransformTranslate(&buf, &v27, v14, -v15);
      double v16 = [(BKUICurvesView *)self newQuartzPath:self->_wholePath transform:&buf];
      [(CAShapeLayer *)self->_fingerLayer setPath:v16];
      CFRelease(v16);
      double v17 = [(BKUICurvesView *)self layer];
      double v18 = [v17 sublayers];
      unint64_t v19 = [v18 count];

      if (v19 >= 2)
      {
        for (uint64_t i = 1; i != v19; ++i)
        {
          if ([(NSMutableArray *)self->_paths count] > (unint64_t)(i - 1))
          {
            double v21 = [(BKUICurvesView *)self layer];
            double v22 = [v21 sublayers];
            double v23 = [v22 objectAtIndex:i];

            double v24 = [(NSMutableArray *)self->_paths objectAtIndexedSubscript:i - 1];
            CGFloat v25 = [(BKUICurvesView *)self newQuartzPath:v24 transform:&buf];

            [v23 setPath:v25];
            CFRelease(v25);
          }
        }
      }
    }
  }
  else
  {
    double v26 = self->bkui_curves_view_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[BKUICurvesView setSublayersSize:](v26);
    }
    -[BKUICurvesView setSublayerSize:](self, "setSublayerSize:", width, height);
  }
}

- (NSNumber)speed
{
  return (NSNumber *)objc_getProperty(self, a2, 536, 1);
}

- (void)setSpeed:(id)a3
{
}

- (CGSize)sublayerSize
{
  double width = self->_sublayerSize.width;
  double height = self->_sublayerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSublayerSize:(CGSize)a3
{
  self->_sublayerSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->bkui_curves_view_log, 0);
  objc_storeStrong((id *)&self->_fingerLayer, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_wholePath, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_initCondition, 0);
  objc_storeStrong((id *)&self->_lastAnimation, 0);
  objc_storeStrong((id *)&self->_color, 0);

  objc_storeStrong((id *)&self->_pathLayers, 0);
}

- (double)estimateProgress:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1E4B6C000, a1, a3, "BiometricKitUI: Estimated increase: %f", a5, a6, a7, a8, 0);
  return result;
}

- (double)setProgress:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1E4B6C000, a1, a3, "BiometricKitUI: Progress set to: %f", a5, a6, a7, a8, 0);
  return result;
}

- (void)parser:(uint64_t)a1 didStartElement:(NSObject *)a2 namespaceURI:qualifiedName:attributes:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "BiometricKitUI: Parsing error when processing: %@", (uint8_t *)&v2, 0xCu);
}

void __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "BiometricKitUI: NSXML parser failed or aborted, self = %@", (uint8_t *)&v3, 0xCu);
}

void __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1E4B6C000, a2, a3, "BiometricKitUI: dispatch_async entry, self = %@", a5, a6, a7, a8, 2u);
}

- (void)setSublayersSize:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_ERROR, "BiometricKitUI: Error: _fingerLayer == nil!", v1, 2u);
}

- (void)setSublayersSize:(double)a3 .cold.2(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_DEBUG, "BiometricKitUI: setSublayersSize entry, frameSize=[%f,%f]", (uint8_t *)&v3, 0x16u);
}

@end