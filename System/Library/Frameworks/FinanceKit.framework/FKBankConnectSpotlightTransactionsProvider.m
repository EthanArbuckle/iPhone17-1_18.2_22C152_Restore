@interface FKBankConnectSpotlightTransactionsProvider
- (FKBankConnectSpotlightTransactionsProvider)init;
- (_TtC10FinanceKit40BankConnectSpotlightTransactionsProvider)spotlightProvider;
- (void)setSpotlightProvider:(id)a3;
- (void)transactionWithURL:(id)a3 completion:(id)a4;
@end

@implementation FKBankConnectSpotlightTransactionsProvider

- (FKBankConnectSpotlightTransactionsProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)FKBankConnectSpotlightTransactionsProvider;
  v2 = [(FKBankConnectSpotlightTransactionsProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[BankConnectSpotlightTransactionsProvider makeProvider];
    spotlightProvider = v2->_spotlightProvider;
    v2->_spotlightProvider = (_TtC10FinanceKit40BankConnectSpotlightTransactionsProvider *)v3;
  }
  return v2;
}

- (void)transactionWithURL:(id)a3 completion:(id)a4
{
}

- (_TtC10FinanceKit40BankConnectSpotlightTransactionsProvider)spotlightProvider
{
  return self->_spotlightProvider;
}

- (void)setSpotlightProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end