@interface MedicationsRecordAllButton
- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)init;
- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)initWithCoder:(id)a3;
- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)initWithFrame:(CGRect)a3;
- (void)didTapRecord:(id)a3;
@end

@implementation MedicationsRecordAllButton

- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)init
{
  return (_TtC19HealthMedicationsUI26MedicationsRecordAllButton *)sub_1C207544C();
}

- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationsRecordAllButton_logDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationsRecordAllButton_recordAllViewModel) = 0;
  id v5 = a3;

  result = (_TtC19HealthMedicationsUI26MedicationsRecordAllButton *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)didTapRecord:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C214B5A0();
  swift_unknownObjectRelease();
  sub_1C2075D58();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (_TtC19HealthMedicationsUI26MedicationsRecordAllButton)initWithFrame:(CGRect)a3
{
  result = (_TtC19HealthMedicationsUI26MedicationsRecordAllButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1C1F2E220((uint64_t)self + OBJC_IVAR____TtC19HealthMedicationsUI26MedicationsRecordAllButton_logDelegate);

  swift_release();
}

@end