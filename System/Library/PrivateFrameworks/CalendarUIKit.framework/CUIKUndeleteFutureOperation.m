@interface CUIKUndeleteFutureOperation
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (Class)_inverseOperationClass;
- (id)_objectsForInverse;
@end

@implementation CUIKUndeleteFutureOperation

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  return 0;
}

- (Class)_inverseOperationClass
{
  return (Class)objc_opt_class();
}

- (id)_objectsForInverse
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(CUIKUserOperation *)self objects];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(CUIKUserOperation *)self objects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) originalPostSliceDescription];
        v12 = [v11 originalEventToSliceOn];

        [v5 addObject:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

@end