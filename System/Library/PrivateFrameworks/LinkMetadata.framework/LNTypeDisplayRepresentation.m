@interface LNTypeDisplayRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNStaticDeferredLocalizedString)name;
- (LNStaticDeferredLocalizedString)numericFormat;
- (LNTypeDisplayRepresentation)initWithCoder:(id)a3;
- (LNTypeDisplayRepresentation)initWithName:(id)a3 numericFormat:(id)a4;
- (LNTypeDisplayRepresentation)initWithName:(id)a3 numericFormat:(id)a4 synonyms:(id)a5;
- (NSArray)synonyms;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNTypeDisplayRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_numericFormat, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (LNTypeDisplayRepresentation)initWithName:(id)a3 numericFormat:(id)a4 synonyms:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNTypeDisplayRepresentation.m", 26, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)LNTypeDisplayRepresentation;
  v12 = [(LNTypeDisplayRepresentation *)&v22 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    name = v12->_name;
    v12->_name = (LNStaticDeferredLocalizedString *)v13;

    uint64_t v15 = [v10 copy];
    numericFormat = v12->_numericFormat;
    v12->_numericFormat = (LNStaticDeferredLocalizedString *)v15;

    uint64_t v17 = [v11 copy];
    synonyms = v12->_synonyms;
    v12->_synonyms = (NSArray *)v17;

    v19 = v12;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNTypeDisplayRepresentation *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(LNTypeDisplayRepresentation *)self numericFormat];
  [v4 encodeObject:v6 forKey:@"numericFormat"];

  id v7 = [(LNTypeDisplayRepresentation *)self synonyms];
  [v4 encodeObject:v7 forKey:@"synonyms"];
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (LNStaticDeferredLocalizedString)numericFormat
{
  return self->_numericFormat;
}

- (LNStaticDeferredLocalizedString)name
{
  return self->_name;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNTypeDisplayRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numericFormat"];
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"synonyms"];

  if (v5)
  {
    self = [(LNTypeDisplayRepresentation *)self initWithName:v5 numericFormat:v6 synonyms:v10];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(LNTypeDisplayRepresentation *)self name];
  id v7 = [(LNTypeDisplayRepresentation *)self numericFormat];
  uint64_t v8 = [(LNTypeDisplayRepresentation *)self synonyms];
  id v9 = [v3 stringWithFormat:@"<%@: %p, name: %@, numericFormat: %@>, synonyms: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNTypeDisplayRepresentation *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    id v7 = [(LNTypeDisplayRepresentation *)self name];
    uint64_t v8 = [(LNTypeDisplayRepresentation *)v6 name];
    id v9 = v7;
    id v10 = v8;
    id v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_25;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v16 = [(LNTypeDisplayRepresentation *)self numericFormat];
    uint64_t v17 = [(LNTypeDisplayRepresentation *)v6 numericFormat];
    id v14 = v16;
    id v18 = v17;
    uint64_t v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(LNTypeDisplayRepresentation *)self synonyms];
    objc_super v22 = [(LNTypeDisplayRepresentation *)v6 synonyms];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqual:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNTypeDisplayRepresentation *)self name];
  uint64_t v4 = [v3 hash];
  v5 = [(LNTypeDisplayRepresentation *)self numericFormat];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(LNTypeDisplayRepresentation *)self synonyms];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (LNTypeDisplayRepresentation)initWithName:(id)a3 numericFormat:(id)a4
{
  return [(LNTypeDisplayRepresentation *)self initWithName:a3 numericFormat:a4 synonyms:0];
}

@end