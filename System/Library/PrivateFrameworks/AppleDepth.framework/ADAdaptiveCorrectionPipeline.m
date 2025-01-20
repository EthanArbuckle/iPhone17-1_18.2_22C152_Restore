@interface ADAdaptiveCorrectionPipeline
+ (CalModel)convertToInternalCalModel:(SEL)a3;
+ (double)convertExtrinsics:(int8x16_t)a3 toInternalFormat:(__n128)a4;
+ (double)meanFundamentalEpipolarErrorForCalModel:(const CalModel *)a3 xyPointsTele:(const double *)a4 xyPointsWide:(const double *)a5 numPoints:(int)a6;
+ (int64_t)approximateCorrectionWithPointsTele:(const double *)a3 xyPointsWide:(const double *)a4 numPoints:(int)a5 calModel:(id)a6;
+ (int64_t)computeVerticalBaselineTransform:(uint64_t)a3 extrinsicRefToAuxPrime:(uint64_t)a4 rotationRefToRefPrime:(uint64_t)a5 rotationAuxToAuxPrime:(void *)a6;
+ (int64_t)rotateCalModel:(int8x16_t)a3 extrinsicRefToAuxRotated:(__n128)a4 rotationRef:(float32x2_t)a5 rotationAux:(float32x2_t)a6 calRotated:(float32x2_t)a7;
+ (int64_t)rotateDistortionModel:(uint64_t)a3 rotation:(uint64_t)a4 distRotated:(uint64_t)a5;
+ (int64_t)transformPointsWithMatrix:(uint64_t)a3 numPoints:(uint64_t)a4 transformMatrix:(uint64_t)a5 xyPointsTransformed:(int)a6;
+ (void)convertCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 toDistortionModelTele:(DistortionModel *)a5 toDistortionModelWide:(DistortionModel *)a6 toCalModel:(CalModel *)a7;
+ (void)convertInternalExtrinsics:(double)a3[12] toMatrix:(id *)a4;
+ (void)fillDistortionModel:(DistortionModel *)a3 andUpdateCalModel:(CalModel *)a4 forCamera:(int)a5 fromCalib:(id)a6;
+ (void)updateADCalModel:(id)a3 fromInternalCalModel:(const CalModel *)a4;
+ (void)updateADCameraCalib:(id)a3 fromDistortionModel:(const DistortionModel *)a4 andCalModel:(const CalModel *)a5 forCamera:(int)a6;
+ (void)updateCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 withDistortionModelTele:(const DistortionModel *)a5 withDistortionModelWide:(const DistortionModel *)a6 withCalModel:(const CalModel *)a7;
- (ADAdaptiveCorrectionPipeline)initWithMaxNumPoints:(int)a3;
- (ADAdaptiveCorrectionPipeline)initWithMaxNumPoints:(int)a3 andParameters:(id)a4;
- (AdaptiveCorrectionConfig)getConfigFromPipelineParams;
- (AdaptiveCorrectionStatus)getStatus;
- (int)maxNumPoints;
- (int64_t)fullCorrectionWithCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 xyPointsTele:(const double *)a5 xyPointsWide:(const double *)a6 numPoints:(int)a7;
- (int64_t)fullCorrectionWithPointsTele:(const double *)a3 xyPointsWide:(const double *)a4 numPoints:(int)a5 calModel:(id)a6;
- (int64_t)fullTemporalCorrectionWithCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 xyPointsTele:(const double *)a5 xyPointsWide:(const double *)a6 numPoints:(int)a7;
- (void)dealloc;
@end

@implementation ADAdaptiveCorrectionPipeline

- (void).cxx_destruct
{
}

- (int)maxNumPoints
{
  return self->_maxNumPoints;
}

- (int64_t)fullCorrectionWithPointsTele:(const double *)a3 xyPointsWide:(const double *)a4 numPoints:(int)a5 calModel:(id)a6
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v7 = a6;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  +[ADAdaptiveCorrectionPipeline convertToInternalCalModel:v7];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  [(ADAdaptiveCorrectionPipeline *)self getStatus];
  AdaptiveCorrection_fullCorrection();
  long long v24 = v15;
  long long v25 = v16;
  long long v26 = v17;
  long long v20 = v11;
  long long v21 = v12;
  long long v22 = v13;
  long long v23 = v14;
  long long v18 = v9;
  long long v19 = v10;
  +[ADAdaptiveCorrectionPipeline updateADCalModel:v7 fromInternalCalModel:&v18];

  return 0;
}

- (int64_t)fullCorrectionWithCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 xyPointsTele:(const double *)a5 xyPointsWide:(const double *)a6 numPoints:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  +[ADAdaptiveCorrectionPipeline convertCameraCalibrationTele:v12 cameraCalibrationWide:v13 toDistortionModelTele:v27 toDistortionModelWide:v26 toCalModel:v25];
  int64_t v22 = +[ADUtils ADReturnFromOSStatus:AdaptiveCorrection_fullCorrectionWithDistortion((uint64_t)self->_adc, (uint64_t)a5, (uint64_t)a6, a7, v27, v26, v25, v14, v15, v16, v17, v18, v19, v20, v21)];
  if (v22 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v24 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed full Correction With Distortion.", v24, 2u);
  }
  +[ADAdaptiveCorrectionPipeline updateCameraCalibrationTele:v12 cameraCalibrationWide:v13 withDistortionModelTele:v27 withDistortionModelWide:v26 withCalModel:v25];

  return v22;
}

- (int64_t)fullTemporalCorrectionWithCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 xyPointsTele:(const double *)a5 xyPointsWide:(const double *)a6 numPoints:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  +[ADAdaptiveCorrectionPipeline convertCameraCalibrationTele:v12 cameraCalibrationWide:v13 toDistortionModelTele:v27 toDistortionModelWide:v26 toCalModel:v25];
  int64_t v22 = +[ADUtils ADReturnFromOSStatus:AdaptiveCorrection_fullTemporalCorrectionWithDistortion((uint64_t)self->_adc, (uint64_t)a5, (uint64_t)a6, a7, v27, v26, v25, v14, v15, v16, v17, v18, v19, v20, v21)];
  if (v22)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v24 = 0;
      _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed full Temporal Correction With Distortion.", v24, 2u);
    }
  }
  else
  {
    +[ADAdaptiveCorrectionPipeline updateCameraCalibrationTele:v12 cameraCalibrationWide:v13 withDistortionModelTele:v27 withDistortionModelWide:v26 withCalModel:v25];
  }

  return v22;
}

- (AdaptiveCorrectionStatus)getStatus
{
  adc = self->_adc;
  bzero(retstr, 0x1E48uLL);
  if (adc)
  {
    return (AdaptiveCorrectionStatus *)memcpy(retstr, (char *)adc + 136, sizeof(AdaptiveCorrectionStatus));
  }
  return result;
}

- (void)dealloc
{
  AdaptiveCorrection_destroy((void **)self->_adc);
  v3.receiver = self;
  v3.super_class = (Class)ADAdaptiveCorrectionPipeline;
  [(ADAdaptiveCorrectionPipeline *)&v3 dealloc];
}

- (ADAdaptiveCorrectionPipeline)initWithMaxNumPoints:(int)a3 andParameters:(id)a4
{
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)ADAdaptiveCorrectionPipeline;
  v8 = [(ADAdaptiveCorrectionPipeline *)&v21 init];
  long long v9 = v8;
  if (v8)
  {
    if (a3 <= 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        double v16 = &_os_log_internal;
        double v17 = "maxNumPoints must be positive integer";
        goto LABEL_11;
      }
    }
    else
    {
      objc_storeStrong((id *)&v8->_pipelineParameters, a4);
      [(ADAdaptiveCorrectionPipeline *)v9 getConfigFromPipelineParams];
      long long v10 = v20[0];
      long long v11 = v20[1];
      long long v12 = v20[2];
      *(_OWORD *)&v9->_config.rangeOCyW = v20[3];
      *(_OWORD *)&v9->_config.rangeOCxT = v12;
      *(_OWORD *)&v9->_config.rangePFL_T = v11;
      *(_OWORD *)&v9->_config.epErrorLimitWidePix_FirstPass = v10;
      long long v13 = v20[4];
      long long v14 = v20[5];
      long long v15 = v20[6];
      *(_OWORD *)&v9->_config.spgEpsilon = v20[7];
      *(_OWORD *)&v9->_config.errorVal_BetweenIntermediate_ExtremeMacro = v15;
      *(_OWORD *)&v9->_config.errorVal_GreaterThanInf = v14;
      *(_OWORD *)&v9->_config.extremeMacroDistMM = v13;
      if (!AdaptiveCorrection_createWithConfig(a3, (long long *)&v9->_config, &v9->_adc))
      {
        int32x4_t v18 = v9;
        goto LABEL_8;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        double v16 = &_os_log_internal;
        double v17 = "Failed create Adaptive Correction with config";
LABEL_11:
        _os_log_error_impl(&dword_215F16000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)v20, 2u);
        int32x4_t v18 = 0;
        goto LABEL_8;
      }
    }
  }
  int32x4_t v18 = 0;
LABEL_8:

  return v18;
}

- (ADAdaptiveCorrectionPipeline)initWithMaxNumPoints:(int)a3
{
  return [(ADAdaptiveCorrectionPipeline *)self initWithMaxNumPoints:*(void *)&a3 andParameters:0];
}

- (AdaptiveCorrectionConfig)getConfigFromPipelineParams
{
  *(_OWORD *)&retstr->errorVal_BetweenIntermediate_ExtremeMacro = 0u;
  *(_OWORD *)&retstr->spgEpsilon = 0u;
  *(_OWORD *)&retstr->extremeMacroDistMM = 0u;
  *(_OWORD *)&retstr->errorVal_GreaterThanInf = 0u;
  *(_OWORD *)&retstr->rangeOCxT = 0u;
  *(_OWORD *)&retstr->rangeOCyW = 0u;
  *(_OWORD *)&retstr->epErrorLimitWidePix_FirstPass = 0u;
  *(_OWORD *)&retstr->rangePFL_T = 0u;
  result = (AdaptiveCorrectionConfig *)self->_pipelineParameters;
  if (result)
  {
    [(AdaptiveCorrectionConfig *)result epErrorLimitWidePix_FirstPass];
    retstr->epErrorLimitWidePix_FirstPass = v6;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters epErrorLimitWidePix_SecondPass];
    retstr->epErrorLimitWidePix_SecondPass = v7;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters rangePFL_T];
    retstr->rangePFL_T = v8;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters rangePFL_W];
    retstr->rangePFL_W = v9;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters rangeOCxT];
    retstr->rangeOCxT = v10;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters rangeOCxW];
    retstr->rangeOCxW = v11;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters rangeOCyW];
    retstr->rangeOCyW = v12;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters intermediateMacroDistMM];
    retstr->intermediateMacroDistMM = v13;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters extremeMacroDistMM];
    retstr->extremeMacroDistMM = v14;
    retstr->minPointsForAdjustment = [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters minPointsForAdjustment];
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters errorVal_GreaterThanInf];
    retstr->errorVal_GreaterThanInf = v15;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters errorVal_LessThanExtremeMacro];
    retstr->errorVal_LessThanExtremeMacro = v16;
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters errorVal_BetweenIntermediate_ExtremeMacro];
    retstr->errorVal_BetweenIntermediate_ExtremeMacro = v17;
    retstr->runAnalyticalPreconditioning = [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters runAnalyticalPreconditioning];
    [(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters spgEpsilon];
    retstr->spgEpsilon = v18;
    result = (AdaptiveCorrectionConfig *)[(ADAdaptiveCorrectionPipelineParameters *)self->_pipelineParameters temporalFilteringStrength];
    retstr->temporalFilteringStrength = v19;
  }
  return result;
}

+ (double)meanFundamentalEpipolarErrorForCalModel:(const CalModel *)a3 xyPointsTele:(const double *)a4 xyPointsWide:(const double *)a5 numPoints:(int)a6
{
  double v7 = 0.0;
  FundamentalEpipolarError_MeanVal((uint64_t)a4, (uint64_t)a5, a6, a3->var0, &v7);
  return v7;
}

+ (int64_t)transformPointsWithMatrix:(uint64_t)a3 numPoints:(uint64_t)a4 transformMatrix:(uint64_t)a5 xyPointsTransformed:(int)a6
{
  uint64_t v8 = 4294954516;
  if (a5 && a7)
  {
    if (a6 >= 1)
    {
      uint64_t v9 = a6;
      double v10 = (double *)(a5 + 8);
      do
      {
        float v11 = *(v10 - 1);
        float v12 = *v10;
        *a7++ = vcvtq_f64_f32(vmla_n_f32(vmul_n_f32(a1, v11), a2, v12));
        v10 += 2;
        --v9;
      }
      while (v9);
    }
    uint64_t v8 = 0;
  }
  int64_t v13 = +[ADUtils ADReturnFromOSStatus:v8];
  if (v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v15 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed transform points with matrix.", v15, 2u);
  }
  return v13;
}

+ (int64_t)rotateDistortionModel:(uint64_t)a3 rotation:(uint64_t)a4 distRotated:(uint64_t)a5
{
  uint64_t v7 = 4294954516;
  if (a5 && a6)
  {
    uint64_t v7 = 0;
    long long v8 = *(_OWORD *)(a5 + 16);
    *a6 = *(_OWORD *)a5;
    a6[1] = v8;
    long long v9 = *(_OWORD *)(a5 + 32);
    long long v10 = *(_OWORD *)(a5 + 48);
    long long v11 = *(_OWORD *)(a5 + 80);
    a6[4] = *(_OWORD *)(a5 + 64);
    a6[5] = v11;
    a6[2] = v9;
    a6[3] = v10;
    long long v12 = *(_OWORD *)(a5 + 96);
    long long v13 = *(_OWORD *)(a5 + 112);
    long long v14 = *(_OWORD *)(a5 + 144);
    a6[8] = *(_OWORD *)(a5 + 128);
    a6[9] = v14;
    a6[6] = v12;
    a6[7] = v13;
    *(float *)&long long v12 = *(double *)(a5 + 16);
    *(float *)&long long v13 = *(double *)(a5 + 24);
    a6[1] = vcvtq_f64_f32(vmla_n_f32(vmul_n_f32(a1, *(float *)&v12), a2, *(float *)&v13));
  }
  int64_t v15 = +[ADUtils ADReturnFromOSStatus:v7];
  if (v15 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v17 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed rotate distortion model.", v17, 2u);
  }
  return v15;
}

+ (int64_t)rotateCalModel:(int8x16_t)a3 extrinsicRefToAuxRotated:(__n128)a4 rotationRef:(float32x2_t)a5 rotationAux:(float32x2_t)a6 calRotated:(float32x2_t)a7
{
  uint64_t v13 = 4294954516;
  if (a11 && a12)
  {
    uint64_t v13 = 0;
    *(_OWORD *)a12 = *(_OWORD *)a11;
    long long v14 = *(_OWORD *)(a11 + 16);
    long long v15 = *(_OWORD *)(a11 + 32);
    long long v16 = *(_OWORD *)(a11 + 64);
    *(_OWORD *)(a12 + 48) = *(_OWORD *)(a11 + 48);
    *(_OWORD *)(a12 + 64) = v16;
    *(_OWORD *)(a12 + 16) = v14;
    *(_OWORD *)(a12 + 32) = v15;
    long long v17 = *(_OWORD *)(a11 + 80);
    long long v18 = *(_OWORD *)(a11 + 96);
    long long v19 = *(_OWORD *)(a11 + 128);
    *(_OWORD *)(a12 + 112) = *(_OWORD *)(a11 + 112);
    *(_OWORD *)(a12 + 128) = v19;
    *(_OWORD *)(a12 + 80) = v17;
    *(_OWORD *)(a12 + 96) = v18;
    *(float *)&long long v17 = *(double *)(a11 + 16);
    float v20 = *(double *)(a11 + 32);
    int32x2_t v21 = (int32x2_t)vmla_n_f32(vmul_n_f32(a5, *(float *)&v17), a6, v20);
    float v22 = *(double *)(a11 + 24);
    *(float *)&long long v17 = *(double *)(a11 + 40);
    int32x2_t v23 = (int32x2_t)vmla_n_f32(vmul_n_f32(a7, v22), a8, *(float *)&v17);
    *(float64x2_t *)(a12 + 16) = vcvtq_f64_f32((float32x2_t)vzip1_s32(v21, v23));
    *(float64x2_t *)(a12 + 32) = vcvtq_f64_f32((float32x2_t)vzip2_s32(v21, v23));
    *(double *)(a12 + 48) = *(float *)a1.i32;
    *(double *)(a12 + 56) = *(float *)a2.i32;
    *(double *)(a12 + 64) = *(float *)a3.i32;
    *(float64x2_t *)(a12 + 72) = vcvtq_f64_f32((float32x2_t)__PAIR64__(a1.u32[1], a4.n128_u32[0]));
    *(float64x2_t *)(a12 + 88) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a3.i8));
    *(float64x2_t *)(a12 + 104) = vcvtq_f64_f32((float32x2_t)vext_s8((int8x8_t)a4.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), 4uLL));
    *(float64x2_t *)(a12 + 120) = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a3, a3, 8uLL)));
    *(double *)(a12 + 136) = a4.n128_f32[2];
  }
  int64_t v24 = +[ADUtils ADReturnFromOSStatus:v13];
  if (v24 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v26 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed rotate calmodel.", v26, 2u);
  }
  return v24;
}

+ (int64_t)computeVerticalBaselineTransform:(uint64_t)a3 extrinsicRefToAuxPrime:(uint64_t)a4 rotationRefToRefPrime:(uint64_t)a5 rotationAuxToAuxPrime:(void *)a6
{
  int64_t v7 = +[ADUtils ADReturnFromOSStatus:AdaptiveCorrection_computeVerticalBaselineTransform(a5, a6, a7, a1, a2)];
  if (v7 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v9 = 0;
    _os_log_error_impl(&dword_215F16000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed compute vertical baseline transform.", v9, 2u);
  }
  return v7;
}

+ (int64_t)approximateCorrectionWithPointsTele:(const double *)a3 xyPointsWide:(const double *)a4 numPoints:(int)a5 calModel:(id)a6
{
  id v10 = a6;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  [a1 convertToInternalCalModel:v10];
  AdaptiveCorrection_approximateCorrection((uint64_t)a3, (uint64_t)a4, a5, (uint64_t)&v13, (uint64_t)v12);
  long long v19 = v12[6];
  long long v20 = v12[7];
  long long v21 = v12[8];
  long long v15 = v12[2];
  long long v16 = v12[3];
  long long v17 = v12[4];
  long long v18 = v12[5];
  long long v13 = v12[0];
  long long v14 = v12[1];
  [a1 updateADCalModel:v10 fromInternalCalModel:&v13];

  return 0;
}

+ (void)updateADCalModel:(id)a3 fromInternalCalModel:(const CalModel *)a4
{
  id v6 = a3;
  double v7 = a4->var0[0];
  *(float *)&double v7 = a4->var0[0];
  [v6 setFocalLengthPixRef:v7];
  double v8 = a4->var0[1];
  *(float *)&double v8 = v8;
  [v6 setFocalLengthPixAux:v8];
  objc_msgSend(v6, "setOpticalCenterRef:", a4->var1[0], a4->var2[0]);
  objc_msgSend(v6, "setOpticalCenterAux:", a4->var1[1], a4->var2[1]);
  [a1 convertInternalExtrinsics:a4->var3 toMatrix:&v9];
  objc_msgSend(v6, "setRefToAuxExtrinsic:", *(double *)&v9, *(double *)&v10, *(double *)&v11, *(double *)&v12);
}

+ (CalModel)convertToInternalCalModel:(SEL)a3
{
  id v13 = a4;
  [v13 focalLengthPixRef];
  retstr->var0[0] = v6;
  [v13 focalLengthPixAux];
  retstr->var0[1] = v7;
  [v13 opticalCenterRef];
  retstr->var1[0] = v8;
  [v13 opticalCenterRef];
  retstr->var2[0] = v9;
  [v13 opticalCenterAux];
  retstr->var1[1] = v10;
  [v13 opticalCenterAux];
  retstr->var2[1] = v11;
  [v13 refToAuxExtrinsic];
  objc_msgSend(a2, "convertExtrinsics:toInternalFormat:", retstr->var3);

  return result;
}

+ (void)updateCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 withDistortionModelTele:(const DistortionModel *)a5 withDistortionModelWide:(const DistortionModel *)a6 withCalModel:(const CalModel *)a7
{
  id v12 = a3;
  id v13 = a4;
  [a1 updateADCameraCalib:v12 fromDistortionModel:a5 andCalModel:a7 forCamera:0];
  [a1 updateADCameraCalib:v13 fromDistortionModel:a6 andCalModel:a7 forCamera:1];
  float32x4_t v28 = 0u;
  float32x4_t v29 = 0u;
  float32x4_t v26 = 0u;
  float32x4_t v27 = 0u;
  [a1 convertInternalExtrinsics:a7->var3 toMatrix:&v26];
  float32x4_t v22 = v26;
  float32x4_t v23 = v27;
  float32x4_t v24 = v28;
  float32x4_t v25 = v29;
  [v13 cameraToPlatformTransform];
  float32x4_t v15 = v24;
  float32x4_t v14 = v25;
  v14.i32[3] = 1.0;
  v15.i32[3] = 0;
  float32x4_t v17 = v22;
  float32x4_t v16 = v23;
  v16.i32[3] = 0;
  v17.i32[3] = 0;
  objc_msgSend(v12, "setCameraToPlatformTransform:", *(double *)vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, v18.f32[0]), v16, *(float32x2_t *)v18.f32, 1), v15, v18, 2), (float32x4_t)0, v14).i64, *(double *)vmlaq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, v19.f32[0]), v16, *(float32x2_t *)v19.f32, 1), v15, v19, 2), (float32x4_t)0, v14).i64, *(double *)vmlaq_f32(
                 vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, v20.f32[0]), v16, *(float32x2_t *)v20.f32, 1), v15, v20, 2), (float32x4_t)0, v14).i64, *(double *)vaddq_f32(v14, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, v21.f32[0]), v16, *(float32x2_t *)v21.f32, 1), v15, v21, 2)).i64);
}

+ (void)convertCameraCalibrationTele:(id)a3 cameraCalibrationWide:(id)a4 toDistortionModelTele:(DistortionModel *)a5 toDistortionModelWide:(DistortionModel *)a6 toCalModel:(CalModel *)a7
{
  id v13 = a3;
  id v12 = a4;
  [a1 fillDistortionModel:a5 andUpdateCalModel:a7 forCamera:0 fromCalib:v13];
  [a1 fillDistortionModel:a6 andUpdateCalModel:a7 forCamera:1 fromCalib:v12];
  [v13 getTransformationTo:v12];
  objc_msgSend(a1, "convertExtrinsics:toInternalFormat:", a7->var3);
}

+ (void)convertInternalExtrinsics:(double)a3[12] toMatrix:(id *)a4
{
  float v4 = *a3;
  *(float *)a4 = v4;
  float v5 = a3[1];
  *((float *)a4 + 4) = v5;
  float v6 = a3[2];
  *((float *)a4 + 8) = v6;
  float v7 = a3[3];
  *((float *)a4 + 12) = v7;
  float v8 = a3[4];
  *((float *)a4 + 1) = v8;
  float v9 = a3[5];
  *((float *)a4 + 5) = v9;
  float v10 = a3[6];
  *((float *)a4 + 9) = v10;
  float v11 = a3[7];
  *((float *)a4 + 13) = v11;
  float v12 = a3[8];
  *((float *)a4 + 2) = v12;
  float v13 = a3[9];
  *((float *)a4 + 6) = v13;
  float v14 = a3[10];
  *((float *)a4 + 10) = v14;
  float v15 = a3[11];
  *((float *)a4 + 14) = v15;
}

+ (double)convertExtrinsics:(int8x16_t)a3 toInternalFormat:(__n128)a4
{
  *(double *)a7 = *(float *)a1.i32;
  *(double *)(a7 + 8) = *(float *)a2.i32;
  *(double *)(a7 + 16) = *(float *)a3.i32;
  float32x2_t v7 = (float32x2_t)vext_s8((int8x8_t)a4.n128_u64[0], (int8x8_t)*(_OWORD *)&vextq_s8(a1, a1, 8uLL), 4uLL);
  a4.n128_u32[1] = a1.u32[1];
  *(float64x2_t *)(a7 + 24) = vcvtq_f64_f32((float32x2_t)a4.n128_u64[0]);
  *(float64x2_t *)(a7 + 40) = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)a2.i8, *(int32x2_t *)a3.i8));
  *(float64x2_t *)(a7 + 56) = vcvtq_f64_f32(v7);
  *(float64x2_t *)(a7 + 72) = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(a2, a2, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(a3, a3, 8uLL)));
  double result = a4.n128_f32[2];
  *(double *)(a7 + 88) = a4.n128_f32[2];
  return result;
}

+ (void)updateADCameraCalib:(id)a3 fromDistortionModel:(const DistortionModel *)a4 andCalModel:(const CalModel *)a5 forCamera:(int)a6
{
  id v20 = a3;
  [v20 intrinsicMatrix];
  float v9 = &a5->var0[a6];
  *(float *)&unsigned int v10 = *v9;
  double v12 = COERCE_DOUBLE(__PAIR64__(v10, v11));
  double v14 = COERCE_DOUBLE(__PAIR64__(v13, v10));
  *(float *)&unsigned int v15 = v9[2];
  *(float *)&unsigned int v16 = v9[4];
  objc_msgSend(v20, "setIntrinsicMatrix:", v14, v12, COERCE_DOUBLE(__PAIR64__(v16, v15)));
  float32x4_t v17 = [v20 distortionModel];
  double var0 = a4->var0;
  *(float *)&double var0 = a4->var0;
  [v17 setPixelSize:var0];
  double var1 = a4->var1;
  *(float *)&double var1 = var1;
  [v17 setFocalLength:var1];
  objc_msgSend(v17, "setDistortionCenter:", a4->var2, a4->var3);
}

+ (void)fillDistortionModel:(DistortionModel *)a3 andUpdateCalModel:(CalModel *)a4 forCamera:(int)a5 fromCalib:(id)a6
{
  id v18 = a6;
  [v18 intrinsicMatrix];
  a4->var0[a5] = v9;
  [v18 intrinsicMatrix];
  unsigned int v11 = &a4->var0[a5];
  v11[2] = v10;
  [v18 intrinsicMatrix];
  v11[4] = v12;
  unsigned int v13 = [v18 distortionModel];
  [v13 pixelSize];
  a3->double var0 = v14;
  [v13 focalLength];
  a3->double var1 = v15;
  [v13 distortionCenter];
  a3->var2 = v16;
  [v13 distortionCenter];
  a3->var3 = v17;
  a3->var4[0] = *(float *)[v13 distortionPolynomialsBase];
  a3->var5[0] = *(float *)[v13 distortionPolynomialsDynamic];
  a3->var4[1] = *(float *)([v13 distortionPolynomialsBase] + 4);
  a3->var5[1] = *(float *)([v13 distortionPolynomialsDynamic] + 4);
  a3->var4[2] = *(float *)([v13 distortionPolynomialsBase] + 8);
  a3->var5[2] = *(float *)([v13 distortionPolynomialsDynamic] + 8);
  a3->var4[3] = *(float *)([v13 distortionPolynomialsBase] + 12);
  a3->var5[3] = *(float *)([v13 distortionPolynomialsDynamic] + 12);
  a3->var4[4] = *(float *)([v13 distortionPolynomialsBase] + 16);
  a3->var5[4] = *(float *)([v13 distortionPolynomialsDynamic] + 16);
  a3->var4[5] = *(float *)([v13 distortionPolynomialsBase] + 20);
  a3->var5[5] = *(float *)([v13 distortionPolynomialsDynamic] + 20);
  a3->var4[6] = *(float *)([v13 distortionPolynomialsBase] + 24);
  a3->var5[6] = *(float *)([v13 distortionPolynomialsDynamic] + 24);
  a3->var4[7] = *(float *)([v13 distortionPolynomialsBase] + 28);
  a3->var5[7] = *(float *)([v13 distortionPolynomialsDynamic] + 28);
}

@end