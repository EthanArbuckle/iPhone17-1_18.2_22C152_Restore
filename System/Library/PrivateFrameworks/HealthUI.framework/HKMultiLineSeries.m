@interface HKMultiLineSeries
- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4;
- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (_TtC8HealthUI17HKMultiLineSeries)init;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
@end

@implementation HKMultiLineSeries

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat b = a6->b;
  CGFloat c = a6->c;
  CGFloat d = a6->d;
  CGFloat tx = a6->tx;
  CGFloat ty = a6->ty;
  *(CGFloat *)&long long v35 = a6->a;
  uint64_t v14 = v35;
  *((CGFloat *)&v35 + 1) = b;
  CGFloat v36 = c;
  CGFloat v37 = d;
  CGFloat v38 = tx;
  CGFloat v39 = ty;
  id v20 = a3;
  id v21 = a5;
  v22 = a7;
  id v23 = a8;
  swift_unknownObjectRetain();
  v24 = self;
  sub_1E0EA8408(v22, v20, &v35, a9);
  CGContextSaveGState(v22);
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = v24;
  *(void *)(v25 + 24) = v22;
  v33 = sub_1E0EAA9B8;
  CGFloat v34 = *(double *)&v25;
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 1107296256;
  v31 = sub_1E0E3D108;
  CGFloat v32 = COERCE_DOUBLE(&block_descriptor_16);
  v26 = _Block_copy(&v29);
  v27 = v22;
  v28 = v24;
  swift_release();
  uint64_t v29 = v14;
  uint64_t v30 = *(void *)&b;
  v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))&c;
  CGFloat v32 = d;
  v33 = *(char *(**)(char *))&tx;
  CGFloat v34 = ty;
  objc_msgSend(v20, sel_enumerateCoordinatesWithTransform_roundToViewScale_block_, &v29, 1, v26);
  _Block_release(v26);
  CGContextRestoreGState(v27);

  swift_unknownObjectRelease();
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
  sub_1E0EA8BE0(v12, index, zoom, resolution, v13, v14);
  v17 = v16;

  return v17;
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
  double v10 = a3.y;
  double v11 = a3.x;
  swift_unknownObjectRetain();
  id v13 = self;
  -[HKMultiLineSeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](v13, sel_xAxisDistanceFromPoint_blockCoordinate_chartRect_, a4, v11, v10, x, y, width, height);
  double v15 = v14;
  -[HKMultiLineSeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](v13, sel_yAxisDifferenceToPoint_blockCoordinate_chartRect_, a4, v11, v10, x, y, width, height);
  double v17 = v16;
  swift_unknownObjectRelease();

  return _stdlib_squareRoot(v15 * v15 + v17 * v17);
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  return sub_1E0EA9218(self, a3.x, a3.y, (uint64_t)a2, (uint64_t)a4, (double (*)(uint64_t, double, double))sub_1E0EAA470);
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  return sub_1E0EA9218(self, a3.x, a3.y, (uint64_t)a2, (uint64_t)a4, (double (*)(uint64_t, double, double))sub_1E0EAA6E4);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  return sub_1E0EA9940(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_1E0EA9290);
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  return sub_1E0EA9940(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_1E0EA95E8);
}

- (_TtC8HealthUI17HKMultiLineSeries)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HKMultiLineSeries();
  return [(HKGraphSeries *)&v3 init];
}

@end