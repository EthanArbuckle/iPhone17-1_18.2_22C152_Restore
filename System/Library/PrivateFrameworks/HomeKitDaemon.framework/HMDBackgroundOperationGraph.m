@interface HMDBackgroundOperationGraph
+ (id)logCategory;
- (BOOL)canAddEdgeFrom:(id)a3 to:(id)a4;
- (BOOL)doesCycleExist;
- (BOOL)doesVertexAlreadyExistInGraph:(id)a3;
- (HMDBackgroundOperationGraph)initWithOperations:(id)a3;
- (NSMapTable)inDegrees;
- (NSMapTable)opGraph;
- (id)getIndependentVertices;
- (void)addEdgeFrom:(id)a3 to:(id)a4;
- (void)addVertex:(id)a3;
- (void)removeVertex:(id)a3;
- (void)setInDegrees:(id)a3;
- (void)setOpGraph:(id)a3;
@end

@implementation HMDBackgroundOperationGraph

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inDegrees, 0);
  objc_storeStrong((id *)&self->_opGraph, 0);
}

- (void)setInDegrees:(id)a3
{
}

- (NSMapTable)inDegrees
{
  return self->_inDegrees;
}

- (void)setOpGraph:(id)a3
{
}

- (NSMapTable)opGraph
{
  return self->_opGraph;
}

- (BOOL)doesCycleExist
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  v4 = [(HMDBackgroundOperationGraph *)self opGraph];
  v5 = [(HMDBackgroundOperationGraph *)self inDegrees];
  __computeInDegrees(v4, v5);

  v6 = [(HMDBackgroundOperationGraph *)self opGraph];
  uint64_t v7 = [v6 count];

  if (!v7) {
    return 0;
  }
  unint64_t v8 = 0;
  while (2)
  {
    context = (void *)MEMORY[0x230FBD990]();
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v9 = [(HMDBackgroundOperationGraph *)self inDegrees];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v37;
LABEL_5:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v36 + 1) + 8 * v13);
        v15 = [(HMDBackgroundOperationGraph *)self inDegrees];
        v16 = [v15 objectForKey:v14];
        int v17 = [v16 unsignedIntValue];

        if (!v17) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
          if (v11) {
            goto LABEL_5;
          }
          goto LABEL_21;
        }
      }
      id v18 = v14;

      v19 = [(HMDBackgroundOperationGraph *)self inDegrees];
      __decrementInDegree(v19, v18);

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v20 = [(HMDBackgroundOperationGraph *)self opGraph];
      v21 = [v20 objectForKey:v18];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v27 = [(HMDBackgroundOperationGraph *)self inDegrees];
            __decrementInDegree(v27, v26);
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v23);
      }

      ++v8;
      v28 = [(HMDBackgroundOperationGraph *)self opGraph];
      unint64_t v29 = [v28 count];

      if (v29 > v8) {
        continue;
      }
      return 0;
    }
    break;
  }
LABEL_21:

  return 1;
}

- (BOOL)canAddEdgeFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(HMDBackgroundOperationGraph *)self doesVertexAlreadyExistInGraph:v6];
  BOOL v9 = [(HMDBackgroundOperationGraph *)self doesVertexAlreadyExistInGraph:v7];
  [(HMDBackgroundOperationGraph *)self addEdgeFrom:v6 to:v7];
  BOOL v10 = [(HMDBackgroundOperationGraph *)self doesCycleExist];
  if (!v8) {
    [(HMDBackgroundOperationGraph *)self removeVertex:v6];
  }
  if (!v9) {
    [(HMDBackgroundOperationGraph *)self removeVertex:v7];
  }

  return v10;
}

- (id)getIndependentVertices
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9C0];
  v4 = [(HMDBackgroundOperationGraph *)self opGraph];
  v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));

  context = (void *)MEMORY[0x230FBD990]();
  id v6 = [(HMDBackgroundOperationGraph *)self opGraph];
  id v7 = [(HMDBackgroundOperationGraph *)self inDegrees];
  __computeInDegrees(v6, v7);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v8 = [(HMDBackgroundOperationGraph *)self inDegrees];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v14 = [(HMDBackgroundOperationGraph *)self inDegrees];
        v15 = [v14 objectForKey:v13];
        int v16 = [v15 unsignedIntValue];

        if (!v16) {
          [v5 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  int v17 = (void *)[v5 copy];

  return v17;
}

- (void)addEdgeFrom:(id)a3 to:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(HMDBackgroundOperationGraph *)self addVertex:v7];
  [(HMDBackgroundOperationGraph *)self addVertex:v6];
  id v9 = [(HMDBackgroundOperationGraph *)self opGraph];
  BOOL v8 = [v9 objectForKey:v6];

  [v8 addObject:v7];
}

- (void)removeVertex:(id)a3
{
  id v11 = a3;
  if (-[HMDBackgroundOperationGraph doesVertexAlreadyExistInGraph:](self, "doesVertexAlreadyExistInGraph:"))
  {
    v4 = [(HMDBackgroundOperationGraph *)self opGraph];
    [v4 removeObjectForKey:v11];

    v5 = [(HMDBackgroundOperationGraph *)self inDegrees];
    [v5 removeObjectForKey:v11];

    id v6 = [(HMDBackgroundOperationGraph *)self opGraph];
    id v7 = [v6 objectEnumerator];

    uint64_t v8 = [v7 nextObject];
    if (v8)
    {
      id v9 = (void *)v8;
      do
      {
        [v9 removeObject:v11];
        uint64_t v10 = [v7 nextObject];

        id v9 = (void *)v10;
      }
      while (v10);
    }
  }
}

- (BOOL)doesVertexAlreadyExistInGraph:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBackgroundOperationGraph *)self opGraph];
  id v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (void)addVertex:(id)a3
{
  id v7 = a3;
  if (!-[HMDBackgroundOperationGraph doesVertexAlreadyExistInGraph:](self, "doesVertexAlreadyExistInGraph:"))
  {
    id v4 = [(HMDBackgroundOperationGraph *)self opGraph];
    v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    [v4 setObject:v5 forKey:v7];

    id v6 = [(HMDBackgroundOperationGraph *)self inDegrees];
    [v6 setObject:&unk_26E471830 forKey:v7];
  }
}

- (HMDBackgroundOperationGraph)initWithOperations:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)HMDBackgroundOperationGraph;
  v5 = [(HMDBackgroundOperationGraph *)&v34 init];
  id v6 = v5;
  if (v5)
  {
    v28 = v5;
    id v29 = v4;
    id v7 = v4;
    uint64_t v8 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    obuint64_t j = v7;
    uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          context = (void *)MEMORY[0x230FBD990]();
          id v11 = [v10 operationUUID];
          uint64_t v12 = [v10 AllDependencies];
          uint64_t v13 = [(NSMapTable *)v8 objectForKey:v11];

          if (!v13)
          {
            v14 = [MEMORY[0x263F088B0] weakObjectsHashTable];
            [(NSMapTable *)v8 setObject:v14 forKey:v11];
          }
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          id v15 = v12;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v36;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * j);
                long long v21 = -[NSMapTable objectForKey:](v8, "objectForKey:", v20, v28);

                if (!v21)
                {
                  long long v22 = [MEMORY[0x263F088B0] weakObjectsHashTable];
                  [(NSMapTable *)v8 setObject:v22 forKey:v20];
                }
                long long v23 = [(NSMapTable *)v8 objectForKey:v20];
                [v23 addObject:v11];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v17);
          }
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v32);
    }

    id v6 = v28;
    opGraph = v28->_opGraph;
    v28->_opGraph = v8;

    uint64_t v25 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    inDegrees = v28->_inDegrees;
    v28->_inDegrees = (NSMapTable *)v25;

    id v4 = v29;
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_113850 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_113850, &__block_literal_global_113851);
  }
  v2 = (void *)logCategory__hmf_once_v1_113852;
  return v2;
}

void __42__HMDBackgroundOperationGraph_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_113852;
  logCategory__hmf_once_v1_113852 = v0;
}

@end