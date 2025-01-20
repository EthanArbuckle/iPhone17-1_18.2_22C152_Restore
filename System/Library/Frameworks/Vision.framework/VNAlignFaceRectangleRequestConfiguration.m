@interface VNAlignFaceRectangleRequestConfiguration
- (NSArray)inputFaceObservations;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInputFaceObservations:(id)a3;
@end

@implementation VNAlignFaceRectangleRequestConfiguration

- (void).cxx_destruct
{
}

- (void)setInputFaceObservations:(id)a3
{
}

- (NSArray)inputFaceObservations
{
  return self->_inputFaceObservations;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNAlignFaceRectangleRequestConfiguration;
  id v4 = [(VNRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setInputFaceObservations:self->_inputFaceObservations];
  }
  return v5;
}

@end