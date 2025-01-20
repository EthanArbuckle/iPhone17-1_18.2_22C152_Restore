@interface LNEnumMetadata
+ (BOOL)ln_enumIdentifierIsSystem:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)visibleForUse:(int64_t)a3;
- (LNEnumMetadata)initWithCoder:(id)a3;
- (LNEnumMetadata)initWithIdentifier:(id)a3 cases:(id)a4;
- (LNEnumMetadata)initWithIdentifier:(id)a3 displayTypeName:(id)a4 cases:(id)a5;
- (LNEnumMetadata)initWithIdentifier:(id)a3 displayTypeName:(id)a4 cases:(id)a5 customIntentEnumTypeName:(id)a6;
- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9;
- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10;
- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11;
- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12;
- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12 assistantDefinedSchemas:(id)a13;
- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12 assistantDefinedSchemas:(id)a13 visibilityMetadata:(id)a14;
- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayTypeName:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9;
- (LNStaticDeferredLocalizedString)displayTypeName;
- (LNTypeDisplayRepresentation)displayRepresentation;
- (LNVisibilityMetadata)visibilityMetadata;
- (NSArray)assistantDefinedSchemas;
- (NSArray)cases;
- (NSDictionary)availabilityAnnotations;
- (NSDictionary)mangledTypeNameByBundleIdentifier;
- (NSNumber)isSystem;
- (NSOrderedSet)effectiveBundleIdentifiers;
- (NSString)customIntentEnumTypeName;
- (NSString)description;
- (NSString)fullyQualifiedTypeName;
- (NSString)identifier;
- (NSString)mangledTypeName;
- (id)copyWithDescriptiveMetadataFromEnum:(id)a3 usingLibraryKey:(id)a4;
- (id)mangledTypeNameForBundleIdentifier:(id)a3;
- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4;
- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEnumMetadata

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12 assistantDefinedSchemas:(id)a13 visibilityMetadata:(id)a14
{
  id v19 = a3;
  id v67 = a4;
  id v20 = a5;
  id v21 = a6;
  id obj = a7;
  id v22 = a7;
  id v63 = a8;
  id v69 = a8;
  id v23 = a9;
  id v24 = a10;
  id v68 = a11;
  id v66 = a12;
  id v25 = a13;
  id v26 = a14;
  v70 = v19;
  if (!v19)
  {
    id v52 = v26;
    v53 = [MEMORY[0x1E4F28B00] currentHandler];
    [v53 handleFailureInMethod:a2, self, @"LNEnumMetadata.m", 110, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    id v26 = v52;
  }
  v65 = v22;
  if (!v22)
  {
    id v54 = v26;
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, self, @"LNEnumMetadata.m", 111, @"Invalid parameter not satisfying: %@", @"displayRepresentation" object file lineNumber description];

    id v26 = v54;
  }
  v27 = v20;
  v28 = v21;
  if (!v67)
  {
    id v56 = v26;
    v57 = [MEMORY[0x1E4F28B00] currentHandler];
    [v57 handleFailureInMethod:a2, self, @"LNEnumMetadata.m", 112, @"Invalid parameter not satisfying: %@", @"mangledTypeName" object file lineNumber description];

    id v26 = v56;
  }
  v29 = v23;
  if (!v69)
  {
    id v58 = v26;
    v59 = [MEMORY[0x1E4F28B00] currentHandler];
    [v59 handleFailureInMethod:a2, self, @"LNEnumMetadata.m", 113, @"Invalid parameter not satisfying: %@", @"cases" object file lineNumber description];

    id v26 = v58;
  }
  v30 = v26;
  if (!v26)
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2, self, @"LNEnumMetadata.m", 114, @"Invalid parameter not satisfying: %@", @"visibilityMetadata" object file lineNumber description];
  }
  v71.receiver = self;
  v71.super_class = (Class)LNEnumMetadata;
  v31 = [(LNEnumMetadata *)&v71 init];
  if (v31)
  {
    uint64_t v32 = [v70 copy];
    identifier = v31->_identifier;
    v31->_identifier = (NSString *)v32;

    objc_storeStrong((id *)&v31->_displayRepresentation, obj);
    objc_storeStrong((id *)&v31->_cases, v63);
    uint64_t v34 = [v29 copy];
    customIntentEnumTypeName = v31->_customIntentEnumTypeName;
    v31->_customIntentEnumTypeName = (NSString *)v34;

    uint64_t v36 = [v67 copy];
    mangledTypeName = v31->_mangledTypeName;
    v31->_mangledTypeName = (NSString *)v36;

    uint64_t v38 = [v27 copy];
    mangledTypeNameByBundleIdentifier = v31->_mangledTypeNameByBundleIdentifier;
    v31->_mangledTypeNameByBundleIdentifier = (NSDictionary *)v38;

    uint64_t v40 = [v28 copy];
    effectiveBundleIdentifiers = v31->_effectiveBundleIdentifiers;
    v31->_effectiveBundleIdentifiers = (NSOrderedSet *)v40;

    uint64_t v42 = [v24 copy];
    availabilityAnnotations = v31->_availabilityAnnotations;
    v31->_availabilityAnnotations = (NSDictionary *)v42;

    objc_storeStrong((id *)&v31->_system, a11);
    uint64_t v44 = [v66 copy];
    fullyQualifiedTypeName = v31->_fullyQualifiedTypeName;
    v31->_fullyQualifiedTypeName = (NSString *)v44;

    uint64_t v46 = [v25 copy];
    assistantDefinedSchemas = v31->_assistantDefinedSchemas;
    v31->_assistantDefinedSchemas = (NSArray *)v46;

    uint64_t v48 = [v30 copy];
    visibilityMetadata = v31->_visibilityMetadata;
    v31->_visibilityMetadata = (LNVisibilityMetadata *)v48;

    v50 = v31;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMetadata, 0);
  objc_storeStrong((id *)&self->_assistantDefinedSchemas, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedTypeName, 0);
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_mangledTypeNameByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_customIntentEnumTypeName, 0);
  objc_storeStrong((id *)&self->_cases, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_system, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNEnumMetadata *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(LNEnumMetadata *)self displayRepresentation];
  [v4 encodeObject:v6 forKey:@"displayRepresentation"];

  v7 = [(LNEnumMetadata *)self cases];
  [v4 encodeObject:v7 forKey:@"cases"];

  v8 = [(LNEnumMetadata *)self customIntentEnumTypeName];
  [v4 encodeObject:v8 forKey:@"customIntentEnumTypeName"];

  v9 = [(LNEnumMetadata *)self mangledTypeName];
  [v4 encodeObject:v9 forKey:@"mangledTypeName"];

  v10 = [(LNEnumMetadata *)self mangledTypeNameByBundleIdentifier];
  [v4 encodeObject:v10 forKey:@"mangledTypeNameByBundleIdentifier"];

  v11 = [(LNEnumMetadata *)self effectiveBundleIdentifiers];
  [v4 encodeObject:v11 forKey:@"effectiveBundleIdentifiers"];

  v12 = [(LNEnumMetadata *)self availabilityAnnotations];
  [v4 encodeObject:v12 forKey:@"availabilityAnnotations"];

  v13 = [(LNEnumMetadata *)self isSystem];
  [v4 encodeObject:v13 forKey:@"system"];

  v14 = [(LNEnumMetadata *)self fullyQualifiedTypeName];
  [v4 encodeObject:v14 forKey:@"fullyQualifiedTypeName"];

  v15 = [(LNEnumMetadata *)self assistantDefinedSchemas];
  [v4 encodeObject:v15 forKey:@"assistantDefinedSchemas"];

  id v16 = [(LNEnumMetadata *)self visibilityMetadata];
  [v4 encodeObject:v16 forKey:@"visibilityMetadata"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)cases
{
  return self->_cases;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (id)mangledTypeNameForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LNEnumMetadata.m", 89, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v6 = [(LNEnumMetadata *)self mangledTypeNameByBundleIdentifier];
  v7 = [v6 objectForKeyedSubscript:v5];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(LNEnumMetadata *)self mangledTypeName];
  }
  v10 = v9;

  return v10;
}

- (NSDictionary)mangledTypeNameByBundleIdentifier
{
  return self->_mangledTypeNameByBundleIdentifier;
}

- (LNVisibilityMetadata)visibilityMetadata
{
  return self->_visibilityMetadata;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (NSNumber)isSystem
{
  system = self->_system;
  if (system)
  {
    v3 = system;
  }
  else
  {
    id v4 = NSNumber;
    id v5 = [(LNEnumMetadata *)self identifier];
    objc_msgSend(v4, "numberWithBool:", +[LNEnumMetadata ln_enumIdentifierIsSystem:](LNEnumMetadata, "ln_enumIdentifierIsSystem:", v5));
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (NSString)fullyQualifiedTypeName
{
  return self->_fullyQualifiedTypeName;
}

- (NSOrderedSet)effectiveBundleIdentifiers
{
  return self->_effectiveBundleIdentifiers;
}

- (LNTypeDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (NSString)customIntentEnumTypeName
{
  return self->_customIntentEnumTypeName;
}

- (NSArray)assistantDefinedSchemas
{
  return self->_assistantDefinedSchemas;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNEnumMetadata)initWithCoder:(id)a3
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayRepresentation"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v48[0] = objc_opt_class();
  v48[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:2];
  id v9 = [v7 setWithArray:v8];
  uint64_t v47 = [v4 decodeObjectOfClasses:v9 forKey:@"cases"];

  uint64_t v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mangledTypeName"];
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  uint64_t v45 = [v4 decodeObjectOfClasses:v12 forKey:@"effectiveBundleIdentifiers"];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  id v16 = [v4 decodeObjectOfClasses:v15 forKey:@"mangledTypeNameByBundleIdentifier"];

  v17 = 0;
  uint64_t v44 = (void *)v5;
  if (v5 && v6)
  {
    id v19 = (void *)v46;
    v18 = (void *)v47;
    id v20 = (void *)v45;
    if (v47 && v46 && v16 && v45)
    {
      v43 = self;
      uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customIntentEnumTypeName"];
      id v22 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v23 = objc_opt_class();
      uint64_t v24 = objc_opt_class();
      id v25 = objc_msgSend(v22, "setWithObjects:", v23, v24, objc_opt_class(), 0);
      uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"availabilityAnnotations"];

      v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"system"];
      uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullyQualifiedTypeName"];
      v29 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v30 = objc_opt_class();
      v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
      uint64_t v32 = [v4 decodeObjectOfClasses:v31 forKey:@"assistantDefinedSchemas"];

      v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visibilityMetadata"];
      if (!v33) {
        v33 = [[LNVisibilityMetadata alloc] initWithIsDiscoverable:1 assistantOnly:0];
      }
      uint64_t v40 = v28;
      uint64_t v38 = v21;
      uint64_t v39 = v26;
      v41 = (void *)v21;
      uint64_t v42 = (void *)v26;
      uint64_t v34 = v44;
      v35 = (void *)v28;
      id v19 = (void *)v46;
      uint64_t v36 = [(LNEnumMetadata *)v43 initWithIdentifier:v44 mangledTypeName:v46 mangledTypeNameByBundleIdentifier:v16 effectiveBundleIdentifiers:v45 displayRepresentation:v6 cases:v47 customIntentEnumTypeName:v38 availabilityAnnotations:v39 system:v27 fullyQualifiedTypeName:v40 assistantDefinedSchemas:v32 visibilityMetadata:v33];

      v18 = (void *)v47;
      self = v36;
      id v20 = (void *)v45;

      v17 = self;
    }
    else
    {
      uint64_t v34 = v44;
    }
  }
  else
  {
    uint64_t v34 = (void *)v5;
    id v20 = (void *)v45;
    id v19 = (void *)v46;
    v18 = (void *)v47;
  }

  return v17;
}

+ (BOOL)ln_enumIdentifierIsSystem:(id)a3
{
  uint64_t v3 = sub_19CBBF530();
  char v5 = static LNEnumMetadata.enumIdentifierIsSystem(enumIdentifier:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[(LNEnumMetadata *)self copy];
  id v9 = [v8 effectiveBundleIdentifiers];
  v10 = [v7 array];

  uint64_t v11 = objc_msgSend(v9, "if_orderedSetByAddingObjectsFromArray:", v10);
  v12 = (void *)v8[8];
  v8[8] = v11;

  v13 = [v8 mangledTypeNameByBundleIdentifier];
  uint64_t v14 = objc_msgSend(v13, "if_dictionaryByAddingEntriesFromDictionary:", v6);

  v15 = (void *)v8[7];
  v8[7] = v14;

  return v8;
}

- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [LNStaticDeferredLocalizedString alloc];
  v8 = NSString;
  id v9 = [v6 key];

  v10 = [v8 stringWithFormat:@"[%@] %@", v5, v9];

  uint64_t v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///System/Library/Frameworks/AppIntents.framework/"];
  v12 = [(LNStaticDeferredLocalizedString *)v7 initWithKey:v10 table:@"AssistantSchemas" bundleURL:v11];

  return v12;
}

- (id)copyWithDescriptiveMetadataFromEnum:(id)a3 usingLibraryKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[(LNEnumMetadata *)self copy];
  id v9 = [LNTypeDisplayRepresentation alloc];
  v10 = [v7 displayRepresentation];

  uint64_t v11 = [v10 name];
  v12 = [(LNEnumMetadata *)self schemaStringForStaticDeferredLocalizedString:v11 usingLibraryKey:v6];

  v13 = [(LNEnumMetadata *)self displayRepresentation];
  uint64_t v14 = [v13 numericFormat];
  v15 = [(LNEnumMetadata *)self displayRepresentation];
  id v16 = [v15 synonyms];
  uint64_t v17 = [(LNTypeDisplayRepresentation *)v9 initWithName:v12 numericFormat:v14 synonyms:v16];
  v18 = (void *)v8[3];
  v8[3] = v17;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (LNEnumMetadata *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_63:

      goto LABEL_64;
    }
    id v7 = [(LNEnumMetadata *)self identifier];
    v8 = [(LNEnumMetadata *)v6 identifier];
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
        goto LABEL_61;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_62:

        goto LABEL_63;
      }
    }
    id v16 = [(LNEnumMetadata *)self displayRepresentation];
    uint64_t v17 = [(LNEnumMetadata *)v6 displayRepresentation];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      id v19 = v18;
      id v20 = v14;
      if (!v14 || !v18) {
        goto LABEL_60;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
LABEL_27:
        LOBYTE(v12) = 0;
LABEL_61:

        goto LABEL_62;
      }
    }
    id v22 = [(LNEnumMetadata *)self cases];
    uint64_t v23 = [(LNEnumMetadata *)v6 cases];

    if (v22 != v23)
    {
      uint64_t v24 = [(LNEnumMetadata *)self cases];
      if (!v24) {
        goto LABEL_27;
      }
      id v25 = (void *)v24;
      uint64_t v26 = [(LNEnumMetadata *)v6 cases];

      if (!v26) {
        goto LABEL_27;
      }
      v27 = (void *)MEMORY[0x1E4F1CAD0];
      v72 = [(LNEnumMetadata *)self cases];
      uint64_t v28 = [v27 setWithArray:v72];
      v29 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v30 = [(LNEnumMetadata *)v6 cases];
      v31 = [v29 setWithArray:v30];
      int v70 = [v28 isEqualToSet:v31];

      if (!v70) {
        goto LABEL_27;
      }
    }
    uint64_t v32 = [(LNEnumMetadata *)self customIntentEnumTypeName];
    v33 = [(LNEnumMetadata *)v6 customIntentEnumTypeName];
    id v20 = v32;
    id v34 = v33;
    id v19 = v34;
    id v73 = v20;
    if (v20 == v34)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v35 = v34;
      if (!v20 || !v34) {
        goto LABEL_59;
      }
      LODWORD(v12) = [v20 isEqualToString:v34];

      if (!v12) {
        goto LABEL_60;
      }
    }
    objc_super v71 = v19;
    uint64_t v36 = [(LNEnumMetadata *)self availabilityAnnotations];
    v37 = [(LNEnumMetadata *)v6 availabilityAnnotations];
    id v38 = v36;
    id v39 = v37;
    id v68 = v39;
    id v69 = v38;
    if (v38 != v39)
    {
      LOBYTE(v12) = 0;
      if (v38)
      {
        uint64_t v40 = v39;
        id v19 = v71;
        if (v39)
        {
          int v41 = [v38 isEqualToDictionary:v39];

          if (!v41)
          {
            LOBYTE(v12) = 0;
            id v19 = v71;
LABEL_58:
            v35 = v68;
            id v20 = v69;
LABEL_59:

            id v20 = v73;
LABEL_60:

            goto LABEL_61;
          }
LABEL_35:
          uint64_t v42 = [(LNEnumMetadata *)self fullyQualifiedTypeName];
          v43 = [(LNEnumMetadata *)v6 fullyQualifiedTypeName];
          id v38 = v42;
          id v44 = v43;
          id v45 = v44;
          if (v38 != v44)
          {
            LOBYTE(v12) = 0;
            id v67 = v38;
            uint64_t v46 = v44;
            if (v38)
            {
              id v19 = v71;
              if (v44)
              {
                uint64_t v47 = v44;
                int v48 = [v38 isEqualToString:v44];
                id v66 = v47;

                if (!v48) {
                  goto LABEL_50;
                }
LABEL_41:
                v49 = [(LNEnumMetadata *)self assistantDefinedSchemas];
                v50 = [(LNEnumMetadata *)v6 assistantDefinedSchemas];

                if (v49 != v50)
                {
                  v12 = [(LNEnumMetadata *)self assistantDefinedSchemas];
                  if (!v12)
                  {
LABEL_51:
                    id v19 = v71;
                    uint64_t v40 = v66;
                    goto LABEL_57;
                  }
                  v51 = [(LNEnumMetadata *)v6 assistantDefinedSchemas];

                  if (!v51) {
                    goto LABEL_50;
                  }
                  id v52 = (void *)MEMORY[0x1E4F1CAD0];
                  v64 = [(LNEnumMetadata *)self assistantDefinedSchemas];
                  v53 = [v52 setWithArray:v64];
                  id v54 = (void *)MEMORY[0x1E4F1CAD0];
                  v62 = [(LNEnumMetadata *)v6 assistantDefinedSchemas];
                  v55 = [v54 setWithArray:v62];
                  int v63 = [v53 isEqualToSet:v55];

                  if (!v63)
                  {
LABEL_50:
                    LOBYTE(v12) = 0;
                    goto LABEL_51;
                  }
                }
                id v56 = [(LNEnumMetadata *)self visibilityMetadata];
                v57 = [(LNEnumMetadata *)v6 visibilityMetadata];
                id v58 = v56;
                id v59 = v57;
                v65 = v59;
                id v67 = v38;
                if (v58 == v59)
                {
                  LOBYTE(v12) = 1;
                }
                else
                {
                  LOBYTE(v12) = 0;
                  if (v58)
                  {
                    id v19 = v71;
                    if (v59) {
                      LOBYTE(v12) = [v58 isEqual:v59];
                    }
                    goto LABEL_55;
                  }
                }
                id v19 = v71;
LABEL_55:

                uint64_t v46 = v65;
                id v45 = v66;
                id v38 = v58;
              }
            }
            else
            {
              id v19 = v71;
            }
            v60 = v45;

            uint64_t v40 = v60;
            id v38 = v67;
            goto LABEL_57;
          }
          id v66 = v44;

          goto LABEL_41;
        }
      }
      else
      {
        uint64_t v40 = v39;
        id v19 = v71;
      }
LABEL_57:

      goto LABEL_58;
    }

    goto LABEL_35;
  }
  LOBYTE(v12) = 1;
LABEL_64:

  return (char)v12;
}

- (unint64_t)hash
{
  v21.receiver = self;
  v21.super_class = (Class)LNEnumMetadata;
  unint64_t v3 = [(LNEnumMetadata *)&v21 hash];
  uint64_t v4 = [(LNEnumMetadata *)self identifier];
  uint64_t v5 = [v4 hash];
  id v6 = [(LNEnumMetadata *)self displayRepresentation];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(LNEnumMetadata *)self cases];
  uint64_t v9 = v7 ^ [v8 hash];
  id v10 = [(LNEnumMetadata *)self customIntentEnumTypeName];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(LNEnumMetadata *)self availabilityAnnotations];
  uint64_t v13 = v11 ^ [v12 hash] ^ v3;
  id v14 = [(LNEnumMetadata *)self fullyQualifiedTypeName];
  uint64_t v15 = [v14 hash];
  id v16 = [(LNEnumMetadata *)self assistantDefinedSchemas];
  uint64_t v17 = v15 ^ [v16 hash];
  id v18 = [(LNEnumMetadata *)self visibilityMetadata];
  unint64_t v19 = v13 ^ v17 ^ [v18 hash];

  return v19;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(LNEnumMetadata *)self displayRepresentation];
  uint64_t v7 = [(LNEnumMetadata *)self mangledTypeNameByBundleIdentifier];
  v8 = [(LNEnumMetadata *)self availabilityAnnotations];
  uint64_t v9 = [(LNEnumMetadata *)self fullyQualifiedTypeName];
  id v10 = [(LNEnumMetadata *)self assistantDefinedSchemas];
  uint64_t v11 = [(LNEnumMetadata *)self visibilityMetadata];
  v12 = [v3 stringWithFormat:@"<%@: %p, displayRepresentation: %@, mangledTypeNameByBundleIdentifier: %@, availabilityAnnotations: %@, fullyQualifiedTypeName: %@, assistantDefinedSchemas: %@, visibility: %@>", v5, self, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  uint64_t v4 = [(LNEnumMetadata *)self visibilityMetadata];
  LOBYTE(a3) = [v4 visibleForUse:a3];

  return a3;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 cases:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[LNStaticDeferredLocalizedString alloc] initWithLocalizedKey:v7 bundleIdentifier:0 bundleURL:0 table:0];
  uint64_t v9 = [(LNEnumMetadata *)self initWithIdentifier:v7 displayTypeName:v8 cases:v6];

  return v9;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 displayTypeName:(id)a4 cases:(id)a5
{
  return [(LNEnumMetadata *)self initWithIdentifier:a3 displayTypeName:a4 cases:a5 customIntentEnumTypeName:0];
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 displayTypeName:(id)a4 cases:(id)a5 customIntentEnumTypeName:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F1CAA0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v10 orderedSet];
  id v16 = [(LNEnumMetadata *)self initWithIdentifier:v14 mangledTypeName:v14 mangledTypeNameByBundleIdentifier:MEMORY[0x1E4F1CC08] effectiveBundleIdentifiers:v15 displayTypeName:v13 cases:v12 customIntentEnumTypeName:v11];

  return v16;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayTypeName:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9
{
  id v13 = (void *)MEMORY[0x1E4F1CAA0];
  id v14 = a9;
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  id v18 = [v13 orderedSet];
  unint64_t v19 = [[LNTypeDisplayRepresentation alloc] initWithName:v16 numericFormat:0];

  id v20 = [(LNEnumMetadata *)self initWithIdentifier:v17 mangledTypeName:v17 mangledTypeNameByBundleIdentifier:MEMORY[0x1E4F1CC08] effectiveBundleIdentifiers:v18 displayRepresentation:v19 cases:v15 customIntentEnumTypeName:v14];
  return v20;
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9
{
  return [(LNEnumMetadata *)self initWithIdentifier:a3 mangledTypeName:a4 mangledTypeNameByBundleIdentifier:a5 effectiveBundleIdentifiers:a6 displayRepresentation:a7 cases:a8 customIntentEnumTypeName:a9 availabilityAnnotations:0];
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10
{
  return [(LNEnumMetadata *)self initWithIdentifier:a3 mangledTypeName:a4 mangledTypeNameByBundleIdentifier:a5 effectiveBundleIdentifiers:a6 displayRepresentation:a7 cases:a8 customIntentEnumTypeName:a9 availabilityAnnotations:a10 system:0];
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11
{
  return [(LNEnumMetadata *)self initWithIdentifier:a3 mangledTypeName:a4 mangledTypeNameByBundleIdentifier:a5 effectiveBundleIdentifiers:a6 displayRepresentation:a7 cases:a8 customIntentEnumTypeName:a9 availabilityAnnotations:a10 system:a11 fullyQualifiedTypeName:0];
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12
{
  return [(LNEnumMetadata *)self initWithIdentifier:a3 mangledTypeName:a4 mangledTypeNameByBundleIdentifier:a5 effectiveBundleIdentifiers:a6 displayRepresentation:a7 cases:a8 customIntentEnumTypeName:a9 availabilityAnnotations:a10 system:a11 fullyQualifiedTypeName:a12 assistantDefinedSchemas:0];
}

- (LNEnumMetadata)initWithIdentifier:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayRepresentation:(id)a7 cases:(id)a8 customIntentEnumTypeName:(id)a9 availabilityAnnotations:(id)a10 system:(id)a11 fullyQualifiedTypeName:(id)a12 assistantDefinedSchemas:(id)a13
{
  id v31 = a13;
  id v30 = a12;
  id v27 = a11;
  id v17 = a10;
  id v23 = a9;
  id v24 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v26 = a4;
  id v21 = a3;
  v29 = [[LNVisibilityMetadata alloc] initWithIsDiscoverable:1 assistantOnly:0];
  v33 = [(LNEnumMetadata *)self initWithIdentifier:v21 mangledTypeName:v26 mangledTypeNameByBundleIdentifier:v20 effectiveBundleIdentifiers:v19 displayRepresentation:v18 cases:v24 customIntentEnumTypeName:v23 availabilityAnnotations:v17 system:v27 fullyQualifiedTypeName:v30 assistantDefinedSchemas:v31 visibilityMetadata:v29];

  return v33;
}

- (LNStaticDeferredLocalizedString)displayTypeName
{
  v2 = [(LNEnumMetadata *)self displayRepresentation];
  unint64_t v3 = [v2 name];

  return (LNStaticDeferredLocalizedString *)v3;
}

@end