@interface SCNGeometryVDMCDeformerInstance
- (id)initWithNode:(uint64_t)a3 deformer:(uint64_t)a4 outputs:(uint64_t)a5 computeVertexCount:(void *)a6 context:;
- (id)meshForDeformedTopology;
- (unint64_t)updateWithContext:(id)a3;
- (void)dealloc;
@end

@implementation SCNGeometryVDMCDeformerInstance

- (id)initWithNode:(uint64_t)a3 deformer:(uint64_t)a4 outputs:(uint64_t)a5 computeVertexCount:(void *)a6 context:
{
  *(void *)((char *)&v185[2] + 4) = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v181.receiver = a1;
  v181.super_class = (Class)SCNGeometryVDMCDeformerInstance;
  id v124 = objc_msgSendSuper2(&v181, sel_init);
  if (!v124) {
    return 0;
  }
  uint64_t Geometry = C3DNodeGetGeometry([a2 nodeRef]);
  Mesh = (__C3DMesh *)C3DGeometryGetMesh(Geometry);
  v8 = (void *)[a6 _currentResourceManager];
  if (!C3DEntityGetName((uint64_t)Mesh)) {
    C3DEntityGetName(Geometry);
  }
  CFArrayRef ElementsCount = C3DMeshGetElementsCount((uint64_t)Mesh);
  id v117 = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:ElementsCount];
  *((void *)v124 + 2) = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:ElementsCount];
  id newValue = (id)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v8, (20 * ElementsCount), 32);
  memset(&v180, 0, sizeof(v180));
  v177 = 0;
  v178 = 0;
  uint64_t v179 = 0;
  v174 = 0;
  v175 = 0;
  uint64_t v176 = 0;
  v172 = 0;
  v171 = 0;
  uint64_t v173 = 0;
  unsigned int TotalTriangleCount = getTotalTriangleCount(Mesh);
  int v10 = (logf(3000000.0 / (float)TotalTriangleCount) / 1.38629436);
  long double v11 = exp2((double)v10 + (double)v10);
  int v116 = v10;
  printf("Original mesh has %d triangles, will reach a maximum of %d after %d levels of subdivision\n", TotalTriangleCount, (int)(v11 * (double)TotalTriangleCount), v10);
  if ((uint64_t)ElementsCount >= 1)
  {
    CFIndex v12 = 0;
    unint64_t v121 = v10 + 1;
    uint64_t v125 = (v10 + 1);
    do
    {
      CFIndex v123 = v12;
      ElementAtIndex = C3DMeshGetElementAtIndex((uint64_t)Mesh, v12, 1);
      unsigned int Type = C3DMeshElementGetType((uint64_t)ElementAtIndex);
      if (C3DMeshElementTypeMapsToMTLPrimitiveType(Type))
      {
        if (C3DMeshElementGetType((uint64_t)ElementAtIndex))
        {
          v15 = scn_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            -[SCNGeometryVDMCDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:](v182, &v183, v15);
          }
        }
        v16 = -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)v8, (uint64_t)ElementAtIndex);
        signed int v17 = -[SCNMTLResourceManager commandQueue]((uint64_t)v16);
        uint64_t PrimitiveCount = C3DMeshElementGetPrimitiveCount((uint64_t)ElementAtIndex);
        std::vector<unsigned int>::reserve(&v180, v180.__end_ - v180.__begin_ + v17);
        if (!-[SCNMTLMesh elements]((uint64_t)v16))
        {
          v19 = (void *)[(id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16) buffer];
          [a6 currentBlitEncoder];
          v20 = (void *)newUInt32BufferFromUInt16Buffer(v19, v17, (uint64_t)v8);
          v21 = objc_alloc_init(SCNMTLBuffer);
          -[SCNMTLMeshElement setIndexBuffer:](v16, (char *)v21);
          [(id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16) setBuffer:v20];
        }
        uint64_t v22 = [(id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16) contents];
        if (v17 >= 1)
        {
          uint64_t v23 = v22;
          uint64_t v24 = 0;
          std::vector<int>::pointer end = v180.__end_;
          do
          {
            if (end >= v180.__end_cap_.__value_)
            {
              std::vector<int>::pointer begin = v180.__begin_;
              uint64_t v28 = end - v180.__begin_;
              unint64_t v29 = v28 + 1;
              if ((unint64_t)(v28 + 1) >> 62) {
                abort();
              }
              int64_t v30 = (char *)v180.__end_cap_.__value_ - (char *)v180.__begin_;
              if (((char *)v180.__end_cap_.__value_ - (char *)v180.__begin_) >> 1 > v29) {
                unint64_t v29 = v30 >> 1;
              }
              if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v31 = v29;
              }
              if (v31)
              {
                v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<float>>((uint64_t)&v180.__end_cap_, v31);
                std::vector<int>::pointer begin = v180.__begin_;
                std::vector<int>::pointer end = v180.__end_;
              }
              else
              {
                v32 = 0;
              }
              v33 = (int *)&v32[4 * v28];
              int *v33 = *(_DWORD *)(v23 + 4 * v24);
              v26 = v33 + 1;
              while (end != begin)
              {
                int v34 = *--end;
                *--v33 = v34;
              }
              v180.__begin_ = v33;
              v180.__end_ = v26;
              v180.__end_cap_.__value_ = (int *)&v32[4 * v31];
              if (begin) {
                operator delete(begin);
              }
            }
            else
            {
              *std::vector<int>::pointer end = *(_DWORD *)(v23 + 4 * v24);
              v26 = end + 1;
            }
            v180.__end_ = v26;
            ++v24;
            std::vector<int>::pointer end = v26;
          }
          while (v24 != v17);
        }
        v35 = objc_alloc_init(SCNGeometryVDMCDeformerMeshElementData);
        __p = 0;
        long long v140 = 0uLL;
        std::vector<float>::__vallocate[abi:nn180100](&__p, v121);
        uint64_t v36 = v140;
        bzero((void *)v140, 4 * v121);
        *(void *)&long long v140 = v36 + 4 * v121;
        *(_DWORD *)__p = PrimitiveCount;
        v37 = (void *)[a6 currentBlitEncoder];
        v39 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)__p, v140 - (void)__p, v37);
        if (v35) {
          objc_setProperty_nonatomic(v35, v38, v39, 72);
        }

        v41 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v121];
        if (v35) {
          objc_setProperty_nonatomic(v35, v40, v41, 40);
        }
        uint64_t v42 = [(id)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16) buffer];
        if (v35) {
          triangleBufferChain = v35->_triangleBufferChain;
        }
        else {
          triangleBufferChain = 0;
        }
        [(NSMutableArray *)triangleBufferChain setObject:v42 atIndexedSubscript:0];

        v45 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v121];
        if (v35) {
          objc_setProperty_nonatomic(v35, v44, v45, 48);
        }

        unint64_t v46 = (int)PrimitiveCount;
        if (PrimitiveCount << 32)
        {
          if (PrimitiveCount << 32 < 0) {
            abort();
          }
          v47 = (char *)operator new((int)PrimitiveCount);
          memset(v47, 7, (int)PrimitiveCount);
          v48 = &v47[(int)PrimitiveCount];
        }
        else
        {
          v48 = 0;
          v47 = 0;
        }
        v50 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v47, v48 - v47, (void *)[a6 currentBlitEncoder]);
        [v50 setLabel:objc_msgSend(NSString, "stringWithFormat:", @"[VDMC] ConfigBuffer%d", 0)];
        if (v35) {
          configBufferChain = v35->_configBufferChain;
        }
        else {
          configBufferChain = 0;
        }
        [(NSMutableArray *)configBufferChain setObject:v50 atIndexedSubscript:0];

        v53 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v121];
        if (v35) {
          objc_setProperty_nonatomic(v35, v52, v53, 88);
        }
        uint64_t v54 = [NSNumber numberWithInt:PrimitiveCount];
        if (v35) {
          maxTrianglesAtLevel = v35->_maxTrianglesAtLevel;
        }
        else {
          maxTrianglesAtLevel = 0;
        }
        [(NSMutableArray *)maxTrianglesAtLevel setObject:v54 atIndexedSubscript:0];

        if (v116 >= 1)
        {
          double v56 = (double)(int)PrimitiveCount;
          uint64_t v57 = 1;
          do
          {
            uint64_t v58 = (exp2((double)(int)v57 + (double)(int)v57) * v56);
            uint64_t v59 = [NSNumber numberWithUnsignedInt:v58];
            if (v35) {
              v60 = v35->_maxTrianglesAtLevel;
            }
            else {
              v60 = 0;
            }
            [(NSMutableArray *)v60 setObject:v59 atIndexedSubscript:v57];
            int Size = SCNMTLIndexTypeGetSize(1);
            v62 = (void *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v8, (3 * v58 * Size), 32);
            [v62 setLabel:objc_msgSend(NSString, "stringWithFormat:", @"[VDMC] TriangleBuffer%d", v57)];
            if (v35) {
              v63 = v35->_triangleBufferChain;
            }
            else {
              v63 = 0;
            }
            [(NSMutableArray *)v63 setObject:v62 atIndexedSubscript:v57];

            v64 = (void *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v8, v58, 32);
            [v64 setLabel:objc_msgSend(NSString, "stringWithFormat:", @"[VDMC] ConfigBuffer%d", v57)];
            if (v35) {
              v65 = v35->_configBufferChain;
            }
            else {
              v65 = 0;
            }
            [(NSMutableArray *)v65 setObject:v64 atIndexedSubscript:v57];

            ++v57;
          }
          while (v125 != v57);
        }
        if (v35) {
          v35->_originaluint64_t PrimitiveCount = v46;
        }
        v66 = (void *)-[SCNMTLMeshElement indexBuffer]((uint64_t)v16);
        if (v35)
        {
          objc_setProperty_nonatomic(v35, v67, v66, 16);
          v68 = v35->_triangleBufferChain;
        }
        else
        {
          v68 = 0;
        }
        v69 = (void *)[(NSMutableArray *)v68 objectAtIndexedSubscript:v116];
        if (v35)
        {
          objc_setProperty_nonatomic(v35, v70, v69, 32);
          objc_setProperty_nonatomic(v35, v71, newValue, 112);
          uint64_t v72 = 20 * v123;
          v35->_drawIndexedPrimitivesIndirectBufferOffset = 20 * v123;
        }
        else
        {
          uint64_t v72 = 20 * v123;
        }
        v73 = (void *)[v8 computePipelineStateForKernel:@"VMeshAtomicSubdivisionKernel"];
        if (v35) {
          objc_setProperty_nonatomic(v35, v74, v73, 136);
        }
        v75 = (void *)[v8 computePipelineStateForKernel:@"VMeshUpdateCountersAndArgumentsKernel"];
        if (v35)
        {
          objc_setProperty_nonatomic(v35, v76, v75, 144);
          v35->_maxLevel = v116;
        }
        v77 = objc_alloc_init(SCNMTLBuffer);
        if (v35) {
          v78 = v35->_triangleBufferChain;
        }
        else {
          v78 = 0;
        }
        [(SCNMTLBuffer *)v77 setBuffer:[(NSMutableArray *)v78 objectAtIndexedSubscript:v116]];
        v79 = objc_alloc_init(SCNMTLMeshElement);
        -[SCNMTLMeshElement setIndexType:]((uint64_t)v79, 1);
        -[SCNMTLMeshElement setIndexBuffer:](v79, (char *)v77);
        -[SCNMTLMeshElement setIndexCount:]((uint64_t)v79, 0);
        -[SCNMTLMeshElement setInstanceCount:]((uint64_t)v79, 0);
        -[SCNMTLMesh setMutabilityTimestamp:]((uint64_t)v79, 3);
        -[SCNMTLMeshElement setDrawIndexedPrimitivesIndirectBuffer:](v79, (char *)newValue);
        -[SCNMTLMesh setVolatileOffset:]((uint64_t)v79, v72);

        [v117 addObject:v79];
        [*((id *)v124 + 2) addObject:v35];

        if (v47) {
          operator delete(v47);
        }
        if (__p)
        {
          *(void *)&long long v140 = __p;
          operator delete(__p);
        }
      }
      else
      {
        v49 = scn_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
          -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:](v184, v185, v49);
        }
      }
      CFIndex v12 = v123 + 1;
    }
    while ((const __CFArray *)(v123 + 1) != ElementsCount);
  }

  v80 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:C3DMeshGetSourcesCount((uint64_t)Mesh)];
  v81 = (void *)[MEMORY[0x263F12A80] vertexDescriptor];
  v170[0] = 0;
  v170[1] = v170;
  v170[2] = 0x2020000000;
  v170[3] = 0;
  v169[0] = MEMORY[0x263EF8330];
  v169[1] = 3221225472;
  v169[2] = __92__SCNGeometryVDMCDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke;
  v169[3] = &unk_26400A1E8;
  v169[4] = v170;
  v169[5] = &v177;
  v169[6] = &v174;
  v169[7] = &v171;
  C3DMeshApplySources((uint64_t)Mesh, 1, (uint64_t)v169);
  LODWORD(__p) = 0;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  long long v165 = 0u;
  long long v166 = 0u;
  long long v167 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  long long v155 = 0u;
  uint64_t v168 = 0;
  memset(&__x, 0, sizeof(__x));
  std::vector<int>::pointer v82 = v180.__begin_;
  int64_t v83 = (char *)v180.__end_ - (char *)v180.__begin_;
  if (v180.__end_ != v180.__begin_)
  {
    std::vector<float>::__vallocate[abi:nn180100](&__x, v83 >> 2);
    std::vector<unsigned int>::pointer v84 = __x.__end_;
    memmove(__x.__end_, v82, v83);
    __x.__end_ = &v84[v83 >> 2];
  }
  vmesh::DisplacedSubdivisionMesh::loadBaseMeshFromVectors((uint64_t)&__p, (uint64_t *)&v177, (uint64_t *)&v174, (uint64_t *)&v171, &__x);
  if (__x.__begin_)
  {
    __x.__end_ = __x.__begin_;
    operator delete(__x.__begin_);
  }
  vmesh::DisplacedSubdivisionMesh::preprocessForSCN((vmesh::DisplacedSubdivisionMesh *)&__p, v116);
  v135 = 0;
  v136 = 0;
  uint64_t v137 = 0;
  v85 = (const void *)*((void *)&v141 + 1);
  int64_t v86 = v142 - *((void *)&v141 + 1);
  if ((void)v142 != *((void *)&v141 + 1))
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8nn180100Em(&v135, v86 >> 4);
    v87 = (char *)v136;
    memmove(v136, v85, v86);
    v136 = &v87[16 * (v86 >> 4)];
  }
  v132 = 0;
  v133 = 0;
  uint64_t v134 = 0;
  v88 = (const void *)*((void *)&v144 + 1);
  int64_t v89 = v145 - *((void *)&v144 + 1);
  if ((void)v145 != *((void *)&v144 + 1))
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE11__vallocateB8nn180100Em(&v132, v89 >> 4);
    v90 = (char *)v133;
    memmove(v133, v88, v89);
    v133 = &v90[16 * (v89 >> 4)];
  }
  v129 = 0;
  v130 = 0;
  uint64_t v131 = 0;
  v91 = (const void *)v143;
  int64_t v92 = *((void *)&v143 + 1) - v143;
  if (*((void *)&v143 + 1) != (void)v143)
  {
    std::vector<Statement *>::__vallocate[abi:nn180100](&v129, v92 >> 3);
    v93 = (char *)v130;
    memmove(v130, v91, v92);
    v130 = &v93[8 * (v92 >> 3)];
  }
  v94 = (void *)[a6 currentBlitEncoder];
  v95 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v135, (unsigned char *)v136 - (unsigned char *)v135, v94);
  v96 = (void *)[a6 currentBlitEncoder];
  v97 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v132, (unsigned char *)v133 - (unsigned char *)v132, v96);
  v98 = (void *)[a6 currentBlitEncoder];
  v99 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v129, (unsigned char *)v130 - (unsigned char *)v129, v98);
  v100 = (void *)[a6 currentBlitEncoder];
  v101 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, v164, *((void *)&v164 + 1) - v164, v100);
  v102 = (void *)[a6 currentBlitEncoder];
  v103 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, v167, *((void *)&v167 + 1) - v167, v102);
  int v127 = (*((void *)&v164 + 1) - (void)v164) >> 2;
  int v128 = (*((void *)&v167 + 1) - (void)v167) >> 3;
  v104 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v8, (uint64_t)v126, 48, (void *)[a6 currentBlitEncoder]);
  +[SCNMTLResourceManager _fillVertexDescriptor:v81 withSemantic:0 inputSet:0 bufferIndex:0 vertexFormat:30 offset:0 stride:16];
  [v80 addObject:v95];
  +[SCNMTLResourceManager _fillVertexDescriptor:v81 withSemantic:1 inputSet:0 bufferIndex:1 vertexFormat:30 offset:0 stride:16];
  [v80 addObject:v97];
  +[SCNMTLResourceManager _fillVertexDescriptor:v81 withSemantic:3 inputSet:0 bufferIndex:2 vertexFormat:29 offset:0 stride:8];
  [v80 addObject:v99];
  if ((uint64_t)ElementsCount >= 1)
  {
    for (CFArrayRef i = 0; i != ElementsCount; CFArrayRef i = (const __CFArray *)((char *)i + 1))
    {
      v106 = (void *)[*((id *)v124 + 2) objectAtIndexedSubscript:i];
      if (v106) {
        objc_setProperty_nonatomic(v106, v107, v95, 24);
      }
      v108 = (void *)[*((id *)v124 + 2) objectAtIndexedSubscript:i];
      if (v108) {
        objc_setProperty_nonatomic(v108, v109, v101, 56);
      }
      v110 = (void *)[*((id *)v124 + 2) objectAtIndexedSubscript:i];
      if (v110) {
        objc_setProperty_nonatomic(v110, v111, v103, 64);
      }
      v112 = (void *)[*((id *)v124 + 2) objectAtIndexedSubscript:i];
      if (v112) {
        objc_setProperty_nonatomic(v112, v113, v104, 80);
      }
    }
  }

  v114 = objc_alloc_init(SCNMTLMesh);
  *((void *)v124 + 1) = v114;
  -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v114, v81);
  -[SCNMTLMesh setBuffers:](*((void **)v124 + 1), (char *)v80);
  -[SCNMTLMesh setElements:](*((void **)v124 + 1), (char *)v117);

  if (v129)
  {
    v130 = v129;
    operator delete(v129);
  }
  if (v132)
  {
    v133 = v132;
    operator delete(v132);
  }
  if (v135)
  {
    v136 = v135;
    operator delete(v135);
  }
  vmesh::DisplacedSubdivisionMesh::~DisplacedSubdivisionMesh((vmesh::DisplacedSubdivisionMesh *)&__p);
  _Block_object_dispose(v170, 8);
  if (v171)
  {
    v172 = v171;
    operator delete(v171);
  }
  if (v174)
  {
    v175 = v174;
    operator delete(v174);
  }
  if (v177)
  {
    v178 = v177;
    operator delete(v177);
  }
  if (v180.__begin_)
  {
    v180.__end_ = v180.__begin_;
    operator delete(v180.__begin_);
  }
  return v124;
}

void __92__SCNGeometryVDMCDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a4 <= 0)
  {
    if (C3DMeshSourceIsVolatile(a2))
    {
      v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(v7);
      }
    }
    else
    {
      uint64_t Content = C3DMeshSourceGetContent(a2);
      *(void *)(*(void *)(a1[4] + 8) + 24) = v14;
      if (a3)
      {
        if (a3 == 3)
        {
          if (*(void *)(*(void *)(a1[4] + 8) + 24))
          {
            LODWORD(v47) = 0;
            int v48 = v8;
            int v49 = v9;
            do
            {
              *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(v48, (float *)(Content + (v47 * v49)), v11, v12, v13);
              v50 = (void **)a1[6];
              v51 = v50[1];
              unint64_t v52 = (unint64_t)v50[2];
              if ((unint64_t)v51 >= v52)
              {
                uint64_t v54 = ((char *)v51 - (unsigned char *)*v50) >> 3;
                if ((unint64_t)(v54 + 1) >> 61) {
                  goto LABEL_68;
                }
                uint64_t v55 = v52 - (void)*v50;
                uint64_t v56 = v55 >> 2;
                if (v55 >> 2 <= (unint64_t)(v54 + 1)) {
                  uint64_t v56 = v54 + 1;
                }
                if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF8) {
                  unint64_t v57 = 0x1FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v57 = v56;
                }
                if (v57)
                {
                  float32x4_t v65 = v11;
                  uint64_t v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<Statement *>>((uint64_t)(v50 + 2), v57);
                  float32x4_t v11 = v65;
                }
                else
                {
                  uint64_t v58 = 0;
                }
                uint64_t v59 = &v58[8 * v54];
                *(void *)uint64_t v59 = v11.i64[0];
                v53 = v59 + 8;
                v61 = (char *)*v50;
                v60 = (char *)v50[1];
                if (v60 != *v50)
                {
                  do
                  {
                    uint64_t v62 = *((void *)v60 - 1);
                    v60 -= 8;
                    v11.i64[0] = v62;
                    *((void *)v59 - 1) = v62;
                    v59 -= 8;
                  }
                  while (v60 != v61);
                  v60 = (char *)*v50;
                }
                void *v50 = v59;
                v50[1] = v53;
                v50[2] = &v58[8 * v57];
                if (v60) {
                  operator delete(v60);
                }
              }
              else
              {
                void *v51 = v11.i64[0];
                v53 = v51 + 1;
              }
              v50[1] = v53;
              unint64_t v47 = (v47 + 1);
            }
            while (*(void *)(*(void *)(a1[4] + 8) + 24) > v47);
          }
        }
        else if (a3 == 1 && *(void *)(*(void *)(a1[4] + 8) + 24))
        {
          LODWORD(v15) = 0;
          int v16 = v8;
          int v17 = v9;
          do
          {
            *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(v16, (float *)(Content + (v15 * v17)), v11, v12, v13);
            v18 = (void **)a1[7];
            v19 = (float32x4_t *)v18[1];
            unint64_t v20 = (unint64_t)v18[2];
            if ((unint64_t)v19 >= v20)
            {
              uint64_t v22 = ((char *)v19 - (unsigned char *)*v18) >> 4;
              if ((unint64_t)(v22 + 1) >> 60) {
                goto LABEL_68;
              }
              uint64_t v23 = v20 - (void)*v18;
              uint64_t v24 = v23 >> 3;
              if (v23 >> 3 <= (unint64_t)(v22 + 1)) {
                uint64_t v24 = v22 + 1;
              }
              if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v25 = v24;
              }
              if (v25)
              {
                float32x4_t v63 = v11;
                v26 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v18 + 2), v25);
                float32x4_t v11 = v63;
              }
              else
              {
                v26 = 0;
              }
              v27 = (float32x4_t *)&v26[16 * v22];
              float32x4_t *v27 = v11;
              f32 = (_OWORD *)v27[1].f32;
              unint64_t v29 = (float32x4_t *)*v18;
              uint64_t v28 = (float32x4_t *)v18[1];
              if (v28 != *v18)
              {
                do
                {
                  float32x4_t v30 = v28[-1];
                  --v28;
                  float32x4_t v11 = v30;
                  v27[-1] = v30;
                  --v27;
                }
                while (v28 != v29);
                uint64_t v28 = (float32x4_t *)*v18;
              }
              *v18 = v27;
              v18[1] = f32;
              v18[2] = &v26[16 * v25];
              if (v28) {
                operator delete(v28);
              }
            }
            else
            {
              float32x4_t *v19 = v11;
              f32 = (_OWORD *)v19[1].f32;
            }
            v18[1] = f32;
            unint64_t v15 = (v15 + 1);
          }
          while (*(void *)(*(void *)(a1[4] + 8) + 24) > v15);
        }
      }
      else if (*(void *)(*(void *)(a1[4] + 8) + 24))
      {
        LODWORD(v31) = 0;
        int v32 = v8;
        int v33 = v9;
        do
        {
          *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(v32, (float *)(Content + (v31 * v33)), v11, v12, v13);
          int v34 = (void **)a1[5];
          v35 = (float32x4_t *)v34[1];
          unint64_t v36 = (unint64_t)v34[2];
          if ((unint64_t)v35 >= v36)
          {
            uint64_t v38 = ((char *)v35 - (unsigned char *)*v34) >> 4;
            if ((unint64_t)(v38 + 1) >> 60) {
LABEL_68:
            }
              abort();
            uint64_t v39 = v36 - (void)*v34;
            uint64_t v40 = v39 >> 3;
            if (v39 >> 3 <= (unint64_t)(v38 + 1)) {
              uint64_t v40 = v38 + 1;
            }
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v41 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v41 = v40;
            }
            if (v41)
            {
              float32x4_t v64 = v11;
              uint64_t v42 = (char *)_ZNSt3__119__allocate_at_leastB8nn180100INS_9allocatorIDv3_fEEEENS_19__allocation_resultINS_16allocator_traitsIT_E7pointerEEERS6_m((uint64_t)(v34 + 2), v41);
              float32x4_t v11 = v64;
            }
            else
            {
              uint64_t v42 = 0;
            }
            v43 = (float32x4_t *)&v42[16 * v38];
            float32x4_t *v43 = v11;
            v37 = (_OWORD *)v43[1].f32;
            v45 = (float32x4_t *)*v34;
            v44 = (float32x4_t *)v34[1];
            if (v44 != *v34)
            {
              do
              {
                float32x4_t v46 = v44[-1];
                --v44;
                float32x4_t v11 = v46;
                v43[-1] = v46;
                --v43;
              }
              while (v44 != v45);
              v44 = (float32x4_t *)*v34;
            }
            *int v34 = v43;
            v34[1] = v37;
            v34[2] = &v42[16 * v41];
            if (v44) {
              operator delete(v44);
            }
          }
          else
          {
            float32x4_t *v35 = v11;
            v37 = (_OWORD *)v35[1].f32;
          }
          v34[1] = v37;
          unint64_t v31 = (v31 + 1);
        }
        while (*(void *)(*(void *)(a1[4] + 8) + 24) > v31);
      }
    }
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryVDMCDeformerInstance;
  [(SCNGeometryVDMCDeformerInstance *)&v3 dealloc];
}

- (id)meshForDeformedTopology
{
  return self->_subdivMesh;
}

- (unint64_t)updateWithContext:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v5 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]([a3 _currentRenderContext]);
  [(MTLComputeCommandEncoder *)v5->_encoder pushDebugGroup:@"VDMC deformer"];
  memset(v46, 0, 192);
  if (a3)
  {
    [a3 _currentTransforms];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
    [a3 _currentFrustumInfo];
  }
  else
  {
    long long v44 = 0uLL;
    long long v45 = 0uLL;
    long long v42 = 0uLL;
    long long v43 = 0uLL;
    long long v40 = 0uLL;
    long long v41 = 0uLL;
    long long v39 = 0uLL;
  }
  int v38 = 1090519040;
  v6 = (void *)[(NSMutableArray *)self->_meshElementData objectAtIndexedSubscript:0];
  if (v6) {
    v7 = (MTLBuffer *)v6[3];
  }
  else {
    v7 = 0;
  }
  if (v5->_buffers[0] == v7)
  {
    if (!v5->_offsets[0]) {
      goto LABEL_10;
    }
  }
  else
  {
    v5->_buffers[0] = v7;
  }
  v5->_offsets[0] = 0;
  v5->_buffersToBind[0] |= 1uLL;
LABEL_10:
  if (v6) {
    unsigned __int8 v8 = (MTLBuffer *)v6[7];
  }
  else {
    unsigned __int8 v8 = 0;
  }
  if (v5->_buffers[1] == v8)
  {
    if (!v5->_offsets[1]) {
      goto LABEL_16;
    }
  }
  else
  {
    v5->_buffers[1] = v8;
  }
  v5->_offsets[1] = 0;
  v5->_buffersToBind[0] |= 2uLL;
LABEL_16:
  if (v6) {
    unsigned __int8 v9 = (MTLBuffer *)v6[8];
  }
  else {
    unsigned __int8 v9 = 0;
  }
  if (v5->_buffers[2] == v9)
  {
    if (!v5->_offsets[2]) {
      goto LABEL_22;
    }
  }
  else
  {
    v5->_buffers[2] = v9;
  }
  v5->_offsets[2] = 0;
  v5->_buffersToBind[0] |= 4uLL;
LABEL_22:
  if (v6) {
    int v10 = (MTLBuffer *)v6[10];
  }
  else {
    int v10 = 0;
  }
  if (v5->_buffers[15] != v10)
  {
    v5->_buffers[15] = v10;
LABEL_27:
    v5->_offsets[15] = 0;
    v5->_buffersToBind[0] |= 0x8000uLL;
    goto LABEL_28;
  }
  if (v5->_offsets[15]) {
    goto LABEL_27;
  }
LABEL_28:
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  meshElementData = self->_meshElementData;
  uint64_t v12 = [(NSMutableArray *)meshElementData countByEnumeratingWithState:&v34 objects:v47 count:16];
  if (!v12) {
    goto LABEL_83;
  }
  uint64_t v13 = v12;
  uint64_t v14 = *(void *)v35;
  do
  {
    uint64_t v15 = 0;
    do
    {
      if (*(void *)v35 != v14) {
        objc_enumerationMutation(meshElementData);
      }
      uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * v15);
      if (v16) {
        int v17 = *(MTLBuffer **)(v16 + 72);
      }
      else {
        int v17 = 0;
      }
      if (v5->_buffers[11] == v17)
      {
        if (!v5->_offsets[11]) {
          goto LABEL_39;
        }
      }
      else
      {
        v5->_buffers[11] = v17;
      }
      v5->_offsets[11] = 0;
      v5->_buffersToBind[0] |= 0x800uLL;
LABEL_39:
      SCNMTLComputeCommandEncoder::setBytes(v5, &v38, 4uLL, 0xAuLL);
      SCNMTLComputeCommandEncoder::setBytes(v5, v46, 0xC0uLL, 0xDuLL);
      SCNMTLComputeCommandEncoder::setBytes(v5, &v39, 0x70uLL, 0xEuLL);
      unsigned int v33 = 0;
      if (v16)
      {
        unint64_t v18 = *(void *)(v16 + 104);
        if (v18)
        {
          uint64_t v19 = 0;
          do
          {
            unsigned int v20 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 88), "objectAtIndex:", v19), "integerValue");
            uint64_t v21 = [*(id *)(v16 + 40) objectAtIndex:v33];
            if (v5->_buffers[3] == (MTLBuffer *)v21)
            {
              if (!v5->_offsets[3]) {
                goto LABEL_46;
              }
            }
            else
            {
              v5->_buffers[3] = (MTLBuffer *)v21;
            }
            v5->_offsets[3] = 0;
            v5->_buffersToBind[0] |= 8uLL;
LABEL_46:
            uint64_t v22 = [*(id *)(v16 + 40) objectAtIndex:v33 + 1];
            if (v5->_buffers[4] == (MTLBuffer *)v22)
            {
              if (!v5->_offsets[4]) {
                goto LABEL_50;
              }
            }
            else
            {
              v5->_buffers[4] = (MTLBuffer *)v22;
            }
            v5->_offsets[4] = 0;
            v5->_buffersToBind[0] |= 0x10uLL;
LABEL_50:
            uint64_t v23 = [*(id *)(v16 + 48) objectAtIndex:v33];
            if (v5->_buffers[6] == (MTLBuffer *)v23)
            {
              if (!v5->_offsets[6]) {
                goto LABEL_54;
              }
            }
            else
            {
              v5->_buffers[6] = (MTLBuffer *)v23;
            }
            v5->_offsets[6] = 0;
            v5->_buffersToBind[0] |= 0x40uLL;
LABEL_54:
            uint64_t v24 = [*(id *)(v16 + 48) objectAtIndex:v33 + 1];
            if (v5->_buffers[7] != (MTLBuffer *)v24)
            {
              v5->_buffers[7] = (MTLBuffer *)v24;
LABEL_57:
              v5->_offsets[7] = 0;
              v5->_buffersToBind[0] |= 0x80uLL;
              goto LABEL_58;
            }
            if (v5->_offsets[7]) {
              goto LABEL_57;
            }
LABEL_58:
            SCNMTLComputeCommandEncoder::setBytes(v5, &v33, 4uLL, 0xCuLL);
            uint64_t v25 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](*(void *)(v16 + 136));
            if (v5->_computePipelineState != (MTLComputePipelineState *)v25)
            {
              v5->_computePipelineState = (MTLComputePipelineState *)v25;
              [(MTLComputeCommandEncoder *)v5->_encoder setComputePipelineState:v25];
            }
            SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, v20);
            uint64_t v19 = ++v33;
            unint64_t v18 = *(void *)(v16 + 104);
          }
          while (v18 > v33);
        }
        unsigned int v33 = v18;
        SCNMTLComputeCommandEncoder::setBytes(v5, &v33, 4uLL, 0xCuLL);
        v26 = *(MTLBuffer **)(v16 + 72);
      }
      else
      {
        unsigned int v33 = 0;
        SCNMTLComputeCommandEncoder::setBytes(v5, &v33, 4uLL, 0xCuLL);
        v26 = 0;
      }
      if (v5->_buffers[11] == v26)
      {
        if (!v5->_offsets[11]) {
          goto LABEL_66;
        }
      }
      else
      {
        v5->_buffers[11] = v26;
      }
      v5->_offsets[11] = 0;
      v5->_buffersToBind[0] |= 0x800uLL;
LABEL_66:
      if (v16)
      {
        uint64_t v28 = *(MTLBuffer **)(v16 + 112);
        unint64_t v27 = *(void *)(v16 + 120);
      }
      else
      {
        uint64_t v28 = 0;
        unint64_t v27 = 0;
      }
      if (v5->_buffers[9] == v28)
      {
        if (v5->_offsets[9] == v27) {
          goto LABEL_72;
        }
      }
      else
      {
        v5->_buffers[9] = v28;
      }
      v5->_offsets[9] = v27;
      v5->_buffersToBind[0] |= 0x200uLL;
LABEL_72:
      if (v16) {
        uint64_t v29 = *(void *)(v16 + 144);
      }
      else {
        uint64_t v29 = 0;
      }
      uint64_t v30 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](v29);
      if (v5->_computePipelineState != (MTLComputePipelineState *)v30)
      {
        v5->_computePipelineState = (MTLComputePipelineState *)v30;
        [(MTLComputeCommandEncoder *)v5->_encoder setComputePipelineState:v30];
      }
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, 1);
      ++v15;
    }
    while (v15 != v13);
    uint64_t v31 = [(NSMutableArray *)meshElementData countByEnumeratingWithState:&v34 objects:v47 count:16];
    uint64_t v13 = v31;
  }
  while (v31);
LABEL_83:
  [(MTLComputeCommandEncoder *)v5->_encoder popDebugGroup];
  return 1;
}

- (void)initWithNode:(NSObject *)a3 deformer:outputs:computeVertexCount:context:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DMeshElementGetType(meshElement) == kC3DMeshElementTypeTrianglesArray";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. VDMC expects triangles", a1);
}

@end