@interface VSIdentityProviderInfoQueryResult
- (NSString)designatedAppBundleIdentifier;
- (VSIdentityProvider)identityProvider;
- (id)description;
- (void)setDesignatedAppBundleIdentifier:(id)a3;
- (void)setIdentityProvider:(id)a3;
@end

@implementation VSIdentityProviderInfoQueryResult

- (id)description
{
  v3 = NSString;
  v4 = [(VSIdentityProviderInfoQueryResult *)self identityProvider];
  v5 = [(VSIdentityProviderInfoQueryResult *)self designatedAppBundleIdentifier];
  v6 = [v3 stringWithFormat:@"<VSSetTopBoxInfoQueryResult: %p idenityProvider=%@ designatedAppBundleIdentifier=%@>", self, v4, v5];

  return v6;
}

- (VSIdentityProvider)identityProvider
{
  return self->_identityProvider;
}

- (void)setIdentityProvider:(id)a3
{
}

- (NSString)designatedAppBundleIdentifier
{
  return self->_designatedAppBundleIdentifier;
}

- (void)setDesignatedAppBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedAppBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_identityProvider, 0);
}

@end