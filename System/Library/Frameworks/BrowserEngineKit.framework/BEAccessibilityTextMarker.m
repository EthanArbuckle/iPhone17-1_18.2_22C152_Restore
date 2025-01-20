@interface BEAccessibilityTextMarker
+ (BOOL)supportsSecureCoding;
- (BEAccessibilityTextMarker)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BEAccessibilityTextMarker

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (BEAccessibilityTextMarker)initWithCoder:(id)a3
{
  return 0;
}

@end