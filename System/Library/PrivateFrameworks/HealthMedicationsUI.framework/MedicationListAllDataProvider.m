@interface MedicationListAllDataProvider
- (NSPredicate)defaultQueryPredicate;
- (_TtC19HealthMedicationsUI29MedicationListAllDataProvider)init;
- (_TtC19HealthMedicationsUI29MedicationListAllDataProvider)initWithDisplayType:(id)a3 profile:(id)a4;
- (id)detailSectionForSample:(id)a3;
- (id)sampleTypes;
- (id)textForObject:(id)a3;
- (id)viewControllerForItemAtIndexPath:(id)a3;
- (void)setDefaultQueryPredicate:(id)a3;
@end

@implementation MedicationListAllDataProvider

- (_TtC19HealthMedicationsUI29MedicationListAllDataProvider)initWithDisplayType:(id)a3 profile:(id)a4
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate) = 0;
  id v6 = a3;
  id v7 = a4;

  result = (_TtC19HealthMedicationsUI29MedicationListAllDataProvider *)sub_1C214B910();
  __break(1u);
  return result;
}

- (NSPredicate)defaultQueryPredicate
{
  v2 = self;
  id v3 = sub_1C21467D4();

  return (NSPredicate *)v3;
}

- (void)setDefaultQueryPredicate:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate) = (Class)a3;
  id v3 = a3;
}

- (id)textForObject:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1C214B5A0();
  swift_unknownObjectRelease();
  sub_1C2146A20((uint64_t)v9);
  uint64_t v6 = v5;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  if (v6)
  {
    id v7 = (void *)sub_1C214A5B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)sampleTypes
{
  sub_1C1F0ED28();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1C214E170;
  id v4 = self;
  uint64_t v5 = [(WDSampleListDataProvider *)v4 displayType];
  id v6 = [(HKDisplayType *)v5 sampleType];

  *(void *)(v3 + 32) = v6;
  sub_1C214A7A0();

  sub_1C1F12718(0, &qword_1EA2C36A8);
  id v7 = (void *)sub_1C214A770();
  swift_bridgeObjectRelease();

  return v7;
}

- (id)viewControllerForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_1C2147D90();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2147D50();
  v8 = self;
  v9 = (void *)sub_1C2146D0C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)detailSectionForSample:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(WDSampleListDataProvider *)v5 displayTypeController];
  id v7 = [(WDSampleListDataProvider *)v5 unitController];
  v8 = *(Class *)((char *)&v5->super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication);
  v9 = (objc_class *)type metadata accessor for MedicationDoseEventMetadataDetailSection();
  v10 = (char *)objc_allocWithZone(v9);
  *(void *)&v10[OBJC_IVAR____TtC19HealthMedicationsUI40MedicationDoseEventMetadataDetailSection_medication] = v8;
  v14.receiver = v10;
  v14.super_class = v9;
  id v11 = v8;
  v12 = [(MedicationListAllDataProvider *)&v14 initWithSample:v4 displayTypeController:v6 unitController:v7];

  return v12;
}

- (_TtC19HealthMedicationsUI29MedicationListAllDataProvider)init
{
  result = (_TtC19HealthMedicationsUI29MedicationListAllDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_medication));
  uint64_t v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC19HealthMedicationsUI29MedicationListAllDataProvider_predicate);
}

@end