@interface ADPointCloudAggregator
+ (id)aggregatePointClouds:(__n128)a3 calibrations:(__n128)a4 worldToPlatformTransforms:(uint64_t)a5 projectingToCamera:(uint64_t)a6 worldToPlatformAtProjectionTime:(void *)a7;
+ (id)aggregatePointClouds:(__n128)a3 pointCloudToPlatformTransforms:(__n128)a4 worldToPlatformTransforms:(uint64_t)a5 projectingToCamera:(uint64_t)a6 worldToPlatformAtProjectionTime:(void *)a7;
- (ADAggregationParameters)aggregationParameters;
- (ADCameraCalibration)colorCameraCalibration;
- (ADJasperPointCloudFilterParameters)pointCloudFilterParameters;
- (ADPointCloudAggregator)initWithAggregationParameters:(id)a3;
- (double)jasperToCameraTransform;
- (id)aggregateForTime:(__n128)a3 worldToCameraTransform:(__n128)a4;
- (int64_t)clear;
- (uint64_t)aggregateAndProjectForTime:(double)a3 worldToCameraTransform:(double)a4 cropTo:(double)a5 rotateBy:(double)a6 projectedPointsBuffer:(uint64_t)a7;
- (uint64_t)aggregateAndProjectForTime:(double)a3 worldToCameraTransform:(double)a4 filterParams:(double)a5 cropTo:(double)a6 rotateBy:(uint64_t)a7 projectedPointsBuffer:(void *)a8;
- (uint64_t)initWithAggregationParameters:(double)a3 jasperToColorTransform:(double)a4 colorCamera:(double)a5;
- (uint64_t)pushPointCloud:(__n128)a3 timestamp:(__n128)a4 worldToCameraTransform:(__n128)a5;
- (uint64_t)pushPointCloud:(__n128)a3 timestamp:(__n128)a4 worldToLidarTransform:(__n128)a5;
- (void)dealloc;
- (void)setColorCameraCalibration:(id)a3;
- (void)setJasperToCameraTransform:(__n128)a3;
- (void)setPointCloudFilterParameters:(id)a3;
@end

@implementation ADPointCloudAggregator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCameraCalibration, 0);
  objc_storeStrong((id *)&self->_pointCloudFilterParameters, 0);

  objc_storeStrong((id *)&self->_aggregationParameters, 0);
}

- (void)setColorCameraCalibration:(id)a3
{
}

- (ADCameraCalibration)colorCameraCalibration
{
  return (ADCameraCalibration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setJasperToCameraTransform:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 48), v5, 64, 1, 0);
}

- (double)jasperToCameraTransform
{
  objc_copyStruct(&v2, (const void *)(a1 + 48), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setPointCloudFilterParameters:(id)a3
{
}

- (ADJasperPointCloudFilterParameters)pointCloudFilterParameters
{
  return self->_pointCloudFilterParameters;
}

- (ADAggregationParameters)aggregationParameters
{
  return self->_aggregationParameters;
}

- (int64_t)clear
{
  long long v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = 0;
  for (unint64_t i = 0; i < [(ADAggregationParameters *)v2->_aggregationParameters aggregationSize]; ++i)
  {
    history = v2->_history;
    id var0 = history[v3].var0;
    history[v3].id var0 = 0;

    v2->_history[v3 + 5].id var0 = 0;
    v3 += 6;
  }
  v2->_historyIndex = 0;
  objc_sync_exit(v2);

  return 0;
}

- (uint64_t)aggregateAndProjectForTime:(double)a3 worldToCameraTransform:(double)a4 filterParams:(double)a5 cropTo:(double)a6 rotateBy:(uint64_t)a7 projectedPointsBuffer:(void *)a8
{
  id v21 = a8;
  id v22 = a1;
  objc_sync_enter(v22);
  v23 = objc_msgSend(v22, "aggregateForTime:worldToCameraTransform:", a2, a3, a4, a5, a6);
  uint64_t v24 = objc_msgSend(v23, "projectJasperPointsFilteredBy:croppedBy:rotatedBy:andScaledInto:", v21, a9, a10, a14, a15, a16, a17);

  objc_sync_exit(v22);
  return v24;
}

- (uint64_t)aggregateAndProjectForTime:(double)a3 worldToCameraTransform:(double)a4 cropTo:(double)a5 rotateBy:(double)a6 projectedPointsBuffer:(uint64_t)a7
{
  id v20 = a1;
  objc_sync_enter(v20);
  id v21 = objc_msgSend(v20, "aggregateForTime:worldToCameraTransform:", a2, a3, a4, a5, a6);
  uint64_t v22 = objc_msgSend(v21, "projectJasperPointsCroppedBy:rotatedBy:andScaledInto:", a8, a9, a13, a14, a15, a16);

  objc_sync_exit(v20);
  return v22;
}

- (id)aggregateForTime:(__n128)a3 worldToCameraTransform:(__n128)a4
{
  __n128 v40 = a6;
  __n128 v39 = a5;
  __n128 v38 = a4;
  __n128 v37 = a3;
  uint64_t v60 = *MEMORY[0x263EF8340];
  v7 = a1;
  objc_sync_enter(v7);
  if (v7[5])
  {
    int v49 = 335679376;
    long long v50 = 0u;
    long long v51 = 0u;
    kdebug_trace();
    v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7[3], "aggregationSize"));
    uint64_t v9 = [v7[3] aggregationSize];
    MEMORY[0x270FA5388](v9);
    v11 = &v37.n128_u64[-8 * v10];
    for (unint64_t i = 0;
          i < objc_msgSend(v7[3], "aggregationSize", v37.n128_u64[0], v37.n128_u64[1], v38.n128_u64[0], v38.n128_u64[1], v39.n128_u64[0], v39.n128_u64[1], v40.n128_u64[0], v40.n128_u64[1]);
          ++i)
    {
      id v13 = v7[2];
      unint64_t v14 = ((unint64_t)v13 + i) % [v7[3] aggregationSize];
      v15 = (double *)v7[1];
      if (*(void *)&v15[12 * v14])
      {
        double v16 = v15[12 * v14 + 10];
        [v7[3] maxPointCloudAge];
        if (a2 - v16 < v17)
        {
          v18 = (simd_float4 *)((char *)v7[1] + 96 * v14);
          simd_float4 v44 = v18[1];
          simd_float4 v43 = v18[2];
          simd_float4 v42 = v18[3];
          simd_float4 v41 = v18[4];
          [v7 jasperToCameraTransform];
          long long v48 = v19;
          long long v47 = v20;
          long long v46 = v21;
          long long v45 = v22;
          v62.columns[0] = v44;
          v62.columns[1] = v43;
          v62.columns[2] = v42;
          v62.columns[3] = v41;
          simd_float4x4 v63 = __invert_f4(v62);
          uint64_t v23 = 0;
          long long v52 = v48;
          long long v53 = v47;
          long long v54 = v46;
          long long v55 = v45;
          do
          {
            *(float32x4_t *)&buf[v23] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v63.columns[0], COERCE_FLOAT(*(long long *)((char *)&v52 + v23))), (float32x4_t)v63.columns[1], *(float32x2_t *)((char *)&v52 + v23), 1), (float32x4_t)v63.columns[2], *(float32x4_t *)((char *)&v52 + v23), 2), (float32x4_t)v63.columns[3], *(float32x4_t *)((char *)&v52 + v23), 3);
            v23 += 16;
          }
          while (v23 != 64);
          uint64_t v24 = 0;
          long long v52 = *(_OWORD *)buf;
          long long v53 = v57;
          long long v54 = v58;
          long long v55 = v59;
          float32x4_t v25 = (float32x4_t)v40;
          float32x4_t v26 = (float32x4_t)v39;
          float32x4_t v27 = (float32x4_t)v38;
          float32x4_t v28 = (float32x4_t)v37;
          do
          {
            *(float32x4_t *)&buf[v24] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v28, COERCE_FLOAT(*(long long *)((char *)&v52 + v24))), v27, *(float32x2_t *)((char *)&v52 + v24), 1), v26, *(float32x4_t *)((char *)&v52 + v24), 2), v25, *(float32x4_t *)((char *)&v52 + v24), 3);
            v24 += 16;
          }
          while (v24 != 64);
          long long v45 = *(_OWORD *)buf;
          long long v46 = v57;
          long long v47 = v58;
          long long v48 = v59;
          v29 = &v11[8 * [v8 count]];
          int v30 = DWORD2(v45);
          unint64_t *v29 = v45;
          *((_DWORD *)v29 + 2) = v30;
          int v31 = DWORD2(v46);
          v29[2] = v46;
          *((_DWORD *)v29 + 6) = v31;
          int v32 = DWORD2(v47);
          v29[4] = v47;
          *((_DWORD *)v29 + 10) = v32;
          int v33 = DWORD2(v48);
          v29[6] = v48;
          *((_DWORD *)v29 + 14) = v33;
          [v8 addObject:*((void *)v7[1] + 12 * v14)];
        }
      }
    }
    v34 = [v7 colorCameraCalibration];
    v35 = +[ADJasperPointCloud pointCloudByMergingPointClouds:v8 applyingTransforms:v11 projectingToCamera:v34];

    InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v49);
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_247EC4000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cannot aggregate point cloud. color camera calibration not set", buf, 2u);
    }
    v35 = 0;
  }
  objc_sync_exit(v7);

  return v35;
}

- (uint64_t)pushPointCloud:(__n128)a3 timestamp:(__n128)a4 worldToCameraTransform:(__n128)a5
{
  id v11 = a8;
  if (v11)
  {
    v12 = a1;
    objc_sync_enter(v12);
    int v25 = 335679212;
    long long v26 = 0u;
    long long v27 = 0u;
    kdebug_trace();
    if (v12[4])
    {
      objc_msgSend(v11, "pointCloudByApplyingFilter:");
      id v13 = (ADJasperPointCloud *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_storeStrong((id *)v12[1] + 12 * (void)v12[2], a8);
      id v13 = [[ADJasperPointCloud alloc] initWithPointCloud:v11];
    }
    v15 = (char *)v12[1];
    uint64_t v16 = 96 * (void)v12[2];
    double v17 = *(void **)&v15[v16];
    *(void *)&v15[v16] = v13;

    v18 = (__n128 *)((char *)v12[1] + 96 * (void)v12[2]);
    v18[5].n128_f64[0] = a2;
    v18[1] = a3;
    v18[2] = a4;
    v18[3] = a5;
    v18[4] = a6;
    id v19 = v12[2];
    v12[2] = (id)(((unint64_t)v19 + 1) % [v12[3] aggregationSize]);
    InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v25);
    objc_sync_exit(v12);

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = -22953;
  }

  return v14;
}

- (uint64_t)pushPointCloud:(__n128)a3 timestamp:(__n128)a4 worldToLidarTransform:(__n128)a5
{
  id v10 = a8;
  [a1 jasperToCameraTransform];
  uint64_t v15 = 0;
  v22[0] = a3;
  v22[1] = a4;
  v22[2] = a5;
  v22[3] = a6;
  do
  {
    *(long long *)((char *)&v23 + v15 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v11, COERCE_FLOAT(v22[v15])), v12, *(float32x2_t *)&v22[v15], 1), v13, (float32x4_t)v22[v15], 2), v14, (float32x4_t)v22[v15], 3);
    ++v15;
  }
  while (v15 != 4);
  uint64_t v16 = objc_msgSend(a1, "pushPointCloud:timestamp:worldToCameraTransform:", v10, a2, *(double *)&v23, *(double *)&v24, *(double *)&v25, *(double *)&v26);

  return v16;
}

- (void)dealloc
{
  history = self->_history;
  if (history)
  {
    v4 = history - 1;
    double var2 = history[-1].var2;
    if (var2 != 0.0)
    {
      uint64_t v6 = 6 * *(void *)&var2;
      v7 = history - 6;
      do
      {

        v6 -= 6;
      }
      while (v6 * 16);
    }
    MEMORY[0x24C570720](v4, 0x1080C80A5AEB770);
  }
  v8.receiver = self;
  v8.super_class = (Class)ADPointCloudAggregator;
  [(ADPointCloudAggregator *)&v8 dealloc];
}

- (uint64_t)initWithAggregationParameters:(double)a3 jasperToColorTransform:(double)a4 colorCamera:(double)a5
{
  id v11 = a7;
  id v12 = a8;
  int v22 = 335679380;
  long long v23 = 0u;
  long long v24 = 0u;
  kdebug_trace();
  a1[1] = 0;
  v21.receiver = a1;
  v21.super_class = (Class)ADPointCloudAggregator;
  float32x4_t v13 = [(ADPointCloudAggregator *)&v21 init];
  float32x4_t v14 = v13;
  if (v13)
  {
    p_aggregationParameters = (id *)&v13->_aggregationParameters;
    objc_storeStrong((id *)&v13->_aggregationParameters, a7);
    [(ADPointCloudAggregator *)v14 setColorCameraCalibration:v12];
    -[ADPointCloudAggregator setJasperToCameraTransform:](v14, "setJasperToCameraTransform:", a2, a3, a4, a5);
    [*p_aggregationParameters aggregationSize];
    operator new[]();
  }
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)&v22);

  return 0;
}

- (ADPointCloudAggregator)initWithAggregationParameters:(id)a3
{
  return -[ADPointCloudAggregator initWithAggregationParameters:jasperToColorTransform:colorCamera:](self, "initWithAggregationParameters:jasperToColorTransform:colorCamera:", a3, 0, *MEMORY[0x263EF89A8], *(double *)(MEMORY[0x263EF89A8] + 16), *(double *)(MEMORY[0x263EF89A8] + 32), *(double *)(MEMORY[0x263EF89A8] + 48));
}

+ (id)aggregatePointClouds:(__n128)a3 pointCloudToPlatformTransforms:(__n128)a4 worldToPlatformTransforms:(uint64_t)a5 projectingToCamera:(uint64_t)a6 worldToPlatformAtProjectionTime:(void *)a7
{
  __n128 v42 = a3;
  __n128 v43 = a4;
  __n128 v41 = a2;
  __n128 v40 = a1;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v13 = a7;
  id v14 = a10;
  if (!v14)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v36 = &_os_log_internal;
      __n128 v37 = "cannot aggregate point cloud. color camera calibration not set";
      goto LABEL_25;
    }
LABEL_19:
    __n128 v38 = 0;
    goto LABEL_21;
  }
  if (!v13 || ![v13 count])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v36 = &_os_log_internal;
      __n128 v37 = "cannot aggregate point cloud. no point clouds provided";
LABEL_25:
      _os_log_error_impl(&dword_247EC4000, v36, OS_LOG_TYPE_ERROR, v37, buf, 2u);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  uint64_t v15 = [v13 count];
  uint64_t v16 = &v40.n128_u64[-8 * MEMORY[0x270FA5388](v15)];
  [v14 cameraToPlatformTransform];
  v54.columns[0].i32[3] = 0;
  v54.columns[1].i32[3] = 0;
  v54.columns[2].i32[3] = 0;
  v54.columns[3].i32[3] = 1.0;
  simd_float4x4 v55 = __invert_f4(v54);
  unint64_t v17 = 0;
  __n128 v44 = v40;
  __n128 v45 = v41;
  __n128 v46 = v42;
  __n128 v47 = v43;
  do
  {
    *(float32x4_t *)&buf[v17] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v55.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v44 + v17))), (float32x4_t)v55.columns[1], (float32x2_t)v44.n128_u64[v17 / 8], 1), (float32x4_t)v55.columns[2], *(float32x4_t *)((char *)&v44 + v17), 2), (float32x4_t)v55.columns[3], *(float32x4_t *)((char *)&v44 + v17), 3);
    v17 += 16;
  }
  while (v17 != 64);
  unsigned int v18 = 0;
  __n128 v42 = v49;
  __n128 v43 = *(__n128 *)buf;
  __n128 v41 = v50;
  __n128 v40 = v51;
  id v19 = (simd_float4x4 *)MEMORY[0x263EF89A8];
  while (objc_msgSend(v13, "count", v40.n128_u64[0], v40.n128_u64[1], v41.n128_u64[0], v41.n128_u64[1], *(_OWORD *)&v42, *(_OWORD *)&v43, *(_OWORD *)&v44, *(_OWORD *)&v45, *(_OWORD *)&v46, *(_OWORD *)&v47) > (unint64_t)v18)
  {
    if (a9) {
      simd_float4x4 v56 = __invert_f4(*(simd_float4x4 *)(a9 + ((unint64_t)v18 << 6)));
    }
    else {
      simd_float4x4 v56 = *v19;
    }
    unint64_t v20 = 0;
    objc_super v21 = (__n128 *)(a8 + ((unint64_t)v18 << 6));
    __n128 v22 = *v21;
    __n128 v23 = v21[1];
    __n128 v24 = v21[2];
    __n128 v25 = v21[3];
    v22.n128_u32[3] = 0;
    v23.n128_u32[3] = 0;
    v24.n128_u32[3] = 0;
    v25.n128_u32[3] = 1.0;
    __n128 v44 = v22;
    __n128 v45 = v23;
    __n128 v46 = v24;
    __n128 v47 = v25;
    do
    {
      *(float32x4_t *)&buf[v20] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v56.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v44 + v20))), (float32x4_t)v56.columns[1], (float32x2_t)v44.n128_u64[v20 / 8], 1), (float32x4_t)v56.columns[2], *(float32x4_t *)((char *)&v44 + v20), 2), (float32x4_t)v56.columns[3], *(float32x4_t *)((char *)&v44 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    unint64_t v26 = 0;
    __n128 v44 = *(__n128 *)buf;
    __n128 v45 = v49;
    __n128 v46 = v50;
    __n128 v47 = v51;
    float32x4_t v28 = (float32x4_t)v42;
    float32x4_t v27 = (float32x4_t)v43;
    float32x4_t v29 = (float32x4_t)v41;
    float32x4_t v30 = (float32x4_t)v40;
    do
    {
      *(float32x4_t *)&buf[v26] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v27, COERCE_FLOAT(*(_OWORD *)((char *)&v44 + v26))), v28, (float32x2_t)v44.n128_u64[v26 / 8], 1), v29, *(float32x4_t *)((char *)&v44 + v26), 2), v30, *(float32x4_t *)((char *)&v44 + v26), 3);
      v26 += 16;
    }
    while (v26 != 64);
    unint64_t v31 = *(void *)buf;
    __n128 v32 = v49;
    __n128 v33 = v50;
    __n128 v34 = v51;
    v35 = &v16[8 * (unint64_t)v18];
    *((_DWORD *)v35 + 2) = *(_DWORD *)&buf[8];
    unint64_t *v35 = v31;
    *((_DWORD *)v35 + 6) = v32.n128_u32[2];
    v35[2] = v32.n128_u64[0];
    *((_DWORD *)v35 + 10) = v33.n128_u32[2];
    v35[4] = v33.n128_u64[0];
    *((_DWORD *)v35 + 14) = v34.n128_u32[2];
    ++v18;
    v35[6] = v34.n128_u64[0];
  }
  __n128 v38 = +[ADJasperPointCloud pointCloudByMergingPointClouds:v13 applyingTransforms:v16 projectingToCamera:v14];
LABEL_21:

  return v38;
}

+ (id)aggregatePointClouds:(__n128)a3 calibrations:(__n128)a4 worldToPlatformTransforms:(uint64_t)a5 projectingToCamera:(uint64_t)a6 worldToPlatformAtProjectionTime:(void *)a7
{
  __n128 v37 = a3;
  __n128 v38 = a4;
  __n128 v35 = a1;
  __n128 v36 = a2;
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v13 = a7;
  id v14 = a8;
  id v15 = a10;
  if (!v14 || ![v14 count])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      __n128 v32 = &_os_log_internal;
      __n128 v33 = "cannot aggregate point cloud. no calibration provided";
      uint32_t v34 = 2;
      goto LABEL_20;
    }
LABEL_12:
    float32x4_t v30 = 0;
    goto LABEL_14;
  }
  uint64_t v16 = [v14 count];
  if (v16 != [v13 count] && objc_msgSend(v14, "count") != 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = [v14 count];
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v13 count];
      __n128 v32 = &_os_log_internal;
      __n128 v33 = "cannot aggregate point cloud. expecting either 1 calibration instance, or one per point cloud. got %lu calib"
            "ration and %lu point clouds";
      uint32_t v34 = 22;
LABEL_20:
      _os_log_error_impl(&dword_247EC4000, v32, OS_LOG_TYPE_ERROR, v33, buf, v34);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  *(_DWORD *)buf = 335679376;
  *(_OWORD *)&buf[8] = 0u;
  long long v40 = 0u;
  kdebug_trace();
  uint64_t v17 = [v13 count];
  unsigned int v18 = &v35.n128_u64[-8 * MEMORY[0x270FA5388](v17)];
  for (unsigned int i = 0;
        objc_msgSend(v13, "count", *(_OWORD *)&v35, *(_OWORD *)&v36, *(_OWORD *)&v37, *(_OWORD *)&v38, *(void *)buf, *(_OWORD *)&buf[8], v40, v41) > (unint64_t)i;
        ++i)
  {
    if ([v14 count] <= (unint64_t)i) {
      [v14 objectAtIndexedSubscript:0];
    }
    else {
    unint64_t v20 = [v14 objectAtIndexedSubscript:i];
    }
    [v20 cameraToPlatformTransform];
    objc_super v21 = &v18[8 * (unint64_t)i];
    *objc_super v21 = v22;
    *((_DWORD *)v21 + 2) = v23;
    *((_DWORD *)v21 + 6) = v24;
    *((_DWORD *)v21 + 10) = v25;
    v21[2] = v26;
    v21[4] = v27;
    *((_DWORD *)v21 + 14) = v28;
    v21[6] = v29;
  }
  float32x4_t v30 = +[ADPointCloudAggregator aggregatePointClouds:pointCloudToPlatformTransforms:worldToPlatformTransforms:projectingToCamera:worldToPlatformAtProjectionTime:](ADPointCloudAggregator, "aggregatePointClouds:pointCloudToPlatformTransforms:worldToPlatformTransforms:projectingToCamera:worldToPlatformAtProjectionTime:", v13, v18, a9, v15, v35.n128_f64[0], v36.n128_f64[0], v37.n128_f64[0], v38.n128_f64[0]);
  InstrumentsTraceGuard::~InstrumentsTraceGuard((InstrumentsTraceGuard *)buf);
LABEL_14:

  return v30;
}

@end