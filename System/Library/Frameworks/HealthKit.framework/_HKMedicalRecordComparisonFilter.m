@interface _HKMedicalRecordComparisonFilter
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)_acceptsRecordWithDate:(id)a3;
- (BOOL)_acceptsRecordWithManuallyEnteredIdentifier:(unint64_t)a3;
- (BOOL)_acceptsRecordWithState:(unint64_t)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKMedicalRecordComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"modifiedDate"] & 1) != 0
    || ([v3 isEqualToString:@"medicalRecordOriginType"] & 1) != 0
    || ([v3 isEqualToString:@"sortDate"] & 1) != 0
    || ([v3 isEqualToString:@"state"] & 1) != 0
    || ([v3 isEqualToString:@"userDomainConcept"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"signedClinicalDataOriginIdentifier"];
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
  if ([v5 isEqualToString:@"modifiedDate"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
LABEL_8:
    uint64_t v9 = [v6 setWithObject:objc_opt_class()];
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"medicalRecordOriginType"]) {
    goto LABEL_7;
  }
  if ([v5 isEqualToString:@"sortDate"])
  {
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    goto LABEL_9;
  }
  if ([v5 isEqualToString:@"state"])
  {
LABEL_7:
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"userDomainConcept"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_8;
  }
  if ([v5 isEqualToString:@"signedClinicalDataOriginIdentifier"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_8;
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2 object:a1 file:@"_HKMedicalRecordComparisonFilter.m" lineNumber:70 description:@"Unreachable code has been executed"];

  uint64_t v9 = [MEMORY[0x1E4F1CAD0] set];
LABEL_9:
  v10 = (void *)v9;

  return v10;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:@"medicalRecordOriginType"] & 1) != 0
    || [v5 isEqualToString:@"state"])
  {
    BOOL v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else if ([v5 isEqualToString:@"userDomainConcept"])
  {
    BOOL v6 = a3 == 99;
  }
  else
  {
    if (![v5 isEqualToString:@"signedClinicalDataOriginIdentifier"])
    {
      BOOL v7 = +[_HKComparisonFilter isAllowedPredicateOperatorType:a3 forKeyPath:v5];
      goto LABEL_7;
    }
    BOOL v6 = a3 == 4;
  }
  BOOL v7 = v6;
LABEL_7:

  return v7;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"modifiedDate"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"medicalRecordOriginType"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"sortDate"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"state"])
  {
    int64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"userDomainConcept"])
  {
    int64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"signedClinicalDataOriginIdentifier"])
  {
    int64_t v6 = 5;
  }
  else
  {
    BOOL v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKMedicalRecordComparisonFilter.m" lineNumber:112 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKMedicalRecordComparisonFilter;
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
    switch([(_HKComparisonFilter *)self keyPathIntegerValue])
    {
      case 0:
        BOOL v7 = [v6 modifiedDate];
        BOOL v8 = [(_HKMedicalRecordComparisonFilter *)self _acceptsRecordWithDate:v7];
        goto LABEL_8;
      case 1:
        BOOL v10 = -[_HKMedicalRecordComparisonFilter _acceptsRecordWithManuallyEnteredIdentifier:](self, "_acceptsRecordWithManuallyEnteredIdentifier:", [v6 medicalRecordOriginType]);
        goto LABEL_10;
      case 2:
        BOOL v7 = [v6 sortDate];
        v11 = [v7 date];
        BOOL v8 = [(_HKMedicalRecordComparisonFilter *)self _acceptsRecordWithDate:v11];

LABEL_8:
        goto LABEL_15;
      case 3:
        BOOL v10 = -[_HKMedicalRecordComparisonFilter _acceptsRecordWithState:](self, "_acceptsRecordWithState:", [v6 state]);
LABEL_10:
        BOOL v8 = v10;
        goto LABEL_15;
      case 4:
        v12 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v13 = *MEMORY[0x1E4F1C3C8];
        v14 = @"_KeyPathEnumValueUserDomainConcept does not support in-memory filtering";
        goto LABEL_13;
      case 5:
        v12 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v13 = *MEMORY[0x1E4F1C3C8];
        v14 = @"_KeyPathEnumValueSignedClinicalDataOriginIdentifier does not support in-memory filtering";
LABEL_13:
        [v12 raise:v13 format:v14];
        break;
      default:
        objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"_HKMedicalRecordComparisonFilter.m" lineNumber:140 description:@"Unreachable code has been executed"];

        break;
    }
    BOOL v8 = 0;
LABEL_15:
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_acceptsRecordWithDate:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKComparisonFilter *)self value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v7 = [(_HKComparisonFilter *)self value];
  BOOL v8 = v7;
  if (isKindOfClass)
  {
    uint64_t v9 = [v7 date];

    BOOL v8 = (void *)v9;
  }

  unint64_t v10 = [v4 compare:v8];
  BOOL v11 = HKComparisonResultMatchesPredicateOperator(v10, [(_HKComparisonFilter *)self operatorType]);

  return v11;
}

- (BOOL)_acceptsRecordWithManuallyEnteredIdentifier:(unint64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

- (BOOL)_acceptsRecordWithState:(unint64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

@end