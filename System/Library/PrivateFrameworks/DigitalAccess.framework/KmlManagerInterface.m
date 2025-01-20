@interface KmlManagerInterface
+ (id)interface;
@end

@implementation KmlManagerInterface

+ (id)interface
{
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5C2B40];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v61 = objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v60 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5BE988];
  [v60 setClasses:v61 forSelector:sel_handleKeyPairingCompletionResult_keyInformation_trackingRequest_ argumentIndex:1 ofReply:0];
  [v2 setInterface:v60 forSelector:sel_queueOwnerPairingSession_callback_ argumentIndex:0 ofReply:0];
  v59 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5C2BA0];
  v62 = v2;
  [v2 setInterface:v59 forSelector:sel_queueOwnerPairingSession_callback_ argumentIndex:0 ofReply:1];
  v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5BE6B8];
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v11);

  v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5C2C00];
  v56 = (void *)MEMORY[0x263EFFA08];
  uint64_t v54 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  uint64_t v50 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  objc_msgSend(v56, "setWithObjects:", v54, v53, v52, v50, v48, v46, v44, v42, v13, v14, v15, v16, v17, v18, v19, v20, v21,
    objc_opt_class(),
  v22 = 0);
  [v12 setClasses:v22 forSelector:sel_sendSharingInviteForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler_ argumentIndex:3 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_sendSharingInviteForKeyIdentifier_toIdsIdentifier_auth_config_completionHandler_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v22 forSelector:sel_sendSilentSharingInviteForKeyIdentifier_config_groupIdentifier_completionHandler_ argumentIndex:1 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_sendSilentSharingInviteForKeyIdentifier_config_groupIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v22 forSelector:sel_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler_ argumentIndex:2 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_acceptSharingInvitationWithIdentifier_passcode_productPlanIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v22 forSelector:sel_requestInviteWithConfig_completionHandler_ argumentIndex:0 ofReply:0];
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v22);
  [v12 setClasses:v22 forSelector:sel_getPreTrackRequestForInvitationWithIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v22);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v22);
  objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v22);
  [v12 setClasses:v22 forSelector:sel_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler_ argumentIndex:4 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_createSharingInvitationsForKeyIdentifier_friendIdentifier_auth_ourBindingAttestation_config_completionHandler_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v22 forSelector:sel_createSilentSharingInvitationWithGroupIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_createSilentSharingInvitationWithGroupIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v22 forSelector:sel_acceptSharingInvitation_withIdentifier_fromMailboxIdentifier_passcode_productPlanIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_acceptSharingInvitation_withIdentifier_fromMailboxIdentifier_passcode_productPlanIdentifier_completionHandler_ argumentIndex:4 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_acceptSharingInvitation_withIdentifier_fromMailboxIdentifier_passcode_productPlanIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v22 forSelector:sel_startShareAcceptanceFlowWithInvitation_fromMailboxIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_handleRecipientMessage_forInvitationIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_handleRecipientMessage_forInvitationIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v22 forSelector:sel_handleInitiatorMessage_forInvitationIdentifier_completionHandler_ argumentIndex:0 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_handleInitiatorMessage_forInvitationIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v22 forSelector:sel_retryPasscode_forInvitationIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [v62 setInterface:v12 forSelector:sel_queueSharingSession_callback_ argumentIndex:0 ofReply:1];
  v23 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5BE6B8];
  objc_msgSend(v62, "setInterface:forSelector:argumentIndex:ofReply:", v23);

  v24 = +[KmlKeyManagementInterface interface];
  v51 = (void *)MEMORY[0x263EFFA08];
  uint64_t v49 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v51, "setWithObjects:", v49, v47, v45, v43, v41, v40, v25, v26, v27, v28, v29, v30, v31, objc_opt_class(), 0);
  [v24 setClasses:v32 forSelector:sel_listSharingInvitationsForKeyIdentifier_callback_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v32 forSelector:sel_listReceivedSharingInvitationsWithCallback_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v32 forSelector:sel_cancelInvitationWithIdentifier_reason_callback_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v32 forSelector:sel_requestBindingAttestationDataForKeyWithIdentifier_callback_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v32 forSelector:sel_getPreTrackRequestForKeyWithIdentifier_callback_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v32 forSelector:sel_ppidRequestForInvitationWithIdentifier_fromMailboxIdentifier_completionHandler_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v32 forSelector:sel_setProductPlanIdentifier_forInvitationIdentifier_completion_ argumentIndex:0 ofReply:0];
  [v24 setClasses:v32 forSelector:sel_remoteTerminateKeys_nodeGroupIdentifiers_treeGroupIdentifiers_adminKey_callback_ argumentIndex:0 ofReply:1];
  [v24 setClasses:v32 forSelector:sel_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler_ argumentIndex:2 ofReply:0];
  [v24 setClasses:v32 forSelector:sel_hasUpgradeAvailableForKeyWithIdentifier_versionType_versions_completionHandler_ argumentIndex:0 ofReply:1];
  [v62 setInterface:v24 forSelector:sel_queueManagementSession_callback_ argumentIndex:0 ofReply:1];
  v58 = (void *)MEMORY[0x263EFFA08];
  uint64_t v57 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v58, "setWithObjects:", v57, v55, v33, v34, v35, v36, v37, objc_opt_class(), 0);
  [v62 setClasses:v38 forSelector:sel_registerFriendSideSharingTestCompletion_ argumentIndex:0 ofReply:1];

  return v62;
}

@end