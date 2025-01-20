@interface NSString(NSString_StringWithPositionalSpecifiersFormat)
+ (id)stringWithPositionalSpecifiersFormat:()NSString_StringWithPositionalSpecifiersFormat arguments:;
@end

@implementation NSString(NSString_StringWithPositionalSpecifiersFormat)

+ (id)stringWithPositionalSpecifiersFormat:()NSString_StringWithPositionalSpecifiersFormat arguments:
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v29 = a4;
  v6 = (void *)[v5 mutableCopy];
  v7 = [MEMORY[0x263EFF960] currentLocale];
  v8 = [v7 languageCode];
  int v9 = [v8 isEqualToString:@"th"];

  if (v9)
  {
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"[tt]", &stru_26E895688, 2, 0, objc_msgSend(v5, "length"));
    uint64_t v10 = [v6 copy];

    id v5 = (id)v10;
  }
  id v34 = 0;
  v11 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"%\\d\\$@" options:1 error:&v34];
  id v12 = v34;
  v27 = v11;
  v13 = v5;
  objc_msgSend(v11, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v25 = v12;
  if (!v12)
  {
    if (obj)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16, 0);
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = [*(id *)(*((void *)&v30 + 1) + 8 * i) range];
            v20 = objc_msgSend(v13, "substringWithRange:", v18, v19);
            v21 = (void *)[v20 mutableCopy];
            objc_msgSend(v21, "replaceOccurrencesOfString:withString:options:range:", @"%", &stru_26E895688, 1, 0, objc_msgSend(v21, "length"));
            objc_msgSend(v21, "replaceOccurrencesOfString:withString:options:range:", @"$@", &stru_26E895688, 1, 0, objc_msgSend(v21, "length"));
            v22 = objc_msgSend(v29, "objectAtIndexedSubscript:", (int)(objc_msgSend(v21, "intValue") - 1));
            objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", v20, v22, 1, 0, objc_msgSend(v6, "length"));
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v15);
      }
    }
  }
  v23 = objc_msgSend(v6, "copy", v25);

  return v23;
}

@end