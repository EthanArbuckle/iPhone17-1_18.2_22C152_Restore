@interface DKReportPlanner
+ (DKReportPlanner)plannerWithReportGeneratorRegistry:(id)a3;
- (DKReportPlanner)initWithReportGeneratorRegistry:(id)a3;
- (DKReporterRegistry)registry;
- (id)_resolveComponentIdentityManifest:(id)a3;
- (id)requestGroupsForPredicateManifest:(id)a3;
- (void)setRegistry:(id)a3;
@end

@implementation DKReportPlanner

+ (DKReportPlanner)plannerWithReportGeneratorRegistry:(id)a3
{
  id v3 = a3;
  v4 = [[DKReportPlanner alloc] initWithReportGeneratorRegistry:v3];

  return v4;
}

- (DKReportPlanner)initWithReportGeneratorRegistry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DKReportPlanner;
  v6 = [(DKReportPlanner *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_registry, a3);
  }

  return v7;
}

- (id)requestGroupsForPredicateManifest:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v22 = [MEMORY[0x263EFF980] array];
  v24 = self;
  v20 = v4;
  [(DKReportPlanner *)self _resolveComponentIdentityManifest:v4];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v25)
  {
    uint64_t v23 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v32 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v7 = [(DKReportPlanner *)v24 registry];
        v8 = [v7 generatorForComponentIdentity:v6];

        if (v8)
        {
          uint64_t v26 = i;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v9 = v22;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v28;
LABEL_9:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v28 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v27 + 1) + 8 * v13);
              v15 = [v14 requestLookupByGenerator];
              v16 = [v15 allKeys];
              unint64_t v17 = [v16 count];

              if (v17 <= 3 && ([v14 addComponentIdentity:v6 usingGenerator:v8] & 1) != 0) {
                break;
              }
              if (v11 == ++v13)
              {
                uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v35 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                goto LABEL_16;
              }
            }
          }
          else
          {
LABEL_16:

            v18 = objc_opt_new();
            [v18 addComponentIdentity:v6 usingGenerator:v8];
            [v9 addObject:v18];
            id v9 = v18;
          }

          uint64_t i = v26;
        }
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v25);
  }

  return v22;
}

- (id)_resolveComponentIdentityManifest:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9C0] set];
  uint64_t v6 = [(DKReportPlanner *)self registry];
  v7 = [v6 components];
  v8 = (void *)[v7 mutableCopy];

  if (v4)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = v4;
    id obj = v4;
    uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          uint64_t v10 = v5;
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v8, "count", v20));
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v13 = v8;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                if ([v11 matchesComponentIdentity:v18]) {
                  [v12 addObject:v18];
                }
              }
              uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v15);
          }

          [v13 minusSet:v12];
          id v5 = v10;
          [v10 unionSet:v12];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v23);
    }

    id v4 = v20;
  }
  else
  {
    [v5 unionSet:v8];
  }

  return v5;
}

- (DKReporterRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end