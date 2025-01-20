@interface ACRemoteAccountStoreInterface
+ (NSXPCInterface)XPCInterface;
+ (id)_buildXPCInterface;
@end

@implementation ACRemoteAccountStoreInterface

+ (NSXPCInterface)XPCInterface
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ACRemoteAccountStoreInterface_XPCInterface__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (XPCInterface_onceToken != -1) {
    dispatch_once(&XPCInterface_onceToken, block);
  }
  v2 = (void *)XPCInterface_XPCInterface;

  return (NSXPCInterface *)v2;
}

+ (id)_buildXPCInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFA20CA0];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_accountsWithHandler_ argumentIndex:0 ofReply:1];

  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  [v2 setClasses:v8 forSelector:sel_accountTypesWithHandler_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:sel_accountsWithAccountType_handler_ argumentIndex:0 ofReply:1];

  v12 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  [v2 setClasses:v14 forSelector:sel_accountsWithAccountType_options_completion_ argumentIndex:0 ofReply:1];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v2 setClasses:v17 forSelector:sel_childAccountsForAccountWithIdentifier_handler_ argumentIndex:0 ofReply:1];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v2 setClasses:v20 forSelector:sel_childAccountsWithAccountTypeIdentifier_parentAccountIdentifier_handler_ argumentIndex:0 ofReply:1];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v2 setClasses:v23 forSelector:sel_enabledDataclassesForAccountWithIdentifier_handler_ argumentIndex:0 ofReply:1];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  [v2 setClasses:v26 forSelector:sel_provisionedDataclassesForAccountWithIdentifier_handler_ argumentIndex:0 ofReply:1];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  [v2 setClasses:v29 forSelector:sel_supportedDataclassesForAccountType_handler_ argumentIndex:0 ofReply:1];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  [v2 setClasses:v32 forSelector:sel_syncableDataclassesForAccountType_handler_ argumentIndex:0 ofReply:1];

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  [v2 setClasses:v35 forSelector:sel_accessKeysForAccountType_handler_ argumentIndex:0 ofReply:1];

  v36 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  [v2 setClasses:v38 forSelector:sel_grantedPermissionsForAccountType_withHandler_ argumentIndex:0 ofReply:1];

  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  v43 = objc_msgSend(v39, "setWithObjects:", v40, v41, v42, objc_opt_class(), 0);
  [v2 setClasses:v43 forSelector:sel_dataclassActionsForAccountSave_completion_ argumentIndex:0 ofReply:1];

  v44 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  v48 = objc_msgSend(v44, "setWithObjects:", v45, v46, v47, objc_opt_class(), 0);
  [v2 setClasses:v48 forSelector:sel_dataclassActionsForAccountDeletion_completion_ argumentIndex:0 ofReply:1];

  v49 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  v52 = objc_msgSend(v49, "setWithObjects:", v50, v51, objc_opt_class(), 0);
  [v2 setClasses:v52 forSelector:sel_saveAccount_verify_dataclassActions_completion_ argumentIndex:2 ofReply:0];

  v53 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v54 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  v56 = objc_msgSend(v53, "setWithObjects:", v54, v55, objc_opt_class(), 0);
  [v2 setClasses:v56 forSelector:sel_removeAccount_withDataclassActions_completion_ argumentIndex:1 ofReply:0];

  v57 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v58 = objc_opt_class();
  v59 = objc_msgSend(v57, "setWithObjects:", v58, objc_opt_class(), 0);
  [v2 setClasses:v59 forSelector:sel_kerberosAccountsForDomainFromURL_completion_ argumentIndex:0 ofReply:1];

  v60 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v61 = objc_opt_class();
  uint64_t v62 = objc_opt_class();
  uint64_t v63 = objc_opt_class();
  uint64_t v64 = objc_opt_class();
  uint64_t v65 = objc_opt_class();
  v66 = objc_msgSend(v60, "setWithObjects:", v61, v62, v63, v64, v65, objc_opt_class(), 0);
  [v2 setClasses:v66 forSelector:sel_renewCredentialsForAccount_options_completion_ argumentIndex:1 ofReply:0];

  v67 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v68 = objc_opt_class();
  v69 = objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0);
  [v2 setClasses:v69 forSelector:sel_clientTokenForAccountIdentifier_completion_ argumentIndex:0 ofReply:1];

  v70 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v71 = objc_opt_class();
  v72 = objc_msgSend(v70, "setWithObjects:", v71, objc_opt_class(), 0);
  [v2 setClasses:v72 forSelector:sel_visibleTopLevelAccountsWithAccountTypeIdentifiers_completion_ argumentIndex:0 ofReply:1];

  v73 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v74 = objc_opt_class();
  v75 = objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  [v2 setClasses:v75 forSelector:sel_accountsWithAccountTypeIdentifiers_preloadedProperties_completion_ argumentIndex:0 ofReply:1];

  v76 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v77 = objc_opt_class();
  uint64_t v78 = objc_opt_class();
  uint64_t v79 = objc_opt_class();
  uint64_t v80 = objc_opt_class();
  v81 = objc_msgSend(v76, "setWithObjects:", v77, v78, v79, v80, objc_opt_class(), 0);
  [v2 setClasses:v81 forSelector:sel_accountsOnPairedDeviceWithAccountTypes_withOptions_handler_ argumentIndex:1 ofReply:0];

  v82 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v83 = objc_opt_class();
  v84 = objc_msgSend(v82, "setWithObjects:", v83, objc_opt_class(), 0);
  [v2 setClasses:v84 forSelector:sel_accountsOnPairedDeviceWithAccountTypes_withOptions_handler_ argumentIndex:0 ofReply:1];

  v85 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v86 = objc_opt_class();
  uint64_t v87 = objc_opt_class();
  uint64_t v88 = objc_opt_class();
  uint64_t v89 = objc_opt_class();
  v90 = objc_msgSend(v85, "setWithObjects:", v86, v87, v88, v89, objc_opt_class(), 0);
  [v2 setClasses:v90 forSelector:sel_verifyCredentialsForAccount_options_completion_ argumentIndex:1 ofReply:0];

  v91 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v92 = objc_opt_class();
  uint64_t v93 = objc_opt_class();
  uint64_t v94 = objc_opt_class();
  uint64_t v95 = objc_opt_class();
  v96 = objc_msgSend(v91, "setWithObjects:", v92, v93, v94, v95, objc_opt_class(), 0);
  [v2 setClasses:v96 forSelector:sel_discoverPropertiesForAccount_options_completion_ argumentIndex:1 ofReply:0];

  v97 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v98 = objc_opt_class();
  uint64_t v99 = objc_opt_class();
  uint64_t v100 = objc_opt_class();
  v101 = objc_msgSend(v97, "setWithObjects:", v98, v99, v100, objc_opt_class(), 0);
  [v2 setClasses:v101 forSelector:sel_saveAccount_toPairedDeviceWithOptions_completion_ argumentIndex:1 ofReply:0];

  v102 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v103 = objc_opt_class();
  v104 = objc_msgSend(v102, "setWithObjects:", v103, objc_opt_class(), 0);
  [v2 setClasses:v104 forSelector:sel_credentialItemsWithCompletion_ argumentIndex:0 ofReply:1];

  v105 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v106 = objc_opt_class();
  uint64_t v107 = objc_opt_class();
  v108 = objc_msgSend(v105, "setWithObjects:", v106, v107, objc_opt_class(), 0);
  [v2 setClasses:v108 forSelector:sel_registerMonitorForAccountsOfTypes_propertiesToPrefetch_completion_ argumentIndex:0 ofReply:1];

  v109 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v110 = objc_opt_class();
  v111 = objc_msgSend(v109, "setWithObjects:", v110, objc_opt_class(), 0);
  [v2 setClasses:v111 forSelector:sel_accountsWithTypeIdentifier_propertyKey_value_cacheSuffix_completion_ argumentIndex:0 ofReply:1];

  return v2;
}

uint64_t __45__ACRemoteAccountStoreInterface_XPCInterface__block_invoke(uint64_t a1)
{
  XPCInterface_XPCInterface = [*(id *)(a1 + 32) _buildXPCInterface];

  return MEMORY[0x1F41817F8]();
}

@end