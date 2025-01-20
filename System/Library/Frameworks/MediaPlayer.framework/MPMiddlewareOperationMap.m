@interface MPMiddlewareOperationMap
+ (id)mapForRequest:(id)a3;
- (id)_init;
- (id)allMiddleware;
- (id)allOperations;
- (id)operationsForMiddleware:(id)a3;
@end

@implementation MPMiddlewareOperationMap

+ (id)mapForRequest:(id)a3
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (id *)[objc_alloc((Class)a1) _init];
  uint64_t v6 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
  id v7 = v5[1];
  v5[1] = (id)v6;

  v8 = (void *)MEMORY[0x1E4F1CA48];
  v9 = [v4 middlewareClasses];
  uint64_t v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  id v11 = v5[2];
  v5[2] = (id)v10;

  v12 = (void *)MEMORY[0x1E4F1CA48];
  v13 = [v4 middlewareClasses];
  uint64_t v14 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
  id v15 = v5[3];
  v58 = v5;
  v5[3] = (id)v14;

  id v16 = objc_alloc(MEMORY[0x1E4F28E10]);
  v17 = [v4 middlewareClasses];
  v18 = objc_msgSend(v16, "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v17, "count"));

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v57 = v4;
  obuint64_t j = [v4 middlewareClasses];
  uint64_t v59 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
  if (v59)
  {
    uint64_t v55 = *(void *)v91;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v91 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = v19;
        id v20 = objc_alloc_init(*(Class *)(*((void *)&v90 + 1) + 8 * v19));
        v21 = [v20 operationsForRequest:v57];
        [v58[1] setObject:v21 forKey:v20];
        v61 = v20;
        [v58[2] addObject:v20];
        [v58[3] addObjectsFromArray:v21];
        long long v88 = 0u;
        long long v89 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id v68 = v21;
        uint64_t v22 = [v68 countByEnumeratingWithState:&v86 objects:v98 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v87;
          uint64_t v63 = *(void *)v87;
          do
          {
            uint64_t v25 = 0;
            id v66 = (id)v23;
            do
            {
              if (*(void *)v87 != v24) {
                objc_enumerationMutation(v68);
              }
              v26 = *(void **)(*((void *)&v86 + 1) + 8 * v25);
              if (objc_opt_respondsToSelector())
              {
                id v27 = v26;
                long long v82 = 0u;
                long long v83 = 0u;
                long long v84 = 0u;
                long long v85 = 0u;
                v28 = [v27 outputProtocols];
                uint64_t v29 = [v28 countByEnumeratingWithState:&v82 objects:v97 count:16];
                if (v29)
                {
                  uint64_t v30 = v29;
                  uint64_t v31 = *(void *)v83;
                  do
                  {
                    for (uint64_t i = 0; i != v30; ++i)
                    {
                      if (*(void *)v83 != v31) {
                        objc_enumerationMutation(v28);
                      }
                      uint64_t v33 = *(void *)(*((void *)&v82 + 1) + 8 * i);
                      v34 = [v18 objectForKey:v33];
                      if (!v34)
                      {
                        v34 = [MEMORY[0x1E4F1CA48] array];
                        [v18 setObject:v34 forKey:v33];
                      }
                      [v34 addObject:v27];
                    }
                    uint64_t v30 = [v28 countByEnumeratingWithState:&v82 objects:v97 count:16];
                  }
                  while (v30);
                }

                uint64_t v24 = v63;
                uint64_t v23 = (uint64_t)v66;
              }
              ++v25;
            }
            while (v25 != v23);
            uint64_t v23 = [v68 countByEnumeratingWithState:&v86 objects:v98 count:16];
          }
          while (v23);
        }

        uint64_t v19 = v62 + 1;
      }
      while (v62 + 1 != v59);
      uint64_t v59 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
    }
    while (v59);
  }

  if ([v18 count])
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v35 = v58[3];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v78 objects:v96 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v79;
      id v60 = v35;
      uint64_t v56 = *(void *)v79;
      do
      {
        uint64_t v39 = 0;
        uint64_t v64 = v37;
        do
        {
          if (*(void *)v79 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v78 + 1) + 8 * v39);
          if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
          {
            uint64_t v65 = v39;
            id v41 = v40;
            v42 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v67 = [v41 inputProtocols];
            uint64_t v43 = [v67 countByEnumeratingWithState:&v74 objects:v95 count:16];
            if (v43)
            {
              uint64_t v44 = v43;
              id v69 = *(id *)v75;
              do
              {
                for (uint64_t j = 0; j != v44; ++j)
                {
                  if (*(id *)v75 != v69) {
                    objc_enumerationMutation(v67);
                  }
                  uint64_t v46 = *(void *)(*((void *)&v74 + 1) + 8 * j);
                  v47 = [v18 objectForKey:v46];
                  if (v47)
                  {
                    [v42 setObject:v47 forKey:v46];
                    long long v72 = 0u;
                    long long v73 = 0u;
                    long long v70 = 0u;
                    long long v71 = 0u;
                    id v48 = v47;
                    uint64_t v49 = [v48 countByEnumeratingWithState:&v70 objects:v94 count:16];
                    if (v49)
                    {
                      uint64_t v50 = v49;
                      uint64_t v51 = *(void *)v71;
                      do
                      {
                        for (uint64_t k = 0; k != v50; ++k)
                        {
                          if (*(void *)v71 != v51) {
                            objc_enumerationMutation(v48);
                          }
                          [v41 addDependency:*(void *)(*((void *)&v70 + 1) + 8 * k)];
                        }
                        uint64_t v50 = [v48 countByEnumeratingWithState:&v70 objects:v94 count:16];
                      }
                      while (v50);
                    }

                    [v41 setInputOperations:v42];
                  }
                }
                uint64_t v44 = [v67 countByEnumeratingWithState:&v74 objects:v95 count:16];
              }
              while (v44);
            }

            id v35 = v60;
            uint64_t v38 = v56;
            uint64_t v37 = v64;
            uint64_t v39 = v65;
          }
          ++v39;
        }
        while (v39 != v37);
        uint64_t v37 = [v35 countByEnumeratingWithState:&v78 objects:v96 count:16];
      }
      while (v37);
    }
  }

  return v58;
}

- (id)operationsForMiddleware:(id)a3
{
  return [(NSMapTable *)self->_middlewareOperationMap objectForKey:a3];
}

- (id)allMiddleware
{
  return self->_middleware;
}

- (id)allOperations
{
  return self->_operations;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPMiddlewareOperationMap;
  return [(MPMiddlewareOperationMap *)&v3 init];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_middleware, 0);

  objc_storeStrong((id *)&self->_middlewareOperationMap, 0);
}

@end