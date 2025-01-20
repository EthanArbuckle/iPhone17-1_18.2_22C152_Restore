@interface PnPSolver
- (BOOL)solveWithImagePoints:(const float *)a3 modelPoints:numImagePoints:cameraIntrinsics:transform:;
@end

@implementation PnPSolver

- (BOOL)solveWithImagePoints:(const float *)a3 modelPoints:numImagePoints:cameraIntrinsics:transform:
{
  v9 = v5;
  long long v64 = v7;
  long long v65 = v8;
  int8x16_t v63 = v6;
  int v10 = v4;
  uint64_t v11 = v3;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v115 = 0u;
  unint64_t v13 = v4;
  std::vector<cva::Matrix<double,2u,1u,false>>::reserve((void **)&v115, v4);
  if (v10)
  {
    uint64_t v14 = 0;
    v15 = (float64x2_t *)*((void *)&v115 + 1);
    do
    {
      float64x2_t v16 = vcvtq_f64_f32(*(float32x2_t *)&a3[2 * v14]);
      if ((unint64_t)v15 >= (unint64_t)v116)
      {
        float64x2_t v67 = v16;
        uint64_t v17 = (uint64_t)((uint64_t)v15 - v115) >> 4;
        if ((unint64_t)(v17 + 1) >> 60) {
          std::vector<cva::Matrix<double,2u,1u,false>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v18 = (uint64_t)(v116 - v115) >> 3;
        if (v18 <= v17 + 1) {
          unint64_t v18 = v17 + 1;
        }
        if ((void)v116 - (void)v115 >= 0x7FFFFFFFFFFFFFF0uLL) {
          unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v19 = v18;
        }
        if (v19) {
          v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<double,2u,1u,false>>>((uint64_t)&v116, v19);
        }
        else {
          v20 = 0;
        }
        v21 = (float64x2_t *)&v20[16 * v17];
        float64x2_t *v21 = v67;
        v15 = v21 + 1;
        v22 = (float64x2_t *)*((void *)&v115 + 1);
        v23 = (float64x2_t *)v115;
        if (*((void *)&v115 + 1) != (void)v115)
        {
          do
          {
            v21[-1] = v22[-1];
            --v21;
            --v22;
          }
          while (v22 != v23);
          v22 = (float64x2_t *)v115;
        }
        *(void *)&long long v115 = v21;
        *((void *)&v115 + 1) = v15;
        *(void *)&long long v116 = &v20[16 * v19];
        if (v22) {
          operator delete(v22);
        }
      }
      else
      {
        *v15++ = v16;
      }
      *((void *)&v115 + 1) = v15;
      ++v14;
    }
    while (v14 != v13);
  }
  std::vector<cva::Matrix<double,3u,1u,false>>::reserve((void **)&v116 + 1, v13);
  if (v10)
  {
    uint64_t v24 = 0;
    v25 = (float64x2_t *)v117;
    do
    {
      v26 = (float32x2_t *)(v11 + 16 * v24);
      float64x2_t v27 = vcvtq_f64_f32(*v26);
      double v28 = v26[1].f32[0];
      if ((unint64_t)v25 >= *((void *)&v117 + 1))
      {
        float64x2_t v68 = v27;
        unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v25 - *((void *)&v116 + 1)) >> 3);
        unint64_t v30 = v29 + 1;
        if (v29 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<cva::Matrix<double,2u,1u,false>>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * ((uint64_t)(*((void *)&v117 + 1) - *((void *)&v116 + 1)) >> 3) > v30) {
          unint64_t v30 = 0x5555555555555556 * ((uint64_t)(*((void *)&v117 + 1) - *((void *)&v116 + 1)) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v117 + 1) - *((void *)&v116 + 1)) >> 3) >= 0x555555555555555) {
          unint64_t v31 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v31 = v30;
        }
        if (v31) {
          v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<cva::Matrix<double,3u,1u,false>>>((uint64_t)&v117 + 8, v31);
        }
        else {
          v32 = 0;
        }
        v33 = &v32[24 * v29];
        *(float64x2_t *)v33 = v68;
        *((double *)v33 + 2) = v28;
        v35 = (char *)*((void *)&v116 + 1);
        v34 = (char *)v117;
        v36 = v33;
        if ((void)v117 != *((void *)&v116 + 1))
        {
          do
          {
            long long v37 = *(_OWORD *)(v34 - 24);
            *((void *)v36 - 1) = *((void *)v34 - 1);
            *(_OWORD *)(v36 - 24) = v37;
            v36 -= 24;
            v34 -= 24;
          }
          while (v34 != v35);
          v34 = (char *)*((void *)&v116 + 1);
        }
        v25 = (float64x2_t *)(v33 + 24);
        *((void *)&v116 + 1) = v36;
        *(void *)&long long v117 = v33 + 24;
        *((void *)&v117 + 1) = &v32[24 * v31];
        if (v34) {
          operator delete(v34);
        }
      }
      else
      {
        float64x2_t *v25 = v27;
        v25[1].f64[0] = v28;
        v25 = (float64x2_t *)((char *)v25 + 24);
      }
      *(void *)&long long v117 = v25;
      ++v24;
    }
    while (v24 != v13);
  }
  int8x16_t v38 = v63;
  float32x2_t v39 = (float32x2_t)vext_s8(*(int8x8_t *)v63.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v38, v38, 8uLL), 4uLL);
  v38.i32[1] = DWORD1(v64);
  float32x2_t v40 = v9[1];
  float64x2_t v107 = vcvtq_f64_f32(*v9);
  float64x2_t v108 = vcvtq_f64_f32(v40);
  float64x2_t v41 = vcvtq_f64_f32(*(float32x2_t *)v38.i8);
  float32x2_t v42 = v9[3];
  float64x2_t v109 = vcvtq_f64_f32(v9[2]);
  float64x2_t v110 = vcvtq_f64_f32(v42);
  float32x2_t v43 = v9[5];
  float64x2_t v111 = vcvtq_f64_f32(v9[4]);
  float64x2_t v112 = vcvtq_f64_f32(v43);
  float32x2_t v44 = v9[7];
  float64x2_t v113 = vcvtq_f64_f32(v9[6]);
  double v45 = *((float *)&v65 + 2);
  float64x2_t v114 = vcvtq_f64_f32(v44);
  float64x2_t v101 = vcvtq_f64_f32(v39);
  __p[3] = *(void **)&v41.f64[0];
  double v102 = *(float *)&v64;
  float64x2_t v66 = vcvtq_f64_f32(*(float32x2_t *)&v65);
  float64x2_t v69 = v41;
  float64_t v103 = v41.f64[1];
  float64x2_t v105 = v66;
  double v104 = *((float *)&v64 + 2);
  double v106 = v45;
  std::vector<std::pair<cva::Matrix<double,3u,1u,false>,cva::Matrix<double,2u,1u,false>>>::vector(__p, (uint64_t)(*((void *)&v115 + 1) - v115) >> 4);
  uint64_t v46 = v115;
  if (*((void *)&v115 + 1) != (void)v115)
  {
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    unint64_t v49 = 0;
    do
    {
      v50 = (char *)__p[0] + v47;
      float64x2_t v51 = vdivq_f64(vsubq_f64(*(float64x2_t *)(v46 + 16 * v49), v66), v69);
      long long v52 = *(_OWORD *)(*((void *)&v116 + 1) + v48);
      *((void *)v50 + 2) = *(void *)(*((void *)&v116 + 1) + v48 + 16);
      *(_OWORD *)v50 = v52;
      *(float64x2_t *)(v50 + 24) = v51;
      ++v49;
      uint64_t v46 = v115;
      v48 += 24;
      v47 += 40;
    }
    while (v49 < (uint64_t)(*((void *)&v115 + 1) - v115) >> 4);
  }
  uint64_t v98 = 0;
  uint64_t v99 = 0;
  uint64_t v70 = 0x6400000001;
  long long v71 = xmmword_252953170;
  int v72 = 3;
  uint64_t v97 = 0;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v96 = 0;
  uint64_t v95 = 0;
  char v53 = cva::PoseRefiner<double>::refinePose((uint64_t)&v70, (uint64_t *)__p, (uint64_t)&v107, (double *)&v99);
  *(float32x2_t *)&long long v54 = vcvt_f32_f64(v107);
  *(float *)&unsigned int v55 = v108.f64[0];
  *((void *)&v54 + 1) = v55;
  *(float32x2_t *)&long long v56 = vcvt_f32_f64(v109);
  *(float *)&unsigned int v57 = v110.f64[0];
  *((void *)&v56 + 1) = v57;
  *(float32x2_t *)&long long v58 = vcvt_f32_f64(v111);
  *(float *)&unsigned int v59 = v112.f64[0];
  *((void *)&v58 + 1) = v59;
  *(float32x2_t *)&long long v60 = vcvt_f32_f64(v113);
  *(float *)&unsigned int v61 = v114.f64[0];
  *((void *)&v60 + 1) = __PAIR64__(1.0, v61);
  *(_OWORD *)v9->f32 = v54;
  *(_OWORD *)v9[2].f32 = v56;
  *(_OWORD *)v9[4].f32 = v58;
  *(_OWORD *)v9[6].f32 = v60;
  cva::PoseRefiner<double>::~PoseRefiner(&v70);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*((void *)&v116 + 1))
  {
    *(void *)&long long v117 = *((void *)&v116 + 1);
    operator delete(*((void **)&v116 + 1));
  }
  if ((void)v115)
  {
    *((void *)&v115 + 1) = v115;
    operator delete((void *)v115);
  }
  return v53;
}

@end