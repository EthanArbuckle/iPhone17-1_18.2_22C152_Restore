@interface NSError(DADAExtendedDescription)
- (id)DAExtendedDescription;
@end

@implementation NSError(DADAExtendedDescription)

- (id)DAExtendedDescription
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [a1 description];
  v3 = [a1 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"NSDetailedErrors"];
    if (v4)
    {
      v5 = [v2 stringByAppendingString:@"NSDetailedErrors: "];

      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = v4;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v21 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "DAExtendedDescription", (void)v20);
            if (v11)
            {
              uint64_t v12 = [v5 stringByAppendingString:v11];

              v5 = (void *)v12;
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v8);
      }
    }
    else
    {
      v16 = [a1 userInfo];
      v17 = [v16 description];

      if (v17)
      {
        uint64_t v18 = [v2 stringByAppendingString:v17];

        v2 = (void *)v18;
      }

      v5 = v2;
    }
  }
  else
  {
    v13 = [a1 userInfo];
    v14 = [v13 description];

    if (v14)
    {
      uint64_t v15 = [v2 stringByAppendingString:v14];

      v2 = (void *)v15;
    }

    v5 = v2;
  }

  return v5;
}

@end