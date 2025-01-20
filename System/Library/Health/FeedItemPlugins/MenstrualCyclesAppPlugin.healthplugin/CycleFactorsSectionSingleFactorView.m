@interface CycleFactorsSectionSingleFactorView
- (_TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView)initWithCoder:(id)a3;
- (_TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView)initWithFrame:(CGRect)a3;
@end

@implementation CycleFactorsSectionSingleFactorView

- (_TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_titleLabel;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  uint64_t v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_subtitleLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x263F828E0]), sel_init);

  result = (_TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView *)sub_241633038();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  sub_2412F2760((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_viewModel);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35CycleFactorsSectionSingleFactorView_subtitleLabel);
}

@end