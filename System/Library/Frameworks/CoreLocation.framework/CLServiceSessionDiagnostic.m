@interface CLServiceSessionDiagnostic
- (BOOL)alwaysAuthorizationDenied;
- (BOOL)authorizationDenied;
- (BOOL)authorizationDeniedGlobally;
- (BOOL)authorizationRequestInProgress;
- (BOOL)authorizationRestricted;
- (BOOL)fullAccuracyDenied;
- (BOOL)insufficientlyInUse;
- (BOOL)serviceSessionRequired;
- (CLServiceSessionDiagnostic)initWithDiagnostics:(unint64_t)a3;
- (void)dealloc;
@end

@implementation CLServiceSessionDiagnostic

- (CLServiceSessionDiagnostic)initWithDiagnostics:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLServiceSessionDiagnostic;
  result = [(CLServiceSessionDiagnostic *)&v5 init];
  if (result) {
    result->_diagnostics = a3;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CLServiceSessionDiagnostic;
  [(CLServiceSessionDiagnostic *)&v2 dealloc];
}

- (BOOL)authorizationDenied
{
  if ([(CLServiceSessionDiagnostic *)self authorizationDeniedGlobally]) {
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

- (BOOL)insufficientlyInUse
{
  return (LOBYTE(self->_diagnostics) >> 4) & 1;
}

- (BOOL)serviceSessionRequired
{
  return (BYTE1(self->_diagnostics) >> 4) & 1;
}

- (BOOL)fullAccuracyDenied
{
  return (BYTE1(self->_diagnostics) >> 3) & 1;
}

- (BOOL)alwaysAuthorizationDenied
{
  return (BYTE1(self->_diagnostics) >> 2) & 1;
}

- (BOOL)authorizationRequestInProgress
{
  return (BYTE1(self->_diagnostics) >> 5) & 1;
}

@end