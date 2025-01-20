@interface CXXPCChannelSource
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isConnected;
- (BOOL)isPermittedToUseBluetoothAccessories;
- (BOOL)isPermittedToUsePrivateAPI;
- (BOOL)isPermittedToUsePublicAPI;
- (CXChannelServiceClient)client;
- (CXXPCChannelSource)initWithClient:(id)a3;
- (id)bundleIdentifier;
- (id)bundleURL;
- (id)localizedName;
- (id)vendorProtocolDelegate;
- (int)processIdentifier;
- (void)setClient:(id)a3;
@end

@implementation CXXPCChannelSource

- (CXXPCChannelSource)initWithClient:(id)a3
{
  id v5 = a3;
  v6 = [v5 identifier];
  v9.receiver = self;
  v9.super_class = (Class)CXXPCChannelSource;
  v7 = [(CXAbstractProviderSource *)&v9 initWithIdentifier:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_client, a3);
  }

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  v4 = [(CXXPCChannelSource *)self client];
  if (v4)
  {
    v6 = v4;
    [v4 auditToken];
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)bundleIdentifier
{
  v2 = [(CXXPCChannelSource *)self client];
  v3 = [v2 bundleIdentifier];

  return v3;
}

- (id)bundleURL
{
  v2 = [(CXXPCChannelSource *)self client];
  v3 = [v2 bundleURL];

  return v3;
}

- (BOOL)isConnected
{
  v2 = [(CXXPCChannelSource *)self client];
  char v3 = [v2 isConnected];

  return v3;
}

- (id)localizedName
{
  v2 = [(CXXPCChannelSource *)self client];
  char v3 = [v2 localizedName];

  return v3;
}

- (BOOL)isPermittedToUsePrivateAPI
{
  v2 = [(CXXPCChannelSource *)self client];
  char v3 = [v2 isPermittedToUsePrivateAPI];

  return v3;
}

- (BOOL)isPermittedToUsePublicAPI
{
  v2 = [(CXXPCChannelSource *)self client];
  char v3 = [v2 isPermittedToUsePublicAPI];

  return v3;
}

- (BOOL)isPermittedToUseBluetoothAccessories
{
  v2 = [(CXXPCChannelSource *)self client];
  char v3 = [v2 isPermittedToUseBluetoothAccessories];

  return v3;
}

- (int)processIdentifier
{
  v2 = [(CXXPCChannelSource *)self client];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (id)vendorProtocolDelegate
{
  v2 = [(CXXPCChannelSource *)self client];
  int v3 = [v2 connection];
  v4 = [v3 remoteTarget];

  return v4;
}

- (CXChannelServiceClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (void).cxx_destruct
{
}

@end