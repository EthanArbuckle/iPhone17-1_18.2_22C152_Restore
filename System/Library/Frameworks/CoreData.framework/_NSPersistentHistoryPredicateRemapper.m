@interface _NSPersistentHistoryPredicateRemapper
+ (id)defaultInstance;
- (_BYTE)replacementValueForKeyPath:(unsigned char *)result;
- (_NSPersistentHistoryPredicateRemapper)initWithStoreIdentifier:(id)a3;
- (id)createPredicateForFetchFromPredicate:(id)a3;
- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4;
- (id)replacementValueForValue:(uint64_t)a1;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _NSPersistentHistoryPredicateRemapper

- (_NSPersistentHistoryPredicateRemapper)initWithStoreIdentifier:(id)a3
{
  v4 = [(_NSPersistentHistoryPredicateRemapper *)self init];
  if (v4) {
    v4->_storeID = (NSString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryPredicateRemapper;
  [(_NSPersistentHistoryPredicateRemapper *)&v3 dealloc];
}

- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4
{
  if (a3)
  {
    v6 = objc_msgSend(a3, "copy", a3, a4);
    [v6 acceptVisitor:self flags:1];
    if (self->_storeID) {
      return v6;
    }
  }
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", a3 == 0, a4);

  return v8;
}

- (id)createPredicateForFetchFromPredicate:(id)a3
{
  return [(_NSPersistentHistoryPredicateRemapper *)self createPredicateForFetchFromPredicate:a3 withContext:0];
}

- (void)visitPredicateExpression:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    self->_previousKeyPathExpressionWasToken = 0;
LABEL_4:
    v5 = (unsigned char *)[a3 keyPath];
    if (v5)
    {
      v6 = v5;
      v7 = -[_NSPersistentHistoryPredicateRemapper replacementValueForKeyPath:](self, v5);
      v8 = v7;
      if (v7)
      {
        if (v7 != v6)
        {
          v9 = "_value";
LABEL_8:
          object_setInstanceVariableWithStrongDefault(a3, v9, v8);
          goto LABEL_15;
        }
      }
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  id v10 = (id)[a3 constantValue];
  if (v10 || self->_previousKeyPathExpressionWasToken)
  {
    id v11 = -[_NSPersistentHistoryPredicateRemapper replacementValueForValue:]((uint64_t)self, v10);
    v8 = v11;
    if (v11)
    {
      if (v11 != v10)
      {
        v9 = "constantValue";
        goto LABEL_8;
      }
    }
  }
LABEL_15:

  MEMORY[0x1F4181820]();
}

- (_BYTE)replacementValueForKeyPath:(unsigned char *)result
{
  v8[4] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v2 = result;
    if ([a2 isNSString])
    {
      v7[0] = @"author";
      v7[1] = @"bundleID";
      v8[0] = @"AUTHORTS";
      v8[1] = @"BUNDLEIDTS";
      v7[2] = @"contextName";
      v7[3] = @"processID";
      v8[2] = @"CONTEXTNAMETS";
      v8[3] = @"PROCESSIDTS";
      uint64_t v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v8, v7, 4), "objectForKey:", a2);
      if (v3) {
        return (unsigned char *)[[NSString alloc] initWithFormat:@"%@.%@", v3, @"NAME"];
      }
      if ([a2 isEqualToString:@"transactionNumber"]
        || ([a2 isEqualToString:@"changeID"] & 1) != 0
        || [a2 isEqualToString:@"token"])
      {
        if ([a2 isEqualToString:@"token"]) {
          v2[16] = 1;
        }
        id v4 = [NSString alloc];
        v5 = NSSQLPrimaryKeyPropertyName;
      }
      else if ([a2 isEqualToString:@"timestamp"])
      {
        id v4 = [NSString alloc];
        v5 = PFPersistentHistoryTransactionTimestamp;
      }
      else if ([a2 isEqualToString:@"changeType"])
      {
        id v4 = [NSString alloc];
        v5 = PFPersistentHistoryChangeType;
      }
      else
      {
        if (![a2 isEqualToString:@"changedEntity"]) {
          return (unsigned char *)[a2 copy];
        }
        id v4 = [NSString alloc];
        v5 = PFPersistentHistoryChangeEntity;
      }
      return (unsigned char *)[v4 initWithString:*v5];
    }
    else
    {
      return a2;
    }
  }
  return result;
}

- (id)replacementValueForValue:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    if (*(unsigned char *)(a1 + 16))
    {
      *(unsigned char *)(a1 + 16) = 0;
      id v4 = objc_alloc(NSNumber);
      return (id)[v4 initWithInt:0];
    }
    return 0;
  }
  obuint64_t j = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v3 = [obj _backingObjectID];
      goto LABEL_12;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    obuint64_t j = (id)objc_msgSend((id)objc_msgSend(obj, "storeTokens"), "valueForKey:", *(void *)(a1 + 8));
    if (obj) {
      goto LABEL_13;
    }
    id v7 = 0;
    *(void *)(a1 + 8) = 0;
    return v7;
  }
  uint64_t v3 = [obj objectID];
LABEL_12:
  obuint64_t j = (id)v3;
LABEL_13:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = obj;
LABEL_15:
    return v6;
  }
  if ([obj isNSArray])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = (void *)-[_NSPersistentHistoryPredicateRemapper replacementValueForValue:](a1, *(void *)(*((void *)&v32 + 1) + 8 * i));
          [v7 addObject:v12];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v9);
    }
    return v7;
  }
  if ([obj isNSSet])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v13 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = (void *)-[_NSPersistentHistoryPredicateRemapper replacementValueForValue:](a1, *(void *)(*((void *)&v28 + 1) + 8 * j));
          [v7 addObject:v17];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v14);
    }
    return v7;
  }
  if ([obj isNSOrderedSet])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v18 = [obj countByEnumeratingWithState:&v24 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t k = 0; k != v19; ++k)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(obj);
          }
          v22 = (void *)-[_NSPersistentHistoryPredicateRemapper replacementValueForValue:](a1, *(void *)(*((void *)&v24 + 1) + 8 * k));
          [v7 addObject:v22];
        }
        uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v36 count:16];
      }
      while (v19);
    }
    return v7;
  }
  if (![obj isNSString])
  {
    v6 = obj;
    goto LABEL_15;
  }

  return (id)[obj copy];
}

+ (id)defaultInstance
{
  id result = (id)defaultInstance_di_38;
  if (!defaultInstance_di_38)
  {
    id result = objc_alloc_init(_NSPersistentHistoryPredicateRemapper);
    defaultInstance_di_38 = (uint64_t)result;
  }
  return result;
}

@end