@interface ARAppClipCodeTechnique
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
+ (BOOL)shouldRunCameraOrScannerPerformanceTestingMode;
- (ARAppClipCodeTechnique)initWithIgnoreURLLimitation:(BOOL)a3;
- (BOOL)deterministicMode;
- (BOOL)ignoreURLLimitation;
- (BOOL)isEqual:(id)a3;
- (double)requiredTimeInterval;
- (id)processData:(id)a3;
- (int64_t)captureBehavior;
- (void)dealloc;
- (void)prepare:(BOOL)a3;
- (void)setPowerUsage:(unint64_t)a3;
@end

@implementation ARAppClipCodeTechnique

- (ARAppClipCodeTechnique)initWithIgnoreURLLimitation:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)ARAppClipCodeTechnique;
  v4 = [(ARImageBasedTechnique *)&v11 init];
  v5 = v4;
  if (v4)
  {
    v4->_ignoreURLLimitation = a3;
    uint64_t v6 = objc_opt_new();
    decodedURLs = v5->_decodedURLs;
    v5->_decodedURLs = (NSMutableDictionary *)v6;

    v8 = (BCSAppClipCodeURLDecoder *)objc_alloc_init(getBCSAppClipCodeURLDecoderClass());
    urlDecoder = v5->_urlDecoder;
    v5->_urlDecoder = v8;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_appClipCodeSession)
  {
    v3 = _ARLogTechnique_10();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (objc_class *)objc_opt_class();
      v5 = NSStringFromClass(v4);
      appClipCodeSession = self->_appClipCodeSession;
      *(_DWORD *)buf = 138543874;
      v12 = v5;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2048;
      v16 = appClipCodeSession;
      _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing app clip code session: %p …", buf, 0x20u);
    }
    AppC3DRelease();
    v7 = _ARLogTechnique_10();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      __int16 v13 = 2048;
      v14 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: App clip code session released", buf, 0x16u);
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)ARAppClipCodeTechnique;
  [(ARAppClipCodeTechnique *)&v10 dealloc];
}

- (void)prepare:(BOOL)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_appClipCodeSession)
  {
    v4 = _ARLogTechnique_10();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      v33 = v6;
      __int16 v34 = 2048;
      v35 = self;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: App clip code session already exists, not recreating it.", buf, 0x16u);
    }
  }
  else
  {
    BOOL v7 = a3;
    kdebug_trace();
    if ([(NSMutableDictionary *)self->_decodedURLs count]) {
      [(NSMutableDictionary *)self->_decodedURLs removeAllObjects];
    }
    AppC3DConfigCreate();
    int64_t v8 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.appClipCodeTracking.performanceTestMode"];
    if (v8 == 2) {
      AppC3DConfigSetTrackingConfig();
    }
    if (+[ARAppClipCodeTechnique shouldRunCameraOrScannerPerformanceTestingMode])
    {
      v9 = _ARLogTechnique_10();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_super v10 = (objc_class *)objc_opt_class();
        objc_super v11 = NSStringFromClass(v10);
        v12 = @"scanner";
        *(_DWORD *)buf = 138543874;
        v33 = v11;
        if (v8 == 1) {
          v12 = @"camera";
        }
        __int16 v34 = 2048;
        v35 = self;
        __int16 v36 = 2112;
        *(void *)v37 = v12;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Running in '%@' performance test mode", buf, 0x20u);
      }
      int v13 = 0;
    }
    else
    {
      int v13 = 1;
    }
    AppC3DConfigSetTrackingMode();
    v14 = v29;
    if (v29)
    {
      __int16 v15 = _ARLogTechnique_10();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        uint64_t v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138544130;
        v33 = v17;
        __int16 v34 = 2048;
        v35 = self;
        __int16 v36 = 1024;
        *(_DWORD *)v37 = v13;
        *(_WORD *)&v37[4] = 2112;
        *(void *)&v37[6] = v29;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not set app clip code config tracking mode to: %d failed with error: %@", buf, 0x26u);
      }
      AppC3DConfigRelease();
      v18 = [(ARTechnique *)self delegate];
      v19 = ARErrorWithCodeAndUserInfo(151, 0);
      [v18 technique:self didFailWithError:v19];
    }
    else
    {
      AppC3DConfigSetMaxNumberCodesToTrack();
      uint64_t v30 = *MEMORY[0x1E4F4AC30];
      v20 = [NSNumber numberWithBool:v7];
      v31 = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      appClipCodeTrackingOptions = self->_appClipCodeTrackingOptions;
      self->_appClipCodeTrackingOptions = v21;

      AppC3DCreate();
      AppC3DConfigRelease();
      AppC3DSetUpdateCallback();
      [(ARAppClipCodeTechnique *)self setPowerUsage:[(ARTechnique *)self powerUsage]];
      BOOL v23 = [(ARAppClipCodeTechnique *)self deterministicMode];
      v14 = _ARLogTechnique_10();
      BOOL v24 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (v23)
      {
        if (v24)
        {
          v25 = (objc_class *)objc_opt_class();
          v26 = NSStringFromClass(v25);
          *(_DWORD *)buf = 138543618;
          v33 = v26;
          __int16 v34 = 2048;
          v35 = self;
          _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: prepared for deterministic mode.", buf, 0x16u);
        }
      }
      else if (v24)
      {
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138543618;
        v33 = v28;
        __int16 v34 = 2048;
        v35 = self;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: prepared for non-deterministic mode.", buf, 0x16u);
      }
    }

    kdebug_trace();
  }
}

- (int64_t)captureBehavior
{
  return 1;
}

- (id)processData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21.receiver = self;
    v21.super_class = (Class)ARAppClipCodeTechnique;
    id v5 = [(ARImageBasedTechnique *)&v21 processData:v4];
    id v6 = v4;
    [v6 visionTransform];
    int IsZero = ARMatrix4x4IsZero(v7, v8, v9, v10);
    [v6 timestamp];
    if (IsZero)
    {
      -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", MEMORY[0x1E4F1CBF0]);
      [v6 timestamp];
      kdebug_trace();
    }
    else
    {
      kdebug_trace();
      uint64_t v26 = 0;
      memset(v25, 0, sizeof(v25));
      [v6 cameraIntrinsics];
      objc_msgSend(v6, "visionTransform", ARMatrix3x3RowMajorArray(v25, v12, v13, v14));
      BOOL v19 = +[ARAppClipCodeTechnique shouldRunCameraOrScannerPerformanceTestingMode];
      [v6 pixelBuffer];
      [v6 timestamp];
      if (v19) {
        AppC3DProcessCameraFrameData();
      }
      else {
        AppC3DProcess();
      }
    }
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)ARAppClipCodeTechnique;
    id v6 = [(ARImageBasedTechnique *)&v22 processData:v4];
  }

  return v6;
}

- (BOOL)deterministicMode
{
  v2 = [(NSDictionary *)self->_appClipCodeTrackingOptions objectForKey:*MEMORY[0x1E4F4AC30]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(NSDictionary *)self->_appClipCodeTrackingOptions isEqual:v4[12]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)setPowerUsage:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)ARAppClipCodeTechnique;
  -[ARTechnique setPowerUsage:](&v9, sel_setPowerUsage_);
  if (self->_appClipCodeSession)
  {
    if (a3 == 1) {
      int v5 = 1;
    }
    else {
      int v5 = 2 * (a3 == 2);
    }
    AppC3DSetPerformanceMode();
    id v6 = _ARLogTechnique_10();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      float32x4_t v7 = (objc_class *)objc_opt_class();
      float32x4_t v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138544130;
      objc_super v11 = v8;
      __int16 v12 = 2048;
      int8x16_t v13 = self;
      __int16 v14 = 2048;
      int8x16_t v15 = self;
      __int16 v16 = 1024;
      int v17 = v5;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: ARAppClipCodeTechnique(%p): Setting performance mode %i.", buf, 0x26u);
    }
  }
}

- (double)requiredTimeInterval
{
  return 0.0;
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return objc_opt_class() == (void)a3;
}

+ (BOOL)shouldRunCameraOrScannerPerformanceTestingMode
{
  return (unint64_t)(+[ARKitUserDefaults integerForKey:@"com.apple.arkit.appClipCodeTracking.performanceTestMode"]- 1) < 2;
}

- (BOOL)ignoreURLLimitation
{
  return self->_ignoreURLLimitation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlDecoder, 0);
  objc_storeStrong((id *)&self->_decodedURLs, 0);
  objc_storeStrong((id *)&self->_appClipCodeTrackingOptions, 0);
}

@end