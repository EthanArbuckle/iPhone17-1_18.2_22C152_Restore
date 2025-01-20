@interface NSInPredicateOperator(_NSCoreDataSQLPredicateCategories)
- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicate:;
@end

@implementation NSInPredicateOperator(_NSCoreDataSQLPredicateCategories)

- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories ofPredicate:
{
  v4 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v7 = (void *)[a4 rightExpression];
  uint64_t v8 = [a1 operatorType];
  if (v8 == 99) {
    v7 = (void *)[v4 leftExpression];
  }
  uint64_t v9 = [v7 expressionType];
  uint64_t v10 = v9;
  if (v9 != 14 && v9) {
    return (uint64_t)v4;
  }
  v11 = (void *)[v7 constantValue];
  if ([v11 isNSString])
  {
    if ([v11 length]) {
      return (uint64_t)v4;
    }
    v12 = (void *)MEMORY[0x1E4F29068];
    goto LABEL_33;
  }
  if (([v11 isNSArray] & 1) == 0
    && ([v11 isNSSet] & 1) == 0
    && ([v11 isNSOrderedSet] & 1) == 0
    && ![v11 isNSDictionary])
  {
    return (uint64_t)v4;
  }
  if (![v11 count])
  {
    v12 = (void *)MEMORY[0x1E4F28C90];
LABEL_33:
    return [v12 defaultInstance];
  }
  if (v10 || ([v11 isNSDictionary] & 1) != 0) {
    return (uint64_t)v4;
  }
  uint64_t v26 = v8;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_opt_class();
  objc_opt_class();
  uint64_t v14 = [a3 valueForKey:@"persistentStore"];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v15 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v15) {
    goto LABEL_29;
  }
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v28 != v17) {
        objc_enumerationMutation(v11);
      }
      v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (objc_opt_isKindOfClass())
        {
LABEL_25:
          if ([v19 persistentStore] != v14) {
            continue;
          }
        }
LABEL_26:
        [v13 addObject:v19];
        continue;
      }
      if (objc_msgSend((id)objc_msgSend(v19, "objectID"), "persistentStore") == v14) {
        goto LABEL_26;
      }
      if (objc_opt_isKindOfClass()) {
        goto LABEL_25;
      }
    }
    uint64_t v16 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v16);
LABEL_29:
  if ([v13 count])
  {
    uint64_t v20 = [v11 count];
    if (v20 == [v13 count])
    {

      return (uint64_t)v4;
    }
    uint64_t v23 = [MEMORY[0x1E4F28C68] expressionForConstantValue:v13];

    v24 = (void *)MEMORY[0x1E4F28B98];
    if (v26 == 10)
    {
      uint64_t v25 = [v4 leftExpression];
    }
    else
    {
      uint64_t v25 = v23;
      uint64_t v23 = [v4 rightExpression];
    }
    return objc_msgSend(v24, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v25, v23, objc_msgSend(v4, "comparisonPredicateModifier"), v26, objc_msgSend(v4, "options"));
  }
  else
  {

    return [MEMORY[0x1E4F28C90] defaultInstance];
  }
}

@end