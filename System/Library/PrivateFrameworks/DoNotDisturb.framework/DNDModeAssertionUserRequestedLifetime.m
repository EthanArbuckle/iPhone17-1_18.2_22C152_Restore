@interface DNDModeAssertionUserRequestedLifetime
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (unint64_t)lifetimeType;
@end

@implementation DNDModeAssertionUserRequestedLifetime

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

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (unint64_t)lifetimeType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end