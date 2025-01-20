@interface AKOwnerProxyClient
- (AKOwnerProxyClient)initWithCredentialRequest:(id)a3;
- (AKOwnerProxyClient)initWithCredentialRequest:(id)a3 connection:(id)a4;
- (BOOL)hasInternalAccess;
- (BOOL)hasOwnerAccess;
- (BOOL)hasPrivateAccess;
- (BOOL)hasPrivateSignedAccess;
- (BOOL)hasPublicAccess;
- (BOOL)hasWriteAccess;
- (id)appID;
- (id)bundleID;
- (id)description;
- (id)localizedAppName;
- (id)name;
- (id)teamID;
@end

@implementation AKOwnerProxyClient

- (AKOwnerProxyClient)initWithCredentialRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKOwnerProxyClient;
  v6 = [(AKClient *)&v9 initWithConnection:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_credentialRequest, a3);
  }

  return v7;
}

- (AKOwnerProxyClient)initWithCredentialRequest:(id)a3 connection:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKOwnerProxyClient;
  v8 = [(AKClient *)&v11 initWithConnection:a4];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_credentialRequest, a3);
  }

  return v9;
}

- (id)description
{
  v2 = [(AKOwnerProxyClient *)self name];
  v3 = +[NSString stringWithFormat:@"AKOwnerProxyClient: %@", v2];

  return v3;
}

- (BOOL)hasInternalAccess
{
  return 1;
}

- (BOOL)hasPrivateAccess
{
  return 1;
}

- (BOOL)hasPrivateSignedAccess
{
  return 1;
}

- (BOOL)hasPublicAccess
{
  return 0;
}

- (BOOL)hasWriteAccess
{
  return 1;
}

- (BOOL)hasOwnerAccess
{
  return 1;
}

- (id)name
{
  if (([(AKCredentialRequestContext *)self->_credentialRequest _clientShouldAuthenticateExternally] & 1) != 0|| [(AKCredentialRequestContext *)self->_credentialRequest _shouldUseProxiedClientBundleIDForSRP])
  {
    v6.receiver = self;
    v6.super_class = (Class)AKOwnerProxyClient;
    v3 = [(AKClient *)&v6 name];
  }
  else
  {
    v4 = [(AKOwnerProxyClient *)self localizedAppName];
    v3 = +[NSString stringWithFormat:@"akd [on behalf of %@]", v4];
  }

  return v3;
}

- (id)localizedAppName
{
  return [(AKCredentialRequestContext *)self->_credentialRequest _proxiedClientAppName];
}

- (id)bundleID
{
  return [(AKCredentialRequestContext *)self->_credentialRequest _proxiedClientBundleID];
}

- (id)appID
{
  return [(AKCredentialRequestContext *)self->_credentialRequest _proxiedClientAppID];
}

- (id)teamID
{
  return [(AKCredentialRequestContext *)self->_credentialRequest _proxiedClientTeamID];
}

- (void).cxx_destruct
{
}

@end