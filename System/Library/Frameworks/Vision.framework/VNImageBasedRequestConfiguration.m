@interface VNImageBasedRequestConfiguration
- (CGRect)regionOfInterest;
- (NSArray)inputDetectedObjectObservations;
- (NSArray)inputFaceObservations;
- (VNImageBasedRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setInputDetectedObjectObservations:(id)a3;
- (void)setInputFaceObservations:(id)a3;
- (void)setRegionOfInterest:(CGRect)a3;
@end

@implementation VNImageBasedRequestConfiguration

- (VNImageBasedRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNImageBasedRequestConfiguration;
  result = [(VNRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_regionOfInterest = VNNormalizedIdentityRect;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputDetectedObjectObservations, 0);

  objc_storeStrong((id *)&self->_inputFaceObservations, 0);
}

- (NSArray)inputFaceObservations
{
  return self->_inputFaceObservations;
}

- (CGRect)regionOfInterest
{
  double x = self->_regionOfInterest.origin.x;
  double y = self->_regionOfInterest.origin.y;
  double width = self->_regionOfInterest.size.width;
  double height = self->_regionOfInterest.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setInputDetectedObjectObservations:(id)a3
{
}

- (NSArray)inputDetectedObjectObservations
{
  return self->_inputDetectedObjectObservations;
}

- (void)setInputFaceObservations:(id)a3
{
}

- (void)setRegionOfInterest:(CGRect)a3
{
  self->_regionOfInterest = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNImageBasedRequestConfiguration;
  id v4 = [(VNRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRegionOfInterest:", self->_regionOfInterest.origin.x, self->_regionOfInterest.origin.y, self->_regionOfInterest.size.width, self->_regionOfInterest.size.height);
    [v5 setInputFaceObservations:self->_inputFaceObservations];
    [v5 setInputDetectedObjectObservations:self->_inputDetectedObjectObservations];
  }
  return v5;
}

@end