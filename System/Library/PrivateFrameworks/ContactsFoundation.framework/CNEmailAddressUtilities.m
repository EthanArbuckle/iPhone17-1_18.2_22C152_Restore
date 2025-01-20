@interface CNEmailAddressUtilities
+ (BOOL)isStringEmailAddress:(id)a3;
+ (id)aliasedDomains;
+ (id)expandAliasedDomainsInAddress:(id)a3;
+ (id)makeEmailRegex;
+ (id)safeUserVisibleEmailAddress:(id)a3;
+ (void)makeEmailRegex;
@end

@implementation CNEmailAddressUtilities

+ (id)expandAliasedDomainsInAddress:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (off_1EE025420((uint64_t)&__block_literal_global_119, v3))
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = [(id)objc_opt_class() aliasedDomains];
    uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(obj);
          }
          v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __57__CNEmailAddressUtilities_expandAliasedDomainsInAddress___block_invoke;
          v19[3] = &unk_1E56A20C8;
          id v10 = v3;
          id v20 = v10;
          v11 = objc_msgSend(v9, "_cn_firstObjectPassingTest:", v19);
          if (v11)
          {
            v12 = v11;
            v13 = objc_msgSend(v10, "substringWithRange:", 0, objc_msgSend(v10, "length") - objc_msgSend(v11, "length"));
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __57__CNEmailAddressUtilities_expandAliasedDomainsInAddress___block_invoke_2;
            v17[3] = &unk_1E56A20F0;
            id v18 = v13;
            id v14 = v13;
            v4 = objc_msgSend(v9, "_cn_map:", v17);

            goto LABEL_13;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v25 = v3;
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  }
LABEL_13:

  return v4;
}

uint64_t __57__CNEmailAddressUtilities_expandAliasedDomainsInAddress___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cn_hasSuffix:", a2);
}

uint64_t __57__CNEmailAddressUtilities_expandAliasedDomainsInAddress___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) stringByAppendingString:a2];
}

+ (id)aliasedDomains
{
  return &unk_1EE04A900;
}

+ (id)safeUserVisibleEmailAddress:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 rangeOfString:@"@"];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = v4 + 1;
    uint64_t v7 = [v3 substringFromIndex:v4 + 1];
    v8 = objc_msgSend(v7, "_lp_userVisibleHost");
    if ([v7 isEqualToString:v8])
    {
      id v5 = v3;
    }
    else
    {
      v9 = [v3 substringToIndex:v6];
      id v5 = [v9 stringByAppendingString:v8];
    }
  }

  return v5;
}

+ (BOOL)isStringEmailAddress:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CNEmailAddressUtilities_isStringEmailAddress___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isStringEmailAddress__cn_once_token_1 != -1) {
    dispatch_once(&isStringEmailAddress__cn_once_token_1, block);
  }
  if (isStringEmailAddress__cn_once_object_1)
  {
    id v5 = (id)isStringEmailAddress__cn_once_object_1;
    uint64_t v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 4, 0, objc_msgSend(v4, "length"));

    BOOL v7 = v6 == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __48__CNEmailAddressUtilities_isStringEmailAddress___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) makeEmailRegex];
  uint64_t v2 = isStringEmailAddress__cn_once_object_1;
  isStringEmailAddress__cn_once_object_1 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)makeEmailRegex
{
  id v6 = 0;
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}+$" options:1 error:&v6];
  id v3 = v6;
  if (!v2)
  {
    id v4 = +[CNLogging sdkBreakageLog];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[CNEmailAddressUtilities makeEmailRegex];
    }
  }

  return v2;
}

+ (void)makeEmailRegex
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19091D000, a2, OS_LOG_TYPE_ERROR, "Error creating email address regex: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end