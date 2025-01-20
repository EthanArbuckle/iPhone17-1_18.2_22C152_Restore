@interface BCSParser
+ (id)parseString:(id)a3;
@end

@implementation BCSParser

+ (id)parseString:(id)a3
{
  v18[9] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = objc_msgSend(v3, "_bcs_trimmedString");
  if ([v4 length])
  {
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    v18[3] = objc_opt_class();
    v18[4] = objc_opt_class();
    v18[5] = objc_opt_class();
    v18[6] = objc_opt_class();
    v18[7] = objc_opt_class();
    v18[8] = objc_opt_class();
    [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:9];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "parseString:", v4, (void)v13);
          if (v10)
          {
            v11 = (BCSStringData *)v10;

            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    v11 = [[BCSStringData alloc] initWithString:v3];
LABEL_12:
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end