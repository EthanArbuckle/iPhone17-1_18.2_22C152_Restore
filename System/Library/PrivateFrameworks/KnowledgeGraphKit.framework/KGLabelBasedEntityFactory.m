@interface KGLabelBasedEntityFactory
- (Class)_selectClassFromPossibleLabels:(id)a3 dictionary:(id)a4;
- (Class)classForEdgeLabels:(id)a3;
- (Class)classForNodeLabels:(id)a3;
- (Class)defaultEdgeClass;
- (Class)defaultNodeClass;
- (KGLabelBasedEntityFactory)init;
- (id)_generateAllPossibleLabelSetsForLabels:(id)a3 labelSetsCache:(id)a4;
- (id)edgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7;
- (id)nodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5;
- (void)registerEdgeClass:(Class)a3 forLabels:(id)a4;
- (void)registerNodeClass:(Class)a3 forLabels:(id)a4;
- (void)setDefaultEdgeClass:(Class)a3;
- (void)setDefaultNodeClass:(Class)a3;
@end

@implementation KGLabelBasedEntityFactory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultEdgeClass, 0);
  objc_storeStrong((id *)&self->_defaultNodeClass, 0);
  objc_storeStrong((id *)&self->_classByEdgeLabels, 0);
  objc_storeStrong((id *)&self->_classByNodeLabels, 0);
}

- (void)setDefaultEdgeClass:(Class)a3
{
}

- (Class)defaultEdgeClass
{
  return self->_defaultEdgeClass;
}

- (void)setDefaultNodeClass:(Class)a3
{
}

- (Class)defaultNodeClass
{
  return self->_defaultNodeClass;
}

- (id)edgeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5 sourceNode:(id)a6 targetNode:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = [v15 allObjects];
  v17 = [(KGLabelBasedEntityFactory *)self classForEdgeLabels:v16];

  v18 = (void *)[[v17 alloc] initWithIdentifier:a3 labels:v15 properties:v14 sourceNode:v13 targetNode:v12];
  return v18;
}

- (id)nodeWithIdentifier:(unint64_t)a3 labels:(id)a4 properties:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 allObjects];
  v11 = [(KGLabelBasedEntityFactory *)self classForNodeLabels:v10];

  id v12 = (void *)[[v11 alloc] initWithIdentifier:a3 labels:v9 properties:v8];
  return v12;
}

- (Class)classForNodeLabels:(id)a3
{
  id v4 = a3;
  v5 = [[KGSetWrapper alloc] initWithArray:v4];
  defaultNodeClass = (objc_class *)[(NSMutableDictionary *)self->_classByNodeLabels objectForKeyedSubscript:v5];
  if (!defaultNodeClass)
  {
    defaultNodeClass = [(KGLabelBasedEntityFactory *)self _selectClassFromPossibleLabels:v4 dictionary:self->_classByNodeLabels];
    if (!defaultNodeClass) {
      defaultNodeClass = self->_defaultNodeClass;
    }
  }
  v7 = defaultNodeClass;

  return v7;
}

- (Class)classForEdgeLabels:(id)a3
{
  id v4 = a3;
  v5 = [[KGSetWrapper alloc] initWithArray:v4];
  defaultEdgeClass = (objc_class *)[(NSMutableDictionary *)self->_classByEdgeLabels objectForKeyedSubscript:v5];
  if (!defaultEdgeClass)
  {
    defaultEdgeClass = [(KGLabelBasedEntityFactory *)self _selectClassFromPossibleLabels:v4 dictionary:self->_classByEdgeLabels];
    if (!defaultEdgeClass) {
      defaultEdgeClass = self->_defaultEdgeClass;
    }
  }
  v7 = defaultEdgeClass;

  return v7;
}

- (Class)_selectClassFromPossibleLabels:(id)a3 dictionary:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    id v8 = [(KGLabelBasedEntityFactory *)self _generateAllPossibleLabelSetsForLabels:v6 labelSetsCache:0];
    id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"count" ascending:0];
    v27[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    v11 = [v8 sortedArrayUsingDescriptors:v10];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v15 = 0;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = objc_msgSend(v7, "objectForKeyedSubscript:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          if (v15) {
            BOOL v19 = 1;
          }
          else {
            BOOL v19 = v18 == 0;
          }
          if (!v19) {
            id v15 = (void *)v18;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }
    else
    {
      id v15 = 0;
    }

    id v20 = v15;
  }
  else
  {
    id v20 = 0;
  }

  return (Class)v20;
}

- (id)_generateAllPossibleLabelSetsForLabels:(id)a3 labelSetsCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA80] set];
  }
  v10 = v9;
  v11 = [[KGSetWrapper alloc] initWithArray:v6];
  if ([v8 containsObject:v11])
  {
    id v12 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CA80] setWithObject:v11];
    if ((unint64_t)[v6 count] >= 2 && objc_msgSend(v6, "count"))
    {
      unint64_t v13 = 0;
      do
      {
        uint64_t v14 = (void *)MEMORY[0x1D25FA040]();
        id v15 = (void *)[v6 mutableCopy];
        [v15 removeObjectAtIndex:v13];
        uint64_t v16 = [(KGLabelBasedEntityFactory *)self _generateAllPossibleLabelSetsForLabels:v15 labelSetsCache:v10];
        [v12 unionSet:v16];
        [v10 unionSet:v16];

        ++v13;
      }
      while (v13 < [v6 count]);
    }
  }

  return v12;
}

- (void)registerEdgeClass:(Class)a3 forLabels:(id)a4
{
  id v6 = a4;
  id v7 = [[KGSetWrapper alloc] initWithArray:v6];

  [(NSMutableDictionary *)self->_classByEdgeLabels setObject:a3 forKeyedSubscript:v7];
}

- (void)registerNodeClass:(Class)a3 forLabels:(id)a4
{
  id v6 = a4;
  id v7 = [[KGSetWrapper alloc] initWithArray:v6];

  [(NSMutableDictionary *)self->_classByNodeLabels setObject:a3 forKeyedSubscript:v7];
}

- (KGLabelBasedEntityFactory)init
{
  v12.receiver = self;
  v12.super_class = (Class)KGLabelBasedEntityFactory;
  v2 = [(KGLabelBasedEntityFactory *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    classByNodeLabels = v2->_classByNodeLabels;
    v2->_classByNodeLabels = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    classByEdgeLabels = v2->_classByEdgeLabels;
    v2->_classByEdgeLabels = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_class();
    Class defaultNodeClass = v2->_defaultNodeClass;
    v2->_Class defaultNodeClass = (Class)v7;

    uint64_t v9 = objc_opt_class();
    Class defaultEdgeClass = v2->_defaultEdgeClass;
    v2->_Class defaultEdgeClass = (Class)v9;
  }
  return v2;
}

@end