@interface SCNMTLSkinDeformer
+ (BOOL)canSkin:(void *)a3 reuseRenderResourceForSkin:;
+ (unint64_t)requiredInputs;
+ (unint64_t)requiredOutputs;
+ (unint64_t)supportedOutputs;
- (id)makeReadOnlyBuffersWithBaseGeometry:(__C3DGeometry *)a3 baseMesh:(__C3DMesh *)a4 blitEncoder:(id)a5;
- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4;
- (void)dealloc;
- (void)initWithSkinner:(uint64_t)a3 baseGeometry:(char)a4 outputs:(char)a5 dataKind:(uint64_t)a6 resourceManager:(uint64_t)a7 computeContext:;
- (void)setupWithComputeContext:(id)a3;
@end

@implementation SCNMTLSkinDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 7;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (void)initWithSkinner:(uint64_t)a3 baseGeometry:(char)a4 outputs:(char)a5 dataKind:(uint64_t)a6 resourceManager:(uint64_t)a7 computeContext:
{
  if (!a1) {
    return 0;
  }
  v16.receiver = a1;
  v16.super_class = (Class)SCNMTLSkinDeformer;
  v13 = objc_msgSendSuper2(&v16, sel_init);
  if (v13)
  {
    if (a2) {
      CFTypeRef v14 = CFRetain(a2);
    }
    else {
      CFTypeRef v14 = 0;
    }
    v13[1] = v14;
    v13[2] = a3;
    *((unsigned char *)v13 + 40) = (a4 & 2) != 0;
    *((unsigned char *)v13 + 41) = (a4 & 4) != 0;
    *((unsigned char *)v13 + 24) = a5;
    v13[4] = a6;
    [v13 setupWithComputeContext:a7];
  }
  return v13;
}

- (void)dealloc
{
  skinner = self->_skinner;
  if (skinner)
  {
    CFRelease(skinner);
    self->_skinner = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)SCNMTLSkinDeformer;
  [(SCNMTLSkinDeformer *)&v4 dealloc];
}

- (void)setupWithComputeContext:(id)a3
{
  uint64_t Mesh = C3DGeometryGetMesh((uint64_t)self->_baseGeometry);
  if (!Mesh)
  {
    v6 = scn_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLSkinDeformer setupWithComputeContext:](v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(Mesh, 0, 0, self->_dataKind);
  if (!SourceWithSemanticAtIndex)
  {
    v15 = scn_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLSkinDeformer setupWithComputeContext:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  self->_baseVertexCount = C3DMeshSourceGetCount((uint64_t)SourceWithSemanticAtIndex);
  resourceManager = self->_resourceManager;
  skinner = self->_skinner;
  uint64_t dataKind = self->_dataKind;
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __46__SCNMTLSkinDeformer_setupWithComputeContext___block_invoke;
  v43[3] = &unk_264007470;
  v43[4] = a3;
  v43[5] = self;
  v43[6] = Mesh;
  uint64_t v26 = [(SCNMTLResourceManager *)resourceManager renderResourceForSkinner:skinner baseMesh:Mesh dataKind:dataKind provider:v43];
  uint64_t v27 = v26;
  if (v26)
  {
    self->_vertexWeightIndicesBuffer = (MTLBuffer *)*(id *)(v26 + 24);
    self->_boneIndicesBuffer = (MTLBuffer *)*(id *)(v27 + 32);
    v28 = *(void **)(v27 + 40);
  }
  else
  {
    self->_vertexWeightIndicesBuffer = 0;
    v28 = 0;
    self->_boneIndicesBuffer = 0;
  }
  self->_boneWeightsBuffer = (MTLBuffer *)v28;
  BOOL skinNormals = self->_skinNormals;
  id v29 = objc_alloc_init(MEMORY[0x263F128B0]);
  [v29 setConstantValue:&skinNormals type:53 withName:@"needNormal"];
  BOOL skinTangents = self->_skinTangents;
  [v29 setConstantValue:&skinTangents type:53 withName:@"needTangent"];
  if (v27)
  {
    int v30 = *(_DWORD *)(v27 + 8);
    int v31 = *(_DWORD *)(v27 + 16);
  }
  else
  {
    int v30 = 0;
    int v31 = 0;
  }
  int v39 = v31;
  int v40 = v30;
  [v29 setConstantValue:&v40 type:33 withName:@"weight_index_size"];
  [v29 setConstantValue:&v39 type:33 withName:@"bone_index_size"];
  uint64_t v32 = 84;
  if (!skinTangents) {
    uint64_t v32 = 45;
  }
  uint64_t v33 = 78;
  if (!skinNormals) {
    uint64_t v33 = 45;
  }
  uint64_t v34 = objc_msgSend(NSString, "stringWithFormat:", @"Int%d_Int%d_%c%c", (8 * v40), (8 * v39), v33, v32);
  self->_useFallbackCopyKernel = v27 == 0;
  if (v27)
  {
    uint64_t v35 = v34;
    v36 = @"skin_var";
  }
  else
  {
    uint64_t v37 = 84;
    if (!skinTangents) {
      uint64_t v37 = 45;
    }
    uint64_t v38 = 78;
    if (!skinNormals) {
      uint64_t v38 = 45;
    }
    uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c", v38, v37);
    v36 = @"skin_copy_as_fallback";
  }
  self->_computePipeline = (SCNMTLComputePipeline *)-[SCNMTLResourceManager computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:](self->_resourceManager, "computePipelineStateForKernel:withStageDescriptor:stageDescriptorUpdateBlock:constants:constantsHash:", v36, [a3 stageInputDescriptor], 0, v29, v35);
}

uint64_t __46__SCNMTLSkinDeformer_setupWithComputeContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentBlitEncoder];
  v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = v3[2];

  return [v3 makeReadOnlyBuffersWithBaseGeometry:v5 baseMesh:v4 blitEncoder:v2];
}

- (id)makeReadOnlyBuffersWithBaseGeometry:(__C3DGeometry *)a3 baseMesh:(__C3DMesh *)a4 blitEncoder:(id)a5
{
  uint64_t v146 = *MEMORY[0x263EF8340];
  OverrideMaterial = (void *)C3DGeometryGetOverrideMaterial((uint64_t)self->_skinner);
  if (!OverrideMaterial)
  {
    uint64_t v8 = scn_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLSkinDeformer makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  selfa = objc_alloc_init(SCNMTLSkinDeformerReadOnlyBuffers);
  uint64_t v140 = 0;
  v141 = 0;
  uint64_t v139 = 0;
  C3DSkinGetVertexWeightsPointers(OverrideMaterial, &v141, &v140, &v139);
  int v138 = 0;
  uint64_t PositionDeindexedToOriginalTable = C3DMeshGetPositionDeindexedToOriginalTable((uint64_t)a4, &v138);
  int JointsCount = C3DSkinGetJointsCount((uint64_t)OverrideMaterial);
  int v18 = JointsCount;
  unsigned int v19 = JointsCount - 129;
  uint64_t v20 = 1;
  if ((JointsCount - 129) < 0xFFFFFF80) {
    uint64_t v20 = 2;
  }
  if (JointsCount >= 1) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 4;
  }
  if (self->_dataKind == 1 && PositionDeindexedToOriginalTable)
  {
    p_unsigned int baseVertexCount = &self->_baseVertexCount;
    unsigned int baseVertexCount = self->_baseVertexCount;
    if (baseVertexCount == v138)
    {
      uint64_t v134 = v21;
      v24 = malloc_type_malloc(4 * (baseVertexCount + 1), 0x1FD7EA2CuLL);
      v25 = v24;
      _DWORD *v24 = 0;
      LODWORD(v26) = *p_baseVertexCount;
      if (*p_baseVertexCount)
      {
        int v27 = 0;
        unint64_t v28 = 0;
        uint64_t v29 = 0;
        int v30 = v141;
        do
        {
          unsigned int v31 = v30[*(_DWORD *)(PositionDeindexedToOriginalTable + 4 * v28) + 1]
              - v30[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v28)];
          v29 += v31;
          v27 += v31;
          v24[v28 + 1] = v27;
          unint64_t v26 = *p_baseVertexCount;
          ++v28;
        }
        while (v28 < v26);
        unsigned int v32 = v29 - 1;
        if ((int)v29 - 1 >= 0)
        {
          if (v32 >> 15)
          {
            unint64_t v33 = 4;
          }
          else
          {
            BOOL v38 = v32 > 0x7F;
            unint64_t v33 = 1;
            if (v38) {
              unint64_t v33 = 2;
            }
          }
          goto LABEL_94;
        }
      }
      else
      {
        uint64_t v29 = 0;
      }
      unint64_t v33 = 8;
LABEL_94:
      uint64_t v78 = 4;
      if (v33 < 4) {
        uint64_t v78 = v33;
      }
      uint64_t v79 = (v26 + 1);
      size_t v80 = v78 * v79;
      uint64_t v132 = v78;
      if (v78 == 1)
      {
        uint64_t v81 = v79;
        v86 = malloc_type_malloc(v80, 0x330F38E2uLL);
        v83 = v86;
        unsigned int v87 = 0;
        do
        {
          *((unsigned char *)v86 + v87) = v25[v87];
          ++v87;
        }
        while (v87 <= *p_baseVertexCount);
      }
      else if (v78 == 2)
      {
        uint64_t v81 = 2 * v79;
        v82 = malloc_type_malloc(v80, 0xD9180A17uLL);
        v83 = v82;
        uint64_t v84 = 0;
        if (*p_baseVertexCount + 1 > 1) {
          uint64_t v85 = *p_baseVertexCount + 1;
        }
        else {
          uint64_t v85 = 1;
        }
        do
        {
          *((_WORD *)v82 + v84) = v25[v84];
          ++v84;
        }
        while (v85 != v84);
      }
      else
      {
        uint64_t v81 = v78 * v79;
        if (v33 <= 3) {
          v83 = 0;
        }
        else {
          v83 = v25;
        }
      }
      char v88 = v19 < 0xFFFFFF80;
      if (v18 < 1) {
        char v88 = 2;
      }
      uint64_t v133 = v29 << v88;
      v89 = malloc_type_malloc(v29 << v88, 0x77BEC9F1uLL);
      uint64_t v90 = 4 * v29;
      v91 = malloc_type_malloc(4 * v29, 0x38FD109uLL);
      if (v134 == 1)
      {
        unint64_t v103 = *p_baseVertexCount;
        uint64_t v93 = v81;
        v70 = selfa;
        if (v103)
        {
          uint64_t v104 = 0;
          do
          {
            int v105 = v25[v104];
            unint64_t v106 = v104 + 1;
            uint64_t v107 = (v25[v104 + 1] - v105);
            if (v107)
            {
              uint64_t v108 = v141[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v104)];
              do
              {
                v89[v105] = *(_WORD *)(v140 + 2 * v108);
                v91[v105++] = *(_DWORD *)(v139 + 4 * v108++);
                --v107;
              }
              while (v107);
              unint64_t v103 = *p_baseVertexCount;
            }
            ++v104;
          }
          while (v106 < v103);
        }
      }
      else if (v134 == 2)
      {
        uint64_t v92 = *p_baseVertexCount;
        uint64_t v93 = v81;
        v70 = selfa;
        if (v92)
        {
          uint64_t v94 = 0;
          uint64_t v96 = v140;
          v95 = v141;
          uint64_t v97 = v139;
          int v98 = *v25;
          do
          {
            uint64_t v99 = v94 + 1;
            int v100 = v25[v94 + 1];
            uint64_t v101 = (v100 - v98);
            if (v100 != v98)
            {
              uint64_t v102 = v95[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v94)];
              do
              {
                *(_WORD *)&v89[2 * v98] = *(_WORD *)(v96 + 2 * v102);
                v91[v98++] = *(_DWORD *)(v97 + 4 * v102++);
                --v101;
              }
              while (v101);
            }
            int v98 = v100;
            uint64_t v94 = v99;
          }
          while (v99 != v92);
        }
      }
      else
      {
        BOOL v38 = v18 <= 0;
        uint64_t v93 = v81;
        v70 = selfa;
        if (v38)
        {
          unint64_t v109 = *p_baseVertexCount;
          if (v109)
          {
            uint64_t v110 = 0;
            uint64_t v112 = v140;
            v111 = v141;
            uint64_t v113 = v139;
            do
            {
              int v114 = v25[v110];
              unint64_t v115 = v110 + 1;
              uint64_t v116 = (v25[v110 + 1] - v114);
              if (v116)
              {
                uint64_t v117 = v111[*(unsigned int *)(PositionDeindexedToOriginalTable + 4 * v110)];
                do
                {
                  *(_DWORD *)&v89[4 * v114] = *(__int16 *)(v112 + 2 * v117);
                  v91[v114++] = *(_DWORD *)(v113 + 4 * v117++);
                  --v116;
                }
                while (v116);
                unint64_t v109 = *p_baseVertexCount;
              }
              ++v110;
            }
            while (v115 < v109);
          }
        }
      }
      if (v70)
      {
        v70->_vertexWeightIndexSize = v132;
        v70->_boneIndexSize = v134;
      }
      id v118 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v83, v93, a5);
      if (v70) {
        objc_setProperty_nonatomic(v70, v119, v118, 24);
      }
      id v120 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v89, v133, a5);
      if (v70) {
        objc_setProperty_nonatomic(v70, v121, v120, 32);
      }
      id v122 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v91, v90, a5);
      if (v70) {
        objc_setProperty_nonatomic(v70, v123, v122, 40);
      }
      if (v83 != v25) {
        free(v25);
      }
      free(v83);
      free(v89);
      v124 = v91;
      goto LABEL_148;
    }
    v41 = scn_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLSkinDeformer makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:]();
    }
LABEL_31:

    return 0;
  }
  uint64_t v135 = v21;
  uint64_t MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)OverrideMaterial);
  uint64_t v35 = &self->_baseVertexCount;
  if (MTLVertexFormat != self->_baseVertexCount)
  {
    v42 = scn_default_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      -[SCNMTLSkinDeformer makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:]();
    }
    goto LABEL_31;
  }
  if (v139) {
    uint64_t MTLVertexFormat = C3DSkinGetWeightsCount((uint64_t)OverrideMaterial);
  }
  unsigned int v36 = MTLVertexFormat - 1;
  if ((int)MTLVertexFormat - 1 < 0)
  {
    unint64_t v40 = 8;
  }
  else
  {
    unsigned int v37 = v36 >> 15;
    BOOL v38 = v36 > 0x7F;
    uint64_t v39 = 1;
    if (v38) {
      uint64_t v39 = 2;
    }
    if (v37) {
      unint64_t v40 = 4;
    }
    else {
      unint64_t v40 = v39;
    }
  }
  if (v40 >= 4) {
    uint64_t v44 = 4;
  }
  else {
    uint64_t v44 = v40;
  }
  if (v18 >= 1) {
    char v45 = v19 < 0xFFFFFF80;
  }
  else {
    char v45 = 2;
  }
  size_t v46 = v44 * (*v35 + 1);
  v47 = malloc_type_malloc(v46, 0x627DA16FuLL);
  v48 = v47;
  if (v44 == 2)
  {
    v51 = v141;
    if (*v35 + 1 > 1) {
      uint64_t v52 = *v35 + 1;
    }
    else {
      uint64_t v52 = 1;
    }
    if (v141)
    {
      v53 = v47;
      do
      {
        uint64_t v54 = *v51++;
        *v53++ = v54;
        --v52;
      }
      while (v52);
    }
    else
    {
      do
      {
        *((_WORD *)v47 + (void)v51) = (_WORD)v51;
        v51 = (uint64_t *)((char *)v51 + 1);
      }
      while ((uint64_t *)v52 != v51);
    }
  }
  else if (v44 == 1)
  {
    unsigned int v49 = v141;
    if (v141)
    {
      unsigned int v50 = 0;
      do
      {
        *((unsigned char *)v47 + v50) = v141[v50];
        ++v50;
      }
      while (v50 <= *v35);
    }
    else
    {
      do
      {
        *((unsigned char *)v47 + v49) = v49;
        ++v49;
      }
      while (v49 <= *v35);
    }
  }
  else if (v40 >= 4)
  {
    v55 = v141;
    if (v141)
    {
      unsigned int v56 = 0;
      do
      {
        *((_DWORD *)v47 + v56) = v55[v56];
        ++v56;
      }
      while (v56 <= *v35);
    }
    else
    {
      do
      {
        *((_DWORD *)v47 + v55) = v55;
        LODWORD(v55) = v55 + 1;
      }
      while (v55 <= *v35);
    }
  }
  id v58 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v47, v46, a5);
  if (selfa) {
    objc_setProperty_nonatomic(selfa, v57, v58, 24);
  }
  free(v48);
  if (!v140 || !v139)
  {
    v63 = malloc_type_calloc(MTLVertexFormat << v45, 1uLL, 0x43C62959uLL);
    resourceManager = self->_resourceManager;
    uint64_t v66 = (uint64_t)v63;
    uint64_t v67 = MTLVertexFormat << v45;
    id v61 = a5;
    goto LABEL_80;
  }
  if (MTLVertexFormat >= 1)
  {
    uint64_t v59 = 0;
    unsigned int v60 = 1;
    while (*(__int16 *)(v140 + 2 * v59) < v18)
    {
      uint64_t v59 = v60;
      BOOL v38 = MTLVertexFormat <= v60++;
      if (v38) {
        goto LABEL_73;
      }
    }
    v125 = scn_default_log();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
    {
      int v126 = *(__int16 *)(v140 + 2 * v59);
      *(_DWORD *)buf = 67109376;
      int v143 = v126;
      __int16 v144 = 1024;
      int v145 = v18;
      _os_log_error_impl(&dword_20B249000, v125, OS_LOG_TYPE_ERROR, "Error: Skinning internal consistency error - out of range bone index ('%d < %d' assertion failed)", buf, 0xEu);
    }
    goto LABEL_31;
  }
LABEL_73:
  if (v135 == 2)
  {
    id v61 = a5;
    id v127 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, v140, MTLVertexFormat << v45, a5);
    v70 = selfa;
    if (selfa) {
      objc_setProperty_nonatomic(selfa, v128, v127, 32);
    }
  }
  else
  {
    id v61 = a5;
    if (v135 == 1)
    {
      v62 = malloc_type_malloc(MTLVertexFormat << v45, 0x4D0E6E43uLL);
      v63 = v62;
      if (MTLVertexFormat >= 1)
      {
        uint64_t v64 = 0;
        do
        {
          *((unsigned char *)v62 + v64) = *(_WORD *)(v140 + 2 * v64);
          ++v64;
        }
        while (MTLVertexFormat > v64);
      }
      resourceManager = self->_resourceManager;
      uint64_t v66 = (uint64_t)v63;
      uint64_t v67 = MTLVertexFormat << v45;
LABEL_80:
      id v68 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)resourceManager, v66, v67, v61);
      v70 = selfa;
      if (!selfa)
      {
LABEL_82:
        free(v63);
        goto LABEL_83;
      }
LABEL_81:
      objc_setProperty_nonatomic(v70, v69, v68, 32);
      goto LABEL_82;
    }
    BOOL v38 = v18 <= 0;
    v70 = selfa;
    if (v38)
    {
      v129 = malloc_type_malloc(MTLVertexFormat << v45, 0x2AC3E04AuLL);
      v63 = v129;
      if (MTLVertexFormat >= 1)
      {
        uint64_t v130 = 0;
        uint64_t v131 = v140;
        do
        {
          *((_DWORD *)v129 + v130) = *(__int16 *)(v131 + 2 * v130);
          ++v130;
        }
        while (MTLVertexFormat > v130);
      }
      id v68 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v129, MTLVertexFormat << v45, a5);
      if (!selfa) {
        goto LABEL_82;
      }
      goto LABEL_81;
    }
  }
LABEL_83:
  if (!v139)
  {
    v73 = malloc_type_malloc(4 * MTLVertexFormat, 0x6811FA8uLL);
    v74 = v73;
    if (MTLVertexFormat >= 1)
    {
      uint64_t v75 = 0;
      do
        *((_DWORD *)v73 + v75++) = 1065353216;
      while (MTLVertexFormat > v75);
    }
    id v76 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, (uint64_t)v73, 4 * MTLVertexFormat, v61);
    if (!v70)
    {
      v124 = v74;
LABEL_148:
      free(v124);
      return v70;
    }
    objc_setProperty_nonatomic(v70, v77, v76, 40);
    free(v74);
    goto LABEL_91;
  }
  id v71 = (id)-[SCNMTLResourceManager newPrivateBufferWithBytes:length:blitEncoder:]((uint64_t)self->_resourceManager, v139, 4 * MTLVertexFormat, v61);
  if (v70)
  {
    objc_setProperty_nonatomic(v70, v72, v71, 40);
LABEL_91:
    v70->_vertexWeightIndexSize = v44;
    v70->_boneIndexSize = v135;
  }
  return v70;
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
  if (!self->_useFallbackCopyKernel)
  {
    vertexWeightIndicesBuffer = self->_vertexWeightIndicesBuffer;
    if (vertexWeightIndicesBuffer)
    {
      v9->_buffers[1] = vertexWeightIndicesBuffer;
      v9->_offsets[1] = 0;
      v9->_buffersToBind[0] |= 2uLL;
      vertexWeightIndicesBuffer = v9->_buffers[2];
    }
    boneIndicesBuffer = self->_boneIndicesBuffer;
    if (vertexWeightIndicesBuffer == boneIndicesBuffer)
    {
      if (!v9->_offsets[2]) {
        goto LABEL_11;
      }
    }
    else
    {
      v9->_buffers[2] = boneIndicesBuffer;
    }
    v9->_offsets[2] = 0;
    v9->_buffersToBind[0] |= 4uLL;
LABEL_11:
    boneWeightsBuffer = self->_boneWeightsBuffer;
    if (v9->_buffers[3] == boneWeightsBuffer)
    {
      if (!v9->_offsets[3])
      {
LABEL_15:
        v62[0] = 0;
        JointMatrices = (const void *)C3DSkinnerGetJointMatrices((uint64_t)self->_skinner, v62);
        SCNMTLComputeCommandEncoder::setBytes(v9, JointMatrices, 16 * v62[0], 4uLL);
        uint64_t v10 = 5;
        goto LABEL_16;
      }
    }
    else
    {
      v9->_buffers[3] = boneWeightsBuffer;
    }
    v9->_offsets[3] = 0;
    v9->_buffersToBind[0] |= 8uLL;
    goto LABEL_15;
  }
  uint64_t v10 = 1;
LABEL_16:
  var1 = (MTLBuffer *)a4->var1;
  var3 = (MTLBuffer *)a4->var3;
  var5 = (MTLBuffer *)a4->var5;
  unsigned int v61 = [(MTLBuffer *)var1 length] / 0xCuLL;
  if (self->_baseVertexCount != v61)
  {
    int v18 = scn_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLSkinDeformer updateWithComputeContext:buffers:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
  }
  SCNMTLComputeCommandEncoder::setBytes(v9, &v61, 4uLL, 0);
  if (v9->_buffers[v10] == var1)
  {
    unint64_t v28 = &v9->_buffers[v10];
    uint64_t v29 = v28[31];
    int v27 = v28 + 31;
    if (!v29) {
      goto LABEL_23;
    }
  }
  else
  {
    unint64_t v26 = &v9->_buffers[v10];
    *unint64_t v26 = var1;
    int v27 = v26 + 31;
  }
  *int v27 = 0;
  v9->_buffersToBind[0] |= (1 << v10);
LABEL_23:
  if (!self->_skinNormals) {
    goto LABEL_31;
  }
  uint64_t v30 = v61;
  if (v30 != [(MTLBuffer *)var3 length] / 0xCuLL)
  {
    unsigned int v31 = scn_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[SCNMTLSkinDeformer updateWithComputeContext:buffers:](v31, v32, v33, v34, v35, v36, v37, v38);
    }
  }
  uint64_t v39 = v10 + 1;
  if (v9->_buffers[v10 + 1] == var3)
  {
    v42 = &v9->_buffers[v39];
    v43 = v42[31];
    v41 = v42 + 31;
    if (!v43) {
      goto LABEL_31;
    }
  }
  else
  {
    unint64_t v40 = &v9->_buffers[v39];
    *unint64_t v40 = var3;
    v41 = v40 + 31;
  }
  void *v41 = 0;
  v9->_buffersToBind[0] |= (1 << v39);
LABEL_31:
  if (self->_skinTangents)
  {
    unint64_t v44 = v61;
    if (v44 > (unint64_t)[(MTLBuffer *)var5 length] >> 4)
    {
      char v45 = scn_default_log();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
        -[SCNMTLSkinDeformer updateWithComputeContext:buffers:](v45, v46, v47, v48, v49, v50, v51, v52);
      }
    }
    uint64_t v53 = v10 | 2;
    if (v9->_buffers[v10 | 2] != var5)
    {
      uint64_t v54 = &v9->_buffers[v53];
      *uint64_t v54 = var5;
      v55 = v54 + 31;
LABEL_38:
      void *v55 = 0;
      v9->_buffersToBind[0] |= (1 << v53);
      goto LABEL_39;
    }
    unsigned int v56 = &v9->_buffers[v53];
    v57 = v56[31];
    v55 = v56 + 31;
    if (v57) {
      goto LABEL_38;
    }
  }
LABEL_39:
  [a3 setStageInputOutputBuffersToEncoder:v9];
  memset(v62, 0, 24);
  encoder = v9->_encoder;
  v62[3] = v61;
  int64x2_t v63 = vdupq_n_s64(1uLL);
  [(MTLComputeCommandEncoder *)encoder setStageInRegion:v62];
  uint64_t v59 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_computePipeline);
  uint64_t v60 = v61;
  if (v9->_computePipelineState != (MTLComputePipelineState *)v59)
  {
    v9->_computePipelineState = (MTLComputePipelineState *)v59;
    [(MTLComputeCommandEncoder *)v9->_encoder setComputePipelineState:v59];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v9, v60);
  return 1;
}

+ (BOOL)canSkin:(void *)a3 reuseRenderResourceForSkin:
{
  self;
  int JointsCount = C3DSkinGetJointsCount((uint64_t)a3);
  if (JointsCount != C3DSkinGetJointsCount((uint64_t)a2)) {
    return 0;
  }
  uint64_t MTLVertexFormat = C3DMeshSourceGetMTLVertexFormat((uint64_t)a3);
  if (MTLVertexFormat != C3DMeshSourceGetMTLVertexFormat((uint64_t)a2)) {
    return 0;
  }
  uint64_t WeightsCount = C3DSkinGetWeightsCount((uint64_t)a3);
  if (WeightsCount != C3DSkinGetWeightsCount((uint64_t)a2)) {
    return 0;
  }
  uint64_t v8 = C3DSkinGetWeightsCount((uint64_t)a3);
  uint64_t v9 = C3DMeshSourceGetMTLVertexFormat((uint64_t)a3);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  C3DSkinGetVertexWeightsPointers(a3, &v16, &v14, &v12);
  C3DSkinGetVertexWeightsPointers(a2, &v15, &v13, &v11);
  if (v16 && v15)
  {
    if (memcmp(v16, v15, 8 * v9 + 8)) {
      return 0;
    }
  }
  else
  {
    BOOL result = 0;
    if (!v16 || !v15) {
      return result;
    }
  }
  if (!v14 || !v13)
  {
    BOOL result = 0;
    if (!v14 || !v13) {
      return result;
    }
    goto LABEL_16;
  }
  if (memcmp(v14, v13, 2 * v8)) {
    return 0;
  }
LABEL_16:
  if (v12 && v11) {
    return !memcmp(v12, v11, 4 * v8);
  }
  BOOL result = 0;
  if (v12 && v11) {
    return 1;
  }
  return result;
}

- (void)setupWithComputeContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setupWithComputeContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:.cold.1()
{
  OUTLINED_FUNCTION_2_4();
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_6(&dword_20B249000, v1, v2, "Error: Skinning internal consistency error - vertex count mismatch ('%d == %d' assertion failed)", v3, v4);
}

- (void)makeReadOnlyBuffersWithBaseGeometry:baseMesh:blitEncoder:.cold.2()
{
  OUTLINED_FUNCTION_2_4();
  HIWORD(v3) = v0;
  OUTLINED_FUNCTION_6(&dword_20B249000, v0, v1, "Error: Skinning internal consistency error - vertex count mismatch ('%d == %d' assertion failed)", v2, v3);
}

- (void)makeReadOnlyBuffersWithBaseGeometry:(uint64_t)a3 baseMesh:(uint64_t)a4 blitEncoder:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithComputeContext:(uint64_t)a3 buffers:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithComputeContext:(uint64_t)a3 buffers:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateWithComputeContext:(uint64_t)a3 buffers:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end