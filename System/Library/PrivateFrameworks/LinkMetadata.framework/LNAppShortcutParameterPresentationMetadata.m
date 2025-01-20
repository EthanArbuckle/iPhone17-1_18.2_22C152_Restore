@interface LNAppShortcutParameterPresentationMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionSummaryString)specificTitle;
- (LNAppShortcutParameterPresentationMetadata)initWithCoder:(id)a3;
- (LNAppShortcutParameterPresentationMetadata)initWithParameterIdentifier:(id)a3 specificTitle:(id)a4 genericTitle:(id)a5 localizationTable:(id)a6 optionsCollection:(id)a7;
- (LNAppShortcutParameterPresentationMetadata)initWithParameterIdentifier:(id)a3 specificTitle:(id)a4 localizationTable:(id)a5 optionsCollection:(id)a6;
- (NSArray)optionsCollection;
- (NSString)genericTitle;
- (NSString)localizationTable;
- (NSString)parameterIdentifier;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppShortcutParameterPresentationMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionsCollection, 0);
  objc_storeStrong((id *)&self->_localizationTable, 0);
  objc_storeStrong((id *)&self->_specificTitle, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

- (NSArray)optionsCollection
{
  return self->_optionsCollection;
}

- (NSString)localizationTable
{
  return self->_localizationTable;
}

- (LNActionSummaryString)specificTitle
{
  return self->_specificTitle;
}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNAppShortcutParameterPresentationMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    v7 = [(LNAppShortcutParameterPresentationMetadata *)self parameterIdentifier];
    v8 = [(LNAppShortcutParameterPresentationMetadata *)v6 parameterIdentifier];
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
      if (!v9 || !v10) {
        goto LABEL_33;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v16 = [(LNAppShortcutParameterPresentationMetadata *)self specificTitle];
    v17 = [(LNAppShortcutParameterPresentationMetadata *)v6 specificTitle];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_32;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    v22 = [(LNAppShortcutParameterPresentationMetadata *)self localizationTable];
    v23 = [(LNAppShortcutParameterPresentationMetadata *)v6 localizationTable];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      id v26 = v20;
      if (!v20 || !v24) {
        goto LABEL_28;
      }
      LODWORD(v12) = [v20 isEqualToString:v24];

      if (!v12) {
        goto LABEL_32;
      }
    }
    v38 = v19;
    v27 = [(LNAppShortcutParameterPresentationMetadata *)self optionsCollection];
    v28 = [(LNAppShortcutParameterPresentationMetadata *)v6 optionsCollection];

    if (v27 == v28)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      v12 = [(LNAppShortcutParameterPresentationMetadata *)self optionsCollection];
      if (v12)
      {
        v29 = [(LNAppShortcutParameterPresentationMetadata *)v6 optionsCollection];

        if (v29)
        {
          v30 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v37 = [(LNAppShortcutParameterPresentationMetadata *)self optionsCollection];
          v36 = [v30 setWithArray:v37];
          v31 = (void *)MEMORY[0x1E4F1CAD0];
          v32 = [(LNAppShortcutParameterPresentationMetadata *)v6 optionsCollection];
          v33 = [v31 setWithArray:v32];
          LOBYTE(v12) = [v36 isEqualToSet:v33];

          v25 = v36;
          id v26 = (id)v37;
          v19 = v38;
LABEL_28:
          v34 = v26;

LABEL_32:
          goto LABEL_33;
        }
        LOBYTE(v12) = 0;
      }
    }
    v19 = v38;
    goto LABEL_32;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return (char)v12;
}

- (unint64_t)hash
{
  v3 = [(LNAppShortcutParameterPresentationMetadata *)self parameterIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAppShortcutParameterPresentationMetadata *)self specificTitle];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNAppShortcutParameterPresentationMetadata *)self localizationTable];
  uint64_t v8 = [v7 hash];
  id v9 = [(LNAppShortcutParameterPresentationMetadata *)self optionsCollection];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNAppShortcutParameterPresentationMetadata *)self parameterIdentifier];
  v7 = [(LNAppShortcutParameterPresentationMetadata *)self specificTitle];
  uint64_t v8 = [(LNAppShortcutParameterPresentationMetadata *)self localizationTable];
  id v9 = [(LNAppShortcutParameterPresentationMetadata *)self optionsCollection];
  unint64_t v10 = [v3 stringWithFormat:@"<%@: %p, parameterIdentifier: %@, specificTitle: %@, localizationTable: %@, optionsCollection: %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (LNAppShortcutParameterPresentationMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterIdentifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"specificTitle"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v14 = 0;
  }
  else
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizationTable"];
    unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = [v4 decodeObjectOfClasses:v12 forKey:@"optionsCollection"];

    self = [(LNAppShortcutParameterPresentationMetadata *)self initWithParameterIdentifier:v5 specificTitle:v7 localizationTable:v9 optionsCollection:v13];
    id v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAppShortcutParameterPresentationMetadata *)self parameterIdentifier];
  [v4 encodeObject:v5 forKey:@"parameterIdentifier"];

  uint64_t v6 = [(LNAppShortcutParameterPresentationMetadata *)self specificTitle];
  [v4 encodeObject:v6 forKey:@"specificTitle"];

  v7 = [(LNAppShortcutParameterPresentationMetadata *)self localizationTable];
  [v4 encodeObject:v7 forKey:@"localizationTable"];

  id v8 = [(LNAppShortcutParameterPresentationMetadata *)self optionsCollection];
  [v4 encodeObject:v8 forKey:@"optionsCollection"];
}

- (LNAppShortcutParameterPresentationMetadata)initWithParameterIdentifier:(id)a3 specificTitle:(id)a4 localizationTable:(id)a5 optionsCollection:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"LNAppShortcutParameterPresentationMetadata.m", 21, @"Invalid parameter not satisfying: %@", @"parameterIdentifier" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)LNAppShortcutParameterPresentationMetadata;
  int v15 = [(LNAppShortcutParameterPresentationMetadata *)&v27 init];
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    parameterIdentifier = v15->_parameterIdentifier;
    v15->_parameterIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    specificTitle = v15->_specificTitle;
    v15->_specificTitle = (LNActionSummaryString *)v18;

    uint64_t v20 = [v13 copy];
    localizationTable = v15->_localizationTable;
    v15->_localizationTable = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    optionsCollection = v15->_optionsCollection;
    v15->_optionsCollection = (NSArray *)v22;

    id v24 = v15;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNAppShortcutParameterPresentationMetadata)initWithParameterIdentifier:(id)a3 specificTitle:(id)a4 genericTitle:(id)a5 localizationTable:(id)a6 optionsCollection:(id)a7
{
  return [(LNAppShortcutParameterPresentationMetadata *)self initWithParameterIdentifier:a3 specificTitle:a4 localizationTable:a6 optionsCollection:a7];
}

- (NSString)genericTitle
{
  return (NSString *)&stru_1EEDBEA90;
}

@end