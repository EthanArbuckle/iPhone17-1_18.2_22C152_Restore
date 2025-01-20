@interface NSCompoundPredicate(EDSearchableIndexQueryTransformer)
- (id)ed_transformSearchableIndexPredicateWithSuggestion:()EDSearchableIndexQueryTransformer searchableIndexManager:;
@end

@implementation NSCompoundPredicate(EDSearchableIndexQueryTransformer)

- (id)ed_transformSearchableIndexPredicateWithSuggestion:()EDSearchableIndexQueryTransformer searchableIndexManager:
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(a1, "ed_hasOnlySpotlightKeypaths"))
  {
    v8 = +[EDSearchableIndexQueryTransformer transformSearchableIndexPredicate:a1 suggestion:v6 searchableIndexManager:v7];
  }
  else
  {
    v9 = [a1 subpredicates];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __132__NSCompoundPredicate_EDSearchableIndexQueryTransformer__ed_transformSearchableIndexPredicateWithSuggestion_searchableIndexManager___block_invoke;
    v16 = &unk_1E6C05C00;
    id v17 = v6;
    id v18 = v7;
    v10 = objc_msgSend(v9, "ef_compactMap:", &v13);

    id v11 = objc_alloc(MEMORY[0x1E4F28BA0]);
    v8 = objc_msgSend(v11, "initWithType:subpredicates:", objc_msgSend(a1, "compoundPredicateType", v13, v14, v15, v16), v10);
  }

  return v8;
}

@end