@interface CADACAccountStoreAccountsProvider
- (ACAccountStore)accountStore;
- (CADACAccountStoreAccountsProvider)initWithAccountStore:(id)a3;
- (id)accountWithIdentifier:(id)a3;
- (id)accounts;
@end

@implementation CADACAccountStoreAccountsProvider

- (CADACAccountStoreAccountsProvider)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADACAccountStoreAccountsProvider;
  v6 = [(CADACAccountStoreAccountsProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accountStore, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (id)accounts
{
  v2 = [(CADACAccountStoreAccountsProvider *)self accountStore];
  v3 = [v2 accounts];

  return v3;
}

- (id)accountWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CADACAccountStoreAccountsProvider *)self accountStore];
  v6 = [v5 accountWithIdentifier:v4];

  return v6;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

@end