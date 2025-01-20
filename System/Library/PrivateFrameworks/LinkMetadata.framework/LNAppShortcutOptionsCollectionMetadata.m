@interface LNAppShortcutOptionsCollectionMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAppShortcutOptionsCollectionMetadata)initWithCoder:(id)a3;
- (LNAppShortcutOptionsCollectionMetadata)initWithTitle:(id)a3 systemImageName:(id)a4;
- (LNStaticDeferredLocalizedString)title;
- (NSString)systemImageName;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppShortcutOptionsCollectionMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAppShortcutOptionsCollectionMetadata *)a3;
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
    v7 = [(LNAppShortcutOptionsCollectionMetadata *)self title];
    v8 = [(LNAppShortcutOptionsCollectionMetadata *)v6 title];
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
      int v12 = [v9 isEqual:v10];

      if (!v12) {
        goto LABEL_19;
      }
    }
    v15 = [(LNAppShortcutOptionsCollectionMetadata *)self systemImageName];
    v16 = [(LNAppShortcutOptionsCollectionMetadata *)v6 systemImageName];
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
  v3 = [(LNAppShortcutOptionsCollectionMetadata *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAppShortcutOptionsCollectionMetadata *)self systemImageName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNAppShortcutOptionsCollectionMetadata *)self title];
  v7 = [(LNAppShortcutOptionsCollectionMetadata *)self systemImageName];
  v8 = [v3 stringWithFormat:@"<%@: %p, title: %@, systemImageName: %@>", v5, self, v6, v7];

  return v8;
}

- (LNAppShortcutOptionsCollectionMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemImageName"];

  if (v5)
  {
    self = [(LNAppShortcutOptionsCollectionMetadata *)self initWithTitle:v5 systemImageName:v6];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAppShortcutOptionsCollectionMetadata *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  id v6 = [(LNAppShortcutOptionsCollectionMetadata *)self systemImageName];
  [v4 encodeObject:v6 forKey:@"systemImageName"];
}

- (LNAppShortcutOptionsCollectionMetadata)initWithTitle:(id)a3 systemImageName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"LNAppShortcutOptionsCollectionMetadata.m", 20, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)LNAppShortcutOptionsCollectionMetadata;
  id v9 = [(LNAppShortcutOptionsCollectionMetadata *)&v17 init];
  if (v9)
  {
    uint64_t v10 = [v7 copy];
    title = v9->_title;
    v9->_title = (LNStaticDeferredLocalizedString *)v10;

    uint64_t v12 = [v8 copy];
    systemImageName = v9->_systemImageName;
    v9->_systemImageName = (NSString *)v12;

    id v14 = v9;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end