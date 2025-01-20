@interface BankConnectEvaluationManagerWrapper
- (BOOL)hasAnyConnectedCardWithBankConnect;
- (BOOL)hasAnyEligibleBankConnectCard;
- (_TtC10FinanceKit35BankConnectEvaluationManagerWrapper)init;
- (void)reevaluateEligibilityAndReturnShouldReloadDiscoveryItemsWithCompletionHandler:(id)a3;
- (void)reevaluateEligibilityWithCompletionHandler:(id)a3;
@end

@implementation BankConnectEvaluationManagerWrapper

- (_TtC10FinanceKit35BankConnectEvaluationManagerWrapper)init
{
  return (_TtC10FinanceKit35BankConnectEvaluationManagerWrapper *)BankConnectEvaluationManagerWrapper.init()();
}

- (void)reevaluateEligibilityWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268D9D978;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268D9D980;
  v12[5] = v11;
  v13 = self;
  sub_243937CA0((uint64_t)v7, (uint64_t)&unk_268D9D988, (uint64_t)v12);
  swift_release();
}

- (void)reevaluateEligibilityAndReturnShouldReloadDiscoveryItemsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_268D9D968;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_268DA2C50;
  v12[5] = v11;
  v13 = self;
  sub_243937CA0((uint64_t)v7, (uint64_t)&unk_268D9CA90, (uint64_t)v12);
  swift_release();
}

- (BOOL)hasAnyEligibleBankConnectCard
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit35BankConnectEvaluationManagerWrapper_manager);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = self;
  char v8 = v6(v4, v5);

  return v8 & 1;
}

- (BOOL)hasAnyConnectedCardWithBankConnect
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit35BankConnectEvaluationManagerWrapper_manager);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 24);
  v7 = self;
  char v8 = v6(v4, v5);

  return v8 & 1;
}

- (void).cxx_destruct
{
}

@end