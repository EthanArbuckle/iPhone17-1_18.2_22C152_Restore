@interface NSComparisonPredicate(EmailFoundationAdditions)
- (id)ef_publicDescription;
- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions;
- (uint64_t)ef_matchesEverything;
- (uint64_t)ef_matchesNothing;
@end

@implementation NSComparisonPredicate(EmailFoundationAdditions)

- (uint64_t)ef_matchesNothing
{
  v2 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  uint64_t v3 = [a1 isEqual:v2];

  return v3;
}

- (uint64_t)ef_matchesEverything
{
  v2 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  uint64_t v3 = [a1 isEqual:v2];

  return v3;
}

- (id)ef_publicDescription
{
  if ([a1 comparisonPredicateModifier] == 1)
  {
    v2 = @"ALL ";
  }
  else if ([a1 comparisonPredicateModifier] == 2)
  {
    v2 = @"ANY ";
  }
  else
  {
    v2 = &stru_1F0EAE5A8;
  }
  uint64_t v3 = NSString;
  v4 = [a1 leftExpression];
  v5 = describableObjectForExpression(v4);
  v6 = [a1 predicateOperator];
  v7 = [a1 rightExpression];
  v8 = describableObjectForExpression(v7);
  v9 = [v3 stringWithFormat:@"%@%@ %@ %@", v2, v5, v6, v8];

  return v9;
}

- (uint64_t)ef_containsKeyPath:()EmailFoundationAdditions
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__NSComparisonPredicate_EmailFoundationAdditions__ef_containsKeyPath___block_invoke;
  aBlock[3] = &unk_1E6122810;
  id v5 = v4;
  id v12 = v5;
  v6 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  v7 = [a1 leftExpression];
  if (v6[2](v6, v7))
  {
    uint64_t v8 = 1;
  }
  else
  {
    v9 = [a1 rightExpression];
    uint64_t v8 = v6[2](v6, v9);
  }
  return v8;
}

@end