@interface NSCompoundPredicate(EFSQLGeneratorPredicateNode)
- (EFSQLGeneratorCompoundPredicateNode)predicateNodeFromPropertyMapper:()EFSQLGeneratorPredicateNode addingTablesUsed:;
@end

@implementation NSCompoundPredicate(EFSQLGeneratorPredicateNode)

- (EFSQLGeneratorCompoundPredicateNode)predicateNodeFromPropertyMapper:()EFSQLGeneratorPredicateNode addingTablesUsed:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = objc_msgSend(a1, "subpredicates", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) predicateNodeFromPropertyMapper:v6 addingTablesUsed:v7];
        [v8 addObject:v13];
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = -[EFSQLGeneratorCompoundPredicateNode initWithPredicateType:childPredicates:]([EFSQLGeneratorCompoundPredicateNode alloc], "initWithPredicateType:childPredicates:", [a1 compoundPredicateType], v8);
  return v14;
}

@end