@interface BWSWFRProcessorControllerConfiguration
- (int)lossyCompressionLevel;
- (int)version;
- (void)dealloc;
- (void)setLossyCompressionLevel:(int)a3;
- (void)setVersion:(int)a3;
@end

@implementation BWSWFRProcessorControllerConfiguration

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (void)setLossyCompressionLevel:(int)a3
{
  self->_lossyCompressionLevel = a3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWSWFRProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v2 dealloc];
}

- (int)version
{
  return self->_version;
}

- (int)lossyCompressionLevel
{
  return self->_lossyCompressionLevel;
}

@end