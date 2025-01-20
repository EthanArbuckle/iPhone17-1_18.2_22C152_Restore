@interface EDSearchableIndexQueryTransformer
+ (id)transformSearchableIndexPredicate:(id)a3 suggestion:(id)a4 searchableIndexManager:(id)a5;
- (EDSearchableIndexManager)searchableIndexManager;
- (EDSearchableIndexQueryTransformer)initWithSearchableIndexManager:(id)a3;
- (id)persistenceQueryForSearchableIndexQuery:(id)a3;
@end

@implementation EDSearchableIndexQueryTransformer

- (EDSearchableIndexQueryTransformer)initWithSearchableIndexManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDSearchableIndexQueryTransformer;
  v6 = [(EDSearchableIndexQueryTransformer *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_searchableIndexManager, a3);
  }

  return v7;
}

- (id)persistenceQueryForSearchableIndexQuery:(id)a3
{
  id v4 = a3;
  id v5 = [v4 predicate];
  v6 = [v4 suggestion];
  v7 = [(EDSearchableIndexQueryTransformer *)self searchableIndexManager];
  v8 = objc_msgSend(v5, "ed_transformSearchableIndexPredicateWithSuggestion:searchableIndexManager:", v6, v7);

  id v9 = objc_alloc(MEMORY[0x1E4F60418]);
  uint64_t v10 = [v4 targetClass];
  v11 = [v4 sortDescriptors];
  v12 = (void *)[v9 initWithTargetClass:v10 predicate:v8 sortDescriptors:v11];

  return v12;
}

+ (id)transformSearchableIndexPredicate:(id)a3 suggestion:(id)a4 searchableIndexManager:(id)a5
{
  id v7 = a5;
  v8 = +[EDSearchableIndexExpressionGenerator expressionForPredicate:a3 suggestion:a4];
  id v9 = [(id)objc_opt_class() searchableItemResultForExpression:v8];
  uint64_t v10 = [v9 snippetData];
  v11 = [MEMORY[0x1E4F29060] currentThread];
  v12 = [v11 threadDictionary];
  [v12 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F5FD98]];

  v13 = [v9 identifiers];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    v15 = [v9 identifiers];
    v16 = +[EDMessageListItemPredicates predicateForMessagesWithPersistentIDs:v15];
  }
  else
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28F60], "ef_matchNothingPredicate");
  }

  return v16;
}

- (EDSearchableIndexManager)searchableIndexManager
{
  return (EDSearchableIndexManager *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end