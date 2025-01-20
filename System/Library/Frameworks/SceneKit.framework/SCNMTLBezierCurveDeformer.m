@interface SCNMTLBezierCurveDeformer
+ (BOOL)deformsControlPointsForMeshlessGeometry:(__C3DGeometry *)a3;
+ (unint64_t)requiredInputs;
+ (unint64_t)requiredOutputs;
+ (unint64_t)supportedOutputs;
- (SCNMTLBezierCurveDeformer)initWithMeshlessGeometry:(__C3DGeometry *)a3 outputs:(unint64_t)a4 deformDataKind:(unsigned __int8)a5 finalDataKind:(unsigned __int8)a6 resourceManager:(id)a7 computeContext:(id)a8;
- (SCNMTLMesh)finalMesh;
- (id)bufferForCommonProfileArgumentNamed:(id)a3;
- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4;
- (void)dealloc;
@end

@implementation SCNMTLBezierCurveDeformer

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

- (SCNMTLBezierCurveDeformer)initWithMeshlessGeometry:(__C3DGeometry *)a3 outputs:(unint64_t)a4 deformDataKind:(unsigned __int8)a5 finalDataKind:(unsigned __int8)a6 resourceManager:(id)a7 computeContext:(id)a8
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)SCNMTLBezierCurveDeformer;
  v10 = [(SCNMTLBezierCurveDeformer *)&v40 init];
  if (!v10) {
    return v10;
  }
  *(__n128 *)v10->_anon_10 = C3DBezierCurveGeometryGetTransform((__n128 *)a3);
  *(_OWORD *)&v10->_anon_10[16] = v11;
  *(_OWORD *)&v10->_anon_10[32] = v12;
  *(_OWORD *)&v10->_anon_10[48] = v13;
  uint64_t BezierCurve = C3DBezierCurveGeometryGetBezierCurve((uint64_t)a3);
  unint64_t CurveInfo = C3DBezierCurveGetCurveInfo(BezierCurve);
  unint64_t v17 = v16;
  unsigned __int16 v39 = 0;
  CurveSegmentsControlPointIndices = (const void *)C3DBezierCurveGetCurveSegmentsControlPointIndices(BezierCurve, &v39);
  v10->_curveControlPointCount = CurveInfo;
  v10->_curveInfo.segmentCountLinear = WORD2(CurveInfo);
  v10->_curveInfo.segmentCountQuadratic = v17;
  unint64_t v19 = HIDWORD(v17);
  v10->_curveInfo.segmentCountCubic = WORD2(v17);
  v10->_curveInfo.segmentInfoOffsetLinear = 20;
  if (HIDWORD(CurveInfo))
  {
    unint64_t v20 = HIDWORD(CurveInfo) + 20;
    uint64_t v21 = v17;
    if (!v17) {
      goto LABEL_9;
    }
    if (CurveInfo >= 0xFFEC00000000) {
      -[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]();
    }
  }
  else
  {
    unint64_t v20 = 20;
    uint64_t v21 = v17;
    if (!v17)
    {
LABEL_9:
      v10->_curveInfo.segmentInfoOffsetQuadratic = v20;
      if (v19) {
        goto LABEL_10;
      }
      goto LABEL_8;
    }
  }
  v10->_curveInfo.segmentInfoOffsetQuadratic = v20;
  v20 += v21;
  if (v19)
  {
LABEL_10:
    if (v20 >= 0x10000) {
      -[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]();
    }
    v10->_curveInfo.segmentInfoOffsetCubic = v20;
    v20 += 114 * (8 * HIDWORD(v17));
    goto LABEL_12;
  }
LABEL_8:
  v10->_curveInfo.segmentInfoOffsetCubic = v20;
LABEL_12:
  unint64_t v22 = (v20 + 1) & 0x1FFFFFFFFFELL;
  if (v22 >= 0x10000) {
    -[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]();
  }
  uint64_t v23 = v39;
  size_t v24 = 2 * v39;
  v10->_curveInfo.controlPointIndicesOffset = v22;
  size_t v25 = v22 + 2 * v23;
  v26 = malloc_type_malloc(v25, 0xD2C895BBuLL);
  long long v27 = *(_OWORD *)&v10->_curveInfo.monotonicSubsegmentCountCubic;
  v26[4] = *(_DWORD *)&v10->_curveInfo.controlPointIndicesOffset;
  *(_OWORD *)v26 = v27;
  memcpy((char *)v26 + v10->_curveInfo.controlPointIndicesOffset, CurveSegmentsControlPointIndices, v24);
  v10->_bezierCurveInfoBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithBytes:length:options:]((uint64_t)a7, (uint64_t)v26, v25, 0);
  free(v26);
  v28 = (void *)[MEMORY[0x263F12A80] vertexDescriptor];
  LODWORD(v24) = SCNMTLVertexFormatGetSize(30);
  LODWORD(v25) = SCNMTLVertexFormatGetSize(29);
  v29 = objc_msgSend((id)objc_msgSend(v28, "attributes"), "objectAtIndexedSubscript:", 0);
  [v29 setFormat:30];
  [v29 setOffset:0];
  [v29 setBufferIndex:18];
  v30 = objc_msgSend((id)objc_msgSend(v28, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v29, "bufferIndex"));
  [v30 setStride:v24];
  [v30 setStepFunction:1];
  v31 = objc_msgSend((id)objc_msgSend(v28, "attributes"), "objectAtIndexedSubscript:", 6);
  [v31 setFormat:29];
  [v31 setOffset:0];
  [v31 setBufferIndex:19];
  v32 = objc_msgSend((id)objc_msgSend(v28, "layouts"), "objectAtIndexedSubscript:", objc_msgSend(v31, "bufferIndex"));
  [v32 setStride:v25];
  [v32 setStepFunction:1];
  v10->_quadTexcoordsBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)a7, 4 * v25, 32);
  v10->_quadPositionsBuffer = (MTLBuffer *)-[SCNMTLResourceManager newBufferWithLength:options:]((uint64_t)a7, 4 * v24, 32);
  v33 = objc_alloc_init(SCNMTLMeshElement);
  -[SCNMTLMesh setMutabilityTimestamp:]((uint64_t)v33, 4);
  [(SCNMTLMeshElement *)v33 setPrimitiveRange:2];
  v34 = objc_alloc_init(SCNMTLMesh);
  v10->_quadMesh = v34;
  -[SCNMTLMesh setVertexDescriptor:]((uint64_t)v34, v28);
  long long v42 = *(_OWORD *)&v10->_quadPositionsBuffer;
  -[SCNMTLMesh setBuffers:](v10->_quadMesh, (char *)[MEMORY[0x263EFF8C0] arrayWithObjects:&v42 count:2]);
  v41 = v33;
  -[SCNMTLMesh setElements:](v10->_quadMesh, (char *)[MEMORY[0x263EFF8C0] arrayWithObjects:&v41 count:1]);

  v10->_buildQuadGeometryPipeline = (SCNMTLComputePipeline *)(id)[a7 computePipelineStateForKernel:@"deformer_bezier_build_quad_geometry"];
  v10->_initBezierCurveInfoPipeline = (SCNMTLComputePipeline *)(id)[a7 computePipelineStateForKernel:@"deformer_bezier_init_info"];
  if (v10->_curveInfo.segmentCountLinear) {
    v35 = (SCNMTLComputePipeline *)(id)[a7 computePipelineStateForKernel:@"deformer_bezier_build_info_linear"];
  }
  else {
    v35 = 0;
  }
  v10->_buildBezierCurveInfoPipelineLinear = v35;
  if (v10->_curveInfo.segmentCountQuadratic) {
    v36 = (SCNMTLComputePipeline *)(id)[a7 computePipelineStateForKernel:@"deformer_bezier_build_info_quadratic"];
  }
  else {
    v36 = 0;
  }
  v10->_buildBezierCurveInfoPipelineQuadratic = v36;
  if (v10->_curveInfo.segmentCountCubic) {
    v37 = (SCNMTLComputePipeline *)(id)[a7 computePipelineStateForKernel:@"deformer_bezier_build_info_cubic"];
  }
  else {
    v37 = 0;
  }
  v10->_buildBezierCurveInfoPipelineCubic = v37;
  return v10;
}

+ (BOOL)deformsControlPointsForMeshlessGeometry:(__C3DGeometry *)a3
{
  return 0;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SCNMTLBezierCurveDeformer;
  [(SCNMTLBezierCurveDeformer *)&v3 dealloc];
}

- (SCNMTLMesh)finalMesh
{
  return self->_quadMesh;
}

- (id)bufferForCommonProfileArgumentNamed:(id)a3
{
  if ([a3 isEqualToString:@"scn_bezier_curve_data"])
  {
    uint64_t v5 = 128;
    return *(Class *)((char *)&self->super.isa + v5);
  }
  if ([a3 isEqualToString:@"scn_bezier_curve_controlPoints"])
  {
    uint64_t v5 = 136;
    return *(Class *)((char *)&self->super.isa + v5);
  }
  return 0;
}

- (unint64_t)updateWithComputeContext:(id)a3 buffers:(id *)a4
{
  unint64_t v7 = [a3 currentFrameHash];
  if (self->_currentFrameHash == v7) {
    return 0;
  }
  self->_currentFrameHash = v7;
  var0 = (MTLBuffer *)a4->var0;
  var1 = (MTLBuffer *)a4->var1;
  self->_lastDeformedCurveControlPointsBuffer = var1;
  long long v11 = (SCNMTLComputeCommandEncoder *)[a3 currentComputeEncoder];
  bzero(v11, 0x678uLL);
  int segmentCountLinear = self->_curveInfo.segmentCountLinear;
  int segmentCountQuadratic = self->_curveInfo.segmentCountQuadratic;
  unsigned int v38 = segmentCountQuadratic;
  v39[0] = segmentCountLinear;
  unsigned int segmentCountCubic = self->_curveInfo.segmentCountCubic;
  unsigned int v37 = segmentCountCubic;
  bezierCurveInfoBuffer = self->_bezierCurveInfoBuffer;
  if (bezierCurveInfoBuffer)
  {
    v11->_buffers[0] = bezierCurveInfoBuffer;
    v11->_offsets[0] = 0;
    v11->_buffersToBind[0] |= 1uLL;
  }
  unint64_t v16 = (MTLComputePipelineState *)-[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_initBezierCurveInfoPipeline);
  SCNMTLComputeCommandEncoder::dispatchOne(v11, v16);
  if (v11->_buffers[1] == var0)
  {
    if (!v11->_offsets[1]) {
      goto LABEL_9;
    }
  }
  else
  {
    v11->_buffers[1] = var0;
  }
  v11->_offsets[1] = 0;
  v11->_buffersToBind[0] |= 2uLL;
LABEL_9:
  if (!segmentCountLinear) {
    goto LABEL_21;
  }
  SCNMTLComputeCommandEncoder::setBytes(v11, v39, 4uLL, 0);
  unint64_t v17 = self->_bezierCurveInfoBuffer;
  unint64_t controlPointIndicesOffset = self->_curveInfo.controlPointIndicesOffset;
  if (v11->_buffers[2] == v17)
  {
    if (v11->_offsets[2] == controlPointIndicesOffset) {
      goto LABEL_14;
    }
  }
  else
  {
    v11->_buffers[2] = v17;
  }
  v11->_offsets[2] = controlPointIndicesOffset;
  v11->_buffersToBind[0] |= 4uLL;
  unint64_t v17 = self->_bezierCurveInfoBuffer;
LABEL_14:
  unint64_t segmentInfoOffsetLinear = self->_curveInfo.segmentInfoOffsetLinear;
  if (v11->_buffers[3] != v17)
  {
    v11->_buffers[3] = v17;
LABEL_17:
    v11->_offsets[3] = segmentInfoOffsetLinear;
    v11->_buffersToBind[0] |= 8uLL;
    goto LABEL_18;
  }
  if (v11->_offsets[3] != segmentInfoOffsetLinear) {
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v20 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_buildBezierCurveInfoPipelineLinear);
  uint64_t v21 = v39[0];
  if (v11->_computePipelineState != (MTLComputePipelineState *)v20)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v20;
    [(MTLComputeCommandEncoder *)v11->_encoder setComputePipelineState:v20];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v21);
  int segmentCountQuadratic = v38;
LABEL_21:
  if (segmentCountQuadratic < 1) {
    goto LABEL_33;
  }
  SCNMTLComputeCommandEncoder::setBytes(v11, &v38, 4uLL, 0);
  unint64_t v22 = self->_bezierCurveInfoBuffer;
  uint64_t v23 = self->_curveInfo.controlPointIndicesOffset + 4 * v39[0];
  if (v11->_buffers[2] == v22)
  {
    if (v11->_offsets[2] == v23) {
      goto LABEL_26;
    }
  }
  else
  {
    v11->_buffers[2] = v22;
  }
  v11->_offsets[2] = v23;
  v11->_buffersToBind[0] |= 4uLL;
  unint64_t v22 = self->_bezierCurveInfoBuffer;
LABEL_26:
  unint64_t segmentInfoOffsetQuadratic = self->_curveInfo.segmentInfoOffsetQuadratic;
  if (v11->_buffers[3] != v22)
  {
    v11->_buffers[3] = v22;
LABEL_29:
    v11->_offsets[3] = segmentInfoOffsetQuadratic;
    v11->_buffersToBind[0] |= 8uLL;
    goto LABEL_30;
  }
  if (v11->_offsets[3] != segmentInfoOffsetQuadratic) {
    goto LABEL_29;
  }
LABEL_30:
  uint64_t v25 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_buildBezierCurveInfoPipelineQuadratic);
  uint64_t v26 = v38;
  if (v11->_computePipelineState != (MTLComputePipelineState *)v25)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v25;
    [(MTLComputeCommandEncoder *)v11->_encoder setComputePipelineState:v25];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v26);
LABEL_33:
  if (!segmentCountCubic) {
    goto LABEL_49;
  }
  SCNMTLComputeCommandEncoder::setBytes(v11, &v37, 4uLL, 0);
  long long v27 = self->_bezierCurveInfoBuffer;
  uint64_t v28 = self->_curveInfo.controlPointIndicesOffset + 2 * (int)(3 * v38 + 2 * v39[0]);
  if (v11->_buffers[2] == v27)
  {
    if (v11->_offsets[2] == v28) {
      goto LABEL_38;
    }
  }
  else
  {
    v11->_buffers[2] = v27;
  }
  v11->_offsets[2] = v28;
  v11->_buffersToBind[0] |= 4uLL;
  long long v27 = self->_bezierCurveInfoBuffer;
LABEL_38:
  if (v11->_buffers[3] == v27)
  {
    if (!v11->_offsets[3]) {
      goto LABEL_42;
    }
  }
  else
  {
    v11->_buffers[3] = v27;
  }
  v11->_offsets[3] = 0;
  v11->_buffersToBind[0] |= 8uLL;
  long long v27 = self->_bezierCurveInfoBuffer;
LABEL_42:
  unint64_t segmentInfoOffsetCubic = self->_curveInfo.segmentInfoOffsetCubic;
  if (v11->_buffers[4] != v27)
  {
    v11->_buffers[4] = v27;
LABEL_45:
    v11->_offsets[4] = segmentInfoOffsetCubic;
    v11->_buffersToBind[0] |= 0x10uLL;
    goto LABEL_46;
  }
  if (v11->_offsets[4] != segmentInfoOffsetCubic) {
    goto LABEL_45;
  }
LABEL_46:
  uint64_t v30 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_buildBezierCurveInfoPipelineCubic);
  uint64_t v31 = v37;
  if (v11->_computePipelineState != (MTLComputePipelineState *)v30)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v30;
    [(MTLComputeCommandEncoder *)v11->_encoder setComputePipelineState:v30];
  }
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, v31);
LABEL_49:
  unsigned int curveControlPointCount = self->_curveControlPointCount;
  SCNMTLComputeCommandEncoder::setBytes(v11, &curveControlPointCount, 4uLL, 0);
  SCNMTLComputeCommandEncoder::setBytes(v11, self->_anon_10, 0x40uLL, 1uLL);
  if (v11->_buffers[2] == var1)
  {
    if (!v11->_offsets[2]) {
      goto LABEL_53;
    }
  }
  else
  {
    v11->_buffers[2] = var1;
  }
  v11->_offsets[2] = 0;
  v11->_buffersToBind[0] |= 4uLL;
LABEL_53:
  quadPositionsBuffer = self->_quadPositionsBuffer;
  if (v11->_buffers[3] == quadPositionsBuffer)
  {
    if (!v11->_offsets[3]) {
      goto LABEL_57;
    }
  }
  else
  {
    v11->_buffers[3] = quadPositionsBuffer;
  }
  v11->_offsets[3] = 0;
  v11->_buffersToBind[0] |= 8uLL;
LABEL_57:
  quadTexcoordsBuffer = self->_quadTexcoordsBuffer;
  if (v11->_buffers[4] != quadTexcoordsBuffer)
  {
    v11->_buffers[4] = quadTexcoordsBuffer;
LABEL_60:
    v11->_offsets[4] = 0;
    v11->_buffersToBind[0] |= 0x10uLL;
    goto LABEL_61;
  }
  if (v11->_offsets[4]) {
    goto LABEL_60;
  }
LABEL_61:
  uint64_t v34 = -[SCNMTLOpenSubdivComputeEvaluator computeEvaluator]((uint64_t)self->_buildQuadGeometryPipeline);
  if (v11->_computePipelineState != (MTLComputePipelineState *)v34)
  {
    v11->_computePipelineState = (MTLComputePipelineState *)v34;
    [(MTLComputeCommandEncoder *)v11->_encoder setComputePipelineState:v34];
  }
  unint64_t v8 = 1;
  SCNMTLComputeCommandEncoder::dispatchOnGrid1D(v11, 1);
  return v8;
}

- (void)initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:.cold.1()
{
  __assert_rtn("-[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]", "SCNMTLBezierCurveDeformer.mm", 159, "offset <= UINT16_MAX");
}

- (void)initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:.cold.2()
{
  __assert_rtn("-[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]", "SCNMTLBezierCurveDeformer.mm", 149, "offset <= UINT16_MAX");
}

- (void)initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:.cold.3()
{
  __assert_rtn("-[SCNMTLBezierCurveDeformer initWithMeshlessGeometry:outputs:deformDataKind:finalDataKind:resourceManager:computeContext:]", "SCNMTLBezierCurveDeformer.mm", 140, "offset <= UINT16_MAX");
}

@end