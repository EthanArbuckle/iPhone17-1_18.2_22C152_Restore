@interface CLMiLoPlaceMetadata
+ (BOOL)supportsSecureCoding;
- (CLMiLoPlaceMetadata)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CLMiLoPlaceMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();

  return (id)[v4 allocWithZone:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMiLoPlaceMetadata)initWithCoder:(id)a3
{
  return 0;
}

@end