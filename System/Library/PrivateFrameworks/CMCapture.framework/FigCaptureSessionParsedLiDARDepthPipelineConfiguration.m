@interface FigCaptureSessionParsedLiDARDepthPipelineConfiguration
- (FigCaptureSessionParsedLiDARDepthPipelineConfiguration)initWithTimeOfFlightCameraConfiguration:(id)a3 depthDataConnectionConfiguration:(id)a4;
- (FigCaptureSourceConfiguration)timeOfFlightCameraConfiguration;
- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration;
- (void)dealloc;
@end

@implementation FigCaptureSessionParsedLiDARDepthPipelineConfiguration

- (FigCaptureSessionParsedLiDARDepthPipelineConfiguration)initWithTimeOfFlightCameraConfiguration:(id)a3 depthDataConnectionConfiguration:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)FigCaptureSessionParsedLiDARDepthPipelineConfiguration;
  v6 = [(FigCaptureSessionParsedLiDARDepthPipelineConfiguration *)&v8 init];
  if (v6)
  {
    v6->_timeOfFlightCameraConfiguration = (FigCaptureSourceConfiguration *)a3;
    v6->_depthDataConnectionConfiguration = (FigDepthDataCaptureConnectionConfiguration *)a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedLiDARDepthPipelineConfiguration;
  [(FigCaptureSessionParsedLiDARDepthPipelineConfiguration *)&v3 dealloc];
}

- (FigCaptureSourceConfiguration)timeOfFlightCameraConfiguration
{
  return self->_timeOfFlightCameraConfiguration;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

@end