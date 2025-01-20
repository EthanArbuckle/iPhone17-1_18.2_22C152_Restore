@interface LNNLGRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNNLGRepresentation)initWithCoder:(id)a3;
- (LNNLGRepresentation)initWithType:(id)a3 title:(id)a4 value:(id)a5 format:(id)a6;
- (LNStaticDeferredLocalizedString)title;
- (NSData)securityScopeData;
- (NSString)format;
- (NSString)type;
- (NSString)value;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSecurityScopeData:(id)a3;
@end

@implementation LNNLGRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityScopeData, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

- (void)setSecurityScopeData:(id)a3
{
}

- (NSData)securityScopeData
{
  return self->_securityScopeData;
}

- (NSString)format
{
  return self->_format;
}

- (NSString)value
{
  return self->_value;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (NSString)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNNLGRepresentation *)self type];
  [v4 encodeObject:v5 forKey:@"type"];

  v6 = [(LNNLGRepresentation *)self title];
  [v4 encodeObject:v6 forKey:@"title"];

  v7 = [(LNNLGRepresentation *)self value];
  [v4 encodeObject:v7 forKey:@"value"];

  id v8 = [(LNNLGRepresentation *)self format];
  [v4 encodeObject:v8 forKey:@"format"];
}

- (LNNLGRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"format"];

  v9 = [(LNNLGRepresentation *)self initWithType:v5 title:v6 value:v7 format:v8];
  return v9;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNNLGRepresentation *)self type];
  v7 = [(LNNLGRepresentation *)self title];
  id v8 = [(LNNLGRepresentation *)self value];
  v9 = [(LNNLGRepresentation *)self format];
  v10 = [v3 stringWithFormat:@"<%@: %p, type: %@, title: %@, value: %@, format: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (unint64_t)hash
{
  v3 = [(LNNLGRepresentation *)self type];
  uint64_t v4 = [v3 hash];
  v5 = [(LNNLGRepresentation *)self title];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNNLGRepresentation *)self value];
  uint64_t v8 = [v7 hash];
  v9 = [(LNNLGRepresentation *)self format];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNNLGRepresentation *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(LNNLGRepresentation *)self type];
      uint64_t v8 = [(LNNLGRepresentation *)v6 type];
      if ([v7 isEqual:v8])
      {
        v9 = [(LNNLGRepresentation *)self title];
        unint64_t v10 = [(LNNLGRepresentation *)v6 title];
        if ([v9 isEqual:v10])
        {
          v11 = [(LNNLGRepresentation *)self value];
          v12 = [(LNNLGRepresentation *)v6 value];
          if ([v11 isEqual:v12])
          {
            v16 = [(LNNLGRepresentation *)self format];
            v13 = [(LNNLGRepresentation *)v6 format];
            char v14 = [v16 isEqual:v13];
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

- (LNNLGRepresentation)initWithType:(id)a3 title:(id)a4 value:(id)a5 format:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)LNNLGRepresentation;
  char v14 = [(LNNLGRepresentation *)&v25 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    type = v14->_type;
    v14->_type = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    title = v14->_title;
    v14->_title = (LNStaticDeferredLocalizedString *)v17;

    uint64_t v19 = [v12 copy];
    value = v14->_value;
    v14->_value = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    format = v14->_format;
    v14->_format = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end