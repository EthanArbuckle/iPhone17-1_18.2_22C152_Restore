@interface HUAccessibilityIdentifierUtilities
+ (void)setAccessibilityIDForViews:(id)a3 withIDDictionary:(id)a4;
@end

@implementation HUAccessibilityIdentifierUtilities

+ (void)setAccessibilityIDForViews:(id)a3 withIDDictionary:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  obuint64_t j = a3;
  id v19 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v10 = v19;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(NSString **)(*((void *)&v20 + 1) + 8 * j);
              v16 = objc_opt_class();
              if ([v16 isEqual:NSClassFromString(v15)])
              {
                v17 = [v10 objectForKeyedSubscript:v15];
                [v9 setAccessibilityIdentifier:v17];

                goto LABEL_16;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
}

@end