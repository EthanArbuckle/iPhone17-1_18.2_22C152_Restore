@interface GLKSubmesh
- (GLKMesh)mesh;
- (GLKMeshBuffer)elementBuffer;
- (GLKSubmesh)initWithMesh:(id)a3 submesh:(id)a4 error:(id *)a5;
- (GLenum)mode;
- (GLenum)type;
- (GLsizei)elementCount;
- (NSString)name;
@end

@implementation GLKSubmesh

- (GLKSubmesh)initWithMesh:(id)a3 submesh:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v29.receiver = self;
  v29.super_class = (Class)GLKSubmesh;
  v10 = [(GLKSubmesh *)&v29 init];
  if (!v10) {
    goto LABEL_27;
  }
  uint64_t v11 = [v9 geometryType];
  if ([v9 indexType] == 16)
  {
    uint64_t v12 = 0;
    int v13 = 1;
    int v14 = 5123;
  }
  else if ([v9 indexType] == 32)
  {
    uint64_t v12 = 0;
    int v13 = 1;
    int v14 = 5125;
  }
  else
  {
    if ([v9 indexType] != 8)
    {
      if (a5)
      {
        v16 = @"invalid index type in submesh";
LABEL_30:
        _GLKModelErrorWithCodeAndErrorString(0, (uint64_t)v16);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:
        v26 = 0;
        *a5 = v27;
        goto LABEL_36;
      }
LABEL_35:
      v26 = 0;
      goto LABEL_36;
    }
    int v13 = 0;
    int v14 = 5123;
    uint64_t v12 = 16;
  }
  v10->_type = v14;
  if ([v9 geometryType] == 1)
  {
    int v15 = 1;
  }
  else if ([v9 geometryType])
  {
    if ([v9 geometryType] == 2)
    {
      int v15 = 4;
    }
    else if ([v9 geometryType] == 3)
    {
      int v15 = 5;
    }
    else
    {
      if ([v9 geometryType] != 4 && objc_msgSend(v9, "geometryType") != 5)
      {
        if (a5)
        {
          v16 = @"invalid geometry type in submesh";
          goto LABEL_30;
        }
        goto LABEL_35;
      }
      if (v13) {
        uint64_t v12 = [v9 indexType];
      }
      int v15 = 4;
      uint64_t v11 = 2;
    }
  }
  else
  {
    int v15 = 0;
  }
  v10->_mode = v15;
  if (v12)
  {
    uint64_t v17 = [objc_alloc(getMDLSubmeshClass()) initWithMDLSubmesh:v9 indexType:v12 geometryType:v11];

    id v9 = (id)v17;
    if (!v17)
    {
      if (a5)
      {
        _GLKModelErrorWithCodeAndErrorString(0, @"required conversion from orginal submesh indexType and geometryType failed");
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v9 = 0;
        goto LABEL_33;
      }
      id v9 = 0;
      goto LABEL_35;
    }
  }
  v18 = [v9 indexBuffer];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (a5)
    {
      v16 = @"Index buffer in MDLSubmesh was not created using a GLKMeshBufferAllocator";
      goto LABEL_30;
    }
    goto LABEL_35;
  }
  uint64_t v20 = [v9 indexBuffer];
  elementBuffer = v10->_elementBuffer;
  v10->_elementBuffer = (GLKMeshBuffer *)v20;

  v10->_elementCount = [v9 indexCount];
  id v22 = [NSString alloc];
  v23 = [v9 name];
  uint64_t v24 = [v22 initWithString:v23];
  name = v10->_name;
  v10->_name = (NSString *)v24;

  objc_storeWeak((id *)&v10->_mesh, v8);
LABEL_27:
  v26 = v10;
LABEL_36:

  return v26;
}

- (GLenum)type
{
  return self->_type;
}

- (GLenum)mode
{
  return self->_mode;
}

- (GLsizei)elementCount
{
  return self->_elementCount;
}

- (GLKMeshBuffer)elementBuffer
{
  return self->_elementBuffer;
}

- (GLKMesh)mesh
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mesh);

  return (GLKMesh *)WeakRetained;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_mesh);

  objc_storeStrong((id *)&self->_elementBuffer, 0);
}

@end