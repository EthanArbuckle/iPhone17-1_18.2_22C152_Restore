@interface VNCreateSmartCamprintRequestConfiguration
- (BOOL)returnAllResults;
- (VNCreateSmartCamprintRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setReturnAllResults:(BOOL)a3;
@end

@implementation VNCreateSmartCamprintRequestConfiguration

- (void)setReturnAllResults:(BOOL)a3
{
  self->_returnAllResults = a3;
}

- (BOOL)returnAllResults
{
  return self->_returnAllResults;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNCreateSmartCamprintRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setReturnAllResults:self->_returnAllResults];
  }
  return v5;
}

- (VNCreateSmartCamprintRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNCreateSmartCamprintRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_returnAllResults = 0;
  }
  return result;
}

@end