@interface BWColorConstancyProcessorControllerConfiguration
- (BOOL)clippingRecoveryEnabled;
- (BOOL)saturationBoostEnabled;
- (int)lossyCompressionLevel;
- (int)version;
- (void)dealloc;
- (void)setClippingRecoveryEnabled:(BOOL)a3;
- (void)setLossyCompressionLevel:(int)a3;
- (void)setSaturationBoostEnabled:(BOOL)a3;
- (void)setVersion:(int)a3;
@end

@implementation BWColorConstancyProcessorControllerConfiguration

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)BWColorConstancyProcessorControllerConfiguration;
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

- (int)lossyCompressionLevel
{
  return self->_lossyCompressionLevel;
}

- (void)setLossyCompressionLevel:(int)a3
{
  self->_lossyCompressionLevel = a3;
}

- (BOOL)clippingRecoveryEnabled
{
  return self->_clippingRecoveryEnabled;
}

- (void)setClippingRecoveryEnabled:(BOOL)a3
{
  self->_clippingRecoveryEnabled = a3;
}

- (BOOL)saturationBoostEnabled
{
  return self->_saturationBoostEnabled;
}

- (void)setSaturationBoostEnabled:(BOOL)a3
{
  self->_saturationBoostEnabled = a3;
}

@end