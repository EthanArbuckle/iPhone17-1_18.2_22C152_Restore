@interface ADJasperColorFlow
- (ADJasperColorExecutor)executor;
- (ADJasperColorFlow)initWithExecutor:(id)a3;
- (void)processIfMatch:(id)a3;
- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7;
- (void)pushPointCloud:(double)a3 pose:(double)a4 calibration:(double)a5 timestamp:(double)a6;
@end

@implementation ADJasperColorFlow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executor, 0);
  objc_storeStrong((id *)&self->_streamSync, 0);
}

- (ADJasperColorExecutor)executor
{
  return self->_executor;
}

- (void)processIfMatch:(id)a3
{
  v45[1] = *(CVPixelBufferRef *)MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v42 = (id)objc_opt_new();
    v5 = [v4 matchedObjectsForStream:0];
    id v43 = [v5 firstObject];

    v6 = [v4 matchedObjectsForStream:1];
    v41 = &v37;
    v7 = &v37 - 4 * [v6 count];
    v8 = objc_opt_new();
    for (unsigned int i = 0; ; unsigned int i = v10 + 1)
    {
      uint64_t v10 = i;
      if ([v6 count] <= (unint64_t)i) {
        break;
      }
      v11 = [v6 objectAtIndexedSubscript:i];
      [v11 pose];
      v12 = &v7[4 * v10];
      long long *v12 = v13;
      v12[1] = v14;
      v12[2] = v15;
      v12[3] = v16;

      v17 = [v6 objectAtIndexedSubscript:v10];
      v18 = [v17 data];
      [v8 addObject:v18];
    }
    id v19 = v42;
    v20 = [v43 data];
    [v19 setColor:v20];

    [v19 setPointClouds:v8];
    CVPixelBufferRef v44 = 0;
    v45[0] = 0;
    executor = self->_executor;
    uint64_t v22 = [v19 color];
    v23 = [v43 calibration];
    [v43 pose];
    long long v39 = v25;
    long long v40 = v24;
    long long v37 = v27;
    long long v38 = v26;
    v28 = [v6 objectAtIndexedSubscript:0];
    v29 = [v28 calibration];
    uint64_t v30 = -[ADJasperColorExecutor executeWithColor:colorCameraCalibration:colorWorldToPlatformTransform:pointClouds:lidarCameraCalibration:pointCloudWorldToPlatformTransforms:outDepthMap:outConfMap:outNormalsMap:](executor, "executeWithColor:colorCameraCalibration:colorWorldToPlatformTransform:pointClouds:lidarCameraCalibration:pointCloudWorldToPlatformTransforms:outDepthMap:outConfMap:outNormalsMap:", v22, v23, v8, v29, v7, v45, *(double *)&v40, *(double *)&v39, *(double *)&v38, *(double *)&v37, &v44, 0);

    if (v30)
    {
      v31 = [(ADFlow *)self delegate];
      BOOL v32 = v31 == 0;

      if (v32)
      {
LABEL_12:

        goto LABEL_13;
      }
      v33 = [(ADFlow *)self delegate];
      [v43 timestamp];
      objc_msgSend(v33, "didFailOnFrame:input:message:error:", v42, @"failed executing point cloud", v30);
    }
    else
    {
      v33 = objc_opt_new();
      [v33 setDepth:v45[0]];
      [v33 setConfidence:v44];
      v34 = [(ADFlow *)self delegate];
      BOOL v35 = v34 == 0;

      if (!v35)
      {
        v36 = [(ADFlow *)self delegate];
        [v43 timestamp];
        objc_msgSend(v36, "didProcessFrame:input:output:", v42, v33);
      }
      CVPixelBufferRelease(v45[0]);
      CVPixelBufferRelease(v44);
    }

    goto LABEL_12;
  }
LABEL_13:
}

- (void)pushPointCloud:(double)a3 pose:(double)a4 calibration:(double)a5 timestamp:(double)a6
{
  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:", a8, 1, a9, a6, a2, a3, a4, a5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "processIfMatch:");
}

- (void)pushColor:(double)a3 pose:(double)a4 calibration:(double)a5 metadata:(double)a6 timestamp:(uint64_t)a7
{
  objc_msgSend(a1[2], "pushData:streamIndex:timestamp:pose:calibration:", a8, 0, a9, a6, a2, a3, a4, a5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "processIfMatch:");
}

- (ADJasperColorFlow)initWithExecutor:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ADJasperColorFlow;
  v6 = [(ADJasperColorFlow *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_executor, a3);
    v8 = [(ADJasperColorExecutor *)v7->_executor executorParameters];
    v9 = [v8 pipelineParameters];
    id v10 = [v9 aggregationParameters];

    uint64_t v11 = [objc_alloc(MEMORY[0x263F26CF8]) initWithStreamCount:2 allowedMatchTimeInterval:0.05];
    streamSync = v7->_streamSync;
    v7->_streamSync = (ADStreamSync *)v11;

    [(ADStreamSync *)v7->_streamSync setStream:0 queueSize:1];
    -[ADStreamSync setStream:queueSize:aggregationCount:allowedAggregationInterval:](v7->_streamSync, "setStream:queueSize:aggregationCount:allowedAggregationInterval:", 1, 4, [v10 aggregationSize], 0.07);
  }
  return v7;
}

@end