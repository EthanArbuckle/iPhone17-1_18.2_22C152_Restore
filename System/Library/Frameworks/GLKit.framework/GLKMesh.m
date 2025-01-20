@interface GLKMesh
+ (NSArray)newMeshesFromAsset:(MDLAsset *)asset sourceMeshes:(NSArray *)sourceMeshes error:(NSError *)error;
+ (void)_createMeshesFromObject:(id)a3 newMeshes:(id)a4 sourceMeshes:(id)a5 error:(id *)a6;
- (GLKMesh)initWithMesh:(MDLMesh *)mesh error:(NSError *)error;
- (MDLVertexDescriptor)vertexDescriptor;
- (NSArray)submeshes;
- (NSArray)vertexBuffers;
- (NSString)name;
- (NSUInteger)vertexCount;
@end

@implementation GLKMesh

- (GLKMesh)initWithMesh:(MDLMesh *)mesh error:(NSError *)error
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v6 = mesh;
  v53.receiver = self;
  v53.super_class = (Class)GLKMesh;
  v7 = [(GLKMesh *)&v53 init];
  if (!v7)
  {
LABEL_25:
    v40 = v7;
    goto LABEL_34;
  }
  uint64_t v8 = [MEMORY[0x263F146E8] currentContext];
  v9 = (void *)v8;
  if (v8)
  {
    v44 = error;
    v42 = (void *)v8;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    vertexBuffers = v7->_vertexBuffers;
    v7->_vertexBuffers = v10;

    v7->_vertexCount = [(MDLMesh *)v6 vertexCount];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    v43 = v6;
    v12 = [(MDLMesh *)v6 vertexBuffers];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v50;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v50 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          v18 = [MEMORY[0x263EFF9D0] null];
          char v19 = [v17 isEqual:v18];

          if ((v19 & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (v44)
              {
                _GLKModelErrorWithCodeAndErrorString(0, @"Vertex buffer in MDLMesh was not created using a GLKMeshBufferAllocator");
                *v44 = (NSError *)(id)objc_claimAutoreleasedReturnValue();
              }

              v6 = v43;
LABEL_32:
              v9 = v42;
              goto LABEL_33;
            }
            [(NSMutableArray *)v7->_vertexBuffers addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    submeshes = v7->_submeshes;
    v7->_submeshes = v20;

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v6 = v43;
    v22 = [(MDLMesh *)v43 submeshes];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v46;
      while (2)
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v46 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v28 = [v27 indexBuffer];
          if (v28)
          {
            v29 = (void *)v28;
            uint64_t v30 = [v27 indexCount];

            if (v30)
            {
              v31 = [[GLKSubmesh alloc] initWithMesh:v7 submesh:v27 error:v44];
              if (!v31)
              {

                goto LABEL_32;
              }
              v32 = v31;
              [(NSMutableArray *)v7->_submeshes addObject:v31];
            }
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }

    uint64_t v33 = [(MDLMesh *)v43 vertexDescriptor];
    vertexDescriptor = v7->_vertexDescriptor;
    v7->_vertexDescriptor = (MDLVertexDescriptor *)v33;

    id v35 = [NSString alloc];
    v36 = [(MDLMesh *)v43 name];
    v37 = v35;
    v6 = v43;
    uint64_t v38 = [v37 initWithString:v36];
    name = v7->_name;
    v7->_name = (NSString *)v38;

    goto LABEL_25;
  }
  if (error)
  {
    _GLKModelErrorWithCodeAndErrorString(0, @"An EAGL context must be current");
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
LABEL_33:

  v40 = 0;
LABEL_34:

  return v40;
}

+ (void)_createMeshesFromObject:(id)a3 newMeshes:(id)a4 sourceMeshes:(id)a5 error:(id *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  getMDLMeshClass();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v10;
    uint64_t v14 = [[GLKMesh alloc] initWithMesh:v13 error:a6];
    if (!v14)
    {
      uint64_t v14 = [MEMORY[0x263EFF9D0] null];
    }
    [v11 addObject:v14];
    [v12 addObject:v13];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = objc_msgSend(v10, "children", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [a1 _createMeshesFromObject:*(void *)(*((void *)&v20 + 1) + 8 * v19++) newMeshes:v11 sourceMeshes:v12 error:a6];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }
}

+ (NSArray)newMeshesFromAsset:(MDLAsset *)asset sourceMeshes:(NSArray *)sourceMeshes error:(NSError *)error
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v8 = asset;
  v9 = [MEMORY[0x263F146E8] currentContext];
  if (!v9)
  {
    if (error)
    {
      uint64_t v16 = @"An EAGL context must be current";
LABEL_19:
      _GLKModelErrorWithCodeAndErrorString(0, (uint64_t)v16);
      id v10 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    id v10 = 0;
    goto LABEL_21;
  }
  if (!v8)
  {
    if (error)
    {
      uint64_t v16 = @"Must supply asset";
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v10 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v18 = sourceMeshes;
  if (sourceMeshes) {
    sourceMeshes = (NSArray **)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v8;
  uint64_t v12 = [(MDLAsset *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        [a1 _createMeshesFromObject:*(void *)(*((void *)&v19 + 1) + 8 * i) newMeshes:v10 sourceMeshes:sourceMeshes error:error];
      }
      uint64_t v13 = [(MDLAsset *)v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  if (v18) {
    void *v18 = (NSArray *)sourceMeshes;
  }

LABEL_21:
  return v10;
}

- (NSUInteger)vertexCount
{
  return self->_vertexCount;
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

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_vertexDescriptor, 0);
  objc_storeStrong((id *)&self->_vertexBuffers, 0);

  objc_storeStrong((id *)&self->_submeshes, 0);
}

@end