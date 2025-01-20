@interface IRServiceParameters
+ (BOOL)isServicePackageSupported:(int64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (IRServiceParameters)init;
- (IRServiceParameters)initWithCoder:(id)a3;
- (IRServiceParameters)initWithServicePackage:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)servicePackage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IRServiceParameters

- (IRServiceParameters)initWithServicePackage:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IRServiceParameters;
  result = [(IRServiceParameters *)&v5 init];
  if (result) {
    result->_servicePackage = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t servicePackage = self->_servicePackage;
  return (id)[v4 initWithServicePackage:servicePackage];
}

- (void)encodeWithCoder:(id)a3
{
  v3 = NSNumber;
  int64_t servicePackage = self->_servicePackage;
  id v5 = a3;
  id v6 = [v3 numberWithInteger:servicePackage];
  [v5 encodeObject:v6 forKey:@"servicePackage"];
}

- (IRServiceParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IRServiceParameters;
  id v5 = [(IRServiceParameters *)&v10 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"servicePackage"];
    v7 = v6;
    if (v6)
    {
      int64_t v8 = (int)[(IRServiceParameters *)v6 intValue];

      v5->_int64_t servicePackage = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", servicePackage: %ld", self->_servicePackage];
  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t v6 = [(IRServiceParameters *)self servicePackage];
    uint64_t v7 = [v5 servicePackage];

    BOOL v8 = v6 == v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_servicePackage;
}

- (IRServiceParameters)init
{
}

+ (id)new
{
}

+ (BOOL)isServicePackageSupported:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

- (int64_t)servicePackage
{
  return self->_servicePackage;
}

@end