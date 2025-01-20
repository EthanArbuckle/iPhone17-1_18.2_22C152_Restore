@interface ARImageDistortionCorrectionTechnique
- (ARImageDistortionCorrectionTechnique)initWithImageSize:(CGSize)a3;
- (CGPoint)lensDistortionPointForPoint:(CGPoint)a3 lookupTable:(id)a4 distortionOpticalCenter:(CGPoint)a5 imageSize:(CGSize)a6;
- (CGSize)imageSize;
- (id).cxx_construct;
- (id)processData:(id)a3;
- (void)buildUVMapFromHardcodedCalibrationParameters;
- (void)buildUVMapWithCameraCalibrationData:(id)a3;
- (void)buildUVMapWithDistortedPixelProviderBlock:(id)a3;
- (void)dealloc;
- (void)setImageSize:(CGSize)a3;
- (void)undistortImage:(__CVBuffer *)a3 toTargetImage:(__CVBuffer *)a4 imageRotationAngle:(int64_t)a5;
@end

@implementation ARImageDistortionCorrectionTechnique

- (ARImageDistortionCorrectionTechnique)initWithImageSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v18.receiver = self;
  v18.super_class = (Class)ARImageDistortionCorrectionTechnique;
  v5 = [(ARTechnique *)&v18 init];
  v6 = v5;
  if (v5)
  {
    p_CGFloat width = &v5->_imageSize.width;
    v5->_imageSize.CGFloat width = width;
    v5->_imageSize.CGFloat height = height;
    BOOL v8 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.distortionCorrection.computeCoefficientsForEveryFrame"];
    v6->_computeUndistortionCoefficientsForEveryFrame = v8;
    if (v8)
    {
      *(void *)&long long v13 = (unint64_t)*p_width;
      *((void *)&v13 + 1) = (unint64_t)v6->_imageSize.height;
      std::vector<float>::vector(__p, *((void *)&v13 + 1) * v13);
      std::vector<float>::vector(&v16, *((void *)&v13 + 1) * v13);
      BOOL engaged = v6->_undistorter.__engaged_;
      *(_OWORD *)&v6->_undistorter.var0.__null_state_ = v13;
      if (engaged)
      {
        begin = v6->_undistorter.var0.__val_.m_mappingU.__begin_;
        if (begin)
        {
          v6->_undistorter.var0.__val_.m_mappingU.__end_ = begin;
          operator delete(begin);
          v6->_undistorter.var0.__val_.m_mappingU.__begin_ = 0;
          v6->_undistorter.var0.__val_.m_mappingU.__end_ = 0;
          v6->_undistorter.var0.__val_.m_mappingU.__end_cap_.__value_ = 0;
        }
        *(_OWORD *)&v6->_undistorter.var0.__val_.m_mappingU.__begin_ = *(_OWORD *)__p;
        v6->_undistorter.var0.__val_.m_mappingU.__end_cap_.__value_ = v15;
        __p[0] = 0;
        __p[1] = 0;
        v15 = 0;
        v11 = v6->_undistorter.var0.__val_.m_mappingV.__begin_;
        if (v11)
        {
          v6->_undistorter.var0.__val_.m_mappingV.__end_ = v11;
          operator delete(v11);
          v6->_undistorter.var0.__val_.m_mappingV.__begin_ = 0;
          v6->_undistorter.var0.__val_.m_mappingV.__end_ = 0;
          v6->_undistorter.var0.__val_.m_mappingV.__end_cap_.__value_ = 0;
          v11 = (float *)__p[0];
        }
        *(_OWORD *)&v6->_undistorter.var0.__val_.m_mappingV.__begin_ = v16;
        v6->_undistorter.var0.__val_.m_mappingV.__end_cap_.__value_ = v17;
        long long v16 = 0uLL;
        v17 = 0;
        if (v11)
        {
          __p[1] = v11;
          operator delete(v11);
        }
      }
      else
      {
        *(_OWORD *)&v6->_undistorter.var0.__val_.m_mappingU.__begin_ = *(_OWORD *)__p;
        v6->_undistorter.var0.__val_.m_mappingU.__end_cap_.__value_ = v15;
        __p[1] = 0;
        v15 = 0;
        __p[0] = 0;
        *(_OWORD *)&v6->_undistorter.var0.__val_.m_mappingV.__begin_ = v16;
        v6->_undistorter.var0.__val_.m_mappingV.__end_cap_.__value_ = v17;
        v6->_undistorter.__engaged_ = 1;
      }
    }
  }
  return v6;
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_undistortedImageBufferPool);
  v3.receiver = self;
  v3.super_class = (Class)ARImageDistortionCorrectionTechnique;
  [(ARImageDistortionCorrectionTechnique *)&v3 dealloc];
}

- (id)processData:(id)a3
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  v164.receiver = self;
  v164.super_class = (Class)ARImageDistortionCorrectionTechnique;
  id v154 = a3;
  id v4 = -[ARTechnique processData:](&v164, sel_processData_);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_111;
  }
  id v5 = [v154 latestResizedUltraWideImageData];
  if (!v5)
  {
    v10 = [v154 originalImageData];
    v11 = [v10 cameraType];
    char v12 = [v11 isEqualToString:*MEMORY[0x1E4F15828]];

    if ((v12 & 1) == 0 || (id v5 = v154) == 0)
    {
      long long v13 = 0;
LABEL_12:
      id v14 = v154;

LABEL_39:
      v36 = v154;
      goto LABEL_112;
    }
  }
  v146 = v5;
  v6 = [v5 downScalingResults];
  BOOL v7 = [v6 count] == 0;

  if (v7)
  {
    long long v13 = v146;
    goto LABEL_12;
  }
  uint64_t v8 = [v146 rotationOfResultTensor];
  uint64_t v9 = v8;
  if (v8 > 89)
  {
    if (v8 == 90)
    {
      uint64_t v9 = -90;
    }
    else if (v8 == 180)
    {
      goto LABEL_15;
    }
  }
  else
  {
    if (v8 != -90)
    {
      if (v8) {
        goto LABEL_18;
      }
LABEL_15:
      p_imageSize = &self->_imageSize;
      p_CGFloat height = (CGSize *)&self->_imageSize.height;
      goto LABEL_19;
    }
    uint64_t v9 = 90;
  }
LABEL_18:
  p_CGFloat height = &self->_imageSize;
  p_imageSize = (CGSize *)&self->_imageSize.height;
LABEL_19:
  double width = p_height->width;
  double v18 = p_imageSize->width;
  long long v160 = 0u;
  long long v161 = 0u;
  long long v162 = 0u;
  long long v163 = 0u;
  v19 = [v146 downScalingResults];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v160 objects:v169 count:16];
  if (!v20)
  {

LABEL_38:
    id v35 = v154;

    goto LABEL_39;
  }
  v21 = 0;
  uint64_t v22 = *(void *)v161;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v161 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v160 + 1) + 8 * i);
      [v24 imageResolution];
      if (v26 == v18 && v25 == width)
      {
        id v28 = v24;

        v21 = v28;
      }
    }
    uint64_t v20 = [v19 countByEnumeratingWithState:&v160 objects:v169 count:16];
  }
  while (v20);

  if (!v21) {
    goto LABEL_38;
  }
  v29 = (void *)MEMORY[0x1E4F15828];
  if (!self->_computeUndistortionCoefficientsForEveryFrame && !self->_undistortionMappingsForRotations)
  {
    v158 = [v146 originalImageData];
    [v146 timestamp];
    v30 = [v158 cameraType];
    [v30 isEqualToString:*v29];
    v31 = [v158 calibrationData];
    [v31 isEqual:0];
    kdebug_trace();

    v32 = [v158 calibrationData];
    BOOL v33 = v32 == 0;

    if (v33)
    {
      [(ARImageDistortionCorrectionTechnique *)self buildUVMapFromHardcodedCalibrationParameters];
    }
    else
    {
      v34 = [v158 calibrationData];
      [(ARImageDistortionCorrectionTechnique *)self buildUVMapWithCameraCalibrationData:v34];
    }
    kdebug_trace();
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v21 pixelBuffer]);
  pixelBuffer = ARCreateCVPixelBufferFromPool(&self->_undistortedImageBufferPool, PixelFormatType, self, @"undistorted image", v18, width);
  [v146 timestamp];
  v38 = [v146 originalImageData];
  v39 = [v38 cameraType];
  [v39 isEqualToString:*v29];
  [v21 imageResolution];
  [v21 imageResolution];
  kdebug_trace();

  if (self->_computeUndistortionCoefficientsForEveryFrame)
  {
    v40 = [v146 originalImageData];
    id v41 = [v40 calibrationData];
    kdebug_trace();
    p_undistorter = &self->_undistorter;
    if (v41)
    {
      [v41 lensDistortionCenter];
      double v44 = v43;
      double v46 = v45;
      double v48 = *MEMORY[0x1E4F1DAD8];
      double v47 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v49 = _ARLogTechnique();
      BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
      if (v44 == v48 && v46 == v47)
      {
        if (v50)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B88A2000, v49, OS_LOG_TYPE_DEBUG, "lensDistortionCenter is set to CGPointZero, skipping creating UV map for distortion correction", buf, 2u);
        }

LABEL_109:
        CVPixelBufferRelease(pixelBuffer);
        pixelBuffer = CVPixelBufferRetain((CVPixelBufferRef)[v21 pixelBuffer]);
        goto LABEL_110;
      }
      if (v50)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B88A2000, v49, OS_LOG_TYPE_DEBUG, "Building distortion correction UV map from calibration data", buf, 2u);
      }

      unint64_t m_unrotatedImageWidth = p_undistorter->var0.__val_.m_unrotatedImageWidth;
      [v41 intrinsicMatrixReferenceDimensions];
      double v93 = v92;
      unint64_t m_unrotatedImageHeight = p_undistorter->var0.__val_.m_unrotatedImageHeight;
      [v41 intrinsicMatrixReferenceDimensions];
      double v96 = v95;
      kdebug_trace();
      id v97 = [v41 lensDistortionLookupTable];
      uint64_t v98 = [v97 bytes];
      unint64_t v99 = [v97 length];
      unint64_t v100 = p_undistorter->var0.__val_.m_unrotatedImageWidth;
      if (p_undistorter->var0.__val_.m_unrotatedImageWidth)
      {
        uint64_t v101 = 0;
        float v102 = v93;
        float v103 = (float)m_unrotatedImageWidth / v102;
        float v104 = v96;
        float v105 = v44;
        v107.f32[0] = v103 * v105;
        float v106 = v46;
        v107.f32[1] = (float)((float)m_unrotatedImageHeight / v104) * v106;
        float v108 = (float)v100;
        unint64_t v109 = p_undistorter->var0.__val_.m_unrotatedImageHeight;
        float v110 = (float)v109;
        v111.f32[0] = (float)v100;
        v111.f32[1] = (float)v109;
        uint64_t v112 = (v99 >> 2) - 1;
        uint64_t v113 = 4 * v109;
        float32x2_t v114 = vmaxnm_f32(v107, vsub_f32(v111, v107));
        float32x2_t v115 = vmul_f32(v114, v114);
        while (!v109)
        {
          uint64_t v121 = v101 + 1;
LABEL_97:
          uint64_t v101 = v121;
          if (v121 == v100) {
            goto LABEL_98;
          }
        }
        uint64_t v116 = 0;
        float v117 = (float)v101;
        uint64_t v118 = ~v101;
        unint64_t v119 = v100 + ~v101;
        unint64_t v120 = v119 * v109;
        uint64_t v121 = v101 + 1;
        uint64_t v122 = (v101 + 1) * v109;
        uint64_t v123 = v113 * (v101 + 1) - 4;
        uint64_t v124 = v109 * v100 - 1 - v101;
        uint64_t v125 = v113 * v119;
        float v126 = sqrtf(vaddv_f32(v115));
        while (1)
        {
          v127.f32[0] = v117;
          v127.f32[1] = (float)v116;
          float32x2_t v128 = vsub_f32(v127, v107);
          float v129 = sqrtf(vaddv_f32(vmul_f32(v128, v128)));
          if (v129 >= v126)
          {
            float v131 = *(float *)(v98 + 4 * v112);
          }
          else
          {
            float v130 = (float)(v129 * (float)(unint64_t)v112) / v126;
            float v131 = (float)((float)(v130 - (float)(int)v130) * *(float *)(v98 + 4 * (int)v130 + 4))
                 + (float)((float)(1.0 - (float)(v130 - (float)(int)v130)) * *(float *)(v98 + 4 * (int)v130));
          }
          float32x2_t v132 = vadd_f32(v107, vmla_n_f32(v128, v128, v131));
          if (v9 > 89)
          {
            if (v9 == 90)
            {
              uint64_t v133 = v122 + ~v116;
              *(float *)((char *)p_undistorter->var0.__val_.m_mappingU.__begin_ + v123) = v110 - v132.f32[1];
              goto LABEL_93;
            }
            if (v9 == 180)
            {
              uint64_t v133 = v118 + (v109 - v116) * v100;
              p_undistorter->var0.__val_.m_mappingU.__begin_[v124] = v108 - v132.f32[0];
              v132.f32[0] = v110 - v132.f32[1];
              goto LABEL_93;
            }
          }
          else
          {
            if (v9 == -90)
            {
              uint64_t v133 = v116 + v120;
              *(_DWORD *)((char *)&p_undistorter->var0.__val_.m_mappingU.__begin_[v116] + v125) = v132.i32[1];
              v132.f32[0] = v108 - v132.f32[0];
              goto LABEL_93;
            }
            if (!v9)
            {
              LODWORD(p_undistorter->var0.__val_.m_mappingU.__begin_[v101]) = v132.i32[0];
              v132.i32[0] = v132.i32[1];
              uint64_t v133 = v101;
LABEL_93:
              LODWORD(p_undistorter->var0.__val_.m_mappingV.__begin_[v133]) = v132.i32[0];
            }
          }
          ++v116;
          v101 += v100;
          v123 -= 4;
          v124 -= v100;
          if (v109 == v116) {
            goto LABEL_97;
          }
        }
      }
LABEL_98:

LABEL_99:
      kdebug_trace();

      v134 = (__CVBuffer *)[v21 pixelBuffer];
      CVPixelBufferLockBaseAddress(v134, 1uLL);
      *(_OWORD *)buf = 0u;
      long long v168 = 0u;
      ARWrapCVPixelBufferVImage(v134, (void **)buf);
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      memset(v166, 0, sizeof(v166));
      ARWrapCVPixelBufferVImage(pixelBuffer, (void **)v166);
      kdebug_trace();
      uint64_t v165 = 0;
      uint64_t v135 = vImageMapping_CreateFromMap_Image8U();
      kdebug_trace();
      if (v135)
      {
        kdebug_trace();
        uint64_t v165 = vImageRemap_Image8U();
        if (v165)
        {
          v136 = _ARLogTechnique();
          if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v170 = 134217984;
            uint64_t v171 = v165;
            _os_log_impl(&dword_1B88A2000, v136, OS_LOG_TYPE_ERROR, "Image undistortion failed with error code : %ld", v170, 0xCu);
          }
        }
        kdebug_trace();
        vImageMapping_Release();
      }
      else
      {
        v137 = _ARLogTechnique();
        if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v170 = 134217984;
          uint64_t v171 = v165;
          _os_log_impl(&dword_1B88A2000, v137, OS_LOG_TYPE_ERROR, "Image mapping creation failed with error code : %ld", v170, 0xCu);
        }
      }
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      CVPixelBufferUnlockBaseAddress(v134, 1uLL);
      BOOL v138 = v165 == 0;

      if (v138) {
        goto LABEL_110;
      }
      goto LABEL_109;
    }
    v51 = _ARLogTechnique();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B88A2000, v51, OS_LOG_TYPE_DEBUG, "Building distortion correction UV map from hardcoded parameters", buf, 2u);
    }

    double v52 = ARFixedIntrinsicsForBackUltraWideCamera640x480();
    float v55 = ARAdjustIntrinsicsForViewportSize(*(float *)&v52, v53, v54, 640.0, 480.0, (double)p_undistorter->var0.__val_.m_unrotatedImageWidth, (double)p_undistorter->var0.__val_.m_unrotatedImageHeight);
    float v156 = v56;
    float v157 = v55;
    uint64_t v159 = v57;
    *(double *)v58.i64 = ARRadialDistortionForUltraWideCamera();
    unint64_t v59 = p_undistorter->var0.__val_.m_unrotatedImageWidth;
    if (!p_undistorter->var0.__val_.m_unrotatedImageWidth) {
      goto LABEL_99;
    }
    v141 = v40;
    uint64_t v60 = 0;
    float v61 = (float)v59;
    unint64_t v62 = p_undistorter->var0.__val_.m_unrotatedImageHeight;
    float v63 = (float)v62;
    _S11 = v156;
    float64x2_t v151 = vcvtq_f64_f32(*(float32x2_t *)v58.f32);
    float64x2_t v152 = vcvt_hight_f64_f32(v58);
    uint64_t v143 = 4 * v62;
    __asm { FMOV            V0.4S, #1.0 }
    float32x4_t v142 = _Q0;
    while (!v62)
    {
      uint64_t v90 = v60 + 1;
LABEL_73:
      uint64_t v60 = v90;
      if (v90 == v59)
      {
        id v41 = 0;
        v40 = v141;
        goto LABEL_99;
      }
    }
    uint64_t v69 = 0;
    uint64_t v150 = ~v60;
    unint64_t v70 = v59 + ~v60;
    uint64_t v148 = (v60 + 1) * v62;
    unint64_t v149 = v70 * v62;
    float32x4_t v71 = v142;
    v71.f32[0] = (float)((float)v60 - *(float *)&v159) / v157;
    uint64_t v144 = v60 + 1;
    uint64_t v72 = v143 * (v60 + 1) - 4;
    uint64_t v73 = v62 * v59 - 1 - v60;
    uint64_t v147 = v143 * v70;
    float32x4_t v153 = v71;
    while (1)
    {
      float32x4_t v74 = v71;
      v74.f32[1] = (float)((float)v69 - *((float *)&v159 + 1)) / _S11;
      *(void *)&long double v75 = *(_OWORD *)&vcvt_hight_f64_f32(v74);
      float64x2_t v76 = vcvtq_f64_f32(*(float32x2_t *)v74.f32);
      double v77 = vmlad_n_f64(vmuld_lane_f64(v76.f64[1], v76, 1), v76.f64[0], v76.f64[0]);
      if (v77 >= 0.00000001)
      {
        long double v79 = sqrt(v77);
        float64x2_t v155 = v76;
        long double v80 = atan2(v79, v75);
        long double v81 = v80 * (v80 * v80);
        long double v82 = v80 * v80 * v81;
        long double v83 = v80 * v80 * v82;
        long double v84 = v80 * v80 * v83;
        long double v85 = v80 + v151.f64[0] * v81 + v151.f64[1] * v82;
        float32x4_t v71 = v153;
        float64x2_t v76 = v155;
        *(float *)&long double v85 = v85 + v152.f64[0] * v83 + v152.f64[1] * v84;
        double v78 = *(float *)&v85 / v79;
      }
      else
      {
        if (v75 == 0.0) {
          __assert_rtn("radialDistortedPoint", "ARImageDistortionCorrectionTechnique.mm", 233, "success");
        }
        double v78 = 1.0 / v75;
      }
      *(void *)&v76.f64[1] = vextq_s8((int8x16_t)v76, (int8x16_t)v76, 8uLL).u64[0];
      _D2 = vcvt_f32_f64(vmulq_n_f64(v76, v78));
      float v87 = vmlas_n_f32(*(float *)&v159, v157, _D2.f32[0]);
      __asm { FMLA            S0, S11, V2.S[1] }
      if (v9 > 89)
      {
        if (v9 == 90)
        {
          uint64_t v89 = v148 + ~v69;
          *(float *)((char *)p_undistorter->var0.__val_.m_mappingU.__begin_ + v72) = v63 - _S0;
          _S0 = v87;
          goto LABEL_69;
        }
        if (v9 == 180)
        {
          uint64_t v89 = v150 + (v62 - v69) * v59;
          p_undistorter->var0.__val_.m_mappingU.__begin_[v73] = v61 - v87;
          _S0 = v63 - _S0;
          goto LABEL_69;
        }
      }
      else
      {
        if (v9 == -90)
        {
          uint64_t v89 = v69 + v149;
          *(float *)((char *)&p_undistorter->var0.__val_.m_mappingU.__begin_[v69] + v147) = _S0;
          _S0 = v61 - v87;
          goto LABEL_69;
        }
        if (!v9)
        {
          p_undistorter->var0.__val_.m_mappingU.__begin_[v60] = v87;
          uint64_t v89 = v60;
LABEL_69:
          p_undistorter->var0.__val_.m_mappingV.__begin_[v89] = _S0;
        }
      }
      ++v69;
      v60 += v59;
      v72 -= 4;
      v73 -= v59;
      if (v62 == v69)
      {
        uint64_t v90 = v144;
        goto LABEL_73;
      }
    }
  }
  -[ARImageDistortionCorrectionTechnique undistortImage:toTargetImage:imageRotationAngle:](self, "undistortImage:toTargetImage:imageRotationAngle:", [v21 pixelBuffer], pixelBuffer, v9);
LABEL_110:
  [v21 setUndistortedPixelBuffer:pixelBuffer];
  [v146 timestamp];
  CVPixelBufferGetWidth(pixelBuffer);
  CVPixelBufferGetHeight(pixelBuffer);
  kdebug_trace();
  CVPixelBufferRelease(pixelBuffer);

LABEL_111:
  v36 = v154;
  id v139 = v154;
LABEL_112:

  return v154;
}

- (void)buildUVMapWithDistortedPixelProviderBlock:(id)a3
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v4 = (double (**)(void, double, double))a3;
  p_imageSize = &self->_imageSize;
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  uint64_t v8 = -[ARUndistortionMapping initWithImageSize:]([ARUndistortionMapping alloc], "initWithImageSize:", width, height);
  uint64_t v9 = -[ARUndistortionMapping initWithImageSize:]([ARUndistortionMapping alloc], "initWithImageSize:", height, width);
  v10 = -[ARUndistortionMapping initWithImageSize:]([ARUndistortionMapping alloc], "initWithImageSize:", self->_imageSize.width, self->_imageSize.height);
  v32 = self;
  v11 = -[ARUndistortionMapping initWithImageSize:]([ARUndistortionMapping alloc], "initWithImageSize:", height, width);
  double v12 = p_imageSize->width;
  if (p_imageSize->width > 0.0)
  {
    unsigned int v13 = 0;
    double v14 = width + -1.0;
    double v15 = p_imageSize->height;
    double v16 = 0.0;
    do
    {
      if (v15 > 0.0)
      {
        double v17 = 0.0;
        unsigned int v18 = 1;
        do
        {
          v19 = (void *)MEMORY[0x1BA9C6160]();
          double v20 = v4[2](v4, v16, v17);
          double v21 = p_imageSize->width;
          double v22 = p_imageSize->height;
          unsigned int v23 = (v16 + v17 * p_imageSize->width);
          float v24 = v20;
          v8->_mappingU.__begin_[v23] = v24;
          unsigned int v25 = (height + v16 * height + -1.0 - v17);
          float v27 = v26;
          v8->_mappingV.__begin_[v23] = v27;
          *(float *)&double v26 = v22 - v26;
          v9->_mappingU.__begin_[v25] = *(float *)&v26;
          v9->_mappingV.__begin_[v25] = v24;
          unsigned int v28 = (v21 + (v22 + -1.0 - v17) * v21 + -1.0 - v16);
          *(float *)&double v20 = v21 - v20;
          v10->_mappingU.__begin_[v28] = *(float *)&v20;
          v10->_mappingV.__begin_[v28] = *(float *)&v26;
          unsigned int v29 = (v17 + (v14 - v16) * height);
          v11->_mappingU.__begin_[v29] = v27;
          v11->_mappingV.__begin_[v29] = *(float *)&v20;
          double v17 = (double)v18;
          double v15 = p_imageSize->height;
          ++v18;
        }
        while (v15 > v17);
        double v12 = p_imageSize->width;
      }
      double v16 = (double)++v13;
    }
    while (v12 > (double)v13);
  }
  v34[0] = &unk_1F125AFB8;
  v34[1] = &unk_1F125AFD0;
  v35[0] = v8;
  v35[1] = v9;
  v34[2] = &unk_1F125AFE8;
  v34[3] = &unk_1F125B000;
  v35[2] = v10;
  v35[3] = v11;
  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v35, v34, 4, v12, v32);
  v31 = *(void **)(v33 + 64);
  *(void *)(v33 + 64) = v30;
}

- (void)buildUVMapWithCameraCalibrationData:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 lensDistortionCenter];
  double v6 = v5;
  double v8 = v7;
  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v11 = _ARLogTechnique();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v6 == v9 && v8 == v10)
  {
    if (v12)
    {
      double v26 = (objc_class *)objc_opt_class();
      float v27 = NSStringFromClass(v26);
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v27;
      __int16 v34 = 2048;
      id v35 = self;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: lensDistortionCenter is set to CGPointZero, skipping creating UV map for distortion correction", buf, 0x16u);
    }
  }
  else
  {
    if (v12)
    {
      double v14 = (objc_class *)objc_opt_class();
      double v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v15;
      __int16 v34 = 2048;
      id v35 = self;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Building distortion correction UV map from calibration data", buf, 0x16u);
    }
    double width = self->_imageSize.width;
    [v4 intrinsicMatrixReferenceDimensions];
    double v18 = v17;
    double height = self->_imageSize.height;
    [v4 intrinsicMatrixReferenceDimensions];
    double v21 = v20;
    [v4 lensDistortionCenter];
    double v23 = v22;
    [v4 lensDistortionCenter];
    double v25 = height / v21 * v24;
    kdebug_trace();
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __76__ARImageDistortionCorrectionTechnique_buildUVMapWithCameraCalibrationData___block_invoke;
    v28[3] = &unk_1E6186ED8;
    v28[4] = self;
    id v29 = v4;
    double v30 = width / v18 * v23;
    double v31 = v25;
    [(ARImageDistortionCorrectionTechnique *)self buildUVMapWithDistortedPixelProviderBlock:v28];
  }
}

double __76__ARImageDistortionCorrectionTechnique_buildUVMapWithCameraCalibrationData___block_invoke(uint64_t a1, double a2, double a3)
{
  double v6 = *(void **)(a1 + 32);
  double v7 = [*(id *)(a1 + 40) lensDistortionLookupTable];
  objc_msgSend(v6, "lensDistortionPointForPoint:lookupTable:distortionOpticalCenter:imageSize:", v7, a2, a3, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(*(void *)(a1 + 32) + 152), *(double *)(*(void *)(a1 + 32) + 160));
  double v9 = v8;

  return v9;
}

- (void)buildUVMapFromHardcodedCalibrationParameters
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  objc_super v3 = _ARLogTechnique();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (objc_class *)objc_opt_class();
    double v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    float v27 = v5;
    __int16 v28 = 2048;
    id v29 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Building distortion correction UV map from hardcoded parameters", buf, 0x16u);
  }
  double v6 = ARFixedIntrinsicsForBackUltraWideCamera640x480();
  *(float *)&long long v9 = ARAdjustIntrinsicsForViewportSize(*(float *)&v6, v7, v8, 640.0, 480.0, self->_imageSize.width, self->_imageSize.height);
  long long v13 = v9;
  long long v14 = v10;
  long long v15 = v11;
  *(double *)&long long v12 = ARRadialDistortionForUltraWideCamera();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__ARImageDistortionCorrectionTechnique_buildUVMapFromHardcodedCalibrationParameters__block_invoke;
  v16[3] = &__block_descriptor_96_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
  int v17 = DWORD2(v13);
  v16[4] = v13;
  int v18 = 0;
  int v20 = DWORD2(v14);
  uint64_t v19 = v14;
  int v21 = 0;
  int v23 = DWORD2(v15);
  uint64_t v22 = v15;
  int v24 = 0;
  long long v25 = v12;
  [(ARImageDistortionCorrectionTechnique *)self buildUVMapWithDistortedPixelProviderBlock:v16];
}

double __84__ARImageDistortionCorrectionTechnique_buildUVMapFromHardcodedCalibrationParameters__block_invoke(uint64_t a1, double a2, double a3)
{
  _Q3 = *(_OWORD *)(a1 + 64);
  float v4 = *(float *)(a1 + 32);
  double v5 = (float)((float)((float)a2 - *(float *)&_Q3) / v4);
  double v6 = (float)((float)((float)a3 - COERCE_FLOAT(HIDWORD(*(void *)(a1 + 64)))) / *(float *)(a1 + 52));
  double v7 = v6 * v6 + v5 * v5;
  double v8 = 1.0;
  if (v7 >= 0.00000001)
  {
    float32x4_t v9 = *(float32x4_t *)(a1 + 80);
    float64x2_t v22 = vcvtq_f64_f32(*(float32x2_t *)v9.f32);
    float64x2_t v23 = vcvt_hight_f64_f32(v9);
    long double v10 = sqrt(v7);
    long long v24 = *(_OWORD *)(a1 + 64);
    long double v11 = atan2(v10, 1.0);
    *(double *)&_Q3 = v11 * v11 * (v11 * (v11 * v11));
    _D1 = v11 * v11 * (v11 * v11 * *(double *)&_Q3);
    _V5.D[1] = v22.f64[1];
    __asm { FMLA            D0, D3, V5.D[1] }
    _V2.D[1] = v23.f64[1];
    LODWORD(_Q3) = v24;
    __asm { FMLA            D0, D1, V2.D[1] }
    *(float *)&_D0 = _D0;
    double v8 = *(float *)&_D0 / v10;
  }
  return *(float *)&_Q3 + v4 * (v8 * v5);
}

- (void)undistortImage:(__CVBuffer *)a3 toTargetImage:(__CVBuffer *)a4 imageRotationAngle:(int64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  CVPixelBufferLockBaseAddress(a3, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  ARWrapCVPixelBufferVImage(a3, (void **)&v18);
  CVPixelBufferLockBaseAddress(a4, 0);
  memset(v17, 0, sizeof(v17));
  ARWrapCVPixelBufferVImage(a4, (void **)v17);
  undistortionMappingsForRotations = self->_undistortionMappingsForRotations;
  long double v10 = [NSNumber numberWithInteger:a5];
  long double v11 = [(NSDictionary *)undistortionMappingsForRotations objectForKeyedSubscript:v10];

  v16[0] = v18;
  v16[1] = v19;
  [v11 createVImageMappingIfNeededForImage:v16];
  kdebug_trace();
  uint64_t v12 = vImageRemap_Image8U();
  if (v12)
  {
    long long v13 = _ARLogTechnique();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      long long v14 = (objc_class *)objc_opt_class();
      long long v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543874;
      int v21 = v15;
      __int16 v22 = 2048;
      float64x2_t v23 = self;
      __int16 v24 = 2048;
      uint64_t v25 = v12;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Image undistortion failed with error code : %ld", buf, 0x20u);
    }
  }
  kdebug_trace();
  CVPixelBufferUnlockBaseAddress(a3, 0);
  CVPixelBufferUnlockBaseAddress(a4, 0);
}

- (CGPoint)lensDistortionPointForPoint:(CGPoint)a3 lookupTable:(id)a4 distortionOpticalCenter:(CGPoint)a5 imageSize:(CGSize)a6
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  double x = a5.x;
  double y = a5.y;
  double v6 = a3.y;
  double v7 = a3.x;
  id v8 = a4;
  uint64_t v9 = [v8 bytes];
  unint64_t v10 = [v8 length];
  v11.f64[0] = width;
  v11.f64[1] = height;
  v12.f64[0] = x;
  v12.f64[1] = y;
  float64x2_t v13 = vsubq_f64(v11, v12);
  *(float32x2_t *)&v12.f64[0] = vcvt_f32_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v12), (int8x16_t)v13, (int8x16_t)v12));
  float v14 = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)&v12.f64[0], *(float32x2_t *)&v12.f64[0])));
  float v15 = v7 - x;
  float v16 = v6 - y;
  float v17 = sqrtf(vaddv_f32(vmul_f32((float32x2_t)__PAIR64__(LODWORD(v16), LODWORD(v15)), (float32x2_t)__PAIR64__(LODWORD(v16), LODWORD(v15)))));
  uint64_t v18 = (v10 >> 2) - 1;
  if (v17 >= v14)
  {
    float v20 = *(float *)(v9 + 4 * v18);
  }
  else
  {
    float v19 = (float)(v17 * (float)(unint64_t)v18) / v14;
    float v20 = (float)((float)(v19 - (float)(int)v19) * *(float *)(v9 + 4 * (int)v19 + 4))
        + (float)((float)(1.0 - (float)(v19 - (float)(int)v19)) * *(float *)(v9 + 4 * (int)v19));
  }
  double v21 = x + (float)(v15 + (float)(v20 * v15));
  double v22 = y + (float)(v16 + (float)(v20 * v16));

  double v23 = v21;
  double v24 = v22;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (void).cxx_destruct
{
  p_undistorter = &self->_undistorter;
  if (self->_undistorter.__engaged_)
  {
    begin = self->_undistorter.var0.__val_.m_mappingV.__begin_;
    if (begin)
    {
      p_undistorter->var0.__val_.m_mappingV.__end_ = begin;
      operator delete(begin);
    }
    double v5 = p_undistorter->var0.__val_.m_mappingU.__begin_;
    if (v5)
    {
      p_undistorter->var0.__val_.m_mappingU.__end_ = v5;
      operator delete(v5);
    }
  }
  objc_storeStrong((id *)&self->_undistortionMappingsForRotations, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 80) = 0;
  *((unsigned char *)self + 144) = 0;
  return self;
}

@end