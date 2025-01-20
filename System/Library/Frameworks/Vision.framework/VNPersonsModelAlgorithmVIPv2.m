@interface VNPersonsModelAlgorithmVIPv2
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (Class)faceModelClass;
@end

@implementation VNPersonsModelAlgorithmVIPv2

- (BOOL)isEqual:(id)a3
{
  v4 = (VNPersonsModelAlgorithmVIPv2 *)a3;
  if (self == v4)
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (Class)faceModelClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end