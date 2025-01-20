@interface MDLSubmeshTopology
+ (id)decodeTopologyWithCoder:(id)a3 allocator:(id)a4;
- (MDLSubmeshTopology)initWithSubmesh:(MDLSubmesh *)submesh;
- (NSUInteger)edgeCreaseCount;
- (NSUInteger)faceCount;
- (NSUInteger)holeCount;
- (NSUInteger)vertexCreaseCount;
- (id)edgeCreaseIndices;
- (id)edgeCreases;
- (id)faceTopology;
- (id)holes;
- (id)vertexCreaseIndices;
- (id)vertexCreases;
- (void)encodeTopologyWithCoder:(id)a3 allocator:(id)a4;
- (void)setEdgeCreaseCount:(NSUInteger)edgeCreaseCount;
- (void)setEdgeCreaseIndices:(id)edgeCreaseIndices;
- (void)setEdgeCreases:(id)edgeCreases;
- (void)setFaceCount:(NSUInteger)faceCount;
- (void)setFaceTopology:(id)faceTopology;
- (void)setHoleCount:(NSUInteger)holeCount;
- (void)setHoles:(id)holes;
- (void)setVertexCreaseCount:(NSUInteger)vertexCreaseCount;
- (void)setVertexCreaseIndices:(id)vertexCreaseIndices;
- (void)setVertexCreases:(id)vertexCreases;
@end

@implementation MDLSubmeshTopology

- (MDLSubmeshTopology)initWithSubmesh:(MDLSubmesh *)submesh
{
  v7 = submesh;
  if (!v7)
  {
    v8 = (void *)MEMORY[0x263EFF940];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    v11 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v8, v12, @"ModelIOException", @"[%@ %@]: Cannot create topology with a submesh", v10, v11);
  }
  if (objc_msgSend_geometryType(v7, v5, v6) == 3)
  {
    v13 = (void *)MEMORY[0x263EFF940];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    v16 = NSStringFromSelector(a2);
    objc_msgSend_raise_format_(v13, v17, @"ModelIOException", @"[%@ %@]: Cannot create topology from triangle strips", v15, v16);
  }
  v85.receiver = self;
  v85.super_class = (Class)MDLSubmeshTopology;
  v20 = [(MDLSubmeshTopology *)&v85 init];
  if (v20)
  {
    v21 = objc_msgSend_topology(v7, v18, v19);

    if (v21)
    {
      v24 = objc_msgSend_topology(v7, v22, v23);
      uint64_t v27 = objc_msgSend_faceTopology(v24, v25, v26);
      faceTopology = v20->_faceTopology;
      v20->_faceTopology = (MDLMeshBuffer *)v27;

      v20->_faceCount = objc_msgSend_faceCount(v24, v29, v30);
      uint64_t v33 = objc_msgSend_vertexCreaseIndices(v24, v31, v32);
      vertexCreaseIndices = v20->_vertexCreaseIndices;
      v20->_vertexCreaseIndices = (MDLMeshBuffer *)v33;

      uint64_t v37 = objc_msgSend_vertexCreases(v24, v35, v36);
      vertexCreases = v20->_vertexCreases;
      v20->_vertexCreases = (MDLMeshBuffer *)v37;

      v20->_vertexCreaseCount = objc_msgSend_vertexCreaseCount(v24, v39, v40);
      v20->_edgeCreaseCount = objc_msgSend_edgeCreaseCount(v24, v41, v42);
      uint64_t v45 = objc_msgSend_edgeCreaseIndices(v24, v43, v44);
      edgeCreaseIndices = v20->_edgeCreaseIndices;
      v20->_edgeCreaseIndices = (MDLMeshBuffer *)v45;

      uint64_t v49 = objc_msgSend_edgeCreases(v24, v47, v48);
      edgeCreases = v20->_edgeCreases;
      v20->_edgeCreases = (MDLMeshBuffer *)v49;

      uint64_t v53 = objc_msgSend_holes(v24, v51, v52);
      holes = v20->_holes;
      v20->_holes = (MDLMeshBuffer *)v53;

      v20->_holeCount = objc_msgSend_holeCount(v24, v55, v56);
      v57 = v20;
    }
    else
    {
      unint64_t v58 = objc_msgSend_indexCount(v7, v22, v23);
      __p = 0;
      v83 = 0;
      uint64_t v84 = 0;
      switch(objc_msgSend_geometryType(v7, v59, v60))
      {
        case 0:
          char v81 = 1;
          v61 = (const char *)(v58 - (v83 - (unsigned char *)__p));
          if (v58 > v83 - (unsigned char *)__p) {
            goto LABEL_16;
          }
          if (v58 < v83 - (unsigned char *)__p)
          {
            v65 = (char *)__p + v58;
            goto LABEL_21;
          }
          break;
        case 1:
          unint64_t v62 = v58 >> 1;
          char v81 = 2;
          v63 = (char *)__p;
          BOOL v64 = v58 >> 1 >= v83 - (unsigned char *)__p;
          v61 = (const char *)((v58 >> 1) - (v83 - (unsigned char *)__p));
          if (v58 >> 1 <= v83 - (unsigned char *)__p) {
            goto LABEL_17;
          }
          goto LABEL_16;
        case 2:
          unint64_t v62 = v58 / 3;
          char v81 = 3;
          v63 = (char *)__p;
          BOOL v64 = v58 / 3 >= v83 - (unsigned char *)__p;
          v61 = (const char *)(v58 / 3 - (v83 - (unsigned char *)__p));
          if (v58 / 3 > v83 - (unsigned char *)__p) {
            goto LABEL_16;
          }
          goto LABEL_17;
        case 4:
          unint64_t v62 = v58 >> 2;
          char v81 = 4;
          v63 = (char *)__p;
          BOOL v64 = v58 >> 2 >= v83 - (unsigned char *)__p;
          v61 = (const char *)((v58 >> 2) - (v83 - (unsigned char *)__p));
          if (v58 >> 2 <= v83 - (unsigned char *)__p)
          {
LABEL_17:
            if (!v64)
            {
              v65 = &v63[v62];
LABEL_21:
              v83 = v65;
            }
          }
          else
          {
LABEL_16:
            sub_20B12FC7C(&__p, (unint64_t)v61, &v81);
          }
          break;
        default:
          break;
      }
      v66 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v61, (uint64_t)__p, v83 - (unsigned char *)__p);
      v69 = objc_msgSend_indexBuffer(v7, v67, v68);
      v72 = objc_msgSend_allocator(v69, v70, v71);
      v74 = (MDLMeshBuffer *)objc_msgSend_newBufferWithData_type_(v72, v73, (uint64_t)v66, 2);

      v75 = v20->_faceTopology;
      v20->_faceTopology = v74;
      v76 = v74;

      v78 = __p;
      v77 = v83;

      v20->_faceCount = v77 - v78;
      v79 = v20;

      if (__p)
      {
        v83 = __p;
        operator delete(__p);
      }
    }
  }

  return v20;
}

+ (id)decodeTopologyWithCoder:(id)a3 allocator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_alloc_init(MDLSubmeshTopology);
  v7->_faceCount = objc_msgSend_decodeIntegerForKey_(v5, v8, @"faceCount");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    uint64_t v11 = objc_msgSend_decodeMeshBufferWithCoder_forKey_(v9, v10, (uint64_t)v5, @"faceTopology");
    faceTopology = v7->_faceTopology;
    v7->_faceTopology = (MDLMeshBuffer *)v11;
  }

  return v7;
}

- (void)encodeTopologyWithCoder:(id)a3 allocator:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  objc_msgSend_encodeInteger_forKey_(v12, v7, self->_faceCount, @"faceCount");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    objc_msgSend_decodeMeshBufferWithCoder_forKey_(v8, v9, (uint64_t)v12, @"faceTopology");
    v10 = (MDLMeshBuffer *)objc_claimAutoreleasedReturnValue();
    faceTopology = self->_faceTopology;
    self->_faceTopology = v10;
  }
}

- (id)faceTopology
{
  return self->_faceTopology;
}

- (void)setFaceTopology:(id)faceTopology
{
}

- (NSUInteger)faceCount
{
  return self->_faceCount;
}

- (void)setFaceCount:(NSUInteger)faceCount
{
  self->_faceCount = faceCount;
}

- (id)vertexCreaseIndices
{
  return self->_vertexCreaseIndices;
}

- (void)setVertexCreaseIndices:(id)vertexCreaseIndices
{
}

- (id)vertexCreases
{
  return self->_vertexCreases;
}

- (void)setVertexCreases:(id)vertexCreases
{
}

- (NSUInteger)vertexCreaseCount
{
  return self->_vertexCreaseCount;
}

- (void)setVertexCreaseCount:(NSUInteger)vertexCreaseCount
{
  self->_vertexCreaseCount = vertexCreaseCount;
}

- (id)edgeCreaseIndices
{
  return self->_edgeCreaseIndices;
}

- (void)setEdgeCreaseIndices:(id)edgeCreaseIndices
{
}

- (id)edgeCreases
{
  return self->_edgeCreases;
}

- (void)setEdgeCreases:(id)edgeCreases
{
}

- (NSUInteger)edgeCreaseCount
{
  return self->_edgeCreaseCount;
}

- (void)setEdgeCreaseCount:(NSUInteger)edgeCreaseCount
{
  self->_edgeCreaseCount = edgeCreaseCount;
}

- (id)holes
{
  return self->_holes;
}

- (void)setHoles:(id)holes
{
}

- (NSUInteger)holeCount
{
  return self->_holeCount;
}

- (void)setHoleCount:(NSUInteger)holeCount
{
  self->_holeCount = holeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_holes, 0);
  objc_storeStrong((id *)&self->_edgeCreases, 0);
  objc_storeStrong((id *)&self->_edgeCreaseIndices, 0);
  objc_storeStrong((id *)&self->_vertexCreases, 0);
  objc_storeStrong((id *)&self->_vertexCreaseIndices, 0);

  objc_storeStrong((id *)&self->_faceTopology, 0);
}

@end