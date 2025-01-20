@interface HKMinMaxSeries
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (HKMinMaxSeries)init;
- (HKStrokeStyle)selectedStrokeStyle;
- (HKStrokeStyle)selectedStrokeStyleStorage;
- (HKStrokeStyle)unselectedStrokeStyle;
- (HKStrokeStyle)unselectedStrokeStyleStorage;
- (NSLock)seriesMutableStateLock;
- (UIImage)selectedPointMarkerImage;
- (UIImage)selectedPointMarkerImageStorage;
- (UIImage)unselectedPointMarkerImage;
- (UIImage)unselectedPointMarkerImageStorage;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)_drawPointMarkersWithBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 context:(CGContext *)a5;
- (void)_drawStrokeWithBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 context:(CGContext *)a5 axisRect:(CGRect)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)setSelectedPointMarkerImage:(id)a3;
- (void)setSelectedPointMarkerImageStorage:(id)a3;
- (void)setSelectedStrokeStyle:(id)a3;
- (void)setSelectedStrokeStyleStorage:(id)a3;
- (void)setUnselectedPointMarkerImage:(id)a3;
- (void)setUnselectedPointMarkerImageStorage:(id)a3;
- (void)setUnselectedStrokeStyle:(id)a3;
- (void)setUnselectedStrokeStyleStorage:(id)a3;
@end

@implementation HKMinMaxSeries

- (HKMinMaxSeries)init
{
  v10.receiver = self;
  v10.super_class = (Class)HKMinMaxSeries;
  v2 = [(HKGraphSeries *)&v10 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    [(NSLock *)v2->_seriesMutableStateLock setName:@"HKMinMaxSeriesLock"];
    unselectedStrokeStyleStorage = v2->_unselectedStrokeStyleStorage;
    v2->_unselectedStrokeStyleStorage = 0;

    selectedStrokeStyleStorage = v2->_selectedStrokeStyleStorage;
    v2->_selectedStrokeStyleStorage = 0;

    unselectedPointMarkerImageStorage = v2->_unselectedPointMarkerImageStorage;
    v2->_unselectedPointMarkerImageStorage = 0;

    selectedPointMarkerImageStorage = v2->_selectedPointMarkerImageStorage;
    v2->_selectedPointMarkerImageStorage = 0;
  }
  return v2;
}

- (HKStrokeStyle)unselectedStrokeStyle
{
  v3 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_unselectedStrokeStyleStorage;
  v5 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setUnselectedStrokeStyle:(id)a3
{
  v4 = (HKStrokeStyle *)a3;
  v5 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v5 lock];

  unselectedStrokeStyleStorage = self->_unselectedStrokeStyleStorage;
  self->_unselectedStrokeStyleStorage = v4;

  id v7 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (HKStrokeStyle)selectedStrokeStyle
{
  v3 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_selectedStrokeStyleStorage;
  v5 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSelectedStrokeStyle:(id)a3
{
  v4 = (HKStrokeStyle *)a3;
  v5 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v5 lock];

  selectedStrokeStyleStorage = self->_selectedStrokeStyleStorage;
  self->_selectedStrokeStyleStorage = v4;

  id v7 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (UIImage)unselectedPointMarkerImage
{
  v3 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_unselectedPointMarkerImageStorage;
  v5 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setUnselectedPointMarkerImage:(id)a3
{
  v4 = (UIImage *)a3;
  v5 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v5 lock];

  unselectedPointMarkerImageStorage = self->_unselectedPointMarkerImageStorage;
  self->_unselectedPointMarkerImageStorage = v4;

  id v7 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (UIImage)selectedPointMarkerImage
{
  v3 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v3 lock];

  v4 = self->_selectedPointMarkerImageStorage;
  v5 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v5 unlock];

  return v4;
}

- (void)setSelectedPointMarkerImage:(id)a3
{
  v4 = (UIImage *)a3;
  v5 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v5 lock];

  selectedPointMarkerImageStorage = self->_selectedPointMarkerImageStorage;
  self->_selectedPointMarkerImageStorage = v4;

  id v7 = [(HKMinMaxSeries *)self seriesMutableStateLock];
  [v7 unlock];
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v16 = a3;
  v17 = [(HKMinMaxSeries *)self unselectedStrokeStyle];
  if (v17)
  {
  }
  else
  {
    v18 = [(HKMinMaxSeries *)self selectedStrokeStyle];

    if (!v18) {
      goto LABEL_5;
    }
  }
  long long v19 = *(_OWORD *)&a6->c;
  long long v23 = *(_OWORD *)&a6->a;
  long long v24 = v19;
  long long v25 = *(_OWORD *)&a6->tx;
  -[HKMinMaxSeries _drawStrokeWithBlockCoordinates:pointTransform:context:axisRect:](self, "_drawStrokeWithBlockCoordinates:pointTransform:context:axisRect:", v16, &v23, a7, x, y, width, height);
LABEL_5:
  v20 = [(HKMinMaxSeries *)self unselectedPointMarkerImage];
  if (v20)
  {

LABEL_8:
    long long v22 = *(_OWORD *)&a6->c;
    long long v23 = *(_OWORD *)&a6->a;
    long long v24 = v22;
    long long v25 = *(_OWORD *)&a6->tx;
    [(HKMinMaxSeries *)self _drawPointMarkersWithBlockCoordinates:v16 pointTransform:&v23 context:a7];
    goto LABEL_9;
  }
  v21 = [(HKMinMaxSeries *)self selectedPointMarkerImage];

  if (v21) {
    goto LABEL_8;
  }
LABEL_9:
}

- (void)_drawStrokeWithBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 context:(CGContext *)a5 axisRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v13 = a3;
  CGContextSaveGState(a5);
  v14 = [(HKMinMaxSeries *)self unselectedStrokeStyle];
  [v14 lineWidth];
  double v16 = v15;

  v17 = [(HKMinMaxSeries *)self selectedStrokeStyle];
  [v17 lineWidth];
  double v19 = v18;

  if (v19 < v16) {
    double v19 = v16;
  }
  v46.origin.CGFloat x = x;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v46);
  v47.origin.CGFloat x = x;
  v47.origin.CGFloat y = y;
  v47.size.CGFloat width = width;
  v47.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v47);
  long long v22 = objc_opt_new();
  long long v23 = objc_opt_new();
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __82__HKMinMaxSeries__drawStrokeWithBlockCoordinates_pointTransform_context_axisRect___block_invoke;
  v32[3] = &unk_1E6D57D48;
  CGFloat v35 = MinX;
  double v36 = v19;
  CGFloat v37 = MaxX;
  id v24 = v22;
  id v33 = v24;
  long long v38 = v42;
  long long v39 = v43;
  long long v40 = v44;
  long long v41 = v45;
  id v25 = v23;
  id v34 = v25;
  long long v26 = *(_OWORD *)&a4->c;
  v31[0] = *(_OWORD *)&a4->a;
  v31[1] = v26;
  v31[2] = *(_OWORD *)&a4->tx;
  [v13 enumerateCoordinatesWithTransform:v31 roundToViewScale:1 block:v32];

  v27 = [(HKMinMaxSeries *)self unselectedStrokeStyle];

  if (v27)
  {
    v28 = [(HKMinMaxSeries *)self unselectedStrokeStyle];
    [v28 applyToContext:a5];

    CGContextAddPath(a5, (CGPathRef)[v24 CGPath]);
    CGContextStrokePath(a5);
  }
  v29 = [(HKMinMaxSeries *)self selectedStrokeStyle];

  if (v29)
  {
    v30 = [(HKMinMaxSeries *)self selectedStrokeStyle];
    [v30 applyToContext:a5];

    CGContextAddPath(a5, (CGPathRef)[v25 CGPath]);
    CGContextStrokePath(a5);
  }
  CGContextRestoreGState(a5);
}

void __82__HKMinMaxSeries__drawStrokeWithBlockCoordinates_pointTransform_context_axisRect___block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5 = a2;
  [v5 min];
  double v7 = v6;
  double v9 = v8;
  [v5 max];
  double v11 = v10;
  double v13 = v12;

  double v14 = *(double *)(a1 + 56);
  if (*(double *)(a1 + 48) - v7 <= v14 && v7 - *(double *)(a1 + 64) <= v14)
  {
    id v15 = *(id *)(a1 + 32);
    long long v16 = a3[1];
    v21[0] = *a3;
    v21[1] = v16;
    long long v17 = *(_OWORD *)(a1 + 88);
    v20[0] = *(_OWORD *)(a1 + 72);
    v20[1] = v17;
    long long v18 = *(_OWORD *)(a1 + 120);
    v20[2] = *(_OWORD *)(a1 + 104);
    v20[3] = v18;
    if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v21, (uint64_t *)v20))
    {
      id v19 = *(id *)(a1 + 40);

      id v15 = v19;
    }
    objc_msgSend(v15, "moveToPoint:", v11, v13);
    objc_msgSend(v15, "addLineToPoint:", v7, v9);
  }
}

- (void)_drawPointMarkersWithBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 context:(CGContext *)a5
{
  id v8 = a3;
  CGContextSaveGState(a5);
  double v9 = [(HKMinMaxSeries *)self unselectedPointMarkerImage];
  double v10 = HKChartSeriesPointMarkerBaseRect(v9);
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;

  id v17 = [(HKMinMaxSeries *)self unselectedPointMarkerImage];
  uint64_t v18 = [v17 CGImage];

  id v19 = [(HKMinMaxSeries *)self selectedPointMarkerImage];
  double v20 = HKChartSeriesPointMarkerBaseRect(v19);
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  uint64_t v26 = v25;

  id v27 = [(HKMinMaxSeries *)self selectedPointMarkerImage];
  uint64_t v28 = [v27 CGImage];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  [(HKGraphSeries *)self selectedPathRange];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __79__HKMinMaxSeries__drawPointMarkersWithBlockCoordinates_pointTransform_context___block_invoke;
  _OWORD v31[3] = &__block_descriptor_184_e94_v64__0__HKMinMaxCoordinate_8____HKGraphSeriesDataBlockPath_qqq_q_16__HKMinMaxCoordinate_48_B56l;
  v31[4] = v18;
  *(double *)&v31[5] = v10;
  v31[6] = v12;
  v31[7] = v14;
  v31[8] = v16;
  long long v32 = v42;
  long long v33 = v43;
  long long v34 = v44;
  long long v35 = v45;
  uint64_t v36 = v28;
  double v37 = v20;
  uint64_t v38 = v22;
  uint64_t v39 = v24;
  uint64_t v40 = v26;
  long long v41 = a5;
  long long v29 = *(_OWORD *)&a4->c;
  v30[0] = *(_OWORD *)&a4->a;
  v30[1] = v29;
  v30[2] = *(_OWORD *)&a4->tx;
  [v8 enumerateCoordinatesWithTransform:v30 roundToViewScale:1 block:v31];

  CGContextRestoreGState(a5);
}

void __79__HKMinMaxSeries__drawPointMarkersWithBlockCoordinates_pointTransform_context___block_invoke(uint64_t a1, void *a2, long long *a3)
{
  v4 = *(CGImage **)(a1 + 32);
  CGFloat v5 = *(double *)(a1 + 40);
  CGFloat v6 = *(double *)(a1 + 48);
  CGFloat v7 = *(double *)(a1 + 56);
  CGFloat v8 = *(double *)(a1 + 64);
  long long v9 = a3[1];
  long long v27 = *a3;
  long long v28 = v9;
  long long v10 = *(_OWORD *)(a1 + 88);
  long long v23 = *(_OWORD *)(a1 + 72);
  long long v24 = v10;
  long long v11 = *(_OWORD *)(a1 + 120);
  long long v25 = *(_OWORD *)(a1 + 104);
  long long v26 = v11;
  id v12 = a2;
  if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)&v27, (uint64_t *)&v23))
  {
    v4 = *(CGImage **)(a1 + 136);
    CGFloat v5 = *(double *)(a1 + 144);
    CGFloat v6 = *(double *)(a1 + 152);
    CGFloat v7 = *(double *)(a1 + 160);
    CGFloat v8 = *(double *)(a1 + 168);
  }
  objc_msgSend(v12, "min", v23, v24, v25, v26, v27, v28);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v12 max];
  CGFloat v18 = v17;
  CGFloat v20 = v19;

  uint64_t v21 = *(CGContext **)(a1 + 176);
  v29.origin.CGFloat x = v5;
  v29.origin.CGFloat y = v6;
  v29.size.CGFloat width = v7;
  v29.size.CGFloat height = v8;
  CGRect v30 = CGRectOffset(v29, v14, v16);
  CGContextDrawImage(v21, v30, v4);
  if (v14 != v18 || v16 != v20)
  {
    uint64_t v22 = *(CGContext **)(a1 + 176);
    v31.origin.CGFloat x = v5;
    v31.origin.CGFloat y = v6;
    v31.size.CGFloat width = v7;
    v31.size.CGFloat height = v8;
    CGRect v32 = CGRectOffset(v31, v18, v20);
    CGContextDrawImage(v22, v32, v4);
  }
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  double v13 = [a3 chartPoints];
  if (!v13)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HKMinMaxSeries.m", 220, @"Invalid parameter not satisfying: %@", @"points != nil" object file lineNumber description];
  }
  CGFloat v14 = [v11 transform];
  double v15 = [v12 transform];

  CGFloat v16 = objc_opt_new();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __60__HKMinMaxSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E6D52280;
  id v26 = v16;
  id v27 = v14;
  id v28 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v16;
  [v13 enumerateObjectsUsingBlock:v25];
  long long v23 = *(_OWORD *)&a4->index;
  int64_t resolution = a4->resolution;
  CGFloat v20 = +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:v19 blockPath:&v23];

  return v20;
}

void __60__HKMinMaxSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(void *a1, void *a2)
{
  id v6 = a2;
  v3 = [v6 yValue];

  if (v3)
  {
    v4 = (void *)a1[4];
    CGFloat v5 = [[HKMinMaxCoordinate alloc] initWithChartPoint:v6 xAxisTransform:a1[5] yAxisTransform:a1[6]];
    [v4 addObject:v5];
  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKMinMaxSeries.m" lineNumber:247 description:@"distanceFromPoint type class failure"];
  }
  objc_msgSend(v9, "distanceToPoint:", x, y);
  double v11 = v10;

  return v11;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"HKMinMaxSeries.m" lineNumber:255 description:@"xAxisDistanceFromPoint type class failure"];
  }
  [v8 startXValue];
  double v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"HKMinMaxSeries.m" lineNumber:263 description:@"yAxisDifferenceToPoint\x13 type class failure"];
  }
  objc_msgSend(v9, "yAxisDifferenceToPoint:", x, y);
  double v11 = v10;

  return v11;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  return objc_msgSend(a4, "isVisibleInChartRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKMinMaxSeries.m" lineNumber:274 description:@"compare type class failure"];
  }
  id v9 = v8;
  [v7 min];
  double v11 = v10;
  [v9 min];
  double v13 = v12;

  return v11 < v13;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"HKMinMaxSeries.m" lineNumber:282 description:@"compare type class failure"];
  }
  id v9 = v8;
  [v7 max];
  double v11 = v10;
  [v9 max];
  double v13 = v12;

  return v11 > v13;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKStrokeStyle)unselectedStrokeStyleStorage
{
  return self->_unselectedStrokeStyleStorage;
}

- (void)setUnselectedStrokeStyleStorage:(id)a3
{
}

- (HKStrokeStyle)selectedStrokeStyleStorage
{
  return self->_selectedStrokeStyleStorage;
}

- (void)setSelectedStrokeStyleStorage:(id)a3
{
}

- (UIImage)unselectedPointMarkerImageStorage
{
  return self->_unselectedPointMarkerImageStorage;
}

- (void)setUnselectedPointMarkerImageStorage:(id)a3
{
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
  objc_storeStrong((id *)&self->_unselectedPointMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_selectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_unselectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end