@interface AuthenticationClientProxy
- (void)didFinishOnboardingWithError:(id)a3;
@end

@implementation AuthenticationClientProxy

- (void).cxx_destruct
{
}

- (void)didFinishOnboardingWithError:(id)a3
{
  id v5 = a3;
  v6 = self;
  AuthenticationClientProxy.didFinishOnboarding(error:)((NSError_optional *)a3);
}

@end