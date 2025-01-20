@interface MedicationSideEffectsItemCell
- (_TtC19HealthMedicationsUI29MedicationSideEffectsItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI29MedicationSideEffectsItemCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationSideEffectsItemCell

- (_TtC19HealthMedicationsUI29MedicationSideEffectsItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI29MedicationSideEffectsItemCell *)sub_1C201201C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI29MedicationSideEffectsItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationSideEffectsItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationSideEffectsItemCell____lazy_storage___stackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationSideEffectsItemCell____lazy_storage___primaryLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationSideEffectsItemCell____lazy_storage___attributionLabel) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI29MedicationSideEffectsItemCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationSideEffectsItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationSideEffectsItemCell____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationSideEffectsItemCell____lazy_storage___primaryLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationSideEffectsItemCell____lazy_storage___attributionLabel);
}

@end