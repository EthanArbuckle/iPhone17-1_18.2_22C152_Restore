@interface CUIKCreateOperation
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (Class)_inverseOperationClass;
- (NSArray)precomputedInverseObjects;
- (id)_actionName;
- (int64_t)_inverseOperationSpan;
- (void)_precomputeInverseObjects;
- (void)setPrecomputedInverseObjects:(id)a3;
@end

@implementation CUIKCreateOperation

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
    v9 = [v8 localizedStringForKey:@"Action: Create “%@”" value:@"Create “%@”" table:0];
    v10 = [v6 title];
    v11 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v10);
  }
  else
  {
    v6 = CUIKBundle();
    v11 = [v6 localizedStringForKey:@"Action: Create events" value:@"Create Events" table:0];
  }

  return v11;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(CUIKUserOperation *)self objects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    int v10 = 1;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v10 &= objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "CUIKEditingContext_saveWithSpan:error:", 3, a4);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  [(CUIKCreateOperation *)self _precomputeInverseObjects];
  return v10;
}

- (Class)_inverseOperationClass
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(CUIKUserOperation *)self objects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          uint64_t v7 = 0;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  uint64_t v7 = objc_opt_class();
LABEL_11:

  return (Class)v7;
}

- (void)_precomputeInverseObjects
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(CUIKUserOperation *)self objects];
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(CUIKUserOperation *)self objects];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [*(id *)(*((void *)&v13 + 1) + 8 * v10) snapshotCopy];
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  long long v12 = (void *)[v5 copy];
  [(CUIKCreateOperation *)self setPrecomputedInverseObjects:v12];
}

- (int64_t)_inverseOperationSpan
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(CUIKUserOperation *)self createdAsInverseOfAnotherOperation])
  {
LABEL_13:
    v10.receiver = self;
    v10.super_class = (Class)CUIKCreateOperation;
    return [(CUIKUserOperation *)&v10 _inverseOperationSpan];
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v3 = [(CUIKUserOperation *)self objects];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 isOrWasPartOfRecurringSeries])
          {

            goto LABEL_13;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    return 4;
  }
}

- (NSArray)precomputedInverseObjects
{
  return self->_precomputedInverseObjects;
}

- (void)setPrecomputedInverseObjects:(id)a3
{
}

- (void).cxx_destruct
{
}

@end