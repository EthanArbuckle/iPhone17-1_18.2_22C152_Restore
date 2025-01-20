@interface AKSecurityUpgradeEligibilityRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
@end

@implementation AKSecurityUpgradeEligibilityRequestProvider

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_msgSend(v6, "ak_addPRKRequestHeader");
  v7 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
  v8 = [v7 securityUpgradeContext];
  [v6 setValue:v8 forHTTPHeaderField:AKAuthenticationSecurityUpgradeContextHeaderFieldKey];

  v10.receiver = self;
  v10.super_class = (Class)AKSecurityUpgradeEligibilityRequestProvider;
  LOBYTE(a4) = [(AKGrandSlamRequestProvider *)&v10 signRequest:v6 error:a4];

  return (char)a4;
}

@end