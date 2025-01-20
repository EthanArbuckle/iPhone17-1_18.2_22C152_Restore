@interface HKMedicalType
+ (id)allTypes;
@end

@implementation HKMedicalType

+ (id)allTypes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end