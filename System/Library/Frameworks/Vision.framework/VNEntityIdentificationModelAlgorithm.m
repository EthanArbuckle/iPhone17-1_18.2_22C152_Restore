@interface VNEntityIdentificationModelAlgorithm
+ (BOOL)supportsSecureCoding;
- (Class)trainedModelClass;
- (VNEntityIdentificationModelAlgorithm)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation VNEntityIdentificationModelAlgorithm

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VNEntityIdentificationModelAlgorithm)initWithCoder:(id)a3
{
  v4 = (VNEntityIdentificationModelAlgorithm *)objc_alloc_init((Class)objc_opt_class());

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v3);
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (Class)trainedModelClass
{
  return 0;
}

@end