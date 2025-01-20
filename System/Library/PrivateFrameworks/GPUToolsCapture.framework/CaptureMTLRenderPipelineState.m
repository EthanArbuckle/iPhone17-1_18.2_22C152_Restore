@interface CaptureMTLRenderPipelineState
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)newFunctionHandle:(id *)a3 associatedWithBaseFunctionHandle:(id)a4 captureFunction:(id)a5;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)supportIndirectCommandBuffers;
- (BOOL)threadgroupSizeMatchesTileSize;
- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 captureDevice:(id)a4;
- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 capturePipelineLibrary:(id)a4;
- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 additionalBinaryFunctions:(id)a5;
- (GTTraceContext)traceContext;
- (GTTraceStream)traceStream;
- (MTLDevice)device;
- (MTLMeshRenderPipelineDescriptor)meshDescriptor;
- (MTLRenderPipelineDescriptor)descriptor;
- (MTLRenderPipelineReflection)reflection;
- (MTLRenderPipelineState)baseObject;
- (MTLResourceID)gpuResourceID;
- (MTLTileRenderPipelineDescriptor)tileDescriptor;
- (NSString)description;
- (NSString)label;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)fragmentFunctionHandleWithFunction:(id)a3;
- (id)functionHandleMap;
- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4;
- (id)meshFunctionHandleWithFunction:(id)a3;
- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newFragmentShaderDebugInfo;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5;
- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4;
- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newVertexShaderDebugInfo;
- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4;
- (id)objectFunctionHandleWithFunction:(id)a3;
- (id)originalObject;
- (id)tileFunctionHandleWithFunction:(id)a3;
- (id)vertexFunctionHandleWithFunction:(id)a3;
- (int64_t)shaderValidation;
- (int64_t)shaderValidationState;
- (int64_t)textureWriteRoundingMode;
- (unint64_t)allocatedSize;
- (unint64_t)gpuAddress;
- (unint64_t)gpuHandle;
- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3;
- (unint64_t)imageblockSampleLength;
- (unint64_t)maxTotalThreadgroupsPerMeshGrid;
- (unint64_t)maxTotalThreadsPerMeshThreadgroup;
- (unint64_t)maxTotalThreadsPerObjectThreadgroup;
- (unint64_t)maxTotalThreadsPerThreadgroup;
- (unint64_t)meshThreadExecutionWidth;
- (unint64_t)objectThreadExecutionWidth;
- (unint64_t)resourceIndex;
- (unint64_t)streamReference;
- (unint64_t)uniqueIdentifier;
- (unsigned)explicitVisibilityGroupID;
- (unsigned)getFragmentShaderTelemetryID;
- (unsigned)getVertexShaderTelemetryID;
- (void)commonInit:(id)a3 captureDevice:(id)a4;
- (void)dealloc;
- (void)setDescriptor:(id)a3;
- (void)setMeshDescriptor:(id)a3;
- (void)setReflection:(id)a3;
- (void)setTileDescriptor:(id)a3;
- (void)swapObject:(id)a3;
- (void)touch;
@end

@implementation CaptureMTLRenderPipelineState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meshDescriptor, 0);
  objc_storeStrong((id *)&self->_tileDescriptor, 0);
  objc_storeStrong((id *)&self->_reflection, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_retainedPipelineLibrary, 0);
  objc_storeStrong((id *)&self->_functionHandleMap, 0);
  objc_storeStrong((id *)&self->_additionalBinaryFunctions, 0);
  objc_storeStrong((id *)&self->_capturePipelineState, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);

  objc_storeStrong((id *)&self->_baseObject, 0);
}

- (void)setMeshDescriptor:(id)a3
{
}

- (MTLMeshRenderPipelineDescriptor)meshDescriptor
{
  return self->_meshDescriptor;
}

- (void)setTileDescriptor:(id)a3
{
}

- (MTLTileRenderPipelineDescriptor)tileDescriptor
{
  return self->_tileDescriptor;
}

- (void)setReflection:(id)a3
{
}

- (MTLRenderPipelineReflection)reflection
{
  return self->_reflection;
}

- (void)setDescriptor:(id)a3
{
}

- (MTLRenderPipelineDescriptor)descriptor
{
  return self->_descriptor;
}

- (id)vertexFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  baseObject = self->_baseObject;
  v6 = [v4 baseObject];
  v7 = [(MTLRenderPipelineStateSPI *)baseObject vertexFunctionHandleWithFunction:v6];

  id v30 = 0;
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_5;
  }
  unsigned __int8 v8 = [(CaptureMTLRenderPipelineState *)self newFunctionHandle:&v30 associatedWithBaseFunctionHandle:v7 captureFunction:v4];
  id v9 = v30;
  if (v8)
  {
LABEL_5:
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    traceContext = self->_traceContext;
    objc_msgSend(v9, "traceStream", 0);
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v27);
    uint64_t v12 = v28;
    *(_DWORD *)(v28 + 8) = -15436;
    char v13 = BYTE9(v29);
    if (BYTE9(v29) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 24);
      uint64_t v16 = BYTE10(v29);
      ++BYTE10(v29);
      v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v28 + 1), v16 | 0x1800000000) + 16;
      char v13 = v16;
    }
    else
    {
      v14 = (char *)(v12 + BYTE9(v29));
      BYTE9(v29) += 24;
    }
    *(unsigned char *)(v12 + 13) = v13;
    v17 = [(CaptureMTLRenderPipelineState *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v19 = (uint64_t *)[v30 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    v21 = (uint64_t *)[v4 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)v14 = var0;
    *((void *)v14 + 1) = v20;
    *((void *)v14 + 2) = v22;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v29);
    *(unsigned char *)(v28 + 15) |= 8u;
    id v10 = v30;
    goto LABEL_18;
  }
  id v10 = v30;
LABEL_18:
  v25 = v10;

  return v25;
}

- (id)tileFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  baseObject = self->_baseObject;
  v6 = [v4 baseObject];
  v7 = [(MTLRenderPipelineStateSPI *)baseObject tileFunctionHandleWithFunction:v6];

  id v30 = 0;
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_5;
  }
  unsigned __int8 v8 = [(CaptureMTLRenderPipelineState *)self newFunctionHandle:&v30 associatedWithBaseFunctionHandle:v7 captureFunction:v4];
  id v9 = v30;
  if (v8)
  {
LABEL_5:
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    traceContext = self->_traceContext;
    objc_msgSend(v9, "traceStream", 0);
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v27);
    uint64_t v12 = v28;
    *(_DWORD *)(v28 + 8) = -15437;
    char v13 = BYTE9(v29);
    if (BYTE9(v29) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 24);
      uint64_t v16 = BYTE10(v29);
      ++BYTE10(v29);
      v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v28 + 1), v16 | 0x1800000000) + 16;
      char v13 = v16;
    }
    else
    {
      v14 = (char *)(v12 + BYTE9(v29));
      BYTE9(v29) += 24;
    }
    *(unsigned char *)(v12 + 13) = v13;
    v17 = [(CaptureMTLRenderPipelineState *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    v19 = (uint64_t *)[v30 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    v21 = (uint64_t *)[v4 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)v14 = var0;
    *((void *)v14 + 1) = v20;
    *((void *)v14 + 2) = v22;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v29);
    *(unsigned char *)(v28 + 15) |= 8u;
    id v10 = v30;
    goto LABEL_18;
  }
  id v10 = v30;
LABEL_18:
  v25 = v10;

  return v25;
}

- (id)objectFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderPipelineState_objectFunctionHandleWithFunction", (uint64_t)"Mesh shaders with Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  v6 = [v4 baseObject];

  v7 = [(MTLRenderPipelineStateSPI *)baseObject objectFunctionHandleWithFunction:v6];

  return v7;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  id v7 = a3;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *unsigned __int8 v8 = v11;
  *(void *)&long long v30 = v10;
  BYTE8(v30) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  baseObject = self->_baseObject;
  id v13 = [v7 copy];
  id v14 = [(MTLRenderPipelineStateSPI *)baseObject newVisibleFunctionTableWithDescriptor:v13 stage:a4];

  uint64_t v15 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:v14 withDescriptor:v7];

  if (v14) {
    uint64_t v16 = [[CaptureMTLVisibleFunctionTable alloc] initWithBaseObject:v14 captureRenderPipelineState:self descriptor:v15];
  }
  else {
    uint64_t v16 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLVisibleFunctionTable *)v16 traceStream]);
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -15460;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x2000000000) + 16;
    char v18 = v21;
  }
  else
  {
    v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v17 + 13) = v18;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v24 = [(CaptureMTLVisibleFunctionTable *)v16 traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  char v26 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v28, v15);
  *(void *)v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  v19[24] = v26;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  *id v9 = v30;
  *((unsigned char *)v9 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;

  return v16;
}

- (id)newVisibleFunctionTableFromVertexStageWithDescriptor:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  baseObject = self->_baseObject;
  id v11 = [v5 copy];
  id v12 = [(MTLRenderPipelineStateSPI *)baseObject newVisibleFunctionTableFromVertexStageWithDescriptor:v11];

  id v13 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:v12 withDescriptor:v5];

  if (v12) {
    id v14 = [[CaptureMTLVisibleFunctionTable alloc] initWithBaseObject:v12 captureRenderPipelineState:self descriptor:v13];
  }
  else {
    id v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLVisibleFunctionTable *)v14 traceStream]);
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15438;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v26, v12);
  uint64_t v20 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLVisibleFunctionTable *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v26, v13);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  uint64_t *v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v14;
}

- (id)newVisibleFunctionTableFromTileStageWithDescriptor:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  baseObject = self->_baseObject;
  id v11 = [v5 copy];
  id v12 = [(MTLRenderPipelineStateSPI *)baseObject newVisibleFunctionTableFromTileStageWithDescriptor:v11];

  id v13 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:v12 withDescriptor:v5];

  if (v12) {
    id v14 = [[CaptureMTLVisibleFunctionTable alloc] initWithBaseObject:v12 captureRenderPipelineState:self descriptor:v13];
  }
  else {
    id v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLVisibleFunctionTable *)v14 traceStream]);
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15439;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v26, v12);
  uint64_t v20 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLVisibleFunctionTable *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v26, v13);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  uint64_t *v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v14;
}

- (id)newVisibleFunctionTableFromFragmentStageWithDescriptor:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  baseObject = self->_baseObject;
  id v11 = [v5 copy];
  id v12 = [(MTLRenderPipelineStateSPI *)baseObject newVisibleFunctionTableFromFragmentStageWithDescriptor:v11];

  id v13 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeVisibleFunctionTableIntoArgumentBufferForResourceIndex:v12 withDescriptor:v5];

  if (v12) {
    id v14 = [[CaptureMTLVisibleFunctionTable alloc] initWithBaseObject:v12 captureRenderPipelineState:self descriptor:v13];
  }
  else {
    id v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLVisibleFunctionTable *)v14 traceStream]);
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15440;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLVisibleFunctionTableInfo((uint64_t)&v26, v12);
  uint64_t v20 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLVisibleFunctionTable *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLVisibleFunctionTableDescriptor((uint64_t)&v26, v13);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  uint64_t *v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v14;
}

- (id)newVertexShaderDebugInfo
{
  return [(MTLRenderPipelineStateSPI *)self->_baseObject newVertexShaderDebugInfo];
}

- (id)newVertexIntersectionFunctionTableWithDescriptor:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  baseObject = self->_baseObject;
  id v11 = [v5 copy];
  id v12 = [(MTLRenderPipelineStateSPI *)baseObject newVertexIntersectionFunctionTableWithDescriptor:v11];

  id v13 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:v12 withDescriptor:v5];

  if (v12) {
    id v14 = [[CaptureMTLIntersectionFunctionTable alloc] initWithBaseObject:v12 captureRenderPipelineState:self descriptor:v13];
  }
  else {
    id v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLIntersectionFunctionTable *)v14 traceStream]);
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15441;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v26, v12);
  uint64_t v20 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLIntersectionFunctionTable *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v26, v13);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  uint64_t *v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v14;
}

- (id)newTileIntersectionFunctionTableWithDescriptor:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  baseObject = self->_baseObject;
  id v11 = [v5 copy];
  id v12 = [(MTLRenderPipelineStateSPI *)baseObject newTileIntersectionFunctionTableWithDescriptor:v11];

  id v13 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:v12 withDescriptor:v5];

  if (v12) {
    id v14 = [[CaptureMTLIntersectionFunctionTable alloc] initWithBaseObject:v12 captureRenderPipelineState:self descriptor:v13];
  }
  else {
    id v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLIntersectionFunctionTable *)v14 traceStream]);
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15442;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v26, v12);
  uint64_t v20 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLIntersectionFunctionTable *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v26, v13);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  uint64_t *v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v14;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3 stage:(unint64_t)a4
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  traceContext = self->_traceContext;
  id v7 = a3;
  long long v28 = (unint64_t)traceContext;
  *(void *)&long long v29 = 0;
  *((void *)&v29 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  uint64_t v9 = v8;
  uint64_t v10 = *v8;
  *uint64_t v8 = v11;
  *(void *)&long long v30 = v10;
  BYTE8(v30) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v30 + 9) = 16400;
  *(_DWORD *)((char *)&v30 + 11) = 0;
  HIBYTE(v30) = 0;
  baseObject = self->_baseObject;
  id v13 = [v7 copy];
  id v14 = [(MTLRenderPipelineStateSPI *)baseObject newIntersectionFunctionTableWithDescriptor:v13 stage:a4];

  uint64_t v15 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:v14 withDescriptor:v7];

  if (v14) {
    char v16 = [[CaptureMTLIntersectionFunctionTable alloc] initWithBaseObject:v14 captureRenderPipelineState:self descriptor:v15];
  }
  else {
    char v16 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v28, (uint64_t)[(CaptureMTLIntersectionFunctionTable *)v16 traceStream]);
  uint64_t v17 = v29;
  *(_DWORD *)(v29 + 8) = -15462;
  char v18 = BYTE9(v30);
  if (BYTE9(v30) > 0x20uLL)
  {
    uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 24);
    uint64_t v21 = BYTE10(v30);
    ++BYTE10(v30);
    uint64_t v19 = GTTraceMemPool_allocateBytes(v20, *((uint64_t *)&v29 + 1), v21 | 0x2000000000) + 16;
    char v18 = v21;
  }
  else
  {
    uint64_t v19 = (char *)(v17 + BYTE9(v30));
    BYTE9(v30) += 32;
  }
  *(unsigned char *)(v17 + 13) = v18;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v28, v14);
  uint64_t v22 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v22) {
    unint64_t var0 = v22->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  char v24 = [(CaptureMTLIntersectionFunctionTable *)v16 traceStream];
  if (v24) {
    unint64_t v25 = v24->var0;
  }
  else {
    unint64_t v25 = 0;
  }
  char v26 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v28, v15);
  *(void *)uint64_t v19 = var0;
  *((void *)v19 + 1) = v25;
  *((void *)v19 + 2) = a4;
  v19[24] = v26;
  *(_DWORD *)(v19 + 25) = 0;
  *((_DWORD *)v19 + 7) = 0;
  *uint64_t v9 = v30;
  *((unsigned char *)v9 + 8) = BYTE8(v30);
  *(unsigned char *)(v29 + 15) |= 8u;

  return v16;
}

- (id)newFragmentShaderDebugInfo
{
  return [(MTLRenderPipelineStateSPI *)self->_baseObject newFragmentShaderDebugInfo];
}

- (id)newFragmentIntersectionFunctionTableWithDescriptor:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  traceContext = self->_traceContext;
  id v5 = a3;
  long long v26 = (unint64_t)traceContext;
  *(void *)&long long v27 = 0;
  *((void *)&v27 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v7 = v6;
  uint64_t v8 = *v6;
  uint64_t *v6 = v9;
  *(void *)&long long v28 = v8;
  BYTE8(v28) = *((unsigned char *)v6 + 8);
  *(_WORD *)((char *)&v28 + 9) = 16400;
  *(_DWORD *)((char *)&v28 + 11) = 0;
  HIBYTE(v28) = 0;
  baseObject = self->_baseObject;
  id v11 = [v5 copy];
  id v12 = [(MTLRenderPipelineStateSPI *)baseObject newFragmentIntersectionFunctionTableWithDescriptor:v11];

  id v13 = [(CaptureMTLDevice *)self->_captureDevice dummyEncodeIntersectionFunctionTableIntoArgumentBufferForResourceIndex:v12 withDescriptor:v5];

  if (v12) {
    id v14 = [[CaptureMTLIntersectionFunctionTable alloc] initWithBaseObject:v12 captureRenderPipelineState:self descriptor:v13];
  }
  else {
    id v14 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v26, (uint64_t)[(CaptureMTLIntersectionFunctionTable *)v14 traceStream]);
  uint64_t v15 = v27;
  *(_DWORD *)(v27 + 8) = -15443;
  char v16 = BYTE9(v28);
  if (BYTE9(v28) > 0x28uLL)
  {
    uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 24);
    uint64_t v19 = BYTE10(v28);
    ++BYTE10(v28);
    uint64_t v17 = GTTraceMemPool_allocateBytes(v18, *((uint64_t *)&v27 + 1), v19 | 0x1800000000) + 16;
    char v16 = v19;
  }
  else
  {
    uint64_t v17 = (char *)(v15 + BYTE9(v28));
    BYTE9(v28) += 24;
  }
  *(unsigned char *)(v15 + 13) = v16;
  SaveMTLIntersectionFunctionTableInfo((uint64_t)&v26, v12);
  uint64_t v20 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v20) {
    unint64_t var0 = v20->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  uint64_t v22 = [(CaptureMTLIntersectionFunctionTable *)v14 traceStream];
  if (v22) {
    unint64_t v23 = v22->var0;
  }
  else {
    unint64_t v23 = 0;
  }
  char v24 = SaveMTLIntersectionFunctionTableDescriptor((uint64_t)&v26, v13);
  *(void *)uint64_t v17 = var0;
  *((void *)v17 + 1) = v23;
  v17[16] = v24;
  *(_DWORD *)(v17 + 17) = 0;
  *((_DWORD *)v17 + 5) = 0;
  uint64_t *v7 = v28;
  *((unsigned char *)v7 + 8) = BYTE8(v28);
  *(unsigned char *)(v27 + 15) |= 8u;

  return v14;
}

- (id)meshFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderPipelineState_meshFunctionHandleWithFunction", (uint64_t)"Mesh shaders with Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  v6 = [v4 baseObject];

  id v7 = [(MTLRenderPipelineStateSPI *)baseObject meshFunctionHandleWithFunction:v6];

  return v7;
}

- (unint64_t)imageblockMemoryLengthForDimensions:(id *)a3
{
  baseObject = self->_baseObject;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a3;
  return (unint64_t)[(MTLRenderPipelineStateSPI *)baseObject imageblockMemoryLengthForDimensions:&v5];
}

- (unsigned)getVertexShaderTelemetryID
{
  return [(MTLRenderPipelineStateSPI *)self->_baseObject getVertexShaderTelemetryID];
}

- (unsigned)getFragmentShaderTelemetryID
{
  return [(MTLRenderPipelineStateSPI *)self->_baseObject getFragmentShaderTelemetryID];
}

- (id)functionHandleWithFunction:(id)a3 stage:(unint64_t)a4
{
  id v6 = a3;
  baseObject = self->_baseObject;
  uint64_t v8 = [v6 baseObject];
  uint64_t v9 = [(MTLRenderPipelineStateSPI *)baseObject functionHandleWithFunction:v8 stage:a4];

  id v32 = 0;
  if (!v9)
  {
    id v11 = 0;
    goto LABEL_5;
  }
  unsigned __int8 v10 = [(CaptureMTLRenderPipelineState *)self newFunctionHandle:&v32 associatedWithBaseFunctionHandle:v9 captureFunction:v6];
  id v11 = v32;
  if (v10)
  {
LABEL_5:
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    traceContext = self->_traceContext;
    objc_msgSend(v11, "traceStream", 0);
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v29);
    uint64_t v14 = v30;
    *(_DWORD *)(v30 + 8) = -15463;
    char v15 = BYTE9(v31);
    if (BYTE9(v31) > 0x20uLL)
    {
      uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 24);
      uint64_t v18 = BYTE10(v31);
      ++BYTE10(v31);
      char v16 = GTTraceMemPool_allocateBytes(v17, *((uint64_t *)&v30 + 1), v18 | 0x2000000000) + 16;
      char v15 = v18;
    }
    else
    {
      char v16 = (char *)(v14 + BYTE9(v31));
      BYTE9(v31) += 32;
    }
    *(unsigned char *)(v14 + 13) = v15;
    uint64_t v19 = [(CaptureMTLRenderPipelineState *)self traceStream];
    if (v19) {
      unint64_t var0 = v19->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v21 = (uint64_t *)[v32 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    unint64_t v23 = (uint64_t *)[v6 traceStream];
    if (v23) {
      uint64_t v24 = *v23;
    }
    else {
      uint64_t v24 = 0;
    }
    *(void *)char v16 = var0;
    *((void *)v16 + 1) = v22;
    *((void *)v16 + 2) = v24;
    *((void *)v16 + 3) = a4;
    s();
    *(void *)uint64_t v25 = v26;
    *(unsigned char *)(v25 + 8) = BYTE8(v31);
    *(unsigned char *)(v30 + 15) |= 8u;
    id v12 = v32;
    goto LABEL_18;
  }
  id v12 = v32;
LABEL_18:
  long long v27 = v12;

  return v27;
}

- (id)fragmentFunctionHandleWithFunction:(id)a3
{
  id v4 = a3;
  baseObject = self->_baseObject;
  id v6 = [v4 baseObject];
  id v7 = [(MTLRenderPipelineStateSPI *)baseObject fragmentFunctionHandleWithFunction:v6];

  id v30 = 0;
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_5;
  }
  unsigned __int8 v8 = [(CaptureMTLRenderPipelineState *)self newFunctionHandle:&v30 associatedWithBaseFunctionHandle:v7 captureFunction:v4];
  id v9 = v30;
  if (v8)
  {
LABEL_5:
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    traceContext = self->_traceContext;
    objc_msgSend(v9, "traceStream", 0);
    GTTraceContext_pushEncoderWithStream((uint64_t)traceContext, (uint64_t)&v27);
    uint64_t v12 = v28;
    *(_DWORD *)(v28 + 8) = -15444;
    char v13 = BYTE9(v29);
    if (BYTE9(v29) > 0x28uLL)
    {
      uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 24);
      uint64_t v16 = BYTE10(v29);
      ++BYTE10(v29);
      uint64_t v14 = GTTraceMemPool_allocateBytes(v15, *((uint64_t *)&v28 + 1), v16 | 0x1800000000) + 16;
      char v13 = v16;
    }
    else
    {
      uint64_t v14 = (char *)(v12 + BYTE9(v29));
      BYTE9(v29) += 24;
    }
    *(unsigned char *)(v12 + 13) = v13;
    uint64_t v17 = [(CaptureMTLRenderPipelineState *)self traceStream];
    if (v17) {
      unint64_t var0 = v17->var0;
    }
    else {
      unint64_t var0 = 0;
    }
    uint64_t v19 = (uint64_t *)[v30 traceStream];
    if (v19) {
      uint64_t v20 = *v19;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = (uint64_t *)[v4 traceStream];
    if (v21) {
      uint64_t v22 = *v21;
    }
    else {
      uint64_t v22 = 0;
    }
    *(void *)uint64_t v14 = var0;
    *((void *)v14 + 1) = v20;
    *((void *)v14 + 2) = v22;
    s();
    *(void *)uint64_t v23 = v24;
    *(unsigned char *)(v23 + 8) = BYTE8(v29);
    *(unsigned char *)(v28 + 15) |= 8u;
    id v10 = v30;
    goto LABEL_18;
  }
  id v10 = v30;
LABEL_18:
  uint64_t v25 = v10;

  return v25;
}

- (void)dealloc
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  GTTraceContext_pushEncoderWithStream((uint64_t)self->_traceContext, (uint64_t)&v13);
  uint64_t v3 = v14;
  *(_DWORD *)(v14 + 8) = -16242;
  char v4 = BYTE9(v15);
  if (BYTE9(v15) > 0x38uLL)
  {
    uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 24);
    uint64_t v7 = BYTE10(v15);
    ++BYTE10(v15);
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = GTTraceMemPool_allocateBytes(v6, *((uint64_t *)&v14 + 1), v7 | 0x800000000) + 16;
    char v4 = v7;
  }
  else
  {
    $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = (char *)(v3 + BYTE9(v15));
    BYTE9(v15) += 8;
  }
  *(unsigned char *)(v3 + 13) = v4;
  unsigned __int8 v8 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v8) {
    unint64_t var0 = v8->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  *(void *)$F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = var0;
  s();
  *(void *)uint64_t v10 = v11;
  *(unsigned char *)(v10 + 8) = BYTE8(v15);
  *(unsigned char *)(v14 + 15) |= 8u;
  GTTraceContext_closeStream((uint64_t)self->_traceContext, &self->_traceStream->var0);
  v12.receiver = self;
  v12.super_class = (Class)CaptureMTLRenderPipelineState;
  [(CaptureMTLRenderPipelineState *)&v12 dealloc];
}

- (unint64_t)uniqueIdentifier
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject uniqueIdentifier];
}

- (BOOL)threadgroupSizeMatchesTileSize
{
  return [(MTLRenderPipelineStateSPI *)self->_baseObject threadgroupSizeMatchesTileSize];
}

- (int64_t)textureWriteRoundingMode
{
  return (int64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject textureWriteRoundingMode];
}

- (BOOL)supportIndirectCommandBuffers
{
  return [(MTLRenderPipelineStateSPI *)self->_baseObject supportIndirectCommandBuffers];
}

- (int64_t)shaderValidationState
{
  return (int64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject shaderValidationState];
}

- (int64_t)shaderValidation
{
  return (int64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject shaderValidation];
}

- (unint64_t)resourceIndex
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject resourceIndex];
}

- (unint64_t)objectThreadExecutionWidth
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject objectThreadExecutionWidth];
}

- (unint64_t)meshThreadExecutionWidth
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject meshThreadExecutionWidth];
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject maxTotalThreadsPerThreadgroup];
}

- (unint64_t)maxTotalThreadsPerObjectThreadgroup
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject maxTotalThreadsPerObjectThreadgroup];
}

- (unint64_t)maxTotalThreadsPerMeshThreadgroup
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject maxTotalThreadsPerMeshThreadgroup];
}

- (unint64_t)maxTotalThreadgroupsPerMeshGrid
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject maxTotalThreadgroupsPerMeshGrid];
}

- (NSString)label
{
  return (NSString *)[(MTLRenderPipelineStateSPI *)self->_baseObject label];
}

- (unint64_t)imageblockSampleLength
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject imageblockSampleLength];
}

- (MTLResourceID)gpuResourceID
{
  return (MTLResourceID)[(MTLRenderPipelineStateSPI *)self->_baseObject gpuResourceID];
}

- (unint64_t)gpuHandle
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject gpuHandle];
}

- (unint64_t)gpuAddress
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject gpuAddress];
}

- (unsigned)explicitVisibilityGroupID
{
  return [(MTLRenderPipelineStateSPI *)self->_baseObject explicitVisibilityGroupID];
}

- (MTLDevice)device
{
  return (MTLDevice *)self->_captureDevice;
}

- (unint64_t)allocatedSize
{
  return (unint64_t)[(MTLRenderPipelineStateSPI *)self->_baseObject allocatedSize];
}

- (BOOL)conformsToProtocol:(id)a3
{
  baseObject = self->_baseObject;
  char v4 = (__objc2_prot *)a3;
  unsigned __int8 v5 = [(MTLRenderPipelineStateSPI *)baseObject conformsToProtocol:v4];

  if (&OBJC_PROTOCOL___CaptureMTLObject == v4) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return CaptureRespondsToSelector((uint64_t)self->_baseObject, a3);
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)CaptureMTLRenderPipelineState;
  uint64_t v3 = [(CaptureMTLRenderPipelineState *)&v7 description];
  char v4 = [(MTLRenderPipelineStateSPI *)self->_baseObject description];
  unsigned __int8 v5 = +[NSString stringWithFormat:@"%@ -> %@", v3, v4];

  return (NSString *)v5;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_baseObject;
}

- (unint64_t)streamReference
{
  traceStream = self->_traceStream;
  if (traceStream) {
    return traceStream->var0;
  }
  else {
    return 0;
  }
}

- (GTTraceStream)traceStream
{
  return self->_traceStream;
}

- (GTTraceContext)traceContext
{
  return self->_traceContext;
}

- (void)touch
{
  traceStream = self->_traceStream;
  uint64_t v3 = mach_absolute_time();
  if (traceStream)
  {
    unint64_t v4 = atomic_load(&traceStream[1].var1);
    unint64_t v5 = v4;
    do
    {
      atomic_compare_exchange_strong((atomic_ullong *volatile)&traceStream[1].var1, &v5, v4 & 0x1F | v3 & 0xFFFFFFFFFFFFFFE0);
      BOOL v6 = v5 == v4;
      unint64_t v4 = v5;
    }
    while (!v6);
  }
}

- (id)originalObject
{
  return DEVICEOBJECT(self->_baseObject);
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 fragmentAdditionalBinaryFunctions:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderPipelineState_newRenderPipelineStateWithAdditionalBinaryFunctions_fragmentAdditionalBinaryFunctions_error", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  uint64_t v11 = unwrapNSArray(v9);

  objc_super v12 = unwrapNSArray(v8);

  id v13 = [(MTLRenderPipelineStateSPI *)baseObject newRenderPipelineStateWithAdditionalBinaryFunctions:v11 fragmentAdditionalBinaryFunctions:v12 error:a5];
  if (v13) {
    long long v14 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v13 captureRenderPipelineState:self additionalBinaryFunctions:0];
  }
  else {
    long long v14 = 0;
  }

  return v14;
}

- (id)newTileRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderPipelineState_newTileRenderPipelineStateWithAdditionalBinaryFunctions_error", (uint64_t)"Binary Linking", 0, 0);
  baseObject = self->_baseObject;
  id v8 = unwrapNSArray(v6);

  id v9 = [(MTLRenderPipelineStateSPI *)baseObject newTileRenderPipelineStateWithAdditionalBinaryFunctions:v8 error:a4];
  if (v9) {
    uint64_t v10 = [[CaptureMTLRenderPipelineState alloc] initWithBaseObject:v9 captureRenderPipelineState:self additionalBinaryFunctions:0];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)newRenderPipelineStateWithAdditionalBinaryFunctions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  traceContext = self->_traceContext;
  long long v31 = (unint64_t)traceContext;
  *(void *)&long long v32 = 0;
  *((void *)&v32 + 1) = atomic_fetch_add((atomic_ullong *volatile)&traceContext->var2, 1uLL);
  s();
  id v9 = v8;
  uint64_t v10 = *v8;
  *id v8 = v11;
  *(void *)&long long v33 = v10;
  BYTE8(v33) = *((unsigned char *)v8 + 8);
  *(_WORD *)((char *)&v33 + 9) = 16400;
  *(_DWORD *)((char *)&v33 + 11) = 0;
  HIBYTE(v33) = 0;
  baseObject = self->_baseObject;
  id v13 = unwrapMTLRenderPipelineFunctionsDescriptor(v6);
  id v14 = [(MTLRenderPipelineStateSPI *)baseObject newRenderPipelineStateWithAdditionalBinaryFunctions:v13 error:a4];

  if (v14)
  {
    long long v15 = [CaptureMTLRenderPipelineState alloc];
    id v16 = [v6 copy];
    uint64_t v17 = [(CaptureMTLRenderPipelineState *)v15 initWithBaseObject:v14 captureRenderPipelineState:self additionalBinaryFunctions:v16];
  }
  else
  {
    uint64_t v17 = 0;
  }
  GTTraceEncoder_setStream((uint64_t *)&v31, (uint64_t)[(CaptureMTLRenderPipelineState *)v17 traceStream]);
  [(CaptureMTLRenderPipelineState *)v17 setDescriptor:self->_descriptor];
  [(CaptureMTLRenderPipelineState *)v17 setReflection:self->_reflection];
  uint64_t v18 = v32;
  *(_DWORD *)(v32 + 8) = -15461;
  char v19 = BYTE9(v33);
  if (BYTE9(v33) > 0x20uLL)
  {
    uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 24);
    uint64_t v22 = BYTE10(v33);
    ++BYTE10(v33);
    uint64_t v20 = GTTraceMemPool_allocateBytes(v21, *((uint64_t *)&v32 + 1), v22 | 0x2000000000) + 16;
    char v19 = v22;
  }
  else
  {
    uint64_t v20 = (char *)(v18 + BYTE9(v33));
    BYTE9(v33) += 32;
  }
  *(unsigned char *)(v18 + 13) = v19;
  reflection = self->_reflection;
  uint64_t v24 = LoadDynamicLibrariesForRenderPipelineDescriptor(self->_descriptor);
  SaveMTLRenderPipelineReflection((uint64_t)&v31, v17, reflection, v24);

  uint64_t v25 = [(CaptureMTLRenderPipelineState *)self traceStream];
  if (v25) {
    unint64_t var0 = v25->var0;
  }
  else {
    unint64_t var0 = 0;
  }
  long long v27 = [(CaptureMTLRenderPipelineState *)v17 traceStream];
  if (!v27)
  {
    unint64_t v28 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  unint64_t v28 = v27->var0;
  if (a4) {
LABEL_12:
  }
    a4 = (id *)*a4;
LABEL_13:
  char v29 = SaveMTLRenderPipelineFunctionsDescriptor((uint64_t)&v31, v6);
  *(void *)uint64_t v20 = var0;
  *((void *)v20 + 1) = v28;
  *((void *)v20 + 2) = a4;
  v20[24] = v29;
  *(_DWORD *)(v20 + 25) = 0;
  *((_DWORD *)v20 + 7) = 0;
  *id v9 = v33;
  *((unsigned char *)v9 + 8) = BYTE8(v33);
  *(unsigned char *)(v32 + 15) |= 8u;

  return v17;
}

- (id)newObjectIntersectionFunctionTableWithDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderPipelineState_newObjectIntersectionFunctionTableWithDescriptor", (uint64_t)"Mesh Shaders with Raytracing", 0, 0);
  baseObject = self->_baseObject;
  id v6 = [v4 copy];
  id v7 = [(MTLRenderPipelineStateSPI *)baseObject newObjectIntersectionFunctionTableWithDescriptor:v6];

  if (v7) {
    id v8 = [[CaptureMTLIntersectionFunctionTable alloc] initWithBaseObject:v7 captureRenderPipelineState:self descriptor:v4];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)newMeshIntersectionFunctionTableWithDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderPipelineState_newMeshIntersectionFunctionTableWithDescriptor", (uint64_t)"Mesh Shaders with Raytracing", 0, 0);
  baseObject = self->_baseObject;
  id v6 = [v4 copy];
  id v7 = [(MTLRenderPipelineStateSPI *)baseObject newMeshIntersectionFunctionTableWithDescriptor:v6];

  if (v7) {
    id v8 = [[CaptureMTLIntersectionFunctionTable alloc] initWithBaseObject:v7 captureRenderPipelineState:self descriptor:v4];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)newVisibleFunctionTableFromObjectStageWithDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromObjectStageWithDescriptor", (uint64_t)"Mesh Shaders with Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  id v6 = [v4 copy];
  id v7 = [(MTLRenderPipelineStateSPI *)baseObject newVisibleFunctionTableFromObjectStageWithDescriptor:v6];

  if (v7) {
    id v8 = [[CaptureMTLVisibleFunctionTable alloc] initWithBaseObject:v7 captureRenderPipelineState:self descriptor:v4];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (id)newVisibleFunctionTableFromMeshStageWithDescriptor:(id)a3
{
  id v4 = a3;
  GTMTLCaptureManager_notifyUnsupportedFenumWithMsg((uint64_t)"kDYFEMTLRenderPipelineState_newVisibleFunctionTableFromMeshStageWithDescriptor", (uint64_t)"Mesh Shaders with Function Pointers", 0, 0);
  baseObject = self->_baseObject;
  id v6 = [v4 copy];
  id v7 = [(MTLRenderPipelineStateSPI *)baseObject newVisibleFunctionTableFromMeshStageWithDescriptor:v6];

  if (v7) {
    id v8 = [[CaptureMTLVisibleFunctionTable alloc] initWithBaseObject:v7 captureRenderPipelineState:self descriptor:v4];
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)newFunctionHandle:(id *)a3 associatedWithBaseFunctionHandle:(id)a4 captureFunction:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(CaptureMTLRenderPipelineState *)self functionHandleMap];
  uint64_t v11 = [v10 objectForKey:v8];
  id v12 = *a3;
  *a3 = v11;

  id v13 = *a3;
  if (!*a3)
  {
    id v14 = [[CaptureMTLFunctionHandle alloc] initWithBaseObject:v8 captureRenderPipelineState:self captureFunction:v9];
    id v15 = *a3;
    *a3 = v14;

    id v16 = [(CaptureMTLRenderPipelineState *)self functionHandleMap];
    [v16 setObject:*a3 forKey:v8];
  }
  return v13 == 0;
}

- (id)functionHandleMap
{
  functionHandleMap = self->_functionHandleMap;
  if (!functionHandleMap)
  {
    id v4 = (NSMapTable *)[objc_alloc((Class)NSMapTable) initWithKeyOptions:2 valueOptions:0 capacity:8];
    unint64_t v5 = self->_functionHandleMap;
    self->_functionHandleMap = v4;

    functionHandleMap = self->_functionHandleMap;
  }

  return functionHandleMap;
}

- (MTLRenderPipelineState)baseObject
{
  return self->_baseObject;
}

- (void)swapObject:(id)a3
{
  p_baseObject = &self->_baseObject;
  unint64_t v5 = self->_baseObject;
  objc_storeStrong((id *)p_baseObject, *((id *)a3 + 1));
  uint64_t v11 = a3;
  id v6 = (void *)*((void *)a3 + 1);
  *((void *)a3 + 1) = v5;
  id v7 = v5;

  id v8 = p_baseObject[4];
  p_baseObject[4] = (MTLRenderPipelineStateSPI *)v11[5];
  v11[5] = v8;
  id v9 = p_baseObject[4];
  uint64_t v10 = *((void *)v9 + 2);
  *((void *)v9 + 2) = *((void *)v8 + 2);
  *((void *)v8 + 2) = v10;
}

- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 capturePipelineLibrary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CaptureMTLRenderPipelineState;
  id v8 = [(CaptureMTLRenderPipelineState *)&v11 init];
  if (v8)
  {
    id v9 = [v7 device];
    [(CaptureMTLRenderPipelineState *)v8 commonInit:v6 captureDevice:v9];

    objc_storeStrong((id *)&v8->_retainedPipelineLibrary, a4);
  }

  return v8;
}

- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 captureRenderPipelineState:(id)a4 additionalBinaryFunctions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CaptureMTLRenderPipelineState;
  objc_super v11 = [(CaptureMTLRenderPipelineState *)&v14 init];
  if (v11)
  {
    id v12 = [v9 device];
    [(CaptureMTLRenderPipelineState *)v11 commonInit:v8 captureDevice:v12];

    objc_storeStrong((id *)&v11->_capturePipelineState, a4);
    objc_storeStrong((id *)&v11->_additionalBinaryFunctions, a5);
  }

  return v11;
}

- (CaptureMTLRenderPipelineState)initWithBaseObject:(id)a3 captureDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CaptureMTLRenderPipelineState;
  id v8 = [(CaptureMTLRenderPipelineState *)&v11 init];
  id v9 = v8;
  if (v8) {
    [(CaptureMTLRenderPipelineState *)v8 commonInit:v6 captureDevice:v7];
  }

  return v9;
}

- (void)commonInit:(id)a3 captureDevice:(id)a4
{
  id v6 = (MTLRenderPipelineStateSPI *)a3;
  id v7 = (CaptureMTLDevice *)a4;
  baseObject = self->_baseObject;
  self->_baseObject = v6;
  uint64_t v17 = v6;

  captureDevice = self->_captureDevice;
  self->_captureDevice = v7;
  id v10 = v7;

  capturePipelineState = self->_capturePipelineState;
  self->_capturePipelineState = 0;

  id v12 = [(CaptureMTLDevice *)v10 traceContext];
  self->_traceContext = v12;
  id v13 = DEVICEOBJECT(v17);
  self->_traceStream = (GTTraceStream *)GTTraceContext_openStream((uint64_t)v12, (unint64_t)v13, (unint64_t)self);

  additionalBinaryFunctions = self->_additionalBinaryFunctions;
  self->_additionalBinaryFunctions = 0;

  functionHandleMap = self->_functionHandleMap;
  self->_functionHandleMap = 0;

  retainedPipelineLibrary = self->_retainedPipelineLibrary;
  self->_retainedPipelineLibrary = 0;
}

@end