@interface CNACAccountStaticProvider
@end

@implementation CNACAccountStaticProvider

uint64_t __54___CNACAccountStaticProvider_accountsWithAccountType___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 accountType];
  v4 = [v3 identifier];
  v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [v4 isEqual:v5];

  return v6;
}

uint64_t __54___CNACAccountStaticProvider_childAccountsForAccount___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 first];
  v4 = [v3 identifier];
  v5 = [*(id *)(a1 + 32) identifier];
  uint64_t v6 = [v4 isEqualToString:v5];

  return v6;
}

uint64_t __48___CNACAccountStaticProvider_isAccountSyncable___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 identifier];
  v5 = [v3 identifier];

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

@end