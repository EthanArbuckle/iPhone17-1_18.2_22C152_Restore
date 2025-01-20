@interface FigCaptureSessionParsedCinematographyConfiguration
- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration;
- (void)dealloc;
- (void)initWithVideoPreviewSinkConnectionConfiguration:(void *)a1;
@end

@implementation FigCaptureSessionParsedCinematographyConfiguration

- (void)initWithVideoPreviewSinkConnectionConfiguration:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v5.receiver = a1;
  v5.super_class = (Class)FigCaptureSessionParsedCinematographyConfiguration;
  v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = a2;
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedCinematographyConfiguration;
  [(FigCaptureSessionParsedCinematographyConfiguration *)&v3 dealloc];
}

- (FigVideoCaptureConnectionConfiguration)videoPreviewSinkConnectionConfiguration
{
  return self->_videoPreviewSinkConnectionConfiguration;
}

@end