@interface CADEventCreatedFromSuggestionPredicate(EKPredicateEvaluating)
- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating;
@end

@implementation CADEventCreatedFromSuggestionPredicate(EKPredicateEvaluating)

- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v4 suggestionInfo];
    v6 = [v5 opaqueKey];

    v7 = [a1 opaqueKey];
    uint64_t v8 = [v6 isEqualToString:v7];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end