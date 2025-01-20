@interface SKAttribute
+ (BOOL)supportsSecureCoding;
+ (SKAttribute)attributeWithName:(NSString *)name type:(SKAttributeType)type;
- (BOOL)isEqualToAttribute:(id)a3;
- (NSString)name;
- (SKAttribute)init;
- (SKAttribute)initWithCoder:(id)a3;
- (SKAttribute)initWithName:(NSString *)name type:(SKAttributeType)type;
- (SKAttributeType)type;
- (const)getNameString;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SKAttribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SKAttribute)init
{
  return [(SKAttribute *)self initWithName:&stru_26BEEFD10 type:0];
}

- (SKAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_type"];
  uint64_t v7 = [v6 integerValue];

  v8 = [(SKAttribute *)self initWithName:v5 type:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_name forKey:@"_name"];
  id v4 = [NSNumber numberWithInteger:self->_type];
  [v5 encodeObject:v4 forKey:@"_type"];
}

- (BOOL)isEqualToAttribute:(id)a3
{
  id v4 = (SKAttribute *)a3;
  id v5 = v4;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    name = self->_name;
    uint64_t v7 = [(SKAttribute *)v4 name];
    LOBYTE(name) = [(NSString *)name isEqualToString:v7];

    if (name)
    {
      int64_t type = self->_type;
      BOOL v9 = type == [(SKAttribute *)v5 type];
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

+ (SKAttribute)attributeWithName:(NSString *)name type:(SKAttributeType)type
{
  v6 = name;
  uint64_t v7 = (void *)[objc_alloc((Class)a1) initWithName:v6 type:type];

  return (SKAttribute *)v7;
}

- (SKAttribute)initWithName:(NSString *)name type:(SKAttributeType)type
{
  uint64_t v7 = name;
  v15.receiver = self;
  v15.super_class = (Class)SKAttribute;
  v8 = [(SKAttribute *)&v15 init];
  BOOL v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, name);
    id v10 = [NSString stringWithFormat:@"a_%@", v9->_name];
    std::string::basic_string[abi:ne180100]<0>(&v13, (char *)[v10 UTF8String]);
    p_nameString = (void **)&v9->_nameString;
    if (*((char *)&v9->_nameString.__r_.__value_.var0.__l + 23) < 0) {
      operator delete(*p_nameString);
    }
    *(_OWORD *)p_nameString = v13;
    *((void *)&v9->_nameString.__r_.__value_.var0.__l + 2) = v14;
    HIBYTE(v14) = 0;
    LOBYTE(v13) = 0;

    v9->_int64_t type = type;
    if ((unint64_t)(type - 5) < 4) {
      v9->_int64_t type = type - 4;
    }
  }

  return v9;
}

- (const)getNameString
{
  return &self->_nameString;
}

- (NSString)name
{
  return self->_name;
}

- (SKAttributeType)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_nameString.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_nameString.__r_.__value_.var0.__l.__data_);
  }

  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((void *)self + 5) = 0;
  return self;
}

@end