@interface MAPaths
+ (id)paths;
+ (id)pathsWithPaths:(id)a3;
- (MAPaths)init;
- (id)description;
- (id)graphRepresentationWithStrictNodes:(BOOL)a3 strictEdges:(BOOL)a4;
- (id)pathAtIndex:(unint64_t)a3;
- (id)uniqueEdgesForLabel:(id)a3;
- (id)uniqueNodesForLabel:(id)a3;
- (unint64_t)count;
- (void)addPath:(id)a3;
- (void)enumerateWithBlock:(id)a3;
- (void)removeAllPaths;
- (void)setPaths:(id)a3;
@end

@implementation MAPaths

- (void).cxx_destruct
{
}

- (id)uniqueEdgesForLabel:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_paths;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "edgesForLabel:", v4, (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)uniqueNodesForLabel:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = self->_paths;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "nodesForLabel:", v4, (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)enumerateWithBlock:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, char *))a3;
  char v14 = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_paths;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9), &v14);
      if (v14) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)graphRepresentationWithStrictNodes:(BOOL)a3 strictEdges:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = +[MAGraph graph];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = self->_paths;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = [v13 graphRepresentation];
        if (!v14)
        {
          [MEMORY[0x1E4F1CA00] raise:@"MAPathsInvalidGraph", @"Graph invalid for path \"%@\"", v13 format];

          id v17 = 0;
          goto LABEL_11;
        }
        long long v15 = (void *)v14;
        id v16 = (id)[v7 mergeWithGraph:v14 strictNodes:v5 strictEdges:v4];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  id v17 = v7;
LABEL_11:

  return v17;
}

- (void)removeAllPaths
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableArray *)obj->_paths removeAllObjects];
  objc_sync_exit(obj);
}

- (void)setPaths:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  [(NSMutableArray *)v5->_paths removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        -[MAPaths addPath:](v5, "addPath:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)addPath:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_paths addObject:v5];
  objc_sync_exit(v4);
}

- (id)pathAtIndex:(unint64_t)a3
{
  if ([(MAPaths *)self count] <= a3)
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"MAPathsInvalidIndex", @"Out of bounds result path index \"%ld\"", a3);
    id v5 = 0;
  }
  else
  {
    id v5 = [(NSMutableArray *)self->_paths objectAtIndex:a3];
  }
  return v5;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_paths count];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"["];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __22__MAPaths_description__block_invoke;
  v6[3] = &unk_1E68DC7E8;
  id v4 = v3;
  id v7 = v4;
  [(MAPaths *)self enumerateWithBlock:v6];
  if ((unint64_t)[v4 length] >= 2) {
    objc_msgSend(v4, "deleteCharactersInRange:", objc_msgSend(v4, "length") - 2, 2);
  }
  [v4 appendString:@"]"];

  return v4;
}

void __22__MAPaths_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 appendFormat:@"%@, ", v3];
}

- (MAPaths)init
{
  v6.receiver = self;
  v6.super_class = (Class)MAPaths;
  v2 = [(MAPaths *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    paths = v2->_paths;
    v2->_paths = (NSMutableArray *)v3;
  }
  return v2;
}

+ (id)pathsWithPaths:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setPaths:v3];

  return v4;
}

+ (id)paths
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

@end