@interface FKBankConnectAccountsProvider
- (FKBankConnectAccountsProvider)initWithPrimaryAccountIdentifier:(id)a3;
- (FKBankConnectAccountsProviderDelegate)delegate;
- (_TtC10FinanceKit27BankConnectAccountsProvider)dataProvider;
- (void)accountAndReconsentStatusWithCompletion:(id)a3;
- (void)setDataProvider:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FKBankConnectAccountsProvider

- (FKBankConnectAccountsProvider)initWithPrimaryAccountIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FKBankConnectAccountsProvider;
  v5 = [(FKBankConnectAccountsProvider *)&v11 init];
  if (v5
    && (+[BankConnectAccountsProvider makeProviderWithPrimaryAccountIdentifier:v4], uint64_t v6 = objc_claimAutoreleasedReturnValue(), dataProvider = v5->_dataProvider, v5->_dataProvider = (_TtC10FinanceKit27BankConnectAccountsProvider *)v6, dataProvider, !v5->_dataProvider))
  {
    v9 = os_log_create("com.apple.FinanceKit", "BankConnect");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FKBankConnectAccountsProvider initWithPrimaryAccountIdentifier:](v9);
    }

    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)accountAndReconsentStatusWithCompletion:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (FKBankConnectAccountsProviderDelegate)delegate
{
  return [(BankConnectAccountsProvider *)self->_dataProvider delegate];
}

- (_TtC10FinanceKit27BankConnectAccountsProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithPrimaryAccountIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_243363000, log, OS_LOG_TYPE_ERROR, "Error initializing FKBankConnectAccountsProvider: %@", (uint8_t *)&v1, 0xCu);
}

@end