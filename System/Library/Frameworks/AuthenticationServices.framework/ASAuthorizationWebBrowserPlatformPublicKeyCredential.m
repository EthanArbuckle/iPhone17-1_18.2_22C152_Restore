@interface ASAuthorizationWebBrowserPlatformPublicKeyCredential
- (ASAuthorizationWebBrowserPlatformPublicKeyCredential)initWithCorePasskey:(id)a3;
- (NSData)credentialID;
- (NSData)userHandle;
- (NSString)customTitle;
- (NSString)name;
- (NSString)providerName;
- (NSString)relyingParty;
- (WBSWebBrowserPasskey)corePasskey;
@end

@implementation ASAuthorizationWebBrowserPlatformPublicKeyCredential

- (ASAuthorizationWebBrowserPlatformPublicKeyCredential)initWithCorePasskey:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationWebBrowserPlatformPublicKeyCredential;
  v6 = [(ASAuthorizationWebBrowserPlatformPublicKeyCredential *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_corePasskey, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)name
{
  return (NSString *)[(WBSWebBrowserPasskey *)self->_corePasskey name];
}

- (NSString)relyingParty
{
  return (NSString *)[(WBSWebBrowserPasskey *)self->_corePasskey relyingParty];
}

- (NSData)credentialID
{
  return (NSData *)[(WBSWebBrowserPasskey *)self->_corePasskey credentialID];
}

- (NSData)userHandle
{
  return (NSData *)[(WBSWebBrowserPasskey *)self->_corePasskey userHandle];
}

- (NSString)customTitle
{
  return (NSString *)[(WBSWebBrowserPasskey *)self->_corePasskey customTitle];
}

- (NSString)providerName
{
  return (NSString *)[(WBSWebBrowserPasskey *)self->_corePasskey providerName];
}

- (WBSWebBrowserPasskey)corePasskey
{
  return self->_corePasskey;
}

- (void).cxx_destruct
{
}

@end