@interface SCNGeometryVariableTopologySampleDeformerInstance
- (id)meshForDeformedTopology;
- (unint64_t)updateWithContext:(id)a3;
- (void)dealloc;
- (void)initWithNode:(uint64_t)a3 deformer:(uint64_t)a4 outputs:(uint64_t)a5 computeVertexCount:(void *)a6 context:;
@end

@implementation SCNGeometryVariableTopologySampleDeformerInstance

- (void)initWithNode:(uint64_t)a3 deformer:(uint64_t)a4 outputs:(uint64_t)a5 computeVertexCount:(void *)a6 context:
{
  id v48 = a6;
  *(void *)((char *)&v77[1] + 4) = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v71.receiver = a1;
  v71.super_class = (Class)SCNGeometryVariableTopologySampleDeformerInstance;
  v7 = objc_msgSendSuper2(&v71, sel_init);
  v8 = v7;
  if (v7)
  {
    v7[1] = 1;
    uint64_t Geometry = C3DNodeGetGeometry([a2 nodeRef]);
    uint64_t Mesh = C3DGeometryGetMesh(Geometry);
    id v54 = (id)[v48 _currentResourceManager];
    CFArrayRef ElementsCount = C3DMeshGetElementsCount(Mesh);
    v51 = (char *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:ElementsCount];
    v8[3] = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:ElementsCount];
    if ((uint64_t)ElementsCount < 1)
    {
      uint64_t v11 = 0;
    }
    else
    {
      CFIndex v10 = 0;
      uint64_t v11 = 0;
      do
      {
        ElementAtIndex = C3DMeshGetElementAtIndex(Mesh, v10, 1);
        unsigned int Type = C3DMeshElementGetType((uint64_t)ElementAtIndex);
        if (C3DMeshElementTypeMapsToMTLPrimitiveType(Type))
        {
          if (C3DMeshElementGetType((uint64_t)ElementAtIndex))
          {
            v14 = scn_default_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
              -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:](v74, &v75, v14);
            }
          }
          v11 += C3DMeshElementGetPrimitiveCount((uint64_t)ElementAtIndex);
        }
        else
        {
          v15 = scn_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:](v76, v77, v15);
          }
        }
        ++v10;
      }
      while (ElementsCount != (const __CFArray *)v10);
    }
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v70[3] = 0;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    v65[0] = MEMORY[0x263EF8330];
    v65[1] = 3221225472;
    v65[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke;
    v65[3] = &unk_264005120;
    v65[4] = v70;
    v65[5] = &v66;
    v65[6] = v11;
    C3DMeshApplySources(Mesh, 1, (uint64_t)v65);
    if (v8[1] == 1)
    {
      uint64_t v17 = 4 * (void)ElementsCount;
      MEMORY[0x270FA5388](v16);
      bzero((char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
      v18 = (void *)[v48 currentBlitEncoder];
      v8[5] = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v54, (uint64_t)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v18);
      v8[7] = (id)[v54 computePipelineStateForKernel:@"deformer_variabletopologysample_any_order_finalize"];
    }
    uint64_t v50 = 32;
    v8[6] = -[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v54, 20 * (void)ElementsCount, 32);
    id v53 = objc_alloc_init(MEMORY[0x263F128B0]);
    if ((uint64_t)ElementsCount >= 1)
    {
      unint64_t v19 = 0;
      uint64_t v20 = 0;
      CFIndex v21 = 0;
      v49 = &v73;
      v52 = v8;
      do
      {
        v22 = C3DMeshGetElementAtIndex(Mesh, v21, 1);
        unsigned int v23 = C3DMeshElementGetType((uint64_t)v22);
        if (C3DMeshElementTypeMapsToMTLPrimitiveType(v23))
        {
          uint64_t PrimitiveCount = C3DMeshElementGetPrimitiveCount((uint64_t)v22);
          v25 = -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)v54, (uint64_t)v22);
          BOOL v26 = (*((_DWORD *)v67 + 6) - 65537) < 0xFFFF0000;
          unsigned int Size = SCNMTLIndexTypeGetSize(v26);
          v28 = (void *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)v54, 9 * PrimitiveCount * Size, v50);
          v29 = objc_alloc_init(SCNMTLBuffer);
          [(SCNMTLBuffer *)v29 setBuffer:v28];
          v30 = objc_alloc_init(SCNMTLMeshElement);
          -[SCNMTLMeshElement setIndexType:]((uint64_t)v30, v26);
          -[SCNMTLMeshElement setIndexBuffer:](v30, (char *)v29);
          -[SCNMTLMeshElement setIndexCount:]((uint64_t)v30, 0);
          -[SCNMTLMeshElement setInstanceCount:]((uint64_t)v30, 0);
          -[SCNMTLMesh setMutabilityTimestamp:]((uint64_t)v30, 3);
          -[SCNMTLMeshElement setDrawIndexedPrimitivesIndirectBuffer:](v30, (char *)v52[6]);
          -[SCNMTLMesh setVolatileOffset:]((uint64_t)v30, v20);
          [v51 addObject:v30];

          LODWORD(v61) = 0;
          uint64_t v31 = -[SCNMTLMesh elements]((uint64_t)v25);
          LODWORD(v61) = SCNMTLIndexTypeGetSize(v31);
          LODWORD(v60[0]) = 0;
          uint64_t v32 = -[SCNMTLMesh elements]((uint64_t)v30);
          LODWORD(v60[0]) = SCNMTLIndexTypeGetSize(v32);
          [v53 setConstantValue:&v61 type:33 atIndex:0];
          [v53 setConstantValue:v60 type:33 atIndex:1];
          uint64_t v33 = objc_msgSend(NSString, "stringWithFormat:", @"UInt%d-UInt%d", (8 * v61), (8 * LODWORD(v60[0])));
          v34 = objc_alloc_init(SCNGeometryVariableTopologySampleDeformerMeshElementData);
          v35 = v34;
          if (v34) {
            v34->_originaluint64_t PrimitiveCount = PrimitiveCount;
          }
          v36 = (void *)-[SCNMTLMeshElement indexBuffer]((uint64_t)v25);
          if (v35)
          {
            objc_setProperty_nonatomic(v35, v37, v36, 16);
            objc_setProperty_nonatomic(v35, v38, v28, 24);
            v35->_drawIndexedPrimitivesIndirectBufferOffset = v20;
            v35->_deformedPrimitiveCountBufferOffset = v19;
          }
          v39 = (void *)[v54 computePipelineStateForKernel:@"deformer_variabletopologysample_any_order" constants:v53 constantsHash:v33];
          if (v35) {
            objc_setProperty_nonatomic(v35, v40, v39, 56);
          }
          [(id)v52[3] addObject:v35];

          v8 = v52;
        }
        else
        {
          v41 = scn_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            -[SCNGeometryVariableTopologySampleDeformerInstance initWithNode:deformer:outputs:computeVertexCount:context:](v72, v49, v41);
          }
        }
        ++v21;
        v20 += 20;
        v19 += 4;
      }
      while (ElementsCount != (const __CFArray *)v21);
    }

    v42 = (char *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:C3DMeshGetSourcesCount(Mesh)];
    v43 = (void *)[MEMORY[0x263F12A80] vertexDescriptor];
    uint64_t v61 = 0;
    v62 = &v61;
    uint64_t v63 = 0x2020000000;
    uint64_t v64 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    v60[3] = 0;
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_55;
    v58[3] = &unk_264005170;
    v58[12] = ElementsCount;
    v58[13] = Mesh;
    char v59 = 1;
    v58[4] = v54;
    v58[5] = v48;
    v58[6] = v8;
    v58[7] = v43;
    v58[8] = v42;
    v58[10] = &v61;
    v58[11] = v60;
    v58[9] = &v66;
    C3DMeshApplySources(Mesh, 1, (uint64_t)v58);
    free((void *)v62[3]);
    v44 = (void *)v8[3];
    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_59;
    v57[3] = &unk_264005198;
    v57[4] = v8;
    v57[5] = v70;
    [v44 enumerateObjectsUsingBlock:v57];
    v45 = objc_alloc_init(SCNMTLMesh);
    v8[2] = v45;
    -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v45, v43);
    -[SCNMTLMesh setBuffers:]((void *)v8[2], v42);
    -[SCNMTLMesh setElements:]((void *)v8[2], v51);

    _Block_object_dispose(v60, 8);
    _Block_object_dispose(&v61, 8);
    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(v70, 8);
  }
  return v8;
}

void __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 != 7 && (a3 == 3 || a4 <= 0) && (a3 != 3 || a4 <= 7))
  {
    if (C3DMeshSourceIsVolatile(a2))
    {
      v6 = scn_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(v6);
      }
    }
    else
    {
      C3DMeshSourceGetContent(a2);
      *(void *)(*(void *)(a1[4] + 8) + 24) = v7;
      *(void *)(*(void *)(a1[5] + 8) + 24) = a1[6] + *(void *)(*(void *)(a1[4] + 8) + 24);
    }
  }
}

void __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_55(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (a3 != 7 && (a3 == 3 || a4 <= 0) && (a3 != 3 || a4 <= 7))
  {
    if (C3DMeshSourceIsVolatile(a2))
    {
      CFIndex v10 = scn_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(v10);
      }
    }
    else
    {
      uint64_t Content = C3DMeshSourceGetContent(a2);
      unsigned int v13 = v12;
      uint64_t v43 = v12;
      if (a3 > 1)
      {
        if (a3 == 3)
        {
          uint64_t v41 = 8 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = malloc_type_realloc(*(void **)(*(void *)(*(void *)(a1 + 80)+ 8)+ 24), v41, 0x7DA5C50uLL);
          if (v13)
          {
            uint64_t v28 = 0;
            unsigned int v29 = 0;
            do
            {
              *(double *)v25.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v43), (float *)(Content + v29), v25, v26, v27);
              *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * v28) = v25.i32[0];
              *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * (v28 + 1)) = v25.i32[1];
              v29 += BYTE5(v43);
              v28 += 2;
            }
            while (2 * v13 != v28);
          }
          uint64_t v57 = 0;
          v58 = &v57;
          uint64_t v59 = 0x2020000000;
          uint64_t v60 = v13;
          if (*(uint64_t *)(a1 + 96) >= 1)
          {
            CFIndex v30 = 0;
            do
            {
              ElementAtIndex = C3DMeshGetElementAtIndex(*(void *)(a1 + 104), v30, *(unsigned __int8 *)(a1 + 112));
              if (!C3DMeshElementGetType((uint64_t)ElementAtIndex))
              {
                uint64_t v56 = 0;
                long long v54 = 0u;
                __n128 v55 = 0u;
                long long v53 = 0u;
                C3DMeshElementGetContent((uint64_t)ElementAtIndex, a5, (uint64_t)&v53);
                v48[0] = v53;
                v48[1] = v54;
                v48[2] = v55;
                uint64_t v49 = v56;
                v47[0] = MEMORY[0x263EF8330];
                v47[1] = 3221225472;
                v47[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_2;
                v47[3] = &unk_264005148;
                v47[6] = Content;
                v47[7] = v43;
                v47[4] = *(void *)(a1 + 80);
                v47[5] = &v57;
                C3DIndicesContentEnumeratePrimitives((uint64_t *)v48, (uint64_t)v47, v55);
              }
              ++v30;
            }
            while (v30 < *(void *)(a1 + 96));
          }
          v22 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v41, (void *)[*(id *)(a1 + 40) currentBlitEncoder]);
          uint64_t v24 = 8;
          _Block_object_dispose(&v57, 8);
          uint64_t v23 = 29;
        }
        else if (a3 == 4 || a3 == 2)
        {
          uint64_t v42 = 16 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
          *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = malloc_type_realloc(*(void **)(*(void *)(*(void *)(a1 + 80)+ 8)+ 24), v42, 0x6B09815DuLL);
          if (v13)
          {
            uint64_t v35 = 0;
            unsigned int v36 = 0;
            do
            {
              *(double *)v32.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v43), (float *)(Content + v36), v32, v33, v34);
              *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * v35) = v32.i32[0];
              *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * (v35 + 1)) = v32.i32[1];
              *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * (v35 + 2)) = v32.i32[2];
              *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * (v35 + 3)) = v32.i32[3];
              v36 += BYTE5(v43);
              v35 += 4;
            }
            while (4 * v13 != v35);
          }
          uint64_t v57 = 0;
          v58 = &v57;
          uint64_t v59 = 0x2020000000;
          uint64_t v60 = v13;
          if (*(uint64_t *)(a1 + 96) >= 1)
          {
            CFIndex v37 = 0;
            do
            {
              SEL v38 = C3DMeshGetElementAtIndex(*(void *)(a1 + 104), v37, *(unsigned __int8 *)(a1 + 112));
              if (!C3DMeshElementGetType((uint64_t)v38))
              {
                uint64_t v56 = 0;
                long long v54 = 0u;
                __n128 v55 = 0u;
                long long v53 = 0u;
                C3DMeshElementGetContent((uint64_t)v38, a5, (uint64_t)&v53);
                v45[0] = v53;
                v45[1] = v54;
                v45[2] = v55;
                uint64_t v46 = v56;
                v44[0] = MEMORY[0x263EF8330];
                v44[1] = 3221225472;
                v44[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_3;
                v44[3] = &unk_264005148;
                v44[6] = Content;
                v44[7] = v43;
                v44[4] = *(void *)(a1 + 80);
                v44[5] = &v57;
                C3DIndicesContentEnumeratePrimitives((uint64_t *)v45, (uint64_t)v44, v55);
              }
              ++v37;
            }
            while (v37 < *(void *)(a1 + 96));
          }
          v22 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v42, (void *)[*(id *)(a1 + 40) currentBlitEncoder]);
          _Block_object_dispose(&v57, 8);
          uint64_t v23 = 31;
          uint64_t v24 = 16;
        }
        else
        {
          v39 = scn_default_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_55_cold_2(a3, v39);
          }
          uint64_t v24 = 0;
          v22 = 0;
          uint64_t v23 = 0;
        }
      }
      else
      {
        uint64_t v40 = 12 * *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = malloc_type_realloc(*(void **)(*(void *)(*(void *)(a1 + 80) + 8)+ 24), v40, 0x76C7E36BuLL);
        if (v13)
        {
          uint64_t v17 = 0;
          unsigned int v18 = 0;
          do
          {
            *(double *)v14.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v43), (float *)(Content + v18), v14, v15, v16);
            *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * v17) = v14.i32[0];
            *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * (v17 + 1)) = v14.i32[1];
            *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) + 4 * (v17 + 2)) = v14.i32[2];
            v18 += BYTE5(v43);
            v17 += 3;
          }
          while (3 * v13 != v17);
        }
        uint64_t v57 = 0;
        v58 = &v57;
        uint64_t v59 = 0x2020000000;
        uint64_t v60 = v13;
        if (*(uint64_t *)(a1 + 96) >= 1)
        {
          CFIndex v19 = 0;
          do
          {
            uint64_t v20 = C3DMeshGetElementAtIndex(*(void *)(a1 + 104), v19, *(unsigned __int8 *)(a1 + 112));
            if (!C3DMeshElementGetType((uint64_t)v20))
            {
              uint64_t v56 = 0;
              long long v54 = 0u;
              __n128 v55 = 0u;
              long long v53 = 0u;
              C3DMeshElementGetContent((uint64_t)v20, a5, (uint64_t)&v53);
              v51[0] = v53;
              v51[1] = v54;
              v51[2] = v55;
              uint64_t v52 = v56;
              v50[0] = MEMORY[0x263EF8330];
              v50[1] = 3221225472;
              v50[2] = __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_56;
              v50[3] = &unk_264005148;
              v50[6] = Content;
              v50[7] = v43;
              v50[4] = *(void *)(a1 + 80);
              v50[5] = &v57;
              C3DIndicesContentEnumeratePrimitives((uint64_t *)v51, (uint64_t)v50, v55);
            }
            ++v19;
          }
          while (v19 < *(void *)(a1 + 96));
        }
        CFIndex v21 = (void *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v40, (void *)[*(id *)(a1 + 40) currentBlitEncoder]);
        v22 = v21;
        if (!a3) {
          *(void *)(*(void *)(a1 + 48) + 32) = v21;
        }
        _Block_object_dispose(&v57, 8);
        uint64_t v23 = 30;
        uint64_t v24 = 12;
      }
      +[SCNMTLResourceManager _fillVertexDescriptor:*(void *)(a1 + 56) withSemantic:a3 inputSet:a4 bufferIndex:(*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))++ vertexFormat:v23 offset:0 stride:v24];
      [*(id *)(a1 + 64) addObject:v22];
    }
  }
}

float32x4_t __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_56(uint64_t a1, float32x4_t a2, float a3, float a4, uint64_t a5, _DWORD *a6)
{
  *(double *)v8.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + *a6 * *(unsigned __int8 *)(a1 + 61)), a2, a3, a4);
  float32x4_t v22 = v8;
  *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + a6[1] * *(unsigned __int8 *)(a1 + 61)), v8, v9, v10);
  float32x4_t v21 = v11;
  *(double *)v14.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + a6[2] * *(unsigned __int8 *)(a1 + 61)), v11, v12, v13);
  __asm { FMOV            V1.4S, #3.0 }
  float32x4_t result = vdivq_f32(vaddq_f32(vaddq_f32(v22, v21), v14), _Q1);
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
            + 12 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = result.i64[0];
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
            + 12 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++
            + 8) = result.i32[2];
  return result;
}

double __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_2(uint64_t a1, float32x4_t a2, float a3, float a4, uint64_t a5, _DWORD *a6)
{
  *(double *)v8.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + *a6 * *(unsigned __int8 *)(a1 + 61)), a2, a3, a4);
  float32x4_t v22 = v8;
  *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + a6[1] * *(unsigned __int8 *)(a1 + 61)), v8, v9, v10);
  float32x4_t v21 = v11;
  *(double *)v14.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + a6[2] * *(unsigned __int8 *)(a1 + 61)), v11, v12, v13);
  __asm { FMOV            V1.4S, #3.0 }
  *(void *)&double result = vdivq_f32(vaddq_f32(vaddq_f32(v22, v21), v14), _Q1).u64[0];
  *(double *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
            + 8 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++) = result;
  return result;
}

float32x4_t __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_3(uint64_t a1, float32x4_t a2, float a3, float a4, uint64_t a5, _DWORD *a6)
{
  *(double *)v8.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + *a6 * *(unsigned __int8 *)(a1 + 61)), a2, a3, a4);
  float32x4_t v22 = v8;
  *(double *)v11.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + a6[1] * *(unsigned __int8 *)(a1 + 61)), v8, v9, v10);
  float32x4_t v21 = v11;
  *(double *)v14.i64 = C3DConvertFloatingTypeToFloat4(*(unsigned __int8 *)(a1 + 60), (float *)(*(void *)(a1 + 48) + a6[2] * *(unsigned __int8 *)(a1 + 61)), v11, v12, v13);
  __asm { FMOV            V1.4S, #3.0 }
  float32x4_t result = vdivq_f32(vaddq_f32(vaddq_f32(vdivq_f32(v22, (float32x4_t)vdupq_laneq_s32((int32x4_t)v22, 3)), vdivq_f32(v21, (float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 3))), vdivq_f32(v14, (float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 3))), _Q1);
  *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
            + 16 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) = result.i64[0];
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
            + 16 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
            + 8) = result.i32[2];
  *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
            + 16 * (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))++
            + 12) = 1065353216;
  return result;
}

void *__110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_59(void *result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    float32x4_t result = (void *)[*(id *)(result[4] + 24) objectAtIndexedSubscript:a3 - 1];
    if (result)
    {
      uint64_t v4 = result[1];
      uint64_t v5 = result[5];
      if (!a2) {
        return result;
      }
    }
    else
    {
      uint64_t v4 = 0;
      uint64_t v5 = 0;
      if (!a2) {
        return result;
      }
    }
    uint64_t v6 = v5 + v4;
  }
  else
  {
    if (!a2) {
      return result;
    }
    uint64_t v6 = *(void *)(*(void *)(result[5] + 8) + 24);
  }
  *(void *)(a2 + 40) = v6;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryVariableTopologySampleDeformerInstance;
  [(SCNGeometryVariableTopologySampleDeformerInstance *)&v3 dealloc];
}

- (id)meshForDeformedTopology
{
  return self->_deformedMesh;
}

- (unint64_t)updateWithContext:(id)a3
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  uint64_t v5 = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]([a3 _currentRenderContext]);
  [(MTLComputeCommandEncoder *)v5->_encoder pushDebugGroup:@"Variable topology sample deformer"];
  double v6 = -[SCNMTLRenderContext renderTime]([a3 _currentRenderContext]);
  float v7 = (float)((float)((float)(cosf(*(float *)&v6) * 0.5) + 0.5) * 1.5) + -0.25;
  if (v7 >= 1.0) {
    float v7 = 1.0;
  }
  if (v7 > 0.0) {
    float v8 = v7;
  }
  else {
    float v8 = 0.0;
  }
  unint64_t mode = self->_mode;
  if (mode != 1)
  {
    if (mode) {
      goto LABEL_94;
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    meshElementData = self->_meshElementData;
    uint64_t v11 = [(NSMutableArray *)meshElementData countByEnumeratingWithState:&v67 objects:v72 count:16];
    if (!v11) {
      goto LABEL_94;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v68;
LABEL_10:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v68 != v13) {
        objc_enumerationMutation(meshElementData);
      }
      uint64_t v15 = *(void *)(*((void *)&v67 + 1) + 8 * v14);
      *(unint64_t *)((char *)v55 + 4) = 0;
      *(float *)__n128 v55 = v8;
      if (v15)
      {
        uint64_t v16 = *(void *)(v15 + 40);
        HIDWORD(v55[0]) = *(void *)(v15 + 8);
        LODWORD(v55[1]) = v16;
        SCNMTLComputeCommandEncoder::setBytes(v5, v55, 0xCuLL, 0);
        uint64_t v17 = [*(id *)(v15 + 16) buffer];
        unsigned int v18 = *(void **)(v15 + 16);
      }
      else
      {
        LODWORD(v55[1]) = 0;
        SCNMTLComputeCommandEncoder::setBytes(v5, v55, 0xCuLL, 0);
        uint64_t v17 = [0 buffer];
        unsigned int v18 = 0;
      }
      uint64_t v19 = [v18 offset];
      if (v5->_buffers[1] == (MTLBuffer *)v17)
      {
        if (v5->_offsets[1] == v19) {
          goto LABEL_19;
        }
      }
      else
      {
        v5->_buffers[1] = (MTLBuffer *)v17;
      }
      v5->_offsets[1] = v19;
      v5->_buffersToBind[0] |= 2uLL;
LABEL_19:
      if (v15) {
        uint64_t v20 = *(MTLBuffer **)(v15 + 24);
      }
      else {
        uint64_t v20 = 0;
      }
      if (v5->_buffers[2] == v20)
      {
        if (!v5->_offsets[2]) {
          goto LABEL_25;
        }
      }
      else
      {
        v5->_buffers[2] = v20;
      }
      v5->_offsets[2] = 0;
      v5->_buffersToBind[0] |= 4uLL;
LABEL_25:
      drawIndexedPrimitivesIndirectBuffer = self->_drawIndexedPrimitivesIndirectBuffer;
      if (v15) {
        unint64_t v22 = *(void *)(v15 + 32);
      }
      else {
        unint64_t v22 = 0;
      }
      if (v5->_buffers[3] != drawIndexedPrimitivesIndirectBuffer)
      {
        v5->_buffers[3] = drawIndexedPrimitivesIndirectBuffer;
LABEL_30:
        v5->_offsets[3] = v22;
        v5->_buffersToBind[0] |= 8uLL;
        goto LABEL_31;
      }
      if (v5->_offsets[3] != v22) {
        goto LABEL_30;
      }
LABEL_31:
      if (v15) {
        uint64_t v23 = *(void *)(v15 + 56);
      }
      else {
        uint64_t v23 = 0;
      }
      uint64_t v24 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](v23);
      uint64_t v25 = HIDWORD(v55[0]);
      if (v5->_computePipelineState != (MTLComputePipelineState *)v24)
      {
        v5->_computePipelineState = (MTLComputePipelineState *)v24;
        [(MTLComputeCommandEncoder *)v5->_encoder setComputePipelineState:v24];
      }
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, v25);
      if (v12 == ++v14)
      {
        uint64_t v26 = [(NSMutableArray *)meshElementData countByEnumeratingWithState:&v67 objects:v72 count:16];
        uint64_t v12 = v26;
        if (!v26) {
          goto LABEL_94;
        }
        goto LABEL_10;
      }
    }
  }
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  *(_OWORD *)__n128 v55 = 0u;
  long long v56 = 0u;
  if (a3) {
    [a3 _currentTransforms];
  }
  positionBuffer = self->_positionBuffer;
  if (v5->_buffers[1] != positionBuffer)
  {
    v5->_buffers[1] = positionBuffer;
LABEL_48:
    v5->_offsets[1] = 0;
    v5->_buffersToBind[0] |= 2uLL;
    goto LABEL_49;
  }
  if (v5->_offsets[1]) {
    goto LABEL_48;
  }
LABEL_49:
  SCNMTLComputeCommandEncoder::setBytes(v5, v55, 0xC0uLL, 2uLL);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v28 = self->_meshElementData;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v51 objects:v71 count:16];
  if (!v29) {
    goto LABEL_83;
  }
  uint64_t v30 = v29;
  uint64_t v31 = *(void *)v52;
  do
  {
    uint64_t v32 = 0;
    do
    {
      if (*(void *)v52 != v31) {
        objc_enumerationMutation(v28);
      }
      uint64_t v33 = *(void *)(*((void *)&v51 + 1) + 8 * v32);
      *(void *)&v50[1] = 0;
      *(float *)uint64_t v50 = v8;
      if (v33)
      {
        uint64_t v34 = *(void *)(v33 + 40);
        v50[1] = *(void *)(v33 + 8);
        v50[2] = v34;
        SCNMTLComputeCommandEncoder::setBytes(v5, v50, 0xCuLL, 0);
        uint64_t v35 = [*(id *)(v33 + 16) buffer];
        unsigned int v36 = *(void **)(v33 + 16);
      }
      else
      {
        v50[2] = 0;
        SCNMTLComputeCommandEncoder::setBytes(v5, v50, 0xCuLL, 0);
        uint64_t v35 = [0 buffer];
        unsigned int v36 = 0;
      }
      uint64_t v37 = [v36 offset];
      if (v5->_buffers[3] == (MTLBuffer *)v35)
      {
        if (v5->_offsets[3] == v37) {
          goto LABEL_60;
        }
      }
      else
      {
        v5->_buffers[3] = (MTLBuffer *)v35;
      }
      v5->_offsets[3] = v37;
      v5->_buffersToBind[0] |= 8uLL;
LABEL_60:
      if (v33) {
        SEL v38 = *(MTLBuffer **)(v33 + 24);
      }
      else {
        SEL v38 = 0;
      }
      if (v5->_buffers[4] == v38)
      {
        if (!v5->_offsets[4]) {
          goto LABEL_66;
        }
      }
      else
      {
        v5->_buffers[4] = v38;
      }
      v5->_offsets[4] = 0;
      v5->_buffersToBind[0] |= 0x10uLL;
LABEL_66:
      deformedPrimitiveCountBuffer = self->_deformedPrimitiveCountBuffer;
      if (v33) {
        unint64_t v40 = *(void *)(v33 + 48);
      }
      else {
        unint64_t v40 = 0;
      }
      if (v5->_buffers[5] == deformedPrimitiveCountBuffer)
      {
        if (v5->_offsets[5] == v40) {
          goto LABEL_72;
        }
      }
      else
      {
        v5->_buffers[5] = deformedPrimitiveCountBuffer;
      }
      v5->_offsets[5] = v40;
      v5->_buffersToBind[0] |= 0x20uLL;
LABEL_72:
      if (v33) {
        uint64_t v41 = *(void *)(v33 + 56);
      }
      else {
        uint64_t v41 = 0;
      }
      uint64_t v42 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](v41);
      uint64_t v43 = v50[1];
      if (v5->_computePipelineState != (MTLComputePipelineState *)v42)
      {
        v5->_computePipelineState = (MTLComputePipelineState *)v42;
        [(MTLComputeCommandEncoder *)v5->_encoder setComputePipelineState:v42];
      }
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, v43);
      ++v32;
    }
    while (v30 != v32);
    uint64_t v44 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v51 objects:v71 count:16];
    uint64_t v30 = v44;
  }
  while (v44);
LABEL_83:
  v50[0] = [(NSMutableArray *)self->_meshElementData count];
  v45 = self->_deformedPrimitiveCountBuffer;
  if (v5->_buffers[0] != v45)
  {
    v5->_buffers[0] = v45;
    goto LABEL_86;
  }
  if (v5->_offsets[0])
  {
LABEL_86:
    v5->_offsets[0] = 0;
    v5->_buffersToBind[0] |= 1uLL;
  }
  uint64_t v46 = self->_drawIndexedPrimitivesIndirectBuffer;
  if (v5->_buffers[1] != v46)
  {
    v5->_buffers[1] = v46;
    goto LABEL_90;
  }
  if (v5->_offsets[1])
  {
LABEL_90:
    v5->_offsets[1] = 0;
    v5->_buffersToBind[0] |= 2uLL;
  }
  SCNMTLComputeCommandEncoder::setBytes(v5, v50, 4uLL, 2uLL);
  uint64_t v47 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_finalizeComputePipeline);
  uint64_t v48 = v50[0];
  if (v5->_computePipelineState != (MTLComputePipelineState *)v47)
  {
    v5->_computePipelineState = (MTLComputePipelineState *)v47;
    [(MTLComputeCommandEncoder *)v5->_encoder setComputePipelineState:v47];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v5, v48);
LABEL_94:
  [(MTLComputeCommandEncoder *)v5->_encoder popDebugGroup];
  return 1;
}

- (void)initWithNode:(NSObject *)a3 deformer:outputs:computeVertexCount:context:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "dataKind == kC3DMeshDataKindOriginal";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Only original data kind can have non 'GPU' primitive type", a1);
}

- (void)initWithNode:(NSObject *)a3 deformer:outputs:computeVertexCount:context:.cold.2(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "C3DMeshElementGetType(meshElement) == kC3DMeshElementTypeTrianglesArray";
  OUTLINED_FUNCTION_0_2(&dword_20B249000, (int)a2, a3, "Assertion '%s' failed. Variable topology sample expects triangles", a1);
}

void __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B249000, log, OS_LOG_TYPE_ERROR, "Unreachable code: Volatile meshes are not supported by the deformer stack", v1, 2u);
}

void __110__SCNGeometryVariableTopologySampleDeformerInstance_initWithNode_deformer_outputs_computeVertexCount_context___block_invoke_55_cold_2(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = C3DMeshSourceSemanticToSemanticString(a1);
  _os_log_error_impl(&dword_20B249000, a2, OS_LOG_TYPE_ERROR, "Unreachable code: Unsupported semantic %@", (uint8_t *)&v3, 0xCu);
}

@end