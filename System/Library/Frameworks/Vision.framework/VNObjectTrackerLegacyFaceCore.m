@interface VNObjectTrackerLegacyFaceCore
+ (Class)trackerObservationClass;
+ (id)_convertOptionsToFaceCoreDetectOptions:(id)a3;
+ (id)_convertOptionsToFaceCoreExtractOptions:(id)a3;
+ (id)_convertOptionsToFaceCoreSetupOptions:(id)a3;
+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4;
- (BOOL)isResettable;
- (BOOL)reset:(id *)a3;
- (VNObjectTrackerLegacyFaceCore)initWithOptions:(id)a3 error:(id *)a4;
- (id)_detectFacesInImage:(id)a3 error:(id *)a4;
- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5;
- (id)trackInFrame:(id)a3 error:(id *)a4;
@end

@implementation VNObjectTrackerLegacyFaceCore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractOptions, 0);
  objc_storeStrong((id *)&self->_detectOptions, 0);

  objc_storeStrong((id *)&self->_detector, 0);
}

- (id)_detectFacesInImage:(id)a3 error:(id *)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 width];
  uint64_t v8 = [v6 height];
  uint64_t v9 = [v6 originalCGImage];
  if (v9)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F45DF0]) initWithCGImage:v9];
  }
  else
  {
    v29 = (__CVBuffer *)[v6 bufferWithWidth:v7 height:v8 format:1111970369 options:0 error:a4];
    if (v29) {
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F45DF0]) initWithCVPixelBuffer:v29];
    }
    else {
      v10 = 0;
    }
    apple::vision::CVPixelBufferWrapper::~CVPixelBufferWrapper(&v29);
  }
  v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2064;
  v33 = __Block_byref_object_dispose__2065;
  id v34 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VNObjectTrackerLegacyFaceCore__detectFacesInImage_error___block_invoke;
  aBlock[3] = &unk_1E5B1C1E8;
  aBlock[4] = self;
  id v11 = v10;
  uint64_t v27 = v7;
  uint64_t v28 = v8;
  id v25 = v11;
  v26 = &v29;
  v12 = _Block_copy(aBlock);
  if (VNExecuteBlock(v12, (uint64_t)a4))
  {
    v13 = [(VNTracker *)self key];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v14 = v30[5];
    uint64_t v15 = [(__CVBuffer *)v14 countByEnumeratingWithState:&v20 objects:v35 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "setUUID:", v13, (void)v20);
        }
        uint64_t v15 = [(__CVBuffer *)v14 countByEnumeratingWithState:&v20 objects:v35 count:16];
      }
      while (v15);
    }

    v18 = v30[5];
  }
  else
  {
    v18 = 0;
  }

  _Block_object_dispose(&v29, 8);

  return v18;
}

uint64_t __59__VNObjectTrackerLegacyFaceCore__detectFacesInImage_error___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = [*(id *)(a1[4] + 96) detectFacesInImage:a1[5] options:*(void *)(a1[4] + 104) error:a2];
  if (!v4) {
    return 0;
  }
  if ([*(id *)(a1[4] + 112) count])
  {
    uint64_t v5 = [*(id *)(a1[4] + 96) extractDetailsForFaces:v4 inImage:a1[5] options:*(void *)(a1[4] + 112) error:a2];

    v4 = (void *)v5;
    if (!v5) {
      return 0;
    }
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v32;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v31 + 1) + 8 * v10);
        v12 = [VNFaceLegacyFaceCore alloc];
        v13 = -[VNFaceLegacyFaceCore initWithFace:](v12, "initWithFace:", v11, (void)v31);
        [(VNFaceLegacyFaceCore *)v13 faceBoundingBox];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        unint64_t v21 = a1[7];
        double v22 = 0.0;
        double v23 = 0.0;
        double v24 = 0.0;
        if (v21)
        {
          double v23 = v16 / (double)v21;
          double v24 = v20 / (double)v21;
        }
        unint64_t v25 = a1[8];
        double v26 = 0.0;
        if (v25)
        {
          double v22 = v18 / (double)v25;
          double v26 = v14 / (double)v25;
        }
        uint64_t v27 = +[VNFaceObservation faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:](VNFaceObservation, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", 3737841665, 0, 0, 0, v23, v22, v24, v26, v18);
        [v27 setLegacyFaceCore:v13];
        [v6 addObject:v27];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v8);
  }

  uint64_t v28 = *(void *)(a1[6] + 8);
  v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v6;

  return 1;
}

- (BOOL)reset:(id *)a3
{
  return 1;
}

- (id)trackInFrame:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(VNTracker *)self isTracking])
  {
    id v7 = [(VNObjectTrackerLegacyFaceCore *)self _detectFacesInImage:v6 error:a4];
    if (v7)
    {
      [(VNTracker *)self setTrackedFrameNumber:[(VNTracker *)self trackedFrameNumber] + 1];
      id v8 = v7;
    }
  }
  else if (a4)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error: Tracker is not initialized"];
    id v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)setTrackedObjects:(id)a3 inFrame:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if ([(VNTracker *)self isTracking])
  {
    if (a5)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error: Tracker is busy with previous tracking requests. It needs to be reset to restart tracking sequence"];
      id v8 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    uint64_t v9 = [(VNObjectTrackerLegacyFaceCore *)self _detectFacesInImage:v7 error:a5];
    id v8 = v9;
    if (v9)
    {
      if ([v9 count])
      {
        uint64_t v10 = [v8 firstObject];
        [v10 boundingBox];
        -[VNTracker setLastTrackedBBox:](self, "setLastTrackedBBox:");

        [(VNTracker *)self setTrackedFrameNumber:0];
      }
      id v11 = v8;
    }
  }

  return v8;
}

- (VNObjectTrackerLegacyFaceCore)initWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VNObjectTrackerLegacyFaceCore;
  id v7 = [(VNTracker *)&v22 initWithOptions:v6 error:a4];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = [(VNTracker *)v7 level];
    if ([v9 isEqualToString:@"VNTrackingOption_TrackingLevelFast"])
    {
      uint64_t v10 = FCRKeypointTrackingParameters();
      [v8 addEntriesFromDictionary:v10];
    }
    else
    {
      if (![v9 isEqualToString:@"VNTrackingOption_TrackingLevelAccurate"])
      {
        if (a4)
        {
          double v20 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error: Unsupported/unimplemented tracking level by FaceCore"];
          goto LABEL_13;
        }
LABEL_14:
        id v11 = 0;
        goto LABEL_15;
      }
      uint64_t v10 = FCRStandardTrackingParameters();
      [v8 addEntriesFromDictionary:v10];
    }

    v12 = objc_opt_class();
    v13 = [v12 _convertOptionsToFaceCoreSetupOptions:v6];
    [v8 addEntriesFromDictionary:v13];

    uint64_t v14 = [v12 _convertOptionsToFaceCoreDetectOptions:v6];
    detectOptions = v7->_detectOptions;
    v7->_detectOptions = (NSDictionary *)v14;

    uint64_t v16 = [v12 _convertOptionsToFaceCoreExtractOptions:v6];
    extractOptions = v7->_extractOptions;
    v7->_extractOptions = (NSDictionary *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F45DE8]) initWithOptions:v8];
    detector = v7->_detector;
    v7->_detector = (FaceCoreDetector *)v18;

    if (v7->_detector)
    {
      id v11 = v7;
LABEL_15:

      goto LABEL_16;
    }
    if (a4)
    {
      double v20 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Internal error: Failed to initialize FaceCore detector"];
LABEL_13:
      id v11 = 0;
      *a4 = v20;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)isResettable
{
  return 0;
}

+ (id)_convertOptionsToFaceCoreExtractOptions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    uint64_t v18 = *MEMORY[0x1E4F45D90];
    uint64_t v19 = *MEMORY[0x1E4F45D88];
    uint64_t v7 = *MEMORY[0x1E4F45D80];
    uint64_t v8 = *MEMORY[0x1E4F45D78];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [v3 objectForKey:v10];
        char v12 = [v10 isEqualToString:@"VNTrackObjectPrivateRevisionLegacyCoreProcessOption_EnhanceEyesAndMouthLocalization"];
        uint64_t v13 = v8;
        if ((v12 & 1) != 0
          || (v14 = objc_msgSend(v10, "isEqualToString:", @"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_ExtractBlink", v8), v13 = v7, (v14 & 1) != 0)|| (char v15 = objc_msgSend(v10, "isEqualToString:", @"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_ExtractSmile", v7), v13 = v19, (v15 & 1) != 0)|| (v16 = objc_msgSend(v10, "isEqualToString:", @"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_KalmanFilter", v19), v13 = v18,
              v16))
        {
          [v4 setValue:v11 forKey:v13];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (id)_convertOptionsToFaceCoreDetectOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = *MEMORY[0x1E4F45D70];
    uint64_t v8 = *MEMORY[0x1E4F45D60];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v3 objectForKey:v10];
        char v12 = [v10 isEqualToString:@"VNTrackObjectPrivateRevisionLegacyCoreProcessOption_EnhanceEyesAndMouthLocalization"];
        uint64_t v13 = v8;
        if ((v12 & 1) != 0
          || (int v14 = objc_msgSend(v10, "isEqualToString:", @"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_KalmanFilter", v8), v13 = v7, v14))
        {
          [v4 setValue:v11 forKey:v13];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (id)_convertOptionsToFaceCoreSetupOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [v3 allKeys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    uint64_t v7 = *MEMORY[0x1E4F45DE0];
    uint64_t v8 = *MEMORY[0x1E4F45DD8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v11 = [v3 objectForKey:v10];
        char v12 = [v10 isEqualToString:@"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_MinFaceSize"];
        uint64_t v13 = v8;
        if ((v12 & 1) != 0
          || (int v14 = objc_msgSend(v10, "isEqualToString:", @"VNTrackObjectPrivateRevisionLegacyFaceCoreProcessOption_NumberOfDetectionAngles", v8), v13 = v7, v14))
        {
          [v4 setValue:v11 forKey:v13];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }

  return v4;
}

+ (Class)trackerObservationClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedComputeDevicesForOptions:(id)a3 error:(id *)a4
{
  v4 = +[VNComputeDeviceUtilities allCPUComputeDevices];

  return v4;
}

@end