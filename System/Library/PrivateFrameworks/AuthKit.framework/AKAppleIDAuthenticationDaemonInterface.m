@interface AKAppleIDAuthenticationDaemonInterface
+ (id)XPCInterface;
@end

@implementation AKAppleIDAuthenticationDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_12 != -1) {
    dispatch_once(&XPCInterface_onceToken_12, &__block_literal_global_50);
  }
  v2 = (void *)XPCInterface_interface_11;

  return v2;
}

void __54__AKAppleIDAuthenticationDaemonInterface_XPCInterface__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, objc_opt_class(), 0);
  id v75 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE462410];
  v9 = (void *)XPCInterface_interface_11;
  XPCInterface_interface_11 = v8;

  [(id)XPCInterface_interface_11 setClasses:v75 forSelector:sel_fetchUserInformationForAltDSID_completion_ argumentIndex:0 ofReply:1];
  v10 = (void *)XPCInterface_interface_11;
  v11 = [v75 setByAddingObject:objc_opt_class()];
  [v10 setClasses:v11 forSelector:sel_getUserInformationForAltDSID_completion_ argumentIndex:0 ofReply:1];

  [(id)XPCInterface_interface_11 setClass:objc_opt_class() forSelector:sel_getUserInformationWithContext_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_11 setClasses:v75 forSelector:sel_setConfigurationInfo_forIdentifier_forAltDSID_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_11 setClasses:v75 forSelector:sel_configurationInfoWithIdentifiers_forAltDSID_completion_ argumentIndex:0 ofReply:1];
  v74 = (void *)XPCInterface_interface_11;
  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  if (KeychainCircleLibraryCore()) {
    getKCAESGCMDuplexSessionClass();
  }
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  [v74 setClasses:v22 forSelector:sel_authenticateWithContext_completion_ argumentIndex:0 ofReply:1];

  v23 = (void *)XPCInterface_interface_11;
  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, v29, v30, v31, v32, objc_opt_class(), 0);
  [v23 setClasses:v33 forSelector:sel_deviceListWithContext_completion_ argumentIndex:0 ofReply:1];

  v34 = (void *)XPCInterface_interface_11;
  v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  v40 = objc_msgSend(v35, "setWithObjects:", v36, v37, v38, v39, objc_opt_class(), 0);
  [v34 setClasses:v40 forSelector:sel_fetchAppListWithAltDSID_completion_ argumentIndex:0 ofReply:1];

  v41 = (void *)XPCInterface_interface_11;
  v42 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  v49 = objc_msgSend(v42, "setWithObjects:", v43, v44, v45, v46, v47, v48, objc_opt_class(), 0);
  [v41 setClasses:v49 forSelector:sel_performPasswordResetWithContext_completion_ argumentIndex:0 ofReply:1];

  v50 = (void *)XPCInterface_interface_11;
  v51 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v52 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  uint64_t v54 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  uint64_t v57 = objc_opt_class();
  uint64_t v58 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  v60 = objc_msgSend(v51, "setWithObjects:", v52, v53, v54, v55, v56, v57, v58, v59, objc_opt_class(), 0);
  [v50 setClasses:v60 forSelector:sel_deleteDeviceListCacheWithContext_completion_ argumentIndex:0 ofReply:1];

  v61 = (void *)XPCInterface_interface_11;
  v62 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v63 = objc_opt_class();
  uint64_t v64 = objc_opt_class();
  uint64_t v65 = objc_opt_class();
  uint64_t v66 = objc_opt_class();
  uint64_t v67 = objc_opt_class();
  uint64_t v68 = objc_opt_class();
  uint64_t v69 = objc_opt_class();
  uint64_t v70 = objc_opt_class();
  v71 = objc_msgSend(v62, "setWithObjects:", v63, v64, v65, v66, v67, v68, v69, v70, objc_opt_class(), 0);
  [v61 setClasses:v71 forSelector:sel_deleteDeviceListCacheWithCompletion_ argumentIndex:0 ofReply:1];

  [(id)XPCInterface_interface_11 setClasses:v75 forSelector:sel_fetchTokensWithAltDSID_tokenIdentifiers_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_11 setClasses:v75 forSelector:sel_deleteTokensFromCacheWithAltDSID_tokenIdentifiers_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_11 setClasses:v75 forSelector:sel_fetchBirthdayForAltDSID_completion_ argumentIndex:1 ofReply:1];
  v72 = (void *)XPCInterface_interface_11;
  v73 = [v75 setByAddingObject:objc_opt_class()];
  [v72 setClasses:v73 forSelector:sel_fetchBirthdayForAltDSID_completion_ argumentIndex:2 ofReply:1];

  [(id)XPCInterface_interface_11 setClasses:v75 forSelector:sel_fetchBirthdayForAltDSID_completion_ argumentIndex:0 ofReply:1];
}

@end