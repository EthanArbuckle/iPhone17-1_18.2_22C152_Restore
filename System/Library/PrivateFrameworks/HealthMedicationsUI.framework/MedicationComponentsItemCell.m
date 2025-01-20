@interface MedicationComponentsItemCell
- (_TtC19HealthMedicationsUI28MedicationComponentsItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI28MedicationComponentsItemCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationComponentsItemCell

- (_TtC19HealthMedicationsUI28MedicationComponentsItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI28MedicationComponentsItemCell *)sub_1C1FD470C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI28MedicationComponentsItemCell)initWithCoder:(id)a3
{
  return (_TtC19HealthMedicationsUI28MedicationComponentsItemCell *)sub_1C1FD4804(a3);
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationComponentsItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationComponentsItemCell____lazy_storage___primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationComponentsItemCell____lazy_storage___componentsLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end