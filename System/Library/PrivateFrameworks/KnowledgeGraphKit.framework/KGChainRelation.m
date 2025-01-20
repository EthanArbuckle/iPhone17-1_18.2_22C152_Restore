@interface KGChainRelation
- (KGChainRelation)initWithRelations:(id)a3;
- (NSArray)relations;
- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4;
- (id)inverse;
- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4;
@end

@implementation KGChainRelation

- (void).cxx_destruct
{
}

- (NSArray)relations
{
  return self->_relations;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 inGraph:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = self->_relations;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  v11 = v8;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v18;
    v11 = v8;
    do
    {
      uint64_t v14 = 0;
      v15 = v11;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v9);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "adjacencyByJoiningWithAdjacency:inGraph:", v15, v7, (void)v17);

        ++v14;
        v15 = v11;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v11;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(KGDirectedBinaryAdjacency);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v9 = self->_relations;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    char v13 = 1;
    do
    {
      uint64_t v14 = 0;
      v15 = v8;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
        if (v13) {
          [v16 adjacencyWithStartNodeIdentifiers:v6 inGraph:v7];
        }
        else {
          objc_msgSend(v16, "adjacencyByJoiningWithAdjacency:inGraph:", v15, v7, (void)v18);
        }
        id v8 = (KGDirectedBinaryAdjacency *)objc_claimAutoreleasedReturnValue();

        char v13 = 0;
        ++v14;
        v15 = v8;
      }
      while (v11 != v14);
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      char v13 = 0;
    }
    while (v11);
  }

  return v8;
}

- (id)inverse
{
  if ([(NSArray *)self->_relations count])
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (NSUInteger i = [(NSArray *)self->_relations count] - 1; ; --i)
    {
      v5 = [(NSArray *)self->_relations objectAtIndex:i];
      id v6 = [v5 inverse];
      [v3 addObject:v6];
    }
  }
  return self;
}

- (id)targetNodeIdentifiersFromSourceNodeIdentifiers:(id)a3 inGraph:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v9 = self->_relations;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  uint64_t v11 = v8;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v18;
    uint64_t v11 = v8;
    do
    {
      uint64_t v14 = 0;
      v15 = v11;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "targetNodeIdentifiersFromSourceNodeIdentifiers:inGraph:", v15, v7, (void)v17);

        ++v14;
        v15 = v11;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v11;
}

- (KGChainRelation)initWithRelations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KGChainRelation;
  id v6 = [(KGChainRelation *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_relations, a3);
  }

  return v7;
}

@end