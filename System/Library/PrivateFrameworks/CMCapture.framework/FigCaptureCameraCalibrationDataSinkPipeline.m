@interface FigCaptureCameraCalibrationDataSinkPipeline
+ (void)initialize;
- (id)_buildCameraCalibrationDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 cameraInfoByPortType:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:;
- (void)dealloc;
- (void)initWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 cameraInfoByPortType:(_OWORD *)a7 clientAuditToken:(uint64_t)a8 delegate:;
@end

@implementation FigCaptureCameraCalibrationDataSinkPipeline

+ (void)initialize
{
}

- (void)initWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 name:(uint64_t)a6 cameraInfoByPortType:(_OWORD *)a7 clientAuditToken:(uint64_t)a8 delegate:
{
  if (!a1) {
    return 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
  v14 = objc_msgSendSuper2(&v18, sel_initWithGraph_name_sinkID_, a4, a5, objc_msgSend((id)objc_msgSend(a2, "sinkConfiguration"), "sinkID"));
  if (v14)
  {
    v14[7] = (id)objc_msgSend((id)objc_msgSend(a2, "sourceConfiguration"), "sourceID");
    long long v15 = a7[1];
    v17[0] = *a7;
    v17[1] = v15;
    if (-[FigCaptureCameraCalibrationDataSinkPipeline _buildCameraCalibrationDataSinkPipelineWithConfiguration:sourceOutput:graph:cameraInfoByPortType:clientAuditToken:delegate:](v14, a2, a3, a4, a6, v17, a8))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v14;
}

- (id)_buildCameraCalibrationDataSinkPipelineWithConfiguration:(uint64_t)a3 sourceOutput:(void *)a4 graph:(uint64_t)a5 cameraInfoByPortType:(_OWORD *)a6 clientAuditToken:(uint64_t)a7 delegate:
{
  if (result)
  {
    v12 = result;
    v28.receiver = result;
    v28.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
    id v29 = 0;
    objc_msgSendSuper2(&v28, sel_setUpstreamOutput_);
    v13 = [[BWStreamingCameraCalibrationDataNode alloc] initWithCameraInfoByPortType:a5];
    [(BWNode *)v13 setName:@"Streaming Camera Calibration Data Node"];
    v14 = (void *)[a2 sourceConfiguration];
    BOOL v15 = [v14 sourcePosition] == 2;
    BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType([v14 sourceDeviceType]);
    -[BWStreamingCameraCalibrationDataNode setHorizontalSensorBinningFactor:](v13, "setHorizontalSensorBinningFactor:", objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "horizontalSensorBinningFactor"));
    -[BWStreamingCameraCalibrationDataNode setVerticalSensorBinningFactor:](v13, "setVerticalSensorBinningFactor:", objc_msgSend((id)objc_msgSend(v14, "requiredFormat"), "verticalSensorBinningFactor"));
    LODWORD(v14) = [a2 orientation];
    int v17 = [a2 mirroringEnabled];
    [a4 clientExpectsCameraMountedInLandscapeOrientation];
    [(BWStreamingCameraCalibrationDataNode *)v13 setRotationDegrees:FigCaptureRotationDegreesFromOrientation((int)v14, v15, IsExtensionDeviceType, v17)];
    -[BWStreamingCameraCalibrationDataNode setMirroringEnabled:](v13, "setMirroringEnabled:", [a2 mirroringEnabled]);
    v27.receiver = v12;
    v27.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
    if ((objc_msgSendSuper2(&v27, sel_addNode_error_, v13, &v29) & 1) != 0
      && (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v13, "input"), 0) & 1) != 0)
    {
      uint64_t v18 = [(BWNode *)v13 output];
      v19 = [BWRemoteQueueSinkNode alloc];
      uint64_t v20 = [v12 sinkID];
      long long v21 = a6[1];
      v26[0] = *a6;
      v26[1] = v21;
      v22 = [(BWRemoteQueueSinkNode *)v19 initWithMediaType:1667326820 clientAuditToken:v26 sinkID:v20];
      [(BWNode *)v22 setName:@"Camera Calibration Data Remote Queue Sink"];
      [(BWRemoteQueueSinkNode *)v22 setDelegate:a7];
      -[BWRemoteQueueSinkNode setDiscardsLateSampleBuffers:](v22, "setDiscardsLateSampleBuffers:", objc_msgSend((id)objc_msgSend(a2, "cameraCalibrationDataSinkConfiguration"), "discardsLateCameraCalibrationData"));
      v25.receiver = v12;
      v25.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
      if (objc_msgSendSuper2(&v25, sel_addNode_error_, v22, &v29))
      {
        v24.receiver = v12;
        v24.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
        objc_msgSendSuper2(&v24, sel_setSinkNode_, v22);
        if (objc_msgSend(a4, "connectOutput:toInput:pipelineStage:", v18, -[BWNode input](v22, "input"), 0)) {
          goto LABEL_6;
        }
        fig_log_get_emitter();
      }
      else
      {
        fig_log_get_emitter();
      }
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
LABEL_6:
    result = v29;
    if (v29) {
      return (id)[v29 code];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCameraCalibrationDataSinkPipeline;
  [(FigCaptureRemoteQueueSinkPipeline *)&v3 dealloc];
}

@end