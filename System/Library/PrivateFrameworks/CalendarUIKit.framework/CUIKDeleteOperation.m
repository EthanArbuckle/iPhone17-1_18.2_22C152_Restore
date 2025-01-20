@interface CUIKDeleteOperation
- (BOOL)_canBeUndone;
- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4;
- (Class)_inverseOperationClass;
- (NSArray)precomputedInverseObjects;
- (id)_actionName;
- (id)_objectsForInverse;
- (void)setPrecomputedInverseObjects:(id)a3;
@end

@implementation CUIKDeleteOperation

- (id)_actionName
{
  v3 = [(CUIKUserOperation *)self objects];
  uint64_t v4 = [v3 count];

  v5 = [(CUIKUserOperation *)self objects];
  v6 = [v5 firstObject];
  v7 = v6;
  if (v4 == 1)
  {
    v8 = [v6 actionStringsDisplayTitle];

    v9 = NSString;
    v10 = CUIKBundle();
    v11 = [v10 localizedStringForKey:@"Action: Delete “%@”" value:@"Delete “%@”" table:0];
    v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v8);
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = CUIKBundle();
      v8 = v14;
      v15 = @"Action: Delete events";
      v16 = @"Delete events";
    }
    else
    {
      v17 = [(CUIKUserOperation *)self objects];
      v18 = [v17 firstObject];
      objc_opt_class();
      char v19 = objc_opt_isKindOfClass();

      v14 = CUIKBundle();
      v8 = v14;
      if (v19)
      {
        v15 = @"Action: Delete calendars";
        v16 = @"Delete calendars";
      }
      else
      {
        v15 = @"Action: Delete objects";
        v16 = @"Delete objects";
      }
    }
    v12 = [v14 localizedStringForKey:v15 value:v16 table:0];
  }

  return v12;
}

- (BOOL)_executeWithUndoDelegate:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v28 = [(CUIKDeleteOperation *)self _canBeUndone];
  if (v28)
  {
    v6 = (void *)MEMORY[0x1E4F1CA48];
    v7 = [(CUIKUserOperation *)self objects];
    v24 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));
  }
  else
  {
    v24 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v27 = self;
  id obj = [(CUIKUserOperation *)self objects];
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (!v8)
  {
    char v10 = 1;
    goto LABEL_28;
  }
  uint64_t v9 = v8;
  uint64_t v25 = *(void *)v30;
  char v10 = 1;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v30 != v25) {
        objc_enumerationMutation(obj);
      }
      v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
      if (v5)
      {
        id v13 = [v5 objectToSaveForUndoingChangeToObject:v12];
      }
      else
      {
        id v13 = v12;
      }
      v14 = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        v16 = v15;
        if (v15 && ([v15 isDetached] & 1) == 0)
        {
          int v17 = [v16 hasRecurrenceRules] ^ 1;
          goto LABEL_18;
        }
      }
      else
      {
        v16 = 0;
      }
      int v17 = 1;
LABEL_18:
      if (v28)
      {
        v18 = [v14 snapshotCopy];
        char v19 = v18;
        if (!v17) {
          goto LABEL_22;
        }
        [v18 markAsUndeleted];
        [v24 addObject:v19];
      }
      char v19 = 0;
LABEL_22:
      char v20 = objc_msgSend(v14, "CUIKEditingContext_removeWithSpan:error:", -[CUIKUserOperation span](v27, "span"), a4);
      if (((!v28 | v17) & 1) == 0)
      {
        v21 = [v14 inverseObjectWithObject:v19 diff:0];
        [v24 addObject:v21];
      }
      v10 &= v20;
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  }
  while (v9);
LABEL_28:

  if (v28)
  {
    [(CUIKDeleteOperation *)v27 setPrecomputedInverseObjects:v24];
    [(CUIKUserOperation *)v27 _precomputeInverseOperation];
  }

  return v10;
}

- (BOOL)_canBeUndone
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(CUIKUserOperation *)self span]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(CUIKUserOperation *)self objects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) == 0 || ([v9 isSelfOrganizedInvitation])
        {
          BOOL v3 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      BOOL v3 = 1;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v3 = 1;
  }
LABEL_15:

  return v3;
}

- (Class)_inverseOperationClass
{
  if ([(CUIKDeleteOperation *)self _canBeUndone])
  {
    v2 = objc_opt_class();
  }
  else
  {
    v2 = 0;
  }

  return (Class)v2;
}

- (id)_objectsForInverse
{
  if ([(CUIKUserOperation *)self span])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [(CUIKDeleteOperation *)self precomputedInverseObjects];
  }

  return v3;
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