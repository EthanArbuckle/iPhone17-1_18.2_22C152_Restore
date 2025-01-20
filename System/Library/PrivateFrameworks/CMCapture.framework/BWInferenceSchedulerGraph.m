@interface BWInferenceSchedulerGraph
- (BWInferenceSchedulerGraph)initWithHeadNode:(id)a3 directedEdges:(id)a4;
- (void)_visitJob:(void *)a3 withEnRouteAccumulation:(uint64_t)a4 block:;
- (void)dealloc;
- (void)enumerateVideoDestinationsFromJob:(id)a3 withBlock:(id)a4;
- (void)visitProvidersWithBlock:(id)a3;
@end

@implementation BWInferenceSchedulerGraph

- (BWInferenceSchedulerGraph)initWithHeadNode:(id)a3 directedEdges:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWInferenceSchedulerGraph;
  v6 = [(BWInferenceSchedulerGraph *)&v8 init];
  if (v6)
  {
    v6->_head = (BWInferenceJobProvider *)a3;
    v6->_directedEdgesByNode = (NSMapTable *)a4;
  }
  return v6;
}

- (void)_visitJob:(void *)a3 withEnRouteAccumulation:(uint64_t)a4 block:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_super v8 = (void *)[a3 objectForKey:a2];
    (*(void (**)(uint64_t, uint64_t, void *))(a4 + 16))(a4, a2, v8);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__BWInferenceSchedulerGraph__visitJob_withEnRouteAccumulation_block___block_invoke;
    v21[3] = &unk_1E5C28500;
    v21[4] = v9;
    [a1 enumerateVideoDestinationsFromJob:a2 withBlock:v21];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v9;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          id v15 = (id)[a3 objectForKey:v14];
          if (!v15)
          {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            [a3 setObject:v15 forKey:v14];
          }
          [v15 addObject:a2];
          objc_msgSend(v15, "addObjectsFromArray:", objc_msgSend(v8, "allObjects"));
          -[BWInferenceSchedulerGraph _visitJob:withEnRouteAccumulation:block:](a1, v14, a3, a4);
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v11);
    }
  }
}

- (void)enumerateVideoDestinationsFromJob:(id)a3 withBlock:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [(NSMapTable *)self->_directedEdgesByNode objectForKey:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*((void (**)(id, void, void, void, void))a4 + 2))(a4, **(void **)(*((void *)&v10 + 1) + 8 * v9), *(void *)(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 16), *(unsigned __int8 *)(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 24), *(void *)(*(void *)(*((void *)&v10 + 1) + 8 * v9) + 8));
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

uint64_t __69__BWInferenceSchedulerGraph__visitJob_withEnRouteAccumulation_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

- (void)visitProvidersWithBlock:(id)a3
{
  id v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E10]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, -[NSMapTable count](self->_directedEdgesByNode, "count"));
  -[BWInferenceSchedulerGraph _visitJob:withEnRouteAccumulation:block:](self, (uint64_t)self->_head, v5, (uint64_t)a3);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceSchedulerGraph;
  [(BWInferenceSchedulerGraph *)&v3 dealloc];
}

@end