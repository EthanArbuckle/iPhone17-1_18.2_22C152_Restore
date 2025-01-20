@interface NSString(SGEntityMatchingTransformer)
- (id)stringByReplacingMatches:()SGEntityMatchingTransformer inRange:withBlock:;
- (uint64_t)expandRange:()SGEntityMatchingTransformer by:;
- (uint64_t)range;
@end

@implementation NSString(SGEntityMatchingTransformer)

- (id)stringByReplacingMatches:()SGEntityMatchingTransformer inRange:withBlock:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = a6;
  if ([v10 count])
  {
    v30 = a1;
    unint64_t v31 = a4 + a5;
    id v12 = (id)objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v29 = v10;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1CB79B230]();
          if ([v17 valueRange] >= a4)
          {
            uint64_t v19 = [v17 valueRange];
            unint64_t v21 = v19 + v20;
            if (v19 + v20 > v31)
            {
              goto LABEL_15;
            }
            v22 = (void *)MEMORY[0x1CB79B230]();
            v23 = objc_msgSend(v30, "substringWithRange:", a4, objc_msgSend(v17, "valueRange") - a4);
            [v12 appendString:v23];

            v24 = (void *)MEMORY[0x1CB79B230]();
            v25 = v11[2](v11, v17);
            [v12 appendString:v25];

            a4 = v21;
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_15:

    v26 = (void *)MEMORY[0x1CB79B230]();
    v27 = objc_msgSend(v30, "substringWithRange:", a4, v31 - a4);
    [v12 appendString:v27];

    id v10 = v29;
  }
  else
  {
    id v12 = a1;
  }

  return v12;
}

- (uint64_t)expandRange:()SGEntityMatchingTransformer by:
{
  uint64_t v5 = (a3 - a5) & ~((a3 - a5) >> 63);
  [a1 length];
  return v5;
}

- (uint64_t)range
{
  return 0;
}

@end