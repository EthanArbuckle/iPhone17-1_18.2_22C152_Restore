@interface MGGroup
+ (BOOL)supportsSecureCoding;
+ (id)clientServiceWithConnectionProvider:(id)a3;
+ (id)predicateForCurrentDevice;
+ (id)predicateForGroup:(id)a3;
+ (id)predicateForGroupIdentifier:(id)a3;
+ (id)predicateForGroupsConformingToProtocol:(id)a3;
+ (id)predicateForGroupsContainingGroup:(id)a3;
+ (id)predicateForType;
+ (id)type;
+ (id)validateGroupSpecificationWithType:(id)a3 identifier:(id)a4 name:(id)a5 properties:(id)a6 members:(id)a7;
+ (void)groupWithClientService:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6;
+ (void)groupWithConnectionProvider:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6;
+ (void)groupWithName:(id)a3 members:(id)a4 completion:(id)a5;
- (BOOL)isSameGroup:(id)a3;
- (MGClientService)service;
- (MGGroup)initWithClientService:(id)a3 type:(id)a4 identifier:(id)a5 name:(id)a6 properties:(id)a7 memberIdentifiers:(id)a8;
- (MGGroup)initWithCoder:(id)a3;
- (MGGroup)initWithConnectionProvider:(id)a3 type:(id)a4 identifier:(id)a5 name:(id)a6 properties:(id)a7 memberIdentifiers:(id)a8;
- (MGGroupIdentifier)identifier;
- (NSArray)memberIdentifiers;
- (NSDictionary)properties;
- (NSString)name;
- (NSString)type;
- (id)_conformingProtocols;
- (id)description;
- (id)predicateForMembers;
- (void)deleteWithClientService:(id)a3 completion:(id)a4;
- (void)deleteWithCompletion:(id)a3;
- (void)deleteWithConnectionProvider:(id)a3 completion:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)forceSetClientService:(id)a3;
- (void)membersWithCompletion:(id)a3;
@end

@implementation MGGroup

- (MGGroup)initWithClientService:(id)a3 type:(id)a4 identifier:(id)a5 name:(id)a6 properties:(id)a7 memberIdentifiers:(id)a8
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v34.receiver = self;
  v34.super_class = (Class)MGGroup;
  v21 = [(MGGroup *)&v34 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_service, a3);
    uint64_t v23 = [v16 copy];
    type = v22->_type;
    v22->_type = (NSString *)v23;

    objc_storeStrong((id *)&v22->_identifier, a5);
    uint64_t v25 = [v18 copy];
    name = v22->_name;
    v22->_name = (NSString *)v25;

    uint64_t v27 = [v19 copy];
    v28 = (void *)v27;
    if (v27) {
      v29 = (void *)v27;
    }
    else {
      v29 = (void *)MEMORY[0x263EFFA78];
    }
    objc_storeStrong((id *)&v22->_properties, v29);

    uint64_t v30 = [v20 copy];
    memberIdentifiers = v22->_memberIdentifiers;
    v22->_memberIdentifiers = (NSArray *)v30;

    v32 = MGLogForCategory(0);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v36 = v22;
      __int16 v37 = 2048;
      id v38 = v15;
      _os_log_impl(&dword_222D6E000, v32, OS_LOG_TYPE_DEFAULT, "%p group initializing with service %p", buf, 0x16u);
    }
  }
  return v22;
}

- (MGGroup)initWithConnectionProvider:(id)a3 type:(id)a4 identifier:(id)a5 name:(id)a6 properties:(id)a7 memberIdentifiers:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [(id)objc_opt_class() clientServiceWithConnectionProvider:v19];

  v21 = [(MGGroup *)self initWithClientService:v20 type:v18 identifier:v17 name:v16 properties:v15 memberIdentifiers:v14];
  return v21;
}

- (MGGroup)initWithCoder:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)MGGroup;
  v5 = [(MGGroup *)&v41 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [v4 decodeObjectOfClass:v6 forKey:@"com.apple.MediaGroups.type"];
    type = v5->_type;
    v5->_type = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:v6 forKey:@"com.apple.MediaGroups.name"];
    name = v5->_name;
    v5->_name = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.MediaGroups.identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (MGGroupIdentifier *)v11;

    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    id v17 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, objc_opt_class(), v6, 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"com.apple.MediaGroups.members"];
    memberIdentifiers = v5->_memberIdentifiers;
    v5->_memberIdentifiers = (NSArray *)v18;

    if ([v4 containsValueForKey:@"com.apple.MediaGroups.properties"])
    {
      id v20 = (void *)MEMORY[0x263EFFA08];
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), v6, 0);
      uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"com.apple.MediaGroups.properties"];
      properties = v5->_properties;
      v5->_properties = (NSDictionary *)v24;
    }
    if (!v5->_identifier)
    {
      v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"com.apple.MediaGroups.identifier"];
      if (v26)
      {
        uint64_t v27 = +[MGGroupIdentifier groupIdentifierWithUUID:v26];
        v28 = v5->_identifier;
        v5->_identifier = (MGGroupIdentifier *)v27;
      }
    }
    if (!v5->_type || !v5->_identifier || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_31:
      uint64_t v39 = 0;
      goto LABEL_32;
    }
    uint64_t v29 = [(NSArray *)v5->_memberIdentifiers count];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = 0;
      v32 = 0;
      do
      {
        v33 = [(NSArray *)v5->_memberIdentifiers objectAtIndex:v31];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_super v34 = +[MGGroupIdentifier groupIdentifierWithUUID:v33];
            if (!v34) {
              goto LABEL_30;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (v35 = [MGGroupIdentifier alloc],
                  v36 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v33 resolvingAgainstBaseURL:1], objc_super v34 = -[MGGroupIdentifier initWithURLComponents:](v35, "initWithURLComponents:", v36), v36, !v34))
            {
LABEL_30:

              goto LABEL_31;
            }
          }
          if (!v32) {
            v32 = (void *)[(NSArray *)v5->_memberIdentifiers mutableCopy];
          }
          [v32 replaceObjectAtIndex:v31 withObject:v34];
        }
        ++v31;
      }
      while (v30 != v31);
      if (v32)
      {
        uint64_t v37 = [v32 copy];
        id v38 = v5->_memberIdentifiers;
        v5->_memberIdentifiers = (NSArray *)v37;
      }
    }
    else
    {
      v32 = 0;
    }
    if (!v5->_properties) {
      v5->_properties = (NSDictionary *)MEMORY[0x263EFFA78];
    }
  }
  uint64_t v39 = v5;
LABEL_32:

  return v39;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MGGroup *)self identifier];
  uint64_t v7 = [(MGGroup *)self name];
  v8 = [(MGGroup *)self properties];
  uint64_t v9 = [(MGGroup *)self memberIdentifiers];
  v10 = [v3 stringWithFormat:@"<%@: %p, _identifier = %@, _name = %@, _properties = %@, _members = %@>", v5, self, v6, v7, v8, v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MGGroup *)self type];
  [v4 encodeObject:v5 forKey:@"com.apple.MediaGroups.type"];

  uint64_t v6 = [(MGGroup *)self identifier];
  [v4 encodeObject:v6 forKey:@"com.apple.MediaGroups.identifier"];

  uint64_t v7 = [(MGGroup *)self name];
  [v4 encodeObject:v7 forKey:@"com.apple.MediaGroups.name"];

  v8 = [(MGGroup *)self memberIdentifiers];
  [v4 encodeObject:v8 forKey:@"com.apple.MediaGroups.members"];

  id v9 = [(MGGroup *)self properties];
  [v4 encodeObject:v9 forKey:@"com.apple.MediaGroups.properties"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)groupWithClientService:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [a1 type];
  [v13 createGroupWithType:v14 name:v12 members:v11 completion:v10];
}

+ (void)groupWithConnectionProvider:(id)a3 name:(id)a4 members:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() clientServiceWithConnectionProvider:v13];

  [a1 groupWithClientService:v14 name:v12 members:v11 completion:v10];
}

+ (void)groupWithName:(id)a3 members:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 anyObject];
  id v12 = [v11 service];

  if (v12)
  {
LABEL_12:
    [a1 groupWithClientService:v12 name:v8 members:v9 completion:v10];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v17), "service", (void)v19);
          if (v18)
          {
            id v12 = (void *)v18;

            goto LABEL_12;
          }
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }

    [a1 groupWithConnectionProvider:0 name:v8 members:v13 completion:v10];
  }
}

+ (id)validateGroupSpecificationWithType:(id)a3 identifier:(id)a4 name:(id)a5 properties:(id)a6 members:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a7;
  id v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v28 + 1) + 8 * i) identifier];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v14);
  }

  uint64_t v18 = [a1 type];
  char v19 = [v9 isEqual:v18];

  if ((v19 & 1) == 0)
  {
    uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"MGErrorDomain" code:2 userInfo:0];
    uint64_t v24 = MGLogForCategory(0);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)uint64_t v27 = 0;
    uint64_t v25 = "Group validation failure: type mismatch";
LABEL_19:
    _os_log_error_impl(&dword_222D6E000, v24, OS_LOG_TYPE_ERROR, v25, v27, 2u);
    goto LABEL_14;
  }
  uint64_t v20 = [v11 count];
  long long v21 = [MEMORY[0x263EFFA08] setWithArray:v11];
  uint64_t v22 = [v21 count];

  if (v20 == v22)
  {
    uint64_t v23 = 0;
    goto LABEL_15;
  }
  uint64_t v23 = [MEMORY[0x263F087E8] errorWithDomain:@"MGErrorDomain" code:5 userInfo:0];
  uint64_t v24 = MGLogForCategory(0);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v27 = 0;
    uint64_t v25 = "Group validation failure: duplicate members";
    goto LABEL_19;
  }
LABEL_14:

LABEL_15:
  return v23;
}

- (void)deleteWithClientService:(id)a3 completion:(id)a4
{
}

- (void)deleteWithConnectionProvider:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() clientServiceWithConnectionProvider:v7];

  [(MGGroup *)self deleteWithClientService:v8 completion:v6];
}

- (void)deleteWithCompletion:(id)a3
{
}

+ (id)type
{
  return @"com.apple.media-group";
}

- (void)forceSetClientService:(id)a3
{
}

- (id)predicateForMembers
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(MGGroup *)self memberIdentifiers];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) normalized];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"identifier IN %@", v3];

  return v10;
}

- (void)membersWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MGGroup *)self predicateForMembers];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  long long v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  objc_initWeak(&location, self);
  uint64_t v6 = [MGGroupQuery alloc];
  uint64_t v7 = [(MGGroup *)self service];
  id v8 = [v7 provider];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __33__MGGroup_membersWithCompletion___block_invoke;
  v12[3] = &unk_26466E870;
  objc_copyWeak(&v15, &location);
  id v9 = v4;
  id v13 = v9;
  long long v14 = &v17;
  uint64_t v10 = [(MGGroupQuery *)v6 initWithConnectionProvider:v8 predicate:v5 updateHandler:v12];
  id v11 = (void *)v18[5];
  v18[5] = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v17, 8);
}

void __33__MGGroup_membersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

- (BOOL)isSameGroup:(id)a3
{
  id v4 = a3;
  id v5 = [(MGGroup *)self identifier];
  uint64_t v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqual:v6];
  return (char)v4;
}

+ (id)predicateForGroup:(id)a3
{
  id v4 = [a3 identifier];
  id v5 = [a1 predicateForGroupIdentifier:v4];

  return v5;
}

+ (id)predicateForGroupIdentifier:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F08730];
  id v5 = a3;
  uint64_t v6 = [a1 predicateForType];
  v13[0] = v6;
  uint64_t v7 = (void *)MEMORY[0x263F08A98];
  id v8 = [v5 normalized];

  id v9 = [v7 predicateWithFormat:@"SELF.identifier = %@", v8];
  v13[1] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  id v11 = [v4 andPredicateWithSubpredicates:v10];

  return v11;
}

+ (id)predicateForType
{
  return (id)[MEMORY[0x263F08A98] predicateWithValue:1];
}

+ (id)predicateForCurrentDevice
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"($CURRENT_SOLO_GROUP != nil) && (SELF.identifier == $CURRENT_SOLO_GROUP.identifier)"];
}

+ (id)predicateForGroupsContainingGroup:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v4 = [a3 identifier];
  id v5 = [v4 normalized];

  uint64_t v6 = (void *)MEMORY[0x263F08730];
  uint64_t v7 = [a1 predicateForType];
  id v8 = [MEMORY[0x263F08A98] predicateWithFormat:@"$CONTAINMENT_MAP[%@] != nil", v5, v7];
  v14[1] = v8;
  id v9 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF.identifier != %@", v5];
  v14[2] = v9;
  uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"SUBQUERY($CONTAINMENT_MAP[%@], $container, SELF.identifier in $container)[SIZE] > 0", v5];
  v14[3] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];
  long long v12 = [v6 andPredicateWithSubpredicates:v11];

  return v12;
}

- (id)_conformingProtocols
{
  v2 = [MEMORY[0x263EFF9C0] set];
  uint64_t v3 = objc_opt_class();
  if (v3)
  {
    id v4 = (objc_class *)v3;
    do
    {
      unsigned int outCount = 0;
      id v5 = class_copyProtocolList(v4, &outCount);
      if (v5)
      {
        uint64_t v6 = v5;
        if (outCount)
        {
          for (unint64_t i = 0; i < outCount; ++i)
          {
            id v8 = NSStringFromProtocol(v6[i]);
            [v2 addObject:v8];
          }
        }
        free(v6);
      }
      id v4 = (objc_class *)[(objc_class *)v4 superclass];
    }
    while (v4);
  }
  id v9 = [MEMORY[0x263EFFA08] setWithSet:v2];

  return v9;
}

+ (id)predicateForGroupsConformingToProtocol:(id)a3
{
  uint64_t v3 = NSStringFromProtocol((Protocol *)a3);
  id v4 = [MEMORY[0x263F08A98] predicateWithFormat:@"%@ IN SELF._conformingProtocols", v3];

  return v4;
}

+ (id)clientServiceWithConnectionProvider:(id)a3
{
  return +[MGClientService clientServiceWithConnectionProvider:a3];
}

- (MGGroupIdentifier)identifier
{
  return self->_identifier;
}

- (NSArray)memberIdentifiers
{
  return self->_memberIdentifiers;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (MGClientService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_memberIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end