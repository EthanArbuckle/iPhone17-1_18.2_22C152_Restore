@interface HKClinicalType
+ (id)allTypes;
+ (id)allergyRecordType;
+ (id)clinicalNoteRecordType;
+ (id)conditionRecordType;
+ (id)coverageRecordType;
+ (id)immunizationRecordType;
+ (id)labResultRecordType;
+ (id)medicationRecordType;
+ (id)procedureRecordType;
+ (id)sampleTypesForResourceType:(id)a3 error:(id *)a4;
+ (id)vitalSignRecordType;
- (BOOL)isClinicalType;
- (HKClinicalType)initWithIdentifier:(id)a3;
@end

@implementation HKClinicalType

- (HKClinicalType)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[HKObjectType clinicalTypeForIdentifier:v4];

  if (!v5) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Invalid %@ identifier \"%@\"", objc_opt_class(), v4 format];
  }

  return v5;
}

- (BOOL)isClinicalType
{
  return 1;
}

+ (id)sampleTypesForResourceType:(id)a3 error:(id *)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isEqualToString:@"AllergyIntolerance"])
  {
    v6 = +[HKClinicalType allergyRecordType];
    v20[0] = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = (void **)v20;
LABEL_18:
    v9 = [v7 arrayWithObjects:v8 count:1];
LABEL_19:

    goto LABEL_20;
  }
  if ([v5 isEqualToString:@"Condition"])
  {
    v6 = +[HKClinicalType conditionRecordType];
    v19 = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v19;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:@"Coverage"])
  {
    v6 = +[HKClinicalType coverageRecordType];
    v18 = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v18;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:@"DiagnosticReport"])
  {
    v6 = +[HKClinicalType clinicalNoteRecordType];
    v17 = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v17;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:@"DocumentReference"])
  {
    v6 = +[HKClinicalType clinicalNoteRecordType];
    v16 = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v16;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:@"Immunization"])
  {
    v6 = +[HKClinicalType immunizationRecordType];
    v15 = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v15;
    goto LABEL_18;
  }
  if (([v5 isEqualToString:@"MedicationDispense"] & 1) != 0
    || ([v5 isEqualToString:@"MedicationOrder"] & 1) != 0
    || ([v5 isEqualToString:@"MedicationRequest"] & 1) != 0
    || [v5 isEqualToString:@"MedicationStatement"])
  {
    v6 = +[HKClinicalType medicationRecordType];
    v14 = v6;
    v7 = (void *)MEMORY[0x1E4F1C978];
    v8 = &v14;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:@"Observation"])
  {
    v6 = +[HKClinicalType labResultRecordType];
    v13[0] = v6;
    v11 = +[HKClinicalType vitalSignRecordType];
    v13[1] = v11;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];

    goto LABEL_19;
  }
  if ([v5 isEqualToString:@"Patient"])
  {
    v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    if ([v5 isEqualToString:@"Procedure"])
    {
      v6 = +[HKClinicalType procedureRecordType];
      v12 = v6;
      v7 = (void *)MEMORY[0x1E4F1C978];
      v8 = &v12;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"There is no clinical record type known for resourceType %@", v5);
    v9 = 0;
  }
LABEL_20:

  return v9;
}

+ (id)allTypes
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__HKClinicalType_allTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allTypes_onceToken != -1) {
    dispatch_once(&allTypes_onceToken, block);
  }
  v2 = (void *)allTypes_allTypes;

  return v2;
}

void __26__HKClinicalType_allTypes__block_invoke(uint64_t a1)
{
  v13[9] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierAllergyRecord"];
  v3 = objc_msgSend(*(id *)(a1 + 32), "clinicalTypeForIdentifier:", @"HKClinicalTypeIdentifierConditionRecord", v2);
  v13[1] = v3;
  id v4 = [*(id *)(a1 + 32) clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierImmunizationRecord"];
  void v13[2] = v4;
  id v5 = [*(id *)(a1 + 32) clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierLabResultRecord"];
  v13[3] = v5;
  v6 = [*(id *)(a1 + 32) clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierMedicationRecord"];
  v13[4] = v6;
  v7 = [*(id *)(a1 + 32) clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierProcedureRecord"];
  v13[5] = v7;
  v8 = [*(id *)(a1 + 32) clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierVitalSignRecord"];
  v13[6] = v8;
  v9 = [*(id *)(a1 + 32) clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierCoverageRecord"];
  v13[7] = v9;
  v10 = [*(id *)(a1 + 32) clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierClinicalNoteRecord"];
  v13[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:9];
  v12 = (void *)allTypes_allTypes;
  allTypes_allTypes = v11;
}

+ (id)allergyRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierAllergyRecord"];
}

+ (id)conditionRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierConditionRecord"];
}

+ (id)immunizationRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierImmunizationRecord"];
}

+ (id)labResultRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierLabResultRecord"];
}

+ (id)medicationRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierMedicationRecord"];
}

+ (id)procedureRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierProcedureRecord"];
}

+ (id)vitalSignRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierVitalSignRecord"];
}

+ (id)coverageRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierCoverageRecord"];
}

+ (id)clinicalNoteRecordType
{
  return (id)[a1 clinicalTypeForIdentifier:@"HKClinicalTypeIdentifierClinicalNoteRecord"];
}

@end