@interface FKWalletExposedDB
- (BOOL)deleteAppleAccountWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAssociatedAppleAccountWithIdentifier:(id)a4 error:(id *)a5;
- (BOOL)insertOrUpdateAccount:(id)a3 error:(id *)a4;
- (BOOL)insertOrUpdateTransactions:(id)a3 forAppleAccountWithID:(id)a4 error:(id *)a5;
- (FKWalletExposedDB)init;
- (_TtC10FinanceKit15WalletExposedDB)walletExposedDB;
- (id)fetchAppleAccountsWithError:(id *)a3;
- (void)init;
- (void)setWalletExposedDB:(id)a3;
@end

@implementation FKWalletExposedDB

- (FKWalletExposedDB)init
{
  v10.receiver = self;
  v10.super_class = (Class)FKWalletExposedDB;
  v2 = [(FKWalletExposedDB *)&v10 init];
  if (!v2) {
    goto LABEL_4;
  }
  id v9 = 0;
  uint64_t v3 = +[WalletExposedDB makeClassAndReturnError:&v9];
  id v4 = v9;
  walletExposedDB = v2->_walletExposedDB;
  v2->_walletExposedDB = (_TtC10FinanceKit15WalletExposedDB *)v3;

  if (v2->_walletExposedDB)
  {

LABEL_4:
    v6 = v2;
    goto LABEL_8;
  }
  v7 = os_log_create("com.apple.FinanceKit", "Store");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    [(FKWalletExposedDB *)(uint64_t)v4 init];
  }

  v6 = 0;
LABEL_8:

  return v6;
}

- (id)fetchAppleAccountsWithError:(id *)a3
{
  id v4 = [(FKWalletExposedDB *)self walletExposedDB];
  v5 = [v4 fetchAppleAccountsAndReturnError:a3];

  return v5;
}

- (BOOL)insertOrUpdateAccount:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(FKWalletExposedDB *)self walletExposedDB];
  id v10 = 0;
  [v7 insertOrUpdateWithAppleAccount:v6 error:&v10];

  id v8 = v10;
  if (a4) {
    *a4 = v8;
  }

  return v8 == 0;
}

- (BOOL)deleteAppleAccountWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(FKWalletExposedDB *)self walletExposedDB];
  id v10 = 0;
  [v7 deleteAppleAccountWith:v6 error:&v10];

  id v8 = v10;
  if (a4) {
    *a4 = v8;
  }

  return v8 == 0;
}

- (BOOL)insertOrUpdateTransactions:(id)a3 forAppleAccountWithID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(FKWalletExposedDB *)self walletExposedDB];
  id v13 = 0;
  [v10 insertOrUpdateTransactions:v9 forAppleAccountWithID:v8 error:&v13];

  id v11 = v13;
  if (a5) {
    *a5 = v11;
  }

  return v11 == 0;
}

- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAssociatedAppleAccountWithIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(FKWalletExposedDB *)self walletExposedDB];
  id v13 = 0;
  [v10 deleteTransactionsWithIdentifiers:v9 forAppleAccountIdentifier:v8 error:&v13];

  id v11 = v13;
  if (a5) {
    *a5 = v11;
  }

  return v11 == 0;
}

- (_TtC10FinanceKit15WalletExposedDB)walletExposedDB
{
  return self->_walletExposedDB;
}

- (void)setWalletExposedDB:(id)a3
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
  _os_log_error_impl(&dword_243363000, a2, OS_LOG_TYPE_ERROR, "Error initializing WalletExposedDB: %@", (uint8_t *)&v2, 0xCu);
}

@end