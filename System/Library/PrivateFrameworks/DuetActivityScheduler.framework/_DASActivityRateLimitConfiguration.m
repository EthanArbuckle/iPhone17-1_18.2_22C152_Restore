@interface _DASActivityRateLimitConfiguration
+ (BOOL)supportsSecureCoding;
+ (id)rateLimitConfigurationWithName:(id)a3 andLimits:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)rateLimits;
- (NSString)name;
- (_DASActivityRateLimitConfiguration)initWithCoder:(id)a3;
- (_DASActivityRateLimitConfiguration)initWithName:(id)a3 andLimits:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setRateLimits:(id)a3;
@end

@implementation _DASActivityRateLimitConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimits, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)rateLimitConfigurationWithName:(id)a3 andLimits:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithName:v6 andLimits:v5];

  return v7;
}

- (_DASActivityRateLimitConfiguration)initWithName:(id)a3 andLimits:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DASActivityRateLimitConfiguration;
  v9 = [(_DASActivityRateLimitConfiguration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_rateLimits, a4);
  }

  return v10;
}

- (NSArray)rateLimits
{
  return self->_rateLimits;
}

- (NSString)name
{
  return self->_name;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<Configuration '%@': %@>", self->_name, self->_rateLimits];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_DASActivityRateLimitConfiguration *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      name = self->_name;
      id v7 = [(_DASActivityRateLimitConfiguration *)v5 name];
      if ([(NSString *)name isEqualToString:v7])
      {
        rateLimits = self->_rateLimits;
        v9 = [(_DASActivityRateLimitConfiguration *)v5 rateLimits];
        char v10 = [(NSArray *)rateLimits isEqualToArray:v9];
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(_DASActivityRateLimitConfiguration *)self name];
  id v6 = [(_DASActivityRateLimitConfiguration *)self rateLimits];
  id v7 = (void *)[v4 initWithName:v5 andLimits:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"name"];
  [v5 encodeObject:self->_rateLimits forKey:@"rateLimits"];
}

- (_DASActivityRateLimitConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DASActivityRateLimitConfiguration;
  id v5 = [(_DASActivityRateLimitConfiguration *)&v14 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"rateLimits"];
    v11 = (void *)v10;
    objc_super v12 = 0;
    if (v6 && v10)
    {
      objc_storeStrong((id *)&v5->_name, v6);
      objc_storeStrong((id *)&v5->_rateLimits, v11);
      objc_super v12 = v5;
    }
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

- (void)setName:(id)a3
{
}

- (void)setRateLimits:(id)a3
{
}

@end