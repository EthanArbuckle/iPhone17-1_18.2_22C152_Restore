@interface HKAccountOwnerType
+ (id)accountOwnerType;
+ (id)allTypes;
@end

@implementation HKAccountOwnerType

+ (id)allTypes
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 accountOwnerTypeForIdentifier:@"HKMedicalTypeIdentifierAccountOwner"];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)accountOwnerType
{
  return (id)[a1 accountOwnerTypeForIdentifier:@"HKMedicalTypeIdentifierAccountOwner"];
}

@end