@interface HDClientKeepAliveAssertion
@end

@implementation HDClientKeepAliveAssertion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadOptions, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_lastLaunchAttempt, 0);
}

@end