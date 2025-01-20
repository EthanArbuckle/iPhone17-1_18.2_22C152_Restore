@interface MedicationInfoItemCell
- (_TtC19HealthMedicationsUI22MedicationInfoItemCell)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI22MedicationInfoItemCell)initWithFrame:(CGRect)a3;
@end

@implementation MedicationInfoItemCell

- (_TtC19HealthMedicationsUI22MedicationInfoItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI22MedicationInfoItemCell *)sub_1C20B9B34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI22MedicationInfoItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C20BA658();
}

- (void).cxx_destruct
{
  sub_1C20B96F8((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell_item, (unint64_t *)&qword_1EBF0C300, (void (*)(uint64_t))sub_1C1F1CB5C);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___medmojiView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___strengthLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI22MedicationInfoItemCell____lazy_storage___ingredientsLabel);
}

@end