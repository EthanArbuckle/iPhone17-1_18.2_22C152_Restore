@interface NSOrderedCollectionDifference(EmailFoundationAdditions)
- (id)ef_groupedInsertions;
- (id)ef_groupedInsertionsByObjectForTargetArray:()EmailFoundationAdditions inferMoves:;
- (id)ef_groupedInsertionsByObjectForTargetOrderedSet:()EmailFoundationAdditions inferMoves:;
- (id)ef_removalsExcludingMoves;
@end

@implementation NSOrderedCollectionDifference(EmailFoundationAdditions)

- (id)ef_groupedInsertions
{
  v2 = [a1 insertions];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__NSOrderedCollectionDifference_EmailFoundationAdditions__ef_groupedInsertions__block_invoke;
    v8[3] = &unk_1E6122700;
    id v6 = v4;
    id v9 = v6;
    -[NSOrderedCollectionDifference _groupedInsertionsWithObjectsToInsert:insertGroup:](a1, v5, v8);
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

- (id)ef_removalsExcludingMoves
{
  v1 = [a1 removals];
  v2 = objc_msgSend(v1, "ef_filter:", &__block_literal_global_18);

  return v2;
}

- (id)ef_groupedInsertionsByObjectForTargetArray:()EmailFoundationAdditions inferMoves:
{
  v4 = -[NSOrderedCollectionDifference _groupedInsertionsByObjectForCollection:inferMoves:](a1, a3, a4);
  return v4;
}

- (id)ef_groupedInsertionsByObjectForTargetOrderedSet:()EmailFoundationAdditions inferMoves:
{
  v4 = -[NSOrderedCollectionDifference _groupedInsertionsByObjectForCollection:inferMoves:](a1, a3, a4);
  return v4;
}

@end