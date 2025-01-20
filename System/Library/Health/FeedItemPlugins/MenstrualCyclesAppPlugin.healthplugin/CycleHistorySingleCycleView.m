@interface CycleHistorySingleCycleView
- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)init;
- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)initWithFrame:(CGRect)a3;
- (void)respondToContentSizeChanges;
- (void)respondToHorizontalSizeChanges;
- (void)viewModelProviderDidUpdate:(id)a3;
@end

@implementation CycleHistorySingleCycleView

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)init
{
  return (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView *)sub_24133B214();
}

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24133D700();
}

- (void)respondToContentSizeChanges
{
  v2 = self;
  sub_24133BB74();
}

- (void)respondToHorizontalSizeChanges
{
  v2 = self;
  sub_24133C5DC();
}

- (void)viewModelProviderDidUpdate:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_cycleView);
  id v5 = a3;
  v6 = self;
  id v7 = v4;
  sub_24152D068();
}

- (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView)initWithFrame:(CGRect)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_cycleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_daysLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_factorsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_periodLengthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_cycleViewModelProvider));
  sub_24133D5B8((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_currentViewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_bottomConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin27CycleHistorySingleCycleView_disclosureIndicator);
}

@end