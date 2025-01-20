@interface ASAuthorizationSingleSignOnProvider
+ (ASAuthorizationSingleSignOnProvider)authorizationProviderWithIdentityProviderURL:(NSURL *)url;
+ (ASAuthorizationSingleSignOnProvider)new;
- (ASAuthorizationSingleSignOnProvider)init;
- (ASAuthorizationSingleSignOnProvider)initWithURL:(id)a3;
- (ASAuthorizationSingleSignOnRequest)createRequest;
- (BOOL)canPerformAuthorization;
- (NSURL)url;
@end

@implementation ASAuthorizationSingleSignOnProvider

+ (ASAuthorizationSingleSignOnProvider)new
{
  return 0;
}

+ (ASAuthorizationSingleSignOnProvider)authorizationProviderWithIdentityProviderURL:(NSURL *)url
{
  v4 = url;
  v5 = (void *)[objc_alloc((Class)a1) initWithURL:v4];

  return (ASAuthorizationSingleSignOnProvider *)v5;
}

- (ASAuthorizationSingleSignOnProvider)init
{
  return 0;
}

- (ASAuthorizationSingleSignOnProvider)initWithURL:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASAuthorizationSingleSignOnProvider;
  v6 = [(ASAuthorizationSingleSignOnProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_url, a3);
  }

  return v7;
}

- (BOOL)canPerformAuthorization
{
  return [MEMORY[0x263F25240] canPerformAuthorizationWithURL:self->_url responseCode:0 useInternalExtensions:0];
}

- (ASAuthorizationSingleSignOnRequest)createRequest
{
  v2 = +[ASAuthorizationSingleSignOnProvider authorizationProviderWithIdentityProviderURL:self->_url];
  v3 = [[ASAuthorizationSingleSignOnRequest alloc] initWithProvider:v2];

  return v3;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end