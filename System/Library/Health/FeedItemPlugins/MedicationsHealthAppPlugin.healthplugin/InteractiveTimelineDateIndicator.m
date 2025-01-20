@interface InteractiveTimelineDateIndicator
- (_TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator)initWithCoder:(id)a3;
- (_TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator)initWithFrame:(CGRect)a3;
- (void)significantTimeChange;
@end

@implementation InteractiveTimelineDateIndicator

- (_TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_241108440();
}

- (void)significantTimeChange
{
  v2 = self;
  sub_241107880();
}

- (_TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator)initWithFrame:(CGRect)a3
{
  result = (_TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator____lazy_storage___dateLabel));
  sub_2410A1AB8((uint64_t)self+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_cachedStartOfCurrentYear);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_previousYearsFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_currentYearFormatter));
  id v3 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin32InteractiveTimelineDateIndicator_timelineDay;

  sub_241102698((uint64_t)v3);
}

@end