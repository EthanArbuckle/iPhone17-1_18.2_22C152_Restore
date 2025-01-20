@interface MAUnionRelation
+ (id)scanRelationWithScanner:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MAUnionRelation)initWithRelations:(id)a3;
- (NSArray)relations;
- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4;
- (id)inverse;
- (id)visualString;
- (unint64_t)hash;
- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5;
@end

@implementation MAUnionRelation

- (void).cxx_destruct
{
}

- (NSArray)relations
{
  return self->_relations;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_relations;
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
  uint64_t v4 = (MAUnionRelation *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      relations = self->_relations;
      uint64_t v6 = [(MAUnionRelation *)v4 relations];
      char v7 = [(NSArray *)relations isEqual:v6];
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[@"-{" mutableCopy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_relations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    char v8 = 1;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ((v8 & 1) == 0) {
          [v3 appendString:@", ", (void)v13];
        }
        long long v11 = objc_msgSend(v10, "visualString", (void)v13);
        [v3 appendString:v11];

        char v8 = 0;
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      char v8 = 0;
    }
    while (v6);
  }

  [v3 appendString:@"}"];
  return v3;
}

- (id)adjacencyWithStartNodeIdentifiers:(id)a3 graph:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = objc_alloc_init(KGMutableDirectedBinaryAdjacency);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v9 = self->_relations;
  uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "adjacencyWithStartNodeIdentifiers:graph:", v6, v7, (void)v16);
        [(KGMutableDirectedBinaryAdjacency *)v8 formUnionWith:v14];
      }
      uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (void)unionAdjacencySetFromSourceNodeIdentifiers:(id)a3 toTargetNodeIdentifiers:(id)a4 graph:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [(MAUnionRelation *)self relations];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v15++) unionAdjacencySetFromSourceNodeIdentifiers:v8 toTargetNodeIdentifiers:v9 graph:v10];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (id)inverse
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_relations;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "inverse", (void)v12);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [[MAUnionRelation alloc] initWithRelations:v3];
  return v10;
}

- (MAUnionRelation)initWithRelations:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MAUnionRelation;
  uint64_t v6 = [(MARelation *)&v9 initForSubclassing];
  uint64_t v7 = (MAUnionRelation *)v6;
  if (v6) {
    objc_storeStrong(v6 + 1, a3);
  }

  return v7;
}

+ (id)scanRelationWithScanner:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 scanLocation];
  if (([v3 scanString:@"-{" intoString:0] & 1) == 0)
  {
    [v3 setScanLocation:v4];
    objc_super v9 = 0;
    goto LABEL_13;
  }
  id v5 = +[MARelation scanRelationWithScanner:v3];
  if (!v5)
  {
    [v3 setScanLocation:v4];
    objc_super v9 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v5, 0);
  if ([v3 scanString:@", ", 0 intoString])
  {
    do
    {
      uint64_t v7 = +[MARelation scanRelationWithScanner:v3];
      if (!v7) {
        goto LABEL_9;
      }
      id v8 = (void *)v7;
      [v6 addObject:v7];
    }
    while (([v3 scanString:@", ", 0 intoString] & 1) != 0);
  }
  if (([v3 scanString:@"}" intoString:0] & 1) == 0)
  {
LABEL_9:
    [v3 setScanLocation:v4];
    objc_super v9 = 0;
    goto LABEL_10;
  }
  objc_super v9 = [[MAUnionRelation alloc] initWithRelations:v6];
LABEL_10:

LABEL_12:
LABEL_13:

  return v9;
}

@end