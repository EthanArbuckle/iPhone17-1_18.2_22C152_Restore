@interface FKBankConnectTransactionsListProvider
- (FKBankConnectTransactionsListProvider)initWithPrimaryAccountIdentifier:(id)a3 dateFromYear:(id)a4 groupType:(unint64_t)a5;
- (FKBankConnectTransactionsListProviderDelegate)delegate;
- (_TtC10FinanceKit24TransactionsListProvider)dataProvider;
- (void)performFetchAndStartObservingNotifications;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FKBankConnectTransactionsListProvider

- (FKBankConnectTransactionsListProvider)initWithPrimaryAccountIdentifier:(id)a3 dateFromYear:(id)a4 groupType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FKBankConnectTransactionsListProvider;
  v10 = [(FKBankConnectTransactionsListProvider *)&v14 init];
  if (v10)
  {
    uint64_t v11 = +[TransactionsListProvider makeProviderWithPrimaryAccountIdentifier:v8 dateFromYear:v9 groupType:a5];
    dataProvider = v10->_dataProvider;
    v10->_dataProvider = (_TtC10FinanceKit24TransactionsListProvider *)v11;
  }
  return v10;
}

- (void)performFetchAndStartObservingNotifications
{
}

- (void)setDelegate:(id)a3
{
}

- (FKBankConnectTransactionsListProviderDelegate)delegate
{
  return [(TransactionsListProvider *)self->_dataProvider delegate];
}

- (_TtC10FinanceKit24TransactionsListProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end