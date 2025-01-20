@interface ARFaceTrackingManager
+ (BOOL)isSupported;
+ (void)initialize;
- (ARFaceTrackingManager)init;
- (ARFaceTrackingManager)initWithMaximumNumberOfTrackedFaces:(int64_t)a3 options:(id)a4;
- (ARFaceTrackingManager)initWithOptions:(id)a3;
- (BOOL)isEqual:(id)a3;
- (id)faceTrackingOptionsFromImageData:(id)a3 withCallback:(id)a4;
- (id)processData:(id)a3;
- (int64_t)maximumNumberOfTrackedFaces;
- (void)dealloc;
@end

@implementation ARFaceTrackingManager

+ (void)initialize
{
  if (+[ARFaceTrackingManager initialize]::onceToken[0] != -1) {
    dispatch_once(+[ARFaceTrackingManager initialize]::onceToken, &__block_literal_global_53);
  }
}

void __35__ARFaceTrackingManager_initialize__block_invoke()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(1);
  v1 = (void *)s_faceTrackingSemaphore;
  s_faceTrackingSemaphore = (uint64_t)v0;
}

- (ARFaceTrackingManager)initWithOptions:(id)a3
{
  return [(ARFaceTrackingManager *)self initWithMaximumNumberOfTrackedFaces:1 options:a3];
}

- (ARFaceTrackingManager)initWithMaximumNumberOfTrackedFaces:(int64_t)a3 options:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!+[ARFaceTrackingManager isSupported])
  {
    v9 = 0;
    goto LABEL_8;
  }
  v15.receiver = self;
  v15.super_class = (Class)ARFaceTrackingManager;
  v6 = [(ARFaceTrackingManager *)&v15 init];
  if (!v6) {
    goto LABEL_6;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)s_faceTrackingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  ++s_instanceCount;
  if (s_faceTracking || (int v11 = CVAFaceTrackingCreate()) == 0)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)s_faceTrackingSemaphore);
    v6->_maximumNumberOfTrackedFaces = a3;
    if (a3 == 1)
    {
      uint64_t v7 = objc_opt_new();
      singleUserAnchorIdentifier = v6->_singleUserAnchorIdentifier;
      v6->_singleUserAnchorIdentifier = (NSUUID *)v7;
    }
LABEL_6:
    self = v6;
    v9 = self;
    goto LABEL_8;
  }
  v12 = _ARLogGeneral();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = (objc_class *)objc_opt_class();
    v14 = NSStringFromClass(v13);
    *(_DWORD *)buf = 138543874;
    v17 = v14;
    __int16 v18 = 2048;
    v19 = v6;
    __int16 v20 = 1024;
    int v21 = v11;
    _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating face kit instance: %i", buf, 0x1Cu);
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)s_faceTrackingSemaphore);
  v9 = 0;
  self = v6;
LABEL_8:

  return v9;
}

- (ARFaceTrackingManager)init
{
  return [(ARFaceTrackingManager *)self initWithOptions:0];
}

- (void)dealloc
{
  dispatch_semaphore_wait((dispatch_semaphore_t)s_faceTrackingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (--s_instanceCount) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = s_faceTracking == 0;
  }
  if (!v3)
  {
    CFRelease((CFTypeRef)s_faceTracking);
    s_faceTracking = 0;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)s_faceTrackingSemaphore);
  v4.receiver = self;
  v4.super_class = (Class)ARFaceTrackingManager;
  [(ARFaceTrackingManager *)&v4 dealloc];
}

+ (BOOL)isSupported
{
  if (ARRGBFaceTrackingEnabled()) {
    return 1;
  }
  return ARPearlCameraSupported();
}

- (id)processData:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  [v35 timestamp];
  kdebug_trace();
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__2;
  v50 = __Block_byref_object_dispose__2;
  id v51 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __37__ARFaceTrackingManager_processData___block_invoke;
  v43[3] = &unk_1E6186F20;
  v45 = &v46;
  dispatch_semaphore_t dsema = v3;
  dispatch_semaphore_t v44 = dsema;
  uint64_t v4 = [(ARFaceTrackingManager *)self faceTrackingOptionsFromImageData:v35 withCallback:v43];
  dispatch_semaphore_wait((dispatch_semaphore_t)s_faceTrackingSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v30 = (void *)v4;
  LODWORD(v4) = CVAFaceTrackingProcess();
  dispatch_semaphore_signal((dispatch_semaphore_t)s_faceTrackingSemaphore);
  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v36 = [MEMORY[0x1E4F1C978] array];
  if (!v4)
  {
    v5 = (void *)v47[5];
    if (v5)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4D7C8]];

      v36 = (void *)v6;
    }
  }
  [v36 count];
  kdebug_trace();
  v33 = objc_opt_new();
  if ([v36 count])
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __37__ARFaceTrackingManager_processData___block_invoke_2;
    v41[3] = &unk_1E6186F48;
    v41[4] = self;
    id v42 = v33;
    [v36 enumerateObjectsUsingBlock:v41];
    v32 = (void *)[(id)v47[5] mutableCopy];
    uint64_t v7 = objc_opt_new();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v29 = *MEMORY[0x1E4F4D7C8];
    v8 = objc_msgSend(v32, "objectForKeyedSubscript:");
    uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v52 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v38;
      uint64_t v11 = *MEMORY[0x1E4F4D700];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(v8);
          }
          v13 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) mutableCopy];
          v14 = [v13 objectForKeyedSubscript:v11];
          BOOL v15 = v14 == 0;

          if (!v15)
          {
            v16 = [v13 objectForKeyedSubscript:v11];
            v17 = (void *)[v16 mutableCopy];

            [v17 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:@"rgb_crop"];
            [v13 setObject:v17 forKeyedSubscript:v11];
          }
          [v7 addObject:v13];
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v52 count:16];
      }
      while (v9);
    }

    [v32 setObject:v7 forKeyedSubscript:v29];
    __int16 v18 = [v35 faceData];
    [v18 setFaceMeshPayload:v32];
  }
  v19 = [v35 faceData];
  __int16 v20 = [v19 faceMeshPayload];
  int v21 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F4D7C8]];
  BOOL v22 = [v21 count] == 0;

  if (v22)
  {
    [v35 timestamp];
    kdebug_trace();
  }
  if ([(ARFaceTrackingManager *)self maximumNumberOfTrackedFaces] == 1)
  {
    v23 = [v33 firstObject];
    if (v23)
    {
      [v33 removeAllObjects];
      v24 = [ARFaceTrackingData alloc];
      v25 = [v23 trackingData];
      v26 = [(ARFaceTrackingData *)v24 initWithTrackingData:v25 anchorIdentifier:self->_singleUserAnchorIdentifier];

      [v33 addObject:v26];
    }
  }
  v27 = objc_opt_new();
  [v27 setTrackedFaces:v33];

  _Block_object_dispose(&v46, 8);
  return v27;
}

intptr_t __37__ARFaceTrackingManager_processData___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  dispatch_semaphore_t v3 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v3);
}

void __37__ARFaceTrackingManager_processData___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4D740]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
LABEL_5:
    uint64_t v11 = _ARLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      uint64_t v14 = *(void *)(a1 + 32);
      int v20 = 138543875;
      int v21 = v13;
      __int16 v22 = 2048;
      uint64_t v23 = v14;
      __int16 v24 = 2113;
      v25 = v8;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Tracking anchor with ID = %{private}@", (uint8_t *)&v20, 0x20u);
    }
    BOOL v15 = [[ARFaceTrackingData alloc] initWithTrackingData:v6 anchorIdentifier:v8];
    [*(id *)(a1 + 40) addObject:v15];
    unint64_t v16 = [*(id *)(a1 + 40) count];
    *a4 = v16 > [*(id *)(a1 + 32) maximumNumberOfTrackedFaces];

    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    int v20 = [v9 intValue];
    uint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v20 length:4];
    v8 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithData:", v10);

    goto LABEL_5;
  }
  v8 = _ARLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v17 = (objc_class *)objc_opt_class();
    __int16 v18 = NSStringFromClass(v17);
    uint64_t v19 = *(void *)(a1 + 32);
    int v20 = 138543618;
    int v21 = v18;
    __int16 v22 = 2048;
    uint64_t v23 = v19;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Encountered invalid face ID", (uint8_t *)&v20, 0x16u);
  }
LABEL_8:
}

- (id)faceTrackingOptionsFromImageData:(id)a3 withCallback:(id)a4
{
  v51[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v35 = a4;
  uint64_t v6 = *MEMORY[0x1E4F4D7D0];
  v50[0] = *MEMORY[0x1E4F4D7A8];
  v50[1] = v6;
  v51[0] = &unk_1F125BE70;
  v51[1] = &unk_1F125BE88;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
  v8 = __71__ARFaceTrackingManager_faceTrackingOptionsFromImageData_withCallback___block_invoke_2((uint64_t)v7, v5);
  memset(&v37, 0, sizeof(v37));
  [v5 timestamp];
  CMTimeMakeWithSeconds(&v37, v9, 1000000000);
  CMTime time = v37;
  CFDictionaryRef v10 = CMTimeCopyAsDictionary(&time, 0);
  uint64_t v11 = *MEMORY[0x1E4F4D7C0];
  v49[0] = v10;
  uint64_t v12 = *MEMORY[0x1E4F4D730];
  v48[0] = v11;
  v48[1] = v12;
  v13 = [v5 faceData];
  uint64_t v14 = [v13 detectedFaces];
  BOOL v15 = __71__ARFaceTrackingManager_faceTrackingOptionsFromImageData_withCallback___block_invoke((uint64_t)v14, v14);
  v49[1] = v15;
  v48[2] = *MEMORY[0x1E4F4D6E8];
  uint64_t v16 = *MEMORY[0x1E4F4D738];
  v46[0] = *MEMORY[0x1E4F4D770];
  v46[1] = v16;
  v47[0] = v8;
  v47[1] = v7;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v49[2] = v17;
  v48[3] = *MEMORY[0x1E4F4D6F0];
  uint64_t v18 = [v5 pixelBuffer];
  uint64_t v19 = *MEMORY[0x1E4F4D680];
  v49[3] = v18;
  v49[4] = MEMORY[0x1E4F1CC28];
  uint64_t v20 = *MEMORY[0x1E4F4D688];
  v48[4] = v19;
  v48[5] = v20;
  v49[5] = MEMORY[0x1E4F1CC38];
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:6];
  __int16 v22 = (void *)[(id)v21 mutableCopy];

  uint64_t v23 = [v5 depthData];
  LOBYTE(v21) = v23 == 0;

  if ((v21 & 1) == 0)
  {
    id v24 = [v5 depthData];
    v25 = (__CVBuffer *)[v24 depthDataMap];

    if (v25)
    {
      OSType PixelFormatType = CVPixelBufferGetPixelFormatType(v25);
      if (PixelFormatType == 1717855600)
      {
        [v22 setValue:v25 forKey:*MEMORY[0x1E4F4D708]];
        [v22 setValue:&unk_1F125C400 forKey:*MEMORY[0x1E4F4D710]];
        [v22 setValue:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F4D7B0]];
      }
      else
      {
        if (_ARLogTechnique(void)::onceToken != -1) {
          dispatch_once(&_ARLogTechnique(void)::onceToken, &__block_literal_global_64);
        }
        v27 = (id)_ARLogTechnique(void)::logObj;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          id v29 = (id)objc_claimAutoreleasedReturnValue();
          v30 = AROSTypeToString(0x66646570u);
          v31 = AROSTypeToString(PixelFormatType);
          *(_DWORD *)buf = 138544130;
          id v39 = v29;
          __int16 v40 = 2048;
          v41 = self;
          __int16 v42 = 2112;
          v43 = v30;
          __int16 v44 = 2112;
          v45 = v31;
          _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Wrong depth format. Expected %@ but received %@", buf, 0x2Au);
        }
      }
    }
  }
  v32 = (void *)MEMORY[0x1BA9C63E0](v35);
  [v22 setValue:v32 forKey:*MEMORY[0x1E4F4D6E0]];

  return v22;
}

id __71__ARFaceTrackingManager_faceTrackingOptionsFromImageData_withCallback___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v2)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v15 = v2;
    id obj = v2;
    uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v3)
    {
      uint64_t v17 = *(void *)v20;
      uint64_t v4 = *MEMORY[0x1E4F4D718];
      uint64_t v5 = *MEMORY[0x1E4F4D720];
      uint64_t v6 = *MEMORY[0x1E4F4D728];
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(obj);
          }
          v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          objc_msgSend(v8, "boundingBox", v15);
          CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v28);
          v23[0] = v4;
          CFDictionaryRef v10 = NSNumber;
          [v8 rollAngleInDegrees];
          uint64_t v11 = objc_msgSend(v10, "numberWithDouble:");
          v24[0] = v11;
          v23[1] = v5;
          uint64_t v12 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "ID"));
          v23[2] = v6;
          v24[1] = v12;
          v24[2] = DictionaryRepresentation;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

          CFRelease(DictionaryRepresentation);
          [v18 addObject:v13];
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v3);
    }

    id v2 = v15;
  }

  return v18;
}

id __71__ARFaceTrackingManager_faceTrackingOptionsFromImageData_withCallback___block_invoke_2(uint64_t a1, void *a2)
{
  v46[3] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = NSNumber;
  [v2 cameraIntrinsics];
  uint64_t v43 = objc_msgSend(v3, "numberWithFloat:");
  uint64_t v4 = NSNumber;
  __int16 v40 = (void *)v43;
  [v2 cameraIntrinsics];
  LODWORD(v6) = v5;
  uint64_t v44 = [v4 numberWithFloat:v6];
  uint64_t v7 = NSNumber;
  long long v38 = (void *)v44;
  [v2 cameraIntrinsics];
  LODWORD(v9) = v8;
  id v39 = [v7 numberWithFloat:v9];
  v45 = v39;
  CMTime v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:3];
  v46[0] = v37;
  CFDictionaryRef v10 = NSNumber;
  [v2 cameraIntrinsics];
  LODWORD(v11) = HIDWORD(v11);
  v36 = [v10 numberWithFloat:v11];
  v42[0] = v36;
  uint64_t v12 = NSNumber;
  [v2 cameraIntrinsics];
  LODWORD(v14) = v13;
  id v15 = [v12 numberWithFloat:v14];
  v42[1] = v15;
  uint64_t v16 = NSNumber;
  [v2 cameraIntrinsics];
  LODWORD(v18) = v17;
  long long v19 = [v16 numberWithFloat:v18];
  v42[2] = v19;
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
  v46[1] = v20;
  long long v21 = NSNumber;
  [v2 cameraIntrinsics];
  LODWORD(v23) = v22;
  id v24 = [v21 numberWithFloat:v23];
  v41[0] = v24;
  v25 = NSNumber;
  [v2 cameraIntrinsics];
  LODWORD(v27) = v26;
  CGRect v28 = [v25 numberWithFloat:v27];
  v41[1] = v28;
  id v29 = NSNumber;
  [v2 cameraIntrinsics];
  LODWORD(v31) = v30;
  v32 = [v29 numberWithFloat:v31];
  v41[2] = v32;
  v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:3];
  void v46[2] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];

  return v34;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingManager;
  if ([(ARFaceTrackingManager *)&v9 isEqual:v4])
  {
    id v5 = v4;
    int64_t v6 = [(ARFaceTrackingManager *)self maximumNumberOfTrackedFaces];
    BOOL v7 = v6 == [v5 maximumNumberOfTrackedFaces];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (void).cxx_destruct
{
}

@end