@interface FKBankConnectOsloProvider
- (FKBankConnectOsloProvider)init;
- (_TtC10FinanceKit23BankConnectOsloProvider)dataProvider;
- (void)init;
- (void)listenForAccountsWithPrimaryAccountIdentifiers:(id)a3 callback:(id)a4;
- (void)setDataProvider:(id)a3;
@end

@implementation FKBankConnectOsloProvider

- (FKBankConnectOsloProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)FKBankConnectOsloProvider;
  v2 = [(FKBankConnectOsloProvider *)&v10 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v9 = 0;
  uint64_t v3 = +[BankConnectOsloProvider makeProviderAndReturnError:&v9];
  id v4 = v9;
  dataProvider = v2->_dataProvider;
  v2->_dataProvider = (_TtC10FinanceKit23BankConnectOsloProvider *)v3;

  if (v2->_dataProvider)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = os_log_create("com.apple.FinanceKit", "BankConnect");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(FKBankConnectOsloProvider *)(uint64_t)v4 init];
  }

  v6 = 0;
LABEL_8:

  return v6;
}

- (void)listenForAccountsWithPrimaryAccountIdentifiers:(id)a3 callback:(id)a4
{
}

- (_TtC10FinanceKit23BankConnectOsloProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_243363000, a2, OS_LOG_TYPE_ERROR, "Error initializing FKBankConnectAccountBalancesProvider: %@", (uint8_t *)&v2, 0xCu);
}

@end