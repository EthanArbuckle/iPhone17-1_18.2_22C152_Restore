@interface _HKMedicationDoseEventComparisonFilter
+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4;
+ (BOOL)isSupportedKeyPath:(id)a3;
+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7;
+ (id)allowedDataTypeClassesForKeyPath:(id)a3;
+ (id)allowedValueClassesForKeyPath:(id)a3;
+ (int64_t)enumRepresentationForKeyPath:(id)a3;
- (BOOL)_acceptsMedicationDoseEventWithHashedMedicationIdentifier:(id)a3;
- (BOOL)_acceptsMedicationDoseEventWithMedicationIdentifier:(id)a3;
- (BOOL)_acceptsMedicationDoseEventWithScheduleItemIdentifier:(id)a3;
- (BOOL)_acceptsMedicationDoseEventWithStatus:(int64_t)a3;
- (BOOL)acceptsDataObject:(id)a3;
@end

@implementation _HKMedicationDoseEventComparisonFilter

+ (BOOL)isSupportedKeyPath:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"status"] & 1) != 0
    || ([v3 isEqualToString:@"medicationIdentifier"] & 1) != 0
    || ([v3 isEqualToString:@"hashedMedicationIdentifier"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"scheduleItemIdentifier"];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isEqualToString:@"status"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v19;
LABEL_6:
    v9 = objc_msgSend(v7, "arrayWithObjects:count:", v8, 3, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
    v10 = [v6 setWithArray:v9];

    goto LABEL_7;
  }
  if (([v5 isEqualToString:@"medicationIdentifier"] & 1) != 0
    || [v5 isEqualToString:@"scheduleItemIdentifier"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v16;
    goto LABEL_6;
  }
  if ([v5 isEqualToString:@"hashedMedicationIdentifier"])
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v13;
    goto LABEL_6;
  }
  v12 = [MEMORY[0x1E4F28B00] currentHandler];
  [v12 handleFailureInMethod:a2 object:a1 file:@"_HKMedicationDoseEventComparisonFilter.m" lineNumber:61 description:@"Unreachable code has been executed"];

  v10 = [MEMORY[0x1E4F1CAD0] set];
LABEL_7:

  return v10;
}

+ (BOOL)isAllowedPredicateOperatorType:(unint64_t)a3 forKeyPath:(id)a4
{
  id v7 = a4;
  if (([v7 isEqualToString:@"status"] & 1) != 0
    || ([v7 isEqualToString:@"medicationIdentifier"] & 1) != 0
    || ([v7 isEqualToString:@"hashedMedicationIdentifier"] & 1) != 0
    || [v7 isEqualToString:@"scheduleItemIdentifier"])
  {
    BOOL v9 = a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"_HKMedicationDoseEventComparisonFilter.m" lineNumber:77 description:@"Unreachable code has been executed"];

    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)isValidValue:(id)a3 forKeyPath:(id)a4 operatorType:(unint64_t)a5 dataTypes:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  v19.receiver = a1;
  v19.super_class = (Class)&OBJC_METACLASS____HKMedicationDoseEventComparisonFilter;
  if (!objc_msgSendSuper2(&v19, sel_isValidValue_forKeyPath_operatorType_dataTypes_error_, v13, v14, a5, a6, a7))goto LABEL_8; {
  if (![v14 isEqualToString:@"status"]
  }
    && ([v14 isEqualToString:@"medicationIdentifier"] & 1) == 0
    && ![v14 isEqualToString:@"scheduleItemIdentifier"]
    && ![v14 isEqualToString:@"hashedMedicationIdentifier"])
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:a1 file:@"_HKMedicationDoseEventComparisonFilter.m" lineNumber:103 description:@"Unreachable code has been executed"];

LABEL_8:
    char v16 = 0;
    goto LABEL_9;
  }
  uint64_t v15 = objc_opt_class();
  char v16 = HKIsValueOrContainerValidForOperatorType(a5, v13, v15, (uint64_t)a7);
LABEL_9:

  return v16;
}

+ (int64_t)enumRepresentationForKeyPath:(id)a3
{
  id v5 = a3;
  if ([v5 isEqualToString:@"status"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"medicationIdentifier"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"hashedMedicationIdentifier"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"scheduleItemIdentifier"])
  {
    int64_t v6 = 3;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"_HKMedicationDoseEventComparisonFilter.m" lineNumber:124 description:@"Unreachable code has been executed"];

    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS____HKMedicationDoseEventComparisonFilter;
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
        BOOL v7 = -[_HKMedicationDoseEventComparisonFilter _acceptsMedicationDoseEventWithStatus:](self, "_acceptsMedicationDoseEventWithStatus:", [v6 status]);
        break;
      case 1:
        objc_super v9 = [v6 medicationIdentifier];
        BOOL v10 = [(_HKMedicationDoseEventComparisonFilter *)self _acceptsMedicationDoseEventWithMedicationIdentifier:v9];
        goto LABEL_9;
      case 2:
        v11 = [HKMedicationIdentifier alloc];
        v12 = [v6 medicationIdentifier];
        id v13 = [(HKMedicationIdentifier *)v11 initWithSemanticIdentifierString:v12];
        BOOL v7 = [(_HKMedicationDoseEventComparisonFilter *)self _acceptsMedicationDoseEventWithHashedMedicationIdentifier:v13];

        break;
      case 3:
        objc_super v9 = [v6 scheduleItemIdentifier];
        BOOL v10 = [(_HKMedicationDoseEventComparisonFilter *)self _acceptsMedicationDoseEventWithScheduleItemIdentifier:v9];
LABEL_9:
        BOOL v7 = v10;

        break;
      default:
        v8 = [MEMORY[0x1E4F28B00] currentHandler];
        [v8 handleFailureInMethod:a2 object:self file:@"_HKMedicationDoseEventComparisonFilter.m" lineNumber:142 description:@"Unreachable code has been executed"];

        BOOL v7 = 0;
        break;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_acceptsMedicationDoseEventWithStatus:(int64_t)a3
{
  unint64_t v5 = [(_HKComparisonFilter *)self operatorType];
  id v6 = [(_HKComparisonFilter *)self value];
  BOOL v7 = v6;
  if (v5 == 10)
  {
    v8 = [NSNumber numberWithInteger:a3];
    char v9 = [v7 containsObject:v8];

    return v9;
  }
  else
  {
    unint64_t v11 = HKCompareIntegers(a3, [v6 integerValue]);

    uint64_t v12 = [(_HKComparisonFilter *)self operatorType];
    return HKComparisonResultMatchesPredicateOperator(v11, v12);
  }
}

- (BOOL)_acceptsMedicationDoseEventWithMedicationIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_HKComparisonFilter *)self operatorType];
  id v6 = [(_HKComparisonFilter *)self value];
  BOOL v7 = v6;
  if (v5 == 10)
  {
    char v8 = [v6 containsObject:v4];

    return v8;
  }
  else
  {
    unint64_t v10 = [v6 compare:v4];

    uint64_t v11 = [(_HKComparisonFilter *)self operatorType];
    return HKComparisonResultMatchesPredicateOperator(v10, v11);
  }
}

- (BOOL)_acceptsMedicationDoseEventWithHashedMedicationIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_HKComparisonFilter *)self operatorType];
  id v6 = [(_HKComparisonFilter *)self value];
  BOOL v7 = v6;
  if (v5 == 10)
  {
    char v8 = [v6 containsObject:v4];
  }
  else
  {
    unint64_t v9 = [v6 compare:v4];

    char v8 = HKComparisonResultMatchesPredicateOperator(v9, [(_HKComparisonFilter *)self operatorType]);
  }

  return v8;
}

- (BOOL)_acceptsMedicationDoseEventWithScheduleItemIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(_HKComparisonFilter *)self operatorType];
  id v6 = [(_HKComparisonFilter *)self value];
  BOOL v7 = v6;
  if (v5 == 10)
  {
    char v8 = [v6 containsObject:v4];

    return v8;
  }
  else
  {
    unint64_t v10 = [v6 compare:v4];

    uint64_t v11 = [(_HKComparisonFilter *)self operatorType];
    return HKComparisonResultMatchesPredicateOperator(v10, v11);
  }
}

@end