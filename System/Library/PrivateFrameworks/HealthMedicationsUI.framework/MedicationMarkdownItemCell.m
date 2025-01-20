@interface MedicationMarkdownItemCell
- (_TtC19HealthMedicationsUI26MedicationMarkdownItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI26MedicationMarkdownItemCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationMarkdownItemCell

- (_TtC19HealthMedicationsUI26MedicationMarkdownItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI26MedicationMarkdownItemCell *)sub_1C1FD6B90(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI26MedicationMarkdownItemCell)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell____lazy_storage___stackView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell____lazy_storage___criticalButton) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell____lazy_storage___primaryLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell____lazy_storage___attributionLabel) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI26MedicationMarkdownItemCell *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1F374E4((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell____lazy_storage___criticalButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell____lazy_storage___primaryLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationMarkdownItemCell____lazy_storage___attributionLabel);
}

@end