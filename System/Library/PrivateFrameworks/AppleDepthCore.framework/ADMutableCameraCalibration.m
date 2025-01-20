@interface ADMutableCameraCalibration
+ (id)new;
- (ADMutableCameraCalibration)init;
- (BOOL)adjustForImageRotation:(int64_t)a3;
- (BOOL)scale:(CGSize)a3;
- (__n128)setCameraToPlatformTransform:(__n128)a3;
- (__n128)setIntrinsicMatrix:(__n128)a3;
- (void)centerCrop:(CGSize)a3;
- (void)crop:(CGRect)a3;
- (void)setDistortionModel:(id)a3;
- (void)setPixelSize:(float)a3;
- (void)setReferenceDimensions:(CGSize)a3;
@end

@implementation ADMutableCameraCalibration

- (void)crop:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  double y = a3.origin.y;
  [(ADCameraCalibration *)self referenceDimensions];
  double v7 = v6;
  double v9 = v8;
  -[ADMutableCameraCalibration setReferenceDimensions:](self, "setReferenceDimensions:", width, height);
  [(ADCameraCalibration *)self intrinsicMatrix];
  v11.f64[0] = x;
  v11.f64[1] = y;
  -[ADMutableCameraCalibration setIntrinsicMatrix:](self, "setIntrinsicMatrix:", v12, v13, COERCE_DOUBLE(vcvt_f32_f64(vsubq_f64(vcvtq_f64_f32(v10), v11))));
  if (objc_opt_respondsToSelector())
  {
    id v15 = [(ADCameraCalibration *)self distortionModel];
    objc_msgSend(v15, "crop:fromDimensions:", x, y, width, height, v7, v9);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      id v14 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF488] reason:@"distortion model does not implement a crop method" userInfo:0];
      objc_exception_throw(v14);
    }
    id v15 = [(ADCameraCalibration *)self distortionModel];
    objc_msgSend(v15, "crop:", x, y, width, height);
  }
}

- (void)setReferenceDimensions:(CGSize)a3
{
  self->super._referenceDimensions = a3;
}

- (BOOL)scale:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v24 = *MEMORY[0x263EF8340];
  double v7 = self->super._referenceDimensions.width;
  double v6 = self->super._referenceDimensions.height;
  double v8 = fabs(v6 * a3.width - v7 * a3.height);
  double v9 = a3.width * (v7 * 0.001);
  if (v8 > v9)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218752;
      double v17 = v7;
      __int16 v18 = 2048;
      double v19 = v6;
      __int16 v20 = 2048;
      CGFloat v21 = width;
      __int16 v22 = 2048;
      CGFloat v23 = height;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Cannot scale camera calibration. referenceDimensions (%f, %f) has a different aspect ratio than requested dimensions (%f, %f)", buf, 0x2Au);
    }
  }
  else
  {
    *(float *)&double v3 = a3.width / v7;
    self->super._referenceDimensions = a3;
    long long v11 = *(_OWORD *)&self->super._anon_10[32];
    float v12 = *(float *)&self->super._anon_10[20] * *(float *)&v3;
    double v15 = v3;
    *(float *)self->super._anon_10 = *(float *)self->super._anon_10 * *(float *)&v3;
    *(float *)&self->super._anon_10[20] = v12;
    *(_DWORD *)&self->super._anon_10[40] = DWORD2(v11);
    *(float32x2_t *)&self->super._anon_10[32] = vmul_n_f32(*(float32x2_t *)&v11, *(float *)&v3);
    double v13 = [(ADCameraCalibration *)self distortionModel];
    [v13 scale:v15];

    self->super._pixelSize = self->super._pixelSize / *(float *)&v15;
  }
  return v8 <= v9;
}

- (__n128)setIntrinsicMatrix:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  return result;
}

- (void)setPixelSize:(float)a3
{
  self->super._pixelSize = a3;
}

- (__n128)setCameraToPlatformTransform:(__n128)a3
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  return result;
}

- (void)setDistortionModel:(id)a3
{
  v4 = (ADLensDistortionModel *)a3;
  if (!v4) {
    v4 = (ADLensDistortionModel *)objc_opt_new();
  }
  self->super._distortionModel = v4;

  MEMORY[0x270F9A758]();
}

- (ADMutableCameraCalibration)init
{
  if (self)
  {
    double v3 = (ADLensDistortionModel *)objc_opt_new();
    distortionModel = self->super._distortionModel;
    self->super._distortionModel = v3;
  }
  return self;
}

- (BOOL)adjustForImageRotation:(int64_t)a3
{
  [(ADCameraCalibration *)self intrinsicMatrix];
  int v34 = v5;
  int v35 = v6;
  float64x2_t v36 = vcvtq_f64_f32(v7);
  [(ADCameraCalibration *)self referenceDimensions];
  double v10 = rotateUVPoint(a3, v36.f64[0], v36.f64[1], v8, v9);
  BOOL v12 = v11 != *(double *)(MEMORY[0x263F00148] + 8) || v10 != *MEMORY[0x263F00148];
  if (v12)
  {
    LODWORD(v13) = 0;
    HIDWORD(v13) = v35;
    *(float *)&unsigned int v14 = v10;
    *(float *)&unsigned int v15 = v11;
    __asm { FMOV            V2.4S, #1.0 }
    -[ADMutableCameraCalibration setIntrinsicMatrix:](self, "setIntrinsicMatrix:", COERCE_DOUBLE((unint64_t)v34), v13, COERCE_DOUBLE(__PAIR64__(v15, v14)));
    CGFloat v21 = [(ADCameraCalibration *)self distortionModel];
    [(ADCameraCalibration *)self referenceDimensions];
    objc_msgSend(v21, "adjustForImageRotation:forDimensions:", a3);

    [(ADCameraCalibration *)self referenceDimensions];
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      double v24 = v23;
    }
    else {
      double v24 = v22;
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      double v23 = v22;
    }
    -[ADMutableCameraCalibration setReferenceDimensions:](self, "setReferenceDimensions:", v24, v23);
    float v25 = 0.0;
    if ((unint64_t)(a3 - 1) <= 2) {
      float v25 = flt_247F263BC[a3 - 1];
    }
    __float2 v26 = __sincosf_stret(v25);
    *(float *)&unint64_t v27 = v26.__cosval;
    *((float *)&v27 + 1) = -v26.__sinval;
    long long v37 = v27;
    [(ADCameraCalibration *)self cameraToPlatformTransform];
    uint64_t v28 = 0;
    v29.i32[3] = 0;
    v30.i32[3] = 0;
    v31.i32[3] = 0;
    v32.i32[3] = 1.0;
    v38[0] = v37;
    v38[1] = (unint64_t)v26;
    v38[2] = xmmword_247F24640;
    v38[3] = xmmword_247F24650;
    do
    {
      *(long long *)((char *)&v39 + v28 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(v38[v28])), v30, *(float32x2_t *)&v38[v28], 1), v31, (float32x4_t)v38[v28], 2), v32, (float32x4_t)v38[v28], 3);
      ++v28;
    }
    while (v28 != 4);
    -[ADMutableCameraCalibration setCameraToPlatformTransform:](self, "setCameraToPlatformTransform:", *(double *)&v39, *(double *)&v40, *(double *)&v41, *(double *)&v42);
  }
  return v12;
}

- (void)centerCrop:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ADCameraCalibration *)self referenceDimensions];
  float v7 = v6 - width;
  [(ADCameraCalibration *)self referenceDimensions];
  *(float *)&double v8 = v8 - height;
  double v9 = (float)(*(float *)&v8 * 0.5);

  -[ADMutableCameraCalibration crop:](self, "crop:", (float)(v7 * 0.5), v9, width, height);
}

+ (id)new
{
  return objc_alloc_init(ADMutableCameraCalibration);
}

@end