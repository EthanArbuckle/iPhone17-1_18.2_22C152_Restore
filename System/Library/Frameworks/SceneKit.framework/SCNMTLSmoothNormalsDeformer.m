@interface SCNMTLSmoothNormalsDeformer
+ (unint64_t)requiredInputs;
+ (unint64_t)requiredOutputs;
+ (unint64_t)supportedOutputs;
- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4;
- (void)dealloc;
- (void)initWithMesh:(int)a3 dataKind:(void *)a4 resourceManager:(void *)a5 computeContext:;
@end

@implementation SCNMTLSmoothNormalsDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 3;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (void)initWithMesh:(int)a3 dataKind:(void *)a4 resourceManager:(void *)a5 computeContext:
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v94.receiver = a1;
  v94.super_class = (Class)SCNMTLSmoothNormalsDeformer;
  v8 = objc_msgSendSuper2(&v94, sel_init);
  if (!v8) {
    return 0;
  }
  v9 = v8;
  v75 = a5;
  SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(a2, 0, 0, a3);
  v76 = v9;
  *((_DWORD *)v9 + 4) = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
  CFArrayRef ElementsCount = C3DMeshGetElementsCount(a2);
  unsigned __int8 ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(a2, 0, 0);
  PositionSource = C3DMeshGetPositionSource(a2, 0);
  uint64_t Count = C3DMeshSourceGetCount((uint64_t)PositionSource);
  unsigned int v93 = 0;
  uint64_t PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable(a2, &v93);
  uint64_t PositionOriginalToFirstDeindexedTable = C3DMeshGetPositionOriginalToFirstDeindexedTable(a2);
  WeldRemappingTable = 0;
  if (!PositionOriginalToFirstDeindexedTable) {
    WeldRemappingTable = C3DMeshSourceCreateWeldRemappingTable((uint64_t)SourceWithSemanticAtIndex);
  }
  int v82 = Count;
  uint64_t v16 = Count;
  v83 = (int *)malloc_type_calloc(4uLL, Count, 0xD3CBBADEuLL);
  if ((uint64_t)ElementsCount >= 1)
  {
    for (CFIndex i = 0; (const __CFArray *)i != ElementsCount; ++i)
    {
      ElementAtIndex = C3DMeshGetElementAtIndex(a2, i, 0);
      uint64_t v100 = 0;
      long long v98 = 0u;
      __n128 v99 = 0u;
      long long v97 = 0u;
      C3DMeshElementGetContent((uint64_t)ElementAtIndex, ChannelForSourceWithSemanticAtIndex, (uint64_t)&v97);
      if ((BYTE10(v98) & 0xFA) != 0)
      {
        v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20B249000, v19, OS_LOG_TYPE_DEFAULT, "Warning: SCNMTLSmoothNormalsDeformer can only process triangles and polygons", buf, 2u);
        }
      }
      else
      {
        v91[0] = v97;
        v91[1] = v98;
        v91[2] = v99;
        uint64_t v92 = v100;
        v89[0] = MEMORY[0x263EF8330];
        v89[1] = 3221225472;
        v89[2] = __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke;
        v89[3] = &__block_descriptor_52_e19_v32__0I8_I12I20_B24l;
        int v90 = Count;
        v89[4] = WeldRemappingTable;
        v89[5] = v83;
        C3DIndicesContentEnumeratePrimitives((uint64_t *)v91, (uint64_t)v89, v99);
      }
    }
  }
  if (WeldRemappingTable && Count)
  {
    uint64_t v20 = 0;
    do
    {
      uint64_t v21 = WeldRemappingTable[v20];
      if (v20 != v21) {
        v83[v20] = v83[v21];
      }
      ++v20;
    }
    while (Count != v20);
  }
  v22 = malloc_type_malloc((4 * Count + 4) & 0x3FFFFFFFCLL, 0xDF8F86CDuLL);
  v23 = v22;
  _DWORD *v22 = 0;
  if (Count)
  {
    int v24 = 0;
    v25 = v22 + 1;
    uint64_t v26 = Count;
    v27 = v83;
    do
    {
      int v28 = *v27++;
      v24 += v28;
      *v25++ = v24;
      --v26;
    }
    while (v26);
  }
  unsigned int v29 = v93;
  if (!PositionOriginalToFirstDeindexedTable) {
    unsigned int v29 = Count;
  }
  unsigned int v77 = v29;
  BOOL v81 = v29 < 0x10000;
  int v30 = v22[Count];
  if (v29 < 0x10000) {
    char v31 = 1;
  }
  else {
    char v31 = 2;
  }
  if (v30)
  {
    uint64_t v72 = (4 * Count + 4) & 0x3FFFFFFFCLL;
    char v73 = v31;
    int v80 = v22[Count];
    unint64_t v71 = (unint64_t)(3 * v30) << v31;
    v32 = (char *)malloc_type_calloc(v71, 1uLL, 0x955092D7uLL);
    if ((uint64_t)ElementsCount >= 1)
    {
      for (CFIndex j = 0; (const __CFArray *)j != ElementsCount; ++j)
      {
        v34 = C3DMeshGetElementAtIndex(a2, j, 0);
        uint64_t v100 = 0;
        long long v98 = 0u;
        __n128 v99 = 0u;
        long long v97 = 0u;
        C3DMeshElementGetContent((uint64_t)v34, ChannelForSourceWithSemanticAtIndex, (uint64_t)&v97);
        if ((BYTE10(v98) & 0xFA) != 0)
        {
          v35 = scn_default_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20B249000, v35, OS_LOG_TYPE_DEFAULT, "Warning: SCNMTLSmoothNormalsDeformer can only process triangles and polygons", buf, 2u);
          }
        }
        else
        {
          v87[0] = v97;
          v87[1] = v98;
          v87[2] = v99;
          uint64_t v88 = v100;
          v84[0] = MEMORY[0x263EF8330];
          v84[1] = 3221225472;
          v84[2] = __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_3;
          v84[3] = &__block_descriptor_77_e19_v32__0I8_I12I20_B24l;
          v84[4] = WeldRemappingTable;
          v84[5] = v83;
          int v85 = v80;
          BOOL v86 = v81;
          v84[6] = v23;
          v84[7] = v32;
          v84[8] = v32;
          C3DIndicesContentEnumeratePrimitives((uint64_t *)v87, (uint64_t)v84, v99);
        }
      }
    }
    if (WeldRemappingTable)
    {
      v36 = v83;
      if (v82)
      {
        uint64_t v37 = 0;
        do
        {
          uint64_t v38 = WeldRemappingTable[v37];
          if (v37 != v38)
          {
            if (!v36[v37])
            {
              v39 = scn_default_log();
              BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_FAULT);
              v36 = v83;
              if (v40)
              {
                -[SCNMTLSmoothNormalsDeformer initWithMesh:dataKind:resourceManager:computeContext:]((uint8_t *)&v97, (long long *)((char *)&v97 + 4), v39);
                v36 = v83;
              }
            }
            if (v36[v38])
            {
              v41 = scn_default_log();
              BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_FAULT);
              v36 = v83;
              if (v42)
              {
                -[SCNMTLSmoothNormalsDeformer initWithMesh:dataKind:resourceManager:computeContext:](buf, &v96, v41);
                v36 = v83;
              }
            }
            uint64_t v43 = (3 * v23[v38]);
            uint64_t v44 = (3 * v23[v37]);
            uint64_t v45 = (3 * v36[v37]);
            if (HIWORD(v77))
            {
              v46 = &v32[4 * v44];
              size_t v47 = 4 * v45;
              v48 = &v32[4 * v43];
            }
            else
            {
              v46 = &v32[2 * v44];
              size_t v47 = 2 * v45;
              v48 = &v32[2 * v43];
            }
            memcpy(v46, v48, v47);
            v36 = v83;
          }
          ++v37;
        }
        while (v16 != v37);
      }
      free(WeldRemappingTable);
    }
    if (PositionDeindexedToOriginalTable)
    {
      uint64_t v50 = 4 * (v93 + 1);
      v51 = malloc_type_malloc(v50, 0x634B796FuLL);
      v52 = v51;
      _DWORD *v51 = 0;
      if (v93)
      {
        int v53 = 0;
        unint64_t v54 = 0;
        unsigned int v55 = v77;
        char v56 = v73;
        do
        {
          v53 += v23[*(_DWORD *)(PositionDeindexedToOriginalTable + 4 * v54) + 1]
               - v23[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v54)];
          v51[++v54] = v53;
        }
        while (v54 < v93);
        uint64_t v57 = (3 * v51[v93]);
      }
      else
      {
        uint64_t v57 = 0;
        unsigned int v55 = v77;
        char v56 = v73;
      }
      uint64_t v58 = v57 << v56;
      v59 = malloc_type_calloc(v57 << v56, 1uLL, 0x420A9430uLL);
      v60 = v59;
      if (v93)
      {
        for (unint64_t k = 0; k < v93; ++k)
        {
          uint64_t v62 = *(unsigned int *)(PositionDeindexedToOriginalTable + 4 * k);
          int v63 = v23[(v62 + 1)];
          int v64 = v23[v62];
          uint64_t v65 = (v63 - v64);
          unsigned int v66 = 3 * v64;
          unsigned int v67 = 3 * v52[k];
          if (v55 >= 0x10000)
          {
            if (v63 != v64)
            {
              do
              {
                *((_DWORD *)v59 + v67) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                   + 4 * *(unsigned int *)&v32[4 * v66]);
                *((_DWORD *)v59 + v67 + 1) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                       + 4 * *(unsigned int *)&v32[4 * v66 + 4]);
                *((_DWORD *)v59 + v67 + 2) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                       + 4 * *(unsigned int *)&v32[4 * v66 + 8]);
                v67 += 3;
                v66 += 3;
                --v65;
              }
              while (v65);
            }
          }
          else if (v63 != v64)
          {
            do
            {
              *((_WORD *)v59 + v67) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                + 4 * *(unsigned __int16 *)&v32[2 * v66]);
              *((_WORD *)v59 + v67 + 1) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                    + 4 * *(unsigned __int16 *)&v32[2 * v66 + 2]);
              *((_WORD *)v59 + v67 + 2) = *(_DWORD *)(PositionOriginalToFirstDeindexedTable
                                                    + 4 * *(unsigned __int16 *)&v32[2 * v66 + 4]);
              v67 += 3;
              v66 += 3;
              --v65;
            }
            while (v65);
          }
        }
      }
      v76[3] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)a4, (uint64_t)v52, v50, objc_msgSend(v75, "currentBlitEncoder", v71, v72));
      v76[4] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)a4, (uint64_t)v60, v58, (void *)[v75 currentBlitEncoder]);
      free(v52);
      free(v60);
    }
    else
    {
      v76[3] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)a4, (uint64_t)v23, v72, (void *)[v75 currentBlitEncoder]);
      v76[4] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)a4, (uint64_t)v32, v71, (void *)[v75 currentBlitEncoder]);
    }
    free(v32);
  }
  free(v83);
  free(v23);
  if (v77 >= 0x10000) {
    v68 = @"unify_u32";
  }
  else {
    v68 = @"unify_u16";
  }
  id v69 = (id)objc_msgSend(a4, "computePipelineStateForKernel:", v68, v71);
  v49 = v76;
  v76[5] = v69;
  return v49;
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  *(void *)&v21[5] = *MEMORY[0x263EF8340];
  if (a4 <= 2)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_cold_2(v7, v8, v9, v10, v11, v12, v13, v14);
      if (!a4) {
        return;
      }
    }
    else if (!a4)
    {
      return;
    }
  }
  uint64_t v15 = a4;
  do
  {
    uint64_t v16 = *(void *)(a1 + 32);
    v17 = a3;
    if (v16) {
      v17 = (unsigned int *)(v16 + 4 * *a3);
    }
    uint64_t v18 = *v17;
    if (v18 >= *(_DWORD *)(a1 + 48))
    {
      v19 = scn_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_cold_1(v20, v21, v19);
      }
    }
    ++*(_DWORD *)(*(void *)(a1 + 40) + 4 * v18);
    ++a3;
    --v15;
  }
  while (v15);
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_3(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  if (a4 <= 2)
  {
    v7 = scn_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_3_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
      if (!a4) {
        return;
      }
    }
    else if (!a4)
    {
      return;
    }
  }
  uint64_t v15 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v17 = a4;
  uint64_t v18 = a3;
  do
  {
    v19 = v18;
    if (v15) {
      v19 = (unsigned int *)(v15 + 4 * *v18);
    }
    uint64_t v20 = *v19;
    int v21 = *(_DWORD *)(v16 + 4 * v20);
    if (!v21) {
      break;
    }
    int v22 = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v20);
    int v23 = v21 - 1;
    *(_DWORD *)(v16 + 4 * v20) = v23;
    int v24 = v22 + v23;
    if ((v22 + v23) >= *(_DWORD *)(a1 + 72)) {
      break;
    }
    unsigned int v25 = *a3;
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v26 = *(void *)(a1 + 56);
      unsigned int v27 = 3 * v24;
      *(_WORD *)(v26 + 2 * v27) = v25;
      unsigned int v28 = a3[2];
      *(_WORD *)(v26 + 2 * (v27 + 1)) = a3[1];
      *(_WORD *)(v26 + 2 * (v27 + 2)) = v28;
    }
    else
    {
      uint64_t v29 = *(void *)(a1 + 64);
      unsigned int v30 = 3 * v24;
      *(_DWORD *)(v29 + 4 * v30) = v25;
      *(_DWORD *)(v29 + 4 * (v30 + 1)) = a3[1];
      *(_DWORD *)(v29 + 4 * (v30 + 2)) = a3[2];
    }
    ++v18;
    --v17;
  }
  while (v17);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLSmoothNormalsDeformer;
  [(SCNMTLSmoothNormalsDeformer *)&v3 dealloc];
}

- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4
{
  unint64_t v7 = [a3 currentFrameHash];
  if (self->_currentFrameHash == v7) {
    return 0;
  }
  self->_currentFrameHash = v7;
  uint64_t v9 = (SCNMTLComputeCommandEncoder *)[a3 currentComputeEncoder];
  bzero(v9, 0x678uLL);
  var1 = (MTLBuffer *)a4->var1;
  if (var1)
  {
    v9->_buffers[0] = var1;
    v9->_buffersToBind[0] |= 1uLL;
  }
  var3 = (MTLBuffer *)a4->var3;
  if (var3)
  {
    v9->_buffers[1] = var3;
    v9->_offsets[1] = 0;
    v9->_buffersToBind[0] |= 2uLL;
  }
  perVertexTrianglesOffsets = self->_perVertexTrianglesOffsets;
  if (perVertexTrianglesOffsets)
  {
    v9->_buffers[2] = perVertexTrianglesOffsets;
    v9->_offsets[2] = 0;
    v9->_buffersToBind[0] |= 4uLL;
  }
  perVertexTrianglesIndices = self->_perVertexTrianglesIndices;
  if (perVertexTrianglesIndices)
  {
    v9->_buffers[3] = perVertexTrianglesIndices;
    v9->_offsets[3] = 0;
    v9->_buffersToBind[0] |= 8uLL;
  }
  SCNMTLComputeCommandEncoder::setBytes(v9, &self->_baseVertexCount, 4uLL, 4uLL);
  uint64_t v14 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_smoothNormalsPipeline);
  baseVertexuint64_t Count = self->_baseVertexCount;
  if (v9->_computePipelineState != (MTLComputePipelineState *)v14)
  {
    v9->_computePipelineState = (MTLComputePipelineState *)v14;
    [(MTLComputeCommandEncoder *)v9->_encoder setComputePipelineState:v14];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v9, baseVertexCount);
  return 1;
}

- (void)initWithMesh:(NSObject *)a3 dataKind:resourceManager:computeContext:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "perVertexTriangleCount[weldedVertexIndex] == 0";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. welded vertices should have been entirely decremented", a1);
}

- (void)initWithMesh:(NSObject *)a3 dataKind:resourceManager:computeContext:.cold.2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "perVertexTriangleCount[vertexIndex] > 0";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. splitted vertices should not have been decremented yet", a1);
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_cold_1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "vertexIndex < originalVertexCount";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. indexed index overflow", a1);
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __84__SCNMTLSmoothNormalsDeformer_initWithMesh_dataKind_resourceManager_computeContext___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end