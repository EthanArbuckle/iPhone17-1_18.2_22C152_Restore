@interface HighlightCalendarView
- (NSArray)accessibilityMonthLabels;
- (NSArray)accessibilityWeekdayLabels;
- (_TtC19HealthVisualization21HighlightCalendarView)initWithArrangedSubviewRows:(id)a3;
- (_TtC19HealthVisualization21HighlightCalendarView)initWithCoder:(id)a3;
- (_TtC19HealthVisualization21HighlightCalendarView)initWithFrame:(CGRect)a3;
@end

@implementation HighlightCalendarView

- (_TtC19HealthVisualization21HighlightCalendarView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView_longWeekdayStrings) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView_shortWeekdayStrings) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView____lazy_storage___ringsRenderer) = 0;
  v4 = (objc_class *)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView_weekdayLabels) = (Class)MEMORY[0x1E4FBC860];
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView_monthLabels) = v4;
  id v5 = a3;

  result = (_TtC19HealthVisualization21HighlightCalendarView *)sub_1C2A9E628();
  __break(1u);
  return result;
}

- (_TtC19HealthVisualization21HighlightCalendarView)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthVisualization21HighlightCalendarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthVisualization21HighlightCalendarView)initWithArrangedSubviewRows:(id)a3
{
  result = (_TtC19HealthVisualization21HighlightCalendarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization21HighlightCalendarView____lazy_storage___ringsRenderer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSArray)accessibilityWeekdayLabels
{
  sub_1C29376D4(0, &qword_1EBB90D90);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C2A9DE88();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSArray)accessibilityMonthLabels
{
  swift_beginAccess();
  sub_1C29376D4(0, &qword_1EBB90D90);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1C2A9DE88();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

@end