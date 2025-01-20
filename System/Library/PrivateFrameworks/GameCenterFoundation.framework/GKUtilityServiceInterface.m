@interface GKUtilityServiceInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKUtilityServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EAF4A8;
}

+ (void)configureInterface:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  [v5 setClasses:v7 forSelector:sel_getStoreBagValuesForKeys_handler_ argumentIndex:0 ofReply:0];

  v8 = [a1 plistClasses];
  [v5 setClasses:v8 forSelector:sel_getStoreBagValuesForKeys_handler_ argumentIndex:0 ofReply:1];

  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  [v5 setClasses:v13 forSelector:sel_reportMetricsEventWithTopic_shouldFlush_metricsFields_ argumentIndex:0 ofReply:0];

  v14 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, objc_opt_class(), 0);
  [v5 setClasses:v18 forSelector:sel_reportPerformanceMetricsEvent_ argumentIndex:0 ofReply:0];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
  [v5 setClasses:v23 forSelector:sel_reportMultiplayerActivityMetricsEvent_ argumentIndex:0 ofReply:0];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  v28 = objc_msgSend(v24, "setWithObjects:", v25, v26, v27, objc_opt_class(), 0);
  [v5 setClasses:v28 forSelector:sel_reportLoadUrlMetricsEvent_ argumentIndex:0 ofReply:0];

  v29 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v29, "setWithObjects:", v30, v31, v32, objc_opt_class(), 0);
  [v5 setClasses:v33 forSelector:sel_recordMatchStart_minPlayers_maxPlayers_ argumentIndex:0 ofReply:0];

  v34 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v34 forSelector:sel_recordMatchServer_ argumentIndex:0 ofReply:0];

  v35 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v35 forSelector:sel_recordActiveDevices_ argumentIndex:0 ofReply:0];

  v36 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v36 forSelector:sel_recordSharePlayDevices_ argumentIndex:0 ofReply:0];

  v37 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v37 forSelector:sel_completeMatchRecording_matchType_ argumentIndex:0 ofReply:0];

  v38 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v39 = objc_opt_class();
  v40 = objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  [v5 setClasses:v40 forSelector:sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_launchContext_ argumentIndex:0 ofReply:0];

  v41 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v42 = objc_opt_class();
  v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  [v5 setClasses:v43 forSelector:sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_launchContext_ argumentIndex:2 ofReply:0];

  v44 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v44 forSelector:sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_launchContext_ argumentIndex:3 ofReply:0];

  v45 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v46 = objc_opt_class();
  v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
  [v5 setClasses:v47 forSelector:sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_ argumentIndex:0 ofReply:0];

  v48 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  [v5 setClasses:v50 forSelector:sel_openDashboardAsRemoteAlertForGame_hostPID_deeplink_ argumentIndex:2 ofReply:0];

  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setClasses:v51 forSelector:sel_getBSServiceConnectionEndpointForMachName_service_instance_handler_ argumentIndex:0 ofReply:1];
}

@end