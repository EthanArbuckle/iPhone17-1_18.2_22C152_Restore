@interface NSComparisonPredicate(_NSCoreDataSQLPredicateCategories)
- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSComparisonPredicate(_NSCoreDataSQLPredicateCategories)

- (uint64_t)minimalFormInContext:()_NSCoreDataSQLPredicateCategories
{
  id v4 = a1;
  id v5 = (id)objc_msgSend((id)objc_msgSend(a1, "leftExpression"), "minimalFormInContext:", a3);
  id v6 = (id)objc_msgSend((id)objc_msgSend(v4, "rightExpression"), "minimalFormInContext:", a3);
  uint64_t v7 = [v4 leftExpression];
  uint64_t v8 = [v4 rightExpression];
  uint64_t v9 = [v4 predicateOperatorType];
  if (![v5 expressionType] && !objc_msgSend(v6, "expressionType"))
  {
    if (objc_opt_respondsToSelector()) {
      [v4 allowEvaluation];
    }
    if ([v4 evaluateWithObject:0]) {
      goto LABEL_25;
    }
LABEL_26:
    v13 = (void *)MEMORY[0x1E4F28C90];
    goto LABEL_27;
  }
  if ([v6 expressionType])
  {
    unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    goto LABEL_5;
  }
  if (![v6 constantValue])
  {
    if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      unint64_t v10 = 4;
      goto LABEL_5;
    }
LABEL_40:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], @"Invalid predicate: nil RHS", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObject:forKey:", v4, @"predicate")));
  }
  unint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA98], "null"), "isEqual:", objc_msgSend(v6, "constantValue"))&& v10 != 4)
  {
    goto LABEL_40;
  }
LABEL_5:
  if (![v6 expressionType]
    && v10 == 6
    && objc_msgSend(&stru_1ED787880, "isEqual:", objc_msgSend(v6, "constantValue")))
  {
    goto LABEL_26;
  }
  if (v9 == 99 || v9 == 10)
  {
    v11 = (void *)[v4 predicateOperator];
    return [v11 minimalFormInContext:a3 ofPredicate:v4];
  }
  if (!-[NSComparisonPredicate _isForeignObjectExpression:givenContext:]((BOOL)v4, v5, a3)
    && !-[NSComparisonPredicate _isForeignObjectExpression:givenContext:]((BOOL)v4, v6, a3))
  {
    if (v5 != (id)v7 || v6 != (id)v8)
    {
      v14 = objc_msgSend((id)objc_msgSend(v4, "predicateOperator"), "copy");
      if (v5 == (id)v7) {
        id v5 = (id)[v5 copy];
      }
      if (v6 == (id)v8) {
        id v6 = (id)[v6 copy];
      }
      id v4 = (id)[objc_alloc((Class)objc_opt_class()) initWithPredicateOperator:v14 leftExpression:v5 rightExpression:v6];
    }
    return (uint64_t)v4;
  }
  if (v9 != 5)
  {
    if (v9 != 4) {
      return (uint64_t)v4;
    }
    goto LABEL_26;
  }
LABEL_25:
  v13 = (void *)MEMORY[0x1E4F29068];
LABEL_27:

  return [v13 defaultInstance];
}

- (id)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  id v13 = 0;
  id v5 = (id)objc_msgSend((id)objc_msgSend(a1, "leftExpression"), "_keypathsForDerivedPropertyValidation:", &v13);
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = objc_msgSend((id)objc_msgSend(a1, "rightExpression"), "_keypathsForDerivedPropertyValidation:", &v13);
  if (!v6)
  {
    id v5 = 0;
LABEL_6:
    id v7 = 0;
    goto LABEL_7;
  }
  id v5 = v5;
  objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(v6, "allObjects"));
  id v7 = v5;
LABEL_7:
  id v8 = v13;
  if (a3 && v13) {
    *a3 = v13;
  }
  [0 drain];
  id v9 = 0;
  id v10 = v13;
  id v11 = v5;
  return v7;
}

@end