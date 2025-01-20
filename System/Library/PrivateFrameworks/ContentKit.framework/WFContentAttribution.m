@interface WFContentAttribution
+ (BOOL)supportsSecureCoding;
+ (id)attributionWithAppDescriptor:(id)a3 accountIdentifier:(id)a4 disclosureLevel:(unint64_t)a5 managedLevel:(unint64_t)a6;
+ (id)attributionWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4;
+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifier:(id)a6;
+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6;
+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6 count:(unint64_t)a7;
+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 originalItemIdentifier:(id)a5;
+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 originalItemIdentifiers:(id)a5;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (id)shortcutsAppAttribution;
+ (id)shortcutsAppAttributionWithDisclosureLevel:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)disclosureWarnings;
- (NSOrderedSet)privateItemIdentifiers;
- (NSString)description;
- (WFContentAttribution)initWithCoder:(id)a3;
- (WFContentAttribution)initWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6 count:(unint64_t)a7;
- (WFContentLocation)origin;
- (id)attributionByReplacingAccountWithAppOrigin;
- (id)attributionByUpdatingItemsCount:(unint64_t)a3;
- (id)identifier;
- (id)wfSerializedRepresentation;
- (id)wfSerializedRepresentationWithPrivateItemIdentifiers;
- (unint64_t)count;
- (unint64_t)disclosureLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPrivateItemIdentifiers:(id)a3;
@end

@implementation WFContentAttribution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disclosureWarnings, 0);
  objc_storeStrong((id *)&self->_privateItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_origin, 0);
}

- (NSOrderedSet)disclosureWarnings
{
  return self->_disclosureWarnings;
}

- (void)setPrivateItemIdentifiers:(id)a3
{
}

- (NSOrderedSet)privateItemIdentifiers
{
  return self->_privateItemIdentifiers;
}

- (WFContentLocation)origin
{
  return self->_origin;
}

- (unint64_t)disclosureLevel
{
  return self->_disclosureLevel;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFContentAttribution *)self origin];
  v7 = [v6 description];
  v8 = [v3 stringWithFormat:@"<%@: %p, origin: %@, count: %lu>", v5, self, v7, -[WFContentAttribution count](self, "count")];

  return (NSString *)v8;
}

- (id)wfSerializedRepresentationWithPrivateItemIdentifiers
{
  v3 = [(WFContentAttribution *)self wfSerializedRepresentation];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(WFContentAttribution *)self privateItemIdentifiers];
  v6 = [v5 array];
  [v4 setObject:v6 forKey:@"privateItemIdentifiers"];

  return v4;
}

- (id)wfSerializedRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [(WFContentAttribution *)self origin];
  v4 = [v3 wfSerializedRepresentation];

  if (v4)
  {
    v5 = (void *)MEMORY[0x263EFF9A0];
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFContentAttribution disclosureLevel](self, "disclosureLevel", @"disclosureLevel"));
    v13[0] = v6;
    v13[1] = v4;
    v12[1] = @"origin";
    v12[2] = @"count";
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[WFContentAttribution count](self, "count"));
    v13[2] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
    v9 = [v5 dictionaryWithDictionary:v8];
  }
  else
  {
    v6 = getWFSecurityLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v10 = [(WFContentAttribution *)self origin];
      *(_DWORD *)buf = 136315394;
      v15 = "-[WFContentAttribution wfSerializedRepresentation]";
      __int16 v16 = 2114;
      v17 = v10;
      _os_log_impl(&dword_216505000, v6, OS_LOG_TYPE_FAULT, "%s Could not serialize origin: %{public}@", buf, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  objc_msgSend(v9, "encodeInteger:forKey:", -[WFContentAttribution disclosureLevel](self, "disclosureLevel"), @"disclosureLevel");
  v4 = [(WFContentAttribution *)self disclosureWarnings];
  v5 = [v4 array];
  [v9 encodeObject:v5 forKey:@"disclosureWarnings"];

  v6 = [(WFContentAttribution *)self origin];
  [v9 encodeObject:v6 forKey:@"origin"];

  v7 = [(WFContentAttribution *)self privateItemIdentifiers];
  v8 = [v7 array];
  [v9 encodeObject:v8 forKey:@"privateItemIdentifiers"];

  objc_msgSend(v9, "encodeInteger:forKey:", -[WFContentAttribution count](self, "count"), @"count");
}

- (WFContentAttribution)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"disclosureLevel"];
  v6 = +[WFDisclosureWarning allDisclosureWarningClasses];
  v7 = [v6 setByAddingObject:objc_opt_class()];
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"disclosureWarnings"];

  id v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"privateItemIdentifiers"];

  v13 = +[WFContentLocation allContentLocationClasses];
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"origin"];

  uint64_t v15 = [v4 decodeIntegerForKey:@"count"];
  __int16 v16 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v12];
  v17 = [(WFContentAttribution *)self initWithDisclosureLevel:v5 origin:v14 disclosureWarnings:v8 originalItemIdentifiers:v16 count:v15];

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContentAttribution *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else if ([(WFContentAttribution *)v4 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v5 = v4;
    unint64_t v6 = [(WFContentAttribution *)self disclosureLevel];
    if (v6 == [(WFContentAttribution *)v5 disclosureLevel])
    {
      v7 = [(WFContentAttribution *)self origin];
      v8 = [(WFContentAttribution *)v5 origin];
      if ([v7 isEqual:v8]
        && (unint64_t v9 = [(WFContentAttribution *)self count], v9 == [(WFContentAttribution *)v5 count]))
      {
        uint64_t v10 = [(WFContentAttribution *)self privateItemIdentifiers];
        v11 = [(WFContentAttribution *)v5 privateItemIdentifiers];
        char v12 = [v10 isEqualToOrderedSet:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(WFContentAttribution *)self disclosureLevel];
  unint64_t v4 = [(WFContentAttribution *)self count];
  uint64_t v5 = [(WFContentAttribution *)self origin];
  uint64_t v6 = [v5 hash];
  v7 = [(WFContentAttribution *)self privateItemIdentifiers];
  unint64_t v8 = v3 ^ v4 ^ v6 ^ [v7 hash] ^ 0x9E3779B97F4A7C15;

  return v8;
}

- (unint64_t)count
{
  unint64_t result = self->_count;
  if (!result)
  {
    unint64_t v4 = [(WFContentAttribution *)self privateItemIdentifiers];
    self->_count = [v4 count];

    return self->_count;
  }
  return result;
}

- (id)identifier
{
  unint64_t v3 = NSString;
  unint64_t v4 = [(WFContentAttribution *)self origin];
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [v3 stringWithFormat:@"com.apple.Shortcuts.attribution_%@_%lu", v5, -[WFContentAttribution disclosureLevel](self, "disclosureLevel"), 0];

  return v6;
}

- (id)attributionByUpdatingItemsCount:(unint64_t)a3
{
  if ([(WFContentAttribution *)self count] == a3)
  {
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v6 = [WFContentAttribution alloc];
    unint64_t v7 = [(WFContentAttribution *)self disclosureLevel];
    unint64_t v8 = [(WFContentAttribution *)self origin];
    unint64_t v9 = [(WFContentAttribution *)self disclosureWarnings];
    uint64_t v10 = [v9 array];
    v11 = [(WFContentAttribution *)self privateItemIdentifiers];
    uint64_t v5 = [(WFContentAttribution *)v6 initWithDisclosureLevel:v7 origin:v8 disclosureWarnings:v10 originalItemIdentifiers:v11 count:a3];
  }
  return v5;
}

- (id)attributionByReplacingAccountWithAppOrigin
{
  unint64_t v3 = [(WFContentAttribution *)self origin];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v5 = [(WFContentAttribution *)self origin];
    unint64_t v6 = [(WFContentAttribution *)self disclosureLevel];
    unint64_t v7 = [v5 appContentLocation];
    unint64_t v8 = [(WFContentAttribution *)self disclosureWarnings];
    unint64_t v9 = [v8 array];
    uint64_t v10 = [(WFContentAttribution *)self privateItemIdentifiers];
    v11 = +[WFContentAttribution attributionWithDisclosureLevel:v6 origin:v7 disclosureWarnings:v9 originalItemIdentifiers:v10 count:[(WFContentAttribution *)self count]];
  }
  else
  {
    v11 = self;
  }
  return v11;
}

- (WFContentAttribution)initWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6 count:(unint64_t)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v13)
  {
    __int16 v16 = getWFSecurityLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "-[WFContentAttribution initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:]";
      _os_log_impl(&dword_216505000, v16, OS_LOG_TYPE_FAULT, "%s WFContentAttribution being created with a nil origin!", buf, 0xCu);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)WFContentAttribution;
  v17 = [(WFContentAttribution *)&v25 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_disclosureLevel = a3;
    objc_storeStrong((id *)&v17->_origin, a4);
    v18->_count = a7;
    uint64_t v19 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v14];
    disclosureWarnings = v18->_disclosureWarnings;
    v18->_disclosureWarnings = (NSOrderedSet *)v19;

    if (a3 == 1)
    {
      v21 = (NSOrderedSet *)v15;
    }
    else
    {
      v21 = [MEMORY[0x263EFF9D8] orderedSet];
    }
    privateItemIdentifiers = v18->_privateItemIdentifiers;
    v18->_privateItemIdentifiers = v21;

    v23 = v18;
  }

  return v18;
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6 count:(unint64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = (void *)[objc_alloc((Class)a1) initWithDisclosureLevel:a3 origin:v14 disclosureWarnings:v13 originalItemIdentifiers:v12 count:a7];

  return v15;
}

+ (id)attributionWithAppDescriptor:(id)a3 accountIdentifier:(id)a4 disclosureLevel:(unint64_t)a5 managedLevel:(unint64_t)a6
{
  if (a4) {
    +[WFAccountContentLocation locationWithAccountIdentifier:a4 appDescriptor:a3 managedLevel:a6];
  }
  else {
  unint64_t v8 = +[WFAppContentLocation locationWithAppDescriptor:](WFAppContentLocation, "locationWithAppDescriptor:", a3, 0, a5, a6);
  }
  unint64_t v9 = [a1 attributionWithDisclosureLevel:a5 origin:v8 originalItemIdentifier:0];

  return v9;
}

+ (id)attributionWithAppDescriptor:(id)a3 disclosureLevel:(unint64_t)a4
{
  unint64_t v6 = +[WFAppContentLocation locationWithAppDescriptor:a3];
  unint64_t v7 = [a1 attributionWithDisclosureLevel:a4 origin:v6 originalItemIdentifier:0];

  return v7;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"disclosureLevel"];
  uint64_t v6 = [v5 unsignedIntegerValue];

  unint64_t v7 = [v4 valueForKey:@"origin"];
  unint64_t v8 = +[WFContentLocation objectWithWFSerializedRepresentation:v7];

  unint64_t v9 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"count"];
  uint64_t v10 = [v9 unsignedIntegerValue];

  if (v8)
  {
    v11 = [v4 objectForKey:@"privateItemIdentifiers"];
    if (v11) {
      id v12 = (void *)[objc_alloc(MEMORY[0x263EFF9D8]) initWithArray:v11];
    }
    else {
      id v12 = 0;
    }
    id v15 = objc_alloc((Class)a1);
    id v14 = (void *)[v15 initWithDisclosureLevel:v6 origin:v8 disclosureWarnings:MEMORY[0x263EFFA68] originalItemIdentifiers:v12 count:v10];
  }
  else
  {
    id v13 = getWFSecurityLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315138;
      uint64_t v18 = "+[WFContentAttribution objectWithWFSerializedRepresentation:]";
      _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Attempted to initialize a serialized WFContentAttribution with nil origin", (uint8_t *)&v17, 0xCu);
    }

    id v14 = 0;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)shortcutsAppAttributionWithDisclosureLevel:(unint64_t)a3
{
  id v5 = objc_alloc(MEMORY[0x263F0F988]);
  uint64_t v6 = (void *)[v5 initWithBundleIdentifier:*MEMORY[0x263F85610]];
  unint64_t v7 = [MEMORY[0x263F0F9B0] sharedResolver];
  unint64_t v8 = [v7 resolvedAppMatchingDescriptor:v6];

  unint64_t v9 = +[WFAppContentLocation locationWithAppDescriptor:v8];
  uint64_t v10 = objc_opt_new();
  v11 = [a1 attributionWithDisclosureLevel:a3 origin:v9 originalItemIdentifiers:v10];

  return v11;
}

+ (id)shortcutsAppAttribution
{
  return (id)[a1 shortcutsAppAttributionWithDisclosureLevel:0];
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifier:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x263EFF9D8];
  id v11 = a5;
  id v12 = a4;
  if (a6)
  {
    uint64_t v13 = [v10 orderedSetWithObject:a6];
  }
  else
  {
    uint64_t v13 = objc_opt_new();
  }
  id v14 = (void *)v13;
  id v15 = [a1 attributionWithDisclosureLevel:a3 origin:v12 disclosureWarnings:v11 originalItemIdentifiers:v13];

  return v15;
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 originalItemIdentifier:(id)a5
{
  return (id)[a1 attributionWithDisclosureLevel:a3 origin:a4 disclosureWarnings:MEMORY[0x263EFFA68] originalItemIdentifier:a5];
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 disclosureWarnings:(id)a5 originalItemIdentifiers:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = objc_msgSend(objc_alloc((Class)a1), "initWithDisclosureLevel:origin:disclosureWarnings:originalItemIdentifiers:count:", a3, v12, v11, v10, objc_msgSend(v10, "count"));

  return v13;
}

+ (id)attributionWithDisclosureLevel:(unint64_t)a3 origin:(id)a4 originalItemIdentifiers:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc((Class)a1);
  uint64_t v11 = [v8 count];
  id v12 = (void *)[v10 initWithDisclosureLevel:a3 origin:v9 disclosureWarnings:MEMORY[0x263EFFA68] originalItemIdentifiers:v8 count:v11];

  return v12;
}

@end