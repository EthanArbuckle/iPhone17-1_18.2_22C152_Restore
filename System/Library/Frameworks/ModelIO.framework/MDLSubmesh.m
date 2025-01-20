@interface MDLSubmesh
- (MDLGeometryType)geometryType;
- (MDLIndexBitDepth)indexType;
- (MDLMaterial)material;
- (MDLSubmesh)initWithIndexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material;
- (MDLSubmesh)initWithMDLSubmesh:(MDLSubmesh *)submesh indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType;
- (MDLSubmesh)initWithName:(NSString *)name indexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material;
- (MDLSubmesh)initWithName:(NSString *)name indexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material topology:(MDLSubmeshTopology *)topology;
- (MDLSubmesh)initWithName:(id)a3 indexBuffer:(id)a4 indexCount:(unint64_t)a5 indexType:(unint64_t)a6 faceIndexing:(id)a7 geometryType:(int64_t)a8 material:(id)a9 topology:(id)a10;
- (MDLSubmeshTopology)topology;
- (NSArray)faceIndexing;
- (NSString)name;
- (NSUInteger)indexCount;
- (id)indexBuffer;
- (id)indexBufferAsIndexType:(MDLIndexBitDepth)indexType;
- (void)boundingBoxForMesh:(float32x4_t *)a3@<X8>;
- (void)debugPrintToFile:(__sFILE *)a3;
- (void)setFaceIndexing:(id)a3;
- (void)setMaterial:(MDLMaterial *)material;
- (void)setName:(NSString *)name;
- (void)setTopology:(MDLSubmeshTopology *)topology;
@end

@implementation MDLSubmesh

- (MDLSubmesh)initWithName:(NSString *)name indexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material topology:(MDLSubmeshTopology *)topology
{
  return (MDLSubmesh *)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_faceIndexing_geometryType_material_topology_(self, a2, (uint64_t)name, indexBuffer, indexCount, indexType, 0, geometryType, material, topology);
}

- (MDLSubmesh)initWithName:(id)a3 indexBuffer:(id)a4 indexCount:(unint64_t)a5 indexType:(unint64_t)a6 faceIndexing:(id)a7 geometryType:(int64_t)a8 material:(id)a9 topology:(id)a10
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a9;
  id v17 = a10;
  if (objc_msgSend_type(v14, v18, v19) == 2 && (!v15 || v17) && (!v15 || a8 == 5))
  {
    v41.receiver = self;
    v41.super_class = (Class)MDLSubmesh;
    v37 = [(MDLSubmesh *)&v41 init];
    self = v37;
    if (v37)
    {
      objc_msgSend_null(MEMORY[0x263EFF9D0], v20, v21);
      v36 = (MDLMeshBufferAllocator *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqual_(v14, v22, (uint64_t)v36))
      {
        allocator = v36;
      }
      else
      {
        v35 = objc_msgSend_allocator(v14, v23, v24);

        if (!v35)
        {
LABEL_14:
          objc_storeStrong((id *)&v37->_indexBuffer, a4);
          objc_storeStrong((id *)&v37->_material, a9);
          objc_storeStrong((id *)&v37->_topology, a10);
          objc_storeStrong((id *)&v37->_faceIndexing, a7);
          uint64_t v33 = objc_msgSend_copy(v13, v31, v32);
          name = v37->_name;
          v37->_name = (NSString *)v33;

          v37->_indexCount = a5;
          v37->_geometryType = a8;
          v37->_indexType = a6;
          self = v37;
          v26 = self;
          goto LABEL_10;
        }
        uint64_t v30 = objc_msgSend_allocator(v14, v28, v29);
        allocator = v37->_allocator;
        v37->_allocator = (MDLMeshBufferAllocator *)v30;
      }

      goto LABEL_14;
    }
  }
  v26 = 0;
LABEL_10:

  return v26;
}

- (MDLSubmesh)initWithName:(NSString *)name indexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material
{
  v12 = name;
  id v13 = indexBuffer;
  id v14 = material;
  if (objc_msgSend_type(v13, v15, v16) != 2
    || (v36.receiver = self,
        v36.super_class = (Class)MDLSubmesh,
        uint64_t v19 = [(MDLSubmesh *)&v36 init],
        (self = v19) == 0))
  {
    uint64_t v32 = 0;
    goto LABEL_9;
  }
  allocator = objc_msgSend_null(MEMORY[0x263EFF9D0], v17, v18);
  if (objc_msgSend_isEqual_(v13, v21, (uint64_t)allocator)) {
    goto LABEL_6;
  }
  uint64_t v24 = objc_msgSend_allocator(v13, v22, v23);

  if (v24)
  {
    uint64_t v27 = objc_msgSend_allocator(v13, v25, v26);
    allocator = v19->_allocator;
    v19->_allocator = (MDLMeshBufferAllocator *)v27;
LABEL_6:
  }
  objc_storeStrong((id *)&v19->_indexBuffer, indexBuffer);
  objc_storeStrong((id *)&v19->_material, material);
  uint64_t v30 = objc_msgSend_copy(v12, v28, v29);
  v31 = v19->_name;
  v19->_name = (NSString *)v30;

  v19->_indexCount = indexCount;
  v19->_geometryType = geometryType;
  v19->_indexType = indexType;
  self = v19;
  uint64_t v32 = self;
LABEL_9:

  return v32;
}

- (MDLSubmesh)initWithIndexBuffer:(id)indexBuffer indexCount:(NSUInteger)indexCount indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType material:(MDLMaterial *)material
{
  return (MDLSubmesh *)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_(self, a2, (uint64_t)&stru_26BF51EF0, indexBuffer, indexCount, indexType, geometryType, material);
}

- (MDLSubmesh)initWithMDLSubmesh:(MDLSubmesh *)submesh indexType:(MDLIndexBitDepth)indexType geometryType:(MDLGeometryType)geometryType
{
  v8 = submesh;
  if (objc_msgSend_indexType(v8, v9, v10) != indexType || objc_msgSend_geometryType(v8, v11, v12) != geometryType)
  {
    uint64_t v36 = MEMORY[0x210532AA0]();
    objc_storeStrong((id *)&self->_allocator, v8->_allocator);
    v39 = objc_msgSend_indexBuffer(v8, v37, v38);
    context = (void *)v36;
    v42 = objc_msgSend_map(v39, v40, v41);

    v135 = v42;
    uint64_t v45 = objc_msgSend_bytes(v42, v43, v44);
    if (objc_msgSend_geometryType(v8, v46, v47) == 5)
    {
      objc_msgSend_topology(v8, v48, v49);
      v35 = (MDLSubmesh *)objc_claimAutoreleasedReturnValue();

      if (!v35)
      {
        v68 = 0;
        v55 = 0;
        goto LABEL_32;
      }
      v52 = objc_msgSend_topology(v8, v50, v51);
      v55 = objc_msgSend_faceTopology(v52, v53, v54);

      v58 = objc_msgSend_topology(v8, v56, v57);
      uint64_t v61 = objc_msgSend_faceCount(v58, v59, v60);

      if (v55)
      {
        v62 = objc_msgSend_map(v55, v48, v49);
        v65 = v62;
        if (v62) {
          uint64_t v66 = objc_msgSend_bytes(v62, v63, v64);
        }
        else {
          uint64_t v66 = 0;
        }

        char v67 = 0;
        goto LABEL_14;
      }
    }
    else
    {
      uint64_t v61 = 0;
      v55 = 0;
    }
    uint64_t v66 = 0;
    char v67 = 1;
LABEL_14:
    switch(indexType)
    {
      case MDLIndexBitDepthUInt32:
        v133 = self;
        char v132 = v67;
        __p = 0;
        v137 = 0;
        uint64_t v138 = 0;
        uint64_t v83 = objc_msgSend_indexCount(v8, v48, v49);
        uint64_t v86 = objc_msgSend_indexType(v8, v84, v85);
        uint64_t v89 = objc_msgSend_geometryType(v8, v87, v88);
        sub_20B1A4AFC(&__p, v45, v83, v66, v61, v86, v89, geometryType);
        v91 = __p;
        v90 = v137;
        id v92 = objc_alloc(MEMORY[0x263EFF8F8]);
        v68 = objc_msgSend_initWithBytes_length_(v92, v93, (uint64_t)__p, v137 - (unsigned char *)__p);
        uint64_t v82 = (v90 - v91) >> 2;
        goto LABEL_20;
      case MDLIndexBitDepthUInt16:
        v133 = self;
        char v132 = v67;
        __p = 0;
        v137 = 0;
        uint64_t v138 = 0;
        uint64_t v94 = objc_msgSend_indexCount(v8, v48, v49);
        uint64_t v97 = objc_msgSend_indexType(v8, v95, v96);
        uint64_t v100 = objc_msgSend_geometryType(v8, v98, v99);
        sub_20B1A2DD0(&__p, v45, v94, v66, v61, v97, v100, geometryType);
        v102 = __p;
        v101 = v137;
        id v103 = objc_alloc(MEMORY[0x263EFF8F8]);
        v68 = objc_msgSend_initWithBytes_length_(v103, v104, (uint64_t)__p, v137 - (unsigned char *)__p);
        uint64_t v82 = (v101 - v102) >> 1;
        goto LABEL_20;
      case MDLIndexBitDepthUInt8:
        v133 = self;
        char v132 = v67;
        __p = 0;
        v137 = 0;
        uint64_t v138 = 0;
        uint64_t v69 = objc_msgSend_indexCount(v8, v48, v49);
        uint64_t v72 = objc_msgSend_indexType(v8, v70, v71);
        uint64_t v75 = objc_msgSend_geometryType(v8, v73, v74);
        sub_20B1A0D0C(&__p, v45, v69, v66, v61, v72, v75, geometryType);
        v77 = __p;
        v76 = v137;
        id v78 = objc_alloc(MEMORY[0x263EFF8F8]);
        v68 = objc_msgSend_initWithBytes_length_(v78, v79, (uint64_t)__p, v137 - (unsigned char *)__p);
        uint64_t v82 = v76 - v77;
LABEL_20:
        if (__p)
        {
          v137 = __p;
          operator delete(__p);
        }
        v105 = objc_msgSend_indexBuffer(v8, v80, v81);
        v108 = objc_msgSend_allocator(v105, v106, v107);
        v110 = objc_msgSend_newBufferWithData_type_(v108, v109, (uint64_t)v68, 2);

        if (objc_msgSend_conformsToProtocol_(v110, v111, (uint64_t)&unk_26BF5ED88))
        {
          id v114 = v110;
          v116 = objc_msgSend_stringByAppendingString_(@"mesh", v115, @"-Indices");
          objc_msgSend_setName_(v114, v117, (uint64_t)v116);
        }
        if (((geometryType == MDLGeometryTypeVariableTopology) & v132) != 0) {
          v118 = 0;
        }
        else {
          v118 = v55;
        }
        if (v118 && objc_msgSend_conformsToProtocol_(v118, v112, (uint64_t)&unk_26BF5ED88))
        {
          id v119 = v118;
          v121 = objc_msgSend_stringByAppendingString_(@"mesh", v120, @"-Indices");
          objc_msgSend_setName_(v119, v122, (uint64_t)v121);
        }
        v123 = objc_msgSend_name(v8, v112, v113);
        v126 = objc_msgSend_material(v8, v124, v125);
        v129 = objc_msgSend_topology(v8, v127, v128);
        self = (MDLSubmesh *)(id)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_topology_(v133, v130, (uint64_t)v123, v110, v82, indexType, geometryType, v126, v129);

        v35 = self;
        v55 = v118;
        goto LABEL_32;
    }
    v35 = 0;
    v68 = 0;
LABEL_32:

    goto LABEL_33;
  }
  id v15 = objc_msgSend_name(v8, v13, v14);
  uint64_t v18 = objc_msgSend_indexBuffer(v8, v16, v17);
  uint64_t v21 = objc_msgSend_indexCount(v8, v19, v20);
  uint64_t v24 = objc_msgSend_indexType(v8, v22, v23);
  uint64_t v27 = objc_msgSend_geometryType(v8, v25, v26);
  uint64_t v30 = objc_msgSend_material(v8, v28, v29);
  uint64_t v33 = objc_msgSend_topology(v8, v31, v32);
  self = (MDLSubmesh *)(id)objc_msgSend_initWithName_indexBuffer_indexCount_indexType_geometryType_material_topology_(self, v34, (uint64_t)v15, v18, v21, v24, v27, v30, v33);

  v35 = self;
LABEL_33:

  return v35;
}

- (id)indexBufferAsIndexType:(MDLIndexBitDepth)indexType
{
  if (self->_indexType == indexType)
  {
    v4 = self->_indexBuffer;
    goto LABEL_37;
  }
  v6 = (void *)MEMORY[0x210532AA0]();
  __src = 0;
  char v67 = 0;
  uint64_t v68 = 0;
  sub_20B0A2BE0((uint64_t)&__src, self->_indexCount);
  unint64_t v9 = self->_indexType;
  switch(v9)
  {
    case 8uLL:
      uint64_t v18 = objc_msgSend_map(self->_indexBuffer, v7, v8);
      uint64_t v21 = (unsigned __int8 *)objc_msgSend_bytes(v18, v19, v20);

      unint64_t indexCount = self->_indexCount;
      if (indexCount)
      {
        uint64_t v23 = __src;
        do
        {
          int v24 = *v21++;
          *v23++ = v24;
          --indexCount;
        }
        while (indexCount);
      }
      break;
    case 0x10uLL:
      v25 = objc_msgSend_map(self->_indexBuffer, v7, v8);
      v28 = (unsigned __int16 *)objc_msgSend_bytes(v25, v26, v27);

      unint64_t v29 = self->_indexCount;
      if (v29)
      {
        uint64_t v30 = __src;
        do
        {
          int v31 = *v28++;
          *v30++ = v31;
          --v29;
        }
        while (v29);
      }
      break;
    case 0x20uLL:
      uint64_t v10 = objc_msgSend_map(self->_indexBuffer, v7, v8);
      id v13 = (int *)objc_msgSend_bytes(v10, v11, v12);

      unint64_t v15 = self->_indexCount;
      if (v15)
      {
        uint64_t v16 = __src;
        do
        {
          int v17 = *v13++;
          *v16++ = v17;
          --v15;
        }
        while (v15);
      }
      break;
    default:
      goto LABEL_25;
  }
  switch(indexType)
  {
    case MDLIndexBitDepthUInt32:
      objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v14, 8 * self->_indexCount);
      id v32 = objc_claimAutoreleasedReturnValue();
      uint64_t v44 = objc_msgSend_mutableBytes(v32, v42, v43);
      memcpy(v44, __src, 4 * self->_indexCount);
      uint64_t v47 = objc_msgSend_allocator(self->_indexBuffer, v45, v46);
      v4 = (MDLMeshBuffer *)objc_msgSend_newBufferWithData_type_(v47, v48, (uint64_t)v32, 2);

      if (!objc_msgSend_conformsToProtocol_(v4, v49, (uint64_t)&unk_26BF5ED88))
      {
LABEL_33:

        goto LABEL_34;
      }
LABEL_32:
      uint64_t v61 = v4;
      v63 = objc_msgSend_stringByAppendingString_(@"mesh", v62, @"-Indices");
      objc_msgSend_setName_(v61, v64, (uint64_t)v63);

      v4 = v61;
      goto LABEL_33;
    case MDLIndexBitDepthUInt16:
      objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v14, 8 * self->_indexCount);
      id v32 = objc_claimAutoreleasedReturnValue();
      v52 = (_WORD *)objc_msgSend_mutableBytes(v32, v50, v51);
      unint64_t v55 = self->_indexCount;
      if (v55)
      {
        v56 = (int *)__src;
        do
        {
          int v57 = *v56++;
          *v52++ = v57;
          --v55;
        }
        while (v55);
      }
      v58 = objc_msgSend_allocator(self->_indexBuffer, v53, v54);
      v4 = (MDLMeshBuffer *)objc_msgSend_newBufferWithData_type_(v58, v59, (uint64_t)v32, 2);

      if (!objc_msgSend_conformsToProtocol_(v4, v60, (uint64_t)&unk_26BF5ED88)) {
        goto LABEL_33;
      }
      goto LABEL_32;
    case MDLIndexBitDepthUInt8:
      objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v14, 8 * self->_indexCount);
      id v32 = objc_claimAutoreleasedReturnValue();
      uint64_t v35 = objc_msgSend_mutableBytes(v32, v33, v34);
      if (self->_indexCount)
      {
        unint64_t v38 = 0;
        do
        {
          *(unsigned char *)(v35 + v38) = *((_DWORD *)__src + v38);
          ++v38;
        }
        while (self->_indexCount > v38);
      }
      v39 = objc_msgSend_allocator(self->_indexBuffer, v36, v37);
      v4 = (MDLMeshBuffer *)objc_msgSend_newBufferWithData_type_(v39, v40, (uint64_t)v32, 2);

      if (!objc_msgSend_conformsToProtocol_(v4, v41, (uint64_t)&unk_26BF5ED88)) {
        goto LABEL_33;
      }
      goto LABEL_32;
  }
LABEL_25:
  v4 = 0;
LABEL_34:
  if (__src)
  {
    char v67 = __src;
    operator delete(__src);
  }
LABEL_37:

  return v4;
}

- (void)debugPrintToFile:(__sFILE *)a3
{
  fprintf(a3, "%lu ", self->_indexCount);
  unint64_t indexType = self->_indexType;
  switch(indexType)
  {
    case 0x20uLL:
      fwrite("32Bit Indices:\n", 0xFuLL, 1uLL, a3);
      objc_msgSend_map(self->_indexBuffer, v11, v12);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = objc_msgSend_bytes(v21, v13, v14);
      sub_20B12F4B4(v15, self->_indexCount);
      goto LABEL_7;
    case 0x10uLL:
      fwrite("16Bit Indices:\n", 0xFuLL, 1uLL, a3);
      objc_msgSend_map(self->_indexBuffer, v16, v17);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = objc_msgSend_bytes(v21, v18, v19);
      sub_20B12F420(v20, self->_indexCount);
      goto LABEL_7;
    case 8uLL:
      fwrite("8Bit Indices:\n", 0xEuLL, 1uLL, a3);
      objc_msgSend_map(self->_indexBuffer, v6, v7);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = objc_msgSend_bytes(v21, v8, v9);
      sub_20B12F38C(v10, self->_indexCount);
LABEL_7:

      return;
  }

  fwrite("INVALID INDEX TYPE!!!\n", 0x16uLL, 1uLL, a3);
}

- (void)boundingBoxForMesh:(float32x4_t *)a3@<X8>
{
  id v5 = a2;
  a3[1].i64[0] = 0;
  a3[1].i64[1] = 0;
  __asm { FMOV            V0.4S, #-1.0 }
  *a3 = _Q0;
  v11 = objc_msgSend_vertexAttributeDataForAttributeNamed_asFormat_(v5, v10, @"position", 786435);
  uint64_t v14 = v11;
  if (v11 && objc_msgSend_format(v11, v12, v13))
  {
    uint64_t v17 = objc_msgSend_dataStart(v14, v15, v16);
    uint64_t v20 = objc_msgSend_stride(v14, v18, v19);
    uint64_t v23 = v20;
    if (v17 && v20 != 0)
    {
      v25 = (void *)a1[3];
      if (v25)
      {
        uint64_t v26 = objc_msgSend_map(v25, v21, v22);
        unint64_t v29 = v26;
        if (v26 && objc_msgSend_bytes(v26, v27, v28))
        {
          uint64_t v34 = (unsigned __int16 *)objc_msgSend_bytes(v29, v30, v31);
          uint64_t v35 = a1[6];
          switch(v35)
          {
            case 8:
              for (uint64_t i = a1[2]; i; --i)
              {
                unsigned int v49 = *(unsigned __int8 *)v34;
                uint64_t v34 = (unsigned __int16 *)((char *)v34 + 1);
                unint64_t v50 = objc_msgSend_bufferSize(v14, v32, v33);
                uint64_t v52 = v23 * v49;
                if (v52 + 12 <= v50)
                {
                  uint64_t v53 = v17 + v52;
                  v51.i64[0] = *(void *)v53;
                  v51.i32[2] = *(_DWORD *)(v53 + 8);
                  float32x4_t v54 = v51;
                  float32x4_t v55 = v51;
                  sub_20B0A2540(a3, &v54);
                }
              }
              break;
            case 16:
              for (uint64_t j = a1[2]; j; --j)
              {
                unsigned int v43 = *v34++;
                unint64_t v44 = objc_msgSend_bufferSize(v14, v32, v33);
                uint64_t v46 = v23 * v43;
                if (v46 + 12 <= v44)
                {
                  uint64_t v47 = v17 + v46;
                  v45.i64[0] = *(void *)v47;
                  v45.i32[2] = *(_DWORD *)(v47 + 8);
                  float32x4_t v54 = v45;
                  float32x4_t v55 = v45;
                  sub_20B0A2540(a3, &v54);
                }
              }
              break;
            case 32:
              for (uint64_t k = a1[2]; k; --k)
              {
                unsigned int v37 = *(_DWORD *)v34;
                v34 += 2;
                unint64_t v38 = objc_msgSend_bufferSize(v14, v32, v33);
                uint64_t v40 = v23 * v37;
                if (v40 + 12 <= v38)
                {
                  uint64_t v41 = v17 + v40;
                  v39.i64[0] = *(void *)v41;
                  v39.i32[2] = *(_DWORD *)(v41 + 8);
                  float32x4_t v54 = v39;
                  float32x4_t v55 = v39;
                  sub_20B0A2540(a3, &v54);
                }
              }
              break;
          }
        }
      }
    }
  }
}

- (MDLMaterial)material
{
  return self->_material;
}

- (void)setMaterial:(MDLMaterial *)material
{
}

- (NSUInteger)indexCount
{
  return self->_indexCount;
}

- (id)indexBuffer
{
  return self->_indexBuffer;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (MDLGeometryType)geometryType
{
  return self->_geometryType;
}

- (MDLIndexBitDepth)indexType
{
  return self->_indexType;
}

- (MDLSubmeshTopology)topology
{
  return self->_topology;
}

- (void)setTopology:(MDLSubmeshTopology *)topology
{
}

- (NSArray)faceIndexing
{
  return self->_faceIndexing;
}

- (void)setFaceIndexing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIndexing, 0);
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_topology, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_indexBuffer, 0);

  objc_storeStrong((id *)&self->_material, 0);
}

@end