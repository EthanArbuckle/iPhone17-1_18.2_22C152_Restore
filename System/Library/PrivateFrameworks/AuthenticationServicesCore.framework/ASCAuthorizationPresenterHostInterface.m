@interface ASCAuthorizationPresenterHostInterface
+ (id)xpcInterface;
@end

@implementation ASCAuthorizationPresenterHostInterface

+ (id)xpcInterface
{
  if (xpcInterface_onceToken_0 != -1) {
    dispatch_once(&xpcInterface_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)xpcInterface_interface_0;

  return v2;
}

void __54__ASCAuthorizationPresenterHostInterface_xpcInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26CAC7158];
  v1 = (void *)xpcInterface_interface_0;
  xpcInterface_interface_0 = v0;

  v2 = ASAllLoginChoiceClasses();
  [(id)xpcInterface_interface_0 setClasses:v2 forSelector:sel_authorizationRequestInitiatedWithLoginChoice_authenticatedContext_completionHandler_ argumentIndex:0 ofReply:0];
  v3 = (void *)xpcInterface_interface_0;
  v4 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:sel_authorizationRequestInitiatedWithLoginChoice_authenticatedContext_completionHandler_ argumentIndex:1 ofReply:0];

  v5 = (void *)xpcInterface_interface_0;
  v6 = [v2 setByAddingObject:objc_opt_class()];
  [v5 setClasses:v6 forSelector:sel_updateInterfaceWithLoginChoices_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  [(id)xpcInterface_interface_0 setClasses:v17 forSelector:sel_authorizationRequestInitiatedWithLoginChoice_authenticatedContext_completionHandler_ argumentIndex:0 ofReply:1];
  [(id)xpcInterface_interface_0 setClasses:v17 forSelector:sel_authorizationRequestFinishedWithCredential_error_completionHandler_ argumentIndex:0 ofReply:0];
  [(id)xpcInterface_interface_0 setClasses:v17 forSelector:sel_validateUserEnteredPIN_completionHandler_ argumentIndex:0 ofReply:1];
  v13 = (void *)xpcInterface_interface_0;
  v14 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v13 setClasses:v14 forSelector:sel_startCABLEAuthenticationWithCompletionHandler_ argumentIndex:0 ofReply:1];

  v15 = (void *)xpcInterface_interface_0;
  v16 = [MEMORY[0x263EFFA08] setWithObject:objc_opt_class()];
  [v15 setClasses:v16 forSelector:sel_startCABLEAuthenticationWithCompletionHandler_ argumentIndex:1 ofReply:1];
}

@end