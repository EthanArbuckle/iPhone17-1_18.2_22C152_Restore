@interface MedicalRecordChartSeries
- ($29D920EB297D915BAF2BF71A1708758A)selectedPathRange;
- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4;
- (BOOL)supportsMultiTouchSelection;
- (_TtC15HealthRecordsUI24MedicalRecordChartSeries)init;
- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
@end

@implementation MedicalRecordChartSeries

- ($29D920EB297D915BAF2BF71A1708758A)selectedPathRange
{
  v4 = self;
  if ([(HKGraphSeries *)v4 allowsSelection])
  {
    HKGraphSeriesDataBlockPathMake((uint64_t)&v14);
    __n128 v20 = v14;
    *(void *)&long long v21 = v15;
    HKGraphSeriesDataPointPathMake(&v20, &v14);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F67920] + 16);
    __n128 v20 = *(__n128 *)MEMORY[0x1E4F67920];
    long long v21 = v5;
    __n128 v18 = v14;
    long long v19 = v15;
  }
  else
  {
    unint64_t v6 = *(void *)(MEMORY[0x1E4F67920] + 8);
    uint64_t v8 = *(void *)(MEMORY[0x1E4F67920] + 16);
    uint64_t v7 = *(void *)(MEMORY[0x1E4F67920] + 24);
    v20.n128_u64[0] = *MEMORY[0x1E4F67920];
    v20.n128_u64[1] = v6;
    *(void *)&long long v21 = v8;
    *((void *)&v21 + 1) = v7;
    v18.n128_u64[0] = v20.n128_u64[0];
    v18.n128_u64[1] = v6;
    *(void *)&long long v19 = v8;
    *((void *)&v19 + 1) = v7;
  }
  HKGraphSeriesDataPointPathRangeMake(&v20, (uint64_t)&v18, &v14);
  long long v12 = v15;
  __n128 v13 = v14;
  long long v10 = v17;
  long long v11 = v16;

  *(__n128 *)&retstr->var0.var0.index = v13;
  *(_OWORD *)&retstr->var0.var0.resolution = v12;
  *(_OWORD *)&retstr->var1.var0.index = v11;
  *(_OWORD *)&retstr->var1.var0.resolution = v10;
  return result;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  int64_t index = a4->index;
  int64_t zoom = a4->zoom;
  int64_t resolution = a4->resolution;
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  long long v15 = self;
  sub_1C2412154(v12, index, zoom, resolution, v13, v14);
  long long v17 = v16;

  return v17;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  long long v30 = *(_OWORD *)&a6->c;
  long long v31 = *(_OWORD *)&a6->a;
  tCGFloat x = a6->tx;
  tCGFloat y = a6->ty;
  id v19 = a3;
  id v20 = a5;
  long long v21 = a7;
  id v22 = a8;
  swift_unknownObjectRetain();
  v23 = self;
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v36);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v37);
  v26 = (CGFloat *)swift_allocObject();
  v26[2] = MinX;
  v26[3] = MaxX;
  *((void *)v26 + 4) = v23;
  *((void *)v26 + 5) = v21;
  v34 = sub_1C24139E0;
  CGFloat v35 = *(double *)&v26;
  *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v33 = sub_1C241167C;
  *((void *)&v33 + 1) = &block_descriptor_18_1;
  v27 = _Block_copy(&aBlock);
  v28 = v21;
  v29 = v23;
  swift_release();
  long long aBlock = v31;
  long long v33 = v30;
  v34 = *(uint64_t (**)())&tx;
  CGFloat v35 = ty;
  objc_msgSend(v19, sel_enumerateCoordinatesWithTransform_roundToViewScale_block_, &aBlock, 1, v27);
  _Block_release(v27);

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
  swift_unknownObjectRetain();
  long long v10 = self;
  BOOL v11 = sub_1C24129EC((uint64_t)a4, x, y, width, height);
  swift_unknownObjectRelease();

  return v11;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  double x = a3.x;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1C2412D14((uint64_t)a4, x, y);
  double v11 = v10;
  swift_unknownObjectRelease();

  return v11;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1C2412F9C((uint64_t)a4);
  double v9 = v8;
  swift_unknownObjectRelease();

  return v9;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y = a3.y;
  swift_unknownObjectRetain();
  double v8 = self;
  sub_1C2413218((uint64_t)a4, y);
  double v10 = v9;
  swift_unknownObjectRelease();

  return v10;
}

- (_TtC15HealthRecordsUI24MedicalRecordChartSeries)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI24MedicalRecordChartSeries_selectedStrokeStyle) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI24MedicalRecordChartSeries_unselectedStrokeStyle) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicalRecordChartSeries();
  return [(HKGraphSeries *)&v3 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24MedicalRecordChartSeries_selectedStrokeStyle));
  objc_super v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI24MedicalRecordChartSeries_unselectedStrokeStyle);
}

@end