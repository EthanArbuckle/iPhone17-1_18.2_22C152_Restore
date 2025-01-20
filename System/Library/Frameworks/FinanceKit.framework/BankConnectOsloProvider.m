@interface BankConnectOsloProvider
+ (id)makeProviderAndReturnError:(id *)a3;
- (_TtC10FinanceKit23BankConnectOsloProvider)init;
- (void)dealloc;
- (void)listenForAccountsWithPrimaryAccountIdentifiers:(id)a3 callback:(id)a4;
@end

@implementation BankConnectOsloProvider

+ (id)makeProviderAndReturnError:(id *)a3
{
  if (qword_26B0C5770 != -1) {
    swift_once();
  }
  v3 = off_26B0C5E08;
  v4 = (objc_class *)type metadata accessor for BankConnectOsloProvider();
  v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_consentsTask] = 0;
  *(void *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_accountsTask] = 0;
  *(void *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_balancesTask] = 0;
  *(void *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_callbackCancellable] = 0;
  *(void *)&v5[OBJC_IVAR____TtC10FinanceKit23BankConnectOsloProvider_financeStore] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  swift_retain();
  id v6 = objc_msgSendSuper2(&v8, sel_init);

  return v6;
}

- (void)listenForAccountsWithPrimaryAccountIdentifiers:(id)a3 callback:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_2439588E0();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  objc_super v8 = self;
  sub_243445004(v6, (uint64_t)sub_2433FB428, v7);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_243446C9C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for BankConnectOsloProvider();
  [(BankConnectOsloProvider *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (_TtC10FinanceKit23BankConnectOsloProvider)init
{
  result = (_TtC10FinanceKit23BankConnectOsloProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end