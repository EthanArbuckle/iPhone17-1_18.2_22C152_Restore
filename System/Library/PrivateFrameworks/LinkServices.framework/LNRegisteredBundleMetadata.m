@interface LNRegisteredBundleMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNRegisteredBundleMetadata)initWithBundleIdentifier:(id)a3 installIdentifier:(id)a4;
- (LNRegisteredBundleMetadata)initWithCoder:(id)a3;
- (NSData)installIdentifier;
- (NSString)bundleIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNRegisteredBundleMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (NSData)installIdentifier
{
  return self->_installIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNRegisteredBundleMetadata *)a3;
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
    v7 = [(LNRegisteredBundleMetadata *)self bundleIdentifier];
    v8 = [(LNRegisteredBundleMetadata *)v6 bundleIdentifier];
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
    v15 = [(LNRegisteredBundleMetadata *)self installIdentifier];
    v16 = [(LNRegisteredBundleMetadata *)v6 installIdentifier];
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
        LOBYTE(v12) = [v14 isEqual:v17];
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
  v3 = [(LNRegisteredBundleMetadata *)self bundleIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNRegisteredBundleMetadata *)self installIdentifier];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNRegisteredBundleMetadata *)self bundleIdentifier];
  v7 = [(LNRegisteredBundleMetadata *)self installIdentifier];
  v8 = [v3 stringWithFormat:@"<%@: %p, bundleIdentifier: %@, installIdentifier: %@>", v5, self, v6, v7];

  return v8;
}

- (LNRegisteredBundleMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"installIdentifier"];

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
    self = [(LNRegisteredBundleMetadata *)self initWithBundleIdentifier:v5 installIdentifier:v6];
    v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNRegisteredBundleMetadata *)self bundleIdentifier];
  [v4 encodeObject:v5 forKey:@"bundleIdentifier"];

  id v6 = [(LNRegisteredBundleMetadata *)self installIdentifier];
  [v4 encodeObject:v6 forKey:@"installIdentifier"];
}

- (LNRegisteredBundleMetadata)initWithBundleIdentifier:(id)a3 installIdentifier:(id)a4
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
    [v17 handleFailureInMethod:a2, self, @"LNRegisteredBundleMetadata.m", 20, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNRegisteredBundleMetadata.m", 21, @"Invalid parameter not satisfying: %@", @"installIdentifier" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNRegisteredBundleMetadata;
  id v10 = [(LNRegisteredBundleMetadata *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    installIdentifier = v10->_installIdentifier;
    v10->_installIdentifier = (NSData *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end