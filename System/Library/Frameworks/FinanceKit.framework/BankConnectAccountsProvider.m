@interface BankConnectAccountsProvider
+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3;
+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 returnError:(id *)a4;
- (FKBankConnectAccountsProviderDelegate)delegate;
- (_TtC10FinanceKit27BankConnectAccountsProvider)init;
- (void)accountAndReconsentStatusWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BankConnectAccountsProvider

- (FKBankConnectAccountsProviderDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x245680210](v2);

  return (FKBankConnectAccountsProviderDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3
{
  uint64_t v3 = sub_2439582D0();
  id v5 = sub_24363FDE8(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 returnError:(id *)a4
{
  uint64_t v4 = sub_2439582D0();
  id v6 = sub_24363FEE8(v4, v5);
  swift_bridgeObjectRelease();

  return v6;
}

- (void)accountAndReconsentStatusWithCompletion:(id)a3
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
  v11[4] = &unk_268D9CA80;
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

- (_TtC10FinanceKit27BankConnectAccountsProvider)init
{
  result = (_TtC10FinanceKit27BankConnectAccountsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_consentStore);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_persistentHistoryTransactionProvider);
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_lastNotificationToken));
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit27BankConnectAccountsProvider_delegate;

  sub_2434F0BE8((uint64_t)v3);
}

@end