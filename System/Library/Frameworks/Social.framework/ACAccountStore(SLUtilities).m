@interface ACAccountStore(SLUtilities)
+ (uint64_t)SLDuplicateAccountExistsForAccount:()SLUtilities withTypeIdentifier:andAccountPropertyIDKey:;
@end

@implementation ACAccountStore(SLUtilities)

+ (uint64_t)SLDuplicateAccountExistsForAccount:()SLUtilities withTypeIdentifier:andAccountPropertyIDKey:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = objc_opt_new();
  v11 = [v10 accountTypeWithAccountTypeIdentifier:v8];
  [v10 accountsWithAccountType:v11];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v12)
  {
    v22 = v11;
    v23 = v10;
    id v24 = v8;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v16 = objc_msgSend(v15, "accountPropertyForKey:", v9, v22, v23, v24);
        v17 = [v7 accountPropertyForKey:v9];
        v18 = [v7 identifier];
        v19 = [v15 identifier];
        if (([v18 isEqualToString:v19] & 1) != 0 || !v16)
        {
        }
        else
        {
          char v20 = [v16 isEqualToString:v17];

          if (v20)
          {

            uint64_t v12 = 1;
            goto LABEL_13;
          }
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
LABEL_13:
    v10 = v23;
    id v8 = v24;
    v11 = v22;
  }

  return v12;
}

@end