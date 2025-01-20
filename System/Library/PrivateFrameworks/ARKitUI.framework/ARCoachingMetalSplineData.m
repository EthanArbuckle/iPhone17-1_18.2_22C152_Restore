@interface ARCoachingMetalSplineData
- (ARCoachingBlendableSplineGroup)shapes;
- (ARCoachingControlPointContainer)recordedControlPoints;
- (MTLBuffer)controlPointIndicesBuffer;
- (MTLBuffer)controlPointsBuffer;
- (MTLBuffer)instanceBuffer;
- (MTLBuffer)patchUserDataBuffer;
- (MTLBuffer)tessellationFactorsBuffer;
- (NSArray)instanceTransforms;
- (__n128)recordedScale;
- (__n128)recordedTranslation;
- (id)init:(id)a3;
- (id)shapeBlendWithStart:(id *)a3 startCount:(int)a4 end:(id *)a5 endCount:(int)a6 t:(float)a7;
- (int)patchCount;
- (void)computeInstanceTransformScale:(ARCoachingMetalSplineData *)self;
- (void)computeInstanceTransformScale:(ARCoachingMetalSplineData *)self s1:(SEL)a2 t:(float)a3;
- (void)computeInstanceTransformScale:(float)a3 t:;
- (void)computeInstanceTransformTranslate:(ARCoachingMetalSplineData *)self x1:(SEL)a2 t:(float)a3 index:(int)a4;
- (void)computeInstanceTransformTranslate:(float)a3 t:(int)a4 index:;
- (void)computeInstanceTransformTranslate:(int)a3 index:;
- (void)computeShapeBlendWithEnd:(id *)a3 endCount:(int)a4;
- (void)computeShapeBlendWithEnd:(id *)a3 endCount:(int)a4 t:(float)a5;
- (void)computeShapeBlendWithStart:(id *)a3 startCount:(int)a4 end:(id *)a5 endCount:(int)a6 t:(float)a7;
- (void)makeShapes;
- (void)recordState;
- (void)resetInstanceTransforms:(id)a3;
@end

@implementation ARCoachingMetalSplineData

- (id)init:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARCoachingMetalSplineData;
  v5 = [(ARCoachingMetalSplineData *)&v19 init];
  v6 = v5;
  if (v5)
  {
    [(ARCoachingMetalSplineData *)v5 makeShapes];
    int v7 = [(ARCoachingBlendableSplineGroup *)v6->_shapes patchDataLength];
    v6->_patchCount = v7;
    uint64_t v8 = [v4 newBufferWithLength:12 * v7 options:32];
    tessellationFactorsBuffer = v6->_tessellationFactorsBuffer;
    v6->_tessellationFactorsBuffer = (MTLBuffer *)v8;

    [(MTLBuffer *)v6->_tessellationFactorsBuffer setLabel:@"Tessellation Factors"];
    v10 = [(ARCoachingBlendableSplineGroup *)v6->_shapes controlPoints];
    v11 = [v10 objectAtIndexedSubscript:0];

    uint64_t v12 = objc_msgSend(v4, "newBufferWithBytes:length:options:", objc_msgSend(v11, "controlPoints"), 32 * objc_msgSend(v11, "numControlPoints"), 0);
    controlPointsBuffer = v6->_controlPointsBuffer;
    v6->_controlPointsBuffer = (MTLBuffer *)v12;

    [(MTLBuffer *)v6->_controlPointsBuffer setLabel:@"Control Points"];
    uint64_t v14 = objc_msgSend(v4, "newBufferWithBytes:length:options:", -[ARCoachingBlendableSplineGroup indices](v6->_shapes, "indices"), 2 * (int)-[ARCoachingBlendableSplineGroup numIndices](v6->_shapes, "numIndices"), 0);
    controlPointIndicesBuffer = v6->_controlPointIndicesBuffer;
    v6->_controlPointIndicesBuffer = (MTLBuffer *)v14;

    [(MTLBuffer *)v6->_controlPointIndicesBuffer setLabel:@"Control Point Indices"];
    uint64_t v16 = objc_msgSend(v4, "newBufferWithBytes:length:options:", -[ARCoachingBlendableSplineGroup patchData](v6->_shapes, "patchData"), 8 * (int)-[ARCoachingBlendableSplineGroup patchDataLength](v6->_shapes, "patchDataLength"), 0);
    patchUserDataBuffer = v6->_patchUserDataBuffer;
    v6->_patchUserDataBuffer = (MTLBuffer *)v16;

    [(MTLBuffer *)v6->_patchUserDataBuffer setLabel:@"Per Patch Tessellator variables"];
    [(ARCoachingMetalSplineData *)v6 resetInstanceTransforms:v4];
  }
  return v6;
}

- (void)makeShapes
{
  v174[4] = *MEMORY[0x263EF8340];
  v3 = [ARCoachingSplineGroup alloc];
  id v4 = [ARCoachingCorner alloc];
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", 0.0);
  long long v155 = v5;
  long long v147 = v6;
  long long v151 = v7;
  LODWORD(v6) = 1.0;
  LODWORD(v7) = 1064178811;
  LODWORD(v5) = 1058642330;
  LODWORD(v8) = 1065017672;
  v11 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v4, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", *(double *)&v6, *(double *)&v7, 0.0, *(double *)&v5, v8, v147, v151, v9, v10, v155);
  v174[0] = v11;
  uint64_t v12 = [ARCoachingCorner alloc];
  LODWORD(v13) = 1119092736;
  +[ARCoachingTransformations rotate:v13 axis:0.0];
  HIDWORD(v15) = HIDWORD(v14);
  long long v148 = v16;
  long long v152 = v17;
  LODWORD(v16) = 1.0;
  long long v156 = v18;
  LODWORD(v17) = 1064178811;
  LODWORD(v18) = 1058642330;
  LODWORD(v15) = 1065017672;
  v20 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v12, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", *(double *)&v16, *(double *)&v17, 0.0, *(double *)&v18, v15, v148, v152, v14, v19, v156);
  v174[1] = v20;
  v21 = [ARCoachingCorner alloc];
  LODWORD(v22) = 1127481344;
  +[ARCoachingTransformations rotate:v22 axis:0.0];
  HIDWORD(v24) = HIDWORD(v23);
  long long v149 = v25;
  long long v153 = v26;
  LODWORD(v25) = 1.0;
  long long v157 = v27;
  LODWORD(v26) = 1064178811;
  LODWORD(v27) = 1058642330;
  LODWORD(v24) = 1065017672;
  v29 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v21, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", *(double *)&v25, *(double *)&v26, 0.0, *(double *)&v27, v24, v149, v153, v23, v28, v157);
  v174[2] = v29;
  v30 = [ARCoachingCorner alloc];
  LODWORD(v31) = 1132920832;
  +[ARCoachingTransformations rotate:v31 axis:0.0];
  HIDWORD(v33) = HIDWORD(v32);
  long long v150 = v34;
  long long v154 = v35;
  LODWORD(v34) = 1.0;
  long long v158 = v36;
  LODWORD(v35) = 1064178811;
  LODWORD(v36) = 1058642330;
  LODWORD(v33) = 1065017672;
  v38 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v30, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", *(double *)&v34, *(double *)&v35, 0.0, *(double *)&v36, v33, v150, v154, v32, v37, v158);
  v174[3] = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v174 count:4];
  uint64_t v40 = [(ARCoachingSplineGroup *)v3 initWithSplines:v39];

  v41 = (void *)v40;
  __asm { FMOV            V0.4S, #1.0 }
  +[ARCoachingTransformations scale:*(double *)&_Q0];
  long long v159 = v48;
  long long v160 = v47;
  long long v161 = v50;
  long long v162 = v49;
  v51 = [ARCoachingSplineGroup alloc];
  v52 = [ARCoachingCorner alloc];
  +[ARCoachingTransformations rotate:0.0 axis:0.0];
  uint64_t v57 = 0;
  long long v163 = v160;
  long long v164 = v159;
  long long v165 = v162;
  long long v166 = v161;
  do
  {
    float32x4_t v58 = *(float32x4_t *)((char *)&v163 + v57);
    *(long long *)((char *)&v167 + v57) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, v58.f32[0]), v54, *(float32x2_t *)v58.f32, 1), v55, v58, 2), v56, v58, 3);
    v57 += 16;
  }
  while (v57 != 64);
  HIDWORD(v59) = DWORD1(v170);
  LODWORD(v59) = 1053609165;
  v58.i32[0] = 1065017672;
  v60 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v52, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v167), 1.0)), COERCE_DOUBLE(__PAIR64__(DWORD1(v168), 1.0)), 0.0, v59, *(double *)v58.i64, v167, v168, v169, v170);
  v173[0] = v60;
  v61 = [ARCoachingCorner alloc];
  LODWORD(v62) = 1119092736;
  +[ARCoachingTransformations rotate:v62 axis:0.0];
  uint64_t v67 = 0;
  long long v163 = v160;
  long long v164 = v159;
  long long v165 = v162;
  long long v166 = v161;
  do
  {
    *(long long *)((char *)&v167 + v67) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(long long *)((char *)&v163 + v67))), v64, *(float32x2_t *)((char *)&v163 + v67), 1), v65, *(float32x4_t *)((char *)&v163 + v67), 2), v66, *(float32x4_t *)((char *)&v163 + v67), 3);
    v67 += 16;
  }
  while (v67 != 64);
  HIDWORD(v68) = DWORD1(v167);
  HIDWORD(v69) = DWORD1(v168);
  LODWORD(v68) = 1053609165;
  LODWORD(v69) = 1065017672;
  v70 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v61, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v169), 1.0)), COERCE_DOUBLE(__PAIR64__(DWORD1(v170), 1.0)), 0.0, v68, v69, v167, v168, v169, v170);
  v173[1] = v70;
  v71 = [ARCoachingCorner alloc];
  LODWORD(v72) = 1127481344;
  +[ARCoachingTransformations rotate:v72 axis:0.0];
  uint64_t v77 = 0;
  long long v163 = v160;
  long long v164 = v159;
  long long v165 = v162;
  long long v166 = v161;
  do
  {
    *(long long *)((char *)&v167 + v77) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, COERCE_FLOAT(*(long long *)((char *)&v163 + v77))), v74, *(float32x2_t *)((char *)&v163 + v77), 1), v75, *(float32x4_t *)((char *)&v163 + v77), 2), v76, *(float32x4_t *)((char *)&v163 + v77), 3);
    v77 += 16;
  }
  while (v77 != 64);
  HIDWORD(v78) = DWORD1(v167);
  HIDWORD(v79) = DWORD1(v168);
  LODWORD(v78) = 1053609165;
  LODWORD(v79) = 1065017672;
  v80 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v71, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v169), 1.0)), COERCE_DOUBLE(__PAIR64__(DWORD1(v170), 1.0)), 0.0, v78, v79, v167, v168, v169, v170);
  v173[2] = v80;
  v81 = [ARCoachingCorner alloc];
  LODWORD(v82) = 1132920832;
  +[ARCoachingTransformations rotate:v82 axis:0.0];
  uint64_t v87 = 0;
  long long v163 = v160;
  long long v164 = v159;
  long long v165 = v162;
  long long v166 = v161;
  do
  {
    *(long long *)((char *)&v167 + v87) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v83, COERCE_FLOAT(*(long long *)((char *)&v163 + v87))), v84, *(float32x2_t *)((char *)&v163 + v87), 1), v85, *(float32x4_t *)((char *)&v163 + v87), 2), v86, *(float32x4_t *)((char *)&v163 + v87), 3);
    v87 += 16;
  }
  while (v87 != 64);
  HIDWORD(v88) = DWORD1(v167);
  HIDWORD(v89) = DWORD1(v168);
  LODWORD(v88) = 1053609165;
  LODWORD(v89) = 1065017672;
  v90 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v81, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v169), 1.0)), COERCE_DOUBLE(__PAIR64__(DWORD1(v170), 1.0)), 0.0, v88, v89, v167, v168, v169, v170);
  v173[3] = v90;
  v91 = [MEMORY[0x263EFF8C0] arrayWithObjects:v173 count:4];
  v92 = [(ARCoachingSplineGroup *)v51 initWithSplines:v91];

  v93 = [ARCoachingSplineGroup alloc];
  v94 = [ARCoachingCorner alloc];
  +[ARCoachingTransformations rotate:0.0 axis:0.0];
  uint64_t v99 = 0;
  long long v163 = v160;
  long long v164 = v159;
  long long v165 = v162;
  long long v166 = v161;
  do
  {
    float32x4_t v100 = *(float32x4_t *)((char *)&v163 + v99);
    *(long long *)((char *)&v167 + v99) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v95, v100.f32[0]), v96, *(float32x2_t *)v100.f32, 1), v97, v100, 2), v98, v100, 3);
    v99 += 16;
  }
  while (v99 != 64);
  HIDWORD(v101) = DWORD1(v168);
  LODWORD(v101) = 1050253722;
  v100.i32[0] = 1065336439;
  v102 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v94, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v167), 1.0)), v101, COERCE_DOUBLE(__PAIR64__(DWORD1(v169), -1.0)), 0.0, *(double *)v100.i64, v167, v168, v169, v170);
  v172[0] = v102;
  v103 = [ARCoachingCorner alloc];
  LODWORD(v104) = 1119092736;
  +[ARCoachingTransformations rotate:v104 axis:0.0];
  uint64_t v109 = 0;
  long long v163 = v160;
  long long v164 = v159;
  long long v165 = v162;
  long long v166 = v161;
  do
  {
    *(long long *)((char *)&v167 + v109) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v105, COERCE_FLOAT(*(long long *)((char *)&v163 + v109))), v106, *(float32x2_t *)((char *)&v163 + v109), 1), v107, *(float32x4_t *)((char *)&v163 + v109), 2), v108, *(float32x4_t *)((char *)&v163 + v109), 3);
    v109 += 16;
  }
  while (v109 != 64);
  HIDWORD(v110) = DWORD1(v167);
  HIDWORD(v111) = DWORD1(v168);
  LODWORD(v110) = 1050253722;
  LODWORD(v111) = 1065336439;
  v112 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v103, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v169), 1.0)), v110, COERCE_DOUBLE(__PAIR64__(DWORD1(v170), -1.0)), 0.0, v111, v167, v168, v169, v170);
  v172[1] = v112;
  v113 = [ARCoachingCorner alloc];
  LODWORD(v114) = 1127481344;
  +[ARCoachingTransformations rotate:v114 axis:0.0];
  uint64_t v119 = 0;
  long long v163 = v160;
  long long v164 = v159;
  long long v165 = v162;
  long long v166 = v161;
  do
  {
    *(long long *)((char *)&v167 + v119) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v115, COERCE_FLOAT(*(long long *)((char *)&v163 + v119))), v116, *(float32x2_t *)((char *)&v163 + v119), 1), v117, *(float32x4_t *)((char *)&v163 + v119), 2), v118, *(float32x4_t *)((char *)&v163 + v119), 3);
    v119 += 16;
  }
  while (v119 != 64);
  HIDWORD(v120) = DWORD1(v167);
  HIDWORD(v121) = DWORD1(v168);
  LODWORD(v120) = 1050253722;
  LODWORD(v121) = 1065336439;
  v122 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v113, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v169), 1.0)), v120, COERCE_DOUBLE(__PAIR64__(DWORD1(v170), -1.0)), 0.0, v121, v167, v168, v169, v170);
  v172[2] = v122;
  v123 = [ARCoachingCorner alloc];
  LODWORD(v124) = 1132920832;
  +[ARCoachingTransformations rotate:v124 axis:0.0];
  uint64_t v129 = 0;
  long long v163 = v160;
  long long v164 = v159;
  long long v165 = v162;
  long long v166 = v161;
  do
  {
    *(long long *)((char *)&v167 + v129) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v125, COERCE_FLOAT(*(long long *)((char *)&v163 + v129))), v126, *(float32x2_t *)((char *)&v163 + v129), 1), v127, *(float32x4_t *)((char *)&v163 + v129), 2), v128, *(float32x4_t *)((char *)&v163 + v129), 3);
    v129 += 16;
  }
  while (v129 != 64);
  HIDWORD(v130) = DWORD1(v167);
  HIDWORD(v131) = DWORD1(v168);
  LODWORD(v130) = 1050253722;
  LODWORD(v131) = 1065336439;
  v132 = -[ARCoachingCorner initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:](v123, "initWithRadius:relativeThickness:anchorA:anchorB:cornerEdge:mat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v169), 1.0)), v130, COERCE_DOUBLE(__PAIR64__(DWORD1(v170), -1.0)), 0.0, v131, v167, v168, v169, v170);
  v172[3] = v132;
  v133 = [MEMORY[0x263EFF8C0] arrayWithObjects:v172 count:4];
  v134 = [(ARCoachingSplineGroup *)v93 initWithSplines:v133];

  v135 = [ARCoachingBlendableSplineGroup alloc];
  v171[0] = v41;
  v171[1] = v92;
  v171[2] = v134;
  v136 = [MEMORY[0x263EFF8C0] arrayWithObjects:v171 count:3];
  v137 = [(ARCoachingBlendableSplineGroup *)v135 initWithSplineGroups:v136];
  shapes = self->_shapes;
  self->_shapes = v137;

  v139 = [ARCoachingControlPointContainer alloc];
  v140 = [(ARCoachingBlendableSplineGroup *)self->_shapes controlPoints];
  v141 = [v140 objectAtIndexedSubscript:0];
  uint64_t v142 = [v141 controlPoints];
  v143 = [(ARCoachingBlendableSplineGroup *)self->_shapes controlPoints];
  v144 = [v143 objectAtIndexedSubscript:0];
  v145 = -[ARCoachingControlPointContainer initWithControlPoints:numControlPoints:](v139, "initWithControlPoints:numControlPoints:", v142, [v144 numControlPoints]);
  recordedControlPoints = self->_recordedControlPoints;
  self->_recordedControlPoints = v145;
}

- (void)recordState
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(MTLBuffer *)self->_controlPointsBuffer contents];
  unint64_t v4 = 0;
  __p = 0;
  double v33 = 0;
  long long v34 = 0;
  while (1)
  {
    long long v5 = [(ARCoachingBlendableSplineGroup *)self->_shapes controlPoints];
    long long v6 = [v5 objectAtIndexedSubscript:0];
    BOOL v7 = v4 < [v6 numControlPoints];

    if (!v7) {
      break;
    }
    double v8 = (_OWORD *)(v3 + 32 * v4);
    uint64_t v9 = v33;
    if (v33 >= v34)
    {
      uint64_t v12 = (char *)__p;
      uint64_t v13 = (v33 - (unsigned char *)__p) >> 5;
      unint64_t v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) >> 59) {
        _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
      }
      uint64_t v15 = v34 - (unsigned char *)__p;
      if ((v34 - (unsigned char *)__p) >> 4 > v14) {
        unint64_t v14 = v15 >> 4;
      }
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v16 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v16 = v14;
      }
      if (v16)
      {
        long long v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)&v34, v16);
        uint64_t v12 = (char *)__p;
        uint64_t v9 = v33;
      }
      else
      {
        long long v17 = 0;
      }
      long long v18 = v8[1];
      uint64_t v19 = &v17[32 * v13];
      *(_OWORD *)uint64_t v19 = *v8;
      *((_OWORD *)v19 + 1) = v18;
      if (v9 == v12)
      {
        double v22 = &v17[32 * v13];
      }
      else
      {
        v20 = &v17[32 * v13];
        do
        {
          long long v21 = *((_OWORD *)v9 - 1);
          double v22 = v20 - 32;
          *((_OWORD *)v20 - 2) = *((_OWORD *)v9 - 2);
          *((_OWORD *)v20 - 1) = v21;
          v9 -= 32;
          v20 -= 32;
        }
        while (v9 != v12);
      }
      v11 = v19 + 32;
      __p = v22;
      double v33 = v19 + 32;
      long long v34 = &v17[32 * v16];
      if (v12) {
        operator delete(v12);
      }
    }
    else
    {
      long long v10 = v8[1];
      *(_OWORD *)double v33 = *v8;
      *((_OWORD *)v9 + 1) = v10;
      v11 = v9 + 32;
    }
    double v33 = v11;
    ++v4;
  }
  -[ARCoachingControlPointContainer overwriteWithControlPoints:numControlPoints:](self->_recordedControlPoints, "overwriteWithControlPoints:numControlPoints:");
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v23 = self->_instanceTransforms;
  uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v23);
        }
        long long v27 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        objc_msgSend(v27, "localScale", (void)v28);
        objc_msgSend(v27, "setRecordedScale:");
        [v27 localTranslation];
        objc_msgSend(v27, "setRecordedTranslation:");
      }
      uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v24);
  }

  if (__p)
  {
    double v33 = (char *)__p;
    operator delete(__p);
  }
}

- (void)resetInstanceTransforms:(id)a3
{
  v115[6] = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:-0.0078125];
  float32x4_t v98 = v7;
  float32x4_t v104 = v6;
  float32x4_t v86 = v9;
  float32x4_t v92 = v8;
  v6.i32[0] = 1119092736;
  +[ARCoachingTransformations rotate:axis:](ARCoachingTransformations, "rotate:axis:", *(double *)v6.i64);
  uint64_t v10 = 0;
  long long v107 = v11;
  long long v108 = v12;
  long long v109 = v13;
  long long v110 = v14;
  do
  {
    *(long long *)((char *)&v111 + v10) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v104, COERCE_FLOAT(*(long long *)((char *)&v107 + v10))), v98, *(float32x2_t *)((char *)&v107 + v10), 1), v92, *(float32x4_t *)((char *)&v107 + v10), 2), v86, *(float32x4_t *)((char *)&v107 + v10), 3);
    v10 += 16;
  }
  while (v10 != 64);
  id v15 = -[ARCoachingInstanceTransform init:](v5, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[0] = v15;
  unint64_t v16 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:](ARCoachingTransformations, "translate:");
  float32x4_t v93 = v18;
  float32x4_t v99 = v17;
  float32x4_t v83 = v20;
  float32x4_t v87 = v19;
  v17.i32[0] = 1119092736;
  +[ARCoachingTransformations rotate:*(double *)v17.i64 axis:COERCE_DOUBLE(1065353216)];
  uint64_t v21 = 0;
  long long v107 = v22;
  long long v108 = v23;
  long long v109 = v24;
  long long v110 = v25;
  do
  {
    *(long long *)((char *)&v111 + v21) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(long long *)((char *)&v107 + v21))), v93, *(float32x2_t *)((char *)&v107 + v21), 1), v87, *(float32x4_t *)((char *)&v107 + v21), 2), v83, *(float32x4_t *)((char *)&v107 + v21), 3);
    v21 += 16;
  }
  while (v21 != 64);
  id v26 = -[ARCoachingInstanceTransform init:](v16, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[1] = v26;
  long long v27 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:0.0];
  float32x4_t v94 = v29;
  float32x4_t v100 = v28;
  float32x4_t v84 = v31;
  float32x4_t v88 = v30;
  +[ARCoachingTransformations rotate:0.0 axis:COERCE_DOUBLE(1065353216)];
  uint64_t v32 = 0;
  long long v107 = v33;
  long long v108 = v34;
  long long v109 = v35;
  long long v110 = v36;
  do
  {
    *(long long *)((char *)&v111 + v32) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v100, COERCE_FLOAT(*(long long *)((char *)&v107 + v32))), v94, *(float32x2_t *)((char *)&v107 + v32), 1), v88, *(float32x4_t *)((char *)&v107 + v32), 2), v84, *(float32x4_t *)((char *)&v107 + v32), 3);
    v32 += 16;
  }
  while (v32 != 64);
  id v37 = -[ARCoachingInstanceTransform init:](v27, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[2] = v37;
  v38 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:0.0];
  float32x4_t v95 = v40;
  float32x4_t v101 = v39;
  float32x4_t v85 = v42;
  float32x4_t v89 = v41;
  +[ARCoachingTransformations rotate:0.0 axis:COERCE_DOUBLE(1065353216)];
  uint64_t v43 = 0;
  long long v107 = v44;
  long long v108 = v45;
  long long v109 = v46;
  long long v110 = v47;
  do
  {
    *(long long *)((char *)&v111 + v43) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v101, COERCE_FLOAT(*(long long *)((char *)&v107 + v43))), v95, *(float32x2_t *)((char *)&v107 + v43), 1), v89, *(float32x4_t *)((char *)&v107 + v43), 2), v85, *(float32x4_t *)((char *)&v107 + v43), 3);
    v43 += 16;
  }
  while (v43 != 64);
  id v48 = -[ARCoachingInstanceTransform init:](v38, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[3] = v48;
  long long v49 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:COERCE_DOUBLE(1065353216)];
  float32x4_t v105 = v50;
  float32x4_t v96 = v52;
  float32x4_t v102 = v51;
  float32x4_t v90 = v53;
  v50.i32[0] = 1119092736;
  +[ARCoachingTransformations rotate:*(double *)v50.i64 axis:0.0078125];
  uint64_t v54 = 0;
  long long v107 = v55;
  long long v108 = v56;
  long long v109 = v57;
  long long v110 = v58;
  do
  {
    *(long long *)((char *)&v111 + v54) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v105, COERCE_FLOAT(*(long long *)((char *)&v107 + v54))), v102, *(float32x2_t *)((char *)&v107 + v54), 1), v96, *(float32x4_t *)((char *)&v107 + v54), 2), v90, *(float32x4_t *)((char *)&v107 + v54), 3);
    v54 += 16;
  }
  while (v54 != 64);
  id v59 = -[ARCoachingInstanceTransform init:](v49, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[4] = v59;
  v60 = [ARCoachingInstanceTransform alloc];
  +[ARCoachingTransformations translate:COERCE_DOUBLE(3212836864)];
  float32x4_t v106 = v61;
  float32x4_t v97 = v63;
  float32x4_t v103 = v62;
  float32x4_t v91 = v64;
  v61.i32[0] = 1119092736;
  +[ARCoachingTransformations rotate:*(double *)v61.i64 axis:0.0078125];
  uint64_t v65 = 0;
  long long v107 = v66;
  long long v108 = v67;
  long long v109 = v68;
  long long v110 = v69;
  do
  {
    *(long long *)((char *)&v111 + v65) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v106, COERCE_FLOAT(*(long long *)((char *)&v107 + v65))), v103, *(float32x2_t *)((char *)&v107 + v65), 1), v97, *(float32x4_t *)((char *)&v107 + v65), 2), v91, *(float32x4_t *)((char *)&v107 + v65), 3);
    v65 += 16;
  }
  while (v65 != 64);
  id v70 = -[ARCoachingInstanceTransform init:](v60, "init:", *(double *)&v111, *(double *)&v112, *(double *)&v113, v114[0]);
  v115[5] = v70;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:6];
  instanceTransforms = self->_instanceTransforms;
  self->_instanceTransforms = v71;

  uint64_t v73 = 0;
  float32x4_t v74 = &v113;
  do
  {
    float32x4_t v75 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:v73];
    [v75 setLocalScale:0.0];
    [v75 transform];
    *(v74 - 2) = v76;
    *(v74 - 1) = v77;
    *float32x4_t v74 = v78;
    v74[1] = v79;

    ++v73;
    v74 += 4;
  }
  while (v73 != 6);
  uint64_t v80 = [v4 newBufferWithBytes:&v111 length:384 options:0];
  instanceBuffer = self->_instanceBuffer;
  p_instanceBuffer = (id *)&self->_instanceBuffer;
  id *p_instanceBuffer = (id)v80;

  [*p_instanceBuffer setLabel:@"Per Instance Post Tessellation variables"];
}

- (id)shapeBlendWithStart:(id *)a3 startCount:(int)a4 end:(id *)a5 endCount:(int)a6 t:(float)a7
{
  if (a4 != a6) {
    -[ARCoachingMetalSplineData shapeBlendWithStart:startCount:end:endCount:t:]();
  }
  __p = 0;
  float32x4_t v30 = 0;
  float32x4_t v31 = 0;
  if (a4 >= 1)
  {
    float32x4_t v9 = 0;
    uint64_t v10 = 0;
    float32x4_t v27 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a7, 0);
    uint64_t v11 = a4;
    do
    {
      long long v12 = (float32x4_t *)&a3[8 * v10];
      long long v13 = (float32x4_t *)&a5[8 * v10];
      float32x4_t v14 = vmlaq_f32(*v12, vsubq_f32(*v13, *v12), v27);
      float v15 = v12[1].f32[0] + (float)(a7 * (float)(v13[1].f32[0] - v12[1].f32[0]));
      if (v9 >= v31)
      {
        float32x4_t v26 = v14;
        uint64_t v16 = ((char *)v9 - (char *)__p) >> 5;
        if ((unint64_t)(v16 + 1) >> 59) {
          _ZNKSt3__16vectorIDv3_fNS_9allocatorIS1_EEE20__throw_length_errorB8ne180100Ev();
        }
        unint64_t v17 = v31 - __p;
        if (v17 <= v16 + 1) {
          unint64_t v17 = v16 + 1;
        }
        if ((unint64_t)((char *)v31 - (char *)__p) >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v18 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18) {
          float32x4_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ARCoachingControlPoint>>((uint64_t)&v31, v18);
        }
        else {
          float32x4_t v19 = 0;
        }
        float32x4_t v20 = (float32x4_t *)&v19[32 * v16];
        float32x4_t *v20 = v26;
        v20[1].f32[0] = v15;
        uint64_t v21 = v30;
        long long v22 = v20;
        if (v30 != __p)
        {
          do
          {
            float32x4_t v23 = v21[-1];
            v22[-2] = v21[-2];
            v22[-1] = v23;
            v22 -= 2;
            v21 -= 2;
          }
          while (v21 != __p);
          uint64_t v21 = __p;
        }
        float32x4_t v9 = v20 + 2;
        __p = v22;
        float32x4_t v31 = (float32x4_t *)&v19[32 * v18];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        *float32x4_t v9 = v14;
        v9[1].f32[0] = v15;
        v9 += 2;
      }
      float32x4_t v30 = v9;
      ++v10;
    }
    while (v10 != v11);
  }
  long long v24 = -[ARCoachingControlPointContainer initWithControlPoints:numControlPoints:]([ARCoachingControlPointContainer alloc], "initWithControlPoints:numControlPoints:");
  if (__p) {
    operator delete(__p);
  }

  return v24;
}

- (void)computeShapeBlendWithEnd:(id *)a3 endCount:(int)a4 t:(float)a5
{
  int32x2_t v13 = *(int32x2_t *)&a5;
  if ([(ARCoachingControlPointContainer *)self->_recordedControlPoints numControlPoints] != a4) {
    -[ARCoachingMetalSplineData computeShapeBlendWithEnd:endCount:t:]();
  }
  uint64_t v7 = [(MTLBuffer *)self->_controlPointsBuffer contents];
  if ([(ARCoachingControlPointContainer *)self->_recordedControlPoints numControlPoints])
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    float32x4_t v12 = (float32x4_t)vdupq_lane_s32(v13, 0);
    do
    {
      uint64_t v10 = [(ARCoachingControlPointContainer *)self->_recordedControlPoints controlPoints];
      *(float32x4_t *)(v7 + v8 * 4) = vmlaq_f32(*(float32x4_t *)&v10[v8].var0, vsubq_f32(*(float32x4_t *)&a3[v8].var0, *(float32x4_t *)&v10[v8].var0), v12);
      uint64_t v11 = [(ARCoachingControlPointContainer *)self->_recordedControlPoints controlPoints];
      *(float *)(v7 + v8 * 4 + 16) = v11[v8 + 4].var0
                                   + (float)(*(float *)v13.i32 * (float)(a3[v8 + 4].var0 - v11[v8 + 4].var0));
      ++v9;
      v8 += 8;
    }
    while (v9 < [(ARCoachingControlPointContainer *)self->_recordedControlPoints numControlPoints]);
  }
}

- (void)computeShapeBlendWithEnd:(id *)a3 endCount:(int)a4
{
  uint64_t v6 = [(MTLBuffer *)self->_controlPointsBuffer contents];
  if (a4 >= 1)
  {
    uint64_t v7 = a4;
    uint64_t v8 = (_DWORD *)(v6 + 16);
    unint64_t v9 = a3 + 4;
    do
    {
      *((_OWORD *)v8 - 1) = *(_OWORD *)&v9[-4].var0;
      float var0 = v9->var0;
      v9 += 8;
      *(float *)uint64_t v8 = var0;
      v8 += 8;
      --v7;
    }
    while (v7);
  }
}

- (void)computeShapeBlendWithStart:(id *)a3 startCount:(int)a4 end:(id *)a5 endCount:(int)a6 t:(float)a7
{
  if (a4 != a6) {
    -[ARCoachingMetalSplineData computeShapeBlendWithStart:startCount:end:endCount:t:]();
  }
  int32x2_t v19 = *(int32x2_t *)&a7;
  uint64_t v10 = [(MTLBuffer *)self->_controlPointsBuffer contents];
  if (a4 >= 1)
  {
    float32x4_t v11 = (float32x4_t)vdupq_lane_s32(v19, 0);
    float32x4_t v12 = (float *)(v10 + 16);
    int32x2_t v13 = a5 + 4;
    float32x4_t v14 = a3 + 4;
    uint64_t v15 = a4;
    do
    {
      *((float32x4_t *)v12 - 1) = vmlaq_f32(*(float32x4_t *)&v14[-4].var0, vsubq_f32(*(float32x4_t *)&v13[-4].var0, *(float32x4_t *)&v14[-4].var0), v11);
      float var0 = v14->var0;
      v14 += 8;
      float v17 = var0;
      float v18 = v13->var0;
      v13 += 8;
      *float32x4_t v12 = v17 + (float)(*(float *)v19.i32 * (float)(v18 - v17));
      v12 += 8;
      --v15;
    }
    while (v15);
  }
}

- (void)computeInstanceTransformScale:(float)a3 t:
{
  int32x2_t v18 = v3;
  float32x4_t v17 = *(float32x4_t *)&a3;
  uint64_t v5 = [(MTLBuffer *)self->_instanceBuffer contents];
  if ([(NSArray *)self->_instanceTransforms count])
  {
    unint64_t v6 = 0;
    float32x4_t v16 = (float32x4_t)vdupq_lane_s32(v18, 0);
    uint64_t v7 = (_OWORD *)(v5 + 32);
    do
    {
      uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_instanceTransforms, "objectAtIndexedSubscript:", v6, *(_OWORD *)&v16);
      [v8 recordedScale];
      float32x4_t v19 = v9;
      uint64_t v10 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:v6];
      objc_msgSend(v10, "setLocalScale:", *(double *)vmlaq_f32(v19, vsubq_f32(v17, v19), v16).i64);

      float32x4_t v11 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:v6];
      [v11 transform];
      *(v7 - 2) = v12;
      *(v7 - 1) = v13;
      *uint64_t v7 = v14;
      v7[1] = v15;
      v7 += 4;

      ++v6;
    }
    while ([(NSArray *)self->_instanceTransforms count] > v6);
  }
}

- (void)computeInstanceTransformScale:(ARCoachingMetalSplineData *)self s1:(SEL)a2 t:(float)a3
{
  float v16 = v4;
  float32x4_t v15 = v3;
  float32x4_t v17 = *(float32x4_t *)&a3;
  uint64_t v6 = [(MTLBuffer *)self->_instanceBuffer contents];
  if ([(NSArray *)self->_instanceTransforms count])
  {
    unint64_t v7 = 0;
    *(void *)&double v18 = vmlaq_n_f32(v17, vsubq_f32(v15, v17), v16).u64[0];
    uint64_t v8 = (_OWORD *)(v6 + 32);
    do
    {
      float32x4_t v9 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:v7];
      [v9 setLocalScale:v18];

      uint64_t v10 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:v7];
      [v10 transform];
      *(v8 - 2) = v11;
      *(v8 - 1) = v12;
      *uint64_t v8 = v13;
      v8[1] = v14;
      v8 += 4;

      ++v7;
    }
    while ([(NSArray *)self->_instanceTransforms count] > v7);
  }
}

- (void)computeInstanceTransformScale:(ARCoachingMetalSplineData *)self
{
  double v13 = v2;
  uint64_t v4 = [(MTLBuffer *)self->_instanceBuffer contents];
  if ([(NSArray *)self->_instanceTransforms count])
  {
    unint64_t v5 = 0;
    uint64_t v6 = (_OWORD *)(v4 + 32);
    do
    {
      unint64_t v7 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:v5];
      [v7 setLocalScale:v13];

      uint64_t v8 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:v5];
      [v8 transform];
      *(v6 - 2) = v9;
      *(v6 - 1) = v10;
      _OWORD *v6 = v11;
      v6[1] = v12;
      v6 += 4;

      ++v5;
    }
    while ([(NSArray *)self->_instanceTransforms count] > v5);
  }
}

- (void)computeInstanceTransformTranslate:(float)a3 t:(int)a4 index:
{
  float v17 = v4;
  float32x4_t v16 = *(float32x4_t *)&a3;
  uint64_t v7 = [(MTLBuffer *)self->_instanceBuffer contents];
  double v18 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:a4];
  [v18 recordedTranslation];
  float32x4_t v15 = v8;
  long long v9 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:a4];
  objc_msgSend(v9, "setLocalTranslation:", *(double *)vmlaq_n_f32(v15, vsubq_f32(v16, v15), v17).i64);

  float32x4_t v19 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:a4];
  [v19 transform];
  long long v10 = (_OWORD *)(v7 + ((uint64_t)a4 << 6));
  _OWORD *v10 = v11;
  v10[1] = v12;
  v10[2] = v13;
  v10[3] = v14;
}

- (void)computeInstanceTransformTranslate:(ARCoachingMetalSplineData *)self x1:(SEL)a2 t:(float)a3 index:(int)a4
{
  float v15 = v5;
  float32x4_t v14 = v4;
  float32x4_t v18 = *(float32x4_t *)&a3;
  uint64_t v8 = [(MTLBuffer *)self->_instanceBuffer contents];
  v18.i64[0] = vmlaq_n_f32(v18, vsubq_f32(v14, v18), v15).u64[0];
  float32x4_t v16 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:a4];
  [v16 setLocalTranslation:*(double *)v18.i64];

  float v17 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:a4];
  [v17 transform];
  long long v9 = (_OWORD *)(v8 + ((uint64_t)a4 << 6));
  *long long v9 = v10;
  v9[1] = v11;
  v9[2] = v12;
  v9[3] = v13;
}

- (void)computeInstanceTransformTranslate:(int)a3 index:
{
  double v12 = v3;
  uint64_t v6 = [(MTLBuffer *)self->_instanceBuffer contents];
  id v13 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:a3];
  [v13 setLocalTranslation:v12];

  id v14 = [(NSArray *)self->_instanceTransforms objectAtIndexedSubscript:a3];
  [v14 transform];
  uint64_t v7 = (_OWORD *)(v6 + ((uint64_t)a3 << 6));
  *uint64_t v7 = v8;
  v7[1] = v9;
  v7[2] = v10;
  v7[3] = v11;
}

- (MTLBuffer)controlPointsBuffer
{
  return self->_controlPointsBuffer;
}

- (MTLBuffer)controlPointIndicesBuffer
{
  return self->_controlPointIndicesBuffer;
}

- (MTLBuffer)patchUserDataBuffer
{
  return self->_patchUserDataBuffer;
}

- (MTLBuffer)tessellationFactorsBuffer
{
  return self->_tessellationFactorsBuffer;
}

- (MTLBuffer)instanceBuffer
{
  return self->_instanceBuffer;
}

- (int)patchCount
{
  return self->_patchCount;
}

- (NSArray)instanceTransforms
{
  return self->_instanceTransforms;
}

- (ARCoachingBlendableSplineGroup)shapes
{
  return self->_shapes;
}

- (ARCoachingControlPointContainer)recordedControlPoints
{
  return self->_recordedControlPoints;
}

- (__n128)recordedScale
{
  return a1[5];
}

- (__n128)recordedTranslation
{
  return a1[6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordedControlPoints, 0);
  objc_storeStrong((id *)&self->_shapes, 0);
  objc_storeStrong((id *)&self->_instanceTransforms, 0);
  objc_storeStrong((id *)&self->_instanceBuffer, 0);
  objc_storeStrong((id *)&self->_tessellationFactorsBuffer, 0);
  objc_storeStrong((id *)&self->_patchUserDataBuffer, 0);
  objc_storeStrong((id *)&self->_controlPointIndicesBuffer, 0);

  objc_storeStrong((id *)&self->_controlPointsBuffer, 0);
}

- (void)shapeBlendWithStart:startCount:end:endCount:t:.cold.1()
{
  __assert_rtn("-[ARCoachingMetalSplineData shapeBlendWithStart:startCount:end:endCount:t:]", "ARCoachingGlyphRenderSupport.mm", 516, "startCount == endCount");
}

- (void)computeShapeBlendWithEnd:endCount:t:.cold.1()
{
  __assert_rtn("-[ARCoachingMetalSplineData computeShapeBlendWithEnd:endCount:t:]", "ARCoachingGlyphRenderSupport.mm", 527, "_recordedControlPoints.numControlPoints == endCount");
}

- (void)computeShapeBlendWithStart:startCount:end:endCount:t:.cold.1()
{
  __assert_rtn("-[ARCoachingMetalSplineData computeShapeBlendWithStart:startCount:end:endCount:t:]", "ARCoachingGlyphRenderSupport.mm", 549, "startCount == endCount");
}

@end