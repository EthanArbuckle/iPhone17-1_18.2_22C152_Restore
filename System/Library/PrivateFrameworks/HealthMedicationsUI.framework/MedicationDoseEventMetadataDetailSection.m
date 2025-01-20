@interface MedicationDoseEventMetadataDetailSection
- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithMetadataObject:(id)a3 metadataDataSource:(id)a4 displayTypeController:(id)a5 unitController:(id)a6;
- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5;
- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithWorkoutActivity:(id)a3 displayTypeController:(id)a4 unitController:(id)a5;
- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithWorkoutEvent:(id)a3;
- (void)addSampleDetailValues;
@end

@implementation MedicationDoseEventMetadataDetailSection

- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithSample:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
}

- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithWorkoutActivity:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
}

- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithWorkoutEvent:(id)a3
{
  id v3 = a3;
  sub_1C214B7C0();
  swift_bridgeObjectRelease();
  result = (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection *)sub_1C214B910();
  __break(1u);
  return result;
}

- (void)addSampleDetailValues
{
  v2 = self;
  sub_1C2049B08();
}

- (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection)initWithMetadataObject:(id)a3 metadataDataSource:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  swift_unknownObjectRetain();
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  result = (_TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection_medication));
}

@end