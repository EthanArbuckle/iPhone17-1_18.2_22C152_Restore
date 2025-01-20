@interface DebugHierarchyRuntimeInfo
+ (id)runtimeInfoWithSerializedRepresentation:(id)a3;
- (DebugHierarchyRuntimeInfo)init;
- (DebugHierarchyRuntimeInfo)initWithSerializedRepresentation:(id)a3;
- (NSMutableDictionary)typeMap;
- (id)_describeTreeWithRoot:(id)a3 depth:(unint64_t)a4 description:(id)a5;
- (id)_topLevelTypes;
- (id)debugDescription;
- (id)serializedRepresentation;
- (id)typeOfObject:(id)a3;
- (id)typeWithName:(id)a3;
- (void)_recursivelyIndexRuntimeType:(id)a3;
- (void)_recursivelyMergeInRuntimeType:(id)a3;
- (void)_reindexAllTypes;
- (void)addType:(id)a3 toParentType:(id)a4;
- (void)clearData;
- (void)mergeWith:(id)a3;
- (void)setTypeMap:(id)a3;
@end

@implementation DebugHierarchyRuntimeInfo

+ (id)runtimeInfoWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithSerializedRepresentation:v4];

  return v5;
}

- (DebugHierarchyRuntimeInfo)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(DebugHierarchyRuntimeInfo *)self init];
  if (v5)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = +[DebugHierarchyRuntimeType typeWithDictionaryRepresentation:](DebugHierarchyRuntimeType, "typeWithDictionaryRepresentation:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v10), (void)v13);
          [(DebugHierarchyRuntimeInfo *)v5 _recursivelyIndexRuntimeType:v11];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

- (DebugHierarchyRuntimeInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)DebugHierarchyRuntimeInfo;
  v2 = [(DebugHierarchyRuntimeInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    typeMap = v2->_typeMap;
    v2->_typeMap = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)addType:(id)a3 toParentType:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  id v7 = [(DebugHierarchyRuntimeInfo *)self typeMap];
  id v8 = [v9 name];
  [v7 setObject:v9 forKey:v8];

  [v6 addSubtype:v9];
}

- (id)typeWithName:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(DebugHierarchyRuntimeInfo *)self typeMap];
    id v6 = [v5 objectForKeyedSubscript:v4];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)typeOfObject:(id)a3
{
  id v4 = (objc_class *)objc_opt_class();
  id v5 = v4;
  if (v4)
  {
    if (object_isClass(v4))
    {
      NSStringFromClass(v5);
      id v5 = (objc_class *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = 0;
    }
  }
  if ([(objc_class *)v5 length])
  {
    id v6 = [(DebugHierarchyRuntimeInfo *)self typeMap];
    id v7 = [v6 objectForKeyedSubscript:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_reindexAllTypes
{
  uint64_t v3 = [(DebugHierarchyRuntimeInfo *)self _topLevelTypes];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(DebugHierarchyRuntimeInfo *)self _recursivelyIndexRuntimeType:*(void *)(*((void *)&v8 + 1) + 8 * (void)v7)];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_recursivelyIndexRuntimeType:(id)a3
{
  id v4 = a3;
  id v5 = [(DebugHierarchyRuntimeInfo *)self typeMap];
  uint64_t v6 = [v4 name];
  [v5 setObject:v4 forKeyedSubscript:v6];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = objc_msgSend(v4, "subtypes", 0);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(DebugHierarchyRuntimeInfo *)self _recursivelyIndexRuntimeType:*(void *)(*((void *)&v12 + 1) + 8 * (void)v11)];
        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)serializedRepresentation
{
  v2 = [(DebugHierarchyRuntimeInfo *)self _topLevelTypes];
  uint64_t v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "dictionaryRepresentation", (void)v12);
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];
  return v10;
}

- (id)_topLevelTypes
{
  uint64_t v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(DebugHierarchyRuntimeInfo *)self typeMap];
  id v5 = [v4 allValues];

  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        long long v11 = [v10 parentType];

        if (!v11) {
          [v3 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = [v3 copy];
  return v12;
}

- (void)mergeWith:(id)a3
{
  if (a3)
  {
    id v4 = [a3 _topLevelTypes];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [(DebugHierarchyRuntimeInfo *)self _recursivelyMergeInRuntimeType:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8)];
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
    [(DebugHierarchyRuntimeInfo *)self _reindexAllTypes];
  }
}

- (void)_recursivelyMergeInRuntimeType:(id)a3
{
  id v4 = a3;
  id v5 = [(DebugHierarchyRuntimeInfo *)self typeMap];
  id v6 = [v4 name];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = objc_msgSend(v4, "subtypes", 0);
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          [(DebugHierarchyRuntimeInfo *)self _recursivelyMergeInRuntimeType:*(void *)(*((void *)&v17 + 1) + 8 * (void)v12)];
          long long v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }
  }
  else
  {
    long long v13 = [(DebugHierarchyRuntimeInfo *)self typeMap];
    long long v14 = [v4 parentType];
    long long v15 = [v14 name];
    long long v16 = [v13 objectForKeyedSubscript:v15];

    [(DebugHierarchyRuntimeInfo *)self addType:v4 toParentType:v16];
  }
}

- (void)clearData
{
  id v2 = [(DebugHierarchyRuntimeInfo *)self typeMap];
  [v2 removeAllObjects];
}

- (id)debugDescription
{
  uint64_t v3 = [(DebugHierarchyRuntimeInfo *)self description];
  id v4 = [v3 stringByAppendingString:@"\n"];

  id v5 = [(DebugHierarchyRuntimeInfo *)self _topLevelTypes];
  id v6 = [v5 mutableCopy];

  if ((unint64_t)[v6 count] >= 2)
  {
    uint64_t v7 = +[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:1];
    v22 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v22 count:1];
    [v6 sortUsingDescriptors:v8];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      long long v13 = 0;
      long long v14 = v4;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v15 = -[DebugHierarchyRuntimeInfo _describeTreeWithRoot:depth:description:](self, "_describeTreeWithRoot:depth:description:", *(void *)(*((void *)&v17 + 1) + 8 * (void)v13), 0, &stru_29008, (void)v17);
        id v4 = [v14 stringByAppendingString:v15];

        long long v13 = (char *)v13 + 1;
        long long v14 = v4;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v4;
}

- (id)_describeTreeWithRoot:(id)a3 depth:(unint64_t)a4 description:(id)a5
{
  id v8 = a3;
  unint64_t v9 = a4 + 1;
  id v10 = a5;
  id v11 = [&stru_29008 stringByPaddingToLength:v9 withString:@"-" startingAtIndex:0];
  uint64_t v12 = [v8 debugDescription];
  long long v13 = +[NSString stringWithFormat:@"%@%@ %@\n", v10, v11, v12];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v14 = [v8 subtypes];
  id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      long long v18 = 0;
      long long v19 = v13;
      do
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v13 = [(DebugHierarchyRuntimeInfo *)self _describeTreeWithRoot:*(void *)(*((void *)&v21 + 1) + 8 * (void)v18) depth:v9 description:v19];

        long long v18 = (char *)v18 + 1;
        long long v19 = v13;
      }
      while (v16 != v18);
      id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v16);
  }

  return v13;
}

- (NSMutableDictionary)typeMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTypeMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end