@interface BiometricKitEnrollProgressMergedComponent
- (BiometricKitEnrollProgressCoordinates)transformationCoordinates;
- (BiometricKitEnrollProgressMergedComponent)init;
- (int64_t)componentID;
- (void)dealloc;
- (void)setComponentID:(int64_t)a3;
- (void)setTransformationCoordinates:(id)a3;
@end

@implementation BiometricKitEnrollProgressMergedComponent

- (BiometricKitEnrollProgressMergedComponent)init
{
  v6.receiver = self;
  v6.super_class = (Class)BiometricKitEnrollProgressMergedComponent;
  v2 = [(BiometricKitEnrollProgressMergedComponent *)&v6 init];
  v3 = v2;
  if (v2)
  {
    transformationCoordinates = v2->_transformationCoordinates;
    v2->_transformationCoordinates = 0;
  }
  return v3;
}

- (void)dealloc
{
  [(BiometricKitEnrollProgressMergedComponent *)self setTransformationCoordinates:0];
  v3.receiver = self;
  v3.super_class = (Class)BiometricKitEnrollProgressMergedComponent;
  [(BiometricKitEnrollProgressMergedComponent *)&v3 dealloc];
}

- (int64_t)componentID
{
  return self->_componentID;
}

- (void)setComponentID:(int64_t)a3
{
  self->_componentID = a3;
}

- (BiometricKitEnrollProgressCoordinates)transformationCoordinates
{
  return self->_transformationCoordinates;
}

- (void)setTransformationCoordinates:(id)a3
{
}

- (void).cxx_destruct
{
}

@end