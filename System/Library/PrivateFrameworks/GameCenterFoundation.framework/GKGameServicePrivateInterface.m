@interface GKGameServicePrivateInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKGameServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EB3280;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_getTopGamesWithHandler_ argumentIndex:0 ofReply:1];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_getGamesForPlayer_includeInstalled_handler_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  [v4 setClasses:v12 forSelector:sel_getGameStatsForPlayer_bundleIDs_handler_ argumentIndex:0 ofReply:1];

  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  [v4 setClasses:v15 forSelector:sel_getGamesWithAchievementStatsForPlayer_handler_ argumentIndex:0 ofReply:1];

  v16 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  [v4 setClasses:v18 forSelector:sel_getGameMetadataForBundleIDs_handler_ argumentIndex:0 ofReply:1];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  v21 = objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
  [v4 setClasses:v21 forSelector:sel_getGamesPlayedSummaries_limit_handler_ argumentIndex:0 ofReply:0];

  v22 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v23 = objc_opt_class();
  v24 = objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
  [v4 setClasses:v24 forSelector:sel_getGamesPlayedSummaries_limit_handler_ argumentIndex:1 ofReply:0];

  v25 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v26 = objc_opt_class();
  v27 = objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  [v4 setClasses:v27 forSelector:sel_getGamesPlayedSummaries_limit_handler_ argumentIndex:0 ofReply:1];

  v28 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  [v4 setClasses:v30 forSelector:sel_getGamesPlayedSummaries_limit_withinSecs_handler_ argumentIndex:0 ofReply:0];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  v33 = objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  [v4 setClasses:v33 forSelector:sel_getGamesPlayedSummaries_limit_withinSecs_handler_ argumentIndex:1 ofReply:0];

  v34 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v35 = objc_opt_class();
  v36 = objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  [v4 setClasses:v36 forSelector:sel_getGamesPlayedSummaries_limit_withinSecs_handler_ argumentIndex:2 ofReply:0];

  v37 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v38 = objc_opt_class();
  v39 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
  [v4 setClasses:v39 forSelector:sel_getGamesPlayedSummaries_limit_withinSecs_handler_ argumentIndex:0 ofReply:1];

  v40 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v41 = objc_opt_class();
  v42 = objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
  [v4 setClasses:v42 forSelector:sel_getGamesPlayedMetaData_handler_ argumentIndex:0 ofReply:0];

  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  v47 = objc_msgSend(v43, "setWithObjects:", v44, v45, v46, objc_opt_class(), 0);
  [v4 setClasses:v47 forSelector:sel_getGamesPlayedMetaData_handler_ argumentIndex:0 ofReply:1];

  v48 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  [v4 setClasses:v50 forSelector:sel_submitFriendListAccess_value_handler_ argumentIndex:0 ofReply:0];

  v51 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v52 = objc_opt_class();
  v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  [v4 setClasses:v53 forSelector:sel_submitFriendListAccess_value_handler_ argumentIndex:1 ofReply:0];

  v54 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v55 = objc_opt_class();
  v56 = objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
  [v4 setClasses:v56 forSelector:sel_getFriendListAccessForAllGames_ argumentIndex:0 ofReply:1];

  v57 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v58 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  uint64_t v60 = objc_opt_class();
  v61 = objc_msgSend(v57, "setWithObjects:", v58, v59, v60, objc_opt_class(), 0);
  [v4 setClasses:v61 forSelector:sel_getAppMetadataForBundleIDs_adamIDs_withCompletion_ argumentIndex:0 ofReply:1];

  v62 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v63 = objc_opt_class();
  uint64_t v64 = objc_opt_class();
  v65 = objc_msgSend(v62, "setWithObjects:", v63, v64, objc_opt_class(), 0);
  [v4 setClasses:v65 forSelector:sel_addGameActivityForActivityType_BundleID_userInfo_handler_ argumentIndex:2 ofReply:0];

  v66 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v67 = objc_opt_class();
  objc_msgSend(v66, "setWithObjects:", v67, objc_opt_class(), 0);
  id v68 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v68 forSelector:sel_fetchActivitiesForBundleID_ascending_handler_ argumentIndex:0 ofReply:1];
}

@end