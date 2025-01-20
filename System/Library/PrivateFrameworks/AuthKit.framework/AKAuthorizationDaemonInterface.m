@interface AKAuthorizationDaemonInterface
+ (id)XPCInterface;
@end

@implementation AKAuthorizationDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_4 != -1) {
    dispatch_once(&XPCInterface_onceToken_4, &__block_literal_global_18);
  }
  v2 = (void *)XPCInterface_interface_4;

  return v2;
}

void __46__AKAuthorizationDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE462110];
  v1 = (void *)XPCInterface_interface_4;
  XPCInterface_interface_4 = v0;

  v61 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v59 = objc_opt_class();
  uint64_t v58 = objc_opt_class();
  uint64_t v57 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v54 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v49 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_msgSend(v61, "setWithObjects:", v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v48, v47, v2, v3, v4, v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    objc_opt_class(),
  v62 = 0);
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_performAuthorization_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_performAuthorization_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_performAuthorizationWithContext_withUserProvidedInformation_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_performAuthorizationWithContext_withUserProvidedInformation_completion_ argumentIndex:1 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_performAuthorizationWithContext_withUserProvidedInformation_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_beginAuthorizationWithContext_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_beginAuthorizationWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_continueAuthorizationWithContext_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_continueAuthorizationWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_cancelAuthorizationWithContext_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_cancelAuthorizationWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_continueFetchingIconForRequestContext_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_establishConnectionWithNotificationHandlerEndpoint_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_storeAuthorization_forProxiedRequest_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_storeAuthorization_forProxiedRequest_completion_ argumentIndex:1 ofReply:0];
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v60 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  [(id)XPCInterface_interface_4 setClasses:v60 forSelector:sel_getCredentialStateForRequest_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_4 setClasses:v60 forSelector:sel_getCredentialStateForRequest_completion_ argumentIndex:0 ofReply:1];
  v15 = (void *)XPCInterface_interface_4;
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v15 setClasses:v18 forSelector:sel_getCredentialStateForClientID_completion_ argumentIndex:0 ofReply:0];

  v19 = (void *)XPCInterface_interface_4;
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
  [v19 setClasses:v23 forSelector:sel_getCredentialStateForClientID_completion_ argumentIndex:0 ofReply:1];

  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_startDiscoveryWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_4 setClasses:v62 forSelector:sel_revokeUpgradeWithContext_completion_ argumentIndex:0 ofReply:0];
  v24 = (void *)XPCInterface_interface_4;
  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v25, "setWithObjects:", v26, v27, v28, objc_opt_class(), 0);
  [v24 setClasses:v29 forSelector:sel_fetchAppleIDAuthorizationURLSetWithCompletion_ argumentIndex:0 ofReply:1];

  v30 = (void *)XPCInterface_interface_4;
  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v31, "setWithObjects:", v32, v33, v34, objc_opt_class(), 0);
  [v30 setClasses:v35 forSelector:sel_fetchNativeTakeoverURLSetWithCompletion_ argumentIndex:0 ofReply:1];

  v36 = (void *)XPCInterface_interface_4;
  v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  v41 = objc_msgSend(v37, "setWithObjects:", v38, v39, v40, objc_opt_class(), 0);
  [v36 setClasses:v41 forSelector:sel_fetchAppleOwnedDomainSetWithCompletion_ argumentIndex:0 ofReply:1];

  v42 = (void *)XPCInterface_interface_4;
  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  v46 = objc_msgSend(v43, "setWithObjects:", v44, v45, objc_opt_class(), 0);
  [v42 setClasses:v46 forSelector:sel_fetchAppleIDAuthorizeHTMLResponseTemplateWithCompletion_ argumentIndex:0 ofReply:1];
}

@end