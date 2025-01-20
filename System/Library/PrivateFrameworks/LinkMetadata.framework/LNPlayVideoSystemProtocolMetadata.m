@interface LNPlayVideoSystemProtocolMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNPlayVideoSystemProtocolMetadata)initWithCoder:(id)a3;
- (LNPlayVideoSystemProtocolMetadata)initWithSupportedCategories:(id)a3;
- (NSArray)supportedCategories;
- (NSString)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNPlayVideoSystemProtocolMetadata

- (void).cxx_destruct
{
}

- (NSArray)supportedCategories
{
  return self->_supportedCategories;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNPlayVideoSystemProtocolMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNPlayVideoSystemProtocolMetadata *)self supportedCategories];
      v8 = [(LNPlayVideoSystemProtocolMetadata *)v6 supportedCategories];
      char v9 = [v7 isEqualToArray:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (unint64_t)hash
{
  v2 = [(LNPlayVideoSystemProtocolMetadata *)self supportedCategories];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNPlayVideoSystemProtocolMetadata *)self supportedCategories];
  v7 = [v3 stringWithFormat:@"<%@: %p, supportedCategories: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (LNPlayVideoSystemProtocolMetadata)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"supportedCategories"];

  char v9 = [(LNPlayVideoSystemProtocolMetadata *)self initWithSupportedCategories:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNPlayVideoSystemProtocolMetadata *)self supportedCategories];
  [v4 encodeObject:v5 forKey:@"supportedCategories"];
}

- (LNPlayVideoSystemProtocolMetadata)initWithSupportedCategories:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNPlayVideoSystemProtocolMetadata;
  uint64_t v6 = [(LNPlayVideoSystemProtocolMetadata *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_supportedCategories, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end