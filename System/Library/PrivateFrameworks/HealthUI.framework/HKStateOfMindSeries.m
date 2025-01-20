@interface HKStateOfMindSeries
+ (id)standardStateOfMindSeriesWithStateOfMindDisplayType:(id)a3 unitController:(id)a4;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9;
- (HKStateOfMindSeries)init;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
@end

@implementation HKStateOfMindSeries

- (HKStateOfMindSeries)init
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKStateOfMindSeries____lazy_storage___gradientFillStyle) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKStateOfMindSeries____lazy_storage___inactiveFillStyle) = 0;
  v2 = self;
  *(Class *)((char *)&v2->super.super.isa + OBJC_IVAR___HKStateOfMindSeries_fixedAxisLabels) = (Class)sub_1E0E54324();

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for StateOfMindSeries();
  v3 = [(HKGraphSeries *)&v5 init];
  [(HKGraphSeries *)v3 setAdjustYAxisForLabels:0];
  return v3;
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
  sub_1E0E5308C(v12, index, zoom, resolution, v13, v14);
  v17 = v16;

  return v17;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
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
  sub_1E0E54A04(v19, v20, v24, (uint64_t)v21, a9, x, y, width, height);

  swift_unknownObjectRelease();
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
  type metadata accessor for StateOfMindCoordinate();
  uint64_t v9 = swift_dynamicCastClass();
  if (v9)
  {
    v10 = (void *)v9;
    swift_unknownObjectRetain();
    v11 = self;
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
  double y = a3.y;
  double x = a3.x;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1E0E54DC4(x, y);
  double v10 = v9;
  swift_unknownObjectRelease();

  return v10;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x = a3.x;
  type metadata accessor for StateOfMindCoordinate();
  uint64_t v6 = swift_dynamicCastClass();
  if (v6) {
    return vabdd_f64(*(double *)(v6 + OBJC_IVAR____TtC8HealthUI21StateOfMindCoordinate_xValue), x);
  }
  else {
    return 1.79769313e308;
  }
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  swift_unknownObjectRetain();
  v7 = self;
  double v8 = sub_1E0E54F28(y);
  swift_unknownObjectRelease();

  return v8;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6EF00);
  swift_bridgeObjectRetain();
  v4 = (void *)sub_1E0ECD320();
  swift_bridgeObjectRelease();
  return v4;
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  BOOL v9 = a8;
  double y = a6.y;
  double x = a6.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v14 = a4.origin.y;
  double v15 = a4.origin.x;
  swift_unknownObjectRetain();
  v17 = self;
  sub_1E0ECD760();
  swift_unknownObjectRelease();
  CGRect v18 = [(HKGraphSeries *)v17 yAxis];
  if (v18)
  {
    v21 = v18;
    __swift_project_boxed_opaque_existential_0(v28, v28[3]);
    -[HKAxis renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:](v21, sel_renderPositionForLabelLocation_rect_zoomScale_contentOffset_constantOffset_isHorizontal_optionalOffset_, sub_1E0ECD9D0(), v9, v15, v14, width, height, a5, x, y, a7, v29, v30);
    double v23 = v22;
    double v25 = v24;

    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
    double v19 = v23;
    double v20 = v25;
  }
  else
  {
    __break(1u);
  }
  result.double y = v20;
  result.double x = v19;
  return result;
}

+ (id)standardStateOfMindSeriesWithStateOfMindDisplayType:(id)a3 unitController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _s8HealthUI17StateOfMindSeriesC08standardcdeF005statedE11DisplayType14unitControllerACSo09HKDisplayJ0C_So016HKUnitPreferenceL0CtFZ_0(v5, (uint64_t)v6);

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKStateOfMindSeries____lazy_storage___gradientFillStyle));
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKStateOfMindSeries____lazy_storage___inactiveFillStyle);
}

@end