@interface FigCaptureSessionParsedVideoDataSinkConfiguration
- (FigCaptureSourceConfiguration)cameraConfiguration;
- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration;
- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration;
- (id)_setMetadataObjectConnectionConfiguration:(id *)result;
- (id)initWithVideoDataConnectionConfiguration:(void *)a1;
- (int)sourceDeviceType;
- (void)dealloc;
@end

@implementation FigCaptureSessionParsedVideoDataSinkConfiguration

- (FigCaptureSourceConfiguration)cameraConfiguration
{
  return self->_cameraConfiguration;
}

- (id)_setMetadataObjectConnectionConfiguration:(id *)result
{
  if (result)
  {
    v3 = result;

    result = a2;
    v3[2] = result;
    if (!v3[1])
    {
      v3[3] = (id)[result sourceConfiguration];
      result = (id *)[v3[2] underlyingDeviceType];
      *((_DWORD *)v3 + 8) = result;
    }
  }
  return result;
}

- (id)initWithVideoDataConnectionConfiguration:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)FigCaptureSessionParsedVideoDataSinkConfiguration;
  id v3 = objc_msgSendSuper2(&v7, sel_init);
  id v4 = v3;
  if (a2 && v3)
  {
    id v5 = a2;
    *((void *)v4 + 1) = v5;
    *((void *)v4 + 3) = (id)[v5 sourceConfiguration];
    *((_DWORD *)v4 + 8) = [*((id *)v4 + 1) underlyingDeviceType];
  }
  return v4;
}

- (int)sourceDeviceType
{
  return self->_sourceDeviceType;
}

- (FigVideoCaptureConnectionConfiguration)videoDataConnectionConfiguration
{
  return self->_videoDataConnectionConfiguration;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionParsedVideoDataSinkConfiguration;
  [(FigCaptureSessionParsedVideoDataSinkConfiguration *)&v3 dealloc];
}

- (FigMetadataObjectCaptureConnectionConfiguration)metadataObjectConnectionConfiguration
{
  return self->_metadataObjectConnectionConfiguration;
}

@end