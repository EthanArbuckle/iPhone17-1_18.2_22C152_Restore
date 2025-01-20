@interface LNPropertyMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOptional;
- (LNPropertyMetadata)initWithCoder:(id)a3;
- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5;
- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6;
- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6 updateActionIdentifier:(id)a7;
- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6 updateActionIdentifier:(id)a7 optional:(BOOL)a8;
- (LNStaticDeferredLocalizedString)title;
- (LNValueType)valueType;
- (NSString)identifier;
- (NSString)updateActionIdentifier;
- (id)copyWithDescriptiveMetadataFromProperty:(id)a3 usingLibraryKey:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4;
- (unint64_t)capabilities;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNPropertyMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateActionIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6 updateActionIdentifier:(id)a7 optional:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  if (!v16)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"LNPropertyMetadata.m", 26, @"Invalid parameter not satisfying: %@", @"valueType" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)LNPropertyMetadata;
  v19 = [(LNPropertyMetadata *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    valueType = v19->_valueType;
    v19->_valueType = (LNValueType *)v22;

    objc_storeStrong((id *)&v19->_title, a5);
    v19->_capabilities = a6;
    objc_storeStrong((id *)&v19->_updateActionIdentifier, a7);
    v19->_optional = a8;
    v24 = v19;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  v4 = [(LNPropertyMetadata *)self identifier];
  [v8 encodeObject:v4 forKey:@"identifier"];

  v5 = [(LNPropertyMetadata *)self valueType];
  [v8 encodeObject:v5 forKey:@"valueType"];

  v6 = [(LNPropertyMetadata *)self title];
  [v8 encodeObject:v6 forKey:@"title"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[LNPropertyMetadata capabilities](self, "capabilities"), @"capabilities");
  v7 = [(LNPropertyMetadata *)self updateActionIdentifier];
  [v8 encodeObject:v7 forKey:@"updateActionIdentifier"];

  objc_msgSend(v8, "encodeBool:forKey:", -[LNPropertyMetadata isOptional](self, "isOptional"), @"isOptional");
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)updateActionIdentifier
{
  return self->_updateActionIdentifier;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (LNPropertyMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueType"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  if (v6)
  {
    uint64_t v8 = [v4 decodeIntegerForKey:@"capabilities"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateActionIdentifier"];
    self = -[LNPropertyMetadata initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:optional:](self, "initWithIdentifier:valueType:title:capabilities:updateActionIdentifier:optional:", v5, v6, v7, v8, v9, [v4 decodeBoolForKey:@"isOptional"]);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [LNStaticDeferredLocalizedString alloc];
  uint64_t v8 = NSString;
  v9 = [v6 key];

  v10 = [v8 stringWithFormat:@"[%@] %@", v5, v9];

  v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///System/Library/Frameworks/AppIntents.framework/"];
  v12 = [(LNStaticDeferredLocalizedString *)v7 initWithKey:v10 table:@"AssistantSchemas" bundleURL:v11];

  return v12;
}

- (id)copyWithDescriptiveMetadataFromProperty:(id)a3 usingLibraryKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[(LNPropertyMetadata *)self copy];
  v9 = [v7 title];

  uint64_t v10 = [(LNPropertyMetadata *)self schemaStringForStaticDeferredLocalizedString:v9 usingLibraryKey:v6];

  v11 = (void *)v8[4];
  v8[4] = v10;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNPropertyMetadata *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_39:

      goto LABEL_40;
    }
    id v7 = [(LNPropertyMetadata *)self valueType];
    uint64_t v8 = [(LNPropertyMetadata *)v6 valueType];
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
        goto LABEL_37;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_38:

        goto LABEL_39;
      }
    }
    id v16 = [(LNPropertyMetadata *)self identifier];
    id v17 = [(LNPropertyMetadata *)v6 identifier];
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
        goto LABEL_36;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    uint64_t v22 = [(LNPropertyMetadata *)self title];
    v23 = [(LNPropertyMetadata *)v6 title];
    id v20 = v22;
    id v24 = v23;
    v19 = v24;
    id v36 = v20;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_35;
      }
      LODWORD(v12) = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_36;
      }
    }
    v35 = v19;
    v26 = [(LNPropertyMetadata *)self updateActionIdentifier];
    objc_super v27 = [(LNPropertyMetadata *)v6 updateActionIdentifier];
    id v12 = v26;
    id v28 = v27;
    v29 = v28;
    if (v12 == v28)
    {
      id v34 = v28;
    }
    else
    {
      if (!v12 || !v28)
      {

        v25 = v29;
        id v20 = v12;
        LOBYTE(v12) = 0;
        v19 = v35;
        goto LABEL_35;
      }
      int v33 = [v12 isEqual:v28];
      id v34 = v29;

      if (!v33) {
        goto LABEL_32;
      }
    }
    unint64_t v30 = [(LNPropertyMetadata *)self capabilities];
    if (v30 == [(LNPropertyMetadata *)v6 capabilities])
    {
      BOOL v31 = [(LNPropertyMetadata *)self isOptional];
      id v20 = v12;
      LODWORD(v12) = v31 ^ [(LNPropertyMetadata *)v6 isOptional] ^ 1;
LABEL_33:
      v25 = v34;
      v19 = v35;
LABEL_35:

      id v20 = v36;
LABEL_36:

      goto LABEL_37;
    }
LABEL_32:
    id v20 = v12;
    LOBYTE(v12) = 0;
    goto LABEL_33;
  }
  LOBYTE(v12) = 1;
LABEL_40:

  return (char)v12;
}

- (unint64_t)hash
{
  v3 = [(LNPropertyMetadata *)self valueType];
  uint64_t v4 = [v3 hash];
  id v5 = [(LNPropertyMetadata *)self identifier];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(LNPropertyMetadata *)self title];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(LNPropertyMetadata *)self identifier];
  id v7 = [(LNPropertyMetadata *)self valueType];
  unint64_t v8 = [(LNPropertyMetadata *)self title];
  id v9 = self;
  id v10 = objc_opt_new();
  if ([(LNPropertyMetadata *)v9 capabilities])
  {
    v11 = NSString;
    id v12 = [(LNPropertyMetadata *)v9 updateActionIdentifier];
    v13 = [v11 stringWithFormat:@"U<%@>", v12];
    [v10 addObject:v13];
  }
  if (([(LNPropertyMetadata *)v9 capabilities] & 2) != 0) {
    [v10 addObject:@"Def"];
  }
  id v14 = [v10 componentsJoinedByString:@"|"];

  BOOL v15 = [(LNPropertyMetadata *)v9 isOptional];
  id v16 = @"NO";
  if (v15) {
    id v16 = @"YES";
  }
  id v17 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, valueType: %@, title: %@, capabilities: %@, isOptional: %@>", v5, v9, v6, v7, v8, v14, v16];

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [LNPropertyMetadata alloc];
  id v5 = [(LNPropertyMetadata *)self identifier];
  uint64_t v6 = [(LNPropertyMetadata *)self valueType];
  id v7 = [(LNPropertyMetadata *)self title];
  unint64_t v8 = [(LNPropertyMetadata *)self capabilities];
  id v9 = [(LNPropertyMetadata *)self updateActionIdentifier];
  id v10 = [(LNPropertyMetadata *)v4 initWithIdentifier:v5 valueType:v6 title:v7 capabilities:v8 updateActionIdentifier:v9 optional:[(LNPropertyMetadata *)self isOptional]];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6
{
  return [(LNPropertyMetadata *)self initWithIdentifier:a3 valueType:a4 title:a5 capabilities:a6 updateActionIdentifier:0];
}

- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5
{
  return [(LNPropertyMetadata *)self initWithIdentifier:a3 valueType:a4 title:a5 capabilities:0 updateActionIdentifier:0];
}

- (LNPropertyMetadata)initWithIdentifier:(id)a3 valueType:(id)a4 title:(id)a5 capabilities:(unint64_t)a6 updateActionIdentifier:(id)a7
{
  return [(LNPropertyMetadata *)self initWithIdentifier:a3 valueType:a4 title:a5 capabilities:a6 updateActionIdentifier:a7 optional:0];
}

@end