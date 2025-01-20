@interface HKLevelCategoryTimePeriodSeries
- (BOOL)_interiorCategoryLabels;
- (BOOL)drawSampleSpans;
- (BOOL)drawSampleSpansStorage;
- (BOOL)roundDaySamples;
- (BOOL)roundDaySamplesStorage;
- (HKLevelCategoryTimePeriodSeries)init;
- (NSLock)seriesMutableStateLock;
- (NSString)specialMarkLegendLabel;
- (NSString)specialMarkLegendLabelStorage;
- (UIColor)categoryLevelColor;
- (UIColor)categoryLevelColorStorage;
- (UIColor)innerMarkColor;
- (UIColor)innerMarkColorStorage;
- (UIColor)specialMarkColor;
- (UIColor)specialMarkColorStorage;
- (UIFont)categoryLevelFont;
- (UIFont)categoryLevelFontStorage;
- (double)_coordinateForNow:(id)a3 pointTransform:(CGAffineTransform *)a4;
- (double)markerRadius;
- (double)markerRadiusStorage;
- (double)offsetForEnumerationRect:(CGRect)a3;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6;
- (void)_drawCategoryLabels:(CGContext *)a3 axisRect:(CGRect)a4 seriesRenderingDelegate:(id)a5;
- (void)_drawMarkerWithContext:(CGContext *)a3 style:(int64_t)a4 color:(CGColor *)a5 innerColor:(CGColor *)a6 specialColor:(CGColor *)a7 location:(CGPoint)a8 radius:(double)a9;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setCategoryLevelColor:(id)a3;
- (void)setCategoryLevelColorStorage:(id)a3;
- (void)setCategoryLevelFont:(id)a3;
- (void)setCategoryLevelFontStorage:(id)a3;
- (void)setDrawSampleSpans:(BOOL)a3;
- (void)setDrawSampleSpansStorage:(BOOL)a3;
- (void)setInnerMarkColor:(id)a3;
- (void)setInnerMarkColorStorage:(id)a3;
- (void)setMarkerRadius:(double)a3;
- (void)setMarkerRadiusStorage:(double)a3;
- (void)setRoundDaySamples:(BOOL)a3;
- (void)setRoundDaySamplesStorage:(BOOL)a3;
- (void)setSpecialMarkColor:(id)a3;
- (void)setSpecialMarkColorStorage:(id)a3;
- (void)setSpecialMarkLegendLabel:(id)a3;
- (void)setSpecialMarkLegendLabelStorage:(id)a3;
@end

@implementation HKLevelCategoryTimePeriodSeries

- (HKLevelCategoryTimePeriodSeries)init
{
  v12.receiver = self;
  v12.super_class = (Class)HKLevelCategoryTimePeriodSeries;
  v2 = [(HKHorizontalTimePeriodSeries *)&v12 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKLevelCategoryTimePeriodSeriesLock"];
    v2->_markerRadiusStorage = 4.0;
    uint64_t v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    innerMarkColorStorage = v2->_innerMarkColorStorage;
    v2->_innerMarkColorStorage = (UIColor *)v5;

    categoryLevelFontStorage = v2->_categoryLevelFontStorage;
    v2->_categoryLevelFontStorage = 0;

    categoryLevelColorStorage = v2->_categoryLevelColorStorage;
    v2->_categoryLevelColorStorage = 0;

    specialMarkColorStorage = v2->_specialMarkColorStorage;
    v2->_specialMarkColorStorage = 0;

    specialMarkLegendLabelStorage = v2->_specialMarkLegendLabelStorage;
    v2->_specialMarkLegendLabelStorage = 0;

    v2->_drawSampleSpansStorage = 0;
    v2->_roundDaySamplesStorage = 0;
  }
  return v2;
}

- (double)markerRadius
{
  v3 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  double markerRadiusStorage = self->_markerRadiusStorage;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return markerRadiusStorage;
}

- (void)setMarkerRadius:(double)a3
{
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double markerRadiusStorage = a3;
  id v6 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (UIColor)innerMarkColor
{
  v3 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_innerMarkColorStorage;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setInnerMarkColor:(id)a3
{
  v4 = (UIColor *)a3;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  innerMarkColorStorage = self->_innerMarkColorStorage;
  self->_innerMarkColorStorage = v4;

  id v7 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (UIFont)categoryLevelFont
{
  v3 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_categoryLevelFontStorage;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setCategoryLevelFont:(id)a3
{
  v4 = (UIFont *)a3;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  categoryLevelFontStorage = self->_categoryLevelFontStorage;
  self->_categoryLevelFontStorage = v4;

  id v7 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (UIColor)categoryLevelColor
{
  v3 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_categoryLevelColorStorage;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setCategoryLevelColor:(id)a3
{
  v4 = (UIColor *)a3;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  categoryLevelColorStorage = self->_categoryLevelColorStorage;
  self->_categoryLevelColorStorage = v4;

  id v7 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (UIColor)specialMarkColor
{
  v3 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_specialMarkColorStorage;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSpecialMarkColor:(id)a3
{
  v4 = (UIColor *)a3;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  specialMarkColorStorage = self->_specialMarkColorStorage;
  self->_specialMarkColorStorage = v4;

  id v7 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (NSString)specialMarkLegendLabel
{
  v3 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_specialMarkLegendLabelStorage;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSpecialMarkLegendLabel:(id)a3
{
  v4 = (NSString *)a3;
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  specialMarkLegendLabelStorage = self->_specialMarkLegendLabelStorage;
  self->_specialMarkLegendLabelStorage = v4;

  id v7 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (BOOL)drawSampleSpans
{
  v3 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_drawSampleSpansStorage;
  v4 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setDrawSampleSpans:(BOOL)a3
{
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_drawSampleSpansStorage = a3;
  id v6 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (BOOL)roundDaySamples
{
  v3 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_roundDaySamplesStorage;
  v4 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setRoundDaySamples:(BOOL)a3
{
  uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_roundDaySamplesStorage = a3;
  id v6 = [(HKLevelCategoryTimePeriodSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (BOOL)_interiorCategoryLabels
{
  v3 = [(HKHorizontalTimePeriodSeries *)self valueLabels];
  if (v3)
  {
    v4 = [(HKLevelCategoryTimePeriodSeries *)self categoryLevelFont];
    if (v4)
    {
      uint64_t v5 = [(HKLevelCategoryTimePeriodSeries *)self categoryLevelColor];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v6 = a3;
  if ([(HKLevelCategoryTimePeriodSeries *)self _interiorCategoryLabels])
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)HKLevelCategoryTimePeriodSeries;
    id v7 = [(HKHorizontalTimePeriodSeries *)&v9 findAxisLabelsInModelRange:v6 zoomScale:a4];
  }

  return v7;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v13 = [a3 chartPoints];
  if (!v13)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKLevelCategoryTimePeriodSeries.m", 181, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  v14 = [v11 transform];
  v15 = [v12 transform];

  v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __77__HKLevelCategoryTimePeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D51A08;
  id v26 = v14;
  v27 = self;
  long long v30 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  id v28 = v15;
  id v29 = v16;
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t v24 = a4->resolution;
  v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v17 blockPath:&v23];

  return v20;
}

void __77__HKLevelCategoryTimePeriodSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  id v24 = a2;
  v3 = [v24 yValue];

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v24 startDate];
    [v4 coordinateForValue:v5];
    double v7 = v6;

    v8 = *(void **)(a1 + 32);
    objc_super v9 = [v24 endDate];
    [v8 coordinateForValue:v9];
    double v11 = v10;

    if ([*(id *)(a1 + 40) roundDaySamples])
    {
      double v12 = floor(v7);
      double v13 = ceil(v11);
      if (*(void *)(a1 + 72) == 6)
      {
        double v7 = v12;
        double v11 = v13;
      }
    }
    v14 = *(void **)(a1 + 48);
    v15 = [v24 yValue];
    [v14 coordinateForValue:v15];
    double v17 = v16;

    uint64_t v18 = [v24 pointStyle];
    if (v18 == 2) {
      uint64_t v19 = 2;
    }
    else {
      uint64_t v19 = v18 == 1;
    }
    v20 = *(void **)(a1 + 56);
    v21 = [HKStackedCategoryValueSeriesCoordinate alloc];
    v22 = [v24 userInfo];
    long long v23 = -[HKStackedCategoryValueSeriesCoordinate initWithStart:end:pointStyle:userInfo:](v21, "initWithStart:end:pointStyle:userInfo:", v19, v22, v7, v17, v11, v17);
    [v20 addObject:v23];
  }
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a3;
  id v18 = a9;
  char v19 = [v18 seriesDrawingDuringTiling];
  if ([(HKLevelCategoryTimePeriodSeries *)self drawSampleSpans])
  {
    long long v20 = *(_OWORD *)&a6->c;
    long long v36 = *(_OWORD *)&a6->a;
    long long v37 = v20;
    long long v38 = *(_OWORD *)&a6->tx;
    [(HKLevelCategoryTimePeriodSeries *)self _coordinateForNow:v18 pointTransform:&v36];
    unint64_t v22 = v21;
  }
  else
  {
    unint64_t v22 = 0xFFEFFFFFFFFFFFFFLL;
  }
  CGContextSaveGState(a7);
  -[HKLevelCategoryTimePeriodSeries _drawCategoryLabels:axisRect:seriesRenderingDelegate:](self, "_drawCategoryLabels:axisRect:seriesRenderingDelegate:", a7, v18, x, y, width, height);
  id v23 = [(HKHorizontalTimePeriodSeries *)self fillColor];
  uint64_t v24 = [v23 CGColor];

  v25 = [(HKLevelCategoryTimePeriodSeries *)self innerMarkColor];
  if (v25) {
    [(HKLevelCategoryTimePeriodSeries *)self innerMarkColor];
  }
  else {
    objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
  }
  id v26 = objc_claimAutoreleasedReturnValue();
  uint64_t v27 = [v26 CGColor];

  [(HKLevelCategoryTimePeriodSeries *)self markerRadius];
  uint64_t v29 = v28;
  long long v30 = [(HKLevelCategoryTimePeriodSeries *)self specialMarkColor];

  uint64_t v31 = v24;
  if (v30)
  {
    id v32 = [(HKLevelCategoryTimePeriodSeries *)self specialMarkColor];
    uint64_t v31 = [v32 CGColor];
  }
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __174__HKLevelCategoryTimePeriodSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
  v34[3] = &unk_1E6D51A30;
  v34[4] = self;
  *(double *)&v34[5] = x;
  *(double *)&v34[6] = y;
  *(double *)&v34[7] = width;
  *(double *)&v34[8] = height;
  v34[9] = v22;
  v34[10] = a7;
  v34[11] = v29;
  char v35 = v19;
  v34[12] = v24;
  v34[13] = v27;
  v34[14] = v31;
  long long v33 = *(_OWORD *)&a6->c;
  long long v36 = *(_OWORD *)&a6->a;
  long long v37 = v33;
  long long v38 = *(_OWORD *)&a6->tx;
  [v17 enumerateCoordinatesWithTransform:&v36 roundToViewScale:1 block:v34];
  CGContextRestoreGState(a7);
}

void __174__HKLevelCategoryTimePeriodSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v20 = a2;
  id v6 = a4;
  [v20 start];
  double v8 = v7;
  [v20 end];
  CGFloat v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "offsetForCoordinate:axisRect:", v6, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  CGFloat v12 = v11;

  if ([*(id *)(a1 + 32) drawSampleSpans])
  {
    double v13 = *(double *)(a1 + 72);
    v14 = *(CGColor **)(a1 + 96);
    if (v13 <= v8)
    {
      double v16 = *(CGContext **)(a1 + 80);
      double v17 = *(double *)(a1 + 88) + *(double *)(a1 + 88);
      int v19 = *(unsigned __int8 *)(a1 + 120);
      CGFloat v18 = v8;
      goto LABEL_7;
    }
    CGContextSetStrokeColorWithColor(*(CGContextRef *)(a1 + 80), v14);
    CGContextSetLineWidth(*(CGContextRef *)(a1 + 80), *(double *)(a1 + 88) + *(double *)(a1 + 88));
    CGContextSetLineCap(*(CGContextRef *)(a1 + 80), kCGLineCapButt);
    CGContextMoveToPoint(*(CGContextRef *)(a1 + 80), v8, v12);
    v15 = *(CGContext **)(a1 + 80);
    if (v13 >= v8 && v13 <= v10)
    {
      CGContextAddLineToPoint(v15, *(CGFloat *)(a1 + 72), v12);
      CGContextStrokePath(*(CGContextRef *)(a1 + 80));
      double v16 = *(CGContext **)(a1 + 80);
      double v17 = *(double *)(a1 + 88) + *(double *)(a1 + 88);
      CGFloat v18 = *(double *)(a1 + 72);
      v14 = *(CGColor **)(a1 + 96);
      int v19 = *(unsigned __int8 *)(a1 + 120);
LABEL_7:
      DrawDiagonalSlashPatternLine(v16, v14, v19, v17, v18, v12, v10, v12);
      goto LABEL_9;
    }
    CGContextAddLineToPoint(v15, v10, v12);
    CGContextStrokePath(*(CGContextRef *)(a1 + 80));
  }
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "_drawMarkerWithContext:style:color:innerColor:specialColor:location:radius:", *(void *)(a1 + 80), objc_msgSend(v20, "pointStyle"), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), v8, v12, *(double *)(a1 + 88));
  if ([*(id *)(a1 + 32) drawSampleSpans]) {
    objc_msgSend(*(id *)(a1 + 32), "_drawMarkerWithContext:style:color:innerColor:specialColor:location:radius:", *(void *)(a1 + 80), objc_msgSend(v20, "pointStyle"), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), v10, v12, *(double *)(a1 + 88));
  }
}

- (void)_drawMarkerWithContext:(CGContext *)a3 style:(int64_t)a4 color:(CGColor *)a5 innerColor:(CGColor *)a6 specialColor:(CGColor *)a7 location:(CGPoint)a8 radius:(double)a9
{
  if (a4 == 2)
  {
    double v9 = a7;
LABEL_5:
    +[HKGraphSeries drawFilledMarkerInContext:a3 color:v9 x:a8.x y:a8.y radius:a9];
    return;
  }
  if (a4 != 1)
  {
    if (a4) {
      return;
    }
    double v9 = a5;
    goto LABEL_5;
  }
  +[HKGraphSeries drawInnerDotMarkerInContext:a3 outColor:a5 inColor:a6 x:a8.x y:a8.y radius:a9];
}

- (void)_drawCategoryLabels:(CGContext *)a3 axisRect:(CGRect)a4 seriesRenderingDelegate:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v44[2] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  if ([(HKLevelCategoryTimePeriodSeries *)self _interiorCategoryLabels])
  {
    v43[0] = *MEMORY[0x1E4FB06F8];
    CGFloat v12 = [(HKLevelCategoryTimePeriodSeries *)self categoryLevelFont];
    v44[0] = v12;
    v43[1] = *MEMORY[0x1E4FB0700];
    double v13 = [(HKLevelCategoryTimePeriodSeries *)self categoryLevelColor];
    v44[1] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];

    id v36 = v11;
    [v11 virtualMarginInsets];
    double v16 = v15;
    id v17 = [(HKLevelCategoryTimePeriodSeries *)self categoryLevelColor];
    CGFloat v18 = (CGColor *)[v17 CGColor];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = [(HKHorizontalTimePeriodSeries *)self enumerationValueOrdering];
    uint64_t v19 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = 0;
      uint64_t v22 = *(void *)v39;
      double v23 = v16 + 6.0;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v39 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * v24);
          -[HKHorizontalTimePeriodSeries enumerationRectForLevel:axisRect:](self, "enumerationRectForLevel:axisRect:", v21 + v24, x, y, width, height);
          double v27 = v26;
          double v29 = v28;
          long long v30 = [(HKHorizontalTimePeriodSeries *)self valueLabels];
          uint64_t v31 = [v30 objectForKeyedSubscript:v25];

          [v31 sizeWithAttributes:v14];
          objc_msgSend(v31, "drawInRect:withAttributes:", v14, v23, v27 + 3.0, v32, v33);
          CGFloat v34 = v27 + v29 + 0.0;
          CGContextSetStrokeColorWithColor(a3, v18);
          double v35 = HKUIOnePixel();
          CGContextSetLineWidth(a3, v35);
          CGContextMoveToPoint(a3, x, v34);
          CGContextAddLineToPoint(a3, x + width, v34);
          CGContextStrokePath(a3);

          ++v24;
        }
        while (v20 != v24);
        uint64_t v20 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        v21 += v24;
      }
      while (v20);
    }

    id v11 = v36;
  }
}

- (double)_coordinateForNow:(id)a3 pointTransform:(CGAffineTransform *)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = a3;
  double v7 = [v5 now];
  double v8 = [v6 seriesDrawingXAxis];

  double v9 = [v8 transform];
  [v9 coordinateForValue:v7];
  double v11 = a4->tx + a4->c * 0.0 + a4->a * v10;

  return v11;
}

- (double)offsetForEnumerationRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([(HKLevelCategoryTimePeriodSeries *)self _interiorCategoryLabels]) {
    return y + (height + height) / 3.0;
  }
  v9.receiver = self;
  v9.super_class = (Class)HKLevelCategoryTimePeriodSeries;
  -[HKHorizontalTimePeriodSeries offsetForEnumerationRect:](&v9, sel_offsetForEnumerationRect_, x, y, width, height);
  return result;
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  id v6 = [(HKHorizontalTimePeriodSeries *)self enumerationValueOrdering];
  uint64_t v7 = [v6 count];

  double v8 = [NSNumber numberWithInteger:v7];
  objc_super v9 = +[HKValueRange valueRangeWithMinValue:&unk_1F3C20440 maxValue:v8];

  return v9;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (double)markerRadiusStorage
{
  return self->_markerRadiusStorage;
}

- (void)setMarkerRadiusStorage:(double)a3
{
  self->_double markerRadiusStorage = a3;
}

- (UIColor)innerMarkColorStorage
{
  return self->_innerMarkColorStorage;
}

- (void)setInnerMarkColorStorage:(id)a3
{
}

- (UIFont)categoryLevelFontStorage
{
  return self->_categoryLevelFontStorage;
}

- (void)setCategoryLevelFontStorage:(id)a3
{
}

- (UIColor)categoryLevelColorStorage
{
  return self->_categoryLevelColorStorage;
}

- (void)setCategoryLevelColorStorage:(id)a3
{
}

- (UIColor)specialMarkColorStorage
{
  return self->_specialMarkColorStorage;
}

- (void)setSpecialMarkColorStorage:(id)a3
{
}

- (NSString)specialMarkLegendLabelStorage
{
  return self->_specialMarkLegendLabelStorage;
}

- (void)setSpecialMarkLegendLabelStorage:(id)a3
{
}

- (BOOL)drawSampleSpansStorage
{
  return self->_drawSampleSpansStorage;
}

- (void)setDrawSampleSpansStorage:(BOOL)a3
{
  self->_drawSampleSpansStorage = a3;
}

- (BOOL)roundDaySamplesStorage
{
  return self->_roundDaySamplesStorage;
}

- (void)setRoundDaySamplesStorage:(BOOL)a3
{
  self->_roundDaySamplesStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specialMarkLegendLabelStorage, 0);
  objc_storeStrong((id *)&self->_specialMarkColorStorage, 0);
  objc_storeStrong((id *)&self->_categoryLevelColorStorage, 0);
  objc_storeStrong((id *)&self->_categoryLevelFontStorage, 0);
  objc_storeStrong((id *)&self->_innerMarkColorStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end