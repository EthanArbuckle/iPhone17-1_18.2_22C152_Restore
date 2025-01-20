@interface BankConnectBalanceNFCViewControllerProvider
+ (id)makeViewControllerWithFormattedBalance:(id)a3;
- (_TtC12FinanceKitUI43BankConnectBalanceNFCViewControllerProvider)init;
@end

@implementation BankConnectBalanceNFCViewControllerProvider

+ (id)makeViewControllerWithFormattedBalance:(id)a3
{
  sub_243DFE910();
  v3 = (void *)sub_243AE5F4C();
  swift_bridgeObjectRelease();

  return v3;
}

- (_TtC12FinanceKitUI43BankConnectBalanceNFCViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectBalanceNFCViewControllerProvider();
  return [(BankConnectBalanceNFCViewControllerProvider *)&v3 init];
}

@end