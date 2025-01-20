@interface LNDisplayRepresentation
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNDisplayRepresentation)initWithCoder:(id)a3;
- (LNDisplayRepresentation)initWithTitle:(id)a3 snippetPluginModel:(id)a4;
- (LNDisplayRepresentation)initWithTitle:(id)a3 snippetPluginModelData:(id)a4;
- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5;
- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6;
- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6 descriptionText:(id)a7;
- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6 descriptionText:(id)a7 snippetPluginModel:(id)a8;
- (LNImage)image;
- (LNStaticDeferredLocalizedString)descriptionText;
- (LNStaticDeferredLocalizedString)subtitle;
- (LNStaticDeferredLocalizedString)title;
- (LNUIPluginModel)snippetPluginModel;
- (NSArray)synonyms;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNDisplayRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snippetPluginModel, 0);
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6 descriptionText:(id)a7
{
  return [(LNDisplayRepresentation *)self initWithTitle:a3 subtitle:a4 image:a5 synonyms:a6 descriptionText:a7 snippetPluginModel:0];
}

- (LNDisplayRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"image"];

    v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"synonyms"];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"snippetPluginModel"];
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"descriptionText"];
    self = [(LNDisplayRepresentation *)self initWithTitle:v5 subtitle:v6 image:v11 synonyms:v15 descriptionText:v17 snippetPluginModel:v16];

    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6 descriptionText:(id)a7 snippetPluginModel:(id)a8
{
  id v15 = a3;
  id v28 = a4;
  id v27 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (!v15)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"LNDisplayRepresentation.m", 62, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)LNDisplayRepresentation;
  v19 = [(LNDisplayRepresentation *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_title, a3);
    objc_storeStrong((id *)&v20->_subtitle, a4);
    objc_storeStrong((id *)&v20->_image, a5);
    uint64_t v21 = [v16 copy];
    synonyms = v20->_synonyms;
    v20->_synonyms = (NSArray *)v21;

    objc_storeStrong((id *)&v20->_descriptionText, a7);
    objc_storeStrong((id *)&v20->_snippetPluginModel, a8);
    v23 = v20;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNDisplayRepresentation *)self title];
  [v4 encodeObject:v5 forKey:@"title"];

  v6 = [(LNDisplayRepresentation *)self subtitle];
  [v4 encodeObject:v6 forKey:@"subtitle"];

  v7 = [(LNDisplayRepresentation *)self image];
  [v4 encodeObject:v7 forKey:@"image"];

  uint64_t v8 = [(LNDisplayRepresentation *)self synonyms];
  [v4 encodeObject:v8 forKey:@"synonyms"];

  uint64_t v9 = [(LNDisplayRepresentation *)self descriptionText];
  [v4 encodeObject:v9 forKey:@"descriptionText"];

  id v10 = [(LNDisplayRepresentation *)self snippetPluginModel];
  [v4 encodeObject:v10 forKey:@"snippetPluginModel"];
}

- (LNImage)image
{
  return self->_image;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (LNStaticDeferredLocalizedString)subtitle
{
  return self->_subtitle;
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (LNUIPluginModel)snippetPluginModel
{
  return self->_snippetPluginModel;
}

- (LNStaticDeferredLocalizedString)descriptionText
{
  return self->_descriptionText;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  v3 = [(LNDisplayRepresentation *)self title];
  uint64_t v4 = [v3 hash];
  v5 = [(LNDisplayRepresentation *)self subtitle];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNDisplayRepresentation *)a3;
  v5 = v4;
  if (self != v4)
  {
    unint64_t v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_52:

      goto LABEL_53;
    }
    v7 = [(LNDisplayRepresentation *)self title];
    uint64_t v8 = [(LNDisplayRepresentation *)v6 title];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
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
    id v16 = [(LNDisplayRepresentation *)self subtitle];
    id v17 = [(LNDisplayRepresentation *)v6 subtitle];
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
    v22 = [(LNDisplayRepresentation *)self image];
    v23 = [(LNDisplayRepresentation *)v6 image];
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
    v26 = [(LNDisplayRepresentation *)self synonyms];
    id v27 = [(LNDisplayRepresentation *)v6 synonyms];
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
    v32 = [(LNDisplayRepresentation *)self descriptionText];
    v33 = [(LNDisplayRepresentation *)v6 descriptionText];
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
    v37 = [(LNDisplayRepresentation *)self snippetPluginModel];
    v38 = [(LNDisplayRepresentation *)v6 snippetPluginModel];
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

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = [(LNDisplayRepresentation *)self title];
  v7 = [(LNDisplayRepresentation *)self subtitle];
  uint64_t v8 = [(LNDisplayRepresentation *)self image];
  id v9 = [(LNDisplayRepresentation *)self synonyms];
  id v10 = [(LNDisplayRepresentation *)self descriptionText];
  v11 = [(LNDisplayRepresentation *)self snippetPluginModel];
  int v12 = [v3 stringWithFormat:@"<%@: %p, title: %@, subtitle: %@, image: %@, synonyms: %@, descriptionText: %@, snippetPluginModel: %@>", v5, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 synonyms:(id)a6
{
  return [(LNDisplayRepresentation *)self initWithTitle:a3 subtitle:a4 image:a5 synonyms:a6 descriptionText:0 snippetPluginModel:0];
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 snippetPluginModelData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"LNDisplayRepresentation.m", 36, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  id v9 = [(LNDisplayRepresentation *)self initWithTitle:v7 subtitle:0 image:0 synonyms:0 descriptionText:0 snippetPluginModel:v8];

  return v9;
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 snippetPluginModel:(id)a4
{
  return [(LNDisplayRepresentation *)self initWithTitle:a3 subtitle:0 image:0 synonyms:0 descriptionText:0 snippetPluginModel:a4];
}

- (LNDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5
{
  return [(LNDisplayRepresentation *)self initWithTitle:a3 subtitle:a4 image:a5 synonyms:0];
}

@end