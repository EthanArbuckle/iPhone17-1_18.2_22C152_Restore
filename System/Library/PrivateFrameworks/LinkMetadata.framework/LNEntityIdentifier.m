@interface LNEntityIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNEntityIdentifier)initWithCoder:(id)a3;
- (LNEntityIdentifier)initWithString:(id)a3;
- (LNEntityIdentifier)initWithTypeIdentifier:(id)a3 instanceIdentifier:(id)a4;
- (LNEntityIdentifier)initWithValue:(id)a3 scope:(int64_t)a4 typeName:(id)a5;
- (LNEntityIdentifier)initWithValue:(id)a3 typeName:(id)a4;
- (NSString)instanceIdentifier;
- (NSString)typeIdentifier;
- (id)description;
- (int64_t)scope;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEntityIdentifier

- (LNEntityIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"typeIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"instanceIdentifier"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = [(LNEntityIdentifier *)self initWithTypeIdentifier:v5 instanceIdentifier:v6];
    v8 = self;
  }

  return v8;
}

- (LNEntityIdentifier)initWithTypeIdentifier:(id)a3 instanceIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"LNEntityIdentifier.m", 24, @"Invalid parameter not satisfying: %@", @"typeIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"LNEntityIdentifier.m", 25, @"Invalid parameter not satisfying: %@", @"instanceIdentifier" object file lineNumber description];

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)LNEntityIdentifier;
  v10 = [(LNEntityIdentifier *)&v22 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    typeIdentifier = v10->_typeIdentifier;
    v10->_typeIdentifier = (NSString *)v11;

    unint64_t v13 = [v9 length];
    if (v13 <= LNEntityIdentifierMaximumValueLength)
    {
      uint64_t v17 = [v9 copy];
      instanceIdentifier = v10->_instanceIdentifier;
      v10->_instanceIdentifier = (NSString *)v17;
    }
    else
    {
      instanceIdentifier = os_log_create("com.apple.runtime-issues", "Link Runtime Issues");
      if (os_log_type_enabled(instanceIdentifier, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = LNEntityIdentifierMaximumValueLength;
        _os_log_fault_impl(&dword_19C9AD000, instanceIdentifier, OS_LOG_TYPE_FAULT, "Excessive identifier value length. Identifiers should be %ld characters or less, the supplied value was truncated.", buf, 0xCu);
      }
      uint64_t v15 = [v9 substringToIndex:LNEntityIdentifierMaximumValueLength];
      v16 = v10->_instanceIdentifier;
      v10->_instanceIdentifier = (NSString *)v15;
    }
    v18 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNEntityIdentifier *)self typeIdentifier];
  [v4 encodeObject:v5 forKey:@"typeIdentifier"];

  id v6 = [(LNEntityIdentifier *)self instanceIdentifier];
  [v4 encodeObject:v6 forKey:@"instanceIdentifier"];
}

- (NSString)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (NSString)typeIdentifier
{
  return self->_typeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceIdentifier, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNEntityIdentifier *)a3;
  v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v7 = [(LNEntityIdentifier *)self typeIdentifier];
    id v8 = [(LNEntityIdentifier *)v6 typeIdentifier];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      unint64_t v13 = v10;
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
    uint64_t v15 = [(LNEntityIdentifier *)self instanceIdentifier];
    v16 = [(LNEntityIdentifier *)v6 instanceIdentifier];
    id v14 = v15;
    id v17 = v16;
    unint64_t v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqualToString:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNEntityIdentifier *)self typeIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNEntityIdentifier *)self instanceIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(LNEntityIdentifier *)self typeIdentifier];
  v5 = [(LNEntityIdentifier *)self instanceIdentifier];
  unint64_t v6 = [v3 stringWithFormat:@"%@/%@", v4, v5];

  return v6;
}

- (LNEntityIdentifier)initWithString:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNEntityIdentifier.m", 50, @"Invalid parameter not satisfying: %@", @"identifierString" object file lineNumber description];
  }
  uint64_t v6 = [v5 rangeOfString:@"/"];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    uint64_t v11 = [v5 substringToIndex:v6];
    int v12 = [v11 componentsSeparatedByString:@"."];
    uint64_t v13 = [v12 lastObject];
    id v14 = (void *)v13;
    if (v13) {
      uint64_t v15 = (void *)v13;
    }
    else {
      uint64_t v15 = v11;
    }
    id v16 = v15;

    id v17 = [v5 substringFromIndex:v9 + v10];
    if ([v16 length] && objc_msgSend(v17, "length"))
    {
      self = [(LNEntityIdentifier *)self initWithTypeIdentifier:v16 instanceIdentifier:v17];
      id v8 = self;
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (LNEntityIdentifier)initWithValue:(id)a3 scope:(int64_t)a4 typeName:(id)a5
{
  return [(LNEntityIdentifier *)self initWithValue:a3 typeName:a5];
}

- (LNEntityIdentifier)initWithValue:(id)a3 typeName:(id)a4
{
  return [(LNEntityIdentifier *)self initWithTypeIdentifier:a4 instanceIdentifier:a3];
}

- (int64_t)scope
{
  return 0;
}

@end