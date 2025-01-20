@interface MAChainRelation
+ (id)scanRelationWithScanner:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MAChainRelation)initWithSteps:(id)a3;
- (NSArray)steps;
- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4;
- (id)inverse;
- (id)visualString;
- (unint64_t)hash;
- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5;
@end

@implementation MAChainRelation

- (void).cxx_destruct
{
}

- (NSArray)steps
{
  return self->_steps;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_steps;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= (v5 << 6)
            + (v5 >> 2)
            + 2654435769u
            + objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "hash", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MAChainRelation *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      steps = self->_steps;
      uint64_t v6 = [(MAChainRelation *)v4 steps];
      char v7 = [(NSArray *)steps isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)visualString
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = self->_steps;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "visualString", (void)v11);
        [v3 appendString:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)adjacencyByJoiningWithAdjacency:(id)a3 graph:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = self->_steps;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      long long v13 = v6;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "adjacencyByJoiningWithAdjacency:graph:", v13, v7, (void)v15);
        id v6 = (id)objc_claimAutoreleasedReturnValue();

        ++v12;
        long long v13 = v6;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v8 = self->_steps;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (!v9)
  {

LABEL_14:
    uint64_t v11 = +[KGDirectedBinaryAdjacency identityWith:](KGDirectedBinaryAdjacency, "identityWith:", v6, (void)v17);
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  uint64_t v12 = *(void *)v18;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v18 != v12) {
        objc_enumerationMutation(v8);
      }
      long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
      if (v11)
      {
        uint64_t v15 = [v14 adjacencyByJoiningWithAdjacency:v11 graph:v7];

        uint64_t v11 = (void *)v15;
      }
      else
      {
        uint64_t v11 = objc_msgSend(v14, "adjacencyWithStartNodeIdentifiers:graph:", v6, v7, (void)v17);
      }
    }
    uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  }
  while (v10);

  if (!v11) {
    goto LABEL_14;
  }
LABEL_15:

  return v11;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v19 = a4;
  id v9 = a5;
  uint64_t v10 = (KGMutableElementIdentifierSet *)v8;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = self->_steps;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  long long v20 = v10;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    do
    {
      uint64_t v15 = 0;
      long long v16 = v10;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v17 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
        long long v18 = (void *)MEMORY[0x1D25FA040]();
        uint64_t v10 = objc_alloc_init(KGMutableElementIdentifierSet);
        [v17 unionAdjacencySetFromSourceNodeIdentifiers:v16 toTargetNodeIdentifiers:v10 graph:v9];

        ++v15;
        long long v16 = v10;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }

  [v19 unionWithIdentifierSet:v10];
}

- (id)inverse
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(NSArray *)self->_steps reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) inverse];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [[MAChainRelation alloc] initWithSteps:v3];
  return v10;
}

- (MAChainRelation)initWithSteps:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAChainRelation;
  uint64_t v6 = [(MARelation *)&v9 initForSubclassing];
  uint64_t v7 = (MAChainRelation *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = +[MARelation _scanNonChainRelationWithScanner:v3];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    do
    {
      [v4 addObject:v6];
      uint64_t v7 = +[MARelation _scanNonChainRelationWithScanner:v3];

      uint64_t v6 = (void *)v7;
    }
    while (v7);
  }
  uint64_t v8 = [v4 count];
  if (v8)
  {
    if (v8 == 1)
    {
      objc_super v9 = [v4 objectAtIndexedSubscript:0];
    }
    else
    {
      objc_super v9 = [[MAChainRelation alloc] initWithSteps:v4];
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end