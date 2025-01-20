@interface _HMPrivacySettingsProvider
- (unint64_t)cachedAuthorizationStatus;
- (unint64_t)queryAuthorizationStatus;
- (void)requestHomeKitAccessWithQueue:(id)a3 completion:(id)a4;
- (void)requestMicrophoneAccessWithQueue:(id)a3 completion:(id)a4;
@end

@implementation _HMPrivacySettingsProvider

- (void)requestHomeKitAccessWithQueue:(id)a3 completion:(id)a4
{
}

- (unint64_t)queryAuthorizationStatus
{
  unint64_t result = HMPrivacyGetAuthorizationStatusForHomeKit();
  self->_cachedAuthorizationStatus = result;
  return result;
}

- (void)requestMicrophoneAccessWithQueue:(id)a3 completion:(id)a4
{
}

- (unint64_t)cachedAuthorizationStatus
{
  unint64_t result = self->_cachedAuthorizationStatus;
  if ((result & 1) == 0)
  {
    unint64_t result = [(_HMPrivacySettingsProvider *)self queryAuthorizationStatus];
    self->_cachedAuthorizationStatus = result;
  }
  return result;
}

@end