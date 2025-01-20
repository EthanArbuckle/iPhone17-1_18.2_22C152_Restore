@interface ABPKDepthBasedScaleEstimation
- (ABPKDepthBasedScaleEstimation)init;
- (float)estimateScaleFromDepthData:(CGFloat)a3 depthConfidenceData:(CGFloat)a4 timestamp:(__n128)a5 imageResolution:(__n128)a6 imageIntrinsics:(__n128)a7 cameraFromBodyPose:(uint64_t)a8 liftingResult:(__CVBuffer *)a9;
- (float)estimateScaleFromJasperCloud:(float32x4_t)a3 cameraFromBodyPose:(float32x4_t)a4 liftingResult:(float32x4_t)a5;
- (void)resetState;
@end

@implementation ABPKDepthBasedScaleEstimation

- (ABPKDepthBasedScaleEstimation)init
{
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPKDepthBasedScaleEstimation: Initializing ", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)ABPKDepthBasedScaleEstimation;
  v4 = [(ABPKDepthBasedScaleEstimation *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ABPKDepthBasedScaleEstimation *)v4 resetState];
  }
  return v5;
}

- (void)resetState
{
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPKDepthBasedScaleEstimation: Reset state ", v4, 2u);
  }

  self->_depth_scaler_num_den = 0;
  self->_depth_scaler_observation_count = 0;
}

- (float)estimateScaleFromDepthData:(CGFloat)a3 depthConfidenceData:(CGFloat)a4 timestamp:(__n128)a5 imageResolution:(__n128)a6 imageIntrinsics:(__n128)a7 cameraFromBodyPose:(uint64_t)a8 liftingResult:(__CVBuffer *)a9
{
  *(__n128 *)&v97[16] = a6;
  *(__n128 *)&v97[32] = a7;
  *(__n128 *)v97 = a5;
  id v23 = a11;
  v24 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v24, OS_LOG_TYPE_DEBUG, " ABPKDepthBasedScaleEstimation: Estimating scale from AppleDepth data ", buf, 2u);
  }

  if (a2 - *(double *)(a1 + 8) > 1.0) {
    [(id)a1 resetState];
  }
  size_t Width = CVPixelBufferGetWidth(a9);
  size_t Height = CVPixelBufferGetHeight(a9);
  int v27 = Height;
  v125.width = (double)Width;
  v125.height = (double)Height;
  v124.width = a3;
  v124.height = a4;
  v29.f32[0] = ABPKAdjustIntrinsicsForViewportSize(*(simd_float3x3 *)v97, v124, v125);
  unint64_t v28 = 0;
  v29.i32[3] = 0;
  v30.i32[3] = 0;
  v31.i32[3] = 0;
  float32x4_t v119 = a15;
  v120[0] = a16;
  v120[1] = a17;
  v120[2] = a18;
  do
  {
    *(float32x4_t *)&buf[v28] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)((char *)&v119 + v28))), v30, *(float32x2_t *)&v119.f32[v28 / 4], 1), v31, *(float32x4_t *)((char *)&v119 + v28), 2), (float32x4_t)xmmword_21B813530, *(float32x4_t *)((char *)&v119 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  float32x4_t v99 = (float32x4_t)v122[0];
  float32x4_t v100 = *(float32x4_t *)buf;
  float32x4_t v96 = (float32x4_t)v122[2];
  float32x4_t v98 = (float32x4_t)v122[1];
  CVPixelBufferLockBaseAddress(a9, 0);
  CVPixelBufferLockBaseAddress(a10, 0);
  v32 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v32, OS_LOG_TYPE_DEBUG, " \t Accessing depth data pointers ", buf, 2u);
  }

  BaseAddress = (const float *)CVPixelBufferGetBaseAddress(a9);
  int BytesPerRow = CVPixelBufferGetBytesPerRow(a9);
  v91 = (const float *)CVPixelBufferGetBaseAddress(a10);
  int v34 = CVPixelBufferGetBytesPerRow(a10);
  memset(buf, 0, sizeof(buf));
  *(void *)&v122[0] = 0;
  float32x4_t v119 = 0uLL;
  *(void *)&v120[0] = 0;
  __p = 0;
  v117 = 0;
  v118 = 0;
  std::vector<float>::reserve((void **)buf, [v23 jointCount]);
  std::vector<float>::reserve((void **)&v119, [v23 jointCount]);
  std::vector<float>::reserve(&__p, [v23 jointCount]);
  v35 = __ABPKLogSharedInstance();
  unint64_t v36 = (unint64_t)BytesPerRow >> 2;
  unint64_t v37 = (unint64_t)v34 >> 2;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v112 = 0;
    _os_log_impl(&dword_21B7C6000, v35, OS_LOG_TYPE_DEBUG, " \t Extracting depth data for the 2d keypoints ", v112, 2u);
  }

  unint64_t v38 = 0;
  v89 = v122;
  while (objc_msgSend(v23, "jointCount", v89) > v38)
  {
    if ([v23 isJointTracked:v38])
    {
      v44 = (const float *)[v23 joints];
      v39 = (float *)&v44[4 * v38];
      *(float *)v40.i32 = v39[1] / 1000.0;
      *(float *)v41.i32 = v39[2] / 1000.0;
      float32x4_t v42 = vaddq_f32(v96, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v100, *v39 / 1000.0), v99, *(float *)v40.i32), v98, *(float *)v41.i32));
      unint64_t v43 = vdivq_f32(v42, (float32x4_t)vdupq_laneq_s32((int32x4_t)v42, 2)).u64[0];
      LODWORD(v44) = llroundf(*(float *)&v43);
      if ((v44 & 0x80000000) == 0 && (int)v44 < (int)Width)
      {
        int v45 = llroundf(*((float *)&v43 + 1));
        if ((v45 & 0x80000000) == 0 && v45 < v27)
        {
          int32x2_t v93 = v41;
          int32x2_t v94 = v40;
          float v95 = *v39 / 1000.0;
          v46 = a10;
          DepthAndConfidenceInNeighborood(v44, v45, BaseAddress, v91, Width, v27, v36, v37);
          int v48 = v47;
          int v50 = v49;
          v51 = (char *)v119.i64[1];
          if (v119.i64[1] >= *(void *)&v120[0])
          {
            v53 = (char *)v119.i64[0];
            uint64_t v54 = (v119.i64[1] - v119.i64[0]) >> 2;
            unint64_t v55 = v54 + 1;
            if ((unint64_t)(v54 + 1) >> 62) {
              goto LABEL_83;
            }
            uint64_t v56 = *(void *)&v120[0] - v119.i64[0];
            if ((*(void *)&v120[0] - v119.i64[0]) >> 1 > v55) {
              unint64_t v55 = v56 >> 1;
            }
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v57 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v57 = v55;
            }
            if (v57)
            {
              v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v120, v57);
              v51 = (char *)v119.i64[1];
              v53 = (char *)v119.i64[0];
            }
            else
            {
              v58 = 0;
            }
            v59 = &v58[4 * v54];
            *(_DWORD *)v59 = v48;
            v52 = v59 + 4;
            while (v51 != v53)
            {
              int v60 = *((_DWORD *)v51 - 1);
              v51 -= 4;
              *((_DWORD *)v59 - 1) = v60;
              v59 -= 4;
            }
            v119.i64[0] = (uint64_t)v59;
            v119.i64[1] = (uint64_t)v52;
            *(void *)&v120[0] = &v58[4 * v57];
            if (v53) {
              operator delete(v53);
            }
          }
          else
          {
            *(_DWORD *)v119.i64[1] = v47;
            v52 = v51 + 4;
          }
          v119.i64[1] = (uint64_t)v52;
          v61 = v117;
          if (v117 >= v118)
          {
            v63 = (char *)__p;
            uint64_t v64 = (v117 - (unsigned char *)__p) >> 2;
            unint64_t v65 = v64 + 1;
            if ((unint64_t)(v64 + 1) >> 62) {
LABEL_83:
            }
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            uint64_t v66 = v118 - (unsigned char *)__p;
            if ((v118 - (unsigned char *)__p) >> 1 > v65) {
              unint64_t v65 = v66 >> 1;
            }
            if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v67 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v67 = v65;
            }
            if (v67)
            {
              v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v118, v67);
              v63 = (char *)__p;
              v61 = v117;
            }
            else
            {
              v68 = 0;
            }
            v69 = &v68[4 * v64];
            *(_DWORD *)v69 = v50;
            v62 = v69 + 4;
            while (v61 != v63)
            {
              int v70 = *((_DWORD *)v61 - 1);
              v61 -= 4;
              *((_DWORD *)v69 - 1) = v70;
              v69 -= 4;
            }
            __p = v69;
            v117 = v62;
            v118 = &v68[4 * v67];
            if (v63) {
              operator delete(v63);
            }
          }
          else
          {
            *(_DWORD *)v117 = v50;
            v62 = v61 + 4;
          }
          v117 = v62;
          float32x4_t v71 = vaddq_f32(a18, vmlaq_f32(vmlaq_f32(vmulq_n_f32(a15, v95), (float32x4_t)vdupq_lane_s32(v94, 0), a16), (float32x4_t)vdupq_lane_s32(v93, 0), a17));
          __int32 v72 = v71.i32[2];
          v73 = *(char **)&buf[8];
          if (*(void *)&buf[8] >= *(void *)&v122[0])
          {
            v75 = *(char **)buf;
            uint64_t v76 = (uint64_t)(*(void *)&buf[8] - *(void *)buf) >> 2;
            unint64_t v77 = v76 + 1;
            if ((unint64_t)(v76 + 1) >> 62) {
              std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v78 = *(void *)&v122[0] - *(void *)buf;
            if ((uint64_t)(*(void *)&v122[0] - *(void *)buf) >> 1 > v77) {
              unint64_t v77 = v78 >> 1;
            }
            if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v79 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v79 = v77;
            }
            if (v79)
            {
              v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)v89, v79);
              v75 = *(char **)buf;
              v73 = *(char **)&buf[8];
            }
            else
            {
              v80 = 0;
            }
            v81 = (__int32 *)&v80[4 * v76];
            __int32 *v81 = v72;
            v74 = v81 + 1;
            while (v73 != v75)
            {
              __int32 v82 = *((_DWORD *)v73 - 1);
              v73 -= 4;
              *--v81 = v82;
            }
            *(void *)buf = v81;
            *(void *)&buf[8] = v74;
            *(void *)&v122[0] = &v80[4 * v79];
            if (v75) {
              operator delete(v75);
            }
          }
          else
          {
            **(_DWORD **)&buf[8] = v71.i32[2];
            v74 = v73 + 4;
          }
          *(void *)&buf[8] = v74;
          a10 = v46;
        }
      }
    }
    ++v38;
  }
  CVPixelBufferUnlockBaseAddress(a9, 0);
  CVPixelBufferUnlockBaseAddress(a10, 0);
  v83 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v112 = 0;
    _os_log_impl(&dword_21B7C6000, v83, OS_LOG_TYPE_DEBUG, " \t Performing optimization ", v112, 2u);
  }

  *(_DWORD *)v112 = (*(void *)&buf[8] - *(void *)buf) >> 2;
  uint64_t v113 = *(void *)buf;
  int v114 = *(_DWORD *)v112;
  int v115 = 0;
  unsigned int v108 = (unint64_t)(v119.i64[1] - v119.i64[0]) >> 2;
  uint64_t v109 = v119.i64[0];
  unsigned int v110 = v108;
  int v111 = 0;
  int v104 = (unint64_t)(v117 - (unsigned char *)__p) >> 2;
  v105 = __p;
  int v106 = v104;
  int v107 = 0;
  v102 = v112;
  v103 = (uint8_t *)&v104;
  cva::MatrixRef<float,0u,1u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixRef<float,0u,1u,false>,cva::MatrixRef<float,0u,1u,false>,cva::detail::MulOp>>((unsigned int *)v112, &v102);
  v102 = (uint8_t *)&v108;
  v103 = (uint8_t *)&v104;
  cva::MatrixRef<float,0u,1u,false>::operator=<cva::MatrixBinaryExpr<cva::MatrixRef<float,0u,1u,false>,cva::MatrixRef<float,0u,1u,false>,cva::detail::MulOp>>(&v108, &v102);
  v101 = v112;
  if (*(_DWORD *)v112 != v108) {
    __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
  }
  v102 = (uint8_t *)&v101;
  v103 = (uint8_t *)&v108;
  v123[0] = 0.0;
  cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(v123, (unsigned int ***)&v102);
  float v84 = v123[0];
  v101 = v112;
  v102 = (uint8_t *)&v101;
  v103 = v112;
  v123[0] = 0.0;
  cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(v123, (unsigned int ***)&v102);
  float v85 = -1.0;
  if (v84 > 0.0 && v123[0] > 0.0)
  {
    float v86 = v84 + *(float *)(a1 + 16);
    float v87 = v123[0] + *(float *)(a1 + 20);
    *(float *)(a1 + 16) = v86;
    *(float *)(a1 + 20) = v87;
    *(double *)(a1 + 8) = a2;
    float v85 = v86 / v87;
  }
  if (__p)
  {
    v117 = (char *)__p;
    operator delete(__p);
  }
  if (v119.i64[0])
  {
    v119.i64[1] = v119.i64[0];
    operator delete((void *)v119.i64[0]);
  }
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }

  return v85;
}

- (float)estimateScaleFromJasperCloud:(float32x4_t)a3 cameraFromBodyPose:(float32x4_t)a4 liftingResult:(float32x4_t)a5
{
  id v10 = a7;
  id v11 = a8;
  id v56 = v10;
  v12 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " ABPKDepthBasedScaleEstimation: Estimating scale from Jasper point cloud data ", buf, 2u);
  }

  ExtractJasperNSZs(v10, (char **)buf);
  uint64_t v13 = 0;
  unint64_t v77 = 0;
  uint64_t v78 = 0;
  unint64_t v79 = 0;
  __p = 0;
  v75 = 0;
  uint64_t v73 = 0x700000000;
  uint64_t v76 = 0;
  do
  {
    uint64_t v14 = *((int *)&v73 + v13);
    if ([v11 isJointTracked:v14])
    {
      uint64_t v15 = [v11 joints];
      v16 = *(float32x2_t **)buf;
      if (*(float32x2_t **)buf != v81)
      {
        int32x4_t v61 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(a2, *(float *)(v15 + 16 * v14) / 1000.0), a3, *(float *)(v15 + 16 * v14 + 4) / 1000.0), a4, *(float *)(v15 + 16 * v14 + 8) / 1000.0));
        float32x2_t v17 = vdiv_f32(*(float32x2_t *)v61.i8, (float32x2_t)vdup_laneq_s32(v61, 2));
        v18 = (float32x2_t *)(*(void *)buf + 16);
        float32x2_t v19 = vsub_f32(**(float32x2_t **)buf, v17);
        float v20 = vaddv_f32(vmul_f32(v19, v19));
        if ((float32x2_t *)(*(void *)buf + 16) != v81)
        {
          do
          {
            v21 = v18 + 2;
            float32x2_t v22 = vsub_f32(*v18, v17);
            float v23 = vaddv_f32(vmul_f32(v22, v22));
            if (v23 < v20)
            {
              v16 = v18;
              float v20 = v23;
            }
            v18 += 2;
          }
          while (v21 != v81);
        }
        if (sqrtf(v20) <= 0.03)
        {
          float v24 = v16[1].f32[0];
          if (v24 > 0.0)
          {
            v25 = v75;
            if (v75 >= v76)
            {
              int v27 = (float *)__p;
              uint64_t v28 = ((char *)v75 - (unsigned char *)__p) >> 2;
              unint64_t v29 = v28 + 1;
              if ((unint64_t)(v28 + 1) >> 62) {
                std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v30 = (char *)v76 - (unsigned char *)__p;
              if (((char *)v76 - (unsigned char *)__p) >> 1 > v29) {
                unint64_t v29 = v30 >> 1;
              }
              if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v31 = v29;
              }
              if (v31)
              {
                v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v76, v31);
                int v27 = (float *)__p;
                v25 = v75;
              }
              else
              {
                v32 = 0;
              }
              v33 = (float *)&v32[4 * v28];
              float *v33 = v24;
              v26 = v33 + 1;
              while (v25 != v27)
              {
                int v34 = *((_DWORD *)v25-- - 1);
                *((_DWORD *)v33-- - 1) = v34;
              }
              __p = v33;
              v75 = v26;
              uint64_t v76 = (float *)&v32[4 * v31];
              if (v27) {
                operator delete(v27);
              }
            }
            else
            {
              float *v75 = v24;
              v26 = v25 + 1;
            }
            v75 = v26;
            v35 = v78;
            if (v78 >= v79)
            {
              unint64_t v37 = v77;
              uint64_t v38 = (v78 - v77) >> 2;
              unint64_t v39 = v38 + 1;
              if ((unint64_t)(v38 + 1) >> 62) {
                std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v40 = v79 - v77;
              if ((v79 - v77) >> 1 > v39) {
                unint64_t v39 = v40 >> 1;
              }
              if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFFCLL) {
                unint64_t v41 = 0x3FFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v41 = v39;
              }
              if (v41)
              {
                float32x4_t v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v79, v41);
                unint64_t v37 = v77;
                v35 = v78;
              }
              else
              {
                float32x4_t v42 = 0;
              }
              unint64_t v43 = &v42[4 * v38];
              *(_DWORD *)unint64_t v43 = v61.i32[2];
              unint64_t v36 = v43 + 4;
              while (v35 != v37)
              {
                int v44 = *((_DWORD *)v35 - 1);
                v35 -= 4;
                *((_DWORD *)v43 - 1) = v44;
                v43 -= 4;
              }
              unint64_t v77 = v43;
              uint64_t v78 = v36;
              unint64_t v79 = &v42[4 * v41];
              if (v37) {
                operator delete(v37);
              }
            }
            else
            {
              *(_DWORD *)uint64_t v78 = v61.i32[2];
              unint64_t v36 = v35 + 4;
            }
            uint64_t v78 = v36;
          }
        }
      }
    }
    ++v13;
  }
  while (v13 != 2);
  int v45 = (float *)__p;
  if (__p == v75)
  {
    float v51 = -1.0;
  }
  else
  {
    unint64_t v46 = (unint64_t)(v78 - v77) >> 2;
    int v68 = 0;
    int v69 = v46;
    int v70 = v77;
    int v71 = v46;
    int v72 = 0;
    unint64_t v47 = (unint64_t)((char *)v75 - (unsigned char *)__p) >> 2;
    int v65 = v47;
    uint64_t v66 = __p;
    int v67 = v47;
    if (v47)
    {
      uint64_t v48 = 4 * ((unint64_t)((char *)v75 - (unsigned char *)__p) >> 2);
      do
      {
        *int v45 = *v45 + 0.1;
        ++v45;
        v48 -= 4;
      }
      while (v48);
    }
    int v49 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_21B7C6000, v49, OS_LOG_TYPE_DEBUG, " \t Performing optimization ", v63, 2u);
    }

    v62 = &v69;
    if (v46 != v47) {
      __assert_rtn("MatrixMultExpr", "matrixmultexpr.h", 100, "((lhs.ref().columns() == rhs.ref().rows())) || cva::detail::assertMessage(\"Matrix sizes are not compatible!\")");
    }
    *(void *)v63 = &v62;
    uint64_t v64 = &v65;
    v82[0] = 0.0;
    cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(v82, (unsigned int ***)v63);
    float v50 = v82[0];
    v62 = &v69;
    *(void *)v63 = &v62;
    uint64_t v64 = &v69;
    v82[0] = 0.0;
    cva::assign<false,false,cva::Matrix<float,1u,1u,false>,cva::MatrixTransposeExpr<cva::MatrixRef<float,0u,1u,false>>,cva::MatrixRef<float,0u,1u,false>>(v82, (unsigned int ***)v63);
    float v51 = -1.0;
    int v45 = (float *)__p;
    id v10 = v56;
    if (v50 > 0.0 && v82[0] > 0.0)
    {
      float v52 = v50 + *(float *)(a1 + 16);
      float v53 = v82[0] + *(float *)(a1 + 20);
      *(float *)(a1 + 16) = v52;
      *(float *)(a1 + 20) = v53;
      unint64_t v54 = *(void *)(a1 + 24) + v75 - v45;
      *(void *)(a1 + 24) = v54;
      if (v54 >= 8) {
        float v51 = v52 / v53;
      }
    }
  }
  if (v45)
  {
    v75 = v45;
    operator delete(v45);
  }
  if (v77)
  {
    uint64_t v78 = v77;
    operator delete(v77);
  }
  if (*(void *)buf)
  {
    v81 = *(float32x2_t **)buf;
    operator delete(*(void **)buf);
  }

  return v51;
}

@end