@interface LNComparisonPropertyQuery
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNComparisonPropertyQuery)initWithCoder:(id)a3;
- (LNComparisonPropertyQuery)initWithPropertyIdentifier:(id)a3 value:(id)a4 type:(unint64_t)a5;
- (LNComparisonPropertyQuery)initWithPropertyIndex:(id)a3 value:(id)a4 type:(unint64_t)a5;
- (LNValue)value;
- (NSNumber)propertyIndex;
- (NSString)propertyIdentifier;
- (id)description;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNComparisonPropertyQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_propertyIndex, 0);
}

- (unint64_t)type
{
  return self->_type;
}

- (LNValue)value
{
  return self->_value;
}

- (NSNumber)propertyIndex
{
  return self->_propertyIndex;
}

- (void)encodeWithCoder:(id)a3
{
  propertyIndex = self->_propertyIndex;
  id v5 = a3;
  [v5 encodeObject:propertyIndex forKey:@"propertyIndex"];
  [v5 encodeInteger:self->_type forKey:@"type"];
  [v5 encodeObject:self->_value forKey:@"value"];
}

- (LNComparisonPropertyQuery)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyIndex"];
  int v6 = [v4 decodeIntForKey:@"type"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];

  if (v5) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = [(LNComparisonPropertyQuery *)self initWithPropertyIndex:v5 value:v7 type:v6];
    v9 = self;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(LNComparisonPropertyQuery *)self propertyIndex];
  uint64_t v4 = [v3 hash];
  id v5 = [(LNComparisonPropertyQuery *)self value];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(LNComparisonPropertyQuery *)self type];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNComparisonPropertyQuery *)a3;
  id v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_17:

      goto LABEL_18;
    }
    unint64_t v7 = [(LNComparisonPropertyQuery *)self propertyIndex];
    BOOL v8 = [(LNComparisonPropertyQuery *)v6 propertyIndex];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_15;
      }
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_16;
      }
    }
    v14 = [(LNComparisonPropertyQuery *)self value];
    v13 = [(LNComparisonPropertyQuery *)v6 value];
    if ([v14 isEqual:v13])
    {
      unint64_t v15 = [(LNComparisonPropertyQuery *)self type];
      LOBYTE(v12) = v15 == [(LNComparisonPropertyQuery *)v6 type];
    }
    else
    {
      LOBYTE(v12) = 0;
    }
LABEL_15:

LABEL_16:
    goto LABEL_17;
  }
  LOBYTE(v12) = 1;
LABEL_18:

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(LNComparisonPropertyQuery *)self propertyIndex];
  if (self)
  {
    unint64_t v5 = [(LNComparisonPropertyQuery *)self type];
    if (v5 - 1 > 8) {
      uint64_t v6 = @"==";
    }
    else {
      uint64_t v6 = off_1E590DAB8[v5 - 1];
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  unint64_t v7 = v6;
  BOOL v8 = [(LNComparisonPropertyQuery *)self value];
  id v9 = [v3 stringWithFormat:@"<%@ %@ %@>", v4, v7, v8];

  return v9;
}

- (LNComparisonPropertyQuery)initWithPropertyIndex:(id)a3 value:(id)a4 type:(unint64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  int v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNComparisonPropertyQuery.m", 19, @"Invalid parameter not satisfying: %@", @"propertyIndex" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, self, @"LNComparisonPropertyQuery.m", 20, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)LNComparisonPropertyQuery;
  v13 = [(LNPropertyQuery *)&v18 _init];
  v14 = (LNComparisonPropertyQuery *)v13;
  if (v13)
  {
    objc_storeStrong(v13 + 1, a3);
    v14->_type = a5;
    objc_storeStrong((id *)&v14->_value, a4);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNComparisonPropertyQuery)initWithPropertyIdentifier:(id)a3 value:(id)a4 type:(unint64_t)a5
{
  return [(LNComparisonPropertyQuery *)self initWithPropertyIndex:&unk_1EEDCE6B0 value:a4 type:a5];
}

- (NSString)propertyIdentifier
{
  return (NSString *)&stru_1EEDBEA90;
}

@end