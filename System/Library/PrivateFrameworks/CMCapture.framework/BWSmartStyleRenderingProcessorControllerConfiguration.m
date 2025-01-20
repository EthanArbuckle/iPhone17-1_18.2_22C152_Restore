@interface BWSmartStyleRenderingProcessorControllerConfiguration
- (BOOL)inferencesNotAvailableForSmartStyleRendering;
- (BOOL)reversibilityEnabled;
- (int)lossyCompressionLevel;
- (int)version;
- (unsigned)linearYUVPixelFormat;
- (void)dealloc;
- (void)setInferencesNotAvailableForSmartStyleRendering:(BOOL)a3;
- (void)setLinearYUVPixelFormat:(unsigned int)a3;
- (void)setLossyCompressionLevel:(int)a3;
- (void)setReversibilityEnabled:(BOOL)a3;
- (void)setVersion:(int)a3;
@end

@implementation BWSmartStyleRenderingProcessorControllerConfiguration

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWSmartStyleRenderingProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v2 dealloc];
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (BOOL)reversibilityEnabled
{
  return self->_reversibilityEnabled;
}

- (void)setReversibilityEnabled:(BOOL)a3
{
  self->_reversibilityEnabled = a3;
}

- (int)lossyCompressionLevel
{
  return self->_lossyCompressionLevel;
}

- (void)setLossyCompressionLevel:(int)a3
{
  self->_lossyCompressionLevel = a3;
}

- (unsigned)linearYUVPixelFormat
{
  return self->_linearYUVPixelFormat;
}

- (void)setLinearYUVPixelFormat:(unsigned int)a3
{
  self->_linearYUVPixelFormat = a3;
}

- (BOOL)inferencesNotAvailableForSmartStyleRendering
{
  return self->_inferencesNotAvailableForSmartStyleRendering;
}

- (void)setInferencesNotAvailableForSmartStyleRendering:(BOOL)a3
{
  self->_inferencesNotAvailableForSmartStyleRendering = a3;
}

@end