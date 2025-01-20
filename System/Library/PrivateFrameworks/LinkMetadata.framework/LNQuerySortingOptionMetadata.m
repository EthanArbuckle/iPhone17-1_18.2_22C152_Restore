@interface LNQuerySortingOptionMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNQuerySortingOptionMetadata)initWithCoder:(id)a3;
- (LNQuerySortingOptionMetadata)initWithPropertyIdentifier:(id)a3 entityType:(id)a4;
- (LNQuerySortingOptionMetadata)initWithTitle:(id)a3 propertyIdentifier:(id)a4 entityType:(id)a5;
- (LNStaticDeferredLocalizedString)title;
- (NSString)entityType;
- (NSString)propertyIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNQuerySortingOptionMetadata

- (LNQuerySortingOptionMetadata)initWithPropertyIdentifier:(id)a3 entityType:(id)a4
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
    [v17 handleFailureInMethod:a2, self, @"LNQuerySortingOptionMetadata.m", 19, @"Invalid parameter not satisfying: %@", @"propertyIdentifier" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNQuerySortingOptionMetadata.m", 20, @"Invalid parameter not satisfying: %@", @"entityType" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNQuerySortingOptionMetadata;
  v10 = [(LNQuerySortingOptionMetadata *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    propertyIdentifier = v10->_propertyIdentifier;
    v10->_propertyIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    entityType = v10->_entityType;
    v10->_entityType = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_propertyIdentifier, 0);
}

- (NSString)entityType
{
  return self->_entityType;
}

- (NSString)propertyIdentifier
{
  return self->_propertyIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNQuerySortingOptionMetadata *)a3;
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
    id v7 = [(LNQuerySortingOptionMetadata *)self propertyIdentifier];
    id v8 = [(LNQuerySortingOptionMetadata *)v6 propertyIdentifier];
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
    v15 = [(LNQuerySortingOptionMetadata *)self entityType];
    v16 = [(LNQuerySortingOptionMetadata *)v6 entityType];
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
  v3 = [(LNQuerySortingOptionMetadata *)self propertyIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNQuerySortingOptionMetadata *)self entityType];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNQuerySortingOptionMetadata *)self propertyIdentifier];
  id v7 = [(LNQuerySortingOptionMetadata *)self entityType];
  id v8 = [v3 stringWithFormat:@"<%@: %p, propertyIdentifier: %@, entityType: %@>", v5, self, v6, v7];

  return v8;
}

- (LNQuerySortingOptionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyIdentifier"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityType"];

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
    self = [(LNQuerySortingOptionMetadata *)self initWithPropertyIdentifier:v5 entityType:v6];
    id v8 = self;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNQuerySortingOptionMetadata *)self propertyIdentifier];
  [v4 encodeObject:v5 forKey:@"propertyIdentifier"];

  id v6 = [(LNQuerySortingOptionMetadata *)self entityType];
  [v4 encodeObject:v6 forKey:@"entityType"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNStaticDeferredLocalizedString)title
{
  v2 = [[LNStaticDeferredLocalizedString alloc] initWithKey:&stru_1EEDBEA90 table:&stru_1EEDBEA90 bundleURL:0];
  return v2;
}

- (LNQuerySortingOptionMetadata)initWithTitle:(id)a3 propertyIdentifier:(id)a4 entityType:(id)a5
{
  return [(LNQuerySortingOptionMetadata *)self initWithPropertyIdentifier:a4 entityType:a5];
}

@end