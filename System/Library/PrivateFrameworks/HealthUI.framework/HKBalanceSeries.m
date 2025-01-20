@interface HKBalanceSeries
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (HKBalanceSeries)init;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
- (void)finishSelection;
- (void)selectPathsinPathRange:(id *)a3 coordinateRange:(id)a4;
@end

@implementation HKBalanceSeries

- (HKBalanceSeries)init
{
  return (HKBalanceSeries *)BalanceSeries.init()();
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  int64_t index = a4->index;
  int64_t zoom = a4->zoom;
  int64_t resolution = a4->resolution;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = self;
  sub_1E0E72614(v12, index, zoom, resolution, v13, v14);
  v17 = v16;

  return v17;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v18 = *(_OWORD *)&a6->c;
  v24[0] = *(_OWORD *)&a6->a;
  v24[1] = v18;
  v24[2] = *(_OWORD *)&a6->tx;
  id v19 = a3;
  id v20 = a5;
  v21 = a7;
  id v22 = a8;
  swift_unknownObjectRetain();
  v23 = self;
  sub_1E0E7787C(v19, v20, (uint64_t *)v24, v21, a9, x, y, width, height);

  swift_unknownObjectRelease();
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v12 = sub_1E0E77B18(a3);

  return v12;
}

- (void)selectPathsinPathRange:(id *)a3 coordinateRange:(id)a4
{
  int64_t index = a3->var0.var0.index;
  int64_t zoom = a3->var0.var0.zoom;
  int64_t resolution = a3->var0.var0.resolution;
  int64_t var1 = a3->var0.var1;
  int64_t v11 = a3->var1.var0.index;
  int64_t v10 = a3->var1.var0.zoom;
  int64_t v12 = a3->var1.var0.resolution;
  int64_t v13 = a3->var1.var1;
  int64_t v31 = a3->var0.var0.index;
  int64_t v32 = zoom;
  int64_t v33 = resolution;
  int64_t v34 = var1;
  int64_t v35 = v11;
  int64_t v36 = v10;
  int64_t v37 = v12;
  int64_t v38 = v13;
  if (a4)
  {
    uint64_t v25 = (uint64_t)&v25;
    MEMORY[0x1F4188790](self, a2);
    int64_t v28 = index;
    int64_t v26 = v10;
    int64_t v14 = v11;
    int64_t v15 = var1;
    int64_t v16 = zoom;
    uint64_t v18 = (uint64_t)&v17[4];
    int64_t v27 = resolution;
    id v19 = v17 + 21;
    id v20 = self;
    id v21 = a4;
    os_unfair_lock_lock(v19);
    sub_1E0E77E0C(v18);
    int64_t zoom = v16;
    int64_t var1 = v15;
    int64_t v11 = v14;
    int64_t v10 = v26;
    id v22 = v19;
    int64_t resolution = v27;
    int64_t index = v28;
    os_unfair_lock_unlock(v22);
  }
  else
  {
    v23 = self;
  }
  v24 = (objc_class *)type metadata accessor for BalanceSeries();
  v30.receiver = self;
  v30.super_class = v24;
  v29[0] = index;
  v29[1] = zoom;
  v29[2] = resolution;
  v29[3] = var1;
  v29[4] = v11;
  v29[5] = v10;
  v29[6] = v12;
  v29[7] = v13;
  [(HKGraphSeries *)&v30 selectPathsinPathRange:v29 coordinateRange:a4];
}

- (void)finishSelection
{
  v2 = *(os_unfair_lock_s **)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceSeries_lollipopPathRangeLock);
  uint64_t v3 = (uint64_t)&v2[4];
  v4 = v2 + 21;
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1E0E74844(v3);
  os_unfair_lock_unlock(v4);
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  type metadata accessor for BalanceCoordinate();
  uint64_t v9 = swift_dynamicCastClass();
  if (v9)
  {
    int64_t v10 = (void *)v9;
    swift_unknownObjectRetain();
    int64_t v11 = self;
    objc_msgSend(v10, sel_startXValue);
    double v13 = v12;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    if (CGRectGetMinX(v18) <= v13)
    {
      objc_msgSend(v10, sel_endXValue);
      double v15 = v14;
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      double MaxX = CGRectGetMaxX(v19);
      swift_unknownObjectRelease();

      LOBYTE(v9) = v15 <= MaxX;
    }
    else
    {
      swift_unknownObjectRelease();

      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_1E0E77C44();
  double v8 = v7;
  swift_unknownObjectRelease();

  return v8;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  type metadata accessor for BalanceCoordinate();
  uint64_t v6 = swift_dynamicCastClass();
  if (v6) {
    return vabdd_f64(*(double *)(v6 + OBJC_IVAR____TtC8HealthUI17BalanceCoordinate_xValue), x);
  }
  else {
    return 1.79769313e308;
  }
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  type metadata accessor for BalanceCoordinate();
  uint64_t v6 = swift_dynamicCastClass();
  if (!v6) {
    return 1.79769313e308;
  }
  double v7 = (double *)(v6 + OBJC_IVAR____TtC8HealthUI17BalanceCoordinate_yValueRange);
  if (*(unsigned char *)(v6 + OBJC_IVAR____TtC8HealthUI17BalanceCoordinate_yValueRange + 16)) {
    return 1.79769313e308;
  }
  double result = 0.0;
  if (*v7 > y || y > v7[1])
  {
    if (y >= *v7) {
      double v10 = v7[1];
    }
    else {
      double v10 = *v7;
    }
    double v11 = vabdd_f64(v10, y);
    double result = 1.79769313e308;
    if (v11 <= 1.79769313e308) {
      return v11;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  sub_1E0E5D794((uint64_t)self + OBJC_IVAR___HKBalanceSeries_selectedMetric);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___backgroundInactiveFillStyle));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___metricsLineStrokeStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___primaryInRangeFillStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___primaryOutOfRangeFillStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___secondaryInRangeFillStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___secondaryOutOfRangeFillStyle));

  uint64_t v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceSeries____lazy_storage___warmupInnerFillStyle);
}

@end