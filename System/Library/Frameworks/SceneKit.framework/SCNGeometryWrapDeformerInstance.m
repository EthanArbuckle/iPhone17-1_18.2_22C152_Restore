@interface SCNGeometryWrapDeformerInstance
- (_BYTE)initWithNode:(void *)a3 drivingNode:(void *)a4 deformer:(uint64_t)a5 outputs:(uint64_t)a6 computeVertexCount:(void *)a7 context:;
- (unint64_t)updateWithContext:(id)a3;
- (void)dealloc;
- (void)initWithNode:(void *)a3 innerLayerNode:(void *)a4 outerLayerNode:(void *)a5 deformer:(uint64_t)a6 outputs:(uint64_t)a7 computeVertexCount:(void *)a8 context:;
@end

@implementation SCNGeometryWrapDeformerInstance

- (_BYTE)initWithNode:(void *)a3 drivingNode:(void *)a4 deformer:(uint64_t)a5 outputs:(uint64_t)a6 computeVertexCount:(void *)a7 context:
{
  if (!a1) {
    return 0;
  }
  v36.receiver = a1;
  v36.super_class = (Class)SCNGeometryWrapDeformerInstance;
  v12 = objc_msgSendSuper2(&v36, sel_init);
  if (v12)
  {
    [a4 initParametersIfNeededForDeformedNode:a2];
    uint64_t v13 = a4[3];
    v12[256] = 1;
    *((void *)v12 + 1) = *(void *)(v13 + 16);
    *((void *)v12 + 44) = [a3 nodeRef];
    *((void *)v12 + 22) = [a2 nodeRef];
    if (*(_DWORD *)(v13 + 8) != a6) {
      -[SCNGeometryWrapDeformerInstance initWithNode:drivingNode:deformer:outputs:computeVertexCount:context:]();
    }
    *((_DWORD *)v12 + 68) = a6;
    unint64_t v14 = *(void *)(v13 + 32);
    unint64_t v15 = *(void *)(v13 + 56);
    if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes((void *)[a7 device]))
    {
      unint64_t v14 = (*(void *)(v13 + 32) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v15 = (*(void *)(v13 + 56) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __104__SCNGeometryWrapDeformerInstance_initWithNode_drivingNode_deformer_outputs_computeVertexCount_context___block_invoke;
    v34[3] = &unk_264007C20;
    v34[4] = a7;
    v34[5] = v13;
    v34[7] = v14;
    v34[8] = v15;
    v34[6] = v12;
    long long v35 = xmmword_20B5EDED0;
    uint64_t v16 = *((void *)v12 + 1);
    v17 = @"deformer_wrap_legacy_relative";
    if (v16 != 1) {
      v17 = 0;
    }
    if (v16) {
      v18 = v17;
    }
    else {
      v18 = @"deformer_wrap_legacy_absolute";
    }
    id v19 = objc_alloc_init(MEMORY[0x263F12A18]);
    *((void *)v12 + 24) = (id)objc_msgSend((id)objc_msgSend(a7, "_currentResourceManager"), "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v18, v19, v34, 0, 0);

    if (v14 == *(void *)(v13 + 32))
    {
      uint64_t v20 = objc_msgSend((id)objc_msgSend(a7, "device"), "newBufferWithBytes:length:options:", *(void *)(v13 + 24), *(void *)(v13 + 32) * *(unsigned int *)(v13 + 8), 0);
      v21 = 0;
    }
    else
    {
      size_t v22 = v14 * *(unsigned int *)(v13 + 8);
      v23 = (char *)malloc_type_realloc(0, v22, 0xD2BA1DF5uLL);
      v21 = v23;
      if (*(_DWORD *)(v13 + 8))
      {
        unint64_t v24 = 0;
        v25 = v23;
        do
        {
          memcpy(v25, (const void *)(*(void *)(v13 + 24) + *(void *)(v13 + 32) * v24++), *(void *)(v13 + 32));
          v25 += v14;
        }
        while (v24 < *(unsigned int *)(v13 + 8));
      }
      uint64_t v20 = objc_msgSend((id)objc_msgSend(a7, "device"), "newBufferWithBytes:length:options:", v21, v22, 0);
    }
    *((void *)v12 + 25) = v20;
    if (v15 == *(void *)(v13 + 56))
    {
      v26 = (void *)[a7 device];
      v27 = *(void **)(v13 + 48);
      size_t v28 = *(void *)(v13 + 56) * *(unsigned int *)(v13 + 8);
    }
    else
    {
      size_t v29 = v15 * *(unsigned int *)(v13 + 8);
      v30 = (char *)malloc_type_realloc(v21, v29, 0x2E41FFD6uLL);
      v21 = v30;
      if (*(_DWORD *)(v13 + 8))
      {
        unint64_t v31 = 0;
        v32 = v30;
        do
        {
          memcpy(v32, (const void *)(*(void *)(v13 + 48) + *(void *)(v13 + 56) * v31++), *(void *)(v13 + 56));
          v32 += v15;
        }
        while (v31 < *(unsigned int *)(v13 + 8));
      }
      v26 = (void *)[a7 device];
      v27 = v21;
      size_t v28 = v29;
    }
    *((void *)v12 + 26) = [v26 newBufferWithBytes:v27 length:v28 options:0];
    *((void *)v12 + 45) = objc_msgSend((id)objc_msgSend(a7, "device"), "newBufferWithBytes:length:options:", *(void *)(v13 + 136), *(void *)(v13 + 144), 0);
    free(v21);
  }
  return v12;
}

- (void)initWithNode:(void *)a3 innerLayerNode:(void *)a4 outerLayerNode:(void *)a5 deformer:(uint64_t)a6 outputs:(uint64_t)a7 computeVertexCount:(void *)a8 context:
{
  if (!a1) {
    return 0;
  }
  v47.receiver = a1;
  v47.super_class = (Class)SCNGeometryWrapDeformerInstance;
  unint64_t v14 = objc_msgSendSuper2(&v47, sel_init);
  if (v14)
  {
    [a5 initParametersIfNeededForDeformedNode:a2];
    uint64_t v15 = a5[3];
    v14[1] = *(void *)(v15 + 16);
    v14[20] = [a3 nodeRef];
    v14[21] = [a4 nodeRef];
    v14[22] = [a2 nodeRef];
    if (*(_DWORD *)(v15 + 8) != a7) {
      -[SCNGeometryWrapDeformerInstance initWithNode:innerLayerNode:outerLayerNode:deformer:outputs:computeVertexCount:context:]();
    }
    *((_DWORD *)v14 + 4) = a7;
    unint64_t v16 = *(void *)(v15 + 32);
    unint64_t v17 = *(void *)(v15 + 56);
    if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes((void *)[a8 device]))
    {
      unint64_t v16 = (*(void *)(v15 + 32) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v17 = (*(void *)(v15 + 56) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    uint64_t v36 = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    v38 = __122__SCNGeometryWrapDeformerInstance_initWithNode_innerLayerNode_outerLayerNode_deformer_outputs_computeVertexCount_context___block_invoke;
    v39 = &unk_264007C48;
    v40 = a8;
    uint64_t v41 = v15;
    unint64_t v43 = v16;
    unint64_t v44 = v17;
    v42 = v14;
    long long v45 = xmmword_20B5EDEE0;
    uint64_t v46 = 36;
    uint64_t v18 = v14[1];
    id v19 = @"deformer_wrap_relative";
    if (v18 != 1) {
      id v19 = 0;
    }
    if (v18) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = @"deformer_wrap_absolute";
    }
    id v21 = objc_alloc_init(MEMORY[0x263F12A18]);
    v14[24] = objc_retain((id)objc_msgSend((id)objc_msgSend(a8, "_currentResourceManager", v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46), "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v20, v21, &v36, 0,
                                0));

    if (v16 == *(void *)(v15 + 32))
    {
      uint64_t v22 = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(void *)(v15 + 24), *(void *)(v15 + 32) * *(unsigned int *)(v15 + 8), 0);
      v23 = 0;
    }
    else
    {
      size_t v24 = v16 * *(unsigned int *)(v15 + 8);
      v25 = (char *)malloc_type_realloc(0, v24, 0x46E5A883uLL);
      v23 = v25;
      if (*(_DWORD *)(v15 + 8))
      {
        unint64_t v26 = 0;
        v27 = v25;
        do
        {
          memcpy(v27, (const void *)(*(void *)(v15 + 24) + *(void *)(v15 + 32) * v26++), *(void *)(v15 + 32));
          v27 += v16;
        }
        while (v26 < *(unsigned int *)(v15 + 8));
      }
      uint64_t v22 = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", v23, v24, 0);
    }
    v14[25] = v22;
    if (v17 == *(void *)(v15 + 56))
    {
      size_t v28 = (void *)[a8 device];
      size_t v29 = *(void **)(v15 + 48);
      size_t v30 = *(void *)(v15 + 56) * *(unsigned int *)(v15 + 8);
    }
    else
    {
      size_t v31 = v17 * *(unsigned int *)(v15 + 8);
      v32 = (char *)malloc_type_realloc(v23, v31, 0xCF914E39uLL);
      v23 = v32;
      if (*(_DWORD *)(v15 + 8))
      {
        unint64_t v33 = 0;
        v34 = v32;
        do
        {
          memcpy(v34, (const void *)(*(void *)(v15 + 48) + *(void *)(v15 + 56) * v33++), *(void *)(v15 + 56));
          v34 += v17;
        }
        while (v33 < *(unsigned int *)(v15 + 8));
      }
      size_t v28 = (void *)[a8 device];
      size_t v29 = v23;
      size_t v30 = v31;
    }
    v14[26] = [v28 newBufferWithBytes:v29 length:v30 options:0];
    v14[27] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(void *)(v15 + 72), *(void *)(v15 + 80), 0);
    if (v14[1] == 1)
    {
      v14[28] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(void *)(v15 + 88), *(void *)(v15 + 104), 0);
      v14[29] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(void *)(v15 + 96), *(void *)(v15 + 104), 0);
      v14[30] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(void *)(v15 + 112), *(void *)(v15 + 128), 0);
      v14[31] = objc_msgSend((id)objc_msgSend(a8, "device"), "newBufferWithBytes:length:options:", *(void *)(v15 + 120), *(void *)(v15 + 128), 0);
    }
    free(v23);
  }
  return v14;
}

uint64_t __104__SCNGeometryWrapDeformerInstance_initWithNode_drivingNode_deformer_outputs_computeVertexCount_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [*(id *)(a1 + 32) configureStageInputOutputDescriptor:a3 withDeformerFunction:a2];
  v5 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 6);
  [v5 setFormat:*(void *)(*(void *)(a1 + 40) + 40)];
  [v5 setOffset:0];
  [v5 setBufferIndex:3];
  v6 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 3);
  [v6 setStepFunction:5];
  [v6 setStride:*(void *)(a1 + 56)];
  v7 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 7);
  [v7 setFormat:*(void *)(*(void *)(a1 + 40) + 64)];
  [v7 setOffset:0];
  [v7 setBufferIndex:4];
  v8 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 4);
  [v8 setStepFunction:5];
  [v8 setStride:*(void *)(a1 + 64)];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = (void *)[a3 attributes];
  if (v9)
  {
    v11 = (void *)[v10 objectAtIndexedSubscript:11];
    [v11 setFormat:31];
    [v11 setOffset:0];
    [v11 setBufferIndex:6];
    v12 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 12);
    [v12 setFormat:31];
    [v12 setOffset:16];
    [v12 setBufferIndex:6];
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 13);
    [v13 setFormat:31];
    [v13 setOffset:32];
    [v13 setBufferIndex:6];
    unint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 6);
    [v14 setStepFunction:5];
    uint64_t v15 = (uint64_t *)(a1 + 80);
  }
  else
  {
    unint64_t v16 = (void *)[v10 objectAtIndexedSubscript:9];
    [v16 setFormat:30];
    [v16 setOffset:0];
    [v16 setBufferIndex:6];
    unint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 6);
    [v14 setStepFunction:5];
    uint64_t v15 = (uint64_t *)(a1 + 72);
  }
  uint64_t v17 = *v15;

  return [v14 setStride:v17];
}

uint64_t __122__SCNGeometryWrapDeformerInstance_initWithNode_innerLayerNode_outerLayerNode_deformer_outputs_computeVertexCount_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [*(id *)(a1 + 32) configureStageInputOutputDescriptor:a3 withDeformerFunction:a2];
  v5 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 6);
  [v5 setFormat:*(void *)(*(void *)(a1 + 40) + 40)];
  [v5 setOffset:0];
  [v5 setBufferIndex:3];
  v6 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 3);
  [v6 setStepFunction:5];
  [v6 setStride:*(void *)(a1 + 56)];
  v7 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 7);
  [v7 setFormat:*(void *)(*(void *)(a1 + 40) + 64)];
  [v7 setOffset:0];
  [v7 setBufferIndex:4];
  v8 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 4);
  [v8 setStepFunction:5];
  [v8 setStride:*(void *)(a1 + 64)];
  uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 8);
  [v9 setFormat:28];
  [v9 setOffset:0];
  [v9 setBufferIndex:5];
  v10 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 5);
  [v10 setStepFunction:5];
  uint64_t result = [v10 setStride:*(void *)(a1 + 72)];
  if (*(void *)(*(void *)(a1 + 48) + 8) == 1)
  {
    v12 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 9);
    [v12 setFormat:30];
    [v12 setOffset:0];
    [v12 setBufferIndex:6];
    uint64_t v13 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 6);
    [v13 setStepFunction:5];
    [v13 setStride:*(void *)(a1 + 80)];
    unint64_t v14 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 10);
    [v14 setFormat:30];
    [v14 setOffset:0];
    [v14 setBufferIndex:7];
    uint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 7);
    [v15 setStepFunction:5];
    [v15 setStride:*(void *)(a1 + 80)];
    unint64_t v16 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 11);
    [v16 setFormat:30];
    [v16 setOffset:0];
    [v16 setBufferIndex:8];
    uint64_t v17 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 12);
    [v17 setFormat:30];
    [v17 setOffset:12];
    [v17 setBufferIndex:8];
    uint64_t v18 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 13);
    [v18 setFormat:30];
    [v18 setOffset:24];
    [v18 setBufferIndex:8];
    id v19 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 8);
    [v19 setStepFunction:5];
    [v19 setStride:*(void *)(a1 + 88)];
    uint64_t v20 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 14);
    [v20 setFormat:30];
    [v20 setOffset:0];
    [v20 setBufferIndex:9];
    id v21 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 15);
    [v21 setFormat:30];
    [v21 setOffset:12];
    [v21 setBufferIndex:9];
    uint64_t v22 = objc_msgSend((id)objc_msgSend(a3, "attributes"), "objectAtIndexedSubscript:", 16);
    [v22 setFormat:30];
    [v22 setOffset:24];
    [v22 setBufferIndex:9];
    v23 = objc_msgSend((id)objc_msgSend(a3, "layouts"), "objectAtIndexedSubscript:", 9);
    [v23 setStepFunction:5];
    uint64_t v24 = *(void *)(a1 + 88);
    return [v23 setStride:v24];
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryWrapDeformerInstance;
  [(SCNGeometryWrapDeformerInstance *)&v3 dealloc];
}

- (unint64_t)updateWithContext:(id)a3
{
  unint64_t v5 = [a3 _currentFrameHash];
  if (self->_currentFrameHash == v5) {
    return 0;
  }
  self->_currentFrameHash = v5;
  v7 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]([a3 _currentRenderContext]);
  if (!self->_isLegacySingleLayerDeformer)
  {
    WorldMatrix = C3DNodeGetWorldMatrix((float32x4_t *)self->_innerLayerNode);
    float32x4_t v48 = WorldMatrix[1];
    float32x4_t v49 = *WorldMatrix;
    float32x4_t v50 = WorldMatrix[3];
    float32x4_t v51 = WorldMatrix[2];
    unint64_t v16 = C3DNodeGetWorldMatrix((float32x4_t *)self->_outerLayerNode);
    float32x4_t v53 = v16[1];
    float32x4_t v55 = *v16;
    float32x4_t v57 = v16[3];
    float32x4_t v59 = v16[2];
    uint64_t v17 = C3DNodeGetWorldMatrix((float32x4_t *)self->_deformedNode);
    v70.columns[0] = (simd_float4)*v17;
    v70.columns[1] = (simd_float4)v17[1];
    v70.columns[2] = (simd_float4)v17[2];
    v70.columns[3] = (simd_float4)v17[3];
    simd_float4x4 v71 = __invert_f4(v70);
    unint64_t v18 = 0;
    float32x4_t v60 = v49;
    float32x4_t v61 = v48;
    float32x4_t v62 = v51;
    float32x4_t v63 = v50;
    do
    {
      *(long long *)((char *)&v64 + v18) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v71.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v60 + v18))), (float32x4_t)v71.columns[1], *(float32x2_t *)&v60.f32[v18 / 4], 1), (float32x4_t)v71.columns[2], *(float32x4_t *)((char *)&v60 + v18), 2), (float32x4_t)v71.columns[3], *(float32x4_t *)((char *)&v60 + v18), 3);
      v18 += 16;
    }
    while (v18 != 64);
    unint64_t v19 = 0;
    long long v20 = v65;
    int64x2_t v21 = v66;
    long long v22 = v67;
    *(_OWORD *)&self->_anon_14[12] = v64;
    *(_OWORD *)&self->_anon_14[28] = v20;
    *(int64x2_t *)&self->_anon_14[44] = v21;
    *(_OWORD *)&self->_anon_14[60] = v22;
    float32x4_t v60 = v55;
    float32x4_t v61 = v53;
    float32x4_t v62 = v59;
    float32x4_t v63 = v57;
    do
    {
      *(long long *)((char *)&v64 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v71.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v60 + v19))), (float32x4_t)v71.columns[1], *(float32x2_t *)&v60.f32[v19 / 4], 1), (float32x4_t)v71.columns[2], *(float32x4_t *)((char *)&v60 + v19), 2), (float32x4_t)v71.columns[3], *(float32x4_t *)((char *)&v60 + v19), 3);
      v19 += 16;
    }
    while (v19 != 64);
    long long v23 = v65;
    int64x2_t v24 = v66;
    long long v25 = v67;
    *(_OWORD *)&self->_anon_14[76] = v64;
    *(_OWORD *)&self->_anon_14[92] = v23;
    *(int64x2_t *)&self->_anon_14[108] = v24;
    *(_OWORD *)&self->_anon_14[124] = v25;
    SCNMTLComputeCommandEncoder::setBytes(v7, &self->_uniforms, 0x90uLL, 0);
    uint64_t v26 = [a3 dependency0PositionBuffer];
    if (v7->_buffers[1] == (MTLBuffer *)v26)
    {
      if (!v7->_offsets[1]) {
        goto LABEL_37;
      }
    }
    else
    {
      v7->_buffers[1] = (MTLBuffer *)v26;
    }
    v7->_offsets[1] = 0;
    v7->_buffersToBind[0] |= 2uLL;
LABEL_37:
    uint64_t v32 = objc_msgSend(a3, "dependency1PositionBuffer", *(_OWORD *)&v48, *(_OWORD *)&v49, *(_OWORD *)&v50, *(_OWORD *)&v51);
    if (v7->_buffers[2] == (MTLBuffer *)v32)
    {
      if (!v7->_offsets[2]) {
        goto LABEL_41;
      }
    }
    else
    {
      v7->_buffers[2] = (MTLBuffer *)v32;
    }
    v7->_offsets[2] = 0;
    v7->_buffersToBind[0] |= 4uLL;
LABEL_41:
    uint64_t v33 = [a3 dstPositionBuffer];
    if (v7->_buffers[11] == (MTLBuffer *)v33)
    {
      if (!v7->_offsets[11]) {
        goto LABEL_45;
      }
    }
    else
    {
      v7->_buffers[11] = (MTLBuffer *)v33;
    }
    v7->_offsets[11] = 0;
    v7->_buffersToBind[0] |= 0x800uLL;
LABEL_45:
    pointIndicesBuffer = self->_pointIndicesBuffer;
    if (v7->_buffers[3] == pointIndicesBuffer)
    {
      if (!v7->_offsets[3]) {
        goto LABEL_49;
      }
    }
    else
    {
      v7->_buffers[3] = pointIndicesBuffer;
    }
    v7->_offsets[3] = 0;
    v7->_buffersToBind[0] |= 8uLL;
LABEL_49:
    barycentricCoordsBuffer = self->_barycentricCoordsBuffer;
    if (v7->_buffers[4] == barycentricCoordsBuffer)
    {
      if (!v7->_offsets[4]) {
        goto LABEL_53;
      }
    }
    else
    {
      v7->_buffers[4] = barycentricCoordsBuffer;
    }
    v7->_offsets[4] = 0;
    v7->_buffersToBind[0] |= 0x10uLL;
LABEL_53:
    innerLayerInfluencesBuffer = self->_innerLayerInfluencesBuffer;
    if (v7->_buffers[5] == innerLayerInfluencesBuffer)
    {
      if (!v7->_offsets[5]) {
        goto LABEL_57;
      }
    }
    else
    {
      v7->_buffers[5] = innerLayerInfluencesBuffer;
    }
    v7->_offsets[5] = 0;
    v7->_buffersToBind[0] |= 0x20uLL;
LABEL_57:
    if (self->_bindingMode != 1) {
      goto LABEL_81;
    }
    uint64_t v37 = [a3 srcPositionBuffer];
    if (v7->_buffers[10] == (MTLBuffer *)v37)
    {
      if (!v7->_offsets[10]) {
        goto LABEL_65;
      }
    }
    else
    {
      v7->_buffers[10] = (MTLBuffer *)v37;
    }
    v7->_offsets[10] = 0;
    v7->_buffersToBind[0] |= 0x400uLL;
LABEL_65:
    innerBindingSpaceVectorsBuffer = self->_innerBindingSpaceVectorsBuffer;
    if (v7->_buffers[8] == innerBindingSpaceVectorsBuffer)
    {
      if (!v7->_offsets[8]) {
        goto LABEL_69;
      }
    }
    else
    {
      v7->_buffers[8] = innerBindingSpaceVectorsBuffer;
    }
    v7->_offsets[8] = 0;
    v7->_buffersToBind[0] |= 0x100uLL;
LABEL_69:
    outerBindingSpaceVectorsBuffer = self->_outerBindingSpaceVectorsBuffer;
    if (v7->_buffers[9] == outerBindingSpaceVectorsBuffer)
    {
      if (!v7->_offsets[9]) {
        goto LABEL_73;
      }
    }
    else
    {
      v7->_buffers[9] = outerBindingSpaceVectorsBuffer;
    }
    v7->_offsets[9] = 0;
    v7->_buffersToBind[0] |= 0x200uLL;
LABEL_73:
    innerBindingOffsetsBuffer = self->_innerBindingOffsetsBuffer;
    if (v7->_buffers[6] == innerBindingOffsetsBuffer)
    {
      if (!v7->_offsets[6])
      {
LABEL_77:
        outerBindingOffsetsBuffer = self->_outerBindingOffsetsBuffer;
        if (v7->_buffers[7] != outerBindingOffsetsBuffer)
        {
          v7->_buffers[7] = outerBindingOffsetsBuffer;
LABEL_80:
          v7->_offsets[7] = 0;
          v7->_buffersToBind[0] |= 0x80uLL;
          goto LABEL_81;
        }
        if (v7->_offsets[7]) {
          goto LABEL_80;
        }
LABEL_81:
        uint64_t vertexCount = self->_uniforms.vertexCount;
        long long v64 = 0uLL;
        encoder = v7->_encoder;
        *(void *)&long long v65 = 0;
        *((void *)&v65 + 1) = vertexCount;
        int64x2_t v66 = vdupq_n_s64(1uLL);
        [(MTLComputeCommandEncoder *)encoder setStageInRegion:&v64];
        uint64_t v40 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_computePipeline);
        unsigned int v41 = self->_uniforms.vertexCount;
        goto LABEL_82;
      }
    }
    else
    {
      v7->_buffers[6] = innerBindingOffsetsBuffer;
    }
    v7->_offsets[6] = 0;
    v7->_buffersToBind[0] |= 0x40uLL;
    goto LABEL_77;
  }
  v8 = C3DNodeGetWorldMatrix((float32x4_t *)self->_legacyDrivingNode);
  float32x4_t v52 = v8[1];
  float32x4_t v54 = *v8;
  float32x4_t v56 = v8[3];
  float32x4_t v58 = v8[2];
  uint64_t v9 = C3DNodeGetWorldMatrix((float32x4_t *)self->_deformedNode);
  v68.columns[0] = (simd_float4)*v9;
  v68.columns[1] = (simd_float4)v9[1];
  v68.columns[2] = (simd_float4)v9[2];
  v68.columns[3] = (simd_float4)v9[3];
  simd_float4x4 v69 = __invert_f4(v68);
  unint64_t v10 = 0;
  float32x4_t v60 = v54;
  float32x4_t v61 = v52;
  float32x4_t v62 = v58;
  float32x4_t v63 = v56;
  do
  {
    *(long long *)((char *)&v64 + v10) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v69.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v60 + v10))), (float32x4_t)v69.columns[1], *(float32x2_t *)&v60.f32[v10 / 4], 1), (float32x4_t)v69.columns[2], *(float32x4_t *)((char *)&v60 + v10), 2), (float32x4_t)v69.columns[3], *(float32x4_t *)((char *)&v60 + v10), 3);
    v10 += 16;
  }
  while (v10 != 64);
  long long v11 = v65;
  int64x2_t v12 = v66;
  long long v13 = v67;
  *(_OWORD *)&self->_anon_114[12] = v64;
  *(_OWORD *)&self->_anon_114[28] = v11;
  *(int64x2_t *)&self->_anon_114[44] = v12;
  *(_OWORD *)&self->_anon_114[60] = v13;
  SCNMTLComputeCommandEncoder::setBytes(v7, &self->_legacyUniforms, 0x50uLL, 0);
  uint64_t v14 = [a3 dependency0PositionBuffer];
  if (v7->_buffers[1] == (MTLBuffer *)v14)
  {
    if (!v7->_offsets[1]) {
      goto LABEL_16;
    }
  }
  else
  {
    v7->_buffers[1] = (MTLBuffer *)v14;
  }
  v7->_offsets[1] = 0;
  v7->_buffersToBind[0] |= 2uLL;
LABEL_16:
  uint64_t v27 = [a3 dstPositionBuffer];
  if (v7->_buffers[11] == (MTLBuffer *)v27)
  {
    if (!v7->_offsets[11]) {
      goto LABEL_20;
    }
  }
  else
  {
    v7->_buffers[11] = (MTLBuffer *)v27;
  }
  v7->_offsets[11] = 0;
  v7->_buffersToBind[0] |= 0x800uLL;
LABEL_20:
  size_t v28 = self->_pointIndicesBuffer;
  if (v7->_buffers[3] == v28)
  {
    if (!v7->_offsets[3]) {
      goto LABEL_24;
    }
  }
  else
  {
    v7->_buffers[3] = v28;
  }
  v7->_offsets[3] = 0;
  v7->_buffersToBind[0] |= 8uLL;
LABEL_24:
  size_t v29 = self->_barycentricCoordsBuffer;
  if (v7->_buffers[4] == v29)
  {
    if (!v7->_offsets[4]) {
      goto LABEL_28;
    }
  }
  else
  {
    v7->_buffers[4] = v29;
  }
  v7->_offsets[4] = 0;
  v7->_buffersToBind[0] |= 0x10uLL;
LABEL_28:
  legacyOffsetsOrTransformsBuffer = self->_legacyOffsetsOrTransformsBuffer;
  if (v7->_buffers[6] == legacyOffsetsOrTransformsBuffer)
  {
    if (!v7->_offsets[6]) {
      goto LABEL_32;
    }
  }
  else
  {
    v7->_buffers[6] = legacyOffsetsOrTransformsBuffer;
  }
  v7->_offsets[6] = 0;
  v7->_buffersToBind[0] |= 0x40uLL;
LABEL_32:
  if (self->_bindingMode == 1)
  {
    uint64_t v31 = [a3 srcPositionBuffer];
    if (v7->_buffers[10] != (MTLBuffer *)v31)
    {
      v7->_buffers[10] = (MTLBuffer *)v31;
LABEL_61:
      v7->_offsets[10] = 0;
      v7->_buffersToBind[0] |= 0x400uLL;
      goto LABEL_62;
    }
    if (v7->_offsets[10]) {
      goto LABEL_61;
    }
  }
LABEL_62:
  uint64_t v38 = self->_legacyUniforms.vertexCount;
  long long v64 = 0uLL;
  v39 = v7->_encoder;
  *(void *)&long long v65 = 0;
  *((void *)&v65 + 1) = v38;
  int64x2_t v66 = vdupq_n_s64(1uLL);
  [(MTLComputeCommandEncoder *)v39 setStageInRegion:&v64];
  uint64_t v40 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_computePipeline);
  unsigned int v41 = self->_legacyUniforms.vertexCount;
LABEL_82:
  if (v7->_computePipelineState != (MTLComputePipelineState *)v40)
  {
    v7->_computePipelineState = (MTLComputePipelineState *)v40;
    [(MTLComputeCommandEncoder *)v7->_encoder setComputePipelineState:v40];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v7, v41);
  return 1;
}

- (void)initWithNode:drivingNode:deformer:outputs:computeVertexCount:context:.cold.1()
{
  __assert_rtn("-[SCNGeometryWrapDeformerInstance initWithNode:drivingNode:deformer:outputs:computeVertexCount:context:]", "SCNGeometryWrapDeformer.mm", 800, "parameters->_vertexCount == computeVertexCount");
}

- (void)initWithNode:innerLayerNode:outerLayerNode:deformer:outputs:computeVertexCount:context:.cold.1()
{
  __assert_rtn("-[SCNGeometryWrapDeformerInstance initWithNode:innerLayerNode:outerLayerNode:deformer:outputs:computeVertexCount:context:]", "SCNGeometryWrapDeformer.mm", 970, "parameters->_vertexCount == computeVertexCount");
}

@end