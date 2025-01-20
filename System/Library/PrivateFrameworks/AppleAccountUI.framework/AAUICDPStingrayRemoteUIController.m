@interface AAUICDPStingrayRemoteUIController
- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3;
- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3 appleAccount:(id)a4;
- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3 appleAccount:(id)a4 hooks:(id)a5;
- (void)attachAllHandlers;
- (void)attachAllHandlersWithTelemetryFlowID:(id)a3;
- (void)attachAuthHandler:(id)a3;
- (void)attachBiometricRatchetHandler:(id)a3;
- (void)attachDTOBiometryHandler:(id)a3;
- (void)attachPasscodeHandler:(id)a3;
- (void)attachRecoveryKeyHandler:(id)a3;
- (void)attachRepairHandler:(id)a3;
- (void)processObjectModel:(id)a3 isModal:(BOOL)a4;
- (void)processObjectModel:(id)a3 isModal:(BOOL)a4 completion:(id)a5;
@end

@implementation AAUICDPStingrayRemoteUIController

- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3
{
  return [(AAUICDPStingrayRemoteUIController *)self initWithRemoteUIController:a3 appleAccount:0];
}

- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3 appleAccount:(id)a4
{
  return [(AAUICDPStingrayRemoteUIController *)self initWithRemoteUIController:a3 appleAccount:a4 hooks:0];
}

- (AAUICDPStingrayRemoteUIController)initWithRemoteUIController:(id)a3 appleAccount:(id)a4 hooks:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(AAUICDPStingrayRemoteUIController *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_account, a4);
    uint64_t v13 = [objc_alloc(MEMORY[0x263F637C0]) initWithRemoteUIController:v8 hooks:v10];
    serverHookHandler = v12->_serverHookHandler;
    v12->_serverHookHandler = (RUIServerHookHandler *)v13;

    +[RemoteUICustomComponentFactory registerRemoteUISwiftViews];
  }

  return v12;
}

- (void)attachAllHandlers
{
}

- (void)attachAllHandlersWithTelemetryFlowID:(id)a3
{
  v41[15] = *MEMORY[0x263EF8340];
  id v32 = a3;
  v26 = objc_opt_new();
  v41[0] = v26;
  v4 = [AAUIAuthKitAuthenticatonHook alloc];
  v35 = self;
  v34 = [(ACAccount *)self->_account username];
  v33 = [(ACAccount *)self->_account aa_altDSID];
  uint64_t v5 = [(AAUIAuthKitAuthenticatonHook *)v4 initWithUsername:v34 altDSID:v33];
  v41[1] = v5;
  uint64_t v6 = objc_opt_new();
  v41[2] = v6;
  v29 = objc_opt_new();
  v41[3] = v29;
  v30 = objc_opt_new();
  v41[4] = v30;
  v31 = objc_opt_new();
  v41[5] = v31;
  v7 = objc_opt_new();
  v41[6] = v7;
  id v8 = objc_opt_new();
  v41[7] = v8;
  id v9 = objc_opt_new();
  v41[8] = v9;
  id v10 = objc_opt_new();
  v41[9] = v10;
  v11 = [[AAUICustodianStartSessionHook alloc] initWithTelemetryFlowID:v32];
  v41[10] = v11;
  v12 = [[AAUICustodianStartApprovalHook alloc] initWithTelemetryFlowID:v32];
  v41[11] = v12;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2050000000;
  uint64_t v13 = (void *)getFALaunchScreenTimeSetupHookClass_softClass;
  uint64_t v40 = getFALaunchScreenTimeSetupHookClass_softClass;
  if (!getFALaunchScreenTimeSetupHookClass_softClass)
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __getFALaunchScreenTimeSetupHookClass_block_invoke;
    v36[3] = &unk_263F92608;
    v36[4] = &v37;
    __getFALaunchScreenTimeSetupHookClass_block_invoke((uint64_t)v36);
    uint64_t v13 = (void *)v38[3];
  }
  v27 = (void *)v5;
  v28 = (void *)v6;
  id v14 = v13;
  _Block_object_dispose(&v37, 8);
  v15 = objc_opt_new();
  v41[12] = v15;
  v16 = objc_opt_new();
  v41[13] = v16;
  v17 = (void *)[objc_alloc(MEMORY[0x263F292F0]) initWithAccount:v35->_account];
  v41[14] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:15];

  id v19 = objc_alloc(MEMORY[0x263F292A0]);
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    v21 = (void *)[v18 mutableCopy];
    id v22 = objc_alloc(MEMORY[0x263F292A0]);
    v23 = [(ACAccount *)v35->_account aa_altDSID];
    v24 = (void *)[v22 initWithAltDSID:v23];
    [v21 addObject:v24];

    uint64_t v25 = [v21 copy];
    v18 = (void *)v25;
  }
  -[RUIServerHookHandler setServerHooks:](v35->_serverHookHandler, "setServerHooks:", v18, v26);
}

- (void)attachRecoveryKeyHandler:(id)a3
{
  v4 = [(RUIServerHookHandler *)self->_serverHookHandler serverHooks];
  id v6 = (id)[v4 mutableCopy];

  uint64_t v5 = objc_opt_new();
  [v6 addObject:v5];

  [(RUIServerHookHandler *)self->_serverHookHandler setServerHooks:v6];
}

- (void)attachPasscodeHandler:(id)a3
{
  v4 = [(RUIServerHookHandler *)self->_serverHookHandler serverHooks];
  id v6 = (id)[v4 mutableCopy];

  uint64_t v5 = objc_opt_new();
  [v6 addObject:v5];

  [(RUIServerHookHandler *)self->_serverHookHandler setServerHooks:v6];
}

- (void)attachRepairHandler:(id)a3
{
  v4 = [(RUIServerHookHandler *)self->_serverHookHandler serverHooks];
  id v6 = (id)[v4 mutableCopy];

  uint64_t v5 = objc_opt_new();
  [v6 addObject:v5];

  [(RUIServerHookHandler *)self->_serverHookHandler setServerHooks:v6];
}

- (void)attachBiometricRatchetHandler:(id)a3
{
  v4 = [(RUIServerHookHandler *)self->_serverHookHandler serverHooks];
  id v6 = (id)[v4 mutableCopy];

  uint64_t v5 = objc_opt_new();
  [v6 addObject:v5];

  [(RUIServerHookHandler *)self->_serverHookHandler setServerHooks:v6];
}

- (void)attachDTOBiometryHandler:(id)a3
{
  v4 = [(RUIServerHookHandler *)self->_serverHookHandler serverHooks];
  id v6 = (id)[v4 mutableCopy];

  uint64_t v5 = objc_opt_new();
  [v6 addObject:v5];

  [(RUIServerHookHandler *)self->_serverHookHandler setServerHooks:v6];
}

- (void)attachAuthHandler:(id)a3
{
  v4 = [(RUIServerHookHandler *)self->_serverHookHandler serverHooks];
  id v6 = (id)[v4 mutableCopy];

  uint64_t v5 = objc_opt_new();
  [v6 addObject:v5];

  [(RUIServerHookHandler *)self->_serverHookHandler setServerHooks:v6];
}

- (void)processObjectModel:(id)a3 isModal:(BOOL)a4
{
}

- (void)processObjectModel:(id)a3 isModal:(BOOL)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
}

@end