@interface SCNMTLMorphDeformer
+ (uint64_t)canMorph:reuseRenderResourceForMorph:;
+ (uint64_t)supportedOutputsForMorpher:(uint64_t)a1;
+ (unint64_t)requiredInputs;
+ (unint64_t)requiredOutputs;
+ (unint64_t)supportedOutputs;
- (uint64_t)setNextFrameRequiresFullMeshReset;
- (unint64_t)morphIncrementallyWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5;
- (unint64_t)morphSparseWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5;
- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4;
- (void)createSparseIndicesBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 indicesBuffer:(char *)a5 indicesBufferOffset:(unint64_t)a6 indexSize:(unint64_t)a7 originalToFirstDeindexedTable:(unsigned int *)a8 computeContext:(id)a9;
- (void)createVertexBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 vertexBuffer:(char *)a5 vertexBufferOffset:(unint64_t)a6 indicesBuffer:(char *)a7 indicesBufferOffset:(unint64_t)a8 indexSize:(unint64_t)a9 originalToFirstDeindexedTable:(unsigned int *)a10 computeContext:(id)a11;
- (void)dealloc;
- (void)initWithMorpher:(char)a3 outputs:(char)a4 dataKind:(uint64_t)a5 resourceManager:(uint64_t)a6 computeContext:;
- (void)setupMorphTargetsWithComputeContext:(id)a3;
@end

@implementation SCNMTLMorphDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 3;
}

+ (uint64_t)supportedOutputsForMorpher:(uint64_t)a1
{
  self;
  uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial(a2);
  if (!C3DMorphGetMorphNormals(OverrideMaterial)) {
    return 1;
  }
  if (C3DPreferencesGetBool(9)) {
    return 1;
  }
  return 3;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (void)initWithMorpher:(char)a3 outputs:(char)a4 dataKind:(uint64_t)a5 resourceManager:(uint64_t)a6 computeContext:
{
  if (!a1) {
    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)SCNMTLMorphDeformer;
  v11 = objc_msgSendSuper2(&v14, sel_init);
  if (v11)
  {
    if (a2) {
      CFTypeRef v12 = CFRetain(a2);
    }
    else {
      CFTypeRef v12 = 0;
    }
    v11[1] = v12;
    *((unsigned char *)v11 + 32) = (a3 & 2) != 0;
    *((unsigned char *)v11 + 16) = a4;
    v11[3] = a5;
    *((_DWORD *)v11 + 14) = -1;
    [v11 setupMorphTargetsWithComputeContext:a6];
  }
  return v11;
}

- (void)dealloc
{
  morpher = self->_morpher;
  if (morpher)
  {
    CFRelease(morpher);
    self->_morpher = 0;
  }

  free(self->_morphTargets);
  v4.receiver = self;
  v4.super_class = (Class)SCNMTLMorphDeformer;
  [(SCNMTLMorphDeformer *)&v4 dealloc];
}

- (uint64_t)setNextFrameRequiresFullMeshReset
{
  if (result) {
    *(_DWORD *)(result + 56) = -1;
  }
  return result;
}

- (void)setupMorphTargetsWithComputeContext:(id)a3
{
  uint64_t BaseGeometry = C3DMorpherGetBaseGeometry((uint64_t)self->_morpher);
  BOOL v6 = C3DGeometryUsesDeformerBasedDynamicMesh(BaseGeometry);
  if (v6)
  {
    uint64_t PositionSourceForDeformerBasedDynamicMesh = C3DGeometryCreatePositionSourceForDeformerBasedDynamicMesh(BaseGeometry);
    if (PositionSourceForDeformerBasedDynamicMesh)
    {
      CFTypeRef cf = (CFTypeRef)PositionSourceForDeformerBasedDynamicMesh;
LABEL_11:
      uint64_t v9 = 0;
      goto LABEL_12;
    }
    v10 = scn_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_10:
    CFTypeRef cf = 0;
    goto LABEL_11;
  }
  uint64_t Mesh = C3DGeometryGetMesh(BaseGeometry);
  if (!Mesh)
  {
    v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]3(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_10;
  }
  uint64_t v9 = Mesh;
  CFTypeRef cf = 0;
LABEL_12:
  uint64_t OverrideMaterial = C3DGeometryGetOverrideMaterial((uint64_t)self->_morpher);
  if (!OverrideMaterial)
  {
    v27 = scn_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]1(v27, v28, v29, v30, v31, v32, v33, v34);
    }
  }
  BOOL v35 = C3DMorphGetCalculationMode(OverrideMaterial) == 0;
  char IsUsingSparseTargets = C3DMorphIsUsingSparseTargets(OverrideMaterial);
  if (IsUsingSparseTargets)
  {
    unsigned __int8 finalMeshDataKind = 0;
    signed __int16 v38 = 44;
    signed __int16 v39 = 23;
    unint64_t v40 = 1;
  }
  else
  {
    unint64_t v40 = 0;
    unsigned __int8 finalMeshDataKind = self->_finalMeshDataKind;
    signed __int16 v39 = 9;
    signed __int16 v38 = 9;
  }
  if (!self->_morphNormals) {
    signed __int16 v39 = 0;
  }
  self->_unint64_t morphKind = v40;
  self->_dataKindForComputeKernel = finalMeshDataKind;
  self->_basePositionDataType = 9;
  self->_baseNormalDataType = v39;
  self->_morphTargetPositionDataType = v38;
  self->_morphTargetNormalDataType = v39;
  CFArrayRef v166 = (const __CFArray *)C3DGeometryGetOverrideMaterial(OverrideMaterial);
  uint64_t Count = CFArrayGetCount(v166);
  if (!Count)
  {
    v42 = scn_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]0(v42, v43, v44, v45, v46, v47, v48, v49);
    }
  }
  v184[0] = 0;
  int v50 = self->_finalMeshDataKind;
  v173 = self;
  id v171 = a3;
  uint64_t v164 = OverrideMaterial;
  if (v6)
  {
    if (v50 != self->_dataKindForComputeKernel) {
      -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.7();
    }
    v51 = 0;
    uint64_t PositionDeindexedToOriginalTable = 0;
    uint64_t PositionOriginalToFirstDeindexedTable = 0;
    uint64_t v53 = (uint64_t)cf;
    SourceWithSemanticAtIndex = cf;
  }
  else
  {
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(v9, 0, 0, v50);
    uint64_t PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable(v9, v184);
    uint64_t PositionOriginalToFirstDeindexedTable = C3DMeshGetPositionOriginalToFirstDeindexedTable(v9);
    v55 = C3DMeshGetSourceWithSemanticAtIndex(v9, 0, 0, self->_dataKindForComputeKernel);
    if (!v55)
    {
      v56 = scn_default_log();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.9(v56, v57, v58, v59, v60, v61, v62, v63);
      }
    }
    if (self->_morphNormals)
    {
      v64 = C3DMeshGetSourceWithSemanticAtIndex(v9, 1, 0, self->_dataKindForComputeKernel);
      if (v64)
      {
        v51 = v64;
      }
      else
      {
        v51 = (const void *)C3DCreateNormalsWithMesh(v9, self->_dataKindForComputeKernel, 0);
        if (!v51)
        {
          v65 = scn_default_log();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT)) {
            -[SCNMTLDeformerStack setupInitialBuffersWithBasePositionSourceProvider:baseNormalSourceProvider:baseTangentSourceProvider:info:](v65, v66, v67, v68, v69, v70, v71, v72);
          }
        }
        CFAutorelease(v51);
      }
    }
    else
    {
      v51 = 0;
    }
    uint64_t v53 = (uint64_t)v55;
  }
  v173->_vertexCountForComputeKernel = C3DMeshSourceGetCount(v53);
  uint64_t v73 = (uint64_t)SourceWithSemanticAtIndex;
  v74 = v173;
  v173->_finalMeshVertexuint64_t Count = C3DMeshSourceGetCount(v73);
  v75 = malloc_type_malloc(40 * Count, 0x10600401818AB88uLL);
  v180[0] = MEMORY[0x263EF8330];
  v180[1] = 3221225472;
  v180[2] = __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke;
  v180[3] = &unk_264006960;
  char v182 = IsUsingSparseTargets;
  v180[4] = v173;
  v180[5] = v9;
  v162 = v51;
  uint64_t v163 = v53;
  v180[6] = v53;
  v180[7] = v51;
  int v181 = v184[0];
  BOOL v183 = v35;
  v180[8] = PositionDeindexedToOriginalTable;
  v180[9] = v75;
  C3DCFArrayApplyBlock(v166, (uint64_t)v180);
  morphTargetuint64_t Count = v173->_morphTargetCount;
  if (morphTargetCount)
  {
    v173->_morphTargets = ($4C9AEC9213DCD68D17C013290EF3C758 *)malloc_type_malloc(32 * morphTargetCount, 0x100004017768742uLL);
    uint64_t v77 = C3DSizeOfBaseType(v173->_morphTargetPositionDataType);
    uint64_t v78 = C3DSizeOfBaseType(v173->_morphTargetNormalDataType);
    v79 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v173->_resourceManager);
    if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v79)) {
      unint64_t v80 = (v78 + ((v77 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    else {
      unint64_t v80 = v78 + v77;
    }
    unint64_t v172 = v80;
    unsigned int v81 = v173->_vertexCountForComputeKernel - 1;
    uint64_t v82 = 1;
    if (v81 > 0xFF) {
      uint64_t v82 = 2;
    }
    unsigned int v83 = HIWORD(v81);
    if (HIWORD(v81)) {
      uint64_t v82 = 4;
    }
    uint64_t v167 = v82;
    SCNMTLDataTypeFromC3DBaseType(v173->_morphTargetPositionDataType);
    v161 = (char *)v75;
    if (v173->_morphTargetCount)
    {
      unint64_t v84 = 0;
      size_t v85 = 0;
      uint64_t v86 = 0;
      if (v83) {
        char v87 = 2;
      }
      else {
        char v87 = v81 > 0xFF;
      }
      v88 = v75 + 4;
      do
      {
        uint64_t Alignment = MTLDataTypeGetAlignment();
        uint64_t v90 = *v88;
        if (*v88 != v173->_vertexCountForComputeKernel)
        {
          uint64_t v91 = MTLDataTypeGetAlignment();
          size_t v85 = ((v85 + v91 - 1) & -v91) + (*v88 << v87);
        }
        uint64_t v86 = ((v86 + Alignment - 1) & -Alignment) + v90 * v172;
        ++v84;
        v88 += 5;
      }
      while (v84 < v173->_morphTargetCount);
      v170 = malloc_type_malloc(v86, 0xA8BA8771uLL);
      if (v85) {
        v169 = malloc_type_malloc(v85, 0x9BCDAEEFuLL);
      }
      else {
        v169 = 0;
      }
      unsigned int v83 = HIWORD(v81);
    }
    else
    {
      v169 = 0;
      v170 = malloc_type_malloc(0, 0xA8BA8771uLL);
      size_t v85 = 0;
      uint64_t v86 = 0;
    }
    uint64_t v160 = v85;
    if (v173->_morphTargetCount)
    {
      uint64_t v92 = 0;
      unint64_t v93 = 0;
      uint64_t v94 = 0;
      uint64_t v95 = 0;
      if (v83) {
        char v96 = 2;
      }
      else {
        char v96 = v81 > 0xFF;
      }
      v97 = v161;
      do
      {
        v98 = &v74->_morphTargets[v92];
        v98->var1 = *(_DWORD *)v97;
        uint64_t v99 = MTLDataTypeGetAlignment();
        uint64_t v100 = (v95 + v99 - 1) & -v99;
        uint64_t v101 = MTLDataTypeGetAlignment();
        uint64_t v102 = (v94 + v101 - 1) & -v101;
        [(SCNMTLMorphDeformer *)v74 createVertexBufferForMorphTarget:v98 withSetupTarget:v97 vertexBuffer:v170 vertexBufferOffset:v100 indicesBuffer:v169 indicesBufferOffset:v102 indexSize:v167 originalToFirstDeindexedTable:PositionOriginalToFirstDeindexedTable computeContext:v171];
        uint64_t v103 = *((void *)v97 + 4);
        if (v103 == v74->_vertexCountForComputeKernel) {
          uint64_t v104 = 0;
        }
        else {
          uint64_t v104 = v103 << v96;
        }
        CFRelease(*((CFTypeRef *)v97 + 2));
        v105 = (const void *)*((void *)v97 + 3);
        if (v105)
        {
          CFRelease(v105);
          *((void *)v97 + 3) = 0;
        }
        uint64_t v95 = v100 + v103 * v172;
        uint64_t v94 = v104 + v102;
        v97 += 40;
        ++v93;
        v74 = v173;
        ++v92;
      }
      while (v93 < v173->_morphTargetCount);
    }
    else
    {
      uint64_t v95 = 0;
      uint64_t v94 = 0;
    }
    free(v161);
    a3 = v171;
    v74->_morphTargetsVertexBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v74->_resourceManager, (uint64_t)v170, v86, (void *)[v171 currentBlitEncoder]);
    free(v170);
    if (v169)
    {
      v74->_morphTargetsSparseIndicesBuffer = (MTLBuffer *)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)v74->_resourceManager, (uint64_t)v169, v160, (void *)[v171 currentBlitEncoder]);
      free(v169);
    }
    if (v95 != v86)
    {
      v106 = scn_default_log();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.6(v106, v107, v108, v109, v110, v111, v112, v113);
      }
    }
    if (v94 != v160)
    {
      v114 = scn_default_log();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:].cold.5(v114, v115, v116, v117, v118, v119, v120, v121);
      }
    }
  }
  else
  {
    free(v75);
  }
  uint64_t v178 = 0;
  uint64_t v179 = 0;
  uint64_t v177 = 0;
  LOBYTE(v159) = 1;
  v74->_baseBufferForComputeKernel = (MTLBuffer *)[a3 newBufferForDataKind:v74->_dataKindForComputeKernel positionSource:v163 normalSource:v162 positionDataType:v74->_basePositionDataType normalDataType:v74->_baseNormalDataType forStageInputOutputDescriptor:1 usePrivateStorageMode:v159 outStride:&v179 outPositionOffset:&v178 outNormalOffset:&v177];
  unint64_t v122 = C3DSizeOfBaseType(v74->_morphTargetPositionDataType);
  uint64_t v123 = C3DSizeOfBaseType(v74->_morphTargetNormalDataType);
  v124 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v74->_resourceManager);
  if (SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v124))
  {
    unint64_t v122 = (v122 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    unint64_t v125 = (v123 + v122 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  }
  else
  {
    unint64_t v125 = v123 + v122;
  }
  if (cf) {
    CFRelease(cf);
  }
  if (C3DMorphGetClearCPUDataAfterUpload(v164)) {
    C3DCFArrayApplyBlock(v166, (uint64_t)&__block_literal_global_36);
  }
  unint64_t morphKind = v74->_morphKind;
  if (!morphKind)
  {
    LOBYTE(v176) = v74->_morphNormals;
    id v128 = objc_alloc_init(MEMORY[0x263F128B0]);
    [v128 setConstantValue:&v176 type:53 withName:@"morphNormal"];
    uint64_t v134 = 78;
    if (!v74->_morphNormals) {
      uint64_t v134 = 45;
    }
    uint64_t v135 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v134);
    id v136 = objc_alloc_init(MEMORY[0x263F12A18]);
    uint64_t v137 = 0;
    do
    {
      uint64_t v138 = v137 + 1;
      v139 = objc_msgSend((id)objc_msgSend(v136, "layouts"), "objectAtIndexedSubscript:", v137 + 1);
      [v139 setStepFunction:5];
      [v139 setStride:v125];
      v140 = objc_msgSend((id)objc_msgSend(v136, "attributes"), "objectAtIndexedSubscript:", v137);
      [v140 setFormat:SCNMTLVertexFormatFromC3DBaseType(v173->_morphTargetPositionDataType)];
      [v140 setOffset:0];
      [v140 setBufferIndex:v137 + 1];
      if ((_BYTE)v176)
      {
        v141 = objc_msgSend((id)objc_msgSend(v136, "attributes"), "objectAtIndexedSubscript:", v137 + 16);
        [v141 setFormat:SCNMTLVertexFormatFromC3DBaseType(v173->_morphTargetNormalDataType)];
        [v141 setOffset:v122];
        [v141 setBufferIndex:v138];
      }
      uint64_t v137 = v138;
    }
    while (v138 != 8);
    v173->_incrementalInitPipeline = (SCNMTLComputePipeline *)[(SCNMTLResourceManager *)v173->_resourceManager computePipelineStateForKernel:@"blend_inc_init_8x_generic" withStageDescriptor:v136 stageDescriptorUpdateBlock:0 constants:v128 constantsHash:v135];
    v173->_incrementalAddPipeline = (SCNMTLComputePipeline *)[(SCNMTLResourceManager *)v173->_resourceManager computePipelineStateForKernel:@"blend_inc_add_8x_generic" withStageDescriptor:v136 stageDescriptorUpdateBlock:0 constants:v128 constantsHash:v135];

    goto LABEL_142;
  }
  if (morphKind == 1)
  {
    uint64_t v175 = 0;
    uint64_t v176 = 0;
    if (!v74->_dataKindForComputeKernel && v74->_finalMeshDataKind == 1 && PositionOriginalToFirstDeindexedTable)
    {
      uint64_t v127 = [a3 currentBlitEncoder];
      v74->_originalToFirstDeindexedTableBuffer = (MTLBuffer *)(id)[a3 originalToFirstDeindexedTableBufferWithBlitEncoder:v127 indexSizeOut:&v176];
      v74->_deindexedToFirstDeindexedTableBuffer = (MTLBuffer *)(id)[a3 deindexedToFirstDeindexedTableBufferWithBlitEncoder:v127 indexSizeOut:&v175];
    }
    BOOL morphNormals = v74->_morphNormals;
    id v128 = objc_alloc_init(MEMORY[0x263F128B0]);
    [v128 setConstantValue:&morphNormals type:53 withName:@"morphNormal"];
    uint64_t v129 = 78;
    if (!v74->_morphNormals) {
      uint64_t v129 = 45;
    }
    uint64_t v130 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v129);
    if (v74->_originalToFirstDeindexedTableBuffer)
    {
      switch(v176)
      {
        case 1:
          char v131 = 0;
          v132 = @"blend_indexed_u8_generic";
          v133 = @"copy_indexed_u8_generic";
          goto LABEL_115;
        case 4:
          char v131 = 0;
          v132 = @"blend_indexed_u32_generic";
          v133 = @"copy_indexed_u32_generic";
          goto LABEL_115;
        case 2:
          char v131 = 0;
          v132 = @"blend_indexed_u16_generic";
          v133 = @"copy_indexed_u16_generic";
LABEL_115:
          id v144 = objc_alloc_init(MEMORY[0x263F12A18]);
          v145 = objc_msgSend((id)objc_msgSend(v144, "layouts"), "objectAtIndexedSubscript:", 1);
          [v145 setStepFunction:5];
          [v145 setStride:v179];
          v146 = objc_msgSend((id)objc_msgSend(v144, "attributes"), "objectAtIndexedSubscript:", 0);
          [v146 setFormat:SCNMTLVertexFormatFromC3DBaseType(v173->_basePositionDataType)];
          [v146 setOffset:v178];
          [v146 setBufferIndex:1];
          if (v173->_morphNormals)
          {
            v147 = objc_msgSend((id)objc_msgSend(v144, "attributes"), "objectAtIndexedSubscript:", 1);
            [v147 setFormat:SCNMTLVertexFormatFromC3DBaseType(v173->_baseNormalDataType)];
            [v147 setOffset:v177];
            [v147 setBufferIndex:1];
          }
          v173->_copyBaseBufferPipeline = (SCNMTLComputePipeline *)[(SCNMTLResourceManager *)v173->_resourceManager computePipelineStateForKernel:v133 withStageDescriptor:v144 stageDescriptorUpdateBlock:0 constants:v128 constantsHash:v130];
          [v144 reset];
          v148 = objc_msgSend((id)objc_msgSend(v144, "layouts"), "objectAtIndexedSubscript:", 1);
          [v148 setStepFunction:5];
          [v148 setStride:v125];
          v149 = objc_msgSend((id)objc_msgSend(v144, "attributes"), "objectAtIndexedSubscript:", 0);
          [v149 setFormat:SCNMTLVertexFormatFromC3DBaseType(v173->_morphTargetPositionDataType)];
          [v149 setOffset:0];
          [v149 setBufferIndex:1];
          if (morphNormals)
          {
            v150 = objc_msgSend((id)objc_msgSend(v144, "attributes"), "objectAtIndexedSubscript:", 1);
            [v150 setFormat:SCNMTLVertexFormatFromC3DBaseType(v173->_morphTargetNormalDataType)];
            [v150 setOffset:v122];
            [v150 setBufferIndex:1];
          }
          v173->_blendDensePipeline = (SCNMTLComputePipeline *)[(SCNMTLResourceManager *)v173->_resourceManager computePipelineStateForKernel:@"blend_generic" withStageDescriptor:v144 stageDescriptorUpdateBlock:0 constants:v128 constantsHash:v130];
          if ((v131 & 1) == 0) {
            v173->_blendDenseIndexedPipeline = (SCNMTLComputePipeline *)[(SCNMTLResourceManager *)v173->_resourceManager computePipelineStateForKernel:v132 withStageDescriptor:v144 stageDescriptorUpdateBlock:0 constants:v128 constantsHash:v130];
          }
          unsigned int v151 = v173->_vertexCountForComputeKernel - 1;
          uint64_t v152 = 1;
          if (v151 > 0xFF) {
            uint64_t v152 = 2;
          }
          BOOL v153 = HIWORD(v151) == 0;
          uint64_t v154 = 4;
          if (v153) {
            uint64_t v154 = v152;
          }
          if (v154 == 1)
          {
            v155 = @"blend_indexed_u8_generic";
          }
          else if (v154 == 4)
          {
            v155 = @"blend_indexed_u32_generic";
          }
          else
          {
            v155 = @"blend_indexed_u16_generic";
          }
          v156 = v173;
          v173->_blendSparsePipeline = (SCNMTLComputePipeline *)[(SCNMTLResourceManager *)v173->_resourceManager computePipelineStateForKernel:v155 withStageDescriptor:v144 stageDescriptorUpdateBlock:0 constants:v128 constantsHash:v130];

          if (v173->_deindexedToFirstDeindexedTableBuffer)
          {
            switch(v175)
            {
              case 1:
                v157 = @"splat_indexed_s8_vertices";
                break;
              case 4:
                v157 = @"splat_indexed_s32_vertices";
                break;
              case 2:
                v157 = @"splat_indexed_s16_vertices";
                break;
              default:
                v158 = scn_default_log();
                if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR)) {
                  -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]();
                }
                v157 = 0;
                v156 = v173;
                break;
            }
            v156->_splatPipeline = (SCNMTLComputePipeline *)[(SCNMTLResourceManager *)v156->_resourceManager computePipelineStateForKernel:v157 constants:v128 constantsHash:v130];
          }
LABEL_142:

          return;
      }
      v143 = scn_default_log();
      if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR)) {
        -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]();
      }
    }
    v132 = 0;
    char v131 = 1;
    v133 = @"copy_generic";
    goto LABEL_115;
  }
  v142 = scn_default_log();
  if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
    -[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]();
  }
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if (C3DGeometryUsesDeformerBasedDynamicMesh(a3))
  {
    uint64_t PositionSourceForDeformerBasedDynamicMesh = (const __C3DMeshSource *)C3DGeometryCreatePositionSourceForDeformerBasedDynamicMesh(v3);
    CFAutorelease(PositionSourceForDeformerBasedDynamicMesh);
    if (*(unsigned char *)(a1 + 84)) {
      __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_2();
    }
    SourceWithSemanticAtIndex = 0;
  }
  else
  {
    uint64_t Mesh = C3DGeometryGetMesh(v3);
    uint64_t PositionSourceForDeformerBasedDynamicMesh = (const __C3DMeshSource *)C3DMeshGetSourceWithSemanticAtIndex(Mesh, 0, 0, 0);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
    {
      SourceWithSemanticAtIndex = (const __C3DMeshSource *)C3DMeshGetSourceWithSemanticAtIndex(Mesh, 1, 0, 0);
      if (!SourceWithSemanticAtIndex)
      {
        SourceWithSemanticAtIndex = (const __C3DMeshSource *)C3DCreateNormalsForMorphTargetWithBaseMesh(Mesh, *(void *)(a1 + 40), 0);
        if (!SourceWithSemanticAtIndex)
        {
          uint64_t v9 = scn_default_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_3(v9, v10, v11, v12, v13, v14, v15, v16);
          }
        }
        CFAutorelease(SourceWithSemanticAtIndex);
      }
    }
    else
    {
      SourceWithSemanticAtIndex = 0;
    }
    int v17 = *(unsigned __int8 *)(a1 + 84);
    if (*(unsigned char *)(a1 + 84) && !PositionSourceForDeformerBasedDynamicMesh)
    {
      if (!C3DMeshGetElementsCount(Mesh)) {
        return;
      }
      int v17 = *(unsigned __int8 *)(a1 + 84);
    }
    if (v17)
    {
      if (*(void *)(*(void *)(a1 + 32) + 40) != 1)
      {
        ElementAtIndex = C3DMeshGetElementAtIndex(Mesh, 0, 0);
        uint64_t Count = C3DMeshSourceGetCount(*(void *)(a1 + 48));
        uint64_t ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(*(void *)(a1 + 40), 0, 0);
        uint64_t PositionSourceForDeformerBasedDynamicMesh = (const __C3DMeshSource *)C3DMeshSourceCreateUnpackedCopy((uint64_t)PositionSourceForDeformerBasedDynamicMesh, (uint64_t)ElementAtIndex, Count, ChannelForSourceWithSemanticAtIndex);
        CFAutorelease(PositionSourceForDeformerBasedDynamicMesh);
        if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
        {
          uint64_t v21 = C3DMeshSourceGetCount(*(void *)(a1 + 56));
          uint64_t v22 = C3DMeshGetChannelForSourceWithSemanticAtIndex(*(void *)(a1 + 40), 1, 0);
          SourceWithSemanticAtIndex = (const __C3DMeshSource *)C3DMeshSourceCreateUnpackedCopy((uint64_t)SourceWithSemanticAtIndex, (uint64_t)ElementAtIndex, v21, v22);
          CFAutorelease(SourceWithSemanticAtIndex);
        }
      }
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 17) == 1 && (uint64_t v23 = *(unsigned int **)(a1 + 64)) != 0)
  {
    CFTypeRef v24 = (CFTypeRef)C3DMeshSourceCreatedDeindexedCopy(PositionSourceForDeformerBasedDynamicMesh, *(_DWORD *)(a1 + 80), v23);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
    {
      CFTypeRef v25 = (CFTypeRef)C3DMeshSourceCreatedDeindexedCopy(SourceWithSemanticAtIndex, *(_DWORD *)(a1 + 80), *(unsigned int **)(a1 + 64));
LABEL_25:
      v26 = v25;
      goto LABEL_27;
    }
  }
  else
  {
    CFTypeRef v24 = CFRetain(PositionSourceForDeformerBasedDynamicMesh);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
    {
      CFTypeRef v25 = CFRetain(SourceWithSemanticAtIndex);
      goto LABEL_25;
    }
  }
  v26 = 0;
LABEL_27:
  if (*(unsigned char *)(a1 + 85))
  {
    uint64_t DeltaSource = C3DMeshSourceCreateDeltaSource(*(void *)(a1 + 48), (uint64_t)v24);
    if (!DeltaSource) {
      return;
    }
    uint64_t v28 = (const void *)DeltaSource;
    CFRelease(v24);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 32))
    {
      uint64_t v29 = C3DMeshSourceCreateDeltaSource(*(void *)(a1 + 56), (uint64_t)v26);
      if (!v29) {
        return;
      }
      uint64_t v30 = (const void *)v29;
      CFRelease(v26);
      v26 = v30;
    }
  }
  else
  {
    uint64_t v28 = v24;
  }
  if (*(void *)(*(void *)(a1 + 32) + 40) != 1)
  {
    unsigned int v53 = C3DMeshSourceGetCount((uint64_t)v28);
    if (*(_DWORD *)(*(void *)(a1 + 32) + 64) != v53)
    {
      v54 = scn_default_log();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
        __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_1(v54, v55, v56, v57, v58, v59, v60, v61);
      }
    }
    uint64_t v62 = v53;
    goto LABEL_51;
  }
  uint64_t Content = C3DMeshSourceGetContent((uint64_t)v28);
  uint64_t v36 = v31;
  if (v26)
  {
    uint64_t v37 = C3DMeshSourceGetContent((uint64_t)v26);
    uint64_t v43 = v36;
    if (!v36)
    {
      CFRelease(v28);
LABEL_54:
      uint64_t v70 = v26;
LABEL_56:
      CFRelease(v70);
      return;
    }
    uint64_t v44 = v37;
    CFTypeRef cf = v28;
    v75 = v26;
    uint64_t v71 = a1;
    int v72 = a2;
    uint64_t v73 = v3;
    unsigned int v45 = 0;
    unsigned int v46 = 0;
    unsigned int v47 = 0;
    LODWORD(v36) = v38;
    int v48 = v39;
    do
    {
      *(double *)v49.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v36), (float *)(Content + v45), v40, v41, v42.f32[0]);
      float32x4_t v76 = v49;
      *(double *)v40.i64 = C3DConvertFloatingTypeToFloat4(v36, (float *)(v44 + v46), v49, v50, v51);
      v42.i64[0] = 0x3400000034000000;
      v42.i64[1] = 0x3400000034000000;
      float v41 = COERCE_FLOAT(vminvq_u32((uint32x4_t)vcgtq_f32(v42, (float32x4_t)(*(_OWORD *)&v76 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))));
      if ((LODWORD(v41) & 0x80000000) != 0)
      {
        float32x4_t v40 = (float32x4_t)vcgtq_f32(v42, vabsq_f32(v40));
        v40.i32[0] = vminvq_u32((uint32x4_t)v40);
        int v52 = v40.i32[0] >= 0;
      }
      else
      {
        int v52 = 1;
      }
      v47 += v52;
      v46 += v48;
      v45 += BYTE5(v36);
      --v43;
    }
    while (v43);
  }
  else
  {
    uint64_t v63 = v31;
    if (!v31)
    {
      uint64_t v70 = v28;
      goto LABEL_56;
    }
    CFTypeRef cf = v28;
    v75 = 0;
    uint64_t v71 = a1;
    int v72 = a2;
    uint64_t v73 = v3;
    unsigned int v64 = 0;
    unsigned int v47 = 0;
    do
    {
      v65.i64[0] = COERCE_UNSIGNED_INT64(C3DConvertFloatingTypeToFloat4(BYTE4(v36), (float *)(Content + v64), v33, v34.f32[0], v35)) & 0x7FFFFFFF7FFFFFFFLL;
      v65.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
      v34.i64[0] = 0x3400000034000000;
      v34.i64[1] = 0x3400000034000000;
      float32x4_t v33 = (float32x4_t)vcgtq_f32(v34, v65);
      v33.i32[0] = vminvq_u32((uint32x4_t)v33);
      v47 += v33.i32[0] >= 0;
      v64 += BYTE5(v36);
      --v63;
    }
    while (v63);
  }
  if (v47)
  {
    uint64_t v62 = v47;
    a2 = v72;
    uint64_t v3 = v73;
    a1 = v71;
    uint64_t v28 = cf;
    v26 = v75;
LABEL_51:
    uint64_t v66 = *(void *)(a1 + 72);
    uint64_t v67 = *(void *)(a1 + 32);
    unsigned int v68 = *(_DWORD *)(v67 + 68);
    *(_DWORD *)(v67 + 68) = v68 + 1;
    uint64_t v69 = v66 + 40 * v68;
    *(_DWORD *)uint64_t v69 = a2;
    *(_DWORD *)(v69 + 4) = 0;
    *(void *)(v69 + 8) = v3;
    *(void *)(v69 + 16) = v28;
    *(void *)(v69 + 24) = v26;
    *(void *)(v69 + 32) = v62;
    return;
  }
  CFRelease(cf);
  v26 = v75;
  if (v75) {
    goto LABEL_54;
  }
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!C3DGeometryUsesDeformerBasedDynamicMesh(a3))
  {
    uint64_t Mesh = C3DGeometryGetMesh(a3);
    C3DMeshClearCPURepresentation(Mesh);
  }
}

- (void)createVertexBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 vertexBuffer:(char *)a5 vertexBufferOffset:(unint64_t)a6 indicesBuffer:(char *)a7 indicesBufferOffset:(unint64_t)a8 indexSize:(unint64_t)a9 originalToFirstDeindexedTable:(unsigned int *)a10 computeContext:(id)a11
{
  uint64_t Content = C3DMeshSourceGetContent((uint64_t)a4->var2);
  uint64_t v19 = v18;
  if (self->_morphNormals)
  {
    uint64_t v82 = C3DMeshSourceGetContent((uint64_t)a4->var3);
    __int16 v21 = v20;
  }
  else
  {
    __int16 v21 = 0;
    uint64_t v82 = 0;
  }
  a3->var2 = a4->var4;
  if (self->_morphKind == 1) {
    [(SCNMTLMorphDeformer *)self createSparseIndicesBufferForMorphTarget:a3 withSetupTarget:a4 indicesBuffer:a7 indicesBufferOffset:a8 indexSize:a9 originalToFirstDeindexedTable:a10 computeContext:a11];
  }
  else {
    a3->var4 = 0;
  }
  int morphTargetPositionDataType = (unsigned __int16)self->_morphTargetPositionDataType;
  if (morphTargetPositionDataType == 23)
  {
    if (self->_morphKind != 1)
    {
      uint64_t v23 = scn_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLMorphDeformer createVertexBufferForMorphTarget:withSetupTarget:vertexBuffer:vertexBufferOffset:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:](v23, v24, v25, v26, v27, v28, v29, v30);
      }
    }
    *(double *)v31.i64 = C3DMeshSourceGetAbsoluteMaxValue((uint64_t)a4->var2);
    float v32 = vmaxvq_f32(v31);
    LOWORD(morphTargetPositionDataType) = self->_morphTargetPositionDataType;
    float v33 = 1.0 / v32;
  }
  else
  {
    float v32 = 1.0;
    float v33 = 1.0;
  }
  float v83 = v33;
  a3->var0 = v32;
  uint64_t v34 = C3DSizeOfBaseType((__int16)morphTargetPositionDataType);
  uint64_t v35 = C3DSizeOfBaseType(self->_morphTargetNormalDataType);
  uint64_t v36 = (void *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_resourceManager);
  int v37 = SCNMTLDeviceRequiresOffsetAndStrideForStageInAsMultipleOf4Bytes(v36);
  unint64_t v41 = (v34 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  unint64_t v42 = (v35 + v41 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  if (!v37) {
    unint64_t v41 = v34;
  }
  unint64_t v81 = v41;
  if (v37) {
    unint64_t v43 = v42;
  }
  else {
    unint64_t v43 = v35 + v34;
  }
  uint64_t v44 = &a5[a6];
  uint64_t v77 = a3;
  unint64_t v78 = a6;
  v75 = &a5[a6];
  unint64_t v76 = v43 * a3->var2;
  if (self->_morphKind == 1)
  {
    if (self->_morphNormals)
    {
      if (v19)
      {
        unsigned int v45 = 0;
        unsigned int v46 = 0;
        int v47 = BYTE5(v19);
        uint64_t v48 = v19;
        int v49 = BYTE4(v19);
        float v50 = v44;
        do
        {
          *(double *)v51.i64 = C3DConvertFloatingTypeToFloat4(v49, (float *)(Content + v45), v38, v39.f32[0], v40.f32[0]);
          float32x4_t v79 = v51;
          *(double *)v54.i64 = C3DConvertFloatingTypeToFloat4(v21, (float *)(v82 + v46), v51, v52, v53);
          float32x4_t v40 = v54;
          v39.i64[0] = 0x3400000034000000;
          v39.i64[1] = 0x3400000034000000;
          if ((vminvq_u32((uint32x4_t)vcgtq_f32(v39, (float32x4_t)(*(_OWORD *)&v79 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))) & 0x80000000) == 0|| (float32x4_t v38 = (float32x4_t)vcgtq_f32(v39, vabsq_f32(v54)), v38.i32[0] = vminvq_u32((uint32x4_t)v38), (v38.i32[0] & 0x80000000) == 0))
          {
            float32x4_t v55 = vmulq_n_f32(v79, v83);
            float32x4_t v80 = v40;
            C3DConvertFloatingTypeFromFloat4(self->_morphTargetPositionDataType, (uint64_t)v50, v55);
            C3DConvertFloatingTypeFromFloat4(self->_morphTargetNormalDataType, (uint64_t)&v50[v81], v80);
            v50 += v43;
          }
          v46 += HIBYTE(v21);
          v45 += v47;
          --v48;
        }
        while (v48);
        goto LABEL_40;
      }
LABEL_39:
      float v50 = &a5[a6];
      goto LABEL_40;
    }
    if (!v19) {
      goto LABEL_39;
    }
    unsigned int v63 = 0;
    int v64 = BYTE4(v19);
    int v65 = BYTE5(v19);
    uint64_t v66 = v19;
    float v50 = v44;
    do
    {
      *(double *)v38.i64 = C3DConvertFloatingTypeToFloat4(v64, (float *)(Content + v63), v38, v39.f32[0], v40.f32[0]);
      v40.i64[0] = 0x3400000034000000;
      v40.i64[1] = 0x3400000034000000;
      v39.i32[0] = vminvq_u32((uint32x4_t)vcgtq_f32(v40, (float32x4_t)(*(_OWORD *)&v38 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
      if ((v39.i32[0] & 0x80000000) == 0)
      {
        C3DConvertFloatingTypeFromFloat4(self->_morphTargetPositionDataType, (uint64_t)v50, vmulq_n_f32(v38, v83));
        v50 += v43;
      }
      v63 += v65;
      --v66;
    }
    while (v66);
  }
  else
  {
    if (!v19) {
      goto LABEL_39;
    }
    unsigned int v56 = 0;
    unsigned int v57 = 0;
    int v58 = BYTE4(v19);
    int v59 = BYTE5(v19);
    uint64_t v60 = v19;
    float v50 = v44;
    do
    {
      *(double *)v61.i64 = C3DConvertFloatingTypeToFloat4(v58, (float *)(Content + v56), v38, v39.f32[0], v40.f32[0]);
      C3DConvertFloatingTypeFromFloat4(self->_morphTargetPositionDataType, (uint64_t)v50, vmulq_n_f32(v61, v83));
      if (self->_morphNormals)
      {
        *(double *)v62.i64 = C3DConvertFloatingTypeToFloat4(v21, (float *)(v82 + v57), v38, v39.f32[0], v40.f32[0]);
        C3DConvertFloatingTypeFromFloat4(self->_morphTargetNormalDataType, (uint64_t)&v50[v81], v62);
      }
      v50 += v43;
      v57 += HIBYTE(v21);
      v56 += v59;
      --v60;
    }
    while (v60);
  }
LABEL_40:
  if (v50 != &v75[v76])
  {
    uint64_t v67 = scn_default_log();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLMorphDeformer createVertexBufferForMorphTarget:withSetupTarget:vertexBuffer:vertexBufferOffset:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:](v67, v68, v69, v70, v71, v72, v73, v74);
    }
  }
  v77->var3 = v78;
}

- (void)createSparseIndicesBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 indicesBuffer:(char *)a5 indicesBufferOffset:(unint64_t)a6 indexSize:(unint64_t)a7 originalToFirstDeindexedTable:(unsigned int *)a8 computeContext:(id)a9
{
  uint64_t v112 = *MEMORY[0x263EF8340];
  if (a3->var2 == self->_vertexCountForComputeKernel)
  {
    a3->var3 = 0;
    a3->var4 = 0;
    return;
  }
  var3 = a4->var3;
  if (self->_dataKindForComputeKernel)
  {
    int v102 = 0;
  }
  else
  {
    if (a8) {
      BOOL v15 = self->_finalMeshDataKind == 1;
    }
    else {
      BOOL v15 = 0;
    }
    int v16 = v15;
    int v102 = v16;
  }
  uint64_t Content = C3DMeshSourceGetContent((uint64_t)a4->var2);
  uint64_t v18 = v17;
  if (var3)
  {
    uint64_t v101 = C3DMeshSourceGetContent((uint64_t)a4->var3);
    __int16 v20 = v19;
  }
  else
  {
    __int16 v20 = 0;
    uint64_t v101 = 0;
  }
  if (a7 == 1) {
    __int16 v21 = &a5[a6];
  }
  else {
    __int16 v21 = 0;
  }
  if (a7 == 2) {
    uint64_t v22 = &a5[a6];
  }
  else {
    uint64_t v22 = 0;
  }
  uint64_t v99 = v22;
  if (a7 == 4) {
    uint64_t v23 = &a5[a6];
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t Mesh = C3DGeometryGetMesh((uint64_t)a4->var1);
  unint64_t v93 = a6;
  if ((uint64_t)C3DMeshGetElementsCount(Mesh) >= 1)
  {
    ElementAtIndex = C3DMeshGetElementAtIndex(Mesh, 0, 0);
    uint64_t v109 = 0;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v106 = 0u;
    C3DMeshElementGetContent((uint64_t)ElementAtIndex, 0, (uint64_t)&v106);
    uint64_t v91 = a3;
    if (var3)
    {
      if (DWORD2(v106))
      {
        char v96 = v23;
        uint64_t v32 = 0;
        int v33 = 0;
        int v34 = 0;
        int v100 = v20;
        int v35 = HIBYTE(v20);
        v29.i64[0] = 67109120;
        while (1)
        {
          int v36 = BYTE11(v107);
          uint64_t v95 = v32;
          switch(BYTE11(v107))
          {
            case 4u:
              unsigned int v37 = *(_DWORD *)(v106 + 4 * (*((void *)&v108 + 1) + v109 * 2 * v32));
              unsigned int v38 = *(_DWORD *)(v106 + 4 * (*((void *)&v108 + 1) + v109 * ((2 * v32) | 1)));
              break;
            case 2u:
              unsigned int v37 = *(unsigned __int16 *)(v106 + 2 * (*((void *)&v108 + 1) + v109 * 2 * v32));
              unsigned int v38 = *(unsigned __int16 *)(v106 + 2 * (*((void *)&v108 + 1) + v109 * ((2 * v32) | 1)));
              break;
            case 1u:
              unsigned int v37 = *(unsigned __int8 *)(v106 + *((void *)&v108 + 1) + v109 * 2 * v32);
              unsigned int v38 = *(unsigned __int8 *)(v106 + *((void *)&v108 + 1) + v109 * ((2 * v32) | 1));
              break;
            default:
              unsigned int v45 = scn_default_log();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109120;
                int v111 = v36;
                _os_log_error_impl(&dword_20B249000, v45, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid bytes per index (%d)", buf, 8u);
              }
              goto LABEL_50;
          }
          if (v37 < v38)
          {
            float32x4_t v39 = &a8[v37];
            unsigned int v40 = BYTE5(v18) * v34;
            LODWORD(v18) = v35 * v34;
            do
            {
              *(double *)v41.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v18), (float *)(Content + v40), v29, v30.f32[0], *(float *)&v31);
              float32x4_t v104 = v41;
              *(double *)v29.i64 = C3DConvertFloatingTypeToFloat4(v100, (float *)(v101 + v18), v41, v42, v43);
              unsigned long long v31 = *(_OWORD *)&v104 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
              v30.i64[0] = 0x3400000034000000;
              v30.i64[1] = 0x3400000034000000;
              v30.i32[0] = vminvq_u32((uint32x4_t)vcgtq_f32(v30, (float32x4_t)(*(_OWORD *)&v104 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
              if ((v30.i32[0] & 0x80000000) == 0
                || (v30.i64[0] = 0x3400000034000000,
                    v30.i64[1] = 0x3400000034000000,
                    float32x4_t v29 = (float32x4_t)vcgtq_f32(v30, vabsq_f32(v29)),
                    v29.i32[0] = vminvq_u32((uint32x4_t)v29),
                    (v29.i32[0] & 0x80000000) == 0))
              {
                unsigned int v44 = v37;
                if (v102) {
                  unsigned int v44 = *v39;
                }
                if (v21)
                {
                  *v21++ = v44;
                }
                else
                {
                  __int16 v21 = 0;
                  if (v99)
                  {
                    *(_WORD *)uint64_t v99 = v44;
                    v99 += 2;
                  }
                  else
                  {
                    *(_DWORD *)char v96 = v44;
                    v96 += 4;
                    uint64_t v99 = 0;
                  }
                }
                ++v33;
              }
              ++v34;
              ++v39;
              ++v37;
              v40 += BYTE5(v18);
              LODWORD(v18) = v18 + v35;
            }
            while (v38 != v37);
          }
LABEL_50:
          uint64_t v32 = v95 + 1;
          if (v95 + 1 >= (unint64_t)DWORD2(v106)) {
            goto LABEL_93;
          }
        }
      }
      int v33 = 0;
LABEL_93:
      uint64_t v67 = v91;
      if (v33 == v91->var2) {
        goto LABEL_117;
      }
      uint64_t v68 = scn_default_log();
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_FAULT)) {
        goto LABEL_117;
      }
LABEL_116:
      -[SCNMTLMorphDeformer createSparseIndicesBufferForMorphTarget:withSetupTarget:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:](v68, v69, v70, v71, v72, v73, v74, v75);
LABEL_117:
      unint64_t v82 = v93;
      goto LABEL_118;
    }
    if (!DWORD2(v106))
    {
      int v58 = 0;
LABEL_114:
      uint64_t v67 = v91;
      if (v58 == v91->var2) {
        goto LABEL_117;
      }
      uint64_t v68 = scn_default_log();
      if (!os_log_type_enabled(v68, OS_LOG_TYPE_FAULT)) {
        goto LABEL_117;
      }
      goto LABEL_116;
    }
    v98 = v23;
    uint64_t v57 = 0;
    int v58 = 0;
    int v59 = 0;
    v29.i64[0] = 67109120;
    while (1)
    {
      int v60 = BYTE11(v107);
      switch(BYTE11(v107))
      {
        case 4u:
          unsigned int v61 = *(_DWORD *)(v106 + 4 * (*((void *)&v108 + 1) + v109 * 2 * v57));
          unsigned int v62 = *(_DWORD *)(v106 + 4 * (*((void *)&v108 + 1) + v109 * ((2 * v57) | 1)));
          break;
        case 2u:
          unsigned int v61 = *(unsigned __int16 *)(v106 + 2 * (*((void *)&v108 + 1) + v109 * 2 * v57));
          unsigned int v62 = *(unsigned __int16 *)(v106 + 2 * (*((void *)&v108 + 1) + v109 * ((2 * v57) | 1)));
          break;
        case 1u:
          unsigned int v61 = *(unsigned __int8 *)(v106 + *((void *)&v108 + 1) + v109 * 2 * v57);
          unsigned int v62 = *(unsigned __int8 *)(v106 + *((void *)&v108 + 1) + v109 * ((2 * v57) | 1));
          break;
        default:
          uint64_t v66 = scn_default_log();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            int v111 = v60;
            _os_log_error_impl(&dword_20B249000, v66, OS_LOG_TYPE_ERROR, "Unreachable code: Invalid bytes per index (%d)", buf, 8u);
          }
          goto LABEL_90;
      }
      if (v61 < v62)
      {
        unsigned int v63 = &a8[v61];
        LODWORD(v18) = BYTE5(v18) * v59;
        do
        {
          v64.i64[0] = COERCE_UNSIGNED_INT64(C3DConvertFloatingTypeToFloat4(BYTE4(v18), (float *)(Content + v18), v29, v30.f32[0], *(float *)&v31)) & 0x7FFFFFFF7FFFFFFFLL;
          v64.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
          v30.i64[0] = 0x3400000034000000;
          v30.i64[1] = 0x3400000034000000;
          float32x4_t v29 = (float32x4_t)vcgtq_f32(v30, v64);
          v29.i32[0] = vminvq_u32((uint32x4_t)v29);
          if ((v29.i32[0] & 0x80000000) == 0)
          {
            unsigned int v65 = v61;
            if (v102) {
              unsigned int v65 = *v63;
            }
            if (v21)
            {
              *v21++ = v65;
            }
            else
            {
              __int16 v21 = 0;
              if (v99)
              {
                *(_WORD *)uint64_t v99 = v65;
                v99 += 2;
              }
              else
              {
                *(_DWORD *)v98 = v65;
                v98 += 4;
                uint64_t v99 = 0;
              }
            }
            ++v58;
          }
          ++v59;
          ++v63;
          ++v61;
          LODWORD(v18) = v18 + BYTE5(v18);
        }
        while (v62 != v61);
      }
LABEL_90:
      if (++v57 >= (unint64_t)DWORD2(v106)) {
        goto LABEL_114;
      }
    }
  }
  uint64_t v46 = v18;
  if (!var3)
  {
    unint64_t v76 = a3;
    if (!v18)
    {
      int v79 = 0;
LABEL_120:
      uint64_t v67 = v76;
      unint64_t v82 = v93;
      if (v79 == v76->var2) {
        goto LABEL_118;
      }
      float v83 = scn_default_log();
      if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
        goto LABEL_118;
      }
      goto LABEL_112;
    }
    unsigned int v77 = 0;
    uint64_t v78 = 0;
    int v79 = 0;
    while (1)
    {
      v80.i64[0] = COERCE_UNSIGNED_INT64(C3DConvertFloatingTypeToFloat4(BYTE4(v18), (float *)(Content + v77), v25, v26.f32[0], *(float *)&v27)) & 0x7FFFFFFF7FFFFFFFLL;
      v80.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
      v26.i64[0] = 0x3400000034000000;
      v26.i64[1] = 0x3400000034000000;
      float32x4_t v25 = (float32x4_t)vcgtq_f32(v26, v80);
      v25.i32[0] = vminvq_u32((uint32x4_t)v25);
      if ((v25.i32[0] & 0x80000000) == 0) {
        break;
      }
LABEL_107:
      ++v78;
      v77 += BYTE5(v18);
      if (v18 == v78) {
        goto LABEL_120;
      }
    }
    if (v102)
    {
      unsigned int v81 = a8[v78];
      if (v21)
      {
LABEL_101:
        *v21++ = v81;
LABEL_106:
        ++v79;
        goto LABEL_107;
      }
    }
    else
    {
      unsigned int v81 = v78;
      if (v21) {
        goto LABEL_101;
      }
    }
    if (v99)
    {
      __int16 v21 = 0;
      *(_WORD *)uint64_t v99 = v81;
      v99 += 2;
    }
    else
    {
      uint64_t v99 = 0;
      __int16 v21 = 0;
      *(_DWORD *)uint64_t v23 = v81;
      v23 += 4;
    }
    goto LABEL_106;
  }
  uint64_t v92 = a3;
  if (v18)
  {
    v97 = (unsigned int *)v23;
    unsigned int v47 = 0;
    __int16 v48 = v20;
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    int v51 = 0;
    LODWORD(v18) = v48;
    uint64_t v52 = HIBYTE(v48);
    while (1)
    {
      *(double *)v53.i64 = C3DConvertFloatingTypeToFloat4(BYTE4(v18), (float *)(Content + v47), v25, v26.f32[0], *(float *)&v27);
      float32x4_t v105 = v53;
      *(double *)v25.i64 = C3DConvertFloatingTypeToFloat4(v18, (float *)(v101 + v49), v53, v54, v55);
      unsigned long long v27 = *(_OWORD *)&v105 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
      v26.i64[0] = 0x3400000034000000;
      v26.i64[1] = 0x3400000034000000;
      v26.i32[0] = vminvq_u32((uint32x4_t)vcgtq_f32(v26, (float32x4_t)(*(_OWORD *)&v105 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
      if (v26.i32[0] < 0)
      {
        v26.i64[0] = 0x3400000034000000;
        v26.i64[1] = 0x3400000034000000;
        float32x4_t v25 = (float32x4_t)vcgtq_f32(v26, vabsq_f32(v25));
        v25.i32[0] = vminvq_u32((uint32x4_t)v25);
        if (v25.i32[0] < 0) {
          goto LABEL_65;
        }
      }
      if (v102)
      {
        unsigned int v56 = a8[v50];
        if (!v21) {
          goto LABEL_61;
        }
      }
      else
      {
        unsigned int v56 = v50;
        if (!v21)
        {
LABEL_61:
          __int16 v21 = 0;
          if (v99)
          {
            *(_WORD *)uint64_t v99 = v56;
            v99 += 2;
          }
          else
          {
            *v97++ = v56;
            uint64_t v99 = 0;
          }
          goto LABEL_64;
        }
      }
      *v21++ = v56;
LABEL_64:
      ++v51;
LABEL_65:
      ++v50;
      v49 += v52;
      v47 += BYTE5(v18);
      if (v46 == v50) {
        goto LABEL_110;
      }
    }
  }
  int v51 = 0;
LABEL_110:
  uint64_t v67 = v92;
  unint64_t v82 = v93;
  if (v51 == v92->var2) {
    goto LABEL_118;
  }
  float v83 = scn_default_log();
  if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
    goto LABEL_118;
  }
LABEL_112:
  -[SCNMTLMorphDeformer createSparseIndicesBufferForMorphTarget:withSetupTarget:indicesBuffer:indicesBufferOffset:indexSize:originalToFirstDeindexedTable:computeContext:](v83, v84, v85, v86, v87, v88, v89, v90);
LABEL_118:
  v67->var4 = v82;
}

- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4
{
  unint64_t v7 = [a3 currentFrameHash];
  if (self->_currentFrameHash == v7) {
    return 0;
  }
  self->_currentFrameHash = v7;
  id var1 = a4->var1;
  id var3 = a4->var3;
  if (self->_morphKind == 1)
  {
    return [(SCNMTLMorphDeformer *)self morphSparseWithComputeContext:a3 positions:var1 normals:var3];
  }
  else
  {
    return [(SCNMTLMorphDeformer *)self morphIncrementallyWithComputeContext:a3 positions:var1 normals:var3];
  }
}

- (unint64_t)morphSparseWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5
{
  unsigned int v46 = 0;
  unsigned int v44 = 0;
  unsigned int v45 = 0;
  float v43 = 0.0;
  int v9 = C3DMorpherBeginIncrementalPass((uint64_t)self->_morpher, self->_lastMorpherIncrementalPassState, &v45, &v44, &v46, &v43);
  if (!v9) {
    return 0;
  }
  int v10 = v9;
  uint64_t v11 = (SCNMTLComputeCommandEncoder *)[a3 currentComputeEncoder];
  bzero(v11, 0x678uLL);
  if (a4)
  {
    v11->_buffers[0] = (MTLBuffer *)a4;
    v11->_buffersToBind[0] |= 1uLL;
  }
  if (a5)
  {
    if (v11->_buffers[4] == a5)
    {
      if (!v11->_offsets[4]) {
        goto LABEL_10;
      }
    }
    else
    {
      v11->_buffers[4] = (MTLBuffer *)a5;
    }
    v11->_offsets[4] = 0;
    v11->_buffersToBind[0] |= 0x10uLL;
  }
LABEL_10:
  if (v10 != 2) {
    goto LABEL_23;
  }
  baseBufferForComputeKernel = self->_baseBufferForComputeKernel;
  if (v11->_buffers[1] == baseBufferForComputeKernel)
  {
    if (!v11->_offsets[1]) {
      goto LABEL_15;
    }
  }
  else
  {
    v11->_buffers[1] = baseBufferForComputeKernel;
  }
  v11->_offsets[1] = 0;
  v11->_buffersToBind[0] |= 2uLL;
LABEL_15:
  unsigned int vertexCountForComputeKernel = self->_vertexCountForComputeKernel;
  v41[0] = 0.0;
  unsigned int var2 = vertexCountForComputeKernel;
  SCNMTLComputeCommandEncoder::setBytes(v11, v41, 0xCuLL, 3uLL);
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  encoder = v11->_encoder;
  uint64_t v49 = 0;
  uint64_t v50 = var2;
  int64x2_t v51 = vdupq_n_s64(1uLL);
  [(MTLComputeCommandEncoder *)encoder setStageInRegion:&v47];
  originalToFirstDeindexedTableBuffer = self->_originalToFirstDeindexedTableBuffer;
  if (originalToFirstDeindexedTableBuffer)
  {
    if (v11->_buffers[2] != originalToFirstDeindexedTableBuffer)
    {
      v11->_buffers[2] = originalToFirstDeindexedTableBuffer;
LABEL_19:
      v11->_offsets[2] = 0;
      v11->_buffersToBind[0] |= 4uLL;
      goto LABEL_20;
    }
    if (v11->_offsets[2]) {
      goto LABEL_19;
    }
  }
LABEL_20:
  uint64_t v17 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_copyBaseBufferPipeline);
  unsigned int v18 = var2;
  if (v11->_computePipelineState != (MTLComputePipelineState *)v17)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v17;
    [(MTLComputeCommandEncoder *)v11->_encoder setComputePipelineState:v17];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v18);
  bzero(v45, 4 * v46);
LABEL_23:
  if (self->_morphTargetCount)
  {
    uint64_t v19 = 0;
    unint64_t v20 = 0;
    int64x2_t v40 = vdupq_n_s64(1uLL);
    while (1)
    {
      morphTargets = self->_morphTargets;
      uint64_t v22 = &morphTargets[v19];
      uint64_t var1 = morphTargets[v19].var1;
      float v24 = *(float *)&v44[4 * var1];
      float v25 = *((float *)v45 + var1);
      if (vabds_f32(v24, v25) > v43) {
        break;
      }
LABEL_46:
      ++v20;
      ++v19;
      if (v20 >= self->_morphTargetCount) {
        goto LABEL_47;
      }
    }
    v41[0] = v24 - v25;
    v41[1] = (float)(v24 - v25) * v22->var0;
    unsigned int var2 = v22->var2;
    SCNMTLComputeCommandEncoder::setBytes(v11, v41, 0xCuLL, 3uLL);
    unsigned int v26 = v22->var2;
    unsigned int v27 = self->_vertexCountForComputeKernel;
    morphTargetsVertexBuffer = self->_morphTargetsVertexBuffer;
    unint64_t var3 = v22->var3;
    if (v11->_buffers[1] == morphTargetsVertexBuffer)
    {
      if (v11->_offsets[1] == var3) {
        goto LABEL_30;
      }
    }
    else
    {
      v11->_buffers[1] = morphTargetsVertexBuffer;
    }
    v11->_offsets[1] = var3;
    v11->_buffersToBind[0] |= 2uLL;
LABEL_30:
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    float32x4_t v30 = v11->_encoder;
    uint64_t v49 = 0;
    uint64_t v50 = var2;
    int64x2_t v51 = v40;
    -[MTLComputeCommandEncoder setStageInRegion:](v30, "setStageInRegion:", &v47, *(_OWORD *)&v40);
    if (v26 == v27)
    {
      unsigned long long v31 = self->_originalToFirstDeindexedTableBuffer;
      if (v31)
      {
        if (v11->_buffers[2] == v31)
        {
          if (!v11->_offsets[2])
          {
LABEL_42:
            blendDenseIndexedPipeline = self->_blendDenseIndexedPipeline;
            goto LABEL_43;
          }
        }
        else
        {
          v11->_buffers[2] = v31;
        }
        v11->_offsets[2] = 0;
        v11->_buffersToBind[0] |= 4uLL;
        goto LABEL_42;
      }
      blendDenseIndexedPipeline = self->_blendDensePipeline;
LABEL_43:
      uint64_t v35 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)blendDenseIndexedPipeline);
      uint64_t v36 = var2;
      if (v11->_computePipelineState != (MTLComputePipelineState *)v35)
      {
        v11->_computePipelineState = (MTLComputePipelineState *)v35;
        -[MTLComputeCommandEncoder setComputePipelineState:](v11->_encoder, "setComputePipelineState:");
      }
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v36);
      goto LABEL_46;
    }
    morphTargetsSparseIndicesBuffer = self->_morphTargetsSparseIndicesBuffer;
    unint64_t var4 = morphTargets[v19].var4;
    if (v11->_buffers[2] == morphTargetsSparseIndicesBuffer)
    {
      if (v11->_offsets[2] == var4)
      {
LABEL_39:
        blendDenseIndexedPipeline = self->_blendSparsePipeline;
        goto LABEL_43;
      }
    }
    else
    {
      v11->_buffers[2] = morphTargetsSparseIndicesBuffer;
    }
    v11->_offsets[2] = var4;
    v11->_buffersToBind[0] |= 4uLL;
    goto LABEL_39;
  }
LABEL_47:
  deindexedToFirstDeindexedTableBuffer = self->_deindexedToFirstDeindexedTableBuffer;
  if (!deindexedToFirstDeindexedTableBuffer) {
    goto LABEL_55;
  }
  unsigned int var2 = self->_finalMeshVertexCount;
  if (v11->_buffers[2] != deindexedToFirstDeindexedTableBuffer)
  {
    v11->_buffers[2] = deindexedToFirstDeindexedTableBuffer;
LABEL_51:
    v11->_offsets[2] = 0;
    v11->_buffersToBind[0] |= 4uLL;
    goto LABEL_52;
  }
  if (v11->_offsets[2]) {
    goto LABEL_51;
  }
LABEL_52:
  SCNMTLComputeCommandEncoder::setBytes(v11, v41, 0xCuLL, 3uLL);
  uint64_t v38 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_splatPipeline);
  finalMeshVertexuint64_t Count = self->_finalMeshVertexCount;
  if (v11->_computePipelineState != (MTLComputePipelineState *)v38)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v38;
    [(MTLComputeCommandEncoder *)v11->_encoder setComputePipelineState:v38];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, finalMeshVertexCount);
LABEL_55:
  self->_lastMorpherIncrementalPassState = C3DMorpherEndIncrementalPass((uint64_t)self->_morpher);
  return 1;
}

- (unint64_t)morphIncrementallyWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5
{
  uint64_t v66 = (MTLBuffer *)a4;
  uint64_t v83 = *MEMORY[0x263EF8340];
  unsigned int v77 = 0;
  uint64_t v75 = 0;
  unint64_t v76 = 0;
  float v74 = 0.0;
  int v8 = C3DMorpherBeginIncrementalPass((uint64_t)self->_morpher, self->_lastMorpherIncrementalPassState, &v76, &v75, &v77, &v74);
  if (!v8) {
    return 0;
  }
  int v9 = v8;
  float32x4_t v64 = (MTLBuffer *)a5;
  uint64_t v71 = (SCNMTLComputeCommandEncoder *)[a3 currentComputeEncoder];
  bzero(v71, 0x678uLL);
  v61[1] = v61;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = (float *)((char *)v61 - v11);
  MEMORY[0x270FA5388](v13);
  BOOL v15 = (MTLBuffer **)((char *)v61 - ((v14 + 15) & 0xFFFFFFFF0));
  MEMORY[0x270FA5388](v16);
  unsigned int v18 = (void *)((char *)v61 - v17);
  BOOL v68 = v9 == 2;
  float v19 = 1.0;
  if (v9 == 2)
  {
    float v19 = 0.0;
    if (v77) {
      bzero(v76, 4 * v77);
    }
  }
  if (vabds_f32(1.0, v19) <= 0.00000011921)
  {
    unsigned int v20 = 0;
  }
  else
  {
    *uint64_t v12 = 1.0 - v19;
    *BOOL v15 = self->_baseBufferForComputeKernel;
    void *v18 = 0;
    unsigned int v20 = 1;
  }
  unsigned int v22 = v77;
  if (v77 != self->_morphTargetCount)
  {
    uint64_t v23 = v15;
    float v24 = scn_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLMorphDeformer morphIncrementallyWithComputeContext:positions:normals:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
    unsigned int v22 = v77;
    BOOL v15 = v23;
  }
  if (v22)
  {
    unint64_t v32 = 0;
    int v33 = v75;
    int v34 = v76;
    uint64_t v35 = 4 * v22;
    float v36 = v74;
    do
    {
      float v37 = *(float *)&v33[v32];
      float v38 = *(float *)&v34[v32];
      if (vabds_f32(v37, v38) > v36)
      {
        v12[v20] = v37 - v38;
        v15[v20] = self->_morphTargetsVertexBuffer;
        v18[v20++] = self->_morphTargets[v32 / 4].var3;
      }
      v32 += 4;
    }
    while (v35 != v32);
  }
  memset(v72, 0, sizeof(v72));
  unsigned int vertexCountForComputeKernel = self->_vertexCountForComputeKernel;
  memset(v82, 0, sizeof(v82));
  memset(&v81[4], 0, 32);
  uint64_t v39 = 136;
  if (v9 == 2) {
    uint64_t v39 = 128;
  }
  memset(v81, 0, 32);
  unsigned int v62 = self;
  uint64_t v67 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator](*(uint64_t *)((char *)&self->super.isa + v39));
  unsigned int v65 = v20 + 7;
  if (v20 + 7 >= 8)
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v63 = v65 >> 3;
    p_baseBufferForComputeKernel = &v62->_baseBufferForComputeKernel;
    do
    {
      uint64_t v69 = v41;
      uint64_t v43 = 0;
      unsigned int v44 = v15;
      do
      {
        if (v40 + v43 >= (unint64_t)v20)
        {
          uint64_t v46 = 0;
          float v45 = 0.0;
          uint64_t v47 = p_baseBufferForComputeKernel;
        }
        else
        {
          float v45 = v12[v43];
          uint64_t v46 = v18[v43];
          uint64_t v47 = v44;
        }
        uint64_t v48 = *v47;
        *(float *)&v72[v43] = v45;
        *((void *)v82 + v43) = v48;
        v81[v43++] = v46;
        ++v44;
      }
      while (v43 != 8);
      uint64_t v70 = v15;
      uint64_t v49 = v71;
      SCNMTLComputeCommandEncoder::setBuffers((uint64_t)v71, (uint64_t)v82, (uint64_t)v81, 1, 8);
      uint64_t v50 = v49;
      if (v49->_buffers[10] == v66)
      {
        unint64_t v53 = v49->_offsets[10];
        int64x2_t v51 = v64;
        uint64_t v52 = v67;
        if (!v53) {
          goto LABEL_31;
        }
      }
      else
      {
        v49->_buffers[10] = v66;
        int64x2_t v51 = v64;
        uint64_t v52 = v67;
      }
      v50->_offsets[10] = 0;
      v50->_buffersToBind[0] |= 0x400uLL;
LABEL_31:
      if (v51)
      {
        if (v50->_buffers[11] != v51)
        {
          v50->_buffers[11] = v51;
LABEL_35:
          v50->_offsets[11] = 0;
          v50->_buffersToBind[0] |= 0x800uLL;
          goto LABEL_36;
        }
        if (v50->_offsets[11]) {
          goto LABEL_35;
        }
      }
LABEL_36:
      SCNMTLComputeCommandEncoder::setBytes(v50, v72, 0x24uLL, 0xCuLL);
      memset(v78, 0, sizeof(v78));
      encoder = v71->_encoder;
      uint64_t v79 = vertexCountForComputeKernel;
      int64x2_t v80 = vdupq_n_s64(1uLL);
      [(MTLComputeCommandEncoder *)encoder setStageInRegion:v78];
      float v55 = v71;
      uint64_t v56 = vertexCountForComputeKernel;
      if (v71->_computePipelineState != (MTLComputePipelineState *)v52)
      {
        v71->_computePipelineState = (MTLComputePipelineState *)v52;
        uint64_t v57 = v52;
        uint64_t v58 = v56;
        [(MTLComputeCommandEncoder *)v55->_encoder setComputePipelineState:v57];
        uint64_t v56 = v58;
        float v55 = v71;
      }
      BOOL v59 = v65 < 0x10;
      SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v55, v56);
      if (!v59 && v68)
      {
        uint64_t v67 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)v62->_incrementalAddPipeline);
        BOOL v68 = 0;
      }
      uint64_t v41 = v69 + 1;
      v12 += 8;
      BOOL v15 = v70 + 8;
      v18 += 8;
      v40 += 8;
    }
    while (v69 + 1 != v63);
  }
  int v60 = v62;
  v60->_lastMorpherIncrementalPassState = C3DMorpherEndIncrementalPass((uint64_t)v62->_morpher);
  return 1;
}

+ (uint64_t)canMorph:reuseRenderResourceForMorph:
{
  return 0;
}

- (void)setupMorphTargetsWithComputeContext:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Unsupported morph kind", v2, v3, v4, v5, v6);
}

- (void)setupMorphTargetsWithComputeContext:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_20B249000, v0, v1, "Unreachable code: Unsupported index size for compute kernel", v2, v3, v4, v5, v6);
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupMorphTargetsWithComputeContext:.cold.7()
{
  __assert_rtn("-[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]", "SCNMTLMorphDeformer.mm", 268, "_finalMeshDataKind == _dataKindForComputeKernel");
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupMorphTargetsWithComputeContext:(uint64_t)a3 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_2()
{
  __assert_rtn("-[SCNMTLMorphDeformer setupMorphTargetsWithComputeContext:]_block_invoke", "SCNMTLMorphDeformer.mm", 317, "morphUsesSparseTargets == false");
}

void __59__SCNMTLMorphDeformer_setupMorphTargetsWithComputeContext___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createVertexBufferForMorphTarget:(uint64_t)a3 withSetupTarget:(uint64_t)a4 vertexBuffer:(uint64_t)a5 vertexBufferOffset:(uint64_t)a6 indicesBuffer:(uint64_t)a7 indicesBufferOffset:(uint64_t)a8 indexSize:originalToFirstDeindexedTable:computeContext:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createVertexBufferForMorphTarget:(uint64_t)a3 withSetupTarget:(uint64_t)a4 vertexBuffer:(uint64_t)a5 vertexBufferOffset:(uint64_t)a6 indicesBuffer:(uint64_t)a7 indicesBufferOffset:(uint64_t)a8 indexSize:originalToFirstDeindexedTable:computeContext:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createSparseIndicesBufferForMorphTarget:(uint64_t)a3 withSetupTarget:(uint64_t)a4 indicesBuffer:(uint64_t)a5 indicesBufferOffset:(uint64_t)a6 indexSize:(uint64_t)a7 originalToFirstDeindexedTable:(uint64_t)a8 computeContext:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)morphIncrementallyWithComputeContext:(uint64_t)a3 positions:(uint64_t)a4 normals:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end