@interface VCMediaNegotiatorResultsMediaRecorder
- (int)imageType;
- (int)videoCodec;
- (unsigned)capabilities;
- (void)setCapabilities:(unsigned int)a3;
- (void)setImageType:(int)a3;
- (void)setVideoCodec:(int)a3;
@end

@implementation VCMediaNegotiatorResultsMediaRecorder

- (unsigned)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unsigned int)a3
{
  self->_capabilities = a3;
}

- (int)imageType
{
  return self->_imageType;
}

- (void)setImageType:(int)a3
{
  self->_imageType = a3;
}

- (int)videoCodec
{
  return self->_videoCodec;
}

- (void)setVideoCodec:(int)a3
{
  self->_videoCodec = a3;
}

@end