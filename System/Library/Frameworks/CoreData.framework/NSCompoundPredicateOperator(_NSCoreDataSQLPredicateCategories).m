@interface NSCompoundPredicateOperator(_NSCoreDataSQLPredicateCategories)
- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicates:;
@end

@implementation NSCompoundPredicateOperator(_NSCoreDataSQLPredicateCategories)

- (id)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicates:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [a1 operatorType];
  if (v8 == 2)
  {
    v33 = a1;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v15 = [a4 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v40;
      while (2)
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(a4);
          }
          v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
          v20 = (void *)MEMORY[0x18C127630]();
          uint64_t v21 = [v19 minimalFormInContext:a3];
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29068], "defaultInstance"), "isEqual:", v21))
          {
            v32 = (void *)MEMORY[0x1E4F29068];
LABEL_38:
            uint64_t v12 = [v32 defaultInstance];
            return (id)v12;
          }
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C90], "defaultInstance"), "isEqual:", v21) & 1) == 0) {
            [v7 addObject:v21];
          }
          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [a4 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
    uint64_t v22 = [v7 count];
    if (v22 != 1)
    {
      a1 = v33;
      if (!v22)
      {
        v23 = (void *)MEMORY[0x1E4F28C90];
        return (id)[v23 defaultInstance];
      }
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(a1, "operatorType"), v7);
    }
    return (id)[v7 objectAtIndex:0];
  }
  if (v8 == 1)
  {
    v34 = a1;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v24 = [a4 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v36;
      while (2)
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(a4);
          }
          v28 = *(void **)(*((void *)&v35 + 1) + 8 * v27);
          v20 = (void *)MEMORY[0x18C127630]();
          uint64_t v29 = [v28 minimalFormInContext:a3];
          if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28C90], "defaultInstance"), "isEqual:", v29))
          {
            v32 = (void *)MEMORY[0x1E4F28C90];
            goto LABEL_38;
          }
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29068], "defaultInstance"), "isEqual:", v29) & 1) == 0) {
            [v7 addObject:v29];
          }
          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [a4 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v25) {
          continue;
        }
        break;
      }
    }
    uint64_t v30 = [v7 count];
    if (v30 != 1)
    {
      a1 = v34;
      if (!v30)
      {
        v23 = (void *)MEMORY[0x1E4F29068];
        return (id)[v23 defaultInstance];
      }
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(a1, "operatorType"), v7);
    }
    return (id)[v7 objectAtIndex:0];
  }
  if (v8) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Bad compound predicate predicateOperator type" userInfo:0]);
  }
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "objectAtIndex:", 0), "minimalFormInContext:", a3);
  char v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29068], "defaultInstance"), "isEqual:", v9);
  v11 = (void *)[MEMORY[0x1E4F28C90] defaultInstance];
  uint64_t v12 = (uint64_t)v11;
  if (v10) {
    return (id)v12;
  }
  if (![v11 isEqual:v9])
  {
    [v7 addObject:v9];
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28BA0]), "initWithType:subpredicates:", objc_msgSend(a1, "operatorType"), v7);
  }
  v13 = (void *)MEMORY[0x1E4F29068];

  return (id)[v13 defaultInstance];
}

@end