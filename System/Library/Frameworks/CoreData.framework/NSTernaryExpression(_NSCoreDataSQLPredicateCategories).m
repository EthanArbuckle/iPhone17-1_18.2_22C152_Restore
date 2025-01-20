@interface NSTernaryExpression(_NSCoreDataSQLPredicateCategories)
- (void)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSTernaryExpression(_NSCoreDataSQLPredicateCategories)

- (void)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  id v14 = 0;
  v6 = objc_msgSend((id)objc_msgSend(a1, "predicate"), "_keypathsForDerivedPropertyValidation:", &v14);
  if (!v6) {
    goto LABEL_8;
  }
  v7 = objc_msgSend((id)objc_msgSend(a1, "trueExpression"), "_keypathsForDerivedPropertyValidation:", &v14);
  if (!v7)
  {
    v6 = 0;
    goto LABEL_9;
  }
  v8 = objc_msgSend((id)objc_msgSend(a1, "falseExpression"), "_keypathsForDerivedPropertyValidation:", &v14);
  if (!v8)
  {
    v6 = 0;
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v6 = (void *)[v6 mutableCopy];
  objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v7, "allObjects"));
  objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend(v8, "allObjects"));
  v7 = v6;
LABEL_9:
  id v9 = v14;
  if (a3 && v14) {
    *a3 = v14;
  }
  [v5 drain];
  id v10 = 0;
  id v11 = v14;
  id v12 = v6;
  return v7;
}

@end