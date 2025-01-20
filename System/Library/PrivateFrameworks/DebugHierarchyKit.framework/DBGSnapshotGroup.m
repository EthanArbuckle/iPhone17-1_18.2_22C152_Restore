@interface DBGSnapshotGroup
+ (id)strongObjectsGroupWithIdentifier:(id)a3;
+ (id)weakObjectsGroupWithIdentifier:(id)a3;
- (DBGSnapshot)snapshot;
- (DBGSnapshotGroup)initWithIdentifier:(id)a3 usingStrongChildNodeReferences:(BOOL)a4;
- (DBGSnapshotNode)parentNode;
- (NSArray)allObjects;
- (NSPointerArray)objects;
- (NSString)defaultDisplayName;
- (NSString)groupingIdentifier;
- (id)debugDescription;
- (id)displayName;
- (id)rootLevelGroup;
- (int64_t)fetchStatus;
- (void)addObject:(id)a3;
- (void)setDefaultDisplayName:(id)a3;
- (void)setFetchStatus:(int64_t)a3;
- (void)setParentNode:(id)a3;
- (void)setSnapshot:(id)a3;
@end

@implementation DBGSnapshotGroup

+ (id)strongObjectsGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4 usingStrongChildNodeReferences:1];

  return v5;
}

+ (id)weakObjectsGroupWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithIdentifier:v4 usingStrongChildNodeReferences:0];

  return v5;
}

- (DBGSnapshotGroup)initWithIdentifier:(id)a3 usingStrongChildNodeReferences:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DBGSnapshotGroup;
  v8 = [(DBGSnapshotGroup *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groupingIdentifier, a3);
    if (a4) {
      +[NSPointerArray strongObjectsPointerArray];
    }
    else {
    uint64_t v10 = +[NSPointerArray weakObjectsPointerArray];
    }
    objects = v9->_objects;
    v9->_objects = (NSPointerArray *)v10;
  }
  return v9;
}

- (void)addObject:(id)a3
{
  id v12 = a3;
  [(DBGSnapshotGroup *)self willChangeValueForKey:@"allObjects"];
  id v4 = [(DBGSnapshotGroup *)self snapshot];
  id v5 = [v4 identifierToNodeMap];
  v6 = [v12 identifier];
  [v5 setObject:v12 forKey:v6];

  id v7 = [(DBGSnapshotGroup *)self snapshot];
  [v12 setSnapshot:v7];

  v8 = [(DBGSnapshotGroup *)self parentNode];
  v9 = [v8 childGroup];

  if (v9 == self)
  {
    uint64_t v10 = [(DBGSnapshotGroup *)self parentNode];
    [v12 setParentNode:v10];
  }
  v11 = [(DBGSnapshotGroup *)self objects];
  objc_msgSend(v11, "dbg_addObject:", v12);

  [(DBGSnapshotGroup *)self didChangeValueForKey:@"allObjects"];
}

- (NSArray)allObjects
{
  v2 = [(DBGSnapshotGroup *)self objects];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (id)displayName
{
  v3 = [(DBGSnapshotGroup *)self defaultDisplayName];
  if (!v3)
  {
    id v4 = [(DBGSnapshotGroup *)self groupingIdentifier];
    id v5 = [v4 componentsSeparatedByString:@"."];
    v3 = [v5 lastObject];
  }

  return v3;
}

- (id)debugDescription
{
  v3 = [(DBGSnapshotGroup *)self description];
  id v4 = [(DBGSnapshotGroup *)self groupingIdentifier];
  id v5 = +[NSString stringWithFormat:@"%@ – %@", v3, v4];

  return v5;
}

- (id)rootLevelGroup
{
  v3 = [(DBGSnapshotGroup *)self parentNode];

  if (v3)
  {
    id v4 = [(DBGSnapshotGroup *)self parentNode];
    id v5 = [v4 rootLevelGroup];
  }
  else
  {
    id v5 = self;
  }

  return v5;
}

- (NSString)groupingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)defaultDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDefaultDisplayName:(id)a3
{
}

- (int64_t)fetchStatus
{
  return self->_fetchStatus;
}

- (void)setFetchStatus:(int64_t)a3
{
  self->_fetchStatus = a3;
}

- (DBGSnapshot)snapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_snapshot);

  return (DBGSnapshot *)WeakRetained;
}

- (void)setSnapshot:(id)a3
{
}

- (DBGSnapshotNode)parentNode
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNode);

  return (DBGSnapshotNode *)WeakRetained;
}

- (void)setParentNode:(id)a3
{
}

- (NSPointerArray)objects
{
  return (NSPointerArray *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_destroyWeak((id *)&self->_parentNode);
  objc_destroyWeak((id *)&self->_snapshot);
  objc_storeStrong((id *)&self->_defaultDisplayName, 0);

  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
}

@end