@interface _NSChildContextPredicateRemapper
- (_NSChildContextPredicateRemapper)init;
- (_NSChildContextPredicateRemapper)initWithContext:(id)a3;
- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4;
- (id)replacementValueForValue:(uint64_t)a1;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation _NSChildContextPredicateRemapper

- (_NSChildContextPredicateRemapper)initWithContext:(id)a3
{
  v4 = [(_NSChildContextPredicateRemapper *)self init];
  if (v4) {
    v4->_context = (NSManagedObjectContext *)a3;
  }
  return v4;
}

- (_NSChildContextPredicateRemapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)_NSChildContextPredicateRemapper;
  return [(_NSChildContextPredicateRemapper *)&v3 init];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_NSChildContextPredicateRemapper;
  [(_NSChildContextPredicateRemapper *)&v3 dealloc];
}

- (id)createPredicateForFetchFromPredicate:(id)a3 withContext:(id)a4
{
  if (a3 && a4)
  {
    v6 = (void *)[a3 copy];
    [v6 acceptVisitor:self flags:1];
    return v6;
  }
  else
  {
    return (id)[a3 copy];
  }
}

- (void)visitPredicateExpression:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (void *)[a3 constantValue];
    if (v5)
    {
      id v6 = v5;
      id v7 = -[_NSChildContextPredicateRemapper replacementValueForValue:]((uint64_t)self, v5);
      if (v7)
      {
        if (v7 != v6) {
          object_setInstanceVariableWithStrongDefault(a3, "constantValue", v7);
        }
      }
    }
    MEMORY[0x1F4181820]();
  }
}

- (id)replacementValueForValue:(uint64_t)a1
{
  id v2 = 0;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a1 || !a2) {
    return v2;
  }
  obuint64_t j = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    obuint64_t j = (id)[obj objectID];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4)
    {
      v5 = *(id **)(*(void *)(v4 + 168) + 8);
      id v6 = obj;
      if (v5)
      {
        uint64_t v7 = [*v5 objectForKey:obj];
        id v6 = obj;
        if (v7) {
          id v6 = (void *)v7;
        }
      }
    }
    else
    {
      id v6 = obj;
    }
    return v6;
  }
  if ([obj isNSArray])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:](a1, *(void *)(*((void *)&v33 + 1) + 8 * i));
          [v2 addObject:v12];
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v9);
    }
    return v2;
  }
  if ([obj isNSSet])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(obj);
          }
          v17 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:](a1, *(void *)(*((void *)&v29 + 1) + 8 * j));
          [v2 addObject:v17];
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v14);
    }
    return v2;
  }
  if ([obj isNSOrderedSet])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v19 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(obj);
          }
          v23 = (void *)-[_NSChildContextPredicateRemapper replacementValueForValue:](a1, *(void *)(*((void *)&v25 + 1) + 8 * k));
          [v2 addObject:v23];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v20);
    }
    return v2;
  }
  if ([obj isNSString])
  {
    return (id)[obj copy];
  }
  else
  {
    return obj;
  }
}

@end