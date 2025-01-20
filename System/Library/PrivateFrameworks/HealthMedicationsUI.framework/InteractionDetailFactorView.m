@interface InteractionDetailFactorView
- (_TtC19HealthMedicationsUI27InteractionDetailFactorView)init;
- (_TtC19HealthMedicationsUI27InteractionDetailFactorView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI27InteractionDetailFactorView)initWithFrame:(CGRect)a3;
@end

@implementation InteractionDetailFactorView

- (_TtC19HealthMedicationsUI27InteractionDetailFactorView)init
{
  return (_TtC19HealthMedicationsUI27InteractionDetailFactorView *)sub_1C1F66A68();
}

- (_TtC19HealthMedicationsUI27InteractionDetailFactorView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s19HealthMedicationsUI27InteractionDetailFactorViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (_TtC19HealthMedicationsUI27InteractionDetailFactorView)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthMedicationsUI27InteractionDetailFactorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1F67DF8((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionDetailFactorView_viewModelFactor);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionDetailFactorView____lazy_storage___drugInteractionVisualization));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionDetailFactorView____lazy_storage___factorNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionDetailFactorView____lazy_storage___infoLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionDetailFactorView_infoLabelHiddenBottomConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI27InteractionDetailFactorView_infoLabelVisibleBottomConstraint);
}

@end