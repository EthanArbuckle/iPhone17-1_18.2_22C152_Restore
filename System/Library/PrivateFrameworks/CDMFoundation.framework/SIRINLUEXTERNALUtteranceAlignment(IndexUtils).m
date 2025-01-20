@interface SIRINLUEXTERNALUtteranceAlignment(IndexUtils)
+ (uint64_t)subset:()IndexUtils of:;
- (BOOL)equalIndexes:()IndexUtils;
- (BOOL)overlaps:()IndexUtils;
- (BOOL)subsumedBy:()IndexUtils;
- (uint64_t)compareStartAndSize:()IndexUtils;
- (uint64_t)getEndIndex;
- (uint64_t)getStartIndex;
@end

@implementation SIRINLUEXTERNALUtteranceAlignment(IndexUtils)

- (uint64_t)compareStartAndSize:()IndexUtils
{
  id v4 = a3;
  v5 = [a1 spans];
  if ([v5 count])
  {
  }
  else
  {
    v6 = [v4 spans];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      uint64_t v16 = 0;
      goto LABEL_12;
    }
  }
  v8 = [a1 spans];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    v10 = [v4 spans];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      unsigned int v12 = [a1 getStartIndex];
      unsigned int v13 = [a1 getEndIndex];
      unsigned int v14 = [v4 getStartIndex];
      unsigned int v15 = [v4 getEndIndex];
      if (v12 >= v14)
      {
        if (v12 > v14) {
          goto LABEL_8;
        }
        if (v13 <= v15)
        {
          uint64_t v16 = v13 < v15;
          goto LABEL_12;
        }
      }
    }
    uint64_t v16 = -1;
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v16 = 1;
LABEL_12:

  return v16;
}

- (BOOL)equalIndexes:()IndexUtils
{
  id v4 = a3;
  v5 = [v4 spans];
  if (![v5 count])
  {

LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  v6 = [a1 spans];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_6;
  }
  int v8 = [v4 getStartIndex];
  if (v8 != [a1 getStartIndex]) {
    goto LABEL_6;
  }
  int v9 = [v4 getEndIndex];
  BOOL v10 = v9 == [a1 getEndIndex];
LABEL_7:

  return v10;
}

- (BOOL)overlaps:()IndexUtils
{
  id v4 = a3;
  v5 = [v4 spans];
  if (![v5 count])
  {

LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  v6 = [a1 spans];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_6;
  }
  unsigned int v8 = [a1 getStartIndex];
  if (v8 >= [v4 getEndIndex]) {
    goto LABEL_6;
  }
  unsigned int v9 = [a1 getEndIndex];
  BOOL v10 = v9 > [v4 getStartIndex];
LABEL_7:

  return v10;
}

- (BOOL)subsumedBy:()IndexUtils
{
  id v4 = a3;
  v5 = [v4 spans];
  if (![v5 count])
  {

LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }
  v6 = [a1 spans];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_6;
  }
  unsigned int v8 = [v4 getStartIndex];
  if (v8 > [a1 getStartIndex]) {
    goto LABEL_6;
  }
  unsigned int v9 = [v4 getEndIndex];
  BOOL v10 = v9 >= [a1 getEndIndex];
LABEL_7:

  return v10;
}

- (uint64_t)getEndIndex
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = objc_msgSend(a1, "spans", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    LODWORD(v4) = 0;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v1);
        }
        unsigned int v7 = [*(id *)(*((void *)&v9 + 1) + 8 * i) endIndex];
        if (v4 <= v7) {
          uint64_t v4 = v7;
        }
        else {
          uint64_t v4 = v4;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (uint64_t)getStartIndex
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v2 = [a1 spans];
  uint64_t v3 = [v2 count];

  if (!v3) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(a1, "spans", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    LODWORD(v8) = -1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) startIndex];
        if (v8 >= v10) {
          uint64_t v8 = v10;
        }
        else {
          uint64_t v8 = v8;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

+ (uint64_t)subset:()IndexUtils of:
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    if ([v5 count])
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = v6;
      uint64_t v7 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        id v26 = v6;
        uint64_t v9 = *(void *)v41;
        uint64_t v27 = *(void *)v41;
        id v28 = v5;
        while (2)
        {
          uint64_t v10 = 0;
          uint64_t v29 = v8;
          do
          {
            if (*(void *)v41 != v9) {
              objc_enumerationMutation(obj);
            }
            long long v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
            unint64_t v12 = objc_msgSend(v5, "count", v26);
            if (v12 <= [v11 count])
            {
              uint64_t v31 = v10;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v13 = v5;
              uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
              if (!v14)
              {
LABEL_31:

                uint64_t v24 = 1;
                id v5 = v28;
                goto LABEL_32;
              }
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v37;
              while (1)
              {
                uint64_t v17 = 0;
LABEL_12:
                if (*(void *)v37 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * v17);
                long long v32 = 0u;
                long long v33 = 0u;
                long long v34 = 0u;
                long long v35 = 0u;
                id v19 = v11;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
                if (!v20) {
                  break;
                }
                uint64_t v21 = v20;
                uint64_t v22 = *(void *)v33;
LABEL_16:
                uint64_t v23 = 0;
                while (1)
                {
                  if (*(void *)v33 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  if (*(void *)(*((void *)&v32 + 1) + 8 * v23) == v18) {
                    break;
                  }
                  if (v21 == ++v23)
                  {
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
                    if (v21) {
                      goto LABEL_16;
                    }
                    goto LABEL_26;
                  }
                }

                if (++v17 != v15) {
                  goto LABEL_12;
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v45 count:16];
                if (!v15) {
                  goto LABEL_31;
                }
              }
LABEL_26:

              uint64_t v9 = v27;
              id v5 = v28;
              uint64_t v8 = v29;
              uint64_t v10 = v31;
            }
            ++v10;
          }
          while (v10 != v8);
          uint64_t v8 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
          if (v8) {
            continue;
          }
          break;
        }
        uint64_t v24 = 0;
LABEL_32:
        id v6 = v26;
      }
      else
      {
        uint64_t v24 = 0;
      }
    }
    else
    {
      uint64_t v24 = 1;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

@end