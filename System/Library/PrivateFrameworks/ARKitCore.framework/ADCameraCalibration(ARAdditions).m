@interface ADCameraCalibration(ARAdditions)
+ (id)ar_calibrationWithImageData:()ARAdditions adCalibrationData:;
+ (id)ar_initWithCVACameraCalibrationData:()ARAdditions;
- (id)ar_initWithImageData:()ARAdditions calibrationData:;
- (id)ar_initWithImageData:()ARAdditions cameraToPlatformTransform:pixelSize:referenceDimensions:distortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:;
@end

@implementation ADCameraCalibration(ARAdditions)

+ (id)ar_calibrationWithImageData:()ARAdditions adCalibrationData:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (__CVBuffer *)[v6 pixelBuffer];
  if (v8)
  {
    v9 = v8;
    double Width = (double)CVPixelBufferGetWidth(v8);
    double Height = (double)CVPixelBufferGetHeight(v9);
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  [v7 referenceDimensions];
  if (Width == v13 && Height == v12)
  {
    id v33 = v7;
  }
  else
  {
    v15 = [v7 distortionModel];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = objc_alloc(MEMORY[0x1E4F4D800]);
      [v6 extrinsicMatrixToDeviceType:*MEMORY[0x1E4F15810]];
      double v40 = v18;
      double v41 = v17;
      double v38 = v20;
      double v39 = v19;
      [v7 pixelSize];
      double v22 = v21;
      [v7 referenceDimensions];
      double v24 = v23;
      double v26 = v25;
      [v15 distortionCenter];
      uint64_t v28 = v27;
      uint64_t v30 = v29;
      v31 = [v15 lensDistortionLookupTable];
      v32 = [v15 inverseLensDistortionLookupTable];
      objc_msgSend(v16, "ar_initWithImageData:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v6, v31, v32, v41, v40, v39, v38, v22, v24, v26, v28, v30);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = _ARLogGeneral_33();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        v36 = NSStringFromClass(v35);
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        __int16 v44 = 2048;
        uint64_t v45 = a1;
        _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unsupported distoration model to scale for imageData", buf, 0x16u);
      }
      id v33 = 0;
    }
  }
  return v33;
}

+ (id)ar_initWithCVACameraCalibrationData:()ARAdditions
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    uint64_t v29 = _ARLogGeneral_33();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    uint64_t v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    *(_DWORD *)buf = 138543618;
    __int16 v44 = v31;
    __int16 v45 = 2048;
    uint64_t v46 = a1;
    v32 = "%{public}@ <%p>: calibrationData is nil";
LABEL_11:
    _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);

    goto LABEL_12;
  }
  id v6 = [v4 lensDistortionLookupTable];

  if (!v6)
  {
    uint64_t v29 = _ARLogGeneral_33();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    id v33 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v33);
    *(_DWORD *)buf = 138543618;
    __int16 v44 = v31;
    __int16 v45 = 2048;
    uint64_t v46 = a1;
    v32 = "%{public}@ <%p>: lensDistortionLookupTable is nil";
    goto LABEL_11;
  }
  id v7 = [v5 inverseLensDistortionLookupTable];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F4D820]);
    [v5 lensDistortionCenter];
    double v10 = v9;
    double v12 = v11;
    double v13 = [v5 lensDistortionLookupTable];
    v14 = [v5 inverseLensDistortionLookupTable];
    v15 = objc_msgSend(v8, "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v13, v14, v10, v12);

    id v16 = objc_alloc(MEMORY[0x1E4F4D800]);
    [v5 intrinsicMatrix];
    double v42 = v17;
    double v40 = v19;
    double v41 = v18;
    [v5 extrinsicMatrix];
    double v38 = v21;
    double v39 = v20;
    double v36 = v23;
    double v37 = v22;
    [v5 pixelSize];
    double v25 = v24;
    [v5 intrinsicMatrixReferenceDimensions];
    uint64_t v28 = objc_msgSend(v16, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:forReferenceDimensions:withDistortionModel:", v15, v42, v41, v40, v39, v38, v37, v36, v25, v26, v27);

    goto LABEL_13;
  }
  uint64_t v29 = _ARLogGeneral_33();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v34 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v34);
    *(_DWORD *)buf = 138543618;
    __int16 v44 = v31;
    __int16 v45 = 2048;
    uint64_t v46 = a1;
    v32 = "%{public}@ <%p>: inverseLensDistortionLookupTable is nil";
    goto LABEL_11;
  }
LABEL_12:

  uint64_t v28 = 0;
LABEL_13:

  return v28;
}

- (id)ar_initWithImageData:()ARAdditions calibrationData:
{
  uint64_t v6 = *MEMORY[0x1E4F15810];
  id v7 = a4;
  id v8 = a3;
  [v8 extrinsicMatrixToDeviceType:v6];
  double v29 = v10;
  double v30 = v9;
  double v27 = v12;
  double v28 = v11;
  [v7 pixelSize];
  double v14 = v13;
  [v7 intrinsicMatrixReferenceDimensions];
  double v16 = v15;
  double v18 = v17;
  [v7 lensDistortionCenter];
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  double v23 = [v7 lensDistortionLookupTable];
  float v24 = [v7 inverseLensDistortionLookupTable];

  double v25 = objc_msgSend(a1, "ar_initWithImageData:cameraToPlatformTransform:pixelSize:referenceDimensions:distortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v8, v23, v24, v30, v29, v28, v27, v14, v16, v18, v20, v22);

  return v25;
}

- (id)ar_initWithImageData:()ARAdditions cameraToPlatformTransform:pixelSize:referenceDimensions:distortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:
{
  id v23 = a12;
  id v24 = a11;
  id v25 = a10;
  [v25 imageResolution];
  double v27 = v26 / a7;
  double v28 = a14 * (v26 / a7);
  [v25 imageResolution];
  double v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4D820]), "initWithDistortionCenter:lensDistortionLookupTable:inverseLensDistortionLookupTable:", v24, v23, v28, -(v29 - a8 * v27) * -0.5 + a15 * v27);

  id v31 = a1;
  [v25 cameraIntrinsics];
  double v42 = v33;
  double v43 = v32;
  double v41 = v34;
  [v25 imageResolution];
  uint64_t v36 = v35;
  uint64_t v38 = v37;

  double v39 = objc_msgSend(v31, "initWithIntrinsics:cameraToPlatformTransform:pixelSize:forReferenceDimensions:withDistortionModel:", v30, v43, v42, v41, a2, a3, a4, a5, a6, v36, v38);
  return v39;
}

@end