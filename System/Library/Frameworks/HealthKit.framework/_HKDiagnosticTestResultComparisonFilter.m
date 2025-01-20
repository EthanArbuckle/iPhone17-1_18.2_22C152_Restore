@interface _HKDiagnosticTestResultComparisonFilter
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)_acceptsDiagnosticTestResultWithCategory:(id)a3;
- (BOOL)_acceptsDiagnosticTestResultWithReferenceRangeStatus:(int64_t)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKDiagnosticTestResultComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"category"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"referenceRangeStatus"];
  }

  return v4;
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"category"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
LABEL_5:
    id v7 = [v6 setWithObject:objc_opt_class()];
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"referenceRangeStatus"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_5;
  }
  v8 = [MEMORY[0x1E4F28B00] currentHandler];
  [v8 handleFailureInMethod:a2 object:a1 file:@"_HKDiagnosticTestResultComparisonFilter.m" lineNumber:50 description:@"Unreachable code has been executed"];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
LABEL_7:
  v9 = v7;

  return v9;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"category"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"referenceRangeStatus"])
  {
    int64_t v6 = 1;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKDiagnosticTestResultComparisonFilter.m" lineNumber:61 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKDiagnosticTestResultComparisonFilter;
    int64_t v6 = (int64_t)objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    int64_t v7 = [(_HKComparisonFilter *)self keyPathIntegerValue];
    if (v7 == 1)
    {
      BOOL v9 = -[_HKDiagnosticTestResultComparisonFilter _acceptsDiagnosticTestResultWithReferenceRangeStatus:](self, "_acceptsDiagnosticTestResultWithReferenceRangeStatus:", [v6 referenceRangeStatus]);
    }
    else if (v7)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"_HKDiagnosticTestResultComparisonFilter.m" lineNumber:77 description:@"Unreachable code has been executed"];

      BOOL v9 = 0;
    }
    else
    {
      v8 = [v6 category];
      BOOL v9 = [(_HKDiagnosticTestResultComparisonFilter *)self _acceptsDiagnosticTestResultWithCategory:v8];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)_acceptsDiagnosticTestResultWithCategory:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = [v4 compare:v5];

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

- (BOOL)_acceptsDiagnosticTestResultWithReferenceRangeStatus:(int64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

@end