@interface HKMedicationOrderType
+ (id)allTypes;
+ (id)medicationOrderType;
@end

@implementation HKMedicationOrderType

+ (id)allTypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 medicationOrderTypeForIdentifier:@"HKMedicalTypeIdentifierMedicationOrder"];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)medicationOrderType
{
  return (id)[a1 medicationOrderTypeForIdentifier:@"HKMedicalTypeIdentifierMedicationOrder"];
}

@end