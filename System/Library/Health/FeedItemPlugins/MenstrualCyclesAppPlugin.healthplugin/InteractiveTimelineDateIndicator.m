@interface InteractiveTimelineDateIndicator
- (_TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator)initWithFrame:(CGRect)a3;
- (void)respondToTraitChanges;
- (void)significantTimeChange;
@end

@implementation InteractiveTimelineDateIndicator

- (_TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2415A14D4();
}

- (void)significantTimeChange
{
  v2 = self;
  sub_2415A0974();
}

- (void)respondToTraitChanges
{
  v2 = self;
  sub_24159FEDC();
  sub_2415A02E4();
  sub_24159FFC4();
}

- (_TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator)initWithFrame:(CGRect)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_calendarCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_dateLabel));
  sub_2411E7908((uint64_t)self+ OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_cachedStartOfCurrentYear);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_previousYearsFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_currentYearFormatter));
  id v3 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin32InteractiveTimelineDateIndicator_cycleDay;

  sub_241361C9C((uint64_t)v3);
}

@end