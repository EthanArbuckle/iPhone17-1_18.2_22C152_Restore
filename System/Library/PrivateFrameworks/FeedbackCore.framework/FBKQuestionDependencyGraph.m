@interface FBKQuestionDependencyGraph
- (BOOL)visibilityForQuestion:(id)a3 inFormResponse:(id)a4;
- (FBKBugForm)bugForm;
- (FBKQuestionDependencyGraph)initWithBugForm:(id)a3;
- (NSDictionary)nodes;
- (NSMapTable)tatToQuestionMap;
- (id)dependencyNodeForQuestion:(id)a3;
- (id)questionsDependentOnQuestion:(id)a3;
- (void)setBugForm:(id)a3;
- (void)setNodes:(id)a3;
- (void)setTatToQuestionMap:(id)a3;
@end

@implementation FBKQuestionDependencyGraph

- (FBKQuestionDependencyGraph)initWithBugForm:(id)a3
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v91.receiver = self;
  v91.super_class = (Class)FBKQuestionDependencyGraph;
  v6 = [(FBKQuestionDependencyGraph *)&v91 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bugForm, a3);
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    v8 = [v5 questionGroups];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v87 objects:v98 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v88 != v12) {
            objc_enumerationMutation(v8);
          }
          v14 = [*(id *)(*((void *)&v87 + 1) + 8 * i) questions];
          v11 += [v14 count];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v87 objects:v98 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v11 = 0;
    }

    uint64_t v15 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0x10000 valueOptions:5 capacity:v11];
    tatToQuestionMap = v7->_tatToQuestionMap;
    v7->_tatToQuestionMap = (NSMapTable *)v15;

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v53 = v5;
    obuint64_t j = [v5 questionGroups];
    uint64_t v60 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
    if (v60)
    {
      uint64_t v57 = *(void *)v84;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v84 != v57) {
            objc_enumerationMutation(obj);
          }
          v18 = *(void **)(*((void *)&v83 + 1) + 8 * j);
          long long v79 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          v19 = [v18 questions];
          uint64_t v20 = [v19 countByEnumeratingWithState:&v79 objects:v96 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v80;
            do
            {
              for (uint64_t k = 0; k != v21; ++k)
              {
                if (*(void *)v80 != v22) {
                  objc_enumerationMutation(v19);
                }
                v24 = *(void **)(*((void *)&v79 + 1) + 8 * k);
                v25 = v7->_tatToQuestionMap;
                v26 = [v24 role];
                [(NSMapTable *)v25 setObject:v24 forKey:v26];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v79 objects:v96 count:16];
            }
            while (v21);
          }
        }
        uint64_t v60 = [obj countByEnumeratingWithState:&v83 objects:v97 count:16];
      }
      while (v60);
    }

    v27 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v11];
    long long v75 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id obja = [v53 questionGroups];
    uint64_t v61 = [obja countByEnumeratingWithState:&v75 objects:v95 count:16];
    if (v61)
    {
      uint64_t v58 = *(void *)v76;
      do
      {
        for (uint64_t m = 0; m != v61; ++m)
        {
          if (*(void *)v76 != v58) {
            objc_enumerationMutation(obja);
          }
          v29 = *(void **)(*((void *)&v75 + 1) + 8 * m);
          long long v71 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          v30 = [v29 questions];
          uint64_t v31 = [v30 countByEnumeratingWithState:&v71 objects:v94 count:16];
          if (v31)
          {
            uint64_t v32 = v31;
            uint64_t v33 = *(void *)v72;
            do
            {
              for (uint64_t n = 0; n != v32; ++n)
              {
                if (*(void *)v72 != v33) {
                  objc_enumerationMutation(v30);
                }
                v35 = *(void **)(*((void *)&v71 + 1) + 8 * n);
                v36 = [[FBKQuestionDependencyNode alloc] initWithQuestion:v35];
                [(FBKQuestionDependencyNode *)v36 setGraph:v7];
                v37 = [v35 ID];
                [v27 setObject:v36 forKey:v37];
              }
              uint64_t v32 = [v30 countByEnumeratingWithState:&v71 objects:v94 count:16];
            }
            while (v32);
          }
        }
        uint64_t v61 = [obja countByEnumeratingWithState:&v75 objects:v95 count:16];
      }
      while (v61);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v38 = v27;
    uint64_t v59 = [v38 countByEnumeratingWithState:&v67 objects:v93 count:16];
    if (v59)
    {
      id objb = *(id *)v68;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(id *)v68 != objb) {
            objc_enumerationMutation(v38);
          }
          uint64_t v62 = v39;
          v40 = [v38 objectForKey:*(void *)(*((void *)&v67 + 1) + 8 * v39)];
          long long v63 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          v41 = [v40 dependencyTats];
          uint64_t v42 = [v41 countByEnumeratingWithState:&v63 objects:v92 count:16];
          if (v42)
          {
            uint64_t v43 = v42;
            uint64_t v44 = *(void *)v64;
            do
            {
              for (iuint64_t i = 0; ii != v43; ++ii)
              {
                if (*(void *)v64 != v44) {
                  objc_enumerationMutation(v41);
                }
                v46 = [(NSMapTable *)v7->_tatToQuestionMap objectForKey:*(void *)(*((void *)&v63 + 1) + 8 * ii)];
                v47 = v46;
                if (v46)
                {
                  v48 = [v46 ID];
                  v49 = [v38 objectForKey:v48];

                  [v49 registerDependentChild:v40];
                }
              }
              uint64_t v43 = [v41 countByEnumeratingWithState:&v63 objects:v92 count:16];
            }
            while (v43);
          }

          uint64_t v39 = v62 + 1;
        }
        while (v62 + 1 != v59);
        uint64_t v59 = [v38 countByEnumeratingWithState:&v67 objects:v93 count:16];
      }
      while (v59);
    }

    uint64_t v50 = [v38 copy];
    nodes = v7->_nodes;
    v7->_nodes = (NSDictionary *)v50;

    id v5 = v53;
  }

  return v7;
}

- (id)dependencyNodeForQuestion:(id)a3
{
  id v4 = a3;
  id v5 = [(FBKQuestionDependencyGraph *)self nodes];
  v6 = [v4 ID];

  v7 = [v5 objectForKey:v6];

  return v7;
}

- (BOOL)visibilityForQuestion:(id)a3 inFormResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 visible])
  {
    if ([v6 isConditional])
    {
      v8 = [(FBKQuestionDependencyGraph *)self dependencyNodeForQuestion:v6];
      uint64_t v9 = v8;
      if (v8) {
        char v10 = [v8 isVisibleInFormResponse:v7];
      }
      else {
        char v10 = 1;
      }
    }
    else
    {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)questionsDependentOnQuestion:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(FBKQuestionDependencyGraph *)self nodes];
  id v6 = [v4 ID];
  id v7 = [v5 objectForKey:v6];

  if (v7)
  {
    uint64_t v31 = v4;
    v8 = [v7 dependentChildren];
    uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v16 = [(FBKQuestionDependencyGraph *)self tatToQuestionMap];
          v17 = [v15 tat];
          v18 = [v16 objectForKey:v17];

          if (v18) {
            [v9 addObject:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v12);
    }

    id v4 = v31;
    v19 = [v31 role];
    int v20 = [v19 isEqualToString:@":area"];

    if (v20)
    {
      uint64_t v21 = [(FBKQuestionDependencyGraph *)self tatToQuestionMap];
      uint64_t v22 = [v21 dictionaryRepresentation];
      uint64_t v23 = [v22 count];
      v24 = [(FBKQuestionDependencyGraph *)self tatToQuestionMap];
      uint64_t v25 = [v24 count];

      if (v23 != v25)
      {
        v26 = +[FBKLog appHandle];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[FBKQuestionDependencyGraph questionsDependentOnQuestion:](v9, v26);
        }

        v27 = +[FBKLog appHandle];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[FBKQuestionDependencyGraph questionsDependentOnQuestion:](self, v27);
        }

        v28 = +[FBKLog appHandle];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
          -[FBKQuestionDependencyGraph questionsDependentOnQuestion:](v28);
        }

        id v4 = v31;
      }
    }
    v29 = (void *)[v9 copy];
  }
  else
  {
    v29 = [MEMORY[0x263EFFA08] set];
  }

  return v29;
}

- (FBKBugForm)bugForm
{
  return (FBKBugForm *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBugForm:(id)a3
{
}

- (NSMapTable)tatToQuestionMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTatToQuestionMap:(id)a3
{
}

- (NSDictionary)nodes
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_tatToQuestionMap, 0);

  objc_storeStrong((id *)&self->_bugForm, 0);
}

- (void)questionsDependentOnQuestion:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22A36D000, log, OS_LOG_TYPE_FAULT, "Area question has less than 5 dependent questions. This is likely a bug in the application.", v1, 2u);
}

- (void)questionsDependentOnQuestion:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [a1 tatToQuestionMap];
  id v5 = [v4 dictionaryRepresentation];
  uint64_t v6 = [v5 count];
  id v7 = [a1 tatToQuestionMap];
  int v8 = 134218240;
  uint64_t v9 = v6;
  __int16 v10 = 2048;
  uint64_t v11 = v7;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "tatToQuestionMap has %lu keys, but %lu items", (uint8_t *)&v8, 0x16u);
}

- (void)questionsDependentOnQuestion:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 valueForKey:@"role"];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Dependency graph may have issue. Area question resulted in in following tats being added: %{public}@", (uint8_t *)&v4, 0xCu);
}

@end