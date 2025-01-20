@interface CNAccount
@end

@implementation CNAccount

uint64_t __64__CNAccount_UIAdditions___cnui_canRequestRefreshWithCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend((id)objc_opt_class(), "_cnui_accountStore");
  v3 = [v2 accountIdentifiersEnabledToSyncDataclass:*MEMORY[0x1E4F17A90]];
  [v3 count];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void __61__CNAccount_UIAdditions___cnui_requestRefreshWithUserAction___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend((id)objc_opt_class(), "_cnui_accountStore");
  v3 = [v2 accountIdentifiersEnabledToSyncDataclass:*MEMORY[0x1E4F17A90]];

  if ([v3 count])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
          v9 = [MEMORY[0x1E4F5E950] sharedConnection];
          [v9 updateContentsOfAllFoldersForAccountID:v8 andDataclasses:2 isUserRequested:*(unsigned __int8 *)(a1 + 48)];

          v10 = [MEMORY[0x1E4F5E950] sharedConnection];
          [v10 updateFolderListForAccountID:v8 andDataclasses:2 isUserRequested:*(unsigned __int8 *)(a1 + 48)];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
}

@end