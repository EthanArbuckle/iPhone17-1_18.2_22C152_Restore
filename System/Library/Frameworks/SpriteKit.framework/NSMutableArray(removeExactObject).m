@interface NSMutableArray(removeExactObject)
- (void)removeExactObject:()removeExactObject;
- (void)removeExactObjectsInArray:()removeExactObject;
@end

@implementation NSMutableArray(removeExactObject)

- (void)removeExactObject:()removeExactObject
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    int v7 = 0;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      int v10 = v7 + v6;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (*(id *)(*((void *)&v11 + 1) + 8 * v9) == v4)
        {

          objc_msgSend(v5, "removeObjectAtIndex:", v9 + v7, (void)v11);
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      int v7 = v10;
      if (v6) {
        continue;
      }
      break;
    }
  }

LABEL_11:
}

- (void)removeExactObjectsInArray:()removeExactObject
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v4 = [MEMORY[0x263F089C8] indexSet];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a1;
  uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    LODWORD(v6) = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      uint64_t v6 = (int)v6;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * v8);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v10 = v15;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v17;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v10);
              }
              if (v9 == *(void *)(*((void *)&v16 + 1) + 8 * v13)) {
                [v4 addIndex:v6];
              }
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v11);
        }

        ++v6;
        ++v8;
      }
      while (v8 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  [obj removeObjectsAtIndexes:v4];
}

@end