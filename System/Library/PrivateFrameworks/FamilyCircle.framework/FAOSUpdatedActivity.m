@interface FAOSUpdatedActivity
- (FAOSUpdatedActivity)init;
- (FAOSUpdatedActivity)initWithHeartbeatActivityHandler:(id)a3;
- (void)checkinWithCompletionHandler:(id)a3;
- (void)unregister;
@end

@implementation FAOSUpdatedActivity

- (FAOSUpdatedActivity)initWithHeartbeatActivityHandler:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  v5 = (FAOSUpdatedActivity *)sub_1D2554B44((uint64_t)sub_1D255568C, v4);
  swift_release();
  return v5;
}

- (void)checkinWithCompletionHandler:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4AA1A0);
  MEMORY[0x1F4188790]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = self;
  uint64_t v9 = sub_1D25AACE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (void *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_1EA68E980;
  v10[5] = v8;
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA68E988;
  v11[5] = v10;
  v12 = self;
  sub_1D2571174((uint64_t)v6, (uint64_t)&unk_1EA68E990, (uint64_t)v11);
  swift_release();
}

- (void)unregister
{
  v2 = self;
  FAOSUpdatedActivity.unregister()();
}

- (FAOSUpdatedActivity)init
{
  result = (FAOSUpdatedActivity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end