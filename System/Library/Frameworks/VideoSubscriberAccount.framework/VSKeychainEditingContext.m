@interface VSKeychainEditingContext
- (BOOL)save:(id *)a3;
- (NSMutableSet)items;
- (NSSet)deletedItems;
- (NSSet)insertedItems;
- (NSSet)updatedItems;
- (NSUndoManager)undoManager;
- (VSKeychainEditingContext)init;
- (VSKeychainStore)keychainStore;
- (id)_deleteQueryForItemValues:(id)a3 withItemKind:(id)a4;
- (id)_findOrCreateItemForCommittedValues:(id)a3 withItemKind:(id)a4;
- (id)_queryForItemValues:(id)a3 withItemKind:(id)a4;
- (id)_subsetOfRegisteredItemsWithKeyPath:(id)a3;
- (id)executeFetchRequest:(id)a3 error:(id *)a4;
- (void)_populateErrors:(id)a3 withError:(id)a4 affectingItem:(id)a5;
- (void)_populateQuery:(__CFDictionary *)a3 usingPredicate:(id)a4 withItemKind:(id)a5;
- (void)_populateResult:(id)a3 forRequest:(id)a4 fromMatch:(id)a5;
- (void)deleteItem:(id)a3;
- (void)fulfillFault:(id)a3;
- (void)insertItem:(id)a3;
- (void)setItems:(id)a3;
- (void)setKeychainStore:(id)a3;
- (void)setUndoManager:(id)a3;
@end

@implementation VSKeychainEditingContext

- (VSKeychainEditingContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSKeychainEditingContext;
  v2 = [(VSKeychainEditingContext *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    items = v2->_items;
    v2->_items = v3;
  }
  return v2;
}

- (void)_populateQuery:(__CFDictionary *)a3 usingPredicate:(id)a4 withItemKind:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      [v10 raise:v11, @"Unexpectedly, predicate was %@, instead of NSCompoundPredicate.", v13 format];
    }
    id v14 = v8;
    if ([v14 compoundPredicateType] != 1) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported compound predicate: %@", v14 format];
    }
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    v15 = [v14 subpredicates];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v74 != v18) {
            objc_enumerationMutation(v15);
          }
          [(VSKeychainEditingContext *)self _populateQuery:a3 usingPredicate:*(void *)(*((void *)&v73 + 1) + 8 * i) withItemKind:v9];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v73 objects:v78 count:16];
      }
      while (v17);
    }

    goto LABEL_61;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = *MEMORY[0x1E4F1C3C8];
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      [v20 raise:v21, @"Unexpectedly, predicate was %@, instead of NSComparisonPredicate.", v23 format];
    }
    id v24 = v8;
    v25 = [v24 leftExpression];
    v26 = [v24 rightExpression];
    uint64_t v27 = [v25 expressionType];
    uint64_t v28 = [v26 expressionType];
    id v66 = v26;
    if ((v27 != 3 || (v29 = v26, v30 = v25, v28)) && (v27 || (v29 = v25, v30 = v26, v28 != 3)))
    {
      uint64_t v33 = *MEMORY[0x1E4F1C3C8];
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported expressions in comparison predicate: %@", v24 format];
      v29 = 0;
    }
    else
    {
      id v31 = v25;
      id v32 = v26;
      if (v30) {
        goto LABEL_28;
      }
      uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    }
    [MEMORY[0x1E4F1CA00] raise:v33 format:@"The keyPathExpressionOrNil parameter must not be nil."];
    v30 = 0;
LABEL_28:
    id v36 = v25;
    id v37 = v30;
    if (!v29) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The constantExpressionOrNil parameter must not be nil."];
    }
    id v38 = v29;
    uint64_t v39 = [v37 keyPath];
    if (!v39
      || ([v9 attributesByName],
          v40 = objc_claimAutoreleasedReturnValue(),
          [v40 objectForKey:v39],
          v41 = objc_claimAutoreleasedReturnValue(),
          v40,
          !v41))
    {
      uint64_t v42 = *MEMORY[0x1E4F1C3C8];
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unknown keypath %@ for item kind %@", v39, v9 format];
      [MEMORY[0x1E4F1CA00] raise:v42 format:@"The attributeOrNil parameter must not be nil."];
      v41 = 0;
    }
    v65 = (void *)v39;
    id v43 = v41;
    v67 = [v38 constantValue];
    v68 = v43;
    v44 = [v43 attributeValueClassName];
    NSClassFromString(v44);

    uint64_t v45 = [v24 predicateOperatorType];
    if (v45 == 10)
    {
      v46 = v36;
      BOOL v52 = v36 == v37;
      v47 = v66;
      if (v52 && v66 == v38)
      {
        v53 = v67;
        if (![v67 conformsToProtocol:&unk_1F34E67B8])
        {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unable to enumerate constant value: %@", v67 format];
          v51 = v65;
          goto LABEL_60;
        }
        id v61 = v37;
        v62 = v46;
        id v63 = v24;
        id v64 = v8;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        id v54 = v67;
        uint64_t v55 = [v54 countByEnumeratingWithState:&v69 objects:v77 count:16];
        if (v55)
        {
          uint64_t v56 = v55;
          uint64_t v57 = *(void *)v70;
          uint64_t v58 = *MEMORY[0x1E4F1C3C8];
          do
          {
            for (uint64_t j = 0; j != v56; ++j)
            {
              if (*(void *)v70 != v57) {
                objc_enumerationMutation(v54);
              }
              uint64_t v60 = *(void *)(*((void *)&v69 + 1) + 8 * j);
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                [MEMORY[0x1E4F1CA00] raise:v58, @"Unexpected value %@ for attribute %@", v60, v68 format];
              }
            }
            uint64_t v56 = [v54 countByEnumeratingWithState:&v69 objects:v77 count:16];
          }
          while (v56);
        }

        id v24 = v63;
        id v8 = v64;
        id v37 = v61;
        v46 = v62;
        v47 = v66;
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported left (%@) and right (%@) expressions for IN operator.", v46, v66 format];
      }
      v51 = v65;
    }
    else
    {
      v46 = v36;
      if (v45 == 4)
      {
        v47 = v66;
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unexpected value %@ for attribute %@", v67, v68 format];
        }
        v48 = (const void *)[v68 secItemAttributeKey];
        id v49 = v67;
        if (CFDictionaryContainsKey(a3, v48))
        {
          Value = CFDictionaryGetValue(a3, v48);
          v51 = v65;
          if (!CFEqual(Value, v49))
          {
            CFRelease(v49);
            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Duplicative predicate for key path %@", v65 format];
          }
        }
        else
        {
          CFDictionarySetValue(a3, v48, v49);
          v51 = v65;
        }
        CFRelease(v49);
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported operator type (%lu) in comparison predicate: %@", v45, v24 format];
        v51 = v65;
        v47 = v66;
      }
    }
    v53 = v67;
LABEL_60:

    goto LABEL_61;
  }
  v34 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  char v35 = [v8 isEqual:v34];

  if (v8 && (v35 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Unsupported predicate: %@", v8 format];
  }
LABEL_61:
}

- (id)_findOrCreateItemForCommittedValues:(id)a3 withItemKind:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [(VSKeychainEditingContext *)self items];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v22 + 1) + 8 * v12);
      id v14 = [v13 committedValues];
      char v15 = [v14 isEqual:v6];

      if (v15) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v16 = v13;

    if (v16) {
      goto LABEL_13;
    }
  }
  else
  {
LABEL_9:
  }
  uint64_t v17 = [v7 itemClassName];
  uint64_t v18 = NSClassFromString(v17);

  id v16 = (id)[[v18 alloc] initWithItemKind:v7 insertIntoEditingContext:0];
  [v16 setEditingContext:self];
  [v16 setHasFaultForData:1];
  v19 = [(VSKeychainEditingContext *)self items];
  [v19 addObject:v16];

  [v16 _setCommittedValues:v6 registeringUndo:0];
  v20 = (void *)[v6 mutableCopy];
  [v16 setPrimitiveValues:v20];

  if (!v16) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The itemOrNil parameter must not be nil."];
  }
LABEL_13:

  return v16;
}

- (void)_populateResult:(id)a3 forRequest:(id)a4 fromMatch:(id)a5
{
  long long v23 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v7 = a4;
  id v8 = a5;
  long long v24 = [v7 predicate];
  long long v25 = v7;
  uint64_t v9 = [v7 itemKind];
  uint64_t v10 = [v9 forceUnwrapObject];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v12 = [v10 properties];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v17, "name", v23);
        v19 = [v17 defaultValue];
        v20 = objc_msgSend(v8, "objectForKey:", objc_msgSend(v17, "secItemAttributeKey"));
        uint64_t v21 = v20;
        if (v20 || (uint64_t v21 = v19) != 0) {
          [v11 setObject:v21 forKey:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  long long v22 = [(VSKeychainEditingContext *)v23 _findOrCreateItemForCommittedValues:v11 withItemKind:v10];
  if ([v24 evaluateWithObject:v22]) {
    [v26 addObject:v22];
  }
}

- (id)_queryForItemValues:(id)a3 withItemKind:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = objc_msgSend(v6, "properties", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [v13 secItemAttributeKey];
        uint64_t v15 = [v13 name];
        id v16 = [v5 objectForKey:v15];
        if (v16) {
          [v7 setObject:v16 forKey:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_deleteQueryForItemValues:(id)a3 withItemKind:(id)a4
{
  v26[3] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  v26[0] = @"accessGroup";
  v26[1] = @"creatorCode";
  v26[2] = @"creationDate";
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:3];
  uint64_t v10 = (void *)[v8 initWithArray:v9];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v20 = v6;
  uint64_t v11 = [v6 properties];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v17 = [v16 name];
        if ([v10 containsObject:v17])
        {
          long long v18 = [v5 objectForKey:v17];
          if (v18) {
            objc_msgSend(v7, "setObject:forKey:", v18, objc_msgSend(v16, "secItemAttributeKey"));
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  [v7 setObject:*MEMORY[0x1E4F3B880] forKey:*MEMORY[0x1E4F3B878]];

  return v7;
}

- (void)_populateErrors:(id)a3 withError:(id)a4 affectingItem:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v8 userInfo];
  id v15 = (id)[v10 mutableCopy];

  [v15 setObject:v7 forKey:@"VSKeychainAffectedItemsKey"];
  uint64_t v11 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = [v8 domain];
  uint64_t v13 = [v8 code];

  uint64_t v14 = [v11 errorWithDomain:v12 code:v13 userInfo:v15];
  [v9 addObject:v14];
}

- (void)fulfillFault:(id)a3
{
  id v4 = a3;
  if (([v4 hasFaultForData] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Item must have a fault for its data."];
  }
  id v5 = [v4 itemKind];
  id v6 = [v4 committedValues];
  id v7 = [(VSKeychainEditingContext *)self _queryForItemValues:v6 withItemKind:v5];

  uint64_t v8 = [v5 secItemClass];
  [v7 setObject:v8 forKey:*MEMORY[0x1E4F3B978]];
  [v7 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3BC70]];
  id v9 = [(VSKeychainEditingContext *)self keychainStore];
  id v25 = 0;
  uint64_t v10 = [v9 findItemsMatchingQuery:v7 error:&v25];
  id v11 = v25;

  if (v10)
  {
    uint64_t v12 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ![v12 count])
    {
      long long v24 = VSErrorLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[VSKeychainEditingContext fulfillFault:](v24);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v13 = v12;
        uint64_t v14 = [v4 primitiveValues];
        id v15 = [v13 copy];
        [v14 setObject:v15 forKey:@"data"];

        id v16 = [v4 committedValues];
        id v17 = [v13 copy];

        [v16 setObject:v17 forKey:@"data"];
        [v4 setHasFaultForData:0];
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Unexpected result type."];
      }
    }
  }
  else
  {
    uint64_t v12 = VSErrorLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VSKeychainEditingContext fulfillFault:]((uint64_t)v11, v12, v18, v19, v20, v21, v22, v23);
    }
  }
}

- (id)executeFetchRequest:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D048], MEMORY[0x1E4F1D540]);
  uint64_t v8 = [v6 itemKind];
  id v9 = [v8 forceUnwrapObject];

  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3B978], (const void *)[v9 secItemClass]);
  uint64_t v10 = [v6 predicate];
  [(VSKeychainEditingContext *)self _populateQuery:Mutable usingPredicate:v10 withItemKind:v9];
  id v11 = (const void *)*MEMORY[0x1E4F3B878];
  if (!CFDictionaryContainsKey(Mutable, (const void *)*MEMORY[0x1E4F3B878])) {
    CFDictionarySetValue(Mutable, v11, (const void *)*MEMORY[0x1E4F3B880]);
  }
  unint64_t v51 = [v6 fetchLimit];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3BB80], (const void *)*MEMORY[0x1E4F3BB88]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F3BC68], (const void *)*MEMORY[0x1E4F1CFD0]);
  uint64_t v12 = [(VSKeychainEditingContext *)self keychainStore];
  id v64 = 0;
  uint64_t v13 = [v12 findItemsMatchingQuery:Mutable error:&v64];
  id v14 = v64;

  if (v13)
  {
    id v54 = v6;
    id v15 = v13;
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_opt_class();
    id v53 = v16;
    id v49 = v15;
    id v50 = v14;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v55 = self;
      v48 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v17 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v18 = *MEMORY[0x1E4F1C3C8];
        uint64_t v19 = (objc_class *)objc_opt_class();
        uint64_t v20 = NSStringFromClass(v19);
        uint64_t v21 = v17;
        id v16 = v53;
        [v21 raise:v18, @"Unexpectedly, result was %@, instead of NSArray.", v20 format];
      }
      id v22 = v15;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v60 objects:v66 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v61;
        uint64_t v26 = *MEMORY[0x1E4F1C3B8];
        uint64_t v52 = *MEMORY[0x1E4F1C3C8];
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v61 != v25) {
              objc_enumerationMutation(v22);
            }
            uint64_t v28 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                long long v29 = (void *)MEMORY[0x1E4F1CA00];
                long long v30 = (objc_class *)objc_opt_class();
                id v31 = NSStringFromClass(v30);
                uint64_t v32 = v29;
                id v6 = v54;
                [v32 raise:v52, @"Unexpectedly, matchingValue was %@, instead of NSDictionary.", v31 format];

                id v16 = v53;
              }
              [(VSKeychainEditingContext *)v55 _populateResult:v16 forRequest:v6 fromMatch:v28];
            }
            else
            {
              [MEMORY[0x1E4F1CA00] raise:v26, @"Unexpected matching value: %@", v28 format];
            }
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v60 objects:v66 count:16];
        }
        while (v24);
      }

      id v9 = v48;
      self = v55;
      id v14 = v50;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v33 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v34 = *MEMORY[0x1E4F1C3C8];
          char v35 = (objc_class *)objc_opt_class();
          id v36 = NSStringFromClass(v35);
          uint64_t v37 = v34;
          id v16 = v53;
          [v33 raise:v37, @"Unexpectedly, result was %@, instead of NSDictionary.", v36 format];
        }
        id v6 = v54;
        [(VSKeychainEditingContext *)self _populateResult:v16 forRequest:v54 fromMatch:v15];
      }
      else
      {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Unexpected match result: %@", v15 format];
      }
    }
    id v38 = [v6 sortDescriptors];
    if (v38) {
      [v16 sortUsingDescriptors:v38];
    }
    unint64_t v39 = [v16 count];
    if (v51 && v39 > v51) {
      objc_msgSend(v16, "removeObjectsInRange:");
    }
    if ([v6 includesDataValues])
    {
      v40 = v13;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v41 = v16;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v42)
      {
        uint64_t v43 = v42;
        uint64_t v44 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v43; ++j)
          {
            if (*(void *)v57 != v44) {
              objc_enumerationMutation(v41);
            }
            v46 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            if ([v46 hasFaultForData]) {
              [(VSKeychainEditingContext *)self fulfillFault:v46];
            }
          }
          uint64_t v43 = [v41 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v43);
      }

      id v16 = v53;
      id v6 = v54;
      uint64_t v13 = v40;
      id v14 = v50;
    }
  }
  else
  {
    id v16 = 0;
    if (a4) {
      *a4 = v14;
    }
  }

  return v16;
}

- (void)insertItem:(id)a3
{
  id v10 = a3;
  if ([v10 hasChanges]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Attempting to insert an item that has changes."];
  }
  id v4 = [(VSKeychainEditingContext *)self undoManager];
  id v5 = [v10 editingContext];
  id v6 = v5;
  if (v5)
  {
    if (v5 != self) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Item already has another context."];
    }
  }
  else
  {
    [v10 setEditingContext:self];
    id v7 = [v4 prepareWithInvocationTarget:v10];
    [v7 setEditingContext:0];
  }
  uint64_t v8 = [(VSKeychainEditingContext *)self items];
  [v8 addObject:v10];
  id v9 = [v4 prepareWithInvocationTarget:v8];
  [v9 removeObject:v10];

  [v10 setInserted:1];
}

- (void)deleteItem:(id)a3
{
  id v6 = a3;
  id v4 = [v6 editingContext];
  id v5 = v4;
  if (v4)
  {
    if (v4 != self) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Item does not belong to this context."];
    }
    [v6 setDeleted:1];
  }
}

- (id)_subsetOfRegisteredItemsWithKeyPath:(id)a3
{
  id v4 = [MEMORY[0x1E4F28C68] expressionForKeyPath:a3];
  id v5 = [MEMORY[0x1E4F28C68] expressionForConstantValue:MEMORY[0x1E4F1CC38]];
  id v6 = [MEMORY[0x1E4F28B98] predicateWithLeftExpression:v4 rightExpression:v5 modifier:0 type:4 options:0];
  id v7 = [(VSKeychainEditingContext *)self items];
  uint64_t v8 = [v7 filteredSetUsingPredicate:v6];

  return v8;
}

- (NSSet)insertedItems
{
  return (NSSet *)[(VSKeychainEditingContext *)self _subsetOfRegisteredItemsWithKeyPath:@"inserted"];
}

- (NSSet)deletedItems
{
  return (NSSet *)[(VSKeychainEditingContext *)self _subsetOfRegisteredItemsWithKeyPath:@"deleted"];
}

- (NSSet)updatedItems
{
  return (NSSet *)[(VSKeychainEditingContext *)self _subsetOfRegisteredItemsWithKeyPath:@"updated"];
}

- (VSKeychainStore)keychainStore
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_keychainStore;
  if (!v3)
  {
    v3 = objc_alloc_init(VSKeychainStore);
    objc_storeStrong((id *)&v2->_keychainStore, v3);
  }
  objc_sync_exit(v2);

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The __orNil parameter must not be nil."];
  }

  return v3;
}

- (BOOL)save:(id *)a3
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v117 = "-[VSKeychainEditingContext save:]";
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = [(VSKeychainEditingContext *)self deletedItems];
  id v7 = (void *)[v6 copy];

  uint64_t v8 = [(VSKeychainEditingContext *)self updatedItems];
  uint64_t v9 = [v8 copy];

  id v10 = [(VSKeychainEditingContext *)self insertedItems];
  uint64_t v11 = [v10 copy];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v71 = (id)v11;
  [v12 setObject:v11 forKey:@"VSInsertedKeychainItemsKey"];
  id v64 = (void *)v9;
  [v12 setObject:v9 forKey:@"VSUpdatedKeychainItemsKey"];
  [v12 setObject:v7 forKey:@"VSDeletedKeychainItemsKey"];
  v65 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v66 = v12;
  [v65 postNotificationName:@"VSKeychainEditingContextWillSaveNotification" object:self userInfo:v12];
  long long v69 = [(VSKeychainEditingContext *)self undoManager];
  v89 = [(VSKeychainEditingContext *)self keychainStore];
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  obuint64_t j = v7;
  id v83 = (id)[obj countByEnumeratingWithState:&v109 objects:v115 count:16];
  v86 = v5;
  v88 = self;
  if (v83)
  {
    uint64_t v81 = *(void *)v110;
    uint64_t v78 = *MEMORY[0x1E4F3B978];
    uint64_t v74 = *MEMORY[0x1E4F1C3C8];
    char v87 = 1;
    do
    {
      for (uint64_t i = 0; i != v83; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v110 != v81) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v109 + 1) + 8 * i);
        id v15 = [v14 itemKind];
        id v16 = [v14 committedValues];
        id v17 = [(VSKeychainEditingContext *)self _deleteQueryForItemValues:v16 withItemKind:v15];
        objc_msgSend(v17, "setObject:forKey:", objc_msgSend(v15, "secItemClass"), v78);
        id v108 = 0;
        uint64_t v18 = self;
        int v19 = [v89 deleteItemsMatchingQuery:v17 error:&v108];
        uint64_t v20 = (char *)v108;
        if (v19)
        {
          uint64_t v21 = [(VSKeychainEditingContext *)v18 undoManager];
          v104[0] = MEMORY[0x1E4F143A8];
          v104[1] = 3221225472;
          v104[2] = __33__VSKeychainEditingContext_save___block_invoke;
          v104[3] = &unk_1E6BD47A8;
          v104[4] = v18;
          id v105 = v16;
          id v106 = v15;
          id v107 = v89;
          [v21 registerUndoWithTarget:v18 handler:v104];

          [v14 setDeleted:0];
          id v22 = [(VSKeychainEditingContext *)v18 items];
          uint64_t v23 = [v69 prepareWithInvocationTarget:v22];
          [v23 addObject:v14];

          [v22 removeObject:v14];
          uint64_t v24 = [v69 prepareWithInvocationTarget:v14];
          [v24 setEditingContext:v18];

          id v5 = v86;
          [v14 setEditingContext:0];

          self = v18;
        }
        else
        {
          uint64_t v25 = VSDefaultLogObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v20;
            _os_log_impl(&dword_1DA674000, v25, OS_LOG_TYPE_DEFAULT, "VSKeychainEditingContext: Deletion error %@", buf, 0xCu);
          }

          if (!v20) {
            [MEMORY[0x1E4F1CA00] raise:v74 format:@"The deletionError parameter must not be nil."];
          }
          self = v88;
          [(VSKeychainEditingContext *)v88 _populateErrors:v5 withError:v20 affectingItem:v14];
          char v87 = 0;
        }
      }
      id v83 = (id)[obj countByEnumeratingWithState:&v109 objects:v115 count:16];
    }
    while (v83);
  }
  else
  {
    char v87 = 1;
  }

  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v72 = v71;
  id v84 = (id)[v72 countByEnumeratingWithState:&v100 objects:v114 count:16];
  if (v84)
  {
    uint64_t v82 = *(void *)v101;
    uint64_t v79 = *MEMORY[0x1E4F3BC68];
    uint64_t v77 = *MEMORY[0x1E4F3B978];
    uint64_t v68 = *MEMORY[0x1E4F1C3B8];
    uint64_t v70 = *MEMORY[0x1E4F3B668];
    uint64_t v67 = *MEMORY[0x1E4F1C3C8];
    uint64_t v26 = v89;
    do
    {
      for (uint64_t j = 0; j != v84; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v101 != v82) {
          objc_enumerationMutation(v72);
        }
        uint64_t v28 = *(void **)(*((void *)&v100 + 1) + 8 * (void)j);
        long long v29 = [v28 itemKind];
        long long v30 = [v28 primitiveValues];
        id v31 = [(VSKeychainEditingContext *)self _queryForItemValues:v30 withItemKind:v29];

        [v31 setObject:MEMORY[0x1E4F1CC38] forKey:v79];
        objc_msgSend(v31, "setObject:forKey:", objc_msgSend(v29, "secItemClass"), v77);
        id v99 = 0;
        uint64_t v32 = [v26 addItem:v31 error:&v99];
        uint64_t v33 = (char *)v99;
        if (v32)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v76 = [v28 primitiveValues];
            uint64_t v34 = [v28 itemKind];
            char v35 = [v34 attributesBySecItemAttributeKey];
            id v36 = [v35 objectForKey:v70];
            uint64_t v37 = [v36 name];

            if (v37)
            {
              id v38 = v37;
              unint64_t v39 = [v32 objectForKey:v70];
              if (v39)
              {
                v40 = [v28 primitiveValues];
                [v40 setObject:v39 forKey:v38];
              }
            }
            [(VSKeychainEditingContext *)v88 undoManager];
            v41 = long long v75 = v37;
            v95[0] = MEMORY[0x1E4F143A8];
            v95[1] = 3221225472;
            v95[2] = __33__VSKeychainEditingContext_save___block_invoke_158;
            v95[3] = &unk_1E6BD47D0;
            id v96 = v76;
            id v97 = v29;
            uint64_t v26 = v89;
            id v98 = v89;
            id v42 = v76;
            [v41 registerUndoWithTarget:v88 handler:v95];

            [v28 _setCommittedValues:v42 registeringUndo:1];
            [v28 setInserted:0];

            self = v88;
            id v5 = v86;
          }
          else
          {
            [MEMORY[0x1E4F1CA00] raise:v68, @"Unexpected add result: %@", v32 format];
          }
        }
        else
        {
          uint64_t v43 = VSDefaultLogObject();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v33;
            _os_log_impl(&dword_1DA674000, v43, OS_LOG_TYPE_DEFAULT, "VSKeychainEditingContext: Insertion error %@", buf, 0xCu);
          }

          if (!v33) {
            [MEMORY[0x1E4F1CA00] raise:v67 format:@"The additionError parameter must not be nil."];
          }
          [(VSKeychainEditingContext *)self _populateErrors:v5 withError:v33 affectingItem:v28];
          char v87 = 0;
        }
      }
      id v84 = (id)[v72 countByEnumeratingWithState:&v100 objects:v114 count:16];
    }
    while (v84);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v85 = v64;
  uint64_t v44 = [v85 countByEnumeratingWithState:&v91 objects:v113 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v92;
    uint64_t v47 = *MEMORY[0x1E4F3B978];
    uint64_t v80 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t k = 0; k != v45; ++k)
      {
        if (*(void *)v92 != v46) {
          objc_enumerationMutation(v85);
        }
        id v49 = *(void **)(*((void *)&v91 + 1) + 8 * k);
        id v50 = [v49 itemKind];
        unint64_t v51 = [v49 committedValues];
        uint64_t v52 = [(VSKeychainEditingContext *)v88 _queryForItemValues:v51 withItemKind:v50];

        objc_msgSend(v52, "setObject:forKey:", objc_msgSend(v50, "secItemClass"), v47);
        id v53 = [v49 changedValues];
        id v54 = [(VSKeychainEditingContext *)v88 _queryForItemValues:v53 withItemKind:v50];

        id v90 = 0;
        LODWORD(v53) = [v89 updateAttributes:v54 ofItemsMatchingQuery:v52 error:&v90];
        uint64_t v55 = (char *)v90;
        if (v53)
        {
          long long v56 = [v49 primitiveValues];
          [v49 _setCommittedValues:v56 registeringUndo:1];

          [v49 setUpdated:0];
        }
        else
        {
          long long v57 = VSDefaultLogObject();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v55;
            _os_log_impl(&dword_1DA674000, v57, OS_LOG_TYPE_DEFAULT, "VSKeychainEditingContext: Update error %@", buf, 0xCu);
          }

          if (!v55) {
            [MEMORY[0x1E4F1CA00] raise:v80 format:@"The updateError parameter must not be nil."];
          }
          [(VSKeychainEditingContext *)v88 _populateErrors:v86 withError:v55 affectingItem:v49];
          char v87 = 0;
        }
      }
      uint64_t v45 = [v85 countByEnumeratingWithState:&v91 objects:v113 count:16];
    }
    while (v45);
  }

  if (v87)
  {
    long long v59 = v65;
    long long v58 = v66;
    [v65 postNotificationName:@"VSKeychainEditingContextDidSaveNotification" object:v88 userInfo:v66];
    long long v60 = v86;
  }
  else
  {
    long long v60 = v86;
    long long v59 = v65;
    long long v58 = v66;
    if (a3)
    {
      if ((unint64_t)[v86 count] < 2)
      {
        *a3 = [v86 firstObject];
      }
      else
      {
        id v61 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        [v61 setObject:v86 forKey:@"VSKeychainDetailedErrorsKey"];
        *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VSKeychainErrorDomain" code:0 userInfo:v61];
      }
    }
  }

  return v87 & 1;
}

void __33__VSKeychainEditingContext_save___block_invoke(uint64_t a1)
{
  v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Will undo deletion.", buf, 2u);
  }

  v3 = [*(id *)(a1 + 32) _queryForItemValues:*(void *)(a1 + 40) withItemKind:*(void *)(a1 + 48)];
  [v3 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F3BC68]];
  uint64_t v4 = [*(id *)(a1 + 48) secItemClass];
  [v3 setObject:v4 forKey:*MEMORY[0x1E4F3B978]];
  id v5 = *(void **)(a1 + 56);
  id v16 = 0;
  id v6 = [v5 addItem:v3 error:&v16];
  id v7 = v16;

  if (v6)
  {
    uint64_t v8 = VSDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Undid deletion.", v15, 2u);
    }
  }
  else
  {
    uint64_t v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __33__VSKeychainEditingContext_save___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

void __33__VSKeychainEditingContext_save___block_invoke_158(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = VSDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Will undo insertion.", buf, 2u);
  }

  id v5 = [v3 _queryForItemValues:*(void *)(a1 + 32) withItemKind:*(void *)(a1 + 40)];

  uint64_t v6 = [*(id *)(a1 + 40) secItemClass];
  [v5 setObject:v6 forKey:*MEMORY[0x1E4F3B978]];
  id v7 = *(void **)(a1 + 48);
  id v18 = 0;
  int v8 = [v7 deleteItemsMatchingQuery:v5 error:&v18];
  id v9 = v18;
  uint64_t v10 = VSErrorLogObject();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11) {
      __33__VSKeychainEditingContext_save___block_invoke_158_cold_1(v10);
    }
  }
  else if (v11)
  {
    __33__VSKeychainEditingContext_save___block_invoke_158_cold_2((uint64_t)v9, v10, v12, v13, v14, v15, v16, v17);
  }
}

- (void)setKeychainStore:(id)a3
{
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
}

- (NSMutableSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);

  objc_storeStrong((id *)&self->_keychainStore, 0);
}

- (void)fulfillFault:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)fulfillFault:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Unable to find item to fulfill fault.", v1, 2u);
}

void __33__VSKeychainEditingContext_save___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __33__VSKeychainEditingContext_save___block_invoke_158_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Undid insertion.", v1, 2u);
}

void __33__VSKeychainEditingContext_save___block_invoke_158_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end