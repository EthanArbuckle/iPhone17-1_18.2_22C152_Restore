@interface MTKSubmesh
- (MTKMesh)mesh;
- (MTKMeshBuffer)indexBuffer;
- (MTKSubmesh)initWithMesh:(id)a3 submesh:(id)a4 device:(id)a5 error:(id *)a6;
- (MTLIndexType)indexType;
- (MTLPrimitiveType)primitiveType;
- (NSString)name;
- (NSUInteger)indexCount;
- (void)setName:(NSString *)name;
@end

@implementation MTKSubmesh

- (MTKSubmesh)initWithMesh:(id)a3 submesh:(id)a4 device:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MTKSubmesh;
  v11 = [(MTKSubmesh *)&v31 init];
  if (v11)
  {
    uint64_t v12 = [v10 geometryType];
    if ([v10 indexType] == 32)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 1;
    }
    else
    {
      if ([v10 indexType] != 16)
      {
        if ([v10 indexType] != 8)
        {
          if (a6)
          {
            v17 = @"invalid index type submesh";
LABEL_33:
            _MTKModelErrorWithCodeAndErrorString(0, v17);
            id v29 = (id)objc_claimAutoreleasedReturnValue();
LABEL_36:
            v28 = 0;
            *a6 = v29;
            goto LABEL_39;
          }
LABEL_38:
          v28 = 0;
          goto LABEL_39;
        }
        uint64_t v14 = 0;
        int v15 = 0;
        uint64_t v13 = 16;
LABEL_7:
        v11->_indexType = v14;
        if ([v10 geometryType] == 1)
        {
          uint64_t v16 = 1;
LABEL_24:
          v11->_primitiveType = v16;
          if (v13
            && (v18 = [objc_alloc(getMDLSubmeshClass()) initWithMDLSubmesh:v10 indexType:v13 geometryType:v12], v10, (id v10 = (id)v18) == 0))
          {
            if (a6)
            {
              _MTKModelErrorWithCodeAndErrorString(0, @"required conversion from orginal submesh indexType and geometryType failed");
              id v29 = (id)objc_claimAutoreleasedReturnValue();
              id v10 = 0;
              goto LABEL_36;
            }
            id v10 = 0;
          }
          else
          {
            v19 = [v10 indexBuffer];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              uint64_t v21 = [v10 indexBuffer];
              indexBuffer = v11->_indexBuffer;
              v11->_indexBuffer = (MTKMeshBuffer *)v21;

              v11->_indexCount = [v10 indexCount];
              v23 = [v10 name];

              if (v23)
              {
                id v24 = [NSString alloc];
                v25 = [v10 name];
                uint64_t v26 = [v24 initWithString:v25];
                name = v11->_name;
                v11->_name = (NSString *)v26;
              }
              objc_storeWeak((id *)&v11->_mesh, v9);
              goto LABEL_30;
            }
            if (a6)
            {
              v17 = @"index buffer in MDLSubmesh was not created using a MTKMeshBufferAllocator";
              goto LABEL_33;
            }
          }
          goto LABEL_38;
        }
        if (![v10 geometryType])
        {
          uint64_t v16 = 0;
          goto LABEL_24;
        }
        if ([v10 geometryType] != 2)
        {
          if ([v10 geometryType] == 3)
          {
            uint64_t v16 = 4;
            goto LABEL_24;
          }
          if ([v10 geometryType] != 4 && objc_msgSend(v10, "geometryType") != 5)
          {
            if (a6)
            {
              v17 = @"invalid geometry type in submesh";
              goto LABEL_33;
            }
            goto LABEL_38;
          }
          if (v15) {
            uint64_t v13 = [v10 indexType];
          }
          uint64_t v12 = 2;
        }
        uint64_t v16 = 3;
        goto LABEL_24;
      }
      uint64_t v14 = 0;
      uint64_t v13 = 0;
    }
    int v15 = 1;
    goto LABEL_7;
  }
LABEL_30:
  v28 = v11;
LABEL_39:

  return v28;
}

- (MTLPrimitiveType)primitiveType
{
  return self->_primitiveType;
}

- (MTLIndexType)indexType
{
  return self->_indexType;
}

- (MTKMeshBuffer)indexBuffer
{
  return self->_indexBuffer;
}

- (NSUInteger)indexCount
{
  return self->_indexCount;
}

- (MTKMesh)mesh
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mesh);

  return (MTKMesh *)WeakRetained;
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
  objc_destroyWeak((id *)&self->_mesh);

  objc_storeStrong((id *)&self->_indexBuffer, 0);
}

@end