@interface GTMeshData
- (BOOL)parseMaterialFile:(id)a3 error:(id *)a4;
- (BOOL)parseOBJFileWith:(id *)a3;
- (BOOL)readLine:(id)a3 error:(id *)a4;
- (GTMeshData)initWithURL:(id)a3 error:(id *)a4;
- (GTVertexData)vertexData;
- (NSDictionary)submeshes;
- (id).cxx_construct;
- (unint64_t)vertexCount;
- (unsigned)findIndexOrPushVertex:(const GTVertexData *)a3;
@end

@implementation GTMeshData

- (NSDictionary)submeshes
{
  return (NSDictionary *)self->_submeshes;
}

- (unint64_t)vertexCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_vertices.__end_ - self->_vertices.__begin_) >> 4);
}

- (GTVertexData)vertexData
{
  return self->_vertices.__begin_;
}

- (BOOL)parseMaterialFile:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v21 = a3;
  v6 = (void *)[[NSString alloc] initWithContentsOfURL:v21 encoding:4 error:a4];
  v20 = v6;
  if (v6)
  {
    v7 = v6;
    v8 = [v6 componentsSeparatedByString:@"\n"];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v9 = v8;
    v10 = 0;
    uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          if (sscanf((const char *)[*(id *)(*((void *)&v22 + 1) + 8 * i) UTF8String], " newmtl %256s", buf) == 1)
          {
            v14 = (void *)[[NSString alloc] initWithUTF8String:buf];
            uint64_t v15 = objc_opt_new();

            [(NSMutableDictionary *)self->_submeshes setObject:v15 forKeyedSubscript:v14];
            v10 = (void *)v15;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v9 = _ARLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      id v18 = *a4;
      *(_DWORD *)buf = 138543874;
      v28 = v17;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = v18;
      _os_log_impl(&dword_20B202000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to open .mtl file, error: %@.", buf, 0x20u);
    }
  }

  return v20 != 0;
}

- (unsigned)findIndexOrPushVertex:(const GTVertexData *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  p_vertexMap = &self->_vertexMap;
  v6 = std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::find<GTVertexData>(&self->_vertexMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)a3);
  if (v6) {
    return v6[4].u32[0];
  }
  p_vertices = &self->_vertices;
  int v9 = -1431655765 * ((unint64_t)(self->_vertices.__end_ - self->_vertices.__begin_) >> 4);
  float32x4_t v10 = *((float32x4_t *)a3 + 1);
  v29[0] = *(float32x4_t *)a3;
  v29[1] = v10;
  v29[2] = *((float32x4_t *)a3 + 2);
  int v30 = v9;
  std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::__emplace_unique_key_args<GTVertexData,std::pair<GTVertexData,unsigned int>>((uint64_t)p_vertexMap, (uint64_t)v29, v29);
  end = self->_vertices.__end_;
  value = self->_vertices.__end_cap_.__value_;
  if (end >= value)
  {
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((end - p_vertices->__begin_) >> 4);
    unint64_t v17 = v16 + 1;
    if (v16 + 1 > 0x555555555555555) {
      _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
    }
    unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((value - p_vertices->__begin_) >> 4);
    if (2 * v18 > v17) {
      unint64_t v17 = 2 * v18;
    }
    if (v18 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v19 = 0x555555555555555;
    }
    else {
      unint64_t v19 = v17;
    }
    if (v19) {
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<GTVertexData>>((uint64_t)&self->_vertices.__end_cap_, v19);
    }
    else {
      v20 = 0;
    }
    id v21 = &v20[48 * v16];
    long long v22 = (GTVertexData *)&v20[48 * v19];
    float32x4_t v23 = *(float32x4_t *)a3;
    long long v24 = *((_OWORD *)a3 + 2);
    *((_OWORD *)v21 + 1) = *((_OWORD *)a3 + 1);
    *((_OWORD *)v21 + 2) = v24;
    *(float32x4_t *)id v21 = v23;
    uint64_t v15 = (GTVertexData *)(v21 + 48);
    begin = self->_vertices.__begin_;
    long long v25 = self->_vertices.__end_;
    if (v25 != begin)
    {
      do
      {
        long long v27 = *((_OWORD *)v25 - 3);
        long long v28 = *((_OWORD *)v25 - 1);
        *((_OWORD *)v21 - 2) = *((_OWORD *)v25 - 2);
        *((_OWORD *)v21 - 1) = v28;
        *((_OWORD *)v21 - 3) = v27;
        v21 -= 48;
        long long v25 = (GTVertexData *)((char *)v25 - 48);
      }
      while (v25 != begin);
      long long v25 = p_vertices->__begin_;
    }
    self->_vertices.__begin_ = (GTVertexData *)v21;
    self->_vertices.__end_ = v15;
    self->_vertices.__end_cap_.__value_ = v22;
    if (v25) {
      operator delete(v25);
    }
  }
  else
  {
    float32x4_t v13 = *(float32x4_t *)a3;
    long long v14 = *((_OWORD *)a3 + 2);
    *((_OWORD *)end + 1) = *((_OWORD *)a3 + 1);
    *((_OWORD *)end + 2) = v14;
    *(float32x4_t *)end = v13;
    uint64_t v15 = (GTVertexData *)((char *)end + 48);
  }
  self->_vertices.__end_ = v15;
  return -1431655765 * ((unint64_t)(v15 - self->_vertices.__begin_) >> 4) - 1;
}

- (BOOL)readLine:(id)a3 error:(id *)a4
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v59 = 0;
  int v58 = 0;
  id v6 = a3;
  if (sscanf((const char *)[v6 UTF8String], " v %f %f %f", (char *)&v59 + 4, &v59, &v58) == 3)
  {
    unint64_t v8 = *(void *)&self->_anon_18[16];
    *(void *)&long long v7 = __PAIR64__(v59, HIDWORD(v59));
    DWORD2(v7) = v58;
    int v9 = *(_OWORD **)&self->_anon_18[8];
    if ((unint64_t)v9 >= v8)
    {
      long long v56 = v7;
      uint64_t v16 = *(void *)self->_anon_18;
      uint64_t v17 = ((uint64_t)v9 - v16) >> 4;
      if ((unint64_t)(v17 + 1) >> 60) {
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      }
      uint64_t v18 = v8 - v16;
      uint64_t v19 = v18 >> 3;
      if (v18 >> 3 <= (unint64_t)(v17 + 1)) {
        uint64_t v19 = v17 + 1;
      }
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v20 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v19;
      }
      if (v20) {
        id v21 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_18[16], v20);
      }
      else {
        id v21 = 0;
      }
      v35 = &v21[16 * v17];
      v36 = &v21[16 * v20];
      *(_OWORD *)v35 = v56;
      float32x4_t v10 = v35 + 16;
      v38 = *(char **)self->_anon_18;
      v37 = *(char **)&self->_anon_18[8];
      if (v37 != v38)
      {
        do
        {
          long long v39 = *((_OWORD *)v37 - 1);
          v37 -= 16;
          *((_OWORD *)v35 - 1) = v39;
          v35 -= 16;
        }
        while (v37 != v38);
        v37 = *(char **)self->_anon_18;
      }
      *(void *)self->_anon_18 = v35;
      *(void *)&self->_anon_18[8] = v10;
      *(void *)&self->_anon_18[16] = v36;
      if (v37) {
        operator delete(v37);
      }
    }
    else
    {
      _OWORD *v9 = v7;
      float32x4_t v10 = v9 + 1;
    }
    *(void *)&self->_anon_18[8] = v10;
    goto LABEL_46;
  }
  id v11 = v6;
  if (sscanf((const char *)[v11 UTF8String], " vn %f %f %f", (char *)&v59 + 4, &v59, &v58) == 3)
  {
    unint64_t v13 = *(void *)&self->_anon_30[16];
    *(void *)&long long v12 = __PAIR64__(v59, HIDWORD(v59));
    DWORD2(v12) = v58;
    long long v14 = *(_OWORD **)&self->_anon_30[8];
    if ((unint64_t)v14 >= v13)
    {
      long long v57 = v12;
      uint64_t v25 = *(void *)self->_anon_30;
      uint64_t v26 = ((uint64_t)v14 - v25) >> 4;
      if ((unint64_t)(v26 + 1) >> 60) {
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      }
      uint64_t v27 = v13 - v25;
      uint64_t v28 = v27 >> 3;
      if (v27 >> 3 <= (unint64_t)(v26 + 1)) {
        uint64_t v28 = v26 + 1;
      }
      if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v29 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v29 = v28;
      }
      if (v29) {
        int v30 = (char *)_ZNSt3__119__allocate_at_leastB8ne180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)&self->_anon_30[16], v29);
      }
      else {
        int v30 = 0;
      }
      v43 = &v30[16 * v26];
      v44 = &v30[16 * v29];
      *(_OWORD *)v43 = v57;
      uint64_t v15 = v43 + 16;
      v46 = *(char **)self->_anon_30;
      v45 = *(char **)&self->_anon_30[8];
      if (v45 != v46)
      {
        do
        {
          long long v47 = *((_OWORD *)v45 - 1);
          v45 -= 16;
          *((_OWORD *)v43 - 1) = v47;
          v43 -= 16;
        }
        while (v45 != v46);
        v45 = *(char **)self->_anon_30;
      }
      *(void *)self->_anon_30 = v43;
      *(void *)&self->_anon_30[8] = v15;
      *(void *)&self->_anon_30[16] = v44;
      if (v45) {
        operator delete(v45);
      }
    }
    else
    {
      _OWORD *v14 = v12;
      uint64_t v15 = v14 + 1;
    }
    *(void *)&self->_anon_30[8] = v15;
    goto LABEL_46;
  }
  id v22 = v11;
  if (sscanf((const char *)[v22 UTF8String], " f %d//%d %d//%d %d//%d", v66, v65, &v66[4], &v65[4], &v66[8], &v65[8]) == 6)
  {
    for (uint64_t i = 0; i != 3; ++i)
    {
      int v24 = *(_DWORD *)&v65[i * 4];
      *(_OWORD *)buf = *(_OWORD *)(*(void *)self->_anon_18 + 16 * (*(_DWORD *)&v66[i * 4] - 1));
      *(_OWORD *)&buf[16] = *(_OWORD *)(*(void *)self->_anon_30 + 16 * (v24 - 1));
      v63[i] = [(GTMeshData *)self findIndexOrPushVertex:buf];
    }
    [(GTSubmeshData *)self->_currentSubmesh addIndex:v63[0]];
    [(GTSubmeshData *)self->_currentSubmesh addIndex:v63[1]];
    [(GTSubmeshData *)self->_currentSubmesh addIndex:v63[2]];
    goto LABEL_46;
  }
  id v31 = v22;
  if (sscanf((const char *)[v31 UTF8String], " mtllib %256s", v64) == 1)
  {
    id v32 = (void *)[[NSString alloc] initWithUTF8String:v64];
    uint64_t v33 = [(NSURL *)self->_objUrl URLByDeletingLastPathComponent];
    v34 = [v33 URLByAppendingPathComponent:v32];

    [(GTMeshData *)self parseMaterialFile:v34 error:a4];
LABEL_46:
    BOOL v48 = 1;
    goto LABEL_47;
  }
  if (sscanf((const char *)[v31 UTF8String], " usemtl %256s", v64) != 1) {
    goto LABEL_46;
  }
  v40 = (void *)[[NSString alloc] initWithUTF8String:v64];
  v41 = [(NSMutableDictionary *)self->_submeshes objectForKeyedSubscript:v40];
  currentSubmesh = self->_currentSubmesh;
  self->_currentSubmesh = v41;

  if (self->_currentSubmesh)
  {

    goto LABEL_46;
  }
  v50 = _ARLogGeneral();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
  {
    v51 = (objc_class *)objc_opt_class();
    v52 = NSStringFromClass(v51);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v52;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2114;
    *(void *)&buf[24] = v40;
    _os_log_impl(&dword_20B202000, v50, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Encountered usemtl '%{public}@' command before newmtl", buf, 0x20u);
  }
  if (a4)
  {
    id v53 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v54 = *MEMORY[0x263F08338];
    v60[0] = *MEMORY[0x263F08320];
    v60[1] = v54;
    v61[0] = @"Loading a material file failed.";
    v61[1] = @"Encountered usemlt command in material file without newmtl.";
    v55 = [NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:2];
    *a4 = (id)[v53 initWithDomain:*MEMORY[0x263F20DE8] code:500 userInfo:v55];
  }
  BOOL v48 = 0;
LABEL_47:

  return v48;
}

- (BOOL)parseOBJFileWith:(id *)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v5 = (void *)[[NSString alloc] initWithContentsOfURL:self->_objUrl encoding:4 error:a3];
  if (v5)
  {
    id v6 = v5;
    long long v7 = [v5 componentsSeparatedByString:@"\n"];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          -[GTMeshData readLine:error:](self, "readLine:error:", *(void *)(*((void *)&v17 + 1) + 8 * i), a3, (void)v17);
          if (*a3)
          {

            return 0;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    *(void *)&self->_anon_18[8] = *(void *)self->_anon_18;
    *(void *)&self->_anon_30[8] = *(void *)self->_anon_30;
    std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::clear(&self->_vertexMap.__table_.__bucket_list_.__ptr_.__value_);
    return 1;
  }
  else
  {
    unint64_t v13 = _ARLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      id v16 = *a3;
      *(_DWORD *)buf = 138543874;
      float32x4_t v23 = v15;
      __int16 v24 = 2048;
      uint64_t v25 = self;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl(&dword_20B202000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to open .obj file, error: %@.", buf, 0x20u);
    }
    return 0;
  }
}

- (GTMeshData)initWithURL:(id)a3 error:(id *)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GTMeshData;
  id v8 = [(GTMeshData *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_objUrl, a3);
    uint64_t v10 = objc_opt_new();
    submeshes = v9->_submeshes;
    v9->_submeshes = (NSMutableDictionary *)v10;

    [(GTMeshData *)v9 parseOBJFileWith:a4];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objUrl, 0);
  std::__hash_table<std::__hash_value_type<GTVertexData,unsigned int>,std::__unordered_map_hasher<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::hash<GTVertexData>,std::equal_to<GTVertexData>,true>,std::__unordered_map_equal<GTVertexData,std::__hash_value_type<GTVertexData,unsigned int>,std::equal_to<GTVertexData>,std::hash<GTVertexData>,true>,std::allocator<std::__hash_value_type<GTVertexData,unsigned int>>>::~__hash_table((uint64_t)&self->_vertexMap);
  begin = self->_vertices.__begin_;
  if (begin)
  {
    self->_vertices.__end_ = begin;
    operator delete(begin);
  }
  v4 = *(void **)self->_anon_30;
  if (v4)
  {
    *(void *)&self->_anon_30[8] = v4;
    operator delete(v4);
  }
  v5 = *(void **)self->_anon_18;
  if (v5)
  {
    *(void *)&self->_anon_18[8] = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_currentSubmesh, 0);

  objc_storeStrong((id *)&self->_submeshes, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  return self;
}

@end