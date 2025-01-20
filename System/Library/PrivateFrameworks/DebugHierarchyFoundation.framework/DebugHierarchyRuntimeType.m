@interface DebugHierarchyRuntimeType
+ (id)typeWithDictionaryRepresentation:(id)a3;
+ (id)typeWithName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfTypeWithName:(id)a3;
- (DebugHierarchyRuntimeType)initWithDictionaryRepresentation:(id)a3;
- (DebugHierarchyRuntimeType)initWithName:(id)a3;
- (DebugHierarchyRuntimeType)parentType;
- (NSArray)additionalGroupingIDs;
- (NSMutableDictionary)instanceProperties;
- (NSSet)subtypes;
- (NSString)childGroupingID;
- (NSString)moduleName;
- (NSString)name;
- (NSString)nameIncludingModules;
- (id)closestTypeVendingAChildGroupingID;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (id)namesOfInheritanceChain;
- (id)propertyWithName:(id)a3;
- (int64_t)sourceLanguage;
- (void)addInstanceProperty:(id)a3;
- (void)addSubtype:(id)a3;
- (void)setAdditionalGroupingIDs:(id)a3;
- (void)setChildGroupingID:(id)a3;
- (void)setModuleName:(id)a3;
- (void)setName:(id)a3;
- (void)setNameIncludingModules:(id)a3;
- (void)setParentType:(id)a3;
- (void)setSubtypes:(id)a3;
@end

@implementation DebugHierarchyRuntimeType

+ (id)typeWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithDictionaryRepresentation:v4];

  return v5;
}

- (DebugHierarchyRuntimeType)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)DebugHierarchyRuntimeType;
  id v5 = [(DebugHierarchyRuntimeType *)&v33 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"className"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 objectForKeyedSubscript:@"typeAndModuleName"];
    nameIncludingModules = v5->_nameIncludingModules;
    v5->_nameIncludingModules = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"moduleName"];
    moduleName = v5->_moduleName;
    v5->_moduleName = (NSString *)v10;

    v12 = [v4 objectForKeyedSubscript:@"subclasses"];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [[DebugHierarchyRuntimeType alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v29 + 1) + 8 * (void)v16)];
          [(DebugHierarchyRuntimeType *)v5 addSubtype:v17];

          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v14);
    }
    v18 = [v4 objectForKeyedSubscript:@"instanceProperties"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v19 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v26;
      do
      {
        v22 = 0;
        do
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [[DebugHierarchyProperty alloc] initWithPropertyDescription:*(void *)(*((void *)&v25 + 1) + 8 * (void)v22)];
          [(DebugHierarchyRuntimeType *)v5 addInstanceProperty:v23];

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v20);
    }
  }
  return v5;
}

+ (id)typeWithName:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithName:v4];

  return v5;
}

- (DebugHierarchyRuntimeType)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DebugHierarchyRuntimeType;
  uint64_t v6 = [(DebugHierarchyRuntimeType *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (void)addSubtype:(id)a3
{
  id v4 = a3;
  id v5 = [(DebugHierarchyRuntimeType *)self subtypes];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[NSSet set];
  }
  id v9 = v7;

  uint64_t v8 = [v9 setByAddingObject:v4];
  [(DebugHierarchyRuntimeType *)self setSubtypes:v8];

  [v4 setParentType:self];
}

- (BOOL)isKindOfTypeWithName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      id v7 = [v6 name];
      unsigned __int8 v8 = [v7 isEqualToString:v4];

      if (v8) {
        break;
      }
      uint64_t v9 = [v6 parentType];

      uint64_t v6 = (void *)v9;
    }
    while (v9);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)propertyWithName:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (v5)
  {
    do
    {
      uint64_t v6 = v5;
      id v7 = [(DebugHierarchyRuntimeType *)v5 instanceProperties];
      unsigned __int8 v8 = [v7 objectForKeyedSubscript:v4];

      id v5 = [(DebugHierarchyRuntimeType *)v6 parentType];
    }
    while (!v8 && v5);
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)namesOfInheritanceChain
{
  v2 = self;
  v3 = +[NSMutableArray array];
  if (v2)
  {
    do
    {
      id v4 = [(DebugHierarchyRuntimeType *)v2 name];
      [v3 addObject:v4];

      uint64_t v5 = [(DebugHierarchyRuntimeType *)v2 parentType];

      v2 = (DebugHierarchyRuntimeType *)v5;
    }
    while (v5);
  }
  id v6 = [v3 copy];

  return v6;
}

- (id)closestTypeVendingAChildGroupingID
{
  v2 = self;
  v3 = [(DebugHierarchyRuntimeType *)v2 childGroupingID];

  if (v2 && !v3)
  {
    do
    {
      id v4 = v2;
      v2 = [(DebugHierarchyRuntimeType *)v2 parentType];

      uint64_t v5 = [(DebugHierarchyRuntimeType *)v2 childGroupingID];
    }
    while (v2 && !v5);
  }
  return v2;
}

- (NSMutableDictionary)instanceProperties
{
  instanceProperties = self->_instanceProperties;
  if (!instanceProperties)
  {
    id v4 = +[NSMutableDictionary dictionary];
    uint64_t v5 = self->_instanceProperties;
    self->_instanceProperties = v4;

    instanceProperties = self->_instanceProperties;
  }
  return instanceProperties;
}

- (void)addInstanceProperty:(id)a3
{
  id v4 = a3;
  id v6 = [(DebugHierarchyRuntimeType *)self instanceProperties];
  uint64_t v5 = [v4 name];
  [v6 setObject:v4 forKeyedSubscript:v5];
}

- (int64_t)sourceLanguage
{
  v3 = [(DebugHierarchyRuntimeType *)self moduleName];
  if ([v3 length])
  {
    int64_t v4 = 2;
  }
  else
  {
    uint64_t v5 = [(DebugHierarchyRuntimeType *)self name];
    if ([v5 containsString:@"."]) {
      int64_t v4 = 2;
    }
    else {
      int64_t v4 = 1;
    }
  }
  return v4;
}

- (id)dictionaryRepresentation
{
  v3 = [(DebugHierarchyRuntimeType *)self subtypes];
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(DebugHierarchyRuntimeType *)self subtypes];
    id v6 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v7 = [(DebugHierarchyRuntimeType *)self subtypes];
    id v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v37;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v37 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        id v9 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = 0;
  }
  id v13 = +[NSMutableDictionary dictionaryWithCapacity:4];
  id v14 = [(DebugHierarchyRuntimeType *)self name];
  [v13 setObject:v14 forKeyedSubscript:@"className"];

  uint64_t v15 = [(DebugHierarchyRuntimeType *)self nameIncludingModules];

  if (v15)
  {
    v16 = [(DebugHierarchyRuntimeType *)self nameIncludingModules];
    [v13 setObject:v16 forKeyedSubscript:@"typeAndModuleName"];
  }
  v17 = [(DebugHierarchyRuntimeType *)self moduleName];

  if (v17)
  {
    v18 = [(DebugHierarchyRuntimeType *)self moduleName];
    [v13 setObject:v18 forKeyedSubscript:@"moduleName"];
  }
  if (v6)
  {
    id v19 = [v6 copy];
    [v13 setObject:v19 forKeyedSubscript:@"subclasses"];
  }
  id v20 = [(DebugHierarchyRuntimeType *)self instanceProperties];
  id v21 = [v20 count];

  if (v21)
  {
    v22 = +[NSMutableArray arrayWithCapacity:v21];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v23 = [(DebugHierarchyRuntimeType *)self instanceProperties];
    v24 = [v23 objectEnumerator];

    id v25 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v33;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v33 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) dictionaryRepresentation];
          if (v29) {
            [v22 addObject:v29];
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v26);
    }

    id v30 = [v22 copy];
    [v13 setObject:v30 forKeyedSubscript:@"instanceProperties"];
  }
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = v4;
  if (isKindOfClass)
  {
    id v7 = [(DebugHierarchyRuntimeType *)self name];
    id v8 = [v6 name];
    unsigned int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      uint64_t v10 = [(DebugHierarchyRuntimeType *)self moduleName];
      if (v10 || ([v6 moduleName], (id v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = [(DebugHierarchyRuntimeType *)self moduleName];
        v12 = [v6 moduleName];
        unsigned __int8 v13 = [v11 isEqualToString:v12];

        if (v10)
        {
LABEL_10:

          goto LABEL_11;
        }
      }
      else
      {
        unsigned __int8 v13 = 1;
      }

      goto LABEL_10;
    }
  }
  unsigned __int8 v13 = 0;
LABEL_11:

  return v13;
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(DebugHierarchyRuntimeType *)self name];
  id v6 = [(DebugHierarchyRuntimeType *)self instanceProperties];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p, represents: %@, properties: %lu>", v4, self, v5, [v6 count]);

  return v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
}

- (NSString)nameIncludingModules
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNameIncludingModules:(id)a3
{
}

- (NSString)moduleName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModuleName:(id)a3
{
}

- (DebugHierarchyRuntimeType)parentType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentType);
  return (DebugHierarchyRuntimeType *)WeakRetained;
}

- (void)setParentType:(id)a3
{
}

- (NSSet)subtypes
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSubtypes:(id)a3
{
}

- (NSString)childGroupingID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setChildGroupingID:(id)a3
{
}

- (NSArray)additionalGroupingIDs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAdditionalGroupingIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalGroupingIDs, 0);
  objc_storeStrong((id *)&self->_childGroupingID, 0);
  objc_storeStrong((id *)&self->_instanceProperties, 0);
  objc_storeStrong((id *)&self->_subtypes, 0);
  objc_destroyWeak((id *)&self->_parentType);
  objc_storeStrong((id *)&self->_moduleName, 0);
  objc_storeStrong((id *)&self->_nameIncludingModules, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end