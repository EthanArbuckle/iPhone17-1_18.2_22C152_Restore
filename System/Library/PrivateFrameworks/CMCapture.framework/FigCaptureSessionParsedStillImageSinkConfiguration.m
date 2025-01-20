@interface FigCaptureSessionParsedStillImageSinkConfiguration
- (FigPointCloudDataCaptureConnectionConfiguration)pointCloudDataConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)movieFileVideoConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration;
- (void)dealloc;
- (void)initWithStillImageConnectionConfiguration:(void *)a3 movieFileVideoConnectionConfiguration:(void *)a4 pointCloudDataConnectionConfiguration:;
@end

@implementation FigCaptureSessionParsedStillImageSinkConfiguration

- (void)initWithStillImageConnectionConfiguration:(void *)a3 movieFileVideoConnectionConfiguration:(void *)a4 pointCloudDataConnectionConfiguration:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)FigCaptureSessionParsedStillImageSinkConfiguration;
  v7 = objc_msgSendSuper2(&v9, sel_init);
  if (v7)
  {
    v7[1] = a2;
    v7[2] = a3;
    v7[3] = a4;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedStillImageSinkConfiguration;
  [(FigCaptureSessionParsedStillImageSinkConfiguration *)&v3 dealloc];
}

- (FigVideoCaptureConnectionConfiguration)movieFileVideoConnectionConfiguration
{
  return self->_movieFileVideoConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)stillImageConnectionConfiguration
{
  return self->_stillImageConnectionConfiguration;
}

- (FigPointCloudDataCaptureConnectionConfiguration)pointCloudDataConnectionConfiguration
{
  return self->_pointCloudDataConnectionConfiguration;
}

@end