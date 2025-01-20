@interface HKVaccinationRecordType
+ (id)allTypes;
+ (id)vaccinationRecordType;
@end

@implementation HKVaccinationRecordType

+ (id)allTypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 vaccinationRecordTypeForIdentifier:@"HKMedicalTypeIdentifierVaccinationRecord"];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)vaccinationRecordType
{
  return (id)[a1 vaccinationRecordTypeForIdentifier:@"HKMedicalTypeIdentifierVaccinationRecord"];
}

@end