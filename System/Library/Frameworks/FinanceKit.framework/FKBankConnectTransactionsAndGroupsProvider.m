@interface FKBankConnectTransactionsAndGroupsProvider
- (FKBankConnectTransactionsAndGroupsProvider)initWithPrimaryAccountIdentifier:(id)a3;
- (FKBankConnectTransactionsAndGroupsProvider)initWithPrimaryAccountIdentifier:(id)a3 fixedNumberOfLatestTransactions:(unint64_t)a4;
- (FKBankConnectTransactionsAndGroupsProviderDelegate)delegate;
- (_TtC10FinanceKit29TransactionsAndGroupsProvider)dataProvider;
- (void)performFetchAndStartObservingNotifications;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FKBankConnectTransactionsAndGroupsProvider

- (FKBankConnectTransactionsAndGroupsProvider)initWithPrimaryAccountIdentifier:(id)a3 fixedNumberOfLatestTransactions:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FKBankConnectTransactionsAndGroupsProvider;
  v7 = [(FKBankConnectTransactionsAndGroupsProvider *)&v11 init];
  if (v7)
  {
    uint64_t v8 = +[TransactionsAndGroupsProvider makeProviderWithPrimaryAccountIdentifier:v6 fixedNumberOfLatestTransactions:a4];
    dataProvider = v7->_dataProvider;
    v7->_dataProvider = (_TtC10FinanceKit29TransactionsAndGroupsProvider *)v8;
  }
  return v7;
}

- (FKBankConnectTransactionsAndGroupsProvider)initWithPrimaryAccountIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKBankConnectTransactionsAndGroupsProvider;
  v5 = [(FKBankConnectTransactionsAndGroupsProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = +[TransactionsAndGroupsProvider makeProviderWithPrimaryAccountIdentifier:v4];
    dataProvider = v5->_dataProvider;
    v5->_dataProvider = (_TtC10FinanceKit29TransactionsAndGroupsProvider *)v6;
  }
  return v5;
}

- (void)performFetchAndStartObservingNotifications
{
}

- (void)setDelegate:(id)a3
{
}

- (FKBankConnectTransactionsAndGroupsProviderDelegate)delegate
{
  return [(TransactionsAndGroupsProvider *)self->_dataProvider delegate];
}

- (_TtC10FinanceKit29TransactionsAndGroupsProvider)dataProvider
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