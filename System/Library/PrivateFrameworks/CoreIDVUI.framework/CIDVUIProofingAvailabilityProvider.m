@interface CIDVUIProofingAvailabilityProvider
- (_TtC9CoreIDVUI34CIDVUIProofingAvailabilityProvider)init;
- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3;
- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation CIDVUIProofingAvailabilityProvider

- (_TtC9CoreIDVUI34CIDVUIProofingAvailabilityProvider)init
{
  id v2 = objc_allocWithZone((Class)sub_21F54FA60());
  uint64_t v3 = sub_21F54FA50();
  v4 = (objc_class *)type metadata accessor for CIDVUIProofingAvailabilityProvider();
  v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC9CoreIDVUI34CIDVUIProofingAvailabilityProvider_connection] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = [(CIDVUIProofingAvailabilityProvider *)&v8 init];
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v6;
}

- (void)proofingFlowAvailabilityWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_267EDFEF8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267EDFF00;
  v12[5] = v11;
  v13 = self;
  sub_21F5285E4((uint64_t)v7, (uint64_t)&unk_267EDFF08, (uint64_t)v12);
  swift_release();
}

- (void)proofingStatusFor:(NSString *)a3 country:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_267EE0070);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_21F551710();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_267EDFEE8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_267EDF408;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_21F5285E4((uint64_t)v11, (uint64_t)&unk_267EDF410, (uint64_t)v16);
  swift_release();
}

- (void).cxx_destruct
{
}

@end