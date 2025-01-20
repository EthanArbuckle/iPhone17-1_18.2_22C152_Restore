@interface ACAccount(DigitalSeparation)
- (id)ds_accountEmails;
@end

@implementation ACAccount(DigitalSeparation)

- (id)ds_accountEmails
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  v3 = objc_msgSend(a1, "aa_primaryEmail");

  if (v3)
  {
    v4 = objc_msgSend(a1, "aa_primaryEmail");
    [v2 addObject:v4];
  }
  v5 = [a1 username];

  if (v5)
  {
    v6 = [a1 username];
    [v2 addObject:v6];
  }
  v7 = [a1 accountType];
  v8 = [v7 identifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x263EFAE80]];

  if (v9)
  {
    v10 = [a1 accountProperties];
    v11 = [v10 objectForKeyedSubscript:@"CalDAVPrincipals"];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    obuint64_t j = v11;
    uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(obj);
          }
          v13 = [obj objectForKeyedSubscript:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          v14 = [v13 objectForKeyedSubscript:@"PreferredCalendarUserAddresses"];

          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v28;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v28 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = [*(id *)(*((void *)&v27 + 1) + 8 * j) objectForKeyedSubscript:@"packedCalendarUserAddressAddress"];
                if ([v20 hasPrefix:@"mailto:"])
                {
                  v21 = [v20 substringFromIndex:objc_msgSend(@"mailto:", "length")];
                  [v2 addObject:v21];
                }
                else
                {
                  [v2 addObject:v20];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v17);
          }
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v25);
    }
  }
  v22 = [MEMORY[0x263EFFA08] setWithSet:v2];

  return v22;
}

@end