@interface ACAccountStore
@end

@implementation ACAccountStore

uint64_t __93__ACAccountStore_ContactsFoundation__cardDAVAccountForPrimaryAppleAccountWithAppleID_logger___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 parentAccount];
  v4 = [v3 accountType];
  v5 = [v4 identifier];
  if ([v5 isEqualToString:*MEMORY[0x1E4F17750]])
  {
    v6 = [v2 parentAccount];
    uint64_t v7 = objc_msgSend(v6, "_cn_isPrimaryAccount");
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

@end