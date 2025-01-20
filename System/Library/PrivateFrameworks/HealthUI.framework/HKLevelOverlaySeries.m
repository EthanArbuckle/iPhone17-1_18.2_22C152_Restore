@interface HKLevelOverlaySeries
+ (id)levelOverlaySeriesWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5;
+ (id)presentationStyleWithColor:(id)a3 options:(unint64_t)a4;
- (BOOL)shouldDisplayLowerBound;
- (BOOL)shouldDisplayUpperBound;
- (HKLevelOverlaySeries)initWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5;
- (id)_chartDataFromBlockCoordinates:(id)a3;
- (id)_visibleBlockCoordinatesFromBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5 strict:(BOOL)a6;
- (int64_t)overlayType;
- (void)_configureOverlaySeriesWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5;
- (void)_drawBoundAnnotationsWithCoordinates:(id)a3 displayUpperBound:(BOOL)a4 displayLowerBound:(BOOL)a5 axisAnnotationDelegate:(id)a6;
- (void)_drawLevelBoundsInContext:(CGContext *)a3 coordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 seriesRect:(CGRect)a6 visibleValueRange:(id)a7 extendFirstPoint:(BOOL)a8 displayUpperBound:(BOOL)a9 displayUpperBoundPath:(BOOL)a10 displayLowerBound:(BOOL)a11 displayLowerBoundPath:(BOOL)a12 strokeStyle:(id)a13 seriesRenderingDelegate:(id)a14;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)drawSeriesWithVisibleCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9 axisAnnotationDelegate:(id)a10 shouldExtendFirstPoint:(BOOL)a11;
@end

@implementation HKLevelOverlaySeries

- (HKLevelOverlaySeries)initWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKLevelOverlaySeries;
  v10 = [(HKLineSeries *)&v13 init];
  v11 = v10;
  if (v10) {
    [(HKLevelOverlaySeries *)v10 _configureOverlaySeriesWithDisplayType:v8 dataSource:v9 options:a5];
  }

  return v11;
}

- (BOOL)shouldDisplayUpperBound
{
  return self->_options & 1;
}

- (BOOL)shouldDisplayLowerBound
{
  return (LOBYTE(self->_options) >> 1) & 1;
}

- (void)_configureOverlaySeriesWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  self->_options = a5;
  id v8 = a3;
  [(HKGraphSeries *)self setDataSource:a4];
  [(HKGraphSeries *)self setAllowsSelection:0];
  id v9 = +[HKNumericAxis standardNumericYAxisWithConfigurationOverrides:0];
  [(HKGraphSeries *)self setYAxis:v9];
  v10 = objc_opt_class();
  v11 = [v8 displayCategory];
  v12 = [v11 color];
  objc_super v13 = [v10 presentationStyleWithColor:v12 options:a5];

  v19[0] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [(HKLineSeries *)self setUnhighlightedPresentationStyles:v14];

  v18 = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [(HKLineSeries *)self setHighlightedPresentationStyles:v15];

  [(HKLineSeries *)self setInactivePresentationStyle:v13];
  v16 = [v8 chartingRules];

  v17 = [v16 axisScalingRule];
  [(HKGraphSeries *)self setAxisScalingRule:v17];
}

+ (id)levelOverlaySeriesWithDisplayType:(id)a3 dataSource:(id)a4 options:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[HKLevelOverlaySeries alloc] initWithDisplayType:v8 dataSource:v7 options:a5];

  return v9;
}

+ (id)presentationStyleWithColor:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  double v6 = HKUICeilToScreenScale(1.0);
  id v7 = v5;
  id v8 = +[HKStrokeStyle strokeStyleWithColor:v7 lineWidth:v6];
  [v8 setDashStyle:4];
  [v8 setLineCap:1];
  id v9 = objc_alloc_init(HKLineSeriesPresentationStyle);
  [(HKLineSeriesPresentationStyle *)v9 setStrokeStyle:v8];
  [(HKLineSeriesPresentationStyle *)v9 setWaveForm:0];
  [(HKLineSeriesPresentationStyle *)v9 setShouldNegateAnnotationValue:(a4 >> 2) & 1];
  v10 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_roundedSystemFontWithSize:weight:", 18.0, *MEMORY[0x1E4FB09D0]);
  v11 = HKIntegerFormatter();
  v12 = +[HKAxisLabelStyle labelStyleWithColor:v7 font:v10 horizontalAlignment:0 verticalAlignment:2 numberFormatter:v11];

  [(HKLineSeriesPresentationStyle *)v9 setAxisAnnotationStyle:v12];
  return v9;
}

- (int64_t)overlayType
{
  return 2;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v18 = a9;
  id v19 = a8;
  id v20 = a5;
  id v21 = a3;
  v22 = [v18 axisAnnotationDelegateForSeries:self];
  if (([v18 seriesDrawingDuringScrolling] & 1) != 0
    || ([v18 seriesDrawingDuringTiling] & 1) != 0
    || [v18 seriesDrawingDuringAutoscale])
  {
    [v22 clearAxisAnnotations];
  }
  v23 = [v21 coordinates];
  long long v24 = *(_OWORD *)&a6->c;
  long long v36 = *(_OWORD *)&a6->a;
  long long v37 = v24;
  long long v38 = *(_OWORD *)&a6->tx;
  v25 = -[HKLevelOverlaySeries _visibleBlockCoordinatesFromBlockCoordinates:pointTransform:screenRect:strict:](self, "_visibleBlockCoordinatesFromBlockCoordinates:pointTransform:screenRect:strict:", v23, &v36, 0, x, y, width, height);

  long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v36 = *MEMORY[0x1E4F1DAB8];
  long long v37 = v26;
  long long v38 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v27 = [v21 firstCoordinateWithTransform:&v36 roundToViewScale:0];

  v28 = [v25 firstObject];
  [v28 startXValue];
  double v30 = v29;
  [v27 startXValue];
  BOOL v32 = v30 != v31;

  long long v33 = *(_OWORD *)&a6->c;
  long long v36 = *(_OWORD *)&a6->a;
  long long v37 = v33;
  long long v38 = *(_OWORD *)&a6->tx;
  LOBYTE(v34) = v32;
  -[HKLevelOverlaySeries drawSeriesWithVisibleCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:axisAnnotationDelegate:shouldExtendFirstPoint:](self, "drawSeriesWithVisibleCoordinates:axisRect:zoomLevelConfiguration:pointTransform:renderContext:secondaryRenderContext:seriesRenderingDelegate:axisAnnotationDelegate:shouldExtendFirstPoint:", v25, v20, &v36, a7, v19, v18, x, y, width, height, v22, v34);
}

- (void)drawSeriesWithVisibleCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9 axisAnnotationDelegate:(id)a10 shouldExtendFirstPoint:(BOOL)a11
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v19 = a10;
  id v31 = a9;
  id v20 = a3;
  [(HKLevelOverlaySeries *)self _drawBoundAnnotationsWithCoordinates:v20 displayUpperBound:[(HKLevelOverlaySeries *)self shouldDisplayUpperBound] displayLowerBound:[(HKLevelOverlaySeries *)self shouldDisplayLowerBound] axisAnnotationDelegate:v19];

  id v21 = [(HKGraphSeries *)self visibleValueRange];
  BOOL v30 = [(HKLevelOverlaySeries *)self shouldDisplayUpperBound];
  BOOL v22 = [(HKLevelOverlaySeries *)self shouldDisplayUpperBound];
  BOOL v23 = [(HKLevelOverlaySeries *)self shouldDisplayLowerBound];
  BOOL v24 = [(HKLevelOverlaySeries *)self shouldDisplayLowerBound];
  v25 = [(HKLineSeries *)self unhighlightedPresentationStyles];
  long long v26 = [v25 firstObject];
  v27 = [v26 strokeStyle];
  long long v28 = *(_OWORD *)&a6->c;
  v33[0] = *(_OWORD *)&a6->a;
  v33[1] = v28;
  v33[2] = *(_OWORD *)&a6->tx;
  BYTE2(v29) = v24;
  BYTE1(v29) = v23;
  LOBYTE(v29) = v22;
  -[HKLevelOverlaySeries _drawLevelBoundsInContext:coordinates:pointTransform:seriesRect:visibleValueRange:extendFirstPoint:displayUpperBound:displayUpperBoundPath:displayLowerBound:displayLowerBoundPath:strokeStyle:seriesRenderingDelegate:](self, "_drawLevelBoundsInContext:coordinates:pointTransform:seriesRect:visibleValueRange:extendFirstPoint:displayUpperBound:displayUpperBoundPath:displayLowerBound:displayLowerBoundPath:strokeStyle:seriesRenderingDelegate:", a7, v20, v33, v21, a11, v30, x, y, width, height, v29, v27, v31);
}

- (void)_drawBoundAnnotationsWithCoordinates:(id)a3 displayUpperBound:(BOOL)a4 displayLowerBound:(BOOL)a5 axisAnnotationDelegate:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v13 = a6;
  v10 = [(HKLevelOverlaySeries *)self _chartDataFromBlockCoordinates:a3];
  if ([v10 count])
  {
    v11 = [v10 lastObject];
    v12 = v11;
    if (v7)
    {
      [v11 maxValue];
      -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v13);
    }
    if (v6)
    {
      [v12 minValue];
      -[HKLineSeries addAxisAnnotationForValue:axisAnnotationDelegate:](self, "addAxisAnnotationForValue:axisAnnotationDelegate:", v13);
    }
  }
}

- (void)_drawLevelBoundsInContext:(CGContext *)a3 coordinates:(id)a4 pointTransform:(CGAffineTransform *)a5 seriesRect:(CGRect)a6 visibleValueRange:(id)a7 extendFirstPoint:(BOOL)a8 displayUpperBound:(BOOL)a9 displayUpperBoundPath:(BOOL)a10 displayLowerBound:(BOOL)a11 displayLowerBoundPath:(BOOL)a12 strokeStyle:(id)a13 seriesRenderingDelegate:(id)a14
{
  BOOL path = a9;
  BOOL v110 = a8;
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v20 = a4;
  id v21 = a7;
  id v22 = a13;
  id v23 = a14;
  if (![v20 count]) {
    goto LABEL_68;
  }
  id v102 = v23;
  [v23 seriesContentOffset];
  double v25 = v24;
  long long v26 = (CGPoint *)malloc_type_calloc([v20 count] + 2, 0x10uLL, 0x1000040451B5BE8uLL);
  v27 = (CGPoint *)malloc_type_calloc([v20 count] + 2, 0x10uLL, 0x1000040451B5BE8uLL);
  uint64_t v28 = [v20 count];
  v121.origin.CGFloat x = x;
  v121.origin.CGFloat y = y;
  v121.size.CGFloat width = width;
  v121.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v121);
  [v22 lineWidth];
  double v112 = MinY - v30;
  v122.origin.CGFloat x = x;
  v122.origin.CGFloat y = y;
  v122.size.CGFloat width = width;
  v122.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v122);
  [v22 lineWidth];
  double v111 = MaxY + v32;
  long long v33 = [v21 minValue];
  uint64_t v34 = [v21 maxValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v34 floatValue];
      double v36 = v35;
      [v33 floatValue];
      double b = a5->b;
      double d = a5->d;
      tCGFloat y = a5->ty;
      double v111 = ty + d * v37 + b * 0.0;
      double v112 = ty + d * v36 + b * 0.0;
    }
  }
  v100 = v34;
  v101 = v33;
  v103 = v22;
  id v104 = v21;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v105 = v20;
  id obj = v20;
  uint64_t v41 = [obj countByEnumeratingWithState:&v115 objects:v119 count:16];
  double v108 = v25;
  if (!v41)
  {
    size_t v43 = 0;
    double v107 = v25;
    goto LABEL_60;
  }
  uint64_t v42 = v41;
  size_t v43 = 0;
  size_t v44 = v28 - 1;
  uint64_t v45 = *(void *)v116;
  double v107 = v25;
  do
  {
    uint64_t v46 = 0;
    do
    {
      if (*(void *)v116 != v45) {
        objc_enumerationMutation(obj);
      }
      v47 = *(void **)(*((void *)&v115 + 1) + 8 * v46);
      v48 = objc_msgSend(v47, "userInfo", v100, v101);
      [v47 endXValue];
      double v50 = v49;
      [v48 maxValue];
      double v52 = a5->tx + v51 * a5->c + a5->a * v50;
      double v53 = a5->ty + v51 * a5->d + a5->b * v50;
      [v47 endXValue];
      double v55 = v54;
      [v48 minValue];
      double v57 = a5->tx + v56 * a5->c + a5->a * v55;
      double v58 = a5->ty + v56 * a5->d + a5->b * v55;
      if (path) {
        double v59 = v53;
      }
      else {
        double v59 = v112;
      }
      if (a11) {
        double v60 = v58;
      }
      else {
        double v60 = v111;
      }
      v123.origin.CGFloat x = x;
      v123.origin.CGFloat y = y;
      v123.size.CGFloat width = width;
      v123.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v123);
      if (v43 || !v110 || v52 <= MinX)
      {
        if (v43 == 1)
        {
          double v62 = v26->x;
          if (v26->x < MinX)
          {
            double v63 = v26->y;
            double v64 = v27->x;
            double v65 = v27->y;
            double v66 = v63 + (v59 - v63) * (1.0 - (v52 - MinX) / (v52 - v62));
            if (v63 >= v59) {
              double v67 = v26->y;
            }
            else {
              double v67 = v59;
            }
            if (v52 - v62 < 0.00000011920929) {
              double v66 = v67;
            }
            if (v65 >= v60) {
              double v68 = v27->y;
            }
            else {
              double v68 = v60;
            }
            if (v57 - v64 < 0.00000011920929) {
              double v69 = v68;
            }
            else {
              double v69 = v65 + (v60 - v65) * (1.0 - (v57 - MinX) / (v57 - v64));
            }
            v26->CGFloat x = MinX;
            v26->CGFloat y = v66;
            v27->CGFloat x = MinX;
            v27->CGFloat y = v69;
            if (vabdd_f64(v63, v59) > 0.00000011920929)
            {
              double v70 = MinX - v62;
              double v71 = v66 - v63;
              double v72 = v107 - v70;
              *(float *)&double v70 = v71 * v71 + v70 * v70;
              double v107 = v72 + fabsf(sqrtf(*(float *)&v70));
            }
            if (vabdd_f64(v65, v60) > 0.00000011920929)
            {
              double v73 = MinX - v64;
              double v74 = v69 - v65;
              double v75 = v108 - v73;
              *(float *)&double v73 = v74 * v74 + v73 * v73;
              double v108 = v75 + fabsf(sqrtf(*(float *)&v73));
            }
          }
          size_t v43 = 1;
        }
      }
      else
      {
        v26->CGFloat x = MinX;
        v26->CGFloat y = v59;
        ++v44;
        size_t v43 = 1;
        v27->CGFloat x = MinX;
        v27->CGFloat y = v60;
      }
      v124.origin.CGFloat x = x;
      v124.origin.CGFloat y = y;
      v124.size.CGFloat width = width;
      v124.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v124);
      if (v43 == v44 && v52 < MaxX)
      {
        p_CGFloat x = &v26[v44].x;
        *p_CGFloat x = v52;
        p_x[1] = v59;
        v78 = &v27[v44].x;
        double *v78 = v57;
        v78[1] = v60;
        ++v44;
LABEL_41:
        double v52 = MaxX;
        size_t v43 = v44;
        goto LABEL_54;
      }
      if (v43 == v44 && v52 > MaxX)
      {
        v79 = &v26[v44 - 1].x;
        double v80 = v79[1];
        double v81 = v52 - *v79;
        double v82 = v80 + (v59 - v80) * (1.0 - (v52 - MaxX) / v81);
        if (v80 < v59) {
          double v80 = v59;
        }
        if (v81 < 0.00000011920929) {
          double v59 = v80;
        }
        else {
          double v59 = v82;
        }
        v83 = &v27[v44 - 1].x;
        double v84 = v83[1];
        double v85 = v57 - *v83;
        if (v85 >= 0.00000011920929)
        {
          double v60 = v84 + (v60 - v84) * (1.0 - (v57 - MaxX) / v85);
        }
        else if (v84 >= v60)
        {
          double v60 = v83[1];
        }
        goto LABEL_41;
      }
      double MaxX = v57;
LABEL_54:
      v86 = &v26[v43].x;
      double *v86 = v52;
      v86[1] = v59;
      v87 = &v27[v43].x;
      double *v87 = MaxX;
      v87[1] = v60;
      ++v43;

      ++v46;
    }
    while (v42 != v46);
    uint64_t v88 = [obj countByEnumeratingWithState:&v115 objects:v119 count:16];
    uint64_t v42 = v88;
  }
  while (v88);
LABEL_60:

  Mutable = CGPathCreateMutable();
  v90 = CGPathCreateMutable();
  v91 = CGPathCreateMutable();
  patha = Mutable;
  CGPathAddLines(Mutable, 0, v26, v43);
  CGPathAddLines(v90, 0, v27, v43);
  CGPathAddLines(v91, 0, v26, v43);
  if ((uint64_t)(v43 - 1) >= 0)
  {
    p_CGFloat y = &v27[v43 - 1].y;
    do
    {
      CGPathAddLineToPoint(v91, 0, *(p_y - 1), *p_y);
      p_y -= 2;
      --v43;
    }
    while (v43);
  }
  CGPathCloseSubpath(v91);
  v93 = [v103 strokeColor];
  v94 = [v93 colorWithAlphaComponent:0.1];
  v95 = [v93 colorWithAlphaComponent:0.3];
  uint64_t v96 = HKUIDynamicColorWithColors(v94, v95);

  v97 = (void *)v96;
  id v22 = v103;
  id v98 = v97;
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v98 CGColor]);
  id v99 = v93;
  CGContextSetStrokeColorWithColor(a3, (CGColorRef)[v99 CGColor]);
  if (a10)
  {
    CGContextAddPath(a3, Mutable);
    [v103 applyToContext:a3 dashPhase:v107];
    CGContextStrokePath(a3);
  }
  id v21 = v104;
  id v23 = v102;
  if (a12)
  {
    CGContextAddPath(a3, v90);
    [v103 applyToContext:a3 dashPhase:v108];
    CGContextStrokePath(a3);
  }
  CGContextAddPath(a3, v91);
  CGContextFillPath(a3);
  CGPathRelease(patha);
  CGPathRelease(v90);
  CGPathRelease(v91);
  free(v26);
  free(v27);

  id v20 = v105;
LABEL_68:
}

- (id)_visibleBlockCoordinatesFromBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 screenRect:(CGRect)a5 strict:(BOOL)a6
{
  double width = a5.size.width;
  double x = a5.origin.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v36;
    double v15 = x + width;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v10);
        }
        id v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v18 startXValue];
        double v20 = a4->tx + a4->c * 0.0 + a4->a * v19;
        if (v20 >= x && v20 <= v15)
        {
          id v22 = [v18 userInfo];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            [v31 addObject:v18];
            if (!a6)
            {
              uint64_t v29 = v13 + i;
              if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
                uint64_t v16 = v13 + i;
              }
            }
          }
        }
      }
      v13 += v12;
      uint64_t v12 = [v10 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__HKLevelOverlaySeries__visibleBlockCoordinatesFromBlockCoordinates_pointTransform_screenRect_strict___block_invoke;
  aBlock[3] = &unk_1E6D55680;
  id v33 = v10;
  id v24 = v31;
  id v34 = v24;
  id v25 = v10;
  long long v26 = (void (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v26[2](v26, v16, 1);
  v26[2](v26, v29, 0);
  id v27 = v24;

  return v27;
}

void __102__HKLevelOverlaySeries__visibleBlockCoordinatesFromBlockCoordinates_pointTransform_screenRect_strict___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = a3 ? a2 - 1 : a2 + 1;
    if ((v4 & 0x8000000000000000) == 0 && v4 < [*(id *)(a1 + 32) count])
    {
      id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
      BOOL v6 = [v9 userInfo];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v8 = *(void **)(a1 + 40);
        if (a3) {
          [v8 insertObject:v9 atIndex:0];
        }
        else {
          [v8 addObject:v9];
        }
      }
    }
  }
}

- (id)_chartDataFromBlockCoordinates:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_70);
}

id __55__HKLevelOverlaySeries__chartDataFromBlockCoordinates___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 userInfo];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [v2 userInfo];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end