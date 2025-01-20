@interface LNActionParameterMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDynamicOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInput;
- (BOOL)isOptional;
- (LNActionParameterMetadata)actionParameterMetadataWithCapabilities:(unint64_t)a3;
- (LNActionParameterMetadata)actionParameterMetadataWithDescriptiveMetadataFromParameter:(id)a3 usingLibraryKey:(id)a4;
- (LNActionParameterMetadata)initWithCoder:(id)a3;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11 capabilities:(unint64_t)a12;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11 capabilities:(unint64_t)a12 queryIdentifier:(id)a13;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 isInput:(BOOL)a11;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 dynamicOptionsSupport:(int64_t)a9;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 dynamicOptionsSupport:(int64_t)a9 isInput:(BOOL)a10;
- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 hasDynamicOptions:(BOOL)a9;
- (LNStaticDeferredLocalizedString)parameterDescription;
- (LNStaticDeferredLocalizedString)title;
- (LNValueType)valueType;
- (NSArray)resolvableInputTypes;
- (NSDictionary)typeSpecificMetadata;
- (NSString)name;
- (NSString)queryIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4;
- (int64_t)dynamicOptionsSupport;
- (int64_t)inputConnectionBehavior;
- (unint64_t)capabilities;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNActionParameterMetadata

- (LNActionParameterMetadata)initWithCoder:(id)a3
{
  v29[9] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"valueType"];
  if (v6)
  {
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterDescription"];
    unsigned int v7 = [v4 decodeBoolForKey:@"optional"];
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v11 = [v4 decodeObjectOfClasses:v10 forKey:@"resolvableInputTypes"];

    if (v11)
    {
      unsigned int v26 = v7;
      v12 = LNValueTypeObjectClassesForCoding();
      v29[0] = objc_opt_class();
      v29[1] = objc_opt_class();
      v29[2] = objc_opt_class();
      v29[3] = objc_opt_class();
      v29[4] = objc_opt_class();
      v29[5] = objc_opt_class();
      v29[6] = objc_opt_class();
      v29[7] = objc_opt_class();
      v29[8] = objc_opt_class();
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:9];
      v14 = [v12 setByAddingObjectsFromArray:v13];
      v15 = [v4 decodeObjectOfClasses:v14 forKey:@"typeSpecificMetadata"];

      if (v15)
      {
        uint64_t v16 = [v4 decodeIntegerForKey:@"dynamicOptionsSupport"];
        uint64_t v17 = [v4 decodeIntegerForKey:@"inputConnectionBehavior"];
        uint64_t v18 = [v4 decodeIntegerForKey:@"capabilities"];
        v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"queryIdentifier"];
        uint64_t v25 = v18;
        uint64_t v24 = v16;
        v21 = (void *)v27;
        v20 = (void *)v28;
        self = [(LNActionParameterMetadata *)self initWithName:v5 valueType:v6 optional:v26 title:v28 description:v27 resolvableInputTypes:v11 typeSpecificMetadata:v15 dynamicOptionsSupport:v24 inputConnectionBehavior:v17 capabilities:v25 queryIdentifier:v19];

        v22 = self;
      }
      else
      {
        v22 = 0;
        v21 = (void *)v27;
        v20 = (void *)v28;
      }
    }
    else
    {
      v22 = 0;
      v21 = (void *)v27;
      v20 = (void *)v28;
    }
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11 capabilities:(unint64_t)a12 queryIdentifier:(id)a13
{
  id v45 = a3;
  id v19 = a4;
  id v20 = a6;
  id v44 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a13;
  if (v21)
  {
    if (v19) {
      goto LABEL_3;
    }
  }
  else
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"LNActionParameterMetadata.m", 33, @"Invalid parameter not satisfying: %@", @"resolvableInputTypes" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"LNActionParameterMetadata.m", 34, @"Invalid parameter not satisfying: %@", @"valueType" object file lineNumber description];

LABEL_3:
  v46.receiver = self;
  v46.super_class = (Class)LNActionParameterMetadata;
  uint64_t v24 = [(LNActionParameterMetadata *)&v46 init];
  if (v24)
  {
    uint64_t v25 = [v45 copy];
    name = v24->_name;
    v24->_name = (NSString *)v25;

    id v27 = v20;
    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v28 = v27;
      }
      else {
        uint64_t v28 = 0;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    v29 = v28;

    title = v24->_title;
    v24->_title = v29;

    objc_storeStrong((id *)&v24->_parameterDescription, a7);
    uint64_t v31 = [v19 copy];
    valueType = v24->_valueType;
    v24->_valueType = (LNValueType *)v31;

    v24->_optional = a5;
    uint64_t v33 = [v21 copy];
    resolvableInputTypes = v24->_resolvableInputTypes;
    v24->_resolvableInputTypes = (NSArray *)v33;

    uint64_t v35 = [v22 copy];
    typeSpecificMetadata = v24->_typeSpecificMetadata;
    v24->_typeSpecificMetadata = (NSDictionary *)v35;

    v24->_dynamicOptionsSupport = a10;
    v24->_inputConnectionBehavior = a11;
    v24->_capabilities = a12;
    uint64_t v37 = [v23 copy];
    queryIdentifier = v24->_queryIdentifier;
    v24->_queryIdentifier = (NSString *)v37;

    v39 = v24;
  }

  return v24;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNActionParameterMetadata *)self name];
  [v4 encodeObject:v5 forKey:@"name"];

  v6 = [(LNActionParameterMetadata *)self valueType];
  [v4 encodeObject:v6 forKey:@"valueType"];

  unsigned int v7 = [(LNActionParameterMetadata *)self title];
  [v4 encodeObject:v7 forKey:@"title"];

  v8 = [(LNActionParameterMetadata *)self parameterDescription];
  [v4 encodeObject:v8 forKey:@"parameterDescription"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNActionParameterMetadata isOptional](self, "isOptional"), @"optional");
  uint64_t v9 = [(LNActionParameterMetadata *)self resolvableInputTypes];
  [v4 encodeObject:v9 forKey:@"resolvableInputTypes"];

  v10 = [(LNActionParameterMetadata *)self typeSpecificMetadata];
  [v4 encodeObject:v10 forKey:@"typeSpecificMetadata"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionParameterMetadata dynamicOptionsSupport](self, "dynamicOptionsSupport"), @"dynamicOptionsSupport");
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionParameterMetadata inputConnectionBehavior](self, "inputConnectionBehavior"), @"inputConnectionBehavior");
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNActionParameterMetadata capabilities](self, "capabilities"), @"capabilities");
  id v11 = [(LNActionParameterMetadata *)self queryIdentifier];
  [v4 encodeObject:v11 forKey:@"queryIdentifier"];
}

- (NSDictionary)typeSpecificMetadata
{
  return self->_typeSpecificMetadata;
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)dynamicOptionsSupport
{
  return self->_dynamicOptionsSupport;
}

- (LNStaticDeferredLocalizedString)title
{
  return self->_title;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (LNStaticDeferredLocalizedString)parameterDescription
{
  return self->_parameterDescription;
}

- (int64_t)inputConnectionBehavior
{
  return self->_inputConnectionBehavior;
}

- (NSArray)resolvableInputTypes
{
  return self->_resolvableInputTypes;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_typeSpecificMetadata, 0);
  objc_storeStrong((id *)&self->_resolvableInputTypes, 0);
  objc_storeStrong((id *)&self->_parameterDescription, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned int v7 = [LNStaticDeferredLocalizedString alloc];
  v8 = NSString;
  uint64_t v9 = [v6 key];

  v10 = [v8 stringWithFormat:@"[%@] %@", v5, v9];

  id v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///System/Library/Frameworks/AppIntents.framework/"];
  v12 = [(LNStaticDeferredLocalizedString *)v7 initWithKey:v10 table:@"AssistantSchemas" bundleURL:v11];

  return v12;
}

- (LNActionParameterMetadata)actionParameterMetadataWithDescriptiveMetadataFromParameter:(id)a3 usingLibraryKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[(LNActionParameterMetadata *)self copy];
  uint64_t v9 = [v6 title];
  uint64_t v10 = [(LNActionParameterMetadata *)self schemaStringForStaticDeferredLocalizedString:v9 usingLibraryKey:v7];
  id v11 = (void *)v8[4];
  v8[4] = v10;

  v12 = [v6 parameterDescription];
  uint64_t v13 = [(LNActionParameterMetadata *)self schemaStringForStaticDeferredLocalizedString:v12 usingLibraryKey:v7];
  v14 = (void *)v8[5];
  v8[5] = v13;

  v15 = [(LNActionParameterMetadata *)self typeSpecificMetadata];
  uint64_t v16 = (void *)[v15 mutableCopy];

  uint64_t v17 = [v6 typeSpecificMetadata];
  uint64_t v18 = [v17 objectForKey:@"LNValueTypeMetadataKeyBoolTrueDisplayName"];

  if (v18)
  {
    id v19 = [v18 key];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      id v21 = [(LNActionParameterMetadata *)self schemaStringForStaticDeferredLocalizedString:v18 usingLibraryKey:v7];
      [v16 setObject:v21 forKey:@"LNValueTypeMetadataKeyBoolTrueDisplayName"];
    }
  }
  id v22 = [v6 typeSpecificMetadata];
  id v23 = [v22 objectForKey:@"LNValueTypeMetadataKeyBoolFalseDisplayName"];

  if (v23)
  {
    uint64_t v24 = [v23 key];
    uint64_t v25 = [v24 length];

    if (v25)
    {
      unsigned int v26 = [(LNActionParameterMetadata *)self schemaStringForStaticDeferredLocalizedString:v23 usingLibraryKey:v7];
      [v16 setObject:v26 forKey:@"LNValueTypeMetadataKeyBoolFalseDisplayName"];
    }
  }
  uint64_t v27 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v16];
  uint64_t v28 = (void *)v8[7];
  v8[7] = v27;

  return (LNActionParameterMetadata *)v8;
}

- (LNActionParameterMetadata)actionParameterMetadataWithCapabilities:(unint64_t)a3
{
  id v4 = (void *)[(LNActionParameterMetadata *)self copy];
  v4[10] = a3;
  return (LNActionParameterMetadata *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNActionParameterMetadata *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_49:

      goto LABEL_50;
    }
    id v7 = [(LNActionParameterMetadata *)self name];
    v8 = [(LNActionParameterMetadata *)v6 name];
    id v9 = v7;
    id v10 = v8;
    id v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_47;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_48:

        goto LABEL_49;
      }
    }
    uint64_t v16 = [(LNActionParameterMetadata *)self title];
    uint64_t v17 = [(LNActionParameterMetadata *)v6 title];
    id v14 = v16;
    id v18 = v17;
    uint64_t v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_46;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    id v22 = [(LNActionParameterMetadata *)self valueType];
    id v23 = [(LNActionParameterMetadata *)v6 valueType];
    id v20 = v22;
    id v24 = v23;
    id v19 = v24;
    if (v20 == v24)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v46 = v20;
      uint64_t v25 = v24;
      if (!v20 || !v24) {
        goto LABEL_45;
      }
      int v12 = [v20 isEqual:v24];

      if (!v12) {
        goto LABEL_46;
      }
    }
    BOOL v26 = [(LNActionParameterMetadata *)self isOptional];
    if (v26 != [(LNActionParameterMetadata *)v6 isOptional])
    {
      LOBYTE(v12) = 0;
LABEL_46:

      goto LABEL_47;
    }
    id v46 = v20;
    uint64_t v27 = [(LNActionParameterMetadata *)self typeSpecificMetadata];
    id v44 = [(LNActionParameterMetadata *)v6 typeSpecificMetadata];
    id v20 = v27;
    id v28 = v44;
    id v45 = v28;
    if (v20 == v28)
    {

      id v43 = v20;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v20)
      {
        v29 = v28;
        id v30 = 0;
        goto LABEL_43;
      }
      v29 = v28;
      id v30 = v20;
      if (!v28)
      {
LABEL_43:
        v40 = v30;

        goto LABEL_44;
      }
      uint64_t v31 = v28;
      int v42 = [v20 isEqualToDictionary:v28];

      id v43 = v20;
      if (!v42)
      {
LABEL_39:
        LOBYTE(v12) = 0;
        id v20 = v43;
LABEL_44:
        uint64_t v25 = v45;
LABEL_45:

        id v20 = v46;
        goto LABEL_46;
      }
    }
    int64_t v32 = [(LNActionParameterMetadata *)self dynamicOptionsSupport];
    if (v32 != [(LNActionParameterMetadata *)v6 dynamicOptionsSupport]) {
      goto LABEL_39;
    }
    int64_t v33 = [(LNActionParameterMetadata *)self inputConnectionBehavior];
    if (v33 != [(LNActionParameterMetadata *)v6 inputConnectionBehavior]) {
      goto LABEL_39;
    }
    unint64_t v34 = [(LNActionParameterMetadata *)self capabilities];
    if (v34 != [(LNActionParameterMetadata *)v6 capabilities]) {
      goto LABEL_39;
    }
    uint64_t v35 = [(LNActionParameterMetadata *)self queryIdentifier];
    v36 = [(LNActionParameterMetadata *)v6 queryIdentifier];
    id v37 = v35;
    id v38 = v36;
    v39 = v38;
    if (v37 == v38)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v37 && v38) {
        LOBYTE(v12) = [v37 isEqualToString:v38];
      }
    }

    v29 = v39;
    id v20 = v43;
    id v30 = v37;
    goto LABEL_43;
  }
  LOBYTE(v12) = 1;
LABEL_50:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(LNActionParameterMetadata *)self isOptional];
  id v4 = [(LNActionParameterMetadata *)self valueType];
  uint64_t v5 = [v4 hash];
  id v6 = [(LNActionParameterMetadata *)self name];
  uint64_t v7 = v5 ^ [v6 hash] ^ v3;
  v8 = [(LNActionParameterMetadata *)self title];
  uint64_t v9 = [v8 hash];
  id v10 = [(LNActionParameterMetadata *)self typeSpecificMetadata];
  uint64_t v11 = v9 ^ [v10 hash];
  int64_t v12 = v7 ^ v11 ^ [(LNActionParameterMetadata *)self dynamicOptionsSupport];
  int64_t v13 = [(LNActionParameterMetadata *)self inputConnectionBehavior];
  unint64_t v14 = v13 ^ [(LNActionParameterMetadata *)self capabilities];
  int v15 = [(LNActionParameterMetadata *)self queryIdentifier];
  unint64_t v16 = v12 ^ v14 ^ [v15 hash];

  return v16;
}

- (id)description
{
  uint64_t v25 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v27 = NSStringFromClass(v3);
  BOOL v26 = [(LNActionParameterMetadata *)self name];
  id v4 = [(LNActionParameterMetadata *)self valueType];
  uint64_t v5 = [(LNActionParameterMetadata *)self title];
  id v24 = [(LNActionParameterMetadata *)self resolvableInputTypes];
  id v23 = [v24 valueForKeyPath:@"description"];
  id v6 = [v23 componentsJoinedByString:@", "];
  BOOL v7 = [(LNActionParameterMetadata *)self isOptional];
  v8 = [(LNActionParameterMetadata *)self typeSpecificMetadata];
  int64_t v22 = [(LNActionParameterMetadata *)self dynamicOptionsSupport];
  int64_t v9 = [(LNActionParameterMetadata *)self inputConnectionBehavior];
  id v10 = @"Default";
  if (v9 == 1) {
    id v10 = @"Never";
  }
  if (v9 == 2) {
    id v10 = @"ConnectToPreviousIntentResult";
  }
  uint64_t v11 = v10;
  unint64_t v12 = [(LNActionParameterMetadata *)self capabilities];
  id v13 = [(LNActionParameterMetadata *)self queryIdentifier];
  if (v12)
  {
    BOOL v21 = v7;
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v15 = v14;
    if (v12)
    {
      [v14 addObject:@"HasStaticDefault"];
      if ((v12 & 2) == 0)
      {
LABEL_8:
        if ((v12 & 4) == 0) {
          goto LABEL_9;
        }
        goto LABEL_21;
      }
    }
    else if ((v12 & 2) == 0)
    {
      goto LABEL_8;
    }
    [v15 addObject:@"HasDynamicDefault"];
    if ((v12 & 4) == 0)
    {
LABEL_9:
      if ((v12 & 8) == 0)
      {
LABEL_11:
        unint64_t v16 = [v15 componentsJoinedByString:@", "];

        BOOL v7 = v21;
        goto LABEL_13;
      }
LABEL_10:
      [v15 addObject:@"HasOptionsProvider"];
      goto LABEL_11;
    }
LABEL_21:
    id v20 = (void *)[[NSString alloc] initWithFormat:@"HasQuery(%@)", v13];
    [v15 addObject:v20];

    if ((v12 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  unint64_t v16 = @"N/A";
LABEL_13:
  if (v7) {
    uint64_t v17 = @"YES";
  }
  else {
    uint64_t v17 = @"NO";
  }

  id v18 = [v25 stringWithFormat:@"<%@: %p, name: %@, valueType: %@, title: %@, resolvableInputTypes: [%@], isOptional: %@, typeSpecificMetadata: %@, dynamicOptionsSupport: %ld, inputConnectionBehavior: %@, capabilities: %@>", v27, self, v26, v4, v5, v6, v17, v8, v22, v11, v16];

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v17 = [LNActionParameterMetadata alloc];
  unint64_t v16 = [(LNActionParameterMetadata *)self name];
  id v4 = [(LNActionParameterMetadata *)self valueType];
  BOOL v5 = [(LNActionParameterMetadata *)self isOptional];
  id v6 = [(LNActionParameterMetadata *)self title];
  BOOL v7 = [(LNActionParameterMetadata *)self parameterDescription];
  v8 = [(LNActionParameterMetadata *)self resolvableInputTypes];
  int64_t v9 = [(LNActionParameterMetadata *)self typeSpecificMetadata];
  int64_t v10 = [(LNActionParameterMetadata *)self dynamicOptionsSupport];
  int64_t v11 = [(LNActionParameterMetadata *)self inputConnectionBehavior];
  unint64_t v12 = [(LNActionParameterMetadata *)self capabilities];
  id v13 = [(LNActionParameterMetadata *)self queryIdentifier];
  id v14 = [(LNActionParameterMetadata *)v17 initWithName:v16 valueType:v4 optional:v5 title:v6 description:v7 resolvableInputTypes:v8 typeSpecificMetadata:v9 dynamicOptionsSupport:v10 inputConnectionBehavior:v11 capabilities:v12 queryIdentifier:v13];

  return v14;
}

- (BOOL)isInput
{
  return [(LNActionParameterMetadata *)self inputConnectionBehavior] == 2;
}

- (BOOL)hasDynamicOptions
{
  return [(LNActionParameterMetadata *)self dynamicOptionsSupport] != 0;
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 dynamicOptionsSupport:(int64_t)a9
{
  LOBYTE(v10) = 0;
  return [(LNActionParameterMetadata *)self initWithName:a3 valueType:a4 optional:a5 title:a6 resolvableInputTypes:a7 typeSpecificMetadata:a8 dynamicOptionsSupport:a9 isInput:v10];
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 hasDynamicOptions:(BOOL)a9
{
  LOBYTE(v10) = 0;
  return [(LNActionParameterMetadata *)self initWithName:a3 valueType:a4 optional:a5 title:a6 resolvableInputTypes:a7 typeSpecificMetadata:a8 dynamicOptionsSupport:a9 isInput:v10];
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8
{
  LOBYTE(v9) = 0;
  return [(LNActionParameterMetadata *)self initWithName:a3 valueType:a4 optional:a5 title:a6 description:0 resolvableInputTypes:a7 typeSpecificMetadata:a8 dynamicOptionsSupport:0 isInput:v9];
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 resolvableInputTypes:(id)a7 typeSpecificMetadata:(id)a8 dynamicOptionsSupport:(int64_t)a9 isInput:(BOOL)a10
{
  LOBYTE(v11) = a10;
  return [(LNActionParameterMetadata *)self initWithName:a3 valueType:a4 optional:a5 title:a6 description:0 resolvableInputTypes:a7 typeSpecificMetadata:a8 dynamicOptionsSupport:a9 isInput:v11];
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9
{
  LOBYTE(v10) = 0;
  return [(LNActionParameterMetadata *)self initWithName:a3 valueType:a4 optional:a5 title:a6 description:a7 resolvableInputTypes:a8 typeSpecificMetadata:a9 dynamicOptionsSupport:0 isInput:v10];
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 isInput:(BOOL)a11
{
  uint64_t v11 = 2;
  if (!a11) {
    uint64_t v11 = 0;
  }
  return [(LNActionParameterMetadata *)self initWithName:a3 valueType:a4 optional:a5 title:a6 description:a7 resolvableInputTypes:a8 typeSpecificMetadata:a9 dynamicOptionsSupport:a10 inputConnectionBehavior:v11];
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11
{
  return [(LNActionParameterMetadata *)self initWithName:a3 valueType:a4 optional:a5 title:a6 description:a7 resolvableInputTypes:a8 typeSpecificMetadata:a9 dynamicOptionsSupport:a10 inputConnectionBehavior:a11 capabilities:0];
}

- (LNActionParameterMetadata)initWithName:(id)a3 valueType:(id)a4 optional:(BOOL)a5 title:(id)a6 description:(id)a7 resolvableInputTypes:(id)a8 typeSpecificMetadata:(id)a9 dynamicOptionsSupport:(int64_t)a10 inputConnectionBehavior:(int64_t)a11 capabilities:(unint64_t)a12
{
  return [(LNActionParameterMetadata *)self initWithName:a3 valueType:a4 optional:a5 title:a6 description:a7 resolvableInputTypes:a8 typeSpecificMetadata:a9 dynamicOptionsSupport:a10 inputConnectionBehavior:a11 capabilities:0 queryIdentifier:0];
}

@end