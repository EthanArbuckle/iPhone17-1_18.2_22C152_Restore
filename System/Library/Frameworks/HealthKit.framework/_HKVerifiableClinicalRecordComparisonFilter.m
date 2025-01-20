@interface _HKVerifiableClinicalRecordComparisonFilter
+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)_acceptsSampleWithDate:(id)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKVerifiableClinicalRecordComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  return [a3 isEqualToString:@"relevantDate"];
}

+ (id)allowedDataTypeClassesForKeyPath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 setWithObject:v4];
}

+ (id)allowedValueClassesForKeyPath:(id)a3
{
  if ([a3 isEqualToString:@"relevantDate"])
  {
    [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  }
  else
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"_HKVerifiableClinicalRecordComparisonFilter.m" lineNumber:37 description:@"Unreachable code has been executed"];

    [MEMORY[0x1E4F1CAD0] set];
  v5 = };

  return v5;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  return +[_HKComparisonFilter isAllowedPredicateOperatorType:a3 forKeyPath:a4];
}

+ (BOOL)allowsEmptyDataTypesSetForKeyPath:(id)a3
{
  return 1;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"relevantDate"])
  {
    id v6 = 0;
  }
  else
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKVerifiableClinicalRecordComparisonFilter.m" lineNumber:52 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKVerifiableClinicalRecordComparisonFilter;
    id v6 = objc_msgSendSuper2(&v9, sel_enumRepresentationForKeyPath_, v5);
  }

  return (int64_t)v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    if ([(_HKComparisonFilter *)self keyPathIntegerValue])
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2 object:self file:@"_HKVerifiableClinicalRecordComparisonFilter.m" lineNumber:66 description:@"Unreachable code has been executed"];
      BOOL v8 = 0;
    }
    else
    {
      v7 = [v6 relevantDate];
      BOOL v8 = [(_HKVerifiableClinicalRecordComparisonFilter *)self _acceptsSampleWithDate:v7];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_acceptsSampleWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = [v4 compare:v5];

  LOBYTE(self) = HKComparisonResultMatchesPredicateOperator(v6, [(_HKComparisonFilter *)self operatorType]);
  return (char)self;
}

@end