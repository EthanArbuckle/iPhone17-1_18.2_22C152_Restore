@interface LNEntityQueryRequestType
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNEntityQueryRequestType)initWithCoder:(id)a3;
- (LNEntityQueryRequestType)initWithEntityIdentifiers:(id)a3;
- (NSArray)identifiers;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEntityQueryRequestType

- (void).cxx_destruct
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNEntityQueryRequestType *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNEntityQueryRequestType *)self identifiers];
      v8 = [(LNEntityQueryRequestType *)v6 identifiers];
      id v9 = v7;
      id v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        char v12 = 1;
      }
      else
      {
        char v12 = 0;
        if (v9 && v10)
        {
          v13 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
          v14 = [MEMORY[0x1E4F1CAD0] setWithArray:v11];
          char v12 = [v13 isEqualToSet:v14];
        }
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_identifiers hash];
}

- (LNEntityQueryRequestType)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"identifiers"];

  id v9 = [(LNEntityQueryRequestType *)self initWithEntityIdentifiers:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNEntityQueryRequestType *)self identifiers];
  [v4 encodeObject:v5 forKey:@"identifiers"];
}

- (id)description
{
  return @"IdentifierQuery";
}

- (LNEntityQueryRequestType)initWithEntityIdentifiers:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LNEntityQueryRequestType;
  uint64_t v6 = [(LNQueryRequestTypeBase *)&v10 _init];
  v7 = (LNEntityQueryRequestType *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end