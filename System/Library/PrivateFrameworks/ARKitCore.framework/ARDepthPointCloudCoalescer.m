@interface ARDepthPointCloudCoalescer
- (ADAggregationParameters)aggregationParameters;
- (ARDepthPointCloudCoalescer)init;
- (id)_createModifiedParametersIfNecessary:(id)a3;
- (id)depthPointCloudWithPose:(id)a3 imageData:(id)a4;
- (void)addDepthPointCloudData:(id)a3;
- (void)setAggregationParameters:(id)a3;
@end

@implementation ARDepthPointCloudCoalescer

- (void)setAggregationParameters:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_msgSend(v4, "ar_isEqualToParameters:", self->_aggregationParameters) & 1) == 0)
  {
    v5 = (ADAggregationParameters *)[v4 copy];
    aggregationParameters = self->_aggregationParameters;
    self->_aggregationParameters = v5;

    uint64_t v7 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.jasper.aggregationBankCount"];
    if (v7 >= 1) {
      [(ADAggregationParameters *)self->_aggregationParameters setAggregationSize:v7];
    }
    v8 = _ARLogGeneral_12();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: The aggregation parameters changed, deleting the aggregator", (uint8_t *)&v12, 0x16u);
    }
    os_unfair_lock_lock(&self->_aggregatorLock);
    aggregator = self->_aggregator;
    self->_aggregator = 0;

    os_unfair_lock_unlock(&self->_aggregatorLock);
  }
}

- (ARDepthPointCloudCoalescer)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARDepthPointCloudCoalescer;
  v2 = [(ARDepthPointCloudCoalescer *)&v5 init];
  v2->_aggregatorLock._os_unfair_lock_opaque = 0;
  v3 = objc_opt_new();
  [v3 setAggregationSize:4];
  [v3 setMaxPointCloudAge:0.5];
  [(ARDepthPointCloudCoalescer *)v2 setAggregationParameters:v3];

  return v2;
}

- (ADAggregationParameters)aggregationParameters
{
  v2 = (void *)[(ADAggregationParameters *)self->_aggregationParameters copy];
  return (ADAggregationParameters *)v2;
}

- (id)_createModifiedParametersIfNecessary:(id)a3
{
  uint64_t v4 = aggregationSizeForPointCloud(a3);
  int v5 = [(ADAggregationParameters *)self->_aggregationParameters aggregationSize];
  aggregationParameters = self->_aggregationParameters;
  if (v5 == v4)
  {
    uint64_t v7 = aggregationParameters;
  }
  else
  {
    uint64_t v7 = (ADAggregationParameters *)[(ADAggregationParameters *)aggregationParameters copy];
    [(ADAggregationParameters *)v7 setAggregationSize:v4];
  }
  return v7;
}

- (void)addDepthPointCloudData:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_aggregatorLock = &self->_aggregatorLock;
  os_unfair_lock_lock(&self->_aggregatorLock);
  aggregator = self->_aggregator;
  if (!aggregator
    || ([(ADPointCloudAggregator *)aggregator aggregationParameters],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 aggregationSize],
        int v9 = aggregationSizeForPointCloud(v4),
        v7,
        v8 != v9))
  {
    v10 = [(ARDepthPointCloudCoalescer *)self _createModifiedParametersIfNecessary:v4];
    v11 = _ARLogGeneral_12();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      __int16 v14 = self->_aggregator;
      int v35 = 138543874;
      id v36 = v13;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2048;
      v40 = v14;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: About to create a new ADPointCloudAggregator; old: (%p)",
        (uint8_t *)&v35,
        0x20u);
    }
    v15 = (ADPointCloudAggregator *)[objc_alloc(MEMORY[0x1E4F4D860]) initWithAggregationParameters:v10];
    uint64_t v16 = self->_aggregator;
    self->_aggregator = v15;

    v17 = _ARLogGeneral_12();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = self->_aggregator;
      v21 = [(ADPointCloudAggregator *)v20 aggregationParameters];
      int v22 = [v21 aggregationSize];
      v23 = [(ADPointCloudAggregator *)self->_aggregator aggregationParameters];
      [v23 maxPointCloudAge];
      int v35 = 138544386;
      id v36 = v19;
      __int16 v37 = 2048;
      v38 = self;
      __int16 v39 = 2048;
      v40 = v20;
      __int16 v41 = 1024;
      int v42 = v22;
      __int16 v43 = 2048;
      uint64_t v44 = v24;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Created a new ADPointCloudAggregator (%p) with Size:%u Age:%lf", (uint8_t *)&v35, 0x30u);
    }
  }
  [v4 timestamp];
  v25 = [v4 pointCloud];
  [v25 length];
  kdebug_trace();

  v26 = self->_aggregator;
  v27 = [v4 pointCloud];
  [v4 timestamp];
  double v29 = v28;
  v30 = (void *)MEMORY[0x1E4F4D860];
  [v4 visionCameraTransform];
  objc_msgSend(v30, "transformMetersToMillimiters:");
  -[ADPointCloudAggregator pushPointCloud:timestamp:worldToCameraTransform:](v26, "pushPointCloud:timestamp:worldToCameraTransform:", v27, v29, v31, v32, v33, v34);

  kdebug_trace();
  os_unfair_lock_unlock(p_aggregatorLock);
}

- (id)depthPointCloudWithPose:(id)a3 imageData:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_t lock = &self->_aggregatorLock;
  os_unfair_lock_lock(&self->_aggregatorLock);
  int v8 = [(ADPointCloudAggregator *)self->_aggregator aggregationParameters];
  [v8 aggregationSize];
  CVPixelBufferGetWidth((CVPixelBufferRef)[v7 pixelBuffer]);
  CVPixelBufferGetHeight((CVPixelBufferRef)[v7 pixelBuffer]);
  [v7 timestamp];
  kdebug_trace();
  int v9 = [v7 calibrationData];
  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F4D800]);
    v11 = objc_msgSend(v10, "ar_initWithImageData:calibrationData:", v7, v9);

    if (v11) {
      goto LABEL_8;
    }
    int v12 = _ARLogGeneral_12();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138544130;
      id v47 = v14;
      __int16 v48 = 2048;
      v49 = self;
      __int16 v50 = 2114;
      id v51 = v16;
      __int16 v52 = 2114;
      v53 = v18;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: failed to create %{public}@ from calibration data, using last known %{public}@ calibration", buf, 0x2Au);
    }
  }
  id v19 = [v7 adCameraCalibration];
  BOOL v20 = v19 == 0;

  if (v20)
  {
LABEL_13:
    double v33 = _ARLogGeneral_12();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      double v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      id v36 = [v7 cameraType];
      *(_DWORD *)buf = 138543874;
      id v47 = v35;
      __int16 v48 = 2048;
      v49 = self;
      __int16 v50 = 2114;
      id v51 = v36;
      _os_log_impl(&dword_1B88A2000, v33, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not update aggregator calibration for image: %{public}@", buf, 0x20u);
    }
    v11 = 0;
    if (v6) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
  v21 = (void *)MEMORY[0x1E4F4D800];
  int v22 = [v7 adCameraCalibration];
  v11 = objc_msgSend(v21, "ar_calibrationWithImageData:adCalibrationData:", v7, v22);

  if (!v11)
  {
    v26 = _ARLogGeneral_12();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      double v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      double v31 = (objc_class *)objc_opt_class();
      double v32 = NSStringFromClass(v31);
      *(_DWORD *)buf = 138544130;
      id v47 = v28;
      __int16 v48 = 2048;
      v49 = self;
      __int16 v50 = 2114;
      id v51 = v30;
      __int16 v52 = 2114;
      v53 = v32;
      _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: failed to create %{public}@ from calibration data, using last known %{public}@ calibration", buf, 0x2Au);
    }
    goto LABEL_13;
  }
LABEL_8:
  [(ADPointCloudAggregator *)self->_aggregator setColorCameraCalibration:v11];
  [v11 cameraToPlatformTransform];
  ARMatrix4x4FromMatrix4x3();
  simd_float4x4 v57 = __invert_f4(v56);
  -[ADPointCloudAggregator setJasperToCameraTransform:](self->_aggregator, "setJasperToCameraTransform:", *(double *)v57.columns[0].i64, *(double *)v57.columns[1].i64, *(double *)v57.columns[2].i64, *(double *)v57.columns[3].i64);
  if (v6)
  {
LABEL_9:
    v23 = (void *)MEMORY[0x1E4F4D860];
    [v6 visionCameraTransform];
    objc_msgSend(v23, "transformMetersToMillimiters:");
    long long v43 = v25;
    long long v44 = v24;
    goto LABEL_17;
  }
LABEL_16:
  long long v43 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
  long long v44 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
LABEL_17:
  aggregator = self->_aggregator;
  objc_msgSend(v6, "timestamp", v43, v44);
  v38 = -[ADPointCloudAggregator aggregateForTime:worldToCameraTransform:](aggregator, "aggregateForTime:worldToCameraTransform:");
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  kdebug_trace();
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  kdebug_trace();
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  kdebug_trace();
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  [(ADPointCloudAggregator *)self->_aggregator jasperToCameraTransform];
  kdebug_trace();
  __int16 v39 = [(ADPointCloudAggregator *)self->_aggregator colorCameraCalibration];
  [v39 intrinsicMatrix];
  v40 = [(ADPointCloudAggregator *)self->_aggregator colorCameraCalibration];
  [v40 intrinsicMatrix];
  __int16 v41 = [(ADPointCloudAggregator *)self->_aggregator colorCameraCalibration];
  [v41 intrinsicMatrix];
  kdebug_trace();

  [v38 length];
  kdebug_trace();

  os_unfair_lock_unlock(lock);
  return v38;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregator, 0);
  objc_storeStrong((id *)&self->_aggregationParameters, 0);
}

@end