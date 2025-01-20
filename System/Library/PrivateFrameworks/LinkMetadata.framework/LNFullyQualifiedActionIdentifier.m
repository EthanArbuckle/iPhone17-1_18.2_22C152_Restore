@interface LNFullyQualifiedActionIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNFullyQualifiedActionIdentifier)initWithActionIdentifier:(id)a3 bundleIdentifier:(id)a4;
- (LNFullyQualifiedActionIdentifier)initWithCoder:(id)a3;
- (NSString)actionIdentifier;
- (NSString)bundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNFullyQualifiedActionIdentifier

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (LNFullyQualifiedActionIdentifier)initWithActionIdentifier:(id)a3 bundleIdentifier:(id)a4
{
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
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNFullyQualifiedActionIdentifier.m", 20, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNFullyQualifiedActionIdentifier.m", 21, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNFullyQualifiedActionIdentifier;
  v10 = [(LNFullyQualifiedActionIdentifier *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    actionIdentifier = v10->_actionIdentifier;
    v10->_actionIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(LNFullyQualifiedActionIdentifier *)self actionIdentifier];
  v6 = [(LNFullyQualifiedActionIdentifier *)self bundleIdentifier];
  id v7 = (void *)[v4 initWithActionIdentifier:v5 bundleIdentifier:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNFullyQualifiedActionIdentifier *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_20:

      goto LABEL_21;
    }
    id v7 = [(LNFullyQualifiedActionIdentifier *)self actionIdentifier];
    id v8 = [(LNFullyQualifiedActionIdentifier *)v6 actionIdentifier];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
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
    v15 = [(LNFullyQualifiedActionIdentifier *)self bundleIdentifier];
    v16 = [(LNFullyQualifiedActionIdentifier *)v6 bundleIdentifier];
    id v14 = v15;
    id v17 = v16;
    uint64_t v13 = v17;
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
  v3 = [(LNFullyQualifiedActionIdentifier *)self actionIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNFullyQualifiedActionIdentifier *)self bundleIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNFullyQualifiedActionIdentifier *)self bundleIdentifier];
  id v7 = [(LNFullyQualifiedActionIdentifier *)self actionIdentifier];
  id v8 = [v3 stringWithFormat:@"<%@: %p, bundleIdentifier: %@, actionIdentifier: %@>", v5, self, v6, v7];

  return v8;
}

- (LNFullyQualifiedActionIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    self = [(LNFullyQualifiedActionIdentifier *)self initWithActionIdentifier:v5 bundleIdentifier:v6];
    id v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNFullyQualifiedActionIdentifier *)self actionIdentifier];
  [v4 encodeObject:v5 forKey:@"actionIdentifier"];

  id v6 = [(LNFullyQualifiedActionIdentifier *)self bundleIdentifier];
  [v4 encodeObject:v6 forKey:@"bundleIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end