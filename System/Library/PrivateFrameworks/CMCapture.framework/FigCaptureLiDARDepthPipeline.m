@interface FigCaptureLiDARDepthPipeline
+ (void)initialize;
- (BWNodeOutput)depthDataSinkOutput;
- (FigCaptureLiDARDepthPipeline)initWithCaptureDevice:(id)a3 cameraInfoByPortType:(id)a4 sensorIDStringsByPortType:(id)a5 timeOfFlightCameraType:(int)a6 depthDataCaptureConnectionConfiguration:(id)a7 videoSourceCaptureOutput:(id)a8 pointCloudOutput:(id)a9 graph:(id)a10 name:(id)a11 rgbCameraSourceID:(id)a12 errorOut:(int *)a13;
- (NSString)rgbCameraSourceID;
- (int)_buildLiDARDepthPipelineWithVideoSourceCaptureOutput:(id)a3 pointCloudOutput:(id)a4 graph:(id)a5 timeOfFlightCameraType:(int)a6;
- (void)dealloc;
@end

@implementation FigCaptureLiDARDepthPipeline

+ (void)initialize
{
}

- (FigCaptureLiDARDepthPipeline)initWithCaptureDevice:(id)a3 cameraInfoByPortType:(id)a4 sensorIDStringsByPortType:(id)a5 timeOfFlightCameraType:(int)a6 depthDataCaptureConnectionConfiguration:(id)a7 videoSourceCaptureOutput:(id)a8 pointCloudOutput:(id)a9 graph:(id)a10 name:(id)a11 rgbCameraSourceID:(id)a12 errorOut:(int *)a13
{
  uint64_t v15 = *(void *)&a6;
  v23.receiver = self;
  v23.super_class = (Class)FigCaptureLiDARDepthPipeline;
  v19 = [(FigCapturePipeline *)&v23 initWithGraph:a10 name:a11];
  if (!v19) {
    goto LABEL_3;
  }
  v19->_captureDevice = (BWFigVideoCaptureDevice *)a3;
  v19->_cameraInfoByPortType = (NSDictionary *)a4;
  v19->_sensorIDStringsByPortType = (NSDictionary *)a5;
  v19->_rgbCameraHorizontalSensorBinningFactor = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "sourceConfiguration"), "requiredFormat"), "horizontalSensorBinningFactor");
  v19->_rgbCameraVerticalSensorBinningFactor = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "sourceConfiguration"), "requiredFormat"), "verticalSensorBinningFactor");
  v19->_depthPixelFormat = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "sourceConfiguration"), "depthDataFormat"), "format");
  v19->_depthDataFilteringEnabled = objc_msgSend((id)objc_msgSend(a7, "depthDataSinkConfiguration"), "filteringEnabled");
  v19->_depthOutputDimensions = ($470D365275581EF16070F5A11344F73E)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a7, "sourceConfiguration"), "depthDataFormat"), "dimensions");
  v19->_depthDataCaptureConnectionConfiguration = (FigDepthDataCaptureConnectionConfiguration *)a7;
  v19->_rgbCameraSourceID = (NSString *)a12;
  int v20 = [(FigCaptureLiDARDepthPipeline *)v19 _buildLiDARDepthPipelineWithVideoSourceCaptureOutput:a8 pointCloudOutput:a9 graph:a10 timeOfFlightCameraType:v15];
  if (v20)
  {
    int v22 = v20;
    fig_log_get_emitter();
    FigDebugAssert3();
    *a13 = v22;

    return 0;
  }
  else
  {
LABEL_3:
    *a13 = 0;
  }
  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureLiDARDepthPipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

- (BWNodeOutput)depthDataSinkOutput
{
  if (self->_depthRotatorNode) {
    depthRotatorNode = self->_depthRotatorNode;
  }
  else {
    depthRotatorNode = self->_pointCloudDensificationNode;
  }
  return (BWNodeOutput *)[depthRotatorNode output];
}

- (int)_buildLiDARDepthPipelineWithVideoSourceCaptureOutput:(id)a3 pointCloudOutput:(id)a4 graph:(id)a5 timeOfFlightCameraType:(int)a6
{
  id v33 = 0;
  v11 = [[BWVideoPointCloudSynchronizerNode alloc] initWithCaptureDevice:self->_captureDevice timeOfFlightCameraType:*(void *)&a6];
  self->_synchronizerNode = v11;
  if (![(FigCapturePipeline *)self addNode:v11 error:&v33]
    || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", a3, -[BWVideoPointCloudSynchronizerNode imageInput](self->_synchronizerNode, "imageInput"), 0) & 1) == 0|| (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", a4, -[BWVideoPointCloudSynchronizerNode pointCloudInput](self->_synchronizerNode, "pointCloudInput"), 0) & 1) == 0)
  {
    goto LABEL_18;
  }
  uint64_t v12 = *MEMORY[0x1E4F52DD8];
  id v13 = [(NSDictionary *)self->_sensorIDStringsByPortType objectForKeyedSubscript:*MEMORY[0x1E4F52DD8]];
  if (!v13
    || (id v14 = v13,
        (id v15 = [(NSDictionary *)self->_cameraInfoByPortType objectForKeyedSubscript:v12]) == 0)
    || (id v16 = v15,
        int v32 = a6,
        uint64_t v17 = *MEMORY[0x1E4F52DE0],
        (id v18 = [(NSDictionary *)self->_sensorIDStringsByPortType objectForKeyedSubscript:*MEMORY[0x1E4F52DE0]]) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12780;
  }
  id v19 = v18;
  id v31 = a5;
  id v20 = [(NSDictionary *)self->_cameraInfoByPortType objectForKeyedSubscript:v17];
  v21 = +[FigCaptureCameraParameters sharedInstance];
  LODWORD(v30) = v32;
  self->_pointCloudDensificationNode = -[BWPointCloudDensificationNode initWithConfiguration:]([BWPointCloudDensificationNode alloc], "initWithConfiguration:", objc_autorelease(-[BWPointCloudDensificationNodeConfiguration initWithRGBSensorConfiguration:timeOfFlightSensorConfiguration:rgbCameraHorizontalSensorBinningFactor:rgbCameraVerticalSensorBinningFactor:filteringEnabled:depthPixelFormat:depthOutputDimensions:timeOfFlightCameraType:]([BWPointCloudDensificationNodeConfiguration alloc], "initWithRGBSensorConfiguration:timeOfFlightSensorConfiguration:rgbCameraHorizontalSensorBinningFactor:rgbCameraVerticalSensorBinningFactor:filteringEnabled:depthPixelFormat:depthOutputDimensions:timeOfFlightCameraType:", objc_autorelease(-[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v12, v14, [(FigCaptureCameraParameters *)v21 sensorIDDictionaryForPortType:v12 sensorIDString:v14],
                                                 v16)),
                                             [[BWSensorConfiguration alloc] initWithPortType:v17 sensorIDString:v19 sensorIDDictionary:[(FigCaptureCameraParameters *)v21 sensorIDDictionaryForPortType:v17 sensorIDString:v19] cameraInfo:v20], self->_rgbCameraHorizontalSensorBinningFactor, self->_rgbCameraVerticalSensorBinningFactor, self->_depthDataFilteringEnabled, self->_depthPixelFormat, *(void *)&self->_depthOutputDimensions, v30)));
  int v22 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.pointcloud.densification" priority:13];
  if (![(FigCapturePipeline *)self addNode:self->_pointCloudDensificationNode error:&v33]) {
    goto LABEL_18;
  }
  if (!objc_msgSend(v31, "connectOutput:toInput:pipelineStage:", -[BWNode output](self->_synchronizerNode, "output"), -[BWNode input](self->_pointCloudDensificationNode, "input"), v22))goto LABEL_12; {
  objc_super v23 = [(FigCaptureConnectionConfiguration *)self->_depthDataCaptureConnectionConfiguration sourceConfiguration];
  }
  BOOL v24 = [(FigCaptureSourceConfiguration *)v23 sourcePosition] == 2;
  LODWORD(v23) = BWDeviceTypeIsExtensionDeviceType([(FigCaptureSourceConfiguration *)v23 sourceDeviceType]);
  int v25 = [(FigVideoCaptureConnectionConfiguration *)self->_depthDataCaptureConnectionConfiguration orientation];
  int v26 = [(FigVideoCaptureConnectionConfiguration *)self->_depthDataCaptureConnectionConfiguration mirroringEnabled];
  [v31 clientExpectsCameraMountedInLandscapeOrientation];
  uint64_t v27 = FigCaptureRotationDegreesFromOrientation(v25, v24, (int)v23, v26);
  if (!v27) {
    goto LABEL_12;
  }
  v28 = [[BWDepthRotatorNode alloc] initWithRotationDegrees:v27 separateDepthComponentsEnabled:0 depthProvidedAsAttachedMedia:1];
  self->_depthRotatorNode = v28;
  if ([(FigCapturePipeline *)self addNode:v28 error:&v33])
  {
    objc_msgSend(v31, "connectOutput:toInput:pipelineStage:", -[BWNode output](self->_pointCloudDensificationNode, "output"), -[BWNode input](self->_depthRotatorNode, "input"), v22);
  }
  else
  {
LABEL_18:
    fig_log_get_emitter();
    FigDebugAssert3();
  }
LABEL_12:
  int result = (int)v33;
  if (v33) {
    return [v33 code];
  }
  return result;
}

- (NSString)rgbCameraSourceID
{
  return self->_rgbCameraSourceID;
}

@end