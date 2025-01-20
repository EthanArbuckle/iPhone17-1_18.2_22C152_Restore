@interface TransactionsListProvider
+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 dateFromYear:(id)a4 groupType:(unint64_t)a5;
- (FKBankConnectTransactionsListProviderDelegate)delegate;
- (_TtC10FinanceKit24TransactionsListProvider)init;
- (void)performFetchAndStartObservingNotifications;
- (void)setDelegate:(id)a3;
@end

@implementation TransactionsListProvider

- (FKBankConnectTransactionsListProviderDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit24TransactionsListProvider_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x245680210](v2);

  return (FKBankConnectTransactionsListProviderDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 dateFromYear:(id)a4 groupType:(unint64_t)a5
{
  uint64_t v6 = sub_243957400();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2439582D0();
  uint64_t v12 = v11;
  sub_2439573A0();
  id v13 = sub_2438266B4(v10, v12, (uint64_t)v9, a5);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v13;
}

- (void)performFetchAndStartObservingNotifications
{
  v2 = self;
  sub_24382529C();
}

- (_TtC10FinanceKit24TransactionsListProvider)init
{
  result = (_TtC10FinanceKit24TransactionsListProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  sub_243763A44((uint64_t)self + OBJC_IVAR____TtC10FinanceKit24TransactionsListProvider_formatterConfiguration, (uint64_t (*)(void))type metadata accessor for FormatterConfiguration);
  v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit24TransactionsListProvider_dateFromYear;
  uint64_t v4 = sub_243957400();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = (char *)self + OBJC_IVAR____TtC10FinanceKit24TransactionsListProvider_delegate;

  sub_2434F0BE8((uint64_t)v5);
}

@end