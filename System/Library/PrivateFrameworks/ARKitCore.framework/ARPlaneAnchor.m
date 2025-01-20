@interface ARPlaneAnchor
+ (BOOL)supportsSecureCoding;
- (ARPatchGrid)gridExtent;
- (ARPlaneAnchor)initWithAnchor:(id)a3;
- (ARPlaneAnchor)initWithCoder:(id)a3;
- (ARPlaneAnchor)initWithIdentifier:(uint64_t)a3 transform:(int64_t)a4 alignment:;
- (ARPlaneAnchorAlignment)alignment;
- (ARPlaneClassification)classification;
- (ARPlaneClassificationStatus)classificationStatus;
- (ARPlaneExtent)planeExtent;
- (ARPlaneGeometry)geometry;
- (NSDictionary)possibleClassifications;
- (NSDictionary)tracingEntry;
- (NSString)classificationLabel;
- (NSString)description;
- (float)area;
- (float)uncertaintyAlongNormal;
- (id)_description:(BOOL)a3;
- (id)_hitTestFromOrigin:(ARPlaneAnchor *)self withDirection:(SEL)a2 usingExtent:(BOOL)a3 usingGeometry:(BOOL)a4;
- (id)debugQuickLookObject;
- (int64_t)worldAlignmentRotation;
- (simd_float3)center;
- (simd_float3)extent;
- (void)encodeWithCoder:(id)a3;
- (void)setCenter:(ARPlaneAnchor *)self;
- (void)setClassification:(int64_t)a3;
- (void)setClassificationLabel:(id)a3;
- (void)setClassificationStatus:(int64_t)a3;
- (void)setExtent:(ARPlaneAnchor *)self;
- (void)setGeometry:(id)a3;
- (void)setGridExtent:(id)a3;
- (void)setPlaneExtent:(id)a3;
- (void)setPossibleClassifications:(id)a3;
- (void)setUncertaintyAlongNormal:(float)a3;
- (void)setWorldAlignmentRotation:(int64_t)a3;
@end

@implementation ARPlaneAnchor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARPlaneAnchor;
  id v4 = a3;
  [(ARAnchor *)&v6 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_alignment, @"alignment", v6.receiver, v6.super_class);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", @"center", *(double *)self->_center);
  objc_msgSend(v4, "ar_encodeVector3:forKey:", @"extent", *(double *)self->_extent);
  [v4 encodeObject:self->_planeExtent forKey:@"planeExtent"];
  [v4 encodeObject:self->_geometry forKey:@"geometry"];
  [v4 encodeInteger:self->_worldAlignmentRotation forKey:@"worldAlignmentRotation"];
  [v4 encodeInteger:self->_classificationStatus forKey:@"classificationStatus"];
  [v4 encodeInteger:self->_classification forKey:@"classification"];
  *(float *)&double v5 = self->_uncertaintyAlongNormal;
  [v4 encodeFloat:@"uncertaintyAlongNormal" forKey:v5];
  [v4 encodeObject:self->_classificationLabel forKey:@"classificationLabel"];
  [v4 encodeObject:self->_gridExtent forKey:@"gridExtent"];
}

- (ARPlaneAnchor)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ARPlaneAnchor;
  double v5 = [(ARAnchor *)&v18 initWithCoder:v4];
  if (v5)
  {
    v5->_alignment = [v4 decodeIntegerForKey:@"alignment"];
    objc_msgSend(v4, "ar_decodeVector3ForKey:", @"center");
    *(_OWORD *)v5->_center = v6;
    objc_msgSend(v4, "ar_decodeVector3ForKey:", @"extent");
    *(_OWORD *)v5->_extent = v7;
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"planeExtent"];
    planeExtent = v5->_planeExtent;
    v5->_planeExtent = (ARPlaneExtent *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geometry"];
    geometry = v5->_geometry;
    v5->_geometry = (ARPlaneGeometry *)v10;

    v5->_worldAlignmentRotation = [v4 decodeIntegerForKey:@"worldAlignmentRotation"];
    v5->_classificationStatus = [v4 decodeIntegerForKey:@"classificationStatus"];
    v5->_classification = [v4 decodeIntegerForKey:@"classification"];
    [v4 decodeFloatForKey:@"uncertaintyAlongNormal"];
    v5->_uncertaintyAlongNormal = v12;
    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"classificationLabel"];
    classificationLabel = v5->_classificationLabel;
    v5->_classificationLabel = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gridExtent"];
    gridExtent = v5->_gridExtent;
    v5->_gridExtent = (ARPatchGrid *)v15;
  }
  return v5;
}

- (ARPlaneAnchor)initWithIdentifier:(uint64_t)a3 transform:(int64_t)a4 alignment:
{
  v15.receiver = a1;
  v15.super_class = (Class)ARPlaneAnchor;
  double v5 = -[ARAnchor initWithIdentifier:transform:](&v15, sel_initWithIdentifier_transform_);
  long long v6 = v5;
  if (v5)
  {
    v5->_alignment = a4;
    *(_OWORD *)v5->_center = 0u;
    __asm { FMOV            V0.4S, #-1.0 }
    *(_OWORD *)v5->_extent = _Q0;
    uint64_t v12 = objc_opt_new();
    planeExtent = v6->_planeExtent;
    v6->_planeExtent = (ARPlaneExtent *)v12;
  }
  return v6;
}

- (id)_hitTestFromOrigin:(ARPlaneAnchor *)self withDirection:(SEL)a2 usingExtent:(BOOL)a3 usingGeometry:(BOOL)a4
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  float32x4_t v108 = v5;
  float32x4_t v110 = v4;
  [(ARAnchor *)self transform];
  float32x4_t v10 = vmulq_f32(v9, v108);
  float32x4_t v11 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1)));
  if (v11.f32[0] > -0.00000011921) {
    goto LABEL_20;
  }
  float32x4_t v104 = v9;
  float32x4_t v106 = v11;
  [(ARAnchor *)self transform];
  float32x4_t v13 = vmulq_f32(v104, vsubq_f32(v12, v110));
  float v14 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v13, 2), vaddq_f32(v13, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v13.f32, 1))), v106).f32[0];
  if (v14 < 0.0) {
    goto LABEL_20;
  }
  float v107 = v14;
  [(ARAnchor *)self transform];
  long long v103 = v16;
  long long v105 = v15;
  long long v102 = v17;
  float32x4_t v18 = vmlaq_n_f32(v110, v108, v107);
  v18.i32[3] = 1.0;
  float32x4_t v111 = v18;
  [(ARAnchor *)self transform];
  simd_float4x4 v119 = __invert_f4(v118);
  uint64_t v19 = 0;
  v112[0] = v105;
  v112[1] = v103;
  v112[2] = v102;
  v112[3] = v111;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  float32x4_t v116 = 0u;
  do
  {
    *(long long *)((char *)&v113 + v19 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v119.columns[0], COERCE_FLOAT(v112[v19])), (float32x4_t)v119.columns[1], *(float32x2_t *)&v112[v19], 1), (float32x4_t)v119.columns[2], (float32x4_t)v112[v19], 2), (float32x4_t)v119.columns[3], (float32x4_t)v112[v19], 3);
    ++v19;
  }
  while (v19 != 4);
  double v100 = *(double *)&v114;
  double v101 = *(double *)&v113;
  double v99 = *(double *)&v115;
  float32x4_t v109 = v116;
  if (!v7) {
    goto LABEL_13;
  }
  v20 = [(ARPlaneAnchor *)self planeExtent];
  [v20 rotationOnYAxis];
  float v22 = v21;

  if (v22 == 0.0)
  {
    float32x4_t v54 = v109;
  }
  else
  {
    v23 = [(ARPlaneAnchor *)self planeExtent];
    [v23 rotationOnYAxis];
    __float2 v25 = __sincosf_stret(v24 * -0.5);
    _Q0 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0D0, v25.__sinval);
    _S2 = _Q0.i32[1];
    _S4 = _Q0.i32[2];
    __asm { FMLS            S3, S4, V0.S[2] }
    float v34 = vmlas_n_f32(vmuls_lane_f32(v25.__cosval, _Q0, 2), _Q0.f32[1], _Q0.f32[0]);
    float v35 = vmlas_n_f32(-(float)(v25.__cosval * _Q0.f32[1]), _Q0.f32[2], _Q0.f32[0]);
    v36.i32[3] = 0;
    v36.f32[0] = _S3 + (float)(v25.__cosval * v25.__cosval);
    v36.f32[1] = v34 + v34;
    v36.f32[2] = v35 + v35;
    float v37 = vmlas_n_f32(-(float)(v25.__cosval * _Q0.f32[2]), _Q0.f32[1], _Q0.f32[0]);
    __asm
    {
      FMLA            S5, S2, V0.S[1]
      FMLS            S5, S0, V0.S[0]
      FMLA            S6, S4, V0.S[1]
    }
    v41.i32[3] = 0;
    v41.f32[0] = v37 + v37;
    v41.i32[1] = _S5;
    v41.f32[2] = _S6 + _S6;
    float32x4_t v95 = v41;
    float32x4_t v96 = v36;
    __asm
    {
      FMLA            S7, S0, V0.S[2]
      FMLA            S5, S4, V0.S[1]
      FMLA            S1, S4, V0.S[2]
      FMLS            S1, S0, V0.S[0]
      FMLS            S1, S2, V0.S[1]
    }
    _Q0.f32[0] = _S7 + _S7;
    _Q0.f32[1] = _S5 + _S5;
    _Q0.i64[1] = _S1;
    float32x4_t v94 = _Q0;

    [(ARPlaneAnchor *)self center];
    __int32 v93 = v47;
    [(ARPlaneAnchor *)self center];
    float32x4_t v48 = (float32x4_t)xmmword_1B8A2B050;
    v48.i32[0] = v93;
    v48.i32[2] = v49;
    float32x4_t v50 = vsubq_f32(v109, v48);
    float32x4_t v97 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v96, v50.f32[0]), v95, *(float32x2_t *)v50.f32, 1), v94, v50, 2), (float32x4_t)xmmword_1B8A2B050, v50, 3);
    [(ARPlaneAnchor *)self center];
    v95.i32[0] = v51;
    [(ARPlaneAnchor *)self center];
    float32x4_t v52 = (float32x4_t)xmmword_1B8A2B050;
    v52.i32[0] = v95.i32[0];
    v52.i32[2] = v53;
    float32x4_t v54 = vaddq_f32(v52, v97);
  }
  float v98 = v54.f32[2];
  double v55 = v54.f32[0];
  [(ARPlaneAnchor *)self center];
  double v57 = v56;
  [(ARPlaneAnchor *)self extent];
  if (v57 + v58 * -0.5 > v55) {
    goto LABEL_20;
  }
  [(ARPlaneAnchor *)self center];
  double v60 = v59;
  [(ARPlaneAnchor *)self extent];
  if (v61 * 0.5 + v60 < v55
    || ([(ARPlaneAnchor *)self center],
        double v63 = v62,
        [(ARPlaneAnchor *)self extent],
        v63 + v64 * -0.5 > v98)
    || ([(ARPlaneAnchor *)self center],
        double v66 = v65,
        [(ARPlaneAnchor *)self extent],
        v67 * 0.5 + v66 < v98))
  {
LABEL_20:
    v89 = 0;
  }
  else
  {
LABEL_13:
    if (v6)
    {
      v68 = [(ARPlaneAnchor *)self geometry];
      uint64_t v69 = [v68 boundaryVertices];

      v70 = [(ARPlaneAnchor *)self geometry];
      uint64_t v71 = [v70 boundaryVertexCount];

      uint64_t v72 = 0;
      while ((v71 & ~(v71 >> 63)) != v72)
      {
        uint64_t v73 = v72 + 1;
        float32x4_t v74 = vsubq_f32(*(float32x4_t *)(v69 + 16 * v72), v109);
        int32x4_t v75 = (int32x4_t)vmulq_f32(v74, v74);
        float32x2_t v76 = (float32x2_t)vdupq_laneq_s32(v75, 2).u64[0];
        float32x2_t v77 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v75.i8, 1);
        if (v72 + 1 < v71) {
          uint64_t v78 = v72 + 1;
        }
        else {
          uint64_t v78 = 0;
        }
        unsigned __int32 v79 = vadd_f32(v76, vadd_f32(*(float32x2_t *)v75.i8, v77)).u32[0];
        float32x2_t v80 = vrsqrte_f32((float32x2_t)v79);
        float32x2_t v81 = vmul_f32(v80, vrsqrts_f32((float32x2_t)v79, vmul_f32(v80, v80)));
        LODWORD(v82) = vmul_f32(v81, vrsqrts_f32((float32x2_t)v79, vmul_f32(v81, v81))).u32[0];
        float32x4_t v83 = vsubq_f32(*(float32x4_t *)(v69 + 16 * v78), v109);
        int32x4_t v84 = (int32x4_t)vmulq_f32(v83, v83);
        v84.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v84, 2), vadd_f32(*(float32x2_t *)v84.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v84.i8, 1))).u32[0];
        float32x4_t v85 = vmulq_n_f32(v74, v82);
        float32x2_t v86 = vrsqrte_f32((float32x2_t)v84.u32[0]);
        float32x2_t v87 = vmul_f32(v86, vrsqrts_f32((float32x2_t)v84.u32[0], vmul_f32(v86, v86)));
        float32x4_t v88 = vmulq_n_f32(v83, vmul_f32(v87, vrsqrts_f32((float32x2_t)v84.u32[0], vmul_f32(v87, v87))).f32[0]);
        uint64_t v72 = v73;
        if (vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v88, (int32x4_t)v88), (int8x16_t)v88, 0xCuLL), vnegq_f32(v85)), v88, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v85, (int32x4_t)v85), (int8x16_t)v85, 0xCuLL)).f32[0] < -0.00000011921)goto LABEL_20; {
      }
        }
    }
    uint64_t v91 = 8;
    if (v7) {
      uint64_t v91 = 16;
    }
    if (v6) {
      uint64_t v92 = 32;
    }
    else {
      uint64_t v92 = v91;
    }
    v89 = [[ARHitTestResult alloc] initWithType:v92];
    [(ARHitTestResult *)v89 setAnchor:self];
    [(ARHitTestResult *)v89 setDistance:v107];
    -[ARHitTestResult setWorldTransform:](v89, "setWorldTransform:", *(double *)&v105, *(double *)&v103, *(double *)&v102, *(double *)v111.i64);
    -[ARHitTestResult setLocalTransform:](v89, "setLocalTransform:", v101, v100, v99, *(double *)v109.i64);
  }
  return v89;
}

- (id)_description:(BOOL)a3
{
  BOOL v3 = a3;
  ARPlaneAnchorAlignment v5 = [(ARPlaneAnchor *)self alignment];
  BOOL v6 = @"vertical";
  if (v5 != ARPlaneAnchorAlignmentVertical) {
    BOOL v6 = 0;
  }
  if (v5 == ARPlaneAnchorAlignmentHorizontal) {
    BOOL v6 = @"horizontal";
  }
  BOOL v7 = v6;
  if (!v7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[ARPlaneAnchor alignment](self, "alignment"));
    BOOL v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v8 = NSString;
  float32x4_t v9 = (objc_class *)objc_opt_class();
  float32x4_t v10 = NSStringFromClass(v9);
  float32x4_t v11 = [(ARAnchor *)self identifier];
  [(ARAnchor *)self transform];
  long long v16 = ARMatrix4x4Description(v3, v12, v13, v14, v15);
  [(ARPlaneAnchor *)self center];
  float32x4_t v18 = ARVector3Description(v17);
  [(ARPlaneAnchor *)self extent];
  v20 = ARVector3Description(v19);
  ARPlaneClassification v21 = [(ARPlaneAnchor *)self classification];
  if ((unint64_t)(v21 - 1) > 6) {
    float v22 = @"None";
  }
  else {
    float v22 = off_1E6187040[v21 - 1];
  }
  v23 = [v8 stringWithFormat:@"<%@: %p identifier=\"%@\" transform=%@ alignment=%@ center=%@ extent=%@ classification=%@", v10, self, v11, v16, v7, v18, v20, v22];

  float v24 = [v23 stringByAppendingString:@">"];

  return v24;
}

- (NSString)description
{
  return (NSString *)[(ARPlaneAnchor *)self _description:0];
}

- (id)debugQuickLookObject
{
  return [(ARPlaneAnchor *)self _description:1];
}

- (float)area
{
  v2 = [(ARPlaneAnchor *)self geometry];
  uint64_t v3 = [v2 boundaryVertexCount];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = v3 - 1;
    float v7 = 0.0;
    do
    {
      long long v13 = *(_OWORD *)([v2 boundaryVertices] + 16 * v5);
      uint64_t v8 = [v2 boundaryVertices];
      if (v6 == v5) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v5 + 1;
      }
      float v7 = v7
         + vmlas_n_f32((float)-*((float *)&v13 + 2) * COERCE_FLOAT(*(_OWORD *)(v8 + 16 * v9)), COERCE_FLOAT(*(void *)(v8 + 16 * v9 + 8)), *(float *)&v13);
      ++v5;
    }
    while (v4 != v5);
    float v10 = v7 * 0.5;
  }
  else
  {
    float v10 = 0.0;
  }
  float v11 = fabsf(v10);

  return v11;
}

- (ARPlaneAnchor)initWithAnchor:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ARPlaneAnchor;
  uint64_t v5 = [(ARAnchor *)&v23 initWithAnchor:v4];
  if (v5)
  {
    v5->_alignment = [v4 alignment];
    [v4 center];
    *(_OWORD *)v5->_center = v6;
    [v4 extent];
    *(_OWORD *)v5->_extent = v7;
    uint64_t v8 = [v4 planeExtent];
    uint64_t v9 = [v8 copy];
    planeExtent = v5->_planeExtent;
    v5->_planeExtent = (ARPlaneExtent *)v9;

    uint64_t v11 = [v4 gridExtent];
    gridExtent = v5->_gridExtent;
    v5->_gridExtent = (ARPatchGrid *)v11;

    uint64_t v13 = [v4 geometry];
    geometry = v5->_geometry;
    v5->_geometry = (ARPlaneGeometry *)v13;

    [v4 uncertaintyAlongNormal];
    v5->_uncertaintyAlongNormal = v15;
    v5->_worldAlignmentRotation = [v4 worldAlignmentRotation];
    v5->_classificationStatus = [v4 classificationStatus];
    v5->_classification = [v4 classification];
    long long v16 = [v4 possibleClassifications];
    uint64_t v17 = [v16 copy];
    possibleClassifications = v5->_possibleClassifications;
    v5->_possibleClassifications = (NSDictionary *)v17;

    __n128 v19 = [v4 classificationLabel];
    uint64_t v20 = [v19 copy];
    classificationLabel = v5->_classificationLabel;
    v5->_classificationLabel = (NSString *)v20;
  }
  return v5;
}

- (NSDictionary)tracingEntry
{
  return (NSDictionary *)+[ARQAHelper dictionaryFromPlaneAnchor:self];
}

- (ARPlaneAnchorAlignment)alignment
{
  return self->_alignment;
}

- (simd_float3)center
{
  return *(simd_float3 *)self->_center;
}

- (void)setCenter:(ARPlaneAnchor *)self
{
  *(_OWORD *)self->_center = v2;
}

- (simd_float3)extent
{
  return *(simd_float3 *)self->_extent;
}

- (void)setExtent:(ARPlaneAnchor *)self
{
  *(_OWORD *)self->_extent = v2;
}

- (ARPlaneExtent)planeExtent
{
  return self->_planeExtent;
}

- (void)setPlaneExtent:(id)a3
{
}

- (ARPlaneGeometry)geometry
{
  return (ARPlaneGeometry *)objc_getProperty(self, a2, 208, 1);
}

- (void)setGeometry:(id)a3
{
}

- (ARPlaneClassificationStatus)classificationStatus
{
  return self->_classificationStatus;
}

- (void)setClassificationStatus:(int64_t)a3
{
  self->_classificationStatus = a3;
}

- (ARPlaneClassification)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (ARPatchGrid)gridExtent
{
  return self->_gridExtent;
}

- (void)setGridExtent:(id)a3
{
}

- (float)uncertaintyAlongNormal
{
  return self->_uncertaintyAlongNormal;
}

- (void)setUncertaintyAlongNormal:(float)a3
{
  self->_uncertaintyAlongNormal = a3;
}

- (int64_t)worldAlignmentRotation
{
  return self->_worldAlignmentRotation;
}

- (void)setWorldAlignmentRotation:(int64_t)a3
{
  self->_worldAlignmentRotation = a3;
}

- (NSDictionary)possibleClassifications
{
  return self->_possibleClassifications;
}

- (void)setPossibleClassifications:(id)a3
{
}

- (NSString)classificationLabel
{
  return self->_classificationLabel;
}

- (void)setClassificationLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classificationLabel, 0);
  objc_storeStrong((id *)&self->_possibleClassifications, 0);
  objc_storeStrong((id *)&self->_gridExtent, 0);
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_planeExtent, 0);
}

@end