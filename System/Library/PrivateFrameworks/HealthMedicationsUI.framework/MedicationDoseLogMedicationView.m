@interface MedicationDoseLogMedicationView
- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationView)initWithFrame:(CGRect)a3;
- (void)didTapRecord:(id)a3;
- (void)didTapSkip:(id)a3;
- (void)didTapUnitTime:(id)a3;
- (void)layoutSubviews;
@end

@implementation MedicationDoseLogMedicationView

- (void)layoutSubviews
{
  v2 = self;
  sub_1C1F78C70();
}

- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationView *)sub_1C1F78E78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI31MedicationDoseLogMedicationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1F7C948();
}

- (void)didTapSkip:(id)a3
{
}

- (void)didTapRecord:(id)a3
{
}

- (void)didTapUnitTime:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C214B5A0();
  swift_unknownObjectRelease();
  if (MEMORY[0x1C8754850]((char *)v4 + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_logDelegate))
  {
    uint64_t v5 = swift_retain();
    sub_1C20899C0(v5);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v6);
}

- (void).cxx_destruct
{
  swift_release();
  sub_1C1F2E220((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_logDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___timeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___medicationNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___formStrengthLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___medmojiImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___notesLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___skippedButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___takenButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___doseAmountTimeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___medicationStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___lowerSectionStackViewWithNotes));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___lowerSectionStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___skippedTakenStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView____lazy_storage___dividerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_lastDoseLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_lastDoseLabelContainer));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI31MedicationDoseLogMedicationView_contentView);
}

@end