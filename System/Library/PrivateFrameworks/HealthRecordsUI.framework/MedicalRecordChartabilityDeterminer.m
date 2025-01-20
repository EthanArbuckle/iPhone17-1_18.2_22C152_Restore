@interface MedicalRecordChartabilityDeterminer
- (_TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer)init;
- (void)determineChartabilityForConcept:(id)a3 records:(id)a4 completion:(id)a5;
- (void)determineChartabilityForUserConcept:(id)a3 records:(id)a4 completion:(id)a5;
@end

@implementation MedicalRecordChartabilityDeterminer

- (void)determineChartabilityForConcept:(id)a3 records:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_1C21AB51C(0, &qword_1EBB6F978);
  unint64_t v8 = sub_1C254F710();
  v12[2] = v7;
  v13[3] = sub_1C21AB51C(0, (unint64_t *)&qword_1EA2DE378);
  v13[4] = &protocol witness table for HKConcept;
  v13[0] = a3;
  id v9 = a3;
  v10 = self;
  uint64_t v11 = sub_1C228A9EC(v8);
  (*(void (**)(void *, uint64_t, uint64_t, void, uint64_t (*)(), void *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v10->super.isa)
                                                                                      + 0x60))(v13, v11, 1, 0, sub_1C2298C34, v12);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (void)determineChartabilityForUserConcept:(id)a3 records:(id)a4 completion:(id)a5
{
  v7 = _Block_copy(a5);
  sub_1C21AB51C(0, &qword_1EBB6F978);
  unint64_t v8 = sub_1C254F710();
  v12[2] = v7;
  v13[3] = sub_1C21AB51C(0, (unint64_t *)&qword_1EBB6EFF0);
  v13[4] = &protocol witness table for HKMedicalUserDomainConcept;
  v13[0] = a3;
  id v9 = a3;
  v10 = self;
  uint64_t v11 = sub_1C228A9EC(v8);
  (*(void (**)(void *, uint64_t, uint64_t, void, uint64_t (*)(), void *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v10->super.isa)
                                                                                      + 0x60))(v13, v11, 1, 0, sub_1C22989C4, v12);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtC15HealthRecordsUI35MedicalRecordChartabilityDeterminer)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicalRecordChartabilityDeterminer();
  return [(MedicalRecordChartabilityDeterminer *)&v3 init];
}

@end