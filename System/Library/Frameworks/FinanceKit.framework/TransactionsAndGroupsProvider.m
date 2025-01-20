@interface TransactionsAndGroupsProvider
+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3;
+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 fixedNumberOfLatestTransactions:(int64_t)a4;
- (FKBankConnectTransactionsAndGroupsProviderDelegate)delegate;
- (_TtC10FinanceKit29TransactionsAndGroupsProvider)init;
- (void)performFetchAndStartObservingNotifications;
- (void)setDelegate:(id)a3;
@end

@implementation TransactionsAndGroupsProvider

- (FKBankConnectTransactionsAndGroupsProviderDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit29TransactionsAndGroupsProvider_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x245680210](v2);

  return (FKBankConnectTransactionsAndGroupsProviderDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3
{
  uint64_t v3 = sub_2439582D0();
  id v5 = sub_2437625D8(v3, v4, 10);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)makeProviderWithPrimaryAccountIdentifier:(id)a3 fixedNumberOfLatestTransactions:(int64_t)a4
{
  uint64_t v5 = sub_2439582D0();
  id v7 = sub_2437625D8(v5, v6, a4);
  swift_bridgeObjectRelease();

  return v7;
}

- (void)performFetchAndStartObservingNotifications
{
  v2 = self;
  sub_24375F50C();
}

- (_TtC10FinanceKit29TransactionsAndGroupsProvider)init
{
  result = (_TtC10FinanceKit29TransactionsAndGroupsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  sub_243763A44((uint64_t)self + OBJC_IVAR____TtC10FinanceKit29TransactionsAndGroupsProvider_formatterConfiguration, (uint64_t (*)(void))type metadata accessor for FormatterConfiguration);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit29TransactionsAndGroupsProvider_delegate;

  sub_2434F0BE8((uint64_t)v3);
}

@end