@interface HKMedicationDispenseRecordType
+ (id)allTypes;
+ (id)medicationDispenseRecordType;
@end

@implementation HKMedicationDispenseRecordType

+ (id)allTypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 medicationDispenseRecordTypeForIdentifier:@"HKMedicalTypeIdentifierMedicationDispenseRecord"];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)medicationDispenseRecordType
{
  return (id)[a1 medicationDispenseRecordTypeForIdentifier:@"HKMedicalTypeIdentifierMedicationDispenseRecord"];
}

@end