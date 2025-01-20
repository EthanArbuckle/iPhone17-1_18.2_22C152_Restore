@interface SpatialEventViewModel
+ (double)barToBarHorizontalDistanceIncludingBarWidth;
- (BOOL)hideTravelTime;
- (BOOL)visibleHeightLocked;
- (CGRect)stagedFrame;
- (CGRect)unPinnedViewFrame;
- (NSDate)end;
- (NSDate)start;
- (NSDate)startWithTravelTime;
- (NSString)description;
- (NSString)eventIdentifier;
- (_TtC14CalendarWidget21SpatialEventViewModel)init;
- (double)barToBarHorizontalDistanceIncludingBarWidth;
- (double)enoughHeightForOneLine;
- (double)viewMaxNaturalTextHeight;
- (void)setHideTravelTime:(BOOL)a3;
- (void)setStagedFrame:(CGRect)a3;
- (void)setTravelTimeHeight:(double)a3;
- (void)setUnPinnedViewFrame:(CGRect)a3;
- (void)setVisibleHeight:(double)a3;
- (void)setVisibleHeightLocked:(BOOL)a3;
@end

@implementation SpatialEventViewModel

- (CGRect)unPinnedViewFrame
{
  double v2 = sub_1DAEF9A44((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_unPinnedViewFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUnPinnedViewFrame:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_unPinnedViewFrame) = a3;
}

- (NSString)eventIdentifier
{
  double v2 = self;
  sub_1DAEC5674();

  double v3 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSDate)startWithTravelTime
{
  uint64_t v3 = sub_1DAF97FC0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v5);
  v9 = (char *)&v16 - v8;
  v10 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewStartDate;
  type metadata accessor for Event();
  v11 = self;
  sub_1DAF97F40();
  sub_1DAE937D4();
  if (sub_1DAF99710()) {
    v12 = v7;
  }
  else {
    v12 = v10;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v12, v3);
  v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, v3);

  v14 = (void *)sub_1DAF97F50();
  v13(v9, v3);
  return (NSDate *)v14;
}

- (NSDate)start
{
  uint64_t v3 = sub_1DAF97FC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewStartDate;
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_event;
  v9 = &v8[*(int *)(type metadata accessor for Event() + 20)];
  sub_1DAE937D4();
  v10 = self;
  if (sub_1DAF99710()) {
    v11 = v9;
  }
  else {
    v11 = v7;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v11, v3);

  v12 = (void *)sub_1DAF97F50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v12;
}

- (NSDate)end
{
  uint64_t v3 = sub_1DAF97FC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewEndDate;
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_event;
  v9 = &v8[*(int *)(type metadata accessor for Event() + 24)];
  sub_1DAE937D4();
  v10 = self;
  if (sub_1DAF99700()) {
    v11 = v9;
  }
  else {
    v11 = v7;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v11, v3);

  v12 = (void *)sub_1DAF97F50();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v12;
}

- (BOOL)hideTravelTime
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_hideTravelTime);
}

- (void)setHideTravelTime:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_hideTravelTime) = a3;
}

- (double)enoughHeightForOneLine
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_lineHeight);
}

- (double)viewMaxNaturalTextHeight
{
  double v2 = self;
  double v3 = sub_1DAEF9FCC();

  return v3;
}

- (void)setStagedFrame:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame) = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeight) = (Class)0x7FEFFFFFFFFFFFFFLL;
}

- (CGRect)stagedFrame
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame);
  double v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame];
  double v4 = *(double *)&self->id[OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame];
  double v5 = *(double *)&self->id[OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame + 8];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)visibleHeightLocked
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked);
}

- (void)setVisibleHeightLocked:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked) = a3;
}

- (void)setVisibleHeight:(double)a3
{
  uint64_t v3 = OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked;
  if ((*((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked) & 1) == 0)
  {
    *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeight) = a3;
    *((unsigned char *)&self->super.isa + v3) = 1;
  }
}

- (void)setTravelTimeHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_travelTimeHeight) = a3;
}

+ (double)barToBarHorizontalDistanceIncludingBarWidth
{
  return 0.0;
}

- (double)barToBarHorizontalDistanceIncludingBarWidth
{
  return (*(double **)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewMetrics))[6]
       + (*(double **)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewMetrics))[6]
       + (*(double **)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewMetrics))[8];
}

- (NSString)description
{
  double v2 = self;
  sub_1DAEFA29C();

  uint64_t v3 = (void *)sub_1DAF997C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC14CalendarWidget21SpatialEventViewModel)init
{
  CGRect result = (_TtC14CalendarWidget21SpatialEventViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DAE3FD4C((uint64_t)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_event);
  swift_bridgeObjectRelease();

  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewStartDate;
  uint64_t v4 = sub_1DAF97FC0();
  double v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewEndDate, v4);
  swift_release();
}

@end