@interface CUIKUnsliceOperation
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (Class)_inverseOperationClass;
- (id)_inverseForUndoSliceOutcome:(id)a3;
- (id)_objectsForInverse;
- (id)originalObjects;
@end

@implementation CUIKUnsliceOperation

- (Class)_inverseOperationClass
{
  return 0;
}

- (id)_objectsForInverse
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(CUIKUserOperation *)self objects];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(CUIKUserOperation *)self objects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [(CUIKUnsliceOperation *)self _inverseForUndoSliceOutcome:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_inverseForUndoSliceOutcome:(id)a3
{
  id v3 = a3;
  id v4 = [[EKUndoSliceOutcome alloc] initResliceFromOutcome:v3];
  v5 = [v3 masterToDelete];

  if (v5)
  {
    v6 = [v4 mainSeriesDetails];
    uint64_t v7 = [v6 masterEvent];

    uint64_t v8 = [v4 createdSeriesDetails];
    uint64_t v9 = [v8 masterEvent];

    v10 = [v7 changeSet];
    v11 = [v7 recurrenceRuleString];
    [v10 forceChangeValue:v11 forKey:@"recurrenceRuleString"];

    [v9 _initChangeSetIfNone];
    v12 = [v9 changeSet];
    long long v13 = [v9 recurrenceRuleString];
    [v12 forceChangeValue:v13 forKey:@"recurrenceRuleString"];
  }

  return v4;
}

- (id)originalObjects
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(CUIKUserOperation *)self objects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 originalPostSliceDescription];
        v11 = [v10 originalEventToSliceOn];
        [v3 addObject:v11];

        v12 = [v9 masterToDelete];

        if (v12)
        {
          long long v13 = [v9 masterToDelete];
          [v3 addObject:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
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