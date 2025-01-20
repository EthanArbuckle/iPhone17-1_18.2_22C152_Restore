@interface HMIFaceprinter
+ (__CVBuffer)createFacePixelBufferForFaceDetection:(id)a3 pixelBuffer:(__CVBuffer *)a4 roll:(id)a5 error:(id *)a6;
+ (__CVBuffer)createFacePixelBufferForFaceEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 roll:(id)a5 error:(id *)a6;
+ (id)currentModelUUID;
+ (int64_t)_minorVersionFromVisionVersion:(int)a3;
- (__CVBuffer)createFacePixelBufferFromFaceCrop:(id)a3 error:(id *)a4;
- (id)createFaceprintForFacePixelBuffer:(__CVBuffer *)a3 fastMode:(BOOL)a4 error:(id *)a5;
- (id)generateFaceprintForFaceCrop:(id)a3 error:(id *)a4;
- (id)updatedFaceprintsForFaceCrops:(id)a3 withExistingFaceprints:(id)a4 error:(id *)a5;
- (void)warmStart;
@end

@implementation HMIFaceprinter

+ (id)currentModelUUID
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__HMIFaceprinter_currentModelUUID__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentModelUUID_onceToken_0 != -1) {
    dispatch_once(&currentModelUUID_onceToken_0, block);
  }
  v2 = (void *)currentModelUUID_modelUUID_0;
  return v2;
}

void __34__HMIFaceprinter_currentModelUUID__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[HMIFaceUtilities faceprintDefaultRevision];
  uint64_t v3 = +[HMIFaceprinter _minorVersionFromVisionVersion:HMIVisionRuntimeVersion()];
  v4 = (void *)MEMORY[0x22A641C70]();
  id v5 = *(id *)(a1 + 32);
  v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v10 = 138543874;
    v11 = v7;
    __int16 v12 = 2048;
    uint64_t v13 = v2;
    __int16 v14 = 2048;
    uint64_t v15 = v3;
    _os_log_impl(&dword_225DC6000, v6, OS_LOG_TYPE_INFO, "%{public}@Faceprint Version: %ld.%ld", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v8 = HMIModelUUID(v2, v3);
  v9 = (void *)currentModelUUID_modelUUID_0;
  currentModelUUID_modelUUID_0 = v8;
}

- (void)warmStart
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HMIFaceprinter_warmStart__block_invoke;
  block[3] = &unk_26477B7D8;
  block[4] = self;
  if (warmStart_onceToken != -1) {
    dispatch_once(&warmStart_onceToken, block);
  }
}

void __27__HMIFaceprinter_warmStart__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x22A641C70]();
  id v3 = *(id *)(a1 + 32);
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v12 = v5;
    _os_log_impl(&dword_225DC6000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Warm starting faceprint model...", buf, 0xCu);
  }
  HMIDispatchQueueNameString(*(void **)(a1 + 32), @"warm_start_faceprint_model");
  id v6 = objc_claimAutoreleasedReturnValue();
  v7 = (const char *)[v6 UTF8String];
  uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = dispatch_queue_create(v7, v8);

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HMIFaceprinter_warmStart__block_invoke_63;
  block[3] = &unk_26477B7D8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v9, block);
}

void __27__HMIFaceprinter_warmStart__block_invoke_63(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263EFF910] date];
  id v3 = +[HMIVisionUtilities createPixelBufferWithSize:pixelFormat:useIOSurface:](HMIVisionUtilities, "createPixelBufferWithSize:pixelFormat:useIOSurface:", 1111970369, 1, 128.0, 128.0);
  if (v3)
  {
    v4 = v3;
    id v5 = *(void **)(a1 + 32);
    id v22 = 0;
    id v6 = [v5 createFaceprintForFacePixelBuffer:v4 fastMode:1 error:&v22];
    id v7 = v22;
    CVPixelBufferRelease(v4);
    if (v6)
    {
      uint64_t v8 = [MEMORY[0x263EFF910] date];
      [v8 timeIntervalSinceDate:v2];
      int v10 = v9;

      v11 = (void *)MEMORY[0x22A641C70]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __int16 v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        __int16 v25 = 2048;
        id v26 = v10;
        uint64_t v15 = "%{public}@Warm start of faceprint model took: %f";
        uint64_t v16 = v13;
        os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
LABEL_10:
        _os_log_impl(&dword_225DC6000, v16, v17, v15, buf, 0x16u);
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x22A641C70]();
      id v12 = *(id *)(a1 + 32);
      uint64_t v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v24 = v14;
        __int16 v25 = 2112;
        id v26 = v7;
        uint64_t v15 = "%{public}@Failed to warm start faceprint model: %@";
        uint64_t v16 = v13;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
  v18 = (void *)MEMORY[0x22A641C70]();
  id v19 = *(id *)(a1 + 32);
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v24 = v21;
    _os_log_impl(&dword_225DC6000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to create pixel buffer when warm starting faceprint model", buf, 0xCu);
  }
LABEL_12:
}

- (id)createFaceprintForFacePixelBuffer:(__CVBuffer *)a3 fastMode:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v38[1] = *MEMORY[0x263EF8340];
  id v9 = objc_alloc(MEMORY[0x263F1EF40]);
  int v10 = +[HMIVisionSession sharedInstance];
  v11 = [v10 vnSession];
  v32 = (void *)[v9 initWithCVPixelBuffer:a3 options:MEMORY[0x263EFFA78] session:v11];

  id v12 = objc_alloc_init(MEMORY[0x263F1EE50]);
  uint64_t v13 = objc_msgSend(MEMORY[0x263F1EED0], "faceObservationWithRequestRevision:unalignedBoundingBox:alignedBoundingBox:", 2, 0.0, 0.0, 1.0, 1.0, 0.0, 0.0, 1.0, 1.0);
  v38[0] = v13;
  __int16 v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:1];

  [v12 setInputFaceObservations:v14];
  id v36 = 0;
  LOBYTE(v13) = objc_msgSend(v12, "setRevision:error:", +[HMIFaceUtilities faceprintDefaultRevision](HMIFaceUtilities, "faceprintDefaultRevision"), &v36);
  id v15 = v36;
  if (v13)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F1EE10]);
    [v16 setInputFaceObservations:v14];
    id v35 = v15;
    char v17 = objc_msgSend(v16, "setRevision:error:", +[HMIFaceUtilities faceprintAttributeDefaultRevision](HMIFaceUtilities, "faceprintAttributeDefaultRevision"), &v35);
    id v18 = v35;

    if (v17)
    {
      if (v6)
      {
        [v12 setDetectionLevel:2];
        [v16 setDetectionLevel:2];
      }
      v34 = [[HMISignpost alloc] initWithName:@"CreateFaceprint"];
      v37[0] = v12;
      v37[1] = v16;
      id v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
      id v33 = v18;
      char v20 = [v32 performRequests:v19 error:&v33];
      id v15 = v33;

      if (v20)
      {
        v21 = [v12 results];
        id v22 = [v21 firstObject];

        v23 = [v16 results];
        v24 = [v23 firstObject];

        id v25 = 0;
        if (v22 && v24)
        {
          id v26 = [v22 faceprint];
          [v24 setFaceprint:v26];

          id v25 = v24;
        }
      }
      else
      {
        v30 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1025 underlyingError:v15];
        id v22 = v30;
        if (a5) {
          *a5 = v30;
        }
        HMIErrorLog(self, v22);
        id v25 = 0;
      }

      __HMISignpostScopeLeave(&v34);
    }
    else
    {
      v28 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1025 underlyingError:v18];
      v29 = v28;
      if (a5) {
        *a5 = v28;
      }
      HMIErrorLog(self, v29);

      id v25 = 0;
      id v15 = v18;
    }
  }
  else
  {
    uint64_t v27 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1025 underlyingError:v15];
    id v16 = v27;
    if (a5) {
      *a5 = v27;
    }
    HMIErrorLog(self, v16);
    id v25 = 0;
  }

  return v25;
}

+ (__CVBuffer)createFacePixelBufferForFaceDetection:(id)a3 pixelBuffer:(__CVBuffer *)a4 roll:(id)a5 error:(id *)a6
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  double Size = HMICVPixelBufferGetSize(a4);
  CGFloat v13 = v12;
  [v9 unalignedBoundingBox];
  HMICGRectFlipCoordinateSpaceNormalized(v14, v15, v16, v17);
  HMICGRectSquareNormalized(v18, v19, v20, v21, Size, v13);
  double v26 = HMIExpandFaceRect(v22, v23, v24, v25, 1.76470578);
  HMICGRectPixelFromNormalized(v26, v27, v28, v29, Size, v13);
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  [v10 floatValue];
  double v80 = v37;
  double v81 = v35;
  if (fabsf(v38) <= 0.175)
  {

    double v44 = v37;
    double v43 = v35;
    double v42 = v33;
    double v41 = v31;
    id v10 = &unk_26D9A9A80;
  }
  else
  {
    double Width = (double)CVPixelBufferGetWidth(a4);
    size_t Height = CVPixelBufferGetHeight(a4);
    double v41 = HMICGRectExpandWithinLimit(v31, v33, v35, v37, Width, (double)Height, 1.4142);
  }
  CGRect v96 = CGRectIntegral(*(CGRect *)&v41);
  double x = v96.origin.x;
  double y = v96.origin.y;
  double v47 = v96.size.width;
  double v48 = v96.size.height;
  v49 = (void *)MEMORY[0x22A641C70]();
  id v50 = a1;
  v51 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    v52 = HMFGetLogIdentifier();
    v97.origin.double x = x;
    v97.origin.double y = y;
    v97.size.width = v47;
    v97.size.height = v48;
    NSStringFromRect(v97);
    double v53 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    [v10 floatValue];
    *(_DWORD *)buf = 138544386;
    v86 = v52;
    __int16 v87 = 2112;
    double v88 = v53;
    __int16 v89 = 2048;
    double v90 = Size;
    __int16 v91 = 2048;
    CGFloat v92 = v13;
    __int16 v93 = 2048;
    double v94 = v54 * 57.2957795;
    _os_log_impl(&dword_225DC6000, v51, OS_LOG_TYPE_DEBUG, "%{public}@Cropping face %@ from pixel buffer with dimensions: %.1f x %.1f roll: %.02f degrees", buf, 0x34u);
  }
  BOOL v55 = v47 < 256.0;
  BOOL v56 = v48 < 256.0;
  if (v55 && v56) {
    double v57 = v48;
  }
  else {
    double v57 = 256.0;
  }
  if (v55 && v56) {
    double v58 = v47;
  }
  else {
    double v58 = 256.0;
  }
  id v84 = 0;
  v59 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a4, 1111970369, 8, &v84, x, y, v47, v48, v58, v57);
  double v60 = COERCE_DOUBLE(v84);
  if (v59)
  {
    float v61 = v31 - x;
    double v63 = v80;
    double v62 = v81;
    HMICGRectTransferToNewCoordinate(v31, v33, v81, v80, v58, v57, v61);
    [v10 floatValue];
    double v83 = v60;
    v64 = +[HMIVisionUtilities transferPixelBuffer:rotationAngle:crop:size:precision:error:](HMIVisionUtilities, "transferPixelBuffer:rotationAngle:crop:size:precision:error:", v59, 0, &v83);
    double v65 = COERCE_DOUBLE(*(id *)&v83);

    CVPixelBufferRelease(v59);
    v66 = (void *)MEMORY[0x22A641C70]();
    id v67 = v50;
    v68 = HMFGetOSLogHandle();
    v69 = v68;
    if (v64)
    {
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
      {
        v70 = HMFGetLogIdentifier();
        [v10 floatValue];
        *(_DWORD *)buf = 138543618;
        v86 = v70;
        __int16 v87 = 2048;
        double v88 = v71 * 57.2957795;
        _os_log_impl(&dword_225DC6000, v69, OS_LOG_TYPE_DEBUG, "%{public}@Face was rotated by:%.02f degrees", buf, 0x16u);
      }
LABEL_26:

      goto LABEL_27;
    }
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v76 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v86 = v76;
      __int16 v87 = 2112;
      double v88 = v65;
      _os_log_impl(&dword_225DC6000, v69, OS_LOG_TYPE_ERROR, "%{public}@Error in rotating the face %@.", buf, 0x16u);
    }
    double v60 = v65;
  }
  else
  {
    v72 = (void *)MEMORY[0x22A641C70]();
    id v73 = v50;
    v74 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
    {
      v75 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v86 = v75;
      __int16 v87 = 2112;
      double v88 = v60;
      _os_log_impl(&dword_225DC6000, v74, OS_LOG_TYPE_ERROR, "%{public}@Error pixel buffer type conversion %@.", buf, 0x16u);
    }
    double v63 = v80;
    double v62 = v81;
  }
  double v82 = v60;
  v64 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", a4, 1111970369, 8, &v82, v31, v33, v62, v63, 128.0, 128.0);
  double v65 = COERCE_DOUBLE(*(id *)&v82);

  if (!v64)
  {
    v66 = (void *)MEMORY[0x22A641C70]();
    id v77 = v50;
    v69 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      v78 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v86 = v78;
      __int16 v87 = 2112;
      double v88 = v65;
      _os_log_impl(&dword_225DC6000, v69, OS_LOG_TYPE_ERROR, "%{public}@HMIPrivateErrorCodeCropAndResizeFailed %@", buf, 0x16u);
    }
    v64 = 0;
    goto LABEL_26;
  }
LABEL_27:

  return v64;
}

+ (__CVBuffer)createFacePixelBufferForFaceEvent:(id)a3 pixelBuffer:(__CVBuffer *)a4 roll:(id)a5 error:(id *)a6
{
  id v9 = a5;
  [a3 boundingBox];
  HMICGRectFlipCoordinateSpaceNormalized(v10, v11, v12, v13);
  CGFloat v18 = objc_msgSend(MEMORY[0x263F1EED0], "faceObservationWithRequestRevision:unalignedBoundingBox:alignedBoundingBox:", 2, v14, v15, v16, v17, v14, v15, v16, v17);
  CGFloat v19 = +[HMIFaceprinter createFacePixelBufferForFaceDetection:v18 pixelBuffer:a4 roll:v9 error:a6];

  return v19;
}

- (__CVBuffer)createFacePixelBufferFromFaceCrop:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [v6 dataRepresentation];
  uint64_t v8 = +[HMIVisionUtilities createPixelBufferFromJPEGData:v7 error:a4];

  if (v8)
  {
    [v6 faceBoundingBox];
    double x = 0.0;
    v63.origin.double x = 0.0;
    v63.origin.double y = 0.0;
    v63.size.width = 1.0;
    v63.size.height = 1.0;
    if (CGRectEqualToRect(v59, v63))
    {
      double Width = (double)CVPixelBufferGetWidth(v8);
      double Height = (double)CVPixelBufferGetHeight(v8);
      double y = 0.0;
    }
    else
    {
      double Size = HMICVPixelBufferGetSize(v8);
      CGFloat v16 = v15;
      [v6 faceBoundingBox];
      HMICGRectSquareNormalized(v17, v18, v19, v20, Size, v16);
      double v25 = HMIExpandFaceRect(v21, v22, v23, v24, 1.76470578);
      HMICGRectPixelFromNormalized(v25, v26, v27, v28, Size, v16);
      CGRect v61 = CGRectIntegral(v60);
      double x = v61.origin.x;
      double y = v61.origin.y;
      double Width = v61.size.width;
      double Height = v61.size.height;
      CGFloat v29 = (void *)MEMORY[0x22A641C70]();
      double v30 = self;
      double v31 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        double v32 = HMFGetLogIdentifier();
        v62.origin.double x = x;
        v62.origin.double y = y;
        v62.size.width = Width;
        v62.size.height = Height;
        double v33 = NSStringFromRect(v62);
        *(_DWORD *)buf = 138544130;
        v51 = v32;
        __int16 v52 = 2112;
        double v53 = v33;
        __int16 v54 = 2048;
        double v55 = Size;
        __int16 v56 = 2048;
        CGFloat v57 = v16;
        _os_log_impl(&dword_225DC6000, v31, OS_LOG_TYPE_INFO, "%{public}@Cropping face %@ from face crop with dimensions %.1f x %.1f", buf, 0x2Au);
      }
    }
    BOOL v34 = Width < 256.0;
    BOOL v35 = Height < 256.0;
    if (v34 && v35) {
      double v36 = Height;
    }
    else {
      double v36 = 256.0;
    }
    if (v34 && v35) {
      double v37 = Width;
    }
    else {
      double v37 = 256.0;
    }
    id v49 = 0;
    float v38 = +[HMIVisionUtilities transferPixelBuffer:crop:size:pixelFormat:options:error:](HMIVisionUtilities, "transferPixelBuffer:crop:size:pixelFormat:options:error:", v8, 1111970369, 0, &v49, x, y, Width, Height, v37, v36);
    id v39 = v49;
    CVPixelBufferRelease(v8);
    if (v38)
    {
      double v40 = HMICGRectTransferToNewCoordinate(x, y, Width, Height, v37, v36, 0.0);
      id v48 = v39;
      CGFloat v13 = +[HMIVisionUtilities transferPixelBuffer:rotationAngle:crop:size:precision:error:](HMIVisionUtilities, "transferPixelBuffer:rotationAngle:crop:size:precision:error:", v38, 1, &v48, 0.0, v40, v41, v42, v43, 128.0, 128.0);
      id v44 = v48;

      CVBufferRelease(v38);
      id v39 = v44;
    }
    else
    {
      v45 = [MEMORY[0x263F087E8] hmiPrivateErrorWithCode:1021 underlyingError:v39];
      v46 = v45;
      if (a4) {
        *a4 = v45;
      }
      HMIErrorLog(self, v46);

      CGFloat v13 = 0;
    }
  }
  else
  {
    CGFloat v13 = 0;
  }

  return v13;
}

- (id)generateFaceprintForFaceCrop:(id)a3 error:(id *)a4
{
  id v6 = -[HMIFaceprinter createFacePixelBufferFromFaceCrop:error:](self, "createFacePixelBufferFromFaceCrop:error:", a3);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = [(HMIFaceprinter *)self createFaceprintForFacePixelBuffer:v6 fastMode:0 error:a4];
    CVBufferRelease(v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

- (id)updatedFaceprintsForFaceCrops:(id)a3 withExistingFaceprints:(id)a4 error:(id *)a5
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v86 objects:v97 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v87;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v87 != v11) {
          objc_enumerationMutation(obj);
        }
        CGFloat v13 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        double v14 = [v13 faceCropUUID];
        double v15 = [v8 objectForKey:v14];

        if (!v15)
        {
          double v15 = [MEMORY[0x263EFF9C0] set];
        }
        [v15 addObject:v13];
        CGFloat v16 = [v13 faceCropUUID];
        [v8 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v86 objects:v97 count:16];
    }
    while (v10);
  }

  float v71 = [MEMORY[0x263EFF9C0] set];
  v74 = [MEMORY[0x263EFF9C0] set];
  v69 = [MEMORY[0x263EFF9C0] set];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v77 = v6;
  uint64_t v17 = [v77 countByEnumeratingWithState:&v82 objects:v96 count:16];
  CGFloat v19 = self;
  if (v17)
  {
    uint64_t v20 = v17;
    uint64_t v21 = *(void *)v83;
    uint64_t v70 = *MEMORY[0x263F1F0F8];
    *(void *)&long long v18 = 138543362;
    long long v67 = v18;
    uint64_t v76 = *(void *)v83;
    v79 = v8;
    do
    {
      uint64_t v22 = 0;
      uint64_t v75 = v20;
      do
      {
        if (*(void *)v83 != v21) {
          objc_enumerationMutation(v77);
        }
        CGFloat v23 = *(void **)(*((void *)&v82 + 1) + 8 * v22);
        CGFloat v24 = objc_msgSend(v23, "UUID", v67);
        double v25 = [v8 objectForKey:v24];

        if (v25)
        {
          objc_msgSend(v25, "na_firstObjectPassingTest:", &__block_literal_global_15);
          id v27 = (id)objc_claimAutoreleasedReturnValue();
          CGFloat v28 = (void *)MEMORY[0x22A641C70]();
          CGFloat v29 = v19;
          double v30 = HMFGetOSLogHandle();
          BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
          if (v27)
          {
            if (v31)
            {
              HMFGetLogIdentifier();
              id v72 = v27;
              uint64_t v32 = v20;
              uint64_t v33 = v21;
              BOOL v34 = v19;
              v36 = BOOL v35 = v25;
              *(_DWORD *)buf = 138543618;
              __int16 v91 = v36;
              __int16 v92 = 2112;
              uint64_t v93 = (uint64_t)v23;
              _os_log_impl(&dword_225DC6000, v30, OS_LOG_TYPE_INFO, "%{public}@Using existing faceprint for face crop:%@", buf, 0x16u);

              double v25 = v35;
              CGFloat v19 = v34;
              uint64_t v21 = v33;
              uint64_t v20 = v32;
              id v27 = v72;
            }

            [v74 addObject:v27];
            uint64_t v8 = v79;
            goto LABEL_36;
          }
          if (v31)
          {
            HMFGetLogIdentifier();
            v38 = double v37 = v25;
            uint64_t v39 = [v37 count];
            *(_DWORD *)buf = 138543874;
            __int16 v91 = v38;
            __int16 v92 = 2048;
            uint64_t v93 = v39;
            __int16 v94 = 2112;
            uint64_t v95 = v23;
            _os_log_impl(&dword_225DC6000, v30, OS_LOG_TYPE_INFO, "%{public}@%lu faceprint(s) exist for face crop:%@ but are not the current version", buf, 0x20u);

            double v25 = v37;
          }

          uint64_t v26 = [v69 unionSet:v25];
        }
        double v80 = v25;
        double v40 = (void *)MEMORY[0x22A641C70](v26);
        double v41 = v19;
        double v42 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          double v43 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          __int16 v91 = v43;
          __int16 v92 = 2112;
          uint64_t v93 = (uint64_t)v23;
          _os_log_impl(&dword_225DC6000, v42, OS_LOG_TYPE_INFO, "%{public}@Faceprinting face crop:%@", buf, 0x16u);
        }
        id v81 = 0;
        id v44 = [(HMIFaceprinter *)v41 generateFaceprintForFaceCrop:v23 error:&v81];
        id v27 = v81;
        if (v44)
        {
          v45 = [v44 faceAttributes];
          v46 = [v45 facemaskCategory];

          double v47 = [v46 label];
          id v48 = [v47 identifier];
          int v49 = [v48 isEqualToString:v70];

          if (v49)
          {
            id v50 = (void *)MEMORY[0x22A641C70]();
            v51 = v41;
            __int16 v52 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              double v53 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v67;
              __int16 v91 = v53;
              _os_log_impl(&dword_225DC6000, v52, OS_LOG_TYPE_INFO, "%{public}@Face crop has a facemask, creating sentinel faceprint", buf, 0xCu);
            }
            __int16 v54 = [MEMORY[0x263F08C38] UUID];
            double v55 = +[HMIFaceprinter currentModelUUID];
            __int16 v56 = [v23 UUID];
            CGFloat v57 = +[HMIFaceprint sentinelFaceprintWithUUID:v54 modelUUID:v55 faceCropUUID:v56];
          }
          else
          {
            id v73 = [HMIFaceprint alloc];
            __int16 v54 = [MEMORY[0x263F08C38] UUID];
            double v55 = [v44 faceprint];
            __int16 v56 = [v55 descriptorData];
            NSRect v62 = +[HMIFaceprinter currentModelUUID];
            [v23 UUID];
            v64 = CGRect v63 = v46;
            CGFloat v57 = [(HMIFaceprint *)v73 initWithUUID:v54 data:v56 modelUUID:v62 faceCropUUID:v64];

            v46 = v63;
            CGFloat v19 = self;
          }

          [v71 addObject:v57];
          uint64_t v8 = v79;
          uint64_t v20 = v75;
          uint64_t v21 = v76;
        }
        else
        {
          uint64_t v58 = (void *)MEMORY[0x22A641C70]();
          CGRect v59 = v41;
          CGRect v60 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          {
            CGRect v61 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            __int16 v91 = v61;
            __int16 v92 = 2112;
            uint64_t v93 = (uint64_t)v27;
            _os_log_impl(&dword_225DC6000, v60, OS_LOG_TYPE_ERROR, "%{public}@Skipping crop, encountered error faceprinting: %@", buf, 0x16u);

            uint64_t v21 = v76;
          }

          uint64_t v8 = v79;
        }

        double v25 = v80;
LABEL_36:

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v77 countByEnumeratingWithState:&v82 objects:v96 count:16];
    }
    while (v20);
  }

  double v65 = [[HMIUpdatedFaceprintsResult alloc] initWithExistingAtCurrentVersion:v74 createdAtCurrentVersion:v71 existingAtOtherVersions:v69];
  return v65;
}

uint64_t __77__HMIFaceprinter_updatedFaceprintsForFaceCrops_withExistingFaceprints_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 modelUUID];
  id v3 = +[HMIFaceprinter currentModelUUID];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

+ (int64_t)_minorVersionFromVisionVersion:(int)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x22A641C70](a1, a2);
  id v6 = a1;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v10 = 138544386;
    uint64_t v11 = v8;
    __int16 v12 = 1024;
    int v13 = a3 >> 16;
    __int16 v14 = 1024;
    int v15 = BYTE1(a3);
    __int16 v16 = 1024;
    int v17 = a3;
    __int16 v18 = 1024;
    int v19 = a3;
    _os_log_impl(&dword_225DC6000, v7, OS_LOG_TYPE_INFO, "%{public}@Vision run-time version: %d.%02d.%02d (%d)", (uint8_t *)&v10, 0x24u);
  }
  return a3;
}

@end