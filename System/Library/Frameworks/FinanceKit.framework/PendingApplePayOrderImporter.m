@interface PendingApplePayOrderImporter
+ (id)makeImporterAndReturnError:(id *)a3;
- (_TtC10FinanceKit28PendingApplePayOrderImporter)init;
- (void)insertOrUpdatePendingApplePayOrderWithOrderDetails:(id)a3;
@end

@implementation PendingApplePayOrderImporter

- (_TtC10FinanceKit28PendingApplePayOrderImporter)init
{
  result = (_TtC10FinanceKit28PendingApplePayOrderImporter *)sub_243959540();
  __break(1u);
  return result;
}

+ (id)makeImporterAndReturnError:(id *)a3
{
  id v3 = sub_24375858C();

  return v3;
}

- (void)insertOrUpdatePendingApplePayOrderWithOrderDetails:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24375750C(v4);
}

- (void).cxx_destruct
{
}

@end