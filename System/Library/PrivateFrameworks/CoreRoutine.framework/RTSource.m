@interface RTSource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RTSource)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation RTSource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSource)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RTSource;
  return [(RTSource *)&v4 init];
}

- (id)description
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (RTSource *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4)
  {
    char v6 = [(RTSource *)v4 isMemberOfClass:objc_opt_class()];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();
  return [v2 hash];
}

@end