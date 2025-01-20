@interface LNEntityMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTransient;
- (BOOL)visibleForUse:(int64_t)a3;
- (LNContentTypeMetadata)transferableContentTypes;
- (LNEntityMetadata)entityMetadataWithAttributionBundleIdentifier:(id)a3;
- (LNEntityMetadata)initWithCoder:(id)a3;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17 visibilityMetadata:(id)a18;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17 visibilityMetadata:(id)a18 defaultQueryIdentifier:(id)a19;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 systemProtocolMetadata:(id)a12;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 systemProtocolMetadata:(id)a12 attributionBundleIdentifier:(id)a13;
- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayTypeName:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10;
- (LNEntityMetadata)initWithTypeName:(id)a3 displayTypeName:(id)a4 properties:(id)a5;
- (LNEntityMetadata)initWithTypeName:(id)a3 displayTypeName:(id)a4 properties:(id)a5 customIntentTypeClassName:(id)a6;
- (LNEntityMetadata)initWithTypeName:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayTypeName:(id)a7 properties:(id)a8 customIntentTypeClassName:(id)a9;
- (LNEntityMetadata)initWithTypeName:(id)a3 properties:(id)a4;
- (LNStaticDeferredLocalizedString)displayTypeName;
- (LNTypeDisplayRepresentation)displayRepresentation;
- (LNVisibilityMetadata)visibilityMetadata;
- (NSArray)assistantDefinedSchemas;
- (NSArray)properties;
- (NSArray)requiredCapabilities;
- (NSDictionary)availabilityAnnotations;
- (NSDictionary)mangledTypeNameByBundleIdentifier;
- (NSDictionary)systemProtocolMetadata;
- (NSOrderedSet)effectiveBundleIdentifiers;
- (NSString)attributionBundleIdentifier;
- (NSString)customIntentTypeClassName;
- (NSString)defaultQueryIdentifier;
- (NSString)description;
- (NSString)fullyQualifiedTypeName;
- (NSString)identifier;
- (NSString)mangledTypeName;
- (id)copyWithAdditionalTransferableContentTypes:(id)a3;
- (id)copyWithDescriptiveMetadataFromEntity:(id)a3 usingLibraryKey:(id)a4;
- (id)identifierIndexedProperties;
- (id)mangledTypeNameForBundleIdentifier:(id)a3;
- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4;
- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNEntityMetadata

- (LNEntityMetadata)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"displayRepresentation"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v61 = [v3 decodeObjectOfClasses:v8 forKey:@"properties"];

  uint64_t v60 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"mangledTypeName"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  uint64_t v59 = [v3 decodeObjectOfClasses:v11 forKey:@"effectiveBundleIdentifiers"];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  uint64_t v58 = [v3 decodeObjectOfClasses:v14 forKey:@"mangledTypeNameByBundleIdentifier"];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, objc_opt_class(), 0);
  uint64_t v21 = [v3 decodeObjectOfClasses:v20 forKey:@"systemProtocolMetadata"];
  v22 = (void *)v21;
  v23 = (void *)MEMORY[0x1E4F1CC08];
  if (v21) {
    v23 = (void *)v21;
  }
  id v56 = v23;

  v24 = 0;
  if (!v4)
  {
    v4 = 0;
    v46 = self;
    v26 = (void *)v60;
    v48 = (void *)v61;
    v25 = (void *)v59;
LABEL_17:
    v27 = (void *)v58;
    goto LABEL_13;
  }
  v25 = (void *)v59;
  if (!v5)
  {
    v46 = self;
    v26 = (void *)v60;
    v48 = (void *)v61;
    goto LABEL_17;
  }
  v26 = (void *)v60;
  v27 = (void *)v58;
  if (!v61 || !v60 || !v58 || !v59)
  {
    v48 = (void *)v61;
    v46 = self;
LABEL_13:
    v47 = v56;
    goto LABEL_14;
  }
  v53 = v5;
  unsigned int v52 = [v3 decodeBoolForKey:@"transient"];
  v55 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"customIntentTypeClassName"];
  v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  v31 = objc_msgSend(v28, "setWithObjects:", v29, v30, objc_opt_class(), 0);
  v54 = [v3 decodeObjectOfClasses:v31 forKey:@"availabilityAnnotations"];

  v32 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
  v35 = [v3 decodeObjectOfClasses:v34 forKey:@"requiredCapabilities"];

  uint64_t v36 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"attributionBundleIdentifier"];
  uint64_t v37 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"transferableContentTypes"];
  v38 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v39 = objc_opt_class();
  v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  v41 = [v3 decodeObjectOfClasses:v40 forKey:@"assistantDefinedSchemas"];

  v42 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"fullyQualifiedTypeName"];
  v43 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"visibilityMetadata"];
  if (!v43) {
    v43 = [[LNVisibilityMetadata alloc] initWithIsDiscoverable:1 assistantOnly:0];
  }
  v44 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"defaultQueryIdentifier"];
  v50 = (void *)v36;
  id v51 = v3;
  v45 = (void *)v37;
  v46 = objc_retain(-[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:defaultQueryIdentifier:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:defaultQueryIdentifier:", v4, v52, v60, v58, v59, v53, v61, v55, v54, v35, v56, v36, v37,
            v41,
            v42,
            v43,
            v44));

  v27 = (void *)v58;
  v25 = (void *)v59;

  v26 = (void *)v60;
  v47 = v56;
  v48 = (void *)v61;

  id v3 = v51;
  v5 = v53;

  v24 = v46;
LABEL_14:

  return v24;
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17 visibilityMetadata:(id)a18 defaultQueryIdentifier:(id)a19
{
  id v23 = a3;
  id v24 = a5;
  id v77 = a6;
  id v82 = a7;
  id obj = a8;
  id v83 = a8;
  id v25 = a9;
  id v76 = a10;
  id v80 = a11;
  id v79 = a12;
  id v26 = a13;
  id v27 = a14;
  id v28 = a15;
  id v75 = a16;
  id v29 = a17;
  id v30 = a18;
  id v74 = a19;
  v81 = v23;
  if (!v23)
  {
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2, self, @"LNEntityMetadata.m", 47, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }
  if (!v24)
  {
    v66 = [MEMORY[0x1E4F28B00] currentHandler];
    [v66 handleFailureInMethod:a2, self, @"LNEntityMetadata.m", 48, @"Invalid parameter not satisfying: %@", @"mangledTypeName" object file lineNumber description];
  }
  v31 = v77;
  if (!v83)
  {
    v67 = [MEMORY[0x1E4F28B00] currentHandler];
    [v67 handleFailureInMethod:a2, self, @"LNEntityMetadata.m", 49, @"Invalid parameter not satisfying: %@", @"displayRepresentation" object file lineNumber description];
  }
  v32 = v28;
  if (!v25)
  {
    v68 = [MEMORY[0x1E4F28B00] currentHandler];
    [v68 handleFailureInMethod:a2, self, @"LNEntityMetadata.m", 50, @"Invalid parameter not satisfying: %@", @"properties" object file lineNumber description];
  }
  uint64_t v33 = v27;
  if (!v30)
  {
    v69 = [MEMORY[0x1E4F28B00] currentHandler];
    [v69 handleFailureInMethod:a2, self, @"LNEntityMetadata.m", 51, @"Invalid parameter not satisfying: %@", @"visibilityMetadata" object file lineNumber description];

    v31 = v77;
    v73 = [MEMORY[0x1E4F28B00] currentHandler];
    [v73 handleFailureInMethod:a2, self, @"LNEntityMetadata.m", 52, @"Invalid parameter not satisfying: %@", @"visibilityMetadata" object file lineNumber description];
  }
  v84.receiver = self;
  v84.super_class = (Class)LNEntityMetadata;
  v34 = [(LNEntityMetadata *)&v84 init];
  if (v34)
  {
    uint64_t v35 = [v81 copy];
    identifier = v34->_identifier;
    v34->_identifier = (NSString *)v35;

    v34->_transient = a4;
    uint64_t v37 = [v24 copy];
    mangledTypeName = v34->_mangledTypeName;
    v34->_mangledTypeName = (NSString *)v37;

    uint64_t v39 = [v31 copy];
    mangledTypeNameByBundleIdentifier = v34->_mangledTypeNameByBundleIdentifier;
    v34->_mangledTypeNameByBundleIdentifier = (NSDictionary *)v39;

    uint64_t v41 = [v82 copy];
    effectiveBundleIdentifiers = v34->_effectiveBundleIdentifiers;
    v34->_effectiveBundleIdentifiers = (NSOrderedSet *)v41;

    objc_storeStrong((id *)&v34->_displayRepresentation, obj);
    uint64_t v43 = [v25 copy];
    properties = v34->_properties;
    v34->_properties = (NSArray *)v43;

    objc_storeStrong((id *)&v34->_customIntentTypeClassName, a10);
    uint64_t v45 = [v80 copy];
    availabilityAnnotations = v34->_availabilityAnnotations;
    v34->_availabilityAnnotations = (NSDictionary *)v45;

    uint64_t v47 = [v79 copy];
    requiredCapabilities = v34->_requiredCapabilities;
    v34->_requiredCapabilities = (NSArray *)v47;

    uint64_t v49 = [v26 copy];
    systemProtocolMetadata = v34->_systemProtocolMetadata;
    v34->_systemProtocolMetadata = (NSDictionary *)v49;

    uint64_t v51 = [v33 copy];
    attributionBundleIdentifier = v34->_attributionBundleIdentifier;
    v34->_attributionBundleIdentifier = (NSString *)v51;

    uint64_t v53 = [v32 copy];
    transferableContentTypes = v34->_transferableContentTypes;
    v34->_transferableContentTypes = (LNContentTypeMetadata *)v53;

    uint64_t v55 = [v75 copy];
    assistantDefinedSchemas = v34->_assistantDefinedSchemas;
    v34->_assistantDefinedSchemas = (NSArray *)v55;

    uint64_t v57 = [v29 copy];
    fullyQualifiedTypeName = v34->_fullyQualifiedTypeName;
    v34->_fullyQualifiedTypeName = (NSString *)v57;

    uint64_t v59 = [v30 copy];
    visibilityMetadata = v34->_visibilityMetadata;
    v34->_visibilityMetadata = (LNVisibilityMetadata *)v59;

    uint64_t v61 = [v74 copy];
    defaultQueryIdentifier = v34->_defaultQueryIdentifier;
    v34->_defaultQueryIdentifier = (NSString *)v61;

    v63 = v34;
  }

  return v34;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibilityMetadata, 0);
  objc_storeStrong((id *)&self->_fullyQualifiedTypeName, 0);
  objc_storeStrong((id *)&self->_assistantDefinedSchemas, 0);
  objc_storeStrong((id *)&self->_attributionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultQueryIdentifier, 0);
  objc_storeStrong((id *)&self->_transferableContentTypes, 0);
  objc_storeStrong((id *)&self->_systemProtocolMetadata, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_availabilityAnnotations, 0);
  objc_storeStrong((id *)&self->_customIntentTypeClassName, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_mangledTypeNameByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_mangledTypeName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(LNEntityMetadata *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  objc_msgSend(v4, "encodeBool:forKey:", -[LNEntityMetadata isTransient](self, "isTransient"), @"transient");
  v6 = [(LNEntityMetadata *)self displayRepresentation];
  [v4 encodeObject:v6 forKey:@"displayRepresentation"];

  uint64_t v7 = [(LNEntityMetadata *)self properties];
  [v4 encodeObject:v7 forKey:@"properties"];

  v8 = [(LNEntityMetadata *)self mangledTypeName];
  [v4 encodeObject:v8 forKey:@"mangledTypeName"];

  v9 = [(LNEntityMetadata *)self mangledTypeNameByBundleIdentifier];
  [v4 encodeObject:v9 forKey:@"mangledTypeNameByBundleIdentifier"];

  uint64_t v10 = [(LNEntityMetadata *)self effectiveBundleIdentifiers];
  [v4 encodeObject:v10 forKey:@"effectiveBundleIdentifiers"];

  v11 = [(LNEntityMetadata *)self availabilityAnnotations];
  [v4 encodeObject:v11 forKey:@"availabilityAnnotations"];

  v12 = [(LNEntityMetadata *)self requiredCapabilities];
  [v4 encodeObject:v12 forKey:@"requiredCapabilities"];

  uint64_t v13 = [(LNEntityMetadata *)self systemProtocolMetadata];
  [v4 encodeObject:v13 forKey:@"systemProtocolMetadata"];

  v14 = [(LNEntityMetadata *)self attributionBundleIdentifier];
  [v4 encodeObject:v14 forKey:@"attributionBundleIdentifier"];

  v15 = [(LNEntityMetadata *)self transferableContentTypes];
  [v4 encodeObject:v15 forKey:@"transferableContentTypes"];

  uint64_t v16 = [(LNEntityMetadata *)self assistantDefinedSchemas];
  [v4 encodeObject:v16 forKey:@"assistantDefinedSchemas"];

  uint64_t v17 = [(LNEntityMetadata *)self fullyQualifiedTypeName];
  [v4 encodeObject:v17 forKey:@"fullyQualifiedTypeName"];

  uint64_t v18 = [(LNEntityMetadata *)self visibilityMetadata];
  [v4 encodeObject:v18 forKey:@"visibilityMetadata"];

  id v19 = [(LNEntityMetadata *)self defaultQueryIdentifier];
  [v4 encodeObject:v19 forKey:@"defaultQueryIdentifier"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)attributionBundleIdentifier
{
  return self->_attributionBundleIdentifier;
}

- (NSOrderedSet)effectiveBundleIdentifiers
{
  return self->_effectiveBundleIdentifiers;
}

- (NSDictionary)systemProtocolMetadata
{
  return self->_systemProtocolMetadata;
}

- (NSDictionary)availabilityAnnotations
{
  return self->_availabilityAnnotations;
}

- (NSArray)properties
{
  return self->_properties;
}

- (id)mangledTypeNameForBundleIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"LNEntityMetadata.m", 21, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];
  }
  v6 = [(LNEntityMetadata *)self mangledTypeNameByBundleIdentifier];
  uint64_t v7 = [v6 objectForKeyedSubscript:v5];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(LNEntityMetadata *)self mangledTypeName];
  }
  uint64_t v10 = v9;

  return v10;
}

- (NSDictionary)mangledTypeNameByBundleIdentifier
{
  return self->_mangledTypeNameByBundleIdentifier;
}

- (LNContentTypeMetadata)transferableContentTypes
{
  return self->_transferableContentTypes;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSString)mangledTypeName
{
  return self->_mangledTypeName;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (LNTypeDisplayRepresentation)displayRepresentation
{
  return self->_displayRepresentation;
}

- (LNVisibilityMetadata)visibilityMetadata
{
  return self->_visibilityMetadata;
}

- (NSString)fullyQualifiedTypeName
{
  return self->_fullyQualifiedTypeName;
}

- (NSString)defaultQueryIdentifier
{
  return self->_defaultQueryIdentifier;
}

- (NSArray)assistantDefinedSchemas
{
  return self->_assistantDefinedSchemas;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)customIntentTypeClassName
{
  return self->_customIntentTypeClassName;
}

- (id)schemaStringForStaticDeferredLocalizedString:(id)a3 usingLibraryKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [LNStaticDeferredLocalizedString alloc];
  v8 = NSString;
  id v9 = [v6 key];

  uint64_t v10 = [v8 stringWithFormat:@"[%@] %@", v5, v9];

  v11 = [MEMORY[0x1E4F1CB10] URLWithString:@"file:///System/Library/Frameworks/AppIntents.framework/"];
  v12 = [(LNStaticDeferredLocalizedString *)v7 initWithKey:v10 table:@"AssistantSchemas" bundleURL:v11];

  return v12;
}

- (id)identifierIndexedProperties
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = [(LNEntityMetadata *)self properties];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__LNEntityMetadata_identifierIndexedProperties__block_invoke;
  v7[3] = &unk_1E590D948;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateObjectsUsingBlock:v7];

  return v5;
}

void __47__LNEntityMetadata_identifierIndexedProperties__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 identifier];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v6 identifier];
    [v4 setObject:v6 forKeyedSubscript:v5];
  }
}

- (id)copyWithAdditionalTransferableContentTypes:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[(LNEntityMetadata *)self copy];
  id v6 = [v5 transferableContentTypes];
  uint64_t v7 = [v6 exportableTypes];
  id v8 = (void *)v7;
  id v9 = (void *)MEMORY[0x1E4F1CBF0];
  if (v7) {
    uint64_t v10 = (void *)v7;
  }
  else {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v10;

  v12 = [v5 transferableContentTypes];
  uint64_t v13 = [v12 importableTypes];
  v14 = (void *)v13;
  if (v13) {
    v15 = (void *)v13;
  }
  else {
    v15 = v9;
  }
  id v16 = v15;

  uint64_t v17 = [v4 exportableTypes];
  uint64_t v18 = [v11 arrayByAddingObjectsFromArray:v17];

  id v19 = [v4 importableTypes];

  v20 = [v16 arrayByAddingObjectsFromArray:v19];

  uint64_t v21 = [[LNContentTypeMetadata alloc] initWithExportableTypes:v18 importableTypes:v20];
  v22 = (void *)v5[12];
  v5[12] = v21;

  return v5;
}

- (id)copyWithDescriptiveMetadataFromEntity:(id)a3 usingLibraryKey:(id)a4
{
  id v25 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[(LNEntityMetadata *)self copy];
  id v8 = [LNTypeDisplayRepresentation alloc];
  id v24 = [v6 displayRepresentation];
  id v9 = [v24 name];
  uint64_t v10 = [(LNEntityMetadata *)self schemaStringForStaticDeferredLocalizedString:v9 usingLibraryKey:v25];
  id v11 = [(LNEntityMetadata *)self displayRepresentation];
  v12 = [v11 numericFormat];
  uint64_t v13 = [(LNEntityMetadata *)self displayRepresentation];
  v14 = [v13 synonyms];
  uint64_t v15 = [(LNTypeDisplayRepresentation *)v8 initWithName:v10 numericFormat:v12 synonyms:v14];
  id v16 = (void *)v7[7];
  v7[7] = v15;

  uint64_t v17 = [v6 identifierIndexedProperties];

  uint64_t v18 = [(LNEntityMetadata *)self properties];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__LNEntityMetadata_copyWithDescriptiveMetadataFromEntity_usingLibraryKey___block_invoke;
  v26[3] = &unk_1E590D920;
  id v27 = v17;
  id v28 = v25;
  id v19 = v25;
  id v20 = v17;
  uint64_t v21 = objc_msgSend(v18, "if_map:", v26);
  v22 = (void *)v7[6];
  v7[6] = v21;

  return v7;
}

id __74__LNEntityMetadata_copyWithDescriptiveMetadataFromEntity_usingLibraryKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 identifier];
  id v6 = [v3 objectForKey:v5];

  if (v6) {
    uint64_t v7 = [v4 copyWithDescriptiveMetadataFromProperty:v6 usingLibraryKey:*(void *)(a1 + 40)];
  }
  else {
    uint64_t v7 = [v4 copy];
  }
  id v8 = (void *)v7;

  return v8;
}

- (id)metadataByAddingEffectiveBundleIdentifiers:(id)a3 mangledTypeNameByBundleIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"LNEntityMetadata.m", 250, @"Invalid parameter not satisfying: %@", @"effectiveBundleIdentifiers" object file lineNumber description];
  }
  id v9 = (void *)[(LNEntityMetadata *)self copy];
  uint64_t v10 = [v9 effectiveBundleIdentifiers];
  id v11 = [v7 array];
  uint64_t v12 = objc_msgSend(v10, "if_orderedSetByAddingObjectsFromArray:", v11);
  uint64_t v13 = (void *)v9[5];
  v9[5] = v12;

  v14 = [v9 mangledTypeNameByBundleIdentifier];
  uint64_t v15 = objc_msgSend(v14, "if_dictionaryByAddingEntriesFromDictionary:", v8);
  id v16 = (void *)v9[4];
  v9[4] = v15;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (LNEntityMetadata *)a3;
  id v5 = v4;
  if (self != v4)
  {
    id v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_95:

      goto LABEL_96;
    }
    id v7 = [(LNEntityMetadata *)self identifier];
    id v8 = [(LNEntityMetadata *)v6 identifier];
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
        goto LABEL_93;
      }
      int v15 = [v9 isEqualToString:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_94:

        goto LABEL_95;
      }
    }
    id v16 = [(LNEntityMetadata *)self displayRepresentation];
    uint64_t v17 = [(LNEntityMetadata *)v6 displayRepresentation];
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
        goto LABEL_92;
      }
      int v21 = [v14 isEqual:v18];

      if (!v21)
      {
LABEL_27:
        LOBYTE(v12) = 0;
LABEL_93:

        goto LABEL_94;
      }
    }
    v22 = [(LNEntityMetadata *)self properties];
    id v23 = [(LNEntityMetadata *)v6 properties];

    if (v22 != v23)
    {
      uint64_t v24 = [(LNEntityMetadata *)self properties];
      if (!v24) {
        goto LABEL_27;
      }
      id v25 = (void *)v24;
      id v26 = [(LNEntityMetadata *)v6 properties];

      if (!v26) {
        goto LABEL_27;
      }
      id v27 = (void *)MEMORY[0x1E4F1CAD0];
      v105 = [(LNEntityMetadata *)self properties];
      id v28 = [v27 setWithArray:v105];
      id v29 = (void *)MEMORY[0x1E4F1CAD0];
      id v30 = [(LNEntityMetadata *)v6 properties];
      v31 = [v29 setWithArray:v30];
      int v103 = [v28 isEqualToSet:v31];

      if (!v103) {
        goto LABEL_27;
      }
    }
    v32 = [(LNEntityMetadata *)self customIntentTypeClassName];
    uint64_t v33 = [(LNEntityMetadata *)v6 customIntentTypeClassName];
    id v20 = v32;
    id v34 = v33;
    id v19 = v34;
    id v106 = v20;
    if (v20 == v34)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      uint64_t v35 = v34;
      if (!v20 || !v34) {
        goto LABEL_91;
      }
      LODWORD(v12) = [v20 isEqualToString:v34];

      if (!v12) {
        goto LABEL_92;
      }
    }
    v104 = v19;
    uint64_t v36 = [(LNEntityMetadata *)self availabilityAnnotations];
    uint64_t v37 = [(LNEntityMetadata *)v6 availabilityAnnotations];
    id v38 = v36;
    id v39 = v37;
    v101 = v39;
    id v102 = v38;
    if (v38 == v39)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v38)
      {
        v40 = v39;
        id v19 = v104;
        goto LABEL_89;
      }
      v40 = v39;
      id v19 = v104;
      if (!v39)
      {
LABEL_89:

        goto LABEL_90;
      }
      int v41 = [v38 isEqualToDictionary:v39];

      if (!v41) {
        goto LABEL_44;
      }
    }
    v42 = [(LNEntityMetadata *)self requiredCapabilities];
    uint64_t v43 = [(LNEntityMetadata *)v6 requiredCapabilities];

    if (v42 != v43)
    {
      uint64_t v12 = [(LNEntityMetadata *)self requiredCapabilities];
      if (!v12)
      {
LABEL_45:
        id v19 = v104;
LABEL_90:
        uint64_t v35 = v101;
        id v20 = v102;
LABEL_91:

        id v20 = v106;
LABEL_92:

        goto LABEL_93;
      }
      v44 = [(LNEntityMetadata *)v6 requiredCapabilities];

      if (!v44) {
        goto LABEL_44;
      }
      uint64_t v45 = (void *)MEMORY[0x1E4F1CAD0];
      v99 = [(LNEntityMetadata *)self requiredCapabilities];
      v46 = [v45 setWithArray:v99];
      uint64_t v47 = (void *)MEMORY[0x1E4F1CAD0];
      v48 = [(LNEntityMetadata *)v6 requiredCapabilities];
      uint64_t v49 = [v47 setWithArray:v48];
      int v97 = [v46 isEqualToSet:v49];

      if (!v97)
      {
LABEL_44:
        LOBYTE(v12) = 0;
        goto LABEL_45;
      }
    }
    v50 = [(LNEntityMetadata *)self systemProtocolMetadata];
    uint64_t v51 = [(LNEntityMetadata *)v6 systemProtocolMetadata];
    id v38 = v50;
    id v52 = v51;
    id v98 = v38;
    v100 = v52;
    if (v38 != v52)
    {
      LOBYTE(v12) = 0;
      if (v38)
      {
        uint64_t v53 = v52;
        id v19 = v104;
        if (v52)
        {
          int v54 = [v38 isEqualToDictionary:v52];

          if (!v54)
          {
            LOBYTE(v12) = 0;
            id v19 = v104;
            v40 = v100;
            goto LABEL_89;
          }
LABEL_48:
          uint64_t v55 = [(LNEntityMetadata *)self attributionBundleIdentifier];
          id v56 = [(LNEntityMetadata *)v6 attributionBundleIdentifier];
          id v57 = v55;
          id v58 = v56;
          v95 = v58;
          id v96 = v57;
          if (v57 != v58)
          {
            LOBYTE(v12) = 0;
            if (v57)
            {
              uint64_t v59 = v58;
              id v19 = v104;
              if (v58)
              {
                int v60 = [v57 isEqualToString:v58];

                if (!v60)
                {
                  LOBYTE(v12) = 0;
                  id v19 = v104;
LABEL_87:
                  uint64_t v53 = v95;
                  id v38 = v96;
                  goto LABEL_88;
                }
LABEL_54:
                uint64_t v61 = [(LNEntityMetadata *)self transferableContentTypes];
                v62 = [(LNEntityMetadata *)v6 transferableContentTypes];
                id v57 = v61;
                id v63 = v62;
                id v64 = v63;
                if (v57 != v63)
                {
                  LOBYTE(v12) = 0;
                  id v94 = v57;
                  v65 = v63;
                  if (v57)
                  {
                    id v19 = v104;
                    if (v63)
                    {
                      v66 = v63;
                      int v67 = [v57 isEqual:v63];
                      id v93 = v66;

                      if (!v67) {
                        goto LABEL_71;
                      }
LABEL_61:
                      v68 = [(LNEntityMetadata *)self assistantDefinedSchemas];
                      v69 = [(LNEntityMetadata *)v6 assistantDefinedSchemas];

                      if (v68 != v69)
                      {
                        uint64_t v12 = [(LNEntityMetadata *)self assistantDefinedSchemas];
                        if (!v12)
                        {
LABEL_72:
                          id v19 = v104;
                          uint64_t v59 = v93;
                          goto LABEL_86;
                        }
                        v70 = [(LNEntityMetadata *)v6 assistantDefinedSchemas];

                        if (!v70) {
                          goto LABEL_71;
                        }
                        v71 = (void *)MEMORY[0x1E4F1CAD0];
                        v91 = [(LNEntityMetadata *)self assistantDefinedSchemas];
                        v72 = [v71 setWithArray:v91];
                        v73 = (void *)MEMORY[0x1E4F1CAD0];
                        v88 = [(LNEntityMetadata *)v6 assistantDefinedSchemas];
                        id v74 = [v73 setWithArray:v88];
                        int v89 = [v72 isEqualToSet:v74];

                        if (!v89)
                        {
LABEL_71:
                          LOBYTE(v12) = 0;
                          goto LABEL_72;
                        }
                      }
                      id v75 = [(LNEntityMetadata *)self visibilityMetadata];
                      id v76 = [(LNEntityMetadata *)v6 visibilityMetadata];
                      id v77 = v75;
                      id v78 = v76;
                      v90 = v78;
                      v92 = v77;
                      id v94 = v57;
                      if (v77 == v78)
                      {
                      }
                      else
                      {
                        LOBYTE(v12) = 0;
                        if (!v77)
                        {
                          id v79 = v78;
                          id v80 = 0;
                          id v19 = v104;
                          goto LABEL_83;
                        }
                        id v79 = v78;
                        id v80 = v77;
                        id v19 = v104;
                        if (!v78)
                        {
LABEL_83:

                          goto LABEL_84;
                        }
                        int v81 = [v92 isEqual:v78];

                        if (!v81)
                        {
                          LOBYTE(v12) = 0;
                          id v19 = v104;
LABEL_84:
                          id v57 = v92;
                          id v64 = v93;
                          v65 = v90;
                          goto LABEL_85;
                        }
                      }
                      id v82 = [(LNEntityMetadata *)self defaultQueryIdentifier];
                      id v83 = [(LNEntityMetadata *)v6 defaultQueryIdentifier];
                      id v80 = v82;
                      id v84 = v83;
                      v85 = v84;
                      if (v80 == v84)
                      {
                        LOBYTE(v12) = 1;
                      }
                      else
                      {
                        LOBYTE(v12) = 0;
                        if (v80)
                        {
                          id v19 = v104;
                          if (v84) {
                            LOBYTE(v12) = [v80 isEqualToString:v84];
                          }
                          goto LABEL_81;
                        }
                      }
                      id v19 = v104;
LABEL_81:

                      id v79 = v85;
                      goto LABEL_83;
                    }
                  }
                  else
                  {
                    id v19 = v104;
                  }
LABEL_85:
                  v86 = v64;

                  uint64_t v59 = v86;
                  id v57 = v94;
                  goto LABEL_86;
                }
                id v93 = v63;

                goto LABEL_61;
              }
            }
            else
            {
              uint64_t v59 = v58;
              id v19 = v104;
            }
LABEL_86:

            goto LABEL_87;
          }

          goto LABEL_54;
        }
      }
      else
      {
        uint64_t v53 = v52;
        id v19 = v104;
      }
LABEL_88:

      id v38 = v98;
      v40 = v100;
      goto LABEL_89;
    }

    goto LABEL_48;
  }
  LOBYTE(v12) = 1;
LABEL_96:

  return (char)v12;
}

- (unint64_t)hash
{
  id v30 = [(LNEntityMetadata *)self identifier];
  uint64_t v3 = [v30 hash];
  uint64_t v4 = [(LNEntityMetadata *)self isTransient];
  id v29 = [(LNEntityMetadata *)self displayRepresentation];
  uint64_t v5 = v3 ^ [v29 hash] ^ v4;
  id v28 = [(LNEntityMetadata *)self properties];
  uint64_t v6 = [v28 hash];
  id v27 = [(LNEntityMetadata *)self customIntentTypeClassName];
  uint64_t v7 = v6 ^ [v27 hash];
  id v26 = [(LNEntityMetadata *)self availabilityAnnotations];
  uint64_t v8 = v5 ^ v7 ^ [v26 hash];
  id v9 = [(LNEntityMetadata *)self requiredCapabilities];
  uint64_t v10 = [v9 hash];
  id v11 = [(LNEntityMetadata *)self systemProtocolMetadata];
  uint64_t v12 = v10 ^ [v11 hash];
  uint64_t v13 = [(LNEntityMetadata *)self attributionBundleIdentifier];
  uint64_t v14 = v12 ^ [v13 hash];
  int v15 = [(LNEntityMetadata *)self transferableContentTypes];
  uint64_t v16 = v8 ^ v14 ^ [v15 hash];
  uint64_t v17 = [(LNEntityMetadata *)self assistantDefinedSchemas];
  uint64_t v18 = [v17 hash];
  id v19 = [(LNEntityMetadata *)self fullyQualifiedTypeName];
  uint64_t v20 = v18 ^ [v19 hash];
  int v21 = [(LNEntityMetadata *)self visibilityMetadata];
  uint64_t v22 = v20 ^ [v21 hash];
  id v23 = [(LNEntityMetadata *)self defaultQueryIdentifier];
  unint64_t v24 = v16 ^ v22 ^ [v23 hash];

  return v24;
}

- (NSString)description
{
  uint64_t v20 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v18 = NSStringFromClass(v3);
  uint64_t v17 = [(LNEntityMetadata *)self identifier];
  BOOL v4 = [(LNEntityMetadata *)self isTransient];
  uint64_t v5 = @"NO";
  if (v4) {
    uint64_t v5 = @"YES";
  }
  uint64_t v16 = v5;
  unint64_t v24 = [(LNEntityMetadata *)self displayRepresentation];
  id v23 = [(LNEntityMetadata *)self mangledTypeNameByBundleIdentifier];
  uint64_t v22 = [(LNEntityMetadata *)self properties];
  id v19 = [v22 valueForKeyPath:@"description"];
  uint64_t v6 = [v19 componentsJoinedByString:@", "];
  int v15 = [(LNEntityMetadata *)self availabilityAnnotations];
  uint64_t v7 = [(LNEntityMetadata *)self requiredCapabilities];
  uint64_t v8 = [(LNEntityMetadata *)self systemProtocolMetadata];
  id v9 = [(LNEntityMetadata *)self attributionBundleIdentifier];
  uint64_t v10 = [(LNEntityMetadata *)self assistantDefinedSchemas];
  id v11 = [(LNEntityMetadata *)self fullyQualifiedTypeName];
  uint64_t v12 = [(LNEntityMetadata *)self visibilityMetadata];
  uint64_t v13 = [(LNEntityMetadata *)self defaultQueryIdentifier];
  int v21 = [v20 stringWithFormat:@"<%@: %p, identifier: %@, transient: %@, displayRepresentation: %@, mangledTypeNameByBundleIdentifier: %@, properties: [%@], availabilityAnnotations: %@, requiredCapabilities: %@, systemProtocolMetadata: %@, attributionBundleIdentifier: %@, assistantDefinedSchemas: %@, fullyQualifiedTypeName: %@, visibility: %@, query: %@>", v18, self, v17, v16, v24, v23, v6, v15, v7, v8, v9, v10, v11, v12, v13];

  return (NSString *)v21;
}

- (BOOL)visibleForUse:(int64_t)a3
{
  BOOL v4 = [(LNEntityMetadata *)self visibilityMetadata];
  LOBYTE(a3) = [v4 visibleForUse:a3];

  return a3;
}

- (LNEntityMetadata)entityMetadataWithAttributionBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[(LNEntityMetadata *)self copy];
  uint64_t v6 = [v4 copy];

  uint64_t v7 = (void *)v5[14];
  v5[14] = v6;

  return (LNEntityMetadata *)v5;
}

- (LNEntityMetadata)initWithTypeName:(id)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[LNStaticDeferredLocalizedString alloc] initWithLocalizedKey:v7 bundleIdentifier:0 bundleURL:0 table:0];
  id v9 = [(LNEntityMetadata *)self initWithTypeName:v7 displayTypeName:v8 properties:v6];

  return v9;
}

- (LNEntityMetadata)initWithTypeName:(id)a3 displayTypeName:(id)a4 properties:(id)a5
{
  return [(LNEntityMetadata *)self initWithTypeName:a3 displayTypeName:a4 properties:a5 customIntentTypeClassName:0];
}

- (LNEntityMetadata)initWithTypeName:(id)a3 displayTypeName:(id)a4 properties:(id)a5 customIntentTypeClassName:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x1E4F1CAA0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  int v15 = [v10 orderedSet];
  uint64_t v16 = [(LNEntityMetadata *)self initWithTypeName:v14 mangledTypeName:v14 mangledTypeNameByBundleIdentifier:MEMORY[0x1E4F1CC08] effectiveBundleIdentifiers:v15 displayTypeName:v13 properties:v12 customIntentTypeClassName:v11];

  return v16;
}

- (LNEntityMetadata)initWithTypeName:(id)a3 mangledTypeName:(id)a4 mangledTypeNameByBundleIdentifier:(id)a5 effectiveBundleIdentifiers:(id)a6 displayTypeName:(id)a7 properties:(id)a8 customIntentTypeClassName:(id)a9
{
  return [(LNEntityMetadata *)self initWithIdentifier:a3 transient:0 mangledTypeName:a4 mangledTypeNameByBundleIdentifier:a5 effectiveBundleIdentifiers:a6 displayTypeName:a7 properties:a8 customIntentTypeClassName:a9];
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayTypeName:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10
{
  BOOL v26 = a4;
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = [[LNTypeDisplayRepresentation alloc] initWithName:v18 numericFormat:0];

  unint64_t v24 = [(LNEntityMetadata *)self initWithIdentifier:v22 transient:v26 mangledTypeName:v21 mangledTypeNameByBundleIdentifier:v20 effectiveBundleIdentifiers:v19 displayRepresentation:v23 properties:v17 customIntentTypeClassName:v16];
  return v24;
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10
{
  return [(LNEntityMetadata *)self initWithIdentifier:a3 transient:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 displayRepresentation:a8 properties:a9 customIntentTypeClassName:a10 availabilityAnnotations:0];
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11
{
  return [(LNEntityMetadata *)self initWithIdentifier:a3 transient:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 displayRepresentation:a8 properties:a9 customIntentTypeClassName:a10 availabilityAnnotations:a11 systemProtocolMetadata:MEMORY[0x1E4F1CC08]];
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 systemProtocolMetadata:(id)a12
{
  return [(LNEntityMetadata *)self initWithIdentifier:a3 transient:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 displayRepresentation:a8 properties:a9 customIntentTypeClassName:a10 availabilityAnnotations:a11 systemProtocolMetadata:a12 attributionBundleIdentifier:0];
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 systemProtocolMetadata:(id)a12 attributionBundleIdentifier:(id)a13
{
  return [(LNEntityMetadata *)self initWithIdentifier:a3 transient:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 displayRepresentation:a8 properties:a9 customIntentTypeClassName:a10 availabilityAnnotations:a11 requiredCapabilities:0 systemProtocolMetadata:a12 attributionBundleIdentifier:0];
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14
{
  return [(LNEntityMetadata *)self initWithIdentifier:a3 transient:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 displayRepresentation:a8 properties:a9 customIntentTypeClassName:a10 availabilityAnnotations:a11 requiredCapabilities:a12 systemProtocolMetadata:a13 attributionBundleIdentifier:a14 transferableContentTypes:0];
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15
{
  return [(LNEntityMetadata *)self initWithIdentifier:a3 transient:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 displayRepresentation:a8 properties:a9 customIntentTypeClassName:a10 availabilityAnnotations:a11 requiredCapabilities:a12 systemProtocolMetadata:a13 attributionBundleIdentifier:a14 transferableContentTypes:a15 assistantDefinedSchemas:0];
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16
{
  return [(LNEntityMetadata *)self initWithIdentifier:a3 transient:a4 mangledTypeName:a5 mangledTypeNameByBundleIdentifier:a6 effectiveBundleIdentifiers:a7 displayRepresentation:a8 properties:a9 customIntentTypeClassName:a10 availabilityAnnotations:a11 requiredCapabilities:a12 systemProtocolMetadata:a13 attributionBundleIdentifier:a14 transferableContentTypes:a15 assistantDefinedSchemas:a16 fullyQualifiedTypeName:0];
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17
{
  BOOL v38 = a4;
  id v36 = a17;
  id v33 = a16;
  id v32 = a15;
  id v29 = a14;
  id v23 = a13;
  id v26 = a12;
  id v25 = a11;
  id v40 = a10;
  id v39 = a9;
  id v24 = a8;
  id v28 = a7;
  id v31 = a6;
  id v19 = a5;
  id v20 = a3;
  uint64_t v35 = [[LNVisibilityMetadata alloc] initWithIsDiscoverable:1 assistantOnly:0];
  id v21 = -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:", v20, v38, v19, v31, v28, v24, v39, v40, v25, v26, v23, v29, v32, v33,
          v36,
          v35);

  return v21;
}

- (LNEntityMetadata)initWithIdentifier:(id)a3 transient:(BOOL)a4 mangledTypeName:(id)a5 mangledTypeNameByBundleIdentifier:(id)a6 effectiveBundleIdentifiers:(id)a7 displayRepresentation:(id)a8 properties:(id)a9 customIntentTypeClassName:(id)a10 availabilityAnnotations:(id)a11 requiredCapabilities:(id)a12 systemProtocolMetadata:(id)a13 attributionBundleIdentifier:(id)a14 transferableContentTypes:(id)a15 assistantDefinedSchemas:(id)a16 fullyQualifiedTypeName:(id)a17 visibilityMetadata:(id)a18
{
  return -[LNEntityMetadata initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:defaultQueryIdentifier:](self, "initWithIdentifier:transient:mangledTypeName:mangledTypeNameByBundleIdentifier:effectiveBundleIdentifiers:displayRepresentation:properties:customIntentTypeClassName:availabilityAnnotations:requiredCapabilities:systemProtocolMetadata:attributionBundleIdentifier:transferableContentTypes:assistantDefinedSchemas:fullyQualifiedTypeName:visibilityMetadata:defaultQueryIdentifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           0);
}

- (LNStaticDeferredLocalizedString)displayTypeName
{
  v2 = [(LNEntityMetadata *)self displayRepresentation];
  uint64_t v3 = [v2 name];

  return (LNStaticDeferredLocalizedString *)v3;
}

@end