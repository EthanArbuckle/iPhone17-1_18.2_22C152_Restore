@interface HDHRSignedClinicalDataProcessor
- (HDHRSignedClinicalDataProcessor)init;
- (id)preprocessDataInSource:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)preprocessFHIRResourceObject:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)reprocessOriginalRecords:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (void)processContextCollection:(HDHRSSignedClinicalDataProcessingContextCollection *)a3 completion:(id)a4;
- (void)processOriginalSignedClinicalDataRecords:(NSArray *)a3 options:(unint64_t)a4 completion:(id)a5;
@end

@implementation HDHRSignedClinicalDataProcessor

- (id)preprocessDataInSource:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return sub_23301879C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, uint64_t))sub_23301C6D0);
}

- (id)preprocessFHIRResourceObject:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  return sub_23301879C(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(id, uint64_t))sub_23301C7E4);
}

- (id)reprocessOriginalRecords:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  sub_232F3A800(0, &qword_2687584C8);
  unint64_t v7 = sub_23309B9A0();
  v8 = self;
  v9 = (void *)sub_23301D2A4(v7, a4);
  swift_bridgeObjectRelease();

  return v9;
}

- (void)processOriginalSignedClinicalDataRecords:(NSArray *)a3 options:(unint64_t)a4 completion:(id)a5
{
  sub_23301E890(0, &qword_268758370, MEMORY[0x263F8F520]);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - v10;
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_23309BA90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2687584B0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2687584B8;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_23306D818((uint64_t)v11, (uint64_t)&unk_2687584C0, (uint64_t)v16);
  swift_release();
}

- (void)processContextCollection:(HDHRSSignedClinicalDataProcessingContextCollection *)a3 completion:(id)a4
{
  sub_23301E890(0, &qword_268758370, MEMORY[0x263F8F520]);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - v8;
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_23309BA90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2687584A0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2687583A8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_23306D818((uint64_t)v9, (uint64_t)&unk_2687583B0, (uint64_t)v14);
  swift_release();
}

- (HDHRSignedClinicalDataProcessor)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SignedClinicalDataProcessor();
  return [(HDHRSignedClinicalDataProcessor *)&v3 init];
}

@end