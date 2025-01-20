@interface HRInternalStateProvider
- (HRInternalStateProvider)init;
- (HRInternalStateProvider)initWithHealthStore:(id)a3;
- (HRInternalStateProvider)initWithProfile:(id)a3;
- (void)clinicalIngestionStore:(id)a3 ingestionStateDidUpdateTo:(int64_t)a4;
- (void)conceptStore:(id)a3 indexManagerDidChangeState:(unint64_t)a4;
- (void)dealloc;
- (void)fetchJSONWithCompletion:(id)a3;
@end

@implementation HRInternalStateProvider

- (HRInternalStateProvider)initWithHealthStore:(id)a3
{
  id v4 = objc_allocWithZone(MEMORY[0x1E4F2AE08]);
  id v5 = a3;
  id v6 = objc_msgSend(v4, sel_initWithHealthStore_, v5);
  id v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F2B0A0]), sel_initWithHealthStore_, v5);
  id v8 = objc_allocWithZone((Class)type metadata accessor for InternalStateProvider());
  v9 = (HRInternalStateProvider *)sub_1C2378DF8(v6, v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v9;
}

- (HRInternalStateProvider)initWithProfile:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, sel_conceptStore);
  id v5 = objc_msgSend(v3, sel_healthRecordsStore);
  id v6 = objc_allocWithZone((Class)type metadata accessor for InternalStateProvider());
  id v7 = (HRInternalStateProvider *)sub_1C2378DF8(v4, v5);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)dealloc
{
  v2 = self;
  InternalStateProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___HRInternalStateProvider_healthExperienceStore);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1C221794C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HRInternalStateProvider_changeHandler));
  swift_release();
}

- (void)fetchJSONWithCompletion:(id)a3
{
  sub_1C237EDF0(0, (unint64_t *)&qword_1EBB6F490, MEMORY[0x1E4FBCFE8], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v5 - 8);
  id v7 = (char *)&v14 - v6;
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1C254F840();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA2E1EE0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA2E1EF0;
  v12[5] = v11;
  v13 = self;
  sub_1C237D5CC((uint64_t)v7, (uint64_t)&unk_1EA2E1F00, (uint64_t)v12);
  swift_release();
}

- (HRInternalStateProvider)init
{
  result = (HRInternalStateProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)clinicalIngestionStore:(id)a3 ingestionStateDidUpdateTo:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1C237E640(a4);
}

- (void)conceptStore:(id)a3 indexManagerDidChangeState:(unint64_t)a4
{
  id v5 = a3;
  id v6 = self;
  _s15HealthRecordsUI21InternalStateProviderC12conceptStore_21indexManagerDidChangeySo09HKConceptH0C_So0m5IndexjE0VtF_0();
}

@end