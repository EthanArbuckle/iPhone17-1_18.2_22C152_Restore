@interface HKBalanceDaySeries
- (HKBalanceDaySeries)init;
- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6;
- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9;
@end

@implementation HKBalanceDaySeries

- (HKBalanceDaySeries)init
{
  uint64_t v3 = sub_1E0ECBA40();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3, v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1E0ECBB60();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E4F27B20], v3);
  v13 = self;
  sub_1E0ECBA50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))((uint64_t)v13 + OBJC_IVAR___HKBalanceDaySeries_gregorianCalendar, v12, v8);
  *(Class *)((char *)&v13->super.super.super.isa + OBJC_IVAR___HKBalanceDaySeries_sleepingMetrics) = (Class)sub_1E0ECBDD0();

  v14 = (objc_class *)type metadata accessor for BalanceDaySeries();
  v16.receiver = v13;
  v16.super_class = v14;
  return [(HKBalanceSeries *)&v16 init];
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
  sub_1E0E5BA68(v12, index, zoom, resolution, v13, v14);
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
  sub_1E0E60ED8(v19, x, y, width, height, (uint64_t)v20, (uint64_t *)v24, (uint64_t)v21, a9);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR___HKBalanceDaySeries_gregorianCalendar;
  uint64_t v3 = sub_1E0ECBB60();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end