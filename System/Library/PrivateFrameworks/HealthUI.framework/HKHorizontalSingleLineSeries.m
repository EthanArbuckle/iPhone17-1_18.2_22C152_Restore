@interface HKHorizontalSingleLineSeries
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)shouldConnectPoints;
- (BOOL)shouldConnectPointsStorage;
- (BOOL)supportsMultiTouchSelection;
- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9;
- (HKHorizontalSingleLineSeries)init;
- (NSLock)seriesMutableStateLock;
- (UIColor)baseColor;
- (UIColor)baseColorStorage;
- (UIImage)selectedPointMarkerImage;
- (UIImage)selectedPointMarkerImageStorage;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)lineWidth;
- (double)lineWidthStorage;
- (double)markRadius;
- (double)markRadiusStorage;
- (double)selectedLineWidth;
- (double)selectedLineWidthStorage;
- (double)topInsetPercentage;
- (double)topInsetPercentageStorage;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yCoordinateForLevel:(int64_t)a3 chartRect:(CGRect)a4;
- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setBaseColor:(id)a3;
- (void)setBaseColorStorage:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setLineWidthStorage:(double)a3;
- (void)setMarkRadius:(double)a3;
- (void)setMarkRadiusStorage:(double)a3;
- (void)setSelectedLineWidth:(double)a3;
- (void)setSelectedLineWidthStorage:(double)a3;
- (void)setSelectedPointMarkerImage:(id)a3;
- (void)setSelectedPointMarkerImageStorage:(id)a3;
- (void)setShouldConnectPoints:(BOOL)a3;
- (void)setShouldConnectPointsStorage:(BOOL)a3;
- (void)setTopInsetPercentage:(double)a3;
- (void)setTopInsetPercentageStorage:(double)a3;
@end

@implementation HKHorizontalSingleLineSeries

- (HKHorizontalSingleLineSeries)init
{
  v9.receiver = self;
  v9.super_class = (Class)HKHorizontalSingleLineSeries;
  v2 = [(HKGraphSeries *)&v9 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKHorizontalSingleLineSeriesLock"];
    v2->_topInsetPercentageStorage = 0.5;
    v2->_shouldConnectPointsStorage = 0;
    uint64_t v5 = [MEMORY[0x1E4FB1618] blackColor];
    baseColorStorage = v2->_baseColorStorage;
    v2->_baseColorStorage = (UIColor *)v5;

    v2->_lineWidthStorage = 3.0;
    v2->_selectedLineWidthStorage = 7.0;
    v2->_markRadiusStorage = 3.5;
    selectedPointMarkerImageStorage = v2->_selectedPointMarkerImageStorage;
    v2->_selectedPointMarkerImageStorage = 0;
  }
  return v2;
}

- (double)topInsetPercentage
{
  v3 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  double topInsetPercentageStorage = self->_topInsetPercentageStorage;
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return topInsetPercentageStorage;
}

- (void)setTopInsetPercentage:(double)a3
{
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double topInsetPercentageStorage = a3;
  id v6 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (BOOL)shouldConnectPoints
{
  v3 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  LOBYTE(v3) = self->_shouldConnectPointsStorage;
  v4 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v4 unlock];

  return (char)v3;
}

- (void)setShouldConnectPoints:(BOOL)a3
{
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_shouldConnectPointsStorage = a3;
  id v6 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (UIColor)baseColor
{
  v3 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_baseColorStorage;
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setBaseColor:(id)a3
{
  v4 = (UIColor *)a3;
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  baseColorStorage = self->_baseColorStorage;
  self->_baseColorStorage = v4;

  id v7 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (double)lineWidth
{
  v3 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  double lineWidthStorage = self->_lineWidthStorage;
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return lineWidthStorage;
}

- (void)setLineWidth:(double)a3
{
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double lineWidthStorage = a3;
  id v6 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (double)selectedLineWidth
{
  v3 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  double selectedLineWidthStorage = self->_selectedLineWidthStorage;
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return selectedLineWidthStorage;
}

- (void)setSelectedLineWidth:(double)a3
{
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double selectedLineWidthStorage = a3;
  id v6 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (double)markRadius
{
  v3 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  double markRadiusStorage = self->_markRadiusStorage;
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return markRadiusStorage;
}

- (void)setMarkRadius:(double)a3
{
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  self->_double markRadiusStorage = a3;
  id v6 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v6 unlock];
}

- (UIImage)selectedPointMarkerImage
{
  v3 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_selectedPointMarkerImageStorage;
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSelectedPointMarkerImage:(id)a3
{
  v4 = (UIImage *)a3;
  uint64_t v5 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v5 lock];

  selectedPointMarkerImageStorage = self->_selectedPointMarkerImageStorage;
  self->_selectedPointMarkerImageStorage = v4;

  id v7 = [(HKHorizontalSingleLineSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v59 = a5;
  id v60 = a8;
  id v61 = a9;
  -[HKHorizontalSingleLineSeries yCoordinateForLevel:chartRect:](self, "yCoordinateForLevel:chartRect:", 0, x, y, width, height);
  CGFloat v21 = v20;
  int v22 = [(HKGraphSeries *)self isHighlighted];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  if ([v19 numCoordinates] >= 1)
  {
    CGContextSaveGState(a7);
    v23 = [(HKHorizontalSingleLineSeries *)self baseColor];
    v24 = [v23 colorWithAlphaComponent:0.55];
    v25 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartBackgroundColor");
    id v58 = v23;
    v26 = (CGColor *)[v58 CGColor];
    id v57 = v24;
    v27 = (CGColor *)[v57 CGColor];
    id v56 = v25;
    uint64_t v28 = [v56 CGColor];
    [(HKHorizontalSingleLineSeries *)self markRadius];
    double v30 = v29;
    [(HKHorizontalSingleLineSeries *)self lineWidth];
    CGFloat v32 = v31;
    [(HKHorizontalSingleLineSeries *)self selectedLineWidth];
    CGFloat v34 = v33;
    LOBYTE(v23) = [(HKHorizontalSingleLineSeries *)self shouldConnectPoints];
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x3032000000;
    v95 = __Block_byref_object_copy__3;
    v96 = __Block_byref_object_dispose__3;
    id v97 = [MEMORY[0x1E4F1CA48] array];
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x2020000000;
    char v91 = 1;
    uint64_t v86 = 0;
    v87 = (CGFloat *)&v86;
    uint64_t v88 = 0x2020000000;
    unint64_t v89 = 0xFFEFFFFFFFFFFFFFLL;
    uint64_t v82 = 0;
    v83 = (CGFloat *)&v82;
    uint64_t v84 = 0x2020000000;
    unint64_t v85 = 0xFFEFFFFFFFFFFFFFLL;
    uint64_t v78 = 0;
    v79 = &v78;
    uint64_t v80 = 0x2020000000;
    char v81 = 0;
    uint64_t v74 = 0;
    v75 = (CGFloat *)&v74;
    uint64_t v76 = 0x2020000000;
    unint64_t v77 = 0xFFEFFFFFFFFFFFFFLL;
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __171__HKHorizontalSingleLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke;
    v67[3] = &unk_1E6D52018;
    char v72 = (char)v23;
    v67[4] = &v82;
    v67[5] = v90;
    char v73 = v22;
    v67[10] = a7;
    v67[11] = v26;
    *(CGFloat *)&v67[12] = v32;
    v67[13] = v27;
    *(CGFloat *)&v67[14] = v34;
    v67[15] = v28;
    *(double *)&v67[16] = v30;
    *(CGFloat *)&v67[17] = v21;
    v67[6] = &v86;
    v67[7] = &v92;
    long long v70 = v100;
    long long v71 = v101;
    long long v68 = v98;
    long long v69 = v99;
    v67[8] = &v78;
    v67[9] = &v74;
    long long v35 = *(_OWORD *)&a6->c;
    v66[0] = *(_OWORD *)&a6->a;
    v66[1] = v35;
    v66[2] = *(_OWORD *)&a6->tx;
    [v19 enumerateCoordinatesWithTransform:v66 roundToViewScale:1 block:v67];
    _drawSeriesGroup(a7, v22, v26, v27, (uint64_t)v26, v32, v34, v30, v87[3], v83[3], v21);
    id v55 = v19;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v36 = (id)v93[5];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v62 objects:v102 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v63 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          [v40 xCoord];
          double v42 = v41;
          uint64_t v43 = [v40 markStyle];
          if (v43 == 1)
          {
            +[HKGraphSeries drawInnerDotMarkerInContext:a7 outColor:v26 inColor:v28 x:v42 y:v21 radius:v30];
          }
          else if (v43 == 2)
          {
            +[HKGraphSeries drawFilledMarkerInContext:a7 color:v26 x:v42 y:v21 radius:v30];
          }
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v62 objects:v102 count:16];
      }
      while (v37);
    }

    id v19 = v55;
    if (*((unsigned char *)v79 + 24))
    {
      v44 = [(HKHorizontalSingleLineSeries *)self selectedPointMarkerImage];
      if (v44)
      {
        v45 = [(HKHorizontalSingleLineSeries *)self selectedPointMarkerImage];
        double v46 = HKChartSeriesPointMarkerBaseRect(v45);
        CGFloat v48 = v47;
        CGFloat v50 = v49;
        CGFloat v52 = v51;

        id v53 = [(HKHorizontalSingleLineSeries *)self selectedPointMarkerImage];
        v54 = (CGImage *)[v53 CGImage];

        v104.origin.double x = v46;
        v104.origin.double y = v48;
        v104.size.double width = v50;
        v104.size.double height = v52;
        CGRect v105 = CGRectOffset(v104, v75[3], v21);
        CGContextDrawImage(a7, v105, v54);
      }
    }
    CGContextRestoreGState(a7);
    _Block_object_dispose(&v74, 8);
    _Block_object_dispose(&v78, 8);
    _Block_object_dispose(&v82, 8);
    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(v90, 8);
    _Block_object_dispose(&v92, 8);
  }
}

void __171__HKHorizontalSingleLineSeries_drawSeriesWithBlockCoordinates_axisRect_zoomLevelConfiguration_pointTransform_renderContext_secondaryRenderContext_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5 = a2;
  char v6 = [v5 groupToPrevious];
  [v5 xValue];
  double v8 = v7;
  uint64_t v9 = [v5 markStyle];

  if (*(unsigned char *)(a1 + 208))
  {
    if ((v6 & 1) == 0)
    {
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
        _drawSeriesGroup(*(CGContext **)(a1 + 80), *(unsigned __int8 *)(a1 + 209), *(CGColor **)(a1 + 88), *(CGColor **)(a1 + 104), *(void *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 112), *(double *)(a1 + 128), *(CGFloat *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(CGFloat *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(CGFloat *)(a1 + 136));
      }
      *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
    }
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
    if (*(unsigned char *)(a1 + 209))
    {
      v10 = [[_HKHorizontalSingleLineSeriesMarkEntry alloc] initWithXCoord:2 markStyle:v8];
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v10];
    }
  }
  else
  {
    _drawSeriesGroup(*(CGContext **)(a1 + 80), *(unsigned __int8 *)(a1 + 209), *(CGColor **)(a1 + 88), *(CGColor **)(a1 + 104), *(void *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 112), *(double *)(a1 + 128), v8, v8, *(CGFloat *)(a1 + 136));
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v8;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(a1 + 209))
  {
    long long v11 = a3[1];
    v16[0] = *a3;
    v16[1] = v11;
    long long v12 = *(_OWORD *)(a1 + 160);
    v15[0] = *(_OWORD *)(a1 + 144);
    v15[1] = v12;
    long long v13 = *(_OWORD *)(a1 + 192);
    v15[2] = *(_OWORD *)(a1 + 176);
    v15[3] = v13;
    if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v16, (uint64_t *)v15))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v8;
    }
  }
  if (v9)
  {
    v14 = [[_HKHorizontalSingleLineSeriesMarkEntry alloc] initWithXCoord:v9 markStyle:v8];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v14];
  }
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  v10 = [a3 chartPoints];
  if (!v10)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"HKHorizontalSingleLineSeries.m", 351, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  double v30 = v9;
  long long v11 = [v9 transform];
  double v31 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v10;
  uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        v17 = [v16 xValue];
        [v11 coordinateForValue:v17];
        double v19 = v18;
        double v20 = [v16 yValue];
        uint64_t v21 = [v20 integerValue];
        LODWORD(v22) = [v16 groupToPrevious];
        uint64_t v23 = [v16 markStyle];
        v24 = [v16 userInfo];
        if (v23 != 3)
        {
          if (v23 == 1) {
            uint64_t v22 = 0;
          }
          else {
            uint64_t v22 = v22;
          }
          v25 = [[_HKHorizontalSingleLineSeriesCoordinate alloc] initWithXValue:v21 yValue:v22 groupToPrevious:v23 markStyle:v24 userInfo:v19];
          [v31 addObject:v25];
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v13);
  }

  long long v33 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  v26 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v31 blockPath:&v33];

  return v26;
}

- (double)yCoordinateForLevel:(int64_t)a3 chartRect:(CGRect)a4
{
  double height = a4.size.height;
  [(HKHorizontalSingleLineSeries *)self topInsetPercentage];
  double v6 = height * v5;
  return HKUIFloorToScreenScale(v6);
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a3.y;
  double v10 = a3.x;
  id v13 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"HKHorizontalSingleLineSeries.m" lineNumber:405 description:@"distanceFromPoint type class failure"];
  }
  id v14 = v13;
  [v14 xValue];
  double v16 = v15;
  uint64_t v17 = [v14 yValue];

  -[HKHorizontalSingleLineSeries yCoordinateForLevel:chartRect:](self, "yCoordinateForLevel:chartRect:", v17, x, y, width, height);
  double v19 = sqrt((v18 - v9) * (v18 - v9) + (v16 - v10) * (v16 - v10));

  return v19;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKHorizontalSingleLineSeries.m" lineNumber:422 description:@"xAxisDistanceFromPoint type class failure"];
  }
  [v8 xValue];
  double v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a3.y;
  id v12 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"HKHorizontalSingleLineSeries.m" lineNumber:430 description:@"yAxisDistanceFromPoint type class failure"];
  }
  -[HKHorizontalSingleLineSeries yCoordinateForLevel:chartRect:](self, "yCoordinateForLevel:chartRect:", [v12 yValue], x, y, width, height);
  double v14 = v13 - v9;

  return v14;
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKHorizontalSingleLineSeries.m" lineNumber:439 description:@"comparison type class failure"];
  }
  id v9 = v8;
  uint64_t v10 = [v7 yValue];
  uint64_t v11 = [v9 yValue];

  return v10 < v11;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKHorizontalSingleLineSeries.m" lineNumber:447 description:@"comparison type class failure"];
  }
  id v9 = v8;
  uint64_t v10 = [v7 yValue];
  uint64_t v11 = [v9 yValue];

  return v10 > v11;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a8, *(void *)&a9.x, *(void *)&a9.y, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5, a6.x, a6.y, a7);
  [v11 handleFailureInMethod:a2 object:self file:@"HKHorizontalSingleLineSeries.m" lineNumber:473 description:@"Not implemented"];

  double v12 = 0.0;
  double v13 = 0.0;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (double)topInsetPercentageStorage
{
  return self->_topInsetPercentageStorage;
}

- (void)setTopInsetPercentageStorage:(double)a3
{
  self->_double topInsetPercentageStorage = a3;
}

- (BOOL)shouldConnectPointsStorage
{
  return self->_shouldConnectPointsStorage;
}

- (void)setShouldConnectPointsStorage:(BOOL)a3
{
  self->_shouldConnectPointsStorage = a3;
}

- (UIColor)baseColorStorage
{
  return self->_baseColorStorage;
}

- (void)setBaseColorStorage:(id)a3
{
}

- (double)lineWidthStorage
{
  return self->_lineWidthStorage;
}

- (void)setLineWidthStorage:(double)a3
{
  self->_double lineWidthStorage = a3;
}

- (double)selectedLineWidthStorage
{
  return self->_selectedLineWidthStorage;
}

- (void)setSelectedLineWidthStorage:(double)a3
{
  self->_double selectedLineWidthStorage = a3;
}

- (double)markRadiusStorage
{
  return self->_markRadiusStorage;
}

- (void)setMarkRadiusStorage:(double)a3
{
  self->_double markRadiusStorage = a3;
}

- (UIImage)selectedPointMarkerImageStorage
{
  return self->_selectedPointMarkerImageStorage;
}

- (void)setSelectedPointMarkerImageStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPointMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_baseColorStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end