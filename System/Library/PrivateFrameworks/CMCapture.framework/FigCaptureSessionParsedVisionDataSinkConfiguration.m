@interface FigCaptureSessionParsedVisionDataSinkConfiguration
- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration;
- (FigVisionDataCaptureConnectionConfiguration)visionDataConnectionConfiguration;
- (void)dealloc;
- (void)initWithVisionDataConnectionConfiguration:(void *)a3 videoDataConnectionConfiguration:;
@end

@implementation FigCaptureSessionParsedVisionDataSinkConfiguration

- (void)initWithVisionDataConnectionConfiguration:(void *)a3 videoDataConnectionConfiguration:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)FigCaptureSessionParsedVisionDataSinkConfiguration;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedVisionDataSinkConfiguration;
  [(FigCaptureSessionParsedVisionDataSinkConfiguration *)&v3 dealloc];
}

- (FigVisionDataCaptureConnectionConfiguration)visionDataConnectionConfiguration
{
  return self->_visionDataConnectionConfiguration;
}

- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration
{
  return self->_videoDataConnectionConfiguration;
}

@end