@interface VNPersonsModelAlgorithm
+ (BOOL)supportsSecureCoding;
- (Class)faceModelClass;
- (VNPersonsModelAlgorithm)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation VNPersonsModelAlgorithm

- (VNPersonsModelAlgorithm)initWithCoder:(id)a3
{
  v4 = (VNPersonsModelAlgorithm *)objc_alloc_init((Class)objc_opt_class());

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

- (Class)faceModelClass
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end