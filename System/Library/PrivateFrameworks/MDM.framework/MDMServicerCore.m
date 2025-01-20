@interface MDMServicerCore
- (BOOL)_remoteProcess:(id)a3 hasEntitlement:(id)a4;
- (MDMServerCore)server;
- (MDMServicerCore)initWithXPCConnection:(id)a3 server:(id)a4;
- (NSXPCConnection)xpcConnection;
- (id)_MDMAccessEntitlementForChannelType:(unint64_t)a3;
- (id)_lacksEntitlementError:(id)a3;
- (unint64_t)channelType;
- (void)blockAppInstallsWithCompletion:(id)a3;
- (void)dealloc;
- (void)depPushTokenWithCompletion:(id)a3;
- (void)getAssertionDescriptionsWithCompletion:(id)a3;
- (void)isAwaitingUserConfiguredWithCompletion:(id)a3;
- (void)migrateMDMWithContext:(int)a3 completion:(id)a4;
- (void)notifyNewConfigurationWithCompletion:(id)a3;
- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5;
- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5;
- (void)pushTokenWithCompletion:(id)a3;
- (void)reauthenticationCompleteWithCompletion:(id)a3;
- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3;
- (void)retryNotNowWithCompletion:(id)a3;
- (void)scheduleTokenUpdateIfNecessaryWithCompletion:(id)a3;
- (void)scheduleTokenUpdateWithCompletion:(id)a3;
- (void)setServer:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3;
- (void)simulatePushWithCompletion:(id)a3;
- (void)syncDEPPushTokenWithCompletion:(id)a3;
- (void)touchWithCompletion:(id)a3;
- (void)unblockAppInstallsWithCompletion:(id)a3;
- (void)uprootMDMWithCompletion:(id)a3;
@end

@implementation MDMServicerCore

- (MDMServicerCore)initWithXPCConnection:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MDMServicerCore;
  v8 = [(MDMServicerCore *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_xpcConnection, v6);
    v9->_channelType = [v7 channelType];
    objc_storeStrong((id *)&v9->_server, a4);
  }

  return v9;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)MDMServicerCore;
  [(MDMServicerCore *)&v4 dealloc];
}

- (void)getAssertionDescriptionsWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 getAssertionDescriptionsWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, 0, v7);

    objc_super v4 = (void (**)(id, void, uint64_t))v7;
  }
}

- (void)scheduleTokenUpdateWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 scheduleTokenUpdateWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, v7);

    objc_super v4 = (void (**)(id, uint64_t))v7;
  }
}

- (void)scheduleTokenUpdateIfNecessaryWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 scheduleTokenUpdateIfNecessaryWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, v7);

    objc_super v4 = (void (**)(id, uint64_t))v7;
  }
}

- (void)simulatePushWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 simulatePushWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, v7);

    objc_super v4 = (void (**)(id, uint64_t))v7;
  }
}

- (void)simulatePushIfNetworkTetheredWithCompletion:(id)a3
{
  v9 = (void (**)(id, void *))a3;
  objc_super v4 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  if ([(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v4])
  {

LABEL_4:
    objc_super v4 = [(MDMServicerCore *)self server];
    [v4 simulatePushIfNetworkTetheredWithCompletion:v9];
    goto LABEL_6;
  }
  BOOL v6 = [(MDMServicerCore *)self xpcConnection];
  BOOL v7 = [(MDMServicerCore *)self _remoteProcess:v6 hasEntitlement:@"com.apple.managedconfiguration.mdmd.push"];

  if (v7) {
    goto LABEL_4;
  }
  id v8 = [(MDMServicerCore *)self _lacksEntitlementError:v4];
  v9[2](v9, v8);

LABEL_6:
}

- (void)notifyNewConfigurationWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 notifyNewConfigurationWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, v7);

    objc_super v4 = (void (**)(id, uint64_t))v7;
  }
}

- (void)retryNotNowWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 retryNotNowWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, v7);

    objc_super v4 = (void (**)(id, uint64_t))v7;
  }
}

- (void)reauthenticationCompleteWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 reauthenticationCompleteWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, v7);

    objc_super v4 = (void (**)(id, uint64_t))v7;
  }
}

- (void)pushTokenWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, void, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 pushTokenWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, 0, v7);

    objc_super v4 = (void (**)(id, void, uint64_t))v7;
  }
}

- (void)touchWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 touchWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, v7);

    objc_super v4 = (void (**)(id, uint64_t))v7;
  }
}

- (void)migrateMDMWithContext:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  objc_super v11 = (void (**)(id, void *))a4;
  BOOL v6 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  uint64_t v7 = [(MDMServicerCore *)self xpcConnection];
  if ([(MDMServicerCore *)self _remoteProcess:v7 hasEntitlement:v6])
  {

LABEL_4:
    BOOL v6 = [(MDMServicerCore *)self server];
    [v6 migrateMDMWithContext:v4 completion:v11];
    goto LABEL_6;
  }
  id v8 = [(MDMServicerCore *)self xpcConnection];
  BOOL v9 = [(MDMServicerCore *)self _remoteProcess:v8 hasEntitlement:@"com.apple.managedconfiguration.profiled-access"];

  if (v9) {
    goto LABEL_4;
  }
  v10 = [(MDMServicerCore *)self _lacksEntitlementError:v6];
  v11[2](v11, v10);

LABEL_6:
}

- (void)uprootMDMWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 uprootMDMWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, v7);

    uint64_t v4 = (void (**)(id, uint64_t))v7;
  }
}

- (void)processDeviceRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  BOOL v9 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  v10 = [(MDMServicerCore *)self xpcConnection];
  BOOL v11 = [(MDMServicerCore *)self _remoteProcess:v10 hasEntitlement:v9];

  if (v11)
  {

    BOOL v9 = [(MDMServicerCore *)self server];
    [v9 processDeviceRequest:v13 encodeResponse:v6 completion:v8];
  }
  else
  {
    uint64_t v12 = [(MDMServicerCore *)self _lacksEntitlementError:v9];
    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, v12, 0, 0);

    id v8 = (id)v12;
  }
}

- (void)requestInstallOfAppsInRestoreWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMServicerCore *)self server];
  [v5 requestInstallOfAppsInRestoreWithCompletion:v4];
}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMServicerCore *)self server];
  [v5 blockAppInstallsWithCompletion:v4];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__MDMServicerCore_blockAppInstallsWithCompletion___block_invoke;
  v7[3] = &unk_264B9D3E0;
  v7[4] = self;
  BOOL v6 = [(MDMServicerCore *)self xpcConnection];
  [v6 setInvalidationHandler:v7];
}

void __50__MDMServicerCore_blockAppInstallsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    id v4 = v2;
    id v5 = [v3 xpcConnection];
    int v8 = 138543362;
    BOOL v9 = v5;
    _os_log_impl(&dword_230A49000, v4, OS_LOG_TYPE_DEFAULT, "MDMServicer, XPC connection invalidated: %{public}@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v6 = [*(id *)(a1 + 32) xpcConnection];
  [v6 setInvalidationHandler:0];

  uint64_t v7 = [*(id *)(a1 + 32) server];
  [v7 unblockAppInstallsWithCompletion:&__block_literal_global_8];
}

void __50__MDMServicerCore_blockAppInstallsWithCompletion___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_230A49000, v3, OS_LOG_TYPE_DEFAULT, "MDMServicer, XPC connection invalidated, app installs unblocked, error = %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(MDMServicerCore *)self xpcConnection];
  [v5 setInvalidationHandler:0];

  id v6 = [(MDMServicerCore *)self server];
  [v6 unblockAppInstallsWithCompletion:v4];
}

- (void)depPushTokenWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  id v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 depPushTokenWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, 0, v7);

    id v4 = (void (**)(id, void, uint64_t))v7;
  }
}

- (void)syncDEPPushTokenWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  id v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 syncDEPPushTokenWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, 0, v7);

    id v4 = (void (**)(id, void, uint64_t))v7;
  }
}

- (void)processUserRequest:(id)a3 encodeResponse:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = a5;
  BOOL v9 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  uint64_t v10 = [(MDMServicerCore *)self xpcConnection];
  BOOL v11 = [(MDMServicerCore *)self _remoteProcess:v10 hasEntitlement:v9];

  if (v11)
  {

    BOOL v9 = [(MDMServicerCore *)self server];
    [v9 processUserRequest:v13 encodeResponse:v6 completion:v8];
  }
  else
  {
    uint64_t v12 = [(MDMServicerCore *)self _lacksEntitlementError:v9];
    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, v12, 0, 0);

    id v8 = (id)v12;
  }
}

- (void)isAwaitingUserConfiguredWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  id v8 = [(MDMServicerCore *)self _MDMAccessEntitlementForChannelType:[(MDMServicerCore *)self channelType]];
  id v5 = [(MDMServicerCore *)self xpcConnection];
  BOOL v6 = [(MDMServicerCore *)self _remoteProcess:v5 hasEntitlement:v8];

  if (v6)
  {

    id v8 = [(MDMServicerCore *)self server];
    [v8 isAwaitingUserConfiguredWithCompletion:v4];
  }
  else
  {
    uint64_t v7 = [(MDMServicerCore *)self _lacksEntitlementError:v8];
    v4[2](v4, 0, v7);

    id v4 = (void (**)(id, void, uint64_t))v7;
  }
}

- (id)_MDMAccessEntitlementForChannelType:(unint64_t)a3
{
  if (a3) {
    return @"com.apple.managedconfiguration.mdmuserd-access";
  }
  else {
    return @"com.apple.managedconfiguration.mdmd-access";
  }
}

- (BOOL)_remoteProcess:(id)a3 hasEntitlement:(id)a4
{
  id v4 = [a3 valueForEntitlement:a4];
  BOOL v5 = 0;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 BOOLValue]) {
      BOOL v5 = 1;
    }
  }

  return v5;
}

- (id)_lacksEntitlementError:(id)a3
{
  v3 = (void *)MEMORY[0x263F087E8];
  uint64_t v4 = *MEMORY[0x263F38B08];
  BOOL v5 = DMCErrorArray();
  BOOL v6 = objc_msgSend(v3, "DMCErrorWithDomain:code:descriptionArray:errorType:", v4, 39000, v5, *MEMORY[0x263F38A40], a3, 0);

  return v6;
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (unint64_t)channelType
{
  return self->_channelType;
}

- (MDMServerCore)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_server, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

@end