@interface WFAppDisplayRepresentation
+ (BOOL)supportsSecureCoding;
+ (id)withTitle:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)synonyms;
- (NSData)imageData;
- (NSData)snippetPluginModelData;
- (NSString)altText;
- (NSString)snippetPluginModelBundleIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (WFAppDisplayRepresentation)initWithCoder:(id)a3;
- (WFAppDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 altText:(id)a5 imageData:(id)a6 snippetPluginModelData:(id)a7 snippetPluginModelBundleIdentifier:(id)a8 synonyms:(id)a9;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFAppDisplayRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_snippetPluginModelBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_snippetPluginModelData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (NSString)snippetPluginModelBundleIdentifier
{
  return self->_snippetPluginModelBundleIdentifier;
}

- (NSData)snippetPluginModelData
{
  return self->_snippetPluginModelData;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSString)altText
{
  return self->_altText;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v22.receiver = self;
  v22.super_class = (Class)WFAppDisplayRepresentation;
  unint64_t v3 = [(WFAppDisplayRepresentation *)&v22 hash];
  v4 = [(WFAppDisplayRepresentation *)self title];
  uint64_t v5 = [v4 hash];
  v6 = [(WFAppDisplayRepresentation *)self subtitle];
  v7 = v6;
  if (!v6) {
    v6 = &stru_26C71CE08;
  }
  uint64_t v8 = v5 ^ [(__CFString *)v6 hash];
  v9 = [(WFAppDisplayRepresentation *)self altText];
  v10 = v9;
  if (!v9) {
    v9 = &stru_26C71CE08;
  }
  uint64_t v11 = v8 ^ [(__CFString *)v9 hash] ^ v3;
  v12 = [(WFAppDisplayRepresentation *)self imageData];
  uint64_t v13 = [v12 hash];
  v14 = [(WFAppDisplayRepresentation *)self snippetPluginModelData];
  uint64_t v15 = v13 ^ [v14 hash];
  v16 = [(WFAppDisplayRepresentation *)self snippetPluginModelBundleIdentifier];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26C71CE08;
  }
  uint64_t v18 = v15 ^ [(__CFString *)v16 hash];
  v19 = [(WFAppDisplayRepresentation *)self synonyms];
  unint64_t v20 = v11 ^ v18 ^ [v19 hash];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFAppDisplayRepresentation *)a3;
  uint64_t v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    v56.receiver = self;
    v56.super_class = (Class)WFAppDisplayRepresentation;
    if (![(WFAppDisplayRepresentation *)&v56 isEqual:v6])
    {
      LOBYTE(v12) = 0;
LABEL_60:

      goto LABEL_61;
    }
    v7 = [(WFAppDisplayRepresentation *)self title];
    uint64_t v8 = [(WFAppDisplayRepresentation *)v6 title];
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
      if (!v9 || !v10) {
        goto LABEL_58;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_59:

        goto LABEL_60;
      }
    }
    v16 = [(WFAppDisplayRepresentation *)self subtitle];
    v17 = [(WFAppDisplayRepresentation *)v6 subtitle];
    id v14 = v16;
    id v18 = v17;
    uint64_t v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_57;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_58:

        goto LABEL_59;
      }
    }
    objc_super v22 = [(WFAppDisplayRepresentation *)self altText];
    v23 = [(WFAppDisplayRepresentation *)v6 altText];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    id v55 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_56;
      }
      int v12 = [v20 isEqualToString:v24];

      if (!v12) {
        goto LABEL_57;
      }
    }
    v54 = v19;
    v26 = [(WFAppDisplayRepresentation *)self imageData];
    v27 = [(WFAppDisplayRepresentation *)v6 imageData];
    id v28 = v26;
    id v29 = v27;
    v52 = v29;
    id v53 = v28;
    if (v28 == v29)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v54;
        goto LABEL_54;
      }
      v30 = v29;
      v19 = v54;
      if (!v29)
      {
LABEL_54:

        goto LABEL_55;
      }
      int v31 = [v28 isEqual:v29];

      if (!v31)
      {
        LOBYTE(v12) = 0;
        v19 = v54;
LABEL_55:
        v25 = v52;
        id v20 = v53;
LABEL_56:

        id v20 = v55;
LABEL_57:

        goto LABEL_58;
      }
    }
    v32 = [(WFAppDisplayRepresentation *)self snippetPluginModelData];
    v33 = [(WFAppDisplayRepresentation *)v6 snippetPluginModelData];
    id v28 = v32;
    id v34 = v33;
    id v50 = v28;
    v51 = v34;
    if (v28 != v34)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v35 = v34;
        v19 = v54;
        if (v34)
        {
          int v36 = [v28 isEqual:v34];

          if (!v36)
          {
            LOBYTE(v12) = 0;
            v19 = v54;
            v30 = v51;
            goto LABEL_54;
          }
LABEL_35:
          v37 = [(WFAppDisplayRepresentation *)self snippetPluginModelBundleIdentifier];
          v38 = [(WFAppDisplayRepresentation *)v6 snippetPluginModelBundleIdentifier];
          id v39 = v37;
          id v40 = v38;
          v48 = v40;
          id v49 = v39;
          if (v39 == v40)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v39)
            {
              v41 = v40;
              v19 = v54;
              goto LABEL_51;
            }
            v41 = v40;
            v19 = v54;
            if (!v40)
            {
LABEL_51:

              goto LABEL_52;
            }
            int v42 = [v39 isEqualToString:v40];

            if (!v42)
            {
              LOBYTE(v12) = 0;
              v19 = v54;
LABEL_52:
              v35 = v48;
              id v28 = v49;
              goto LABEL_53;
            }
          }
          v43 = [(WFAppDisplayRepresentation *)self synonyms];
          v44 = [(WFAppDisplayRepresentation *)v6 synonyms];
          id v39 = v43;
          id v45 = v44;
          v46 = v45;
          if (v39 == v45)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v39)
            {
              v19 = v54;
              if (v45) {
                LOBYTE(v12) = [v39 isEqual:v45];
              }
              goto LABEL_49;
            }
          }
          v19 = v54;
LABEL_49:

          v41 = v46;
          goto LABEL_51;
        }
      }
      else
      {
        v35 = v34;
        v19 = v54;
      }
LABEL_53:

      id v28 = v50;
      v30 = v51;
      goto LABEL_54;
    }

    goto LABEL_35;
  }
  LOBYTE(v12) = 1;
LABEL_61:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFAppDisplayRepresentation *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(WFAppDisplayRepresentation *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];

  v7 = [(WFAppDisplayRepresentation *)self altText];
  [v4 encodeObject:v7 forKey:@"altText"];

  uint64_t v8 = [(WFAppDisplayRepresentation *)self imageData];
  [v4 encodeObject:v8 forKey:@"imageData"];

  id v9 = [(WFAppDisplayRepresentation *)self snippetPluginModelData];
  [v4 encodeObject:v9 forKey:@"snippetPluginModelData"];

  id v10 = [(WFAppDisplayRepresentation *)self snippetPluginModelBundleIdentifier];
  [v4 encodeObject:v10 forKey:@"snippetPluginModelBundleIdentifier"];

  id v11 = [(WFAppDisplayRepresentation *)self synonyms];
  [v4 encodeObject:v11 forKey:@"synonyms"];
}

- (WFAppDisplayRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altText"];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snippetPluginModelData"];
    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snippetPluginModelBundleIdentifier"];
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"synonyms"];
    self = [(WFAppDisplayRepresentation *)self initWithTitle:v5 subtitle:v6 altText:v7 imageData:v8 snippetPluginModelData:v9 snippetPluginModelBundleIdentifier:v10 synonyms:v11];

    int v12 = self;
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (WFAppDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 altText:(id)a5 imageData:(id)a6 snippetPluginModelData:(id)a7 snippetPluginModelBundleIdentifier:(id)a8 synonyms:(id)a9
{
  id v16 = a3;
  id v28 = a4;
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v17 = a9;
  if (!v16)
  {
    objc_super v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFApp.m", 75, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)WFAppDisplayRepresentation;
  id v18 = [(WFAppDisplayRepresentation *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a3);
    objc_storeStrong((id *)&v19->_subtitle, a4);
    objc_storeStrong((id *)&v19->_altText, a5);
    objc_storeStrong((id *)&v19->_imageData, a6);
    objc_storeStrong((id *)&v19->_snippetPluginModelData, a7);
    objc_storeStrong((id *)&v19->_snippetPluginModelBundleIdentifier, a8);
    objc_storeStrong((id *)&v19->_synonyms, a9);
    id v20 = v19;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)withTitle:(id)a3
{
  id v3 = a3;
  id v4 = [WFAppDisplayRepresentation alloc];
  uint64_t v5 = [(WFAppDisplayRepresentation *)v4 initWithTitle:v3 subtitle:0 altText:0 imageData:0 snippetPluginModelData:0 snippetPluginModelBundleIdentifier:0 synonyms:MEMORY[0x263EFFA68]];

  return v5;
}

@end