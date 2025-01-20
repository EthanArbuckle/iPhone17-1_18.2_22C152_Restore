@interface ABPKCameraRegistration
- (ABPKCameraRegistration)init;
- (ABPKRegistrationData)estimateCameraPoseFromMatchingwithImageIntrinsics:(__n128)a3 imageResolution:(__n128)a4 joints2d:(float64_t)a5 jointsLifted3D:(float64_t)a6 jointsLifted3DCount:(uint64_t)a7;
- (id).cxx_construct;
- (id)runCameraRegistrationWithImageIntrinsics:(__n128)a3 imageResolution:(__n128)a4 liftingResult:(float64_t)a5;
- (void)_endRunCameraRegistrationSignpost;
- (void)_startRunCameraRegistrationSignpost;
@end

@implementation ABPKCameraRegistration

- (ABPKCameraRegistration)init
{
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " ABPKCameraRegistration: Initializing ", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)ABPKCameraRegistration;
  return [(ABPKCameraRegistration *)&v5 init];
}

- (ABPKRegistrationData)estimateCameraPoseFromMatchingwithImageIntrinsics:(__n128)a3 imageResolution:(__n128)a4 joints2d:(float64_t)a5 jointsLifted3D:(float64_t)a6 jointsLifted3DCount:(uint64_t)a7
{
  __n128 v62 = a2;
  __n128 v63 = a3;
  __n128 v64 = a4;
  v14 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_DEBUG, " ABPKCameraRegistration: Estimating camera pose ", buf, 2u);
  }

  v15 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v15, OS_LOG_TYPE_DEBUG, " \t Retargetting 2d keypoints to lifting skeleton type ", buf, 2u);
  }

  v61[0] = 0;
  v61[1] = 0;
  v60 = (uint64_t *)v61;
  *(void *)buf = 0x800000000;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0x700000001;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0xD00000002;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0xE00000003;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0xF00000004;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0xA00000005;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0xB00000006;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0xC00000007;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0x100000008;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0x200000009;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0x30000000ALL;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0x40000000BLL;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0x50000000CLL;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  *(void *)buf = 0x60000000DLL;
  std::__tree<std::__value_type<int,int>,std::__map_value_compare<int,std::__value_type<int,int>,std::less<int>,true>,std::allocator<std::__value_type<int,int>>>::__emplace_unique_key_args<int,std::pair<int,int>>(&v60, (int *)buf, (uint64_t *)buf);
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEEC2Em(&v58, 0x10uLL);
  v16 = v60;
  __asm { FMOV            V8.2S, #-1.0 }
  if (v60 != (uint64_t *)v61)
  {
    v22.f64[0] = a5;
    v22.f64[1] = a6;
    do
    {
      float32x2_t v23 = a8[*((int *)v16 + 7)];
      if (v23.f32[0] < 0.0 || v23.f32[1] < 0.0) {
        *(double *)&v58[8 * *((int *)v16 + 8)] = _D8;
      }
      else {
        *(float32x2_t *)&v58[8 * *((int *)v16 + 8)] = vcvt_f32_f64(vmulq_f64(v22, vcvtq_f64_f32(v23)));
      }
      v24 = (uint64_t *)v16[1];
      if (v24)
      {
        do
        {
          v25 = v24;
          v24 = (uint64_t *)*v24;
        }
        while (v24);
      }
      else
      {
        do
        {
          v25 = (uint64_t *)v16[2];
          _ZF = *v25 == (void)v16;
          v16 = v25;
        }
        while (!_ZF);
      }
      v16 = v25;
    }
    while (v25 != (uint64_t *)v61);
  }
  if (determineDeviceANEVersionPriorOrEqualToH12())
  {
    *(float32x2_t *)v58 = vmul_f32(vadd_f32(*(float32x2_t *)(v58 + 32), *(float32x2_t *)(v58 + 8)), (float32x2_t)0x3F0000003F000000);
    float32x2_t v26 = *(float32x2_t *)(v58 + 64);
    float32x2_t v27 = vmul_f32(vadd_f32(v26, *(float32x2_t *)(v58 + 56)), (float32x2_t)0x3F0000003F000000);
    *(float *)&uint64_t v28 = vmlas_n_f32(-v27.f32[0], 2.0, v26.f32[0]);
    v26.f32[0] = v27.f32[1] * -0.6 + v26.f32[1] * 1.6;
    HIDWORD(v28) = v26.i32[0];
    *((void *)v58 + 9) = v28;
  }
  else
  {
    float32x2_t v29 = a8[16];
    v30.f64[0] = a5;
    v30.f64[1] = a6;
    double v31 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(v30, vcvtq_f64_f32(v29))));
    if (v29.f32[1] < 0.0) {
      double v31 = _D8;
    }
    if (v29.f32[0] >= 0.0) {
      double v32 = v31;
    }
    else {
      double v32 = _D8;
    }
    v33 = v58;
    *((double *)v58 + 9) = v32;
    float32x2_t v35 = (float32x2_t)v33[7];
    float32x2_t v34 = (float32x2_t)v33[8];
    if (v35.f32[0] >= 0.0 && v34.f32[0] >= 0.0 && v34.f32[1] >= 0.0)
    {
      float64x2_t v36 = vcvtq_f64_f32(vsub_f32(v35, v34));
      *(float *)v36.f64 = sqrt(vaddvq_f64(vmulq_f64(v36, v36)));
      *(float *)v36.f64 = v34.f32[1] + *(float *)v36.f64 * -0.5;
      v34.i32[1] = LODWORD(v36.f64[0]);
    }
    v33[9] = v34;
  }
  long long v37 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
  v57[0] = *MEMORY[0x263EF89A8];
  v57[1] = v37;
  long long v38 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  v57[2] = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  v57[3] = v38;
  v39 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v39, OS_LOG_TYPE_DEBUG, " \t Performing registration ", buf, 2u);
  }

  btr::BodyRegistration::RegisterBody(a1 + 16, (uint64_t)v58, (v59 - v58) >> 3, a9, a10, (uint64_t)v57, 1, (float32x2_t *)&v62, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    v40 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_21B7C6000, v40, OS_LOG_TYPE_ERROR, " \t\t Registration Failed ", v47, 2u);
    }

    v41 = 0;
  }
  else
  {
    v42 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_21B7C6000, v42, OS_LOG_TYPE_DEBUG, " \t Creating result type ", v47, 2u);
    }

    v43 = [ABPKRegistrationData alloc];
    v41 = -[ABPKRegistrationData initWithImagePoints:imagePointsCount:jointsLifted3D:jointsLifted3DCount:cameraIntrinsics:imageDimensions:cameraFromBodyPose:registrationValid:](v43, "initWithImagePoints:imagePointsCount:jointsLifted3D:jointsLifted3DCount:cameraIntrinsics:imageDimensions:cameraFromBodyPose:registrationValid:", v62.n128_f64[0], v63.n128_f64[0], v64.n128_f64[0], a5, a6, v49, v50, v51, v52);
  }
  if (__p)
  {
    v56 = __p;
    operator delete(__p);
  }
  if (v53)
  {
    v54 = v53;
    operator delete(v53);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }
  std::__tree<unsigned char>::destroy((uint64_t)&v60, v61[0]);
  return v41;
}

- (id)runCameraRegistrationWithImageIntrinsics:(__n128)a3 imageResolution:(__n128)a4 liftingResult:(float64_t)a5
{
  *(void *)((char *)&v64[6] + 4) = *MEMORY[0x263EF8340];
  v60[0] = a2;
  v60[1] = a3;
  v60[2] = a4;
  id v9 = a8;
  [(id)a1 _startRunCameraRegistrationSignpost];
  v10 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_DEBUG, " ABPKCameraRegistration: Run camera registration ", buf, 2u);
  }

  v11 = objc_alloc_init(ABPKResultRegistration);
  v12 = *(void **)(a1 + 352);
  *(void *)(a1 + 352) = v11;

  v13 = [v9 skeletonDetectionResult2D];
  v14 = [v13 liftingData];
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm(a1 + 360, (unint64_t)[v14 liftingData3DElementCount] >> 1);

  if (*(void *)(a1 + 368) != *(void *)(a1 + 360))
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    v17.f64[0] = a5;
    v17.f64[1] = a6;
    float32x2_t v18 = vcvt_f32_s32(vmovn_s64(vcvtq_s64_f64(v17)));
    float32x2_t v19 = (float32x2_t)vdup_n_s32(0x447A0000u);
    do
    {
      v20 = [v13 liftingData];
      unsigned int v51 = *(_DWORD *)([v20 unnormalizedLiftingData3D] + v15);
      v21 = [v13 liftingData];
      unsigned int v49 = *(_DWORD *)([v21 unnormalizedLiftingData3D] + v15 + 4);

      *(float32x2_t *)(*(void *)(a1 + 360) + v15) = vdiv_f32(vmul_f32((float32x2_t)__PAIR64__(v49, v51), v18), v19);
      ++v16;
      v15 += 8;
    }
    while (v16 < (uint64_t)(*(void *)(a1 + 368) - *(void *)(a1 + 360)) >> 3);
  }
  objc_msgSend(*(id *)(a1 + 352), "setJoints2d:");
  v58.transform.m_data[15] = 0.0;
  v58.transform.m_data[14] = 0.0;
  uint64_t v59 = 0;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&v58.transform.m_data[14], [v9 jointCount]);
  unint64_t v22 = 0;
  float32x2_t v23 = (float32x2_t)vdup_n_s32(0x447A0000u);
  while ([v9 jointCount] > v22)
  {
    v24 = (float32x2_t *)([v9 joints] + 16 * v22);
    *(float32x2_t *)&long long v25 = vdiv_f32(*v24, v23);
    *((float *)&v25 + 2) = v24[1].f32[0] / 1000.0;
    *(_OWORD *)(*(void *)&v58.transform.m_data[14] + 16 * v22++) = v25;
  }
  long long v26 = *(_OWORD *)(MEMORY[0x263EF89A8] + 16);
  *(_OWORD *)&v58.transform.m_data[5] = *MEMORY[0x263EF89A8];
  *(_OWORD *)&v58.transform.m_data[7] = v26;
  long long v27 = *(_OWORD *)(MEMORY[0x263EF89A8] + 48);
  *(_OWORD *)&v58.transform.m_data[9] = *(_OWORD *)(MEMORY[0x263EF89A8] + 32);
  *(_OWORD *)&v58.transform.m_data[11] = v27;
  *(_OWORD *)&v58.camera_matrix.m_data[6] = *(_OWORD *)&v58.transform.m_data[5];
  *(_OWORD *)&v58.camera_matrix.m_data[8] = v26;
  *(_OWORD *)&v58.transform.m_data[1] = *(_OWORD *)&v58.transform.m_data[9];
  *(_OWORD *)&v58.transform.m_data[3] = v27;
  btr::BodyRegistration::RegisterBody(a1 + 16, *(void *)(a1 + 360), (uint64_t)(*(void *)(a1 + 368) - *(void *)(a1 + 360)) >> 3, *(uint64_t *)&v58.transform.m_data[14], (uint64_t)(*(void *)&v58.transform.m_data[15] - *(void *)&v58.transform.m_data[14]) >> 4, (uint64_t)&v58.transform.m_data[5], 1, (float32x2_t *)v60, (uint64_t)buf);
  if (*(_DWORD *)buf)
  {
    float32x2_t v29 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__n128 v63 = 0;
      _os_log_impl(&dword_21B7C6000, v29, OS_LOG_TYPE_DEFAULT, " \t\t Registration Failed ", v63, 2u);
    }

    objc_msgSend(*(id *)(a1 + 352), "setSuccess:", 0, &v58.camera_matrix.m_data[6]);
  }
  else
  {
    id v47 = v9;
    double v30 = btr::ComputeReprojectionAvg((btr *)&v55, &v58, v28);
    double v31 = btr::ComputeTotalBoneLength((uint64_t *)&v58.camera_matrix.m_data[3]);
    double v32 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__n128 v63 = 134217984;
      *(double *)__n128 v64 = v30;
      _os_log_impl(&dword_21B7C6000, v32, OS_LOG_TYPE_DEBUG, " \t\t Reprojection err evg[pixels]: %f ", v63, 0xCu);
    }

    v33 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__n128 v63 = 134217984;
      *(double *)__n128 v64 = v31;
      _os_log_impl(&dword_21B7C6000, v33, OS_LOG_TYPE_DEBUG, " \t\t Bones length: %f) ", v63, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 352), "setCameraFromBodyPose:", COERCE_DOUBLE(vcvt_f32_f64(v56[0])), COERCE_DOUBLE(vcvt_f32_f64(v56[2])), COERCE_DOUBLE(vcvt_f32_f64(v56[4])), COERCE_DOUBLE(vcvt_f32_f64(v57)), &v58.camera_matrix.m_data[6]);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(a1 + 384, 0x10uLL);
    float32x2_t v34 = *(float64x2_t **)&v58.camera_matrix.m_data[3];
    double v35 = v58.camera_matrix.m_data[4];
    if (*(void *)&v58.camera_matrix.m_data[3] != *(void *)&v58.camera_matrix.m_data[4])
    {
      uint64_t v36 = 0;
      do
      {
        float64x2_t v37 = *v34;
        *(float32x2_t *)&v37.f64[0] = vcvt_f32_f64(*v34);
        float v38 = v34[1].f64[0];
        *(float *)&v37.f64[1] = v38;
        *(float64x2_t *)(*(void *)(a1 + 384) + v36) = v37;
        v36 += 16;
        float32x2_t v34 = (float64x2_t *)((char *)v34 + 24);
      }
      while (v34 != *(float64x2_t **)&v35);
    }
    [*(id *)(a1 + 352) setJoints3dWrtBody:*(void *)(a1 + 384)];
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm(a1 + 408, 0x10uLL);
    v39 = *(double **)&v58.camera_matrix.m_data[3];
    double v40 = v58.camera_matrix.m_data[4];
    if (*(void *)&v58.camera_matrix.m_data[3] != *(void *)&v58.camera_matrix.m_data[4])
    {
      uint64_t v41 = 0;
      do
      {
        v61[0] = v56;
        v61[1] = 4;
        v62[0] = (double *)v61;
        v62[1] = v39;
        *(void *)((char *)&v64[1] + 4) = 0;
        *(void *)((char *)&v64[2] + 4) = 0;
        *(void *)((char *)v64 + 4) = 0;
        cva::assign<false,false,cva::Matrix<double,3u,1u,false>,cva::MatrixRef<double const,3u,3u,false>,cva::Matrix<double,3u,1u,false>>((uint64_t)v64 + 4, v62);
        uint64_t v42 = 0;
        float64x2_t v52 = 0uLL;
        double v53 = 0.0;
        do
        {
          v52.f64[v42] = *(double *)((char *)&v64[v42] + 4) + v57.f64[v42];
          ++v42;
        }
        while (v42 != 3);
        *(float32x2_t *)&long long v43 = vcvt_f32_f64(v52);
        *(float *)&unsigned int v44 = v53;
        *((void *)&v43 + 1) = __PAIR64__(HIDWORD(v52.f64[1]), v44);
        *(_OWORD *)(*(void *)(a1 + 408) + 16 * v41++) = v43;
        v39 += 3;
      }
      while (v39 != *(double **)&v40);
    }
    id v9 = v47;
    [*(id *)(a1 + 352) setJoints3dWrtCamera:*(void *)(a1 + 408)];
    [*(id *)(a1 + 352) setSuccess:1];
  }
  [(id)a1 _endRunCameraRegistrationSignpost];
  id v45 = *(id *)(a1 + 352);
  if (*(void *)&v58.camera_matrix.m_data[3])
  {
    v58.camera_matrix.m_data[4] = v58.camera_matrix.m_data[3];
    operator delete(*(void **)&v58.camera_matrix.m_data[3]);
  }
  if (*(void *)&v58.camera_matrix.m_data[0])
  {
    v58.camera_matrix.m_data[1] = v58.camera_matrix.m_data[0];
    operator delete(*(void **)&v58.camera_matrix.m_data[0]);
  }
  if (*(void *)&v58.transform.m_data[14])
  {
    v58.transform.m_data[15] = v58.transform.m_data[14];
    operator delete(*(void **)&v58.transform.m_data[14]);
  }

  return v45;
}

- (void)_startRunCameraRegistrationSignpost
{
}

- (void)_endRunCameraRegistrationSignpost
{
}

- (void).cxx_destruct
{
  var0 = self->_v3d_cam.var0;
  if (var0)
  {
    self[1].super.isa = (Class)var0;
    operator delete(var0);
  }
  v4 = self->_v3d_body.var0;
  if (v4)
  {
    *(void *)self->_anon_188 = v4;
    operator delete(v4);
  }
  objc_super v5 = self->_imagePoints.var0;
  if (v5)
  {
    *(void *)self->_anon_170 = v5;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_regResult, 0);
  v6 = *(void **)&self->_anon_110[56];
  if (v6)
  {
    *(void *)&self->_anon_110[64] = v6;
    operator delete(v6);
  }
  v7 = *(void **)&self->_anon_110[32];
  if (v7)
  {
    *(void *)&self->_anon_110[40] = v7;
    operator delete(v7);
  }
}

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = 5;
  *(_OWORD *)((char *)self + 168) = xmmword_21B814048;
  *(_OWORD *)((char *)self + 184) = unk_21B814058;
  *(_OWORD *)((char *)self + 20MEMORY[0x270ED9F50](875757844, 0, 0, 0, 0) = xmmword_21B814068;
  *(_OWORD *)((char *)self + 216) = unk_21B814078;
  *(_OWORD *)((char *)self + 104) = xmmword_21B814008;
  *(_OWORD *)((char *)self + 12MEMORY[0x270ED9F50](875757844, 0, 0, 0, 0) = unk_21B814018;
  *(_OWORD *)((char *)self + 136) = xmmword_21B814028;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0;
  *(_OWORD *)((char *)self + 152) = unk_21B814038;
  *((_OWORD *)self + 2MEMORY[0x270ED9F50](875757844, 0, 0, 0, 0) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 16) = 0u;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((void *)self + 53) = 0;
  *(_OWORD *)((char *)self + 392) = 0u;
  *(_OWORD *)((char *)self + 408) = 0u;
  *(_OWORD *)((char *)self + 36MEMORY[0x270ED9F50](875757844, 0, 0, 0, 0) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  return self;
}

@end