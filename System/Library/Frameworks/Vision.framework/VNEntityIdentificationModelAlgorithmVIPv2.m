@interface VNEntityIdentificationModelAlgorithmVIPv2
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)trainedModelClass;
@end

@implementation VNEntityIdentificationModelAlgorithmVIPv2

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    char isKindOfClass = 1;
  }
  else
  {
    id v3 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (Class)trainedModelClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end