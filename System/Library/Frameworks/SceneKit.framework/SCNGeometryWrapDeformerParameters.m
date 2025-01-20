@interface SCNGeometryWrapDeformerParameters
+ (BOOL)supportsSecureCoding;
- (SCNGeometryWrapDeformerParameters)initWithCoder:(id)a3;
- (SCNGeometryWrapDeformerParameters)initWithDrivingNode:(__n128)a3 deformedNode:(__n128)a4 bindingMode:(__n128)a5 bindingTransform:(uint64_t)a6 drivingNodeUVChannel:(uint64_t)a7 deformedNodeUVChannel:(uint64_t)a8;
- (SCNGeometryWrapDeformerParameters)initWithInnerLayerNode:(__n128)a3 outerLayerNode:(__n128)a4 deformedNode:(__n128)a5 bindingMode:(uint64_t)a6 bindingTransform:(uint64_t)a7;
- (id)extraLayerMeshesWithDrivingMesh0:(__C3DMesh *)a3 drivingMesh1:(__C3DMesh *)a4;
- (unint64_t)bindingMode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)initParametersIfNeededWithDrivingNodeRef:(__C3DNode *)a3 deformedNodeRef:;
- (void)initParametersIfNeededWithInnerLayerNodeRef:(SCNGeometryWrapDeformerParameters *)self outerLayerNodeRef:(SEL)a2 deformedNodeRef:(__C3DNode *)a3;
@end

@implementation SCNGeometryWrapDeformerParameters

- (SCNGeometryWrapDeformerParameters)initWithDrivingNode:(__n128)a3 deformedNode:(__n128)a4 bindingMode:(__n128)a5 bindingTransform:(uint64_t)a6 drivingNodeUVChannel:(uint64_t)a7 deformedNodeUVChannel:(uint64_t)a8
{
  v24.receiver = a1;
  v24.super_class = (Class)SCNGeometryWrapDeformerParameters;
  v16 = [(SCNGeometryWrapDeformerParameters *)&v24 init];
  v17 = v16;
  if (v16)
  {
    v16->_isLegacySingleLayerDeformer = 1;
    v16->_bindingMode = a9;
    *(__n128 *)v16->_anon_a0 = a2;
    *(__n128 *)&v16->_anon_a0[16] = a3;
    *(__n128 *)&v16->_anon_a0[32] = a4;
    *(__n128 *)&v16->_anon_a0[48] = a5;
    v16->_legacyDrivingNodeUVChannel = a10;
    v16->_legacyDeformedNodeUVChannel = a11;
    +[SCNTransaction begin];
    +[SCNTransaction setAnimationDuration:0.0];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __142__SCNGeometryWrapDeformerParameters_initWithDrivingNode_deformedNode_bindingMode_bindingTransform_drivingNodeUVChannel_deformedNodeUVChannel___block_invoke;
    v23[3] = &unk_264007BD0;
    v23[4] = v17;
    v23[5] = a7;
    v23[6] = a8;
    +[SCNTransaction enqueueCommandForObject:a8 immediateTransactionBlock:v23];
    +[SCNTransaction commit];
  }
  return v17;
}

uint64_t __142__SCNGeometryWrapDeformerParameters_initWithDrivingNode_deformedNode_bindingMode_bindingTransform_drivingNodeUVChannel_deformedNodeUVChannel___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) nodeRef];
  uint64_t v4 = [*(id *)(a1 + 48) nodeRef];

  return [v2 initParametersIfNeededWithDrivingNodeRef:v3 deformedNodeRef:v4];
}

- (SCNGeometryWrapDeformerParameters)initWithInnerLayerNode:(__n128)a3 outerLayerNode:(__n128)a4 deformedNode:(__n128)a5 bindingMode:(uint64_t)a6 bindingTransform:(uint64_t)a7
{
  v22.receiver = a1;
  v22.super_class = (Class)SCNGeometryWrapDeformerParameters;
  v14 = [(SCNGeometryWrapDeformerParameters *)&v22 init];
  v15 = v14;
  if (v14)
  {
    v14->_bindingMode = a10;
    *(__n128 *)v14->_anon_a0 = a2;
    *(__n128 *)&v14->_anon_a0[16] = a3;
    *(__n128 *)&v14->_anon_a0[32] = a4;
    *(__n128 *)&v14->_anon_a0[48] = a5;
    +[SCNTransaction begin];
    +[SCNTransaction setAnimationDuration:0.0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __117__SCNGeometryWrapDeformerParameters_initWithInnerLayerNode_outerLayerNode_deformedNode_bindingMode_bindingTransform___block_invoke;
    v21[3] = &unk_264007BF8;
    v21[4] = v15;
    v21[5] = a7;
    v21[6] = a8;
    v21[7] = a9;
    +[SCNTransaction enqueueCommandForObject:a9 immediateTransactionBlock:v21];
    +[SCNTransaction commit];
  }
  return v15;
}

uint64_t __117__SCNGeometryWrapDeformerParameters_initWithInnerLayerNode_outerLayerNode_deformedNode_bindingMode_bindingTransform___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) nodeRef];
  uint64_t v4 = [*(id *)(a1 + 48) nodeRef];
  uint64_t v5 = [*(id *)(a1 + 56) nodeRef];

  return [v2 initParametersIfNeededWithInnerLayerNodeRef:v3 outerLayerNodeRef:v4 deformedNodeRef:v5];
}

- (void)dealloc
{
  free(self->_bindingData.pointIndices);
  free(self->_bindingData.barycentricCoords);
  free(self->_bindingData.innerLayerInfluences);
  free(self->_bindingData.innerLayerTNBs);
  free(self->_bindingData.outerLayerTNBs);
  free(self->_bindingData.innerLayerOffsets);
  free(self->_bindingData.outerLayerOffsets);
  free(self->_bindingData.legacyOffsetsOrTransforms);
  v3.receiver = self;
  v3.super_class = (Class)SCNGeometryWrapDeformerParameters;
  [(SCNGeometryWrapDeformerParameters *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)bindingMode
{
  return self->_bindingMode;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_vertexCount forKey:@"vertexCount"];
  [a3 encodeInt32:LODWORD(self->_bindingMode) forKey:@"bindingMode"];
  [a3 encodeInt32:LODWORD(self->_bindingData.pointIndicesStride) forKey:@"bindingPointIndicesStride"];
  [a3 encodeInt32:LODWORD(self->_bindingData.barycentricCoordsStride) forKey:@"bindingBarycentricCoordsStride"];
  [a3 encodeInt32:LODWORD(self->_bindingData.pointIndicesFormat) forKey:@"bindingPointIndicesFormat"];
  [a3 encodeInt32:LODWORD(self->_bindingData.barycentricCoordsFormat) forKey:@"bindingBarycentricCoordsFormat"];
  [a3 encodeBytes:self->_bindingData.pointIndices length:self->_bindingData.pointIndicesStride * self->_vertexCount forKey:@"bindingPointIndices"];
  [a3 encodeBytes:self->_bindingData.barycentricCoords length:self->_bindingData.barycentricCoordsStride * self->_vertexCount forKey:@"bindingBarycentricCoords"];
  if (self->_isLegacySingleLayerDeformer)
  {
    [a3 encodeBool:1 forKey:@"isLegacySingleLayerDeformer"];
    unint64_t legacyOffsetsOrTransformsLength = self->_bindingData.legacyOffsetsOrTransformsLength;
    p_unint64_t legacyOffsetsOrTransformsLength = &self->_bindingData.legacyOffsetsOrTransformsLength;
    [a3 encodeBytes:*(p_legacyOffsetsOrTransformsLength - 1) length:legacyOffsetsOrTransformsLength forKey:@"bindingOffsetsOrTransforms"];
    v7 = @"bindingOffsetsOrTransformsLength";
  }
  else
  {
    [a3 encodeBytes:self->_bindingData.innerLayerInfluences length:self->_bindingData.innerLayerInfluencesLength forKey:@"bindingInnerLayerInfluences"];
    [a3 encodeInt32:LODWORD(self->_bindingData.innerLayerInfluencesLength) forKey:@"bindingInnerLayerInfluencesLength"];
    if (self->_bindingMode != 1) {
      return;
    }
    [a3 encodeBytes:self->_bindingData.innerLayerTNBs length:self->_bindingData.tnbMatricesLength forKey:@"bindingInnerTNBs"];
    [a3 encodeBytes:self->_bindingData.outerLayerTNBs length:self->_bindingData.tnbMatricesLength forKey:@"bindingOuterTNBs"];
    [a3 encodeInt32:LODWORD(self->_bindingData.tnbMatricesLength) forKey:@"bindingSpaceVectorsLength"];
    unint64_t offsetsLength = self->_bindingData.offsetsLength;
    p_unint64_t legacyOffsetsOrTransformsLength = &self->_bindingData.offsetsLength;
    [a3 encodeBytes:*(p_legacyOffsetsOrTransformsLength - 2) length:offsetsLength forKey:@"bindingInnerOffsets"];
    [a3 encodeBytes:*(p_legacyOffsetsOrTransformsLength - 1) length:*p_legacyOffsetsOrTransformsLength forKey:@"bindingOuterOffsets"];
    v7 = @"bindingOffsetsLength";
  }
  uint64_t v9 = *(unsigned int *)p_legacyOffsetsOrTransformsLength;

  [a3 encodeInt32:v9 forKey:v7];
}

- (SCNGeometryWrapDeformerParameters)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)SCNGeometryWrapDeformerParameters;
  uint64_t v4 = [(SCNGeometryWrapDeformerParameters *)&v26 init];
  if (v4)
  {
    v4->_uint64_t vertexCount = [a3 decodeInt32ForKey:@"vertexCount"];
    v4->_bindingMode = (int)[a3 decodeInt32ForKey:@"bindingMode"];
    v4->_bindingData.pointIndicesStride = (int)[a3 decodeInt32ForKey:@"bindingPointIndicesStride"];
    v4->_bindingData.barycentricCoordsStride = (int)[a3 decodeInt32ForKey:@"bindingBarycentricCoordsStride"];
    v4->_bindingData.pointIndicesFormat = [a3 decodeIntegerForKey:@"bindingPointIndicesFormat"];
    v4->_bindingData.barycentricCoordsFormat = [a3 decodeIntegerForKey:@"bindingBarycentricCoordsFormat"];
    uint64_t vertexCount = v4->_vertexCount;
    size_t v6 = v4->_bindingData.pointIndicesStride * vertexCount;
    size_t v7 = v4->_bindingData.barycentricCoordsStride * vertexCount;
    v4->_bindingData.pointIndices = malloc_type_malloc(v6, 0x6FF4546EuLL);
    v4->_bindingData.barycentricCoords = malloc_type_malloc(v7, 0xC143D459uLL);
    size_t __n = 0;
    v8 = (const void *)[a3 decodeBytesForKey:@"bindingPointIndices" returnedLength:&__n];
    if (__n != v6) {
      -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.8();
    }
    memcpy(v4->_bindingData.pointIndices, v8, v6);
    uint64_t v9 = (const void *)[a3 decodeBytesForKey:@"bindingBarycentricCoords" returnedLength:&__n];
    if (__n != v7) {
      -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.7();
    }
    memcpy(v4->_bindingData.barycentricCoords, v9, v7);
    int v10 = [a3 decodeBoolForKey:@"isLegacySingleLayerDeformer"];
    v4->_isLegacySingleLayerDeformer = v10;
    if (v10)
    {
      int v11 = [a3 decodeInt32ForKey:@"bindingOffsetsOrTransformsLength"];
      v4->_bindingData.unint64_t legacyOffsetsOrTransformsLength = v11;
      v4->_bindingData.legacyOffsetsOrTransforms = (float *)malloc_type_malloc(v11, 0xAE8E491uLL);
      size_t __n = 0;
      uint64_t v12 = [a3 decodeBytesForKey:@"bindingOffsetsOrTransforms" returnedLength:&__n];
      size_t v13 = __n;
      if (__n != v4->_bindingData.legacyOffsetsOrTransformsLength) {
        -[SCNGeometryWrapDeformerParameters initWithCoder:]();
      }
      v14 = (const void *)v12;
      legacyOffsetsOrTransforms = v4->_bindingData.legacyOffsetsOrTransforms;
LABEL_14:
      memcpy(legacyOffsetsOrTransforms, v14, v13);
      return v4;
    }
    int v16 = [a3 decodeInt32ForKey:@"bindingInnerLayerInfluencesLength"];
    v4->_bindingData.innerLayerInfluencesLength = v16;
    v4->_bindingData.innerLayerInfluences = (float *)malloc_type_malloc(v16, 0x88916601uLL);
    size_t __n = 0;
    v17 = (const void *)[a3 decodeBytesForKey:@"bindingInnerLayerInfluences" returnedLength:&__n];
    if (__n != v4->_bindingData.innerLayerInfluencesLength) {
      -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.6();
    }
    memcpy(v4->_bindingData.innerLayerInfluences, v17, __n);
    if (v4->_bindingMode == 1)
    {
      int v18 = [a3 decodeInt32ForKey:@"bindingSpaceVectorsLength"];
      v4->_bindingData.tnbMatricesLength = v18;
      v4->_bindingData.innerLayerTNBs = (float *)malloc_type_malloc(v18, 0x76B5D387uLL);
      v4->_bindingData.outerLayerTNBs = (float *)malloc_type_malloc(v4->_bindingData.tnbMatricesLength, 0xFEFA8B55uLL);
      size_t __n = 0;
      v19 = (const void *)[a3 decodeBytesForKey:@"bindingInnerTNBs" returnedLength:&__n];
      if (__n != v4->_bindingData.tnbMatricesLength) {
        -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.5();
      }
      memcpy(v4->_bindingData.innerLayerTNBs, v19, __n);
      v20 = (const void *)[a3 decodeBytesForKey:@"bindingOuterTNBs" returnedLength:&__n];
      if (__n != v4->_bindingData.tnbMatricesLength) {
        -[SCNGeometryWrapDeformerParameters initWithCoder:].cold.4();
      }
      memcpy(v4->_bindingData.outerLayerTNBs, v20, __n);
      int v21 = [a3 decodeInt32ForKey:@"bindingOffsetsLength"];
      v4->_bindingData.unint64_t offsetsLength = v21;
      v4->_bindingData.innerLayerOffsets = (float *)malloc_type_malloc(v21, 0x8B1D5943uLL);
      v4->_bindingData.outerLayerOffsets = (float *)malloc_type_malloc(v4->_bindingData.offsetsLength, 0x84C0860AuLL);
      objc_super v22 = (const void *)[a3 decodeBytesForKey:@"bindingInnerOffsets" returnedLength:&__n];
      if (__n != v4->_bindingData.offsetsLength) {
        -[SCNGeometryWrapDeformerParameters initWithCoder:]();
      }
      memcpy(v4->_bindingData.innerLayerOffsets, v22, __n);
      uint64_t v23 = [a3 decodeBytesForKey:@"bindingOuterOffsets" returnedLength:&__n];
      size_t v13 = __n;
      if (__n != v4->_bindingData.offsetsLength) {
        -[SCNGeometryWrapDeformerParameters initWithCoder:]();
      }
      v14 = (const void *)v23;
      legacyOffsetsOrTransforms = v4->_bindingData.outerLayerOffsets;
      goto LABEL_14;
    }
  }
  return v4;
}

- (void)initParametersIfNeededWithDrivingNodeRef:(__C3DNode *)a3 deformedNodeRef:
{
  if (!self->_vertexCount)
  {
    uint64_t v4 = v3;
    free(self->_bindingData.pointIndices);
    free(self->_bindingData.barycentricCoords);
    free(self->_bindingData.legacyOffsetsOrTransforms);
    uint64_t Geometry = C3DNodeGetGeometry((uint64_t)a3);
    uint64_t Mesh = C3DGeometryGetMesh(Geometry);
    uint64_t v9 = C3DNodeGetGeometry(v4);
    uint64_t v10 = C3DGeometryGetMesh(v9);
    PositionSource = C3DMeshGetPositionSource(Mesh, 0);
    uint64_t v12 = C3DMeshGetPositionSource(v10, 0);
    uint64_t ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(Mesh, 0, 0);
    uint64_t v36 = C3DMeshGetChannelForSourceWithSemanticAtIndex(v10, 0, 0);
    uint64_t v38 = (uint64_t)v12;
    unsigned int Count = C3DMeshSourceGetCount((uint64_t)v12);
    self->_uint64_t vertexCount = Count;
    *(_OWORD *)&self->_bindingData.barycentricCoordsStride = xmmword_20B5EDEB0;
    v14 = malloc_type_malloc(4 * (Count & 0x7FFFFFFF), 0x1000040BDFB0063uLL);
    self->_bindingData.barycentricCoords = v14;
    unsigned int v15 = C3DMeshSourceGetCount((uint64_t)PositionSource) - 1;
    uint64_t v16 = 1;
    if (v15 > 0xFF) {
      uint64_t v16 = 2;
    }
    unsigned int v17 = HIWORD(v15);
    if (HIWORD(v15)) {
      uint64_t v18 = 4;
    }
    else {
      uint64_t v18 = v16;
    }
    unint64_t v19 = 3 << (v15 > 0xFF);
    if (v17) {
      unint64_t v19 = 12;
    }
    self->_bindingData.pointIndicesStride = v19;
    v20 = malloc_type_malloc(v19 * (unint64_t)self->_vertexCount, 0x7AFBD8ACuLL);
    self->_bindingData.pointIndices = v20;
    uint64_t v39 = (uint64_t)PositionSource;
    uint64_t v35 = (uint64_t)v14;
    if (v18 == 1)
    {
      uint64_t v22 = 0;
      unint64_t v23 = 2;
      uint64_t v21 = (uint64_t)v20;
    }
    else
    {
      uint64_t v21 = 0;
      if (v18 == 2)
      {
        unint64_t v23 = 14;
        uint64_t v22 = (uint64_t)v20;
      }
      else
      {
        uint64_t v22 = 0;
        unint64_t v23 = 38;
      }
    }
    self->_bindingData.pointIndicesFormat = v23;
    if (v17) {
      uint64_t v24 = (uint64_t)v20;
    }
    else {
      uint64_t v24 = 0;
    }
    SourceWithSemanticAtIndex = C3DMeshGetSourceWithSemanticAtIndex(Mesh, 3, self->_legacyDrivingNodeUVChannel, 0);
    if (!SourceWithSemanticAtIndex)
    {
      objc_super v26 = scn_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[SCNGeometryWrapDeformerParameters initParametersIfNeededWithDrivingNodeRef:deformedNodeRef:](v26, v27, v28);
      }
    }
    v29 = C3DMeshGetSourceWithSemanticAtIndex(v10, 3, self->_legacyDeformedNodeUVChannel, 0);
    if (!v29)
    {
      v30 = scn_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT)) {
        -[SCNGeometryWrapDeformerParameters initParametersIfNeededWithDrivingNodeRef:deformedNodeRef:](v30, v31, v32);
      }
    }
    uint64_t v33 = C3DMeshGetChannelForSourceWithSemanticAtIndex(Mesh, 3, self->_legacyDrivingNodeUVChannel);
    uint64_t v34 = C3DMeshGetChannelForSourceWithSemanticAtIndex(v10, 3, self->_legacyDeformedNodeUVChannel);
    C3DWrapDeformerComputeBindingPointIndicesAndBarycentricCoordsFromUVs(self->_bindingMode, self->_vertexCount, v10, Mesh, v38, v39, (uint64_t)v29, (uint64_t)SourceWithSemanticAtIndex, *(float32x4_t *)self->_anon_a0, *(float32x4_t *)&self->_anon_a0[16], *(float32x4_t *)&self->_anon_a0[32], *(float32x4_t *)&self->_anon_a0[48], v36, v34, ChannelForSourceWithSemanticAtIndex, v33, 0, v21, v22,
      v24,
      0,
      v35,
      &self->_bindingData.legacyOffsetsOrTransforms,
      &self->_bindingData.legacyOffsetsOrTransformsLength);
  }
}

- (void)initParametersIfNeededWithInnerLayerNodeRef:(SCNGeometryWrapDeformerParameters *)self outerLayerNodeRef:(SEL)a2 deformedNodeRef:(__C3DNode *)a3
{
  if (!self->_vertexCount)
  {
    uint64_t v5 = v4;
    uint64_t v6 = v3;
    free(self->_bindingData.pointIndices);
    free(self->_bindingData.barycentricCoords);
    free(self->_bindingData.innerLayerInfluences);
    free(self->_bindingData.innerLayerTNBs);
    free(self->_bindingData.outerLayerTNBs);
    free(self->_bindingData.innerLayerOffsets);
    free(self->_bindingData.outerLayerOffsets);
    uint64_t Geometry = C3DNodeGetGeometry((uint64_t)a3);
    uint64_t Mesh = C3DGeometryGetMesh(Geometry);
    uint64_t v11 = C3DNodeGetGeometry(v6);
    uint64_t v12 = C3DGeometryGetMesh(v11);
    uint64_t v13 = C3DNodeGetGeometry(v5);
    uint64_t v14 = C3DGeometryGetMesh(v13);
    PositionSource = C3DMeshGetPositionSource(Mesh, 0);
    uint64_t v39 = C3DMeshGetPositionSource(v12, 0);
    int v41 = v14;
    unsigned int v15 = C3DMeshGetPositionSource(v14, 0);
    uint64_t ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex(Mesh, 0, 0);
    uint64_t v36 = C3DMeshGetChannelForSourceWithSemanticAtIndex(v12, 0, 0);
    uint64_t v38 = (uint64_t)v15;
    unsigned int Count = C3DMeshSourceGetCount((uint64_t)v15);
    self->_uint64_t vertexCount = Count;
    *(_OWORD *)&self->_bindingData.barycentricCoordsStride = xmmword_20B5EDEC0;
    unsigned int v17 = malloc_type_malloc(8 * (Count & 0x7FFFFFFF), 0x100004052888210uLL);
    uint64_t v18 = 0;
    self->_bindingData.barycentricCoords = v17;
    char v19 = 1;
    do
    {
      int v20 = v19 & 1;
      if (v19) {
        uint64_t v21 = Mesh;
      }
      else {
        uint64_t v21 = v12;
      }
      uint64_t v22 = C3DMeshGetPositionSource(v21, 0);
      uint64_t v23 = C3DMeshSourceGetCount((uint64_t)v22);
      char v19 = 0;
      if (v18 <= v23) {
        uint64_t v18 = v23;
      }
    }
    while (v20);
    unsigned int v24 = v18 - 1;
    uint64_t v25 = 1;
    if ((v18 - 1) > 0xFF) {
      uint64_t v25 = 2;
    }
    unsigned int v26 = HIWORD(v24);
    if (HIWORD(v24)) {
      uint64_t v27 = 4;
    }
    else {
      uint64_t v27 = v25;
    }
    unint64_t v28 = 3 << ((v18 - 1) > 0xFF);
    if (v26) {
      unint64_t v28 = 12;
    }
    self->_bindingData.pointIndicesStride = v28;
    v29 = malloc_type_malloc(v28 * (unint64_t)self->_vertexCount, 0xD353DEA5uLL);
    self->_bindingData.pointIndices = v29;
    if (v27 == 1)
    {
      uint64_t v31 = 0;
      unint64_t v32 = 2;
      uint64_t v30 = (uint64_t)v29;
    }
    else
    {
      uint64_t v30 = 0;
      if (v27 == 2)
      {
        unint64_t v32 = 14;
        uint64_t v31 = (uint64_t)v29;
      }
      else
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        unint64_t v32 = 38;
      }
    }
    self->_bindingData.pointIndicesFormat = v32;
    if (v26) {
      uint64_t v33 = (uint64_t)v29;
    }
    else {
      uint64_t v33 = 0;
    }
    unint64_t v34 = 4 * self->_vertexCount;
    self->_bindingData.innerLayerInfluencesLength = v34;
    uint64_t v35 = (float *)malloc_type_malloc(v34, 0xE9686779uLL);
    self->_bindingData.innerLayerInfluences = v35;
    C3DWrapDeformerComputeSharedBindingPointIndicesAndBarycentricCoordsFromSandwichedPositions(self->_bindingMode, self->_vertexCount, v41, Mesh, v12, v38, (uint64_t)PositionSource, (uint64_t)v39, *(__n128 *)self->_anon_a0, *(__n128 *)&self->_anon_a0[16], *(__n128 *)&self->_anon_a0[32], *(__n128 *)&self->_anon_a0[48], ChannelForSourceWithSemanticAtIndex, v36, 1, v30, v31, v33, (uint64_t)v17,
      0,
      (uint64_t)v35,
      (void **)&self->_bindingData.innerLayerTNBs,
      (void **)&self->_bindingData.outerLayerTNBs,
      &self->_bindingData.tnbMatricesLength,
      (void **)&self->_bindingData.innerLayerOffsets,
      &self->_bindingData.outerLayerOffsets,
      &self->_bindingData.offsetsLength);
  }
}

- (id)extraLayerMeshesWithDrivingMesh0:(__C3DMesh *)a3 drivingMesh1:(__C3DMesh *)a4
{
  PositionSource = C3DMeshGetPositionSource((uint64_t)a3, 0);
  size_t v7 = C3DMeshGetPositionSource((uint64_t)a4, 0);
  uint64_t Count = C3DMeshSourceGetCount((uint64_t)PositionSource);
  uint64_t v27 = a3;
  char ChannelForSourceWithSemanticAtIndex = C3DMeshGetChannelForSourceWithSemanticAtIndex((uint64_t)a3, 0, 0);
  unint64_t v28 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:39];
  CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFAllocatorRef bytesDeallocator = (const __CFAllocator *)*MEMORY[0x263EFFB18];
  for (unint64_t i = 1; i != 40; ++i)
  {
    uint64_t v11 = (const UInt8 *)malloc_type_malloc(12 * Count, 0x15D041F9uLL);
    if (Count >= 1)
    {
      uint64_t v12 = 0;
      double v13 = (double)i * 0.025;
      *(float *)&double v13 = v13;
      float32x4_t v29 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v13, 0);
      unsigned int v14 = 2;
      unsigned int v15 = 1;
      do
      {
        *(double *)v16.i64 = C3DMeshSourceGetValueAtIndexAsVector3((uint64_t)PositionSource, v12);
        float32x4_t v30 = v16;
        *(double *)v17.i64 = C3DMeshSourceGetValueAtIndexAsVector3((uint64_t)v7, v12);
        float32x4_t v18 = vmlaq_f32(v30, vsubq_f32(v17, v30), v29);
        *(_DWORD *)&v11[4 * v14 - 8] = v18.i32[0];
        *(_DWORD *)&v11[4 * v14 - 4] = v18.i32[1];
        *(_DWORD *)&v11[4 * v14] = v18.i32[2];
        uint64_t v12 = v15;
        v14 += 3;
      }
      while (Count > v15++);
    }
    CFDataRef v20 = CFDataCreateWithBytesNoCopy(v9, v11, 12 * Count, bytesDeallocator);
    values = 0;
    values = (void *)C3DMeshSourceCreate(v20, 0, Count, 3, 1);
    CFArrayRef v21 = CFArrayCreate(v9, (const void **)&values, 1, MEMORY[0x263EFFF70]);
    char v31 = ChannelForSourceWithSemanticAtIndex;
    CFArrayRef MeshElements = (const __CFArray *)C3DMeshGetMeshElements((uint64_t)v27, 0);
    uint64_t v23 = (const void *)C3DMeshCreateWithMeshSourcesAndMeshElements(v21, MeshElements, (uint64_t)&v31);
    [v28 addObject:v23];
    CFRelease(v23);
    CFRelease(v21);
  }
  return v28;
}

- (void)initWithCoder:.cold.1()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 213, "decodedLength == _bindingData.legacyOffsetsOrTransformsLength");
}

- (void)initWithCoder:.cold.2()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 250, "decodedLength == _bindingData.offsetsLength");
}

- (void)initWithCoder:.cold.3()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 246, "decodedLength == _bindingData.offsetsLength");
}

- (void)initWithCoder:.cold.4()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 238, "decodedLength == _bindingData.tnbMatricesLength");
}

- (void)initWithCoder:.cold.5()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 234, "decodedLength == _bindingData.tnbMatricesLength");
}

- (void)initWithCoder:.cold.6()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 223, "decodedLength == _bindingData.innerLayerInfluencesLength");
}

- (void)initWithCoder:.cold.7()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 202, "decodedLength == bindingBarycentricCoordsLength");
}

- (void)initWithCoder:.cold.8()
{
  __assert_rtn("-[SCNGeometryWrapDeformerParameters initWithCoder:]", "SCNGeometryWrapDeformer.mm", 198, "decodedLength == bindingPointIndicesLength");
}

- (void)initParametersIfNeededWithDrivingNodeRef:(uint64_t)a3 deformedNodeRef:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "deformedTexcoordSource";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

- (void)initParametersIfNeededWithDrivingNodeRef:(uint64_t)a3 deformedNodeRef:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 136315138;
  uint64_t v4 = "driverTexcoordSource";
  OUTLINED_FUNCTION_1(&dword_20B249000, a1, a3, "Assertion '%s' failed. Null argument", (uint8_t *)&v3);
}

@end