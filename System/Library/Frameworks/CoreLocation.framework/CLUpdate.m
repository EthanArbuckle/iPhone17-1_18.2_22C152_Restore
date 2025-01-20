@interface CLUpdate
- (BOOL)accuracyLimited;
- (BOOL)authorizationDenied;
- (BOOL)authorizationDeniedGlobally;
- (BOOL)authorizationRequestInProgress;
- (BOOL)authorizationRestricted;
- (BOOL)insufficientlyInUse;
- (BOOL)isStationary;
- (BOOL)locationUnavailable;
- (BOOL)serviceSessionRequired;
- (BOOL)stationary;
- (CLLocation)location;
- (CLUpdate)initWithLocation:(id)a3 diagnostics:(unint64_t)a4;
- (void)dealloc;
@end

@implementation CLUpdate

- (CLUpdate)initWithLocation:(id)a3 diagnostics:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CLUpdate;
  v6 = [(CLUpdate *)&v9 init];
  if (v6)
  {
    v7 = (CLLocation *)a3;
    v6->_diagnostics = a4;
    v6->_location = v7;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLUpdate;
  [(CLUpdate *)&v3 dealloc];
}

- (BOOL)authorizationDenied
{
  if ([(CLUpdate *)self authorizationDeniedGlobally]) {
    return 1;
  }
  else {
    return self->_diagnostics & 1;
  }
}

- (BOOL)authorizationDeniedGlobally
{
  return (LOBYTE(self->_diagnostics) >> 1) & 1;
}

- (BOOL)authorizationRestricted
{
  return (LOBYTE(self->_diagnostics) >> 2) & 1;
}

- (BOOL)stationary
{
  return (LOBYTE(self->_diagnostics) >> 3) & 1;
}

- (BOOL)isStationary
{
  return MEMORY[0x1F4181798](self, sel_stationary);
}

- (BOOL)insufficientlyInUse
{
  return (LOBYTE(self->_diagnostics) >> 4) & 1;
}

- (BOOL)locationUnavailable
{
  return (LOBYTE(self->_diagnostics) >> 5) & 1;
}

- (BOOL)accuracyLimited
{
  return (LOBYTE(self->_diagnostics) >> 6) & 1;
}

- (BOOL)serviceSessionRequired
{
  return (BYTE1(self->_diagnostics) >> 4) & 1;
}

- (BOOL)authorizationRequestInProgress
{
  return (BYTE1(self->_diagnostics) >> 5) & 1;
}

- (CLLocation)location
{
  return self->_location;
}

@end