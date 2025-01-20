@interface ADFigCameraCalibrationSource
+ (CGRect)calcSensorCrop:(CGRect)a3 onImageWithDimensions:(CGSize)a4 metadataDictionary:(id)a5 negativeCropHandling:(int64_t)a6;
+ (__n128)getTransformFromStream:(void *)a3 toStream:(void *)a4 usingExtrinsicsDictionary:(void *)a5;
+ (double)figExtrinsicsToTransform:(void *)a3;
+ (double)getMidExposureTimestampFromMetadataDictionary:(id)a3;
+ (double)getMidExposureTimestampFromMetadataDictionary:(id)a3 timestamp:(double)a4;
+ (float)getAngularVelocityFromMetadataDictionary:(id)a3 deviceClock:(double)a4;
+ (void)getFrameTransformsFromMetadataDictionary:(id)a3 sensorCropRect:(CGRect *)a4 rawSensorSize:(CGSize *)a5 postReadCropRect:(CGRect *)a6;
- (ADCameraCalibration)cameraCalibration;
- (BOOL)pointFromMetadataField:(id)a3 key:(id)a4 point:(CGPoint *)a5;
- (BOOL)rectFromMetadataField:(id)a3 key:(id)a4 rect:(CGRect *)a5;
- (BOOL)updateForFrame:(__CVBuffer *)a3;
- (BOOL)updateForFrameWithDimensions:(CGSize)a3 metadataDictionary:(id)a4;
- (uint64_t)initWithPixelSize:(double)a3 gdcModel:(double)a4 cameraToPlatformTransform:(double)a5;
@end

@implementation ADFigCameraCalibrationSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distortion, 0);

  objc_storeStrong((id *)&self->_camera, 0);
}

- (ADCameraCalibration)cameraCalibration
{
  return (ADCameraCalibration *)self->_camera;
}

- (BOOL)updateForFrame:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  if (CMCaptureLibraryCore() && getkFigCaptureSampleBufferAttachmentKey_MetadataDictionarySymbolLoc())
  {
    v8 = (const __CFString **)getkFigCaptureSampleBufferAttachmentKey_MetadataDictionarySymbolLoc();
    if (!v8)
    {
      dlerror();
      v13 = (_Unwind_Exception *)abort_report_np();

      _Unwind_Resume(v13);
    }
    CFStringRef v9 = *v8;
  }
  else
  {
    CFStringRef v9 = @"MetadataDictionary";
  }
  v10 = (void *)PixelBufferUtils::copyAttachment(a3, v9, 0, v7);
  BOOL v11 = -[ADFigCameraCalibrationSource updateForFrameWithDimensions:metadataDictionary:](self, "updateForFrameWithDimensions:metadataDictionary:", v10, (double)Width, (double)Height);

  return v11;
}

- (BOOL)updateForFrameWithDimensions:(CGSize)a3 metadataDictionary:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RawSensorWidthSymbolLoc()) {
    v8 = (__CFString *)getkFigCaptureStreamMetadata_RawSensorWidth();
  }
  else {
    v8 = @"RawSensorWidth";
  }
  CFStringRef v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = [v9 integerValue];

  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RawSensorHeightSymbolLoc()) {
    BOOL v11 = (__CFString *)getkFigCaptureStreamMetadata_RawSensorHeight();
  }
  else {
    BOOL v11 = @"RawSensorHeight";
  }
  v12 = [v7 objectForKeyedSubscript:v11];
  double v13 = (double)v10;
  double v14 = (double)[v12 integerValue];

  -[ADMutableCameraCalibration setReferenceDimensions:](self->_camera, "setReferenceDimensions:", (double)v10, v14);
  *(float *)&double v15 = self->_rawSensorPixelSize;
  [(ADMutableCameraCalibration *)self->_camera setPixelSize:v15];
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_SensorCropRectSymbolLoc()) {
    v16 = (__CFString *)getkFigCaptureStreamMetadata_SensorCropRect();
  }
  else {
    v16 = @"SensorCropRect";
  }
  v17 = [v7 objectForKeyedSubscript:v16];

  if (v17)
  {
    long long v18 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v45 = *MEMORY[0x263F001A0];
    long long v46 = v18;
    if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_SensorCropRectSymbolLoc()) {
      v19 = (__CFString *)getkFigCaptureStreamMetadata_SensorCropRect();
    }
    else {
      v19 = @"SensorCropRect";
    }
    if (![(ADFigCameraCalibrationSource *)self rectFromMetadataField:v7 key:v19 rect:&v45])goto LABEL_51; {
    [(ADMutableCameraCalibration *)self->_camera setReferenceDimensions:v46];
    }
    if (!-[ADMutableCameraCalibration scale:](self->_camera, "scale:", v13, v14)) {
      goto LABEL_51;
    }
  }
  else
  {
    -[ADMutableCameraCalibration setReferenceDimensions:](self->_camera, "setReferenceDimensions:", v13, v14);
  }
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_PinholeCameraFocalLengthSymbolLoc())
  {
    v20 = (__CFString **)getkFigCaptureStreamMetadata_PinholeCameraFocalLengthSymbolLoc();
    if (!v20) {
      goto LABEL_64;
    }
    v21 = *v20;
  }
  else
  {
    v21 = @"PinholeCameraFocalLength";
  }
  v22 = [v7 objectForKeyedSubscript:v21];
  [v22 floatValue];
  float v24 = v23;

  if (v24 != 0.0) {
    goto LABEL_35;
  }
  if (!CMCaptureLibraryCore() || !getkFigCaptureStreamMetadata_PracticalFocalLengthSymbolLoc())
  {
    v26 = @"PracticalFocalLength";
LABEL_33:
    v27 = [v7 objectForKeyedSubscript:v26];
    [v27 floatValue];
    float v24 = v28;

    if (v24 < 1000.0) {
      float v24 = v24 * 1000.0;
    }
LABEL_35:
    [(ADCameraCalibration *)self->_camera pixelSize];
    float v30 = v29;
    if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_DistortionOpticalCenterSymbolLoc())
    {
      v31 = (__CFString **)getkFigCaptureStreamMetadata_DistortionOpticalCenterSymbolLoc();
      if (!v31) {
        goto LABEL_65;
      }
      v32 = *v31;
    }
    else
    {
      v32 = @"DistortionOpticalCenter";
    }
    if ([(ADFigCameraCalibrationSource *)self pointFromMetadataField:v7 key:v32 point:&v44])
    {
LABEL_47:
      *(float *)&unsigned int v35 = v24 / 1000.0 / v30;
      LODWORD(v36) = 0;
      HIDWORD(v36) = v35;
      -[ADMutableCameraCalibration setIntrinsicMatrix:](self->_camera, "setIntrinsicMatrix:", COERCE_DOUBLE((unint64_t)v35), v36, COERCE_DOUBLE(vcvt_f32_f64(v44)));
      [(ADDynamicPolynomialsLensDistortionModel *)self->_distortion setDynamicFactor:0.0];
      if (!CMCaptureLibraryCore() || !getkFigCaptureStreamMetadata_DynamicDistortionFactorSymbolLoc())
      {
        v38 = @"DynamicDistortionFactor";
        goto LABEL_53;
      }
      v37 = (__CFString **)getkFigCaptureStreamMetadata_DynamicDistortionFactorSymbolLoc();
      if (v37)
      {
        v38 = *v37;
LABEL_53:
        v40 = [v7 objectForKeyedSubscript:v38];
        v41 = v40;
        if (v40)
        {
          [v40 floatValue];
          -[ADDynamicPolynomialsLensDistortionModel setDynamicFactor:](self->_distortion, "setDynamicFactor:");
        }
        [(ADPolynomialsLensDistortionModel *)self->_distortion setDistortionCenter:*(_OWORD *)&v44];
        if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_TotalSensorCropRectSymbolLoc()) {
          v42 = (__CFString *)getkFigCaptureStreamMetadata_TotalSensorCropRect();
        }
        else {
          v42 = @"TotalSensorCropRect";
        }
        if ([(ADFigCameraCalibrationSource *)self rectFromMetadataField:v7 key:v42 rect:&v45])
        {
          -[ADMutableCameraCalibration crop:](self->_camera, "crop:", v45, v46);
          BOOL v39 = -[ADMutableCameraCalibration scale:](self->_camera, "scale:", width, height);
        }
        else
        {
          BOOL v39 = 0;
        }

        goto LABEL_63;
      }
      goto LABEL_65;
    }
    if (!CMCaptureLibraryCore() || !getkFigCaptureStreamMetadata_OpticalCenterSymbolLoc())
    {
      v34 = @"OpticalCenter";
LABEL_46:
      if (![(ADFigCameraCalibrationSource *)self pointFromMetadataField:v7 key:v34 point:&v44])
      {
LABEL_51:
        BOOL v39 = 0;
LABEL_63:

        return v39;
      }
      goto LABEL_47;
    }
    v33 = (__CFString **)getkFigCaptureStreamMetadata_OpticalCenterSymbolLoc();
    if (v33)
    {
      v34 = *v33;
      goto LABEL_46;
    }
LABEL_65:
    dlerror();
    BOOL result = abort_report_np();
    goto LABEL_66;
  }
  v25 = (__CFString **)getkFigCaptureStreamMetadata_PracticalFocalLengthSymbolLoc();
  if (v25)
  {
    v26 = *v25;
    goto LABEL_33;
  }
LABEL_64:
  dlerror();
  BOOL result = abort_report_np();
LABEL_66:
  __break(1u);
  return result;
}

- (BOOL)rectFromMetadataField:(id)a3 key:(id)a4 rect:(CGRect *)a5
{
  id v7 = a4;
  CFDictionaryRef v8 = [a3 objectForKeyedSubscript:v7];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSLog(&cfstr_CannotFindDict.isa, v7);
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  if (!CGRectMakeWithDictionaryRepresentation(v8, a5))
  {
    NSLog(&cfstr_InvalidDiction.isa, v7);
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (BOOL)pointFromMetadataField:(id)a3 key:(id)a4 point:(CGPoint *)a5
{
  id v7 = a4;
  CFDictionaryRef v8 = [a3 objectForKeyedSubscript:v7];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    NSLog(&cfstr_CannotFindDict.isa, v7);
LABEL_6:
    BOOL v9 = 0;
    goto LABEL_7;
  }
  if (!CGPointMakeWithDictionaryRepresentation(v8, a5))
  {
    NSLog(&cfstr_InvalidDiction.isa, v7);
    goto LABEL_6;
  }
  BOOL v9 = 1;
LABEL_7:

  return v9;
}

- (uint64_t)initWithPixelSize:(double)a3 gdcModel:(double)a4 cameraToPlatformTransform:(double)a5
{
  id v10 = a8;
  v40.receiver = a1;
  v40.super_class = (Class)ADFigCameraCalibrationSource;
  BOOL v11 = [(ADFigCameraCalibrationSource *)&v40 init];
  v12 = v11;
  if (!v11) {
    goto LABEL_22;
  }
  v11->_rawSensorPixelSize = a2;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamGDCCoefficientsKey_BasePolynomialSymbolLoc())
  {
    double v13 = (__CFString **)getkFigCaptureStreamGDCCoefficientsKey_BasePolynomialSymbolLoc();
    if (!v13) {
      goto LABEL_31;
    }
    double v14 = *v13;
  }
  else
  {
    double v14 = @"BasePolynomial";
  }
  double v15 = [v10 objectForKeyedSubscript:v14];
  v16 = v15;
  if (!v15)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = &_os_log_internal;
      v20 = "GDC dictionary doesn't contain BasePolynomial key";
LABEL_17:
      _os_log_impl(&dword_247EC4000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
    }
LABEL_29:

    v31 = 0;
    goto LABEL_30;
  }
  if ([v15 length] != 64)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v19 = &_os_log_internal;
      v20 = "GDC dictionary BasePolynomial key is of wrong size";
      goto LABEL_17;
    }
    goto LABEL_29;
  }
  if (!CMCaptureLibraryCore() || !getkFigCaptureStreamGDCCoefficientsKey_DynamicPolynomialSymbolLoc())
  {
    long long v18 = @"DynamicPolynomial";
LABEL_19:
    v21 = [v10 objectForKeyedSubscript:v18];
    v22 = v21;
    if (v21)
    {
      if ([v21 length] == 64)
      {
        float v23 = [ADDynamicPolynomialsLensDistortionModel alloc];
        id v24 = v16;
        uint64_t v25 = [v24 bytes];
        id v26 = v22;
        uint64_t v27 = -[ADDynamicPolynomialsLensDistortionModel initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:](v23, "initWithDistortionCenter:dynFactor:polynomialsBase:polynomialsDynamic:", v25, [v26 bytes], 0.0, 0.0, 0.0);
        distortion = v12->_distortion;
        v12->_distortion = (ADDynamicPolynomialsLensDistortionModel *)v27;

        float v29 = objc_alloc_init(ADMutableCameraCalibration);
        camera = v12->_camera;
        v12->_camera = v29;

        -[ADMutableCameraCalibration setCameraToPlatformTransform:](v12->_camera, "setCameraToPlatformTransform:", a3, a4, a5, a6);
        [(ADMutableCameraCalibration *)v12->_camera setDistortionModel:v12->_distortion];

LABEL_22:
        v31 = v12;
LABEL_30:

        return (uint64_t)v31;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v32 = &_os_log_internal;
      v33 = "GDC dictionary DynamicPolynomial key is of wrong size";
    }
    else
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

        goto LABEL_29;
      }
      *(_WORD *)buf = 0;
      v32 = &_os_log_internal;
      v33 = "GDC dictionary doesn't contain DynamicPolynomial key";
    }
    _os_log_impl(&dword_247EC4000, v32, OS_LOG_TYPE_DEFAULT, v33, buf, 2u);
    goto LABEL_28;
  }
  v17 = (__CFString **)getkFigCaptureStreamGDCCoefficientsKey_DynamicPolynomialSymbolLoc();
  if (v17)
  {
    long long v18 = *v17;
    goto LABEL_19;
  }
LABEL_31:
  dlerror();
  uint64_t result = abort_report_np();
  __break(1u);
  return result;
}

+ (CGRect)calcSensorCrop:(CGRect)a3 onImageWithDimensions:(CGSize)a4 metadataDictionary:(id)a5 negativeCropHandling:(int64_t)a6
{
  double width = a4.width;
  double height = a4.height;
  double v34 = a3.size.width;
  double v35 = a3.size.height;
  CGFloat x = a3.origin.x;
  CGFloat y = a3.origin.y;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v7 = a5;
  +[ADFigCameraCalibrationSource getFrameTransformsFromMetadataDictionary:v7 sensorCropRect:&v43 rawSensorSize:&v42 postReadCropRect:&v40];
  v8.f64[0] = x;
  v8.f64[1] = y;
  float64x2_t v30 = v40;
  float64x2_t v31 = v43;
  float64x2_t v9 = vdivq_f64(v42, v44);
  v10.f64[0] = v34;
  v10.f64[1] = v35;
  float64x2_t v11 = vmulq_f64(vsubq_f64(v8, v43), v9);
  float64x2_t v12 = vmulq_f64(v10, v9);
  float64x2_t v13 = vsubq_f64(v11, v40);
  v14.f64[0] = width;
  v14.f64[1] = height;
  float64x2_t v29 = v41;
  float64x2_t v15 = vdivq_f64(v14, v41);
  float64x2_t v16 = vmulq_f64(v13, v15);
  float64x2_t v17 = vmulq_f64(v12, v15);
  double v18 = v16.f64[1];
  double v38 = v16.f64[0];
  double v19 = v17.f64[1];
  double v39 = v17.f64[0];
  if (v16.f64[0] < 0.0
    || v16.f64[1] < 0.0
    || (int32x2_t v20 = vmovn_s64(vcgtq_f64(vaddq_f64(v16, v17), v14)), (v20.i8[0] & 1) != 0)
    || (v20.i8[4] & 1) != 0)
  {
    if (a6)
    {
      if (a6 == 2)
      {
        double v21 = height / (v35 / v34);
        if (width < v21) {
          double v21 = width;
        }
        double v19 = v35 / v34 * v21;
        double v39 = v21;
        double v38 = (width - v21) * 0.5;
        double v18 = (height - v19) * 0.5;
      }
      else
      {
        if (a6 != 1) {
          __assert_rtn("+[ADFigCameraCalibrationSource calcSensorCrop:onImageWithDimensions:metadataDictionary:negativeCropHandling:]", "ADFigCameraCalibrationSource.mm", 528, "false");
        }
        double v18 = *(double *)(MEMORY[0x263F001A0] + 8);
        double v19 = *(double *)(MEMORY[0x263F001A0] + 24);
        double v38 = *MEMORY[0x263F001A0];
        double v39 = *(double *)(MEMORY[0x263F001A0] + 16);
      }
    }
  }
  float64x2_t v27 = v42;
  float64x2_t v28 = v44;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
  {
    float64x2_t v26 = vdivq_f64(v28, v27);
    *(_DWORD *)buf = 134221312;
    CGFloat v46 = x;
    __int16 v47 = 2048;
    CGFloat v48 = y;
    __int16 v49 = 2048;
    double v50 = v34;
    __int16 v51 = 2048;
    double v52 = v35;
    __int16 v53 = 2048;
    double v54 = width;
    __int16 v55 = 2048;
    double v56 = height;
    __int16 v57 = 2048;
    double v58 = v31.f64[0] + (v30.f64[0] + v29.f64[0] / width * 0.0) * v26.f64[0];
    __int16 v59 = 2048;
    float64_t v60 = v31.f64[1] + vmuld_lane_f64(v30.f64[1] + v29.f64[1] / height * 0.0, v26, 1);
    __int16 v61 = 2048;
    double v62 = width * (v29.f64[0] / width) * v26.f64[0];
    __int16 v63 = 2048;
    double v64 = vmuld_lane_f64(height * (v29.f64[1] / height), v26, 1);
    __int16 v65 = 2048;
    double v66 = v31.f64[0] + (v30.f64[0] + v38 * (v29.f64[0] / width)) * v26.f64[0];
    __int16 v67 = 2048;
    float64_t v68 = v31.f64[1] + vmuld_lane_f64(v30.f64[1] + v18 * (v29.f64[1] / height), v26, 1);
    __int16 v69 = 2048;
    double v70 = v39 * (v29.f64[0] / width) * v26.f64[0];
    __int16 v71 = 2048;
    double v72 = vmuld_lane_f64(v19 * (v29.f64[1] / height), v26, 1);
    _os_log_debug_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "[ADFigCameraCalibrationSource] Translate a crop of (%.2f, %.2f, %.2f, %.2f) on image with dimensions (%.2f, %.2f): Total crop made originally: (%.2f, %.2f, %.2f, %.2f), Final crop to use: (%.2f, %.2f, %.2f, %.2f)", buf, 0x8Eu);
  }

  double v22 = v38;
  double v23 = v39;
  double v24 = v18;
  double v25 = v19;
  result.size.double height = v25;
  result.size.double width = v23;
  result.origin.CGFloat y = v24;
  result.origin.CGFloat x = v22;
  return result;
}

+ (float)getAngularVelocityFromMetadataDictionary:(id)a3 deviceClock:(double)a4
{
  id v7 = a3;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_ISPMotionDataSymbolLoc())
  {
    float64x2_t v8 = (__CFString **)getkFigCaptureStreamMetadata_ISPMotionDataSymbolLoc();
    if (!v8)
    {
      dlerror();
      abort_report_np();
      __break(1u);
      return result;
    }
    float64x2_t v9 = *v8;
  }
  else
  {
    float64x2_t v9 = @"ISPMotionData";
  }
  id v10 = [v7 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 bytes];
  float v14 = NAN;
  if (v10 && v11)
  {
    uint64_t v15 = *(int *)(v11 + 4);
    if ((int)v15 < 1) {
      goto LABEL_20;
    }
    int v16 = 0;
    float64x2_t v17 = (int *)(v11 + 32);
    char v18 = 1;
    double v19 = 0.0;
    int8x16_t v21 = (int8x16_t)vdupq_n_s64(0x4066800000000000uLL);
    float64x2_t v54 = (float64x2_t)v21;
    v21.i64[0] = 0x4066800000000000;
    float64x2_t v53 = (float64x2_t)v21;
    v21.i64[0] = 0x400921FB54442D18;
    float64x2_t v50 = (float64x2_t)v21;
    float64x2_t v20 = (float64x2_t)vdupq_n_s64(0x400921FB54442D18uLL);
    v21.i64[0] = 0x8000000000000000;
    int8x16_t v48 = v21;
    float64x2_t v49 = v20;
    double v22 = 0.0;
    double v23 = 0.0;
    do
    {
      double v24 = v4;
      float64x2_t v51 = v20;
      float64x2_t v52 = (float64x2_t)v21;
      unsigned int v25 = *((unsigned __int16 *)v17 - 8);
      *(double *)v21.i64 = (double)*(v17 - 3) * 9.31322575e-10;
      double v26 = (double)*(v17 - 2) * 9.31322575e-10;
      double v27 = (double)*(v17 - 1) * 9.31322575e-10;
      double v28 = (double)*v17 * 9.31322575e-10;
      unint64_t v29 = *((void *)v17 - 3);
      *(double *)&long long v30 = *(double *)v21.i64 * *(double *)v21.i64 - v26 * v26 - v27 * v27 + v28 * v28;
      *(double *)&long long v13 = -(v26 * v28 - *(double *)v21.i64 * v27) - (v26 * v28 - *(double *)v21.i64 * v27);
      *((double *)&v30 + 1) = v27 * v28 + *(double *)v21.i64 * v26 + v27 * v28 + *(double *)v21.i64 * v26;
      *(double *)&long long v31 = -(v27 * v28 - *(double *)v21.i64 * v26) - (v27 * v28 - *(double *)v21.i64 * v26);
      *((double *)&v31 + 1) = v26 * v26 - v27 * v27 + v28 * v28 - *(double *)v21.i64 * *(double *)v21.i64;
      *(double *)v12.i64 = *(double *)v21.i64 * v28 + v26 * v27 + *(double *)v21.i64 * v28 + v26 * v27;
      *(double *)&long long v32 = v26 * v28 + v27 * *(double *)v21.i64 + v26 * v28 + v27 * *(double *)v21.i64;
      *((double *)&v32 + 1) = -(*(double *)v21.i64 * v28 - v26 * v27) - (*(double *)v21.i64 * v28 - v26 * v27);
      v56[0] = v30;
      v56[1] = v13;
      *(double *)v21.i64 = v28 * v28 + v27 * v27 - *(double *)v21.i64 * *(double *)v21.i64 - v26 * v26;
      v56[2] = v31;
      v56[3] = v12;
      v56[4] = v32;
      v56[5] = v21;
      double v4 = (double)v29;
      ADCommonUtils::calcRotationAngle((ADCommonUtils *)v56, v55);
      float64x2_t v20 = vdivq_f64(vmulq_f64(v55[1], v53), v50);
      int8x16_t v21 = (int8x16_t)vdivq_f64(vmulq_f64(v55[0], v54), v49);
      if ((v18 & 1) == 0 && (unsigned __int16)(v25 - 1) <= 1u && v5 != 0.0)
      {
        v33.f64[0] = (v4 - v24) / a4;
        *(void *)&v34.f64[0] = v21.i64[0];
        *(void *)&v34.f64[1] = vextq_s8(v21, v21, 8uLL).u64[0];
        float64x2_t v35 = vsubq_f64(v34, v52);
        float64x2_t v36 = vsubq_f64(v20, v51);
        float64x2_t v37 = vabdq_f64(v34, v52);
        __asm { FMOV            V18.2D, #1.0 }
        *(void *)&double v43 = *(_OWORD *)&vmulq_f64((float64x2_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v36, v48), _Q18), vorrq_s8((int8x16_t)vcltzq_f64(v36), (int8x16_t)vcgtzq_f64(v36))), vnegq_f64(vsubq_f64(v53, vabdq_f64(v20, v51))));
        int8x16_t v12 = (int8x16_t)vmulq_f64((float64x2_t)vandq_s8(vorrq_s8(vandq_s8((int8x16_t)v35, (int8x16_t)vdupq_n_s64(0x8000000000000000)), _Q18), vorrq_s8((int8x16_t)vcltzq_f64(v35), (int8x16_t)vcgtzq_f64(v35))), vnegq_f64(vsubq_f64((float64x2_t)vdupq_n_s64(0x4076800000000000uLL), v37)));
        *((void *)&v13 + 1) = *(void *)&v54.f64[1];
        float64x2_t v44 = (float64x2_t)vcgtq_f64(v37, v54);
        float64x2_t v45 = (float64x2_t)vbslq_s8((int8x16_t)v44, v12, (int8x16_t)v35);
        if (fabs(v36.f64[0]) <= 90.0) {
          v44.f64[0] = v36.f64[0];
        }
        else {
          v44.f64[0] = v43;
        }
        float64x2_t v46 = vdivq_f64(v45, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v33.f64[0], 0));
        double v19 = v19 + v46.f64[0];
        double v22 = v22 + v46.f64[1];
        double v23 = v23 + vdivq_f64(v44, v33).f64[0];
        ++v16;
      }
      char v18 = 0;
      double v5 = (double)v25;
      v17 += 10;
      --v15;
    }
    while (v15);
    if (v16 <= 0) {
LABEL_20:
    }
      float v14 = NAN;
    else {
      float v14 = sqrt(v23 / (double)v16 * (v23 / (double)v16)+ v22 / (double)v16 * (v22 / (double)v16)+ v19 / (double)v16 * (v19 / (double)v16));
    }
  }

  return v14;
}

+ (double)getMidExposureTimestampFromMetadataDictionary:(id)a3
{
  id v3 = a3;
  if (!CMCaptureLibraryCore() || !getkFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStampSymbolLoc())
  {
    double v5 = @"_OriginalPresentationTimeStamp";
    goto LABEL_6;
  }
  double v4 = (__CFString **)getkFigCaptureSampleBufferAttachmentKey_OriginalPresentationTimeStampSymbolLoc();
  if (v4)
  {
    double v5 = *v4;
LABEL_6:
    CFDictionaryRef v6 = [v3 objectForKeyedSubscript:v5];
    memset(&v11, 0, sizeof(v11));
    CMTimeMakeFromDictionary(&v11, v6);
    CMTime time = v11;
    +[ADFigCameraCalibrationSource getMidExposureTimestampFromMetadataDictionary:v3 timestamp:CMTimeGetSeconds(&time)];
    double v8 = v7;

    return v8;
  }
  dlerror();
  abort_report_np();
  __break(1u);
  return result;
}

+ (double)getMidExposureTimestampFromMetadataDictionary:(id)a3 timestamp:(double)a4
{
  id v5 = a3;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RollingShutterSkewSymbolLoc())
  {
    CFDictionaryRef v6 = (__CFString **)getkFigCaptureStreamMetadata_RollingShutterSkewSymbolLoc();
    if (!v6) {
      goto LABEL_12;
    }
    double v7 = *v6;
  }
  else
  {
    double v7 = @"RollingShutterSkew";
  }
  double v8 = [v5 objectForKeyedSubscript:v7];
  int v9 = [v8 intValue];

  if (!CMCaptureLibraryCore() || !getkFigCaptureStreamMetadata_ExposureTimeSymbolLoc())
  {
    CMTime v11 = @"ExposureTime";
    goto LABEL_11;
  }
  id v10 = (__CFString **)getkFigCaptureStreamMetadata_ExposureTimeSymbolLoc();
  if (v10)
  {
    CMTime v11 = *v10;
LABEL_11:
    int8x16_t v12 = [v5 objectForKeyedSubscript:v11];
    [v12 doubleValue];
    double v14 = v13;

    return a4 + ((double)v9 / 1000000.0 - v14) * 0.5;
  }
LABEL_12:
  dlerror();
  abort_report_np();
  __break(1u);
  return result;
}

+ (void)getFrameTransformsFromMetadataDictionary:(id)a3 sensorCropRect:(CGRect *)a4 rawSensorSize:(CGSize *)a5 postReadCropRect:(CGRect *)a6
{
  id v19 = a3;
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RawSensorWidthSymbolLoc()) {
    int v9 = (__CFString *)getkFigCaptureStreamMetadata_RawSensorWidth();
  }
  else {
    int v9 = @"RawSensorWidth";
  }
  id v10 = [v19 objectForKeyedSubscript:v9];
  a5->double width = (double)(int)[v10 intValue];

  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_RawSensorHeightSymbolLoc()) {
    CMTime v11 = (__CFString *)getkFigCaptureStreamMetadata_RawSensorHeight();
  }
  else {
    CMTime v11 = @"RawSensorHeight";
  }
  int8x16_t v12 = [v19 objectForKeyedSubscript:v11];
  a5->double height = (double)(int)[v12 intValue];

  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_SensorCropRectSymbolLoc()) {
    double v13 = (__CFString *)getkFigCaptureStreamMetadata_SensorCropRect();
  }
  else {
    double v13 = @"SensorCropRect";
  }
  double v14 = [v19 objectForKeyedSubscript:v13];

  if (v14)
  {
    if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_SensorCropRectSymbolLoc()) {
      uint64_t v15 = (__CFString *)getkFigCaptureStreamMetadata_SensorCropRect();
    }
    else {
      uint64_t v15 = @"SensorCropRect";
    }
    CFDictionaryRef v16 = [v19 objectForKeyedSubscript:v15];
    CGRectMakeWithDictionaryRepresentation(v16, a4);
  }
  else
  {
    a4->origin.CGFloat x = 0.0;
    a4->origin.CGFloat y = 0.0;
    a4->size = *a5;
  }
  if (CMCaptureLibraryCore() && getkFigCaptureStreamMetadata_TotalSensorCropRectSymbolLoc()) {
    float64x2_t v17 = (__CFString *)getkFigCaptureStreamMetadata_TotalSensorCropRect();
  }
  else {
    float64x2_t v17 = @"TotalSensorCropRect";
  }
  CFDictionaryRef v18 = [v19 objectForKeyedSubscript:v17];
  CGRectMakeWithDictionaryRepresentation(v18, a6);
}

+ (__n128)getTransformFromStream:(void *)a3 toStream:(void *)a4 usingExtrinsicsDictionary:(void *)a5
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKeyedSubscript:v8];
  CMTime v11 = [v10 objectForKeyedSubscript:v7];

  if (!v11)
  {
    double v13 = [v9 objectForKeyedSubscript:v7];
    double v14 = [v13 objectForKeyedSubscript:v8];

    if (v14)
    {
      +[ADFigCameraCalibrationSource figExtrinsicsToTransform:v14];
      int32x4_t v17 = vzip1q_s32(v15, v16);
      v17.i32[2] = v18;
      int32x4_t v46 = v17;
LABEL_13:

      goto LABEL_14;
    }
    id v19 = [v9 objectForKeyedSubscript:v7];
    float64x2_t v20 = [v19 allKeys];

    if ([v20 count] == 1)
    {
      int8x16_t v21 = [v20 objectAtIndexedSubscript:0];
      double v22 = [v9 objectForKeyedSubscript:v7];
      double v23 = [v22 objectForKeyedSubscript:v21];

      double v24 = [v9 objectForKeyedSubscript:v8];
      unsigned int v25 = [v24 objectForKeyedSubscript:v21];

      if (v23 && v25)
      {
        +[ADFigCameraCalibrationSource figExtrinsicsToTransform:v23];
        int32x4_t v48 = v27;
        int32x4_t v49 = v26;
        int32x4_t v47 = v28;
        float32x4_t v50 = v29;
        long long v30 = (ADCommonUtils *)+[ADFigCameraCalibrationSource figExtrinsicsToTransform:v25];
        int32x4_t v31 = vzip1q_s32(v49, v48);
        v57.columns[0] = (simd_float3)vzip1q_s32(v31, v47);
        float32x4_t v32 = (float32x4_t)vtrn2q_s32(v49, v47);
        v32.i32[2] = v48.i32[1];
        v57.columns[2] = (simd_float3)vzip1q_s32(vzip2q_s32(v49, v48), vdupq_laneq_s32(v47, 2));
        float32x4_t v33 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v57.columns[0], v50.f32[0]), v32, *(float32x2_t *)v50.f32, 1), (float32x4_t)v57.columns[2], v50, 2);
        int32x4_t v36 = vzip1q_s32(v34, v35);
        int32x4_t v37 = vzip2q_s32(v34, v35);
        float32x4_t v39 = (float32x4_t)vzip1q_s32(v36, v38);
        float32x4_t v40 = (float32x4_t)vtrn2q_s32(v34, v38);
        v40.i32[2] = v35.i32[1];
        v56.columns[2] = (simd_float3)vzip1q_s32(v37, vdupq_laneq_s32(v38, 2));
        v57.columns[3] = (simd_float3)vnegq_f32(v33);
        v57.columns[3].i32[3] = 0;
        v57.columns[2].i32[3] = 0;
        v57.columns[1] = (simd_float3)vzip2q_s32(v31, vdupq_lane_s32(*(int32x2_t *)v47.i8, 1));
        v57.columns[1].i32[3] = 0;
        v57.columns[0].i32[3] = 0;
        float32x4_t v42 = vmlaq_lane_f32(vmulq_n_f32(v39, v41.f32[0]), v40, *(float32x2_t *)v41.f32, 1);
        v39.i32[3] = 0;
        v56.columns[1] = (simd_float3)vzip2q_s32(v36, vdupq_lane_s32(*(int32x2_t *)v38.i8, 1));
        v56.columns[1].i32[3] = 0;
        float32x4_t v43 = vmlaq_laneq_f32(v42, (float32x4_t)v56.columns[2], v41, 2);
        v56.columns[2].i32[3] = 0;
        v56.columns[3] = (simd_float3)vnegq_f32(v43);
        v56.columns[3].i32[3] = 0;
        v56.columns[0] = (simd_float3)v39;
        *(double *)v44.i64 = ADCommonUtils::computeTransform(v30, v56, v57);
        int32x4_t v46 = v44;

LABEL_12:
        goto LABEL_13;
      }
    }
    int32x4_t v46 = 0u;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v52 = v7;
      __int16 v53 = 2112;
      id v54 = v8;
      _os_log_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "Could not calculate transform from %@ to %@ out of Fig extrinsics dictionary", buf, 0x16u);
    }
    goto LABEL_12;
  }
  +[ADFigCameraCalibrationSource figExtrinsicsToTransform:v11];
  int32x4_t v46 = v12;
LABEL_14:

  return (__n128)v46;
}

+ (double)figExtrinsicsToTransform:(void *)a3
{
  uint64_t v3 = [a3 bytes];
  unint64_t v4 = 0;
  int32x4_t v5 = *(int32x4_t *)(v3 + 16);
  int32x4_t v6 = *(int32x4_t *)(v3 + 32);
  int32x4_t v7 = vzip1q_s32(*(int32x4_t *)v3, v6);
  int32x4_t v8 = vzip2q_s32(*(int32x4_t *)v3, v6);
  int32x4_t v9 = vzip2q_s32(v5, (int32x4_t)0);
  int32x4_t v10 = vzip1q_s32(v7, v5);
  int32x4_t v11 = vzip1q_s32(v8, v9);
  int32x4_t v12 = vzip2q_s32(v7, vdupq_lane_s32(*(int32x2_t *)v5.i8, 1));
  v10.i32[3] = 0;
  v12.i32[3] = 0;
  int32x4_t v13 = vzip2q_s32(v8, v9);
  v11.i32[3] = 0;
  v13.i32[3] = 1.0;
  float32x4_t v17 = *(float32x4_t *)MEMORY[0x263EF89A8];
  float32x4_t v16 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
  float32x4_t v14 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
  float32x4_t v15 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
  v16.i32[1] = -1.0;
  v17.i32[0] = -1.0;
  int32x4_t v24 = v10;
  int32x4_t v25 = v12;
  int32x4_t v26 = v11;
  int32x4_t v27 = v13;
  do
  {
    v28[v4 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v17, COERCE_FLOAT(*(_OWORD *)((char *)&v24 + v4))), v16, *(float32x2_t *)&v24.i8[v4], 1), v14, *(float32x4_t *)((char *)&v24 + v4), 2), v15, *(float32x4_t *)((char *)&v24 + v4), 3);
    v4 += 16;
  }
  while (v4 != 64);
  unint64_t v18 = 0;
  float32x4_t v19 = (float32x4_t)v28[0];
  float32x4_t v20 = (float32x4_t)v28[1];
  float32x4_t v21 = (float32x4_t)v28[2];
  float32x4_t v22 = (float32x4_t)v28[3];
  int32x4_t v24 = (int32x4_t)v17;
  int32x4_t v25 = (int32x4_t)v16;
  int32x4_t v26 = (int32x4_t)v14;
  int32x4_t v27 = (int32x4_t)v15;
  do
  {
    v28[v18 / 0x10] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v19, COERCE_FLOAT(*(_OWORD *)((char *)&v24 + v18))), v20, *(float32x2_t *)&v24.i8[v18], 1), v21, *(float32x4_t *)((char *)&v24 + v18), 2), v22, *(float32x4_t *)((char *)&v24 + v18), 3);
    v18 += 16;
  }
  while (v18 != 64);
  return *(double *)v28;
}

@end