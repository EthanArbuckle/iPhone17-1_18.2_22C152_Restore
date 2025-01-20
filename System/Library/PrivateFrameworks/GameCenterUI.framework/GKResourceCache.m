@interface GKResourceCache
- (BOOL)evictsObjectsWhenApplicationEntersBackground;
- (BOOL)isGroupMember;
- (GKResourceCache)init;
- (GKResourceCache)initWithGroupOfCache:(id)a3;
- (NSCache)contents;
- (_GKASKResourceCacheGroup)group;
- (id)resourcesForKey:(id)a3;
- (unint64_t)limit;
- (void)addResource:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)removeAllResources;
- (void)removeResourcesForKey:(id)a3;
- (void)replaceResourcesForKey:(id)a3 withResource:(id)a4;
- (void)setEvictsObjectsWhenApplicationEntersBackground:(BOOL)a3;
- (void)setLimit:(unint64_t)a3;
@end

@implementation GKResourceCache

- (GKResourceCache)initWithGroupOfCache:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GKResourceCache;
  v5 = [(GKResourceCache *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      v6 = [v4 group];
    }
    else
    {
      v6 = objc_alloc_init(_GKASKResourceCacheGroup);
    }
    group = v5->_group;
    v5->_group = v6;

    uint64_t v8 = [(_GKASKResourceCacheGroup *)v5->_group makeMemberContents];
    contents = v5->_contents;
    v5->_contents = (NSCache *)v8;
  }
  return v5;
}

- (GKResourceCache)init
{
  return [(GKResourceCache *)self initWithGroupOfCache:0];
}

- (void)dealloc
{
  v3 = [(GKResourceCache *)self group];
  id v4 = [(GKResourceCache *)self contents];
  [v3 discardMemberContents:v4];

  v5.receiver = self;
  v5.super_class = (Class)GKResourceCache;
  [(GKResourceCache *)&v5 dealloc];
}

- (BOOL)isGroupMember
{
  v2 = [(GKResourceCache *)self group];
  char v3 = [v2 hasMultipleMembers];

  return v3;
}

- (unint64_t)limit
{
  v2 = [(GKResourceCache *)self contents];
  unint64_t v3 = [v2 countLimit];

  return v3;
}

- (void)setLimit:(unint64_t)a3
{
  id v4 = [(GKResourceCache *)self contents];
  [v4 setCountLimit:a3];
}

- (BOOL)evictsObjectsWhenApplicationEntersBackground
{
  v2 = [(GKResourceCache *)self contents];
  char v3 = [v2 evictsObjectsWhenApplicationEntersBackground];

  return v3;
}

- (void)setEvictsObjectsWhenApplicationEntersBackground:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GKResourceCache *)self contents];
  [v4 setEvictsObjectsWhenApplicationEntersBackground:v3];
}

- (id)resourcesForKey:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(GKResourceCache *)self group];
  int v6 = [v5 hasMultipleMembers];

  if (v6)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v7 = [(GKResourceCache *)self group];
    uint64_t v8 = [v7 snapshotMemberContents];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      objc_super v11 = 0;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKey:v4];
          if (v14)
          {
            if (v11) {
              [v11 addObjectsFromArray:v14];
            }
            else {
              objc_super v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v14];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
    else
    {
      objc_super v11 = 0;
    }
  }
  else
  {
    v15 = [(GKResourceCache *)self group];
    v16 = [v15 onlyMemberContents];

    objc_super v11 = [v16 objectForKey:v4];
  }

  return v11;
}

- (void)addResource:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(GKResourceCache *)self contents];
  uint64_t v8 = [v7 objectForKey:v6];

  if (!v8)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    uint64_t v9 = [(GKResourceCache *)self contents];
    [v9 setObject:v8 forKey:v6];
  }
  [v8 addObject:v10];
}

- (void)replaceResourcesForKey:(id)a3 withResource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(GKResourceCache *)self contents];
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v6, 0);

  [v9 setObject:v8 forKey:v7];
}

- (void)removeResourcesForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(GKResourceCache *)self contents];
  [v5 removeObjectForKey:v4];
}

- (void)removeAllResources
{
  id v2 = [(GKResourceCache *)self contents];
  [v2 removeAllObjects];
}

- (_GKASKResourceCacheGroup)group
{
  return self->_group;
}

- (NSCache)contents
{
  return self->_contents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end