@interface SpatialLayoutDelegate
- (BOOL)originIsUpperLeft;
- (CGPoint)pointForDate:(double)a3;
- (CGRect)displayedRect;
- (_TtC14CalendarWidget21SpatialLayoutDelegate)init;
- (double)RoundToScreenScale:(double)a3;
- (double)dateForPoint:(CGPoint)a3;
- (double)hourHeight;
- (double)timeWidth;
- (double)topPadding;
- (void)setOriginIsUpperLeft:(BOOL)a3;
- (void)setTopPadding:(double)a3;
@end

@implementation SpatialLayoutDelegate

- (CGRect)displayedRect
{
  double v2 = sub_1DAEF9A44((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_displayedRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)hourHeight
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_endHourToShow);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_startHourToShow);
  BOOL v4 = __OFSUB__(v2, v3);
  uint64_t v5 = v2 - v3;
  if (!v4) {
    return *(double *)&self->displayedRect[OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_displayedRect + 16]
  }
         / (double)v5;
  __break(1u);
  return result;
}

- (double)topPadding
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_topPadding);
}

- (void)setTopPadding:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_topPadding) = a3;
}

- (double)timeWidth
{
  return *(double *)&self->displayedRect[OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_displayedRect + 8];
}

- (BOOL)originIsUpperLeft
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_originIsUpperLeft);
}

- (void)setOriginIsUpperLeft:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_originIsUpperLeft) = a3;
}

- (double)dateForPoint:(CGPoint)a3
{
  uint64_t v3 = self;
  sub_1DAEF908C();
  double v5 = v4;

  return v5;
}

- (CGPoint)pointForDate:(double)a3
{
  uint64_t v3 = self;
  sub_1DAEF9370();
  double v5 = v4;

  double v6 = 0.0;
  double v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (double)RoundToScreenScale:(double)a3
{
  return round(*(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_scale) * a3)
       / *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_scale);
}

- (_TtC14CalendarWidget21SpatialLayoutDelegate)init
{
  CGPoint result = (_TtC14CalendarWidget21SpatialLayoutDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_startDate;
  uint64_t v4 = sub_1DAF97FC0();
  double v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_endDate, v4);
  double v6 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_calendar;
  uint64_t v7 = sub_1DAF981D0();
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
}

@end