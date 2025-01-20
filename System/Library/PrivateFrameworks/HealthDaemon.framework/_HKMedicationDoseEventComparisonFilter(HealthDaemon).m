@interface _HKMedicationDoseEventComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKMedicationDoseEventComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  v3 = a1;
  v4 = [a1 keyPath];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F2A448]];

  if (v5)
  {
    if (!v3) {
      goto LABEL_23;
    }
    uint64_t v6 = [v3 operatorType];
    uint64_t v7 = [v3 value];
    v8 = (void *)v7;
    if (v6 == 10) {
      HDMedicationDoseEventEntityPredicateForStatuses(v7);
    }
    else {
      HDMedicationDoseEventEntityPredicateForStatus(v7, [v3 operatorType] == 4);
    }
    uint64_t v21 = LABEL_18:;
    v3 = (void *)v21;

    goto LABEL_23;
  }
  v9 = [v3 keyPath];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F2A3C0]];

  if (v10)
  {
    if (!v3) {
      goto LABEL_23;
    }
    uint64_t v11 = [v3 operatorType];
    uint64_t v12 = [v3 value];
    v8 = (void *)v12;
    if (v11 == 10) {
      HDMedicationDoseEventEntityPredicateForMedicationIdentifiers(v12);
    }
    else {
      HDMedicationDoseEventEntityPredicateForMedicationIdentifier(v12, [v3 operatorType] == 4);
    }
    goto LABEL_18;
  }
  v13 = [v3 keyPath];
  int v14 = [v13 isEqualToString:*MEMORY[0x1E4F2A3A0]];

  if (v14)
  {
    if (!v3) {
      goto LABEL_23;
    }
    uint64_t v15 = [v3 operatorType];
    v16 = [v3 value];
    v8 = v16;
    if (v15 == 10) {
      HDMedicationDoseEventEntityPredicateForHashedMedicationIdentifiers(v16);
    }
    else {
      HDMedicationDoseEventEntityPredicateForHashedMedicationIdentifier(v16, [v3 operatorType] == 4);
    }
    goto LABEL_18;
  }
  v17 = [v3 keyPath];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4F2A408]];

  if (v18)
  {
    if (!v3) {
      goto LABEL_23;
    }
    uint64_t v19 = [v3 operatorType];
    uint64_t v20 = [v3 value];
    v8 = (void *)v20;
    if (v19 == 10) {
      HDMedicationDoseEventEntityPredicateForScheduleItemIdentifiers(v20);
    }
    else {
      HDMedicationDoseEventEntityPredicateForScheduleItemIdentifier(v20, [v3 operatorType] == 4);
    }
    goto LABEL_18;
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2 object:v3 file:@"_HKMedicationDoseEventComparisonFilter+HealthDaemon.m" lineNumber:39 description:@"Unreachable code has been executed"];

  v3 = [MEMORY[0x1E4F65D58] falsePredicate];
LABEL_23:

  return v3;
}

@end