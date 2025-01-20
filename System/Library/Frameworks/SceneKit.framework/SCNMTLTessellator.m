@interface SCNMTLTessellator
- ($7A7BD8EC73F1DE0C75AE87F164959927)_pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4;
- (SCNMTLTessellator)initWithGeometry:(__C3DGeometry *)a3 resourceManager:(id)a4;
- (id)newPipelineStateConfiguratorForMeshElement:(id)a3 patchType:(unsigned __int8)a4 device:(id)a5;
- (unsigned)pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4;
- (void)constrainedEdgeLengthTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6;
- (void)dealloc;
- (void)draw:(id *)a3;
- (void)screenSpaceAdaptiveTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6;
- (void)subdivisionSurfaceTessellationDraw:(id *)a3;
- (void)uniformTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6;
- (void)update:(id *)a3;
- (void)updateConstrainedEdgeLengthTessellator:(id *)a3 parameters:(id *)a4;
- (void)updateScreenSpaceAdaptiveTessellator:(id *)a3 parameters:(id *)a4;
- (void)updateSubdivisionSurfaceTessellator:(id *)a3 parameters:(id *)a4;
- (void)updateUniformTessellator:(id *)a3;
@end

@implementation SCNMTLTessellator

- (SCNMTLTessellator)initWithGeometry:(__C3DGeometry *)a3 resourceManager:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SCNMTLTessellator;
  result = [(SCNMTLTessellator *)&v7 init];
  if (result)
  {
    result->_geometry = a3;
    result->_resourceManager = (SCNMTLResourceManager *)a4;
    *(void *)&result->_cachedTessellator.tessellationPartitionMode = 0;
    result->_cachedTessellator.parameters = 0;
    *(void *)&result->_cachedTessellator.type = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLTessellator;
  [(SCNMTLTessellator *)&v3 dealloc];
}

- ($7A7BD8EC73F1DE0C75AE87F164959927)_pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4
{
  int type = self->_cachedTessellator.type;
  if ((type - 1) < 3)
  {
    unsigned int tessellationPartitionMode = self->_cachedTessellator.tessellationPartitionMode;
LABEL_5:
    $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(tessellationPartitionMode & 3);
    goto LABEL_7;
  }
  if (type == 4)
  {
    GPUContext = C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
    LOBYTE(tessellationPartitionMode) = C3DSubdivisionOsdGPUGetTessellationPartitionMode((uint64_t)GPUContext);
    int type = self->_cachedTessellator.type;
    goto LABEL_5;
  }
  $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)1;
LABEL_7:
  if (type == 4)
  {
    C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
    $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 & 0xFFFFFFF3 | (4 * (C3DSceneSourceGetSceneCount() & 3)));
    int type = self->_cachedTessellator.type;
  }
  else if (type == 3)
  {
    $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 4);
    goto LABEL_12;
  }
  if ((type - 1) < 3)
  {
LABEL_12:
    uint64_t v10 = -[SCNMTLMesh elements]((uint64_t)a3);
    if (v10 == 1)
    {
      $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 0x20);
    }
    else if (v10)
    {
      v11 = scn_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLTessellator _pipelineStateHashForMeshElement:patchType:]((uint64_t)a3, v11);
      }
    }
    else
    {
      $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | 0x10);
    }
    goto LABEL_22;
  }
  if (type != 4)
  {
    if (!type) {
      return v9;
    }
    goto LABEL_23;
  }
  C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
  $7A7BD8EC73F1DE0C75AE87F164959927 v9 = ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 & 0xFFFFFFCF | (16 * (C3DParticleManagerGetUpdateQueue() & 3)));
LABEL_22:
  int type = self->_cachedTessellator.type;
LABEL_23:
  if ((type - 1) < 3) {
    return ($7A7BD8EC73F1DE0C75AE87F164959927)(*(_DWORD *)&v9 | ((self->_cachedTessellator.tessellationFactorScale != 1.0) << 6));
  }
  return v9;
}

- (unsigned)pipelineStateHashForMeshElement:(id)a3 patchType:(unsigned __int8)a4
{
  if ((a4 - 1) <= 1u && self->_cachedTessellator.type == 4) {
    return 0;
  }
  else {
    return -[SCNMTLTessellator _pipelineStateHashForMeshElement:patchType:](self, "_pipelineStateHashForMeshElement:patchType:", a3);
  }
}

- (id)newPipelineStateConfiguratorForMeshElement:(id)a3 patchType:(unsigned __int8)a4 device:(id)a5
{
  if ((a4 - 1) <= 1u && self->_cachedTessellator.type == 4) {
    return 0;
  }
  char v7 = (char)-[SCNMTLTessellator _pipelineStateHashForMeshElement:patchType:](self, "_pipelineStateHashForMeshElement:patchType:", a3);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__SCNMTLTessellator_newPipelineStateConfiguratorForMeshElement_patchType_device___block_invoke;
  v9[3] = &unk_26400B9F0;
  char v10 = v7;
  v9[4] = a5;
  return _Block_copy(v9);
}

uint64_t __81__SCNMTLTessellator_newPipelineStateConfiguratorForMeshElement_patchType_device___block_invoke(uint64_t a1, void *a2)
{
  [a2 setTessellationPartitionMode:*(unsigned char *)(a1 + 40) & 3];
  [a2 setTessellationFactorStepFunction:((unint64_t)*(unsigned __int8 *)(a1 + 40) >> 2) & 3];
  [a2 setTessellationControlPointIndexType:((unint64_t)*(unsigned __int8 *)(a1 + 40) >> 4) & 3];
  [a2 setTessellationFactorScaleEnabled:(*(unsigned __int8 *)(a1 + 40) >> 6) & 1];
  [a2 setTessellationFactorFormat:0];
  [a2 setTessellationOutputWindingOrder:1];
  uint64_t v4 = [*(id *)(a1 + 32) maxTessellationFactor];

  return [a2 setMaxTessellationFactor:v4];
}

- (void)update:(id *)a3
{
  __n128 v22 = 0uLL;
  unint64_t v23 = 0;
  C3DGeometryGetTessellator((uint64_t)self->_geometry, &v22);
  int v5 = v22.n128_u8[0];
  p_cachedTessellator = (__n128 *)&self->_cachedTessellator;
  if (v22.n128_u8[0] != self->_cachedTessellator.type)
  {

    self->_tessellationFactorBuffer = 0;
    int v5 = v22.n128_u8[0];
  }
  switch(v5)
  {
    case 0:
      char v7 = scn_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLTessellator update:](v7);
      }
      break;
    case 1:
      __n128 v20 = v22;
      unint64_t v21 = v23;
      [(SCNMTLTessellator *)self updateUniformTessellator:&v20];
      break;
    case 2:
      __n128 v18 = v22;
      unint64_t v19 = v23;
      long long v8 = *(_OWORD *)&a3->var2;
      v17[0] = *(_OWORD *)&a3->var0;
      v17[1] = v8;
      [(SCNMTLTessellator *)self updateScreenSpaceAdaptiveTessellator:&v18 parameters:v17];
      break;
    case 3:
      unint64_t v16 = v23;
      long long v9 = *(_OWORD *)&a3->var2;
      v14[0] = *(_OWORD *)&a3->var0;
      v14[1] = v9;
      __n128 v15 = v22;
      [(SCNMTLTessellator *)self updateConstrainedEdgeLengthTessellator:&v15 parameters:v14];
      break;
    case 4:
      unint64_t v13 = v23;
      long long v10 = *(_OWORD *)&a3->var2;
      v11[0] = *(_OWORD *)&a3->var0;
      v11[1] = v10;
      __n128 v12 = v22;
      [(SCNMTLTessellator *)self updateSubdivisionSurfaceTessellator:&v12 parameters:v11];
      break;
    default:
      break;
  }
  __n128 *p_cachedTessellator = v22;
  p_cachedTessellator[1].n128_u64[0] = v23;
}

- (void)draw:(id *)a3
{
  __n128 v10 = 0uLL;
  uint64_t v11 = 0;
  *(void *)&double v5 = C3DGeometryGetTessellator((uint64_t)self->_geometry, &v10).n128_u64[0];
  switch(v10.n128_u8[0])
  {
    case 0u:
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLTessellator update:](v6);
      }
      goto LABEL_4;
    case 1u:
LABEL_4:
      -[SCNMTLTessellator uniformTessellationDrawMeshElement:forMesh:instanceCount:renderContext:](self, "uniformTessellationDrawMeshElement:forMesh:instanceCount:renderContext:", a3->var3, a3->var1, a3->var4, a3->var5, v5);
      break;
    case 2u:
      -[SCNMTLTessellator screenSpaceAdaptiveTessellationDrawMeshElement:forMesh:instanceCount:renderContext:](self, "screenSpaceAdaptiveTessellationDrawMeshElement:forMesh:instanceCount:renderContext:", a3->var3, a3->var1, a3->var4, a3->var5, v5);
      break;
    case 3u:
      -[SCNMTLTessellator constrainedEdgeLengthTessellationDrawMeshElement:forMesh:instanceCount:renderContext:](self, "constrainedEdgeLengthTessellationDrawMeshElement:forMesh:instanceCount:renderContext:", a3->var3, a3->var1, a3->var4, a3->var5, v5);
      break;
    case 4u:
      long long v7 = *(_OWORD *)&a3->var2;
      v8[0] = *(_OWORD *)&a3->var0;
      v8[1] = v7;
      v8[2] = *(_OWORD *)&a3->var4;
      uint64_t v9 = *(void *)&a3->var6;
      [(SCNMTLTessellator *)self subdivisionSurfaceTessellationDraw:v8];
      break;
    default:
      return;
  }
}

- (void)updateUniformTessellator:(id *)a3
{
  float var0 = a3->var4.var0.var0;
  float var1 = a3->var4.var0.var1;
  int v6 = HIWORD(LODWORD(var0)) & 0x8000;
  unsigned int v7 = (LODWORD(var0) >> 23);
  unsigned int v8 = v7 - 112;
  __int16 v9 = v6 | 0x7BFF;
  if (v7 == 255) {
    __int16 v9 = v6 | ((LODWORD(var0) & 0x7FFFFF) != 0) | 0x7C00;
  }
  unsigned int v10 = v7 - 113;
  if (v7 >= 0x71) {
    LOWORD(v11) = v9;
  }
  else {
    int v11 = HIWORD(LODWORD(var0)) & 0x8000;
  }
  int v12 = HIWORD(LODWORD(var0)) & 0x8000 | (LODWORD(var0) >> 13) & 0x3FF | (v8 << 10);
  if (v10 > 0x1D) {
    LOWORD(v12) = v11;
  }
  WORD2(v21) = v12;
  WORD1(v21) = v12;
  LOWORD(v21) = v12;
  int v13 = HIWORD(LODWORD(var1)) & 0x8000;
  unsigned int v14 = (LODWORD(var1) >> 23);
  unsigned int v15 = v14 - 112;
  unsigned int v16 = v14 - 113;
  __int16 v17 = v13 | 0x7BFF;
  if (v14 == 255) {
    __int16 v17 = v13 | ((LODWORD(var1) & 0x7FFFFF) != 0) | 0x7C00;
  }
  if (v14 >= 0x71) {
    LOWORD(v18) = v17;
  }
  else {
    int v18 = HIWORD(LODWORD(var1)) & 0x8000;
  }
  int v19 = HIWORD(LODWORD(var1)) & 0x8000 | (LODWORD(var1) >> 13) & 0x3FF | (v15 << 10);
  if (v16 > 0x1D) {
    LOWORD(v19) = v18;
  }
  HIWORD(v21) = v19;
  tessellationFactorBuffer = self->_tessellationFactorBuffer;
  if (tessellationFactorBuffer)
  {
    if (*(void *)&a3->var4 != *(void *)&self->_cachedTessellator.parameters) {
      *(void *)[(MTLBuffer *)tessellationFactorBuffer contents] = v21;
    }
  }
  else
  {
    self->_tessellationFactorBuffer = (MTLBuffer *)[(id)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager) newBufferWithBytes:&v21 length:8 options:0];
  }
}

- (void)uniformTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  uint64_t v10 = -[SCNMTLRenderContext renderEncoder]((uint64_t)a6);
  *(float *)&double v11 = self->_cachedTessellator.tessellationFactorScale;
  [*(id *)(v10 + 3392) setTessellationFactorScale:v11];
  [*(id *)(v10 + 3392) setTessellationFactorBuffer:self->_tessellationFactorBuffer offset:0 instanceStride:0];

  -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:]((uint64_t)a6, (uint64_t)a3, a5);
}

- (void)updateScreenSpaceAdaptiveTessellator:(id *)a3 parameters:(id *)a4
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id var0 = a4->var0;
  int v6 = (void *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a4->var1);
  bzero(v6, 0x678uLL);
  unsigned int v7 = (void *)v6[207];
  v55 = self;
  if (!self->_tessellationFactorBuffer)
  {
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    unsigned int v8 = (void *)-[SCNMTLMesh elements]((uint64_t)var0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v78 objects:v85 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v79;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v79 != v12) {
            objc_enumerationMutation(v8);
          }
          v11 += -[SCNMTLMeshElement primitiveCount](*(void *)(*((void *)&v78 + 1) + 8 * i));
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v78 objects:v85 count:16];
      }
      while (v10);
      uint64_t v14 = 24 * v11;
    }
    else
    {
      uint64_t v14 = 0;
    }
    v55->_tessellationFactorBuffer = (MTLBuffer *)[(id)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v55->_resourceManager) newBufferWithLength:v14 options:32];
  }
  unsigned int v15 = (void *)-[SCNMTLResourceManager commandQueue]((uint64_t)var0);
  v47 = objc_msgSend((id)objc_msgSend(v15, "attributes"), "objectAtIndexedSubscript:", 0);
  v46 = objc_msgSend((id)objc_msgSend(v15, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v47, "bufferIndex"));
  [v7 pushDebugGroup:@"Compute SCNGeometryScreenSpaceAdaptiveTessellator tessellation factors"];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  uint64_t v48 = (uint64_t)var0;
  obuint64_t j = (id)-[SCNMTLMesh elements]((uint64_t)var0);
  uint64_t v51 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
  if (v51)
  {
    uint64_t v16 = 0;
    uint64_t v44 = *(void *)v75;
    v45 = v7;
    v41 = &v83;
    int64x2_t v43 = vdupq_n_s64(1uLL);
    do
    {
      for (uint64_t j = 0; j != v51; ++j)
      {
        if (*(void *)v75 != v44) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v74 + 1) + 8 * j);
        uint64_t v19 = -[SCNMTLMesh elements](v18);
        if (v19)
        {
          if (v19 == 1)
          {
            __n128 v20 = @"compute_tessellation_factors_screeenspace_adaptive_uint32";
          }
          else
          {
            uint64_t v21 = scn_default_log();
            BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
            __n128 v20 = &stru_26BF72F58;
            if (v22)
            {
              -[SCNMTLTessellator updateScreenSpaceAdaptiveTessellator:parameters:]((uint64_t)v82, v18);
              __n128 v20 = &stru_26BF72F58;
            }
          }
        }
        else
        {
          __n128 v20 = @"compute_tessellation_factors_screeenspace_adaptive_uint16";
        }
        unint64_t v23 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](v55->_resourceManager, "computePipelineStateForKernel:", v20, v41));
        uint64_t v24 = -[SCNMTLMeshElement primitiveCount](v18);
        uint64_t v54 = [(id)-[SCNMTLMeshElement indexBuffer](v18) buffer];
        uint64_t v25 = [(id)-[SCNMTLMeshElement indexBuffer](v18) offset];
        uint64_t v53 = -[SCNMTLResourceManager libraryManager](v18) + v25;
        uint64_t v52 = objc_msgSend((id)-[SCNMTLMesh buffers](v48), "objectAtIndexedSubscript:", objc_msgSend(v47, "bufferIndex") - 18);
        char v26 = [v46 stride];
        unint64_t v27 = [v23 threadExecutionWidth];
        v28 = (__n128 *)-[SCNMTLRenderContext engineContext]((uint64_t)a4->var1);
        __n128 Viewport = C3DEngineContextGetViewport(v28);
        float v30 = a3->var4.var0.var0;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v70 = 0u;
        long long v71 = 0u;
        Viewport.n128_f32[0] = Viewport.n128_f32[3] / v30;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        LODWORD(v60) = v24;
        BYTE4(v60) = v26;
        var2 = a4->var2;
        long long v32 = *(_OWORD *)var2;
        long long v33 = *((_OWORD *)var2 + 1);
        long long v34 = *((_OWORD *)var2 + 3);
        long long v63 = *((_OWORD *)var2 + 2);
        long long v64 = v34;
        long long v61 = v32;
        long long v62 = v33;
        long long v35 = *((_OWORD *)var2 + 4);
        long long v36 = *((_OWORD *)var2 + 5);
        long long v37 = *((_OWORD *)var2 + 7);
        long long v67 = *((_OWORD *)var2 + 6);
        long long v68 = v37;
        long long v65 = v35;
        long long v66 = v36;
        long long v38 = *((_OWORD *)var2 + 8);
        long long v39 = *((_OWORD *)var2 + 9);
        long long v40 = *((_OWORD *)var2 + 11);
        long long v71 = *((_OWORD *)var2 + 10);
        long long v72 = v40;
        long long v69 = v38;
        long long v70 = v39;
        LODWORD(v73) = Viewport.n128_u32[0];
        unsigned int v7 = v45;
        [v45 setComputePipelineState:v23];
        [v45 setBuffer:v55->_tessellationFactorBuffer offset:24 * v16 atIndex:0];
        [v45 setBuffer:v54 offset:v53 atIndex:1];
        [v45 setBuffer:v52 offset:0 atIndex:2];
        [v45 setBytes:&v60 length:224 atIndex:3];
        unint64_t v58 = (v24 + v27 - 1) / v27;
        int64x2_t v59 = v43;
        unint64_t v56 = v27;
        int64x2_t v57 = v43;
        [v45 dispatchThreadgroups:&v58 threadsPerThreadgroup:&v56];
        v16 += v24;
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v74 objects:v84 count:16];
    }
    while (v51);
  }
  [v7 popDebugGroup];
}

- (void)screenSpaceAdaptiveTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = (void *)-[SCNMTLMesh elements]((uint64_t)a4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v20;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(id *)(*((void *)&v19 + 1) + 8 * v15);
      if (v16 == a3) {
        break;
      }
      v13 += -[SCNMTLMeshElement primitiveCount]((uint64_t)v16);
      if (v12 == ++v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v17 = -[SCNMTLRenderContext renderEncoder]((uint64_t)a6);
  *(float *)&double v18 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend(*(id *)(v17 + 3392), "setTessellationFactorScale:", v18, (void)v19);
  [*(id *)(v17 + 3392) setTessellationFactorBuffer:self->_tessellationFactorBuffer offset:24 * v13 instanceStride:0];
  -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:]((uint64_t)a6, (uint64_t)a3, a5);
}

- (void)updateConstrainedEdgeLengthTessellator:(id *)a3 parameters:(id *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id var0 = a4->var0;
  if (self->_tessellationFactorBuffer)
  {
    if (a3->var4.var0.var0 == self->_cachedTessellator.parameters.uniform.edgeTessellationFactor) {
      return;
    }
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    unsigned int v8 = (void *)-[SCNMTLMesh elements]((uint64_t)var0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
    if (v9)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v52 != v11) {
            objc_enumerationMutation(v8);
          }
          v10 += -[SCNMTLMeshElement primitiveCount](*(void *)(*((void *)&v51 + 1) + 8 * i));
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v51 objects:v58 count:16];
      }
      while (v9);
      uint64_t v9 = 24 * v10;
    }
    self->_tessellationFactorBuffer = (MTLBuffer *)[(id)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager) newBufferWithLength:v9 options:32];
  }
  long long v36 = self;
  long long v37 = a3;
  uint64_t v13 = (void *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)a4->var1);
  bzero(v13, 0x678uLL);
  uint64_t v14 = (void *)v13[207];
  uint64_t v15 = (void *)-[SCNMTLResourceManager commandQueue]((uint64_t)var0);
  long long v34 = objc_msgSend((id)objc_msgSend(v15, "attributes"), "objectAtIndexedSubscript:", 0);
  long long v33 = objc_msgSend((id)objc_msgSend(v15, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v34, "bufferIndex"));
  long long v38 = v14;
  [v14 pushDebugGroup:@"Compute kC3DGeometryTessellatorTypeConstrainedEdgeLength tessellation factors"];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v35 = (uint64_t)var0;
  obuint64_t j = (id)-[SCNMTLMesh elements]((uint64_t)var0);
  uint64_t v39 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v39)
  {
    uint64_t v16 = 0;
    uint64_t v32 = *(void *)v48;
    v29 = &v56;
    int64x2_t v31 = vdupq_n_s64(1uLL);
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v48 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v47 + 1) + 8 * j);
        uint64_t v19 = -[SCNMTLMesh elements](v18);
        if (v19)
        {
          if (v19 == 1)
          {
            long long v20 = @"compute_tessellation_factors_constrained_edge_uint32";
          }
          else
          {
            long long v21 = scn_default_log();
            BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
            long long v20 = &stru_26BF72F58;
            if (v22)
            {
              -[SCNMTLTessellator updateScreenSpaceAdaptiveTessellator:parameters:]((uint64_t)v55, v18);
              long long v20 = &stru_26BF72F58;
            }
          }
        }
        else
        {
          long long v20 = @"compute_tessellation_factors_constrained_edge_uint16";
        }
        unint64_t v23 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)-[SCNMTLResourceManager computePipelineStateForKernel:](v36->_resourceManager, "computePipelineStateForKernel:", v20, v29));
        uint64_t v24 = -[SCNMTLMeshElement primitiveCount](v18);
        uint64_t v41 = [(id)-[SCNMTLMeshElement indexBuffer](v18) buffer];
        uint64_t v25 = [(id)-[SCNMTLMeshElement indexBuffer](v18) offset];
        uint64_t v40 = -[SCNMTLResourceManager libraryManager](v18) + v25;
        uint64_t v26 = objc_msgSend((id)-[SCNMTLMesh buffers](v35), "objectAtIndexedSubscript:", objc_msgSend(v34, "bufferIndex") - 18);
        unsigned __int8 v27 = [v33 stride];
        unint64_t v28 = [v23 threadExecutionWidth];
        v46[0] = v24;
        v46[1] = v27;
        v46[2] = LODWORD(v37->var4.var0.var0);
        [v38 setComputePipelineState:v23];
        [v38 setBuffer:v36->_tessellationFactorBuffer offset:24 * v16 atIndex:0];
        [v38 setBuffer:v41 offset:v40 atIndex:1];
        [v38 setBuffer:v26 offset:0 atIndex:2];
        [v38 setBytes:v46 length:12 atIndex:3];
        unint64_t v44 = (v24 + v28 - 1) / v28;
        int64x2_t v45 = v31;
        unint64_t v42 = v28;
        int64x2_t v43 = v31;
        [v38 dispatchThreadgroups:&v44 threadsPerThreadgroup:&v42];
        v16 += v24;
      }
      uint64_t v39 = [obj countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v39);
  }
  [v38 popDebugGroup];
}

- (void)constrainedEdgeLengthTessellationDrawMeshElement:(id)a3 forMesh:(id)a4 instanceCount:(unint64_t)a5 renderContext:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = (void *)-[SCNMTLMesh elements]((uint64_t)a4);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v20;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v20 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(id *)(*((void *)&v19 + 1) + 8 * v15);
      if (v16 == a3) {
        break;
      }
      v13 += -[SCNMTLMeshElement primitiveCount]((uint64_t)v16);
      if (v12 == ++v15)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v17 = -[SCNMTLRenderContext renderEncoder]((uint64_t)a6);
  *(float *)&double v18 = self->_cachedTessellator.tessellationFactorScale;
  objc_msgSend(*(id *)(v17 + 3392), "setTessellationFactorScale:", v18, (void)v19);
  [*(id *)(v17 + 3392) setTessellationFactorBuffer:self->_tessellationFactorBuffer offset:24 * v13 instanceStride:0];
  -[SCNMTLRenderContext _drawPatchForMeshElement:instanceCount:]((uint64_t)a6, (uint64_t)a3, a5);
}

- (void)updateSubdivisionSurfaceTessellator:(id *)a3 parameters:(id *)a4
{
  GPUContext = C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
  GPUContext[1] = (int)a3->var1;
  unsigned int v8 = (MTLBuffer *)-[SCNMTLMesh bufferForAttribute:]((uint64_t)a4->var0, 0);
  lastFramePositionBuffer = self->_lastFramePositionBuffer;
  if (lastFramePositionBuffer) {
    BOOL v10 = lastFramePositionBuffer == v8;
  }
  else {
    BOOL v10 = 1;
  }
  self->_lastFramePositionBuffer = v8;
  BOOL v11 = v10 && !a4->var4;
  int v12 = !v11;
  if (!v11)
  {
    C3DSubdivisionOsdGPUSynchroniseCoarseMeshForDeformers((uint64_t)GPUContext, (uint64_t)v8, (uint64_t)a4->var1, a4->var3);
LABEL_13:
    C3DSubdivisionOsdGPUComputeTessellationFactors((uint64_t)GPUContext, (uint64_t)a4->var1, (uint64_t)a4->var2, a4->var3, v13);
    goto LABEL_14;
  }
  if (C3DSubdivisionOsdGPURequiresTessellationFactorsInitialization((uint64_t)GPUContext)) {
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v14 = -[SCNMTLRenderContext engineContext]((uint64_t)a4->var1);
  AuthoringEnvironment = (void *)C3DEngineContextGetAuthoringEnvironment(v14, 0);
  if (AuthoringEnvironment && (C3DAuthoringEnvironmentGetDisplayMask(AuthoringEnvironment) & 0x4000) != 0)
  {
    geometry = self->_geometry;
    id var0 = a4->var0;
    id var1 = a4->var1;
    C3DGeometryOpenSubdivGPUUpdateAuthoringEnvironmentData(geometry, (uint64_t)var0, (uint64_t)var1, v12);
  }
}

- (void)subdivisionSurfaceTessellationDraw:(id *)a3
{
  uint64_t v5 = objc_msgSend((id)C3DMeshGetMeshElements((uint64_t)a3->var0, 0), "indexOfObject:", a3->var2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    unsigned __int16 v6 = 0;
  }
  else {
    unsigned __int16 v6 = v5;
  }
  GPUContext = C3DGeometryOpenSubdivGetGPUContext((uint64_t)self->_geometry, 0, 0);
  id var5 = a3->var5;
  int var6 = a3->var6;
  unsigned int var4 = a3->var4;

  C3DSubdivisionOsdGPUDraw((uint64_t)GPUContext, (uint64_t)var5, var6, v6, var4);
}

- (void)_pipelineStateHashForMeshElement:(uint64_t)a1 patchType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = 67109120;
  v3[1] = -[SCNMTLMesh elements](a1);
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unknown index type %d", (uint8_t *)v3, 8u);
}

- (void)update:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: A tessellator object should not exist when no tessellation is required", v1, 2u);
}

- (void)updateScreenSpaceAdaptiveTessellator:(uint64_t)a1 parameters:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = OUTLINED_FUNCTION_0_8(a1, a2);
  *objc_super v3 = 67109120;
  _DWORD *v2 = v4;
  OUTLINED_FUNCTION_1_9(&dword_20B249000, v5, v6, "Unreachable code: Unknown index type %d");
}

@end