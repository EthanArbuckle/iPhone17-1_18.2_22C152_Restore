@interface CHSIconResolver
- (CHSIconResolver)init;
- (id)resolveIconVersionForExtensionIdentity:(id)a3;
- (void)resolveIconForContainerIdentity:(id)a3 completion:(id)a4;
@end

@implementation CHSIconResolver

- (CHSIconResolver)init
{
  uint64_t v3 = sub_190D415D8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ConcreteFileManagerFactory();
  uint64_t v7 = swift_allocObject();
  type metadata accessor for ConcreteImageIOPrimitives();
  uint64_t v8 = swift_allocObject();
  uint64_t v9 = qword_1E92AA818;
  v10 = self;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = __swift_project_value_buffer(v3, (uint64_t)qword_1E92AA870);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
  type metadata accessor for IconStore(0);
  uint64_t v12 = swift_allocObject();
  *(Class *)((char *)&v10->super.isa + OBJC_IVAR___CHSIconResolver_iconStore) = (Class)sub_190D3F448(v7, v8, (uint64_t)v6, v12);

  v15.receiver = v10;
  v15.super_class = (Class)CHSIconResolver;
  return [(CHSIconResolver *)&v15 init];
}

- (void)resolveIconForContainerIdentity:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_190D41978();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  sub_190D3F02C(v6, v8, (uint64_t)sub_190D3F434, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (id)resolveIconVersionForExtensionIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_190D3F1E4((uint64_t)v4);
  uint64_t v7 = v6;

  if (v7)
  {
    uint64_t v8 = (void *)sub_190D41948();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (void).cxx_destruct
{
}

@end