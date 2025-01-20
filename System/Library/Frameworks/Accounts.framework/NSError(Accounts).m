@interface NSError(Accounts)
- (id)ac_sanitizeObject:()Accounts;
- (id)ac_secureCodingError;
- (uint64_t)ac_isDiskFullSQLError;
- (uint64_t)ac_isUnrecoverableDatabaseError;
@end

@implementation NSError(Accounts)

- (uint64_t)ac_isUnrecoverableDatabaseError
{
  v2 = [a1 domain];
  uint64_t v3 = *MEMORY[0x1E4F1BF50];
  int v4 = [v2 isEqualToString:*MEMORY[0x1E4F1BF50]];

  v5 = (void *)MEMORY[0x1E4F281F8];
  if (v4)
  {
    v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
    if (!v6)
    {
LABEL_8:
      uint64_t v12 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    v6 = [a1 domain];
    if (![v6 isEqualToString:*v5])
    {
      uint64_t v12 = 0;
      goto LABEL_10;
    }
    v7 = [a1 userInfo];
    v8 = [v7 objectForKeyedSubscript:v3];

    if (!v8) {
      goto LABEL_8;
    }
    v9 = NSNumber;
    v10 = [a1 userInfo];
    v11 = [v10 objectForKeyedSubscript:v3];
    v6 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "integerValue"));

    if (!v6) {
      goto LABEL_8;
    }
  }
  uint64_t v12 = [&unk_1EFA15688 containsObject:v6];
LABEL_10:

LABEL_11:
  v13 = [a1 domain];
  if ([v13 isEqualToString:*v5])
  {
    uint64_t v14 = [a1 code];

    if (v14 == 259) {
      return 1;
    }
    else {
      return v12;
    }
  }
  else
  {
  }
  return v12;
}

- (uint64_t)ac_isDiskFullSQLError
{
  v2 = [a1 domain];
  uint64_t v3 = *MEMORY[0x1E4F1BF50];
  int v4 = [v2 isEqualToString:*MEMORY[0x1E4F1BF50]];

  if (!v4)
  {
    v5 = [a1 domain];
    if (![v5 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v11 = 0;
      goto LABEL_10;
    }
    v6 = [a1 userInfo];
    v7 = [v6 objectForKeyedSubscript:v3];

    if (!v7) {
      return 0;
    }
    v8 = NSNumber;
    v9 = [a1 userInfo];
    v10 = [v9 objectForKeyedSubscript:v3];
    v5 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v10, "integerValue"));

    if (!v5) {
      return 0;
    }
LABEL_7:
    uint64_t v11 = [&unk_1EFA156A0 containsObject:v5];
LABEL_10:

    return v11;
  }
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "code"));
  if (v5) {
    goto LABEL_7;
  }
  return 0;
}

- (id)ac_sanitizeObject:()Accounts
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 conformsToProtocol:&unk_1EFA18DB8])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v4, "ac_secureCodingError");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
      v6 = v5;
      goto LABEL_41;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = objc_opt_new();
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v8 = v4;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v36 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = objc_msgSend(a1, "ac_sanitizeObject:", *(void *)(*((void *)&v35 + 1) + 8 * i));
            if (v13) {
              [v6 addObject:v13];
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v10);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = objc_opt_new();
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v8 = v4;
        uint64_t v14 = [v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v32;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v32 != v16) {
                objc_enumerationMutation(v8);
              }
              v18 = objc_msgSend(a1, "ac_sanitizeObject:", *(void *)(*((void *)&v31 + 1) + 8 * j));
              if (v18) {
                [v6 addObject:v18];
              }
            }
            uint64_t v15 = [v8 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }
          while (v15);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v5 = v4;
          goto LABEL_4;
        }
        v6 = objc_opt_new();
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v8 = v4;
        uint64_t v19 = [v8 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v28;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v28 != v21) {
                objc_enumerationMutation(v8);
              }
              uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * k);
              v24 = objc_msgSend(v8, "objectForKeyedSubscript:", v23, (void)v27);
              v25 = objc_msgSend(a1, "ac_sanitizeObject:", v24);

              if (v25) {
                [v6 setObject:v25 forKey:v23];
              }
            }
            uint64_t v20 = [v8 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v20);
        }
      }
    }
  }
  else
  {
    v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[NSError(Accounts) ac_sanitizeObject:]((uint64_t)v4, v7);
    }

    v6 = 0;
  }
LABEL_41:

  return v6;
}

- (id)ac_secureCodingError
{
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = [a1 domain];
  uint64_t v4 = [a1 code];
  id v5 = [a1 userInfo];
  v6 = objc_msgSend(a1, "ac_sanitizeObject:", v5);
  v7 = [v2 errorWithDomain:v3 code:v4 userInfo:v6];

  return v7;
}

- (void)ac_sanitizeObject:()Accounts .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_DEBUG, "\"Removing object %@ error userInfo because it is not NSSecureCoding.\"", (uint8_t *)&v2, 0xCu);
}

@end