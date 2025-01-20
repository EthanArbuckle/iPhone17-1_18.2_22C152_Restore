@interface AXLTSegmentUtilities
+ (BOOL)isPuncuation:(id)a3;
+ (id)mergeOldSegments:(id)a3 withNewSegments:(id)a4;
@end

@implementation AXLTSegmentUtilities

+ (id)mergeOldSegments:(id)a3 withNewSegments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  v8 = v5;
  if (v7 && (uint64_t v9 = [v5 count], v8 = v6, v9))
  {
    id v10 = (id)objc_opt_new();
    id v26 = v5;
    unint64_t v11 = [v5 count];
    unint64_t v12 = [v6 count];
    if (v11 >= v12) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = v11;
    }
    if (v13 >= 1)
    {
      uint64_t v14 = 0;
      unint64_t v15 = 0;
      id v5 = v26;
      uint64_t v25 = v13;
      while (1)
      {
        v16 = [v5 objectAtIndexedSubscript:v14];
        v17 = [v6 objectAtIndexedSubscript:v15];
        v18 = [v16 substring];
        v19 = [v17 substring];
        if ([v18 isEqualToString:v19])
        {
          [v10 addObject:v16];
          ++v14;
          ++v15;
        }
        else
        {
          int v20 = [a1 isPuncuation:v18];
          int v21 = [a1 isPuncuation:v19];
          int v22 = v21 ^ 1;
          if ((v20 ^ 1) & 1) != 0 || (v22)
          {
            if ((v20 ^ 1 | v21))
            {
              if ((v20 | v22))
              {
                uint64_t v13 = v25;
                if (((v20 | v21) & 1) == 0)
                {
                  [v10 addObject:v16];
                  ++v14;
                  ++v15;
                }
                id v5 = v26;
                goto LABEL_20;
              }
              ++v15;
            }
            else
            {
              ++v14;
            }
          }
          else
          {
            [v10 addObject:v16];
            ++v14;
            ++v15;
          }
          uint64_t v13 = v25;
          id v5 = v26;
        }
LABEL_20:

        if (v14 >= v13 || (uint64_t)v15 >= v13) {
          goto LABEL_26;
        }
      }
    }
    unint64_t v15 = 0;
    id v5 = v26;
LABEL_26:
    if ([v6 count] > v15 && v15 < objc_msgSend(v6, "count"))
    {
      do
      {
        v23 = [v6 objectAtIndexedSubscript:v15];
        [v10 addObject:v23];

        ++v15;
      }
      while (v15 < [v6 count]);
      id v5 = v26;
    }
  }
  else
  {
    id v10 = v8;
  }

  return v10;
}

+ (BOOL)isPuncuation:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = [MEMORY[0x263F08708] punctuationCharacterSet];
    id v5 = [v3 stringByTrimmingCharactersInSet:v4];
    BOOL v6 = [v5 length] == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end