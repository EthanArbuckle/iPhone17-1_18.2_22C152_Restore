@interface _CNACAccountStoreBasedProvider
- (ACAccountStore)accountStore;
- (BOOL)isAccountSyncable:(id)a3;
- (BOOL)isAnyAccountSyncableIgnoringAccount:(id)a3;
- (_CNACAccountStoreBasedProvider)initWithAccountStore:(id)a3;
- (id)accountsWithAccountType:(id)a3;
- (id)allAccountTypes;
- (id)childAccountsForAccount:(id)a3;
@end

@implementation _CNACAccountStoreBasedProvider

- (_CNACAccountStoreBasedProvider)initWithAccountStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNACAccountStoreBasedProvider;
  v6 = [(_CNACAccountStoreBasedProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)allAccountTypes
{
  v2 = [(_CNACAccountStoreBasedProvider *)self accountStore];
  v3 = [v2 allAccountTypes];

  return v3;
}

- (id)accountsWithAccountType:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNACAccountStoreBasedProvider *)self accountStore];
  v6 = [v5 accountsWithAccountType:v4];

  return v6;
}

- (id)childAccountsForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNACAccountStoreBasedProvider *)self accountStore];
  v6 = [v5 childAccountsForAccount:v4];

  return v6;
}

- (BOOL)isAccountSyncable:(id)a3
{
  v3 = [a3 accountType];
  id v4 = [v3 syncableDataclasses];
  char v5 = [v4 containsObject:*MEMORY[0x1E4F17A90]];

  return v5;
}

- (BOOL)isAnyAccountSyncableIgnoringAccount:(id)a3
{
  uint64_t v4 = [a3 identifier];
  char v5 = (void *)v4;
  v6 = &stru_1EE0267A8;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  v7 = v6;

  v8 = [(_CNACAccountStoreBasedProvider *)self allAccountTypes];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70___CNACAccountStoreBasedProvider_isAnyAccountSyncableIgnoringAccount___block_invoke;
  v11[3] = &unk_1E56A1F80;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  LOBYTE(v7) = objc_msgSend(v8, "_cn_any:", v11);

  return (char)v7;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void).cxx_destruct
{
}

@end