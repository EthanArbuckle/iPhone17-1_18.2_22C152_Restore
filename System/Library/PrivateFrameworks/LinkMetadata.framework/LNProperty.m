@interface LNProperty
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNProperty)initWithCoder:(id)a3;
- (LNProperty)initWithIdentifier:(id)a3 value:(id)a4;
- (LNValue)value;
- (NSString)identifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNProperty

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNProperty *)self identifier];
  v7 = [(LNProperty *)self value];
  v8 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, value: %@>", v5, self, v6, v7];

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (LNValue)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (LNProperty)initWithIdentifier:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNProperty;
  v8 = [(LNProperty *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_storeStrong((id *)&v8->_value, a4);
    v11 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNProperty *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  id v6 = [(LNProperty *)self value];
  [v4 encodeObject:v6 forKey:@"value"];
}

- (LNProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  id v7 = [(LNProperty *)self initWithIdentifier:v5 value:v6];
  return v7;
}

- (unint64_t)hash
{
  v3 = [(LNProperty *)self identifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNProperty *)self value];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNProperty *)a3;
  v5 = v4;
  if (self != v4)
  {
    unint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v7 = [(LNProperty *)self identifier];
    v8 = [(LNProperty *)v6 identifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      objc_super v13 = v10;
      id v14 = v9;
      if (!v9 || !v10)
      {
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      int v12 = [v9 isEqualToString:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNProperty *)self value];
    v16 = [(LNProperty *)v6 value];
    id v14 = v15;
    id v17 = v16;
    objc_super v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqual:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end