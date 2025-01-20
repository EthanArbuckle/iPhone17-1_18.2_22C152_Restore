@interface LAAuthenticationBiometricMethodConfiguration
- (BOOL)autoRetry;
- (BOOL)avoidUsingFaceIDCamera;
- (LAAuthenticationBiometricMethodConfiguration)initWithAutoRetry:(BOOL)a3 avoidUsingFaceIDCamera:(BOOL)a4 allowedUsers:(id)a5 authenticationContext:(id)a6;
@end

@implementation LAAuthenticationBiometricMethodConfiguration

- (LAAuthenticationBiometricMethodConfiguration)initWithAutoRetry:(BOOL)a3 avoidUsingFaceIDCamera:(BOOL)a4 allowedUsers:(id)a5 authenticationContext:(id)a6
{
  v9.receiver = self;
  v9.super_class = (Class)LAAuthenticationBiometricMethodConfiguration;
  result = [(LAAuthenticationMethodConfiguration *)&v9 initWithAllowedUsers:a5 authenticationContext:a6];
  if (result)
  {
    result->_autoRetry = a3;
    result->_avoidUsingFaceIDCamera = a4;
  }
  return result;
}

- (BOOL)autoRetry
{
  return self->_autoRetry;
}

- (BOOL)avoidUsingFaceIDCamera
{
  return self->_avoidUsingFaceIDCamera;
}

@end