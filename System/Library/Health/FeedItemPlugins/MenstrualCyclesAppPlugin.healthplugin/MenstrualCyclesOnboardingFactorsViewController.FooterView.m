@interface MenstrualCyclesOnboardingFactorsViewController.FooterView
- (_TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView)initWithCoder:(id)a3;
- (_TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView)initWithFrame:(CGRect)a3;
- (void)respondToContentSizeChanges;
@end

@implementation MenstrualCyclesOnboardingFactorsViewController.FooterView

- (_TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView_label;
  id v10 = objc_allocWithZone(MEMORY[0x263F828E0]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[MenstrualCyclesOnboardingFactorsViewController.FooterView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView_label;
  id v6 = objc_allocWithZone(MEMORY[0x263F828E0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView *)sub_241633038();
  __break(1u);
  return result;
}

- (void)respondToContentSizeChanges
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView_label);
  v4 = self;
  uint64_t v5 = *MEMORY[0x263F83570];
  id v6 = self;
  id v7 = objc_msgSend(v4, sel__preferredFontForTextStyle_variant_, v5, 0);
  objc_msgSend(v3, sel_setFont_, v7);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC24MenstrualCyclesAppPlugin46MenstrualCyclesOnboardingFactorsViewController10FooterView_label));
}

@end