@interface ManagedInternalTransaction
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSDecimalNumber)amount;
- (NSDecimalNumber)foreignAmount;
- (NSDecimalNumber)foreignCurrencyExchangeRate;
- (NSString)currency;
- (NSString)foreignCurrency;
- (NSUUID)id;
- (_TtC10FinanceKit26ManagedInternalTransaction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
@end

@implementation ManagedInternalTransaction

- (_TtC10FinanceKit26ManagedInternalTransaction)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return [(ManagedInternalTransaction *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

- (BOOL)validateForInsert:(id *)a3
{
  return sub_2438B27A8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedInternalTransaction.validateForInsert());
}

- (BOOL)validateForUpdate:(id *)a3
{
  return sub_2438B27A8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))ManagedInternalTransaction.validateForUpdate());
}

- (NSUUID)id
{
  uint64_t v3 = sub_243957490();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v7 = self;
  id v8 = [(ManagedInternalTransaction *)v7 publicTransactionObject];
  id v9 = [v8 id];

  sub_243957460();
  v10 = (void *)sub_243957430();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v10;
}

- (NSDecimalNumber)amount
{
  return (NSDecimalNumber *)sub_2438B3DF0(self, (uint64_t)a2, (SEL *)&selRef_amount);
}

- (NSString)currency
{
  v2 = self;
  id v3 = [(ManagedInternalTransaction *)v2 publicTransactionObject];
  id v4 = objc_msgSend(v3, sel_currency);

  sub_2439582D0();
  uint64_t v5 = (void *)sub_2439582A0();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (NSDecimalNumber)foreignAmount
{
  return (NSDecimalNumber *)sub_2438B3DF0(self, (uint64_t)a2, (SEL *)&selRef_foreignAmount);
}

- (NSString)foreignCurrency
{
  v2 = self;
  id v3 = [(ManagedInternalTransaction *)v2 publicTransactionObject];
  id v4 = objc_msgSend(v3, sel_foreignCurrency);

  if (v4)
  {
    sub_2439582D0();

    uint64_t v5 = (void *)sub_2439582A0();
    swift_bridgeObjectRelease();
  }
  else
  {

    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (NSDecimalNumber)foreignCurrencyExchangeRate
{
  return (NSDecimalNumber *)sub_2438B3DF0(self, (uint64_t)a2, (SEL *)&selRef_foreignCurrencyExchangeRate);
}

@end