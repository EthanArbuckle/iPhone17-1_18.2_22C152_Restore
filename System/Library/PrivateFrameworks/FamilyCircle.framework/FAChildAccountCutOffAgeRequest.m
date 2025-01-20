@interface FAChildAccountCutOffAgeRequest
- (FAChildAccountCutOffAgeRequest)init;
- (FAChildAccountCutOffAgeRequest)initWithUrlProvider:(id)a3 urlSession:(id)a4;
- (void)fetchWithCompletionHandler:(id)a3;
@end

@implementation FAChildAccountCutOffAgeRequest

- (FAChildAccountCutOffAgeRequest)initWithUrlProvider:(id)a3 urlSession:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlProvider) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlSession) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeRequest();
  swift_unknownObjectRetain();
  id v5 = a4;
  return [(FAChildAccountCutOffAgeRequest *)&v7 init];
}

- (void)fetchWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB4AA1A0);
  MEMORY[0x1F4188790](v5 - 8);
  objc_super v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1D25AACE0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA68EDB8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA68E988;
  v12[5] = v11;
  v13 = self;
  sub_1D2571174((uint64_t)v7, (uint64_t)&unk_1EA68E990, (uint64_t)v12);
  swift_release();
}

- (FAChildAccountCutOffAgeRequest)init
{
  result = (FAChildAccountCutOffAgeRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlSession);
}

@end