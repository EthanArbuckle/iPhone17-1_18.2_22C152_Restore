@interface CNACAccountStoreBasedProvider
@end

@implementation CNACAccountStoreBasedProvider

uint64_t __70___CNACAccountStoreBasedProvider_isAnyAccountSyncableIgnoringAccount___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [*(id *)(a1 + 32) accountsWithAccountType:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __70___CNACAccountStoreBasedProvider_isAnyAccountSyncableIgnoringAccount___block_invoke_2;
  v6[3] = &unk_1E56A1F58;
  id v7 = *(id *)(a1 + 40);
  uint64_t v4 = objc_msgSend(v3, "_cn_any:", v6);

  return v4;
}

uint64_t __70___CNACAccountStoreBasedProvider_isAnyAccountSyncableIgnoringAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  if ([v4 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 0;
  }
  else
  {
    v6 = [v3 parentAccountIdentifier];
    if (v6 || (objc_msgSend(v3, "_cn_isManaged") & 1) != 0) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = [v3 isEnabledForDataclass:*MEMORY[0x1E4F17A90]];
    }
  }
  return v5;
}

@end