@interface HKHealthRecordsExtractor
- (HKHealthRecordsExtractor)init;
- (id)comparePatientResourceDataWithExisting:(id)a3 incoming:(id)a4 error:(id *)a5;
- (void)extractResource:(HDOriginalFHIRResourceObject *)a3 completion:(id)a4;
@end

@implementation HKHealthRecordsExtractor

- (void)extractResource:(HDOriginalFHIRResourceObject *)a3 completion:(id)a4
{
  sub_23306DDD8(0, &qword_268758370, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - v8;
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_23309BA90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268758B60;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2687583A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23306D818((uint64_t)v9, (uint64_t)&unk_2687583B0, (uint64_t)v14);
  swift_release();
}

- (id)comparePatientResourceDataWithExisting:(id)a3 incoming:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  id v10 = sub_232FFE960(v7, v8);

  return v10;
}

- (HKHealthRecordsExtractor)init
{
  uint64_t v3 = OBJC_IVAR___HKHealthRecordsExtractor_router;
  id v4 = objc_allocWithZone((Class)type metadata accessor for HealthRecordsExtractionRouter());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  uint64_t v6 = OBJC_IVAR___HKHealthRecordsExtractor_decoder;
  sub_23309AB30();
  swift_allocObject();
  *(Class *)((char *)&v5->super.isa + v6) = (Class)sub_23309AB20();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for HealthRecordsExtractor();
  return [(HKHealthRecordsExtractor *)&v8 init];
}

- (void).cxx_destruct
{
  swift_release();
}

@end