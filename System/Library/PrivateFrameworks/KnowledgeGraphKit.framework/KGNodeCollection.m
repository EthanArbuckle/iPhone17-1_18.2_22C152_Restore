@interface KGNodeCollection
- (id)allObjects;
- (void)enumerateElementsWithBatchSize:(unint64_t)a3 usingBlock:(id)a4;
- (void)enumerateIdentifiersSortedByDoublePropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateIdentifiersSortedByIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateIdentifiersSortedByStringPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateIdentifiersSortedByUnsignedIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5;
- (void)enumerateNodesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4;
- (void)enumerateNodesUsingBlock:(id)a3;
- (void)enumerateOrderedNodes:(id)a3 withBatchSize:(unint64_t)a4 usingBlock:(id)a5;
- (void)enumeratePropertyValuesForKey:(id)a3 withBlock:(id)a4;
@end

@implementation KGNodeCollection

- (void)enumeratePropertyValuesForKey:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(KGGraph *)self->super._graph implementation];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__KGNodeCollection_enumeratePropertyValuesForKey_withBlock___block_invoke;
  v12[3] = &unk_1E68DC1F0;
  id v13 = v8;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  id v11 = v8;
  [(KGElementCollection *)self enumerateElementIdentifierBatchesWithBatchSize:256 usingBlock:v12];
}

void __60__KGNodeCollection_enumeratePropertyValuesForKey_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) propertiesForNodesWithIdentifiers:a2 propertyName:*(void *)(a1 + 40) error:0];
  [v3 enumerateUsingBlock:*(void *)(a1 + 48)];
}

- (void)enumerateIdentifiersSortedByUnsignedIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void, uint8_t *))a5;
  id v10 = [(KGGraph *)self->super._graph implementation];
  id v11 = [(KGElementCollection *)self identifiers];
  id v23 = 0;
  v12 = [v10 nodeIdentifiers:v11 sortedByUnsignedIntegerPropertyForName:v8 ascending:v6 limit:-1 error:&v23];
  id v13 = v23;

  if (v12)
  {
    buf[0] = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        if (buf[0]) {
          break;
        }
        v9[2](v9, objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "unsignedIntValue", (void)v19), buf);
        if (v16 == v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v14 = KGLoggingConnection();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_error_impl(&dword_1D1654000, v14, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateIdentifiersSortedByDoublePropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void, uint8_t *))a5;
  id v10 = [(KGGraph *)self->super._graph implementation];
  id v11 = [(KGElementCollection *)self identifiers];
  id v23 = 0;
  v12 = [v10 nodeIdentifiers:v11 sortedByFloatPropertyForName:v8 ascending:v6 limit:-1 error:&v23];
  id v13 = v23;

  if (v12)
  {
    buf[0] = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        if (buf[0]) {
          break;
        }
        v9[2](v9, objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "unsignedIntValue", (void)v19), buf);
        if (v16 == v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v14 = KGLoggingConnection();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_error_impl(&dword_1D1654000, v14, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateIdentifiersSortedByIntegerPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, uint8_t *))a5;
  id v10 = [(KGGraph *)self->super._graph implementation];
  id v11 = [(KGElementCollection *)self identifiers];
  id v23 = 0;
  v12 = [v10 nodeIdentifiers:v11 sortedByIntegerPropertyForName:v8 ascending:v6 limit:-1 error:&v23];
  id v13 = v23;

  if (v12)
  {
    buf[0] = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        if (buf[0]) {
          break;
        }
        v9[2](v9, objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "unsignedIntegerValue", (void)v19), buf);
        if (v16 == v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v14 = KGLoggingConnection();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_error_impl(&dword_1D1654000, v14, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateIdentifiersSortedByStringPropertyForName:(id)a3 ascending:(BOOL)a4 usingBlock:(id)a5
{
  BOOL v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, uint8_t *))a5;
  id v10 = [(KGGraph *)self->super._graph implementation];
  id v11 = [(KGElementCollection *)self identifiers];
  id v23 = 0;
  v12 = [v10 nodeIdentifiers:v11 sortedByStringPropertyForName:v8 ascending:v6 limit:-1 error:&v23];
  id v13 = v23;

  if (v12)
  {
    buf[0] = 0;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)v20 != v17) {
          objc_enumerationMutation(v14);
        }
        if (buf[0]) {
          break;
        }
        v9[2](v9, objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "unsignedIntegerValue", (void)v19), buf);
        if (v16 == v18)
        {
          uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v24 count:16];
          if (v16) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v14 = KGLoggingConnection();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_error_impl(&dword_1D1654000, v14, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateNodesSortedByFloatPropertyForName:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  graph = self->super._graph;
  id v8 = a3;
  id v9 = [(KGGraph *)graph implementation];
  id v10 = [(KGElementCollection *)self identifiers];
  id v14 = 0;
  id v11 = [v9 nodeIdentifiers:v10 sortedByFloatPropertyForName:v8 ascending:1 limit:-1 error:&v14];

  id v12 = v14;
  if (v11)
  {
    [(KGNodeCollection *)self enumerateOrderedNodes:v11 withBatchSize:256 usingBlock:v6];
  }
  else
  {
    id v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateNodesSortedByIntegerPropertyForName:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  graph = self->super._graph;
  id v8 = a3;
  id v9 = [(KGGraph *)graph implementation];
  id v10 = [(KGElementCollection *)self identifiers];
  id v14 = 0;
  id v11 = [v9 nodeIdentifiers:v10 sortedByIntegerPropertyForName:v8 ascending:1 limit:-1 error:&v14];

  id v12 = v14;
  if (v11)
  {
    [(KGNodeCollection *)self enumerateOrderedNodes:v11 withBatchSize:256 usingBlock:v6];
  }
  else
  {
    id v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateNodesSortedByStringPropertyForName:(id)a3 usingBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  graph = self->super._graph;
  id v8 = a3;
  id v9 = [(KGGraph *)graph implementation];
  id v10 = [(KGElementCollection *)self identifiers];
  id v14 = 0;
  id v11 = [v9 nodeIdentifiers:v10 sortedByStringPropertyForName:v8 ascending:1 limit:-1 error:&v14];

  id v12 = v14;
  if (v11)
  {
    [(KGNodeCollection *)self enumerateOrderedNodes:v11 withBatchSize:256 usingBlock:v6];
  }
  else
  {
    id v13 = KGLoggingConnection();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_error_impl(&dword_1D1654000, v13, OS_LOG_TYPE_ERROR, "failed loading ordered node identifiers: %@", buf, 0xCu);
    }
  }
}

- (void)enumerateOrderedNodes:(id)a3 withBatchSize:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void, char *))a5;
  char v36 = 0;
  id v10 = [(KGGraph *)self->super._graph implementation];
  id v11 = [(KGGraph *)self->super._graph entityFactory];
  if ([v8 count])
  {
    unint64_t v12 = 0;
    id v13 = 0;
    uint64_t v27 = v8;
    v28 = v10;
    while (1)
    {
      id v14 = v13;
      context = (void *)MEMORY[0x1D25FA040]();
      uint64_t v15 = [v8 count];
      unint64_t v16 = a4;
      unint64_t v17 = v15 - v12 >= a4 ? a4 : v15 - v12;
      uint64_t v18 = objc_msgSend(v8, "subarrayWithRange:", v12, v17, v27);
      id v35 = v14;
      long long v19 = v11;
      long long v20 = [v10 orderedArrayOfNodesWithIdentifiers:v18 entityFactory:v11 error:&v35];
      id v30 = v35;

      if (!v20) {
        break;
      }
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v32;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v21);
            }
            v9[2](v9, *(void *)(*((void *)&v31 + 1) + 8 * i), &v36);
            if (v36)
            {
              id v26 = v21;
              id v8 = v27;
              goto LABEL_18;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v37 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }

      v12 += v16;
      id v8 = v27;
      id v10 = v28;
      id v11 = v19;
      a4 = v16;
      id v13 = v30;
      if (v12 >= [v27 count]) {
        goto LABEL_20;
      }
    }
    long long v21 = KGLoggingConnection();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v30;
      id v39 = v30;
      _os_log_error_impl(&dword_1D1654000, v21, OS_LOG_TYPE_ERROR, "failed loading ordered nodes: %@", buf, 0xCu);
      id v26 = 0;
      id v11 = v19;
    }
    else
    {
      id v26 = 0;
LABEL_18:
      id v11 = v19;
      id v13 = v30;
    }

    id v10 = v28;
LABEL_20:
  }
}

- (void)enumerateNodesUsingBlock:(id)a3
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
      unint64_t v12 = [v9 arrayOfNodesWithIdentifiers:v11 entityFactory:v10 error:0];
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
  id v6 = [v3 arrayOfNodesWithIdentifiers:v4 entityFactory:v5 error:0];

  return v6;
}

@end