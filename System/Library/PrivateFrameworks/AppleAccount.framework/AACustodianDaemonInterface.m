@interface AACustodianDaemonInterface
+ (id)XPCInterface;
@end

@implementation AACustodianDaemonInterface

+ (id)XPCInterface
{
  if (XPCInterface_onceToken_1 != -1) {
    dispatch_once(&XPCInterface_onceToken_1, &__block_literal_global_24);
  }
  v2 = (void *)XPCInterface_interface_1;

  return v2;
}

void __42__AACustodianDaemonInterface_XPCInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EF4A1300];
  v1 = (void *)XPCInterface_interface_1;
  XPCInterface_interface_1 = v0;

  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  id v117 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v116 = objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (void *)XPCInterface_interface_1;
  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  [v9 setClasses:v14 forSelector:sel_setupCustodianshipWithContext_completion_ argumentIndex:0 ofReply:0];

  v15 = (void *)XPCInterface_interface_1;
  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = objc_msgSend(v16, "setWithObjects:", v17, v18, objc_opt_class(), 0);
  [v15 setClasses:v19 forSelector:sel_setupCustodianshipWithContext_completion_ argumentIndex:0 ofReply:1];

  v20 = (void *)XPCInterface_interface_1;
  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  v25 = objc_msgSend(v21, "setWithObjects:", v22, v23, v24, objc_opt_class(), 0);
  [v20 setClasses:v25 forSelector:sel_fetchCachedTrustedContactsWithCompletion_ argumentIndex:0 ofReply:1];

  v26 = (void *)XPCInterface_interface_1;
  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  v31 = objc_msgSend(v27, "setWithObjects:", v28, v29, v30, objc_opt_class(), 0);
  [v26 setClasses:v31 forSelector:sel_fetchTrustedContactsWithCompletion_ argumentIndex:0 ofReply:1];

  v32 = (void *)XPCInterface_interface_1;
  v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  [v32 setClasses:v35 forSelector:sel_fetchCustodianshipInfoWithUUID_completion_ argumentIndex:0 ofReply:0];

  v36 = (void *)XPCInterface_interface_1;
  v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  v40 = objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
  [v36 setClasses:v40 forSelector:sel_fetchCustodianshipInfoWithUUID_completion_ argumentIndex:0 ofReply:1];

  v41 = (void *)XPCInterface_interface_1;
  v42 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  v46 = objc_msgSend(v42, "setWithObjects:", v43, v44, v45, objc_opt_class(), 0);
  [v41 setClasses:v46 forSelector:sel_fetchCustodianshipInfoWithCompletion_ argumentIndex:0 ofReply:1];

  v47 = (void *)XPCInterface_interface_1;
  v48 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  v52 = objc_msgSend(v48, "setWithObjects:", v49, v50, v51, objc_opt_class(), 0);
  [v47 setClasses:v52 forSelector:sel_fetchSuggestedCustodiansWithCompletion_ argumentIndex:0 ofReply:1];

  v53 = (void *)XPCInterface_interface_1;
  v54 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  uint64_t v57 = objc_opt_class();
  v58 = objc_msgSend(v54, "setWithObjects:", v55, v56, v57, objc_opt_class(), 0);
  [v53 setClasses:v58 forSelector:sel_fetchSuggestedCustodiansForUpsellWithCompletion_ argumentIndex:0 ofReply:1];

  v59 = (void *)XPCInterface_interface_1;
  v60 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v61 = objc_opt_class();
  uint64_t v62 = objc_opt_class();
  uint64_t v63 = objc_opt_class();
  v64 = objc_msgSend(v60, "setWithObjects:", v61, v62, v63, objc_opt_class(), 0);
  [v59 setClasses:v64 forSelector:sel_fetchCustodianHealthStatusWithCompletion_ argumentIndex:0 ofReply:1];

  [(id)XPCInterface_interface_1 setClasses:v116 forSelector:sel_respondToInviteWithContext_completion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_respondToInviteWithContext_completion_ argumentIndex:0 ofReply:1];
  v65 = (void *)XPCInterface_interface_1;
  v66 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v67 = objc_opt_class();
  v68 = objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
  [v65 setClasses:v68 forSelector:sel_fetchCustodianRecoveryConfigurationWithCompletion_ argumentIndex:0 ofReply:1];

  v69 = (void *)XPCInterface_interface_1;
  v70 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v71 = objc_opt_class();
  uint64_t v72 = objc_opt_class();
  uint64_t v73 = objc_opt_class();
  v74 = objc_msgSend(v70, "setWithObjects:", v71, v72, v73, objc_opt_class(), 0);
  [v69 setClasses:v74 forSelector:sel_generateCustodianRecoveryCodeWithContext_completion_ argumentIndex:0 ofReply:0];

  v75 = (void *)XPCInterface_interface_1;
  v76 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v77 = objc_opt_class();
  v78 = objc_msgSend(v76, "setWithObjects:", v77, objc_opt_class(), 0);
  [v75 setClasses:v78 forSelector:sel_generateCustodianRecoveryCodeWithContext_completion_ argumentIndex:0 ofReply:1];

  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_startHealthCheckWithCompletion_ argumentIndex:0 ofReply:0];
  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_startHealthCheckWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_startManateeMigrationWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_pullTrustedContactsFromCloudKitWithCompletion_ argumentIndex:0 ofReply:1];
  v79 = (void *)XPCInterface_interface_1;
  v80 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v81 = objc_opt_class();
  uint64_t v82 = objc_opt_class();
  uint64_t v83 = objc_opt_class();
  uint64_t v84 = objc_opt_class();
  uint64_t v85 = objc_opt_class();
  v86 = objc_msgSend(v80, "setWithObjects:", v81, v82, v83, v84, v85, objc_opt_class(), 0);
  [v79 setClasses:v86 forSelector:sel_displayTrustedContactFlowWithModel_completion_ argumentIndex:0 ofReply:0];

  v87 = (void *)XPCInterface_interface_1;
  v88 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v89 = objc_opt_class();
  uint64_t v90 = objc_opt_class();
  v91 = objc_msgSend(v88, "setWithObjects:", v89, v90, objc_opt_class(), 0);
  [v87 setClasses:v91 forSelector:sel_displayTrustedContactFlowWithModel_completion_ argumentIndex:0 ofReply:1];

  v92 = (void *)XPCInterface_interface_1;
  v93 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v94 = objc_opt_class();
  uint64_t v95 = objc_opt_class();
  v96 = objc_msgSend(v93, "setWithObjects:", v94, v95, objc_opt_class(), 0);
  [v92 setClasses:v96 forSelector:sel_displayCustodianInviteWithUUID_completion_ argumentIndex:0 ofReply:0];

  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_displayCustodianInviteWithUUID_completion_ argumentIndex:0 ofReply:1];
  v97 = (void *)XPCInterface_interface_1;
  v98 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v99 = objc_opt_class();
  v100 = objc_msgSend(v98, "setWithObjects:", v99, objc_opt_class(), 0);
  [v97 setClasses:v100 forSelector:sel_reSendCustodianInvitationWithCustodianID_completion_ argumentIndex:0 ofReply:0];

  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_reSendCustodianInvitationWithCustodianID_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_performTrustedContactsDataSyncWithCompletion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_availableRecoveryFactorsWithCompletion_ argumentIndex:0 ofReply:1];
  v101 = (void *)XPCInterface_interface_1;
  v102 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v103 = objc_opt_class();
  uint64_t v104 = objc_opt_class();
  v105 = objc_msgSend(v102, "setWithObjects:", v103, v104, objc_opt_class(), 0);
  [v101 setClasses:v105 forSelector:sel_repairCustodians_remove_completion_ argumentIndex:0 ofReply:0];

  v106 = (void *)XPCInterface_interface_1;
  v107 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v108 = objc_opt_class();
  uint64_t v109 = objc_opt_class();
  v110 = objc_msgSend(v107, "setWithObjects:", v108, v109, objc_opt_class(), 0);
  [v106 setClasses:v110 forSelector:sel_repairCustodians_remove_completion_ argumentIndex:1 ofReply:0];

  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_repairCustodians_remove_completion_ argumentIndex:0 ofReply:1];
  v111 = (void *)XPCInterface_interface_1;
  v112 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v113 = objc_opt_class();
  uint64_t v114 = objc_opt_class();
  v115 = objc_msgSend(v112, "setWithObjects:", v113, v114, objc_opt_class(), 0);
  [v111 setClasses:v115 forSelector:sel_repairCustodians_completion_ argumentIndex:0 ofReply:0];

  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_repairCustodians_completion_ argumentIndex:0 ofReply:1];
  [(id)XPCInterface_interface_1 setClasses:v117 forSelector:sel_preflightCustodianRecoveryWithCompletion_ argumentIndex:0 ofReply:1];
}

@end