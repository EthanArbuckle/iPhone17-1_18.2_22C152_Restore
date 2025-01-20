@interface CADEventTimeWindowPredicate(EKPredicateEvaluating)
- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating;
@end

@implementation CADEventTimeWindowPredicate(EKPredicateEvaluating)

- (uint64_t)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v4 = a3;
  v5 = [a1 wrappedPredicate];
  int v6 = [v5 evaluateWithObject:v4];

  if (!v6) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  v7 = [a1 startDate];
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;

  v10 = [a1 endDate];
  [v10 timeIntervalSinceReferenceDate];
  double v12 = v11;

  v13 = [v4 startDate];
  [v13 timeIntervalSinceReferenceDate];
  double v15 = v14;

  v16 = [v4 endDateUnadjustedForLegacyClients];
  [v16 timeIntervalSinceReferenceDate];
  double v18 = v17;

  if (v15 >= v12 || v18 <= v9 || (uint64_t v19 = 1, [a1 mustStartInInterval]) && v15 < v9)
  {
    v20 = [a1 wrappedPredicate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v22 = (void *)MEMORY[0x1E4F1CAF0];
      id v23 = v4;
      v24 = [v22 timeZoneWithAbbreviation:@"GMT"];
      v25 = [v23 eventStore];
      v26 = [a1 startDate];
      v27 = [a1 endDate];
      uint64_t v19 = objc_msgSend(v25, "occurrencesExistInRangeForEvent:startDate:endDate:mustStartInInterval:timezone:", v23, v26, v27, objc_msgSend(a1, "mustStartInInterval"), v24);

      goto LABEL_10;
    }
LABEL_9:
    uint64_t v19 = 0;
  }
LABEL_10:

  return v19;
}

@end