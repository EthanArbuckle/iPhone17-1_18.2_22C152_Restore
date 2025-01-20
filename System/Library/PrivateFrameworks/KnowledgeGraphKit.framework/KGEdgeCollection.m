@interface KGEdgeCollection
- (id)allObjects;
- (void)enumerateEdgesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateEdgesUsingBlock:(id)a3;
- (void)enumerateElementsWithBatchSize:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateOrderedEdges:(id)a3 withBatchSize:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumeratePropertyValuesForKey:(id)a3 withBlock:(id)a4;
@end

@implementation KGEdgeCollection

- (void)enumeratePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(KGGraph *)self->super._graph implementation];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__KGEdgeCollection_enumeratePropertyValuesForKey_withBlock___block_invoke;
  v12[3] = &unk_1E68DC1F0;
  id v13 = v8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  [(KGElementCollection *)self enumerateElementIdentifierBatchesWithBatchSize:256 usingBlock:v12];
}

void __60__KGEdgeCollection_enumeratePropertyValuesForKey_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) propertiesForEdgesWithIdentifiers:a2 propertyName:*(void *)(a1 + 40) error:0];
  [v3 enumerateUsingBlock:*(void *)(a1 + 48)];
}

- (void)enumerateEdgesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  graph = self->super._graph;
  id v8 = a3;
  id v9 = [(KGGraph *)graph implementation];
  id v10 = [(KGElementCollection *)self identifiers];
  id v14 = 0;
  id v11 = [v9 edgeIdentifiers:v10 sortedByFloatPropertyForName:v8 ascending:1 limit:-1 error:&v14];

  id v12 = v14;
  if (v11)
  {
    [(KGEdgeCollection *)self enumerateOrderedEdges:v11 withBatchSize:256 usingBlock:v6];
  }
  else
  {
    id v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered edge identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateEdgesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  graph = self->super._graph;
  id v8 = a3;
  id v9 = [(KGGraph *)graph implementation];
  id v10 = [(KGElementCollection *)self identifiers];
  id v14 = 0;
  id v11 = [v9 edgeIdentifiers:v10 sortedByIntegerPropertyForName:v8 ascending:1 limit:-1 error:&v14];

  id v12 = v14;
  if (v11)
  {
    [(KGEdgeCollection *)self enumerateOrderedEdges:v11 withBatchSize:256 usingBlock:v6];
  }
  else
  {
    id v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered edge identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateEdgesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  graph = self->super._graph;
  id v8 = a3;
  id v9 = [(KGGraph *)graph implementation];
  id v10 = [(KGElementCollection *)self identifiers];
  id v14 = 0;
  id v11 = [v9 edgeIdentifiers:v10 sortedByStringPropertyForName:v8 ascending:1 limit:-1 error:&v14];

  id v12 = v14;
  if (v11)
  {
    [(KGEdgeCollection *)self enumerateOrderedEdges:v11 withBatchSize:256 usingBlock:v6];
  }
  else
  {
    id v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered edge identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateOrderedEdges:(id)a3 withBatchSize:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void, char *))a5;
  char v33 = 0;
  id v10 = [(KGGraph *)self->super._graph implementation];
  id v11 = [(KGGraph *)self->super._graph entityFactory];
  if ([v8 count])
  {
    unint64_t v12 = 0;
    id v13 = 0;
    v25 = v8;
    v26 = v10;
    v24 = v11;
    while (1)
    {
      id v14 = v13;
      context = (void *)MEMORY[0x1D25FA040]();
      unint64_t v15 = a4;
      id v16 = objc_msgSend(v8, "subarrayWithRange:", v12, a4);
      id v32 = v13;
      uint64_t v17 = [v10 orderedArrayOfEdgesWithIdentifiers:v16 entityFactory:v11 error:&v32];
      id v13 = v32;

      if (!v17) {
        break;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            v9[2](v9, *(void *)(*((void *)&v28 + 1) + 8 * i), &v33);
            if (v33)
            {
              v23 = v18;
              id v11 = v24;
              id v8 = v25;
              goto LABEL_15;
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v34 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }

      v12 += v15;
      a4 = v15;
      id v8 = v25;
      id v10 = v26;
      id v11 = v24;
      if (v12 >= [v25 count]) {
        goto LABEL_16;
      }
    }
    v18 = KGLoggingConnection();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v13;
      _os_log_error_impl(&dword_1D1654000, v18, OS_LOG_TYPE_ERROR, "failed loading ordered edges: %@", buf, 0xCu);
    }
    v23 = 0;
    id v8 = v25;
LABEL_15:

    id v10 = v26;
LABEL_16:
  }
}

- (void)enumerateEdgesUsingBlock:(id)a3
{
}

- (void)enumerateElementsWithBatchSize:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void, char *))a4;
  id v7 = [(KGElementCollection *)self identifiers];
  id v8 = (void *)[v7 mutableCopy];

  char v24 = 0;
  id v9 = [(KGGraph *)self->super._graph implementation];
  id v10 = [(KGGraph *)self->super._graph entityFactory];
  if (([v8 isEmpty] & 1) == 0)
  {
    unint64_t v18 = a3;
    do
    {
      context = (void *)MEMORY[0x1D25FA040]();
      id v11 = [v8 prefix:a3];
      [v8 subtractIdentifierSet:v11];
      unint64_t v12 = [v9 arrayOfEdgesWithIdentifiers:v11 entityFactory:v10 error:0];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v13);
            }
            v6[2](v6, *(void *)(*((void *)&v20 + 1) + 8 * i), &v24);
            if (v24)
            {

              goto LABEL_14;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      a3 = v18;
    }
    while (([v8 isEmpty] & 1) == 0);
  }
LABEL_14:
}

- (id)allObjects
{
  id v3 = [(KGGraph *)self->super._graph implementation];
  v4 = [(KGElementCollection *)self identifiers];
  v5 = [(KGGraph *)self->super._graph entityFactory];
  id v6 = [v3 arrayOfEdgesWithIdentifiers:v4 entityFactory:v5 error:0];

  return v6;
}

@end