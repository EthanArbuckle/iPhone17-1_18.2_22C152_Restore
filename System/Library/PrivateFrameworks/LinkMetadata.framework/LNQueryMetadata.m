@interface LNQueryMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)defaultQueryForEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)visibleForUse:(int64_t)a3;
- (LNActionDescriptionMetadata)descriptionMetadata;
- (LNQueryMetadata)initWithCoder:(id)a3;
- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9;
- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10;
- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11;
- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12;
- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13;
- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13 defaultQueryForEntity:(BOOL)a14;
- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13 defaultQueryForEntity:(BOOL)a14 fullyQualifiedIdentifier:(id)a15;
- (LNQueryMetadata)initWithIdentifier:(id)a3 queryType:(id)a4 entityType:(id)a5 mangledTypeName:(id)a6 mangledTypeNameByBundleIdentifier:(id)a7 effectiveBundleIdentifiers:(id)a8 parameters:(id)a9 sortingOptions:(id)a10;
- (LNQueryMetadata)initWithIdentifier:(id)a3 queryType:(id)a4 entityType:(id)a5 parameters:(id)a6 sortingOptions:(id)a7;
- (LNVisibilityMetadata)visibilityMetadata;
- (NSArray)parameters;
- (NSArray)sortingOptions;
- (NSDictionary)availabilityAnnotations;
- (NSDictionary)mangledTypeNameByBundleIdentifier;
- (NSOrderedSet)effectiveBundleIdentifiers;
- (NSString)description;
- (NSString)entityType;
- (NSString)fullyQualifiedIdentifier;
- (NSString)identifier;
- (NSString)mangledTypeName;
- (NSString)queryType;
- (id)mangledTypeNameForBundleIdentifier:(id)a3;
- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4;
- (unint64_t)capabilities;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNQueryMetadata

- (NSString)entityType
{
  return self->_entityType;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13 defaultQueryForEntity:(BOOL)a14 fullyQualifiedIdentifier:(id)a15
{
  id v20 = a3;
  id v21 = a4;
  id v22 = a5;
  id v66 = a6;
  id v65 = a7;
  id v23 = a8;
  id v24 = a9;
  id v68 = a10;
  id v25 = a12;
  id v26 = a13;
  id v27 = a15;
  v69 = v20;
  if (v20)
  {
    if (v21) {
      goto LABEL_3;
    }
  }
  else
  {
    v58 = [MEMORY[0x1E4F28B00] currentHandler];
    [v58 handleFailureInMethod:a2, self, @"LNQueryMetadata.m", 44, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v21)
    {
LABEL_3:
      if (v23) {
        goto LABEL_4;
      }
LABEL_14:
      v60 = [MEMORY[0x1E4F28B00] currentHandler];
      [v60 handleFailureInMethod:a2, self, @"LNQueryMetadata.m", 46, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];

      if (v24) {
        goto LABEL_5;
      }
      goto LABEL_15;
    }
  }
  v59 = [MEMORY[0x1E4F28B00] currentHandler];
  [v59 handleFailureInMethod:a2, self, @"LNQueryMetadata.m", 45, @"Invalid parameter not satisfying: %@", @"entityType" object file lineNumber description];

  if (!v23) {
    goto LABEL_14;
  }
LABEL_4:
  if (v24) {
    goto LABEL_5;
  }
LABEL_15:
  v61 = [MEMORY[0x1E4F28B00] currentHandler];
  [v61 handleFailureInMethod:a2, self, @"LNQueryMetadata.m", 47, @"Invalid parameter not satisfying: %@", @"sortingOptions" object file lineNumber description];

LABEL_5:
  v28 = v22;
  if (!v22)
  {
    v62 = [MEMORY[0x1E4F28B00] currentHandler];
    [v62 handleFailureInMethod:a2, self, @"LNQueryMetadata.m", 48, @"Invalid parameter not satisfying: %@", @"mangledTypeName" object file lineNumber description];
  }
  id v29 = v21;
  if (!v26)
  {
    v63 = [MEMORY[0x1E4F28B00] currentHandler];
    [v63 handleFailureInMethod:a2, self, @"LNQueryMetadata.m", 49, @"Invalid parameter not satisfying: %@", @"visibilityMetadata" object file lineNumber description];
  }
  v70.receiver = self;
  v70.super_class = (Class)LNQueryMetadata;
  v30 = [(LNQueryMetadata *)&v70 init];
  v31 = v29;
  v32 = v27;
  v33 = v31;
  if (v30)
  {
    uint64_t v34 = [v69 copy];
    identifier = v30->_identifier;
    v30->_identifier = (NSString *)v34;

    uint64_t v36 = [v33 copy];
    entityType = v30->_entityType;
    v30->_entityType = (NSString *)v36;

    uint64_t v38 = [v23 copy];
    parameters = v30->_parameters;
    v30->_parameters = (NSArray *)v38;

    uint64_t v40 = [v24 copy];
    sortingOptions = v30->_sortingOptions;
    v30->_sortingOptions = (NSArray *)v40;

    uint64_t v42 = [v28 copy];
    mangledTypeName = v30->_mangledTypeName;
    v30->_mangledTypeName = (NSString *)v42;

    uint64_t v44 = [v66 copy];
    mangledTypeNameByBundleIdentifier = v30->_mangledTypeNameByBundleIdentifier;
    v30->_mangledTypeNameByBundleIdentifier = (NSDictionary *)v44;

    uint64_t v46 = [v65 copy];
    effectiveBundleIdentifiers = v30->_effectiveBundleIdentifiers;
    v30->_effectiveBundleIdentifiers = (NSOrderedSet *)v46;

    uint64_t v48 = [v68 copy];
    availabilityAnnotations = v30->_availabilityAnnotations;
    v30->_availabilityAnnotations = (NSDictionary *)v48;

    v30->_capabilities = a11;
    uint64_t v50 = [v25 copy];
    descriptionMetadata = v30->_descriptionMetadata;
    v30->_descriptionMetadata = (LNActionDescriptionMetadata *)v50;

    uint64_t v52 = [v26 copy];
    visibilityMetadata = v30->_visibilityMetadata;
    v30->_visibilityMetadata = (LNVisibilityMetadata *)v52;

    v30->_defaultQueryForEntity = a14;
    uint64_t v54 = [v32 copy];
    fullyQualifiedIdentifier = v30->_fullyQualifiedIdentifier;
    v30->_fullyQualifiedIdentifier = (NSString *)v54;

    v56 = v30;
  }

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMetadata, 0);
  objc_storeStrong((id *)&self->_descriptionMetadata, 0);
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_mangledTypeNameByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_sortingOptions, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)identifier
{
  return self->_identifier;
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
    [v12 handleFailureInMethod:a2, self, @"LNQueryMetadata.m", 22, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v6 = [(LNQueryMetadata *)self mangledTypeNameByBundleIdentifier];
  v7 = [v6 objectForKeyedSubscript:v5];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(LNQueryMetadata *)self mangledTypeName];
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

- (LNActionDescriptionMetadata)descriptionMetadata
{
  return self->_descriptionMetadata;
}

- (NSOrderedSet)effectiveBundleIdentifiers
{
  return self->_effectiveBundleIdentifiers;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (NSArray)sortingOptions
{
  return self->_sortingOptions;
}

- (BOOL)defaultQueryForEntity
{
  return self->_defaultQueryForEntity;
}

- (NSString)fullyQualifiedIdentifier
{
  return self->_fullyQualifiedIdentifier;
}

- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"LNQueryMetadata.m", 199, @"Invalid parameter not satisfying: %@", @"effectiveBundleIdentifiers" object file lineNumber description];
  }
  id v9 = (void *)[(LNQueryMetadata *)self copy];
  v10 = [v9 effectiveBundleIdentifiers];
  v11 = [v7 array];
  uint64_t v12 = objc_msgSend(v10, "if_orderedSetByAddingObjectsFromArray:", v11);
  v13 = (void *)v9[9];
  v9[9] = v12;

  v14 = [v9 mangledTypeNameByBundleIdentifier];
  uint64_t v15 = objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v8);
  v16 = (void *)v9[8];
  v9[8] = v15;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (LNQueryMetadata *)a3;
  id v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_63:

      goto LABEL_64;
    }
    id v7 = [(LNQueryMetadata *)self identifier];
    id v8 = [(LNQueryMetadata *)v6 identifier];
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
    v16 = [(LNQueryMetadata *)self entityType];
    v17 = [(LNQueryMetadata *)v6 entityType];
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
        goto LABEL_60;
      }
      int v21 = [v14 isEqualToString:v18];

      if (!v21)
      {
LABEL_31:
        LOBYTE(v12) = 0;
LABEL_61:

        goto LABEL_62;
      }
    }
    id v22 = [(LNQueryMetadata *)self parameters];
    id v23 = [(LNQueryMetadata *)v6 parameters];

    if (v22 != v23)
    {
      uint64_t v24 = [(LNQueryMetadata *)self parameters];
      if (!v24) {
        goto LABEL_31;
      }
      id v25 = (void *)v24;
      id v26 = [(LNQueryMetadata *)v6 parameters];

      if (!v26) {
        goto LABEL_31;
      }
      id v27 = (void *)MEMORY[0x1E4F1CAD0];
      v72 = [(LNQueryMetadata *)self parameters];
      v28 = [v27 setWithArray:v72];
      id v29 = (void *)MEMORY[0x1E4F1CAD0];
      v30 = [(LNQueryMetadata *)v6 parameters];
      v31 = [v29 setWithArray:v30];
      int v69 = [v28 isEqualToSet:v31];

      if (!v69) {
        goto LABEL_31;
      }
    }
    v32 = [(LNQueryMetadata *)self sortingOptions];
    v33 = [(LNQueryMetadata *)v6 sortingOptions];

    if (v32 != v33)
    {
      uint64_t v34 = [(LNQueryMetadata *)self sortingOptions];
      if (!v34) {
        goto LABEL_31;
      }
      v35 = (void *)v34;
      uint64_t v36 = [(LNQueryMetadata *)v6 sortingOptions];

      if (!v36) {
        goto LABEL_31;
      }
      v37 = (void *)MEMORY[0x1E4F1CAD0];
      v73 = [(LNQueryMetadata *)self sortingOptions];
      uint64_t v38 = [v37 setWithArray:v73];
      v39 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v40 = [(LNQueryMetadata *)v6 sortingOptions];
      v41 = [v39 setWithArray:v40];
      int v70 = [v38 isEqualToSet:v41];

      if (!v70) {
        goto LABEL_31;
      }
    }
    uint64_t v42 = [(LNQueryMetadata *)self availabilityAnnotations];
    v43 = [(LNQueryMetadata *)v6 availabilityAnnotations];
    id v20 = v42;
    id v44 = v43;
    v19 = v44;
    id v74 = v20;
    if (v20 == v44)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v45 = v44;
      if (!v20 || !v44) {
        goto LABEL_59;
      }
      int v12 = [v20 isEqualToDictionary:v44];

      if (!v12) {
        goto LABEL_60;
      }
    }
    uint64_t v46 = [(LNQueryMetadata *)self descriptionMetadata];
    v67 = [(LNQueryMetadata *)v6 descriptionMetadata];
    id v47 = v46;
    id v48 = v67;
    id v68 = v48;
    id v71 = v47;
    if (v47 != v48)
    {
      LOBYTE(v12) = 0;
      if (v47)
      {
        v49 = v48;
        if (v48)
        {
          int v64 = [v47 isEqual:v48];

          if (!v64)
          {
            LOBYTE(v12) = 0;
LABEL_58:
            v45 = v68;
            id v20 = v71;
LABEL_59:

            id v20 = v74;
LABEL_60:

            goto LABEL_61;
          }
LABEL_39:
          uint64_t v50 = [(LNQueryMetadata *)self visibilityMetadata];
          id v65 = [(LNQueryMetadata *)v6 visibilityMetadata];
          id v47 = v50;
          id v51 = v65;
          id v66 = v51;
          if (v47 == v51)
          {
          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v47)
            {
              uint64_t v52 = v51;
              id v53 = 0;
              goto LABEL_55;
            }
            uint64_t v52 = v51;
            id v53 = v47;
            if (!v51)
            {
LABEL_55:
              v60 = v53;

              goto LABEL_56;
            }
            uint64_t v54 = v51;
            int v62 = [v47 isEqual:v51];

            if (!v62) {
              goto LABEL_46;
            }
          }
          BOOL v55 = [(LNQueryMetadata *)self defaultQueryForEntity];
          if (v55 != [(LNQueryMetadata *)v6 defaultQueryForEntity])
          {
LABEL_46:
            LOBYTE(v12) = 0;
LABEL_56:
            v49 = v66;
            goto LABEL_57;
          }
          v56 = [(LNQueryMetadata *)self fullyQualifiedIdentifier];
          v57 = [(LNQueryMetadata *)v6 fullyQualifiedIdentifier];
          id v58 = v56;
          id v59 = v57;
          v63 = v59;
          if (v58 == v59)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v58 && v59) {
              LOBYTE(v12) = [v58 isEqualToString:v59];
            }
          }

          uint64_t v52 = v63;
          id v53 = v58;
          goto LABEL_55;
        }
      }
      else
      {
        v49 = v48;
      }
LABEL_57:

      goto LABEL_58;
    }

    goto LABEL_39;
  }
  LOBYTE(v12) = 1;
LABEL_64:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(LNQueryMetadata *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(LNQueryMetadata *)self entityType];
  uint64_t v6 = [v5 hash] ^ v4;
  id v7 = [(LNQueryMetadata *)self parameters];
  uint64_t v8 = [v7 hash];
  id v9 = [(LNQueryMetadata *)self sortingOptions];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(LNQueryMetadata *)self availabilityAnnotations];
  uint64_t v12 = [v11 hash];
  v13 = [(LNQueryMetadata *)self descriptionMetadata];
  uint64_t v14 = v12 ^ [v13 hash];
  int v15 = [(LNQueryMetadata *)self visibilityMetadata];
  uint64_t v16 = v10 ^ v14 ^ [v15 hash];
  uint64_t v17 = [(LNQueryMetadata *)self defaultQueryForEntity];
  id v18 = [(LNQueryMetadata *)self fullyQualifiedIdentifier];
  unint64_t v19 = v16 ^ v17 ^ [v18 hash];

  return v19;
}

- (NSString)description
{
  id v20 = NSString;
  v3 = (objc_class *)objc_opt_class();
  id v22 = NSStringFromClass(v3);
  int v21 = [(LNQueryMetadata *)self fullyQualifiedIdentifier];
  uint64_t v17 = v21;
  if (!v21)
  {
    int v21 = [(LNQueryMetadata *)self identifier];
  }
  uint64_t v16 = [(LNQueryMetadata *)self entityType];
  uint64_t v4 = [(LNQueryMetadata *)self mangledTypeNameByBundleIdentifier];
  unint64_t v19 = [(LNQueryMetadata *)self parameters];
  id v18 = [v19 valueForKeyPath:@"description"];
  id v5 = [v18 componentsJoinedByString:@", "];
  uint64_t v6 = [(LNQueryMetadata *)self sortingOptions];
  id v7 = [v6 valueForKeyPath:@"description"];
  uint64_t v8 = [v7 componentsJoinedByString:@", "];
  id v9 = [(LNQueryMetadata *)self availabilityAnnotations];
  uint64_t v10 = [(LNQueryMetadata *)self descriptionMetadata];
  v11 = [(LNQueryMetadata *)self visibilityMetadata];
  BOOL v12 = [(LNQueryMetadata *)self defaultQueryForEntity];
  v13 = @"NO";
  if (v12) {
    v13 = @"YES";
  }
  uint64_t v14 = [v20 stringWithFormat:@"<%@: %p, identifier: %@, entityType: %@, mangledTypeNameByBundleIdentifier: %@, parameters: [%@], sortingOptions: [%@], availabilityAnnotations: %@, descriptionMetadata: %@, visibility: %@, defaultEntityQuery: %@>", v22, self, v21, v16, v4, v5, v8, v9, v10, v11, v13];

  if (!v17) {
  return (NSString *)v14;
  }
}

- (LNQueryMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"entityType"];
  uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v56 = [v3 decodeObjectOfClasses:v8 forKey:@"parameters"];

  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  uint64_t v55 = [v3 decodeObjectOfClasses:v11 forKey:@"sortingOptions"];

  uint64_t v54 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mangledTypeName"];
  BOOL v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  uint64_t v15 = [v3 decodeObjectOfClasses:v14 forKey:@"effectiveBundleIdentifiers"];

  uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = v17;
  id v20 = (void *)v4;
  int v21 = objc_msgSend(v16, "setWithObjects:", v19, v18, 0);
  uint64_t v53 = [v3 decodeObjectOfClasses:v21 forKey:@"mangledTypeNameByBundleIdentifier"];

  id v22 = 0;
  if (!v4)
  {
    v41 = self;
    uint64_t v24 = (void *)v53;
    goto LABEL_12;
  }
  id v23 = (void *)v15;
  uint64_t v24 = (void *)v53;
  if (!v5)
  {
    v41 = self;
    id v25 = (void *)v56;
    goto LABEL_18;
  }
  id v25 = (void *)v56;
  if (!v56)
  {
    v41 = self;
LABEL_18:
    id v26 = (void *)v55;
    goto LABEL_19;
  }
  id v26 = (void *)v55;
  if (!v55)
  {
    v41 = self;
LABEL_19:
    id v27 = (void *)v54;
    goto LABEL_20;
  }
  id v27 = (void *)v54;
  if (!v54 || !v53)
  {
    v41 = self;
LABEL_20:
    uint64_t v42 = v3;
    uint64_t v40 = v23;
    goto LABEL_21;
  }
  uint64_t v15 = (uint64_t)v23;
  if (!v23)
  {
    v41 = self;
LABEL_12:
    uint64_t v42 = v3;
    uint64_t v40 = (void *)v15;
    id v26 = (void *)v55;
    id v25 = (void *)v56;
    id v27 = (void *)v54;
    goto LABEL_21;
  }
  uint64_t v50 = v20;
  v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  v31 = objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0);
  uint64_t v32 = [v3 decodeObjectOfClasses:v31 forKey:@"availabilityAnnotations"];

  uint64_t v33 = (int)[v3 decodeIntForKey:@"capabilities"];
  uint64_t v34 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"descriptionMetadata"];
  v35 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"visibilityMetadata"];
  if (!v35) {
    v35 = [[LNVisibilityMetadata alloc] initWithIsDiscoverable:1 assistantOnly:0];
  }
  char v36 = [v3 decodeBoolForKey:@"defaultQueryForEntity"];
  v37 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"fullyQualifiedIdentifier"];
  LOBYTE(v47) = v36;
  uint64_t v46 = v34;
  uint64_t v44 = v32;
  uint64_t v45 = v33;
  v49 = (void *)v32;
  id v26 = (void *)v55;
  uint64_t v38 = self;
  id v27 = (void *)v54;
  uint64_t v52 = (void *)v34;
  uint64_t v24 = (void *)v53;
  uint64_t v39 = v15;
  id v48 = v3;
  uint64_t v40 = (void *)v15;
  id v25 = (void *)v56;
  v41 = [(LNQueryMetadata *)v38 initWithIdentifier:v50 entityType:v5 mangledTypeName:v54 mangledTypeNameByBundleIdentifier:v53 effectiveBundleIdentifiers:v39 parameters:v56 sortingOptions:v55 availabilityAnnotations:v44 capabilities:v45 descriptionMetadata:v46 visibilityMetadata:v35 defaultQueryForEntity:v47 fullyQualifiedIdentifier:v37];

  id v20 = v50;
  uint64_t v42 = v48;

  id v22 = v41;
LABEL_21:

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(LNQueryMetadata *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  uint64_t v6 = [(LNQueryMetadata *)self entityType];
  [v4 encodeObject:v6 forKey:@"entityType"];

  uint64_t v7 = [(LNQueryMetadata *)self parameters];
  [v4 encodeObject:v7 forKey:@"parameters"];

  uint64_t v8 = [(LNQueryMetadata *)self sortingOptions];
  [v4 encodeObject:v8 forKey:@"sortingOptions"];

  id v9 = [(LNQueryMetadata *)self mangledTypeName];
  [v4 encodeObject:v9 forKey:@"mangledTypeName"];

  uint64_t v10 = [(LNQueryMetadata *)self mangledTypeNameByBundleIdentifier];
  [v4 encodeObject:v10 forKey:@"mangledTypeNameByBundleIdentifier"];

  v11 = [(LNQueryMetadata *)self effectiveBundleIdentifiers];
  [v4 encodeObject:v11 forKey:@"effectiveBundleIdentifiers"];

  BOOL v12 = [(LNQueryMetadata *)self availabilityAnnotations];
  [v4 encodeObject:v12 forKey:@"availabilityAnnotations"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNQueryMetadata capabilities](self, "capabilities"), @"capabilities");
  uint64_t v13 = [(LNQueryMetadata *)self descriptionMetadata];
  [v4 encodeObject:v13 forKey:@"descriptionMetadata"];

  uint64_t v14 = [(LNQueryMetadata *)self visibilityMetadata];
  [v4 encodeObject:v14 forKey:@"visibilityMetadata"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNQueryMetadata defaultQueryForEntity](self, "defaultQueryForEntity"), @"defaultQueryForEntity");
  id v15 = [(LNQueryMetadata *)self fullyQualifiedIdentifier];
  [v4 encodeObject:v15 forKey:@"fullyQualifiedIdentifier"];
}

- (BOOL)visibleForUse:(int64_t)a3
{
  id v4 = [(LNQueryMetadata *)self visibilityMetadata];
  LOBYTE(a3) = [v4 visibleForUse:a3];

  return a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 queryType:(id)a4 entityType:(id)a5 parameters:(id)a6 sortingOptions:(id)a7
{
  BOOL v12 = (void *)MEMORY[0x1E4F1CAA0];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [v12 orderedSet];
  uint64_t v19 = [(LNQueryMetadata *)self initWithIdentifier:v17 queryType:v16 entityType:v15 mangledTypeName:v16 mangledTypeNameByBundleIdentifier:MEMORY[0x1E4F1CC08] effectiveBundleIdentifiers:v18 parameters:v14 sortingOptions:v13];

  return v19;
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 queryType:(id)a4 entityType:(id)a5 mangledTypeName:(id)a6 mangledTypeNameByBundleIdentifier:(id)a7 effectiveBundleIdentifiers:(id)a8 parameters:(id)a9 sortingOptions:(id)a10
{
  return -[LNQueryMetadata initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:](self, "initWithIdentifier:entityType:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:parameters:sortingOptions:", a3, a5, a6, a7, a8, a9);
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9
{
  return [(LNQueryMetadata *)self initWithIdentifier:a3 entityType:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 parameters:a8 sortingOptions:a9 availabilityAnnotations:0];
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10
{
  return [(LNQueryMetadata *)self initWithIdentifier:a3 entityType:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 parameters:a8 sortingOptions:a9 availabilityAnnotations:a10 capabilities:0];
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11
{
  return [(LNQueryMetadata *)self initWithIdentifier:a3 entityType:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 parameters:a8 sortingOptions:a9 availabilityAnnotations:a10 capabilities:0 descriptionMetadata:0];
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12
{
  id v18 = a12;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = a3;
  id v27 = [[LNVisibilityMetadata alloc] initWithIsDiscoverable:1 assistantOnly:0];
  uint64_t v30 = [(LNQueryMetadata *)self initWithIdentifier:v26 entityType:v25 mangledTypeName:v24 mangledTypeNameByBundleIdentifier:v23 effectiveBundleIdentifiers:v22 parameters:v21 sortingOptions:v20 availabilityAnnotations:v19 capabilities:a11 descriptionMetadata:v18 visibilityMetadata:v27];

  return v30;
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13
{
  LOBYTE(v14) = 0;
  return [(LNQueryMetadata *)self initWithIdentifier:a3 entityType:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 parameters:a8 sortingOptions:a9 availabilityAnnotations:a10 capabilities:a11 descriptionMetadata:a12 visibilityMetadata:a13 defaultQueryForEntity:v14];
}

- (LNQueryMetadata)initWithIdentifier:(id)a3 entityType:(id)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 parameters:(id)a8 sortingOptions:(id)a9 availabilityAnnotations:(id)a10 capabilities:(unint64_t)a11 descriptionMetadata:(id)a12 visibilityMetadata:(id)a13 defaultQueryForEntity:(BOOL)a14
{
  LOBYTE(v15) = a14;
  return [(LNQueryMetadata *)self initWithIdentifier:a3 entityType:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 parameters:a8 sortingOptions:a9 availabilityAnnotations:a10 capabilities:a11 descriptionMetadata:a12 visibilityMetadata:a13 defaultQueryForEntity:v15 fullyQualifiedIdentifier:0];
}

- (NSString)queryType
{
  v2 = [(LNQueryMetadata *)self identifier];
  id v3 = [v2 stringByReplacingOccurrencesOfString:@"-" withString:@"."];

  return (NSString *)v3;
}

@end