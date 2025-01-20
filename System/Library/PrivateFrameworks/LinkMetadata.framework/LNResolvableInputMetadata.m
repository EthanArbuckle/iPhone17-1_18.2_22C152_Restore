@interface LNResolvableInputMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNResolvableInputMetadata)initWithCoder:(id)a3;
- (LNResolvableInputMetadata)initWithQueryType:(id)a3;
- (LNResolvableInputMetadata)initWithValueType:(id)a3;
- (LNValueType)valueType;
- (NSString)queryType;
- (id)description;
- (int64_t)kind;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNResolvableInputMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_queryType, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNResolvableInputMetadata kind](self, "kind"), @"kind");
  v5 = [(LNResolvableInputMetadata *)self queryType];
  [v4 encodeObject:v5 forKey:@"queryType"];

  id v6 = [(LNResolvableInputMetadata *)self valueType];
  [v4 encodeObject:v6 forKey:@"valueType"];
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (NSString)queryType
{
  return self->_queryType;
}

- (int64_t)kind
{
  return self->_kind;
}

- (LNResolvableInputMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"kind"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueType"];

  if (v5 != 1)
  {
    if (v7)
    {
      v8 = [(LNResolvableInputMetadata *)self initWithValueType:v7];
      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!v6) {
    goto LABEL_7;
  }
  v8 = [(LNResolvableInputMetadata *)self initWithQueryType:v6];
LABEL_6:
  self = v8;
  v9 = self;
LABEL_8:

  return v9;
}

- (LNResolvableInputMetadata)initWithValueType:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LNResolvableInputMetadata.m", 35, @"Invalid parameter not satisfying: %@", @"valueType" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)LNResolvableInputMetadata;
  id v6 = [(LNResolvableInputMetadata *)&v13 init];
  v7 = v6;
  if (v6)
  {
    v6->_kind = 0;
    uint64_t v8 = [v5 copy];
    valueType = v7->_valueType;
    v7->_valueType = (LNValueType *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)description
{
  int64_t v4 = [(LNResolvableInputMetadata *)self kind];
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_6;
    }
    id v5 = NSString;
    id v6 = [(LNResolvableInputMetadata *)self queryType];
    uint64_t v7 = [v5 stringWithFormat:@"Query:%@", v6];
  }
  else
  {
    id v6 = [(LNResolvableInputMetadata *)self valueType];
    uint64_t v7 = [v6 description];
  }
  v2 = (void *)v7;

LABEL_6:
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = (LNResolvableInputMetadata *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int64_t v7 = [(LNResolvableInputMetadata *)self kind];
        if (v7 != [(LNResolvableInputMetadata *)v6 kind])
        {
          LOBYTE(v13) = 0;
LABEL_24:

          goto LABEL_25;
        }
        uint64_t v8 = [(LNResolvableInputMetadata *)self queryType];
        v9 = [(LNResolvableInputMetadata *)v6 queryType];
        v10 = v8;
        v11 = v9;
        v12 = v11;
        if (v10 == v11)
        {
        }
        else
        {
          LOBYTE(v13) = 0;
          v14 = v11;
          v15 = v10;
          if (!v10 || !v11)
          {
LABEL_21:

LABEL_22:
            goto LABEL_23;
          }
          int v13 = [(LNResolvableInputMetadata *)v10 isEqualToString:v11];

          if (!v13) {
            goto LABEL_22;
          }
        }
        v16 = [(LNResolvableInputMetadata *)self valueType];
        v17 = [(LNResolvableInputMetadata *)v6 valueType];
        v15 = v16;
        v18 = v17;
        v14 = v18;
        if (v15 == v18)
        {
          LOBYTE(v13) = 1;
        }
        else
        {
          LOBYTE(v13) = 0;
          if (v15 && v18) {
            LOBYTE(v13) = [(LNResolvableInputMetadata *)v15 isEqual:v18];
          }
        }

        goto LABEL_21;
      }
      LOBYTE(v13) = 0;
      v10 = v6;
      id v6 = 0;
    }
    else
    {
      v10 = 0;
      LOBYTE(v13) = 0;
    }
LABEL_23:

    goto LABEL_24;
  }
  LOBYTE(v13) = 1;
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3 = [(LNResolvableInputMetadata *)self kind];
  int64_t v4 = [(LNResolvableInputMetadata *)self queryType];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [(LNResolvableInputMetadata *)self valueType];
  unint64_t v7 = v5 ^ [v6 hash];

  return v7;
}

- (LNResolvableInputMetadata)initWithQueryType:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LNResolvableInputMetadata.m", 21, @"Invalid parameter not satisfying: %@", @"queryType" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)LNResolvableInputMetadata;
  id v6 = [(LNResolvableInputMetadata *)&v13 init];
  unint64_t v7 = v6;
  if (v6)
  {
    v6->_kind = 1;
    uint64_t v8 = [v5 copy];
    queryType = v7->_queryType;
    v7->_queryType = (NSString *)v8;

    v10 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end