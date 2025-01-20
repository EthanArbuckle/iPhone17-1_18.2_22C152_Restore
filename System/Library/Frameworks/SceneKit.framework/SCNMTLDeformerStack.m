@interface SCNMTLDeformerStack
- (BOOL)computeDeformedMeshReliesOnFrustum;
- (BOOL)computeDeformedMeshReliesOnTransforms;
- (Class)deformerClassForMeshlesshGeometry:(__C3DGeometry *)a3;
- (MTLBlitCommandEncoder)currentBlitEncoder;
- (MTLStageInputOutputDescriptor)stageInputDescriptor;
- (SCNMTLComputeCommandEncoder)currentComputeEncoder;
- (__CFString)_baseEntityName;
- (__n128)_currentFrustumInfo;
- (__n128)currentTransforms;
- (id)deindexedToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4;
- (id)deindexedToOriginalTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4;
- (id)dependencyBufferForInput:(unint64_t)a3 dependencyMesh:(id)a4;
- (id)dependencyBufferForInput:(unint64_t)a3 dependencyStack:(id)a4;
- (id)newBufferForDataKind:(unsigned __int8)a3 meshSource:(__C3DMeshSource *)a4 dataType:(signed __int16)a5 forStageInputOutputDescriptor:(BOOL)a6 usePrivateStorageMode:(BOOL)a7 outStride:(unint64_t *)a8;
- (id)newBufferForDataKind:(unsigned __int8)a3 positionSource:(__C3DMeshSource *)a4 normalSource:(__C3DMeshSource *)a5 positionDataType:(signed __int16)a6 normalDataType:(signed __int16)a7 forStageInputOutputDescriptor:(BOOL)a8 usePrivateStorageMode:(BOOL)a9 outStride:(unint64_t *)a10 outPositionOffset:(unint64_t *)a11 outNormalOffset:(unint64_t *)a12;
- (id)originalToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4;
- (uint64_t)bufferForCommonProfileArgumentNamed:(uint64_t)result;
- (uint64_t)computeDeformedMeshForContext:(unsigned __int8)a3 programHashCodeRequirements:(long long *)a4 transforms:(long long *)a5 frustumInfo:(BOOL *)a6 status:;
- (uint64_t)invalidate;
- (uint64_t)setNextUpdateRequiresResetForIncrementalDeformers;
- (unint64_t)currentFrameHash;
- (void)dealloc;
- (void)drawAuthoringEnvironment:(uint64_t)a3 context:;
- (void)encodeCommandsInNewCommandBufferUsingBlock:(id)a3;
- (void)enumerateInternalDeformersUsingBlock:(id)a3;
- (void)initWithDeformerStack:(uint64_t)a3 node:(char)a4 dataKind:(uint64_t)a5 resourceManager:;
- (void)reconfigureIfNeededWithContext:(id)a3 programHashCodeRequirements:(id)a4;
- (void)setStageInputOutputBuffersToEncoder:(SCNMTLComputeCommandEncoder *)a3;
- (void)setupFinalMeshFromBaseMeshWithInfo:(id)a3;
- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(id)a3;
- (void)setupInitialBuffersWithBasePositionSourceProvider:(id)a3 baseNormalSourceProvider:(id)a4 baseTangentSourceProvider:(id)a5 info:(id)a6;
- (void)updateDataForAuthoringEnvironment:(long long *)a3 transforms:(uint64_t)a4 context:;
- (void)updateDependencyBuffersInBufferArray:(id *)a3 forDeformer:(id)a4;
@end

@implementation SCNMTLDeformerStack

- (void)initWithDeformerStack:(uint64_t)a3 node:(char)a4 dataKind:(uint64_t)a5 resourceManager:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v32.receiver = a1;
  v32.super_class = (Class)SCNMTLDeformerStack;
  v9 = objc_msgSendSuper2(&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    v9[1] = a5;
    v9[2] = a2;
    v9[3] = a3;
    *((unsigned char *)v9 + 48) = a4;
    *((unsigned char *)v9 + 49) = a4;
    PostMorphingDeformers = (void *)C3DDeformerStackGetPostMorphingDeformers(a2);
    PostSkinningDeformers = (void *)C3DDeformerStackGetPostSkinningDeformers(v10[2]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v13 = [PostMorphingDeformers countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(PostMorphingDeformers);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          *((unsigned char *)v10 + 49) = 0;
          *((unsigned char *)v10 + 51) |= [v17 deformedMeshReliesOnTransforms];
          *((unsigned char *)v10 + 52) |= [v17 deformedMeshReliesOnFrustum];
        }
        uint64_t v14 = [PostMorphingDeformers countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v14);
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v18 = [PostSkinningDeformers countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(PostSkinningDeformers);
          }
          v22 = *(void **)(*((void *)&v24 + 1) + 8 * j);
          *((unsigned char *)v10 + 49) = 0;
          *((unsigned char *)v10 + 51) |= [v22 deformedMeshReliesOnTransforms];
          *((unsigned char *)v10 + 52) |= [v22 deformedMeshReliesOnFrustum];
        }
        uint64_t v19 = [PostSkinningDeformers countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v19);
    }
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLDeformerStack;
  [(SCNMTLDeformerStack *)&v3 dealloc];
}

- (__CFString)_baseEntityName
{
  baseMesh = self->_baseMesh;
  if (!baseMesh || (result = (__CFString *)C3DEntityGetName((uint64_t)baseMesh)) == 0)
  {
    baseGeometry = self->_baseGeometry;
    return (__CFString *)C3DEntityGetName((uint64_t)baseGeometry);
  }
  return result;
}

- (Class)deformerClassForMeshlesshGeometry:(__C3DGeometry *)a3
{
  CFTypeID v3 = CFGetTypeID(a3);
  if (v3 == C3DBezierCurveGeometryGetTypeID())
  {
    return (Class)objc_opt_class();
  }
  else
  {
    v5 = scn_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLDeformerStack deformerClassForMeshlesshGeometry:]();
    }
    return 0;
  }
}

- (void)enumerateInternalDeformersUsingBlock:(id)a3
{
  if (self->_morphDeformer) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  if (self->_skinDeformer) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  if (self->_meshlessDeformer) {
    (*((void (**)(id))a3 + 2))(a3);
  }
  if (self->_smoothNormalsDeformer)
  {
    v5 = (void (*)(id))*((void *)a3 + 2);
    v5(a3);
  }
}

- (void)setupInitialBuffersWithBasePositionSourceProvider:(id)a3 baseNormalSourceProvider:(id)a4 baseTangentSourceProvider:(id)a5 info:(id)a6
{
  uint64_t v6 = *(void *)&a6.var0;
  initialPositionBuffer = self->_initialPositionBuffer;
  if (initialPositionBuffer)
  {
    CFRelease(initialPositionBuffer);
    self->_initialPositionBuffer = 0;
  }
  initialNormalBuffer = self->_initialNormalBuffer;
  if (initialNormalBuffer)
  {
    CFRelease(initialNormalBuffer);
    self->_initialNormalBuffer = 0;
  }
  initialTangentBuffer = self->_initialTangentBuffer;
  if (initialTangentBuffer)
  {
    CFRelease(initialTangentBuffer);
    self->_initialTangentBuffer = 0;
  }
  initialBuffersStageInputDescriptor = self->_initialBuffersStageInputDescriptor;
  if (initialBuffersStageInputDescriptor)
  {
    CFRelease(initialBuffersStageInputDescriptor);
    self->_initialBuffersStageInputDescriptor = 0;
  }
  self->_initialPositionStageInputOutputDescriptorInfo.isActive = 0;
  self->_initialNormalStageInputOutputDescriptorInfo.isActive = 0;
  self->_initialTangentStageInputOutputDescriptorInfo.isActive = 0;
  if ((v6 & 0x100010001) != 0)
  {
    self->_initialBuffersStageInputDescriptor = (MTLStageInputOutputDescriptor *)objc_alloc_init(MEMORY[0x263F12A18]);
    uint64_t v15 = (*((uint64_t (**)(id, void))a3 + 2))(a3, self->_deformDataKind);
    uint64_t Count = C3DMeshSourceGetCount(v15);
    if (v6)
    {
      v17 = [(MTLAttributeDescriptorArray *)[(MTLStageInputOutputDescriptor *)self->_initialBuffersStageInputDescriptor attributes] objectAtIndexedSubscript:0];
      [(MTLAttributeDescriptor *)v17 setFormat:30];
      [(MTLAttributeDescriptor *)v17 setOffset:0];
      [(MTLAttributeDescriptor *)v17 setBufferIndex:10];
      uint64_t v18 = [(MTLBufferLayoutDescriptorArray *)[(MTLStageInputOutputDescriptor *)self->_initialBuffersStageInputDescriptor layouts] objectAtIndexedSubscript:[(MTLAttributeDescriptor *)v17 bufferIndex]];
      [(MTLBufferLayoutDescriptor *)v18 setStepFunction:5];
      if ((v6 & 0x100) != 0)
      {
        uint64_t v59 = 0;
        self->_initialPositionBuffer = (MTLBuffer *)[(SCNMTLDeformerStack *)self newBufferForDataKind:self->_deformDataKind meshSource:v15 dataType:9 forStageInputOutputDescriptor:1 usePrivateStorageMode:1 outStride:&v59];
        uint64_t v21 = v59;
        uint64_t v20 = v18;
      }
      else
      {
        uint64_t Size = SCNMTLVertexFormatGetSize(30);
        self->_initialPositionBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * Size, 32);
        uint64_t v20 = v18;
        uint64_t v21 = Size;
      }
      [(MTLBufferLayoutDescriptor *)v20 setStride:v21];
      unint64_t v22 = [(MTLAttributeDescriptor *)v17 format];
      unint64_t v23 = [(MTLAttributeDescriptor *)v17 offset];
      unint64_t v24 = [(MTLBufferLayoutDescriptor *)v18 stride];
      self->_initialPositionStageInputOutputDescriptorInfo.isActive = 1;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferAttributeFormat = v22;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferAttributeOffset = v23;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferLayoutStride = v24;
      if ((v6 & 0x10000) == 0)
      {
LABEL_12:
        if ((v6 & 0x100000000) == 0) {
          return;
        }
        goto LABEL_25;
      }
    }
    else if ((v6 & 0x10000) == 0)
    {
      goto LABEL_12;
    }
    long long v25 = [(MTLAttributeDescriptorArray *)[(MTLStageInputOutputDescriptor *)self->_initialBuffersStageInputDescriptor attributes] objectAtIndexedSubscript:1];
    [(MTLAttributeDescriptor *)v25 setFormat:30];
    [(MTLAttributeDescriptor *)v25 setOffset:0];
    [(MTLAttributeDescriptor *)v25 setBufferIndex:11];
    long long v26 = [(MTLBufferLayoutDescriptorArray *)[(MTLStageInputOutputDescriptor *)self->_initialBuffersStageInputDescriptor layouts] objectAtIndexedSubscript:[(MTLAttributeDescriptor *)v25 bufferIndex]];
    [(MTLBufferLayoutDescriptor *)v26 setStepFunction:5];
    if ((v6 & 0x1000000) != 0)
    {
      uint64_t v30 = (*((uint64_t (**)(id, void))a4 + 2))(a4, self->_deformDataKind);
      if (!v30)
      {
        long long v31 = scn_default_log();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
          -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:](v31, v32, v33, v34, v35, v36, v37, v38);
        }
      }
      uint64_t v59 = 0;
      self->_initialNormalBuffer = (MTLBuffer *)[(SCNMTLDeformerStack *)self newBufferForDataKind:self->_deformDataKind meshSource:v30 dataType:9 forStageInputOutputDescriptor:1 usePrivateStorageMode:1 outStride:&v59];
      uint64_t v29 = v59;
      long long v28 = v26;
    }
    else
    {
      uint64_t v27 = SCNMTLVertexFormatGetSize(30);
      self->_initialNormalBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * v27, 32);
      long long v28 = v26;
      uint64_t v29 = v27;
    }
    [(MTLBufferLayoutDescriptor *)v28 setStride:v29];
    unint64_t v39 = [(MTLAttributeDescriptor *)v25 format];
    unint64_t v40 = [(MTLAttributeDescriptor *)v25 offset];
    unint64_t v41 = [(MTLBufferLayoutDescriptor *)v26 stride];
    self->_initialNormalStageInputOutputDescriptorInfo.isActive = 1;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferAttributeFormat = v39;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferAttributeOffset = v40;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferLayoutStride = v41;
    if ((v6 & 0x100000000) != 0)
    {
LABEL_25:
      v42 = [(MTLAttributeDescriptorArray *)[(MTLStageInputOutputDescriptor *)self->_initialBuffersStageInputDescriptor attributes] objectAtIndexedSubscript:2];
      [(MTLAttributeDescriptor *)v42 setFormat:31];
      [(MTLAttributeDescriptor *)v42 setOffset:0];
      [(MTLAttributeDescriptor *)v42 setBufferIndex:12];
      v43 = [(MTLBufferLayoutDescriptorArray *)[(MTLStageInputOutputDescriptor *)self->_initialBuffersStageInputDescriptor layouts] objectAtIndexedSubscript:[(MTLAttributeDescriptor *)v42 bufferIndex]];
      [(MTLBufferLayoutDescriptor *)v43 setStepFunction:5];
      if ((v6 & 0x10000000000) != 0)
      {
        uint64_t v47 = (*((uint64_t (**)(id, void))a5 + 2))(a5, self->_deformDataKind);
        if (!v47)
        {
          v48 = scn_default_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT)) {
            -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:](v48, v49, v50, v51, v52, v53, v54, v55);
          }
        }
        uint64_t v59 = 0;
        self->_initialTangentBuffer = (MTLBuffer *)[(SCNMTLDeformerStack *)self newBufferForDataKind:self->_deformDataKind meshSource:v47 dataType:10 forStageInputOutputDescriptor:1 usePrivateStorageMode:1 outStride:&v59];
        uint64_t v46 = v59;
        v45 = v43;
      }
      else
      {
        uint64_t v44 = SCNMTLVertexFormatGetSize(31);
        self->_initialTangentBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * v44, 32);
        v45 = v43;
        uint64_t v46 = v44;
      }
      [(MTLBufferLayoutDescriptor *)v45 setStride:v46];
      unint64_t v56 = [(MTLAttributeDescriptor *)v42 format];
      unint64_t v57 = [(MTLAttributeDescriptor *)v42 offset];
      unint64_t v58 = [(MTLBufferLayoutDescriptor *)v43 stride];
      self->_initialTangentStageInputOutputDescriptorInfo.isActive = 1;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferAttributeFormat = v56;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferAttributeOffset = v57;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferLayoutStride = v58;
    }
  }
}

- (void)setupFinalMeshFromBaseMeshWithInfo:(id)a3
{
  *(void *)&v62[5] = *MEMORY[0x263EF8340];
  deformPositionBuffer = self->_deformPositionBuffer;
  if (deformPositionBuffer)
  {
    CFRelease(deformPositionBuffer);
    self->_deformPositionBuffer = 0;
  }
  deformNormalBuffer = self->_deformNormalBuffer;
  if (deformNormalBuffer)
  {
    CFRelease(deformNormalBuffer);
    self->_deformNormalBuffer = 0;
  }
  deformTangentBuffer = self->_deformTangentBuffer;
  if (deformTangentBuffer)
  {
    CFRelease(deformTangentBuffer);
    self->_deformTangentBuffer = 0;
  }
  finalMesh = self->_finalMesh;
  if (finalMesh)
  {
    CFRelease(finalMesh);
    self->_finalMesh = 0;
  }
  finalPositionBuffer = self->_finalPositionBuffer;
  if (finalPositionBuffer)
  {
    CFRelease(finalPositionBuffer);
    self->_finalPositionBuffer = 0;
  }
  finalNormalBuffer = self->_finalNormalBuffer;
  if (finalNormalBuffer)
  {
    CFRelease(finalNormalBuffer);
    self->_finalNormalBuffer = 0;
  }
  finalTangentBuffer = self->_finalTangentBuffer;
  if (finalTangentBuffer)
  {
    CFRelease(finalTangentBuffer);
    self->_finalTangentBuffer = 0;
  }
  int finalDataKind = self->_finalDataKind;
  BOOL v13 = self->_finalDataKind == 0;
  uint64_t v14 = (void *)[MEMORY[0x263F12A80] vertexDescriptor];
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:C3DMeshGetSourcesCount((uint64_t)self->_baseMesh)];
  baseMesh = self->_baseMesh;
  int v17 = self->_finalDataKind;
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __58__SCNMTLDeformerStack_setupFinalMeshFromBaseMeshWithInfo___block_invoke;
  v59[3] = &unk_264005D00;
  v59[4] = self;
  v59[5] = v15;
  v59[6] = v14;
  BOOL v60 = v13;
  C3DMeshApplySources((uint64_t)baseMesh, v17, (uint64_t)v59);
  if (a3.var0)
  {
    uint64_t Size = SCNMTLVertexFormatGetSize(30);
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, self->_deformDataKind);
    uint64_t Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    if ((*(_WORD *)&a3.var0 & 0x100) != 0) {
      uint64_t v21 = [(SCNMTLDeformerStack *)self newBufferForDataKind:self->_deformDataKind meshSource:SourceWithSemanticAtIndex dataType:9 forStageInputOutputDescriptor:0 usePrivateStorageMode:0 outStride:0];
    }
    else {
      uint64_t v21 = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * Size, 32);
    }
    self->_deformNormalBuffer = v21;
    int v22 = self->_finalDataKind;
    if (v22 == self->_deformDataKind)
    {
      unint64_t v23 = v21;
    }
    else
    {
      unint64_t v24 = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, v22);
      uint64_t v25 = C3DMeshSourceGetCount((uint64_t)v24);
      unint64_t v23 = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, v25 * Size, 32);
    }
    self->_finalNormalBuffer = v23;
    uint64_t v26 = [v15 count];
    [v15 addObject:self->_finalNormalBuffer];
    uint64_t v27 = objc_msgSend((id)objc_msgSend(v14, "attributes"), "objectAtIndexedSubscript:", 1);
    [v27 setFormat:30];
    [v27 setOffset:0];
    [v27 setBufferIndex:v26 + 18];
    long long v28 = objc_msgSend((id)objc_msgSend(v14, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v27, "bufferIndex"));
    [v28 setStride:Size];
    [v28 setStepFunction:1];
    unint64_t v29 = [v27 offset];
    unint64_t v30 = [v28 stride];
    self->_deformNormalStageInputOutputDescriptorInfo.isActive = 1;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeFormat = 30;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeOffset = v29;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferLayoutStride = v30;
  }
  if ((*(_DWORD *)&a3 & 0x10000) != 0)
  {
    uint64_t v31 = SCNMTLVertexFormatGetSize(31);
    uint64_t v32 = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, self->_deformDataKind);
    uint64_t v33 = C3DMeshSourceGetCount((uint64_t)v32);
    if ((*(_DWORD *)&a3 & 0x1000000) != 0) {
      uint64_t v34 = [(SCNMTLDeformerStack *)self newBufferForDataKind:self->_deformDataKind meshSource:v32 dataType:10 forStageInputOutputDescriptor:0 usePrivateStorageMode:0 outStride:0];
    }
    else {
      uint64_t v34 = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, v33 * v31, 32);
    }
    self->_deformTangentBuffer = v34;
    int v35 = self->_finalDataKind;
    if (v35 == self->_deformDataKind)
    {
      uint64_t v36 = v34;
    }
    else
    {
      uint64_t v37 = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, v35);
      uint64_t v38 = C3DMeshSourceGetCount((uint64_t)v37);
      uint64_t v36 = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, v38 * v31, 32);
    }
    self->_finalTangentBuffer = v36;
    uint64_t v39 = [v15 count];
    [v15 addObject:self->_finalTangentBuffer];
    unint64_t v40 = objc_msgSend((id)objc_msgSend(v14, "attributes"), "objectAtIndexedSubscript:", 2);
    [v40 setFormat:31];
    [v40 setOffset:0];
    [v40 setBufferIndex:v39 + 18];
    unint64_t v41 = objc_msgSend((id)objc_msgSend(v14, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v40, "bufferIndex"));
    [v41 setStride:v31];
    [v41 setStepFunction:1];
    unint64_t v42 = [v40 offset];
    unint64_t v43 = [v41 stride];
    self->_deformTangentStageInputOutputDescriptorInfo.isActive = 1;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeFormat = 31;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeOffset = v42;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferLayoutStride = v43;
  }
  Elementsuint64_t Count = C3DMeshGetElementsCount((uint64_t)self->_baseMesh);
  v45 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:ElementsCount];
  if ((uint64_t)ElementsCount >= 1)
  {
    for (CFIndex i = 0; (const __CFArray *)i != ElementsCount; ++i)
    {
      ElementAtIndex = C3DMeshGetElementAtIndex((uint64_t)self->_baseMesh, i, self->_finalDataKind);
      unsigned int Type = C3DMeshElementGetType((uint64_t)ElementAtIndex);
      if (C3DMeshElementTypeMapsToMTLPrimitiveType(Type))
      {
        objc_msgSend(v45, "addObject:", -[SCNMTLResourceManager renderResourceForMeshElement:]((uint64_t)self->_resourceManager, (uint64_t)ElementAtIndex));
      }
      else if (self->_finalDataKind | finalDataKind)
      {
        uint64_t v49 = scn_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT)) {
          [(SCNMTLDeformerStack *)v61 setupFinalMeshFromBaseMeshWithInfo:v49];
        }
      }
    }
  }
  int v50 = self->_finalDataKind;
  if (self->_deformDataKind != v50)
  {
    uint64_t v51 = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, v50);
    self->_splatUniforms.maxIndex = C3DMeshSourceGetCount((uint64_t)v51);
    uint64_t v58 = 0;
    [(SCNMTLDeformerStack *)self deindexedToOriginalTableBufferWithBlitEncoder:[(SCNMTLDeformerStack *)self currentBlitEncoder] indexSizeOut:&v58];
    int v57 = v58;
    uint64_t v52 = self->_deformTangentBuffer;
    BOOL v56 = self->_deformNormalBuffer != 0;
    BOOL v55 = v52 != 0;
    id v53 = objc_alloc_init(MEMORY[0x263F128B0]);
    [v53 setConstantValue:&v57 type:33 atIndex:0];
    [v53 setConstantValue:&v56 type:53 atIndex:1];
    [v53 setConstantValue:&v55 type:53 atIndex:2];
    self->_splatDeformedToFinalPipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:constants:constantsHash:](self->_resourceManager, "computePipelineStateForKernel:constants:constantsHash:", @"deformer_splat", v53, objc_msgSend(NSString, "stringWithFormat:", @"UInt%d-%d-%d", (8 * v57), v56, v55));
  }
  uint64_t v54 = objc_alloc_init(SCNMTLMesh);
  self->_finalMesh = v54;
  -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v54, v14);
  -[SCNMTLMesh setBuffers:](self->_finalMesh, (char *)v15);
  -[SCNMTLMesh setElements:](self->_finalMesh, (char *)v45);
}

void __58__SCNMTLDeformerStack_setupFinalMeshFromBaseMeshWithInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != 7 && (a3 == 3 || a4 <= 0) && (a3 != 3 || a4 <= 7))
  {
    if (C3DMeshSourceIsVolatile(a2))
    {
      v8 = scn_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __58__SCNMTLDeformerStack_setupFinalMeshFromBaseMeshWithInfo___block_invoke_cold_1();
      }
    }
    else if (a3 != 4 && a3 != 1)
    {
      if (a3)
      {
        if (!*(unsigned char *)(a1 + 56))
        {
          uint64_t v14 = -[SCNMTLResourceManager renderResourceForMeshSource:](*(void *)(*(void *)(a1 + 32) + 8), a2);
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = [*(id *)(a1 + 40) indexOfObject:v14];
            if (v16 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v16 = [*(id *)(a1 + 40) count];
              [*(id *)(a1 + 40) addObject:v15];
            }
            uint64_t v17 = *(void *)(a1 + 48);
            +[SCNMTLResourceManager _fillVertexDescriptor:v17 withMeshSource:a2 semantic:a3 inputSet:a4 bufferIndex:v16];
          }
        }
      }
      else
      {
        uint64_t Size = SCNMTLVertexFormatGetSize(30);
        uint64_t Count = C3DMeshSourceGetCount(a2);
        *(void *)(*(void *)(a1 + 32) + 120) = -[SCNMTLResourceManager newBufferWithLength:options:](*(void *)(*(void *)(a1 + 32) + 8), Count * Size, 32);
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = *(unsigned __int8 *)(v11 + 49);
        if (v12 == *(unsigned __int8 *)(v11 + 48))
        {
          id v13 = *(id *)(v11 + 120);
        }
        else
        {
          SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(*(void *)(v11 + 40), 0, 0, v12);
          uint64_t v19 = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
          id v13 = (id)-[SCNMTLResourceManager newBufferWithLength:options:](*(void *)(*(void *)(a1 + 32) + 8), v19 * Size, 32);
        }
        *(void *)(*(void *)(a1 + 32) + 88) = v13;
        uint64_t v20 = [*(id *)(a1 + 40) count];
        [*(id *)(a1 + 40) addObject:*(void *)(*(void *)(a1 + 32) + 120)];
        uint64_t v21 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "attributes"), "objectAtIndexedSubscript:", 0);
        [v21 setFormat:30];
        [v21 setOffset:0];
        [v21 setBufferIndex:v20 + 18];
        int v22 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v21, "bufferIndex"));
        [v22 setStride:Size];
        [v22 setStepFunction:1];
        uint64_t v23 = [v21 offset];
        uint64_t v24 = [v22 stride];
        uint64_t v25 = *(void *)(a1 + 32);
        *(unsigned char *)(v25 + 240) = 1;
        *(void *)(v25 + 248) = 30;
        *(void *)(v25 + 256) = v23;
        *(void *)(v25 + 264) = v24;
      }
    }
  }
}

- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(id)a3
{
  deformPositionBuffer = self->_deformPositionBuffer;
  if (deformPositionBuffer)
  {
    CFRelease(deformPositionBuffer);
    self->_deformPositionBuffer = 0;
  }
  deformNormalBuffer = self->_deformNormalBuffer;
  if (deformNormalBuffer)
  {
    CFRelease(deformNormalBuffer);
    self->_deformNormalBuffer = 0;
  }
  deformTangentBuffer = self->_deformTangentBuffer;
  if (deformTangentBuffer)
  {
    CFRelease(deformTangentBuffer);
    self->_deformTangentBuffer = 0;
  }
  finalMesh = self->_finalMesh;
  if (finalMesh)
  {
    CFRelease(finalMesh);
    self->_finalMesh = 0;
  }
  finalPositionBuffer = self->_finalPositionBuffer;
  if (finalPositionBuffer)
  {
    CFRelease(finalPositionBuffer);
    self->_finalPositionBuffer = 0;
  }
  finalNormalBuffer = self->_finalNormalBuffer;
  if (finalNormalBuffer)
  {
    CFRelease(finalNormalBuffer);
    self->_finalNormalBuffer = 0;
  }
  finalTangentBuffer = self->_finalTangentBuffer;
  if (finalTangentBuffer)
  {
    CFRelease(finalTangentBuffer);
    self->_finalTangentBuffer = 0;
  }
  if (!self->_meshlessDeformer)
  {
    int v12 = scn_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLDeformerStack setupFinalMeshFromMeshlessBaseGeometryWithInfo:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  self->_finalMesh = (SCNMTLMesh *)(id)[(SCNMTLMeshlessDeformer *)self->_meshlessDeformer finalMesh];
  uint64_t Size = SCNMTLVertexFormatGetSize(30);
  uint64_t v21 = (void *)-[SCNMTLResourceManager commandQueue]((uint64_t)self->_finalMesh);
  int v22 = objc_msgSend((id)objc_msgSend(v21, "attributes"), "objectAtIndexedSubscript:", 0);
  uint64_t v23 = objc_msgSend((id)objc_msgSend(v21, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v22, "bufferIndex"));
  PositionSourceForDeformerBasedDynamicMesh = (const void *)C3DGeometryCreatePositionSourceForDeformerBasedDynamicMesh((uint64_t)self->_baseGeometry);
  uint64_t Count = C3DMeshSourceGetCount((uint64_t)PositionSourceForDeformerBasedDynamicMesh);
  self->_deformPositionBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)self->_resourceManager, Count * Size, 32);
  CFRelease(PositionSourceForDeformerBasedDynamicMesh);
  if (a3.var0 && (uint64_t v26 = scn_default_log(), os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)))
  {
    -[SCNMTLDeformerStack setupFinalMeshFromMeshlessBaseGeometryWithInfo:](v26, v27, v28, v29, v30, v31, v32, v33);
    if ((*(_DWORD *)&a3 & 0x10000) == 0) {
      goto LABEL_23;
    }
  }
  else if ((*(_DWORD *)&a3 & 0x10000) == 0)
  {
    goto LABEL_23;
  }
  uint64_t v34 = scn_default_log();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
    -[SCNMTLDeformerStack setupFinalMeshFromMeshlessBaseGeometryWithInfo:](v34, v35, v36, v37, v38, v39, v40, v41);
  }
LABEL_23:
  unint64_t v42 = [v22 offset];
  unint64_t v43 = [v23 stride];
  self->_deformPositionStageInputOutputDescriptorInfo.isActive = 1;
  self->_deformPositionStageInputOutputDescriptorInfo.bufferAttributeFormat = 30;
  self->_deformPositionStageInputOutputDescriptorInfo.bufferAttributeOffset = v42;
  self->_deformPositionStageInputOutputDescriptorInfo.bufferLayoutStride = v43;
}

- (id)deindexedToOriginalTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  *(void *)&v29[5] = *MEMORY[0x263EF8340];
  if (!self->_deindexedToOriginalTableBuffer)
  {
    C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 1);
    unsigned int v27 = 0;
    uint64_t PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable((uint64_t)self->_baseMesh, &v27);
    id result = (id)C3DMeshGetPositionOriginalToFirstDeindexedTable((uint64_t)self->_baseMesh);
    if (!result) {
      return result;
    }
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 0);
    unsigned int Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    uint64_t v11 = v27;
    unsigned int v12 = v27 - 1;
    id v26 = a3;
    if ((int)(v27 - 1) < 0)
    {
      unint64_t v15 = 8;
    }
    else
    {
      unsigned int v13 = v12 >> 15;
      BOOL v14 = v12 > 0x7F;
      unint64_t v15 = 1;
      if (v14) {
        unint64_t v15 = 2;
      }
      if (v13) {
        unint64_t v15 = 4;
      }
    }
    self->_deindexedToOriginalTableBufferIndexuint64_t Size = v15;
    *a4 = v15;
    unint64_t v25 = self->_deindexedToOriginalTableBufferIndexSize * v11;
    uint64_t v16 = malloc_type_malloc(v25, 0x60081C04uLL);
    uint64_t v17 = v16;
    deindexedToOriginalTableBufferIndexuint64_t Size = self->_deindexedToOriginalTableBufferIndexSize;
    if (deindexedToOriginalTableBufferIndexSize == 1) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = 0;
    }
    if (deindexedToOriginalTableBufferIndexSize == 2) {
      uint64_t v20 = v16;
    }
    else {
      uint64_t v20 = 0;
    }
    if (deindexedToOriginalTableBufferIndexSize == 4) {
      uint64_t v21 = v16;
    }
    else {
      uint64_t v21 = 0;
    }
    if (!v27)
    {
LABEL_31:
      self->_deindexedToOriginalTableBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v17, v25, v26);
      free(v17);
      return self->_deindexedToOriginalTableBuffer;
    }
    uint64_t v22 = 0;
    while (1)
    {
      unsigned int v23 = *(_DWORD *)(PositionDeindexedToOriginalTable + 4 * v22);
      if (v23 >= Count && (uint64_t v24 = scn_default_log(), os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)))
      {
        -[SCNMTLDeformerStack deindexedToOriginalTableBufferWithBlitEncoder:indexSizeOut:](v28, v29, v24);
        if (!v19)
        {
LABEL_27:
          if (v20) {
            v20[v22] = v23;
          }
          else {
            v21[v22] = v23;
          }
          goto LABEL_30;
        }
      }
      else if (!v19)
      {
        goto LABEL_27;
      }
      v19[v22] = v23;
LABEL_30:
      if (++v22 >= (unint64_t)v27) {
        goto LABEL_31;
      }
    }
  }
  *a4 = self->_deindexedToOriginalTableBufferIndexSize;
  return self->_deindexedToOriginalTableBuffer;
}

- (id)deindexedToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  *(void *)&v35[5] = *MEMORY[0x263EF8340];
  if (self->_deindexedToFirstDeindexedTableBuffer)
  {
    *a4 = self->_deindexedToFirstDeindexedTableBufferIndexSize;
  }
  else
  {
    C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 1);
    unsigned int v31 = 0;
    uint64_t PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable((uint64_t)self->_baseMesh, &v31);
    id result = (id)C3DMeshGetPositionOriginalToFirstDeindexedTable((uint64_t)self->_baseMesh);
    if (!result) {
      return result;
    }
    v9 = (unsigned int *)result;
    id v29 = a3;
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 0);
    unsigned int Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    uint64_t v12 = v31;
    unsigned int v13 = v31 - 1;
    if ((int)(v31 - 1) < 0)
    {
      unint64_t v16 = 8;
    }
    else
    {
      unsigned int v14 = v13 >> 15;
      BOOL v15 = v13 > 0x7F;
      unint64_t v16 = 1;
      if (v15) {
        unint64_t v16 = 2;
      }
      if (v14) {
        unint64_t v16 = 4;
      }
    }
    self->_deindexedToFirstDeindexedTableBufferIndexuint64_t Size = v16;
    *a4 = v16;
    unint64_t v28 = self->_deindexedToFirstDeindexedTableBufferIndexSize * v12;
    uint64_t v17 = malloc_type_malloc(v28, 0x32BD003uLL);
    uint64_t v18 = v17;
    deindexedToFirstDeindexedTableBufferIndexuint64_t Size = self->_deindexedToFirstDeindexedTableBufferIndexSize;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 1) {
      uint64_t v20 = v17;
    }
    else {
      uint64_t v20 = 0;
    }
    if (deindexedToFirstDeindexedTableBufferIndexSize == 2) {
      uint64_t v21 = v17;
    }
    else {
      uint64_t v21 = 0;
    }
    if (deindexedToFirstDeindexedTableBufferIndexSize == 4) {
      uint64_t v22 = v17;
    }
    else {
      uint64_t v22 = 0;
    }
    uint64_t v30 = v22;
    if (v31)
    {
      for (unint64_t i = 0; i < v31; ++i)
      {
        uint64_t v24 = *(unsigned int *)(PositionDeindexedToOriginalTable + 4 * i);
        uint64_t v25 = v9[v24];
        if (v24 >= Count)
        {
          id v26 = scn_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[SCNMTLDeformerStack deindexedToOriginalTableBufferWithBlitEncoder:indexSizeOut:](v34, v35, v26);
          }
        }
        if (v25 >= v31)
        {
          unsigned int v27 = scn_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
            -[SCNMTLDeformerStack deindexedToFirstDeindexedTableBufferWithBlitEncoder:indexSizeOut:](v32, &v33, v27);
          }
        }
        if (i == v25)
        {
          if (v20)
          {
            v20[i] = -1;
          }
          else if (v21)
          {
            v21[i] = -1;
          }
          else
          {
            v30[i] = -1;
          }
        }
        else if (v20)
        {
          v20[i] = v25;
        }
        else if (v21)
        {
          v21[i] = v25;
        }
        else
        {
          v30[i] = v25;
        }
      }
    }
    self->_deindexedToFirstDeindexedTableBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v18, v28, v29);
    free(v18);
  }
  return self->_deindexedToFirstDeindexedTableBuffer;
}

- (id)originalToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  if (self->_originalToFirstDeindexedTableBuffer)
  {
    *a4 = self->_originalToFirstDeindexedTableBufferIndexSize;
  }
  else
  {
    C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 1);
    id result = (id)C3DMeshGetPositionOriginalToFirstDeindexedTable((uint64_t)self->_baseMesh);
    if (!result) {
      return result;
    }
    v8 = (int *)result;
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)self->_baseMesh, 0, 0, 0);
    unsigned int Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    unsigned int v11 = Count;
    uint64_t v12 = 1;
    if (Count - 1 > 0xFF) {
      uint64_t v12 = 2;
    }
    unint64_t v13 = 4;
    if (!((Count - 1) >> 16)) {
      unint64_t v13 = v12;
    }
    self->_originalToFirstDeindexedTableBufferIndexuint64_t Size = v13;
    *a4 = v13;
    uint64_t v14 = Count;
    unint64_t v15 = self->_originalToFirstDeindexedTableBufferIndexSize * Count;
    unint64_t v16 = malloc_type_malloc(v15, 0x3B750010uLL);
    uint64_t v17 = v16;
    originalToFirstDeindexedTableBufferIndexuint64_t Size = self->_originalToFirstDeindexedTableBufferIndexSize;
    if (originalToFirstDeindexedTableBufferIndexSize == 1) {
      uint64_t v19 = v16;
    }
    else {
      uint64_t v19 = 0;
    }
    if (originalToFirstDeindexedTableBufferIndexSize == 2) {
      uint64_t v20 = v16;
    }
    else {
      uint64_t v20 = 0;
    }
    if (originalToFirstDeindexedTableBufferIndexSize == 4) {
      uint64_t v21 = v16;
    }
    else {
      uint64_t v21 = 0;
    }
    if (v11)
    {
      uint64_t v22 = v20;
      unsigned int v23 = v19;
      do
      {
        int v25 = *v8++;
        int v24 = v25;
        if (v19)
        {
          *unsigned int v23 = v24;
        }
        else if (v20)
        {
          _WORD *v22 = v24;
        }
        else
        {
          *uint64_t v21 = v24;
        }
        ++v23;
        ++v22;
        ++v21;
        --v14;
      }
      while (v14);
    }
    self->_originalToFirstDeindexedTableBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v16, v15, a3);
    free(v17);
  }
  return self->_originalToFirstDeindexedTableBuffer;
}

- (id)newBufferForDataKind:(unsigned __int8)a3 meshSource:(__C3DMeshSource *)a4 dataType:(signed __int16)a5 forStageInputOutputDescriptor:(BOOL)a6 usePrivateStorageMode:(BOOL)a7 outStride:(unint64_t *)a8
{
  BOOL v8 = a6;
  int v9 = a5;
  uint64_t Count = C3DMeshSourceGetCount((uint64_t)a4);
  unint64_t v13 = C3DSizeOfBaseType(v9);
  if (v8)
  {
    uint64_t v14 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager);
    if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v14)) {
      unint64_t v13 = (v13 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
  }
  uint64_t v33 = (uint64_t *)self;
  uint64_t v15 = v13 * Count;
  unint64_t v16 = malloc_type_malloc(v13 * Count, 0xCD953168uLL);
  uint64_t Content = C3DMeshSourceGetContent((uint64_t)a4);
  if (Count)
  {
    uint64_t v23 = Content;
    unsigned int v24 = 0;
    int v25 = v18;
    int v26 = v19;
    uint64_t v27 = (uint64_t)v16;
    do
    {
      *(double *)v28.i64 = C3DConvertFloatingTypeToFloat4(v25, (float *)(v23 + v24), v20, v21, v22);
      C3DConvertFloatingTypeFromFloat4(v9, v27, v28);
      v27 += v13;
      v24 += v26;
      --Count;
    }
    while (Count);
  }
  if (a7) {
    uint64_t v29 = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](v33[1], (uint64_t)v16, v15, (void *)[v33 currentBlitEncoder]);
  }
  else {
    uint64_t v29 = -[SCNMTLResourceManager newBufferWithBytes:length:options:](v33[1], (uint64_t)v16, v15, 0);
  }
  uint64_t v30 = (void *)v29;
  free(v16);
  if (a8) {
    *a8 = v13;
  }
  return v30;
}

- (id)newBufferForDataKind:(unsigned __int8)a3 positionSource:(__C3DMeshSource *)a4 normalSource:(__C3DMeshSource *)a5 positionDataType:(signed __int16)a6 normalDataType:(signed __int16)a7 forStageInputOutputDescriptor:(BOOL)a8 usePrivateStorageMode:(BOOL)a9 outStride:(unint64_t *)a10 outPositionOffset:(unint64_t *)a11 outNormalOffset:(unint64_t *)a12
{
  BOOL v12 = a8;
  int v51 = a7;
  int v53 = a6;
  if (a3 == 1 && a5 && (uint64_t v16 = C3DMeshSourceGetCount((uint64_t)a4), v16 != C3DMeshSourceGetCount((uint64_t)a5)))
  {
    uint64_t v44 = scn_default_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLDeformerStack newBufferForDataKind:positionSource:normalSource:positionDataType:normalDataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:outPositionOffset:outNormalOffset:]();
    }
    return 0;
  }
  else
  {
    uint64_t Count = C3DMeshSourceGetCount((uint64_t)a4);
    unint64_t v18 = C3DSizeOfBaseType(v53);
    uint64_t v19 = C3DSizeOfBaseType(v51);
    unint64_t v20 = v19 + v18;
    if (v12)
    {
      uint64_t v21 = v19;
      float v22 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager);
      int v23 = SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v22);
      unint64_t v24 = (v18 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (v23)
      {
        unint64_t v18 = (v18 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        unint64_t v20 = (v21 + v24 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      }
    }
    uint64_t v46 = v20 * Count;
    v48 = malloc_type_malloc(v20 * Count, 0xBB0C6F77uLL);
    uint64_t Content = C3DMeshSourceGetContent((uint64_t)a4);
    __int16 v30 = v29;
    unint64_t v50 = v18;
    uint64_t v47 = (uint64_t *)self;
    unint64_t v52 = v20;
    if (a5)
    {
      unsigned int v31 = a5;
      uint64_t v49 = C3DMeshSourceGetContent((uint64_t)a5);
    }
    else
    {
      unsigned int v31 = 0;
      uint64_t v49 = 0;
      __int16 v32 = 0;
    }
    if (Count)
    {
      unsigned int v33 = 0;
      unsigned int v34 = 0;
      int v35 = v30;
      int v36 = HIBYTE(v30);
      int v37 = v32;
      uint64_t v38 = (uint64_t)v48;
      int v39 = HIBYTE(v32);
      do
      {
        *(double *)v40.i64 = C3DConvertFloatingTypeToFloat4(v35, (float *)(Content + v33), v26, v27, v28);
        C3DConvertFloatingTypeFromFloat4(v53, v38, v40);
        if (v31)
        {
          *(double *)v41.i64 = C3DConvertFloatingTypeToFloat4(v37, (float *)(v49 + v34), v26, v27, v28);
          C3DConvertFloatingTypeFromFloat4(v51, v38 + v50, v41);
        }
        v38 += v52;
        v34 += v39;
        v33 += v36;
        --Count;
      }
      while (Count);
    }
    if (a9) {
      uint64_t v42 = -[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:](v47[1], (uint64_t)v48, v46, (void *)[v47 currentBlitEncoder]);
    }
    else {
      uint64_t v42 = -[SCNMTLResourceManager newBufferWithBytes:length:options:](v47[1], (uint64_t)v48, v46, 0);
    }
    unint64_t v43 = (void *)v42;
    free(v48);
    if (a10) {
      *a10 = v52;
    }
    if (a11) {
      *a11 = 0;
    }
    if (a12) {
      *a12 = v50;
    }
  }
  return v43;
}

- (MTLBlitCommandEncoder)currentBlitEncoder
{
  id result = self->_currentInitResourceBlitEncoder;
  if (!result)
  {
    id result = *(MTLBlitCommandEncoder **)-[SCNMTLRenderContext resourceBlitEncoder]((uint64_t)self->_currentInitRenderContext);
    self->_currentInitResourceBlitEncoder = result;
  }
  return result;
}

- (MTLStageInputOutputDescriptor)stageInputDescriptor
{
  return self->_initialBuffersStageInputDescriptor;
}

- (uint64_t)invalidate
{
  if (result) {
    *(unsigned char *)(result + 50) = 0;
  }
  return result;
}

- (void)reconfigureIfNeededWithContext:(id)a3 programHashCodeRequirements:(id)a4
{
  int v4 = *(_DWORD *)&a4.var0;
  uint64_t v212 = *MEMORY[0x263EF8340];
  if (self->_isValid && (!a4.var0 || self->_finalTangentBuffer)) {
    return;
  }
  self->_currentInitRenderContext = (SCNMTLRenderContext *)a3;
  BaseGeometry = (__C3DGeometry *)C3DDeformerStackGetBaseGeometry((uint64_t)self->_c3dDeformerStack);
  uint64_t v7 = (uint64_t)BaseGeometry;
  v139 = self->_baseGeometry;
  if (v139 != BaseGeometry) {
    self->_baseGeometry = BaseGeometry;
  }
  BOOL v8 = C3DGeometryUsesDeformerBasedDynamicMesh((uint64_t)BaseGeometry);
  if (v8)
  {
    int v9 = [(SCNMTLDeformerStack *)self deformerClassForMeshlesshGeometry:v7];
    LODWORD(v131) = [(objc_class *)v9 deformsControlPointsForMeshlessGeometry:v7];
    Mesh = 0;
  }
  else
  {
    LODWORD(v131) = [0 deformsControlPointsForMeshlessGeometry:v7];
    Mesh = (__C3DMesh *)C3DGeometryGetMesh(v7);
    int v9 = 0;
  }
  baseMesh = self->_baseMesh;
  if (baseMesh != Mesh) {
    self->_baseMesh = Mesh;
  }
  int finalDataKind = self->_finalDataKind;
  uint64_t Morpher = C3DDeformerStackGetMorpher((uint64_t)self->_c3dDeformerStack);
  uint64_t Skinner = C3DDeformerStackGetSkinner((uint64_t)self->_c3dDeformerStack);
  uint64_t v147 = v7;
  v142 = (const void *)Skinner;
  if (Skinner)
  {
    uint64_t v14 = Skinner;
    uint64_t v15 = (__C3DGeometry *)C3DDeformerStackGetBaseGeometry((uint64_t)self->_c3dDeformerStack);
    BOOL v155 = C3DSkinnerGetEffectiveCalculationMode(v14, v15) == 2;
  }
  else
  {
    BOOL v155 = 0;
  }
  PostMorphingDeformers = (void *)C3DDeformerStackGetPostMorphingDeformers((uint64_t)self->_c3dDeformerStack);
  PostSkinningDeformers = (void *)C3DDeformerStackGetPostSkinningDeformers((uint64_t)self->_c3dDeformerStack);
  uint64_t v143 = [PostMorphingDeformers count];
  obuint64_t j = PostSkinningDeformers;
  uint64_t v140 = [PostSkinningDeformers count];
  BOOL v137 = Morpher == 0;
  if (Morpher) {
    unint64_t v18 = +[SCNMTLMorphDeformer requiredInputs];
  }
  else {
    unint64_t v18 = 0;
  }
  if (v155) {
    v18 |= +[SCNMTLSkinDeformer requiredInputs];
  }
  BOOL v145 = v8;
  v150 = v9;
  if (v9) {
    v18 |= [(objc_class *)v9 requiredInputs];
  }
  v152 = self;
  long long v202 = 0u;
  long long v201 = 0u;
  long long v200 = 0u;
  long long v199 = 0u;
  uint64_t v19 = objc_msgSend(PostMorphingDeformers, "countByEnumeratingWithState:objects:count:", &v199, v211, 16, v131);
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v200;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v200 != v21) {
          objc_enumerationMutation(PostMorphingDeformers);
        }
        v18 |= [*(id *)(*((void *)&v199 + 1) + 8 * i) requiredInputs];
      }
      uint64_t v20 = [PostMorphingDeformers countByEnumeratingWithState:&v199 objects:v211 count:16];
    }
    while (v20);
  }
  long long v198 = 0u;
  long long v197 = 0u;
  long long v196 = 0u;
  long long v195 = 0u;
  uint64_t v23 = [obj countByEnumeratingWithState:&v195 objects:v210 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v196;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v196 != v25) {
          objc_enumerationMutation(obj);
        }
        LODWORD(v18) = [*(id *)(*((void *)&v195 + 1) + 8 * j) requiredInputs] | v18;
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v195 objects:v210 count:16];
    }
    while (v24);
  }
  if (Mesh)
  {
    float v27 = v152;
    unsigned int v151 = (C3DMeshHasSourcesWithSemantic((uint64_t)Mesh, 1, 0, 0) | (v18 >> 1)) & (finalDataKind != 0);
    int v134 = (v152->_finalNormalBuffer == 0) ^ v151;
    BOOL HasSourcesWithSemantic = C3DMeshHasSourcesWithSemantic((uint64_t)Mesh, 4, 0, 0);
  }
  else
  {
    BOOL HasSourcesWithSemantic = 0;
    float v27 = v152;
    unsigned int v151 = (finalDataKind != 0) & (v18 >> 1);
    int v134 = (v152->_finalNormalBuffer == 0) ^ v151;
  }
  BOOL v29 = finalDataKind != 0;
  finalTangentBuffer = v27->_finalTangentBuffer;
  v154 = (const void *)Morpher;
  if (Morpher)
  {
    unint64_t v30 = +[SCNMTLMorphDeformer supportedOutputsForMorpher:]((uint64_t)SCNMTLMorphDeformer, Morpher);
    char v31 = v30;
  }
  else
  {
    unint64_t v30 = 0;
    char v31 = -1;
  }
  if (v155)
  {
    unint64_t v32 = +[SCNMTLSkinDeformer supportedOutputs];
    v30 |= v32;
    v31 &= v32;
  }
  if (v150)
  {
    uint64_t v33 = [(objc_class *)v150 supportedOutputs];
    v30 |= v33;
    v31 &= v33;
  }
  long long v194 = 0u;
  long long v193 = 0u;
  unsigned int v34 = v4 | HasSourcesWithSemantic | (v18 >> 2);
  long long v192 = 0u;
  long long v191 = 0u;
  uint64_t v35 = [PostMorphingDeformers countByEnumeratingWithState:&v191 objects:v209 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v192;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v192 != v37) {
          objc_enumerationMutation(PostMorphingDeformers);
        }
        uint64_t v39 = [*(id *)(*((void *)&v191 + 1) + 8 * k) supportedOutputs];
        v30 |= v39;
        v31 &= v39;
      }
      uint64_t v36 = [PostMorphingDeformers countByEnumeratingWithState:&v191 objects:v209 count:16];
    }
    while (v36);
  }
  int v153 = v34 & v29;
  long long v190 = 0u;
  long long v189 = 0u;
  long long v188 = 0u;
  long long v187 = 0u;
  uint64_t v40 = [obj countByEnumeratingWithState:&v187 objects:v208 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v188;
    unint64_t v43 = v150;
    do
    {
      for (uint64_t m = 0; m != v41; ++m)
      {
        if (*(void *)v188 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = [*(id *)(*((void *)&v187 + 1) + 8 * m) supportedOutputs];
        v30 |= v45;
        v31 &= v45;
      }
      uint64_t v41 = [obj countByEnumeratingWithState:&v187 objects:v208 count:16];
    }
    while (v41);
  }
  else
  {
    unint64_t v43 = v150;
  }
  uint64_t v46 = 3;
  if ((v151 & ((v31 & 2) == 0)) != 0) {
    uint64_t v46 = 1;
  }
  if (!v151) {
    uint64_t v46 = 1;
  }
  if (v153) {
    uint64_t v47 = v46 | 4;
  }
  else {
    uint64_t v47 = v46;
  }
  if (v154)
  {
    unint64_t v48 = +[SCNMTLMorphDeformer requiredOutputs];
    v47 |= v48;
    uint64_t v49 = (v48 >> 9) & 1;
  }
  else
  {
    LODWORD(v49) = 0;
  }
  if (v155)
  {
    unint64_t v50 = +[SCNMTLSkinDeformer requiredOutputs];
    v47 |= v50;
    int v51 = (v50 >> 9) & 1 | v49;
    if ((v50 & 0x200) == 0)
    {
      char v52 = v49 ^ 1;
      int v53 = v152;
      if ((v52 & 1) == 0) {
        -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:].cold.5();
      }
      goto LABEL_77;
    }
  }
  else
  {
    int v51 = v49;
  }
  int v53 = v152;
LABEL_77:
  v149 = Mesh;
  int v148 = v151 & ((v31 & 2) == 0);
  if (v43)
  {
    unint64_t v54 = [(objc_class *)v43 requiredOutputs];
    v47 |= v54;
    int v55 = (v54 >> 9) & 1 | v51;
    if ((v54 & 0x200) == 0 && ((v51 ^ 1) & 1) == 0) {
      -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:].cold.4();
    }
  }
  else
  {
    int v55 = v51;
  }
  long long v186 = 0u;
  long long v185 = 0u;
  long long v184 = 0u;
  long long v183 = 0u;
  uint64_t v56 = [PostMorphingDeformers countByEnumeratingWithState:&v183 objects:v207 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v184;
    do
    {
      for (uint64_t n = 0; n != v57; ++n)
      {
        if (*(void *)v184 != v58) {
          objc_enumerationMutation(PostMorphingDeformers);
        }
        unint64_t v60 = [*(id *)(*((void *)&v183 + 1) + 8 * n) requiredOutputs];
        if ((v60 & 0x200) == 0 && ((v55 ^ 1) & 1) == 0) {
          -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]();
        }
        v55 |= (v60 >> 9) & 1;
        v47 |= v60;
      }
      uint64_t v57 = [PostMorphingDeformers countByEnumeratingWithState:&v183 objects:v207 count:16];
    }
    while (v57);
  }
  long long v182 = 0u;
  long long v181 = 0u;
  long long v180 = 0u;
  long long v179 = 0u;
  uint64_t v61 = [obj countByEnumeratingWithState:&v179 objects:v206 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v180;
    do
    {
      for (iuint64_t i = 0; ii != v62; ++ii)
      {
        if (*(void *)v180 != v63) {
          objc_enumerationMutation(obj);
        }
        unint64_t v65 = [*(id *)(*((void *)&v179 + 1) + 8 * ii) requiredOutputs];
        if ((v65 & 0x200) == 0 && ((v55 ^ 1) & 1) == 0) {
          -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]();
        }
        v55 |= (v65 >> 9) & 1;
        v47 |= v65;
      }
      uint64_t v62 = [obj countByEnumeratingWithState:&v179 objects:v206 count:16];
    }
    while (v62);
  }
  BOOL v133 = v53->_smoothNormalsDeformer == 0;
  long long v175 = 0u;
  long long v176 = 0u;
  long long v177 = 0u;
  long long v178 = 0u;
  v66 = (void *)-[SCNMTLMesh elements]((uint64_t)v53->_finalMesh);
  uint64_t v67 = [v66 countByEnumeratingWithState:&v175 objects:v205 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    int v69 = 0;
    uint64_t v70 = *(void *)v176;
    do
    {
      for (juint64_t j = 0; jj != v68; ++jj)
      {
        if (*(void *)v176 != v70) {
          objc_enumerationMutation(v66);
        }
        v69 |= v55 ^ (-[SCNMTLMesh buffers](*(void *)(*((void *)&v175 + 1) + 8 * jj)) != 0);
      }
      uint64_t v68 = [v66 countByEnumeratingWithState:&v175 objects:v205 count:16];
    }
    while (v68);
  }
  else
  {
    int v69 = 0;
  }
  if (v155)
  {
    unsigned int v72 = 1;
  }
  else
  {
    unsigned int v72 = v132;
    if (v140 + v143) {
      unsigned int v72 = 1;
    }
  }
  int v73 = v137;
  int v74 = v134;
  uint64_t v75 = 0;
  LODWORD(v76) = v137;
  if (v151 != (v151 & ((v31 & 2) == 0)) && (v31 & 2) == 0)
  {
    uint64_t v76 = (v30 >> 1) & 1;
    if (!v154) {
      LODWORD(v76) = 1;
    }
    uint64_t v75 = ((v30 & 2) << 7) ^ 0x100;
  }
  uint64_t morphDeformer = (uint64_t)v152->_morphDeformer;
  int v78 = v153;
  if ((v31 & 4) != 0) {
    int v78 = 0;
  }
  uint64_t v141 = v140 + v143;
  uint64_t v138 = v75;
  if (v78 == 1)
  {
    v79 = v154;
    if (v154) {
      int v73 = (v30 >> 2) & 1;
    }
    else {
      int v73 = 1;
    }
    uint64_t v135 = ((v30 & 4) << 22) ^ 0x1000000;
  }
  else
  {
    uint64_t v135 = 0;
    v79 = v154;
  }
  int v80 = v148 ^ v133;
  int v81 = v74 ^ 1;
  int v82 = v72 ^ (v152->_initialBuffersStageInputDescriptor != 0);
  int v83 = (v79 == 0) ^ (morphDeformer == 0);
  if (baseMesh != v149
    || !v152->_initialPositionBuffer
    || (v81 & 1) != 0
    || (((finalTangentBuffer != 0) ^ v153) & 1) != 0
    || (v82 & 1) != 0
    || v83)
  {
    v173[0] = MEMORY[0x263EF8330];
    v173[1] = 3221225472;
    v173[2] = __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke;
    v173[3] = &__block_descriptor_49_e192_____C3DMeshSource____C3DGenericSource____C3DEntity____CFRuntimeBase_QAQ__v____CFString_____CFString_____CFDictionary_____C3DScene_q_____C3DSourceAccessor________CFData__v_v_qb1b1b1_SCC_12__0C8l;
    BOOL v174 = v145;
    v173[4] = v147;
    v173[5] = v149;
    v171[0] = MEMORY[0x263EF8330];
    v171[1] = 3221225472;
    v171[2] = __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_2;
    v171[3] = &unk_264005D48;
    BOOL v172 = v145;
    v171[5] = v149;
    v171[4] = v152;
    v169[0] = MEMORY[0x263EF8330];
    v169[1] = 3221225472;
    v169[2] = __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_28;
    v169[3] = &unk_264005D48;
    BOOL v170 = v145;
    v169[5] = v149;
    v169[4] = v152;
    uint64_t v84 = 0x10000000000;
    if (!v73) {
      uint64_t v84 = 0;
    }
    uint64_t v85 = 0x100000000;
    if ((v153 & v72) == 0) {
      uint64_t v85 = 0;
    }
    BOOL v86 = v76 == 0;
    uint64_t v87 = 0x1000000;
    if (v86) {
      uint64_t v87 = 0;
    }
    uint64_t v88 = 0x10000;
    if ((v151 & v72) == 0) {
      uint64_t v88 = 0;
    }
    [(SCNMTLDeformerStack *)v152 setupInitialBuffersWithBasePositionSourceProvider:v173 baseNormalSourceProvider:v171 baseTangentSourceProvider:v169 info:v72 | ((unint64_t)(v154 == 0) << 8) | v85 | v88 | v87 | v84];
    uint64_t morphDeformer = (uint64_t)v152->_morphDeformer;
  }
  int v144 = v81;
  if ((const void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](morphDeformer) == v154) {
    char v89 = v81;
  }
  else {
    char v89 = 1;
  }
  int v90 = (finalTangentBuffer != 0) ^ v153;
  int v91 = v80 ^ 1;
  if ((v89 | ((finalTangentBuffer != 0) ^ v153)) & 1) != 0 || (v91)
  {
    v95 = v152->_morphDeformer;
    if (v95)
    {
      CFRelease(v95);
      v152->_uint64_t morphDeformer = 0;
    }
    BOOL v93 = v145;
    v94 = v139;
    if (v154) {
      v152->_uint64_t morphDeformer = (SCNMTLMorphDeformer *)-[SCNMTLMorphDeformer initWithMorpher:outputs:dataKind:resourceManager:computeContext:]([SCNMTLMorphDeformer alloc], v154, v47, v152->_deformDataKind, (uint64_t)v152->_resourceManager, (uint64_t)v152);
    }
  }
  else
  {
    int v92 = v82 | v83;
    BOOL v93 = v145;
    v94 = v139;
    if (v92 == 1) {
      -[SCNMTLMorphDeformer setNextFrameRequiresFullMeshReset]((uint64_t)v152->_morphDeformer);
    }
  }
  uint64_t v96 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v152->_skinDeformer);
  int v97 = v144;
  if ((const void *)v96 != v142) {
    int v97 = 1;
  }
  if ((v97 | v90 | v91))
  {
    skinDeformer = v152->_skinDeformer;
    if (skinDeformer)
    {
      CFRelease(skinDeformer);
      v152->_skinDeformer = 0;
    }
    if (v155) {
      v152->_skinDeformer = (SCNMTLSkinDeformer *)-[SCNMTLSkinDeformer initWithSkinner:baseGeometry:outputs:dataKind:resourceManager:computeContext:]([SCNMTLSkinDeformer alloc], v142, v147, v47, v152->_deformDataKind, (uint64_t)v152->_resourceManager, (uint64_t)v152);
    }
  }
  int v99 = v94 != (__C3DGeometry *)v147 && v93;

  if (v99 == 1) {
    uint64_t v100 = [[(objc_class *)v150 alloc] initWithMeshlessGeometry:v152->_baseGeometry outputs:v47 deformDataKind:v152->_deformDataKind finalDataKind:v152->_finalDataKind resourceManager:v152->_resourceManager computeContext:v152];
  }
  else {
    uint64_t v100 = 0;
  }
  v152->_meshlessDeformer = (SCNMTLMeshlessDeformer *)v100;

  if (v80 & 1 | ((v148 & 1) == 0)) {
    v101 = 0;
  }
  else {
    v101 = (SCNMTLSmoothNormalsDeformer *)-[SCNMTLSmoothNormalsDeformer initWithMesh:dataKind:resourceManager:computeContext:]([SCNMTLSmoothNormalsDeformer alloc], (uint64_t)v152->_baseMesh, v152->_finalDataKind, v152->_resourceManager, v152);
  }
  v152->_smoothNormalsDeformer = v101;
  if (!v152->_finalMesh || (baseMesh != v149 ? (int v102 = 1) : (int v102 = v99), ((v102 | v144 | v90 | v69) & 1) != 0))
  {
    uint64_t v103 = 0x10000;
    if (!v153) {
      uint64_t v103 = 0;
    }
    uint64_t v104 = v103 | v151 | v138 | v135;
    if (v93) {
      [(SCNMTLDeformerStack *)v152 setupFinalMeshFromMeshlessBaseGeometryWithInfo:v104];
    }
    else {
      [(SCNMTLDeformerStack *)v152 setupFinalMeshFromBaseMeshWithInfo:v104];
    }
  }

  v152->_postMorphingDeformerInstances = 0;
  v152->_postSkinningDeformerInstances = 0;
  if (!v152->_finalMesh) {
    -[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]();
  }
  p_currentInitRenderContext = &v152->_currentInitRenderContext;
  long long v106 = *(_OWORD *)&v152->_deformPositionStageInputOutputDescriptorInfo.bufferAttributeOffset;
  __src[0] = *(_OWORD *)&v152->_deformPositionStageInputOutputDescriptorInfo.isActive;
  __src[1] = v106;
  __src[2] = __src[0];
  __src[3] = v106;
  long long v107 = *(_OWORD *)&v152->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeOffset;
  __src[4] = *(_OWORD *)&v152->_deformNormalStageInputOutputDescriptorInfo.isActive;
  __src[5] = v107;
  __src[7] = v107;
  __src[6] = __src[4];
  long long v108 = *(_OWORD *)&v152->_deformTangentStageInputOutputDescriptorInfo.isActive;
  __src[9] = *(_OWORD *)&v152->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeOffset;
  __src[8] = v108;
  __src[11] = __src[9];
  __src[10] = v108;
  memset(&__src[12], 0, 192);
  if (v141)
  {
    ObjCWrapper = C3DEntityGetObjCWrapper((id *)v152->_node);
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex((uint64_t)v152->_baseMesh, 0, 0, v152->_deformDataKind);
    uint64_t Count = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
    uint64_t v111 = (uint64_t)ObjCWrapper;
    v112 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:258 valueOptions:0 capacity:v141];
    if ([PostMorphingDeformers count])
    {
      v152->_postMorphingDeformerInstances = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(PostMorphingDeformers, "count"));
      long long v164 = 0u;
      long long v165 = 0u;
      long long v166 = 0u;
      long long v167 = 0u;
      uint64_t v113 = [PostMorphingDeformers countByEnumeratingWithState:&v164 objects:v204 count:16];
      if (v113)
      {
        uint64_t v114 = v113;
        uint64_t v115 = *(void *)v165;
        do
        {
          for (kuint64_t k = 0; kk != v114; ++kk)
          {
            if (*(void *)v165 != v115) {
              objc_enumerationMutation(PostMorphingDeformers);
            }
            v117 = *(void **)(*((void *)&v164 + 1) + 8 * kk);
            uint64_t v118 = [(NSMapTable *)v152->_customDeformerToInstances objectForKey:v117];
            if (v118)
            {
              uint64_t v119 = v118;
              [(NSMutableArray *)v152->_postMorphingDeformerInstances addObject:v118];
              [(NSMapTable *)v112 setObject:v119 forKey:v117];
            }
            else
            {
              v120 = [SCNGeometryDeformerInstanceWrapper alloc];
              memcpy(__dst, __src, sizeof(__dst));
              v121 = -[SCNGeometryDeformerInstanceWrapper initWithWrappedInstanceForStack:deformer:node:outputs:computeVertexCount:stageInputOutputDescriptors:](v120, (uint64_t)v152, v117, v111, v47, Count, __dst);
              [(NSMutableArray *)v152->_postMorphingDeformerInstances addObject:v121];
              [(NSMapTable *)v112 setObject:v121 forKey:v117];
            }
          }
          uint64_t v114 = [PostMorphingDeformers countByEnumeratingWithState:&v164 objects:v204 count:16];
        }
        while (v114);
      }
    }
    if ([obj count])
    {
      v152->_postSkinningDeformerInstances = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(obj, "count"));
      long long v159 = 0u;
      long long v160 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      uint64_t v122 = [obj countByEnumeratingWithState:&v159 objects:v203 count:16];
      if (v122)
      {
        uint64_t v123 = v122;
        uint64_t v124 = *(void *)v160;
        do
        {
          for (muint64_t m = 0; mm != v123; ++mm)
          {
            if (*(void *)v160 != v124) {
              objc_enumerationMutation(obj);
            }
            v126 = *(void **)(*((void *)&v159 + 1) + 8 * mm);
            uint64_t v127 = [(NSMapTable *)v152->_customDeformerToInstances objectForKey:v126];
            if (v127)
            {
              uint64_t v128 = v127;
              [(NSMutableArray *)v152->_postSkinningDeformerInstances addObject:v127];
              [(NSMapTable *)v112 setObject:v128 forKey:v126];
            }
            else
            {
              v129 = [SCNGeometryDeformerInstanceWrapper alloc];
              memcpy(v158, __src, sizeof(v158));
              v130 = -[SCNGeometryDeformerInstanceWrapper initWithWrappedInstanceForStack:deformer:node:outputs:computeVertexCount:stageInputOutputDescriptors:](v129, (uint64_t)v152, v126, v111, v47, Count, v158);
              [(NSMutableArray *)v152->_postSkinningDeformerInstances addObject:v130];
              [(NSMapTable *)v112 setObject:v130 forKey:v126];
            }
          }
          uint64_t v123 = [obj countByEnumeratingWithState:&v159 objects:v203 count:16];
        }
        while (v123);
      }
    }

    v152->_customDeformerToInstances = v112;
    p_currentInitRenderContext = &v152->_currentInitRenderContext;
  }
  else
  {

    v152->_customDeformerToInstances = 0;
  }
  v152->_isValid = 1;
  *p_currentInitRenderContext = 0;
  p_currentInitRenderContext[1] = 0;
}

CFTypeRef __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 48))
  {
    PositionSourceForDeformerBasedDynamicMesh = (const void *)C3DGeometryCreatePositionSourceForDeformerBasedDynamicMesh(*(void *)(a1 + 32));
    return CFAutorelease(PositionSourceForDeformerBasedDynamicMesh);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    return C3DMeshGetSourceWithSemanticAtIndex(v4, 0, 0, a2);
  }
}

const void *__82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_2_cold_2();
  }
  SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(*(void *)(a1 + 40), 1, 0, *(unsigned __int8 *)(*(void *)(a1 + 32) + 49));
  if (!SourceWithSemanticAtIndex)
  {
    SourceWithSemanticAtIndex = (const void *)C3DCreateNormalsWithMesh(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 49), 0);
    if (!SourceWithSemanticAtIndex)
    {
      CFTypeID v3 = scn_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
    CFAutorelease(SourceWithSemanticAtIndex);
  }
  return SourceWithSemanticAtIndex;
}

const void *__82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_28(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_28_cold_2();
  }
  id result = C3DMeshGetSourceWithSemanticAtIndex(*(void *)(a1 + 40), 4, 0, *(unsigned __int8 *)(*(void *)(a1 + 32) + 49));
  if (!result)
  {
    C3DMeshCreateTangentsIfNeeded(*(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 49));
    id result = C3DMeshGetSourceWithSemanticAtIndex(*(void *)(a1 + 40), 4, 0, *(unsigned __int8 *)(*(void *)(a1 + 32) + 49));
    if (!result)
    {
      CFTypeID v3 = scn_default_log();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
      return 0;
    }
  }
  return result;
}

- (unint64_t)currentFrameHash
{
  uint64_t currentUpdateRenderContext = (uint64_t)self->_currentUpdateRenderContext;
  uint64_t v3 = -[SCNMTLRenderContext engineContext](currentUpdateRenderContext);
  double SystemTime = C3DEngineContextGetSystemTime(v3);
  uint64_t v5 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](currentUpdateRenderContext);
  unint64_t v6 = 0x9DDFEA08EB382D69
     * (v5 ^ ((0x9DDFEA08EB382D69 * (v5 ^ currentUpdateRenderContext)) >> 47) ^ (0x9DDFEA08EB382D69
                                                                                 * (v5 ^ currentUpdateRenderContext)));
  unint64_t v7 = 0xC6A4A7935BD1E995
     * ((0xC6A4A7935BD1E995
       * ((0xC6A4A7935BD1E995 * *(void *)&SystemTime) ^ ((0xC6A4A7935BD1E995 * *(void *)&SystemTime) >> 47))) ^ 0x35253C9ADE8F4CA8 ^ (0x9DDFEA08EB382D69 * (v6 ^ (v6 >> 47))));
  return (0xC6A4A7935BD1E995 * (v7 ^ (v7 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v7 ^ (v7 >> 47))) >> 47);
}

- (__n128)currentTransforms
{
  long long v2 = *(_OWORD *)(a1 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 544);
  *(_OWORD *)(a2 + 144) = v2;
  long long v3 = *(_OWORD *)(a1 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 576);
  *(_OWORD *)(a2 + 176) = v3;
  long long v4 = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 80) = v4;
  long long v5 = *(_OWORD *)(a1 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 512);
  *(_OWORD *)(a2 + 112) = v5;
  long long v6 = *(_OWORD *)(a1 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 416);
  *(_OWORD *)(a2 + 16) = v6;
  __n128 result = *(__n128 *)(a1 + 448);
  long long v8 = *(_OWORD *)(a1 + 464);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v8;
  return result;
}

- (__n128)_currentFrustumInfo
{
  long long v2 = *(_OWORD *)(a1 + 688);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 672);
  *(_OWORD *)(a2 + 80) = v2;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 704);
  long long v3 = *(_OWORD *)(a1 + 624);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 608);
  *(_OWORD *)(a2 + 16) = v3;
  __n128 result = *(__n128 *)(a1 + 656);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 640);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

- (SCNMTLComputeCommandEncoder)currentComputeEncoder
{
  __n128 result = self->_currentUpdateComputeCommandEncoder;
  if (!result)
  {
    __n128 result = (SCNMTLComputeCommandEncoder *)-[SCNMTLRenderContext resourceComputeEncoder]((uint64_t)self->_currentUpdateRenderContext);
    self->_currentUpdateComputeCommandEncoder = result;
  }
  return result;
}

- (void)encodeCommandsInNewCommandBufferUsingBlock:(id)a3
{
  self->_currentUpdateComputeCommandEncoder = 0;
  long long v4 = -[SCNMTLRenderContext resourceCommandBuffer](&self->_currentUpdateRenderContext->super.isa);
  long long v5 = (void (*)(id, void *))*((void *)a3 + 2);

  v5(a3, v4);
}

- (void)setStageInputOutputBuffersToEncoder:(SCNMTLComputeCommandEncoder *)a3
{
  srcPositions = self->_currentUpdateBuffers.srcPositions;
  if (a3->_buffers[10] == srcPositions)
  {
    if (!a3->_offsets[10]) {
      goto LABEL_5;
    }
  }
  else
  {
    a3->_buffers[10] = srcPositions;
  }
  a3->_offsets[10] = 0;
  a3->_buffersToBind[0] |= 0x400uLL;
LABEL_5:
  srcNormals = self->_currentUpdateBuffers.srcNormals;
  if (a3->_buffers[11] == srcNormals)
  {
    if (!a3->_offsets[11]) {
      goto LABEL_9;
    }
  }
  else
  {
    a3->_buffers[11] = srcNormals;
  }
  a3->_offsets[11] = 0;
  a3->_buffersToBind[0] |= 0x800uLL;
LABEL_9:
  srcTangents = self->_currentUpdateBuffers.srcTangents;
  if (a3->_buffers[12] == srcTangents)
  {
    if (!a3->_offsets[12]) {
      return;
    }
  }
  else
  {
    a3->_buffers[12] = srcTangents;
  }
  a3->_offsets[12] = 0;
  a3->_buffersToBind[0] |= 0x1000uLL;
}

- (uint64_t)setNextUpdateRequiresResetForIncrementalDeformers
{
  if (result) {
    return -[SCNMTLMorphDeformer setNextFrameRequiresFullMeshReset](*(void *)(result + 832));
  }
  return result;
}

- (BOOL)computeDeformedMeshReliesOnTransforms
{
  if (result) {
    return *(unsigned char *)(result + 51) != 0;
  }
  return result;
}

- (BOOL)computeDeformedMeshReliesOnFrustum
{
  if (result) {
    return *(unsigned char *)(result + 52) != 0;
  }
  return result;
}

- (uint64_t)computeDeformedMeshForContext:(unsigned __int8)a3 programHashCodeRequirements:(long long *)a4 transforms:(long long *)a5 frustumInfo:(BOOL *)a6 status:
{
  if (!result) {
    return result;
  }
  uint64_t v11 = result;
  uint64_t v12 = *(void *)(result + 16);
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke;
  v84[3] = &unk_264005D70;
  v84[4] = v11;
  v84[5] = a2;
  unsigned __int8 v85 = a3;
  C3DDeformerStackEnumerateDependencyStacks(v12, (uint64_t)v84);
  long long v13 = *a4;
  long long v14 = a4[1];
  long long v15 = a4[3];
  *(_OWORD *)(v11 + 448) = a4[2];
  *(_OWORD *)(v11 + 464) = v15;
  *(_OWORD *)(v11 + 416) = v13;
  *(_OWORD *)(v11 + 432) = v14;
  long long v16 = a4[4];
  long long v17 = a4[5];
  long long v18 = a4[7];
  *(_OWORD *)(v11 + 512) = a4[6];
  *(_OWORD *)(v11 + 528) = v18;
  *(_OWORD *)(v11 + 480) = v16;
  *(_OWORD *)(v11 + 496) = v17;
  long long v19 = a4[8];
  long long v20 = a4[9];
  long long v21 = a4[11];
  *(_OWORD *)(v11 + 576) = a4[10];
  *(_OWORD *)(v11 + 592) = v21;
  *(_OWORD *)(v11 + 544) = v19;
  *(_OWORD *)(v11 + 560) = v20;
  long long v22 = *a5;
  long long v23 = a5[2];
  *(_OWORD *)(v11 + 624) = a5[1];
  *(_OWORD *)(v11 + 640) = v23;
  *(_OWORD *)(v11 + 608) = v22;
  long long v24 = a5[3];
  long long v25 = a5[4];
  long long v26 = a5[6];
  *(_OWORD *)(v11 + 688) = a5[5];
  *(_OWORD *)(v11 + 704) = v26;
  *(_OWORD *)(v11 + 656) = v24;
  *(_OWORD *)(v11 + 672) = v25;
  *(void *)(v11 + 720) = a2;
  [(id)v11 reconfigureIfNeededWithContext:a2 programHashCodeRequirements:a3];
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_36;
  v83[3] = &unk_264005D98;
  v83[4] = v11;
  uint64_t v27 = *(void *)(v11 + 56);
  uint64_t v28 = *(void *)(v11 + 64);
  uint64_t v29 = *(void *)(v11 + 88);
  uint64_t v30 = *(void *)(v11 + 96);
  if (!v27) {
    uint64_t v27 = *(void *)(v11 + 88);
  }
  if (!v28) {
    uint64_t v28 = *(void *)(v11 + 96);
  }
  uint64_t v31 = *(void *)(v11 + 72);
  int v81 = a6;
  uint64_t v82 = *(void *)(v11 + 112);
  uint64_t v32 = *(void *)(v11 + 104);
  if (!v31) {
    uint64_t v31 = *(void *)(v11 + 104);
  }
  uint64_t v33 = (_OWORD *)(v11 + 736);
  *(void *)(v11 + 736) = v27;
  *(void *)(v11 + 744) = v29;
  *(void *)(v11 + 752) = v28;
  *(void *)(v11 + 760) = v30;
  *(void *)(v11 + 768) = v31;
  *(void *)(v11 + 776) = v32;
  *(_OWORD *)(v11 + 784) = 0u;
  *(_OWORD *)(v11 + 800) = 0u;
  *(_OWORD *)(v11 + 816) = 0u;
  unsigned int v34 = *(void **)(v11 + 832);
  if (v34)
  {
    *(void *)(v11 + 744) = v27;
    *(void *)(v11 + 760) = v28;
    *(void *)(v11 + 776) = v31;
    BOOL v35 = [v34 updateWithComputeContext:v11 buffers:v11 + 736] == 1;
    uint64_t v36 = *(void *)(v11 + 96);
    *(void *)(v11 + 744) = *(void *)(v11 + 88);
    *(void *)(v11 + 760) = v36;
    *(void *)(v11 + 776) = *(void *)(v11 + 104);
  }
  else
  {
    BOOL v35 = 0;
  }
  uint64_t v37 = (_OWORD *)(v11 + 784);
  if (*(void *)(v11 + 864))
  {
    PostMorphingDeformers = (void *)C3DDeformerStackGetPostMorphingDeformers(*(void *)(v11 + 16));
    uint64_t v39 = [*(id *)(v11 + 864) count];
    if (v39)
    {
      uint64_t v40 = v39;
      char v41 = 0;
      for (uint64_t i = 0; i != v40; ++i)
      {
        uint64_t v43 = objc_msgSend(*(id *)(v11 + 864), "objectAtIndexedSubscript:", i, v81);
        uint64_t v44 = v43;
        if (v43)
        {
          [(id)v11 updateDependencyBuffersInBufferArray:v11 + 736 forDeformer:*(void *)(v43 + 16)];
          *(void *)(v44 + 416) = v83;
          long long v45 = *(_OWORD *)(v11 + 752);
          *(_OWORD *)(v44 + 432) = *v33;
          *(_OWORD *)(v44 + 448) = v45;
          long long v46 = *(_OWORD *)(v11 + 768);
          long long v47 = *(_OWORD *)(v11 + 784);
          long long v48 = *(_OWORD *)(v11 + 816);
          *(_OWORD *)(v44 + 496) = *(_OWORD *)(v11 + 800);
          *(_OWORD *)(v44 + 512) = v48;
          *(_OWORD *)(v44 + 464) = v46;
          *(_OWORD *)(v44 + 480) = v47;
          uint64_t v49 = [*(id *)(v44 + 24) updateWithContext:v44];
          *(void *)(v44 + 416) = 0;
          *(void *)(v44 + 424) = 0;
        }
        else
        {
          [(id)v11 updateDependencyBuffersInBufferArray:v11 + 736 forDeformer:0];
          uint64_t v49 = 0;
        }
        if (v49 == 1)
        {
          BOOL v35 = 1;
          char v41 = 1;
        }
        *(void *)(v11 + 736) = *(void *)(v11 + 744);
        *(void *)(v11 + 752) = *(void *)(v11 + 760);
        *(void *)(v11 + 768) = *(void *)(v11 + 776);
        *uint64_t v37 = 0u;
        *(_OWORD *)(v11 + 800) = 0u;
        *(_OWORD *)(v11 + 816) = 0u;
        if ((objc_msgSend((id)objc_msgSend(PostMorphingDeformers, "objectAtIndexedSubscript:", i), "requiredOutputs") & 0x200) != 0)
        {
          if (v44) {
            unint64_t v50 = *(void **)(v44 + 24);
          }
          else {
            unint64_t v50 = 0;
          }
          uint64_t v82 = [v50 meshForDeformedTopology];
        }
      }
    }
    else
    {
      char v41 = 0;
    }
    char v51 = v41 & 1;
  }
  else
  {
    char v51 = 0;
  }
  char v52 = *(void **)(v11 + 840);
  if (v52)
  {
    if ([v52 updateWithComputeContext:v11 buffers:v11 + 736] == 1) {
      BOOL v35 = 1;
    }
    *(void *)(v11 + 736) = *(void *)(v11 + 744);
    *(void *)(v11 + 752) = *(void *)(v11 + 760);
    *(void *)(v11 + 768) = *(void *)(v11 + 776);
  }
  if (*(void *)(v11 + 872))
  {
    PostSkinningDeformers = (void *)C3DDeformerStackGetPostSkinningDeformers(*(void *)(v11 + 16));
    uint64_t v54 = [*(id *)(v11 + 872) count];
    if (v54)
    {
      uint64_t v55 = v54;
      for (uint64_t j = 0; j != v55; ++j)
      {
        uint64_t v57 = objc_msgSend(*(id *)(v11 + 872), "objectAtIndexedSubscript:", j, v81);
        uint64_t v58 = v57;
        if (v57)
        {
          [(id)v11 updateDependencyBuffersInBufferArray:v11 + 736 forDeformer:*(void *)(v57 + 16)];
          *(void *)(v58 + 416) = v83;
          long long v59 = *(_OWORD *)(v11 + 752);
          *(_OWORD *)(v58 + 432) = *v33;
          *(_OWORD *)(v58 + 448) = v59;
          long long v60 = *(_OWORD *)(v11 + 768);
          long long v61 = *(_OWORD *)(v11 + 784);
          long long v62 = *(_OWORD *)(v11 + 816);
          *(_OWORD *)(v58 + 496) = *(_OWORD *)(v11 + 800);
          *(_OWORD *)(v58 + 512) = v62;
          *(_OWORD *)(v58 + 464) = v60;
          *(_OWORD *)(v58 + 480) = v61;
          uint64_t v63 = [*(id *)(v58 + 24) updateWithContext:v58];
          *(void *)(v58 + 416) = 0;
          *(void *)(v58 + 424) = 0;
        }
        else
        {
          [(id)v11 updateDependencyBuffersInBufferArray:v11 + 736 forDeformer:0];
          uint64_t v63 = 0;
        }
        BOOL v64 = v63 == 1;
        if (v63 == 1) {
          BOOL v35 = 1;
        }
        *(void *)(v11 + 736) = *(void *)(v11 + 744);
        *(void *)(v11 + 752) = *(void *)(v11 + 760);
        *(void *)(v11 + 768) = *(void *)(v11 + 776);
        *uint64_t v37 = 0u;
        *(_OWORD *)(v11 + 800) = 0u;
        *(_OWORD *)(v11 + 816) = 0u;
        if ((objc_msgSend((id)objc_msgSend(PostSkinningDeformers, "objectAtIndexedSubscript:", j), "requiredOutputs") & 0x200) != 0)
        {
          if (v58) {
            unint64_t v65 = *(void **)(v58 + 24);
          }
          else {
            unint64_t v65 = 0;
          }
          uint64_t v82 = [v65 meshForDeformedTopology];
        }
        v51 |= v64;
      }
    }
  }
  v66 = *(void **)(v11 + 848);
  if (v66)
  {
    uint64_t v67 = [v66 updateWithComputeContext:v11 buffers:v11 + 736];
    if (v67 == 1) {
      BOOL v35 = 1;
    }
    v51 |= v67 == 1;
    *(void *)(v11 + 736) = *(void *)(v11 + 744);
    *(void *)(v11 + 752) = *(void *)(v11 + 760);
    *(void *)(v11 + 768) = *(void *)(v11 + 776);
  }
  if (*(unsigned __int8 *)(v11 + 48) != *(unsigned __int8 *)(v11 + 49))
  {
    uint64_t v68 = (SCNMTLComputeCommandEncoder *)[(id)v11 currentComputeEncoder];
    int v69 = v68;
    uint64_t v70 = *(MTLBuffer **)(v11 + 88);
    if (v68->_buffers[0] == v70)
    {
      if (!v68->_offsets[0]) {
        goto LABEL_57;
      }
    }
    else
    {
      v68->_buffers[0] = v70;
    }
    v68->_offsets[0] = 0;
    v68->_buffersToBind[0] |= 1uLL;
LABEL_57:
    v71 = *(MTLBuffer **)(v11 + 120);
    if (v68->_buffers[1] == v71)
    {
      if (!v68->_offsets[1]) {
        goto LABEL_61;
      }
    }
    else
    {
      v68->_buffers[1] = v71;
    }
    v68->_offsets[1] = 0;
    v68->_buffersToBind[0] |= 2uLL;
LABEL_61:
    unsigned int v72 = *(MTLBuffer **)(v11 + 96);
    if (!v72) {
      goto LABEL_70;
    }
    if (v68->_buffers[2] == v72)
    {
      if (!v68->_offsets[2]) {
        goto LABEL_66;
      }
    }
    else
    {
      v68->_buffers[2] = v72;
    }
    v68->_offsets[2] = 0;
    v68->_buffersToBind[0] |= 4uLL;
LABEL_66:
    int v73 = *(MTLBuffer **)(v11 + 128);
    if (v68->_buffers[3] == v73)
    {
      if (!v68->_offsets[3]) {
        goto LABEL_70;
      }
    }
    else
    {
      v68->_buffers[3] = v73;
    }
    v68->_offsets[3] = 0;
    v68->_buffersToBind[0] |= 8uLL;
LABEL_70:
    int v74 = *(MTLBuffer **)(v11 + 104);
    if (!v74) {
      goto LABEL_79;
    }
    if (v68->_buffers[4] == v74)
    {
      if (!v68->_offsets[4]) {
        goto LABEL_75;
      }
    }
    else
    {
      v68->_buffers[4] = v74;
    }
    v68->_offsets[4] = 0;
    v68->_buffersToBind[0] |= 0x10uLL;
LABEL_75:
    uint64_t v75 = *(MTLBuffer **)(v11 + 136);
    if (v68->_buffers[5] == v75)
    {
      if (!v68->_offsets[5]) {
        goto LABEL_79;
      }
    }
    else
    {
      v68->_buffers[5] = v75;
    }
    v68->_offsets[5] = 0;
    v68->_buffersToBind[0] |= 0x20uLL;
LABEL_79:
    uint64_t v76 = *(MTLBuffer **)(v11 + 352);
    if (v68->_buffers[6] == v76)
    {
      if (!v68->_offsets[6])
      {
LABEL_83:
        SCNMTLComputeCommandEncoder::setBytes(v68, (const void *)(v11 + 336), 4uLL, 7uLL);
        uint64_t v77 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](*(void *)(v11 + 344));
        uint64_t v78 = *(unsigned int *)(v11 + 336);
        if (v69->_computePipelineState != (MTLComputePipelineState *)v77)
        {
          v69->_computePipelineState = (MTLComputePipelineState *)v77;
          [(MTLComputeCommandEncoder *)v69->_encoder setComputePipelineState:v77];
        }
        SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v69, v78);
        goto LABEL_86;
      }
    }
    else
    {
      v68->_buffers[6] = v76;
    }
    v68->_offsets[6] = 0;
    v68->_buffersToBind[0] |= 0x40uLL;
    goto LABEL_83;
  }
LABEL_86:
  uint64_t v79 = *(void *)(v11 + 128);
  *(void *)(v11 + 744) = *(void *)(v11 + 120);
  *(void *)(v11 + 760) = v79;
  *(void *)(v11 + 776) = *(void *)(v11 + 136);
  if (v35) {
    [*(id *)(v11 + 856) updateWithComputeContext:v11 buffers:v11 + 736];
  }
  int v80 = *(void **)(v11 + 728);
  if (v80) {
    bzero(v80, 0x678uLL);
  }
  *int v81 = v35;
  *(_OWORD *)(v11 + 576) = 0u;
  *(_OWORD *)(v11 + 592) = 0u;
  *(_OWORD *)(v11 + 544) = 0u;
  *(_OWORD *)(v11 + 560) = 0u;
  *(_OWORD *)(v11 + 512) = 0u;
  *(_OWORD *)(v11 + 528) = 0u;
  *(_OWORD *)(v11 + 480) = 0u;
  *(_OWORD *)(v11 + 496) = 0u;
  *(_OWORD *)(v11 + 448) = 0u;
  *(_OWORD *)(v11 + 464) = 0u;
  *(_OWORD *)(v11 + 416) = 0u;
  *(_OWORD *)(v11 + 432) = 0u;
  *(_OWORD *)(v11 + 608) = 0u;
  *(_OWORD *)(v11 + 624) = 0u;
  *(_OWORD *)(v11 + 640) = 0u;
  *(_OWORD *)(v11 + 656) = 0u;
  *(_OWORD *)(v11 + 672) = 0u;
  *(_OWORD *)(v11 + 688) = 0u;
  *(_OWORD *)(v11 + 704) = 0u;
  *(void *)(v11 + 720) = 0;
  *(void *)(v11 + 728) = 0;
  if (v51) {
    C3DNodeBoundingBoxDidUpdate(*(void *)(v11 + 24));
  }
  return v82;
}

uint64_t __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = C3DDeformerStackWantsGPU(a2);
  if (result)
  {
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) renderResourceForDeformerStack:a2 node:a3 dataKind:a4];
    uint64_t v10 = v9;
    if (v9)
    {
      if (*(unsigned char *)(v9 + 51))
      {
        uint64_t v11 = scn_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_cold_2(v11, v12, v13, v14, v15, v16, v17, v18);
        }
      }
      if (*(unsigned char *)(v10 + 52))
      {
        long long v19 = scn_default_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
    }
    uint64_t v27 = *(void *)(a1 + 40);
    uint64_t v28 = *(unsigned __int8 *)(a1 + 48);
    v29[4] = v36;
    v29[5] = v37;
    v29[6] = v38;
    v29[0] = v32;
    v29[1] = v33;
    v29[2] = v34;
    v29[3] = v35;
    return -[SCNMTLDeformerStack computeDeformedMeshForContext:programHashCodeRequirements:transforms:frustumInfo:status:](v10, v27, v28, v30, v29, v31);
  }
  return result;
}

uint64_t __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_36(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) currentComputeEncoder];
  bzero(v1, 0x678uLL);
  return v1[207];
}

- (uint64_t)bufferForCommonProfileArgumentNamed:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (uint64_t result = [*(id *)(v3 + 848) bufferForCommonProfileArgumentNamed:a2]) == 0)
    {
      long long v4 = scn_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLDeformerStack bufferForCommonProfileArgumentNamed:](a2, v4);
      }
      return 0;
    }
  }
  return result;
}

- (id)dependencyBufferForInput:(unint64_t)a3 dependencyStack:(id)a4
{
  if (a3 <= 8)
  {
    if (((1 << a3) & 0x48) != 0) {
      return (id)*((void *)a4 + 11);
    }
    if (((1 << a3) & 0x90) != 0) {
      return (id)*((void *)a4 + 12);
    }
    if (((1 << a3) & 0x120) != 0) {
      return (id)*((void *)a4 + 13);
    }
  }
  long long v5 = scn_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[SCNMTLDeformerStack dependencyBufferForInput:dependencyStack:]();
  }
  return 0;
}

- (id)dependencyBufferForInput:(unint64_t)a3 dependencyMesh:(id)a4
{
  long long v4 = scn_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v5 = 0;
    _os_log_error_impl(&dword_20B249000, v4, OS_LOG_TYPE_ERROR, "Unreachable code: Not implemented", v5, 2u);
  }
  __assert_rtn("-[SCNMTLDeformerStack dependencyBufferForInput:dependencyMesh:]", "SCNMTLDeformerStack.mm", 1985, "0");
}

- (void)updateDependencyBuffersInBufferArray:(id *)a3 forDeformer:(id)a4
{
  uint64_t v4 = MEMORY[0x263EF8330];
  *(_OWORD *)&a3->var8 = 0u;
  *(_OWORD *)&a3->var10 = 0u;
  *(_OWORD *)&a3->var6 = 0u;
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke;
  v5[3] = &unk_264005DC0;
  v5[4] = self;
  v5[5] = a3;
  [a4 _enumerateDependencyNodesUsingBlock:v5];
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke(uint64_t a1, uint64_t a2, void *a3, __int16 a4)
{
  uint64_t v7 = [a3 nodeRef];
  DeformerStacuint64_t k = C3DNodeGetDeformerStack(v7);
  if (!DeformerStack)
  {
    uint64_t Geometry = C3DNodeGetGeometry(v7);
    uint64_t Mesh = C3DGeometryGetMesh(Geometry);
    uint64_t v39 = -[SCNMTLResourceManager renderResourceForMesh:dataKind:](*(void *)(*(void *)(a1 + 32) + 8), Mesh, *(unsigned __int8 *)(*(void *)(a1 + 32) + 49));
    if (a2 != 1)
    {
      if (a2) {
        return;
      }
      if ((a4 & 8) != 0
        && (uint64_t v40 = [*(id *)(a1 + 32) dependencyBufferForInput:3 dependencyMesh:v39],
            (*(void *)(*(void *)(a1 + 40) + 48) = v40) == 0)
        && (char v41 = scn_default_log(), os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)))
      {
        __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_3(v41, v42, v43, v44, v45, v46, v47, v48);
        if ((a4 & 0x10) == 0) {
          goto LABEL_24;
        }
      }
      else if ((a4 & 0x10) == 0)
      {
        goto LABEL_24;
      }
      uint64_t v49 = [*(id *)(a1 + 32) dependencyBufferForInput:4 dependencyMesh:v39];
      *(void *)(*(void *)(a1 + 40) + 56) = v49;
      if (!v49)
      {
        unint64_t v50 = scn_default_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
          __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_2(v50, v51, v52, v53, v54, v55, v56, v57);
        }
      }
LABEL_24:
      if ((a4 & 0x20) != 0)
      {
        uint64_t v58 = [*(id *)(a1 + 32) dependencyBufferForInput:5 dependencyMesh:v39];
        *(void *)(*(void *)(a1 + 40) + 64) = v58;
        if (!v58)
        {
          uint64_t v29 = scn_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
            goto LABEL_14;
          }
        }
      }
      return;
    }
    if ((a4 & 0x40) != 0
      && (uint64_t v86 = [*(id *)(a1 + 32) dependencyBufferForInput:6 dependencyMesh:v39],
          (*(void *)(*(void *)(a1 + 40) + 72) = v86) == 0)
      && (uint64_t v87 = scn_default_log(), os_log_type_enabled(v87, OS_LOG_TYPE_FAULT)))
    {
      __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_6(v87, v88, v89, v90, v91, v92, v93, v94);
      if ((a4 & 0x80) == 0) {
        goto LABEL_46;
      }
    }
    else if ((a4 & 0x80) == 0)
    {
      goto LABEL_46;
    }
    uint64_t v95 = [*(id *)(a1 + 32) dependencyBufferForInput:7 dependencyMesh:v39];
    *(void *)(*(void *)(a1 + 40) + 80) = v95;
    if (!v95)
    {
      uint64_t v96 = scn_default_log();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT)) {
        __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_5(v96, v97, v98, v99, v100, v101, v102, v103);
      }
    }
LABEL_46:
    if ((a4 & 0x100) == 0) {
      return;
    }
    uint64_t v104 = [*(id *)(a1 + 32) dependencyBufferForInput:8 dependencyMesh:v39];
    *(void *)(*(void *)(a1 + 40) + 88) = v104;
    if (v104) {
      return;
    }
    uint64_t v78 = scn_default_log();
    if (!os_log_type_enabled(v78, OS_LOG_TYPE_FAULT)) {
      return;
    }
LABEL_49:
    __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_4(v78, v79, v80, v81, v82, v83, v84, v85);
    return;
  }
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) renderResourceForDeformerStack:DeformerStack node:v7 dataKind:*(unsigned __int8 *)(*(void *)(a1 + 32) + 49)];
  if (a2 == 1)
  {
    if ((a4 & 0x40) != 0
      && (uint64_t v59 = [*(id *)(a1 + 32) dependencyBufferForInput:6 dependencyStack:v9],
          (*(void *)(*(void *)(a1 + 40) + 72) = v59) == 0)
      && (long long v60 = scn_default_log(), os_log_type_enabled(v60, OS_LOG_TYPE_FAULT)))
    {
      __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_6(v60, v61, v62, v63, v64, v65, v66, v67);
      if ((a4 & 0x80) == 0) {
        goto LABEL_35;
      }
    }
    else if ((a4 & 0x80) == 0)
    {
      goto LABEL_35;
    }
    uint64_t v68 = [*(id *)(a1 + 32) dependencyBufferForInput:7 dependencyStack:v9];
    *(void *)(*(void *)(a1 + 40) + 80) = v68;
    if (!v68)
    {
      int v69 = scn_default_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT)) {
        __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_5(v69, v70, v71, v72, v73, v74, v75, v76);
      }
    }
LABEL_35:
    if ((a4 & 0x100) == 0) {
      return;
    }
    uint64_t v77 = [*(id *)(a1 + 32) dependencyBufferForInput:8 dependencyStack:v9];
    *(void *)(*(void *)(a1 + 40) + 88) = v77;
    if (v77) {
      return;
    }
    uint64_t v78 = scn_default_log();
    if (!os_log_type_enabled(v78, OS_LOG_TYPE_FAULT)) {
      return;
    }
    goto LABEL_49;
  }
  if (a2) {
    return;
  }
  if ((a4 & 8) != 0
    && (uint64_t v10 = [*(id *)(a1 + 32) dependencyBufferForInput:3 dependencyStack:v9],
        (*(void *)(*(void *)(a1 + 40) + 48) = v10) == 0)
    && (uint64_t v11 = scn_default_log(), os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)))
  {
    __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_3(v11, v12, v13, v14, v15, v16, v17, v18);
    if ((a4 & 0x10) == 0) {
      goto LABEL_11;
    }
  }
  else if ((a4 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  uint64_t v19 = [*(id *)(a1 + 32) dependencyBufferForInput:4 dependencyStack:v9];
  *(void *)(*(void *)(a1 + 40) + 56) = v19;
  if (!v19)
  {
    uint64_t v20 = scn_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
    }
  }
LABEL_11:
  if ((a4 & 0x20) != 0)
  {
    uint64_t v28 = [*(id *)(a1 + 32) dependencyBufferForInput:5 dependencyStack:v9];
    *(void *)(*(void *)(a1 + 40) + 64) = v28;
    if (!v28)
    {
      uint64_t v29 = scn_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
LABEL_14:
      }
        __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_1(v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
}

- (void)updateDataForAuthoringEnvironment:(long long *)a3 transforms:(uint64_t)a4 context:
{
  if (result)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __76__SCNMTLDeformerStack_updateDataForAuthoringEnvironment_transforms_context___block_invoke;
    v10[3] = &unk_264005DE8;
    uint64_t v25 = a2;
    long long v4 = a3[9];
    long long v19 = a3[8];
    long long v20 = v4;
    long long v5 = a3[11];
    long long v21 = a3[10];
    long long v22 = v5;
    long long v6 = a3[5];
    long long v15 = a3[4];
    long long v16 = v6;
    long long v7 = a3[7];
    long long v17 = a3[6];
    long long v18 = v7;
    long long v8 = a3[1];
    long long v11 = *a3;
    long long v12 = v8;
    long long v9 = a3[3];
    long long v13 = a3[2];
    long long v14 = v9;
    uint64_t v23 = result;
    uint64_t v24 = a4;
    return (void *)[result enumerateInternalDeformersUsingBlock:v10];
  }
  return result;
}

uint64_t __76__SCNMTLDeformerStack_updateDataForAuthoringEnvironment_transforms_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 232);
    uint64_t v6 = *(void *)(*(void *)(a1 + 224) + 24);
    long long v7 = *(_OWORD *)(a1 + 176);
    v14[8] = *(_OWORD *)(a1 + 160);
    v14[9] = v7;
    long long v8 = *(_OWORD *)(a1 + 208);
    v14[10] = *(_OWORD *)(a1 + 192);
    v14[11] = v8;
    long long v9 = *(_OWORD *)(a1 + 112);
    v14[4] = *(_OWORD *)(a1 + 96);
    v14[5] = v9;
    long long v10 = *(_OWORD *)(a1 + 144);
    v14[6] = *(_OWORD *)(a1 + 128);
    v14[7] = v10;
    long long v11 = *(_OWORD *)(a1 + 48);
    v14[0] = *(_OWORD *)(a1 + 32);
    v14[1] = v11;
    long long v12 = *(_OWORD *)(a1 + 80);
    uint64_t v13 = *(void *)(a1 + 240);
    v14[2] = *(_OWORD *)(a1 + 64);
    v14[3] = v12;
    return [a2 updateDataForAuthoringEnvironment:v13 node:v6 transforms:v14 context:v5];
  }
  return result;
}

- (void)drawAuthoringEnvironment:(uint64_t)a3 context:
{
  if (result)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __56__SCNMTLDeformerStack_drawAuthoringEnvironment_context___block_invoke;
    v3[3] = &unk_264005E10;
    v3[5] = a3;
    v3[6] = a2;
    v3[4] = result;
    return (void *)[result enumerateInternalDeformersUsingBlock:v3];
  }
  return result;
}

uint64_t __56__SCNMTLDeformerStack_drawAuthoringEnvironment_context___block_invoke(void *a1, void *a2)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v6 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v7 = *(void *)(a1[4] + 24);
    return [a2 drawAuthoringEnvironment:v5 node:v7 context:v6];
  }
  return result;
}

- (void)deformerClassForMeshlesshGeometry:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Could not find deformer class associated to meshless geometry", v2, v3, v4, v5, v6);
}

- (void)setupInitialBuffersWithBasePositionSourceProvider:(uint64_t)a3 baseNormalSourceProvider:(uint64_t)a4 baseTangentSourceProvider:(uint64_t)a5 info:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupInitialBuffersWithBasePositionSourceProvider:(uint64_t)a3 baseNormalSourceProvider:(uint64_t)a4 baseTangentSourceProvider:(uint64_t)a5 info:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupFinalMeshFromBaseMeshWithInfo:(NSObject *)a3 .cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "_finalDataKind == kC3DMeshDataKindOriginal && subdivIsUsed";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. Only original data kind can have non 'GPU' primitive type", a1);
}

void __58__SCNMTLDeformerStack_setupFinalMeshFromBaseMeshWithInfo___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Volatile meshes are not supported by the deformer stack", v2, v3, v4, v5, v6);
}

- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupFinalMeshFromMeshlessBaseGeometryWithInfo:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)deindexedToOriginalTableBufferWithBlitEncoder:(NSObject *)a3 indexSizeOut:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "orig < originalVertexCount";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. buffer overflow", a1);
}

- (void)deindexedToFirstDeindexedTableBufferWithBlitEncoder:(NSObject *)a3 indexSizeOut:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "prov < deindexedVertexCount";
  OUTLINED_FUNCTION_1(&dword_20B249000, a3, (uint64_t)a3, "Assertion '%s' failed. buffer overflow", a1);
}

- (void)newBufferForDataKind:positionSource:normalSource:positionDataType:normalDataType:forStageInputOutputDescriptor:usePrivateStorageMode:outStride:outPositionOffset:outNormalOffset:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Can't create an interleaved buffer for the renderable topology, possible vector count mismatch between semantics", v2, v3, v4, v5, v6);
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.1()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1561, "_finalMesh != nil");
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.2()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1337, "wantsDrawIndirect == NO");
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.3()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1325, "wantsDrawIndirect == NO");
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.4()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1313, "wantsDrawIndirect == NO");
}

- (void)reconfigureIfNeededWithContext:programHashCodeRequirements:.cold.5()
{
  __assert_rtn("-[SCNMTLDeformerStack reconfigureIfNeededWithContext:programHashCodeRequirements:]", "SCNMTLDeformerStack.mm", 1301, "wantsDrawIndirect == NO");
}

void __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_2_cold_2()
{
}

void __82__SCNMTLDeformerStack_reconfigureIfNeededWithContext_programHashCodeRequirements___block_invoke_28_cold_2()
{
}

void __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __111__SCNMTLDeformerStack_computeDeformedMeshForContext_programHashCodeRequirements_transforms_frustumInfo_status___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)bufferForCommonProfileArgumentNamed:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "buffer != nil";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_20B249000, a2, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. Deformer stack failed to find buffer for shader argument \"%@\"", (uint8_t *)&v2, 0x16u);
}

- (void)dependencyBufferForInput:dependencyStack:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Unsupported input", v2, v3, v4, v5, v6);
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__SCNMTLDeformerStack_updateDependencyBuffersInBufferArray_forDeformer___block_invoke_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end