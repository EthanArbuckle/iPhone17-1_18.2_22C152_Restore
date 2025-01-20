@interface ABPKImagePreProcessingParams
+ (double)convert2DPoint:(uint64_t)a3 toInputSpaceWithParams:(void *)a4;
- (ABPKCropParams)cropParams;
- (ABPKDirectScalingParams)scalingParams;
- (ABPKImagePreProcessingParams)initWithType:(int)a3 inputResolution:(CGSize)a4 outputResolution:(CGSize)a5;
- (ABPKPaddingParams)paddingParams;
- (CGSize)inputResolution;
- (CGSize)outputResolution;
- (int)type;
- (void)printData;
@end

@implementation ABPKImagePreProcessingParams

- (ABPKImagePreProcessingParams)initWithType:(int)a3 inputResolution:(CGSize)a4 outputResolution:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  double v7 = a4.height;
  double v8 = a4.width;
  v16.receiver = self;
  v16.super_class = (Class)ABPKImagePreProcessingParams;
  v10 = [(ABPKImagePreProcessingParams *)&v16 init];
  if (v10)
  {
    if (a3)
    {
      if (a3 == 1)
      {
        v14 = -[ABPKDirectScalingParams initWithInputResolution:andOutputResolution:]([ABPKDirectScalingParams alloc], "initWithInputResolution:andOutputResolution:", v8, v7, width, height);
        scalingParams = v10->_scalingParams;
        v10->_scalingParams = v14;
      }
      else
      {
        if (a3 != 2)
        {
LABEL_9:
          v10->_type = a3;
          v10->_inputResolution.double width = v8;
          v10->_inputResolution.double height = v7;
          v10->_outputResolution.double width = width;
          v10->_outputResolution.double height = height;
          return v10;
        }
        v11 = -[ABPKPaddingParams initWithInputResolution:andOutputResolution:]([ABPKPaddingParams alloc], "initWithInputResolution:andOutputResolution:", v8, v7, width, height);
        scalingParams = v10->_paddingParams;
        v10->_paddingParams = v11;
      }
    }
    else
    {
      v13 = -[ABPKCropParams initWithInputResolution:andOutputResolution:]([ABPKCropParams alloc], "initWithInputResolution:andOutputResolution:", v8, v7, width, height);
      scalingParams = v10->_cropParams;
      v10->_cropParams = v13;
    }

    goto LABEL_9;
  }
  return v10;
}

- (void)printData
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    CGFloat width = self->_inputResolution.width;
    CGFloat height = self->_inputResolution.height;
    int v25 = 134218240;
    double v26 = width;
    __int16 v27 = 2048;
    CGFloat v28 = height;
    _os_log_impl(&dword_21B7C6000, v3, OS_LOG_TYPE_DEBUG, " Input Resolution: (%f,%f) ", (uint8_t *)&v25, 0x16u);
  }

  v6 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CGFloat v7 = self->_outputResolution.width;
    CGFloat v8 = self->_outputResolution.height;
    int v25 = 134218240;
    double v26 = v7;
    __int16 v27 = 2048;
    CGFloat v28 = v8;
    _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_DEBUG, " Output Resolution: (%f,%f) ", (uint8_t *)&v25, 0x16u);
  }

  int type = self->_type;
  if (!type)
  {
    v20 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_28;
    }
    LOWORD(v25) = 0;
    v22 = "  ";
LABEL_26:
    v23 = v20;
    uint32_t v24 = 2;
    goto LABEL_27;
  }
  if (type == 1)
  {
    v20 = __ABPKLogSharedInstance();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_28;
    }
    LOWORD(v25) = 0;
    v22 = "  ";
    goto LABEL_26;
  }
  if (type != 2) {
    return;
  }
  v10 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_21B7C6000, v10, OS_LOG_TYPE_DEBUG, " Type: ScalingPadding ", (uint8_t *)&v25, 2u);
  }

  v11 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v25) = 0;
    _os_log_impl(&dword_21B7C6000, v11, OS_LOG_TYPE_DEBUG, " Padding Parameters: ", (uint8_t *)&v25, 2u);
  }

  v12 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    [(ABPKPaddingParams *)self->_paddingParams scale];
    int v25 = 134217984;
    double v26 = v13;
    _os_log_impl(&dword_21B7C6000, v12, OS_LOG_TYPE_DEBUG, " /t scale:        %f ", (uint8_t *)&v25, 0xCu);
  }

  v14 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v15 = [(ABPKPaddingParams *)self->_paddingParams height];
    int v25 = 67109120;
    LODWORD(v26) = v15;
    _os_log_impl(&dword_21B7C6000, v14, OS_LOG_TYPE_DEBUG, " /t height:       %u ", (uint8_t *)&v25, 8u);
  }

  objc_super v16 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v17 = [(ABPKPaddingParams *)self->_paddingParams width];
    int v25 = 67109120;
    LODWORD(v26) = v17;
    _os_log_impl(&dword_21B7C6000, v16, OS_LOG_TYPE_DEBUG, " /t width:        %u ", (uint8_t *)&v25, 8u);
  }

  v18 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v19 = [(ABPKPaddingParams *)self->_paddingParams offsetHeight];
    int v25 = 67109120;
    LODWORD(v26) = v19;
    _os_log_impl(&dword_21B7C6000, v18, OS_LOG_TYPE_DEBUG, " /t offsetHeight: %u ", (uint8_t *)&v25, 8u);
  }

  v20 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    unsigned int v21 = [(ABPKPaddingParams *)self->_paddingParams offsetWidth];
    int v25 = 67109120;
    LODWORD(v26) = v21;
    v22 = " /t offsetWidth:  %u ";
    v23 = v20;
    uint32_t v24 = 8;
LABEL_27:
    _os_log_impl(&dword_21B7C6000, v23, OS_LOG_TYPE_DEBUG, v22, (uint8_t *)&v25, v24);
  }
LABEL_28:
}

+ (double)convert2DPoint:(uint64_t)a3 toInputSpaceWithParams:(void *)a4
{
  id v5 = a4;
  if ([v5 type] != 2)
  {
    if ([v5 type])
    {
      if ([v5 type] == 1)
      {
        v20 = [v5 scalingParams];

        if (v20)
        {
          unsigned int v21 = [v5 scalingParams];
          [v21 widthScale];
          unsigned int v37 = v22;

          v11 = [v5 scalingParams];
          [v11 heightScale];
          __asm { FMOV            V2.2D, #1.0 }
          _D9 = vcvt_f32_f64(vmulq_f64(vdivq_f64(_Q2, vcvtq_f64_f32((float32x2_t)__PAIR64__(v23, v37))), vcvtq_f64_f32(a1)));
          goto LABEL_12;
        }
        v34 = __ABPKLogSharedInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B7C6000, v34, OS_LOG_TYPE_ERROR, " Scaling Parameters not specified ", buf, 2u);
        }
      }
      int v25 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v39 = 0;
        double v26 = " Invalid Image Pre-Processing type specified ";
        __int16 v27 = v39;
        goto LABEL_20;
      }
    }
    else
    {
      CGFloat v28 = [v5 cropParams];

      if (v28)
      {
        uint64_t v29 = [v5 cropParams];
        double v30 = (float)[v29 width];
        [v5 outputResolution];
        *(float *)&double v31 = v30 / v31;
        float v38 = *(float *)&v31;

        v32 = [v5 cropParams];
        unsigned int v33 = [v32 offsetWidth];

        v11 = [v5 cropParams];
        _D9 = vmla_n_f32(vcvt_f32_u32((uint32x2_t)__PAIR64__([v11 offsetHeight], v33)), a1, v38);
        goto LABEL_12;
      }
      int v25 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        __int16 v41 = 0;
        double v26 = " Crop Parameters not specified ";
        __int16 v27 = (uint8_t *)&v41;
        goto LABEL_20;
      }
    }
LABEL_21:

    __asm { FMOV            V9.2S, #-1.0 }
    goto LABEL_22;
  }
  v6 = [v5 paddingParams];

  if (!v6)
  {
    int v25 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      __int16 v42 = 0;
      double v26 = " Padding Parameters not specified ";
      __int16 v27 = (uint8_t *)&v42;
LABEL_20:
      _os_log_impl(&dword_21B7C6000, v25, OS_LOG_TYPE_ERROR, v26, v27, 2u);
      goto LABEL_21;
    }
    goto LABEL_21;
  }
  CGFloat v7 = [v5 paddingParams];
  unsigned int v8 = [v7 offsetWidth];
  v9 = [v5 paddingParams];
  [v9 scale];
  unsigned int v36 = v10;

  v11 = [v5 paddingParams];
  LODWORD(v9) = [v11 offsetHeight];
  v12 = [v5 paddingParams];
  [v12 scale];
  __asm { FMOV            V2.2D, #1.0 }
  _D9 = vcvt_f32_f64(vmulq_f64(vdivq_f64(_Q2, vcvtq_f64_f32((float32x2_t)__PAIR64__(v13, v36))), vcvtq_f64_f32(vsub_f32(a1, vcvt_f32_u32((uint32x2_t)__PAIR64__(v9, v8))))));

LABEL_12:
LABEL_22:

  return *(double *)&_D9;
}

- (ABPKCropParams)cropParams
{
  return self->_cropParams;
}

- (ABPKPaddingParams)paddingParams
{
  return self->_paddingParams;
}

- (ABPKDirectScalingParams)scalingParams
{
  return self->_scalingParams;
}

- (int)type
{
  return self->_type;
}

- (CGSize)inputResolution
{
  double width = self->_inputResolution.width;
  double height = self->_inputResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGSize)outputResolution
{
  double width = self->_outputResolution.width;
  double height = self->_outputResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalingParams, 0);
  objc_storeStrong((id *)&self->_paddingParams, 0);
  objc_storeStrong((id *)&self->_cropParams, 0);
}

@end