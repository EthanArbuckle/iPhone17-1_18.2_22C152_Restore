@interface VNCreateFaceprintRequestConfiguration
- (BOOL)forceFaceprintCreation;
- (VNCreateFaceprintRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setForceFaceprintCreation:(BOOL)a3;
@end

@implementation VNCreateFaceprintRequestConfiguration

- (void)setForceFaceprintCreation:(BOOL)a3
{
  self->_forceFaceprintCreation = a3;
}

- (BOOL)forceFaceprintCreation
{
  return self->_forceFaceprintCreation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNCreateFaceprintRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4) {
    [v4 setForceFaceprintCreation:self->_forceFaceprintCreation];
  }
  return v5;
}

- (VNCreateFaceprintRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNCreateFaceprintRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result) {
    result->_forceFaceprintCreation = 0;
  }
  return result;
}

@end