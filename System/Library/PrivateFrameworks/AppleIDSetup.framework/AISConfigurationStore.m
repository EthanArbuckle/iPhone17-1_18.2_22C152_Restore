@interface AISConfigurationStore
- (AISChildAccountCutOffAgeResponse)cachedChildCutOffResponse;
- (AISConfigurationStore)init;
- (void)fetchMaxAgeForChildAccountWithCompletionHandler:(id)a3;
- (void)setCachedChildCutOffResponse:(id)a3;
@end

@implementation AISConfigurationStore

- (AISChildAccountCutOffAgeResponse)cachedChildCutOffResponse
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AISConfigurationStore_cachedChildCutOffResponse);
  swift_beginAccess();
  return (AISChildAccountCutOffAgeResponse *)*v2;
}

- (void)setCachedChildCutOffResponse:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AISConfigurationStore_cachedChildCutOffResponse);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (void)fetchMaxAgeForChildAccountWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2692D9520);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2481753D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2692DAC30;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2692D8140;
  v12[5] = v11;
  v13 = self;
  sub_248109968((uint64_t)v7, (uint64_t)&unk_2692D9540, (uint64_t)v12);
  swift_release();
}

- (AISConfigurationStore)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AISConfigurationStore_cachedChildCutOffResponse) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AISConfigurationStore();
  return [(AISConfigurationStore *)&v3 init];
}

- (void).cxx_destruct
{
}

@end