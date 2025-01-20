@interface CNACAccountProvider
+ (id)providerWithAccounts:(id)a3;
+ (id)providerWithStore:(id)a3;
- (BOOL)isAccountSyncable:(id)a3;
- (BOOL)isAnyAccountSyncableIgnoringAccount:(id)a3;
- (id)accountsWithAccountType:(id)a3;
- (id)allAccountTypes;
- (id)childAccountsForAccount:(id)a3;
@end

@implementation CNACAccountProvider

+ (id)providerWithStore:(id)a3
{
  id v3 = a3;
  v4 = [[_CNACAccountStoreBasedProvider alloc] initWithAccountStore:v3];

  return v4;
}

+ (id)providerWithAccounts:(id)a3
{
  id v3 = a3;
  v4 = [[_CNACAccountStaticProvider alloc] initWithAccounts:v3];

  return v4;
}

- (id)allAccountTypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)accountsWithAccountType:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)childAccountsForAccount:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isAccountSyncable:(id)a3
{
  return 0;
}

- (BOOL)isAnyAccountSyncableIgnoringAccount:(id)a3
{
  return 0;
}

@end