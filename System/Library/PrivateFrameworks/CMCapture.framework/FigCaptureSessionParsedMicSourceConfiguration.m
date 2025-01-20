@interface FigCaptureSessionParsedMicSourceConfiguration
- (FigCaptureSourceConfiguration)cameraConfigurationForStereoAudioCapture;
- (FigVideoCaptureConnectionConfiguration)movieFileVideoConnectionConfigurationForStereoAudioCapture;
- (NSArray)micConnectionConfigurations;
- (void)dealloc;
- (void)initWithMicConnectionConfigurations:(void *)a3 cameraConfigurationForStereoAudioCapture:(void *)a4 movieFileVideoConnectionConfigurationForStereoAudioCapture:;
@end

@implementation FigCaptureSessionParsedMicSourceConfiguration

- (void)initWithMicConnectionConfigurations:(void *)a3 cameraConfigurationForStereoAudioCapture:(void *)a4 movieFileVideoConnectionConfigurationForStereoAudioCapture:
{
  if (!a1) {
    return 0;
  }
  v9.receiver = a1;
  v9.super_class = (Class)FigCaptureSessionParsedMicSourceConfiguration;
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
  v3.super_class = (Class)FigCaptureSessionParsedMicSourceConfiguration;
  [(FigCaptureSessionParsedMicSourceConfiguration *)&v3 dealloc];
}

- (NSArray)micConnectionConfigurations
{
  return self->_micConnectionConfigurations;
}

- (FigCaptureSourceConfiguration)cameraConfigurationForStereoAudioCapture
{
  return self->_cameraConfigurationForStereoAudioCapture;
}

- (FigVideoCaptureConnectionConfiguration)movieFileVideoConnectionConfigurationForStereoAudioCapture
{
  return self->_movieFileVideoConnectionConfigurationForStereoAudioCapture;
}

@end