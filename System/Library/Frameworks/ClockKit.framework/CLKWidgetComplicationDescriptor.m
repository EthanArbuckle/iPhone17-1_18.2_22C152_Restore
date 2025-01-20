@interface CLKWidgetComplicationDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDescriptor:(id)a3;
- (CLKIntentReference)intentReference;
- (CLKWidgetComplicationDescriptor)init;
- (CLKWidgetComplicationDescriptor)initWithCoder:(id)a3;
- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5;
- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 intent:(id)a6;
- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 intentReference:(id)a6;
- (CLKWidgetComplicationDescriptor)initWithJSONObjectRepresentation:(id)a3;
- (NSString)containerBundleIdentifier;
- (NSString)extensionBundleIdentifier;
- (NSString)kind;
- (id)JSONObjectRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLKWidgetComplicationDescriptor

- (CLKWidgetComplicationDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)CLKWidgetComplicationDescriptor;
  return [(CLKWidgetComplicationDescriptor *)&v3 init];
}

- (id)description
{
  objc_super v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CLKWidgetComplicationDescriptor;
  v4 = [(CLKWidgetComplicationDescriptor *)&v9 description];
  v5 = objc_msgSend(v3, "stringWithFormat:", @"%@ (%@, %@, %@"), v4, self->_extensionBundleIdentifier, self->_containerBundleIdentifier, self->_kind;

  intentReference = self->_intentReference;
  if (intentReference) {
    [v5 stringByAppendingFormat:@", %lli"], -[CLKIntentReference indexingHash](intentReference, "indexingHash"));
  }
  else {
  v7 = [v5 stringByAppendingString:@""]);
  }

  return v7;
}

- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5
{
  return [(CLKWidgetComplicationDescriptor *)self initWithExtensionBundleIdentifier:a3 containerBundleIdentifier:a4 kind:a5 intent:0];
}

- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 intent:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[CLKIntentReference alloc] initWithIntent:v10];

  v15 = [(CLKWidgetComplicationDescriptor *)self initWithExtensionBundleIdentifier:v13 containerBundleIdentifier:v12 kind:v11 intentReference:v14];
  return v15;
}

- (CLKWidgetComplicationDescriptor)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 intentReference:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)CLKWidgetComplicationDescriptor;
  v14 = [(CLKWidgetComplicationDescriptor *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    extensionBundleIdentifier = v14->_extensionBundleIdentifier;
    v14->_extensionBundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    containerBundleIdentifier = v14->_containerBundleIdentifier;
    v14->_containerBundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    kind = v14->_kind;
    v14->_kind = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    intentReference = v14->_intentReference;
    v14->_intentReference = (CLKIntentReference *)v21;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLKWidgetComplicationDescriptor)initWithCoder:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CLKWidgetComplicationDescriptor;
  v5 = [(CLKWidgetComplicationDescriptor *)&v28 init];
  if (!v5) {
    goto LABEL_14;
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extensionBundleIdentifier"];
  extensionBundleIdentifier = v5->_extensionBundleIdentifier;
  v5->_extensionBundleIdentifier = (NSString *)v6;

  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerBundleIdentifier"];
  containerBundleIdentifier = v5->_containerBundleIdentifier;
  v5->_containerBundleIdentifier = (NSString *)v8;

  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
  kind = v5->_kind;
  v5->_kind = (NSString *)v10;

  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentReference"];
  intentReference = v5->_intentReference;
  v5->_intentReference = (CLKIntentReference *)v12;

  v14 = (void *)MEMORY[0x263EFFA08];
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
  uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"intent"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:0];
    uint64_t v19 = [[CLKIntentReference alloc] initWithIntent:v18];
    v20 = v5->_intentReference;
    v5->_intentReference = v19;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    id v21 = v17;
    v22 = [[CLKIntentReference alloc] initWithIntent:v21];

    v18 = v5->_intentReference;
    v5->_intentReference = v22;
  }

LABEL_7:
  if (!v5->_extensionBundleIdentifier || !v5->_containerBundleIdentifier || !v5->_kind)
  {
    v23 = CLKLoggingObjectForDomain(0);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v25 = v5->_extensionBundleIdentifier;
      v26 = v5->_containerBundleIdentifier;
      v27 = v5->_kind;
      *(_DWORD *)buf = 138412802;
      v30 = v25;
      __int16 v31 = 2112;
      v32 = v26;
      __int16 v33 = 2112;
      v34 = v27;
      _os_log_fault_impl(&dword_21C599000, v23, OS_LOG_TYPE_FAULT, "Unexpected nil identifiers decoding CLKWidgetComplicationDescriptor: %@ %@ %@", buf, 0x20u);
    }
  }
LABEL_14:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:extensionBundleIdentifier forKey:@"extensionBundleIdentifier"];
  [v5 encodeObject:self->_containerBundleIdentifier forKey:@"containerBundleIdentifier"];
  [v5 encodeObject:self->_kind forKey:@"kind"];
  [v5 encodeObject:self->_intentReference forKey:@"intentReference"];
}

- (id)JSONObjectRepresentation
{
  objc_super v3 = objc_opt_new();
  [v3 setObject:self->_extensionBundleIdentifier forKeyedSubscript:@"extensionBundleIdentifier"];
  [v3 setObject:self->_containerBundleIdentifier forKeyedSubscript:@"containerBundleIdentifier"];
  [v3 setObject:self->_kind forKeyedSubscript:@"kind"];
  intentReference = self->_intentReference;
  if (intentReference)
  {
    id v5 = [(CLKIntentReference *)intentReference keyedArchiverEncodedData];
    uint64_t v6 = [v5 base64EncodedStringWithOptions:0];
    [v3 setObject:v6 forKeyedSubscript:@"intent"];
  }

  return v3;
}

- (CLKWidgetComplicationDescriptor)initWithJSONObjectRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(CLKWidgetComplicationDescriptor *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"extensionBundleIdentifier"];
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"containerBundleIdentifier"];
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"intent"];
    id v13 = (void *)MEMORY[0x263F08170];
    if (v12)
    {
      v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:0];
      if (!v14) {
        [MEMORY[0x263EFF940] raise:*v13 format:@"CLKWidgetComplicationDescriptor failed to decode intent"];
      }
      id v21 = 0;
      uint64_t v15 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v21];
      id v16 = v21;
      uint64_t v17 = v16;
      if (!v15 && v16) {
        [MEMORY[0x263EFF940] raise:*v13, @"CLKWidgetComplicationDescriptor failed to unarchive intent: %@", v16 format];
      }
      v18 = [[CLKIntentReference alloc] initWithIntent:v15];
      intentReference = v5->_intentReference;
      v5->_intentReference = v18;
    }
    if (!v5->_extensionBundleIdentifier || !v5->_containerBundleIdentifier || !v5->_kind) {
      [MEMORY[0x263EFF940] raise:*v13 format:@"CLKWidgetComplicationDescriptor was created from JSON with missing values"];
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CLKWidgetComplicationDescriptor);
  objc_storeStrong((id *)&v4->_extensionBundleIdentifier, self->_extensionBundleIdentifier);
  objc_storeStrong((id *)&v4->_containerBundleIdentifier, self->_containerBundleIdentifier);
  objc_storeStrong((id *)&v4->_kind, self->_kind);
  uint64_t v5 = [(CLKIntentReference *)self->_intentReference copy];
  intentReference = v4->_intentReference;
  v4->_intentReference = (CLKIntentReference *)v5;

  return v4;
}

- (BOOL)isEqualToDescriptor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
    extensionBundleIdentifier = self->_extensionBundleIdentifier;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke;
    v28[3] = &unk_26440E4E0;
    id v7 = v4;
    id v29 = v7;
    id v8 = (id)[v5 appendString:extensionBundleIdentifier counterpart:v28];
    containerBundleIdentifier = self->_containerBundleIdentifier;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_2;
    v26[3] = &unk_26440E4E0;
    id v10 = v7;
    id v27 = v10;
    id v11 = (id)[v5 appendString:containerBundleIdentifier counterpart:v26];
    kind = self->_kind;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_3;
    v24[3] = &unk_26440E4E0;
    id v13 = v10;
    id v25 = v13;
    id v14 = (id)[v5 appendString:kind counterpart:v24];
    intentReference = self->_intentReference;
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_4;
    v22 = &unk_26440E720;
    id v23 = v13;
    id v16 = (id)[v5 appendObject:intentReference counterpart:&v19];
    char v17 = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

id __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

id __55__CLKWidgetComplicationDescriptor_isEqualToDescriptor___block_invoke_4(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(CLKWidgetComplicationDescriptor *)self isEqualToDescriptor:v4];

  return v5;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)[v3 appendString:self->_extensionBundleIdentifier];
  id v5 = (id)[v3 appendString:self->_containerBundleIdentifier];
  id v6 = (id)[v3 appendString:self->_kind];
  id v7 = (id)[v3 appendObject:self->_intentReference];
  unint64_t v8 = [v3 hash];

  return v8;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (CLKIntentReference)intentReference
{
  return self->_intentReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end