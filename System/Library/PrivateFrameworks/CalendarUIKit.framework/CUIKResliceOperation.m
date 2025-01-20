@interface CUIKResliceOperation
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (Class)_inverseOperationClass;
- (id)_objectsForInverse;
@end

@implementation CUIKResliceOperation

- (Class)_inverseOperationClass
{
  return 0;
}

- (id)_objectsForInverse
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(CUIKUserOperation *)self objects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [EKUndoSliceOutcome alloc];
        v11 = [v9 originalPostSliceDescription];
        v12 = [(EKUndoSliceOutcome *)v10 initWithOriginalPostSliceDescription:v11];

        [v3 addObject:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  return 0;
}

@end