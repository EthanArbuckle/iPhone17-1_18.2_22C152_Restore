@interface HighlightActivityCalendarView
- (_TtC19HealthVisualization29HighlightActivityCalendarView)initWithArrangedSubviewRows:(id)a3;
- (_TtC19HealthVisualization29HighlightActivityCalendarView)initWithCoder:(id)a3;
- (_TtC19HealthVisualization29HighlightActivityCalendarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4;
@end

@implementation HighlightActivityCalendarView

- (_TtC19HealthVisualization29HighlightActivityCalendarView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s19HealthVisualization29HighlightActivityCalendarViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HighlightActivityCalendarView();
  id v2 = v3.receiver;
  [(HighlightActivityCalendarView *)&v3 layoutSubviews];
  sub_1C2996FF4();
  sub_1C2995F74();
}

- (_TtC19HealthVisualization29HighlightActivityCalendarView)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthVisualization29HighlightActivityCalendarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthVisualization29HighlightActivityCalendarView)initWithArrangedSubviewRows:(id)a3
{
  result = (_TtC19HealthVisualization29HighlightActivityCalendarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization29HighlightActivityCalendarView_healthStore));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization29HighlightActivityCalendarView_currentLabelMaximumContentSizeCategory));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization29HighlightActivityCalendarView____lazy_storage___ringsRenderer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization29HighlightActivityCalendarView____lazy_storage___unitPreferenceController));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthVisualization29HighlightActivityCalendarView____lazy_storage___displayTypeController);
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  _s19HealthVisualization29HighlightActivityCalendarViewC32wheelchairUseCharacteristicCache_0G14UsageDidChangeySo013_HKWheelchairhiJ0CSg_SbtF_0();
}

@end