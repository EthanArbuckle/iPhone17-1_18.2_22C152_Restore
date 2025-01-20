@interface SGIPPerson
+ (BOOL)supportsSecureCoding;
+ (id)personWithIPPerson:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPerson:(id)a3;
- (NSString)handle;
- (NSString)handleType;
- (NSString)name;
- (SGIPPerson)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHandle:(id)a3;
- (void)setHandleType:(id)a3;
- (void)setName:(id)a3;
@end

@implementation SGIPPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleType, 0);
  objc_storeStrong((id *)&self->_handle, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setHandleType:(id)a3
{
}

- (NSString)handleType
{
  return self->_handleType;
}

- (void)setHandle:(id)a3
{
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SGIPPerson *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGIPPerson *)self isEqualToPerson:v5];

  return v6;
}

- (BOOL)isEqualToPerson:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  name = self->_name;
  v7 = (NSString *)v4[1];
  if (name == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = name;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_8;
    }
  }
  handle = self->_handle;
  v12 = (NSString *)v5[2];
  if (handle == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = handle;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
LABEL_8:
      char v16 = 0;
      goto LABEL_14;
    }
  }
  v17 = self->_handleType;
  v18 = v17;
  if (v17 == v5[3]) {
    char v16 = 1;
  }
  else {
    char v16 = -[NSString isEqual:](v17, "isEqual:");
  }

LABEL_14:
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
    v7 = (void *)v5[1];
    v5[1] = v6;

    uint64_t v8 = [(NSString *)self->_handle copyWithZone:a3];
    v9 = (void *)v5[2];
    v5[2] = v8;

    uint64_t v10 = [(NSString *)self->_handleType copyWithZone:a3];
    v11 = (void *)v5[3];
    v5[3] = v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  name = self->_name;
  id v5 = a3;
  [v5 encodeObject:name forKey:@"nam"];
  [v5 encodeObject:self->_handle forKey:@"han"];
  [v5 encodeObject:self->_handleType forKey:@"hty"];
}

- (SGIPPerson)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = (SGIPPerson *)objc_opt_new();
  v7 = [v4 decodeObjectOfClass:v5 forKey:@"nam"];
  [(SGIPPerson *)v6 setName:v7];

  uint64_t v8 = [v4 decodeObjectOfClass:v5 forKey:@"han"];
  [(SGIPPerson *)v6 setHandle:v8];

  v9 = [v4 decodeObjectOfClass:v5 forKey:@"hty"];

  [(SGIPPerson *)v6 setHandleType:v9];
  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_handleType hash] - v3 + 32 * v3;
  return [(NSString *)self->_handle hash] - v4 + 32 * v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<SGIPPerson '%@' ht:%@ h:%@>", self->_name, self->_handleType, self->_handle];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)personWithIPPerson:(id)a3
{
  id v3 = a3;
  NSUInteger v4 = objc_opt_new();
  uint64_t v5 = [v3 fullName];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setName:v6];

  v7 = [v3 handle];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setHandle:v8];

  v9 = [v3 handleType];

  uint64_t v10 = (void *)[v9 copy];
  [v4 setHandleType:v10];

  return v4;
}

@end