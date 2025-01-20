@interface MedicationsCategoryRoomTipView
- (UIButton)dismissButton;
- (_TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView)initWithFrame:(CGRect)a3;
- (void)didTapDismiss;
- (void)setDismissButton:(id)a3;
@end

@implementation MedicationsCategoryRoomTipView

- (UIButton)dismissButton
{
  v2 = self;
  id v3 = sub_1C1FA5264();

  return (UIButton *)v3;
}

- (void)setDismissButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___dismissButton);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___dismissButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1FAA398();
}

- (void)didTapDismiss
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView_onDismiss);
  if (v2)
  {
    id v4 = self;
    uint64_t v3 = sub_1C1F1325C((uint64_t)v2);
    v2(v3);
    sub_1C1F31118((uint64_t)v2);
  }
}

- (_TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView_headerView));
  sub_1C1FAA600((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView_tipImage, type metadata accessor for TipImage);
  sub_1C1F31118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView_onDismiss));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___medicationView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___dismissImageView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI30MedicationsCategoryRoomTipView____lazy_storage___actionButtonsStackView);
}

@end