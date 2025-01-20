@interface _MLCANEDomTree
+ (id)computeDominationForGraph:(id)a3;
+ (id)computeDominationForGraphImpl:(id)a3;
+ (void)computeDominationForLayer:(id)a3 dominationTree:(id)a4;
- (BOOL)doesLayer:(id)a3 dominates:(id)a4;
- (BOOL)doesLayer:(id)a3 dominatesSubgraph:(id)a4;
- (BOOL)doesSubgraph:(id)a3 dominatesLayer:(id)a4;
- (BOOL)doesSubgraph:(id)a3 dominatesSubgraph:(id)a4;
- (NSDictionary)dominationTree;
- (id)getDominanceFrontierForSubgraph:(id)a3;
- (id)getPostDominanceFrontierForSubgraph:(id)a3;
- (id)initDomTree:(id)a3;
@end

@implementation _MLCANEDomTree

+ (id)computeDominationForGraph:(id)a3
{
  v4 = +[_MLCANEDomTree computeDominationForGraphImpl:a3];
  v5 = (void *)[objc_alloc((Class)a1) initDomTree:v4];

  return v5;
}

- (BOOL)doesLayer:(id)a3 dominates:(id)a4
{
  id v6 = a3;
  if (v6 == a4)
  {
    char v11 = 1;
  }
  else
  {
    id v7 = a4;
    v8 = [(_MLCANEDomTree *)self dominationTree];
    v9 = [v7 key];

    v10 = [v8 objectForKeyedSubscript:v9];

    if (v10) {
      char v11 = [v10 containsObject:v6];
    }
    else {
      char v11 = 0;
    }
  }
  return v11;
}

- (BOOL)doesLayer:(id)a3 dominatesSubgraph:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = a4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (-[_MLCANEDomTree doesLayer:dominates:](self, "doesLayer:dominates:", v6, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          BOOL v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)doesSubgraph:(id)a3 dominatesLayer:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (-[_MLCANEDomTree doesLayer:dominates:](self, "doesLayer:dominates:", *(void *)(*((void *)&v15 + 1) + 8 * i), v7, (void)v15))
        {
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)doesSubgraph:(id)a3 dominatesSubgraph:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v39;
    uint64_t v25 = *(void *)v39;
    do
    {
      uint64_t v11 = 0;
      uint64_t v26 = v9;
      do
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v8);
        }
        BOOL v12 = *(void **)(*((void *)&v38 + 1) + 8 * v11);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        BOOL v13 = [v12 resultTensors];
        uint64_t v28 = [v13 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v28)
        {
          uint64_t v14 = *(void *)v35;
          v29 = v13;
          uint64_t v27 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v35 != v14) {
                objc_enumerationMutation(v13);
              }
              long long v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              long long v33 = 0u;
              long long v17 = [v16 childLayers];
              uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v31;
                while (2)
                {
                  for (uint64_t j = 0; j != v19; ++j)
                  {
                    if (*(void *)v31 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * j);
                    if (([v8 containsObject:v22] & 1) == 0
                      && [(_MLCANEDomTree *)self doesLayer:v22 dominatesSubgraph:v7])
                    {

                      BOOL v23 = 1;
                      goto LABEL_27;
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
                  if (v19) {
                    continue;
                  }
                  break;
                }
              }

              BOOL v13 = v29;
              uint64_t v14 = v27;
            }
            uint64_t v10 = v25;
            uint64_t v28 = [v29 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v28);
        }

        ++v11;
      }
      while (v11 != v26);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v44 count:16];
      BOOL v23 = 0;
    }
    while (v9);
  }
  else
  {
    BOOL v23 = 0;
  }
LABEL_27:

  return v23;
}

- (id)getDominanceFrontierForSubgraph:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v21 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v33;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v5);
        }
        uint64_t v22 = v6;
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        objc_msgSend(v7, "sourceTensors", v20);
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(obj);
              }
              BOOL v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              long long v24 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              BOOL v13 = [v12 parentLayers];
              uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
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
                    if (([v5 containsObject:v18] & 1) == 0) {
                      [v4 addObject:v18];
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
                }
                while (v15);
              }
            }
            uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v21);
  }

  return v4;
}

- (id)getPostDominanceFrontierForSubgraph:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA80] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v21 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v33;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v5);
        }
        uint64_t v22 = v6;
        id v7 = *(void **)(*((void *)&v32 + 1) + 8 * v6);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        objc_msgSend(v7, "resultTensors", v20);
        obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v29 != v10) {
                objc_enumerationMutation(obj);
              }
              BOOL v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              long long v24 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              long long v27 = 0u;
              BOOL v13 = [v12 childLayers];
              uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
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
                    if (([v5 containsObject:v18] & 1) == 0) {
                      [v4 addObject:v18];
                    }
                  }
                  uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v36 count:16];
                }
                while (v15);
              }
            }
            uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v37 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v22 + 1;
      }
      while (v22 + 1 != v21);
      uint64_t v21 = [v5 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v21);
  }

  return v4;
}

+ (void)computeDominationForLayer:(id)a3 dominationTree:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 key];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v11 = [v6 sourceTensors];
    uint64_t v25 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v25)
    {
      uint64_t v12 = *(void *)v33;
      long long v27 = v11;
      uint64_t v24 = *(void *)v33;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v11);
          }
          uint64_t v26 = v13;
          uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * v13);
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          uint64_t v15 = objc_msgSend(v14, "parentLayers", v24);
          uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v29;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v29 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
                [v10 addObject:v20];
                [a1 computeDominationForLayer:v20 dominationTree:v7];
                uint64_t v21 = [v20 key];
                uint64_t v22 = [v7 objectForKeyedSubscript:v21];

                if (!v22)
                {

                  BOOL v23 = v27;
                  goto LABEL_19;
                }
                [v10 unionSet:v22];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          uint64_t v13 = v26 + 1;
          uint64_t v11 = v27;
          uint64_t v12 = v24;
        }
        while (v26 + 1 != v25);
        uint64_t v25 = [v27 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v25);
    }

    BOOL v23 = [v6 key];
    [v7 setObject:v10 forKeyedSubscript:v23];
LABEL_19:
  }
}

+ (id)computeDominationForGraphImpl:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[MEMORY[0x1E4F1CC08] mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "isLastLayer", (void)v13)) {
          [a1 computeDominationForLayer:v11 dominationTree:v5];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)initDomTree:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MLCANEDomTree;
  id v6 = [(_MLCANEDomTree *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_dominationTree, a3);
  }

  return v7;
}

- (NSDictionary)dominationTree
{
  return self->_dominationTree;
}

- (void).cxx_destruct
{
}

@end