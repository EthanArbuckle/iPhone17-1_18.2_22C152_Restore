@interface EDSearchableIndexExpressionGenerator
+ (BOOL)_keyPathIsSuggestable:(id)a3;
+ (id)_comparisonOperationMatchingValue:(id)a3 operatorType:(unint64_t)a4;
+ (id)_operandStringForCompoundPredicateType:(unint64_t)a3;
+ (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4 operatorType:(unint64_t)a5;
+ (id)expressionForPredicate:(id)a3 suggestion:(id)a4;
+ (id)queryStringByJoiningQueries:(id)a3 withPredicateType:(unint64_t)a4;
+ (id)searchableIndexQueryStringForComparisionPredicate:(id)a3 hasSuggestion:(BOOL)a4;
@end

@implementation EDSearchableIndexExpressionGenerator

+ (id)expressionForPredicate:(id)a3 suggestion:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v22 = 0;
  if ((objc_msgSend(v7, "ed_hasOnlySpotlightKeypaths") & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"EDSearchableIndexExpressionGenerator.m", 91, @"Invalid parameter not satisfying: %@", @"predicate.ed_hasOnlySpotlightKeypaths" object file lineNumber description];
  }
  v9 = objc_msgSend(v7, "ed_searchableIndexQueryStringForQueryWithSuggestion:originalSearchString:", v8 != 0, &v22);
  v10 = [NSString stringWithFormat:@"%@ = %@", *MEMORY[0x1E4F22C60], *MEMORY[0x1E4F443A8]];
  if (v22)
  {
    id v11 = [NSString alloc];
    v12 = (void *)[v11 initWithFormat:@"%@ == '*'", *MEMORY[0x1E4F234E0]];
    v13 = (void *)MEMORY[0x1E4F60468];
    v24[0] = v10;
    v24[1] = v12;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    uint64_t v15 = [v13 queryStringByJoiningQueries:v14 withOperand:2];

    v10 = (void *)v15;
  }
  if (v9)
  {
    v16 = (void *)MEMORY[0x1E4F60468];
    v23[0] = v10;
    v23[1] = v9;
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
    id v18 = [v16 queryStringByJoiningQueries:v17 withOperand:1];
  }
  else
  {
    id v18 = v10;
  }
  v19 = [MEMORY[0x1E4F60470] expressionWithQueryString:v18 searchString:v22 updatedSuggestion:v8];

  return v19;
}

+ (id)searchableIndexQueryStringForComparisionPredicate:(id)a3 hasSuggestion:(BOOL)a4
{
  BOOL v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (searchableIndexQueryStringForComparisionPredicate_hasSuggestion__onceToken != -1) {
    dispatch_once(&searchableIndexQueryStringForComparisionPredicate_hasSuggestion__onceToken, &__block_literal_global_31_0);
  }
  id v7 = [v6 leftExpression];
  id v8 = [v7 keyPath];

  if (v4 && ([a1 _keyPathIsSuggestable:v8] & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    uint64_t v10 = [v6 predicateOperatorType];
    id v11 = [v6 rightExpression];
    v12 = [v11 constantValue];

    if ([v8 isEqualToString:*MEMORY[0x1E4F5FE30]])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 timeIntervalSinceReferenceDate];
        v14 = objc_msgSend(NSString, "stringWithFormat:", @"$time.absolute(%f)", v13);
        v18[0] = *MEMORY[0x1E4F23700];
        uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        v9 = [a1 _queryWithAttributes:v15 matchingValue:v14 operatorType:v10];
      }
      else
      {
        v9 = 0;
      }
    }
    else
    {
      v16 = [(id)searchableIndexQueryStringForComparisionPredicate_hasSuggestion__spotlightAttributesForKeypath objectForKeyedSubscript:v8];
      if (v16)
      {
        v9 = [a1 _queryWithAttributes:v16 matchingValue:v12 operatorType:v10];
      }
      else
      {
        v9 = 0;
      }
    }
  }

  return v9;
}

void __104__EDSearchableIndexExpressionGenerator_searchableIndexQueryStringForComparisionPredicate_hasSuggestion___block_invoke()
{
  v15[5] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F5FF50];
  uint64_t v0 = *MEMORY[0x1E4F234A8];
  v13[0] = *MEMORY[0x1E4F234B0];
  v13[1] = v0;
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  v15[0] = v1;
  v14[1] = *MEMORY[0x1E4F5FF20];
  uint64_t v2 = *MEMORY[0x1E4F22B18];
  v12[0] = *MEMORY[0x1E4F22B30];
  v12[1] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v15[1] = v3;
  v14[2] = *MEMORY[0x1E4F5FF10];
  uint64_t v11 = *MEMORY[0x1E4F235C0];
  BOOL v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
  v15[2] = v4;
  v14[3] = *MEMORY[0x1E4F5FF08];
  uint64_t v10 = *MEMORY[0x1E4F235F8];
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v15[3] = v5;
  v14[4] = *MEMORY[0x1E4F5FEC8];
  uint64_t v9 = *MEMORY[0x1E4F23140];
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
  v15[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
  id v8 = (void *)searchableIndexQueryStringForComparisionPredicate_hasSuggestion__spotlightAttributesForKeypath;
  searchableIndexQueryStringForComparisionPredicate_hasSuggestion__spotlightAttributesForKeypath = v7;
}

+ (id)queryStringByJoiningQueries:(id)a3 withPredicateType:(unint64_t)a4
{
  id v6 = a3;
  if ((unint64_t)[v6 count] > 1)
  {
    id v8 = NSString;
    uint64_t v9 = [a1 _operandStringForCompoundPredicateType:a4];
    uint64_t v10 = [v8 stringWithFormat:@" %@ ", v9];

    uint64_t v11 = NSString;
    v12 = [v6 componentsJoinedByString:v10];
    uint64_t v7 = [v11 stringWithFormat:@"(%@)", v12];
  }
  else
  {
    uint64_t v7 = [v6 firstObject];
  }

  return v7;
}

+ (id)_operandStringForCompoundPredicateType:(unint64_t)a3
{
  v3 = @"&&";
  if (a3 == 2) {
    v3 = @"||";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"!";
  }
}

+ (id)_queryWithAttributes:(id)a3 matchingValue:(id)a4 operatorType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 _comparisonOperationMatchingValue:v9 operatorType:a5];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__EDSearchableIndexExpressionGenerator__queryWithAttributes_matchingValue_operatorType___block_invoke;
  v16[3] = &unk_1E6C03DE0;
  id v11 = v10;
  id v17 = v11;
  v12 = objc_msgSend(v8, "ef_map:", v16);
  if (a5 == 5) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = 2;
  }
  v14 = [MEMORY[0x1E4F60468] queryStringByJoiningQueries:v12 withOperand:v13];

  return v14;
}

id __88__EDSearchableIndexExpressionGenerator__queryWithAttributes_matchingValue_operatorType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [NSString stringWithFormat:@"%@ %@", a2, *(void *)(a1 + 32)];

  return v2;
}

+ (id)_comparisonOperationMatchingValue:(id)a3 operatorType:(unint64_t)a4
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = objc_msgSend(v7, "em_stringForQuotingWithCharacter:", 39);
    id v9 = @"= '%@*'cdwt";
    switch(a4)
    {
      case 0uLL:
        id v9 = @"< %@";
        goto LABEL_13;
      case 1uLL:
        id v9 = @"<= %@";
        goto LABEL_13;
      case 2uLL:
        id v9 = @"> %@";
        goto LABEL_13;
      case 3uLL:
        id v9 = @">= %@";
        goto LABEL_13;
      case 4uLL:
        id v9 = @"= '%@'cd";
        goto LABEL_13;
      case 5uLL:
        id v9 = @"!= '%@'cd";
        goto LABEL_13;
      case 6uLL:
      case 7uLL:
        goto LABEL_6;
      case 8uLL:
        goto LABEL_13;
      case 9uLL:
        id v9 = @"= '*%@'cdwt";
        goto LABEL_13;
      default:
        if (a4 == 99)
        {
LABEL_13:
          uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v8);
        }
        else
        {
LABEL_6:
          id v11 = [MEMORY[0x1E4F28B00] currentHandler:@"= '%@*'cdwt"];
          [v11 handleFailureInMethod:a2 object:a1 file:@"EDSearchableIndexExpressionGenerator.m" lineNumber:204 description:@"unexpected operator type"];

          uint64_t v10 = 0;
        }

        break;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)_keyPathIsSuggestable:(id)a3
{
  id v3 = a3;
  if (_keyPathIsSuggestable__onceToken != -1) {
    dispatch_once(&_keyPathIsSuggestable__onceToken, &__block_literal_global_84);
  }
  char v4 = [(id)_keyPathIsSuggestable__suggestableKeyPaths containsObject:v3];

  return v4;
}

void __62__EDSearchableIndexExpressionGenerator__keyPathIsSuggestable___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F5FF50], *MEMORY[0x1E4F5FF58], *MEMORY[0x1E4F5FE08], *MEMORY[0x1E4F5FDD0], *MEMORY[0x1E4F5FDD8], *MEMORY[0x1E4F5FF20], *MEMORY[0x1E4F5FF28], *MEMORY[0x1E4F5FF10], *MEMORY[0x1E4F5FF08], *MEMORY[0x1E4F5FE30], 0);
  v1 = (void *)_keyPathIsSuggestable__suggestableKeyPaths;
  _keyPathIsSuggestable__suggestableKeyPaths = v0;
}

@end