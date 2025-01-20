@interface CUIKRevertOperation
+ (id)operationForContext:(id)a3;
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (Class)_inverseOperationClass;
- (EKChangeTracker)originalChangeTracker;
- (id)_actionName;
- (id)_inverseOperation;
- (void)setOriginalChangeTracker:(id)a3;
@end

@implementation CUIKRevertOperation

+ (id)operationForContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 group];
  v6 = [v5 trackedObjects];
  if ([v4 _currentSpan])
  {
    id v27 = a1;
    id v28 = v4;
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v10) {
      goto LABEL_20;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (1)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [v14 masterEvent];
          v16 = [v14 recurrenceIdentifier];
          if (v15 != v14 && v15 != 0)
          {
            [v7 setObject:v14 forKeyedSubscript:v16];

            v20 = [v15 recurrenceIdentifier];
            v21 = [v8 objectForKeyedSubscript:v20];

            if (!v21)
            {
              v16 = [v15 recurrenceIdentifier];
              v18 = v8;
              v19 = v15;
LABEL_16:
              [v18 setObject:v19 forKeyedSubscript:v16];
            }
            continue;
          }
          v18 = v8;
          v19 = v14;
          goto LABEL_16;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v11)
      {
LABEL_20:

        v22 = [v7 allValues];

        v23 = [v8 allValues];
        v6 = [v22 arrayByAddingObjectsFromArray:v23];

        id v4 = v28;
        a1 = v27;
        break;
      }
    }
  }
  v24 = objc_msgSend(a1, "operationWithObjects:span:", v6, objc_msgSend(v4, "_currentSpan"));
  v25 = [v5 originalObjects];
  [v24 setOriginalObjects:v25];

  return v24;
}

- (id)_actionName
{
  v3 = [(CUIKUserOperation *)self objects];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    v5 = [(CUIKUserOperation *)self objects];
    v6 = [v5 firstObject];

    v7 = NSString;
    v8 = CUIKBundle();
    id v9 = [v8 localizedStringForKey:@"Action: Revert “%@”" value:@"Revert “%@”" table:0];
    uint64_t v10 = [v6 title];
    uint64_t v11 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v10);
  }
  else
  {
    v6 = CUIKBundle();
    uint64_t v11 = [v6 localizedStringForKey:@"Action: Revert events" value:@"Revert Events" table:0];
  }

  return v11;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = [(CUIKUserOperation *)self objects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    char v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        if (v5)
        {
          uint64_t v13 = [v5 objectToSaveForRevertingChangeToObject:v12];

          id v12 = (id)v13;
        }
        v14 = [v12 specificIdentifier];
        if ([v12 revert]) {
          [v5 objectWithSpecificIdentifierWasReverted:v14];
        }
        else {
          char v10 = 0;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    char v10 = 1;
  }

  return v10 & 1;
}

- (Class)_inverseOperationClass
{
  return 0;
}

- (id)_inverseOperation
{
  v6.receiver = self;
  v6.super_class = (Class)CUIKRevertOperation;
  v3 = [(CUIKUserOperation *)&v6 _inverseOperation];
  uint64_t v4 = [(CUIKRevertOperation *)self originalChangeTracker];
  [v3 setOriginalChangeTracker:v4];

  return v3;
}

- (EKChangeTracker)originalChangeTracker
{
  return (EKChangeTracker *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOriginalChangeTracker:(id)a3
{
}

- (void).cxx_destruct
{
}

@end