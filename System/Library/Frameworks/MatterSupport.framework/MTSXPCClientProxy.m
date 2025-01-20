@interface MTSXPCClientProxy
- (BOOL)hasDevicePairingEntitlement;
- (BOOL)hasMatterSetupPayloadEntitlement;
- (BOOL)hasPrivateHomeKitEntitlement;
- (MTSXPCClientProxy)initWithConnection:(id)a3;
- (MTSXPCClientProxyDelegate)delegate;
- (MTSXPCConnection)connection;
- (id)attributeDescriptions;
- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3;
- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3;
- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5;
- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4;
- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4;
- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5;
- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)showRestrictedCharacteristicsAccessWarningAlert;
@end

@implementation MTSXPCClientProxy

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setDelegate:(id)a3
{
}

- (MTSXPCClientProxyDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTSXPCClientProxyDelegate *)WeakRetained;
}

- (MTSXPCConnection)connection
{
  return (MTSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(MTSXPCClientProxy *)self connection];
  v5 = (void *)[v3 initWithName:@"Connection" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (void)showRestrictedCharacteristicsAccessWarningAlert
{
  id v3 = [(MTSXPCClientProxy *)self delegate];
  [v3 showRestrictedCharacteristicsAccessWarningAlertWithClientProxy:self];
}

- (void)checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSXPCClientProxy *)self delegate];
  [v5 clientProxy:self checkRestrictedCharacteristicsAccessAllowedWithCompletionHandler:v4];
}

- (void)removeSystemCommissionerPairingWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTSXPCClientProxy *)self delegate];
  [v8 clientProxy:self removeSystemCommissionerPairingWithUUID:v7 completionHandler:v6];
}

- (void)fetchSystemCommissionerPairingsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSXPCClientProxy *)self delegate];
  [v5 clientProxy:self fetchSystemCommissionerPairingsWithCompletionHandler:v4];
}

- (void)performDeviceSetupUsingRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTSXPCClientProxy *)self delegate];
  [v8 clientProxy:self performDeviceSetupUsingRequest:v7 completionHandler:v6];
}

- (void)readCommissioningWindowStatusForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTSXPCClientProxy *)self delegate];
  [v8 clientProxy:self readCommissioningWindowStatusForSystemCommissionerPairingUUID:v7 completionHandler:v6];
}

- (void)openCommissioningWindowForSystemCommissionerPairingUUID:(id)a3 duration:(double)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(MTSXPCClientProxy *)self delegate];
  [v10 clientProxy:self openCommissioningWindowForSystemCommissionerPairingUUID:v9 duration:v8 completionHandler:a4];
}

- (void)removeAllDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTSXPCClientProxy *)self delegate];
  [v8 clientProxy:self removeAllDevicePairingsForSystemCommissionerPairingUUID:v7 completionHandler:v6];
}

- (void)removeDevicePairingWithUUID:(id)a3 forSystemCommissionerPairingUUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(MTSXPCClientProxy *)self delegate];
  [v11 clientProxy:self removeDevicePairingWithUUID:v10 forSystemCommissionerPairingUUID:v9 completionHandler:v8];
}

- (void)fetchDevicePairingsForSystemCommissionerPairingUUID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTSXPCClientProxy *)self delegate];
  [v8 clientProxy:self fetchDevicePairingsForSystemCommissionerPairingUUID:v7 completionHandler:v6];
}

- (BOOL)hasMatterSetupPayloadEntitlement
{
  v2 = [(MTSXPCClientProxy *)self connection];
  id v3 = [v2 valueForEntitlement:@"com.apple.developer.matter.allow-setup-payload"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)hasPrivateHomeKitEntitlement
{
  v2 = [(MTSXPCClientProxy *)self connection];
  id v3 = [v2 valueForEntitlement:@"com.apple.private.homekit"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BOOL)hasDevicePairingEntitlement
{
  v2 = [(MTSXPCClientProxy *)self connection];
  id v3 = [v2 valueForEntitlement:@"com.apple.matter.support.xpc.device-pairing"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  char v6 = [v5 BOOLValue];
  return v6;
}

- (MTSXPCClientProxy)initWithConnection:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    char v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)MTSXPCClientProxy;
    id v7 = [(MTSXPCClientProxy *)&v12 init];
    id v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_connection, a3);
    }

    return v8;
  }
  else
  {
    id v10 = (MTSWiFiNetworkAssociation *)_HMFPreconditionFailure();
    [(MTSWiFiNetworkAssociation *)v10 .cxx_destruct];
  }
  return result;
}

@end