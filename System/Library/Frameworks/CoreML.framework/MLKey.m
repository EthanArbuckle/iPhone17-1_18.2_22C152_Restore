@interface MLKey
+ (BOOL)supportsSecureCoding;
- (BOOL)hasGlobalScope;
- (BOOL)hasSameNameAsKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MLKey)initWithCoder:(id)a3;
- (MLKey)initWithKeyName:(id)a3;
- (MLKey)initWithKeyName:(id)a3 scope:(id)a4;
- (NSString)name;
- (NSString)scope;
- (id)copyWithZone:(_NSZone *)a3;
- (id)deletingPrefixingScope:(id)a3;
- (id)description;
- (id)scopedTo:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)scope
{
  return self->_scope;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = [(MLKey *)self scope];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = NSString;
    v6 = [(MLKey *)self scope];
    v7 = [(MLKey *)self name];
    v8 = [v5 stringWithFormat:@"%@.%@", v6, v7];
  }
  else
  {
    v8 = [(MLKey *)self name];
  }

  return v8;
}

- (MLKey)initWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"MLKeyName"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"MLKeyScope"];

  v13 = [(MLKey *)self initWithKeyName:v8 scope:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MLKey *)self name];
  [v4 encodeObject:v5 forKey:@"MLKeyName"];

  id v6 = [(MLKey *)self scope];
  [v4 encodeObject:v6 forKey:@"MLKeyScope"];
}

- (BOOL)hasSameNameAsKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MLKey *)self name];
  id v6 = [v4 name];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (BOOL)hasGlobalScope
{
  v2 = [(MLKey *)self scope];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)deletingPrefixingScope:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"."] & 1) != 0 || (objc_msgSend(v4, "hasSuffix:", @"."))
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(MLKey *)self scope];
    uint64_t v7 = [(MLKey *)self scope];
    if (v7)
    {
      v8 = (void *)v7;
      v9 = [(MLKey *)self scope];
      int v10 = [v9 hasPrefix:v4];

      if (v10)
      {
        v11 = [(MLKey *)self scope];
        v12 = objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v4, "length"));

        if ([v12 hasPrefix:@"."])
        {
          uint64_t v13 = [v12 substringFromIndex:1];

          v12 = (void *)v13;
        }
        if ([v12 length])
        {
          id v6 = v12;
        }
        else
        {

          id v6 = 0;
        }
      }
    }
    v14 = [MLKey alloc];
    v15 = [(MLKey *)self name];
    id v5 = [(MLKey *)v14 initWithKeyName:v15 scope:v6];
  }

  return v5;
}

- (id)scopedTo:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"."] & 1) != 0 || (objc_msgSend(v4, "hasSuffix:", @"."))
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [(MLKey *)self scope];
    if ([v4 length])
    {
      uint64_t v7 = [(MLKey *)self scope];

      if (v7)
      {
        v8 = [(MLKey *)self scope];
        uint64_t v9 = [v8 stringByAppendingFormat:@".%@", v4];

        id v6 = v8;
      }
      else
      {
        uint64_t v9 = [v4 copy];
      }

      id v6 = (void *)v9;
    }
    int v10 = [MLKey alloc];
    v11 = [(MLKey *)self name];
    id v5 = [(MLKey *)v10 initWithKeyName:v11 scope:v6];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(MLKey *)self scope];

    if (v5)
    {
      id v6 = [(MLKey *)self scope];
      uint64_t v7 = [v4 scope];
      int v8 = [v6 isEqualToString:v7];
    }
    else
    {
      id v6 = [v4 scope];
      int v8 = v6 == 0;
    }

    int v10 = [(MLKey *)self name];
    v11 = [v4 name];
    int v9 = [v10 isEqual:v11] & v8;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  BOOL v3 = [(MLKey *)self name];
  uint64_t v4 = [v3 hash];
  id v5 = [(MLKey *)self scope];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  name = self->_name;
  scope = self->_scope;

  return (id)[v4 initWithKeyName:name scope:scope];
}

- (MLKey)initWithKeyName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLKey;
  id v5 = [(MLKey *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;
  }
  return v5;
}

- (MLKey)initWithKeyName:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLKey;
  int v8 = [(MLKey *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    scope = v8->_scope;
    v8->_scope = (NSString *)v11;
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end