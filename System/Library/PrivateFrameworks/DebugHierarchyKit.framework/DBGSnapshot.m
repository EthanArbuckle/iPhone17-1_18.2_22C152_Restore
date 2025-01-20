@interface DBGSnapshot
- (DBGSnapshot)init;
- (DBGSnapshotManager)snapshotManager;
- (NSArray)rootLevelSnapshotGroups;
- (NSMapTable)identifierToNodeMap;
- (NSMutableArray)rootLevelGroups;
- (NSString)identifier;
- (id)_recursivelyDescribeGroup:(id)a3 withIndentation:(unint64_t)a4 isAdditonalGroup:(BOOL)a5 includeProperties:(BOOL)a6;
- (id)_recursivelyDescribeNode:(id)a3 withIndentation:(unint64_t)a4 includeProperties:(BOOL)a5;
- (id)debugDescription;
- (id)nodesKindOfRuntimeClass:(id)a3;
- (id)nodesMatchingPredicate:(id)a3;
- (id)recursiveDescriptionIncludingProperties:(BOOL)a3;
- (id)rootLevelSnapshotGroupWithIdentifier:(id)a3;
- (void)addRootLevelGroup:(id)a3;
- (void)clearData;
- (void)setRootLevelGroups:(id)a3;
- (void)setSnapshotManager:(id)a3;
@end

@implementation DBGSnapshot

- (DBGSnapshot)init
{
  v11.receiver = self;
  v11.super_class = (Class)DBGSnapshot;
  v2 = [(DBGSnapshot *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableArray array];
    rootLevelGroups = v2->_rootLevelGroups;
    v2->_rootLevelGroups = (NSMutableArray *)v3;

    uint64_t v5 = +[NSMapTable strongToWeakObjectsMapTable];
    identifierToNodeMap = v2->_identifierToNodeMap;
    v2->_identifierToNodeMap = (NSMapTable *)v5;

    v7 = +[NSUUID UUID];
    uint64_t v8 = [v7 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v8;
  }
  return v2;
}

- (void)addRootLevelGroup:(id)a3
{
  id v4 = a3;
  [(DBGSnapshot *)self willChangeValueForKey:@"rootLevelSnapshotGroups"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [(DBGSnapshot *)self rootLevelGroups];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = [*(id *)(*((void *)&v14 + 1) + 8 * v9) groupingIdentifier];
      objc_super v11 = [v4 groupingIdentifier];
      unsigned __int8 v12 = [v10 isEqualToString:v11];

      if (v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  [v4 setSnapshot:self];
  v13 = [(DBGSnapshot *)self rootLevelGroups];
  [v13 addObject:v4];

  [(DBGSnapshot *)self didChangeValueForKey:@"rootLevelSnapshotGroups"];
}

- (void)clearData
{
  [(DBGSnapshot *)self willChangeValueForKey:@"rootLevelSnapshotGroups"];
  uint64_t v3 = [(DBGSnapshot *)self rootLevelGroups];
  [v3 removeAllObjects];

  [(DBGSnapshot *)self didChangeValueForKey:@"rootLevelSnapshotGroups"];
}

- (id)nodesMatchingPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [(DBGSnapshot *)self identifierToNodeMap];
  id v7 = [v6 objectEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([v4 evaluateWithObject:v12]) {
          [v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  id v13 = [v5 copy];

  return v13;
}

- (id)nodesKindOfRuntimeClass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSMutableArray array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = [(DBGSnapshot *)self identifierToNodeMap];
  id v7 = [v6 objectEnumerator];

  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 runtimeType];
        unsigned int v14 = [v13 isKindOfTypeWithName:v4];

        if (v14) {
          [v5 addObject:v12];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  id v15 = [v5 copy];

  return v15;
}

- (id)rootLevelSnapshotGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(DBGSnapshot *)self rootLevelSnapshotGroups];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    objc_super v11 = v8;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      id v8 = *(id *)(*((void *)&v15 + 1) + 8 * (void)v10);

      uint64_t v12 = [v8 groupingIdentifier];
      unsigned __int8 v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }
      uint64_t v10 = (char *)v10 + 1;
      objc_super v11 = v8;
      if (v7 == v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    id v8 = 0;
  }

  return v8;
}

- (NSArray)rootLevelSnapshotGroups
{
  v2 = [(DBGSnapshot *)self rootLevelGroups];
  id v3 = [v2 copy];

  return (NSArray *)v3;
}

- (id)debugDescription
{
  return [(DBGSnapshot *)self recursiveDescriptionIncludingProperties:1];
}

- (id)recursiveDescriptionIncludingProperties:(BOOL)a3
{
  BOOL v3 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(DBGSnapshot *)self rootLevelGroups];
  id v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    id v8 = &stru_28750;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v8;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v11 = [(DBGSnapshot *)self _recursivelyDescribeGroup:*(void *)(*((void *)&v14 + 1) + 8 * (void)v9) withIndentation:0 isAdditonalGroup:0 includeProperties:v3];
        id v8 = +[NSString stringWithFormat:@"%@%@\n", v10, v11];

        uint64_t v9 = (char *)v9 + 1;
        uint64_t v10 = v8;
      }
      while (v6 != v9);
      id v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    id v8 = &stru_28750;
  }

  return v8;
}

- (id)_recursivelyDescribeGroup:(id)a3 withIndentation:(unint64_t)a4 isAdditonalGroup:(BOOL)a5 includeProperties:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v9 = a3;
  uint64_t v10 = [&stru_28750 stringByPaddingToLength:a4 withString:@"-" startingAtIndex:0];
  objc_super v11 = [v9 debugDescription];
  v22 = (void *)v10;
  uint64_t v12 = +[NSString stringWithFormat:@"%@%@", v10, v11];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v23 = v9;
  unsigned __int8 v13 = [v9 allObjects];
  id v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v26;
    unint64_t v17 = a4 + 1;
    do
    {
      long long v18 = 0;
      long long v19 = v12;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        if (v7)
        {
          long long v20 = [*(id *)(*((void *)&v25 + 1) + 8 * (void)v18) debugDescriptionWithIndentationDepth:v17 prefix:@"(REFERENCE)" includeProperties:v6];
          +[NSString stringWithFormat:@"%@\n%@ #REFERENCE#", v19, v20];
        }
        else
        {
          long long v20 = [(DBGSnapshot *)self _recursivelyDescribeNode:*(void *)(*((void *)&v25 + 1) + 8 * (void)v18) withIndentation:v17 includeProperties:v6];
          +[NSString stringWithFormat:@"%@\n%@", v19, v20];
        uint64_t v12 = };

        long long v18 = (char *)v18 + 1;
        long long v19 = v12;
      }
      while (v15 != v18);
      id v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  return v12;
}

- (id)_recursivelyDescribeNode:(id)a3 withIndentation:(unint64_t)a4 includeProperties:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [v8 debugDescriptionWithIndentationDepth:a4 prefix:0 includeProperties:v5];
  uint64_t v10 = [v8 childGroup];
  objc_super v11 = [v10 allObjects];
  id v12 = [v11 count];

  if (v12)
  {
    unsigned __int8 v13 = [v8 childGroup];
    id v14 = [(DBGSnapshot *)self _recursivelyDescribeGroup:v13 withIndentation:a4 + 1 isAdditonalGroup:0 includeProperties:v5];

    uint64_t v15 = +[NSString stringWithFormat:@"%@\n%@", v9, v14];

    id v9 = (void *)v15;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = v8;
  id obj = [v8 additionalGroups];
  id v16 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v29;
    unint64_t v19 = a4 + 1;
    do
    {
      long long v20 = 0;
      v21 = v9;
      do
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(obj);
        }
        [(DBGSnapshot *)self _recursivelyDescribeGroup:*(void *)(*((void *)&v28 + 1) + 8 * (void)v20) withIndentation:v19 isAdditonalGroup:1 includeProperties:v5];
        v22 = self;
        v24 = BOOL v23 = v5;
        id v9 = +[NSString stringWithFormat:@"%@\n%@", v21, v24];

        BOOL v5 = v23;
        self = v22;
        long long v20 = (char *)v20 + 1;
        v21 = v9;
      }
      while (v17 != v20);
      id v17 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v17);
  }

  return v9;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSMapTable)identifierToNodeMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)rootLevelGroups
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRootLevelGroups:(id)a3
{
}

- (DBGSnapshotManager)snapshotManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshotManager);

  return (DBGSnapshotManager *)WeakRetained;
}

- (void)setSnapshotManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_snapshotManager);
  objc_storeStrong((id *)&self->_rootLevelGroups, 0);
  objc_storeStrong((id *)&self->_identifierToNodeMap, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end