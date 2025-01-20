@interface ARNormalTechnique
- (ARNormalTechnique)init;
- (id)processData:(id)a3;
- (void)dealloc;
@end

@implementation ARNormalTechnique

- (ARNormalTechnique)init
{
  v4.receiver = self;
  v4.super_class = (Class)ARNormalTechnique;
  v2 = [(ARTechnique *)&v4 init];
  if (v2) {
    v2->_session = (CV3DNormalEstimationSession *)CV3DNormalEstimationCreate();
  }
  return v2;
}

- (id)processData:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)ARNormalTechnique;
  objc_super v4 = [(ARTechnique *)&v35 processData:a3];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = v4;
    if (![v7 normalsBuffer])
    {
      [v7 depthBufferSize];
      CVPixelBufferRef v10 = ARCreateCVPixelBufferFromPool(&self->_normalPixelBufferPool, 1380410945, self, @"Normals map", v8, v9);
      if (v10)
      {
        v11 = v10;
        v12 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.planeEstimation.normalsKernelSize"];
        [v12 unsignedIntValue];

        [v7 timestamp];
        kdebug_trace();
        v13 = [v7 sourceImageData];
        [v13 cameraIntrinsics];
        double v33 = v15;
        float v34 = v14;
        double v31 = v16;
        v17 = [v7 sourceImageData];
        [v17 imageResolution];
        double v19 = v18;
        double v21 = v20;
        [v7 depthBufferSize];
        ARAdjustIntrinsicsForViewportSize(v34, v33, v31, v19, v21, v22, v23);
        uint64_t v32 = v24;

        [v7 depthBuffer];
        if (CV3DNormalEstimationSessionCompute())
        {
          [v7 setNormalsBuffer:v11];
        }
        else
        {
          v28 = _ARLogTechnique_13();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = (objc_class *)objc_opt_class();
            v30 = NSStringFromClass(v29);
            *(_DWORD *)buf = 138543874;
            v37 = v30;
            __int16 v38 = 2048;
            v39 = self;
            __int16 v40 = 2112;
            uint64_t v41 = 0;
            _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to compute normals: %@", buf, 0x20u);
          }
        }
        objc_msgSend(v7, "timestamp", v32);
        kdebug_trace();
        CVPixelBufferRelease(v11);
      }
      else
      {
        v25 = _ARLogTechnique_13();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (objc_class *)objc_opt_class();
          v27 = NSStringFromClass(v26);
          *(_DWORD *)buf = 138543618;
          v37 = v27;
          __int16 v38 = 2048;
          v39 = self;
          _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CVPixelBuffer to store normals could not be created from pool", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v5 = v4;
  }

  return v4;
}

- (void)dealloc
{
  CVPixelBufferPoolRelease(self->_normalPixelBufferPool);
  CV3DNormalEstimationSessionRelease();
  v3.receiver = self;
  v3.super_class = (Class)ARNormalTechnique;
  [(ARNormalTechnique *)&v3 dealloc];
}

@end