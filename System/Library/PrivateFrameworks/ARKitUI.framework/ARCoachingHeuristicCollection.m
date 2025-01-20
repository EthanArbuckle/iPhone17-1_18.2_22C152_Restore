@interface ARCoachingHeuristicCollection
- (ARCoachingHeuristicCollection)init;
- (int64_t)requirements;
- (void)addHeuristic:(id)a3;
- (void)clear;
- (void)updateWithFrame:(id)a3 cache:(id)a4;
@end

@implementation ARCoachingHeuristicCollection

- (ARCoachingHeuristicCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARCoachingHeuristicCollection;
  v2 = [(ARCoachingHeuristicCollection *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    heuristics = v2->_heuristics;
    v2->_heuristics = v3;
  }
  return v2;
}

- (int64_t)requirements
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_heuristics;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "requirements", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v27 = self;
  v8 = self->_heuristics;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v41 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v30;
    LODWORD(v13) = 1;
    *(void *)&long long v10 = 138544130;
    long long v25 = v10;
    uint64_t v26 = *(void *)v30;
    do
    {
      uint64_t v14 = 0;
      uint64_t v28 = v11;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v8);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        int v16 = objc_msgSend(v15, "satisfied", v25);
        [v15 updateWithFrame:v6 cache:v7];
        int v17 = [v15 satisfied];
        if (v16 != v17)
        {
          v18 = _ARLogCoaching_3();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v19 = (objc_class *)objc_opt_class();
            v20 = NSStringFromClass(v19);
            v21 = (objc_class *)objc_opt_class();
            uint64_t v22 = NSStringFromClass(v21);
            v23 = (void *)v22;
            *(_DWORD *)buf = v25;
            v24 = @"unsatisfied";
            if (v17) {
              v24 = @"satisfied";
            }
            v34 = v20;
            __int16 v35 = 2048;
            v36 = v27;
            uint64_t v12 = v26;
            __int16 v37 = 2112;
            uint64_t v38 = v22;
            __int16 v39 = 2112;
            v40 = v24;
            _os_log_impl(&dword_20B202000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Coaching heuristic %@ became %@", buf, 0x2Au);

            uint64_t v11 = v28;
          }
        }
        uint64_t v13 = v13 & v17;
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v29 objects:v41 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v13 = 1;
  }

  [(ARCoachingHeuristic *)v27 setSatisfied:v13];
}

- (void)addHeuristic:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSMutableArray *)self->_heuristics addObject:v4];
  int64_t v5 = _ARLogCoaching_3();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    int v10 = 138543874;
    uint64_t v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_20B202000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Added coaching heuristic %@", (uint8_t *)&v10, 0x20u);
  }
}

- (void)clear
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [(ARCoachingHeuristic *)self setSatisfied:0];
  [(NSMutableArray *)self->_heuristics removeAllObjects];
  uint64_t v3 = _ARLogCoaching_3();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    int64_t v5 = NSStringFromClass(v4);
    int v6 = 138543618;
    id v7 = v5;
    __int16 v8 = 2048;
    uint64_t v9 = self;
    _os_log_impl(&dword_20B202000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Cleared coaching heuristics", (uint8_t *)&v6, 0x16u);
  }
}

- (void).cxx_destruct
{
}

@end