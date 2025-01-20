@interface NSArray(ATXScoredAction)
- (id)atx_actionsFromActionResults;
@end

@implementation NSArray(ATXScoredAction)

- (id)atx_actionsFromActionResults
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = a1;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", (void)v16);
          [v14 handleFailureInMethod:a2 object:v5 file:@"NSArray+ATXScoredAction.mm" lineNumber:21 description:@"Array should only contains ATXActionResult object"];
        }
        id v10 = v9;
        v11 = [v10 scoredAction];
        BOOL v12 = v11 == 0;

        if (!v12)
        {
          v13 = [v10 scoredAction];
          [v4 addObject:v13];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v4;
}

@end