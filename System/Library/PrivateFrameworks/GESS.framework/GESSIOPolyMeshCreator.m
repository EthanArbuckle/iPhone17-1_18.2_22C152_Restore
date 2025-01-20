@interface GESSIOPolyMeshCreator
- (BOOL)clear;
- (BOOL)create:(id)a3;
- (BOOL)setFaceData:(id)a3;
- (BOOL)setFaceGroupIDData:(id)a3;
- (BOOL)setGroupIDToMaterialNameDict:(id)a3;
- (BOOL)setGroupNames:(id)a3;
- (BOOL)setMtlFilePath:(id)a3;
- (BOOL)setPositionData:(id)a3;
- (BOOL)setTexCoordData:(id)a3;
- (BOOL)setTexCoordFaceData:(id)a3;
- (BOOL)setVertexColorData:(id)a3;
- (BOOL)setVertexNormalData:(id)a3;
- (BOOL)setVertexNormalFaceData:(id)a3;
@end

@implementation GESSIOPolyMeshCreator

- (BOOL)setPositionData:(id)a3
{
  return 1;
}

- (BOOL)setFaceData:(id)a3
{
  return 1;
}

- (BOOL)setVertexNormalData:(id)a3
{
  return 1;
}

- (BOOL)setVertexNormalFaceData:(id)a3
{
  return 1;
}

- (BOOL)setVertexColorData:(id)a3
{
  return 1;
}

- (BOOL)setTexCoordData:(id)a3
{
  return 1;
}

- (BOOL)setTexCoordFaceData:(id)a3
{
  return 1;
}

- (BOOL)setFaceGroupIDData:(id)a3
{
  return 1;
}

- (BOOL)setGroupNames:(id)a3
{
  return 1;
}

- (BOOL)setGroupIDToMaterialNameDict:(id)a3
{
  return 1;
}

- (BOOL)setMtlFilePath:(id)a3
{
  return 1;
}

- (BOOL)create:(id)a3
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 meshType] == -1
    || ![v4 meshType]
    || ![(NSData *)self->_positionData length]
    || ![(NSData *)self->_faceData length])
  {
    goto LABEL_68;
  }
  [v4 meshType];
  BOOL v5 = __ROR8__(0xAAAAAAAAAAAAAAABLL * [(NSData *)self->_positionData length], 2) <= 0x1555555555555555uLL
    && __ROR8__(0xAAAAAAAAAAAAAAABLL * [(NSData *)self->_faceData length], 2) <= 0x1555555555555555uLL
    && __ROR8__(0xAAAAAAAAAAAAAAABLL * [(NSData *)self->_vertexNormalData length], 2) <= 0x1555555555555555uLL
    && ([(NSData *)self->_texCoordData length] & 7) == 0;
  NSUInteger v6 = [(NSData *)self->_vertexColorData length];
  if (v6) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v5;
  }
  if (v6 && v5)
  {
    NSUInteger v8 = [(NSData *)self->_vertexColorData length];
    BOOL v7 = v8 == [(NSData *)self->_positionData length];
  }
  NSUInteger v9 = [(NSData *)self->_texCoordFaceData length];
  if (v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v7;
  }
  if (v9 && v7)
  {
    NSUInteger v11 = [(NSData *)self->_texCoordFaceData length];
    BOOL v10 = v11 == [(NSData *)self->_faceData length];
  }
  NSUInteger v12 = [(NSData *)self->_vertexNormalFaceData length];
  if (!v12 || !v10)
  {
    if (v12) {
      BOOL v14 = 0;
    }
    else {
      BOOL v14 = v10;
    }
    if (!v14) {
      goto LABEL_68;
    }
  }
  else
  {
    NSUInteger v13 = [(NSData *)self->_vertexNormalFaceData length];
    if (v13 != [(NSData *)self->_faceData length])
    {
LABEL_68:
      char v46 = 0;
      goto LABEL_69;
    }
  }
  if ([v4 meshType] != 1)
  {
    char v46 = 1;
    goto LABEL_69;
  }
  NSUInteger v15 = [(NSData *)self->_faceData length];
  NSUInteger v16 = [(NSData *)self->_positionData length];
  unint64_t v17 = v15 / 0xC;
  faceGroupIDData = self->_faceGroupIDData;
  if (faceGroupIDData
    && [(NSData *)faceGroupIDData length]
    && [(NSData *)self->_faceGroupIDData length] != 2 * (v15 / 0xC))
  {
    goto LABEL_68;
  }
  v58 = v4;
  *(_OWORD *)__dst = 0u;
  *(_OWORD *)v68 = 0u;
  unint64_t v19 = v16 / 0xC;
  long long v69 = 0u;
  *(_OWORD *)v70 = 0u;
  *(_OWORD *)v71 = 0u;
  long long v72 = 0u;
  *(_OWORD *)v73 = 0u;
  *(_OWORD *)v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  *(_OWORD *)v77 = 0u;
  long long v78 = 0u;
  *(_OWORD *)v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  v82 = v83;
  v83[0] = 0;
  v83[1] = 0;
  memset(&v84, 0, sizeof(v84));
  int v85 = 1;
  unint64_t v20 = 3 * (v16 / 0xC);
  std::vector<float>::resize((uint64_t)__dst, v20);
  v21 = [(NSData *)self->_positionData bytes];
  if (3 * v19) {
    memmove(__dst[0], v21, 4 * v20);
  }
  std::vector<unsigned int>::size_type v22 = (3 * v17);
  std::vector<int>::resize((std::vector<unsigned int> *)v70, v22);
  v23 = [(NSData *)self->_faceData bytes];
  if (3 * v17) {
    memmove(v70[0], v23, 4 * v22);
  }
  NSUInteger v57 = [(NSData *)self->_vertexNormalData length] / 0xC;
  if ([(NSData *)self->_vertexNormalData length])
  {
    std::vector<float>::resize((uint64_t)&v77[1], (3 * v57));
    v24 = [(NSData *)self->_vertexNormalData bytes];
    if (3 * v57) {
      memmove(v77[1], v24, 4 * (3 * v57));
    }
  }
  if ([(NSData *)self->_vertexNormalFaceData length])
  {
    std::vector<int>::resize((std::vector<unsigned int> *)v73, v22);
    v25 = [(NSData *)self->_vertexNormalFaceData bytes];
    if (3 * v17) {
      memmove(v73[0], v25, 4 * v22);
    }
  }
  if ([(NSData *)self->_vertexColorData length])
  {
    std::vector<float>::resize((uint64_t)&v68[1], (3 * v19));
    v26 = [(NSData *)self->_vertexColorData bytes];
    if (3 * v19) {
      memmove(v68[1], v26, 4 * v20);
    }
  }
  if ([(NSData *)self->_texCoordData length])
  {
    NSUInteger v27 = [(NSData *)self->_texCoordData length];
    std::vector<float>::resize((uint64_t)v79, v27 >> 2);
    v28 = [(NSData *)self->_texCoordData bytes];
    if (v27 >= 4) {
      memmove(v79[0], v28, v27 & 0xFFFFFFFFFFFFFFFCLL);
    }
  }
  if ([(NSData *)self->_texCoordFaceData length])
  {
    NSUInteger v29 = [(NSData *)self->_texCoordFaceData length];
    std::vector<int>::resize((std::vector<unsigned int> *)&v71[1], v29 >> 2);
    v30 = [(NSData *)self->_texCoordFaceData bytes];
    if (v29 >= 4) {
      memmove(v71[1], v30, v29 & 0xFFFFFFFFFFFFFFFCLL);
    }
  }
  if ([(NSData *)self->_faceGroupIDData length])
  {
    NSUInteger v31 = [(NSData *)self->_faceGroupIDData length];
    std::vector<unsigned short>::resize((uint64_t)&v74[1], v31 >> 1);
    v32 = [(NSData *)self->_faceGroupIDData bytes];
    if (v31 >= 2) {
      memmove(v74[1], v32, v31 & 0xFFFFFFFFFFFFFFFELL);
    }
  }
  if ([(NSArray *)self->_groupNameArray count])
  {
    std::vector<std::string>::resize((std::vector<std::string> *)((char *)&v80 + 8), [(NSArray *)self->_groupNameArray count]);
    if (-1431655765 * (((void)v81 - *((void *)&v80 + 1)) >> 3))
    {
      uint64_t v33 = 0;
      unint64_t v34 = 0;
      do
      {
        id v35 = [(NSArray *)self->_groupNameArray objectAtIndexedSubscript:v34];
        v36 = (const std::string::value_type *)[v35 UTF8String];
        std::string::__assign_external((std::string *)(*((void *)&v80 + 1) + v33), v36);

        ++v34;
        v33 += 24;
      }
      while (v34 < -1431655765 * (((void)v81 - *((void *)&v80 + 1)) >> 3));
    }
  }
  if ([(NSDictionary *)self->_groupIDToMaterialNameDict count])
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    v37 = self->_groupIDToMaterialNameDict;
    unint64_t v38 = [(NSDictionary *)v37 countByEnumeratingWithState:&v63 objects:v86 count:16];
    if (v38)
    {
      uint64_t v39 = 0;
      uint64_t v40 = *(void *)v64;
      for (uint64_t i = *(void *)v64; ; uint64_t i = *(void *)v64)
      {
        if (i != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v63 + 1) + 8 * v39);
        LOWORD(v59) = 0;
        LOWORD(v59) = [v42 unsignedShortValue];
        id v43 = [(NSDictionary *)self->_groupIDToMaterialNameDict objectForKeyedSubscript:v42];
        v44 = (const std::string::value_type *)[v43 UTF8String];

        v61 = (cv3d::cv::gess::io *)&v59;
        v45 = std::__tree<std::__value_type<unsigned short,std::string>,std::__map_value_compare<unsigned short,std::__value_type<unsigned short,std::string>,std::less<unsigned short>,true>,std::allocator<std::__value_type<unsigned short,std::string>>>::__emplace_unique_key_args<unsigned short,std::piecewise_construct_t const&,std::tuple<unsigned short &&>,std::tuple<>>(&v82, (unsigned __int16 *)&v59, (uint64_t)&std::piecewise_construct, (_WORD **)&v61);
        std::string::__assign_external((std::string *)(v45 + 5), v44);
        if (++v39 >= v38)
        {
          unint64_t v38 = [(NSDictionary *)v37 countByEnumeratingWithState:&v63 objects:v86 count:16];
          if (!v38) {
            break;
          }
          uint64_t v39 = 0;
        }
      }
    }
  }
  if ([(NSString *)self->_mtlFilePath length]) {
    std::string::__assign_external(&v84, [(NSString *)self->_mtlFilePath UTF8String]);
  }
  id v4 = v58;
  if (v77[1] != (void *)v78)
  {
    if (v73[0] == v73[1])
    {
      if (v57 == v56) {
LABEL_82:
      }
        LODWORD(v51) = 1;
      else {
        LODWORD(v51) = 2 * (v57 == v17);
      }
    }
    else
    {
      uint64_t v48 = 0;
      unsigned int v49 = 1;
      while (*((_DWORD *)v70[0] + v48) == *((_DWORD *)v73[0] + v48))
      {
        uint64_t v48 = v49;
        if (((char *)v73[1] - (char *)v73[0]) >> 2 <= (unint64_t)v49++) {
          goto LABEL_82;
        }
      }
      if (v17)
      {
        int v52 = 0;
        while (1)
        {
          uint64_t v51 = 0;
          BOOL v53 = 1;
          do
          {
            while (!v53)
            {
              BOOL v53 = 0;
              if (++v51 == 3) {
                goto LABEL_96;
              }
            }
            int v54 = *((_DWORD *)v73[0] + (3 * v52 + v51));
            BOOL v53 = v52 == v54;
            ++v51;
          }
          while (v51 != 3);
          if (v52 != v54) {
            break;
          }
          ++v52;
          LODWORD(v51) = 2;
          if (v52 == v17) {
            goto LABEL_96;
          }
        }
        LODWORD(v51) = 3;
      }
      else
      {
        LODWORD(v51) = 2;
      }
    }
LABEL_96:
    int v85 = v51;
  }
  _ZNSt3__115allocate_sharedB8ne180100IN4cv3d2cv4gess4mesh7TriMeshENS_9allocatorIS5_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v61);
  v59 = v61;
  v60 = v62;
  if (v62) {
    atomic_fetch_add_explicit(&v62->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [v58 setMeshImpl:&v59];
  if (v60) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v60);
  }
  char v46 = cv3d::cv::gess::io::MeshFromObjContents((uint64_t **)v61, (std::string *)__dst, v55);
  if (v62) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v62);
  }
  cv3d::cv::gess::io::LoadObjContents::~LoadObjContents((cv3d::cv::gess::io::LoadObjContents *)__dst);
LABEL_69:

  return v46;
}

- (BOOL)clear
{
  positionData = self->_positionData;
  self->_positionData = 0;

  faceData = self->_faceData;
  self->_faceData = 0;

  vertexNormalData = self->_vertexNormalData;
  self->_vertexNormalData = 0;

  vertexNormalFaceData = self->_vertexNormalFaceData;
  self->_vertexNormalFaceData = 0;

  vertexColorData = self->_vertexColorData;
  self->_vertexColorData = 0;

  texCoordData = self->_texCoordData;
  self->_texCoordData = 0;

  texCoordFaceData = self->_texCoordFaceData;
  self->_texCoordFaceData = 0;

  faceGroupIDData = self->_faceGroupIDData;
  self->_faceGroupIDData = 0;

  groupNameArray = self->_groupNameArray;
  self->_groupNameArray = 0;

  groupIDToMaterialNameDict = self->_groupIDToMaterialNameDict;
  self->_groupIDToMaterialNameDict = 0;

  mtlFilePath = self->_mtlFilePath;
  self->_mtlFilePath = 0;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtlFilePath, 0);
  objc_storeStrong((id *)&self->_groupIDToMaterialNameDict, 0);
  objc_storeStrong((id *)&self->_groupNameArray, 0);
  objc_storeStrong((id *)&self->_faceGroupIDData, 0);
  objc_storeStrong((id *)&self->_texCoordFaceData, 0);
  objc_storeStrong((id *)&self->_texCoordData, 0);
  objc_storeStrong((id *)&self->_vertexColorData, 0);
  objc_storeStrong((id *)&self->_vertexNormalFaceData, 0);
  objc_storeStrong((id *)&self->_vertexNormalData, 0);
  objc_storeStrong((id *)&self->_faceData, 0);

  objc_storeStrong((id *)&self->_positionData, 0);
}

@end