@interface MTKMesh
+ (NSArray)newMeshesFromAsset:(MDLAsset *)asset device:(id)device sourceMeshes:(NSArray *)sourceMeshes error:(NSError *)error;
+ (void)_createMeshesFromObject:(id)a3 newMeshes:(id)a4 sourceMeshes:(id)a5 device:(id)a6 error:(id *)a7;
- (MDLVertexDescriptor)vertexDescriptor;
- (MTKMesh)initWithMesh:(MDLMesh *)mesh device:(id)device error:(NSError *)error;
- (NSArray)submeshes;
- (NSArray)vertexBuffers;
- (NSString)name;
- (NSUInteger)vertexCount;
- (void)setName:(NSString *)name;
@end

@implementation MTKMesh

- (MTKMesh)initWithMesh:(MDLMesh *)mesh device:(id)device error:(NSError *)error
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  v8 = mesh;
  id v42 = device;
  v52.receiver = self;
  v52.super_class = (Class)MTKMesh;
  v9 = [(MTKMesh *)&v52 init];
  if (v9)
  {
    v43 = error;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    vertexBuffers = v9->_vertexBuffers;
    v9->_vertexBuffers = v10;

    v9->_vertexCount = [(MDLMesh *)v8 vertexCount];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    v41 = v8;
    v12 = [(MDLMesh *)v8 vertexBuffers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v49;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          v18 = [MEMORY[0x263EFF9D0] null];
          char v19 = [v17 isEqual:v18];

          if ((v19 & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v43)
              {
                _MTKModelErrorWithCodeAndErrorString(0, @"vertex buffer in MDLMesh was not created using a MTKMeshBufferAllocator");
                *v43 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
              }
LABEL_28:

              v39 = 0;
              v8 = v41;
              goto LABEL_29;
            }
            [(NSMutableArray *)v9->_vertexBuffers addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    submeshes = v9->_submeshes;
    v9->_submeshes = v20;

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v12 = [(MDLMesh *)v41 submeshes];
    uint64_t v22 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v45;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v45 != v24) {
            objc_enumerationMutation(v12);
          }
          v26 = *(void **)(*((void *)&v44 + 1) + 8 * j);
          uint64_t v27 = [v26 indexBuffer];
          if (v27)
          {
            v28 = (void *)v27;
            uint64_t v29 = [v26 indexCount];

            if (v29)
            {
              v30 = [[MTKSubmesh alloc] initWithMesh:v9 submesh:v26 device:v42 error:v43];
              if (!v30) {
                goto LABEL_28;
              }
              v31 = v30;
              [(NSMutableArray *)v9->_submeshes addObject:v30];
            }
          }
        }
        uint64_t v23 = [v12 countByEnumeratingWithState:&v44 objects:v53 count:16];
      }
      while (v23);
    }

    v8 = v41;
    uint64_t v32 = [(MDLMesh *)v41 vertexDescriptor];
    vertexDescriptor = v9->_vertexDescriptor;
    v9->_vertexDescriptor = (MDLVertexDescriptor *)v32;

    v34 = [(MDLMesh *)v41 name];

    if (v34)
    {
      id v35 = [NSString alloc];
      v36 = [(MDLMesh *)v41 name];
      uint64_t v37 = [v35 initWithString:v36];
      name = v9->_name;
      v9->_name = (NSString *)v37;
    }
  }
  v39 = v9;
LABEL_29:

  return v39;
}

+ (void)_createMeshesFromObject:(id)a3 newMeshes:(id)a4 sourceMeshes:(id)a5 device:(id)a6 error:(id *)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  getMDLMeshClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v12;
    v17 = [[MTKMesh alloc] initWithMesh:v16 device:v15 error:a7];
    if (!v17)
    {
      v17 = [MEMORY[0x263EFF9D0] null];
    }
    [v13 addObject:v17];
    [v14 addObject:v16];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v18 = objc_msgSend(v12, "children", 0);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        [a1 _createMeshesFromObject:*(void *)(*((void *)&v23 + 1) + 8 * v22++) newMeshes:v13 sourceMeshes:v14 device:v15 error:a7];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v20);
  }
}

+ (NSArray)newMeshesFromAsset:(MDLAsset *)asset device:(id)device sourceMeshes:(NSArray *)sourceMeshes error:(NSError *)error
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v10 = asset;
  id v11 = device;
  id v12 = v11;
  if (!v10)
  {
    if (error)
    {
      uint64_t v19 = @"Must supply asset";
LABEL_19:
      _MTKModelErrorWithCodeAndErrorString(0, v19);
      id v13 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    id v13 = 0;
    goto LABEL_21;
  }
  if (!v11)
  {
    if (error)
    {
      uint64_t v19 = @"Must supply device";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v13 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v21 = sourceMeshes;
  if (sourceMeshes) {
    sourceMeshes = (NSArray **)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v14 = v10;
  uint64_t v15 = [(MDLAsset *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v14);
        }
        [a1 _createMeshesFromObject:*(void *)(*((void *)&v22 + 1) + 8 * i) newMeshes:v13 sourceMeshes:sourceMeshes device:v12 error:error];
      }
      uint64_t v16 = [(MDLAsset *)v14 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }

  if (v21) {
    *uint64_t v21 = (NSArray *)sourceMeshes;
  }

LABEL_21:
  return v13;
}

- (NSArray)vertexBuffers
{
  return &self->_vertexBuffers->super;
}

- (MDLVertexDescriptor)vertexDescriptor
{
  return self->_vertexDescriptor;
}

- (NSArray)submeshes
{
  return &self->_submeshes->super;
}

- (NSUInteger)vertexCount
{
  return self->_vertexCount;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
  objc_storeStrong((id *)&self->_vertexBuffers, 0);

  objc_storeStrong((id *)&self->_submeshes, 0);
}

@end