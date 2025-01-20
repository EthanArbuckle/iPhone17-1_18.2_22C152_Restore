@interface LNDeferredLocalizedString
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDeferredLocalizedString)initWithCoder:(id)a3;
- (LNDeferredLocalizedString)initWithLocalizedKey:(id)a3 arguments:(id)a4;
- (NSArray)arguments;
- (NSString)localizedKey;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDeferredLocalizedString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_localizedKey, 0);
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (NSString)localizedKey
{
  return self->_localizedKey;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNDeferredLocalizedString *)self localizedKey];
  [v4 encodeObject:v5 forKey:@"localizedKey"];

  id v6 = [(LNDeferredLocalizedString *)self arguments];
  [v4 encodeObject:v6 forKey:@"arguments"];
}

- (LNDeferredLocalizedString)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedKey"];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"arguments"];

    if (v9)
    {
      self = [(LNDeferredLocalizedString *)self initWithLocalizedKey:v5 arguments:v9];
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(LNDeferredLocalizedString *)self localizedKey];
  uint64_t v7 = [(LNDeferredLocalizedString *)self arguments];
  v8 = [v3 stringWithFormat:@"<%@: %p, localizedKey: %@, arguments: %@>", v5, self, v6, v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(LNDeferredLocalizedString *)self localizedKey];
  uint64_t v4 = [v3 hash];
  v5 = [(LNDeferredLocalizedString *)self arguments];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNDeferredLocalizedString *)a3;
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
    uint64_t v7 = [(LNDeferredLocalizedString *)self localizedKey];
    v8 = [(LNDeferredLocalizedString *)v6 localizedKey];
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
    v15 = [(LNDeferredLocalizedString *)self arguments];
    v16 = [(LNDeferredLocalizedString *)v6 arguments];
    id v14 = v15;
    id v17 = v16;
    v13 = v17;
    if (v14 == v17)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v14 && v17) {
        LOBYTE(v12) = [v14 isEqualToArray:v17];
      }
    }

    goto LABEL_18;
  }
  LOBYTE(v12) = 1;
LABEL_21:

  return v12;
}

- (LNDeferredLocalizedString)initWithLocalizedKey:(id)a3 arguments:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNDeferredLocalizedString.m", 19, @"Invalid parameter not satisfying: %@", @"localizedKey" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNDeferredLocalizedString.m", 20, @"Invalid parameter not satisfying: %@", @"arguments" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNDeferredLocalizedString;
  id v10 = [(LNDeferredLocalizedString *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    localizedKey = v10->_localizedKey;
    v10->_localizedKey = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    arguments = v10->_arguments;
    v10->_arguments = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end