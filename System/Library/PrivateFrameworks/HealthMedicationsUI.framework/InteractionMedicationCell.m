@interface InteractionMedicationCell
- (_TtC19HealthMedicationsUI25InteractionMedicationCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI25InteractionMedicationCell)initWithFrame:(CGRect)a3;
- (void)awakeFromNib;
@end

@implementation InteractionMedicationCell

- (_TtC19HealthMedicationsUI25InteractionMedicationCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI25InteractionMedicationCell *)sub_1C1F2175C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI25InteractionMedicationCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI25InteractionMedicationCell *)sub_1C1F21870(a3);
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionMedicationCell();
  id v2 = v3.receiver;
  [(InteractionMedicationCell *)&v3 awakeFromNib];
  sub_1C1F219B4();
  sub_1C1F21B08();
}

- (void).cxx_destruct
{
  sub_1C1F23854((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell_item, (unint64_t *)&qword_1EBF0C300, (unint64_t *)&qword_1EBF0C2F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell____lazy_storage___titleButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell____lazy_storage___stackedMedmojiView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell____lazy_storage___firstInteractionNameLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI25InteractionMedicationCell____lazy_storage___secondInteractionNameLabel);
}

@end