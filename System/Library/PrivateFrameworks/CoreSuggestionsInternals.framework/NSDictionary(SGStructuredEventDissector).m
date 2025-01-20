@interface NSDictionary(SGStructuredEventDissector)
- (id)sg_deepCopyWithoutEmptySchemaObjects;
- (uint64_t)sg_isEmptySchemaObject;
@end

@implementation NSDictionary(SGStructuredEventDissector)

- (uint64_t)sg_isEmptySchemaObject
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a1, "sg_deepCopyWithoutEmptySchemaObjects");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || !objc_msgSend(v6, "hasPrefix:", @"@", (void)v9))
        {
          uint64_t v7 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v7 = 1;
      if (v3) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 1;
  }
LABEL_13:

  return v7;
}

- (id)sg_deepCopyWithoutEmptySchemaObjects
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[a1 mutableCopy];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        long long v9 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v12);
        if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "sg_isEmptySchemaObject"))
        {
          [v2 setObject:0 forKeyedSubscript:v8];
        }
        else if (objc_opt_respondsToSelector())
        {
          long long v10 = objc_msgSend(v9, "sg_deepCopyWithoutEmptySchemaObjects");
          [v2 setObject:v10 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

@end