@interface _CNACAccountStaticProvider
- (BOOL)isAccountSyncable:(id)a3;
- (NSArray)accountChildAccountsPairs;
- (_CNACAccountStaticProvider)initWithAccounts:(id)a3;
- (id)accountsWithAccountType:(id)a3;
- (id)allAccountTypes;
- (id)childAccountsForAccount:(id)a3;
@end

@implementation _CNACAccountStaticProvider

- (_CNACAccountStaticProvider)initWithAccounts:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNACAccountStaticProvider;
  v6 = [(_CNACAccountStaticProvider *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountChildAccountsPairs, a3);
    v8 = v7;
  }

  return v7;
}

- (id)allAccountTypes
{
  v2 = [(_CNACAccountStaticProvider *)self accountChildAccountsPairs];
  v3 = objc_msgSend(v2, "_cn_reduce:initialValue:", &__block_literal_global_71, MEMORY[0x1E4F1CBF0]);
  v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_23);

  return v4;
}

- (id)accountsWithAccountType:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNACAccountStaticProvider *)self accountChildAccountsPairs];
  v6 = objc_msgSend(v5, "_cn_reduce:initialValue:", &__block_literal_global_71, MEMORY[0x1E4F1CBF0]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54___CNACAccountStaticProvider_accountsWithAccountType___block_invoke;
  v10[3] = &unk_1E56A1F58;
  id v11 = v4;
  id v7 = v4;
  v8 = objc_msgSend(v6, "_cn_filter:", v10);

  return v8;
}

- (id)childAccountsForAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNACAccountStaticProvider *)self accountChildAccountsPairs];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54___CNACAccountStaticProvider_childAccountsForAccount___block_invoke;
  v10[3] = &unk_1E56A1FC8;
  id v11 = v4;
  id v6 = v4;
  id v7 = objc_msgSend(v5, "_cn_firstObjectPassingTest:", v10);
  v8 = [v7 second];

  return v8;
}

- (BOOL)isAccountSyncable:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNACAccountStaticProvider *)self accountChildAccountsPairs];
  id v6 = objc_msgSend(v5, "_cn_reduce:initialValue:", &__block_literal_global_71, MEMORY[0x1E4F1CBF0]);
  id v7 = objc_msgSend(v6, "_cn_filter:", &__block_literal_global_25);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48___CNACAccountStaticProvider_isAccountSyncable___block_invoke;
  v11[3] = &unk_1E56A1F58;
  id v12 = v4;
  id v8 = v4;
  char v9 = objc_msgSend(v7, "_cn_any:", v11);

  return v9;
}

- (NSArray)accountChildAccountsPairs
{
  return self->_accountChildAccountsPairs;
}

- (void).cxx_destruct
{
}

@end