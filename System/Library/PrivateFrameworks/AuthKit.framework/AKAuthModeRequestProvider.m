@interface AKAuthModeRequestProvider
- (BOOL)signRequest:(id)a3 error:(id *)a4;
@end

@implementation AKAuthModeRequestProvider

- (BOOL)signRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AKAuthModeRequestProvider;
  BOOL v7 = [(AKGrandSlamRequestProvider *)&v18 signRequest:v6 error:a4];
  if (v7)
  {
    v8 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v9 = [v8 username];
    objc_msgSend(v6, "ak_addAppleIDHeaderWithValue:", v9);

    v10 = +[AKDevice currentDevice];
    objc_msgSend(v6, "ak_addAppleIDUserModeHeaderWithValue:", objc_msgSend(v10, "isMultiUserMode"));

    v11 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    v12 = [v11 appProvidedContext];

    if (v12)
    {
      v13 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
      v14 = [v13 appProvidedContext];
      objc_msgSend(v6, "ak_addAppProvidedContext:", v14);
    }
    v15 = [(AKURLRequestProviderImpl *)self concreteAuthenticationContext];
    unsigned int v16 = [v15 isContextRequestingReauthForExistingService];

    if (v16) {
      objc_msgSend(v6, "ak_addReAuthenticationHeader");
    }
  }

  return v7;
}

@end