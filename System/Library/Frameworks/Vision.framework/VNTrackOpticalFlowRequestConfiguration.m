@interface VNTrackOpticalFlowRequestConfiguration
- (BOOL)keepNetworkOutput;
- (VNTrackOpticalFlowRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)computationAccuracy;
- (unsigned)outputPixelFormat;
- (void)setComputationAccuracy:(unint64_t)a3;
- (void)setKeepNetworkOutput:(BOOL)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
@end

@implementation VNTrackOpticalFlowRequestConfiguration

- (void)setKeepNetworkOutput:(BOOL)a3
{
  self->_keepNetworkOutput = a3;
}

- (BOOL)keepNetworkOutput
{
  return self->_keepNetworkOutput;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setComputationAccuracy:(unint64_t)a3
{
  self->_computationAccuracy = a3;
}

- (unint64_t)computationAccuracy
{
  return self->_computationAccuracy;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNTrackOpticalFlowRequestConfiguration;
  id v4 = [(VNStatefulRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setComputationAccuracy:self->_computationAccuracy];
    [v5 setOutputPixelFormat:self->_outputPixelFormat];
    [v5 setKeepNetworkOutput:self->_keepNetworkOutput];
  }
  return v5;
}

- (VNTrackOpticalFlowRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNTrackOpticalFlowRequestConfiguration;
  result = [(VNStatefulRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_computationAccuracy = 1;
    result->_outputPixelFormat = 843264102;
    result->_keepNetworkOutput = 0;
  }
  return result;
}

@end