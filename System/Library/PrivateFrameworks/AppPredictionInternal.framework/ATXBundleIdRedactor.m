@interface ATXBundleIdRedactor
- (ATXBundleIdRedactor)init;
- (void)redactWithBundleIds:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation ATXBundleIdRedactor

- (void)redactWithBundleIds:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD23A30);
  MEMORY[0x1F4188790](v7 - 8, v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = v11;
  v12[4] = self;
  uint64_t v13 = sub_1D13F27D8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA64E028;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA64E030;
  v15[5] = v14;
  v16 = a3;
  v17 = self;
  sub_1D1399050((uint64_t)v10, (uint64_t)&unk_1EA64E038, (uint64_t)v15);
  swift_release();
}

- (ATXBundleIdRedactor)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___ATXBundleIdRedactor_summarizationPipelineClient;
  sub_1D13F24E8();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_1D13F24D8();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(ATXBundleIdRedactor *)&v7 init];
}

- (void).cxx_destruct
{
}

@end