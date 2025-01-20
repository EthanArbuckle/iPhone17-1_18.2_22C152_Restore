@interface FigCaptureSessionParsedDepthDataSinkConfiguration
- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration;
- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration;
- (void)dealloc;
- (void)initWithDepthDataConnectionConfiguration:(void *)a3 videoDataConnectionConfiguration:(void *)a4 metadataObjectConnectionConfiguration:;
@end

@implementation FigCaptureSessionParsedDepthDataSinkConfiguration

- (void)initWithDepthDataConnectionConfiguration:(void *)a3 videoDataConnectionConfiguration:(void *)a4 metadataObjectConnectionConfiguration:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)FigCaptureSessionParsedDepthDataSinkConfiguration;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = a3;
    v7[3] = a4;
  }
  return v7;
}

- (FigDepthDataCaptureConnectionConfiguration)depthDataConnectionConfiguration
{
  return self->_depthDataConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration
{
  return self->_videoDataConnectionConfiguration;
}

- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration
{
  return self->_metadataObjectConnectionConfiguration;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedDepthDataSinkConfiguration;
  [(FigCaptureSessionParsedDepthDataSinkConfiguration *)&v3 dealloc];
}

@end