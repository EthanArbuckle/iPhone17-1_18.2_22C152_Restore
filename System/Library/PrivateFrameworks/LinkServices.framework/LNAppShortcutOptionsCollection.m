@interface LNAppShortcutOptionsCollection
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAppShortcutDynamicOptionsProviderReference)optionsProviderReference;
- (LNAppShortcutOptionsCollection)initWithCoder:(id)a3;
- (LNAppShortcutOptionsCollection)initWithLocalizedTitle:(id)a3 systemImageName:(id)a4 optionsProviderReference:(id)a5;
- (NSString)localizedTitle;
- (NSString)systemImageName;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppShortcutOptionsCollection

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsProviderReference, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (LNAppShortcutOptionsCollection)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedTitle"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"systemImageName"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"optionsProviderReference"];

  if (v5)
  {
    self = [(LNAppShortcutOptionsCollection *)self initWithLocalizedTitle:v5 systemImageName:v6 optionsProviderReference:v7];
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (LNAppShortcutOptionsCollection)initWithLocalizedTitle:(id)a3 systemImageName:(id)a4 optionsProviderReference:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"LNAppShortcutOptionsCollection.m", 19, @"Invalid parameter not satisfying: %@", @"localizedTitle" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)LNAppShortcutOptionsCollection;
  v12 = [(LNAppShortcutOptionsCollection *)&v20 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    localizedTitle = v12->_localizedTitle;
    v12->_localizedTitle = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    systemImageName = v12->_systemImageName;
    v12->_systemImageName = (NSString *)v15;

    objc_storeStrong((id *)&v12->_optionsProviderReference, a5);
    v17 = v12;
  }

  return v12;
}

- (LNAppShortcutDynamicOptionsProviderReference)optionsProviderReference
{
  return self->_optionsProviderReference;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAppShortcutOptionsCollection *)self localizedTitle];
  [v4 encodeObject:v5 forKey:@"localizedTitle"];

  v6 = [(LNAppShortcutOptionsCollection *)self systemImageName];
  [v4 encodeObject:v6 forKey:@"systemImageName"];

  id v7 = [(LNAppShortcutOptionsCollection *)self optionsProviderReference];
  [v4 encodeObject:v7 forKey:@"optionsProviderReference"];
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)LNAppShortcutOptionsCollection;
  unint64_t v3 = [(LNAppShortcutOptionsCollection *)&v11 hash];
  id v4 = [(LNAppShortcutOptionsCollection *)self localizedTitle];
  uint64_t v5 = [v4 hash];
  v6 = [(LNAppShortcutOptionsCollection *)self systemImageName];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(LNAppShortcutOptionsCollection *)self optionsProviderReference];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNAppShortcutOptionsCollection *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNAppShortcutOptionsCollection;
    if ([(LNAppShortcutOptionsCollection *)&v24 isEqual:v4])
    {
      uint64_t v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      v6 = [(LNAppShortcutOptionsCollection *)self localizedTitle];
      uint64_t v7 = [(LNAppShortcutOptionsCollection *)v5 localizedTitle];
      id v8 = v6;
      id v9 = v7;
      id v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v12 = v9;
        id v13 = v8;
        if (!v8 || !v9) {
          goto LABEL_27;
        }
        int v14 = [v8 isEqualToString:v9];

        if (!v14)
        {
          LOBYTE(v11) = 0;
LABEL_28:

          goto LABEL_29;
        }
      }
      uint64_t v15 = [(LNAppShortcutOptionsCollection *)self systemImageName];
      v16 = [(LNAppShortcutOptionsCollection *)v5 systemImageName];
      id v13 = v15;
      id v17 = v16;
      v12 = v17;
      if (v13 == v17)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        v18 = v17;
        id v19 = v13;
        if (!v13 || !v17)
        {
LABEL_26:

LABEL_27:
          goto LABEL_28;
        }
        int v11 = [v13 isEqualToString:v17];

        if (!v11) {
          goto LABEL_27;
        }
      }
      objc_super v20 = [(LNAppShortcutOptionsCollection *)self optionsProviderReference];
      v21 = [(LNAppShortcutOptionsCollection *)v5 optionsProviderReference];
      id v19 = v20;
      id v22 = v21;
      v18 = v22;
      if (v19 == v22)
      {
        LOBYTE(v11) = 1;
      }
      else
      {
        LOBYTE(v11) = 0;
        if (v19 && v22) {
          LOBYTE(v11) = [v19 isEqual:v22];
        }
      }

      goto LABEL_26;
    }
    LOBYTE(v11) = 0;
  }
LABEL_30:

  return v11;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [(LNAppShortcutOptionsCollection *)self localizedTitle];
  uint64_t v7 = [(LNAppShortcutOptionsCollection *)self systemImageName];
  id v8 = [(LNAppShortcutOptionsCollection *)self optionsProviderReference];
  id v9 = [v3 stringWithFormat:@"<%@: %p, localizedTitle: %@, systemImageName: %@, optionsProviderReference: %@>", v5, self, v6, v7, v8];

  return v9;
}

@end