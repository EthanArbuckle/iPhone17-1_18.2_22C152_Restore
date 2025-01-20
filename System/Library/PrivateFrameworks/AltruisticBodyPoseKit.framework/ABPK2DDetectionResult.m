@interface ABPK2DDetectionResult
+ (BOOL)supportsSecureCoding;
- (ABPK2D3DLiftingData)liftingData;
- (ABPK2DDetectionResult)initWithCoder:(id)a3;
- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:aligningPreviousSkeleton:rotation:;
- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:imageResolution:rotation:croppedRect:liftingData:;
- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:rotation:croppedRect:liftingData:;
- (BOOL)isEqual:(id)a3;
- (CGSize)imageResolution;
- (const)jointTrackingStates;
- (id).cxx_construct;
- (id)alignSkeleton:(id)a3 rotationNeeded:(int64_t)a4;
- (int64_t)rotation;
- (uint64_t)joints;
- (uint64_t)rawJointsOutput;
- (unint64_t)hash;
- (unint64_t)jointCount;
- (unint64_t)trackedJointCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ABPK2DDetectionResult

- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:rotation:croppedRect:liftingData:
{
  v11 = v6;
  float64_t v45 = v10;
  float64_t v46 = v8;
  float64_t v47 = v7;
  float64_t v49 = v9;
  uint64_t v12 = v5;
  unint64_t v13 = v4;
  v14 = v3;
  v15 = v2;
  id v17 = v6;
  v52.receiver = self;
  v52.super_class = (Class)ABPK2DDetectionResult;
  v18 = [(ABPK2DDetectionResult *)&v52 init];
  if (v18)
  {
    long long v50 = 0uLL;
    uint64_t v51 = 0;
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE16__init_with_sizeB8ne180100IPKS1_S7_EEvT_T0_m(&v50, v15, (uint64_t)v15 + 8 * v13, v13);
    v19 = (void *)*((void *)v18 + 1);
    if (v19)
    {
      *((void *)v18 + 2) = v19;
      operator delete(v19);
      *((void *)v18 + 1) = 0;
      *((void *)v18 + 2) = 0;
      *((void *)v18 + 3) = 0;
    }
    *(_OWORD *)(v18 + 8) = v50;
    *((void *)v18 + 3) = v51;
    long long v50 = 0uLL;
    uint64_t v51 = 0;
    std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&v50, v14, (uint64_t)v14 + 4 * v13, v13);
    v20 = (void *)*((void *)v18 + 7);
    if (v20)
    {
      *((void *)v18 + 8) = v20;
      operator delete(v20);
      *((void *)v18 + 7) = 0;
      *((void *)v18 + 8) = 0;
      *((void *)v18 + 9) = 0;
    }
    v21.f64[0] = v49;
    *(_OWORD *)(v18 + 56) = v50;
    *((void *)v18 + 9) = v51;
    v21.f64[1] = v45;
    v22.f64[0] = v47;
    v22.f64[1] = v46;
    if (v12 == 90 || v12 == -90)
    {
      float64x2_t v21 = (float64x2_t)vextq_s8((int8x16_t)v21, (int8x16_t)v21, 8uLL);
      float64x2_t v22 = (float64x2_t)vextq_s8((int8x16_t)v22, (int8x16_t)v22, 8uLL);
    }
    uint64_t v23 = *((void *)v18 + 1);
    if (*((void *)v18 + 2) != v23)
    {
      unint64_t v24 = 0;
      do
      {
        *(float32x2_t *)(v23 + 8 * v24) = vcvt_f32_f64(vmlaq_f64(v22, v21, vcvtq_f64_f32(*(float32x2_t *)(v23 + 8 * v24))));
        ++v24;
        uint64_t v23 = *((void *)v18 + 1);
      }
      while (v24 < (*((void *)v18 + 2) - v23) >> 3);
    }
    *((void *)v18 + 13) = v12;
    objc_storeStrong((id *)v18 + 12, v11);
    uint64_t v25 = *((void *)v18 + 13);
    if (v25)
    {
      float v26 = (double)v25 * 3.14159265 / 180.0;
      __float2 v27 = __sincosf_stret(v26);
      v28 = (char **)(v18 + 32);
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)v18 + 4, (uint64_t)(*((void *)v18 + 2) - *((void *)v18 + 1)) >> 3);
      uint64_t v29 = *((void *)v18 + 1);
      if (*((void *)v18 + 2) != v29)
      {
        unint64_t v30 = 0;
        v31.f32[0] = -v27.__sinval;
        v31.i32[1] = LODWORD(v27.__cosval);
        float32x2_t v48 = v31;
        v32 = v18 + 48;
        v33 = (float32x2_t *)*((void *)v18 + 5);
        do
        {
          float32x2_t v34 = vadd_f32(vmla_n_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v27.__sinval), LODWORD(v27.__cosval)), COERCE_FLOAT(*(void *)(v29 + 8 * v30)) + -0.5), v48, COERCE_FLOAT(HIDWORD(*(void *)(v29 + 8 * v30))) + -0.5), (float32x2_t)0x3F0000003F000000);
          if ((unint64_t)v33 >= *v32)
          {
            uint64_t v35 = ((char *)v33 - *v28) >> 3;
            if ((unint64_t)(v35 + 1) >> 61) {
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v36 = *v32 - (void)*v28;
            uint64_t v37 = v36 >> 2;
            if (v36 >> 2 <= (unint64_t)(v35 + 1)) {
              uint64_t v37 = v35 + 1;
            }
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v38 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v38 = v37;
            }
            if (v38) {
              v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v18 + 48), v38);
            }
            else {
              v39 = 0;
            }
            v40 = (float32x2_t *)&v39[8 * v35];
            float32x2_t *v40 = v34;
            v33 = v40 + 1;
            v42 = (char *)*((void *)v18 + 4);
            v41 = (char *)*((void *)v18 + 5);
            if (v41 != v42)
            {
              do
              {
                float32x2_t v43 = *(float32x2_t *)(v41 - 8);
                v41 -= 8;
                v40[-1] = v43;
                --v40;
              }
              while (v41 != v42);
              v41 = *v28;
            }
            *((void *)v18 + 4) = v40;
            *((void *)v18 + 5) = v33;
            *((void *)v18 + 6) = &v39[8 * v38];
            if (v41) {
              operator delete(v41);
            }
          }
          else
          {
            *v33++ = v34;
          }
          *((void *)v18 + 5) = v33;
          ++v30;
          uint64_t v29 = *((void *)v18 + 1);
        }
        while (v30 < (*((void *)v18 + 2) - v29) >> 3);
      }
    }
    else
    {
      _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v18 + 32, *((char **)v18 + 1), *((void *)v18 + 2), (uint64_t)(*((void *)v18 + 2) - *((void *)v18 + 1)) >> 3);
    }
  }

  return (ABPK2DDetectionResult *)v18;
}

- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:imageResolution:rotation:croppedRect:liftingData:
{
  CGFloat v8 = v3;
  CGFloat v9 = v2;
  result = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](self, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v4, v5, v6, v7);
  if (result)
  {
    result->_imageResolution.width = v9;
    result->_imageResolution.height = v8;
  }
  return result;
}

- (uint64_t)rawJointsOutput
{
  return *(void *)(a1 + 8);
}

- (uint64_t)joints
{
  return *(void *)(a1 + 32);
}

- (const)jointTrackingStates
{
  return self->_jointTrackingStates.__begin_;
}

- (unint64_t)jointCount
{
  return (uint64_t)(*(void *)self->_anon_10 - (unint64_t)self->_rawJoints.var0) >> 3;
}

- (unint64_t)trackedJointCount
{
  begin = self->_jointTrackingStates.__begin_;
  end = self->_jointTrackingStates.__end_;
  if (begin == end) {
    return 0;
  }
  int v4 = 0;
  do
  {
    int v5 = *begin++;
    v4 += v5;
  }
  while (begin != end);
  return v4;
}

- (ABPK2DDetectionResult)initWithJoints:(ABPK2DDetectionResult *)self trackingStates:(SEL)a2 numberOfJoints:aligningPreviousSkeleton:rotation:
{
  uint64_t v7 = v6;
  unint64_t v8 = v4;
  CGFloat v9 = v3;
  uint64_t v10 = v2;
  id v12 = v5;
  v117.receiver = self;
  v117.super_class = (Class)ABPK2DDetectionResult;
  unint64_t v13 = [(ABPK2DDetectionResult *)&v117 init];
  if (!v13)
  {
LABEL_86:
    v93 = v13;
    goto LABEL_87;
  }
  int v14 = 0;
  if (v8)
  {
    uint64_t v15 = 4 * v8;
    v16 = v9;
    do
    {
      int v17 = *v16++;
      v14 += v17;
      v15 -= 4;
    }
    while (v15);
  }
  int v18 = [v12 trackedJointCount];
  v115[0] = 0;
  v115[1] = 0;
  if (v14 >= v18) {
    int v19 = v18;
  }
  else {
    int v19 = v14;
  }
  unint64_t v20 = (2 * v19);
  int v116 = 2 * v19;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v115, (8 * v19));
  v113[0] = 0;
  v113[1] = 0;
  unsigned int v114 = v20;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v113, v20);
  uint64_t v21 = [v12 rawJointsOutput];
  unint64_t v22 = [v12 jointCount];
  uint64_t v23 = (_DWORD *)[v12 jointTrackingStates];
  if (v8 >= v22) {
    unint64_t v24 = v22;
  }
  else {
    unint64_t v24 = v8;
  }
  if (v24)
  {
    unsigned int v25 = 0;
    unsigned int v26 = v116;
    __float2 v27 = v115[0];
    int v28 = 2 * v116;
    int v29 = 3 * v116;
    unsigned int v30 = v114;
    float32x2_t v31 = v113[0];
    v32 = (_DWORD *)(v10 + 4);
    v33 = (float *)(v21 + 4);
    float32x2_t v34 = "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")";
    do
    {
      int v35 = *v9++;
      if (v35 && *v23)
      {
        if (v26 <= v25
          || (v27[v25] = *(void *)(v33 - 1),
              *(float *)&v27[v26 + v25] = -*v33,
              v27[v28 + v25] = 1065353216,
              v27[v29 + v25] = 0,
              uint64_t v36 = v25 + 1,
              v26 <= v36))
        {
          int v98 = 2269;
          goto LABEL_90;
        }
        v27[v36] = *(_DWORD *)v33;
        v27[v26 + v36] = *(void *)(v33 - 1);
        v27[(v28 + v36)] = 0;
        v27[(v29 + v36)] = 1065353216;
        if (v30 <= v25 || (v31[v25] = *(void *)(v32 - 1), v30 <= v36))
        {
          int v98 = 2283;
          float32x2_t v34 = "(i < mixed().elements()) || cva::detail::assertMessage(\"Index out of bounds!\")";
LABEL_90:
          __assert_rtn("assert_in_bounds", "matrixmixin.h", v98, v34);
        }
        v31[v36] = *v32;
        v25 += 2;
      }
      v32 += 2;
      v33 += 2;
      ++v23;
      --v24;
    }
    while (v24);
  }
  v106 = v115;
  v107[0] = (uint64_t *)&v106;
  v107[1] = (uint64_t *)v115;
  memset(&v108, 0, sizeof(v108));
  cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>,cva::Matrix<float,0u,4u,false>>(&v108, v107);
  cva::inv<cva::Matrix<float,4u,4u,false>,4u,true,float>(&v108, &v109);
  v105 = v115;
  v110[0] = &v109;
  v110[1] = &v105;
  if (v116 != v114) {
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  }
  v111[0] = v110;
  v111[1] = v113;
  float32x4_t v112 = 0uLL;
  cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>,cva::Matrix<float,0u,1u,false>>(&v112, (uint64_t)v111);
  uint64_t v99 = v10;
  uint64_t v100 = v7;
  uint64_t v37 = v112.i64[0];
  unint64_t v38 = (char **)(v13 + 8);
  v39.i64[0] = v112.i64[1];
  float32x4_t v104 = v39;
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)v13 + 1, v22);
  if (v22)
  {
    uint64_t v40 = 0;
    *(float *)&unint64_t v41 = -*((float *)&v37 + 1);
    HIDWORD(v41) = v37;
    float32x4_t v102 = (float32x4_t)v41;
    int32x2_t v42 = vdup_n_s32(0x7FC00000u);
    do
    {
      uint64_t v43 = vaddq_f32(v104, vmlaq_lane_f32(vmulq_n_f32((float32x4_t)(unint64_t)v37, COERCE_FLOAT(*(void *)(v21 + 8 * v40))), v102, *(float32x2_t *)(v21 + 8 * v40), 1)).u64[0];
      float32x4_t v44 = (float32x4_t)vdupq_lane_s64(v43, 0);
      v45.i32[0] = vmovn_s32(vcgtq_f32(v44, (float32x4_t)xmmword_21B813950)).u32[0];
      v45.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_21B813950, v44)).i32[1];
      if (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v45, 0xFuLL))))
      {
        float64_t v47 = (int32x2_t *)*((void *)v13 + 2);
        unint64_t v46 = *((void *)v13 + 3);
        if ((unint64_t)v47 >= v46)
        {
          uint64_t v51 = ((char *)v47 - *v38) >> 3;
          if ((unint64_t)(v51 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v52 = v46 - (void)*v38;
          uint64_t v53 = v52 >> 2;
          if (v52 >> 2 <= (unint64_t)(v51 + 1)) {
            uint64_t v53 = v51 + 1;
          }
          if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v54 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v54 = v53;
          }
          if (v54) {
            v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v13 + 24), v54);
          }
          else {
            v55 = 0;
          }
          v59 = (int32x2_t *)&v55[8 * v51];
          int32x2_t *v59 = v42;
          float32x2_t v48 = v59 + 1;
          v61 = (char *)*((void *)v13 + 1);
          v60 = (char *)*((void *)v13 + 2);
          if (v60 != v61)
          {
            do
            {
              int32x2_t v62 = *(int32x2_t *)(v60 - 8);
              v60 -= 8;
              v59[-1] = v62;
              --v59;
            }
            while (v60 != v61);
            goto LABEL_52;
          }
          goto LABEL_53;
        }
        *float64_t v47 = v42;
        float32x2_t v48 = v47 + 1;
      }
      else
      {
        uint64_t v101 = v43;
        long long v50 = (uint64_t *)*((void *)v13 + 2);
        unint64_t v49 = *((void *)v13 + 3);
        if ((unint64_t)v50 >= v49)
        {
          uint64_t v56 = ((char *)v50 - *v38) >> 3;
          if ((unint64_t)(v56 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v57 = v49 - (void)*v38;
          uint64_t v58 = v57 >> 2;
          if (v57 >> 2 <= (unint64_t)(v56 + 1)) {
            uint64_t v58 = v56 + 1;
          }
          if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v54 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v54 = v58;
          }
          if (v54) {
            v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v13 + 24), v54);
          }
          else {
            v55 = 0;
          }
          v59 = (int32x2_t *)&v55[8 * v56];
          int32x2_t *v59 = (int32x2_t)v101;
          float32x2_t v48 = v59 + 1;
          v63 = (char *)*((void *)v13 + 1);
          v60 = (char *)*((void *)v13 + 2);
          if (v60 != v63)
          {
            do
            {
              int32x2_t v64 = *(int32x2_t *)(v60 - 8);
              v60 -= 8;
              v59[-1] = v64;
              --v59;
            }
            while (v60 != v63);
LABEL_52:
            v60 = *v38;
          }
LABEL_53:
          *((void *)v13 + 1) = v59;
          *((void *)v13 + 2) = v48;
          *((void *)v13 + 3) = &v55[8 * v54];
          if (v60) {
            operator delete(v60);
          }
          goto LABEL_55;
        }
        *long long v50 = v43;
        float32x2_t v48 = (int32x2_t *)(v50 + 1);
      }
LABEL_55:
      *((void *)v13 + 2) = v48;
      ++v40;
    }
    while (v40 != v22);
  }
  if (-[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::onceToken != -1) {
    dispatch_once(&-[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::onceToken, &__block_literal_global_0);
  }
  if (v100)
  {
    float v65 = (double)v100 * 3.14159265 / 180.0;
    __float2 v66 = __sincosf_stret(v65);
    v67 = (char **)(v13 + 32);
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)v13 + 4, (uint64_t)(*((void *)v13 + 2) - *((void *)v13 + 1)) >> 3);
    v68.f32[0] = -v66.__sinval;
    v68.i32[1] = LODWORD(v66.__cosval);
    float32x2_t v103 = v68;
    uint64_t v69 = *((void *)v13 + 1);
    if (*((void *)v13 + 2) != v69)
    {
      unint64_t v70 = 0;
      v71 = v13 + 48;
      v72 = (float32x2_t *)*((void *)v13 + 5);
      do
      {
        float32x2_t v73 = vadd_f32(*(float32x2_t *)(v69 + 8 * v70), (float32x2_t)0xBF000000BF000000);
        float32x2_t v74 = vadd_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v66.__sinval), LODWORD(v66.__cosval)), v73.f32[0]), v103, v73, 1), (float32x2_t)0x3F0000003F000000);
        if ((unint64_t)v72 >= *v71)
        {
          uint64_t v75 = ((char *)v72 - *v67) >> 3;
          if ((unint64_t)(v75 + 1) >> 61) {
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v76 = *v71 - (void)*v67;
          uint64_t v77 = v76 >> 2;
          if (v76 >> 2 <= (unint64_t)(v75 + 1)) {
            uint64_t v77 = v75 + 1;
          }
          if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v78 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v78 = v77;
          }
          if (v78) {
            v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v13 + 48), v78);
          }
          else {
            v79 = 0;
          }
          v80 = (float32x2_t *)&v79[8 * v75];
          float32x2_t *v80 = v74;
          v72 = v80 + 1;
          v82 = (char *)*((void *)v13 + 4);
          v81 = (char *)*((void *)v13 + 5);
          if (v81 != v82)
          {
            do
            {
              float32x2_t v83 = *(float32x2_t *)(v81 - 8);
              v81 -= 8;
              v80[-1] = v83;
              --v80;
            }
            while (v81 != v82);
            v81 = *v67;
          }
          *((void *)v13 + 4) = v80;
          *((void *)v13 + 5) = v72;
          *((void *)v13 + 6) = &v79[8 * v78];
          if (v81) {
            operator delete(v81);
          }
        }
        else
        {
          *v72++ = v74;
        }
        *((void *)v13 + 5) = v72;
        ++v70;
        uint64_t v69 = *((void *)v13 + 1);
      }
      while (v70 < (*((void *)v13 + 2) - v69) >> 3);
    }
    uint64_t v84 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex;
    float32x2_t v85 = vadd_f32(*(float32x2_t *)(v99+ 8* -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex), (float32x2_t)0xBF000000BF000000);
    float32x2_t v86 = vadd_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v66.__sinval), LODWORD(v66.__cosval)), v85.f32[0]), v103, v85, 1), (float32x2_t)0x3F0000003F000000);
    uint64_t v87 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex;
    float32x2_t v88 = vadd_f32(*(float32x2_t *)(v99+ 8* -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex), (float32x2_t)0xBF000000BF000000);
    float32x2_t v89 = vadd_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v66.__sinval), LODWORD(v66.__cosval)), v88.f32[0]), v103, v88, 1), (float32x2_t)0x3F0000003F000000);
  }
  else
  {
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v13 + 32, *((char **)v13 + 1), *((void *)v13 + 2), (uint64_t)(*((void *)v13 + 2) - *((void *)v13 + 1)) >> 3);
    uint64_t v84 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex;
    float32x2_t v86 = *(float32x2_t *)(v99
                         + 8
                         * -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex);
    uint64_t v87 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex;
    float32x2_t v89 = *(float32x2_t *)(v99
                         + 8
                         * -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex);
  }
  uint64_t v90 = *((void *)v13 + 4);
  float32x2_t v91 = vsub_f32(v86, *(float32x2_t *)(v90 + 8 * v84));
  if (sqrtf(vaddv_f32(vmul_f32(v91, v91))) <= 0.05)
  {
    float32x2_t v92 = vsub_f32(v89, *(float32x2_t *)(v90 + 8 * v87));
    if (sqrtf(vaddv_f32(vmul_f32(v92, v92))) <= 0.05)
    {
      v94 = (const void *)[v12 jointTrackingStates];
      uint64_t v95 = [v12 jointTrackingStates];
      memset(&v109, 0, 24);
      std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int const*,unsigned int const*>(&v109, v94, v95 + 4 * v22, (uint64_t)(v95 + 4 * v22 - (void)v94) >> 2);
      v96 = (void *)*((void *)v13 + 7);
      if (v96)
      {
        *((void *)v13 + 8) = v96;
        operator delete(v96);
        *((void *)v13 + 7) = 0;
        *((void *)v13 + 8) = 0;
        *((void *)v13 + 9) = 0;
      }
      *(simd_float4 *)(v13 + 56) = v109.columns[0];
      *((void *)v13 + 9) = v109.columns[1].i64[0];
      *((void *)v13 + 13) = v100;
      free(v113[0]);
      free(v115[0]);
      goto LABEL_86;
    }
  }
  free(v113[0]);
  free(v115[0]);
  v93 = 0;
LABEL_87:

  return v93;
}

void __104__ABPK2DDetectionResult_initWithJoints_trackingStates_numberOfJoints_aligningPreviousSkeleton_rotation___block_invoke()
{
  v0 = [[ABPKSkeletonDefinition alloc] initWithType:0];
  -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::rootIndex = [(ABPKSkeletonDefinition *)v0 indexOfJointWithName:@"root"];
  -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:aligningPreviousSkeleton:rotation:]::neckIndex = [(ABPKSkeletonDefinition *)v0 indexOfJointWithName:@"neck"];
}

- (id)alignSkeleton:(id)a3 rotationNeeded:(int64_t)a4
{
  id v6 = a3;
  int v7 = [(ABPK2DDetectionResult *)self trackedJointCount];
  int v8 = [v6 trackedJointCount];
  v82[0] = 0;
  v82[1] = 0;
  if (v7 >= v8) {
    int v9 = v8;
  }
  else {
    int v9 = v7;
  }
  unint64_t v10 = (2 * v9);
  unsigned int v83 = 2 * v9;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v82, (8 * v9));
  v80[0] = 0;
  v80[1] = 0;
  unsigned int v81 = v10;
  cva::MatrixData<float,0ul,0ul,false>::reserve((uint64_t)v80, v10);
  unint64_t v11 = 0;
  unsigned int v12 = 0;
  uint64_t v13 = 1;
  int v14 = "((row < mixed().rows()) && (col < mixed().columns())) || cva::detail::assertMessage(\"Index out of bounds!\")";
  while (-[ABPK2DDetectionResult jointCount](self, "jointCount") > v11 && [v6 jointCount] > v11)
  {
    if ([(ABPK2DDetectionResult *)self jointTrackingStates][4 * v11]
      && *(_DWORD *)([v6 jointTrackingStates] + 4 * v11))
    {
      uint64_t v15 = [v6 rawJointsOutput];
      if (v83 <= v12) {
        goto LABEL_61;
      }
      *((_DWORD *)v82[0] + v12) = *(void *)(v15 + 8 * v11);
      uint64_t v16 = [v6 rawJointsOutput];
      unsigned int v17 = v83;
      if (v83 <= v12) {
        goto LABEL_61;
      }
      int v18 = v82[0];
      *((float *)v82[0] + v83 + v12) = -*(float *)(v16 + 4 * v13);
      unsigned int v19 = v12 + 2 * v17;
      v18[v19] = 1065353216;
      v18[v19 + v17] = 0;
      uint64_t v20 = [v6 rawJointsOutput];
      uint64_t v21 = v12 + 1;
      if (v83 <= v21
        || (*((_DWORD *)v82[0] + v21) = *(_DWORD *)(v20 + 4 * v13),
            uint64_t v22 = [v6 rawJointsOutput],
            unsigned int v23 = v83,
            v83 <= v21))
      {
LABEL_61:
        int v68 = 2269;
        goto LABEL_63;
      }
      unint64_t v24 = v82[0];
      *((_DWORD *)v82[0] + v83 + v21) = *(void *)(v22 + 8 * v11);
      int v25 = v21 + 2 * v23;
      v24[v25] = 0;
      v24[v25 + v23] = 1065353216;
      uint64_t v26 = [(ABPK2DDetectionResult *)self rawJointsOutput];
      if (v81 <= v12
        || (*((_DWORD *)v80[0] + v12) = *(void *)(v26 + 8 * v11),
            uint64_t v27 = [(ABPK2DDetectionResult *)self rawJointsOutput],
            v81 <= v21))
      {
        int v68 = 2283;
        int v14 = "(i < mixed().elements()) || cva::detail::assertMessage(\"Index out of bounds!\")";
LABEL_63:
        __assert_rtn("assert_in_bounds", "matrixmixin.h", v68, v14);
      }
      *((_DWORD *)v80[0] + v21) = *(_DWORD *)(v27 + 4 * v13);
      v12 += 2;
    }
    ++v11;
    v13 += 2;
  }
  float32x2_t v73 = v82;
  v74[0] = (uint64_t *)&v73;
  v74[1] = (uint64_t *)v82;
  memset(&v75, 0, sizeof(v75));
  cva::assign<false,false,cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>,cva::Matrix<float,0u,4u,false>>(&v75, v74);
  cva::inv<cva::Matrix<float,4u,4u,false>,4u,true,float>(&v75, &__p);
  v72 = v82;
  v77[0] = &__p;
  v77[1] = &v72;
  if (v83 != v81) {
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  }
  v78[0] = v77;
  v78[1] = v80;
  float32x4_t v79 = 0uLL;
  cva::assign<false,false,cva::Matrix<float,4u,1u,false>,cva::MatrixMultExpr<cva::Matrix<float,4u,4u,false>,cva::MatrixTransposeExpr<cva::Matrix<float,0u,4u,false> const>>,cva::Matrix<float,0u,1u,false>>(&v79, (uint64_t)v78);
  float32x4_t v30 = v79;
  v28.i64[0] = *(_OWORD *)&v30 >> 64;
  unint64_t v29 = (unint64_t)v30;
  float32x4_t v71 = v28;
  memset(&__p, 0, 24);
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE7reserveEm((void **)&__p, [v6 jointCount]);
  unint64_t v31 = 0;
  *(float *)&unint64_t v32 = -*((float *)&v29 + 1);
  HIDWORD(v32) = v29;
  float32x4_t v70 = (float32x4_t)v32;
  int32x2_t v33 = vdup_n_s32(0x7FC00000u);
  while (objc_msgSend(v6, "jointCount", *(_OWORD *)&v69) > v31)
  {
    uint64_t v34 = [v6 rawJointsOutput];
    float32x4_t v35 = vaddq_f32(v71, vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v29, COERCE_FLOAT(*(void *)(v34 + 8 * v31))), v70, *(float32x2_t *)(v34 + 8 * v31), 1));
    float32x4_t v36 = (float32x4_t)vdupq_lane_s64(v35.i64[0], 0);
    v37.i32[0] = vmovn_s32(vcgtq_f32(v36, (float32x4_t)xmmword_21B813950)).u32[0];
    v37.i32[1] = vmovn_s32(vcgtq_f32((float32x4_t)xmmword_21B813950, v36)).i32[1];
    if (vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(v37, 0xFuLL))))
    {
      uint64_t v38 = __p.columns[0].i64[1];
      if (__p.columns[0].i64[1] < (unint64_t)__p.columns[1].i64[0])
      {
        *(int32x2_t *)__p.columns[0].i64[1] = v33;
        uint64_t v39 = v38 + 8;
        goto LABEL_51;
      }
      uint64_t v41 = (__p.columns[0].i64[1] - __p.columns[0].i64[0]) >> 3;
      if ((unint64_t)(v41 + 1) >> 61) {
        std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v42 = (__p.columns[1].i64[0] - __p.columns[0].i64[0]) >> 2;
      if (v42 <= v41 + 1) {
        unint64_t v42 = v41 + 1;
      }
      if (__p.columns[1].i64[0] - __p.columns[0].i64[0] >= 0x7FFFFFFFFFFFFFF8uLL) {
        unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v42;
      }
      if (v43) {
        float32x4_t v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&__p.columns[1], v43);
      }
      else {
        float32x4_t v44 = 0;
      }
      float64_t v47 = (int32x2_t *)&v44[8 * v41];
      *float64_t v47 = v33;
      uint64_t v39 = (uint64_t)&v47[1];
      float32x2_t v48 = (char *)__p.columns[0].i64[1];
      uint64_t v49 = __p.columns[0].i64[0];
      if (__p.columns[0].i64[1] == __p.columns[0].i64[0]) {
        goto LABEL_49;
      }
      do
      {
        int32x2_t v50 = *(int32x2_t *)(v48 - 8);
        v48 -= 8;
        v47[-1] = v50;
        --v47;
      }
      while (v48 != (char *)v49);
      goto LABEL_48;
    }
    float32x4_t v69 = v35;
    uint64_t v40 = __p.columns[0].i64[1];
    if (__p.columns[0].i64[1] < (unint64_t)__p.columns[1].i64[0])
    {
      *(void *)__p.columns[0].i64[1] = v35.i64[0];
      uint64_t v39 = v40 + 8;
      goto LABEL_51;
    }
    uint64_t v45 = (__p.columns[0].i64[1] - __p.columns[0].i64[0]) >> 3;
    if ((unint64_t)(v45 + 1) >> 61) {
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v46 = (__p.columns[1].i64[0] - __p.columns[0].i64[0]) >> 2;
    if (v46 <= v45 + 1) {
      unint64_t v46 = v45 + 1;
    }
    if (__p.columns[1].i64[0] - __p.columns[0].i64[0] >= 0x7FFFFFFFFFFFFFF8uLL) {
      unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v43 = v46;
    }
    if (v43) {
      float32x4_t v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&__p.columns[1], v43);
    }
    else {
      float32x4_t v44 = 0;
    }
    float64_t v47 = (int32x2_t *)&v44[8 * v45];
    *float64_t v47 = *(int32x2_t *)v69.f32;
    uint64_t v39 = (uint64_t)&v47[1];
    float32x2_t v48 = (char *)__p.columns[0].i64[1];
    uint64_t v51 = __p.columns[0].i64[0];
    if (__p.columns[0].i64[1] != __p.columns[0].i64[0])
    {
      do
      {
        int32x2_t v52 = *(int32x2_t *)(v48 - 8);
        v48 -= 8;
        v47[-1] = v52;
        --v47;
      }
      while (v48 != (char *)v51);
LABEL_48:
      float32x2_t v48 = (char *)__p.columns[0].i64[0];
    }
LABEL_49:
    __p.columns[0].i64[0] = (uint64_t)v47;
    __p.columns[0].i64[1] = v39;
    __p.columns[1].i64[0] = (uint64_t)&v44[8 * v43];
    if (v48) {
      operator delete(v48);
    }
LABEL_51:
    __p.columns[0].i64[1] = v39;
    ++v31;
  }
  uint64_t v53 = [ABPK2DDetectionResult alloc];
  uint64_t v54 = __p.columns[0].i64[0];
  uint64_t v55 = [v6 jointTrackingStates];
  uint64_t v56 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:](v53, "initWithJoints:trackingStates:numberOfJoints:rotation:croppedRect:liftingData:", v54, v55, (__p.columns[0].i64[1] - __p.columns[0].i64[0]) >> 3, a4, 0, 0.0, 0.0, 1.0, 1.0);
  uint64_t v57 = [[ABPKSkeletonDefinition alloc] initWithType:0];
  uint64_t v58 = [(ABPKSkeletonDefinition *)v57 indexOfJointWithName:@"root"];
  uint64_t v59 = [(ABPKSkeletonDefinition *)v57 indexOfJointWithName:@"neck"];
  float32x2_t v60 = *(float32x2_t *)([(ABPK2DDetectionResult *)self joints] + 8 * v58);
  float32x2_t v61 = *(float32x2_t *)([(ABPK2DDetectionResult *)v56 joints] + 8 * v58);
  float32x2_t v62 = *(float32x2_t *)([(ABPK2DDetectionResult *)self joints] + 8 * v59);
  uint64_t v63 = [(ABPK2DDetectionResult *)v56 joints];
  float32x2_t v64 = vsub_f32(v60, v61);
  if (sqrtf(vaddv_f32(vmul_f32(v64, v64))) <= 0.05
    && (float32x2_t v65 = vsub_f32(v62, *(float32x2_t *)(v63 + 8 * v59)), sqrtf(vaddv_f32(vmul_f32(v65, v65))) <= 0.05))
  {
    __float2 v66 = v56;
  }
  else
  {
    __float2 v66 = 0;
  }

  if (__p.columns[0].i64[0])
  {
    __p.columns[0].i64[1] = __p.columns[0].i64[0];
    operator delete((void *)__p.columns[0].i64[0]);
  }
  free(v80[0]);
  free(v82[0]);

  return v66;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", -[ABPK2DDetectionResult jointCount](self, "jointCount"));
  [v9 encodeObject:v4 forKey:@"jointCount"];

  int v5 = [(ABPK2DDetectionResult *)self liftingData];
  [v9 encodeObject:v5 forKey:@"liftingData"];

  [(ABPK2DDetectionResult *)self imageResolution];
  *(float *)&double v6 = v6;
  [v9 encodeFloat:@"imageResolution.width" forKey:v6];
  [(ABPK2DDetectionResult *)self imageResolution];
  *(float *)&double v8 = v7;
  [v9 encodeFloat:@"imageResolution.height" forKey:v8];
  objc_msgSend(v9, "encodeInteger:forKey:", -[ABPK2DDetectionResult rotation](self, "rotation"), @"rotation");
  objc_msgSend(v9, "encodeBytes:length:forKey:", -[ABPK2DDetectionResult rawJointsOutput](self, "rawJointsOutput"), 8 * -[ABPK2DDetectionResult jointCount](self, "jointCount"), @"rawJointsData");
  objc_msgSend(v9, "encodeBytes:length:forKey:", -[ABPK2DDetectionResult jointTrackingStates](self, "jointTrackingStates"), 4 * -[ABPK2DDetectionResult jointCount](self, "jointCount"), @"jointTrackingStates");
}

- (ABPK2DDetectionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"jointCount"];
  uint64_t v6 = [v5 unsignedLongValue];

  uint64_t v7 = [v4 decodeIntegerForKey:@"rotation"];
  [v4 decodeFloatForKey:@"imageResolution.width"];
  float v9 = v8;
  [v4 decodeFloatForKey:@"imageResolution.height"];
  float v11 = v10;
  unint64_t v23 = 0;
  id v12 = v4;
  uint64_t v13 = [v12 decodeBytesForKey:@"rawJointsData" returnedLength:&v23];
  if (v6 != v23 >> 3)
  {
    NSLog(&cfstr_InconsistentJo.isa);
LABEL_6:
    uint64_t v20 = 0;
    goto LABEL_7;
  }
  uint64_t v14 = v13;
  unint64_t v22 = 0;
  id v15 = v12;
  uint64_t v16 = [v15 decodeBytesForKey:@"jointTrackingStates" returnedLength:&v22];
  if (v6 != v22 >> 2)
  {
    NSLog(&cfstr_InconsistentTr.isa);
    goto LABEL_6;
  }
  uint64_t v17 = v16;
  int v18 = [v15 decodeObjectOfClass:objc_opt_class() forKey:@"liftingData"];
  unsigned int v19 = -[ABPK2DDetectionResult initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:]([ABPK2DDetectionResult alloc], "initWithJoints:trackingStates:numberOfJoints:imageResolution:rotation:croppedRect:liftingData:", v14, v17, v6, v7, v18, v9, v11, 0.0, 0.0, 1.0, 1.0);

  self = v19;
  uint64_t v20 = self;
LABEL_7:

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    int v5 = v4;
    unint64_t v6 = [(ABPK2DDetectionResult *)self jointCount];
    if (v6 == [v5 jointCount])
    {
      var0 = self->_rawJoints.var0;
      float v8 = *(__compressed_pair<float * __attribute__((ext_vector_type(2))), std::allocator<float __attribute__((ext_vector_type(2)))>> ***)self->_anon_10;
      unint64_t v9 = v8 - var0;
      float v10 = (float32x2_t *)v5[1];
      if (v9 == (uint64_t)(v5[2] - (void)v10) >> 3)
      {
        if (v8 == var0)
        {
LABEL_9:
          id v12 = self->_rotatedJoints.var0;
          uint64_t v13 = *(void *)self->_anon_28 - (void)v12;
          if (v13)
          {
            unint64_t v14 = v13 >> 3;
            id v15 = (float32x2_t *)v5[4];
            if (v14 <= 1) {
              unint64_t v14 = 1;
            }
            while (1)
            {
              float32x2_t v16 = vsub_f32(*v15, *(float32x2_t *)v12);
              if (sqrtf(vaddv_f32(vmul_f32(v16, v16))) > 0.00000011921) {
                break;
              }
              ++v12;
              ++v15;
              if (!--v14) {
                goto LABEL_14;
              }
            }
          }
          else
          {
LABEL_14:
            if (self->_rotation == v5[13])
            {
              uint64_t v17 = [(ABPK2DDetectionResult *)self liftingData];
              int v18 = [v5 liftingData];
              char v19 = [v17 isEqual:v18];

LABEL_18:
              goto LABEL_19;
            }
          }
        }
        else
        {
          if (v9 <= 1) {
            unint64_t v9 = 1;
          }
          while (1)
          {
            float32x2_t v11 = vsub_f32(*v10, *(float32x2_t *)var0);
            if (sqrtf(vaddv_f32(vmul_f32(v11, v11))) > 0.00000011921) {
              break;
            }
            ++var0;
            ++v10;
            if (!--v9) {
              goto LABEL_9;
            }
          }
        }
      }
    }
    char v19 = 0;
    goto LABEL_18;
  }
  char v19 = 0;
LABEL_19:

  return v19;
}

- (unint64_t)hash
{
  unint64_t result = [(ABPK2DDetectionResult *)self jointCount];
  if (result)
  {
    float v4 = COERCE_FLOAT(*self->_rotatedJoints.var0);
    LODWORD(v5) = HIDWORD(*(void *)(*(void *)self->_anon_28 - 8));
    return [(ABPK2DDetectionResult *)self jointCount] ^ (unint64_t)v4 ^ (unint64_t)v5;
  }
  return result;
}

- (CGSize)imageResolution
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (ABPK2D3DLiftingData)liftingData
{
  return self->_liftingData;
}

- (int64_t)rotation
{
  return self->_rotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftingData, 0);
  begin = self->_jointTrackingStates.__begin_;
  if (begin)
  {
    self->_jointTrackingStates.__end_ = begin;
    operator delete(begin);
  }
  var0 = self->_rotatedJoints.var0;
  if (var0)
  {
    *(void *)self->_anon_28 = var0;
    operator delete(var0);
  }
  float v5 = self->_rawJoints.var0;
  if (v5)
  {
    *(void *)self->_anon_10 = v5;
    operator delete(v5);
  }
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end