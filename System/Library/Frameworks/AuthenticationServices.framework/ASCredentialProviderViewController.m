@interface ASCredentialProviderViewController
- (ASCredentialProviderExtensionContext)extensionContext;
- (void)prepareInterfaceToProvideCredentialForRequest:(id)credentialRequest;
- (void)provideCredentialWithoutUserInteractionForIdentity:(ASPasswordCredentialIdentity *)credentialIdentity;
- (void)provideCredentialWithoutUserInteractionForRequest:(id)credentialRequest;
@end

@implementation ASCredentialProviderViewController

- (ASCredentialProviderExtensionContext)extensionContext
{
  v4.receiver = self;
  v4.super_class = (Class)ASCredentialProviderViewController;
  v2 = [(ASCredentialProviderViewController *)&v4 extensionContext];

  return (ASCredentialProviderExtensionContext *)v2;
}

- (void)provideCredentialWithoutUserInteractionForIdentity:(ASPasswordCredentialIdentity *)credentialIdentity
{
  id v4 = +[ASPasswordCredentialRequest requestWithCredentialIdentity:credentialIdentity];
  [(ASCredentialProviderViewController *)self provideCredentialWithoutUserInteractionForRequest:v4];
}

- (void)provideCredentialWithoutUserInteractionForRequest:(id)credentialRequest
{
  id v7 = credentialRequest;
  id v4 = [v7 credentialIdentity];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v7 credentialIdentity];
    [(ASCredentialProviderViewController *)self provideCredentialWithoutUserInteractionForIdentity:v6];
  }
}

- (void)prepareInterfaceToProvideCredentialForRequest:(id)credentialRequest
{
  id v7 = credentialRequest;
  id v4 = [v7 credentialIdentity];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v7 credentialIdentity];
    [(ASCredentialProviderViewController *)self prepareInterfaceToProvideCredentialForIdentity:v6];
  }
}

@end