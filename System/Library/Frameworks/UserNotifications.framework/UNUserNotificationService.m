@interface UNUserNotificationService
+ (id)clientInterface;
+ (id)serverInterface;
@end

@implementation UNUserNotificationService

void __44__UNUserNotificationService_serverInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0640298];
  v1 = (void *)serverInterface___interface;
  serverInterface___interface = v0;

  v2 = (void *)serverInterface___interface;
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_setObservingUserNotifications_forBundleIdentifier_ argumentIndex:1 ofReply:0];

  v4 = (void *)serverInterface___interface;
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v4 setClasses:v5 forSelector:sel_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:0];

  v6 = (void *)serverInterface___interface;
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v6 setClasses:v7 forSelector:sel_requestAuthorizationWithOptions_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  v8 = (void *)serverInterface___interface;
  v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v8 setClasses:v9 forSelector:sel_requestRemoveAuthorizationForBundleIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  v10 = (void *)serverInterface___interface;
  v11 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v10 setClasses:v11 forSelector:sel_requestRemoveAuthorizationForBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  v12 = (void *)serverInterface___interface;
  v13 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v12 setClasses:v13 forSelector:sel_getNotificationSettingsForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v14 = (void *)serverInterface___interface;
  v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v14 setClasses:v15 forSelector:sel_getNotificationSettingsForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v16 = (void *)serverInterface___interface;
  v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v16 setClasses:v17 forSelector:sel_getNotificationCategoriesForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v18 = (void *)serverInterface___interface;
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v18 setClasses:v21 forSelector:sel_getNotificationCategoriesForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v22 = (void *)serverInterface___interface;
  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
  [v22 setClasses:v25 forSelector:sel_setNotificationCategories_forBundleIdentifier_ argumentIndex:0 ofReply:0];

  v26 = (void *)serverInterface___interface;
  v27 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v26 setClasses:v27 forSelector:sel_setNotificationCategories_forBundleIdentifier_ argumentIndex:1 ofReply:0];

  v28 = (void *)serverInterface___interface;
  v29 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v28 setClasses:v29 forSelector:sel_addNotificationRequest_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v30 = (void *)serverInterface___interface;
  v31 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v30 setClasses:v31 forSelector:sel_addNotificationRequest_forBundleIdentifier_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v32 = (void *)serverInterface___interface;
  v33 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v32 setClasses:v33 forSelector:sel_addNotificationRequest_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v34 = (void *)serverInterface___interface;
  v35 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v34 setClasses:v35 forSelector:sel_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler_ argumentIndex:0 ofReply:0];

  v36 = (void *)serverInterface___interface;
  v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v36 setClasses:v37 forSelector:sel_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler_ argumentIndex:1 ofReply:0];

  v38 = (void *)serverInterface___interface;
  v39 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v38 setClasses:v39 forSelector:sel_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler_ argumentIndex:2 ofReply:0];

  v40 = (void *)serverInterface___interface;
  v41 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v40 setClasses:v41 forSelector:sel_replaceContentForRequestWithIdentifier_bundleIdentifier_replacementContent_completionHandler_ argumentIndex:0 ofReply:1];

  v42 = (void *)serverInterface___interface;
  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  v45 = objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
  [v42 setClasses:v45 forSelector:sel_setNotificationRequests_forBundleIdentifier_ argumentIndex:0 ofReply:0];

  v46 = (void *)serverInterface___interface;
  v47 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v46 setClasses:v47 forSelector:sel_setNotificationRequests_forBundleIdentifier_ argumentIndex:1 ofReply:0];

  v48 = (void *)serverInterface___interface;
  v49 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v50 = objc_opt_class();
  v51 = objc_msgSend(v49, "setWithObjects:", v50, objc_opt_class(), 0);
  [v48 setClasses:v51 forSelector:sel_setNotificationRequests_forBundleIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  v52 = (void *)serverInterface___interface;
  v53 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v52 setClasses:v53 forSelector:sel_setNotificationRequests_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:0];

  v54 = (void *)serverInterface___interface;
  v55 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v56 = objc_opt_class();
  v57 = objc_msgSend(v55, "setWithObjects:", v56, objc_opt_class(), 0);
  [v54 setClasses:v57 forSelector:sel_setNotificationRequests_forBundleIdentifier_completionHandler_ argumentIndex:0 ofReply:1];

  v58 = (void *)serverInterface___interface;
  v59 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v58 setClasses:v59 forSelector:sel_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v60 = (void *)serverInterface___interface;
  v61 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v62 = objc_opt_class();
  v63 = objc_msgSend(v61, "setWithObjects:", v62, objc_opt_class(), 0);
  [v60 setClasses:v63 forSelector:sel_getPendingNotificationRequestsForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v64 = (void *)serverInterface___interface;
  v65 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v66 = objc_opt_class();
  v67 = objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0);
  [v64 setClasses:v67 forSelector:sel_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  v68 = (void *)serverInterface___interface;
  v69 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v68 setClasses:v69 forSelector:sel_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:0];

  v70 = (void *)serverInterface___interface;
  v71 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v70 setClasses:v71 forSelector:sel_removePendingNotificationRequestsWithIdentifiers_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  v72 = (void *)serverInterface___interface;
  v73 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v74 = objc_opt_class();
  v75 = objc_msgSend(v73, "setWithObjects:", v74, objc_opt_class(), 0);
  [v72 setClasses:v75 forSelector:sel_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  v76 = (void *)serverInterface___interface;
  v77 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v76 setClasses:v77 forSelector:sel_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:0];

  v78 = (void *)serverInterface___interface;
  v79 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v78 setClasses:v79 forSelector:sel_removeSimilarNotificationRequests_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  v80 = (void *)serverInterface___interface;
  v81 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v80 setClasses:v81 forSelector:sel_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  v82 = (void *)serverInterface___interface;
  v83 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v82 setClasses:v83 forSelector:sel_removeAllPendingNotificationRequestsForBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  v84 = (void *)serverInterface___interface;
  v85 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v84 setClasses:v85 forSelector:sel_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v86 = (void *)serverInterface___interface;
  v87 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v88 = objc_opt_class();
  v89 = objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0);
  [v86 setClasses:v89 forSelector:sel_getDeliveredNotificationsForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v90 = (void *)serverInterface___interface;
  v91 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v92 = objc_opt_class();
  v93 = objc_msgSend(v91, "setWithObjects:", v92, objc_opt_class(), 0);
  [v90 setClasses:v93 forSelector:sel_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  v94 = (void *)serverInterface___interface;
  v95 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v94 setClasses:v95 forSelector:sel_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:0];

  v96 = (void *)serverInterface___interface;
  v97 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v96 setClasses:v97 forSelector:sel_removeDeliveredNotificationsWithIdentifiers_forBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  v98 = (void *)serverInterface___interface;
  v99 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v98 setClasses:v99 forSelector:sel_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler_ argumentIndex:0 ofReply:0];

  v100 = (void *)serverInterface___interface;
  v101 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v100 setClasses:v101 forSelector:sel_removeAllDeliveredNotificationsForBundleIdentifier_completionHandler_ argumentIndex:1 ofReply:1];

  v102 = (void *)serverInterface___interface;
  v103 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v102 setClasses:v103 forSelector:sel_getBadgeNumberForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v104 = (void *)serverInterface___interface;
  v105 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v104 setClasses:v105 forSelector:sel_getBadgeNumberForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v106 = (void *)serverInterface___interface;
  v107 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v106 setClasses:v107 forSelector:sel_setBadgeNumber_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v108 = (void *)serverInterface___interface;
  v109 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v108 setClasses:v109 forSelector:sel_setBadgeNumber_forBundleIdentifier_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v110 = (void *)serverInterface___interface;
  v111 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v110 setClasses:v111 forSelector:sel_setBadgeNumber_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v112 = (void *)serverInterface___interface;
  v113 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v112 setClasses:v113 forSelector:sel_setBadgeString_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v114 = (void *)serverInterface___interface;
  v115 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v114 setClasses:v115 forSelector:sel_setBadgeString_forBundleIdentifier_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v116 = (void *)serverInterface___interface;
  v117 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v116 setClasses:v117 forSelector:sel_setBadgeString_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v118 = (void *)serverInterface___interface;
  v119 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v120 = objc_opt_class();
  v121 = objc_msgSend(v119, "setWithObjects:", v120, objc_opt_class(), 0);
  [v118 setClasses:v121 forSelector:sel_setNotificationTopics_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v122 = (void *)serverInterface___interface;
  v123 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v122 setClasses:v123 forSelector:sel_setNotificationTopics_forBundleIdentifier_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v124 = (void *)serverInterface___interface;
  v125 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v124 setClasses:v125 forSelector:sel_setNotificationTopics_forBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v126 = (void *)serverInterface___interface;
  v127 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v126 setClasses:v127 forSelector:sel_getNotificationTopicsForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v128 = (void *)serverInterface___interface;
  v129 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v130 = objc_opt_class();
  v131 = objc_msgSend(v129, "setWithObjects:", v130, objc_opt_class(), 0);
  [v128 setClasses:v131 forSelector:sel_getNotificationTopicsForBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v132 = (void *)serverInterface___interface;
  v133 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v132 setClasses:v133 forSelector:sel_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v134 = (void *)serverInterface___interface;
  v135 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v136 = objc_opt_class();
  uint64_t v137 = objc_opt_class();
  objc_msgSend(v135, "setWithObjects:", v136, v137, objc_opt_class(), 0);
  id v138 = (id)objc_claimAutoreleasedReturnValue();
  [v134 setClasses:v138 forSelector:sel_getNotificationSettingsForTopicsWithBundleIdentifier_withCompletionHandler_ argumentIndex:0 ofReply:1];
}

void __44__UNUserNotificationService_clientInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F063FAC8];
  v1 = (void *)clientInterface___interface;
  clientInterface___interface = v0;

  v2 = (void *)clientInterface___interface;
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_didReceiveDeviceToken_forBundleIdentifier_ argumentIndex:0 ofReply:0];

  v4 = (void *)clientInterface___interface;
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v5 forSelector:sel_didReceiveDeviceToken_forBundleIdentifier_ argumentIndex:1 ofReply:0];
}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)clientInterface___interface;

  return v2;
}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1) {
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_52);
  }
  v2 = (void *)serverInterface___interface;

  return v2;
}

@end