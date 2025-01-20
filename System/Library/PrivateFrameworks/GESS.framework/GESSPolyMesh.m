@interface GESSPolyMesh
- (BOOL)cloneFrom:(id)a3;
- (BOOL)getFaceData:(id)a3;
- (BOOL)getPositionData:(id)a3;
- (BOOL)getTexCoordData:(id)a3;
- (BOOL)getTexCoordFaceData:(id)a3;
- (BOOL)getVertexColorData:(id)a3;
- (BOOL)getVertexNormalData:(id)a3;
- (BOOL)getVertexNormalFaceData:(id)a3;
- (BOOL)valid;
- (GESSPolyMesh)init;
- (id).cxx_construct;
- (int)meshType;
- (unsigned)faceSize;
- (unsigned)halfEdgeSize;
- (unsigned)texCoordSize;
- (unsigned)vertexNormalSize;
- (unsigned)vertexSize;
- (void)materialImpl;
- (void)meshImpl;
- (void)setMaterialImpl:(const void *)a3;
- (void)setMeshImpl:(const void *)a3;
- (void)setMeshType:(int)a3;
@end

@implementation GESSPolyMesh

- (GESSPolyMesh)init
{
  v5.receiver = self;
  v5.super_class = (Class)GESSPolyMesh;
  v2 = [(GESSPolyMesh *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GESSPolyMesh *)v2 setMeshType:0xFFFFFFFFLL];
  }
  return v3;
}

- (int)meshType
{
  return self->_meshType;
}

- (void)setMeshType:(int)a3
{
  self->_meshType = a3;
}

- (void)meshImpl
{
  return self->_meshImpl.__ptr_;
}

- (void)setMeshImpl:(const void *)a3
{
  v4 = *(void **)a3;
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_meshImpl.__cntrl_;
  self->_meshImpl.__ptr_ = v4;
  self->_meshImpl.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)materialImpl
{
  return self->_materialImpl.__ptr_;
}

- (void)setMaterialImpl:(const void *)a3
{
  v4 = *(Material **)a3;
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_materialImpl.__cntrl_;
  self->_materialImpl.__ptr_ = v4;
  self->_materialImpl.__cntrl_ = (__shared_weak_count *)v3;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (BOOL)valid
{
  uint64_t v3 = [(GESSPolyMesh *)self meshImpl];
  if (v3) {
    LOBYTE(v3) = [(GESSPolyMesh *)self meshType] != -1 && [(GESSPolyMesh *)self meshType] != 0;
  }
  return (char)v3;
}

- (unsigned)vertexSize
{
  LODWORD(v3) = [(GESSPolyMesh *)self valid];
  if (v3)
  {
    if ([(GESSPolyMesh *)self meshType] == 1)
    {
      v4 = [(GESSPolyMesh *)self meshImpl];
      return (v4[14] - v4[13]) >> 2;
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

- (unsigned)halfEdgeSize
{
  unsigned int result = [(GESSPolyMesh *)self valid];
  if (result)
  {
    if ([(GESSPolyMesh *)self meshType] == 1)
    {
      v4 = [(GESSPolyMesh *)self meshImpl];
      return -858993459 * ((v4[17] - v4[16]) >> 2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (unsigned)faceSize
{
  LODWORD(v3) = [(GESSPolyMesh *)self valid];
  if (v3)
  {
    if ([(GESSPolyMesh *)self meshType] == 1)
    {
      v4 = [(GESSPolyMesh *)self meshImpl];
      return (v4[20] - v4[19]) >> 2;
    }
    else
    {
      LODWORD(v3) = 0;
    }
  }
  return v3;
}

- (unsigned)texCoordSize
{
  unsigned int result = [(GESSPolyMesh *)self valid];
  if (result)
  {
    if ([(GESSPolyMesh *)self meshType] != 1) {
      return 0;
    }
    v4 = [(GESSPolyMesh *)self meshImpl];
    std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::MESH_UVS[0]);
    objc_super v5 = v4 + 10;
    uint64_t v10 = 0;
    int v6 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector2T<float>>(v5, (uint64_t)&v10, (unsigned __int8 *)__p);
    if (v9 < 0) {
      operator delete(__p[0]);
    }
    if (v6 == -1)
    {
      return 0;
    }
    else
    {
      LODWORD(__p[0]) = v6;
      uint64_t v7 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector2T<float>>((uint64_t *)v5, (unsigned int *)__p);
      return (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
    }
  }
  return result;
}

- (unsigned)vertexNormalSize
{
  unsigned int result = [(GESSPolyMesh *)self valid];
  if (result)
  {
    if ([(GESSPolyMesh *)self meshType] == 1)
    {
      v4 = [(GESSPolyMesh *)self meshImpl];
      int v10 = 0;
      cv3d::cv::gess::io::ProvideAutoSavingNormalType(v4, &v10);
      if (v10 == 3)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::MESH_NORMAL[0]);
        objc_super v5 = (uint64_t *)(v4 + 10);
        v11[0] = 0;
        v11[1] = 0;
        int v6 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v4 + 10, (uint64_t)v11, (unsigned __int8 *)__p);
        if (v9 < 0) {
          operator delete(__p[0]);
        }
        LODWORD(__p[0]) = v6;
        uint64_t v7 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>(v5, (unsigned int *)__p);
        return (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16))(v7);
      }
      else if (v10 == 2)
      {
        return [(GESSPolyMesh *)self faceSize];
      }
      else
      {
        unsigned int result = 0;
        if (v10 == 1) {
          return [(GESSPolyMesh *)self vertexSize];
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)getPositionData:(id)a3
{
  id v4 = a3;
  if ([(GESSPolyMesh *)self valid]
    && [(GESSPolyMesh *)self meshType] == 1
    && (unsigned int v5 = -[GESSPolyMesh vertexSize](self, "vertexSize"), [v4 length] == 12 * v5))
  {
    uint64_t v6 = [v4 bytes];
    uint64_t v7 = [(GESSPolyMesh *)self meshImpl];
    unsigned int v16 = *((_DWORD *)v7 + 44);
    uint64_t v8 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v7 + 1, &v16);
    if (v5)
    {
      uint64_t v9 = 0;
      uint64_t v10 = *(void *)(v8 + 40);
      uint64_t v11 = (*(void *)(v8 + 48) - v10) >> 4;
      v12 = (int *)(v10 + 8);
      do
      {
        if (!v11) {
          __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
        }
        *(_DWORD *)(v6 + 4 * v9) = *(v12 - 2);
        *(_DWORD *)(v6 + 4 * (v9 + 1)) = *(v12 - 1);
        int v13 = *v12;
        v12 += 4;
        *(_DWORD *)(v6 + 4 * (v9 + 2)) = v13;
        --v11;
        v9 += 3;
      }
      while (3 * v5 != v9);
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)getFaceData:(id)a3
{
  id v4 = a3;
  if ([(GESSPolyMesh *)self valid] && [(GESSPolyMesh *)self meshType] == 1)
  {
    unsigned int v5 = [(GESSPolyMesh *)self faceSize];
    if ([v4 length] == 12 * v5)
    {
      uint64_t v6 = [v4 bytes];
      std::vector<cv3d::cv::gess::mesh::VertexHandle>::vector(__p, 3uLL);
      if (v5)
      {
        uint64_t v7 = 0;
        unsigned int v8 = 2;
        do
        {
          uint64_t v9 = [(GESSPolyMesh *)self meshImpl];
          unsigned int v13 = v7;
          cv3d::cv::gess::mesh::TriMesh::GetFaceVertices((uint64_t)v9, &v13, __p);
          uint64_t v10 = __p[0];
          *(_DWORD *)(v6 + 4 * (v8 - 2)) = *(_DWORD *)__p[0];
          *(_DWORD *)(v6 + 4 * (v8 - 1)) = v10[1];
          *(_DWORD *)(v6 + 4 * v8) = v10[2];
          ++v7;
          v8 += 3;
        }
        while (v5 != v7);
      }
      else
      {
        uint64_t v10 = __p[0];
        if (!__p[0])
        {
LABEL_12:
          BOOL v11 = 1;
          goto LABEL_9;
        }
      }
      __p[1] = v10;
      operator delete(v10);
      goto LABEL_12;
    }
  }
  BOOL v11 = 0;
LABEL_9:

  return v11;
}

- (BOOL)getTexCoordData:(id)a3
{
  id v4 = a3;
  if (![(GESSPolyMesh *)self valid] || [(GESSPolyMesh *)self meshType] != 1) {
    goto LABEL_12;
  }
  unsigned int v5 = [(GESSPolyMesh *)self meshImpl];
  std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::MESH_UVS[0]);
  uint64_t v6 = v5 + 10;
  uint64_t v22 = 0;
  int v7 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector2T<float>>(v6, (uint64_t)&v22, (unsigned __int8 *)__p);
  if (v21 < 0) {
    operator delete(__p[0]);
  }
  if (v7 != -1
    && (LODWORD(__p[0]) = v7,
        v8 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector2T<float>>((uint64_t *)v6, (unsigned int *)__p), int v9 = (*(uint64_t (**)(uint64_t))(*(void *)v8 + 16))(v8), [v4 length] == 8 * (v9 & 0x7FFFFFFF)))
  {
    uint64_t v10 = [v4 bytes];
    if (v9)
    {
      uint64_t v11 = v10;
      unint64_t v12 = 0;
      unsigned int v13 = 1;
      uint64_t v14 = 4;
      do
      {
        LODWORD(__p[0]) = v7;
        uint64_t v15 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector2T<float>>((uint64_t *)v6, (unsigned int *)__p);
        uint64_t v16 = *(void *)(v15 + 40);
        if (v12 >= (*(void *)(v15 + 48) - v16) >> 3) {
          __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
        }
        v17 = (_DWORD *)(v16 + v14);
        *(_DWORD *)(v11 + 4 * (v13 - 1)) = *(v17 - 1);
        *(_DWORD *)(v11 + 4 * v13) = *v17;
        ++v12;
        v14 += 8;
        v13 += 2;
      }
      while (v9 != v12);
    }
    BOOL v18 = 1;
  }
  else
  {
LABEL_12:
    BOOL v18 = 0;
  }

  return v18;
}

- (BOOL)getTexCoordFaceData:(id)a3
{
  id v4 = a3;
  if (![(GESSPolyMesh *)self valid] || [(GESSPolyMesh *)self meshType] != 1) {
    goto LABEL_12;
  }
  unsigned int v5 = [(GESSPolyMesh *)self meshImpl];
  std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::FACE_UV_ID[0]);
  uint64_t v6 = v5 + 7;
  int v22 = 0;
  uint64_t v21 = 0;
  int v7 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<unsigned int>>(v6, (uint64_t)&v21, (unsigned __int8 *)__p);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (v7 != -1 && (unsigned int v8 = -[GESSPolyMesh faceSize](self, "faceSize"), [v4 length] == 12 * v8))
  {
    uint64_t v9 = [v4 bytes];
    if (v8)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      unsigned int v12 = 2;
      uint64_t v13 = 4;
      do
      {
        LODWORD(__p[0]) = v7;
        uint64_t v14 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<unsigned int>>((uint64_t *)v6, (unsigned int *)__p);
        uint64_t v15 = *(void *)(v14 + 40);
        if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v14 + 48) - v15) >> 2) <= v11) {
          __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
        }
        uint64_t v16 = (_DWORD *)(v15 + v13);
        *(_DWORD *)(v10 + 4 * (v12 - 2)) = *(v16 - 1);
        *(_DWORD *)(v10 + 4 * (v12 - 1)) = *v16;
        *(_DWORD *)(v10 + 4 * v12) = v16[1];
        ++v11;
        v12 += 3;
        v13 += 12;
      }
      while (v8 != v11);
    }
    BOOL v17 = 1;
  }
  else
  {
LABEL_12:
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)getVertexNormalData:(id)a3
{
  id v4 = a3;
  if (![(GESSPolyMesh *)self valid] || [(GESSPolyMesh *)self meshType] != 1) {
    goto LABEL_36;
  }
  unsigned int v5 = [(GESSPolyMesh *)self meshImpl];
  id v6 = v4;
  uint64_t v7 = [v6 bytes];
  int v52 = 0;
  cv3d::cv::gess::io::ProvideAutoSavingNormalType(v5, &v52);
  if (v52 == 3)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::MESH_NORMAL[0]);
    v34 = v5 + 7;
    uint64_t v53 = 0;
    uint64_t v54 = 0;
    int v35 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v34, (uint64_t)&v53, (unsigned __int8 *)__p);
    if (v51 < 0) {
      operator delete(__p[0]);
    }
    LODWORD(__p[0]) = v35;
    uint64_t v36 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v34, (unsigned int *)__p);
    unsigned int v37 = (*(uint64_t (**)(uint64_t))(*(void *)v36 + 16))(v36);
    if ([v6 length] == 12 * v37)
    {
      uint64_t v38 = v37;
      if (v37)
      {
        unint64_t v39 = 0;
        unsigned int v40 = 2;
        uint64_t v41 = 4;
        do
        {
          LODWORD(__p[0]) = v35;
          uint64_t v42 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v34, (unsigned int *)__p);
          uint64_t v43 = *(void *)(v42 + 40);
          if (v39 >= (*(void *)(v42 + 48) - v43) >> 4) {
            goto LABEL_40;
          }
          *(_DWORD *)(v7 + 4 * (v40 - 2)) = *(_DWORD *)(v43 + v41 - 4);
          LODWORD(__p[0]) = v35;
          uint64_t v44 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v34, (unsigned int *)__p);
          uint64_t v45 = *(void *)(v44 + 40);
          if (v39 >= (*(void *)(v44 + 48) - v45) >> 4
            || (*(_DWORD *)(v7 + 4 * (v40 - 1)) = *(_DWORD *)(v45 + v41),
                LODWORD(__p[0]) = v35,
                uint64_t v46 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v34, (unsigned int *)__p), v47 = *(void *)(v46 + 40), v39 >= (*(void *)(v46 + 48) - v47) >> 4))
          {
LABEL_40:
            __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
          }
          *(_DWORD *)(v7 + 4 * v40) = *(_DWORD *)(v47 + v41 + 4);
          ++v39;
          v40 += 3;
          v41 += 16;
        }
        while (v38 != v39);
      }
      goto LABEL_35;
    }
    goto LABEL_36;
  }
  if (v52 == 2)
  {
    uint64_t v21 = (char *)v5[20] - (char *)v5[19];
    if ([v6 length] == 12 * (v21 >> 2))
    {
      std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::FACE_NORMAL[0]);
      int v22 = v5 + 7;
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      int v23 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v22, (uint64_t)&v53, (unsigned __int8 *)__p);
      if (v51 < 0) {
        operator delete(__p[0]);
      }
      if ((v21 & 0x3FFFFFFFCLL) != 0)
      {
        uint64_t v24 = 0;
        unint64_t v25 = 0;
        uint64_t v26 = ((unint64_t)v21 >> 2);
        unsigned int v27 = 2;
        do
        {
          LODWORD(__p[0]) = v23;
          uint64_t v28 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v22, (unsigned int *)__p);
          uint64_t v29 = *(void *)(v28 + 40);
          if (v25 >= (*(void *)(v28 + 48) - v29) >> 4) {
            goto LABEL_38;
          }
          *(_DWORD *)(v7 + 4 * (v27 - 2)) = *(_DWORD *)(v29 + v24);
          LODWORD(__p[0]) = v23;
          uint64_t v30 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v22, (unsigned int *)__p);
          uint64_t v31 = *(void *)(v30 + 40);
          if (v25 >= (*(void *)(v30 + 48) - v31) >> 4
            || (*(_DWORD *)(v7 + 4 * (v27 - 1)) = *(_DWORD *)(v31 + v24 + 4),
                LODWORD(__p[0]) = v23,
                uint64_t v32 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v22, (unsigned int *)__p), v33 = *(void *)(v32 + 40), v25 >= (*(void *)(v32 + 48) - v33) >> 4))
          {
LABEL_38:
            __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
          }
          *(_DWORD *)(v7 + 4 * v27) = *(_DWORD *)(v33 + v24 + 8);
          ++v25;
          v27 += 3;
          v24 += 16;
        }
        while (v26 != v25);
      }
      goto LABEL_35;
    }
LABEL_36:
    BOOL v48 = 0;
    goto LABEL_37;
  }
  if (v52 != 1) {
    goto LABEL_36;
  }
  uint64_t v8 = (char *)v5[14] - (char *)v5[13];
  if ([v6 length] != 12 * (v8 >> 2)) {
    goto LABEL_36;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::VERTEX_NORMAL[0]);
  uint64_t v9 = v5 + 1;
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  int v10 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v9, (uint64_t)&v53, (unsigned __int8 *)__p);
  if (v51 < 0) {
    operator delete(__p[0]);
  }
  if ((v8 & 0x3FFFFFFFCLL) != 0)
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = ((unint64_t)v8 >> 2);
    unsigned int v14 = 2;
    do
    {
      LODWORD(__p[0]) = v10;
      uint64_t v15 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v9, (unsigned int *)__p);
      uint64_t v16 = *(void *)(v15 + 40);
      if (v12 >= (*(void *)(v15 + 48) - v16) >> 4) {
        goto LABEL_39;
      }
      *(_DWORD *)(v7 + 4 * (v14 - 2)) = *(_DWORD *)(v16 + v11);
      LODWORD(__p[0]) = v10;
      uint64_t v17 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v9, (unsigned int *)__p);
      uint64_t v18 = *(void *)(v17 + 40);
      if (v12 >= (*(void *)(v17 + 48) - v18) >> 4
        || (*(_DWORD *)(v7 + 4 * (v14 - 1)) = *(_DWORD *)(v18 + v11 + 4),
            LODWORD(__p[0]) = v10,
            v19 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v9, (unsigned int *)__p), uint64_t v20 = *(void *)(v19 + 40), v12 >= (*(void *)(v19 + 48) - v20) >> 4))
      {
LABEL_39:
        __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
      }
      *(_DWORD *)(v7 + 4 * v14) = *(_DWORD *)(v20 + v11 + 8);
      ++v12;
      v14 += 3;
      v11 += 16;
    }
    while (v13 != v12);
  }
LABEL_35:
  BOOL v48 = 1;
LABEL_37:

  return v48;
}

- (BOOL)getVertexNormalFaceData:(id)a3
{
  id v4 = a3;
  if ([(GESSPolyMesh *)self valid] && [(GESSPolyMesh *)self meshType] == 1)
  {
    unsigned int v5 = [(GESSPolyMesh *)self meshImpl];
    uint64_t v6 = (char *)v5[20] - (char *)v5[19];
    uint64_t v7 = v6 >> 2;
    if ([v4 length] != 12 * (v6 >> 2)) {
      goto LABEL_12;
    }
    uint64_t v8 = [v4 bytes];
    int v32 = 0;
    cv3d::cv::gess::io::ProvideAutoSavingNormalType(v5, &v32);
    if (v32 != 1)
    {
      if (v32 == 3)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::FACE_NORMAL_ID[0]);
        uint64_t v13 = v5 + 7;
        int v34 = 0;
        uint64_t v33 = 0;
        int v14 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<unsigned int>>(v13, (uint64_t)&v33, (unsigned __int8 *)__p);
        if (v31 < 0) {
          operator delete(__p[0]);
        }
        if (v7)
        {
          unint64_t v15 = 0;
          uint64_t v16 = ((unint64_t)v6 >> 2);
          unsigned int v17 = 2;
          uint64_t v18 = 4;
          do
          {
            LODWORD(__p[0]) = v14;
            uint64_t v19 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<unsigned int>>((uint64_t *)v13, (unsigned int *)__p);
            uint64_t v20 = *(void *)(v19 + 40);
            if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v19 + 48) - v20) >> 2) <= v15) {
              goto LABEL_31;
            }
            *(_DWORD *)(v8 + 4 * (v17 - 2)) = *(_DWORD *)(v20 + v18 - 4);
            LODWORD(__p[0]) = v14;
            uint64_t v21 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<unsigned int>>((uint64_t *)v13, (unsigned int *)__p);
            uint64_t v22 = *(void *)(v21 + 40);
            if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(v21 + 48) - v22) >> 2) <= v15
              || (*(_DWORD *)(v8 + 4 * (v17 - 1)) = *(_DWORD *)(v22 + v18),
                  LODWORD(__p[0]) = v14,
                  uint64_t v23 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<unsigned int>>((uint64_t *)v13, (unsigned int *)__p), v24 = *(void *)(v23 + 40), 0xAAAAAAAAAAAAAAABLL * ((*(void *)(v23 + 48) - v24) >> 2) <= v15))
            {
LABEL_31:
              __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
            }
            *(_DWORD *)(v8 + 4 * v17) = *(_DWORD *)(v24 + v18 + 4);
            ++v15;
            v17 += 3;
            v18 += 12;
          }
          while (v16 != v15);
        }
        goto LABEL_28;
      }
      if (v32 == 2)
      {
        if (v7)
        {
          uint64_t v9 = 0;
          unsigned int v10 = 2;
          do
          {
            *(_DWORD *)(v8 + 4 * (v10 - 2)) = v9;
            *(_DWORD *)(v8 + 4 * (v10 - 1)) = v9;
            *(_DWORD *)(v8 + 4 * v10) = v9++;
            v10 += 3;
          }
          while (((unint64_t)v6 >> 2) != v9);
        }
        goto LABEL_28;
      }
LABEL_12:
      int v12 = 1;
LABEL_29:
      BOOL v11 = v12 == 0;
      goto LABEL_30;
    }
    std::vector<cv3d::cv::gess::mesh::VertexHandle>::vector(__p, 3uLL);
    if (v7)
    {
      uint64_t v25 = 0;
      uint64_t v26 = ((unint64_t)v6 >> 2);
      unsigned int v27 = 2;
      do
      {
        LODWORD(v33) = v25;
        cv3d::cv::gess::mesh::TriMesh::GetFaceVertices((uint64_t)v5, (unsigned int *)&v33, __p);
        uint64_t v28 = __p[0];
        *(_DWORD *)(v8 + 4 * (v27 - 2)) = *(_DWORD *)__p[0];
        *(_DWORD *)(v8 + 4 * (v27 - 1)) = v28[1];
        *(_DWORD *)(v8 + 4 * v27) = v28[2];
        ++v25;
        v27 += 3;
      }
      while (v26 != v25);
    }
    else
    {
      uint64_t v28 = __p[0];
      if (!__p[0])
      {
LABEL_28:
        int v12 = 0;
        goto LABEL_29;
      }
    }
    __p[1] = v28;
    operator delete(v28);
    goto LABEL_28;
  }
  BOOL v11 = 0;
LABEL_30:

  return v11;
}

- (BOOL)getVertexColorData:(id)a3
{
  id v4 = a3;
  if (![(GESSPolyMesh *)self valid] || [(GESSPolyMesh *)self meshType] != 1) {
    goto LABEL_12;
  }
  unsigned int v5 = [(GESSPolyMesh *)self meshImpl];
  std::string::basic_string[abi:ne180100]<0>(__p, cv3d::cv::gess::mesh::BUILT_IN_ATTRIBUTE::VERTEX_COLOR[0]);
  uint64_t v6 = v5 + 1;
  v21[0] = 0;
  v21[1] = 0;
  int v7 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>(v6, (uint64_t)v21, (unsigned __int8 *)__p);
  if (v20 < 0) {
    operator delete(__p[0]);
  }
  if (v7 != -1 && (unsigned int v8 = -[GESSPolyMesh vertexSize](self, "vertexSize"), [v4 length] == 12 * v8))
  {
    uint64_t v9 = [v4 bytes];
    if (v8)
    {
      uint64_t v10 = v9;
      unint64_t v11 = 0;
      unsigned int v12 = 2;
      uint64_t v13 = 4;
      do
      {
        LODWORD(__p[0]) = v7;
        uint64_t v14 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)v6, (unsigned int *)__p);
        uint64_t v15 = *(void *)(v14 + 40);
        if (v11 >= (*(void *)(v14 + 48) - v15) >> 4) {
          __assert_rtn("operator[]", "Attribute.h", 187, "index < data_.size()");
        }
        uint64_t v16 = (_DWORD *)(v15 + v13);
        *(_DWORD *)(v10 + 4 * (v12 - 2)) = *(v16 - 1);
        *(_DWORD *)(v10 + 4 * (v12 - 1)) = *v16;
        *(_DWORD *)(v10 + 4 * v12) = v16[1];
        ++v11;
        v12 += 3;
        v13 += 16;
      }
      while (v8 != v11);
    }
    BOOL v17 = 1;
  }
  else
  {
LABEL_12:
    BOOL v17 = 0;
  }

  return v17;
}

- (BOOL)cloneFrom:(id)a3
{
  id v4 = (GESSPolyMesh *)a3;
  unsigned int v5 = v4;
  if (self != v4)
  {
    if ([(GESSPolyMesh *)v4 valid])
    {
      int v6 = [(GESSPolyMesh *)self meshType];
      if (v6 == [(GESSPolyMesh *)v5 meshType])
      {
        if ([(GESSPolyMesh *)self meshImpl])
        {
LABEL_5:
          cv3d::cv::gess::mesh::PolyMesh::CloneFrom((uint64_t *)[(GESSPolyMesh *)self meshImpl], (void **)[(GESSPolyMesh *)v5 meshImpl]);
          if ([(GESSPolyMesh *)v5 materialImpl])
          {
            if (![(GESSPolyMesh *)self materialImpl])
            {
              int v7 = (char *)operator new(0x60uLL);
              *((void *)v7 + 1) = 0;
              *((void *)v7 + 2) = 0;
              *(void *)int v7 = &unk_2700D9070;
              *(_OWORD *)(v7 + 72) = 0u;
              *(_OWORD *)(v7 + 40) = 0u;
              *(_OWORD *)(v7 + 56) = 0u;
              *((void *)v7 + 11) = 0;
              *(_OWORD *)(v7 + 24) = 0u;
              *((void *)v7 + 9) = v7 + 80;
              uint64_t v13 = v7 + 24;
              uint64_t v14 = (std::__shared_weak_count *)v7;
              [(GESSPolyMesh *)self setMaterialImpl:&v13];
              if (v14) {
                std::__shared_weak_count::__release_shared[abi:ne180100](v14);
              }
            }
            unsigned int v8 = [(GESSPolyMesh *)self materialImpl];
            uint64_t v9 = [(GESSPolyMesh *)v5 materialImpl];
            uint64_t v10 = v9;
            if (v8 != (uint64_t **)v9)
            {
              std::vector<cv3d::cv::gess::mesh::ObjMaterial>::__assign_with_size[abi:ne180100]<cv3d::cv::gess::mesh::ObjMaterial*,cv3d::cv::gess::mesh::ObjMaterial*>((uint64_t)v8, *v9, v9[1], 0xAAAAAAAAAAAAAAABLL * (((char *)v9[1] - (char *)*v9) >> 4));
              std::vector<cv3d::cv::gess::mesh::Texture>::__assign_with_size[abi:ne180100]<cv3d::cv::gess::mesh::Texture*,cv3d::cv::gess::mesh::Texture*>((uint64_t)(v8 + 3), (int *)v10[3], (int *)v10[4], 0xAAAAAAAAAAAAAAABLL * (((char *)v10[4] - (char *)v10[3]) >> 4));
              std::__tree<std::__value_type<std::string,unsigned short>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned short>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned short>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,unsigned short>,std::__tree_node<std::__value_type<std::string,unsigned short>,void *> *,long>>(v8 + 6, v10[6], v10 + 7);
            }
          }
          goto LABEL_11;
        }
        if ([(GESSPolyMesh *)self meshType] == 1)
        {
          _ZNSt3__115allocate_sharedB8ne180100IN4cv3d2cv4gess4mesh7TriMeshENS_9allocatorIS5_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v15);
          long long v16 = v15;
          long long v15 = 0uLL;
          [(GESSPolyMesh *)self setMeshImpl:&v16];
          if (*((void *)&v16 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
          }
          if (*((void *)&v15 + 1)) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
          }
          goto LABEL_5;
        }
      }
    }
    BOOL v11 = 0;
    goto LABEL_18;
  }
LABEL_11:
  BOOL v11 = 1;
LABEL_18:

  return v11;
}

- (void).cxx_destruct
{
  cntrl = self->_materialImpl.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  id v4 = self->_meshImpl.__cntrl_;
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end