@interface DebugHierarchyCrawler
+ (id)crawlerWithRequestContext:(id)a3 knownObjectsMap:(id)a4;
- (DebugHierarchyCrawler)initWithRequestContext:(id)a3 knownObjectsMap:(id)a4;
- (DebugHierarchyCrawlerOptions)options;
- (DebugHierarchyRequestActionExecutor)actionExecutor;
- (DebugHierarchyRequestExecutionContext)requestContext;
- (NSMapTable)knownObjectsMap;
- (id)_entryPointClasses;
- (void)crawlDebugHierarchyObject:(id)a3 inGroupWithID:(id)a4 asDirectChild:(BOOL)a5 belowParent:(id)a6 withParentDefinedVisibility:(int64_t)a7;
- (void)crawlEntryPointClasses;
- (void)enumerateDebugHierarchyObjects:(id)a3 inGroupWithID:(id)a4 options:(id)a5 asDirectChildren:(BOOL)a6 belowParent:(id)a7;
- (void)setActionExecutor:(id)a3;
- (void)setKnownObjectsMap:(id)a3;
- (void)setRequestContext:(id)a3;
@end

@implementation DebugHierarchyCrawler

+ (id)crawlerWithRequestContext:(id)a3 knownObjectsMap:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithRequestContext:v7 knownObjectsMap:v6];

  return v8;
}

- (DebugHierarchyCrawler)initWithRequestContext:(id)a3 knownObjectsMap:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DebugHierarchyCrawler;
  v9 = [(DebugHierarchyCrawler *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_knownObjectsMap, a4);
    objc_storeStrong((id *)&v10->_requestContext, a3);
  }

  return v10;
}

- (void)crawlEntryPointClasses
{
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(DebugHierarchyCrawler *)self _entryPointClasses];
  id v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v4 = +[DebugHierarchyEntryPointProtocolHelper debugHierarchyGroupingIDsOnClass:v3];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v5 = v4;
        id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v6)
        {
          uint64_t v7 = *(void *)v21;
          do
          {
            for (j = 0; j != v6; j = (char *)j + 1)
            {
              if (*(void *)v21 != v7) {
                objc_enumerationMutation(v5);
              }
              uint64_t v9 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
              v10 = [(DebugHierarchyCrawler *)self options];
              if (v10)
              {
                v11 = [(DebugHierarchyCrawler *)self options];
                unsigned int v12 = [v11 shouldCrawlGroupWithID:v9];

                if (!v12) {
                  continue;
                }
              }
              id v19 = 0;
              v13 = +[DebugHierarchyEntryPointProtocolHelper debugHierarchyObjectsInGroupWithID:v9 outOptions:&v19 onEntryPointClass:v3];
              id v14 = v19;
              [(DebugHierarchyCrawler *)self enumerateDebugHierarchyObjects:v13 inGroupWithID:v9 options:v14 asDirectChildren:1 belowParent:0];
            }
            id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v6);
        }
      }
      id v17 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v17);
  }
}

- (DebugHierarchyCrawlerOptions)options
{
  v2 = [(DebugHierarchyCrawler *)self requestContext];
  uint64_t v3 = [v2 request];
  v4 = [v3 crawlerOptions];

  return (DebugHierarchyCrawlerOptions *)v4;
}

- (void)enumerateDebugHierarchyObjects:(id)a3 inGroupWithID:(id)a4 options:(id)a5 asDirectChildren:(BOOL)a6 belowParent:(id)a7
{
  BOOL v8 = a6;
  id v21 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if ([v21 count])
  {
    v15 = [v13 objectForKeyedSubscript:@"visibilityImplementationDetail"];
    uint64_t v16 = [v13 objectForKeyedSubscript:@"visibilityAppleInternal"];
    id v17 = [v13 objectForKeyedSubscript:@"visibilityInvisible"];
    if ([v21 count])
    {
      unint64_t v18 = 0;
      do
      {
        id v19 = [v21 objectAtIndexedSubscript:v18];
        if (v13)
        {
          if ([v15 containsIndex:v18])
          {
            uint64_t v20 = 2;
          }
          else if ([v16 containsIndex:v18])
          {
            uint64_t v20 = 4;
          }
          else if ([v17 containsIndex:v18])
          {
            uint64_t v20 = 8;
          }
          else
          {
            uint64_t v20 = 1;
          }
        }
        else
        {
          uint64_t v20 = 1;
        }
        [(DebugHierarchyCrawler *)self crawlDebugHierarchyObject:v19 inGroupWithID:v12 asDirectChild:v8 belowParent:v14 withParentDefinedVisibility:v20];

        ++v18;
      }
      while ((unint64_t)[v21 count] > v18);
    }
  }
}

- (void)crawlDebugHierarchyObject:(id)a3 inGroupWithID:(id)a4 asDirectChild:(BOOL)a5 belowParent:(id)a6 withParentDefinedVisibility:(int64_t)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (v12)
  {
    v15 = (__CFString *)CFStringCreateWithFormat(0, 0, @"%p", v12);
    uint64_t v16 = [(DebugHierarchyCrawler *)self knownObjectsMap];
    [v16 setObject:v12 forKey:v15];
  }
  int64_t v17 = DebugHierarchyVisibilityForObject(v12, a7);
  unint64_t v18 = [(DebugHierarchyCrawler *)self requestContext];
  unsigned int v19 = [v18 hasAlreadyFetchedDebugHierarchyObject:v12];

  if (v19)
  {
    if (!v9)
    {
      uint64_t v20 = [(DebugHierarchyCrawler *)self requestContext];
      [v20 addReferencedDebugHierarchyObject:v12 withVisibility:v17 toGroupWithID:v13 asDirectChild:0 belowParent:v14];
    }
    goto LABEL_18;
  }
  uint64_t v21 = [(DebugHierarchyCrawler *)self options];
  if (v21)
  {
    long long v22 = (void *)v21;
    long long v23 = [(DebugHierarchyCrawler *)self options];
    unsigned int v24 = [v23 shouldCrawlObject:v12];

    if (v24) {
      uint64_t v25 = 4;
    }
    else {
      uint64_t v25 = 2;
    }
    long long v26 = [(DebugHierarchyCrawler *)self requestContext];
    [v26 addDebugHierarchyObject:v12 withVisibility:v17 fetchStatus:v25 toGroupWithID:v13 asDirectChild:v9 belowParent:v14];

    if (!v24) {
      goto LABEL_18;
    }
  }
  else
  {
    long long v27 = [(DebugHierarchyCrawler *)self requestContext];
    [v27 addDebugHierarchyObject:v12 withVisibility:v17 fetchStatus:4 toGroupWithID:v13 asDirectChild:v9 belowParent:v14];
  }
  v28 = [(DebugHierarchyCrawler *)self requestContext];
  v29 = (objc_class *)objc_opt_class();
  if (v29 && (v30 = v29, object_isClass(v29)))
  {
    v31 = NSStringFromClass(v30);
  }
  else
  {
    v31 = 0;
  }
  v32 = [v28 runtimeTypeWithName:v31];

  id v40 = 0;
  id v41 = 0;
  v33 = +[DebugHierarchyObjectProtocolHelper childObjectsForObject:v12 withType:v32 outGroupingID:&v41 outOptions:&v40];
  id v34 = v41;
  id v35 = v40;
  [(DebugHierarchyCrawler *)self enumerateDebugHierarchyObjects:v33 inGroupWithID:v34 options:v35 asDirectChildren:1 belowParent:v12];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __119__DebugHierarchyCrawler_crawlDebugHierarchyObject_inGroupWithID_asDirectChild_belowParent_withParentDefinedVisibility___block_invoke;
  v38[3] = &unk_242E0;
  v38[4] = self;
  id v36 = v12;
  id v39 = v36;
  +[DebugHierarchyObjectProtocolHelper enumerateAdditionalGroupsAndObjectsOfObject:v36 withType:v32 withBlock:v38];
  v37 = [(DebugHierarchyCrawler *)self actionExecutor];
  [v37 executeActionsWithObject:v36];

LABEL_18:
}

id __119__DebugHierarchyCrawler_crawlDebugHierarchyObject_inGroupWithID_asDirectChild_belowParent_withParentDefinedVisibility___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) enumerateDebugHierarchyObjects:a3 inGroupWithID:a2 options:a4 asDirectChildren:0 belowParent:*(void *)(a1 + 40)];
}

- (id)_entryPointClasses
{
  v2 = DebugHierarchyEntryPointClasses();
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
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (+[DebugHierarchyEntryPointProtocolHelper classImplementsRequiredEntryPointMethods:](DebugHierarchyEntryPointProtocolHelper, "classImplementsRequiredEntryPointMethods:", v9, (void)v12))
        {
          [v3 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 copy];
  return v10;
}

- (DebugHierarchyRequestActionExecutor)actionExecutor
{
  return (DebugHierarchyRequestActionExecutor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setActionExecutor:(id)a3
{
}

- (NSMapTable)knownObjectsMap
{
  return self->_knownObjectsMap;
}

- (void)setKnownObjectsMap:(id)a3
{
}

- (DebugHierarchyRequestExecutionContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionExecutor, 0);
  objc_storeStrong((id *)&self->_knownObjectsMap, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

@end