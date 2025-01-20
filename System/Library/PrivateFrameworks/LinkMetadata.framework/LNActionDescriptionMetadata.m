@interface LNActionDescriptionMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNActionDescriptionIcon)icon;
- (LNActionDescriptionMetadata)actionDescriptionMetadataWithIcon:(id)a3;
- (LNActionDescriptionMetadata)initWithCoder:(id)a3;
- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5;
- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5 resultValueName:(id)a6;
- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5 resultValueName:(id)a6 icon:(id)a7;
- (LNDisplayRepresentation)categoryName;
- (LNStaticDeferredLocalizedString)descriptionText;
- (LNStaticDeferredLocalizedString)resultValueName;
- (NSArray)searchKeywords;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionDescriptionMetadata

- (LNActionDescriptionMetadata)initWithCoder:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptionText"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryName"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    v9 = [v7 setWithArray:v8];
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"searchKeywords"];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resultValueName"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"icon"];
    self = [(LNActionDescriptionMetadata *)self initWithDescriptionText:v5 categoryName:v6 searchKeywords:v10 resultValueName:v11 icon:v12];

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5 resultValueName:(id)a6 icon:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"LNActionDescriptionMetadata.m", 34, @"Invalid parameter not satisfying: %@", @"actionDescription" object file lineNumber description];
  }
  v32.receiver = self;
  v32.super_class = (Class)LNActionDescriptionMetadata;
  v18 = [(LNActionDescriptionMetadata *)&v32 init];
  if (v18)
  {
    uint64_t v19 = [v13 copy];
    descriptionText = v18->_descriptionText;
    v18->_descriptionText = (LNStaticDeferredLocalizedString *)v19;

    uint64_t v21 = [v14 copy];
    categoryName = v18->_categoryName;
    v18->_categoryName = (LNDisplayRepresentation *)v21;

    uint64_t v23 = [v15 copy];
    searchKeywords = v18->_searchKeywords;
    v18->_searchKeywords = (NSArray *)v23;

    uint64_t v25 = [v16 copy];
    resultValueName = v18->_resultValueName;
    v18->_resultValueName = (LNStaticDeferredLocalizedString *)v25;

    uint64_t v27 = [v17 copy];
    icon = v18->_icon;
    v18->_icon = (LNActionDescriptionIcon *)v27;

    v29 = v18;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionDescriptionMetadata *)self descriptionText];
  [v4 encodeObject:v5 forKey:@"descriptionText"];

  v6 = [(LNActionDescriptionMetadata *)self categoryName];
  [v4 encodeObject:v6 forKey:@"categoryName"];

  v7 = [(LNActionDescriptionMetadata *)self searchKeywords];
  [v4 encodeObject:v7 forKey:@"searchKeywords"];

  v8 = [(LNActionDescriptionMetadata *)self resultValueName];
  [v4 encodeObject:v8 forKey:@"resultValueName"];

  id v9 = [(LNActionDescriptionMetadata *)self icon];
  [v4 encodeObject:v9 forKey:@"icon"];
}

- (LNStaticDeferredLocalizedString)descriptionText
{
  return self->_descriptionText;
}

- (NSArray)searchKeywords
{
  return self->_searchKeywords;
}

- (LNStaticDeferredLocalizedString)resultValueName
{
  return self->_resultValueName;
}

- (LNActionDescriptionIcon)icon
{
  return self->_icon;
}

- (LNDisplayRepresentation)categoryName
{
  return self->_categoryName;
}

- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5 resultValueName:(id)a6
{
  return [(LNActionDescriptionMetadata *)self initWithDescriptionText:a3 categoryName:a4 searchKeywords:a5 resultValueName:a6 icon:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_resultValueName, 0);
  objc_storeStrong((id *)&self->_searchKeywords, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
}

- (LNActionDescriptionMetadata)actionDescriptionMetadataWithIcon:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(LNActionDescriptionMetadata *)self copy];
  uint64_t v6 = [v4 copy];

  v7 = (void *)v5[5];
  v5[5] = v6;

  return (LNActionDescriptionMetadata *)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionDescriptionMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_44:

      goto LABEL_45;
    }
    v7 = [(LNActionDescriptionMetadata *)self descriptionText];
    v8 = [(LNActionDescriptionMetadata *)v6 descriptionText];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_42;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_43:

        goto LABEL_44;
      }
    }
    id v16 = [(LNActionDescriptionMetadata *)self searchKeywords];
    id v17 = [(LNActionDescriptionMetadata *)v6 searchKeywords];
    id v14 = v16;
    id v18 = v17;
    id v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_41;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_42:

        goto LABEL_43;
      }
    }
    v22 = [(LNActionDescriptionMetadata *)self categoryName];
    uint64_t v23 = [(LNActionDescriptionMetadata *)v6 categoryName];
    id v20 = v22;
    id v24 = v23;
    uint64_t v19 = v24;
    id v40 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_40;
      }
      int v12 = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_41;
      }
    }
    v26 = [(LNActionDescriptionMetadata *)self resultValueName];
    uint64_t v27 = [(LNActionDescriptionMetadata *)v6 resultValueName];
    id v28 = v26;
    id v29 = v27;
    v38 = v29;
    id v39 = v28;
    if (v28 == v29)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        uint64_t v19 = v37;
        goto LABEL_38;
      }
      v30 = v29;
      uint64_t v19 = v37;
      if (!v29)
      {
LABEL_38:

        goto LABEL_39;
      }
      int v31 = [v28 isEqual:v29];

      if (!v31)
      {
        LOBYTE(v12) = 0;
        uint64_t v19 = v37;
LABEL_39:
        uint64_t v25 = v38;
        id v20 = v39;
LABEL_40:

        id v20 = v40;
LABEL_41:

        goto LABEL_42;
      }
    }
    objc_super v32 = [(LNActionDescriptionMetadata *)self icon];
    v33 = [(LNActionDescriptionMetadata *)v6 icon];
    id v28 = v32;
    id v34 = v33;
    v35 = v34;
    if (v28 == v34)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        uint64_t v19 = v37;
        if (v34) {
          LOBYTE(v12) = [v28 isEqual:v34];
        }
        goto LABEL_36;
      }
    }
    uint64_t v19 = v37;
LABEL_36:

    v30 = v35;
    goto LABEL_38;
  }
  LOBYTE(v12) = 1;
LABEL_45:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNActionDescriptionMetadata *)self descriptionText];
  uint64_t v4 = [v3 hash];
  v5 = [(LNActionDescriptionMetadata *)self searchKeywords];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(LNActionDescriptionMetadata *)self categoryName];
  uint64_t v8 = [v7 hash];
  id v9 = [(LNActionDescriptionMetadata *)self resultValueName];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(LNActionDescriptionMetadata *)self icon];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNActionDescriptionMetadata *)self descriptionText];
  v7 = [(LNActionDescriptionMetadata *)self categoryName];
  uint64_t v8 = [(LNActionDescriptionMetadata *)self searchKeywords];
  id v9 = [(LNActionDescriptionMetadata *)self resultValueName];
  uint64_t v10 = [(LNActionDescriptionMetadata *)self icon];
  v11 = [v3 stringWithFormat:@"<%@: %p, description: %@, categoryName: %@, searchKeywords: [%@], resultValueName: %@, icon: %@>", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(LNActionDescriptionMetadata *)self descriptionText];
  uint64_t v6 = [(LNActionDescriptionMetadata *)self categoryName];
  v7 = [(LNActionDescriptionMetadata *)self searchKeywords];
  uint64_t v8 = [(LNActionDescriptionMetadata *)self resultValueName];
  id v9 = [(LNActionDescriptionMetadata *)self icon];
  uint64_t v10 = (void *)[v4 initWithDescriptionText:v5 categoryName:v6 searchKeywords:v7 resultValueName:v8 icon:v9];

  return v10;
}

- (LNActionDescriptionMetadata)initWithDescriptionText:(id)a3 categoryName:(id)a4 searchKeywords:(id)a5
{
  return [(LNActionDescriptionMetadata *)self initWithDescriptionText:a3 categoryName:a4 searchKeywords:a5 resultValueName:0];
}

@end