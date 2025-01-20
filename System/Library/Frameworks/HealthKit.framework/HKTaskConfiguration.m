@interface HKTaskConfiguration
+ (BOOL)supportsSecureCoding;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation HKTaskConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (objc_class *)objc_opt_class();

  return objc_alloc_init(v3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end