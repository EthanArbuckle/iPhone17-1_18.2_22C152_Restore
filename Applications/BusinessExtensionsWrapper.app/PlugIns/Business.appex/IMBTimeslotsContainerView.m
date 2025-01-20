@interface IMBTimeslotsContainerView
- (NSArray)timeslotViews;
- (_TtC8Business25IMBTimeslotsContainerView)init;
- (_TtC8Business25IMBTimeslotsContainerView)initWithCoder:(id)a3;
- (_TtC8Business25IMBTimeslotsContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTimeslotViews:(id)a3;
@end

@implementation IMBTimeslotsContainerView

- (NSArray)timeslotViews
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotViews);
  swift_beginAccess();
  if (*v2)
  {
    type metadata accessor for IMBTimeslotView();
    swift_bridgeObjectRetain();
    v3.super.isa = sub_1000BBBD8().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }

  return (NSArray *)v3.super.isa;
}

- (void)setTimeslotViews:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for IMBTimeslotView();
    uint64_t v3 = sub_1000BBBE8();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotViews);
  swift_beginAccess();
  uint64_t *v5 = v3;
  swift_bridgeObjectRelease();
}

- (_TtC8Business25IMBTimeslotsContainerView)init
{
  return (_TtC8Business25IMBTimeslotsContainerView *)sub_10007B8F8();
}

- (_TtC8Business25IMBTimeslotsContainerView)initWithCoder:(id)a3
{
  return (_TtC8Business25IMBTimeslotsContainerView *)sub_10007BB3C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10007C060();
}

- (_TtC8Business25IMBTimeslotsContainerView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business25IMBTimeslotsContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_dateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeslotViewHeightConstraint));
  sub_100010D28((uint64_t)self + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timeSelectionDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8Business25IMBTimeslotsContainerView_timezone;

  sub_10007DBAC((uint64_t)v3);
}

@end