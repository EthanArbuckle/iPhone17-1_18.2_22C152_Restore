@interface CTRoadsideProviders
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProviders:(id)a3;
- (CTRoadsideProviders)initWithCoder:(id)a3;
- (NSDictionary)providers;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProviders:(id)a3;
@end

@implementation CTRoadsideProviders

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(CTRoadsideProviders *)self providers];
  [v3 appendFormat:@", providers=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToProviders:(id)a3
{
  id v4 = a3;
  v5 = [(CTRoadsideProviders *)self providers];
  v6 = [v4 providers];
  char v7 = [v5 isEqual:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTRoadsideProviders *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(CTRoadsideProviders *)self isEqualToProviders:v4];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = [(CTRoadsideProviders *)self providers];
  char v7 = (void *)[v6 copyWithZone:a3];
  [v5 setProviders:v7];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(CTRoadsideProviders *)self providers];
  [v5 encodeObject:v4 forKey:@"providers"];
}

- (CTRoadsideProviders)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTRoadsideProviders;
  id v5 = [(CTRoadsideProviders *)&v13 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"providers"];
    providers = v5->_providers;
    v5->_providers = (NSDictionary *)v10;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
}

- (void).cxx_destruct
{
}

@end