@interface MedicationSearchCell
- (_TtC19HealthMedicationsUI20MedicationSearchCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI20MedicationSearchCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationSearchCell

- (_TtC19HealthMedicationsUI20MedicationSearchCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI20MedicationSearchCell *)sub_1C202C084(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI20MedicationSearchCell)initWithCoder:(id)a3
{
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationSearchCell_baseIdentifier);
  uint64_t v10 = sub_1C214A5F0();
  uint64_t v11 = v6;
  swift_bridgeObjectRetain();
  sub_1C214A6C0();
  id v7 = a3;
  swift_bridgeObjectRelease();
  uint64_t *v5 = v10;
  v5[1] = v11;
  v8 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI20MedicationSearchCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;

  result = (_TtC19HealthMedicationsUI20MedicationSearchCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end