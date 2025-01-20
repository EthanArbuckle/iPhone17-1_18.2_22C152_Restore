@interface GKGameStatServicePrivateInterface
+ (id)interfaceProtocol;
+ (void)configureInterface:(id)a3;
@end

@implementation GKGameStatServicePrivateInterface

+ (id)interfaceProtocol
{
  return &unk_1F1EB32E0;
}

+ (void)configureInterface:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  [v4 setClasses:v6 forSelector:sel_loadAchievementsForGameWithProfileFetchOptions_players_includeUnreported_includeHidden_profileFetchOptions_withCompletionHandler_ argumentIndex:0 ofReply:0];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v4 setClasses:v9 forSelector:sel_loadAchievementsForGameWithProfileFetchOptions_players_includeUnreported_includeHidden_profileFetchOptions_withCompletionHandler_ argumentIndex:1 ofReply:0];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  [v4 setClasses:v14 forSelector:sel_loadAchievementsForGameWithProfileFetchOptions_players_includeUnreported_includeHidden_profileFetchOptions_withCompletionHandler_ argumentIndex:0 ofReply:1];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  [v4 setClasses:v17 forSelector:sel_getHypotheticalLeaderboardRanksForScores_forGameDescriptor_handler_ argumentIndex:0 ofReply:0];

  v18 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v19 = objc_opt_class();
  v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  [v4 setClasses:v20 forSelector:sel_getHypotheticalLeaderboardRanksForScores_forGameDescriptor_handler_ argumentIndex:1 ofReply:0];

  v21 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v22 = objc_opt_class();
  v23 = objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  [v4 setClasses:v23 forSelector:sel_getGamesFriendsPlayed_type_withinSecs_matchingBundleIDs_handler_ argumentIndex:0 ofReply:1];

  v24 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
  [v4 setClasses:v26 forSelector:sel_getGamesFriendsPlayed_type_fetchOptions_withinSecs_matchingBundleIDs_handler_ argumentIndex:0 ofReply:1];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  v29 = objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
  [v4 setClasses:v29 forSelector:sel_getReengagementAchievements_ argumentIndex:0 ofReply:1];

  v30 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v31 = objc_opt_class();
  v32 = objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  [v4 setClasses:v32 forSelector:sel_getReengagementAchievements_ argumentIndex:1 ofReply:1];

  v33 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  [v4 setClasses:v35 forSelector:sel_getReengagementAchievement_ argumentIndex:0 ofReply:1];

  v36 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v37 = objc_opt_class();
  v38 = objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  [v4 setClasses:v38 forSelector:sel_getReengagementAchievement_ argumentIndex:1 ofReply:1];

  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v40 = objc_opt_class();
  v41 = objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
  [v4 setClasses:v41 forSelector:sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:0 ofReply:0];

  v42 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v43 = objc_opt_class();
  v44 = objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  [v4 setClasses:v44 forSelector:sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:2 ofReply:0];

  v45 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v46 = objc_opt_class();
  v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
  [v4 setClasses:v47 forSelector:sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:3 ofReply:0];

  v48 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  v50 = objc_msgSend(v48, "setWithObjects:", v49, objc_opt_class(), 0);
  [v4 setClasses:v50 forSelector:sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:7 ofReply:0];

  v51 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v52 = objc_opt_class();
  v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
  [v4 setClasses:v53 forSelector:sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:0 ofReply:1];

  v54 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v55 = objc_opt_class();
  objc_msgSend(v54, "setWithObjects:", v55, objc_opt_class(), 0);
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setClasses:v56 forSelector:sel_getEntriesForLeaderboard_fetchOptions_gameDescriptor_localPlayer_playerScope_timeScope_range_players_handler_ argumentIndex:1 ofReply:1];
}

@end