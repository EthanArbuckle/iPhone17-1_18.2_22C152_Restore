@interface CTPlan
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTPlan)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CTPlan

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

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlan)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CTPlan;
  return [(CTPlan *)&v4 init];
}

@end