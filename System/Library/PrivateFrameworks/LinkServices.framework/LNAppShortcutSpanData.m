@interface LNAppShortcutSpanData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNAppShortcutSpanData)initWithCoder:(id)a3;
- (LNAppShortcutSpanData)initWithValue:(id)a3 propertyTitle:(id)a4 propertyTitleKey:(id)a5 providerClassName:(id)a6 parameterTypeIdentifier:(id)a7 synonyms:(id)a8;
- (LNStaticDeferredLocalizedString)propertyTitle;
- (LNValue)value;
- (NSArray)synonyms;
- (NSString)parameterTypeIdentifier;
- (NSString)propertyTitleKey;
- (NSString)providerClassName;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNAppShortcutSpanData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_parameterTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_providerClassName, 0);
  objc_storeStrong((id *)&self->_propertyTitleKey, 0);
  objc_storeStrong((id *)&self->_propertyTitle, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (NSString)parameterTypeIdentifier
{
  return self->_parameterTypeIdentifier;
}

- (NSString)providerClassName
{
  return self->_providerClassName;
}

- (NSString)propertyTitleKey
{
  return self->_propertyTitleKey;
}

- (LNStaticDeferredLocalizedString)propertyTitle
{
  return self->_propertyTitle;
}

- (LNValue)value
{
  return self->_value;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNAppShortcutSpanData *)self propertyTitle];
  [v4 encodeObject:v5 forKey:@"propertyTitle"];

  v6 = [(LNAppShortcutSpanData *)self propertyTitleKey];
  [v4 encodeObject:v6 forKey:@"propertyTitleKey"];

  v7 = [(LNAppShortcutSpanData *)self providerClassName];
  [v4 encodeObject:v7 forKey:@"providerClassName"];

  v8 = [(LNAppShortcutSpanData *)self value];
  [v4 encodeObject:v8 forKey:@"value"];

  v9 = [(LNAppShortcutSpanData *)self parameterTypeIdentifier];
  [v4 encodeObject:v9 forKey:@"parameterTypeIdentifier"];

  id v10 = [(LNAppShortcutSpanData *)self synonyms];
  [v4 encodeObject:v10 forKey:@"synonyms"];
}

- (LNAppShortcutSpanData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyTitle"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyTitleKey"];
    if (v6)
    {
      v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"providerClassName"];
      if (v7)
      {
        v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
        if (v8)
        {
          v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterTypeIdentifier"];
          if (v9)
          {
            id v10 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v11 = objc_opt_class();
            v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
            v13 = [v4 decodeObjectOfClasses:v12 forKey:@"synonyms"];

            if (v13)
            {
              self = [(LNAppShortcutSpanData *)self initWithValue:v8 propertyTitle:v5 propertyTitleKey:v6 providerClassName:v7 parameterTypeIdentifier:v9 synonyms:v13];
              v14 = self;
            }
            else
            {
              v14 = 0;
            }
          }
          else
          {
            v14 = 0;
          }
        }
        else
        {
          v14 = 0;
        }
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"[title: %@ provider: %@ type: %@]", self->_propertyTitle, self->_providerClassName, self->_parameterTypeIdentifier];
}

- (unint64_t)hash
{
  v3 = [(LNAppShortcutSpanData *)self propertyTitle];
  uint64_t v4 = [v3 hash];
  v5 = [(LNAppShortcutSpanData *)self propertyTitleKey];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNAppShortcutSpanData *)self providerClassName];
  uint64_t v8 = [v7 hash];
  v9 = [(LNAppShortcutSpanData *)self parameterTypeIdentifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(LNAppShortcutSpanData *)self synonyms];
  uint64_t v12 = [v11 hash];
  v13 = [(LNAppShortcutSpanData *)self value];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNAppShortcutSpanData *)a3;
  v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_52:

      goto LABEL_53;
    }
    v7 = [(LNAppShortcutSpanData *)self propertyTitle];
    uint64_t v8 = [(LNAppShortcutSpanData *)v6 propertyTitle];
    id v9 = v7;
    id v10 = v8;
    uint64_t v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_50;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_51:

        goto LABEL_52;
      }
    }
    v16 = [(LNAppShortcutSpanData *)self propertyTitleKey];
    v17 = [(LNAppShortcutSpanData *)v6 propertyTitleKey];
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
        goto LABEL_49;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_50:

        goto LABEL_51;
      }
    }
    v22 = [(LNAppShortcutSpanData *)self providerClassName];
    v23 = [(LNAppShortcutSpanData *)v6 providerClassName];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    id v48 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_48;
      }
      int v12 = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_49;
      }
    }
    v47 = v19;
    v26 = [(LNAppShortcutSpanData *)self parameterTypeIdentifier];
    v27 = [(LNAppShortcutSpanData *)v6 parameterTypeIdentifier];
    id v28 = v26;
    id v29 = v27;
    v45 = v29;
    id v46 = v28;
    if (v28 == v29)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v47;
        goto LABEL_46;
      }
      v30 = v29;
      v19 = v47;
      if (!v29)
      {
LABEL_46:

        goto LABEL_47;
      }
      int v31 = [v28 isEqual:v29];

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v47;
LABEL_47:
        v25 = v45;
        id v20 = v46;
LABEL_48:

        id v20 = v48;
LABEL_49:

        goto LABEL_50;
      }
    }
    v32 = [(LNAppShortcutSpanData *)self synonyms];
    v33 = [(LNAppShortcutSpanData *)v6 synonyms];
    id v28 = v32;
    id v34 = v33;
    id v43 = v28;
    v44 = v34;
    if (v28 == v34)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v35 = v34;
        v19 = v47;
        goto LABEL_45;
      }
      v35 = v34;
      v19 = v47;
      if (!v34)
      {
LABEL_45:

        id v28 = v43;
        v30 = v44;
        goto LABEL_46;
      }
      int v36 = [v28 isEqual:v34];

      if (!v36)
      {
        LOBYTE(v12) = 0;
        v19 = v47;
        v30 = v44;
        goto LABEL_46;
      }
    }
    v37 = [(LNAppShortcutSpanData *)self value];
    v38 = [(LNAppShortcutSpanData *)v6 value];
    id v39 = v37;
    id v40 = v38;
    v42 = v40;
    if (v39 == v40)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v39)
      {
        v19 = v47;
        if (v40) {
          LOBYTE(v12) = [v39 isEqual:v40];
        }
        goto LABEL_43;
      }
    }
    v19 = v47;
LABEL_43:

    v35 = v42;
    id v28 = v39;
    goto LABEL_45;
  }
  LOBYTE(v12) = 1;
LABEL_53:

  return v12;
}

- (LNAppShortcutSpanData)initWithValue:(id)a3 propertyTitle:(id)a4 propertyTitleKey:(id)a5 providerClassName:(id)a6 parameterTypeIdentifier:(id)a7 synonyms:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id obj = a6;
  id v17 = a6;
  id v32 = a7;
  id v18 = a7;
  id v33 = a8;
  id v19 = a8;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"LNAppShortcutSpanData.m", 22, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"LNAppShortcutSpanData.m", 23, @"Invalid parameter not satisfying: %@", @"propertyTitle" object file lineNumber description];

  if (v16)
  {
LABEL_4:
    if (v17) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"LNAppShortcutSpanData.m", 24, @"Invalid parameter not satisfying: %@", @"propertyTitleKey" object file lineNumber description];

  if (v17)
  {
LABEL_5:
    if (v18) {
      goto LABEL_6;
    }
LABEL_14:
    id v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"LNAppShortcutSpanData.m", 26, @"Invalid parameter not satisfying: %@", @"parameterTypeIdentifier" object file lineNumber description];

    if (v19) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_13:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"LNAppShortcutSpanData.m", 25, @"Invalid parameter not satisfying: %@", @"providerClassName" object file lineNumber description];

  if (!v18) {
    goto LABEL_14;
  }
LABEL_6:
  if (v19) {
    goto LABEL_7;
  }
LABEL_15:
  id v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"LNAppShortcutSpanData.m", 27, @"Invalid parameter not satisfying: %@", @"synonyms" object file lineNumber description];

LABEL_7:
  v35.receiver = self;
  v35.super_class = (Class)LNAppShortcutSpanData;
  id v20 = [(LNAppShortcutSpanData *)&v35 init];
  int v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_value, a3);
    objc_storeStrong((id *)&v21->_propertyTitle, a4);
    objc_storeStrong((id *)&v21->_propertyTitleKey, a5);
    objc_storeStrong((id *)&v21->_providerClassName, obj);
    objc_storeStrong((id *)&v21->_parameterTypeIdentifier, v32);
    objc_storeStrong((id *)&v21->_synonyms, v33);
    v22 = v21;
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end