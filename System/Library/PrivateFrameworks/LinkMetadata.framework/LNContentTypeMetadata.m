@interface LNContentTypeMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LNContentTypeMetadata)initWithCoder:(id)a3;
- (LNContentTypeMetadata)initWithExportableTypes:(id)a3 importableTypes:(id)a4;
- (NSArray)exportableTypes;
- (NSArray)importableTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNContentTypeMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importableTypes, 0);
  objc_storeStrong((id *)&self->_exportableTypes, 0);
}

- (LNContentTypeMetadata)initWithExportableTypes:(id)a3 importableTypes:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)LNContentTypeMetadata;
  v9 = [(LNContentTypeMetadata *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_exportableTypes, a3);
    objc_storeStrong((id *)&v10->_importableTypes, a4);
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNContentTypeMetadata *)self exportableTypes];
  [v4 encodeObject:v5 forKey:@"exportableTypes"];

  id v6 = [(LNContentTypeMetadata *)self importableTypes];
  [v4 encodeObject:v6 forKey:@"importableTypes"];
}

- (NSArray)exportableTypes
{
  return self->_exportableTypes;
}

- (LNContentTypeMetadata)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  id v8 = [v5 decodeObjectOfClasses:v7 forKey:@"exportableTypes"];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v5 decodeObjectOfClasses:v11 forKey:@"importableTypes"];

  objc_super v13 = [(LNContentTypeMetadata *)self initWithExportableTypes:v8 importableTypes:v12];
  return v13;
}

- (NSArray)importableTypes
{
  return self->_importableTypes;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNContentTypeMetadata *)a3;
  id v5 = v4;
  if (self != v4)
  {
    uint64_t v6 = v4;
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = [(LNContentTypeMetadata *)self exportableTypes];
        id v8 = [(LNContentTypeMetadata *)v6 exportableTypes];

        if (v7 != v8)
        {
          uint64_t v9 = [(LNContentTypeMetadata *)self exportableTypes];
          if (!v9) {
            goto LABEL_16;
          }
          uint64_t v10 = (void *)v9;
          v11 = [(LNContentTypeMetadata *)v6 exportableTypes];

          if (!v11) {
            goto LABEL_16;
          }
          v12 = (void *)MEMORY[0x1E4F1CAD0];
          objc_super v13 = [(LNContentTypeMetadata *)self exportableTypes];
          v14 = [v12 setWithArray:v13];
          v15 = (void *)MEMORY[0x1E4F1CAD0];
          v16 = [(LNContentTypeMetadata *)v6 exportableTypes];
          v17 = [v15 setWithArray:v16];
          int v18 = [v14 isEqualToSet:v17];

          if (!v18) {
            goto LABEL_16;
          }
        }
        v19 = [(LNContentTypeMetadata *)self importableTypes];
        v20 = [(LNContentTypeMetadata *)v6 importableTypes];

        if (v19 == v20)
        {
          char v30 = 1;
          goto LABEL_18;
        }
        uint64_t v21 = [(LNContentTypeMetadata *)self importableTypes];
        if (!v21
          || (v22 = (void *)v21,
              [(LNContentTypeMetadata *)v6 importableTypes],
              v23 = objc_claimAutoreleasedReturnValue(),
              v23,
              v22,
              !v23))
        {
LABEL_16:
          char v30 = 0;
          goto LABEL_18;
        }
        v24 = (void *)MEMORY[0x1E4F1CAD0];
        v25 = [(LNContentTypeMetadata *)self importableTypes];
        v26 = [v24 setWithArray:v25];
        v27 = (void *)MEMORY[0x1E4F1CAD0];
        v28 = [(LNContentTypeMetadata *)v6 importableTypes];
        v29 = [v27 setWithArray:v28];
        char v30 = [v26 isEqualToSet:v29];
      }
      else
      {
        char v30 = 0;
        v25 = v6;
        uint64_t v6 = 0;
      }
    }
    else
    {
      v25 = 0;
      char v30 = 0;
    }

LABEL_18:
    goto LABEL_19;
  }
  char v30 = 1;
LABEL_19:

  return v30;
}

- (unint64_t)hash
{
  v3 = [(LNContentTypeMetadata *)self exportableTypes];
  uint64_t v4 = [v3 hash];
  id v5 = [(LNContentTypeMetadata *)self importableTypes];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end