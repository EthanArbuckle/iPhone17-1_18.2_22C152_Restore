@interface AKCustodianDaemonInterface
+ (id)XPCInterface;
@end

@implementation AKCustodianDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken != -1) {
    dispatch_once(&XPCInterface_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)XPCInterface_interface;

  return v2;
}

void __42__AKCustodianDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE458E30];
  v1 = (void *)XPCInterface_interface;
  XPCInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(id)XPCInterface_interface setClasses:v11 forSelector:sel_initiateCustodianSetupWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v11 forSelector:sel_finalizeCustodianSetupWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v11 forSelector:sel_revokeCustodianWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v11 forSelector:sel_startCustodianRecoveryRequestWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v11 forSelector:sel_fetchCustodianRecoveryCodeConfigurationWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v11 forSelector:sel_startCustodianRecoveryTransactionWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v11 forSelector:sel_fetchCustodianDataRecoveryKeyWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface setClasses:v11 forSelector:sel_performTrustedContactsDataSync_completion_ argumentIndex:0 ofReply:1];
}

@end