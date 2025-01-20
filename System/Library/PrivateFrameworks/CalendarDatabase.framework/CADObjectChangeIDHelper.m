@interface CADObjectChangeIDHelper
+ (id)makeObjectChangeEntityTypeMapToArray:(id)a3;
+ (id)makeObjectChangeEntityTypeMapToSet:(id)a3;
@end

@implementation CADObjectChangeIDHelper

+ (id)makeObjectChangeEntityTypeMapToArray:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "entityType", (void)v16));
        v12 = [v4 objectForKey:v11];

        if (!v12)
        {
          v12 = [MEMORY[0x1E4F1CA48] array];
          v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "entityType"));
          [v4 setObject:v12 forKey:v13];
        }
        v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "changeID"));
        [v12 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)makeObjectChangeEntityTypeMapToSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "entityType", (void)v16));
        v12 = [v4 objectForKey:v11];

        if (!v12)
        {
          v12 = [MEMORY[0x1E4F1CA80] set];
          v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "entityType"));
          [v4 setObject:v12 forKey:v13];
        }
        v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "changeID"));
        [v12 addObject:v14];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

@end