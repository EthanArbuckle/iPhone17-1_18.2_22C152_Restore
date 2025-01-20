@interface LNAppShortcutParameterPresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAppShortcutParameterPresentation)initWithCoder:(id)a3;
- (LNAppShortcutParameterPresentation)initWithParameterIdentifier:(id)a3 localizedSpecificTitle:(id)a4 localizedGenericTitle:(id)a5 optionsCollections:(id)a6;
- (LNAppShortcutParameterPresentation)initWithParameterIdentifier:(id)a3 localizedSpecificTitle:(id)a4 optionsCollections:(id)a5;
- (NSArray)optionsCollections;
- (NSString)localizedGenericTitle;
- (NSString)localizedSpecificTitle;
- (NSString)parameterIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppShortcutParameterPresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsCollections, 0);
  objc_storeStrong((id *)&self->_localizedSpecificTitle, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

- (LNAppShortcutParameterPresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedSpecificTitle"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"optionsCollections"];

  v11 = 0;
  if (v5 && v6)
  {
    self = [(LNAppShortcutParameterPresentation *)self initWithParameterIdentifier:v5 localizedSpecificTitle:v6 optionsCollections:v10];
    v11 = self;
  }

  return v11;
}

- (LNAppShortcutParameterPresentation)initWithParameterIdentifier:(id)a3 localizedSpecificTitle:(id)a4 optionsCollections:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"LNAppShortcutParameterPresentation.m", 19, @"Invalid parameter not satisfying: %@", @"parameterIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"LNAppShortcutParameterPresentation.m", 20, @"Invalid parameter not satisfying: %@", @"localizedSpecificTitle" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)LNAppShortcutParameterPresentation;
  v12 = [(LNAppShortcutParameterPresentation *)&v23 init];
  if (v12)
  {
    uint64_t v13 = [v9 copy];
    parameterIdentifier = v12->_parameterIdentifier;
    v12->_parameterIdentifier = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    localizedSpecificTitle = v12->_localizedSpecificTitle;
    v12->_localizedSpecificTitle = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    optionsCollections = v12->_optionsCollections;
    v12->_optionsCollections = (NSArray *)v17;

    v19 = v12;
  }

  return v12;
}

- (NSArray)optionsCollections
{
  return self->_optionsCollections;
}

- (NSString)localizedSpecificTitle
{
  return self->_localizedSpecificTitle;
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAppShortcutParameterPresentation *)self parameterIdentifier];
  [v4 encodeObject:v5 forKey:@"parameterIdentifier"];

  v6 = [(LNAppShortcutParameterPresentation *)self localizedSpecificTitle];
  [v4 encodeObject:v6 forKey:@"localizedSpecificTitle"];

  id v7 = [(LNAppShortcutParameterPresentation *)self optionsCollections];
  [v4 encodeObject:v7 forKey:@"optionsCollections"];
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)LNAppShortcutParameterPresentation;
  unint64_t v3 = [(LNAppShortcutParameterPresentation *)&v11 hash];
  id v4 = [(LNAppShortcutParameterPresentation *)self parameterIdentifier];
  uint64_t v5 = [v4 hash];
  v6 = [(LNAppShortcutParameterPresentation *)self localizedSpecificTitle];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = [(LNAppShortcutParameterPresentation *)self optionsCollections];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNAppShortcutParameterPresentation *)a3;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)LNAppShortcutParameterPresentation;
    if ([(LNAppShortcutParameterPresentation *)&v24 isEqual:v4])
    {
      uint64_t v5 = v4;
      if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        LOBYTE(v11) = 0;
LABEL_29:

        goto LABEL_30;
      }
      v6 = [(LNAppShortcutParameterPresentation *)self parameterIdentifier];
      uint64_t v7 = [(LNAppShortcutParameterPresentation *)v5 parameterIdentifier];
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
      uint64_t v15 = [(LNAppShortcutParameterPresentation *)self localizedSpecificTitle];
      v16 = [(LNAppShortcutParameterPresentation *)v5 localizedSpecificTitle];
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
      v20 = [(LNAppShortcutParameterPresentation *)self optionsCollections];
      v21 = [(LNAppShortcutParameterPresentation *)v5 optionsCollections];
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
  v6 = [(LNAppShortcutParameterPresentation *)self parameterIdentifier];
  uint64_t v7 = [(LNAppShortcutParameterPresentation *)self localizedSpecificTitle];
  id v8 = [(LNAppShortcutParameterPresentation *)self optionsCollections];
  id v9 = [v3 stringWithFormat:@"<%@: %p, parameterIdentifier: %@, localizedSpecificTitle: %@,optionsCollections: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (LNAppShortcutParameterPresentation)initWithParameterIdentifier:(id)a3 localizedSpecificTitle:(id)a4 localizedGenericTitle:(id)a5 optionsCollections:(id)a6
{
  return [(LNAppShortcutParameterPresentation *)self initWithParameterIdentifier:a3 localizedSpecificTitle:a4 optionsCollections:a6];
}

- (NSString)localizedGenericTitle
{
  return (NSString *)&stru_1EF7D9D20;
}

@end