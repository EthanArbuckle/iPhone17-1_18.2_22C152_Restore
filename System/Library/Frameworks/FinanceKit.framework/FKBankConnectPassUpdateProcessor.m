@interface FKBankConnectPassUpdateProcessor
+ (id)makeProcessor;
- (FKBankConnectPassUpdateProcessor)init;
- (void)didDeletePassWithPrimaryAccountIdentifier:(NSString *)a3 completion:(id)a4;
- (void)didProvisionPassWithPrimaryAccountIdentifier:(NSString *)a3 completion:(id)a4;
@end

@implementation FKBankConnectPassUpdateProcessor

+ (id)makeProcessor
{
  v2 = sub_2433DF2F0();

  return v2;
}

- (void)didDeletePassWithPrimaryAccountIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268D97E38;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268D97E40;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_243937CA0((uint64_t)v9, (uint64_t)&unk_268D97E48, (uint64_t)v14);
  swift_release();
}

- (void)didProvisionPassWithPrimaryAccountIdentifier:(NSString *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268D97E20;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268DA2C50;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_243937CA0((uint64_t)v9, (uint64_t)&unk_268D9CA90, (uint64_t)v14);
  swift_release();
}

- (FKBankConnectPassUpdateProcessor)init
{
  v2 = (char *)self + OBJC_IVAR___FKBankConnectPassUpdateProcessor_messagesManager;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((void *)v2 + 4) = 0;
  v3 = (char *)self + OBJC_IVAR___FKBankConnectPassUpdateProcessor_evaluationManager;
  *((void *)v3 + 4) = 0;
  *(_OWORD *)v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FKBankConnectPassUpdateProcessor_store) = 0;
  v5.receiver = self;
  v5.super_class = (Class)FKBankConnectPassUpdateProcessor;
  return [(FKBankConnectPassUpdateProcessor *)&v5 init];
}

- (void).cxx_destruct
{
  sub_24337C1BC((uint64_t)self + OBJC_IVAR___FKBankConnectPassUpdateProcessor_messagesManager, &qword_26B0C7978);
  sub_24337C1BC((uint64_t)self + OBJC_IVAR___FKBankConnectPassUpdateProcessor_evaluationManager, &qword_26B0C7980);

  swift_release();
}

@end