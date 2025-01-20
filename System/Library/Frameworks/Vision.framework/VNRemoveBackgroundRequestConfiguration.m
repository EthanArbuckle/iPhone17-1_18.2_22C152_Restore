@interface VNRemoveBackgroundRequestConfiguration
- (BOOL)cropResult;
- (BOOL)performInPlace;
- (BOOL)returnMask;
- (VNRemoveBackgroundRequestConfiguration)initWithRequestClass:(Class)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCropResult:(BOOL)a3;
- (void)setPerformInPlace:(BOOL)a3;
- (void)setReturnMask:(BOOL)a3;
@end

@implementation VNRemoveBackgroundRequestConfiguration

- (void)setReturnMask:(BOOL)a3
{
  self->_returnMask = a3;
}

- (BOOL)returnMask
{
  return self->_returnMask;
}

- (void)setCropResult:(BOOL)a3
{
  self->_cropResult = a3;
}

- (BOOL)cropResult
{
  return self->_cropResult;
}

- (void)setPerformInPlace:(BOOL)a3
{
  self->_performInPlace = a3;
}

- (BOOL)performInPlace
{
  return self->_performInPlace;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VNRemoveBackgroundRequestConfiguration;
  id v4 = [(VNImageBasedRequestConfiguration *)&v6 copyWithZone:a3];
  [v4 setPerformInPlace:self->_performInPlace];
  [v4 setCropResult:self->_cropResult];
  [v4 setReturnMask:self->_returnMask];
  return v4;
}

- (VNRemoveBackgroundRequestConfiguration)initWithRequestClass:(Class)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VNRemoveBackgroundRequestConfiguration;
  result = [(VNImageBasedRequestConfiguration *)&v4 initWithRequestClass:a3];
  if (result)
  {
    result->_performInPlace = 0;
    result->_cropResult = 0;
    result->_returnMask = 0;
  }
  return result;
}

@end