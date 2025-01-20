@interface ASAuthorizationProviderExtensionAuthorizationRequest
- (ASAuthorizationProviderAuthorizationOperation)requestedOperation;
- (ASAuthorizationProviderExtensionAuthorizationRequest)initWithAuthorizationRequest:(id)a3;
- (BOOL)isCallerManaged;
- (BOOL)isUserInterfaceEnabled;
- (NSData)httpBody;
- (NSDictionary)authorizationOptions;
- (NSDictionary)extensionData;
- (NSDictionary)httpHeaders;
- (NSString)callerBundleIdentifier;
- (NSString)callerTeamIdentifier;
- (NSString)localizedCallerDisplayName;
- (NSString)realm;
- (NSURL)url;
- (SOAuthorizationRequest)authorizationRequest;
- (void)cancel;
- (void)complete;
- (void)completeWithAuthorizationResult:(ASAuthorizationProviderExtensionAuthorizationResult *)authorizationResult;
- (void)completeWithError:(NSError *)error;
- (void)completeWithHTTPAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders;
- (void)completeWithHTTPResponse:(NSHTTPURLResponse *)httpResponse httpBody:(NSData *)httpBody;
- (void)doNotHandle;
- (void)presentAuthorizationViewControllerWithCompletion:(void *)completion;
@end

@implementation ASAuthorizationProviderExtensionAuthorizationRequest

- (ASAuthorizationProviderExtensionAuthorizationRequest)initWithAuthorizationRequest:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationProviderExtensionAuthorizationRequest;
  v6 = [(ASAuthorizationProviderExtensionAuthorizationRequest *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_authorizationRequest, a3);
    v8 = v7;
  }

  return v7;
}

- (void)doNotHandle
{
}

- (void)cancel
{
}

- (void)complete
{
}

- (void)completeWithHTTPAuthorizationHeaders:(NSDictionary *)httpAuthorizationHeaders
{
}

- (void)completeWithHTTPResponse:(NSHTTPURLResponse *)httpResponse httpBody:(NSData *)httpBody
{
}

- (void)completeWithError:(NSError *)error
{
}

- (void)completeWithAuthorizationResult:(ASAuthorizationProviderExtensionAuthorizationResult *)authorizationResult
{
  authorizationRequest = self->_authorizationRequest;
  id v4 = [(ASAuthorizationProviderExtensionAuthorizationResult *)authorizationResult authorizationResult];
  [(SOAuthorizationRequest *)authorizationRequest completeWithAuthorizationResult:v4];
}

- (void)presentAuthorizationViewControllerWithCompletion:(void *)completion
{
}

- (NSURL)url
{
  return (NSURL *)[(SOAuthorizationRequest *)self->_authorizationRequest url];
}

- (ASAuthorizationProviderAuthorizationOperation)requestedOperation
{
  return (ASAuthorizationProviderAuthorizationOperation)[(SOAuthorizationRequest *)self->_authorizationRequest requestedOperation];
}

- (NSDictionary)httpHeaders
{
  return (NSDictionary *)[(SOAuthorizationRequest *)self->_authorizationRequest httpHeaders];
}

- (NSData)httpBody
{
  return (NSData *)[(SOAuthorizationRequest *)self->_authorizationRequest httpBody];
}

- (NSString)realm
{
  return (NSString *)[(SOAuthorizationRequest *)self->_authorizationRequest realm];
}

- (NSDictionary)extensionData
{
  return (NSDictionary *)[(SOAuthorizationRequest *)self->_authorizationRequest extensionData];
}

- (NSString)callerBundleIdentifier
{
  return (NSString *)[(SOAuthorizationRequest *)self->_authorizationRequest callerBundleIdentifier];
}

- (NSDictionary)authorizationOptions
{
  return (NSDictionary *)[(SOAuthorizationRequest *)self->_authorizationRequest authorizationOptions];
}

- (BOOL)isCallerManaged
{
  return [(SOAuthorizationRequest *)self->_authorizationRequest isCallerManaged];
}

- (NSString)callerTeamIdentifier
{
  return (NSString *)[(SOAuthorizationRequest *)self->_authorizationRequest callerTeamIdentifier];
}

- (NSString)localizedCallerDisplayName
{
  return (NSString *)[(SOAuthorizationRequest *)self->_authorizationRequest localizedCallerDisplayName];
}

- (BOOL)isUserInterfaceEnabled
{
  return [(SOAuthorizationRequest *)self->_authorizationRequest isUserInteractionEnabled];
}

- (SOAuthorizationRequest)authorizationRequest
{
  return self->_authorizationRequest;
}

- (void).cxx_destruct
{
}

@end