@interface MedicationLogDetailsUnitView
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitView)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitView)initWithFrame:(CGRect)a3;
- (void)didChangeText:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
@end

@implementation MedicationLogDetailsUnitView

- (void)didChangeText:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C214B5A0();
  swift_unknownObjectRelease();
  sub_1C1FC6AEC();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitView *)sub_1C1FC7338(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthMedicationsUI28MedicationLogDetailsUnitView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1FC78B0();
}

- (void).cxx_destruct
{
  swift_release();
  sub_1C1F2E220((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView_detailsDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView____lazy_storage___valueAffixStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView____lazy_storage___valueTextField));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI28MedicationLogDetailsUnitView____lazy_storage___countingAffixLabel);
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1C1FC7974(v4);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_1C214A5F0();
  id v9 = a3;
  v10 = self;
  LOBYTE(length) = sub_1C1FC7C5C(v9, location, length);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end