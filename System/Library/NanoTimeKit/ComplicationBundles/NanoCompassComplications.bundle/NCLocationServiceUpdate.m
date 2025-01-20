@interface NCLocationServiceUpdate
- (BOOL)coarsePrecision;
- (BOOL)locationServicesConsideredOff;
- (NCLocationServiceUpdate)init;
- (NCLocationServiceUpdate)initWithAuthorizationStatus:(int)a3 coarsePrecision:(BOOL)a4;
- (int)authorizationStatus;
@end

@implementation NCLocationServiceUpdate

- (NCLocationServiceUpdate)init
{
  return (NCLocationServiceUpdate *)objc_msgSend_initWithAuthorizationStatus_coarsePrecision_(self, a2, 4, 0);
}

- (NCLocationServiceUpdate)initWithAuthorizationStatus:(int)a3 coarsePrecision:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NCLocationServiceUpdate;
  result = [(NCLocationServiceUpdate *)&v8 init];
  if (result)
  {
    result->_authorizationStatus = a3;
    result->_coarsePrecision = a4;
    BOOL v7 = a3 < 3 || a4;
    result->_locationServicesConsideredOff = v7;
  }
  return result;
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (BOOL)coarsePrecision
{
  return self->_coarsePrecision;
}

- (BOOL)locationServicesConsideredOff
{
  return self->_locationServicesConsideredOff;
}

@end