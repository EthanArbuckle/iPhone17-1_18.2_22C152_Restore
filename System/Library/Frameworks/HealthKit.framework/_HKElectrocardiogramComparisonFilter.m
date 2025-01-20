@interface _HKElectrocardiogramComparisonFilter
+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5;
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)_acceptsECGWithAverageHeartRate:(id)a3;
- (BOOL)_acceptsECGWithPrivateClassification:(unint64_t)a3;
- (BOOL)_acceptsECGWithPublicClassification:(int64_t)a3;
- (BOOL)_acceptsECGWithSymptomsStatus:(int64_t)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKElectrocardiogramComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"ecg_average_heart_rate"] & 1) != 0
    || ([v3 isEqualToString:@"ecg_public_classification"] & 1) != 0
    || ([v3 isEqualToString:@"ecg_private_classification"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"ecg_symptoms_status"];
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
  if ([v5 isEqualToString:@"ecg_average_heart_rate"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
LABEL_7:
    id v7 = [v6 setWithObject:objc_opt_class()];
    goto LABEL_8;
  }
  if (([v5 isEqualToString:@"ecg_public_classification"] & 1) != 0
    || ([v5 isEqualToString:@"ecg_private_classification"] & 1) != 0
    || [v5 isEqualToString:@"ecg_symptoms_status"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    goto LABEL_7;
  }
  v10 = [MEMORY[0x1E4F28B00] currentHandler];
  [v10 handleFailureInMethod:a2 object:a1 file:@"_HKElectrocardiogramComparisonFilter.m" lineNumber:77 description:@"Unreachable code has been executed"];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
LABEL_8:
  v8 = v7;

  return v8;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v5 = a4;
  if (([v5 isEqualToString:@"ecg_public_classification"] & 1) != 0
    || ([v5 isEqualToString:@"ecg_private_classification"] & 1) != 0
    || [v5 isEqualToString:@"ecg_symptoms_status"])
  {
    BOOL v6 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else
  {
    BOOL v6 = +[_HKComparisonFilter isAllowedPredicateOperatorType:a3 forKeyPath:v5];
  }

  return v6;
}

+ (BOOL)areValidTypes:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS____HKElectrocardiogramComparisonFilter;
  if (objc_msgSendSuper2(&v11, sel_areValidTypes_forKeyPath_error_, v8, a4, a5)) {
    char v9 = objc_msgSend(v8, "hk_allObjectsPassTestWithError:test:", a5, &__block_literal_global_43);
  }
  else {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS____HKElectrocardiogramComparisonFilter;
  if (!objc_msgSendSuper2(&v24, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v12, v13, a5, a6, a7))goto LABEL_15; {
  id v14 = v12;
  }
  id v15 = v13;
  if (![v15 isEqualToString:@"ecg_average_heart_rate"])
  {
    if ([v15 isEqualToString:@"ecg_public_classification"])
    {
      BOOL IsValid = _HKECGCPublicClassificationIsValid([v14 integerValue]);
    }
    else if ([v15 isEqualToString:@"ecg_private_classification"])
    {
      BOOL IsValid = _HKECGCPrivateClassificationIsValid([v14 integerValue]);
    }
    else
    {
      if (([v15 isEqualToString:@"ecg_symptoms_status"] & 1) == 0)
      {
        v21 = [MEMORY[0x1E4F28B00] currentHandler];
        v22 = objc_msgSend(NSString, "stringWithUTF8String:", "BOOL _IsValidValue(id  _Nullable __strong, NSString * _Nonnull __strong)");
        [v21 handleFailureInFunction:v22 file:@"_HKElectrocardiogramComparisonFilter.m" lineNumber:47 description:@"Unreachable code has been executed"];

        goto LABEL_14;
      }
      BOOL IsValid = _HKECGSymptomsStatusIsValid([v14 integerValue]);
    }
    BOOL v19 = IsValid;

    if (v19) {
      goto LABEL_12;
    }
LABEL_14:
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 3, @"Invalid value '%@' for %@", v14, v15);
LABEL_15:
    BOOL v20 = 0;
    goto LABEL_16;
  }
  v16 = +[HKUnit _countPerMinuteUnit];
  char v17 = [v14 isCompatibleWithUnit:v16];

  if ((v17 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  BOOL v20 = 1;
LABEL_16:

  return v20;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"ecg_average_heart_rate"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"ecg_public_classification"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"ecg_private_classification"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"ecg_symptoms_status"])
  {
    int64_t v6 = 3;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKElectrocardiogramComparisonFilter.m" lineNumber:139 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKElectrocardiogramComparisonFilter;
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
        id v7 = [v6 averageHeartRate];
        BOOL v8 = [(_HKElectrocardiogramComparisonFilter *)self _acceptsECGWithAverageHeartRate:v7];

        break;
      case 1:
        BOOL v10 = -[_HKElectrocardiogramComparisonFilter _acceptsECGWithPublicClassification:](self, "_acceptsECGWithPublicClassification:", [v6 classification]);
        goto LABEL_9;
      case 2:
        BOOL v10 = -[_HKElectrocardiogramComparisonFilter _acceptsECGWithPrivateClassification:](self, "_acceptsECGWithPrivateClassification:", [v6 privateClassification]);
        goto LABEL_9;
      case 3:
        BOOL v10 = -[_HKElectrocardiogramComparisonFilter _acceptsECGWithSymptomsStatus:](self, "_acceptsECGWithSymptomsStatus:", [v6 symptomsStatus]);
LABEL_9:
        BOOL v8 = v10;
        break;
      default:
        objc_super v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2 object:self file:@"_HKElectrocardiogramComparisonFilter.m" lineNumber:161 description:@"Unreachable code has been executed"];

        BOOL v8 = 0;
        break;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_acceptsECGWithPublicClassification:(int64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

- (BOOL)_acceptsECGWithAverageHeartRate:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = [v4 compare:v5];

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

- (BOOL)_acceptsECGWithPrivateClassification:(unint64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

- (BOOL)_acceptsECGWithSymptomsStatus:(int64_t)a3
{
  id v5 = [(_HKComparisonFilter *)self value];
  unint64_t v6 = HKCompareIntegers(a3, [v5 integerValue]);

  uint64_t v7 = [(_HKComparisonFilter *)self operatorType];

  return HKComparisonResultMatchesPredicateOperator(v6, v7);
}

@end