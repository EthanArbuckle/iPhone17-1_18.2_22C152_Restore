@interface ACAccountStore(AppleID)
- (id)accountWithAppleID:()AppleID;
- (id)accountsWithAccountType:()AppleID appleID:;
@end

@implementation ACAccountStore(AppleID)

- (id)accountsWithAccountType:()AppleID appleID:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v22 = v6;
  v8 = [a1 accountsWithAccountType:v6];
  v9 = v8;
  if (!v7
    || (long long v26 = 0u,
        long long v27 = 0u,
        long long v24 = 0u,
        long long v25 = 0u,
        (uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16]) == 0))
  {
    v12 = 0;
    goto LABEL_17;
  }
  uint64_t v11 = v10;
  v12 = 0;
  uint64_t v13 = *(void *)v25;
  id obj = v9;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v25 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      v16 = [v15 username];
      if ([v7 caseInsensitiveCompare:v16])
      {
        v17 = [v15 accountProperties];
        v18 = [v17 objectForKeyedSubscript:@"originalUsername"];
        uint64_t v19 = [v7 caseInsensitiveCompare:v18];

        if (v19) {
          continue;
        }
        if (v12)
        {
LABEL_10:
          uint64_t v20 = [v12 arrayByAddingObject:v15];

          v12 = (void *)v20;
          continue;
        }
      }
      else
      {

        if (v12) {
          goto LABEL_10;
        }
      }
      v12 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
    }
    v9 = obj;
    uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v11);
LABEL_17:

  return v12;
}

- (id)accountWithAppleID:()AppleID
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F17750]];
  [a1 accountsWithAccountType:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "username", (void)v14);
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end