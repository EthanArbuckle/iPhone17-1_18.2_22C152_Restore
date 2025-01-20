@interface EMBusinessExternalID
+ (id)_componentsForBrandIDURL:(id)a3;
+ (id)_componentsForHighLevelDomainDisplayNameURL:(id)a3;
+ (id)_componentsForHighLevelDomainURL:(id)a3;
+ (id)_componentsForSimpleAddressURL:(id)a3;
+ (id)_groupingForSerializedRepresentation:(id)a3 components:(id *)a4;
+ (id)_queryItemValueForName:(id)a3 fromURLComponents:(id)a4;
+ (id)_serializedRepresentationForGrouping:(int64_t)a3 components:(id)a4;
+ (id)_serializedRepresentationUsingBrandID:(id)a3;
+ (id)_serializedRepresentationUsingHighLevelDomain:(id)a3;
+ (id)_serializedRepresentationUsingScheme:(id)a3 highLevelDomain:(id)a4 andDisplayName:(id)a5;
+ (id)_serializedRepresentationUsingSimpleAddress:(id)a3;
+ (id)externalIDForBrandID:(id)a3;
+ (id)externalIDForHighLevelDomain:(id)a3;
+ (id)externalIDForHighLevelDomain:(id)a3 displayName:(id)a4;
+ (id)externalIDForHighLevelDomain:(id)a3 displayNameCommonPrefix:(id)a4;
+ (id)externalIDForSerializedRepresentation:(id)a3;
+ (id)externalIDForSimpleAddress:(id)a3;
- (BOOL)isEqual:(id)a3;
- (EMBusinessExternalID)initWithGrouping:(int64_t)a3 components:(id)a4 serializedRepresentation:(id)a5;
- (NSString)brandID;
- (NSString)displayName;
- (NSString)ef_publicDescription;
- (NSString)highLevelDomain;
- (NSString)serializedRepresentation;
- (NSString)simpleAddress;
- (_EMBusinessExternalIDComponents)components;
- (id)_loggingDescriptionForSerializedRepresentation:(id)a3;
- (id)_redactComponent:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)grouping;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation EMBusinessExternalID

- (EMBusinessExternalID)initWithGrouping:(int64_t)a3 components:(id)a4 serializedRepresentation:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EMBusinessExternalID;
  v11 = [(EMBusinessExternalID *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_grouping = a3;
    objc_storeStrong((id *)&v11->_components, a4);
    if (v10) {
      id v13 = (id)EFAtomicObjectSetIfNil();
    }
  }

  return v12;
}

- (void)dealloc
{
  id v3 = (id)EFAtomicObjectRelease();
  v4.receiver = self;
  v4.super_class = (Class)EMBusinessExternalID;
  [(EMBusinessExternalID *)&v4 dealloc];
}

+ (id)externalIDForSimpleAddress:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_EMBusinessExternalIDComponents);
  [(_EMBusinessExternalIDComponents *)v5 setSimpleAddress:v4];
  v6 = (void *)[objc_alloc((Class)a1) initWithGrouping:3 components:v5 serializedRepresentation:0];

  return v6;
}

+ (id)externalIDForHighLevelDomain:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_EMBusinessExternalIDComponents);
  [(_EMBusinessExternalIDComponents *)v5 setHighLevelDomain:v4];
  v6 = (void *)[objc_alloc((Class)a1) initWithGrouping:4 components:v5 serializedRepresentation:0];

  return v6;
}

+ (id)externalIDForHighLevelDomain:(id)a3 displayName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(_EMBusinessExternalIDComponents);
  [(_EMBusinessExternalIDComponents *)v8 setHighLevelDomain:v6];
  [(_EMBusinessExternalIDComponents *)v8 setDisplayName:v7];
  id v9 = (void *)[objc_alloc((Class)a1) initWithGrouping:2 components:v8 serializedRepresentation:0];

  return v9;
}

+ (id)externalIDForHighLevelDomain:(id)a3 displayNameCommonPrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(_EMBusinessExternalIDComponents);
  [(_EMBusinessExternalIDComponents *)v8 setHighLevelDomain:v6];
  [(_EMBusinessExternalIDComponents *)v8 setDisplayName:v7];
  id v9 = (void *)[objc_alloc((Class)a1) initWithGrouping:1 components:v8 serializedRepresentation:0];

  return v9;
}

+ (id)externalIDForBrandID:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_EMBusinessExternalIDComponents);
  [(_EMBusinessExternalIDComponents *)v5 setBrandID:v4];
  id v6 = (void *)[objc_alloc((Class)a1) initWithGrouping:0 components:v5 serializedRepresentation:0];

  return v6;
}

+ (id)externalIDForSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  v5 = [a1 _groupingForSerializedRepresentation:v4 components:&v10];
  id v6 = v10;
  id v7 = v6;
  v8 = 0;
  if (v5 && v6) {
    v8 = objc_msgSend(objc_alloc((Class)a1), "initWithGrouping:components:serializedRepresentation:", objc_msgSend(v5, "integerValue"), v6, v4);
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EMBusinessExternalID *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if ([(EMBusinessExternalID *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    int64_t v6 = [(EMBusinessExternalID *)self grouping];
    if (v6 == [(EMBusinessExternalID *)v5 grouping])
    {
      id v7 = [(EMBusinessExternalID *)self components];
      v8 = [(EMBusinessExternalID *)v5 components];
      char v9 = EFObjectsAreEqual();
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(EMBusinessExternalID *)self grouping];
  id v4 = [(EMBusinessExternalID *)self components];
  unint64_t v5 = 33 * v3 + [v4 hash] + 1089;

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(EMBusinessExternalID *)self grouping];
  int64_t v6 = [(EMBusinessExternalID *)self components];
  id v7 = (void *)[v6 copy];
  v8 = [(EMBusinessExternalID *)self serializedRepresentation];
  char v9 = (void *)[v4 initWithGrouping:v5 components:v7 serializedRepresentation:v8];

  return v9;
}

- (NSString)ef_publicDescription
{
  int64_t v3 = [(EMBusinessExternalID *)self serializedRepresentation];
  id v4 = [(EMBusinessExternalID *)self _loggingDescriptionForSerializedRepresentation:v3];

  return (NSString *)v4;
}

- (id)_loggingDescriptionForSerializedRepresentation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [MEMORY[0x1E4F60D58] currentDevice];
  int v6 = [v5 isInternal];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F29088] componentsWithString:v4];
    v8 = [v7 user];
    char v9 = [(EMBusinessExternalID *)self _redactComponent:v8];
    [v7 setUser:v9];

    id v10 = [v7 host];
    v11 = [(EMBusinessExternalID *)self _redactComponent:v10];
    [v7 setHost:v11];

    v12 = [v7 path];
    unint64_t v13 = [v12 length];

    if (v13 >= 3)
    {
      v14 = [v7 path];
      objc_super v15 = [v14 substringFromIndex:1];
      v16 = [(EMBusinessExternalID *)self _redactComponent:v15];

      v17 = (void *)[[NSString alloc] initWithFormat:@"/%@", v16];
      [v7 setPath:v17];
    }
    v18 = [v7 queryItems];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      v20 = [v7 queryItems];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __71__EMBusinessExternalID__loggingDescriptionForSerializedRepresentation___block_invoke;
      v25[3] = &unk_1E63E2A68;
      v25[4] = self;
      v21 = objc_msgSend(v20, "ef_map:", v25);
      [v7 setQueryItems:v21];
    }
    v22 = [v7 string];
    v23 = objc_msgSend(v22, "ef_stringByReplacingPercentEscapesUsingEncoding:", 4);
  }
  else
  {
    v23 = [MEMORY[0x1E4F60E00] fullyRedactedStringForString:v4];
  }

  return v23;
}

id __71__EMBusinessExternalID__loggingDescriptionForSerializedRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  int64_t v5 = [v3 value];
  int v6 = [v4 _redactComponent:v5];

  id v7 = (void *)MEMORY[0x1E4F290C8];
  v8 = [v3 name];
  char v9 = [v7 queryItemWithName:v8 value:v6];

  return v9;
}

- (id)_redactComponent:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 length] > 1)
  {
    int64_t v5 = NSString;
    int v6 = [v3 substringToIndex:1];
    id v4 = [v5 stringWithFormat:@"%@-%lu", v6, objc_msgSend(v3, "length")];
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

- (NSString)highLevelDomain
{
  v2 = [(EMBusinessExternalID *)self components];
  id v3 = [v2 highLevelDomain];

  return (NSString *)v3;
}

- (NSString)displayName
{
  v2 = [(EMBusinessExternalID *)self components];
  id v3 = [v2 displayName];

  return (NSString *)v3;
}

- (NSString)simpleAddress
{
  v2 = [(EMBusinessExternalID *)self components];
  id v3 = [v2 simpleAddress];

  return (NSString *)v3;
}

- (NSString)brandID
{
  v2 = [(EMBusinessExternalID *)self components];
  id v3 = [v2 brandID];

  return (NSString *)v3;
}

- (NSString)serializedRepresentation
{
  id v3 = EFAtomicObjectLoad();
  if (!v3)
  {
    id v4 = objc_opt_class();
    int64_t v5 = [(EMBusinessExternalID *)self grouping];
    int v6 = [(EMBusinessExternalID *)self components];
    id v7 = [v4 _serializedRepresentationForGrouping:v5 components:v6];

    id v3 = EFAtomicObjectSetIfNil();
  }
  return (NSString *)v3;
}

+ (id)_serializedRepresentationForGrouping:(int64_t)a3 components:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  switch(a3)
  {
    case 0:
      v8 = [v6 brandID];
      uint64_t v9 = [a1 _serializedRepresentationUsingBrandID:v8];
      goto LABEL_8;
    case 1:
      v8 = [v6 highLevelDomain];
      id v10 = [v7 displayName];
      uint64_t v11 = [a1 _serializedRepresentationUsingScheme:@"business-hld-cp" highLevelDomain:v8 andDisplayName:v10];
      goto LABEL_5;
    case 2:
      v8 = [v6 highLevelDomain];
      id v10 = [v7 displayName];
      uint64_t v11 = [a1 _serializedRepresentationUsingScheme:@"business-hld-dn" highLevelDomain:v8 andDisplayName:v10];
LABEL_5:
      v12 = (void *)v11;

      goto LABEL_9;
    case 3:
      v8 = [v6 simpleAddress];
      uint64_t v9 = [a1 _serializedRepresentationUsingSimpleAddress:v8];
      goto LABEL_8;
    case 4:
      v8 = [v6 highLevelDomain];
      uint64_t v9 = [a1 _serializedRepresentationUsingHighLevelDomain:v8];
LABEL_8:
      v12 = (void *)v9;
LABEL_9:

      break;
    default:
      v12 = 0;
      break;
  }

  return v12;
}

+ (id)_serializedRepresentationUsingSimpleAddress:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v4 setScheme:@"business-addr"];
  int64_t v5 = [v3 emailAddressValue];
  id v6 = v5;
  if (!v5) {
    goto LABEL_3;
  }
  id v7 = [v5 localPart];
  [v4 setUser:v7];

  v8 = [v6 domain];
  [v4 setHost:v8];

  uint64_t v9 = [v4 string];
  if (!v9)
  {
LABEL_3:
    [v4 setUser:0];
    [v4 setHost:0];
    id v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"invalid-addr" value:v3];
    v13[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v4 setQueryItems:v11];

    uint64_t v9 = [v4 string];
  }

  return v9;
}

+ (id)_serializedRepresentationUsingHighLevelDomain:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v4 setScheme:@"business-hld"];
  [v4 setHost:v3];
  int64_t v5 = [v4 string];
  if (!v5)
  {
    [v4 setHost:0];
    id v6 = [MEMORY[0x1E4F290C8] queryItemWithName:@"invalid-hld" value:v3];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v4 setQueryItems:v7];

    int64_t v5 = [v4 string];
  }

  return v5;
}

+ (id)_serializedRepresentationUsingBrandID:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v6 setScheme:@"business-bi"];
  [v6 setHost:v5];
  id v7 = [v6 string];
  if (!v7)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"EMBusinessExternalID-BlackPearl.m", 284, @"Failed to generate a valid URL for brandID %@", v5 object file lineNumber description];
  }
  return v7;
}

+ (id)_serializedRepresentationUsingScheme:(id)a3 highLevelDomain:(id)a4 andDisplayName:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v10 setScheme:v7];
  [v10 setHost:v8];
  if (v9)
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"/%@", v9];
    [v10 setPath:v11];
  }
  v12 = [v10 string];
  if (!v12)
  {
    [v10 setHost:0];
    unint64_t v13 = [MEMORY[0x1E4F290C8] queryItemWithName:@"invalid-hld" value:v8];
    v16[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    [v10 setQueryItems:v14];

    v12 = [v10 string];
  }

  return v12;
}

+ (id)_groupingForSerializedRepresentation:(id)a3 components:(id *)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v6];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 scheme];
      if ([v9 isEqualToString:@"business-addr"])
      {
        if (a4)
        {
          id v10 = [a1 _componentsForSimpleAddressURL:v8];
          uint64_t v11 = &unk_1F1A61CF8;
LABEL_20:
          *a4 = v10;
          goto LABEL_21;
        }
        uint64_t v11 = &unk_1F1A61CF8;
        goto LABEL_21;
      }
      if ([v9 isEqualToString:@"business-hld"])
      {
        if (a4)
        {
          id v10 = [a1 _componentsForHighLevelDomainURL:v8];
          uint64_t v11 = &unk_1F1A61D10;
          goto LABEL_20;
        }
        uint64_t v11 = &unk_1F1A61D10;
LABEL_21:

        goto LABEL_26;
      }
      if ([v9 isEqualToString:@"business-hld-dn"])
      {
        if (!a4)
        {
          uint64_t v11 = &unk_1F1A61D28;
          goto LABEL_21;
        }
        id v10 = [a1 _componentsForHighLevelDomainDisplayNameURL:v8];
        uint64_t v11 = &unk_1F1A61D28;
        goto LABEL_20;
      }
      if ([v9 isEqualToString:@"business-hld-cp"])
      {
        if (!a4)
        {
          uint64_t v11 = &unk_1F1A61D40;
          goto LABEL_21;
        }
        id v10 = [a1 _componentsForHighLevelDomainDisplayNameURL:v8];
        uint64_t v11 = &unk_1F1A61D40;
        goto LABEL_20;
      }
      if ([v9 isEqualToString:@"business-bi"])
      {
        if (!a4)
        {
          uint64_t v11 = &unk_1F1A61D58;
          goto LABEL_21;
        }
        id v10 = [a1 _componentsForBrandIDURL:v8];
        uint64_t v11 = &unk_1F1A61D58;
        goto LABEL_20;
      }
    }
  }
  uint64_t v11 = 0;
  if (a4) {
    *a4 = 0;
  }
LABEL_26:

  return v11;
}

+ (id)_componentsForSimpleAddressURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
  id v6 = [a1 _queryItemValueForName:@"invalid-addr" fromURLComponents:v5];
  if (v6) {
    goto LABEL_3;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F60800]);
  id v8 = [v5 user];
  [v7 setLocalPart:v8];

  id v9 = [v5 host];
  [v7 setDomain:v9];

  id v6 = [v7 stringValue];

  if (v6)
  {
LABEL_3:
    id v10 = objc_alloc_init(_EMBusinessExternalIDComponents);
    [(_EMBusinessExternalIDComponents *)v10 setSimpleAddress:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)_componentsForHighLevelDomainURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
  id v6 = [a1 _queryItemValueForName:@"invalid-hld" fromURLComponents:v5];
  if (v6 || ([v5 host], (id v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v7 = objc_alloc_init(_EMBusinessExternalIDComponents);
    [(_EMBusinessExternalIDComponents *)v7 setHighLevelDomain:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_componentsForHighLevelDomainDisplayNameURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v4 resolvingAgainstBaseURL:0];
  id v6 = [a1 _queryItemValueForName:@"invalid-hld" fromURLComponents:v5];
  if (!v6)
  {
    id v6 = [v5 host];
  }
  id v7 = [v5 path];
  id v8 = (_EMBusinessExternalIDComponents *)[v7 length];

  if (v8)
  {
    id v9 = [v5 path];
    id v10 = [v9 substringFromIndex:1];

    id v8 = 0;
    if (v6 && v10)
    {
      id v8 = objc_alloc_init(_EMBusinessExternalIDComponents);
      [(_EMBusinessExternalIDComponents *)v8 setHighLevelDomain:v6];
      [(_EMBusinessExternalIDComponents *)v8 setDisplayName:v10];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v8;
}

+ (id)_componentsForBrandIDURL:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:v3 resolvingAgainstBaseURL:0];
  id v5 = [v4 host];
  if (v5)
  {
    id v6 = objc_alloc_init(_EMBusinessExternalIDComponents);
    [(_EMBusinessExternalIDComponents *)v6 setBrandID:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_queryItemValueForName:(id)a3 fromURLComponents:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 queryItems];
  id v8 = (void *)[v7 count];

  if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = objc_msgSend(v6, "queryItems", 0);
    id v8 = (void *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v9);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          unint64_t v13 = [v12 name];
          int v14 = [v13 isEqualToString:v5];

          if (v14)
          {
            id v8 = [v12 value];
            goto LABEL_12;
          }
        }
        id v8 = (void *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v8;
}

- (int64_t)grouping
{
  return self->_grouping;
}

- (_EMBusinessExternalIDComponents)components
{
  return self->_components;
}

- (void).cxx_destruct
{
}

@end