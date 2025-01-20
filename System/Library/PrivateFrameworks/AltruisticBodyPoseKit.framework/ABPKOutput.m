@interface ABPKOutput
- (ABPK2dSkeleton)detection2dSkeletonABPK;
- (ABPK2dSkeleton)rawDetection2dSkeletonABPK;
- (ABPK2dSkeleton)registered2dSkeletonABPK;
- (ABPKAlgorithmParams)algorithmParams;
- (ABPKAlgorithmState)algState;
- (ABPKCameraParams)cameraParams;
- (ABPKOutput)init;
- (ABPKSkeleton)liftingSkeletonABPK;
- (ABPKSkeleton)retargetedSkeletonABPK;
- (BOOL)convertToStreamingDictionary:(id)a3 withSkeletonType:(id)a4 referenceFrame:(id)a5 includeFingerRotation:(BOOL)a6 yOffset:(float)a7;
- (__CVBuffer)mlImage;
- (__CVBuffer)mlOverlayImage;
- (double)timestamp;
- (float)timeABPKAlgorithmFinished;
- (float)timeABPKAlgorithmStart;
- (id)getDetection2dSkeletonABPKArray;
- (int)algorithmReturnCode;
- (int)saveDataToDir:(id)a3 withFileNamePrefix:(id)a4;
- (int)saveOnlyPoseDataToDir:(id)a3 withFileNamePrefix:(id)a4;
- (uint64_t)overlayResultsOnImage:(__n128)a3 withCameraIntrinsics:(__n128)a4 withConfig:(uint64_t)a5;
- (uint64_t)overlayResultsOnImage:(uint64_t)a3 withCameraIntrinsics:;
- (uint64_t)rawLiftingNetworkOutputJoints;
- (void)dealloc;
- (void)setAlgState:(id)a3;
- (void)setAlgorithmParams:(id)a3;
- (void)setAlgorithmReturnCode:(int)a3;
- (void)setCameraParams:(id)a3;
- (void)setDetection2dSkeletonABPK:(id)a3;
- (void)setLiftingSkeletonABPK:(id)a3;
- (void)setMlImage:(__CVBuffer *)a3;
- (void)setMlOverlayImage:(__CVBuffer *)a3;
- (void)setRawDetection2dSkeletonABPK:(id)a3;
- (void)setRawDetection2dSkeletonABPKArray:(id)a3;
- (void)setRawLiftingNetworkOutputJoints:(ABPKOutput *)self;
- (void)setRegistered2dSkeletonABPK:(id)a3;
- (void)setRetargetedSkeletonABPK:(id)a3;
- (void)setTimeABPKAlgorithmFinished:(float)a3;
- (void)setTimeABPKAlgorithmStart:(float)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation ABPKOutput

- (ABPKOutput)init
{
  v10.receiver = self;
  v10.super_class = (Class)ABPKOutput;
  v2 = [(ABPKOutput *)&v10 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    rawDetection2dSkeletonABPKArray = v2->_rawDetection2dSkeletonABPKArray;
    v2->_rawDetection2dSkeletonABPKArray = v3;

    p_vtPixelTransferSession = (CFTypeRef *)&v2->_vtPixelTransferSession;
    if (!VTPixelTransferSessionCreate(0, &v2->_vtPixelTransferSession))
    {
      v7 = v2;
      goto LABEL_8;
    }
    CFRelease(*p_vtPixelTransferSession);
    CFTypeRef *p_vtPixelTransferSession = 0;
    v6 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21B7C6000, v6, OS_LOG_TYPE_ERROR, " Unable to create pixel transfer session for image downscaling ", v9, 2u);
    }
  }
  v7 = 0;
LABEL_8:

  return v7;
}

- (void)dealloc
{
  vtPixelTransferSession = self->_vtPixelTransferSession;
  if (vtPixelTransferSession) {
    CFRelease(vtPixelTransferSession);
  }
  if ([(ABPKOutput *)self mlOverlayImage]) {
    CVPixelBufferRelease([(ABPKOutput *)self mlOverlayImage]);
  }
  v4.receiver = self;
  v4.super_class = (Class)ABPKOutput;
  [(ABPKOutput *)&v4 dealloc];
}

- (id)getDetection2dSkeletonABPKArray
{
  return self->_rawDetection2dSkeletonABPKArray;
}

- (void)setRawDetection2dSkeletonABPKArray:(id)a3
{
}

- (int)saveDataToDir:(id)a3 withFileNamePrefix:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ABPKOutput *)self timestamp];
  uint64_t v9 = v8;
  objc_super v10 = [NSString stringWithFormat:@"%@_%@_%f.png", v7, @"mlimage", v8];
  v11 = [v6 stringByAppendingPathComponent:v10];
  writeImage([(ABPKOutput *)self mlImage], v11);
  v12 = [NSString stringWithFormat:@"%@_%@_%f.png", v7, @"mloverlayimage", v9];
  v13 = [v6 stringByAppendingPathComponent:v12];
  if ([(ABPKOutput *)self mlOverlayImage]) {
    writeImage([(ABPKOutput *)self mlOverlayImage], v13);
  }
  [(ABPKOutput *)self saveOnlyPoseDataToDir:v6 withFileNamePrefix:v7];

  return 0;
}

- (int)saveOnlyPoseDataToDir:(id)a3 withFileNamePrefix:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v46 = a3;
  id v43 = a4;
  [(ABPKOutput *)self timestamp];
  v44 = [NSString stringWithFormat:@"%@_%f.plist", v43, v6];
  v45 = objc_msgSend(v46, "stringByAppendingPathComponent:");
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = NSNumber;
  [(ABPKOutput *)self timestamp];
  uint64_t v9 = objc_msgSend(v8, "numberWithDouble:");
  [v7 setObject:v9 forKey:@"timestamp"];

  objc_super v10 = [(ABPKOutput *)self algorithmParams];

  if (v10)
  {
    v11 = [(ABPKOutput *)self algorithmParams];
    v12 = [v11 toDict];
    [v7 setObject:v12 forKey:@"algorithm_params"];
  }
  else
  {
    [v7 setObject:@"nil" forKey:@"algorithm_params"];
  }
  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v14 = [(ABPKOutput *)self algState];
  int v15 = [v14 detection2d];

  if (v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v17 = self->_rawDetection2dSkeletonABPKArray;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v48;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v48 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = [*(id *)(*((void *)&v47 + 1) + 8 * v20) toDictionary];
          [v16 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v18);
    }

    [v13 setObject:v16 forKey:@"raw_detection_2d_array"];
    v22 = [(ABPKOutput *)self rawDetection2dSkeletonABPK];
    v23 = [v22 toDictionary];
    [v13 setObject:v23 forKey:@"raw_detection_2d"];

    v24 = [(ABPKOutput *)self detection2dSkeletonABPK];
    v25 = [v24 toDictionary];
    [v13 setObject:v25 forKey:@"detection_2d"];

    v26 = [(ABPKOutput *)self algState];
    if ([v26 lifting3d])
    {
      v27 = [(ABPKOutput *)self algState];
      int v28 = [v27 registration];

      if (!v28) {
        goto LABEL_16;
      }
      v26 = [(ABPKOutput *)self liftingSkeletonABPK];
      v29 = [v26 toDictionary];
      [v13 setObject:v29 forKey:@"lifting"];
    }
LABEL_16:
    v30 = [(ABPKOutput *)self algState];
    if ([v30 retargeting])
    {
      v31 = [(ABPKOutput *)self algState];
      int v32 = [v31 registration];

      if (!v32)
      {
LABEL_20:

        goto LABEL_21;
      }
      v30 = [(ABPKOutput *)self retargetedSkeletonABPK];
      v33 = [v30 toDictionary];
      [v13 setObject:v33 forKey:@"arvino"];
    }
    goto LABEL_20;
  }
LABEL_21:
  [v7 setObject:v13 forKey:@"skeleton_data"];
  v34 = [(ABPKOutput *)self algState];
  v35 = [v34 toDict];
  [v7 setObject:v35 forKey:@"algorithm_state"];

  v36 = objc_msgSend(NSNumber, "numberWithInt:", -[ABPKOutput algorithmReturnCode](self, "algorithmReturnCode"));
  [v7 setObject:v36 forKey:@"algorithm_return_code"];

  v37 = NSNumber;
  [(ABPKOutput *)self timeABPKAlgorithmFinished];
  float v39 = v38;
  [(ABPKOutput *)self timeABPKAlgorithmStart];
  v41 = [v37 numberWithDouble:(float)(v39 - v40) * 1000.0];
  [v7 setObject:v41 forKey:@"algorithm_compute_time"];

  [v7 writeToFile:v45 atomically:0];
  return 0;
}

- (uint64_t)overlayResultsOnImage:(uint64_t)a3 withCameraIntrinsics:
{
  return objc_msgSend(a1, "overlayResultsOnImage:withCameraIntrinsics:withConfig:", a3, @"yyyyn");
}

- (uint64_t)overlayResultsOnImage:(__n128)a3 withCameraIntrinsics:(__n128)a4 withConfig:(uint64_t)a5
{
  v68[1] = *MEMORY[0x263EF8340];
  id v9 = a7;
  if ([v9 length] != 5)
  {
    v21 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = " Invalid overlay code ";
      v23 = v21;
      os_log_type_t v24 = OS_LOG_TYPE_ERROR;
LABEL_59:
      _os_log_impl(&dword_21B7C6000, v23, v24, v22, buf, 2u);
      goto LABEL_60;
    }
    goto LABEL_60;
  }
  objc_super v10 = objc_msgSend(v9, "substringWithRange:", 0, 1);
  int v11 = [v10 isEqual:@"y"];

  v12 = objc_msgSend(v9, "substringWithRange:", 1, 1);
  int v13 = [v12 isEqual:@"y"];

  v14 = objc_msgSend(v9, "substringWithRange:", 2, 1);
  int v55 = [v14 isEqual:@"y"];

  int v15 = objc_msgSend(v9, "substringWithRange:", 3, 1);
  int v54 = [v15 isEqual:@"y"];

  id v16 = objc_msgSend(v9, "substringWithRange:", 4, 1);
  int v17 = [v16 isEqual:@"y"];

  unint64_t Width = CVPixelBufferGetWidth(a6);
  unint64_t Height = CVPixelBufferGetHeight(a6);
  if (![(id)a1 mlOverlayImage])
  {
    uint64_t v67 = *MEMORY[0x263F04130];
    v68[0] = MEMORY[0x263EFFA78];
    v21 = [NSDictionary dictionaryWithObjects:v68 forKeys:&v67 count:1];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x42475241u, (CFDictionaryRef)v21, (CVPixelBufferRef *)(a1 + 136)))
    {
      v25 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v25, OS_LOG_TYPE_ERROR, " Could not create pixelbuffer for image overlay ", buf, 2u);
      }

      goto LABEL_60;
    }
  }
  if (!*(void *)(a1 + 16))
  {
    uint64_t v65 = *MEMORY[0x263F04130];
    uint64_t v66 = MEMORY[0x263EFFA78];
    v21 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], Width, Height, 0x42475241u, (CFDictionaryRef)v21, (CVPixelBufferRef *)(a1 + 16)))
    {
      v26 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v26, OS_LOG_TYPE_ERROR, " Could not create _imageYCbCr buffer ", buf, 2u);
      }

      uint64_t v27 = 4294960636;
      goto LABEL_61;
    }
  }
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a6);
  if (PixelFormatType == 32)
  {
LABEL_7:
    *(void *)(a1 + 16) = a6;
    goto LABEL_19;
  }
  if (PixelFormatType != 1278226488)
  {
    if (PixelFormatType != 1111970369) {
      goto LABEL_19;
    }
    goto LABEL_7;
  }
  convertFormatGrayScaleToARGB_BGRA(a6, (CVPixelBufferRef *)(a1 + 16));
LABEL_19:
  int v28 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 8), *(CVPixelBufferRef *)(a1 + 16), *(CVPixelBufferRef *)(a1 + 136));
  if (!v17)
  {
    v31 = [(id)a1 algState];
    int v32 = [v31 detection2d];

    if ((v32 & v11) != 0)
    {
      v33 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v33, OS_LOG_TYPE_DEBUG, " Overlay raw 2d skeleton ", buf, 2u);
      }

      v34 = [(id)a1 rawDetection2dSkeletonABPK];
      int v28 = overlay2dResultOnImage(v34, *(void *)(a1 + 136), *(void *)(a1 + 136), COERCE_DOUBLE(255));
    }
    v35 = [(id)a1 algState];
    int v36 = [v35 detection2d];

    if ((v36 & v13) != 0)
    {
      v37 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v37, OS_LOG_TYPE_DEBUG, " Overlay 2d skeleton ", buf, 2u);
      }

      float v38 = [(id)a1 detection2dSkeletonABPK];
      int v28 = overlay2dResultOnImage(v38, *(void *)(a1 + 136), *(void *)(a1 + 136), COERCE_DOUBLE(0xFF00000000));
    }
    float v39 = [(id)a1 algState];
    if ([v39 lifting3d])
    {
      float v40 = [(id)a1 algState];
      int v41 = [v40 registration];

      if ((v41 & v55) == 0)
      {
LABEL_38:
        id v43 = [(id)a1 algState];
        if (![v43 retargeting])
        {
LABEL_54:

          goto LABEL_55;
        }
        v44 = [(id)a1 algState];
        int v45 = [v44 registration];

        if ((v45 & v54) != 0)
        {
          id v46 = __ABPKLogSharedInstance();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21B7C6000, v46, OS_LOG_TYPE_DEBUG, " Overlay retargeted skeleton ", buf, 2u);
          }

          id v43 = [(id)a1 retargetedSkeletonABPK];
          int v28 = overlay3dResultOnImage(v43, *(void *)(a1 + 136), *(void *)(a1 + 136), a2, a3, a4, (double)Width, (double)Height, (__n128)xmmword_21B813590);
          goto LABEL_54;
        }
LABEL_55:
        if (!v28)
        {
          uint64_t v27 = 0;
          goto LABEL_62;
        }
        v21 = __ABPKLogSharedInstance();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_60;
        }
        *(_WORD *)buf = 0;
        v22 = " Could not overlay image ";
        goto LABEL_58;
      }
      v42 = __ABPKLogSharedInstance();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B7C6000, v42, OS_LOG_TYPE_DEBUG, " Overlay 3d skeleton ", buf, 2u);
      }

      float v39 = [(id)a1 liftingSkeletonABPK];
      int v28 = overlay3dResultOnImage(v39, *(void *)(a1 + 136), *(void *)(a1 + 136), a2, a3, a4, (double)Width, (double)Height, (__n128)xmmword_21B813580);
    }

    goto LABEL_38;
  }
  v29 = [(id)a1 algState];
  int v30 = [v29 detection2d];

  if (!v30) {
    goto LABEL_55;
  }
  if ((v11 | v13 | v55 | v54) != 1)
  {
    long long v47 = __ABPKLogSharedInstance();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B7C6000, v47, OS_LOG_TYPE_DEBUG, " Overlay 2d face ", buf, 2u);
    }

    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v43 = *(id *)(a1 + 24);
    uint64_t v48 = [v43 countByEnumeratingWithState:&v59 objects:v64 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v60 != v49) {
            objc_enumerationMutation(v43);
          }
          v51.n128_u64[0] = 255;
          v51.n128_u64[1] = 255;
          int v52 = drawFullyVisibleFace(*(void **)(*((void *)&v59 + 1) + 8 * i), *(void *)(a1 + 136), *(void *)(a1 + 136), v51);
        }
        int v28 = v52;
        uint64_t v48 = [v43 countByEnumeratingWithState:&v59 objects:v64 count:16];
      }
      while (v48);
    }
    goto LABEL_54;
  }
  v21 = __ABPKLogSharedInstance();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v22 = " Face visualization should be drawn cleanly. Please make sure the first four letters in overlay string are all"
          " 'n' when the fifth is 'y'. ";
LABEL_58:
    v23 = v21;
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_59;
  }
LABEL_60:
  uint64_t v27 = 4294960630;
LABEL_61:

LABEL_62:
  return v27;
}

- (BOOL)convertToStreamingDictionary:(id)a3 withSkeletonType:(id)a4 referenceFrame:(id)a5 includeFingerRotation:(BOOL)a6 yOffset:(float)a7
{
  v77[3] = *MEMORY[0x263EF8340];
  id v65 = a3;
  id v68 = a4;
  id v67 = a5;
  id v69 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v74 = [(ABPKOutput *)self liftingSkeletonABPK];
  if ([v68 isEqual:@"Arvino"])
  {
    id v11 = [(ABPKOutput *)self retargetedSkeletonABPK];
  }
  else
  {
    id v11 = v74;
  }
  id v74 = v11;
  [v11 cameraRootTransform];
  __n128 v64 = v12;
  __n128 v63 = v13;
  __n128 v62 = v14;
  __n128 v61 = v15;
  [v11 deviceRootTransform];
  __n128 v59 = v16;
  __n128 v58 = v17;
  __n128 v57 = v18;
  __n128 v60 = v19;
  uint64_t v20 = [v11 skeletonDefinition];
  uint64_t v21 = [v20 jointCount];

  v56[1] = v56;
  v22 = (char *)v56 - ((4 * v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = &v56[-2 * v21];
  v71 = v72;
  for (unint64_t i = 0; ; ++i)
  {
    os_log_type_t v24 = [v74 skeletonDefinition];
    unint64_t v25 = [v24 jointCount];

    if (i >= v25) {
      break;
    }
    *(_DWORD *)&v22[4 * i] = 1056964608;
  }
  if ([v67 isEqual:@"Global"]) {
    [v74 getGlobalJointDataForSkeletonWithPosition:v72 withOrientation:v71];
  }
  else {
    [v74 getLocalJointDataForSkeletonWithPosition:v72 withOrientation:v71];
  }
  uint64_t v70 = v21;
  uint64_t v66 = self;
  id v73 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  if (v70 >= 1)
  {
    for (uint64_t j = 0; j != v70; ++j)
    {
      id v27 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      int v28 = [v74 skeletonDefinition];
      v29 = [v28 jointName:j];

      LODWORD(v30) = *(_DWORD *)&v22[4 * j];
      v31 = [NSNumber numberWithFloat:v30];
      [v27 setObject:v31 forKey:@"confidence"];

      long long v75 = *(_OWORD *)&v72[2 * j];
      int v32 = objc_msgSend(NSNumber, "numberWithFloat:");
      v77[0] = v32;
      HIDWORD(v33) = DWORD1(v75);
      LODWORD(v33) = DWORD1(v75);
      v34 = [NSNumber numberWithFloat:v33];
      v77[1] = v34;
      v35 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v75), DWORD2(v75))));
      v77[2] = v35;
      int v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v77 count:3];
      [v27 setObject:v36 forKey:@"translation"];

      long long v75 = *(_OWORD *)&v71[2 * j];
      v37 = objc_msgSend(NSNumber, "numberWithFloat:");
      v76[0] = v37;
      HIDWORD(v38) = DWORD1(v75);
      LODWORD(v38) = DWORD1(v75);
      float v39 = [NSNumber numberWithFloat:v38];
      v76[1] = v39;
      float v40 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v75), HIDWORD(v75))));
      v76[2] = v40;
      int v41 = objc_msgSend(NSNumber, "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v75), DWORD2(v75))));
      v76[3] = v41;
      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:4];
      [v27 setObject:v42 forKey:@"orientation"];

      [v73 setObject:v27 forKey:v29];
    }
  }
  [v69 setObject:v73 forKey:@"body_joints"];
  id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v44 = simdMatrix4x4ToNSArray(v64, v63, v62, v61);
  [v43 setObject:v44 forKey:@"camera_root_pose"];

  __n128 v45 = v60;
  v45.n128_f32[1] = v60.n128_f32[1] + a7;
  id v46 = simdMatrix4x4ToNSArray(v59, v58, v57, v45);
  [v43 setObject:v46 forKey:@"device_root_pose"];

  [(ABPKOutput *)v66 timestamp];
  *(float *)&double v47 = v47;
  uint64_t v48 = [NSNumber numberWithFloat:v47];
  [v43 setObject:v48 forKey:@"timestamp"];

  if (![v68 isEqual:@"Lifting"])
  {
    uint64_t v49 = [(ABPKOutput *)v66 algState];
    if ([v49 retargeting])
    {
      v53 = [(ABPKOutput *)v66 algState];
      char v54 = [v53 registration];

      if (v54)
      {
        uint64_t v52 = MEMORY[0x263EFFA88];
        goto LABEL_23;
      }
LABEL_22:
      uint64_t v52 = MEMORY[0x263EFFA80];
      goto LABEL_23;
    }
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v49 = [(ABPKOutput *)v66 algState];
  if (([v49 lifting3d] & 1) == 0) {
    goto LABEL_21;
  }
  long long v50 = [(ABPKOutput *)v66 algState];
  int v51 = [v50 registration];

  if (v51) {
    uint64_t v52 = MEMORY[0x263EFFA88];
  }
  else {
    uint64_t v52 = MEMORY[0x263EFFA80];
  }
LABEL_23:
  [v43 setObject:v52 forKey:@"pose_validity"];
  [v69 setObject:v43 forKey:@"result_context"];
  [v69 setObject:v67 forKey:@"joint_transform_type"];
  [v69 setObject:v68 forKey:@"skeleton_type"];
  [v65 setObject:v69 forKey:@"result_abpk"];

  return 1;
}

- (float)timeABPKAlgorithmFinished
{
  return self->_timeABPKAlgorithmFinished;
}

- (void)setTimeABPKAlgorithmFinished:(float)a3
{
  self->_timeABPKAlgorithmFinished = a3;
}

- (float)timeABPKAlgorithmStart
{
  return self->_timeABPKAlgorithmStart;
}

- (void)setTimeABPKAlgorithmStart:(float)a3
{
  self->_timeABPKAlgorithmStart = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (__CVBuffer)mlImage
{
  return self->_mlImage;
}

- (void)setMlImage:(__CVBuffer *)a3
{
  self->_mlImage = a3;
}

- (ABPKCameraParams)cameraParams
{
  return (ABPKCameraParams *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCameraParams:(id)a3
{
}

- (ABPK2dSkeleton)rawDetection2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRawDetection2dSkeletonABPK:(id)a3
{
}

- (ABPK2dSkeleton)detection2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDetection2dSkeletonABPK:(id)a3
{
}

- (ABPKSkeleton)liftingSkeletonABPK
{
  return (ABPKSkeleton *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLiftingSkeletonABPK:(id)a3
{
}

- (uint64_t)rawLiftingNetworkOutputJoints
{
  return *(void *)(a1 + 96);
}

- (void)setRawLiftingNetworkOutputJoints:(ABPKOutput *)self
{
  *(void *)self->_rawLiftingNetworkOutputJoints = v2;
}

- (ABPK2dSkeleton)registered2dSkeletonABPK
{
  return (ABPK2dSkeleton *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRegistered2dSkeletonABPK:(id)a3
{
}

- (ABPKSkeleton)retargetedSkeletonABPK
{
  return (ABPKSkeleton *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRetargetedSkeletonABPK:(id)a3
{
}

- (ABPKAlgorithmParams)algorithmParams
{
  return (ABPKAlgorithmParams *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAlgorithmParams:(id)a3
{
}

- (int)algorithmReturnCode
{
  return self->_algorithmReturnCode;
}

- (void)setAlgorithmReturnCode:(int)a3
{
  self->_algorithmReturnCode = a3;
}

- (ABPKAlgorithmState)algState
{
  return (ABPKAlgorithmState *)objc_getProperty(self, a2, 128, 1);
}

- (void)setAlgState:(id)a3
{
}

- (__CVBuffer)mlOverlayImage
{
  return self->_mlOverlayImage;
}

- (void)setMlOverlayImage:(__CVBuffer *)a3
{
  self->_mlOverlayImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_algState, 0);
  objc_storeStrong((id *)&self->_algorithmParams, 0);
  objc_storeStrong((id *)&self->_retargetedSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_registered2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_liftingSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_detection2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPK, 0);
  objc_storeStrong((id *)&self->_cameraParams, 0);
  objc_storeStrong((id *)&self->_rawDetection2dSkeletonABPKArray, 0);
}

@end