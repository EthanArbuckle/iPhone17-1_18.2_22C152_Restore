@interface NSPredicate(_NSCoreDataSQLPredicateCategories)
- (uint64_t)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories;
@end

@implementation NSPredicate(_NSCoreDataSQLPredicateCategories)

- (uint64_t)_keypathsForDerivedPropertyValidation:()_NSCoreDataSQLPredicateCategories
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29068] defaultInstance] == a1
    || [MEMORY[0x1E4F28C90] defaultInstance] == a1)
  {
    v7 = (void *)MEMORY[0x1E4F1CA80];
    return [v7 set];
  }
  else
  {
    if (a3)
    {
      uint64_t v5 = *MEMORY[0x1E4F281F8];
      v8 = @"expression";
      v9[0] = a1;
      *a3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v5, 134097, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
    }
    return 0;
  }
}

@end