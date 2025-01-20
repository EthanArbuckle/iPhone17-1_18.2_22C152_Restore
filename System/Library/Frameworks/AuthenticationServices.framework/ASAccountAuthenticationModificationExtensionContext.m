@interface ASAccountAuthenticationModificationExtensionContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (void)cancelRequest;
- (void)cancelRequestWithError:(NSError *)error;
- (void)completeChangePasswordRequestWithUpdatedCredential:(ASPasswordCredential *)updatedCredential userInfo:(NSDictionary *)userInfo;
- (void)completeUpgradeToSignInWithAppleWithUserInfo:(NSDictionary *)userInfo;
- (void)getSignInWithAppleUpgradeAuthorizationWithState:(NSString *)state nonce:(NSString *)nonce completionHandler:(void *)completionHandler;
- (void)prepareInterfaceToUpdatePasswordForServiceIdentifier:(id)a3 existingCredential:(id)a4 newPassword:(id)a5 userInfo:(id)a6 completion:(id)a7;
- (void)prepareInterfaceToUpgradeCredentialToSignInWithApple:(id)a3 serviceIdentifier:(id)a4 userInfo:(id)a5 completion:(id)a6;
- (void)updatePasswordForServiceIdentifier:(id)a3 existingCredential:(id)a4 newPassword:(id)a5 userInfo:(id)a6;
- (void)upgradeCredentialToSignInWithApple:(id)a3 serviceIdentifier:(id)a4 userInfo:(id)a5;
@end

@implementation ASAccountAuthenticationModificationExtensionContext

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "_as_accountModificationHostInterface");
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x263F08D80], "_as_accountModificationExtensionInterface");
}

- (void)getSignInWithAppleUpgradeAuthorizationWithState:(NSString *)state nonce:(NSString *)nonce completionHandler:(void *)completionHandler
{
  v8 = completionHandler;
  v9 = nonce;
  v10 = state;
  v11 = [(ASAccountAuthenticationModificationExtensionContext *)self _auxiliaryConnection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __127__ASAccountAuthenticationModificationExtensionContext_getSignInWithAppleUpgradeAuthorizationWithState_nonce_completionHandler___block_invoke;
  v13[3] = &unk_2643961F0;
  v13[4] = self;
  v12 = [v11 remoteObjectProxyWithErrorHandler:v13];

  [v12 getSignInWithAppleAuthorizationWithState:v10 nonce:v9 completion:v8];
}

uint64_t __127__ASAccountAuthenticationModificationExtensionContext_getSignInWithAppleUpgradeAuthorizationWithState_nonce_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelRequestWithError:a2];
}

- (void)completeUpgradeToSignInWithAppleWithUserInfo:(NSDictionary *)userInfo
{
  v4 = userInfo;
  v5 = [(ASAccountAuthenticationModificationExtensionContext *)self _auxiliaryConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __100__ASAccountAuthenticationModificationExtensionContext_completeUpgradeToSignInWithAppleWithUserInfo___block_invoke;
  v8[3] = &unk_2643961F0;
  v8[4] = self;
  v6 = [v5 remoteObjectProxyWithErrorHandler:v8];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __100__ASAccountAuthenticationModificationExtensionContext_completeUpgradeToSignInWithAppleWithUserInfo___block_invoke_2;
  v7[3] = &unk_264395388;
  v7[4] = self;
  [v6 prepareToCompleteUpgradeToSignInWithAppleWithUserInfo:v4 completion:v7];
}

uint64_t __100__ASAccountAuthenticationModificationExtensionContext_completeUpgradeToSignInWithAppleWithUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelRequestWithError:a2];
}

uint64_t __100__ASAccountAuthenticationModificationExtensionContext_completeUpgradeToSignInWithAppleWithUserInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeRequestReturningItems:MEMORY[0x263EFFA68] completionHandler:0];
}

- (void)completeChangePasswordRequestWithUpdatedCredential:(ASPasswordCredential *)updatedCredential userInfo:(NSDictionary *)userInfo
{
  v6 = userInfo;
  v7 = updatedCredential;
  v8 = [(ASAccountAuthenticationModificationExtensionContext *)self _auxiliaryConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __115__ASAccountAuthenticationModificationExtensionContext_completeChangePasswordRequestWithUpdatedCredential_userInfo___block_invoke;
  v11[3] = &unk_2643961F0;
  v11[4] = self;
  v9 = [v8 remoteObjectProxyWithErrorHandler:v11];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __115__ASAccountAuthenticationModificationExtensionContext_completeChangePasswordRequestWithUpdatedCredential_userInfo___block_invoke_2;
  v10[3] = &unk_264395388;
  v10[4] = self;
  [v9 prepareToCompleteRequestWithUpdatedCredential:v7 userInfo:v6 completion:v10];
}

uint64_t __115__ASAccountAuthenticationModificationExtensionContext_completeChangePasswordRequestWithUpdatedCredential_userInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelRequestWithError:a2];
}

uint64_t __115__ASAccountAuthenticationModificationExtensionContext_completeChangePasswordRequestWithUpdatedCredential_userInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeRequestReturningItems:MEMORY[0x263EFFA68] completionHandler:0];
}

- (void)cancelRequestWithError:(NSError *)error
{
  v4 = error;
  v5 = [(ASAccountAuthenticationModificationExtensionContext *)self _auxiliaryConnection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__ASAccountAuthenticationModificationExtensionContext_cancelRequestWithError___block_invoke;
  v11[3] = &unk_2643961F0;
  v11[4] = self;
  v6 = [v5 remoteObjectProxyWithErrorHandler:v11];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__ASAccountAuthenticationModificationExtensionContext_cancelRequestWithError___block_invoke_2;
  v8[3] = &unk_264395428;
  v9 = v4;
  v10 = self;
  v7 = v4;
  [v6 prepareToCancelRequestWithError:v7 completion:v8];
}

id __78__ASAccountAuthenticationModificationExtensionContext_cancelRequestWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)ASAccountAuthenticationModificationExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, a2);
}

id __78__ASAccountAuthenticationModificationExtensionContext_cancelRequestWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)ASAccountAuthenticationModificationExtensionContext;
  return objc_msgSendSuper2(&v3, sel_cancelRequestWithError_, v1);
}

- (void)upgradeCredentialToSignInWithApple:(id)a3 serviceIdentifier:(id)a4 userInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(ASAccountAuthenticationModificationExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_respondsToSelector())
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke;
      v26[3] = &unk_2643954B8;
      v12 = &v27;
      id v27 = v11;
      v13 = &v28;
      id v28 = v9;
      v14 = &v29;
      id v29 = v8;
      v15 = MEMORY[0x263EF83A0];
      v16 = v26;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke_3;
        v17[3] = &unk_264396218;
        v12 = &v18;
        id v18 = v11;
        v13 = &v19;
        id v19 = v9;
        v14 = &v20;
        id v20 = v8;
        id v21 = v10;
        dispatch_async(MEMORY[0x263EF83A0], v17);

        goto LABEL_8;
      }
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke_2;
      block[3] = &unk_2643954B8;
      v12 = &v23;
      id v23 = v11;
      v13 = &v24;
      id v24 = v9;
      v14 = &v25;
      id v25 = v8;
      v15 = MEMORY[0x263EF83A0];
      v16 = block;
    }
    dispatch_async(v15, v16);
LABEL_8:
  }
}

uint64_t __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepareToConvertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:*(void *)(a1 + 40) existingCredential:*(void *)(a1 + 48)];
}

uint64_t __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:*(void *)(a1 + 40) existingCredential:*(void *)(a1 + 48)];
}

uint64_t __117__ASAccountAuthenticationModificationExtensionContext_upgradeCredentialToSignInWithApple_serviceIdentifier_userInfo___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) convertAccountToSignInWithAppleWithoutUserInteractionForServiceIdentifier:*(void *)(a1 + 40) existingCredential:*(void *)(a1 + 48) userInfo:*(void *)(a1 + 56)];
}

- (void)prepareInterfaceToUpgradeCredentialToSignInWithApple:(id)a3 serviceIdentifier:(id)a4 userInfo:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(ASAccountAuthenticationModificationExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (objc_opt_respondsToSelector())
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __146__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpgradeCredentialToSignInWithApple_serviceIdentifier_userInfo_completion___block_invoke;
      block[3] = &unk_264395530;
      id v23 = v14;
      id v24 = v11;
      id v25 = v10;
      id v26 = v13;
      dispatch_async(MEMORY[0x263EF83A0], block);

      v15 = v23;
    }
    else
    {
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __146__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpgradeCredentialToSignInWithApple_serviceIdentifier_userInfo_completion___block_invoke_2;
      v16[3] = &unk_264395CD8;
      id v17 = v14;
      id v18 = v11;
      id v19 = v10;
      id v20 = v12;
      id v21 = v13;
      dispatch_async(MEMORY[0x263EF83A0], v16);

      v15 = v17;
    }
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
}

uint64_t __146__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpgradeCredentialToSignInWithApple_serviceIdentifier_userInfo_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareInterfaceToConvertAccountToSignInWithAppleForServiceIdentifier:*(void *)(a1 + 40) existingCredential:*(void *)(a1 + 48)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

uint64_t __146__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpgradeCredentialToSignInWithApple_serviceIdentifier_userInfo_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareInterfaceToConvertAccountToSignInWithAppleForServiceIdentifier:*(void *)(a1 + 40) existingCredential:*(void *)(a1 + 48) userInfo:*(void *)(a1 + 56)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v2();
}

- (void)updatePasswordForServiceIdentifier:(id)a3 existingCredential:(id)a4 newPassword:(id)a5 userInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(ASAccountAuthenticationModificationExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __130__ASAccountAuthenticationModificationExtensionContext_updatePasswordForServiceIdentifier_existingCredential_newPassword_userInfo___block_invoke;
    block[3] = &unk_264396240;
    id v16 = v14;
    id v17 = v10;
    id v18 = v11;
    id v19 = v12;
    id v20 = v13;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __130__ASAccountAuthenticationModificationExtensionContext_updatePasswordForServiceIdentifier_existingCredential_newPassword_userInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) changePasswordWithoutUserInteractionForServiceIdentifier:*(void *)(a1 + 40) existingCredential:*(void *)(a1 + 48) newPassword:*(void *)(a1 + 56) userInfo:*(void *)(a1 + 64)];
}

- (void)prepareInterfaceToUpdatePasswordForServiceIdentifier:(id)a3 existingCredential:(id)a4 newPassword:(id)a5 userInfo:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(ASAccountAuthenticationModificationExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __159__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpdatePasswordForServiceIdentifier_existingCredential_newPassword_userInfo_completion___block_invoke;
    v18[3] = &unk_264396268;
    id v19 = v17;
    id v20 = v12;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    id v24 = v16;
    dispatch_async(MEMORY[0x263EF83A0], v18);
  }
  else
  {
    dispatch_async(MEMORY[0x263EF83A0], v16);
  }
}

uint64_t __159__ASAccountAuthenticationModificationExtensionContext_prepareInterfaceToUpdatePasswordForServiceIdentifier_existingCredential_newPassword_userInfo_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareInterfaceToChangePasswordForServiceIdentifier:*(void *)(a1 + 40) existingCredential:*(void *)(a1 + 48) newPassword:*(void *)(a1 + 56) userInfo:*(void *)(a1 + 64)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);

  return v2();
}

- (void)cancelRequest
{
  objc_super v3 = [(ASAccountAuthenticationModificationExtensionContext *)self _principalObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [(ASAccountAuthenticationModificationExtensionContext *)self _auxiliaryConnection];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke;
    v15[3] = &unk_2643961F0;
    v15[4] = self;
    v5 = [v4 remoteObjectProxyWithErrorHandler:v15];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke_2;
    block[3] = &unk_264395428;
    id v13 = v3;
    id v14 = v5;
    id v6 = v5;
    v7 = MEMORY[0x263EF83A0];
    dispatch_async(MEMORY[0x263EF83A0], block);
    objc_initWeak(&location, self);
    dispatch_time_t v8 = dispatch_time(0, 10000000000);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke_3;
    v9[3] = &unk_264395360;
    objc_copyWeak(&v10, &location);
    dispatch_after(v8, v7, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

uint64_t __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) cancelRequestWithError:a2];
}

uint64_t __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelRequest];
  v2 = *(void **)(a1 + 40);

  return [v2 dismissRequestUI];
}

void __68__ASAccountAuthenticationModificationExtensionContext_cancelRequest__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v1 = [MEMORY[0x263F087E8] errorWithDomain:@"ASExtensionErrorDomain" code:1 userInfo:0];
    [WeakRetained cancelRequestWithError:v1];
  }
}

@end